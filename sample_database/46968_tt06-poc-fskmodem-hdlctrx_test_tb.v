// This program was cloned from: https://github.com/dlmiles/tt06-poc-fskmodem-hdlctrx
// License: Apache License 2.0


`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

`ifndef SYNTHESIS
  reg [(8*32)-1:0] DEBUG;
  reg DEBUG_wire;
`endif

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
`ifdef TIMING
    #1;
`endif
`ifndef SYNTHESIS
    DEBUG = {8'h44, 8'h45, 8'h42, 8'h55, 8'h47, {27{8'h20}}}; // "DEBUG        "
    DEBUG_wire = 0;
`endif
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
  tt_um_dlmiles_poc_fskmodem_hdlctrx dut (
      // Include power ports for the Gate Level test:
`ifdef USE_POWER_PINS
      .VPWR   (1'b1),     //i
      .VGND   (1'b0),     //i
`endif
`ifdef USE_POWER_PINS_LEGACY
      .vccd1  (1'b1),     //i
      .vssd1  (1'b0),     //i
`endif
      .ui_in  (ui_in),    //i Dedicated inputs
      .uo_out (uo_out),   //o Dedicated outputs
      .uio_in (uio_in),   //i IOs: Input path
      .uio_out(uio_out),  //o IOs: Output path
      .uio_oe (uio_oe),   //o IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      //i enable - goes high when design is selected
      .clk    (clk),      //i clock
      .rst_n  (rst_n)     //i not reset
  );

endmodule
