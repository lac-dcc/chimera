// This program was cloned from: https://github.com/suyashmahar/RISC-processor
// License: MIT License

`timescale 1ns / 1ps

module pc_testbench;
    parameter ARCHITECTURE = 32;
    reg     rst_i;
    reg     clk_i;
    wire    [ARCHITECTURE-1:0]  pc_o;

    ProgramCounter #(32) program_counter_test_instance (
        .rst_i(rst_i),
        .clk_i(clk_i),
        .pc_o(pc_o)
    );

    initial begin
        clk_i = 0;
        rst_i = 0;

        #10
        // Initialize PC to zero
        rst_i = 1'b1;
        #10 clk_i = ~clk_i;
        #10 clk_i = ~clk_i;

        #10
        // Increment PC
        rst_i = 1'b0;
        #10 clk_i = ~clk_i;
        #10 clk_i = ~clk_i;

        #10 clk_i = ~clk_i;
        #10 clk_i = ~clk_i;

        #10 clk_i = ~clk_i;
        #10 clk_i = ~clk_i;

        #10 clk_i = ~clk_i;
        #10 clk_i = ~clk_i;
    end

endmodule
