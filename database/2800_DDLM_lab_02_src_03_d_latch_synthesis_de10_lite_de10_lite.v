// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module de10_lite
(
    input         ADC_CLK_10,
    input         MAX10_CLK1_50,
    input         MAX10_CLK2_50,

    input  [ 1:0] KEY,
    input  [ 9:0] SW,
    output [ 9:0] LEDR
);

    assign LEDR[9:1] = 8'b0;

    d_latch d_latch
    (
        .clk ( ~KEY [0] ),
        .d   ( ~KEY [1] ),
        .q   (  LEDR[0] )
    );

endmodule
