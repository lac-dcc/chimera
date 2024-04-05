module Register1CE (input [0:0] I, output [0:0] O, input  CLK, input  CE);
wire  SB_DFFE_inst0_Q;
SB_DFFE SB_DFFE_inst0 (.C(CLK), .E(CE), .D(I[0]), .Q(SB_DFFE_inst0_Q));
assign O = {SB_DFFE_inst0_Q};
endmodule

module Decoder2 (input [1:0] I, output [3:0] O);
wire  SB_LUT4_inst0_O;
wire  SB_LUT4_inst1_O;
wire  SB_LUT4_inst2_O;
wire  SB_LUT4_inst3_O;
SB_LUT4 #(.LUT_INIT(16'h0001)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_LUT4 #(.LUT_INIT(16'h0002)) SB_LUT4_inst1 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst1_O));
SB_LUT4 #(.LUT_INIT(16'h0004)) SB_LUT4_inst2 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst2_O));
SB_LUT4 #(.LUT_INIT(16'h0008)) SB_LUT4_inst3 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst3_O));
assign O = {SB_LUT4_inst3_O,SB_LUT4_inst2_O,SB_LUT4_inst1_O,SB_LUT4_inst0_O};
endmodule

module And2 (input [1:0] I, output  O);
wire  SB_LUT4_inst0_O;
SB_LUT4 #(.LUT_INIT(16'h8888)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

module And2x4 (input [3:0] I0, input [3:0] I1, output [3:0] O);
wire  And2_inst0_O;
wire  And2_inst1_O;
wire  And2_inst2_O;
wire  And2_inst3_O;
And2 And2_inst0 (.I({I1[0],I0[0]}), .O(And2_inst0_O));
And2 And2_inst1 (.I({I1[1],I0[1]}), .O(And2_inst1_O));
And2 And2_inst2 (.I({I1[2],I0[2]}), .O(And2_inst2_O));
And2 And2_inst3 (.I({I1[3],I0[3]}), .O(And2_inst3_O));
assign O = {And2_inst3_O,And2_inst2_O,And2_inst1_O,And2_inst0_O};
endmodule

module Mux2 (input [1:0] I, input  S, output  O);
wire  SB_LUT4_inst0_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .I3(1'b0), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

module Mux2x1 (input [0:0] I0, input [0:0] I1, input  S, output [0:0] O);
wire  Mux2_inst0_O;
Mux2 Mux2_inst0 (.I({I1[0],I0[0]}), .S(S), .O(Mux2_inst0_O));
assign O = {Mux2_inst0_O};
endmodule

module RAM4x1 (input [1:0] RADDR, output [0:0] RDATA, input [1:0] WADDR, input [0:0] WDATA, input  WE, input  CLK);
wire [0:0] Register1CE_inst0_O;
wire [0:0] Register1CE_inst1_O;
wire [0:0] Register1CE_inst2_O;
wire [0:0] Register1CE_inst3_O;
wire [3:0] Decoder2_inst0_O;
wire [3:0] And2x4_inst0_O;
wire [0:0] Mux2x1_inst0_O;
wire [0:0] Mux2x1_inst1_O;
wire [0:0] Mux2x1_inst2_O;
Register1CE Register1CE_inst0 (.I(WDATA), .O(Register1CE_inst0_O), .CLK(CLK), .CE(And2x4_inst0_O[0]));
Register1CE Register1CE_inst1 (.I(WDATA), .O(Register1CE_inst1_O), .CLK(CLK), .CE(And2x4_inst0_O[1]));
Register1CE Register1CE_inst2 (.I(WDATA), .O(Register1CE_inst2_O), .CLK(CLK), .CE(And2x4_inst0_O[2]));
Register1CE Register1CE_inst3 (.I(WDATA), .O(Register1CE_inst3_O), .CLK(CLK), .CE(And2x4_inst0_O[3]));
Decoder2 Decoder2_inst0 (.I(WADDR), .O(Decoder2_inst0_O));
And2x4 And2x4_inst0 (.I0(Decoder2_inst0_O), .I1({WE,WE,WE,WE}), .O(And2x4_inst0_O));
Mux2x1 Mux2x1_inst0 (.S(RADDR[0]), .O(Mux2x1_inst0_O));
Mux2x1 Mux2x1_inst1 (.S(RADDR[0]), .O(Mux2x1_inst1_O));
Mux2x1 Mux2x1_inst2 (.S(RADDR[1]), .O(Mux2x1_inst2_O));
assign RDATA = Mux2x1_inst2_O;
endmodule

module FullAdder (input  I0, input  I1, input  CIN, output  O, output  COUT);
wire  SB_LUT4_inst0_O;
wire  SB_CARRY_inst0_CO;
SB_LUT4 #(.LUT_INIT(16'h9696)) SB_LUT4_inst0 (.I0(I0), .I1(I1), .I2(CIN), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_CARRY SB_CARRY_inst0 (.I0(I0), .I1(I1), .CI(CIN), .CO(SB_CARRY_inst0_CO));
assign O = SB_LUT4_inst0_O;
assign COUT = SB_CARRY_inst0_CO;
endmodule

module Add2 (input [1:0] I0, input [1:0] I1, output [1:0] O);
wire  FullAdder_inst0_O;
wire  FullAdder_inst0_COUT;
wire  FullAdder_inst1_O;
wire  FullAdder_inst1_COUT;
FullAdder FullAdder_inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(1'b0), .O(FullAdder_inst0_O), .COUT(FullAdder_inst0_COUT));
FullAdder FullAdder_inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(FullAdder_inst0_COUT), .O(FullAdder_inst1_O), .COUT(FullAdder_inst1_COUT));
assign O = {FullAdder_inst1_O,FullAdder_inst0_O};
endmodule

module Register2 (input [1:0] I, output [1:0] O, input  CLK);
wire  SB_DFF_inst0_Q;
wire  SB_DFF_inst1_Q;
SB_DFF SB_DFF_inst0 (.C(CLK), .D(I[0]), .Q(SB_DFF_inst0_Q));
SB_DFF SB_DFF_inst1 (.C(CLK), .D(I[1]), .Q(SB_DFF_inst1_Q));
assign O = {SB_DFF_inst1_Q,SB_DFF_inst0_Q};
endmodule

module Counter2 (output [1:0] O, input  CLK);
wire [1:0] Add2_inst0_O;
wire [1:0] Register2_inst0_O;
Add2 Add2_inst0 (.I0(Register2_inst0_O), .I1(2'd1'), .O(Add2_inst0_O));
Register2 Register2_inst0 (.I(Add2_inst0_O), .O(Register2_inst0_O), .CLK(CLK));
assign O = Register2_inst0_O;
endmodule

module Add1 (input [0:0] I0, input [0:0] I1, output [0:0] O);
wire  FullAdder_inst0_O;
wire  FullAdder_inst0_COUT;
FullAdder FullAdder_inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(1'b0), .O(FullAdder_inst0_O), .COUT(FullAdder_inst0_COUT));
assign O = {FullAdder_inst0_O};
endmodule

module Register1 (input [0:0] I, output [0:0] O, input  CLK);
wire  SB_DFF_inst0_Q;
SB_DFF SB_DFF_inst0 (.C(CLK), .D(I[0]), .Q(SB_DFF_inst0_Q));
assign O = {SB_DFF_inst0_Q};
endmodule

module Counter1 (output [0:0] O, input  CLK);
wire [0:0] Add1_inst0_O;
wire [0:0] Register1_inst0_O;
Add1 Add1_inst0 (.I0(Register1_inst0_O), .I1(1'd1'), .O(Add1_inst0_O));
Register1 Register1_inst0 (.I(Add1_inst0_O), .O(Register1_inst0_O), .CLK(CLK));
assign O = Register1_inst0_O;
endmodule

module main (output  rdata, input  CLKIN);
wire [0:0] ram_RDATA;
wire [1:0] Counter2_inst0_O;
wire [0:0] Counter1_inst0_O;
wire [1:0] Counter2_inst1_O;
RAM4x1 ram (.RADDR(Counter2_inst1_O), .RDATA(ram_RDATA), .WADDR(Counter2_inst0_O), .WDATA(Counter1_inst0_O), .WE(1'b1), .CLK(CLKIN));
Counter2 Counter2_inst0 (.O(Counter2_inst0_O), .CLK(CLKIN));
Counter1 Counter1_inst0 (.O(Counter1_inst0_O), .CLK(CLKIN));
Counter2 Counter2_inst1 (.O(Counter2_inst1_O), .CLK(CLKIN));
assign rdata = ram_RDATA[0];
endmodule

