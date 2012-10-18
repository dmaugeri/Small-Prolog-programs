/*Generate and Test*/
dig(0). dig(1). dig(2). dig(3). dig(4). dig(5). dig(6).
dig(7). dig(8). dig(9).

solve([S,A,Y,M,N,E,T,L]):-
	dig(S), dig(A), dig(Y), dig(M), dig(N), dig(E), dig(T), dig(L),
	
	S > 0, M > 0, N > 0, A > 0,
	E is (Y*Y) mod 10, C1 is (Y*Y) // 10,
	M is (Y*A+C1) mod 10, C2 is (Y*A+C1) // 10,
	A is (Y*S+C2) mod 10, N is (Y*S+C2) // 10,

	L is (M+E) mod 10, C3 is (M+E) // 10,
	Y is (A+N+C3) mod 10, C4 is (A+N+C3) // 10,
	T is (N+M+C4) mod 10, C5 is (N+M+C4) // 10,
	S is (A+C5),
	all_diff([S,A,Y,M,N,E,T,L]).	

	all_diff([]).
	all_diff([H|T]):-not memberA(H,T), all_diff(T).

	memberA(H,[H|T]).
	memberA(N,[H|T]):-memberA(N,T).
