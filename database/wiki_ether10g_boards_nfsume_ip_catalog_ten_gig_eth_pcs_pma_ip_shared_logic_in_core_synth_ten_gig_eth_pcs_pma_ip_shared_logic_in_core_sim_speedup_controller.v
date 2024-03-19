//---------------------------------------------------------------------------
// Title      : Simulation Speedup Controller
// Project    : 10 Gigabit Ethernet PCS/PMA Core
// File       : ten_gig_eth_pcs_pma_ip_shared_logic_in_core_sim_speedup_controller.v
// Author     : Xilinx Inc.
// Description: This module provides a parameterizable simulation
//              speedup controller which requires a rising edge on 
//              the control input to set the output to the SIM_VALUE
//              parameter. Otherwise the output is fixed at the
//              SYNTH_VALUE parameter.
//---------------------------------------------------------------------------
// (c) Copyright 2009 - 2014 Xilinx, Inc. All rights reserved.
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
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

module ten_gig_eth_pcs_pma_ip_shared_logic_in_core_sim_speedup_controller
  #(parameter SYNTH_VALUE = 24'h11A4A6,
    parameter SIM_VALUE = 24'h00061B
   )
  (
   input wire clk, // Clock

   // Control input
   input wire sim_speedup_control,
   // Output value
   output reg [23:0] sim_speedup_value = SYNTH_VALUE);       

//-----------------------------------------------------------------------------

 
  reg control_reg = 1'b1;
  reg control_reg1 = 1'b1;
  reg control_rising = 1'b0;
  wire load_sim_speedup_value;
  wire load_sim_value_control;
  wire load_sim_value_control_del;
  
  always @(posedge clk)
  begin 
    control_reg <= sim_speedup_control;
    control_reg1 <= control_reg;
  end
  
  always @(posedge clk)
  begin
    control_rising <= control_reg && !control_reg1;
  end
  
  assign load_sim_value_control = control_rising && sim_speedup_control;
    
  // Add a delta delay to the D input to the Latch, to avoid a race
  // The rtl only works for pre-implementation sims so instance a LUT
  // instead:
  //always @(load_sim_value_control)
  //  load_sim_value_control_del = load_sim_value_control;
  LUT1 #(.INIT(2'h2)) simple_delay_inst
    (.I0(load_sim_value_control), 
     .O(load_sim_value_control_del));

  // Intentionally instance a Latch here (for simulation only!)
  LDCE #(.INIT(1'b0)) load_sim_speedup_value_reg 
    (.CLR(1'b0),
     .GE(1'b1),
     .D(load_sim_value_control_del),
     .G(load_sim_value_control),
     .Q(load_sim_speedup_value)
    );

  always @(load_sim_speedup_value)
  begin
    if(load_sim_speedup_value)
      sim_speedup_value = SIM_VALUE;
    else
      sim_speedup_value = SYNTH_VALUE;
  end
   
endmodule
