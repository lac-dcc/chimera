// This program was cloned from: https://github.com/kbob/icebreaker-candy
// License: GNU General Public License v3.0

`default_nettype none

module top_tb();

    reg  CLK;
    wire LEDR_N, LEDG_N;
    integer i;

    top uut(CLK, LEDR_N, LEDG_N);

    initial begin
        $dumpfile("queue.vcd");
        $dumpvars(0, top_tb);
    end

    initial begin
        CLK = 0;
        for (i = 0; i < 5000; i++)
            #1 CLK = ~CLK;
    end

endmodule // top_tb
