module Adder32 (A, B, Ci, S, Co);

input[31:0] A;
input[31:0] B;
input Ci;
output[31:0] S;
output Co;
wire[32:0] Sum33;
assign Sum33 = A + B + Ci ;
assign S = Sum33[31:0] ;
assign Co = Sum33[32] ;
endmodule
