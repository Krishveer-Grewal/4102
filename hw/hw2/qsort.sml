(* Implement qSort *)
fun qSort nil =
        let
                fun length [] = 0       (* Base Case: Empty list has length 0 *)
                        | length (x:xs) = 1 + length(xs) (* Get length of given list *)
                fun pivot _ [] = p
                        | pivot acc (x:xs) =
                                if acc = (length x) then pivot acc [] (* If index reached, return with empty list to force base case *)
                                else if acc < (length x) then pivot (acc + 1) (xs) (* Otherwise increment and recurse on tail *)
                fun qSorthelper _ nil = [] (* Base Case: List is empty and therefore sorted *)
                        | qSorthelper (pivot 0 x) x:xs = 
                                let
                                        fun compare = 
        in



fun printList x = if null x then print("\n")
        else (print(Int.toString((hd x))^" "); printList (tl x));

printList(length [1, 1, 1]);

printList (qSort [1, ~1, 2, ~2, 3, ~3]);
printList (qSort [5, 4, 3, 2, 1]);
printList (qSort [~5, ~4, ~3, ~2, ~1]);
printList (qSort [5, 5, 4, 4, 3, 3, 2, 2, 1, 1]);