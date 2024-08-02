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
    assign LEDR[0] = 1'b0;

    dff_async_rst_n_param 
    #(
        .WIDTH ( 8     ), 
        .RESET ( 8'hf0 )
    ) 
    dff_async_rst_n_param
    (
        .clk   ( ~KEY  [0]   ),
        .rst_n (  SW   [0]   ),
        .d     (  SW   [9:1] ),
        .q     (  LEDR [9:1] )
    );

endmodule
