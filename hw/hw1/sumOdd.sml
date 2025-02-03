(* Compute the sum of the first n odd naturals given a natural number n*)

fun sumOdd (0: int) = 0
	| sumOdd (n: int) = 
		(* Skip even numbers based on mod result*)
		if n mod 2 = 0 then sumOdd(n-1)
		else n + sumOdd(n-1);

print(Int.toString(sumOdd 1)^"\n");
print(Int.toString(sumOdd 10)^"\n");
print(Int.toString(sumOdd 100)^"\n");
print(Int.toString(sumOdd 1000)^"\n");
