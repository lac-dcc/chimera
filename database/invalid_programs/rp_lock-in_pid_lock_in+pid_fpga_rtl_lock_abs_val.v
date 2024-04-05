`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//  This modules generate an output that is the absolute value of input.
// 
//////////////////////////////////////////////////////////////////////////////////

module abs_val #(parameter R=14)
   (
    input  signed [ R-1:0]  in,
    output        [ R-2:0]  out,
    output        [ R-1:0]  outR,
   );
   
   wire signed [ R-1:0] tmp ;
   
   assign  tmp =  &(in^{ 1'b0 , {R-2{1'b1}} } ) ?  { 1'b0 , {R-1{1'b1}} } :
                  in[R-1]                       ?  (~in[R-2:0]) + 1'b1    :
                  { 1'b0 , in[R-2:0] } ;
   assign  out  = tmp[R-2:0] ;
   assign  outR = tmp[R-1:0] ;
endmodule
