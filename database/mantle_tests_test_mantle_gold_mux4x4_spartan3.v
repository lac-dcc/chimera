module Mux2 (input [1:0] I, input  S, output  O);
wire  LUT3_inst0_O;
LUT3 #(.INIT(8'hCA)) LUT3_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .O(LUT3_inst0_O));
assign O = LUT3_inst0_O;
endmodule

module Mux4 (input [3:0] I, input [1:0] S, output  O);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire  MUXF5_inst0_O;
Mux2 Mux2_inst0 (.I({I[1],I[0]}), .S(S[0]), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({I[3],I[2]}), .S(S[0]), .O(Mux2_inst1_O));
MUXF5 MUXF5_inst0 (.I0(Mux2_inst0_O), .I1(Mux2_inst1_O), .S(S[1]), .O(MUXF5_inst0_O));
assign O = MUXF5_inst0_O;
endmodule

module Mux4x4 (input [3:0] I0, input [3:0] I1, input [3:0] I2, input [3:0] I3, input [1:0] S, output [3:0] O);
wire  Mux4_inst0_O;
wire  Mux4_inst1_O;
wire  Mux4_inst2_O;
wire  Mux4_inst3_O;
Mux4 Mux4_inst0 (.I({I3[0],I2[0],I1[0],I0[0]}), .S(S), .O(Mux4_inst0_O));
Mux4 Mux4_inst1 (.I({I3[1],I2[1],I1[1],I0[1]}), .S(S), .O(Mux4_inst1_O));
Mux4 Mux4_inst2 (.I({I3[2],I2[2],I1[2],I0[2]}), .S(S), .O(Mux4_inst2_O));
Mux4 Mux4_inst3 (.I({I3[3],I2[3],I1[3],I0[3]}), .S(S), .O(Mux4_inst3_O));
assign O = {Mux4_inst3_O,Mux4_inst2_O,Mux4_inst1_O,Mux4_inst0_O};
endmodule

