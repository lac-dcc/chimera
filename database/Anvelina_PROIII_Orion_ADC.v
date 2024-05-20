// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

// V1.1 22 November 2009
//
// Copyright 2007, 2008, 2009 Phil Harman VK6APH
//
//  HPSDR - High Performance Software Defined Radio
//
//
//  ADC module for driving ADC78H90 
//
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

//  SCI inteface to ADC78H90 

//  Hermes uses inputs AIN1 to AIN6
//  SCLK can run at 8MHz max and is = clock/4 
//  Note: AINx data can be latched using nCS
//  IMPORTANT:  When using multiple addresses the data returned while the current address is 
//       	    being sent is from the PREVIOUS address.

//  

module Orion_ADC(clock, SCLK, nCS, MISO, MOSI, AIN1, AIN2, AIN3, AIN4, AIN5, AIN6, pk_detect_reset, pk_detect_ack);

input  wire       clock;	// now at 30.72 MHz, ADC bus at 7.68 MHz (x10 previous rate)
output reg        SCLK;
output reg        nCS;
input  wire       MISO;
output reg        MOSI;
output reg [11:0] AIN1; // 
output reg [11:0] AIN2; // 
output reg [11:0] AIN3; // 
output reg [11:0] AIN4; // 
output reg [11:0] AIN5; // holds VFWD volts
output reg [11:0] AIN6; // holds 13.8v supply voltage

output reg  pk_detect_ack;		// to Orion_Tx_fifo_ctl.v
input  reg  pk_detect_reset;	// from Orion_Tx_fifo_ctl.v

reg  [15:0] ADC_address;
reg   [2:0] ADC_state;
reg   [3:0] bit_cnt;
reg  [11:0] temp_1;	
reg  [11:0] temp_2;
reg  [11:0] temp_3;
reg  [11:0] temp_4;
reg  [11:0] temp_5;
reg  [11:0] temp_6;

reg [11:0] peak_AIN1;
reg [11:0] peak_AIN2;
reg [11:0] prev_AIN1;
reg [11:0] prev_AIN2; 

// NOTE: this code generates the SCLK clock for the ADC
// The ADC78H90 specs say Duty Cycle is min 40% and max 60%
always @ (posedge clock)
begin
  case (ADC_state)
  0:
	begin
    nCS       <= 1'b1;          // set nCS high
    bit_cnt   <= 4'd15;         // set bit counter
    if (ADC_address[13:11] == 3'd5)
		ADC_address <= 16'b0;		// reset ADC address
	else ADC_address <= ADC_address + 16'b0000_1000_0000_0000;  // increment ADC address
    ADC_state <= 1;
	end
	
  1:
	begin
    nCS       <= 0;             		// select ADC
    MOSI      <= ADC_address[bit_cnt];	// shift data out to MOSI
    ADC_state <= 2;
	end
	
  2:
	begin
    SCLK      <= 1'b1;          // SCLK high
    ADC_state <= 3;
	end
	
  3:
	begin
    ADC_state <= 4;
	end

  4:
	begin
		SCLK      <= 1'b0;          // SCLK low
		if (bit_cnt == 0)           // restart
		  ADC_state <= 0;
		else
		begin
		  bit_cnt   <= bit_cnt - 1'b1; // do all again
		  ADC_state <= 1;
		end
	end 
	
  default:
    ADC_state <= 0;
  endcase
end 

always @ (posedge clock)
begin
  if (ADC_state == 0) begin 		// latch data when not shifting
  
  	// peak detect for AIN1 and AIN2
	if (pk_detect_reset == 1'b1) begin
		peak_AIN1 <= temp_1;			// begin new interval for detecting peaks
		peak_AIN2 <= temp_2;
		pk_detect_ack <= 1'b1;		// send acknowledgement of receipt of reset signal
	end
	else begin
		pk_detect_ack <= 1'b0;		// clear ack after Orion_Tx_fifo_ctl.v releases reset
	end

	if (temp_1 > peak_AIN1) begin  // peak AIN1 detect
		peak_AIN1 <= temp_1;
	end
	if (temp_2 > peak_AIN2) begin  // peak AIN2 detect
		peak_AIN2 <= temp_2;
	end
	// end of peak detect section

	AIN1 <= peak_AIN1;
	AIN2 <= peak_AIN2;	
	AIN3 <= temp_3;
	AIN4 <= temp_4;
	AIN5 <= temp_5;
	AIN6 <= temp_6;

  end 		    
// NOTE: data is from previous address sent! 
  if (SCLK && (bit_cnt <= 11)) begin 	// start capturing data at bit counter = 11
	case (ADC_address[13:11])
		0: 	temp_6[bit_cnt] <= MISO;   	// capture incoming data
		1:		temp_1[bit_cnt] <= MISO;
		2:		temp_2[bit_cnt] <= MISO;
		3:		temp_3[bit_cnt] <= MISO;
		4:		temp_4[bit_cnt] <= MISO;
		5:		temp_5[bit_cnt] <= MISO;
	//default: ADC_address = 0;
	endcase	
  end
end 
	
endmodule 

