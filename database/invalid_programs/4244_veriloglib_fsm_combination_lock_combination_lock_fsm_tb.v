// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`include "combination_lock_fsm.v"
`timescale 1ns/1ns

module tb_combination_lock_fsm;
    parameter CLK_PERIOD = 10;

    // Inputs
    reg clk;
    reg rst;
    reg zero;
    reg one;

    // Outputs
    wire unlock;

    // Instantiate the combination lock FSM
    combination_lock_fsm uut (
        .clk(clk),
        .rst(rst),
        .zero(zero),
        .one(one),
        .unlock(unlock)
    );

    // Clock generation
    always #(CLK_PERIOD/2) clk = ~clk;

    // Initialize inputs
    initial begin
        clk = 0;
        rst = 1;
        zero = 0;
        one = 0;

        // Reset the lock
        #10 rst = 0;

        // Wait for a few clock cycles
        #20;

        // Test scenario: Enter a wrong combination that starts correctly "01111"
        zero = 1; one = 0; #10;
        zero = 0; one = 1; #10;
        zero = 0; one = 1; #10;
        zero = 0; one = 1; #10;
        zero = 0; one = 1; #10;

        // Test scenario: Enter the correct combination "01011"
        zero = 1; one = 0; #10;
        zero = 0; one = 1; #10;
        zero = 1; one = 0; #10;
        zero = 0; one = 1; #10;
        zero = 0; one = 1; #10;

        // Check if the lock is unlocked
        if (unlock)
            $display("Combination lock unlocked!");
        else
            $display("Combination lock not unlocked!");

        // Finish simulation
        $finish;
    end

endmodule
