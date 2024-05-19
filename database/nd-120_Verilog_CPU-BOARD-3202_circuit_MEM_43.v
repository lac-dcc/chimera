// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** MEM                                                                   **
** MEMORY TOP LEVEL                                                      **
** SHEET 43 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

module MEM_43( 

   // Input signals

   input sysclk,      // System clock in FPGA
   input sys_rst_n,   // System reset in FPGA

   input        BDAP50_n,
   input        BDRY50_n,
   input [4:0]  BD_23_19_n,
   input        BIOXE_n,
   input        BMEM_n,
   input        DBAPR,
   input        ECCR,
   input        ECREQ,
   input        FETCH,
   input        GNT_n,
   input        IBINPUT_n,
   input        IORQ_n,
   input [23:0] LBD_23_0_IN,
   input [23:0] LBD_23_0_OUT,   
   input        MOR_n,
   input        MR_n,
   input        OSC,
   input        PA_n,
   input        PD1,
   input        PD3,
   input        PD4,
   input [4:0]  PPN_23_19,
   input        PS_n,
   input        REFRQ_n,
   input        REF_n,
   input        RERR_n,
   input        SEMRQ50_n,
   input        SSEMA_n,
   input        WRITE,

  
   // Output signals
  
   output        BDRY_n,
   output        BGNT50_n,
   output        BGNT_n,
   output        CGNT50_n,
   output        CGNT_n,
   output        CRQ_n,
   output        GNT50_n,
   output [15:0] IDB_15_0_OUT,
   output        LERR_n,
   output        LPERR_n,
   output        MOFF_n,
   output        MOR25_n,
   output        MWRITE_n,
   output        LED4,               // LED4_RED_PARITY_ERROR
   output        LED_CPU_GI,         // LED_CPU_GRANT_INDICATOR
   output        LED_BUS_GI          // LED_BUS_GRANT_INDICATOR
);
 

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [4:0]  s_logisimBus101;
   wire [4:0]  s_logisimBus104;   
   wire [17:0] s_dd_17_0_in;
   wire [17:0] s_dd_17_0_out;
   wire [9:0]  s_aa_9_0;
   wire [17:0] s_logisimBus71;
   wire [23:0] s_lbd_23_0_in;   // RAM DATA 16 bits
   wire [23:0] s_lbd_23_0_out;  // RAM DATA 16 bits
   wire [19:0] s_lbd_19_0;
   wire [2:0]  s_bank_2_0;
   wire [23:0] s_logisimBus9;
   wire [15:0] s_idb_15_0_out;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet100;
   wire        s_logisimNet102;
   wire        s_logisimNet103;
   wire        s_logisimNet105;
   wire        s_logisimNet106;
   wire        s_logisimNet107;
   wire        s_logisimNet108;
   wire        s_logisimNet109;
   wire        s_logisimNet11;
   wire        s_logisimNet13;
   wire        s_logisimNet14;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
   wire        s_logisimNet18;
   wire        s_logisimNet19;
   wire        s_logisimNet2;
   wire        s_logisimNet20;
   wire        s_logisimNet21;
   wire        s_logisimNet22;
   wire        s_logisimNet23;
   wire        s_logisimNet24;
   wire        s_logisimNet25;
   wire        s_logisimNet26;
   wire        s_logisimNet27;
   wire        s_logisimNet28;
   wire        s_logisimNet29;
   wire        s_logisimNet3;
   wire        s_logisimNet30;
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
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
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_logisimNet57;
   wire        s_logisimNet58;
   wire        s_logisimNet59;
   wire        s_logisimNet6;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
   wire        s_logisimNet62;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet67;
   wire        s_logisimNet68;
   wire        s_logisimNet69;
   wire        s_logisimNet7;
   wire        s_logisimNet70;
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
   wire        s_logisimNet83;
   wire        s_logisimNet84;
   wire        s_logisimNet85;
   wire        s_logisimNet86;
   wire        s_logisimNet87;
   wire        s_logisimNet89;
   wire        s_logisimNet90;
   wire        s_logisimNet91;
   wire        s_logisimNet92;
   wire        s_logisimNet93;
   wire        s_logisimNet94;
   wire        s_logisimNet95;
   wire        s_logisimNet96;
   wire        s_logisimNet98;
   wire        s_logisimNet99;
  
  

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus101[4:0] = BD_23_19_n;
   assign s_logisimBus104[4:0] = PPN_23_19;
   assign s_lbd_23_0_in[23:0]  = LBD_23_0_IN;   
   assign s_logisimNet100      = IBINPUT_n;
   assign s_logisimNet102      = PD3;
   assign s_logisimNet103      = DBAPR;
   assign s_logisimNet108      = REF_n;
   assign s_logisimNet28       = PA_n;
   assign s_logisimNet47       = IORQ_n;
   assign s_logisimNet48       = ECREQ;
   assign s_logisimNet49       = PD1;
   assign s_logisimNet50       = SEMRQ50_n;
   assign s_logisimNet58       = GNT_n;
   assign s_logisimNet61       = SSEMA_n;
   assign s_logisimNet63       = PS_n;
   assign s_logisimNet68       = BMEM_n;
   assign s_logisimNet70       = BIOXE_n;
   assign s_logisimNet73       = BDRY50_n;
   assign s_logisimNet74       = BDAP50_n;
   assign s_logisimNet75       = ECCR;
   assign s_logisimNet76       = MOR_n;
   assign s_logisimNet84       = MR_n;
   assign s_logisimNet85       = REFRQ_n;
   assign s_logisimNet90       = RERR_n;
   assign s_logisimNet91       = OSC;
   assign s_logisimNet92       = FETCH;
   assign s_logisimNet98       = PD4;
   assign s_logisimNet99       = WRITE;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BDRY_n   = s_logisimNet31;
   assign BGNT50_n = s_logisimNet89;
   assign BGNT_n   = s_logisimNet25;
   assign CGNT50_n = s_logisimNet26;
   assign CGNT_n   = s_logisimNet107;
   assign CRQ_n    = s_logisimNet109;
   assign GNT50_n  = s_logisimNet32;
   assign IDB_15_0_OUT = s_idb_15_0_out[15:0];
   assign LERR_n   = s_logisimNet44;
   assign LPERR_n  = s_logisimNet60;
   assign MOFF_n   = s_logisimNet59;
   assign MOR25_n  = s_logisimNet0;
   assign MWRITE_n = s_logisimNet13;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   MEM_ADEC_45   ADEC (.BANK_2_0(s_bank_2_0[2:0]),
                       .BD19_n(s_logisimBus101[0]),
                       .BD20_n(s_logisimBus101[1]),
                       .BD21_n(s_logisimBus101[2]),
                       .BD22_n(s_logisimBus101[3]),
                       .BD23_n(s_logisimBus101[4]),
                       .BGNT_n(s_logisimNet25),
                       .BLRQ_n(s_logisimNet22),
                       .BMEM_n(s_logisimNet68),
                       .CGNT_n(s_logisimNet107),
                       .CLRQ_n(s_logisimNet34),
                       .CRQ_n(s_logisimNet109),
                       .DBAPR(s_logisimNet103),
                       .ECREQ(s_logisimNet48),
                       .IBINPUT_n(s_logisimNet100),
                       .IORQ_n(s_logisimNet47),
                       .MOFF_n(s_logisimNet59),
                       .MWRITE_n(s_logisimNet13),
                       .PD4(s_logisimNet98),
                       .PPN19(s_logisimBus104[0]),
                       .PPN20(s_logisimBus104[1]),
                       .PPN21(s_logisimBus104[2]),
                       .PPN22(s_logisimBus104[3]),
                       .PPN23(s_logisimBus104[4]),
                       .REFRQ_n(s_logisimNet85),
                       .RGNT_n(s_logisimNet79),
                       .RLRQ_n(s_logisimNet45),
                       .WRITE(s_logisimNet99));

   MEM_LBDIF_48   LBDIF (.BCGNT25(s_logisimNet86),
                         .BCGNT50(s_logisimNet24),
                         .BCGNT50R_n(s_logisimNet29),
                         .BDAP50_n(s_logisimNet74),
                         .BDRY_n(s_logisimNet31),
                         .BGNT25_n(s_logisimNet93),
                         .BGNT50_n(s_logisimNet89),
                         .BGNT_n(s_logisimNet25),
                         .BIOXE_n(s_logisimNet70),
                         .BIOXL_n(s_logisimNet11),
                         .BLOCKL25_n(s_logisimNet14),
                         .BLOCKL_n(s_logisimNet87),
                         .BLRQ50_n(s_logisimNet23),
                         .BLRQ_n(s_logisimNet22),
                         .CGNT25_n(s_logisimNet51),
                         .CGNT50_n(s_logisimNet26),
                         .CGNT_n(s_logisimNet107),
                         .ECCR(s_logisimNet75),
                         .GNT50_n(s_logisimNet32),
                         .GNT_n(s_logisimNet58),
                         .HIEN_n(s_logisimNet80),
                         .LOEN_n(s_logisimNet69),
                         .MOR25_n(s_logisimNet0),
                         .MOR_n(s_logisimNet76),
                         .MR_n(s_logisimNet84),
                         .MWRITE50_n(s_logisimNet62),
                         .MWRITE_n(s_logisimNet13),
                         .OSC(s_logisimNet91),
                         .PD4(s_logisimNet98),
                         .RAS(s_logisimNet81),
                         .RDATA(s_logisimNet10),
                         .RDATA25_n(s_logisimNet30),
                         .REF_n(s_logisimNet108));

   MEM_DATA_46   DATA (.BCGNT50R_n(s_logisimNet29),
                       .BIOXL_n(s_logisimNet11),
                       .DD_17_0_OUT(s_logisimBus71[17:0]),
                       .ECCR(s_logisimNet75),
                       .HIEN_n(s_logisimNet80),
                       .HIERR(s_logisimNet83),
                       .LBD_15_0_IN(s_lbd_23_0_in[15:0]),
                       .LBD_15_0_OUT(s_lbd_23_0_out[15:0]),
                       .LERR_n(s_logisimNet44),
                       .LOERR(s_logisimNet27),
                       .LPERR_n(s_logisimNet60),
                       .MR_n(s_logisimNet84),
                       .MWRITE_n(s_logisimNet13),
                       .PA_n(s_logisimNet28),
                       .QD_n(s_logisimNet33),
                       .RDATA(s_logisimNet10),
                       .LED4(LED4)
                );

   MEM_ERROR_47   ERROR (.BCGNT50(s_logisimNet24),
                         .BLOCKL25(s_logisimNet14),
                         .BLOCKL_n(s_logisimNet87),
                         .CGNT50_n(s_logisimNet26),
                         .CORR_n(s_logisimNet105),
                         .FETCH(s_logisimNet92),
                         .HIERR(s_logisimNet83),
                         .IDB_15_0_OUT(s_idb_15_0_out[15:0]),
                         .LBD_23_0_IN(s_lbd_23_0_in[23:0]),
                         .LERR_n(s_logisimNet44),
                         .LOERR(s_logisimNet27),
                         .MR_n(s_logisimNet84),
                         .PA_n(s_logisimNet28),
                         .PD4(s_logisimNet98),
                         .PS_n(s_logisimNet63),
                         .RDATA25(s_logisimNet30),
                         .RERR_n(s_logisimNet90));

   MEM_RAMC_50   RAMC (.BDAP50_n(s_logisimNet74),
                       .BDRY50_n(s_logisimNet73),
                       .BGNT25(s_logisimNet77),
                       .BGNT25_n(s_logisimNet93),
                       .BGNT_n(s_logisimNet25),
                       .BLRQ50_n(s_logisimNet23),
                       .CAS(s_logisimNet43),
                       .CGNT25_n(s_logisimNet51),
                       .CGNT_n(s_logisimNet107),
                       .CLRQ_n(s_logisimNet34),
                       .HIEN_n(s_logisimNet80),
                       .LOEN_n(s_logisimNet69),
                       .MR_n(s_logisimNet84),
                       .OSC(s_logisimNet91),
                       .PD1(s_logisimNet49),
                       .PD3(s_logisimNet102),
                       .QD_n(s_logisimNet33),
                       .RAS(s_logisimNet81),
                       .RGNT_n(s_logisimNet79),
                       .RLRQ_n(s_logisimNet45),
                       .SEMRQ50_n(s_logisimNet50),
                       .SSEMA_n(s_logisimNet61),
                       .LED_CPU_GI(LED_CPU_GI),
                       .LED_BUS_GI(LED_BUS_GI)
                       );

   MEM_ADDR_44   ADDR (.AA_9_0(s_aa_9_0[9:0]),
                       .BCGNT50(s_logisimNet24),
                       .HIEN_n(s_logisimNet80),
                       .LBD_19_0(s_lbd_23_0_in[19:0]),
                       .LOEN_n(s_logisimNet69),
                       .PD4(s_logisimNet98));

   MEM_RAM_49   RAM (
                     .sysclk(sysclk),
                     .sys_rst_n(sys_rst_n), 
                     .AA_9_0(s_aa_9_0[9:0]),
                     .BANK0(s_bank_2_0[0]),
                     .BANK1(s_bank_2_0[1]),
                     .BANK2(s_bank_2_0[2]),
                     .CAS(s_logisimNet43),
                     .CORR_n(s_logisimNet105),
                     .DD_17_0_IN(s_dd_17_0_in[17:0]),
                     .DD_17_0_OUT(s_dd_17_0_out[17:0]), //TODO: Connect
                     .MWRITE50_n(s_logisimNet62),
                     .RAS(s_logisimNet81));

endmodule
