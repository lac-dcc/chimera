// This program was cloned from: https://github.com/FPGADude/Digital-Design
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module bin2bcd(
    input [3:0] bin_in,
    output reg tens,
    output reg [3:0] ones
    );
    
    always @* begin
        tens = bin_in / 10;
        ones = bin_in % 10;
    end
    
endmodule
