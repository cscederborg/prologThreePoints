/* Full.pl */

point2d(num1,num2):-number(num1), number(num2).

vertical(point2d(X,Y), point2d(A,B)):- X=:=A.
horizontal(point2d(X,Y), point2d(A,B)):- Y=:=B.

vertical3P(point2d(X,Y),point2d(A,B),point2d(C,D)) :- X =:= A, A =:= C.

horizontal3P(point2d(X,Y),point2d(A,B),point2d(C,D)) :- Y =:= B, B =:= C.

line(point2d(X,Y),point2d(A,B),point2d(C,D)) :- vertical3P(point2d(X,Y),point2d(A,B),point2d(C,D));
horizontal3P(point2d(X,Y),point2d(A,B),point2d(C,D));
(B-Y)/(A-X) =:= (D-B)/(C-A).

triangle(point2d(X,Y),point2d(A,B),point2d(C,D)) :- not(line(point2d(X,Y),point2d(A,B),point2d(C,D))).

isosceles(point2d(X,Y),point2d(A,B),point2d(C,D)) :- triangle(point2d(X,Y),point2d(A,B),point2d(C,D)), sqrt((X-A)**2 + (Y-B)**2) =:= sqrt((A-C)**2 + (B-D)**2),  sqrt((X-A)**2 + (Y-B)**2) =\= sqrt((X-C)**2 + (Y-D)**2);
triangle(point2d(X,Y),point2d(A,B),point2d(C,D)), sqrt((X-A)**2 + (Y-B)**2) =:= sqrt((X-C)**2 + (Y-D)**2),  sqrt((X-A)**2 + (Y-B)**2) =\= sqrt((A-C)**2 + (B-D)**2);
triangle(point2d(X,Y),point2d(A,B),point2d(C,D)), sqrt((X-C)**2 + (Y-D)**2) =:= sqrt((A-C)**2 + (B-D)**2),  sqrt((X-C)**2 + (Y-D)**2) =\= sqrt((X-A)**2 + (B-D)**2).

equilateral(point2d(X,Y),point2d(A,B),point2d(C,D)) :- triangle(point2d(X,Y),point2d(A,B),point2d(C,D)),
sqrt((X-A)**2 + (Y-B)**2) =:= sqrt((A-C)**2 + (B-D)**2),  sqrt((X-A)**2 + (Y-B)**2) =:= sqrt((X-C)**2 + (Y-D)**2),
sqrt((C-A)**2 + (D-B)**2) =:= sqrt((X-C)**2 + (Y-D)**2).

scalene(point2d(X,Y),point2d(A,B),point2d(C,D)) :- triangle(point2d(X,Y),point2d(A,B),point2d(C,D)),
sqrt((X-A)**2 + (Y-B)**2) =\= sqrt((A-C)**2 + (B-D)**2),  sqrt((X-A)**2 + (Y-B)**2) =\= sqrt((X-C)**2 + (Y-D)**2),
sqrt((C-A)**2 + (D-B)**2) =\= sqrt((X-C)**2 + (Y-D)**2).

/* Dot product =:= 0 to find if there is a right angle */
right(point2d(X,Y),point2d(A,B),point2d(C,D)) :- triangle(point2d(X,Y),point2d(A,B),point2d(C,D)), ((A-X)*(C-A)+(B-Y)*(D-B)) =:= 0;
triangle(point2d(X,Y),point2d(A,B),point2d(C,D)), ((A-X)*(C-X)+(B-Y)*(D-Y)) =:= 0;
triangle(point2d(X,Y),point2d(A,B),point2d(C,D)), ((C-A)*(C-X)+(D-Y)*(D-B)) =:= 0.

/* If not obtuse or right, then the triangle is acute */
acute(point2d(X,Y),point2d(A,B),point2d(C,D)) :- triangle(point2d(X,Y),point2d(A,B),point2d(C,D)),
not(right(point2d(X,Y),point2d(A,B),point2d(C,D))),
not(obtuse(point2d(X,Y),point2d(A,B),point2d(C,D))).

/* Dot product @< 0 to find if there is a right angle */
obtuse(point2d(X,Y),point2d(A,B),point2d(C,D)) :- triangle(point2d(X,Y),point2d(A,B),point2d(C,D)), ((A-X)*(C-A)+(B-Y)*(D-B)) @< 0;
triangle(point2d(X,Y),point2d(A,B),point2d(C,D)), ((A-X)*(C-X)+(B-Y)*(D-Y)) @< 0;
triangle(point2d(X,Y),point2d(A,B),point2d(C,D)), ((C-A)*(C-X)+(D-Y)*(D-B)) @< 0.


query(line(point2d(0,0), point2d(2,4), point2d(5,0))).
query(line(point2d(0,0), point2d(3,2), point2d(6,4))).
query(line(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).


query(triangle(point2d(0,0), point2d(2,4), point2d(5,0))).
query(triangle(point2d(0,0), point2d(3,2), point2d(6,4))).
query(triangle(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).


query(equilateral(point2d(0,0), point2d(2,4), point2d(5,0))).
query(isosceles(point2d(0,0), point2d(2,4), point2d(5,0))).
query(right(point2d(0,0), point2d(2,4), point2d(5,0))).
query(scalene(point2d(0,0), point2d(2,4), point2d(5,0))).
query(acute(point2d(0,0), point2d(2,4), point2d(5,0))).
query(obtuse(point2d(0,0), point2d(2,4), point2d(5,0))).

query(equilateral(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).
query(isosceles(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).
query(right(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).
query(scalene(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).
query(acute(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).
query(obtuse(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).

query(line(point2d(1,2), point2d(2,4), point2d(3,6))).
query(line(point2d(1,2), point2d(2,4), point2d(3,8))).
query(line(point2d(1,2), point2d(2,4), point2d(10,20))).

query(vertical(point2d(1,2), point2d(2,4))).
query(vertical(point2d(1,2), point2d(1,4))).
query(vertical(point2d(1,2), point2d(3,2))).

query(horizontal(point2d(1,2), point2d(2,4))).
query(horizontal(point2d(1,2), point2d(1,4))).
query(horizontal(point2d(1,2), point2d(3,2))).

query(triangle(point2d(1,2), point2d(2,4), point2d(3,6))).
query(triangle(point2d(1,2), point2d(2,4), point2d(3,8))).
query(triangle(point2d(1,2), point2d(2,4), point2d(10,20))).

query(triangle(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).
query(equilateral(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).
query(isosceles(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).
query(right(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).
query(scalene(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).
query(acute(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).
query(obtuse(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).

query(triangle(point2d(2,2), point2d(5,2), point2d(3.5,-2))).
query(equilateral(point2d(2,2), point2d(5,2), point2d(3.5,-2))).
query(isosceles(point2d(2,2), point2d(5,2), point2d(3.5,-2))).
query(right(point2d(2,2), point2d(5,2), point2d(3.5,-2))).
query(scalene(point2d(2,2), point2d(5,2), point2d(3.5,-2))).
query(acute(point2d(2,2), point2d(5,2), point2d(3.5,-2))).
query(obtuse(point2d(2,2), point2d(5,2), point2d(3.5,-2))).

query(triangle(point2d(0,0), point2d(-2,2), point2d(4,4))).
query(equilateral(point2d(0,0), point2d(-2,2), point2d(4,4))).
query(isosceles(point2d(0,0), point2d(-2,2), point2d(4,4))).
query(right(point2d(0,0), point2d(-2,2), point2d(4,4))).
query(scalene(point2d(0,0), point2d(-2,2), point2d(4,4))).
query(acute(point2d(0,0), point2d(-2,2), point2d(4,4))).
query(obtuse(point2d(0,0), point2d(-2,2), point2d(4,4))).

query(triangle(point2d(1,1), point2d(3,1), point2d(4,3))).
query(equilateral(point2d(1,1), point2d(3,1), point2d(4,3))).
query(isosceles(point2d(1,1), point2d(3,1), point2d(4,3))).
query(right(point2d(1,1), point2d(3,1), point2d(4,3))).
query(scalene(point2d(1,1), point2d(3,1), point2d(4,3))).
query(acute(point2d(1,1), point2d(3,1), point2d(4,3))).
query(obtuse(point2d(1,1), point2d(3,1), point2d(4,3))).

query(triangle(point2d(3,1), point2d(9,1), point2d(6,4))).
query(equilateral(point2d(3,1), point2d(9,1), point2d(6,4))).
query(isosceles(point2d(3,1), point2d(9,1), point2d(6,4))).
query(right(point2d(3,1), point2d(9,1), point2d(6,4))).
query(scalene(point2d(3,1), point2d(9,1), point2d(6,4))).
query(acute(point2d(3,1), point2d(9,1), point2d(6,4))).
query(obtuse(point2d(3,1), point2d(9,1), point2d(6,4))).

writeln(T) :- write(T), nl.

main:- forall(query(Q), Q -> (writeln('yes')) ; (writeln('no'))),
	halt.
