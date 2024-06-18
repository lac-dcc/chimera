// This program was cloned from: https://github.com/Mariam-Katamashvili/Veri-Simple
// License: MIT License

module fulladder (a, b, c, c1, s); //we describe all the variables that we are going to use to built a full adder
	input a, b, c; //we need 3 inputs for full adder: a, b and carry
	output c1, s; //the outputs are carry1 and sum
	assign s = a ^ b ^ c; //boolean expression for sum (as written in the (b) part of the assignment). ^ denotes XOR
	assign c1 = (a&b) | (b&c) | (a&c); // "boolean expression for carry out, & denotes and, | denotes or"
endmodule
