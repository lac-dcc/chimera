// ------------------------------------------------------------------------------
// (c) Copyright 2010 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES. 
// ------------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Filename:        pselect_f.v
//
// Description:
//                  (Note: At least as early as I.31, XST implements a carry-
//                   chain structure for most decoders when these are coded in
//                   inferrable VHLD. An example of such code can be seen
//                   below in the "INFERRED_GEN" Generate Statement.
//
//                   ->  New code should not need to instantiate pselect-type
//                       components.
//
//                   ->  Existing code can be ported to Virtex5 and later by
//                       replacing pselect instances by pselect_f instances.
//                       As long as the C_FAMILY parameter is not included
//                       in the Generic Map, an inferred implementation
//                       will result.
//
//                   ->  If the designer wishes to force an explicit carry-
//                       chain implementation, pselect_f can be used with
//                       the C_FAMILY parameter set to the target
//                       Xilinx FPGA family.
//                  )
//
//                  Parameterizeable peripheral select (address decode).
//                  AValid qualifier comes in on Carry In at bottom
//                  of carry chain.
//
//
//-----------------------------------------------------------------------------
// Structure:   This section shows the hierarchical structure of axi_lite_ipif.
//
//              --axi_lite_ipif.v
//                    --slave_attachment.v
//                       --address_decoder.v
//                       --pselect_f.v
//                    --counter_f.v
//-----------------------------------------------------------------------------
// Author:      BSB
//
// History:
//
//  BSB      05/20/10      -- First version
// ~~~~~~
//  - Created the first version v1.00.a
// ^^^^^^
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Naming Conventions:
//      active low signals:                     "*_n"
//      clock signals:                          "clk", "clk_div#", "clk_#x"
//      reset signals:                          "rst", "rst_n"
//      generics:                               "C_*"
//      user defined types:                     "*_TYPE"
//      state machine next state:               "*_ns"
//      state machine current state:            "*_cs"
//      combinatorial signals:                  "*_com"
//      pipelined or register delay signals:    "*_d#"
//      counter signals:                        "*cnt*"
//      clock enable signals:                   "*_ce"
//      internal version of output port         "*_i"
//      device pins:                            "*_pin"
//      ports:                                  - Names begin with Uppercase
//      processes:                              "*_PROCESS"
//      component instantiations:               "<ENTITY_>I_<#|FUNC>
//-----------------------------------------------------------------------------
//---------------------------------------------------------------------------
// Entity section
//---------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Definition of Generics:
//          C_AB            -- number of address bits to decode
//          C_AW            -- width of address bus
//          C_BAR           -- base address of peripheral (peripheral select
//                             is asserted when the C_AB most significant
//                             address bits match the C_AB most significant
//                             C_BAR bits
// Definition of Ports:
//          A               -- address input
//          AValid          -- address qualifier
//          CS              -- peripheral select
//-----------------------------------------------------------------------------
module pselect_f (A, AValid, CS);

parameter C_AB  = 9;
parameter C_AW  = 32;
parameter [0:C_AW - 1] C_BAR =  'bz;
parameter C_FAMILY  = "nofamily";
input[0:C_AW-1] A; 
input AValid; 
output CS; 
wire CS;
parameter [0:C_AB-1]BAR = C_BAR[0:C_AB-1];

//----------------------------------------------------------------------------
// Build a behavioral decoder
//----------------------------------------------------------------------------
generate
if (C_AB > 0) begin : XST_WA
assign CS = (A[0:C_AB - 1] == BAR[0:C_AB - 1]) ? AValid : 1'b0 ;
end
endgenerate

generate
if (C_AB == 0) begin : PASS_ON_GEN
assign CS = AValid ;
end
endgenerate
endmodule
