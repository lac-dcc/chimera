// This program was cloned from: https://github.com/lrburle/caravel_google_ring_oscillators
// License: Apache License 2.0

module user_project_wrapper (user_clock2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    vssa2,
    vdda2,
    vssa1,
    vdda1,
    vssd2,
    vccd2,
    vssd1,
    vccd1,
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
 input vssa2;
 input vdda2;
 input vssa1;
 input vdda1;
 input vssd2;
 input vccd2;
 input vssd1;
 input vccd1;
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

 wire one0;
 wire one1;
 wire one2;
 wire one3;
 wire one4;
 wire one5;
 wire one6;
 wire one7;
 wire one8;
 wire one9;
 wire x1_0;
 wire x1_1;
 wire x1_2;
 wire x1_3;
 wire x1_4;
 wire x1_5;
 wire x1_6;
 wire x1_7;
 wire x1_8;
 wire x1_9;
 wire x2_0;
 wire x2_1;
 wire x2_2;
 wire x2_3;
 wire x2_4;
 wire x2_5;
 wire x2_6;
 wire x2_7;
 wire x2_8;
 wire x2_9;
 wire x3_0;
 wire x3_1;
 wire x3_2;
 wire x3_3;
 wire x3_4;
 wire x3_5;
 wire x3_6;
 wire x3_7;
 wire x3_8;
 wire x3_9;
 wire x4_0;
 wire x4_1;
 wire x4_2;
 wire x4_3;
 wire x4_4;
 wire x4_5;
 wire x4_6;
 wire x4_7;
 wire x4_8;
 wire x4_9;
 wire x5_0;
 wire x5_1;
 wire x5_2;
 wire x5_3;
 wire x5_4;
 wire x5_5;
 wire x5_6;
 wire x5_7;
 wire x5_8;
 wire x5_9;
 wire zero0;
 wire zero1;
 wire zero2;
 wire zero3;
 wire zero4;

 wire zero110;
 wire zero111;
 wire zero112;
 wire zero113;
 wire zero114;
 wire zero115;
 wire zero210;
 wire zero211;
 wire zero212;
 wire zero213;
 wire zero214;
 wire zero215;
 wire zero310;
 wire zero311;
 wire zero312;
 wire zero313;
 wire zero314;
 wire zero315;
 wire zero410;
 wire zero411;
 wire zero412;
 wire zero413;
 wire zero414;
 wire zero415;
 wire zero510;
 wire zero511;
 wire zero512;
 wire zero513;
 wire zero514;
 wire zero515;

 mux16x1_project mprj1 (.vccd1(vccd1),
    .vssd1(vssd1),
    .y(io_out[15]),
    .data_in({zero115,
    zero114,
    zero113,
    zero112,
    zero111,
    zero110,
    x1_9,
    x1_8,
    x1_7,
    x1_6,
    x1_5,
    x1_4,
    x1_3,
    x1_2,
    x1_1,
    x1_0}),
    .select({io_in[14],
    io_in[13],
    io_in[12],
    io_in[11]}));

 mux16x1_project mprj2 (.vccd1(vccd1),
    .vssd1(vssd1),
    .y(io_out[16]),
    .data_in({zero215,
    zero214,
    zero213,
    zero212,
    zero211,
    zero210,
    x2_9,
    x2_8,
    x2_7,
    x2_6,
    x2_5,
    x2_4,
    x2_3,
    x2_2,
    x2_1,
    x2_0}),
    .select({io_in[14],
    io_in[13],
    io_in[12],
    io_in[11]}));

 mux16x1_project mprj3 (.vccd1(vccd1),
    .vssd1(vssd1),
    .y(io_out[17]),
    .data_in({zero315,
    zero314,
    zero313,
    zero312,
    zero311,
    zero310,
    x3_9,
    x3_8,
    x3_7,
    x3_6,
    x3_5,
    x3_4,
    x3_3,
    x3_2,
    x3_1,
    x3_0}),
    .select({io_in[14],
    io_in[13],
    io_in[12],
    io_in[11]}));

 mux16x1_project mprj4 (.vccd1(vccd1),
    .vssd1(vssd1),
    .y(io_out[18]),
    .data_in({zero415,
    zero414,
    zero413,
    zero412,
    zero411,
    zero410,
    x4_9,
    x4_8,
    x4_7,
    x4_6,
    x4_5,
    x4_4,
    x4_3,
    x4_2,
    x4_1,
    x4_0}),
    .select({io_in[14],
    io_in[13],
    io_in[12],
    io_in[11]}));

 mux16x1_project mprj5 (.vccd1(vccd1),
    .vssd1(vssd1),
    .y(io_out[19]),
    .data_in({zero515,
    zero514,
    zero513,
    zero512,
    zero511,
    zero510,
    x5_9,
    x5_8,
    x5_7,
    x5_6,
    x5_5,
    x5_4,
    x5_3,
    x5_2,
    x5_1,
    x5_0}),
    .select({io_in[14],
    io_in[13],
    io_in[12],
    io_in[11]}));
    
 sky130_osu_ring_oscillator_mpr2ca_8_b0r1 ro1 (.X1_Y1(x1_0),
    .X2_Y1(x2_0),
    .X3_Y1(x3_0),
    .X4_Y1(x4_0),
    .X5_Y1(x5_0),
    .start(io_in[10]),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .s1(io_in[5]),
    .s2(io_in[6]),
    .s3(io_in[7]),
    .s4(io_in[8]),
    .s5(io_in[9]));

 sky130_osu_ring_oscillator_mpr2xa_8_b0r2 ro10 (.X1_Y1(x1_9),
    .X2_Y1(x2_9),
    .X3_Y1(x3_9),
    .X4_Y1(x4_9),
    .X5_Y1(x5_9),
    .start(io_in[10]),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .s1(io_in[5]),
    .s2(io_in[6]),
    .s3(io_in[7]),
    .s4(io_in[8]),
    .s5(io_in[9]));

 sky130_osu_ring_oscillator_mpr2ct_8_b0r1 ro2 (.X1_Y1(x1_1),
    .X2_Y1(x2_1),
    .X3_Y1(x3_1),
    .X4_Y1(x4_1),
    .X5_Y1(x5_1),
    .start(io_in[10]),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .s1(io_in[5]),
    .s2(io_in[6]),
    .s3(io_in[7]),
    .s4(io_in[8]),
    .s5(io_in[9]));

 sky130_osu_ring_oscillator_mpr2ea_8_b0r1 ro3 (.X1_Y1(x1_2),
    .X2_Y1(x2_2),
    .X3_Y1(x3_2),
    .X4_Y1(x4_2),
    .X5_Y1(x5_2),
    .s1(io_in[5]),
    .s3(io_in[7]),
    .s4(io_in[8]),
    .s5(io_in[9]),
    .start(io_in[10]),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .s2(io_in[6]));

 sky130_osu_ring_oscillator_mpr2et_8_b0r1 ro4 (.X1_Y1(x1_3),
    .X2_Y1(x2_3),
    .X3_Y1(x3_3),
    .X4_Y1(x4_3),
    .X5_Y1(x5_3),
    .start(io_in[10]),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .s1(io_in[5]),
    .s2(io_in[6]),
    .s3(io_in[7]),
    .s4(io_in[8]),
    .s5(io_in[9]));

 sky130_osu_ring_oscillator_mpr2xa_8_b0r1 ro5 (.X1_Y1(x1_4),
    .X2_Y1(x2_4),
    .X3_Y1(x3_4),
    .X4_Y1(x4_4),
    .X5_Y1(x5_4),
    .s1(io_in[5]),
    .s2(io_in[6]),
    .s3(io_in[7]),
    .s4(io_in[8]),
    .s5(io_in[9]),
    .start(io_in[10]),
    .vccd1(vccd1),
    .vssd1(vssd1));

 sky130_osu_ring_oscillator_mpr2ca_8_b0r2 ro6 (.X1_Y1(x1_5),
    .X2_Y1(x2_5),
    .X3_Y1(x3_5),
    .X4_Y1(x4_5),
    .X5_Y1(x5_5),
    .start(io_in[10]),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .s1(io_in[5]),
    .s2(io_in[6]),
    .s3(io_in[7]),
    .s4(io_in[8]),
    .s5(io_in[9]));

 sky130_osu_ring_oscillator_mpr2ct_8_b0r2 ro7 (.X1_Y1(x1_6),
    .X2_Y1(x2_6),
    .X3_Y1(x3_6),
    .X4_Y1(x4_6),
    .X5_Y1(x5_6),
    .start(io_in[10]),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .s1(io_in[5]),
    .s2(io_in[6]),
    .s3(io_in[7]),
    .s4(io_in[8]),
    .s5(io_in[9]));

 sky130_osu_ring_oscillator_mpr2ea_8_b0r2 ro8 (.X1_Y1(x1_7),
    .X2_Y1(x2_7),
    .X3_Y1(x3_7),
    .X4_Y1(x4_7),
    .X5_Y1(x5_7),
    .start(io_in[10]),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .s1(io_in[5]),
    .s2(io_in[6]),
    .s3(io_in[7]),
    .s4(io_in[8]),
    .s5(io_in[9]));

 sky130_osu_ring_oscillator_mpr2et_8_b0r2 ro9 (.X1_Y1(x1_8),
    .X2_Y1(x2_8),
    .X3_Y1(x3_8),
    .X4_Y1(x4_8),
    .X5_Y1(x5_8),
    .s1(io_in[5]),
    .s2(io_in[6]),
    .s3(io_in[7]),
    .s4(io_in[8]),
    .s5(io_in[9]),
    .start(io_in[10]),
    .vccd1(vccd1),
    .vssd1(vssd1));

 sky130_fd_sc_hd__conb_1 _zero_1_10 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero110));

 sky130_fd_sc_hd__conb_1 _zero_1_11 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero111));

 sky130_fd_sc_hd__conb_1 _zero_1_12 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero112));

 sky130_fd_sc_hd__conb_1 _zero_1_13 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero113));

 sky130_fd_sc_hd__conb_1 _zero_1_14 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero114));

 sky130_fd_sc_hd__conb_1 _zero_1_15 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero115));

 sky130_fd_sc_hd__conb_1 _zero_2_10 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero210));

 sky130_fd_sc_hd__conb_1 _zero_2_11 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero211));

 sky130_fd_sc_hd__conb_1 _zero_2_12 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero212));

 sky130_fd_sc_hd__conb_1 _zero_2_13 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero213));

 sky130_fd_sc_hd__conb_1 _zero_2_14 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero214));

 sky130_fd_sc_hd__conb_1 _zero_2_15 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero215));

 sky130_fd_sc_hd__conb_1 _zero_3_10 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero310));

 sky130_fd_sc_hd__conb_1 _zero_3_11 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero311));

 sky130_fd_sc_hd__conb_1 _zero_3_12 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero312));

 sky130_fd_sc_hd__conb_1 _zero_3_13 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero313));

 sky130_fd_sc_hd__conb_1 _zero_3_14 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero314));

 sky130_fd_sc_hd__conb_1 _zero_3_15 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero315));

 sky130_fd_sc_hd__conb_1 _zero_4_10 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero410));

 sky130_fd_sc_hd__conb_1 _zero_4_11 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero411));

 sky130_fd_sc_hd__conb_1 _zero_4_12 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero412));

 sky130_fd_sc_hd__conb_1 _zero_4_13 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero413));

 sky130_fd_sc_hd__conb_1 _zero_4_14 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero414));

 sky130_fd_sc_hd__conb_1 _zero_4_15 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero415));

 sky130_fd_sc_hd__conb_1 _zero_5_10 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero510));

 sky130_fd_sc_hd__conb_1 _zero_5_11 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero511));

 sky130_fd_sc_hd__conb_1 _zero_5_12 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero512));

 sky130_fd_sc_hd__conb_1 _zero_5_13 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero513));

 sky130_fd_sc_hd__conb_1 _zero_5_14 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero514));

 sky130_fd_sc_hd__conb_1 _zero_5_15 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero515));

 sky130_fd_sc_hd__conb_1 _zero_0 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero0));

 sky130_fd_sc_hd__conb_1 _zero_1 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero1));

 sky130_fd_sc_hd__conb_1 _zero_2 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero2));

 sky130_fd_sc_hd__conb_1 _zero_3 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero3));

 sky130_fd_sc_hd__conb_1 _zero_4 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .HI(),
    .LO(zero4));

 sky130_fd_sc_hd__conb_1 _one_0 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .LO(),
    .HI(one0));

 sky130_fd_sc_hd__conb_1 _one_1 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .LO(),
    .HI(one1));

 sky130_fd_sc_hd__conb_1 _one_2 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .LO(),
    .HI(one2));

 sky130_fd_sc_hd__conb_1 _one_3 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .LO(),
    .HI(one3));

 sky130_fd_sc_hd__conb_1 _one_4 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .LO(),
    .HI(one4));

 sky130_fd_sc_hd__conb_1 _one_5 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .LO(),
    .HI(one5));

 sky130_fd_sc_hd__conb_1 _one_6 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .LO(),
    .HI(one6));

 sky130_fd_sc_hd__conb_1 _one_7 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .LO(),
    .HI(one7));

 sky130_fd_sc_hd__conb_1 _one_8 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .LO(),
    .HI(one8));

 sky130_fd_sc_hd__conb_1 _one_9 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .LO(),
    .HI(one9));

 assign io_oeb[10] = one5;
 assign io_oeb[11] = one6;
 assign io_oeb[12] = one7;
 assign io_oeb[13] = one8;
 assign io_oeb[14] = one9;
 assign io_oeb[5] = one0;
 assign io_oeb[6] = one1;
 assign io_oeb[7] = one2;
 assign io_oeb[8] = one3;
 assign io_oeb[9] = one4;
 assign io_oeb[15] = zero0;
 assign io_oeb[16] = zero1;
 assign io_oeb[17] = zero2;
 assign io_oeb[18] = zero3;
 assign io_oeb[19] = zero4;
endmodule
