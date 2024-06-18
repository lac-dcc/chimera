// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/CS/CTL                                                            **
** CS CONTROL                                                            **
** SHEET 18 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

module CPU_CS_CTL_18(
   // Input signals
   input       BRK_n,
   input [2:0] CC_3_1_n,
   input       FETCH,
   input       FORM_n,
   input       LCS_n,
   input       LUA12,
   input [1:0] RF_1_0,
   input       RWCS_n,
   input       TERM_n,
   input       WCA_n,
   input       WCS_n,

   // Output signals
   output       ECSL_n,
   output       ELOW_n,
   output       EUPP_n,
   output       EWCA_n,
   output [3:0] EW_3_0_n,
   output [3:0] WU_3_0_n,
   output [3:0] WW_3_0_n
);



   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0] s_ew_3_0_n;
   wire [3:0] s_wu_3_0_n;
   wire [1:0] s_rf_1_0;
   wire [3:0] s_ww_3_0_n;
   wire [2:0] s_cc_3_1_n;
   wire       s_fetch;
   wire       s_wcstb_n;
   wire       s_wcs_n;   
   wire       s_BRK_n;
   wire       s_wica_n;
   wire       s_ecsl_n;
   wire       s_ecsd_n;      
   wire       s_lcs_n;
   wire       s_LUA12;
   wire       s_term_n;
   wire       s_eupp_n;
   wire       s_WCA_n;
   wire       s_elow_n;
   wire       s_logisimNet3;
   wire       s_form_n;
   wire       s_logisimNet34;
   wire       s_logisimNet35;
   wire       s_logisimNet36;
   wire       s_logisimNet37;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_rwcs_n;
   wire       s_logisimNet8;
   wire       s_ewca_n;

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_rf_1_0[1:0]       = RF_1_0;
   assign s_cc_3_1_n[2:0]     = CC_3_1_n;
   assign s_fetch             = FETCH;
   assign s_wcs_n             = WCS_n;
   assign s_BRK_n             = BRK_n;
   assign s_lcs_n             = LCS_n;
   assign s_LUA12             = LUA12;
   assign s_term_n            = TERM_n;
   assign s_WCA_n             = WCA_n;
   assign s_form_n            = FORM_n;
   assign s_rwcs_n            = RWCS_n;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ECSL_n   = s_ecsl_n;
   assign ELOW_n   = s_elow_n;
   assign EUPP_n   = s_eupp_n;
   assign EWCA_n   = s_ewca_n;
   assign EW_3_0_n = s_ew_3_0_n[3:0];
   assign WU_3_0_n = s_wu_3_0_n[3:0];
   assign WW_3_0_n = s_ww_3_0_n[3:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   assign s_ecsd_n = s_lcs_n & s_ewca_n;

   assign s_wu_3_0_n[0] = s_ww_3_0_n[0] & s_wica_n;
   assign s_wu_3_0_n[1] = s_ww_3_0_n[1] & s_wica_n;
   assign s_wu_3_0_n[2] = s_ww_3_0_n[2] & s_wica_n;
   assign s_wu_3_0_n[3] = s_ww_3_0_n[3] & s_wica_n;


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   TTL_74139   CHIP_30B (.A1(s_rf_1_0[0]),
                         .B1(s_rf_1_0[1]),
                         .G1_n(s_ecsd_n),
                         .Y1_0_n(s_ew_3_0_n[0]),
                         .Y1_1_n(s_ew_3_0_n[1]),
                         .Y1_2_n(s_ew_3_0_n[2]),
                         .Y1_3_n(s_ew_3_0_n[3]),

                         .A2(s_rf_1_0[0]),
                         .B2(s_rf_1_0[1]),                         
                         .G2_n(s_wcstb_n),
                         .Y2_0_n(s_ww_3_0_n[0]),
                         .Y2_1_n(s_ww_3_0_n[1]),
                         .Y2_2_n(s_ww_3_0_n[2]),
                         .Y2_3_n(s_ww_3_0_n[3]));

   PAL_44305D PAL_44305_UCSCTL ( .ECSL_n(s_ecsl_n),
                                 .EWCA_n(s_ewca_n),
                                 .EUPP_n(s_eupp_n),
                                 .ELOW_n(s_elow_n),
                                 .WCA_n(s_WCA_n),
                                 .LUA12(LUA12),
                                 .FORM_n(s_form_n),
                                 .CC1_n(s_cc_3_1_n[0]),
                                 .CC2_n(s_cc_3_1_n[1]),
                                 .CC3_n(s_cc_3_1_n[2]),
                                 .LCS_n(s_lcs_n),
                                 .RWCS_n(s_rwcs_n),
                                 .WCS_n(s_wcs_n),
                                 .FETCH(s_fetch),
                                 .BRK_n(s_BRK_n),
                                 .TERM_n(s_term_n),
                                 .WICA_n(s_wica_n),
                                 .WCSTB_n(s_wcstb_n));

endmodule
