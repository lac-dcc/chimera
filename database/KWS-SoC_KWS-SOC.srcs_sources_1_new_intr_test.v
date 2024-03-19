`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/14 16:17:33
// Design Name: 
// Module Name: intr_test
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


module intr_test(
input clk,
input intr,
input rst,
output reg [5:0] light

    );

reg intr_ff;

always@(posedge clk or negedge rst)
begin
    if(!rst)
        intr_ff<=0;
     else
        intr_ff<= intr;
end

wire intr_posedge;
wire intr_negedge;

assign intr_posedge = intr && (!intr_ff);
assign intr_negedge = (!intr) && (intr_ff);

always@(posedge clk or negedge rst)
begin
    if (rst==1'b0)
    begin
        light[0]<=1'b0;
    end
    else if(intr_posedge==1'b1)
        light[0]<=1'b1;
    else;
end

always@(posedge clk or negedge rst)
begin
    if (rst==1'b0)
    begin
        light[1]<=1'b0;
    end
    else if(intr_negedge==1'b1)
        light[1]<=1'b1;
    else;
end

always@(posedge clk or negedge rst)
begin
    if(rst == 1'b0)
        light[2]<=1'b0;
    else
        light[2]<=intr;
end

always@(posedge intr or negedge rst)
begin
    if(!rst)
        light[3]<=1'b0;
     else
        light[3]<=1'b1;
end

always@(negedge intr or negedge rst)
begin
    if(!rst)
        light[4]<=1'b0;
     else
        light[4]<=1'b1;
end

always@(posedge intr_posedge or negedge rst)
begin
    if(!rst)
        light[5]<=1'b0;
     else
        light[5]<=1'b1;
end

endmodule
