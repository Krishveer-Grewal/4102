(* code for thought 01 *)
val pi = Math.pi;

(* define a function area with a parameter r as radius, and return the area of the circle with radius r *)

fun area (r) = pi * r * r;
val a = area 1.23;
print(Real.toString(a)^"\n");

