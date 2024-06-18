// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-04
// License: Apache License 2.0

module tt_um_htfab_rotfpga2 (VGND,
    VPWR,
    clk,
    ena,
    rst_n,
    ui_in,
    uio_in,
    uio_oe,
    uio_out,
    uo_out);
 input VGND;
 input VPWR;
 input clk;
 input ena;
 input rst_n;
 input [7:0] ui_in;
 input [7:0] uio_in;
 output [7:0] uio_oe;
 output [7:0] uio_out;
 output [7:0] uo_out;

 wire net60;
 wire net61;
 wire net62;
 wire net63;
 wire net64;
 wire net65;
 wire net66;
 wire net74;
 wire net67;
 wire net68;
 wire net69;
 wire net70;
 wire net71;
 wire net72;
 wire net73;
 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire clknet_0_clk;
 wire clknet_3_0__leaf_clk;
 wire clknet_3_1__leaf_clk;
 wire clknet_3_2__leaf_clk;
 wire clknet_3_3__leaf_clk;
 wire clknet_3_4__leaf_clk;
 wire clknet_3_5__leaf_clk;
 wire clknet_3_6__leaf_clk;
 wire clknet_3_7__leaf_clk;
 wire \g.cfg_d ;
 wire \g.cfg_h ;
 wire \g.cfg_v ;
 wire \g.g_y[0].g_x[0].t.in_b ;
 wire \g.g_y[0].g_x[0].t.in_lb ;
 wire \g.g_y[0].g_x[0].t.in_r ;
 wire \g.g_y[0].g_x[0].t.in_sc ;
 wire \g.g_y[0].g_x[0].t.in_se ;
 wire \g.g_y[0].g_x[0].t.in_t ;
 wire \g.g_y[0].g_x[0].t.out_b ;
 wire \g.g_y[0].g_x[0].t.out_l ;
 wire \g.g_y[0].g_x[0].t.out_r ;
 wire \g.g_y[0].g_x[0].t.out_sc ;
 wire \g.g_y[0].g_x[0].t.out_t ;
 wire \g.g_y[0].g_x[0].t.w_d ;
 wire \g.g_y[0].g_x[0].t.w_dh ;
 wire \g.g_y[0].g_x[0].t.w_dv ;
 wire \g.g_y[0].g_x[0].t.w_gh ;
 wire \g.g_y[0].g_x[0].t.w_gn ;
 wire \g.g_y[0].g_x[0].t.w_h ;
 wire \g.g_y[0].g_x[0].t.w_hl ;
 wire \g.g_y[0].g_x[0].t.w_hr ;
 wire \g.g_y[0].g_x[0].t.w_na ;
 wire \g.g_y[0].g_x[0].t.w_oh ;
 wire \g.g_y[0].g_x[0].t.w_ov ;
 wire \g.g_y[0].g_x[0].t.w_v ;
 wire \g.g_y[0].g_x[0].t.w_vb ;
 wire \g.g_y[0].g_x[0].t.w_vt ;
 wire \g.g_y[0].g_x[1].t.in_b ;
 wire \g.g_y[0].g_x[1].t.in_r ;
 wire \g.g_y[0].g_x[1].t.in_t ;
 wire \g.g_y[0].g_x[1].t.out_b ;
 wire \g.g_y[0].g_x[1].t.out_r ;
 wire \g.g_y[0].g_x[1].t.out_sc ;
 wire \g.g_y[0].g_x[1].t.out_t ;
 wire \g.g_y[0].g_x[1].t.w_d ;
 wire \g.g_y[0].g_x[1].t.w_dh ;
 wire \g.g_y[0].g_x[1].t.w_dv ;
 wire \g.g_y[0].g_x[1].t.w_gn ;
 wire \g.g_y[0].g_x[1].t.w_h ;
 wire \g.g_y[0].g_x[1].t.w_hl ;
 wire \g.g_y[0].g_x[1].t.w_hr ;
 wire \g.g_y[0].g_x[1].t.w_oh ;
 wire \g.g_y[0].g_x[1].t.w_ov ;
 wire \g.g_y[0].g_x[1].t.w_v ;
 wire \g.g_y[0].g_x[1].t.w_vb ;
 wire \g.g_y[0].g_x[1].t.w_vt ;
 wire \g.g_y[0].g_x[2].t.in_b ;
 wire \g.g_y[0].g_x[2].t.in_lb ;
 wire \g.g_y[0].g_x[2].t.in_r ;
 wire \g.g_y[0].g_x[2].t.in_t ;
 wire \g.g_y[0].g_x[2].t.out_b ;
 wire \g.g_y[0].g_x[2].t.out_r ;
 wire \g.g_y[0].g_x[2].t.out_sc ;
 wire \g.g_y[0].g_x[2].t.out_t ;
 wire \g.g_y[0].g_x[2].t.w_d ;
 wire \g.g_y[0].g_x[2].t.w_dh ;
 wire \g.g_y[0].g_x[2].t.w_dv ;
 wire \g.g_y[0].g_x[2].t.w_gh ;
 wire \g.g_y[0].g_x[2].t.w_gn ;
 wire \g.g_y[0].g_x[2].t.w_h ;
 wire \g.g_y[0].g_x[2].t.w_hl ;
 wire \g.g_y[0].g_x[2].t.w_hr ;
 wire \g.g_y[0].g_x[2].t.w_na ;
 wire \g.g_y[0].g_x[2].t.w_oh ;
 wire \g.g_y[0].g_x[2].t.w_ov ;
 wire \g.g_y[0].g_x[2].t.w_v ;
 wire \g.g_y[0].g_x[2].t.w_vb ;
 wire \g.g_y[0].g_x[2].t.w_vt ;
 wire \g.g_y[0].g_x[3].t.in_b ;
 wire \g.g_y[0].g_x[3].t.in_r ;
 wire \g.g_y[0].g_x[3].t.in_t ;
 wire \g.g_y[0].g_x[3].t.out_b ;
 wire \g.g_y[0].g_x[3].t.out_r ;
 wire \g.g_y[0].g_x[3].t.out_sc ;
 wire \g.g_y[0].g_x[3].t.out_t ;
 wire \g.g_y[0].g_x[3].t.w_d ;
 wire \g.g_y[0].g_x[3].t.w_dh ;
 wire \g.g_y[0].g_x[3].t.w_dv ;
 wire \g.g_y[0].g_x[3].t.w_gn ;
 wire \g.g_y[0].g_x[3].t.w_h ;
 wire \g.g_y[0].g_x[3].t.w_hl ;
 wire \g.g_y[0].g_x[3].t.w_hr ;
 wire \g.g_y[0].g_x[3].t.w_oh ;
 wire \g.g_y[0].g_x[3].t.w_ov ;
 wire \g.g_y[0].g_x[3].t.w_v ;
 wire \g.g_y[0].g_x[3].t.w_vb ;
 wire \g.g_y[0].g_x[3].t.w_vt ;
 wire \g.g_y[0].g_x[4].t.in_b ;
 wire \g.g_y[0].g_x[4].t.in_r ;
 wire \g.g_y[0].g_x[4].t.in_t ;
 wire \g.g_y[0].g_x[4].t.out_b ;
 wire \g.g_y[0].g_x[4].t.out_r ;
 wire \g.g_y[0].g_x[4].t.out_sc ;
 wire \g.g_y[0].g_x[4].t.out_t ;
 wire \g.g_y[0].g_x[4].t.w_d ;
 wire \g.g_y[0].g_x[4].t.w_dh ;
 wire \g.g_y[0].g_x[4].t.w_dv ;
 wire \g.g_y[0].g_x[4].t.w_gh ;
 wire \g.g_y[0].g_x[4].t.w_gn ;
 wire \g.g_y[0].g_x[4].t.w_h ;
 wire \g.g_y[0].g_x[4].t.w_hl ;
 wire \g.g_y[0].g_x[4].t.w_hr ;
 wire \g.g_y[0].g_x[4].t.w_na ;
 wire \g.g_y[0].g_x[4].t.w_oh ;
 wire \g.g_y[0].g_x[4].t.w_ov ;
 wire \g.g_y[0].g_x[4].t.w_v ;
 wire \g.g_y[0].g_x[4].t.w_vb ;
 wire \g.g_y[0].g_x[4].t.w_vt ;
 wire \g.g_y[0].g_x[5].t.in_b ;
 wire \g.g_y[0].g_x[5].t.in_r ;
 wire \g.g_y[0].g_x[5].t.in_t ;
 wire \g.g_y[0].g_x[5].t.out_b ;
 wire \g.g_y[0].g_x[5].t.out_r ;
 wire \g.g_y[0].g_x[5].t.out_sc ;
 wire \g.g_y[0].g_x[5].t.out_t ;
 wire \g.g_y[0].g_x[5].t.w_d ;
 wire \g.g_y[0].g_x[5].t.w_dh ;
 wire \g.g_y[0].g_x[5].t.w_dv ;
 wire \g.g_y[0].g_x[5].t.w_gn ;
 wire \g.g_y[0].g_x[5].t.w_h ;
 wire \g.g_y[0].g_x[5].t.w_hl ;
 wire \g.g_y[0].g_x[5].t.w_hr ;
 wire \g.g_y[0].g_x[5].t.w_oh ;
 wire \g.g_y[0].g_x[5].t.w_ov ;
 wire \g.g_y[0].g_x[5].t.w_v ;
 wire \g.g_y[0].g_x[5].t.w_vb ;
 wire \g.g_y[0].g_x[5].t.w_vt ;
 wire \g.g_y[0].g_x[6].t.in_b ;
 wire \g.g_y[0].g_x[6].t.in_r ;
 wire \g.g_y[0].g_x[6].t.in_t ;
 wire \g.g_y[0].g_x[6].t.out_b ;
 wire \g.g_y[0].g_x[6].t.out_r ;
 wire \g.g_y[0].g_x[6].t.out_sc ;
 wire \g.g_y[0].g_x[6].t.out_t ;
 wire \g.g_y[0].g_x[6].t.w_d ;
 wire \g.g_y[0].g_x[6].t.w_dh ;
 wire \g.g_y[0].g_x[6].t.w_dv ;
 wire \g.g_y[0].g_x[6].t.w_gh ;
 wire \g.g_y[0].g_x[6].t.w_gn ;
 wire \g.g_y[0].g_x[6].t.w_h ;
 wire \g.g_y[0].g_x[6].t.w_hl ;
 wire \g.g_y[0].g_x[6].t.w_hr ;
 wire \g.g_y[0].g_x[6].t.w_na ;
 wire \g.g_y[0].g_x[6].t.w_oh ;
 wire \g.g_y[0].g_x[6].t.w_ov ;
 wire \g.g_y[0].g_x[6].t.w_v ;
 wire \g.g_y[0].g_x[6].t.w_vb ;
 wire \g.g_y[0].g_x[6].t.w_vt ;
 wire \g.g_y[0].g_x[7].t.in_b ;
 wire \g.g_y[0].g_x[7].t.in_t ;
 wire \g.g_y[0].g_x[7].t.out_b ;
 wire \g.g_y[0].g_x[7].t.out_r ;
 wire \g.g_y[0].g_x[7].t.out_sc ;
 wire \g.g_y[0].g_x[7].t.out_t ;
 wire \g.g_y[0].g_x[7].t.w_d ;
 wire \g.g_y[0].g_x[7].t.w_dh ;
 wire \g.g_y[0].g_x[7].t.w_dv ;
 wire \g.g_y[0].g_x[7].t.w_gn ;
 wire \g.g_y[0].g_x[7].t.w_h ;
 wire \g.g_y[0].g_x[7].t.w_hl ;
 wire \g.g_y[0].g_x[7].t.w_hr ;
 wire \g.g_y[0].g_x[7].t.w_oh ;
 wire \g.g_y[0].g_x[7].t.w_ov ;
 wire \g.g_y[0].g_x[7].t.w_v ;
 wire \g.g_y[0].g_x[7].t.w_vb ;
 wire \g.g_y[0].g_x[7].t.w_vt ;
 wire \g.g_y[1].g_x[0].t.in_b ;
 wire \g.g_y[1].g_x[0].t.in_r ;
 wire \g.g_y[1].g_x[0].t.out_b ;
 wire \g.g_y[1].g_x[0].t.out_l ;
 wire \g.g_y[1].g_x[0].t.out_r ;
 wire \g.g_y[1].g_x[0].t.out_sc ;
 wire \g.g_y[1].g_x[0].t.w_d ;
 wire \g.g_y[1].g_x[0].t.w_dh ;
 wire \g.g_y[1].g_x[0].t.w_dv ;
 wire \g.g_y[1].g_x[0].t.w_gn ;
 wire \g.g_y[1].g_x[0].t.w_h ;
 wire \g.g_y[1].g_x[0].t.w_hl ;
 wire \g.g_y[1].g_x[0].t.w_hr ;
 wire \g.g_y[1].g_x[0].t.w_oh ;
 wire \g.g_y[1].g_x[0].t.w_ov ;
 wire \g.g_y[1].g_x[0].t.w_v ;
 wire \g.g_y[1].g_x[0].t.w_vb ;
 wire \g.g_y[1].g_x[0].t.w_vt ;
 wire \g.g_y[1].g_x[1].t.in_b ;
 wire \g.g_y[1].g_x[1].t.in_lb ;
 wire \g.g_y[1].g_x[1].t.in_r ;
 wire \g.g_y[1].g_x[1].t.out_b ;
 wire \g.g_y[1].g_x[1].t.out_r ;
 wire \g.g_y[1].g_x[1].t.out_sc ;
 wire \g.g_y[1].g_x[1].t.w_d ;
 wire \g.g_y[1].g_x[1].t.w_dh ;
 wire \g.g_y[1].g_x[1].t.w_dv ;
 wire \g.g_y[1].g_x[1].t.w_gh ;
 wire \g.g_y[1].g_x[1].t.w_gn ;
 wire \g.g_y[1].g_x[1].t.w_h ;
 wire \g.g_y[1].g_x[1].t.w_hl ;
 wire \g.g_y[1].g_x[1].t.w_hr ;
 wire \g.g_y[1].g_x[1].t.w_na ;
 wire \g.g_y[1].g_x[1].t.w_oh ;
 wire \g.g_y[1].g_x[1].t.w_ov ;
 wire \g.g_y[1].g_x[1].t.w_v ;
 wire \g.g_y[1].g_x[1].t.w_vb ;
 wire \g.g_y[1].g_x[1].t.w_vt ;
 wire \g.g_y[1].g_x[2].t.in_b ;
 wire \g.g_y[1].g_x[2].t.in_r ;
 wire \g.g_y[1].g_x[2].t.out_b ;
 wire \g.g_y[1].g_x[2].t.out_r ;
 wire \g.g_y[1].g_x[2].t.out_sc ;
 wire \g.g_y[1].g_x[2].t.w_d ;
 wire \g.g_y[1].g_x[2].t.w_dh ;
 wire \g.g_y[1].g_x[2].t.w_dv ;
 wire \g.g_y[1].g_x[2].t.w_gn ;
 wire \g.g_y[1].g_x[2].t.w_h ;
 wire \g.g_y[1].g_x[2].t.w_hl ;
 wire \g.g_y[1].g_x[2].t.w_hr ;
 wire \g.g_y[1].g_x[2].t.w_oh ;
 wire \g.g_y[1].g_x[2].t.w_ov ;
 wire \g.g_y[1].g_x[2].t.w_v ;
 wire \g.g_y[1].g_x[2].t.w_vb ;
 wire \g.g_y[1].g_x[2].t.w_vt ;
 wire \g.g_y[1].g_x[3].t.in_b ;
 wire \g.g_y[1].g_x[3].t.in_lb ;
 wire \g.g_y[1].g_x[3].t.in_r ;
 wire \g.g_y[1].g_x[3].t.out_b ;
 wire \g.g_y[1].g_x[3].t.out_r ;
 wire \g.g_y[1].g_x[3].t.out_sc ;
 wire \g.g_y[1].g_x[3].t.w_d ;
 wire \g.g_y[1].g_x[3].t.w_dh ;
 wire \g.g_y[1].g_x[3].t.w_dv ;
 wire \g.g_y[1].g_x[3].t.w_gh ;
 wire \g.g_y[1].g_x[3].t.w_gn ;
 wire \g.g_y[1].g_x[3].t.w_h ;
 wire \g.g_y[1].g_x[3].t.w_hl ;
 wire \g.g_y[1].g_x[3].t.w_hr ;
 wire \g.g_y[1].g_x[3].t.w_na ;
 wire \g.g_y[1].g_x[3].t.w_oh ;
 wire \g.g_y[1].g_x[3].t.w_ov ;
 wire \g.g_y[1].g_x[3].t.w_v ;
 wire \g.g_y[1].g_x[3].t.w_vb ;
 wire \g.g_y[1].g_x[3].t.w_vt ;
 wire \g.g_y[1].g_x[4].t.in_b ;
 wire \g.g_y[1].g_x[4].t.in_r ;
 wire \g.g_y[1].g_x[4].t.out_b ;
 wire \g.g_y[1].g_x[4].t.out_r ;
 wire \g.g_y[1].g_x[4].t.out_sc ;
 wire \g.g_y[1].g_x[4].t.w_d ;
 wire \g.g_y[1].g_x[4].t.w_dh ;
 wire \g.g_y[1].g_x[4].t.w_dv ;
 wire \g.g_y[1].g_x[4].t.w_gn ;
 wire \g.g_y[1].g_x[4].t.w_h ;
 wire \g.g_y[1].g_x[4].t.w_hl ;
 wire \g.g_y[1].g_x[4].t.w_hr ;
 wire \g.g_y[1].g_x[4].t.w_oh ;
 wire \g.g_y[1].g_x[4].t.w_ov ;
 wire \g.g_y[1].g_x[4].t.w_v ;
 wire \g.g_y[1].g_x[4].t.w_vb ;
 wire \g.g_y[1].g_x[4].t.w_vt ;
 wire \g.g_y[1].g_x[5].t.in_b ;
 wire \g.g_y[1].g_x[5].t.in_r ;
 wire \g.g_y[1].g_x[5].t.out_b ;
 wire \g.g_y[1].g_x[5].t.out_r ;
 wire \g.g_y[1].g_x[5].t.out_sc ;
 wire \g.g_y[1].g_x[5].t.w_d ;
 wire \g.g_y[1].g_x[5].t.w_dh ;
 wire \g.g_y[1].g_x[5].t.w_dv ;
 wire \g.g_y[1].g_x[5].t.w_gh ;
 wire \g.g_y[1].g_x[5].t.w_gn ;
 wire \g.g_y[1].g_x[5].t.w_h ;
 wire \g.g_y[1].g_x[5].t.w_hl ;
 wire \g.g_y[1].g_x[5].t.w_hr ;
 wire \g.g_y[1].g_x[5].t.w_na ;
 wire \g.g_y[1].g_x[5].t.w_oh ;
 wire \g.g_y[1].g_x[5].t.w_ov ;
 wire \g.g_y[1].g_x[5].t.w_v ;
 wire \g.g_y[1].g_x[5].t.w_vb ;
 wire \g.g_y[1].g_x[5].t.w_vt ;
 wire \g.g_y[1].g_x[6].t.in_b ;
 wire \g.g_y[1].g_x[6].t.in_r ;
 wire \g.g_y[1].g_x[6].t.out_b ;
 wire \g.g_y[1].g_x[6].t.out_r ;
 wire \g.g_y[1].g_x[6].t.out_sc ;
 wire \g.g_y[1].g_x[6].t.w_d ;
 wire \g.g_y[1].g_x[6].t.w_dh ;
 wire \g.g_y[1].g_x[6].t.w_dv ;
 wire \g.g_y[1].g_x[6].t.w_gn ;
 wire \g.g_y[1].g_x[6].t.w_h ;
 wire \g.g_y[1].g_x[6].t.w_hl ;
 wire \g.g_y[1].g_x[6].t.w_hr ;
 wire \g.g_y[1].g_x[6].t.w_oh ;
 wire \g.g_y[1].g_x[6].t.w_ov ;
 wire \g.g_y[1].g_x[6].t.w_v ;
 wire \g.g_y[1].g_x[6].t.w_vb ;
 wire \g.g_y[1].g_x[6].t.w_vt ;
 wire \g.g_y[1].g_x[7].t.in_b ;
 wire \g.g_y[1].g_x[7].t.out_b ;
 wire \g.g_y[1].g_x[7].t.out_r ;
 wire \g.g_y[1].g_x[7].t.out_sc ;
 wire \g.g_y[1].g_x[7].t.w_d ;
 wire \g.g_y[1].g_x[7].t.w_dh ;
 wire \g.g_y[1].g_x[7].t.w_dv ;
 wire \g.g_y[1].g_x[7].t.w_gh ;
 wire \g.g_y[1].g_x[7].t.w_gn ;
 wire \g.g_y[1].g_x[7].t.w_h ;
 wire \g.g_y[1].g_x[7].t.w_hl ;
 wire \g.g_y[1].g_x[7].t.w_hr ;
 wire \g.g_y[1].g_x[7].t.w_na ;
 wire \g.g_y[1].g_x[7].t.w_oh ;
 wire \g.g_y[1].g_x[7].t.w_ov ;
 wire \g.g_y[1].g_x[7].t.w_v ;
 wire \g.g_y[1].g_x[7].t.w_vb ;
 wire \g.g_y[1].g_x[7].t.w_vt ;
 wire \g.g_y[2].g_x[0].t.in_b ;
 wire \g.g_y[2].g_x[0].t.in_r ;
 wire \g.g_y[2].g_x[0].t.out_b ;
 wire \g.g_y[2].g_x[0].t.out_l ;
 wire \g.g_y[2].g_x[0].t.out_r ;
 wire \g.g_y[2].g_x[0].t.out_sc ;
 wire \g.g_y[2].g_x[0].t.w_d ;
 wire \g.g_y[2].g_x[0].t.w_dh ;
 wire \g.g_y[2].g_x[0].t.w_dv ;
 wire \g.g_y[2].g_x[0].t.w_gh ;
 wire \g.g_y[2].g_x[0].t.w_gn ;
 wire \g.g_y[2].g_x[0].t.w_h ;
 wire \g.g_y[2].g_x[0].t.w_hl ;
 wire \g.g_y[2].g_x[0].t.w_hr ;
 wire \g.g_y[2].g_x[0].t.w_na ;
 wire \g.g_y[2].g_x[0].t.w_oh ;
 wire \g.g_y[2].g_x[0].t.w_ov ;
 wire \g.g_y[2].g_x[0].t.w_v ;
 wire \g.g_y[2].g_x[0].t.w_vb ;
 wire \g.g_y[2].g_x[0].t.w_vt ;
 wire \g.g_y[2].g_x[1].t.in_b ;
 wire \g.g_y[2].g_x[1].t.in_r ;
 wire \g.g_y[2].g_x[1].t.out_b ;
 wire \g.g_y[2].g_x[1].t.out_r ;
 wire \g.g_y[2].g_x[1].t.out_sc ;
 wire \g.g_y[2].g_x[1].t.w_d ;
 wire \g.g_y[2].g_x[1].t.w_dh ;
 wire \g.g_y[2].g_x[1].t.w_dv ;
 wire \g.g_y[2].g_x[1].t.w_gn ;
 wire \g.g_y[2].g_x[1].t.w_h ;
 wire \g.g_y[2].g_x[1].t.w_hl ;
 wire \g.g_y[2].g_x[1].t.w_hr ;
 wire \g.g_y[2].g_x[1].t.w_oh ;
 wire \g.g_y[2].g_x[1].t.w_ov ;
 wire \g.g_y[2].g_x[1].t.w_v ;
 wire \g.g_y[2].g_x[1].t.w_vb ;
 wire \g.g_y[2].g_x[1].t.w_vt ;
 wire \g.g_y[2].g_x[2].t.in_b ;
 wire \g.g_y[2].g_x[2].t.in_r ;
 wire \g.g_y[2].g_x[2].t.out_b ;
 wire \g.g_y[2].g_x[2].t.out_r ;
 wire \g.g_y[2].g_x[2].t.out_sc ;
 wire \g.g_y[2].g_x[2].t.w_d ;
 wire \g.g_y[2].g_x[2].t.w_dh ;
 wire \g.g_y[2].g_x[2].t.w_dv ;
 wire \g.g_y[2].g_x[2].t.w_gh ;
 wire \g.g_y[2].g_x[2].t.w_gn ;
 wire \g.g_y[2].g_x[2].t.w_h ;
 wire \g.g_y[2].g_x[2].t.w_hl ;
 wire \g.g_y[2].g_x[2].t.w_hr ;
 wire \g.g_y[2].g_x[2].t.w_na ;
 wire \g.g_y[2].g_x[2].t.w_oh ;
 wire \g.g_y[2].g_x[2].t.w_ov ;
 wire \g.g_y[2].g_x[2].t.w_v ;
 wire \g.g_y[2].g_x[2].t.w_vb ;
 wire \g.g_y[2].g_x[2].t.w_vt ;
 wire \g.g_y[2].g_x[3].t.in_b ;
 wire \g.g_y[2].g_x[3].t.in_r ;
 wire \g.g_y[2].g_x[3].t.out_b ;
 wire \g.g_y[2].g_x[3].t.out_r ;
 wire \g.g_y[2].g_x[3].t.out_sc ;
 wire \g.g_y[2].g_x[3].t.w_d ;
 wire \g.g_y[2].g_x[3].t.w_dh ;
 wire \g.g_y[2].g_x[3].t.w_dv ;
 wire \g.g_y[2].g_x[3].t.w_gn ;
 wire \g.g_y[2].g_x[3].t.w_h ;
 wire \g.g_y[2].g_x[3].t.w_hl ;
 wire \g.g_y[2].g_x[3].t.w_hr ;
 wire \g.g_y[2].g_x[3].t.w_oh ;
 wire \g.g_y[2].g_x[3].t.w_ov ;
 wire \g.g_y[2].g_x[3].t.w_v ;
 wire \g.g_y[2].g_x[3].t.w_vb ;
 wire \g.g_y[2].g_x[3].t.w_vt ;
 wire \g.g_y[2].g_x[4].t.in_b ;
 wire \g.g_y[2].g_x[4].t.in_r ;
 wire \g.g_y[2].g_x[4].t.out_b ;
 wire \g.g_y[2].g_x[4].t.out_r ;
 wire \g.g_y[2].g_x[4].t.out_sc ;
 wire \g.g_y[2].g_x[4].t.w_d ;
 wire \g.g_y[2].g_x[4].t.w_dh ;
 wire \g.g_y[2].g_x[4].t.w_dv ;
 wire \g.g_y[2].g_x[4].t.w_gh ;
 wire \g.g_y[2].g_x[4].t.w_gn ;
 wire \g.g_y[2].g_x[4].t.w_h ;
 wire \g.g_y[2].g_x[4].t.w_hl ;
 wire \g.g_y[2].g_x[4].t.w_hr ;
 wire \g.g_y[2].g_x[4].t.w_na ;
 wire \g.g_y[2].g_x[4].t.w_oh ;
 wire \g.g_y[2].g_x[4].t.w_ov ;
 wire \g.g_y[2].g_x[4].t.w_v ;
 wire \g.g_y[2].g_x[4].t.w_vb ;
 wire \g.g_y[2].g_x[4].t.w_vt ;
 wire \g.g_y[2].g_x[5].t.in_b ;
 wire \g.g_y[2].g_x[5].t.in_r ;
 wire \g.g_y[2].g_x[5].t.out_b ;
 wire \g.g_y[2].g_x[5].t.out_r ;
 wire \g.g_y[2].g_x[5].t.out_sc ;
 wire \g.g_y[2].g_x[5].t.w_d ;
 wire \g.g_y[2].g_x[5].t.w_dh ;
 wire \g.g_y[2].g_x[5].t.w_dv ;
 wire \g.g_y[2].g_x[5].t.w_gn ;
 wire \g.g_y[2].g_x[5].t.w_h ;
 wire \g.g_y[2].g_x[5].t.w_hl ;
 wire \g.g_y[2].g_x[5].t.w_hr ;
 wire \g.g_y[2].g_x[5].t.w_oh ;
 wire \g.g_y[2].g_x[5].t.w_ov ;
 wire \g.g_y[2].g_x[5].t.w_v ;
 wire \g.g_y[2].g_x[5].t.w_vb ;
 wire \g.g_y[2].g_x[5].t.w_vt ;
 wire \g.g_y[2].g_x[6].t.in_b ;
 wire \g.g_y[2].g_x[6].t.in_r ;
 wire \g.g_y[2].g_x[6].t.out_b ;
 wire \g.g_y[2].g_x[6].t.out_r ;
 wire \g.g_y[2].g_x[6].t.out_sc ;
 wire \g.g_y[2].g_x[6].t.w_d ;
 wire \g.g_y[2].g_x[6].t.w_dh ;
 wire \g.g_y[2].g_x[6].t.w_dv ;
 wire \g.g_y[2].g_x[6].t.w_gh ;
 wire \g.g_y[2].g_x[6].t.w_gn ;
 wire \g.g_y[2].g_x[6].t.w_h ;
 wire \g.g_y[2].g_x[6].t.w_hl ;
 wire \g.g_y[2].g_x[6].t.w_hr ;
 wire \g.g_y[2].g_x[6].t.w_na ;
 wire \g.g_y[2].g_x[6].t.w_oh ;
 wire \g.g_y[2].g_x[6].t.w_ov ;
 wire \g.g_y[2].g_x[6].t.w_v ;
 wire \g.g_y[2].g_x[6].t.w_vb ;
 wire \g.g_y[2].g_x[6].t.w_vt ;
 wire \g.g_y[2].g_x[7].t.in_b ;
 wire \g.g_y[2].g_x[7].t.out_b ;
 wire \g.g_y[2].g_x[7].t.out_r ;
 wire \g.g_y[2].g_x[7].t.out_sc ;
 wire \g.g_y[2].g_x[7].t.w_d ;
 wire \g.g_y[2].g_x[7].t.w_dh ;
 wire \g.g_y[2].g_x[7].t.w_dv ;
 wire \g.g_y[2].g_x[7].t.w_gn ;
 wire \g.g_y[2].g_x[7].t.w_h ;
 wire \g.g_y[2].g_x[7].t.w_hl ;
 wire \g.g_y[2].g_x[7].t.w_hr ;
 wire \g.g_y[2].g_x[7].t.w_oh ;
 wire \g.g_y[2].g_x[7].t.w_ov ;
 wire \g.g_y[2].g_x[7].t.w_v ;
 wire \g.g_y[2].g_x[7].t.w_vb ;
 wire \g.g_y[2].g_x[7].t.w_vt ;
 wire \g.g_y[3].g_x[0].t.in_b ;
 wire \g.g_y[3].g_x[0].t.in_r ;
 wire \g.g_y[3].g_x[0].t.out_b ;
 wire \g.g_y[3].g_x[0].t.out_l ;
 wire \g.g_y[3].g_x[0].t.out_r ;
 wire \g.g_y[3].g_x[0].t.out_sc ;
 wire \g.g_y[3].g_x[0].t.w_d ;
 wire \g.g_y[3].g_x[0].t.w_dh ;
 wire \g.g_y[3].g_x[0].t.w_dv ;
 wire \g.g_y[3].g_x[0].t.w_gn ;
 wire \g.g_y[3].g_x[0].t.w_h ;
 wire \g.g_y[3].g_x[0].t.w_hl ;
 wire \g.g_y[3].g_x[0].t.w_hr ;
 wire \g.g_y[3].g_x[0].t.w_oh ;
 wire \g.g_y[3].g_x[0].t.w_ov ;
 wire \g.g_y[3].g_x[0].t.w_v ;
 wire \g.g_y[3].g_x[0].t.w_vb ;
 wire \g.g_y[3].g_x[0].t.w_vt ;
 wire \g.g_y[3].g_x[1].t.in_b ;
 wire \g.g_y[3].g_x[1].t.in_r ;
 wire \g.g_y[3].g_x[1].t.out_b ;
 wire \g.g_y[3].g_x[1].t.out_r ;
 wire \g.g_y[3].g_x[1].t.out_sc ;
 wire \g.g_y[3].g_x[1].t.w_d ;
 wire \g.g_y[3].g_x[1].t.w_dh ;
 wire \g.g_y[3].g_x[1].t.w_dv ;
 wire \g.g_y[3].g_x[1].t.w_gh ;
 wire \g.g_y[3].g_x[1].t.w_gn ;
 wire \g.g_y[3].g_x[1].t.w_h ;
 wire \g.g_y[3].g_x[1].t.w_hl ;
 wire \g.g_y[3].g_x[1].t.w_hr ;
 wire \g.g_y[3].g_x[1].t.w_na ;
 wire \g.g_y[3].g_x[1].t.w_oh ;
 wire \g.g_y[3].g_x[1].t.w_ov ;
 wire \g.g_y[3].g_x[1].t.w_v ;
 wire \g.g_y[3].g_x[1].t.w_vb ;
 wire \g.g_y[3].g_x[1].t.w_vt ;
 wire \g.g_y[3].g_x[2].t.in_b ;
 wire \g.g_y[3].g_x[2].t.in_r ;
 wire \g.g_y[3].g_x[2].t.out_b ;
 wire \g.g_y[3].g_x[2].t.out_r ;
 wire \g.g_y[3].g_x[2].t.out_sc ;
 wire \g.g_y[3].g_x[2].t.w_d ;
 wire \g.g_y[3].g_x[2].t.w_dh ;
 wire \g.g_y[3].g_x[2].t.w_dv ;
 wire \g.g_y[3].g_x[2].t.w_gn ;
 wire \g.g_y[3].g_x[2].t.w_h ;
 wire \g.g_y[3].g_x[2].t.w_hl ;
 wire \g.g_y[3].g_x[2].t.w_hr ;
 wire \g.g_y[3].g_x[2].t.w_oh ;
 wire \g.g_y[3].g_x[2].t.w_ov ;
 wire \g.g_y[3].g_x[2].t.w_v ;
 wire \g.g_y[3].g_x[2].t.w_vb ;
 wire \g.g_y[3].g_x[2].t.w_vt ;
 wire \g.g_y[3].g_x[3].t.in_b ;
 wire \g.g_y[3].g_x[3].t.in_r ;
 wire \g.g_y[3].g_x[3].t.out_b ;
 wire \g.g_y[3].g_x[3].t.out_r ;
 wire \g.g_y[3].g_x[3].t.out_sc ;
 wire \g.g_y[3].g_x[3].t.w_d ;
 wire \g.g_y[3].g_x[3].t.w_dh ;
 wire \g.g_y[3].g_x[3].t.w_dv ;
 wire \g.g_y[3].g_x[3].t.w_gh ;
 wire \g.g_y[3].g_x[3].t.w_gn ;
 wire \g.g_y[3].g_x[3].t.w_h ;
 wire \g.g_y[3].g_x[3].t.w_hl ;
 wire \g.g_y[3].g_x[3].t.w_hr ;
 wire \g.g_y[3].g_x[3].t.w_na ;
 wire \g.g_y[3].g_x[3].t.w_oh ;
 wire \g.g_y[3].g_x[3].t.w_ov ;
 wire \g.g_y[3].g_x[3].t.w_v ;
 wire \g.g_y[3].g_x[3].t.w_vb ;
 wire \g.g_y[3].g_x[3].t.w_vt ;
 wire \g.g_y[3].g_x[4].t.in_b ;
 wire \g.g_y[3].g_x[4].t.in_r ;
 wire \g.g_y[3].g_x[4].t.out_b ;
 wire \g.g_y[3].g_x[4].t.out_r ;
 wire \g.g_y[3].g_x[4].t.out_sc ;
 wire \g.g_y[3].g_x[4].t.w_d ;
 wire \g.g_y[3].g_x[4].t.w_dh ;
 wire \g.g_y[3].g_x[4].t.w_dv ;
 wire \g.g_y[3].g_x[4].t.w_gn ;
 wire \g.g_y[3].g_x[4].t.w_h ;
 wire \g.g_y[3].g_x[4].t.w_hl ;
 wire \g.g_y[3].g_x[4].t.w_hr ;
 wire \g.g_y[3].g_x[4].t.w_oh ;
 wire \g.g_y[3].g_x[4].t.w_ov ;
 wire \g.g_y[3].g_x[4].t.w_v ;
 wire \g.g_y[3].g_x[4].t.w_vb ;
 wire \g.g_y[3].g_x[4].t.w_vt ;
 wire \g.g_y[3].g_x[5].t.in_b ;
 wire \g.g_y[3].g_x[5].t.in_r ;
 wire \g.g_y[3].g_x[5].t.out_b ;
 wire \g.g_y[3].g_x[5].t.out_r ;
 wire \g.g_y[3].g_x[5].t.out_sc ;
 wire \g.g_y[3].g_x[5].t.w_d ;
 wire \g.g_y[3].g_x[5].t.w_dh ;
 wire \g.g_y[3].g_x[5].t.w_dv ;
 wire \g.g_y[3].g_x[5].t.w_gh ;
 wire \g.g_y[3].g_x[5].t.w_gn ;
 wire \g.g_y[3].g_x[5].t.w_h ;
 wire \g.g_y[3].g_x[5].t.w_hl ;
 wire \g.g_y[3].g_x[5].t.w_hr ;
 wire \g.g_y[3].g_x[5].t.w_na ;
 wire \g.g_y[3].g_x[5].t.w_oh ;
 wire \g.g_y[3].g_x[5].t.w_ov ;
 wire \g.g_y[3].g_x[5].t.w_v ;
 wire \g.g_y[3].g_x[5].t.w_vb ;
 wire \g.g_y[3].g_x[5].t.w_vt ;
 wire \g.g_y[3].g_x[6].t.in_b ;
 wire \g.g_y[3].g_x[6].t.in_r ;
 wire \g.g_y[3].g_x[6].t.out_b ;
 wire \g.g_y[3].g_x[6].t.out_r ;
 wire \g.g_y[3].g_x[6].t.out_sc ;
 wire \g.g_y[3].g_x[6].t.w_d ;
 wire \g.g_y[3].g_x[6].t.w_dh ;
 wire \g.g_y[3].g_x[6].t.w_dv ;
 wire \g.g_y[3].g_x[6].t.w_gn ;
 wire \g.g_y[3].g_x[6].t.w_h ;
 wire \g.g_y[3].g_x[6].t.w_hl ;
 wire \g.g_y[3].g_x[6].t.w_hr ;
 wire \g.g_y[3].g_x[6].t.w_oh ;
 wire \g.g_y[3].g_x[6].t.w_ov ;
 wire \g.g_y[3].g_x[6].t.w_v ;
 wire \g.g_y[3].g_x[6].t.w_vb ;
 wire \g.g_y[3].g_x[6].t.w_vt ;
 wire \g.g_y[3].g_x[7].t.in_b ;
 wire \g.g_y[3].g_x[7].t.out_b ;
 wire \g.g_y[3].g_x[7].t.out_r ;
 wire \g.g_y[3].g_x[7].t.out_sc ;
 wire \g.g_y[3].g_x[7].t.w_d ;
 wire \g.g_y[3].g_x[7].t.w_dh ;
 wire \g.g_y[3].g_x[7].t.w_dv ;
 wire \g.g_y[3].g_x[7].t.w_gh ;
 wire \g.g_y[3].g_x[7].t.w_gn ;
 wire \g.g_y[3].g_x[7].t.w_h ;
 wire \g.g_y[3].g_x[7].t.w_hl ;
 wire \g.g_y[3].g_x[7].t.w_hr ;
 wire \g.g_y[3].g_x[7].t.w_na ;
 wire \g.g_y[3].g_x[7].t.w_oh ;
 wire \g.g_y[3].g_x[7].t.w_ov ;
 wire \g.g_y[3].g_x[7].t.w_v ;
 wire \g.g_y[3].g_x[7].t.w_vb ;
 wire \g.g_y[3].g_x[7].t.w_vt ;
 wire \g.g_y[4].g_x[0].t.in_b ;
 wire \g.g_y[4].g_x[0].t.in_r ;
 wire \g.g_y[4].g_x[0].t.out_b ;
 wire \g.g_y[4].g_x[0].t.out_l ;
 wire \g.g_y[4].g_x[0].t.out_r ;
 wire \g.g_y[4].g_x[0].t.out_sc ;
 wire \g.g_y[4].g_x[0].t.w_d ;
 wire \g.g_y[4].g_x[0].t.w_dh ;
 wire \g.g_y[4].g_x[0].t.w_dv ;
 wire \g.g_y[4].g_x[0].t.w_gh ;
 wire \g.g_y[4].g_x[0].t.w_gn ;
 wire \g.g_y[4].g_x[0].t.w_h ;
 wire \g.g_y[4].g_x[0].t.w_hl ;
 wire \g.g_y[4].g_x[0].t.w_hr ;
 wire \g.g_y[4].g_x[0].t.w_na ;
 wire \g.g_y[4].g_x[0].t.w_oh ;
 wire \g.g_y[4].g_x[0].t.w_ov ;
 wire \g.g_y[4].g_x[0].t.w_v ;
 wire \g.g_y[4].g_x[0].t.w_vb ;
 wire \g.g_y[4].g_x[0].t.w_vt ;
 wire \g.g_y[4].g_x[1].t.in_b ;
 wire \g.g_y[4].g_x[1].t.in_r ;
 wire \g.g_y[4].g_x[1].t.out_b ;
 wire \g.g_y[4].g_x[1].t.out_r ;
 wire \g.g_y[4].g_x[1].t.out_sc ;
 wire \g.g_y[4].g_x[1].t.w_d ;
 wire \g.g_y[4].g_x[1].t.w_dh ;
 wire \g.g_y[4].g_x[1].t.w_dv ;
 wire \g.g_y[4].g_x[1].t.w_gn ;
 wire \g.g_y[4].g_x[1].t.w_h ;
 wire \g.g_y[4].g_x[1].t.w_hl ;
 wire \g.g_y[4].g_x[1].t.w_hr ;
 wire \g.g_y[4].g_x[1].t.w_oh ;
 wire \g.g_y[4].g_x[1].t.w_ov ;
 wire \g.g_y[4].g_x[1].t.w_v ;
 wire \g.g_y[4].g_x[1].t.w_vb ;
 wire \g.g_y[4].g_x[1].t.w_vt ;
 wire \g.g_y[4].g_x[2].t.in_b ;
 wire \g.g_y[4].g_x[2].t.in_r ;
 wire \g.g_y[4].g_x[2].t.out_b ;
 wire \g.g_y[4].g_x[2].t.out_r ;
 wire \g.g_y[4].g_x[2].t.out_sc ;
 wire \g.g_y[4].g_x[2].t.w_d ;
 wire \g.g_y[4].g_x[2].t.w_dh ;
 wire \g.g_y[4].g_x[2].t.w_dv ;
 wire \g.g_y[4].g_x[2].t.w_gh ;
 wire \g.g_y[4].g_x[2].t.w_gn ;
 wire \g.g_y[4].g_x[2].t.w_h ;
 wire \g.g_y[4].g_x[2].t.w_hl ;
 wire \g.g_y[4].g_x[2].t.w_hr ;
 wire \g.g_y[4].g_x[2].t.w_na ;
 wire \g.g_y[4].g_x[2].t.w_oh ;
 wire \g.g_y[4].g_x[2].t.w_ov ;
 wire \g.g_y[4].g_x[2].t.w_v ;
 wire \g.g_y[4].g_x[2].t.w_vb ;
 wire \g.g_y[4].g_x[2].t.w_vt ;
 wire \g.g_y[4].g_x[3].t.in_b ;
 wire \g.g_y[4].g_x[3].t.in_r ;
 wire \g.g_y[4].g_x[3].t.out_b ;
 wire \g.g_y[4].g_x[3].t.out_r ;
 wire \g.g_y[4].g_x[3].t.out_sc ;
 wire \g.g_y[4].g_x[3].t.w_d ;
 wire \g.g_y[4].g_x[3].t.w_dh ;
 wire \g.g_y[4].g_x[3].t.w_dv ;
 wire \g.g_y[4].g_x[3].t.w_gn ;
 wire \g.g_y[4].g_x[3].t.w_h ;
 wire \g.g_y[4].g_x[3].t.w_hl ;
 wire \g.g_y[4].g_x[3].t.w_hr ;
 wire \g.g_y[4].g_x[3].t.w_oh ;
 wire \g.g_y[4].g_x[3].t.w_ov ;
 wire \g.g_y[4].g_x[3].t.w_v ;
 wire \g.g_y[4].g_x[3].t.w_vb ;
 wire \g.g_y[4].g_x[3].t.w_vt ;
 wire \g.g_y[4].g_x[4].t.in_b ;
 wire \g.g_y[4].g_x[4].t.in_r ;
 wire \g.g_y[4].g_x[4].t.out_b ;
 wire \g.g_y[4].g_x[4].t.out_r ;
 wire \g.g_y[4].g_x[4].t.out_sc ;
 wire \g.g_y[4].g_x[4].t.w_d ;
 wire \g.g_y[4].g_x[4].t.w_dh ;
 wire \g.g_y[4].g_x[4].t.w_dv ;
 wire \g.g_y[4].g_x[4].t.w_gh ;
 wire \g.g_y[4].g_x[4].t.w_gn ;
 wire \g.g_y[4].g_x[4].t.w_h ;
 wire \g.g_y[4].g_x[4].t.w_hl ;
 wire \g.g_y[4].g_x[4].t.w_hr ;
 wire \g.g_y[4].g_x[4].t.w_na ;
 wire \g.g_y[4].g_x[4].t.w_oh ;
 wire \g.g_y[4].g_x[4].t.w_ov ;
 wire \g.g_y[4].g_x[4].t.w_v ;
 wire \g.g_y[4].g_x[4].t.w_vb ;
 wire \g.g_y[4].g_x[4].t.w_vt ;
 wire \g.g_y[4].g_x[5].t.in_b ;
 wire \g.g_y[4].g_x[5].t.in_r ;
 wire \g.g_y[4].g_x[5].t.out_b ;
 wire \g.g_y[4].g_x[5].t.out_r ;
 wire \g.g_y[4].g_x[5].t.out_sc ;
 wire \g.g_y[4].g_x[5].t.w_d ;
 wire \g.g_y[4].g_x[5].t.w_dh ;
 wire \g.g_y[4].g_x[5].t.w_dv ;
 wire \g.g_y[4].g_x[5].t.w_gn ;
 wire \g.g_y[4].g_x[5].t.w_h ;
 wire \g.g_y[4].g_x[5].t.w_hl ;
 wire \g.g_y[4].g_x[5].t.w_hr ;
 wire \g.g_y[4].g_x[5].t.w_oh ;
 wire \g.g_y[4].g_x[5].t.w_ov ;
 wire \g.g_y[4].g_x[5].t.w_v ;
 wire \g.g_y[4].g_x[5].t.w_vb ;
 wire \g.g_y[4].g_x[5].t.w_vt ;
 wire \g.g_y[4].g_x[6].t.in_b ;
 wire \g.g_y[4].g_x[6].t.in_r ;
 wire \g.g_y[4].g_x[6].t.out_b ;
 wire \g.g_y[4].g_x[6].t.out_r ;
 wire \g.g_y[4].g_x[6].t.out_sc ;
 wire \g.g_y[4].g_x[6].t.w_d ;
 wire \g.g_y[4].g_x[6].t.w_dh ;
 wire \g.g_y[4].g_x[6].t.w_dv ;
 wire \g.g_y[4].g_x[6].t.w_gh ;
 wire \g.g_y[4].g_x[6].t.w_gn ;
 wire \g.g_y[4].g_x[6].t.w_h ;
 wire \g.g_y[4].g_x[6].t.w_hl ;
 wire \g.g_y[4].g_x[6].t.w_hr ;
 wire \g.g_y[4].g_x[6].t.w_na ;
 wire \g.g_y[4].g_x[6].t.w_oh ;
 wire \g.g_y[4].g_x[6].t.w_ov ;
 wire \g.g_y[4].g_x[6].t.w_v ;
 wire \g.g_y[4].g_x[6].t.w_vb ;
 wire \g.g_y[4].g_x[6].t.w_vt ;
 wire \g.g_y[4].g_x[7].t.in_b ;
 wire \g.g_y[4].g_x[7].t.out_b ;
 wire \g.g_y[4].g_x[7].t.out_r ;
 wire \g.g_y[4].g_x[7].t.out_sc ;
 wire \g.g_y[4].g_x[7].t.w_d ;
 wire \g.g_y[4].g_x[7].t.w_dh ;
 wire \g.g_y[4].g_x[7].t.w_dv ;
 wire \g.g_y[4].g_x[7].t.w_gn ;
 wire \g.g_y[4].g_x[7].t.w_h ;
 wire \g.g_y[4].g_x[7].t.w_hl ;
 wire \g.g_y[4].g_x[7].t.w_hr ;
 wire \g.g_y[4].g_x[7].t.w_oh ;
 wire \g.g_y[4].g_x[7].t.w_ov ;
 wire \g.g_y[4].g_x[7].t.w_v ;
 wire \g.g_y[4].g_x[7].t.w_vb ;
 wire \g.g_y[4].g_x[7].t.w_vt ;
 wire \g.g_y[5].g_x[0].t.in_b ;
 wire \g.g_y[5].g_x[0].t.in_r ;
 wire \g.g_y[5].g_x[0].t.out_b ;
 wire \g.g_y[5].g_x[0].t.out_l ;
 wire \g.g_y[5].g_x[0].t.out_r ;
 wire \g.g_y[5].g_x[0].t.out_sc ;
 wire \g.g_y[5].g_x[0].t.w_d ;
 wire \g.g_y[5].g_x[0].t.w_dh ;
 wire \g.g_y[5].g_x[0].t.w_dv ;
 wire \g.g_y[5].g_x[0].t.w_gn ;
 wire \g.g_y[5].g_x[0].t.w_h ;
 wire \g.g_y[5].g_x[0].t.w_hl ;
 wire \g.g_y[5].g_x[0].t.w_hr ;
 wire \g.g_y[5].g_x[0].t.w_oh ;
 wire \g.g_y[5].g_x[0].t.w_ov ;
 wire \g.g_y[5].g_x[0].t.w_v ;
 wire \g.g_y[5].g_x[0].t.w_vb ;
 wire \g.g_y[5].g_x[0].t.w_vt ;
 wire \g.g_y[5].g_x[1].t.in_b ;
 wire \g.g_y[5].g_x[1].t.in_r ;
 wire \g.g_y[5].g_x[1].t.out_b ;
 wire \g.g_y[5].g_x[1].t.out_r ;
 wire \g.g_y[5].g_x[1].t.out_sc ;
 wire \g.g_y[5].g_x[1].t.w_d ;
 wire \g.g_y[5].g_x[1].t.w_dh ;
 wire \g.g_y[5].g_x[1].t.w_dv ;
 wire \g.g_y[5].g_x[1].t.w_gh ;
 wire \g.g_y[5].g_x[1].t.w_gn ;
 wire \g.g_y[5].g_x[1].t.w_h ;
 wire \g.g_y[5].g_x[1].t.w_hl ;
 wire \g.g_y[5].g_x[1].t.w_hr ;
 wire \g.g_y[5].g_x[1].t.w_na ;
 wire \g.g_y[5].g_x[1].t.w_oh ;
 wire \g.g_y[5].g_x[1].t.w_ov ;
 wire \g.g_y[5].g_x[1].t.w_v ;
 wire \g.g_y[5].g_x[1].t.w_vb ;
 wire \g.g_y[5].g_x[1].t.w_vt ;
 wire \g.g_y[5].g_x[2].t.in_b ;
 wire \g.g_y[5].g_x[2].t.in_r ;
 wire \g.g_y[5].g_x[2].t.out_b ;
 wire \g.g_y[5].g_x[2].t.out_r ;
 wire \g.g_y[5].g_x[2].t.out_sc ;
 wire \g.g_y[5].g_x[2].t.w_d ;
 wire \g.g_y[5].g_x[2].t.w_dh ;
 wire \g.g_y[5].g_x[2].t.w_dv ;
 wire \g.g_y[5].g_x[2].t.w_gn ;
 wire \g.g_y[5].g_x[2].t.w_h ;
 wire \g.g_y[5].g_x[2].t.w_hl ;
 wire \g.g_y[5].g_x[2].t.w_hr ;
 wire \g.g_y[5].g_x[2].t.w_oh ;
 wire \g.g_y[5].g_x[2].t.w_ov ;
 wire \g.g_y[5].g_x[2].t.w_v ;
 wire \g.g_y[5].g_x[2].t.w_vb ;
 wire \g.g_y[5].g_x[2].t.w_vt ;
 wire \g.g_y[5].g_x[3].t.in_b ;
 wire \g.g_y[5].g_x[3].t.in_r ;
 wire \g.g_y[5].g_x[3].t.out_b ;
 wire \g.g_y[5].g_x[3].t.out_r ;
 wire \g.g_y[5].g_x[3].t.out_sc ;
 wire \g.g_y[5].g_x[3].t.w_d ;
 wire \g.g_y[5].g_x[3].t.w_dh ;
 wire \g.g_y[5].g_x[3].t.w_dv ;
 wire \g.g_y[5].g_x[3].t.w_gh ;
 wire \g.g_y[5].g_x[3].t.w_gn ;
 wire \g.g_y[5].g_x[3].t.w_h ;
 wire \g.g_y[5].g_x[3].t.w_hl ;
 wire \g.g_y[5].g_x[3].t.w_hr ;
 wire \g.g_y[5].g_x[3].t.w_na ;
 wire \g.g_y[5].g_x[3].t.w_oh ;
 wire \g.g_y[5].g_x[3].t.w_ov ;
 wire \g.g_y[5].g_x[3].t.w_v ;
 wire \g.g_y[5].g_x[3].t.w_vb ;
 wire \g.g_y[5].g_x[3].t.w_vt ;
 wire \g.g_y[5].g_x[4].t.in_b ;
 wire \g.g_y[5].g_x[4].t.in_r ;
 wire \g.g_y[5].g_x[4].t.out_b ;
 wire \g.g_y[5].g_x[4].t.out_r ;
 wire \g.g_y[5].g_x[4].t.out_sc ;
 wire \g.g_y[5].g_x[4].t.w_d ;
 wire \g.g_y[5].g_x[4].t.w_dh ;
 wire \g.g_y[5].g_x[4].t.w_dv ;
 wire \g.g_y[5].g_x[4].t.w_gn ;
 wire \g.g_y[5].g_x[4].t.w_h ;
 wire \g.g_y[5].g_x[4].t.w_hl ;
 wire \g.g_y[5].g_x[4].t.w_hr ;
 wire \g.g_y[5].g_x[4].t.w_oh ;
 wire \g.g_y[5].g_x[4].t.w_ov ;
 wire \g.g_y[5].g_x[4].t.w_v ;
 wire \g.g_y[5].g_x[4].t.w_vb ;
 wire \g.g_y[5].g_x[4].t.w_vt ;
 wire \g.g_y[5].g_x[5].t.in_b ;
 wire \g.g_y[5].g_x[5].t.in_r ;
 wire \g.g_y[5].g_x[5].t.out_b ;
 wire \g.g_y[5].g_x[5].t.out_r ;
 wire \g.g_y[5].g_x[5].t.out_sc ;
 wire \g.g_y[5].g_x[5].t.w_d ;
 wire \g.g_y[5].g_x[5].t.w_dh ;
 wire \g.g_y[5].g_x[5].t.w_dv ;
 wire \g.g_y[5].g_x[5].t.w_gh ;
 wire \g.g_y[5].g_x[5].t.w_gn ;
 wire \g.g_y[5].g_x[5].t.w_h ;
 wire \g.g_y[5].g_x[5].t.w_hl ;
 wire \g.g_y[5].g_x[5].t.w_hr ;
 wire \g.g_y[5].g_x[5].t.w_na ;
 wire \g.g_y[5].g_x[5].t.w_oh ;
 wire \g.g_y[5].g_x[5].t.w_ov ;
 wire \g.g_y[5].g_x[5].t.w_v ;
 wire \g.g_y[5].g_x[5].t.w_vb ;
 wire \g.g_y[5].g_x[5].t.w_vt ;
 wire \g.g_y[5].g_x[6].t.in_b ;
 wire \g.g_y[5].g_x[6].t.in_r ;
 wire \g.g_y[5].g_x[6].t.out_b ;
 wire \g.g_y[5].g_x[6].t.out_r ;
 wire \g.g_y[5].g_x[6].t.out_sc ;
 wire \g.g_y[5].g_x[6].t.w_d ;
 wire \g.g_y[5].g_x[6].t.w_dh ;
 wire \g.g_y[5].g_x[6].t.w_dv ;
 wire \g.g_y[5].g_x[6].t.w_gn ;
 wire \g.g_y[5].g_x[6].t.w_h ;
 wire \g.g_y[5].g_x[6].t.w_hl ;
 wire \g.g_y[5].g_x[6].t.w_hr ;
 wire \g.g_y[5].g_x[6].t.w_oh ;
 wire \g.g_y[5].g_x[6].t.w_ov ;
 wire \g.g_y[5].g_x[6].t.w_v ;
 wire \g.g_y[5].g_x[6].t.w_vb ;
 wire \g.g_y[5].g_x[6].t.w_vt ;
 wire \g.g_y[5].g_x[7].t.in_b ;
 wire \g.g_y[5].g_x[7].t.out_b ;
 wire \g.g_y[5].g_x[7].t.out_r ;
 wire \g.g_y[5].g_x[7].t.out_sc ;
 wire \g.g_y[5].g_x[7].t.w_d ;
 wire \g.g_y[5].g_x[7].t.w_dh ;
 wire \g.g_y[5].g_x[7].t.w_dv ;
 wire \g.g_y[5].g_x[7].t.w_gh ;
 wire \g.g_y[5].g_x[7].t.w_gn ;
 wire \g.g_y[5].g_x[7].t.w_h ;
 wire \g.g_y[5].g_x[7].t.w_hl ;
 wire \g.g_y[5].g_x[7].t.w_hr ;
 wire \g.g_y[5].g_x[7].t.w_na ;
 wire \g.g_y[5].g_x[7].t.w_oh ;
 wire \g.g_y[5].g_x[7].t.w_ov ;
 wire \g.g_y[5].g_x[7].t.w_v ;
 wire \g.g_y[5].g_x[7].t.w_vb ;
 wire \g.g_y[5].g_x[7].t.w_vt ;
 wire \g.g_y[6].g_x[0].t.in_b ;
 wire \g.g_y[6].g_x[0].t.in_r ;
 wire \g.g_y[6].g_x[0].t.out_b ;
 wire \g.g_y[6].g_x[0].t.out_l ;
 wire \g.g_y[6].g_x[0].t.out_r ;
 wire \g.g_y[6].g_x[0].t.out_sc ;
 wire \g.g_y[6].g_x[0].t.w_d ;
 wire \g.g_y[6].g_x[0].t.w_dh ;
 wire \g.g_y[6].g_x[0].t.w_dv ;
 wire \g.g_y[6].g_x[0].t.w_gh ;
 wire \g.g_y[6].g_x[0].t.w_gn ;
 wire \g.g_y[6].g_x[0].t.w_h ;
 wire \g.g_y[6].g_x[0].t.w_hl ;
 wire \g.g_y[6].g_x[0].t.w_hr ;
 wire \g.g_y[6].g_x[0].t.w_na ;
 wire \g.g_y[6].g_x[0].t.w_oh ;
 wire \g.g_y[6].g_x[0].t.w_ov ;
 wire \g.g_y[6].g_x[0].t.w_v ;
 wire \g.g_y[6].g_x[0].t.w_vb ;
 wire \g.g_y[6].g_x[0].t.w_vt ;
 wire \g.g_y[6].g_x[1].t.in_b ;
 wire \g.g_y[6].g_x[1].t.in_r ;
 wire \g.g_y[6].g_x[1].t.out_b ;
 wire \g.g_y[6].g_x[1].t.out_r ;
 wire \g.g_y[6].g_x[1].t.out_sc ;
 wire \g.g_y[6].g_x[1].t.w_d ;
 wire \g.g_y[6].g_x[1].t.w_dh ;
 wire \g.g_y[6].g_x[1].t.w_dv ;
 wire \g.g_y[6].g_x[1].t.w_gn ;
 wire \g.g_y[6].g_x[1].t.w_h ;
 wire \g.g_y[6].g_x[1].t.w_hl ;
 wire \g.g_y[6].g_x[1].t.w_hr ;
 wire \g.g_y[6].g_x[1].t.w_oh ;
 wire \g.g_y[6].g_x[1].t.w_ov ;
 wire \g.g_y[6].g_x[1].t.w_v ;
 wire \g.g_y[6].g_x[1].t.w_vb ;
 wire \g.g_y[6].g_x[1].t.w_vt ;
 wire \g.g_y[6].g_x[2].t.in_b ;
 wire \g.g_y[6].g_x[2].t.in_r ;
 wire \g.g_y[6].g_x[2].t.out_b ;
 wire \g.g_y[6].g_x[2].t.out_r ;
 wire \g.g_y[6].g_x[2].t.out_sc ;
 wire \g.g_y[6].g_x[2].t.w_d ;
 wire \g.g_y[6].g_x[2].t.w_dh ;
 wire \g.g_y[6].g_x[2].t.w_dv ;
 wire \g.g_y[6].g_x[2].t.w_gh ;
 wire \g.g_y[6].g_x[2].t.w_gn ;
 wire \g.g_y[6].g_x[2].t.w_h ;
 wire \g.g_y[6].g_x[2].t.w_hl ;
 wire \g.g_y[6].g_x[2].t.w_hr ;
 wire \g.g_y[6].g_x[2].t.w_na ;
 wire \g.g_y[6].g_x[2].t.w_oh ;
 wire \g.g_y[6].g_x[2].t.w_ov ;
 wire \g.g_y[6].g_x[2].t.w_v ;
 wire \g.g_y[6].g_x[2].t.w_vb ;
 wire \g.g_y[6].g_x[2].t.w_vt ;
 wire \g.g_y[6].g_x[3].t.in_b ;
 wire \g.g_y[6].g_x[3].t.in_r ;
 wire \g.g_y[6].g_x[3].t.out_b ;
 wire \g.g_y[6].g_x[3].t.out_r ;
 wire \g.g_y[6].g_x[3].t.out_sc ;
 wire \g.g_y[6].g_x[3].t.w_d ;
 wire \g.g_y[6].g_x[3].t.w_dh ;
 wire \g.g_y[6].g_x[3].t.w_dv ;
 wire \g.g_y[6].g_x[3].t.w_gn ;
 wire \g.g_y[6].g_x[3].t.w_h ;
 wire \g.g_y[6].g_x[3].t.w_hl ;
 wire \g.g_y[6].g_x[3].t.w_hr ;
 wire \g.g_y[6].g_x[3].t.w_oh ;
 wire \g.g_y[6].g_x[3].t.w_ov ;
 wire \g.g_y[6].g_x[3].t.w_v ;
 wire \g.g_y[6].g_x[3].t.w_vb ;
 wire \g.g_y[6].g_x[3].t.w_vt ;
 wire \g.g_y[6].g_x[4].t.in_b ;
 wire \g.g_y[6].g_x[4].t.in_r ;
 wire \g.g_y[6].g_x[4].t.out_b ;
 wire \g.g_y[6].g_x[4].t.out_r ;
 wire \g.g_y[6].g_x[4].t.out_sc ;
 wire \g.g_y[6].g_x[4].t.w_d ;
 wire \g.g_y[6].g_x[4].t.w_dh ;
 wire \g.g_y[6].g_x[4].t.w_dv ;
 wire \g.g_y[6].g_x[4].t.w_gh ;
 wire \g.g_y[6].g_x[4].t.w_gn ;
 wire \g.g_y[6].g_x[4].t.w_h ;
 wire \g.g_y[6].g_x[4].t.w_hl ;
 wire \g.g_y[6].g_x[4].t.w_hr ;
 wire \g.g_y[6].g_x[4].t.w_na ;
 wire \g.g_y[6].g_x[4].t.w_oh ;
 wire \g.g_y[6].g_x[4].t.w_ov ;
 wire \g.g_y[6].g_x[4].t.w_v ;
 wire \g.g_y[6].g_x[4].t.w_vb ;
 wire \g.g_y[6].g_x[4].t.w_vt ;
 wire \g.g_y[6].g_x[5].t.in_b ;
 wire \g.g_y[6].g_x[5].t.in_r ;
 wire \g.g_y[6].g_x[5].t.out_b ;
 wire \g.g_y[6].g_x[5].t.out_r ;
 wire \g.g_y[6].g_x[5].t.out_sc ;
 wire \g.g_y[6].g_x[5].t.w_d ;
 wire \g.g_y[6].g_x[5].t.w_dh ;
 wire \g.g_y[6].g_x[5].t.w_dv ;
 wire \g.g_y[6].g_x[5].t.w_gn ;
 wire \g.g_y[6].g_x[5].t.w_h ;
 wire \g.g_y[6].g_x[5].t.w_hl ;
 wire \g.g_y[6].g_x[5].t.w_hr ;
 wire \g.g_y[6].g_x[5].t.w_oh ;
 wire \g.g_y[6].g_x[5].t.w_ov ;
 wire \g.g_y[6].g_x[5].t.w_v ;
 wire \g.g_y[6].g_x[5].t.w_vb ;
 wire \g.g_y[6].g_x[5].t.w_vt ;
 wire \g.g_y[6].g_x[6].t.in_b ;
 wire \g.g_y[6].g_x[6].t.in_r ;
 wire \g.g_y[6].g_x[6].t.out_b ;
 wire \g.g_y[6].g_x[6].t.out_r ;
 wire \g.g_y[6].g_x[6].t.out_sc ;
 wire \g.g_y[6].g_x[6].t.w_d ;
 wire \g.g_y[6].g_x[6].t.w_dh ;
 wire \g.g_y[6].g_x[6].t.w_dv ;
 wire \g.g_y[6].g_x[6].t.w_gh ;
 wire \g.g_y[6].g_x[6].t.w_gn ;
 wire \g.g_y[6].g_x[6].t.w_h ;
 wire \g.g_y[6].g_x[6].t.w_hl ;
 wire \g.g_y[6].g_x[6].t.w_hr ;
 wire \g.g_y[6].g_x[6].t.w_na ;
 wire \g.g_y[6].g_x[6].t.w_oh ;
 wire \g.g_y[6].g_x[6].t.w_ov ;
 wire \g.g_y[6].g_x[6].t.w_v ;
 wire \g.g_y[6].g_x[6].t.w_vb ;
 wire \g.g_y[6].g_x[6].t.w_vt ;
 wire \g.g_y[6].g_x[7].t.in_b ;
 wire \g.g_y[6].g_x[7].t.out_b ;
 wire \g.g_y[6].g_x[7].t.out_r ;
 wire \g.g_y[6].g_x[7].t.out_sc ;
 wire \g.g_y[6].g_x[7].t.w_d ;
 wire \g.g_y[6].g_x[7].t.w_dh ;
 wire \g.g_y[6].g_x[7].t.w_dv ;
 wire \g.g_y[6].g_x[7].t.w_gn ;
 wire \g.g_y[6].g_x[7].t.w_h ;
 wire \g.g_y[6].g_x[7].t.w_hl ;
 wire \g.g_y[6].g_x[7].t.w_hr ;
 wire \g.g_y[6].g_x[7].t.w_oh ;
 wire \g.g_y[6].g_x[7].t.w_ov ;
 wire \g.g_y[6].g_x[7].t.w_v ;
 wire \g.g_y[6].g_x[7].t.w_vb ;
 wire \g.g_y[6].g_x[7].t.w_vt ;
 wire \g.g_y[7].g_x[0].t.in_r ;
 wire \g.g_y[7].g_x[0].t.out_l ;
 wire \g.g_y[7].g_x[0].t.out_r ;
 wire \g.g_y[7].g_x[0].t.out_sc ;
 wire \g.g_y[7].g_x[0].t.w_d ;
 wire \g.g_y[7].g_x[0].t.w_dh ;
 wire \g.g_y[7].g_x[0].t.w_dv ;
 wire \g.g_y[7].g_x[0].t.w_gn ;
 wire \g.g_y[7].g_x[0].t.w_h ;
 wire \g.g_y[7].g_x[0].t.w_hl ;
 wire \g.g_y[7].g_x[0].t.w_hr ;
 wire \g.g_y[7].g_x[0].t.w_oh ;
 wire \g.g_y[7].g_x[0].t.w_ov ;
 wire \g.g_y[7].g_x[0].t.w_v ;
 wire \g.g_y[7].g_x[0].t.w_vb ;
 wire \g.g_y[7].g_x[0].t.w_vt ;
 wire \g.g_y[7].g_x[1].t.in_r ;
 wire \g.g_y[7].g_x[1].t.out_r ;
 wire \g.g_y[7].g_x[1].t.out_sc ;
 wire \g.g_y[7].g_x[1].t.w_d ;
 wire \g.g_y[7].g_x[1].t.w_dh ;
 wire \g.g_y[7].g_x[1].t.w_dv ;
 wire \g.g_y[7].g_x[1].t.w_gh ;
 wire \g.g_y[7].g_x[1].t.w_gn ;
 wire \g.g_y[7].g_x[1].t.w_h ;
 wire \g.g_y[7].g_x[1].t.w_hl ;
 wire \g.g_y[7].g_x[1].t.w_hr ;
 wire \g.g_y[7].g_x[1].t.w_na ;
 wire \g.g_y[7].g_x[1].t.w_oh ;
 wire \g.g_y[7].g_x[1].t.w_ov ;
 wire \g.g_y[7].g_x[1].t.w_v ;
 wire \g.g_y[7].g_x[1].t.w_vb ;
 wire \g.g_y[7].g_x[1].t.w_vt ;
 wire \g.g_y[7].g_x[2].t.in_r ;
 wire \g.g_y[7].g_x[2].t.out_r ;
 wire \g.g_y[7].g_x[2].t.out_sc ;
 wire \g.g_y[7].g_x[2].t.w_d ;
 wire \g.g_y[7].g_x[2].t.w_dh ;
 wire \g.g_y[7].g_x[2].t.w_dv ;
 wire \g.g_y[7].g_x[2].t.w_gn ;
 wire \g.g_y[7].g_x[2].t.w_h ;
 wire \g.g_y[7].g_x[2].t.w_hl ;
 wire \g.g_y[7].g_x[2].t.w_hr ;
 wire \g.g_y[7].g_x[2].t.w_oh ;
 wire \g.g_y[7].g_x[2].t.w_ov ;
 wire \g.g_y[7].g_x[2].t.w_v ;
 wire \g.g_y[7].g_x[2].t.w_vb ;
 wire \g.g_y[7].g_x[2].t.w_vt ;
 wire \g.g_y[7].g_x[3].t.in_r ;
 wire \g.g_y[7].g_x[3].t.out_r ;
 wire \g.g_y[7].g_x[3].t.out_sc ;
 wire \g.g_y[7].g_x[3].t.w_d ;
 wire \g.g_y[7].g_x[3].t.w_dh ;
 wire \g.g_y[7].g_x[3].t.w_dv ;
 wire \g.g_y[7].g_x[3].t.w_gh ;
 wire \g.g_y[7].g_x[3].t.w_gn ;
 wire \g.g_y[7].g_x[3].t.w_h ;
 wire \g.g_y[7].g_x[3].t.w_hl ;
 wire \g.g_y[7].g_x[3].t.w_hr ;
 wire \g.g_y[7].g_x[3].t.w_na ;
 wire \g.g_y[7].g_x[3].t.w_oh ;
 wire \g.g_y[7].g_x[3].t.w_ov ;
 wire \g.g_y[7].g_x[3].t.w_v ;
 wire \g.g_y[7].g_x[3].t.w_vb ;
 wire \g.g_y[7].g_x[3].t.w_vt ;
 wire \g.g_y[7].g_x[4].t.in_r ;
 wire \g.g_y[7].g_x[4].t.out_r ;
 wire \g.g_y[7].g_x[4].t.out_sc ;
 wire \g.g_y[7].g_x[4].t.w_d ;
 wire \g.g_y[7].g_x[4].t.w_dh ;
 wire \g.g_y[7].g_x[4].t.w_dv ;
 wire \g.g_y[7].g_x[4].t.w_gn ;
 wire \g.g_y[7].g_x[4].t.w_h ;
 wire \g.g_y[7].g_x[4].t.w_hl ;
 wire \g.g_y[7].g_x[4].t.w_hr ;
 wire \g.g_y[7].g_x[4].t.w_oh ;
 wire \g.g_y[7].g_x[4].t.w_ov ;
 wire \g.g_y[7].g_x[4].t.w_v ;
 wire \g.g_y[7].g_x[4].t.w_vb ;
 wire \g.g_y[7].g_x[4].t.w_vt ;
 wire \g.g_y[7].g_x[5].t.in_r ;
 wire \g.g_y[7].g_x[5].t.out_r ;
 wire \g.g_y[7].g_x[5].t.out_sc ;
 wire \g.g_y[7].g_x[5].t.w_d ;
 wire \g.g_y[7].g_x[5].t.w_dh ;
 wire \g.g_y[7].g_x[5].t.w_dv ;
 wire \g.g_y[7].g_x[5].t.w_gh ;
 wire \g.g_y[7].g_x[5].t.w_gn ;
 wire \g.g_y[7].g_x[5].t.w_h ;
 wire \g.g_y[7].g_x[5].t.w_hl ;
 wire \g.g_y[7].g_x[5].t.w_hr ;
 wire \g.g_y[7].g_x[5].t.w_na ;
 wire \g.g_y[7].g_x[5].t.w_oh ;
 wire \g.g_y[7].g_x[5].t.w_ov ;
 wire \g.g_y[7].g_x[5].t.w_v ;
 wire \g.g_y[7].g_x[5].t.w_vb ;
 wire \g.g_y[7].g_x[5].t.w_vt ;
 wire \g.g_y[7].g_x[6].t.in_r ;
 wire \g.g_y[7].g_x[6].t.out_r ;
 wire \g.g_y[7].g_x[6].t.out_sc ;
 wire \g.g_y[7].g_x[6].t.w_d ;
 wire \g.g_y[7].g_x[6].t.w_dh ;
 wire \g.g_y[7].g_x[6].t.w_dv ;
 wire \g.g_y[7].g_x[6].t.w_gn ;
 wire \g.g_y[7].g_x[6].t.w_h ;
 wire \g.g_y[7].g_x[6].t.w_hl ;
 wire \g.g_y[7].g_x[6].t.w_hr ;
 wire \g.g_y[7].g_x[6].t.w_oh ;
 wire \g.g_y[7].g_x[6].t.w_ov ;
 wire \g.g_y[7].g_x[6].t.w_v ;
 wire \g.g_y[7].g_x[6].t.w_vb ;
 wire \g.g_y[7].g_x[6].t.w_vt ;
 wire \g.g_y[7].g_x[7].t.out_r ;
 wire \g.g_y[7].g_x[7].t.out_sc ;
 wire \g.g_y[7].g_x[7].t.w_d ;
 wire \g.g_y[7].g_x[7].t.w_dh ;
 wire \g.g_y[7].g_x[7].t.w_dv ;
 wire \g.g_y[7].g_x[7].t.w_gh ;
 wire \g.g_y[7].g_x[7].t.w_gn ;
 wire \g.g_y[7].g_x[7].t.w_h ;
 wire \g.g_y[7].g_x[7].t.w_hl ;
 wire \g.g_y[7].g_x[7].t.w_hr ;
 wire \g.g_y[7].g_x[7].t.w_na ;
 wire \g.g_y[7].g_x[7].t.w_oh ;
 wire \g.g_y[7].g_x[7].t.w_ov ;
 wire \g.g_y[7].g_x[7].t.w_v ;
 wire \g.g_y[7].g_x[7].t.w_vb ;
 wire \g.g_y[7].g_x[7].t.w_vt ;
 wire net1;
 wire net10;
 wire net100;
 wire net101;
 wire net102;
 wire net103;
 wire net104;
 wire net105;
 wire net106;
 wire net107;
 wire net108;
 wire net109;
 wire net11;
 wire net110;
 wire net111;
 wire net112;
 wire net113;
 wire net114;
 wire net115;
 wire net116;
 wire net117;
 wire net118;
 wire net119;
 wire net12;
 wire net120;
 wire net121;
 wire net122;
 wire net123;
 wire net124;
 wire net125;
 wire net126;
 wire net127;
 wire net128;
 wire net129;
 wire net13;
 wire net130;
 wire net131;
 wire net132;
 wire net133;
 wire net134;
 wire net135;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net2;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net3;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net4;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net47;
 wire net48;
 wire net49;
 wire net5;
 wire net50;
 wire net51;
 wire net52;
 wire net53;
 wire net54;
 wire net55;
 wire net56;
 wire net57;
 wire net58;
 wire net59;
 wire net6;
 wire net7;
 wire net75;
 wire net76;
 wire net77;
 wire net78;
 wire net79;
 wire net8;
 wire net80;
 wire net81;
 wire net82;
 wire net83;
 wire net84;
 wire net85;
 wire net86;
 wire net87;
 wire net88;
 wire net89;
 wire net9;
 wire net90;
 wire net91;
 wire net92;
 wire net93;
 wire net94;
 wire net95;
 wire net96;
 wire net97;
 wire net98;
 wire net99;

 sky130_fd_sc_hd__diode_2 ANTENNA_1 (.DIODE(\g.g_y[5].g_x[4].t.w_ov ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__diode_2 ANTENNA_2 (.DIODE(net128),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_102 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_0_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_117 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_0_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_0_156 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_0_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_184 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_0_194 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_0_200 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_0_222 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_0_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_229 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_0_248 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_0_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_0_346 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_0_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_0_96 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_10_106 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_130 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_150 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_10_172 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_10_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_228 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_10_247 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_10_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_298 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_10_318 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_329 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_33 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_10_43 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_10_81 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_11_116 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_11_147 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_11_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_11_186 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_11_205 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_11_243 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_11_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_11_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_11_346 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_11_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_11_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_11_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_11_70 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_11_81 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_11_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_11_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_12_105 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_12_115 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_12_136 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_12_150 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_12_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_12_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_12_238 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_12_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_12_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_12_345 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_12_38 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_12_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_12_7 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_12_72 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_12_82 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_12_94 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_13_102 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_13_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_13_140 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_13_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_13_188 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_13_213 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_13_234 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_13_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_13_259 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_13_278 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_13_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_13_316 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_13_346 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_13_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_13_53 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_13_92 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_14_120 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_14_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_14_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_14_179 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_14_191 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_14_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_14_233 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_14_298 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_14_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_14_348 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_14_38 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_14_61 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_14_71 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_14_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_14_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_15_14 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_15_172 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_192 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_15_252 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_256 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_15_266 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_15_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_270 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_15_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_335 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_15_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_61 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_15_71 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_16_123 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_16_136 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_16_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_16_150 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_16_168 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_16_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_16_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_16_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_16_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_16_272 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_16_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_16_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_16_318 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_16_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_16_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_16_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_16_95 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_17_122 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_17_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_17_173 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_17_222 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_17_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_17_273 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_17_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_17_28 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_17_290 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_17_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_17_337 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_17_348 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_17_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_17_68 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_17_89 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_117 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_121 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_18_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_18_193 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_229 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_248 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_18_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_277 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_48 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_7 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_70 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_74 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_89 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_19_100 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_19_121 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_19_166 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_19_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_19_173 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_19_219 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_19_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_19_249 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_19_25 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_19_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_19_305 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_19_346 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_19_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_19_78 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_1_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_119 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_1_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_1_218 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_1_25 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_1_317 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_1_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_335 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_1_346 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_1_60 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_1_81 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_20_123 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_20_135 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_20_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_20_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_20_145 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_20_155 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_20_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_20_248 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_20_271 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_20_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_20_290 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_20_302 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_20_345 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_20_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_20_61 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_20_71 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_101 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_21_14 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_21_143 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_21_154 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_18 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_21_203 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_21_216 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_243 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_270 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_21_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_21_308 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_21_332 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_21_346 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_21_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_61 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_21_71 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_22_118 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_22_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_22_152 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_156 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_22_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_22_247 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_22_25 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_22_262 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_266 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_22_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_22_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_22_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_315 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_22_328 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_22_49 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_71 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_152 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_23_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_23_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_23_202 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_23_216 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_23_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_23_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_23_249 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_23_269 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_23_290 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_23_311 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_335 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_23_346 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_23_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_23_92 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_24_106 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_24_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_24_152 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_24_175 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_179 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_24_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_24_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_24_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_24_301 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_307 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_24_336 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_24_349 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_38 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_24_48 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_24_68 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_25_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_25_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_25_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_25_158 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_25_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_25_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_25_222 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_25_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_25_248 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_25_278 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_25_289 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_25_295 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_25_314 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_25_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_25_337 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_25_347 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_25_53 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_25_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_25_81 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_25_92 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_26_136 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_26_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_26_192 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_215 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_26_271 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_26_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_292 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_26_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_26_305 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_26_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_324 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_26_344 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_35 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_26_72 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_26_94 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_27_101 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_27_140 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_27_152 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_27_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_27_210 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_27_229 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_27_257 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_27_277 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_27_30 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_27_317 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_27_346 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_27_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_27_41 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_27_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_28_177 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_28_181 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_28_191 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_28_235 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_28_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_28_345 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_28_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_28_74 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_28_91 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_29_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_29_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_29_156 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_29_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_29_190 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_29_212 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_29_252 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_29_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_29_314 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_29_34 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_29_346 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_29_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_29_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_29_93 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_2_171 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_18 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_2_182 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_186 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_2_250 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_262 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_272 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_2_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_2_327 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_38 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_30_119 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_30_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_30_175 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_30_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_30_307 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_30_312 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_30_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_30_47 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_30_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_30_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_31_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_144 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_31_166 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_31_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_28 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_31_290 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_337 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_32_125 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_32_135 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_32_164 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_32_183 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_32_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_32_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_32_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_32_72 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_32_88 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_33_140 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_173 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_33_183 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_33_203 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_284 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_33_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_337 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_37 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_34_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_34_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_34_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_34_160 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_34_185 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_34_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_34_271 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_34_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_35_138 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_35_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_245 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_326 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_35_337 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_84 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_36_116 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_36_138 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_36_185 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_36_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_226 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_36_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_36_289 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_36_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_36_324 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_337 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_7 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_36_73 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_37_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_37_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_37_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_37_326 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_37_346 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_37_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_38_14 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_38_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_38_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_38_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_38_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_38_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_38_89 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_140 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_3_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_175 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_3_25 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_252 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_305 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_3_324 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_3_346 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_4_116 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_4_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_4_156 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_160 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_4_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_4_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_4_274 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_4_287 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_4_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_4_302 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_4_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_4_348 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_47 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_4_72 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_94 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_5_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_119 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_5_147 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_151 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_5_154 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_5_16 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_5_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_5_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_229 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_5_275 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_5_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_5_308 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_5_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_335 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_5_337 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_5_348 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_5_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_6_101 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_6_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_6_134 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_6_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_6_185 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_6_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_6_229 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_6_250 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_6_266 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_6_288 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_6_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_6_303 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_307 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_6_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_313 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_6_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_6_332 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_338 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_6_348 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_6_43 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_56 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_6_88 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_102 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_7_131 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_137 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_7_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_7_205 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_7_220 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_7_290 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_7_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_7_312 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_7_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_7_337 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_7_43 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_7_54 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_7_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_7_68 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_7_98 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_8_128 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_168 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_18 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_8_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_8_271 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_8_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_8_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_8_304 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_33 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_8_79 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_8_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_9_108 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_9_142 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_9_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_19 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_245 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_9_276 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_9_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_9_329 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_335 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_9_337 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_350 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_9_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_0 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_1 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_10 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_11 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_12 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_13 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_14 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_16 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_17 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_18 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_19 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_2 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_20 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_21 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_22 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_23 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_25 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_28 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_30 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_31 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_33 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_34 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_35 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_36 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_37 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_38 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_39 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_4 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_40 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_41 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_42 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_43 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_44 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_45 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_46 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_47 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_48 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_49 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_5 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_50 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_52 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_53 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_54 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_56 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_58 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_59 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_6 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_60 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_61 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_62 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_63 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_64 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_65 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_66 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_67 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_68 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_69 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_7 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_70 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_71 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_72 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_73 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_74 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_75 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_76 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_8 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_100 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_101 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_102 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_103 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_104 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_105 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_106 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_107 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_108 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_109 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_110 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_111 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_112 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_113 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_114 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_115 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_116 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_117 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_118 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_119 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_120 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_121 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_122 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_123 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_124 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_125 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_126 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_127 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_128 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_129 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_130 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_131 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_132 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_133 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_134 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_135 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_136 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_137 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_138 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_139 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_140 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_141 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_142 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_143 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_144 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_145 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_146 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_147 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_148 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_149 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_150 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_151 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_152 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_153 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_154 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_155 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_156 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_157 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_158 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_159 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_160 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_161 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_162 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_163 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_164 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_165 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_166 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_167 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_168 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_169 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_170 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_171 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_172 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_173 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_174 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_175 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_176 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_177 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_178 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_179 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_180 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_181 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_182 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_183 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_184 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_185 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_186 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_187 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_188 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_189 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_190 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_191 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_192 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_193 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_194 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_195 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_196 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_197 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_198 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_199 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_200 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_201 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_202 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_203 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_204 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_205 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_206 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_207 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_208 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_209 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_210 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_211 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_212 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_213 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_214 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_215 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_216 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_217 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_218 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_219 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_220 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_221 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_222 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_223 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_224 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_225 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_226 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_227 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_228 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_229 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_230 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_231 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_232 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_233 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_234 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_235 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_236 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_237 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_238 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_239 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_240 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_241 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_242 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_243 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_244 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_245 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_246 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_247 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_248 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_249 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_250 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_251 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_252 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_253 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_254 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_255 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_256 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_257 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_258 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_259 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_260 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_261 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_262 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_263 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_264 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_265 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_266 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_267 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_268 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_269 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_270 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_271 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_272 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_273 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_274 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_275 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_276 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_277 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_278 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_279 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_280 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_281 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_282 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_283 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_284 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_285 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_286 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_287 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_288 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_289 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_290 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_291 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_292 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_293 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_294 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_295 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_296 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_297 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_298 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_299 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_300 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_301 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_302 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_303 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_304 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_305 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_306 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_307 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_308 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_309 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_310 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_311 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_312 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_313 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_314 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_315 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_316 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_317 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_318 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_319 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_320 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_321 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_322 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_323 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_78 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_79 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_80 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_81 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_82 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_83 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_84 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_85 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_86 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_87 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_88 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_89 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_90 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_91 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_92 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_93 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_94 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_95 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_96 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_97 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_98 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_99 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__or3b_1 _06_ (.A(net16),
    .B(net15),
    .C_N(net1),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_00_));
 sky130_fd_sc_hd__buf_1 _07_ (.A(_00_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.in_lb ));
 sky130_fd_sc_hd__a21bo_1 _08_ (.A1(net13),
    .A2(net12),
    .B1_N(net1),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.cfg_d ));
 sky130_fd_sc_hd__inv_2 _09_ (.A(net13),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_01_));
 sky130_fd_sc_hd__o21ai_2 _10_ (.A1(_01_),
    .A2(net12),
    .B1(net1),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.cfg_h ));
 sky130_fd_sc_hd__a21bo_1 _11_ (.A1(_01_),
    .A2(net12),
    .B1_N(net1),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.cfg_v ));
 sky130_fd_sc_hd__or2b_1 _12_ (.A(net10),
    .B_N(net1),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_02_));
 sky130_fd_sc_hd__clkbuf_1 _13_ (.A(_02_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.in_se ));
 sky130_fd_sc_hd__inv_2 _14_ (.A(net16),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_03_));
 sky130_fd_sc_hd__and2b_1 _15_ (.A_N(net14),
    .B(net1),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_04_));
 sky130_fd_sc_hd__a21oi_2 _16_ (.A1(_03_),
    .A2(net15),
    .B1(_04_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[1].g_x[3].t.in_lb ));
 sky130_fd_sc_hd__o21ba_1 _17_ (.A1(_03_),
    .A2(net15),
    .B1_N(_04_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.in_lb ));
 sky130_fd_sc_hd__a21oi_2 _18_ (.A1(net16),
    .A2(net15),
    .B1(_04_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[0].g_x[2].t.in_lb ));
 sky130_fd_sc_hd__and2_1 _19_ (.A(net1),
    .B(net11),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_05_));
 sky130_fd_sc_hd__buf_1 _20_ (.A(_05_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.in_sc ));
 sky130_fd_sc_hd__clkbuf_4 _36_ (.A(\g.g_y[7].g_x[7].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uio_out[7]));
 sky130_fd_sc_hd__clkbuf_4 _37_ (.A(\g.g_y[0].g_x[7].t.out_r ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[0]));
 sky130_fd_sc_hd__clkbuf_4 _38_ (.A(\g.g_y[1].g_x[7].t.out_r ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[1]));
 sky130_fd_sc_hd__clkbuf_4 _39_ (.A(\g.g_y[2].g_x[7].t.out_r ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[2]));
 sky130_fd_sc_hd__clkbuf_4 _40_ (.A(\g.g_y[3].g_x[7].t.out_r ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[3]));
 sky130_fd_sc_hd__clkbuf_4 _41_ (.A(\g.g_y[4].g_x[7].t.out_r ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[4]));
 sky130_fd_sc_hd__clkbuf_4 _42_ (.A(\g.g_y[5].g_x[7].t.out_r ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[5]));
 sky130_fd_sc_hd__clkbuf_4 _43_ (.A(\g.g_y[6].g_x[7].t.out_r ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[6]));
 sky130_fd_sc_hd__clkbuf_4 _44_ (.A(\g.g_y[7].g_x[7].t.out_r ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[7]));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_0__f_clk (.A(clknet_0_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_3_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_1__f_clk (.A(clknet_0_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_3_1__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_2__f_clk (.A(clknet_0_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_3_2__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_3__f_clk (.A(clknet_0_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_3_3__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_4__f_clk (.A(clknet_0_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_3_4__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_5__f_clk (.A(clknet_0_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_3_5__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_6__f_clk (.A(clknet_0_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_3_6__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_7__f_clk (.A(clknet_0_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_3_7__leaf_clk));
 sky130_fd_sc_hd__buf_4 fanout17 (.A(\g.g_y[0].g_x[2].t.in_lb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net17));
 sky130_fd_sc_hd__clkbuf_4 fanout18 (.A(\g.g_y[0].g_x[2].t.in_lb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net18));
 sky130_fd_sc_hd__buf_4 fanout19 (.A(\g.g_y[1].g_x[1].t.in_lb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net19));
 sky130_fd_sc_hd__clkbuf_4 fanout20 (.A(\g.g_y[1].g_x[1].t.in_lb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net20));
 sky130_fd_sc_hd__buf_4 fanout21 (.A(\g.g_y[1].g_x[3].t.in_lb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net21));
 sky130_fd_sc_hd__buf_2 fanout22 (.A(\g.g_y[1].g_x[3].t.in_lb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net22));
 sky130_fd_sc_hd__buf_4 fanout23 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net23));
 sky130_fd_sc_hd__clkbuf_4 fanout24 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net24));
 sky130_fd_sc_hd__buf_4 fanout25 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net25));
 sky130_fd_sc_hd__buf_2 fanout26 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net26));
 sky130_fd_sc_hd__buf_4 fanout27 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net27));
 sky130_fd_sc_hd__buf_2 fanout28 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net28));
 sky130_fd_sc_hd__buf_4 fanout29 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net29));
 sky130_fd_sc_hd__clkbuf_2 fanout30 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net30));
 sky130_fd_sc_hd__clkbuf_4 fanout31 (.A(\g.g_y[0].g_x[0].t.in_se ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net31));
 sky130_fd_sc_hd__buf_4 fanout32 (.A(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net32));
 sky130_fd_sc_hd__buf_2 fanout33 (.A(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net33));
 sky130_fd_sc_hd__buf_4 fanout34 (.A(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net34));
 sky130_fd_sc_hd__buf_2 fanout35 (.A(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net35));
 sky130_fd_sc_hd__buf_4 fanout36 (.A(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net36));
 sky130_fd_sc_hd__buf_2 fanout37 (.A(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net37));
 sky130_fd_sc_hd__clkbuf_4 fanout38 (.A(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net38));
 sky130_fd_sc_hd__buf_2 fanout39 (.A(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net39));
 sky130_fd_sc_hd__clkbuf_4 fanout40 (.A(\g.cfg_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net40));
 sky130_fd_sc_hd__buf_4 fanout41 (.A(net44),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net41));
 sky130_fd_sc_hd__clkbuf_4 fanout42 (.A(net44),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net42));
 sky130_fd_sc_hd__buf_4 fanout43 (.A(net44),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net43));
 sky130_fd_sc_hd__buf_2 fanout44 (.A(\g.cfg_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net44));
 sky130_fd_sc_hd__buf_4 fanout45 (.A(net48),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net45));
 sky130_fd_sc_hd__clkbuf_4 fanout46 (.A(net48),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net46));
 sky130_fd_sc_hd__buf_4 fanout47 (.A(net48),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net47));
 sky130_fd_sc_hd__buf_2 fanout48 (.A(\g.cfg_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net48));
 sky130_fd_sc_hd__buf_4 fanout49 (.A(\g.g_y[0].g_x[0].t.in_lb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net49));
 sky130_fd_sc_hd__buf_2 fanout50 (.A(\g.g_y[0].g_x[0].t.in_lb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net50));
 sky130_fd_sc_hd__buf_4 fanout51 (.A(net59),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net51));
 sky130_fd_sc_hd__clkbuf_4 fanout52 (.A(net59),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net52));
 sky130_fd_sc_hd__buf_4 fanout53 (.A(net59),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net53));
 sky130_fd_sc_hd__buf_2 fanout54 (.A(net59),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net54));
 sky130_fd_sc_hd__buf_4 fanout55 (.A(net59),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net55));
 sky130_fd_sc_hd__buf_2 fanout56 (.A(net59),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net56));
 sky130_fd_sc_hd__buf_4 fanout57 (.A(net59),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net57));
 sky130_fd_sc_hd__buf_2 fanout58 (.A(net59),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net58));
 sky130_fd_sc_hd__clkbuf_4 fanout59 (.A(\g.cfg_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net59));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cout_b  (.A0(\g.g_y[0].g_x[0].t.w_gh ),
    .A1(\g.g_y[0].g_x[0].t.w_ov ),
    .S(\g.g_y[0].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cout_l  (.A0(\g.g_y[0].g_x[0].t.w_oh ),
    .A1(\g.g_y[0].g_x[0].t.w_gh ),
    .S(\g.g_y[0].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.out_l ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cout_r  (.A0(\g.g_y[0].g_x[0].t.w_gh ),
    .A1(\g.g_y[0].g_x[0].t.w_oh ),
    .S(\g.g_y[0].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[0].g_x[0].t.cout_sc  (.CLK(clknet_3_7__leaf_clk),
    .D(\g.g_y[0].g_x[0].t.w_dv ),
    .SCD(\g.g_y[0].g_x[0].t.in_sc ),
    .SCE(net30),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[0].g_x[0].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cout_t  (.A0(\g.g_y[0].g_x[0].t.w_ov ),
    .A1(\g.g_y[0].g_x[0].t.w_gh ),
    .S(\g.g_y[0].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.out_t ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[0].t.cw_d  (.A0(\g.g_y[0].g_x[0].t.w_d ),
    .A1(\g.g_y[0].g_x[0].t.out_sc ),
    .S(net58),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cw_dh  (.A0(\g.g_y[0].g_x[0].t.w_hl ),
    .A1(\g.g_y[0].g_x[0].t.w_vt ),
    .S(\g.g_y[0].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cw_dv  (.A0(\g.g_y[0].g_x[0].t.w_vt ),
    .A1(\g.g_y[0].g_x[0].t.w_hl ),
    .S(\g.g_y[0].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cw_gh  (.A0(\g.g_y[0].g_x[0].t.w_dh ),
    .A1(\g.g_y[0].g_x[0].t.w_gh ),
    .S(net50),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cw_gn  (.A0(\g.g_y[0].g_x[0].t.w_na ),
    .A1(\g.g_y[0].g_x[0].t.w_gn ),
    .S(net50),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[0].t.cw_h  (.A0(\g.g_y[0].g_x[0].t.w_h ),
    .A1(\g.g_y[0].g_x[0].t.out_sc ),
    .S(net47),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cw_hl  (.A0(net2),
    .A1(\g.g_y[0].g_x[0].t.in_r ),
    .S(\g.g_y[0].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cw_hr  (.A0(\g.g_y[0].g_x[0].t.in_r ),
    .A1(net2),
    .S(\g.g_y[0].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[0].g_x[0].t.cw_na  (.A(\g.g_y[0].g_x[0].t.w_hr ),
    .B(\g.g_y[0].g_x[0].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[0].g_x[0].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cw_oh  (.A0(\g.g_y[0].g_x[0].t.out_sc ),
    .A1(\g.g_y[0].g_x[0].t.w_gn ),
    .S(\g.g_y[0].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cw_ov  (.A0(\g.g_y[0].g_x[0].t.w_gn ),
    .A1(\g.g_y[0].g_x[0].t.out_sc ),
    .S(\g.g_y[0].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[0].t.cw_v  (.A0(\g.g_y[0].g_x[0].t.w_v ),
    .A1(\g.g_y[0].g_x[0].t.out_sc ),
    .S(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cw_vb  (.A0(\g.g_y[0].g_x[0].t.in_b ),
    .A1(\g.g_y[0].g_x[0].t.in_t ),
    .S(\g.g_y[0].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[0].t.cw_vt  (.A0(\g.g_y[0].g_x[0].t.in_t ),
    .A1(\g.g_y[0].g_x[0].t.in_b ),
    .S(\g.g_y[0].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[1].t.cout_b  (.A0(\g.g_y[0].g_x[1].t.w_dh ),
    .A1(\g.g_y[0].g_x[1].t.w_ov ),
    .S(\g.g_y[0].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[1].t.cout_l  (.A0(\g.g_y[0].g_x[1].t.w_oh ),
    .A1(\g.g_y[0].g_x[1].t.w_dh ),
    .S(\g.g_y[0].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[1].t.cout_r  (.A0(\g.g_y[0].g_x[1].t.w_dh ),
    .A1(\g.g_y[0].g_x[1].t.w_oh ),
    .S(\g.g_y[0].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[0].g_x[1].t.cout_sc  (.CLK(clknet_3_7__leaf_clk),
    .D(\g.g_y[0].g_x[1].t.w_dv ),
    .SCD(net114),
    .SCE(net30),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[0].g_x[1].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[1].t.cout_t  (.A0(\g.g_y[0].g_x[1].t.w_ov ),
    .A1(\g.g_y[0].g_x[1].t.w_dh ),
    .S(\g.g_y[0].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.out_t ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[1].t.cw_d  (.A0(\g.g_y[0].g_x[1].t.w_d ),
    .A1(\g.g_y[0].g_x[1].t.out_sc ),
    .S(net57),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[1].t.cw_dh  (.A0(\g.g_y[0].g_x[1].t.w_hl ),
    .A1(\g.g_y[0].g_x[1].t.w_vt ),
    .S(\g.g_y[0].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[1].t.cw_dv  (.A0(\g.g_y[0].g_x[1].t.w_vt ),
    .A1(\g.g_y[0].g_x[1].t.w_hl ),
    .S(\g.g_y[0].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[1].t.cw_h  (.A0(\g.g_y[0].g_x[1].t.w_h ),
    .A1(\g.g_y[0].g_x[1].t.out_sc ),
    .S(net47),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[1].t.cw_hl  (.A0(\g.g_y[0].g_x[0].t.out_r ),
    .A1(\g.g_y[0].g_x[1].t.in_r ),
    .S(\g.g_y[0].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[1].t.cw_hr  (.A0(\g.g_y[0].g_x[1].t.in_r ),
    .A1(\g.g_y[0].g_x[0].t.out_r ),
    .S(\g.g_y[0].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[0].g_x[1].t.cw_na  (.A(\g.g_y[0].g_x[1].t.w_hr ),
    .B(\g.g_y[0].g_x[1].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[0].g_x[1].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[1].t.cw_oh  (.A0(\g.g_y[0].g_x[1].t.out_sc ),
    .A1(\g.g_y[0].g_x[1].t.w_gn ),
    .S(\g.g_y[0].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[1].t.cw_ov  (.A0(\g.g_y[0].g_x[1].t.w_gn ),
    .A1(\g.g_y[0].g_x[1].t.out_sc ),
    .S(\g.g_y[0].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[1].t.cw_v  (.A0(\g.g_y[0].g_x[1].t.w_v ),
    .A1(\g.g_y[0].g_x[1].t.out_sc ),
    .S(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[1].t.cw_vb  (.A0(\g.g_y[0].g_x[1].t.in_b ),
    .A1(\g.g_y[0].g_x[1].t.in_t ),
    .S(\g.g_y[0].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[1].t.cw_vt  (.A0(\g.g_y[0].g_x[1].t.in_t ),
    .A1(\g.g_y[0].g_x[1].t.in_b ),
    .S(\g.g_y[0].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cout_b  (.A0(\g.g_y[0].g_x[2].t.w_gh ),
    .A1(\g.g_y[0].g_x[2].t.w_ov ),
    .S(\g.g_y[0].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cout_l  (.A0(\g.g_y[0].g_x[2].t.w_oh ),
    .A1(\g.g_y[0].g_x[2].t.w_gh ),
    .S(\g.g_y[0].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cout_r  (.A0(\g.g_y[0].g_x[2].t.w_gh ),
    .A1(\g.g_y[0].g_x[2].t.w_oh ),
    .S(\g.g_y[0].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[0].g_x[2].t.cout_sc  (.CLK(clknet_3_5__leaf_clk),
    .D(\g.g_y[0].g_x[2].t.w_dv ),
    .SCD(net85),
    .SCE(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[0].g_x[2].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cout_t  (.A0(\g.g_y[0].g_x[2].t.w_ov ),
    .A1(\g.g_y[0].g_x[2].t.w_gh ),
    .S(\g.g_y[0].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.out_t ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[2].t.cw_d  (.A0(\g.g_y[0].g_x[2].t.w_d ),
    .A1(\g.g_y[0].g_x[2].t.out_sc ),
    .S(net56),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cw_dh  (.A0(\g.g_y[0].g_x[2].t.w_hl ),
    .A1(\g.g_y[0].g_x[2].t.w_vt ),
    .S(\g.g_y[0].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cw_dv  (.A0(\g.g_y[0].g_x[2].t.w_vt ),
    .A1(\g.g_y[0].g_x[2].t.w_hl ),
    .S(\g.g_y[0].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cw_gh  (.A0(\g.g_y[0].g_x[2].t.w_dh ),
    .A1(\g.g_y[0].g_x[2].t.w_gh ),
    .S(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cw_gn  (.A0(\g.g_y[0].g_x[2].t.w_na ),
    .A1(\g.g_y[0].g_x[2].t.w_gn ),
    .S(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[2].t.cw_h  (.A0(\g.g_y[0].g_x[2].t.w_h ),
    .A1(\g.g_y[0].g_x[2].t.out_sc ),
    .S(net46),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cw_hl  (.A0(\g.g_y[0].g_x[1].t.out_r ),
    .A1(\g.g_y[0].g_x[2].t.in_r ),
    .S(\g.g_y[0].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cw_hr  (.A0(\g.g_y[0].g_x[2].t.in_r ),
    .A1(\g.g_y[0].g_x[1].t.out_r ),
    .S(\g.g_y[0].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[0].g_x[2].t.cw_na  (.A(\g.g_y[0].g_x[2].t.w_hr ),
    .B(\g.g_y[0].g_x[2].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[0].g_x[2].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cw_oh  (.A0(\g.g_y[0].g_x[2].t.out_sc ),
    .A1(\g.g_y[0].g_x[2].t.w_gn ),
    .S(\g.g_y[0].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cw_ov  (.A0(\g.g_y[0].g_x[2].t.w_gn ),
    .A1(\g.g_y[0].g_x[2].t.out_sc ),
    .S(\g.g_y[0].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[2].t.cw_v  (.A0(\g.g_y[0].g_x[2].t.w_v ),
    .A1(\g.g_y[0].g_x[2].t.out_sc ),
    .S(net37),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cw_vb  (.A0(\g.g_y[0].g_x[2].t.in_b ),
    .A1(\g.g_y[0].g_x[2].t.in_t ),
    .S(\g.g_y[0].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[2].t.cw_vt  (.A0(\g.g_y[0].g_x[2].t.in_t ),
    .A1(\g.g_y[0].g_x[2].t.in_b ),
    .S(\g.g_y[0].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[3].t.cout_b  (.A0(\g.g_y[0].g_x[3].t.w_dh ),
    .A1(\g.g_y[0].g_x[3].t.w_ov ),
    .S(\g.g_y[0].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[3].t.cout_l  (.A0(\g.g_y[0].g_x[3].t.w_oh ),
    .A1(\g.g_y[0].g_x[3].t.w_dh ),
    .S(\g.g_y[0].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[3].t.cout_r  (.A0(\g.g_y[0].g_x[3].t.w_dh ),
    .A1(\g.g_y[0].g_x[3].t.w_oh ),
    .S(\g.g_y[0].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[0].g_x[3].t.cout_sc  (.CLK(clknet_3_5__leaf_clk),
    .D(\g.g_y[0].g_x[3].t.w_dv ),
    .SCD(net99),
    .SCE(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[0].g_x[3].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[3].t.cout_t  (.A0(\g.g_y[0].g_x[3].t.w_ov ),
    .A1(\g.g_y[0].g_x[3].t.w_dh ),
    .S(\g.g_y[0].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.out_t ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[3].t.cw_d  (.A0(\g.g_y[0].g_x[3].t.w_d ),
    .A1(\g.g_y[0].g_x[3].t.out_sc ),
    .S(net55),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[3].t.cw_dh  (.A0(\g.g_y[0].g_x[3].t.w_hl ),
    .A1(\g.g_y[0].g_x[3].t.w_vt ),
    .S(\g.g_y[0].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[3].t.cw_dv  (.A0(\g.g_y[0].g_x[3].t.w_vt ),
    .A1(\g.g_y[0].g_x[3].t.w_hl ),
    .S(\g.g_y[0].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[3].t.cw_h  (.A0(\g.g_y[0].g_x[3].t.w_h ),
    .A1(\g.g_y[0].g_x[3].t.out_sc ),
    .S(net46),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[3].t.cw_hl  (.A0(\g.g_y[0].g_x[2].t.out_r ),
    .A1(\g.g_y[0].g_x[3].t.in_r ),
    .S(\g.g_y[0].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[3].t.cw_hr  (.A0(\g.g_y[0].g_x[3].t.in_r ),
    .A1(\g.g_y[0].g_x[2].t.out_r ),
    .S(\g.g_y[0].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[0].g_x[3].t.cw_na  (.A(\g.g_y[0].g_x[3].t.w_hr ),
    .B(\g.g_y[0].g_x[3].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[0].g_x[3].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[3].t.cw_oh  (.A0(\g.g_y[0].g_x[3].t.out_sc ),
    .A1(\g.g_y[0].g_x[3].t.w_gn ),
    .S(\g.g_y[0].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[3].t.cw_ov  (.A0(\g.g_y[0].g_x[3].t.w_gn ),
    .A1(\g.g_y[0].g_x[3].t.out_sc ),
    .S(\g.g_y[0].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[3].t.cw_v  (.A0(\g.g_y[0].g_x[3].t.w_v ),
    .A1(\g.g_y[0].g_x[3].t.out_sc ),
    .S(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[3].t.cw_vb  (.A0(\g.g_y[0].g_x[3].t.in_b ),
    .A1(\g.g_y[0].g_x[3].t.in_t ),
    .S(\g.g_y[0].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[3].t.cw_vt  (.A0(\g.g_y[0].g_x[3].t.in_t ),
    .A1(\g.g_y[0].g_x[3].t.in_b ),
    .S(\g.g_y[0].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cout_b  (.A0(\g.g_y[0].g_x[4].t.w_gh ),
    .A1(\g.g_y[0].g_x[4].t.w_ov ),
    .S(\g.g_y[0].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cout_l  (.A0(\g.g_y[0].g_x[4].t.w_oh ),
    .A1(\g.g_y[0].g_x[4].t.w_gh ),
    .S(\g.g_y[0].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cout_r  (.A0(\g.g_y[0].g_x[4].t.w_gh ),
    .A1(\g.g_y[0].g_x[4].t.w_oh ),
    .S(\g.g_y[0].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[0].g_x[4].t.cout_sc  (.CLK(clknet_3_1__leaf_clk),
    .D(\g.g_y[0].g_x[4].t.w_dv ),
    .SCD(net124),
    .SCE(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[0].g_x[4].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cout_t  (.A0(\g.g_y[0].g_x[4].t.w_ov ),
    .A1(\g.g_y[0].g_x[4].t.w_gh ),
    .S(\g.g_y[0].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.out_t ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[4].t.cw_d  (.A0(\g.g_y[0].g_x[4].t.w_d ),
    .A1(\g.g_y[0].g_x[4].t.out_sc ),
    .S(net52),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cw_dh  (.A0(\g.g_y[0].g_x[4].t.w_hl ),
    .A1(\g.g_y[0].g_x[4].t.w_vt ),
    .S(\g.g_y[0].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cw_dv  (.A0(\g.g_y[0].g_x[4].t.w_vt ),
    .A1(\g.g_y[0].g_x[4].t.w_hl ),
    .S(\g.g_y[0].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cw_gh  (.A0(\g.g_y[0].g_x[4].t.w_dh ),
    .A1(\g.g_y[0].g_x[4].t.w_gh ),
    .S(net49),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cw_gn  (.A0(\g.g_y[0].g_x[4].t.w_na ),
    .A1(\g.g_y[0].g_x[4].t.w_gn ),
    .S(net49),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[4].t.cw_h  (.A0(\g.g_y[0].g_x[4].t.w_h ),
    .A1(\g.g_y[0].g_x[4].t.out_sc ),
    .S(net42),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cw_hl  (.A0(\g.g_y[0].g_x[3].t.out_r ),
    .A1(\g.g_y[0].g_x[4].t.in_r ),
    .S(\g.g_y[0].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cw_hr  (.A0(\g.g_y[0].g_x[4].t.in_r ),
    .A1(\g.g_y[0].g_x[3].t.out_r ),
    .S(\g.g_y[0].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[0].g_x[4].t.cw_na  (.A(\g.g_y[0].g_x[4].t.w_hr ),
    .B(\g.g_y[0].g_x[4].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[0].g_x[4].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cw_oh  (.A0(\g.g_y[0].g_x[4].t.out_sc ),
    .A1(\g.g_y[0].g_x[4].t.w_gn ),
    .S(\g.g_y[0].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cw_ov  (.A0(\g.g_y[0].g_x[4].t.w_gn ),
    .A1(\g.g_y[0].g_x[4].t.out_sc ),
    .S(\g.g_y[0].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[4].t.cw_v  (.A0(\g.g_y[0].g_x[4].t.w_v ),
    .A1(\g.g_y[0].g_x[4].t.out_sc ),
    .S(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cw_vb  (.A0(\g.g_y[0].g_x[4].t.in_b ),
    .A1(\g.g_y[0].g_x[4].t.in_t ),
    .S(\g.g_y[0].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[4].t.cw_vt  (.A0(\g.g_y[0].g_x[4].t.in_t ),
    .A1(\g.g_y[0].g_x[4].t.in_b ),
    .S(\g.g_y[0].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[5].t.cout_b  (.A0(\g.g_y[0].g_x[5].t.w_dh ),
    .A1(\g.g_y[0].g_x[5].t.w_ov ),
    .S(\g.g_y[0].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[5].t.cout_l  (.A0(\g.g_y[0].g_x[5].t.w_oh ),
    .A1(\g.g_y[0].g_x[5].t.w_dh ),
    .S(\g.g_y[0].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[5].t.cout_r  (.A0(\g.g_y[0].g_x[5].t.w_dh ),
    .A1(\g.g_y[0].g_x[5].t.w_oh ),
    .S(\g.g_y[0].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[0].g_x[5].t.cout_sc  (.CLK(clknet_3_0__leaf_clk),
    .D(\g.g_y[0].g_x[5].t.w_dv ),
    .SCD(net79),
    .SCE(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[0].g_x[5].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[5].t.cout_t  (.A0(\g.g_y[0].g_x[5].t.w_ov ),
    .A1(\g.g_y[0].g_x[5].t.w_dh ),
    .S(\g.g_y[0].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.out_t ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[5].t.cw_d  (.A0(\g.g_y[0].g_x[5].t.w_d ),
    .A1(\g.g_y[0].g_x[5].t.out_sc ),
    .S(net51),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[5].t.cw_dh  (.A0(\g.g_y[0].g_x[5].t.w_hl ),
    .A1(\g.g_y[0].g_x[5].t.w_vt ),
    .S(\g.g_y[0].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[5].t.cw_dv  (.A0(\g.g_y[0].g_x[5].t.w_vt ),
    .A1(\g.g_y[0].g_x[5].t.w_hl ),
    .S(\g.g_y[0].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[5].t.cw_h  (.A0(\g.g_y[0].g_x[5].t.w_h ),
    .A1(\g.g_y[0].g_x[5].t.out_sc ),
    .S(net42),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[5].t.cw_hl  (.A0(\g.g_y[0].g_x[4].t.out_r ),
    .A1(\g.g_y[0].g_x[5].t.in_r ),
    .S(\g.g_y[0].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[5].t.cw_hr  (.A0(\g.g_y[0].g_x[5].t.in_r ),
    .A1(\g.g_y[0].g_x[4].t.out_r ),
    .S(\g.g_y[0].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[0].g_x[5].t.cw_na  (.A(\g.g_y[0].g_x[5].t.w_hr ),
    .B(\g.g_y[0].g_x[5].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[0].g_x[5].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[5].t.cw_oh  (.A0(\g.g_y[0].g_x[5].t.out_sc ),
    .A1(\g.g_y[0].g_x[5].t.w_gn ),
    .S(\g.g_y[0].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[5].t.cw_ov  (.A0(\g.g_y[0].g_x[5].t.w_gn ),
    .A1(\g.g_y[0].g_x[5].t.out_sc ),
    .S(\g.g_y[0].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[5].t.cw_v  (.A0(\g.g_y[0].g_x[5].t.w_v ),
    .A1(\g.g_y[0].g_x[5].t.out_sc ),
    .S(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[5].t.cw_vb  (.A0(\g.g_y[0].g_x[5].t.in_b ),
    .A1(\g.g_y[0].g_x[5].t.in_t ),
    .S(\g.g_y[0].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[5].t.cw_vt  (.A0(\g.g_y[0].g_x[5].t.in_t ),
    .A1(\g.g_y[0].g_x[5].t.in_b ),
    .S(\g.g_y[0].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cout_b  (.A0(\g.g_y[0].g_x[6].t.w_gh ),
    .A1(\g.g_y[0].g_x[6].t.w_ov ),
    .S(\g.g_y[0].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cout_l  (.A0(\g.g_y[0].g_x[6].t.w_oh ),
    .A1(\g.g_y[0].g_x[6].t.w_gh ),
    .S(\g.g_y[0].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cout_r  (.A0(\g.g_y[0].g_x[6].t.w_gh ),
    .A1(\g.g_y[0].g_x[6].t.w_oh ),
    .S(\g.g_y[0].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[0].g_x[6].t.cout_sc  (.CLK(clknet_3_3__leaf_clk),
    .D(\g.g_y[0].g_x[6].t.w_dv ),
    .SCD(net86),
    .SCE(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[0].g_x[6].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cout_t  (.A0(\g.g_y[0].g_x[6].t.w_ov ),
    .A1(\g.g_y[0].g_x[6].t.w_gh ),
    .S(\g.g_y[0].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.out_t ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[6].t.cw_d  (.A0(\g.g_y[0].g_x[6].t.w_d ),
    .A1(\g.g_y[0].g_x[6].t.out_sc ),
    .S(net54),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cw_dh  (.A0(\g.g_y[0].g_x[6].t.w_hl ),
    .A1(\g.g_y[0].g_x[6].t.w_vt ),
    .S(\g.g_y[0].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cw_dv  (.A0(\g.g_y[0].g_x[6].t.w_vt ),
    .A1(\g.g_y[0].g_x[6].t.w_hl ),
    .S(\g.g_y[0].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cw_gh  (.A0(\g.g_y[0].g_x[6].t.w_dh ),
    .A1(\g.g_y[0].g_x[6].t.w_gh ),
    .S(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cw_gn  (.A0(\g.g_y[0].g_x[6].t.w_na ),
    .A1(\g.g_y[0].g_x[6].t.w_gn ),
    .S(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[6].t.cw_h  (.A0(\g.g_y[0].g_x[6].t.w_h ),
    .A1(\g.g_y[0].g_x[6].t.out_sc ),
    .S(net43),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cw_hl  (.A0(\g.g_y[0].g_x[5].t.out_r ),
    .A1(\g.g_y[0].g_x[6].t.in_r ),
    .S(\g.g_y[0].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cw_hr  (.A0(\g.g_y[0].g_x[6].t.in_r ),
    .A1(\g.g_y[0].g_x[5].t.out_r ),
    .S(\g.g_y[0].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[0].g_x[6].t.cw_na  (.A(\g.g_y[0].g_x[6].t.w_hr ),
    .B(\g.g_y[0].g_x[6].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[0].g_x[6].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cw_oh  (.A0(\g.g_y[0].g_x[6].t.out_sc ),
    .A1(\g.g_y[0].g_x[6].t.w_gn ),
    .S(\g.g_y[0].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cw_ov  (.A0(\g.g_y[0].g_x[6].t.w_gn ),
    .A1(\g.g_y[0].g_x[6].t.out_sc ),
    .S(\g.g_y[0].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[6].t.cw_v  (.A0(\g.g_y[0].g_x[6].t.w_v ),
    .A1(\g.g_y[0].g_x[6].t.out_sc ),
    .S(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cw_vb  (.A0(\g.g_y[0].g_x[6].t.in_b ),
    .A1(\g.g_y[0].g_x[6].t.in_t ),
    .S(\g.g_y[0].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[6].t.cw_vt  (.A0(\g.g_y[0].g_x[6].t.in_t ),
    .A1(\g.g_y[0].g_x[6].t.in_b ),
    .S(\g.g_y[0].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[7].t.cout_b  (.A0(\g.g_y[0].g_x[7].t.w_dh ),
    .A1(\g.g_y[0].g_x[7].t.w_ov ),
    .S(\g.g_y[0].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[7].t.cout_l  (.A0(\g.g_y[0].g_x[7].t.w_oh ),
    .A1(\g.g_y[0].g_x[7].t.w_dh ),
    .S(\g.g_y[0].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[7].t.cout_r  (.A0(\g.g_y[0].g_x[7].t.w_dh ),
    .A1(\g.g_y[0].g_x[7].t.w_oh ),
    .S(\g.g_y[0].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[0].g_x[7].t.cout_sc  (.CLK(clknet_3_2__leaf_clk),
    .D(\g.g_y[0].g_x[7].t.w_dv ),
    .SCD(net77),
    .SCE(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[0].g_x[7].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[7].t.cout_t  (.A0(\g.g_y[0].g_x[7].t.w_ov ),
    .A1(\g.g_y[0].g_x[7].t.w_dh ),
    .S(\g.g_y[0].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.out_t ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[7].t.cw_d  (.A0(\g.g_y[0].g_x[7].t.w_d ),
    .A1(\g.g_y[0].g_x[7].t.out_sc ),
    .S(net54),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[7].t.cw_dh  (.A0(\g.g_y[0].g_x[7].t.w_hl ),
    .A1(\g.g_y[0].g_x[7].t.w_vt ),
    .S(\g.g_y[0].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[7].t.cw_dv  (.A0(\g.g_y[0].g_x[7].t.w_vt ),
    .A1(\g.g_y[0].g_x[7].t.w_hl ),
    .S(\g.g_y[0].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[7].t.cw_h  (.A0(\g.g_y[0].g_x[7].t.w_h ),
    .A1(\g.g_y[0].g_x[7].t.out_sc ),
    .S(net44),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[7].t.cw_hl  (.A0(\g.g_y[0].g_x[6].t.out_r ),
    .A1(\g.g_y[0].g_x[0].t.out_l ),
    .S(\g.g_y[0].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[7].t.cw_hr  (.A0(\g.g_y[0].g_x[0].t.out_l ),
    .A1(\g.g_y[0].g_x[6].t.out_r ),
    .S(\g.g_y[0].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[0].g_x[7].t.cw_na  (.A(\g.g_y[0].g_x[7].t.w_hr ),
    .B(\g.g_y[0].g_x[7].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[0].g_x[7].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[7].t.cw_oh  (.A0(\g.g_y[0].g_x[7].t.out_sc ),
    .A1(\g.g_y[0].g_x[7].t.w_gn ),
    .S(\g.g_y[0].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[7].t.cw_ov  (.A0(\g.g_y[0].g_x[7].t.w_gn ),
    .A1(\g.g_y[0].g_x[7].t.out_sc ),
    .S(\g.g_y[0].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[0].g_x[7].t.cw_v  (.A0(\g.g_y[0].g_x[7].t.w_v ),
    .A1(\g.g_y[0].g_x[7].t.out_sc ),
    .S(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[7].t.cw_vb  (.A0(\g.g_y[0].g_x[7].t.in_b ),
    .A1(\g.g_y[0].g_x[7].t.in_t ),
    .S(\g.g_y[0].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[0].g_x[7].t.cw_vt  (.A0(\g.g_y[0].g_x[7].t.in_t ),
    .A1(\g.g_y[0].g_x[7].t.in_b ),
    .S(\g.g_y[0].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[0].t.cout_b  (.A0(\g.g_y[1].g_x[0].t.w_dh ),
    .A1(\g.g_y[1].g_x[0].t.w_ov ),
    .S(\g.g_y[1].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[0].t.cout_l  (.A0(\g.g_y[1].g_x[0].t.w_oh ),
    .A1(\g.g_y[1].g_x[0].t.w_dh ),
    .S(\g.g_y[1].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.out_l ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[0].t.cout_r  (.A0(\g.g_y[1].g_x[0].t.w_dh ),
    .A1(\g.g_y[1].g_x[0].t.w_oh ),
    .S(\g.g_y[1].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[1].g_x[0].t.cout_sc  (.CLK(clknet_3_7__leaf_clk),
    .D(\g.g_y[1].g_x[0].t.w_dv ),
    .SCD(net132),
    .SCE(net30),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[1].g_x[0].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[0].t.cout_t  (.A0(\g.g_y[1].g_x[0].t.w_ov ),
    .A1(\g.g_y[1].g_x[0].t.w_dh ),
    .S(\g.g_y[1].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[0].t.cw_d  (.A0(\g.g_y[1].g_x[0].t.w_d ),
    .A1(\g.g_y[1].g_x[0].t.out_sc ),
    .S(net58),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[0].t.cw_dh  (.A0(\g.g_y[1].g_x[0].t.w_hl ),
    .A1(\g.g_y[1].g_x[0].t.w_vt ),
    .S(\g.g_y[1].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[0].t.cw_dv  (.A0(\g.g_y[1].g_x[0].t.w_vt ),
    .A1(\g.g_y[1].g_x[0].t.w_hl ),
    .S(\g.g_y[1].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[0].t.cw_h  (.A0(\g.g_y[1].g_x[0].t.w_h ),
    .A1(\g.g_y[1].g_x[0].t.out_sc ),
    .S(net48),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[0].t.cw_hl  (.A0(net3),
    .A1(\g.g_y[1].g_x[0].t.in_r ),
    .S(\g.g_y[1].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[0].t.cw_hr  (.A0(\g.g_y[1].g_x[0].t.in_r ),
    .A1(net3),
    .S(\g.g_y[1].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[1].g_x[0].t.cw_na  (.A(\g.g_y[1].g_x[0].t.w_hr ),
    .B(\g.g_y[1].g_x[0].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[1].g_x[0].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[0].t.cw_oh  (.A0(\g.g_y[1].g_x[0].t.out_sc ),
    .A1(\g.g_y[1].g_x[0].t.w_gn ),
    .S(\g.g_y[1].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[0].t.cw_ov  (.A0(\g.g_y[1].g_x[0].t.w_gn ),
    .A1(\g.g_y[1].g_x[0].t.out_sc ),
    .S(\g.g_y[1].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[0].t.cw_v  (.A0(\g.g_y[1].g_x[0].t.w_v ),
    .A1(\g.g_y[1].g_x[0].t.out_sc ),
    .S(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[0].t.cw_vb  (.A0(\g.g_y[1].g_x[0].t.in_b ),
    .A1(\g.g_y[0].g_x[0].t.out_b ),
    .S(\g.g_y[1].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[0].t.cw_vt  (.A0(\g.g_y[0].g_x[0].t.out_b ),
    .A1(\g.g_y[1].g_x[0].t.in_b ),
    .S(\g.g_y[1].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cout_b  (.A0(\g.g_y[1].g_x[1].t.w_gh ),
    .A1(\g.g_y[1].g_x[1].t.w_ov ),
    .S(\g.g_y[1].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cout_l  (.A0(\g.g_y[1].g_x[1].t.w_oh ),
    .A1(\g.g_y[1].g_x[1].t.w_gh ),
    .S(\g.g_y[1].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cout_r  (.A0(\g.g_y[1].g_x[1].t.w_gh ),
    .A1(\g.g_y[1].g_x[1].t.w_oh ),
    .S(\g.g_y[1].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[1].g_x[1].t.cout_sc  (.CLK(clknet_3_7__leaf_clk),
    .D(\g.g_y[1].g_x[1].t.w_dv ),
    .SCD(net134),
    .SCE(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[1].g_x[1].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cout_t  (.A0(\g.g_y[1].g_x[1].t.w_ov ),
    .A1(\g.g_y[1].g_x[1].t.w_gh ),
    .S(\g.g_y[1].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[1].t.cw_d  (.A0(\g.g_y[1].g_x[1].t.w_d ),
    .A1(\g.g_y[1].g_x[1].t.out_sc ),
    .S(net57),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cw_dh  (.A0(\g.g_y[1].g_x[1].t.w_hl ),
    .A1(\g.g_y[1].g_x[1].t.w_vt ),
    .S(\g.g_y[1].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cw_dv  (.A0(\g.g_y[1].g_x[1].t.w_vt ),
    .A1(\g.g_y[1].g_x[1].t.w_hl ),
    .S(\g.g_y[1].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cw_gh  (.A0(\g.g_y[1].g_x[1].t.w_dh ),
    .A1(\g.g_y[1].g_x[1].t.w_gh ),
    .S(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cw_gn  (.A0(\g.g_y[1].g_x[1].t.w_na ),
    .A1(\g.g_y[1].g_x[1].t.w_gn ),
    .S(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[1].t.cw_h  (.A0(\g.g_y[1].g_x[1].t.w_h ),
    .A1(\g.g_y[1].g_x[1].t.out_sc ),
    .S(net47),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cw_hl  (.A0(\g.g_y[1].g_x[0].t.out_r ),
    .A1(\g.g_y[1].g_x[1].t.in_r ),
    .S(\g.g_y[1].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cw_hr  (.A0(\g.g_y[1].g_x[1].t.in_r ),
    .A1(\g.g_y[1].g_x[0].t.out_r ),
    .S(\g.g_y[1].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[1].g_x[1].t.cw_na  (.A(\g.g_y[1].g_x[1].t.w_hr ),
    .B(\g.g_y[1].g_x[1].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[1].g_x[1].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cw_oh  (.A0(\g.g_y[1].g_x[1].t.out_sc ),
    .A1(\g.g_y[1].g_x[1].t.w_gn ),
    .S(\g.g_y[1].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cw_ov  (.A0(\g.g_y[1].g_x[1].t.w_gn ),
    .A1(\g.g_y[1].g_x[1].t.out_sc ),
    .S(\g.g_y[1].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[1].t.cw_v  (.A0(\g.g_y[1].g_x[1].t.w_v ),
    .A1(\g.g_y[1].g_x[1].t.out_sc ),
    .S(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cw_vb  (.A0(\g.g_y[1].g_x[1].t.in_b ),
    .A1(\g.g_y[0].g_x[1].t.out_b ),
    .S(\g.g_y[1].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[1].t.cw_vt  (.A0(\g.g_y[0].g_x[1].t.out_b ),
    .A1(\g.g_y[1].g_x[1].t.in_b ),
    .S(\g.g_y[1].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[2].t.cout_b  (.A0(\g.g_y[1].g_x[2].t.w_dh ),
    .A1(\g.g_y[1].g_x[2].t.w_ov ),
    .S(\g.g_y[1].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[2].t.cout_l  (.A0(\g.g_y[1].g_x[2].t.w_oh ),
    .A1(\g.g_y[1].g_x[2].t.w_dh ),
    .S(\g.g_y[1].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[2].t.cout_r  (.A0(\g.g_y[1].g_x[2].t.w_dh ),
    .A1(\g.g_y[1].g_x[2].t.w_oh ),
    .S(\g.g_y[1].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[1].g_x[2].t.cout_sc  (.CLK(clknet_3_5__leaf_clk),
    .D(\g.g_y[1].g_x[2].t.w_dv ),
    .SCD(net83),
    .SCE(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[1].g_x[2].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[2].t.cout_t  (.A0(\g.g_y[1].g_x[2].t.w_ov ),
    .A1(\g.g_y[1].g_x[2].t.w_dh ),
    .S(\g.g_y[1].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[2].t.cw_d  (.A0(\g.g_y[1].g_x[2].t.w_d ),
    .A1(\g.g_y[1].g_x[2].t.out_sc ),
    .S(net56),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[2].t.cw_dh  (.A0(\g.g_y[1].g_x[2].t.w_hl ),
    .A1(\g.g_y[1].g_x[2].t.w_vt ),
    .S(\g.g_y[1].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[2].t.cw_dv  (.A0(\g.g_y[1].g_x[2].t.w_vt ),
    .A1(\g.g_y[1].g_x[2].t.w_hl ),
    .S(\g.g_y[1].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[2].t.cw_h  (.A0(\g.g_y[1].g_x[2].t.w_h ),
    .A1(\g.g_y[1].g_x[2].t.out_sc ),
    .S(net46),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[2].t.cw_hl  (.A0(\g.g_y[1].g_x[1].t.out_r ),
    .A1(\g.g_y[1].g_x[2].t.in_r ),
    .S(\g.g_y[1].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[2].t.cw_hr  (.A0(\g.g_y[1].g_x[2].t.in_r ),
    .A1(\g.g_y[1].g_x[1].t.out_r ),
    .S(\g.g_y[1].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[1].g_x[2].t.cw_na  (.A(\g.g_y[1].g_x[2].t.w_hr ),
    .B(\g.g_y[1].g_x[2].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[1].g_x[2].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[2].t.cw_oh  (.A0(\g.g_y[1].g_x[2].t.out_sc ),
    .A1(\g.g_y[1].g_x[2].t.w_gn ),
    .S(\g.g_y[1].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[2].t.cw_ov  (.A0(\g.g_y[1].g_x[2].t.w_gn ),
    .A1(\g.g_y[1].g_x[2].t.out_sc ),
    .S(\g.g_y[1].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[2].t.cw_v  (.A0(\g.g_y[1].g_x[2].t.w_v ),
    .A1(\g.g_y[1].g_x[2].t.out_sc ),
    .S(net37),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[2].t.cw_vb  (.A0(\g.g_y[1].g_x[2].t.in_b ),
    .A1(\g.g_y[0].g_x[2].t.out_b ),
    .S(\g.g_y[1].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[2].t.cw_vt  (.A0(\g.g_y[0].g_x[2].t.out_b ),
    .A1(\g.g_y[1].g_x[2].t.in_b ),
    .S(\g.g_y[1].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cout_b  (.A0(\g.g_y[1].g_x[3].t.w_gh ),
    .A1(\g.g_y[1].g_x[3].t.w_ov ),
    .S(\g.g_y[1].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cout_l  (.A0(\g.g_y[1].g_x[3].t.w_oh ),
    .A1(\g.g_y[1].g_x[3].t.w_gh ),
    .S(\g.g_y[1].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cout_r  (.A0(\g.g_y[1].g_x[3].t.w_gh ),
    .A1(\g.g_y[1].g_x[3].t.w_oh ),
    .S(\g.g_y[1].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[1].g_x[3].t.cout_sc  (.CLK(clknet_3_5__leaf_clk),
    .D(\g.g_y[1].g_x[3].t.w_dv ),
    .SCD(net105),
    .SCE(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[1].g_x[3].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cout_t  (.A0(\g.g_y[1].g_x[3].t.w_ov ),
    .A1(\g.g_y[1].g_x[3].t.w_gh ),
    .S(\g.g_y[1].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[3].t.cw_d  (.A0(\g.g_y[1].g_x[3].t.w_d ),
    .A1(\g.g_y[1].g_x[3].t.out_sc ),
    .S(net56),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cw_dh  (.A0(\g.g_y[1].g_x[3].t.w_hl ),
    .A1(\g.g_y[1].g_x[3].t.w_vt ),
    .S(\g.g_y[1].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cw_dv  (.A0(\g.g_y[1].g_x[3].t.w_vt ),
    .A1(\g.g_y[1].g_x[3].t.w_hl ),
    .S(\g.g_y[1].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cw_gh  (.A0(\g.g_y[1].g_x[3].t.w_dh ),
    .A1(\g.g_y[1].g_x[3].t.w_gh ),
    .S(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cw_gn  (.A0(\g.g_y[1].g_x[3].t.w_na ),
    .A1(\g.g_y[1].g_x[3].t.w_gn ),
    .S(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[3].t.cw_h  (.A0(\g.g_y[1].g_x[3].t.w_h ),
    .A1(\g.g_y[1].g_x[3].t.out_sc ),
    .S(net46),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cw_hl  (.A0(\g.g_y[1].g_x[2].t.out_r ),
    .A1(\g.g_y[1].g_x[3].t.in_r ),
    .S(\g.g_y[1].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cw_hr  (.A0(\g.g_y[1].g_x[3].t.in_r ),
    .A1(\g.g_y[1].g_x[2].t.out_r ),
    .S(\g.g_y[1].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[1].g_x[3].t.cw_na  (.A(\g.g_y[1].g_x[3].t.w_hr ),
    .B(\g.g_y[1].g_x[3].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[1].g_x[3].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cw_oh  (.A0(\g.g_y[1].g_x[3].t.out_sc ),
    .A1(\g.g_y[1].g_x[3].t.w_gn ),
    .S(\g.g_y[1].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cw_ov  (.A0(\g.g_y[1].g_x[3].t.w_gn ),
    .A1(\g.g_y[1].g_x[3].t.out_sc ),
    .S(\g.g_y[1].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[3].t.cw_v  (.A0(\g.g_y[1].g_x[3].t.w_v ),
    .A1(\g.g_y[1].g_x[3].t.out_sc ),
    .S(net37),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cw_vb  (.A0(\g.g_y[1].g_x[3].t.in_b ),
    .A1(\g.g_y[0].g_x[3].t.out_b ),
    .S(\g.g_y[1].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[3].t.cw_vt  (.A0(\g.g_y[0].g_x[3].t.out_b ),
    .A1(\g.g_y[1].g_x[3].t.in_b ),
    .S(\g.g_y[1].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[4].t.cout_b  (.A0(\g.g_y[1].g_x[4].t.w_dh ),
    .A1(\g.g_y[1].g_x[4].t.w_ov ),
    .S(\g.g_y[1].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[4].t.cout_l  (.A0(\g.g_y[1].g_x[4].t.w_oh ),
    .A1(\g.g_y[1].g_x[4].t.w_dh ),
    .S(\g.g_y[1].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[4].t.cout_r  (.A0(\g.g_y[1].g_x[4].t.w_dh ),
    .A1(\g.g_y[1].g_x[4].t.w_oh ),
    .S(\g.g_y[1].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[1].g_x[4].t.cout_sc  (.CLK(clknet_3_1__leaf_clk),
    .D(\g.g_y[1].g_x[4].t.w_dv ),
    .SCD(net131),
    .SCE(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[1].g_x[4].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[4].t.cout_t  (.A0(\g.g_y[1].g_x[4].t.w_ov ),
    .A1(\g.g_y[1].g_x[4].t.w_dh ),
    .S(\g.g_y[1].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[4].t.cw_d  (.A0(\g.g_y[1].g_x[4].t.w_d ),
    .A1(\g.g_y[1].g_x[4].t.out_sc ),
    .S(net52),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[4].t.cw_dh  (.A0(\g.g_y[1].g_x[4].t.w_hl ),
    .A1(\g.g_y[1].g_x[4].t.w_vt ),
    .S(\g.g_y[1].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[4].t.cw_dv  (.A0(\g.g_y[1].g_x[4].t.w_vt ),
    .A1(\g.g_y[1].g_x[4].t.w_hl ),
    .S(\g.g_y[1].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[4].t.cw_h  (.A0(\g.g_y[1].g_x[4].t.w_h ),
    .A1(\g.g_y[1].g_x[4].t.out_sc ),
    .S(net42),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[4].t.cw_hl  (.A0(\g.g_y[1].g_x[3].t.out_r ),
    .A1(\g.g_y[1].g_x[4].t.in_r ),
    .S(\g.g_y[1].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[4].t.cw_hr  (.A0(\g.g_y[1].g_x[4].t.in_r ),
    .A1(\g.g_y[1].g_x[3].t.out_r ),
    .S(\g.g_y[1].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[1].g_x[4].t.cw_na  (.A(\g.g_y[1].g_x[4].t.w_hr ),
    .B(\g.g_y[1].g_x[4].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[1].g_x[4].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[4].t.cw_oh  (.A0(\g.g_y[1].g_x[4].t.out_sc ),
    .A1(\g.g_y[1].g_x[4].t.w_gn ),
    .S(\g.g_y[1].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[4].t.cw_ov  (.A0(\g.g_y[1].g_x[4].t.w_gn ),
    .A1(\g.g_y[1].g_x[4].t.out_sc ),
    .S(\g.g_y[1].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[4].t.cw_v  (.A0(\g.g_y[1].g_x[4].t.w_v ),
    .A1(\g.g_y[1].g_x[4].t.out_sc ),
    .S(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[4].t.cw_vb  (.A0(\g.g_y[1].g_x[4].t.in_b ),
    .A1(\g.g_y[0].g_x[4].t.out_b ),
    .S(\g.g_y[1].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[4].t.cw_vt  (.A0(\g.g_y[0].g_x[4].t.out_b ),
    .A1(\g.g_y[1].g_x[4].t.in_b ),
    .S(\g.g_y[1].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cout_b  (.A0(\g.g_y[1].g_x[5].t.w_gh ),
    .A1(\g.g_y[1].g_x[5].t.w_ov ),
    .S(\g.g_y[1].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cout_l  (.A0(\g.g_y[1].g_x[5].t.w_oh ),
    .A1(\g.g_y[1].g_x[5].t.w_gh ),
    .S(\g.g_y[1].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cout_r  (.A0(\g.g_y[1].g_x[5].t.w_gh ),
    .A1(\g.g_y[1].g_x[5].t.w_oh ),
    .S(\g.g_y[1].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[1].g_x[5].t.cout_sc  (.CLK(clknet_3_1__leaf_clk),
    .D(\g.g_y[1].g_x[5].t.w_dv ),
    .SCD(net90),
    .SCE(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[1].g_x[5].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cout_t  (.A0(\g.g_y[1].g_x[5].t.w_ov ),
    .A1(\g.g_y[1].g_x[5].t.w_gh ),
    .S(\g.g_y[1].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[5].t.cw_d  (.A0(\g.g_y[1].g_x[5].t.w_d ),
    .A1(\g.g_y[1].g_x[5].t.out_sc ),
    .S(net52),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cw_dh  (.A0(\g.g_y[1].g_x[5].t.w_hl ),
    .A1(\g.g_y[1].g_x[5].t.w_vt ),
    .S(\g.g_y[1].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cw_dv  (.A0(\g.g_y[1].g_x[5].t.w_vt ),
    .A1(\g.g_y[1].g_x[5].t.w_hl ),
    .S(\g.g_y[1].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cw_gh  (.A0(\g.g_y[1].g_x[5].t.w_dh ),
    .A1(\g.g_y[1].g_x[5].t.w_gh ),
    .S(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cw_gn  (.A0(\g.g_y[1].g_x[5].t.w_na ),
    .A1(\g.g_y[1].g_x[5].t.w_gn ),
    .S(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[5].t.cw_h  (.A0(\g.g_y[1].g_x[5].t.w_h ),
    .A1(\g.g_y[1].g_x[5].t.out_sc ),
    .S(net42),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cw_hl  (.A0(\g.g_y[1].g_x[4].t.out_r ),
    .A1(\g.g_y[1].g_x[5].t.in_r ),
    .S(\g.g_y[1].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cw_hr  (.A0(\g.g_y[1].g_x[5].t.in_r ),
    .A1(\g.g_y[1].g_x[4].t.out_r ),
    .S(\g.g_y[1].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[1].g_x[5].t.cw_na  (.A(\g.g_y[1].g_x[5].t.w_hr ),
    .B(\g.g_y[1].g_x[5].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[1].g_x[5].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cw_oh  (.A0(\g.g_y[1].g_x[5].t.out_sc ),
    .A1(\g.g_y[1].g_x[5].t.w_gn ),
    .S(\g.g_y[1].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cw_ov  (.A0(\g.g_y[1].g_x[5].t.w_gn ),
    .A1(\g.g_y[1].g_x[5].t.out_sc ),
    .S(\g.g_y[1].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[5].t.cw_v  (.A0(\g.g_y[1].g_x[5].t.w_v ),
    .A1(\g.g_y[1].g_x[5].t.out_sc ),
    .S(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cw_vb  (.A0(\g.g_y[1].g_x[5].t.in_b ),
    .A1(\g.g_y[0].g_x[5].t.out_b ),
    .S(\g.g_y[1].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[5].t.cw_vt  (.A0(\g.g_y[0].g_x[5].t.out_b ),
    .A1(\g.g_y[1].g_x[5].t.in_b ),
    .S(\g.g_y[1].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[6].t.cout_b  (.A0(\g.g_y[1].g_x[6].t.w_dh ),
    .A1(\g.g_y[1].g_x[6].t.w_ov ),
    .S(\g.g_y[1].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[6].t.cout_l  (.A0(\g.g_y[1].g_x[6].t.w_oh ),
    .A1(\g.g_y[1].g_x[6].t.w_dh ),
    .S(\g.g_y[1].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[6].t.cout_r  (.A0(\g.g_y[1].g_x[6].t.w_dh ),
    .A1(\g.g_y[1].g_x[6].t.w_oh ),
    .S(\g.g_y[1].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[1].g_x[6].t.cout_sc  (.CLK(clknet_3_3__leaf_clk),
    .D(\g.g_y[1].g_x[6].t.w_dv ),
    .SCD(net84),
    .SCE(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[1].g_x[6].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[6].t.cout_t  (.A0(\g.g_y[1].g_x[6].t.w_ov ),
    .A1(\g.g_y[1].g_x[6].t.w_dh ),
    .S(\g.g_y[1].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[6].t.cw_d  (.A0(\g.g_y[1].g_x[6].t.w_d ),
    .A1(\g.g_y[1].g_x[6].t.out_sc ),
    .S(net53),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[6].t.cw_dh  (.A0(\g.g_y[1].g_x[6].t.w_hl ),
    .A1(\g.g_y[1].g_x[6].t.w_vt ),
    .S(\g.g_y[1].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[6].t.cw_dv  (.A0(\g.g_y[1].g_x[6].t.w_vt ),
    .A1(\g.g_y[1].g_x[6].t.w_hl ),
    .S(\g.g_y[1].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[6].t.cw_h  (.A0(\g.g_y[1].g_x[6].t.w_h ),
    .A1(\g.g_y[1].g_x[6].t.out_sc ),
    .S(net43),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[6].t.cw_hl  (.A0(\g.g_y[1].g_x[5].t.out_r ),
    .A1(\g.g_y[1].g_x[6].t.in_r ),
    .S(\g.g_y[1].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[6].t.cw_hr  (.A0(\g.g_y[1].g_x[6].t.in_r ),
    .A1(\g.g_y[1].g_x[5].t.out_r ),
    .S(\g.g_y[1].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[1].g_x[6].t.cw_na  (.A(\g.g_y[1].g_x[6].t.w_hr ),
    .B(\g.g_y[1].g_x[6].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[1].g_x[6].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[6].t.cw_oh  (.A0(\g.g_y[1].g_x[6].t.out_sc ),
    .A1(\g.g_y[1].g_x[6].t.w_gn ),
    .S(\g.g_y[1].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[6].t.cw_ov  (.A0(\g.g_y[1].g_x[6].t.w_gn ),
    .A1(\g.g_y[1].g_x[6].t.out_sc ),
    .S(\g.g_y[1].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[6].t.cw_v  (.A0(\g.g_y[1].g_x[6].t.w_v ),
    .A1(\g.g_y[1].g_x[6].t.out_sc ),
    .S(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[6].t.cw_vb  (.A0(\g.g_y[1].g_x[6].t.in_b ),
    .A1(\g.g_y[0].g_x[6].t.out_b ),
    .S(\g.g_y[1].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[6].t.cw_vt  (.A0(\g.g_y[0].g_x[6].t.out_b ),
    .A1(\g.g_y[1].g_x[6].t.in_b ),
    .S(\g.g_y[1].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cout_b  (.A0(\g.g_y[1].g_x[7].t.w_gh ),
    .A1(\g.g_y[1].g_x[7].t.w_ov ),
    .S(\g.g_y[1].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cout_l  (.A0(\g.g_y[1].g_x[7].t.w_oh ),
    .A1(\g.g_y[1].g_x[7].t.w_gh ),
    .S(\g.g_y[1].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cout_r  (.A0(\g.g_y[1].g_x[7].t.w_gh ),
    .A1(\g.g_y[1].g_x[7].t.w_oh ),
    .S(\g.g_y[1].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[1].g_x[7].t.cout_sc  (.CLK(clknet_3_3__leaf_clk),
    .D(\g.g_y[1].g_x[7].t.w_dv ),
    .SCD(net111),
    .SCE(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[1].g_x[7].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cout_t  (.A0(\g.g_y[1].g_x[7].t.w_ov ),
    .A1(\g.g_y[1].g_x[7].t.w_gh ),
    .S(\g.g_y[1].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[7].t.cw_d  (.A0(\g.g_y[1].g_x[7].t.w_d ),
    .A1(\g.g_y[1].g_x[7].t.out_sc ),
    .S(net54),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cw_dh  (.A0(\g.g_y[1].g_x[7].t.w_hl ),
    .A1(\g.g_y[1].g_x[7].t.w_vt ),
    .S(\g.g_y[1].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cw_dv  (.A0(\g.g_y[1].g_x[7].t.w_vt ),
    .A1(\g.g_y[1].g_x[7].t.w_hl ),
    .S(\g.g_y[1].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cw_gh  (.A0(\g.g_y[1].g_x[7].t.w_dh ),
    .A1(\g.g_y[1].g_x[7].t.w_gh ),
    .S(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cw_gn  (.A0(\g.g_y[1].g_x[7].t.w_na ),
    .A1(\g.g_y[1].g_x[7].t.w_gn ),
    .S(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[7].t.cw_h  (.A0(\g.g_y[1].g_x[7].t.w_h ),
    .A1(\g.g_y[1].g_x[7].t.out_sc ),
    .S(net44),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cw_hl  (.A0(\g.g_y[1].g_x[6].t.out_r ),
    .A1(\g.g_y[1].g_x[0].t.out_l ),
    .S(\g.g_y[1].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cw_hr  (.A0(\g.g_y[1].g_x[0].t.out_l ),
    .A1(\g.g_y[1].g_x[6].t.out_r ),
    .S(\g.g_y[1].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[1].g_x[7].t.cw_na  (.A(\g.g_y[1].g_x[7].t.w_hr ),
    .B(\g.g_y[1].g_x[7].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[1].g_x[7].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cw_oh  (.A0(\g.g_y[1].g_x[7].t.out_sc ),
    .A1(\g.g_y[1].g_x[7].t.w_gn ),
    .S(\g.g_y[1].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cw_ov  (.A0(\g.g_y[1].g_x[7].t.w_gn ),
    .A1(\g.g_y[1].g_x[7].t.out_sc ),
    .S(\g.g_y[1].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[1].g_x[7].t.cw_v  (.A0(\g.g_y[1].g_x[7].t.w_v ),
    .A1(\g.g_y[1].g_x[7].t.out_sc ),
    .S(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cw_vb  (.A0(\g.g_y[1].g_x[7].t.in_b ),
    .A1(\g.g_y[0].g_x[7].t.out_b ),
    .S(\g.g_y[1].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[1].g_x[7].t.cw_vt  (.A0(\g.g_y[0].g_x[7].t.out_b ),
    .A1(\g.g_y[1].g_x[7].t.in_b ),
    .S(\g.g_y[1].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cout_b  (.A0(\g.g_y[2].g_x[0].t.w_gh ),
    .A1(\g.g_y[2].g_x[0].t.w_ov ),
    .S(\g.g_y[2].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cout_l  (.A0(\g.g_y[2].g_x[0].t.w_oh ),
    .A1(\g.g_y[2].g_x[0].t.w_gh ),
    .S(\g.g_y[2].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.out_l ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cout_r  (.A0(\g.g_y[2].g_x[0].t.w_gh ),
    .A1(\g.g_y[2].g_x[0].t.w_oh ),
    .S(\g.g_y[2].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[2].g_x[0].t.cout_sc  (.CLK(clknet_3_7__leaf_clk),
    .D(\g.g_y[2].g_x[0].t.w_dv ),
    .SCD(net123),
    .SCE(net30),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[2].g_x[0].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cout_t  (.A0(\g.g_y[2].g_x[0].t.w_ov ),
    .A1(\g.g_y[2].g_x[0].t.w_gh ),
    .S(\g.g_y[2].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[0].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[0].t.cw_d  (.A0(\g.g_y[2].g_x[0].t.w_d ),
    .A1(\g.g_y[2].g_x[0].t.out_sc ),
    .S(net58),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cw_dh  (.A0(\g.g_y[2].g_x[0].t.w_hl ),
    .A1(\g.g_y[2].g_x[0].t.w_vt ),
    .S(\g.g_y[2].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cw_dv  (.A0(\g.g_y[2].g_x[0].t.w_vt ),
    .A1(\g.g_y[2].g_x[0].t.w_hl ),
    .S(\g.g_y[2].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cw_gh  (.A0(\g.g_y[2].g_x[0].t.w_dh ),
    .A1(\g.g_y[2].g_x[0].t.w_gh ),
    .S(net18),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cw_gn  (.A0(\g.g_y[2].g_x[0].t.w_na ),
    .A1(\g.g_y[2].g_x[0].t.w_gn ),
    .S(net18),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[0].t.cw_h  (.A0(\g.g_y[2].g_x[0].t.w_h ),
    .A1(\g.g_y[2].g_x[0].t.out_sc ),
    .S(net48),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cw_hl  (.A0(net4),
    .A1(\g.g_y[2].g_x[0].t.in_r ),
    .S(\g.g_y[2].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cw_hr  (.A0(\g.g_y[2].g_x[0].t.in_r ),
    .A1(net4),
    .S(\g.g_y[2].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[2].g_x[0].t.cw_na  (.A(\g.g_y[2].g_x[0].t.w_hr ),
    .B(\g.g_y[2].g_x[0].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[2].g_x[0].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cw_oh  (.A0(\g.g_y[2].g_x[0].t.out_sc ),
    .A1(\g.g_y[2].g_x[0].t.w_gn ),
    .S(\g.g_y[2].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cw_ov  (.A0(\g.g_y[2].g_x[0].t.w_gn ),
    .A1(\g.g_y[2].g_x[0].t.out_sc ),
    .S(\g.g_y[2].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[0].t.cw_v  (.A0(\g.g_y[2].g_x[0].t.w_v ),
    .A1(\g.g_y[2].g_x[0].t.out_sc ),
    .S(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cw_vb  (.A0(\g.g_y[2].g_x[0].t.in_b ),
    .A1(\g.g_y[1].g_x[0].t.out_b ),
    .S(\g.g_y[2].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[0].t.cw_vt  (.A0(\g.g_y[1].g_x[0].t.out_b ),
    .A1(\g.g_y[2].g_x[0].t.in_b ),
    .S(\g.g_y[2].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[1].t.cout_b  (.A0(\g.g_y[2].g_x[1].t.w_dh ),
    .A1(\g.g_y[2].g_x[1].t.w_ov ),
    .S(\g.g_y[2].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[1].t.cout_l  (.A0(\g.g_y[2].g_x[1].t.w_oh ),
    .A1(\g.g_y[2].g_x[1].t.w_dh ),
    .S(\g.g_y[2].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[1].t.cout_r  (.A0(\g.g_y[2].g_x[1].t.w_dh ),
    .A1(\g.g_y[2].g_x[1].t.w_oh ),
    .S(\g.g_y[2].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[2].g_x[1].t.cout_sc  (.CLK(clknet_3_7__leaf_clk),
    .D(\g.g_y[2].g_x[1].t.w_dv ),
    .SCD(net135),
    .SCE(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[2].g_x[1].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[1].t.cout_t  (.A0(\g.g_y[2].g_x[1].t.w_ov ),
    .A1(\g.g_y[2].g_x[1].t.w_dh ),
    .S(\g.g_y[2].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[1].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[1].t.cw_d  (.A0(\g.g_y[2].g_x[1].t.w_d ),
    .A1(\g.g_y[2].g_x[1].t.out_sc ),
    .S(net58),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[1].t.cw_dh  (.A0(\g.g_y[2].g_x[1].t.w_hl ),
    .A1(\g.g_y[2].g_x[1].t.w_vt ),
    .S(\g.g_y[2].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[1].t.cw_dv  (.A0(\g.g_y[2].g_x[1].t.w_vt ),
    .A1(\g.g_y[2].g_x[1].t.w_hl ),
    .S(\g.g_y[2].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[1].t.cw_h  (.A0(\g.g_y[2].g_x[1].t.w_h ),
    .A1(\g.g_y[2].g_x[1].t.out_sc ),
    .S(net45),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[1].t.cw_hl  (.A0(\g.g_y[2].g_x[0].t.out_r ),
    .A1(\g.g_y[2].g_x[1].t.in_r ),
    .S(\g.g_y[2].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[1].t.cw_hr  (.A0(\g.g_y[2].g_x[1].t.in_r ),
    .A1(\g.g_y[2].g_x[0].t.out_r ),
    .S(\g.g_y[2].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[2].g_x[1].t.cw_na  (.A(\g.g_y[2].g_x[1].t.w_hr ),
    .B(\g.g_y[2].g_x[1].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[2].g_x[1].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[1].t.cw_oh  (.A0(\g.g_y[2].g_x[1].t.out_sc ),
    .A1(\g.g_y[2].g_x[1].t.w_gn ),
    .S(\g.g_y[2].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[1].t.cw_ov  (.A0(\g.g_y[2].g_x[1].t.w_gn ),
    .A1(\g.g_y[2].g_x[1].t.out_sc ),
    .S(\g.g_y[2].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[1].t.cw_v  (.A0(\g.g_y[2].g_x[1].t.w_v ),
    .A1(\g.g_y[2].g_x[1].t.out_sc ),
    .S(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[1].t.cw_vb  (.A0(\g.g_y[2].g_x[1].t.in_b ),
    .A1(\g.g_y[1].g_x[1].t.out_b ),
    .S(\g.g_y[2].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[1].t.cw_vt  (.A0(\g.g_y[1].g_x[1].t.out_b ),
    .A1(\g.g_y[2].g_x[1].t.in_b ),
    .S(\g.g_y[2].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[2].t.cout_b  (.A0(\g.g_y[2].g_x[2].t.w_gh ),
    .A1(\g.g_y[2].g_x[2].t.w_ov ),
    .S(\g.g_y[2].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[2].t.cout_l  (.A0(\g.g_y[2].g_x[2].t.w_oh ),
    .A1(\g.g_y[2].g_x[2].t.w_gh ),
    .S(\g.g_y[2].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[2].t.cout_r  (.A0(\g.g_y[2].g_x[2].t.w_gh ),
    .A1(\g.g_y[2].g_x[2].t.w_oh ),
    .S(\g.g_y[2].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_2 \g.g_y[2].g_x[2].t.cout_sc  (.CLK(clknet_3_5__leaf_clk),
    .D(\g.g_y[2].g_x[2].t.w_dv ),
    .SCD(net108),
    .SCE(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[2].g_x[2].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[2].t.cout_t  (.A0(\g.g_y[2].g_x[2].t.w_ov ),
    .A1(\g.g_y[2].g_x[2].t.w_gh ),
    .S(\g.g_y[2].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[2].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[2].t.cw_d  (.A0(\g.g_y[2].g_x[2].t.w_d ),
    .A1(\g.g_y[2].g_x[2].t.out_sc ),
    .S(net56),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[2].t.cw_dh  (.A0(\g.g_y[2].g_x[2].t.w_hl ),
    .A1(\g.g_y[2].g_x[2].t.w_vt ),
    .S(\g.g_y[2].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[2].t.cw_dv  (.A0(\g.g_y[2].g_x[2].t.w_vt ),
    .A1(\g.g_y[2].g_x[2].t.w_hl ),
    .S(\g.g_y[2].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[2].t.cw_gh  (.A0(\g.g_y[2].g_x[2].t.w_dh ),
    .A1(\g.g_y[2].g_x[2].t.w_gh ),
    .S(net49),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[2].t.cw_gn  (.A0(\g.g_y[2].g_x[2].t.w_na ),
    .A1(\g.g_y[2].g_x[2].t.w_gn ),
    .S(net49),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[2].t.cw_h  (.A0(\g.g_y[2].g_x[2].t.w_h ),
    .A1(\g.g_y[2].g_x[2].t.out_sc ),
    .S(net46),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[2].t.cw_hl  (.A0(\g.g_y[2].g_x[1].t.out_r ),
    .A1(\g.g_y[2].g_x[2].t.in_r ),
    .S(\g.g_y[2].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[2].t.cw_hr  (.A0(\g.g_y[2].g_x[2].t.in_r ),
    .A1(\g.g_y[2].g_x[1].t.out_r ),
    .S(\g.g_y[2].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[2].g_x[2].t.cw_na  (.A(\g.g_y[2].g_x[2].t.w_hr ),
    .B(\g.g_y[2].g_x[2].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[2].g_x[2].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[2].t.cw_oh  (.A0(\g.g_y[2].g_x[2].t.out_sc ),
    .A1(\g.g_y[2].g_x[2].t.w_gn ),
    .S(\g.g_y[2].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[2].t.cw_ov  (.A0(\g.g_y[2].g_x[2].t.w_gn ),
    .A1(\g.g_y[2].g_x[2].t.out_sc ),
    .S(\g.g_y[2].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[2].t.cw_v  (.A0(\g.g_y[2].g_x[2].t.w_v ),
    .A1(\g.g_y[2].g_x[2].t.out_sc ),
    .S(net37),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[2].t.cw_vb  (.A0(\g.g_y[2].g_x[2].t.in_b ),
    .A1(\g.g_y[1].g_x[2].t.out_b ),
    .S(\g.g_y[2].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[2].t.cw_vt  (.A0(\g.g_y[1].g_x[2].t.out_b ),
    .A1(\g.g_y[2].g_x[2].t.in_b ),
    .S(\g.g_y[2].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[3].t.cout_b  (.A0(\g.g_y[2].g_x[3].t.w_dh ),
    .A1(\g.g_y[2].g_x[3].t.w_ov ),
    .S(\g.g_y[2].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[3].t.cout_l  (.A0(\g.g_y[2].g_x[3].t.w_oh ),
    .A1(\g.g_y[2].g_x[3].t.w_dh ),
    .S(\g.g_y[2].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[3].t.cout_r  (.A0(\g.g_y[2].g_x[3].t.w_dh ),
    .A1(\g.g_y[2].g_x[3].t.w_oh ),
    .S(\g.g_y[2].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_2 \g.g_y[2].g_x[3].t.cout_sc  (.CLK(clknet_3_5__leaf_clk),
    .D(\g.g_y[2].g_x[3].t.w_dv ),
    .SCD(net130),
    .SCE(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[2].g_x[3].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[3].t.cout_t  (.A0(\g.g_y[2].g_x[3].t.w_ov ),
    .A1(\g.g_y[2].g_x[3].t.w_dh ),
    .S(\g.g_y[2].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[3].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[3].t.cw_d  (.A0(\g.g_y[2].g_x[3].t.w_d ),
    .A1(\g.g_y[2].g_x[3].t.out_sc ),
    .S(net56),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[3].t.cw_dh  (.A0(\g.g_y[2].g_x[3].t.w_hl ),
    .A1(\g.g_y[2].g_x[3].t.w_vt ),
    .S(\g.g_y[2].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[3].t.cw_dv  (.A0(\g.g_y[2].g_x[3].t.w_vt ),
    .A1(\g.g_y[2].g_x[3].t.w_hl ),
    .S(\g.g_y[2].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[3].t.cw_h  (.A0(\g.g_y[2].g_x[3].t.w_h ),
    .A1(\g.g_y[2].g_x[3].t.out_sc ),
    .S(net46),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[3].t.cw_hl  (.A0(\g.g_y[2].g_x[2].t.out_r ),
    .A1(\g.g_y[2].g_x[3].t.in_r ),
    .S(\g.g_y[2].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[3].t.cw_hr  (.A0(\g.g_y[2].g_x[3].t.in_r ),
    .A1(\g.g_y[2].g_x[2].t.out_r ),
    .S(\g.g_y[2].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[2].g_x[3].t.cw_na  (.A(\g.g_y[2].g_x[3].t.w_hr ),
    .B(\g.g_y[2].g_x[3].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[2].g_x[3].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[3].t.cw_oh  (.A0(\g.g_y[2].g_x[3].t.out_sc ),
    .A1(\g.g_y[2].g_x[3].t.w_gn ),
    .S(\g.g_y[2].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[3].t.cw_ov  (.A0(\g.g_y[2].g_x[3].t.w_gn ),
    .A1(\g.g_y[2].g_x[3].t.out_sc ),
    .S(\g.g_y[2].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[3].t.cw_v  (.A0(\g.g_y[2].g_x[3].t.w_v ),
    .A1(\g.g_y[2].g_x[3].t.out_sc ),
    .S(net37),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[3].t.cw_vb  (.A0(\g.g_y[2].g_x[3].t.in_b ),
    .A1(\g.g_y[1].g_x[3].t.out_b ),
    .S(\g.g_y[2].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[3].t.cw_vt  (.A0(\g.g_y[1].g_x[3].t.out_b ),
    .A1(\g.g_y[2].g_x[3].t.in_b ),
    .S(\g.g_y[2].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cout_b  (.A0(\g.g_y[2].g_x[4].t.w_gh ),
    .A1(\g.g_y[2].g_x[4].t.w_ov ),
    .S(\g.g_y[2].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cout_l  (.A0(\g.g_y[2].g_x[4].t.w_oh ),
    .A1(\g.g_y[2].g_x[4].t.w_gh ),
    .S(\g.g_y[2].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cout_r  (.A0(\g.g_y[2].g_x[4].t.w_gh ),
    .A1(\g.g_y[2].g_x[4].t.w_oh ),
    .S(\g.g_y[2].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[2].g_x[4].t.cout_sc  (.CLK(clknet_3_1__leaf_clk),
    .D(\g.g_y[2].g_x[4].t.w_dv ),
    .SCD(\g.g_y[2].g_x[3].t.out_sc ),
    .SCE(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[2].g_x[4].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cout_t  (.A0(\g.g_y[2].g_x[4].t.w_ov ),
    .A1(\g.g_y[2].g_x[4].t.w_gh ),
    .S(\g.g_y[2].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[4].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[4].t.cw_d  (.A0(\g.g_y[2].g_x[4].t.w_d ),
    .A1(\g.g_y[2].g_x[4].t.out_sc ),
    .S(net52),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cw_dh  (.A0(\g.g_y[2].g_x[4].t.w_hl ),
    .A1(\g.g_y[2].g_x[4].t.w_vt ),
    .S(\g.g_y[2].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cw_dv  (.A0(\g.g_y[2].g_x[4].t.w_vt ),
    .A1(\g.g_y[2].g_x[4].t.w_hl ),
    .S(\g.g_y[2].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cw_gh  (.A0(\g.g_y[2].g_x[4].t.w_dh ),
    .A1(\g.g_y[2].g_x[4].t.w_gh ),
    .S(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cw_gn  (.A0(\g.g_y[2].g_x[4].t.w_na ),
    .A1(\g.g_y[2].g_x[4].t.w_gn ),
    .S(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[4].t.cw_h  (.A0(\g.g_y[2].g_x[4].t.w_h ),
    .A1(\g.g_y[2].g_x[4].t.out_sc ),
    .S(net42),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cw_hl  (.A0(\g.g_y[2].g_x[3].t.out_r ),
    .A1(\g.g_y[2].g_x[4].t.in_r ),
    .S(\g.g_y[2].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cw_hr  (.A0(\g.g_y[2].g_x[4].t.in_r ),
    .A1(\g.g_y[2].g_x[3].t.out_r ),
    .S(\g.g_y[2].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[2].g_x[4].t.cw_na  (.A(\g.g_y[2].g_x[4].t.w_hr ),
    .B(\g.g_y[2].g_x[4].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[2].g_x[4].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cw_oh  (.A0(\g.g_y[2].g_x[4].t.out_sc ),
    .A1(\g.g_y[2].g_x[4].t.w_gn ),
    .S(\g.g_y[2].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cw_ov  (.A0(\g.g_y[2].g_x[4].t.w_gn ),
    .A1(\g.g_y[2].g_x[4].t.out_sc ),
    .S(\g.g_y[2].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[4].t.cw_v  (.A0(\g.g_y[2].g_x[4].t.w_v ),
    .A1(\g.g_y[2].g_x[4].t.out_sc ),
    .S(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cw_vb  (.A0(\g.g_y[2].g_x[4].t.in_b ),
    .A1(\g.g_y[1].g_x[4].t.out_b ),
    .S(\g.g_y[2].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[4].t.cw_vt  (.A0(\g.g_y[1].g_x[4].t.out_b ),
    .A1(\g.g_y[2].g_x[4].t.in_b ),
    .S(\g.g_y[2].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[5].t.cout_b  (.A0(\g.g_y[2].g_x[5].t.w_dh ),
    .A1(\g.g_y[2].g_x[5].t.w_ov ),
    .S(\g.g_y[2].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[5].t.cout_l  (.A0(\g.g_y[2].g_x[5].t.w_oh ),
    .A1(\g.g_y[2].g_x[5].t.w_dh ),
    .S(\g.g_y[2].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[5].t.cout_r  (.A0(\g.g_y[2].g_x[5].t.w_dh ),
    .A1(\g.g_y[2].g_x[5].t.w_oh ),
    .S(\g.g_y[2].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[2].g_x[5].t.cout_sc  (.CLK(clknet_3_1__leaf_clk),
    .D(\g.g_y[2].g_x[5].t.w_dv ),
    .SCD(net103),
    .SCE(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[2].g_x[5].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[5].t.cout_t  (.A0(\g.g_y[2].g_x[5].t.w_ov ),
    .A1(\g.g_y[2].g_x[5].t.w_dh ),
    .S(\g.g_y[2].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[5].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[5].t.cw_d  (.A0(\g.g_y[2].g_x[5].t.w_d ),
    .A1(\g.g_y[2].g_x[5].t.out_sc ),
    .S(net52),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[5].t.cw_dh  (.A0(\g.g_y[2].g_x[5].t.w_hl ),
    .A1(\g.g_y[2].g_x[5].t.w_vt ),
    .S(\g.g_y[2].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[5].t.cw_dv  (.A0(\g.g_y[2].g_x[5].t.w_vt ),
    .A1(\g.g_y[2].g_x[5].t.w_hl ),
    .S(\g.g_y[2].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[5].t.cw_h  (.A0(\g.g_y[2].g_x[5].t.w_h ),
    .A1(\g.g_y[2].g_x[5].t.out_sc ),
    .S(net42),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[5].t.cw_hl  (.A0(\g.g_y[2].g_x[4].t.out_r ),
    .A1(\g.g_y[2].g_x[5].t.in_r ),
    .S(\g.g_y[2].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[5].t.cw_hr  (.A0(\g.g_y[2].g_x[5].t.in_r ),
    .A1(\g.g_y[2].g_x[4].t.out_r ),
    .S(\g.g_y[2].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[2].g_x[5].t.cw_na  (.A(\g.g_y[2].g_x[5].t.w_hr ),
    .B(\g.g_y[2].g_x[5].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[2].g_x[5].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[5].t.cw_oh  (.A0(\g.g_y[2].g_x[5].t.out_sc ),
    .A1(\g.g_y[2].g_x[5].t.w_gn ),
    .S(\g.g_y[2].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[5].t.cw_ov  (.A0(\g.g_y[2].g_x[5].t.w_gn ),
    .A1(\g.g_y[2].g_x[5].t.out_sc ),
    .S(\g.g_y[2].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[5].t.cw_v  (.A0(\g.g_y[2].g_x[5].t.w_v ),
    .A1(\g.g_y[2].g_x[5].t.out_sc ),
    .S(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[5].t.cw_vb  (.A0(\g.g_y[2].g_x[5].t.in_b ),
    .A1(\g.g_y[1].g_x[5].t.out_b ),
    .S(\g.g_y[2].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[5].t.cw_vt  (.A0(\g.g_y[1].g_x[5].t.out_b ),
    .A1(\g.g_y[2].g_x[5].t.in_b ),
    .S(\g.g_y[2].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cout_b  (.A0(\g.g_y[2].g_x[6].t.w_gh ),
    .A1(\g.g_y[2].g_x[6].t.w_ov ),
    .S(\g.g_y[2].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cout_l  (.A0(\g.g_y[2].g_x[6].t.w_oh ),
    .A1(\g.g_y[2].g_x[6].t.w_gh ),
    .S(\g.g_y[2].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cout_r  (.A0(\g.g_y[2].g_x[6].t.w_gh ),
    .A1(\g.g_y[2].g_x[6].t.w_oh ),
    .S(\g.g_y[2].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[2].g_x[6].t.cout_sc  (.CLK(clknet_3_3__leaf_clk),
    .D(\g.g_y[2].g_x[6].t.w_dv ),
    .SCD(net96),
    .SCE(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[2].g_x[6].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cout_t  (.A0(\g.g_y[2].g_x[6].t.w_ov ),
    .A1(\g.g_y[2].g_x[6].t.w_gh ),
    .S(\g.g_y[2].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[6].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[6].t.cw_d  (.A0(\g.g_y[2].g_x[6].t.w_d ),
    .A1(\g.g_y[2].g_x[6].t.out_sc ),
    .S(net53),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cw_dh  (.A0(\g.g_y[2].g_x[6].t.w_hl ),
    .A1(\g.g_y[2].g_x[6].t.w_vt ),
    .S(\g.g_y[2].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cw_dv  (.A0(\g.g_y[2].g_x[6].t.w_vt ),
    .A1(\g.g_y[2].g_x[6].t.w_hl ),
    .S(\g.g_y[2].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cw_gh  (.A0(\g.g_y[2].g_x[6].t.w_dh ),
    .A1(\g.g_y[2].g_x[6].t.w_gh ),
    .S(net49),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cw_gn  (.A0(\g.g_y[2].g_x[6].t.w_na ),
    .A1(\g.g_y[2].g_x[6].t.w_gn ),
    .S(net49),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[6].t.cw_h  (.A0(\g.g_y[2].g_x[6].t.w_h ),
    .A1(\g.g_y[2].g_x[6].t.out_sc ),
    .S(net41),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cw_hl  (.A0(\g.g_y[2].g_x[5].t.out_r ),
    .A1(\g.g_y[2].g_x[6].t.in_r ),
    .S(\g.g_y[2].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cw_hr  (.A0(\g.g_y[2].g_x[6].t.in_r ),
    .A1(\g.g_y[2].g_x[5].t.out_r ),
    .S(\g.g_y[2].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[2].g_x[6].t.cw_na  (.A(\g.g_y[2].g_x[6].t.w_hr ),
    .B(\g.g_y[2].g_x[6].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[2].g_x[6].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cw_oh  (.A0(\g.g_y[2].g_x[6].t.out_sc ),
    .A1(\g.g_y[2].g_x[6].t.w_gn ),
    .S(\g.g_y[2].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cw_ov  (.A0(\g.g_y[2].g_x[6].t.w_gn ),
    .A1(\g.g_y[2].g_x[6].t.out_sc ),
    .S(\g.g_y[2].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[6].t.cw_v  (.A0(\g.g_y[2].g_x[6].t.w_v ),
    .A1(\g.g_y[2].g_x[6].t.out_sc ),
    .S(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cw_vb  (.A0(\g.g_y[2].g_x[6].t.in_b ),
    .A1(\g.g_y[1].g_x[6].t.out_b ),
    .S(\g.g_y[2].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[6].t.cw_vt  (.A0(\g.g_y[1].g_x[6].t.out_b ),
    .A1(\g.g_y[2].g_x[6].t.in_b ),
    .S(\g.g_y[2].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[7].t.cout_b  (.A0(\g.g_y[2].g_x[7].t.w_dh ),
    .A1(\g.g_y[2].g_x[7].t.w_ov ),
    .S(\g.g_y[2].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[7].t.cout_l  (.A0(\g.g_y[2].g_x[7].t.w_oh ),
    .A1(\g.g_y[2].g_x[7].t.w_dh ),
    .S(\g.g_y[2].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[7].t.cout_r  (.A0(\g.g_y[2].g_x[7].t.w_dh ),
    .A1(\g.g_y[2].g_x[7].t.w_oh ),
    .S(\g.g_y[2].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[2].g_x[7].t.cout_sc  (.CLK(clknet_3_3__leaf_clk),
    .D(\g.g_y[2].g_x[7].t.w_dv ),
    .SCD(net95),
    .SCE(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[2].g_x[7].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[7].t.cout_t  (.A0(\g.g_y[2].g_x[7].t.w_ov ),
    .A1(\g.g_y[2].g_x[7].t.w_dh ),
    .S(\g.g_y[2].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[1].g_x[7].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[7].t.cw_d  (.A0(\g.g_y[2].g_x[7].t.w_d ),
    .A1(\g.g_y[2].g_x[7].t.out_sc ),
    .S(net54),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[7].t.cw_dh  (.A0(\g.g_y[2].g_x[7].t.w_hl ),
    .A1(\g.g_y[2].g_x[7].t.w_vt ),
    .S(\g.g_y[2].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[7].t.cw_dv  (.A0(\g.g_y[2].g_x[7].t.w_vt ),
    .A1(\g.g_y[2].g_x[7].t.w_hl ),
    .S(\g.g_y[2].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[7].t.cw_h  (.A0(\g.g_y[2].g_x[7].t.w_h ),
    .A1(\g.g_y[2].g_x[7].t.out_sc ),
    .S(net43),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[7].t.cw_hl  (.A0(\g.g_y[2].g_x[6].t.out_r ),
    .A1(\g.g_y[2].g_x[0].t.out_l ),
    .S(\g.g_y[2].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[7].t.cw_hr  (.A0(\g.g_y[2].g_x[0].t.out_l ),
    .A1(\g.g_y[2].g_x[6].t.out_r ),
    .S(\g.g_y[2].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[2].g_x[7].t.cw_na  (.A(\g.g_y[2].g_x[7].t.w_hr ),
    .B(\g.g_y[2].g_x[7].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[2].g_x[7].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[7].t.cw_oh  (.A0(\g.g_y[2].g_x[7].t.out_sc ),
    .A1(\g.g_y[2].g_x[7].t.w_gn ),
    .S(\g.g_y[2].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[7].t.cw_ov  (.A0(\g.g_y[2].g_x[7].t.w_gn ),
    .A1(\g.g_y[2].g_x[7].t.out_sc ),
    .S(\g.g_y[2].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[2].g_x[7].t.cw_v  (.A0(\g.g_y[2].g_x[7].t.w_v ),
    .A1(\g.g_y[2].g_x[7].t.out_sc ),
    .S(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[7].t.cw_vb  (.A0(\g.g_y[2].g_x[7].t.in_b ),
    .A1(\g.g_y[1].g_x[7].t.out_b ),
    .S(\g.g_y[2].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[2].g_x[7].t.cw_vt  (.A0(\g.g_y[1].g_x[7].t.out_b ),
    .A1(\g.g_y[2].g_x[7].t.in_b ),
    .S(\g.g_y[2].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[0].t.cout_b  (.A0(\g.g_y[3].g_x[0].t.w_dh ),
    .A1(\g.g_y[3].g_x[0].t.w_ov ),
    .S(\g.g_y[3].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[0].t.cout_l  (.A0(\g.g_y[3].g_x[0].t.w_oh ),
    .A1(\g.g_y[3].g_x[0].t.w_dh ),
    .S(\g.g_y[3].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.out_l ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[0].t.cout_r  (.A0(\g.g_y[3].g_x[0].t.w_dh ),
    .A1(\g.g_y[3].g_x[0].t.w_oh ),
    .S(\g.g_y[3].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[3].g_x[0].t.cout_sc  (.CLK(clknet_3_7__leaf_clk),
    .D(\g.g_y[3].g_x[0].t.w_dv ),
    .SCD(net109),
    .SCE(net30),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[3].g_x[0].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[0].t.cout_t  (.A0(\g.g_y[3].g_x[0].t.w_ov ),
    .A1(\g.g_y[3].g_x[0].t.w_dh ),
    .S(\g.g_y[3].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[0].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[0].t.cw_d  (.A0(\g.g_y[3].g_x[0].t.w_d ),
    .A1(\g.g_y[3].g_x[0].t.out_sc ),
    .S(net58),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[0].t.cw_dh  (.A0(\g.g_y[3].g_x[0].t.w_hl ),
    .A1(\g.g_y[3].g_x[0].t.w_vt ),
    .S(\g.g_y[3].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[0].t.cw_dv  (.A0(\g.g_y[3].g_x[0].t.w_vt ),
    .A1(\g.g_y[3].g_x[0].t.w_hl ),
    .S(\g.g_y[3].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[0].t.cw_h  (.A0(\g.g_y[3].g_x[0].t.w_h ),
    .A1(\g.g_y[3].g_x[0].t.out_sc ),
    .S(net48),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[0].t.cw_hl  (.A0(net5),
    .A1(\g.g_y[3].g_x[0].t.in_r ),
    .S(\g.g_y[3].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[0].t.cw_hr  (.A0(\g.g_y[3].g_x[0].t.in_r ),
    .A1(net5),
    .S(\g.g_y[3].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[3].g_x[0].t.cw_na  (.A(\g.g_y[3].g_x[0].t.w_hr ),
    .B(\g.g_y[3].g_x[0].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[3].g_x[0].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[0].t.cw_oh  (.A0(\g.g_y[3].g_x[0].t.out_sc ),
    .A1(\g.g_y[3].g_x[0].t.w_gn ),
    .S(\g.g_y[3].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[0].t.cw_ov  (.A0(\g.g_y[3].g_x[0].t.w_gn ),
    .A1(\g.g_y[3].g_x[0].t.out_sc ),
    .S(\g.g_y[3].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[0].t.cw_v  (.A0(\g.g_y[3].g_x[0].t.w_v ),
    .A1(\g.g_y[3].g_x[0].t.out_sc ),
    .S(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[0].t.cw_vb  (.A0(\g.g_y[3].g_x[0].t.in_b ),
    .A1(\g.g_y[2].g_x[0].t.out_b ),
    .S(\g.g_y[3].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[0].t.cw_vt  (.A0(\g.g_y[2].g_x[0].t.out_b ),
    .A1(\g.g_y[3].g_x[0].t.in_b ),
    .S(\g.g_y[3].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cout_b  (.A0(\g.g_y[3].g_x[1].t.w_gh ),
    .A1(\g.g_y[3].g_x[1].t.w_ov ),
    .S(\g.g_y[3].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cout_l  (.A0(\g.g_y[3].g_x[1].t.w_oh ),
    .A1(\g.g_y[3].g_x[1].t.w_gh ),
    .S(\g.g_y[3].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cout_r  (.A0(\g.g_y[3].g_x[1].t.w_gh ),
    .A1(\g.g_y[3].g_x[1].t.w_oh ),
    .S(\g.g_y[3].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[3].g_x[1].t.cout_sc  (.CLK(clknet_3_7__leaf_clk),
    .D(\g.g_y[3].g_x[1].t.w_dv ),
    .SCD(net118),
    .SCE(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[3].g_x[1].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cout_t  (.A0(\g.g_y[3].g_x[1].t.w_ov ),
    .A1(\g.g_y[3].g_x[1].t.w_gh ),
    .S(\g.g_y[3].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[1].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[1].t.cw_d  (.A0(\g.g_y[3].g_x[1].t.w_d ),
    .A1(\g.g_y[3].g_x[1].t.out_sc ),
    .S(net57),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cw_dh  (.A0(\g.g_y[3].g_x[1].t.w_hl ),
    .A1(\g.g_y[3].g_x[1].t.w_vt ),
    .S(\g.g_y[3].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cw_dv  (.A0(\g.g_y[3].g_x[1].t.w_vt ),
    .A1(\g.g_y[3].g_x[1].t.w_hl ),
    .S(\g.g_y[3].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cw_gh  (.A0(\g.g_y[3].g_x[1].t.w_dh ),
    .A1(\g.g_y[3].g_x[1].t.w_gh ),
    .S(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cw_gn  (.A0(\g.g_y[3].g_x[1].t.w_na ),
    .A1(\g.g_y[3].g_x[1].t.w_gn ),
    .S(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[1].t.cw_h  (.A0(\g.g_y[3].g_x[1].t.w_h ),
    .A1(\g.g_y[3].g_x[1].t.out_sc ),
    .S(net46),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cw_hl  (.A0(\g.g_y[3].g_x[0].t.out_r ),
    .A1(\g.g_y[3].g_x[1].t.in_r ),
    .S(\g.g_y[3].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cw_hr  (.A0(\g.g_y[3].g_x[1].t.in_r ),
    .A1(\g.g_y[3].g_x[0].t.out_r ),
    .S(\g.g_y[3].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[3].g_x[1].t.cw_na  (.A(\g.g_y[3].g_x[1].t.w_hr ),
    .B(\g.g_y[3].g_x[1].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[3].g_x[1].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cw_oh  (.A0(\g.g_y[3].g_x[1].t.out_sc ),
    .A1(\g.g_y[3].g_x[1].t.w_gn ),
    .S(\g.g_y[3].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cw_ov  (.A0(\g.g_y[3].g_x[1].t.w_gn ),
    .A1(\g.g_y[3].g_x[1].t.out_sc ),
    .S(\g.g_y[3].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[1].t.cw_v  (.A0(\g.g_y[3].g_x[1].t.w_v ),
    .A1(\g.g_y[3].g_x[1].t.out_sc ),
    .S(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cw_vb  (.A0(\g.g_y[3].g_x[1].t.in_b ),
    .A1(\g.g_y[2].g_x[1].t.out_b ),
    .S(\g.g_y[3].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[1].t.cw_vt  (.A0(\g.g_y[2].g_x[1].t.out_b ),
    .A1(\g.g_y[3].g_x[1].t.in_b ),
    .S(\g.g_y[3].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[2].t.cout_b  (.A0(\g.g_y[3].g_x[2].t.w_dh ),
    .A1(\g.g_y[3].g_x[2].t.w_ov ),
    .S(\g.g_y[3].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[2].t.cout_l  (.A0(\g.g_y[3].g_x[2].t.w_oh ),
    .A1(\g.g_y[3].g_x[2].t.w_dh ),
    .S(\g.g_y[3].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[2].t.cout_r  (.A0(\g.g_y[3].g_x[2].t.w_dh ),
    .A1(\g.g_y[3].g_x[2].t.w_oh ),
    .S(\g.g_y[3].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[3].g_x[2].t.cout_sc  (.CLK(clknet_3_5__leaf_clk),
    .D(\g.g_y[3].g_x[2].t.w_dv ),
    .SCD(net89),
    .SCE(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[3].g_x[2].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[2].t.cout_t  (.A0(\g.g_y[3].g_x[2].t.w_ov ),
    .A1(\g.g_y[3].g_x[2].t.w_dh ),
    .S(\g.g_y[3].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[2].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[2].t.cw_d  (.A0(\g.g_y[3].g_x[2].t.w_d ),
    .A1(\g.g_y[3].g_x[2].t.out_sc ),
    .S(net56),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[2].t.cw_dh  (.A0(\g.g_y[3].g_x[2].t.w_hl ),
    .A1(\g.g_y[3].g_x[2].t.w_vt ),
    .S(\g.g_y[3].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[2].t.cw_dv  (.A0(\g.g_y[3].g_x[2].t.w_vt ),
    .A1(\g.g_y[3].g_x[2].t.w_hl ),
    .S(\g.g_y[3].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[2].t.cw_h  (.A0(\g.g_y[3].g_x[2].t.w_h ),
    .A1(\g.g_y[3].g_x[2].t.out_sc ),
    .S(net46),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[2].t.cw_hl  (.A0(\g.g_y[3].g_x[1].t.out_r ),
    .A1(\g.g_y[3].g_x[2].t.in_r ),
    .S(\g.g_y[3].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[2].t.cw_hr  (.A0(\g.g_y[3].g_x[2].t.in_r ),
    .A1(\g.g_y[3].g_x[1].t.out_r ),
    .S(\g.g_y[3].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[3].g_x[2].t.cw_na  (.A(\g.g_y[3].g_x[2].t.w_hr ),
    .B(\g.g_y[3].g_x[2].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[3].g_x[2].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[2].t.cw_oh  (.A0(\g.g_y[3].g_x[2].t.out_sc ),
    .A1(\g.g_y[3].g_x[2].t.w_gn ),
    .S(\g.g_y[3].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[2].t.cw_ov  (.A0(\g.g_y[3].g_x[2].t.w_gn ),
    .A1(\g.g_y[3].g_x[2].t.out_sc ),
    .S(\g.g_y[3].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[2].t.cw_v  (.A0(\g.g_y[3].g_x[2].t.w_v ),
    .A1(\g.g_y[3].g_x[2].t.out_sc ),
    .S(net37),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[2].t.cw_vb  (.A0(\g.g_y[3].g_x[2].t.in_b ),
    .A1(\g.g_y[2].g_x[2].t.out_b ),
    .S(\g.g_y[3].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[2].t.cw_vt  (.A0(\g.g_y[2].g_x[2].t.out_b ),
    .A1(\g.g_y[3].g_x[2].t.in_b ),
    .S(\g.g_y[3].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cout_b  (.A0(\g.g_y[3].g_x[3].t.w_gh ),
    .A1(\g.g_y[3].g_x[3].t.w_ov ),
    .S(\g.g_y[3].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cout_l  (.A0(\g.g_y[3].g_x[3].t.w_oh ),
    .A1(\g.g_y[3].g_x[3].t.w_gh ),
    .S(\g.g_y[3].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cout_r  (.A0(\g.g_y[3].g_x[3].t.w_gh ),
    .A1(\g.g_y[3].g_x[3].t.w_oh ),
    .S(\g.g_y[3].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[3].g_x[3].t.cout_sc  (.CLK(clknet_3_5__leaf_clk),
    .D(\g.g_y[3].g_x[3].t.w_dv ),
    .SCD(net104),
    .SCE(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[3].g_x[3].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cout_t  (.A0(\g.g_y[3].g_x[3].t.w_ov ),
    .A1(\g.g_y[3].g_x[3].t.w_gh ),
    .S(\g.g_y[3].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[3].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[3].t.cw_d  (.A0(\g.g_y[3].g_x[3].t.w_d ),
    .A1(\g.g_y[3].g_x[3].t.out_sc ),
    .S(net55),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cw_dh  (.A0(\g.g_y[3].g_x[3].t.w_hl ),
    .A1(\g.g_y[3].g_x[3].t.w_vt ),
    .S(\g.g_y[3].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cw_dv  (.A0(\g.g_y[3].g_x[3].t.w_vt ),
    .A1(\g.g_y[3].g_x[3].t.w_hl ),
    .S(\g.g_y[3].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cw_gh  (.A0(\g.g_y[3].g_x[3].t.w_dh ),
    .A1(\g.g_y[3].g_x[3].t.w_gh ),
    .S(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cw_gn  (.A0(\g.g_y[3].g_x[3].t.w_na ),
    .A1(\g.g_y[3].g_x[3].t.w_gn ),
    .S(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[3].t.cw_h  (.A0(\g.g_y[3].g_x[3].t.w_h ),
    .A1(\g.g_y[3].g_x[3].t.out_sc ),
    .S(net46),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cw_hl  (.A0(\g.g_y[3].g_x[2].t.out_r ),
    .A1(\g.g_y[3].g_x[3].t.in_r ),
    .S(\g.g_y[3].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cw_hr  (.A0(\g.g_y[3].g_x[3].t.in_r ),
    .A1(\g.g_y[3].g_x[2].t.out_r ),
    .S(\g.g_y[3].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[3].g_x[3].t.cw_na  (.A(\g.g_y[3].g_x[3].t.w_hr ),
    .B(\g.g_y[3].g_x[3].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[3].g_x[3].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cw_oh  (.A0(\g.g_y[3].g_x[3].t.out_sc ),
    .A1(\g.g_y[3].g_x[3].t.w_gn ),
    .S(\g.g_y[3].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cw_ov  (.A0(\g.g_y[3].g_x[3].t.w_gn ),
    .A1(\g.g_y[3].g_x[3].t.out_sc ),
    .S(\g.g_y[3].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[3].t.cw_v  (.A0(\g.g_y[3].g_x[3].t.w_v ),
    .A1(\g.g_y[3].g_x[3].t.out_sc ),
    .S(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cw_vb  (.A0(\g.g_y[3].g_x[3].t.in_b ),
    .A1(\g.g_y[2].g_x[3].t.out_b ),
    .S(\g.g_y[3].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[3].t.cw_vt  (.A0(\g.g_y[2].g_x[3].t.out_b ),
    .A1(\g.g_y[3].g_x[3].t.in_b ),
    .S(\g.g_y[3].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[4].t.cout_b  (.A0(\g.g_y[3].g_x[4].t.w_dh ),
    .A1(\g.g_y[3].g_x[4].t.w_ov ),
    .S(\g.g_y[3].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[4].t.cout_l  (.A0(\g.g_y[3].g_x[4].t.w_oh ),
    .A1(\g.g_y[3].g_x[4].t.w_dh ),
    .S(\g.g_y[3].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[4].t.cout_r  (.A0(\g.g_y[3].g_x[4].t.w_dh ),
    .A1(\g.g_y[3].g_x[4].t.w_oh ),
    .S(\g.g_y[3].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[3].g_x[4].t.cout_sc  (.CLK(clknet_3_1__leaf_clk),
    .D(\g.g_y[3].g_x[4].t.w_dv ),
    .SCD(net127),
    .SCE(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[3].g_x[4].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[4].t.cout_t  (.A0(\g.g_y[3].g_x[4].t.w_ov ),
    .A1(\g.g_y[3].g_x[4].t.w_dh ),
    .S(\g.g_y[3].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[4].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[4].t.cw_d  (.A0(\g.g_y[3].g_x[4].t.w_d ),
    .A1(\g.g_y[3].g_x[4].t.out_sc ),
    .S(net52),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[4].t.cw_dh  (.A0(\g.g_y[3].g_x[4].t.w_hl ),
    .A1(\g.g_y[3].g_x[4].t.w_vt ),
    .S(\g.g_y[3].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[4].t.cw_dv  (.A0(\g.g_y[3].g_x[4].t.w_vt ),
    .A1(\g.g_y[3].g_x[4].t.w_hl ),
    .S(\g.g_y[3].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[4].t.cw_h  (.A0(\g.g_y[3].g_x[4].t.w_h ),
    .A1(\g.g_y[3].g_x[4].t.out_sc ),
    .S(net42),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[4].t.cw_hl  (.A0(\g.g_y[3].g_x[3].t.out_r ),
    .A1(\g.g_y[3].g_x[4].t.in_r ),
    .S(\g.g_y[3].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[4].t.cw_hr  (.A0(\g.g_y[3].g_x[4].t.in_r ),
    .A1(\g.g_y[3].g_x[3].t.out_r ),
    .S(\g.g_y[3].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[3].g_x[4].t.cw_na  (.A(\g.g_y[3].g_x[4].t.w_hr ),
    .B(\g.g_y[3].g_x[4].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[3].g_x[4].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[4].t.cw_oh  (.A0(\g.g_y[3].g_x[4].t.out_sc ),
    .A1(\g.g_y[3].g_x[4].t.w_gn ),
    .S(\g.g_y[3].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[4].t.cw_ov  (.A0(\g.g_y[3].g_x[4].t.w_gn ),
    .A1(\g.g_y[3].g_x[4].t.out_sc ),
    .S(\g.g_y[3].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[4].t.cw_v  (.A0(\g.g_y[3].g_x[4].t.w_v ),
    .A1(\g.g_y[3].g_x[4].t.out_sc ),
    .S(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[4].t.cw_vb  (.A0(\g.g_y[3].g_x[4].t.in_b ),
    .A1(\g.g_y[2].g_x[4].t.out_b ),
    .S(\g.g_y[3].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[4].t.cw_vt  (.A0(\g.g_y[2].g_x[4].t.out_b ),
    .A1(\g.g_y[3].g_x[4].t.in_b ),
    .S(\g.g_y[3].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cout_b  (.A0(\g.g_y[3].g_x[5].t.w_gh ),
    .A1(\g.g_y[3].g_x[5].t.w_ov ),
    .S(\g.g_y[3].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cout_l  (.A0(\g.g_y[3].g_x[5].t.w_oh ),
    .A1(\g.g_y[3].g_x[5].t.w_gh ),
    .S(\g.g_y[3].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cout_r  (.A0(\g.g_y[3].g_x[5].t.w_gh ),
    .A1(\g.g_y[3].g_x[5].t.w_oh ),
    .S(\g.g_y[3].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[3].g_x[5].t.cout_sc  (.CLK(clknet_3_0__leaf_clk),
    .D(\g.g_y[3].g_x[5].t.w_dv ),
    .SCD(net87),
    .SCE(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[3].g_x[5].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cout_t  (.A0(\g.g_y[3].g_x[5].t.w_ov ),
    .A1(\g.g_y[3].g_x[5].t.w_gh ),
    .S(\g.g_y[3].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[5].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[5].t.cw_d  (.A0(\g.g_y[3].g_x[5].t.w_d ),
    .A1(\g.g_y[3].g_x[5].t.out_sc ),
    .S(net52),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cw_dh  (.A0(\g.g_y[3].g_x[5].t.w_hl ),
    .A1(\g.g_y[3].g_x[5].t.w_vt ),
    .S(\g.g_y[3].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cw_dv  (.A0(\g.g_y[3].g_x[5].t.w_vt ),
    .A1(\g.g_y[3].g_x[5].t.w_hl ),
    .S(\g.g_y[3].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cw_gh  (.A0(\g.g_y[3].g_x[5].t.w_dh ),
    .A1(\g.g_y[3].g_x[5].t.w_gh ),
    .S(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cw_gn  (.A0(\g.g_y[3].g_x[5].t.w_na ),
    .A1(\g.g_y[3].g_x[5].t.w_gn ),
    .S(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[5].t.cw_h  (.A0(\g.g_y[3].g_x[5].t.w_h ),
    .A1(\g.g_y[3].g_x[5].t.out_sc ),
    .S(net42),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cw_hl  (.A0(\g.g_y[3].g_x[4].t.out_r ),
    .A1(\g.g_y[3].g_x[5].t.in_r ),
    .S(\g.g_y[3].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cw_hr  (.A0(\g.g_y[3].g_x[5].t.in_r ),
    .A1(\g.g_y[3].g_x[4].t.out_r ),
    .S(\g.g_y[3].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[3].g_x[5].t.cw_na  (.A(\g.g_y[3].g_x[5].t.w_hr ),
    .B(\g.g_y[3].g_x[5].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[3].g_x[5].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cw_oh  (.A0(\g.g_y[3].g_x[5].t.out_sc ),
    .A1(\g.g_y[3].g_x[5].t.w_gn ),
    .S(\g.g_y[3].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cw_ov  (.A0(\g.g_y[3].g_x[5].t.w_gn ),
    .A1(\g.g_y[3].g_x[5].t.out_sc ),
    .S(\g.g_y[3].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[5].t.cw_v  (.A0(\g.g_y[3].g_x[5].t.w_v ),
    .A1(\g.g_y[3].g_x[5].t.out_sc ),
    .S(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cw_vb  (.A0(\g.g_y[3].g_x[5].t.in_b ),
    .A1(\g.g_y[2].g_x[5].t.out_b ),
    .S(\g.g_y[3].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[5].t.cw_vt  (.A0(\g.g_y[2].g_x[5].t.out_b ),
    .A1(\g.g_y[3].g_x[5].t.in_b ),
    .S(\g.g_y[3].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[6].t.cout_b  (.A0(\g.g_y[3].g_x[6].t.w_dh ),
    .A1(\g.g_y[3].g_x[6].t.w_ov ),
    .S(\g.g_y[3].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[6].t.cout_l  (.A0(\g.g_y[3].g_x[6].t.w_oh ),
    .A1(\g.g_y[3].g_x[6].t.w_dh ),
    .S(\g.g_y[3].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[6].t.cout_r  (.A0(\g.g_y[3].g_x[6].t.w_dh ),
    .A1(\g.g_y[3].g_x[6].t.w_oh ),
    .S(\g.g_y[3].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[3].g_x[6].t.cout_sc  (.CLK(clknet_3_3__leaf_clk),
    .D(\g.g_y[3].g_x[6].t.w_dv ),
    .SCD(net119),
    .SCE(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[3].g_x[6].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[6].t.cout_t  (.A0(\g.g_y[3].g_x[6].t.w_ov ),
    .A1(\g.g_y[3].g_x[6].t.w_dh ),
    .S(\g.g_y[3].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[6].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[6].t.cw_d  (.A0(\g.g_y[3].g_x[6].t.w_d ),
    .A1(\g.g_y[3].g_x[6].t.out_sc ),
    .S(net54),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[6].t.cw_dh  (.A0(\g.g_y[3].g_x[6].t.w_hl ),
    .A1(\g.g_y[3].g_x[6].t.w_vt ),
    .S(\g.g_y[3].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[6].t.cw_dv  (.A0(\g.g_y[3].g_x[6].t.w_vt ),
    .A1(\g.g_y[3].g_x[6].t.w_hl ),
    .S(\g.g_y[3].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[6].t.cw_h  (.A0(\g.g_y[3].g_x[6].t.w_h ),
    .A1(\g.g_y[3].g_x[6].t.out_sc ),
    .S(net42),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[6].t.cw_hl  (.A0(\g.g_y[3].g_x[5].t.out_r ),
    .A1(\g.g_y[3].g_x[6].t.in_r ),
    .S(\g.g_y[3].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[6].t.cw_hr  (.A0(\g.g_y[3].g_x[6].t.in_r ),
    .A1(\g.g_y[3].g_x[5].t.out_r ),
    .S(\g.g_y[3].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[3].g_x[6].t.cw_na  (.A(\g.g_y[3].g_x[6].t.w_hr ),
    .B(\g.g_y[3].g_x[6].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[3].g_x[6].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[6].t.cw_oh  (.A0(\g.g_y[3].g_x[6].t.out_sc ),
    .A1(\g.g_y[3].g_x[6].t.w_gn ),
    .S(\g.g_y[3].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[6].t.cw_ov  (.A0(\g.g_y[3].g_x[6].t.w_gn ),
    .A1(\g.g_y[3].g_x[6].t.out_sc ),
    .S(\g.g_y[3].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[6].t.cw_v  (.A0(\g.g_y[3].g_x[6].t.w_v ),
    .A1(\g.g_y[3].g_x[6].t.out_sc ),
    .S(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[6].t.cw_vb  (.A0(\g.g_y[3].g_x[6].t.in_b ),
    .A1(\g.g_y[2].g_x[6].t.out_b ),
    .S(\g.g_y[3].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[6].t.cw_vt  (.A0(\g.g_y[2].g_x[6].t.out_b ),
    .A1(\g.g_y[3].g_x[6].t.in_b ),
    .S(\g.g_y[3].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cout_b  (.A0(\g.g_y[3].g_x[7].t.w_gh ),
    .A1(\g.g_y[3].g_x[7].t.w_ov ),
    .S(\g.g_y[3].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cout_l  (.A0(\g.g_y[3].g_x[7].t.w_oh ),
    .A1(\g.g_y[3].g_x[7].t.w_gh ),
    .S(\g.g_y[3].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cout_r  (.A0(\g.g_y[3].g_x[7].t.w_gh ),
    .A1(\g.g_y[3].g_x[7].t.w_oh ),
    .S(\g.g_y[3].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[3].g_x[7].t.cout_sc  (.CLK(clknet_3_3__leaf_clk),
    .D(\g.g_y[3].g_x[7].t.w_dv ),
    .SCD(net100),
    .SCE(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[3].g_x[7].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cout_t  (.A0(\g.g_y[3].g_x[7].t.w_ov ),
    .A1(\g.g_y[3].g_x[7].t.w_gh ),
    .S(\g.g_y[3].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[2].g_x[7].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[7].t.cw_d  (.A0(\g.g_y[3].g_x[7].t.w_d ),
    .A1(\g.g_y[3].g_x[7].t.out_sc ),
    .S(net54),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cw_dh  (.A0(\g.g_y[3].g_x[7].t.w_hl ),
    .A1(\g.g_y[3].g_x[7].t.w_vt ),
    .S(\g.g_y[3].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cw_dv  (.A0(\g.g_y[3].g_x[7].t.w_vt ),
    .A1(\g.g_y[3].g_x[7].t.w_hl ),
    .S(\g.g_y[3].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cw_gh  (.A0(\g.g_y[3].g_x[7].t.w_dh ),
    .A1(\g.g_y[3].g_x[7].t.w_gh ),
    .S(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cw_gn  (.A0(\g.g_y[3].g_x[7].t.w_na ),
    .A1(\g.g_y[3].g_x[7].t.w_gn ),
    .S(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[7].t.cw_h  (.A0(\g.g_y[3].g_x[7].t.w_h ),
    .A1(\g.g_y[3].g_x[7].t.out_sc ),
    .S(net44),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cw_hl  (.A0(\g.g_y[3].g_x[6].t.out_r ),
    .A1(\g.g_y[3].g_x[0].t.out_l ),
    .S(\g.g_y[3].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cw_hr  (.A0(\g.g_y[3].g_x[0].t.out_l ),
    .A1(\g.g_y[3].g_x[6].t.out_r ),
    .S(\g.g_y[3].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[3].g_x[7].t.cw_na  (.A(\g.g_y[3].g_x[7].t.w_hr ),
    .B(\g.g_y[3].g_x[7].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[3].g_x[7].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cw_oh  (.A0(\g.g_y[3].g_x[7].t.out_sc ),
    .A1(\g.g_y[3].g_x[7].t.w_gn ),
    .S(\g.g_y[3].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cw_ov  (.A0(\g.g_y[3].g_x[7].t.w_gn ),
    .A1(\g.g_y[3].g_x[7].t.out_sc ),
    .S(\g.g_y[3].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[3].g_x[7].t.cw_v  (.A0(\g.g_y[3].g_x[7].t.w_v ),
    .A1(\g.g_y[3].g_x[7].t.out_sc ),
    .S(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cw_vb  (.A0(\g.g_y[3].g_x[7].t.in_b ),
    .A1(\g.g_y[2].g_x[7].t.out_b ),
    .S(\g.g_y[3].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[3].g_x[7].t.cw_vt  (.A0(\g.g_y[2].g_x[7].t.out_b ),
    .A1(\g.g_y[3].g_x[7].t.in_b ),
    .S(\g.g_y[3].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cout_b  (.A0(\g.g_y[4].g_x[0].t.w_gh ),
    .A1(\g.g_y[4].g_x[0].t.w_ov ),
    .S(\g.g_y[4].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cout_l  (.A0(\g.g_y[4].g_x[0].t.w_oh ),
    .A1(\g.g_y[4].g_x[0].t.w_gh ),
    .S(\g.g_y[4].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.out_l ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cout_r  (.A0(\g.g_y[4].g_x[0].t.w_gh ),
    .A1(\g.g_y[4].g_x[0].t.w_oh ),
    .S(\g.g_y[4].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[4].g_x[0].t.cout_sc  (.CLK(clknet_3_6__leaf_clk),
    .D(\g.g_y[4].g_x[0].t.w_dv ),
    .SCD(net81),
    .SCE(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[4].g_x[0].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cout_t  (.A0(\g.g_y[4].g_x[0].t.w_ov ),
    .A1(\g.g_y[4].g_x[0].t.w_gh ),
    .S(\g.g_y[4].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[0].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[0].t.cw_d  (.A0(\g.g_y[4].g_x[0].t.w_d ),
    .A1(\g.g_y[4].g_x[0].t.out_sc ),
    .S(net57),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cw_dh  (.A0(\g.g_y[4].g_x[0].t.w_hl ),
    .A1(\g.g_y[4].g_x[0].t.w_vt ),
    .S(\g.g_y[4].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cw_dv  (.A0(\g.g_y[4].g_x[0].t.w_vt ),
    .A1(\g.g_y[4].g_x[0].t.w_hl ),
    .S(\g.g_y[4].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cw_gh  (.A0(\g.g_y[4].g_x[0].t.w_dh ),
    .A1(\g.g_y[4].g_x[0].t.w_gh ),
    .S(net50),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cw_gn  (.A0(\g.g_y[4].g_x[0].t.w_na ),
    .A1(\g.g_y[4].g_x[0].t.w_gn ),
    .S(net50),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[0].t.cw_h  (.A0(\g.g_y[4].g_x[0].t.w_h ),
    .A1(\g.g_y[4].g_x[0].t.out_sc ),
    .S(net47),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cw_hl  (.A0(net6),
    .A1(\g.g_y[4].g_x[0].t.in_r ),
    .S(\g.g_y[4].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cw_hr  (.A0(\g.g_y[4].g_x[0].t.in_r ),
    .A1(net6),
    .S(\g.g_y[4].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[4].g_x[0].t.cw_na  (.A(\g.g_y[4].g_x[0].t.w_hr ),
    .B(\g.g_y[4].g_x[0].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[4].g_x[0].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cw_oh  (.A0(\g.g_y[4].g_x[0].t.out_sc ),
    .A1(\g.g_y[4].g_x[0].t.w_gn ),
    .S(\g.g_y[4].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cw_ov  (.A0(\g.g_y[4].g_x[0].t.w_gn ),
    .A1(\g.g_y[4].g_x[0].t.out_sc ),
    .S(\g.g_y[4].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[0].t.cw_v  (.A0(\g.g_y[4].g_x[0].t.w_v ),
    .A1(\g.g_y[4].g_x[0].t.out_sc ),
    .S(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cw_vb  (.A0(\g.g_y[4].g_x[0].t.in_b ),
    .A1(\g.g_y[3].g_x[0].t.out_b ),
    .S(\g.g_y[4].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[0].t.cw_vt  (.A0(\g.g_y[3].g_x[0].t.out_b ),
    .A1(\g.g_y[4].g_x[0].t.in_b ),
    .S(\g.g_y[4].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[1].t.cout_b  (.A0(\g.g_y[4].g_x[1].t.w_dh ),
    .A1(\g.g_y[4].g_x[1].t.w_ov ),
    .S(\g.g_y[4].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[1].t.cout_l  (.A0(\g.g_y[4].g_x[1].t.w_oh ),
    .A1(\g.g_y[4].g_x[1].t.w_dh ),
    .S(\g.g_y[4].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[1].t.cout_r  (.A0(\g.g_y[4].g_x[1].t.w_dh ),
    .A1(\g.g_y[4].g_x[1].t.w_oh ),
    .S(\g.g_y[4].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[4].g_x[1].t.cout_sc  (.CLK(clknet_3_6__leaf_clk),
    .D(\g.g_y[4].g_x[1].t.w_dv ),
    .SCD(net112),
    .SCE(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[4].g_x[1].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[1].t.cout_t  (.A0(\g.g_y[4].g_x[1].t.w_ov ),
    .A1(\g.g_y[4].g_x[1].t.w_dh ),
    .S(\g.g_y[4].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[1].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[1].t.cw_d  (.A0(\g.g_y[4].g_x[1].t.w_d ),
    .A1(\g.g_y[4].g_x[1].t.out_sc ),
    .S(net57),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[1].t.cw_dh  (.A0(\g.g_y[4].g_x[1].t.w_hl ),
    .A1(\g.g_y[4].g_x[1].t.w_vt ),
    .S(\g.g_y[4].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[1].t.cw_dv  (.A0(\g.g_y[4].g_x[1].t.w_vt ),
    .A1(\g.g_y[4].g_x[1].t.w_hl ),
    .S(\g.g_y[4].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[1].t.cw_h  (.A0(\g.g_y[4].g_x[1].t.w_h ),
    .A1(\g.g_y[4].g_x[1].t.out_sc ),
    .S(net47),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[1].t.cw_hl  (.A0(\g.g_y[4].g_x[0].t.out_r ),
    .A1(\g.g_y[4].g_x[1].t.in_r ),
    .S(\g.g_y[4].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[1].t.cw_hr  (.A0(\g.g_y[4].g_x[1].t.in_r ),
    .A1(\g.g_y[4].g_x[0].t.out_r ),
    .S(\g.g_y[4].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[4].g_x[1].t.cw_na  (.A(\g.g_y[4].g_x[1].t.w_hr ),
    .B(\g.g_y[4].g_x[1].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[4].g_x[1].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[1].t.cw_oh  (.A0(\g.g_y[4].g_x[1].t.out_sc ),
    .A1(\g.g_y[4].g_x[1].t.w_gn ),
    .S(\g.g_y[4].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[1].t.cw_ov  (.A0(\g.g_y[4].g_x[1].t.w_gn ),
    .A1(\g.g_y[4].g_x[1].t.out_sc ),
    .S(\g.g_y[4].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[1].t.cw_v  (.A0(\g.g_y[4].g_x[1].t.w_v ),
    .A1(\g.g_y[4].g_x[1].t.out_sc ),
    .S(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[1].t.cw_vb  (.A0(\g.g_y[4].g_x[1].t.in_b ),
    .A1(\g.g_y[3].g_x[1].t.out_b ),
    .S(\g.g_y[4].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[1].t.cw_vt  (.A0(\g.g_y[3].g_x[1].t.out_b ),
    .A1(\g.g_y[4].g_x[1].t.in_b ),
    .S(\g.g_y[4].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cout_b  (.A0(\g.g_y[4].g_x[2].t.w_gh ),
    .A1(\g.g_y[4].g_x[2].t.w_ov ),
    .S(\g.g_y[4].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cout_l  (.A0(\g.g_y[4].g_x[2].t.w_oh ),
    .A1(\g.g_y[4].g_x[2].t.w_gh ),
    .S(\g.g_y[4].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cout_r  (.A0(\g.g_y[4].g_x[2].t.w_gh ),
    .A1(\g.g_y[4].g_x[2].t.w_oh ),
    .S(\g.g_y[4].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[4].g_x[2].t.cout_sc  (.CLK(clknet_3_4__leaf_clk),
    .D(\g.g_y[4].g_x[2].t.w_dv ),
    .SCD(net94),
    .SCE(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[4].g_x[2].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cout_t  (.A0(\g.g_y[4].g_x[2].t.w_ov ),
    .A1(\g.g_y[4].g_x[2].t.w_gh ),
    .S(\g.g_y[4].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[2].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[2].t.cw_d  (.A0(\g.g_y[4].g_x[2].t.w_d ),
    .A1(\g.g_y[4].g_x[2].t.out_sc ),
    .S(net55),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cw_dh  (.A0(\g.g_y[4].g_x[2].t.w_hl ),
    .A1(\g.g_y[4].g_x[2].t.w_vt ),
    .S(\g.g_y[4].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cw_dv  (.A0(\g.g_y[4].g_x[2].t.w_vt ),
    .A1(\g.g_y[4].g_x[2].t.w_hl ),
    .S(\g.g_y[4].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cw_gh  (.A0(\g.g_y[4].g_x[2].t.w_dh ),
    .A1(\g.g_y[4].g_x[2].t.w_gh ),
    .S(net18),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cw_gn  (.A0(\g.g_y[4].g_x[2].t.w_na ),
    .A1(\g.g_y[4].g_x[2].t.w_gn ),
    .S(net18),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[2].t.cw_h  (.A0(\g.g_y[4].g_x[2].t.w_h ),
    .A1(\g.g_y[4].g_x[2].t.out_sc ),
    .S(net45),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cw_hl  (.A0(\g.g_y[4].g_x[1].t.out_r ),
    .A1(\g.g_y[4].g_x[2].t.in_r ),
    .S(\g.g_y[4].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cw_hr  (.A0(\g.g_y[4].g_x[2].t.in_r ),
    .A1(\g.g_y[4].g_x[1].t.out_r ),
    .S(\g.g_y[4].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[4].g_x[2].t.cw_na  (.A(\g.g_y[4].g_x[2].t.w_hr ),
    .B(\g.g_y[4].g_x[2].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[4].g_x[2].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cw_oh  (.A0(\g.g_y[4].g_x[2].t.out_sc ),
    .A1(\g.g_y[4].g_x[2].t.w_gn ),
    .S(\g.g_y[4].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cw_ov  (.A0(\g.g_y[4].g_x[2].t.w_gn ),
    .A1(\g.g_y[4].g_x[2].t.out_sc ),
    .S(\g.g_y[4].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[2].t.cw_v  (.A0(\g.g_y[4].g_x[2].t.w_v ),
    .A1(\g.g_y[4].g_x[2].t.out_sc ),
    .S(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cw_vb  (.A0(\g.g_y[4].g_x[2].t.in_b ),
    .A1(\g.g_y[3].g_x[2].t.out_b ),
    .S(\g.g_y[4].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[2].t.cw_vt  (.A0(\g.g_y[3].g_x[2].t.out_b ),
    .A1(\g.g_y[4].g_x[2].t.in_b ),
    .S(\g.g_y[4].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[3].t.cout_b  (.A0(\g.g_y[4].g_x[3].t.w_dh ),
    .A1(\g.g_y[4].g_x[3].t.w_ov ),
    .S(\g.g_y[4].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[3].t.cout_l  (.A0(\g.g_y[4].g_x[3].t.w_oh ),
    .A1(\g.g_y[4].g_x[3].t.w_dh ),
    .S(\g.g_y[4].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[3].t.cout_r  (.A0(\g.g_y[4].g_x[3].t.w_dh ),
    .A1(\g.g_y[4].g_x[3].t.w_oh ),
    .S(\g.g_y[4].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[4].g_x[3].t.cout_sc  (.CLK(clknet_3_4__leaf_clk),
    .D(\g.g_y[4].g_x[3].t.w_dv ),
    .SCD(net101),
    .SCE(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[4].g_x[3].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[3].t.cout_t  (.A0(\g.g_y[4].g_x[3].t.w_ov ),
    .A1(\g.g_y[4].g_x[3].t.w_dh ),
    .S(\g.g_y[4].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[3].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[3].t.cw_d  (.A0(\g.g_y[4].g_x[3].t.w_d ),
    .A1(\g.g_y[4].g_x[3].t.out_sc ),
    .S(net55),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[3].t.cw_dh  (.A0(\g.g_y[4].g_x[3].t.w_hl ),
    .A1(\g.g_y[4].g_x[3].t.w_vt ),
    .S(\g.g_y[4].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[3].t.cw_dv  (.A0(\g.g_y[4].g_x[3].t.w_vt ),
    .A1(\g.g_y[4].g_x[3].t.w_hl ),
    .S(\g.g_y[4].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[3].t.cw_h  (.A0(\g.g_y[4].g_x[3].t.w_h ),
    .A1(\g.g_y[4].g_x[3].t.out_sc ),
    .S(net45),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[3].t.cw_hl  (.A0(\g.g_y[4].g_x[2].t.out_r ),
    .A1(\g.g_y[4].g_x[3].t.in_r ),
    .S(\g.g_y[4].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[3].t.cw_hr  (.A0(\g.g_y[4].g_x[3].t.in_r ),
    .A1(\g.g_y[4].g_x[2].t.out_r ),
    .S(\g.g_y[4].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[4].g_x[3].t.cw_na  (.A(\g.g_y[4].g_x[3].t.w_hr ),
    .B(\g.g_y[4].g_x[3].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[4].g_x[3].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[3].t.cw_oh  (.A0(\g.g_y[4].g_x[3].t.out_sc ),
    .A1(\g.g_y[4].g_x[3].t.w_gn ),
    .S(\g.g_y[4].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[3].t.cw_ov  (.A0(\g.g_y[4].g_x[3].t.w_gn ),
    .A1(\g.g_y[4].g_x[3].t.out_sc ),
    .S(\g.g_y[4].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[3].t.cw_v  (.A0(\g.g_y[4].g_x[3].t.w_v ),
    .A1(\g.g_y[4].g_x[3].t.out_sc ),
    .S(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[3].t.cw_vb  (.A0(\g.g_y[4].g_x[3].t.in_b ),
    .A1(\g.g_y[3].g_x[3].t.out_b ),
    .S(\g.g_y[4].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[3].t.cw_vt  (.A0(\g.g_y[3].g_x[3].t.out_b ),
    .A1(\g.g_y[4].g_x[3].t.in_b ),
    .S(\g.g_y[4].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cout_b  (.A0(\g.g_y[4].g_x[4].t.w_gh ),
    .A1(\g.g_y[4].g_x[4].t.w_ov ),
    .S(\g.g_y[4].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cout_l  (.A0(\g.g_y[4].g_x[4].t.w_oh ),
    .A1(\g.g_y[4].g_x[4].t.w_gh ),
    .S(\g.g_y[4].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cout_r  (.A0(\g.g_y[4].g_x[4].t.w_gh ),
    .A1(\g.g_y[4].g_x[4].t.w_oh ),
    .S(\g.g_y[4].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[4].g_x[4].t.cout_sc  (.CLK(clknet_3_1__leaf_clk),
    .D(\g.g_y[4].g_x[4].t.w_dv ),
    .SCD(net126),
    .SCE(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[4].g_x[4].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cout_t  (.A0(\g.g_y[4].g_x[4].t.w_ov ),
    .A1(\g.g_y[4].g_x[4].t.w_gh ),
    .S(\g.g_y[4].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[4].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[4].t.cw_d  (.A0(\g.g_y[4].g_x[4].t.w_d ),
    .A1(\g.g_y[4].g_x[4].t.out_sc ),
    .S(net51),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cw_dh  (.A0(\g.g_y[4].g_x[4].t.w_hl ),
    .A1(\g.g_y[4].g_x[4].t.w_vt ),
    .S(\g.g_y[4].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cw_dv  (.A0(\g.g_y[4].g_x[4].t.w_vt ),
    .A1(\g.g_y[4].g_x[4].t.w_hl ),
    .S(\g.g_y[4].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cw_gh  (.A0(\g.g_y[4].g_x[4].t.w_dh ),
    .A1(\g.g_y[4].g_x[4].t.w_gh ),
    .S(net49),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cw_gn  (.A0(\g.g_y[4].g_x[4].t.w_na ),
    .A1(\g.g_y[4].g_x[4].t.w_gn ),
    .S(net49),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[4].t.cw_h  (.A0(\g.g_y[4].g_x[4].t.w_h ),
    .A1(\g.g_y[4].g_x[4].t.out_sc ),
    .S(net41),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cw_hl  (.A0(\g.g_y[4].g_x[3].t.out_r ),
    .A1(\g.g_y[4].g_x[4].t.in_r ),
    .S(\g.g_y[4].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cw_hr  (.A0(\g.g_y[4].g_x[4].t.in_r ),
    .A1(\g.g_y[4].g_x[3].t.out_r ),
    .S(\g.g_y[4].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[4].g_x[4].t.cw_na  (.A(\g.g_y[4].g_x[4].t.w_hr ),
    .B(\g.g_y[4].g_x[4].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[4].g_x[4].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cw_oh  (.A0(\g.g_y[4].g_x[4].t.out_sc ),
    .A1(\g.g_y[4].g_x[4].t.w_gn ),
    .S(\g.g_y[4].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cw_ov  (.A0(\g.g_y[4].g_x[4].t.w_gn ),
    .A1(\g.g_y[4].g_x[4].t.out_sc ),
    .S(\g.g_y[4].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[4].t.cw_v  (.A0(\g.g_y[4].g_x[4].t.w_v ),
    .A1(\g.g_y[4].g_x[4].t.out_sc ),
    .S(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cw_vb  (.A0(\g.g_y[4].g_x[4].t.in_b ),
    .A1(\g.g_y[3].g_x[4].t.out_b ),
    .S(\g.g_y[4].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[4].t.cw_vt  (.A0(\g.g_y[3].g_x[4].t.out_b ),
    .A1(\g.g_y[4].g_x[4].t.in_b ),
    .S(\g.g_y[4].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[5].t.cout_b  (.A0(\g.g_y[4].g_x[5].t.w_dh ),
    .A1(\g.g_y[4].g_x[5].t.w_ov ),
    .S(\g.g_y[4].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[5].t.cout_l  (.A0(\g.g_y[4].g_x[5].t.w_oh ),
    .A1(\g.g_y[4].g_x[5].t.w_dh ),
    .S(\g.g_y[4].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[5].t.cout_r  (.A0(\g.g_y[4].g_x[5].t.w_dh ),
    .A1(\g.g_y[4].g_x[5].t.w_oh ),
    .S(\g.g_y[4].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[4].g_x[5].t.cout_sc  (.CLK(clknet_3_0__leaf_clk),
    .D(\g.g_y[4].g_x[5].t.w_dv ),
    .SCD(net76),
    .SCE(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[4].g_x[5].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[5].t.cout_t  (.A0(\g.g_y[4].g_x[5].t.w_ov ),
    .A1(\g.g_y[4].g_x[5].t.w_dh ),
    .S(\g.g_y[4].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[5].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[5].t.cw_d  (.A0(\g.g_y[4].g_x[5].t.w_d ),
    .A1(\g.g_y[4].g_x[5].t.out_sc ),
    .S(net51),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[5].t.cw_dh  (.A0(\g.g_y[4].g_x[5].t.w_hl ),
    .A1(\g.g_y[4].g_x[5].t.w_vt ),
    .S(\g.g_y[4].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[5].t.cw_dv  (.A0(\g.g_y[4].g_x[5].t.w_vt ),
    .A1(\g.g_y[4].g_x[5].t.w_hl ),
    .S(\g.g_y[4].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[5].t.cw_h  (.A0(\g.g_y[4].g_x[5].t.w_h ),
    .A1(\g.g_y[4].g_x[5].t.out_sc ),
    .S(net41),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[5].t.cw_hl  (.A0(\g.g_y[4].g_x[4].t.out_r ),
    .A1(\g.g_y[4].g_x[5].t.in_r ),
    .S(\g.g_y[4].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[5].t.cw_hr  (.A0(\g.g_y[4].g_x[5].t.in_r ),
    .A1(\g.g_y[4].g_x[4].t.out_r ),
    .S(\g.g_y[4].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[4].g_x[5].t.cw_na  (.A(\g.g_y[4].g_x[5].t.w_hr ),
    .B(\g.g_y[4].g_x[5].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[4].g_x[5].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[5].t.cw_oh  (.A0(\g.g_y[4].g_x[5].t.out_sc ),
    .A1(\g.g_y[4].g_x[5].t.w_gn ),
    .S(\g.g_y[4].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[5].t.cw_ov  (.A0(\g.g_y[4].g_x[5].t.w_gn ),
    .A1(\g.g_y[4].g_x[5].t.out_sc ),
    .S(\g.g_y[4].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[5].t.cw_v  (.A0(\g.g_y[4].g_x[5].t.w_v ),
    .A1(\g.g_y[4].g_x[5].t.out_sc ),
    .S(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[5].t.cw_vb  (.A0(\g.g_y[4].g_x[5].t.in_b ),
    .A1(\g.g_y[3].g_x[5].t.out_b ),
    .S(\g.g_y[4].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[5].t.cw_vt  (.A0(\g.g_y[3].g_x[5].t.out_b ),
    .A1(\g.g_y[4].g_x[5].t.in_b ),
    .S(\g.g_y[4].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cout_b  (.A0(\g.g_y[4].g_x[6].t.w_gh ),
    .A1(\g.g_y[4].g_x[6].t.w_ov ),
    .S(\g.g_y[4].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cout_l  (.A0(\g.g_y[4].g_x[6].t.w_oh ),
    .A1(\g.g_y[4].g_x[6].t.w_gh ),
    .S(\g.g_y[4].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cout_r  (.A0(\g.g_y[4].g_x[6].t.w_gh ),
    .A1(\g.g_y[4].g_x[6].t.w_oh ),
    .S(\g.g_y[4].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[4].g_x[6].t.cout_sc  (.CLK(clknet_3_2__leaf_clk),
    .D(\g.g_y[4].g_x[6].t.w_dv ),
    .SCD(net91),
    .SCE(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[4].g_x[6].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cout_t  (.A0(\g.g_y[4].g_x[6].t.w_ov ),
    .A1(\g.g_y[4].g_x[6].t.w_gh ),
    .S(\g.g_y[4].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[6].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[6].t.cw_d  (.A0(\g.g_y[4].g_x[6].t.w_d ),
    .A1(\g.g_y[4].g_x[6].t.out_sc ),
    .S(net53),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cw_dh  (.A0(\g.g_y[4].g_x[6].t.w_hl ),
    .A1(\g.g_y[4].g_x[6].t.w_vt ),
    .S(\g.g_y[4].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cw_dv  (.A0(\g.g_y[4].g_x[6].t.w_vt ),
    .A1(\g.g_y[4].g_x[6].t.w_hl ),
    .S(\g.g_y[4].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cw_gh  (.A0(\g.g_y[4].g_x[6].t.w_dh ),
    .A1(\g.g_y[4].g_x[6].t.w_gh ),
    .S(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cw_gn  (.A0(\g.g_y[4].g_x[6].t.w_na ),
    .A1(\g.g_y[4].g_x[6].t.w_gn ),
    .S(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[6].t.cw_h  (.A0(\g.g_y[4].g_x[6].t.w_h ),
    .A1(\g.g_y[4].g_x[6].t.out_sc ),
    .S(net43),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cw_hl  (.A0(\g.g_y[4].g_x[5].t.out_r ),
    .A1(\g.g_y[4].g_x[6].t.in_r ),
    .S(\g.g_y[4].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cw_hr  (.A0(\g.g_y[4].g_x[6].t.in_r ),
    .A1(\g.g_y[4].g_x[5].t.out_r ),
    .S(\g.g_y[4].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[4].g_x[6].t.cw_na  (.A(\g.g_y[4].g_x[6].t.w_hr ),
    .B(\g.g_y[4].g_x[6].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[4].g_x[6].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cw_oh  (.A0(\g.g_y[4].g_x[6].t.out_sc ),
    .A1(\g.g_y[4].g_x[6].t.w_gn ),
    .S(\g.g_y[4].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cw_ov  (.A0(\g.g_y[4].g_x[6].t.w_gn ),
    .A1(\g.g_y[4].g_x[6].t.out_sc ),
    .S(\g.g_y[4].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[6].t.cw_v  (.A0(\g.g_y[4].g_x[6].t.w_v ),
    .A1(\g.g_y[4].g_x[6].t.out_sc ),
    .S(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cw_vb  (.A0(\g.g_y[4].g_x[6].t.in_b ),
    .A1(\g.g_y[3].g_x[6].t.out_b ),
    .S(\g.g_y[4].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[6].t.cw_vt  (.A0(\g.g_y[3].g_x[6].t.out_b ),
    .A1(\g.g_y[4].g_x[6].t.in_b ),
    .S(\g.g_y[4].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[7].t.cout_b  (.A0(\g.g_y[4].g_x[7].t.w_dh ),
    .A1(\g.g_y[4].g_x[7].t.w_ov ),
    .S(\g.g_y[4].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[7].t.cout_l  (.A0(\g.g_y[4].g_x[7].t.w_oh ),
    .A1(\g.g_y[4].g_x[7].t.w_dh ),
    .S(\g.g_y[4].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[7].t.cout_r  (.A0(\g.g_y[4].g_x[7].t.w_dh ),
    .A1(\g.g_y[4].g_x[7].t.w_oh ),
    .S(\g.g_y[4].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[4].g_x[7].t.cout_sc  (.CLK(clknet_3_2__leaf_clk),
    .D(\g.g_y[4].g_x[7].t.w_dv ),
    .SCD(net98),
    .SCE(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[4].g_x[7].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[7].t.cout_t  (.A0(\g.g_y[4].g_x[7].t.w_ov ),
    .A1(\g.g_y[4].g_x[7].t.w_dh ),
    .S(\g.g_y[4].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[3].g_x[7].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[7].t.cw_d  (.A0(\g.g_y[4].g_x[7].t.w_d ),
    .A1(\g.g_y[4].g_x[7].t.out_sc ),
    .S(net53),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[7].t.cw_dh  (.A0(\g.g_y[4].g_x[7].t.w_hl ),
    .A1(\g.g_y[4].g_x[7].t.w_vt ),
    .S(\g.g_y[4].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[7].t.cw_dv  (.A0(\g.g_y[4].g_x[7].t.w_vt ),
    .A1(\g.g_y[4].g_x[7].t.w_hl ),
    .S(\g.g_y[4].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[7].t.cw_h  (.A0(\g.g_y[4].g_x[7].t.w_h ),
    .A1(\g.g_y[4].g_x[7].t.out_sc ),
    .S(net43),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[7].t.cw_hl  (.A0(\g.g_y[4].g_x[6].t.out_r ),
    .A1(\g.g_y[4].g_x[0].t.out_l ),
    .S(\g.g_y[4].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[7].t.cw_hr  (.A0(\g.g_y[4].g_x[0].t.out_l ),
    .A1(\g.g_y[4].g_x[6].t.out_r ),
    .S(\g.g_y[4].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[4].g_x[7].t.cw_na  (.A(\g.g_y[4].g_x[7].t.w_hr ),
    .B(\g.g_y[4].g_x[7].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[4].g_x[7].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[7].t.cw_oh  (.A0(\g.g_y[4].g_x[7].t.out_sc ),
    .A1(\g.g_y[4].g_x[7].t.w_gn ),
    .S(\g.g_y[4].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[7].t.cw_ov  (.A0(\g.g_y[4].g_x[7].t.w_gn ),
    .A1(\g.g_y[4].g_x[7].t.out_sc ),
    .S(\g.g_y[4].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[4].g_x[7].t.cw_v  (.A0(\g.g_y[4].g_x[7].t.w_v ),
    .A1(\g.g_y[4].g_x[7].t.out_sc ),
    .S(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[7].t.cw_vb  (.A0(\g.g_y[4].g_x[7].t.in_b ),
    .A1(\g.g_y[3].g_x[7].t.out_b ),
    .S(\g.g_y[4].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[4].g_x[7].t.cw_vt  (.A0(\g.g_y[3].g_x[7].t.out_b ),
    .A1(\g.g_y[4].g_x[7].t.in_b ),
    .S(\g.g_y[4].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[0].t.cout_b  (.A0(\g.g_y[5].g_x[0].t.w_dh ),
    .A1(\g.g_y[5].g_x[0].t.w_ov ),
    .S(\g.g_y[5].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[0].t.cout_l  (.A0(\g.g_y[5].g_x[0].t.w_oh ),
    .A1(\g.g_y[5].g_x[0].t.w_dh ),
    .S(\g.g_y[5].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.out_l ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[0].t.cout_r  (.A0(\g.g_y[5].g_x[0].t.w_dh ),
    .A1(\g.g_y[5].g_x[0].t.w_oh ),
    .S(\g.g_y[5].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[5].g_x[0].t.cout_sc  (.CLK(clknet_3_6__leaf_clk),
    .D(\g.g_y[5].g_x[0].t.w_dv ),
    .SCD(net106),
    .SCE(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[5].g_x[0].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[0].t.cout_t  (.A0(\g.g_y[5].g_x[0].t.w_ov ),
    .A1(\g.g_y[5].g_x[0].t.w_dh ),
    .S(\g.g_y[5].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[0].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[0].t.cw_d  (.A0(\g.g_y[5].g_x[0].t.w_d ),
    .A1(\g.g_y[5].g_x[0].t.out_sc ),
    .S(net57),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[0].t.cw_dh  (.A0(\g.g_y[5].g_x[0].t.w_hl ),
    .A1(\g.g_y[5].g_x[0].t.w_vt ),
    .S(\g.g_y[5].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[0].t.cw_dv  (.A0(\g.g_y[5].g_x[0].t.w_vt ),
    .A1(\g.g_y[5].g_x[0].t.w_hl ),
    .S(\g.g_y[5].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[0].t.cw_h  (.A0(\g.g_y[5].g_x[0].t.w_h ),
    .A1(\g.g_y[5].g_x[0].t.out_sc ),
    .S(net47),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[0].t.cw_hl  (.A0(net7),
    .A1(\g.g_y[5].g_x[0].t.in_r ),
    .S(\g.g_y[5].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[0].t.cw_hr  (.A0(\g.g_y[5].g_x[0].t.in_r ),
    .A1(net7),
    .S(\g.g_y[5].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[5].g_x[0].t.cw_na  (.A(\g.g_y[5].g_x[0].t.w_hr ),
    .B(\g.g_y[5].g_x[0].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[5].g_x[0].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[0].t.cw_oh  (.A0(\g.g_y[5].g_x[0].t.out_sc ),
    .A1(\g.g_y[5].g_x[0].t.w_gn ),
    .S(\g.g_y[5].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[0].t.cw_ov  (.A0(\g.g_y[5].g_x[0].t.w_gn ),
    .A1(\g.g_y[5].g_x[0].t.out_sc ),
    .S(\g.g_y[5].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[0].t.cw_v  (.A0(\g.g_y[5].g_x[0].t.w_v ),
    .A1(\g.g_y[5].g_x[0].t.out_sc ),
    .S(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[0].t.cw_vb  (.A0(\g.g_y[5].g_x[0].t.in_b ),
    .A1(\g.g_y[4].g_x[0].t.out_b ),
    .S(\g.g_y[5].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[0].t.cw_vt  (.A0(\g.g_y[4].g_x[0].t.out_b ),
    .A1(\g.g_y[5].g_x[0].t.in_b ),
    .S(\g.g_y[5].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cout_b  (.A0(\g.g_y[5].g_x[1].t.w_gh ),
    .A1(\g.g_y[5].g_x[1].t.w_ov ),
    .S(\g.g_y[5].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cout_l  (.A0(\g.g_y[5].g_x[1].t.w_oh ),
    .A1(\g.g_y[5].g_x[1].t.w_gh ),
    .S(\g.g_y[5].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cout_r  (.A0(\g.g_y[5].g_x[1].t.w_gh ),
    .A1(\g.g_y[5].g_x[1].t.w_oh ),
    .S(\g.g_y[5].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[5].g_x[1].t.cout_sc  (.CLK(clknet_3_6__leaf_clk),
    .D(\g.g_y[5].g_x[1].t.w_dv ),
    .SCD(net113),
    .SCE(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[5].g_x[1].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cout_t  (.A0(\g.g_y[5].g_x[1].t.w_ov ),
    .A1(\g.g_y[5].g_x[1].t.w_gh ),
    .S(\g.g_y[5].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[1].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[1].t.cw_d  (.A0(\g.g_y[5].g_x[1].t.w_d ),
    .A1(\g.g_y[5].g_x[1].t.out_sc ),
    .S(net55),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cw_dh  (.A0(\g.g_y[5].g_x[1].t.w_hl ),
    .A1(\g.g_y[5].g_x[1].t.w_vt ),
    .S(\g.g_y[5].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cw_dv  (.A0(\g.g_y[5].g_x[1].t.w_vt ),
    .A1(\g.g_y[5].g_x[1].t.w_hl ),
    .S(\g.g_y[5].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cw_gh  (.A0(\g.g_y[5].g_x[1].t.w_dh ),
    .A1(\g.g_y[5].g_x[1].t.w_gh ),
    .S(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cw_gn  (.A0(\g.g_y[5].g_x[1].t.w_na ),
    .A1(\g.g_y[5].g_x[1].t.w_gn ),
    .S(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[1].t.cw_h  (.A0(\g.g_y[5].g_x[1].t.w_h ),
    .A1(\g.g_y[5].g_x[1].t.out_sc ),
    .S(net45),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cw_hl  (.A0(\g.g_y[5].g_x[0].t.out_r ),
    .A1(\g.g_y[5].g_x[1].t.in_r ),
    .S(\g.g_y[5].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cw_hr  (.A0(\g.g_y[5].g_x[1].t.in_r ),
    .A1(\g.g_y[5].g_x[0].t.out_r ),
    .S(\g.g_y[5].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[5].g_x[1].t.cw_na  (.A(\g.g_y[5].g_x[1].t.w_hr ),
    .B(\g.g_y[5].g_x[1].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[5].g_x[1].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cw_oh  (.A0(\g.g_y[5].g_x[1].t.out_sc ),
    .A1(\g.g_y[5].g_x[1].t.w_gn ),
    .S(\g.g_y[5].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cw_ov  (.A0(\g.g_y[5].g_x[1].t.w_gn ),
    .A1(\g.g_y[5].g_x[1].t.out_sc ),
    .S(\g.g_y[5].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[1].t.cw_v  (.A0(\g.g_y[5].g_x[1].t.w_v ),
    .A1(\g.g_y[5].g_x[1].t.out_sc ),
    .S(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cw_vb  (.A0(\g.g_y[5].g_x[1].t.in_b ),
    .A1(\g.g_y[4].g_x[1].t.out_b ),
    .S(\g.g_y[5].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[1].t.cw_vt  (.A0(\g.g_y[4].g_x[1].t.out_b ),
    .A1(\g.g_y[5].g_x[1].t.in_b ),
    .S(\g.g_y[5].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[2].t.cout_b  (.A0(\g.g_y[5].g_x[2].t.w_dh ),
    .A1(\g.g_y[5].g_x[2].t.w_ov ),
    .S(\g.g_y[5].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[2].t.cout_l  (.A0(\g.g_y[5].g_x[2].t.w_oh ),
    .A1(\g.g_y[5].g_x[2].t.w_dh ),
    .S(\g.g_y[5].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[2].t.cout_r  (.A0(\g.g_y[5].g_x[2].t.w_dh ),
    .A1(\g.g_y[5].g_x[2].t.w_oh ),
    .S(\g.g_y[5].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[5].g_x[2].t.cout_sc  (.CLK(clknet_3_4__leaf_clk),
    .D(\g.g_y[5].g_x[2].t.w_dv ),
    .SCD(net117),
    .SCE(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[5].g_x[2].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[2].t.cout_t  (.A0(\g.g_y[5].g_x[2].t.w_ov ),
    .A1(\g.g_y[5].g_x[2].t.w_dh ),
    .S(\g.g_y[5].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[2].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[2].t.cw_d  (.A0(\g.g_y[5].g_x[2].t.w_d ),
    .A1(\g.g_y[5].g_x[2].t.out_sc ),
    .S(net55),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[2].t.cw_dh  (.A0(\g.g_y[5].g_x[2].t.w_hl ),
    .A1(\g.g_y[5].g_x[2].t.w_vt ),
    .S(\g.g_y[5].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[2].t.cw_dv  (.A0(\g.g_y[5].g_x[2].t.w_vt ),
    .A1(\g.g_y[5].g_x[2].t.w_hl ),
    .S(\g.g_y[5].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[2].t.cw_h  (.A0(\g.g_y[5].g_x[2].t.w_h ),
    .A1(\g.g_y[5].g_x[2].t.out_sc ),
    .S(net45),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[2].t.cw_hl  (.A0(\g.g_y[5].g_x[1].t.out_r ),
    .A1(\g.g_y[5].g_x[2].t.in_r ),
    .S(\g.g_y[5].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[2].t.cw_hr  (.A0(\g.g_y[5].g_x[2].t.in_r ),
    .A1(\g.g_y[5].g_x[1].t.out_r ),
    .S(\g.g_y[5].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[5].g_x[2].t.cw_na  (.A(\g.g_y[5].g_x[2].t.w_hr ),
    .B(\g.g_y[5].g_x[2].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[5].g_x[2].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[2].t.cw_oh  (.A0(\g.g_y[5].g_x[2].t.out_sc ),
    .A1(\g.g_y[5].g_x[2].t.w_gn ),
    .S(\g.g_y[5].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[2].t.cw_ov  (.A0(\g.g_y[5].g_x[2].t.w_gn ),
    .A1(\g.g_y[5].g_x[2].t.out_sc ),
    .S(\g.g_y[5].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[2].t.cw_v  (.A0(\g.g_y[5].g_x[2].t.w_v ),
    .A1(\g.g_y[5].g_x[2].t.out_sc ),
    .S(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[2].t.cw_vb  (.A0(\g.g_y[5].g_x[2].t.in_b ),
    .A1(\g.g_y[4].g_x[2].t.out_b ),
    .S(\g.g_y[5].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[2].t.cw_vt  (.A0(\g.g_y[4].g_x[2].t.out_b ),
    .A1(\g.g_y[5].g_x[2].t.in_b ),
    .S(\g.g_y[5].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cout_b  (.A0(\g.g_y[5].g_x[3].t.w_gh ),
    .A1(\g.g_y[5].g_x[3].t.w_ov ),
    .S(\g.g_y[5].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cout_l  (.A0(\g.g_y[5].g_x[3].t.w_oh ),
    .A1(\g.g_y[5].g_x[3].t.w_gh ),
    .S(\g.g_y[5].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cout_r  (.A0(\g.g_y[5].g_x[3].t.w_gh ),
    .A1(\g.g_y[5].g_x[3].t.w_oh ),
    .S(\g.g_y[5].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[5].g_x[3].t.cout_sc  (.CLK(clknet_3_4__leaf_clk),
    .D(\g.g_y[5].g_x[3].t.w_dv ),
    .SCD(net102),
    .SCE(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[5].g_x[3].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cout_t  (.A0(\g.g_y[5].g_x[3].t.w_ov ),
    .A1(\g.g_y[5].g_x[3].t.w_gh ),
    .S(\g.g_y[5].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[3].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[3].t.cw_d  (.A0(\g.g_y[5].g_x[3].t.w_d ),
    .A1(\g.g_y[5].g_x[3].t.out_sc ),
    .S(net51),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cw_dh  (.A0(\g.g_y[5].g_x[3].t.w_hl ),
    .A1(\g.g_y[5].g_x[3].t.w_vt ),
    .S(\g.g_y[5].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cw_dv  (.A0(\g.g_y[5].g_x[3].t.w_vt ),
    .A1(\g.g_y[5].g_x[3].t.w_hl ),
    .S(\g.g_y[5].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cw_gh  (.A0(\g.g_y[5].g_x[3].t.w_dh ),
    .A1(\g.g_y[5].g_x[3].t.w_gh ),
    .S(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cw_gn  (.A0(\g.g_y[5].g_x[3].t.w_na ),
    .A1(\g.g_y[5].g_x[3].t.w_gn ),
    .S(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[3].t.cw_h  (.A0(\g.g_y[5].g_x[3].t.w_h ),
    .A1(\g.g_y[5].g_x[3].t.out_sc ),
    .S(net45),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cw_hl  (.A0(\g.g_y[5].g_x[2].t.out_r ),
    .A1(\g.g_y[5].g_x[3].t.in_r ),
    .S(\g.g_y[5].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cw_hr  (.A0(\g.g_y[5].g_x[3].t.in_r ),
    .A1(\g.g_y[5].g_x[2].t.out_r ),
    .S(\g.g_y[5].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[5].g_x[3].t.cw_na  (.A(\g.g_y[5].g_x[3].t.w_hr ),
    .B(\g.g_y[5].g_x[3].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[5].g_x[3].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cw_oh  (.A0(\g.g_y[5].g_x[3].t.out_sc ),
    .A1(\g.g_y[5].g_x[3].t.w_gn ),
    .S(\g.g_y[5].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cw_ov  (.A0(\g.g_y[5].g_x[3].t.w_gn ),
    .A1(\g.g_y[5].g_x[3].t.out_sc ),
    .S(\g.g_y[5].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[3].t.cw_v  (.A0(\g.g_y[5].g_x[3].t.w_v ),
    .A1(\g.g_y[5].g_x[3].t.out_sc ),
    .S(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cw_vb  (.A0(\g.g_y[5].g_x[3].t.in_b ),
    .A1(\g.g_y[4].g_x[3].t.out_b ),
    .S(\g.g_y[5].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[3].t.cw_vt  (.A0(\g.g_y[4].g_x[3].t.out_b ),
    .A1(\g.g_y[5].g_x[3].t.in_b ),
    .S(\g.g_y[5].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[4].t.cout_b  (.A0(\g.g_y[5].g_x[4].t.w_dh ),
    .A1(\g.g_y[5].g_x[4].t.w_ov ),
    .S(\g.g_y[5].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[4].t.cout_l  (.A0(\g.g_y[5].g_x[4].t.w_oh ),
    .A1(\g.g_y[5].g_x[4].t.w_dh ),
    .S(\g.g_y[5].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[4].t.cout_r  (.A0(\g.g_y[5].g_x[4].t.w_dh ),
    .A1(\g.g_y[5].g_x[4].t.w_oh ),
    .S(\g.g_y[5].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_2 \g.g_y[5].g_x[4].t.cout_sc  (.CLK(clknet_3_0__leaf_clk),
    .D(\g.g_y[5].g_x[4].t.w_dv ),
    .SCD(net128),
    .SCE(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[5].g_x[4].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[4].t.cout_t  (.A0(\g.g_y[5].g_x[4].t.w_ov ),
    .A1(\g.g_y[5].g_x[4].t.w_dh ),
    .S(\g.g_y[5].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[4].t.in_b ));
 sky130_fd_sc_hd__mux2_4 \g.g_y[5].g_x[4].t.cw_d  (.A0(\g.g_y[5].g_x[4].t.w_d ),
    .A1(\g.g_y[5].g_x[4].t.out_sc ),
    .S(net51),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.w_d ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[4].t.cw_dh  (.A0(\g.g_y[5].g_x[4].t.w_hl ),
    .A1(\g.g_y[5].g_x[4].t.w_vt ),
    .S(\g.g_y[5].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[4].t.cw_dv  (.A0(\g.g_y[5].g_x[4].t.w_vt ),
    .A1(\g.g_y[5].g_x[4].t.w_hl ),
    .S(\g.g_y[5].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[4].t.cw_h  (.A0(\g.g_y[5].g_x[4].t.w_h ),
    .A1(\g.g_y[5].g_x[4].t.out_sc ),
    .S(net41),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[4].t.cw_hl  (.A0(\g.g_y[5].g_x[3].t.out_r ),
    .A1(\g.g_y[5].g_x[4].t.in_r ),
    .S(\g.g_y[5].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[4].t.cw_hr  (.A0(\g.g_y[5].g_x[4].t.in_r ),
    .A1(\g.g_y[5].g_x[3].t.out_r ),
    .S(\g.g_y[5].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[5].g_x[4].t.cw_na  (.A(\g.g_y[5].g_x[4].t.w_hr ),
    .B(\g.g_y[5].g_x[4].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[5].g_x[4].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[4].t.cw_oh  (.A0(\g.g_y[5].g_x[4].t.out_sc ),
    .A1(\g.g_y[5].g_x[4].t.w_gn ),
    .S(\g.g_y[5].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[4].t.cw_ov  (.A0(\g.g_y[5].g_x[4].t.w_gn ),
    .A1(\g.g_y[5].g_x[4].t.out_sc ),
    .S(\g.g_y[5].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[4].t.cw_v  (.A0(\g.g_y[5].g_x[4].t.w_v ),
    .A1(\g.g_y[5].g_x[4].t.out_sc ),
    .S(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[4].t.cw_vb  (.A0(\g.g_y[5].g_x[4].t.in_b ),
    .A1(\g.g_y[4].g_x[4].t.out_b ),
    .S(\g.g_y[5].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[4].t.cw_vt  (.A0(\g.g_y[4].g_x[4].t.out_b ),
    .A1(\g.g_y[5].g_x[4].t.in_b ),
    .S(\g.g_y[5].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cout_b  (.A0(\g.g_y[5].g_x[5].t.w_gh ),
    .A1(\g.g_y[5].g_x[5].t.w_ov ),
    .S(\g.g_y[5].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cout_l  (.A0(\g.g_y[5].g_x[5].t.w_oh ),
    .A1(\g.g_y[5].g_x[5].t.w_gh ),
    .S(\g.g_y[5].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cout_r  (.A0(\g.g_y[5].g_x[5].t.w_gh ),
    .A1(\g.g_y[5].g_x[5].t.w_oh ),
    .S(\g.g_y[5].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_2 \g.g_y[5].g_x[5].t.cout_sc  (.CLK(clknet_3_0__leaf_clk),
    .D(\g.g_y[5].g_x[5].t.w_dv ),
    .SCD(\g.g_y[5].g_x[4].t.out_sc ),
    .SCE(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[5].g_x[5].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cout_t  (.A0(\g.g_y[5].g_x[5].t.w_ov ),
    .A1(\g.g_y[5].g_x[5].t.w_gh ),
    .S(\g.g_y[5].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[5].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[5].t.cw_d  (.A0(\g.g_y[5].g_x[5].t.w_d ),
    .A1(\g.g_y[5].g_x[5].t.out_sc ),
    .S(net51),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cw_dh  (.A0(\g.g_y[5].g_x[5].t.w_hl ),
    .A1(\g.g_y[5].g_x[5].t.w_vt ),
    .S(\g.g_y[5].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cw_dv  (.A0(\g.g_y[5].g_x[5].t.w_vt ),
    .A1(\g.g_y[5].g_x[5].t.w_hl ),
    .S(\g.g_y[5].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cw_gh  (.A0(\g.g_y[5].g_x[5].t.w_dh ),
    .A1(\g.g_y[5].g_x[5].t.w_gh ),
    .S(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cw_gn  (.A0(\g.g_y[5].g_x[5].t.w_na ),
    .A1(\g.g_y[5].g_x[5].t.w_gn ),
    .S(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[5].t.cw_h  (.A0(\g.g_y[5].g_x[5].t.w_h ),
    .A1(\g.g_y[5].g_x[5].t.out_sc ),
    .S(net41),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cw_hl  (.A0(\g.g_y[5].g_x[4].t.out_r ),
    .A1(\g.g_y[5].g_x[5].t.in_r ),
    .S(\g.g_y[5].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cw_hr  (.A0(\g.g_y[5].g_x[5].t.in_r ),
    .A1(\g.g_y[5].g_x[4].t.out_r ),
    .S(\g.g_y[5].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[5].g_x[5].t.cw_na  (.A(\g.g_y[5].g_x[5].t.w_hr ),
    .B(\g.g_y[5].g_x[5].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[5].g_x[5].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cw_oh  (.A0(\g.g_y[5].g_x[5].t.out_sc ),
    .A1(\g.g_y[5].g_x[5].t.w_gn ),
    .S(\g.g_y[5].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cw_ov  (.A0(\g.g_y[5].g_x[5].t.w_gn ),
    .A1(\g.g_y[5].g_x[5].t.out_sc ),
    .S(\g.g_y[5].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[5].t.cw_v  (.A0(\g.g_y[5].g_x[5].t.w_v ),
    .A1(\g.g_y[5].g_x[5].t.out_sc ),
    .S(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cw_vb  (.A0(\g.g_y[5].g_x[5].t.in_b ),
    .A1(\g.g_y[4].g_x[5].t.out_b ),
    .S(\g.g_y[5].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[5].t.cw_vt  (.A0(\g.g_y[4].g_x[5].t.out_b ),
    .A1(\g.g_y[5].g_x[5].t.in_b ),
    .S(\g.g_y[5].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[6].t.cout_b  (.A0(\g.g_y[5].g_x[6].t.w_dh ),
    .A1(\g.g_y[5].g_x[6].t.w_ov ),
    .S(\g.g_y[5].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[6].t.cout_l  (.A0(\g.g_y[5].g_x[6].t.w_oh ),
    .A1(\g.g_y[5].g_x[6].t.w_dh ),
    .S(\g.g_y[5].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[6].t.cout_r  (.A0(\g.g_y[5].g_x[6].t.w_dh ),
    .A1(\g.g_y[5].g_x[6].t.w_oh ),
    .S(\g.g_y[5].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[5].g_x[6].t.cout_sc  (.CLK(clknet_3_2__leaf_clk),
    .D(\g.g_y[5].g_x[6].t.w_dv ),
    .SCD(net121),
    .SCE(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[5].g_x[6].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[6].t.cout_t  (.A0(\g.g_y[5].g_x[6].t.w_ov ),
    .A1(\g.g_y[5].g_x[6].t.w_dh ),
    .S(\g.g_y[5].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[6].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[6].t.cw_d  (.A0(\g.g_y[5].g_x[6].t.w_d ),
    .A1(\g.g_y[5].g_x[6].t.out_sc ),
    .S(net53),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[6].t.cw_dh  (.A0(\g.g_y[5].g_x[6].t.w_hl ),
    .A1(\g.g_y[5].g_x[6].t.w_vt ),
    .S(\g.g_y[5].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[6].t.cw_dv  (.A0(\g.g_y[5].g_x[6].t.w_vt ),
    .A1(\g.g_y[5].g_x[6].t.w_hl ),
    .S(\g.g_y[5].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[6].t.cw_h  (.A0(\g.g_y[5].g_x[6].t.w_h ),
    .A1(\g.g_y[5].g_x[6].t.out_sc ),
    .S(net41),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[6].t.cw_hl  (.A0(\g.g_y[5].g_x[5].t.out_r ),
    .A1(\g.g_y[5].g_x[6].t.in_r ),
    .S(\g.g_y[5].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[6].t.cw_hr  (.A0(\g.g_y[5].g_x[6].t.in_r ),
    .A1(\g.g_y[5].g_x[5].t.out_r ),
    .S(\g.g_y[5].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[5].g_x[6].t.cw_na  (.A(\g.g_y[5].g_x[6].t.w_hr ),
    .B(\g.g_y[5].g_x[6].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[5].g_x[6].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[6].t.cw_oh  (.A0(\g.g_y[5].g_x[6].t.out_sc ),
    .A1(\g.g_y[5].g_x[6].t.w_gn ),
    .S(\g.g_y[5].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[6].t.cw_ov  (.A0(\g.g_y[5].g_x[6].t.w_gn ),
    .A1(\g.g_y[5].g_x[6].t.out_sc ),
    .S(\g.g_y[5].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[6].t.cw_v  (.A0(\g.g_y[5].g_x[6].t.w_v ),
    .A1(\g.g_y[5].g_x[6].t.out_sc ),
    .S(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[6].t.cw_vb  (.A0(\g.g_y[5].g_x[6].t.in_b ),
    .A1(\g.g_y[4].g_x[6].t.out_b ),
    .S(\g.g_y[5].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[6].t.cw_vt  (.A0(\g.g_y[4].g_x[6].t.out_b ),
    .A1(\g.g_y[5].g_x[6].t.in_b ),
    .S(\g.g_y[5].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cout_b  (.A0(\g.g_y[5].g_x[7].t.w_gh ),
    .A1(\g.g_y[5].g_x[7].t.w_ov ),
    .S(\g.g_y[5].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cout_l  (.A0(\g.g_y[5].g_x[7].t.w_oh ),
    .A1(\g.g_y[5].g_x[7].t.w_gh ),
    .S(\g.g_y[5].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cout_r  (.A0(\g.g_y[5].g_x[7].t.w_gh ),
    .A1(\g.g_y[5].g_x[7].t.w_oh ),
    .S(\g.g_y[5].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[5].g_x[7].t.cout_sc  (.CLK(clknet_3_2__leaf_clk),
    .D(\g.g_y[5].g_x[7].t.w_dv ),
    .SCD(net116),
    .SCE(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[5].g_x[7].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cout_t  (.A0(\g.g_y[5].g_x[7].t.w_ov ),
    .A1(\g.g_y[5].g_x[7].t.w_gh ),
    .S(\g.g_y[5].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[4].g_x[7].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[7].t.cw_d  (.A0(\g.g_y[5].g_x[7].t.w_d ),
    .A1(\g.g_y[5].g_x[7].t.out_sc ),
    .S(net53),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cw_dh  (.A0(\g.g_y[5].g_x[7].t.w_hl ),
    .A1(\g.g_y[5].g_x[7].t.w_vt ),
    .S(\g.g_y[5].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cw_dv  (.A0(\g.g_y[5].g_x[7].t.w_vt ),
    .A1(\g.g_y[5].g_x[7].t.w_hl ),
    .S(\g.g_y[5].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cw_gh  (.A0(\g.g_y[5].g_x[7].t.w_dh ),
    .A1(\g.g_y[5].g_x[7].t.w_gh ),
    .S(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cw_gn  (.A0(\g.g_y[5].g_x[7].t.w_na ),
    .A1(\g.g_y[5].g_x[7].t.w_gn ),
    .S(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[7].t.cw_h  (.A0(\g.g_y[5].g_x[7].t.w_h ),
    .A1(\g.g_y[5].g_x[7].t.out_sc ),
    .S(net43),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cw_hl  (.A0(\g.g_y[5].g_x[6].t.out_r ),
    .A1(\g.g_y[5].g_x[0].t.out_l ),
    .S(\g.g_y[5].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cw_hr  (.A0(\g.g_y[5].g_x[0].t.out_l ),
    .A1(\g.g_y[5].g_x[6].t.out_r ),
    .S(\g.g_y[5].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[5].g_x[7].t.cw_na  (.A(\g.g_y[5].g_x[7].t.w_hr ),
    .B(\g.g_y[5].g_x[7].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[5].g_x[7].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cw_oh  (.A0(\g.g_y[5].g_x[7].t.out_sc ),
    .A1(\g.g_y[5].g_x[7].t.w_gn ),
    .S(\g.g_y[5].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cw_ov  (.A0(\g.g_y[5].g_x[7].t.w_gn ),
    .A1(\g.g_y[5].g_x[7].t.out_sc ),
    .S(\g.g_y[5].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[5].g_x[7].t.cw_v  (.A0(\g.g_y[5].g_x[7].t.w_v ),
    .A1(\g.g_y[5].g_x[7].t.out_sc ),
    .S(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cw_vb  (.A0(\g.g_y[5].g_x[7].t.in_b ),
    .A1(\g.g_y[4].g_x[7].t.out_b ),
    .S(\g.g_y[5].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[5].g_x[7].t.cw_vt  (.A0(\g.g_y[4].g_x[7].t.out_b ),
    .A1(\g.g_y[5].g_x[7].t.in_b ),
    .S(\g.g_y[5].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cout_b  (.A0(\g.g_y[6].g_x[0].t.w_gh ),
    .A1(\g.g_y[6].g_x[0].t.w_ov ),
    .S(\g.g_y[6].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cout_l  (.A0(\g.g_y[6].g_x[0].t.w_oh ),
    .A1(\g.g_y[6].g_x[0].t.w_gh ),
    .S(\g.g_y[6].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.out_l ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cout_r  (.A0(\g.g_y[6].g_x[0].t.w_gh ),
    .A1(\g.g_y[6].g_x[0].t.w_oh ),
    .S(\g.g_y[6].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[6].g_x[0].t.cout_sc  (.CLK(clknet_3_6__leaf_clk),
    .D(\g.g_y[6].g_x[0].t.w_dv ),
    .SCD(net122),
    .SCE(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[6].g_x[0].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cout_t  (.A0(\g.g_y[6].g_x[0].t.w_ov ),
    .A1(\g.g_y[6].g_x[0].t.w_gh ),
    .S(\g.g_y[6].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[0].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[0].t.cw_d  (.A0(\g.g_y[6].g_x[0].t.w_d ),
    .A1(\g.g_y[6].g_x[0].t.out_sc ),
    .S(net57),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cw_dh  (.A0(\g.g_y[6].g_x[0].t.w_hl ),
    .A1(\g.g_y[6].g_x[0].t.w_vt ),
    .S(\g.g_y[6].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cw_dv  (.A0(\g.g_y[6].g_x[0].t.w_vt ),
    .A1(\g.g_y[6].g_x[0].t.w_hl ),
    .S(\g.g_y[6].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cw_gh  (.A0(\g.g_y[6].g_x[0].t.w_dh ),
    .A1(\g.g_y[6].g_x[0].t.w_gh ),
    .S(net18),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cw_gn  (.A0(\g.g_y[6].g_x[0].t.w_na ),
    .A1(\g.g_y[6].g_x[0].t.w_gn ),
    .S(net18),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[0].t.cw_h  (.A0(\g.g_y[6].g_x[0].t.w_h ),
    .A1(\g.g_y[6].g_x[0].t.out_sc ),
    .S(net47),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cw_hl  (.A0(net8),
    .A1(\g.g_y[6].g_x[0].t.in_r ),
    .S(\g.g_y[6].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cw_hr  (.A0(\g.g_y[6].g_x[0].t.in_r ),
    .A1(net8),
    .S(\g.g_y[6].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[6].g_x[0].t.cw_na  (.A(\g.g_y[6].g_x[0].t.w_hr ),
    .B(\g.g_y[6].g_x[0].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[6].g_x[0].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cw_oh  (.A0(\g.g_y[6].g_x[0].t.out_sc ),
    .A1(\g.g_y[6].g_x[0].t.w_gn ),
    .S(\g.g_y[6].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cw_ov  (.A0(\g.g_y[6].g_x[0].t.w_gn ),
    .A1(\g.g_y[6].g_x[0].t.out_sc ),
    .S(\g.g_y[6].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[0].t.cw_v  (.A0(\g.g_y[6].g_x[0].t.w_v ),
    .A1(\g.g_y[6].g_x[0].t.out_sc ),
    .S(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cw_vb  (.A0(\g.g_y[6].g_x[0].t.in_b ),
    .A1(\g.g_y[5].g_x[0].t.out_b ),
    .S(\g.g_y[6].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[0].t.cw_vt  (.A0(\g.g_y[5].g_x[0].t.out_b ),
    .A1(\g.g_y[6].g_x[0].t.in_b ),
    .S(\g.g_y[6].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[1].t.cout_b  (.A0(\g.g_y[6].g_x[1].t.w_dh ),
    .A1(\g.g_y[6].g_x[1].t.w_ov ),
    .S(\g.g_y[6].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[1].t.cout_l  (.A0(\g.g_y[6].g_x[1].t.w_oh ),
    .A1(\g.g_y[6].g_x[1].t.w_dh ),
    .S(\g.g_y[6].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[1].t.cout_r  (.A0(\g.g_y[6].g_x[1].t.w_dh ),
    .A1(\g.g_y[6].g_x[1].t.w_oh ),
    .S(\g.g_y[6].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[6].g_x[1].t.cout_sc  (.CLK(clknet_3_6__leaf_clk),
    .D(\g.g_y[6].g_x[1].t.w_dv ),
    .SCD(net115),
    .SCE(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[6].g_x[1].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[1].t.cout_t  (.A0(\g.g_y[6].g_x[1].t.w_ov ),
    .A1(\g.g_y[6].g_x[1].t.w_dh ),
    .S(\g.g_y[6].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[1].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[1].t.cw_d  (.A0(\g.g_y[6].g_x[1].t.w_d ),
    .A1(\g.g_y[6].g_x[1].t.out_sc ),
    .S(net57),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[1].t.cw_dh  (.A0(\g.g_y[6].g_x[1].t.w_hl ),
    .A1(\g.g_y[6].g_x[1].t.w_vt ),
    .S(\g.g_y[6].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[1].t.cw_dv  (.A0(\g.g_y[6].g_x[1].t.w_vt ),
    .A1(\g.g_y[6].g_x[1].t.w_hl ),
    .S(\g.g_y[6].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[1].t.cw_h  (.A0(\g.g_y[6].g_x[1].t.w_h ),
    .A1(\g.g_y[6].g_x[1].t.out_sc ),
    .S(net47),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[1].t.cw_hl  (.A0(\g.g_y[6].g_x[0].t.out_r ),
    .A1(\g.g_y[6].g_x[1].t.in_r ),
    .S(\g.g_y[6].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[1].t.cw_hr  (.A0(\g.g_y[6].g_x[1].t.in_r ),
    .A1(\g.g_y[6].g_x[0].t.out_r ),
    .S(\g.g_y[6].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[6].g_x[1].t.cw_na  (.A(\g.g_y[6].g_x[1].t.w_hr ),
    .B(\g.g_y[6].g_x[1].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[6].g_x[1].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[1].t.cw_oh  (.A0(\g.g_y[6].g_x[1].t.out_sc ),
    .A1(\g.g_y[6].g_x[1].t.w_gn ),
    .S(\g.g_y[6].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[1].t.cw_ov  (.A0(\g.g_y[6].g_x[1].t.w_gn ),
    .A1(\g.g_y[6].g_x[1].t.out_sc ),
    .S(\g.g_y[6].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[1].t.cw_v  (.A0(\g.g_y[6].g_x[1].t.w_v ),
    .A1(\g.g_y[6].g_x[1].t.out_sc ),
    .S(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[1].t.cw_vb  (.A0(\g.g_y[6].g_x[1].t.in_b ),
    .A1(\g.g_y[5].g_x[1].t.out_b ),
    .S(\g.g_y[6].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[1].t.cw_vt  (.A0(\g.g_y[5].g_x[1].t.out_b ),
    .A1(\g.g_y[6].g_x[1].t.in_b ),
    .S(\g.g_y[6].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cout_b  (.A0(\g.g_y[6].g_x[2].t.w_gh ),
    .A1(\g.g_y[6].g_x[2].t.w_ov ),
    .S(\g.g_y[6].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cout_l  (.A0(\g.g_y[6].g_x[2].t.w_oh ),
    .A1(\g.g_y[6].g_x[2].t.w_gh ),
    .S(\g.g_y[6].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cout_r  (.A0(\g.g_y[6].g_x[2].t.w_gh ),
    .A1(\g.g_y[6].g_x[2].t.w_oh ),
    .S(\g.g_y[6].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[6].g_x[2].t.cout_sc  (.CLK(clknet_3_4__leaf_clk),
    .D(\g.g_y[6].g_x[2].t.w_dv ),
    .SCD(net88),
    .SCE(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[6].g_x[2].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cout_t  (.A0(\g.g_y[6].g_x[2].t.w_ov ),
    .A1(\g.g_y[6].g_x[2].t.w_gh ),
    .S(\g.g_y[6].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[2].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[2].t.cw_d  (.A0(\g.g_y[6].g_x[2].t.w_d ),
    .A1(\g.g_y[6].g_x[2].t.out_sc ),
    .S(net55),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cw_dh  (.A0(\g.g_y[6].g_x[2].t.w_hl ),
    .A1(\g.g_y[6].g_x[2].t.w_vt ),
    .S(\g.g_y[6].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cw_dv  (.A0(\g.g_y[6].g_x[2].t.w_vt ),
    .A1(\g.g_y[6].g_x[2].t.w_hl ),
    .S(\g.g_y[6].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cw_gh  (.A0(\g.g_y[6].g_x[2].t.w_dh ),
    .A1(\g.g_y[6].g_x[2].t.w_gh ),
    .S(net50),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cw_gn  (.A0(\g.g_y[6].g_x[2].t.w_na ),
    .A1(\g.g_y[6].g_x[2].t.w_gn ),
    .S(net50),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[2].t.cw_h  (.A0(\g.g_y[6].g_x[2].t.w_h ),
    .A1(\g.g_y[6].g_x[2].t.out_sc ),
    .S(net45),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cw_hl  (.A0(\g.g_y[6].g_x[1].t.out_r ),
    .A1(\g.g_y[6].g_x[2].t.in_r ),
    .S(\g.g_y[6].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cw_hr  (.A0(\g.g_y[6].g_x[2].t.in_r ),
    .A1(\g.g_y[6].g_x[1].t.out_r ),
    .S(\g.g_y[6].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[6].g_x[2].t.cw_na  (.A(\g.g_y[6].g_x[2].t.w_hr ),
    .B(\g.g_y[6].g_x[2].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[6].g_x[2].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cw_oh  (.A0(\g.g_y[6].g_x[2].t.out_sc ),
    .A1(\g.g_y[6].g_x[2].t.w_gn ),
    .S(\g.g_y[6].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cw_ov  (.A0(\g.g_y[6].g_x[2].t.w_gn ),
    .A1(\g.g_y[6].g_x[2].t.out_sc ),
    .S(\g.g_y[6].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[2].t.cw_v  (.A0(\g.g_y[6].g_x[2].t.w_v ),
    .A1(\g.g_y[6].g_x[2].t.out_sc ),
    .S(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cw_vb  (.A0(\g.g_y[6].g_x[2].t.in_b ),
    .A1(\g.g_y[5].g_x[2].t.out_b ),
    .S(\g.g_y[6].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[2].t.cw_vt  (.A0(\g.g_y[5].g_x[2].t.out_b ),
    .A1(\g.g_y[6].g_x[2].t.in_b ),
    .S(\g.g_y[6].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[3].t.cout_b  (.A0(\g.g_y[6].g_x[3].t.w_dh ),
    .A1(\g.g_y[6].g_x[3].t.w_ov ),
    .S(\g.g_y[6].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[3].t.cout_l  (.A0(\g.g_y[6].g_x[3].t.w_oh ),
    .A1(\g.g_y[6].g_x[3].t.w_dh ),
    .S(\g.g_y[6].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[3].t.cout_r  (.A0(\g.g_y[6].g_x[3].t.w_dh ),
    .A1(\g.g_y[6].g_x[3].t.w_oh ),
    .S(\g.g_y[6].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[6].g_x[3].t.cout_sc  (.CLK(clknet_3_4__leaf_clk),
    .D(\g.g_y[6].g_x[3].t.w_dv ),
    .SCD(net92),
    .SCE(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[6].g_x[3].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[3].t.cout_t  (.A0(\g.g_y[6].g_x[3].t.w_ov ),
    .A1(\g.g_y[6].g_x[3].t.w_dh ),
    .S(\g.g_y[6].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[3].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[3].t.cw_d  (.A0(\g.g_y[6].g_x[3].t.w_d ),
    .A1(\g.g_y[6].g_x[3].t.out_sc ),
    .S(net55),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[3].t.cw_dh  (.A0(\g.g_y[6].g_x[3].t.w_hl ),
    .A1(\g.g_y[6].g_x[3].t.w_vt ),
    .S(\g.g_y[6].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[3].t.cw_dv  (.A0(\g.g_y[6].g_x[3].t.w_vt ),
    .A1(\g.g_y[6].g_x[3].t.w_hl ),
    .S(\g.g_y[6].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[3].t.cw_h  (.A0(\g.g_y[6].g_x[3].t.w_h ),
    .A1(\g.g_y[6].g_x[3].t.out_sc ),
    .S(net45),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[3].t.cw_hl  (.A0(\g.g_y[6].g_x[2].t.out_r ),
    .A1(\g.g_y[6].g_x[3].t.in_r ),
    .S(\g.g_y[6].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[3].t.cw_hr  (.A0(\g.g_y[6].g_x[3].t.in_r ),
    .A1(\g.g_y[6].g_x[2].t.out_r ),
    .S(\g.g_y[6].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[6].g_x[3].t.cw_na  (.A(\g.g_y[6].g_x[3].t.w_hr ),
    .B(\g.g_y[6].g_x[3].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[6].g_x[3].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[3].t.cw_oh  (.A0(\g.g_y[6].g_x[3].t.out_sc ),
    .A1(\g.g_y[6].g_x[3].t.w_gn ),
    .S(\g.g_y[6].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[3].t.cw_ov  (.A0(\g.g_y[6].g_x[3].t.w_gn ),
    .A1(\g.g_y[6].g_x[3].t.out_sc ),
    .S(\g.g_y[6].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[3].t.cw_v  (.A0(\g.g_y[6].g_x[3].t.w_v ),
    .A1(\g.g_y[6].g_x[3].t.out_sc ),
    .S(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[3].t.cw_vb  (.A0(\g.g_y[6].g_x[3].t.in_b ),
    .A1(\g.g_y[5].g_x[3].t.out_b ),
    .S(\g.g_y[6].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[3].t.cw_vt  (.A0(\g.g_y[5].g_x[3].t.out_b ),
    .A1(\g.g_y[6].g_x[3].t.in_b ),
    .S(\g.g_y[6].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cout_b  (.A0(\g.g_y[6].g_x[4].t.w_gh ),
    .A1(\g.g_y[6].g_x[4].t.w_ov ),
    .S(\g.g_y[6].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cout_l  (.A0(\g.g_y[6].g_x[4].t.w_oh ),
    .A1(\g.g_y[6].g_x[4].t.w_gh ),
    .S(\g.g_y[6].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cout_r  (.A0(\g.g_y[6].g_x[4].t.w_gh ),
    .A1(\g.g_y[6].g_x[4].t.w_oh ),
    .S(\g.g_y[6].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[6].g_x[4].t.cout_sc  (.CLK(clknet_3_0__leaf_clk),
    .D(\g.g_y[6].g_x[4].t.w_dv ),
    .SCD(net129),
    .SCE(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[6].g_x[4].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cout_t  (.A0(\g.g_y[6].g_x[4].t.w_ov ),
    .A1(\g.g_y[6].g_x[4].t.w_gh ),
    .S(\g.g_y[6].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[4].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[4].t.cw_d  (.A0(\g.g_y[6].g_x[4].t.w_d ),
    .A1(\g.g_y[6].g_x[4].t.out_sc ),
    .S(net51),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cw_dh  (.A0(\g.g_y[6].g_x[4].t.w_hl ),
    .A1(\g.g_y[6].g_x[4].t.w_vt ),
    .S(\g.g_y[6].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cw_dv  (.A0(\g.g_y[6].g_x[4].t.w_vt ),
    .A1(\g.g_y[6].g_x[4].t.w_hl ),
    .S(\g.g_y[6].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cw_gh  (.A0(\g.g_y[6].g_x[4].t.w_dh ),
    .A1(\g.g_y[6].g_x[4].t.w_gh ),
    .S(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cw_gn  (.A0(\g.g_y[6].g_x[4].t.w_na ),
    .A1(\g.g_y[6].g_x[4].t.w_gn ),
    .S(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[4].t.cw_h  (.A0(\g.g_y[6].g_x[4].t.w_h ),
    .A1(\g.g_y[6].g_x[4].t.out_sc ),
    .S(net41),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cw_hl  (.A0(\g.g_y[6].g_x[3].t.out_r ),
    .A1(\g.g_y[6].g_x[4].t.in_r ),
    .S(\g.g_y[6].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cw_hr  (.A0(\g.g_y[6].g_x[4].t.in_r ),
    .A1(\g.g_y[6].g_x[3].t.out_r ),
    .S(\g.g_y[6].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[6].g_x[4].t.cw_na  (.A(\g.g_y[6].g_x[4].t.w_hr ),
    .B(\g.g_y[6].g_x[4].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[6].g_x[4].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cw_oh  (.A0(\g.g_y[6].g_x[4].t.out_sc ),
    .A1(\g.g_y[6].g_x[4].t.w_gn ),
    .S(\g.g_y[6].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cw_ov  (.A0(\g.g_y[6].g_x[4].t.w_gn ),
    .A1(\g.g_y[6].g_x[4].t.out_sc ),
    .S(\g.g_y[6].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[4].t.cw_v  (.A0(\g.g_y[6].g_x[4].t.w_v ),
    .A1(\g.g_y[6].g_x[4].t.out_sc ),
    .S(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cw_vb  (.A0(\g.g_y[6].g_x[4].t.in_b ),
    .A1(\g.g_y[5].g_x[4].t.out_b ),
    .S(\g.g_y[6].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[4].t.cw_vt  (.A0(\g.g_y[5].g_x[4].t.out_b ),
    .A1(\g.g_y[6].g_x[4].t.in_b ),
    .S(\g.g_y[6].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[5].t.cout_b  (.A0(\g.g_y[6].g_x[5].t.w_dh ),
    .A1(\g.g_y[6].g_x[5].t.w_ov ),
    .S(\g.g_y[6].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[5].t.cout_l  (.A0(\g.g_y[6].g_x[5].t.w_oh ),
    .A1(\g.g_y[6].g_x[5].t.w_dh ),
    .S(\g.g_y[6].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[5].t.cout_r  (.A0(\g.g_y[6].g_x[5].t.w_dh ),
    .A1(\g.g_y[6].g_x[5].t.w_oh ),
    .S(\g.g_y[6].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[6].g_x[5].t.cout_sc  (.CLK(clknet_3_0__leaf_clk),
    .D(\g.g_y[6].g_x[5].t.w_dv ),
    .SCD(net93),
    .SCE(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[6].g_x[5].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[5].t.cout_t  (.A0(\g.g_y[6].g_x[5].t.w_ov ),
    .A1(\g.g_y[6].g_x[5].t.w_dh ),
    .S(\g.g_y[6].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[5].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[5].t.cw_d  (.A0(\g.g_y[6].g_x[5].t.w_d ),
    .A1(\g.g_y[6].g_x[5].t.out_sc ),
    .S(net51),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[5].t.cw_dh  (.A0(\g.g_y[6].g_x[5].t.w_hl ),
    .A1(\g.g_y[6].g_x[5].t.w_vt ),
    .S(\g.g_y[6].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[5].t.cw_dv  (.A0(\g.g_y[6].g_x[5].t.w_vt ),
    .A1(\g.g_y[6].g_x[5].t.w_hl ),
    .S(\g.g_y[6].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[5].t.cw_h  (.A0(\g.g_y[6].g_x[5].t.w_h ),
    .A1(\g.g_y[6].g_x[5].t.out_sc ),
    .S(net41),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[5].t.cw_hl  (.A0(\g.g_y[6].g_x[4].t.out_r ),
    .A1(\g.g_y[6].g_x[5].t.in_r ),
    .S(\g.g_y[6].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[5].t.cw_hr  (.A0(\g.g_y[6].g_x[5].t.in_r ),
    .A1(\g.g_y[6].g_x[4].t.out_r ),
    .S(\g.g_y[6].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[6].g_x[5].t.cw_na  (.A(\g.g_y[6].g_x[5].t.w_hr ),
    .B(\g.g_y[6].g_x[5].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[6].g_x[5].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[5].t.cw_oh  (.A0(\g.g_y[6].g_x[5].t.out_sc ),
    .A1(\g.g_y[6].g_x[5].t.w_gn ),
    .S(\g.g_y[6].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[5].t.cw_ov  (.A0(\g.g_y[6].g_x[5].t.w_gn ),
    .A1(\g.g_y[6].g_x[5].t.out_sc ),
    .S(\g.g_y[6].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[5].t.cw_v  (.A0(\g.g_y[6].g_x[5].t.w_v ),
    .A1(\g.g_y[6].g_x[5].t.out_sc ),
    .S(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[5].t.cw_vb  (.A0(\g.g_y[6].g_x[5].t.in_b ),
    .A1(\g.g_y[5].g_x[5].t.out_b ),
    .S(\g.g_y[6].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[5].t.cw_vt  (.A0(\g.g_y[5].g_x[5].t.out_b ),
    .A1(\g.g_y[6].g_x[5].t.in_b ),
    .S(\g.g_y[6].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cout_b  (.A0(\g.g_y[6].g_x[6].t.w_gh ),
    .A1(\g.g_y[6].g_x[6].t.w_ov ),
    .S(\g.g_y[6].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cout_l  (.A0(\g.g_y[6].g_x[6].t.w_oh ),
    .A1(\g.g_y[6].g_x[6].t.w_gh ),
    .S(\g.g_y[6].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cout_r  (.A0(\g.g_y[6].g_x[6].t.w_gh ),
    .A1(\g.g_y[6].g_x[6].t.w_oh ),
    .S(\g.g_y[6].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[6].g_x[6].t.cout_sc  (.CLK(clknet_3_2__leaf_clk),
    .D(\g.g_y[6].g_x[6].t.w_dv ),
    .SCD(net75),
    .SCE(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[6].g_x[6].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cout_t  (.A0(\g.g_y[6].g_x[6].t.w_ov ),
    .A1(\g.g_y[6].g_x[6].t.w_gh ),
    .S(\g.g_y[6].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[6].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[6].t.cw_d  (.A0(\g.g_y[6].g_x[6].t.w_d ),
    .A1(\g.g_y[6].g_x[6].t.out_sc ),
    .S(net53),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cw_dh  (.A0(\g.g_y[6].g_x[6].t.w_hl ),
    .A1(\g.g_y[6].g_x[6].t.w_vt ),
    .S(\g.g_y[6].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cw_dv  (.A0(\g.g_y[6].g_x[6].t.w_vt ),
    .A1(\g.g_y[6].g_x[6].t.w_hl ),
    .S(\g.g_y[6].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cw_gh  (.A0(\g.g_y[6].g_x[6].t.w_dh ),
    .A1(\g.g_y[6].g_x[6].t.w_gh ),
    .S(net49),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cw_gn  (.A0(\g.g_y[6].g_x[6].t.w_na ),
    .A1(\g.g_y[6].g_x[6].t.w_gn ),
    .S(net49),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[6].t.cw_h  (.A0(\g.g_y[6].g_x[6].t.w_h ),
    .A1(\g.g_y[6].g_x[6].t.out_sc ),
    .S(net43),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cw_hl  (.A0(\g.g_y[6].g_x[5].t.out_r ),
    .A1(\g.g_y[6].g_x[6].t.in_r ),
    .S(\g.g_y[6].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cw_hr  (.A0(\g.g_y[6].g_x[6].t.in_r ),
    .A1(\g.g_y[6].g_x[5].t.out_r ),
    .S(\g.g_y[6].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[6].g_x[6].t.cw_na  (.A(\g.g_y[6].g_x[6].t.w_hr ),
    .B(\g.g_y[6].g_x[6].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[6].g_x[6].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cw_oh  (.A0(\g.g_y[6].g_x[6].t.out_sc ),
    .A1(\g.g_y[6].g_x[6].t.w_gn ),
    .S(\g.g_y[6].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cw_ov  (.A0(\g.g_y[6].g_x[6].t.w_gn ),
    .A1(\g.g_y[6].g_x[6].t.out_sc ),
    .S(\g.g_y[6].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[6].t.cw_v  (.A0(\g.g_y[6].g_x[6].t.w_v ),
    .A1(\g.g_y[6].g_x[6].t.out_sc ),
    .S(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cw_vb  (.A0(\g.g_y[6].g_x[6].t.in_b ),
    .A1(\g.g_y[5].g_x[6].t.out_b ),
    .S(\g.g_y[6].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[6].t.cw_vt  (.A0(\g.g_y[5].g_x[6].t.out_b ),
    .A1(\g.g_y[6].g_x[6].t.in_b ),
    .S(\g.g_y[6].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[7].t.cout_b  (.A0(\g.g_y[6].g_x[7].t.w_dh ),
    .A1(\g.g_y[6].g_x[7].t.w_ov ),
    .S(\g.g_y[6].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.out_b ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[7].t.cout_l  (.A0(\g.g_y[6].g_x[7].t.w_oh ),
    .A1(\g.g_y[6].g_x[7].t.w_dh ),
    .S(\g.g_y[6].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[7].t.cout_r  (.A0(\g.g_y[6].g_x[7].t.w_dh ),
    .A1(\g.g_y[6].g_x[7].t.w_oh ),
    .S(\g.g_y[6].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[6].g_x[7].t.cout_sc  (.CLK(clknet_3_2__leaf_clk),
    .D(\g.g_y[6].g_x[7].t.w_dv ),
    .SCD(net97),
    .SCE(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[6].g_x[7].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[7].t.cout_t  (.A0(\g.g_y[6].g_x[7].t.w_ov ),
    .A1(\g.g_y[6].g_x[7].t.w_dh ),
    .S(\g.g_y[6].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[5].g_x[7].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[7].t.cw_d  (.A0(\g.g_y[6].g_x[7].t.w_d ),
    .A1(\g.g_y[6].g_x[7].t.out_sc ),
    .S(net53),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[7].t.cw_dh  (.A0(\g.g_y[6].g_x[7].t.w_hl ),
    .A1(\g.g_y[6].g_x[7].t.w_vt ),
    .S(\g.g_y[6].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[7].t.cw_dv  (.A0(\g.g_y[6].g_x[7].t.w_vt ),
    .A1(\g.g_y[6].g_x[7].t.w_hl ),
    .S(\g.g_y[6].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[7].t.cw_h  (.A0(\g.g_y[6].g_x[7].t.w_h ),
    .A1(\g.g_y[6].g_x[7].t.out_sc ),
    .S(net43),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[7].t.cw_hl  (.A0(\g.g_y[6].g_x[6].t.out_r ),
    .A1(\g.g_y[6].g_x[0].t.out_l ),
    .S(\g.g_y[6].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[7].t.cw_hr  (.A0(\g.g_y[6].g_x[0].t.out_l ),
    .A1(\g.g_y[6].g_x[6].t.out_r ),
    .S(\g.g_y[6].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[6].g_x[7].t.cw_na  (.A(\g.g_y[6].g_x[7].t.w_hr ),
    .B(\g.g_y[6].g_x[7].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[6].g_x[7].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[7].t.cw_oh  (.A0(\g.g_y[6].g_x[7].t.out_sc ),
    .A1(\g.g_y[6].g_x[7].t.w_gn ),
    .S(\g.g_y[6].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[7].t.cw_ov  (.A0(\g.g_y[6].g_x[7].t.w_gn ),
    .A1(\g.g_y[6].g_x[7].t.out_sc ),
    .S(\g.g_y[6].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[6].g_x[7].t.cw_v  (.A0(\g.g_y[6].g_x[7].t.w_v ),
    .A1(\g.g_y[6].g_x[7].t.out_sc ),
    .S(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[7].t.cw_vb  (.A0(\g.g_y[6].g_x[7].t.in_b ),
    .A1(\g.g_y[5].g_x[7].t.out_b ),
    .S(\g.g_y[6].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[6].g_x[7].t.cw_vt  (.A0(\g.g_y[5].g_x[7].t.out_b ),
    .A1(\g.g_y[6].g_x[7].t.in_b ),
    .S(\g.g_y[6].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[0].t.cout_b  (.A0(\g.g_y[7].g_x[0].t.w_dh ),
    .A1(\g.g_y[7].g_x[0].t.w_ov ),
    .S(\g.g_y[7].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[0].t.in_t ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[0].t.cout_l  (.A0(\g.g_y[7].g_x[0].t.w_oh ),
    .A1(\g.g_y[7].g_x[0].t.w_dh ),
    .S(\g.g_y[7].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.out_l ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[0].t.cout_r  (.A0(\g.g_y[7].g_x[0].t.w_dh ),
    .A1(\g.g_y[7].g_x[0].t.w_oh ),
    .S(\g.g_y[7].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[7].g_x[0].t.cout_sc  (.CLK(clknet_3_6__leaf_clk),
    .D(\g.g_y[7].g_x[0].t.w_dv ),
    .SCD(net133),
    .SCE(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[7].g_x[0].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[0].t.cout_t  (.A0(\g.g_y[7].g_x[0].t.w_ov ),
    .A1(\g.g_y[7].g_x[0].t.w_dh ),
    .S(\g.g_y[7].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[0].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[0].t.cw_d  (.A0(\g.g_y[7].g_x[0].t.w_d ),
    .A1(\g.g_y[7].g_x[0].t.out_sc ),
    .S(net57),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[0].t.cw_dh  (.A0(\g.g_y[7].g_x[0].t.w_hl ),
    .A1(\g.g_y[7].g_x[0].t.w_vt ),
    .S(\g.g_y[7].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[0].t.cw_dv  (.A0(\g.g_y[7].g_x[0].t.w_vt ),
    .A1(\g.g_y[7].g_x[0].t.w_hl ),
    .S(\g.g_y[7].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[0].t.cw_h  (.A0(\g.g_y[7].g_x[0].t.w_h ),
    .A1(\g.g_y[7].g_x[0].t.out_sc ),
    .S(net47),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[0].t.cw_hl  (.A0(net9),
    .A1(\g.g_y[7].g_x[0].t.in_r ),
    .S(\g.g_y[7].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[0].t.cw_hr  (.A0(\g.g_y[7].g_x[0].t.in_r ),
    .A1(net9),
    .S(\g.g_y[7].g_x[0].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[7].g_x[0].t.cw_na  (.A(\g.g_y[7].g_x[0].t.w_hr ),
    .B(\g.g_y[7].g_x[0].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[7].g_x[0].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[0].t.cw_oh  (.A0(\g.g_y[7].g_x[0].t.out_sc ),
    .A1(\g.g_y[7].g_x[0].t.w_gn ),
    .S(\g.g_y[7].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[0].t.cw_ov  (.A0(\g.g_y[7].g_x[0].t.w_gn ),
    .A1(\g.g_y[7].g_x[0].t.out_sc ),
    .S(\g.g_y[7].g_x[0].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[0].t.cw_v  (.A0(\g.g_y[7].g_x[0].t.w_v ),
    .A1(\g.g_y[7].g_x[0].t.out_sc ),
    .S(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[0].t.cw_vb  (.A0(\g.g_y[0].g_x[0].t.out_t ),
    .A1(\g.g_y[6].g_x[0].t.out_b ),
    .S(\g.g_y[7].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[0].t.cw_vt  (.A0(\g.g_y[6].g_x[0].t.out_b ),
    .A1(\g.g_y[0].g_x[0].t.out_t ),
    .S(\g.g_y[7].g_x[0].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cout_b  (.A0(\g.g_y[7].g_x[1].t.w_gh ),
    .A1(\g.g_y[7].g_x[1].t.w_ov ),
    .S(\g.g_y[7].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[1].t.in_t ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cout_l  (.A0(\g.g_y[7].g_x[1].t.w_oh ),
    .A1(\g.g_y[7].g_x[1].t.w_gh ),
    .S(\g.g_y[7].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[0].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cout_r  (.A0(\g.g_y[7].g_x[1].t.w_gh ),
    .A1(\g.g_y[7].g_x[1].t.w_oh ),
    .S(\g.g_y[7].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[7].g_x[1].t.cout_sc  (.CLK(clknet_3_6__leaf_clk),
    .D(\g.g_y[7].g_x[1].t.w_dv ),
    .SCD(net107),
    .SCE(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[7].g_x[1].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cout_t  (.A0(\g.g_y[7].g_x[1].t.w_ov ),
    .A1(\g.g_y[7].g_x[1].t.w_gh ),
    .S(\g.g_y[7].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[1].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[1].t.cw_d  (.A0(\g.g_y[7].g_x[1].t.w_d ),
    .A1(\g.g_y[7].g_x[1].t.out_sc ),
    .S(net57),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cw_dh  (.A0(\g.g_y[7].g_x[1].t.w_hl ),
    .A1(\g.g_y[7].g_x[1].t.w_vt ),
    .S(\g.g_y[7].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cw_dv  (.A0(\g.g_y[7].g_x[1].t.w_vt ),
    .A1(\g.g_y[7].g_x[1].t.w_hl ),
    .S(\g.g_y[7].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cw_gh  (.A0(\g.g_y[7].g_x[1].t.w_dh ),
    .A1(\g.g_y[7].g_x[1].t.w_gh ),
    .S(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cw_gn  (.A0(\g.g_y[7].g_x[1].t.w_na ),
    .A1(\g.g_y[7].g_x[1].t.w_gn ),
    .S(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[1].t.cw_h  (.A0(\g.g_y[7].g_x[1].t.w_h ),
    .A1(\g.g_y[7].g_x[1].t.out_sc ),
    .S(net47),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cw_hl  (.A0(\g.g_y[7].g_x[0].t.out_r ),
    .A1(\g.g_y[7].g_x[1].t.in_r ),
    .S(\g.g_y[7].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cw_hr  (.A0(\g.g_y[7].g_x[1].t.in_r ),
    .A1(\g.g_y[7].g_x[0].t.out_r ),
    .S(\g.g_y[7].g_x[1].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[7].g_x[1].t.cw_na  (.A(\g.g_y[7].g_x[1].t.w_hr ),
    .B(\g.g_y[7].g_x[1].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[7].g_x[1].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cw_oh  (.A0(\g.g_y[7].g_x[1].t.out_sc ),
    .A1(\g.g_y[7].g_x[1].t.w_gn ),
    .S(\g.g_y[7].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cw_ov  (.A0(\g.g_y[7].g_x[1].t.w_gn ),
    .A1(\g.g_y[7].g_x[1].t.out_sc ),
    .S(\g.g_y[7].g_x[1].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[1].t.cw_v  (.A0(\g.g_y[7].g_x[1].t.w_v ),
    .A1(\g.g_y[7].g_x[1].t.out_sc ),
    .S(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cw_vb  (.A0(\g.g_y[0].g_x[1].t.out_t ),
    .A1(\g.g_y[6].g_x[1].t.out_b ),
    .S(\g.g_y[7].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[1].t.cw_vt  (.A0(\g.g_y[6].g_x[1].t.out_b ),
    .A1(\g.g_y[0].g_x[1].t.out_t ),
    .S(\g.g_y[7].g_x[1].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[2].t.cout_b  (.A0(\g.g_y[7].g_x[2].t.w_dh ),
    .A1(\g.g_y[7].g_x[2].t.w_ov ),
    .S(\g.g_y[7].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[2].t.in_t ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[2].t.cout_l  (.A0(\g.g_y[7].g_x[2].t.w_oh ),
    .A1(\g.g_y[7].g_x[2].t.w_dh ),
    .S(\g.g_y[7].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[1].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[2].t.cout_r  (.A0(\g.g_y[7].g_x[2].t.w_dh ),
    .A1(\g.g_y[7].g_x[2].t.w_oh ),
    .S(\g.g_y[7].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[2].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[7].g_x[2].t.cout_sc  (.CLK(clknet_3_5__leaf_clk),
    .D(\g.g_y[7].g_x[2].t.w_dv ),
    .SCD(net78),
    .SCE(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[7].g_x[2].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[2].t.cout_t  (.A0(\g.g_y[7].g_x[2].t.w_ov ),
    .A1(\g.g_y[7].g_x[2].t.w_dh ),
    .S(\g.g_y[7].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[2].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[2].t.cw_d  (.A0(\g.g_y[7].g_x[2].t.w_d ),
    .A1(\g.g_y[7].g_x[2].t.out_sc ),
    .S(net55),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[2].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[2].t.cw_dh  (.A0(\g.g_y[7].g_x[2].t.w_hl ),
    .A1(\g.g_y[7].g_x[2].t.w_vt ),
    .S(\g.g_y[7].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[2].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[2].t.cw_dv  (.A0(\g.g_y[7].g_x[2].t.w_vt ),
    .A1(\g.g_y[7].g_x[2].t.w_hl ),
    .S(\g.g_y[7].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[2].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[2].t.cw_h  (.A0(\g.g_y[7].g_x[2].t.w_h ),
    .A1(\g.g_y[7].g_x[2].t.out_sc ),
    .S(net45),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[2].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[2].t.cw_hl  (.A0(\g.g_y[7].g_x[1].t.out_r ),
    .A1(\g.g_y[7].g_x[2].t.in_r ),
    .S(\g.g_y[7].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[2].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[2].t.cw_hr  (.A0(\g.g_y[7].g_x[2].t.in_r ),
    .A1(\g.g_y[7].g_x[1].t.out_r ),
    .S(\g.g_y[7].g_x[2].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[2].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[7].g_x[2].t.cw_na  (.A(\g.g_y[7].g_x[2].t.w_hr ),
    .B(\g.g_y[7].g_x[2].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[7].g_x[2].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[2].t.cw_oh  (.A0(\g.g_y[7].g_x[2].t.out_sc ),
    .A1(\g.g_y[7].g_x[2].t.w_gn ),
    .S(\g.g_y[7].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[2].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[2].t.cw_ov  (.A0(\g.g_y[7].g_x[2].t.w_gn ),
    .A1(\g.g_y[7].g_x[2].t.out_sc ),
    .S(\g.g_y[7].g_x[2].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[2].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[2].t.cw_v  (.A0(\g.g_y[7].g_x[2].t.w_v ),
    .A1(\g.g_y[7].g_x[2].t.out_sc ),
    .S(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[2].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[2].t.cw_vb  (.A0(\g.g_y[0].g_x[2].t.out_t ),
    .A1(\g.g_y[6].g_x[2].t.out_b ),
    .S(\g.g_y[7].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[2].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[2].t.cw_vt  (.A0(\g.g_y[6].g_x[2].t.out_b ),
    .A1(\g.g_y[0].g_x[2].t.out_t ),
    .S(\g.g_y[7].g_x[2].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[2].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cout_b  (.A0(\g.g_y[7].g_x[3].t.w_gh ),
    .A1(\g.g_y[7].g_x[3].t.w_ov ),
    .S(\g.g_y[7].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[3].t.in_t ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cout_l  (.A0(\g.g_y[7].g_x[3].t.w_oh ),
    .A1(\g.g_y[7].g_x[3].t.w_gh ),
    .S(\g.g_y[7].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[2].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cout_r  (.A0(\g.g_y[7].g_x[3].t.w_gh ),
    .A1(\g.g_y[7].g_x[3].t.w_oh ),
    .S(\g.g_y[7].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[7].g_x[3].t.cout_sc  (.CLK(clknet_3_4__leaf_clk),
    .D(\g.g_y[7].g_x[3].t.w_dv ),
    .SCD(net82),
    .SCE(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[7].g_x[3].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cout_t  (.A0(\g.g_y[7].g_x[3].t.w_ov ),
    .A1(\g.g_y[7].g_x[3].t.w_gh ),
    .S(\g.g_y[7].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[3].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[3].t.cw_d  (.A0(\g.g_y[7].g_x[3].t.w_d ),
    .A1(\g.g_y[7].g_x[3].t.out_sc ),
    .S(net55),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cw_dh  (.A0(\g.g_y[7].g_x[3].t.w_hl ),
    .A1(\g.g_y[7].g_x[3].t.w_vt ),
    .S(\g.g_y[7].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cw_dv  (.A0(\g.g_y[7].g_x[3].t.w_vt ),
    .A1(\g.g_y[7].g_x[3].t.w_hl ),
    .S(\g.g_y[7].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cw_gh  (.A0(\g.g_y[7].g_x[3].t.w_dh ),
    .A1(\g.g_y[7].g_x[3].t.w_gh ),
    .S(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cw_gn  (.A0(\g.g_y[7].g_x[3].t.w_na ),
    .A1(\g.g_y[7].g_x[3].t.w_gn ),
    .S(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[3].t.cw_h  (.A0(\g.g_y[7].g_x[3].t.w_h ),
    .A1(\g.g_y[7].g_x[3].t.out_sc ),
    .S(net45),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cw_hl  (.A0(\g.g_y[7].g_x[2].t.out_r ),
    .A1(\g.g_y[7].g_x[3].t.in_r ),
    .S(\g.g_y[7].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cw_hr  (.A0(\g.g_y[7].g_x[3].t.in_r ),
    .A1(\g.g_y[7].g_x[2].t.out_r ),
    .S(\g.g_y[7].g_x[3].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[7].g_x[3].t.cw_na  (.A(\g.g_y[7].g_x[3].t.w_hr ),
    .B(\g.g_y[7].g_x[3].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[7].g_x[3].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cw_oh  (.A0(\g.g_y[7].g_x[3].t.out_sc ),
    .A1(\g.g_y[7].g_x[3].t.w_gn ),
    .S(\g.g_y[7].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cw_ov  (.A0(\g.g_y[7].g_x[3].t.w_gn ),
    .A1(\g.g_y[7].g_x[3].t.out_sc ),
    .S(\g.g_y[7].g_x[3].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[3].t.cw_v  (.A0(\g.g_y[7].g_x[3].t.w_v ),
    .A1(\g.g_y[7].g_x[3].t.out_sc ),
    .S(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cw_vb  (.A0(\g.g_y[0].g_x[3].t.out_t ),
    .A1(\g.g_y[6].g_x[3].t.out_b ),
    .S(\g.g_y[7].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[3].t.cw_vt  (.A0(\g.g_y[6].g_x[3].t.out_b ),
    .A1(\g.g_y[0].g_x[3].t.out_t ),
    .S(\g.g_y[7].g_x[3].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[4].t.cout_b  (.A0(\g.g_y[7].g_x[4].t.w_dh ),
    .A1(\g.g_y[7].g_x[4].t.w_ov ),
    .S(\g.g_y[7].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[4].t.in_t ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[4].t.cout_l  (.A0(\g.g_y[7].g_x[4].t.w_oh ),
    .A1(\g.g_y[7].g_x[4].t.w_dh ),
    .S(\g.g_y[7].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[3].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[4].t.cout_r  (.A0(\g.g_y[7].g_x[4].t.w_dh ),
    .A1(\g.g_y[7].g_x[4].t.w_oh ),
    .S(\g.g_y[7].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[4].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[7].g_x[4].t.cout_sc  (.CLK(clknet_3_1__leaf_clk),
    .D(\g.g_y[7].g_x[4].t.w_dv ),
    .SCD(net125),
    .SCE(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[7].g_x[4].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[4].t.cout_t  (.A0(\g.g_y[7].g_x[4].t.w_ov ),
    .A1(\g.g_y[7].g_x[4].t.w_dh ),
    .S(\g.g_y[7].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[4].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[4].t.cw_d  (.A0(\g.g_y[7].g_x[4].t.w_d ),
    .A1(\g.g_y[7].g_x[4].t.out_sc ),
    .S(net51),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[4].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[4].t.cw_dh  (.A0(\g.g_y[7].g_x[4].t.w_hl ),
    .A1(\g.g_y[7].g_x[4].t.w_vt ),
    .S(\g.g_y[7].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[4].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[4].t.cw_dv  (.A0(\g.g_y[7].g_x[4].t.w_vt ),
    .A1(\g.g_y[7].g_x[4].t.w_hl ),
    .S(\g.g_y[7].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[4].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[4].t.cw_h  (.A0(\g.g_y[7].g_x[4].t.w_h ),
    .A1(\g.g_y[7].g_x[4].t.out_sc ),
    .S(net41),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[4].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[4].t.cw_hl  (.A0(\g.g_y[7].g_x[3].t.out_r ),
    .A1(\g.g_y[7].g_x[4].t.in_r ),
    .S(\g.g_y[7].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[4].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[4].t.cw_hr  (.A0(\g.g_y[7].g_x[4].t.in_r ),
    .A1(\g.g_y[7].g_x[3].t.out_r ),
    .S(\g.g_y[7].g_x[4].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[4].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[7].g_x[4].t.cw_na  (.A(\g.g_y[7].g_x[4].t.w_hr ),
    .B(\g.g_y[7].g_x[4].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[7].g_x[4].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[4].t.cw_oh  (.A0(\g.g_y[7].g_x[4].t.out_sc ),
    .A1(\g.g_y[7].g_x[4].t.w_gn ),
    .S(\g.g_y[7].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[4].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[4].t.cw_ov  (.A0(\g.g_y[7].g_x[4].t.w_gn ),
    .A1(\g.g_y[7].g_x[4].t.out_sc ),
    .S(\g.g_y[7].g_x[4].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[4].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[4].t.cw_v  (.A0(\g.g_y[7].g_x[4].t.w_v ),
    .A1(\g.g_y[7].g_x[4].t.out_sc ),
    .S(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[4].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[4].t.cw_vb  (.A0(\g.g_y[0].g_x[4].t.out_t ),
    .A1(\g.g_y[6].g_x[4].t.out_b ),
    .S(\g.g_y[7].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[4].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[4].t.cw_vt  (.A0(\g.g_y[6].g_x[4].t.out_b ),
    .A1(\g.g_y[0].g_x[4].t.out_t ),
    .S(\g.g_y[7].g_x[4].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[4].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cout_b  (.A0(\g.g_y[7].g_x[5].t.w_gh ),
    .A1(\g.g_y[7].g_x[5].t.w_ov ),
    .S(\g.g_y[7].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[5].t.in_t ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cout_l  (.A0(\g.g_y[7].g_x[5].t.w_oh ),
    .A1(\g.g_y[7].g_x[5].t.w_gh ),
    .S(\g.g_y[7].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[4].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cout_r  (.A0(\g.g_y[7].g_x[5].t.w_gh ),
    .A1(\g.g_y[7].g_x[5].t.w_oh ),
    .S(\g.g_y[7].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[7].g_x[5].t.cout_sc  (.CLK(clknet_3_0__leaf_clk),
    .D(\g.g_y[7].g_x[5].t.w_dv ),
    .SCD(net80),
    .SCE(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[7].g_x[5].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cout_t  (.A0(\g.g_y[7].g_x[5].t.w_ov ),
    .A1(\g.g_y[7].g_x[5].t.w_gh ),
    .S(\g.g_y[7].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[5].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[5].t.cw_d  (.A0(\g.g_y[7].g_x[5].t.w_d ),
    .A1(\g.g_y[7].g_x[5].t.out_sc ),
    .S(net51),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cw_dh  (.A0(\g.g_y[7].g_x[5].t.w_hl ),
    .A1(\g.g_y[7].g_x[5].t.w_vt ),
    .S(\g.g_y[7].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cw_dv  (.A0(\g.g_y[7].g_x[5].t.w_vt ),
    .A1(\g.g_y[7].g_x[5].t.w_hl ),
    .S(\g.g_y[7].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cw_gh  (.A0(\g.g_y[7].g_x[5].t.w_dh ),
    .A1(\g.g_y[7].g_x[5].t.w_gh ),
    .S(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cw_gn  (.A0(\g.g_y[7].g_x[5].t.w_na ),
    .A1(\g.g_y[7].g_x[5].t.w_gn ),
    .S(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[5].t.cw_h  (.A0(\g.g_y[7].g_x[5].t.w_h ),
    .A1(\g.g_y[7].g_x[5].t.out_sc ),
    .S(net41),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cw_hl  (.A0(\g.g_y[7].g_x[4].t.out_r ),
    .A1(\g.g_y[7].g_x[5].t.in_r ),
    .S(\g.g_y[7].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cw_hr  (.A0(\g.g_y[7].g_x[5].t.in_r ),
    .A1(\g.g_y[7].g_x[4].t.out_r ),
    .S(\g.g_y[7].g_x[5].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[7].g_x[5].t.cw_na  (.A(\g.g_y[7].g_x[5].t.w_hr ),
    .B(\g.g_y[7].g_x[5].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[7].g_x[5].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cw_oh  (.A0(\g.g_y[7].g_x[5].t.out_sc ),
    .A1(\g.g_y[7].g_x[5].t.w_gn ),
    .S(\g.g_y[7].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cw_ov  (.A0(\g.g_y[7].g_x[5].t.w_gn ),
    .A1(\g.g_y[7].g_x[5].t.out_sc ),
    .S(\g.g_y[7].g_x[5].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[5].t.cw_v  (.A0(\g.g_y[7].g_x[5].t.w_v ),
    .A1(\g.g_y[7].g_x[5].t.out_sc ),
    .S(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cw_vb  (.A0(\g.g_y[0].g_x[5].t.out_t ),
    .A1(\g.g_y[6].g_x[5].t.out_b ),
    .S(\g.g_y[7].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[5].t.cw_vt  (.A0(\g.g_y[6].g_x[5].t.out_b ),
    .A1(\g.g_y[0].g_x[5].t.out_t ),
    .S(\g.g_y[7].g_x[5].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[6].t.cout_b  (.A0(\g.g_y[7].g_x[6].t.w_dh ),
    .A1(\g.g_y[7].g_x[6].t.w_ov ),
    .S(\g.g_y[7].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[6].t.in_t ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[6].t.cout_l  (.A0(\g.g_y[7].g_x[6].t.w_oh ),
    .A1(\g.g_y[7].g_x[6].t.w_dh ),
    .S(\g.g_y[7].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[5].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[6].t.cout_r  (.A0(\g.g_y[7].g_x[6].t.w_dh ),
    .A1(\g.g_y[7].g_x[6].t.w_oh ),
    .S(\g.g_y[7].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[6].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[7].g_x[6].t.cout_sc  (.CLK(clknet_3_2__leaf_clk),
    .D(\g.g_y[7].g_x[6].t.w_dv ),
    .SCD(net110),
    .SCE(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[7].g_x[6].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[6].t.cout_t  (.A0(\g.g_y[7].g_x[6].t.w_ov ),
    .A1(\g.g_y[7].g_x[6].t.w_dh ),
    .S(\g.g_y[7].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[6].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[6].t.cw_d  (.A0(\g.g_y[7].g_x[6].t.w_d ),
    .A1(\g.g_y[7].g_x[6].t.out_sc ),
    .S(net53),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[6].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[6].t.cw_dh  (.A0(\g.g_y[7].g_x[6].t.w_hl ),
    .A1(\g.g_y[7].g_x[6].t.w_vt ),
    .S(\g.g_y[7].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[6].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[6].t.cw_dv  (.A0(\g.g_y[7].g_x[6].t.w_vt ),
    .A1(\g.g_y[7].g_x[6].t.w_hl ),
    .S(\g.g_y[7].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[6].t.w_dv ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[6].t.cw_h  (.A0(\g.g_y[7].g_x[6].t.w_h ),
    .A1(\g.g_y[7].g_x[6].t.out_sc ),
    .S(net43),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[6].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[6].t.cw_hl  (.A0(\g.g_y[7].g_x[5].t.out_r ),
    .A1(\g.g_y[7].g_x[6].t.in_r ),
    .S(\g.g_y[7].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[6].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[6].t.cw_hr  (.A0(\g.g_y[7].g_x[6].t.in_r ),
    .A1(\g.g_y[7].g_x[5].t.out_r ),
    .S(\g.g_y[7].g_x[6].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[6].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[7].g_x[6].t.cw_na  (.A(\g.g_y[7].g_x[6].t.w_hr ),
    .B(\g.g_y[7].g_x[6].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[7].g_x[6].t.w_gn ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[6].t.cw_oh  (.A0(\g.g_y[7].g_x[6].t.out_sc ),
    .A1(\g.g_y[7].g_x[6].t.w_gn ),
    .S(\g.g_y[7].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[6].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[6].t.cw_ov  (.A0(\g.g_y[7].g_x[6].t.w_gn ),
    .A1(\g.g_y[7].g_x[6].t.out_sc ),
    .S(\g.g_y[7].g_x[6].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[6].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[6].t.cw_v  (.A0(\g.g_y[7].g_x[6].t.w_v ),
    .A1(\g.g_y[7].g_x[6].t.out_sc ),
    .S(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[6].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[6].t.cw_vb  (.A0(\g.g_y[0].g_x[6].t.out_t ),
    .A1(\g.g_y[6].g_x[6].t.out_b ),
    .S(\g.g_y[7].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[6].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[6].t.cw_vt  (.A0(\g.g_y[6].g_x[6].t.out_b ),
    .A1(\g.g_y[0].g_x[6].t.out_t ),
    .S(\g.g_y[7].g_x[6].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[6].t.w_vt ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cout_b  (.A0(\g.g_y[7].g_x[7].t.w_gh ),
    .A1(\g.g_y[7].g_x[7].t.w_ov ),
    .S(\g.g_y[7].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[0].g_x[7].t.in_t ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cout_l  (.A0(\g.g_y[7].g_x[7].t.w_oh ),
    .A1(\g.g_y[7].g_x[7].t.w_gh ),
    .S(\g.g_y[7].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[6].t.in_r ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cout_r  (.A0(\g.g_y[7].g_x[7].t.w_gh ),
    .A1(\g.g_y[7].g_x[7].t.w_oh ),
    .S(\g.g_y[7].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.out_r ));
 sky130_fd_sc_hd__sdfxtp_1 \g.g_y[7].g_x[7].t.cout_sc  (.CLK(clknet_3_2__leaf_clk),
    .D(\g.g_y[7].g_x[7].t.w_dv ),
    .SCD(net120),
    .SCE(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\g.g_y[7].g_x[7].t.out_sc ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cout_t  (.A0(\g.g_y[7].g_x[7].t.w_ov ),
    .A1(\g.g_y[7].g_x[7].t.w_gh ),
    .S(\g.g_y[7].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[6].g_x[7].t.in_b ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[7].t.cw_d  (.A0(\g.g_y[7].g_x[7].t.w_d ),
    .A1(\g.g_y[7].g_x[7].t.out_sc ),
    .S(net53),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.w_d ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cw_dh  (.A0(\g.g_y[7].g_x[7].t.w_hl ),
    .A1(\g.g_y[7].g_x[7].t.w_vt ),
    .S(\g.g_y[7].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.w_dh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cw_dv  (.A0(\g.g_y[7].g_x[7].t.w_vt ),
    .A1(\g.g_y[7].g_x[7].t.w_hl ),
    .S(\g.g_y[7].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.w_dv ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cw_gh  (.A0(\g.g_y[7].g_x[7].t.w_dh ),
    .A1(\g.g_y[7].g_x[7].t.w_gh ),
    .S(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.w_gh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cw_gn  (.A0(\g.g_y[7].g_x[7].t.w_na ),
    .A1(\g.g_y[7].g_x[7].t.w_gn ),
    .S(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.w_gn ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[7].t.cw_h  (.A0(\g.g_y[7].g_x[7].t.w_h ),
    .A1(\g.g_y[7].g_x[7].t.out_sc ),
    .S(net43),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.w_h ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cw_hl  (.A0(\g.g_y[7].g_x[6].t.out_r ),
    .A1(\g.g_y[7].g_x[0].t.out_l ),
    .S(\g.g_y[7].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.w_hl ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cw_hr  (.A0(\g.g_y[7].g_x[0].t.out_l ),
    .A1(\g.g_y[7].g_x[6].t.out_r ),
    .S(\g.g_y[7].g_x[7].t.w_h ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.w_hr ));
 sky130_fd_sc_hd__nand2_1 \g.g_y[7].g_x[7].t.cw_na  (.A(\g.g_y[7].g_x[7].t.w_hr ),
    .B(\g.g_y[7].g_x[7].t.w_vb ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\g.g_y[7].g_x[7].t.w_na ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cw_oh  (.A0(\g.g_y[7].g_x[7].t.out_sc ),
    .A1(\g.g_y[7].g_x[7].t.w_gn ),
    .S(\g.g_y[7].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.w_oh ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cw_ov  (.A0(\g.g_y[7].g_x[7].t.w_gn ),
    .A1(\g.g_y[7].g_x[7].t.out_sc ),
    .S(\g.g_y[7].g_x[7].t.w_d ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.w_ov ));
 sky130_fd_sc_hd__mux2_2 \g.g_y[7].g_x[7].t.cw_v  (.A0(\g.g_y[7].g_x[7].t.w_v ),
    .A1(\g.g_y[7].g_x[7].t.out_sc ),
    .S(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.w_v ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cw_vb  (.A0(\g.g_y[0].g_x[7].t.out_t ),
    .A1(\g.g_y[6].g_x[7].t.out_b ),
    .S(\g.g_y[7].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.w_vb ));
 sky130_fd_sc_hd__mux2_1 \g.g_y[7].g_x[7].t.cw_vt  (.A0(\g.g_y[6].g_x[7].t.out_b ),
    .A1(\g.g_y[0].g_x[7].t.out_t ),
    .S(\g.g_y[7].g_x[7].t.w_v ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\g.g_y[7].g_x[7].t.w_vt ));
 sky130_fd_sc_hd__dlygate4sd3_1 hold1 (.A(\g.g_y[6].g_x[5].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net75));
 sky130_fd_sc_hd__dlygate4sd3_1 hold10 (.A(\g.g_y[1].g_x[5].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net84));
 sky130_fd_sc_hd__dlygate4sd3_1 hold11 (.A(\g.g_y[0].g_x[1].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net85));
 sky130_fd_sc_hd__dlygate4sd3_1 hold12 (.A(\g.g_y[0].g_x[5].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net86));
 sky130_fd_sc_hd__dlygate4sd3_1 hold13 (.A(\g.g_y[3].g_x[4].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net87));
 sky130_fd_sc_hd__dlygate4sd3_1 hold14 (.A(\g.g_y[6].g_x[1].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net88));
 sky130_fd_sc_hd__dlygate4sd3_1 hold15 (.A(\g.g_y[3].g_x[1].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net89));
 sky130_fd_sc_hd__dlygate4sd3_1 hold16 (.A(\g.g_y[1].g_x[4].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net90));
 sky130_fd_sc_hd__dlygate4sd3_1 hold17 (.A(\g.g_y[4].g_x[5].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net91));
 sky130_fd_sc_hd__dlygate4sd3_1 hold18 (.A(\g.g_y[6].g_x[2].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net92));
 sky130_fd_sc_hd__dlygate4sd3_1 hold19 (.A(\g.g_y[6].g_x[4].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net93));
 sky130_fd_sc_hd__dlygate4sd3_1 hold2 (.A(\g.g_y[4].g_x[4].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net76));
 sky130_fd_sc_hd__dlygate4sd3_1 hold20 (.A(\g.g_y[4].g_x[1].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net94));
 sky130_fd_sc_hd__dlygate4sd3_1 hold21 (.A(\g.g_y[2].g_x[6].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net95));
 sky130_fd_sc_hd__dlygate4sd3_1 hold22 (.A(\g.g_y[2].g_x[5].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net96));
 sky130_fd_sc_hd__dlygate4sd3_1 hold23 (.A(\g.g_y[6].g_x[6].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net97));
 sky130_fd_sc_hd__dlygate4sd3_1 hold24 (.A(\g.g_y[4].g_x[6].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net98));
 sky130_fd_sc_hd__dlygate4sd3_1 hold25 (.A(\g.g_y[0].g_x[2].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net99));
 sky130_fd_sc_hd__dlygate4sd3_1 hold26 (.A(\g.g_y[3].g_x[6].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net100));
 sky130_fd_sc_hd__dlygate4sd3_1 hold27 (.A(\g.g_y[4].g_x[2].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net101));
 sky130_fd_sc_hd__dlygate4sd3_1 hold28 (.A(\g.g_y[5].g_x[2].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net102));
 sky130_fd_sc_hd__dlygate4sd3_1 hold29 (.A(\g.g_y[2].g_x[4].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net103));
 sky130_fd_sc_hd__dlygate4sd3_1 hold3 (.A(\g.g_y[0].g_x[6].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net77));
 sky130_fd_sc_hd__dlygate4sd3_1 hold30 (.A(\g.g_y[3].g_x[2].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net104));
 sky130_fd_sc_hd__dlygate4sd3_1 hold31 (.A(\g.g_y[1].g_x[2].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net105));
 sky130_fd_sc_hd__dlygate4sd3_1 hold32 (.A(\g.g_y[4].g_x[7].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net106));
 sky130_fd_sc_hd__dlygate4sd3_1 hold33 (.A(\g.g_y[7].g_x[0].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net107));
 sky130_fd_sc_hd__dlygate4sd3_1 hold34 (.A(\g.g_y[2].g_x[1].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net108));
 sky130_fd_sc_hd__dlygate4sd3_1 hold35 (.A(\g.g_y[2].g_x[7].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net109));
 sky130_fd_sc_hd__dlygate4sd3_1 hold36 (.A(\g.g_y[7].g_x[5].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net110));
 sky130_fd_sc_hd__dlygate4sd3_1 hold37 (.A(\g.g_y[1].g_x[6].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net111));
 sky130_fd_sc_hd__dlygate4sd3_1 hold38 (.A(\g.g_y[4].g_x[0].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net112));
 sky130_fd_sc_hd__dlygate4sd3_1 hold39 (.A(\g.g_y[5].g_x[0].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net113));
 sky130_fd_sc_hd__dlygate4sd3_1 hold4 (.A(\g.g_y[7].g_x[1].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net78));
 sky130_fd_sc_hd__dlygate4sd3_1 hold40 (.A(\g.g_y[0].g_x[0].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net114));
 sky130_fd_sc_hd__dlygate4sd3_1 hold41 (.A(\g.g_y[6].g_x[0].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net115));
 sky130_fd_sc_hd__dlygate4sd3_1 hold42 (.A(\g.g_y[5].g_x[6].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net116));
 sky130_fd_sc_hd__dlygate4sd3_1 hold43 (.A(\g.g_y[5].g_x[1].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net117));
 sky130_fd_sc_hd__dlygate4sd3_1 hold44 (.A(\g.g_y[3].g_x[0].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net118));
 sky130_fd_sc_hd__dlygate4sd3_1 hold45 (.A(\g.g_y[3].g_x[5].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net119));
 sky130_fd_sc_hd__dlygate4sd3_1 hold46 (.A(\g.g_y[7].g_x[6].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net120));
 sky130_fd_sc_hd__dlygate4sd3_1 hold47 (.A(\g.g_y[5].g_x[5].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net121));
 sky130_fd_sc_hd__dlygate4sd3_1 hold48 (.A(\g.g_y[5].g_x[7].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net122));
 sky130_fd_sc_hd__dlygate4sd3_1 hold49 (.A(\g.g_y[1].g_x[7].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net123));
 sky130_fd_sc_hd__dlygate4sd3_1 hold5 (.A(\g.g_y[0].g_x[4].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net79));
 sky130_fd_sc_hd__dlygate4sd3_1 hold50 (.A(\g.g_y[0].g_x[3].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net124));
 sky130_fd_sc_hd__dlygate4sd3_1 hold51 (.A(\g.g_y[7].g_x[3].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net125));
 sky130_fd_sc_hd__dlygate4sd3_1 hold52 (.A(\g.g_y[4].g_x[3].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net126));
 sky130_fd_sc_hd__dlygate4sd3_1 hold53 (.A(\g.g_y[3].g_x[3].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net127));
 sky130_fd_sc_hd__dlygate4sd3_1 hold54 (.A(\g.g_y[5].g_x[3].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net128));
 sky130_fd_sc_hd__dlygate4sd3_1 hold55 (.A(\g.g_y[6].g_x[3].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net129));
 sky130_fd_sc_hd__dlygate4sd3_1 hold56 (.A(\g.g_y[2].g_x[2].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net130));
 sky130_fd_sc_hd__dlygate4sd3_1 hold57 (.A(\g.g_y[1].g_x[3].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net131));
 sky130_fd_sc_hd__dlygate4sd3_1 hold58 (.A(\g.g_y[0].g_x[7].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net132));
 sky130_fd_sc_hd__dlygate4sd3_1 hold59 (.A(\g.g_y[6].g_x[7].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net133));
 sky130_fd_sc_hd__dlygate4sd3_1 hold6 (.A(\g.g_y[7].g_x[4].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net80));
 sky130_fd_sc_hd__dlygate4sd3_1 hold60 (.A(\g.g_y[1].g_x[0].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net134));
 sky130_fd_sc_hd__dlygate4sd3_1 hold61 (.A(\g.g_y[2].g_x[0].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net135));
 sky130_fd_sc_hd__dlygate4sd3_1 hold7 (.A(\g.g_y[3].g_x[7].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net81));
 sky130_fd_sc_hd__dlygate4sd3_1 hold8 (.A(\g.g_y[7].g_x[2].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net82));
 sky130_fd_sc_hd__dlygate4sd3_1 hold9 (.A(\g.g_y[1].g_x[1].t.out_sc ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net83));
 sky130_fd_sc_hd__clkbuf_2 input1 (.A(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input10 (.A(uio_in[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net10));
 sky130_fd_sc_hd__clkbuf_1 input11 (.A(uio_in[1]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net11));
 sky130_fd_sc_hd__clkbuf_2 input12 (.A(uio_in[2]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net12));
 sky130_fd_sc_hd__buf_1 input13 (.A(uio_in[3]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net13));
 sky130_fd_sc_hd__clkbuf_1 input14 (.A(uio_in[4]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net14));
 sky130_fd_sc_hd__clkbuf_2 input15 (.A(uio_in[5]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net15));
 sky130_fd_sc_hd__dlymetal6s2s_1 input16 (.A(uio_in[6]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net16));
 sky130_fd_sc_hd__buf_1 input2 (.A(ui_in[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net2));
 sky130_fd_sc_hd__buf_1 input3 (.A(ui_in[1]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net3));
 sky130_fd_sc_hd__clkbuf_1 input4 (.A(ui_in[2]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net4));
 sky130_fd_sc_hd__buf_1 input5 (.A(ui_in[3]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net5));
 sky130_fd_sc_hd__buf_1 input6 (.A(ui_in[4]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net6));
 sky130_fd_sc_hd__buf_1 input7 (.A(ui_in[5]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net7));
 sky130_fd_sc_hd__buf_1 input8 (.A(ui_in[6]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net8));
 sky130_fd_sc_hd__buf_1 input9 (.A(ui_in[7]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net9));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_60 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net60));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_61 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net61));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_62 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net62));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_63 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net63));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_64 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net64));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_65 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net65));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_66 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net66));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_67 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net67));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_68 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net68));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_69 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net69));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_70 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net70));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_71 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net71));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_72 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net72));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_73 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net73));
 sky130_fd_sc_hd__conb_1 tt_um_htfab_rotfpga2_74 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .HI(net74));
 assign uio_oe[0] = net60;
 assign uio_oe[1] = net61;
 assign uio_oe[2] = net62;
 assign uio_oe[3] = net63;
 assign uio_oe[4] = net64;
 assign uio_oe[5] = net65;
 assign uio_oe[6] = net66;
 assign uio_oe[7] = net74;
 assign uio_out[0] = net67;
 assign uio_out[1] = net68;
 assign uio_out[2] = net69;
 assign uio_out[3] = net70;
 assign uio_out[4] = net71;
 assign uio_out[5] = net72;
 assign uio_out[6] = net73;
endmodule
