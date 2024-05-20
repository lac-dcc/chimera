// This program was cloned from: https://github.com/ericsmi/tt06-weste-problem-4.11
// License: Apache License 2.0

`default_nettype none 
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:

  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  // Replace tt_um_example with your module name:
  tt_um_ericsmi_weste_problem_4_11 tt_um_ericsmi_weste_problem_4_11 (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .ena(ena),
      .clk(clk),
      .rst_n(rst_n),
      .ui_in(ui_in[7:0]),
      .uo_out(uo_out[7:0]),
      .uio_in(uio_in[7:0]),
      .uio_out(),
      .uio_oe()
    );

  initial begin
    rst_n = 0;
    ui_in[7:0] = 8'd0;
    uio_in[7:0] = 8'd0;
  end

endmodule
