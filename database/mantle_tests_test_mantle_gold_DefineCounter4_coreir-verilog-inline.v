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

module Add4_cout (
    input [3:0] I0,
    input [3:0] I1,
    output [3:0] O,
    output COUT
);
wire [4:0] coreir_add5_inst0_out;
assign coreir_add5_inst0_out = 5'(({1'b0,I0}) + ({1'b0,I1}));
assign O = coreir_add5_inst0_out[3:0];
assign COUT = coreir_add5_inst0_out[4];
endmodule

module Counter4_COUT (
    output [3:0] O,
    output COUT,
    input CLK
);
wire [3:0] Add4_cout_inst0_O;
Add4_cout Add4_cout_inst0 (
    .I0(O),
    .I1(4'h1),
    .O(Add4_cout_inst0_O),
    .COUT(COUT)
);
coreir_reg #(
    .clk_posedge(1'b1),
    .init(4'h0),
    .width(4)
) reg_P_inst0 (
    .clk(CLK),
    .in(Add4_cout_inst0_O),
    .out(O)
);
endmodule

