(* Compute the cross product with a higher-order and no use of op@ *)	
(* Use foldr to iterate over list starting from the right, returning pairs in-order after traversing list. *)	      
fun crossFold a b =
        let
                fun pairs (x, y) = foldr (fn (x_i, acc) => (map (fn y_j => (x_i, y_j)) y) :: acc) [] x (* Iterate over list x, mapping pair (x_i, y_j) for each element in y. Accumulates into a list in acc. *)
        in                    
                pairs (a, b)
        end; 


fun printPair (x, y) = print("("^Int.toString(x)^","^Int.toString(y)^") ")

fun printList x = if null x then print("\n")
        else (printPair(hd(x)); printList (tl x));

val result = crossFold [1, ~1, 2, ~2, 3, ~3] [1, 1, 2, 2, 3, 3];
printList result;  (* Now you can check the output of crossFold directly *)


printList (crossFold [1, ~1, 2, ~2, 3, ~3] [ 1, 1, 2, 2, 3, 3]);
printList (crossFold [5, 4, 3, 2, 1] [1, 2, 3, 4, 5]);
printList (crossFold [~5, ~4, ~3, ~2, ~1] [1, 2, 3, 4, 5]);
printList (crossFold [5, 5, 4, 4, 3, 3, 2, 2, 1, 1] [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]);
