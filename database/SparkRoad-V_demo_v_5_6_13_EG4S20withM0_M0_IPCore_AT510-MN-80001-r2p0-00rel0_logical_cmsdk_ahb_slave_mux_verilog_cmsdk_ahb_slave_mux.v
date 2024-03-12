//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2013-04-05 16:06:17 +0100 (Fri, 05 Apr 2013) $
//
//      Revision            : $Revision: 243003 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Simple AHB slave multiplexer
//-----------------------------------------------------------------------------
// Each port can be disabled by parameter if not used.

module cmsdk_ahb_slave_mux #(
  // Parameters to enable/disable ports
  // By default all ports are enabled
  parameter PORT0_ENABLE=1,
  parameter PORT1_ENABLE=1,
  parameter PORT2_ENABLE=1,
  parameter PORT3_ENABLE=1,
  parameter PORT4_ENABLE=1,
  parameter PORT5_ENABLE=1,
  parameter PORT6_ENABLE=1,
  parameter PORT7_ENABLE=1,
  parameter PORT8_ENABLE=1,
  parameter PORT9_ENABLE=1,

  // Data Bus Width
  parameter DW=32
 )
 (
  input  wire          HCLK,       // Clock
  input  wire          HRESETn,    // Reset
  input  wire          HREADY,     // Bus ready
  input  wire          HSEL0,      // HSEL for AHB Slave #0
  input  wire          HREADYOUT0, // HREADY for Slave connection #0
  input  wire          HRESP0,     // HRESP  for slave connection #0
  input  wire [DW-1:0] HRDATA0,    // HRDATA for slave connection #0
  input  wire          HSEL1,      // HSEL for AHB Slave #1
  input  wire          HREADYOUT1, // HREADY for Slave connection #1
  input  wire          HRESP1,     // HRESP  for slave connection #1
  input  wire [DW-1:0] HRDATA1,    // HRDATA for slave connection #1
  input  wire          HSEL2,      // HSEL for AHB Slave #2
  input  wire          HREADYOUT2, // HREADY for Slave connection #2
  input  wire          HRESP2,     // HRESP  for slave connection #2
  input  wire [DW-1:0] HRDATA2,    // HRDATA for slave connection #2
  input  wire          HSEL3,      // HSEL for AHB Slave #3
  input  wire          HREADYOUT3, // HREADY for Slave connection #3
  input  wire          HRESP3,     // HRESP  for slave connection #3
  input  wire [DW-1:0] HRDATA3,    // HRDATA for slave connection #3
  input  wire          HSEL4,      // HSEL for AHB Slave #4
  input  wire          HREADYOUT4, // HREADY for Slave connection #4
  input  wire          HRESP4,     // HRESP  for slave connection #4
  input  wire [DW-1:0] HRDATA4,    // HRDATA for slave connection #4
  input  wire          HSEL5,      // HSEL for AHB Slave #5
  input  wire          HREADYOUT5, // HREADY for Slave connection #5
  input  wire          HRESP5,     // HRESP  for slave connection #5
  input  wire [DW-1:0] HRDATA5,    // HRDATA for slave connection #5
  input  wire          HSEL6,      // HSEL for AHB Slave #6
  input  wire          HREADYOUT6, // HREADY for Slave connection #6
  input  wire          HRESP6,     // HRESP  for slave connection #6
  input  wire [DW-1:0] HRDATA6,    // HRDATA for slave connection #6
  input  wire          HSEL7,      // HSEL for AHB Slave #7
  input  wire          HREADYOUT7, // HREADY for Slave connection #7
  input  wire          HRESP7,     // HRESP  for slave connection #7
  input  wire [DW-1:0] HRDATA7,    // HRDATA for slave connection #7
  input  wire          HSEL8,      // HSEL for AHB Slave #8
  input  wire          HREADYOUT8, // HREADY for Slave connection #8
  input  wire          HRESP8,     // HRESP  for slave connection #8
  input  wire [DW-1:0] HRDATA8,    // HRDATA for slave connection #8
  input  wire          HSEL9,      // HSEL for AHB Slave #9
  input  wire          HREADYOUT9, // HREADY for Slave connection #9
  input  wire          HRESP9,     // HRESP  for slave connection #9
  input  wire [DW-1:0] HRDATA9,    // HRDATA for slave connection #9
  output wire          HREADYOUT,  // HREADY output to AHB master and AHB slaves
  output wire          HRESP,      // HRESP to AHB master
  output wire [DW-1:0] HRDATA      // Read data to AHB master
  );

  wire          mux_hready;   // multiplexed HREADY signal
  reg     [9:0] reg_hsel;     // Register selection control
  wire    [9:0] nxt_hsel_reg; // next state for nxt_hsel_reg

  assign  nxt_hsel_reg[0] = HSEL0 & (PORT0_ENABLE!=0);
  assign  nxt_hsel_reg[1] = HSEL1 & (PORT1_ENABLE!=0);
  assign  nxt_hsel_reg[2] = HSEL2 & (PORT2_ENABLE!=0);
  assign  nxt_hsel_reg[3] = HSEL3 & (PORT3_ENABLE!=0);
  assign  nxt_hsel_reg[4] = HSEL4 & (PORT4_ENABLE!=0);
  assign  nxt_hsel_reg[5] = HSEL5 & (PORT5_ENABLE!=0);
  assign  nxt_hsel_reg[6] = HSEL6 & (PORT6_ENABLE!=0);
  assign  nxt_hsel_reg[7] = HSEL7 & (PORT7_ENABLE!=0);
  assign  nxt_hsel_reg[8] = HSEL8 & (PORT8_ENABLE!=0);
  assign  nxt_hsel_reg[9] = HSEL9 & (PORT9_ENABLE!=0);

  // Registering MuxCtrl
  always @(posedge HCLK or negedge HRESETn)
  begin
   if (~HRESETn)
     reg_hsel <= {10{1'b0}};
   else if (HREADY) // advance pipeline if HREADY is 1
     reg_hsel <= nxt_hsel_reg;
  end

  assign mux_hready =
           ((~reg_hsel[0]) | HREADYOUT0 | (PORT0_ENABLE==0)) &
           ((~reg_hsel[1]) | HREADYOUT1 | (PORT1_ENABLE==0)) &
           ((~reg_hsel[2]) | HREADYOUT2 | (PORT2_ENABLE==0)) &
           ((~reg_hsel[3]) | HREADYOUT3 | (PORT3_ENABLE==0)) &
           ((~reg_hsel[4]) | HREADYOUT4 | (PORT4_ENABLE==0)) &
           ((~reg_hsel[5]) | HREADYOUT5 | (PORT5_ENABLE==0)) &
           ((~reg_hsel[6]) | HREADYOUT6 | (PORT6_ENABLE==0)) &
           ((~reg_hsel[7]) | HREADYOUT7 | (PORT7_ENABLE==0)) &
           ((~reg_hsel[8]) | HREADYOUT8 | (PORT8_ENABLE==0)) &
           ((~reg_hsel[9]) | HREADYOUT9 | (PORT9_ENABLE==0)) ;

  assign HREADYOUT = mux_hready; // Connect to top level

  assign HRDATA =
           ({DW{(reg_hsel[0] & (PORT0_ENABLE!=0))}} & HRDATA0) |
           ({DW{(reg_hsel[1] & (PORT1_ENABLE!=0))}} & HRDATA1) |
           ({DW{(reg_hsel[2] & (PORT2_ENABLE!=0))}} & HRDATA2) |
           ({DW{(reg_hsel[3] & (PORT3_ENABLE!=0))}} & HRDATA3) |
           ({DW{(reg_hsel[4] & (PORT4_ENABLE!=0))}} & HRDATA4) |
           ({DW{(reg_hsel[5] & (PORT5_ENABLE!=0))}} & HRDATA5) |
           ({DW{(reg_hsel[6] & (PORT6_ENABLE!=0))}} & HRDATA6) |
           ({DW{(reg_hsel[7] & (PORT7_ENABLE!=0))}} & HRDATA7) |
           ({DW{(reg_hsel[8] & (PORT8_ENABLE!=0))}} & HRDATA8) |
           ({DW{(reg_hsel[9] & (PORT9_ENABLE!=0))}} & HRDATA9) ;

  assign HRESP =
           (reg_hsel[0] & HRESP0 & (PORT0_ENABLE!=0)) |
           (reg_hsel[1] & HRESP1 & (PORT1_ENABLE!=0)) |
           (reg_hsel[2] & HRESP2 & (PORT2_ENABLE!=0)) |
           (reg_hsel[3] & HRESP3 & (PORT3_ENABLE!=0)) |
           (reg_hsel[4] & HRESP4 & (PORT4_ENABLE!=0)) |
           (reg_hsel[5] & HRESP5 & (PORT5_ENABLE!=0)) |
           (reg_hsel[6] & HRESP6 & (PORT6_ENABLE!=0)) |
           (reg_hsel[7] & HRESP7 & (PORT7_ENABLE!=0)) |
           (reg_hsel[8] & HRESP8 & (PORT8_ENABLE!=0)) |
           (reg_hsel[9] & HRESP9 & (PORT9_ENABLE!=0)) ;

   // ------------------------------------------------------------

`ifdef ARM_AHB_ASSERT_ON
   // ------------------------------------------------------------
   // Assertions
   // ------------------------------------------------------------
`include "std_ovl_defines.h"

   // When HREADYOUT is low, reg_hsel must be non-zero (Property of design)
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "reg_hsel must not be zero when HREADYOUT is low")
   u_ovl_readyout_asserted_when_not_active
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr( (~HREADYOUT) & (reg_hsel=={10{1'b0}}))
      );

   // Properties of the inputs of the design

   // HSEL should be one-hot
   // If this OVL fires - there is an error in the design of the address decoder
   assert_zero_one_hot
     #(`OVL_FATAL,10,`OVL_ASSERT,
       "Only one HSEL input can be activated.")
   u_ovl_hsel_one_hot
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr({HSEL0,
                  HSEL1,
                  HSEL2,
                  HSEL3,
                  HSEL4,
                  HSEL5,
                  HSEL6,
                  HSEL7,
                  HSEL8,
                  HSEL9}));

   // When HREADYOUT is low, HREADY should be low
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "HREADY should be low when HREADYOUT is low")
   u_ovl_ready_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr( (~HREADYOUT) & HREADY )
      );

   // Check if a disabled port is selected
   //  (system design error, check the verilog parameter in module instantiation)
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "A disabled port is selected")
   u_ovl_disabled_port_selected
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr(HREADY & (
        ((PORT0_ENABLE==0) & HSEL0) |
        ((PORT1_ENABLE==0) & HSEL1) |
        ((PORT2_ENABLE==0) & HSEL2) |
        ((PORT3_ENABLE==0) & HSEL3) |
        ((PORT4_ENABLE==0) & HSEL4) |
        ((PORT5_ENABLE==0) & HSEL5) |
        ((PORT6_ENABLE==0) & HSEL6) |
        ((PORT7_ENABLE==0) & HSEL7) |
        ((PORT8_ENABLE==0) & HSEL8) |
        ((PORT9_ENABLE==0) & HSEL9)
        ))
      );

`endif


endmodule
