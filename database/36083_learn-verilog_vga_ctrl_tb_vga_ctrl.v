// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module tb_vga_ctrl ();

    reg clk;
    reg rst_n;
    reg [15:0] in_rgb;

    vga_ctrl component(
        .clk(clk),
        .rst_n(rst_n),
        .in_rgb(in_rgb)
    );

    initial begin
        clk = 1'b1;
        rst_n = 1'b0;
        in_rgb = 15'b0;
        #10
        rst_n = 1'b1;
        #5000000
        $finish;
    end

    always #1 clk = ~clk;

    always #16 in_rgb = in_rgb + 1'b1;

    initial begin
        $dumpfile("tb_vga_ctrl.vcd");
        $dumpvars(0, component);
    end
endmodule
