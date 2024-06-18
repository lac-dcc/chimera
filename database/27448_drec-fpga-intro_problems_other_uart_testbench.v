// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

`timescale 1 ns / 100 ps

module testbench();
    reg clk = 1'b0; always #1 clk = ~clk;

    reg [0:7]data = 8'b0;
    reg sending = 1'b0;

    wire tx;
    uart_transmitter #(.NATIVE_CLK_FREQUENCY(100000), .BAUDRATE(9600))
        uart_tx(.clk(clk), .sending(sending), .data(data), .tx(tx));

    uart_receiver #(.NATIVE_CLK_FREQUENCY(100000), .BAUDRATE(9600))
        uart_rx(.clk(clk), .rx(tx));

    initial begin
        $dumpvars;
        $display("Test started...");
        data =  15; sending = 1; #2 sending = 0; #256
        data = 121; sending = 1; #2 sending = 0; #256
        data = 170; sending = 1; #2 sending = 0; #256
        data = 255; sending = 1; #2 sending = 0; #256
        data =  79; sending = 1; #2 sending = 0; #256
        data =  32; sending = 1; #2 sending = 0; #256
        #4096 $finish;
    end

endmodule
