(* In this code for thought problem, we practice using higher order functions *)
(* Specifically, we define a higher order function filter *)
(* and use the function filter to obtain all the prime numbers in a list *)
(* All these prime numbers are saved to a list *)

(* The following two functions are used to fill a list with integers *)
(* These numbers are from the famous 3x + 1 problem *)

fun threePlusOne n = if n mod 2 = 0 then n div 2 else 3*n + 1;

fun fillList f n = if n < 0 then [] else 
	let 
		val v = f n
	in
		if v<>1 then v::(fillList f v) else [1]
	end

(* Implement a function named prime to test whether a integer n is a prime *)
(* You can write a help function to acheive this goal *)


fun prime 1 = false
	| prime 2 =  true
	| prime n = 
		let 
			fun primeHelper (n, 1) = true (* Base Case: No more possible factors of n *)
				| primeHelper (n, factor) = (* Inductive Case: Check whether current iteration is a factor of n with mod function*)
					if n mod factor = 0 then false (* Not prime if mod outputs 0*)
					else primeHelper(n, factor-1) (* Continue *)
		in
			primeHelper(n, n-1) (* Check next integer in decreasing order *)
		end;

(* The implementation of filter is given below *)
fun filter p nil = nil
   |filter p (a::b) = if p a
				 then a::(filter p b)
				 else filter p b

val l = fillList threePlusOne 100;
val l1 = filter prime l;

fun print_list x = if null x then print("\n")
        else (print(Int.toString((hd x))^" "); print_list (tl x));

print_list(l);
print_list(l1);
