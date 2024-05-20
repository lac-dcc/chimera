// This program was cloned from: https://github.com/gfg-development/grayblastVGA
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

  reg  clk;
  reg  rst_n;

  reg [3:0] pixel_div;

  wire v_sync;
  wire h_sync;
  wire [3:0] gray;

  wire next_pixel;
  wire frame_reset;
  reg  [3:0] frame_pixel;

  vga dut (
    .clk(clk),
    .rst_n(rst_n),
    .pixel_div(pixel_div),
    
    .v_sync_out(v_sync),
    .h_sync_out(h_sync),
    .gray_out(gray),

    .frame_next_pixel_out(next_pixel),
    .frame_reset_out(frame_reset),
    .frame_pixel_in(frame_pixel)
  );
endmodule
