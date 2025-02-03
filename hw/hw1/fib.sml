fun fib (0 : int) = 0
	| fib (1 : int) = 1
	| fib (n : int) = fib(n-1) + fib(n-2); 

print(Int.toString(fib 1)^"\n");
print(Int.toString(fib 10)^"\n");

