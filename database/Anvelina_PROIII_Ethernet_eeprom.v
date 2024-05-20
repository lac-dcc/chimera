// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

//
//  HPSDR - High Performance Software Defined Radio
//
//  Metis code. 
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


//  Metis code copyright 2010, 2011, 2012, 2013 Alex Shovkoplyas, VE3NEA.


//-----------------------------------------------------------------------------
// read static ip and mac from eeprom, write static ip 
//-----------------------------------------------------------------------------
module eeprom (
  //control
  input clock,
  input rd_request,
  input wr_request,
  output ready,
  
  //data
  output reg [47:0] mac,
  output reg [31:0] ip,
  output reg IP_write_done,
  input [31:0] ip_to_write,
  
  //hardware pins
  output SCK,                  
  output SI,                   
  input  SO,                   
  output reg CS
);






//-----------------------------------------------------------------------------
//                      read and write bit sequences
//-----------------------------------------------------------------------------
localparam READ_CMD = 8'h03, WREN_CMD = 8'h06,  WRITE_CMD = 8'h02;
localparam IP_START_ADDR = 8'h00, MAC_START_ADDR = 8'hFA;

localparam HI_RD_BIT = 7'd95, HI_WR_BIT = 7'd56;
wire [HI_RD_BIT:0] rd_bits = {READ_CMD, MAC_START_ADDR, 80'bx};
wire [HI_WR_BIT:0] wr_bits = {WREN_CMD, 1'bx, WRITE_CMD, IP_START_ADDR, ip_to_write};
reg  [6:0] bit_no;  






//-----------------------------------------------------------------------------
//                             state machine
//-----------------------------------------------------------------------------
localparam ST_IDLE = 2'd0, ST_READING = 2'd1, ST_WRITING = 2'd2;  
reg[1:0] state = ST_IDLE; 


always @(negedge clock)  
  case (state)
    ST_IDLE:
      begin 
		IP_write_done <= 1'b0;	
      CS <= !(rd_request | wr_request);
      if (rd_request) begin bit_no <= HI_RD_BIT; state <= ST_READING; end
      else if (wr_request) begin bit_no <= HI_WR_BIT; state <= ST_WRITING; end
      end
        
    ST_READING:
      begin
      CS <= bit_no == 0; 
      if (bit_no == 0) state <= ST_IDLE;
      bit_no <= bit_no - 7'b1;
      end
      
    ST_WRITING:
      begin
      CS <= (bit_no == 49) || (bit_no == 0); 
      if (bit_no == 0) begin
			IP_write_done <= 1'b1;						// this will cause FPGA to reset so no need to clear 
			state <= ST_IDLE;
		end
      else bit_no <= bit_no - 7'b1;
      end
  endcase   

  
//shift in read data
always @(posedge clock)  
  if (state == ST_READING)
    if (bit_no > 31) mac <= {mac[46:0], SO};
    else ip <= {ip[30:0], SO}; 
    




    
//-----------------------------------------------------------------------------
//                                 output    
//-----------------------------------------------------------------------------
assign SCK = clock;
assign SI = (state == ST_READING) ? rd_bits[bit_no] : wr_bits[bit_no];
assign ready = (state == ST_IDLE);



endmodule
