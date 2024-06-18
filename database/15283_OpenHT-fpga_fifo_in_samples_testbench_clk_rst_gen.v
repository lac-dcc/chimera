// This program was cloned from: https://github.com/M17-Project/OpenHT-fpga
// License: GNU General Public License v3.0

`ifndef _CLK_RST_GEN_
`define _CLK_RST_GEN_

`timescale 1 ns / 1 ns

module clk_rst_gen # (
    parameter CLK_PERIOD0 = 10,
    parameter CLK_PERIOD1 = 10,
    parameter RST_GEN     = 35,
    parameter TIMEOUT     = 1000000
)(
    output reg clk0_o,
    output reg clk1_o,
    output reg rst_o,
    output reg rst_n_o
);

initial begin
    clk0_o <= 1'b0;
    forever #CLK_PERIOD0 clk0_o <= ~clk0_o;
end

initial begin
    clk1_o <= 1'b0;
    forever #CLK_PERIOD1 clk1_o <= ~clk1_o;
end

initial begin
    rst_o   <= 1'b1;
    rst_n_o <= 1'b0;
    #RST_GEN;
    rst_o   <= 1'b0;
    rst_n_o <= 1'b1;
end

initial begin
    #TIMEOUT;
    $display("Simulation Timeout");
    $finish;
end

endmodule
`endif
