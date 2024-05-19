// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

/*
 * Copyright 2019 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// Copyright 2016 Eidetic Communications Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
`timescale 1ns / 1ns

`include "nvme_defines.sv"

module nvme_host_wrap
(
  input wire axi_aclk,
  input wire axi_aresetn,

  // Action/MMIO to NMVE Host Slave AXI Lite IF
  input wire [`HOST_ADDR_BITS - 1:0]  host_s_axi_awaddr,
  input wire                          host_s_axi_awvalid,
  output wire                          host_s_axi_awready,

  input wire [31:0]                   host_s_axi_wdata,
  input wire [3:0]                    host_s_axi_wstrb,
  input wire                          host_s_axi_wvalid,
  output wire                          host_s_axi_wready,

  output wire   [1:0]                  host_s_axi_bresp,
  output wire                          host_s_axi_bvalid,
  input wire                          host_s_axi_bready,

  input wire [`HOST_ADDR_BITS - 1:0]  host_s_axi_araddr,
  input wire                          host_s_axi_arvalid,
  output wire                          host_s_axi_arready,

  output wire   [31:0]                 host_s_axi_rdata,
  output wire   [1:0]                  host_s_axi_rresp,
  output wire                          host_s_axi_rvalid,
  input wire                          host_s_axi_rready,

  // NVMe Host to PCIE Master AXI Lite IF
  output wire   [`PCIE_M_ADDR_BITS-1:0]  pcie_m_axi_awaddr,
  output wire   [2:0]                    pcie_m_axi_awprot,
  output wire                            pcie_m_axi_awvalid,
  input wire                            pcie_m_axi_awready,

  output wire   [31:0]                   pcie_m_axi_wdata,
  output wire   [3:0]                    pcie_m_axi_wstrb,
  output wire                            pcie_m_axi_wvalid,
  input wire                            pcie_m_axi_wready,

  input wire [1:0]                      pcie_m_axi_bresp,
  input wire                            pcie_m_axi_bvalid,
  output wire                            pcie_m_axi_bready,

  output wire   [`PCIE_M_ADDR_BITS-1:0]  pcie_m_axi_araddr,
  output wire   [2:0]                    pcie_m_axi_arprot,
  output wire                            pcie_m_axi_arvalid,
  input wire                            pcie_m_axi_arready,
  input wire [31:0]                     pcie_m_axi_rdata,

  input wire [1:0]                      pcie_m_axi_rresp,
  input wire                            pcie_m_axi_rvalid,
  output wire                            pcie_m_axi_rready,

  // NVMe Host to PCIE Slave AXI MM IF
  input  wire [`PCIE_S_ID_BITS-1:0]     pcie_s_axi_awid,
  input  wire [`PCIE_S_ADDR_BITS-1:0]   pcie_s_axi_awaddr,
  input  wire [7:0]                     pcie_s_axi_awlen,
  input  wire [2:0]                     pcie_s_axi_awsize,
  input  wire [1:0]                     pcie_s_axi_awburst,
  input  wire                           pcie_s_axi_awvalid,
  output wire                            pcie_s_axi_awready,

  input  wire [127:0]                   pcie_s_axi_wdata,
  input  wire [15:0]                    pcie_s_axi_wstrb,
  input  wire                           pcie_s_axi_wlast,
  input  wire                           pcie_s_axi_wvalid,
  output wire                            pcie_s_axi_wready,

  output wire   [`PCIE_S_ID_BITS-1:0]    pcie_s_axi_bid,
  output wire   [1:0]                    pcie_s_axi_bresp,
  output wire                            pcie_s_axi_bvalid,
  input  wire                           pcie_s_axi_bready,

  input  wire [`PCIE_S_ID_BITS-1:0]     pcie_s_axi_arid,
  input  wire [`PCIE_S_ADDR_BITS-1:0]   pcie_s_axi_araddr,
  input  wire [7:0]                     pcie_s_axi_arlen,
  input  wire [2:0]                     pcie_s_axi_arsize,
  input  wire [1:0]                     pcie_s_axi_arburst,
  input  wire                           pcie_s_axi_arvalid,
  output wire                            pcie_s_axi_arready,

  output wire   [`PCIE_S_ID_BITS-1:0]    pcie_s_axi_rid,
  output wire   [127:0]                  pcie_s_axi_rdata,
  output wire   [1:0]                    pcie_s_axi_rresp,
  output wire                            pcie_s_axi_rlast,
  output wire                            pcie_s_axi_rvalid,
  input  wire                           pcie_s_axi_rready

);

nvme_host nvme_host_i (
  .axi_aclk           (axi_aclk),
  .axi_aresetn        (axi_aresetn),

  .host_s_axi_awaddr  (host_s_axi_awaddr  ),
  .host_s_axi_awvalid (host_s_axi_awvalid ),
  .host_s_axi_awready (host_s_axi_awready ),

  .host_s_axi_wdata   (host_s_axi_wdata   ),
  .host_s_axi_wstrb   (host_s_axi_wstrb   ),
  .host_s_axi_wvalid  (host_s_axi_wvalid  ),
  .host_s_axi_wready  (host_s_axi_wready  ),

  .host_s_axi_bresp   (host_s_axi_bresp   ),
  .host_s_axi_bvalid  (host_s_axi_bvalid  ),
  .host_s_axi_bready  (host_s_axi_bready  ),

  .host_s_axi_araddr  (host_s_axi_araddr  ),
  .host_s_axi_arvalid (host_s_axi_arvalid ),
  .host_s_axi_arready (host_s_axi_arready ),

  .host_s_axi_rdata   (host_s_axi_rdata   ),
  .host_s_axi_rresp   (host_s_axi_rresp   ),
  .host_s_axi_rvalid  (host_s_axi_rvalid  ),
  .host_s_axi_rready  (host_s_axi_rready  ),

  .pcie_m_axi_awaddr  (pcie_m_axi_awaddr  ),
  .pcie_m_axi_awprot  (pcie_m_axi_awprot  ),
  .pcie_m_axi_awvalid (pcie_m_axi_awvalid ),
  .pcie_m_axi_awready (pcie_m_axi_awready ),

  .pcie_m_axi_wdata   (pcie_m_axi_wdata   ),
  .pcie_m_axi_wstrb   (pcie_m_axi_wstrb   ),
  .pcie_m_axi_wvalid  (pcie_m_axi_wvalid  ),
  .pcie_m_axi_wready  (pcie_m_axi_wready  ),

  .pcie_m_axi_bresp   (pcie_m_axi_bresp   ),
  .pcie_m_axi_bvalid  (pcie_m_axi_bvalid  ),
  .pcie_m_axi_bready  (pcie_m_axi_bready  ),

  .pcie_m_axi_araddr  (pcie_m_axi_araddr  ),
  .pcie_m_axi_arprot  (pcie_m_axi_arprot  ),
  .pcie_m_axi_arvalid (pcie_m_axi_arvalid ),
  .pcie_m_axi_arready (pcie_m_axi_arready ),
  .pcie_m_axi_rdata   (pcie_m_axi_rdata   ),

  .pcie_m_axi_rresp   (pcie_m_axi_rresp   ),
  .pcie_m_axi_rvalid  (pcie_m_axi_rvalid  ),
  .pcie_m_axi_rready  (pcie_m_axi_rready  ),

  .pcie_s_axi_awid    (pcie_s_axi_awid    ),
  .pcie_s_axi_awaddr  (pcie_s_axi_awaddr  ),
  .pcie_s_axi_awlen   (pcie_s_axi_awlen   ),
  .pcie_s_axi_awsize  (pcie_s_axi_awsize  ),
  .pcie_s_axi_awburst (pcie_s_axi_awburst ),
  .pcie_s_axi_awvalid (pcie_s_axi_awvalid ),
  .pcie_s_axi_awready (pcie_s_axi_awready ),

  .pcie_s_axi_wdata   (pcie_s_axi_wdata   ),
  .pcie_s_axi_wstrb   (pcie_s_axi_wstrb   ),
  .pcie_s_axi_wlast   (pcie_s_axi_wlast   ),
  .pcie_s_axi_wvalid  (pcie_s_axi_wvalid  ),
  .pcie_s_axi_wready  (pcie_s_axi_wready  ),

  .pcie_s_axi_bid     (pcie_s_axi_bid     ),
  .pcie_s_axi_bresp   (pcie_s_axi_bresp   ),
  .pcie_s_axi_bvalid  (pcie_s_axi_bvalid  ),
  .pcie_s_axi_bready  (pcie_s_axi_bready  ),

  .pcie_s_axi_arid    (pcie_s_axi_arid    ),
  .pcie_s_axi_araddr  (pcie_s_axi_araddr  ),
  .pcie_s_axi_arlen   (pcie_s_axi_arlen   ),
  .pcie_s_axi_arsize  (pcie_s_axi_arsize  ),
  .pcie_s_axi_arburst (pcie_s_axi_arburst ),
  .pcie_s_axi_arvalid (pcie_s_axi_arvalid ),
  .pcie_s_axi_arready (pcie_s_axi_arready ),

  .pcie_s_axi_rid     (pcie_s_axi_rid     ),
  .pcie_s_axi_rdata   (pcie_s_axi_rdata   ),
  .pcie_s_axi_rresp   (pcie_s_axi_rresp   ),
  .pcie_s_axi_rlast   (pcie_s_axi_rlast   ),
  .pcie_s_axi_rvalid  (pcie_s_axi_rvalid  ),
  .pcie_s_axi_rready  (pcie_s_axi_rready  )
);

endmodule
