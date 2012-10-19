/*Generate and Test*/
/*Solves the problem 
      S A Y
    *   M Y
    --------
    N A M E
+ A M N E
------------
  S T Y L E

where each letter stands for a distinct digit and that leading digits are not zeroes using pure generate and test technique
use the query solve(L) to get each value in the list */

/* distinct digits 0-9 is our domain */
dig(0). dig(1). dig(2). dig(3). dig(4). dig(5). dig(6).
dig(7). dig(8). dig(9).

print_solution :-
    solve([S,A,Y,M,N,E,T,L]),
    write('    '), write(S), write(A), write(Y), nl,
    write('  *  '), write(M), write(Y), nl,
    write('  ------'), nl, 
    write('   '), write(N), write(A), write(M), write(E), nl,
    write('+ '), write(A), write(M), write(N), write(E), write(' '), nl,
    write('--------'),nl,
    write('  '), write(S), write(T), write(Y), write(L), write(E).

solve([S,A,Y,M,N,E,T,L]):-
	/*checking domain*/
	dig(S), dig(A), dig(Y), dig(M), dig(N), dig(E), dig(T), dig(L),
	
	/*making sure leading digits are greater than 0 */
	S > 0, M > 0, N > 0, A > 0,

	/*mod 10 to find the ones column integer division by 10 to find the 10s column*/
	/*multiplying the Y digit*/
	E is (Y*Y) mod 10, C1 is (Y*Y) // 10,
	M is (Y*A+C1) mod 10, C2 is (Y*A+C1) // 10,
	A is (Y*S+C2) mod 10, N is (Y*S+C2) // 10,

	/*multiplying the M digit*/
	E is (M*Y) mod 10, C3 is (M*Y) // 10,
	N is (M*A+C3) mod 10, C4 is (M*A + C3) // 10,
	M is (M*S+C4) mod 10, A is (M*S+C4) // 10,

	/*adding digits NAME and AMNE*/
	L is (M+E) mod 10, C5 is (M+E) // 10,
	Y is (A+N+C5) mod 10, C6 is (A+N+C5) // 10,
	T is (N+M+C6) mod 10, C7 is (N+M+C6) // 10,
	S is (A+C7),
	all_diff([S,A,Y,M,N,E,T,L]).	

/*make sure all the elements in the list are distinct digits*/
all_diff([]).
all_diff([H|T]):-not memberA(H,T), all_diff(T).

/*check if member is within a list*/
memberA(H,[H|T]).
memberA(N,[H|T]):-memberA(N,T).
