// This program was cloned from: https://github.com/Mariam-Katamashvili/Veri-Simple
// License: MIT License

module circuit (a, b, c, x); //we describe all the variables
input a, b, c; //inputs are a b and c
output x; //output is x
assign x = ~(a&b)|c; //boolean expression for x = not (a and b) or c
endmodule
