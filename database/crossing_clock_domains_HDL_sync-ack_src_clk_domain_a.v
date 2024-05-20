// This program was cloned from: https://github.com/ReiErt/crossing_clock_domains_HDL_sync-ack
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 17:09:21
// Design Name: 
// Module Name: top
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


module clk_domain_a
(
    input clk_a,
    input reset_in,
    //
    input vld_in,
    input rdy_in,
    //
    output reg vld_out
    //output rdy_out
);

reg [2:0]counter;

//counter logic
always@(posedge clk_a or negedge reset_in) begin
    if (~reset_in) begin 
        counter <= 3'b000;
        vld_out <= 1'b0;
        //reg_rdy_in <= 1'b0;
    end
    
    else if (clk_a) begin
    
    //default values
    vld_out <= 0;
    
        if (vld_in & rdy_in) 
            counter <= counter + 1;
        
        else if (counter == 3'b111) begin
            vld_out <= 1'b1;
            counter <= 3'b000;
        end     
        
        else if (counter > 3'b000)
            counter <= counter +1;
    end
end
  


endmodule