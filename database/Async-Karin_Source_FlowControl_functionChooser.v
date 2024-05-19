// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/07/2019 03:25:50 PM
// Module Name: functionChooser
// Description: When one of reqs rises, the corresponding sets value rises, then fin rises.
//              Only after rst rises, a new req can be accepted.
//              This module works slower than functionChooserFast.
//              N is the bit width of reqs and sets.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module functionChooser #(parameter N=2) (reqs,sets,fin,rst);
input [N-1:0] reqs;
output reg [N-1:0] sets=0;
output reg fin=1'b0;
input rst;
reg reset=1'b1;
reg [N-1:0] reqSave=0;
wire [N-1:0] reqAnd;
wire [N:0] reqAndOr;
assign reqAndOr[0]=reqAnd[0];

always@(posedge rst or posedge reqAndOr[N]) begin
    if(reqAndOr[N]) reset<=1'b0;
    else reset<=1'b1;
end

always@(posedge reqAndOr[N] or posedge fin) begin
    if(fin) fin<=1'b0;
    else fin<=1'b1;
end

genvar i;
generate
for(i=0;i<N;i=i+1)
begin: functionChooserSub
    always@(posedge reqs[i] or posedge reqAndOr[N]) begin
        if(reqAndOr[N]) reqSave[i]<=1'b0;
        else reqSave[i]<=1'b1;
    end
    always@(posedge reqAndOr[N]) begin
        sets[i]<=reqAnd[i];
    end
    assign reqAndOr[i+1]=reqAndOr[i]|reqAnd[i];
    assign reqAnd[i]=reqSave[i]&reset;
end
endgenerate


endmodule
