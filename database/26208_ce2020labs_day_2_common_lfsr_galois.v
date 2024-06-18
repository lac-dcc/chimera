// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

//`timescale 1ns / 1ps

module lfsr_galois 
# (
    parameter WIDTH  = 16,
              TAPS   = 16'b1000000001011,
              INVERT = 0
)
(
    input                    clk,
    input                    reset,
    input                    enable,
    output reg [WIDTH - 1:0] out
);
    wire feedback = out [WIDTH - 1] ^ INVERT;
    
    always @(posedge clk or posedge reset)
        if (reset) 
            out <= { { WIDTH - 1 { 1'b0 } }, 1'b1 };
        else if (enable) 
            out <= { out [WIDTH - 2:0], 1'b0 } ^ (feedback ? TAPS : 0);
endmodule
