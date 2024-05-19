// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
//
// Create Date: 01/14/2020 10:30:02 AM
// Module Name: counter
// Description: A counter made by a shift register. (Do not use it. It's being tested.)
//
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter #(parameter N=10) (addReq,addFin,fin);
input addReq;
output reg addFin=1'b0;
output wire fin;

reg [N-1:0] out=1;
assign fin=out[N-1]; 
 
always@(posedge addReq or posedge addFin or posedge fin) begin
    if(fin) begin
        out<=1;
        addFin<=1'b0;
    end
    else if(addFin) begin
        out<=out;
        addFin<=1'b0;
    end
    else begin
        out<={out<<1,1'b1};
        addFin<=1'b1;
    end
end

endmodule
