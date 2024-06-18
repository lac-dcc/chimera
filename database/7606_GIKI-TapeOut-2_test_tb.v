// This program was cloned from: https://github.com/HUZAIFA-TARIQ/GIKI-TapeOut-2
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2024 02:16:42 PM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();
    
    // Dump the signals to a VCD file. You can view it with gtkwave.
    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);
    #1;
    end
    // Parameters
  parameter CLK_PERIOD = 20; // Clock period in ns
    
    reg clk;
    reg rst_n;
    reg ena;
    reg [7:0] ui_in;
    reg [7:0] uio_in;
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    tt_um_DigitalClockTop DUT(

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
    // Clock generation
     always #10 clk = ~clk;
   
     // Initial reset
     initial begin
       clk = 0;
       rst_n = 0;
       ena = 1;
       ui_in = 0;
       uio_in = 0;
       #100; // Wait for 100 time units
       rst_n = 1; // Release reset
       #100; // Wait for additional 100 time units
       // Start test
       ui_in = 20;
       uio_in = 30;
       #20; // Wait one clock cycle
       $display("uo_out = %d", uo_out);
       if (uo_out !== 192) $error("Test failed!"); // Check output
       $display("Test passed!");
       $finish; // End simulation
     end


endmodule
