//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2012 Xilinx, Inc. All rights reserved.
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
//
//-----------------------------------------------------------------------------
//
// Project    : Virtex-7 FPGA Gen3 Integrated Block for PCI Express
// File       : PIO_INTR_CTRL.v
// Version    : 4.1
//
// Description: Interrupt controller block to trigger the cfg_interrupt pins
//
//--------------------------------------------------------------------------------


`timescale 1ps/1ps

module PIO_INTR_CTRL#(
       parameter        TCQ = 1
)(

  input             user_clk,      // User Clock
  input             reset_n,  // User Reset

  // Trigger to generate interrupts (to / from Mem access Block)

  input             gen_leg_intr,    // Generate Legacy Interrupts
  input             gen_msi_intr,    // Generate MSI Interrupts
  input             gen_msix_intr,   // Generate MSI-X Interrupts
  output reg        interrupt_done,  // Indicates whether interrupt is done or in process

  // Legacy Interrupt Interface

  input             cfg_interrupt_sent, // Core asserts this signal when it sends out a Legacy interrupt
  output reg [3:0]  cfg_interrupt_int,  // 4 Bits for INTA, INTB, INTC, INTD (assert or deassert)

  // MSI Interrupt Interface

  input             cfg_interrupt_msi_enable,
  input             cfg_interrupt_msi_sent,
  input             cfg_interrupt_msi_fail,

  output reg [31:0] cfg_interrupt_msi_int,

  //MSI-X Interrupt Interface

  input             cfg_interrupt_msix_enable,
  input             cfg_interrupt_msix_sent,
  input             cfg_interrupt_msix_fail,

  output reg        cfg_interrupt_msix_int,
  output reg [63:0] cfg_interrupt_msix_address,
  output reg [31:0] cfg_interrupt_msix_data

  );

  always @ (posedge user_clk)
  begin
    if(!reset_n) begin

      cfg_interrupt_msi_int     <= #TCQ 32'b0;
	  cfg_interrupt_msix_int	<= #TCQ 1'b0;
      cfg_interrupt_msix_address<= #TCQ 64'b0;
	  cfg_interrupt_msix_data   <= #TCQ 32'b0;
	  cfg_interrupt_int         <= #TCQ 4'b0;
      interrupt_done            <= #TCQ 1'b0;

    end
	else begin

	  case ({gen_leg_intr, gen_msi_intr, gen_msix_intr})

	    3'b100 : begin // Generate LEgacy interrupt

	      if(cfg_interrupt_int == 4'h0) begin
	        cfg_interrupt_int <= #TCQ 4'h1;
	      end
	      else
	        cfg_interrupt_int <= #TCQ 4'h0;

	    end //  Generate LEgacy interrupt


	    3'b010 : begin // Generate MSI Interrupt

          if(cfg_interrupt_msi_enable)
	        cfg_interrupt_msi_int     <= #TCQ 32'hAAAA_AAAA;
	      else
	        cfg_interrupt_msi_int     <= #TCQ 32'b0;

	    end

	    3'b001 : begin // Generate MSI-X Interrupt

          if (cfg_interrupt_msix_enable) begin
	        cfg_interrupt_msix_int	  <= #TCQ 1'b1;
            cfg_interrupt_msix_address<= #TCQ 64'hAAAA_BBBB_CCCC_DDDD;
	        cfg_interrupt_msix_data   <= #TCQ 32'hDEAD_BEEF;
          end
	      else begin
	        cfg_interrupt_msix_int	  <= #TCQ 1'b0;
            cfg_interrupt_msix_address<= #TCQ 64'b0;
	        cfg_interrupt_msix_data   <= #TCQ 32'b0;
	      end
	    end  // Generate MSI-X Interrupt

		default : begin

          cfg_interrupt_msi_int     <= #TCQ 32'b0;
	      cfg_interrupt_msix_int	<= #TCQ 1'b0;
          cfg_interrupt_msix_address<= #TCQ 64'b0;
	      cfg_interrupt_msix_data   <= #TCQ 32'b0;
	      cfg_interrupt_int         <= #TCQ 4'b0;

        end

	  endcase

	  if((cfg_interrupt_int != 4'h0) ||
		 ((cfg_interrupt_msi_enable) && (cfg_interrupt_msi_sent || cfg_interrupt_msi_fail)) ||
		 ((cfg_interrupt_msix_enable) && (cfg_interrupt_msix_sent || cfg_interrupt_msix_fail)))

	    interrupt_done <= #TCQ 1'b1;
	  else
		interrupt_done <= #TCQ 1'b0;

    end // end of resetelse block
  end

endmodule


