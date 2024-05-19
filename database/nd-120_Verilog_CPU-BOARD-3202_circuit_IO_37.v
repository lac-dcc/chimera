// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** IO                                                                    **
** IO TOP LEVEL                                                          **
** SHEET 37 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/


module IO_37( 

   input sysclk,      // System clock in FPGA
   input sys_rst_n,   // System reset in FPGA

   input [4:0] BAUD_RATE_SWITCH,
   input       BDRY50_n,
   input       BRK_n,
   input       CLK,
   input [4:0] CSCOMM_4_0,
   input [4:0] CSIDBS_4_0,
   input [1:0] CSMIS_1_0,
   input       CX_n,
   input       DAP_n,
   input       EAUTO_n,
   input       EORF_n,
   input       HIT,
   input       I1P,
   input       ICONTIN_n,
   input       ILOAD_n,
   input [7:0] INR_7_0,
   input       IONI,
   input       ISTOP_n,
   input       LCS_n,
   input       LEV0,
   input       LOCK_n,
   input       LSHADOW,
   input [1:0] OC_1_0,
   input       OPCLCS,
   input       OSCCL_n,
   input [1:0] PCR_1_0,
   input       PONI,
   input       POWSENSE_n,
   input       REF_n,
   input       RXD,
   input       SEL5MS_n,
   input       SWMCL_n,
   input       UCLK,
   input       XTAL1,
   input       XTAL2,
   input       XTR,

   // Input and Output signals
   input  [15:0] IDB_15_0_IN,
   output [15:0] IDB_15_0_OUT,
   



   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output       BINT10_n,
   output       BINT12_n,
   output       BINT13_n,
   output       CA10,
   output       CCLR_n,
   output       CLEAR_n,
   output       CONSOLE_n,
   output [4:0] DP_5_1_n,
   output       DT_n,
   output       DVACC_n,
   output       ECREQ,
   output       ECSR_n,
   output       EDO_n,
   output       EMCL_n,
   output       EMPID_n,
   output       ESTOF_n,
   output       FETCH,
   output       FMISS,
   output       FORM_n,
   output       IORQ_n,
   output       MCL,
   output       MREQ_n,
   output       OSC,
   output       PAN_n,
   output       PA_n,
   output       POWFAIL_n,
   output       PS_n,
   output       REFRQ_n,
   output       RT_n,
   output       RWCS_n,
   output       SHORT_n,
   output       SLOW_n,
   output       SSEMA_n,
   output       STOC_n,
   output       STP,
   output       TOUT,
   output       TXD,
   output       WCHIM_n,
   output       WRITE,
   output [1:0] IOLED // 0=RED,1=GREEN
);

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/


   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_idb_15_0_uart_out;
   wire [15:0] s_idb_15_0_pancal_out;
   wire [15:0] s_idb_15_0_reg_out;

   wire [15:0] s_idb_15_0_in;


   wire [7:0]  s_logisimBus27;
   
   wire [7:0]  s_logisimBus36;
   wire [1:0]  s_logisimBus46;
   wire [1:0]  s_logisimBus48;
   wire [4:0]  s_logisimBus53;
   wire [4:0]  s_logisimBus54;

   wire [4:0]  s_logisimBus66;
   wire [1:0]  s_logisimBus68;
   wire [1:0]  s_logisimBus92;
   wire [7:0]  s_logisimBus95;
   wire        s_logisimNet10;
   wire        s_logisimNet11;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_logisimNet14;
   wire        s_logisimNet15;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
   wire        s_logisimNet19;
   wire        s_logisimNet20;
   wire        s_logisimNet21;
   wire        s_logisimNet23;
   wire        s_logisimNet24;
   wire        s_logisimNet25;
   wire        s_logisimNet26;
   wire        s_logisimNet28;
   wire        s_logisimNet29;
   wire        s_logisimNet3;
   wire        s_logisimNet30;
   wire        s_logisimNet31;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_logisimNet42;
   wire        s_logisimNet43;
   wire        s_logisimNet44;
   wire        s_logisimNet45;
   wire        s_logisimNet47;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_logisimNet58;
   wire        s_logisimNet59;
   wire        s_logisimNet6;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
   wire        s_logisimNet62;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet67;
   wire        s_logisimNet69;
   wire        s_logisimNet7;
   wire        s_logisimNet70;
   wire        s_logisimNet71;
   wire        s_logisimNet72;
   wire        s_logisimNet73;
   wire        s_logisimNet74;
   wire        s_logisimNet75;
   wire        s_logisimNet76;
   wire        s_logisimNet77;
   wire        s_logisimNet78;
   wire        s_logisimNet79;
   wire        s_logisimNet8;
   wire        s_logisimNet80;
   wire        s_logisimNet81;
   wire        s_logisimNet82;
   wire        s_logisimNet83;
   wire        s_logisimNet84;
   wire        s_logisimNet85;
   wire        s_logisimNet86;
   wire        s_logisimNet87;
   wire        s_logisimNet88;
   wire        s_txd;
   wire        s_logisimNet9;
   wire        s_logisimNet90;
   wire        s_logisimNet91;
   wire        s_logisimNet93;
   wire        s_logisimNet94;
   wire        s_logisimNet96;
   wire        s_logisimNet97;
   wire        s_logisimNet98;
   wire        s_logisimNet99;
   wire  [3:0] s_idb_3_0_dcd_out; // output from DGA module (submodule dga_pow)

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus46[1:0] = OC_1_0;
   assign s_logisimBus53[4:0] = CSCOMM_4_0;
   assign s_logisimBus66[4:0] = CSIDBS_4_0;
   assign s_logisimBus68[1:0] = PCR_1_0;
   assign s_logisimBus92[1:0] = CSMIS_1_0;
   assign s_logisimBus95[7:0] = INR_7_0;
   assign s_logisimNet12      = EAUTO_n;
   assign s_logisimNet17      = XTAL2;
   assign s_logisimNet28      = IONI;
   assign s_logisimNet29      = SWMCL_n;
   assign s_logisimNet31      = I1P;
   assign s_logisimNet33      = LCS_n;
   assign s_logisimNet37      = REF_n;
   assign s_logisimNet38      = UCLK;
   assign s_logisimNet45      = ILOAD_n;
   assign s_logisimNet5       = XTAL1;
   assign s_logisimNet51      = LEV0;
   assign s_logisimNet52      = OSCCL_n;
   assign s_logisimNet55      = DAP_n;
   assign s_logisimNet56      = PONI;
   assign s_logisimNet63      = HIT;
   assign s_logisimNet65      = BDRY50_n;
   assign s_logisimNet67      = CX_n;
   assign s_logisimNet69      = LOCK_n;
   assign s_logisimNet70      = EORF_n;
   assign s_logisimNet71      = ISTOP_n;
   assign s_logisimNet76      = POWSENSE_n;
   assign s_logisimNet77      = ICONTIN_n;
   assign s_logisimNet88      = RXD;
   assign s_logisimNet9       = LSHADOW;
   assign s_logisimNet90      = SEL5MS_n;
   assign s_logisimNet93      = BRK_n;
   assign s_logisimNet94      = OPCLCS;
   assign s_logisimNet96      = XTR;
   assign s_logisimNet97      = CLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BINT10_n   = s_logisimNet80;
   assign BINT12_n   = s_logisimNet21;
   assign BINT13_n   = s_logisimNet81;
   assign CA10       = s_logisimNet44;
   assign CCLR_n     = s_logisimNet73;
   assign CLEAR_n    = s_logisimNet78;
   assign CONSOLE_n  = s_logisimNet8;
   assign DP_5_1_n   = s_logisimBus54[4:0];
   assign DT_n       = s_logisimNet79;
   assign DVACC_n    = s_logisimNet41;
   assign ECREQ      = s_logisimNet26;
   assign ECSR_n     = s_logisimNet7;
   assign EDO_n      = s_logisimNet87;
   assign EMCL_n     = s_logisimNet14;
   assign EMPID_n    = s_logisimNet40;
   assign ESTOF_n    = s_logisimNet74;
   assign FETCH      = s_logisimNet60;
   assign FMISS      = s_logisimNet82;
   assign FORM_n     = s_logisimNet42;
   
   assign IDB_15_0_OUT   = s_idb_15_0_uart_out[15:0] | s_idb_15_0_pancal_out[15:0] | s_idb_15_0_reg_out[7:0];

   assign IORQ_n     = s_logisimNet24;
   assign MCL        = s_logisimNet50;
   assign MREQ_n     = s_logisimNet83;
   assign OSC        = s_logisimNet11;
   assign PAN_n      = s_logisimNet23;
   assign PA_n       = s_logisimNet43;
   assign POWFAIL_n  = s_logisimNet49;
   assign PS_n       = s_logisimNet25;
   assign REFRQ_n    = s_logisimNet34;
   assign RT_n       = s_logisimNet84;
   assign RWCS_n     = s_logisimNet6;
   assign SHORT_n    = s_logisimNet98;
   assign SLOW_n     = s_logisimNet75;
   assign SSEMA_n    = s_logisimNet58;
   assign STOC_n     = s_logisimNet39;
   assign STP        = s_logisimNet72;
   assign TOUT       = s_logisimNet61;
   assign TXD        = s_txd;
   assign WCHIM_n    = s_logisimNet99;
   assign WRITE      = s_logisimNet13;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   /*
   IO_REG_41   REG_MODULE (.BINT10_n(s_logisimNet80),
                           .BINT12_n(s_logisimNet21),
                           .BINT13_n(s_logisimNet81),
                           .CLEAR_n(s_logisimNet78),
                           .CONSOLE_n(s_logisimNet8),
                           .CX_n(s_logisimNet67),
                           .DA_n(s_logisimNet4),
                           .EMCL_n(s_logisimNet14),
                           .IDB_15_0_IN(s_idb_15_0_in[15:0]),
                           .IDB_15_0_OUT(s_idb_15_0_reg_out[15:0]),
                           .INR_7_0(s_logisimBus95[7:0]),
                           .RINR_n(s_logisimNet3),
                           .SIOC_n(s_logisimNet16),
                           .TBMT_n(s_logisimNet20),
                           .TRAALD_n(s_logisimNet10),
                           .IOLED(IOLED[1:0]));

   IO_PANCAL_40   PANCAL (.CLEAR_n(s_logisimNet78),
                          .DP_5_1_n(s_logisimBus54[4:0]),
                          .EMP_n(s_logisimNet64),
                          .EPANS(s_logisimNet35),
                          .FUL_n(s_logisimNet85),
                          .IDB_15_0_IN(s_idb_15_0_in[15:0]),
                          .IDB_15_0_OUT(s_idb_15_0_pancal_out[15:0]),
                          .IONI(s_logisimNet28),
                          .LEV0(s_logisimNet51),
                          .LHIT(s_logisimNet59),
                          .PANOSC(s_logisimNet91),
                          .PA_7_0(s_logisimBus36[7:0]),
                          .PCR_1_0(s_logisimBus68[1:0]),
                          .PONI(s_logisimNet56),
                          .RMM_n(s_logisimNet62),
                          .STAT_4_3(s_logisimBus48[1:0]),
                          .VAL(s_logisimNet86));

   IO_UART_42   UART (
                      .BAUD_RATE_SWITCH(BAUD_RATE_SWITCH),
                      .CEUART_n(s_logisimNet30),
                      .CLK(s_logisimNet97),
                      .CONSOLE_n(s_logisimNet8),
                      .DA_n(s_logisimNet4),
                      .EAUTO_n(s_logisimNet12),
                      .EIOR_n(s_logisimNet19),
                      .I1P(s_logisimNet31),
                      .IDB_15_0_IN(s_idb_15_0_in[15:0]),
                      .IDB_15_0_OUT(s_idb_15_0_uart_out[15:0]),
                      .LCS_n(s_logisimNet33),
                      .LOCK_n(s_logisimNet69),
                      .MIS_1_0(s_logisimBus92[1:0]),
                      .O1P(),
                      .O2P(),
                      .PPOSC(s_logisimNet15),
                      .RUART_n(s_logisimNet47),
                      .RXD(s_logisimNet88),
                      .TBMT_n(s_logisimNet20),
                      .TXD(s_txd),
                      .XTR(s_logisimNet96));

*/
   wire s_EPAN_n; // not used output signal


   IO_DCD_38   DCD (.BDRY50_n(s_logisimNet65),
                    .BRK_n(s_logisimNet93),
                    .CA10(s_logisimNet44),
                    .CCLR_n(s_logisimNet73),
                    .CEUART_n(s_logisimNet30),
                    .CLEAR_n(s_logisimNet78),
                    .CLK(s_logisimNet97),
                    .CSCOMM_4_0(s_logisimBus53[4:0]),
                    .CSIDBS_4_0(s_logisimBus66[4:0]),
                    .CSMIS_1_0(s_logisimBus92[1:0]),
                    .DAP_n(s_logisimNet55),
                    .DT_n(s_logisimNet79),
                    .DVACC_n(s_logisimNet41),
                    .ECREQ(s_logisimNet26),
                    .ECSR_n(s_logisimNet7),
                    .EDO_n(s_logisimNet87),
                    .EIOR_n(s_logisimNet19),
                    .EMPID_n(s_logisimNet40),
                    .EMP_n(s_logisimNet64),
                    .EORF_n(s_logisimNet70),
                    .EPAN_n(s_EPAN_n),              // <== EPAN NOT CONNECTED (maybe read from PAL?)
                    .EPANS_n(s_logisimNet35),
                    .ESTOF_n(s_logisimNet74),
                    .FETCH(s_logisimNet60),
                    .FMISS(s_logisimNet82),
                    .FORM_n(s_logisimNet42),
                    .FUL_n(s_logisimNet85),
                    .HIT(s_logisimNet63),
                    .ICONTIN_n(s_logisimNet77),
                    .IDB_7_0_IN(s_idb_15_0_in[7:0]),
                    .IDB_3_0_OUT(s_idb_3_0_dcd_out[3:0]), // TODO: connect
                    
                    .ILOAD_n(s_logisimNet45),
                    .IORQ_n(s_logisimNet24),
                    .ISTOP_n(s_logisimNet71),
                    .LCS_n(s_logisimNet33),
                    .LHIT(s_logisimNet59),
                    .LSHADOW(s_logisimNet9),
                    .MCL(s_logisimNet50),
                    .MREQ_n(s_logisimNet83),
                    .OC_1_0(s_logisimBus46[1:0]),
                    .OPCLCS(s_logisimNet94),
                    .OSC(s_logisimNet11),
                    .OSCCL_n(s_logisimNet52),
                    .PANOSC(s_logisimNet91),
                    .PAN_n(s_logisimNet23),
                    .PA_7_0(s_logisimBus36[7:0]),
                    .PA_n(s_logisimNet43),
                    .PONI(s_logisimNet56),
                    .POWFAIL_n(s_logisimNet49),
                    .POWSENSE_n(s_logisimNet76),
                    .PPOSC(s_logisimNet15),
                    .PS_n(s_logisimNet25),
                    .REFRQ_n(s_logisimNet34),
                    .REF_n(s_logisimNet37),
                    .RINR_n(s_logisimNet3),
                    .RMM_n(s_logisimNet62),
                    .RT_n(s_logisimNet84),
                    .RUART_n(s_logisimNet47),
                    .RWCS_n(s_logisimNet6),
                    .SEL5MS_n(s_logisimNet90),
                    .SHORT_n(s_logisimNet98),
                    .SIOC_n(s_logisimNet16),
                    .SLOW_n(s_logisimNet75),
                    .SSEMA_n(s_logisimNet58),
                    .STAT_4_3(s_logisimBus48[1:0]),
                    .STOC_n(s_logisimNet39),
                    .STP(s_logisimNet72),
                    .SWMCL_n(s_logisimNet29),
                    .TOUT(s_logisimNet61),
                    .TRAALD_n(s_logisimNet10),
                    .UCLK(s_logisimNet38),
                    .VAL(s_logisimNet86),
                    .WCHIM_n(s_logisimNet99),
                    .WRITE(s_logisimNet13),
                    .XTAL1(s_logisimNet5),
                    .XTAL2(s_logisimNet17));

endmodule
