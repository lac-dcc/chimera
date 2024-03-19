module Mux2 (input [1:0] I, input  S, output  O);
wire  LUT3_inst0_O;
LUT3 #(.INIT(8'hCA)) LUT3_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .O(LUT3_inst0_O));
assign O = LUT3_inst0_O;
endmodule

module Register4 (input [3:0] I, output [3:0] O, input  CLK);
wire  FDRSE_inst0_Q;
wire  FDRSE_inst1_Q;
wire  FDRSE_inst2_Q;
wire  FDRSE_inst3_Q;
FDRSE #(.INIT(1'h0)) FDRSE_inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[0]), .Q(FDRSE_inst0_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst1 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[1]), .Q(FDRSE_inst1_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst2 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[2]), .Q(FDRSE_inst2_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst3 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[3]), .Q(FDRSE_inst3_Q));
assign O = {FDRSE_inst3_Q,FDRSE_inst2_Q,FDRSE_inst1_Q,FDRSE_inst0_Q};
endmodule

module PISO4 (input  SI, input [3:0] PI, input  LOAD, output  O, input  CLK);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire  Mux2_inst2_O;
wire  Mux2_inst3_O;
wire [3:0] Register4_inst0_O;
Mux2 Mux2_inst0 (.I({PI[0],SI}), .S(LOAD), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({PI[1],Register4_inst0_O[0]}), .S(LOAD), .O(Mux2_inst1_O));
Mux2 Mux2_inst2 (.I({PI[2],Register4_inst0_O[1]}), .S(LOAD), .O(Mux2_inst2_O));
Mux2 Mux2_inst3 (.I({PI[3],Register4_inst0_O[2]}), .S(LOAD), .O(Mux2_inst3_O));
Register4 Register4_inst0 (.I({Mux2_inst3_O,Mux2_inst2_O,Mux2_inst1_O,Mux2_inst0_O}), .O(Register4_inst0_O), .CLK(CLK));
assign O = Register4_inst0_O[3];
endmodule

