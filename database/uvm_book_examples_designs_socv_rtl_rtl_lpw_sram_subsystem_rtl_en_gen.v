// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : en_gen.v
//Title       : 
//Created     : 1999
//Description : Generates Chip Enable signals(Cen) and Write enables for a Voltage Island.
//Notes       : 
//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

module en_gen(
       //inputs
        haddr,
        haddr_reg,
	     hsize,
	     hsize_reg,
        rd_aphase,
        wr_dphase,
	     rd_dphase,
	     RW_conf_dphase,
       //Outputs
	     cen,
	     wen,
	     SRAM_addr
);

//------------Ports----------------------------------
input [31:0] 	haddr, haddr_reg;
input  [2:0] 	hsize, hsize_reg;
input 		   wr_dphase;// 1 => Data phase write access to this voltage island
input 		   rd_aphase;// 1 => Data phase write access to this voltage island
input 		   rd_dphase;
input		      RW_conf_dphase;

output [31:0] 	SRAM_addr;// Address sent to SRAMs and used for creation of CENs
output 		   cen;	// CENs for the 4 SRAM blocks in each voltage island
output [3:0] 	wen;  // Byte lane WEN signals

reg    [3:0] 	wen;  

wire  [2:0] 	SRAM_size; 	// Size for the Byte Lane WEN generation
reg 		cen_b0_raw, cen_b1_raw, cen_b2_raw, cen_b3_raw; 	// CENs just based of the address 
wire active_access;


// Use the stored address if this is the data phase of a write
// or the data phase of a read that had a RWconflict
// Else assuming that it is a read, use the haddr
assign SRAM_addr = (wr_dphase | (rd_dphase & RW_conf_dphase)) ? haddr_reg : haddr;
assign SRAM_size = (wr_dphase | (rd_dphase & RW_conf_dphase)) ? hsize_reg : hsize;

// Signal indicating valid access to this group - 
// either data phase of Wr or 
// Dphase of a read that had a RWconflict or
// addr phase of Rd to this group
assign active_access = wr_dphase | (rd_dphase & RW_conf_dphase) | rd_aphase;
assign cen =  ~active_access;	// CEN = 1 when not active access


always @(SRAM_size or SRAM_addr or wr_dphase)
begin
`ifdef SYSTEM_BIG_ENDIAN
  casex ({wr_dphase, SRAM_size, SRAM_addr[1:0]})
    6'b100000 : wen = 4'b0111;
    6'b100001 : wen = 4'b1011;
    6'b100010 : wen = 4'b1101;
    6'b100011 : wen = 4'b1110;
    6'b10010x : wen = 4'b0011;
    6'b10011x : wen = 4'b1100;
    6'b1010xx : wen = 4'b0000;
    default   : wen = 4'b1111;
  endcase
`else
  casex ({wr_dphase, SRAM_size, SRAM_addr[1:0]})
    6'b100000 : wen = 4'b1110;
    6'b100001 : wen = 4'b1101;
    6'b100010 : wen = 4'b1011;
    6'b100011 : wen = 4'b0111;
    6'b10010x : wen = 4'b1100;
    6'b10011x : wen = 4'b0011;
    6'b1010xx : wen = 4'b0000;
    default   : wen = 4'b1111;
  endcase
`endif
end

endmodule //module en_gen

