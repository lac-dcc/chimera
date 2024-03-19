module Mux2 (input [1:0] I, input  S, output  O);
wire  LUT3_inst0_O;
LUT3 #(.INIT(8'hCA)) LUT3_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .O(LUT3_inst0_O));
assign O = LUT3_inst0_O;
endmodule

module Mux2x10 (input [9:0] I0, input [9:0] I1, input  S, output [9:0] O);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire  Mux2_inst2_O;
wire  Mux2_inst3_O;
wire  Mux2_inst4_O;
wire  Mux2_inst5_O;
wire  Mux2_inst6_O;
wire  Mux2_inst7_O;
wire  Mux2_inst8_O;
wire  Mux2_inst9_O;
Mux2 Mux2_inst0 (.I({I1[0],I0[0]}), .S(S), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({I1[1],I0[1]}), .S(S), .O(Mux2_inst1_O));
Mux2 Mux2_inst2 (.I({I1[2],I0[2]}), .S(S), .O(Mux2_inst2_O));
Mux2 Mux2_inst3 (.I({I1[3],I0[3]}), .S(S), .O(Mux2_inst3_O));
Mux2 Mux2_inst4 (.I({I1[4],I0[4]}), .S(S), .O(Mux2_inst4_O));
Mux2 Mux2_inst5 (.I({I1[5],I0[5]}), .S(S), .O(Mux2_inst5_O));
Mux2 Mux2_inst6 (.I({I1[6],I0[6]}), .S(S), .O(Mux2_inst6_O));
Mux2 Mux2_inst7 (.I({I1[7],I0[7]}), .S(S), .O(Mux2_inst7_O));
Mux2 Mux2_inst8 (.I({I1[8],I0[8]}), .S(S), .O(Mux2_inst8_O));
Mux2 Mux2_inst9 (.I({I1[9],I0[9]}), .S(S), .O(Mux2_inst9_O));
assign O = {Mux2_inst9_O,Mux2_inst8_O,Mux2_inst7_O,Mux2_inst6_O,Mux2_inst5_O,Mux2_inst4_O,Mux2_inst3_O,Mux2_inst2_O,Mux2_inst1_O,Mux2_inst0_O};
endmodule

module Test (input [9:0] I0, input [9:0] I1, input  S, output [9:0] O);
wire [9:0] my_mux_O;
Mux2x10 my_mux (.I0(I0), .I1(I1), .S(S), .O(my_mux_O));
assign O = my_mux_O;
endmodule

