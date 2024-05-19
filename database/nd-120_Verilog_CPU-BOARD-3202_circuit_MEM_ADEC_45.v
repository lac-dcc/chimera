// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

 /**************************************************************************
** ND120 CPU, MM&M                                                       **
** MEM/ADEC                                                              **
** ADDRESS DECODERS                                                      **
** SHEET 45 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/


module MEM_ADEC_45( BANK_2_0,
                    BD19_n,
                    BD20_n,
                    BD21_n,
                    BD22_n,
                    BD23_n,
                    BGNT_n,
                    BLRQ_n,
                    BMEM_n,
                    CGNT_n,
                    CLRQ_n,
                    CRQ_n,
                    DBAPR,
                    ECREQ,
                    IBINPUT_n,
                    IORQ_n,
                    MOFF_n,
                    MWRITE_n,
                    PD4,
                    PPN19,
                    PPN20,
                    PPN21,
                    PPN22,
                    PPN23,
                    REFRQ_n,
                    RGNT_n,
                    RLRQ_n,
                    WRITE );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input BD19_n;
   input BD20_n;
   input BD21_n;
   input BD22_n;
   input BD23_n;
   input BGNT_n;
   input BMEM_n;
   input CGNT_n;
   input DBAPR;
   input ECREQ;
   input IBINPUT_n;
   input IORQ_n;
   input PD4;
   input PPN19;
   input PPN20;
   input PPN21;
   input PPN22;
   input PPN23;
   input REFRQ_n;
   input RGNT_n;
   input WRITE;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [2:0] BANK_2_0;
   output       BLRQ_n;
   output       CLRQ_n;
   output       CRQ_n;
   output       MOFF_n;
   output       MWRITE_n;
   output       RLRQ_n;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus39;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet23;
   wire       s_logisimNet24;
   wire       s_logisimNet25;
   wire       s_logisimNet26;
   wire       s_logisimNet27;
   wire       s_logisimNet28;
   wire       s_logisimNet29;
   wire       s_logisimNet3;
   wire       s_logisimNet30;
   wire       s_logisimNet31;
   wire       s_logisimNet32;
   wire       s_logisimNet33;
   wire       s_logisimNet34;
   wire       s_logisimNet35;
   wire       s_logisimNet36;
   wire       s_logisimNet37;
   wire       s_logisimNet38;
   wire       s_logisimNet4;
   wire       s_logisimNet40;
   wire       s_logisimNet41;
   wire       s_logisimNet42;
   wire       s_logisimNet43;
   wire       s_logisimNet44;
   wire       s_logisimNet45;
   wire       s_logisimNet46;
   wire       s_logisimNet47;
   wire       s_logisimNet48;
   wire       s_logisimNet49;
   wire       s_logisimNet5;
   wire       s_logisimNet50;
   wire       s_logisimNet51;
   wire       s_logisimNet52;
   wire       s_logisimNet53;
   wire       s_logisimNet54;
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
   assign s_logisimNet0  = ECREQ;
   assign s_logisimNet11 = BD20_n;
   assign s_logisimNet12 = BD22_n;
   assign s_logisimNet18 = BD23_n;
   assign s_logisimNet19 = BD19_n;
   assign s_logisimNet21 = BMEM_n;
   assign s_logisimNet24 = BGNT_n;
   assign s_logisimNet25 = PD4;
   assign s_logisimNet28 = CGNT_n;
   assign s_logisimNet3  = WRITE;
   assign s_logisimNet33 = IORQ_n;
   assign s_logisimNet34 = PPN19;
   assign s_logisimNet35 = PPN21;
   assign s_logisimNet36 = PPN23;
   assign s_logisimNet4  = PPN20;
   assign s_logisimNet45 = IBINPUT_n;
   assign s_logisimNet46 = REFRQ_n;
   assign s_logisimNet5  = PPN22;
   assign s_logisimNet6  = DBAPR;
   assign s_logisimNet7  = RGNT_n;
   assign s_logisimNet8  = BD21_n;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BANK_2_0 = s_logisimBus39[2:0];
   assign BLRQ_n   = s_logisimNet2;
   assign CLRQ_n   = s_logisimNet23;
   assign CRQ_n    = s_logisimNet22;
   assign MOFF_n   = s_logisimNet51;
   assign MWRITE_n = s_logisimNet40;
   assign RLRQ_n   = s_logisimNet43;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power
   assign  s_logisimNet32  =  1'b1;


   // Constant
   assign  s_logisimNet51  =  1'b1;


   // Power
   assign  s_logisimNet16  =  1'b1;


   // NOT Gate
   assign s_logisimNet1 = ~s_logisimNet24;

   // NOT Gate
   assign s_logisimNet44 = ~s_logisimNet32;

   // NOT Gate
   assign s_logisimNet30 = ~s_logisimNet7;

   // NOT Gate
   assign s_logisimNet47 = ~s_logisimNet16;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_1 (.clock(s_logisimNet20),
                .d(s_logisimNet9),
                .preset(s_logisimNet44),
                .q(),
                .qBar(s_logisimNet2),
                .reset(s_logisimNet1),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_2 (.clock(s_logisimNet46),
                .d(s_logisimNet16),
                .preset(s_logisimNet47),
                .q(s_logisimNet27),
                .qBar(s_logisimNet43),
                .reset(s_logisimNet30),
                .tick(1'b1));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

/* TODO:
   PAL_44904B   PAL_44904_UMSIZE (.CK(s_logisimNet27),
                                 .I0(s_logisimNet42),
                                 .I1(s_logisimNet41),
                                 .I2(s_logisimNet51),
                                 .I3(1'b0),
                                 .I4(1'b0),
                                 .I5(1'b0),
                                 .I6(1'b0),
                                 .I7(1'b0),
                                 .OE_n(s_logisimNet25),
                                 .Q0_n(s_logisimNet13),
                                 .Q1_n(s_logisimNet52),
                                 .Q2_n(s_logisimNet14),
                                 .Q3_n(s_logisimNet53),
                                 .Q4_n(),
                                 .Q5_n(s_logisimNet26),
                                 .Q6_n(s_logisimNet48),
                                 .Q7_n(s_logisimNet31));

   PAL_16R4D   PAL_UCADEC (.B0_n(s_logisimNet42),
                           .B1_n(s_logisimNet23),
                           .B2_n(s_logisimNet22),
                           .B3_n(s_logisimNet15),
                           .CK(s_logisimNet0),
                           .I0(s_logisimNet3),
                           .I1(s_logisimNet33),
                           .I2(s_logisimNet51),
                           .I3(s_logisimNet34),
                           .I4(s_logisimNet4),
                           .I5(s_logisimNet35),
                           .I6(s_logisimNet5),
                           .I7(s_logisimNet36),
                           .OE_n(s_logisimNet28),
                           .Q0_n(s_logisimBus39[2]),
                           .Q1_n(s_logisimBus39[1]),
                           .Q2_n(s_logisimBus39[0]),
                           .Q3_n(s_logisimNet40));

   PAL_16R4D   PAL_UBADEC (.B0_n(s_logisimNet9),
                           .B1_n(s_logisimNet20),
                           .B2_n(s_logisimNet41),
                           .B3_n(s_logisimNet17),
                           .CK(s_logisimNet6),
                           .I0(s_logisimNet6),
                           .I1(s_logisimNet51),
                           .I2(s_logisimNet45),
                           .I3(s_logisimNet21),
                           .I4(s_logisimNet11),
                           .I5(s_logisimNet8),
                           .I6(s_logisimNet12),
                           .I7(s_logisimNet18),
                           .OE_n(s_logisimNet24),
                           .Q0_n(s_logisimNet54),
                           .Q1_n(s_logisimNet37),
                           .Q2_n(s_logisimNet10),
                           .Q3_n(s_logisimNet38));
*/
endmodule
