// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

//   ==================================================================
//   >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
//   ------------------------------------------------------------------
//   Copyright (c) 2006-2011 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED 
//   ------------------------------------------------------------------
//
//   IMPORTANT: THIS FILE IS AUTO-GENERATED BY THE LATTICEMICO SYSTEM.
//
//   Permission:
//
//      Lattice Semiconductor grants permission to use this code
//      pursuant to the terms of the Lattice Semiconductor Corporation
//      Open Source License Agreement.  
//
//   Disclaimer:
//
//      Lattice Semiconductor provides no warranty regarding the use or
//      functionality of this code. It is the user's responsibility to
//      verify the user�s design for consistency and functionality through
//      the use of formal verification methods.
//
//   --------------------------------------------------------------------
//
//                  Lattice Semiconductor Corporation
//                  5555 NE Moore Court
//                  Hillsboro, OR 97214
//                  U.S.A
//
//                  TEL: 1-800-Lattice (USA and Canada)
//                         503-286-8001 (other locations)
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
//   --------------------------------------------------------------------
//                         FILE DETAILS
//                         FILE DETAILS
// Project          : GPIO for LM32
// File             : tpio.v
// Title            : Tri State IO control 
// Dependencies     : system_conf.v
// Description      : Implements the logic to interface tri-state IO with 
//                    Wishbone bus.
// =============================================================================
//                        REVISION HISTORY
// Version          : 7.0
// Mod. Date        : Jun 27, 2005
// Changes Made     : Initial Creation
//
// Version          : 7.0SP2, 3.0
// Mod. Date        : 20 Nov. 2007
// Changes Made     : Code clean up and add the BB for the inout port.
//
// Version          : 3.1
// Mod. Date        : 11 Oct. 2008
// Changes Made     : Update the Edge Capture Register clean method
//                    Make IRQ Mask register readable
// =============================================================================
`ifndef TPIO_V
`define TPIO_V
`include "system_conf.v"
module TRI_PIO #(parameter DATA_WIDTH = 16,
                 parameter IRQ_MODE = 1,
		 parameter LEVEL = 0,
                 parameter EDGE = 1,
                 parameter POSE_EDGE_IRQ = 1,
		 parameter NEGE_EDGE_IRQ = 0,
		 parameter EITHER_EDGE_IRQ = 0)
      (RST_I,
       CLK_I,
       DAT_I,
       DAT_O,
       PIO_IO,
       IRQ_O,
       PIO_TRI_WR_EN,
       PIO_TRI_RE_EN,
       PIO_DATA_RE_EN,
       PIO_DATA_WR_EN,
       IRQ_MASK_RE_EN,
       IRQ_MASK_WR_EN,
       EDGE_CAP_WR_EN);

   parameter UDLY = 1;//user delay

   input  RST_I;
   input  CLK_I;
   input  DAT_I;
   input  PIO_TRI_RE_EN;
   input  PIO_TRI_WR_EN;
   input  PIO_DATA_RE_EN;
   input  PIO_DATA_WR_EN;
   output DAT_O;
   input  IRQ_MASK_RE_EN;
   input  IRQ_MASK_WR_EN;
   input  EDGE_CAP_WR_EN;
   output IRQ_O;
   inout  PIO_IO;

   wire  PIO_IO_I;
   wire  DAT_O;
   wire  IRQ_O;
   reg   PIO_DATA_O;
   reg   PIO_DATA_I;
   reg   PIO_TRI;
   reg   IRQ_MASK;
   reg   IRQ_TEMP;
   reg   EDGE_CAPTURE;
   reg   PIO_DATA_DLY;

   always @(posedge CLK_I or posedge RST_I)
     if (RST_I)
       PIO_TRI <= #UDLY 0;
     else if (PIO_TRI_WR_EN)
       PIO_TRI <= #UDLY DAT_I;
   
   always @(posedge CLK_I or posedge RST_I)
     if (RST_I)
       PIO_DATA_O <= #UDLY 0;
     else if (PIO_DATA_WR_EN)
       PIO_DATA_O <= #UDLY DAT_I;

   always @(posedge CLK_I or posedge RST_I)
     if (RST_I)
       PIO_DATA_I <= #UDLY 0;
     else if (PIO_DATA_RE_EN)
       PIO_DATA_I <= #UDLY PIO_IO_I;
   
   BB tpio_inst(.I(PIO_DATA_O), .T(~PIO_TRI), .O(PIO_IO_I), .B(PIO_IO));
   assign  DAT_O =  PIO_TRI_RE_EN ? PIO_TRI  : 
                   IRQ_MASK_RE_EN ? IRQ_MASK : PIO_DATA_I;

   //IRQ_MODE

   generate
     if (IRQ_MODE == 1) begin
       //CONFIG THE IRQ_MASK REG.  
       always @(posedge CLK_I or posedge RST_I)
         if (RST_I)
           IRQ_MASK <= #UDLY 0;
         else if (IRQ_MASK_WR_EN)
           IRQ_MASK <= #UDLY DAT_I;
       end
   endgenerate   

   generate
      if (IRQ_MODE == 1 && LEVEL == 1) begin
          always @(posedge CLK_I or posedge RST_I)
            if (RST_I)
              IRQ_TEMP <= #UDLY 0;
            else
              IRQ_TEMP <= #UDLY PIO_IO_I & IRQ_MASK & ~PIO_TRI;//bit-and
          assign    IRQ_O = IRQ_TEMP;
          end
      else if (IRQ_MODE == 1 &&  EDGE == 1) begin   
          always @(posedge CLK_I or posedge RST_I)
            if (RST_I)
              PIO_DATA_DLY <= #UDLY 0;
            else
              PIO_DATA_DLY <= PIO_IO_I;

             always @(posedge CLK_I or posedge RST_I)
               if (RST_I)
                 EDGE_CAPTURE <= #UDLY 0;
               else  if ((PIO_IO_I & ~PIO_DATA_DLY & ~PIO_TRI) && POSE_EDGE_IRQ == 1)
                 EDGE_CAPTURE <= #UDLY PIO_IO_I & ~PIO_DATA_DLY;
               else  if ((~PIO_IO_I & PIO_DATA_DLY & ~PIO_TRI) && NEGE_EDGE_IRQ == 1)
                 EDGE_CAPTURE <= #UDLY ~PIO_IO_I & PIO_DATA_DLY;
               else if ((PIO_IO_I & ~PIO_DATA_DLY & ~PIO_TRI)  && EITHER_EDGE_IRQ == 1)
                 EDGE_CAPTURE <= #UDLY PIO_IO_I & ~PIO_DATA_DLY;
               else if ((~PIO_IO_I & PIO_DATA_DLY & ~PIO_TRI)  && EITHER_EDGE_IRQ == 1)
                 EDGE_CAPTURE <= #UDLY ~PIO_IO_I & PIO_DATA_DLY;
               else if ( (~IRQ_MASK) & DAT_I & IRQ_MASK_WR_EN )
                 // interrupt mask's being set, so clear edge-capture
                 EDGE_CAPTURE <= #UDLY 0;
               else if ( EDGE_CAP_WR_EN )
                 // user's writing to the edge-register, so update edge-capture
                 // register
                 EDGE_CAPTURE <= #UDLY EDGE_CAPTURE & DAT_I;

         assign IRQ_O = |(EDGE_CAPTURE & IRQ_MASK);
       end  
     else // IRQ_MODE ==0
         assign IRQ_O = 0;      
   endgenerate
endmodule
`endif // TPIO_V

