module Mux2 (input [1:0] I, input  S, output  O);
wire  LUT3_inst0_O;
LUT3 #(.INIT(8'hCA)) LUT3_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .O(LUT3_inst0_O));
assign O = LUT3_inst0_O;
endmodule

module LSR8_1 (input [7:0] I, input  S, output [7:0] O);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire  Mux2_inst2_O;
wire  Mux2_inst3_O;
wire  Mux2_inst4_O;
wire  Mux2_inst5_O;
wire  Mux2_inst6_O;
wire  Mux2_inst7_O;
Mux2 Mux2_inst0 (.I({I[1],I[0]}), .S(S), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({I[2],I[1]}), .S(S), .O(Mux2_inst1_O));
Mux2 Mux2_inst2 (.I({I[3],I[2]}), .S(S), .O(Mux2_inst2_O));
Mux2 Mux2_inst3 (.I({I[4],I[3]}), .S(S), .O(Mux2_inst3_O));
Mux2 Mux2_inst4 (.I({I[5],I[4]}), .S(S), .O(Mux2_inst4_O));
Mux2 Mux2_inst5 (.I({I[6],I[5]}), .S(S), .O(Mux2_inst5_O));
Mux2 Mux2_inst6 (.I({I[7],I[6]}), .S(S), .O(Mux2_inst6_O));
Mux2 Mux2_inst7 (.I({1'b0,I[7]}), .S(S), .O(Mux2_inst7_O));
assign O = {Mux2_inst7_O,Mux2_inst6_O,Mux2_inst5_O,Mux2_inst4_O,Mux2_inst3_O,Mux2_inst2_O,Mux2_inst1_O,Mux2_inst0_O};
endmodule

module LSR8_2 (input [7:0] I, input  S, output [7:0] O);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire  Mux2_inst2_O;
wire  Mux2_inst3_O;
wire  Mux2_inst4_O;
wire  Mux2_inst5_O;
wire  Mux2_inst6_O;
wire  Mux2_inst7_O;
Mux2 Mux2_inst0 (.I({I[2],I[0]}), .S(S), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({I[3],I[1]}), .S(S), .O(Mux2_inst1_O));
Mux2 Mux2_inst2 (.I({I[4],I[2]}), .S(S), .O(Mux2_inst2_O));
Mux2 Mux2_inst3 (.I({I[5],I[3]}), .S(S), .O(Mux2_inst3_O));
Mux2 Mux2_inst4 (.I({I[6],I[4]}), .S(S), .O(Mux2_inst4_O));
Mux2 Mux2_inst5 (.I({I[7],I[5]}), .S(S), .O(Mux2_inst5_O));
Mux2 Mux2_inst6 (.I({1'b0,I[6]}), .S(S), .O(Mux2_inst6_O));
Mux2 Mux2_inst7 (.I({1'b0,I[7]}), .S(S), .O(Mux2_inst7_O));
assign O = {Mux2_inst7_O,Mux2_inst6_O,Mux2_inst5_O,Mux2_inst4_O,Mux2_inst3_O,Mux2_inst2_O,Mux2_inst1_O,Mux2_inst0_O};
endmodule

module LSR8_4 (input [7:0] I, input  S, output [7:0] O);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire  Mux2_inst2_O;
wire  Mux2_inst3_O;
wire  Mux2_inst4_O;
wire  Mux2_inst5_O;
wire  Mux2_inst6_O;
wire  Mux2_inst7_O;
Mux2 Mux2_inst0 (.I({I[4],I[0]}), .S(S), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({I[5],I[1]}), .S(S), .O(Mux2_inst1_O));
Mux2 Mux2_inst2 (.I({I[6],I[2]}), .S(S), .O(Mux2_inst2_O));
Mux2 Mux2_inst3 (.I({I[7],I[3]}), .S(S), .O(Mux2_inst3_O));
Mux2 Mux2_inst4 (.I({1'b0,I[4]}), .S(S), .O(Mux2_inst4_O));
Mux2 Mux2_inst5 (.I({1'b0,I[5]}), .S(S), .O(Mux2_inst5_O));
Mux2 Mux2_inst6 (.I({1'b0,I[6]}), .S(S), .O(Mux2_inst6_O));
Mux2 Mux2_inst7 (.I({1'b0,I[7]}), .S(S), .O(Mux2_inst7_O));
assign O = {Mux2_inst7_O,Mux2_inst6_O,Mux2_inst5_O,Mux2_inst4_O,Mux2_inst3_O,Mux2_inst2_O,Mux2_inst1_O,Mux2_inst0_O};
endmodule

module LSR8 (input [7:0] I, input [2:0] S, output [7:0] O);
wire [7:0] LSR8_1_inst0_O;
wire [7:0] LSR8_2_inst0_O;
wire [7:0] LSR8_4_inst0_O;
LSR8_1 LSR8_1_inst0 (.I(I), .S(S[0]), .O(LSR8_1_inst0_O));
LSR8_2 LSR8_2_inst0 (.I(LSR8_1_inst0_O), .S(S[1]), .O(LSR8_2_inst0_O));
LSR8_4 LSR8_4_inst0 (.I(LSR8_2_inst0_O), .S(S[2]), .O(LSR8_4_inst0_O));
assign O = LSR8_4_inst0_O;
endmodule

