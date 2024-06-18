// This program was cloned from: https://github.com/lnls-dig/infra-cores
// License: GNU Lesser General Public License v3.0

//-----------------------------------------------------------------------------
//
// (c) Copyright 2010-2011 Xilinx, Inc. All rights reserved.
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
// Project    : Series-7 Integrated Block for PCI Express
// File       : pcie_axi_trn_bridge.v
// Version    : 3.1
//
//     Description : AXI - TRN Bridge for Root Port Model. 
//                   Root Port Usrapp's require TRN interface.
//-----------------------------------------------------------------------

`timescale 1ns/1ns

module pcie_axi_trn_bridge # (
  parameter         C_DATA_WIDTH = 64,
  parameter         RBAR_WIDTH = 7,
  parameter         KEEP_WIDTH = C_DATA_WIDTH / 8,
  parameter         REM_WIDTH = (C_DATA_WIDTH == 128) ? 2 : 1
)
(

    // Common
  input                       user_clk,
  input                       user_reset,
  input                       user_lnk_up,

  // AXI TX
  //-----------
  output   [C_DATA_WIDTH-1:0] s_axis_tx_tdata,        // TX data from user
  output                      s_axis_tx_tvalid,       // TX data is valid
  input                       s_axis_tx_tready,       // TX ready for data
  output     [KEEP_WIDTH-1:0] s_axis_tx_tkeep,        // TX strobe byte enables
  output                      s_axis_tx_tlast,        // TX data is last
  output                [3:0] s_axis_tx_tuser,        // TX user signals

  // AXI RX
  //-----------
  input  [C_DATA_WIDTH-1:0]   m_axis_rx_tdata,        // RX data to user
  input                       m_axis_rx_tvalid,       // RX data is valid
  output                      m_axis_rx_tready,       // RX ready for data
  input    [KEEP_WIDTH-1:0]   m_axis_rx_tkeep,        // RX strobe byte enables
  input                       m_axis_rx_tlast,        // RX data is last
  input              [21:0]   m_axis_rx_tuser,        // RX user signals

  //---------------------------------------------//
  // PCIe Usrapp I/O                             //
  //---------------------------------------------//

  // TRN TX
  //-----------
  input [C_DATA_WIDTH-1:0]    trn_td,                  // TX data from usrapp
  input                       trn_tsof,                // TX start of packet
  input                       trn_teof,                // TX end of packet
  input                       trn_tsrc_rdy,            // TX source ready
  output                      trn_tdst_rdy,            // TX destination ready
  input                       trn_tsrc_dsc,            // TX source discontinue
  input    [REM_WIDTH-1:0]    trn_trem,                // TX remainder
  input                       trn_terrfwd,             // TX error forward
  input                       trn_tstr,                // TX streaming enable
  input                       trn_tecrc_gen,           // TX ECRC generate

  // TRN RX
  //-----------
  output  [C_DATA_WIDTH-1:0]  trn_rd,                  // RX data to usrapp
  output                      trn_rsof,                // RX start of packet
  output                      trn_reof,                // RX end of packet
  output                      trn_rsrc_rdy,            // RX source ready
  input                       trn_rdst_rdy,            // RX destination ready
  output reg                  trn_rsrc_dsc,            // RX source discontinue
  output     [REM_WIDTH-1:0]  trn_rrem,                // RX remainder
  output wire                 trn_rerrfwd,             // RX error forward
  output    [RBAR_WIDTH-1:0]  trn_rbar_hit             // RX BAR hit

 );

//DWORD Reordering between AXI and TRN interface//

generate begin:gen_axis_txdata
  if (C_DATA_WIDTH == 64)
  begin 
    assign s_axis_tx_tdata = {trn_td[31:0],trn_td[63:32]};
  end
  else if (C_DATA_WIDTH == 128)
  begin
    assign s_axis_tx_tdata = {trn_td[31:0],trn_td[63:32],trn_td[95:64],trn_td[127:96]};
  end
end
endgenerate

//Coversion from trn_rem to s_axis_tkeep[7:0]//

generate begin: gen_axis_tx_tkeep
if (C_DATA_WIDTH == 64)
begin
   
  assign s_axis_tx_tkeep = (trn_teof && ~trn_trem) ? 8'h0F : 8'hFF;
//  always @*
//  begin
//    if (trn_teof && ~trn_trem)  begin
//        s_axis_tx_tkeep <= 8'h0F;
//    end else begin
//        s_axis_tx_tkeep <= 8'hFF;
//    end
//  end
end

else if (C_DATA_WIDTH == 128)
begin

  assign s_axis_tx_tkeep = (trn_teof) ? ((trn_trem == 2'b11) ? 16'hFFFF :
                                         ((trn_trem == 2'b10) ? 16'h0FFF :
                                         ((trn_trem == 2'b01) ? 16'h00FF : 16'h000F ))) :
                                        16'hFFFF;
//  always @*
//  begin
//    if (trn_teof)
//    begin
//      case (trn_trem)
//        2'b11: begin s_axis_tx_tkeep <= 16'hFFFF; end
//        2'b10: begin s_axis_tx_tkeep <= 16'h0FFF; end
//        2'b01: begin s_axis_tx_tkeep <= 16'h00FF; end
//        2'b00: begin s_axis_tx_tkeep <= 16'h000F; end
//      endcase
//    end
//    else
//    begin
//        s_axis_tx_tkeep <= 16'hFFFF;
//    end
//  end
end
end
endgenerate

//Connection of s_axis_tx_tuser with  trn_tsrc_dsc,trn_tstr,trn_terr_fwd and trn_terr_fwd
assign s_axis_tx_tuser [3] = trn_tsrc_dsc; 
assign s_axis_tx_tuser [2] = trn_tstr;
assign s_axis_tx_tuser [1] = trn_terrfwd;
assign s_axis_tx_tuser [0] = trn_tecrc_gen;

//Constraint trn_tsrc_rdy. If constrained, testbench keep trn_tsrc_rdy constantly asserted. This makes axi bridge to generate trn_tsof immeditely after trn_teof of previous packet.//
reg trn_tsrc_rdy_derived = 1'b0;
always @*
begin
  if(trn_tsof && trn_tsrc_rdy && trn_tdst_rdy && !trn_teof) 
  begin
    trn_tsrc_rdy_derived <= 1'b1;
  end
  else if(trn_tsrc_rdy_derived && trn_teof && trn_tsrc_rdy && trn_tdst_rdy) 
  begin
    trn_tsrc_rdy_derived <= 1'b0;
  end
end

assign s_axis_tx_tvalid = trn_tsrc_rdy_derived || trn_tsof || trn_teof;

assign trn_tdst_rdy = s_axis_tx_tready;

assign s_axis_tx_tlast = trn_teof;

assign m_axis_rx_tready = trn_rdst_rdy;

generate begin:gen_trn_rd
if (C_DATA_WIDTH == 64) begin 
    assign trn_rd = {m_axis_rx_tdata[31:0],m_axis_rx_tdata[63:32]};
end else if (C_DATA_WIDTH == 128) begin
  assign trn_rd = {m_axis_rx_tdata[31:0],m_axis_rx_tdata [63:32],m_axis_rx_tdata [95:64],m_axis_rx_tdata [127:96]};
end
end
endgenerate

//Regenerate trn_rsof
//Used clock. Latency may have been added

reg in_packet_reg;
generate begin:gen_trn_rsof 
if (C_DATA_WIDTH == 64)
begin
  always @(posedge user_clk)
  begin
    if (user_reset)
      in_packet_reg <= 1'b0;
    else if (m_axis_rx_tvalid && m_axis_rx_tready)
      in_packet_reg <= ~m_axis_rx_tlast;
  end
  assign trn_rsof = m_axis_rx_tvalid & ~in_packet_reg;
end
else if (C_DATA_WIDTH == 128)
begin
  assign trn_rsof = m_axis_rx_tuser [14];
end
end
endgenerate

generate begin: gen_trn_reof
if (C_DATA_WIDTH == 64)
begin
  assign trn_reof = m_axis_rx_tlast;
end
else if (C_DATA_WIDTH == 128)
begin
  assign trn_reof = m_axis_rx_tuser[21]; //is_eof[4];
end
end
endgenerate

assign trn_rsrc_rdy = m_axis_rx_tvalid;

//Regenerate trn_rsrc_dsc
//Used clock. Latency may have been added
always @(posedge user_clk)
begin
  if (user_reset)
    trn_rsrc_dsc <= 1'b1;
  else
    trn_rsrc_dsc <= ~user_lnk_up;
end

wire [4:0] is_sof;
wire [4:0] is_eof;

assign is_sof = m_axis_rx_tuser[14:10];
assign is_eof = m_axis_rx_tuser[21:17];

generate begin:gen_trn_rrem
if (C_DATA_WIDTH == 64)
begin
  assign trn_rrem = m_axis_rx_tlast ? (m_axis_rx_tkeep == 8'hFF) ? 1'b1 : 1'b0: 1'b1;
end
else if (C_DATA_WIDTH == 128)
begin
  assign trn_rrem[0] = is_eof[2];
  assign trn_rrem[1] = (is_eof[4] || is_sof[4] )  ?  ( (is_sof[4] && is_eof[4] && is_eof[3]) || (!is_sof[4] && is_eof[4] && is_eof[3]) || (is_sof[4] && !is_eof[4] && !is_sof[3]) )  :   1'b1;
end
end
endgenerate

assign trn_rerrfwd = m_axis_rx_tuser[1];

assign trn_rbar_hit = m_axis_rx_tuser[8:2];


endmodule 

