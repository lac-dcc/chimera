// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module complement_2s(
    input [3:0] data,
    output signed [3:0] out
    );
    wire [3:0]temp;
    assign temp= 4'b1111 - data;
    assign out= temp + 4'b0001; 
    
endmodule
