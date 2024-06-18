// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns/1ps

// Convert gray encoding to binary
module iob_gray2bin #(
    parameter DATA_W = 4
    ) (
    input [DATA_W-1:0] gr,
    output [DATA_W-1:0] bin
    );

    genvar i;

    generate 
        for(i=0;i<DATA_W;i=i+1) begin : gen_bin
            assign bin[i] = ^gr[DATA_W-1:i];
        end
    endgenerate

endmodule
