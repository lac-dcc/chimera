// This program was cloned from: https://github.com/lrburle/caravel_google_ring_oscillators
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

 wire one_0;
 wire one_1;
 wire one_2;
 wire one_3;
 wire one_4;
 wire one_5;
 wire one_6;
 wire one_7;
 wire one_8;
 wire one_9;
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
 wire zero_0;
 wire zero_1;
 wire zero_2;
 wire zero_3;
 wire zero_4;
 wire zero_1_10;
 wire zero_1_11;
 wire zero_1_12;
 wire zero_1_13;
 wire zero_1_14;
 wire zero_1_15;
 wire zero_2_10;
 wire zero_2_11;
 wire zero_2_12;
 wire zero_2_13;
 wire zero_2_14;
 wire zero_2_15;
 wire zero_3_10;
 wire zero_3_11;
 wire zero_3_12;
 wire zero_3_13;
 wire zero_3_14;
 wire zero_3_15;
 wire zero_4_10;
 wire zero_4_11;
 wire zero_4_12;
 wire zero_4_13;
 wire zero_4_14;
 wire zero_4_15;
 wire zero_5_10;
 wire zero_5_11;
 wire zero_5_12;
 wire zero_5_13;
 wire zero_5_14;
 wire zero_5_15;

 mux16x1_project mprj1 (.y(io_out[15]),
    .data_in({x1_0,
    x1_1,
    x1_2,
    x1_3,
    x1_4,
    x1_5,
    x1_6,
    x1_7,
    x1_8,
    x1_9,
    zero_1_10,
    zero_1_11,
    zero_1_12,
    zero_1_13,
    zero_1_14,
    zero_1_15}),
    .select({io_in[11],
    io_in[12],
    io_in[13],
    io_in[14]}));
 mux16x1_project mprj2 (.y(io_out[16]),
    .data_in({x2_0,
    x2_1,
    x2_2,
    x2_3,
    x2_4,
    x2_5,
    x2_6,
    x2_7,
    x2_8,
    x2_9,
    zero_2_10,
    zero_2_11,
    zero_2_12,
    zero_2_13,
    zero_2_14,
    zero_2_15}),
    .select({io_in[11],
    io_in[12],
    io_in[13],
    io_in[14]}));
 mux16x1_project mprj3 (.y(io_out[17]),
    .data_in({x3_0,
    x3_1,
    x3_2,
    x3_3,
    x3_4,
    x3_5,
    x3_6,
    x3_7,
    x3_8,
    x3_9,
    zero_3_10,
    zero_3_11,
    zero_3_12,
    zero_3_13,
    zero_3_14,
    zero_3_15}),
    .select({io_in[11],
    io_in[12],
    io_in[13],
    io_in[14]}));
 mux16x1_project mprj4 (.y(io_out[18]),
    .data_in({x4_0,
    x4_1,
    x4_2,
    x4_3,
    x4_4,
    x4_5,
    x4_6,
    x4_7,
    x4_8,
    x4_9,
    zero_4_10,
    zero_4_11,
    zero_4_12,
    zero_4_13,
    zero_4_14,
    zero_4_15}),
    .select({io_in[11],
    io_in[12],
    io_in[13],
    io_in[14]}));
 mux16x1_project mprj5 (.y(io_out[19]),
    .data_in({x5_0,
    x5_1,
    x5_2,
    x5_3,
    x5_4,
    x5_5,
    x5_6,
    x5_7,
    x5_8,
    x5_9,
    zero_5_10,
    zero_5_11,
    zero_5_12,
    zero_5_13,
    zero_5_14,
    zero_5_15}),
    .select({io_in[11],
    io_in[12],
    io_in[13],
    io_in[14]}));
 sky130_osu_ring_oscillator_mpr2ca_8_b0r1 ro1 (.X1_Y1(x1_0),
    .X2_Y1(x2_0),
    .X3_Y1(x3_0),
    .X4_Y1(x4_0),
    .X5_Y1(x5_0),
    .start(io_in[10]),
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
    .s2(io_in[6]));
 sky130_osu_ring_oscillator_mpr2et_8_b0r1 ro4 (.X1_Y1(x1_3),
    .X2_Y1(x2_3),
    .X3_Y1(x3_3),
    .X4_Y1(x4_3),
    .X5_Y1(x5_3),
    .start(io_in[10]),
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
    .start(io_in[10]));
 sky130_osu_ring_oscillator_mpr2ca_8_b0r2 ro6 (.X1_Y1(x1_5),
    .X2_Y1(x2_5),
    .X3_Y1(x3_5),
    .X4_Y1(x4_5),
    .X5_Y1(x5_5),
    .start(io_in[10]),
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
    .start(io_in[10]));
 sky130_fd_sc_hd__conb_1 TIE_ZERO_zero_ (.LO(zero_));
 sky130_fd_sc_hd__conb_1 TIE_ONE_one_ (.HI(one_));

 sky130_fd_sc_hd__conb_1 _zero_1_10 (.LO(zero_1_10));
 sky130_fd_sc_hd__conb_1 _zero_1_11 (.LO(zero_1_11));
 sky130_fd_sc_hd__conb_1 _zero_1_12 (.LO(zero_1_12));
 sky130_fd_sc_hd__conb_1 _zero_1_13 (.LO(zero_1_13));
 sky130_fd_sc_hd__conb_1 _zero_1_14 (.LO(zero_1_14));
 sky130_fd_sc_hd__conb_1 _zero_1_15 (.LO(zero_1_15));
 sky130_fd_sc_hd__conb_1 _zero_2_10 (.LO(zero_2_10));
 sky130_fd_sc_hd__conb_1 _zero_2_11 (.LO(zero_2_11));
 sky130_fd_sc_hd__conb_1 _zero_2_12 (.LO(zero_2_12));
 sky130_fd_sc_hd__conb_1 _zero_2_13 (.LO(zero_2_13));
 sky130_fd_sc_hd__conb_1 _zero_2_14 (.LO(zero_2_14));
 sky130_fd_sc_hd__conb_1 _zero_2_15 (.LO(zero_2_15));
 sky130_fd_sc_hd__conb_1 _zero_3_10 (.LO(zero_3_10));
 sky130_fd_sc_hd__conb_1 _zero_3_11 (.LO(zero_3_11));
 sky130_fd_sc_hd__conb_1 _zero_3_12 (.LO(zero_3_12));
 sky130_fd_sc_hd__conb_1 _zero_3_13 (.LO(zero_3_13));
 sky130_fd_sc_hd__conb_1 _zero_3_14 (.LO(zero_3_14));
 sky130_fd_sc_hd__conb_1 _zero_3_15 (.LO(zero_3_15));
 sky130_fd_sc_hd__conb_1 _zero_4_10 (.LO(zero_4_10));
 sky130_fd_sc_hd__conb_1 _zero_4_11 (.LO(zero_4_11));
 sky130_fd_sc_hd__conb_1 _zero_4_12 (.LO(zero_4_12));
 sky130_fd_sc_hd__conb_1 _zero_4_13 (.LO(zero_4_13));
 sky130_fd_sc_hd__conb_1 _zero_4_14 (.LO(zero_4_14));
 sky130_fd_sc_hd__conb_1 _zero_4_15 (.LO(zero_4_15));
 sky130_fd_sc_hd__conb_1 _zero_5_10 (.LO(zero_5_10));
 sky130_fd_sc_hd__conb_1 _zero_5_11 (.LO(zero_5_11));
 sky130_fd_sc_hd__conb_1 _zero_5_12 (.LO(zero_5_12));
 sky130_fd_sc_hd__conb_1 _zero_5_13 (.LO(zero_5_13));
 sky130_fd_sc_hd__conb_1 _zero_5_14 (.LO(zero_5_14));
 sky130_fd_sc_hd__conb_1 _zero_5_15 (.LO(zero_5_15));
 sky130_fd_sc_hd__conb_1 _zero_0 (.LO(zero_0));
 sky130_fd_sc_hd__conb_1 _zero_1 (.LO(zero_1));
 sky130_fd_sc_hd__conb_1 _zero_2 (.LO(zero_2));
 sky130_fd_sc_hd__conb_1 _zero_3 (.LO(zero_3));
 sky130_fd_sc_hd__conb_1 _zero_4 (.LO(zero_4));
 sky130_fd_sc_hd__conb_1 _one_0 (.HI(one_0));
 sky130_fd_sc_hd__conb_1 _one_1 (.HI(one_1));
 sky130_fd_sc_hd__conb_1 _one_2 (.HI(one_2));
 sky130_fd_sc_hd__conb_1 _one_3 (.HI(one_3));
 sky130_fd_sc_hd__conb_1 _one_4 (.HI(one_4));
 sky130_fd_sc_hd__conb_1 _one_5 (.HI(one_5));
 sky130_fd_sc_hd__conb_1 _one_6 (.HI(one_6));
 sky130_fd_sc_hd__conb_1 _one_7 (.HI(one_7));
 sky130_fd_sc_hd__conb_1 _one_8 (.HI(one_8));
 sky130_fd_sc_hd__conb_1 _one_9 (.HI(one_9));

 assign io_oeb[10] = one_6;
 assign io_oeb[11] = one_7;
 assign io_oeb[12] = one_8;
 assign io_oeb[13] = one_9;
 assign io_oeb[14] = one_1;
 assign io_oeb[5] = one_0;
 assign io_oeb[6] = one_2;
 assign io_oeb[7] = one_3;
 assign io_oeb[8] = one_5;
 assign io_oeb[9] = one_6;
 assign io_oeb[15] = zero_0;
 assign io_oeb[16] = zero_1;
 assign io_oeb[17] = zero_2;
 assign io_oeb[18] = zero_4;
 assign io_oeb[19] = zero_3;
endmodule

