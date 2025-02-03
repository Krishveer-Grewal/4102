(* Sum: Compute the first n naturals given an integer n*)

fun sum (0: int) = 0
(*Recursively add the first n natural numbers*)
	| sum (n: int) = n + sum(n-1);

print(Int.toString(sum 1)^"\n");
print(Int.toString(sum 10)^"\n");
print(Int.toString(sum 100)^"\n");
print(Int.toString(sum 1000)^"\n");





