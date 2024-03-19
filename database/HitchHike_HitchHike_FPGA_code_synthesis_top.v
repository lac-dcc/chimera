`timescale 1 ns/100 ps
// Version: v11.5 11.5.0.26


module pll_core(
       GLA,
       clock_c
    );
output GLA;
input  clock_c;

    wire CLKAP, Core_GLB, Core_GLC, LOCK, Core_YB, Core_YC, 
        pll_core_GND, pll_core_VCC;
    
    PLL #( .VCOFREQUENCY(25.000000) )  Core (.CLKA(CLKAP), .EXTFB(
        pll_core_GND), .POWERDOWN(pll_core_VCC), .GLA(GLA), .LOCK(LOCK)
        , .GLB(Core_GLB), .YB(Core_YB), .GLC(Core_GLC), .YC(Core_YC), 
        .OADIV0(pll_core_GND), .OADIV1(pll_core_GND), .OADIV2(
        pll_core_GND), .OADIV3(pll_core_GND), .OADIV4(pll_core_GND), 
        .OAMUX0(pll_core_GND), .OAMUX1(pll_core_GND), .OAMUX2(
        pll_core_VCC), .DLYGLA0(pll_core_GND), .DLYGLA1(pll_core_GND), 
        .DLYGLA2(pll_core_GND), .DLYGLA3(pll_core_GND), .DLYGLA4(
        pll_core_GND), .OBDIV0(pll_core_GND), .OBDIV1(pll_core_GND), 
        .OBDIV2(pll_core_GND), .OBDIV3(pll_core_GND), .OBDIV4(
        pll_core_GND), .OBMUX0(pll_core_GND), .OBMUX1(pll_core_GND), 
        .OBMUX2(pll_core_GND), .DLYYB0(pll_core_GND), .DLYYB1(
        pll_core_GND), .DLYYB2(pll_core_GND), .DLYYB3(pll_core_GND), 
        .DLYYB4(pll_core_GND), .DLYGLB0(pll_core_GND), .DLYGLB1(
        pll_core_GND), .DLYGLB2(pll_core_GND), .DLYGLB3(pll_core_GND), 
        .DLYGLB4(pll_core_GND), .OCDIV0(pll_core_GND), .OCDIV1(
        pll_core_GND), .OCDIV2(pll_core_GND), .OCDIV3(pll_core_GND), 
        .OCDIV4(pll_core_GND), .OCMUX0(pll_core_GND), .OCMUX1(
        pll_core_GND), .OCMUX2(pll_core_GND), .DLYYC0(pll_core_GND), 
        .DLYYC1(pll_core_GND), .DLYYC2(pll_core_GND), .DLYYC3(
        pll_core_GND), .DLYYC4(pll_core_GND), .DLYGLC0(pll_core_GND), 
        .DLYGLC1(pll_core_GND), .DLYGLC2(pll_core_GND), .DLYGLC3(
        pll_core_GND), .DLYGLC4(pll_core_GND), .FINDIV0(pll_core_VCC), 
        .FINDIV1(pll_core_VCC), .FINDIV2(pll_core_GND), .FINDIV3(
        pll_core_GND), .FINDIV4(pll_core_GND), .FINDIV5(pll_core_GND), 
        .FINDIV6(pll_core_GND), .FBDIV0(pll_core_GND), .FBDIV1(
        pll_core_GND), .FBDIV2(pll_core_VCC), .FBDIV3(pll_core_GND), 
        .FBDIV4(pll_core_GND), .FBDIV5(pll_core_GND), .FBDIV6(
        pll_core_GND), .FBDLY0(pll_core_GND), .FBDLY1(pll_core_GND), 
        .FBDLY2(pll_core_GND), .FBDLY3(pll_core_GND), .FBDLY4(
        pll_core_GND), .FBSEL0(pll_core_VCC), .FBSEL1(pll_core_GND), 
        .XDLYSEL(pll_core_GND), .VCOSEL0(pll_core_GND), .VCOSEL1(
        pll_core_GND), .VCOSEL2(pll_core_GND));
    PLLINT pllint1 (.A(clock_c), .Y(CLKAP));
    VCC VCC_i (.Y(pll_core_VCC));
    GND GND_i (.Y(pll_core_GND));
    
endmodule


module data_rate(
       output_data_rate_c,
       GLA,
       reset_c
    );
output output_data_rate_c;
input  GLA;
input  reset_c;

    wire N_7, \counter[1]_net_1 , \counter[0]_net_1 , N_5, 
        \counter[3]_net_1 , \DWACT_FINC_E[0] , counter14_4, 
        counter14_2, \counter[2]_net_1 , \counter[5]_net_1 , 
        counter14_3, \counter[6]_net_1 , \counter[7]_net_1 , 
        \counter[4]_net_1 , output_data_rate_RNO_net_1, \counter_3[4] , 
        I_12_0, \counter_3[3] , I_9_0, \counter_3[0] , I_5_0, I_7_0, 
        I_14_0, I_17, I_20, N_2, \DWACT_FINC_E[2] , N_3, 
        \DWACT_FINC_E[1] , N_4, N_6, GND, VCC;
    
    NOR2B un5_counter_1_I_11 (.A(\counter[3]_net_1 ), .B(
        \DWACT_FINC_E[0] ), .Y(N_5));
    DFN1C0 \counter[2]  (.D(I_7_0), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[2]_net_1 ));
    DFN1C0 \counter[7]  (.D(I_20), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[7]_net_1 ));
    AND3 un5_counter_1_I_19 (.A(\DWACT_FINC_E[0] ), .B(
        \DWACT_FINC_E[2] ), .C(\counter[6]_net_1 ), .Y(N_2));
    XOR2 un5_counter_1_I_12 (.A(N_5), .B(\counter[4]_net_1 ), .Y(
        I_12_0));
    AX1C output_data_rate_RNO (.A(counter14_3), .B(counter14_4), .C(
        output_data_rate_c), .Y(output_data_rate_RNO_net_1));
    DFN1C0 output_data_rate (.D(output_data_rate_RNO_net_1), .CLK(GLA), 
        .CLR(reset_c), .Q(output_data_rate_c));
    AOI1 \counter_RNO[0]  (.A(counter14_4), .B(counter14_3), .C(
        \counter[0]_net_1 ), .Y(\counter_3[0] ));
    DFN1C0 \counter[6]  (.D(I_17), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[6]_net_1 ));
    AOI1B \counter_RNO[4]  (.A(counter14_4), .B(counter14_3), .C(
        I_12_0), .Y(\counter_3[4] ));
    VCC VCC_i (.Y(VCC));
    AND3 un5_counter_1_I_18 (.A(\counter[3]_net_1 ), .B(
        \counter[4]_net_1 ), .C(\counter[5]_net_1 ), .Y(
        \DWACT_FINC_E[2] ));
    NOR3A \counter_RNIEO8B1[7]  (.A(\counter[3]_net_1 ), .B(
        \counter[6]_net_1 ), .C(\counter[7]_net_1 ), .Y(counter14_3));
    AND3 un5_counter_1_I_10 (.A(\counter[0]_net_1 ), .B(
        \counter[1]_net_1 ), .C(\counter[2]_net_1 ), .Y(
        \DWACT_FINC_E[0] ));
    XOR2 un5_counter_1_I_9 (.A(N_6), .B(\counter[3]_net_1 ), .Y(I_9_0));
    AND3 un5_counter_1_I_8 (.A(\counter[0]_net_1 ), .B(
        \counter[1]_net_1 ), .C(\counter[2]_net_1 ), .Y(N_6));
    NOR2B un5_counter_1_I_6 (.A(\counter[1]_net_1 ), .B(
        \counter[0]_net_1 ), .Y(N_7));
    AND3 un5_counter_1_I_13 (.A(\DWACT_FINC_E[0] ), .B(
        \counter[3]_net_1 ), .C(\counter[4]_net_1 ), .Y(N_4));
    DFN1C0 \counter[4]  (.D(\counter_3[4] ), .CLK(GLA), .CLR(reset_c), 
        .Q(\counter[4]_net_1 ));
    XOR2 un5_counter_1_I_20 (.A(N_2), .B(\counter[7]_net_1 ), .Y(I_20));
    DFN1C0 \counter[5]  (.D(I_14_0), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[5]_net_1 ));
    XOR2 un5_counter_1_I_14 (.A(N_4), .B(\counter[5]_net_1 ), .Y(
        I_14_0));
    XOR2 un5_counter_1_I_7 (.A(N_7), .B(\counter[2]_net_1 ), .Y(I_7_0));
    XOR2 un5_counter_1_I_17 (.A(N_3), .B(\counter[6]_net_1 ), .Y(I_17));
    AND3 un5_counter_1_I_16 (.A(\DWACT_FINC_E[0] ), .B(
        \DWACT_FINC_E[1] ), .C(\counter[5]_net_1 ), .Y(N_3));
    NOR2A \counter_RNIPVQS[1]  (.A(\counter[4]_net_1 ), .B(
        \counter[1]_net_1 ), .Y(counter14_2));
    GND GND_i (.Y(GND));
    AOI1B \counter_RNO[3]  (.A(counter14_4), .B(counter14_3), .C(I_9_0)
        , .Y(\counter_3[3] ));
    DFN1C0 \counter[1]  (.D(I_5_0), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[1]_net_1 ));
    NOR3A \counter_RNIK1MP1[2]  (.A(counter14_2), .B(
        \counter[2]_net_1 ), .C(\counter[5]_net_1 ), .Y(counter14_4));
    DFN1C0 \counter[3]  (.D(\counter_3[3] ), .CLK(GLA), .CLR(reset_c), 
        .Q(\counter[3]_net_1 ));
    XOR2 un5_counter_1_I_5 (.A(\counter[0]_net_1 ), .B(
        \counter[1]_net_1 ), .Y(I_5_0));
    AND2 un5_counter_1_I_15 (.A(\counter[3]_net_1 ), .B(
        \counter[4]_net_1 ), .Y(\DWACT_FINC_E[1] ));
    DFN1C0 \counter[0]  (.D(\counter_3[0] ), .CLK(GLA), .CLR(reset_c), 
        .Q(\counter[0]_net_1 ));
    
endmodule


module modulator(
       reset_c,
       trigger_signal_c,
       clock_out_c,
       output_signal_c
    );
input  reset_c;
input  trigger_signal_c;
input  clock_out_c;
output output_signal_c;

    wire reset_c_i, un2lto11_2, \clock_counter[8]_net_1 , 
        \clock_counter[11]_net_1 , un2lto11_1, 
        \clock_counter[9]_net_1 , \clock_counter[10]_net_1 , un2lto7_2, 
        \clock_counter[7]_net_1 , \clock_counter[6]_net_1 , 
        \clock_counter[5]_net_1 , un2lto7_1, \clock_counter[3]_net_1 , 
        \clock_counter[4]_net_1 , un2lt11, un2lt7, un2, 
        un1_trigger_signal_net_1, un1_trigger_signal_1, flag_reg_net_1, 
        clock_counter_n11_net_1, clock_counter_c9_net_1, 
        clock_counter_n10_net_1, clock_counter_n9_net_1, 
        clock_counter_c8_net_1, clock_counter_n8_net_1, 
        clock_counter_c6_net_1, clock_counter_n7_net_1, 
        clock_counter_n6_net_1, clock_counter_c4_net_1, 
        clock_counter_n5_net_1, clock_counter_n4_net_1, 
        clock_counter_c2_net_1, clock_counter_n3_net_1, 
        clock_counter_n2_net_1, un2lto0, un2lto1, un2lto2, 
        clock_counter_e0_net_1, clock_counter_n1_net_1, 
        flag_reg_RNO_0_net_1, GND, VCC;
    
    DFN1E1C1 \clock_counter[6]  (.D(clock_counter_n6_net_1), .CLK(
        clock_out_c), .CLR(un1_trigger_signal_net_1), .E(
        flag_reg_net_1), .Q(\clock_counter[6]_net_1 ));
    XOR2 clock_counter_e0 (.A(un2lto0), .B(flag_reg_net_1), .Y(
        clock_counter_e0_net_1));
    DFN1E1C1 \clock_counter[3]  (.D(clock_counter_n3_net_1), .CLK(
        clock_out_c), .CLR(un1_trigger_signal_net_1), .E(
        flag_reg_net_1), .Q(\clock_counter[3]_net_1 ));
    NOR3C clock_counter_c6 (.A(\clock_counter[5]_net_1 ), .B(
        clock_counter_c4_net_1), .C(\clock_counter[6]_net_1 ), .Y(
        clock_counter_c6_net_1));
    DFN1E1C1 \clock_counter[4]  (.D(clock_counter_n4_net_1), .CLK(
        clock_out_c), .CLR(un1_trigger_signal_net_1), .E(
        flag_reg_net_1), .Q(\clock_counter[4]_net_1 ));
    NOR3C clock_counter_c4 (.A(\clock_counter[3]_net_1 ), .B(
        clock_counter_c2_net_1), .C(\clock_counter[4]_net_1 ), .Y(
        clock_counter_c4_net_1));
    DFN1E1C1 \clock_counter[8]  (.D(clock_counter_n8_net_1), .CLK(
        clock_out_c), .CLR(un1_trigger_signal_net_1), .E(
        flag_reg_net_1), .Q(\clock_counter[8]_net_1 ));
    DFN1E1C1 \clock_counter[1]  (.D(clock_counter_n1_net_1), .CLK(
        clock_out_c), .CLR(un1_trigger_signal_net_1), .E(
        flag_reg_net_1), .Q(un2lto1));
    DFN1C1 \clock_counter[0]  (.D(clock_counter_e0_net_1), .CLK(
        clock_out_c), .CLR(un1_trigger_signal_net_1), .Q(un2lto0));
    NOR2 \clock_counter_RNI41VU[11]  (.A(un2lto11_2), .B(un2lt11), .Y(
        un2));
    VCC VCC_i (.Y(VCC));
    DFN1E1C1 \clock_counter[9]  (.D(clock_counter_n9_net_1), .CLK(
        clock_out_c), .CLR(un1_trigger_signal_net_1), .E(
        flag_reg_net_1), .Q(\clock_counter[9]_net_1 ));
    OR2A un1_trigger_signal (.A(reset_c), .B(trigger_signal_c), .Y(
        un1_trigger_signal_net_1));
    AX1C clock_counter_n11 (.A(\clock_counter[10]_net_1 ), .B(
        clock_counter_c9_net_1), .C(\clock_counter[11]_net_1 ), .Y(
        clock_counter_n11_net_1));
    DFN1E1C1 \clock_counter[5]  (.D(clock_counter_n5_net_1), .CLK(
        clock_out_c), .CLR(un1_trigger_signal_net_1), .E(
        flag_reg_net_1), .Q(\clock_counter[5]_net_1 ));
    NOR3C clock_counter_c2 (.A(un2lto0), .B(un2lto1), .C(un2lto2), .Y(
        clock_counter_c2_net_1));
    AX1C clock_counter_n6 (.A(\clock_counter[5]_net_1 ), .B(
        clock_counter_c4_net_1), .C(\clock_counter[6]_net_1 ), .Y(
        clock_counter_n6_net_1));
    AX1C clock_counter_n4 (.A(\clock_counter[3]_net_1 ), .B(
        clock_counter_c2_net_1), .C(\clock_counter[4]_net_1 ), .Y(
        clock_counter_n4_net_1));
    OR2 \clock_counter_RNI85FA[9]  (.A(\clock_counter[9]_net_1 ), .B(
        \clock_counter[10]_net_1 ), .Y(un2lto11_1));
    NOR3C clock_counter_c8 (.A(\clock_counter[7]_net_1 ), .B(
        clock_counter_c6_net_1), .C(\clock_counter[8]_net_1 ), .Y(
        clock_counter_c8_net_1));
    DFN1E0C0 output_signal_reg (.D(un2), .CLK(clock_out_c), .CLR(
        reset_c), .E(un1_trigger_signal_1), .Q(output_signal_c));
    GND GND_i (.Y(GND));
    NOR2B clock_counter_c9 (.A(clock_counter_c8_net_1), .B(
        \clock_counter[9]_net_1 ), .Y(clock_counter_c9_net_1));
    INV flag_reg_RNO (.A(reset_c), .Y(reset_c_i));
    OR2A output_signal_reg_RNO (.A(flag_reg_net_1), .B(
        trigger_signal_c), .Y(un1_trigger_signal_1));
    DFN1E1C1 \clock_counter[2]  (.D(clock_counter_n2_net_1), .CLK(
        clock_out_c), .CLR(un1_trigger_signal_net_1), .E(
        flag_reg_net_1), .Q(un2lto2));
    DFN1E1C1 \clock_counter[7]  (.D(clock_counter_n7_net_1), .CLK(
        clock_out_c), .CLR(un1_trigger_signal_net_1), .E(
        flag_reg_net_1), .Q(\clock_counter[7]_net_1 ));
    XOR2 clock_counter_n5 (.A(clock_counter_c4_net_1), .B(
        \clock_counter[5]_net_1 ), .Y(clock_counter_n5_net_1));
    AO1 \clock_counter_RNIO0O3[2]  (.A(un2lto1), .B(un2lto0), .C(
        un2lto2), .Y(un2lt7));
    XOR2 clock_counter_n7 (.A(clock_counter_c6_net_1), .B(
        \clock_counter[7]_net_1 ), .Y(clock_counter_n7_net_1));
    NOR2B flag_reg_RNO_0 (.A(un2), .B(flag_reg_net_1), .Y(
        flag_reg_RNO_0_net_1));
    NOR3C \clock_counter_RNI7GO3[6]  (.A(\clock_counter[7]_net_1 ), .B(
        \clock_counter[6]_net_1 ), .C(\clock_counter[5]_net_1 ), .Y(
        un2lto7_2));
    XOR2 clock_counter_n1 (.A(un2lto1), .B(un2lto0), .Y(
        clock_counter_n1_net_1));
    NOR2B \clock_counter_RNIL5G2[4]  (.A(\clock_counter[3]_net_1 ), .B(
        \clock_counter[4]_net_1 ), .Y(un2lto7_1));
    XOR2 clock_counter_n3 (.A(clock_counter_c2_net_1), .B(
        \clock_counter[3]_net_1 ), .Y(clock_counter_n3_net_1));
    AX1C clock_counter_n2 (.A(un2lto0), .B(un2lto1), .C(un2lto2), .Y(
        clock_counter_n2_net_1));
    DFN1E1C1 \clock_counter[11]  (.D(clock_counter_n11_net_1), .CLK(
        clock_out_c), .CLR(un1_trigger_signal_net_1), .E(
        flag_reg_net_1), .Q(\clock_counter[11]_net_1 ));
    OR3 \clock_counter_RNIGAUK[11]  (.A(\clock_counter[8]_net_1 ), .B(
        \clock_counter[11]_net_1 ), .C(un2lto11_1), .Y(un2lto11_2));
    XOR2 clock_counter_n10 (.A(clock_counter_c9_net_1), .B(
        \clock_counter[10]_net_1 ), .Y(clock_counter_n10_net_1));
    AX1C clock_counter_n8 (.A(\clock_counter[7]_net_1 ), .B(
        clock_counter_c6_net_1), .C(\clock_counter[8]_net_1 ), .Y(
        clock_counter_n8_net_1));
    DFN1E1C1 \clock_counter[10]  (.D(clock_counter_n10_net_1), .CLK(
        clock_out_c), .CLR(un1_trigger_signal_net_1), .E(
        flag_reg_net_1), .Q(\clock_counter[10]_net_1 ));
    XOR2 clock_counter_n9 (.A(clock_counter_c8_net_1), .B(
        \clock_counter[9]_net_1 ), .Y(clock_counter_n9_net_1));
    DFN1P1C1 flag_reg (.D(flag_reg_RNO_0_net_1), .CLK(clock_out_c), 
        .PRE(trigger_signal_c), .CLR(reset_c_i), .Q(flag_reg_net_1));
    NOR3C \clock_counter_RNIKM0A[2]  (.A(un2lto7_2), .B(un2lto7_1), .C(
        un2lt7), .Y(un2lt11));
    
endmodule


module clock_divider(
       clock_out_c,
       GLA,
       reset_c
    );
output clock_out_c;
input  GLA;
input  reset_c;

    wire clock_out_reg_i, N_5, \counter[1]_net_1 , un5lto0, N_3, 
        \counter[3]_net_1 , \DWACT_FINC_E[0] , clock_out_reg7_0_a3_0_1, 
        \counter[4]_net_1 , un4lto5, N_9, N_5_0, N_7, 
        \counter[2]_net_1 , clock_out_reg7_0_0, \counter_3[5] , I_14, 
        \counter_3[4] , I_12, \counter_3[1] , I_5, I_4, I_7, I_9, N_2, 
        N_4, GND, VCC;
    
    XOR2 un2_counter_I_14 (.A(N_2), .B(un4lto5), .Y(I_14));
    DFN1C0 \counter[3]  (.D(I_9), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[3]_net_1 ));
    DFN1C0 clock_out_reg (.D(clock_out_reg7_0_0), .CLK(GLA), .CLR(
        reset_c), .Q(clock_out_reg_i));
    NOR3B clock_out_reg_RNO_1 (.A(\counter[4]_net_1 ), .B(
        \counter[3]_net_1 ), .C(un4lto5), .Y(clock_out_reg7_0_a3_0_1));
    DFN1C0 \counter[1]  (.D(\counter_3[1] ), .CLK(GLA), .CLR(reset_c), 
        .Q(\counter[1]_net_1 ));
    AND3 un2_counter_I_10 (.A(un5lto0), .B(\counter[1]_net_1 ), .C(
        \counter[2]_net_1 ), .Y(\DWACT_FINC_E[0] ));
    DFN1C0 \counter[2]  (.D(I_7), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[2]_net_1 ));
    DFN1C0 \counter[0]  (.D(I_4), .CLK(GLA), .CLR(reset_c), .Q(un5lto0)
        );
    CLKINT clock_out_reg_RNIFKCA (.A(clock_out_reg_i), .Y(clock_out_c));
    VCC VCC_i (.Y(VCC));
    XOR2 un2_counter_I_12 (.A(N_3), .B(\counter[4]_net_1 ), .Y(I_12));
    OA1A \counter_RNO[4]  (.A(un4lto5), .B(N_7), .C(I_12), .Y(
        \counter_3[4] ));
    XOR2 un2_counter_I_9 (.A(N_4), .B(\counter[3]_net_1 ), .Y(I_9));
    OA1A \counter_RNO[1]  (.A(un4lto5), .B(N_7), .C(I_5), .Y(
        \counter_3[1] ));
    AND3 un2_counter_I_8 (.A(un5lto0), .B(\counter[1]_net_1 ), .C(
        \counter[2]_net_1 ), .Y(N_4));
    GND GND_i (.Y(GND));
    OAI1 \counter_RNI651V1[4]  (.A(\counter[3]_net_1 ), .B(N_5_0), .C(
        \counter[4]_net_1 ), .Y(N_7));
    AO1 clock_out_reg_RNO (.A(N_7), .B(un4lto5), .C(N_9), .Y(
        clock_out_reg7_0_0));
    XOR2 un2_counter_I_7 (.A(N_5), .B(\counter[2]_net_1 ), .Y(I_7));
    NOR2B un2_counter_I_6 (.A(\counter[1]_net_1 ), .B(un5lto0), .Y(N_5)
        );
    INV un2_counter_I_4 (.A(un5lto0), .Y(I_4));
    OR2 \counter_RNIHGGV[2]  (.A(\counter[2]_net_1 ), .B(
        \counter[1]_net_1 ), .Y(N_5_0));
    XOR2 un2_counter_I_5 (.A(un5lto0), .B(\counter[1]_net_1 ), .Y(I_5));
    AND3 un2_counter_I_13 (.A(\DWACT_FINC_E[0] ), .B(
        \counter[3]_net_1 ), .C(\counter[4]_net_1 ), .Y(N_2));
    OA1A \counter_RNO[5]  (.A(un4lto5), .B(N_7), .C(I_14), .Y(
        \counter_3[5] ));
    OA1 clock_out_reg_RNO_0 (.A(un5lto0), .B(N_5_0), .C(
        clock_out_reg7_0_a3_0_1), .Y(N_9));
    NOR2B un2_counter_I_11 (.A(\counter[3]_net_1 ), .B(
        \DWACT_FINC_E[0] ), .Y(N_3));
    DFN1C0 \counter[5]  (.D(\counter_3[5] ), .CLK(GLA), .CLR(reset_c), 
        .Q(un4lto5));
    DFN1C0 \counter[4]  (.D(\counter_3[4] ), .CLK(GLA), .CLR(reset_c), 
        .Q(\counter[4]_net_1 ));
    
endmodule


module top(
       clock,
       reset,
       trigger_signal,
       GLA,
       Y,
       clock_out,
       data_path_signal,
       output_data_rate,
       output_signal,
       signal_into_switch
    );
input  clock;
input  reset;
input  trigger_signal;
output GLA;
output Y;
output clock_out;
output data_path_signal;
output output_data_rate;
output output_signal;
output signal_into_switch;

    wire AND2_0_Y, AND2_1_Y, INV_1_Y, AND2_2_Y, AND2_3_Y, INV_2_Y, VCC, 
        GND, clock_c, reset_c, trigger_signal_c, GLA_net_1, Y_c, 
        clock_out_c, data_path_signal_c, output_data_rate_c, 
        output_signal_c, signal_into_switch_c;
    
    AND2 AND2_0 (.A(GLA_net_1), .B(output_data_rate_c), .Y(AND2_0_Y));
    OUTBUF Y_pad (.D(Y_c), .PAD(Y));
    INV INV_0 (.A(GLA_net_1), .Y(Y_c));
    AND2 AND2_3 (.A(GLA_net_1), .B(INV_2_Y), .Y(AND2_3_Y));
    AND2 AND2_1 (.A(Y_c), .B(INV_1_Y), .Y(AND2_1_Y));
    VCC VCC_i (.Y(VCC));
    OUTBUF GLA_pad (.D(GLA_net_1), .PAD(GLA));
    pll_core pll_core_0 (.GLA(GLA_net_1), .clock_c(clock_c));
    OR2 OR2_1 (.A(AND2_2_Y), .B(AND2_3_Y), .Y(signal_into_switch_c));
    data_rate data_rate_0 (.output_data_rate_c(output_data_rate_c), 
        .GLA(GLA_net_1), .reset_c(reset_c));
    modulator modulator_0 (.reset_c(reset_c), .trigger_signal_c(
        trigger_signal_c), .clock_out_c(clock_out_c), .output_signal_c(
        output_signal_c));
    GND GND_i (.Y(GND));
    clock_divider clock_divider_0 (.clock_out_c(clock_out_c), .GLA(
        GLA_net_1), .reset_c(reset_c));
    INBUF trigger_signal_pad (.PAD(trigger_signal), .Y(
        trigger_signal_c));
    INBUF reset_pad (.PAD(reset), .Y(reset_c));
    OUTBUF output_data_rate_pad (.D(output_data_rate_c), .PAD(
        output_data_rate));
    INV INV_1 (.A(output_data_rate_c), .Y(INV_1_Y));
    OUTBUF clock_out_pad (.D(clock_out_c), .PAD(clock_out));
    AND2 AND2_2 (.A(data_path_signal_c), .B(output_signal_c), .Y(
        AND2_2_Y));
    OUTBUF signal_into_switch_pad (.D(signal_into_switch_c), .PAD(
        signal_into_switch));
    OUTBUF output_signal_pad (.D(output_signal_c), .PAD(output_signal));
    INV INV_2 (.A(output_signal_c), .Y(INV_2_Y));
    OR2 OR2_0 (.A(AND2_0_Y), .B(AND2_1_Y), .Y(data_path_signal_c));
    OUTBUF data_path_signal_pad (.D(data_path_signal_c), .PAD(
        data_path_signal));
    INBUF clock_pad (.PAD(clock), .Y(clock_c));
    
endmodule
