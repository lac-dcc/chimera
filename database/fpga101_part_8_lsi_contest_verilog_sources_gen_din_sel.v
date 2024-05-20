// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date: 2017/11/06 01:29:52
// Design Name:    Neural Network (using backpropagation)
// Module Name: gen_din_sel
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool Versions: 
//
// Description: 
//      generate the signal for din(read enable of memory) and select initial (for parameter)
//
// Input:
//		clk	    : 1 bit
//		res 	: 1 bit : high active
//
// Output: 
//		din	            : 1 bit : read enable signal
//		select initial  : 1 bit : select initial parameter signal
// Latency:
//      
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module gen_din_sel(
    input clk,
    input res,
    output din,
    output select_initial
    );
    
    reg din_reg, din_tmp;
    reg select_initial_reg, select_initial_tmp;
    
    always @(posedge clk)
    begin
            select_initial_reg <= res;
//            select_initial_reg <= select_initial_tmp;
//            select_initial_tmp <= res;
    end

    always @(posedge clk)
    begin
        if (res)
        begin
            din_reg <= 1'b1;
            din_tmp <= 1'b1;
        end
        else
            din_reg <= din_tmp;            
    end
    
    assign din = din_reg;
    assign select_initial = select_initial_reg;
endmodule
