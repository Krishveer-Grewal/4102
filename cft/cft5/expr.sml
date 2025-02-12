(* In this code for thought problem, we define a datatype Expr 
and write code to conver an expression to a string so that we can print it out easily.
*)

datatype  Expr = IntLit of int
                 | Var of string
                 | Plus of Expr * Expr
                 | Times of Expr * Expr
                 | Opposite of Expr;

(* Note the function Int.toString(i) converts an integer i to a string 
It is needed to implement the function expr_str.

This function converts an expression to a string.
We need to make sure the string of the expression is not ambiguous.
We will not use the fact that * Times have higher priority than Plus.
So, we know we need to use ( ) when necessary.
Use "+" for Plus, "*" for Times, "~" for Opposite.
Hint: pay attention to negative values and Opposite.
Check out the expected outputs from the test cases.
*)

(* Simply convert indivdual components of expression into strings recursively and concatenate*)
fun expr_str (IntLit a) = Int.toString(a)
	| expr_str (Var a) = a
	| expr_str (Times(a,b)) = "(" ^ expr_str(a) ^ "*" ^ expr_str(b) ^ ")"
	| expr_str (Plus(a,b)) = "(" ^ expr_str(a) ^ "+" ^ expr_str(b) ^ ")"
	| expr_str (Opposite a) = "(" ^ "~" ^ expr_str(a) ^ ")";


val e1 = Plus(Var("x"),Times(Var("y"),IntLit(2)))
val e2 = Times(IntLit(3), Var("x"))
val e3 = Plus(Var("x"), Times(Var("y"), IntLit(~4)))
val e4 = Plus(Times(Var("x"), IntLit(5)), IntLit(~6))
val e5 = Opposite (Times(Var("x"), Times(IntLit(~10), Plus(Var("x"),Times(Var("x"),IntLit(5))))))

val s1 = expr_str e1;
val s2 = expr_str e2;
val s3 = expr_str e3;
val s4 = expr_str e4;
val s5 = expr_str e5;

print(s1^"\n");
print(s2^"\n");
print(s3^"\n");
print(s4^"\n");
print(s5^"\n");





