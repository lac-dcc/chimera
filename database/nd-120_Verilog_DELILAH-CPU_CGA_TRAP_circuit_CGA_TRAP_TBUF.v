// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_TRAP_TBUF                                                **
 **                                                                          **
 *****************************************************************************/

module CGA_TRAP_TBUF( FETCHN,
                      IFETCH,
                      IFETCHN,
                      IIND,
                      IINDN,
                      INDN,
                      INTRQ,
                      INTRQN,
                      IPCR_1_0,
                      IPCR_1_0_N,
                      IPT_15_9,
                      IPT_15_9_N,
                      IWRITE,
                      IWRITEN,
                      PAN,
                      PANN,
                      PCR_1_0,
                      PT_15_9,
                      VACC,
                      VACCN,
                      WRITEN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       FETCHN;
   input       INDN;
   input       INTRQN;
   input       PANN;
   input [1:0] PCR_1_0;
   input [6:0] PT_15_9;
   input       VACCN;
   input       WRITEN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output       IFETCH;
   output       IFETCHN;
   output       IIND;
   output       IINDN;
   output       INTRQ;
   output [1:0] IPCR_1_0;
   output [1:0] IPCR_1_0_N;
   output [6:0] IPT_15_9;
   output [6:0] IPT_15_9_N;
   output       IWRITE;
   output       IWRITEN;
   output       PAN;
   output       VACC;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [1:0] s_logisimBus12;
   wire [6:0] s_logisimBus26;
   wire [6:0] s_logisimBus32;
   wire [1:0] s_logisimBus37;
   wire [1:0] s_logisimBus38;
   wire [6:0] s_logisimBus39;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
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
   wire       s_logisimNet27;
   wire       s_logisimNet28;
   wire       s_logisimNet29;
   wire       s_logisimNet3;
   wire       s_logisimNet30;
   wire       s_logisimNet31;
   wire       s_logisimNet33;
   wire       s_logisimNet34;
   wire       s_logisimNet35;
   wire       s_logisimNet36;
   wire       s_logisimNet4;
   wire       s_logisimNet40;
   wire       s_logisimNet41;
   wire       s_logisimNet42;
   wire       s_logisimNet43;
   wire       s_logisimNet44;
   wire       s_logisimNet5;
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
   assign s_logisimBus38[1:0] = PCR_1_0;
   assign s_logisimBus39[6:0] = PT_15_9;
   assign s_logisimNet33      = PANN;
   assign s_logisimNet34      = VACCN;
   assign s_logisimNet35      = INDN;
   assign s_logisimNet4       = INTRQN;
   assign s_logisimNet5       = FETCHN;
   assign s_logisimNet6       = WRITEN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign IFETCH     = s_logisimNet16;
   assign IFETCHN    = s_logisimNet24;
   assign IIND       = s_logisimNet3;
   assign IINDN      = s_logisimNet43;
   assign INTRQ      = s_logisimNet2;
   assign IPCR_1_0   = s_logisimBus12[1:0];
   assign IPCR_1_0_N = s_logisimBus37[1:0];
   assign IPT_15_9   = s_logisimBus26[6:0];
   assign IPT_15_9_N = s_logisimBus32[6:0];
   assign IWRITE     = s_logisimNet17;
   assign IWRITEN    = s_logisimNet25;
   assign PAN        = s_logisimNet27;
   assign VACC       = s_logisimNet28;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimBus37[1] = ~s_logisimBus38[1];

   // NOT Gate
   assign s_logisimNet2 = ~s_logisimNet4;

   // NOT Gate
   assign s_logisimNet27 = ~s_logisimNet33;

   // NOT Gate
   assign s_logisimNet28 = ~s_logisimNet34;

   // NOT Gate
   assign s_logisimNet16 = ~s_logisimNet5;

   // NOT Gate
   assign s_logisimNet17 = ~s_logisimNet6;

   // NOT Gate
   assign s_logisimNet3 = ~s_logisimNet35;

   // NOT Gate
   assign s_logisimBus32[3] = ~s_logisimBus39[3];

   // NOT Gate
   assign s_logisimBus32[0] = ~s_logisimBus39[0];

   // NOT Gate
   assign s_logisimBus32[6] = ~s_logisimBus39[6];

   // NOT Gate
   assign s_logisimBus12[1] = ~s_logisimBus37[1];

   // NOT Gate
   assign s_logisimNet43 = ~s_logisimNet3;

   // NOT Gate
   assign s_logisimBus26[6] = ~s_logisimBus32[6];

   // NOT Gate
   assign s_logisimBus32[2] = ~s_logisimBus39[2];

   // NOT Gate
   assign s_logisimBus26[0] = ~s_logisimBus32[0];

   // NOT Gate
   assign s_logisimNet24 = ~s_logisimNet16;

   // NOT Gate
   assign s_logisimNet25 = ~s_logisimNet17;

   // NOT Gate
   assign s_logisimBus37[0] = ~s_logisimBus38[0];

   // NOT Gate
   assign s_logisimBus32[5] = ~s_logisimBus39[5];

   // NOT Gate
   assign s_logisimBus12[0] = ~s_logisimBus37[0];

   // NOT Gate
   assign s_logisimBus32[4] = ~s_logisimBus39[4];

   // NOT Gate
   assign s_logisimBus32[1] = ~s_logisimBus39[1];

   // NOT Gate
   assign s_logisimBus26[4] = ~s_logisimBus32[4];

   // NOT Gate
   assign s_logisimBus26[1] = ~s_logisimBus32[1];

endmodule
