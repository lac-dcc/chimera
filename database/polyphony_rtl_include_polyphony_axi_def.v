//=======================================================================
// Project Polyphony
//
// File:
//   polyphony_axi_def.v
//
// Abstract:
//   AXI width definition (64bit)
//
//  Created:
//    6 November 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//
// Copyright (c) 2020, Kenji Ishimaru
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//  -Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//  -Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  Revision History

`include "polyphony_params.v"
// AXI Slave
parameter P_AXI_S_AWID    = 4;       // Write address ID
parameter P_AXI_S_AWADDR  = 32;      // Write address
parameter P_AXI_S_AWLEN   = 4;       // Burst Length
parameter P_AXI_S_AWSIZE  = 3;       // Burst size
parameter P_AXI_S_AWBURST = 2;       // Burst type
parameter P_AXI_S_AWLOCK  = 2;       // Lock type
parameter P_AXI_S_AWCACHE = 4;       // Cache type
parameter P_AXI_S_AWPROT  = 3;       // Protection type
parameter P_AXI_S_WID     = 4;       // Write ID tag
parameter P_AXI_S_WDATA   = 32;      // Write data
parameter P_AXI_S_WSTRB   = 4;       // Write strobe
parameter P_AXI_S_BID     = 4;       // Response ID
parameter P_AXI_S_BRESP   = 2;       // Write response
parameter P_AXI_S_ARID    = 4;       // Read address ID
parameter P_AXI_S_ARADDR  = 32;      // Read address
parameter P_AXI_S_ARLEN   = 4;       // Burst length
parameter P_AXI_S_ARSIZE  = 3;       // Burst size
parameter P_AXI_S_ARBURST = 2;       // Burst type
parameter P_AXI_S_ARLOCK  = 2;       // Lock type
parameter P_AXI_S_ARCACHE = 4;       // Cache type
parameter P_AXI_S_ARPROT  = 3;       // Protection type
parameter P_AXI_S_RID     = 4;       // Read ID tag
parameter P_AXI_S_RDATA   = 32;      // Read data
parameter P_AXI_S_RRESP   = 2;       // Read response
// AXI Master
parameter P_AXI_M_AWID    = 4;       // Write address ID
parameter P_AXI_M_AWADDR  = 32;      // Write address
parameter P_AXI_M_AWLEN   = 5;       // Burst Length
parameter P_AXI_M_AWSIZE  = 3;       // Burst size
parameter P_AXI_M_AWBURST = 2;       // Burst type
parameter P_AXI_M_AWLOCK  = 2;       // Lock type
parameter P_AXI_M_AWCACHE = 4;       // Cache type
parameter P_AXI_M_AWUSER  = 5;
parameter P_AXI_M_AWPROT  = 3;       // Protection type
parameter P_AXI_M_WID     = 4;       // Write ID tag
parameter P_AXI_M_WDATA   = P_IB_DATA_WIDTH;      // Write data
parameter P_AXI_M_WSTRB   = P_IB_BE_WIDTH;       // Write strobe
parameter P_AXI_M_BID     = 4;       // Response ID
parameter P_AXI_M_BRESP   = 2;       // Write response
parameter P_AXI_M_ARID    = 4;       // Read address ID
parameter P_AXI_M_ARADDR  = 32;      // Read address
parameter P_AXI_M_ARLEN   = 5;       // Burst length
parameter P_AXI_M_ARSIZE  = 3;       // Burst size
parameter P_AXI_M_ARBURST = 2;       // Burst type
parameter P_AXI_M_ARLOCK  = 2;       // Lock type
parameter P_AXI_M_ARCACHE = 4;       // Cache type
parameter P_AXI_M_ARUSER  = 5;
parameter P_AXI_M_ARPROT  = 3;       // Protection type
parameter P_AXI_M_RID     = 4;       // Read ID tag
parameter P_AXI_M_RDATA   = P_IB_DATA_WIDTH;      // Read data
parameter P_AXI_M_RRESP   = 2;       // Read response


