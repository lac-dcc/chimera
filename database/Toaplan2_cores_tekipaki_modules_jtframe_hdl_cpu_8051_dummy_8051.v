// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

module mc8051_core(
    input           clk,
    input           reset,
    input  [7:0]    rom_data_i,
    input  [7:0]    ram_data_i,
    input           int0_i,
    input           int1_i,
    input           all_t0_i,
    input           all_t1_i,
    input           all_rxd_i,
    input  [7:0]    p0_i,
    input  [7:0]    p1_i,
    input  [7:0]    p2_i,
    input  [7:0]    p3_i,
    output [7:0]    p0_o,
    output [7:0]    p1_o,
    output [7:0]    p2_o,
    output [7:0]    p3_o,
    output          all_rxd_o,
    output          all_txd_o,
    output          all_rxdwr_o,
    output [15:0]   rom_adr_o,
    output [ 7:0]   ram_data_o,
    output [ 6:0]   ram_adr_o,
    output          ram_wr_o,
    output          ram_en_o,
    input  [ 7:0]   datax_i,
    output [ 7:0]   datax_o,
    output [15:0]   adrx_o,
    output          wrx_o
);

assign rom_adr_o = 16'd0;
assign ram_en_o  = 1'b0;
assign ram_wr_o  = 1'b0;
assign datax_o   = 8'd0;
assign adrx_o    = 16'd0;

assign p0_o      = 8'd0;
assign p1_o      = 8'd0;
assign p2_o      = 8'd0;
assign p3_o      = 8'h20;

assign all_rxd_o = 1'b0;
assign all_txd_o = 1'b0;
assign all_rxdwr_o = 1'b0;

endmodule // mc8051_core