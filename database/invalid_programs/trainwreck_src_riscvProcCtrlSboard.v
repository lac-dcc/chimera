`include "riscvConst.vh"

module riscvProcCtrlSboard
(
  input clk,
  input reset,

  input       wen0,
  input [4:0] waddr0,
  input       wdata0,
  input       wen1,
  input [4:0] waddr1,
  input       wdata1,

  input [4:0] raddra,
  input [4:0] raddrb,
  input [4:0] raddrc,

  output      stalla,
  output      stallb,
  output      stallc,
  output      stallra
);

  reg [31:0] reg_busy;

  assign stalla = reg_busy[raddra];
  assign stallb = reg_busy[raddrb];
  assign stallc = reg_busy[raddrc];
  assign stallra = reg_busy[`RA];

  always @(posedge clk)
  begin
    if (reset)
      reg_busy <= 32'd0;
    else
    begin
      if (wen0 && waddr0 != 5'd0)
        reg_busy[waddr0] <= wdata0;
      if (wen1 && waddr1 != 5'd0)
        reg_busy[waddr1] <= wdata1;
    end
  end

endmodule
