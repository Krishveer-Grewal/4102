(* Sumsq: Compute the sum of the squares of the first n natural numbers, given a natural number n*)

fun sumsq (0: int) = 0
	(* Extension of sum function. Simply replace n with n^2*)
	| sumsq (n: int) = (n * n) + sumsq(n-1); 

print(Int.toString(sumsq 1)^"\n");
print(Int.toString(sumsq 10)^"\n");
print(Int.toString(sumsq 100)^"\n");
print(Int.toString(sumsq 1000)^"\n");
