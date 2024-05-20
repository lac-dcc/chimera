// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__brownout
// License: Apache License 2.0

module brownout_dig (brout_filt,
    dcomp,
    ena,
    force_dis_rc_osc,
    force_ena_rc_osc,
    force_short_oneshot,
    osc_ck,
    osc_ena,
    outb_unbuf,
    timed_out,
    otrip,
    otrip_decoded,
    vtrip,
    vtrip_decoded);
 input brout_filt;
 input dcomp;
 input ena;
 input force_dis_rc_osc;
 input force_ena_rc_osc;
 input force_short_oneshot;
 input osc_ck;
 output osc_ena;
 output outb_unbuf;
 output timed_out;
 input [2:0] otrip;
 output [7:0] otrip_decoded;
 input [2:0] vtrip;
 output [7:0] vtrip_decoded;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire clr_cnt;
 wire clr_cnt_sb;
 wire clr_cnt_sb_stg1;
 wire \cnt[0] ;
 wire \cnt[10] ;
 wire \cnt[11] ;
 wire \cnt[1] ;
 wire \cnt[2] ;
 wire \cnt[3] ;
 wire \cnt[4] ;
 wire \cnt[5] ;
 wire \cnt[6] ;
 wire \cnt[7] ;
 wire \cnt[8] ;
 wire \cnt[9] ;
 wire dcomp_ena_rsb;
 wire dcomp_retimed;
 wire clknet_0_osc_ck;
 wire net35;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
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
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire clknet_1_0__leaf_osc_ck;
 wire clknet_1_1__leaf_osc_ck;
 wire net36;
 wire net37;
 wire net38;
 wire net39;

 sky130_fd_sc_hd__inv_2 _043_ (.A(net32),
    .Y(_028_));
 sky130_fd_sc_hd__inv_2 _044_ (.A(net4),
    .Y(_029_));
 sky130_fd_sc_hd__inv_2 _045_ (.A(net1),
    .Y(_000_));
 sky130_fd_sc_hd__nand2_1 _046_ (.A(\cnt[1] ),
    .B(\cnt[0] ),
    .Y(_030_));
 sky130_fd_sc_hd__and4_1 _047_ (.A(\cnt[1] ),
    .B(\cnt[0] ),
    .C(\cnt[3] ),
    .D(\cnt[2] ),
    .X(_031_));
 sky130_fd_sc_hd__and2_1 _048_ (.A(\cnt[4] ),
    .B(_031_),
    .X(_032_));
 sky130_fd_sc_hd__and2_1 _049_ (.A(\cnt[5] ),
    .B(\cnt[6] ),
    .X(_033_));
 sky130_fd_sc_hd__nand2_1 _050_ (.A(_032_),
    .B(_033_),
    .Y(_034_));
 sky130_fd_sc_hd__and4_1 _051_ (.A(\cnt[4] ),
    .B(\cnt[7] ),
    .C(_031_),
    .D(_033_),
    .X(_035_));
 sky130_fd_sc_hd__and2_1 _052_ (.A(\cnt[9] ),
    .B(\cnt[10] ),
    .X(_036_));
 sky130_fd_sc_hd__and4_2 _053_ (.A(\cnt[8] ),
    .B(\cnt[11] ),
    .C(_035_),
    .D(_036_),
    .X(net23));
 sky130_fd_sc_hd__and2b_1 _054_ (.A_N(dcomp_retimed),
    .B(net23),
    .X(net22));
 sky130_fd_sc_hd__nor3_1 _055_ (.A(net9),
    .B(net7),
    .C(net8),
    .Y(net14));
 sky130_fd_sc_hd__nor3b_1 _056_ (.A(net9),
    .B(net8),
    .C_N(net7),
    .Y(net15));
 sky130_fd_sc_hd__nor3b_1 _057_ (.A(net9),
    .B(net7),
    .C_N(net8),
    .Y(net16));
 sky130_fd_sc_hd__and3b_1 _058_ (.A_N(net9),
    .B(net7),
    .C(net8),
    .X(net17));
 sky130_fd_sc_hd__nor3b_1 _059_ (.A(net7),
    .B(net8),
    .C_N(net9),
    .Y(net18));
 sky130_fd_sc_hd__and3b_1 _060_ (.A_N(net8),
    .B(net7),
    .C(net9),
    .X(net19));
 sky130_fd_sc_hd__and3b_1 _061_ (.A_N(net7),
    .B(net8),
    .C(net9),
    .X(net20));
 sky130_fd_sc_hd__and3_1 _062_ (.A(net9),
    .B(net7),
    .C(net8),
    .X(net21));
 sky130_fd_sc_hd__nor3_1 _063_ (.A(net12),
    .B(net11),
    .C(net10),
    .Y(net24));
 sky130_fd_sc_hd__nor3b_1 _064_ (.A(net12),
    .B(net11),
    .C_N(net10),
    .Y(net25));
 sky130_fd_sc_hd__nor3b_1 _065_ (.A(net12),
    .B(net10),
    .C_N(net11),
    .Y(net26));
 sky130_fd_sc_hd__and3b_1 _066_ (.A_N(net12),
    .B(net11),
    .C(net10),
    .X(net27));
 sky130_fd_sc_hd__nor3b_1 _067_ (.A(net11),
    .B(net10),
    .C_N(net12),
    .Y(net28));
 sky130_fd_sc_hd__and3b_1 _068_ (.A_N(net11),
    .B(net10),
    .C(net12),
    .X(net29));
 sky130_fd_sc_hd__and3b_1 _069_ (.A_N(net10),
    .B(net11),
    .C(net12),
    .X(net30));
 sky130_fd_sc_hd__and3_1 _070_ (.A(net12),
    .B(net11),
    .C(net10),
    .X(net31));
 sky130_fd_sc_hd__or3b_1 _071_ (.A(dcomp_retimed),
    .B(net2),
    .C_N(net23),
    .X(_037_));
 sky130_fd_sc_hd__a31o_1 _072_ (.A1(net33),
    .A2(_029_),
    .A3(_037_),
    .B1(net5),
    .X(net13));
 sky130_fd_sc_hd__and2_1 _073_ (.A(net2),
    .B(net33),
    .X(dcomp_ena_rsb));
 sky130_fd_sc_hd__nor2_2 _074_ (.A(net6),
    .B(net23),
    .Y(_038_));
 sky130_fd_sc_hd__a21oi_1 _075_ (.A1(net39),
    .A2(_038_),
    .B1(net32),
    .Y(_002_));
 sky130_fd_sc_hd__or2_1 _076_ (.A(\cnt[1] ),
    .B(\cnt[0] ),
    .X(_039_));
 sky130_fd_sc_hd__nand2_1 _077_ (.A(_030_),
    .B(_039_),
    .Y(_040_));
 sky130_fd_sc_hd__a21oi_1 _078_ (.A1(_038_),
    .A2(_040_),
    .B1(net32),
    .Y(_003_));
 sky130_fd_sc_hd__xor2_1 _079_ (.A(\cnt[2] ),
    .B(_030_),
    .X(_041_));
 sky130_fd_sc_hd__a21oi_1 _080_ (.A1(_038_),
    .A2(_041_),
    .B1(net32),
    .Y(_004_));
 sky130_fd_sc_hd__a31o_1 _081_ (.A1(\cnt[1] ),
    .A2(\cnt[0] ),
    .A3(\cnt[2] ),
    .B1(\cnt[3] ),
    .X(_042_));
 sky130_fd_sc_hd__nand2b_1 _082_ (.A_N(_031_),
    .B(_042_),
    .Y(_014_));
 sky130_fd_sc_hd__a21oi_1 _083_ (.A1(_038_),
    .A2(_014_),
    .B1(net32),
    .Y(_005_));
 sky130_fd_sc_hd__nor2_1 _084_ (.A(\cnt[4] ),
    .B(_031_),
    .Y(_015_));
 sky130_fd_sc_hd__or2_1 _085_ (.A(_032_),
    .B(_015_),
    .X(_016_));
 sky130_fd_sc_hd__a21oi_1 _086_ (.A1(_038_),
    .A2(_016_),
    .B1(net32),
    .Y(_006_));
 sky130_fd_sc_hd__xnor2_1 _087_ (.A(\cnt[5] ),
    .B(_032_),
    .Y(_017_));
 sky130_fd_sc_hd__a21oi_1 _088_ (.A1(_038_),
    .A2(_017_),
    .B1(net32),
    .Y(_007_));
 sky130_fd_sc_hd__a31o_1 _089_ (.A1(\cnt[5] ),
    .A2(\cnt[4] ),
    .A3(_031_),
    .B1(\cnt[6] ),
    .X(_018_));
 sky130_fd_sc_hd__nand2_1 _090_ (.A(_034_),
    .B(_018_),
    .Y(_019_));
 sky130_fd_sc_hd__a21oi_1 _091_ (.A1(_038_),
    .A2(_019_),
    .B1(net32),
    .Y(_008_));
 sky130_fd_sc_hd__xor2_1 _092_ (.A(\cnt[7] ),
    .B(_034_),
    .X(_020_));
 sky130_fd_sc_hd__a21oi_1 _093_ (.A1(_038_),
    .A2(_020_),
    .B1(net32),
    .Y(_009_));
 sky130_fd_sc_hd__xnor2_1 _094_ (.A(\cnt[8] ),
    .B(_035_),
    .Y(_021_));
 sky130_fd_sc_hd__a21oi_1 _095_ (.A1(_038_),
    .A2(_021_),
    .B1(net38),
    .Y(_010_));
 sky130_fd_sc_hd__a21o_1 _096_ (.A1(\cnt[8] ),
    .A2(_035_),
    .B1(net6),
    .X(_022_));
 sky130_fd_sc_hd__xor2_1 _097_ (.A(\cnt[9] ),
    .B(_022_),
    .X(_023_));
 sky130_fd_sc_hd__o21a_1 _098_ (.A1(net23),
    .A2(_023_),
    .B1(_028_),
    .X(_011_));
 sky130_fd_sc_hd__a21o_1 _099_ (.A1(\cnt[9] ),
    .A2(_022_),
    .B1(\cnt[10] ),
    .X(_024_));
 sky130_fd_sc_hd__a21oi_1 _100_ (.A1(_036_),
    .A2(_022_),
    .B1(net32),
    .Y(_025_));
 sky130_fd_sc_hd__a22o_1 _101_ (.A1(_028_),
    .A2(net23),
    .B1(_024_),
    .B2(_025_),
    .X(_012_));
 sky130_fd_sc_hd__and3b_1 _102_ (.A_N(\cnt[11] ),
    .B(_036_),
    .C(_022_),
    .X(_026_));
 sky130_fd_sc_hd__a21boi_1 _103_ (.A1(_036_),
    .A2(_022_),
    .B1_N(\cnt[11] ),
    .Y(_027_));
 sky130_fd_sc_hd__o31a_1 _104_ (.A1(net23),
    .A2(_026_),
    .A3(_027_),
    .B1(_028_),
    .X(_013_));
 sky130_fd_sc_hd__inv_2 _105_ (.A(net1),
    .Y(_001_));
 sky130_fd_sc_hd__dfstp_1 _106_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_002_),
    .SET_B(net33),
    .Q(\cnt[0] ));
 sky130_fd_sc_hd__dfstp_1 _107_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_003_),
    .SET_B(net33),
    .Q(\cnt[1] ));
 sky130_fd_sc_hd__dfstp_1 _108_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(_004_),
    .SET_B(net33),
    .Q(\cnt[2] ));
 sky130_fd_sc_hd__dfstp_1 _109_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_005_),
    .SET_B(net33),
    .Q(\cnt[3] ));
 sky130_fd_sc_hd__dfstp_1 _110_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_006_),
    .SET_B(net33),
    .Q(\cnt[4] ));
 sky130_fd_sc_hd__dfstp_1 _111_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_007_),
    .SET_B(net33),
    .Q(\cnt[5] ));
 sky130_fd_sc_hd__dfstp_1 _112_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_008_),
    .SET_B(net33),
    .Q(\cnt[6] ));
 sky130_fd_sc_hd__dfstp_1 _113_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(_009_),
    .SET_B(net33),
    .Q(\cnt[7] ));
 sky130_fd_sc_hd__dfstp_1 _114_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(_010_),
    .SET_B(net3),
    .Q(\cnt[8] ));
 sky130_fd_sc_hd__dfstp_1 _115_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(_011_),
    .SET_B(net3),
    .Q(\cnt[9] ));
 sky130_fd_sc_hd__dfstp_1 _116_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(_012_),
    .SET_B(net3),
    .Q(\cnt[10] ));
 sky130_fd_sc_hd__dfstp_1 _117_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(_013_),
    .SET_B(net3),
    .Q(\cnt[11] ));
 sky130_fd_sc_hd__dfstp_1 _118_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(net34),
    .SET_B(net36),
    .Q(clr_cnt));
 sky130_fd_sc_hd__dfrtp_1 _119_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(net35),
    .RESET_B(_000_),
    .Q(clr_cnt_sb_stg1));
 sky130_fd_sc_hd__dfrtp_1 _120_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(net37),
    .RESET_B(_001_),
    .Q(clr_cnt_sb));
 sky130_fd_sc_hd__dfrtp_1 _121_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(net2),
    .RESET_B(dcomp_ena_rsb),
    .Q(dcomp_retimed));
 sky130_fd_sc_hd__conb_1 _119__35 (.HI(net35));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_osc_ck (.A(osc_ck),
    .X(clknet_0_osc_ck));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Right_6 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Right_7 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Right_8 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Right_9 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Right_10 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Right_11 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Right_12 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Right_13 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Right_14 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Right_15 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_16 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_17 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_18 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_19 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_20 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_21 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_22 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_23 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_24 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_25 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Left_26 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Left_27 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Left_28 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Left_29 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Left_30 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Left_31 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_58 ();
 sky130_fd_sc_hd__buf_1 input1 (.A(brout_filt),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input2 (.A(dcomp),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_2 input3 (.A(ena),
    .X(net3));
 sky130_fd_sc_hd__clkbuf_1 input4 (.A(force_dis_rc_osc),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_1 input5 (.A(force_ena_rc_osc),
    .X(net5));
 sky130_fd_sc_hd__buf_1 input6 (.A(force_short_oneshot),
    .X(net6));
 sky130_fd_sc_hd__dlymetal6s2s_1 input7 (.A(otrip[0]),
    .X(net7));
 sky130_fd_sc_hd__dlymetal6s2s_1 input8 (.A(otrip[1]),
    .X(net8));
 sky130_fd_sc_hd__dlymetal6s2s_1 input9 (.A(otrip[2]),
    .X(net9));
 sky130_fd_sc_hd__dlymetal6s2s_1 input10 (.A(vtrip[0]),
    .X(net10));
 sky130_fd_sc_hd__dlymetal6s2s_1 input11 (.A(vtrip[1]),
    .X(net11));
 sky130_fd_sc_hd__dlymetal6s2s_1 input12 (.A(vtrip[2]),
    .X(net12));
 sky130_fd_sc_hd__buf_2 output13 (.A(net13),
    .X(osc_ena));
 sky130_fd_sc_hd__buf_2 output14 (.A(net14),
    .X(otrip_decoded[0]));
 sky130_fd_sc_hd__buf_2 output15 (.A(net15),
    .X(otrip_decoded[1]));
 sky130_fd_sc_hd__buf_2 output16 (.A(net16),
    .X(otrip_decoded[2]));
 sky130_fd_sc_hd__buf_2 output17 (.A(net17),
    .X(otrip_decoded[3]));
 sky130_fd_sc_hd__buf_2 output18 (.A(net18),
    .X(otrip_decoded[4]));
 sky130_fd_sc_hd__buf_2 output19 (.A(net19),
    .X(otrip_decoded[5]));
 sky130_fd_sc_hd__buf_2 output20 (.A(net20),
    .X(otrip_decoded[6]));
 sky130_fd_sc_hd__buf_2 output21 (.A(net21),
    .X(otrip_decoded[7]));
 sky130_fd_sc_hd__buf_2 output22 (.A(net22),
    .X(outb_unbuf));
 sky130_fd_sc_hd__buf_2 output23 (.A(net23),
    .X(timed_out));
 sky130_fd_sc_hd__clkbuf_4 output24 (.A(net24),
    .X(vtrip_decoded[0]));
 sky130_fd_sc_hd__clkbuf_4 output25 (.A(net25),
    .X(vtrip_decoded[1]));
 sky130_fd_sc_hd__clkbuf_4 output26 (.A(net26),
    .X(vtrip_decoded[2]));
 sky130_fd_sc_hd__clkbuf_4 output27 (.A(net27),
    .X(vtrip_decoded[3]));
 sky130_fd_sc_hd__clkbuf_4 output28 (.A(net28),
    .X(vtrip_decoded[4]));
 sky130_fd_sc_hd__clkbuf_4 output29 (.A(net29),
    .X(vtrip_decoded[5]));
 sky130_fd_sc_hd__clkbuf_4 output30 (.A(net30),
    .X(vtrip_decoded[6]));
 sky130_fd_sc_hd__clkbuf_4 output31 (.A(net31),
    .X(vtrip_decoded[7]));
 sky130_fd_sc_hd__buf_2 fanout32 (.A(clr_cnt),
    .X(net32));
 sky130_fd_sc_hd__clkbuf_4 fanout33 (.A(net3),
    .X(net33));
 sky130_fd_sc_hd__conb_1 _118__34 (.LO(net34));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_0__f_osc_ck (.A(clknet_0_osc_ck),
    .X(clknet_1_0__leaf_osc_ck));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_1__f_osc_ck (.A(clknet_0_osc_ck),
    .X(clknet_1_1__leaf_osc_ck));
 sky130_fd_sc_hd__dlygate4sd3_1 hold1 (.A(clr_cnt_sb),
    .X(net36));
 sky130_fd_sc_hd__dlygate4sd3_1 hold2 (.A(clr_cnt_sb_stg1),
    .X(net37));
 sky130_fd_sc_hd__dlygate4sd3_1 hold3 (.A(clr_cnt),
    .X(net38));
 sky130_fd_sc_hd__dlygate4sd3_1 hold4 (.A(\cnt[0] ),
    .X(net39));
endmodule
