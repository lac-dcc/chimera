// (C) 2001-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// (C) 2001-2010 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.
// 
// -----------------------------------------------
// False path marker module
// This module creates a level of flops for the 
// targetted clock, and cut the timing path to the
// flops using embedded SDC constraint
//
// Only use this module to clock cross the path
// that is being clock crossed properly by correct
// concept.
// -----------------------------------------------
`timescale 1ns / 1ns

module altera_tse_false_path_marker 
#(
   parameter MARKER_WIDTH = 1
)
(
   input    reset,
   input    clk,
   input    [MARKER_WIDTH - 1 : 0] data_in,
   output   [MARKER_WIDTH - 1 : 0] data_out
);

(*preserve*) reg [MARKER_WIDTH - 1 : 0] data_out_reg;


assign data_out = data_out_reg;

always @(posedge clk or posedge reset) 
begin
   if (reset)
   begin
      data_out_reg <= {MARKER_WIDTH{1'b0}};
   end
   else
   begin
      data_out_reg <= data_in;
   end
end

endmodule
