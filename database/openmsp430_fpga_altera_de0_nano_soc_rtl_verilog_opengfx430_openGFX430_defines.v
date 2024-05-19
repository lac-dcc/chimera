// This program was cloned from: https://github.com/olgirard/openmsp430
// License: BSD 3-Clause "New" or "Revised" License

//----------------------------------------------------------------------------
// Copyright (C) 2009 , Olivier Girard
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the authors nor the names of its contributors
//       may be used to endorse or promote products derived from this software
//       without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
// OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
// THE POSSIBILITY OF SUCH DAMAGE
//
//----------------------------------------------------------------------------
//
// *File Name: openGFX430_defines.v
//
// *Module Description:
//                      oMSP Graphic Controller Configuration file
//
// *Author(s):
//              - Olivier Girard,    olgirard@gmail.com
//
//----------------------------------------------------------------------------
// $Rev: 103 $
// $LastChangedBy: olivier.girard $
// $LastChangedDate: 2011-03-05 15:44:48 +0100 (Sat, 05 Mar 2011) $
//----------------------------------------------------------------------------
//`define OGFX_NO_INCLUDE
`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_undefines.v"
`endif

//============================================================================
// GRAPHIC CONTROLLER USER CONFIGURATION
//============================================================================

//-----------------------------------------------------
// Video display maximum pixel height/width
//-----------------------------------------------------
//`define MAX_DISPLAY_PIXEL_LENGTH_4096
//`define MAX_DISPLAY_PIXEL_LENGTH_2048
//`define MAX_DISPLAY_PIXEL_LENGTH_1024
`define MAX_DISPLAY_PIXEL_LENGTH_512
//`define MAX_DISPLAY_PIXEL_LENGTH_256
//`define MAX_DISPLAY_PIXEL_LENGTH_128
//`define MAX_DISPLAY_PIXEL_LENGTH_64
//`define MAX_DISPLAY_PIXEL_LENGTH_32

//-----------------------------------------------------
// Video memory address width
//-----------------------------------------------------
`define VRAM_AWIDTH  17

//-----------------------------------------------------
// Define if the Video memory is bigger than 4k Words
// (should be defined if VRAM_AWIDTH is bigger than 12)
//-----------------------------------------------------
`define VRAM_BIGGER_4_KW

//-----------------------------------------------------
// Include/Exclude Frame buffer pointers from the
// register map
// (Frame pointer 0 is always included)
//-----------------------------------------------------
`define WITH_FRAME1_POINTER
//`define WITH_FRAME2_POINTER
//`define WITH_FRAME3_POINTER

//-----------------------------------------------------
// LUT Configuration
//-----------------------------------------------------
`define WITH_PROGRAMMABLE_LUT
`define WITH_EXTRA_LUT_BANK



//==========================================================================//
//==========================================================================//
//==========================================================================//
//==========================================================================//
//=====        SYSTEM CONSTANTS --- !!!!!!!! DO NOT EDIT !!!!!!!!      =====//
//==========================================================================//
//==========================================================================//
//==========================================================================//
//==========================================================================//

`ifdef MAX_DISPLAY_PIXEL_LENGTH_4096
  `define LPIX_MSB    11
  `define LPIX_SIZE 4096
  `define WITH_DISPLAY_SIZE_HI
`endif
`ifdef MAX_DISPLAY_PIXEL_LENGTH_2048
  `define LPIX_MSB    10
  `define LPIX_SIZE 2048
  `define WITH_DISPLAY_SIZE_HI
`endif
`ifdef MAX_DISPLAY_PIXEL_LENGTH_1024
  `define LPIX_MSB     9
  `define LPIX_SIZE 1024
  `define WITH_DISPLAY_SIZE_HI
`endif
`ifdef MAX_DISPLAY_PIXEL_LENGTH_512
  `define LPIX_MSB     8
  `define LPIX_SIZE  512
  `define WITH_DISPLAY_SIZE_HI
`endif
`ifdef MAX_DISPLAY_PIXEL_LENGTH_256
  `define LPIX_MSB     7
  `define LPIX_SIZE  256
`endif
`ifdef MAX_DISPLAY_PIXEL_LENGTH_128
  `define LPIX_MSB     6
  `define LPIX_SIZE  128
`endif
`ifdef MAX_DISPLAY_PIXEL_LENGTH_64
  `define LPIX_MSB     5
  `define LPIX_SIZE   64
`endif
`ifdef MAX_DISPLAY_PIXEL_LENGTH_32
  `define LPIX_MSB     4
  `define LPIX_SIZE   32
`endif
`define   SPIX_MSB     (((`LPIX_MSB+1)*2)-1)
`ifdef WITH_DISPLAY_SIZE_HI
  `define SPIX_HI_MSB  (`SPIX_MSB-16)
  `define SPIX_LO_MSB  15
`else
  `define SPIX_LO_MSB  `SPIX_MSB
`endif

`define  VRAM_MSB    (`VRAM_AWIDTH-1)

`define  APIX_WIDTH  (`VRAM_AWIDTH+4)
`define  APIX_MSB    (`APIX_WIDTH-1)
`ifdef VRAM_BIGGER_4_KW
 `define APIX_HI_MSB (`APIX_MSB-16)
 `define APIX_LO_MSB 15
`else
 `define APIX_LO_MSB `APIX_MSB
`endif

`ifdef WITH_EXTRA_LUT_BANK
 `define LRAM_AWIDTH 9
`else
 `define LRAM_AWIDTH 8
`endif
`define LRAM_MSB  (`LRAM_AWIDTH-1)


// Opcodes for GPU commands
`define OP_EXEC_FILL         2'b00
`define OP_EXEC_COPY         2'b01
`define OP_EXEC_COPY_TRANS   2'b10
`define OP_REC_WIDTH         4'b1100
`define OP_REC_HEIGHT        4'b1101
`define OP_SRC_PX_ADDR      {4'b1111, 2'b10, 10'b0000000000}
`define OP_DST_PX_ADDR      {4'b1111, 2'b10, 10'b0000000001}
`define OP_OF0_ADDR         {4'b1111, 2'b10, 10'b0000010000}
`define OP_OF1_ADDR         {4'b1111, 2'b10, 10'b0000010001}
`define OP_OF2_ADDR         {4'b1111, 2'b10, 10'b0000010010}
`define OP_OF3_ADDR         {4'b1111, 2'b10, 10'b0000010011}
`define OP_SET_FILL         {4'b1111, 2'b01, 10'b0000100000}
`define OP_SET_TRANSPARENT  {4'b1111, 2'b01, 10'b0000100001}

// Bit possitions of the GPU Command
`define SRC_OFFSET          13:12
`define SRC_X_SWAP          11
`define SRC_Y_SWAP          10
`define SRC_CL_SWAP          9
`define PX_OP                8:5
`define DST_OFFSET           4:3
`define DST_X_SWAP           2
`define DST_Y_SWAP           1
`define DST_CL_SWAP          0


//----------------------------------
// Configuration checkers
//----------------------------------
`ifdef WITH_FRAME2_POINTER
 `ifdef WITH_FRAME1_POINTER
 `else
GFX CONTROLLER CONFIGURATION ERROR: ENABLED FRAME2 POINTER WITHOUT FRAME1 POINTER
 `endif
`endif
`ifdef WITH_FRAME3_POINTER
 `ifdef WITH_FRAME2_POINTER
 `else
GFX CONTROLLER CONFIGURATION ERROR: ENABLED FRAME2 POINTER WITHOUT FRAME1 POINTER
 `endif
`endif
`ifdef WITH_PROGRAMMABLE_LUT
`else
`ifdef WITH_EXTRA_LUT_BANK
GFX CONTROLLER CONFIGURATION ERROR: NOT ALLOWED TO ENABLE EXTRA LUT BANK IF PROGRAMMABLE LUT SUPPORT IS DISABLED
`endif
`endif
