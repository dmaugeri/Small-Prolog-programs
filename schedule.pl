/*Program should choose all days for all the course exams the days are December 11,
12, 13 and December 14. Courses are:

Cognitive Science: csc199, mat120, mat140;
Artificial Intelligence: csc199, csc108, csc148, mat140;
Philosophy of Mind: csc199, mat101, phl250

The constraints are:
a) No Program should have two exams on the same day.
b) phl250 must be scheduled on the first day; mat140 cannot be scheduled on the last day
c) Within a Department, all exams should appear in order, starting with the lower numbered courses. For example,
in Mathematics, the exam for mat120 should not be before mat101, nor be after mat140
*/

day(11). day(12). day(13). day(14).
%dept(C). dept(AI). dept(P).

%each variable represents when the exam for the course will be taken

solve([CSC199,MAT120,MAT140,CSC148,CSC108,MAT101,PHL250]):-
    day(CSC199), day(MAT120), day(MAT140), day(CSC148), day(CSC108), day(MAT101), day(PHL250),
    PHL250 = 11, not MAT140 = 14,
    all_diff([CSC199,MAT120,MAT140]),
    all_diff([CSC199,CSC108,CSC148,MAT140]),
    all_diff([CSC199,MAT101,PHL250]),
    CSC199 >= CSC148, CSC148 >= CSC108,
    MAT140 >= MAT120, MAT120 >= MAT101.

memberOf(N,[N|T]).
memberOf(N,[H|T]):-
    memberOf(N,T).

all_diff([]).
all_diff([H|T]):-
    not memberOf(H,T), all_diff(T).

