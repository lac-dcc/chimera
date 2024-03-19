module Or1 (input [0:0] I, output  O);
wire  LUT1_inst0_O;
LUT1 #(.INIT(2'h1)) LUT1_inst0 (.I0(I[0]), .O(LUT1_inst0_O));
assign O = LUT1_inst0_O;
endmodule

module Encoder2 (input [1:0] I, output [0:0] O);
wire  Or1_inst0_O;
Or1 Or1_inst0 (.I({I[1]}), .O(Or1_inst0_O));
assign O = {Or1_inst0_O};
endmodule

