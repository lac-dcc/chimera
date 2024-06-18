// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef V_74138
`define V_74138

// 3-line to 8-line decoder/demultiplexer (inverted outputs)
// (c) Tim Rudy, GPL3

/* verilator lint_off DECLFILENAME */
// These timings are similar to 'typical' values for LS series - however MAX can be >2x worse
// Adjust for HCT? 
`timescale 1ns/1ns
module hct74138 #(parameter WIDTH_OUT = 8, WIDTH_IN = $clog2(WIDTH_OUT))
(
  input Enable1_bar,
  input Enable2_bar,
  input Enable3,
  input [WIDTH_IN-1:0] A,
  output [WIDTH_OUT-1:0] Y
);

// timings according to nexperia seem short https://assets.nexperia.com/documents/data-sheet/74HC_HCT138.pdf
// these timings are longer https://www.diodes.com/assets/Datasheets/74HCT138.pdf
// TI is longer still https://www.diodes.com/assets/Datasheets/74HCT138.pdf
// using longer timings here ...
specify
  (Enable1_bar *> Y) = (19); // NEXPERIA 14 // DIODES 19 // TI 18-30
  (Enable2_bar *> Y) = (19); // NEXPERIA 14 // DIODES 19 // TI 18-30
  (Enable3 *> Y) = (19); // NEXPERIA 14 // DIODES 19 // TI 18-30
  (A *> Y) = (17); // NEXPERIA 12 //DIODES 17  // TI 17-32
endspecify
  
//------------------------------------------------//
reg [WIDTH_OUT-1:0] computed;
integer i;

always @(*)
begin
  for (i = 0; i < WIDTH_OUT; i++)
  begin
/* verilator lint_off WIDTH */
    // BUG FIX - ORIGINAL VERSION OF THIS CODE SKIRTS OVER A being x or z WHICH IS INVALID AND OUTPUTS SHOULDN'T BE VALID
    // SO EMIT INVALID OUTPUTS WHEN THIS IS THE CASE TO DRAW ATTENTION TO THE PROBLEM

    // a disabled device returns 1 on all pins
    if (Enable1_bar || Enable2_bar || !Enable3)
        computed[i] = 1'b1;

    // a device with uncertain enablement returns X on all pins
    else if ($isunknown(A) || $isunknown(Enable1_bar) || $isunknown(Enable2_bar) || $isunknown(Enable3))
        computed[i] = 1'bx;

    // a device that is enabled returns a single 0 according to the address
    else begin
        // END BUG FIX
        if (i == A)
    /* verilator lint_on WIDTH */
          computed[i] = 1'b0;
        else
          computed[i] = 1'b1;
    end
  end
end
//------------------------------------------------//

assign Y = computed;

endmodule
/* verilator lint_on DECLFILENAME */

`endif
