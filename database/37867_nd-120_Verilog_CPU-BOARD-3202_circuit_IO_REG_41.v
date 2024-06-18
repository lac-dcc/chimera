// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** IO/REG                                                                **
** IOC, ALD & INR REGS                                                   **
** SHEET 41 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/
module IO_REG_41(

   // Input signals
   input       CLEAR_n,
   input       CX_n,
   input       DA_n,
   input [7:0] INR_7_0,
   input       RINR_n,
   input       SIOC_n,
   input       TBMT_n,
   input       TRAALD_n,


   // Input and output signals
   input  [15:0] IDB_15_0_IN,
   output [15:0] IDB_15_0_OUT,

   // Output signals
   output        BINT10_n,
   output        BINT12_n,
   output        BINT13_n,
   output        CONSOLE_n,
   output        EMCL_n,
   output [1:0]  IOLED // 0=RED,1=GREEN   
);


   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [4:0]  s_STRAP2;
   
   wire [7:0]  s_logisimBus59;
   wire [2:0]  s_PRINT_NO;
   wire [3:0]  s_ALD;

   wire [7:0]  s_INR_7_0;

   wire [15:0] s_IDB_15_0_in;
   wire [15:0] s_IDB_15_0_out;
   wire [7:0]  s_IDB_7_0_inr_out;
   wire [7:0]  s_IDB_7_0_ald_out;


   wire s_traald_n;

   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_RINR_n;
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
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet41;
   wire        s_logisimNet42;
   wire        s_logisimNet43;
   wire        s_logisimNet44;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet47;
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
   wire        s_logisimNet6;
   wire        s_DA_n;
   wire        s_DA;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet67;
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
   wire        s_logisimNet79;
   wire        s_logisimNet80;
   wire        s_logisimNet81;
   wire        s_logisimNet82;
   wire        s_logisimNet83;
   wire        s_logisimNet84;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_INR_7_0[7:0]      = INR_7_0;
   assign s_RINR_n            = RINR_n;
   assign s_logisimNet33      = SIOC_n;
   assign s_logisimNet41      = CX_n;
   assign s_logisimNet44      = TBMT_n;
   assign s_logisimNet45      = CLEAR_n;
   assign s_DA_n              = DA_n;
   assign s_traald_n          = TRAALD_n;
   assign s_IDB_15_0_in       = IDB_15_0_IN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BINT10_n      = s_logisimNet17;
   assign BINT12_n      = s_logisimNet63;
   assign BINT13_n      = s_logisimNet50;
   assign CONSOLE_n     = s_logisimNet77;
   assign EMCL_n        = s_logisimNet34;
   assign IDB_15_0_OUT  = s_IDB_15_0_out[15:0];
   

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_logisimNet12  =  1'b0;


   // Power
   assign  s_logisimNet10  =  1'b1;


   // Power
   assign  s_logisimNet39  =  1'b1;




   // Constant- ALD Regirster PCB
   assign  s_PRINT_NO[2:0]  =  3'b101; // 101 == 3202D


   // Constant for ALD register ECO Fixes
   assign  s_STRAP2[4:0]  =  {5'b00000};  // STRAP9-STRAP5 (high bit is STRAP9, low bit is STRAP5)


   // Constant for ALD settings. ALD boot switch
   assign  s_ALD[3:0]  =  4'hF;


   // Power

   // NOT Gate
   assign s_DA = ~s_DA_n;

   // NOT Gate
   assign s_logisimNet20 = ~s_logisimNet2;

   // LED: RED
   assign IOLED[0] = s_logisimNet34;

   // LED: GREEN
   assign IOLED[1] = s_logisimNet16;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet2),
               .input2(s_logisimNet19),
               .result(s_logisimNet18));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet9),
               .input2(s_logisimNet42),
               .result(s_logisimNet50));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet1),
               .input2(s_logisimNet44),
               .result(s_logisimNet17));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet18),
               .input2(s_DA),
               .result(s_logisimNet63));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet20),
               .input2(s_logisimNet20),
               .result(s_logisimNet77));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

/*
   TTL_74273   CHIP_28A_IOC (.CLK(s_logisimNet33),
                             .CLR_n(s_logisimNet45),
                             .D1(s_IDB_15_0_in[7]),
                             .D2(s_IDB_15_0_in[6]),
                             .D3(s_IDB_15_0_in[5]),
                             .D4(s_IDB_15_0_in[4]),
                             .D5(s_IDB_15_0_in[3]),
                             .D6(s_IDB_15_0_in[2]),
                             .D7(s_IDB_15_0_in[1]),
                             .D8(s_IDB_15_0_in[0]),
                             .Q1(s_logisimNet49),
                             .Q2(s_logisimNet2),
                             .Q3(s_logisimNet34),
                             .Q4(s_logisimNet16),
                             .Q5(s_logisimNet9),
                             .Q6(s_logisimNet1),
                             .Q7(s_logisimNet19),
                             .Q8(s_logisimNet42));
*/

TTL_74273 CHIP_28A_IOC (
    .CLK(s_logisimNet33),           // Clock input
    .CLR_n(s_logisimNet45),         // Active low clear input
    .D(s_IDB_15_0_in[7:0]),         // 8-bit data input directly from the bus
    .Q({s_logisimNet42,             // 8-bit output, bit 7 (Q8 - Corresponding to D8/MSB)
        s_logisimNet19,             // 8-bit output, bit 6 (Q7)
        s_logisimNet1,              // 8-bit output, bit 5 (Q6)
        s_logisimNet9,              // 8-bit output, bit 4 (Q5)
        s_logisimNet16,             // 8-bit output, bit 3 (Q4)
        s_logisimNet34,             // 8-bit output, bit 2 (Q3)
        s_logisimNet2,              // 8-bit output, bit 1 (Q2)
        s_logisimNet49})            // 8-bit output, bit 0 (Q1 - Corresponding to D1/LSB)
);



      // TTL_74244 CHIP_24A_INR (simplified..)
      assign s_IDB_7_0_inr_out[7:0] = s_RINR_n  ? 8'b0 : s_INR_7_0[7:0]; 

      // IDB bus 7:0 is shared between ALD and INR.. or Z state
      assign s_IDB_15_0_out[7:0] = !s_traald_n ?  s_IDB_7_0_ald_out [7:0] :  s_IDB_7_0_inr_out[7:0]; // if TRAALD_n is low, then the IDB[7:0] is driven by ALD if not its driven by INR

/*
      TTL_74244   CHIP_27A_STRAP (.I0_1A1(s_logisimBus60[2]),
                               .I1_1A2(s_logisimBus60[1]),
                               .I2_1A3(s_logisimBus60[0]),
                               .I3_1A4(s_logisimBus11[0]),
                               .I4_2A1(s_logisimBus11[1]),
                               .I5_2A2(s_logisimBus11[2]),
                               .I6_2A3(s_logisimBus11[3]),
                               .I7_2A4(s_logisimBus11[4]),
                               .O0_1Y1(s_IDB_15_0_in[15]),
                               .O1_1Y2(s_IDB_15_0_in[14]),
                               .O2_1Y3(s_IDB_15_0_in[13]),
                               .O3_1Y4(s_IDB_15_0_in[12]),
                               .O4_2Y1(s_IDB_15_0_in[11]),
                               .O5_2Y2(s_IDB_15_0_in[10]),
                               .O6_2Y3(s_IDB_15_0_in[9]),
                               .O7_2Y4(s_IDB_15_0_in[8]),
                               .OE1_1G_n(),
                               .OE2_2G_n(s_logisimNet7));
*/

  TTL_74244   CHIP_27A_STRAP (
               // Input 

               //        1A4                1A3                  1A2                  1A1 
                .A1({s_STRAP2[0], s_PRINT_NO[0],s_PRINT_NO[1], s_PRINT_NO[2]}), // Mapping 4 separate signals to 1A4-1A1
                .G1_n(s_logisimNet7),

                //        2A4                2A3                  2A2                  2A1 
                .A2(s_STRAP2[4:1]),   // Mapping 4 separate signals to 2A4-2A1
                .G2_n(s_logisimNet7),


               // Output
               .Y1({s_IDB_15_0_in[12], s_IDB_15_0_in[13], s_IDB_15_0_in[14], s_IDB_15_0_in[15]}), // Mapping 4 separate signals to 1Y4-1Y1
               .Y2({s_IDB_15_0_in[8], s_IDB_15_0_in[9], s_IDB_15_0_in[10], s_IDB_15_0_in[11]}) // Mapping 4 separate signals to 1Y4-1Y1
   );

   




/*
   TTL_74244   CHIP_25A_ALD (.I0_1A1(s_logisimNet41),
                             .I1_1A2(s_logisimNet12),
                             .I2_1A3(s_logisimNet10),
                             .I3_1A4(s_logisimNet39),
                             .I4_2A1(s_ALD[3]),
                             .I5_2A2(s_ALD[2]),
                             .I6_2A3(s_ALD[1]),
                             .I7_2A4(s_ALD[0]),
                             .O0_1Y1(s_IDB_15_0_in[7]),
                             .O1_1Y2(s_IDB_15_0_in[6]),
                             .O2_1Y3(s_IDB_15_0_in[5]),
                             .O3_1Y4(s_IDB_15_0_in[4]),
                             .O4_2Y1(s_IDB_15_0_in[3]),
                             .O5_2Y2(s_IDB_15_0_in[2]),
                             .O6_2Y3(s_IDB_15_0_in[1]),
                             .O7_2Y4(s_IDB_15_0_in[0]),
                             .OE1_1G_n(s_logisimNet7),
                             .OE2_2G_n(s_logisimNet7));

*/

TTL_74244 CHIP_25A_ALD (
    .A1({s_logisimNet39,     // I3_1A4 mapped to 1A4 (high bit)
         s_logisimNet10,     // I2_1A3 mapped to 1A3
         s_logisimNet12,     // I1_1A2 mapped to 1A2
         s_logisimNet41}),   // I0_1A1 mapped to 1A1 (low bit)
    .G1_n(s_logisimNet7),    // OE1_1G_n mapped to G1_n
    .Y1({s_IDB_7_0_ald_out[4],      // O3_1Y4 mapped from 1Y4 (high bit)
         s_IDB_7_0_ald_out[5],      // O2_1Y3 mapped from 1Y3
         s_IDB_7_0_ald_out[6],      // O1_1Y2 mapped from 1Y2
         s_IDB_7_0_ald_out[7]}),    // O0_1Y1 mapped from 1Y1 (low bit)
    .A2({s_ALD[0],           // I7_2A4 mapped to 2A4 (high bit)
         s_ALD[1],           // I6_2A3 mapped to 2A3
         s_ALD[2],           // I5_2A2 mapped to 2A2
         s_ALD[3]}),         // I4_2A1 mapped to 2A1 (low bit)
    .G2_n(s_logisimNet7),    // OE2_2G_n mapped to G2_n
    .Y2({s_IDB_7_0_ald_out[0],      // O7_2Y4 mapped from 2Y4 (high bit)
         s_IDB_7_0_ald_out[1],      // O6_2Y3 mapped from 2Y3
         s_IDB_7_0_ald_out[2],      // O5_2Y2 mapped from 2Y2
         s_IDB_7_0_ald_out[3]})     // O4_2Y1 mapped from 2Y1 (low bit)
);


endmodule
