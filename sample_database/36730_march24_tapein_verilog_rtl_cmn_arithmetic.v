// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

//========================================================================
// Verilog Components: Arithmetic Components
//========================================================================

`ifndef CMN_ARITHMETIC_V
`define CMN_ARITHMETIC_V

//------------------------------------------------------------------------
// Adders
//------------------------------------------------------------------------

module cmn_Adder #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in0,
  input  logic [p_nbits-1:0] in1,
  input  logic               cin,
  output logic [p_nbits-1:0] out,
  output logic               cout
);

  // We need to convert cin into a 32-bit value to
  // avoid verilator warnings

  assign {cout, out} = in0 + in1 + {{(p_nbits - 1) {1'b0}}, cin};

endmodule

module cmn_SimpleAdder #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in0,
  input  logic [p_nbits-1:0] in1,
  output logic [p_nbits-1:0] out
);

  assign out = in0 + in1;

endmodule

//------------------------------------------------------------------------
// Subtractor
//------------------------------------------------------------------------

module cmn_Subtractor #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in0,
  input  logic [p_nbits-1:0] in1,
  output logic [p_nbits-1:0] out
);

  assign out = in0 - in1;

endmodule

//------------------------------------------------------------------------
// Incrementer
//------------------------------------------------------------------------

module cmn_Incrementer #(
  parameter p_nbits     = 1,
  parameter p_inc_value = 1
) (
  input  logic [p_nbits-1:0] in,
  output logic [p_nbits-1:0] out
);

  assign out = in + p_inc_value;

endmodule

//------------------------------------------------------------------------
// ZeroExtender
//------------------------------------------------------------------------

module cmn_ZeroExtender #(
  parameter p_in_nbits  = 1,
  parameter p_out_nbits = 8
) (
  input  logic [ p_in_nbits-1:0] in,
  output logic [p_out_nbits-1:0] out
);

  assign out = {{(p_out_nbits - p_in_nbits) {1'b0}}, in};

endmodule

//------------------------------------------------------------------------
// SignExtender
//------------------------------------------------------------------------

module cmn_SignExtender #(
  parameter p_in_nbits  = 1,
  parameter p_out_nbits = 8
) (
  input  logic [ p_in_nbits-1:0] in,
  output logic [p_out_nbits-1:0] out
);

  assign out = {{(p_out_nbits - p_in_nbits) {in[p_in_nbits-1]}}, in};

endmodule

//------------------------------------------------------------------------
// ZeroComparator
//------------------------------------------------------------------------

module cmn_ZeroComparator #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in,
  output logic               out
);

  assign out = (in == {p_nbits{1'b0}});

endmodule

//------------------------------------------------------------------------
// EqComparator
//------------------------------------------------------------------------

module cmn_EqComparator #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in0,
  input  logic [p_nbits-1:0] in1,
  output logic               out
);

  assign out = (in0 == in1);

endmodule

//------------------------------------------------------------------------
// LtComparator
//------------------------------------------------------------------------

module cmn_LtComparator #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in0,
  input  logic [p_nbits-1:0] in1,
  output logic               out
);

  assign out = (in0 < in1);

endmodule

//------------------------------------------------------------------------
// GtComparator
//------------------------------------------------------------------------

module cmn_GtComparator #(
  parameter p_nbits = 1
) (
  input  logic [p_nbits-1:0] in0,
  input  logic [p_nbits-1:0] in1,
  output logic               out
);

  assign out = (in0 > in1);

endmodule

//------------------------------------------------------------------------
// LeftLogicalShifter
//------------------------------------------------------------------------

module cmn_LeftLogicalShifter #(
  parameter p_nbits       = 1,
  parameter p_shamt_nbits = 1
) (
  input  logic [      p_nbits-1:0] in,
  input  logic [p_shamt_nbits-1:0] shamt,
  output logic [      p_nbits-1:0] out
);

  assign out = (in << shamt);

endmodule

//------------------------------------------------------------------------
// RightLogicalShifter
//------------------------------------------------------------------------

module cmn_RightLogicalShifter #(
  parameter p_nbits       = 1,
  parameter p_shamt_nbits = 1
) (
  input  logic [      p_nbits-1:0] in,
  input  logic [p_shamt_nbits-1:0] shamt,
  output logic [      p_nbits-1:0] out
);

  assign out = (in >> shamt);

endmodule

`endif  /* CMN_ARITHMETIC_V */

