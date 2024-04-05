// =============================================================================
//                           COPYRIGHT NOTICE
// Copyright 2004 (c) Lattice Semiconductor Corporation
// ALL RIGHTS RESERVED
// This confidential and proprietary software may be used only as authorised by
// a licensing agreement from Lattice Semiconductor Corporation.
// The entire notice above must be reproduced on all authorized copies and
// copies may only be made to the extent permitted by a licensing agreement from
// Lattice Semiconductor Corporation.
//
// Lattice Semiconductor Corporation        TEL : 1-800-Lattice (USA and Canada)
// 5555 NE Moore Court                            408-826-6000 (other locations)
// Hillsboro, OR 97124                     web  : http://www.latticesemi.com/
// U.S.A                                   email: techsupport@latticesemi.com
// =============================================================================/
//                         FILE DETAILS
// Project          : GPIO for LM32
// File             : gpio.v
// Title            : General Purpose IO Component 
// Dependencies     : system_conf.v
// Description      : Implements the logic to interface general purpuse IO with 
//                    Wishbone bus.
// =============================================================================
//                        REVISION HISTORY
// Version          : 7.0
// Mod. Date        : Jun 27, 2005
// Changes Made     : Initial Creation
//
// Version          : 7.0SP2, 3.0
// Mod. Date        : 20 Nov. 2007
// Changes Made     : Code clean up.
//
// Version          : 3.1
// Mod. Date        : 11 Oct. 2008
// Changes Made     : Update the Edge Capture Register clean method
//                    Make IRQ Mask register readable
//
// Version          : 3.2
// Mod. Data        : Jun 6, 2010
// Changes Made     : 1. Provide capability to read/write bytes (when GPIO larger
//                       than 8 bits wide)
//                    2. Provide capability to use a 32-bit or 8-bit data bus on
//                       the WISHBONE slave port
//                    3. Perform a big-endian to little-endian conversion in 
//                       hardware
// =============================================================================
`ifndef GPIO_V
`define GPIO_V
`timescale 1ns/100 ps
`include "system_conf.v"
module gpio 
  #(
    parameter GPIO_WB_DAT_WIDTH = 32,
    parameter GPIO_WB_ADR_WIDTH = 4,
    parameter DATA_WIDTH = 16,
    parameter INPUT_WIDTH = 16,
    parameter OUTPUT_WIDTH = 16,
    parameter IRQ_MODE = 0,
    parameter LEVEL = 0,
    parameter EDGE = 0,
    parameter POSE_EDGE_IRQ = 0,
    parameter NEGE_EDGE_IRQ = 0,
    parameter EITHER_EDGE_IRQ = 0,
    parameter INPUT_PORTS_ONLY = 1,
    parameter OUTPUT_PORTS_ONLY = 0,
    parameter BOTH_INPUT_AND_OUTPUT = 0,
    parameter TRISTATE_PORTS = 0
    )
   (
    // system clock and reset
    input CLK_I,
    input RST_I,
    
    // wishbone interface signals
    input GPIO_CYC_I,
    input GPIO_STB_I,
    input GPIO_WE_I,
    input GPIO_LOCK_I,
    input [2:0] GPIO_CTI_I,
    input [1:0] GPIO_BTE_I,
    input [GPIO_WB_ADR_WIDTH-1:0] GPIO_ADR_I,
    input [GPIO_WB_DAT_WIDTH-1:0] GPIO_DAT_I,
    input [GPIO_WB_DAT_WIDTH/8-1:0] GPIO_SEL_I,
    output reg GPIO_ACK_O,
    output GPIO_ERR_O,
    output GPIO_RTY_O,
    output [GPIO_WB_DAT_WIDTH-1:0] GPIO_DAT_O,
    
    output IRQ_O,
    
    // PIO side
    input [DATA_WIDTH-1:0] PIO_IN,
    input [INPUT_WIDTH-1:0] PIO_BOTH_IN,
    output [DATA_WIDTH-1:0] PIO_OUT,
    output [OUTPUT_WIDTH-1:0] PIO_BOTH_OUT,
    inout [DATA_WIDTH-1:0] PIO_IO
    );
   
   // The incoming data bus is big-endian and the internal memory-mapped registers of GPIO
   // component are little-endian. Performing a big-endian to little-endian conversion!
   wire [GPIO_WB_DAT_WIDTH-1:0] GPIO_DAT_I_switch, GPIO_DAT_O_switch;
   wire [GPIO_WB_DAT_WIDTH/8-1:0] GPIO_SEL_I_switch;
   generate
      if (GPIO_WB_DAT_WIDTH == 8) begin
	 assign GPIO_DAT_I_switch = GPIO_DAT_I;
	 assign GPIO_SEL_I_switch = GPIO_SEL_I;
	 assign GPIO_DAT_O = GPIO_DAT_O_switch;
      end
      else begin
	 assign GPIO_DAT_I_switch = {GPIO_DAT_I[7:0], GPIO_DAT_I[15:8], GPIO_DAT_I[23:16], GPIO_DAT_I[31:24]};
	 assign GPIO_SEL_I_switch = {GPIO_SEL_I[0], GPIO_SEL_I[1], GPIO_SEL_I[2], GPIO_SEL_I[3]};
	 assign GPIO_DAT_O = {GPIO_DAT_O_switch[7:0], GPIO_DAT_O_switch[15:8], GPIO_DAT_O_switch[23:16], GPIO_DAT_O_switch[31:24]};
      end
   endgenerate
      
   reg [OUTPUT_WIDTH-1:0] PIO_DATAO; 
   reg [INPUT_WIDTH-1:0]  PIO_DATAI;
   wire 		  ADR_0, ADR_4, ADR_8, ADR_C;
   wire [DATA_WIDTH-1:0]  tpio_out;
   
   wire 		  PIO_DATA_WR_EN;
   wire 		  PIO_DATA_WR_EN_0, PIO_DATA_WR_EN_1, PIO_DATA_WR_EN_2, PIO_DATA_WR_EN_3;
   
   wire 		  PIO_TRI_WR_EN;
   wire 		  PIO_TRI_WR_EN_0, PIO_TRI_WR_EN_1, PIO_TRI_WR_EN_2, PIO_TRI_WR_EN_3;
   
   wire 		  IRQ_MASK_WR_EN;
   wire 		  IRQ_MASK_WR_EN_0, IRQ_MASK_WR_EN_1, IRQ_MASK_WR_EN_2, IRQ_MASK_WR_EN_3;
   
   wire 		  EDGE_CAP_WR_EN;
   wire 		  EDGE_CAP_WR_EN_0, EDGE_CAP_WR_EN_1, EDGE_CAP_WR_EN_2, EDGE_CAP_WR_EN_3;
   
   wire 		  PIO_DATA_RE_EN;
   wire 		  PIO_TRI_RE_EN;
   wire 		  IRQ_MASK_RE_EN;
   wire [DATA_WIDTH-1:0]  IRQ_TRI_TEMP;
   reg [DATA_WIDTH-1:0]   PIO_DATA;
   reg [DATA_WIDTH-1:0]   IRQ_MASK;
   reg [INPUT_WIDTH-1:0]  IRQ_MASK_BOTH;
   reg [DATA_WIDTH-1:0]   IRQ_TEMP;
   reg [INPUT_WIDTH-1:0]  IRQ_TEMP_BOTH;
   reg [DATA_WIDTH-1:0]   EDGE_CAPTURE;
   reg [INPUT_WIDTH-1:0]  EDGE_CAPTURE_BOTH;
   reg [DATA_WIDTH-1:0]   PIO_DATA_DLY;
   reg [INPUT_WIDTH-1:0]  PIO_DATA_DLY_BOTH;
   
   parameter UDLY = 1;
   
   assign GPIO_RTY_O = 1'b0;
   assign GPIO_ERR_O = 1'b0;
   assign ADR_0 = (GPIO_ADR_I[3:2] == 4'b00 ? 1'b1 : 0); // IO Data           
   assign ADR_4 = (GPIO_ADR_I[3:2] == 4'b01 ? 1'b1 : 0); // Tri-state Control 
   assign ADR_8 = (GPIO_ADR_I[3:2] == 4'b10 ? 1'b1 : 0); // IRQ Mask          
   assign ADR_C = (GPIO_ADR_I[3:2] == 4'b11 ? 1'b1 : 0); // Edge Capture      
   
   always @(posedge CLK_I or posedge RST_I)
     if(RST_I)
       GPIO_ACK_O <= #UDLY 1'b0;
     else if(GPIO_STB_I && (GPIO_ACK_O == 1'b0))
       GPIO_ACK_O <= #UDLY 1'b1;
     else
       GPIO_ACK_O <= #UDLY 1'b0;   
   
   
   generate
      if (INPUT_PORTS_ONLY == 1) begin
         always @(posedge CLK_I or posedge RST_I)
           if (RST_I)
             PIO_DATA <= #UDLY 0;
           else if (GPIO_STB_I && !GPIO_ACK_O && !GPIO_WE_I && GPIO_ADR_I[3:2] == 2'b00)
             PIO_DATA <= #UDLY PIO_IN;
      end
   endgenerate
   
   generate
      if (OUTPUT_PORTS_ONLY == 1) begin
	 if (GPIO_WB_DAT_WIDTH == 8) begin
	    genvar ipd_idx;
	    for (ipd_idx = 0; (ipd_idx < DATA_WIDTH) && (ipd_idx < 8); ipd_idx = ipd_idx + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I)
		     PIO_DATA[ipd_idx] <= #UDLY 0;
		   else if (GPIO_STB_I && !GPIO_ACK_O && GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0000)
		     PIO_DATA[ipd_idx] <= #UDLY GPIO_DAT_I_switch[ipd_idx];
	      end
	    if (DATA_WIDTH > 8) begin
	       genvar jpd_idx;
	       for (jpd_idx = 8; (jpd_idx < DATA_WIDTH) && (jpd_idx < 16); jpd_idx = jpd_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			PIO_DATA[jpd_idx] <= #UDLY 0;
		      else if (GPIO_STB_I && !GPIO_ACK_O && GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0001)
			PIO_DATA[jpd_idx] <= #UDLY GPIO_DAT_I_switch[jpd_idx-8];
		 end
	    end
	    if (DATA_WIDTH > 16) begin
	       genvar kpd_idx;
	       for (kpd_idx = 16; (kpd_idx < DATA_WIDTH) && (kpd_idx < 24); kpd_idx = kpd_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			PIO_DATA[kpd_idx] <= #UDLY 0;
		      else if (GPIO_STB_I && !GPIO_ACK_O && GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0010)
			PIO_DATA[kpd_idx] <= #UDLY GPIO_DAT_I_switch[kpd_idx-16];
		 end
	    end
	    if (DATA_WIDTH > 24) begin
	       genvar lpd_idx;
	       for (lpd_idx = 24; (lpd_idx < DATA_WIDTH) && (lpd_idx < 32); lpd_idx = lpd_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			PIO_DATA[lpd_idx] <= #UDLY 0;
		      else if (GPIO_STB_I && !GPIO_ACK_O && GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0011)
			PIO_DATA[lpd_idx] <= #UDLY GPIO_DAT_I_switch[lpd_idx-24];
		 end
	    end
	 end // if (GPIO_WB_DAT_WIDTH == 8)
	 
	 else if (GPIO_WB_DAT_WIDTH == 32) begin
	    genvar ipd_idx;
	    for (ipd_idx = 0; (ipd_idx < DATA_WIDTH) && (ipd_idx < 8); ipd_idx = ipd_idx + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I)
		     PIO_DATA[ipd_idx] <= #UDLY 0;
		   else if (GPIO_STB_I && !GPIO_ACK_O && GPIO_WE_I && ADR_0 == 1'b1 && GPIO_SEL_I_switch[0])
		     PIO_DATA[ipd_idx] <= #UDLY GPIO_DAT_I_switch[ipd_idx];
	      end
	    if (DATA_WIDTH > 8) begin
	       genvar jpd_idx;
	       for (jpd_idx = 8; (jpd_idx < DATA_WIDTH) && (jpd_idx < 16); jpd_idx = jpd_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			PIO_DATA[jpd_idx] <= #UDLY 0;
		      else if (GPIO_STB_I && !GPIO_ACK_O && GPIO_WE_I && ADR_0 == 1'b1 && GPIO_SEL_I_switch[1])
			PIO_DATA[jpd_idx] <= #UDLY GPIO_DAT_I_switch[jpd_idx];
		 end
	    end
	    if (DATA_WIDTH > 16) begin
	       genvar kpd_idx;
	       for (kpd_idx = 16; (kpd_idx < DATA_WIDTH) && (kpd_idx < 24); kpd_idx = kpd_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			PIO_DATA[kpd_idx] <= #UDLY 0;
		      else if (GPIO_STB_I && !GPIO_ACK_O && GPIO_WE_I && ADR_0 == 1'b1 && GPIO_SEL_I_switch[2])
			PIO_DATA[kpd_idx] <= #UDLY GPIO_DAT_I_switch[kpd_idx];
		 end
	    end
	    if (DATA_WIDTH > 24) begin
	       genvar lpd_idx;
	       for (lpd_idx = 24; (lpd_idx < DATA_WIDTH) && (lpd_idx < 32); lpd_idx = lpd_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			PIO_DATA[lpd_idx] <= #UDLY 0;
		      else if (GPIO_STB_I && !GPIO_ACK_O && GPIO_WE_I && ADR_0 == 1'b1 && GPIO_SEL_I_switch[3])
			PIO_DATA[lpd_idx] <= #UDLY GPIO_DAT_I_switch[lpd_idx];
		 end
	    end
         end // if (GPIO_WB_DAT_WIDTH == 32)
	 	 
         assign  PIO_OUT = PIO_DATA;
      end
   endgenerate
   
   generate
      if (BOTH_INPUT_AND_OUTPUT == 1) begin
	 if (GPIO_WB_DAT_WIDTH == 8) begin
	    genvar iopd_idx;
	    for (iopd_idx = 0; (iopd_idx < OUTPUT_WIDTH) && (iopd_idx < 8); iopd_idx = iopd_idx + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I) 
		     begin
			PIO_DATAI[iopd_idx] <= #UDLY 0;
			PIO_DATAO[iopd_idx] <= #UDLY 0;
		     end 
		   else if (GPIO_STB_I && !GPIO_ACK_O && !GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0000)
		     PIO_DATAI[iopd_idx] <= #UDLY PIO_BOTH_IN[iopd_idx];
		   else if (GPIO_STB_I && GPIO_ACK_O && GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0000)
		     PIO_DATAO[iopd_idx] <= #UDLY GPIO_DAT_I_switch[iopd_idx];
	      end
	    if (OUTPUT_WIDTH > 8) begin
	       genvar jopd_idx;
	       for (jopd_idx = 8; (jopd_idx < OUTPUT_WIDTH) && (jopd_idx < 16); jopd_idx = jopd_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I) 
			begin
			   PIO_DATAI[jopd_idx] <= #UDLY 0;
			   PIO_DATAO[jopd_idx] <= #UDLY 0;
			end 
		      else if (GPIO_STB_I && !GPIO_ACK_O && !GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0001)
			PIO_DATAI[jopd_idx] <= #UDLY PIO_BOTH_IN[jopd_idx];
		      else if (GPIO_STB_I && GPIO_ACK_O && GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0001)
			PIO_DATAO[jopd_idx] <= #UDLY GPIO_DAT_I_switch[jopd_idx-8];
		 end
	    end
	    if (OUTPUT_WIDTH > 16) begin
	       genvar kopd_idx;
	       for (kopd_idx = 16; (kopd_idx < OUTPUT_WIDTH) && (kopd_idx < 24); kopd_idx = kopd_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I) 
			begin
			   PIO_DATAI[kopd_idx] <= #UDLY 0;
			   PIO_DATAO[kopd_idx] <= #UDLY 0;
			end 
		      else if (GPIO_STB_I && !GPIO_ACK_O && !GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0010)
			PIO_DATAI[kopd_idx] <= #UDLY PIO_BOTH_IN[kopd_idx];
		      else if (GPIO_STB_I && GPIO_ACK_O && GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0010)
			PIO_DATAO[kopd_idx] <= #UDLY GPIO_DAT_I_switch[kopd_idx-16];
		 end
	    end
	    if (OUTPUT_WIDTH > 24) begin
	       genvar lopd_idx;
	       for (lopd_idx = 24; (lopd_idx < OUTPUT_WIDTH) && (lopd_idx < 32); lopd_idx = lopd_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I) 
			begin
			   PIO_DATAI[lopd_idx] <= #UDLY 0;
			   PIO_DATAO[lopd_idx] <= #UDLY 0;
			end 
		      else if (GPIO_STB_I && !GPIO_ACK_O && !GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0011)
			PIO_DATAI[lopd_idx] <= #UDLY PIO_BOTH_IN[lopd_idx];
		      else if (GPIO_STB_I && GPIO_ACK_O && GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0011)
			PIO_DATAO[lopd_idx] <= #UDLY GPIO_DAT_I_switch[lopd_idx-24];
		 end
	    end
	 end // if (GPIO_WB_DAT_WIDTH == 8)
	 
	 else if (GPIO_WB_DAT_WIDTH == 32) begin
	    genvar iopd_idx;
	    for (iopd_idx = 0; (iopd_idx < OUTPUT_WIDTH) && (iopd_idx < 8); iopd_idx = iopd_idx + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I) 
		     begin
			PIO_DATAI[iopd_idx] <= #UDLY 0;
			PIO_DATAO[iopd_idx] <= #UDLY 0;
		     end 
		   else if (GPIO_STB_I && !GPIO_ACK_O && !GPIO_WE_I && ADR_0 == 1'b1 && GPIO_SEL_I_switch[0])
		     PIO_DATAI[iopd_idx] <= #UDLY PIO_BOTH_IN[iopd_idx];
		   else if (GPIO_STB_I && GPIO_ACK_O && GPIO_WE_I && ADR_0 == 1'b1 && GPIO_SEL_I_switch[0])
		     PIO_DATAO[iopd_idx] <= #UDLY GPIO_DAT_I_switch[iopd_idx];
	      end
	    if (OUTPUT_WIDTH > 8) begin
	       genvar jopd_idx;
	       for (jopd_idx = 8; (jopd_idx < OUTPUT_WIDTH) && (jopd_idx < 16); jopd_idx = jopd_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I) 
			begin
			   PIO_DATAI[jopd_idx] <= #UDLY 0;
			   PIO_DATAO[jopd_idx] <= #UDLY 0;
			end 
		      else if (GPIO_STB_I && !GPIO_ACK_O && !GPIO_WE_I && ADR_0 == 1'b1 && GPIO_SEL_I_switch[1])
		      	PIO_DATAI[jopd_idx] <= #UDLY PIO_BOTH_IN[jopd_idx];
		      else if (GPIO_STB_I && GPIO_ACK_O && GPIO_WE_I && ADR_0 == 1'b1 && GPIO_SEL_I_switch[1])
			PIO_DATAO[jopd_idx] <= #UDLY GPIO_DAT_I_switch[jopd_idx];
		 end
	    end
	    if (OUTPUT_WIDTH > 16) begin
	       genvar kopd_idx;
	       for (kopd_idx = 16; (kopd_idx < OUTPUT_WIDTH) && (kopd_idx < 24); kopd_idx = kopd_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I) 
			begin
			   PIO_DATAI[kopd_idx] <= #UDLY 0;
			   PIO_DATAO[kopd_idx] <= #UDLY 0;
			end 
		      else if (GPIO_STB_I && !GPIO_ACK_O && !GPIO_WE_I && ADR_0 == 1'b1 && GPIO_SEL_I_switch[2])
			PIO_DATAI[kopd_idx] <= #UDLY PIO_BOTH_IN[kopd_idx];
		      else if (GPIO_STB_I && GPIO_ACK_O && GPIO_WE_I && ADR_0 == 1'b1 && GPIO_SEL_I_switch[2])
			PIO_DATAO[kopd_idx] <= #UDLY GPIO_DAT_I_switch[kopd_idx];
		 end
	    end
	    if (OUTPUT_WIDTH > 24) begin
	       genvar lopd_idx;
	       for (lopd_idx = 24; (lopd_idx < OUTPUT_WIDTH) && (lopd_idx < 32); lopd_idx = lopd_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I) 
			begin
			   PIO_DATAI[lopd_idx] <= #UDLY 0;
			   PIO_DATAO[lopd_idx] <= #UDLY 0;
			end 
		      else if (GPIO_STB_I && !GPIO_ACK_O && !GPIO_WE_I && ADR_0 == 1'b1 && GPIO_SEL_I_switch[3])
			PIO_DATAI[lopd_idx] <= #UDLY PIO_BOTH_IN[lopd_idx];
		      else if (GPIO_STB_I && GPIO_ACK_O && GPIO_WE_I && ADR_0 == 1'b1 && GPIO_SEL_I_switch[3])
			PIO_DATAO[lopd_idx] <= #UDLY GPIO_DAT_I_switch[lopd_idx];
		 end
	    end
         end // if (GPIO_WB_DAT_WIDTH == 32)
	 
         assign  PIO_BOTH_OUT = PIO_DATAO[OUTPUT_WIDTH-1:0];
      end
   endgenerate
   
   assign  PIO_DATA_RE_EN = GPIO_STB_I && !GPIO_ACK_O && !GPIO_WE_I && (GPIO_ADR_I[3:2] == 2'b00);
   
   assign  PIO_TRI_RE_EN  = GPIO_STB_I &&  GPIO_ACK_O && !GPIO_WE_I && (GPIO_ADR_I[3:2] == 2'b01);
   
   assign  IRQ_MASK_RE_EN = GPIO_STB_I &&  GPIO_ACK_O && !GPIO_WE_I && (GPIO_ADR_I[3:2] == 2'b10);
   
   assign  PIO_DATA_WR_EN = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && (GPIO_ADR_I[3:2] == 2'b00);
   generate
      if (GPIO_WB_DAT_WIDTH == 8) begin
	 assign  PIO_DATA_WR_EN_0 = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0000;
	 assign  PIO_DATA_WR_EN_1 = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0001;
	 assign  PIO_DATA_WR_EN_2 = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0010;
	 assign  PIO_DATA_WR_EN_3 = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0011;
      end
   endgenerate
   
   assign  PIO_TRI_WR_EN  = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && (GPIO_ADR_I[3:2] == 4'b01);
   generate
      if (GPIO_WB_DAT_WIDTH == 8) begin
	 assign  PIO_TRI_WR_EN_0  = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0100;
	 assign  PIO_TRI_WR_EN_1  = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0101;
	 assign  PIO_TRI_WR_EN_2  = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0110;
	 assign  PIO_TRI_WR_EN_3  = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b0111;
      end
   endgenerate
   
   assign  IRQ_MASK_WR_EN   = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && (GPIO_ADR_I[3:2] == 2'b10);
   generate
      if (GPIO_WB_DAT_WIDTH == 8) begin
	 assign  IRQ_MASK_WR_EN_0 = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b1000;
	 assign  IRQ_MASK_WR_EN_1 = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b1001;
	 assign  IRQ_MASK_WR_EN_2 = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b1010;
	 assign  IRQ_MASK_WR_EN_3 = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b1011;
      end
   endgenerate
   
   assign  EDGE_CAP_WR_EN   = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && (GPIO_ADR_I[3:2] == 2'b11);
   generate
      if (GPIO_WB_DAT_WIDTH == 8) begin
	 assign  EDGE_CAP_WR_EN_0 = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b1100;
	 assign  EDGE_CAP_WR_EN_1 = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b1101;
	 assign  EDGE_CAP_WR_EN_2 = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b1110;
	 assign  EDGE_CAP_WR_EN_3 = GPIO_STB_I &&  GPIO_ACK_O &&  GPIO_WE_I && GPIO_ADR_I[3:0] == 4'b1111;
      end
   endgenerate
   
   generate
      
      if (GPIO_WB_DAT_WIDTH == 8) begin
	 
	 genvar iti;
	 for (iti = 0; (iti < DATA_WIDTH) && (iti < 8); iti = iti + 1)
           begin : itio_inst
              TRI_PIO 
		#(.DATA_WIDTH(1),
		  .IRQ_MODE(IRQ_MODE),
		  .LEVEL(LEVEL),
		  .EDGE(EDGE),
		  .POSE_EDGE_IRQ(POSE_EDGE_IRQ),
		  .NEGE_EDGE_IRQ(NEGE_EDGE_IRQ),
		  .EITHER_EDGE_IRQ(EITHER_EDGE_IRQ))
              TP 
		(.CLK_I(CLK_I),
		 .RST_I(RST_I),
		 .DAT_I(GPIO_DAT_I_switch[iti]),
		 .DAT_O(tpio_out[iti]),
		 .PIO_IO(PIO_IO[iti]),
		 .IRQ_O(IRQ_TRI_TEMP[iti]),
		 .PIO_TRI_WR_EN(PIO_TRI_WR_EN_0),
		 .PIO_TRI_RE_EN(PIO_TRI_RE_EN),
		 .PIO_DATA_WR_EN(PIO_DATA_WR_EN_0),
		 .PIO_DATA_RE_EN(PIO_DATA_RE_EN),
		 .IRQ_MASK_WR_EN(IRQ_MASK_WR_EN_0),
		 .IRQ_MASK_RE_EN(IRQ_MASK_RE_EN),
		 .EDGE_CAP_WR_EN(EDGE_CAP_WR_EN_0));
           end
	 if (DATA_WIDTH > 8) begin
	    genvar jti;
	    for (jti = 8; (jti < DATA_WIDTH) && (jti < 16); jti = jti + 1)
              begin : jtio_inst
		 TRI_PIO 
		   #(.DATA_WIDTH(1),
		     .IRQ_MODE(IRQ_MODE),
		     .LEVEL(LEVEL),
		     .EDGE(EDGE),
		     .POSE_EDGE_IRQ(POSE_EDGE_IRQ),
		     .NEGE_EDGE_IRQ(NEGE_EDGE_IRQ),
		     .EITHER_EDGE_IRQ(EITHER_EDGE_IRQ))
		 TP 
		   (.CLK_I(CLK_I),
		    .RST_I(RST_I),
		    .DAT_I(GPIO_DAT_I_switch[jti-8]),
		    .DAT_O(tpio_out[jti]),
		    .PIO_IO(PIO_IO[jti]),
		    .IRQ_O(IRQ_TRI_TEMP[jti]),
		    .PIO_TRI_WR_EN(PIO_TRI_WR_EN_1),
		    .PIO_TRI_RE_EN(PIO_TRI_RE_EN),
		    .PIO_DATA_WR_EN(PIO_DATA_WR_EN_1),
		    .PIO_DATA_RE_EN(PIO_DATA_RE_EN),
		    .IRQ_MASK_WR_EN(IRQ_MASK_WR_EN_1),
		    .IRQ_MASK_RE_EN(IRQ_MASK_RE_EN),
		    .EDGE_CAP_WR_EN(EDGE_CAP_WR_EN_1));
              end
	 end
	 if (DATA_WIDTH > 16) begin
	    genvar kti;
	    for (kti = 16; (kti < DATA_WIDTH) && (kti < 24); kti = kti + 1)
              begin : ktio_inst
		 TRI_PIO 
		   #(.DATA_WIDTH(1),
		     .IRQ_MODE(IRQ_MODE),
		     .LEVEL(LEVEL),
		     .EDGE(EDGE),
		     .POSE_EDGE_IRQ(POSE_EDGE_IRQ),
		     .NEGE_EDGE_IRQ(NEGE_EDGE_IRQ),
		     .EITHER_EDGE_IRQ(EITHER_EDGE_IRQ))
		 TP 
		   (.CLK_I(CLK_I),
		    .RST_I(RST_I),
		    .DAT_I(GPIO_DAT_I_switch[kti-16]),
		    .DAT_O(tpio_out[kti]),
		    .PIO_IO(PIO_IO[kti]),
		    .IRQ_O(IRQ_TRI_TEMP[kti]),
		    .PIO_TRI_WR_EN(PIO_TRI_WR_EN_2),
		    .PIO_TRI_RE_EN(PIO_TRI_RE_EN),
		    .PIO_DATA_WR_EN(PIO_DATA_WR_EN_2),
		    .PIO_DATA_RE_EN(PIO_DATA_RE_EN),
		    .IRQ_MASK_WR_EN(IRQ_MASK_WR_EN_2),
		    .IRQ_MASK_RE_EN(IRQ_MASK_RE_EN),
		    .EDGE_CAP_WR_EN(EDGE_CAP_WR_EN_2));
              end
	 end
	 if (DATA_WIDTH > 24) begin
	    genvar lti;
	    for (lti = 24; (lti < DATA_WIDTH) && (lti < 32); lti = lti + 1)
              begin : ltio_inst
		 TRI_PIO 
		   #(.DATA_WIDTH(1),
		     .IRQ_MODE(IRQ_MODE),
		     .LEVEL(LEVEL),
		     .EDGE(EDGE),
		     .POSE_EDGE_IRQ(POSE_EDGE_IRQ),
		     .NEGE_EDGE_IRQ(NEGE_EDGE_IRQ),
		     .EITHER_EDGE_IRQ(EITHER_EDGE_IRQ))
		 TP 
		   (.CLK_I(CLK_I),
		    .RST_I(RST_I),
		    .DAT_I(GPIO_DAT_I_switch[lti-24]),
		    .DAT_O(tpio_out[lti]),
		    .PIO_IO(PIO_IO[lti]),
		    .IRQ_O(IRQ_TRI_TEMP[lti]),
		    .PIO_TRI_WR_EN(PIO_TRI_WR_EN_3),
		    .PIO_TRI_RE_EN(PIO_TRI_RE_EN),
		    .PIO_DATA_WR_EN(PIO_DATA_WR_EN_3),
		    .PIO_DATA_RE_EN(PIO_DATA_RE_EN),
		    .IRQ_MASK_WR_EN(IRQ_MASK_WR_EN_3),
		    .IRQ_MASK_RE_EN(IRQ_MASK_RE_EN),
		    .EDGE_CAP_WR_EN(EDGE_CAP_WR_EN_3));
              end
	 end
	 
      end // if (GPIO_WB_DAT_WIDTH == 8)
      
      else if (GPIO_WB_DAT_WIDTH == 32) begin
	 
	 genvar iti;
	 for (iti = 0; (iti < DATA_WIDTH) && (iti < 8); iti = iti + 1)
           begin : itio_inst
              TRI_PIO 
		#(.DATA_WIDTH(1),
		  .IRQ_MODE(IRQ_MODE),
		  .LEVEL(LEVEL),
		  .EDGE(EDGE),
		  .POSE_EDGE_IRQ(POSE_EDGE_IRQ),
		  .NEGE_EDGE_IRQ(NEGE_EDGE_IRQ),
		  .EITHER_EDGE_IRQ(EITHER_EDGE_IRQ))
              TP 
		(.CLK_I(CLK_I),
		 .RST_I(RST_I),
		 .DAT_I(GPIO_DAT_I_switch[iti]),
		 .DAT_O(tpio_out[iti]),
		 .PIO_IO(PIO_IO[iti]),
		 .IRQ_O(IRQ_TRI_TEMP[iti]),
		 .PIO_TRI_WR_EN(PIO_TRI_WR_EN & GPIO_SEL_I_switch[0]),
		 .PIO_TRI_RE_EN(PIO_TRI_RE_EN),
		 .PIO_DATA_WR_EN(PIO_DATA_WR_EN & GPIO_SEL_I_switch[0]),
		 .PIO_DATA_RE_EN(PIO_DATA_RE_EN),
		 .IRQ_MASK_WR_EN(IRQ_MASK_WR_EN & GPIO_SEL_I_switch[0]),
		 .IRQ_MASK_RE_EN(IRQ_MASK_RE_EN),
		 .EDGE_CAP_WR_EN(EDGE_CAP_WR_EN & GPIO_SEL_I_switch[0]));
           end
	 if (DATA_WIDTH > 8) begin
	    genvar jti;
	    for (jti = 8; (jti < DATA_WIDTH) && (jti < 16); jti = jti + 1)
              begin : jtio_inst
		 TRI_PIO 
		   #(.DATA_WIDTH(1),
		     .IRQ_MODE(IRQ_MODE),
		     .LEVEL(LEVEL),
		     .EDGE(EDGE),
		     .POSE_EDGE_IRQ(POSE_EDGE_IRQ),
		     .NEGE_EDGE_IRQ(NEGE_EDGE_IRQ),
		     .EITHER_EDGE_IRQ(EITHER_EDGE_IRQ))
		 TP 
		   (.CLK_I(CLK_I),
		    .RST_I(RST_I),
		    .DAT_I(GPIO_DAT_I_switch[jti]),
		    .DAT_O(tpio_out[jti]),
		    .PIO_IO(PIO_IO[jti]),
		    .IRQ_O(IRQ_TRI_TEMP[jti]),
		    .PIO_TRI_WR_EN(PIO_TRI_WR_EN & GPIO_SEL_I_switch[1]),
		    .PIO_TRI_RE_EN(PIO_TRI_RE_EN),
		    .PIO_DATA_WR_EN(PIO_DATA_WR_EN & GPIO_SEL_I_switch[1]),
		    .PIO_DATA_RE_EN(PIO_DATA_RE_EN),
		    .IRQ_MASK_WR_EN(IRQ_MASK_WR_EN & GPIO_SEL_I_switch[1]),
		    .IRQ_MASK_RE_EN(IRQ_MASK_RE_EN),
		    .EDGE_CAP_WR_EN(EDGE_CAP_WR_EN & GPIO_SEL_I_switch[1]));
              end
	 end
	 if (DATA_WIDTH > 16) begin
	    genvar kti;
	    for (kti = 16; (kti < DATA_WIDTH) && (kti < 24); kti = kti + 1)
              begin : ktio_inst
		 TRI_PIO 
		   #(.DATA_WIDTH(1),
		     .IRQ_MODE(IRQ_MODE),
		     .LEVEL(LEVEL),
		     .EDGE(EDGE),
		     .POSE_EDGE_IRQ(POSE_EDGE_IRQ),
		     .NEGE_EDGE_IRQ(NEGE_EDGE_IRQ),
		     .EITHER_EDGE_IRQ(EITHER_EDGE_IRQ))
		 TP 
		   (.CLK_I(CLK_I),
		    .RST_I(RST_I),
		    .DAT_I(GPIO_DAT_I_switch[kti]),
		    .DAT_O(tpio_out[kti]),
		    .PIO_IO(PIO_IO[kti]),
		    .IRQ_O(IRQ_TRI_TEMP[kti]),
		    .PIO_TRI_WR_EN(PIO_TRI_WR_EN & GPIO_SEL_I_switch[2]),
		    .PIO_TRI_RE_EN(PIO_TRI_RE_EN),
		    .PIO_DATA_WR_EN(PIO_DATA_WR_EN & GPIO_SEL_I_switch[2]),
		    .PIO_DATA_RE_EN(PIO_DATA_RE_EN),
		    .IRQ_MASK_WR_EN(IRQ_MASK_WR_EN & GPIO_SEL_I_switch[2]),
		    .IRQ_MASK_RE_EN(IRQ_MASK_RE_EN),
		    .EDGE_CAP_WR_EN(EDGE_CAP_WR_EN & GPIO_SEL_I_switch[2]));
              end
	 end
	 if (DATA_WIDTH > 24) begin
	    genvar lti;
	    for (lti = 24; (lti < DATA_WIDTH) && (lti < 32); lti = lti + 1)
              begin : ltio_inst
		 TRI_PIO 
		   #(.DATA_WIDTH(1),
		     .IRQ_MODE(IRQ_MODE),
		     .LEVEL(LEVEL),
		     .EDGE(EDGE),
		     .POSE_EDGE_IRQ(POSE_EDGE_IRQ),
		     .NEGE_EDGE_IRQ(NEGE_EDGE_IRQ),
		     .EITHER_EDGE_IRQ(EITHER_EDGE_IRQ))
		 TP 
		   (.CLK_I(CLK_I),
		    .RST_I(RST_I),
		    .DAT_I(GPIO_DAT_I_switch[lti]),
		    .DAT_O(tpio_out[lti]),
		    .PIO_IO(PIO_IO[lti]),
		    .IRQ_O(IRQ_TRI_TEMP[lti]),
		    .PIO_TRI_WR_EN(PIO_TRI_WR_EN & GPIO_SEL_I_switch[3]),
		    .PIO_TRI_RE_EN(PIO_TRI_RE_EN),
		    .PIO_DATA_WR_EN(PIO_DATA_WR_EN & GPIO_SEL_I_switch[3]),
		    .PIO_DATA_RE_EN(PIO_DATA_RE_EN),
		    .IRQ_MASK_WR_EN(IRQ_MASK_WR_EN & GPIO_SEL_I_switch[3]),
		    .IRQ_MASK_RE_EN(IRQ_MASK_RE_EN),
		    .EDGE_CAP_WR_EN(EDGE_CAP_WR_EN & GPIO_SEL_I_switch[3]));
              end
	 end
	 
      end // if (GPIO_WB_DAT_WIDTH == 32)
            
   endgenerate
   
   
   wire read_addr_0, read_addr_4, read_addr_8, read_addr_C;
   assign read_addr_0 =                   (ADR_0 & GPIO_STB_I & ~GPIO_WE_I) ;   
   assign read_addr_4 =                   (ADR_4 & GPIO_STB_I & ~GPIO_WE_I) ;   
   assign read_addr_8 = (IRQ_MODE == 1 && (ADR_8 & GPIO_STB_I & ~GPIO_WE_I));   
   assign read_addr_C = (IRQ_MODE == 1 && (ADR_C & GPIO_STB_I & ~GPIO_WE_I));
   
   wire read_byte_0, read_byte_1, read_byte_2, read_byte_3;
   wire read_byte_4, read_byte_5, read_byte_6, read_byte_7;
   wire read_byte_8, read_byte_9, read_byte_A, read_byte_B;
   wire read_byte_C, read_byte_D, read_byte_E, read_byte_F;
   assign read_byte_0 =                   ((GPIO_ADR_I[3:0] == 4'b0000) & GPIO_STB_I & ~GPIO_WE_I) ;   
   assign read_byte_1 =                   ((GPIO_ADR_I[3:0] == 4'b0001) & GPIO_STB_I & ~GPIO_WE_I) ;   
   assign read_byte_2 =                   ((GPIO_ADR_I[3:0] == 4'b0010) & GPIO_STB_I & ~GPIO_WE_I) ;   
   assign read_byte_3 =                   ((GPIO_ADR_I[3:0] == 4'b0011) & GPIO_STB_I & ~GPIO_WE_I) ;   
   assign read_byte_4 =                   ((GPIO_ADR_I[3:0] == 4'b0100) & GPIO_STB_I & ~GPIO_WE_I) ;   
   assign read_byte_5 =                   ((GPIO_ADR_I[3:0] == 4'b0101) & GPIO_STB_I & ~GPIO_WE_I) ;   
   assign read_byte_6 =                   ((GPIO_ADR_I[3:0] == 4'b0110) & GPIO_STB_I & ~GPIO_WE_I) ;   
   assign read_byte_7 =                   ((GPIO_ADR_I[3:0] == 4'b0111) & GPIO_STB_I & ~GPIO_WE_I) ;   
   assign read_byte_8 = (IRQ_MODE == 1 && ((GPIO_ADR_I[3:0] == 4'b1000) & GPIO_STB_I & ~GPIO_WE_I));   
   assign read_byte_9 = (IRQ_MODE == 1 && ((GPIO_ADR_I[3:0] == 4'b1001) & GPIO_STB_I & ~GPIO_WE_I));   
   assign read_byte_A = (IRQ_MODE == 1 && ((GPIO_ADR_I[3:0] == 4'b1010) & GPIO_STB_I & ~GPIO_WE_I));   
   assign read_byte_B = (IRQ_MODE == 1 && ((GPIO_ADR_I[3:0] == 4'b1011) & GPIO_STB_I & ~GPIO_WE_I));   
   assign read_byte_C = (IRQ_MODE == 1 && ((GPIO_ADR_I[3:0] == 4'b1100) & GPIO_STB_I & ~GPIO_WE_I));   
   assign read_byte_D = (IRQ_MODE == 1 && ((GPIO_ADR_I[3:0] == 4'b1101) & GPIO_STB_I & ~GPIO_WE_I));   
   assign read_byte_E = (IRQ_MODE == 1 && ((GPIO_ADR_I[3:0] == 4'b1110) & GPIO_STB_I & ~GPIO_WE_I));   
   assign read_byte_F = (IRQ_MODE == 1 && ((GPIO_ADR_I[3:0] == 4'b1111) & GPIO_STB_I & ~GPIO_WE_I));   
   
   generate

      if (GPIO_WB_DAT_WIDTH == 8) begin
	 
	 if (INPUT_PORTS_ONLY == 1) begin
	    if (DATA_WIDTH > 24)
	      assign GPIO_DAT_O_switch = read_byte_0 ? PIO_DATA[ 7: 0] :
					 read_byte_1 ? PIO_DATA[15: 8] :
					 read_byte_2 ? PIO_DATA[23:16] :
					 read_byte_3 ? PIO_DATA[DATA_WIDTH-1:24] :
					 read_byte_8 ? IRQ_MASK[ 7: 0] :
					 read_byte_9 ? IRQ_MASK[15: 8] :
					 read_byte_A ? IRQ_MASK[23:16] :
					 read_byte_B ? IRQ_MASK[DATA_WIDTH-1:24] :
					 read_byte_C ? EDGE_CAPTURE[ 7: 0] :
					 read_byte_D ? EDGE_CAPTURE[15: 8] :
					 read_byte_E ? EDGE_CAPTURE[23:16] :
					 read_byte_F ? EDGE_CAPTURE[DATA_WIDTH-1:24] :
					 0;
	    else if (DATA_WIDTH > 16)
	      assign GPIO_DAT_O_switch = read_byte_0 ? PIO_DATA[ 7: 0] :
					 read_byte_1 ? PIO_DATA[15: 8] :
					 read_byte_2 ? PIO_DATA[DATA_WIDTH-1:16] :
					 read_byte_3 ? 8'h00 :
					 read_byte_8 ? IRQ_MASK[ 7: 0] :
					 read_byte_9 ? IRQ_MASK[15: 8] :
					 read_byte_A ? IRQ_MASK[DATA_WIDTH-1:16] :
					 read_byte_B ? 8'h00 :
					 read_byte_C ? EDGE_CAPTURE[ 7: 0] :
					 read_byte_D ? EDGE_CAPTURE[15: 8] :
					 read_byte_E ? EDGE_CAPTURE[DATA_WIDTH-1:16] :
					 read_byte_F ? 8'h00 :
					 0;
	    else if (DATA_WIDTH > 8)
	      assign GPIO_DAT_O_switch = read_byte_0 ? PIO_DATA[ 7: 0] :
					 read_byte_1 ? PIO_DATA[DATA_WIDTH-1: 8] :
					 read_byte_2 ? 8'h00 :
					 read_byte_3 ? 8'h00 :
					 read_byte_8 ? IRQ_MASK[ 7: 0] :
					 read_byte_9 ? IRQ_MASK[DATA_WIDTH-1: 8] :
					 read_byte_A ? 8'h00 :
					 read_byte_B ? 8'h00 :
					 read_byte_C ? EDGE_CAPTURE[ 7: 0] :
					 read_byte_D ? EDGE_CAPTURE[DATA_WIDTH-1: 8] :
					 read_byte_E ? 8'h00 :
					 read_byte_F ? 8'h00 :
					 0;
	    else
	      assign GPIO_DAT_O_switch = read_byte_0 ? PIO_DATA[DATA_WIDTH-1: 0] :
					 read_byte_1 ? 8'h00 :
					 read_byte_2 ? 8'h00 :
					 read_byte_3 ? 8'h00 :
					 read_byte_8 ? IRQ_MASK[DATA_WIDTH-1: 0] :
					 read_byte_9 ? 8'h00 :
					 read_byte_A ? 8'h00 :
					 read_byte_B ? 8'h00 :
					 read_byte_C ? EDGE_CAPTURE[DATA_WIDTH-1: 0] :
					 read_byte_D ? 8'h00 :
					 read_byte_E ? 8'h00 :
					 read_byte_F ? 8'h00 :
					 0;
	 end
	 else if (BOTH_INPUT_AND_OUTPUT == 1) begin
	    if (INPUT_WIDTH > 24)
	      assign GPIO_DAT_O_switch = read_byte_0 ? PIO_DATAI[ 7: 0] :
					 read_byte_1 ? PIO_DATAI[15: 8] :
					 read_byte_2 ? PIO_DATAI[23:16] :
					 read_byte_3 ? PIO_DATAI[INPUT_WIDTH-1:24] :
					 read_byte_8 ? IRQ_MASK_BOTH[ 7: 0] :
					 read_byte_9 ? IRQ_MASK_BOTH[15: 8] :
					 read_byte_A ? IRQ_MASK_BOTH[23:16] :
					 read_byte_B ? IRQ_MASK_BOTH[INPUT_WIDTH-1:24] :
					 read_byte_C ? EDGE_CAPTURE_BOTH[ 7: 0] :
					 read_byte_D ? EDGE_CAPTURE_BOTH[15: 8] :
					 read_byte_E ? EDGE_CAPTURE_BOTH[23:16] :
					 read_byte_F ? EDGE_CAPTURE_BOTH[INPUT_WIDTH-1:24] :
					 0;
	    else if (INPUT_WIDTH > 16)
	      assign GPIO_DAT_O_switch = read_byte_0 ? PIO_DATAI[ 7: 0] :
					 read_byte_1 ? PIO_DATAI[15: 8] :
					 read_byte_2 ? PIO_DATAI[INPUT_WIDTH-1:16] :
					 read_byte_3 ? 8'h00 :
					 read_byte_8 ? IRQ_MASK_BOTH[ 7: 0] :
					 read_byte_9 ? IRQ_MASK_BOTH[15: 8] :
					 read_byte_A ? IRQ_MASK_BOTH[INPUT_WIDTH-1:16] :
					 read_byte_B ? 8'h00 :
					 read_byte_C ? EDGE_CAPTURE_BOTH[ 7: 0] :
					 read_byte_D ? EDGE_CAPTURE_BOTH[15: 8] :
					 read_byte_E ? EDGE_CAPTURE_BOTH[INPUT_WIDTH-1:16] :
					 read_byte_F ? 8'h00 :
					 0;
	    else if (INPUT_WIDTH > 8)      
	      assign GPIO_DAT_O_switch = read_byte_0 ? PIO_DATAI[ 7: 0] :
					 read_byte_1 ? PIO_DATAI[INPUT_WIDTH-1: 8] :
					 read_byte_2 ? 8'h00 :
					 read_byte_3 ? 8'h00 :
					 read_byte_8 ? IRQ_MASK_BOTH[ 7: 0] :
					 read_byte_9 ? IRQ_MASK_BOTH[INPUT_WIDTH-1: 8] :
					 read_byte_A ? 8'h00 :
					 read_byte_B ? 8'h00 :
					 read_byte_C ? EDGE_CAPTURE_BOTH[ 7: 0] :
					 read_byte_D ? EDGE_CAPTURE_BOTH[INPUT_WIDTH-1: 8] :
					 read_byte_E ? 8'h00 :
					 read_byte_F ? 8'h00 :
					 0;
	    else
	      assign GPIO_DAT_O_switch = read_byte_0 ? PIO_DATAI[INPUT_WIDTH-1: 0] :
					 read_byte_1 ? 8'h00 :
					 read_byte_2 ? 8'h00 :
					 read_byte_3 ? 8'h00 :
					 read_byte_8 ? IRQ_MASK_BOTH[INPUT_WIDTH-1: 0] :
					 read_byte_9 ? 8'h00 :
					 read_byte_A ? 8'h00 :
					 read_byte_B ? 8'h00 :
					 read_byte_C ? EDGE_CAPTURE_BOTH[INPUT_WIDTH-1: 0] :
					 read_byte_D ? 8'h00 :
					 read_byte_E ? 8'h00 :
					 read_byte_F ? 8'h00 :
					 0;
	 end
	 else if (TRISTATE_PORTS == 1) begin
	    if (DATA_WIDTH > 24)
	      assign GPIO_DAT_O_switch = read_byte_0 ? tpio_out[ 7: 0] :
					 read_byte_1 ? tpio_out[15: 8] :
					 read_byte_2 ? tpio_out[23:16] :
					 read_byte_3 ? tpio_out[DATA_WIDTH-1:24] :
					 read_byte_4 ? tpio_out[ 7: 0] :
					 read_byte_5 ? tpio_out[15: 8] :
					 read_byte_6 ? tpio_out[23:16] :
					 read_byte_7 ? tpio_out[DATA_WIDTH-1:24] :
					 read_byte_8 ? tpio_out[ 7: 0] :
					 read_byte_9 ? tpio_out[15: 8] :
					 read_byte_A ? tpio_out[23:16] :
					 read_byte_B ? tpio_out[DATA_WIDTH-1:24] :
					 read_byte_C ? IRQ_TRI_TEMP[ 7: 0] :
					 read_byte_D ? IRQ_TRI_TEMP[15: 8] :
					 read_byte_E ? IRQ_TRI_TEMP[23:16] :
					 read_byte_F ? IRQ_TRI_TEMP[DATA_WIDTH-1:24] :
					 0;
	    else if (DATA_WIDTH > 16)
	      assign GPIO_DAT_O_switch = read_byte_0 ? tpio_out[ 7: 0] :
					 read_byte_1 ? tpio_out[15: 8] :
					 read_byte_2 ? tpio_out[DATA_WIDTH-1:16] :
					 read_byte_3 ? 8'h00 :
					 read_byte_4 ? tpio_out[ 7: 0] :
					 read_byte_5 ? tpio_out[15: 8] :
					 read_byte_6 ? tpio_out[DATA_WIDTH-1:16] :
					 read_byte_7 ? 8'h00 :
					 read_byte_8 ? tpio_out[ 7: 0] :
					 read_byte_9 ? tpio_out[15: 8] :
					 read_byte_A ? tpio_out[DATA_WIDTH-1:16] :
					 read_byte_B ? 8'h00 :
					 read_byte_C ? IRQ_TRI_TEMP[ 7: 0] :
					 read_byte_D ? IRQ_TRI_TEMP[15: 8] :
					 read_byte_E ? IRQ_TRI_TEMP[DATA_WIDTH-1:16] :
					 read_byte_F ? 8'h00 :
					 0;
	    else if (DATA_WIDTH > 8)
	      assign GPIO_DAT_O_switch = read_byte_0 ? tpio_out[ 7: 0] :
					 read_byte_1 ? tpio_out[DATA_WIDTH-1: 8] :
					 read_byte_2 ? 8'h00 :
					 read_byte_3 ? 8'h00 :
					 read_byte_4 ? tpio_out[ 7: 0] :
					 read_byte_5 ? tpio_out[DATA_WIDTH-1: 8] :
					 read_byte_6 ? 8'h00 :
					 read_byte_7 ? 8'h00 :
					 read_byte_8 ? tpio_out[ 7: 0] :
					 read_byte_9 ? tpio_out[DATA_WIDTH-1: 8] :
					 read_byte_A ? 8'h00 :
					 read_byte_B ? 8'h00 :
					 read_byte_C ? IRQ_TRI_TEMP[ 7: 0] :
					 read_byte_D ? IRQ_TRI_TEMP[DATA_WIDTH-1: 8] :
					 read_byte_E ? 8'h00 :
					 read_byte_F ? 8'h00 :
					 0;
	    else
	      assign GPIO_DAT_O_switch = read_byte_0 ? tpio_out[DATA_WIDTH-1: 0] :
					 read_byte_1 ? 8'h00 :
					 read_byte_2 ? 8'h00 :
					 read_byte_3 ? 8'h00 :
					 read_byte_4 ? tpio_out[DATA_WIDTH-1: 0] :
					 read_byte_5 ? 8'h00 :
					 read_byte_6 ? 8'h00 :
					 read_byte_7 ? 8'h00 :
					 read_byte_8 ? tpio_out[DATA_WIDTH-1: 0] :
					 read_byte_9 ? 8'h00 :
					 read_byte_A ? 8'h00 :
					 read_byte_B ? 8'h00 :
					 read_byte_C ? IRQ_TRI_TEMP[DATA_WIDTH-1: 0] :
					 read_byte_D ? 8'h00 :
					 read_byte_E ? 8'h00 :
					 read_byte_F ? 8'h00 :
					 0;
	 end
	 else
	   assign GPIO_DAT_O_switch = 0;
	 
      end // if (GPIO_WB_DAT_WIDTH == 8)
      
      else if (GPIO_WB_DAT_WIDTH == 32) begin
	 
	 if (INPUT_PORTS_ONLY == 1)
	   assign GPIO_DAT_O_switch = read_addr_0 ? PIO_DATA : 
				      read_addr_8 ? IRQ_MASK :
				      read_addr_C ? EDGE_CAPTURE :
				      0;
	 else if (BOTH_INPUT_AND_OUTPUT == 1)
	   assign GPIO_DAT_O_switch = read_addr_0 ? PIO_DATAI : 
				      read_addr_8 ? IRQ_MASK_BOTH :
				      read_addr_C ? EDGE_CAPTURE_BOTH :
				      0;
	 else if (TRISTATE_PORTS == 1)
	   assign GPIO_DAT_O_switch = read_addr_0 ? tpio_out : 
				      read_addr_4 ? tpio_out : 
				      read_addr_8 ? tpio_out :
				      read_addr_C ? IRQ_TRI_TEMP :
				      0;
	 else
	   assign GPIO_DAT_O_switch = 0;
	 
      end // if (GPIO_WB_DAT_WIDTH == 32)
            
   endgenerate
   
   
   
   //-----------------------------------------------------------------------------
   //-------------------------------IRQ Generation--------------------------------
   //-----------------------------------------------------------------------------
   generate
      
      if (IRQ_MODE == 1) begin
	 
	 if (GPIO_WB_DAT_WIDTH == 8) begin
	    
	    genvar im_idx;
	    for (im_idx = 0; (im_idx < DATA_WIDTH) && (im_idx < 8); im_idx = im_idx + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I)
		     IRQ_MASK[im_idx] <= #UDLY 0;
		   else if (IRQ_MASK_WR_EN_0)
		     IRQ_MASK[im_idx] <= #UDLY GPIO_DAT_I_switch[im_idx];
	      end
	    if (DATA_WIDTH > 8) begin
	       genvar jm_idx;
	       for (jm_idx = 8; (jm_idx < DATA_WIDTH) && (jm_idx < 16); jm_idx = jm_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_MASK[jm_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN_1)
			IRQ_MASK[jm_idx] <= #UDLY GPIO_DAT_I_switch[jm_idx-8];
		 end
	    end
	    if (DATA_WIDTH > 16) begin
	       genvar km_idx;
	       for (km_idx = 16; (km_idx < DATA_WIDTH) && (km_idx < 24); km_idx = km_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_MASK[km_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN_2)
			IRQ_MASK[km_idx] <= #UDLY GPIO_DAT_I_switch[km_idx-16];
		 end
	    end
	    if (DATA_WIDTH > 24) begin
	       genvar lm_idx;
	       for (lm_idx = 24; (lm_idx < DATA_WIDTH) && (lm_idx < 32); lm_idx = lm_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_MASK[lm_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN_3)
			IRQ_MASK[lm_idx] <= #UDLY GPIO_DAT_I_switch[lm_idx-24];
		 end
	    end
	    
	    genvar imb_idx;
	    for (imb_idx = 0; (imb_idx < INPUT_WIDTH) && (imb_idx < 8); imb_idx = imb_idx + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I)
		     IRQ_MASK_BOTH[imb_idx] <= #UDLY 0;
		   else if (IRQ_MASK_WR_EN_0)
		     IRQ_MASK_BOTH[imb_idx] <= #UDLY GPIO_DAT_I_switch[imb_idx];
	      end
	    if (INPUT_WIDTH > 8) begin
	       genvar jmb_idx;
	       for (jmb_idx = 8; (jmb_idx < INPUT_WIDTH) && (jmb_idx < 16); jmb_idx = jmb_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_MASK_BOTH[jmb_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN_1)
			IRQ_MASK_BOTH[jmb_idx] <= #UDLY GPIO_DAT_I_switch[jmb_idx-8];
		 end
	    end
	    if (INPUT_WIDTH > 16) begin
	       genvar kmb_idx;
	       for (kmb_idx = 16; (kmb_idx < INPUT_WIDTH) && (kmb_idx < 24); kmb_idx = kmb_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_MASK_BOTH[kmb_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN_2)
			IRQ_MASK_BOTH[kmb_idx] <= #UDLY GPIO_DAT_I_switch[kmb_idx-16];
		 end
	    end
	    if (INPUT_WIDTH > 24) begin
	       genvar lmb_idx;
	       for (lmb_idx = 24; (lmb_idx < INPUT_WIDTH) && (lmb_idx < 32); lmb_idx = lmb_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_MASK_BOTH[lmb_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN_3)
			IRQ_MASK_BOTH[lmb_idx] <= #UDLY GPIO_DAT_I_switch[lmb_idx-24];
		 end
	    end
	    
	 end // if (GPIO_WB_DAT_WIDTH == 8)
	 else if (GPIO_WB_DAT_WIDTH == 32) begin
	    
	    genvar im_idx;
	    for (im_idx = 0; (im_idx < DATA_WIDTH) && (im_idx < 8); im_idx = im_idx + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I)
		     IRQ_MASK[im_idx] <= #UDLY 0;
		   else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[0])
		     IRQ_MASK[im_idx] <= #UDLY GPIO_DAT_I_switch[im_idx];
	      end
	    if (DATA_WIDTH > 8) begin
	       genvar jm_idx;
	       for (jm_idx = 8; (jm_idx < DATA_WIDTH) && (jm_idx < 16); jm_idx = jm_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_MASK[jm_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[1])
			IRQ_MASK[jm_idx] <= #UDLY GPIO_DAT_I_switch[jm_idx];
		 end
	    end
	    if (DATA_WIDTH > 16) begin
	       genvar km_idx;
	       for (km_idx = 16; (km_idx < DATA_WIDTH) && (km_idx < 24); km_idx = km_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_MASK[km_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[2])
			IRQ_MASK[km_idx] <= #UDLY GPIO_DAT_I_switch[km_idx];
		 end
	    end
	    if (DATA_WIDTH > 24) begin
	       genvar lm_idx;
	       for (lm_idx = 24; (lm_idx < DATA_WIDTH) && (lm_idx < 32); lm_idx = lm_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_MASK[lm_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[3])
			IRQ_MASK[lm_idx] <= #UDLY GPIO_DAT_I_switch[lm_idx];
		 end
	    end
	    
	    genvar imb_idx;
	    for (imb_idx = 0; (imb_idx < INPUT_WIDTH) && (imb_idx < 8); imb_idx = imb_idx + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I)
		     IRQ_MASK_BOTH[imb_idx] <= #UDLY 0;
		   else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[0])
		     IRQ_MASK_BOTH[imb_idx] <= #UDLY GPIO_DAT_I_switch[imb_idx];
	      end
	    if (INPUT_WIDTH > 8) begin
	       genvar jmb_idx;
	       for (jmb_idx = 8; (jmb_idx < INPUT_WIDTH) && (jmb_idx < 16); jmb_idx = jmb_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_MASK_BOTH[jmb_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[1])
			IRQ_MASK_BOTH[jmb_idx] <= #UDLY GPIO_DAT_I_switch[jmb_idx];
		 end
	    end
	    if (INPUT_WIDTH > 16) begin
	       genvar kmb_idx;
	       for (kmb_idx = 16; (kmb_idx < INPUT_WIDTH) && (kmb_idx < 24); kmb_idx = kmb_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_MASK_BOTH[kmb_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[2])
			IRQ_MASK_BOTH[kmb_idx] <= #UDLY GPIO_DAT_I_switch[kmb_idx];
		 end
	    end
	    if (INPUT_WIDTH > 24) begin
	       genvar lmb_idx;
	       for (lmb_idx = 24; (lmb_idx < INPUT_WIDTH) && (lmb_idx < 32); lmb_idx = lmb_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_MASK_BOTH[lmb_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[3])
			IRQ_MASK_BOTH[lmb_idx] <= #UDLY GPIO_DAT_I_switch[lmb_idx];
		 end
	    end
	    
	 end // if (GPIO_WB_DAT_WIDTH == 32)
	 	 
      end // if (IRQ_MODE == 1)
            
   endgenerate
   
   
   
   generate 
      //--------------------------------
      //--INPUT_PORTS_ONLY MODE IRQ
      //--------------------------------
      if ((IRQ_MODE == 1) && (INPUT_PORTS_ONLY == 1) && (LEVEL == 1)) begin
	 // level mode IRQ
	 
	 if (GPIO_WB_DAT_WIDTH == 8) begin
	    
	    genvar i;
	    for (i = 0; (i < DATA_WIDTH) && (i < 8); i = i + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I)
		  IRQ_TEMP[i] <= #UDLY 0;
		   else if (IRQ_MASK_WR_EN_0)
		     IRQ_TEMP[i] <= #UDLY IRQ_TEMP[i] & GPIO_DAT_I_switch[i];
		   else
		     IRQ_TEMP[i] <= #UDLY PIO_IN[i] & IRQ_MASK[i];
	      end
	    if (DATA_WIDTH > 8) begin
	       genvar j;
	       for (j = 8; (j < DATA_WIDTH) && (j < 16); j = j + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_TEMP[j] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN_1)
			IRQ_TEMP[j] <= #UDLY IRQ_TEMP[j] & GPIO_DAT_I_switch[j-8];
		      else
			IRQ_TEMP[j] <= #UDLY PIO_IN[j] & IRQ_MASK[j];
		 end
	    end
	    if (DATA_WIDTH > 16) begin
	       genvar k;
	       for (k = 16; (k < DATA_WIDTH) && (k < 24); k = k + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_TEMP[k] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN_2)		  
			IRQ_TEMP[k] <= #UDLY IRQ_TEMP[k] & GPIO_DAT_I_switch[k-16];
		      else
			IRQ_TEMP[k] <= #UDLY PIO_IN[k] & IRQ_MASK[k];
		 end
	    end
	    if (DATA_WIDTH > 24) begin
	       genvar l;
	       for (l = 24; (l < DATA_WIDTH) && (l < 32); l = l + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_TEMP[l] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN_3)
			IRQ_TEMP[l] <= #UDLY IRQ_TEMP[l] & GPIO_DAT_I_switch[l-24];
		      else
			IRQ_TEMP[l] <= #UDLY PIO_IN[l] & IRQ_MASK[l];
		 end
	    end
	    
	 end // if (GPIO_WB_DAT_WIDTH == 8)
	 
	 else if (GPIO_WB_DAT_WIDTH == 32) begin
	    
	    genvar i;
	    for (i = 0; (i < DATA_WIDTH) && (i < 8); i = i + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I)
		  IRQ_TEMP[i] <= #UDLY 0;
		   else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[0])
		     IRQ_TEMP[i] <= #UDLY IRQ_TEMP[i] & GPIO_DAT_I_switch[i];
		   else
		     IRQ_TEMP[i] <= #UDLY PIO_IN[i] & IRQ_MASK[i];
	      end
	    if (DATA_WIDTH > 8) begin
	       genvar j;
	       for (j = 8; (j < DATA_WIDTH) && (j < 16); j = j + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_TEMP[j] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[1])
			IRQ_TEMP[j] <= #UDLY IRQ_TEMP[j] & GPIO_DAT_I_switch[j];
		      else
			IRQ_TEMP[j] <= #UDLY PIO_IN[j] & IRQ_MASK[j];
		 end
	    end
	    if (DATA_WIDTH > 16) begin
	       genvar k;
	       for (k = 16; (k < DATA_WIDTH) && (k < 24); k = k + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_TEMP[k] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[2])		  
			IRQ_TEMP[k] <= #UDLY IRQ_TEMP[k] & GPIO_DAT_I_switch[k];
		      else
			IRQ_TEMP[k] <= #UDLY PIO_IN[k] & IRQ_MASK[k];
		 end
	    end
	    if (DATA_WIDTH > 24) begin
	       genvar l;
	       for (l = 24; (l < DATA_WIDTH) && (l < 32); l = l + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_TEMP[l] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[3])
			IRQ_TEMP[l] <= #UDLY IRQ_TEMP[l] & GPIO_DAT_I_switch[l];
		      else
			IRQ_TEMP[l] <= #UDLY PIO_IN[l] & IRQ_MASK[l];
		 end
	    end
	    
	 end // if (GPIO_WB_DAT_WIDTH == 32)
	 	 
         assign   IRQ_O = |IRQ_TEMP;
	 
      end // if ((IRQ_MODE == 1) && (INPUT_PORTS_ONLY == 1) && (LEVEL == 1))
      
      else if ((IRQ_MODE == 1) && (INPUT_PORTS_ONLY == 1) && (EDGE == 1)) begin
	 // edge mode IRQ
	 
         always @(posedge CLK_I or posedge RST_I)
           if (RST_I)
             PIO_DATA_DLY <= #UDLY 0;
           else
             PIO_DATA_DLY <= PIO_IN;
	 
         // edge-capture register bits are treated as individual bits.
	 if (GPIO_WB_DAT_WIDTH == 8) begin
	    
            genvar i;
            for (i = 0; (i < DATA_WIDTH) && (i < 8); i = i + 1)
              begin
		 always @(posedge CLK_I or posedge RST_I)
                   if (RST_I)
                     EDGE_CAPTURE[i] <= #UDLY 0;
                   else if (|(PIO_IN[i] & ~PIO_DATA_DLY[i]) && (POSE_EDGE_IRQ == 1))
                     EDGE_CAPTURE[i] <= #UDLY PIO_IN[i] & ~PIO_DATA_DLY[i];
                   else if (|(~PIO_IN[i] & PIO_DATA_DLY[i]) && (NEGE_EDGE_IRQ == 1))
                     EDGE_CAPTURE[i] <= #UDLY ~PIO_IN[i] & PIO_DATA_DLY[i];
                   else if (|(PIO_IN[i] & ~PIO_DATA_DLY[i]) && (EITHER_EDGE_IRQ == 1))
                     EDGE_CAPTURE[i] <= #UDLY PIO_IN[i] & ~PIO_DATA_DLY[i];
                   else if (|(~PIO_IN[i] & PIO_DATA_DLY[i]) && (EITHER_EDGE_IRQ == 1))
                     EDGE_CAPTURE[i] <= #UDLY ~PIO_IN[i] & PIO_DATA_DLY[i];
                   else if ( (~IRQ_MASK[i]) & GPIO_DAT_I_switch[i] & IRQ_MASK_WR_EN_0)
                     // interrupt mask is being set, so clear edge-capture
                     EDGE_CAPTURE[i] <= #UDLY 0;
                   else if (EDGE_CAP_WR_EN_0)
                     // user's writing to the edge register, so update edge capture
                     // register
                     EDGE_CAPTURE[i] <= #UDLY EDGE_CAPTURE[i] & GPIO_DAT_I_switch[i];
              end
	    
	    if (DATA_WIDTH > 8) begin
               genvar j;
               for (j = 8; (j < DATA_WIDTH) && (j < 16); j = j + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
                      if (RST_I)
			EDGE_CAPTURE[j] <= #UDLY 0;
                      else if (|(PIO_IN[j] & ~PIO_DATA_DLY[j]) && (POSE_EDGE_IRQ == 1))
			EDGE_CAPTURE[j] <= #UDLY PIO_IN[j] & ~PIO_DATA_DLY[j];
                      else if (|(~PIO_IN[j] & PIO_DATA_DLY[j]) && (NEGE_EDGE_IRQ == 1))
			EDGE_CAPTURE[j] <= #UDLY ~PIO_IN[j] & PIO_DATA_DLY[j];
                      else if (|(PIO_IN[j] & ~PIO_DATA_DLY[j]) && (EITHER_EDGE_IRQ == 1))
			EDGE_CAPTURE[j] <= #UDLY PIO_IN[j] & ~PIO_DATA_DLY[j];
                      else if (|(~PIO_IN[j] & PIO_DATA_DLY[j]) && (EITHER_EDGE_IRQ == 1))
			EDGE_CAPTURE[j] <= #UDLY ~PIO_IN[j] & PIO_DATA_DLY[j];
                      else if ( (~IRQ_MASK[j]) & GPIO_DAT_I_switch[j-8] & IRQ_MASK_WR_EN_1)
			// interrupt mask is being set, so clear edge-capture
			EDGE_CAPTURE[j] <= #UDLY 0;
                      else if (EDGE_CAP_WR_EN_1)
			// user's writing to the edge register, so update edge capture
			// register
			EDGE_CAPTURE[j] <= #UDLY EDGE_CAPTURE[j] & GPIO_DAT_I_switch[j-8];
		 end
	    end
	    
	    if (DATA_WIDTH > 16) begin
               genvar k;
               for (k = 16; (k < DATA_WIDTH) && (k < 24); k = k + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
                      if (RST_I)
			EDGE_CAPTURE[k] <= #UDLY 0;
                      else if (|(PIO_IN[k] & ~PIO_DATA_DLY[k]) && (POSE_EDGE_IRQ == 1))
			EDGE_CAPTURE[k] <= #UDLY PIO_IN[k] & ~PIO_DATA_DLY[k];
                      else if (|(~PIO_IN[k] & PIO_DATA_DLY[k]) && (NEGE_EDGE_IRQ == 1))
			EDGE_CAPTURE[k] <= #UDLY ~PIO_IN[k] & PIO_DATA_DLY[k];
                      else if (|(PIO_IN[k] & ~PIO_DATA_DLY[k]) && (EITHER_EDGE_IRQ == 1))
			EDGE_CAPTURE[k] <= #UDLY PIO_IN[k] & ~PIO_DATA_DLY[k];
                      else if (|(~PIO_IN[k] & PIO_DATA_DLY[k]) && (EITHER_EDGE_IRQ == 1))
			EDGE_CAPTURE[k] <= #UDLY ~PIO_IN[k] & PIO_DATA_DLY[k];
                      else if ( (~IRQ_MASK[k]) & GPIO_DAT_I_switch[k-16] & IRQ_MASK_WR_EN_2)
			// interrupt mask is being set, so clear edge-capture
			EDGE_CAPTURE[k] <= #UDLY 0;
                      else if (EDGE_CAP_WR_EN_2)
			// user's writing to the edge register, so update edge capture
			// register
			EDGE_CAPTURE[k] <= #UDLY EDGE_CAPTURE[k] & GPIO_DAT_I_switch[k-16];
		 end
	    end
	    
	    if (DATA_WIDTH > 24) begin
               genvar l;
               for (l = 24; l < DATA_WIDTH; l = l + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
                      if (RST_I)
			EDGE_CAPTURE[l] <= #UDLY 0;
                      else if (|(PIO_IN[l] & ~PIO_DATA_DLY[l]) && (POSE_EDGE_IRQ == 1))
			EDGE_CAPTURE[l] <= #UDLY PIO_IN[l] & ~PIO_DATA_DLY[l];
                      else if (|(~PIO_IN[l] & PIO_DATA_DLY[l]) && (NEGE_EDGE_IRQ == 1))
			EDGE_CAPTURE[l] <= #UDLY ~PIO_IN[l] & PIO_DATA_DLY[l];
                      else if (|(PIO_IN[l] & ~PIO_DATA_DLY[l]) && (EITHER_EDGE_IRQ == 1))
			EDGE_CAPTURE[l] <= #UDLY PIO_IN[l] & ~PIO_DATA_DLY[l];
                      else if (|(~PIO_IN[l] & PIO_DATA_DLY[l]) && (EITHER_EDGE_IRQ == 1))
			EDGE_CAPTURE[l] <= #UDLY ~PIO_IN[l] & PIO_DATA_DLY[l];
                      else if ( (~IRQ_MASK[l]) & GPIO_DAT_I_switch[l-24] & IRQ_MASK_WR_EN_3)
			// interrupt mask is being set, so clear edge-capture
			EDGE_CAPTURE[l] <= #UDLY 0;
                      else if (EDGE_CAP_WR_EN_3)
			// user's writing to the edge register, so update edge capture
			// register
			EDGE_CAPTURE[l] <= #UDLY EDGE_CAPTURE[l] & GPIO_DAT_I_switch[l-24];
		 end
	    end
	    
	 end // if (GPIO_WB_DAT_WIDTH == 8)
	 else if (GPIO_WB_DAT_WIDTH == 32) begin
	    
            genvar i;
            for (i = 0; (i < DATA_WIDTH) && (i < 8); i = i + 1)
              begin
		 always @(posedge CLK_I or posedge RST_I)
                   if (RST_I)
                     EDGE_CAPTURE[i] <= #UDLY 0;
                   else if (|(PIO_IN[i] & ~PIO_DATA_DLY[i]) && (POSE_EDGE_IRQ == 1))
                     EDGE_CAPTURE[i] <= #UDLY PIO_IN[i] & ~PIO_DATA_DLY[i];
                   else if (|(~PIO_IN[i] & PIO_DATA_DLY[i]) && (NEGE_EDGE_IRQ == 1))
                     EDGE_CAPTURE[i] <= #UDLY ~PIO_IN[i] & PIO_DATA_DLY[i];
                   else if (|(PIO_IN[i] & ~PIO_DATA_DLY[i]) && (EITHER_EDGE_IRQ == 1))
                     EDGE_CAPTURE[i] <= #UDLY PIO_IN[i] & ~PIO_DATA_DLY[i];
                   else if (|(~PIO_IN[i] & PIO_DATA_DLY[i]) && (EITHER_EDGE_IRQ == 1))
                     EDGE_CAPTURE[i] <= #UDLY ~PIO_IN[i] & PIO_DATA_DLY[i];
                   else if ( (~IRQ_MASK[i]) & GPIO_DAT_I_switch[i] & IRQ_MASK_WR_EN && GPIO_SEL_I_switch[0])
                     // interrupt mask is being set, so clear edge-capture
                     EDGE_CAPTURE[i] <= #UDLY 0;
                   else if (EDGE_CAP_WR_EN && GPIO_SEL_I_switch[0])
                     // user's writing to the edge register, so update edge capture
                     // register
                     EDGE_CAPTURE[i] <= #UDLY EDGE_CAPTURE[i] & GPIO_DAT_I_switch[i];
              end
	    
	    if (DATA_WIDTH > 8) begin
               genvar j;
               for (j = 8; (j < DATA_WIDTH) && (j < 16); j = j + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
                      if (RST_I)
			EDGE_CAPTURE[j] <= #UDLY 0;
                      else if (|(PIO_IN[j] & ~PIO_DATA_DLY[j]) && (POSE_EDGE_IRQ == 1))
			EDGE_CAPTURE[j] <= #UDLY PIO_IN[j] & ~PIO_DATA_DLY[j];
                      else if (|(~PIO_IN[j] & PIO_DATA_DLY[j]) && (NEGE_EDGE_IRQ == 1))
			EDGE_CAPTURE[j] <= #UDLY ~PIO_IN[j] & PIO_DATA_DLY[j];
                      else if (|(PIO_IN[j] & ~PIO_DATA_DLY[j]) && (EITHER_EDGE_IRQ == 1))
			EDGE_CAPTURE[j] <= #UDLY PIO_IN[j] & ~PIO_DATA_DLY[j];
                      else if (|(~PIO_IN[j] & PIO_DATA_DLY[j]) && (EITHER_EDGE_IRQ == 1))
			EDGE_CAPTURE[j] <= #UDLY ~PIO_IN[j] & PIO_DATA_DLY[j];
                      else if ( (~IRQ_MASK[j]) & GPIO_DAT_I_switch[j-8] & IRQ_MASK_WR_EN && GPIO_SEL_I_switch[0])
			// interrupt mask is being set, so clear edge-capture
			EDGE_CAPTURE[j] <= #UDLY 0;
                      else if (EDGE_CAP_WR_EN && GPIO_SEL_I_switch[0])
			// user's writing to the edge register, so update edge capture
			// register
			EDGE_CAPTURE[j] <= #UDLY EDGE_CAPTURE[j] & GPIO_DAT_I_switch[j];
		 end
	    end
	    
	    if (DATA_WIDTH > 16) begin
               genvar k;
               for (k = 16; (k < DATA_WIDTH) && (k < 24); k = k + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
                      if (RST_I)
			EDGE_CAPTURE[k] <= #UDLY 0;
                      else if (|(PIO_IN[k] & ~PIO_DATA_DLY[k]) && (POSE_EDGE_IRQ == 1))
			EDGE_CAPTURE[k] <= #UDLY PIO_IN[k] & ~PIO_DATA_DLY[k];
                      else if (|(~PIO_IN[k] & PIO_DATA_DLY[k]) && (NEGE_EDGE_IRQ == 1))
			EDGE_CAPTURE[k] <= #UDLY ~PIO_IN[k] & PIO_DATA_DLY[k];
                      else if (|(PIO_IN[k] & ~PIO_DATA_DLY[k]) && (EITHER_EDGE_IRQ == 1))
			EDGE_CAPTURE[k] <= #UDLY PIO_IN[k] & ~PIO_DATA_DLY[k];
                      else if (|(~PIO_IN[k] & PIO_DATA_DLY[k]) && (EITHER_EDGE_IRQ == 1))
			EDGE_CAPTURE[k] <= #UDLY ~PIO_IN[k] & PIO_DATA_DLY[k];
                      else if ( (~IRQ_MASK[k]) & GPIO_DAT_I_switch[k-16] & IRQ_MASK_WR_EN && GPIO_SEL_I_switch[2])
			// interrupt mask is being set, so clear edge-capture
			EDGE_CAPTURE[k] <= #UDLY 0;
                      else if (EDGE_CAP_WR_EN && GPIO_SEL_I_switch[2])
			// user's writing to the edge register, so update edge capture
			// register
			EDGE_CAPTURE[k] <= #UDLY EDGE_CAPTURE[k] & GPIO_DAT_I_switch[k];
		 end
	    end
	    
	    if (DATA_WIDTH > 24) begin
               genvar l;
               for (l = 24; l < DATA_WIDTH; l = l + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
                      if (RST_I)
			EDGE_CAPTURE[l] <= #UDLY 0;
                      else if (|(PIO_IN[l] & ~PIO_DATA_DLY[l]) && (POSE_EDGE_IRQ == 1))
			EDGE_CAPTURE[l] <= #UDLY PIO_IN[l] & ~PIO_DATA_DLY[l];
                      else if (|(~PIO_IN[l] & PIO_DATA_DLY[l]) && (NEGE_EDGE_IRQ == 1))
			EDGE_CAPTURE[l] <= #UDLY ~PIO_IN[l] & PIO_DATA_DLY[l];
                      else if (|(PIO_IN[l] & ~PIO_DATA_DLY[l]) && (EITHER_EDGE_IRQ == 1))
			EDGE_CAPTURE[l] <= #UDLY PIO_IN[l] & ~PIO_DATA_DLY[l];
                      else if (|(~PIO_IN[l] & PIO_DATA_DLY[l]) && (EITHER_EDGE_IRQ == 1))
			EDGE_CAPTURE[l] <= #UDLY ~PIO_IN[l] & PIO_DATA_DLY[l];
                      else if ( (~IRQ_MASK[l]) & GPIO_DAT_I_switch[l-24] & IRQ_MASK_WR_EN && GPIO_SEL_I_switch[3])
			// interrupt mask is being set, so clear edge-capture
			EDGE_CAPTURE[l] <= #UDLY 0;
                      else if (EDGE_CAP_WR_EN && GPIO_SEL_I_switch[3])
			// user's writing to the edge register, so update edge capture
			// register
			EDGE_CAPTURE[l] <= #UDLY EDGE_CAPTURE[l] & GPIO_DAT_I_switch[l];
		 end
	    end
	    
	 end // if (GPIO_WB_DAT_WIDTH == 32)
	 
         assign  IRQ_O = |(EDGE_CAPTURE[DATA_WIDTH-1:0] & IRQ_MASK[DATA_WIDTH-1:0]);
	 
      end // if ((IRQ_MODE == 1) && (INPUT_PORTS_ONLY == 1) && (EDGE == 1))
			   
      //----------------------------------
      //--BOTH_INPUT_AND_OUTPUT MODE IRQ
      //----------------------------------
      else if  ((IRQ_MODE == 1) && (BOTH_INPUT_AND_OUTPUT == 1) && (LEVEL == 1)) begin

	 if (GPIO_WB_DAT_WIDTH == 8) begin
	    
	    genvar iitb_idx;
	    for (iitb_idx = 0; (iitb_idx < INPUT_WIDTH) && (iitb_idx < 8); iitb_idx = iitb_idx + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I)
		     IRQ_TEMP_BOTH[iitb_idx] <= #UDLY 0;
		   else if (IRQ_MASK_WR_EN_0)
		     IRQ_TEMP_BOTH[iitb_idx] <= #UDLY IRQ_TEMP_BOTH[iitb_idx] & GPIO_DAT_I_switch[iitb_idx];
		   else
		     IRQ_TEMP_BOTH[iitb_idx] <= #UDLY PIO_BOTH_IN[iitb_idx] & IRQ_MASK_BOTH[iitb_idx];
	      end 
	    if (INPUT_WIDTH > 8) begin
	       genvar jitb_idx;
	       for (jitb_idx = 8; (jitb_idx < INPUT_WIDTH) && (jitb_idx < 16); jitb_idx = jitb_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_TEMP_BOTH[jitb_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN_1)
			IRQ_TEMP_BOTH[jitb_idx] <= #UDLY IRQ_TEMP_BOTH[jitb_idx] & GPIO_DAT_I_switch[jitb_idx - 8];
		      else
			IRQ_TEMP_BOTH[jitb_idx] <= #UDLY PIO_BOTH_IN[jitb_idx] & IRQ_MASK_BOTH[jitb_idx];
		 end 
	    end
	    if (INPUT_WIDTH > 16) begin
	       genvar kitb_idx;
	       for (kitb_idx = 16; (kitb_idx < INPUT_WIDTH) && (kitb_idx < 24); kitb_idx = kitb_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_TEMP_BOTH[kitb_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN_2)
			IRQ_TEMP_BOTH[kitb_idx] <= #UDLY IRQ_TEMP_BOTH[kitb_idx] & GPIO_DAT_I_switch[kitb_idx - 16];
		      else
			IRQ_TEMP_BOTH[kitb_idx] <= #UDLY PIO_BOTH_IN[kitb_idx] & IRQ_MASK_BOTH[kitb_idx];
		 end 
	    end
	    if (INPUT_WIDTH > 24) begin
	       genvar litb_idx;
	       for (litb_idx = 24; (litb_idx < INPUT_WIDTH) && (litb_idx < 24); litb_idx = litb_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_TEMP_BOTH[litb_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN_3)
			IRQ_TEMP_BOTH[litb_idx] <= #UDLY IRQ_TEMP_BOTH[litb_idx] & GPIO_DAT_I_switch[litb_idx - 24];
		      else
			IRQ_TEMP_BOTH[litb_idx] <= #UDLY PIO_BOTH_IN[litb_idx] & IRQ_MASK_BOTH[litb_idx];
		 end 
	    end
	    
	 end // if (GPIO_WB_DAT_WIDTH == 8)
	 
	 else if (GPIO_WB_DAT_WIDTH == 32) begin
	    
	    genvar iitb_idx;
	    for (iitb_idx = 0; (iitb_idx < INPUT_WIDTH) && (iitb_idx < 8); iitb_idx = iitb_idx + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I)
		     IRQ_TEMP_BOTH[iitb_idx] <= #UDLY 0;
		   else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[0])
		     IRQ_TEMP_BOTH[iitb_idx] <= #UDLY IRQ_TEMP_BOTH[iitb_idx] & GPIO_DAT_I_switch[iitb_idx];
		   else
		     IRQ_TEMP_BOTH[iitb_idx] <= #UDLY PIO_BOTH_IN[iitb_idx] & IRQ_MASK_BOTH[iitb_idx];
	      end 
	    if (INPUT_WIDTH > 8) begin
	       genvar jitb_idx;
	       for (jitb_idx = 8; (jitb_idx < INPUT_WIDTH) && (jitb_idx < 16); jitb_idx = jitb_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_TEMP_BOTH[jitb_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[1])
			IRQ_TEMP_BOTH[jitb_idx] <= #UDLY IRQ_TEMP_BOTH[jitb_idx] & GPIO_DAT_I_switch[jitb_idx];
		      else
			IRQ_TEMP_BOTH[jitb_idx] <= #UDLY PIO_BOTH_IN[jitb_idx] & IRQ_MASK_BOTH[jitb_idx];
		 end 
	    end
	    if (INPUT_WIDTH > 16) begin
	       genvar kitb_idx;
	       for (kitb_idx = 16; (kitb_idx < INPUT_WIDTH) && (kitb_idx < 24); kitb_idx = kitb_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_TEMP_BOTH[kitb_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[2])
			IRQ_TEMP_BOTH[kitb_idx] <= #UDLY IRQ_TEMP_BOTH[kitb_idx] & GPIO_DAT_I_switch[kitb_idx];
		      else
			IRQ_TEMP_BOTH[kitb_idx] <= #UDLY PIO_BOTH_IN[kitb_idx] & IRQ_MASK_BOTH[kitb_idx];
		 end 
	    end
	    if (INPUT_WIDTH > 24) begin
	       genvar litb_idx;
	       for (litb_idx = 24; (litb_idx < INPUT_WIDTH) && (litb_idx < 24); litb_idx = litb_idx + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			IRQ_TEMP_BOTH[litb_idx] <= #UDLY 0;
		      else if (IRQ_MASK_WR_EN && GPIO_SEL_I_switch[3])
			IRQ_TEMP_BOTH[litb_idx] <= #UDLY IRQ_TEMP_BOTH[litb_idx] & GPIO_DAT_I_switch[litb_idx];
		      else
			IRQ_TEMP_BOTH[litb_idx] <= #UDLY PIO_BOTH_IN[litb_idx] & IRQ_MASK_BOTH[litb_idx];
		 end 
	    end
	    
	 end // if (GPIO_WB_DAT_WIDTH == 32)
	 
	 assign IRQ_O = |IRQ_TEMP_BOTH;
	 
      end // if ((IRQ_MODE == 1) && (BOTH_INPUT_AND_OUTPUT == 1) && (LEVEL == 1))
      
      // edge mode IRQ
      else if ((IRQ_MODE == 1) && (BOTH_INPUT_AND_OUTPUT == 1) && (EDGE == 1)) begin
	 
         always @(posedge CLK_I or posedge RST_I)
           if (RST_I)
             PIO_DATA_DLY_BOTH <= #UDLY 0;
           else
             PIO_DATA_DLY_BOTH <= PIO_BOTH_IN;
	 
         // edge-capture register bits are treated as individual bits.
	 if (GPIO_WB_DAT_WIDTH == 8) begin
	    
	    genvar i_both;
	    for (i_both = 0; (i_both < INPUT_WIDTH) && (i_both < 8); i_both = i_both + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I)
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY 0;
		   else if (|(PIO_BOTH_IN[i_both] & ~PIO_DATA_DLY_BOTH[i_both]) && POSE_EDGE_IRQ == 1)
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY PIO_BOTH_IN[i_both] & ~PIO_DATA_DLY_BOTH[i_both];
		   else if (|(~PIO_BOTH_IN[i_both] & PIO_DATA_DLY_BOTH[i_both]) &&  NEGE_EDGE_IRQ == 1)
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY ~PIO_BOTH_IN[i_both] & PIO_DATA_DLY_BOTH[i_both];
		   else if (|(PIO_BOTH_IN[i_both] & ~PIO_DATA_DLY_BOTH[i_both]) && EITHER_EDGE_IRQ == 1)
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY PIO_BOTH_IN[i_both] & ~PIO_DATA_DLY_BOTH[i_both];
		   else if (|(~PIO_BOTH_IN[i_both] & PIO_DATA_DLY_BOTH[i_both]) && EITHER_EDGE_IRQ == 1)
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY ~PIO_BOTH_IN[i_both] & PIO_DATA_DLY_BOTH[i_both];
		   else if ( (~IRQ_MASK_BOTH[i_both]) & GPIO_DAT_I_switch[i_both] & IRQ_MASK_WR_EN_0 )
		     // interrupt mask is being set, so clear edge-capture
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY 0;
		   else if (EDGE_CAP_WR_EN_0)
		     // user's writing to the edge register, so update edge capture
		     // register
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY EDGE_CAPTURE_BOTH[i_both] & GPIO_DAT_I_switch[i_both];
	      end
	    if (INPUT_WIDTH > 8) begin
	       genvar j_both;
	       for (j_both = 8; (j_both < INPUT_WIDTH) && (j_both < 16); j_both = j_both + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY 0;
		      else if (|(PIO_BOTH_IN[j_both] & ~PIO_DATA_DLY_BOTH[j_both]) && POSE_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY PIO_BOTH_IN[j_both] & ~PIO_DATA_DLY_BOTH[j_both];
		      else if (|(~PIO_BOTH_IN[j_both] & PIO_DATA_DLY_BOTH[j_both]) &&  NEGE_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY ~PIO_BOTH_IN[j_both] & PIO_DATA_DLY_BOTH[j_both];
		      else if (|(PIO_BOTH_IN[j_both] & ~PIO_DATA_DLY_BOTH[j_both]) && EITHER_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY PIO_BOTH_IN[j_both] & ~PIO_DATA_DLY_BOTH[j_both];
		      else if (|(~PIO_BOTH_IN[j_both] & PIO_DATA_DLY_BOTH[j_both]) && EITHER_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY ~PIO_BOTH_IN[j_both] & PIO_DATA_DLY_BOTH[j_both];
		      else if ( (~IRQ_MASK_BOTH[j_both]) & GPIO_DAT_I_switch[j_both-8] & IRQ_MASK_WR_EN_1 )
			// interrupt mask is being set, so clear edge-capture
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY 0;
		      else if (EDGE_CAP_WR_EN_1)
			// user's writing to the edge register, so update edge capture
			// register
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY EDGE_CAPTURE_BOTH[j_both] & GPIO_DAT_I_switch[j_both-8];
		 end
	    end
	    if (INPUT_WIDTH > 16) begin
	       genvar k_both;
	       for (k_both = 16; (k_both < INPUT_WIDTH) && (k_both < 24); k_both = k_both + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY 0;
		      else if (|(PIO_BOTH_IN[k_both] & ~PIO_DATA_DLY_BOTH[k_both]) && POSE_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY PIO_BOTH_IN[k_both] & ~PIO_DATA_DLY_BOTH[k_both];
		      else if (|(~PIO_BOTH_IN[k_both] & PIO_DATA_DLY_BOTH[k_both]) &&  NEGE_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY ~PIO_BOTH_IN[k_both] & PIO_DATA_DLY_BOTH[k_both];
		      else if (|(PIO_BOTH_IN[k_both] & ~PIO_DATA_DLY_BOTH[k_both]) && EITHER_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY PIO_BOTH_IN[k_both] & ~PIO_DATA_DLY_BOTH[k_both];
		      else if (|(~PIO_BOTH_IN[k_both] & PIO_DATA_DLY_BOTH[k_both]) && EITHER_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY ~PIO_BOTH_IN[k_both] & PIO_DATA_DLY_BOTH[k_both];
		      else if ( (~IRQ_MASK_BOTH[k_both]) & GPIO_DAT_I_switch[k_both-16] & IRQ_MASK_WR_EN_2 )
			// interrupt mask is being set, so clear edge-capture
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY 0;
		      else if (EDGE_CAP_WR_EN_2)
			// user's writing to the edge register, so update edge capture
			// register
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY EDGE_CAPTURE_BOTH[k_both] & GPIO_DAT_I_switch[k_both-16];
		 end
	    end
	    if (INPUT_WIDTH > 24) begin
	       genvar l_both;
	       for (l_both = 24; (l_both < INPUT_WIDTH) && (l_both < 32); l_both = l_both + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY 0;
		      else if (|(PIO_BOTH_IN[l_both] & ~PIO_DATA_DLY_BOTH[l_both]) && POSE_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY PIO_BOTH_IN[l_both] & ~PIO_DATA_DLY_BOTH[l_both];
		      else if (|(~PIO_BOTH_IN[l_both] & PIO_DATA_DLY_BOTH[l_both]) &&  NEGE_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY ~PIO_BOTH_IN[l_both] & PIO_DATA_DLY_BOTH[l_both];
		      else if (|(PIO_BOTH_IN[l_both] & ~PIO_DATA_DLY_BOTH[l_both]) && EITHER_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY PIO_BOTH_IN[l_both] & ~PIO_DATA_DLY_BOTH[l_both];
		      else if (|(~PIO_BOTH_IN[l_both] & PIO_DATA_DLY_BOTH[l_both]) && EITHER_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY ~PIO_BOTH_IN[l_both] & PIO_DATA_DLY_BOTH[l_both];
		      else if ( (~IRQ_MASK_BOTH[l_both]) & GPIO_DAT_I_switch[l_both-24] & IRQ_MASK_WR_EN_3 )
			// interrupt mask is being set, so clear edge-capture
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY 0;
		      else if (EDGE_CAP_WR_EN_3)
			// user's writing to the edge register, so update edge capture
			// register
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY EDGE_CAPTURE_BOTH[l_both] & GPIO_DAT_I_switch[l_both-24];
		 end
	    end
	    
	 end // if (GPIO_WB_DAT_WIDTH == 8)
	 else if (GPIO_WB_DAT_WIDTH == 32) begin
	    
	    genvar i_both;
	    for (i_both = 0; (i_both < INPUT_WIDTH) && (i_both < 8); i_both = i_both + 1)
	      begin
		 always @(posedge CLK_I or posedge RST_I)
		   if (RST_I)
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY 0;
		   else if (|(PIO_BOTH_IN[i_both] & ~PIO_DATA_DLY_BOTH[i_both]) && POSE_EDGE_IRQ == 1)
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY PIO_BOTH_IN[i_both] & ~PIO_DATA_DLY_BOTH[i_both];
		   else if (|(~PIO_BOTH_IN[i_both] & PIO_DATA_DLY_BOTH[i_both]) &&  NEGE_EDGE_IRQ == 1)
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY ~PIO_BOTH_IN[i_both] & PIO_DATA_DLY_BOTH[i_both];
		   else if (|(PIO_BOTH_IN[i_both] & ~PIO_DATA_DLY_BOTH[i_both]) && EITHER_EDGE_IRQ == 1)
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY PIO_BOTH_IN[i_both] & ~PIO_DATA_DLY_BOTH[i_both];
		   else if (|(~PIO_BOTH_IN[i_both] & PIO_DATA_DLY_BOTH[i_both]) && EITHER_EDGE_IRQ == 1)
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY ~PIO_BOTH_IN[i_both] & PIO_DATA_DLY_BOTH[i_both];
		   else if ( (~IRQ_MASK_BOTH[i_both]) & GPIO_DAT_I_switch[i_both] & IRQ_MASK_WR_EN && GPIO_SEL_I_switch[0])
		     // interrupt mask is being set, so clear edge-capture
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY 0;
		   else if (EDGE_CAP_WR_EN && GPIO_SEL_I_switch[0])
		     // user's writing to the edge register, so update edge capture
		     // register
		     EDGE_CAPTURE_BOTH[i_both] <= #UDLY EDGE_CAPTURE_BOTH[i_both] & GPIO_DAT_I_switch[i_both];
	      end
	    if (INPUT_WIDTH > 8) begin
	       genvar j_both;
	       for (j_both = 8; (j_both < INPUT_WIDTH) && (j_both < 16); j_both = j_both + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY 0;
		      else if (|(PIO_BOTH_IN[j_both] & ~PIO_DATA_DLY_BOTH[j_both]) && POSE_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY PIO_BOTH_IN[j_both] & ~PIO_DATA_DLY_BOTH[j_both];
		      else if (|(~PIO_BOTH_IN[j_both] & PIO_DATA_DLY_BOTH[j_both]) &&  NEGE_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY ~PIO_BOTH_IN[j_both] & PIO_DATA_DLY_BOTH[j_both];
		      else if (|(PIO_BOTH_IN[j_both] & ~PIO_DATA_DLY_BOTH[j_both]) && EITHER_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY PIO_BOTH_IN[j_both] & ~PIO_DATA_DLY_BOTH[j_both];
		      else if (|(~PIO_BOTH_IN[j_both] & PIO_DATA_DLY_BOTH[j_both]) && EITHER_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY ~PIO_BOTH_IN[j_both] & PIO_DATA_DLY_BOTH[j_both];
		      else if ( (~IRQ_MASK_BOTH[j_both]) & GPIO_DAT_I_switch[j_both-8] & IRQ_MASK_WR_EN && GPIO_SEL_I_switch[1])
			// interrupt mask is being set, so clear edge-capture
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY 0;
		      else if (EDGE_CAP_WR_EN && GPIO_SEL_I_switch[1])
			// user's writing to the edge register, so update edge capture
			// register
			EDGE_CAPTURE_BOTH[j_both] <= #UDLY EDGE_CAPTURE_BOTH[j_both] & GPIO_DAT_I_switch[j_both];
		 end
	    end
	    if (INPUT_WIDTH > 16) begin
	       genvar k_both;
	       for (k_both = 16; (k_both < INPUT_WIDTH) && (k_both < 24); k_both = k_both + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY 0;
		      else if (|(PIO_BOTH_IN[k_both] & ~PIO_DATA_DLY_BOTH[k_both]) && POSE_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY PIO_BOTH_IN[k_both] & ~PIO_DATA_DLY_BOTH[k_both];
		      else if (|(~PIO_BOTH_IN[k_both] & PIO_DATA_DLY_BOTH[k_both]) &&  NEGE_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY ~PIO_BOTH_IN[k_both] & PIO_DATA_DLY_BOTH[k_both];
		      else if (|(PIO_BOTH_IN[k_both] & ~PIO_DATA_DLY_BOTH[k_both]) && EITHER_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY PIO_BOTH_IN[k_both] & ~PIO_DATA_DLY_BOTH[k_both];
		      else if (|(~PIO_BOTH_IN[k_both] & PIO_DATA_DLY_BOTH[k_both]) && EITHER_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY ~PIO_BOTH_IN[k_both] & PIO_DATA_DLY_BOTH[k_both];
		      else if ( (~IRQ_MASK_BOTH[k_both]) & GPIO_DAT_I_switch[k_both-16] & IRQ_MASK_WR_EN && GPIO_SEL_I_switch[2])
			// interrupt mask is being set, so clear edge-capture
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY 0;
		      else if (EDGE_CAP_WR_EN && GPIO_SEL_I_switch[2])
			// user's writing to the edge register, so update edge capture
			// register
			EDGE_CAPTURE_BOTH[k_both] <= #UDLY EDGE_CAPTURE_BOTH[k_both] & GPIO_DAT_I_switch[k_both];
		 end
	    end
	    if (INPUT_WIDTH > 24) begin
	       genvar l_both;
	       for (l_both = 24; (l_both < INPUT_WIDTH) && (l_both < 32); l_both = l_both + 1)
		 begin
		    always @(posedge CLK_I or posedge RST_I)
		      if (RST_I)
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY 0;
		      else if (|(PIO_BOTH_IN[l_both] & ~PIO_DATA_DLY_BOTH[l_both]) && POSE_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY PIO_BOTH_IN[l_both] & ~PIO_DATA_DLY_BOTH[l_both];
		      else if (|(~PIO_BOTH_IN[l_both] & PIO_DATA_DLY_BOTH[l_both]) &&  NEGE_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY ~PIO_BOTH_IN[l_both] & PIO_DATA_DLY_BOTH[l_both];
		      else if (|(PIO_BOTH_IN[l_both] & ~PIO_DATA_DLY_BOTH[l_both]) && EITHER_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY PIO_BOTH_IN[l_both] & ~PIO_DATA_DLY_BOTH[l_both];
		      else if (|(~PIO_BOTH_IN[l_both] & PIO_DATA_DLY_BOTH[l_both]) && EITHER_EDGE_IRQ == 1)
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY ~PIO_BOTH_IN[l_both] & PIO_DATA_DLY_BOTH[l_both];
		      else if ( (~IRQ_MASK_BOTH[l_both]) & GPIO_DAT_I_switch[l_both-24] & IRQ_MASK_WR_EN && GPIO_SEL_I_switch[3])
			// interrupt mask is being set, so clear edge-capture
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY 0;
		      else if (EDGE_CAP_WR_EN && GPIO_SEL_I_switch[3])
			// user's writing to the edge register, so update edge capture
			// register
			EDGE_CAPTURE_BOTH[l_both] <= #UDLY EDGE_CAPTURE_BOTH[l_both] & GPIO_DAT_I_switch[l_both];
		 end
	    end
	    
	 end // if (GPIO_WB_DAT_WIDTH == 32)
	 
         assign   IRQ_O = |(EDGE_CAPTURE_BOTH & IRQ_MASK_BOTH);

      end // if ((IRQ_MODE == 1) && (BOTH_INPUT_AND_OUTPUT == 1) && (EDGE == 1))
      
      else if (IRQ_MODE == 1 && TRISTATE_PORTS == 1) begin
	 
         assign  IRQ_O = |IRQ_TRI_TEMP; 
      end
      
      else begin
	 
         assign  IRQ_O = 1'b0;
      end
      
   endgenerate
   

endmodule
`endif // GPIO_V
