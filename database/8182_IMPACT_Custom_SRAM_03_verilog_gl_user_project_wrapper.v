// This program was cloned from: https://github.com/LiamOswald/IMPACT_Custom_SRAM_03
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


 user_proj_IMPACT_HEAD mprj (.Byte_Mode_Enable(io_in[19]),
    .Data_In_Enable(io_in[16]),
    .PreCharge(io_in[17]),
    .ReadEnable(io_in[14]),
    .Reram_In_Enable(io_in[5]),
    .Trunc_Enable(io_in[18]),
    .WL_enable(io_in[20]),
    .WriteEnable(io_in[15]),
    .analog_io1(analog_io[14]),
    .analog_io2(analog_io[15]),
    .analog_io3(analog_io[16]),
    .clk(io_in[37]),
    .rst(io_in[36]),
    .vccd1(vccd1),
    .vccd2(vccd2),
    .vdda1(vdda1),
    .vssa1(vssa1),
    .vssd1(vssd1),
    .vssd2(vssd2),
    .Byte_Select({io_in[27],
    io_in[26]}),
    .Data_In({io_in[35],
    io_in[34],
    io_in[33],
    io_in[32],
    io_in[31],
    io_in[30],
    io_in[29],
    io_in[28]}),
    .Data_Out({io_out[13],
    io_out[12],
    io_out[11],
    io_out[10],
    io_out[9],
    io_out[8],
    io_out[7],
    io_out[6]}),
    .Proj_Select({io_in[25],
    io_in[24]}),
    .io_oeb({io_oeb[13],
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
    .io_out({io_out[5],
    io_out[4],
    io_out[3],
    io_out[2],
    io_out[1],
    io_out[0]}),
    .user_irq({user_irq[2],
    user_irq[1],
    user_irq[0]}));
endmodule
