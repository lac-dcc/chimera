// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/MMU/WCA                                                           **
** PPN TO CPN                                                            **
** SHEET 31 of 50                                                        **
**                                                                       ** 
** Last reviewed: 10-FEB-2024                                            **
** Ronny Hansen                                                          **
***************************************************************************/

module CPU_MMU_WCA_31(
                        input  [13:0] CPN_23_10,
                        input         WCA_n,
                        output [13:0] PPN_23_10
                      );


assign PPN_23_10 = WCA_n ? 14'b0 : CPN_23_10;


// Below is the original code from the Logisim generated file
`ifdef _OLD_CODE_

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [13:0] s_logisimBus0;
   wire [13:0] s_logisimBus15;
   wire        s_logisimNet10;
   wire        s_logisimNet11;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
   wire        s_logisimNet18;
   wire        s_logisimNet19;
   wire        s_logisimNet20;
   wire        s_logisimNet21;
   wire        s_logisimNet25;
   wire        s_logisimNet26;
   wire        s_logisimNet27;
   wire        s_logisimNet28;
   wire        s_logisimNet29;
   wire        s_logisimNet30;
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet37;
   wire        s_logisimNet38;
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
   assign s_logisimBus15[13:0] = PPN_23_10;
   assign s_logisimNet5        = WCA_n;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign CPN_23_10 = s_logisimBus0[13:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   TTL_74244   CHIP_11G (.I0_1A1(1'b0),
                         .I1_1A2(1'b0),
                         .I2_1A3(s_logisimBus15[13]),
                         .I3_1A4(s_logisimBus15[12]),
                         .I4_2A1(s_logisimBus15[11]),
                         .I5_2A2(s_logisimBus15[10]),
                         .I6_2A3(s_logisimBus15[9]),
                         .I7_2A4(s_logisimBus15[8]),
                         .O0_1Y1(),
                         .O1_1Y2(),
                         .O2_1Y3(s_logisimBus0[12]),
                         .O3_1Y4(s_logisimBus0[13]),
                         .O4_2Y1(s_logisimBus0[11]),
                         .O5_2Y2(s_logisimBus0[10]),
                         .O6_2Y3(s_logisimBus0[9]),
                         .O7_2Y4(s_logisimBus0[8]),
                         .OE1_1G_n(s_logisimNet5),
                         .OE2_2G_n(s_logisimNet5));

   TTL_74244   CHIP_10G (.I0_1A1(s_logisimBus15[7]),
                         .I1_1A2(s_logisimBus15[6]),
                         .I2_1A3(s_logisimBus15[5]),
                         .I3_1A4(s_logisimBus15[4]),
                         .I4_2A1(s_logisimBus15[3]),
                         .I5_2A2(s_logisimBus15[2]),
                         .I6_2A3(s_logisimBus15[1]),
                         .I7_2A4(s_logisimBus15[0]),
                         .O0_1Y1(s_logisimBus0[7]),
                         .O1_1Y2(s_logisimBus0[6]),
                         .O2_1Y3(s_logisimBus0[5]),
                         .O3_1Y4(s_logisimBus0[4]),
                         .O4_2Y1(s_logisimBus0[3]),
                         .O5_2Y2(s_logisimBus0[2]),
                         .O6_2Y3(s_logisimBus0[1]),
                         .O7_2Y4(s_logisimBus0[0]),
                         .OE1_1G_n(s_logisimNet5),
                         .OE2_2G_n(s_logisimNet5));
`endif

endmodule
