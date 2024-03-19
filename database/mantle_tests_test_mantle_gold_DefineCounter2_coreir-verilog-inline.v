module coreir_reg #(
    parameter width = 1,
    parameter clk_posedge = 1,
    parameter init = 1
) (
    input clk,
    input [width-1:0] in,
    output [width-1:0] out
);
  reg [width-1:0] outReg=init;
  wire real_clk;
  assign real_clk = clk_posedge ? clk : ~clk;
  always @(posedge real_clk) begin
    outReg <= in;
  end
  assign out = outReg;
endmodule

module Add2_cout (
    input [1:0] I0,
    input [1:0] I1,
    output [1:0] O,
    output COUT
);
wire [2:0] coreir_add3_inst0_out;
assign coreir_add3_inst0_out = 3'(({1'b0,I0}) + ({1'b0,I1}));
assign O = coreir_add3_inst0_out[1:0];
assign COUT = coreir_add3_inst0_out[2];
endmodule

module Counter2_COUT (
    output [1:0] O,
    output COUT,
    input CLK
);
wire [1:0] Add2_cout_inst0_O;
Add2_cout Add2_cout_inst0 (
    .I0(O),
    .I1(2'h1),
    .O(Add2_cout_inst0_O),
    .COUT(COUT)
);
coreir_reg #(
    .clk_posedge(1'b1),
    .init(2'h0),
    .width(2)
) reg_P_inst0 (
    .clk(CLK),
    .in(Add2_cout_inst0_O),
    .out(O)
);
endmodule

