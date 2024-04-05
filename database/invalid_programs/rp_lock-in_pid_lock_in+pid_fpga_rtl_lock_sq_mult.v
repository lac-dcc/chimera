`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2017 12:13:25
// Design Name: 
// Module Name: sq_mult
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
// Multiplication for square signals.
// In out signal goes in signal with sign changed when ref == 1'b0
// 
//////////////////////////////////////////////////////////////////////////////////


module sq_mult #(parameter R=14)
    (
    input clk,rst,
    input                  ref,
    input  signed [ R-1:0] in,
    output signed [ R-1:0] out
    );
    
    wire  signed [R-1:0] plus_in, minus_in ;
    
    assign plus_in  =  in          ;
    assign minus_in = {R{1'b0}}-$signed(in) ;
    
    assign out = ref ? plus_in : minus_in ; 
    

    
endmodule


/*
sq_mult   #(.R(14)) NAME (.clk(clk),.rst(rst), .ref( 14'd18   ), .in(  IN  ),.out(  OUT  ) );
*/



