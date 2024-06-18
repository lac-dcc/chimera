// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module tb_top ();

    reg clk;
    reg rst_n;
    reg in_data;

    wire [7:0] data;
    wire data_en;

    wire out_data;
    wire out_en;

    uart_rx rx_component (
        .clk (clk),
        .rst_n (rst_n),
        .in_data (in_data),
        .out_data (data),
        .out_en (data_en)
    );

    uart_tx tx_component (
        .clk (clk),
        .rst_n (rst_n),
        .in_data (data),
        .in_en (data_en),
        .out_data (out_data),
        .out_en (out_en)
    );

    initial begin
        clk = 1'b1;
        rst_n = 1'b0;
        in_data = 8'b1;
        #100
        rst_n = 1'b1;
        #20000
        // start 0:
        in_data = 1'b0;
        #104166
        // 01010101:
        in_data = 1'b1;
        #104166
        in_data = 1'b0;
        #104166
        in_data = 1'b1;
        #104166
        in_data = 1'b0;
        #104166
        in_data = 1'b1;
        #104166
        in_data = 1'b0;
        #104166
        in_data = 1'b1;
        #104166
        in_data = 1'b0;
        #104166
        // parity:
        in_data = 1'b1;
        #104166
        // end 1:
        in_data = 1'b1;
        #1300000
        // next byte:
        // start 0:
        in_data = 1'b0;
        #104166
        // 10111100:
        in_data = 1'b0;
        #104166
        in_data = 1'b0;
        #104166
        in_data = 1'b1;
        #104166
        in_data = 1'b1;
        #104166
        in_data = 1'b1;
        #104166
        in_data = 1'b1;
        #104166
        in_data = 1'b0;
        #104166
        in_data = 1'b1;
        #104166
        // parity:
        in_data = 1'b0;
        #104166
        // end 1:
        in_data = 1'b1;
        #104166
        #1300000
        $finish;
    end

    always #10 clk = ~clk;

    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(0, rx_component);
        $dumpvars(1, tx_component);
    end
endmodule
