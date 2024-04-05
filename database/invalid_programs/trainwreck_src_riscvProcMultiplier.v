`include "riscvConst.vh"

module riscvProcMultiplier
(
  input clk,
  input reset,

  input mul_fire,
  input [4:0] mul_waddr,

  output [4:0] mul_result_tag,
  output mul_result_val
);

  reg reg_val [0:`IMUL_STAGES-1];
  reg [4:0] reg_waddr [0:`IMUL_STAGES-1];

  integer i;

  always @(posedge clk)
  begin
    if (reset)
    begin
      for (i=0;i<`IMUL_STAGES;i=i+1)
      begin
        reg_val[i] <= 1'b0;
        reg_waddr[i] <= 1'b0;
      end
    end
    else
    begin
      if (mul_fire)
        reg_waddr[0] <= mul_waddr;
      reg_val[0] <= mul_fire;
      for (i=1;i<`IMUL_STAGES;i=i+1)
      begin
        reg_val[i] <= reg_val[i-1];
        reg_waddr[i] <= reg_waddr[i-1];
      end
    end
  end

  assign mul_result_tag = reg_waddr[`IMUL_STAGES-1];
  assign mul_result_val = reg_val[`IMUL_STAGES-1];

endmodule
