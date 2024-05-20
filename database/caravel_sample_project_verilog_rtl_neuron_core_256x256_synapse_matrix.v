// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

module synapse_matrix (
    // Wishbone slave interface
    input wb_clk_i,             // Clock
    input wb_rst_i,             // Reset
    input wbs_cyc_i,            // Indicates an active Wishbone cycle
    input wbs_stb_i,            // Active during a valid address phase
    input wbs_we_i,             // Determines read or write operation
    input [3:0] wbs_sel_i,      // Byte lanes selector (expected as 4'b1111)
    input [31:0] wbs_adr_i,     // Address input
    input [31:0] wbs_dat_i,     // Data input for writes
    output reg wbs_ack_o,       // Acknowledgment for data transfer
    output reg [31:0] wbs_dat_o, // Data output (not used in this module)

    // Synapse matrix specific output
    output [31:0] neurons_connections_o  // Represents connections of an axon with 32 neurons
);

parameter BASE_ADDR = 32'h30000000;
reg [31:0] RAM [255:0];         // SRAM storage for 32-bit word, total 256 words
wire [7:0] address;
assign address = (wbs_adr_i - BASE_ADDR) >> 2;

wire [3:0] we0;
assign we0 = wbs_we_i?wbs_sel_i:4'd0;

always @(posedge wb_clk_i)
    if(wbs_cyc_i & wbs_stb_i) begin
        wbs_dat_o<= RAM[address];
        if(we0[0]) RAM[address][7:0] <= wbs_dat_i[7:0];
        if(we0[1]) RAM[address][15:8] <= wbs_dat_i[15:8];
        if(we0[2]) RAM[address][23:16] <= wbs_dat_i[23:16];
        if(we0[3]) RAM[address][31:24] <= wbs_dat_i[31:24];
    end
    else
        wbs_dat_o <= 32'b0;
            
always @(negedge wb_clk_i or posedge wb_rst_i) begin
    if(wb_rst_i) begin
        wbs_ack_o <= 1'b0;
    end else begin
        if (wbs_cyc_i && wbs_stb_i) begin
            wbs_ack_o <= 1'b1;
        end
        else
            wbs_ack_o <= 1'b0;
    end
end
// Generating the connections based on the input address during read operations
// Outputs all zeros when there's a write operation or an invalid Wishbone transaction
assign neurons_connections_o = ((!(|we0)) && wbs_cyc_i && wbs_stb_i) ? 
            wbs_dat_o : 32'b0;  // Simplified connection generation for 32 neurons


endmodule
