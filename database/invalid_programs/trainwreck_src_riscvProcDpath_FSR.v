`include "fpu_common.v"

module riscvProcDpath_FSR
(
  input clk,
  input reset,

  input                   wen,
  input [`FSR_WIDTH-1:0]  wdata,

  output [`FSR_WIDTH-1:0] fsr
);

  reg [`FSR_WIDTH-1:0] fsr_reg;

  always @(posedge clk)
  begin
    if(reset)
      fsr_reg <= {`FSR_WIDTH{1'b0}};
    else if(wen)
      fsr_reg <= wdata;
  end

  // bypass the FSR
  assign fsr = wen ? wdata : fsr_reg;

endmodule

