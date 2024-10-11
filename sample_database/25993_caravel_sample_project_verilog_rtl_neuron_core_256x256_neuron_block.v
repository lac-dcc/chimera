// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

module neuron_block (
    input signed [7:0] voltage_potential_i, // Current voltage potential
    input signed [7:0] pos_threshold_i,     // Positive threshold
    input signed [7:0] neg_threshold_i,     // Negative threshold
    input signed [7:0] leak_value_i,        // Leak value
    input signed [7:0] weight_type1_i,      // 1st weight type
    input signed [7:0] weight_type2_i,      // 2nd weight type
    input signed [7:0] weight_type3_i,      // 3rd weight type
    input signed [7:0] weight_type4_i,      // 4th weight type
    input [1:0] weight_select_i,     // Weight selection
    input signed [7:0] pos_reset_i,         // Positive reset
    input signed [7:0] neg_reset_i,         // Negative reset
    input enable_i,                  // Enable signal
    input picture_done_i,
    output reg signed [7:0] new_potential_o, // New voltage potential - changed to reg
    output reg spike_o               // Spike output (1-bit) - changed to reg
);

    reg signed [7:0] selected_weight;
    reg signed [7:0] potential_calc; // changed to reg

    // Adjusted Weight selection
    always @(*) begin
        case(weight_select_i)
            2'd0: selected_weight = weight_type1_i;
            2'd1: selected_weight = weight_type2_i;
            2'd2: selected_weight = weight_type3_i;
            2'd3: selected_weight = weight_type4_i;
            default: selected_weight = 8'b0;
        endcase
    end

    // Neuron logic
    always @(*) begin
        potential_calc = 0;
        spike_o = 0;
        
        if (!picture_done_i) begin 
            if (enable_i == 1) begin
                // Calculate potential
                new_potential_o = voltage_potential_i + selected_weight;
                spike_o = 0;
            end else begin
                new_potential_o = voltage_potential_i;
                spike_o = 0;
            end
        end
    
        else begin
            potential_calc = voltage_potential_i + leak_value_i;
            // Check for spike
            if (potential_calc >= pos_threshold_i) begin
                new_potential_o = pos_reset_i;
                spike_o = 1;
            end else if (potential_calc < neg_threshold_i) begin
                new_potential_o = neg_reset_i;
                spike_o = 0;
            end else begin
                spike_o = 0;
                new_potential_o = voltage_potential_i;
            end
        end
    end

endmodule