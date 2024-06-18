// This program was cloned from: https://github.com/amoudgl/iir-bandstop-filter
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Abhinav Moudgil
//////////////////////////////////////////////////////////////////////////////////
module pipelined_iir(clk, reset, x, y) ;

output wire signed [31:0] y;
input wire signed [31:0] x;

// filter coefficients
wire signed [31:0] b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13,
                   a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13;
input wire clk, reset ;

// filter variables
wire signed [63:0] b1_in, b2_in, b3_in, b4_in, b5_in, b6_in, b7_in, b8_in, b9_in, b10_in, b11_in, b12_in, b13_in;
wire signed [63:0] a2_out, a3_out, a4_out, a5_out, a6_out, a7_out, a8_out, a9_out, a10_out, a11_out, a12_out, a13_out;

// history pipeline regs
reg signed [63:0] f1_n1, f1_n2, f1_n3, f1_n4, f1_n5, f1_n6, f1_n6, f1_n7, f1_n8, f1_n9, f1_n10, f1_n11, f1_n12; 
// history pipeline inputs
wire signed [63:0] f1_n1_input, f1_n2_input, f1_n3_input, f1_n4_input, f1_n5_input, f1_n6_input, f1_n7_input, 
                   f1_n8_input, f1_n9_input, f1_n10_input, f1_n11_input, f1_n12_input, f1_n0; 

// filter coefficients values
assign a2 = -8218189;
assign a3 = 32107544;
assign a4 = -81217352;
assign a5 = 147076592;
assign a6 = -199990256;
assign a7 = 208937824;
assign a8 = -168854944;
assign a9 = 104844152;
assign a10 = -48879952;
assign a11 = 16314139;
assign a12 = -3525584;
assign a13 = 379931;

assign b1 = 631178;
assign b2 = -5401947;
assign b3 = 23050644;
assign b4 = -63646908;
assign b5 = 125716872;
assign b6 = -186294288;
assign b7 = 211911376;
assign b8 = -186294288;
assign b9 = 125716872;
assign b10 = -63646908;
assign b11 = 23050644;
assign b12 = -5401947;
assign b13 = 631178;

// update filter variables
assign b1_in = b1*x;
assign b2_in = b2*x;
assign b3_in = b3*x;
assign b4_in = b4*x;
assign b5_in = b5*x;
assign b6_in = b6*x;
assign b7_in = b7*x;
assign b8_in = b8*x;
assign b9_in = b9*x;
assign b10_in = b10*x;
assign b11_in = b11*x;
assign b12_in = b12*x;
assign b13_in = b13*x;

assign a2_out = a2*f1_n0;
assign a3_out = a3*f1_n0;
assign a4_out = a4*f1_n0;
assign a5_out = a5*f1_n0;
assign a6_out = a6*f1_n0;
assign a7_out = a7*f1_n0;
assign a8_out = a8*f1_n0;
assign a9_out = a9*f1_n0;
assign a10_out = a10*f1_n0;
assign a11_out = a11*f1_n0;
assign a12_out = a12*f1_n0;
assign a13_out = a13*f1_n0;

// add operations
assign f1_n1_input = b2_in + f1_n2 - a2_out;
assign f1_n2_input = b3_in + f1_n3 - a3_out;
assign f1_n3_input = b4_in + f1_n4 - a4_out;
assign f1_n4_input = b5_in + f1_n5 - a5_out;
assign f1_n5_input = b6_in + f1_n6 - a6_out;
assign f1_n6_input = b7_in + f1_n7 - a7_out;
assign f1_n7_input = b8_in + f1_n8 - a8_out;
assign f1_n8_input = b9_in + f1_n9 - a9_out;
assign f1_n9_input = b10_in + f1_n10 - a10_out;
assign f1_n10_input = b11_in + f1_n11 - a11_out;
assign f1_n11_input = b12_in + f1_n12 - a12_out;
assign f1_n12_input = b13_in - a13_out;

// scale the output and turncate for audio codec
assign f1_n0 = (f1_n1 + b1_in) >>> 20;
assign y = f1_n0;

// Run the filter state machine at audio sample rate
always @ (negedge clk) 
begin
    if (reset)
    begin
        f1_n1 <= 0;
        f1_n2 <= 0; 
        f1_n3 <= 0;
        f1_n4 <= 0;
        f1_n5 <= 0;
        f1_n6 <= 0; 
        f1_n7 <= 0;
        f1_n8 <= 0; 
        f1_n9 <= 0;
        f1_n10 <= 0;
        f1_n11 <= 0;
        f1_n12 <= 0;            
    end
    else 
    begin
        f1_n1 <= f1_n1_input;
        f1_n2 <= f1_n2_input;  
        f1_n3 <= f1_n3_input;
        f1_n4 <= f1_n4_input;
        f1_n5 <= f1_n5_input;
        f1_n6 <= f1_n6_input;      
        f1_n7 <= f1_n7_input;
        f1_n8 <= f1_n8_input;  
        f1_n9 <= f1_n9_input;
        f1_n10 <= f1_n10_input;
        f1_n11 <= f1_n11_input;
        f1_n12 <= f1_n12_input;            
    end
end 
endmodule
