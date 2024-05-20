// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`timescale 1ns/1ns
`include "rom.v"

module rom_tb;

    // Internal parameters
    parameter CLK_PERIOD = 10;

    // Parameters
    parameter WIDTH = 8;
    parameter DEPTH = 2**3;

    // Inputs
    reg clk;
    reg rst_n;
    reg en;
    reg [$clog2(DEPTH)-1:0] addr;

    // Outputs
    wire [WIDTH-1:0] data_out;

    // Instantiate the ROM module
    rom #(WIDTH, DEPTH) dut (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .addr(addr),
        .data_out(data_out)
    );

    // Clock generation
    always #(CLK_PERIOD/2) clk = ~clk;

    // Initialize signals
    initial begin
        clk = 0;
        rst_n = 1;
        en = 1;
        addr = 0;
    end

    // Stimulus
    initial begin
        $dumpfile("rom_tb.vcd" );
        $dumpvars(0, rom_tb);

        // Reset
        #10 rst_n = 0;
        #10 rst_n = 1;

        // Read data from ROM
        for(int i = addr; i < DEPTH; i = i + 1) begin
            #10 addr = addr + 1;
        end
        // #10 addr = 0;
        // #10 addr = 1;
        // ... Continue reading other addresses as needed


        // End simulation
        $finish;
    end

    // Monitor
    always @(posedge clk) begin
        $display("Time=%t, addr=%d, data_out=%b", $time, addr, data_out);
    end

endmodule
