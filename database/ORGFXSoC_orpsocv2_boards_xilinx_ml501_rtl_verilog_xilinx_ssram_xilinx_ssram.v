//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Xilinx ML501 SSRAM controller with Wishbone Interface       ////
////                                                              ////
////  Description                                                 ////
////  ZBT SSRAM controller for ML501 board part (or any ZBT RAM)  ////
////  Timing relies on definition of multi-cycle paths during     ////
////  synthesis.                                                  ////
////                                                              ////
////  To Do:                                                      ////
////                                                              ////
////  Author(s):                                                  ////
////      - Julius Baxter, julius.baxter@orsoc.se                 ////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2010 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
/*
 * Controller for ZBT synchronous SRAM (ISSI IS61NLP25636A-200TQL)
 * Explicitly uses Xilinx primitives
 * Currently configured for a 1/4 ratio between bus/ssram clocks: 50 / 200 MHz
 * Requires declaration of some multi-cycle paths during synthesis.
 * 
 * Note: clk_200 and bus clock should be in phase (from same DCM)
 * 
 * Clocking/phase counting scheme (to change it to higher/lower ratio):
 * 
 * We run a phase counter, checking the bus on the last cycle before we hit another multiple of the SSRAM clock to the bus clock (so cycle 3 if ratio is 4, or a 50MHz system bus and 200MHz SRAM), this gives the system bus signals almost another whole cycle to reach our 200MHz regs (and where we define one of the multi-cycle paths). Once we have the stuff registered it's business as usual on the bus to the SRAM. Then we let it sit in our register for a clock or two
 */
module xilinx_ssram
  (
   // WB ports
    input [31:0]       wb_adr_i,
    input 	       wb_stb_i,
    input 	       wb_cyc_i,
    input 	       wb_we_i,
    input [3:0]        wb_sel_i,
    input [31:0]       wb_dat_i,
    output [31:0]      wb_dat_o,
    output	       wb_ack_o,
   
    input 	       wb_clk,
    input 	       wb_rst,

   // SSRAM interface
    input 	       clk_200,
    output wire	       sram_clk,
    input 	       sram_clk_fb,
    output reg [21:1]  sram_addr,
    inout [31:0]       sram_dq_io,
    output reg	       sram_ce_l,
    output reg	       sram_oe_l,    
    output reg	       sram_we_l,
    output reg [3:0]   sram_bw_l,
    output reg	       sram_adv_ld_l,
    output 	       sram_mode
   
   );

   wire [31:0] 	       sram_dq_i;
   reg [31:0] 	       sram_dq_o;
   reg 		       ssram_controller_oe_l;
   
   wire 	       dcm0_clk0_prebufg, dcm0_clk0;
   wire 	       dcm0_locked;

   wire 	       dcms_locked;

   reg 		       wb_clk_r = 1'b0;
   reg 		       wb_clk_r_d;
   wire 	       wb_clk_edge;

   reg 		       wb_ack_write;   
   reg [2:0] 	       wb_ack_read_shiftreg;   
   
   reg [2:0] 	       clk_200_phase;
   reg [4:0] 	       clk_200_cycle_counter;
   
   reg [31:0] 	       data_rd;
   wire [3:0] 	       we;
      
   reg 		       write_cycle;
   reg [3:0] 	       we_r;
   reg 		       reg_from_bus_domain, reg_from_bus_domain_r;

   assign dcms_locked = dcm0_locked;   
   
   assign we = wb_sel_i & {4{wb_cyc_i & wb_stb_i & wb_we_i}};
   
   assign sram_clk = dcm0_clk0;

   // Do wb_clk edge detection with this
   assign wb_clk_edge = wb_clk_r & ~wb_clk_r_d;
   
   assign sram_mode = 0;
   
   initial begin
      $display("* SSRAM controller instantiated at %m.");
   end

   // We ACK writes after one cycle
   always @(posedge wb_clk)
     wb_ack_write <= wb_cyc_i & wb_stb_i & wb_we_i & !wb_ack_write;

   // We ACK reads after 3
   always @(posedge wb_clk)
     wb_ack_read_shiftreg <= {wb_ack_read_shiftreg[1:0], wb_cyc_i & wb_stb_i & !wb_we_i & !(|wb_ack_read_shiftreg)};
   
   assign wb_ack_o = wb_we_i ? wb_ack_write : wb_ack_read_shiftreg[2];   

   // Push the bus clock through a register
   always @(posedge wb_clk) begin
      wb_clk_r <= ~wb_clk_r;
   end
   
   // Sample this with the 150 MHz clock
   always @(posedge clk_200) begin
      wb_clk_r_d <= wb_clk_r;      
   end
   
  // Maintain a phase count, it goes 0->7 (8 phases, to be clear)
  always @(posedge clk_200) begin
    if (wb_clk_edge) begin
      // Will be at 1 next cycle
      clk_200_phase <= 3'd1;
    end else if (clk_200_phase < 3'd7 & dcms_locked) begin
      clk_200_phase <= clk_200_phase + 1;
    end else begin
      clk_200_phase <= 3'd0;
    end
  end      
   
// Multicycle trickery
   
   // Reads will happen like this:
   // * Read address is given 3 clk_200 cycles to settle
   // * It is put onto the bus for two cycles
   // * Read data is then registered
   // * It then has several phases to make it back to the bus register
   
   // Number of cycles we preload counter with, depending on access
`define WRITE_CYCLES 5'h04
`define READ_CYCLES  5'h0c
   
   // We let the commands settle for 2 cycles (0, 1) and then sample
   // *but* data could have come on either cycle 0 _or_ 3, so check both
`define REQ_CHECK_CYCLE ((clk_200_phase == 3'd3)||(clk_200_phase == 3'd7))
   
   // Write OE - whole time, doesn't matter so much
`define WRITE_OE_CYCLE  (|clk_200_cycle_counter)
   // Read OE, just the first  two cycles
//`define READ_OE_CYCLE  (clk_200_cycle_counter > (`READ_CYCLES - 5'h4))
`define READ_OE_CYCLE  (|clk_200_cycle_counter)
   
   // Sample data from RAM 2 cycles after we sample the addr from system bus
`define RAM_DATA_SAMPLE_CYCLE (!(|we_r) && clk_200_cycle_counter == (`READ_CYCLES - 5'h5))
   
   // Cycle when we pull sram_we_l low   
`define WRITE_CE_CYCLE (reg_from_bus_domain & (|we))
   // Cycle when we ouptut the CE
`define READ_CE_CYCLE (reg_from_bus_domain & !(|we))

   // Register stuff when we've just loaded the counter
`define REG_FROM_BUS_DOMAIN reg_from_bus_domain

   // CE 2 cycles dring writes, only one during reads
   always @(posedge clk_200)
     sram_ce_l <= 0;
     //sram_ce_l <= ~((`WRITE_CE_CYCLE) || (`READ_CE_CYCLE ));
     

   always @(posedge clk_200)
     sram_adv_ld_l <= 0;
     //sram_adv_ld_l <= ~((`WRITE_CE_CYCLE) || (`READ_CE_CYCLE ));

   always @(posedge clk_200)
     sram_we_l <= ~(`WRITE_CE_CYCLE);

   always @(posedge clk_200)
     if (`REG_FROM_BUS_DOMAIN)
       sram_addr[21:1] <= wb_adr_i[22:2];

   always @(posedge clk_200)
     if (`REG_FROM_BUS_DOMAIN)
       sram_dq_o <= wb_dat_i;
   
   always @(posedge clk_200)
     if (`REG_FROM_BUS_DOMAIN)
       sram_bw_l <= ~we;
   
   always @(posedge clk_200)
     sram_oe_l <= ~((`READ_OE_CYCLE) & !(|(we_r | we)));

   always @(posedge clk_200)
     ssram_controller_oe_l = ~((`WRITE_OE_CYCLE) & (|we_r));
   
   // Register data from SSRAM
   always @(posedge clk_200)
     if (`RAM_DATA_SAMPLE_CYCLE)
       data_rd[31:0] <= sram_dq_i[31:0];

   assign wb_dat_o = data_rd;
   
   // Determine if we've got a request
   // This logic means the bus' control signals are slightly
   // more constrained than the data and address.
   always @(posedge clk_200)
     begin
	if (|clk_200_cycle_counter)
	  clk_200_cycle_counter <= clk_200_cycle_counter - 1;
	else if (`REQ_CHECK_CYCLE)
	  if (wb_cyc_i & wb_stb_i)
	       clk_200_cycle_counter <= wb_we_i ? 
					       `WRITE_CYCLES : `READ_CYCLES;
	  else
	       clk_200_cycle_counter <= 0;
     end // always @ (posedge clk_200)

   always @(posedge clk_200)
     begin
	reg_from_bus_domain <= ((`REQ_CHECK_CYCLE) & wb_cyc_i & wb_stb_i & !(|clk_200_cycle_counter));
	reg_from_bus_domain_r <= reg_from_bus_domain;
     end   

   // Must clear 
   always @(posedge clk_200)
     if (`REG_FROM_BUS_DOMAIN)
       we_r <= we;
     else if (!(|clk_200_cycle_counter))
       we_r <= 0;   
   
   
   /* SSRAM Clocking configuration */

   /* DCM de-skewing SSRAM clock via external trace */
   DCM_BASE dcm0
     (/*AUTOINST*/
      // Outputs
      .CLK0                              (dcm0_clk0_prebufg),
      .CLK180                            (),
      .CLK270                            (),
      .CLK2X180                          (),
      .CLK2X                             (),
      .CLK90                             (),
      .CLKDV                             (),
      .CLKFX180                          (),
      .CLKFX                             (),
      .LOCKED                            (dcm0_locked),
      // Inputs
      .CLKFB                             (sram_clk_fb),
      .CLKIN                             (clk_200),
      .RST                               (wb_rst));
   
   BUFG dcm0_clk0_bufg
     (// Outputs
      .O                                 (dcm0_clk0),
      // Inputs
      .I                                 (dcm0_clk0_prebufg));

   /* Generate the DQ bus tristate buffers */
   genvar i;
   generate
      for (i=0; i<32; i=i+1) begin: SSRAM_DQ_TRISTATE
	 IOBUF U (.O(sram_dq_i[i]),
		  .IO(sram_dq_io[i]),
		  .I(sram_dq_o[i]),
		  .T(ssram_controller_oe_l));
      end
   endgenerate
   
endmodule // xilinx_ssram

// Local Variables:
// verilog-library-directories:(".")
// verilog-library-extensions:(".v" ".h")
// End:
