// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC_SEGPT_PCR                                            **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC_SEGPT_PCR( FIDB_15_7_2_0,
                          LLDPCR,
                          MCLKN,
                          PCR_14_13_10_9_N,
                          PCR_15_7_2_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [15:0] FIDB_15_7_2_0;
   input        LLDPCR;
   input        MCLKN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] PCR_14_13_10_9_N;
   output [15:0] PCR_15_7_2_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus33;
   wire [15:0] s_logisimBus6;
   wire [15:0] s_logisimBus7;
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
   wire        s_logisimNet34;
   wire        s_logisimNet4;
   wire        s_logisimNet5;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus7[15:0] = FIDB_15_7_2_0;
   assign s_logisimNet17      = MCLKN;
   assign s_logisimNet18      = LLDPCR;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign PCR_14_13_10_9_N = s_logisimBus33[15:0];
   assign PCR_15_7_2_0     = s_logisimBus6[15:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet17),
               .input2(s_logisimNet18),
               .result(s_logisimNet0));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   L8   PCR_HI (.A(s_logisimBus7[15]),
                .B(s_logisimBus7[14]),
                .C(s_logisimBus7[13]),
                .D(s_logisimBus7[12]),
                .E(s_logisimBus7[11]),
                .F(s_logisimBus7[10]),
                .G(s_logisimBus7[9]),
                .H(s_logisimBus7[8]),
                .L(s_logisimNet0),
                .QA(s_logisimBus6[15]),
                .QAN(),
                .QB(s_logisimBus6[14]),
                .QBN(s_logisimBus33[14]),
                .QC(s_logisimBus6[13]),
                .QCN(s_logisimBus33[13]),
                .QD(s_logisimBus6[12]),
                .QDN(s_logisimNet34),
                .QE(s_logisimBus6[11]),
                .QEN(),
                .QF(s_logisimBus6[10]),
                .QFN(s_logisimBus33[10]),
                .QG(s_logisimBus6[9]),
                .QGN(s_logisimBus33[9]),
                .QH(s_logisimBus6[8]),
                .QHN());

   L4   PCR_LO (.A(s_logisimBus7[7]),
                .B(s_logisimBus7[2]),
                .C(s_logisimBus7[1]),
                .D(s_logisimBus7[0]),
                .L(s_logisimNet0),
                .QA(s_logisimBus6[7]),
                .QAN(),
                .QB(s_logisimBus6[2]),
                .QBN(),
                .QC(s_logisimBus6[1]),
                .QCN(),
                .QD(s_logisimBus6[0]),
                .QDN());

endmodule
