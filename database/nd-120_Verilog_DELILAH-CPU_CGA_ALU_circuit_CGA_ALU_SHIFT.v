// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_ALU_SHIFT                                                **
 **                                                                          **
 *****************************************************************************/

module CGA_ALU_SHIFT( ALUI7,
                      ALUI8N,
                      F_15_0,
                      RB_15_0,
                      RLI,
                      RRI );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ALUI7;
   input        ALUI8N;
   input [15:0] F_15_0;
   input        RLI;
   input        RRI;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] RB_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus37;
   wire [15:0] s_logisimBus46;
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
   assign s_logisimBus37[15:0] = F_15_0;
   assign s_logisimNet1        = ALUI8N;
   assign s_logisimNet2        = RLI;
   assign s_logisimNet53       = RRI;
   assign s_logisimNet7        = ALUI7;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign RB_15_0 = s_logisimBus46[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimBus46[3] = ~s_logisimNet26;

   // NOT Gate
   assign s_logisimBus46[11] = ~s_logisimNet42;

   // NOT Gate
   assign s_logisimBus46[10] = ~s_logisimNet3;

   // NOT Gate
   assign s_logisimBus46[9] = ~s_logisimNet14;

   // NOT Gate
   assign s_logisimBus46[8] = ~s_logisimNet27;

   // NOT Gate
   assign s_logisimBus46[7] = ~s_logisimNet5;

   // NOT Gate
   assign s_logisimBus46[6] = ~s_logisimNet16;

   // NOT Gate
   assign s_logisimBus46[5] = ~s_logisimNet28;

   // NOT Gate
   assign s_logisimBus46[4] = ~s_logisimNet44;

   // NOT Gate
   assign s_logisimBus46[2] = ~s_logisimNet29;

   // NOT Gate
   assign s_logisimBus46[1] = ~s_logisimNet45;

   // NOT Gate
   assign s_logisimBus46[0] = ~s_logisimNet6;

   // NOT Gate
   assign s_logisimBus46[15] = ~s_logisimNet25;

   // NOT Gate
   assign s_logisimBus46[14] = ~s_logisimNet43;

   // NOT Gate
   assign s_logisimBus46[13] = ~s_logisimNet4;

   // NOT Gate
   assign s_logisimBus46[12] = ~s_logisimNet15;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   MUX31LP   RB3MUX (.A(s_logisimNet7),
                     .B(s_logisimNet1),
                     .D0(s_logisimBus37[4]),
                     .D1(s_logisimBus37[2]),
                     .D2(s_logisimBus37[3]),
                     .ZN(s_logisimNet26));

   MUX31LP   RB11MUX (.A(s_logisimNet7),
                      .B(s_logisimNet1),
                      .D0(s_logisimBus37[12]),
                      .D1(s_logisimBus37[10]),
                      .D2(s_logisimBus37[11]),
                      .ZN(s_logisimNet42));

   MUX31LP   RB10MUX (.A(s_logisimNet7),
                      .B(s_logisimNet1),
                      .D0(s_logisimBus37[11]),
                      .D1(s_logisimBus37[9]),
                      .D2(s_logisimBus37[10]),
                      .ZN(s_logisimNet3));

   MUX31LP   RB9MUX (.A(s_logisimNet7),
                     .B(s_logisimNet1),
                     .D0(s_logisimBus37[10]),
                     .D1(s_logisimBus37[8]),
                     .D2(s_logisimBus37[9]),
                     .ZN(s_logisimNet14));

   MUX31LP   RB8MUX (.A(s_logisimNet7),
                     .B(s_logisimNet1),
                     .D0(s_logisimBus37[9]),
                     .D1(s_logisimBus37[7]),
                     .D2(s_logisimBus37[8]),
                     .ZN(s_logisimNet27));

   MUX31LP   RB7MUX (.A(s_logisimNet7),
                     .B(s_logisimNet1),
                     .D0(s_logisimBus37[8]),
                     .D1(s_logisimBus37[6]),
                     .D2(s_logisimBus37[7]),
                     .ZN(s_logisimNet5));

   MUX31LP   RB6MUX (.A(s_logisimNet7),
                     .B(s_logisimNet1),
                     .D0(s_logisimBus37[7]),
                     .D1(s_logisimBus37[5]),
                     .D2(s_logisimBus37[6]),
                     .ZN(s_logisimNet16));

   MUX31LP   RB5MUX (.A(s_logisimNet7),
                     .B(s_logisimNet1),
                     .D0(s_logisimBus37[6]),
                     .D1(s_logisimBus37[4]),
                     .D2(s_logisimBus37[5]),
                     .ZN(s_logisimNet28));

   MUX31LP   RB4MUX (.A(s_logisimNet7),
                     .B(s_logisimNet1),
                     .D0(s_logisimBus37[5]),
                     .D1(s_logisimBus37[3]),
                     .D2(s_logisimBus37[4]),
                     .ZN(s_logisimNet44));

   MUX31LP   RB2MUX (.A(s_logisimNet7),
                     .B(s_logisimNet1),
                     .D0(s_logisimBus37[3]),
                     .D1(s_logisimBus37[1]),
                     .D2(s_logisimBus37[2]),
                     .ZN(s_logisimNet29));

   MUX31LP   RB1MUX (.A(s_logisimNet7),
                     .B(s_logisimNet1),
                     .D0(s_logisimBus37[2]),
                     .D1(s_logisimBus37[0]),
                     .D2(s_logisimBus37[1]),
                     .ZN(s_logisimNet45));

   MUX31LP   RB0MUX (.A(s_logisimNet7),
                     .B(s_logisimNet1),
                     .D0(s_logisimBus37[1]),
                     .D1(s_logisimNet2),
                     .D2(s_logisimBus37[0]),
                     .ZN(s_logisimNet6));

   MUX31LP   RB15MUX (.A(s_logisimNet7),
                      .B(s_logisimNet1),
                      .D0(s_logisimNet53),
                      .D1(s_logisimBus37[14]),
                      .D2(s_logisimBus37[15]),
                      .ZN(s_logisimNet25));

   MUX31LP   RB14MUX (.A(s_logisimNet7),
                      .B(s_logisimNet1),
                      .D0(s_logisimBus37[15]),
                      .D1(s_logisimBus37[13]),
                      .D2(s_logisimBus37[14]),
                      .ZN(s_logisimNet43));

   MUX31LP   RB13MUX (.A(s_logisimNet7),
                      .B(s_logisimNet1),
                      .D0(s_logisimBus37[14]),
                      .D1(s_logisimBus37[12]),
                      .D2(s_logisimBus37[13]),
                      .ZN(s_logisimNet4));

   MUX31LP   RB12MUX (.A(s_logisimNet7),
                      .B(s_logisimNet1),
                      .D0(s_logisimBus37[13]),
                      .D1(s_logisimBus37[11]),
                      .D2(s_logisimBus37[12]),
                      .ZN(s_logisimNet15));

endmodule
