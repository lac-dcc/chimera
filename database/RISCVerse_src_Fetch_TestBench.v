// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps

module Fetch_testbench();

    reg clk, rst, pc_select_execute;
    reg [31:0] pc_target_execute;
    wire [31:0] instruction_fetch, pc_fetch, next_pc_fetch;

    // Instantiate Fetch module
    Fetch fetch_inst(
        .clk(clk),
        .rst(rst),
        .pc_select_execute(pc_select_execute),
        .pc_target_execute(pc_target_execute),
        .instruction_fetch(instruction_fetch),
        .pc_fetch(pc_fetch),
        .next_pc_fetch(next_pc_fetch)
    );

    initial begin
        clk = 1'b0; // Initialize clock to 0
    end

    // Clock generation
    always #5 clk = ~clk;

    // Reset and initial stimulus
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);

        rst <= 1'b0;
        pc_select_execute <= 1'b0;
        pc_target_execute <= 32'h00000000;

        #100;
        rst <= 1'b1;
        #100;
        rst <= 1'b0;
        #100;
        rst <= 1'b1;
        #100;
    end

endmodule
