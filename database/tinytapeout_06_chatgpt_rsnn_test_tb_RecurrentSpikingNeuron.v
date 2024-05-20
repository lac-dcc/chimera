// This program was cloned from: https://github.com/Andreou-JHULabOrg/tinytapeout_06_chatgpt_rsnn
// License: Apache License 2.0

`timescale 1ns / 1ps

module tb_RecurrentSpikingNeuron;

    // Inputs
    reg clk;
    reg reset;
    reg enable;
    reg [7:0] external_input_current;
    reg [7:0] threshold;
    reg [7:0] decay;
    reg [7:0] refractory_period;
    reg [7:0] feedback_scale;

    // Output
    wire spike_out;

    // Instantiate the RecurrentSpikingNeuron module
    RecurrentSpikingNeuron uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .external_input_current(external_input_current),
        .threshold(threshold),
        .decay(decay),
        .refractory_period(refractory_period),
        .feedback_scale(feedback_scale),
        .spike_out(spike_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz Clock
    end

    // Test Stimuli
    initial begin
        // Initialize Inputs
        reset = 1;
        enable = 0;
        external_input_current = 0;
        threshold = 50; // Example threshold value
        decay = 10;     // Example decay value
        refractory_period = 5; // Example refractory period
        feedback_scale = 20;   // Example feedback scale

        // Reset the system
        #10;
        reset = 0;
        #10;
        reset = 1;
        #10;
        reset = 0;
        enable = 1;

        // Test Case 1: No input current
        #100;
        external_input_current = 0;

        // Test Case 2: Input current below threshold
        #100;
        external_input_current = 40;

        // Test Case 3: Input current above threshold, expect spike
        #100;
        external_input_current = 60;

        // Test Case 4: Input during refractory period
        #50;  // Half the refractory period
        external_input_current = 70;

        // Test Case 5: Check feedback effect
        #100;
        external_input_current = 30; // Scaled feedback should affect this

        // Test Case 6: Disable the neuron
        #100;
        enable = 0;
        external_input_current = 80;

        // Additional Test Cases
        // Test Case 7: Re-enable the neuron with high external input
        #100;
        enable = 1;
        external_input_current = 90;

        // Test Case 8: Change feedback scale during operation
        #100;
        feedback_scale = 80;  // High feedback scale to test larger feedback impact
        external_input_current = 20;

        // Test Case 9: Extreme values for decay and threshold
        #100;
        decay = 255;   // Maximum decay
        threshold = 1; // Very low threshold, should spike easily

        // Test Case 10: Continuous spikes and watch feedback accumulation
        #100;
        external_input_current = 120; // High current to cause continuous spiking
        #400; // Allow for multiple spikes to occur

        // End simulation
        #100;
        $finish;
    end
    
    // Monitoring outputs
    initial begin
        $monitor("Time = %t, Reset = %b, Enable = %b, External Current = %d, Spike Out = %b", 
                 $time, reset, enable, external_input_current, spike_out);
    end

endmodule
