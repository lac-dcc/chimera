// This program was cloned from: https://github.com/Andreou-JHULabOrg/tinytapeout_06_chatgpt_rsnn
// License: Apache License 2.0

module ThreeLayerNeuralNetwork(
    input wire clk,                           // Clock signal
    input wire reset,                         // Asynchronous reset, active high
    input wire enable,                        // Enable input for updating the network
    input wire sel_test,            
    input wire [2:0] external_input_spikes,   // External input spikes for the first layer (1 spike per neuron)
    input wire [215:0] input_weights,         // Combined input weights for all three layers
    input wire [95:0] neuron_params,          // Combined neuron parameters for all three layers
    output wire [2:0] output_spikes,           // Output spikes from the last layer's neurons
    output wire [7:0] out_test
);

// Extract neuron parameters for each layer from the combined neuron_params
wire [31:0] params_layer1 = neuron_params[95:64];
wire [31:0] params_layer2 = neuron_params[63:32];
wire [31:0] params_layer3 = neuron_params[31:0];

// Extract weights for each layer from the combined input_weights
wire [71:0] weights_layer1 = input_weights[215:144];
wire [71:0] weights_layer2 = input_weights[143:72];
wire [71:0] weights_layer3 = input_weights[71:0];

// Layer 1 - Inputs are external
wire [2:0] layer1_spikes;
SpikingNeuronLayer_test layer1_test (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .sel_test(sel_test),
    .input_spikes(external_input_spikes),
    .input_weights(weights_layer1),
    .neuron_params(params_layer1),
    .spike_out(layer1_spikes),
    .out_test(out_test)
);

// Layer 2 - Inputs are from Layer 1
wire [2:0] layer2_spikes;
SpikingNeuronLayer layer2 (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .input_spikes(layer1_spikes),
    .input_weights(weights_layer2),
    .neuron_params(params_layer2),
    .spike_out(layer2_spikes)
);

// Layer 3 - Inputs are from Layer 2
SpikingNeuronLayer layer3 (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .input_spikes(layer2_spikes),
    .input_weights(weights_layer3),
    .neuron_params(params_layer3),
    .spike_out(output_spikes)  // Directly assign output from Layer 3 to output_spikes
);

endmodule
