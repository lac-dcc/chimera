//=======================================================================
// Project Polyphony
//
// File:
//   polyphony_params.v
//
// Abstract:
//   parameter configuration (32bit)
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

`include "polyphony_def.v"
// Internal bus
localparam P_IB_LEN_WIDTH  = 6;
`ifdef PP_BUSWIDTH_64
localparam P_IB_ADDR_WIDTH = 29;
localparam P_IB_DATA_WIDTH = 64;
localparam P_IB_BE_WIDTH   = 8;
localparam P_IB_TAG_ADDR_WIDTH = 20;
localparam P_IB_DATA_WIDTH_POW2 = 3;
`else
localparam P_IB_ADDR_WIDTH = 30;
localparam P_IB_DATA_WIDTH = 32;
localparam P_IB_BE_WIDTH   = 4;
localparam P_IB_TAG_ADDR_WIDTH = 21;
localparam P_IB_DATA_WIDTH_POW2 = 2;
`endif
localparam P_IB_CACHE_LINE_WIDTH  = 4;
localparam P_IB_CACHE_ENTRY_WIDTH = 5;
