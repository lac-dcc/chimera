// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
 `timescale 1ns / 1ps
// ******************************************************************************************************************************
// File Name          :  cfg_reg_to_axi4lite.v
// Project            :  OpenCAPI CFG extension to convert CFG regs to an AXI4-Lite interface
//
// Module Description : This file converts a software accessible configuration register signals to an AXI4-Lite interface.
//
// Note: The software registers are expected to held stable during the entire command. This allows a synchronous design
//       with only one clock, at the frequency of the AXI4-Lite interface. The rising edge of this clock should align with
//       the clock used by the configuration registers, although there can be a difference in frequency (i.e. CFG clock 
//       of 400 MHz, AXI4-Lite clock of 200 MHz generated from the same oscillator source). 
//
// ******************************************************************************************************************************
// Modification History :
//                                     |Version    |     |Author   |Description of change
//                                     |-----------|     |-------- |---------------------
  `define CFG_REG_TO_AXI4LITE_VERSION   13_NOV_2017   //            Initial creation         
//
// ******************************************************************************************************************************


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module cfg_reg_to_axi4lite (

    // Misc signals
    input          s_axi_aclk             // Clock for AXI4-Lite interface
  , input          s_axi_aresetn          // (active low) Functional reset

    // Configuration register interface
  , input   [13:0] cfg_axi_addr           // Read or write address to selected target (set upper unused bits to 0)
  , input          cfg_axi_wren           // Set to 1 to write a location, held stable through operation until done=1
  , input   [31:0] cfg_axi_wdata          // Contains write data (valid while wren=1)
  , input          cfg_axi_rden           // Set to 1 to read  a location, held stable through operation until done=1
  , output  [31:0] axi_cfg_rdata          // Contains read data (valid when rden=1 and done=1)
  , output         axi_cfg_done           // AXI logic pulses to 1 for 1 cycle when write is complete, or when rdata contains valid results
  , output   [1:0] axi_cfg_bresp          // Write response from selected AXI4-Lite device
  , output   [1:0] axi_cfg_rresp          // Read  response from selected AXI4-Lite device
//, output   [9:0] axi_cfg_status         <-- Pass directly from slaves to config regs, bypassing the conversion logic
  , input          data_expand_enable     // When 1, expand/collapse 4 bytes of data into four, 1 byte AXI operations
  , input          data_expand_dir        // When 0, expand bytes [3:0] in order 0,1,2,3 . When 1, expand in order 3,2,1,0 .

    // AXI4-Lite interface  (refer to "AMBA AXI and ACE Protocol Specification" from ARM)
  , output  [13:0] s_axi_awaddr  
  , output         s_axi_awvalid 
  , input          s_axi_awready  
  , output  [31:0] s_axi_wdata 
  , output   [3:0] s_axi_wstrb  
  , output         s_axi_wvalid  
  , input          s_axi_wready 
  , input    [1:0] s_axi_bresp 
  , input          s_axi_bvalid  
  , output         s_axi_bready  
  , output  [13:0] s_axi_araddr  
  , output         s_axi_arvalid  
  , input          s_axi_arready 
  , input   [31:0] s_axi_rdata  
  , input    [1:0] s_axi_rresp  
  , input          s_axi_rvalid 
  , output         s_axi_rready
);

// Notes:
// Keep latency as low as possible. This this is 1/2 freq of the config regs, lengthy combinational logic shouldn't be a problem.

// ------------------------------------------------------------------------------------------------------------
// Detect rising edge of wren and rden - these indicate the start of the 1st operation, if expansion is enabled
// ------------------------------------------------------------------------------------------------------------
wire rising_wren;
wire rising_rden;
reg  delay_wren_q;
reg  delay_rden_q;
always @(posedge(s_axi_aclk))
  begin
    delay_wren_q <= cfg_axi_wren;
    delay_rden_q <= cfg_axi_rden;
  end
assign rising_wren = cfg_axi_wren & ~delay_wren_q;       // Pulse when current value = 1 and last cycle was 0
assign rising_rden = cfg_axi_rden & ~delay_rden_q;


// ------------------------------------------------------------------
// Expander 
// ------------------------------------------------------------------
reg  [7:0] expander_wdata;
reg  [1:0] expander_state_q;   // When used, states change in order of 00, 01, 10, 11
reg        expander_wren_q;
reg        expander_rden_q;
wire       exp_done_wr;        // Expander version of 'set_done_wr' and 'set_done_rd'
wire       exp_done_rd;
reg        set_done_wr;        // Individual transfer is complete
reg        set_done_rd;


// Expander state machine and pulses marking start of expanded transfer
// Note: An 'operation' consists of 1 or more 'transfers' depending if the 'expander' is enabled or not.
always @(posedge(s_axi_aclk))
  if (s_axi_aresetn == 1'b0 || data_expand_enable == 1'b0) // On reset or when expander not in use, set to inactive values
    begin                                  
      expander_state_q <= 2'b00;                          
      expander_wren_q  <= 1'b0;
      expander_rden_q  <= 1'b0;
    end
  else if (rising_wren == 1'b1 || rising_rden == 1'b1)     // When starting a new operation, and expander is enabled
    begin                                  
      expander_state_q <= 2'b00;                           // Clear to starting state
      expander_wren_q  <= 1'b0;                            // Suppress first 'expander_*en_q' pulse so logic below doesn't see 
      expander_rden_q  <= 1'b0;                            //   rising_*en pulse followed a cycle later by 'expander_*en_q' pulse
    end
  else if (set_done_wr == 1'b1 || set_done_rd == 1'b1)     // When current transfer is done (and expander is enabled)
    begin
      if (expander_state_q == 2'b11)
        begin
          expander_state_q <= 2'b00;                       // Stop expander after 4 transfers
          expander_wren_q  <= 1'b0;                        // Do not begin another transfer
          expander_rden_q  <= 1'b0;
        end
      else
        begin
          expander_state_q <= expander_state_q + 2'b01;    // Move to next state 
          expander_wren_q  <= set_done_wr;                 // Pulse to begin next expanded transfer, depending on its type
          expander_rden_q  <= set_done_rd;
        end
    end
  else
    begin
      expander_state_q <= expander_state_q;                // Stay in current state when idle or when transfer is going on
      expander_wren_q  <= 1'b0;                            // Do not start new transfer, turn into a pulse if set in last cycle
      expander_rden_q  <= 1'b0;
    end

// Pulse exp_done_* when expander is enabled (expander_state_q <> 00) and last transfer is complete
// This is pulse because set_done_* are pulses.
assign exp_done_wr = (expander_state_q == 2'b11 && set_done_wr == 1'b1) ? 1'b1 : 1'b0;
assign exp_done_rd = (expander_state_q == 2'b11 && set_done_rd == 1'b1) ? 1'b1 : 1'b0;

// Select expander_wdata
always @(*)  // Combinational
  if (data_expand_enable == 1'b1 && data_expand_dir == 1'b0)  // Byte order 0,1,2,3
    case (expander_state_q)
      2'b00: expander_wdata = cfg_axi_wdata[ 7: 0];
      2'b01: expander_wdata = cfg_axi_wdata[15: 8];
      2'b10: expander_wdata = cfg_axi_wdata[23:16];
      2'b11: expander_wdata = cfg_axi_wdata[31:24];
    endcase
  else if (data_expand_enable == 1'b1 && data_expand_dir == 1'b1)  // Byte order 3,2,1,0
    case (expander_state_q)
      2'b00: expander_wdata = cfg_axi_wdata[31:24];
      2'b01: expander_wdata = cfg_axi_wdata[23:16];
      2'b10: expander_wdata = cfg_axi_wdata[15: 8];
      2'b11: expander_wdata = cfg_axi_wdata[ 7: 0];
    endcase
  else     // Expander is disabled
    expander_wdata = 8'h00;


// ------------------------------------------------------------------
// Signals driven directly from config regs to AXI4-Lite
// - Write and Read addresses can come from CFG regs directly, as they are the same whether the expander is engaged or not
// - Write data though comes from the CFG reg directly if the expander is disabled, but from the expander if it is enabled
// - Expanded data appears in [7:0] of [31:0] to match the position expected by the Quad SPI core when accessing DTR and DRR FIFOs.
// - Write strobes use all 4 bytes if the expander is disabled, and the right most byte when expander is enabled.
//   Use a Read-Modify-Write procedure in cases where other individual bytes need to be updated.
// ------------------------------------------------------------------

assign s_axi_awaddr = cfg_axi_addr;
assign s_axi_araddr = cfg_axi_addr;
assign s_axi_wdata  = (data_expand_enable == 1'b0) ? cfg_axi_wdata : {24'b0, expander_wdata}; // Expander data in [7:0]
assign s_axi_wstrb  = (data_expand_enable == 1'b0) ? 4'b1111 : 4'b0001;   // Only bits [7:0] carry useful data when expander is active

// -----------------------
// Ready / Valid exchanges
// -----------------------

// *** Either Operation ***
// - When reset is active, done=0 and all valid = 0 (arvalid, awvalid, wvalid). 
// - If not reset and (rising edge of wren or rising edge of rden), set done=0. When operation is complete, set done to CFG regs.
// *** Write Operation ***
// - If not reset and rising edge of wren, set awvalid=1. Wait for awready=1. At next posedge clk, set awvalid=0.
// - If not reset and rising edge of wren, set wvalid=1.  Wait for wready=1.  At next posedge clk, set wvalid=0.
// - If not reset, set bready=1.
// - When doing write op, wait for bvalid=1. At next posedge clk, capture bresp and hold for config reg. Set done=1.
// *** Read Operation ***
// - If not reset and rising edge of rden, set arvalid=1. Wait for arready=1. At next posedge clk, set arvalid=0.
// - If not reset, set rready=1.
// - If not reset and rising edge of rden, wait for rvalid=1. At next posedge clk, capture and hold rresp and rdata. Set done=1.


// *** Either Operation ***

// Control 'done' on individual transfers (same signal for both write and read)
reg  done_q;
always @(posedge(s_axi_aclk))
  if (s_axi_aresetn == 1'b0)                             // On reset, set done=0                      
    done_q <= 1'b0;
  else if (rising_wren == 1'b1 || rising_rden == 1'b1)   // When write or read operation starts, set done=0
    done_q <= 1'b0;
  else if ( (data_expand_enable == 1'b0                         // Expander disabled, 
             && (set_done_wr == 1'b1 || set_done_rd == 1'b1) )  //   set done when wr or rd completes
         || (data_expand_enable == 1'b1                         // Expander enabled,
             && (exp_done_wr == 1'b1 || exp_done_rd == 1'b1) )  //   set done when last wr or rd is complete
          )
    done_q <= 1'b1;
  else if (done_q == 1'b1)                               // Make 'done' a single cycle pulse
    done_q <= 1'b0;
  else                                                   // Otherwise hold the current value
    done_q <= done_q;
assign axi_cfg_done = done_q;


// *** Write Operation ***


// Control 'awvalid' 
reg  awvalid_q;
always @(posedge(s_axi_aclk))
  if (s_axi_aresetn == 1'b0)                               // On reset, set awvalid=0                      
    awvalid_q <= 1'b0;
  else if (rising_wren == 1'b1 || expander_wren_q == 1'b1) // On rising edge of regular or expanded wren, set awvalid=1
    awvalid_q <= 1'b1;
  else if (awvalid_q == 1'b1 && s_axi_awready == 1'b1)     // After being set, when awready=1, clear after next clock edge.
    awvalid_q <= 1'b0;
  else                                                     // Hold value
    awvalid_q <= awvalid_q;
assign s_axi_awvalid = awvalid_q;


// Control 'wvalid' 
reg  wvalid_q;
always @(posedge(s_axi_aclk))
  if (s_axi_aresetn == 1'b0)                               // On reset, set wvalid=0                      
    wvalid_q <= 1'b0;
  else if (rising_wren == 1'b1 || expander_wren_q == 1'b1) // On rising edge of regular or expanded wren, set wvalid=1
    wvalid_q <= 1'b1;
  else if (wvalid_q == 1'b1 && s_axi_wready == 1'b1)       // After being set, when wready=1, clear after next clock edge.
    wvalid_q <= 1'b0;
  else                                                     // Hold value
    wvalid_q <= wvalid_q;           
assign s_axi_wvalid = wvalid_q;


// Control 'bready'
assign s_axi_bready = (s_axi_aresetn == 1'b0) ? 1'b0 : 1'b1;  // If not in reset, master side is always ready for BRESP
                                                              // This means BRESP will be a pulse


// Capture and hold 'bresp'
reg  [1:0] bresp_q;
always @(posedge(s_axi_aclk))
  if (s_axi_aresetn == 1'b0)                             // On reset, set bresp=00 (successful status)
    begin
      bresp_q     <= 2'b00;
      set_done_wr <= 1'b0;
    end
  else if (rising_wren == 1'b1)                          // When first write starts, set successful status and clear transfer done pulse
    begin
      bresp_q     <= 2'b00; 
      set_done_wr <= 1'b0;                               
    end
  else if (s_axi_bvalid == 1'b1)                         // When bvalid=1, capture and hold bresp. Set done=1.
    begin
      bresp_q     <= bresp_q | s_axi_bresp;              // Use OR to combine responses in case expander is in use
      set_done_wr <= 1'b1;                               // Pulse for 1 cycle, when bvalid=1
    end
  else
    begin
      bresp_q     <= bresp_q;
      set_done_wr <= 1'b0;                               // Makes 'set_done_wr' a pulse
    end
assign axi_cfg_bresp = bresp_q;     // While visible on each transfer, software shouldn't look at it until opertion is over


// *** Read Operation ***


// Control 'arvalid'
reg  arvalid_q;
always @(posedge(s_axi_aclk))
  if (s_axi_aresetn == 1'b0)                               // On reset, set arvalid=0                      
    arvalid_q <= 1'b0;
  else if (rising_rden == 1'b1 || expander_rden_q == 1'b1) // On rising edge of regular or expanded rden, set arvalid=1
    arvalid_q <= 1'b1;
  else if (arvalid_q == 1'b1 && s_axi_arready == 1'b1)     // After being set, when arready=1, clear after next clock edge.
    arvalid_q <= 1'b0;
  else                                                     // Hold value
    arvalid_q <= arvalid_q;
assign s_axi_arvalid = arvalid_q;


// Control 'rready'
assign s_axi_rready = (s_axi_aresetn == 1'b0) ? 1'b0 : 1'b1;  // If not in reset, master side is always ready for RRESP and RDATA
                                                              // This means RRESP and RDATA will be a pulse

// Capture and hold 'rresp' and 'rdata'
reg   [1:0] rresp_q;
reg  [31:0] rdata_q;
always @(posedge(s_axi_aclk))
  if (s_axi_aresetn == 1'b0)                             // On reset, set rresp=00 (successful status) and rdata=0
    begin
      rresp_q     <= 2'b00;
      rdata_q     <= 32'h0000_0000;
      set_done_rd <= 1'b0;
    end
  else if (rising_rden == 1'b1)                          // Clear registers when first read starts
    begin
      rresp_q     <= 2'b00; 
      rdata_q     <= 32'h0000_0000;
      set_done_rd <= 1'b0;                               
    end
  else if (s_axi_rvalid == 1'b1)                         // When slave issues rvalid=1, capture rresp & rdata. Set transfer done=1.
    begin
      rresp_q     <= rresp_q | s_axi_rresp;              // When needed, combine responses between expanded ops
      // Form rdata
      if (data_expand_enable == 1'b1 && data_expand_dir == 1'b0)  // Byte order 0,1,2,3; returned byte in [7:0] of [31:0]
        case (expander_state_q)
          2'b00: rdata_q <= {rdata_q[31: 8], s_axi_rdata[7:0]                };     
          2'b01: rdata_q <= {rdata_q[31:16], s_axi_rdata[7:0], rdata_q[ 7:0] };
          2'b10: rdata_q <= {rdata_q[31:24], s_axi_rdata[7:0], rdata_q[15:0] };
          2'b11: rdata_q <= {                s_axi_rdata[7:0], rdata_q[23:0] };
        endcase
      else if (data_expand_enable == 1'b1 && data_expand_dir == 1'b1)  // Byte order 3,2,1,0; returned byte in [7:0] of [31:0]
        case (expander_state_q)
          2'b00: rdata_q <= {                s_axi_rdata[7:0], rdata_q[23:0] };
          2'b01: rdata_q <= {rdata_q[31:24], s_axi_rdata[7:0], rdata_q[15:0] };
          2'b10: rdata_q <= {rdata_q[31:16], s_axi_rdata[7:0], rdata_q[ 7:0] };
          2'b11: rdata_q <= {rdata_q[31: 8], s_axi_rdata[7:0]                };     
        endcase
      else                                               // Expander is not enabled, pass all data back as is
        rdata_q <= s_axi_rdata;
      // Pulse 'done' for individual transfer 
      set_done_rd <= 1'b1;                               // Pulse for 1 cycle, when rvalid=1
    end
  else                                                   
    begin                                                // Hold rresp and rdata
      rresp_q     <= rresp_q;
      rdata_q     <= rdata_q;
      set_done_rd <= 1'b0;                               // Makes 'set_done_rd' a pulse
    end
assign axi_cfg_rresp = rresp_q;     // While visible on each transfer, software shouldn't look at it until opertion is over
assign axi_cfg_rdata = rdata_q;


endmodule

