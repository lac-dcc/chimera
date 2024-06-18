// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

/**
 *  Module: neuron_slice
 *  
 *  Overview:
 *  The `neuron_slice` represent a 256x32 SNN core 
 *  
 *  Author: Nguyen Phuong Linh EDABK
 *  Date: Mar 2024
 */

// Memory map
// synapse_matrix: 0x3000_0000 - 0x3000_03FF
// param0:         0x3000_0400 - 0x3000_040B
// ...
// param31:        0x3000_05F0 - 0x3000_05FB
// spike_out:      0x3000_0600 - 0x3000_0603

module neuron_slice
(
    input  wire clk,
    input  wire rst,
    input picture_done,
    input [1:0] weight_type_o,

    
    // Wishbone interface
    input  wire wbs_cyc_i,
    input  wire wbs_stb_i,
    input  wire wbs_we_i,
    input  wire [3:0] wbs_sel_i,
    input  wire [31:0] wbs_adr_i,
    input  wire [31:0] wbs_dat_i,
    output wire wbs_ack_o,
    output wire [31:0] wbs_dat_o
);

    parameter SYNAPSE_BASE = 32'h30000000;  // Base address for Synapse Matrix
    parameter PARAM_BASE = 32'h30000400;    // Base address for Neuron Parameters
    parameter PADDING_PARAM = 5'h10;        // Padding for Neuron Parameters
    parameter SPIKE_OUT_BASE = 32'h30000600; // Base address for Spike Out

    wire synap_matrix_select;
    wire param_select;
    wire [4:0] param_num; // Change to 5 bits for 32 neuron selection
    wire neuron_spike_out_select;
    wire [31:0] neurons_connections; // Width changed to 32
    wire [31:0] spike_out; // Width changed to 32
    wire external_write_en;

    slice_decoder slice_decoder (
        .addr(wbs_adr_i),
        .synap_matrix(synap_matrix_select),
        .param(param_select),
        .param_num(param_num),
        .neuron_spike_out_select(neuron_spike_out_select)
    );

    wire [31:0] slave_dat_o [33:0];
    wire [33:0] slave_ack_o;

     synapse_matrix #(.BASE_ADDR(SYNAPSE_BASE)) sm (
         .wb_clk_i(clk),
         .wb_rst_i(rst),
         .wbs_cyc_i(wbs_cyc_i & synap_matrix_select),
         .wbs_stb_i(wbs_stb_i & synap_matrix_select),
         .wbs_we_i(wbs_we_i & synap_matrix_select),
         .wbs_sel_i(wbs_sel_i),
         .wbs_adr_i(wbs_adr_i),
         .wbs_dat_i(wbs_dat_i),
         .wbs_ack_o(slave_ack_o[0]),
         .wbs_dat_o(slave_dat_o[0]),
         .neurons_connections_o(neurons_connections)
     );

    generate
        genvar i;
        for (i = 0; i < 32; i = i + 1) begin : neuron_instances
            // wires for interfacing neuron_parameters and neuron_block
            wire [7:0] voltage_potential, pos_threshold, neg_threshold, leak_value;
            wire [7:0] weight_type1, weight_type2, weight_type3, weight_type4;
            wire [7:0] pos_reset, neg_reset;
            wire [7:0] new_potential;

            neuron_parameters #(.BASE_ADDR(PARAM_BASE + i*PADDING_PARAM)) np_inst (
                .wb_clk_i(clk),
                .wb_rst_i(rst),
                .wbs_cyc_i(wbs_cyc_i & param_select & (param_num == i)),
                .wbs_stb_i(wbs_stb_i & param_select & (param_num == i)),
                .wbs_we_i(wbs_we_i & param_select & (param_num == i)),
                .wbs_sel_i(wbs_sel_i),
                .wbs_adr_i(wbs_adr_i),
                .wbs_dat_i(wbs_dat_i),
                .wbs_ack_o(slave_ack_o[i+1]),
                .wbs_dat_o(slave_dat_o[i+1]),
                .ext_voltage_potential_i(new_potential),
//                .ext_write_enable_i(neurons_connections[i]),
                .ext_write_enable_i(neurons_connections[31-i]),
                .voltage_potential_o(voltage_potential),
                .pos_threshold_o(pos_threshold),
                .neg_threshold_o(neg_threshold),
                .leak_value_o(leak_value),
                .weight_type1_o(weight_type1),
                .weight_type2_o(weight_type2),
                .weight_type3_o(weight_type3),
                .weight_type4_o(weight_type4),
                // .weight_select_o(weight_select),
                .pos_reset_o(pos_reset),
                .neg_reset_o(neg_reset)
            );
            
            neuron_block nb_inst (
                .voltage_potential_i(voltage_potential),
                .pos_threshold_i(pos_threshold),
                .neg_threshold_i(neg_threshold),
                .leak_value_i(leak_value),
                .weight_type1_i(weight_type1),
                .weight_type2_i(weight_type2),
                .weight_type3_i(weight_type3),
                .weight_type4_i(weight_type4),
                .weight_select_i(weight_type_o),
                .pos_reset_i(pos_reset),
                .neg_reset_i(neg_reset),
                .new_potential_o(new_potential),
//                .enable_i(neurons_connections[i]),
                .enable_i(neurons_connections[31-i]),
                .picture_done_i(picture_done),
                .spike_o(spike_out[31-i])
            );
        end
    endgenerate

    assign external_write_en = |spike_out;

    neuron_spike_out #(.BASE_ADDR(SPIKE_OUT_BASE)) spike_out_inst (
        .wb_clk_i(clk),
        .wb_rst_i(rst),
        .wbs_cyc_i(wbs_cyc_i & neuron_spike_out_select),
        .wbs_stb_i(wbs_stb_i & neuron_spike_out_select),
        .wbs_we_i(wbs_we_i & neuron_spike_out_select),
        .wbs_sel_i(wbs_sel_i),
        .wbs_adr_i(wbs_adr_i),
        .wbs_dat_i(wbs_dat_i),
        .wbs_ack_o(slave_ack_o[33]), // Index adjusted
        .wbs_dat_o(slave_dat_o[33]),
        .external_spike_data_i(spike_out),
        .external_write_en_i(external_write_en)
    );

    // Conditional assignment for the wbs_dat_o output
    assign wbs_dat_o = synap_matrix_select ? slave_dat_o[0] : 
                       param_select ? slave_dat_o[param_num + 1] :  // Offset by 1 for parameter blocks
                       neuron_spike_out_select ? slave_dat_o[33] : // Index for spike_out block
                       32'b0;

    assign wbs_ack_o = |slave_ack_o;

endmodule
