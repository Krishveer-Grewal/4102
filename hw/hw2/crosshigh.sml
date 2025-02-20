(* Compute the cross product using only higher-order functions *)
(* List operator @ allowed *)

(* Higher order function must take a function as argument (or return a function) *)
(* Note: map implicitly returns [] upon empty list *)

fun crossHigh a b =
        let
                fun pair x = map (fn y => (x, y)) b (* Map pairs for head of a with each element of b *)
                fun cross_helper [] = [] (* Base Case *)
                        | cross_helper (x::xs) = pair x @ cross_helper xs (* Recursively map pairs and concatenate results *)
        in      
                cross_helper a (* Start the recursion with list a *)
        end;


fun printPair (x, y) = print("("^Int.toString(x)^","^Int.toString(y)^") ")

fun printList x = if null x then print("\n")
        else (printPair(hd(x)); printList (tl x));

printList (crossHigh [1, ~1, 2, ~2, 3, ~3] [ 1, 1, 2, 2, 3, 3]);
printList (crossHigh [5, 4, 3, 2, 1] [1, 2, 3, 4, 5]);
printList (crossHigh [~5, ~4, ~3, ~2, ~1] [1, 2, 3, 4, 5]);
printList (crossHigh [5, 5, 4, 4, 3, 3, 2, 2, 1, 1] [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]);
