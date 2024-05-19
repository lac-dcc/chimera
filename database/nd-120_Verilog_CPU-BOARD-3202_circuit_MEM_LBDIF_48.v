// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

 /**************************************************************************
** ND120 CPU, MM&M                                                       **
** MEM/LBDIF                                                             **
** LOCAL BD CONTROL                                                      **
** SHEET 48 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

module MEM_LBDIF_48( BCGNT25,
                     BCGNT50,
                     BCGNT50R_n,
                     BDAP50_n,
                     BDRY_n,
                     BGNT25_n,
                     BGNT50_n,
                     BGNT_n,
                     BIOXE_n,
                     BIOXL_n,
                     BLOCKL25_n,
                     BLOCKL_n,
                     BLRQ50_n,
                     BLRQ_n,
                     CGNT25_n,
                     CGNT50_n,
                     CGNT_n,
                     ECCR,
                     GNT50_n,
                     GNT_n,
                     HIEN_n,
                     LOEN_n,
                     MOR25_n,
                     MOR_n,
                     MR_n,
                     MWRITE50_n,
                     MWRITE_n,
                     OSC,
                     PD4,
                     RAS,
                     RDATA,
                     RDATA25_n,
                     REF_n );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input BCGNT25;
   input BDAP50_n;
   input BGNT_n;
   input BIOXE_n;
   input BLOCKL_n;
   input BLRQ_n;
   input CGNT_n;
   input ECCR;
   input GNT_n;
   input HIEN_n;
   input LOEN_n;
   input MOR_n;
   input MR_n;
   input MWRITE_n;
   input OSC;
   input PD4;
   input RAS;
   input REF_n;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output BCGNT50;
   output BCGNT50R_n;
   output BDRY_n;
   output BGNT25_n;
   output BGNT50_n;
   output BIOXL_n;
   output BLOCKL25_n;
   output BLRQ50_n;
   output CGNT25_n;
   output CGNT50_n;
   output GNT50_n;
   output MOR25_n;
   output MWRITE50_n;
   output RDATA;
   output RDATA25_n;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet10;
   wire s_logisimNet11;
   wire s_logisimNet12;
   wire s_logisimNet13;
   wire s_logisimNet14;
   wire s_logisimNet15;
   wire s_logisimNet16;
   wire s_logisimNet17;
   wire s_logisimNet18;
   wire s_logisimNet19;
   wire s_logisimNet2;
   wire s_logisimNet20;
   wire s_logisimNet21;
   wire s_logisimNet22;
   wire s_logisimNet23;
   wire s_logisimNet24;
   wire s_logisimNet25;
   wire s_logisimNet26;
   wire s_logisimNet27;
   wire s_logisimNet28;
   wire s_logisimNet29;
   wire s_logisimNet3;
   wire s_logisimNet30;
   wire s_logisimNet31;
   wire s_logisimNet32;
   wire s_logisimNet33;
   wire s_logisimNet34;
   wire s_logisimNet35;
   wire s_logisimNet36;
   wire s_logisimNet37;
   wire s_logisimNet38;
   wire s_logisimNet39;
   wire s_logisimNet4;
   wire s_logisimNet40;
   wire s_logisimNet41;
   wire s_logisimNet42;
   wire s_logisimNet43;
   wire s_logisimNet44;
   wire s_logisimNet45;
   wire s_logisimNet46;
   wire s_logisimNet47;
   wire s_logisimNet48;
   wire s_logisimNet49;
   wire s_logisimNet5;
   wire s_logisimNet6;
   wire s_logisimNet7;
   wire s_logisimNet8;
   wire s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet0  = HIEN_n;
   assign s_logisimNet15 = PD4;
   assign s_logisimNet18 = ECCR;
   assign s_logisimNet2  = LOEN_n;
   assign s_logisimNet21 = BLRQ_n;
   assign s_logisimNet24 = MWRITE_n;
   assign s_logisimNet25 = REF_n;
   assign s_logisimNet26 = MOR_n;
   assign s_logisimNet27 = BGNT_n;
   assign s_logisimNet28 = MR_n;
   assign s_logisimNet4  = BIOXE_n;
   assign s_logisimNet42 = BDAP50_n;
   assign s_logisimNet44 = BCGNT25;
   assign s_logisimNet45 = RAS;
   assign s_logisimNet47 = BLOCKL_n;
   assign s_logisimNet48 = GNT_n;
   assign s_logisimNet8  = OSC;
   assign s_logisimNet9  = CGNT_n;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BCGNT50    = s_logisimNet11;
   assign BCGNT50R_n = s_logisimNet49;
   assign BDRY_n     = s_logisimNet46;
   assign BGNT25_n   = s_logisimNet14;
   assign BGNT50_n   = s_logisimNet6;
   assign BIOXL_n    = s_logisimNet30;
   assign BLOCKL25_n = s_logisimNet34;
   assign BLRQ50_n   = s_logisimNet43;
   assign CGNT25_n   = s_logisimNet3;
   assign CGNT50_n   = s_logisimNet38;
   assign GNT50_n    = s_logisimNet33;
   assign MOR25_n    = s_logisimNet32;
   assign MWRITE50_n = s_logisimNet23;
   assign RDATA      = s_logisimNet35;
   assign RDATA25_n  = s_logisimNet29;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Buffer
   assign s_logisimNet46 = s_logisimNet31;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

/* TODO:

   AM29C821   CHIP_14F (.CK(s_logisimNet8),
                        .D0(s_logisimNet47),
                        .D1(s_logisimNet24),
                        .D2(s_logisimNet7),
                        .D3(s_logisimNet25),
                        .D4(s_logisimNet41),
                        .D5(s_logisimNet10),
                        .D6(s_logisimNet37),
                        .D7(s_logisimNet26),
                        .D8(s_logisimNet48),
                        .D9(s_logisimNet12),
                        .OE_n(s_logisimNet15),
                        .Y0(s_logisimNet34),
                        .Y1(s_logisimNet7),
                        .Y2(s_logisimNet23),
                        .Y3(s_logisimNet13),
                        .Y4(s_logisimNet16),
                        .Y5(s_logisimNet5),
                        .Y6(s_logisimNet20),
                        .Y7(s_logisimNet32),
                        .Y8(s_logisimNet22),
                        .Y9(s_logisimNet33));

   AM29C821   CHIP_13F (.CK(s_logisimNet8),
                        .D0(s_logisimNet21),
                        .D1(s_logisimNet36),
                        .D2(s_logisimNet35),
                        .D3(1'b0),
                        .D4(s_logisimNet9),
                        .D5(s_logisimNet3),
                        .D6(s_logisimNet27),
                        .D7(s_logisimNet14),
                        .D8(s_logisimNet6),
                        .D9(s_logisimNet44),
                        .OE_n(s_logisimNet15),
                        .Y0(s_logisimNet36),
                        .Y1(s_logisimNet43),
                        .Y2(s_logisimNet29),
                        .Y3(),
                        .Y4(s_logisimNet3),
                        .Y5(s_logisimNet38),
                        .Y6(s_logisimNet14),
                        .Y7(s_logisimNet6),
                        .Y8(s_logisimNet40),
                        .Y9(s_logisimNet11));


   PAL_44310D   PAL_44310_ULBDIF (.B0_n(s_logisimNet31),
                                   .B1_n(s_logisimNet30),
                                   .B2_n(s_logisimNet17),
                                   .B3_n(s_logisimNet39),
                                   .B4_n(s_logisimNet1),
                                   .B5_n(s_logisimNet19),
                                   .I0(s_logisimNet0),
                                   .I1(s_logisimNet27),
                                   .I2(s_logisimNet9),
                                   .I3(s_logisimNet2),
                                   .I4(s_logisimNet38),
                                   .I5(s_logisimNet18),
                                   .I6(s_logisimNet6),
                                   .I7(s_logisimNet40),
                                   .I8(s_logisimNet42),
                                   .I9(s_logisimNet28),
                                   .Y0_n(s_logisimNet49),
                                   .Y1_n(s_logisimNet35));
   */                                 

endmodule
