// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps

module register
    #( 
        parameter WIDTH = 16
    )
    (
        input wire                    clk,
        input wire                    rst_n,
        input wire                    en,
        input wire                    clr,
        input wire signed [WIDTH-1:0] d,
        output reg signed [WIDTH-1:0] q
    );
    
    always @(posedge clk)
    begin
        if (!rst_n || clr)
        begin
            q <= 0;
        end
        else if (en)
        begin
            q <= d;
        end
    end
    
endmodule