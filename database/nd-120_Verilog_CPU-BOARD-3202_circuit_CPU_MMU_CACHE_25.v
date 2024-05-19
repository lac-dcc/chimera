// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/MMU/CACHE                                                         **
** PPN TO IDB                                                            **
** SHEET 25 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **
***************************************************************************/


module CPU_MMU_CACHE_25( 

   input sysclk, // System clock in FPGA
   input sys_rst_n, // System reset in FPGA

   input        BRK_n,
   input [10:0] CA_10_0,
   input        CCLR_n,
   input        CWR,
   input        CYD,
   input        DT_n,
   input        ECD_n,
   input        FMISS,
   input [1:0]  HIT_1_0_n,
   input        LSHADOW,
   input        PD2,
   input        RT_n,
   input        SW1_CONSOLE,
   input        UCLK,
   input        WCINH_n,

   input  [15:0] CD_15_0_IN,
   output [15:0] CD_15_0_OUT,

   input [13:0] CPN_23_10_IN,
   output [13:0] CPN_23_10_OUT,

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   
   output        CON,
   output        CON_n,   
   output        HIT,
   output        WCA_n,

   output        LED1 //LED 1, RED. Controlld by SW1. When LED is on, CON is 0. and CON_n is 1.
);




   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_cd_15_0_out;
   wire [10:0] s_ca_10_0;
   wire [1:0]  s_hit_1_0_n;
   wire        s_wca_n;
   wire        s_led1;
   wire        s_brk_n;
   wire        s_wcinh_n;
   wire        s_used_n;
   wire        s_con;
   wire        s_con_n;
   wire        s_cclr_n;
   wire        s_oubi;
   wire        s_hit;
   wire        s_dt_n;
   wire        s_lshadow;
   wire        s_cyd;
   wire        s_cwr;
   wire        s_oubd;
   wire        s_uclk;
   wire        s_rt_n;
   wire        s_pd2;
   wire        s_fmiss;
   wire        s_ecd_n;
   wire        s_ewc_n;
   wire        s_gnd;


   wire [15:0] s_CPN_25_10_OUT;
   wire [3:0]  s_21f_in;
   wire [3:0]  s_21f_out;


   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_ca_10_0         = CA_10_0;
   assign s_hit_1_0_n[1:0]  = HIT_1_0_n;
   assign s_con             = SW1_CONSOLE;
   assign s_brk_n           = BRK_n;
   assign s_wcinh_n         = WCINH_n;
   assign s_cclr_n          = CCLR_n;
   assign s_dt_n            = DT_n;
   assign s_lshadow         = LSHADOW;
   assign s_cyd             = CYD;
   assign s_cwr             = CWR;
   assign s_uclk            = UCLK;
   assign s_rt_n            = RT_n;
   assign s_pd2             = PD2;
   assign s_fmiss           = FMISS;
   assign s_ecd_n           = ECD_n;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign CD_15_0_OUT   = s_cd_15_0_out[15:0];
   assign CON          = s_con;
   assign CON_n        = s_con_n;   
   assign HIT          = s_hit;
   assign WCA_n        = s_wca_n;

   assign CPN_23_10_OUT = s_CPN_25_10_OUT[13:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign s_gnd     =  1'b0;
   assign s_con_n   = ~s_con;
   assign LED1      = s_con_n; // Led1 cathode is connected to CON signal, and ANODE to VCC, so a low on s_CON will give light in LED1

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   /*
   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_1 (.input1(s_brk_n),
               .input2(s_con),
               .input3(s_wcinh_n),
               .result(s_ewc_n));
   */

   assign s_ewc_n = ~(s_brk_n & s_con & s_wcinh_n);

   /*
   AND_GATE_5_INPUTS #(.BubblesMask({1'b1, 4'hF}))
      GATES_2 (.input1(s_used_n),
               .input2(s_hit_1_0_n[1]),
               .input3(s_hit_1_0_n[0]),
               .input4(s_cwr),
               .input5(s_gnd), //GND
               .result(s_hit));
   */

   assign s_hit = !s_used_n & !s_hit_1_0_n[0] & !s_hit_1_0_n[1] & !s_cwr;
   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   TMM2018D_25   CHIP_23F (
                           .clk(sysclk),           // Clock input (BLOCK RAM MUST HAVE CLOCK)
                           .reset_n(sys_rst_n),    // FPGA Reset input (active low)
                           .ADDRESS(s_ca_10_0[10:0]),
                           .CS_n(s_ecd_n),
                           .D(CD_15_0_IN[15:8]),
                           .D_OUT(s_cd_15_0_out[15:8]),
                           .OE_n(s_gnd),
                           .W_n(s_wca_n));

   TMM2018D_25   CHIP_24F (
                           .clk(sysclk),           // Clock input (BLOCK RAM MUST HAVE CLOCK)
                           .reset_n(sys_rst_n),    // FPGA Reset input (active low)
                           .ADDRESS(s_ca_10_0[10:0]),
                           .CS_n(s_ecd_n),
                           .D(CD_15_0_IN[7:0]),
                           .D_OUT(s_cd_15_0_out[7:0]),
                           .OE_n(s_gnd),
                           .W_n(s_wca_n));

   PAL_44402D   PAL_44402_UBITS(  // PAL16R4D
                                .CLK(s_uclk),
                                .OE_n(s_pd2),

                                .DT_n(s_dt_n),
                                .RT_n(s_rt_n),
                                .LSHADOW(s_lshadow),
                                .FMISS(s_fmiss),
                                .CYD(s_cyd),
                                .HIT0_n(s_hit_1_0_n[0]),
                                .HIT1_n(s_hit_1_0_n[1]),
                                .EWC_n(s_ewc_n),

                                .USED_n(s_used_n),
                                .WCA_n(s_wca_n),
                                .OUBI(s_21f_out[0]), 
                                .OUBD(s_21f_out[1]), 
                                
                                
                                .NUBI_n(s_21f_in[0]),  
                                .NUBD_n(s_21f_in[1]),
                                
                                             //.Q2_n(), // Not connected
                                .IHIT_n()    //.Q3_n(s_ihit) // IHIT_n not connected 
                        );

   Am9150       CHIP_21F (
                         .clk(sysclk),           // Clock input (BLOCK RAM MUST HAVE CLOCK)    
                         .address(s_ca_10_0[9:0]),
                         .data_in(s_21f_in),
                         .OUTPUT_ENABLE_n(s_gnd),
                         .data_out(s_21f_out),
                         .RESET_n(s_cclr_n),
                         .CHIP_SELECT_n(s_gnd),
                         .WRITE_ENABLE_n(s_wca_n));

   TMM2018D_25   CHIP_16F (
                           .clk(sysclk),           // Clock input (BLOCK RAM MUST HAVE CLOCK)
                           .reset_n(sys_rst_n),    // FPGA Reset input (active low)
                           .ADDRESS(s_ca_10_0[10:0]),
                           .CS_n(s_pd2),
                           .D({2'b00, CPN_23_10_IN[13:8]}), // bit D0 and D1 is not connected (we need only 6 bits) for CPN 23-18
                           .D_OUT(s_CPN_25_10_OUT[15:8]),
                           .OE_n(s_gnd),
                           .W_n(s_wca_n));

   TMM2018D_25   CHIP_20F (
                           .clk(sysclk),           // Clock input (BLOCK RAM MUST HAVE CLOCK)
                           .reset_n(sys_rst_n),    // FPGA Reset input (active low)
                           .ADDRESS(s_ca_10_0[10:0]),
                           .CS_n(s_pd2),
                           .D(CPN_23_10_IN[7:0]),
                           .D_OUT(s_CPN_25_10_OUT[7:0]),  // CPN 17-10
                           .OE_n(s_gnd),
                           .W_n(s_wca_n));

endmodule
