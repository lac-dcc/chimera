// This program was cloned from: https://github.com/cornell-c2s2/tape_in_1_2024
// License: Apache License 2.0

// This is the unpowered netlist.
module user_project_wrapper (user_clock2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    analog_io,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 inout [28:0] analog_io;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [127:0] la_data_in;
 output [127:0] la_data_out;
 input [127:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;


 tapeins_sp24_tapein1_Interconnect tapein (.adapter_parity(io_out[5]),
    .clk(wb_clk_i),
    .cs(io_in[7]),
    .minion_parity(io_out[6]),
    .miso(io_out[10]),
    .mosi(io_in[8]),
    .reset(wb_rst_i),
    .sclk(io_in[9]),
    .io_oeb({io_oeb[22],
    io_oeb[21],
    io_oeb[20],
    io_oeb[19],
    io_oeb[18],
    io_oeb[17],
    io_oeb[16],
    io_oeb[15],
    io_oeb[14],
    io_oeb[13],
    io_oeb[12],
    io_oeb[11],
    io_oeb[10],
    io_oeb[9],
    io_oeb[8],
    io_oeb[7],
    io_oeb[6],
    io_oeb[5],
    io_oeb[4],
    io_oeb[3],
    io_oeb[2],
    io_oeb[1],
    io_oeb[0]}),
    .io_out({io_out[4],
    io_out[3],
    io_out[2],
    io_out[1],
    io_out[0]}));
endmodule

