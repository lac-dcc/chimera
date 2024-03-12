/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   Trivial module
*/

module lab00_test(
    input wire clk,

    output wire clk1
);

assign clk1 = clk;

endmodule
