// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

 /**************************************************************************
** ND120 CPU, MM&M                                                       **
** MEM/ADDR                                                              **
** MEM ADDR MUX                                                          **
** SHEET 44 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

module MEM_ADDR_44( AA_9_0,
                    BCGNT50,
                    HIEN_n,
                    LBD_19_0,
                    LOEN_n,
                    PD4 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        BCGNT50;
   input        HIEN_n;
   input [19:0] LBD_19_0;
   input        LOEN_n;
   input        PD4;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [9:0] AA_9_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [9:0]  s_logisimBus20;
   wire [19:0] s_logisimBus41;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet11;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_logisimNet14;
   wire        s_logisimNet15;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
   wire        s_logisimNet18;
   wire        s_logisimNet19;
   wire        s_logisimNet2;
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
   wire        s_logisimNet42;
   wire        s_logisimNet43;
   wire        s_logisimNet44;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet5;
   wire        s_logisimNet6;
   wire        s_logisimNet7;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus41[19:0] = LBD_19_0;
   assign s_logisimNet13       = LOEN_n;
   assign s_logisimNet22       = BCGNT50;
   assign s_logisimNet23       = HIEN_n;
   assign s_logisimNet40       = PD4;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign AA_9_0 = s_logisimBus20[9:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power
   assign  s_logisimNet14  =  1'b1;


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   /* TODO:
   
   AM29861A   CHIP_5H (.OER_n(s_logisimNet14),
                       .OET_n(s_logisimNet40),
                       .R0(s_logisimNet12),
                       .R1(s_logisimNet11),
                       .R2(s_logisimNet2),
                       .R3(s_logisimNet10),
                       .R4(s_logisimNet9),
                       .R5(s_logisimNet8),
                       .R6(s_logisimNet7),
                       .R7(s_logisimNet6),
                       .R8(s_logisimNet16),
                       .R9(s_logisimNet17),
                       .T0(s_logisimBus20[0]),
                       .T1(s_logisimBus20[1]),
                       .T2(s_logisimBus20[2]),
                       .T3(s_logisimBus20[3]),
                       .T4(s_logisimBus20[4]),
                       .T5(s_logisimBus20[5]),
                       .T6(s_logisimBus20[6]),
                       .T7(s_logisimBus20[7]),
                       .T8(s_logisimBus20[8]),
                       .T9(s_logisimBus20[9]));

   AM29C821   CHIP_3H_ROW_ADDRESS (.CK(s_logisimNet22),
                                   .D0(s_logisimBus41[0]),
                                   .D1(s_logisimBus41[1]),
                                   .D2(s_logisimBus41[2]),
                                   .D3(s_logisimBus41[3]),
                                   .D4(s_logisimBus41[4]),
                                   .D5(s_logisimBus41[5]),
                                   .D6(s_logisimBus41[6]),
                                   .D7(s_logisimBus41[7]),
                                   .D8(s_logisimBus41[8]),
                                   .D9(s_logisimBus41[18]),
                                   .OE_n(s_logisimNet13),
                                   .Y0(),
                                   .Y1(),
                                   .Y2(),
                                   .Y3(),
                                   .Y4(),
                                   .Y5(),
                                   .Y6(),
                                   .Y7(),
                                   .Y8(),
                                   .Y9());

   AM29C821   CHIP_4H_COL_ADDRESS (.CK(s_logisimNet22),
                                   .D0(s_logisimBus41[9]),
                                   .D1(s_logisimBus41[10]),
                                   .D2(s_logisimBus41[11]),
                                   .D3(s_logisimBus41[12]),
                                   .D4(s_logisimBus41[13]),
                                   .D5(s_logisimBus41[14]),
                                   .D6(s_logisimBus41[15]),
                                   .D7(s_logisimBus41[16]),
                                   .D8(s_logisimBus41[17]),
                                   .D9(s_logisimBus41[19]),
                                   .OE_n(s_logisimNet23),
                                   .Y0(s_logisimNet12),
                                   .Y1(s_logisimNet11),
                                   .Y2(s_logisimNet2),
                                   .Y3(s_logisimNet10),
                                   .Y4(s_logisimNet9),
                                   .Y5(s_logisimNet8),
                                   .Y6(s_logisimNet7),
                                   .Y7(s_logisimNet6),
                                   .Y8(s_logisimNet16),
                                   .Y9(s_logisimNet17));

   */                                 

endmodule
