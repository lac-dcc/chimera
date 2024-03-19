`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2016 12:11:16
// Design Name: 
// Module Name: sat14
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
// Saturation preotection with real-time configurable params
//
//////////////////////////////////////////////////////////////////////////////////



//(* keep_hierarchy = "yes" *) 
module sat14 #(
   parameter     RES = 14
)
(
    //input clk,rst,
    input  signed [RES-1:0] in,    // input signal
    input         [RES-1:0] lim,   // limit
    output signed [RES-1:0] out    // output signal
    );
    
    wire [RES-1:0] shifted_in_pos,shifted_in_neg, mask;
    wire pos_sat, neg_sat;
    
    assign mask = {RES{1'b1}}<<lim ;
    
    assign shifted_in_pos = in>>lim  ;
    assign shifted_in_neg = (~in)>>lim  ;
    
    assign pos_sat = ( 2'b01 == { in[RES-1] , |shifted_in_pos } ) ;
    assign neg_sat = ( 2'b11 == { in[RES-1] , |shifted_in_neg } ) ;
    
    
    assign out = pos_sat ?  ( ~mask )    : 
                 neg_sat ?     mask      : 
                 in ;
    
endmodule

/* 
Instantiation example:

sat14 #(.RES(64)) i_sat14_int ( .in(int_sum), .lim(sat_int), .out(int_sum_sat) );



Documentation reference


out limits for each lim input 

 lim  |    min  |   max 
   0  |     -1  |     0
   1  |     -2  |     1
   2  |     -4  |     3
   3  |     -8  |     7
   4  |    -16  |    15
   5  |    -32  |    31
   6  |    -64  |    63
   7  |   -128  |   127
   8  |   -256  |   255
   9  |   -512  |   511
  10  |  -1024  |  1023
  11  |  -2048  |  2047
  12  |  -4096  |  4095
  13  |  -8192  |  8191

*/


