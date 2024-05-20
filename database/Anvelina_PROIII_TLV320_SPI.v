// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0


//
//  HPSDR - High Performance Software Defined Radio
//
//  Hermes code. 
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

// (C) Phil Harman VK6APH 2006, 2007, 2008, 2009, 2010, 2011, 2012 

// 13 April 2012 - fixed bug that muted receive audio when Line-in selected.
//                 was sending 0x0800 rather than 0x0810.


/* 

Code sends configuration data to the TVL320 via its SPI interface.
Once configured the code loops looking for a change in the boost bit.
If found the new data is sent to the TLV320.

Data to send to TLV320 is 

Common settings
 0x1b    0x1E 0x00 - Reset chip
 0x1b    0x12 0x01 - set digital interface active
 0x1b    0x0C 0x00 - All chip power on
 0x1b    0x0E 0x02 - Slave, 16 bit, I2S
 0x1b    0x10 0x00 - 48k, Normal mode
 0x1b    0x0A 0x00 - turn D/A mute off
 0x1b    0x00 0x00 - set Line in gain to 0

For mic input and boost on/off
 0x1b    0x08 0x14/15 - D/A on, mic input, mic 20dB boost on/off

For line input                           
 0x1b    0x08 0x10 - D/A on, line input

*/

module TLV320_SPI (clk, CMODE, nCS, MOSI, SSCK, boost, line, line_in_gain);

input wire clk;
output wire CMODE;
output reg  nCS;
output reg  MOSI;
output reg  SSCK;
input  wire boost;
input  wire line;   // set when using line rather than mic input
input wire [4:0] line_in_gain;

reg   [3:0] load;
reg   [3:0] TLV;
reg  [15:0] TLV_data;
reg  [15:0] latch_TLV_data;
reg   [3:0] bit_cnt;
reg         prev_boost;
reg         prev_line;
reg	[4:0] prev_line_in_gain;

// Set up TLV320 data to send 
always @*	
begin
  case (load)
  4'd0: TLV_data = 16'h1E00;  			// data to load into TLV320
  4'd1: TLV_data = 16'h1201;
  4'd2: TLV_data = line ? 16'h0810 : (16'h0814 + boost);	// D/A on
  4'd3: TLV_data = 16'h0C00;
  4'd4: TLV_data = 16'h0E02;
  4'd5: TLV_data = 16'h1000;
  4'd6: TLV_data = 16'h0A00;
  4'd7: TLV_data = {11'b0, line_in_gain};				// set line in gain
  //4'd8: TLV_data = 16'h0000;
  default: TLV_data = 0;
  endcase
end

// State machine to send data to TLV320 via SPI interface

assign CMODE = 1'b1;							// Set to 1 for SPI mode

reg [23:0] tlv_timeout;

always @ (posedge clk)		
begin
  if (tlv_timeout != (200*12288))        // 200mS @CMCLK= 12.288Mhz
    tlv_timeout <= tlv_timeout + 1'd1;

  case (TLV)
  4'd0:
  begin
    nCS <= 1'b1;        					// set TLV320 CS high
    bit_cnt <= 4'd15;   					// set starting bit count to 15
    if (tlv_timeout == (200*12288)) begin 	// wait for 200mS timeout
      latch_TLV_data <= TLV_data;		// save the current settings
      TLV <= 4'd1;
    end
    else
      TLV <= 4'd0;
  end

  4'd1:
  begin
    nCS  <= 1'b0;                		// start data transfer with nCS low
    MOSI <= latch_TLV_data[bit_cnt];  			// set data up
    TLV  <= 4'd2;
  end

  4'd2:
  begin
    SSCK <= 1'b1;               			// clock data into TLV320
    TLV  <= 4'd3;
  end

  4'd3:
  begin
    SSCK <= 1'b0;               			// reset clock
    TLV  <= 4'd4;
  end

  4'd4:
  begin
    if (bit_cnt == 0) 						// word transfer is complete, check for any more
      TLV <= 4'd5;
    else
    begin
      bit_cnt <= bit_cnt - 1'b1;
      TLV <= 4'd1;    						// go round again
    end
    begin 
    prev_boost <= boost; 	   			// save the current boost setting 
    prev_line <= line;		   			// save the current line in setting
	 prev_line_in_gain <= line_in_gain; // save the current line-in gain setting
    end 
  end

  4'd5:
  begin
    if (load == 7) begin					// stop when all data sent, and wait for boost to change
		nCS <= 1'b1;        					// set CS high               
		  if (boost != prev_boost || line != prev_line || line_in_gain != prev_line_in_gain) begin  // has boost or line in or line-in gain changed?
			load <= 0;
			TLV <= 4'd0;
		  end
	      else TLV <= 4'd5;     			// hang out here forever
	end
    else begin									// else get next data             	
      TLV  <= 4'd0;           
      load <= load + 3'b1;  				// select next data word to send
    end
  end
  
  default: TLV <= 4'd0;
  endcase
end

endmodule
