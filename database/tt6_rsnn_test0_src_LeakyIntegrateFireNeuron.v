// This program was cloned from: https://github.com/PaolaUniSa/tt6_rsnn_test0
// License: Apache License 2.0

module LeakyIntegrateFireNeuron(
    input wire clk,                          // Clock signal
    input wire reset,                        // Asynchronous reset, active high
    input wire enable,                       // Enable input for updating the neuron
    input wire [7:0] input_current,          // Input current (I_ext)
    input wire [7:0] threshold,              // Firing threshold (V_thresh)
    input wire [7:0] decay,                  // Decay value adjusted based on membrane potential sign
    input wire [7:0] refractory_period,      // Refractory period in number of clock cycles, now 8 bits
    output reg spike_out                // Output spike signal, renamed from 'fired'
);

    reg [7:0] membrane_potential = 8'b0;  // Membrane potential (V_m), initialized to 0
    reg [7:0] refractory_counter = 8'b0;  // Counter to handle the refractory period, initialized to 0
    wire signed [9:0] potential_update;   // Use a wire for immediate calculation, now 10 bits

    // Correctly perform sign extension when computing potential_update
    assign potential_update = $signed({membrane_potential[7], membrane_potential[7], membrane_potential}) +
                              $signed({input_current[7], input_current[7], input_current}) +
                              (membrane_potential[7] ? $signed({decay[7], decay[7], decay}) : -$signed({decay[7], decay[7], decay}));

    always @(posedge clk or posedge reset) begin
        // Initialize spike_out at the beginning of the block
        spike_out <= 1'b0;

        if (reset) begin
            // Reset all states immediately when reset is high, regardless of clock
            membrane_potential <= 8'b0;
            refractory_counter <= 8'b0;
        end else if (enable) begin  // Only update if enabled
            if (refractory_counter > 0) begin
                // Decrement refractory counter if in refractory period
                refractory_counter <= refractory_counter - 1;
            end else begin
                // Use the calculated potential_update to set the new membrane potential
                if (potential_update[9] && potential_update < -128)  // Negative overflow (checks if negative and exceeds 8-bit lower bound)
                    membrane_potential <= 8'b1000_0000; // Set to -128
                else if (potential_update > 127)  // Positive overflow (checks if exceeds 8-bit upper bound)
                    membrane_potential <= 8'b0111_1111; // Set to 127
                else  // No overflow or underflow
                    membrane_potential <= potential_update[7:0];

                if ($signed(membrane_potential) >= $signed(threshold)) begin
                    // Neuron fires
                    spike_out <= 1'b1;
                    membrane_potential <= $signed(membrane_potential) - $signed(threshold); // Subtracting reset
                    refractory_counter <= refractory_period; // Enter refractory period
                end
            end
        end
    end
endmodule
