// This program was cloned from: https://github.com/PaolaUniSa/tt6_rsnn_test0
// License: Apache License 2.0

module SpikingNeuronLayer_test(
    input wire clk,                          // Clock signal
    input wire reset,                        // Asynchronous reset, active high
    input wire enable,                       // Enable input for updating all neurons
    input wire sel_test,
    input wire [2:0] input_spikes,           // Common spike inputs for all neurons
    input wire [71:0] input_weights,         // Single flattened input containing all weights for three neurons
    input wire [31:0] neuron_params,         // Single input for neuron parameters (threshold, decay, refractory_period, feedback_scale)
    output wire [2:0] spike_out,              // Output spikes from each neuron
    output wire [7:0] out_test
);

// Extracting neuron parameters from the single 32-bit input
wire [7:0] threshold        = neuron_params[31:24];
wire [7:0] decay            = neuron_params[23:16];
wire [7:0] refractory_period = neuron_params[15:8];
wire [7:0] feedback_scale   = neuron_params[7:0];

// Extract individual weights from the single flattened input_weights vector
wire [7:0] weight1_0 = input_weights[71:64];
wire [7:0] weight1_1 = input_weights[63:56];
wire [7:0] weight1_2 = input_weights[55:48];
wire [7:0] weight2_0 = input_weights[47:40];
wire [7:0] weight2_1 = input_weights[39:32];
wire [7:0] weight2_2 = input_weights[31:24];
wire [7:0] weight3_0 = input_weights[23:16];
wire [7:0] weight3_1 = input_weights[15:8];
wire [7:0] weight3_2 = input_weights[7:0];

// Intermediate wires for input current calculation
wire signed [9:0] intermediate_current1, intermediate_current2, intermediate_current3;

assign intermediate_current1 = (input_spikes[0] ? $signed({{2{weight1_0[7]}}, weight1_0}) : 10'sb0) +
                               (input_spikes[1] ? $signed({{2{weight1_1[7]}}, weight1_1}) : 10'sb0) +
                               (input_spikes[2] ? $signed({{2{weight1_2[7]}}, weight1_2}) : 10'sb0);

assign intermediate_current2 = (input_spikes[0] ? $signed({{2{weight2_0[7]}}, weight2_0}) : 10'sb0) +
                               (input_spikes[1] ? $signed({{2{weight2_1[7]}}, weight2_1}) : 10'sb0) +
                               (input_spikes[2] ? $signed({{2{weight2_2[7]}}, weight2_2}) : 10'sb0);

assign intermediate_current3 = (input_spikes[0] ? $signed({{2{weight3_0[7]}}, weight3_0}) : 10'sb0) +
                               (input_spikes[1] ? $signed({{2{weight3_1[7]}}, weight3_1}) : 10'sb0) +
                               (input_spikes[2] ? $signed({{2{weight3_2[7]}}, weight3_2}) : 10'sb0);

// Clamp the intermediate currents to avoid overflow and underflow, then select the 8 LSBs
wire signed [7:0] input_current1, input_current2, input_current3;

assign input_current1 = (intermediate_current1 > 127) ? 127 :
                        (intermediate_current1 < -128) ? -128 : intermediate_current1[7:0];
assign input_current2 = (intermediate_current2 > 127) ? 127 :
                        (intermediate_current2 < -128) ? -128 : intermediate_current2[7:0];
assign input_current3 = (intermediate_current3 > 127) ? 127 :
                        (intermediate_current3 < -128) ? -128 : intermediate_current3[7:0];

// Instantiating three neurons from the RecurrentSpikingNeuron module
RecurrentSpikingNeuron_test neuron1_test(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .sel_test(sel_test),
    .external_input_current(input_current1), 
    .threshold(threshold),
    .decay(decay),
    .refractory_period(refractory_period),
    .feedback_scale(feedback_scale),
    .spike_out(spike_out[0]),
    .out_test(out_test)
);

RecurrentSpikingNeuron neuron2(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .external_input_current(input_current2), 
    .threshold(threshold),
    .decay(decay),
    .refractory_period(refractory_period),
    .feedback_scale(feedback_scale),
    .spike_out(spike_out[1])
);

RecurrentSpikingNeuron neuron3(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .external_input_current(input_current3), 
    .threshold(threshold),
    .decay(decay),
    .refractory_period(refractory_period),
    .feedback_scale(feedback_scale),
    .spike_out(spike_out[2])
);

endmodule

