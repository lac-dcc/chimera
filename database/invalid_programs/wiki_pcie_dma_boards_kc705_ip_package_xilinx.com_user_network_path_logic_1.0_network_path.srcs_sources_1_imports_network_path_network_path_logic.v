//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2013 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information of Xilinx, Inc.
// and is protected under U.S. and international copyright and other
// intellectual property laws.
//
// DISCLAIMER
//
// This disclaimer is not a license and does not grant any rights to the
// materials distributed herewith. Except as otherwise provided in a valid
// license issued to you by Xilinx, and to the maximum extent permitted by
// applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
// FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
// IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
// MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
// and (2) Xilinx shall not be liable (whether in contract or tort, including
// negligence, or under any other theory of liability) for any loss or damage
// of any kind or nature related to, arising under or in connection with these
// materials, including for any direct, or any indirect, special, incidental,
// or consequential loss or damage (including loss of data, profits, goodwill,
// or any type of loss or damage suffered as a result of any action brought by
// a third party) even if such damage or loss was reasonably foreseeable or
// Xilinx had been advised of the possibility of the same.
//
// CRITICAL APPLICATIONS
//
// Xilinx products are not designed or intended to be fail-safe, or for use in
// any application requiring fail-safe performance, such as life-support or
// safety devices or systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any other
// applications that could lead to death, personal injury, or severe property
// or environmental damage (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and liability of any use of
// Xilinx products in Critical Applications, subject only to applicable laws
// and regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
// AT ALL TIMES.
//

module network_path_logic 
(
input clk156,
input sys_rst,
input tx_fault,
input signal_detect,
input axi_str_wr_tlast_in,
input axi_str_wr_tvalid_in,
input [127:0] axi_str_wr_tdata_in,
input [15:0] axi_str_wr_tkeep_in,
input axi_str_wr_tready_in,
input [63:0] axi_str_rd_tdata_in,
input [7:0] axi_str_rd_tkeep_in,
input axi_str_rd_tvalid_in,
input axi_str_rd_tlast_in,
input axi_str_rd_tready_in,
input tx_resetdone,
input rx_resetdone,
output axi_str_wr_tlast_out,
output axi_str_wr_tvalid_out,
output [63:0] axi_str_wr_tdata_out,
output [7:0] axi_str_wr_tkeep_out,
output axi_str_wr_tready_out,
output [127:0] axi_str_rd_tdata_out,
output [15:0] axi_str_rd_tkeep_out,
output axi_str_rd_tvalid_out,
output axi_str_rd_tlast_out,
output axi_str_rd_tready_out,
output core_reset,
output resetdone,
output nw_rst_out 

);

  reg rxreset_tmp = 1'b0;
  reg txreset322_tmp = 1'b0;
  reg rxreset322_tmp = 1'b0;
  reg dclk_reset_tmp = 1'b0;
  reg core_reset_tmp = 1'b0;

  reg wr_tlast_reg = 1'b0;

  always @(posedge clk156)
    wr_tlast_reg  <= axi_str_wr_tlast_in & axi_str_wr_tvalid_in;

  assign axi_str_wr_tvalid_out = wr_tlast_reg ? 1'b0 : axi_str_wr_tvalid_in;
  assign axi_str_wr_tlast_out = axi_str_wr_tlast_in;
  assign axi_str_wr_tdata_out = axi_str_wr_tdata_in[63:0];
  assign axi_str_wr_tkeep_out = axi_str_wr_tkeep_in[7:0];
  assign axi_str_wr_tready_out = wr_tlast_reg ? 1'b0 : axi_str_wr_tready_in;

  assign axi_str_rd_tdata_out   = {64'd0, axi_str_rd_tdata_in};
  assign axi_str_rd_tkeep_out   = {8'd0, axi_str_rd_tkeep_in};
  assign axi_str_rd_tvalid_out  = axi_str_rd_tvalid_in;
  assign axi_str_rd_tlast_out   = axi_str_rd_tlast_in;
  assign axi_str_rd_tready_out = axi_str_rd_tready_in;

  assign resetdone = tx_resetdone && rx_resetdone;
  assign  nw_rst_out = core_reset;

  //synthesis attribute async_reg of core_reset_tmp is "true";
   
  always @(posedge sys_rst or posedge clk156)
  begin
    if(sys_rst)
    begin
      core_reset_tmp <= 1'b1;
      core_reset <= 1'b1;
    end
    else
    begin
      // Hold core in reset until everything else is ready...
      core_reset_tmp <= (!(resetdone) || sys_rst || tx_fault || !signal_detect);
      core_reset <= core_reset_tmp;
    end
  end     

endmodule
