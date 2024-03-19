// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
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
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:kws:1.0
// IP Revision: 2008241312

(* X_CORE_INFO = "kws,Vivado 2019.2" *)
(* CHECK_LICENSE_TYPE = "kws_0,kws,{}" *)
(* CORE_GENERATION_INFO = "kws_0,kws,{x_ipProduct=Vivado 2019.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=kws,x_ipVersion=1.0,x_ipCoreRevision=2008241312,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module kws_0 (
  ap_clk,
  ap_rst_n,
  data_in_TVALID,
  data_in_TREADY,
  data_in_TDATA,
  data_in_TLAST,
  weight_in_TVALID,
  weight_in_TREADY,
  weight_in_TDATA,
  weight_in_TLAST,
  control_in_TVALID,
  control_in_TREADY,
  control_in_TDATA,
  control_in_TLAST,
  data_out_TVALID,
  data_out_TREADY,
  data_out_TDATA,
  data_out_TLAST
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF data_in:weight_in:control_in:data_out, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 data_in TVALID" *)
input wire data_in_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 data_in TREADY" *)
output wire data_in_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 data_in TDATA" *)
input wire [31 : 0] data_in_TDATA;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 data_in TLAST" *)
input wire [0 : 0] data_in_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 weight_in TVALID" *)
input wire weight_in_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 weight_in TREADY" *)
output wire weight_in_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 weight_in TDATA" *)
input wire [31 : 0] weight_in_TDATA;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME weight_in, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 weight_in TLAST" *)
input wire [0 : 0] weight_in_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 control_in TVALID" *)
input wire control_in_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 control_in TREADY" *)
output wire control_in_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 control_in TDATA" *)
input wire [15 : 0] control_in_TDATA;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME control_in, TDATA_NUM_BYTES 2, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 control_in TLAST" *)
input wire [0 : 0] control_in_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 data_out TVALID" *)
output wire data_out_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 data_out TREADY" *)
input wire data_out_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 data_out TDATA" *)
output wire [31 : 0] data_out_TDATA;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_out, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 data_out TLAST" *)
output wire [0 : 0] data_out_TLAST;

  kws inst (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .data_in_TVALID(data_in_TVALID),
    .data_in_TREADY(data_in_TREADY),
    .data_in_TDATA(data_in_TDATA),
    .data_in_TLAST(data_in_TLAST),
    .weight_in_TVALID(weight_in_TVALID),
    .weight_in_TREADY(weight_in_TREADY),
    .weight_in_TDATA(weight_in_TDATA),
    .weight_in_TLAST(weight_in_TLAST),
    .control_in_TVALID(control_in_TVALID),
    .control_in_TREADY(control_in_TREADY),
    .control_in_TDATA(control_in_TDATA),
    .control_in_TLAST(control_in_TLAST),
    .data_out_TVALID(data_out_TVALID),
    .data_out_TREADY(data_out_TREADY),
    .data_out_TDATA(data_out_TDATA),
    .data_out_TLAST(data_out_TLAST)
  );
endmodule
