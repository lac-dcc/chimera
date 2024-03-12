//  --=====================================================================--
//  This confidential and proprietary software may be used only as
//  authorised by a licensing agreement from ARM Limited
//   (C) COPYRIGHT 2010 ARM Limited
//        ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorised
//  copies and copies may only be made to the extent permitted
//  by a licensing agreement from ARM Limited.
//
//  -------------------------------------------------------------------------
//  Version and Release Control Information:
//
//   File Revision       :
//
//   Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//  -------------------------------------------------------------------------
//
//
//  -------------------------------------------------------------------------
//  Purpose: Simple SPI master interface to FPGA
//  -------------------------------------------------------------------------
 
`timescale 1 ns/1 ps
module dcc_spi_axi (

  SSPRSTn,
  SSPCK,
  SSPDI,
  SSPDO
);

//-----------------------------------------------------------------------------
// port declarations
//-----------------------------------------------------------------------------
input       	SSPRSTn;
output      	SSPCK;
output      	SSPDI;
input       	SSPDO;


//-----------------------------------------------------------------------------
// Constants
//-----------------------------------------------------------------------------

// Store the serial in packet
// 112 bit packet: | Comand[7:0] | Address[39:0]| DataIn[31:0] | DataOut[31:0] 

// Comand
//  READ:      20
//  WRITE:     A0
//  CFG_READ:  40
//  CFG_WRITE: C0

//Write date from SPI
`define TEST_VECTOR0 112'hA000_0040_0004_AAAA_5555_0000_0000
`define TEST_VECTOR1 112'h2000_0040_0004_0000_0000_0000_0000
`define TEST_VECTOR2 112'hA000_0040_0004_AAAA_5555_0000_0000
`define TEST_VECTOR3 112'h2000_0040_0004_0000_0000_0000_0000
`define TEST_VECTOR4 112'hA000_0040_0004_AAAA_5555_0000_0000
`define TEST_VECTOR5 112'h2000_0040_0004_0000_0000_0000_0000
`define TEST_VECTOR6 112'hA000_0040_0004_AAAA_5555_0000_0000
`define TEST_VECTOR7 112'h2000_0040_0004_0000_0000_0000_0000

//`define TEST_VECTOR1 112'hA000_2100_0008_1111_1111_0000_0000
//`define TEST_VECTOR2 112'hA000_2100_000C_2222_2222_0000_0000
//`define TEST_VECTOR3 112'hA000_2100_0010_CCCC_CCCC_0000_0000

//Read data to SPI
//`define TEST_VECTOR5 112'h2000_2100_0008_0000_0000_0000_0000
//`define TEST_VECTOR6 112'h2000_2100_000C_0000_0000_0000_0000
//`define TEST_VECTOR7 112'h2000_2100_0010_0000_0000_0000_0000



//-----------------------------------------------------------------------------
// Wire declarations
//-----------------------------------------------------------------------------
reg [111:0] ShiftReg;
reg [3:0]   WordSel;
reg [31:0]  DataIn;

reg         clken;
reg [6:0]   cnt;

reg         SSPDI_reg;
//-----------------------------------------------------------------------------
// Main body of code
//-----------------------------------------------------------------------------

// ======================
// SSPCLK Generator
// ======================

reg iSSPCK;
reg SSPRSTn_i;

initial
	iSSPCK = 1'b0;

always
  begin
     #50
	iSSPCK = ~iSSPCK;  //10MHz
  end // always begin


// Synchronise reset to clock.
always @ (posedge iSSPCK)
begin
	SSPRSTn_i <= SSPRSTn;
end

			  
			  
// ==============================================
// Shift Test Data out
// ==============================================

always @ (posedge iSSPCK or negedge SSPRSTn_i)
begin
  if (!SSPRSTn_i) begin
   	ShiftReg <= `TEST_VECTOR0;
  end else begin
    if (clken) begin
      ShiftReg[111:1] <= ShiftReg[110:0];
      ShiftReg[0]     <= SSPDO;
    end else begin
  	case (WordSel[2:0])
	    3'b000:  ShiftReg <= `TEST_VECTOR0;
	    3'b001:  ShiftReg <= `TEST_VECTOR1;
	    3'b010:  ShiftReg <= `TEST_VECTOR2;
	    3'b011:  ShiftReg <= `TEST_VECTOR3;
	    3'b100:  ShiftReg <= `TEST_VECTOR4;
	    3'b101:  ShiftReg <= `TEST_VECTOR5;
	    3'b110:  ShiftReg <= `TEST_VECTOR6;
	    3'b111:  ShiftReg <= `TEST_VECTOR7;
	    default: ShiftReg <= `TEST_VECTOR0;
	endcase
    end
  end
end


// =================================
// Clock Enable
// =================================

always @ (negedge iSSPCK or negedge SSPRSTn_i)
begin
  if (!SSPRSTn_i) begin
    cnt      <= 0;
    clken    <= 1'b0;
    WordSel  <= 0;
  end else begin
    if (WordSel<8) begin
      cnt <= cnt + 1;
      if(cnt  == 0)
        clken <= 1;
      else if (cnt == 112) begin
        clken <= 0;
        WordSel <= WordSel+1;
      end  
    end
  end
end

assign SSPCK = iSSPCK & clken;





always @ (negedge iSSPCK or negedge SSPRSTn_i)
begin
  if (!SSPRSTn_i)
   SSPDI_reg <= 1'b0;
  else
   SSPDI_reg <=  ShiftReg[111]; //1bits at a time
end

assign SSPDI = SSPDI_reg;

always @(negedge iSSPCK or negedge SSPRSTn_i)
begin
  if (!SSPRSTn_i) begin
    DataIn     <= {32{1'b0}};
  end
  else begin
    if (cnt == 112)
      	DataIn <= ShiftReg[31:0];
  end
end




endmodule