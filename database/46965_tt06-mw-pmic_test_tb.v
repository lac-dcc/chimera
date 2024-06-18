// This program was cloned from: https://github.com/wongmatthew73/tt06-mw-pmic
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

  // wire up the inputs and outputs
    reg  clk;
    reg  rst_n;
    reg  ena;
    reg  [7:0] ui_in;
    reg  [7:0] uio_in;
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;
    
    reg busy;
    reg [7:0] adcVoltage;
    wire convStart, rd_cs, syncRectifierLs, syncRectifierHs;
    assign convStart = uo_out[0];
    assign rd_cs = uo_out[1];
    assign syncRectifierLs = uo_out[2];
    assign syncRectifierHs = uo_out[3];

  // Replace tt_um_example with your module name:
  tt_um_mw73_pmic tt_um_mw73_pmic (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .ui_in  (adcVoltage),    // Dedicated inputs
      .uo_out (uo_out),   // Dedicated outputs (could not write as array)
      .uio_in ({7'b0, busy}),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );

endmodule
