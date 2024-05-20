// This program was cloned from: https://github.com/iCAS-Lab/APTPU
// License: MIT License

// MIT License
// 
// Copyright (c) 2021-2024 iCAS Lab
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// Company: iCAS Lab, University of South Carolina
// Engineer: Mohammed E. Elbtity
// Create Date: 02/26/2021 04:21:18 PM
// Design Name: 
// Module Name: fifo
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

`timescale 1ns / 1ps

module fifo #(parameter WIDTH = 8,
              parameter DEPTH = 16,
              parameter ADDRESS = $clog2(DEPTH)
     )       (input clk,
              input rst_n,    
              input wr_en,
              input rd_en, 
              input [WIDTH-1:0] data_in,  
               
              //Outputs
              output reg [WIDTH-1:0] data_out, 
              output empty,    
              output full    
     );
    reg [WIDTH-1:0] memory [0:DEPTH-1]; 
    reg [ADDRESS:0] wr_addr; 
    reg [ADDRESS:0] rd_addr; 
    //reg [WIDTH-1:0] data_out;
    integer i;
 
    //FIFO full and empty flags
    assign empty = ((wr_addr - rd_addr)== 'd0) ? 1'b1 : 1'b0;
    assign full  = ((wr_addr - rd_addr) == DEPTH) ? 1'b1 : 1'b0; 
    
    //FIFO write and read logic 
    always@(posedge clk or negedge rst_n) begin 
        if (!rst_n)  begin
            wr_addr <= 'd0;
            rd_addr  <= 'd0;
            data_out <= 'd0;
            for (i=0;i<DEPTH;i=i+1) begin
                memory[i] <= 'd0;
            end
       end 
     //Simultaneous Read and Write
      else if ((wr_en == 1'b1) &&  (full == 1'b0))  begin
                memory[wr_addr[ADDRESS-1:0]] <= data_in;
                wr_addr <= wr_addr + 1;
      end 
      else if ((rd_en == 1'b1) &&  (empty == 1'b0))  begin
                data_out <= memory[rd_addr[ADDRESS-1:0]];
                rd_addr <= rd_addr + 1;
      end
      else begin 
      
        wr_addr <= wr_addr;
        rd_addr <= rd_addr;
        data_out <= 'd0;
      end
    end

endmodule
