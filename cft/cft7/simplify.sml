datatype  Expr = IntLit of int
                 | Var of string
                 | Plus of Expr * Expr
                 | Times of Expr * Expr
                 | Opposite of Expr;

fun expr_str (IntLit a) = Int.toString(a)
	| expr_str (Var a) = a
	| expr_str (Times(a,b)) = "(" ^ expr_str a ^ "*" ^ expr_str b ^ ")" 
	| expr_str (Plus(a,b)) = "(" ^ expr_str a ^ "+" ^ expr_str b ^ ")" 
	| expr_str (Opposite a) = "(~" ^ expr_str a ^ ")" 


(* Complete the simplify function below *)

(* simplify function simplifies expressions according the following rules *)

(* 1. 0 multipiles anything is 0.
   2. anything multiplies by 1 is itself.
   3. anything added by 0 is itself.
   4. Opposite (Opposite expr) = expr.
*)

fun simplify (IntLit c) = IntLit c

	| simplify (Var c) = Var c

	| simplify (Times(IntLit(0),b)) = IntLit(0)
	| simplify (Times(a,IntLit(0))) = IntLit(0)
	| simplify (Times(IntLit(1),b)) = b
	| simplify (Times(a,IntLit(1))) = a
	| simplify (Times(a,b)) = Times(simplify(a), simplify(b))

	| simplify (Plus(IntLit(0), b)) = b
	| simplify (Plus(a, IntLit(0))) = a
	| simplify (Plus(a, b)) = Plus(simplify(a), simplify(b))

	| simplify (Opposite(Opposite(a))) = simplify(a)
	| simplify (Opposite(a)) = Opposite(simplify(a))

(* The below function complete_simplify will call simplify multiple times if necessary to simplify a expression *)

fun complete_simplify expr = 
	if simplify expr = expr then expr 
	else simplify (simplify expr);

val e0 = Plus(Var("x"),Times(Var("y"),IntLit(0)))
val s0 = expr_str e0
val s0' = expr_str (complete_simplify e0)

val e1 = Plus(Var("x"),Times(IntLit(0), Var("y")))
val s1 = expr_str e1
val e1' = complete_simplify e1
val s1' = expr_str e1'


val e2 = Times(IntLit(1), Plus(IntLit(0),Var("x")))
val s2 = expr_str e2
val e2' = complete_simplify e2
val s2' = expr_str e2'

val e3 = Times(Plus(Var("x"), IntLit(0)), IntLit(1))
val s3 = expr_str e3
val e3' = complete_simplify e3
val s3' = expr_str e3'

val e4 = Opposite(Opposite(Plus(IntLit(2), Var("x"))))
val s4 = expr_str e4
val e4' = complete_simplify e4
val s4' = expr_str e4';

print(s1 ^"\n");
print(s1' ^"\n");
print(s2 ^"\n");
print(s2' ^"\n");
print(s3 ^"\n");
print(s3' ^"\n");
print(s4 ^"\n");
print(s4' ^"\n");
