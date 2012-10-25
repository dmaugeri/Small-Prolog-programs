/* Consider the following constraint satisfaction problem. Alice, Bob, Cindy,
* and Dan were seated at a table in a restaurant. The men sat across from each
* other, as did the women. They each ordered a different dessert (not
* respectively: cake, pie, ice-cream, fruit-cup) with a different beverage
* (again, in no particular order: milk, juice, tea, water). In addition,
* 1) Cindy never dinks milk.
* 2) The cake came with juice.
* 3) Dan sat beside the person who ordered pie.
* 4) The person with the ice cream sat across from the person with tea.
* 5) Bob drank water.
* 6) Alice did not eat pie.
*/

person(a). person(b). person(c). person(d).
male(b). male(d). female(a). female(c).

across(P,P1):- male(P), male(P1), not P=P1.
across(P,P1):- female(P), female(P1).
beside(P,P1):- male(P), female(P1).
beside(P,P1):- male(P1), female(P).

solve([C,P,I,F,M,J,T,W]):-
    person(M), not M=c,
    person(C), person(J), C=J,
    person(P), beside(d,P), not P=a,
    person(I), person(T), across(I,T),
    person(W), W=b,
    person(F),
    all_diff([C,P,I,F]),
    all_diff([M,J,T,W]).

memberA(H,[H|T]).
memberA(H,[A|T]):-
    memberA(H,T).

all_diff([]).
all_diff([H|T]):-
    not memberA(H,T), all_diff(T).
