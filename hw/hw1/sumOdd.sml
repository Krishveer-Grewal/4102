(* Compute the sum of the first n odd naturals given a natural number n *)
fun sumOdd (0) = 0
  | sumOdd (n) = 
      (* Calculate the nth odd number and add it to the sum *)
      (2 * n - 1) + sumOdd(n-1);

print(Int.toString(sumOdd 1)^"\n");
print(Int.toString(sumOdd 10)^"\n");
print(Int.toString(sumOdd 100)^"\n");
print(Int.toString(sumOdd 1000)^"\n");
