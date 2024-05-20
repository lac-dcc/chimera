// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

//========================================================================
// Verilog Components: Registers
//========================================================================

// Note that we place the register output earlier in the port list since
// this is one place we might actually want to use positional port
// binding like this:
//
//  logic [p_nbits-1:0] result_B;
//  cmn_Reg#(p_nbits) result_AB( clk, result_B, result_A );

`ifndef CMN_REGS_V
`define CMN_REGS_V

`include "assert.v"

//------------------------------------------------------------------------
// Postive-edge triggered flip-flop
//------------------------------------------------------------------------

module cmn_Reg #(
  parameter p_nbits = 1
) (
  input  logic               clk,  // Clock input
  output logic [p_nbits-1:0] q,    // Data output
  input  logic [p_nbits-1:0] d     // Data input
);

  always_ff @(posedge clk) q <= d;

endmodule

//------------------------------------------------------------------------
// Postive-edge triggered flip-flop with reset
//------------------------------------------------------------------------

module cmn_ResetReg #(
  parameter p_nbits       = 1,
  parameter p_reset_value = 0
) (
  input  logic               clk,    // Clock input
  input  logic               reset,  // Sync reset input
  output logic [p_nbits-1:0] q,      // Data output
  input  logic [p_nbits-1:0] d       // Data input
);

  always_ff @(posedge clk) q <= reset ? p_reset_value : d;

endmodule

//------------------------------------------------------------------------
// Postive-edge triggered flip-flop with enable
//------------------------------------------------------------------------

module cmn_EnReg #(
  parameter p_nbits = 1
) (
  input  logic               clk,  // Clock input
  output logic [p_nbits-1:0] q,    // Data output
  input  logic [p_nbits-1:0] d,    // Data input
  input  logic               en    // Enable input
);

  always_ff @(posedge clk) if (en) q <= d;

endmodule

//------------------------------------------------------------------------
// Postive-edge triggered flip-flop with enable and reset
//------------------------------------------------------------------------

module cmn_EnResetReg #(
  parameter p_nbits       = 1,
  parameter p_reset_value = 0
) (
  input  logic               clk,    // Clock input
  input  logic               reset,  // Sync reset input
  output logic [p_nbits-1:0] q,      // Data output
  input  logic [p_nbits-1:0] d,      // Data input
  input  logic               en      // Enable input
);

  always_ff @(posedge clk) if (reset || en) q <= reset ? p_reset_value : d;

endmodule

`endif  /* CMN_REGS_V */

