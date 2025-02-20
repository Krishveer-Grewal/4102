(*Create a function make_multiplier that takes a number n as an argument and returns a function. The returned function should take another number x and multiply it by n.*)

fun make_multiplier (n) = fn x => (n * x); 

val times_two = make_multiplier (2);

val result1 = times_two(3);
