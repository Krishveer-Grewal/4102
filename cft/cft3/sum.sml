(* In this code for thought problem, we practice writing efficient recursive functions.

We use a simple example that calculate the sum

1 + 3 + 5 + ... + 2*n -1

This can be done easily if we can use loops. For example, we can use for loop to get it done in C.

Since we do not have loops or iterations in SML, we need to use recursions. *)

(* Step 1:

We first implement a recursive function odd_sum with a single parameter n *)

fun odd_sum n =  if n = 1 then 1 else ((2 * n) - 1) + odd_sum(n - 1);


print(Int.toString(odd_sum(1000))^"\n");

(* Now we think how the recursive function is executed. It should be clear that this function
requires stack to store the values 2*n-1, 2*n-3, ..., 1 before it can sum all these numbers together.

When n is large this will create problems.
*)

(* Step 2:

Next we implement a recursive function cum_odd_sum which takes two parameters n and p, where p is used to hold the cumulated sum.

And cum_odd_sum(n, 0) is equivalent to odd_sum(n).

The purpose of this recursive function is to avoid using stack to hold all the values 2*n-1, 2*n-3, ..., 1. Instead, these values should be accumulated and saved in p.

When cun_odd_sum(n, 0) is executed, we should be summing up 2*n-1, 2*n-3, ..., 1 in this order. By introducing a parameter p here, we can avoid saving all these values in the stack. *)

fun cum_odd_sum(n, p) = if n > 0
                            then cum_odd_sum(n-1, p + ((2 * n) - 1))
                        else
                            p;

print(Int.toString(cum_odd_sum(10000, 0))^"\n");
