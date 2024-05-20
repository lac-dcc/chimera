// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

// Memory map
// synapse_matrix: 0x3000_0000 - 0x3000_03FF
// param0:         0x3000_0400 - 0x3000_040B
// ...
// param31:        0x3000_05F0 - 0x3000_05FB
// spike_out:      0x3000_0600 - 0x3000_0603


module slice_decoder (
    input [31:0] addr,
    output reg synap_matrix,
    output reg [4:0] param_num,   // Will be valid only if address is in param range
    output reg neuron_spike_out_select,
    output reg param
);

    always @(addr) begin
        // Default outputs to 0
        synap_matrix = 0;
        param = 0;
        param_num = 5'b0;
        neuron_spike_out_select = 1;

        // Decode based on addr[10:9] 
        if(addr[10])begin
            if (addr[9]) begin
                if (addr[8:0]==0) neuron_spike_out_select = 1; // => 0x3000_0600 => bits [11:8] = 6 = 0110
                else synap_matrix = 1;
            end
            else begin
                param = 1;
                param_num = addr[8:4];
            end
        end
        else synap_matrix = 1;
    end

endmodule
