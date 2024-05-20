// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__overvoltage
// License: Apache License 2.0

module overvoltage_dig (otrip,
    otrip_decoded,
    VPWR,
    VGND);
 input [3:0] otrip;
 output [15:0] otrip_decoded;
 inout VPWR;
 inout VGND;


 sky130_fd_sc_hd__nor4_2 _00_ (.A(otrip[3]),
    .B(otrip[0]),
    .C(otrip[1]),
    .D(otrip[2]),
    .Y(otrip_decoded[0]));
 sky130_fd_sc_hd__nor4b_2 _01_ (.A(otrip[3]),
    .B(otrip[1]),
    .C(otrip[2]),
    .D_N(otrip[0]),
    .Y(otrip_decoded[1]));
 sky130_fd_sc_hd__nor4b_2 _02_ (.A(otrip[3]),
    .B(otrip[0]),
    .C(otrip[2]),
    .D_N(otrip[1]),
    .Y(otrip_decoded[2]));
 sky130_fd_sc_hd__and4bb_2 _03_ (.A_N(otrip[3]),
    .B_N(otrip[2]),
    .C(otrip[1]),
    .D(otrip[0]),
    .X(otrip_decoded[3]));
 sky130_fd_sc_hd__nor4b_2 _04_ (.A(otrip[3]),
    .B(otrip[0]),
    .C(otrip[1]),
    .D_N(otrip[2]),
    .Y(otrip_decoded[4]));
 sky130_fd_sc_hd__and4bb_2 _05_ (.A_N(otrip[3]),
    .B_N(otrip[1]),
    .C(otrip[2]),
    .D(otrip[0]),
    .X(otrip_decoded[5]));
 sky130_fd_sc_hd__and4bb_2 _06_ (.A_N(otrip[3]),
    .B_N(otrip[0]),
    .C(otrip[1]),
    .D(otrip[2]),
    .X(otrip_decoded[6]));
 sky130_fd_sc_hd__and4b_2 _07_ (.A_N(otrip[3]),
    .B(otrip[0]),
    .C(otrip[1]),
    .D(otrip[2]),
    .X(otrip_decoded[7]));
 sky130_fd_sc_hd__nor4b_2 _08_ (.A(otrip[0]),
    .B(otrip[1]),
    .C(otrip[2]),
    .D_N(otrip[3]),
    .Y(otrip_decoded[8]));
 sky130_fd_sc_hd__and4bb_2 _09_ (.A_N(otrip[1]),
    .B_N(otrip[2]),
    .C(otrip[3]),
    .D(otrip[0]),
    .X(otrip_decoded[9]));
 sky130_fd_sc_hd__and4bb_2 _10_ (.A_N(otrip[0]),
    .B_N(otrip[2]),
    .C(otrip[1]),
    .D(otrip[3]),
    .X(otrip_decoded[10]));
 sky130_fd_sc_hd__and4b_2 _11_ (.A_N(otrip[2]),
    .B(otrip[1]),
    .C(otrip[0]),
    .D(otrip[3]),
    .X(otrip_decoded[11]));
 sky130_fd_sc_hd__and4bb_2 _12_ (.A_N(otrip[0]),
    .B_N(otrip[1]),
    .C(otrip[2]),
    .D(otrip[3]),
    .X(otrip_decoded[12]));
 sky130_fd_sc_hd__and4b_2 _13_ (.A_N(otrip[1]),
    .B(otrip[2]),
    .C(otrip[3]),
    .D(otrip[0]),
    .X(otrip_decoded[13]));
 sky130_fd_sc_hd__and4b_2 _14_ (.A_N(otrip[0]),
    .B(otrip[1]),
    .C(otrip[2]),
    .D(otrip[3]),
    .X(otrip_decoded[14]));
 sky130_fd_sc_hd__and4_2 _15_ (.A(otrip[3]),
    .B(otrip[0]),
    .C(otrip[1]),
    .D(otrip[2]),
    .X(otrip_decoded[15]));
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
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_14 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_15 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_16 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_17 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_18 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_19 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_20 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_21 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_22 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_23 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Left_24 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Left_25 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Left_26 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Left_27 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_28 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_30 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_31 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_51 ();
endmodule
