// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** CPU GATE ARRAY - CGA - DELILAH                                        **
**                                                                       **
** CGA/IDBCTL - IDB Control Logic                                        **
**                                                                       **
** PDF page 97 of 108                                                    **
**                                                                       ** 
** Last reviewed: 23-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/


module CGA_IDBCTL( EPCRN,
                   EPGSN,
                   EPICMASKN,
                   EPICSN,
                   EPICVN,
                   FETCHN,
                   FIDBI_15_0_OUT,
                   HIGSN,
                   LA_21_10,
                   LOGSN,
                   MCLK,
                   PCR_15_0,
                   PD,
                   PICMASK_15_0,
                   PICS_2_0,
                   PICV_2_0,
                   PVIOL,
                   VACCN,
                   XFIDBI_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        EPCRN;
   input        EPGSN;
   input        EPICMASKN;
   input        EPICSN;
   input        EPICVN;
   input        FETCHN;
   input        HIGSN;
   input [11:0] LA_21_10;
   input        LOGSN;
   input        MCLK;
   input [15:0] PCR_15_0;
   input        PD;
   input [15:0] PICMASK_15_0;
   input [2:0]  PICS_2_0;
   input [2:0]  PICV_2_0;
   input        PVIOL;
   input        VACCN;
   input [15:0] XFIDBI_15_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] FIDBI_15_0_OUT;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [11:0] s_logisimBus102;
   wire [2:0]  s_logisimBus109;
   wire [15:0] s_logisimBus111;
   wire [2:0]  s_logisimBus116;
   wire [15:0] s_logisimBus120;
   wire [15:0] s_logisimBus24;
   wire [15:0] s_logisimBus60;
   wire [1:0]  s_logisimBus67;
   wire [5:0]  s_logisimBus8;
   wire [11:0] s_logisimBus98;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet100;
   wire        s_logisimNet101;
   wire        s_logisimNet103;
   wire        s_logisimNet104;
   wire        s_logisimNet105;
   wire        s_logisimNet106;
   wire        s_logisimNet107;
   wire        s_logisimNet108;
   wire        s_logisimNet11;
   wire        s_logisimNet110;
   wire        s_logisimNet112;
   wire        s_logisimNet113;
   wire        s_logisimNet114;
   wire        s_logisimNet115;
   wire        s_logisimNet117;
   wire        s_logisimNet118;
   wire        s_logisimNet119;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_logisimNet14;
   wire        s_logisimNet15;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
   wire        s_logisimNet18;
   wire        s_logisimNet19;
   wire        s_logisimNet2;
   wire        s_logisimNet20;
   wire        s_logisimNet21;
   wire        s_logisimNet22;
   wire        s_logisimNet23;
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
   wire        s_logisimNet46;
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
   wire        s_logisimNet61;
   wire        s_logisimNet62;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet68;
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
   wire        s_logisimNet80;
   wire        s_logisimNet81;
   wire        s_logisimNet82;
   wire        s_logisimNet83;
   wire        s_logisimNet84;
   wire        s_logisimNet85;
   wire        s_logisimNet86;
   wire        s_logisimNet87;
   wire        s_logisimNet88;
   wire        s_logisimNet89;
   wire        s_logisimNet9;
   wire        s_logisimNet90;
   wire        s_logisimNet91;
   wire        s_logisimNet92;
   wire        s_logisimNet93;
   wire        s_logisimNet94;
   wire        s_logisimNet95;
   wire        s_logisimNet96;
   wire        s_logisimNet97;
   wire        s_logisimNet99;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus109[2:0]  = PICV_2_0;
   assign s_logisimBus111[15:0] = PCR_15_0;
   assign s_logisimBus116[2:0]  = PICS_2_0;
   assign s_logisimBus120[15:0] = PICMASK_15_0;
   assign s_logisimBus24[15:0]  = XFIDBI_15_0;
   assign s_logisimBus98[11:0]  = LA_21_10;
   assign s_logisimNet10        = EPICVN;
   assign s_logisimNet107       = LOGSN;
   assign s_logisimNet112       = FETCHN;
   assign s_logisimNet114       = PD;
   assign s_logisimNet117       = MCLK;
   assign s_logisimNet118       = PVIOL;
   assign s_logisimNet119       = HIGSN;
   assign s_logisimNet28        = EPGSN;
   assign s_logisimNet50        = EPICMASKN;
   assign s_logisimNet56        = VACCN;
   assign s_logisimNet89        = EPCRN;
   assign s_logisimNet90        = EPICSN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign FIDBI_15_0_OUT = s_logisimBus60[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_logisimNet39  =  1'b0;


   // Ground
   assign  s_logisimNet36  =  1'b0;


   // Ground
   assign  s_logisimNet0  =  1'b0;


   // Ground
   assign  s_logisimNet91  =  1'b0;


   // Ground
   assign  s_logisimNet92  =  1'b0;


   // Ground
   assign  s_logisimNet11  =  1'b0;


   // Ground
   assign  s_logisimNet37  =  1'b0;


   // Ground
   assign  s_logisimNet38  =  1'b0;


   // Ground
   assign  s_logisimNet68  =  1'b0;


   // Ground
   assign  s_logisimNet12  =  1'b0;


   // Ground
   assign  s_logisimNet69  =  1'b0;


   // Ground
   assign  s_logisimNet45  =  1'b0;


   // NOT Gate
   assign s_logisimBus8[0] = ~s_logisimNet28;

   // NOT Gate
   assign s_logisimBus8[1] = ~s_logisimNet89;

   // NOT Gate
   assign s_logisimBus8[2] = ~s_logisimNet90;

   // NOT Gate
   assign s_logisimBus8[3] = ~s_logisimNet10;

   // NOT Gate
   assign s_logisimBus8[4] = ~s_logisimNet50;

   // NOT Gate
   assign s_logisimBus8[5] = ~s_logisimNet88;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_1 (.input1(s_logisimNet50),
               .input2(s_logisimNet10),
               .input3(s_logisimNet90),
               .input4(s_logisimNet89),
               .input5(s_logisimNet28),
               .result(s_logisimNet88));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_IDBCTL_SEL6   IDB13 (.D(s_logisimBus24[13]),
                            .D0(s_logisimBus60[13]),
                            .E_PINS(s_logisimBus8[5:0]),
                            .M(s_logisimBus120[13]),
                            .PCR(s_logisimBus111[13]),
                            .PGS(s_logisimNet36),
                            .S(s_logisimNet36),
                            .V(s_logisimNet36));

   CGA_IDBCTL_SEL6   IDB12 (.D(s_logisimBus24[12]),
                            .D0(s_logisimBus60[12]),
                            .E_PINS(s_logisimBus8[5:0]),
                            .M(s_logisimBus120[12]),
                            .PCR(s_logisimBus111[12]),
                            .PGS(s_logisimNet0),
                            .S(s_logisimNet0),
                            .V(s_logisimNet0));

   CGA_IDBCTL_SEL6   IDB11 (.D(s_logisimBus24[11]),
                            .D0(s_logisimBus60[11]),
                            .E_PINS(s_logisimBus8[5:0]),
                            .M(s_logisimBus120[11]),
                            .PCR(s_logisimBus111[11]),
                            .PGS(s_logisimBus102[11]),
                            .S(s_logisimNet91),
                            .V(s_logisimNet91));

   CGA_IDBCTL_SEL6   IDB10 (.D(s_logisimBus24[10]),
                            .D0(s_logisimBus60[10]),
                            .E_PINS(s_logisimBus8[5:0]),
                            .M(s_logisimBus120[10]),
                            .PCR(s_logisimBus111[10]),
                            .PGS(s_logisimBus102[10]),
                            .S(1'b0),
                            .V(1'b0));

   CGA_IDBCTL_SEL6   IDB15 (.D(s_logisimBus24[15]),
                            .D0(s_logisimBus60[15]),
                            .E_PINS(s_logisimBus8[5:0]),
                            .M(s_logisimBus120[15]),
                            .PCR(s_logisimBus111[15]),
                            .PGS(s_logisimBus67[1]),
                            .S(s_logisimNet92),
                            .V(s_logisimNet92));

   CGA_IDBCTL_SEL6   IDB14 (.D(s_logisimBus24[14]),
                            .D0(s_logisimBus60[14]),
                            .E_PINS(s_logisimBus8[5:0]),
                            .M(s_logisimBus120[14]),
                            .PCR(s_logisimBus111[14]),
                            .PGS(s_logisimBus67[0]),
                            .S(s_logisimNet39),
                            .V(s_logisimNet39));

   CGA_IDBCTL_SEL6   IDB7 (.D(s_logisimBus24[7]),
                           .D0(s_logisimBus60[7]),
                           .E_PINS(s_logisimBus8[5:0]),
                           .M(s_logisimBus120[7]),
                           .PCR(s_logisimBus111[7]),
                           .PGS(s_logisimBus102[7]),
                           .S(s_logisimNet37),
                           .V(s_logisimNet37));

   CGA_IDBCTL_SEL6   IDB6 (.D(s_logisimBus24[6]),
                           .D0(s_logisimBus60[6]),
                           .E_PINS(s_logisimBus8[5:0]),
                           .M(s_logisimBus120[6]),
                           .PCR(s_logisimNet38),
                           .PGS(s_logisimBus102[6]),
                           .S(s_logisimNet38),
                           .V(s_logisimNet38));

   CGA_IDBCTL_SEL6   IDB5 (.D(s_logisimBus24[5]),
                           .D0(s_logisimBus60[5]),
                           .E_PINS(s_logisimBus8[5:0]),
                           .M(s_logisimBus120[5]),
                           .PCR(s_logisimNet68),
                           .PGS(s_logisimBus102[5]),
                           .S(s_logisimNet68),
                           .V(s_logisimNet68));

   CGA_IDBCTL_SEL6   IDB4 (.D(s_logisimBus24[4]),
                           .D0(s_logisimBus60[4]),
                           .E_PINS(s_logisimBus8[5:0]),
                           .M(s_logisimBus120[4]),
                           .PCR(s_logisimNet12),
                           .PGS(s_logisimBus102[4]),
                           .S(s_logisimNet107),
                           .V(s_logisimNet12));

   CGA_IDBCTL_SEL6   IDB9 (.D(s_logisimBus24[9]),
                           .D0(s_logisimBus60[9]),
                           .E_PINS(s_logisimBus8[5:0]),
                           .M(s_logisimBus120[9]),
                           .PCR(s_logisimBus111[9]),
                           .PGS(s_logisimBus102[9]),
                           .S(s_logisimNet69),
                           .V(s_logisimNet69));

   CGA_IDBCTL_SEL6   IDB8 (.D(s_logisimBus24[8]),
                           .D0(s_logisimBus60[8]),
                           .E_PINS(s_logisimBus8[5:0]),
                           .M(s_logisimBus120[8]),
                           .PCR(s_logisimBus111[8]),
                           .PGS(s_logisimBus102[8]),
                           .S(s_logisimNet11),
                           .V(s_logisimNet11));

   CGA_IDBCTL_SEL6   IDB1 (.D(s_logisimBus24[1]),
                           .D0(s_logisimBus60[1]),
                           .E_PINS(s_logisimBus8[5:0]),
                           .M(s_logisimBus120[1]),
                           .PCR(s_logisimBus111[1]),
                           .PGS(s_logisimBus102[1]),
                           .S(s_logisimBus116[1]),
                           .V(s_logisimBus109[1]));

   CGA_IDBCTL_SEL6   IDB0 (.D(s_logisimBus24[0]),
                           .D0(s_logisimBus60[0]),
                           .E_PINS(s_logisimBus8[5:0]),
                           .M(s_logisimBus120[0]),
                           .PCR(s_logisimBus111[0]),
                           .PGS(s_logisimBus102[0]),
                           .S(s_logisimBus116[0]),
                           .V(s_logisimBus109[0]));

   CGA_IDBCTL_SEL6   IDB3 (.D(s_logisimBus24[3]),
                           .D0(s_logisimBus60[3]),
                           .E_PINS(s_logisimBus8[5:0]),
                           .M(s_logisimBus120[3]),
                           .PCR(s_logisimNet45),
                           .PGS(s_logisimBus102[3]),
                           .S(s_logisimNet119),
                           .V(s_logisimNet114));

   CGA_IDBCTL_SEL6   IDB2 (.D(s_logisimBus24[2]),
                           .D0(s_logisimBus60[2]),
                           .E_PINS(s_logisimBus8[5:0]),
                           .M(s_logisimBus120[2]),
                           .PCR(s_logisimBus111[2]),
                           .PGS(s_logisimBus102[2]),
                           .S(s_logisimBus116[2]),
                           .V(s_logisimBus109[2]));

   CGA_IDBCTL_PGSREG   PGSREG (.FETCHN(s_logisimNet112),
                               .LA_21_10(s_logisimBus98[11:0]),
                               .MCLK(s_logisimNet117),
                               .PGS_11_0(s_logisimBus102[11:0]),
                               .PGS_15_14(s_logisimBus67[1:0]),
                               .PVIOL(s_logisimNet118),
                               .VACCN(s_logisimNet56));

endmodule
