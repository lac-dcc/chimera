// This program was cloned from: https://github.com/ReiErt/crossing_clock_domains_HDL_sync-ack
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Reilly Ertman
// 
// Create Date: 02.05.2024 17:09:21
// Module Name: clk_domain_b
// Description: Simple module which outputs vld_out signal after x ticks.
// 
//////////////////////////////////////////////////////////////////////////////////

module clk_domain_b 
(
    input clk_b,
    input reset_in,
    //
    input vld_in,
    //
    output reg vld_out
    //output reg rdy_out
);

reg [1:0]counter;

always@(posedge clk_b, negedge reset_in) begin
    if (~reset_in) begin
        counter <= 0;
        vld_out <= 1'b0;
        //rdy_out <= 1'b1;
    end
    
    else if(clk_b) begin
    //default value
    vld_out <= 1'b0;
        if (vld_in) begin
            counter <= counter +1;
            //rdy_out <= 1'b0;
        end
        
        else if (counter == 2'b11) begin
            vld_out <= 1'b1;
            //rdy_out <= 1'b1;
            counter <= 2'b00;
        end

        else if(counter > 0) 
            counter <= counter +1;
    end
end

endmodule