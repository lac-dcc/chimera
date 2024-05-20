// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

//=========================================================================
// Verilog Components: Counter
//=========================================================================

`ifndef CMN_COUNTER_V
`define CMN_COUNTER_V

`include "cmn/regs.v"
`include "cmn/assert.v"

module cmn_BasicCounter #(
  parameter p_count_nbits       = 3,
  parameter p_count_clear_value = 0,
  parameter p_count_max_value   = 4
) (
  input logic clk,
  input logic reset,

  // Operations

  input logic clear,
  input logic increment,
  input logic decrement,

  // Outputs

  output logic [p_count_nbits-1:0] count,
  output logic                     count_is_zero,
  output logic                     count_is_max

);

  //----------------------------------------------------------------------
  // State
  //----------------------------------------------------------------------

  logic [p_count_nbits-1:0] count_next;

  cmn_ResetReg #(p_count_nbits, p_count_clear_value) count_reg (
    .clk  (clk),
    .reset(reset),
    .d    (count_next),
    .q    (count)
  );

  //----------------------------------------------------------------------
  // Combinational Logic
  //----------------------------------------------------------------------

  logic do_increment;
  assign do_increment = (increment && (count < p_count_max_value));

  logic do_decrement;
  assign do_decrement = (decrement && (count > 0));

  assign count_next
    = clear        ? (p_count_clear_value)
    : do_increment ? (count + 1)
    : do_decrement ? (count - 1)
    : count;

  assign count_is_zero = (count == 0);
  assign count_is_max = (count == p_count_max_value);

  //----------------------------------------------------------------------
  // Assertions
  //----------------------------------------------------------------------

  /*
  always_ff @( posedge clk ) begin
    if ( !reset ) begin
      `CMN_ASSERT_NOT_X( increment );
      `CMN_ASSERT_NOT_X( decrement );
    end
  end
  */

endmodule

`endif  /* CMN_COUNTER_V */

