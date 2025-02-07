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
