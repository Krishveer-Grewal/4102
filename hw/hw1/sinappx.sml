(*Encountering issues regarding type*)

fun sinappx (n, x) = 
    let 
        (* Factorial function, computes factorial for odd numbers *)
        fun factorial n =
            if Real.==(n, 1.0) then 1.0
            else n * factorial(n - 2.0)
        
        (* Power function*)
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