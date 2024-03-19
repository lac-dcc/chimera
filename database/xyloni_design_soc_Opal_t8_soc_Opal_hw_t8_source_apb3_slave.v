/////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2013-2020 Efinix Inc. All rights reserved.
//
// Description:
// A simple apb3 slave wrapper example design to interface with soc apb3
// signals
//
// Language:  Verilog 2001
//
// ------------------------------------------------------------------------------
// REVISION:
//  $Snapshot: $
//  $Id:$
//
// History:
// 1.0 Initial Release. 
/////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module apb3_slave #(
	// user parameter starts here
	//
	parameter	ADDR_WIDTH	= 12,
	parameter	DATA_WIDTH	= 31,
	parameter	NUM_REG		= 4
) (
	// user logic starts here
	output [1:0] 			apb3LED,
	output				apb3Interrupt,
	//
	input				clk,
	input				resetn,
	input	[ADDR_WIDTH-1:0]	PADDR,
	input				PSEL,
	input				PENABLE,
	output				PREADY,
	input				PWRITE,
	input 	[DATA_WIDTH-1:0] 	PWDATA,
	output	[DATA_WIDTH-1:0] 	PRDATA,
	output				PSLVERROR

);


///////////////////////////////////////////////////////////////////////////////

localparam [1:0]	IDLE   = 2'b00,
			SETUP  = 2'b01,
			ACCESS = 2'b10;

reg [1:0] 		busState, 
			busNext;
reg [DATA_WIDTH-1:0]	slaveReg [0:NUM_REG-1];
reg [DATA_WIDTH-1:0]	slaveRegOut;
reg			slaveReady;
wire	 		actWrite,
			actRead;
integer			byteIndex;


///////////////////////////////////////////////////////////////////////////////

	always@(posedge clk or negedge resetn)
	begin
		if(!resetn) 
			busState <= IDLE; 
		else
			busState <= busNext; 
	end

	always@(*)
	begin
		busNext = busState;

		case(busState)
			IDLE:
			begin
				if(PSEL && !PENABLE)
					busNext = SETUP;
				else
					busNext = IDLE;
			end
			SETUP:
			begin
				if(PENABLE)
					busNext = ACCESS;
				else
					busNext = IDLE;
			end
			ACCESS:
			begin
				if(PENABLE)
					busNext = ACCESS;
				else
					busNext = IDLE;
			end
			default:
			begin
				busNext = IDLE;
			end
		endcase
	end


	assign actWrite = PWRITE  & (busNext == ACCESS);
	assign actRead  = !PWRITE & (busNext == SETUP);
	assign PSLVERROR = 1'b0; //FIXME
	assign PRDATA = slaveRegOut;
	assign PREADY = slaveReady;

	always@ (posedge clk)
	begin
		slaveReady <= (busState == IDLE);
	end

	always@ (posedge clk or negedge resetn)
	begin
		if(!resetn)
			for(byteIndex = 0; byteIndex < NUM_REG; byteIndex = byteIndex + 1)
			slaveReg[byteIndex] <= {{DATA_WIDTH}{1'b0}};
		else begin
			for(byteIndex = 0; byteIndex < NUM_REG; byteIndex = byteIndex + 1)
			if(actWrite && PADDR[3:0] == (byteIndex*4))
				slaveReg[byteIndex] <= PWDATA;
			else
				slaveReg[byteIndex] <= slaveReg[byteIndex];
				
		end

	end

	always@ (posedge clk or negedge resetn)
	begin
		if(!resetn)
			slaveRegOut <= {{DATA_WIDTH}{1'b0}};
		else begin
			if(actRead)
				slaveRegOut <= slaveReg[PADDR[7:2]];
			else
				slaveRegOut <= slaveRegOut;
				
		end

	end

	//custom logic starts here
	assign apb3LED 		= slaveReg[0][1:0];
	assign apb3Interrupt 	= slaveReg[0][2];
	//
endmodule

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2020 Efinix Inc. All rights reserved.
//
// This   document  contains  proprietary information  which   is
// protected by  copyright. All rights  are reserved.  This notice
// refers to original work by Efinix, Inc. which may be derivitive
// of other work distributed under license of the authors.  In the
// case of derivative work, nothing in this notice overrides the
// original author's license agreement.  Where applicable, the 
// original license agreement is included in it's original 
// unmodified form immediately below this header.
//
// WARRANTY DISCLAIMER.  
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND 
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH 
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES, 
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR 
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED 
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.
//
// LIMITATION OF LIABILITY.  
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY 
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT 
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY 
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT, 
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY 
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF 
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR 
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN 
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER 
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR 
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT 
//     APPLY TO LICENSEE.
//
/////////////////////////////////////////////////////////////////////////////
/// Author        : Karn Ming, Lau <kmlau@efinixinc.com>
/// Module        : apb3_slave.v
/// Date Created  : 17-04-2020
/// Last Modified : Sat 25 Apr 2020 11:32:11 AM +08
///////////////////////////////////////////////////////////////////////////////
