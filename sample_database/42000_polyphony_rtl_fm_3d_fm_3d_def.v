// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_def.v
//
// Abstract:
//   3D top module constant defines
//
//  Created:
//    27 August 2008
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

`ifdef  __PP_3D_DEF__
`else
`define __PP_3D_DEF__
// Registers (byte address)
`define RENDER_START           'h00
`define RENDER_CACHE_CONTROL   'h04
`define RENDER_VTX_TOP_ADRS    'h08
`define RENDER_TOTAL_SIZE      'h0c
`define RENDER_NUM_OF_TRIS     'h10
`define RENDER_NUM_OF_ELEMENTS 'h14
`define RENDER_DMA_CTRL        'h18

`define RENDER_TEX0_OFFSET     'h20
`define RENDER_TEX0_WIDTH_M1   'h24
`define RENDER_TEX0_HEIGHT_M1  'h28
`define RENDER_TEX0_WIDTH_UI   'h2c
`define RENDER_TEX0_BCOLOR     'h30
`define RENDER_TEX0_CONFIG     'h34
`define RENDER_TEX1_OFFSET     'h40
`define RENDER_TEX1_WIDTH_M1   'h44
`define RENDER_TEX1_HEIGHT_M1  'h48
`define RENDER_TEX1_WIDTH_UI   'h4c
`define RENDER_TEX1_BCOLOR     'h50
`define RENDER_TEX1_CONFIG     'h54
`define RENDER_TEX_CTRL        'h58

`define RENDER_TBLEND0_ARG     'h60
`define RENDER_TBLEND0_FILTER  'h64
`define RENDER_TBLEND0_OP      'h68
`define RENDER_TBLEND1_ARG     'h6c
`define RENDER_TBLEND1_FILTER  'h70
`define RENDER_TBLEND1_OP      'h74
`define RENDER_TBLEND_CTRL     'h78

`define RENDER_SCREEN_MODE     'h80
`define RENDER_COLOR_OFFSET    'h84
`define RENDER_COLOR_MS_OFFSET 'h88
`define RENDER_DEPTH_OFFSET    'h8c
`define RENDER_DEPTH_MS_OFFSET 'h90
`define RENDER_BLEND_OP        'h94
`define RENDER_BLEND_CONST     'h98
`define RENDER_LOGIC_OP        'h9c
`define RENDER_ALPHA_TEST      'ha0
`define RENDER_STENCIL_TEST    'ha4
`define RENDER_STENCIL_REF     'ha8
`define RENDER_DEPTH_TEST      'hac
`define RENDER_COLOR_MASK      'hb0

// Vertex registers
`define ATTR_CONFIG     'hb4
// Vertex0
`define VTX0_X          'h40
`define VTX0_Y          'h44
`define VTX0_Z          'h48
`define VTX0_IW         'h4c
`define VTX0_P00        'h50
`define VTX0_P01        'h54
`define VTX0_P02        'h58
`define VTX0_P03        'h5c
`define VTX0_P10        'h60
`define VTX0_P11        'h64
`define VTX0_P12        'h68
`define VTX0_P13        'h6c
// Vertex1
`define VTX1_X          'h80
`define VTX1_Y          'h84
`define VTX1_Z          'h88
`define VTX1_IW         'h8c
`define VTX1_P00        'h90
`define VTX1_P01        'h94
`define VTX1_P02        'h98
`define VTX1_P03        'h9c
`define VTX1_P10        'ha0
`define VTX1_P11        'ha4
`define VTX1_P12        'ha8
`define VTX1_P13        'hac
// Vertex2
`define VTX2_X          'hc0
`define VTX2_Y          'hc4
`define VTX2_Z          'hc8
`define VTX2_IW         'hcc
`define VTX2_P00        'hd0
`define VTX2_P01        'hd4
`define VTX2_P02        'hd8
`define VTX2_P03        'hdc
`define VTX2_P10        'he0
`define VTX2_P11        'he4
`define VTX2_P12        'he8
`define VTX2_P13        'hec

// Latency
`define ADD_LATENCY      1
`define RECIP_LATENCY    1
`define INTERP_LATENCY   3

// Vertex Parameter Kind
`define PARAM_X          4'h0
`define PARAM_Y          4'h1
`define PARAM_Z          4'h2
`define PARAM_IW         4'h3
`define PARAM_CR         4'h4
`define PARAM_CG         4'h5
`define PARAM_CB         4'h6
`define PARAM_CA         4'h7
`define PARAM_TU         4'h8
`define PARAM_TV         4'h9

// Fragment Parameter Kind
`define FPARAM_X          4'h0
`define FPARAM_Y          4'h1
`define FPARAM_Z          4'h2
`define FPARAM_IW         4'h3
`define FPARAM_P00        4'h4
`define FPARAM_P01        4'h5
`define FPARAM_P02        4'h6
`define FPARAM_P03        4'h7
`define FPARAM_P10        4'h8
`define FPARAM_P11        4'h9
`define FPARAM_P12        4'ha
`define FPARAM_P13        4'hb
`define FPARAM_DMY        4'hf

`define ATTR_COLOR0       2'h0
`define ATTR_COLOR1       2'h1
`define ATTR_TEXTURE0     2'h2
`define ATTR_TEXTURE1     2'h3

// fm_3d_cu configuration

// if CPU sets float32, define the line below
`define USE_FLOAT32_IN    1

// only use PCI vertex injection
//`define USE_PCI_DMA_ONLY     1

// select RAM implementation in outline
//`define USE_OUTLINE_RRAM     1

// param1 size for gate reducing
//`define VTX_PARAM1_REDUCE   1

`endif

