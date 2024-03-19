module riscvProcDpath_Regfile
(
  input clk,

  input [4:0]  raddr0,
  input [4:0]  raddr1,
  input        ren0,
  input        ren1,
  output [63:0] rdata0,
  output [63:0] rdata1,

  input [4:0]  waddr0_p,
  input [4:0]  waddr1_p,
  input        wen0_p,
  input        wen1_p,
  input [63:0] wdata0_p,
  input [63:0] wdata1_p
);

  reg [63:0] regfile [31:0];

  assign rdata0 = (raddr0 == 5'd0 || !ren0) ? 64'd0 : regfile[raddr0];
  assign rdata1 = (raddr1 == 5'd0 || !ren1) ? 64'd0 : regfile[raddr1];

  always @(posedge clk)
  begin
    if (wen0_p)
      regfile[waddr0_p] <= wdata0_p;
    if (wen1_p)
      regfile[waddr1_p] <= wdata1_p;
  end

endmodule
