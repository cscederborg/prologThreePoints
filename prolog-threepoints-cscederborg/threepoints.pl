/* Add your code here */

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
not(obtuse(point2d(X,Y),point2d(A,B),point2d(C,D))),
not(right(point2d(X,Y),point2d(A,B),point2d(C,D))).

/* Dot product @< 0 to find if there is a right angle */
obtuse(point2d(X,Y),point2d(A,B),point2d(C,D)) :- triangle(point2d(X,Y),point2d(A,B),point2d(C,D)), ((A-X)*(C-A)+(B-Y)*(D-B)) @< 0;
triangle(point2d(X,Y),point2d(A,B),point2d(C,D)), ((A-X)*(C-X)+(B-Y)*(D-Y)) @< 0;
triangle(point2d(X,Y),point2d(A,B),point2d(C,D)), ((C-A)*(C-X)+(D-Y)*(D-B)) @< 0.
