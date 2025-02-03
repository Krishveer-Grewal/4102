(* In this code for thought problem, we pratice the followinbg topics:
	- tuples
	- defining a type
	- conditional expressions 
	- boolean operations

We define a function named comes_before. The functions takes two parameters t1, and t2. Both t1 and t2 are of type time as defined below.

The type time is in the form (hour, minute, "AM" or "PM"). The function returns true if t1 comes before t2. Otherwise, it returns false.
*)

type time = int * int * string;

fun comes_before (t1: time, t2: time) = 
	(* fill in your code below *)

val t1 = (1, 1, "PM");
val t2 = (2, 2, "AM");
val t3 = (3, 3, "AM");
val r1 = comes_before(t1, t2);
val r2 = comes_before(t2, t1);
val r3 = comes_before(t2, t3);
val r4 = comes_before(t3, t2);
print(Bool.toString(r1)^"\n");
print(Bool.toString(r2)^"\n");
print(Bool.toString(r3)^"\n");
print(Bool.toString(r4)^"\n");