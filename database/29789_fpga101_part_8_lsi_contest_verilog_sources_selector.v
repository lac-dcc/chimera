// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    13:48:25 09/06/2017 
// Design Name:    Neural Network (using backpropagation)
// Module Name:    selector
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
// 	selector for enable update when clock = N
// Input:
//		clk				: 1 bit
//		reset 			: 1 bit : high active
//      update_coeff    : 1 bit : high active
// Output: 
//		enable update	: 1 bit : high active
// Latency:
// 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Name : date : what changed
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module selector(
    input clk, 
    input reset, 
    input update_coeff,
	output reg enable_update
    );
  
  reg [7:0] counter;		  //'counter' counts the number of rising edges for system clock
  parameter N=13;    	      //no of clock to for 1 renewal
     
  always @ (posedge clk)
    begin
       if(reset==1)
           begin
             counter <= 4'b0000;
           end
       else 
           begin
             if(counter == (N-1))
                begin
                    counter <= 4'b0000;
                end
             else 
                begin
                    counter <= counter + 4'b0001;
                 end
            end
    end

  //'enable_update' is the sample clock, 'clock' is system clock
  always @(posedge clk) 
    begin
        if (reset==1) 
            begin
                enable_update <= 0;
            end
        else 
            begin
               if ((counter == (N-1)) & (update_coeff == 1'b1)) 
                    begin
                        enable_update <= 1;
                    end
               else
                    begin
                        enable_update <=0;
                    end
            end
    end

endmodule
