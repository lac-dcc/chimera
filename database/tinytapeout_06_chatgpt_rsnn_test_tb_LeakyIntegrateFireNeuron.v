// This program was cloned from: https://github.com/Andreou-JHULabOrg/tinytapeout_06_chatgpt_rsnn
// License: Apache License 2.0

`timescale 1ns / 1ps

module tb_LeakyIntegrateFireNeuron;

    // Inputs
    reg clk;
    reg reset;
    reg enable;
    reg [7:0] input_current;
    reg [7:0] threshold;
    reg [7:0] decay;
    reg [7:0] refractory_period;

    // Outputs
    wire spike_out;

    // Instantiate the Unit Under Test (UUT)
    LeakyIntegrateFireNeuron uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .input_current(input_current),
        .threshold(threshold),
        .decay(decay),
        .refractory_period(refractory_period),
        .spike_out(spike_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = !clk;  // Clock period of 20 ns
    end

    // Stimulus application
    initial begin
        // Initialize inputs
        reset = 1; enable = 0;
        input_current = 0; threshold = 127; // Set threshold to max for 8-bit signed
        decay = 1; refractory_period = 10;
        #25 reset = 0; enable = 1; // Release reset and enable

        // Test Case 1: Small input current, no spike expected
        input_current = 10;
        #40;

        // Test Case 2: Sufficient current to trigger a spike
        input_current = 60;
        #20;

        // Test Case 3: Check refractory behavior with high input
        input_current = 60;
        #100;

        // Disable the neuron and check that no updates occur
        enable = 0;
        input_current = 60;
        #40;

        // Re-enable and check response
        enable = 1;
        #20;

        // Test various scenarios with enable toggling
        input_current = 30;
        #100;
        enable = 0;
        #40;
        enable = 1;
        input_current = 75;  // High input to ensure firing when enabled
        #60;

        // Test neuron with reset asserted while enabled
        reset = 1;
        #30;
        reset = 0;
        #40;

        // Continuous input with periodic enabling
        input_current = 15;
        #100;
        enable = 0;
        #40;
        enable = 1;
        #60;

        // Test Case: Low input current, high threshold
        input_current = 5; // Low, consistent input
        $display("Starting test with low input and high threshold at time %t", $time);

        // Monitor when a spike occurs
        fork
            begin
                // Wait for the spike to occur
                wait (spike_out == 1);
                $display("Spike occurred at time %t with low input current", $time);
                #60;
                $finish; // Optionally finish the simulation here or let it run longer
            end
            begin
                // Let this run for a simulated maximum time if no spike occurs
                #10000;
                $display("No spike after 10000ns with low input current");
                $finish;
            end
        join
        #60;
    end

    // Optional: Monitoring changes
    initial begin
        $monitor("Time = %t, Input Current = %d, Membrane Potential = %d, Spike = %b", $time, input_current, uut.membrane_potential, spike_out);
    end

endmodule
