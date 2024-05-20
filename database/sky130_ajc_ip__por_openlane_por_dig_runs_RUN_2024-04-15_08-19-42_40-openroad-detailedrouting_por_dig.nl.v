// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__por
// License: Apache License 2.0

module por_dig (force_dis_rc_osc,
    force_ena_rc_osc,
    force_pdn,
    force_pdnb,
    force_short_oneshot,
    osc_ck,
    osc_ena,
    por_timed_out,
    por_unbuf,
    pwup_filt,
    startup_timed_out,
    otrip,
    otrip_decoded);
 input force_dis_rc_osc;
 input force_ena_rc_osc;
 input force_pdn;
 output force_pdnb;
 input force_short_oneshot;
 input osc_ck;
 output osc_ena;
 output por_timed_out;
 output por_unbuf;
 input pwup_filt;
 output startup_timed_out;
 input [2:0] otrip;
 output [7:0] otrip_decoded;

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
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire \cnt_por[0] ;
 wire \cnt_por[10] ;
 wire \cnt_por[1] ;
 wire \cnt_por[2] ;
 wire \cnt_por[3] ;
 wire \cnt_por[4] ;
 wire \cnt_por[5] ;
 wire \cnt_por[6] ;
 wire \cnt_por[7] ;
 wire \cnt_por[8] ;
 wire \cnt_por[9] ;
 wire cnt_rsb;
 wire cnt_rsb_stg1;
 wire \cnt_st[0] ;
 wire \cnt_st[1] ;
 wire \cnt_st[2] ;
 wire \cnt_st[3] ;
 wire \cnt_st[4] ;
 wire \cnt_st[5] ;
 wire clknet_0_osc_ck;
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
 wire clknet_1_0__leaf_osc_ck;
 wire clknet_1_1__leaf_osc_ck;
 wire net28;
 wire net29;
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
 wire net40;
 wire net41;
 wire net42;

 sky130_fd_sc_hd__inv_2 _050_ (.A(net3),
    .Y(net9));
 sky130_fd_sc_hd__inv_2 _051_ (.A(net1),
    .Y(_028_));
 sky130_fd_sc_hd__and4bb_1 _052_ (.A_N(\cnt_st[3] ),
    .B_N(\cnt_st[4] ),
    .C(\cnt_st[5] ),
    .D(\cnt_st[2] ),
    .X(_029_));
 sky130_fd_sc_hd__and3b_1 _053_ (.A_N(\cnt_st[1] ),
    .B(_029_),
    .C(\cnt_st[0] ),
    .X(net21));
 sky130_fd_sc_hd__inv_2 _054_ (.A(net23),
    .Y(_030_));
 sky130_fd_sc_hd__or3b_1 _055_ (.A(\cnt_por[7] ),
    .B(\cnt_por[6] ),
    .C_N(\cnt_por[10] ),
    .X(_031_));
 sky130_fd_sc_hd__or4b_1 _056_ (.A(\cnt_por[0] ),
    .B(\cnt_por[3] ),
    .C(\cnt_por[2] ),
    .D_N(\cnt_por[1] ),
    .X(_032_));
 sky130_fd_sc_hd__and2_1 _057_ (.A(\cnt_por[9] ),
    .B(\cnt_por[8] ),
    .X(_033_));
 sky130_fd_sc_hd__and2_1 _058_ (.A(\cnt_por[5] ),
    .B(\cnt_por[4] ),
    .X(_034_));
 sky130_fd_sc_hd__or4bb_1 _059_ (.A(_031_),
    .B(_032_),
    .C_N(_033_),
    .D_N(_034_),
    .X(_035_));
 sky130_fd_sc_hd__inv_2 _060_ (.A(net22),
    .Y(net19));
 sky130_fd_sc_hd__nor3_1 _061_ (.A(net7),
    .B(net6),
    .C(net5),
    .Y(net11));
 sky130_fd_sc_hd__nor3b_1 _062_ (.A(net7),
    .B(net6),
    .C_N(net5),
    .Y(net12));
 sky130_fd_sc_hd__nor3b_1 _063_ (.A(net7),
    .B(net5),
    .C_N(net6),
    .Y(net13));
 sky130_fd_sc_hd__and3b_1 _064_ (.A_N(net7),
    .B(net6),
    .C(net5),
    .X(net14));
 sky130_fd_sc_hd__nor3b_1 _065_ (.A(net6),
    .B(net5),
    .C_N(net7),
    .Y(net15));
 sky130_fd_sc_hd__and3b_1 _066_ (.A_N(net6),
    .B(net5),
    .C(net7),
    .X(net16));
 sky130_fd_sc_hd__and3b_1 _067_ (.A_N(net5),
    .B(net6),
    .C(net7),
    .X(net17));
 sky130_fd_sc_hd__and3_1 _068_ (.A(net7),
    .B(net6),
    .C(net5),
    .X(net18));
 sky130_fd_sc_hd__a31o_1 _069_ (.A1(net8),
    .A2(_028_),
    .A3(net22),
    .B1(net2),
    .X(net10));
 sky130_fd_sc_hd__nand2_2 _070_ (.A(net23),
    .B(net22),
    .Y(_036_));
 sky130_fd_sc_hd__inv_2 _071_ (.A(_036_),
    .Y(net20));
 sky130_fd_sc_hd__or3b_1 _072_ (.A(net26),
    .B(net23),
    .C_N(\cnt_st[0] ),
    .X(_000_));
 sky130_fd_sc_hd__o21bai_1 _073_ (.A1(\cnt_st[0] ),
    .A2(\cnt_st[1] ),
    .B1_N(net26),
    .Y(_037_));
 sky130_fd_sc_hd__a211oi_1 _074_ (.A1(\cnt_st[0] ),
    .A2(net35),
    .B1(net23),
    .C1(_037_),
    .Y(_001_));
 sky130_fd_sc_hd__a21oi_1 _075_ (.A1(\cnt_st[0] ),
    .A2(\cnt_st[1] ),
    .B1(net41),
    .Y(_038_));
 sky130_fd_sc_hd__and3_1 _076_ (.A(\cnt_st[0] ),
    .B(\cnt_st[1] ),
    .C(\cnt_st[2] ),
    .X(_039_));
 sky130_fd_sc_hd__o21bai_1 _077_ (.A1(_038_),
    .A2(_039_),
    .B1_N(net26),
    .Y(_002_));
 sky130_fd_sc_hd__o21ai_1 _078_ (.A1(net26),
    .A2(_039_),
    .B1(\cnt_st[3] ),
    .Y(_040_));
 sky130_fd_sc_hd__o311a_1 _079_ (.A1(\cnt_st[3] ),
    .A2(net26),
    .A3(_039_),
    .B1(_040_),
    .C1(_030_),
    .X(_003_));
 sky130_fd_sc_hd__o211a_1 _080_ (.A1(net26),
    .A2(_039_),
    .B1(\cnt_st[3] ),
    .C1(\cnt_st[4] ),
    .X(_041_));
 sky130_fd_sc_hd__and2b_1 _081_ (.A_N(\cnt_st[4] ),
    .B(_040_),
    .X(_042_));
 sky130_fd_sc_hd__nor2_1 _082_ (.A(_041_),
    .B(_042_),
    .Y(_004_));
 sky130_fd_sc_hd__xor2_1 _083_ (.A(net30),
    .B(_041_),
    .X(_005_));
 sky130_fd_sc_hd__and3b_1 _084_ (.A_N(net26),
    .B(net23),
    .C(net22),
    .X(_043_));
 sky130_fd_sc_hd__mux2_1 _085_ (.A0(_043_),
    .A1(_036_),
    .S(\cnt_por[0] ),
    .X(_006_));
 sky130_fd_sc_hd__o211a_1 _086_ (.A1(\cnt_por[0] ),
    .A2(net26),
    .B1(net21),
    .C1(net22),
    .X(_044_));
 sky130_fd_sc_hd__and2_1 _087_ (.A(\cnt_por[1] ),
    .B(\cnt_por[0] ),
    .X(_045_));
 sky130_fd_sc_hd__o2bb2a_1 _088_ (.A1_N(_043_),
    .A2_N(_045_),
    .B1(_044_),
    .B2(net38),
    .X(_007_));
 sky130_fd_sc_hd__or2_1 _089_ (.A(\cnt_por[2] ),
    .B(_045_),
    .X(_046_));
 sky130_fd_sc_hd__nand2_1 _090_ (.A(\cnt_por[2] ),
    .B(_045_),
    .Y(_047_));
 sky130_fd_sc_hd__a32o_1 _091_ (.A1(_043_),
    .A2(_046_),
    .A3(_047_),
    .B1(_036_),
    .B2(net40),
    .X(_008_));
 sky130_fd_sc_hd__and4_1 _092_ (.A(\cnt_por[2] ),
    .B(net21),
    .C(net22),
    .D(_045_),
    .X(_048_));
 sky130_fd_sc_hd__and4_1 _093_ (.A(\cnt_por[1] ),
    .B(\cnt_por[0] ),
    .C(\cnt_por[3] ),
    .D(\cnt_por[2] ),
    .X(_049_));
 sky130_fd_sc_hd__o211a_1 _094_ (.A1(net4),
    .A2(_049_),
    .B1(_035_),
    .C1(net21),
    .X(_017_));
 sky130_fd_sc_hd__o21ba_1 _095_ (.A1(net33),
    .A2(_048_),
    .B1_N(_017_),
    .X(_009_));
 sky130_fd_sc_hd__nand2_1 _096_ (.A(\cnt_por[4] ),
    .B(_049_),
    .Y(_018_));
 sky130_fd_sc_hd__o32a_1 _097_ (.A1(net26),
    .A2(_036_),
    .A3(_018_),
    .B1(_017_),
    .B2(net34),
    .X(_010_));
 sky130_fd_sc_hd__a21oi_1 _098_ (.A1(\cnt_por[4] ),
    .A2(_049_),
    .B1(\cnt_por[5] ),
    .Y(_019_));
 sky130_fd_sc_hd__and2_1 _099_ (.A(_034_),
    .B(_049_),
    .X(_020_));
 sky130_fd_sc_hd__or2_1 _100_ (.A(_019_),
    .B(_020_),
    .X(_021_));
 sky130_fd_sc_hd__o2bb2a_1 _101_ (.A1_N(_043_),
    .A2_N(_021_),
    .B1(net37),
    .B2(net20),
    .X(_011_));
 sky130_fd_sc_hd__xor2_1 _102_ (.A(\cnt_por[6] ),
    .B(_020_),
    .X(_022_));
 sky130_fd_sc_hd__a22o_1 _103_ (.A1(\cnt_por[6] ),
    .A2(_036_),
    .B1(_043_),
    .B2(_022_),
    .X(_012_));
 sky130_fd_sc_hd__and4_1 _104_ (.A(\cnt_por[6] ),
    .B(net23),
    .C(net22),
    .D(_020_),
    .X(_023_));
 sky130_fd_sc_hd__a41o_1 _105_ (.A1(\cnt_por[7] ),
    .A2(\cnt_por[6] ),
    .A3(_034_),
    .A4(_049_),
    .B1(net26),
    .X(_024_));
 sky130_fd_sc_hd__and3_1 _106_ (.A(net23),
    .B(net22),
    .C(_024_),
    .X(_025_));
 sky130_fd_sc_hd__o21ba_1 _107_ (.A1(net39),
    .A2(_023_),
    .B1_N(_025_),
    .X(_013_));
 sky130_fd_sc_hd__xor2_1 _108_ (.A(net32),
    .B(_025_),
    .X(_014_));
 sky130_fd_sc_hd__and4_1 _109_ (.A(net23),
    .B(_033_),
    .C(net22),
    .D(_024_),
    .X(_026_));
 sky130_fd_sc_hd__a41o_1 _110_ (.A1(\cnt_por[8] ),
    .A2(net23),
    .A3(net22),
    .A4(_024_),
    .B1(net42),
    .X(_027_));
 sky130_fd_sc_hd__and2b_1 _111_ (.A_N(_026_),
    .B(_027_),
    .X(_015_));
 sky130_fd_sc_hd__xor2_1 _112_ (.A(net31),
    .B(_026_),
    .X(_016_));
 sky130_fd_sc_hd__dfrtp_1 _113_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_000_),
    .RESET_B(net24),
    .Q(\cnt_st[0] ));
 sky130_fd_sc_hd__dfrtp_1 _114_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(net36),
    .RESET_B(net24),
    .Q(\cnt_st[1] ));
 sky130_fd_sc_hd__dfrtp_1 _115_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_002_),
    .RESET_B(net25),
    .Q(\cnt_st[2] ));
 sky130_fd_sc_hd__dfrtp_1 _116_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(_003_),
    .RESET_B(net25),
    .Q(\cnt_st[3] ));
 sky130_fd_sc_hd__dfrtp_1 _117_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(_004_),
    .RESET_B(net25),
    .Q(\cnt_st[4] ));
 sky130_fd_sc_hd__dfrtp_1 _118_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(_005_),
    .RESET_B(net25),
    .Q(\cnt_st[5] ));
 sky130_fd_sc_hd__dfrtp_1 _119_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(_006_),
    .RESET_B(net24),
    .Q(\cnt_por[0] ));
 sky130_fd_sc_hd__dfrtp_1 _120_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(_007_),
    .RESET_B(net25),
    .Q(\cnt_por[1] ));
 sky130_fd_sc_hd__dfrtp_1 _121_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(_008_),
    .RESET_B(net25),
    .Q(\cnt_por[2] ));
 sky130_fd_sc_hd__dfrtp_1 _122_ (.CLK(clknet_1_1__leaf_osc_ck),
    .D(_009_),
    .RESET_B(net25),
    .Q(\cnt_por[3] ));
 sky130_fd_sc_hd__dfrtp_1 _123_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_010_),
    .RESET_B(net24),
    .Q(\cnt_por[4] ));
 sky130_fd_sc_hd__dfrtp_1 _124_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_011_),
    .RESET_B(net24),
    .Q(\cnt_por[5] ));
 sky130_fd_sc_hd__dfrtp_1 _125_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_012_),
    .RESET_B(net24),
    .Q(\cnt_por[6] ));
 sky130_fd_sc_hd__dfrtp_1 _126_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_013_),
    .RESET_B(net24),
    .Q(\cnt_por[7] ));
 sky130_fd_sc_hd__dfrtp_1 _127_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_014_),
    .RESET_B(net24),
    .Q(\cnt_por[8] ));
 sky130_fd_sc_hd__dfrtp_1 _128_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_015_),
    .RESET_B(net24),
    .Q(\cnt_por[9] ));
 sky130_fd_sc_hd__dfrtp_1 _129_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(_016_),
    .RESET_B(net24),
    .Q(\cnt_por[10] ));
 sky130_fd_sc_hd__dfrtp_1 _130_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(net27),
    .RESET_B(net8),
    .Q(cnt_rsb_stg1));
 sky130_fd_sc_hd__dfrtp_1 _131_ (.CLK(clknet_1_0__leaf_osc_ck),
    .D(net29),
    .RESET_B(net8),
    .Q(cnt_rsb));
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
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Right_16 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_17 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_18 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_19 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_20 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_21 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_22 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_23 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_24 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_25 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_26 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Left_27 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Left_28 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Left_29 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Left_30 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Left_31 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Left_32 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Left_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_58 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_59 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_60 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_61 ();
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(force_dis_rc_osc),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input2 (.A(force_ena_rc_osc),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_1 input3 (.A(force_pdn),
    .X(net3));
 sky130_fd_sc_hd__buf_1 input4 (.A(force_short_oneshot),
    .X(net4));
 sky130_fd_sc_hd__dlymetal6s2s_1 input5 (.A(otrip[0]),
    .X(net5));
 sky130_fd_sc_hd__dlymetal6s2s_1 input6 (.A(otrip[1]),
    .X(net6));
 sky130_fd_sc_hd__dlymetal6s2s_1 input7 (.A(otrip[2]),
    .X(net7));
 sky130_fd_sc_hd__buf_1 input8 (.A(pwup_filt),
    .X(net8));
 sky130_fd_sc_hd__buf_2 output9 (.A(net9),
    .X(force_pdnb));
 sky130_fd_sc_hd__buf_2 output10 (.A(net10),
    .X(osc_ena));
 sky130_fd_sc_hd__buf_2 output11 (.A(net11),
    .X(otrip_decoded[0]));
 sky130_fd_sc_hd__buf_2 output12 (.A(net12),
    .X(otrip_decoded[1]));
 sky130_fd_sc_hd__buf_2 output13 (.A(net13),
    .X(otrip_decoded[2]));
 sky130_fd_sc_hd__buf_2 output14 (.A(net14),
    .X(otrip_decoded[3]));
 sky130_fd_sc_hd__buf_2 output15 (.A(net15),
    .X(otrip_decoded[4]));
 sky130_fd_sc_hd__buf_2 output16 (.A(net16),
    .X(otrip_decoded[5]));
 sky130_fd_sc_hd__buf_2 output17 (.A(net17),
    .X(otrip_decoded[6]));
 sky130_fd_sc_hd__buf_2 output18 (.A(net18),
    .X(otrip_decoded[7]));
 sky130_fd_sc_hd__buf_2 output19 (.A(net19),
    .X(por_timed_out));
 sky130_fd_sc_hd__buf_2 output20 (.A(net20),
    .X(por_unbuf));
 sky130_fd_sc_hd__buf_2 output21 (.A(net23),
    .X(startup_timed_out));
 sky130_fd_sc_hd__buf_2 fanout22 (.A(_035_),
    .X(net22));
 sky130_fd_sc_hd__buf_2 fanout23 (.A(net21),
    .X(net23));
 sky130_fd_sc_hd__clkbuf_4 fanout24 (.A(net28),
    .X(net24));
 sky130_fd_sc_hd__buf_2 fanout25 (.A(net28),
    .X(net25));
 sky130_fd_sc_hd__clkbuf_2 fanout26 (.A(net4),
    .X(net26));
 sky130_fd_sc_hd__conb_1 _130__27 (.HI(net27));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_0__f_osc_ck (.A(clknet_0_osc_ck),
    .X(clknet_1_0__leaf_osc_ck));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_1__f_osc_ck (.A(clknet_0_osc_ck),
    .X(clknet_1_1__leaf_osc_ck));
 sky130_fd_sc_hd__dlygate4sd3_1 hold1 (.A(cnt_rsb),
    .X(net28));
 sky130_fd_sc_hd__dlygate4sd3_1 hold2 (.A(cnt_rsb_stg1),
    .X(net29));
 sky130_fd_sc_hd__dlygate4sd3_1 hold3 (.A(\cnt_st[5] ),
    .X(net30));
 sky130_fd_sc_hd__dlygate4sd3_1 hold4 (.A(\cnt_por[10] ),
    .X(net31));
 sky130_fd_sc_hd__dlygate4sd3_1 hold5 (.A(\cnt_por[8] ),
    .X(net32));
 sky130_fd_sc_hd__dlygate4sd3_1 hold6 (.A(\cnt_por[3] ),
    .X(net33));
 sky130_fd_sc_hd__dlygate4sd3_1 hold7 (.A(\cnt_por[4] ),
    .X(net34));
 sky130_fd_sc_hd__dlygate4sd3_1 hold8 (.A(\cnt_st[1] ),
    .X(net35));
 sky130_fd_sc_hd__dlygate4sd3_1 hold9 (.A(_001_),
    .X(net36));
 sky130_fd_sc_hd__dlygate4sd3_1 hold10 (.A(\cnt_por[5] ),
    .X(net37));
 sky130_fd_sc_hd__dlygate4sd3_1 hold11 (.A(\cnt_por[1] ),
    .X(net38));
 sky130_fd_sc_hd__dlygate4sd3_1 hold12 (.A(\cnt_por[7] ),
    .X(net39));
 sky130_fd_sc_hd__dlygate4sd3_1 hold13 (.A(\cnt_por[2] ),
    .X(net40));
 sky130_fd_sc_hd__dlygate4sd3_1 hold14 (.A(\cnt_st[2] ),
    .X(net41));
 sky130_fd_sc_hd__dlygate4sd3_1 hold15 (.A(\cnt_por[9] ),
    .X(net42));
endmodule
