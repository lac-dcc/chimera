// This program was cloned from: https://github.com/Lefteris-B/ecko_efabless
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


 cnn_kws_accel kws_accel (.clk(user_clock2),
    .done(la_data_out[0]),
    .psram_ce_n(la_data_out[2]),
    .psram_sck(la_data_out[1]),
    .rst(wb_rst_i),
    .sample_valid(la_data_in[16]),
    .start(la_data_in[1]),
    .audio_sample({la_data_in[15],
    la_data_in[14],
    la_data_in[13],
    la_data_in[12],
    la_data_in[11],
    la_data_in[10],
    la_data_in[9],
    la_data_in[8],
    la_data_in[7],
    la_data_in[6],
    la_data_in[5],
    la_data_in[4],
    la_data_in[3],
    la_data_in[2],
    la_data_in[1],
    la_data_in[0]}),
    .psram_d({la_data_out[6],
    la_data_out[5],
    la_data_out[4],
    la_data_out[3]}),
    .psram_douten({la_data_out[10],
    la_data_out[9],
    la_data_out[8],
    la_data_out[7]}));
endmodule

