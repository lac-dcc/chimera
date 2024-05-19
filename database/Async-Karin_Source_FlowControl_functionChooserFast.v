// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/07/2019 04:25:50 PM
// Module Name: functionChooserFast
// Description: When one of reqs rises, the corresponding sets value rises, then fin rises.
//              A new req can be accepted even when the rst not rises.
//              This module works faster than functionChooser.
//              N is the bit width of reqs and sets.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module functionChooserFast #(parameter N=2) (reqs,sets,fin,rst);
input [N-1:0] reqs;
output reg [N-1:0] sets=0;
output wire fin;
input rst;

reg reset=1'b0;
wire [N:0] reqAndOr;

assign reqAndOr[0]=sets[0];
assign fin=reqAndOr[N];

always@(posedge rst or posedge reset) begin
    if(reset) reset<=1'b0;
    else reset<=1'b1;
end

genvar i;
generate
for(i=0;i<N;i=i+1)
begin: functionChooserFastSub
    always@(posedge reqs[i] or posedge reset) begin
        if(reset) sets[i]<=1'b0;
        else sets[i]<=1'b1;
    end
    assign reqAndOr[i+1]=reqAndOr[i]|sets[i];
end
endgenerate


endmodule
