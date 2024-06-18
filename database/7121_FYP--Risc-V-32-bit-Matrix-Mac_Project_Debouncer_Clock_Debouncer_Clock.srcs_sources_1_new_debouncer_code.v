// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2023 05:40:28 AM
// Design Name: 
// Module Name: debouncer_code
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


module Debounce_Switch (input i_Clk, input i_Switch, output o_Switch);
 
  parameter c_DEBOUNCE_LIMIT = 250000;  // 10 ms at 25 MHz
   
  reg [17:0] r_Count = 0;
  reg r_State = 1'b0;
 
  always @(posedge i_Clk)
  begin
    // Switch input is different than internal switch value, so an input is
    // changing.  Increase the counter until it is stable for enough time.  
    if (i_Switch !== r_State && r_Count < c_DEBOUNCE_LIMIT)
      r_Count <= r_Count + 1;
 
    // End of counter reached, switch is stable, register it, reset counter
    else if (r_Count == c_DEBOUNCE_LIMIT)
    begin
      r_State <= i_Switch;
      r_Count <= 0;
    end 
 
    // Switches are the same state, reset the counter
    else
      r_Count <= 0;
  end
 
  // Assign internal register to output (debounced!)
  assign o_Switch = r_State;
 
endmodule