// This program was cloned from: https://github.com/Andreou-JHULabOrg/tinytapeout_06_chatgpt_rsnn
// License: Apache License 2.0

`timescale 1ns / 1ps

module RSNN_TopModule_tb;

    // Inputs
    reg [2:0] input_spikes;
    reg clk;
    reg reset;
    reg system_enable;
    reg spike_input_reg_enable;
    reg RSNN_enable;
    reg data_in;
    reg load_params;

    // Outputs
    wire [2:0] output_spikes;
    wire end_writing;
    wire data_written;

    // Instantiate the Unit Under Test (UUT)
    RSNN_TopModule uut (
        .input_spikes(input_spikes),
        .clk(clk),
        .reset(reset),
        .system_enable(system_enable),
        .spike_input_reg_enable(spike_input_reg_enable),
        .RSNN_enable(RSNN_enable),
        .data_in(data_in),
        .load_params(load_params),
        .output_spikes(output_spikes),
        .end_writing(end_writing),
        .data_written(data_written)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate a clock with a period of 10ns
    end

    // Initial Conditions and Test Stimuli
    initial begin
        // Initialize Inputs
        input_spikes = 0;
        reset = 1;
        system_enable = 0;
        spike_input_reg_enable = 0;
        RSNN_enable = 0;
        data_in = 0;
        load_params = 0;

        // Wait for global reset to propagate
        #10;
        reset = 0; // Release reset
        system_enable = 1; // Enable the system
        spike_input_reg_enable = 1;
        RSNN_enable = 1;
        load_params = 1;

        // Case 1: Normal operation with input spikes
        #20;
        input_spikes = 3'b101;
        data_in = 1;

        // Case 2: Change in input spikes
        #30;
        input_spikes = 3'b011;

        // Case 3: Toggle load parameters while running
        #40;
        load_params = 0;
        #10;
        load_params = 1;
        data_in = 0;

        // Case 4: System disable and re-enable
        #50;
        system_enable = 0;
        spike_input_reg_enable = 0;
        RSNN_enable = 0;
        #10;
        system_enable = 1;
        spike_input_reg_enable = 1;
        RSNN_enable = 1;

        // Case 5: RSNN module disable and re-enable
        #70;
        RSNN_enable = 0;
        #10;
        RSNN_enable = 1;

        // Case 6: Testing with spikes off
        #80;
        input_spikes = 3'b000;

        // Case 7: Random spikes and toggling data_in
        #90;
        input_spikes = $random;
        data_in = $random;

        // Finish simulation
        #100;
        $finish;
    end

    // Monitor changes on key outputs
    initial begin
        $monitor("At time %t, output_spikes = %b, end_writing = %b, data_written = %b", $time, output_spikes, end_writing, data_written);
    end

endmodule
