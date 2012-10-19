/*Program should choose all days for all the courses the days are December 11,
12, 13 and December 14. Courses are:

Cognitive Science: csc199, mat120, mat140;
Artificial Intelligence: csc199, csc108, mat140;
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

solve([E199,E120,E140,E108,E101,E250,E148]):-


sameDay(E) :- 
