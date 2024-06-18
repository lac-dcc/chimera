// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module baked_connection_block_north #(
  parameter WS = 4,
  parameter WD = 8,
  parameter WG = 0,
  parameter CLBIN = 10,
  parameter CLBIN0 = 10,
  parameter CLBIN1 = 10,
  parameter CLBOUT = 5,
  parameter CLBOUT0 = 5,
  parameter CLBOUT1 = 5,
  parameter CARRY = 1,
  parameter CLBOS = 4,
  parameter CLBOS_BIAS = 0,
  parameter CLBOD = 4,
  parameter CLBOD_BIAS = 0,
  parameter CLBX = 1
)(
  // Common
  input wire clk,
  input wire rst,

  // Confiuration Signals:

  input wire cen,

  // Config set input (from tile module)
  input wire set_in,

  // Config shift input (from tile module)
  input wire shift_in,
  // Config shift output (to tile module)
  output wire shift_out,

  // Single Wires
  inout [WS-1:0] single0, single1,
  // Double Wires
  inout [WD-1:0] double0, double1,
  // Global Wires
  //inout [WG-1:0] global,  /* manually disabled since WG = 0 for hardening */

  input [CLBOUT-1:0] clb0_output,
  input [CLBOUT-1:0] clb1_output,
  input [CARRY-1:0]  clb0_cout,
  input [CARRY-1:0]  clb1_cout,
  output [CLBIN-1:0] clb0_input,
  output [CLBIN-1:0] clb1_input,
  output [CARRY-1:0] clb0_cin,
  output [CARRY-1:0] clb1_cin
);

baked_connection_block #(
  .WS(WS),
  .WD(WD),
  .WG(WG),
  .CLBIN(CLBIN),
  .CLBIN0(CLBIN0),
  .CLBIN1(CLBIN1),
  .CLBOUT(CLBOUT),
  .CLBOUT0(CLBOUT0),
  .CLBOUT1(CLBOUT1),
  .CARRY(CARRY),
  .CLBOS(CLBOS),
  .CLBOS_BIAS(CLBOS_BIAS),
  .CLBOD(CLBOD),
  .CLBOD_BIAS(CLBOD_BIAS),
  .CLBX(CLBX)
) inst (
  .clk(clk),
  .rst(rst),
  .cen(cen),
  .set_in(set_in),
  .shift_in(shift_in),
  .shift_out(shift_out),
  .single0(single0),
  .single1(single1),
  .double0(double0),
  .double1(double1),
  //.global(global),  /* manually disabled since WG = 0 for hardening */
  .clb0_output(clb0_output),
  .clb1_output(clb1_output),
  .clb0_cout(clb0_cout),
  .clb1_cout(clb1_cout),
  .clb0_input(clb0_input),
  .clb1_input(clb1_input),
  .clb0_cin(clb0_cin),
  .clb1_cin(clb1_cin)
);

endmodule
