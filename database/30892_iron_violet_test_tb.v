// This program was cloned from: https://github.com/johnbentcope/iron_violet
// License: Apache License 2.0

`default_nettype none `timescale 1ns / 1ps

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
  reg  clk;
  reg  rst_n;
  reg  ena;
  wire  [7:0] ui_in;
  reg  [7:0] uio_in;

  reg  butt_red;
  reg  butt_yel;
  reg  butt_grn;
  reg  butt_blu;
  reg  butt_start;

  assign ui_in = {2'b0, butt_start, 1'b0, butt_blu, butt_grn, butt_yel, butt_red};

  wire lamp_red;
  wire lamp_yel;
  wire lamp_grn;
  wire lamp_blu;

  wire [7:0] uo_out;
  assign lamp_red = uo_out[0];
  assign lamp_yel = uo_out[1];
  assign lamp_grn = uo_out[2];
  assign lamp_blu = uo_out[3];
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  tt_um_iron_violet_simon user_project (

    // Include power ports for the Gate Level test:
`ifdef GL_TEST
    .VPWR(1'b1),
    .VGND(1'b0),
`endif
    .ui_in  (ui_in),    // Dedicated inputs
    .uo_out (uo_out),   // Dedicated outputs
    .uio_in (uio_in),   // IOs: Input path
    .uio_out(uio_out),  // IOs: Output path
    .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
    .ena    (ena),      // enable - goes high when design is selected
    .clk    (clk),      // clock
    .rst_n  (rst_n)     // not reset
  );

endmodule : tb
