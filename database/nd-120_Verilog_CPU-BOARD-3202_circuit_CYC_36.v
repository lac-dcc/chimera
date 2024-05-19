// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CYC                                                                   **
** CYCLE CONTROL                                                         **
** SHEET 36 of 50                                                        **
**                                                                       ** 
** Last reviewed: 13-JAN-2024                                            **
** Ronny Hansen                                                          **               
***************************************************************************/
 

module CYC_36( 
/* verilator lint_off UNUSEDSIGNAL */   
               input sysclk, // System clock in FPGA
               input sys_rst_n, // System reset in FPGA
/* verilator lint_on UNUSEDSIGNAL */              

               input OSC,

               input ACOND_n,               
               input BRK_n,
               input CGNTCACT_n,               
               input CSALUI7,
               input CSALUI8,
               input CSALUM0,
               input CSALUM1,
               input [1:0] CSDELAY_1_0,               
               input CSDLY,
               input CSECOND,
               input CSLOOP,
               input FORM_n,
               input HIT,
               input IORQ_n,
               input LBA0,
               input LBA1,
               input LBA3,               
               input LSHADOW,
               input LUA12,
               input MREQ_n,
               input MR_n,               
               input PD1,
               input PD4,
               input RRF_n,
               input RT_n,
               input RWCS_n,
               input SHORT_n,
               input SLOW_n,               
               input TRAP_n,               
               input VEX,

               // Outputs
               output ALUCLK,               
               output CLK,               
               output MACLK,
               output MCLK,
               output UCLK,
               output WRFSTB,
               output CYD,
               output [2:0]  CC_3_1_n,
               output TERM_n,
               output MAP_n,
               output CX_n,
               output EORF_n,
               output ETRAP_n,
               output LCS_n               
);

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus33;   
   wire       s_PD4;
   wire       s_lua12;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   // wire       s_DLSHADOW; // not used ??
   wire       s_logisimNet16;
   wire       s_mr_n;   
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;   
   wire       s_logisimNet22;
   wire       s_CLK;   
   wire       s_FORM_n;
   wire       s_logisimNet26;
   wire       s_logisimNet27;   
   wire       s_lcs_n;
   //wire       s_MDLY_n;//(not used)
   wire       s_mclk_n;
   wire       s_vcc;
   wire       s_MAP_n;
   // wire       s_DMA12_n; (not used)
   wire       s_logisimNet36;
   
   wire       s_logisimNet38;
   wire       s_logisimNet39;
   // wire       S_DMAP_n; (not used)
   wire       s_PD1;
   //wire       s_logisimNet41;
   wire       s_SLCOND_n;
   wire       s_lcs;
   wire       s_logisimNet43;
   wire       s_logisimNet44;
   wire       s_logisimNet45;
   wire       s_logisimNet46;
   wire       s_logisimNet47;
   wire       s_logisimNet48;
   wire       s_logisimNet49;
   wire       s_TERM_n;
   wire       s_dly0_n;   
   wire       c_csdly;
   wire       s_logisimNet53;   
   wire [1:0] s_csdelay_1_0;
   wire       s_logisimNet55;
   wire       s_logisimNet56;
   wire       s_logisimNet57;
   // wire       s_NOWRITE_n; (not used)
   wire       s_logisimNet59;
   wire       s_logisimNet6;   
   wire       s_SLOW_n;
   wire       s_SHORT_n;
   wire       s_LSHADOW;
   wire       s_logisimNet63;
   wire       s_OSC;
   wire       s_logisimNet65;
   wire       s_logisimNet66;
   wire       s_logisimNet67;
   wire       s_logisimNet69;
   wire       s_logisimNet7;
   wire       s_logisimNet70;
   wire       s_logisimNet71;
   wire       s_RRF_n;
   wire       s_csecond;
   wire       s_acond_n;

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_PD4          = PD4;
   assign s_lua12        = LUA12;
   assign s_logisimNet11 = CSALUM1;
   assign s_logisimNet12 = CSALUI8;
   assign s_logisimNet13 = LBA3;
   assign s_logisimNet14 = LBA0;
   assign s_mr_n         = MR_n;   
   assign s_FORM_n       = FORM_n;
   assign s_logisimNet26 = RWCS_n;
   assign s_logisimNet27 = VEX;
   assign s_logisimNet38 = IORQ_n;
   assign s_logisimNet39 = RT_n;
   assign s_PD1          = PD1;
   assign s_logisimNet43 = HIT;
   assign s_logisimNet46 = MREQ_n;
   assign c_csdly        = CSDLY;
   assign s_logisimNet53 = CSLOOP;   
   assign s_csdelay_1_0[1:0]  = CSDELAY_1_0[1:0];
   assign s_logisimNet55 = CSALUM0;
   assign s_logisimNet56 = CSALUI7;
   assign s_logisimNet57 = LBA1;
   assign s_logisimNet59 = TRAP_n;
   assign s_logisimNet6  = BRK_n;   
   assign s_SLOW_n       = SLOW_n;   
   assign s_LSHADOW      = LSHADOW;
   assign s_OSC          = OSC;
   assign s_logisimNet65 = CGNTCACT_n;   
   assign s_SHORT_n      = SHORT_n;   
   assign s_RRF_n        = RRF_n;
   assign s_csecond      = CSECOND;
   assign s_acond_n      = ACOND_n;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ALUCLK   = s_logisimNet2;
   assign CC_3_1_n = s_logisimBus33[2:0];
   assign CLK      = s_CLK;
   assign CX_n     = s_logisimNet19;
   assign CYD      = s_logisimNet47;
   assign EORF_n   = s_logisimNet70;
   assign ETRAP_n  = s_logisimNet71;
   assign LCS_n    = s_lcs_n;
   assign MACLK    = s_logisimNet45;
   assign MAP_n    = s_MAP_n;
   assign MCLK     = s_logisimNet66;
   assign TERM_n   = s_TERM_n;
   assign UCLK     = s_logisimNet22;
   assign WRFSTB   = s_logisimNet69;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power
   assign  s_vcc  =  1'b1;


   // NOT Gate
   assign s_lcs = ~s_lcs_n;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   /*
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_mr_n),
               .input2(s_logisimNet63),
               .result(s_logisimNet36));
   */
   
   assign s_logisimNet36 = (s_mr_n & s_logisimNet63);

   /*
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_vcc),
               .input2(s_TERM_n),
               .result(s_CLK));
   */
   assign s_CLK = ~(s_vcc & s_TERM_n); // CAN be optimized to an negator

   /*
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_TERM_n),
               .input2(s_mclk_n),
               .result(s_logisimNet66));
   */
   assign s_logisimNet66 = ~(s_TERM_n & s_mclk_n); 

   /*
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_TERM_n),
               .input2(s_logisimNet20),
               .result(s_logisimNet45));
   */
   assign s_logisimNet45 = ~(s_TERM_n & s_logisimNet20);

   /*
   AND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_TERM_n),
               .input2(s_logisimNet44),
               .result(s_logisimNet22));

   */
   assign s_logisimNet22 = (s_TERM_n & s_logisimNet44);
   
   /*
   NOR_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_TERM_n),
               .input2(s_lcs),
               .result(s_logisimNet2));
   */
   assign s_logisimNet2 = ~(s_TERM_n | s_lcs);

   /*
   OR_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_LSHADOW),
               .input2(s_logisimNet39),
               .result(s_logisimNet67));
   */

   assign s_logisimNet67 = (s_LSHADOW | s_logisimNet39);

   /*
   OR_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet46),
               .input2(s_LSHADOW),
               .result(s_logisimNet48));
   */
   assign s_logisimNet48 = (s_logisimNet46 | s_LSHADOW);


   /*
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimNet48),
               .input2(s_logisimNet38),
               .result(s_logisimNet63));
   */
   assign s_logisimNet63 = ~(s_logisimNet48 & s_logisimNet38);

   /*
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimNet38),
                .input2(s_logisimNet67),
                .result(s_logisimNet49));

   */
   assign s_logisimNet49 = ~(s_logisimNet38 & s_logisimNet67);

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   PAL_44601B   PAL_44601_UCYCFSM (
                                  .CK(s_OSC),                 //CK
                                  .OE_n(s_PD4),               //OE_n

                                 //I0-I7
                                  .DLY1_n(s_logisimNet16),     //I0
                                  .DLY0_n(s_dly0_n),           //I1
                                  .CSDELAY0(s_csdelay_1_0[0]), //I2   
                                  .WAIT1(s_logisimNet36),      //I3
                                  .WAIT2(s_logisimNet49),      //I4
                                  .CGNTCACT_n(s_logisimNet65), //I5
                                  .HIT(s_logisimNet43),        //I6
                                  .BRK_n(s_logisimNet6),       //I7

                                 // B0-B1
                                  .SLOW_n(s_SLOW_n),           //B0
                                  .SHORT_n(s_SHORT_n),         //B1
                                  
                                  //Q0-Q5 (clocked and 3-state)
                                  .CX_n(s_logisimNet19),       //Q0
                                  .TERM_n(s_TERM_n),           //Q1
                                  .CC0_n(s_logisimNet7),       //Q2
                                  .CC1_n(s_logisimBus33[0]),   //Q3
                                  .CC2_n(s_logisimBus33[1]),   //Q4
                                  .CC3_n(s_logisimBus33[2])    //Q5                                  
                                  );

   PAL_44307C   PAL_44307_UCYCLK (
                                   .TERM_n(s_TERM_n),          // I0
                                   .CC0_n(s_logisimNet7),      // I1
                                   .CC1_n(s_logisimBus33[0]),  // I2
                                   .CC2_n(s_logisimBus33[1]),  // I3
                                   .CC3_n(s_logisimBus33[2]),  // I4
                                   .FORM_n(s_FORM_n),          // I5     
                                   .BRK_n(s_logisimNet6),      // I6
                                   .RWCS_n(s_logisimNet26),    // I7
                                   .TRAP_n(s_logisimNet59),    // I8
                                   .VEX(s_logisimNet27),       // I9
                                   .MCLK_n(s_mclk_n),          // Y0_n
                                   .MACLK_n(s_logisimNet20),   // Y1_n
                                   .WRFSTB(s_logisimNet69),    // B0_n
                                   .CYD(s_logisimNet47),       // B1_n
                                   .EORF_n(s_logisimNet70),    // B2_n
                                   .UCLK(s_logisimNet44),      // B3_n
                                   .ETRAP_n(s_logisimNet71),   // B4_n
                                   .MAP_n(s_MAP_n)             // B5_n
                                   );  

 /* verilator lint_off PINMISSING */
   PAL_44403C   PAL_44403_UCYIN0 (
                                 .CLK(s_CLK),                  //CK
                                 .OE_n(s_PD1),                 //OE_n

                                 
                                 .CSDELAY0(s_csdelay_1_0[0]),  //I0
                                 .CSDLY(c_csdly),              //I1
                                 .CSECOND(s_csecond),          //I2
                                 .CSLOOP(s_logisimNet53),      //I3
                                 .ACOND_n(s_acond_n),          //I4   
                                 .MR_n(s_mr_n),                //I5
                                 .LUA12(s_lua12),              //I6
                                 .MAP_n(s_MAP_n),              //I7

                                 //Q0-Q3 (clocked and 3-state)
                                 .LCS_n(s_lcs_n),              //Q0_n
                                 //.MDLY_n(s_MDLY_n),          //Q1_n  (not used)
                                 //.DMA12_n(s_DMA12_n),        //Q2_n  (not used)
                                 //.DMA12_n(),                 //Q2_n  (not used)
                                 //.DMAP_n(s_DMAP_n),          //Q3_n  (not used)

                                 .DLY0_n(s_dly0_n),            //B0_n
                                 .SLCOND_n(s_SLCOND_n)         //B2_n

                                 );

   PAL_44404C   PAL_44404_UCYIN1 (.CLK(s_CLK),                 //CK
                                  .OE_n(s_PD1),                //OE_n
                                                               
                                 .CSDELAY1(s_csdelay_1_0[1]),  //I0
                                 .CSALUM1(s_logisimNet11),     //I1
                                 .CSALUM0(s_logisimNet55),     //I2
                                 .CSALUI8(s_logisimNet12),     //I3
                                 .CSALUI7(s_logisimNet56),     //I4
                                 .LBA3(s_logisimNet13),        //I5
                                 .LBA1(s_logisimNet57),        //I6
                                 .LBA0(s_logisimNet14),        //I7
                                 
                                 //Q0-Q3 (clocked and 3-state)
                                 //.NOWRIT_n(s_NOWRITE_n),     //Q0_n (not used)
                                 //.DLSHADOW(s_DLSHADOW),      //Q1_n (not used?)

                                 .RRF_n(s_RRF_n),              // B0_n
                                 .LSHADOW(s_LSHADOW ),         // B1_n 
                                 .SLCOND_n(s_SLCOND_n),        // B2_n
                                 .DLY1_n(s_logisimNet16)       // B3_n                                 
                                 );

endmodule

