// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

// iverilog clock_divider_tb.v; vvp a.out; gtkwave --save clock_divider_tb.gtkw clock_divider_tb.vcd

`timescale 1ns / 100 ps
`include "../clock_generator/clock_generator.v"
`include "clock_divider.v"

module clock_divider_tb();

    // for clock generator module
    parameter CLK_PERIOD = 20;
    wire sys_clk;

    // for clock divider module
    parameter COUNTER_WIDTH = 8;
    wire div_clk;
    reg rst_n;
    reg [COUNTER_WIDTH-1:0] prescaler;

    // instantiate UUTs
    clock_generator #(.CLK_PERIOD(CLK_PERIOD)) clkgen_uut (.clk(sys_clk));
    clock_divider #(.COUNTER_WIDTH(COUNTER_WIDTH)) clkdiv_uut (.clk_i(sys_clk), .rst_n(rst_n), .prescaler(prescaler), .clk_o(div_clk));

    initial
    begin: tb_process
        $dumpfile("clock_divider_tb.vcd" );
        $dumpvars(0, clock_divider_tb);
        rst_n = 0;  // reset system
        @(posedge sys_clk);
        rst_n = 1;  // release reset
        prescaler = 'd10;
        #1000;
        prescaler = 'd5;
        #1000;
        prescaler = 'd2;
        #1000;
        $finish;
    end

endmodule