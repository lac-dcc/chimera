// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

// Memory map
// synapse_matrix: 0x3000_0000 - 0x3000_03FF
// param0:         0x3000_1000 - 0x3000_100B
// ...
// param31:        0x3000_11F0 - 0x3000_11FB
// spike_out:      0x3000_2000 - 0x3000_2003
// choose_weight:  0x3000_3000 - 0x3000_303F
// done_pic:       0x3000_3100 


module address_decoder (
    input [31:0] addr,
    output reg synap_matrix,
    output reg [4:0] param_num,   // Will be valid only if address is in param range
    output reg neuron_spike_out,
    output reg param,
    output reg choose_weight,
    output reg picture_done
);

    parameter DONE_PIC_ADDR = 32'h30003100;

    always @(addr) begin
        // Default outputs to 0
        synap_matrix = 0;
        param = 0;
        param_num = 5'b0;
        neuron_spike_out = 0;
        picture_done = 0;
        choose_weight = 0;
        picture_done = 0;

        // Decode based on addr[13:12]
        case(addr[13:12])
            2'b00: synap_matrix = 1;
            2'b01: begin
                param = 1;
                param_num = addr[8:4];
            end
            2'b10:
                neuron_spike_out = 1;
            2'b11: begin
                choose_weight = (addr[8]==0);
                picture_done = (addr==DONE_PIC_ADDR);
            end
            
            default: ; // Do nothing, outputs remain 0
        endcase
    end

endmodule
