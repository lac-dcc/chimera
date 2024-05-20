// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

module neuron_parameters (
    // Wishbone slave interface
    input wb_clk_i,             // Clock
    input wb_rst_i,             // Reset
    input wbs_cyc_i,            // Indicates an active Wishbone cycle
    input wbs_stb_i,            // Active during a valid address phase
    input wbs_we_i,             // Determines read or write operation
    input [3:0] wbs_sel_i,      // Byte lanes selector
    input [31:0] wbs_adr_i,     // Address input
    input [31:0] wbs_dat_i,     // Data input for writes
    output reg wbs_ack_o,       // Acknowledgment for data transfer
    output reg [31:0] wbs_dat_o, // Data output
    
    // New inputs for external write to voltage_potential_o
    input [7:0] ext_voltage_potential_i, // External voltage potential input
    input ext_write_enable_i,            // External write enable signal

    // Neuron-specific outputs
    output [7:0] voltage_potential_o, // Current voltage potential
    output [7:0] pos_threshold_o,     // Positive threshold
    output [7:0] neg_threshold_o,     // Negative threshold
    output [7:0] leak_value_o,        // Leak value
    output [7:0] weight_type1_o,      // 1st weight type
    output [7:0] weight_type2_o,      // 2nd weight type
    output [7:0] weight_type3_o,      // 3rd weight type
    output [7:0] weight_type4_o,      // 4th weight type
    // output [7:0] weight_select_o,     // Weight selection
    output [7:0] pos_reset_o,         // Positive reset
    output [7:0] neg_reset_o          // Negative reset
);

parameter BASE_ADDR = 32'h30001000;  // Base address for this SRAM
reg [31:0] sram [2:0];               // SRAM storage
//reg [31:0] data_next;

wire [1:0] address;
assign address = (wbs_adr_i - BASE_ADDR) >> 2;

//always @(data_next) begin
//    sram[address] = data_next;
//end

// Handling read/write operations and the acknowledgment signal
always @(negedge wb_clk_i or posedge wb_rst_i) begin
    if (wb_rst_i) begin
        wbs_ack_o <= 1'b0;
        wbs_dat_o <= 32'b0;
    end
    else begin
        if (wbs_cyc_i && wbs_stb_i) begin
            if (address >= 0 && address < 3) begin
                if (wbs_we_i) begin
                    // Byte-specific writes based on wbs_sel_i
                    if (wbs_sel_i[0]) sram[address][7:0] <= wbs_dat_i[7:0];
                    if (wbs_sel_i[1]) sram[address][15:8] <= wbs_dat_i[15:8];
                    if (wbs_sel_i[2]) sram[address][23:16] <= wbs_dat_i[23:16];
                    if (wbs_sel_i[3]) sram[address][31:24] <= wbs_dat_i[31:24];
                end
                wbs_dat_o <= sram[address];
                wbs_ack_o <= 1'b1;
            end
        end
        else begin
            wbs_ack_o <= 1'b0;
            
            // New logic for external write to voltage_potential_o
            if (ext_write_enable_i) begin
                sram[2][31:24] <= ext_voltage_potential_i;
            end
        end
    end
end

// Generating the neuron-specific outputs based on the contents of the SRAM
//assign voltage_potential_o = sram[0][7:0];
//assign pos_threshold_o = sram[0][15:8];
//assign neg_threshold_o = sram[0][23:16];
//assign leak_value_o = sram[0][31:24];
//assign weight_type1_o = sram[1][7:0];
//assign weight_type2_o = sram[1][15:8];
//assign weight_type3_o = sram[1][23:16];
//assign weight_type4_o = sram[1][31:24];
//assign pos_reset_o = sram[2][7:0];
//assign neg_reset_o = sram[2][15:8];

assign voltage_potential_o = sram[2][31:24];
assign pos_threshold_o = sram[2][23:16];
assign neg_threshold_o = sram[2][15:8];
assign leak_value_o = sram[2][7:0];
assign weight_type1_o = sram[1][31:24];
assign weight_type2_o = sram[1][23:16];
assign weight_type3_o = sram[1][15:8];
assign weight_type4_o = sram[1][7:0];
assign pos_reset_o = sram[0][31:24];
assign neg_reset_o = sram[0][23:16];

endmodule