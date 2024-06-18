// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module FA (Cin, X, Y, S, Cout);

input Cin, X, Y;
output Cout, S;

assign S = (X ^ Y ^ Cin);
assign Cout = ((X&Y)|(X&Cin)|(Y&Cin));

endmodule