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
// File       : PIO_TX_ENGINE.v
// Version    : 4.1
//
//-----------------------------------------------------------------------------
//
// Project    : Virtex-7 FPGA Gen3 Integrated Block for PCI Express
// File       : PIO_TX_ENGINE.v
// Version    : 1.3
//
// Description: Local-Link Transmit Unit.
//
//--------------------------------------------------------------------------------

`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings = "yes" *)
module PIO_TX_ENGINE    #(

  parameter        TCQ = 1,
  parameter [1:0] AXISTEN_IF_WIDTH = 00,
  parameter       AXISTEN_IF_RQ_ALIGNMENT_MODE = "FALSE",
  parameter       AXISTEN_IF_CC_ALIGNMENT_MODE = "FALSE",
  parameter       AXISTEN_IF_ENABLE_CLIENT_TAG = 0,
  parameter       AXISTEN_IF_RQ_PARITY_CHECK   = 0,
  parameter       AXISTEN_IF_CC_PARITY_CHECK   = 0,

  //Do not modify the parameters below this line
  parameter C_DATA_WIDTH = (AXISTEN_IF_WIDTH[1]) ? 256 : (AXISTEN_IF_WIDTH[0])? 128 : 64,
  parameter PARITY_WIDTH = C_DATA_WIDTH /8,
  parameter KEEP_WIDTH   = C_DATA_WIDTH /32,
  parameter STRB_WIDTH   = C_DATA_WIDTH / 8
)(

  input                          user_clk,
  input                          reset_n,

  // AXI-S Completer Competion Interface

  output reg [C_DATA_WIDTH-1:0]  s_axis_cc_tdata,
  output reg   [KEEP_WIDTH-1:0]  s_axis_cc_tkeep,
  output reg                     s_axis_cc_tlast,
  output reg                     s_axis_cc_tvalid,
  output reg             [32:0]  s_axis_cc_tuser,
  input                          s_axis_cc_tready,

  // AXI-S Requester Request Interface

  output reg [C_DATA_WIDTH-1:0]  s_axis_rq_tdata,
  output reg   [KEEP_WIDTH-1:0]  s_axis_rq_tkeep,
  output reg                     s_axis_rq_tlast,
  output reg                     s_axis_rq_tvalid,
  output reg             [59:0]  s_axis_rq_tuser,
  input                          s_axis_rq_tready,

  // TX Message Interface

  input                          cfg_msg_transmit_done,
  output reg                     cfg_msg_transmit,
  output reg              [2:0]  cfg_msg_transmit_type,
  output reg             [31:0]  cfg_msg_transmit_data,

  //Tag availability and Flow control Information

  input                   [5:0]  pcie_rq_tag,
  input                          pcie_rq_tag_vld,
  input                   [1:0]  pcie_tfc_nph_av,
  input                   [1:0]  pcie_tfc_npd_av,
  input                          pcie_tfc_np_pl_empty,
  input                   [3:0]  pcie_rq_seq_num,
  input                          pcie_rq_seq_num_vld,

  //Cfg Flow Control Information

  input                   [7:0]  cfg_fc_ph,
  input                   [7:0]  cfg_fc_nph,
  input                   [7:0]  cfg_fc_cplh,
  input                  [11:0]  cfg_fc_pd,
  input                  [11:0]  cfg_fc_npd,
  input                  [11:0]  cfg_fc_cpld,
  output                  [2:0]  cfg_fc_sel,


  // PIO RX Engine Interface

  input                          req_compl,
  input                          req_compl_wd,
  input                          req_compl_ur,
  input                          payload_len,
  output reg                     compl_done,

  input                   [2:0]  req_tc,
  input                          req_td,
  input                          req_ep,
  input                   [1:0]  req_attr,
  input                  [10:0]  req_len,
  input                  [15:0]  req_rid,
  input                   [7:0]  req_tag,
  input                   [7:0]  req_be,
  input                  [15:0]  req_addr,
  input                   [1:0]  req_at,

  input                  [15:0]  completer_id,

  // Inputs to the TX Block in case of an UR
  // Required to form the completions

  input                  [63:0]  req_des_qword0,
  input                  [63:0]  req_des_qword1,
  input                          req_des_tph_present,
  input                   [1:0]  req_des_tph_type,
  input                   [7:0]  req_des_tph_st_tag,

  //Indicate that the Request was a Mem lock Read Req

  input                          req_mem_lock,
  input                          req_mem,

  // PIO Memory Access Control Interface

  output reg             [13:0]  rd_addr,
  output reg              [3:0]  rd_be,
  output reg                     trn_sent,
  input                  [31:0]  rd_data,
  input                          gen_transaction

);


  localparam PIO_TX_RST_STATE                   = 4'b0000;
  localparam PIO_TX_COMPL_C1                    = 4'b0001;
  localparam PIO_TX_COMPL_C2                    = 4'b0010;
  localparam PIO_TX_COMPL_WD_C1                 = 4'b0011;
  localparam PIO_TX_COMPL_WD_C2                 = 4'b0100;
  localparam PIO_TX_COMPL_PYLD                  = 4'b0101;
  localparam PIO_TX_CPL_UR_C1                   = 4'b0110;
  localparam PIO_TX_CPL_UR_C2                   = 4'b0111;
  localparam PIO_TX_CPL_UR_C3                   = 4'b1000;
  localparam PIO_TX_CPL_UR_C4                   = 4'b1001;
  localparam PIO_TX_MRD_C1                      = 4'b1010;
  localparam PIO_TX_MRD_C2                      = 4'b1011;
  localparam PIO_TX_COMPL_WD_2DW                = 4'b1100;
  localparam PIO_TX_COMPL_WD_2DW_ADDR_ALGN_C1   = 4'b1101;
  localparam PIO_TX_COMPL_WD_2DW_ADDR_ALGN_C2   = 4'b1110;

  // Local registers


  reg  [11:0]              byte_count_fbe;
  reg  [11:0]              byte_count_lbe;
  wire [11:0]              byte_count;
  reg  [06:0]              lower_addr;
  reg  [06:0]              lower_addr_q;
  reg  [06:0]              lower_addr_qq;
  reg  [15:0]              tkeep;
  reg  [15:0]              tkeep_q;
  reg  [15:0]              tkeep_qq;

  reg                      req_compl_q;
  reg                      req_compl_qq;
  reg                      req_compl_wd_q;
  reg                      req_compl_wd_qq;
  reg                      req_compl_wd_qqq;
  reg                      req_compl_ur_q;
  reg                      req_compl_ur_qq;

  reg  [3:0]               state;

  wire  [31:0]             s_axis_cc_tparity;
  wire  [31:0]             s_axis_rq_tparity;

  reg                      dword_count; // To count if its a 1DW or 2 DW transaction
  reg  [31:0]              rd_data_reg; // To Store the 1st rd_data in case of 2DW payload

 // CFG func sel
 assign cfg_fc_sel = 3'b100;


  // Present address and byte enable to memory module


  always @ (posedge user_clk)begin

     if (!reset_n) begin
        rd_addr  <=  #TCQ 14'b0;
	rd_be    <=  #TCQ 4'b0;
     end
     else if(req_compl_wd) begin
        if(dword_count == 0) begin
	   rd_addr  <= #TCQ req_addr[15:2];
	   rd_be    <= #TCQ req_be[3:0];
	end
	else begin
	   rd_addr  <= #TCQ req_addr[15:2] + 14'h001;
	   rd_be    <= #TCQ req_be[7:4];
	end
     end

  end

  // Calculate byte count based on byte enable

  always @ (req_be) begin
     
    casex (req_be[3:0])

      4'b1xx1 : byte_count_fbe = 12'h004;
      4'b01x1 : byte_count_fbe = 12'h003;
      4'b1x10 : byte_count_fbe = 12'h003;
      4'b0011 : byte_count_fbe = 12'h002;
      4'b0110 : byte_count_fbe = 12'h002;
      4'b1100 : byte_count_fbe = 12'h002;
      4'b0001 : byte_count_fbe = 12'h001;
      4'b0010 : byte_count_fbe = 12'h001;
      4'b0100 : byte_count_fbe = 12'h001;
      4'b1000 : byte_count_fbe = 12'h001;
      4'b0000 : byte_count_fbe = 12'h001;
      default : byte_count_fbe = 12'h000;
    endcase

    casex (req_be[7:4])

      4'b1xx1 : byte_count_lbe = 12'h004;
      4'b01x1 : byte_count_lbe = 12'h003;
      4'b1x10 : byte_count_lbe = 12'h003;
      4'b0011 : byte_count_lbe = 12'h002;
      4'b0110 : byte_count_lbe = 12'h002;
      4'b1100 : byte_count_lbe = 12'h002;
      4'b0001 : byte_count_lbe = 12'h001;
      4'b0010 : byte_count_lbe = 12'h001;
      4'b0100 : byte_count_lbe = 12'h001;
      4'b1000 : byte_count_lbe = 12'h001;
      4'b0000 : byte_count_lbe = 12'h000;
      default : byte_count_lbe = 12'h000;

    endcase

  end

  // Calculate the byte_count for 1DW or 2DW packets
  assign byte_count = (payload_len == 1)? (byte_count_lbe + byte_count_fbe) : byte_count_fbe;


  // Calculate lower address based on  byte enable

  always @ (req_be or req_addr) begin

    casex (req_be[3:0])
	4'b0000 : lower_addr = {req_addr[6:2], 2'b00};
        4'bxxx1 : lower_addr = {req_addr[6:2], 2'b00};
        4'bxx10 : lower_addr = {req_addr[6:2], 2'b01};
        4'bx100 : lower_addr = {req_addr[6:2], 2'b10};
        4'b1000 : lower_addr = {req_addr[6:2], 2'b11};
	default : lower_addr = 7'h0;
    endcase

  end
  always @  (lower_addr) begin

    casex (lower_addr[4:2])

      3'b000 : tkeep = (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" ) ? 16'h1 :16'h1; 
      3'b001 : tkeep = (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" ) ? 16'h3 :16'h1; 
      3'b010 : tkeep = (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" ) ? 16'h7 :16'h1; 
      3'b011 : tkeep = (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" ) ? 16'hf :16'h1; 
      3'b100 : tkeep = (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" ) ? 16'h1f :16'h1; 
      3'b101 : tkeep = (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" ) ? 16'h3f :16'h1; 
      3'b110 : tkeep = (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" ) ? 16'h7f :16'h1; 
      3'b111 : tkeep = (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" ) ? 16'hff :16'h1; 
    endcase

  end


  always @ (posedge user_clk)
  begin

    if (!reset_n) begin

      req_compl_q     <= #TCQ 1'b0;
      req_compl_qq    <= #TCQ 1'b0;
      req_compl_wd_q  <= #TCQ 1'b0;
      req_compl_wd_qq <= #TCQ 1'b0;
      req_compl_wd_qqq <= #TCQ 1'b0;
      tkeep_q         <= #TCQ 16'h0F;
      req_compl_ur_q  <= #TCQ 1'b0;
      req_compl_ur_qq <= #TCQ 1'b0;

    end else begin

      lower_addr_q    <= #TCQ lower_addr;
      tkeep_q         <= #TCQ tkeep;
      tkeep_qq         <= #TCQ tkeep_q;
      lower_addr_qq   <= #TCQ lower_addr_q;
      req_compl_q     <= #TCQ req_compl;
      req_compl_qq    <= #TCQ req_compl_q;
      req_compl_wd_q  <= #TCQ req_compl_wd;
      req_compl_wd_qq <= #TCQ req_compl_wd_q;
      req_compl_wd_qqq <= #TCQ req_compl_wd_qq;
      req_compl_ur_q  <= #TCQ req_compl_ur;
      req_compl_ur_qq <= #TCQ req_compl_ur_q;
    end

  end



  // Logic to compute the Parity of the CC and the RQ channel

  generate
    if(AXISTEN_IF_RQ_PARITY_CHECK == 1)
    begin

      genvar a;
      for(a=0; a< STRB_WIDTH; a = a + 1) // Parity needs to be computed for every byte of data
      begin : parity_assign
        assign s_axis_rq_tparity[a] = !(  s_axis_rq_tdata[(8*a)+ 0] ^ s_axis_rq_tdata[(8*a)+ 1]
                                 ^ s_axis_rq_tdata[(8*a)+ 2] ^ s_axis_rq_tdata[(8*a)+ 3]
                                 ^ s_axis_rq_tdata[(8*a)+ 4] ^ s_axis_rq_tdata[(8*a)+ 5]
                                 ^ s_axis_rq_tdata[(8*a)+ 6] ^ s_axis_rq_tdata[(8*a)+ 7]);

        assign s_axis_cc_tparity[a] = !(  s_axis_cc_tdata[(8*a)+ 0] ^ s_axis_cc_tdata[(8*a)+ 1]
                                 ^ s_axis_cc_tdata[(8*a)+ 2] ^ s_axis_cc_tdata[(8*a)+ 3]
                                 ^ s_axis_cc_tdata[(8*a)+ 4] ^ s_axis_cc_tdata[(8*a)+ 5]
                                 ^ s_axis_cc_tdata[(8*a)+ 6] ^ s_axis_cc_tdata[(8*a)+ 7]);
      end
    end else begin
      genvar b;
      for(b=0; b< STRB_WIDTH; b = b + 1) // Drive parity low if not enabled
      begin : parity_assign
        assign s_axis_rq_tparity[b] = 32'b0;
        assign s_axis_cc_tparity[b] = 32'b0;
      end
    end
  endgenerate



  generate // 256 bit Interface

  if( AXISTEN_IF_WIDTH == 2'b10)
  begin

    always @ ( posedge user_clk )
    begin

      if(!reset_n ) begin

        state                   <= #TCQ PIO_TX_RST_STATE;
        s_axis_cc_tdata         <= #TCQ {C_DATA_WIDTH{1'b0}};
        s_axis_cc_tkeep         <= #TCQ {KEEP_WIDTH{1'b0}};
        s_axis_cc_tlast         <= #TCQ 1'b0;
        s_axis_cc_tvalid        <= #TCQ 1'b0;
        s_axis_cc_tuser         <= #TCQ 33'b0;
        s_axis_rq_tdata         <= #TCQ {C_DATA_WIDTH{1'b0}};
        s_axis_rq_tkeep         <= #TCQ {KEEP_WIDTH{1'b0}};
        s_axis_rq_tlast         <= #TCQ 1'b0;
        s_axis_rq_tvalid        <= #TCQ 1'b0;
        s_axis_rq_tuser         <= #TCQ 60'b0;
        cfg_msg_transmit        <= #TCQ 1'b0;
        cfg_msg_transmit_type   <= #TCQ 3'b0;
        cfg_msg_transmit_data   <= #TCQ 32'b0;
        compl_done              <= #TCQ 1'b0;
        dword_count             <= #TCQ 1'b0;
        trn_sent                <= #TCQ 1'b0;

      end else begin // reset_else_block

            case (state)

              PIO_TX_RST_STATE : begin  // Reset_State

                state                   <= #TCQ PIO_TX_RST_STATE;
                s_axis_cc_tdata         <= #TCQ {C_DATA_WIDTH{1'b0}};
                s_axis_cc_tkeep         <= #TCQ {KEEP_WIDTH{1'b1}};
                s_axis_cc_tlast         <= #TCQ 1'b0;
                s_axis_cc_tvalid        <= #TCQ 1'b0;
                s_axis_cc_tuser         <= #TCQ 33'b0;
                s_axis_rq_tdata         <= #TCQ {C_DATA_WIDTH{1'b0}};
                s_axis_rq_tkeep         <= #TCQ {KEEP_WIDTH{1'b0}};
                s_axis_rq_tlast         <= #TCQ 1'b0;
                s_axis_rq_tvalid        <= #TCQ 1'b0;
                s_axis_rq_tuser         <= #TCQ 60'b0;
                cfg_msg_transmit        <= #TCQ 1'b0;
                cfg_msg_transmit_type   <= #TCQ 3'b0;
                cfg_msg_transmit_data   <= #TCQ 32'b0;
                compl_done              <= #TCQ 1'b0;
                trn_sent                <= #TCQ 1'b0;
                dword_count             <= #TCQ 1'b0;

                if(req_compl) begin
                   state <= #TCQ PIO_TX_COMPL_C1;
                end else if (req_compl_wd) begin
                   state <= #TCQ PIO_TX_COMPL_WD_C1;
                end else if (req_compl_ur) begin
                   state <= #TCQ PIO_TX_CPL_UR_C1;
                end else if (gen_transaction) begin
                   state <= #TCQ PIO_TX_MRD_C1;
                end
              end // PIO_TX_RST_STATE

              PIO_TX_COMPL_C1 : begin // Completion Without Payload - Alignment doesnt matter
                                   // Sent in a Single Beat When Interface Width is 256 bit
                if(req_compl_qq) begin
                  s_axis_cc_tvalid  <= #TCQ 1'b1;
                  s_axis_cc_tlast   <= #TCQ 1'b1;
                  s_axis_cc_tkeep   <= #TCQ 8'h07;
                  s_axis_cc_tdata   <= #TCQ {160'b0,        // Tied to 0 for 3DW completion descriptor
                                             1'b0,          // Force ECRC
                                             1'b0, req_attr,// 3- bits
                                             req_tc,        // 3- bits
                                             1'b0,          // Completer ID to control selection of Client
                                                            // Supplied Bus number
                                             8'hAA,              // Completer Bus number - Bus# selected if Compl ID = 1
                                             {5'b11111, 3'b000}, // Compl Dev / Func no - Dev# selected if Compl ID = 1. Function# = 0
                                             req_tag,       // Matching Request Tag
                                             req_rid,       // Requester ID - 16 bits
                                             1'b0,          // Rsvd
                                             1'b0,          // Posioned completion
                                             3'b000,        // SuccessFull completion
                                             (req_mem ? (11'h1 + payload_len) : 11'b0),         // DWord Count 0 - IO Write completions
                                             2'b0,          // Rsvd
                                             1'b0,          // Locked Read Completion
                                             {1'b0, byte_count},                                // Byte Count
                                             6'b0,          // Rsvd
                                             req_at,        // Adress Type - 2 bits
                                             1'b0,          // Rsvd
                                             lower_addr};   // Starting address of the mem byte - 7 bits
                  s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                  if(s_axis_cc_tready) begin
                    state <= #TCQ PIO_TX_RST_STATE;
                    compl_done        <= #TCQ 1'b1;
                  end else begin
                    state <= #TCQ PIO_TX_COMPL_C1;
                  end
                end

              end  //PIO_TX_COMPL

              PIO_TX_COMPL_WD_C1 : begin  // Completion With Payload
                                       // Possible Scenario's Payload can be 1 DW or 2 DW
                                       // Alignment can be either of Dword aligned or address aligned
                if (req_compl_wd_qqq) begin

                  if(payload_len == 0) // 1DW_packet - Requires just one cycle to get the data rd_data from the BRAM.
                  begin
                    if(AXISTEN_IF_CC_ALIGNMENT_MODE == "FALSE") begin // DWORD_aligned_Mode
                      s_axis_cc_tvalid  <= #TCQ 1'b1;
                      s_axis_cc_tlast   <= #TCQ 1'b1;
                      s_axis_cc_tkeep   <= #TCQ 8'h0F;
                      s_axis_cc_tdata   <= #TCQ {128'b0,        // Tied to 0 for 3DW completion descriptor
                                                 rd_data,       // 32- bit read data
                                                 1'b0,          // Force ECRC
                                                 1'b0, req_attr,// 3- bits
                                                 req_tc,        // 3- bits
                                                 1'b0,          // Completer ID to control selection of Client
                                                                // Supplied Bus number
                                                 8'hAA,              // Completer Bus number - Bus# selected if Compl ID = 1
                                                 {5'b11111, 3'b000}, // Compl Dev / Func no - Dev# selected if Compl ID = 1. Function# = 0
                                                 req_tag,       // Matching Request Tag
                                                 req_rid,       // Requester ID - 16 bits
                                                 1'b0,          // Rsvd
                                                 1'b0,          // Posioned completion
                                                 3'b000,        // SuccessFull completion
                                                 (req_mem ? (11'h1 + payload_len) : 11'b1),         // DWord Count 0 - IO Write completions
                                                 2'b0,          // Rsvd
                                                 (req_mem_lock? 1'b1 : 1'b0),  // Locked Read Completion
                                                 {1'b0, byte_count},           // Byte Count
                                                 6'b0,          // Rsvd
                                                 req_at,        // Adress Type - 2 bits
                                                 1'b0,          // Rsvd
                                                 lower_addr};   // Starting address of the mem byte - 7 bits
                      s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                      if(s_axis_cc_tready) begin
                        state <= #TCQ PIO_TX_RST_STATE;
                        compl_done        <= #TCQ 1'b1;
                      end else begin
                        state <= #TCQ PIO_TX_COMPL_WD_C1;
                      end
                    end  //DWORD_aligned_Mode

                    else begin // Addr_aligned_mode
                      s_axis_cc_tvalid  <= #TCQ 1'b1;
                      s_axis_cc_tlast   <= #TCQ 1'b0;
                      s_axis_cc_tkeep   <= #TCQ 8'hFF;
                      s_axis_cc_tdata   <= #TCQ {160'b0,        // Tied to 0 for 3DW completion descriptor
                                                 1'b0,          // Force ECRC
                                                 1'b0, req_attr,// 3- bits
                                                 req_tc,        // 3- bits
                                                 1'b0,          // Completer ID to control selection of Client
                                                                // Supplied Bus number
                                                 8'hAA,              // Completer Bus number - Bus# selected if Compl ID = 1
                                                 {5'b11111, 3'b000}, // Compl Dev / Func no - Dev# selected if Compl ID = 1. Function# = 0
                                                 req_tag,       // Matching Request Tag
                                                 req_rid,       // Requester ID - 16 bits
                                                 1'b0,          // Rsvd
                                                 1'b0,          // Posioned completion
                                                 3'b000,        // SuccessFull completion
                                                 (req_mem ? (11'h1 + payload_len) : 11'b1),         // DWord Count 0 - IO Write completions
                                                 2'b0,          // Rsvd
                                                 (req_mem_lock? 1'b1 : 1'b0),      // Locked Read Completion
                                                 {1'b0, byte_count},               // Byte Count
                                                 6'b0,          // Rsvd
                                                 req_at,        // Adress Type - 2 bits
                                                 1'b0,          // Rsvd
                                                 lower_addr};   // Starting address of the mem byte - 7 bits
                      s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};
                      compl_done        <= #TCQ 1'b0;

                      if(s_axis_cc_tready) begin
                        state <= #TCQ PIO_TX_COMPL_PYLD;
                      end else begin
                        state <= #TCQ PIO_TX_COMPL_WD_C1;
                      end
                    end    // Addr_aligned_mode

                  end //1DW_packet


                  else begin // 2DW_packet
                    if(AXISTEN_IF_CC_ALIGNMENT_MODE == "FALSE") begin // DWORD_aligned_Mode

                      dword_count <= #TCQ 1'b1; // To increment the Read Address
                      rd_data_reg <= #TCQ rd_data; // store the current read data
                      state       <= #TCQ PIO_TX_COMPL_WD_2DW;

                    end  //DWORD_aligned_Mode

                    else begin // Address ALigned Mode

                      s_axis_cc_tvalid  <= #TCQ 1'b1;
                      s_axis_cc_tlast   <= #TCQ 1'b0;
                      s_axis_cc_tkeep   <= #TCQ 8'hFF;
                      s_axis_cc_tdata   <= #TCQ {160'b0,        // Tied to 0 for 3DW completion descriptor
                                                 1'b0,          // Force ECRC
                                                 1'b0, req_attr,// 3- bits
                                                 req_tc,        // 3- bits
                                                 1'b0,          // Completer ID to control selection of Client
                                                                // Supplied Bus number
                                                 8'hAA,              // Completer Bus number - Bus# selected if Compl ID = 1
                                                 {5'b11111, 3'b000}, // Compl Dev / Func no - Dev# selected if Compl ID = 1. Function# = 0
                                                 req_tag,       // Matching Request Tag
                                                 req_rid,       // Requester ID - 16 bits
                                                 1'b0,          // Rsvd
                                                 1'b0,          // Posioned completion
                                                 3'b000,        // SuccessFull completion
                                                 (req_mem ? (11'h1 + payload_len) : 11'b1),         // DWord Count 0 - IO Write completions
                                                 2'b0,          // Rsvd
                                                 (req_mem_lock? 1'b1 : 1'b0),      // Locked Read Completion
                                                 {1'b0, byte_count},               // Byte Count
                                                 6'b0,          // Rsvd
                                                 req_at,        // Adress Type - 2 bits
                                                 1'b0,          // Rsvd
                                                 lower_addr};   // Starting address of the mem byte - 7 bits
                      s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};
                      rd_data_reg       <= #TCQ rd_data; // store the current read data
                      compl_done        <= #TCQ 1'b0;

                      if(s_axis_cc_tready) begin
                        state <= #TCQ PIO_TX_COMPL_WD_2DW_ADDR_ALGN_C1;
                        dword_count       <= #TCQ 1'b1; // To increment the Read Address
                      end else begin
                        state <= #TCQ PIO_TX_COMPL_WD_C1;
                      end
                    end  // Address ALigned mode
                  end  // 2DW_packet
                end

              end // PIO_TX_COMPL_WD

              PIO_TX_COMPL_PYLD : begin // Completion with 1DW Payload in Address Aligned mode

                s_axis_cc_tvalid  <= #TCQ 1'b1;
                s_axis_cc_tlast   <= #TCQ 1'b1;
                s_axis_cc_tkeep   <= #TCQ tkeep_q;
                s_axis_cc_tdata[31:0]      <= #TCQ (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" && lower_addr_q[4:2]==3'b000) ? {rd_data} : ((AXISTEN_IF_CC_ALIGNMENT_MODE == "FALSE" ) ? rd_data : 32'b0);
                s_axis_cc_tdata[63:32]     <= #TCQ (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" && lower_addr_q[4:2]==3'b001) ? {rd_data} : {32'b0};
                s_axis_cc_tdata[95:64]     <= #TCQ (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" && lower_addr_q[4:2]==3'b010) ? {rd_data} : {32'b0};
                s_axis_cc_tdata[127:96]    <= #TCQ (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" && lower_addr_q[4:2]==3'b011) ? {rd_data} : {32'b0};
                s_axis_cc_tdata[159:128]   <= #TCQ (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" && lower_addr_q[4:2]==3'b100) ? {rd_data} : {32'b0};
                s_axis_cc_tdata[191:160]   <= #TCQ (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" && lower_addr_q[4:2]==3'b101) ? {rd_data} : {32'b0};
                s_axis_cc_tdata[223:192]   <= #TCQ (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" && lower_addr_q[4:2]==3'b110) ? {rd_data} : {32'b0};
                s_axis_cc_tdata[255:224]   <= #TCQ (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" && lower_addr_q[4:2]==3'b111) ? {rd_data} : {32'b0};

                s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                if(s_axis_cc_tready) begin
                  state        <= #TCQ PIO_TX_RST_STATE;
                  compl_done   <= #TCQ 1'b1;
                end else begin
                  state <= #TCQ PIO_TX_COMPL_PYLD;
                end
              end // PIO_TX_COMPL_PYLD

              PIO_TX_COMPL_WD_2DW : begin // Completion with 2DW Payload in DWord Aligned mode
                                          // Requires 2 states to get the 2DW Payload

                s_axis_cc_tvalid  <= #TCQ 1'b1;
                s_axis_cc_tlast   <= #TCQ 1'b1;
                s_axis_cc_tkeep   <= #TCQ 8'h1F;
                s_axis_cc_tdata   <= #TCQ {96'b0,         // Tied to 0 for 3DW completion descriptor with 2DW Payload
                                           rd_data,       // 32 bit read data
                                           rd_data_reg,   // 32- bit read data
                                           1'b0,          // Force ECRC
                                           1'b0, req_attr,// 3- bits
                                           req_tc,        // 3- bits
                                           1'b0,          // Completer ID to control selection of Client
                                                          // Supplied Bus number
                                           8'hAA,              // Completer Bus number - Bus# selected if Compl ID = 1
                                           {5'b11111, 3'b000}, // Compl Dev / Func no - Dev# selected if Compl ID = 1. Function# = 0
                                           req_tag,       // Matching Request Tag
                                           req_rid,       // Requester ID - 16 bits
                                           1'b0,          // Rsvd
                                           1'b0,          // Posioned completion
                                           3'b000,        // SuccessFull completion
                                           (req_mem ? (11'h1 + payload_len) : 11'b1),         // DWord Count 0 - IO Write completions
                                           2'b0,          // Rsvd
                                           (req_mem_lock? 1'b1 : 1'b0),   // Locked Read Completion
                                           {1'b0, byte_count},            // Byte Count
                                           6'b0,          // Rsvd
                                           req_at,        // Adress Type - 2 bits
                                           1'b0,          // Rsvd
                                           lower_addr};   // Starting address of the mem byte - 7 bits
                s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                if(s_axis_cc_tready) begin
                  state        <= #TCQ PIO_TX_RST_STATE;
                  compl_done   <= #TCQ 1'b1;
                end else begin
                  state <= #TCQ PIO_TX_COMPL_WD_2DW;
                  dword_count <= #TCQ 1'b1; // To increment the Read Address
                  rd_data_reg <= #TCQ rd_data; // store the current read data
                end

              end //  PIO_TX_COMPL_WD_2DW

              PIO_TX_COMPL_WD_2DW_ADDR_ALGN_C1 : begin // Completions with 2-DW Payload and Addr aligned mode

                s_axis_cc_tvalid  <= #TCQ 1'b1;
                s_axis_cc_tlast   <= #TCQ 1'b1;
                s_axis_cc_tkeep   <= #TCQ 8'h03;
                s_axis_cc_tdata   <= #TCQ {192'b0, rd_data, rd_data_reg};
                s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};
                dword_count       <= #TCQ 1'b0;
                if(s_axis_cc_tready) begin
                 state        <= #TCQ PIO_TX_RST_STATE;
                 compl_done   <= #TCQ 1'b1;
                end else begin
                  state <= #TCQ PIO_TX_COMPL_WD_2DW_ADDR_ALGN_C1;
                end // PIO_TX_COMPL_WD_2DW_ADDR_ALGN
              end


              PIO_TX_CPL_UR_C1 : begin // Completions with UR - Alignment mode matters here

                if (req_compl_ur_qq) begin

                     s_axis_cc_tvalid  <= #TCQ 1'b1;
                     s_axis_cc_tlast   <= #TCQ 1'b1;
                     s_axis_cc_tkeep   <= #TCQ 8'hFF;
                     s_axis_cc_tdata   <= #TCQ {req_des_qword1, // 64 bits - Descriptor of the request 2 DW
                                                req_des_qword0, // 64 bits - Descriptor of the request 2 DW
                                                8'b0,                // Rsvd
                                                req_des_tph_st_tag,  // TPH Steering tag - 8 bits
                                                5'b0,                // Rsvd
                                                req_des_tph_type,    // TPH type - 2 bits
                                                req_des_tph_present, // TPH present - 1 bit
                                                req_be,        // Request Byte enables - 8bits
                                                1'b0,          // Force ECRC
                                                1'b0, req_attr,// 3- bits
                                                req_tc,        // 3- bits
                                                1'b0,          // Completer ID to control selection of Client
                                                               // Supplied Bus number
                                                8'hAA,              // Completer Bus number - Bus# selected if Compl ID = 1
                                                {5'b11111, 3'b000}, // Compl Dev / Func no - Dev# selected if Compl ID = 1. Function# = 0
                                                req_tag,       // Matching Request Tag
                                                req_rid,       // Requester ID - 16 bits
                                                1'b0,          // Rsvd
                                                1'b0,          // Posioned completion
                                                3'b001,        // Completion Status - UR
                                                11'h000,       // DWord Count
                                                2'b0,          // Rsvd
                                                (req_mem_lock? 1'b1 : 1'b0),   // Locked Read Completion
                                                13'h0004,      // Byte Count
                                                6'b0,          // Rsvd
                                                req_at,        // Adress Type - 2 bits
                                                1'b0,          // Rsvd
                                                lower_addr};   // Starting address of the mem byte - 7 bits
                     s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};
                     if(s_axis_cc_tready) begin
                       state        <= #TCQ PIO_TX_RST_STATE;
                       compl_done   <= #TCQ 1'b1;
                     end else begin
                       state        <= #TCQ PIO_TX_CPL_UR_C1;
                     end
                end

              end // PIO_TX_CPL_UR

//             PIO_TX_CPL_UR_PYLD_C1 : begin // Completion for UR with addr aligned mode
//
//               s_axis_cc_tvalid  <= #TCQ 1'b1;
//               s_axis_cc_tlast   <= #TCQ 1'b1;
//               s_axis_cc_tkeep   <= #TCQ 8'h1F;
//               s_axis_cc_tdata   <= #TCQ {96'b0,
//                                          req_des_qword1, // 64 bits - Descriptor of the request 2 DW
//                                          req_des_qword0, // 64 bits - Descriptor of the request 2 DW
//                                          8'b0, // Rsvd
//                                          req_des_tph_st_tag,   // TPH Steering tag - 8 bits
//                                          5'b0,  // Rsvd
//                                          req_des_tph_type,    // TPH type - 2 bits
//                                          req_des_tph_present, // TPH present - 1 bit
//                                          req_be};          // Request Byte enables - 8bits
//               s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};
//               if(s_axis_cc_tready) begin
//                 state        <= #TCQ PIO_TX_RST_STATE;
//                 compl_done   <= #TCQ 1'b1;
//               end
//               else
//                 state        <= #TCQ PIO_TX_CPL_UR_PYLD_C1;
//
//             end // PIO_TX_CPL_UR_PYLD


              PIO_TX_MRD_C1 : begin // Memory Read Transaction - Alignment Doesnt Matter

                s_axis_rq_tvalid  <= #TCQ 1'b1;
                s_axis_rq_tlast   <= #TCQ 1'b1;
                s_axis_rq_tkeep   <= #TCQ 8'h0F;  // 4DW Descriptor For Memory Transaction Alone
                s_axis_rq_tdata   <= #TCQ {128'b0,       // 4DW Unused
                                           1'b0,         // Force ECRC
                                           3'b000,       // Attributes
                                           3'b000,       // Traffic Class
                                           1'b0,         // RID Enable to use the Client supplied Bus/Device/Func No
                                           16'b0,        // Completer -ID, set only for Completers or ID based routing
                                           (AXISTEN_IF_ENABLE_CLIENT_TAG ?
                                           8'hCC : req_tag),  // Select Client Tag or core's internal tag
                                           8'hAA,             // Req Bus No- Bus# used only when RID enable = 1
                                           {5'b11111, 3'b000},// Req Dev/Func no - Dev# used only when RID enable = 1. Function# = 0
                                           1'b0,              // Poisoned Req
                                           4'b0000,           // Req Type for MRd Req
                                           11'h001,           // DWORD Count
                                           62'h2AAA_BBBB_CCCC_DDDD, // Memory Read Address [62 bits]
                                           2'b00};             //AT -> 00- Untranslated Address

                s_axis_rq_tuser          <= #TCQ {(AXISTEN_IF_RQ_PARITY_CHECK ? s_axis_rq_tparity : 32'b0), // Parity
                                                  4'b1010,      // Seq Number
                                                  8'h00,        // TPH Steering Tag
                                                  1'b0,         // TPH indirect Tag Enable
                                                  2'b0,         // TPH Type
                                                  1'b0,         // TPH Present
                                                  1'b0,         // Discontinue
                                                  3'b000,       // Byte Lane number in case of Address Aligned mode
                                                  4'h0,    // Last BE of the Read Data
                                                  4'hF}; // First BE of the Read Data


                if(s_axis_rq_tready) begin
                  state <= #TCQ PIO_TX_RST_STATE;
                  trn_sent <= #TCQ 1'b1;
                end
                else
                  state <= #TCQ PIO_TX_MRD_C1;

              end // PIO_TX_MRD

            endcase

          end // reset_else_block

      end // Always Block Ends
    end // If AXISTEN_IF_WIDTH = 256

    else if( AXISTEN_IF_WIDTH == 2'b01) // 128-bit Interface
    begin
    always @ ( posedge user_clk )
    begin

      if(!reset_n ) begin

        state                   <= #TCQ PIO_TX_RST_STATE;
        s_axis_cc_tdata         <= #TCQ {C_DATA_WIDTH{1'b0}};
        s_axis_cc_tkeep         <= #TCQ {KEEP_WIDTH{1'b0}};
        s_axis_cc_tlast         <= #TCQ 1'b0;
        s_axis_cc_tvalid        <= #TCQ 1'b0;
        s_axis_cc_tuser         <= #TCQ 33'b0;
        s_axis_rq_tdata         <= #TCQ {C_DATA_WIDTH{1'b0}};
        s_axis_rq_tkeep         <= #TCQ {KEEP_WIDTH{1'b0}};
        s_axis_rq_tlast         <= #TCQ 1'b0;
        s_axis_rq_tvalid        <= #TCQ 1'b0;
        s_axis_rq_tuser         <= #TCQ 60'b0;
        cfg_msg_transmit        <= #TCQ 1'b0;
        cfg_msg_transmit_type   <= #TCQ 3'b0;
        cfg_msg_transmit_data   <= #TCQ 32'b0;
        compl_done              <= #TCQ 1'b0;
        dword_count             <= #TCQ 1'b0;
        trn_sent                <= #TCQ 1'b0;

      end else begin // reset_else_block

            case (state)

              PIO_TX_RST_STATE : begin  // Reset_State

                state                   <= #TCQ PIO_TX_RST_STATE;
                s_axis_cc_tdata         <= #TCQ {C_DATA_WIDTH{1'b0}};
                s_axis_cc_tkeep         <= #TCQ {KEEP_WIDTH{1'b1}};
                s_axis_cc_tlast         <= #TCQ 1'b0;
                s_axis_cc_tvalid        <= #TCQ 1'b0;
                s_axis_cc_tuser         <= #TCQ 33'b0;
                s_axis_rq_tdata         <= #TCQ {C_DATA_WIDTH{1'b0}};
                s_axis_rq_tkeep         <= #TCQ {KEEP_WIDTH{1'b0}};
                s_axis_rq_tlast         <= #TCQ 1'b0;
                s_axis_rq_tvalid        <= #TCQ 1'b0;
                s_axis_rq_tuser         <= #TCQ 60'b0;
                cfg_msg_transmit        <= #TCQ 1'b0;
                cfg_msg_transmit_type   <= #TCQ 3'b0;
                cfg_msg_transmit_data   <= #TCQ 32'b0;
                compl_done              <= #TCQ 1'b0;
                trn_sent                <= #TCQ 1'b0;
                dword_count             <= #TCQ 1'b0;

                if(req_compl) begin
                   state <= #TCQ PIO_TX_COMPL_C1;
                end else if (req_compl_wd) begin
                   state <= #TCQ PIO_TX_COMPL_WD_C1;
                end else if (req_compl_ur) begin
                   state <= #TCQ PIO_TX_CPL_UR_C1;
                end else if (gen_transaction) begin
                   state <= #TCQ PIO_TX_MRD_C1;
                end

              end // PIO_TX_RST_STATE

              PIO_TX_COMPL_C1 : begin // Completion Without Payload - Alignment doesnt matter
                                   // Sent in a Single Beat When Interface Width is 128 bit
                if(req_compl_qq) begin
                  s_axis_cc_tvalid  <= #TCQ 1'b1;
                  s_axis_cc_tlast   <= #TCQ 1'b1;
                  s_axis_cc_tkeep   <= #TCQ 4'h7;
                  s_axis_cc_tdata   <= #TCQ {32'b0,        // Tied to 0 for 3DW completion descriptor
                                             1'b0,          // Force ECRC
                                             1'b0, req_attr,// 3- bits
                                             req_tc,        // 3- bits
                                             1'b0,          // Completer ID to control selection of Client
                                                            // Supplied Bus number
                                             8'hAA,              // Completer Bus number - Bus# selected if Compl ID = 1
                                             {5'b11111, 3'b000}, // Compl Dev / Func no - Dev# selected if Compl ID = 1. Function# = 0
                                             req_tag,       // Matching Request Tag
                                             req_rid,       // Requester ID - 16 bits
                                             1'b0,          // Rsvd
                                             1'b0,          // Posioned completion
                                             3'b000,        // SuccessFull completion
                                             (req_mem ? (11'h1 + payload_len) : 11'b0),         // DWord Count 0 - IO Write completions
                                             2'b0,          // Rsvd
                                             1'b0,          // Locked Read Completion
                                             {1'b0, byte_count},        // Byte Count
                                             6'b0,          // Rsvd
                                             req_at,        // Adress Type - 2 bits
                                             1'b0,          // Rsvd
                                             lower_addr};   // Starting address of the mem byte - 7 bits
                  s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                  if(s_axis_cc_tready) begin
                    state <= #TCQ PIO_TX_RST_STATE;
                    compl_done        <= #TCQ 1'b1;
                  end else begin
                    state <= #TCQ PIO_TX_COMPL_C1;
                  end

                end
              end  //PIO_TX_COMPL

              PIO_TX_COMPL_WD_C1 : begin  // Completion With Payload
                                          // Possible Scenario's Payload can be 1 DW or 2 DW
                                          // Alignment can be either of Dword aligned or address aligned
                if(req_compl_wd_qqq) begin

                  if(AXISTEN_IF_CC_ALIGNMENT_MODE == "FALSE") begin // DWORD_aligned_Mode
                      s_axis_cc_tvalid  <= #TCQ 1'b1;
                      s_axis_cc_tlast   <= #TCQ 1'b1;
                      s_axis_cc_tkeep   <= #TCQ 4'hF;
                      s_axis_cc_tdata   <= #TCQ {rd_data,       // 32- bit read data
                                                 1'b0,          // Force ECRC
                                                 1'b0, req_attr,// 3- bits
                                                 req_tc,        // 3- bits
                                                 1'b0,          // Completer ID to control selection of Client
                                                                // Supplied Bus number
                                                 8'hAA,              // Completer Bus number - Bus# selected if Compl ID = 1
                                                 {5'b11111, 3'b000}, // Compl Dev / Func no - Dev# sel if Compl ID = 1. Function# = 0
                                                 req_tag,       // Matching Request Tag
                                                 req_rid,       // Requester ID - 16 bits
                                                 1'b0,          // Rsvd
                                                 1'b0,          // Posioned completion
                                                 3'b000,        // SuccessFull completion
                                                 (req_mem ? (11'h1 + payload_len) : 11'b1),         // DWord Count 0 - IO Write completions
                                                 2'b0,          // Rsvd
                                                 (req_mem_lock? 1'b1 : 1'b0),  // Locked Read Completion
                                                 {1'b0, byte_count},           // Byte Count
                                                 6'b0,          // Rsvd
                                                 req_at,        // Adress Type - 2 bits
                                                 1'b0,          // Rsvd
                                                 lower_addr};   // Starting address of the mem byte - 7 bits
                      s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                      if(s_axis_cc_tready) begin
                        if(payload_len == 0) begin // 1DW_packet - Requires just one cycle to get the data rd_data from the BRAM.
                          state <= #TCQ PIO_TX_RST_STATE;
                          compl_done        <= #TCQ 1'b1;
                        end else begin
                          state <= #TCQ PIO_TX_COMPL_PYLD;
                          compl_done        <= #TCQ 1'b0;
                        end
                      end else begin
                        state <= #TCQ PIO_TX_COMPL_WD_C1;
                      end
                    end  //DWORD_aligned_Mode

                    else begin // Addr_aligned_mode
                      s_axis_cc_tvalid  <= #TCQ 1'b1;
                      s_axis_cc_tlast   <= #TCQ 1'b0;
                      s_axis_cc_tkeep   <= #TCQ 4'hF;
                      s_axis_cc_tdata   <= #TCQ {32'b0,        // Tied to 0 for 3DW completion descriptor
                                                 1'b0,          // Force ECRC
                                                 1'b0, req_attr,// 3- bits
                                                 req_tc,        // 3- bits
                                                 1'b0,          // Completer ID to control selection of Client
                                                                // Supplied Bus number
                                                 8'hAA,              // Completer Bus number - Bus# selected if Compl ID = 1
                                                 {5'b11111, 3'b000}, // Compl Dev / Func no - Dev# selected if Compl ID = 1. Function# = 0
                                                 req_tag,       // Matching Request Tag
                                                 req_rid,       // Requester ID - 16 bits
                                                 1'b0,          // Rsvd
                                                 1'b0,          // Posioned completion
                                                 3'b000,        // SuccessFull completion
                                                 (req_mem ? (11'h1 + payload_len) : 11'b1),         // DWord Count 0 - IO Write completions
                                                 2'b0,          // Rsvd
                                                 (req_mem_lock? 1'b1 : 1'b0),      // Locked Read Completion
                                                 {1'b0, byte_count},               // Byte Count
                                                 6'b0,          // Rsvd
                                                 req_at,        // Adress Type - 2 bits
                                                 1'b0,          // Rsvd
                                                 lower_addr};   // Starting address of the mem byte - 7 bits
                      s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};
                      compl_done        <= #TCQ 1'b0;

                      if(s_axis_cc_tready)
                        if(payload_len == 0) // 1DW_packet - Requires just one cycle to get the data rd_data from the BRAM.
                        begin
                          state <= #TCQ PIO_TX_COMPL_PYLD;
                        end else begin
                          state <= #TCQ PIO_TX_COMPL_WD_2DW;
                          dword_count <= #TCQ 1'b1;    // To increment the Read Address
                          rd_data_reg <= #TCQ rd_data; // store the current read data
                        end else begin
                          state <= #TCQ PIO_TX_COMPL_WD_C1;
                        end
                    end    // Addr_aligned_mode
                end

              end // PIO_TX_COMPL_WD

              PIO_TX_COMPL_PYLD : begin // Completion with 1DW Payload in Address Aligned mode

                s_axis_cc_tvalid  <= #TCQ 1'b1;
                s_axis_cc_tlast   <= #TCQ 1'b1;
                s_axis_cc_tkeep   <= #TCQ (tkeep_q[7:0]&8'hF);
                s_axis_cc_tdata[31:0]   <= #TCQ (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" && lower_addr_q[3:2]==2'b00) ? {rd_data} : ((AXISTEN_IF_CC_ALIGNMENT_MODE == "FALSE" ) ? rd_data : 32'b0);
                s_axis_cc_tdata[63:32]   <= #TCQ (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" && lower_addr_q[3:2]==2'b01) ? {rd_data} : {32'b0};
                s_axis_cc_tdata[95:64]   <= #TCQ (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" && lower_addr_q[3:2]==2'b10) ? {rd_data} : {32'b0};
                s_axis_cc_tdata[127:96]   <= #TCQ (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" && lower_addr_q[3:2]==2'b11) ? {rd_data} : {32'b0};
                s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                if(s_axis_cc_tready) begin
                  state           <= #TCQ PIO_TX_RST_STATE;
                  compl_done      <= #TCQ 1'b1;
                end else begin
                  state           <= #TCQ PIO_TX_COMPL_PYLD;
                end

              end // PIO_TX_COMPL_PYLD

              PIO_TX_COMPL_WD_2DW : begin // Completion with 2DW Payload in DWord Aligned mode
                                          // Requires 2 states to get the 2DW Payload

                s_axis_cc_tvalid  <= #TCQ 1'b1;
                s_axis_cc_tlast   <= #TCQ 1'b1;
                s_axis_cc_tkeep   <= #TCQ 4'h3;
                s_axis_cc_tdata   <= #TCQ {64'b0, rd_data, rd_data_reg};  // Transmit 2 DW payload
                s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                if(s_axis_cc_tready) begin
                  state           <= #TCQ PIO_TX_RST_STATE;
                  compl_done      <= #TCQ 1'b1;
                end else begin
                  state           <= #TCQ PIO_TX_COMPL_WD_2DW;
                end

              end //  PIO_TX_COMPL_WD_2DW

              PIO_TX_CPL_UR_C1 : begin // Completions with UR - Alignement mode matters here

                if(req_compl_ur_qq) begin

                     s_axis_cc_tvalid  <= #TCQ 1'b1;
                     s_axis_cc_tlast   <= #TCQ 1'b0;
                     s_axis_cc_tkeep   <= #TCQ 4'hF;
                     compl_done        <= #TCQ 1'b0;
                     s_axis_cc_tdata   <= #TCQ {8'b0,                // Rsvd
                                                req_des_tph_st_tag,  // TPH Steering tag - 8 bits
                                                5'b0,                // Rsvd
                                                req_des_tph_type,    // TPH type - 2 bits
                                                req_des_tph_present, // TPH present - 1 bit
                                                req_be,              // Request Byte enables - 8bits

                                                1'b0,                // Force ECRC
                                                1'b0, req_attr,      // 3- bits
                                                req_tc,              // 3- bits
                                                1'b0,                // Completer ID to control selection of Client
                                                                     // Supplied Bus number
                                                8'hAA,               // Completer Bus number - Bus# selected if Compl ID = 1
                                                {5'b11111, 3'b000},  // Compl Dev / Func no - Dev# selected if Compl ID = 1. Function# = 0
                                                req_tag,             // Matching Request Tag
                                                req_rid,             // Requester ID - 16 bits
                                                1'b0,                // Rsvd
                                                1'b0,                // Posioned completion
                                                3'b001,              // Completion Status - UR
                                                11'h000,             // DWord Count
                                                2'b0,                // Rsvd
                                                (req_mem_lock? 1'b1 : 1'b0),   // Locked Read Completion
                                                13'h0004,            // Byte Count
                                                6'b0,                // Rsvd
                                                req_at,              // Adress Type - 2 bits
                                                1'b0,                // Rsvd
                                                lower_addr};   // Starting address of the mem byte - 7 bits
                     s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};
                     if (s_axis_cc_tready) begin
                       state           <= #TCQ PIO_TX_CPL_UR_C2;
                     end else begin
                       state           <= #TCQ PIO_TX_CPL_UR_C1;
                     end
                end

              end // PIO_TX_CPL_UR_C1

              PIO_TX_CPL_UR_C2 : begin // Completion for UR - Clock 2


                 s_axis_cc_tvalid  <= #TCQ 1'b1;
                 s_axis_cc_tlast   <= #TCQ 1'b1;
                 s_axis_cc_tkeep   <= #TCQ 4'hF;
                 s_axis_cc_tdata   <= #TCQ {req_des_qword1,      // 64 bits - Descriptor of the request 2 DW
                                            req_des_qword0};     // 64 bits - Descriptor of the request 2 DW};

                 s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};
                 if (s_axis_cc_tready) begin
                   state           <= #TCQ PIO_TX_RST_STATE;
                   compl_done      <= #TCQ 1'b1;
                 end else begin
                   state           <= #TCQ PIO_TX_CPL_UR_C2;
                 end
//                s_axis_cc_tvalid  <= #TCQ 1'b1;
//                s_axis_cc_tlast   <= #TCQ 1'b1;
//                s_axis_cc_tkeep   <= #TCQ 8'h1F;
//                s_axis_cc_tdata   <= #TCQ {96'b0,
//                                           req_des_qword1, // 64 bits - Descriptor of the request 2 DW
//                                           req_des_qword0, // 64 bits - Descriptor of the request 2 DW
//                                           8'b0, // Rsvd
//                                           req_des_tph_st_tag,   // TPH Steering tag - 8 bits
//                                           5'b0,  // Rsvd
//                                           req_des_tph_type,    // TPH type - 2 bits
//                                           req_des_tph_present, // TPH present - 1 bit
//                                           req_be};          // Request Byte enables - 8bits
//                s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};
//                if(s_axis_cc_tready) begin
//                  state        <= #TCQ PIO_TX_RST_STATE;
//                  compl_done   <= #TCQ 1'b1;
//                end
//                else
//                  state        <= #TCQ PIO_TX_CPL_UR_PYLD;

              end // PIO_TX_CPL_UR_PYLD_C1

              PIO_TX_MRD_C1 : begin // Memory Read Transaction - Alignment Doesnt Matter

                s_axis_rq_tvalid  <= #TCQ 1'b1;
                s_axis_rq_tlast   <= #TCQ 1'b1;
                s_axis_rq_tkeep   <= #TCQ 4'hF;  // 4DW Descriptor For Memory Transaction Alone
                s_axis_rq_tdata   <= #TCQ {1'b0,         // Force ECRC
                                           3'b000,       // Attributes
                                           3'b000,       // Traffic Class
                                           1'b0,         // RID Enable to use the Client supplied Bus/Device/Func No
                                           16'b0,        // Completer -ID, set only for Completers or ID based routing
                                           (AXISTEN_IF_ENABLE_CLIENT_TAG ?
                                           8'hCC : req_tag),  // Select Client Tag or core's internal tag
                                           8'hAA,             // Req Bus No- Bus# used only when RID enable = 1
                                           {5'b11111, 3'b000},// Req Dev/Func no - Dev# used only when RID enable = 1. Function# = 0
                                           1'b0,              // Poisoned Req
                                           4'b0000,           // Req Type for MRd Req
                                           11'h001,           // DWORD Count
                                           62'h2AAA_BBBB_CCCC_DDDD, // Memory Read Address [62 bits]
                                           2'b00};             //AT -> 00- Untranslated Address

                s_axis_rq_tuser          <= #TCQ {(AXISTEN_IF_RQ_PARITY_CHECK ? s_axis_rq_tparity : 32'b0), // Parity
                                                  4'b1010,      // Seq Number
                                                  8'h00,        // TPH Steering Tag
                                                  1'b0,         // TPH indirect Tag Enable
                                                  2'b0,         // TPH Type
                                                  1'b0,         // TPH Present
                                                  1'b0,         // Discontinue
                                                  3'b000,       // Byte Lane number in case of Address Aligned mode
                                                  4'h0,    // Last BE of the Read Data
                                                  4'hF}; // First BE of the Read Data

                if(s_axis_rq_tready) begin
                  state           <= #TCQ PIO_TX_RST_STATE;
                  trn_sent        <= #TCQ 1'b1;
                end else begin
                  state           <= #TCQ PIO_TX_MRD_C1;
                end
              end // PIO_TX_MRD

            endcase

          end // reset_else_block

      end // Always Block Ends
    end // If AXISTEN_IF_WIDTH = 128

    else
    begin // 64 Bit Interface
    always @ ( posedge user_clk )
    begin

      if(!reset_n ) begin

        state                   <= #TCQ PIO_TX_RST_STATE;
        s_axis_cc_tdata         <= #TCQ {C_DATA_WIDTH{1'b0}};
        s_axis_cc_tkeep         <= #TCQ {KEEP_WIDTH{1'b0}};
        s_axis_cc_tlast         <= #TCQ 1'b0;
        s_axis_cc_tvalid        <= #TCQ 1'b0;
        s_axis_cc_tuser         <= #TCQ 33'b0;
        s_axis_rq_tdata         <= #TCQ {C_DATA_WIDTH{1'b0}};
        s_axis_rq_tkeep         <= #TCQ {KEEP_WIDTH{1'b0}};
        s_axis_rq_tlast         <= #TCQ 1'b0;
        s_axis_rq_tvalid        <= #TCQ 1'b0;
        s_axis_rq_tuser         <= #TCQ 60'b0;
        cfg_msg_transmit        <= #TCQ 1'b0;
        cfg_msg_transmit_type   <= #TCQ 3'b0;
        cfg_msg_transmit_data   <= #TCQ 32'b0;
        compl_done              <= #TCQ 1'b0;
        dword_count             <= #TCQ 1'b0;
        trn_sent                <= #TCQ 1'b0;

      end else begin // reset_else_block

            case (state)

              PIO_TX_RST_STATE : begin  // Reset_State

                state                   <= #TCQ PIO_TX_RST_STATE;
                s_axis_cc_tdata         <= #TCQ {C_DATA_WIDTH{1'b0}};
                s_axis_cc_tkeep         <= #TCQ {KEEP_WIDTH{1'b1}};
                s_axis_cc_tlast         <= #TCQ 1'b0;
                s_axis_cc_tvalid        <= #TCQ 1'b0;
                s_axis_cc_tuser         <= #TCQ 33'b0;
                s_axis_rq_tdata         <= #TCQ {C_DATA_WIDTH{1'b0}};
                s_axis_rq_tkeep         <= #TCQ {KEEP_WIDTH{1'b0}};
                s_axis_rq_tlast         <= #TCQ 1'b0;
                s_axis_rq_tvalid        <= #TCQ 1'b0;
                s_axis_rq_tuser         <= #TCQ 60'b0;
                cfg_msg_transmit        <= #TCQ 1'b0;
                cfg_msg_transmit_type   <= #TCQ 3'b0;
                cfg_msg_transmit_data   <= #TCQ 32'b0;
                compl_done              <= #TCQ 1'b0;
                trn_sent                <= #TCQ 1'b0;
                dword_count             <= #TCQ 1'b0;

                if(req_compl) begin
                   state <= #TCQ PIO_TX_COMPL_C1;
                end else if (req_compl_wd) begin
                   state <= #TCQ PIO_TX_COMPL_WD_C1;
                end else if (req_compl_ur) begin
                   state <= #TCQ PIO_TX_CPL_UR_C1;
                end else if (gen_transaction) begin
                   state <= #TCQ PIO_TX_MRD_C1;
                end

              end // PIO_TX_RST_STATE

              PIO_TX_COMPL_C1 : begin // Completion Without Payload - Alignment doesnt matter
                                   // Sent in a Single Beat When Interface Width is 128 bit
                if(req_compl_qq)
                begin
                  s_axis_cc_tvalid  <= #TCQ 1'b1;
                  s_axis_cc_tlast   <= #TCQ 1'b0;
                  s_axis_cc_tkeep   <= #TCQ 2'h3;
                  compl_done        <= #TCQ 1'b0;
                  s_axis_cc_tdata   <= #TCQ {req_rid,       // Requester ID - 16 bits
                                             1'b0,          // Rsvd
                                             1'b0,          // Posioned completion
                                             3'b000,        // SuccessFull completion
                                             (req_mem ? (11'h1 + payload_len) : 11'b0),         // DWord Count 0 - IO Write completions
                                             2'b0,          // Rsvd
                                             1'b0,          // Locked Read Completion
                                             {1'b0, byte_count},        // Byte Count
                                             6'b0,          // Rsvd
                                             req_at,        // Adress Type - 2 bits
                                             1'b0,          // Rsvd
                                             lower_addr};   // Starting address of the mem byte - 7 bits
                  s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                  if(s_axis_cc_tready) begin
                    state           <= #TCQ PIO_TX_COMPL_C2;
                  end else begin
                    state           <= #TCQ PIO_TX_COMPL_C1;
                  end
                end
              end  //PIO_TX_COMPL

              PIO_TX_COMPL_C2 : begin // Completion Without Payload - Alignment doesnt matter
                                      // Sent in a Two Beats When Interface Width is 64 bit
                  s_axis_cc_tvalid  <= #TCQ 1'b1;
                  s_axis_cc_tlast   <= #TCQ 1'b1;
                  s_axis_cc_tkeep   <= #TCQ 2'h1;
                  s_axis_cc_tdata   <= #TCQ {32'b0,         // Tied to 0 for 3DW completion descriptor
                                             1'b0,          // Force ECRC
                                             1'b0, req_attr,// 3- bits
                                             req_tc,        // 3- bits
                                             1'b0,          // Completer ID to control selection of Client
                                                            // Supplied Bus number
                                             8'hAA,              // Completer Bus number - Bus# selected if Compl ID = 1
                                             {5'b11111, 3'b000}, // Compl Dev / Func no - Dev# selected if Compl ID = 1. Function# = 0
                                             req_tag};      // Matching Request Tag
                  s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                  if(s_axis_cc_tready) begin
                    state           <= #TCQ PIO_TX_RST_STATE;
                    compl_done      <= #TCQ 1'b1;
                  end else begin
                    state           <= #TCQ PIO_TX_COMPL_C2;
                  end

              end  //PIO_TX_COMPL

              PIO_TX_COMPL_WD_C1 : begin  // Completion With Payload
                                          // Possible Scenario's Payload can be 1 DW or 2 DW
                                          // Alignment can be either of Dword aligned or address aligned
                if(req_compl_wd_qqq)
                begin

                  s_axis_cc_tvalid  <= #TCQ 1'b1;
                  s_axis_cc_tlast   <= #TCQ 1'b0;
                  s_axis_cc_tkeep   <= #TCQ 2'h3;
                  compl_done        <= #TCQ 1'b0;
                  s_axis_cc_tdata   <= #TCQ {req_rid,                                   // Requester ID - 16 bits
                                             1'b0,                                      // Rsvd
                                             1'b0,                                      // Posioned completion
                                             3'b000,                                    // SuccessFull completion
                                             (req_mem ? (11'h1 + payload_len) : 11'b1), // DWord Count 0 - IO Write completions
                                             2'b0,                                      // Rsvd
                                             (req_mem_lock? 1'b1 : 1'b0),               // Locked Read Completion
                                             {1'b0, byte_count},                        // Byte Count
                                             6'b0,                                      // Rsvd
                                             req_at,                                    // Adress Type - 2 bits
                                             1'b0,                                      // Rsvd
                                             lower_addr};                               // Starting address of the mem byte - 7 bits
                  s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                  if(s_axis_cc_tready) begin
                    state      <= #TCQ PIO_TX_COMPL_WD_C2;
                  end else begin
                    state      <= #TCQ PIO_TX_COMPL_WD_C1;
                  end
                end

              end // PIO_TX_COMPL_WD

              PIO_TX_COMPL_WD_C2 : begin  // Completion With Payload
                                          // Possible Scenario's Payload can be 1 DW or 2 DW
                                          // Alignment can be either of Dword aligned or address aligned

                  if(AXISTEN_IF_CC_ALIGNMENT_MODE == "FALSE") begin // DWORD_aligned_Mode
                      s_axis_cc_tvalid  <= #TCQ 1'b1;
                      s_axis_cc_tkeep   <= #TCQ 2'h3;
                      s_axis_cc_tdata   <= #TCQ {rd_data,       // 32- bit read data
                                                 1'b0,          // Force ECRC
                                                 1'b0, req_attr,// 3- bits
                                                 req_tc,        // 3- bits
                                                 1'b0,          // Completer ID to control selection of Client
                                                                // Supplied Bus number
                                                 8'hAA,              // Completer Bus number - Bus# selected if Compl ID = 1
                                                 {5'b11111, 3'b000}, // Compl Dev / Func no - Dev# selected if Compl ID = 1. Function# = 0
                                                 req_tag};      // Matching Request Tag
                      s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                      if(s_axis_cc_tready) begin
                        if(payload_len == 0) // 1DW_packet - Requires just one cycle to get the data rd_data from the BRAM.
                        begin
                          state      <= #TCQ PIO_TX_RST_STATE;
                          s_axis_cc_tlast   <= #TCQ 1'b1;
                          compl_done <= #TCQ 1'b1;
                        end else begin
                          s_axis_cc_tlast   <= #TCQ 1'b0;
                          state      <= #TCQ PIO_TX_COMPL_PYLD;
                        end
                      end else begin
                        state <= #TCQ PIO_TX_COMPL_WD_C2;
                      end

                end        //DWORD_aligned_Mode
                else begin // Addr_aligned_mode
                  s_axis_cc_tvalid  <= #TCQ 1'b1;
                  s_axis_cc_tlast   <= #TCQ 1'b0;
                  s_axis_cc_tkeep   <= #TCQ 2'h3;
                  s_axis_cc_tdata   <= #TCQ {1'b0,          // Force ECRC
                                             1'b0, req_attr,// 3- bits
                                             req_tc,        // 3- bits
                                             1'b0,          // Completer ID to control selection of Client
                                                            // Supplied Bus number
                                             8'hAA,              // Completer Bus number - Bus# selected if Compl ID = 1
                                             {5'b11111, 3'b000}, // Compl Dev / Func no - Dev# selected if Compl ID = 1. Function# = 0
                                             req_tag};      // Matching Request Tag
                  s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};
                  compl_done        <= #TCQ 1'b0;

                  if(s_axis_cc_tready) begin
                    if(payload_len == 0) begin // 1DW_packet - Requires just one cycle to get the data rd_data from the BRAM.
                      state         <= #TCQ PIO_TX_COMPL_PYLD;
                    end else begin
                      state         <= #TCQ PIO_TX_COMPL_WD_2DW;
                      dword_count   <= #TCQ 1'b1;    // To increment the Read Address
                      rd_data_reg   <= #TCQ rd_data; // store the current read data
                    end
                  end else begin
                      state         <= #TCQ PIO_TX_COMPL_WD_C2;
                  end
//                end

              end    // Addr_aligned_mode
            end // PIO_TX_COMPL_WD

              PIO_TX_COMPL_PYLD : begin // Completion with 1DW Payload in Address Aligned mode

                s_axis_cc_tvalid  <= #TCQ 1'b1;
                s_axis_cc_tlast   <= #TCQ 1'b1;
                s_axis_cc_tkeep   <= #TCQ tkeep_qq[1:0]&2'h3;
                s_axis_cc_tdata   <= #TCQ (AXISTEN_IF_CC_ALIGNMENT_MODE == "TRUE" && lower_addr_qq[2]) ? {rd_data,32'b0} : {32'b0, rd_data};
                s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                if(s_axis_cc_tready) begin
                  state           <= #TCQ PIO_TX_RST_STATE;
                  compl_done      <= #TCQ 1'b1;
                end else begin
                  state           <= #TCQ PIO_TX_COMPL_PYLD;
                end

              end // PIO_TX_COMPL_PYLD

              PIO_TX_COMPL_WD_2DW : begin // Completion with 2DW Payload in DWord Aligned mode
                                          // Requires 2 states to get the 2DW Payload

                s_axis_cc_tvalid  <= #TCQ 1'b1;
                s_axis_cc_tlast   <= #TCQ 1'b1;
                s_axis_cc_tkeep   <= #TCQ 2'h3;
                s_axis_cc_tdata   <= #TCQ {rd_data, rd_data_reg};  // Transmit 2 DW payload
                s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                if(s_axis_cc_tready) begin
                  state           <= #TCQ PIO_TX_RST_STATE;
                  compl_done      <= #TCQ 1'b1;
                end else begin
                  state           <= #TCQ PIO_TX_COMPL_WD_2DW;
                end

              end //  PIO_TX_COMPL_WD_2DW

              PIO_TX_CPL_UR_C1 : begin // Completions with UR - Beat 1

                if(req_compl_ur_qq) begin

                  s_axis_cc_tvalid  <= #TCQ 1'b1;
                  s_axis_cc_tlast   <= #TCQ 1'b0;
                  s_axis_cc_tkeep   <= #TCQ 2'h3;
                  compl_done        <= #TCQ 1'b0;
                  s_axis_cc_tdata   <= #TCQ {req_rid,             // Requester ID - 16 bits
                                             1'b0,                // Rsvd
                                             1'b0,                // Posioned completion
                                             3'b001,              // Completion Status - UR
                                             11'h000,             // DWord Count
                                             2'b0,                // Rsvd
                                             (req_mem_lock? 1'b1 : 1'b0),   // Locked Read Completion
                                             13'h0004,            // Byte Count
                                             6'b0,                // Rsvd
                                             req_at,              // Adress Type - 2 bits
                                             1'b0,                // Rsvd
                                             lower_addr};   // Starting address of the mem byte - 7 bits
                  s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                  if(s_axis_cc_tready) begin
                    state           <= #TCQ PIO_TX_CPL_UR_C2;
                  end else begin
                    state           <= #TCQ PIO_TX_CPL_UR_C1;
                  end

                end
              end // PIO_TX_CPL_UR_C1

              PIO_TX_CPL_UR_C2 : begin // Completions with UR - Beat 2
                s_axis_cc_tvalid  <= #TCQ 1'b1;
                s_axis_cc_tlast   <= #TCQ 1'b0;
                s_axis_cc_tkeep   <= #TCQ 2'h3;
                compl_done        <= #TCQ 1'b0;
                s_axis_cc_tdata   <= #TCQ {8'b0,                // Rsvd
                                           req_des_tph_st_tag,  // TPH Steering tag - 8 bits
                                           5'b0,                // Rsvd
                                           req_des_tph_type,    // TPH type - 2 bits
                                           req_des_tph_present, // TPH present - 1 bit
                                           req_be,              // Request Byte enables - 8bits

                                           1'b0,                // Force ECRC
                                           1'b0, req_attr,      // 3- bits
                                           req_tc,              // 3- bits
                                           1'b0,                // Completer ID to control selection of Client
                                                                // Supplied Bus number
                                           8'hAA,               // Completer Bus number - Bus# selected if Compl ID = 1
                                           {5'b11111, 3'b000},  // Compl Dev / Func no - Dev# selected if Compl ID = 1. Function# = 0
                                           req_tag};            // Matching Request Tag
                s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                if(s_axis_cc_tready) begin
                  state           <= #TCQ PIO_TX_CPL_UR_C3;
                end else begin
                  state           <= #TCQ PIO_TX_CPL_UR_C2;
                end

              end // PIO_TX_CPL_UR_C2

              PIO_TX_CPL_UR_C3 : begin // Completions with UR - Beat 3
                s_axis_cc_tvalid  <= #TCQ 1'b1;
                s_axis_cc_tlast   <= #TCQ 1'b0;
                s_axis_cc_tkeep   <= #TCQ 2'h3;
                compl_done        <= #TCQ 1'b0;
                s_axis_cc_tdata   <= #TCQ req_des_qword0;      // 64 bits - Descriptor of the request 2 DW
                s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                if(s_axis_cc_tready) begin
                  state           <= #TCQ PIO_TX_CPL_UR_C4;
                end else begin
                  state           <= #TCQ PIO_TX_CPL_UR_C3;
                end

              end // PIO_TX_CPL_UR_C3

              PIO_TX_CPL_UR_C4 : begin // Completions with UR - Beat 4
                s_axis_cc_tvalid  <= #TCQ 1'b1;
                s_axis_cc_tlast   <= #TCQ 1'b1;
                s_axis_cc_tkeep   <= #TCQ 2'h3;
                s_axis_cc_tdata   <= #TCQ req_des_qword1;      // 64 bits - Descriptor of the request 2 DW
                s_axis_cc_tuser   <= #TCQ {1'b0, (AXISTEN_IF_CC_PARITY_CHECK ? s_axis_cc_tparity : 32'b0)};

                if(s_axis_cc_tready) begin
                  state           <= #TCQ PIO_TX_RST_STATE;
                  compl_done      <= #TCQ 1'b1;
                end else begin
                  state           <= #TCQ PIO_TX_CPL_UR_C4;
                end

              end // PIO_TX_CPL_UR_C4

              PIO_TX_MRD_C1 : begin // Memory Read Transaction - Alignment Doesnt Matter

                s_axis_rq_tvalid  <= #TCQ 1'b1;
                s_axis_rq_tlast   <= #TCQ 1'b0;
                s_axis_rq_tkeep   <= #TCQ 2'h3;  // 2DW Descriptor For Memory Transaction Alone
                trn_sent          <= #TCQ 1'b0;
                s_axis_rq_tdata   <= #TCQ {62'h2AAA_BBBB_CCCC_DDDD, // Memory Read Address [62 bits]
                                           2'b00};             //AT -> 00- Untranslated Address

                s_axis_rq_tuser          <= #TCQ {(AXISTEN_IF_RQ_PARITY_CHECK ? s_axis_rq_tparity : 32'b0), // Parity
                                                  4'b1010,      // Seq Number
                                                  8'h00,        // TPH Steering Tag
                                                  1'b0,         // TPH indirect Tag Enable
                                                  2'b0,         // TPH Type
                                                  1'b0,         // TPH Present
                                                  1'b0,         // Discontinue
                                                  3'b000,       // Byte Lane number in case of Address Aligned mode
                                                  4'h0,    // Last BE of the Read Data
                                                  4'hF}; // First BE of the Read Data

                if(s_axis_rq_tready) begin
                  state <= #TCQ PIO_TX_MRD_C2;
                end else begin
                  state <= #TCQ PIO_TX_MRD_C1;
                end

              end // PIO_TX_MRD

              PIO_TX_MRD_C2 : begin // Memory Read Transaction - Alignment Doesnt Matter

                s_axis_rq_tvalid  <= #TCQ 1'b1;
                s_axis_rq_tlast   <= #TCQ 1'b1;
                s_axis_rq_tkeep   <= #TCQ 2'h3;               // 2DW Descriptor For Memory Transaction Alone
                s_axis_rq_tdata   <= #TCQ {1'b0,              // Force ECRC
                                           3'b000,            // Attributes
                                           3'b000,            // Traffic Class
                                           1'b0,              // RID Enable to use the Client supplied Bus/Device/Func No
                                           16'b0,             // Completer -ID, set only for Completers or ID based routing
                                           (AXISTEN_IF_ENABLE_CLIENT_TAG ?
                                           8'hCC : req_tag),  // Select Client Tag or core's internal tag
                                           8'hAA,             // Req Bus No- Bus# used only when RID enable = 1
                                           {5'b11111, 3'b000},// Req Dev/Func no - Dev# used only when RID enable = 1. Function# = 0
                                           1'b0,              // Poisoned Req
                                           4'b0000,           // Req Type for MRd Req
                                           11'h001};          // DWORD Count

                s_axis_rq_tuser   <= #TCQ 60'b0;

                if(s_axis_rq_tready) begin
                  state           <= #TCQ PIO_TX_RST_STATE;
                  trn_sent        <= #TCQ 1'b1;
                end else begin
                  state           <= #TCQ PIO_TX_MRD_C2;
                end

              end // PIO_TX_MRD

            endcase

          end // reset_else_block

      end // If AXISTEN_IF_WIDTH = 64
    end
  endgenerate


  // synthesis translate_off
  reg  [8*20:1] state_ascii;
  always @(state)
  begin
    case (state)
      PIO_TX_RST_STATE                    : state_ascii <= #TCQ "TX_RST_STATE";
      PIO_TX_COMPL_C1                     : state_ascii <= #TCQ "TX_COMPL_C1";
      PIO_TX_COMPL_C2                     : state_ascii <= #TCQ "TX_COMPL_C2";
      PIO_TX_COMPL_WD_C1                  : state_ascii <= #TCQ "TX_COMPL_WD_C1";
      PIO_TX_COMPL_WD_C2                  : state_ascii <= #TCQ "TX_COMPL_WD_C2";
      PIO_TX_COMPL_PYLD                   : state_ascii <= #TCQ "TX_COMPL_PYLD";
      PIO_TX_CPL_UR_C1                    : state_ascii <= #TCQ "TX_CPL_UR_C1";
      PIO_TX_CPL_UR_C2                    : state_ascii <= #TCQ "TX_CPL_UR_C2";
      PIO_TX_CPL_UR_C3                    : state_ascii <= #TCQ "TX_CPL_UR_C3";
      PIO_TX_CPL_UR_C4                    : state_ascii <= #TCQ "TX_CPL_UR_C4";
      PIO_TX_MRD_C1                       : state_ascii <= #TCQ "TX_MRD_C1";
      PIO_TX_MRD_C2                       : state_ascii <= #TCQ "TX_MRD_C2";
      PIO_TX_COMPL_WD_2DW                 : state_ascii <= #TCQ "TX_COMPL_WD_2DW";
      PIO_TX_COMPL_WD_2DW_ADDR_ALGN_C1    : state_ascii <= #TCQ "TX_COMPL_WD_2DW_ADDR_ALGN_C1";
      PIO_TX_COMPL_WD_2DW_ADDR_ALGN_C2    : state_ascii <= #TCQ "TX_COMPL_WD_2DW_ADDR_ALGN_C2";
      default                             : state_ascii <= #TCQ "PIO STATE ERR";
    endcase
  end
  // synthesis translate_on

endmodule // PIO_TX_ENGINE

