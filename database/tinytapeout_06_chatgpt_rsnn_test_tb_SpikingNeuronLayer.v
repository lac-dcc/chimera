// This program was cloned from: https://github.com/Andreou-JHULabOrg/tinytapeout_06_chatgpt_rsnn
// License: Apache License 2.0

`timescale 1ns / 1ps

module tb_SpikingNeuronLayer;

// Inputs
reg clk;
reg reset;
reg enable;
reg [2:0] input_spikes;
reg [71:0] input_weights;
reg [31:0] neuron_params;

// Outputs
wire [2:0] spike_out;

// Instantiate the Unit Under Test (UUT)
SpikingNeuronLayer uut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .input_spikes(input_spikes),
    .input_weights(input_weights),
    .neuron_params(neuron_params),
    .spike_out(spike_out)
);

// Clock generation
always #10 clk = ~clk;  // Generate a clock with a period of 20 ns

initial begin
    // Initialize Inputs
    clk = 0;
    reset = 1;
    enable = 0;
    input_spikes = 0;
    input_weights = 0;
    neuron_params = 0;

    // Wait for global reset to finish
    #100;
    reset = 0;

    // Test Case 1: Basic functionality test
    enable = 1;
    neuron_params = {8'd50, 8'd5, 8'd2, 8'd10};
    input_weights = {8'd10, 8'd15, 8'd20, 8'd25, 8'd30, 8'd35, 8'd40, 8'd45, 8'd50};
    input_spikes = 3'b101;
    #40;
    input_spikes = 3'b010;
    #40;
    input_spikes = 3'b111;
    #40;

    // Test Case 2: Check behavior under reset
    reset = 1;
    #20;
    reset = 0;
    #20;

    // Test Case 3: Testing with zero weights
    input_weights = 72'd0;  // All weights set to zero
    input_spikes = 3'b111;
    #40;

    // Test Case 4: Test with high threshold
    neuron_params = {8'd200, 8'd5, 8'd2, 8'd10};  // Set threshold very high
    input_weights = {8'd5, 8'd10, 8'd15, 8'd20, 8'd25, 8'd30, 8'd35, 8'd40, 8'd45};
    input_spikes = 3'b111;
    #40;

    // Test Case 5: Enable disable functionality
    enable = 0;  // Disable updates
    input_spikes = 3'b101;
    #40;
    enable = 1;  // Enable and check for proper operation
    #40;

    // Finish simulation
    $finish;
end

endmodule
