// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** BIF/DPATH/BDLBD                                                       **
** BIF BD TO LBD                                                         **
** SHEET 10 of 50                                                        **
**                                                                       ** 
** Last reviewed: 13-MAY-2024                                            **
** Ronny Hansen                                                          **               
***************************************************************************/
module BIF_DPATH_BDLBD_10( 
   input  [23:0] BD_23_0_n_IN,
   output [23:0] BD_23_0_n_OUT,
   
   input  [23:0] LBD_23_0_IN,
   output [23:0] LBD_23_0_OUT,
   
   input         BGNTCACT_n,
   input         BGNT_n,
   input         CLKBD,
   input         EBADR,
   input         EBD_n,
   input         WBD_n
);



   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [23:0] s_lbd_23_0_in;
   wire [23:0] s_lbd_23_0_out;
   wire [23:0] s_bd_23_0_n_in;
   wire [23:0] s_bd_23_0_n_out;

   wire        s_ebadr;
   wire        s_ebadr0;
   wire        s_ebadr1;
   wire        s_ebadr2;
   wire        s_ebadr3;
   wire        s_ebd_n;
   wire        s_wbd_n;
   wire        s_ebadr9;
   wire        s_clkbd;
   wire        s_clkbd0;
   wire        s_clkbd1;
   wire        s_clkbd2;
   wire        s_clkbd3;
   wire        s_clkbd4;
   wire        s_clkbd5;
   wire        s_clkbd6;
   wire        s_clkbd7;
   wire        s_clkbd8;
   wire        s_clkbd9;
   wire        s_bgntcact_n;
   wire        s_bgnt_n;

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_bd_23_0_n_in[23:0]   = BD_23_0_n_IN[23:0];
   assign s_lbd_23_0_in[23:0]    = LBD_23_0_IN[23:0];

   assign s_ebadr                = EBADR;
   assign s_ebd_n                = EBD_n;
   assign s_wbd_n                = WBD_n;
   assign s_clkbd                = CLKBD;
   assign s_bgntcact_n           = BGNTCACT_n;
   assign s_bgnt_n               = BGNT_n;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign LBD_23_0_OUT           = s_lbd_23_0_out[23:0];
   assign BD_23_0_n_OUT          = s_bd_23_0_n_out[23:0];

  
   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   TTL_74648   CHIP_4A 
   (
      .A_IN(s_bd_23_0_n_in[23:16]),
      .A_OUT_n(s_bd_23_0_n_out[23:16]),

      .B_IN(s_lbd_23_0_in[23:16]),
      .B_OUT_n(s_lbd_23_0_out[23:16]),

      
      .CLKAB(s_clkbd),
      .CLKBA(s_bgnt_n),

      .SAB(s_ebadr),
      .SBA(s_bgntcact_n),
      
      .DIR(s_wbd_n),
      .OE_n(s_ebd_n)            
   );


   TTL_74648   CHIP_5A 
   (
      .A_IN(s_bd_23_0_n_in[15:8]),
      .A_OUT_n(s_bd_23_0_n_out[15:8]),

      .B_IN(s_lbd_23_0_in[15:8]),
      .B_OUT_n(s_lbd_23_0_out[15:8]),

      
      .CLKAB(s_clkbd),
      .CLKBA(s_bgnt_n),
      
      .SAB(s_ebadr),
      .SBA(s_bgntcact_n),
      
      .DIR(s_wbd_n),
      .OE_n(s_ebd_n)            
   );


   TTL_74648   CHIP_6A 
   (
      .A_IN(s_bd_23_0_n_in[7:0]),
      .A_OUT_n(s_bd_23_0_n_out[7:0]),

      .B_IN(s_lbd_23_0_in[7:0]),
      .B_OUT_n(s_lbd_23_0_out[7:0]),

      
      .CLKAB(s_clkbd),
      .CLKBA(s_bgnt_n),
      
      .SAB(s_ebadr),
      .SBA(s_bgntcact_n),
      
      .DIR(s_wbd_n),
      .OE_n(s_ebd_n)            
   ); 

endmodule
