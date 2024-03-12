`define UNIT_DELAY #1
`define USE_POWER_PINS
`include "libs.ref/sky130_fd_sc_hd/verilog/primitives.v"
`include "libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"

`default_nettype none
module test;

    reg clk = 0;
    reg px_clk = 0;
    reg reset_n = 0;
    reg adj_sec = 1'b0;
    reg adj_min = 1'b0;
    reg adj_hrs = 1'b0;
    localparam DAY = 60 * 60 * 60;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test);
        # 400
        reset_n = 1;
        # DAY;
        $finish;
    end

    vga_clock top_0(.VGND(1'b0), .VPWR(1'b1), .clk(px_clk), .reset_n(reset_n), .adj_sec(adj_sec), .adj_min(adj_min), .adj_hrs(adj_hrs));
    always #4 clk = !clk;
    always #1 px_clk = !px_clk;

endmodule
