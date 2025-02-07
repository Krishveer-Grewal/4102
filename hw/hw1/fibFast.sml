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
