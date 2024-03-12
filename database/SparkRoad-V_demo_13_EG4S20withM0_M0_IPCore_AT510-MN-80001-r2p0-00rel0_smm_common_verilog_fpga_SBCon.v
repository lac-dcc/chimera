//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//        (C) COPYRIGHT 2013 ARM Limited or its affiliates.
//            ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
// -----------------------------------------------------------------------------
//
//      SVN Information
//
//      Checked In          : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//      Revision            : $Revision: 368444 $
//
//      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//------------------------------------------------------------------------------
//-- Purpose : Serial Bus Controller for Audio
//------------------------------------------------------------------------------
//-- Limitation : None
//------------------------------------------------------------------------------
//-- Known Deficiencies : None
//------------------------------------------------------------------------------
//-- Design Assumption and timing issues :
//--
//------------------------------------------------------------------------------
//--
//-- Overview
//-- ========
//-- Generate I2C control interface using bit banging
//-------------------------------------------------------------------------------

`timescale 1ns / 1ps

module SBCon
(
// Inputs
  PCLK,                 //-- APB bus clock
  PRESETn,              //-- APB bus reset
  PSEL,                 //-- APB device select
  PENABLE,              //-- identifies APB active cycle
  PWRITE,               //-- APB transfer direction
  PADDR,                //-- APB address
  PWDATA,               //-- APB write data

  SDA,                  // serial data input
// Outputs
  PRDATA,               //-- APB read data
  SCL,
  SDAOUTEN_n
);

  input          PCLK;
  input          PRESETn;
  input          PSEL;
  input          PENABLE;
  input          PWRITE;
  input   [7:2]  PADDR;
  input  [31:0]  PWDATA;
  input          SDA;
  output [31:0]  PRDATA;
  output         SCL;
  output         SDAOUTEN_n;


`define SB_CONTROL     6'b000000       // 0   status
`define SB_CONTROLS    6'b000000       // 0   set outputs SDA or SCL
`define SB_CONTROLC    6'b000001       // 4   clr outputs SDA or SCL

  reg   [1:0] reg_sb_enable;
  reg   [1:0] reg_prdataout;
  wire  [1:0] nxt_prdata;
  wire [31:0] PRDATA;


  // Enable registers have seperate set and clear operations
  //  WriteEnableRegs : process(PCLK, PRESETn)
  always @(posedge PCLK or negedge PRESETn)
  begin
    if (~PRESETn)
      begin
        reg_sb_enable <= 2'b00;
      end
    else
     begin
      if (PSEL & PWRITE & PENABLE)
       begin
         // set SB enable bits
        if (PADDR[7:2] == `SB_CONTROLS)
           reg_sb_enable <= PWDATA[1:0] | reg_sb_enable;

        // clear SB enable bits
        if (PADDR[7:2] == `SB_CONTROLC)
           reg_sb_enable <= (~PWDATA[1:0]) & reg_sb_enable;
       end
     end
  end

  assign nxt_prdata = ((PADDR == `SB_CONTROL) && (PSEL)) ? ({SDA,reg_sb_enable[0]}) : 2'b00;

//  --------------------------------------------------------------------------------
//  -- When the peripheral is not being accessed, '0's are driven
//  -- on the Read Databus (PRDATA) so as not to place any restrictions
//  -- on the method of external bus connection. The external data buses of the
//  -- peripherals on the APB may then be connected to the ASB-to-APB bridge using
//  -- Muxed or ORed bus connection method.
//  --------------------------------------------------------------------------------

  // Register output data
  always @(posedge PCLK or negedge PRESETn)
  begin
    if (~PRESETn)
      begin
        reg_prdataout[1:0] <= 2'b00;
      end
    else
      begin
        reg_prdataout[1:0] <= nxt_prdata[1:0];
      end
  end // ReadRegs;

  // Output to external
  assign PRDATA     = {{30{1'b0}},reg_prdataout};
  assign SCL        = reg_sb_enable[0];
  assign SDAOUTEN_n = reg_sb_enable[1];

endmodule
