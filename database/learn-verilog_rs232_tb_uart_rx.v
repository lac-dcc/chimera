// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module tb_uart_rx ();

    reg clk;
    reg rst_n;
    reg in_data;
    wire [7:0] out_data;
    wire out_en;

    uart_rx #(
        .BAUD (2_500_000),
        .SYS_CLK (50_000_000)
    )
    component(
        .clk (clk),
        .rst_n (rst_n),
        .in_data (in_data),
        .out_data (out_data),
        .out_en (out_en)
    );

    reg [7:0] one_byte;

    initial begin
        clk = 1'b1;
        rst_n = 1'b0;
        in_data = 8'b1;
        #10
        rst_n = 1'b1;
        #20
        // receive 01010101:
        one_byte = 8'b01010101;
        // start 0:
        in_data = 1'b0;
        #40
        repeat (8) begin
            in_data = one_byte[0];
            one_byte = one_byte >> 1;
            #40;
        end
        // end 1:
        in_data = 1'b1;
        #40;
        // receive: 10111100:
        one_byte = 8'b10111100;
        // start 0:
        in_data = 1'b0;
        #40;
        repeat (8) begin
            in_data = one_byte[0];
            one_byte = one_byte >> 1;
            #40;
        end
        // end 1:
        in_data = 1'b1;
        #40;
        // receive: 00010000:
        one_byte = 8'b00010000;
        // start 0:
        in_data = 1'b0;
        #40;
        repeat (8) begin
            in_data = one_byte[0];
            one_byte = one_byte >> 1;
            #40;
        end
        // end 1:
        in_data = 1'b1;
        #40;
        // receive: 11101111:
        one_byte = 8'b11101111;
        // start 0:
        in_data = 1'b0;
        #40;
        repeat (8) begin
            in_data = one_byte[0];
            one_byte = one_byte >> 1;
            #40;
        end
        // end 1:
        in_data = 1'b1;
        #40;
        #100;
        $finish;
    end

    always #1 clk = ~clk;

    initial begin
        $dumpfile("tb_uart_rx.vcd");
        $dumpvars(0, component);
    end
endmodule
