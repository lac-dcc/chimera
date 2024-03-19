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
// Filename:        counter_f.v
//
// Description:     Implements a parameterizable N-bit counter_f
//                      Up/Down Counter
//                      Count Enable
//                      Parallel Load
//                      Synchronous Reset
//                      The structural implementation has incremental cost
//                      of one LUT per bit.
//                      Precedence of operations when simultaneous:
//                        reset, load, count
//
//                  A default inferred-RTL implementation is provided and
//                  is used if the user explicitly specifies C_FAMILY=nofamily
//                  or ommits C_FAMILY (allowing it to default to nofamily).
//                  The default implementation is also used
//                  if needed primitives are not available in FPGAs of the
//                  type given by C_FAMILY.
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
module counter_f (Clk, Rst, Load_In, Count_Enable, Count_Load, Count_Down, 
Count_Out, Carry_Out);

parameter C_NUM_BITS  = 9;
parameter C_FAMILY  = "nofamily";
input Clk; 
input Rst; 
input[C_NUM_BITS - 1:0] Load_In; 
input Count_Enable; 
input Count_Load; 
input Count_Down; 
output[C_NUM_BITS - 1:0] Count_Out; 
wire[C_NUM_BITS - 1:0] Count_Out;
output Carry_Out; 
wire Carry_Out;

reg[C_NUM_BITS:0] icount_out; 
wire[C_NUM_BITS:0] icount_out_x; 
wire[C_NUM_BITS:0] load_in_x; 

//-------------------------------------------------------------------
// Begin architecture
//-------------------------------------------------------------------
//-------------------------------------------------------------------
// Generate Inferred code
//-------------------------------------------------------------------
assign load_in_x = {1'b0, Load_In};
// Mask out carry position to retain legacy self-clear on next enable.
//        icount_out_x <= ('0' & icount_out(C_NUM_BITS-1 downto 0)); -- Echeck WA
assign icount_out_x = {1'b0, icount_out[C_NUM_BITS - 1:0]};

//---------------------------------------------------------------
// Process to generate counter with - synchronous reset, load,
// counter enable, count down / up features.
//---------------------------------------------------------------
always @(posedge Clk)
begin : CNTR_PROC
   if (Rst == 1'b1)
   begin
      icount_out <= {C_NUM_BITS-(0)+1{1'b0}} ; 
   end
   else if (Count_Load == 1'b1)
   begin
      icount_out <= load_in_x ; 
   end
   else if (Count_Down == 1'b1 & Count_Enable == 1'b1)
   begin
      icount_out <= icount_out_x - 1 ; 
   end
   else if (Count_Enable == 1'b1)
   begin
      icount_out <= icount_out_x + 1 ; 
   end  
end 
assign Carry_Out = icount_out[C_NUM_BITS] ;
assign Count_Out = icount_out[C_NUM_BITS - 1:0];
endmodule
