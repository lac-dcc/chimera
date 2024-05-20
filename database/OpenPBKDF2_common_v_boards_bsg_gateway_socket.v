// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License

// this is a standard template for instantiating
// a test gateway socket

module bsg_gateway_socket
  // clk osc
  (input CLK_OSC_P, CLK_OSC_N

   // ***********************************
   // * -------- TO ASIC --------
   // *

   // various clocks
   ,output CLK0
   ,output CLK90
   ,output MSTR_SDO_CLK
   ,output PLL_CLK_I
   ,output CLK0_N, CLK0_P
   ,output CLK1_N, CLK1_P

   /* ** terminated on GW FPGA side */
   ,input AOC0,   BOC0,   COC0,   DOC0
   ,input AOC1,   BOC1,   COC1,   DOC1
   ,input AOC1_X, BOC1_X, COC1_X, DOC1_X

   ,input AOD0,  BOD0,  COD0,  DOD0
   ,input AOD1,  BOD1,  COD1,  DOD1
   ,input AOD2,  BOD2,  COD2,  DOD2
   ,input AOD3,  BOD3,  COD3,  DOD3
   ,input AOD4,  BOD4,  COD4,  DOD4
   ,input AOD5,  BOD5,  COD5,  DOD5
   ,input AOD6,  BOD6,  COD6,  DOD6
   ,input AOD7,  BOD7,  COD7,  DOD7
   ,input AOD8,  BOD8,  COD8,  DOD8
   ,input AOD9,  BOD9,  COD9,  DOD9
   ,input AOD10, BOD10, COD10, DOD10

   // channel token in
   ,input AIT0, BIT0, CIT0, DIT0
   ,input AIT1, BIT1, CIT1, DIT1

   /* ** terminated on ASIC FPGA side */
   ,output AIC0,   BIC0,   CIC0,   DIC0
   ,output AIC1,   BIC1,   CIC1,   DIC1
   ,output AIC1_X, BIC1_X, CIC1_X, DIC1_X

   ,output AID0,  BID0,  CID0,  DID0
   ,output AID1,  BID1,  CID1,  DID1
   ,output AID2,  BID2,  CID2,  DID2
   ,output AID3,  BID3,  CID3,  DID3
   ,output AID4,  BID4,  CID4,  DID4
   ,output AID5,  BID5,  CID5,  DID5
   ,output AID6,  BID6,  CID6,  DID6
   ,output AID7,  BID7,  CID7,  DID7
   ,output AID8,  BID8,  CID8,  DID8
   ,output AID9,  BID9,  CID9,  DID9
   ,output AID10, BID10, CID10, DID10

   // channel token out
   ,output AOT0, BOT0, COT0, DOT0
   ,output AOT1, BOT1, COT1, DOT1

   ,inout XG0, XG1, XG2, XG3, XG4, XG5, XG6, XG7, XG8, XG9

   // ***********************************
   // * -------- TO FMC --------
   // *

   ,inout FCLK0_M2C_N, inout FCLK0_M2C_P
   ,inout FCLK1_M2C_N, inout FCLK1_M2C_P

   ,inout
     F0_P,  F0_N,  F1_P,  F1_N,  F2_P,  F2_N,  F3_P,  F3_N
   , F4_P,  F4_N,  F5_P,  F5_N,  F6_P,  F6_N,  F7_P,  F7_N
   , F8_P,  F8_N,  F9_P,  F9_N,  F10_P, F10_N, F11_P, F11_N
   , F12_P, F12_N, F13_P, F13_N, F14_P, F14_N, F15_P, F15_N
   , F16_P, F16_N, F17_P, F17_N, F18_P, F18_N, F19_P, F19_N
   , F20_P, F20_N, F21_P, F21_N, F22_P, F22_N, F23_P, F23_N
   , F24_P, F24_N, F25_P, F25_N, F26_P, F26_N, F27_P, F27_N
   , F28_P, F28_N, F29_P, F29_N, F30_P, F30_N, F31_P, F31_N
   , F32_P, F32_N, F33_P, F33_N


   // ******************************************
   // * -------- TO/FROM VARIOUS ON-BOARD DEVICES
   // *

   ,input PWR_RSTN

   // voltage-rail enable
   ,output ASIC_CORE_EN, ASIC_IO_EN

   // current monitor
   ,output CUR_MON_ADDR0, CUR_MON_ADDR1
   ,inout  CUR_MON_SCL,   CUR_MON_SDA

   // potentiometer
   ,output DIG_POT_ADDR0, DIG_POT_ADDR1
   ,output DIG_POT_INDEP, DIG_POT_NRST
   ,inout  DIG_POT_SCL,   DIG_POT_SDA

   // uart
   ,input  UART_RX
   ,output UART_TX

   // led
   ,output FPGA_LED0, FPGA_LED1
   ,output FPGA_LED2, FPGA_LED3

   // SMA
   ,inout FPGA_SMA_IN_N  ,FPGA_SMA_IN_P
   ,inout FPGA_SMA_OUT_N ,FPGA_SMA_OUT_P
   );

   bsg_gateway_chip bgc
     (
      .p_PWR_RSTN(PWR_RSTN)
      ,.p_clk_0_p_o   (CLK0_P)
      ,.p_clk_0_n_o  (CLK0_N)
      ,.p_clk_1_p_o  (CLK1_P)
      ,.p_clk_1_n_o  (CLK1_N)

      ,.p_PLL_CLK_o  (PLL_CLK_I)

      // input channels
      ,.p_sdi_sclk_o   ({DIC0, CIC0, BIC0, AIC0})

      ,.p_sdi_ncmd_o   ({DID8, CID8, BID8, AID8})

      ,.p_sdi_A_data_o ({AID7, AID6, AID5, AID4, AID3, AID2, AID1, AID0})
      ,.p_sdi_B_data_o ({BID7, BID6, BID5, BID4, BID3, BID2, BID1, BID0})
      ,.p_sdi_C_data_o ({CID7, CID6, CID5, CID4, CID3, CID2, CID1, CID0})
      ,.p_sdi_D_data_o ({DID7, DID6, DID5, DID4, DID3, DID2, DID1, DID0})

      ,.p_sdi_token_i  ({DIT0, CIT0, BIT0, AIT0})

      // output channels
      ,.p_sdo_sclk_i   ({DOC0, COC0, BOC0, AOC0})
      ,.p_sdo_ncmd_i   ({DOD8, COD8, BOD8, AOD8})

      ,.p_sdo_A_data_i({AOD7, AOD6, AOD5, AOD4, AOD3, AOD2, AOD1, AOD0})
      ,.p_sdo_B_data_i({BOD7, BOD6, BOD5, BOD4, BOD3, BOD2, BOD1, BOD0})
      ,.p_sdo_C_data_i({COD7, COD6, COD5, COD4, COD3, COD2, COD1, COD0})
      ,.p_sdo_D_data_i({DOD7, DOD6, DOD5, DOD4, DOD3, DOD2, DOD1, DOD0})

      ,.p_sdo_A_data_8_i(AOD9)
      ,.p_sdo_C_data_8_i(COD9)

      ,.p_sdo_token_o  ({DOT0, COT0, BOT0, AOT0})

      // spare clocks, length matched to channels
      // these can be used as a "tenth bit" for the channel
      ,.p_sdi_sclk_ex_o({DIC1, CIC1, BIC1, AIC1})
      ,.p_sdo_sclk_ex_i({DOC1, COC1, BOC1, AOC1})

      // spare tokens for input and output channels
      ,.p_sdi_tkn_ex_i ({DIT1, CIT1, BIT1, AIT1})
      ,.p_sdo_tkn_ex_o ({DOT1, COT1, BOT1, AOT1})

      // *******************************************************************
      // all "50-ohm impedance-controlled-in-package", starting here
      // but are next to clock or token signals
      // and are not length-matched

      ,.p_misc_T_0_o(XG4)
      ,.p_misc_T_1_o(XG5)
      ,.p_misc_T_2_o(XG6)

      ,.p_misc_L_7_o(BID10)       , .p_misc_R_7_o(DID10)
      ,.p_misc_L_6_o(BID9)        , .p_misc_R_6_o(DID9)
      ,.p_misc_L_5_o(AIC1_X) // only available if AIC1 is not used as clock
      ,.p_misc_R_5_o(XG2)
      ,.p_misc_L_4_o(MSTR_SDO_CLK), .p_misc_R_4_o(XG1)

      ,.p_misc_L_3_i(AOD10)       , .p_misc_R_3_i(BOD10)

      ,.p_misc_L_2_o(XG8)   ,.p_misc_R_2_o(XG9)
      ,.p_misc_L_1_o(AID10) ,.p_misc_R_1_o(CID10)
      ,.p_misc_L_0_o(AID9)  ,.p_misc_R_0_o(CID9 )

      ,.p_reset_o    (XG7)

      // for JTAG or bsg_tag
      ,.p_JTAG_TMS_o (XG0)
      ,.p_JTAG_TDI_o (CLK0)
      ,.p_JTAG_TCK_o (CLK90)
      ,.p_JTAG_TRST_o(XG3)
      ,.p_JTAG_TDO_i (DOD10)
   );

endmodule
