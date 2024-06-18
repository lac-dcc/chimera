// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0




// -- (c) Copyright 2009 - 2011 Xilinx, Inc. All rights reserved.
// --
// -- This file contains confidential and proprietary information
// -- of Xilinx, Inc. and is protected under U.S. and 
// -- international copyright and other intellectual property
// -- laws.
// --
// -- DISCLAIMER
// -- This disclaimer is not a license and does not grant any
// -- rights to the materials distributed herewith. Except as
// -- otherwise provided in a valid license issued to you by
// -- Xilinx, and to the maximum extent permitted by applicable
// -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// -- (2) Xilinx shall not be liable (whether in contract or tort,
// -- including negligence, or under any other theory of
// -- liability) for any loss or damage of any kind or nature
// -- related to, arising under or in connection with these
// -- materials, including for any direct, or any indirect,
// -- special, incidental, or consequential loss or damage
// -- (including loss of data, profits, goodwill, or any type of
// -- loss or damage suffered as a result of any action brought
// -- by a third party) even if such damage or loss was
// -- reasonably foreseeable or Xilinx had been advised of the
// -- possibility of the same.
// --
// -- CRITICAL APPLICATIONS
// -- Xilinx products are not designed or intended to be fail-
// -- safe, or for use in any application requiring fail-safe
// -- performance, such as life-support or safety devices or
// -- systems, Class III medical devices, nuclear facilities,
// -- applications related to the deployment of airbags, or any
// -- other applications that could lead to death, personal
// -- injury, or severe property or environmental damage
// -- (individually and collectively, "Critical
// -- Applications"). Customer assumes the sole risk and
// -- liability of any use of Xilinx products in Critical
// -- Applications, subject only to applicable laws and
// -- regulations governing limitations on product liability.
// --
// -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// -- PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------------------
//
// File name: addr_arbiter.v
//
// Description: 
//   Instantiates generic priority encoder.
//   Each request is qualified if its target has not reached its issuing limit.
//   Muxes mesg and target inputs based on arbitration results.
//-----------------------------------------------------------------------------
//
// Structure:
//    addr_arbiter
//      mux_enc
//-----------------------------------------------------------------------------

`timescale 1ps/1ps
`default_nettype none

(* DowngradeIPIdentifiedWarnings="yes" *) 
module axi_crossbar_v2_1_22_addr_arbiter #
  (
   parameter         C_FAMILY                         = "none", 
   parameter integer C_NUM_S                = 1, 
   parameter integer C_NUM_S_LOG                = 1, 
   parameter integer C_NUM_M               = 1, 
   parameter integer C_MESG_WIDTH                 = 1, 
   parameter [C_NUM_S*32-1:0] C_ARB_PRIORITY             = {C_NUM_S{32'h00000000}}
                       // Arbitration priority among each SI slot. 
                       // Higher values indicate higher priority.
                       // Format: C_NUM_SLAVE_SLOTS{Bit32};
                       // Range: 'h0-'hF.
   )
  (
   // Global Signals
   input  wire                                      ACLK,
   input  wire                                      ARESET,
   // Slave Ports
   input  wire [C_NUM_S*C_MESG_WIDTH-1:0]  S_MESG,
   input  wire [C_NUM_S*C_NUM_M-1:0]                S_TARGET_HOT,
   input  wire [C_NUM_S-1:0]                S_VALID,
   input  wire [C_NUM_S-1:0]                S_VALID_QUAL,
   output wire [C_NUM_S-1:0]                S_READY,
   // Master Ports
   output wire [C_MESG_WIDTH-1:0]                    M_MESG,
   output wire [C_NUM_M-1:0]                           M_TARGET_HOT,
   output wire [C_NUM_S_LOG-1:0]                      M_GRANT_ENC,
   output wire                                        M_VALID,
   input  wire                                        M_READY,
   // Sideband input
   input  wire [C_NUM_M-1:0]                ISSUING_LIMIT
   );
   
  // Generates a mask for all input slots that are priority based
  function [C_NUM_S-1:0] f_prio_mask
    (
      input integer null_arg
    );
    reg   [C_NUM_S-1:0]            mask;
    integer                        i;    
    begin
      mask = 0;    
      for (i=0; i < C_NUM_S; i=i+1) begin
        mask[i] = (C_ARB_PRIORITY[i*32+:32] != 0);
      end 
      f_prio_mask = mask;
    end   
  endfunction
  
  // Convert 16-bit one-hot to 4-bit binary
  function [3:0] f_hot2enc
    (
      input [15:0]  one_hot
    );
    begin
      f_hot2enc[0] = |(one_hot & 16'b1010101010101010);
      f_hot2enc[1] = |(one_hot & 16'b1100110011001100);
      f_hot2enc[2] = |(one_hot & 16'b1111000011110000);
      f_hot2enc[3] = |(one_hot & 16'b1111111100000000);
    end
  endfunction

  localparam [C_NUM_S-1:0] P_PRIO_MASK = f_prio_mask(0);

  reg                     m_valid_i = 1'b0;
  reg [C_NUM_S-1:0]       s_ready_i = 0;
  reg [C_NUM_S-1:0]       qual_reg;
  reg [C_NUM_S-1:0]       grant_hot; 
  reg [C_NUM_S-1:0]       last_rr_hot;
  reg                     any_grant;
  reg                     any_prio;
  reg                     found_prio;
  reg [C_NUM_S-1:0]       which_prio_hot;
  reg [C_NUM_S-1:0]       next_prio_hot;
  reg [C_NUM_S_LOG-1:0]   which_prio_enc;          
  reg [C_NUM_S_LOG-1:0]   next_prio_enc;    
  reg [4:0]               current_highest;
  wire [C_NUM_S-1:0]      valid_rr;
  reg [15:0]              next_rr_hot;
  reg [C_NUM_S_LOG-1:0]   next_rr_enc;    
  reg [C_NUM_S*C_NUM_S-1:0] carry_rr;
  reg [C_NUM_S*C_NUM_S-1:0] mask_rr;
  reg                     found_rr;
  wire [C_NUM_S-1:0]      next_hot;
  wire [C_NUM_S_LOG-1:0]  next_enc;    
  reg                     prio_stall;
  integer                 i;
  wire [C_NUM_S-1:0]      valid_qual_i;
  reg  [C_NUM_S_LOG-1:0]  m_grant_enc_i;
  reg  [C_NUM_M-1:0]      m_target_hot_i;
  wire [C_NUM_M-1:0]      m_target_hot_mux;
  reg  [C_MESG_WIDTH-1:0] m_mesg_i;
  wire [C_MESG_WIDTH-1:0] m_mesg_mux;
  genvar                  gen_si;

  assign M_VALID = m_valid_i;
  assign S_READY = s_ready_i;
  assign M_GRANT_ENC = m_grant_enc_i;
  assign M_MESG = m_mesg_i;
  assign M_TARGET_HOT = m_target_hot_i;
  
  generate
    if (C_NUM_S>1) begin : gen_arbiter
      
      always @(posedge ACLK) begin
        if (ARESET) begin
          qual_reg <= 0;
        end else begin 
          qual_reg <= valid_qual_i | ~S_VALID; // Don't disqualify when bus not VALID (valid_qual_i would be garbage)
        end
      end
    
      for (gen_si=0; gen_si<C_NUM_S; gen_si=gen_si+1) begin : gen_req_qual
        assign valid_qual_i[gen_si] = S_VALID_QUAL[gen_si] & (|(S_TARGET_HOT[gen_si*C_NUM_M+:C_NUM_M] & ~ISSUING_LIMIT));
      end
    
      /////////////////////////////////////////////////////////////////////////////
      // Grant a new request when there is none still pending.
      // If no qualified requests found, de-assert M_VALID.
      /////////////////////////////////////////////////////////////////////////////
      
      assign next_hot = found_prio ? next_prio_hot : next_rr_hot;
      assign next_enc = found_prio ? next_prio_enc : next_rr_enc;
      
      always @(posedge ACLK) begin
        if (ARESET) begin
          m_valid_i <= 0;
          s_ready_i <= 0;
          grant_hot <= 0;
          any_grant <= 1'b0;
          m_grant_enc_i <= 0;
          last_rr_hot <= {1'b1, {C_NUM_S-1{1'b0}}};
          m_target_hot_i <= 0;
        end else begin
          s_ready_i <= 0;
          if (m_valid_i) begin
            // Stall 1 cycle after each master-side completion.
            if (M_READY) begin  // Master-side completion
              m_valid_i <= 1'b0;
              grant_hot <= 0;
              any_grant <= 1'b0;
            end
          end else if (any_grant) begin
            m_valid_i <= 1'b1;
            s_ready_i <= grant_hot;  // Assert S_AW/READY for 1 cycle to complete SI address transfer (regardless of M_AREADY)
          end else begin
            if ((found_prio | found_rr) & ~prio_stall) begin
              // Waste 1 cycle and re-arbitrate if target of highest prio hit issuing limit in previous cycle (valid_qual_i).
              if (|(next_hot & valid_qual_i)) begin  
                grant_hot <= next_hot;
                m_grant_enc_i <= next_enc;
                any_grant <= 1'b1;
                if (~found_prio) begin
                  last_rr_hot <= next_rr_hot;
                end
                m_target_hot_i <= m_target_hot_mux;
              end
            end
          end
        end
      end
    
      /////////////////////////////////////////////////////////////////////////////
      // Fixed Priority arbiter
      // Selects next request to grant from among inputs with PRIO > 0, if any.
      /////////////////////////////////////////////////////////////////////////////
          
      always @ * begin : ALG_PRIO
        integer ip;
        any_prio = 1'b0;
        prio_stall = 1'b0;
        which_prio_hot = 0;        
        which_prio_enc = 0;    
        current_highest = 0;    
        for (ip=0; ip < C_NUM_S; ip=ip+1) begin
          // Disqualify slot if target hit issuing limit (pass to lower prio slot).
          if (P_PRIO_MASK[ip] & S_VALID[ip] & qual_reg[ip]) begin
            if ({1'b0, C_ARB_PRIORITY[ip*32+:4]} > current_highest) begin
              current_highest[0+:4] = C_ARB_PRIORITY[ip*32+:4];
              // Stall 1 cycle when highest prio is recovering from SI-side handshake.
              // (Do not allow lower-prio slot to win arbitration.)
              if (s_ready_i[ip]) begin
                any_prio = 1'b0;
                prio_stall = 1'b1;
                which_prio_hot = 0;
                which_prio_enc = 0;
              end else begin
                any_prio = 1'b1;
                which_prio_hot = 1'b1 << ip;
                which_prio_enc = ip;
              end
            end
          end   
        end
        found_prio = any_prio;
        next_prio_hot = which_prio_hot;
        next_prio_enc = which_prio_enc;
      end
     
      /////////////////////////////////////////////////////////////////////////////
      // Round-robin arbiter
      // Selects next request to grant from among inputs with PRIO = 0, if any.
      /////////////////////////////////////////////////////////////////////////////
      
      // Disqualify slot if target hit issuing limit 2 or more cycles earlier (pass to next RR slot).
      // Disqualify for 1 cycle a slot that is recovering from SI-side handshake (s_ready_i),
      //   and allow arbitration to pass to any other RR requester.
      assign valid_rr = ~P_PRIO_MASK & S_VALID & ~s_ready_i & qual_reg;
      
      always @ * begin : ALG_RR
        integer ir, jr, nr;
        next_rr_hot = 0;
        for (ir=0;ir<C_NUM_S;ir=ir+1) begin
          nr = (ir>0) ? (ir-1) : (C_NUM_S-1);
          carry_rr[ir*C_NUM_S] = last_rr_hot[nr];
          mask_rr[ir*C_NUM_S] = ~valid_rr[nr];
          for (jr=1;jr<C_NUM_S;jr=jr+1) begin
            nr = (ir-jr > 0) ? (ir-jr-1) : (C_NUM_S+ir-jr-1);
            carry_rr[ir*C_NUM_S+jr] = carry_rr[ir*C_NUM_S+jr-1] | (last_rr_hot[nr] & mask_rr[ir*C_NUM_S+jr-1]);
            if (jr < C_NUM_S-1) begin
              mask_rr[ir*C_NUM_S+jr] = mask_rr[ir*C_NUM_S+jr-1] & ~valid_rr[nr];
            end
          end   
          next_rr_hot[ir] = valid_rr[ir] & carry_rr[(ir+1)*C_NUM_S-1];
        end
        next_rr_enc = f_hot2enc(next_rr_hot);
        found_rr = |(next_rr_hot);
      end
  
      generic_baseblocks_v2_1_0_mux_enc # 
        (
         .C_FAMILY      ("rtl"),
         .C_RATIO       (C_NUM_S),
         .C_SEL_WIDTH   (C_NUM_S_LOG),
         .C_DATA_WIDTH  (C_MESG_WIDTH)
        ) mux_mesg 
        (
         .S   (m_grant_enc_i),
         .A   (S_MESG),
         .O   (m_mesg_mux),
         .OE  (1'b1)
        ); 
        
      generic_baseblocks_v2_1_0_mux_enc # 
        (
         .C_FAMILY      ("rtl"),
         .C_RATIO       (C_NUM_S),
         .C_SEL_WIDTH   (C_NUM_S_LOG),
         .C_DATA_WIDTH  (C_NUM_M)
        ) si_amesg_mux_inst 
        (
         .S   (next_enc),
         .A   (S_TARGET_HOT),
         .O   (m_target_hot_mux),
         .OE  (1'b1)
        ); 
        
      always @(posedge ACLK) begin
        if (ARESET) begin
          m_mesg_i <= 0;
        end else if (~m_valid_i) begin
          m_mesg_i <= m_mesg_mux;
        end
      end
    
    end else begin : gen_no_arbiter
      
      assign valid_qual_i = S_VALID_QUAL & |(S_TARGET_HOT & ~ISSUING_LIMIT);
      
      always @ (posedge ACLK) begin
        if (ARESET) begin
          m_valid_i <= 1'b0;
          s_ready_i <= 1'b0;
          m_grant_enc_i <= 0;
        end else begin
          s_ready_i <= 1'b0;
          if (m_valid_i) begin
            if (M_READY) begin
              m_valid_i <= 1'b0;
            end
          end else if (S_VALID[0] & valid_qual_i[0] & ~s_ready_i) begin
            m_valid_i <= 1'b1;
            s_ready_i <= 1'b1;
            m_target_hot_i <= S_TARGET_HOT;
          end
        end
      end
      always @(posedge ACLK) begin
        if (ARESET) begin
          m_mesg_i <= 0;
        end else if (~m_valid_i) begin
          m_mesg_i <= S_MESG;
        end
      end
      
      
    end  // gen_arbiter
  endgenerate
endmodule



// -- (c) Copyright 2010 - 2011 Xilinx, Inc. All rights reserved.
// --
// -- This file contains confidential and proprietary information
// -- of Xilinx, Inc. and is protected under U.S. and 
// -- international copyright and other intellectual property
// -- laws.
// --
// -- DISCLAIMER
// -- This disclaimer is not a license and does not grant any
// -- rights to the materials distributed herewith. Except as
// -- otherwise provided in a valid license issued to you by
// -- Xilinx, and to the maximum extent permitted by applicable
// -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// -- (2) Xilinx shall not be liable (whether in contract or tort,
// -- including negligence, or under any other theory of
// -- liability) for any loss or damage of any kind or nature
// -- related to, arising under or in connection with these
// -- materials, including for any direct, or any indirect,
// -- special, incidental, or consequential loss or damage
// -- (including loss of data, profits, goodwill, or any type of
// -- loss or damage suffered as a result of any action brought
// -- by a third party) even if such damage or loss was
// -- reasonably foreseeable or Xilinx had been advised of the
// -- possibility of the same.
// --
// -- CRITICAL APPLICATIONS
// -- Xilinx products are not designed or intended to be fail-
// -- safe, or for use in any application requiring fail-safe
// -- performance, such as life-support or safety devices or
// -- systems, Class III medical devices, nuclear facilities,
// -- applications related to the deployment of airbags, or any
// -- other applications that could lead to death, personal
// -- injury, or severe property or environmental damage
// -- (individually and collectively, "Critical
// -- Applications"). Customer assumes the sole risk and
// -- liability of any use of Xilinx products in Critical
// -- Applications, subject only to applicable laws and
// -- regulations governing limitations on product liability.
// --
// -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// -- PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------------------
//
// Round-Robin Arbiter for R and B channel responses
// Verilog-standard:  Verilog 2001
//--------------------------------------------------------------------------
//
// Structure:
//    arbiter_resp
//--------------------------------------------------------------------------
`timescale 1ps/1ps

(* DowngradeIPIdentifiedWarnings="yes" *) 
module axi_crossbar_v2_1_22_arbiter_resp #
  (
   parameter         C_FAMILY       = "none",
   parameter integer C_NUM_S        = 4,      // Number of requesting Slave ports = [2:16]
   parameter integer C_NUM_S_LOG    = 2,      // Log2(C_NUM_S)
   parameter integer C_GRANT_ENC    = 0,      // Enable encoded grant output
   parameter integer C_GRANT_HOT    = 1       // Enable 1-hot grant output
   )
  (
   // Global Inputs
   input  wire                     ACLK,
   input  wire                     ARESET,
   // Slave  Ports
   input  wire [C_NUM_S-1:0]       S_VALID,      // Request from each slave
   output wire [C_NUM_S-1:0]       S_READY,      // Grant response to each slave
   // Master Ports
   output wire [C_NUM_S_LOG-1:0]   M_GRANT_ENC,  // Granted slave index (encoded)
   output wire [C_NUM_S-1:0]       M_GRANT_HOT,  // Granted slave index (1-hot)
   output wire                     M_VALID,      // Grant event
   input  wire                     M_READY
   );

  // Generates a binary coded from onehotone encoded
  function [4:0] f_hot2enc
    (
      input [16:0]  one_hot
    );
    begin
      f_hot2enc[0] = |(one_hot & 17'b01010101010101010);
      f_hot2enc[1] = |(one_hot & 17'b01100110011001100);
      f_hot2enc[2] = |(one_hot & 17'b01111000011110000);
      f_hot2enc[3] = |(one_hot & 17'b01111111100000000);
      f_hot2enc[4] = |(one_hot & 17'b10000000000000000);
    end
  endfunction

  (* use_clock_enable = "yes" *)
  reg [C_NUM_S-1:0]      chosen = 0;
  
  wire [C_NUM_S-1:0]     grant_hot; 
  wire                   master_selected; 
  wire                   active_master;
  wire                   need_arbitration;
  wire                   m_valid_i;
  wire [C_NUM_S-1:0]     s_ready_i;
  wire                   access_done;
  reg [C_NUM_S-1:0]      last_rr_hot;
  wire [C_NUM_S-1:0]     valid_rr;
  reg [C_NUM_S-1:0]      next_rr_hot;
  reg [C_NUM_S*C_NUM_S-1:0] carry_rr;
  reg [C_NUM_S*C_NUM_S-1:0] mask_rr;
  integer                 i;
  integer                 j;
  integer                 n;
  
  /////////////////////////////////////////////////////////////////////////////
  //   
  // Implementation of the arbiter outputs independant of arbitration
  //
  /////////////////////////////////////////////////////////////////////////////
  
  // Mask the current requests with the chosen master
  assign grant_hot        = chosen & S_VALID;

  // See if we have a selected master
  assign master_selected  = |grant_hot[0+:C_NUM_S];

  // See if we have current requests
  assign active_master    = |S_VALID;

  // Access is completed
  assign access_done = m_valid_i & M_READY;
  
  // Need to handle if we drive S_ready combinatorial and without an IDLE state

  // Drive S_READY on the master who has been chosen when we get a M_READY
  assign s_ready_i = {C_NUM_S{M_READY}} & grant_hot[0+:C_NUM_S];

  // Drive M_VALID if we have a selected master
  assign m_valid_i = master_selected;
                
  // If we have request and not a selected master, we need to arbitrate a new chosen 
  assign need_arbitration = (active_master & ~master_selected) | access_done;

  // need internal signals of the output signals
  assign M_VALID = m_valid_i;
  assign S_READY = s_ready_i;

  /////////////////////////////////////////////////////////////////////////////
  // Assign conditional onehot target output signal.
  assign M_GRANT_HOT = (C_GRANT_HOT == 1) ? grant_hot[0+:C_NUM_S] : {C_NUM_S{1'b0}};
  /////////////////////////////////////////////////////////////////////////////
  // Assign conditional encoded target output signal.
  assign M_GRANT_ENC = (C_GRANT_ENC == 1) ? f_hot2enc(grant_hot) : {C_NUM_S_LOG{1'b0}};
  
  /////////////////////////////////////////////////////////////////////////////
  // Select a new chosen when we need to arbitrate
  // If we don't have a new chosen, keep the old one since it's a good chance
  // that it will do another request
  always @(posedge ACLK)
    begin
      if (ARESET) begin
        chosen <= {C_NUM_S{1'b0}};
        last_rr_hot <= {1'b1, {C_NUM_S-1{1'b0}}};
      end else if (need_arbitration) begin
        chosen <= next_rr_hot;   
        if (|next_rr_hot) last_rr_hot <= next_rr_hot;
      end
    end

  assign valid_rr =  S_VALID;

  /////////////////////////////////////////////////////////////////////////////
  // Round-robin arbiter
  // Selects next request to grant from among inputs with PRIO = 0, if any.
  /////////////////////////////////////////////////////////////////////////////
  
  always @ * begin
    next_rr_hot = 0;
    for (i=0;i<C_NUM_S;i=i+1) begin
      n = (i>0) ? (i-1) : (C_NUM_S-1);
      carry_rr[i*C_NUM_S] = last_rr_hot[n];
      mask_rr[i*C_NUM_S] = ~valid_rr[n];
      for (j=1;j<C_NUM_S;j=j+1) begin
        n = (i-j > 0) ? (i-j-1) : (C_NUM_S+i-j-1);
        carry_rr[i*C_NUM_S+j] = carry_rr[i*C_NUM_S+j-1] | (last_rr_hot[n] & mask_rr[i*C_NUM_S+j-1]);
        if (j < C_NUM_S-1) begin
          mask_rr[i*C_NUM_S+j] = mask_rr[i*C_NUM_S+j-1] & ~valid_rr[n];
        end
      end   
      next_rr_hot[i] = valid_rr[i] & carry_rr[(i+1)*C_NUM_S-1];
    end
  end
  
endmodule




// -- (c) Copyright 2009 - 2011 Xilinx, Inc. All rights reserved.
// --
// -- This file contains confidential and proprietary information
// -- of Xilinx, Inc. and is protected under U.S. and 
// -- international copyright and other intellectual property
// -- laws.
// --
// -- DISCLAIMER
// -- This disclaimer is not a license and does not grant any
// -- rights to the materials distributed herewith. Except as
// -- otherwise provided in a valid license issued to you by
// -- Xilinx, and to the maximum extent permitted by applicable
// -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// -- (2) Xilinx shall not be liable (whether in contract or tort,
// -- including negligence, or under any other theory of
// -- liability) for any loss or damage of any kind or nature
// -- related to, arising under or in connection with these
// -- materials, including for any direct, or any indirect,
// -- special, incidental, or consequential loss or damage
// -- (including loss of data, profits, goodwill, or any type of
// -- loss or damage suffered as a result of any action brought
// -- by a third party) even if such damage or loss was
// -- reasonably foreseeable or Xilinx had been advised of the
// -- possibility of the same.
// --
// -- CRITICAL APPLICATIONS
// -- Xilinx products are not designed or intended to be fail-
// -- safe, or for use in any application requiring fail-safe
// -- performance, such as life-support or safety devices or
// -- systems, Class III medical devices, nuclear facilities,
// -- applications related to the deployment of airbags, or any
// -- other applications that could lead to death, personal
// -- injury, or severe property or environmental damage
// -- (individually and collectively, "Critical
// -- Applications"). Customer assumes the sole risk and
// -- liability of any use of Xilinx products in Critical
// -- Applications, subject only to applicable laws and
// -- regulations governing limitations on product liability.
// --
// -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// -- PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------------------
//
// File name: crossbar.v
//
// Description: 
//   This module is a M-master to N-slave AXI axi_crossbar_v2_1_22_crossbar switch.
//   The interface of this module consists of a vectored slave and master interface
//     in which all slots are sized and synchronized to the native width and clock 
//     of the interconnect.
//   The SAMD axi_crossbar_v2_1_22_crossbar supports only AXI4 and AXI3 protocols.
//   All width, clock and protocol conversions are done outside this block, as are
//     any pipeline registers or data FIFOs.
//   This module contains all arbitration, decoders and channel multiplexing logic.
//     It also contains the diagnostic registers and control interface.
//
//-----------------------------------------------------------------------------
//
// Structure:
//    crossbar
//      si_transactor
//        addr_decoder
//          comparator_static
//        mux_enc
//        axic_srl_fifo
//        arbiter_resp
//      splitter
//      wdata_router
//        axic_reg_srl_fifo
//      wdata_mux
//        axic_reg_srl_fifo
//        mux_enc
//      addr_decoder
//        comparator_static
//      axic_srl_fifo
//      axi_register_slice
//      addr_arbiter
//        mux_enc
//      decerr_slave
//      
//-----------------------------------------------------------------------------
`timescale 1ps/1ps
`default_nettype none

(* DowngradeIPIdentifiedWarnings="yes" *) 
module axi_crossbar_v2_1_22_crossbar #
  (
   parameter         C_FAMILY                       = "none", 
   parameter integer C_NUM_SLAVE_SLOTS              =   1, 
   parameter integer C_NUM_MASTER_SLOTS             =   1, 
   parameter integer C_NUM_ADDR_RANGES              = 1,
   parameter integer C_AXI_ID_WIDTH                   = 1, 
   parameter integer C_AXI_ADDR_WIDTH                 = 32, 
   parameter integer C_AXI_DATA_WIDTH = 32, 
   parameter integer C_AXI_PROTOCOL           = 0, 
   parameter [C_NUM_MASTER_SLOTS*C_NUM_ADDR_RANGES*64-1:0] C_M_AXI_BASE_ADDR = {C_NUM_MASTER_SLOTS*C_NUM_ADDR_RANGES*64{1'b1}}, 
   parameter [C_NUM_MASTER_SLOTS*C_NUM_ADDR_RANGES*64-1:0] C_M_AXI_HIGH_ADDR = {C_NUM_MASTER_SLOTS*C_NUM_ADDR_RANGES*64{1'b0}}, 
   parameter [C_NUM_SLAVE_SLOTS*64-1:0] C_S_AXI_BASE_ID = {C_NUM_SLAVE_SLOTS*64{1'b0}},
   parameter [C_NUM_SLAVE_SLOTS*64-1:0] C_S_AXI_HIGH_ID = {C_NUM_SLAVE_SLOTS*64{1'b0}},
   parameter [C_NUM_SLAVE_SLOTS*32-1:0] C_S_AXI_THREAD_ID_WIDTH = {C_NUM_SLAVE_SLOTS{32'h00000000}}, 
   parameter integer C_AXI_SUPPORTS_USER_SIGNALS = 0,
   parameter integer C_AXI_AWUSER_WIDTH = 1,
   parameter integer C_AXI_ARUSER_WIDTH = 1,
   parameter integer C_AXI_WUSER_WIDTH = 1,
   parameter integer C_AXI_RUSER_WIDTH = 1,
   parameter integer C_AXI_BUSER_WIDTH = 1,
   parameter [C_NUM_SLAVE_SLOTS-1:0] C_S_AXI_SUPPORTS_WRITE           = {C_NUM_SLAVE_SLOTS{1'b1}}, 
   parameter [C_NUM_SLAVE_SLOTS-1:0] C_S_AXI_SUPPORTS_READ            = {C_NUM_SLAVE_SLOTS{1'b1}}, 
   parameter [C_NUM_MASTER_SLOTS-1:0] C_M_AXI_SUPPORTS_WRITE           = {C_NUM_MASTER_SLOTS{1'b1}}, 
   parameter [C_NUM_MASTER_SLOTS-1:0] C_M_AXI_SUPPORTS_READ            = {C_NUM_MASTER_SLOTS{1'b1}}, 
   parameter [C_NUM_MASTER_SLOTS*32-1:0] C_M_AXI_WRITE_CONNECTIVITY = {C_NUM_MASTER_SLOTS*32{1'b1}},
   parameter [C_NUM_MASTER_SLOTS*32-1:0] C_M_AXI_READ_CONNECTIVITY = {C_NUM_MASTER_SLOTS*32{1'b1}},
   parameter [C_NUM_SLAVE_SLOTS*32-1:0] C_S_AXI_SINGLE_THREAD                 = {C_NUM_SLAVE_SLOTS{32'h00000000}}, 
   parameter [C_NUM_SLAVE_SLOTS*32-1:0] C_S_AXI_WRITE_ACCEPTANCE         = {C_NUM_SLAVE_SLOTS{32'h00000001}},
   parameter [C_NUM_SLAVE_SLOTS*32-1:0] C_S_AXI_READ_ACCEPTANCE          = {C_NUM_SLAVE_SLOTS{32'h00000001}},
   parameter [C_NUM_MASTER_SLOTS*32-1:0] C_M_AXI_WRITE_ISSUING            = {C_NUM_MASTER_SLOTS{32'h00000001}},
   parameter [C_NUM_MASTER_SLOTS*32-1:0] C_M_AXI_READ_ISSUING            = {C_NUM_MASTER_SLOTS{32'h00000001}},
   parameter [C_NUM_SLAVE_SLOTS*32-1:0] C_S_AXI_ARB_PRIORITY             = {C_NUM_SLAVE_SLOTS{32'h00000000}},
   parameter [C_NUM_MASTER_SLOTS*32-1:0] C_M_AXI_SECURE                   = {C_NUM_MASTER_SLOTS{32'h00000000}},
   parameter [C_NUM_MASTER_SLOTS*32-1:0] C_M_AXI_ERR_MODE            = {C_NUM_MASTER_SLOTS{32'h00000000}},
   parameter integer C_RANGE_CHECK                    = 0,
   parameter integer C_ADDR_DECODE                    = 0,
   parameter [(C_NUM_MASTER_SLOTS+1)*32-1:0] C_W_ISSUE_WIDTH  = {C_NUM_MASTER_SLOTS+1{32'h00000000}},
   parameter [(C_NUM_MASTER_SLOTS+1)*32-1:0] C_R_ISSUE_WIDTH  = {C_NUM_MASTER_SLOTS+1{32'h00000000}},
   parameter [C_NUM_SLAVE_SLOTS*32-1:0] C_W_ACCEPT_WIDTH = {C_NUM_SLAVE_SLOTS{32'h00000000}},
   parameter [C_NUM_SLAVE_SLOTS*32-1:0] C_R_ACCEPT_WIDTH = {C_NUM_SLAVE_SLOTS{32'h00000000}},
   parameter integer C_DEBUG              = 1
   )
  (
   // Global Signals
   input  wire                                                    ACLK,
   input  wire                                                    ARESETN,
   // Slave Interface Write Address Ports
   input  wire [C_NUM_SLAVE_SLOTS*C_AXI_ID_WIDTH-1:0]           S_AXI_AWID,
   input  wire [C_NUM_SLAVE_SLOTS*C_AXI_ADDR_WIDTH-1:0]           S_AXI_AWADDR,
   input  wire [C_NUM_SLAVE_SLOTS*8-1:0]                          S_AXI_AWLEN,
   input  wire [C_NUM_SLAVE_SLOTS*3-1:0]                          S_AXI_AWSIZE,
   input  wire [C_NUM_SLAVE_SLOTS*2-1:0]                          S_AXI_AWBURST,
   input  wire [C_NUM_SLAVE_SLOTS*2-1:0]                          S_AXI_AWLOCK,
   input  wire [C_NUM_SLAVE_SLOTS*4-1:0]                          S_AXI_AWCACHE,
   input  wire [C_NUM_SLAVE_SLOTS*3-1:0]                          S_AXI_AWPROT,
//   input  wire [C_NUM_SLAVE_SLOTS*4-1:0]                          S_AXI_AWREGION,
   input  wire [C_NUM_SLAVE_SLOTS*4-1:0]                          S_AXI_AWQOS,
   input  wire [C_NUM_SLAVE_SLOTS*C_AXI_AWUSER_WIDTH-1:0]         S_AXI_AWUSER,
   input  wire [C_NUM_SLAVE_SLOTS-1:0]                            S_AXI_AWVALID,
   output wire [C_NUM_SLAVE_SLOTS-1:0]                            S_AXI_AWREADY,
   // Slave Interface Write Data Ports
   input  wire [C_NUM_SLAVE_SLOTS*C_AXI_ID_WIDTH-1:0]           S_AXI_WID,
   input  wire [C_NUM_SLAVE_SLOTS*C_AXI_DATA_WIDTH-1:0]     S_AXI_WDATA,
   input  wire [C_NUM_SLAVE_SLOTS*C_AXI_DATA_WIDTH/8-1:0]   S_AXI_WSTRB,
   input  wire [C_NUM_SLAVE_SLOTS-1:0]                            S_AXI_WLAST,
   input  wire [C_NUM_SLAVE_SLOTS*C_AXI_WUSER_WIDTH-1:0]          S_AXI_WUSER,
   input  wire [C_NUM_SLAVE_SLOTS-1:0]                            S_AXI_WVALID,
   output wire [C_NUM_SLAVE_SLOTS-1:0]                            S_AXI_WREADY,
   // Slave Interface Write Response Ports
   output wire [C_NUM_SLAVE_SLOTS*C_AXI_ID_WIDTH-1:0]           S_AXI_BID,
   output wire [C_NUM_SLAVE_SLOTS*2-1:0]                          S_AXI_BRESP,
   output wire [C_NUM_SLAVE_SLOTS*C_AXI_BUSER_WIDTH-1:0]          S_AXI_BUSER,
   output wire [C_NUM_SLAVE_SLOTS-1:0]                            S_AXI_BVALID,
   input  wire [C_NUM_SLAVE_SLOTS-1:0]                            S_AXI_BREADY,
   // Slave Interface Read Address Ports
   input  wire [C_NUM_SLAVE_SLOTS*C_AXI_ID_WIDTH-1:0]           S_AXI_ARID,
   input  wire [C_NUM_SLAVE_SLOTS*C_AXI_ADDR_WIDTH-1:0]           S_AXI_ARADDR,
   input  wire [C_NUM_SLAVE_SLOTS*8-1:0]                          S_AXI_ARLEN,
   input  wire [C_NUM_SLAVE_SLOTS*3-1:0]                          S_AXI_ARSIZE,
   input  wire [C_NUM_SLAVE_SLOTS*2-1:0]                          S_AXI_ARBURST,
   input  wire [C_NUM_SLAVE_SLOTS*2-1:0]                          S_AXI_ARLOCK,
   input  wire [C_NUM_SLAVE_SLOTS*4-1:0]                          S_AXI_ARCACHE,
   input  wire [C_NUM_SLAVE_SLOTS*3-1:0]                          S_AXI_ARPROT,
//   input  wire [C_NUM_SLAVE_SLOTS*4-1:0]                          S_AXI_ARREGION,
   input  wire [C_NUM_SLAVE_SLOTS*4-1:0]                          S_AXI_ARQOS,
   input  wire [C_NUM_SLAVE_SLOTS*C_AXI_ARUSER_WIDTH-1:0]         S_AXI_ARUSER,
   input  wire [C_NUM_SLAVE_SLOTS-1:0]                            S_AXI_ARVALID,
   output wire [C_NUM_SLAVE_SLOTS-1:0]                            S_AXI_ARREADY,
   // Slave Interface Read Data Ports
   output wire [C_NUM_SLAVE_SLOTS*C_AXI_ID_WIDTH-1:0]           S_AXI_RID,
   output wire [C_NUM_SLAVE_SLOTS*C_AXI_DATA_WIDTH-1:0]     S_AXI_RDATA,
   output wire [C_NUM_SLAVE_SLOTS*2-1:0]                          S_AXI_RRESP,
   output wire [C_NUM_SLAVE_SLOTS-1:0]                            S_AXI_RLAST,
   output wire [C_NUM_SLAVE_SLOTS*C_AXI_RUSER_WIDTH-1:0]          S_AXI_RUSER,
   output wire [C_NUM_SLAVE_SLOTS-1:0]                            S_AXI_RVALID,
   input  wire [C_NUM_SLAVE_SLOTS-1:0]                            S_AXI_RREADY,
   // Master Interface Write Address Port
   output wire [C_NUM_MASTER_SLOTS*C_AXI_ID_WIDTH-1:0]          M_AXI_AWID,
   output wire [C_NUM_MASTER_SLOTS*C_AXI_ADDR_WIDTH-1:0]          M_AXI_AWADDR,
   output wire [C_NUM_MASTER_SLOTS*8-1:0]                         M_AXI_AWLEN,
   output wire [C_NUM_MASTER_SLOTS*3-1:0]                         M_AXI_AWSIZE,
   output wire [C_NUM_MASTER_SLOTS*2-1:0]                         M_AXI_AWBURST,
   output wire [C_NUM_MASTER_SLOTS*2-1:0]                         M_AXI_AWLOCK,
   output wire [C_NUM_MASTER_SLOTS*4-1:0]                         M_AXI_AWCACHE,
   output wire [C_NUM_MASTER_SLOTS*3-1:0]                         M_AXI_AWPROT,
   output wire [C_NUM_MASTER_SLOTS*4-1:0]                         M_AXI_AWREGION,
   output wire [C_NUM_MASTER_SLOTS*4-1:0]                         M_AXI_AWQOS,
   output wire [C_NUM_MASTER_SLOTS*C_AXI_AWUSER_WIDTH-1:0]        M_AXI_AWUSER,
   output wire [C_NUM_MASTER_SLOTS-1:0]                           M_AXI_AWVALID,
   input  wire [C_NUM_MASTER_SLOTS-1:0]                           M_AXI_AWREADY,
   // Master Interface Write Data Ports
   output wire [C_NUM_MASTER_SLOTS*C_AXI_ID_WIDTH-1:0]          M_AXI_WID,
   output wire [C_NUM_MASTER_SLOTS*C_AXI_DATA_WIDTH-1:0]    M_AXI_WDATA,
   output wire [C_NUM_MASTER_SLOTS*C_AXI_DATA_WIDTH/8-1:0]  M_AXI_WSTRB,
   output wire [C_NUM_MASTER_SLOTS-1:0]                           M_AXI_WLAST,
   output wire [C_NUM_MASTER_SLOTS*C_AXI_WUSER_WIDTH-1:0]         M_AXI_WUSER,
   output wire [C_NUM_MASTER_SLOTS-1:0]                           M_AXI_WVALID,
   input  wire [C_NUM_MASTER_SLOTS-1:0]                           M_AXI_WREADY,
   // Master Interface Write Response Ports
   input  wire [C_NUM_MASTER_SLOTS*C_AXI_ID_WIDTH-1:0]          M_AXI_BID,
   input  wire [C_NUM_MASTER_SLOTS*2-1:0]                         M_AXI_BRESP,
   input  wire [C_NUM_MASTER_SLOTS*C_AXI_BUSER_WIDTH-1:0]         M_AXI_BUSER,
   input  wire [C_NUM_MASTER_SLOTS-1:0]                           M_AXI_BVALID,
   output wire [C_NUM_MASTER_SLOTS-1:0]                           M_AXI_BREADY,
   // Master Interface Read Address Port
   output wire [C_NUM_MASTER_SLOTS*C_AXI_ID_WIDTH-1:0]          M_AXI_ARID,
   output wire [C_NUM_MASTER_SLOTS*C_AXI_ADDR_WIDTH-1:0]          M_AXI_ARADDR,
   output wire [C_NUM_MASTER_SLOTS*8-1:0]                         M_AXI_ARLEN,
   output wire [C_NUM_MASTER_SLOTS*3-1:0]                         M_AXI_ARSIZE,
   output wire [C_NUM_MASTER_SLOTS*2-1:0]                         M_AXI_ARBURST,
   output wire [C_NUM_MASTER_SLOTS*2-1:0]                         M_AXI_ARLOCK,
   output wire [C_NUM_MASTER_SLOTS*4-1:0]                         M_AXI_ARCACHE,
   output wire [C_NUM_MASTER_SLOTS*3-1:0]                         M_AXI_ARPROT,
   output wire [C_NUM_MASTER_SLOTS*4-1:0]                         M_AXI_ARREGION,
   output wire [C_NUM_MASTER_SLOTS*4-1:0]                         M_AXI_ARQOS,
   output wire [C_NUM_MASTER_SLOTS*C_AXI_ARUSER_WIDTH-1:0]        M_AXI_ARUSER,
   output wire [C_NUM_MASTER_SLOTS-1:0]                           M_AXI_ARVALID,
   input  wire [C_NUM_MASTER_SLOTS-1:0]                           M_AXI_ARREADY,
   // Master Interface Read Data Ports
   input  wire [C_NUM_MASTER_SLOTS*C_AXI_ID_WIDTH-1:0]          M_AXI_RID,
   input  wire [C_NUM_MASTER_SLOTS*C_AXI_DATA_WIDTH-1:0]    M_AXI_RDATA,
   input  wire [C_NUM_MASTER_SLOTS*2-1:0]                         M_AXI_RRESP,
   input  wire [C_NUM_MASTER_SLOTS-1:0]                           M_AXI_RLAST,
   input wire [C_NUM_MASTER_SLOTS*C_AXI_RUSER_WIDTH-1:0]         M_AXI_RUSER,
   input  wire [C_NUM_MASTER_SLOTS-1:0]                           M_AXI_RVALID,
   output wire [C_NUM_MASTER_SLOTS-1:0]                           M_AXI_RREADY
   );
   
  localparam integer  P_AXI4 = 0;
  localparam integer  P_AXI3 = 1;
  localparam integer  P_AXILITE = 2;
  localparam integer P_WRITE = 0;
  localparam integer P_READ = 1;
  localparam integer P_NUM_MASTER_SLOTS_LOG = f_ceil_log2(C_NUM_MASTER_SLOTS);
  localparam integer P_NUM_SLAVE_SLOTS_LOG = f_ceil_log2((C_NUM_SLAVE_SLOTS>1) ? C_NUM_SLAVE_SLOTS : 2);
  localparam integer P_AXI_WID_WIDTH = (C_AXI_PROTOCOL == P_AXI3) ? C_AXI_ID_WIDTH : 1;
  localparam integer P_ST_AWMESG_WIDTH = 2+4+4 + C_AXI_AWUSER_WIDTH;
  localparam integer P_AA_AWMESG_WIDTH = C_AXI_ID_WIDTH + C_AXI_ADDR_WIDTH + 8+3+2+3+4 + P_ST_AWMESG_WIDTH;
  localparam integer P_ST_ARMESG_WIDTH = 2+4+4 + C_AXI_ARUSER_WIDTH;
  localparam integer P_AA_ARMESG_WIDTH = C_AXI_ID_WIDTH + C_AXI_ADDR_WIDTH + 8+3+2+3+4 + P_ST_ARMESG_WIDTH;
  localparam integer P_ST_BMESG_WIDTH = 2 + C_AXI_BUSER_WIDTH;
  localparam integer P_ST_RMESG_WIDTH = 2 + C_AXI_RUSER_WIDTH + C_AXI_DATA_WIDTH;
  localparam integer P_WR_WMESG_WIDTH = C_AXI_DATA_WIDTH + C_AXI_DATA_WIDTH/8 + C_AXI_WUSER_WIDTH + P_AXI_WID_WIDTH;
  localparam [31:0] P_BYPASS  = 32'h00000000;
  localparam [31:0] P_FWD_REV = 32'h00000001;
  localparam [31:0] P_SIMPLE  = 32'h00000007;
  localparam [(C_NUM_MASTER_SLOTS+1)-1:0] P_M_AXI_SUPPORTS_READ = {1'b1, C_M_AXI_SUPPORTS_READ[0+:C_NUM_MASTER_SLOTS]};
  localparam [(C_NUM_MASTER_SLOTS+1)-1:0] P_M_AXI_SUPPORTS_WRITE = {1'b1, C_M_AXI_SUPPORTS_WRITE[0+:C_NUM_MASTER_SLOTS]};
  localparam [(C_NUM_MASTER_SLOTS+1)*32-1:0] P_M_AXI_WRITE_CONNECTIVITY = {{32{1'b1}}, C_M_AXI_WRITE_CONNECTIVITY[0+:C_NUM_MASTER_SLOTS*32]};
  localparam [(C_NUM_MASTER_SLOTS+1)*32-1:0] P_M_AXI_READ_CONNECTIVITY = {{32{1'b1}}, C_M_AXI_READ_CONNECTIVITY[0+:C_NUM_MASTER_SLOTS*32]};
  localparam [C_NUM_SLAVE_SLOTS*32-1:0] P_S_AXI_WRITE_CONNECTIVITY = f_si_write_connectivity(0);
  localparam [C_NUM_SLAVE_SLOTS*32-1:0] P_S_AXI_READ_CONNECTIVITY = f_si_read_connectivity(0);
  localparam [(C_NUM_MASTER_SLOTS+1)*32-1:0] P_M_AXI_READ_ISSUING = {32'h00000001, C_M_AXI_READ_ISSUING[0+:C_NUM_MASTER_SLOTS*32]};
  localparam [(C_NUM_MASTER_SLOTS+1)*32-1:0] P_M_AXI_WRITE_ISSUING = {32'h00000001, C_M_AXI_WRITE_ISSUING[0+:C_NUM_MASTER_SLOTS*32]};
  localparam P_DECERR = 2'b11;

  //---------------------------------------------------------------------------
  // Functions
  //---------------------------------------------------------------------------
  // Ceiling of log2(x)
  function integer f_ceil_log2
    (
     input integer x
     );
    integer acc;
    begin
      acc=0;
      while ((2**acc) < x)
        acc = acc + 1;
      f_ceil_log2 = acc;
    end
  endfunction

  // Isolate thread bits of input S_ID and add to BASE_ID (RNG00) to form MI-side ID value
  //   only for end-point SI-slots
  function [C_AXI_ID_WIDTH-1:0] f_extend_ID
    (
     input [C_AXI_ID_WIDTH-1:0] s_id,
     input integer slot
     );
    begin
      f_extend_ID = C_S_AXI_BASE_ID[slot*64+:C_AXI_ID_WIDTH] | (s_id & (C_S_AXI_BASE_ID[slot*64+:C_AXI_ID_WIDTH] ^ C_S_AXI_HIGH_ID[slot*64+:C_AXI_ID_WIDTH]));
    end
  endfunction

  // Write connectivity array transposed
  function [C_NUM_SLAVE_SLOTS*32-1:0] f_si_write_connectivity
    (
      input integer null_arg
     );
    integer si_slot;
    integer mi_slot;
    reg  [C_NUM_SLAVE_SLOTS*32-1:0]  result;
    begin
      result = {C_NUM_SLAVE_SLOTS*32{1'b1}};
      for (si_slot=0; si_slot<C_NUM_SLAVE_SLOTS; si_slot=si_slot+1) begin
        for (mi_slot=0; mi_slot<C_NUM_MASTER_SLOTS; mi_slot=mi_slot+1) begin
          result[si_slot*32+mi_slot] = C_M_AXI_WRITE_CONNECTIVITY[mi_slot*32+si_slot];
        end
      end
    f_si_write_connectivity = result;
    end
  endfunction

  // Read connectivity array transposed
  function [C_NUM_SLAVE_SLOTS*32-1:0] f_si_read_connectivity
    (
      input integer null_arg
     );
    integer si_slot;
    integer mi_slot;
    reg  [C_NUM_SLAVE_SLOTS*32-1:0]  result;
    begin
      result = {C_NUM_SLAVE_SLOTS*32{1'b1}};
      for (si_slot=0; si_slot<C_NUM_SLAVE_SLOTS; si_slot=si_slot+1) begin
        for (mi_slot=0; mi_slot<C_NUM_MASTER_SLOTS; mi_slot=mi_slot+1) begin
          result[si_slot*32+mi_slot] = C_M_AXI_READ_CONNECTIVITY[mi_slot*32+si_slot];
        end
      end
    f_si_read_connectivity = result;
    end
  endfunction

  genvar gen_si_slot;
  genvar gen_mi_slot;
  wire [C_NUM_SLAVE_SLOTS*P_ST_AWMESG_WIDTH-1:0]                  si_st_awmesg          ;
  wire [C_NUM_SLAVE_SLOTS*P_ST_AWMESG_WIDTH-1:0]                  st_tmp_awmesg         ;
  wire [C_NUM_SLAVE_SLOTS*P_AA_AWMESG_WIDTH-1:0]                  tmp_aa_awmesg         ;
  wire [P_AA_AWMESG_WIDTH-1:0]                                    aa_mi_awmesg          ;
  wire [C_NUM_SLAVE_SLOTS*C_AXI_ID_WIDTH-1:0]                     st_aa_awid            ;
  wire [C_NUM_SLAVE_SLOTS*C_AXI_ADDR_WIDTH-1:0]                   st_aa_awaddr          ;
  wire [C_NUM_SLAVE_SLOTS*8-1:0]                                  st_aa_awlen           ;
  wire [C_NUM_SLAVE_SLOTS*3-1:0]                                  st_aa_awsize          ;
  wire [C_NUM_SLAVE_SLOTS*2-1:0]                                  st_aa_awlock          ;
  wire [C_NUM_SLAVE_SLOTS*3-1:0]                                  st_aa_awprot          ;
  wire [C_NUM_SLAVE_SLOTS*4-1:0]                                  st_aa_awregion        ;
  wire [C_NUM_SLAVE_SLOTS*8-1:0]                                  st_aa_awerror         ;
  wire [C_NUM_SLAVE_SLOTS*(C_NUM_MASTER_SLOTS+1)-1:0]             st_aa_awtarget_hot    ;
  wire [C_NUM_SLAVE_SLOTS*(P_NUM_MASTER_SLOTS_LOG+1)-1:0]         st_aa_awtarget_enc    ;
  wire [P_NUM_SLAVE_SLOTS_LOG*1-1:0]                              aa_wm_awgrant_enc     ;
  wire [(C_NUM_MASTER_SLOTS+1)-1:0]                               aa_mi_awtarget_hot    ;
  wire [C_NUM_SLAVE_SLOTS*1-1:0]                                  st_aa_awvalid_qual    ;
  wire [C_NUM_SLAVE_SLOTS*1-1:0]                                  st_ss_awvalid         ;
  wire [C_NUM_SLAVE_SLOTS*1-1:0]                                  st_ss_awready         ;
  wire [C_NUM_SLAVE_SLOTS*1-1:0]                                  ss_wr_awvalid         ;
  wire [C_NUM_SLAVE_SLOTS*1-1:0]                                  ss_wr_awready         ;
  wire [C_NUM_SLAVE_SLOTS*1-1:0]                                  ss_aa_awvalid         ;
  wire [C_NUM_SLAVE_SLOTS*1-1:0]                                  ss_aa_awready         ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             sa_wm_awvalid         ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             sa_wm_awready         ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_awvalid            ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_awready            ;
  wire                                                            aa_sa_awvalid         ;
  wire                                                            aa_sa_awready         ;
  wire                                                            aa_mi_arready         ;
  wire                                                            mi_awvalid_en         ;
  wire                                                            sa_wm_awvalid_en      ;
  wire                                                            sa_wm_awready_mux     ;
  wire [C_NUM_SLAVE_SLOTS*P_ST_ARMESG_WIDTH-1:0]                  si_st_armesg          ;
  wire [C_NUM_SLAVE_SLOTS*P_ST_ARMESG_WIDTH-1:0]                  st_tmp_armesg         ;
  wire [C_NUM_SLAVE_SLOTS*P_AA_ARMESG_WIDTH-1:0]                  tmp_aa_armesg         ;
  wire [P_AA_ARMESG_WIDTH-1:0]                                    aa_mi_armesg          ;
  wire [C_NUM_SLAVE_SLOTS*C_AXI_ID_WIDTH-1:0]                     st_aa_arid            ;
  wire [C_NUM_SLAVE_SLOTS*C_AXI_ADDR_WIDTH-1:0]                   st_aa_araddr          ;
  wire [C_NUM_SLAVE_SLOTS*8-1:0]                                  st_aa_arlen           ;
  wire [C_NUM_SLAVE_SLOTS*3-1:0]                                  st_aa_arsize          ;
  wire [C_NUM_SLAVE_SLOTS*2-1:0]                                  st_aa_arlock          ;
  wire [C_NUM_SLAVE_SLOTS*3-1:0]                                  st_aa_arprot          ;
  wire [C_NUM_SLAVE_SLOTS*4-1:0]                                  st_aa_arregion        ;
  wire [C_NUM_SLAVE_SLOTS*8-1:0]                                  st_aa_arerror         ;
  wire [C_NUM_SLAVE_SLOTS*(C_NUM_MASTER_SLOTS+1)-1:0]             st_aa_artarget_hot    ;
  wire [C_NUM_SLAVE_SLOTS*(P_NUM_MASTER_SLOTS_LOG+1)-1:0]         st_aa_artarget_enc    ;
  wire [(C_NUM_MASTER_SLOTS+1)-1:0]                               aa_mi_artarget_hot    ;
  wire [P_NUM_SLAVE_SLOTS_LOG*1-1:0]                              aa_mi_argrant_enc     ;
  wire [C_NUM_SLAVE_SLOTS*1-1:0]                                  st_aa_arvalid_qual    ;
  wire [C_NUM_SLAVE_SLOTS*1-1:0]                                  st_aa_arvalid         ;
  wire [C_NUM_SLAVE_SLOTS*1-1:0]                                  st_aa_arready         ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_arvalid            ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_arready            ;
  wire                                                            aa_mi_arvalid         ;
  wire                                                            mi_awready_mux        ;
  wire [C_NUM_SLAVE_SLOTS*P_ST_BMESG_WIDTH-1:0]                   st_si_bmesg           ;
  wire [(C_NUM_MASTER_SLOTS+1)*P_ST_BMESG_WIDTH-1:0]              st_mr_bmesg           ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_ID_WIDTH-1:0]                st_mr_bid             ;
  wire [(C_NUM_MASTER_SLOTS+1)*2-1:0]                             st_mr_bresp           ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_BUSER_WIDTH-1:0]             st_mr_buser           ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             st_mr_bvalid          ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             st_mr_bready          ;
  wire [C_NUM_SLAVE_SLOTS*(C_NUM_MASTER_SLOTS+1)-1:0]             st_tmp_bready         ;
  wire [C_NUM_SLAVE_SLOTS*(C_NUM_MASTER_SLOTS+1)-1:0]             st_tmp_bid_target     ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_NUM_SLAVE_SLOTS-1:0]             tmp_mr_bid_target     ;
  wire [(C_NUM_MASTER_SLOTS+1)*P_NUM_SLAVE_SLOTS_LOG-1:0]         debug_bid_target_i    ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             bid_match             ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_ID_WIDTH-1:0]                mi_bid                ;
  wire [(C_NUM_MASTER_SLOTS+1)*2-1:0]                             mi_bresp              ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_BUSER_WIDTH-1:0]             mi_buser              ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_bvalid             ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_bready             ;
  wire [C_NUM_SLAVE_SLOTS*(C_NUM_MASTER_SLOTS+1)-1:0]             bready_carry          ;
  wire [C_NUM_SLAVE_SLOTS*P_ST_RMESG_WIDTH-1:0]                   st_si_rmesg           ;
  wire [(C_NUM_MASTER_SLOTS+1)*P_ST_RMESG_WIDTH-1:0]              st_mr_rmesg           ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_ID_WIDTH-1:0]                st_mr_rid             ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_DATA_WIDTH-1:0]     st_mr_rdata           ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_RUSER_WIDTH-1:0]             st_mr_ruser           ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             st_mr_rlast           ;
  wire [(C_NUM_MASTER_SLOTS+1)*2-1:0]                             st_mr_rresp           ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             st_mr_rvalid          ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             st_mr_rready          ;
  wire [C_NUM_SLAVE_SLOTS*(C_NUM_MASTER_SLOTS+1)-1:0]             st_tmp_rready         ;
  wire [C_NUM_SLAVE_SLOTS*(C_NUM_MASTER_SLOTS+1)-1:0]             st_tmp_rid_target     ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_NUM_SLAVE_SLOTS-1:0]             tmp_mr_rid_target     ;
  wire [(C_NUM_MASTER_SLOTS+1)*P_NUM_SLAVE_SLOTS_LOG-1:0]         debug_rid_target_i    ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             rid_match             ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_ID_WIDTH-1:0]                mi_rid                ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_DATA_WIDTH-1:0]          mi_rdata              ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_RUSER_WIDTH-1:0]             mi_ruser              ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_rlast              ;
  wire [(C_NUM_MASTER_SLOTS+1)*2-1:0]                             mi_rresp              ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_rvalid             ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_rready             ;
  wire [C_NUM_SLAVE_SLOTS*(C_NUM_MASTER_SLOTS+1)-1:0]             rready_carry          ;
  wire [C_NUM_SLAVE_SLOTS*P_WR_WMESG_WIDTH-1:0]                   si_wr_wmesg           ;
  wire [C_NUM_SLAVE_SLOTS*P_WR_WMESG_WIDTH-1:0]                   wr_wm_wmesg           ;
  wire [C_NUM_SLAVE_SLOTS*1-1:0]                                  wr_wm_wlast           ;
  wire [C_NUM_SLAVE_SLOTS*(C_NUM_MASTER_SLOTS+1)-1:0]             wr_tmp_wvalid         ;
  wire [C_NUM_SLAVE_SLOTS*(C_NUM_MASTER_SLOTS+1)-1:0]             wr_tmp_wready         ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_NUM_SLAVE_SLOTS-1:0]             tmp_wm_wvalid         ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_NUM_SLAVE_SLOTS-1:0]             tmp_wm_wready         ;
  wire [(C_NUM_MASTER_SLOTS+1)*P_WR_WMESG_WIDTH-1:0]              wm_mr_wmesg              ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_DATA_WIDTH-1:0]          wm_mr_wdata              ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_DATA_WIDTH/8-1:0]        wm_mr_wstrb              ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_ID_WIDTH-1:0]                wm_mr_wid              ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_WUSER_WIDTH-1:0]             wm_mr_wuser              ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             wm_mr_wlast              ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             wm_mr_wvalid             ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             wm_mr_wready             ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_DATA_WIDTH-1:0]          mi_wdata              ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_DATA_WIDTH/8-1:0]        mi_wstrb              ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_WUSER_WIDTH-1:0]             mi_wuser              ;
  wire [(C_NUM_MASTER_SLOTS+1)*C_AXI_ID_WIDTH-1:0]                mi_wid              ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_wlast              ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_wvalid             ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_wready             ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             w_cmd_push            ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             w_cmd_pop             ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             r_cmd_push            ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             r_cmd_pop             ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_awmaxissuing      ;
  wire [(C_NUM_MASTER_SLOTS+1)*1-1:0]                             mi_armaxissuing      ;
  reg  [(C_NUM_MASTER_SLOTS+1)*8-1:0]                             w_issuing_cnt        ;
  reg  [(C_NUM_MASTER_SLOTS+1)*8-1:0]                             r_issuing_cnt        ;
  reg  [8-1:0]                                                    debug_aw_trans_seq_i    ;
  reg  [8-1:0]                                                    debug_ar_trans_seq_i    ;
  wire [(C_NUM_MASTER_SLOTS+1)*8-1:0]                             debug_w_trans_seq_i     ;
  reg  [(C_NUM_MASTER_SLOTS+1)*8-1:0]                             debug_w_beat_cnt_i      ;

  reg aresetn_d = 1'b0; // Reset delay register
  always @(posedge ACLK) begin
    if (~ARESETN) begin
      aresetn_d <= 1'b0;
    end else begin
      aresetn_d <= ARESETN;
    end
  end
  wire reset;
  assign reset = ~aresetn_d;

  generate
    for (gen_si_slot=0; gen_si_slot<C_NUM_SLAVE_SLOTS; gen_si_slot=gen_si_slot+1) begin : gen_slave_slots
      if (C_S_AXI_SUPPORTS_READ[gen_si_slot]) begin : gen_si_read
        axi_crossbar_v2_1_22_si_transactor #  // "ST": SI Transactor (read channel)
          (
           .C_FAMILY                (C_FAMILY),
           .C_SI                    (gen_si_slot),
           .C_DIR                   (P_READ),
           .C_NUM_ADDR_RANGES       (C_NUM_ADDR_RANGES),
           .C_NUM_M                 (C_NUM_MASTER_SLOTS),
           .C_NUM_M_LOG             (P_NUM_MASTER_SLOTS_LOG),
           .C_ACCEPTANCE            (C_S_AXI_READ_ACCEPTANCE[gen_si_slot*32+:32]),
           .C_ACCEPTANCE_LOG        (C_R_ACCEPT_WIDTH[gen_si_slot*32+:32]),
           .C_ID_WIDTH              (C_AXI_ID_WIDTH),
           .C_THREAD_ID_WIDTH       (C_S_AXI_THREAD_ID_WIDTH[gen_si_slot*32+:32]),
           .C_ADDR_WIDTH            (C_AXI_ADDR_WIDTH),
           .C_AMESG_WIDTH           (P_ST_ARMESG_WIDTH),
           .C_RMESG_WIDTH           (P_ST_RMESG_WIDTH),
           .C_BASE_ID               (C_S_AXI_BASE_ID[gen_si_slot*64+:C_AXI_ID_WIDTH]),
           .C_HIGH_ID               (C_S_AXI_HIGH_ID[gen_si_slot*64+:C_AXI_ID_WIDTH]),
           .C_SINGLE_THREAD         (C_S_AXI_SINGLE_THREAD[gen_si_slot*32+:32]),
           .C_BASE_ADDR             (C_M_AXI_BASE_ADDR),
           .C_HIGH_ADDR             (C_M_AXI_HIGH_ADDR),
           .C_TARGET_QUAL           (P_S_AXI_READ_CONNECTIVITY[gen_si_slot*32+:C_NUM_MASTER_SLOTS]),
           .C_M_AXI_SECURE          (C_M_AXI_SECURE),
           .C_RANGE_CHECK           (C_RANGE_CHECK),
           .C_ADDR_DECODE           (C_ADDR_DECODE),
           .C_ERR_MODE              (C_M_AXI_ERR_MODE),
           .C_DEBUG                 (C_DEBUG)
           )
          si_transactor_ar
            (
             .ACLK                  (ACLK),
             .ARESET                (reset),
             .S_AID                 (f_extend_ID(S_AXI_ARID[gen_si_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH], gen_si_slot)),
             .S_AADDR               (S_AXI_ARADDR[gen_si_slot*C_AXI_ADDR_WIDTH+:C_AXI_ADDR_WIDTH]),
             .S_ALEN                (S_AXI_ARLEN[gen_si_slot*8+:8]),
             .S_ASIZE               (S_AXI_ARSIZE[gen_si_slot*3+:3]),
             .S_ABURST              (S_AXI_ARBURST[gen_si_slot*2+:2]),
             .S_ALOCK               (S_AXI_ARLOCK[gen_si_slot*2+:2]),
             .S_APROT               (S_AXI_ARPROT[gen_si_slot*3+:3]),
//             .S_AREGION             (S_AXI_ARREGION[gen_si_slot*4+:4]),
             .S_AMESG               (si_st_armesg[gen_si_slot*P_ST_ARMESG_WIDTH+:P_ST_ARMESG_WIDTH]),
             .S_AVALID              (S_AXI_ARVALID[gen_si_slot]),
             .S_AREADY              (S_AXI_ARREADY[gen_si_slot]),
             .M_AID                 (st_aa_arid[gen_si_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]),
             .M_AADDR               (st_aa_araddr[gen_si_slot*C_AXI_ADDR_WIDTH+:C_AXI_ADDR_WIDTH]),
             .M_ALEN                (st_aa_arlen[gen_si_slot*8+:8]),
             .M_ASIZE               (st_aa_arsize[gen_si_slot*3+:3]),
             .M_ALOCK               (st_aa_arlock[gen_si_slot*2+:2]),
             .M_APROT               (st_aa_arprot[gen_si_slot*3+:3]),
             .M_AREGION             (st_aa_arregion[gen_si_slot*4+:4]),
             .M_AMESG               (st_tmp_armesg[gen_si_slot*P_ST_ARMESG_WIDTH+:P_ST_ARMESG_WIDTH]),
             .M_ATARGET_HOT         (st_aa_artarget_hot[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+:(C_NUM_MASTER_SLOTS+1)]),
             .M_ATARGET_ENC         (st_aa_artarget_enc[gen_si_slot*(P_NUM_MASTER_SLOTS_LOG+1)+:(P_NUM_MASTER_SLOTS_LOG+1)]),
             .M_AERROR              (st_aa_arerror[gen_si_slot*8+:8]),
             .M_AVALID_QUAL         (st_aa_arvalid_qual[gen_si_slot]),
             .M_AVALID              (st_aa_arvalid[gen_si_slot]),
             .M_AREADY              (st_aa_arready[gen_si_slot]),
             .S_RID                 (S_AXI_RID[gen_si_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]),
             .S_RMESG               (st_si_rmesg[gen_si_slot*P_ST_RMESG_WIDTH+:P_ST_RMESG_WIDTH]),
             .S_RLAST               (S_AXI_RLAST[gen_si_slot]),
             .S_RVALID              (S_AXI_RVALID[gen_si_slot]),
             .S_RREADY              (S_AXI_RREADY[gen_si_slot]),
             .M_RID                 (st_mr_rid),
             .M_RLAST               (st_mr_rlast),
             .M_RMESG               (st_mr_rmesg),
             .M_RVALID              (st_mr_rvalid),
             .M_RREADY              (st_tmp_rready[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+:(C_NUM_MASTER_SLOTS+1)]),
             .M_RTARGET             (st_tmp_rid_target[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+:(C_NUM_MASTER_SLOTS+1)]),
             .DEBUG_A_TRANS_SEQ     (C_DEBUG ? debug_ar_trans_seq_i : 8'h0)
             );
        
        assign si_st_armesg[gen_si_slot*P_ST_ARMESG_WIDTH+:P_ST_ARMESG_WIDTH] = {
          S_AXI_ARUSER[gen_si_slot*C_AXI_ARUSER_WIDTH+:C_AXI_ARUSER_WIDTH],
          S_AXI_ARQOS[gen_si_slot*4+:4],
          S_AXI_ARCACHE[gen_si_slot*4+:4],
          S_AXI_ARBURST[gen_si_slot*2+:2]
          };
        assign tmp_aa_armesg[gen_si_slot*P_AA_ARMESG_WIDTH+:P_AA_ARMESG_WIDTH] = {
          st_tmp_armesg[gen_si_slot*P_ST_ARMESG_WIDTH+:P_ST_ARMESG_WIDTH],
          st_aa_arregion[gen_si_slot*4+:4],
          st_aa_arprot[gen_si_slot*3+:3],
          st_aa_arlock[gen_si_slot*2+:2],
          st_aa_arsize[gen_si_slot*3+:3],
          st_aa_arlen[gen_si_slot*8+:8],
          st_aa_araddr[gen_si_slot*C_AXI_ADDR_WIDTH+:C_AXI_ADDR_WIDTH],
          st_aa_arid[gen_si_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]
          };
        assign S_AXI_RRESP[gen_si_slot*2+:2] = st_si_rmesg[gen_si_slot*P_ST_RMESG_WIDTH+:2];
        assign S_AXI_RUSER[gen_si_slot*C_AXI_RUSER_WIDTH+:C_AXI_RUSER_WIDTH] = st_si_rmesg[gen_si_slot*P_ST_RMESG_WIDTH+2 +: C_AXI_RUSER_WIDTH];
        assign S_AXI_RDATA[gen_si_slot*C_AXI_DATA_WIDTH+:C_AXI_DATA_WIDTH] = st_si_rmesg[gen_si_slot*P_ST_RMESG_WIDTH+2+C_AXI_RUSER_WIDTH +: C_AXI_DATA_WIDTH];
      end else begin : gen_no_si_read
        assign S_AXI_ARREADY[gen_si_slot] = 1'b0;
        assign st_aa_arvalid[gen_si_slot] = 1'b0;
        assign st_aa_arvalid_qual[gen_si_slot] = 1'b1;
        assign tmp_aa_armesg[gen_si_slot*P_AA_ARMESG_WIDTH+:P_AA_ARMESG_WIDTH] = 0;
        assign S_AXI_RID[gen_si_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH] = 0;
        assign S_AXI_RRESP[gen_si_slot*2+:2] = 0;
        assign S_AXI_RUSER[gen_si_slot*C_AXI_RUSER_WIDTH+:C_AXI_RUSER_WIDTH] = 0;
        //assign S_AXI_RDATA[gen_si_slot*C_AXI_DATA_WIDTH+:C_AXI_DATA_WIDTH] = 0;
        assign S_AXI_RDATA[gen_si_slot*C_AXI_DATA_WIDTH+:C_AXI_DATA_WIDTH] = {C_AXI_DATA_WIDTH/32{32'hDEC0_DE1C}};
        assign S_AXI_RVALID[gen_si_slot] = 1'b0;
        assign S_AXI_RLAST[gen_si_slot] = 1'b0;
        assign st_tmp_rready[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+:(C_NUM_MASTER_SLOTS+1)] = 0;
        assign st_aa_artarget_hot[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+:(C_NUM_MASTER_SLOTS+1)] = 0;
      end  // gen_si_read
        
      if (C_S_AXI_SUPPORTS_WRITE[gen_si_slot]) begin : gen_si_write
        axi_crossbar_v2_1_22_si_transactor #  // "ST": SI Transactor (write channel)
          (
           .C_FAMILY                (C_FAMILY),
           .C_SI                    (gen_si_slot),
           .C_DIR                   (P_WRITE),
           .C_NUM_ADDR_RANGES       (C_NUM_ADDR_RANGES),
           .C_NUM_M                 (C_NUM_MASTER_SLOTS),
           .C_NUM_M_LOG             (P_NUM_MASTER_SLOTS_LOG),
           .C_ACCEPTANCE            (C_S_AXI_WRITE_ACCEPTANCE[gen_si_slot*32+:32]),
           .C_ACCEPTANCE_LOG        (C_W_ACCEPT_WIDTH[gen_si_slot*32+:32]),
           .C_ID_WIDTH              (C_AXI_ID_WIDTH),
           .C_THREAD_ID_WIDTH       (C_S_AXI_THREAD_ID_WIDTH[gen_si_slot*32+:32]),
           .C_ADDR_WIDTH            (C_AXI_ADDR_WIDTH),
           .C_AMESG_WIDTH           (P_ST_AWMESG_WIDTH),
           .C_RMESG_WIDTH           (P_ST_BMESG_WIDTH),
           .C_BASE_ID               (C_S_AXI_BASE_ID[gen_si_slot*64+:C_AXI_ID_WIDTH]),
           .C_HIGH_ID               (C_S_AXI_HIGH_ID[gen_si_slot*64+:C_AXI_ID_WIDTH]),
           .C_SINGLE_THREAD         (C_S_AXI_SINGLE_THREAD[gen_si_slot*32+:32]),
           .C_BASE_ADDR             (C_M_AXI_BASE_ADDR),
           .C_HIGH_ADDR             (C_M_AXI_HIGH_ADDR),
           .C_TARGET_QUAL           (P_S_AXI_WRITE_CONNECTIVITY[gen_si_slot*32+:C_NUM_MASTER_SLOTS]),
           .C_M_AXI_SECURE          (C_M_AXI_SECURE),
           .C_RANGE_CHECK           (C_RANGE_CHECK),
           .C_ADDR_DECODE           (C_ADDR_DECODE),
           .C_ERR_MODE              (C_M_AXI_ERR_MODE),
           .C_DEBUG                 (C_DEBUG)
           )
          si_transactor_aw
            (
             .ACLK                  (ACLK),
             .ARESET                (reset),
             .S_AID                 (f_extend_ID(S_AXI_AWID[gen_si_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH], gen_si_slot)),
             .S_AADDR               (S_AXI_AWADDR[gen_si_slot*C_AXI_ADDR_WIDTH+:C_AXI_ADDR_WIDTH]),
             .S_ALEN                (S_AXI_AWLEN[gen_si_slot*8+:8]),
             .S_ASIZE               (S_AXI_AWSIZE[gen_si_slot*3+:3]),
             .S_ABURST              (S_AXI_AWBURST[gen_si_slot*2+:2]),
             .S_ALOCK               (S_AXI_AWLOCK[gen_si_slot*2+:2]),
             .S_APROT               (S_AXI_AWPROT[gen_si_slot*3+:3]),
//             .S_AREGION             (S_AXI_AWREGION[gen_si_slot*4+:4]),
             .S_AMESG               (si_st_awmesg[gen_si_slot*P_ST_AWMESG_WIDTH+:P_ST_AWMESG_WIDTH]),
             .S_AVALID              (S_AXI_AWVALID[gen_si_slot]),
             .S_AREADY              (S_AXI_AWREADY[gen_si_slot]),
             .M_AID                 (st_aa_awid[gen_si_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]),
             .M_AADDR               (st_aa_awaddr[gen_si_slot*C_AXI_ADDR_WIDTH+:C_AXI_ADDR_WIDTH]),
             .M_ALEN                (st_aa_awlen[gen_si_slot*8+:8]),
             .M_ASIZE               (st_aa_awsize[gen_si_slot*3+:3]),
             .M_ALOCK               (st_aa_awlock[gen_si_slot*2+:2]),
             .M_APROT               (st_aa_awprot[gen_si_slot*3+:3]),
             .M_AREGION             (st_aa_awregion[gen_si_slot*4+:4]),
             .M_AMESG               (st_tmp_awmesg[gen_si_slot*P_ST_AWMESG_WIDTH+:P_ST_AWMESG_WIDTH]),
             .M_ATARGET_HOT         (st_aa_awtarget_hot[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+:(C_NUM_MASTER_SLOTS+1)]),
             .M_ATARGET_ENC         (st_aa_awtarget_enc[gen_si_slot*(P_NUM_MASTER_SLOTS_LOG+1)+:(P_NUM_MASTER_SLOTS_LOG+1)]),
             .M_AERROR              (st_aa_awerror[gen_si_slot*8+:8]),
             .M_AVALID_QUAL         (st_aa_awvalid_qual[gen_si_slot]),
             .M_AVALID              (st_ss_awvalid[gen_si_slot]),
             .M_AREADY              (st_ss_awready[gen_si_slot]),
             .S_RID                 (S_AXI_BID[gen_si_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]),
             .S_RMESG               (st_si_bmesg[gen_si_slot*P_ST_BMESG_WIDTH+:P_ST_BMESG_WIDTH]),
             .S_RLAST               (),
             .S_RVALID              (S_AXI_BVALID[gen_si_slot]),
             .S_RREADY              (S_AXI_BREADY[gen_si_slot]),
             .M_RID                 (st_mr_bid),
             .M_RLAST               ({(C_NUM_MASTER_SLOTS+1){1'b1}}),
             .M_RMESG               (st_mr_bmesg),
             .M_RVALID              (st_mr_bvalid),
             .M_RREADY              (st_tmp_bready[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+:(C_NUM_MASTER_SLOTS+1)]),
             .M_RTARGET             (st_tmp_bid_target[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+:(C_NUM_MASTER_SLOTS+1)]),
             .DEBUG_A_TRANS_SEQ     (C_DEBUG ? debug_aw_trans_seq_i : 8'h0)
             );
        
        // Note: Concatenation of mesg signals is from MSB to LSB; assignments that chop mesg signals appear in opposite order.
        assign si_st_awmesg[gen_si_slot*P_ST_AWMESG_WIDTH+:P_ST_AWMESG_WIDTH] = {
          S_AXI_AWUSER[gen_si_slot*C_AXI_AWUSER_WIDTH+:C_AXI_AWUSER_WIDTH],
          S_AXI_AWQOS[gen_si_slot*4+:4],
          S_AXI_AWCACHE[gen_si_slot*4+:4],
          S_AXI_AWBURST[gen_si_slot*2+:2]
          };
        assign tmp_aa_awmesg[gen_si_slot*P_AA_AWMESG_WIDTH+:P_AA_AWMESG_WIDTH] = {
          st_tmp_awmesg[gen_si_slot*P_ST_AWMESG_WIDTH+:P_ST_AWMESG_WIDTH],
          st_aa_awregion[gen_si_slot*4+:4],
          st_aa_awprot[gen_si_slot*3+:3],
          st_aa_awlock[gen_si_slot*2+:2],
          st_aa_awsize[gen_si_slot*3+:3],
          st_aa_awlen[gen_si_slot*8+:8],
          st_aa_awaddr[gen_si_slot*C_AXI_ADDR_WIDTH+:C_AXI_ADDR_WIDTH],
          st_aa_awid[gen_si_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]
          };
        assign S_AXI_BRESP[gen_si_slot*2+:2] = st_si_bmesg[gen_si_slot*P_ST_BMESG_WIDTH+:2];
        assign S_AXI_BUSER[gen_si_slot*C_AXI_BUSER_WIDTH+:C_AXI_BUSER_WIDTH] = st_si_bmesg[gen_si_slot*P_ST_BMESG_WIDTH+2 +: C_AXI_BUSER_WIDTH];
                       
        // AW SI-transactor transfer completes upon completion of both W-router address acceptance (command push) and AW arbitration
        axi_crossbar_v2_1_22_splitter #  // "SS": Splitter from SI-Transactor (write channel)
          (
            .C_NUM_M                (2)
          )
          splitter_aw_si
          (
             .ACLK                  (ACLK),
             .ARESET                (reset),
             .S_VALID              (st_ss_awvalid[gen_si_slot]),
             .S_READY              (st_ss_awready[gen_si_slot]),
             .M_VALID              ({ss_wr_awvalid[gen_si_slot], ss_aa_awvalid[gen_si_slot]}),
             .M_READY              ({ss_wr_awready[gen_si_slot], ss_aa_awready[gen_si_slot]})
          );
      
        axi_crossbar_v2_1_22_wdata_router #  // "WR": Write data Router
          (
           .C_FAMILY                   (C_FAMILY),
           .C_NUM_MASTER_SLOTS         (C_NUM_MASTER_SLOTS+1),
           .C_SELECT_WIDTH             (P_NUM_MASTER_SLOTS_LOG+1),
           .C_WMESG_WIDTH               (P_WR_WMESG_WIDTH),
           .C_FIFO_DEPTH_LOG           (C_W_ACCEPT_WIDTH[gen_si_slot*32+:6])
           )
          wdata_router_w
            (
             .ACLK    (ACLK),
             .ARESET  (reset),
             // Write transfer input from the current SI-slot
             .S_WMESG  (si_wr_wmesg[gen_si_slot*P_WR_WMESG_WIDTH+:P_WR_WMESG_WIDTH]),
             .S_WLAST  (S_AXI_WLAST[gen_si_slot]),
             .S_WVALID (S_AXI_WVALID[gen_si_slot]),
             .S_WREADY (S_AXI_WREADY[gen_si_slot]),
             // Vector of write transfer outputs to each MI-slot's W-mux
             .M_WMESG  (wr_wm_wmesg[gen_si_slot*(P_WR_WMESG_WIDTH)+:P_WR_WMESG_WIDTH]),
             .M_WLAST  (wr_wm_wlast[gen_si_slot]),
             .M_WVALID (wr_tmp_wvalid[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+:(C_NUM_MASTER_SLOTS+1)]),
             .M_WREADY (wr_tmp_wready[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+:(C_NUM_MASTER_SLOTS+1)]),
             // AW command push from local SI-slot
             .S_ASELECT (st_aa_awtarget_enc[gen_si_slot*(P_NUM_MASTER_SLOTS_LOG+1)+:(P_NUM_MASTER_SLOTS_LOG+1)]),  // Target MI-slot
             .S_AVALID  (ss_wr_awvalid[gen_si_slot]),
             .S_AREADY  (ss_wr_awready[gen_si_slot])
             );
             
        assign si_wr_wmesg[gen_si_slot*P_WR_WMESG_WIDTH+:P_WR_WMESG_WIDTH] = {
          ((C_AXI_PROTOCOL == P_AXI3) ? f_extend_ID(S_AXI_WID[gen_si_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH], gen_si_slot) : 1'b0),
          S_AXI_WUSER[gen_si_slot*C_AXI_WUSER_WIDTH+:C_AXI_WUSER_WIDTH],
          S_AXI_WSTRB[gen_si_slot*C_AXI_DATA_WIDTH/8+:C_AXI_DATA_WIDTH/8],
          S_AXI_WDATA[gen_si_slot*C_AXI_DATA_WIDTH+:C_AXI_DATA_WIDTH]
        };        
      end else begin : gen_no_si_write
        assign S_AXI_AWREADY[gen_si_slot] = 1'b0;
        assign ss_aa_awvalid[gen_si_slot] = 1'b0;
        assign st_aa_awvalid_qual[gen_si_slot] = 1'b1;
        assign tmp_aa_awmesg[gen_si_slot*P_AA_AWMESG_WIDTH+:P_AA_AWMESG_WIDTH] = 0;
        assign S_AXI_BID[gen_si_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH] = 0;
        assign S_AXI_BRESP[gen_si_slot*2+:2] = 0;
        assign S_AXI_BUSER[gen_si_slot*C_AXI_BUSER_WIDTH+:C_AXI_BUSER_WIDTH] = 0;
        assign S_AXI_BVALID[gen_si_slot] = 1'b0;
        assign st_tmp_bready[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+:(C_NUM_MASTER_SLOTS+1)] = 0;
        assign S_AXI_WREADY[gen_si_slot] = 1'b0;
        assign wr_wm_wmesg[gen_si_slot*(P_WR_WMESG_WIDTH)+:P_WR_WMESG_WIDTH] = 0;
        assign wr_wm_wlast[gen_si_slot] = 1'b0;
        assign wr_tmp_wvalid[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+:(C_NUM_MASTER_SLOTS+1)] = 0;
        assign st_aa_awtarget_hot[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+:(C_NUM_MASTER_SLOTS+1)] = 0;
      end  // gen_si_write
    end  // gen_slave_slots
    
    for (gen_mi_slot=0; gen_mi_slot<C_NUM_MASTER_SLOTS+1; gen_mi_slot=gen_mi_slot+1) begin : gen_master_slots
      if (P_M_AXI_SUPPORTS_READ[gen_mi_slot]) begin : gen_mi_read
        if (C_NUM_SLAVE_SLOTS>1) begin : gen_rid_decoder
          axi_crossbar_v2_1_22_addr_decoder #
            (
              .C_FAMILY          (C_FAMILY),
              .C_NUM_TARGETS     (C_NUM_SLAVE_SLOTS),
              .C_NUM_TARGETS_LOG (P_NUM_SLAVE_SLOTS_LOG),
              .C_NUM_RANGES      (1),
              .C_ADDR_WIDTH      (C_AXI_ID_WIDTH),
              .C_TARGET_ENC      (C_DEBUG),
              .C_TARGET_HOT      (1),
              .C_REGION_ENC      (0),
              .C_BASE_ADDR       (C_S_AXI_BASE_ID),
              .C_HIGH_ADDR       (C_S_AXI_HIGH_ID),
              .C_TARGET_QUAL     (P_M_AXI_READ_CONNECTIVITY[gen_mi_slot*32+:C_NUM_SLAVE_SLOTS]),
              .C_RESOLUTION      (0)
            ) 
            rid_decoder_inst 
            (
              .ADDR             (st_mr_rid[gen_mi_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]),        
              .TARGET_HOT       (tmp_mr_rid_target[gen_mi_slot*C_NUM_SLAVE_SLOTS+:C_NUM_SLAVE_SLOTS]),  
              .TARGET_ENC       (debug_rid_target_i[gen_mi_slot*P_NUM_SLAVE_SLOTS_LOG+:P_NUM_SLAVE_SLOTS_LOG]),  
              .MATCH            (rid_match[gen_mi_slot]),       
              .REGION           ()      
            );
        end else begin : gen_no_rid_decoder
          assign tmp_mr_rid_target[gen_mi_slot] = 1'b1;  // All response transfers route to solo SI-slot.
          assign rid_match[gen_mi_slot] = 1'b1;
        end
        
        assign st_mr_rmesg[gen_mi_slot*P_ST_RMESG_WIDTH+:P_ST_RMESG_WIDTH] = {
          st_mr_rdata[gen_mi_slot*C_AXI_DATA_WIDTH+:C_AXI_DATA_WIDTH],
          st_mr_ruser[gen_mi_slot*C_AXI_RUSER_WIDTH+:C_AXI_RUSER_WIDTH], 
          st_mr_rresp[gen_mi_slot*2+:2]
          }; 
      end else begin : gen_no_mi_read
        assign tmp_mr_rid_target[gen_mi_slot*C_NUM_SLAVE_SLOTS+:C_NUM_SLAVE_SLOTS] = 0;
        assign rid_match[gen_mi_slot] = 1'b0;
        assign st_mr_rmesg[gen_mi_slot*P_ST_RMESG_WIDTH+:P_ST_RMESG_WIDTH] = 0;
      end  // gen_mi_read
      
      if (P_M_AXI_SUPPORTS_WRITE[gen_mi_slot]) begin : gen_mi_write
        if (C_NUM_SLAVE_SLOTS>1) begin : gen_bid_decoder
          axi_crossbar_v2_1_22_addr_decoder #
            (
              .C_FAMILY          (C_FAMILY),
              .C_NUM_TARGETS     (C_NUM_SLAVE_SLOTS),
              .C_NUM_TARGETS_LOG (P_NUM_SLAVE_SLOTS_LOG),
              .C_NUM_RANGES      (1),
              .C_ADDR_WIDTH      (C_AXI_ID_WIDTH),
              .C_TARGET_ENC      (C_DEBUG),
              .C_TARGET_HOT      (1),
              .C_REGION_ENC      (0),
              .C_BASE_ADDR       (C_S_AXI_BASE_ID),
              .C_HIGH_ADDR       (C_S_AXI_HIGH_ID),
              .C_TARGET_QUAL     (P_M_AXI_WRITE_CONNECTIVITY[gen_mi_slot*32+:C_NUM_SLAVE_SLOTS]),
              .C_RESOLUTION      (0)
            ) 
            bid_decoder_inst 
            (
              .ADDR             (st_mr_bid[gen_mi_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]),        
              .TARGET_HOT       (tmp_mr_bid_target[gen_mi_slot*C_NUM_SLAVE_SLOTS+:C_NUM_SLAVE_SLOTS]),  
              .TARGET_ENC       (debug_bid_target_i[gen_mi_slot*P_NUM_SLAVE_SLOTS_LOG+:P_NUM_SLAVE_SLOTS_LOG]),  
              .MATCH            (bid_match[gen_mi_slot]),       
              .REGION           ()      
            );
        end else begin : gen_no_bid_decoder
          assign tmp_mr_bid_target[gen_mi_slot] = 1'b1;  // All response transfers route to solo SI-slot.
          assign bid_match[gen_mi_slot] = 1'b1;
        end
      
        axi_crossbar_v2_1_22_wdata_mux #  // "WM": Write data Mux, per MI-slot (incl error-handler)
          (
           .C_FAMILY                   (C_FAMILY),
           .C_NUM_SLAVE_SLOTS         (C_NUM_SLAVE_SLOTS),
           .C_SELECT_WIDTH     (P_NUM_SLAVE_SLOTS_LOG),
           .C_WMESG_WIDTH               (P_WR_WMESG_WIDTH),
           .C_FIFO_DEPTH_LOG           (C_W_ISSUE_WIDTH[gen_mi_slot*32+:6])
           )
          wdata_mux_w
            (
             .ACLK    (ACLK),
             .ARESET  (reset),
             // Vector of write transfer inputs from each SI-slot's W-router
             .S_WMESG  (wr_wm_wmesg),
             .S_WLAST  (wr_wm_wlast),
             .S_WVALID (tmp_wm_wvalid[gen_mi_slot*C_NUM_SLAVE_SLOTS+:C_NUM_SLAVE_SLOTS]),
             .S_WREADY (tmp_wm_wready[gen_mi_slot*C_NUM_SLAVE_SLOTS+:C_NUM_SLAVE_SLOTS]),
             // Write transfer output to the current MI-slot
             .M_WMESG  (wm_mr_wmesg[gen_mi_slot*P_WR_WMESG_WIDTH+:P_WR_WMESG_WIDTH]),
             .M_WLAST  (wm_mr_wlast[gen_mi_slot]),
             .M_WVALID (wm_mr_wvalid[gen_mi_slot]),
             .M_WREADY (wm_mr_wready[gen_mi_slot]),
             // AW command push from AW arbiter output
             .S_ASELECT (aa_wm_awgrant_enc),  // SI-slot selected by arbiter
             .S_AVALID  (sa_wm_awvalid[gen_mi_slot]),
             .S_AREADY  (sa_wm_awready[gen_mi_slot])
             );
             
        if (C_DEBUG) begin : gen_debug_w
          // DEBUG WRITE BEAT COUNTER
          always @(posedge ACLK) begin
            if (reset) begin
              debug_w_beat_cnt_i[gen_mi_slot*8+:8] <= 0;
            end else begin
              if (mi_wvalid[gen_mi_slot] & mi_wready[gen_mi_slot]) begin
                if (mi_wlast[gen_mi_slot]) begin
                  debug_w_beat_cnt_i[gen_mi_slot*8+:8] <= 0;
                end else begin
                  debug_w_beat_cnt_i[gen_mi_slot*8+:8] <= debug_w_beat_cnt_i[gen_mi_slot*8+:8] + 1;
                end
              end
            end
          end  // clocked process
  
          // DEBUG W-CHANNEL TRANSACTION SEQUENCE QUEUE
          axi_data_fifo_v2_1_20_axic_srl_fifo #
            (
             .C_FAMILY          (C_FAMILY),
             .C_FIFO_WIDTH      (8),
             .C_FIFO_DEPTH_LOG  (C_W_ISSUE_WIDTH[gen_mi_slot*32+:6]),
             .C_USE_FULL        (0)
             )
            debug_w_seq_fifo
              (
               .ACLK    (ACLK),
               .ARESET  (reset),
               .S_MESG  (debug_aw_trans_seq_i),
               .S_VALID (sa_wm_awvalid[gen_mi_slot]),
               .S_READY (),
               .M_MESG  (debug_w_trans_seq_i[gen_mi_slot*8+:8]),
               .M_VALID (),
               .M_READY (mi_wvalid[gen_mi_slot] & mi_wready[gen_mi_slot] & mi_wlast[gen_mi_slot])
              );
        end  // gen_debug_w
             
        assign wm_mr_wdata[gen_mi_slot*C_AXI_DATA_WIDTH+:C_AXI_DATA_WIDTH] = wm_mr_wmesg[gen_mi_slot*P_WR_WMESG_WIDTH +: C_AXI_DATA_WIDTH];
        assign wm_mr_wstrb[gen_mi_slot*C_AXI_DATA_WIDTH/8+:C_AXI_DATA_WIDTH/8] = wm_mr_wmesg[gen_mi_slot*P_WR_WMESG_WIDTH+C_AXI_DATA_WIDTH +: C_AXI_DATA_WIDTH/8];
        assign wm_mr_wuser[gen_mi_slot*C_AXI_WUSER_WIDTH+:C_AXI_WUSER_WIDTH] = wm_mr_wmesg[gen_mi_slot*P_WR_WMESG_WIDTH+C_AXI_DATA_WIDTH+C_AXI_DATA_WIDTH/8 +: C_AXI_WUSER_WIDTH];
        assign wm_mr_wid[gen_mi_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH] = wm_mr_wmesg[gen_mi_slot*P_WR_WMESG_WIDTH+C_AXI_DATA_WIDTH+(C_AXI_DATA_WIDTH/8)+C_AXI_WUSER_WIDTH +: P_AXI_WID_WIDTH];
        assign st_mr_bmesg[gen_mi_slot*P_ST_BMESG_WIDTH+:P_ST_BMESG_WIDTH] = {
          st_mr_buser[gen_mi_slot*C_AXI_BUSER_WIDTH+:C_AXI_BUSER_WIDTH],
          st_mr_bresp[gen_mi_slot*2+:2]
          }; 
      end else begin : gen_no_mi_write
        assign tmp_mr_bid_target[gen_mi_slot*C_NUM_SLAVE_SLOTS+:C_NUM_SLAVE_SLOTS] = 0;
        assign bid_match[gen_mi_slot] = 1'b0;
        assign wm_mr_wvalid[gen_mi_slot] = 0;
        assign wm_mr_wlast[gen_mi_slot] = 0;
        assign wm_mr_wdata[gen_mi_slot*C_AXI_DATA_WIDTH+:C_AXI_DATA_WIDTH] = 0;
        assign wm_mr_wstrb[gen_mi_slot*C_AXI_DATA_WIDTH/8+:C_AXI_DATA_WIDTH/8] = 0;
        assign wm_mr_wuser[gen_mi_slot*C_AXI_WUSER_WIDTH+:C_AXI_WUSER_WIDTH] = 0;
        assign wm_mr_wid[gen_mi_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH] = 0;
        assign st_mr_bmesg[gen_mi_slot*P_ST_BMESG_WIDTH+:P_ST_BMESG_WIDTH] = 0;
        assign tmp_wm_wready[gen_mi_slot*C_NUM_SLAVE_SLOTS+:C_NUM_SLAVE_SLOTS] = 0;
        assign sa_wm_awready[gen_mi_slot] = 0;
      end  // gen_mi_write
      
      for (gen_si_slot=0; gen_si_slot<C_NUM_SLAVE_SLOTS; gen_si_slot=gen_si_slot+1) begin : gen_trans_si
        // Transpose handshakes from W-router (SxM) to W-mux (MxS).
        assign tmp_wm_wvalid[gen_mi_slot*C_NUM_SLAVE_SLOTS+gen_si_slot] = wr_tmp_wvalid[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+gen_mi_slot];
        assign wr_tmp_wready[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+gen_mi_slot] = tmp_wm_wready[gen_mi_slot*C_NUM_SLAVE_SLOTS+gen_si_slot];
        // Transpose response enables from ID decoders (MxS) to si_transactors (SxM).
        assign st_tmp_bid_target[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+gen_mi_slot] = tmp_mr_bid_target[gen_mi_slot*C_NUM_SLAVE_SLOTS+gen_si_slot];
        assign st_tmp_rid_target[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+gen_mi_slot] = tmp_mr_rid_target[gen_mi_slot*C_NUM_SLAVE_SLOTS+gen_si_slot];
      end  // gen_trans_si
      
      assign bready_carry[gen_mi_slot] =  st_tmp_bready[gen_mi_slot];
      assign rready_carry[gen_mi_slot] =  st_tmp_rready[gen_mi_slot];
      for (gen_si_slot=1; gen_si_slot<C_NUM_SLAVE_SLOTS; gen_si_slot=gen_si_slot+1) begin : gen_resp_carry_si
        assign bready_carry[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+gen_mi_slot] =  // Generate M_BREADY if ...
          bready_carry[(gen_si_slot-1)*(C_NUM_MASTER_SLOTS+1)+gen_mi_slot] |  // For any SI-slot (OR carry-chain across all SI-slots), ...
          st_tmp_bready[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+gen_mi_slot];  // The write SI transactor indicates BREADY for that MI-slot.
        assign rready_carry[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+gen_mi_slot] =  // Generate M_RREADY if ...
          rready_carry[(gen_si_slot-1)*(C_NUM_MASTER_SLOTS+1)+gen_mi_slot] |  // For any SI-slot (OR carry-chain across all SI-slots), ...
          st_tmp_rready[gen_si_slot*(C_NUM_MASTER_SLOTS+1)+gen_mi_slot];  // The write SI transactor indicates RREADY for that MI-slot.
      end  // gen_resp_carry_si
           
      assign w_cmd_push[gen_mi_slot] = mi_awvalid[gen_mi_slot] && mi_awready[gen_mi_slot] && P_M_AXI_SUPPORTS_WRITE[gen_mi_slot];
      assign r_cmd_push[gen_mi_slot] = mi_arvalid[gen_mi_slot] && mi_arready[gen_mi_slot] && P_M_AXI_SUPPORTS_READ[gen_mi_slot];
      assign w_cmd_pop[gen_mi_slot] = st_mr_bvalid[gen_mi_slot] && st_mr_bready[gen_mi_slot] && P_M_AXI_SUPPORTS_WRITE[gen_mi_slot];
      assign r_cmd_pop[gen_mi_slot] = st_mr_rvalid[gen_mi_slot] && st_mr_rready[gen_mi_slot] && st_mr_rlast[gen_mi_slot] && P_M_AXI_SUPPORTS_READ[gen_mi_slot];
      // Disqualify arbitration of SI-slot if targeted MI-slot has reached its issuing limit.
      assign mi_awmaxissuing[gen_mi_slot] = (w_issuing_cnt[gen_mi_slot*8 +: (C_W_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)] == 
          P_M_AXI_WRITE_ISSUING[gen_mi_slot*32 +: (C_W_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)]) & ~w_cmd_pop[gen_mi_slot];
      assign mi_armaxissuing[gen_mi_slot] = (r_issuing_cnt[gen_mi_slot*8 +: (C_R_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)] == 
          P_M_AXI_READ_ISSUING[gen_mi_slot*32 +: (C_R_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)]) & ~r_cmd_pop[gen_mi_slot];
      
      always @(posedge ACLK) begin
        if (reset) begin
          w_issuing_cnt[gen_mi_slot*8+:8] <= 0;  // Some high-order bits remain constant 0
          r_issuing_cnt[gen_mi_slot*8+:8] <= 0;  // Some high-order bits remain constant 0
        end else begin
          if (w_cmd_push[gen_mi_slot] && ~w_cmd_pop[gen_mi_slot]) begin
            w_issuing_cnt[gen_mi_slot*8+:(C_W_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)] <= w_issuing_cnt[gen_mi_slot*8+:(C_W_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)] + 1;
          end else if (w_cmd_pop[gen_mi_slot] && ~w_cmd_push[gen_mi_slot] && (|w_issuing_cnt[gen_mi_slot*8+:(C_W_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)])) begin
            w_issuing_cnt[gen_mi_slot*8+:(C_W_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)] <= w_issuing_cnt[gen_mi_slot*8+:(C_W_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)] - 1;
          end
          if (r_cmd_push[gen_mi_slot] && ~r_cmd_pop[gen_mi_slot]) begin
            r_issuing_cnt[gen_mi_slot*8+:(C_R_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)] <= r_issuing_cnt[gen_mi_slot*8+:(C_R_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)] + 1;
          end else if (r_cmd_pop[gen_mi_slot] && ~r_cmd_push[gen_mi_slot] && (|r_issuing_cnt[gen_mi_slot*8+:(C_R_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)])) begin
            r_issuing_cnt[gen_mi_slot*8+:(C_R_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)] <= r_issuing_cnt[gen_mi_slot*8+:(C_R_ISSUE_WIDTH[gen_mi_slot*32+:6]+1)] - 1;
          end
        end
      end  // Clocked process
      
      // Reg-slice must break combinatorial path from M_BID and M_RID inputs to M_BREADY and M_RREADY outputs.
      //   (See m_rready_i and m_resp_en combinatorial assignments in si_transactor.)
      //   Reg-slice incurs +1 latency, but no bubble-cycles.
      axi_register_slice_v2_1_21_axi_register_slice #  // "MR": MI-side R/B-channel Reg-slice, per MI-slot (pass-through if only 1 SI-slot configured)
        (
          .C_FAMILY                         (C_FAMILY),
          .C_AXI_PROTOCOL                   ((C_AXI_PROTOCOL == P_AXI3) ? P_AXI3 : P_AXI4),
          .C_AXI_ID_WIDTH                   (C_AXI_ID_WIDTH),
          .C_AXI_ADDR_WIDTH                 (1),
          .C_AXI_DATA_WIDTH                 (C_AXI_DATA_WIDTH),
          .C_AXI_SUPPORTS_USER_SIGNALS      (C_AXI_SUPPORTS_USER_SIGNALS),
          .C_AXI_AWUSER_WIDTH               (1),
          .C_AXI_ARUSER_WIDTH               (1),
          .C_AXI_WUSER_WIDTH                (C_AXI_WUSER_WIDTH),
          .C_AXI_RUSER_WIDTH                (C_AXI_RUSER_WIDTH),
          .C_AXI_BUSER_WIDTH                (C_AXI_BUSER_WIDTH),
          .C_REG_CONFIG_AW                  (P_BYPASS),
          .C_REG_CONFIG_AR                  (P_BYPASS),
          .C_REG_CONFIG_W                   (P_BYPASS),
          .C_REG_CONFIG_R                   (P_M_AXI_SUPPORTS_READ[gen_mi_slot] ? P_FWD_REV : P_BYPASS),
          .C_REG_CONFIG_B                   (P_M_AXI_SUPPORTS_WRITE[gen_mi_slot] ? P_SIMPLE : P_BYPASS)
        )
        reg_slice_mi 
        (
          .aresetn                          (ARESETN),
          .aclk                             (ACLK),
          .s_axi_awid                       ({C_AXI_ID_WIDTH{1'b0}}),
          .s_axi_awaddr                     ({1{1'b0}}),
          .s_axi_awlen                      ({((C_AXI_PROTOCOL == P_AXI3) ? 4 : 8){1'b0}}),
          .s_axi_awsize                     ({3{1'b0}}),
          .s_axi_awburst                    ({2{1'b0}}),
          .s_axi_awlock                     ({((C_AXI_PROTOCOL == P_AXI3) ? 2 : 1){1'b0}}),
          .s_axi_awcache                    ({4{1'b0}}),
          .s_axi_awprot                     ({3{1'b0}}),
          .s_axi_awregion                   ({4{1'b0}}),
          .s_axi_awqos                      ({4{1'b0}}),
          .s_axi_awuser                     ({1{1'b0}}),
          .s_axi_awvalid                    ({1{1'b0}}),
          .s_axi_awready                    (),
          .s_axi_wid                        (wm_mr_wid[gen_mi_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]),
          .s_axi_wdata                      (wm_mr_wdata[gen_mi_slot*C_AXI_DATA_WIDTH+:C_AXI_DATA_WIDTH]),
          .s_axi_wstrb                      (wm_mr_wstrb[gen_mi_slot*C_AXI_DATA_WIDTH/8+:C_AXI_DATA_WIDTH/8]),
          .s_axi_wlast                      (wm_mr_wlast[gen_mi_slot]),
          .s_axi_wuser                      (wm_mr_wuser[gen_mi_slot*C_AXI_WUSER_WIDTH+:C_AXI_WUSER_WIDTH]),
          .s_axi_wvalid                     (wm_mr_wvalid[gen_mi_slot]),
          .s_axi_wready                     (wm_mr_wready[gen_mi_slot]),
          .s_axi_bid                        (st_mr_bid[gen_mi_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]         ),
          .s_axi_bresp                      (st_mr_bresp[gen_mi_slot*2+:2]                                 ),
          .s_axi_buser                      (st_mr_buser[gen_mi_slot*C_AXI_BUSER_WIDTH+:C_AXI_BUSER_WIDTH] ),
          .s_axi_bvalid                     (st_mr_bvalid[gen_mi_slot*1+:1]                                ),
          .s_axi_bready                     (st_mr_bready[gen_mi_slot*1+:1]                                ),
          .s_axi_arid                       ({C_AXI_ID_WIDTH{1'b0}}),
          .s_axi_araddr                     ({1{1'b0}}),
          .s_axi_arlen                      ({((C_AXI_PROTOCOL == P_AXI3) ? 4 : 8){1'b0}}),
          .s_axi_arsize                     ({3{1'b0}}),
          .s_axi_arburst                    ({2{1'b0}}),
          .s_axi_arlock                     ({((C_AXI_PROTOCOL == P_AXI3) ? 2 : 1){1'b0}}),
          .s_axi_arcache                    ({4{1'b0}}),
          .s_axi_arprot                     ({3{1'b0}}),
          .s_axi_arregion                   ({4{1'b0}}),
          .s_axi_arqos                      ({4{1'b0}}),
          .s_axi_aruser                     ({1{1'b0}}),
          .s_axi_arvalid                    ({1{1'b0}}),
          .s_axi_arready                    (),
          .s_axi_rid                        (st_mr_rid[gen_mi_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]                          ),
          .s_axi_rdata                      (st_mr_rdata[gen_mi_slot*C_AXI_DATA_WIDTH+:C_AXI_DATA_WIDTH]  ),
          .s_axi_rresp                      (st_mr_rresp[gen_mi_slot*2+:2]                                                  ),
          .s_axi_rlast                      (st_mr_rlast[gen_mi_slot*1+:1]                                                  ),
          .s_axi_ruser                      (st_mr_ruser[gen_mi_slot*C_AXI_RUSER_WIDTH+:C_AXI_RUSER_WIDTH]                  ),
          .s_axi_rvalid                     (st_mr_rvalid[gen_mi_slot*1+:1]                                                 ),
          .s_axi_rready                     (st_mr_rready[gen_mi_slot*1+:1]                                                 ),
          .m_axi_awid                       (),
          .m_axi_awaddr                     (),
          .m_axi_awlen                      (),
          .m_axi_awsize                     (),
          .m_axi_awburst                    (),
          .m_axi_awlock                     (),
          .m_axi_awcache                    (),
          .m_axi_awprot                     (),
          .m_axi_awregion                   (),
          .m_axi_awqos                      (),
          .m_axi_awuser                     (),
          .m_axi_awvalid                    (),
          .m_axi_awready                    ({1{1'b0}}),
          .m_axi_wid                        (mi_wid[gen_mi_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]),
          .m_axi_wdata                      (mi_wdata[gen_mi_slot*C_AXI_DATA_WIDTH+:C_AXI_DATA_WIDTH]),
          .m_axi_wstrb                      (mi_wstrb[gen_mi_slot*C_AXI_DATA_WIDTH/8+:C_AXI_DATA_WIDTH/8]),
          .m_axi_wlast                      (mi_wlast[gen_mi_slot]),
          .m_axi_wuser                      (mi_wuser[gen_mi_slot*C_AXI_WUSER_WIDTH+:C_AXI_WUSER_WIDTH]),
          .m_axi_wvalid                     (mi_wvalid[gen_mi_slot]),
          .m_axi_wready                     (mi_wready[gen_mi_slot]),
          .m_axi_bid                        (mi_bid[gen_mi_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]                          ),
          .m_axi_bresp                      (mi_bresp[gen_mi_slot*2+:2]                                                  ),
          .m_axi_buser                      (mi_buser[gen_mi_slot*C_AXI_BUSER_WIDTH+:C_AXI_BUSER_WIDTH]                  ),
          .m_axi_bvalid                     (mi_bvalid[gen_mi_slot*1+:1]                                                 ),
          .m_axi_bready                     (mi_bready[gen_mi_slot*1+:1]                                                 ),
          .m_axi_arid                       (),
          .m_axi_araddr                     (),
          .m_axi_arlen                      (),
          .m_axi_arsize                     (),
          .m_axi_arburst                    (),
          .m_axi_arlock                     (),
          .m_axi_arcache                    (),
          .m_axi_arprot                     (),
          .m_axi_arregion                   (),
          .m_axi_arqos                      (),
          .m_axi_aruser                     (),
          .m_axi_arvalid                    (),
          .m_axi_arready                    ({1{1'b0}}),
          .m_axi_rid                        (mi_rid[gen_mi_slot*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]                          ),
          .m_axi_rdata                      (mi_rdata[gen_mi_slot*C_AXI_DATA_WIDTH+:C_AXI_DATA_WIDTH]  ),
          .m_axi_rresp                      (mi_rresp[gen_mi_slot*2+:2]                                                  ),
          .m_axi_rlast                      (mi_rlast[gen_mi_slot*1+:1]                                                  ),
          .m_axi_ruser                      (mi_ruser[gen_mi_slot*C_AXI_RUSER_WIDTH+:C_AXI_RUSER_WIDTH]                  ),
          .m_axi_rvalid                     (mi_rvalid[gen_mi_slot*1+:1]                                                 ),
          .m_axi_rready                     (mi_rready[gen_mi_slot*1+:1]                                                 )
        );
    end  // gen_master_slots (Next gen_mi_slot)
  
    // Highest row of *ready_carry contains accumulated OR across all SI-slots, for each MI-slot.
    assign st_mr_bready = bready_carry[(C_NUM_SLAVE_SLOTS-1)*(C_NUM_MASTER_SLOTS+1) +: C_NUM_MASTER_SLOTS+1]; 
    assign st_mr_rready = rready_carry[(C_NUM_SLAVE_SLOTS-1)*(C_NUM_MASTER_SLOTS+1) +: C_NUM_MASTER_SLOTS+1]; 
    // Assign MI-side B, R and W channel ports (exclude error handler signals).
    assign mi_bid[0+:C_NUM_MASTER_SLOTS*C_AXI_ID_WIDTH] = M_AXI_BID;
    assign mi_bvalid[0+:C_NUM_MASTER_SLOTS] = M_AXI_BVALID; 
    assign mi_bresp[0+:C_NUM_MASTER_SLOTS*2] = M_AXI_BRESP;
    assign mi_buser[0+:C_NUM_MASTER_SLOTS*C_AXI_BUSER_WIDTH] = M_AXI_BUSER;
    assign M_AXI_BREADY = mi_bready[0+:C_NUM_MASTER_SLOTS];
    assign mi_rid[0+:C_NUM_MASTER_SLOTS*C_AXI_ID_WIDTH] = M_AXI_RID;
    assign mi_rlast[0+:C_NUM_MASTER_SLOTS] = M_AXI_RLAST; 
    assign mi_rvalid[0+:C_NUM_MASTER_SLOTS] = M_AXI_RVALID; 
    assign mi_rresp[0+:C_NUM_MASTER_SLOTS*2] = M_AXI_RRESP;
    assign mi_ruser[0+:C_NUM_MASTER_SLOTS*C_AXI_RUSER_WIDTH] = M_AXI_RUSER;
    assign mi_rdata[0+:C_NUM_MASTER_SLOTS*C_AXI_DATA_WIDTH] = M_AXI_RDATA;
    assign M_AXI_RREADY = mi_rready[0+:C_NUM_MASTER_SLOTS];
    assign M_AXI_WLAST = mi_wlast[0+:C_NUM_MASTER_SLOTS];
    assign M_AXI_WVALID = mi_wvalid[0+:C_NUM_MASTER_SLOTS];
    assign M_AXI_WUSER = mi_wuser[0+:C_NUM_MASTER_SLOTS*C_AXI_WUSER_WIDTH];
    assign M_AXI_WID = (C_AXI_PROTOCOL == P_AXI3) ? mi_wid[0+:C_NUM_MASTER_SLOTS*C_AXI_ID_WIDTH] : 0;
    assign M_AXI_WDATA = mi_wdata[0+:C_NUM_MASTER_SLOTS*C_AXI_DATA_WIDTH];
    assign M_AXI_WSTRB = mi_wstrb[0+:C_NUM_MASTER_SLOTS*C_AXI_DATA_WIDTH/8];
    assign mi_wready[0+:C_NUM_MASTER_SLOTS] = M_AXI_WREADY;

    axi_crossbar_v2_1_22_addr_arbiter #  // "AA": Addr Arbiter (AW channel)
      (
       .C_FAMILY                (C_FAMILY),
       .C_NUM_M                 (C_NUM_MASTER_SLOTS+1),
       .C_NUM_S                 (C_NUM_SLAVE_SLOTS),
       .C_NUM_S_LOG             (P_NUM_SLAVE_SLOTS_LOG),
       .C_MESG_WIDTH            (P_AA_AWMESG_WIDTH),
       .C_ARB_PRIORITY          (C_S_AXI_ARB_PRIORITY)
       )
      addr_arbiter_aw
        (
         .ACLK                  (ACLK),
         .ARESET                (reset),
         // Vector of SI-side AW command request inputs
         .S_MESG                (tmp_aa_awmesg),
         .S_TARGET_HOT          (st_aa_awtarget_hot),
         .S_VALID               (ss_aa_awvalid),
         .S_VALID_QUAL          (st_aa_awvalid_qual),
         .S_READY               (ss_aa_awready),
         // Granted AW command output
         .M_MESG                (aa_mi_awmesg),
         .M_TARGET_HOT          (aa_mi_awtarget_hot),  // MI-slot targeted by granted command
         .M_GRANT_ENC           (aa_wm_awgrant_enc),  // SI-slot index of granted command
         .M_VALID               (aa_sa_awvalid),
         .M_READY               (aa_sa_awready),
         .ISSUING_LIMIT        (mi_awmaxissuing)
        );
         
    // Broadcast AW transfer payload to all MI-slots
    assign M_AXI_AWID        = {C_NUM_MASTER_SLOTS{aa_mi_awmesg[0+:C_AXI_ID_WIDTH]}};
    assign M_AXI_AWADDR      = {C_NUM_MASTER_SLOTS{aa_mi_awmesg[C_AXI_ID_WIDTH+:C_AXI_ADDR_WIDTH]}};
    assign M_AXI_AWLEN       = {C_NUM_MASTER_SLOTS{aa_mi_awmesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH +:8]}};
    assign M_AXI_AWSIZE      = {C_NUM_MASTER_SLOTS{aa_mi_awmesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8 +:3]}};
    assign M_AXI_AWLOCK      = {C_NUM_MASTER_SLOTS{aa_mi_awmesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3 +:2]}};
    assign M_AXI_AWPROT      = {C_NUM_MASTER_SLOTS{aa_mi_awmesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3+2 +:3]}};
    assign M_AXI_AWREGION    = {C_NUM_MASTER_SLOTS{aa_mi_awmesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3+2+3 +:4]}};
    assign M_AXI_AWBURST     = {C_NUM_MASTER_SLOTS{aa_mi_awmesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3+2+3+4 +:2]}};
    assign M_AXI_AWCACHE     = {C_NUM_MASTER_SLOTS{aa_mi_awmesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3+2+3+4+2 +:4]}};
    assign M_AXI_AWQOS       = {C_NUM_MASTER_SLOTS{aa_mi_awmesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3+2+3+4+2+4 +:4]}};
    assign M_AXI_AWUSER      = {C_NUM_MASTER_SLOTS{aa_mi_awmesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3+2+3+4+2+4+4 +:C_AXI_AWUSER_WIDTH]}};
         
    axi_crossbar_v2_1_22_addr_arbiter #  // "AA": Addr Arbiter (AR channel)
      (
       .C_FAMILY                (C_FAMILY),
       .C_NUM_M                 (C_NUM_MASTER_SLOTS+1),
       .C_NUM_S                 (C_NUM_SLAVE_SLOTS),
       .C_NUM_S_LOG             (P_NUM_SLAVE_SLOTS_LOG),
       .C_MESG_WIDTH            (P_AA_ARMESG_WIDTH),
       .C_ARB_PRIORITY          (C_S_AXI_ARB_PRIORITY)
       )
      addr_arbiter_ar
        (
         .ACLK                  (ACLK),
         .ARESET                (reset),
         // Vector of SI-side AR command request inputs
         .S_MESG                (tmp_aa_armesg),
         .S_TARGET_HOT          (st_aa_artarget_hot),
         .S_VALID_QUAL          (st_aa_arvalid_qual),
         .S_VALID               (st_aa_arvalid),
         .S_READY               (st_aa_arready),
         // Granted AR command output
         .M_MESG                (aa_mi_armesg),
         .M_TARGET_HOT          (aa_mi_artarget_hot),  // MI-slot targeted by granted command
         .M_GRANT_ENC           (aa_mi_argrant_enc),
         .M_VALID               (aa_mi_arvalid),  // SI-slot index of granted command
         .M_READY               (aa_mi_arready),
         .ISSUING_LIMIT        (mi_armaxissuing)
        );
    
    if (C_DEBUG) begin : gen_debug_trans_seq
      // DEBUG WRITE TRANSACTION SEQUENCE COUNTER
      always @(posedge ACLK) begin
        if (reset) begin
          debug_aw_trans_seq_i <= 1;
        end else begin
          if (aa_sa_awvalid && aa_sa_awready) begin
            debug_aw_trans_seq_i <= debug_aw_trans_seq_i + 1;
          end
        end
      end
  
      // DEBUG READ TRANSACTION SEQUENCE COUNTER
      always @(posedge ACLK) begin
        if (reset) begin
          debug_ar_trans_seq_i <= 1;
        end else begin
          if (aa_mi_arvalid && aa_mi_arready) begin
            debug_ar_trans_seq_i <= debug_ar_trans_seq_i + 1;
          end
        end
      end
    end  // gen_debug_trans_seq

    // Broadcast AR transfer payload to all MI-slots
    assign M_AXI_ARID        = {C_NUM_MASTER_SLOTS{aa_mi_armesg[0+:C_AXI_ID_WIDTH]}};
    assign M_AXI_ARADDR      = {C_NUM_MASTER_SLOTS{aa_mi_armesg[C_AXI_ID_WIDTH+:C_AXI_ADDR_WIDTH]}};
    assign M_AXI_ARLEN       = {C_NUM_MASTER_SLOTS{aa_mi_armesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH +:8]}};
    assign M_AXI_ARSIZE      = {C_NUM_MASTER_SLOTS{aa_mi_armesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8 +:3]}};
    assign M_AXI_ARLOCK      = {C_NUM_MASTER_SLOTS{aa_mi_armesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3 +:2]}};
    assign M_AXI_ARPROT      = {C_NUM_MASTER_SLOTS{aa_mi_armesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3+2 +:3]}};
    assign M_AXI_ARREGION    = {C_NUM_MASTER_SLOTS{aa_mi_armesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3+2+3 +:4]}};
    assign M_AXI_ARBURST     = {C_NUM_MASTER_SLOTS{aa_mi_armesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3+2+3+4 +:2]}};
    assign M_AXI_ARCACHE     = {C_NUM_MASTER_SLOTS{aa_mi_armesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3+2+3+4+2 +:4]}};
    assign M_AXI_ARQOS       = {C_NUM_MASTER_SLOTS{aa_mi_armesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3+2+3+4+2+4 +:4]}};
    assign M_AXI_ARUSER      = {C_NUM_MASTER_SLOTS{aa_mi_armesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH+8+3+2+3+4+2+4+4 +:C_AXI_ARUSER_WIDTH]}};
         
    // AW arbiter command transfer completes upon completion of both M-side AW-channel transfer and W-mux address acceptance (command push).
    axi_crossbar_v2_1_22_splitter #  // "SA": Splitter for Write Addr Arbiter
      (
        .C_NUM_M                (2)
      )
      splitter_aw_mi
      (
         .ACLK                  (ACLK),
         .ARESET                (reset),
         .S_VALID              (aa_sa_awvalid),
         .S_READY              (aa_sa_awready),
         .M_VALID              ({mi_awvalid_en, sa_wm_awvalid_en}),
         .M_READY              ({mi_awready_mux, sa_wm_awready_mux})
      );
      
    assign mi_awvalid = aa_mi_awtarget_hot & {C_NUM_MASTER_SLOTS+1{mi_awvalid_en}};
    assign mi_awready_mux = |(aa_mi_awtarget_hot & mi_awready);
    assign M_AXI_AWVALID = mi_awvalid[0+:C_NUM_MASTER_SLOTS];  // Slot C_NUM_MASTER_SLOTS+1 is the error handler
    assign mi_awready[0+:C_NUM_MASTER_SLOTS] = M_AXI_AWREADY;
    assign sa_wm_awvalid = aa_mi_awtarget_hot & {C_NUM_MASTER_SLOTS+1{sa_wm_awvalid_en}};
    assign sa_wm_awready_mux = |(aa_mi_awtarget_hot & sa_wm_awready);
    
    assign mi_arvalid = aa_mi_artarget_hot & {C_NUM_MASTER_SLOTS+1{aa_mi_arvalid}};
    assign aa_mi_arready = |(aa_mi_artarget_hot & mi_arready);
    assign M_AXI_ARVALID = mi_arvalid[0+:C_NUM_MASTER_SLOTS];  // Slot C_NUM_MASTER_SLOTS+1 is the error handler
    assign mi_arready[0+:C_NUM_MASTER_SLOTS] = M_AXI_ARREADY;
    
    // MI-slot # C_NUM_MASTER_SLOTS is the error handler
    if (C_RANGE_CHECK) begin : gen_decerr_slave
      axi_crossbar_v2_1_22_decerr_slave #
        (
         .C_AXI_ID_WIDTH                 (C_AXI_ID_WIDTH),
         .C_AXI_DATA_WIDTH               (C_AXI_DATA_WIDTH),
         .C_AXI_RUSER_WIDTH                (C_AXI_RUSER_WIDTH),
         .C_AXI_BUSER_WIDTH                (C_AXI_BUSER_WIDTH),
         .C_AXI_PROTOCOL                 (C_AXI_PROTOCOL),
         .C_RESP                         (P_DECERR) 
        )
        decerr_slave_inst
          (
           .S_AXI_ACLK (ACLK),
           .S_AXI_ARESET (reset),
           .S_AXI_AWID (aa_mi_awmesg[0+:C_AXI_ID_WIDTH]),
           .S_AXI_AWVALID (mi_awvalid[C_NUM_MASTER_SLOTS]),
           .S_AXI_AWREADY (mi_awready[C_NUM_MASTER_SLOTS]),
           .S_AXI_WLAST (mi_wlast[C_NUM_MASTER_SLOTS]),
           .S_AXI_WVALID (mi_wvalid[C_NUM_MASTER_SLOTS]),
           .S_AXI_WREADY (mi_wready[C_NUM_MASTER_SLOTS]),
           .S_AXI_BID (mi_bid[C_NUM_MASTER_SLOTS*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]),
           .S_AXI_BRESP (mi_bresp[C_NUM_MASTER_SLOTS*2+:2]),
           .S_AXI_BUSER (mi_buser[C_NUM_MASTER_SLOTS*C_AXI_BUSER_WIDTH+:C_AXI_BUSER_WIDTH]),
           .S_AXI_BVALID (mi_bvalid[C_NUM_MASTER_SLOTS]),
           .S_AXI_BREADY (mi_bready[C_NUM_MASTER_SLOTS]),
           .S_AXI_ARID (aa_mi_armesg[0+:C_AXI_ID_WIDTH]),
           .S_AXI_ARLEN (aa_mi_armesg[C_AXI_ID_WIDTH+C_AXI_ADDR_WIDTH +:8]),
           .S_AXI_ARVALID (mi_arvalid[C_NUM_MASTER_SLOTS]),
           .S_AXI_ARREADY (mi_arready[C_NUM_MASTER_SLOTS]),
           .S_AXI_RID (mi_rid[C_NUM_MASTER_SLOTS*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]),
           .S_AXI_RDATA (mi_rdata[C_NUM_MASTER_SLOTS*C_AXI_DATA_WIDTH+:C_AXI_DATA_WIDTH]),
           .S_AXI_RRESP (mi_rresp[C_NUM_MASTER_SLOTS*2+:2]),
           .S_AXI_RUSER (mi_ruser[C_NUM_MASTER_SLOTS*C_AXI_RUSER_WIDTH+:C_AXI_RUSER_WIDTH]),
           .S_AXI_RLAST (mi_rlast[C_NUM_MASTER_SLOTS]),
           .S_AXI_RVALID (mi_rvalid[C_NUM_MASTER_SLOTS]),
           .S_AXI_RREADY (mi_rready[C_NUM_MASTER_SLOTS])
         );
    end else begin : gen_no_decerr_slave
      assign mi_awready[C_NUM_MASTER_SLOTS] = 1'b0;
      assign mi_wready[C_NUM_MASTER_SLOTS] = 1'b0;
      assign mi_arready[C_NUM_MASTER_SLOTS] = 1'b0;
      assign mi_awready[C_NUM_MASTER_SLOTS] = 1'b0;
      assign mi_awready[C_NUM_MASTER_SLOTS] = 1'b0;
      assign mi_bid[C_NUM_MASTER_SLOTS*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]                    = 0;
      assign mi_bresp[C_NUM_MASTER_SLOTS*2+:2]                                            = 0;
      assign mi_buser[C_NUM_MASTER_SLOTS*C_AXI_BUSER_WIDTH+:C_AXI_BUSER_WIDTH]            = 0;
      assign mi_bvalid[C_NUM_MASTER_SLOTS]                                                = 1'b0;
      assign mi_rid[C_NUM_MASTER_SLOTS*C_AXI_ID_WIDTH+:C_AXI_ID_WIDTH]                    = 0;
      assign mi_rdata[C_NUM_MASTER_SLOTS*C_AXI_DATA_WIDTH+:C_AXI_DATA_WIDTH] = 0; 
      assign mi_rresp[C_NUM_MASTER_SLOTS*2+:2]                                            = 0; 
      assign mi_ruser[C_NUM_MASTER_SLOTS*C_AXI_RUSER_WIDTH+:C_AXI_RUSER_WIDTH]            = 0; 
      assign mi_rlast[C_NUM_MASTER_SLOTS]                                                  = 1'b0;
      assign mi_rvalid[C_NUM_MASTER_SLOTS]                                                 = 1'b0;
    end  // gen_decerr_slave
  endgenerate

endmodule




// -- (c) Copyright 2009 - 2011 Xilinx, Inc. All rights reserved.
// --
// -- This file contains confidential and proprietary information
// -- of Xilinx, Inc. and is protected under U.S. and 
// -- international copyright and other intellectual property
// -- laws.
// --
// -- DISCLAIMER
// -- This disclaimer is not a license and does not grant any
// -- rights to the materials distributed herewith. Except as
// -- otherwise provided in a valid license issued to you by
// -- Xilinx, and to the maximum extent permitted by applicable
// -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// -- (2) Xilinx shall not be liable (whether in contract or tort,
// -- including negligence, or under any other theory of
// -- liability) for any loss or damage of any kind or nature
// -- related to, arising under or in connection with these
// -- materials, including for any direct, or any indirect,
// -- special, incidental, or consequential loss or damage
// -- (including loss of data, profits, goodwill, or any type of
// -- loss or damage suffered as a result of any action brought
// -- by a third party) even if such damage or loss was
// -- reasonably foreseeable or Xilinx had been advised of the
// -- possibility of the same.
// --
// -- CRITICAL APPLICATIONS
// -- Xilinx products are not designed or intended to be fail-
// -- safe, or for use in any application requiring fail-safe
// -- performance, such as life-support or safety devices or
// -- systems, Class III medical devices, nuclear facilities,
// -- applications related to the deployment of airbags, or any
// -- other applications that could lead to death, personal
// -- injury, or severe property or environmental damage
// -- (individually and collectively, "Critical
// -- Applications"). Customer assumes the sole risk and
// -- liability of any use of Xilinx products in Critical
// -- Applications, subject only to applicable laws and
// -- regulations governing limitations on product liability.
// --
// -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// -- PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------------------
//
// File name: si_transactor.v
//
// Description: 
//   This module manages multi-threaded transactions for one SI-slot.
//   The module interface consists of a 1-slave to 1-master address channel, plus a
//     (M+1)-master (from M MI-slots plus error handler) to 1-slave response channel.
//   The module maintains transaction thread control registers that count the
//     number of outstanding transations for each thread and the target MI-slot.
//   On the address channel, the module decodes addresses to select among MI-slots 
//     accessible to the SI-slot where it is instantiated.
//     It then qualifies whether each received transaction
//     should be propagated as a request to the address channel arbiter.
//     Transactions are blocked while there is any outstanding transaction to a 
//     different slave (MI-slot) for the requested ID thread (for deadlock avoidance).
//   On the response channel, the module mulitplexes transfers from each of the 
//     MI-slots whenever a transfer targets the ID of an active thread,
//     arbitrating between MI-slots if multiple threads respond concurrently.
//
//--------------------------------------------------------------------------
//
// Structure:
//    si_transactor
//      addr_decoder
//        comparator_static
//      mux_enc
//      axic_srl_fifo
//      arbiter_resp
//      
//-----------------------------------------------------------------------------
`timescale 1ps/1ps
`default_nettype none

(* DowngradeIPIdentifiedWarnings="yes" *) 
module axi_crossbar_v2_1_22_si_transactor #
  (
   parameter         C_FAMILY                       = "none", 
   parameter integer C_SI             =   0, // SI-slot number of current instance.
   parameter integer C_DIR             =   0, // Direction: 0 = Write; 1 = Read.
   parameter integer C_NUM_ADDR_RANGES = 1,
   parameter integer C_NUM_M             =   2, 
   parameter integer C_NUM_M_LOG             =   1, 
   parameter integer C_ACCEPTANCE             =   1,  // Acceptance limit of this SI-slot.
   parameter integer C_ACCEPTANCE_LOG             =   0,  // Width of acceptance counter for this SI-slot.
   parameter integer C_ID_WIDTH                   = 1, 
   parameter integer C_THREAD_ID_WIDTH                  = 0,
   parameter integer C_ADDR_WIDTH                 = 32, 
   parameter integer C_AMESG_WIDTH = 1,  // Used for AW or AR channel payload, depending on instantiation.
   parameter integer C_RMESG_WIDTH = 1,  // Used for B or R channel payload, depending on instantiation.
   parameter [C_ID_WIDTH-1:0]  C_BASE_ID                  = {C_ID_WIDTH{1'b0}},
   parameter [C_ID_WIDTH-1:0]  C_HIGH_ID                  = {C_ID_WIDTH{1'b0}},
   parameter [C_NUM_M*C_NUM_ADDR_RANGES*64-1:0] C_BASE_ADDR = {C_NUM_M*C_NUM_ADDR_RANGES*64{1'b1}}, 
   parameter [C_NUM_M*C_NUM_ADDR_RANGES*64-1:0] C_HIGH_ADDR = {C_NUM_M*C_NUM_ADDR_RANGES*64{1'b0}}, 
   parameter integer C_SINGLE_THREAD             =   0,
   parameter [C_NUM_M-1:0]    C_TARGET_QUAL                 = {C_NUM_M{1'b1}},
   parameter [C_NUM_M*32-1:0] C_M_AXI_SECURE                   = {C_NUM_M{32'h00000000}},
   parameter integer C_RANGE_CHECK                    = 0,
   parameter integer C_ADDR_DECODE           =0,
   parameter [C_NUM_M*32-1:0] C_ERR_MODE            = {C_NUM_M{32'h00000000}},
   parameter integer C_DEBUG                = 1
   )
  (
   // Global Signals
   input  wire                                                    ACLK,
   input  wire                                                    ARESET,
   // Slave Address Channel Interface Ports
   input  wire [C_ID_WIDTH-1:0]           S_AID,
   input  wire [C_ADDR_WIDTH-1:0]          S_AADDR,
   input  wire [8-1:0]                    S_ALEN,
   input  wire [3-1:0]                    S_ASIZE,
   input  wire [2-1:0]                    S_ABURST,
   input  wire [2-1:0]                    S_ALOCK,
   input  wire [3-1:0]                    S_APROT,
//   input  wire [4-1:0]                    S_AREGION,
   input  wire [C_AMESG_WIDTH-1:0]         S_AMESG,
   input  wire                             S_AVALID,
   output wire                             S_AREADY,
   // Master Address Channel Interface Ports
   output wire [C_ID_WIDTH-1:0]          M_AID,
   output wire [C_ADDR_WIDTH-1:0]          M_AADDR,
   output  wire [8-1:0]                    M_ALEN,
   output  wire [3-1:0]                    M_ASIZE,
   output  wire [2-1:0]                    M_ALOCK,
   output  wire [3-1:0]                    M_APROT,
   output wire [4-1:0]                         M_AREGION,
   output wire [C_AMESG_WIDTH-1:0]                         M_AMESG,
   output wire [(C_NUM_M+1)-1:0]                         M_ATARGET_HOT,
   output wire [(C_NUM_M_LOG+1)-1:0]                         M_ATARGET_ENC,
   output wire [7:0]                         M_AERROR,
   output wire                            M_AVALID_QUAL,
   output wire                            M_AVALID,
   input  wire                            M_AREADY,
   // Slave Response Channel Interface Ports
   output  wire [C_ID_WIDTH-1:0]           S_RID,
   output  wire [C_RMESG_WIDTH-1:0]         S_RMESG,
   output  wire                             S_RLAST,
   output  wire                             S_RVALID,
   input wire                             S_RREADY,
   // Master Response Channel Interface Ports
   input wire [(C_NUM_M+1)*C_ID_WIDTH-1:0]          M_RID,
   input wire [(C_NUM_M+1)*C_RMESG_WIDTH-1:0]             M_RMESG,
   input wire [(C_NUM_M+1)-1:0]                           M_RLAST,
   input wire [(C_NUM_M+1)-1:0]                           M_RVALID,
   output  wire [(C_NUM_M+1)-1:0]                           M_RREADY,
   input wire [(C_NUM_M+1)-1:0]           M_RTARGET,  // Does response ID from each MI-slot target this SI slot?
   input wire [8-1:0]                        DEBUG_A_TRANS_SEQ
   );

  localparam integer P_WRITE = 0;
  localparam integer P_READ = 1;
  localparam integer P_RMUX_MESG_WIDTH = C_ID_WIDTH + C_RMESG_WIDTH + 1;
  localparam [31:0]   P_AXILITE_ERRMODE = 32'h00000001;
  localparam integer P_NONSECURE_BIT = 1; 
  localparam integer P_NUM_M_LOG_M1 = C_NUM_M_LOG ? C_NUM_M_LOG : 1;
  localparam [C_NUM_M-1:0] P_M_AXILITE = f_m_axilite(0);  // Mask of AxiLite MI-slots
  localparam [1:0]   P_FIXED = 2'b00;
  localparam integer P_NUM_M_DE_LOG = f_ceil_log2(C_NUM_M+1);
  localparam integer P_THREAD_ID_WIDTH_M1 = (C_THREAD_ID_WIDTH > 0) ? C_THREAD_ID_WIDTH : 1; 
  localparam integer P_NUM_ID_VAL = 2**C_THREAD_ID_WIDTH;
  localparam integer P_NUM_THREADS = (P_NUM_ID_VAL < C_ACCEPTANCE) ? P_NUM_ID_VAL : C_ACCEPTANCE;
  localparam [C_NUM_M-1:0] P_M_SECURE_MASK = f_bit32to1_mi(C_M_AXI_SECURE);  // Mask of secure MI-slots
  
  // Ceiling of log2(x)
  function integer f_ceil_log2
    (
     input integer x
     );
    integer acc;
    begin
      acc=0;
      while ((2**acc) < x)
        acc = acc + 1;
      f_ceil_log2 = acc;
    end
  endfunction

  // AxiLite protocol flag vector      
  function [C_NUM_M-1:0] f_m_axilite
    (
      input integer null_arg
    );
    integer mi;
    begin
      for (mi=0; mi<C_NUM_M; mi=mi+1) begin
        f_m_axilite[mi] = (C_ERR_MODE[mi*32+:32] == P_AXILITE_ERRMODE);
      end
    end
  endfunction

  // Convert Bit32 vector of range [0,1] to Bit1 vector on MI
  function [C_NUM_M-1:0] f_bit32to1_mi
    (input [C_NUM_M*32-1:0] vec32);
    integer mi;
    begin
      for (mi=0; mi<C_NUM_M; mi=mi+1) begin
        f_bit32to1_mi[mi] = vec32[mi*32];
      end
    end
  endfunction
  
  wire [C_NUM_M-1:0] target_mi_hot;
  wire [P_NUM_M_LOG_M1-1:0] target_mi_enc;
  wire [(C_NUM_M+1)-1:0] m_atarget_hot_i;
  wire [(P_NUM_M_DE_LOG)-1:0] m_atarget_enc_i;
  wire match;
  wire [3:0] target_region;
  wire [3:0] m_aregion_i;
  wire m_avalid_i;
  wire s_aready_i;
  wire any_error;
  wire s_rvalid_i;
  wire [C_ID_WIDTH-1:0] s_rid_i;
  wire s_rlast_i;
  wire [P_RMUX_MESG_WIDTH-1:0] si_rmux_mesg;
  wire [(C_NUM_M+1)*P_RMUX_MESG_WIDTH-1:0] mi_rmux_mesg;
  wire [(C_NUM_M+1)-1:0] m_rvalid_qual;
  wire [(C_NUM_M+1)-1:0] m_rready_arb;
  wire [(C_NUM_M+1)-1:0] m_rready_i;
  wire target_secure;
  wire target_axilite;
  wire m_avalid_qual_i;
  wire [7:0] m_aerror_i;
  
  genvar gen_mi;
  genvar gen_thread;
    
  generate
    if (C_ADDR_DECODE) begin : gen_addr_decoder
      axi_crossbar_v2_1_22_addr_decoder #
        (
          .C_FAMILY          (C_FAMILY),
          .C_NUM_TARGETS     (C_NUM_M),
          .C_NUM_TARGETS_LOG (P_NUM_M_LOG_M1),
          .C_NUM_RANGES      (C_NUM_ADDR_RANGES),
          .C_ADDR_WIDTH      (C_ADDR_WIDTH),
          .C_TARGET_ENC      (1),
          .C_TARGET_HOT      (1),
          .C_REGION_ENC      (1),
          .C_BASE_ADDR      (C_BASE_ADDR),
          .C_HIGH_ADDR      (C_HIGH_ADDR),
          .C_TARGET_QUAL     (C_TARGET_QUAL),
          .C_RESOLUTION      (2)
        ) 
        addr_decoder_inst 
        (
          .ADDR             (S_AADDR),        
          .TARGET_HOT       (target_mi_hot),  
          .TARGET_ENC       (target_mi_enc),  
          .MATCH            (match),       
          .REGION           (target_region)      
        );
    end else begin : gen_no_addr_decoder
      assign target_mi_hot = 1;
      assign target_mi_enc = 0;
      assign match = 1'b1;
      assign target_region = 4'b0000;
    end
  endgenerate
  
  assign target_secure = |(target_mi_hot & P_M_SECURE_MASK);
  assign target_axilite = |(target_mi_hot & P_M_AXILITE);

  assign any_error = C_RANGE_CHECK && (m_aerror_i != 0);            // DECERR if error-detection enabled and any error condition.
  assign m_aerror_i[0] = ~match;                                    // Invalid target address
  assign m_aerror_i[1] = target_secure && S_APROT[P_NONSECURE_BIT]; // TrustZone violation
  assign m_aerror_i[2] = target_axilite && ((S_ALEN != 0) || 
    (S_ASIZE[1:0] == 2'b11) || (S_ASIZE[2] == 1'b1));               // AxiLite access violation
  assign m_aerror_i[7:3] = 5'b00000;                                    // Reserved
  assign M_ATARGET_HOT = m_atarget_hot_i;
  assign m_atarget_hot_i = (any_error ? {1'b1, {C_NUM_M{1'b0}}} : {1'b0, target_mi_hot});
  assign m_atarget_enc_i = (any_error ? C_NUM_M : target_mi_enc);
    
  assign M_AVALID = m_avalid_i;
  assign m_avalid_i = S_AVALID;
  assign M_AVALID_QUAL = m_avalid_qual_i; 
  assign S_AREADY = s_aready_i;
  assign s_aready_i = M_AREADY;
  assign M_AERROR = m_aerror_i;
  assign M_ATARGET_ENC = m_atarget_enc_i;
  assign m_aregion_i = any_error ? 4'b0000 : (C_ADDR_DECODE != 0) ? target_region : 4'b0000;
//  assign m_aregion_i = any_error ? 4'b0000 : (C_ADDR_DECODE != 0) ? target_region : S_AREGION;
  assign M_AREGION = m_aregion_i;
  assign M_AID = S_AID;
  assign M_AADDR = S_AADDR;
  assign M_ALEN = S_ALEN;
  assign M_ASIZE = S_ASIZE;
  assign M_ALOCK = S_ALOCK;
  assign M_APROT = S_APROT;
  assign M_AMESG = S_AMESG;
  
  assign S_RVALID = s_rvalid_i;
  assign M_RREADY = m_rready_i;
  assign s_rid_i = si_rmux_mesg[0+:C_ID_WIDTH];
  assign S_RMESG = si_rmux_mesg[C_ID_WIDTH+:C_RMESG_WIDTH];
  assign s_rlast_i = si_rmux_mesg[C_ID_WIDTH+C_RMESG_WIDTH+:1];
  assign S_RID = s_rid_i;
  assign S_RLAST = s_rlast_i;
  assign m_rvalid_qual = M_RVALID & M_RTARGET;
  assign m_rready_i = m_rready_arb & M_RTARGET;

  generate
    for (gen_mi=0; gen_mi<(C_NUM_M+1); gen_mi=gen_mi+1) begin : gen_rmesg_mi
      // Note: Concatenation of mesg signals is from MSB to LSB; assignments that chop mesg signals appear in opposite order.
      assign mi_rmux_mesg[gen_mi*P_RMUX_MESG_WIDTH+:P_RMUX_MESG_WIDTH] = {
               M_RLAST[gen_mi],
               M_RMESG[gen_mi*C_RMESG_WIDTH+:C_RMESG_WIDTH],
               M_RID[gen_mi*C_ID_WIDTH+:C_ID_WIDTH]
               };
    end  // gen_rmesg_mi

    if (C_ACCEPTANCE == 1) begin : gen_single_issue
      wire  cmd_push;
      wire  cmd_pop;
      reg  [(C_NUM_M+1)-1:0] active_target_hot = 0;
      reg  [P_NUM_M_DE_LOG-1:0] active_target_enc = 0;
      reg  accept_cnt = 1'b0;
      reg  [8-1:0] debug_r_beat_cnt_i;
      wire [8-1:0] debug_r_trans_seq_i;

      assign cmd_push = M_AREADY;
      assign cmd_pop = s_rvalid_i && S_RREADY && s_rlast_i;  // Pop command queue if end of read burst
      assign m_avalid_qual_i = ~accept_cnt | cmd_pop;  // Ready for arbitration if no outstanding transaction or transaction being completed

      always @(posedge ACLK) begin 
        if (ARESET) begin
          accept_cnt <= 1'b0;
          active_target_enc <= 0;
          active_target_hot <= 0;
        end else begin
          if (cmd_push) begin
            active_target_enc <= m_atarget_enc_i;
            active_target_hot <= m_atarget_hot_i;
            accept_cnt <= 1'b1;
          end else if (cmd_pop) begin
            accept_cnt <= 1'b0;
          end
        end 
      end  // Clocked process
        
      assign m_rready_arb = active_target_hot & {(C_NUM_M+1){S_RREADY}};
      assign s_rvalid_i = |(active_target_hot & m_rvalid_qual);
                 
      generic_baseblocks_v2_1_0_mux_enc # 
        (
         .C_FAMILY      (C_FAMILY),
         .C_RATIO       (C_NUM_M+1),
         .C_SEL_WIDTH   (P_NUM_M_DE_LOG),
         .C_DATA_WIDTH  (P_RMUX_MESG_WIDTH)
        ) mux_resp_single_issue
        (
         .S   (active_target_enc),
         .A   (mi_rmux_mesg),
         .O   (si_rmux_mesg),
         .OE  (1'b1)
        ); 
        
      if (C_DEBUG) begin : gen_debug_r_single_issue
        // DEBUG READ BEAT COUNTER (only meaningful for R-channel)
        always @(posedge ACLK) begin
          if (ARESET) begin
            debug_r_beat_cnt_i <= 0;
          end else if (C_DIR == P_READ) begin
            if (s_rvalid_i && S_RREADY) begin
              if (s_rlast_i) begin
                debug_r_beat_cnt_i <= 0;
              end else begin
                debug_r_beat_cnt_i <= debug_r_beat_cnt_i + 1;
              end
            end
          end else begin
            debug_r_beat_cnt_i <= 0;            
          end
        end  // Clocked process
        
        // DEBUG R-CHANNEL TRANSACTION SEQUENCE FIFO
        axi_data_fifo_v2_1_20_axic_srl_fifo #
          (
           .C_FAMILY          (C_FAMILY),
           .C_FIFO_WIDTH      (8),
           .C_FIFO_DEPTH_LOG  (C_ACCEPTANCE_LOG+1),
           .C_USE_FULL        (0)
           )
          debug_r_seq_fifo_single_issue
            (
             .ACLK    (ACLK),
             .ARESET  (ARESET),
             .S_MESG  (DEBUG_A_TRANS_SEQ),
             .S_VALID (cmd_push),
             .S_READY (),
             .M_MESG  (debug_r_trans_seq_i),
             .M_VALID (),
             .M_READY (cmd_pop)
            );
            
      end  // gen_debug_r
      
    end else if (C_SINGLE_THREAD || (P_NUM_ID_VAL==1)) begin : gen_single_thread
      wire  s_avalid_en;
      wire  cmd_push;
      wire  cmd_pop;
      reg  [C_ID_WIDTH-1:0] active_id;
      reg  [(C_NUM_M+1)-1:0] active_target_hot = 0;
      reg  [P_NUM_M_DE_LOG-1:0] active_target_enc = 0;
      reg  [4-1:0] active_region;
      reg  [(C_ACCEPTANCE_LOG+1)-1:0] accept_cnt = 0;
      reg  [8-1:0] debug_r_beat_cnt_i;
      wire [8-1:0] debug_r_trans_seq_i;
      wire accept_limit ;

      // Implement single-region-per-ID cyclic dependency avoidance method.
      assign s_avalid_en =  // This transaction is qualified to request arbitration if ...
        (accept_cnt == 0) ||  // Either there are no outstanding transactions, or ...
        (((P_NUM_ID_VAL==1) || (S_AID[P_THREAD_ID_WIDTH_M1-1:0] == active_id[P_THREAD_ID_WIDTH_M1-1:0])) &&  // the current transaction ID matches the previous, and ...
        (active_target_enc == m_atarget_enc_i) &&  // all outstanding transactions are to the same target MI ...
        (active_region == m_aregion_i));  // and to the same REGION.
      
      assign cmd_push = M_AREADY;
      assign cmd_pop = s_rvalid_i && S_RREADY && s_rlast_i;  // Pop command queue if end of read burst
      assign accept_limit = (accept_cnt == C_ACCEPTANCE) & ~cmd_pop;  // Allow next push if a transaction is currently being completed
      assign m_avalid_qual_i = s_avalid_en & ~accept_limit; 
      
      always @(posedge ACLK) begin 
        if (ARESET) begin
          accept_cnt <= 0;
          active_id <= 0;
          active_target_enc <= 0;
          active_target_hot <= 0;
          active_region <= 0;
        end else begin
          if (cmd_push) begin
            active_id <= S_AID[P_THREAD_ID_WIDTH_M1-1:0];
            active_target_enc <= m_atarget_enc_i;
            active_target_hot <= m_atarget_hot_i;
            active_region <= m_aregion_i;
            if (~cmd_pop) begin
              accept_cnt <= accept_cnt + 1;
            end
          end else begin
            if (cmd_pop & (accept_cnt != 0)) begin
              accept_cnt <= accept_cnt - 1;
            end
          end
        end 
      end  // Clocked process
        
      assign m_rready_arb = active_target_hot & {(C_NUM_M+1){S_RREADY}};
      assign s_rvalid_i = |(active_target_hot & m_rvalid_qual);
                 
      generic_baseblocks_v2_1_0_mux_enc # 
        (
         .C_FAMILY      (C_FAMILY),
         .C_RATIO       (C_NUM_M+1),
         .C_SEL_WIDTH   (P_NUM_M_DE_LOG),
         .C_DATA_WIDTH  (P_RMUX_MESG_WIDTH)
        ) mux_resp_single_thread
        (
         .S   (active_target_enc),
         .A   (mi_rmux_mesg),
         .O   (si_rmux_mesg),
         .OE  (1'b1)
        ); 
        
      if (C_DEBUG) begin : gen_debug_r_single_thread
        // DEBUG READ BEAT COUNTER (only meaningful for R-channel)
        always @(posedge ACLK) begin
          if (ARESET) begin
            debug_r_beat_cnt_i <= 0;
          end else if (C_DIR == P_READ) begin
            if (s_rvalid_i && S_RREADY) begin
              if (s_rlast_i) begin
                debug_r_beat_cnt_i <= 0;
              end else begin
                debug_r_beat_cnt_i <= debug_r_beat_cnt_i + 1;
              end
            end
          end else begin
            debug_r_beat_cnt_i <= 0;            
          end
        end  // Clocked process
        
        // DEBUG R-CHANNEL TRANSACTION SEQUENCE FIFO
        axi_data_fifo_v2_1_20_axic_srl_fifo #
          (
           .C_FAMILY          (C_FAMILY),
           .C_FIFO_WIDTH      (8),
           .C_FIFO_DEPTH_LOG  (C_ACCEPTANCE_LOG+1),
           .C_USE_FULL        (0)
           )
          debug_r_seq_fifo_single_thread
            (
             .ACLK    (ACLK),
             .ARESET  (ARESET),
             .S_MESG  (DEBUG_A_TRANS_SEQ),
             .S_VALID (cmd_push),
             .S_READY (),
             .M_MESG  (debug_r_trans_seq_i),
             .M_VALID (),
             .M_READY (cmd_pop)
            );
            
      end  // gen_debug_r
      
    end else begin : gen_multi_thread
      wire [(P_NUM_M_DE_LOG)-1:0] resp_select;
      reg  [(C_ACCEPTANCE_LOG+1)-1:0] accept_cnt = 0;
      wire [P_NUM_THREADS-1:0] s_avalid_en;
      wire [P_NUM_THREADS-1:0] thread_valid;
      wire [P_NUM_THREADS-1:0] aid_match;
      wire [P_NUM_THREADS-1:0] rid_match;
      wire [P_NUM_THREADS-1:0] cmd_push;
      wire [P_NUM_THREADS-1:0] cmd_pop;
      wire [P_NUM_THREADS:0]   accum_push;
      reg  [P_NUM_THREADS*C_ID_WIDTH-1:0] active_id;
      reg  [P_NUM_THREADS*8-1:0] active_target;
      reg  [P_NUM_THREADS*8-1:0] active_region;
      reg  [P_NUM_THREADS*8-1:0] active_cnt = 0;
      reg  [P_NUM_THREADS*8-1:0] debug_r_beat_cnt_i;
      wire [P_NUM_THREADS*8-1:0] debug_r_trans_seq_i;
      wire any_aid_match;
      wire any_rid_match;
      wire accept_limit;
      wire any_push;
      wire any_pop;
        
      axi_crossbar_v2_1_22_arbiter_resp #  // Multi-thread response arbiter
        (
         .C_FAMILY                (C_FAMILY),
         .C_NUM_S                 (C_NUM_M+1),
         .C_NUM_S_LOG             (P_NUM_M_DE_LOG),
         .C_GRANT_ENC            (1),
         .C_GRANT_HOT            (0)
         )
        arbiter_resp_inst
          (
           .ACLK                  (ACLK),
           .ARESET                (ARESET),
           .S_VALID               (m_rvalid_qual),
           .S_READY               (m_rready_arb),
           .M_GRANT_HOT           (),
           .M_GRANT_ENC           (resp_select),
           .M_VALID               (s_rvalid_i),
           .M_READY               (S_RREADY)
           );
                 
      generic_baseblocks_v2_1_0_mux_enc # 
        (
         .C_FAMILY      (C_FAMILY),
         .C_RATIO       (C_NUM_M+1),
         .C_SEL_WIDTH   (P_NUM_M_DE_LOG),
         .C_DATA_WIDTH  (P_RMUX_MESG_WIDTH)
        ) mux_resp_multi_thread
        (
         .S   (resp_select),
         .A   (mi_rmux_mesg),
         .O   (si_rmux_mesg),
         .OE  (1'b1)
        ); 
        
      assign any_push = M_AREADY;
      assign any_pop = s_rvalid_i & S_RREADY & s_rlast_i;
      assign accept_limit = (accept_cnt == C_ACCEPTANCE) & ~any_pop;  // Allow next push if a transaction is currently being completed
        assign m_avalid_qual_i = (&s_avalid_en) & ~accept_limit;  // The current request is qualified for arbitration when it is qualified against all outstanding transaction threads.
        assign any_aid_match = |aid_match;
        assign any_rid_match = |rid_match;
        assign accum_push[0] = 1'b0;
        
        always @(posedge ACLK) begin
          if (ARESET) begin
            accept_cnt <= 0; 
          end else begin
            if (any_push & ~any_pop) begin
              accept_cnt <= accept_cnt + 1;
          end else if (any_pop & ~any_push & (accept_cnt != 0)) begin
              accept_cnt <= accept_cnt - 1;
            end
          end 
        end  // Clocked process
          
        for (gen_thread=0; gen_thread<P_NUM_THREADS; gen_thread=gen_thread+1) begin : gen_thread_loop
          assign thread_valid[gen_thread] = (active_cnt[gen_thread*8 +: C_ACCEPTANCE_LOG+1] != 0);
          assign aid_match[gen_thread] =  // The currect thread is active for the requested transaction if
            thread_valid[gen_thread] &&  // this thread slot is not vacant, and
          ((S_AID[P_THREAD_ID_WIDTH_M1-1:0]) == active_id[gen_thread*C_ID_WIDTH+:P_THREAD_ID_WIDTH_M1]);  // the requested ID matches the active ID for this thread.
          assign s_avalid_en[gen_thread] =  // The current request is qualified against this thread slot if
            (~aid_match[gen_thread]) ||  // This thread slot is not active for the requested ID, or
            ((m_atarget_enc_i == active_target[gen_thread*8+:P_NUM_M_DE_LOG]) &&  // this outstanding transaction was to the same target and
            (m_aregion_i == active_region[gen_thread*8+:4]));  // to the same region.
          
          // cmd_push points to the position of either the active thread for the requested ID or the lowest vacant thread slot.
          assign accum_push[gen_thread+1] = accum_push[gen_thread] | ~thread_valid[gen_thread];
          assign cmd_push[gen_thread] = any_push & (aid_match[gen_thread] | ((~any_aid_match) & ~thread_valid[gen_thread] & ~accum_push[gen_thread]));
          
          // cmd_pop points to the position of the active thread that matches the current RID.
        assign rid_match[gen_thread] = thread_valid[gen_thread] & ((s_rid_i[P_THREAD_ID_WIDTH_M1-1:0]) == active_id[gen_thread*C_ID_WIDTH+:P_THREAD_ID_WIDTH_M1]);
          assign cmd_pop[gen_thread] = any_pop & rid_match[gen_thread];
        
          always @(posedge ACLK) begin
            if (ARESET) begin
              active_id[gen_thread*C_ID_WIDTH+:C_ID_WIDTH] <= 0;
              active_target[gen_thread*8+:8] <= 0;
              active_region[gen_thread*8+:8] <= 0;
              active_cnt[gen_thread*8+:8] <= 0; 
            end else begin
              if (cmd_push[gen_thread]) begin
              active_id[gen_thread*C_ID_WIDTH+:P_THREAD_ID_WIDTH_M1] <= S_AID[P_THREAD_ID_WIDTH_M1-1:0];
                active_target[gen_thread*8+:P_NUM_M_DE_LOG] <= m_atarget_enc_i;
                active_region[gen_thread*8+:4] <= m_aregion_i;
                if (~cmd_pop[gen_thread]) begin
                  active_cnt[gen_thread*8+:C_ACCEPTANCE_LOG+1] <= active_cnt[gen_thread*8+:C_ACCEPTANCE_LOG+1] + 1;
                end
              end else if (cmd_pop[gen_thread]) begin
                  active_cnt[gen_thread*8+:C_ACCEPTANCE_LOG+1] <= active_cnt[gen_thread*8+:C_ACCEPTANCE_LOG+1] - 1;
              end
            end 
          end  // Clocked process
            
        if (C_DEBUG) begin : gen_debug_r_multi_thread
            // DEBUG READ BEAT COUNTER (only meaningful for R-channel)
            always @(posedge ACLK) begin
              if (ARESET) begin
                debug_r_beat_cnt_i[gen_thread*8+:8] <= 0;
              end else if (C_DIR == P_READ) begin
                if (s_rvalid_i & S_RREADY & rid_match[gen_thread]) begin
                  if (s_rlast_i) begin
                    debug_r_beat_cnt_i[gen_thread*8+:8] <= 0;
                  end else begin
                    debug_r_beat_cnt_i[gen_thread*8+:8] <= debug_r_beat_cnt_i[gen_thread*8+:8] + 1;
                  end
                end
              end else begin
                debug_r_beat_cnt_i[gen_thread*8+:8] <= 0;            
              end
            end  // Clocked process
            
            // DEBUG R-CHANNEL TRANSACTION SEQUENCE FIFO
            axi_data_fifo_v2_1_20_axic_srl_fifo #
              (
               .C_FAMILY          (C_FAMILY),
               .C_FIFO_WIDTH      (8),
               .C_FIFO_DEPTH_LOG  (C_ACCEPTANCE_LOG+1),
               .C_USE_FULL        (0)
               )
            debug_r_seq_fifo_multi_thread
                (
                 .ACLK    (ACLK),
                 .ARESET  (ARESET),
                 .S_MESG  (DEBUG_A_TRANS_SEQ),
                 .S_VALID (cmd_push[gen_thread]),
                 .S_READY (),
                 .M_MESG  (debug_r_trans_seq_i[gen_thread*8+:8]),
                 .M_VALID (),
                 .M_READY (cmd_pop[gen_thread])
                );
        end  // gen_debug_r_multi_thread
      end  // Next gen_thread_loop
            
    end  // thread control
        
  endgenerate
endmodule




// -- (c) Copyright 2009 - 2011 Xilinx, Inc. All rights reserved.
// --
// -- This file contains confidential and proprietary information
// -- of Xilinx, Inc. and is protected under U.S. and 
// -- international copyright and other intellectual property
// -- laws.
// --
// -- DISCLAIMER
// -- This disclaimer is not a license and does not grant any
// -- rights to the materials distributed herewith. Except as
// -- otherwise provided in a valid license issued to you by
// -- Xilinx, and to the maximum extent permitted by applicable
// -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// -- (2) Xilinx shall not be liable (whether in contract or tort,
// -- including negligence, or under any other theory of
// -- liability) for any loss or damage of any kind or nature
// -- related to, arising under or in connection with these
// -- materials, including for any direct, or any indirect,
// -- special, incidental, or consequential loss or damage
// -- (including loss of data, profits, goodwill, or any type of
// -- loss or damage suffered as a result of any action brought
// -- by a third party) even if such damage or loss was
// -- reasonably foreseeable or Xilinx had been advised of the
// -- possibility of the same.
// --
// -- CRITICAL APPLICATIONS
// -- Xilinx products are not designed or intended to be fail-
// -- safe, or for use in any application requiring fail-safe
// -- performance, such as life-support or safety devices or
// -- systems, Class III medical devices, nuclear facilities,
// -- applications related to the deployment of airbags, or any
// -- other applications that could lead to death, personal
// -- injury, or severe property or environmental damage
// -- (individually and collectively, "Critical
// -- Applications"). Customer assumes the sole risk and
// -- liability of any use of Xilinx products in Critical
// -- Applications, subject only to applicable laws and
// -- regulations governing limitations on product liability.
// --
// -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// -- PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------------------
//
// File name: wdata_mux.v
//
// Description: 
//   Contains MI-side write command queue.
//   SI-slot index selected by AW arbiter is pushed onto queue when S_AVALID transfer is received.
//   Queue is popped when WLAST data beat is transferred.
//   W-channel input from SI-slot selected by queue output is transferred to MI-side output .
//--------------------------------------------------------------------------
//
// Structure:
//    wdata_mux
//      axic_reg_srl_fifo
//      mux_enc
//      
//-----------------------------------------------------------------------------

`timescale 1ps/1ps
`default_nettype none

(* DowngradeIPIdentifiedWarnings="yes" *) 
module axi_crossbar_v2_1_22_wdata_mux #
  (
   parameter         C_FAMILY       = "none", // FPGA Family.
   parameter integer C_WMESG_WIDTH            =  1, // Width of W-channel payload.
   parameter integer C_NUM_SLAVE_SLOTS     =  1, // Number of S_* ports.
   parameter integer C_SELECT_WIDTH      =  1, // Width of ASELECT.
   parameter integer C_FIFO_DEPTH_LOG     =  0 // Queue depth = 2**C_FIFO_DEPTH_LOG.
   )
  (
   // System Signals
   input  wire                                        ACLK,
   input  wire                                        ARESET,
   // Slave Data Ports
   input  wire [C_NUM_SLAVE_SLOTS*C_WMESG_WIDTH-1:0]     S_WMESG,
   input  wire [C_NUM_SLAVE_SLOTS-1:0]                S_WLAST,
   input  wire [C_NUM_SLAVE_SLOTS-1:0]                S_WVALID,
   output wire [C_NUM_SLAVE_SLOTS-1:0]                S_WREADY,
   // Master Data Ports
   output wire [C_WMESG_WIDTH-1:0]                       M_WMESG,
   output wire                                        M_WLAST,
   output wire                                        M_WVALID,
   input  wire                                        M_WREADY,
   // Write Command Ports
   input  wire [C_SELECT_WIDTH-1:0]                 S_ASELECT,  // SI-slot index from AW arbiter
   input  wire                                        S_AVALID,
   output wire                                        S_AREADY
   );

  localparam integer P_FIFO_DEPTH_LOG = (C_FIFO_DEPTH_LOG <= 5) ? C_FIFO_DEPTH_LOG : 5;  // Max depth = 32
  
  // Decode select input to 1-hot
  function [C_NUM_SLAVE_SLOTS-1:0] f_decoder (
      input [C_SELECT_WIDTH-1:0] sel
    );
    integer i;
    begin
      for (i=0; i<C_NUM_SLAVE_SLOTS; i=i+1) begin
        f_decoder[i] = (sel == i);
      end
    end
  endfunction

  wire                                          m_valid_i;
  wire                                          m_last_i;
  wire [C_NUM_SLAVE_SLOTS-1:0]             m_select_hot;
  wire [C_SELECT_WIDTH-1:0]                 m_select_enc;
  wire                                          m_avalid;
  wire                                          m_aready;
  
  generate
    if (C_NUM_SLAVE_SLOTS>1) begin : gen_wmux
      // SI-side write command queue
      axi_data_fifo_v2_1_20_axic_reg_srl_fifo #
        (
         .C_FAMILY          (C_FAMILY),
         .C_FIFO_WIDTH      (C_SELECT_WIDTH),
         .C_FIFO_DEPTH_LOG  (P_FIFO_DEPTH_LOG),
         .C_USE_FULL        (0)
         )
        wmux_aw_fifo
          (
           .ACLK    (ACLK),
           .ARESET  (ARESET),
           .S_MESG  (S_ASELECT),
           .S_VALID (S_AVALID),
           .S_READY (S_AREADY),
           .M_MESG  (m_select_enc),
           .M_VALID (m_avalid),
           .M_READY (m_aready)
           );
    
      assign m_select_hot = f_decoder(m_select_enc);
      
      // Instantiate MUX
      generic_baseblocks_v2_1_0_mux_enc # 
        (
         .C_FAMILY      ("rtl"),
         .C_RATIO       (C_NUM_SLAVE_SLOTS),
         .C_SEL_WIDTH   (C_SELECT_WIDTH),
         .C_DATA_WIDTH  (C_WMESG_WIDTH)
        ) mux_w 
        (
         .S   (m_select_enc),
         .A   (S_WMESG),
         .O   (M_WMESG),
         .OE  (1'b1)
        ); 
        
      assign m_last_i  = |(S_WLAST & m_select_hot);
      assign m_valid_i = |(S_WVALID & m_select_hot);
      
      assign m_aready = m_valid_i & m_avalid & m_last_i & M_WREADY;
      assign M_WLAST = m_last_i;
      assign M_WVALID = m_valid_i & m_avalid;
      assign S_WREADY = m_select_hot & {C_NUM_SLAVE_SLOTS{m_avalid & M_WREADY}};
    end else begin : gen_no_wmux
      assign S_AREADY = 1'b1;
      assign M_WVALID = S_WVALID;
      assign S_WREADY = M_WREADY;
      assign M_WLAST = S_WLAST;
      assign M_WMESG = S_WMESG;
    end
  endgenerate
  
endmodule

`default_nettype wire


// -- (c) Copyright 2009 - 2011 Xilinx, Inc. All rights reserved.
// --
// -- This file contains confidential and proprietary information
// -- of Xilinx, Inc. and is protected under U.S. and 
// -- international copyright and other intellectual property
// -- laws.
// --
// -- DISCLAIMER
// -- This disclaimer is not a license and does not grant any
// -- rights to the materials distributed herewith. Except as
// -- otherwise provided in a valid license issued to you by
// -- Xilinx, and to the maximum extent permitted by applicable
// -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// -- (2) Xilinx shall not be liable (whether in contract or tort,
// -- including negligence, or under any other theory of
// -- liability) for any loss or damage of any kind or nature
// -- related to, arising under or in connection with these
// -- materials, including for any direct, or any indirect,
// -- special, incidental, or consequential loss or damage
// -- (including loss of data, profits, goodwill, or any type of
// -- loss or damage suffered as a result of any action brought
// -- by a third party) even if such damage or loss was
// -- reasonably foreseeable or Xilinx had been advised of the
// -- possibility of the same.
// --
// -- CRITICAL APPLICATIONS
// -- Xilinx products are not designed or intended to be fail-
// -- safe, or for use in any application requiring fail-safe
// -- performance, such as life-support or safety devices or
// -- systems, Class III medical devices, nuclear facilities,
// -- applications related to the deployment of airbags, or any
// -- other applications that could lead to death, personal
// -- injury, or severe property or environmental damage
// -- (individually and collectively, "Critical
// -- Applications"). Customer assumes the sole risk and
// -- liability of any use of Xilinx products in Critical
// -- Applications, subject only to applicable laws and
// -- regulations governing limitations on product liability.
// --
// -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// -- PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------------------
//
// File name: wdata_router.v
//
// Description: 
//   Contains SI-side write command queue.
//   Target MI-slot index is pushed onto queue when S_AVALID transfer is received.
//   Queue is popped when WLAST data beat is transferred.
//   W-channel input is transferred to MI-slot output selected by queue output.
//--------------------------------------------------------------------------
//
// Structure:
//    wdata_router
//      axic_reg_srl_fifo
//      
//-----------------------------------------------------------------------------

`timescale 1ps/1ps
`default_nettype none

(* DowngradeIPIdentifiedWarnings="yes" *) 
module axi_crossbar_v2_1_22_wdata_router #
  (
   parameter         C_FAMILY       = "none", // FPGA Family.
   parameter integer C_WMESG_WIDTH          = 1, // Width of all data signals
   parameter integer C_NUM_MASTER_SLOTS     = 1, // Number of M_* ports.
   parameter integer C_SELECT_WIDTH     =  1, // Width of S_ASELECT.
   parameter integer C_FIFO_DEPTH_LOG     =  0 // Queue depth = 2**C_FIFO_DEPTH_LOG.
   )
  (
   // System Signals
   input  wire                                        ACLK,
   input  wire                                        ARESET,
   // Slave Data Ports
   input  wire [C_WMESG_WIDTH-1:0]                    S_WMESG,
   input  wire                                        S_WLAST,
   input  wire                                        S_WVALID,
   output wire                                        S_WREADY,
   // Master Data Ports
   output wire [C_WMESG_WIDTH-1:0]                    M_WMESG,  // Broadcast to all MI-slots
   output wire                                        M_WLAST,  // Broadcast to all MI-slots
   output wire [C_NUM_MASTER_SLOTS-1:0]               M_WVALID,  // Per MI-slot
   input  wire [C_NUM_MASTER_SLOTS-1:0]               M_WREADY,  // Per MI-slot
   // Address Arbiter Ports
   input  wire [C_SELECT_WIDTH-1:0]                   S_ASELECT,  // Target MI-slot index from SI-side AW command
   input  wire                                        S_AVALID,
   output wire                                        S_AREADY
   );

  localparam integer P_FIFO_DEPTH_LOG = (C_FIFO_DEPTH_LOG <= 5) ? C_FIFO_DEPTH_LOG : 5;  // Max depth = 32

  // Decode select input to 1-hot
  function [C_NUM_MASTER_SLOTS-1:0] f_decoder (
      input [C_SELECT_WIDTH-1:0] sel
    );
    integer i;
    begin
      for (i=0; i<C_NUM_MASTER_SLOTS; i=i+1) begin
        f_decoder[i] = (sel == i);
      end
    end
  endfunction

  //---------------------------------------------------------------------------
  // Internal signal declarations
  //---------------------------------------------------------------------------
  wire [C_NUM_MASTER_SLOTS-1:0]             m_select_hot;
  wire [C_SELECT_WIDTH-1:0]                 m_select_enc;
  wire                                          m_avalid;
  wire                                          m_aready;
  
  //---------------------------------------------------------------------------
  // Router
  //---------------------------------------------------------------------------

  // SI-side write command queue
  axi_data_fifo_v2_1_20_axic_reg_srl_fifo #
    (
     .C_FAMILY          (C_FAMILY),
     .C_FIFO_WIDTH      (C_SELECT_WIDTH),
     .C_FIFO_DEPTH_LOG  (P_FIFO_DEPTH_LOG),
     .C_USE_FULL        (1)
     )
    wrouter_aw_fifo
      (
       .ACLK    (ACLK),
       .ARESET  (ARESET),
       .S_MESG  (S_ASELECT),
       .S_VALID (S_AVALID),
       .S_READY (S_AREADY),
       .M_MESG  (m_select_enc),
       .M_VALID (m_avalid),
       .M_READY (m_aready)
       );

  assign m_select_hot = f_decoder(m_select_enc);
  
  // W-channel payload and LAST are broadcast to all MI-slot's W-mux
  assign M_WMESG   = S_WMESG;
  assign M_WLAST =   S_WLAST;
  
  // Assert m_aready when last beat acknowledged by slave
  assign m_aready = m_avalid & S_WVALID & S_WLAST & (|(M_WREADY & m_select_hot));

  // M_WVALID is generated per MI-slot (including error handler at slot C_NUM_MASTER_SLOTS).
  // The slot selected by the head of the queue (m_select_enc) is enabled.
  assign M_WVALID = {C_NUM_MASTER_SLOTS{S_WVALID & m_avalid}} & m_select_hot;

  // S_WREADY is muxed from the MI slot selected by the head of the queue (m_select_enc).
  assign S_WREADY = m_avalid & (|(M_WREADY & m_select_hot));
  
endmodule




`default_nettype wire


