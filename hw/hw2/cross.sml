(* Implement cross using list pattern matching and reursion*)
(* Cross products returned as list of pairs *)
(* Base Case: no elements left in list a *)
fun cross [] b = []
        | cross (x::xs) b = (* Inductive Case: Compute cross products given lists a and b *)
                let 
                        fun compute_pairs _ [] = [] (* Base Case: empty input list b *)
                                | compute_pairs n (y::ys) = (n, y) :: compute_pairs n ys (* Inductive Case: Compute product of n and x and add to list, recurse on tail *)
                in
                        (compute_pairs x b) @ (cross xs b) (* Compute cross product between head and b, recurse on tail, concatenate results*)
                end;
                




fun printPair (x, y) = print("("^Int.toString(x)^","^Int.toString(y)^") ")

fun printList x = if null x then print("\n")
        else (printPair(hd(x)); printList (tl x));

printList (cross [1, ~1, 2, ~2, 3, ~3] [ 1, 1, 2, 2, 3, 3]);
printList (cross [5, 4, 3, 2, 1] [1, 2, 3, 4, 5]);
printList (cross [~5, ~4, ~3, ~2, ~1] [1, 2, 3, 4, 5]);
printList (cross [5, 5, 4, 4, 3, 3, 2, 2, 1, 1] [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]);

x = "a"