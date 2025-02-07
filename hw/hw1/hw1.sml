(* Sum: Compute the first n naturals given an integer n*)

fun sum (0: int) = 0
(*Recursively add the first n natural numbers*)
	| sum (n: int) = n + sum(n-1);

print(Int.toString(sum 1)^"\n");
print(Int.toString(sum 10)^"\n");
print(Int.toString(sum 100)^"\n");
print(Int.toString(sum 1000)^"\n");

(* Sumsq: Compute the sum of the squares of the first n natural numbers, given a natural number n*)

fun sumsq (0: int) = 0
	(* Extension of sum function. Simply replace n with n^2*)
	| sumsq (n: int) = (n * n) + sumsq(n-1); 

print(Int.toString(sumsq 1)^"\n");
print(Int.toString(sumsq 10)^"\n");
print(Int.toString(sumsq 100)^"\n");
print(Int.toString(sumsq 1000)^"\n");

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

(*For more complex functions, more conventional boolean notation is more intuitive*)

fun fib n =
    if n = 0 then 0
    else if n = 1 then 1
    else fib(n-1) + fib(n-2);

print(Int.toString(fib 1)^"\n");
print(Int.toString(fib 10)^"\n");

(* Implement the function fibFast *)

fun fibFast n =
    (* Define local helper function to track local variables during recursion*)
    let 
        fun fibhelper (n, b1, b2) = 
            if n = 0 then b1
            else fibhelper (n-1, b2, b1+b2)
    in 
        fibhelper(n, 0, 1)
    end;

print(Int.toString(fibFast 1)^"\n");
print(Int.toString(fibFast 10)^"\n");
print(Int.toString(fibFast 20)^"\n");
print(Int.toString(fibFast 30)^"\n");

(* Implement the function sinappx *)
fun sinappx (n, x) = 
    let 
        (* Factorial function, computes factorial for odd numbers *)
        fun factorial n =
            if Real.==(n, 1.0) then 1.0
            else n * factorial(n - 2.0)
        
        (* Power function, computes x^n *)
        fun n_power (n, x) = 
            if Real.==(n, 0.0) then 1.0
            else x * n_power(n - 1.0, x)
        
        (* Helper function to compute the approximation of sin(x) *)
        fun helper(n, x, sum, sign, term, power, fact) =
            if n >= 0.0 then 
                let
                    val nextTerm = sign * (term / fact)
                    val nextPower = power * x * x
                    val nextFact = fact * (power + 1.0) * (power + 2.0)
                in
                    helper(n - 2.0, x, sum + nextTerm, sign * ~1.0, nextPower, power + 2.0, nextFact)
                end
            else
                sum
    in 
        helper(n, x, 0.0, 1.0, x, 1.0, 1.0)
    end;


print(Real.toString(sinappx (1000.0, 0.0)) ^ "\n");
print(Real.toString(sinappx (1000.0, Math.pi / 2.0)) ^ "\n");
print(Real.toString(sinappx (1000.0, ~Math.pi / 2.0)) ^ "\n");


fun integrate f a b n =
    let
        val step = (b - a) / real n  (* Step size *)
        fun sum i a =
            if i >= n then a
            else
                let
                    val x1 = a + real i * step
                    val x2 = x1 + step
                    val area = (f x1 + f x2) * step / 2.0
                in
                    sum (i + 1) (a + area)
                end
    in
        sum 0 0.0
    end

val _ = print(Real.toString(integrate Math.sin (~Math.pi/2.0) 0.0 10000) ^ "\n")
val _ = print(Real.toString(integrate Math.sin (~Math.pi) 0.0 10000) ^ "\n")
val _ = print(Real.toString(integrate Math.cos (~Math.pi/2.0) 0.0 10000) ^ "\n")


(*Converted list length to real for compatibility with print statements*)
(*Iterate through list with foldl List function*) 
(*Used lambda function rather than helper for inline, concise language*)
fun variance s =
    let
        val n = Real.fromInt (List.length s)

        val squares = List.foldl (fn (x, acc) => acc + x*x) 0.0 s
        val elements = List.foldl (fn (x, acc) => acc + x) 0.0 s
    in
        (squares / n) - ((elements / n) * 
        (elements / n)) 
    end;


print(Real.toString(variance [1.0, 2.0, 3.0, 4.0, 5.0]) ^ "\n");
print(Real.toString(variance [~1.0, ~2.0, ~3.0, ~4.0, ~5.0]) ^ "\n");
print(Real.toString(variance [~1.0, 1.0, ~1.0, 1.0, ~1.0, 1.0]) ^ "\n");
print(Real.toString(variance [~2.0, 2.0, ~2.0, 2.0, ~2.0, 2.0]) ^ "\n");
