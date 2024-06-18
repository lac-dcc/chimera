// This program was cloned from: https://github.com/PaolaUniSa/tt6_rsnn_test0
// License: Apache License 2.0

`timescale 1ns / 1ps

module tb_ThreeLayerNeuralNetwork;

    // Inputs to the ThreeLayerNeuralNetwork
    reg clk;
    reg reset;
    reg enable;
    reg [2:0] external_input_spikes;
    reg [215:0] input_weights;
    reg [95:0] neuron_params;

    // Output from the ThreeLayerNeuralNetwork
    wire [2:0] output_spikes;

    // Instantiate the module
    ThreeLayerNeuralNetwork neural_network (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .external_input_spikes(external_input_spikes),
        .input_weights(input_weights),
        .neuron_params(neuron_params),
        .output_spikes(output_spikes)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock with a period of 10ns
    end

    // Test stimulus
    initial begin
        // Initialize Inputs
        reset = 1;
        enable = 0;
        external_input_spikes = 0;
        input_weights = 0;
        neuron_params = 0;

        // Wait for global reset to finish
        #100;
        
        // Deactivate reset
        reset = 0;
        #10;

        // Enable the network
        enable = 1;

        // Test case 1: Simple spike propagation
        external_input_spikes = 3'b101;  // Example spike pattern
        input_weights = 216'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;  // Example weights (all enabled)
        neuron_params = 96'hFFFFFFFFFFFFFFFFFFFFFFFF;  // Example neuron parameters (max values)
        #50;  // Wait for some time to simulate the propagation through the layers

        // Test case 2: No spikes
        external_input_spikes = 3'b000;
        #50;

        // Test case 3: Changing weights
        external_input_spikes = 3'b111;
        input_weights = 216'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;  // Different pattern for weights
        neuron_params = 96'hAAAAAAAABBBBBBBBBCCCCCCCC;  // Different pattern for neuron parameters
        #50;

        // Test case 4: Disable the network temporarily
        enable = 0;
        external_input_spikes = 3'b101;
        #20;
        enable = 1;
        #30;

        // Test case 5: Full activation
        external_input_spikes = 3'b111;
        input_weights = 216'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        neuron_params = 96'hFFFFFFFFFFFFFFFFFFFFFFFF;
        #50;

        // Finish simulation
        $finish;
    end

    // Optional: Monitor changes
    initial begin
        $monitor("Time = %t, Reset = %b, Enable = %b, External Input Spikes = %b, Output Spikes = %b",
                 $time, reset, enable, external_input_spikes, output_spikes);
    end

endmodule
