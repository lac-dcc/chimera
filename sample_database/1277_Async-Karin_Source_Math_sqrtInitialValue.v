// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/07/2019 05:42:33 PM
// Module Name: sqrtInitialValue
// Description: The child module of sqrt.
//              When req rises, (initial value of sqrt) -> yo. Then fin rises.
//              This module can generate the initial value for the iteration of sqrt.
//              Width is the bit width of x and yo.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module sqrtInitialValue #(parameter Width=32) (req,fin,x,yo);
input req;
output reg fin=1'b0;
input [Width-1:0] x;
output reg [Width-1:0] yo=0;

reg finish=1'b0;
reg reqBuf=1'b0;
wire [Width:0] x0;
wire [Width-1:0] y;
assign x0={1'b0,x};

always@(posedge finish or posedge fin) begin
    if(fin) fin<=1'b0;
    else fin<=1'b1;
end

genvar i;
generate 
for(i=0;i<Width;i=i+1)
begin:sqrti

    if(i%2==1) begin
         assign y[(i-1)/2]=x0[i]|x0[i+1];
    end
    
    if(Width%2==0) begin
        if(i>=Width/2) assign y[i]=1'b0; 
    end 
    else begin        
        if(i>=(Width-1)/2) assign y[i]=1'b0; 
    end  
end
endgenerate

always@(posedge req or posedge reqBuf) begin
    if(reqBuf) begin
       yo<=y;
       reqBuf<=1'b0;
       finish<=1'b1;
    end
    else begin
       yo<=0;
       reqBuf<=1'b1;
       finish<=1'b0;
    end
end

endmodule
