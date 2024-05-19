// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  WISHBONE rev.B2 compliant VGA/LCD Core; Dual Clocked Fifo  ////
////                                                             ////
////                                                             ////
////  Author: Richard Herveille                                  ////
////          richard@asics.ws                                   ////
////          www.asics.ws                                       ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/projects/vga_lcd ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2001 Richard Herveille                        ////
////                    richard@asics.ws                         ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: vga_fifo_dc.v,v 1.6 2003-08-01 11:46:38 rherveille Exp $
//
//  $Date: 2003-08-01 11:46:38 $
//  $Revision: 1.6 $
//  $Author: rherveille $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.5  2003/05/07 09:48:54  rherveille
//               Fixed some Wishbone RevB.3 related bugs.
//               Changed layout of the core. Blocks are located more logically now.
//               Started work on a dual clocked/double edge 12bit output. Commonly used by external devices like DVI transmitters.
//
//               Revision 1.4  2002/01/28 03:47:16  rherveille
//               Changed counter-library.
//               Changed vga-core.
//               Added 32bpp mode.
//

/*

  Dual clock FIFO.

  Uses gray codes to move from one clock domain to the other.

  Flags are synchronous to the related clock domain;
  - empty: synchronous to read_clock
  - full : synchronous to write_clock

  CLR is available in both clock-domains.
  Asserting any clr signal resets the entire FIFO.
  When crossing clock domains the clears are synchronized.
  Therefore one clock domain can enter or leave the reset state before the other.
*/

module vga_fifo_dc (rclk, wclk, rclr, wclr, wreq, d, rreq, q, empty, full);

	// parameters
	parameter AWIDTH = 7;  //128 entries
	parameter DWIDTH = 16; //16bit databus

	// inputs & outputs
	input rclk;             // read clock
	input wclk;             // write clock
	input rclr;             // active high synchronous clear, synchronous to read clock
	input wclr;             // active high synchronous clear, synchronous to write clock
	input wreq;             // write request
	input [DWIDTH -1:0] d;  // data input
	input rreq;             // read request
	output [DWIDTH -1:0] q; // data output

	output empty;           // FIFO is empty, synchronous to read clock
	reg empty;
	output full;            // FIFO is full, synchronous to write clock
	reg full;

	// variable declarations
	reg rrst, wrst, srclr, ssrclr, swclr, sswclr;
	reg [AWIDTH -1:0] rptr, wptr, rptr_gray, wptr_gray;

	//
	// module body
	//


	function [AWIDTH:1] bin2gray;
		input [AWIDTH:1] bin;
		integer n;
	begin
		for (n=1; n<AWIDTH; n=n+1)
			bin2gray[n] = bin[n+1] ^ bin[n];

		bin2gray[AWIDTH] = bin[AWIDTH];
	end
	endfunction

	function [AWIDTH:1] gray2bin;
		input [AWIDTH:1] gray;
	begin
		// same logic as bin2gray
		gray2bin = bin2gray(gray);
	end
	endfunction

	//
	// Pointers
	//

	// generate synchronized resets
	always @(posedge rclk)
	begin
	    swclr  <= #1 wclr;
	    sswclr <= #1 swclr;
	    rrst   <= #1 rclr | sswclr;
	end

	always @(posedge wclk)
	begin
	    srclr  <= #1 rclr;
	    ssrclr <= #1 srclr;
	    wrst   <= #1 wclr | ssrclr;
	end


	// read pointer
	always @(posedge rclk)
	  if (rrst) begin
	      rptr      <= #1 0;
	      rptr_gray <= #1 0;
	  end else if (rreq) begin
	      rptr      <= #1 rptr +1'h1;
	      rptr_gray <= #1 bin2gray(rptr +1'h1);
	  end

	// write pointer
	always @(posedge wclk)
	  if (wrst) begin
	      wptr      <= #1 0;
	      wptr_gray <= #1 0;
	  end else if (wreq) begin
	      wptr      <= #1 wptr +1'h1;
	      wptr_gray <= #1 bin2gray(wptr +1'h1);
	  end

	//
	// status flags
	//
	reg [AWIDTH-1:0] srptr_gray, ssrptr_gray;
	reg [AWIDTH-1:0] swptr_gray, sswptr_gray;

	// from one clock domain, to the other
	always @(posedge rclk)
	begin
	    swptr_gray  <= #1 wptr_gray;
	    sswptr_gray <= #1 swptr_gray;
	end

	always @(posedge wclk)
	begin
	    srptr_gray  <= #1 rptr_gray;
	    ssrptr_gray <= #1 srptr_gray;
	end

	// EMPTY
	// WC: wptr did not increase
	always @(posedge rclk)
	  if (rrst)
	    empty <= #1 1'b1;
	  else if (rreq)
	    empty <= #1 bin2gray(rptr +1'h1) == sswptr_gray;
	  else
	    empty <= #1 empty & (rptr_gray == sswptr_gray);


	// FULL
	// WC: rptr did not increase
	always @(posedge wclk)
	  if (wrst)
	    full <= #1 1'b0;
	  else if (wreq)
	    full <= #1 bin2gray(wptr +2'h2) == ssrptr_gray;
	  else
	    full <= #1 full & (bin2gray(wptr + 2'h1) == ssrptr_gray);


	// hookup generic dual ported memory
	generic_dpram #(AWIDTH, DWIDTH) fifo_dc_mem(
		.rclk(rclk),
		.rrst(1'b0),
		.rce(1'b1),
		.oe(1'b1),
		.raddr(rptr),
		.dout(q),
		.wclk(wclk),
		.wrst(1'b0),
		.wce(1'b1),
		.we(wreq),
		.waddr(wptr),
		.di(d)
	);

endmodule


//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Generic Dual-Port Synchronous RAM                           ////
////                                                              ////
////  This file is part of memory library available from          ////
////  http://www.opencores.org/cvsweb.shtml/generic_memories/     ////
////                                                              ////
////  Description                                                 ////
////  This block is a wrapper with common dual-port               ////
////  synchronous memory interface for different                  ////
////  types of ASIC and FPGA RAMs. Beside universal memory        ////
////  interface it also provides behavioral model of generic      ////
////  dual-port synchronous RAM.                                  ////
////  It also contains a fully synthesizeable model for FPGAs.    ////
////  It should be used in all OPENCORES designs that want to be  ////
////  portable accross different target technologies and          ////
////  independent of target memory.                               ////
////                                                              ////
////  Supported ASIC RAMs are:                                    ////
////  - Artisan Dual-Port Sync RAM                                ////
////  - Avant! Two-Port Sync RAM (*)                              ////
////  - Virage 2-port Sync RAM                                    ////
////                                                              ////
////  Supported FPGA RAMs are:                                    ////
////  - Generic FPGA (VENDOR_FPGA)                                ////
////    Tested RAMs: Altera, Xilinx                               ////
////    Synthesis tools: LeonardoSpectrum, Synplicity             ////
////  - Xilinx (VENDOR_XILINX)                                    ////
////  - Altera (VENDOR_ALTERA)                                    ////
////                                                              ////
////  To Do:                                                      ////
////   - fix Avant!                                               ////
////   - add additional RAMs (VS etc)                             ////
////                                                              ////
////  Author(s):                                                  ////
////      - Richard Herveille, richard@asics.ws                   ////
////      - Damjan Lampret, lampret@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.4  2002/09/28 08:18:52  rherveille
// Changed synthesizeable FPGA memory implementation.
// Fixed some issues with Xilinx BlockRAM
//
// Revision 1.3  2001/11/09 00:34:18  samg
// minor changes: unified with all common rams
//
// Revision 1.2  2001/11/08 19:11:31  samg
// added valid checks to behvioral model
//
// Revision 1.1.1.1  2001/09/14 09:57:10  rherveille
// Major cleanup.
// Files are now compliant to Altera & Xilinx memories.
// Memories are now compatible, i.e. drop-in replacements.
// Added synthesizeable generic FPGA description.
// Created "generic_memories" cvs entry.
//
// Revision 1.1.1.2  2001/08/21 13:09:27  damjan
// *** empty log message ***
//
// Revision 1.1  2001/08/20 18:23:20  damjan
// Initial revision
//
// Revision 1.1  2001/08/09 13:39:33  lampret
// Major clean-up.
//
// Revision 1.2  2001/07/30 05:38:02  lampret
// Adding empty directories required by HDL coding guidelines
//
//

`define VENDOR_FPGA
module generic_dpram(
	// Generic synchronous dual-port RAM interface
	rclk, rrst, rce, oe, raddr, dout,
	wclk, wrst, wce, we, waddr, di
);

	//
	// Default address and data buses width
	//
	parameter aw = 5;  // number of bits in address-bus
	parameter dw = 16; // number of bits in data-bus

	//
	// Generic synchronous double-port RAM interface
	//
	// read port
	input           rclk;  // read clock, rising edge trigger
	input           rrst;  // read port reset, active high
	input           rce;   // read port chip enable, active high
	input           oe;	   // output enable, active high
	input  [aw-1:0] raddr; // read address
	output [dw-1:0] dout;    // data output

	// write port
	input          wclk;  // write clock, rising edge trigger
	input          wrst;  // write port reset, active high
	input          wce;   // write port chip enable, active high
	input          we;    // write enable, active high
	input [aw-1:0] waddr; // write address
	input [dw-1:0] di;    // data input

	//
	// Module body
	//

	//
	// Instantiation synthesizeable FPGA memory
	//
	// This code has been tested using LeonardoSpectrum and Synplicity.
	// The code correctly instantiates Altera EABs and Xilinx BlockRAMs.
	//

	// NOTE:
	// 'synthesis syn_ramstyle="block_ram"' is a Synplify attribute.
	// It instructs Synplify to map to BlockRAMs instead of the default SelectRAMs

	reg [dw-1:0] mem [(1<<aw) -1:0] /* synthesis syn_ramstyle="block_ram" */;
	reg [aw-1:0] ra;                // register read address

	// read operation
	always @(posedge rclk)
	  if (rce)
	    ra <= #1 raddr;

    assign dout = mem[ra];

	// write operation
	always @(posedge wclk)
		if (we && wce)
			mem[waddr] <= #1 di;

endmodule


module smallfifo16(input rst,
		 
		   input         clk_in,
		   input [15:0]  fifo_in,
		   input         fifo_en,

		   output        fifo_full,

		   input         clk_out,
		   output [15:0] fifo_out,
		   output        fifo_empty,
		   input         fifo_rd);


   vga_fifo_dc#(.AWIDTH(4),.DWIDTH(16)) 
   fifo0(.rclk (clk_out),
         .wclk (clk_in),
         .rclr (~rst),
         .wclr (~rst),
         .wreq (fifo_en),
         .d (fifo_in),
         .rreq (fifo_rd),
         .q (fifo_out),
         .empty (fifo_empty),
         .full (fifo_full));
   
   
endmodule
