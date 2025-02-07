(*Integrate using trapezoidal rule*)

fun integrate f a b n =
    let
        val step = (b - a) / real n  (* Step size *)
        fun sum i acc =
            if i > n then acc
            else
                let  
                    val x1 = a + real (i - 1) * step
                    val x2 = a + real i * step
                    val area = (f x1 + f x2) * step / 2.0
                in
                    sum (i + 1) (acc + area)
                end
    in
        sum 1 0.0
    end


val _ = print(Real.toString(integrate Math.sin (~Math.pi/2.0) 0.0 10000) ^ "\n")
val _ = print(Real.toString(integrate Math.sin (~Math.pi) 0.0 10000) ^ "\n")
val _ = print(Real.toString(integrate Math.cos (~Math.pi/2.0) 0.0 10000) ^ "\n")