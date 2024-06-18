// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    13:48:25 09/06/2017 
// Design Name: Neural Network (using backpropagation)
// Module Name:    counter
// Project Name: LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
// 	counter for signal to insert in k1, k2, t1 and t2
// Input:
//		clk				: 1 bit
//		reset 			: 1 bit : high active
// Output: 
//		out				: 4 bits 0000 unsigned: active after during renewal of parameter
//      finish_updating : 1 bit  : 
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
module counter (  input clk,
                  input reset,
                  output reg [3:0] out,
                  output reg finish_updating);
  parameter N=13;                        // Number of clock for 1 renewal
  parameter M=10000;                     // Number of updating 
  
  reg [15:0] Nupdate;
 
  always @ (posedge clk) begin
    if (reset==1)
      out <= 0;
    else if(out==(N-1))
      out <= 4'b0000;
    else 
      out <= out + 4'b0001;
  end
  
  always @ (posedge clk) begin
    if (reset==1)
    begin
      Nupdate <= 0;
      finish_updating <= 0;
    end
    else if(out==(N-1))
    begin
        if(Nupdate == (M-1))
        begin
            finish_updating <= 1;
            Nupdate <= Nupdate;
        end
        else
        begin
              Nupdate <= Nupdate + 16'd1;
              finish_updating <= finish_updating;
        end
    end
    else
    begin 
      Nupdate <= Nupdate;
      finish_updating <= finish_updating;
    end
  end
  
endmodule 