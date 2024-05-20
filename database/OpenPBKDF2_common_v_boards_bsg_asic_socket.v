// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License

// this is the ASIC FPGA "socket"

module bsg_asic_socket
  // clk
  (input CLK0
   ,input CLK90

   ,input MSTR_SDO_CLK
   ,input PLL_CLK_I

   ,input CLK0_N, input CLK0_P
   ,input CLK1_N, input CLK1_P

   // ***************************
   // *
   // * output channels
   // *

   // clocks
   ,output AOC0,   BOC0,   COC0,   DOC0
   ,output AOC1,   BOC1,   COC1,   DOC1
   ,output AOC1_X, BOC1_X, COC1_X, DOC1_X

   // data out
   ,output AOD0,  BOD0,  COD0,  DOD0
   ,output AOD1,  BOD1,  COD1,  DOD1
   ,output AOD2,  BOD2,  COD2,  DOD2
   ,output AOD3,  BOD3,  COD3,  DOD3
   ,output AOD4,  BOD4,  COD4,  DOD4
   ,output AOD5,  BOD5,  COD5,  DOD5
   ,output AOD6,  BOD6,  COD6,  DOD6
   ,output AOD7,  BOD7,  COD7,  DOD7
   ,output AOD8,  BOD8,  COD8,  DOD8
   ,output AOD9,  BOD9,  COD9,  DOD9
   ,output AOD10, BOD10, COD10, DOD10

   // tokens
   ,input AOT0, BOT0, COT0, DOT0
   ,input AOT1, BOT1, COT1, DOT1

   // ***************************
   // *
   // * input channels
   // *

   // clocks
   ,input AIC0, BIC0, CIC0, DIC0
   ,input AIC1, BIC1, CIC1, DIC1
   ,input AIC1_X, BIC1_X, CIC1_X, DIC1_X

   // data
   ,input AID0,  BID0,  CID0,  DID0
   ,input AID1,  BID1,  CID1,  DID1
   ,input AID2,  BID2,  CID2,  DID2
   ,input AID3,  BID3,  CID3,  DID3
   ,input AID4,  BID4,  CID4,  DID4
   ,input AID5,  BID5,  CID5,  DID5
   ,input AID6,  BID6,  CID6,  DID6
   ,input AID7,  BID7,  CID7,  DID7
   ,input AID8,  BID8,  CID8,  DID8
   ,input AID9,  BID9,  CID9,  DID9
   ,input AID10, BID10, CID10, DID10

   // tokens
   ,output AIT0,  BIT0, CIT0, DIT0
   ,output AIT1,  BIT1, CIT1, DIT1


   // ***************************
   // *
   // * Miscellaneous signals
   // *

   // XG's; replace with Q's

   ,inout XG0, inout XG1, inout XG2, inout XG3, inout XG4
   ,inout XG5, inout XG6, inout XG7, inout XG8, inout XG9

   // led
   ,output ASIC_LED0, ASIC_LED1
   ,input  ASIC_SMA_IN_N  ,input  ASIC_SMA_IN_P
   ,output ASIC_SMA_OUT_N ,output ASIC_SMA_OUT_P
   );

   // see bsg_packaging/ucsd_bga_332/pinouts/bsg_two/verilog/bsg_pinout.v
   // these names correspond to the UCSD BGA package names

   bsg_chip ASIC
     (
      .p_clk_0_p_i   (CLK0_P)
      ,.p_clk_0_n_i  (CLK0_N)
      ,.p_clk_1_p_i  (CLK1_P)
      ,.p_clk_1_n_i  (CLK1_N)
      ,.p_SMA_in_p_i (ASIC_SMA_IN_P )
      ,.p_SMA_in_n_i (ASIC_SMA_IN_N )
      ,.p_SMA_out_p_o(ASIC_SMA_OUT_P)
      ,.p_SMA_out_n_o(ASIC_SMA_OUT_N)

      ,.p_PLL_CLK_i  (PLL_CLK_I)

      // input channels
      ,.p_sdi_sclk_i   ({DIC0, CIC0, BIC0, AIC0})

      ,.p_sdi_ncmd_i   ({DID8, CID8, BID8, AID8})

      ,.p_sdi_A_data_i ({AID7, AID6, AID5, AID4, AID3, AID2, AID1, AID0})
      ,.p_sdi_B_data_i ({BID7, BID6, BID5, BID4, BID3, BID2, BID1, BID0})
      ,.p_sdi_C_data_i ({CID7, CID6, CID5, CID4, CID3, CID2, CID1, CID0})
      ,.p_sdi_D_data_i ({DID7, DID6, DID5, DID4, DID3, DID2, DID1, DID0})

      ,.p_sdi_token_o  ({DIT0, CIT0, BIT0, AIT0})

      // output channels
      ,.p_sdo_sclk_o   ({DOC0, COC0, BOC0, AOC0})
      ,.p_sdo_ncmd_o   ({DOD8, COD8, BOD8, AOD8})

      ,.p_sdo_A_data_o({AOD7, AOD6, AOD5, AOD4, AOD3, AOD2, AOD1, AOD0})
      ,.p_sdo_B_data_o({BOD7, BOD6, BOD5, BOD4, BOD3, BOD2, BOD1, BOD0})
      ,.p_sdo_C_data_o({COD7, COD6, COD5, COD4, COD3, COD2, COD1, COD0})
      ,.p_sdo_D_data_o({DOD7, DOD6, DOD5, DOD4, DOD3, DOD2, DOD1, DOD0})

      ,.p_sdo_A_data_8_o(AOD9)
      ,.p_sdo_C_data_8_o(COD9)

      ,.p_sdo_token_i  ({DOT0, COT0, BOT0, AOT0})

      // spare clocks, length matched to channels
      // these can be used as a "tenth bit" for the channel
      ,.p_sdi_sclk_ex_i({DIC1, CIC1, BIC1, AIC1})
      ,.p_sdo_sclk_ex_o({DOC1, COC1, BOC1, AOC1})

      // spare tokens for input and output channels
      ,.p_sdi_tkn_ex_o ({DIT1, CIT1, BIT1, AIT1})
      ,.p_sdo_tkn_ex_i ({DOT1, COT1, BOT1, AOT1})

      // *******************************************************************
      // all "50-ohm impedance-controlled-in-package", starting here
      // but are next to clock or token signals
      // and are not length-matched

      ,.p_misc_T_0_i(XG4)
      ,.p_misc_T_1_i(XG5)
      ,.p_misc_T_2_i(XG6)

      ,.p_misc_L_7_i(BID10)       , .p_misc_R_7_i(DID10)
      ,.p_misc_L_6_i(BID9)        , .p_misc_R_6_i(DID9)
      ,.p_misc_L_5_i(AIC1_X) // only available is AIC1 is not used as clock
      ,.p_misc_R_5_i(XG2)
      ,.p_misc_L_4_i(MSTR_SDO_CLK), .p_misc_R_4_i(XG1)

      ,.p_misc_L_3_o(AOD10)       , .p_misc_R_3_o(BOD10)

      ,.p_misc_L_2_i(XG8)   ,.p_misc_R_2_i(XG9)
      ,.p_misc_L_1_i(AID10) ,.p_misc_R_1_i(CID10)
      ,.p_misc_L_0_i(AID9)  ,.p_misc_R_0_i(CID9 )

      ,.p_reset_i    (XG7)

      // for JTAG or bsg_tag
      ,.p_JTAG_TMS_i (XG0)
      ,.p_JTAG_TDI_i (CLK0)
      ,.p_JTAG_TCK_i (CLK90)
      ,.p_JTAG_TRST_i(XG3)
      ,.p_JTAG_TDO_o (DOD10)
      );

  // led

  assign ASIC_LED0 = ~XG7;
  assign ASIC_LED1 = ~XG7;

endmodule
