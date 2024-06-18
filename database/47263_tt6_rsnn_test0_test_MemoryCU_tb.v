// This program was cloned from: https://github.com/PaolaUniSa/tt6_rsnn_test0
// License: Apache License 2.0

`timescale 1ns / 1ps

module MemoryCU_tb;

    // Test Bench Signals
    reg clk_tb;
    reg rst_tb;
    reg enable_tb;
    reg load_params_tb;
    wire params_reg_enable_tb;

    // Instantiate the MemoryCU module
    MemoryCU dut (
        .clk(clk_tb),
        .rst(rst_tb),
        .enable(enable_tb),
        .load_params(load_params_tb),
        .params_reg_enable(params_reg_enable_tb)
    );

    // Clock Generation
    initial begin
        clk_tb = 0;
        forever #5 clk_tb = !clk_tb; // 100 MHz Clock
    end

    // Test Stimulus
    initial begin
        // Initialize Inputs
        rst_tb = 1;
        enable_tb = 0;
        load_params_tb = 0;

        // Reset the system
        #10;
        rst_tb = 0;
        #10;
        rst_tb = 1;
        #10;
        rst_tb = 0;

        // Test Sequence
        // 1. Enable the FSM and attempt to write
        enable_tb = 1;
        load_params_tb = 1;  // Trigger loading parameters
        #20;
        load_params_tb = 0;
        #40;  // Wait for FSM to process

        // 2. Disable the FSM
        enable_tb = 0;
        #10;

        // 3. Enable again without load_params
        enable_tb = 1;
        #30;

        // 4. Enable with load_params again
        load_params_tb = 1;
        #20;
        load_params_tb = 0;
        #20;

        // Finish Simulation
        $finish;
    end

    // Monitor Outputs and State Changes
    initial begin
        $monitor("Time = %t, rst = %b, enable = %b, load_params = %b, state = %b, params_reg_enable = %b",
                 $time, rst_tb, enable_tb, load_params_tb, dut.current_state, params_reg_enable_tb);
    end

endmodule
