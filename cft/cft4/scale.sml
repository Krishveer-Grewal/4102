(* In this code for thought problem, we implement a function that scales a list 
The function scale a x will multiple a to every element of list x 
Implement the function using pattern matching without using hd and tl function 
We assume the list x is a list of real numbers *)

(* This might be harder than you thought :) *)
(* The implementation should be no more than two lines *)
(* But there might be some details that could slow you down *)

(* fill in your code below *)



fun print_list x = if null x then print("\n")
	else (print(Real.toString((hd x))^" "); print_list (tl x));

val a = scale 2.0 [1.0, 2.0, 3.0];
print_list a;

val b = scale Math.pi [1.0, 2.0, 3.0];
print_list b;

val c = scale (~ Math.pi) [1.0, 2.0, 3.0];
print_list c;




