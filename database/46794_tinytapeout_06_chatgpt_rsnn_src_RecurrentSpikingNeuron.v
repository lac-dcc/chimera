// This program was cloned from: https://github.com/Andreou-JHULabOrg/tinytapeout_06_chatgpt_rsnn
// License: Apache License 2.0

module RecurrentSpikingNeuron(
    input wire clk,                          // Clock signal
    input wire reset,                        // Asynchronous reset, active high
    input wire enable,                       // Enable input for updating the neuron
    input wire [7:0] external_input_current, // External input current
    input wire [7:0] threshold,              // Firing threshold (V_thresh)
    input wire [7:0] decay,                  // Decay value adjusted based on membrane potential sign
    input wire [7:0] refractory_period,      // Refractory period in number of clock cycles
    input wire [7:0] feedback_scale,         // Feedback scaling factor for the output spike
    output wire spike_out                    // Output spike signal
);

    // Internal connections and signals
    wire [7:0] input_current;          // Combined input current to the LIF neuron
    wire spike_internal;               // Internal spike output from the LIF neuron

    // Instance of the LeakyIntegrateFireNeuron
    LeakyIntegrateFireNeuron lif_neuron(
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .input_current(input_current),
        .threshold(threshold),
        .decay(decay),
        .refractory_period(refractory_period),
        .spike_out(spike_internal)
    );

    // Correctly extending the sign for the feedback scale and external input current
    wire signed [8:0] scaled_spike = spike_internal ? {{1{feedback_scale[7]}}, feedback_scale} : 9'sb0;
    wire signed [8:0] extended_external_input_current = {{1{external_input_current[7]}}, external_input_current};
    wire signed [8:0] total_current = extended_external_input_current + scaled_spike;

    // Handle overflow and underflow in an 8-bit 2's complement format
    assign input_current = (total_current > 127) ? 8'h7F :
                           (total_current < -128) ? 8'h80 : total_current[7:0];

    // Output spike handling
    assign spike_out = spike_internal;

endmodule
