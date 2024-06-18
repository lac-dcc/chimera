// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_TRAP                                                     **
 **                                                                          **
 *****************************************************************************/

module CGA_TRAP( BRKN,
                 CBRKN,
                 DSTOPN,
                 ETRAPN,
                 FETCHN,
                 FTRAPN,
                 INDN,
                 INTRQN,
                 PANN,
                 PCR_1_0,
                 PONI,
                 PT_15_9,
                 PVIOL,
                 RESTR,
                 TCLK,
                 TRAPN,
                 TVEC_3_0,
                 VACCN,
                 VTRAPN,
                 WRITEN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       CBRKN;
   input       DSTOPN;
   input       ETRAPN;
   input       FETCHN;
   input       FTRAPN;
   input       INDN;
   input       INTRQN;
   input       PANN;
   input [1:0] PCR_1_0;
   input       PONI;
   input [6:0] PT_15_9;
   input       TCLK;
   input       VACCN;
   input       VTRAPN;
   input       WRITEN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output       BRKN;
   output       PVIOL;
   output       RESTR;
   output       TRAPN;
   output [3:0] TVEC_3_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [1:0] s_logisimBus15;
   wire [1:0] s_logisimBus19;
   wire [3:0] s_logisimBus24;
   wire [1:0] s_logisimBus27;
   wire [6:0] s_logisimBus32;
   wire [6:0] s_logisimBus4;
   wire [6:0] s_logisimBus5;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet23;
   wire       s_logisimNet25;
   wire       s_logisimNet26;
   wire       s_logisimNet28;
   wire       s_logisimNet29;
   wire       s_logisimNet3;
   wire       s_logisimNet30;
   wire       s_logisimNet31;
   wire       s_logisimNet6;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus27[1:0] = PCR_1_0;
   assign s_logisimBus32[6:0] = PT_15_9;
   assign s_logisimNet0       = VTRAPN;
   assign s_logisimNet1       = INDN;
   assign s_logisimNet12      = VACCN;
   assign s_logisimNet14      = CBRKN;
   assign s_logisimNet16      = ETRAPN;
   assign s_logisimNet17      = INTRQN;
   assign s_logisimNet18      = FETCHN;
   assign s_logisimNet2       = PANN;
   assign s_logisimNet22      = FTRAPN;
   assign s_logisimNet29      = TCLK;
   assign s_logisimNet31      = WRITEN;
   assign s_logisimNet7       = PONI;
   assign s_logisimNet8       = DSTOPN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BRKN     = s_logisimNet30;
   assign PVIOL    = s_logisimNet9;
   assign RESTR    = s_logisimNet10;
   assign TRAPN    = s_logisimNet20;
   assign TVEC_3_0 = s_logisimBus24[3:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_TRAP_TVGEN   TVGEN (.DSTOPN(s_logisimNet8),
                           .FTRAPN(s_logisimNet22),
                           .IFETCH(s_logisimNet25),
                           .IFETCHN(s_logisimNet21),
                           .IIND(s_logisimNet6),
                           .IINDN(s_logisimNet3),
                           .INTRQ(s_logisimNet23),
                           .IPCR_1_0(s_logisimBus15[1:0]),
                           .IPCR_1_0_N(s_logisimBus19[1:0]),
                           .IPT_15_9(s_logisimBus5[6:0]),
                           .IPT_15_9_N(s_logisimBus4[6:0]),
                           .IWRITE(s_logisimNet13),
                           .IWRITEN(s_logisimNet11),
                           .PAN(s_logisimNet26),
                           .PONI(s_logisimNet7),
                           .PVIOL(s_logisimNet9),
                           .RESTR(s_logisimNet10),
                           .TCLK(s_logisimNet29),
                           .TVEC_3_0(s_logisimBus24[3:0]),
                           .VACC(s_logisimNet28),
                           .VTRAPN(s_logisimNet0));

   CGA_TRAP_BRKDET   BRKDET (.BRKN(s_logisimNet30),
                             .CBRKN(s_logisimNet14),
                             .ETRAPN(s_logisimNet16),
                             .FTRAPN(s_logisimNet22),
                             .IFETCH(s_logisimNet25),
                             .IFETCHN(s_logisimNet21),
                             .IINDN(s_logisimNet3),
                             .INTRQ(s_logisimNet23),
                             .IPCR_1_0(s_logisimBus19[1:0]),
                             .IPCR_1_0_N(s_logisimBus15[1:0]),
                             .IPT_15_9(s_logisimBus4[6:0]),
                             .IPT_15_9_N(s_logisimBus5[6:0]),
                             .IWRITE(s_logisimNet13),
                             .IWRITEN(s_logisimNet11),
                             .TRAPN(s_logisimNet20),
                             .VACC(s_logisimNet28),
                             .VTRAPN(s_logisimNet0));

   CGA_TRAP_TBUF   TBUF (.FETCHN(s_logisimNet18),
                         .IFETCH(s_logisimNet25),
                         .IFETCHN(s_logisimNet21),
                         .IIND(s_logisimNet6),
                         .IINDN(s_logisimNet3),
                         .INDN(s_logisimNet1),
                         .INTRQ(s_logisimNet23),
                         .INTRQN(s_logisimNet17),
                         .IPCR_1_0(s_logisimBus19[1:0]),
                         .IPCR_1_0_N(s_logisimBus15[1:0]),
                         .IPT_15_9(s_logisimBus4[6:0]),
                         .IPT_15_9_N(s_logisimBus5[6:0]),
                         .IWRITE(s_logisimNet13),
                         .IWRITEN(s_logisimNet11),
                         .PAN(s_logisimNet26),
                         .PANN(s_logisimNet2),
                         .PCR_1_0(s_logisimBus27[1:0]),
                         .PT_15_9(s_logisimBus32[6:0]),
                         .VACC(s_logisimNet28),
                         .VACCN(s_logisimNet12),
                         .WRITEN(s_logisimNet31));

endmodule
