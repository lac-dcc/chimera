`timescale 1 ns/100 ps
// Version: v11.8 11.8.0.26
// File used only for Simulation


module PLLBA(
       CLKA,
       EXTFB,
       POWERDOWN,
       GLA,
       LOCK,
       GLB,
       YB,
       GLC,
       YC,
       OADIV0,
       OADIV1,
       OADIV2,
       OADIV3,
       OADIV4,
       OAMUX0,
       OAMUX1,
       OAMUX2,
       DLYGLA0,
       DLYGLA1,
       DLYGLA2,
       DLYGLA3,
       DLYGLA4,
       OBDIV0,
       OBDIV1,
       OBDIV2,
       OBDIV3,
       OBDIV4,
       OBMUX0,
       OBMUX1,
       OBMUX2,
       DLYYB0,
       DLYYB1,
       DLYYB2,
       DLYYB3,
       DLYYB4,
       DLYGLB0,
       DLYGLB1,
       DLYGLB2,
       DLYGLB3,
       DLYGLB4,
       OCDIV0,
       OCDIV1,
       OCDIV2,
       OCDIV3,
       OCDIV4,
       OCMUX0,
       OCMUX1,
       OCMUX2,
       DLYYC0,
       DLYYC1,
       DLYYC2,
       DLYYC3,
       DLYYC4,
       DLYGLC0,
       DLYGLC1,
       DLYGLC2,
       DLYGLC3,
       DLYGLC4,
       FINDIV0,
       FINDIV1,
       FINDIV2,
       FINDIV3,
       FINDIV4,
       FINDIV5,
       FINDIV6,
       FBDIV0,
       FBDIV1,
       FBDIV2,
       FBDIV3,
       FBDIV4,
       FBDIV5,
       FBDIV6,
       FBDLY0,
       FBDLY1,
       FBDLY2,
       FBDLY3,
       FBDLY4,
       FBSEL0,
       FBSEL1,
       XDLYSEL,
       VCOSEL0,
       VCOSEL1,
       VCOSEL2
    );
input  CLKA;
input  EXTFB;
input  POWERDOWN;
output GLA;
output LOCK;
output GLB;
output YB;
output GLC;
output YC;
input  OADIV0;
input  OADIV1;
input  OADIV2;
input  OADIV3;
input  OADIV4;
input  OAMUX0;
input  OAMUX1;
input  OAMUX2;
input  DLYGLA0;
input  DLYGLA1;
input  DLYGLA2;
input  DLYGLA3;
input  DLYGLA4;
input  OBDIV0;
input  OBDIV1;
input  OBDIV2;
input  OBDIV3;
input  OBDIV4;
input  OBMUX0;
input  OBMUX1;
input  OBMUX2;
input  DLYYB0;
input  DLYYB1;
input  DLYYB2;
input  DLYYB3;
input  DLYYB4;
input  DLYGLB0;
input  DLYGLB1;
input  DLYGLB2;
input  DLYGLB3;
input  DLYGLB4;
input  OCDIV0;
input  OCDIV1;
input  OCDIV2;
input  OCDIV3;
input  OCDIV4;
input  OCMUX0;
input  OCMUX1;
input  OCMUX2;
input  DLYYC0;
input  DLYYC1;
input  DLYYC2;
input  DLYYC3;
input  DLYYC4;
input  DLYGLC0;
input  DLYGLC1;
input  DLYGLC2;
input  DLYGLC3;
input  DLYGLC4;
input  FINDIV0;
input  FINDIV1;
input  FINDIV2;
input  FINDIV3;
input  FINDIV4;
input  FINDIV5;
input  FINDIV6;
input  FBDIV0;
input  FBDIV1;
input  FBDIV2;
input  FBDIV3;
input  FBDIV4;
input  FBDIV5;
input  FBDIV6;
input  FBDLY0;
input  FBDLY1;
input  FBDLY2;
input  FBDLY3;
input  FBDLY4;
input  FBSEL0;
input  FBSEL1;
input  XDLYSEL;
input  VCOSEL0;
input  VCOSEL1;
input  VCOSEL2;

    wire GND, SDOUT, FB, EXTFBDLY, GLADLY, LOCKDLY, GLBDLY, YBDLY, 
        GLCDLY, YCDLY, VCODLY;
    wire GND_power_net1;
    assign GND = GND_power_net1;
    
    PLL_SDF #( .VCOFREQUENCY(100.000000) )  pll_sdf_0 (.CLKA(CLKA), 
        .EXTFB(EXTFBDLY), .POWERDOWN(POWERDOWN), .GLAOUT(GLADLY), 
        .LOCKOUT(LOCKDLY), .GLBOUT(GLBDLY), .YBOUT(YBDLY), .GLCOUT(
        GLCDLY), .YCOUT(YCDLY), .OADIV0(OADIV0), .OADIV1(OADIV1), 
        .OADIV2(OADIV2), .OADIV3(OADIV3), .OADIV4(OADIV4), .OAMUX0(
        OAMUX0), .OAMUX1(OAMUX1), .OAMUX2(OAMUX2), .DLYGLA0(DLYGLA0), 
        .DLYGLA1(DLYGLA1), .DLYGLA2(DLYGLA2), .DLYGLA3(DLYGLA3), 
        .DLYGLA4(DLYGLA4), .OBDIV0(OBDIV0), .OBDIV1(OBDIV1), .OBDIV2(
        OBDIV2), .OBDIV3(OBDIV3), .OBDIV4(OBDIV4), .OBMUX0(OBMUX0), 
        .OBMUX1(OBMUX1), .OBMUX2(OBMUX2), .DLYYB0(DLYYB0), .DLYYB1(
        DLYYB1), .DLYYB2(DLYYB2), .DLYYB3(DLYYB3), .DLYYB4(DLYYB4), 
        .DLYGLB0(DLYGLB0), .DLYGLB1(DLYGLB1), .DLYGLB2(DLYGLB2), 
        .DLYGLB3(DLYGLB3), .DLYGLB4(DLYGLB4), .OCDIV0(OCDIV0), .OCDIV1(
        OCDIV1), .OCDIV2(OCDIV2), .OCDIV3(OCDIV3), .OCDIV4(OCDIV4), 
        .OCMUX0(OCMUX0), .OCMUX1(OCMUX1), .OCMUX2(OCMUX2), .DLYYC0(
        DLYYC0), .DLYYC1(DLYYC1), .DLYYC2(DLYYC2), .DLYYC3(DLYYC3), 
        .DLYYC4(DLYYC4), .DLYGLC0(DLYGLC0), .DLYGLC1(DLYGLC1), 
        .DLYGLC2(DLYGLC2), .DLYGLC3(DLYGLC3), .DLYGLC4(DLYGLC4), 
        .FINDIV0(FINDIV0), .FINDIV1(FINDIV1), .FINDIV2(FINDIV2), 
        .FINDIV3(FINDIV3), .FINDIV4(FINDIV4), .FINDIV5(FINDIV5), 
        .FINDIV6(FINDIV6), .FBDIV0(FBDIV0), .FBDIV1(FBDIV1), .FBDIV2(
        FBDIV2), .FBDIV3(FBDIV3), .FBDIV4(FBDIV4), .FBDIV5(FBDIV5), 
        .FBDIV6(FBDIV6), .FBDLY0(FBDLY0), .FBDLY1(FBDLY1), .FBDLY2(
        FBDLY2), .FBDLY3(FBDLY3), .FBDLY4(FBDLY4), .FBSEL0(FBSEL0), 
        .FBSEL1(FBSEL1), .XDLYSEL(XDLYSEL), .VCOSEL0(VCOSEL0), 
        .VCOSEL1(VCOSEL1), .VCOSEL2(VCOSEL2), .INTFB(FB), .VCOOUT(
        VCODLY));
    PLL_DLY_SDF #( .VCOFREQUENCY(100.000000) )  pll_dly_sdf_0 (.GLA(
        GLA), .LOCK(LOCK), .GLB(GLB), .YB(YB), .GLC(GLC), .YC(YC), 
        .GLAIN(GLADLY), .LOCKIN(LOCKDLY), .GLBIN(GLBDLY), .YBIN(YBDLY), 
        .GLCIN(GLCDLY), .YCIN(YCDLY), .EXTFBOUT(EXTFBDLY), .EXTFBIN(
        EXTFB), .VCOIN(VCODLY), .PLLOUT(FB));
    GND GND_power_inst1 (.Y(GND_power_net1));
    
endmodule


module top(
       clock,
       input_data,
       reset,
       trigger_signal,
       RSS_EN,
       clock_out,
       output_data_rate,
       output_signal,
       ref_signal,
       signal_into_switch
    );
input  clock;
input  [9:0] input_data;
input  reset;
input  trigger_signal;
output RSS_EN;
output clock_out;
output output_data_rate;
output output_signal;
output ref_signal;
output signal_into_switch;

    wire AND2_0_Y, AND2_1_Y, AND2_2_Y, data_source_0_output_data, 
        whitening_0_output_whitening, GLA, clock_c, reset_c, 
        trigger_signal_c, clock_out_c, output_data_rate_c, 
        output_signal_c, ref_signal_c, signal_into_switch_c, 
        \dbpsk_modulator_0/counter_n5_i_0 , 
        \dbpsk_modulator_0/counter_n5_i_a3_0_0 , 
        \dbpsk_modulator_0/N_123 , \dbpsk_modulator_0/counter_n4_i_0 , 
        \dbpsk_modulator_0/N_105 , \dbpsk_modulator_0/counter_n1_i_1 , 
        \dbpsk_modulator_0/counter_i_0[1] , 
        \dbpsk_modulator_0/counter[0]_net_1 , 
        \dbpsk_modulator_0/counter[4]_net_1 , 
        \dbpsk_modulator_0/counter_n1_i_a3_0 , 
        \dbpsk_modulator_0/counter[5]_net_1 , 
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_8 , 
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_5 , 
        \dbpsk_modulator_0/counter[12]_net_1 , 
        \dbpsk_modulator_0/counter[10]_net_1 , 
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_7 , 
        \dbpsk_modulator_0/counter_i_0[6] , 
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_3 , 
        \dbpsk_modulator_0/counter[15]_net_1 , 
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_6 , 
        \dbpsk_modulator_0/counter_i_0[3] , 
        \dbpsk_modulator_0/counter_i_0[8] , 
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_1 , 
        \dbpsk_modulator_0/counter[13]_net_1 , 
        \dbpsk_modulator_0/counter[14]_net_1 , 
        \dbpsk_modulator_0/counter[9]_net_1 , 
        \dbpsk_modulator_0/counter[11]_net_1 , 
        \dbpsk_modulator_0/counter_i_0[2] , 
        \dbpsk_modulator_0/counter_i_0[7] , 
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a3_2 , 
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a3_1 , 
        \dbpsk_modulator_0/N_122 , 
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a3_0 , 
        \dbpsk_modulator_0/N_106 , \dbpsk_modulator_0/N_17 , 
        \dbpsk_modulator_0/N_32 , \dbpsk_modulator_0/N_19 , 
        \dbpsk_modulator_0/N_25 , \dbpsk_modulator_0/N_23 , 
        \dbpsk_modulator_0/N_29 , \dbpsk_modulator_0/N_21 , 
        \dbpsk_modulator_0/N_30 , \dbpsk_modulator_0/N_15 , 
        \dbpsk_modulator_0/N_33 , \dbpsk_modulator_0/N_13 , 
        \dbpsk_modulator_0/N_34 , \dbpsk_modulator_0/N_11 , 
        \dbpsk_modulator_0/N_35 , \dbpsk_modulator_0/N_42 , 
        \dbpsk_modulator_0/N_41 , \dbpsk_modulator_0/N_40 , 
        \dbpsk_modulator_0/N_39 , \dbpsk_modulator_0/N_38 , 
        \dbpsk_modulator_0/N_37 , \dbpsk_modulator_0/N_36 , 
        \dbpsk_modulator_0/N_28 , \dbpsk_modulator_0/counter_n9 , 
        \dbpsk_modulator_0/counter_n10 , 
        \dbpsk_modulator_0/counter_n11 , 
        \dbpsk_modulator_0/counter_n12 , 
        \dbpsk_modulator_0/counter_n13 , 
        \dbpsk_modulator_0/counter_n14 , 
        \dbpsk_modulator_0/counter_n15 , 
        \dbpsk_modulator_0/counter_n0 , 
        \dbpsk_modulator_0/output_dbpsk_5 , 
        \two_mhz_clock_0/counter[1]_net_1 , 
        \two_mhz_clock_0/counter[0]_net_1 , 
        \two_mhz_clock_0/counter[3]_net_1 , 
        \two_mhz_clock_0/DWACT_FINC_E[0] , 
        \two_mhz_clock_0/counter[8]_net_1 , 
        \two_mhz_clock_0/DWACT_FINC_E[4] , 
        \two_mhz_clock_0/counter14_9 , \two_mhz_clock_0/counter14_1 , 
        \two_mhz_clock_0/counter14_0 , \two_mhz_clock_0/counter14_7 , 
        \two_mhz_clock_0/counter14_8 , 
        \two_mhz_clock_0/counter[4]_net_1 , 
        \two_mhz_clock_0/counter14_5 , 
        \two_mhz_clock_0/counter[5]_net_1 , 
        \two_mhz_clock_0/counter14_3 , 
        \two_mhz_clock_0/counter[2]_net_1 , 
        \two_mhz_clock_0/counter[6]_net_1 , 
        \two_mhz_clock_0/counter[9]_net_1 , 
        \two_mhz_clock_0/counter[7]_net_1 , 
        \two_mhz_clock_0/counter[11]_net_1 , 
        \two_mhz_clock_0/counter[10]_net_1 , 
        \two_mhz_clock_0/clock_out_RNO_0 , 
        \two_mhz_clock_0/counter_3[5] , \two_mhz_clock_0/I_14_0 , 
        \two_mhz_clock_0/counter_3[4] , \two_mhz_clock_0/I_12_0 , 
        \two_mhz_clock_0/counter_3[1] , \two_mhz_clock_0/I_5_0 , 
        \two_mhz_clock_0/I_4 , \two_mhz_clock_0/I_7_0 , 
        \two_mhz_clock_0/I_9_0 , \two_mhz_clock_0/I_17_0 , 
        \two_mhz_clock_0/I_20_0 , \two_mhz_clock_0/I_23 , 
        \two_mhz_clock_0/I_26 , \two_mhz_clock_0/I_28 , 
        \two_mhz_clock_0/I_32 , \two_mhz_clock_0/N_2 , 
        \two_mhz_clock_0/DWACT_FINC_E[6] , 
        \two_mhz_clock_0/DWACT_FINC_E[2] , 
        \two_mhz_clock_0/DWACT_FINC_E[5] , \two_mhz_clock_0/N_3 , 
        \two_mhz_clock_0/DWACT_FINC_E[3] , \two_mhz_clock_0/N_5 , 
        \two_mhz_clock_0/N_6 , \two_mhz_clock_0/N_7 , 
        \two_mhz_clock_0/DWACT_FINC_E[1] , \two_mhz_clock_0/N_8 , 
        \two_mhz_clock_0/N_10 , \whitening_0/output_counter[1]_net_1 , 
        \whitening_0/output_counter[0]_net_1 , 
        \whitening_0/output_counter[3]_net_1 , 
        \whitening_0/DWACT_FINC_E[0] , 
        \whitening_0/output_counter[8]_net_1 , 
        \whitening_0/DWACT_FINC_E[4] , \whitening_0/DWACT_FINC_E[7] , 
        \whitening_0/DWACT_FINC_E[6] , \whitening_0/counter_n1_i_1 , 
        \whitening_0/counter[0]_net_1 , \whitening_0/counter_i_0[1] , 
        \whitening_0/counter_n1_i_a3_0_0 , 
        \whitening_0/counter[5]_net_1 , \whitening_0/counter[4]_net_1 , 
        \whitening_0/state_1_sqmuxa_i_a3_1 , 
        \whitening_0/output_counter17_13 , 
        \whitening_0/output_counter17_5 , 
        \whitening_0/output_counter17_4 , 
        \whitening_0/output_counter17_11 , 
        \whitening_0/output_counter17_12 , 
        \whitening_0/output_counter17_1 , 
        \whitening_0/output_counter17_0 , 
        \whitening_0/output_counter17_9 , 
        \whitening_0/output_counter[4]_net_1 , 
        \whitening_0/output_counter17_7 , 
        \whitening_0/output_counter[5]_net_1 , 
        \whitening_0/output_counter17_2 , 
        \whitening_0/output_counter[2]_net_1 , 
        \whitening_0/output_counter[6]_net_1 , 
        \whitening_0/output_counter[12]_net_1 , 
        \whitening_0/output_counter[9]_net_1 , 
        \whitening_0/output_counter[10]_net_1 , 
        \whitening_0/output_counter[7]_net_1 , 
        \whitening_0/output_counter[11]_net_1 , 
        \whitening_0/output_counter[13]_net_1 , 
        \whitening_0/output_counter[15]_net_1 , 
        \whitening_0/output_counter[14]_net_1 , 
        \whitening_0/counter_n5_i_a2_0_9 , 
        \whitening_0/counter_n5_i_a2_0_6 , 
        \whitening_0/counter[12]_net_1 , 
        \whitening_0/counter[9]_net_1 , 
        \whitening_0/counter_n5_i_a2_0_8 , 
        \whitening_0/counter_i_0[2] , 
        \whitening_0/counter_n5_i_a2_0_4 , 
        \whitening_0/counter[14]_net_1 , 
        \whitening_0/counter_n5_i_a2_0_7 , 
        \whitening_0/counter_i_0[3] , \whitening_0/counter_i_0[6] , 
        \whitening_0/counter_n5_i_a2_0_2 , 
        \whitening_0/counter[15]_net_1 , 
        \whitening_0/counter[11]_net_1 , 
        \whitening_0/counter[13]_net_1 , 
        \whitening_0/counter[10]_net_1 , \whitening_0/counter_i_0[8] , 
        \whitening_0/counter_i_0[7] , 
        \whitening_0/output_counter21_13 , 
        \whitening_0/output_counter21_11 , 
        \whitening_0/output_counter21_12 , 
        \whitening_0/output_counter21_9 , 
        \whitening_0/output_counter21_7 , 
        \whitening_0/output_whitening_4_i_x2_0 , 
        \whitening_0/state[6]_net_1 , \whitening_0/state[3]_net_1 , 
        \whitening_0/N_114 , \whitening_0/counter_RNI3P3V3[2]_net_1 , 
        \whitening_0/N_115 , \whitening_0/N_25 , \whitening_0/N_23 , 
        \whitening_0/N_37 , \whitening_0/N_21 , \whitening_0/N_38 , 
        \whitening_0/N_19 , \whitening_0/N_65_i , \whitening_0/N_17 , 
        \whitening_0/N_66_i , \whitening_0/N_15_0 , \whitening_0/N_41 , 
        \whitening_0/N_13_0 , \whitening_0/N_42 , \whitening_0/N_11 , 
        \whitening_0/N_43 , \whitening_0/N_40 , \whitening_0/N_51 , 
        \whitening_0/N_49 , \whitening_0/N_48 , \whitening_0/N_47 , 
        \whitening_0/N_46 , \whitening_0/N_45 , \whitening_0/N_44 , 
        \whitening_0/N_34 , \whitening_0/N_32 , \whitening_0/N_30 , 
        \whitening_0/N_28 , \whitening_0/counter_n9 , 
        \whitening_0/counter_n10 , \whitening_0/counter_n11 , 
        \whitening_0/counter_n12 , \whitening_0/counter_n13 , 
        \whitening_0/counter_n14 , \whitening_0/counter_n15 , 
        \whitening_0/counter_n0 , \whitening_0/state_22[6] , 
        \whitening_0/state[5]_net_1 , \whitening_0/state_22[5] , 
        \whitening_0/state[4]_net_1 , \whitening_0/state_22[3] , 
        \whitening_0/state[2]_net_1 , \whitening_0/state_22[2] , 
        \whitening_0/state[1]_net_1 , \whitening_0/state_22[1] , 
        \whitening_0/state[0]_net_1 , 
        \whitening_0/output_counter_5[5] , \whitening_0/I_14_1 , 
        \whitening_0/output_counter_5[4] , \whitening_0/I_12_1 , 
        \whitening_0/output_counter_5[1] , \whitening_0/I_5_1 , 
        \whitening_0/output_whitening_1_sqmuxa , \whitening_0/I_4_0 , 
        \whitening_0/I_7_1 , \whitening_0/I_9_1 , \whitening_0/I_17_1 , 
        \whitening_0/I_20_1 , \whitening_0/I_23_0 , 
        \whitening_0/I_26_0 , \whitening_0/I_28_0 , 
        \whitening_0/I_32_0 , \whitening_0/I_35 , \whitening_0/I_37 , 
        \whitening_0/I_40 , \whitening_0/I_43 , \whitening_0/N_2 , 
        \whitening_0/DWACT_FINC_E[9] , \whitening_0/N_3 , 
        \whitening_0/DWACT_FINC_E[8] , \whitening_0/N_4 , 
        \whitening_0/N_6 , \whitening_0/DWACT_FINC_E[2] , 
        \whitening_0/DWACT_FINC_E[5] , \whitening_0/N_7 , 
        \whitening_0/DWACT_FINC_E[3] , \whitening_0/N_9 , 
        \whitening_0/N_10 , \whitening_0/N_11_0 , 
        \whitening_0/DWACT_FINC_E[1] , \whitening_0/N_12 , 
        \whitening_0/N_14 , \main_clock_0/clock_out_i , 
        \main_clock_0/counter[1]_net_1 , 
        \main_clock_0/counter[0]_net_1 , 
        \main_clock_0/counter[3]_net_1 , 
        \main_clock_0/DWACT_FINC_E[0] , \main_clock_0/counter14_4 , 
        \main_clock_0/counter14_2 , \main_clock_0/counter[2]_net_1 , 
        \main_clock_0/counter[5]_net_1 , \main_clock_0/counter14_3 , 
        \main_clock_0/counter[6]_net_1 , 
        \main_clock_0/counter[7]_net_1 , 
        \main_clock_0/counter[4]_net_1 , 
        \main_clock_0/clock_out_RNO_net_1 , 
        \main_clock_0/counter_3[0] , \main_clock_0/I_5 , 
        \main_clock_0/I_7 , \main_clock_0/I_9 , \main_clock_0/I_12 , 
        \main_clock_0/I_14 , \main_clock_0/I_17 , \main_clock_0/I_20 , 
        \main_clock_0/N_2 , \main_clock_0/DWACT_FINC_E[2] , 
        \main_clock_0/N_3 , \main_clock_0/DWACT_FINC_E[1] , 
        \main_clock_0/N_4 , \main_clock_0/N_6 , GND, VCC, 
        \modulator_0/output_signal_0 , 
        \modulator_0/output_signal_1_sqmuxa_i_3 , 
        \modulator_0/output_signal_1_sqmuxa_i_1 , \modulator_0/N_147 , 
        \modulator_0/N_148 , \modulator_0/clock_counter[14]_net_1 , 
        \modulator_0/clock_counter[15]_net_1 , \modulator_0/N_36_3 , 
        \modulator_0/output_signal_1_sqmuxa_i_a2_2 , 
        \modulator_0/output_signal_1_sqmuxa_i_a2_1 , 
        \modulator_0/clock_counter[9]_net_1 , 
        \modulator_0/clock_counter[10]_net_1 , \modulator_0/un6lto11 , 
        \modulator_0/un6lto12 , 
        \modulator_0/output_signal_1_sqmuxa_i_a2_0_2 , 
        \modulator_0/clock_counter[6]_net_1 , 
        \modulator_0/clock_counter[8]_net_1 , 
        \modulator_0/output_signal_1_sqmuxa_i_a2_0_1 , 
        \modulator_0/clock_counter[5]_net_1 , 
        \modulator_0/clock_counter[4]_net_1 , 
        \modulator_0/counter_n1_i_0 , \modulator_0/counter[0]_net_1 , 
        \modulator_0/counter[1]_net_1 , 
        \modulator_0/output_signal_1_sqmuxa_i_a2_2_0 , 
        \modulator_0/un6lto7 , \modulator_0/counter_0_sqmuxa_i_a2_0 , 
        \modulator_0/N_123_1 , \modulator_0/clock_counterlde_0_a2_1 , 
        \modulator_0/counter[4]_net_1 , \modulator_0/counter[5]_net_1 , 
        \modulator_0/clock_counter[3]_net_1 , 
        \modulator_0/clock_counter[2]_net_1 , \modulator_0/N_23 , 
        \modulator_0/N_42 , \modulator_0/N_27 , \modulator_0/N_40 , 
        \modulator_0/N_29 , \modulator_0/N_39 , \modulator_0/N_31 , 
        \modulator_0/N_51 , \modulator_0/N_55 , \modulator_0/N_36 , 
        \modulator_0/N_146 , \modulator_0/N_145 , \modulator_0/N_47 , 
        \modulator_0/N_45 , \modulator_0/N_150 , \modulator_0/N_17 , 
        \modulator_0/N_46 , \modulator_0/N_137 , \modulator_0/N_25 , 
        \modulator_0/N_41 , \modulator_0/N_21 , \modulator_0/N_43 , 
        \modulator_0/N_19 , \modulator_0/N_53 , \modulator_0/N_151 , 
        \modulator_0/counter[3]_net_1 , \modulator_0/counter[2]_net_1 , 
        \modulator_0/N_5 , \modulator_0/counter_n5 , 
        \modulator_0/counter_44_0 , \modulator_0/N_8 , 
        \modulator_0/counter_n4 , \modulator_0/counter_c3 , 
        \modulator_0/counter_n3 , \modulator_0/counter_c2 , 
        \modulator_0/counter_n2 , \modulator_0/counter_c1 , 
        \modulator_0/clock_counter[1]_net_1 , 
        \modulator_0/clock_counter[0]_net_1 , 
        \modulator_0/clock_counter[13]_net_1 , \modulator_0/N_91 , 
        \modulator_0/N_52 , \modulator_0/N_61 , \modulator_0/N_50 , 
        \modulator_0/N_49 , \modulator_0/N_48 , 
        \modulator_0/clock_counter_n9 , 
        \modulator_0/clock_counter_n10 , 
        \modulator_0/clock_counter_n11 , 
        \modulator_0/clock_counter_n12 , 
        \modulator_0/clock_counter_n13 , 
        \modulator_0/clock_counter_n14 , 
        \modulator_0/clock_counter_n15 , \modulator_0/N_144 , 
        \modulator_0/clock_countere , \modulator_0/counter_n0 , 
        \data_source_0/counter_RNII6P43_0[4]_net_1 , 
        \data_source_0/counter_RNII6P43[4]_net_1 , 
        \data_source_0/counter23_0_a2_1 , 
        \data_source_0/counter[4]_net_1 , 
        \data_source_0/counter[5]_net_1 , 
        \data_source_0/counter[0]_net_1 , 
        \data_source_0/counter_n1_i_1 , \data_source_0/counter_i_0[1] , 
        \data_source_0/counter_n1_i_a2_0_0 , 
        \data_source_0/counter23_0_a2_0_9 , 
        \data_source_0/counter23_0_a2_0_6 , 
        \data_source_0/counter[12]_net_1 , 
        \data_source_0/counter[9]_net_1 , 
        \data_source_0/counter23_0_a2_0_8 , 
        \data_source_0/counter_i_0[2] , 
        \data_source_0/counter23_0_a2_0_4 , 
        \data_source_0/counter[14]_net_1 , 
        \data_source_0/counter23_0_a2_0_7 , 
        \data_source_0/counter_i_0[3] , \data_source_0/counter_i_0[6] , 
        \data_source_0/counter23_0_a2_0_2 , 
        \data_source_0/counter[15]_net_1 , 
        \data_source_0/counter[11]_net_1 , 
        \data_source_0/counter[13]_net_1 , 
        \data_source_0/counter[10]_net_1 , 
        \data_source_0/counter_i_0[8] , \data_source_0/counter_i_0[7] , 
        \data_source_0/N_76 , \data_source_0/N_94 , 
        \data_source_0/N_77 , \data_source_0/N_18 , 
        \data_source_0/N_57_i , \data_source_0/N_20 , 
        \data_source_0/N_56_i , \data_source_0/N_26 , 
        \data_source_0/N_24 , \data_source_0/N_30 , 
        \data_source_0/N_22 , \data_source_0/N_31 , 
        \data_source_0/N_16 , \data_source_0/N_34 , 
        \data_source_0/N_14 , \data_source_0/N_35 , 
        \data_source_0/N_12 , \data_source_0/N_36 , 
        \data_source_0/state_1_sqmuxa , \data_source_0/state_6[65] , 
        \data_source_0/N_216 , \data_source_0/state_6[73] , 
        \data_source_0/N_224 , \data_source_0/state_6[81] , 
        \data_source_0/N_232 , \data_source_0/state_6[89] , 
        \data_source_0/N_240 , \data_source_0/state_6[75] , 
        \data_source_0/N_226 , \data_source_0/state_6[83] , 
        \data_source_0/N_234 , \data_source_0/state_6[91] , 
        \data_source_0/N_242 , \data_source_0/state_6[77] , 
        \data_source_0/N_228 , \data_source_0/state_6[85] , 
        \data_source_0/N_236 , \data_source_0/state_6[93] , 
        \data_source_0/N_244 , \data_source_0/state_6[79] , 
        \data_source_0/N_230 , \data_source_0/state_6[87] , 
        \data_source_0/N_238 , \data_source_0/state_6[95] , 
        \data_source_0/N_246 , \data_source_0/state_6[97] , 
        \data_source_0/N_248 , \data_source_0/state_6[100] , 
        \data_source_0/N_251 , \data_source_0/state_6[103] , 
        \data_source_0/N_254 , \data_source_0/state_6[64] , 
        \data_source_0/N_215 , \data_source_0/state_6[66] , 
        \data_source_0/N_217 , \data_source_0/state_6[67] , 
        \data_source_0/N_218 , \data_source_0/state_6[68] , 
        \data_source_0/N_219 , \data_source_0/state_6[69] , 
        \data_source_0/N_220 , \data_source_0/state_6[70] , 
        \data_source_0/N_221 , \data_source_0/state_6[71] , 
        \data_source_0/N_222 , \data_source_0/state_6[72] , 
        \data_source_0/N_223 , \data_source_0/state_6[80] , 
        \data_source_0/N_231 , \data_source_0/state_6[88] , 
        \data_source_0/N_239 , \data_source_0/state_6[74] , 
        \data_source_0/N_225 , \data_source_0/state_6[82] , 
        \data_source_0/N_233 , \data_source_0/state_6[90] , 
        \data_source_0/N_241 , \data_source_0/state_6[76] , 
        \data_source_0/N_227 , \data_source_0/state_6[84] , 
        \data_source_0/N_235 , \data_source_0/state_6[92] , 
        \data_source_0/N_243 , \data_source_0/state_6[78] , 
        \data_source_0/N_229 , \data_source_0/state_6[86] , 
        \data_source_0/N_237 , \data_source_0/state_6[94] , 
        \data_source_0/N_245 , \data_source_0/state_6[96] , 
        \data_source_0/N_247 , \data_source_0/state_6[98] , 
        \data_source_0/N_249 , \data_source_0/state_6[99] , 
        \data_source_0/N_250 , \data_source_0/state_6[101] , 
        \data_source_0/N_252 , \data_source_0/state_6[102] , 
        \data_source_0/N_253 , \data_source_0/state[103]_net_1 , 
        \data_source_0/state[102]_net_1 , 
        \data_source_0/state[101]_net_1 , 
        \data_source_0/state[100]_net_1 , 
        \data_source_0/state[99]_net_1 , 
        \data_source_0/state[98]_net_1 , 
        \data_source_0/state[97]_net_1 , 
        \data_source_0/state[96]_net_1 , 
        \data_source_0/state[95]_net_1 , 
        \data_source_0/state[94]_net_1 , 
        \data_source_0/state[93]_net_1 , 
        \data_source_0/state[92]_net_1 , 
        \data_source_0/state[91]_net_1 , 
        \data_source_0/state[90]_net_1 , 
        \data_source_0/state[89]_net_1 , 
        \data_source_0/state[88]_net_1 , 
        \data_source_0/state[87]_net_1 , 
        \data_source_0/state[86]_net_1 , 
        \data_source_0/state[85]_net_1 , 
        \data_source_0/state[84]_net_1 , 
        \data_source_0/state[83]_net_1 , 
        \data_source_0/state[82]_net_1 , 
        \data_source_0/state[81]_net_1 , 
        \data_source_0/state[80]_net_1 , 
        \data_source_0/state[79]_net_1 , 
        \data_source_0/state[78]_net_1 , 
        \data_source_0/state[77]_net_1 , 
        \data_source_0/state[76]_net_1 , 
        \data_source_0/state[75]_net_1 , 
        \data_source_0/state[74]_net_1 , 
        \data_source_0/state[73]_net_1 , 
        \data_source_0/state[72]_net_1 , 
        \data_source_0/state[71]_net_1 , 
        \data_source_0/state[70]_net_1 , 
        \data_source_0/state[69]_net_1 , 
        \data_source_0/state[68]_net_1 , 
        \data_source_0/state[67]_net_1 , 
        \data_source_0/state[66]_net_1 , 
        \data_source_0/state[65]_net_1 , 
        \data_source_0/state[64]_net_1 , 
        \data_source_0/state[63]_net_1 , \data_source_0/state_6[105] , 
        \data_source_0/N_256 , \data_source_0/state_6[113] , 
        \data_source_0/N_264 , \data_source_0/state_6[121] , 
        \data_source_0/N_272 , \data_source_0/state_6[129] , 
        \data_source_0/N_280 , \data_source_0/state_6[137] , 
        \data_source_0/N_288 , \data_source_0/state_6[108] , 
        \data_source_0/N_259 , \data_source_0/state_6[116] , 
        \data_source_0/N_267 , \data_source_0/state_6[124] , 
        \data_source_0/N_275 , \data_source_0/state_6[132] , 
        \data_source_0/N_283 , \data_source_0/state_6[140] , 
        \data_source_0/N_291 , \data_source_0/state_6[111] , 
        \data_source_0/N_262 , \data_source_0/state_6[119] , 
        \data_source_0/N_270 , \data_source_0/state_6[127] , 
        \data_source_0/N_278 , \data_source_0/state_6[135] , 
        \data_source_0/N_286 , \data_source_0/state_6[143] , 
        \data_source_0/N_294 , \data_source_0/state_6[112] , 
        \data_source_0/N_263 , \data_source_0/state_6[120] , 
        \data_source_0/N_271 , \data_source_0/state_6[128] , 
        \data_source_0/N_279 , \data_source_0/state_6[136] , 
        \data_source_0/N_287 , \data_source_0/state_6[106] , 
        \data_source_0/N_257 , \data_source_0/state_6[114] , 
        \data_source_0/N_265 , \data_source_0/state_6[122] , 
        \data_source_0/N_273 , \data_source_0/state_6[130] , 
        \data_source_0/N_281 , \data_source_0/state_6[138] , 
        \data_source_0/N_289 , \data_source_0/state_6[107] , 
        \data_source_0/N_258 , \data_source_0/state_6[115] , 
        \data_source_0/N_266 , \data_source_0/state_6[123] , 
        \data_source_0/N_274 , \data_source_0/state_6[131] , 
        \data_source_0/N_282 , \data_source_0/state_6[139] , 
        \data_source_0/N_290 , \data_source_0/state_6[109] , 
        \data_source_0/N_260 , \data_source_0/state_6[117] , 
        \data_source_0/N_268 , \data_source_0/state_6[125] , 
        \data_source_0/N_276 , \data_source_0/state_6[133] , 
        \data_source_0/N_284 , \data_source_0/state_6[141] , 
        \data_source_0/N_292 , \data_source_0/state_6[110] , 
        \data_source_0/N_261 , \data_source_0/state_6[118] , 
        \data_source_0/N_269 , \data_source_0/state_6[126] , 
        \data_source_0/N_277 , \data_source_0/state_6[134] , 
        \data_source_0/N_285 , \data_source_0/state_6[142] , 
        \data_source_0/N_293 , \data_source_0/state[143]_net_1 , 
        \data_source_0/state[142]_net_1 , 
        \data_source_0/state[141]_net_1 , 
        \data_source_0/state[140]_net_1 , 
        \data_source_0/state[139]_net_1 , 
        \data_source_0/state[138]_net_1 , 
        \data_source_0/state[137]_net_1 , 
        \data_source_0/state[136]_net_1 , 
        \data_source_0/state[135]_net_1 , 
        \data_source_0/state[134]_net_1 , 
        \data_source_0/state[133]_net_1 , 
        \data_source_0/state[132]_net_1 , 
        \data_source_0/state[131]_net_1 , 
        \data_source_0/state[130]_net_1 , 
        \data_source_0/state[129]_net_1 , 
        \data_source_0/state[128]_net_1 , 
        \data_source_0/state[127]_net_1 , 
        \data_source_0/state[126]_net_1 , 
        \data_source_0/state[125]_net_1 , 
        \data_source_0/state[124]_net_1 , 
        \data_source_0/state[123]_net_1 , 
        \data_source_0/state[122]_net_1 , 
        \data_source_0/state[121]_net_1 , 
        \data_source_0/state[120]_net_1 , 
        \data_source_0/state[119]_net_1 , 
        \data_source_0/state[118]_net_1 , 
        \data_source_0/state[117]_net_1 , 
        \data_source_0/state[116]_net_1 , 
        \data_source_0/state[115]_net_1 , 
        \data_source_0/state[114]_net_1 , 
        \data_source_0/state[113]_net_1 , 
        \data_source_0/state[112]_net_1 , 
        \data_source_0/state[111]_net_1 , 
        \data_source_0/state[110]_net_1 , 
        \data_source_0/state[109]_net_1 , 
        \data_source_0/state[108]_net_1 , 
        \data_source_0/state[107]_net_1 , 
        \data_source_0/state[106]_net_1 , 
        \data_source_0/state[105]_net_1 , 
        \data_source_0/state[104]_net_1 , \data_source_0/state_6[49] , 
        \data_source_0/N_200 , \data_source_0/state_6[57] , 
        \data_source_0/N_208 , \data_source_0/state_6[25] , 
        \data_source_0/N_176 , \data_source_0/state_6[33] , 
        \data_source_0/N_184 , \data_source_0/state_6[41] , 
        \data_source_0/N_192 , \data_source_0/state_6[28] , 
        \data_source_0/N_179 , \data_source_0/state_6[36] , 
        \data_source_0/N_187 , \data_source_0/state_6[44] , 
        \data_source_0/N_195 , \data_source_0/state_6[31] , 
        \data_source_0/N_182 , \data_source_0/state_6[39] , 
        \data_source_0/N_190 , \data_source_0/state_6[47] , 
        \data_source_0/N_198 , \data_source_0/state_6[48] , 
        \data_source_0/N_199 , \data_source_0/state_6[56] , 
        \data_source_0/N_207 , \data_source_0/state_6[50] , 
        \data_source_0/N_201 , \data_source_0/state_6[58] , 
        \data_source_0/N_209 , \data_source_0/state_6[51] , 
        \data_source_0/N_202 , \data_source_0/state_6[59] , 
        \data_source_0/N_210 , \data_source_0/state_6[52] , 
        \data_source_0/N_203 , \data_source_0/state_6[60] , 
        \data_source_0/N_211 , \data_source_0/state_6[53] , 
        \data_source_0/N_204 , \data_source_0/state_6[61] , 
        \data_source_0/N_212 , \data_source_0/state_6[54] , 
        \data_source_0/N_205 , \data_source_0/state_6[62] , 
        \data_source_0/N_213 , \data_source_0/state_6[55] , 
        \data_source_0/N_206 , \data_source_0/state_6[63] , 
        \data_source_0/N_214 , \data_source_0/state_6[24] , 
        \data_source_0/N_175 , \data_source_0/state_6[32] , 
        \data_source_0/N_183 , \data_source_0/state_6[40] , 
        \data_source_0/N_191 , \data_source_0/state_6[104] , 
        \data_source_0/N_255 , \data_source_0/state_6[26] , 
        \data_source_0/N_177 , \data_source_0/state_6[34] , 
        \data_source_0/N_185 , \data_source_0/state_6[42] , 
        \data_source_0/N_193 , \data_source_0/state_6[27] , 
        \data_source_0/N_178 , \data_source_0/state_6[35] , 
        \data_source_0/N_186 , \data_source_0/state_6[43] , 
        \data_source_0/N_194 , \data_source_0/state_6[29] , 
        \data_source_0/N_180 , \data_source_0/state_6[37] , 
        \data_source_0/N_188 , \data_source_0/state_6[45] , 
        \data_source_0/N_196 , \data_source_0/state_6[30] , 
        \data_source_0/N_181 , \data_source_0/state_6[38] , 
        \data_source_0/N_189 , \data_source_0/state_6[46] , 
        \data_source_0/N_197 , \data_source_0/state[62]_net_1 , 
        \data_source_0/state[61]_net_1 , 
        \data_source_0/state[60]_net_1 , 
        \data_source_0/state[59]_net_1 , 
        \data_source_0/state[58]_net_1 , 
        \data_source_0/state[57]_net_1 , 
        \data_source_0/state[56]_net_1 , 
        \data_source_0/state[55]_net_1 , 
        \data_source_0/state[54]_net_1 , 
        \data_source_0/state[53]_net_1 , 
        \data_source_0/state[52]_net_1 , 
        \data_source_0/state[51]_net_1 , 
        \data_source_0/state[50]_net_1 , 
        \data_source_0/state[49]_net_1 , 
        \data_source_0/state[48]_net_1 , 
        \data_source_0/state[47]_net_1 , 
        \data_source_0/state[46]_net_1 , 
        \data_source_0/state[45]_net_1 , 
        \data_source_0/state[44]_net_1 , 
        \data_source_0/state[43]_net_1 , 
        \data_source_0/state[42]_net_1 , 
        \data_source_0/state[41]_net_1 , 
        \data_source_0/state[40]_net_1 , 
        \data_source_0/state[39]_net_1 , 
        \data_source_0/state[38]_net_1 , 
        \data_source_0/state[37]_net_1 , 
        \data_source_0/state[36]_net_1 , 
        \data_source_0/state[35]_net_1 , 
        \data_source_0/state[34]_net_1 , 
        \data_source_0/state[33]_net_1 , 
        \data_source_0/state[32]_net_1 , 
        \data_source_0/state[31]_net_1 , 
        \data_source_0/state[30]_net_1 , 
        \data_source_0/state[29]_net_1 , 
        \data_source_0/state[28]_net_1 , 
        \data_source_0/state[27]_net_1 , 
        \data_source_0/state[26]_net_1 , 
        \data_source_0/state[25]_net_1 , 
        \data_source_0/state[24]_net_1 , 
        \data_source_0/state[23]_net_1 , \data_source_0/state_6[23] , 
        \data_source_0/N_174 , \data_source_0/state_6[22] , 
        \data_source_0/N_173 , \data_source_0/state_6[21] , 
        \data_source_0/N_172 , \data_source_0/state_6[20] , 
        \data_source_0/N_171 , \data_source_0/state_6[19] , 
        \data_source_0/N_170 , \data_source_0/state_6[18] , 
        \data_source_0/N_169 , \data_source_0/state_6[17] , 
        \data_source_0/N_168 , \data_source_0/state_6[16] , 
        \data_source_0/N_167 , \data_source_0/state_6[15] , 
        \data_source_0/N_166 , \data_source_0/state_6[14] , 
        \data_source_0/N_165 , \data_source_0/state_6[13] , 
        \data_source_0/N_164 , \data_source_0/state_6[12] , 
        \data_source_0/N_163 , \data_source_0/state_6[11] , 
        \data_source_0/N_162 , \data_source_0/state_6[10] , 
        \data_source_0/N_161 , \data_source_0/state_6[9] , 
        \data_source_0/N_160 , \data_source_0/state_6[8] , 
        \data_source_0/N_159 , \data_source_0/state_6[7] , 
        \data_source_0/N_158 , \data_source_0/state_6[6] , 
        \data_source_0/N_157 , \data_source_0/state_6[5] , 
        \data_source_0/N_156 , \data_source_0/state_6[4] , 
        \data_source_0/N_155 , \data_source_0/state_6[3] , 
        \data_source_0/N_154 , \data_source_0/state_6[2] , 
        \data_source_0/N_153 , \data_source_0/state_6[1] , 
        \data_source_0/N_152 , \data_source_0/state_6[0] , 
        \data_source_0/N_151 , \data_source_0/state[22]_net_1 , 
        \data_source_0/state[21]_net_1 , 
        \data_source_0/state[20]_net_1 , 
        \data_source_0/state[19]_net_1 , 
        \data_source_0/state[18]_net_1 , 
        \data_source_0/state[17]_net_1 , 
        \data_source_0/state[16]_net_1 , 
        \data_source_0/state[15]_net_1 , 
        \data_source_0/state[14]_net_1 , 
        \data_source_0/state[13]_net_1 , 
        \data_source_0/state[12]_net_1 , 
        \data_source_0/state[11]_net_1 , 
        \data_source_0/state[10]_net_1 , 
        \data_source_0/state[9]_net_1 , \data_source_0/state[8]_net_1 , 
        \data_source_0/state[7]_net_1 , \data_source_0/state[6]_net_1 , 
        \data_source_0/state[5]_net_1 , \data_source_0/state[4]_net_1 , 
        \data_source_0/state[3]_net_1 , \data_source_0/state[2]_net_1 , 
        \data_source_0/state[1]_net_1 , \data_source_0/state[0]_net_1 , 
        \data_source_0/output_data_4 , \data_source_0/N_33 , 
        \data_source_0/N_43 , \data_source_0/N_42 , 
        \data_source_0/N_41 , \data_source_0/N_40 , 
        \data_source_0/N_39 , \data_source_0/N_38 , 
        \data_source_0/N_37 , \data_source_0/counter_n9 , 
        \data_source_0/counter_n10 , \data_source_0/counter_n11 , 
        \data_source_0/counter_n12 , \data_source_0/counter_n13 , 
        \data_source_0/counter_n14 , \data_source_0/counter_n15 , 
        \data_source_0/counter_n0 , \output_data_rate_pad/U0/NET1 , 
        \output_data_rate_pad/U0/NET2 , \ref_signal_pad/U0/NET1 , 
        \ref_signal_pad/U0/NET2 , \RSS_EN_pad/U0/NET1 , 
        \RSS_EN_pad/U0/NET2 , \trigger_signal_pad/U0/NET1 , 
        \output_signal_pad/U0/NET1 , \output_signal_pad/U0/NET2 , 
        \reset_pad/U0/NET1 , \signal_into_switch_pad/U0/NET1 , 
        \signal_into_switch_pad/U0/NET2 , \clock_pad/U0/NET1 , 
        \clock_out_pad/U0/NET1 , \clock_out_pad/U0/NET2 , AFLSDF_VCC, 
        AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    OR2A \modulator_0/clock_counter_RNI41VU[11]  (.A(
        \modulator_0/un6lto11 ), .B(\modulator_0/N_48 ), .Y(
        \modulator_0/N_49 ));
    XOR2 \two_mhz_clock_0/un5_counter_I_28  (.A(\two_mhz_clock_0/N_3 ), 
        .B(\two_mhz_clock_0/counter[10]_net_1 ), .Y(
        \two_mhz_clock_0/I_28 ));
    DFN1E1C0 \modulator_0/clock_counter[14]  (.D(
        \modulator_0/clock_counter_n14 ), .CLK(ref_signal_c), .CLR(
        reset_c), .E(\modulator_0/clock_countere ), .Q(
        \modulator_0/clock_counter[14]_net_1 ));
    DFN1C0 \data_source_0/state[16]  (.D(\data_source_0/state_6[16] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[16]_net_1 ));
    DFN1P0 \data_source_0/state[91]  (.D(\data_source_0/state_6[91] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[91]_net_1 ));
    DFN1C0 \data_source_0/state[60]  (.D(\data_source_0/state_6[60] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[60]_net_1 ));
    AND3 \two_mhz_clock_0/un5_counter_I_18  (.A(
        \two_mhz_clock_0/counter[3]_net_1 ), .B(
        \two_mhz_clock_0/counter[4]_net_1 ), .C(
        \two_mhz_clock_0/counter[5]_net_1 ), .Y(
        \two_mhz_clock_0/DWACT_FINC_E[2] ));
    MX2 \data_source_0/state_RNO_0[34]  (.A(
        \data_source_0/state[34]_net_1 ), .B(
        \data_source_0/state[33]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_185 ));
    XA1A \dbpsk_modulator_0/counter_RNO[10]  (.A(
        \dbpsk_modulator_0/counter[10]_net_1 ), .B(
        \dbpsk_modulator_0/N_37 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/counter_n10 ));
    DFN1C0 \data_source_0/state[71]  (.D(\data_source_0/state_6[71] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[71]_net_1 ));
    AND3 \whitening_0/un2_output_counter_1_I_10  (.A(
        \whitening_0/output_counter[0]_net_1 ), .B(
        \whitening_0/output_counter[1]_net_1 ), .C(
        \whitening_0/output_counter[2]_net_1 ), .Y(
        \whitening_0/DWACT_FINC_E[0] ));
    DFN1P0 \dbpsk_modulator_0/counter[8]  (.D(\dbpsk_modulator_0/N_11 )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \dbpsk_modulator_0/counter_i_0[8] ));
    OR2A \data_source_0/state_RNO[124]  (.A(output_signal_c), .B(
        \data_source_0/N_275 ), .Y(\data_source_0/state_6[124] ));
    DFN1C0 \two_mhz_clock_0/counter[7]  (.D(\two_mhz_clock_0/I_20_0 ), 
        .CLK(GLA), .CLR(reset_c), .Q(
        \two_mhz_clock_0/counter[7]_net_1 ));
    AO1 \whitening_0/counter_RNO[1]  (.A(
        \whitening_0/counter_n1_i_a3_0_0 ), .B(
        \whitening_0/counter_RNI3P3V3[2]_net_1 ), .C(
        \whitening_0/counter_n1_i_1 ), .Y(\whitening_0/N_25 ));
    OR2A \data_source_0/state_RNO[116]  (.A(output_signal_c), .B(
        \data_source_0/N_267 ), .Y(\data_source_0/state_6[116] ));
    DFN1P0 \data_source_0/state[97]  (.D(\data_source_0/state_6[97] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[97]_net_1 ));
    MX2 \data_source_0/state_RNO_0[30]  (.A(
        \data_source_0/state[30]_net_1 ), .B(
        \data_source_0/state[29]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_181 ));
    DFN1P0 \data_source_0/state[77]  (.D(\data_source_0/state_6[77] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[77]_net_1 ));
    DFN1E1C0 \modulator_0/clock_counter[0]  (.D(\modulator_0/N_144 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(
        \modulator_0/clock_countere ), .Q(
        \modulator_0/clock_counter[0]_net_1 ));
    DFN1E0C0 \data_source_0/output_data  (.D(
        \data_source_0/output_data_4 ), .CLK(ref_signal_c), .CLR(
        reset_c), .E(\data_source_0/state_1_sqmuxa ), .Q(
        data_source_0_output_data));
    XOR2 \data_source_0/counter_RNO_1[5]  (.A(\data_source_0/N_33 ), 
        .B(\data_source_0/counter[5]_net_1 ), .Y(
        \data_source_0/N_57_i ));
    OR2A \data_source_0/counter_RNI9PI33[13]  (.A(
        \data_source_0/counter[13]_net_1 ), .B(\data_source_0/N_41 ), 
        .Y(\data_source_0/N_42 ));
    DFN1C0 \data_source_0/state[62]  (.D(\data_source_0/state_6[62] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[62]_net_1 ));
    DFN1C0 \two_mhz_clock_0/counter[0]  (.D(\two_mhz_clock_0/I_4 ), 
        .CLK(GLA), .CLR(reset_c), .Q(
        \two_mhz_clock_0/counter[0]_net_1 ));
    AOI1B \whitening_0/output_counter_RNO[1]  (.A(
        \whitening_0/output_counter17_13 ), .B(
        \whitening_0/output_counter17_12 ), .C(\whitening_0/I_5_1 ), 
        .Y(\whitening_0/output_counter_5[1] ));
    IOPAD_TRI \signal_into_switch_pad/U0/U0  (.D(
        \signal_into_switch_pad/U0/NET1 ), .E(
        \signal_into_switch_pad/U0/NET2 ), .PAD(signal_into_switch));
    NOR2 \dbpsk_modulator_0/counter_RNIP69A[9]  (.A(
        \dbpsk_modulator_0/counter[9]_net_1 ), .B(
        \dbpsk_modulator_0/counter[11]_net_1 ), .Y(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_3 ));
    DFN1C0 \two_mhz_clock_0/counter[1]  (.D(
        \two_mhz_clock_0/counter_3[1] ), .CLK(GLA), .CLR(reset_c), .Q(
        \two_mhz_clock_0/counter[1]_net_1 ));
    DFN1C0 \data_source_0/state[58]  (.D(\data_source_0/state_6[58] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[58]_net_1 ));
    AO1 \dbpsk_modulator_0/counter_RNO[1]  (.A(
        \dbpsk_modulator_0/counter_n1_i_a3_0 ), .B(
        \dbpsk_modulator_0/N_123 ), .C(
        \dbpsk_modulator_0/counter_n1_i_1 ), .Y(
        \dbpsk_modulator_0/N_25 ));
    MX2 \data_source_0/state_RNO_0[23]  (.A(
        \data_source_0/state[23]_net_1 ), .B(
        \data_source_0/state[22]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_174 ));
    DFN1C0 \data_source_0/state[63]  (.D(\data_source_0/state_6[63] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[63]_net_1 ));
    DFN1C0 \data_source_0/state[112]  (.D(\data_source_0/state_6[112] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[112]_net_1 ));
    MX2 \data_source_0/state_RNO_0[83]  (.A(
        \data_source_0/state[83]_net_1 ), .B(
        \data_source_0/state[82]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_234 ));
    NOR2B \data_source_0/state_RNO[10]  (.A(output_signal_c), .B(
        \data_source_0/N_161 ), .Y(\data_source_0/state_6[10] ));
    DFN1C0 \data_source_0/counter[9]  (.D(\data_source_0/counter_n9 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/counter[9]_net_1 ));
    MX2 \data_source_0/state_RNO_0[12]  (.A(
        \data_source_0/state[12]_net_1 ), .B(
        \data_source_0/state[11]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_163 ));
    DFN1P0 \data_source_0/state[28]  (.D(\data_source_0/state_6[28] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[28]_net_1 ));
    XA1A \modulator_0/clock_counter_RNO[3]  (.A(
        \modulator_0/clock_counter[3]_net_1 ), .B(\modulator_0/N_40 ), 
        .C(trigger_signal_c), .Y(\modulator_0/N_27 ));
    NOR3A \whitening_0/counter_RNIV8VH1[9]  (.A(
        \whitening_0/counter_n5_i_a2_0_6 ), .B(
        \whitening_0/counter[12]_net_1 ), .C(
        \whitening_0/counter[9]_net_1 ), .Y(
        \whitening_0/counter_n5_i_a2_0_9 ));
    AND3 \main_clock_0/un5_counter_1_I_19  (.A(
        \main_clock_0/DWACT_FINC_E[0] ), .B(
        \main_clock_0/DWACT_FINC_E[2] ), .C(
        \main_clock_0/counter[6]_net_1 ), .Y(\main_clock_0/N_2 ));
    MX2 \data_source_0/state_RNO_0[26]  (.A(
        \data_source_0/state[26]_net_1 ), .B(
        \data_source_0/state[25]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_177 ));
    DFN1P0 \data_source_0/state[135]  (.D(\data_source_0/state_6[135] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[135]_net_1 ));
    NOR2B \data_source_0/state_RNO[48]  (.A(output_signal_c), .B(
        \data_source_0/N_199 ), .Y(\data_source_0/state_6[48] ));
    MX2 \data_source_0/state_RNO_0[86]  (.A(
        \data_source_0/state[86]_net_1 ), .B(
        \data_source_0/state[85]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_237 ));
    NOR2 \whitening_0/output_counter_RNIFUA3[15]  (.A(
        \whitening_0/output_counter[15]_net_1 ), .B(
        \whitening_0/output_counter[14]_net_1 ), .Y(
        \whitening_0/output_counter17_0 ));
    DFN0E1C0 \whitening_0/output_counter[13]  (.D(\whitening_0/I_37 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[13]_net_1 ));
    NOR2B \data_source_0/state_RNO[12]  (.A(output_signal_c), .B(
        \data_source_0/N_163 ), .Y(\data_source_0/state_6[12] ));
    XA1A \data_source_0/counter_RNO[13]  (.A(
        \data_source_0/counter[13]_net_1 ), .B(\data_source_0/N_41 ), 
        .C(output_signal_c), .Y(\data_source_0/counter_n13 ));
    MX2 \data_source_0/state_RNO_0[138]  (.A(
        \data_source_0/state[138]_net_1 ), .B(
        \data_source_0/state[137]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_289 ));
    AND3 \whitening_0/un2_output_counter_1_I_16  (.A(
        \whitening_0/DWACT_FINC_E[0] ), .B(
        \whitening_0/DWACT_FINC_E[1] ), .C(
        \whitening_0/output_counter[5]_net_1 ), .Y(
        \whitening_0/N_11_0 ));
    NOR2B \data_source_0/state_RNO[13]  (.A(output_signal_c), .B(
        \data_source_0/N_164 ), .Y(\data_source_0/state_6[13] ));
    NOR3A \data_source_0/counter_RNO[5]  (.A(output_signal_c), .B(
        \data_source_0/N_76 ), .C(\data_source_0/N_57_i ), .Y(
        \data_source_0/N_18 ));
    DFN1C0 \modulator_0/counter[2]  (.D(\modulator_0/counter_n2 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \modulator_0/counter[2]_net_1 ));
    MX2 \data_source_0/state_RNO_0[35]  (.A(
        \data_source_0/state[35]_net_1 ), .B(
        \data_source_0/state[34]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_186 ));
    NOR2B \data_source_0/state_RNO[1]  (.A(output_signal_c), .B(
        \data_source_0/N_152 ), .Y(\data_source_0/state_6[1] ));
    DFN1P0 \data_source_0/state[137]  (.D(\data_source_0/state_6[137] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[137]_net_1 ));
    DFN1C0 \data_source_0/state[110]  (.D(\data_source_0/state_6[110] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[110]_net_1 ));
    DFN1C0 \data_source_0/state[48]  (.D(\data_source_0/state_6[48] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[48]_net_1 ));
    OR2A \dbpsk_modulator_0/counter_RNI316H[9]  (.A(
        \dbpsk_modulator_0/counter[9]_net_1 ), .B(
        \dbpsk_modulator_0/N_36 ), .Y(\dbpsk_modulator_0/N_37 ));
    MX2 \data_source_0/state_RNO_0[5]  (.A(
        \data_source_0/state[5]_net_1 ), .B(
        \data_source_0/state[4]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_156 ));
    NOR3C \dbpsk_modulator_0/counter_RNIG2S6[8]  (.A(
        \dbpsk_modulator_0/counter_i_0[3] ), .B(
        \dbpsk_modulator_0/counter_i_0[8] ), .C(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_1 ), .Y(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_6 ));
    NOR2B \data_source_0/state_RNO[30]  (.A(output_signal_c), .B(
        \data_source_0/N_181 ), .Y(\data_source_0/state_6[30] ));
    OR2A \data_source_0/state_RNO[113]  (.A(output_signal_c), .B(
        \data_source_0/N_264 ), .Y(\data_source_0/state_6[113] ));
    AX1C \two_mhz_clock_0/un5_counter_I_7  (.A(
        \two_mhz_clock_0/counter[1]_net_1 ), .B(
        \two_mhz_clock_0/counter[0]_net_1 ), .C(
        \two_mhz_clock_0/counter[2]_net_1 ), .Y(
        \two_mhz_clock_0/I_7_0 ));
    OR2 \modulator_0/clock_counter_RNI3U8B[6]  (.A(\modulator_0/N_45 ), 
        .B(\modulator_0/N_43 ), .Y(\modulator_0/N_46 ));
    DFN1E1C0 \whitening_0/state[4]  (.D(\whitening_0/N_28 ), .CLK(
        ref_signal_c), .CLR(reset_c), .E(\whitening_0/N_34 ), .Q(
        \whitening_0/state[4]_net_1 ));
    NOR2B \data_source_0/state_RNO[80]  (.A(output_signal_c), .B(
        \data_source_0/N_231 ), .Y(\data_source_0/state_6[80] ));
    INV \whitening_0/un2_output_counter_1_I_4  (.A(
        \whitening_0/output_counter[0]_net_1 ), .Y(\whitening_0/I_4_0 )
        );
    MX2 \data_source_0/state_RNO_0[6]  (.A(
        \data_source_0/state[6]_net_1 ), .B(
        \data_source_0/state[5]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_157 ));
    DFN1P0 \data_source_0/state[124]  (.D(\data_source_0/state_6[124] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[124]_net_1 ));
    DFN1C0 \data_source_0/state[80]  (.D(\data_source_0/state_6[80] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[80]_net_1 ));
    DFN1C0 \data_source_0/state[59]  (.D(\data_source_0/state_6[59] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[59]_net_1 ));
    NOR2B \whitening_0/state_RNO[6]  (.A(output_signal_c), .B(
        \whitening_0/state[5]_net_1 ), .Y(\whitening_0/state_22[6] ));
    MX2 \data_source_0/state_RNO_0[135]  (.A(
        \data_source_0/state[135]_net_1 ), .B(
        \data_source_0/state[134]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_286 ));
    NOR2B \data_source_0/counter_RNII6P43[4]  (.A(
        \data_source_0/counter23_0_a2_1 ), .B(\data_source_0/N_94 ), 
        .Y(\data_source_0/counter_RNII6P43[4]_net_1 ));
    XA1A \whitening_0/counter_RNO[15]  (.A(
        \whitening_0/counter[15]_net_1 ), .B(\whitening_0/N_51 ), .C(
        output_signal_c), .Y(\whitening_0/counter_n15 ));
    DFN1P0 \data_source_0/state[111]  (.D(\data_source_0/state_6[111] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[111]_net_1 ));
    NOR2B \data_source_0/state_RNO[32]  (.A(output_signal_c), .B(
        \data_source_0/N_183 ), .Y(\data_source_0/state_6[32] ));
    AND3 \whitening_0/un2_output_counter_1_I_18  (.A(
        \whitening_0/output_counter[3]_net_1 ), .B(
        \whitening_0/output_counter[4]_net_1 ), .C(
        \whitening_0/output_counter[5]_net_1 ), .Y(
        \whitening_0/DWACT_FINC_E[2] ));
    DFN1C0 \data_source_0/state[29]  (.D(\data_source_0/state_6[29] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[29]_net_1 ));
    IOPAD_IN \reset_pad/U0/U0  (.PAD(reset), .Y(\reset_pad/U0/NET1 ));
    OR2A \whitening_0/counter_RNIDSCQ3[12]  (.A(
        \whitening_0/counter[12]_net_1 ), .B(\whitening_0/N_47 ), .Y(
        \whitening_0/N_48 ));
    OR2A \data_source_0/state_RNO[75]  (.A(output_signal_c), .B(
        \data_source_0/N_226 ), .Y(\data_source_0/state_6[75] ));
    NOR2B \data_source_0/state_RNO[82]  (.A(output_signal_c), .B(
        \data_source_0/N_233 ), .Y(\data_source_0/state_6[82] ));
    NOR2B \modulator_0/counter_RNI1ROV[5]  (.A(
        \modulator_0/counter[5]_net_1 ), .B(
        \modulator_0/counter[4]_net_1 ), .Y(\modulator_0/N_123_1 ));
    NOR2B \data_source_0/counter_RNID8EJ[7]  (.A(
        \data_source_0/counter_i_0[8] ), .B(
        \data_source_0/counter_i_0[7] ), .Y(
        \data_source_0/counter23_0_a2_0_2 ));
    DFN1C0 \data_source_0/state[82]  (.D(\data_source_0/state_6[82] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[82]_net_1 ));
    DFN1P0 \data_source_0/state[119]  (.D(\data_source_0/state_6[119] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[119]_net_1 ));
    AO1B \modulator_0/counter_RNISQHA3[0]  (.A(
        \modulator_0/counter_0_sqmuxa_i_a2_0 ), .B(\modulator_0/N_151 )
        , .C(trigger_signal_c), .Y(\modulator_0/N_8 ));
    OR2A \data_source_0/state_RNO[33]  (.A(output_signal_c), .B(
        \data_source_0/N_184 ), .Y(\data_source_0/state_6[33] ));
    XOR2 \main_clock_0/un5_counter_1_I_9  (.A(\main_clock_0/N_6 ), .B(
        \main_clock_0/counter[3]_net_1 ), .Y(\main_clock_0/I_9 ));
    AND3 \two_mhz_clock_0/un5_counter_I_8  (.A(
        \two_mhz_clock_0/counter[0]_net_1 ), .B(
        \two_mhz_clock_0/counter[1]_net_1 ), .C(
        \two_mhz_clock_0/counter[2]_net_1 ), .Y(\two_mhz_clock_0/N_10 )
        );
    OR2A \data_source_0/state_RNO[49]  (.A(output_signal_c), .B(
        \data_source_0/N_200 ), .Y(\data_source_0/state_6[49] ));
    MX2 \data_source_0/state_RNO_0[41]  (.A(
        \data_source_0/state[41]_net_1 ), .B(
        \data_source_0/state[40]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_192 ));
    DFN1C0 \whitening_0/counter[9]  (.D(\whitening_0/counter_n9 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \whitening_0/counter[9]_net_1 ));
    NOR3A \data_source_0/counter_RNIM7TA[15]  (.A(
        \data_source_0/counter_i_0[1] ), .B(
        \data_source_0/counter[15]_net_1 ), .C(
        \data_source_0/counter[11]_net_1 ), .Y(
        \data_source_0/counter23_0_a2_0_6 ));
    NOR3B \whitening_0/output_counter_RNIGGEO1[1]  (.A(
        \whitening_0/output_counter[4]_net_1 ), .B(
        \whitening_0/output_counter17_7 ), .C(
        \whitening_0/output_counter[1]_net_1 ), .Y(
        \whitening_0/output_counter17_11 ));
    OR2A \data_source_0/state_RNO[83]  (.A(output_signal_c), .B(
        \data_source_0/N_234 ), .Y(\data_source_0/state_6[83] ));
    DFN1C0 \data_source_0/state[15]  (.D(\data_source_0/state_6[15] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[15]_net_1 ));
    XOR2 \whitening_0/un2_output_counter_1_I_14  (.A(
        \whitening_0/N_12 ), .B(\whitening_0/output_counter[5]_net_1 ), 
        .Y(\whitening_0/I_14_1 ));
    DFN1P0 \data_source_0/state[83]  (.D(\data_source_0/state_6[83] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[83]_net_1 ));
    DFN1C0 \data_source_0/state[64]  (.D(\data_source_0/state_6[64] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[64]_net_1 ));
    MX2 \data_source_0/state_RNO_0[99]  (.A(
        \data_source_0/state[99]_net_1 ), .B(
        \data_source_0/state[98]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_250 ));
    XOR2 \two_mhz_clock_0/un5_counter_I_20  (.A(\two_mhz_clock_0/N_6 ), 
        .B(\two_mhz_clock_0/counter[7]_net_1 ), .Y(
        \two_mhz_clock_0/I_20_0 ));
    NOR2B \data_source_0/state_RNO[60]  (.A(output_signal_c), .B(
        \data_source_0/N_211 ), .Y(\data_source_0/state_6[60] ));
    AND3 \two_mhz_clock_0/un5_counter_I_10  (.A(
        \two_mhz_clock_0/counter[0]_net_1 ), .B(
        \two_mhz_clock_0/counter[1]_net_1 ), .C(
        \two_mhz_clock_0/counter[2]_net_1 ), .Y(
        \two_mhz_clock_0/DWACT_FINC_E[0] ));
    DFN1E1C0 \modulator_0/clock_counter[2]  (.D(\modulator_0/N_29 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(
        \modulator_0/clock_countere ), .Q(
        \modulator_0/clock_counter[2]_net_1 ));
    NOR2B \modulator_0/counter_RNO_0[5]  (.A(
        \modulator_0/counter[4]_net_1 ), .B(\modulator_0/counter_c3 ), 
        .Y(\modulator_0/counter_44_0 ));
    DFN1C0 \main_clock_0/counter[1]  (.D(\main_clock_0/I_5 ), .CLK(GLA)
        , .CLR(reset_c), .Q(\main_clock_0/counter[1]_net_1 ));
    XAI1 \dbpsk_modulator_0/counter_RNO[2]  (.A(
        \dbpsk_modulator_0/counter_i_0[2] ), .B(
        \dbpsk_modulator_0/N_29 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/N_23 ));
    NOR3A \whitening_0/output_whitening_RNO_5  (.A(
        \whitening_0/output_counter17_2 ), .B(
        \whitening_0/output_counter[2]_net_1 ), .C(
        \whitening_0/output_counter[5]_net_1 ), .Y(
        \whitening_0/output_counter21_9 ));
    NOR2B \data_source_0/state_RNO[3]  (.A(output_signal_c), .B(
        \data_source_0/N_154 ), .Y(\data_source_0/state_6[3] ));
    OR2B \modulator_0/clock_counter_RNIFVF2[1]  (.A(
        \modulator_0/clock_counter[1]_net_1 ), .B(
        \modulator_0/clock_counter[0]_net_1 ), .Y(\modulator_0/N_39 ));
    DFN1P0 \data_source_0/state[49]  (.D(\data_source_0/state_6[49] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[49]_net_1 ));
    NOR2B \data_source_0/state_RNO[136]  (.A(output_signal_c), .B(
        \data_source_0/N_287 ), .Y(\data_source_0/state_6[136] ));
    XA1A \modulator_0/clock_counter_RNO[7]  (.A(\modulator_0/un6lto7 ), 
        .B(\modulator_0/N_53 ), .C(trigger_signal_c), .Y(
        \modulator_0/N_19 ));
    MX2 \data_source_0/state_RNO_0[143]  (.A(
        \data_source_0/state[143]_net_1 ), .B(
        \data_source_0/state[142]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_294 ));
    NOR2B \data_source_0/state_RNO[62]  (.A(output_signal_c), .B(
        \data_source_0/N_213 ), .Y(\data_source_0/state_6[62] ));
    OR2A \modulator_0/clock_counter_RNI6GO8[6]  (.A(
        \modulator_0/clock_counter[6]_net_1 ), .B(\modulator_0/N_43 ), 
        .Y(\modulator_0/N_53 ));
    XA1A \dbpsk_modulator_0/counter_RNO[12]  (.A(
        \dbpsk_modulator_0/counter[12]_net_1 ), .B(
        \dbpsk_modulator_0/N_39 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/counter_n12 ));
    OR3A \dbpsk_modulator_0/counter_RNILJI8[3]  (.A(
        \dbpsk_modulator_0/counter[4]_net_1 ), .B(
        \dbpsk_modulator_0/counter_i_0[3] ), .C(
        \dbpsk_modulator_0/N_30 ), .Y(\dbpsk_modulator_0/N_32 ));
    NOR3C \data_source_0/counter_RNIKAS61[6]  (.A(
        \data_source_0/counter_i_0[3] ), .B(
        \data_source_0/counter_i_0[6] ), .C(
        \data_source_0/counter23_0_a2_0_2 ), .Y(
        \data_source_0/counter23_0_a2_0_7 ));
    DFN1E1C0 \modulator_0/clock_counter[11]  (.D(
        \modulator_0/clock_counter_n11 ), .CLK(ref_signal_c), .CLR(
        reset_c), .E(\modulator_0/clock_countere ), .Q(
        \modulator_0/un6lto11 ));
    DFN1C0 \two_mhz_clock_0/counter[4]  (.D(
        \two_mhz_clock_0/counter_3[4] ), .CLK(GLA), .CLR(reset_c), .Q(
        \two_mhz_clock_0/counter[4]_net_1 ));
    MX2 \data_source_0/state_RNO_0[22]  (.A(
        \data_source_0/state[22]_net_1 ), .B(
        \data_source_0/state[21]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_173 ));
    NOR3A \dbpsk_modulator_0/counter_RNO[4]  (.A(
        \dbpsk_modulator_0/N_32 ), .B(\dbpsk_modulator_0/N_106 ), .C(
        \dbpsk_modulator_0/counter_n4_i_0 ), .Y(
        \dbpsk_modulator_0/N_19 ));
    MX2 \data_source_0/state_RNO_0[38]  (.A(
        \data_source_0/state[38]_net_1 ), .B(
        \data_source_0/state[37]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_189 ));
    NOR2B \data_source_0/state_RNO[5]  (.A(output_signal_c), .B(
        \data_source_0/N_156 ), .Y(\data_source_0/state_6[5] ));
    MX2 \data_source_0/state_RNO_0[82]  (.A(
        \data_source_0/state[82]_net_1 ), .B(
        \data_source_0/state[81]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_233 ));
    XOR2 \whitening_0/un2_output_counter_1_I_9  (.A(\whitening_0/N_14 )
        , .B(\whitening_0/output_counter[3]_net_1 ), .Y(
        \whitening_0/I_9_1 ));
    NOR2B \data_source_0/state_RNO[63]  (.A(output_signal_c), .B(
        \data_source_0/N_214 ), .Y(\data_source_0/state_6[63] ));
    NOR2B \data_source_0/state_RNO[14]  (.A(output_signal_c), .B(
        \data_source_0/N_165 ), .Y(\data_source_0/state_6[14] ));
    NOR2B \modulator_0/output_signal_RNO_5  (.A(\modulator_0/un6lto11 )
        , .B(\modulator_0/un6lto12 ), .Y(\modulator_0/N_147 ));
    AX1C \two_mhz_clock_0/un5_counter_I_26  (.A(
        \two_mhz_clock_0/counter[8]_net_1 ), .B(
        \two_mhz_clock_0/DWACT_FINC_E[4] ), .C(
        \two_mhz_clock_0/counter[9]_net_1 ), .Y(\two_mhz_clock_0/I_26 )
        );
    DFN1P0 \data_source_0/state[132]  (.D(\data_source_0/state_6[132] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[132]_net_1 ));
    XOR2 \whitening_0/un2_output_counter_1_I_37  (.A(\whitening_0/N_4 )
        , .B(\whitening_0/output_counter[13]_net_1 ), .Y(
        \whitening_0/I_37 ));
    AND3 \two_mhz_clock_0/un5_counter_I_16  (.A(
        \two_mhz_clock_0/DWACT_FINC_E[0] ), .B(
        \two_mhz_clock_0/DWACT_FINC_E[1] ), .C(
        \two_mhz_clock_0/counter[5]_net_1 ), .Y(\two_mhz_clock_0/N_7 ));
    NOR3B \modulator_0/clock_counter_RNO[8]  (.A(\modulator_0/N_46 ), 
        .B(trigger_signal_c), .C(\modulator_0/N_137 ), .Y(
        \modulator_0/N_17 ));
    DFN1C0 \data_source_0/counter[5]  (.D(\data_source_0/N_18 ), .CLK(
        ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/counter[5]_net_1 ));
    DFN1C0 \whitening_0/counter[5]  (.D(\whitening_0/N_17 ), .CLK(
        ref_signal_c), .CLR(reset_c), .Q(
        \whitening_0/counter[5]_net_1 ));
    MX2 \data_source_0/state_RNO_0[2]  (.A(
        \data_source_0/state[2]_net_1 ), .B(
        \data_source_0/state[1]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_153 ));
    DFN0E1C0 \whitening_0/output_counter[2]  (.D(\whitening_0/I_7_1 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[2]_net_1 ));
    NOR2B \data_source_0/state_RNO[50]  (.A(output_signal_c), .B(
        \data_source_0/N_201 ), .Y(\data_source_0/state_6[50] ));
    NOR2 \two_mhz_clock_0/counter_RNIJDL4[11]  (.A(
        \two_mhz_clock_0/counter[11]_net_1 ), .B(
        \two_mhz_clock_0/counter[10]_net_1 ), .Y(
        \two_mhz_clock_0/counter14_0 ));
    OR2A \whitening_0/counter_RNI8VOF3[11]  (.A(
        \whitening_0/counter[11]_net_1 ), .B(\whitening_0/N_46 ), .Y(
        \whitening_0/N_47 ));
    NOR2 \whitening_0/output_counter_RNIAPA3[11]  (.A(
        \whitening_0/output_counter[11]_net_1 ), .B(
        \whitening_0/output_counter[13]_net_1 ), .Y(
        \whitening_0/output_counter17_1 ));
    DFN1C0 \dbpsk_modulator_0/counter[0]  (.D(
        \dbpsk_modulator_0/counter_n0 ), .CLK(ref_signal_c), .CLR(
        reset_c), .Q(\dbpsk_modulator_0/counter[0]_net_1 ));
    NOR3C \whitening_0/output_whitening_RNO_2  (.A(
        \whitening_0/output_counter17_1 ), .B(
        \whitening_0/output_counter17_0 ), .C(
        \whitening_0/output_counter21_9 ), .Y(
        \whitening_0/output_counter21_12 ));
    DFN1C0 \two_mhz_clock_0/counter[10]  (.D(\two_mhz_clock_0/I_28 ), 
        .CLK(GLA), .CLR(reset_c), .Q(
        \two_mhz_clock_0/counter[10]_net_1 ));
    NOR2B \whitening_0/state_RNO[2]  (.A(output_signal_c), .B(
        \whitening_0/state[1]_net_1 ), .Y(\whitening_0/state_22[2] ));
    IOPAD_IN \trigger_signal_pad/U0/U0  (.PAD(trigger_signal), .Y(
        \trigger_signal_pad/U0/NET1 ));
    OR2A \whitening_0/counter_RNIRU9M1[5]  (.A(
        \whitening_0/counter[5]_net_1 ), .B(\whitening_0/N_40 ), .Y(
        \whitening_0/N_41 ));
    NOR2B \data_source_0/state_RNO[52]  (.A(output_signal_c), .B(
        \data_source_0/N_203 ), .Y(\data_source_0/state_6[52] ));
    NOR2 \dbpsk_modulator_0/output_dbpsk_RNO_3  (.A(
        \dbpsk_modulator_0/counter[4]_net_1 ), .B(
        \dbpsk_modulator_0/counter[5]_net_1 ), .Y(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a3_0 ));
    AND2 \two_mhz_clock_0/un5_counter_I_21  (.A(
        \two_mhz_clock_0/counter[6]_net_1 ), .B(
        \two_mhz_clock_0/counter[7]_net_1 ), .Y(
        \two_mhz_clock_0/DWACT_FINC_E[3] ));
    PLLBA \pll_core_0/Core  (.CLKA(clock_c), .EXTFB(GND), .POWERDOWN(
        VCC), .GLA(GLA), .LOCK(), .GLB(), .YB(), .GLC(), .YC(), 
        .OADIV0(GND), .OADIV1(GND), .OADIV2(GND), .OADIV3(GND), 
        .OADIV4(GND), .OAMUX0(GND), .OAMUX1(GND), .OAMUX2(VCC), 
        .DLYGLA0(GND), .DLYGLA1(GND), .DLYGLA2(GND), .DLYGLA3(GND), 
        .DLYGLA4(GND), .OBDIV0(AFLSDF_GND), .OBDIV1(AFLSDF_GND), 
        .OBDIV2(AFLSDF_GND), .OBDIV3(AFLSDF_GND), .OBDIV4(AFLSDF_GND), 
        .OBMUX0(AFLSDF_GND), .OBMUX1(AFLSDF_GND), .OBMUX2(AFLSDF_GND), 
        .DLYYB0(AFLSDF_GND), .DLYYB1(AFLSDF_GND), .DLYYB2(AFLSDF_GND), 
        .DLYYB3(AFLSDF_GND), .DLYYB4(AFLSDF_GND), .DLYGLB0(AFLSDF_GND), 
        .DLYGLB1(AFLSDF_GND), .DLYGLB2(AFLSDF_GND), .DLYGLB3(
        AFLSDF_GND), .DLYGLB4(AFLSDF_GND), .OCDIV0(AFLSDF_GND), 
        .OCDIV1(AFLSDF_GND), .OCDIV2(AFLSDF_GND), .OCDIV3(AFLSDF_GND), 
        .OCDIV4(AFLSDF_GND), .OCMUX0(AFLSDF_GND), .OCMUX1(AFLSDF_GND), 
        .OCMUX2(AFLSDF_GND), .DLYYC0(AFLSDF_GND), .DLYYC1(AFLSDF_GND), 
        .DLYYC2(AFLSDF_GND), .DLYYC3(AFLSDF_GND), .DLYYC4(AFLSDF_GND), 
        .DLYGLC0(AFLSDF_GND), .DLYGLC1(AFLSDF_GND), .DLYGLC2(
        AFLSDF_GND), .DLYGLC3(AFLSDF_GND), .DLYGLC4(AFLSDF_GND), 
        .FINDIV0(VCC), .FINDIV1(VCC), .FINDIV2(GND), .FINDIV3(GND), 
        .FINDIV4(GND), .FINDIV5(GND), .FINDIV6(GND), .FBDIV0(VCC), 
        .FBDIV1(VCC), .FBDIV2(GND), .FBDIV3(GND), .FBDIV4(VCC), 
        .FBDIV5(GND), .FBDIV6(GND), .FBDLY0(GND), .FBDLY1(GND), 
        .FBDLY2(GND), .FBDLY3(GND), .FBDLY4(GND), .FBSEL0(VCC), 
        .FBSEL1(GND), .XDLYSEL(GND), .VCOSEL0(GND), .VCOSEL1(GND), 
        .VCOSEL2(VCC));
    DFN1C0 \data_source_0/state[4]  (.D(\data_source_0/state_6[4] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[4]_net_1 ));
    MX2 \data_source_0/state_RNO_0[111]  (.A(
        \data_source_0/state[111]_net_1 ), .B(
        \data_source_0/state[110]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_262 ));
    NOR2B \data_source_0/state_RNO[34]  (.A(output_signal_c), .B(
        \data_source_0/N_185 ), .Y(\data_source_0/state_6[34] ));
    DFN1C0 \data_source_0/state[130]  (.D(\data_source_0/state_6[130] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[130]_net_1 ));
    MX2 \data_source_0/state_RNO_0[53]  (.A(
        \data_source_0/state[53]_net_1 ), .B(
        \data_source_0/state[52]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_204 ));
    MX2 \data_source_0/state_RNO_0[97]  (.A(
        \data_source_0/state[97]_net_1 ), .B(
        \data_source_0/state[96]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_248 ));
    MX2 \data_source_0/state_RNO_0[103]  (.A(
        \data_source_0/state[103]_net_1 ), .B(
        \data_source_0/state[102]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_254 ));
    DFN1E1C0 \modulator_0/clock_counter[13]  (.D(
        \modulator_0/clock_counter_n13 ), .CLK(ref_signal_c), .CLR(
        reset_c), .E(\modulator_0/clock_countere ), .Q(
        \modulator_0/clock_counter[13]_net_1 ));
    DFN1C0 \data_source_0/state[90]  (.D(\data_source_0/state_6[90] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[90]_net_1 ));
    IOPAD_TRI \RSS_EN_pad/U0/U0  (.D(\RSS_EN_pad/U0/NET1 ), .E(
        \RSS_EN_pad/U0/NET2 ), .PAD(RSS_EN));
    NOR2B \data_source_0/state_RNO[84]  (.A(output_signal_c), .B(
        \data_source_0/N_235 ), .Y(\data_source_0/state_6[84] ));
    DFN1C0 \data_source_0/state[70]  (.D(\data_source_0/state_6[70] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[70]_net_1 ));
    NOR2B \data_source_0/state_RNO[53]  (.A(output_signal_c), .B(
        \data_source_0/N_204 ), .Y(\data_source_0/state_6[53] ));
    NOR2B \data_source_0/state_RNO[133]  (.A(output_signal_c), .B(
        \data_source_0/N_284 ), .Y(\data_source_0/state_6[133] ));
    NOR2B \data_source_0/state_RNO[118]  (.A(output_signal_c), .B(
        \data_source_0/N_269 ), .Y(\data_source_0/state_6[118] ));
    DFN1C0 \data_source_0/state[84]  (.D(\data_source_0/state_6[84] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[84]_net_1 ));
    DFN1C0 \data_source_0/state[66]  (.D(\data_source_0/state_6[66] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[66]_net_1 ));
    OR3 \modulator_0/output_signal_RNO_4  (.A(
        \modulator_0/clock_counter[14]_net_1 ), .B(
        \modulator_0/clock_counter[15]_net_1 ), .C(
        \modulator_0/N_36_3 ), .Y(
        \modulator_0/output_signal_1_sqmuxa_i_1 ));
    DFN1C0 \data_source_0/counter[12]  (.D(\data_source_0/counter_n12 )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/counter[12]_net_1 ));
    MX2 \data_source_0/state_RNO_0[74]  (.A(
        \data_source_0/state[74]_net_1 ), .B(
        \data_source_0/state[73]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_225 ));
    MX2 \data_source_0/state_RNO_0[56]  (.A(
        \data_source_0/state[56]_net_1 ), .B(
        \data_source_0/state[55]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_207 ));
    XAI1 \whitening_0/counter_RNO[7]  (.A(\whitening_0/counter_i_0[7] )
        , .B(\whitening_0/N_42 ), .C(output_signal_c), .Y(
        \whitening_0/N_13_0 ));
    DFN1C0 \data_source_0/state[92]  (.D(\data_source_0/state_6[92] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[92]_net_1 ));
    IOPAD_TRI \ref_signal_pad/U0/U0  (.D(\ref_signal_pad/U0/NET1 ), .E(
        \ref_signal_pad/U0/NET2 ), .PAD(ref_signal));
    DFN1C0 \data_source_0/state[72]  (.D(\data_source_0/state_6[72] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[72]_net_1 ));
    MX2 \data_source_0/state_RNO_0[70]  (.A(
        \data_source_0/state[70]_net_1 ), .B(
        \data_source_0/state[69]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_221 ));
    DFN1C0 \data_source_0/state[38]  (.D(\data_source_0/state_6[38] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[38]_net_1 ));
    DFN1C0 \data_source_0/state[131]  (.D(\data_source_0/state_6[131] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[131]_net_1 ));
    NOR2B \data_source_0/state_RNO[8]  (.A(output_signal_c), .B(
        \data_source_0/N_159 ), .Y(\data_source_0/state_6[8] ));
    NOR3B \modulator_0/output_signal_RNO_6  (.A(
        \modulator_0/output_signal_1_sqmuxa_i_a2_2_0 ), .B(
        \modulator_0/un6lto12 ), .C(\modulator_0/N_47 ), .Y(
        \modulator_0/N_148 ));
    DFN1P0 \data_source_0/state[93]  (.D(\data_source_0/state_6[93] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[93]_net_1 ));
    NOR2B \data_source_0/state_RNO[120]  (.A(output_signal_c), .B(
        \data_source_0/N_271 ), .Y(\data_source_0/state_6[120] ));
    DFN1C0 \data_source_0/state[139]  (.D(\data_source_0/state_6[139] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[139]_net_1 ));
    NOR2B \whitening_0/state_RNO[4]  (.A(\whitening_0/state[3]_net_1 ), 
        .B(output_signal_c), .Y(\whitening_0/N_28 ));
    DFN1P0 \data_source_0/state[73]  (.D(\data_source_0/state_6[73] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[73]_net_1 ));
    NOR3 \modulator_0/counter_RNIQ0LF1[1]  (.A(
        \modulator_0/counter[3]_net_1 ), .B(
        \modulator_0/counter[2]_net_1 ), .C(
        \modulator_0/counter[1]_net_1 ), .Y(\modulator_0/N_151 ));
    OR2A \modulator_0/clock_counter_RNO_0[10]  (.A(
        \modulator_0/clock_counter[9]_net_1 ), .B(\modulator_0/N_46 ), 
        .Y(\modulator_0/N_61 ));
    MX2 \data_source_0/state_RNO_0[121]  (.A(
        \data_source_0/state[121]_net_1 ), .B(
        \data_source_0/state[120]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_272 ));
    NOR2B \data_source_0/state_RNO[64]  (.A(output_signal_c), .B(
        \data_source_0/N_215 ), .Y(\data_source_0/state_6[64] ));
    NOR2B \data_source_0/state_RNO[16]  (.A(output_signal_c), .B(
        \data_source_0/N_167 ), .Y(\data_source_0/state_6[16] ));
    DFN1C0 \main_clock_0/clock_out  (.D(
        \main_clock_0/clock_out_RNO_net_1 ), .CLK(GLA), .CLR(reset_c), 
        .Q(\main_clock_0/clock_out_i ));
    NOR3C \dbpsk_modulator_0/counter_RNO_0[4]  (.A(
        \dbpsk_modulator_0/counter_i_0[1] ), .B(
        \dbpsk_modulator_0/counter[5]_net_1 ), .C(
        \dbpsk_modulator_0/N_123 ), .Y(\dbpsk_modulator_0/N_106 ));
    DFN1C0 \data_source_0/state[123]  (.D(\data_source_0/state_6[123] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[123]_net_1 ));
    DFN1E1C0 \modulator_0/clock_counter[3]  (.D(\modulator_0/N_27 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(
        \modulator_0/clock_countere ), .Q(
        \modulator_0/clock_counter[3]_net_1 ));
    NOR2B \data_source_0/state_RNO[115]  (.A(output_signal_c), .B(
        \data_source_0/N_266 ), .Y(\data_source_0/state_6[115] ));
    AOI1B \whitening_0/output_whitening_RNO_0  (.A(
        \whitening_0/output_counter21_13 ), .B(
        \whitening_0/output_counter21_12 ), .C(output_signal_c), .Y(
        \whitening_0/output_whitening_1_sqmuxa ));
    DFN1C0 \data_source_0/counter[11]  (.D(\data_source_0/counter_n11 )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/counter[11]_net_1 ));
    NOR3 \main_clock_0/counter_RNIFVEB1[7]  (.A(
        \main_clock_0/counter[6]_net_1 ), .B(
        \main_clock_0/counter[7]_net_1 ), .C(
        \main_clock_0/counter[3]_net_1 ), .Y(
        \main_clock_0/counter14_3 ));
    AND2 AND2_0 (.A(ref_signal_c), .B(output_data_rate_c), .Y(AND2_0_Y)
        );
    OR2A \modulator_0/clock_counter_RNIO0O3[2]  (.A(
        \modulator_0/clock_counter[2]_net_1 ), .B(\modulator_0/N_39 ), 
        .Y(\modulator_0/N_40 ));
    NOR2B \data_source_0/state_RNO[117]  (.A(output_signal_c), .B(
        \data_source_0/N_268 ), .Y(\data_source_0/state_6[117] ));
    DFN1C0 \dbpsk_modulator_0/counter[11]  (.D(
        \dbpsk_modulator_0/counter_n11 ), .CLK(ref_signal_c), .CLR(
        reset_c), .Q(\dbpsk_modulator_0/counter[11]_net_1 ));
    DFN1C0 \data_source_0/state[106]  (.D(\data_source_0/state_6[106] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[106]_net_1 ));
    DFN1C0 \data_source_0/counter[0]  (.D(\data_source_0/counter_n0 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/counter[0]_net_1 ));
    NOR2B \data_source_0/state_RNO[21]  (.A(output_signal_c), .B(
        \data_source_0/N_172 ), .Y(\data_source_0/state_6[21] ));
    DFN1C0 \modulator_0/counter[1]  (.D(\modulator_0/N_5 ), .CLK(
        ref_signal_c), .CLR(reset_c), .Q(
        \modulator_0/counter[1]_net_1 ));
    MX2 \data_source_0/state_RNO_0[136]  (.A(
        \data_source_0/state[136]_net_1 ), .B(
        \data_source_0/state[135]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_287 ));
    NOR2B \data_source_0/state_RNO[27]  (.A(output_signal_c), .B(
        \data_source_0/N_178 ), .Y(\data_source_0/state_6[27] ));
    IOPAD_TRI \clock_out_pad/U0/U0  (.D(\clock_out_pad/U0/NET1 ), .E(
        \clock_out_pad/U0/NET2 ), .PAD(clock_out));
    MX2 \data_source_0/state_RNO_0[75]  (.A(
        \data_source_0/state[75]_net_1 ), .B(
        \data_source_0/state[74]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_226 ));
    OR2A \data_source_0/state_RNO[36]  (.A(output_signal_c), .B(
        \data_source_0/N_187 ), .Y(\data_source_0/state_6[36] ));
    AX1C \main_clock_0/clock_out_RNO  (.A(\main_clock_0/counter14_3 ), 
        .B(\main_clock_0/counter14_4 ), .C(\main_clock_0/clock_out_i ), 
        .Y(\main_clock_0/clock_out_RNO_net_1 ));
    XA1C \dbpsk_modulator_0/counter_RNO[5]  (.A(
        \dbpsk_modulator_0/counter[5]_net_1 ), .B(
        \dbpsk_modulator_0/N_32 ), .C(
        \dbpsk_modulator_0/counter_n5_i_0 ), .Y(
        \dbpsk_modulator_0/N_17 ));
    DFN1P0 \data_source_0/state[39]  (.D(\data_source_0/state_6[39] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[39]_net_1 ));
    NOR2B \data_source_0/state_RNO[86]  (.A(output_signal_c), .B(
        \data_source_0/N_237 ), .Y(\data_source_0/state_6[86] ));
    NOR2B \data_source_0/state_RNO[54]  (.A(output_signal_c), .B(
        \data_source_0/N_205 ), .Y(\data_source_0/state_6[54] ));
    NOR2B \modulator_0/counter_RNIT3LF1[0]  (.A(
        \modulator_0/counter[0]_net_1 ), .B(\modulator_0/N_123_1 ), .Y(
        \modulator_0/counter_0_sqmuxa_i_a2_0 ));
    MX2 \data_source_0/state_RNO_0[112]  (.A(
        \data_source_0/state[112]_net_1 ), .B(
        \data_source_0/state[111]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_263 ));
    DFN1C0 \data_source_0/state[86]  (.D(\data_source_0/state_6[86] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[86]_net_1 ));
    DFN1C0 \dbpsk_modulator_0/counter[14]  (.D(
        \dbpsk_modulator_0/counter_n14 ), .CLK(ref_signal_c), .CLR(
        reset_c), .Q(\dbpsk_modulator_0/counter[14]_net_1 ));
    XOR2 \whitening_0/un2_output_counter_1_I_40  (.A(\whitening_0/N_3 )
        , .B(\whitening_0/output_counter[14]_net_1 ), .Y(
        \whitening_0/I_40 ));
    XOR2 \whitening_0/un2_output_counter_1_I_20  (.A(
        \whitening_0/N_10 ), .B(\whitening_0/output_counter[7]_net_1 ), 
        .Y(\whitening_0/I_20_1 ));
    DFN1C0 \whitening_0/counter[12]  (.D(\whitening_0/counter_n12 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \whitening_0/counter[12]_net_1 ));
    MX2 \data_source_0/state_RNO_0[14]  (.A(
        \data_source_0/state[14]_net_1 ), .B(
        \data_source_0/state[13]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_165 ));
    OR2A \data_source_0/state_RNO[91]  (.A(output_signal_c), .B(
        \data_source_0/N_242 ), .Y(\data_source_0/state_6[91] ));
    AO1B \whitening_0/counter_RNI4KP75[4]  (.A(
        \whitening_0/state_1_sqmuxa_i_a3_1 ), .B(
        \whitening_0/counter_RNI3P3V3[2]_net_1 ), .C(output_signal_c), 
        .Y(\whitening_0/N_34 ));
    NOR2B \modulator_0/counter_RNIPIOV[1]  (.A(
        \modulator_0/counter[1]_net_1 ), .B(
        \modulator_0/counter[0]_net_1 ), .Y(\modulator_0/counter_c1 ));
    NOR2B \data_source_0/state_RNO[7]  (.A(output_signal_c), .B(
        \data_source_0/N_158 ), .Y(\data_source_0/state_6[7] ));
    MX2 \data_source_0/state_RNO_0[10]  (.A(
        \data_source_0/state[10]_net_1 ), .B(
        \data_source_0/state[9]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_161 ));
    DFN1C0 \data_source_0/counter[10]  (.D(\data_source_0/counter_n10 )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/counter[10]_net_1 ));
    OR2A \data_source_0/state_RNO[97]  (.A(output_signal_c), .B(
        \data_source_0/N_248 ), .Y(\data_source_0/state_6[97] ));
    DFN1C0 \data_source_0/state[8]  (.D(\data_source_0/state_6[8] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[8]_net_1 ));
    XAI1 \data_source_0/counter_RNO[2]  (.A(
        \data_source_0/counter_i_0[2] ), .B(\data_source_0/N_30 ), .C(
        output_signal_c), .Y(\data_source_0/N_24 ));
    MX2 \data_source_0/state_RNO_0[52]  (.A(
        \data_source_0/state[52]_net_1 ), .B(
        \data_source_0/state[51]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_203 ));
    XA1A \dbpsk_modulator_0/counter_RNO[14]  (.A(
        \dbpsk_modulator_0/counter[14]_net_1 ), .B(
        \dbpsk_modulator_0/N_41 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/counter_n14 ));
    XA1A \modulator_0/clock_counter_RNO[12]  (.A(
        \modulator_0/un6lto12 ), .B(\modulator_0/N_49 ), .C(
        trigger_signal_c), .Y(\modulator_0/clock_counter_n12 ));
    OR2A \data_source_0/state_RNO[111]  (.A(output_signal_c), .B(
        \data_source_0/N_262 ), .Y(\data_source_0/state_6[111] ));
    DFN1C0 \data_source_0/state[94]  (.D(\data_source_0/state_6[94] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[94]_net_1 ));
    OR2A \data_source_0/state_RNO[119]  (.A(output_signal_c), .B(
        \data_source_0/N_270 ), .Y(\data_source_0/state_6[119] ));
    DFN1C0 \data_source_0/state[74]  (.D(\data_source_0/state_6[74] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[74]_net_1 ));
    NOR2A \dbpsk_modulator_0/counter_RNO[0]  (.A(output_signal_c), .B(
        \dbpsk_modulator_0/counter[0]_net_1 ), .Y(
        \dbpsk_modulator_0/counter_n0 ));
    DFN1P0 \dbpsk_modulator_0/counter[1]  (.D(\dbpsk_modulator_0/N_25 )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \dbpsk_modulator_0/counter_i_0[1] ));
    DFN1P0 \data_source_0/state[65]  (.D(\data_source_0/state_6[65] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[65]_net_1 ));
    MX2 \data_source_0/state_RNO_0[91]  (.A(
        \data_source_0/state[91]_net_1 ), .B(
        \data_source_0/state[90]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_242 ));
    DFN0E1C0 \whitening_0/output_counter[8]  (.D(\whitening_0/I_23_0 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[8]_net_1 ));
    CLKIO \reset_pad/U0/U1  (.A(\reset_pad/U0/NET1 ), .Y(reset_c));
    NOR2B \data_source_0/state_RNO[66]  (.A(output_signal_c), .B(
        \data_source_0/N_217 ), .Y(\data_source_0/state_6[66] ));
    DFN1C0 \data_source_0/state[128]  (.D(\data_source_0/state_6[128] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[128]_net_1 ));
    NOR2B \data_source_0/state_RNO[138]  (.A(output_signal_c), .B(
        \data_source_0/N_289 ), .Y(\data_source_0/state_6[138] ));
    MX2 \data_source_0/state_RNO_0[69]  (.A(
        \data_source_0/state[69]_net_1 ), .B(
        \data_source_0/state[68]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_220 ));
    MX2 \data_source_0/state_RNO_0[122]  (.A(
        \data_source_0/state[122]_net_1 ), .B(
        \data_source_0/state[121]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_273 ));
    AOI1B \whitening_0/output_counter_RNO[5]  (.A(
        \whitening_0/output_counter17_13 ), .B(
        \whitening_0/output_counter17_12 ), .C(\whitening_0/I_14_1 ), 
        .Y(\whitening_0/output_counter_5[5] ));
    DFN1C0 \data_source_0/counter[15]  (.D(\data_source_0/counter_n15 )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/counter[15]_net_1 ));
    MX2 \data_source_0/state_RNO_0[43]  (.A(
        \data_source_0/state[43]_net_1 ), .B(
        \data_source_0/state[42]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_194 ));
    NOR2B \data_source_0/state_RNO[104]  (.A(output_signal_c), .B(
        \data_source_0/N_255 ), .Y(\data_source_0/state_6[104] ));
    AOI1B \two_mhz_clock_0/counter_RNO[1]  (.A(
        \two_mhz_clock_0/counter14_9 ), .B(
        \two_mhz_clock_0/counter14_8 ), .C(\two_mhz_clock_0/I_5_0 ), 
        .Y(\two_mhz_clock_0/counter_3[1] ));
    XA1A \modulator_0/clock_counter_RNO[5]  (.A(
        \modulator_0/clock_counter[5]_net_1 ), .B(\modulator_0/N_42 ), 
        .C(trigger_signal_c), .Y(\modulator_0/N_23 ));
    DFN1E1C0 \modulator_0/clock_counter[1]  (.D(\modulator_0/N_31 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(
        \modulator_0/clock_countere ), .Q(
        \modulator_0/clock_counter[1]_net_1 ));
    DFN0E1C0 \whitening_0/output_counter[12]  (.D(\whitening_0/I_35 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[12]_net_1 ));
    NOR3B \data_source_0/counter_RNIOBGB[14]  (.A(
        \data_source_0/counter_i_0[2] ), .B(
        \data_source_0/counter23_0_a2_0_4 ), .C(
        \data_source_0/counter[14]_net_1 ), .Y(
        \data_source_0/counter23_0_a2_0_8 ));
    DFN0E1C0 \whitening_0/output_counter[15]  (.D(\whitening_0/I_43 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[15]_net_1 ));
    AX1C \whitening_0/un2_output_counter_1_I_26  (.A(
        \whitening_0/output_counter[8]_net_1 ), .B(
        \whitening_0/DWACT_FINC_E[4] ), .C(
        \whitening_0/output_counter[9]_net_1 ), .Y(
        \whitening_0/I_26_0 ));
    NOR2B \data_source_0/state_RNO[15]  (.A(output_signal_c), .B(
        \data_source_0/N_166 ), .Y(\data_source_0/state_6[15] ));
    OR2A \modulator_0/clock_counter_RNIPAG7[5]  (.A(
        \modulator_0/clock_counter[5]_net_1 ), .B(\modulator_0/N_42 ), 
        .Y(\modulator_0/N_43 ));
    OR3 \modulator_0/clock_counter_RNI2305[2]  (.A(
        \modulator_0/clock_counter[3]_net_1 ), .B(
        \modulator_0/clock_counter[2]_net_1 ), .C(\modulator_0/N_51 ), 
        .Y(\modulator_0/N_55 ));
    MX2 \data_source_0/state_RNO_0[46]  (.A(
        \data_source_0/state[46]_net_1 ), .B(
        \data_source_0/state[45]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_197 ));
    MX2 \data_source_0/state_RNO_0[130]  (.A(
        \data_source_0/state[130]_net_1 ), .B(
        \data_source_0/state[129]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_281 ));
    MX2 \data_source_0/state_RNO_0[78]  (.A(
        \data_source_0/state[78]_net_1 ), .B(
        \data_source_0/state[77]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_229 ));
    MX2 \data_source_0/state_RNO_0[15]  (.A(
        \data_source_0/state[15]_net_1 ), .B(
        \data_source_0/state[14]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_166 ));
    AND3 \main_clock_0/un5_counter_1_I_8  (.A(
        \main_clock_0/counter[0]_net_1 ), .B(
        \main_clock_0/counter[1]_net_1 ), .C(
        \main_clock_0/counter[2]_net_1 ), .Y(\main_clock_0/N_6 ));
    XA1A \modulator_0/clock_counter_RNO[2]  (.A(
        \modulator_0/clock_counter[2]_net_1 ), .B(\modulator_0/N_39 ), 
        .C(trigger_signal_c), .Y(\modulator_0/N_29 ));
    XOR2 \two_mhz_clock_0/un5_counter_I_32  (.A(\two_mhz_clock_0/N_2 ), 
        .B(\two_mhz_clock_0/counter[11]_net_1 ), .Y(
        \two_mhz_clock_0/I_32 ));
    NOR3C \modulator_0/output_signal_RNO_9  (.A(
        \modulator_0/clock_counter[5]_net_1 ), .B(
        \modulator_0/clock_counter[4]_net_1 ), .C(
        \modulator_0/un6lto12 ), .Y(
        \modulator_0/output_signal_1_sqmuxa_i_a2_0_1 ));
    OR2A \data_source_0/state_RNO[135]  (.A(output_signal_c), .B(
        \data_source_0/N_286 ), .Y(\data_source_0/state_6[135] ));
    NOR3A \whitening_0/counter_RNO[5]  (.A(output_signal_c), .B(
        \whitening_0/N_114 ), .C(\whitening_0/N_66_i ), .Y(
        \whitening_0/N_17 ));
    NOR2B \data_source_0/state_RNO[56]  (.A(output_signal_c), .B(
        \data_source_0/N_207 ), .Y(\data_source_0/state_6[56] ));
    DFN1P0 \data_source_0/counter[7]  (.D(\data_source_0/N_14 ), .CLK(
        ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/counter_i_0[7] ));
    MX2 \data_source_0/state_RNO_0[117]  (.A(
        \data_source_0/state[117]_net_1 ), .B(
        \data_source_0/state[116]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_268 ));
    OR2A \data_source_0/state_RNO[137]  (.A(output_signal_c), .B(
        \data_source_0/N_288 ), .Y(\data_source_0/state_6[137] ));
    AND2 \whitening_0/un2_output_counter_1_I_15  (.A(
        \whitening_0/output_counter[3]_net_1 ), .B(
        \whitening_0/output_counter[4]_net_1 ), .Y(
        \whitening_0/DWACT_FINC_E[1] ));
    NOR3A \whitening_0/output_whitening_RNO_4  (.A(
        \whitening_0/output_counter21_7 ), .B(
        \whitening_0/output_counter[1]_net_1 ), .C(
        \whitening_0/output_counter[4]_net_1 ), .Y(
        \whitening_0/output_counter21_11 ));
    XOR2 \whitening_0/un2_output_counter_1_I_28  (.A(\whitening_0/N_7 )
        , .B(\whitening_0/output_counter[10]_net_1 ), .Y(
        \whitening_0/I_28_0 ));
    AX1D \data_source_0/counter_RNO_1[4]  (.A(
        \data_source_0/counter_i_0[3] ), .B(\data_source_0/N_31 ), .C(
        \data_source_0/counter[4]_net_1 ), .Y(\data_source_0/N_56_i ));
    OR2A \modulator_0/clock_counter_RNIPVCH1[13]  (.A(
        \modulator_0/clock_counter[13]_net_1 ), .B(\modulator_0/N_50 ), 
        .Y(\modulator_0/N_52 ));
    MX2 \data_source_0/state_RNO_0[141]  (.A(
        \data_source_0/state[141]_net_1 ), .B(
        \data_source_0/state[140]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_292 ));
    NOR2B \data_source_0/state_RNO[35]  (.A(output_signal_c), .B(
        \data_source_0/N_186 ), .Y(\data_source_0/state_6[35] ));
    XAI1 \data_source_0/counter_RNO[7]  (.A(
        \data_source_0/counter_i_0[7] ), .B(\data_source_0/N_35 ), .C(
        output_signal_c), .Y(\data_source_0/N_14 ));
    IOPAD_TRI \output_data_rate_pad/U0/U0  (.D(
        \output_data_rate_pad/U0/NET1 ), .E(
        \output_data_rate_pad/U0/NET2 ), .PAD(output_data_rate));
    MX2 \data_source_0/state_RNO_0[24]  (.A(
        \data_source_0/state[24]_net_1 ), .B(
        \data_source_0/state[23]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_175 ));
    OR2A \data_source_0/state_RNO[85]  (.A(output_signal_c), .B(
        \data_source_0/N_236 ), .Y(\data_source_0/state_6[85] ));
    DFN1C0 \data_source_0/state[96]  (.D(\data_source_0/state_6[96] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[96]_net_1 ));
    DFN1C0 \data_source_0/state[76]  (.D(\data_source_0/state_6[76] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[76]_net_1 ));
    MX2 \data_source_0/state_RNO_0[84]  (.A(
        \data_source_0/state[84]_net_1 ), .B(
        \data_source_0/state[83]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_235 ));
    DFN1P0 \data_source_0/state[85]  (.D(\data_source_0/state_6[85] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[85]_net_1 ));
    AND3 \whitening_0/un2_output_counter_1_I_24  (.A(
        \whitening_0/DWACT_FINC_E[0] ), .B(
        \whitening_0/DWACT_FINC_E[2] ), .C(
        \whitening_0/DWACT_FINC_E[3] ), .Y(
        \whitening_0/DWACT_FINC_E[4] ));
    MX2 \data_source_0/state_RNO_0[67]  (.A(
        \data_source_0/state[67]_net_1 ), .B(
        \data_source_0/state[66]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_218 ));
    AOI1B \whitening_0/output_counter_RNO[4]  (.A(
        \whitening_0/output_counter17_13 ), .B(
        \whitening_0/output_counter17_12 ), .C(\whitening_0/I_12_1 ), 
        .Y(\whitening_0/output_counter_5[4] ));
    MX2 \data_source_0/state_RNO_0[20]  (.A(
        \data_source_0/state[20]_net_1 ), .B(
        \data_source_0/state[19]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_171 ));
    AOI1B \two_mhz_clock_0/counter_RNO[4]  (.A(
        \two_mhz_clock_0/counter14_9 ), .B(
        \two_mhz_clock_0/counter14_8 ), .C(\two_mhz_clock_0/I_12_0 ), 
        .Y(\two_mhz_clock_0/counter_3[4] ));
    DFN0E1C0 \whitening_0/output_counter[3]  (.D(\whitening_0/I_9_1 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[3]_net_1 ));
    MX2 \data_source_0/state_RNO_0[80]  (.A(
        \data_source_0/state[80]_net_1 ), .B(
        \data_source_0/state[79]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_231 ));
    DFN1C0 \whitening_0/counter[10]  (.D(\whitening_0/counter_n10 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \whitening_0/counter[10]_net_1 ));
    DFN1C0 \data_source_0/state[104]  (.D(\data_source_0/state_6[104] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[104]_net_1 ));
    DFN1C0 \data_source_0/state[51]  (.D(\data_source_0/state_6[51] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[51]_net_1 ));
    NOR3C \data_source_0/counter_RNIS7K72[12]  (.A(
        \data_source_0/counter23_0_a2_0_8 ), .B(
        \data_source_0/counter23_0_a2_0_7 ), .C(
        \data_source_0/counter23_0_a2_0_9 ), .Y(\data_source_0/N_94 ));
    MX2 \data_source_0/state_RNO_0[134]  (.A(
        \data_source_0/state[134]_net_1 ), .B(
        \data_source_0/state[133]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_285 ));
    MX2 \data_source_0/state_RNO_0[127]  (.A(
        \data_source_0/state[127]_net_1 ), .B(
        \data_source_0/state[126]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_278 ));
    DFN1E1C0 \modulator_0/clock_counter[15]  (.D(
        \modulator_0/clock_counter_n15 ), .CLK(ref_signal_c), .CLR(
        reset_c), .E(\modulator_0/clock_countere ), .Q(
        \modulator_0/clock_counter[15]_net_1 ));
    XA1A \dbpsk_modulator_0/counter_RNO[9]  (.A(
        \dbpsk_modulator_0/counter[9]_net_1 ), .B(
        \dbpsk_modulator_0/N_36 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/counter_n9 ));
    DFN1P0 \data_source_0/state[57]  (.D(\data_source_0/state_6[57] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[57]_net_1 ));
    DFN1C0 \data_source_0/state[21]  (.D(\data_source_0/state_6[21] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[21]_net_1 ));
    NOR2 \data_source_0/counter_RNI3761[10]  (.A(
        \data_source_0/counter[13]_net_1 ), .B(
        \data_source_0/counter[10]_net_1 ), .Y(
        \data_source_0/counter23_0_a2_0_4 ));
    XOR2 \main_clock_0/un5_counter_1_I_17  (.A(\main_clock_0/N_3 ), .B(
        \main_clock_0/counter[6]_net_1 ), .Y(\main_clock_0/I_17 ));
    IOPAD_IN \clock_pad/U0/U0  (.PAD(clock), .Y(\clock_pad/U0/NET1 ));
    NOR2B \data_source_0/state_RNO[131]  (.A(output_signal_c), .B(
        \data_source_0/N_282 ), .Y(\data_source_0/state_6[131] ));
    DFN1P0 \whitening_0/counter[2]  (.D(\whitening_0/N_23 ), .CLK(
        ref_signal_c), .PRE(reset_c), .Q(\whitening_0/counter_i_0[2] ));
    OR2A \data_source_0/state_RNO[65]  (.A(output_signal_c), .B(
        \data_source_0/N_216 ), .Y(\data_source_0/state_6[65] ));
    DFN1C0 \data_source_0/state[27]  (.D(\data_source_0/state_6[27] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[27]_net_1 ));
    MX2 \data_source_0/state_RNO_0[18]  (.A(
        \data_source_0/state[18]_net_1 ), .B(
        \data_source_0/state[17]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_169 ));
    OR2A \data_source_0/state_RNO[41]  (.A(output_signal_c), .B(
        \data_source_0/N_192 ), .Y(\data_source_0/state_6[41] ));
    NOR2B \data_source_0/state_RNO[139]  (.A(output_signal_c), .B(
        \data_source_0/N_290 ), .Y(\data_source_0/state_6[139] ));
    NOR2B \modulator_0/output_signal_RNO_11  (.A(
        \modulator_0/clock_counter[8]_net_1 ), .B(
        \modulator_0/un6lto7 ), .Y(
        \modulator_0/output_signal_1_sqmuxa_i_a2_2_0 ));
    OR2A \modulator_0/clock_counter_RNI2305[3]  (.A(
        \modulator_0/clock_counter[3]_net_1 ), .B(\modulator_0/N_40 ), 
        .Y(\modulator_0/N_41 ));
    DFN1E1C0 \dbpsk_modulator_0/output_dbpsk  (.D(
        \dbpsk_modulator_0/output_dbpsk_5 ), .CLK(ref_signal_c), .CLR(
        reset_c), .E(\dbpsk_modulator_0/N_28 ), .Q(output_data_rate_c));
    MX2 \data_source_0/state_RNO_0[101]  (.A(
        \data_source_0/state[101]_net_1 ), .B(
        \data_source_0/state[100]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_252 ));
    OR2A \data_source_0/state_RNO[47]  (.A(output_signal_c), .B(
        \data_source_0/N_198 ), .Y(\data_source_0/state_6[47] ));
    NOR3A \whitening_0/counter_RNIVF9U[15]  (.A(
        \whitening_0/counter_i_0[1] ), .B(
        \whitening_0/counter[15]_net_1 ), .C(
        \whitening_0/counter[11]_net_1 ), .Y(
        \whitening_0/counter_n5_i_a2_0_6 ));
    MX2 \data_source_0/state_RNO_0[42]  (.A(
        \data_source_0/state[42]_net_1 ), .B(
        \data_source_0/state[41]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_193 ));
    NOR2B \data_source_0/state_RNO[122]  (.A(output_signal_c), .B(
        \data_source_0/N_273 ), .Y(\data_source_0/state_6[122] ));
    NOR2B \whitening_0/state_RNO[3]  (.A(output_signal_c), .B(
        \whitening_0/state[2]_net_1 ), .Y(\whitening_0/state_22[3] ));
    INV \two_mhz_clock_0/un5_counter_I_4  (.A(
        \two_mhz_clock_0/counter[0]_net_1 ), .Y(\two_mhz_clock_0/I_4 ));
    DFN1E1C0 \modulator_0/clock_counter[5]  (.D(\modulator_0/N_23 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(
        \modulator_0/clock_countere ), .Q(
        \modulator_0/clock_counter[5]_net_1 ));
    NOR2B \data_source_0/state_RNO[2]  (.A(output_signal_c), .B(
        \data_source_0/N_153 ), .Y(\data_source_0/state_6[2] ));
    NOR3A \main_clock_0/counter_RNI0BUP1[2]  (.A(
        \main_clock_0/counter14_2 ), .B(
        \main_clock_0/counter[2]_net_1 ), .C(
        \main_clock_0/counter[5]_net_1 ), .Y(
        \main_clock_0/counter14_4 ));
    DFN1P0 \data_source_0/state[41]  (.D(\data_source_0/state_6[41] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[41]_net_1 ));
    NOR2B \dbpsk_modulator_0/counter_RNI70E3[2]  (.A(
        \dbpsk_modulator_0/counter_i_0[2] ), .B(
        \dbpsk_modulator_0/counter_i_0[7] ), .Y(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_1 ));
    NOR2B \data_source_0/state_RNO[20]  (.A(output_signal_c), .B(
        \data_source_0/N_171 ), .Y(\data_source_0/state_6[20] ));
    MX2 \data_source_0/state_RNO_0[25]  (.A(
        \data_source_0/state[25]_net_1 ), .B(
        \data_source_0/state[24]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_176 ));
    AND3 \whitening_0/un2_output_counter_1_I_41  (.A(
        \whitening_0/output_counter[12]_net_1 ), .B(
        \whitening_0/output_counter[13]_net_1 ), .C(
        \whitening_0/output_counter[14]_net_1 ), .Y(
        \whitening_0/DWACT_FINC_E[9] ));
    DFN1P0 \data_source_0/state[47]  (.D(\data_source_0/state_6[47] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[47]_net_1 ));
    MX2 \data_source_0/state_RNO_0[85]  (.A(
        \data_source_0/state[85]_net_1 ), .B(
        \data_source_0/state[84]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_236 ));
    AND2 \whitening_0/un2_output_counter_1_I_21  (.A(
        \whitening_0/output_counter[6]_net_1 ), .B(
        \whitening_0/output_counter[7]_net_1 ), .Y(
        \whitening_0/DWACT_FINC_E[3] ));
    IOTRI_OB_EB \clock_out_pad/U0/U1  (.D(clock_out_c), .E(VCC), .DOUT(
        \clock_out_pad/U0/NET1 ), .EOUT(\clock_out_pad/U0/NET2 ));
    ULSICC_INT INT_ULSICC_INSTANCE_0 (.USTDBY(GND), .LPENA(GND));
    OR2A \data_source_0/counter_RNI3B613[9]  (.A(
        \data_source_0/counter[9]_net_1 ), .B(\data_source_0/N_37 ), 
        .Y(\data_source_0/N_38 ));
    DFN1C0 \modulator_0/counter[3]  (.D(\modulator_0/counter_n3 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \modulator_0/counter[3]_net_1 ));
    MX2 \data_source_0/state_RNO_0[139]  (.A(
        \data_source_0/state[139]_net_1 ), .B(
        \data_source_0/state[138]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_290 ));
    DFN1P0 \data_source_0/counter[2]  (.D(\data_source_0/N_24 ), .CLK(
        ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/counter_i_0[2] ));
    NOR3A \whitening_0/counter_RNO[4]  (.A(output_signal_c), .B(
        \whitening_0/N_115 ), .C(\whitening_0/N_65_i ), .Y(
        \whitening_0/N_19 ));
    XA1A \whitening_0/counter_RNO[12]  (.A(
        \whitening_0/counter[12]_net_1 ), .B(\whitening_0/N_47 ), .C(
        output_signal_c), .Y(\whitening_0/counter_n12 ));
    NOR2B \dbpsk_modulator_0/counter_RNIRPDV1[0]  (.A(
        \dbpsk_modulator_0/N_122 ), .B(
        \dbpsk_modulator_0/counter[0]_net_1 ), .Y(
        \dbpsk_modulator_0/N_123 ));
    OR3A \whitening_0/counter_RNI478D1[3]  (.A(
        \whitening_0/counter[4]_net_1 ), .B(
        \whitening_0/counter_i_0[3] ), .C(\whitening_0/N_38 ), .Y(
        \whitening_0/N_40 ));
    NOR2B \data_source_0/state_RNO[55]  (.A(output_signal_c), .B(
        \data_source_0/N_206 ), .Y(\data_source_0/state_6[55] ));
    MX2 \data_source_0/state_RNO_0[142]  (.A(
        \data_source_0/state[142]_net_1 ), .B(
        \data_source_0/state[141]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_293 ));
    NOR2B \data_source_0/state_RNO[22]  (.A(output_signal_c), .B(
        \data_source_0/N_173 ), .Y(\data_source_0/state_6[22] ));
    AND3 \two_mhz_clock_0/un5_counter_I_27  (.A(
        \two_mhz_clock_0/DWACT_FINC_E[4] ), .B(
        \two_mhz_clock_0/counter[8]_net_1 ), .C(
        \two_mhz_clock_0/counter[9]_net_1 ), .Y(\two_mhz_clock_0/N_3 ));
    NOR2B \data_source_0/state_RNO[90]  (.A(output_signal_c), .B(
        \data_source_0/N_241 ), .Y(\data_source_0/state_6[90] ));
    XOR2 \two_mhz_clock_0/un5_counter_I_17  (.A(\two_mhz_clock_0/N_7 ), 
        .B(\two_mhz_clock_0/counter[6]_net_1 ), .Y(
        \two_mhz_clock_0/I_17_0 ));
    DFN1C0 \dbpsk_modulator_0/counter[15]  (.D(
        \dbpsk_modulator_0/counter_n15 ), .CLK(ref_signal_c), .CLR(
        reset_c), .Q(\dbpsk_modulator_0/counter[15]_net_1 ));
    NOR2A \whitening_0/counter_RNO[0]  (.A(output_signal_c), .B(
        \whitening_0/counter[0]_net_1 ), .Y(\whitening_0/counter_n0 ));
    OR2A \dbpsk_modulator_0/counter_RNO_0[15]  (.A(
        \dbpsk_modulator_0/counter[14]_net_1 ), .B(
        \dbpsk_modulator_0/N_41 ), .Y(\dbpsk_modulator_0/N_42 ));
    NOR2B \data_source_0/state_RNO[78]  (.A(output_signal_c), .B(
        \data_source_0/N_229 ), .Y(\data_source_0/state_6[78] ));
    NOR2B \data_source_0/state_RNO[23]  (.A(output_signal_c), .B(
        \data_source_0/N_174 ), .Y(\data_source_0/state_6[23] ));
    XOR2 \main_clock_0/un5_counter_1_I_5  (.A(
        \main_clock_0/counter[0]_net_1 ), .B(
        \main_clock_0/counter[1]_net_1 ), .Y(\main_clock_0/I_5 ));
    OR2A \data_source_0/state_RNO[140]  (.A(output_signal_c), .B(
        \data_source_0/N_291 ), .Y(\data_source_0/state_6[140] ));
    OR2 \dbpsk_modulator_0/counter_RNIGL45[2]  (.A(
        \dbpsk_modulator_0/N_29 ), .B(
        \dbpsk_modulator_0/counter_i_0[2] ), .Y(
        \dbpsk_modulator_0/N_30 ));
    MX2 \data_source_0/state_RNO_0[39]  (.A(
        \data_source_0/state[39]_net_1 ), .B(
        \data_source_0/state[38]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_190 ));
    OR2A \dbpsk_modulator_0/counter_RNI32OP[10]  (.A(
        \dbpsk_modulator_0/counter[10]_net_1 ), .B(
        \dbpsk_modulator_0/N_37 ), .Y(\dbpsk_modulator_0/N_38 ));
    DFN1C0 \data_source_0/state[18]  (.D(\data_source_0/state_6[18] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[18]_net_1 ));
    DFN1E1C0 \whitening_0/state[1]  (.D(\whitening_0/state_22[1] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(\whitening_0/N_34 ), .Q(
        \whitening_0/state[1]_net_1 ));
    NOR2 \modulator_0/output_signal_RNO_13  (.A(\modulator_0/un6lto11 )
        , .B(\modulator_0/un6lto12 ), .Y(
        \modulator_0/output_signal_1_sqmuxa_i_a2_1 ));
    XA1A \modulator_0/clock_counter_RNO[11]  (.A(
        \modulator_0/un6lto11 ), .B(\modulator_0/N_48 ), .C(
        trigger_signal_c), .Y(\modulator_0/clock_counter_n11 ));
    NOR2B \data_source_0/state_RNO[92]  (.A(output_signal_c), .B(
        \data_source_0/N_243 ), .Y(\data_source_0/state_6[92] ));
    DFN1P0 \data_source_0/state[143]  (.D(\data_source_0/state_6[143] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[143]_net_1 ));
    DFN1P0 \data_source_0/state[95]  (.D(\data_source_0/state_6[95] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[95]_net_1 ));
    DFN1E1C0 \whitening_0/state[3]  (.D(\whitening_0/state_22[3] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(\whitening_0/N_34 ), .Q(
        \whitening_0/state[3]_net_1 ));
    DFN1P0 \data_source_0/state[75]  (.D(\data_source_0/state_6[75] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[75]_net_1 ));
    XAI1 \dbpsk_modulator_0/counter_RNO[7]  (.A(
        \dbpsk_modulator_0/counter_i_0[7] ), .B(
        \dbpsk_modulator_0/N_34 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/N_13 ));
    OR2A \data_source_0/state_RNO[93]  (.A(output_signal_c), .B(
        \data_source_0/N_244 ), .Y(\data_source_0/state_6[93] ));
    NOR2B \whitening_0/counter_RNIJK3I[7]  (.A(
        \whitening_0/counter_i_0[8] ), .B(\whitening_0/counter_i_0[7] )
        , .Y(\whitening_0/counter_n5_i_a2_0_2 ));
    MX2 \data_source_0/state_RNO_0[61]  (.A(
        \data_source_0/state[61]_net_1 ), .B(
        \data_source_0/state[60]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_212 ));
    DFN1C0 \data_source_0/state[125]  (.D(\data_source_0/state_6[125] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[125]_net_1 ));
    DFN1C0 \data_source_0/state[6]  (.D(\data_source_0/state_6[6] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[6]_net_1 ));
    AND2 \main_clock_0/un5_counter_1_I_15  (.A(
        \main_clock_0/counter[3]_net_1 ), .B(
        \main_clock_0/counter[4]_net_1 ), .Y(
        \main_clock_0/DWACT_FINC_E[1] ));
    OR2 \dbpsk_modulator_0/counter_RNIUL0C[6]  (.A(
        \dbpsk_modulator_0/N_33 ), .B(
        \dbpsk_modulator_0/counter_i_0[6] ), .Y(
        \dbpsk_modulator_0/N_34 ));
    AND3 \whitening_0/un2_output_counter_1_I_30  (.A(
        \whitening_0/DWACT_FINC_E[0] ), .B(
        \whitening_0/DWACT_FINC_E[2] ), .C(
        \whitening_0/DWACT_FINC_E[5] ), .Y(
        \whitening_0/DWACT_FINC_E[6] ));
    MX2 \data_source_0/state_RNO_0[9]  (.A(
        \data_source_0/state[9]_net_1 ), .B(
        \data_source_0/state[8]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_160 ));
    AND3 \whitening_0/un2_output_counter_1_I_13  (.A(
        \whitening_0/DWACT_FINC_E[0] ), .B(
        \whitening_0/output_counter[3]_net_1 ), .C(
        \whitening_0/output_counter[4]_net_1 ), .Y(\whitening_0/N_12 ));
    MX2 \data_source_0/state_RNO_0[102]  (.A(
        \data_source_0/state[102]_net_1 ), .B(
        \data_source_0/state[101]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_253 ));
    DFN1P0 \whitening_0/counter[8]  (.D(\whitening_0/N_11 ), .CLK(
        ref_signal_c), .PRE(reset_c), .Q(\whitening_0/counter_i_0[8] ));
    MX2 \data_source_0/state_RNO_0[93]  (.A(
        \data_source_0/state[93]_net_1 ), .B(
        \data_source_0/state[92]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_244 ));
    MX2 \data_source_0/state_RNO_0[28]  (.A(
        \data_source_0/state[28]_net_1 ), .B(
        \data_source_0/state[27]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_179 ));
    DFN1C0 \whitening_0/counter[13]  (.D(\whitening_0/counter_n13 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \whitening_0/counter[13]_net_1 ));
    NOR2A \two_mhz_clock_0/counter_RNIJI6U[0]  (.A(
        \two_mhz_clock_0/counter[0]_net_1 ), .B(
        \two_mhz_clock_0/counter[3]_net_1 ), .Y(
        \two_mhz_clock_0/counter14_5 ));
    OR2 \dbpsk_modulator_0/counter_RNIBSEF[8]  (.A(
        \dbpsk_modulator_0/N_35 ), .B(
        \dbpsk_modulator_0/counter_i_0[8] ), .Y(
        \dbpsk_modulator_0/N_36 ));
    MX2 \data_source_0/state_RNO_0[88]  (.A(
        \data_source_0/state[88]_net_1 ), .B(
        \data_source_0/state[87]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_239 ));
    DFN1P0 \data_source_0/state[127]  (.D(\data_source_0/state_6[127] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[127]_net_1 ));
    OR2A \dbpsk_modulator_0/counter_RNI9BEJ1[13]  (.A(
        \dbpsk_modulator_0/counter[13]_net_1 ), .B(
        \dbpsk_modulator_0/N_40 ), .Y(\dbpsk_modulator_0/N_41 ));
    DFN1C0 \whitening_0/counter[14]  (.D(\whitening_0/counter_n14 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \whitening_0/counter[14]_net_1 ));
    OR2A \data_source_0/state_RNO[79]  (.A(output_signal_c), .B(
        \data_source_0/N_230 ), .Y(\data_source_0/state_6[79] ));
    XA1A \dbpsk_modulator_0/counter_RNO[15]  (.A(
        \dbpsk_modulator_0/counter[15]_net_1 ), .B(
        \dbpsk_modulator_0/N_42 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/counter_n15 ));
    NOR3C \modulator_0/clock_counter_RNO[1]  (.A(\modulator_0/N_51 ), 
        .B(trigger_signal_c), .C(\modulator_0/N_39 ), .Y(
        \modulator_0/N_31 ));
    DFN1C0 \main_clock_0/counter[0]  (.D(\main_clock_0/counter_3[0] ), 
        .CLK(GLA), .CLR(reset_c), .Q(\main_clock_0/counter[0]_net_1 ));
    AND2B AND2_1 (.A(output_data_rate_c), .B(ref_signal_c), .Y(
        AND2_1_Y));
    MX2 \data_source_0/state_RNO_0[96]  (.A(
        \data_source_0/state[96]_net_1 ), .B(
        \data_source_0/state[95]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_247 ));
    MX2 \data_source_0/state_RNO_0[54]  (.A(
        \data_source_0/state[54]_net_1 ), .B(
        \data_source_0/state[53]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_205 ));
    DFN0E1C0 \whitening_0/output_counter[6]  (.D(\whitening_0/I_17_1 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[6]_net_1 ));
    OR2A \data_source_0/state_RNO[100]  (.A(output_signal_c), .B(
        \data_source_0/N_251 ), .Y(\data_source_0/state_6[100] ));
    NOR2B \whitening_0/state_RNO[5]  (.A(output_signal_c), .B(
        \whitening_0/state[4]_net_1 ), .Y(\whitening_0/state_22[5] ));
    DFN1C0 \dbpsk_modulator_0/counter[13]  (.D(
        \dbpsk_modulator_0/counter_n13 ), .CLK(ref_signal_c), .CLR(
        reset_c), .Q(\dbpsk_modulator_0/counter[13]_net_1 ));
    DFN1C0 \data_source_0/state[19]  (.D(\data_source_0/state_6[19] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[19]_net_1 ));
    OR2A \dbpsk_modulator_0/counter_RNI9K9A[5]  (.A(
        \dbpsk_modulator_0/counter[5]_net_1 ), .B(
        \dbpsk_modulator_0/N_32 ), .Y(\dbpsk_modulator_0/N_33 ));
    OR2A \data_source_0/counter_RNO_0[15]  (.A(
        \data_source_0/counter[14]_net_1 ), .B(\data_source_0/N_42 ), 
        .Y(\data_source_0/N_43 ));
    DFN1C0 \data_source_0/counter[14]  (.D(\data_source_0/counter_n14 )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/counter[14]_net_1 ));
    MX2 \data_source_0/state_RNO_0[50]  (.A(
        \data_source_0/state[50]_net_1 ), .B(
        \data_source_0/state[49]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_201 ));
    NOR2A \whitening_0/output_counter_RNI777S[0]  (.A(
        \whitening_0/output_counter[0]_net_1 ), .B(
        \whitening_0/output_counter[3]_net_1 ), .Y(
        \whitening_0/output_counter17_7 ));
    OR2A \data_source_0/counter_RNI6KV23[12]  (.A(
        \data_source_0/counter[12]_net_1 ), .B(\data_source_0/N_40 ), 
        .Y(\data_source_0/N_41 ));
    DFN1P0 \data_source_0/state[103]  (.D(\data_source_0/state_6[103] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[103]_net_1 ));
    OR2A \modulator_0/clock_counter_RNIUV581[12]  (.A(
        \modulator_0/un6lto12 ), .B(\modulator_0/N_49 ), .Y(
        \modulator_0/N_50 ));
    MX2 \data_source_0/state_RNO_0[37]  (.A(
        \data_source_0/state[37]_net_1 ), .B(
        \data_source_0/state[36]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_188 ));
    NOR2B \data_source_0/state_RNO[24]  (.A(output_signal_c), .B(
        \data_source_0/N_175 ), .Y(\data_source_0/state_6[24] ));
    DFN1C0 \data_source_0/counter[4]  (.D(\data_source_0/N_20 ), .CLK(
        ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/counter[4]_net_1 ));
    DFN0E1C0 \whitening_0/output_counter[1]  (.D(
        \whitening_0/output_counter_5[1] ), .CLK(ref_signal_c), .CLR(
        reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[1]_net_1 ));
    DFN0E1C0 \whitening_0/output_counter[4]  (.D(
        \whitening_0/output_counter_5[4] ), .CLK(ref_signal_c), .CLR(
        reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[4]_net_1 ));
    NOR3B \whitening_0/output_counter_RNI7F0C1[2]  (.A(
        \whitening_0/output_counter[5]_net_1 ), .B(
        \whitening_0/output_counter17_2 ), .C(
        \whitening_0/output_counter[2]_net_1 ), .Y(
        \whitening_0/output_counter17_9 ));
    DFN1E1C0 \modulator_0/clock_counter[10]  (.D(
        \modulator_0/clock_counter_n10 ), .CLK(ref_signal_c), .CLR(
        reset_c), .E(\modulator_0/clock_countere ), .Q(
        \modulator_0/clock_counter[10]_net_1 ));
    AND3 \whitening_0/un2_output_counter_1_I_36  (.A(
        \whitening_0/DWACT_FINC_E[6] ), .B(
        \whitening_0/DWACT_FINC_E[7] ), .C(
        \whitening_0/output_counter[12]_net_1 ), .Y(\whitening_0/N_4 ));
    AND3 \whitening_0/un2_output_counter_1_I_19  (.A(
        \whitening_0/DWACT_FINC_E[0] ), .B(
        \whitening_0/DWACT_FINC_E[2] ), .C(
        \whitening_0/output_counter[6]_net_1 ), .Y(\whitening_0/N_10 ));
    AO1A OR2_1 (.A(output_signal_c), .B(ref_signal_c), .C(AND2_2_Y), 
        .Y(signal_into_switch_c));
    DFN1E1C0 \whitening_0/state[0]  (.D(\whitening_0/N_30 ), .CLK(
        ref_signal_c), .CLR(reset_c), .E(\whitening_0/N_34 ), .Q(
        \whitening_0/state[0]_net_1 ));
    OR2A \whitening_0/counter_RNI563I[1]  (.A(
        \whitening_0/counter[0]_net_1 ), .B(
        \whitening_0/counter_i_0[1] ), .Y(\whitening_0/N_37 ));
    XA1A \whitening_0/counter_RNO[10]  (.A(
        \whitening_0/counter[10]_net_1 ), .B(\whitening_0/N_45 ), .C(
        output_signal_c), .Y(\whitening_0/counter_n10 ));
    NOR2B \whitening_0/state_RNO[1]  (.A(output_signal_c), .B(
        \whitening_0/state[0]_net_1 ), .Y(\whitening_0/state_22[1] ));
    NOR2B \data_source_0/state_RNO[94]  (.A(output_signal_c), .B(
        \data_source_0/N_245 ), .Y(\data_source_0/state_6[94] ));
    XAI1 \data_source_0/counter_RNO[8]  (.A(
        \data_source_0/counter_i_0[8] ), .B(\data_source_0/N_36 ), .C(
        output_signal_c), .Y(\data_source_0/N_12 ));
    DFN1P0 \data_source_0/state[31]  (.D(\data_source_0/state_6[31] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[31]_net_1 ));
    OR2A \whitening_0/counter_RNI18HQ2[9]  (.A(
        \whitening_0/counter[9]_net_1 ), .B(\whitening_0/N_44 ), .Y(
        \whitening_0/N_45 ));
    DFN0E1C0 \whitening_0/output_counter[5]  (.D(
        \whitening_0/output_counter_5[5] ), .CLK(ref_signal_c), .CLR(
        reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[5]_net_1 ));
    OA1C \modulator_0/clock_counter_RNO_0[8]  (.A(
        \modulator_0/un6lto7 ), .B(\modulator_0/N_53 ), .C(
        \modulator_0/clock_counter[8]_net_1 ), .Y(\modulator_0/N_137 ));
    NOR2B \data_source_0/state_RNO[126]  (.A(output_signal_c), .B(
        \data_source_0/N_277 ), .Y(\data_source_0/state_6[126] ));
    MX2 \data_source_0/state_RNO_0[118]  (.A(
        \data_source_0/state[118]_net_1 ), .B(
        \data_source_0/state[117]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_269 ));
    DFN1C0 \data_source_0/state[50]  (.D(\data_source_0/state_6[50] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[50]_net_1 ));
    DFN1C0 \data_source_0/state[37]  (.D(\data_source_0/state_6[37] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[37]_net_1 ));
    DFN1P0 \data_source_0/state[116]  (.D(\data_source_0/state_6[116] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[116]_net_1 ));
    OR2A \data_source_0/counter_RNIVPDJ[1]  (.A(
        \data_source_0/counter[0]_net_1 ), .B(
        \data_source_0/counter_i_0[1] ), .Y(\data_source_0/N_30 ));
    DFN1E1C0 \modulator_0/clock_counter[4]  (.D(\modulator_0/N_25 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(
        \modulator_0/clock_countere ), .Q(
        \modulator_0/clock_counter[4]_net_1 ));
    DFN1C0 \data_source_0/state[20]  (.D(\data_source_0/state_6[20] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[20]_net_1 ));
    NOR2A \modulator_0/clock_counter_RNO[0]  (.A(trigger_signal_c), .B(
        \modulator_0/clock_counter[0]_net_1 ), .Y(\modulator_0/N_144 ));
    AOI1 \main_clock_0/counter_RNO[0]  (.A(\main_clock_0/counter14_4 ), 
        .B(\main_clock_0/counter14_3 ), .C(
        \main_clock_0/counter[0]_net_1 ), .Y(
        \main_clock_0/counter_3[0] ));
    MX2 \data_source_0/state_RNO_0[55]  (.A(
        \data_source_0/state[55]_net_1 ), .B(
        \data_source_0/state[54]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_206 ));
    AND2 \whitening_0/un2_output_counter_1_I_38  (.A(
        \whitening_0/output_counter[12]_net_1 ), .B(
        \whitening_0/output_counter[13]_net_1 ), .Y(
        \whitening_0/DWACT_FINC_E[8] ));
    DFN0E1C0 \whitening_0/output_counter[9]  (.D(\whitening_0/I_26_0 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[9]_net_1 ));
    MX2 \data_source_0/state_RNO_0[107]  (.A(
        \data_source_0/state[107]_net_1 ), .B(
        \data_source_0/state[106]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_258 ));
    AO1 \data_source_0/counter_RNO[1]  (.A(
        \data_source_0/counter_n1_i_a2_0_0 ), .B(\data_source_0/N_94 ), 
        .C(\data_source_0/counter_n1_i_1 ), .Y(\data_source_0/N_26 ));
    NOR2B \data_source_0/state_RNO[40]  (.A(output_signal_c), .B(
        \data_source_0/N_191 ), .Y(\data_source_0/state_6[40] ));
    DFN1C0 \data_source_0/state[52]  (.D(\data_source_0/state_6[52] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[52]_net_1 ));
    DFN1C0 \data_source_0/state[122]  (.D(\data_source_0/state_6[122] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[122]_net_1 ));
    AOI1 \modulator_0/counter_RNO[1]  (.A(\modulator_0/N_123_1 ), .B(
        \modulator_0/N_151 ), .C(\modulator_0/counter_n1_i_0 ), .Y(
        \modulator_0/N_5 ));
    DFN1C0 \dbpsk_modulator_0/counter[4]  (.D(\dbpsk_modulator_0/N_19 )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \dbpsk_modulator_0/counter[4]_net_1 ));
    NOR2A \data_source_0/counter_RNO[0]  (.A(output_signal_c), .B(
        \data_source_0/counter[0]_net_1 ), .Y(
        \data_source_0/counter_n0 ));
    AND3 \two_mhz_clock_0/un5_counter_I_30  (.A(
        \two_mhz_clock_0/DWACT_FINC_E[0] ), .B(
        \two_mhz_clock_0/DWACT_FINC_E[2] ), .C(
        \two_mhz_clock_0/DWACT_FINC_E[5] ), .Y(
        \two_mhz_clock_0/DWACT_FINC_E[6] ));
    OR2A \dbpsk_modulator_0/counter_RNO_1[4]  (.A(output_signal_c), .B(
        \dbpsk_modulator_0/N_105 ), .Y(
        \dbpsk_modulator_0/counter_n4_i_0 ));
    DFN1C0 \data_source_0/state[53]  (.D(\data_source_0/state_6[53] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[53]_net_1 ));
    DFN1C0 \data_source_0/state[22]  (.D(\data_source_0/state_6[22] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[22]_net_1 ));
    MX2 \data_source_0/state_RNO_0[115]  (.A(
        \data_source_0/state[115]_net_1 ), .B(
        \data_source_0/state[114]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_266 ));
    XAI1 \data_source_0/counter_RNO[3]  (.A(
        \data_source_0/counter_i_0[3] ), .B(\data_source_0/N_31 ), .C(
        output_signal_c), .Y(\data_source_0/N_22 ));
    XA1A \modulator_0/clock_counter_RNO[10]  (.A(
        \modulator_0/clock_counter[10]_net_1 ), .B(\modulator_0/N_61 ), 
        .C(trigger_signal_c), .Y(\modulator_0/clock_counter_n10 ));
    DFN0E1C0 \whitening_0/output_counter[0]  (.D(\whitening_0/I_4_0 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[0]_net_1 ));
    DFN1P0 \data_source_0/state[108]  (.D(\data_source_0/state_6[108] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[108]_net_1 ));
    MX2 \data_source_0/state_RNO_0[128]  (.A(
        \data_source_0/state[128]_net_1 ), .B(
        \data_source_0/state[127]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_279 ));
    DFN1C0 \data_source_0/state[40]  (.D(\data_source_0/state_6[40] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[40]_net_1 ));
    DFN1C0 \data_source_0/state[23]  (.D(\data_source_0/state_6[23] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[23]_net_1 ));
    DFN1E1C0 \modulator_0/clock_counter[8]  (.D(\modulator_0/N_17 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(
        \modulator_0/clock_countere ), .Q(
        \modulator_0/clock_counter[8]_net_1 ));
    NOR2B \data_source_0/state_RNO[42]  (.A(output_signal_c), .B(
        \data_source_0/N_193 ), .Y(\data_source_0/state_6[42] ));
    MX2 \data_source_0/state_RNO_0[92]  (.A(
        \data_source_0/state[92]_net_1 ), .B(
        \data_source_0/state[91]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_243 ));
    DFN1C0 \dbpsk_modulator_0/counter[5]  (.D(\dbpsk_modulator_0/N_17 )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \dbpsk_modulator_0/counter[5]_net_1 ));
    NOR2B \data_source_0/state_RNO[26]  (.A(output_signal_c), .B(
        \data_source_0/N_177 ), .Y(\data_source_0/state_6[26] ));
    OR2A \dbpsk_modulator_0/counter_RNI44A21[11]  (.A(
        \dbpsk_modulator_0/counter[11]_net_1 ), .B(
        \dbpsk_modulator_0/N_38 ), .Y(\dbpsk_modulator_0/N_39 ));
    NOR2B \data_source_0/state_RNO[43]  (.A(output_signal_c), .B(
        \data_source_0/N_194 ), .Y(\data_source_0/state_6[43] ));
    AX1C \whitening_0/un2_output_counter_1_I_12  (.A(
        \whitening_0/output_counter[3]_net_1 ), .B(
        \whitening_0/DWACT_FINC_E[0] ), .C(
        \whitening_0/output_counter[4]_net_1 ), .Y(
        \whitening_0/I_12_1 ));
    DFN1C0 \data_source_0/state[120]  (.D(\data_source_0/state_6[120] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[120]_net_1 ));
    AND2 \two_mhz_clock_0/un5_counter_I_15  (.A(
        \two_mhz_clock_0/counter[3]_net_1 ), .B(
        \two_mhz_clock_0/counter[4]_net_1 ), .Y(
        \two_mhz_clock_0/DWACT_FINC_E[1] ));
    DFN1P0 \data_source_0/counter[3]  (.D(\data_source_0/N_22 ), .CLK(
        ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/counter_i_0[3] ));
    DFN1C0 \data_source_0/state[42]  (.D(\data_source_0/state_6[42] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[42]_net_1 ));
    XAI1 \whitening_0/counter_RNO[3]  (.A(\whitening_0/counter_i_0[3] )
        , .B(\whitening_0/N_38 ), .C(output_signal_c), .Y(
        \whitening_0/N_21 ));
    NOR2B \data_source_0/state_RNO[123]  (.A(output_signal_c), .B(
        \data_source_0/N_274 ), .Y(\data_source_0/state_6[123] ));
    MX2 \data_source_0/state_RNO_0[133]  (.A(
        \data_source_0/state[133]_net_1 ), .B(
        \data_source_0/state[132]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_284 ));
    DFN1E1C0 \whitening_0/state[2]  (.D(\whitening_0/state_22[2] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(\whitening_0/N_34 ), .Q(
        \whitening_0/state[2]_net_1 ));
    DFN1C0 \dbpsk_modulator_0/counter[12]  (.D(
        \dbpsk_modulator_0/counter_n12 ), .CLK(ref_signal_c), .CLR(
        reset_c), .Q(\dbpsk_modulator_0/counter[12]_net_1 ));
    MX2 \data_source_0/state_RNO_0[1]  (.A(
        \data_source_0/state[1]_net_1 ), .B(
        \data_source_0/state[0]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_152 ));
    NOR3A \data_source_0/counter_RNIGH7L[12]  (.A(
        \data_source_0/counter23_0_a2_0_6 ), .B(
        \data_source_0/counter[12]_net_1 ), .C(
        \data_source_0/counter[9]_net_1 ), .Y(
        \data_source_0/counter23_0_a2_0_9 ));
    OR2A \modulator_0/clock_counter_RNO_0[15]  (.A(
        \modulator_0/clock_counter[14]_net_1 ), .B(\modulator_0/N_52 ), 
        .Y(\modulator_0/N_91 ));
    DFN1C0 \data_source_0/state[43]  (.D(\data_source_0/state_6[43] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[43]_net_1 ));
    NOR3C \whitening_0/output_counter_RNI2BF43[1]  (.A(
        \whitening_0/output_counter17_5 ), .B(
        \whitening_0/output_counter17_4 ), .C(
        \whitening_0/output_counter17_11 ), .Y(
        \whitening_0/output_counter17_13 ));
    MX2 \data_source_0/state_RNO_0[125]  (.A(
        \data_source_0/state[125]_net_1 ), .B(
        \data_source_0/state[124]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_276 ));
    NOR2B \data_source_0/state_RNO[96]  (.A(output_signal_c), .B(
        \data_source_0/N_247 ), .Y(\data_source_0/state_6[96] ));
    MX2 \data_source_0/state_RNO_0[7]  (.A(
        \data_source_0/state[7]_net_1 ), .B(
        \data_source_0/state[6]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_158 ));
    NOR2B \data_source_0/state_RNO[114]  (.A(output_signal_c), .B(
        \data_source_0/N_265 ), .Y(\data_source_0/state_6[114] ));
    DFN1P0 \data_source_0/state[121]  (.D(\data_source_0/state_6[121] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[121]_net_1 ));
    MX2 \data_source_0/state_RNO_0[31]  (.A(
        \data_source_0/state[31]_net_1 ), .B(
        \data_source_0/state[30]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_182 ));
    OR2 \data_source_0/counter_RNIUS042[6]  (.A(\data_source_0/N_34 ), 
        .B(\data_source_0/counter_i_0[6] ), .Y(\data_source_0/N_35 ));
    DFN1C0 \two_mhz_clock_0/counter[11]  (.D(\two_mhz_clock_0/I_32 ), 
        .CLK(GLA), .CLR(reset_c), .Q(
        \two_mhz_clock_0/counter[11]_net_1 ));
    MX2 \data_source_0/state_RNO_0[44]  (.A(
        \data_source_0/state[44]_net_1 ), .B(
        \data_source_0/state[43]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_195 ));
    DFN1E1C0 \whitening_0/state[5]  (.D(\whitening_0/state_22[5] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(\whitening_0/N_34 ), .Q(
        \whitening_0/state[5]_net_1 ));
    NOR3C \two_mhz_clock_0/counter_RNI82AV2[11]  (.A(
        \two_mhz_clock_0/counter14_1 ), .B(
        \two_mhz_clock_0/counter14_0 ), .C(
        \two_mhz_clock_0/counter14_7 ), .Y(
        \two_mhz_clock_0/counter14_9 ));
    MX2 \data_source_0/state_RNO_0[58]  (.A(
        \data_source_0/state[58]_net_1 ), .B(
        \data_source_0/state[57]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_209 ));
    DFN0E0C0 \whitening_0/output_whitening  (.D(\whitening_0/N_32 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(
        \whitening_0/output_whitening_1_sqmuxa ), .Q(
        whitening_0_output_whitening));
    DFN1P0 \data_source_0/state[129]  (.D(\data_source_0/state_6[129] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[129]_net_1 ));
    XOR2 \two_mhz_clock_0/un5_counter_I_5  (.A(
        \two_mhz_clock_0/counter[0]_net_1 ), .B(
        \two_mhz_clock_0/counter[1]_net_1 ), .Y(
        \two_mhz_clock_0/I_5_0 ));
    DFN1C0 \data_source_0/state[68]  (.D(\data_source_0/state_6[68] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[68]_net_1 ));
    MX2 \data_source_0/state_RNO_0[79]  (.A(
        \data_source_0/state[79]_net_1 ), .B(
        \data_source_0/state[78]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_230 ));
    OR2 \modulator_0/clock_counter_RNIB3OL[10]  (.A(\modulator_0/N_47 )
        , .B(\modulator_0/N_46 ), .Y(\modulator_0/N_48 ));
    AND3 \two_mhz_clock_0/un5_counter_I_31  (.A(
        \two_mhz_clock_0/DWACT_FINC_E[6] ), .B(
        \two_mhz_clock_0/counter[9]_net_1 ), .C(
        \two_mhz_clock_0/counter[10]_net_1 ), .Y(\two_mhz_clock_0/N_2 )
        );
    AND3 \whitening_0/un2_output_counter_1_I_31  (.A(
        \whitening_0/DWACT_FINC_E[6] ), .B(
        \whitening_0/output_counter[9]_net_1 ), .C(
        \whitening_0/output_counter[10]_net_1 ), .Y(\whitening_0/N_6 ));
    DFN1E1C0 \whitening_0/state[6]  (.D(\whitening_0/state_22[6] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(\whitening_0/N_34 ), .Q(
        \whitening_0/state[6]_net_1 ));
    MX2 \data_source_0/state_RNO_0[40]  (.A(
        \data_source_0/state[40]_net_1 ), .B(
        \data_source_0/state[39]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_191 ));
    OR2A \whitening_0/counter_RNO_0[15]  (.A(
        \whitening_0/counter[14]_net_1 ), .B(\whitening_0/N_49 ), .Y(
        \whitening_0/N_51 ));
    NOR3C \dbpsk_modulator_0/counter_RNICUMT1[8]  (.A(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_7 ), .B(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_6 ), .C(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_8 ), .Y(
        \dbpsk_modulator_0/N_122 ));
    DFN1E1C0 \modulator_0/clock_counter[7]  (.D(\modulator_0/N_19 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(
        \modulator_0/clock_countere ), .Q(\modulator_0/un6lto7 ));
    NOR3B \dbpsk_modulator_0/output_dbpsk_RNO_2  (.A(
        \dbpsk_modulator_0/counter_i_0[1] ), .B(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a3_0 ), .C(
        \dbpsk_modulator_0/counter[0]_net_1 ), .Y(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a3_1 ));
    NOR2B \data_source_0/state_RNO[142]  (.A(output_signal_c), .B(
        \data_source_0/N_293 ), .Y(\data_source_0/state_6[142] ));
    NOR3C \whitening_0/counter_RNO_0[5]  (.A(
        \whitening_0/counter[0]_net_1 ), .B(
        \whitening_0/counter[4]_net_1 ), .C(
        \whitening_0/counter_RNI3P3V3[2]_net_1 ), .Y(
        \whitening_0/N_114 ));
    DFN1C0 \data_source_0/state[54]  (.D(\data_source_0/state_6[54] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[54]_net_1 ));
    DFN0E1C0 \whitening_0/output_counter[10]  (.D(\whitening_0/I_28_0 )
        , .CLK(ref_signal_c), .CLR(reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[10]_net_1 ));
    DFN1P0 \data_source_0/counter[1]  (.D(\data_source_0/N_26 ), .CLK(
        ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/counter_i_0[1] ));
    XA1B \modulator_0/counter_RNO[2]  (.A(
        \modulator_0/counter[2]_net_1 ), .B(\modulator_0/counter_c1 ), 
        .C(\modulator_0/N_8 ), .Y(\modulator_0/counter_n2 ));
    XA1A \whitening_0/counter_RNO[13]  (.A(
        \whitening_0/counter[13]_net_1 ), .B(\whitening_0/N_48 ), .C(
        output_signal_c), .Y(\whitening_0/counter_n13 ));
    XA1A \data_source_0/counter_RNO[9]  (.A(
        \data_source_0/counter[9]_net_1 ), .B(\data_source_0/N_37 ), 
        .C(output_signal_c), .Y(\data_source_0/counter_n9 ));
    DFN1C0 \data_source_0/state[24]  (.D(\data_source_0/state_6[24] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[24]_net_1 ));
    AX1D \whitening_0/counter_RNO_1[4]  (.A(
        \whitening_0/counter_i_0[3] ), .B(\whitening_0/N_38 ), .C(
        \whitening_0/counter[4]_net_1 ), .Y(\whitening_0/N_65_i ));
    DFN1C0 \data_source_0/state[136]  (.D(\data_source_0/state_6[136] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[136]_net_1 ));
    NOR2B \data_source_0/state_RNO[18]  (.A(output_signal_c), .B(
        \data_source_0/N_169 ), .Y(\data_source_0/state_6[18] ));
    OR3A \data_source_0/counter_RNILOIG1[3]  (.A(
        \data_source_0/counter[4]_net_1 ), .B(
        \data_source_0/counter_i_0[3] ), .C(\data_source_0/N_31 ), .Y(
        \data_source_0/N_33 ));
    XAI1 \whitening_0/counter_RNO[6]  (.A(\whitening_0/counter_i_0[6] )
        , .B(\whitening_0/N_41 ), .C(output_signal_c), .Y(
        \whitening_0/N_15_0 ));
    XA1A \whitening_0/counter_RNO[14]  (.A(
        \whitening_0/counter[14]_net_1 ), .B(\whitening_0/N_49 ), .C(
        output_signal_c), .Y(\whitening_0/counter_n14 ));
    NOR3A \dbpsk_modulator_0/counter_RNI9D821[10]  (.A(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_5 ), .B(
        \dbpsk_modulator_0/counter[12]_net_1 ), .C(
        \dbpsk_modulator_0/counter[10]_net_1 ), .Y(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_8 ));
    AND3 \main_clock_0/un5_counter_1_I_18  (.A(
        \main_clock_0/counter[3]_net_1 ), .B(
        \main_clock_0/counter[4]_net_1 ), .C(
        \main_clock_0/counter[5]_net_1 ), .Y(
        \main_clock_0/DWACT_FINC_E[2] ));
    NOR3C \whitening_0/output_counter_RNI07MI1[2]  (.A(
        \whitening_0/output_counter17_1 ), .B(
        \whitening_0/output_counter17_0 ), .C(
        \whitening_0/output_counter17_9 ), .Y(
        \whitening_0/output_counter17_12 ));
    OR2A \data_source_0/state_RNO[44]  (.A(output_signal_c), .B(
        \data_source_0/N_195 ), .Y(\data_source_0/state_6[44] ));
    MX2 \data_source_0/state_RNO_0[63]  (.A(
        \data_source_0/state[63]_net_1 ), .B(
        \data_source_0/state[62]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_214 ));
    XOR2 \main_clock_0/un5_counter_1_I_20  (.A(\main_clock_0/N_2 ), .B(
        \main_clock_0/counter[7]_net_1 ), .Y(\main_clock_0/I_20 ));
    CLKINT \main_clock_0/clock_out_RNIG44  (.A(
        \main_clock_0/clock_out_i ), .Y(ref_signal_c));
    DFN1C0 \main_clock_0/counter[4]  (.D(\main_clock_0/I_12 ), .CLK(
        GLA), .CLR(reset_c), .Q(\main_clock_0/counter[4]_net_1 ));
    NOR3C \whitening_0/counter_RNI03741[6]  (.A(
        \whitening_0/counter_i_0[3] ), .B(\whitening_0/counter_i_0[6] )
        , .C(\whitening_0/counter_n5_i_a2_0_2 ), .Y(
        \whitening_0/counter_n5_i_a2_0_7 ));
    CLKINT \data_source_0/counter_RNII6P43_0[4]  (.A(
        \data_source_0/counter_RNII6P43[4]_net_1 ), .Y(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ));
    NOR2B \whitening_0/state_RNO[0]  (.A(data_source_0_output_data), 
        .B(output_signal_c), .Y(\whitening_0/N_30 ));
    MX2 \data_source_0/state_RNO_0[66]  (.A(
        \data_source_0/state[66]_net_1 ), .B(
        \data_source_0/state[65]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_217 ));
    MX2 \data_source_0/state_RNO_0[3]  (.A(
        \data_source_0/state[3]_net_1 ), .B(
        \data_source_0/state[2]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_154 ));
    DFN1C0 \data_source_0/state[69]  (.D(\data_source_0/state_6[69] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[69]_net_1 ));
    DFN1P0 \data_source_0/state[44]  (.D(\data_source_0/state_6[44] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[44]_net_1 ));
    MX2 \data_source_0/state_RNO_0[45]  (.A(
        \data_source_0/state[45]_net_1 ), .B(
        \data_source_0/state[44]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_196 ));
    DFN1C0 \data_source_0/state[114]  (.D(\data_source_0/state_6[114] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[114]_net_1 ));
    AND3C \modulator_0/output_signal_RNO_7  (.A(
        \modulator_0/clock_counter[4]_net_1 ), .B(
        \modulator_0/clock_counter[5]_net_1 ), .C(\modulator_0/N_55 ), 
        .Y(\modulator_0/N_150 ));
    DFN1C0 \two_mhz_clock_0/clock_out  (.D(
        \two_mhz_clock_0/clock_out_RNO_0 ), .CLK(GLA), .CLR(reset_c), 
        .Q(clock_out_c));
    OR2A \data_source_0/state_RNO[25]  (.A(output_signal_c), .B(
        \data_source_0/N_176 ), .Y(\data_source_0/state_6[25] ));
    OR2 \whitening_0/counter_RNI6CFH2[8]  (.A(\whitening_0/N_43 ), .B(
        \whitening_0/counter_i_0[8] ), .Y(\whitening_0/N_44 ));
    NOR2B \data_source_0/state_RNO[38]  (.A(output_signal_c), .B(
        \data_source_0/N_189 ), .Y(\data_source_0/state_6[38] ));
    NOR2B \data_source_0/state_RNO[102]  (.A(output_signal_c), .B(
        \data_source_0/N_253 ), .Y(\data_source_0/state_6[102] ));
    MX2 \data_source_0/state_RNO_0[77]  (.A(
        \data_source_0/state[77]_net_1 ), .B(
        \data_source_0/state[76]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_228 ));
    MX2 \data_source_0/state_RNO_0[19]  (.A(
        \data_source_0/state[19]_net_1 ), .B(
        \data_source_0/state[18]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_170 ));
    NOR2B \data_source_0/state_RNO[88]  (.A(output_signal_c), .B(
        \data_source_0/N_239 ), .Y(\data_source_0/state_6[88] ));
    DFN1E1C0 \modulator_0/clock_counter[9]  (.D(
        \modulator_0/clock_counter_n9 ), .CLK(ref_signal_c), .CLR(
        reset_c), .E(\modulator_0/clock_countere ), .Q(
        \modulator_0/clock_counter[9]_net_1 ));
    DFN1C0 \data_source_0/state[88]  (.D(\data_source_0/state_6[88] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[88]_net_1 ));
    XOR2 \whitening_0/counter_RNO_1[5]  (.A(\whitening_0/N_40 ), .B(
        \whitening_0/counter[5]_net_1 ), .Y(\whitening_0/N_66_i ));
    DFN1P0 \whitening_0/counter[1]  (.D(\whitening_0/N_25 ), .CLK(
        ref_signal_c), .PRE(reset_c), .Q(\whitening_0/counter_i_0[1] ));
    XAI1 \whitening_0/counter_RNO[8]  (.A(\whitening_0/counter_i_0[8] )
        , .B(\whitening_0/N_43 ), .C(output_signal_c), .Y(
        \whitening_0/N_11 ));
    NOR2B \data_source_0/state_RNO[128]  (.A(output_signal_c), .B(
        \data_source_0/N_279 ), .Y(\data_source_0/state_6[128] ));
    DFN0E1C0 \whitening_0/output_counter[7]  (.D(\whitening_0/I_20_1 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[7]_net_1 ));
    NOR2B \data_source_0/state_RNO[19]  (.A(output_signal_c), .B(
        \data_source_0/N_170 ), .Y(\data_source_0/state_6[19] ));
    DFN1C0 \data_source_0/state[30]  (.D(\data_source_0/state_6[30] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[30]_net_1 ));
    OR2A \data_source_0/state_RNO[95]  (.A(output_signal_c), .B(
        \data_source_0/N_246 ), .Y(\data_source_0/state_6[95] ));
    XA1A \data_source_0/counter_RNO[11]  (.A(
        \data_source_0/counter[11]_net_1 ), .B(\data_source_0/N_39 ), 
        .C(output_signal_c), .Y(\data_source_0/counter_n11 ));
    NOR2A \dbpsk_modulator_0/output_dbpsk_RNO  (.A(output_signal_c), 
        .B(output_data_rate_c), .Y(\dbpsk_modulator_0/output_dbpsk_5 ));
    NOR2B \modulator_0/counter_RNIM9HV1[3]  (.A(
        \modulator_0/counter_c2 ), .B(\modulator_0/counter[3]_net_1 ), 
        .Y(\modulator_0/counter_c3 ));
    DFN1C0 \data_source_0/state[56]  (.D(\data_source_0/state_6[56] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[56]_net_1 ));
    XAI1 \dbpsk_modulator_0/counter_RNO[6]  (.A(
        \dbpsk_modulator_0/counter_i_0[6] ), .B(
        \dbpsk_modulator_0/N_33 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/N_15 ));
    XA1A \data_source_0/counter_RNO[12]  (.A(
        \data_source_0/counter[12]_net_1 ), .B(\data_source_0/N_40 ), 
        .C(output_signal_c), .Y(\data_source_0/counter_n12 ));
    XA1A \dbpsk_modulator_0/counter_RNO[13]  (.A(
        \dbpsk_modulator_0/counter[13]_net_1 ), .B(
        \dbpsk_modulator_0/N_40 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/counter_n13 ));
    NOR2B \data_source_0/state_RNO[134]  (.A(output_signal_c), .B(
        \data_source_0/N_285 ), .Y(\data_source_0/state_6[134] ));
    MX2 \data_source_0/state_RNO_0[116]  (.A(
        \data_source_0/state[116]_net_1 ), .B(
        \data_source_0/state[115]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_267 ));
    XOR2 \whitening_0/un2_output_counter_1_I_43  (.A(\whitening_0/N_2 )
        , .B(\whitening_0/output_counter[15]_net_1 ), .Y(
        \whitening_0/I_43 ));
    DFN1C0 \data_source_0/state[26]  (.D(\data_source_0/state_6[26] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[26]_net_1 ));
    XOR2 \whitening_0/un2_output_counter_1_I_23  (.A(\whitening_0/N_9 )
        , .B(\whitening_0/output_counter[8]_net_1 ), .Y(
        \whitening_0/I_23_0 ));
    NOR3 \modulator_0/counter_RNIT3LF1[5]  (.A(
        \modulator_0/counter[4]_net_1 ), .B(
        \modulator_0/counter[5]_net_1 ), .C(
        \modulator_0/counter[0]_net_1 ), .Y(
        \modulator_0/clock_counterlde_0_a2_1 ));
    DFN1C0 \data_source_0/state[32]  (.D(\data_source_0/state_6[32] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[32]_net_1 ));
    NOR2B \data_source_0/state_RNO[68]  (.A(output_signal_c), .B(
        \data_source_0/N_219 ), .Y(\data_source_0/state_6[68] ));
    OR2 \whitening_0/counter_RNIJNBV1[6]  (.A(\whitening_0/N_41 ), .B(
        \whitening_0/counter_i_0[6] ), .Y(\whitening_0/N_42 ));
    NOR2B \data_source_0/state_RNO[46]  (.A(output_signal_c), .B(
        \data_source_0/N_197 ), .Y(\data_source_0/state_6[46] ));
    DFN1P0 \data_source_0/state[33]  (.D(\data_source_0/state_6[33] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[33]_net_1 ));
    NOR2A \modulator_0/counter_RNO[0]  (.A(trigger_signal_c), .B(
        \modulator_0/counter[0]_net_1 ), .Y(\modulator_0/counter_n0 ));
    DFN1C0 \modulator_0/counter[5]  (.D(\modulator_0/counter_n5 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \modulator_0/counter[5]_net_1 ));
    NOR3C \data_source_0/counter_RNO_0[4]  (.A(
        \data_source_0/counter[0]_net_1 ), .B(
        \data_source_0/counter[5]_net_1 ), .C(\data_source_0/N_94 ), 
        .Y(\data_source_0/N_77 ));
    NOR2B \data_source_0/state_RNO[125]  (.A(output_signal_c), .B(
        \data_source_0/N_276 ), .Y(\data_source_0/state_6[125] ));
    OR2A \data_source_0/state_RNO[39]  (.A(output_signal_c), .B(
        \data_source_0/N_190 ), .Y(\data_source_0/state_6[39] ));
    MX2 \data_source_0/state_RNO_0[48]  (.A(
        \data_source_0/state[48]_net_1 ), .B(
        \data_source_0/state[47]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_199 ));
    OR2A \data_source_0/state_RNO[89]  (.A(output_signal_c), .B(
        \data_source_0/N_240 ), .Y(\data_source_0/state_6[89] ));
    DFN1P0 \data_source_0/state[89]  (.D(\data_source_0/state_6[89] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[89]_net_1 ));
    DFN1C0 \data_source_0/state[46]  (.D(\data_source_0/state_6[46] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[46]_net_1 ));
    OR2A \data_source_0/state_RNO[127]  (.A(output_signal_c), .B(
        \data_source_0/N_278 ), .Y(\data_source_0/state_6[127] ));
    DFN1P0 \data_source_0/state[105]  (.D(\data_source_0/state_6[105] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[105]_net_1 ));
    MX2 \data_source_0/state_RNO_0[126]  (.A(
        \data_source_0/state[126]_net_1 ), .B(
        \data_source_0/state[125]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_277 ));
    MX2 \data_source_0/state_RNO_0[108]  (.A(
        \data_source_0/state[108]_net_1 ), .B(
        \data_source_0/state[107]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_259 ));
    MX2 \data_source_0/state_RNO_0[62]  (.A(
        \data_source_0/state[62]_net_1 ), .B(
        \data_source_0/state[61]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_213 ));
    MX2 \data_source_0/state_RNO_0[17]  (.A(
        \data_source_0/state[17]_net_1 ), .B(
        \data_source_0/state[16]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_168 ));
    XAI1 \dbpsk_modulator_0/counter_RNO[3]  (.A(
        \dbpsk_modulator_0/counter_i_0[3] ), .B(
        \dbpsk_modulator_0/N_30 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/N_21 ));
    NOR2 \two_mhz_clock_0/counter_RNI007U[7]  (.A(
        \two_mhz_clock_0/counter[9]_net_1 ), .B(
        \two_mhz_clock_0/counter[7]_net_1 ), .Y(
        \two_mhz_clock_0/counter14_1 ));
    NOR2 \whitening_0/output_counter_RNIS3PF[10]  (.A(
        \whitening_0/output_counter[10]_net_1 ), .B(
        \whitening_0/output_counter[7]_net_1 ), .Y(
        \whitening_0/output_counter17_2 ));
    NOR2B \modulator_0/counter_RNINTKF1[2]  (.A(
        \modulator_0/counter_c1 ), .B(\modulator_0/counter[2]_net_1 ), 
        .Y(\modulator_0/counter_c2 ));
    NOR2B \data_source_0/state_RNO[58]  (.A(output_signal_c), .B(
        \data_source_0/N_209 ), .Y(\data_source_0/state_6[58] ));
    DFN1P0 \whitening_0/counter[6]  (.D(\whitening_0/N_15_0 ), .CLK(
        ref_signal_c), .PRE(reset_c), .Q(\whitening_0/counter_i_0[6] ));
    NOR3B \whitening_0/counter_RNI4DT81[2]  (.A(
        \whitening_0/counter_i_0[2] ), .B(
        \whitening_0/counter_n5_i_a2_0_4 ), .C(
        \whitening_0/counter[14]_net_1 ), .Y(
        \whitening_0/counter_n5_i_a2_0_8 ));
    AND3 \whitening_0/un2_output_counter_1_I_29  (.A(
        \whitening_0/output_counter[6]_net_1 ), .B(
        \whitening_0/output_counter[7]_net_1 ), .C(
        \whitening_0/output_counter[8]_net_1 ), .Y(
        \whitening_0/DWACT_FINC_E[5] ));
    OR2A \dbpsk_modulator_0/counter_RNIVND3[0]  (.A(
        \dbpsk_modulator_0/counter[0]_net_1 ), .B(
        \dbpsk_modulator_0/counter_i_0[1] ), .Y(
        \dbpsk_modulator_0/N_29 ));
    DFN1P0 \data_source_0/counter[8]  (.D(\data_source_0/N_12 ), .CLK(
        ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/counter_i_0[8] ));
    DFN1C0 \data_source_0/state[107]  (.D(\data_source_0/state_6[107] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[107]_net_1 ));
    NOR2B \data_source_0/state_RNO[71]  (.A(output_signal_c), .B(
        \data_source_0/N_222 ), .Y(\data_source_0/state_6[71] ));
    AX1C \whitening_0/un2_output_counter_1_I_7  (.A(
        \whitening_0/output_counter[1]_net_1 ), .B(
        \whitening_0/output_counter[0]_net_1 ), .C(
        \whitening_0/output_counter[2]_net_1 ), .Y(\whitening_0/I_7_1 )
        );
    NOR3C \whitening_0/counter_RNI3P3V3[2]  (.A(
        \whitening_0/counter_n5_i_a2_0_8 ), .B(
        \whitening_0/counter_n5_i_a2_0_7 ), .C(
        \whitening_0/counter_n5_i_a2_0_9 ), .Y(
        \whitening_0/counter_RNI3P3V3[2]_net_1 ));
    NOR2B \data_source_0/state_RNO[69]  (.A(output_signal_c), .B(
        \data_source_0/N_220 ), .Y(\data_source_0/state_6[69] ));
    NOR2 \main_clock_0/counter_RNIF4VS[1]  (.A(
        \main_clock_0/counter[4]_net_1 ), .B(
        \main_clock_0/counter[1]_net_1 ), .Y(
        \main_clock_0/counter14_2 ));
    OR3 \modulator_0/output_signal_RNO_1  (.A(
        \modulator_0/output_signal_1_sqmuxa_i_1 ), .B(
        \modulator_0/N_147 ), .C(\modulator_0/N_148 ), .Y(
        \modulator_0/output_signal_1_sqmuxa_i_3 ));
    OR2A \data_source_0/state_RNO[77]  (.A(output_signal_c), .B(
        \data_source_0/N_228 ), .Y(\data_source_0/state_6[77] ));
    DFN1C0 \data_source_0/state[11]  (.D(\data_source_0/state_6[11] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[11]_net_1 ));
    OR2 \data_source_0/counter_RNIK0OD2[7]  (.A(\data_source_0/N_35 ), 
        .B(\data_source_0/counter_i_0[7] ), .Y(\data_source_0/N_36 ));
    DFN1C0 \data_source_0/state[134]  (.D(\data_source_0/state_6[134] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[134]_net_1 ));
    MX2 \data_source_0/state_RNO_0[29]  (.A(
        \data_source_0/state[29]_net_1 ), .B(
        \data_source_0/state[28]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_180 ));
    DFN1C0 \dbpsk_modulator_0/counter[10]  (.D(
        \dbpsk_modulator_0/counter_n10 ), .CLK(ref_signal_c), .CLR(
        reset_c), .Q(\dbpsk_modulator_0/counter[10]_net_1 ));
    MX2 \data_source_0/state_RNO_0[89]  (.A(
        \data_source_0/state[89]_net_1 ), .B(
        \data_source_0/state[88]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_240 ));
    IOTRI_OB_EB \signal_into_switch_pad/U0/U1  (.D(
        signal_into_switch_c), .E(VCC), .DOUT(
        \signal_into_switch_pad/U0/NET1 ), .EOUT(
        \signal_into_switch_pad/U0/NET2 ));
    MX2 \data_source_0/state_RNO_0[105]  (.A(
        \data_source_0/state[105]_net_1 ), .B(
        \data_source_0/state[104]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_256 ));
    NOR2 \whitening_0/output_counter_RNIII7S[6]  (.A(
        \whitening_0/output_counter[8]_net_1 ), .B(
        \whitening_0/output_counter[6]_net_1 ), .Y(
        \whitening_0/output_counter17_5 ));
    XAI1 \modulator_0/counter_RNO_0[1]  (.A(
        \modulator_0/counter[0]_net_1 ), .B(
        \modulator_0/counter[1]_net_1 ), .C(trigger_signal_c), .Y(
        \modulator_0/counter_n1_i_0 ));
    XOR2 \whitening_0/output_whitening_RNO_3  (.A(
        \whitening_0/state[6]_net_1 ), .B(\whitening_0/state[3]_net_1 )
        , .Y(\whitening_0/output_whitening_4_i_x2_0 ));
    NOR2B \data_source_0/state_RNO[4]  (.A(output_signal_c), .B(
        \data_source_0/N_155 ), .Y(\data_source_0/state_6[4] ));
    DFN1C0 \data_source_0/state[17]  (.D(\data_source_0/state_6[17] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[17]_net_1 ));
    DFN1P0 \dbpsk_modulator_0/counter[6]  (.D(\dbpsk_modulator_0/N_15 )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \dbpsk_modulator_0/counter_i_0[6] ));
    DFN1C0 \data_source_0/state[98]  (.D(\data_source_0/state_6[98] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[98]_net_1 ));
    DFN1C0 \data_source_0/state[7]  (.D(\data_source_0/state_6[7] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[7]_net_1 ));
    DFN1C0 \data_source_0/state[142]  (.D(\data_source_0/state_6[142] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[142]_net_1 ));
    DFN0E1C0 \whitening_0/output_counter[11]  (.D(\whitening_0/I_32_0 )
        , .CLK(ref_signal_c), .CLR(reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[11]_net_1 ));
    DFN1C0 \main_clock_0/counter[7]  (.D(\main_clock_0/I_20 ), .CLK(
        GLA), .CLR(reset_c), .Q(\main_clock_0/counter[7]_net_1 ));
    DFN1C0 \data_source_0/state[78]  (.D(\data_source_0/state_6[78] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[78]_net_1 ));
    DFN1P0 \dbpsk_modulator_0/counter[7]  (.D(\dbpsk_modulator_0/N_13 )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \dbpsk_modulator_0/counter_i_0[7] ));
    MX2 \data_source_0/state_RNO_0[71]  (.A(
        \data_source_0/state[71]_net_1 ), .B(
        \data_source_0/state[70]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_222 ));
    MX2 \data_source_0/state_RNO_0[110]  (.A(
        \data_source_0/state[110]_net_1 ), .B(
        \data_source_0/state[109]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_261 ));
    DFN1P0 \dbpsk_modulator_0/counter[3]  (.D(\dbpsk_modulator_0/N_21 )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \dbpsk_modulator_0/counter_i_0[3] ));
    MX2 \data_source_0/state_RNO_0[94]  (.A(
        \data_source_0/state[94]_net_1 ), .B(
        \data_source_0/state[93]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_245 ));
    NOR2B \dbpsk_modulator_0/counter_RNO_1[5]  (.A(
        \dbpsk_modulator_0/counter_i_0[1] ), .B(
        \dbpsk_modulator_0/counter[4]_net_1 ), .Y(
        \dbpsk_modulator_0/counter_n5_i_a3_0_0 ));
    OR2A \data_source_0/state_RNO[121]  (.A(output_signal_c), .B(
        \data_source_0/N_272 ), .Y(\data_source_0/state_6[121] ));
    OR2 \whitening_0/counter_RNICHD82[7]  (.A(\whitening_0/N_42 ), .B(
        \whitening_0/counter_i_0[7] ), .Y(\whitening_0/N_43 ));
    DFN1C0 \two_mhz_clock_0/counter[2]  (.D(\two_mhz_clock_0/I_7_0 ), 
        .CLK(GLA), .CLR(reset_c), .Q(
        \two_mhz_clock_0/counter[2]_net_1 ));
    OR2A \data_source_0/state_RNO[129]  (.A(output_signal_c), .B(
        \data_source_0/N_280 ), .Y(\data_source_0/state_6[129] ));
    AX1C \whitening_0/un2_output_counter_1_I_35  (.A(
        \whitening_0/DWACT_FINC_E[7] ), .B(
        \whitening_0/DWACT_FINC_E[6] ), .C(
        \whitening_0/output_counter[12]_net_1 ), .Y(\whitening_0/I_35 )
        );
    XOR2 \whitening_0/un2_output_counter_1_I_17  (.A(
        \whitening_0/N_11_0 ), .B(
        \whitening_0/output_counter[6]_net_1 ), .Y(
        \whitening_0/I_17_1 ));
    NOR2B \data_source_0/state_RNO[110]  (.A(output_signal_c), .B(
        \data_source_0/N_261 ), .Y(\data_source_0/state_6[110] ));
    MX2 \data_source_0/state_RNO_0[90]  (.A(
        \data_source_0/state[90]_net_1 ), .B(
        \data_source_0/state[89]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_241 ));
    DFN1C0 \data_source_0/state[34]  (.D(\data_source_0/state_6[34] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[34]_net_1 ));
    NOR3 \modulator_0/output_signal_RNO  (.A(\modulator_0/N_146 ), .B(
        \modulator_0/output_signal_1_sqmuxa_i_3 ), .C(
        \modulator_0/N_145 ), .Y(\modulator_0/N_36 ));
    MX2 \data_source_0/state_RNO_0[33]  (.A(
        \data_source_0/state[33]_net_1 ), .B(
        \data_source_0/state[32]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_184 ));
    DFN1C0 \data_source_0/state[55]  (.D(\data_source_0/state_6[55] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[55]_net_1 ));
    NOR2B \dbpsk_modulator_0/counter_RNO_0[1]  (.A(
        \dbpsk_modulator_0/counter[4]_net_1 ), .B(
        \dbpsk_modulator_0/counter[5]_net_1 ), .Y(
        \dbpsk_modulator_0/counter_n1_i_a3_0 ));
    DFN1P0 \data_source_0/state[113]  (.D(\data_source_0/state_6[113] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[113]_net_1 ));
    IOIN_IB \trigger_signal_pad/U0/U1  (.YIN(
        \trigger_signal_pad/U0/NET1 ), .Y(trigger_signal_c));
    OR3C \modulator_0/clock_counter_RNIAJO3[6]  (.A(
        \modulator_0/clock_counter[6]_net_1 ), .B(
        \modulator_0/clock_counter[8]_net_1 ), .C(
        \modulator_0/un6lto7 ), .Y(\modulator_0/N_45 ));
    MX2 \data_source_0/state_RNO_0[131]  (.A(
        \data_source_0/state[131]_net_1 ), .B(
        \data_source_0/state[130]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_282 ));
    NOR2B \data_source_0/state_RNO[59]  (.A(output_signal_c), .B(
        \data_source_0/N_210 ), .Y(\data_source_0/state_6[59] ));
    DFN1P0 \data_source_0/state[25]  (.D(\data_source_0/state_6[25] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[25]_net_1 ));
    NOR2B \data_source_0/output_data_RNO  (.A(output_signal_c), .B(
        \data_source_0/state[143]_net_1 ), .Y(
        \data_source_0/output_data_4 ));
    DFN1P0 \data_source_0/state[140]  (.D(\data_source_0/state_6[140] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[140]_net_1 ));
    OR2 \modulator_0/clock_counter_RNIFVF2_0[1]  (.A(
        \modulator_0/clock_counter[1]_net_1 ), .B(
        \modulator_0/clock_counter[0]_net_1 ), .Y(\modulator_0/N_51 ));
    MX2 \data_source_0/state_RNO_0[36]  (.A(
        \data_source_0/state[36]_net_1 ), .B(
        \data_source_0/state[35]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_187 ));
    NOR2B \data_source_0/state_RNO[106]  (.A(output_signal_c), .B(
        \data_source_0/N_257 ), .Y(\data_source_0/state_6[106] ));
    NOR2B \whitening_0/counter_RNO_0[1]  (.A(
        \whitening_0/counter[5]_net_1 ), .B(
        \whitening_0/counter[4]_net_1 ), .Y(
        \whitening_0/counter_n1_i_a3_0_0 ));
    OR2A \data_source_0/state_RNO[143]  (.A(output_signal_c), .B(
        \data_source_0/N_294 ), .Y(\data_source_0/state_6[143] ));
    NOR2B \data_source_0/state_RNO[45]  (.A(output_signal_c), .B(
        \data_source_0/N_196 ), .Y(\data_source_0/state_6[45] ));
    MX2 \data_source_0/state_RNO_0[120]  (.A(
        \data_source_0/state[120]_net_1 ), .B(
        \data_source_0/state[119]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_271 ));
    OR2 \data_source_0/counter_RNIB5FN2[8]  (.A(\data_source_0/N_36 ), 
        .B(\data_source_0/counter_i_0[8] ), .Y(\data_source_0/N_37 ));
    XOR2 \main_clock_0/un5_counter_1_I_14  (.A(\main_clock_0/N_4 ), .B(
        \main_clock_0/counter[5]_net_1 ), .Y(\main_clock_0/I_14 ));
    AND3 \whitening_0/un2_output_counter_1_I_42  (.A(
        \whitening_0/DWACT_FINC_E[6] ), .B(
        \whitening_0/DWACT_FINC_E[7] ), .C(
        \whitening_0/DWACT_FINC_E[9] ), .Y(\whitening_0/N_2 ));
    AND3 \whitening_0/un2_output_counter_1_I_22  (.A(
        \whitening_0/DWACT_FINC_E[0] ), .B(
        \whitening_0/DWACT_FINC_E[2] ), .C(
        \whitening_0/DWACT_FINC_E[3] ), .Y(\whitening_0/N_9 ));
    XA1A \modulator_0/clock_counter_RNO[13]  (.A(
        \modulator_0/clock_counter[13]_net_1 ), .B(\modulator_0/N_50 ), 
        .C(trigger_signal_c), .Y(\modulator_0/clock_counter_n13 ));
    DFN1C0 \data_source_0/state[5]  (.D(\data_source_0/state_6[5] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[5]_net_1 ));
    DFN1C0 \main_clock_0/counter[3]  (.D(\main_clock_0/I_9 ), .CLK(GLA)
        , .CLR(reset_c), .Q(\main_clock_0/counter[3]_net_1 ));
    DFN1C0 \data_source_0/state[99]  (.D(\data_source_0/state_6[99] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[99]_net_1 ));
    DFN1C0 \data_source_0/state[102]  (.D(\data_source_0/state_6[102] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[102]_net_1 ));
    OR2A \modulator_0/output_signal_RNO_10  (.A(trigger_signal_c), .B(
        \modulator_0/clock_counter[13]_net_1 ), .Y(
        \modulator_0/N_36_3 ));
    DFN1P0 \data_source_0/state[79]  (.D(\data_source_0/state_6[79] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[79]_net_1 ));
    DFN1C0 \data_source_0/state[141]  (.D(\data_source_0/state_6[141] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[141]_net_1 ));
    AOI1B \two_mhz_clock_0/counter_RNO[5]  (.A(
        \two_mhz_clock_0/counter14_9 ), .B(
        \two_mhz_clock_0/counter14_8 ), .C(\two_mhz_clock_0/I_14_0 ), 
        .Y(\two_mhz_clock_0/counter_3[5] ));
    DFN1C0 \data_source_0/state[45]  (.D(\data_source_0/state_6[45] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[45]_net_1 ));
    XA1B \modulator_0/counter_RNO[5]  (.A(
        \modulator_0/counter[5]_net_1 ), .B(\modulator_0/counter_44_0 )
        , .C(\modulator_0/N_8 ), .Y(\modulator_0/counter_n5 ));
    MX2 \data_source_0/state_RNO_0[114]  (.A(
        \data_source_0/state[114]_net_1 ), .B(
        \data_source_0/state[113]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_265 ));
    MX2 \data_source_0/state_RNO_0[27]  (.A(
        \data_source_0/state[27]_net_1 ), .B(
        \data_source_0/state[26]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_178 ));
    OR2B \modulator_0/clock_counter_RNI85FA[10]  (.A(
        \modulator_0/clock_counter[10]_net_1 ), .B(
        \modulator_0/clock_counter[9]_net_1 ), .Y(\modulator_0/N_47 ));
    XA1A \data_source_0/counter_RNO[10]  (.A(
        \data_source_0/counter[10]_net_1 ), .B(\data_source_0/N_38 ), 
        .C(output_signal_c), .Y(\data_source_0/counter_n10 ));
    MX2 \data_source_0/state_RNO_0[87]  (.A(
        \data_source_0/state[87]_net_1 ), .B(
        \data_source_0/state[86]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_238 ));
    MX2 \data_source_0/state_RNO_0[95]  (.A(
        \data_source_0/state[95]_net_1 ), .B(
        \data_source_0/state[94]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_246 ));
    XAI1A \data_source_0/counter_RNO_1[1]  (.A(
        \data_source_0/counter[0]_net_1 ), .B(
        \data_source_0/counter_i_0[1] ), .C(output_signal_c), .Y(
        \data_source_0/counter_n1_i_1 ));
    XA1A \modulator_0/clock_counter_RNO[4]  (.A(
        \modulator_0/clock_counter[4]_net_1 ), .B(\modulator_0/N_41 ), 
        .C(trigger_signal_c), .Y(\modulator_0/N_25 ));
    XA1A \whitening_0/counter_RNO[9]  (.A(
        \whitening_0/counter[9]_net_1 ), .B(\whitening_0/N_44 ), .C(
        output_signal_c), .Y(\whitening_0/counter_n9 ));
    MX2 \data_source_0/state_RNO_0[11]  (.A(
        \data_source_0/state[11]_net_1 ), .B(
        \data_source_0/state[10]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_162 ));
    MX2 \data_source_0/state_RNO_0[8]  (.A(
        \data_source_0/state[8]_net_1 ), .B(
        \data_source_0/state[7]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_159 ));
    AOI1D AND2_2 (.A(AND2_0_Y), .B(AND2_1_Y), .C(output_signal_c), .Y(
        AND2_2_Y));
    IOIN_IB \clock_pad/U0/U1  (.YIN(\clock_pad/U0/NET1 ), .Y(clock_c));
    XAI1 \whitening_0/counter_RNO[2]  (.A(\whitening_0/counter_i_0[2] )
        , .B(\whitening_0/N_37 ), .C(output_signal_c), .Y(
        \whitening_0/N_23 ));
    IOTRI_OB_EB \output_data_rate_pad/U0/U1  (.D(output_data_rate_c), 
        .E(VCC), .DOUT(\output_data_rate_pad/U0/NET1 ), .EOUT(
        \output_data_rate_pad/U0/NET2 ));
    DFN1P0 \data_source_0/state[100]  (.D(\data_source_0/state_6[100] )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[100]_net_1 ));
    XAI1A \dbpsk_modulator_0/counter_RNO_1[1]  (.A(
        \dbpsk_modulator_0/counter_i_0[1] ), .B(
        \dbpsk_modulator_0/counter[0]_net_1 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/counter_n1_i_1 ));
    DFN1P0 \data_source_0/state[36]  (.D(\data_source_0/state_6[36] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[36]_net_1 ));
    OR2A \data_source_0/state_RNO[103]  (.A(output_signal_c), .B(
        \data_source_0/N_254 ), .Y(\data_source_0/state_6[103] ));
    DFN1C0 \data_source_0/state[118]  (.D(\data_source_0/state_6[118] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[118]_net_1 ));
    MX2 \data_source_0/state_RNO_0[4]  (.A(
        \data_source_0/state[4]_net_1 ), .B(
        \data_source_0/state[3]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_155 ));
    MX2 \data_source_0/state_RNO_0[124]  (.A(
        \data_source_0/state[124]_net_1 ), .B(
        \data_source_0/state[123]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_275 ));
    IOPAD_TRI \output_signal_pad/U0/U0  (.D(
        \output_signal_pad/U0/NET1 ), .E(\output_signal_pad/U0/NET2 ), 
        .PAD(output_signal));
    AX1C \main_clock_0/un5_counter_1_I_7  (.A(
        \main_clock_0/counter[1]_net_1 ), .B(
        \main_clock_0/counter[0]_net_1 ), .C(
        \main_clock_0/counter[2]_net_1 ), .Y(\main_clock_0/I_7 ));
    MX2 \data_source_0/state_RNO_0[132]  (.A(
        \data_source_0/state[132]_net_1 ), .B(
        \data_source_0/state[131]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_283 ));
    MX2 \data_source_0/state_RNO_0[119]  (.A(
        \data_source_0/state[119]_net_1 ), .B(
        \data_source_0/state[118]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_270 ));
    DFN1C0 \data_source_0/state[3]  (.D(\data_source_0/state_6[3] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[3]_net_1 ));
    XAI1A \whitening_0/counter_RNO_1[1]  (.A(
        \whitening_0/counter[0]_net_1 ), .B(
        \whitening_0/counter_i_0[1] ), .C(output_signal_c), .Y(
        \whitening_0/counter_n1_i_1 ));
    DFN1C0 \data_source_0/state[101]  (.D(\data_source_0/state_6[101] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[101]_net_1 ));
    DFN1E1C0 \modulator_0/clock_counter[6]  (.D(\modulator_0/N_21 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(
        \modulator_0/clock_countere ), .Q(
        \modulator_0/clock_counter[6]_net_1 ));
    OR2A \data_source_0/counter_RNI4GC23[11]  (.A(
        \data_source_0/counter[11]_net_1 ), .B(\data_source_0/N_39 ), 
        .Y(\data_source_0/N_40 ));
    XA1A \data_source_0/counter_RNO[15]  (.A(
        \data_source_0/counter[15]_net_1 ), .B(\data_source_0/N_43 ), 
        .C(output_signal_c), .Y(\data_source_0/counter_n15 ));
    DFN1C0 \data_source_0/state[9]  (.D(\data_source_0/state_6[9] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[9]_net_1 ));
    DFN1C0 \data_source_0/state[109]  (.D(\data_source_0/state_6[109] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[109]_net_1 ));
    MX2 \data_source_0/state_RNO_0[32]  (.A(
        \data_source_0/state[32]_net_1 ), .B(
        \data_source_0/state[31]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_183 ));
    NOR2B \data_source_0/state_RNO[130]  (.A(output_signal_c), .B(
        \data_source_0/N_281 ), .Y(\data_source_0/state_6[130] ));
    DFN1P0 \data_source_0/counter[6]  (.D(\data_source_0/N_16 ), .CLK(
        ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/counter_i_0[6] ));
    IOTRI_OB_EB \output_signal_pad/U0/U1  (.D(output_signal_c), .E(VCC)
        , .DOUT(\output_signal_pad/U0/NET1 ), .EOUT(
        \output_signal_pad/U0/NET2 ));
    DFN1C0 \data_source_0/state[133]  (.D(\data_source_0/state_6[133] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[133]_net_1 ));
    XA1A \modulator_0/clock_counter_RNO[6]  (.A(\modulator_0/N_43 ), 
        .B(\modulator_0/clock_counter[6]_net_1 ), .C(trigger_signal_c), 
        .Y(\modulator_0/N_21 ));
    DFN1C0 \data_source_0/state[1]  (.D(\data_source_0/state_6[1] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[1]_net_1 ));
    MX2 \data_source_0/state_RNO_0[98]  (.A(
        \data_source_0/state[98]_net_1 ), .B(
        \data_source_0/state[97]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_249 ));
    MX2 \data_source_0/state_RNO_0[59]  (.A(
        \data_source_0/state[59]_net_1 ), .B(
        \data_source_0/state[58]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_210 ));
    AO1B \dbpsk_modulator_0/output_dbpsk_RNO_0  (.A(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a3_2 ), .B(
        whitening_0_output_whitening), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/N_28 ));
    DFN1E1C0 \modulator_0/output_signal  (.D(\modulator_0/N_36 ), .CLK(
        ref_signal_c), .CLR(reset_c), .E(\modulator_0/clock_countere ), 
        .Q(\modulator_0/output_signal_0 ));
    OR2A \data_source_0/counter_RNI9Q9Q1[5]  (.A(
        \data_source_0/counter[5]_net_1 ), .B(\data_source_0/N_33 ), 
        .Y(\data_source_0/N_34 ));
    MX2 \data_source_0/state_RNO_0[129]  (.A(
        \data_source_0/state[129]_net_1 ), .B(
        \data_source_0/state[128]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_280 ));
    AND3 \whitening_0/un2_output_counter_1_I_33  (.A(
        \whitening_0/output_counter[9]_net_1 ), .B(
        \whitening_0/output_counter[10]_net_1 ), .C(
        \whitening_0/output_counter[11]_net_1 ), .Y(
        \whitening_0/DWACT_FINC_E[7] ));
    AND3 \two_mhz_clock_0/un5_counter_I_24  (.A(
        \two_mhz_clock_0/DWACT_FINC_E[0] ), .B(
        \two_mhz_clock_0/DWACT_FINC_E[2] ), .C(
        \two_mhz_clock_0/DWACT_FINC_E[3] ), .Y(
        \two_mhz_clock_0/DWACT_FINC_E[4] ));
    OR2A \dbpsk_modulator_0/counter_RNI67SA1[12]  (.A(
        \dbpsk_modulator_0/counter[12]_net_1 ), .B(
        \dbpsk_modulator_0/N_39 ), .Y(\dbpsk_modulator_0/N_40 ));
    DFN1C0 \main_clock_0/counter[5]  (.D(\main_clock_0/I_14 ), .CLK(
        GLA), .CLR(reset_c), .Q(\main_clock_0/counter[5]_net_1 ));
    MX2 \data_source_0/state_RNO_0[106]  (.A(
        \data_source_0/state[106]_net_1 ), .B(
        \data_source_0/state[105]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_257 ));
    XOR2 \two_mhz_clock_0/un5_counter_I_14  (.A(\two_mhz_clock_0/N_8 ), 
        .B(\two_mhz_clock_0/counter[5]_net_1 ), .Y(
        \two_mhz_clock_0/I_14_0 ));
    DFN1C0 \whitening_0/counter[4]  (.D(\whitening_0/N_19 ), .CLK(
        ref_signal_c), .CLR(reset_c), .Q(
        \whitening_0/counter[4]_net_1 ));
    NOR2B \data_source_0/state_RNO[70]  (.A(output_signal_c), .B(
        \data_source_0/N_221 ), .Y(\data_source_0/state_6[70] ));
    AND3 \main_clock_0/un5_counter_1_I_13  (.A(
        \main_clock_0/DWACT_FINC_E[0] ), .B(
        \main_clock_0/counter[3]_net_1 ), .C(
        \main_clock_0/counter[4]_net_1 ), .Y(\main_clock_0/N_4 ));
    AX1C \main_clock_0/un5_counter_1_I_12  (.A(
        \main_clock_0/counter[3]_net_1 ), .B(
        \main_clock_0/DWACT_FINC_E[0] ), .C(
        \main_clock_0/counter[4]_net_1 ), .Y(\main_clock_0/I_12 ));
    NOR3B \dbpsk_modulator_0/counter_RNIJEIK[15]  (.A(
        \dbpsk_modulator_0/counter_i_0[6] ), .B(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_3 ), .C(
        \dbpsk_modulator_0/counter[15]_net_1 ), .Y(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_7 ));
    NOR3 \whitening_0/counter_RNIV05R[4]  (.A(
        \whitening_0/counter[4]_net_1 ), .B(
        \whitening_0/counter[5]_net_1 ), .C(
        \whitening_0/counter[0]_net_1 ), .Y(
        \whitening_0/state_1_sqmuxa_i_a3_1 ));
    OR2A \modulator_0/clock_counter_RNID686[4]  (.A(
        \modulator_0/clock_counter[4]_net_1 ), .B(\modulator_0/N_41 ), 
        .Y(\modulator_0/N_42 ));
    CLKINT \modulator_0/output_signal_RNI2QGD  (.A(
        \modulator_0/output_signal_0 ), .Y(output_signal_c));
    XA1A \modulator_0/clock_counter_RNO[9]  (.A(
        \modulator_0/clock_counter[9]_net_1 ), .B(\modulator_0/N_46 ), 
        .C(trigger_signal_c), .Y(\modulator_0/clock_counter_n9 ));
    DFN1C0 \whitening_0/counter[11]  (.D(\whitening_0/counter_n11 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \whitening_0/counter[11]_net_1 ));
    DFN1C0 \main_clock_0/counter[2]  (.D(\main_clock_0/I_7 ), .CLK(GLA)
        , .CLR(reset_c), .Q(\main_clock_0/counter[2]_net_1 ));
    AO1B \modulator_0/counter_RNISQHA3[5]  (.A(
        \modulator_0/clock_counterlde_0_a2_1 ), .B(\modulator_0/N_151 )
        , .C(trigger_signal_c), .Y(\modulator_0/clock_countere ));
    DFN1C0 \data_source_0/state[10]  (.D(\data_source_0/state_6[10] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[10]_net_1 ));
    OA1B \dbpsk_modulator_0/counter_RNO_3[4]  (.A(
        \dbpsk_modulator_0/counter_i_0[3] ), .B(
        \dbpsk_modulator_0/N_30 ), .C(
        \dbpsk_modulator_0/counter[4]_net_1 ), .Y(
        \dbpsk_modulator_0/N_105 ));
    XOR2 \whitening_0/un2_output_counter_1_I_5  (.A(
        \whitening_0/output_counter[0]_net_1 ), .B(
        \whitening_0/output_counter[1]_net_1 ), .Y(\whitening_0/I_5_1 )
        );
    IOTRI_OB_EB \ref_signal_pad/U0/U1  (.D(ref_signal_c), .E(VCC), 
        .DOUT(\ref_signal_pad/U0/NET1 ), .EOUT(
        \ref_signal_pad/U0/NET2 ));
    DFN1C0 \data_source_0/state[61]  (.D(\data_source_0/state_6[61] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[61]_net_1 ));
    MX2 \data_source_0/state_RNO_0[21]  (.A(
        \data_source_0/state[21]_net_1 ), .B(
        \data_source_0/state[20]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_172 ));
    MX2 \data_source_0/state_RNO_0[81]  (.A(
        \data_source_0/state[81]_net_1 ), .B(
        \data_source_0/state[80]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_232 ));
    NOR2B \data_source_0/state_RNO[72]  (.A(output_signal_c), .B(
        \data_source_0/N_223 ), .Y(\data_source_0/state_6[72] ));
    DFN1P0 \whitening_0/counter[3]  (.D(\whitening_0/N_21 ), .CLK(
        ref_signal_c), .PRE(reset_c), .Q(\whitening_0/counter_i_0[3] ));
    NOR3A \modulator_0/output_signal_RNO_8  (.A(
        \modulator_0/output_signal_1_sqmuxa_i_a2_1 ), .B(
        \modulator_0/clock_counter[9]_net_1 ), .C(
        \modulator_0/clock_counter[10]_net_1 ), .Y(
        \modulator_0/output_signal_1_sqmuxa_i_a2_2 ));
    DFN1C0 \data_source_0/state[67]  (.D(\data_source_0/state_6[67] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[67]_net_1 ));
    MX2 \data_source_0/state_RNO_0[140]  (.A(
        \data_source_0/state[140]_net_1 ), .B(
        \data_source_0/state[139]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_291 ));
    OR2A \data_source_0/state_RNO[73]  (.A(output_signal_c), .B(
        \data_source_0/N_224 ), .Y(\data_source_0/state_6[73] ));
    DFN1C0 \data_source_0/state[12]  (.D(\data_source_0/state_6[12] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[12]_net_1 ));
    NOR3A \data_source_0/counter_RNO[4]  (.A(output_signal_c), .B(
        \data_source_0/N_77 ), .C(\data_source_0/N_56_i ), .Y(
        \data_source_0/N_20 ));
    AO1B \dbpsk_modulator_0/counter_RNO_0[5]  (.A(
        \dbpsk_modulator_0/counter_n5_i_a3_0_0 ), .B(
        \dbpsk_modulator_0/N_123 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/counter_n5_i_0 ));
    OR2 \dbpsk_modulator_0/counter_RNIKOND[7]  (.A(
        \dbpsk_modulator_0/N_34 ), .B(
        \dbpsk_modulator_0/counter_i_0[7] ), .Y(
        \dbpsk_modulator_0/N_35 ));
    MX2 \data_source_0/state_RNO_0[137]  (.A(
        \data_source_0/state[137]_net_1 ), .B(
        \data_source_0/state[136]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_288 ));
    OR2A \whitening_0/counter_RNIJQ054[13]  (.A(
        \whitening_0/counter[13]_net_1 ), .B(\whitening_0/N_48 ), .Y(
        \whitening_0/N_49 ));
    XA1A \dbpsk_modulator_0/counter_RNO[11]  (.A(
        \dbpsk_modulator_0/counter[11]_net_1 ), .B(
        \dbpsk_modulator_0/N_38 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/counter_n11 ));
    MX2 \data_source_0/state_RNO_0[64]  (.A(
        \data_source_0/state[64]_net_1 ), .B(
        \data_source_0/state[63]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_215 ));
    NOR3B \two_mhz_clock_0/counter_RNILKDS1[2]  (.A(
        \two_mhz_clock_0/counter[5]_net_1 ), .B(
        \two_mhz_clock_0/counter14_3 ), .C(
        \two_mhz_clock_0/counter[2]_net_1 ), .Y(
        \two_mhz_clock_0/counter14_7 ));
    DFN1C0 \data_source_0/state[35]  (.D(\data_source_0/state_6[35] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[35]_net_1 ));
    DFN1C0 \data_source_0/state[13]  (.D(\data_source_0/state_6[13] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[13]_net_1 ));
    AND3 \whitening_0/un2_output_counter_1_I_39  (.A(
        \whitening_0/DWACT_FINC_E[6] ), .B(
        \whitening_0/DWACT_FINC_E[7] ), .C(
        \whitening_0/DWACT_FINC_E[8] ), .Y(\whitening_0/N_3 ));
    DFN1C0 \modulator_0/counter[4]  (.D(\modulator_0/counter_n4 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \modulator_0/counter[4]_net_1 ));
    MX2 \data_source_0/state_RNO_0[60]  (.A(
        \data_source_0/state[60]_net_1 ), .B(
        \data_source_0/state[59]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_211 ));
    OR2 \data_source_0/counter_RNIGO4T[2]  (.A(\data_source_0/N_30 ), 
        .B(\data_source_0/counter_i_0[2] ), .Y(\data_source_0/N_31 ));
    NOR3B \two_mhz_clock_0/counter_RNI87DS1[1]  (.A(
        \two_mhz_clock_0/counter[4]_net_1 ), .B(
        \two_mhz_clock_0/counter14_5 ), .C(
        \two_mhz_clock_0/counter[1]_net_1 ), .Y(
        \two_mhz_clock_0/counter14_8 ));
    NOR2B \data_source_0/state_RNO[11]  (.A(output_signal_c), .B(
        \data_source_0/N_162 ), .Y(\data_source_0/state_6[11] ));
    AND3 \whitening_0/un2_output_counter_1_I_8  (.A(
        \whitening_0/output_counter[0]_net_1 ), .B(
        \whitening_0/output_counter[1]_net_1 ), .C(
        \whitening_0/output_counter[2]_net_1 ), .Y(\whitening_0/N_14 ));
    AND3 \two_mhz_clock_0/un5_counter_I_22  (.A(
        \two_mhz_clock_0/DWACT_FINC_E[0] ), .B(
        \two_mhz_clock_0/DWACT_FINC_E[2] ), .C(
        \two_mhz_clock_0/DWACT_FINC_E[3] ), .Y(\two_mhz_clock_0/N_5 ));
    OR2A \data_source_0/state_RNO[108]  (.A(output_signal_c), .B(
        \data_source_0/N_259 ), .Y(\data_source_0/state_6[108] ));
    DFN1C0 \data_source_0/state[138]  (.D(\data_source_0/state_6[138] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[138]_net_1 ));
    XA1A \modulator_0/clock_counter_RNO[15]  (.A(
        \modulator_0/clock_counter[15]_net_1 ), .B(\modulator_0/N_91 ), 
        .C(trigger_signal_c), .Y(\modulator_0/clock_counter_n15 ));
    MX2 \data_source_0/state_RNO_0[73]  (.A(
        \data_source_0/state[73]_net_1 ), .B(
        \data_source_0/state[72]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_224 ));
    NOR2 \two_mhz_clock_0/counter_RNIUT6U[6]  (.A(
        \two_mhz_clock_0/counter[8]_net_1 ), .B(
        \two_mhz_clock_0/counter[6]_net_1 ), .Y(
        \two_mhz_clock_0/counter14_3 ));
    MX2 \data_source_0/state_RNO_0[57]  (.A(
        \data_source_0/state[57]_net_1 ), .B(
        \data_source_0/state[56]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_208 ));
    AX1C \two_mhz_clock_0/un5_counter_I_12  (.A(
        \two_mhz_clock_0/counter[3]_net_1 ), .B(
        \two_mhz_clock_0/DWACT_FINC_E[0] ), .C(
        \two_mhz_clock_0/counter[4]_net_1 ), .Y(
        \two_mhz_clock_0/I_12_0 ));
    NOR2B \data_source_0/state_RNO[17]  (.A(output_signal_c), .B(
        \data_source_0/N_168 ), .Y(\data_source_0/state_6[17] ));
    OR2A \whitening_0/counter_RNI43553[10]  (.A(
        \whitening_0/counter[10]_net_1 ), .B(\whitening_0/N_45 ), .Y(
        \whitening_0/N_46 ));
    DFN1C0 \dbpsk_modulator_0/counter[9]  (.D(
        \dbpsk_modulator_0/counter_n9 ), .CLK(ref_signal_c), .CLR(
        reset_c), .Q(\dbpsk_modulator_0/counter[9]_net_1 ));
    NOR3B \modulator_0/output_signal_RNO_0  (.A(\modulator_0/N_55 ), 
        .B(\modulator_0/output_signal_1_sqmuxa_i_a2_0_2 ), .C(
        \modulator_0/N_47 ), .Y(\modulator_0/N_146 ));
    NOR2B \data_source_0/state_RNO[112]  (.A(output_signal_c), .B(
        \data_source_0/N_263 ), .Y(\data_source_0/state_6[112] ));
    XA1B \modulator_0/counter_RNO[4]  (.A(
        \modulator_0/counter[4]_net_1 ), .B(\modulator_0/counter_c3 ), 
        .C(\modulator_0/N_8 ), .Y(\modulator_0/counter_n4 ));
    AX1C \two_mhz_clock_0/clock_out_RNO  (.A(
        \two_mhz_clock_0/counter14_8 ), .B(
        \two_mhz_clock_0/counter14_9 ), .C(clock_out_c), .Y(
        \two_mhz_clock_0/clock_out_RNO_0 ));
    NOR3 \data_source_0/counter_RNIMU4T[4]  (.A(
        \data_source_0/counter[4]_net_1 ), .B(
        \data_source_0/counter[5]_net_1 ), .C(
        \data_source_0/counter[0]_net_1 ), .Y(
        \data_source_0/counter23_0_a2_1 ));
    MX2 \data_source_0/state_RNO_0[76]  (.A(
        \data_source_0/state[76]_net_1 ), .B(
        \data_source_0/state[75]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_227 ));
    XA1B \modulator_0/counter_RNO[3]  (.A(
        \modulator_0/counter[3]_net_1 ), .B(\modulator_0/counter_c2 ), 
        .C(\modulator_0/N_8 ), .Y(\modulator_0/counter_n3 ));
    DFN1C0 \modulator_0/counter[0]  (.D(\modulator_0/counter_n0 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \modulator_0/counter[0]_net_1 ));
    MX2 \data_source_0/state_RNO_0[100]  (.A(
        \data_source_0/state[100]_net_1 ), .B(
        \data_source_0/state[99]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_251 ));
    XA1A \data_source_0/counter_RNO[14]  (.A(
        \data_source_0/counter[14]_net_1 ), .B(\data_source_0/N_42 ), 
        .C(output_signal_c), .Y(\data_source_0/counter_n14 ));
    XA1A \modulator_0/clock_counter_RNO[14]  (.A(
        \modulator_0/clock_counter[14]_net_1 ), .B(\modulator_0/N_52 ), 
        .C(trigger_signal_c), .Y(\modulator_0/clock_counter_n14 ));
    OR2A \data_source_0/state_RNO[28]  (.A(output_signal_c), .B(
        \data_source_0/N_179 ), .Y(\data_source_0/state_6[28] ));
    OR2A \data_source_0/state_RNO[31]  (.A(output_signal_c), .B(
        \data_source_0/N_182 ), .Y(\data_source_0/state_6[31] ));
    DFN1C0 \two_mhz_clock_0/counter[8]  (.D(\two_mhz_clock_0/I_23 ), 
        .CLK(GLA), .CLR(reset_c), .Q(
        \two_mhz_clock_0/counter[8]_net_1 ));
    OR2A \data_source_0/state_RNO[81]  (.A(output_signal_c), .B(
        \data_source_0/N_232 ), .Y(\data_source_0/state_6[81] ));
    OR2A \data_source_0/state_RNO[105]  (.A(output_signal_c), .B(
        \data_source_0/N_256 ), .Y(\data_source_0/state_6[105] ));
    NOR2B \data_source_0/state_RNO[6]  (.A(output_signal_c), .B(
        \data_source_0/N_157 ), .Y(\data_source_0/state_6[6] ));
    DFN1P0 \data_source_0/state[81]  (.D(\data_source_0/state_6[81] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[81]_net_1 ));
    NOR3C \whitening_0/counter_RNO_0[4]  (.A(
        \whitening_0/counter[0]_net_1 ), .B(
        \whitening_0/counter[5]_net_1 ), .C(
        \whitening_0/counter_RNI3P3V3[2]_net_1 ), .Y(
        \whitening_0/N_115 ));
    NOR2B \data_source_0/state_RNO[37]  (.A(output_signal_c), .B(
        \data_source_0/N_188 ), .Y(\data_source_0/state_6[37] ));
    NOR2 \whitening_0/counter_RNI9P7L[10]  (.A(
        \whitening_0/counter[13]_net_1 ), .B(
        \whitening_0/counter[10]_net_1 ), .Y(
        \whitening_0/counter_n5_i_a2_0_4 ));
    DFN1C0 \two_mhz_clock_0/counter[5]  (.D(
        \two_mhz_clock_0/counter_3[5] ), .CLK(GLA), .CLR(reset_c), .Q(
        \two_mhz_clock_0/counter[5]_net_1 ));
    NOR2B \data_source_0/state_RNO[141]  (.A(output_signal_c), .B(
        \data_source_0/N_292 ), .Y(\data_source_0/state_6[141] ));
    IOTRI_OB_EB \RSS_EN_pad/U0/U1  (.D(VCC), .E(VCC), .DOUT(
        \RSS_EN_pad/U0/NET1 ), .EOUT(\RSS_EN_pad/U0/NET2 ));
    XA1 \whitening_0/output_whitening_RNO  (.A(
        data_source_0_output_data), .B(
        \whitening_0/output_whitening_4_i_x2_0 ), .C(output_signal_c), 
        .Y(\whitening_0/N_32 ));
    MX2 \data_source_0/state_RNO_0[65]  (.A(
        \data_source_0/state[65]_net_1 ), .B(
        \data_source_0/state[64]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_216 ));
    OR2A \data_source_0/state_RNO[87]  (.A(output_signal_c), .B(
        \data_source_0/N_238 ), .Y(\data_source_0/state_6[87] ));
    AND3 \main_clock_0/un5_counter_1_I_16  (.A(
        \main_clock_0/DWACT_FINC_E[0] ), .B(
        \main_clock_0/DWACT_FINC_E[1] ), .C(
        \main_clock_0/counter[5]_net_1 ), .Y(\main_clock_0/N_3 ));
    DFN1P0 \data_source_0/state[87]  (.D(\data_source_0/state_6[87] ), 
        .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \data_source_0/state[87]_net_1 ));
    NOR2B \data_source_0/state_RNO[9]  (.A(output_signal_c), .B(
        \data_source_0/N_160 ), .Y(\data_source_0/state_6[9] ));
    NOR2B \data_source_0/state_RNO[107]  (.A(output_signal_c), .B(
        \data_source_0/N_258 ), .Y(\data_source_0/state_6[107] ));
    NOR2B \dbpsk_modulator_0/output_dbpsk_RNO_1  (.A(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a3_1 ), .B(
        \dbpsk_modulator_0/N_122 ), .Y(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a3_2 ));
    NOR2B \data_source_0/state_RNO[74]  (.A(output_signal_c), .B(
        \data_source_0/N_225 ), .Y(\data_source_0/state_6[74] ));
    DFN1C0 \data_source_0/state[2]  (.D(\data_source_0/state_6[2] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[2]_net_1 ));
    NOR2B \data_source_0/state_RNO[98]  (.A(output_signal_c), .B(
        \data_source_0/N_249 ), .Y(\data_source_0/state_6[98] ));
    DFN1C0 \whitening_0/counter[15]  (.D(\whitening_0/counter_n15 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \whitening_0/counter[15]_net_1 ));
    AND3 \main_clock_0/un5_counter_1_I_10  (.A(
        \main_clock_0/counter[0]_net_1 ), .B(
        \main_clock_0/counter[1]_net_1 ), .C(
        \main_clock_0/counter[2]_net_1 ), .Y(
        \main_clock_0/DWACT_FINC_E[0] ));
    XOR2 \whitening_0/un2_output_counter_1_I_32  (.A(\whitening_0/N_6 )
        , .B(\whitening_0/output_counter[11]_net_1 ), .Y(
        \whitening_0/I_32_0 ));
    XOR2 \two_mhz_clock_0/un5_counter_I_9  (.A(\two_mhz_clock_0/N_10 ), 
        .B(\two_mhz_clock_0/counter[3]_net_1 ), .Y(
        \two_mhz_clock_0/I_9_0 ));
    AND3 \whitening_0/un2_output_counter_1_I_27  (.A(
        \whitening_0/DWACT_FINC_E[4] ), .B(
        \whitening_0/output_counter[8]_net_1 ), .C(
        \whitening_0/output_counter[9]_net_1 ), .Y(\whitening_0/N_7 ));
    MX2 \data_source_0/state_RNO_0[49]  (.A(
        \data_source_0/state[49]_net_1 ), .B(
        \data_source_0/state[48]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_200 ));
    DFN1C0 \data_source_0/counter[13]  (.D(\data_source_0/counter_n13 )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/counter[13]_net_1 ));
    DFN1C0 \data_source_0/state[14]  (.D(\data_source_0/state_6[14] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[14]_net_1 ));
    NOR2 \whitening_0/output_whitening_RNO_6  (.A(
        \whitening_0/output_counter[0]_net_1 ), .B(
        \whitening_0/output_counter[3]_net_1 ), .Y(
        \whitening_0/output_counter21_7 ));
    NOR2B \data_source_0/state_RNO[61]  (.A(output_signal_c), .B(
        \data_source_0/N_212 ), .Y(\data_source_0/state_6[61] ));
    MX2 \data_source_0/state_RNO_0[13]  (.A(
        \data_source_0/state[13]_net_1 ), .B(
        \data_source_0/state[12]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_164 ));
    DFN1C0 \data_source_0/state[115]  (.D(\data_source_0/state_6[115] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[115]_net_1 ));
    DFN1C0 \data_source_0/state[126]  (.D(\data_source_0/state_6[126] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[126]_net_1 ));
    NOR3C \data_source_0/counter_RNO_0[5]  (.A(
        \data_source_0/counter[0]_net_1 ), .B(
        \data_source_0/counter[4]_net_1 ), .C(\data_source_0/N_94 ), 
        .Y(\data_source_0/N_76 ));
    DFN1C0 \main_clock_0/counter[6]  (.D(\main_clock_0/I_17 ), .CLK(
        GLA), .CLR(reset_c), .Q(\main_clock_0/counter[6]_net_1 ));
    NOR2B \data_source_0/state_RNO[67]  (.A(output_signal_c), .B(
        \data_source_0/N_218 ), .Y(\data_source_0/state_6[67] ));
    DFN1P0 \whitening_0/counter[7]  (.D(\whitening_0/N_13_0 ), .CLK(
        ref_signal_c), .PRE(reset_c), .Q(\whitening_0/counter_i_0[7] ));
    MX2 \data_source_0/state_RNO_0[104]  (.A(
        \data_source_0/state[104]_net_1 ), .B(
        \data_source_0/state[103]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_255 ));
    NOR2B \data_source_0/state_RNO[0]  (.A(output_signal_c), .B(
        \data_source_0/N_151 ), .Y(\data_source_0/state_6[0] ));
    NOR2B \data_source_0/state_RNO[29]  (.A(output_signal_c), .B(
        \data_source_0/N_180 ), .Y(\data_source_0/state_6[29] ));
    DFN1C0 \data_source_0/state[0]  (.D(\data_source_0/state_6[0] ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[0]_net_1 ));
    MX2 \data_source_0/state_RNO_0[16]  (.A(
        \data_source_0/state[16]_net_1 ), .B(
        \data_source_0/state[15]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_167 ));
    DFN1P0 \dbpsk_modulator_0/counter[2]  (.D(\dbpsk_modulator_0/N_23 )
        , .CLK(ref_signal_c), .PRE(reset_c), .Q(
        \dbpsk_modulator_0/counter_i_0[2] ));
    MX2 \data_source_0/state_RNO_0[113]  (.A(
        \data_source_0/state[113]_net_1 ), .B(
        \data_source_0/state[112]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_264 ));
    AND3 \two_mhz_clock_0/un5_counter_I_29  (.A(
        \two_mhz_clock_0/counter[6]_net_1 ), .B(
        \two_mhz_clock_0/counter[7]_net_1 ), .C(
        \two_mhz_clock_0/counter[8]_net_1 ), .Y(
        \two_mhz_clock_0/DWACT_FINC_E[5] ));
    DFN1C0 \two_mhz_clock_0/counter[3]  (.D(\two_mhz_clock_0/I_9_0 ), 
        .CLK(GLA), .CLR(reset_c), .Q(
        \two_mhz_clock_0/counter[3]_net_1 ));
    DFN1C0 \data_source_0/state[117]  (.D(\data_source_0/state_6[117] )
        , .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \data_source_0/state[117]_net_1 ));
    NOR2A \data_source_0/output_data_RNO_0  (.A(output_signal_c), .B(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/state_1_sqmuxa ));
    AND3 \two_mhz_clock_0/un5_counter_I_19  (.A(
        \two_mhz_clock_0/DWACT_FINC_E[0] ), .B(
        \two_mhz_clock_0/DWACT_FINC_E[2] ), .C(
        \two_mhz_clock_0/counter[6]_net_1 ), .Y(\two_mhz_clock_0/N_6 ));
    NOR3C \modulator_0/output_signal_RNO_3  (.A(
        \modulator_0/clock_counter[6]_net_1 ), .B(
        \modulator_0/clock_counter[8]_net_1 ), .C(
        \modulator_0/output_signal_1_sqmuxa_i_a2_0_1 ), .Y(
        \modulator_0/output_signal_1_sqmuxa_i_a2_0_2 ));
    OR2A \data_source_0/counter_RNI3DP13[10]  (.A(
        \data_source_0/counter[10]_net_1 ), .B(\data_source_0/N_38 ), 
        .Y(\data_source_0/N_39 ));
    MX2 \data_source_0/state_RNO_0[0]  (.A(
        \data_source_0/state[0]_net_1 ), .B(
        \data_source_0/state[143]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_151 ));
    OA1 \modulator_0/output_signal_RNO_2  (.A(\modulator_0/N_45 ), .B(
        \modulator_0/N_150 ), .C(
        \modulator_0/output_signal_1_sqmuxa_i_a2_2 ), .Y(
        \modulator_0/N_145 ));
    NOR2B \data_source_0/state_RNO[101]  (.A(output_signal_c), .B(
        \data_source_0/N_252 ), .Y(\data_source_0/state_6[101] ));
    OR2 \whitening_0/counter_RNIPQ4R[2]  (.A(\whitening_0/N_37 ), .B(
        \whitening_0/counter_i_0[2] ), .Y(\whitening_0/N_38 ));
    NOR2B \data_source_0/state_RNO[109]  (.A(output_signal_c), .B(
        \data_source_0/N_260 ), .Y(\data_source_0/state_6[109] ));
    XAI1 \data_source_0/counter_RNO[6]  (.A(
        \data_source_0/counter_i_0[6] ), .B(\data_source_0/N_34 ), .C(
        output_signal_c), .Y(\data_source_0/N_16 ));
    DFN1C0 \two_mhz_clock_0/counter[6]  (.D(\two_mhz_clock_0/I_17_0 ), 
        .CLK(GLA), .CLR(reset_c), .Q(
        \two_mhz_clock_0/counter[6]_net_1 ));
    MX2 \data_source_0/state_RNO_0[72]  (.A(
        \data_source_0/state[72]_net_1 ), .B(
        \data_source_0/state[71]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_223 ));
    NOR2 \whitening_0/output_counter_RNI08PF[12]  (.A(
        \whitening_0/output_counter[12]_net_1 ), .B(
        \whitening_0/output_counter[9]_net_1 ), .Y(
        \whitening_0/output_counter17_4 ));
    DFN1E1C0 \modulator_0/clock_counter[12]  (.D(
        \modulator_0/clock_counter_n12 ), .CLK(ref_signal_c), .CLR(
        reset_c), .E(\modulator_0/clock_countere ), .Q(
        \modulator_0/un6lto12 ));
    NOR2B \data_source_0/state_RNO[99]  (.A(output_signal_c), .B(
        \data_source_0/N_250 ), .Y(\data_source_0/state_6[99] ));
    MX2 \data_source_0/state_RNO_0[51]  (.A(
        \data_source_0/state[51]_net_1 ), .B(
        \data_source_0/state[50]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_202 ));
    NOR2 \dbpsk_modulator_0/counter_RNI794H[13]  (.A(
        \dbpsk_modulator_0/counter[13]_net_1 ), .B(
        \dbpsk_modulator_0/counter[14]_net_1 ), .Y(
        \dbpsk_modulator_0/output_dbpsk_0_sqmuxa_i_a2_5 ));
    NOR2B \data_source_0/state_RNO[51]  (.A(output_signal_c), .B(
        \data_source_0/N_202 ), .Y(\data_source_0/state_6[51] ));
    MX2 \data_source_0/state_RNO_0[68]  (.A(
        \data_source_0/state[68]_net_1 ), .B(
        \data_source_0/state[67]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_219 ));
    OR2A \data_source_0/state_RNO[132]  (.A(output_signal_c), .B(
        \data_source_0/N_283 ), .Y(\data_source_0/state_6[132] ));
    NOR3C \whitening_0/output_whitening_RNO_1  (.A(
        \whitening_0/output_counter17_5 ), .B(
        \whitening_0/output_counter17_4 ), .C(
        \whitening_0/output_counter21_11 ), .Y(
        \whitening_0/output_counter21_13 ));
    OR2A \data_source_0/state_RNO[57]  (.A(output_signal_c), .B(
        \data_source_0/N_208 ), .Y(\data_source_0/state_6[57] ));
    XA1A \whitening_0/counter_RNO[11]  (.A(
        \whitening_0/counter[11]_net_1 ), .B(\whitening_0/N_46 ), .C(
        output_signal_c), .Y(\whitening_0/counter_n11 ));
    MX2 \data_source_0/state_RNO_0[123]  (.A(
        \data_source_0/state[123]_net_1 ), .B(
        \data_source_0/state[122]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_274 ));
    XOR2 \two_mhz_clock_0/un5_counter_I_23  (.A(\two_mhz_clock_0/N_5 ), 
        .B(\two_mhz_clock_0/counter[8]_net_1 ), .Y(
        \two_mhz_clock_0/I_23 ));
    DFN1C0 \two_mhz_clock_0/counter[9]  (.D(\two_mhz_clock_0/I_26 ), 
        .CLK(GLA), .CLR(reset_c), .Q(
        \two_mhz_clock_0/counter[9]_net_1 ));
    NOR2B \data_source_0/state_RNO[76]  (.A(output_signal_c), .B(
        \data_source_0/N_227 ), .Y(\data_source_0/state_6[76] ));
    MX2 \data_source_0/state_RNO_0[47]  (.A(
        \data_source_0/state[47]_net_1 ), .B(
        \data_source_0/state[46]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_198 ));
    MX2 \data_source_0/state_RNO_0[109]  (.A(
        \data_source_0/state[109]_net_1 ), .B(
        \data_source_0/state[108]_net_1 ), .S(
        \data_source_0/counter_RNII6P43_0[4]_net_1 ), .Y(
        \data_source_0/N_260 ));
    AND3 \two_mhz_clock_0/un5_counter_I_13  (.A(
        \two_mhz_clock_0/DWACT_FINC_E[0] ), .B(
        \two_mhz_clock_0/counter[3]_net_1 ), .C(
        \two_mhz_clock_0/counter[4]_net_1 ), .Y(\two_mhz_clock_0/N_8 ));
    DFN0E1C0 \whitening_0/output_counter[14]  (.D(\whitening_0/I_40 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .E(output_signal_c), .Q(
        \whitening_0/output_counter[14]_net_1 ));
    NOR2B \data_source_0/counter_RNO_0[1]  (.A(
        \data_source_0/counter[5]_net_1 ), .B(
        \data_source_0/counter[4]_net_1 ), .Y(
        \data_source_0/counter_n1_i_a2_0_0 ));
    DFN1C0 \whitening_0/counter[0]  (.D(\whitening_0/counter_n0 ), 
        .CLK(ref_signal_c), .CLR(reset_c), .Q(
        \whitening_0/counter[0]_net_1 ));
    XAI1 \dbpsk_modulator_0/counter_RNO[8]  (.A(
        \dbpsk_modulator_0/counter_i_0[8] ), .B(
        \dbpsk_modulator_0/N_35 ), .C(output_signal_c), .Y(
        \dbpsk_modulator_0/N_11 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
