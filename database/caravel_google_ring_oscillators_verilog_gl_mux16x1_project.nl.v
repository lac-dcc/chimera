// This program was cloned from: https://github.com/lrburle/caravel_google_ring_oscillators
// License: Apache License 2.0

// This is the unpowered netlist.
module mux16x1_project (y,
    data_in,
    select);
 output y;
 input [15:0] data_in;
 input [3:0] select;

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
 wire net1;
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
 wire net2;
 wire net20;
 wire net21;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;

 sky130_fd_sc_hd__decap_6 FILLER_0_0_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_9 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_10 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_10_22 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_10_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_20 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_32 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_44 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_69 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_12_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_12_26 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_6 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_12_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_21 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_33 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_13_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_13_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_9 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_14_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_14_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_18 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_30 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_42 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_6 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_16_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_16_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_16_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_16_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_16_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_21 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_33 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_17_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_17_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_17_6 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_18_11 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_16 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_18_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_18_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_19_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_1_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_69 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_20_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_20_26 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_6 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_20_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_21_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_21_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_69 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_22_12 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_22_22 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_53 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_22_6 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_22_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_24 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_36 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_23_48 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_69 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_24_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_24_26 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_24_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_24_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_24_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_24_6 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_24_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_24_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_24 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_36 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_25_48 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_26_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_26_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_18 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_30 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_42 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_27_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_6 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_28_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_28_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_29_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_29_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29_69 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_2_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_26 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_6 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_77 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_30_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_30_26 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_30_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_30_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_30_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_30_6 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_30_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_30_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_31_13 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_31_25 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_31_33 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_31_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_31_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_31_61 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_31_73 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_31_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_3_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_69 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_4_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_26 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_6 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_12 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_24 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_36 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_5_48 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_10 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_6_22 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_53 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_6 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_6_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_30 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_42 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_14 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_26 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_29 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_18 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_30 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_42 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_6 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_69 ();
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__decap_3 PHY_24 ();
 sky130_fd_sc_hd__decap_3 PHY_25 ();
 sky130_fd_sc_hd__decap_3 PHY_26 ();
 sky130_fd_sc_hd__decap_3 PHY_27 ();
 sky130_fd_sc_hd__decap_3 PHY_28 ();
 sky130_fd_sc_hd__decap_3 PHY_29 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_30 ();
 sky130_fd_sc_hd__decap_3 PHY_31 ();
 sky130_fd_sc_hd__decap_3 PHY_32 ();
 sky130_fd_sc_hd__decap_3 PHY_33 ();
 sky130_fd_sc_hd__decap_3 PHY_34 ();
 sky130_fd_sc_hd__decap_3 PHY_35 ();
 sky130_fd_sc_hd__decap_3 PHY_36 ();
 sky130_fd_sc_hd__decap_3 PHY_37 ();
 sky130_fd_sc_hd__decap_3 PHY_38 ();
 sky130_fd_sc_hd__decap_3 PHY_39 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_40 ();
 sky130_fd_sc_hd__decap_3 PHY_41 ();
 sky130_fd_sc_hd__decap_3 PHY_42 ();
 sky130_fd_sc_hd__decap_3 PHY_43 ();
 sky130_fd_sc_hd__decap_3 PHY_44 ();
 sky130_fd_sc_hd__decap_3 PHY_45 ();
 sky130_fd_sc_hd__decap_3 PHY_46 ();
 sky130_fd_sc_hd__decap_3 PHY_47 ();
 sky130_fd_sc_hd__decap_3 PHY_48 ();
 sky130_fd_sc_hd__decap_3 PHY_49 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_50 ();
 sky130_fd_sc_hd__decap_3 PHY_51 ();
 sky130_fd_sc_hd__decap_3 PHY_52 ();
 sky130_fd_sc_hd__decap_3 PHY_53 ();
 sky130_fd_sc_hd__decap_3 PHY_54 ();
 sky130_fd_sc_hd__decap_3 PHY_55 ();
 sky130_fd_sc_hd__decap_3 PHY_56 ();
 sky130_fd_sc_hd__decap_3 PHY_57 ();
 sky130_fd_sc_hd__decap_3 PHY_58 ();
 sky130_fd_sc_hd__decap_3 PHY_59 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_60 ();
 sky130_fd_sc_hd__decap_3 PHY_61 ();
 sky130_fd_sc_hd__decap_3 PHY_62 ();
 sky130_fd_sc_hd__decap_3 PHY_63 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_64 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_65 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_66 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_67 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_68 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_69 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_70 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_71 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_72 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_73 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_74 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_75 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_76 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_77 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_78 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_79 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_80 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_81 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_82 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_83 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_84 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_85 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_86 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_87 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_88 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_89 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_90 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_91 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_92 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_93 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_94 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_95 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_96 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_97 ();
 sky130_fd_sc_hd__mux2_1 _13_ (.A0(net16),
    .A1(net3),
    .S(net18),
    .X(_00_));
 sky130_fd_sc_hd__and3b_1 _14_ (.A_N(net17),
    .B(net18),
    .C(net2),
    .X(_01_));
 sky130_fd_sc_hd__nor3b_1 _15_ (.A(net17),
    .B(net18),
    .C_N(net15),
    .Y(_02_));
 sky130_fd_sc_hd__a2111oi_1 _16_ (.A1(net17),
    .A2(_00_),
    .B1(_01_),
    .C1(_02_),
    .D1(net19),
    .Y(_03_));
 sky130_fd_sc_hd__mux2_1 _17_ (.A0(net5),
    .A1(net7),
    .S(net18),
    .X(_04_));
 sky130_fd_sc_hd__nand2_1 _18_ (.A(net17),
    .B(_04_),
    .Y(_05_));
 sky130_fd_sc_hd__nand3b_1 _19_ (.A_N(net17),
    .B(net18),
    .C(net6),
    .Y(_06_));
 sky130_fd_sc_hd__or3b_1 _20_ (.A(net17),
    .B(net18),
    .C_N(net4),
    .X(_07_));
 sky130_fd_sc_hd__a41o_1 _21_ (.A1(net19),
    .A2(_05_),
    .A3(_06_),
    .A4(_07_),
    .B1(_03_),
    .X(_08_));
 sky130_fd_sc_hd__mux4_1 _22_ (.A0(net8),
    .A1(net10),
    .A2(net12),
    .A3(net14),
    .S0(net18),
    .S1(net19),
    .X(_09_));
 sky130_fd_sc_hd__mux4_1 _23_ (.A0(net1),
    .A1(net9),
    .A2(net11),
    .A3(net13),
    .S0(net18),
    .S1(net19),
    .X(_10_));
 sky130_fd_sc_hd__mux2_1 _24_ (.A0(_10_),
    .A1(_09_),
    .S(net17),
    .X(_11_));
 sky130_fd_sc_hd__nor2_1 _25_ (.A(net20),
    .B(_11_),
    .Y(_12_));
 sky130_fd_sc_hd__a21oi_2 _26_ (.A1(net20),
    .A2(_08_),
    .B1(_12_),
    .Y(net21));
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(data_in[0]),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input10 (.A(data_in[3]),
    .X(net10));
 sky130_fd_sc_hd__clkbuf_1 input11 (.A(data_in[4]),
    .X(net11));
 sky130_fd_sc_hd__clkbuf_1 input12 (.A(data_in[5]),
    .X(net12));
 sky130_fd_sc_hd__clkbuf_1 input13 (.A(data_in[6]),
    .X(net13));
 sky130_fd_sc_hd__clkbuf_1 input14 (.A(data_in[7]),
    .X(net14));
 sky130_fd_sc_hd__clkbuf_1 input15 (.A(data_in[8]),
    .X(net15));
 sky130_fd_sc_hd__clkbuf_1 input16 (.A(data_in[9]),
    .X(net16));
 sky130_fd_sc_hd__clkbuf_2 input17 (.A(select[0]),
    .X(net17));
 sky130_fd_sc_hd__buf_2 input18 (.A(select[1]),
    .X(net18));
 sky130_fd_sc_hd__clkbuf_2 input19 (.A(select[2]),
    .X(net19));
 sky130_fd_sc_hd__clkbuf_1 input2 (.A(data_in[10]),
    .X(net2));
 sky130_fd_sc_hd__buf_1 input20 (.A(select[3]),
    .X(net20));
 sky130_fd_sc_hd__clkbuf_1 input3 (.A(data_in[11]),
    .X(net3));
 sky130_fd_sc_hd__clkbuf_1 input4 (.A(data_in[12]),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_1 input5 (.A(data_in[13]),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_1 input6 (.A(data_in[14]),
    .X(net6));
 sky130_fd_sc_hd__clkbuf_1 input7 (.A(data_in[15]),
    .X(net7));
 sky130_fd_sc_hd__clkbuf_1 input8 (.A(data_in[1]),
    .X(net8));
 sky130_fd_sc_hd__clkbuf_1 input9 (.A(data_in[2]),
    .X(net9));
 sky130_fd_sc_hd__buf_12 output21 (.A(net21),
    .X(y));
endmodule

