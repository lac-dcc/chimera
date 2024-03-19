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

module Add8_cout (
    input [7:0] I0,
    input [7:0] I1,
    output [7:0] O,
    output COUT
);
wire [8:0] coreir_add9_inst0_out;
assign coreir_add9_inst0_out = 9'(({1'b0,I0}) + ({1'b0,I1}));
assign O = coreir_add9_inst0_out[7:0];
assign COUT = coreir_add9_inst0_out[8];
endmodule

module Counter8_COUT (
    output [7:0] O,
    output COUT,
    input CLK
);
wire [7:0] Add8_cout_inst0_O;
Add8_cout Add8_cout_inst0 (
    .I0(O),
    .I1(8'h01),
    .O(Add8_cout_inst0_O),
    .COUT(COUT)
);
coreir_reg #(
    .clk_posedge(1'b1),
    .init(8'h00),
    .width(8)
) reg_P_inst0 (
    .clk(CLK),
    .in(Add8_cout_inst0_O),
    .out(O)
);
endmodule

