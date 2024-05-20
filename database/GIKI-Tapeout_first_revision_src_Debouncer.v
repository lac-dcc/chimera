// This program was cloned from: https://github.com/theuppercaseguy/GIKI-Tapeout
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 10:22:17 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer_clock(
  input clk, 
  input PB,  
   output reg PB_state  
);
    reg PB_sync_0;
    always @(posedge clk) PB_sync_0 <= PB;
    reg PB_sync_1;
    always @(posedge clk) PB_sync_1 <= PB_sync_0;
    
    // Debounce the switch
    reg [26:0] PB_cnt;
    always @(posedge clk)
    if(PB_state==PB_sync_1)
        PB_cnt <= 0;
    else
    begin
        PB_cnt <= PB_cnt + 1'b1; 
        if(PB_cnt == 6000000) PB_state <= ~PB_state; 
    end

endmodule
