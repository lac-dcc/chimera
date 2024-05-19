// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module wishbone_configuratorinator_10 (
    // Global signals
    input wb_clk_i,
    input wb_rst_i,

    // Wishbone signals
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    // Write mask
    input [3:0] wbs_sel_i,
    input [31:0] wbs_data_i,
    input [31:0] wbs_addr_i,
    output wbs_ack_o, // Its bad form but its also 1 in the morning
    output [31:0] wbs_data_o,

    // Config output
    output cen,
    output [3:0] set_out,
    output [3:0] shift_out
);
    wishbone_configuratorinator #(.BASE_ADDR(32'h3000_0010)) configy (
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),
        .wbs_stb_i(wbs_stb_i),
        .wbs_cyc_i(wbs_cyc_i),
        .wbs_we_i(wbs_we_i),
        .wbs_sel_i(wbs_sel_i),
        .wbs_data_i(wbs_data_i),
        .wbs_addr_i(wbs_addr_i),
        .wbs_ack_o(wbs_ack_o),
        .wbs_data_o(wbs_data_o),
        .cen(cen),
        .set_out(set_out),
        .shift_out(shift_out)
    );
endmodule