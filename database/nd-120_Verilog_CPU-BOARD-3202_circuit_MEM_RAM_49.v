// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

 /**************************************************************************
** ND120 CPU, MM&M                                                       **
** MEM/RAM                                                               **
** LOCAL RAM                                                             **
** SHEET 49 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/


// TODO: Add real memory chips, refactor DD_17_0 IN AND OUT signals.
// Or even better, refactor to use one continious RAM in FPGA chip, and use BANK bits as a way to select which bank to use.
// Alternative: Use BLOCK ram to give 64KB/128KB - enough to run test code.

module MEM_RAM_49( 

   // Input signals
   input sysclk,     // System clock in FPGA
   input sys_rst_n,  // System reset in FPGA

   input [9:0] AA_9_0,
   input       BANK0,
   input       BANK1,
   input       BANK2,

   input       CAS,   
   input       RAS,

   input       MWRITE50_n,

   // IN and OUT signals
   input  [17:0] DD_17_0_IN,
   output [17:0] DD_17_0_OUT,

   // Output signals
   output        CORR_n
);


   

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   
   wire [9:0]  s_address;
   wire        s_ras;
   wire        s_cas;
   wire        s_mwrite50_n;
   wire [17:0] s_dd_17_0_in; // common input signals
 

   // output
   wire [17:0] s_dd_17_0_out;     // shared output signal depending on bank
   wire [17:0] s_dd_17_0_parity; // parity signals (calculation across all banks)
   wire        s_corr;

   // BANK0   
   wire [17:0] s_dd_17_0_b0_out; // DD out from bank 0
   wire        s_bank0; 
   wire        s_ras_b0;  
   wire        s_cas_b0;
   
   
   wire        prd_n_b0l;
   wire        prd_n_b0h;
   
   wire        d9_b0l;
   wire        d9_b0h;
   
   wire        q9_b0l;
   wire        q9_b0h;

   // BANK1
   wire [17:0] s_dd_17_0_b1_out; // DD out from bank 1
   wire        s_bank1;   
   wire        s_ras_b1;
   wire        s_cas_b1;
   
   wire        prd_n_b1l;
   wire        prd_n_b1h;
      
   wire        d9_b1l;
   wire        d9_b1h;

   wire        q9_b1l;   
   wire        q9_b1h;

   // BANK2
   wire [17:0] s_dd_17_0_b2_out; // DD out from bank 2 
   wire        s_bank2;
   wire        s_ras_b2;
   wire        s_cas_b2;

   wire        prd_n_b2l;
   wire        prd_n_b2h;   
   
   wire        d9_b2l;
   wire        d9_b2h;

   wire        q9_b2l;   
   wire        q9_b2h;
   
   
   
   

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_address[9:0] = AA_9_0;

   assign s_bank0       = BANK0;
   assign s_bank2       = BANK2;
   assign s_bank1       = BANK1;

   assign s_ras         = RAS;   
   assign s_cas         = CAS;

   assign s_mwrite50_n   = MWRITE50_n;
   assign s_dd_17_0_in   = DD_17_0_IN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign CORR_n       = ~s_corr;
   assign DD_17_0_OUT  = s_dd_17_0_out[17:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/

   // or together all 3 banks
   assign s_dd_17_0_out = s_dd_17_0_b0_out | s_dd_17_0_b1_out | s_dd_17_0_b2_out | s_dd_17_0_parity;

   assign s_ras_b0 = ~(s_ras & s_bank0);
   assign s_cas_b0 = ~(s_bank0 & s_cas);


   assign s_ras_b1 = ~(s_ras & s_bank1);
   assign s_cas_b1 =  ~(s_cas & s_bank1);

   assign s_ras_b2 = ~(s_ras & s_bank2);
   assign s_cas_b2 = ~(s_bank2 & s_cas);


   // Parity calculation across all banks
   assign s_dd_17_0_parity[8] = q9_b1l;
   assign s_dd_17_0_parity[17] = q9_b1h;

   assign s_dd_17_0_parity[8] = q9_b2l;
   assign s_dd_17_0_parity[17] = q9_b2h;
  
   assign s_dd_17_0_parity[8] = q9_b0l;
   assign s_dd_17_0_parity[17] = q9_b0h;

   // Calculate CORR ? (in the doc for these RAM chips it seems this pin is not connected..)
   assign s_corr = !prd_n_b2l | !prd_n_b1l | !prd_n_b0l | !prd_n_b0h | !prd_n_b1h | !prd_n_b2h;


   // Connect input D9 to output Q9
   assign d9_b0l = q9_b0l;
   assign d9_b0h = q9_b0h;


   assign d9_b1l = q9_b1l;
   assign d9_b1h = q9_b1h;


   assign d9_b2l = q9_b2l;
   assign d9_b2h = q9_b2h;


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   // **************** BANK 9 ****************

   SIP1M9   CHIP_15H (
                     .sysclk(sysclk),
                     .sys_rst_n(sys_rst_n),  

                     .ADDRESS(s_address[9:0]),
                     .CAS9_n(s_cas_b0),
                     .CAS_n(s_cas_b0),
                     .RAS_n(s_ras_b0),

                     .D8(s_dd_17_0_in[7:0]),               
                     .Q8(s_dd_17_0_b0_out[7:0]),
                     .PRD_n(prd_n_b0l),

                     .D9(d9_b0l),
                     .Q9(q9_b0l),
                      
                     .W_n(s_mwrite50_n)
                     );

   SIP1M9   CHIP_15J (
                     .sysclk(sysclk),
                     .sys_rst_n(sys_rst_n),  

                     .ADDRESS(s_address[9:0]),
                     .CAS9_n(s_cas_b0),
                     .CAS_n(s_cas_b0),
                     .RAS_n(s_ras_b0),
                      
                     .D8(s_dd_17_0_in[16:9]),                      
                     .Q8(s_dd_17_0_b0_out[16:9]),
                     .PRD_n(prd_n_b0h),

                     .D9(d9_b0h),
                     .Q9(q9_b0h),
                      
                     .W_n(s_mwrite50_n)
                     );



   // **************** BANK 1 ****************

   SIP1M9   CHIP_15K (
                     .sysclk(sysclk),
                     .sys_rst_n(sys_rst_n),  

                     .ADDRESS(s_address[9:0]),
                     .CAS9_n(s_cas_b1),
                     .CAS_n(s_cas_b1),
                     .RAS_n(s_ras_b1),
                     
                     .D8(s_dd_17_0_in[7:0]),                     
                     .Q8(s_dd_17_0_b1_out[7:0]), 
                     .PRD_n(prd_n_b1l),

                     .D9(d9_b1l),
                     .Q9(q9_b1l),

                     .W_n(s_mwrite50_n)
                     );

   SIP1M9   CHIP_15L (
                     .sysclk(sysclk),
                     .sys_rst_n(sys_rst_n),  

                     .ADDRESS(s_address[9:0]),
                     .CAS9_n(s_cas_b1),
                     .CAS_n(s_cas_b1),                     
                     .RAS_n(s_ras_b1),

                     .D8(s_dd_17_0_in[16:9]),
                     .Q8(s_dd_17_0_b1_out[16:9]),  

                     .PRD_n(prd_n_b1h),
                     .D9(d9_b1h),
                     .Q9(q9_b1h),
                     
                     .W_n(s_mwrite50_n)
                     );

   // **************** BANK 2 ****************

   SIP1M9   CHIP_15M (
                     .sysclk(sysclk),
                     .sys_rst_n(sys_rst_n),  

                     .ADDRESS(s_address[9:0]),
                     .CAS9_n(s_cas_b2),
                     .CAS_n(s_cas_b2),
                     .RAS_n(s_ras_b2),                     

                     .D8(s_dd_17_0_in[7:0]),                     
                     .Q8(s_dd_17_0_b2_out[7:0]),

                     .PRD_n(prd_n_b2l),
                     .D9(d9_b2l),
                     .Q9(q9_b2l),                     

                     .W_n(s_mwrite50_n)
                     );
                     
   SIP1M9   CHIP_15N (
                     .sysclk(sysclk),
                     .sys_rst_n(sys_rst_n),  

                     .ADDRESS(s_address[9:0]),
                     .CAS9_n(s_cas_b2),                     
                     .CAS_n(s_cas_b2),
                     .RAS_n(s_ras_b2),                     
                     
                     .D8(s_dd_17_0_in[16:9]),                      
                     .Q8(s_dd_17_0_b2_out[16:9]),

                     .PRD_n(prd_n_b2h),
                     .D9(d9_b2h),
                     .Q9(q9_b2h),       
                                  
                     .W_n(s_mwrite50_n)
                     );



endmodule
