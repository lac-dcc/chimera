`timescale 1 ns / 100 ps

/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   Testbench for problem set #05
*/

module testbench();

top top(clk, DS_EN1, DS_EN2, DS_EN3, DS_EN4, DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G);

initial begin
    $dumpvars;
    #1000 $finish;
end

endmodule
