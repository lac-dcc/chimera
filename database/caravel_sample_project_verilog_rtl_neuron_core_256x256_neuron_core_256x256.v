// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

/**
 *  Module: neuron_core
 *  
 *  Overview:
 *  The `neuron_core` includes 8 slice to represent a 256x256 SNN core 
 *  
 *  Author: Nguyen Phuong Linh EDABK
 *  Date: Mar 2024
 */

// Memory map
// slice0:          0x3000_0000 - 0x3000_0FFF
// slice1:          0x3000_1000 - 0x3000_1FFF
// slice2:          0x3000_2000 - 0x3000_2FFF
// slice3:          0x3000_3000 - 0x3000_3FFF
// slice4:          0x3000_4000 - 0x3000_4FFF
// slice5:          0x3000_5000 - 0x3000_5FFF
// slice6:          0x3000_6000 - 0x3000_6FFF
// slice7:          0x3000_7000 - 0x3000_7FFF
// choose_weight:   0x3000_0800 - 0x3000_083F
// done_pic:        0x3000_0840


module neuron_core_256x256
(
    `ifdef USE_POWER_PINS
    inout vssd1,    // User area 1 1.8V supply
    inout vccd1,    // User area 1 digital ground
    `endif
    
    input  wire clk,
    input  wire rst,
    
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

    parameter CORE_BASE = 32'h30000000;  // Base address for Synapse Matrix
    parameter PARAM_BASE0 = 32'h30000400;    // Base address for Neuron Parameters
    parameter PADDING_PARAM = 5'h10;         // Padding for Neuron Parameters
    parameter SPIKE_OUT_BASE0 = 32'h30000600; // Base address for Spike Out
    
    parameter CHOOSE_WEIGHT_BASE = 32'h30000800;
    parameter DONE_PIC_ADDR = 32'h30000840;
    parameter CORE_PADDING = 13'h1000;
    parameter NUM_OF_SLICE = 8;               // number of cores

    wire picture_done;
    wire send_spike;
    wire choose_weight;
    wire [1:0] weight_type_o;
    wire [NUM_OF_SLICE-1:0] slice;
    wire [31:0] slave_dat_o [NUM_OF_SLICE:0]; // add 1 extra for choose weight module
    wire [NUM_OF_SLICE:0] slave_ack_o; // add 1 extra for choose weight module

    //core decoder for 8 core
    core_decoder core_decoder (
        .addr(wbs_adr_i),
        .wbs_we_i(wbs_we_i),
        .slice(slice),
        .choose_weight(choose_weight),
        .picture_done(picture_done),
        .send_spike(send_spike)
    );

    //choose_weight base on axon number
    choose_weight #(.BASE_ADDR(CHOOSE_WEIGHT_BASE), .SYNAP_BASE(CORE_BASE)) choose_weight_inst (
        .wb_clk_i(clk),
        .wb_rst_i(rst),
        .wbs_cyc_i(wbs_cyc_i & (choose_weight|send_spike)),
        .wbs_stb_i(wbs_stb_i & (choose_weight|send_spike)),
        .wbs_we_i(wbs_we_i & (choose_weight|send_spike)),
        .wbs_sel_i(wbs_sel_i),
        .wbs_adr_i(wbs_adr_i),
        .wbs_dat_i(wbs_dat_i),
        .wbs_ack_o(slave_ack_o[NUM_OF_SLICE]),
        .wbs_dat_o(slave_dat_o[NUM_OF_SLICE]),
        .weight_type_o(weight_type_o)
    );

    generate
        genvar i;
        for (i = 0; i < NUM_OF_SLICE; i=i+1) begin: slice_instances
            neuron_slice #(.SYNAPSE_BASE(CORE_BASE+(i*CORE_PADDING)),.PARAM_BASE(PARAM_BASE0+i*CORE_PADDING),.PADDING_PARAM(PADDING_PARAM),.SPIKE_OUT_BASE(SPIKE_OUT_BASE0 + i*CORE_PADDING)) neuron_slice_inst (
                .clk(clk),
                .rst(rst),
                .picture_done(picture_done),
                .weight_type_o(weight_type_o),
                .wbs_cyc_i(wbs_cyc_i & slice[i]),
                .wbs_stb_i(wbs_stb_i & slice [i]),
                .wbs_we_i(wbs_we_i & slice[i]),
                .wbs_sel_i(wbs_sel_i),
                .wbs_adr_i(send_spike?(wbs_adr_i + i*CORE_PADDING):wbs_adr_i),
                .wbs_dat_i(wbs_dat_i),
                .wbs_ack_o(slave_ack_o[i]),//doit
                .wbs_dat_o(slave_dat_o[i])//doit 
            );
        end
    endgenerate

    // Conditional assignment for the wbs_dat_o output
    assign wbs_dat_o =  slice[0] ? slave_dat_o[0] :
                        slice[1] ? slave_dat_o[1] :
                        slice[2] ? slave_dat_o[2] : 
                        slice[3] ? slave_dat_o[3] : 
                        slice[4] ? slave_dat_o[4] : 
                        slice[5] ? slave_dat_o[5] : 
                        slice[6] ? slave_dat_o[6] : 
                        slice[7] ? slave_dat_o[7] :  
                        choose_weight ? slave_dat_o[8]:
                       32'b0;

    assign wbs_ack_o = |slave_ack_o;

endmodule
