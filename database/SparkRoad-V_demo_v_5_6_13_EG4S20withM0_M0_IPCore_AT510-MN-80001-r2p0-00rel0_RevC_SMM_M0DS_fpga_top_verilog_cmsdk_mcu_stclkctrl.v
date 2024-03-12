//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited or its affiliates.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
//  Version and Release Control Information:
//
//  File Revision       : $Revision: 368444 $
//  File Date           : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Simple control for SysTick signals for Cortex-M processor
//-----------------------------------------------------------------------------

module cmsdk_mcu_stclkctrl #(
  // Ratio between FCLK and SysTck reference clock
  parameter DIV_RATIO = 18'd01000,

  // Divide by half for each phase
  parameter DIVIDER_RELOAD = (DIV_RATIO>>1)-1
 )
 (
  input  wire        FCLK,      // Free running clock
  input  wire        SYSRESETn, // System reset

  output wire        STCLKEN,   // SysTick clock
  output wire [25:0] STCALIB    // SysTick calibration
  );

  reg     [17:0] reg_clk_divider;
  reg            reg_stclken;

  assign STCALIB[25] = 1'b0; // NoRef - reference clock provided
  assign STCALIB[24] = 1'b1; // Skew - reference info not available
  assign STCALIB[23:0] = {24{1'b0}}; // 10 ms value  set to 0, indicate this value is not used

  // Divider
  wire [17:0] reg_clk_div_min1 = reg_clk_divider - {{17{1'b0}}, 1'b1};
  always @(posedge FCLK or negedge SYSRESETn)
  begin
  if (~SYSRESETn)
    reg_clk_divider <= {18{1'b0}};
  else
    begin
    if (|reg_clk_divider)
      reg_clk_divider <= reg_clk_div_min1[17:0];
    else
      reg_clk_divider <= DIVIDER_RELOAD[17:0];
    end
  end

  // Toggle register
  always @(posedge FCLK or negedge SYSRESETn)
  begin
  if (~SYSRESETn)
    reg_stclken <= 1'b0;
  else
    begin
    if (reg_clk_divider==18'h00000)
      reg_stclken <= ~reg_stclken;
    end
  end

  // Connect to top level
  assign STCLKEN = reg_stclken;

endmodule

