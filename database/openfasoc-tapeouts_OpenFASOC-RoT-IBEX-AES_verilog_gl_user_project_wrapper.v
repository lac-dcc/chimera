// This program was cloned from: https://github.com/idea-fasoc/openfasoc-tapeouts
// License: Apache License 2.0

module user_project_wrapper (user_clock2,
    vccd1,
    vccd2,
    vdda1,
    vdda2,
    vssa1,
    vssa2,
    vssd1,
    vssd2,
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
 input vccd1;
 input vccd2;
 input vdda1;
 input vdda2;
 input vssa1;
 input vssa2;
 input vssd1;
 input vssd2;
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

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire _18_;
 wire _19_;
 wire _20_;
 wire _21_;
 wire _22_;
 wire _23_;
 wire zero_;

 pulpino_top mprj (.clk(wb_clk_i),
    .clk_sel_i(io_in[0]),
    .clk_standalone_i(io_in[1]),
    .fetch_enable_i(io_in[3]),
    .rst_n(wb_rst_i),
    .scan_enable_i(io_in[4]),
    .scl_pad_i(io_in[15]),
    .scl_pad_o(io_out[17]),
    .scl_padoen_o(io_out[18]),
    .sda_pad_i(io_in[16]),
    .sda_pad_o(io_out[19]),
    .sda_padoen_o(io_out[20]),
    .spi_clk_i(io_in[5]),
    .spi_cs_i(io_in[6]),
    .spi_master_clk_o(io_out[6]),
    .spi_master_csn0_o(io_out[7]),
    .spi_master_csn1_o(io_out[8]),
    .spi_master_csn2_o(io_out[9]),
    .spi_master_csn3_o(io_out[10]),
    .spi_master_sdi0_i(io_in[11]),
    .spi_master_sdi1_i(io_in[12]),
    .spi_master_sdi2_i(io_in[13]),
    .spi_master_sdi3_i(io_in[14]),
    .spi_master_sdo0_o(io_out[13]),
    .spi_master_sdo1_o(io_out[14]),
    .spi_master_sdo2_o(io_out[15]),
    .spi_master_sdo3_o(io_out[16]),
    .spi_sdi0_i(io_in[7]),
    .spi_sdi1_i(io_in[8]),
    .spi_sdi2_i(io_in[9]),
    .spi_sdi3_i(io_in[10]),
    .spi_sdo0_o(io_out[2]),
    .spi_sdo1_o(io_out[3]),
    .spi_sdo2_o(io_out[4]),
    .spi_sdo3_o(io_out[5]),
    .tck_i(user_clock2),
    .tdi_i(io_in[30]),
    .tdo_o(io_out[32]),
    .testmode_i(io_in[2]),
    .tms_i(io_in[29]),
    .trstn_i(io_in[28]),
    .uart_cts(io_in[18]),
    .uart_dsr(io_in[19]),
    .uart_dtr(io_out[23]),
    .uart_rts(io_out[22]),
    .uart_rx(io_in[17]),
    .uart_tx(io_out[21]),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .gpio_in({zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    io_in[27],
    io_in[26],
    io_in[25],
    io_in[24],
    io_in[23],
    io_in[22],
    io_in[21],
    io_in[20]}),
    .gpio_out({_15_,
    _14_,
    _13_,
    _12_,
    _10_,
    _09_,
    _08_,
    _07_,
    _06_,
    _05_,
    _04_,
    _03_,
    _02_,
    _01_,
    _23_,
    _22_,
    _21_,
    _20_,
    _19_,
    _18_,
    _17_,
    _16_,
    _11_,
    _00_,
    io_out[31],
    io_out[30],
    io_out[29],
    io_out[28],
    io_out[27],
    io_out[26],
    io_out[25],
    io_out[24]}),
    .io_oeb({io_oeb[32],
    io_oeb[31],
    io_oeb[30],
    io_oeb[29],
    io_oeb[28],
    io_oeb[27],
    io_oeb[26],
    io_oeb[25],
    io_oeb[24],
    io_oeb[23],
    io_oeb[22],
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
    .spi_master_mode_o({io_out[12],
    io_out[11]}),
    .spi_mode_o({io_out[1],
    io_out[0]}));
endmodule
