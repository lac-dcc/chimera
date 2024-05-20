// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

//========================================================================
// Verilog Components: Demuxes
//========================================================================

`ifndef CMN_DEMUXES_V
`define CMN_DEMUXES_V

//------------------------------------------------------------------------
// N Input Demux
//------------------------------------------------------------------------

module cmn_DemuxN
#(
  parameter nbits = 1,   
  parameter noutputs = 2
)(
  input  logic                [nbits-1:0]   in,
  input  logic     [$clog2(noutputs)-1:0]   sel,
  output logic                [nbits-1:0]   out   [0:noutputs-1] 
); 

  genvar i;
  generate
    for (i = 0; i < noutputs; i = i + 1) begin : output_gen
      assign out[i] = (i == sel) ? in : {nbits{1'b0}};
    end
  endgenerate
endmodule

`endif /* CMN_DEMUXES_V */