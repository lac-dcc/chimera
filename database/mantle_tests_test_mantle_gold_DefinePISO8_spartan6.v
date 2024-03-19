module Mux2 (input [1:0] I, input  S, output  O);
wire  LUT3_inst0_O;
LUT3 #(.INIT(8'hCA)) LUT3_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .O(LUT3_inst0_O));
assign O = LUT3_inst0_O;
endmodule

module Register8 (input [7:0] I, output [7:0] O, input  CLK);
wire  FDRSE_inst0_Q;
wire  FDRSE_inst1_Q;
wire  FDRSE_inst2_Q;
wire  FDRSE_inst3_Q;
wire  FDRSE_inst4_Q;
wire  FDRSE_inst5_Q;
wire  FDRSE_inst6_Q;
wire  FDRSE_inst7_Q;
FDRSE #(.INIT(1'h0)) FDRSE_inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[0]), .Q(FDRSE_inst0_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst1 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[1]), .Q(FDRSE_inst1_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst2 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[2]), .Q(FDRSE_inst2_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst3 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[3]), .Q(FDRSE_inst3_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst4 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[4]), .Q(FDRSE_inst4_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst5 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[5]), .Q(FDRSE_inst5_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst6 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[6]), .Q(FDRSE_inst6_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst7 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[7]), .Q(FDRSE_inst7_Q));
assign O = {FDRSE_inst7_Q,FDRSE_inst6_Q,FDRSE_inst5_Q,FDRSE_inst4_Q,FDRSE_inst3_Q,FDRSE_inst2_Q,FDRSE_inst1_Q,FDRSE_inst0_Q};
endmodule

module PISO8 (input  SI, input [7:0] PI, input  LOAD, output  O, input  CLK);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire  Mux2_inst2_O;
wire  Mux2_inst3_O;
wire  Mux2_inst4_O;
wire  Mux2_inst5_O;
wire  Mux2_inst6_O;
wire  Mux2_inst7_O;
wire [7:0] Register8_inst0_O;
Mux2 Mux2_inst0 (.I({PI[0],SI}), .S(LOAD), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({PI[1],Register8_inst0_O[0]}), .S(LOAD), .O(Mux2_inst1_O));
Mux2 Mux2_inst2 (.I({PI[2],Register8_inst0_O[1]}), .S(LOAD), .O(Mux2_inst2_O));
Mux2 Mux2_inst3 (.I({PI[3],Register8_inst0_O[2]}), .S(LOAD), .O(Mux2_inst3_O));
Mux2 Mux2_inst4 (.I({PI[4],Register8_inst0_O[3]}), .S(LOAD), .O(Mux2_inst4_O));
Mux2 Mux2_inst5 (.I({PI[5],Register8_inst0_O[4]}), .S(LOAD), .O(Mux2_inst5_O));
Mux2 Mux2_inst6 (.I({PI[6],Register8_inst0_O[5]}), .S(LOAD), .O(Mux2_inst6_O));
Mux2 Mux2_inst7 (.I({PI[7],Register8_inst0_O[6]}), .S(LOAD), .O(Mux2_inst7_O));
Register8 Register8_inst0 (.I({Mux2_inst7_O,Mux2_inst6_O,Mux2_inst5_O,Mux2_inst4_O,Mux2_inst3_O,Mux2_inst2_O,Mux2_inst1_O,Mux2_inst0_O}), .O(Register8_inst0_O), .CLK(CLK));
assign O = Register8_inst0_O[7];
endmodule

