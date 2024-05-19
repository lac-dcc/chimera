// This program was cloned from: https://github.com/iic-jku/iic-audiodac-v1
// License: Apache License 2.0

`timescale 1ns / 1ns

module sine_generator_tb();
localparam CLK_PERIOD = 1000;
reg clk_tb, rst_n_tb;
reg [3:0] psc_tb;
wire [15:0] sine_tb;

sine_generator DUT (.clk_i(clk_tb),
                    .rst_n_i(rst_n_tb),
                    .psc_i(psc_tb),
                    .sine_o(sine_tb));

always #(CLK_PERIOD/2) clk_tb  = !clk_tb;

initial
begin
    clk_tb = 0;
    rst_n_tb = 0;
    #CLK_PERIOD
    rst_n_tb = 1;
    psc_tb = 4;
    #100000000
    psc_tb = 6;
    #100000000
    psc_tb = 8;
    #100000000
    psc_tb = 10;
    #150000000
    rst_n_tb = 0;
    #CLK_PERIOD
    rst_n_tb = 1;
    #50000000
    $stop;
end

endmodule
