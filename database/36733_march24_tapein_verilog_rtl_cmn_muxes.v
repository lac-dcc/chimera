// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

//========================================================================
// Verilog Components: Muxes
//========================================================================

`ifndef CMN_MUXES_V
`define CMN_MUXES_V

//------------------------------------------------------------------------
// 2 Input Mux
//------------------------------------------------------------------------

module cmn_Mux2 #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in0,
  in1,
  input  logic               sel,
  output logic [p_nbits-1:0] out
);

  always_comb begin
    case (sel)
      1'd0: out = in0;
      1'd1: out = in1;
      default: out = {p_nbits{1'bx}};
    endcase
  end

endmodule

//------------------------------------------------------------------------
// 3 Input Mux
//------------------------------------------------------------------------

module cmn_Mux3 #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in0,
  in1,
  in2,
  input  logic [        1:0] sel,
  output logic [p_nbits-1:0] out
);

  always_comb begin
    case (sel)
      2'd0: out = in0;
      2'd1: out = in1;
      2'd2: out = in2;
      default: out = {p_nbits{1'bx}};
    endcase
  end

endmodule

//------------------------------------------------------------------------
// 4 Input Mux
//------------------------------------------------------------------------

module cmn_Mux4 #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in0,
  in1,
  in2,
  in3,
  input  logic [        1:0] sel,
  output logic [p_nbits-1:0] out
);

  always_comb begin
    case (sel)
      2'd0: out = in0;
      2'd1: out = in1;
      2'd2: out = in2;
      2'd3: out = in3;
      default: out = {p_nbits{1'bx}};
    endcase
  end

endmodule

//------------------------------------------------------------------------
// 5 Input Mux
//------------------------------------------------------------------------

module cmn_Mux5 #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in0,
  in1,
  in2,
  in3,
  in4,
  input  logic [        2:0] sel,
  output logic [p_nbits-1:0] out
);

  always_comb begin
    case (sel)
      3'd0: out = in0;
      3'd1: out = in1;
      3'd2: out = in2;
      3'd3: out = in3;
      3'd4: out = in4;
      default: out = {p_nbits{1'bx}};
    endcase
  end

endmodule

//------------------------------------------------------------------------
// 6 Input Mux
//------------------------------------------------------------------------

module cmn_Mux6 #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in0,
  in1,
  in2,
  in3,
  in4,
  in5,
  input  logic [        2:0] sel,
  output logic [p_nbits-1:0] out
);

  always_comb begin
    case (sel)
      3'd0: out = in0;
      3'd1: out = in1;
      3'd2: out = in2;
      3'd3: out = in3;
      3'd4: out = in4;
      3'd5: out = in5;
      default: out = {p_nbits{1'bx}};
    endcase
  end

endmodule

//------------------------------------------------------------------------
// 7 Input Mux
//------------------------------------------------------------------------

module cmn_Mux7 #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in0,
  in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  input  logic [        2:0] sel,
  output logic [p_nbits-1:0] out
);

  always_comb begin
    case (sel)
      3'd0: out = in0;
      3'd1: out = in1;
      3'd2: out = in2;
      3'd3: out = in3;
      3'd4: out = in4;
      3'd5: out = in5;
      3'd6: out = in6;
      default: out = {p_nbits{1'bx}};
    endcase
  end

endmodule

//------------------------------------------------------------------------
// 8 Input Mux
//------------------------------------------------------------------------

module cmn_Mux8 #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in0,
  in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  in7,
  input  logic [        2:0] sel,
  output logic [p_nbits-1:0] out
);

  always_comb begin
    case (sel)
      3'd0: out = in0;
      3'd1: out = in1;
      3'd2: out = in2;
      3'd3: out = in3;
      3'd4: out = in4;
      3'd5: out = in5;
      3'd6: out = in6;
      3'd7: out = in7;
      default: out = {p_nbits{1'bx}};
    endcase
  end

endmodule

//------------------------------------------------------------------------
// N Input Mux
//------------------------------------------------------------------------

module cmn_MuxN
#(
  parameter nbits = 1,
  parameter ninputs = 2
)(
  input  logic               [nbits-1:0]   in   [0:ninputs-1], 
  input  logic     [$clog2(ninputs)-1:0]   sel,
  output logic               [nbits-1:0]   out
);

  assign out = in[sel];

endmodule

`endif /* CMN_MUXES_V */

