// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

module neuron_spike_out (
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

    // External spike data inputs
    input [31:0] external_spike_data_i,
    input external_write_en_i
);

parameter BASE_ADDR = 32'h30002000;  // Base address for this SRAM
reg [31:0] sram;                      // SRAM storage for spikes (single word now)
reg [31:0] data_next;
reg wb_write;

wire [31:0] address;                  // 32-bit address signal
assign address = (wbs_adr_i - BASE_ADDR) >> 2;


// Handling read/write operations, the acknowledgment signal, and the external spike update
always @(negedge wb_clk_i or posedge wb_rst_i) begin
    if (wb_rst_i) begin
        wbs_ack_o <= 1'b0;
        wbs_dat_o <= 32'b0;
        wb_write <= 0;
    end
    else if (wbs_cyc_i && wbs_stb_i) begin
        if (address == 32'd0) begin  // Only one address location now
        wbs_ack_o <= 1'b1;
        
            if (wbs_we_i) begin
                wb_write <= 1;
                // Byte-specific writes based on wbs_sel_i
                if (wbs_sel_i[0]) data_next[7:0] <= wbs_dat_i[7:0];
                if (wbs_sel_i[1]) data_next[15:8] <= wbs_dat_i[15:8];
                if (wbs_sel_i[2]) data_next[23:16] <= wbs_dat_i[23:16];
                if (wbs_sel_i[3]) data_next[31:24] <= wbs_dat_i[31:24];
            end
            else wbs_dat_o <= sram;
            

        end
    end 
    else begin
    end
end

always @(external_write_en_i, wb_write) begin
    if(external_write_en_i) sram = external_spike_data_i;
    else if (wb_write) sram = data_next;
end
    
endmodule
