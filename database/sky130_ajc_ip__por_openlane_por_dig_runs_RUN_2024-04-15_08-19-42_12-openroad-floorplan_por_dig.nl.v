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
 wire one_;

 sky130_fd_sc_hd__inv_2 _050_ (.A(force_pdn),
    .Y(force_pdnb));
 sky130_fd_sc_hd__inv_2 _051_ (.A(force_dis_rc_osc),
    .Y(_028_));
 sky130_fd_sc_hd__and4bb_2 _052_ (.A_N(\cnt_st[3] ),
    .B_N(\cnt_st[4] ),
    .C(\cnt_st[5] ),
    .D(\cnt_st[2] ),
    .X(_029_));
 sky130_fd_sc_hd__and3b_2 _053_ (.A_N(\cnt_st[1] ),
    .B(_029_),
    .C(\cnt_st[0] ),
    .X(startup_timed_out));
 sky130_fd_sc_hd__inv_2 _054_ (.A(startup_timed_out),
    .Y(_030_));
 sky130_fd_sc_hd__or3b_2 _055_ (.A(\cnt_por[7] ),
    .B(\cnt_por[6] ),
    .C_N(\cnt_por[10] ),
    .X(_031_));
 sky130_fd_sc_hd__or4b_2 _056_ (.A(\cnt_por[0] ),
    .B(\cnt_por[3] ),
    .C(\cnt_por[2] ),
    .D_N(\cnt_por[1] ),
    .X(_032_));
 sky130_fd_sc_hd__and2_2 _057_ (.A(\cnt_por[9] ),
    .B(\cnt_por[8] ),
    .X(_033_));
 sky130_fd_sc_hd__and2_2 _058_ (.A(\cnt_por[5] ),
    .B(\cnt_por[4] ),
    .X(_034_));
 sky130_fd_sc_hd__or4bb_2 _059_ (.A(_031_),
    .B(_032_),
    .C_N(_033_),
    .D_N(_034_),
    .X(_035_));
 sky130_fd_sc_hd__inv_2 _060_ (.A(_035_),
    .Y(por_timed_out));
 sky130_fd_sc_hd__nor3_2 _061_ (.A(otrip[2]),
    .B(otrip[1]),
    .C(otrip[0]),
    .Y(otrip_decoded[0]));
 sky130_fd_sc_hd__nor3b_2 _062_ (.A(otrip[2]),
    .B(otrip[1]),
    .C_N(otrip[0]),
    .Y(otrip_decoded[1]));
 sky130_fd_sc_hd__nor3b_2 _063_ (.A(otrip[2]),
    .B(otrip[0]),
    .C_N(otrip[1]),
    .Y(otrip_decoded[2]));
 sky130_fd_sc_hd__and3b_2 _064_ (.A_N(otrip[2]),
    .B(otrip[1]),
    .C(otrip[0]),
    .X(otrip_decoded[3]));
 sky130_fd_sc_hd__nor3b_2 _065_ (.A(otrip[1]),
    .B(otrip[0]),
    .C_N(otrip[2]),
    .Y(otrip_decoded[4]));
 sky130_fd_sc_hd__and3b_2 _066_ (.A_N(otrip[1]),
    .B(otrip[0]),
    .C(otrip[2]),
    .X(otrip_decoded[5]));
 sky130_fd_sc_hd__and3b_2 _067_ (.A_N(otrip[0]),
    .B(otrip[1]),
    .C(otrip[2]),
    .X(otrip_decoded[6]));
 sky130_fd_sc_hd__and3_2 _068_ (.A(otrip[2]),
    .B(otrip[1]),
    .C(otrip[0]),
    .X(otrip_decoded[7]));
 sky130_fd_sc_hd__a31o_2 _069_ (.A1(pwup_filt),
    .A2(_028_),
    .A3(_035_),
    .B1(force_ena_rc_osc),
    .X(osc_ena));
 sky130_fd_sc_hd__nand2_2 _070_ (.A(startup_timed_out),
    .B(_035_),
    .Y(_036_));
 sky130_fd_sc_hd__inv_2 _071_ (.A(_036_),
    .Y(por_unbuf));
 sky130_fd_sc_hd__or3b_2 _072_ (.A(force_short_oneshot),
    .B(startup_timed_out),
    .C_N(\cnt_st[0] ),
    .X(_000_));
 sky130_fd_sc_hd__o21bai_2 _073_ (.A1(\cnt_st[0] ),
    .A2(\cnt_st[1] ),
    .B1_N(force_short_oneshot),
    .Y(_037_));
 sky130_fd_sc_hd__a211oi_2 _074_ (.A1(\cnt_st[0] ),
    .A2(\cnt_st[1] ),
    .B1(startup_timed_out),
    .C1(_037_),
    .Y(_001_));
 sky130_fd_sc_hd__a21oi_2 _075_ (.A1(\cnt_st[0] ),
    .A2(\cnt_st[1] ),
    .B1(\cnt_st[2] ),
    .Y(_038_));
 sky130_fd_sc_hd__and3_2 _076_ (.A(\cnt_st[0] ),
    .B(\cnt_st[1] ),
    .C(\cnt_st[2] ),
    .X(_039_));
 sky130_fd_sc_hd__o21bai_2 _077_ (.A1(_038_),
    .A2(_039_),
    .B1_N(force_short_oneshot),
    .Y(_002_));
 sky130_fd_sc_hd__o21ai_2 _078_ (.A1(force_short_oneshot),
    .A2(_039_),
    .B1(\cnt_st[3] ),
    .Y(_040_));
 sky130_fd_sc_hd__o311a_2 _079_ (.A1(\cnt_st[3] ),
    .A2(force_short_oneshot),
    .A3(_039_),
    .B1(_040_),
    .C1(_030_),
    .X(_003_));
 sky130_fd_sc_hd__o211a_2 _080_ (.A1(force_short_oneshot),
    .A2(_039_),
    .B1(\cnt_st[3] ),
    .C1(\cnt_st[4] ),
    .X(_041_));
 sky130_fd_sc_hd__and2b_2 _081_ (.A_N(\cnt_st[4] ),
    .B(_040_),
    .X(_042_));
 sky130_fd_sc_hd__nor2_2 _082_ (.A(_041_),
    .B(_042_),
    .Y(_004_));
 sky130_fd_sc_hd__xor2_2 _083_ (.A(\cnt_st[5] ),
    .B(_041_),
    .X(_005_));
 sky130_fd_sc_hd__and3b_2 _084_ (.A_N(force_short_oneshot),
    .B(startup_timed_out),
    .C(_035_),
    .X(_043_));
 sky130_fd_sc_hd__mux2_1 _085_ (.A0(_043_),
    .A1(_036_),
    .S(\cnt_por[0] ),
    .X(_006_));
 sky130_fd_sc_hd__o211a_2 _086_ (.A1(\cnt_por[0] ),
    .A2(force_short_oneshot),
    .B1(startup_timed_out),
    .C1(_035_),
    .X(_044_));
 sky130_fd_sc_hd__and2_2 _087_ (.A(\cnt_por[1] ),
    .B(\cnt_por[0] ),
    .X(_045_));
 sky130_fd_sc_hd__o2bb2a_2 _088_ (.A1_N(_043_),
    .A2_N(_045_),
    .B1(_044_),
    .B2(\cnt_por[1] ),
    .X(_007_));
 sky130_fd_sc_hd__or2_2 _089_ (.A(\cnt_por[2] ),
    .B(_045_),
    .X(_046_));
 sky130_fd_sc_hd__nand2_2 _090_ (.A(\cnt_por[2] ),
    .B(_045_),
    .Y(_047_));
 sky130_fd_sc_hd__a32o_2 _091_ (.A1(_043_),
    .A2(_046_),
    .A3(_047_),
    .B1(_036_),
    .B2(\cnt_por[2] ),
    .X(_008_));
 sky130_fd_sc_hd__and4_2 _092_ (.A(\cnt_por[2] ),
    .B(startup_timed_out),
    .C(_035_),
    .D(_045_),
    .X(_048_));
 sky130_fd_sc_hd__and4_2 _093_ (.A(\cnt_por[1] ),
    .B(\cnt_por[0] ),
    .C(\cnt_por[3] ),
    .D(\cnt_por[2] ),
    .X(_049_));
 sky130_fd_sc_hd__o211a_2 _094_ (.A1(force_short_oneshot),
    .A2(_049_),
    .B1(_035_),
    .C1(startup_timed_out),
    .X(_017_));
 sky130_fd_sc_hd__o21ba_2 _095_ (.A1(\cnt_por[3] ),
    .A2(_048_),
    .B1_N(_017_),
    .X(_009_));
 sky130_fd_sc_hd__nand2_2 _096_ (.A(\cnt_por[4] ),
    .B(_049_),
    .Y(_018_));
 sky130_fd_sc_hd__o32a_2 _097_ (.A1(force_short_oneshot),
    .A2(_036_),
    .A3(_018_),
    .B1(_017_),
    .B2(\cnt_por[4] ),
    .X(_010_));
 sky130_fd_sc_hd__a21oi_2 _098_ (.A1(\cnt_por[4] ),
    .A2(_049_),
    .B1(\cnt_por[5] ),
    .Y(_019_));
 sky130_fd_sc_hd__and2_2 _099_ (.A(_034_),
    .B(_049_),
    .X(_020_));
 sky130_fd_sc_hd__or2_2 _100_ (.A(_019_),
    .B(_020_),
    .X(_021_));
 sky130_fd_sc_hd__o2bb2a_2 _101_ (.A1_N(_043_),
    .A2_N(_021_),
    .B1(\cnt_por[5] ),
    .B2(por_unbuf),
    .X(_011_));
 sky130_fd_sc_hd__xor2_2 _102_ (.A(\cnt_por[6] ),
    .B(_020_),
    .X(_022_));
 sky130_fd_sc_hd__a22o_2 _103_ (.A1(\cnt_por[6] ),
    .A2(_036_),
    .B1(_043_),
    .B2(_022_),
    .X(_012_));
 sky130_fd_sc_hd__and4_2 _104_ (.A(\cnt_por[6] ),
    .B(startup_timed_out),
    .C(_035_),
    .D(_020_),
    .X(_023_));
 sky130_fd_sc_hd__a41o_2 _105_ (.A1(\cnt_por[7] ),
    .A2(\cnt_por[6] ),
    .A3(_034_),
    .A4(_049_),
    .B1(force_short_oneshot),
    .X(_024_));
 sky130_fd_sc_hd__and3_2 _106_ (.A(startup_timed_out),
    .B(_035_),
    .C(_024_),
    .X(_025_));
 sky130_fd_sc_hd__o21ba_2 _107_ (.A1(\cnt_por[7] ),
    .A2(_023_),
    .B1_N(_025_),
    .X(_013_));
 sky130_fd_sc_hd__xor2_2 _108_ (.A(\cnt_por[8] ),
    .B(_025_),
    .X(_014_));
 sky130_fd_sc_hd__and4_2 _109_ (.A(startup_timed_out),
    .B(_033_),
    .C(_035_),
    .D(_024_),
    .X(_026_));
 sky130_fd_sc_hd__a41o_2 _110_ (.A1(\cnt_por[8] ),
    .A2(startup_timed_out),
    .A3(_035_),
    .A4(_024_),
    .B1(\cnt_por[9] ),
    .X(_027_));
 sky130_fd_sc_hd__and2b_2 _111_ (.A_N(_026_),
    .B(_027_),
    .X(_015_));
 sky130_fd_sc_hd__xor2_2 _112_ (.A(\cnt_por[10] ),
    .B(_026_),
    .X(_016_));
 sky130_fd_sc_hd__dfrtp_2 _113_ (.CLK(osc_ck),
    .D(_000_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_st[0] ));
 sky130_fd_sc_hd__dfrtp_2 _114_ (.CLK(osc_ck),
    .D(_001_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_st[1] ));
 sky130_fd_sc_hd__dfrtp_2 _115_ (.CLK(osc_ck),
    .D(_002_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_st[2] ));
 sky130_fd_sc_hd__dfrtp_2 _116_ (.CLK(osc_ck),
    .D(_003_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_st[3] ));
 sky130_fd_sc_hd__dfrtp_2 _117_ (.CLK(osc_ck),
    .D(_004_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_st[4] ));
 sky130_fd_sc_hd__dfrtp_2 _118_ (.CLK(osc_ck),
    .D(_005_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_st[5] ));
 sky130_fd_sc_hd__dfrtp_2 _119_ (.CLK(osc_ck),
    .D(_006_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_por[0] ));
 sky130_fd_sc_hd__dfrtp_2 _120_ (.CLK(osc_ck),
    .D(_007_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_por[1] ));
 sky130_fd_sc_hd__dfrtp_2 _121_ (.CLK(osc_ck),
    .D(_008_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_por[2] ));
 sky130_fd_sc_hd__dfrtp_2 _122_ (.CLK(osc_ck),
    .D(_009_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_por[3] ));
 sky130_fd_sc_hd__dfrtp_2 _123_ (.CLK(osc_ck),
    .D(_010_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_por[4] ));
 sky130_fd_sc_hd__dfrtp_2 _124_ (.CLK(osc_ck),
    .D(_011_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_por[5] ));
 sky130_fd_sc_hd__dfrtp_2 _125_ (.CLK(osc_ck),
    .D(_012_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_por[6] ));
 sky130_fd_sc_hd__dfrtp_2 _126_ (.CLK(osc_ck),
    .D(_013_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_por[7] ));
 sky130_fd_sc_hd__dfrtp_2 _127_ (.CLK(osc_ck),
    .D(_014_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_por[8] ));
 sky130_fd_sc_hd__dfrtp_2 _128_ (.CLK(osc_ck),
    .D(_015_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_por[9] ));
 sky130_fd_sc_hd__dfrtp_2 _129_ (.CLK(osc_ck),
    .D(_016_),
    .RESET_B(cnt_rsb),
    .Q(\cnt_por[10] ));
 sky130_fd_sc_hd__dfrtp_2 _130_ (.CLK(osc_ck),
    .D(one_),
    .RESET_B(pwup_filt),
    .Q(cnt_rsb_stg1));
 sky130_fd_sc_hd__dfrtp_2 _131_ (.CLK(osc_ck),
    .D(cnt_rsb_stg1),
    .RESET_B(pwup_filt),
    .Q(cnt_rsb));
 sky130_fd_sc_hd__conb_1 TIE_ONE_one_ (.HI(one_));
endmodule
