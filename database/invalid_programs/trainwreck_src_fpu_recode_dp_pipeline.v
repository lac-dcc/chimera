`include "fpu_common.v"

module fp_recode_dp_pipeline
(
  input  wire                            clk,
  input  wire                            reset,

  input  wire [`FPR_WIDTH-1:0]           in,

  output wire [`FPR_RECODED_WIDTH-1:0]   result,
  output wire [`FPU_EXC_WIDTH-1:0] exc
);

  reg [`FPR_RECODED_WIDTH-1:0] pipereg [`FPU_PIPE_DEPTH(`FPU_PIPE_RECODE_D)-1:0];
  
  floatNToRecodedFloatN #(11,53) recode_dp ( in, pipereg[0] );

  always @(posedge clk) begin : foo
    integer i;
    for(i = 1; i < `FPU_PIPE_DEPTH(`FPU_PIPE_RECODE_D); i=i+1)
      pipereg[i] <= pipereg[i-1];
  end
  assign result = pipereg[`FPU_PIPE_DEPTH(`FPU_PIPE_RECODE_D)-1'b1];
  assign exc = {`FPU_EXC_WIDTH{1'b0}};

endmodule
