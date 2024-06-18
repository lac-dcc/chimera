// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
//                          General_CC.v
//-----------------------------------------------------------------------------

//
//  HPSDR - High Performance Software Defined Radio
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


//  Copyright 2010, 2011, 2012, 2013, 2014  Phil Harman VK6(A)PH

// ***** need to check sequence error 

/*
	The maximum payload length in a UDP frame is 1444 bytes (without fragmentation).
	We use 4 bytes to hold the sequency number so 1440 bytes are avaialble for data.
	In which case we count the frame from 0 to 1443.
	
	When the code detects that the frame is for the C&C port (1033) then the MSB
	of the sequence number is received.  We then read the next 3 bytes to complete the 
	sequence number.  Hence at the end of the sequence number the byte_number is 2.
	
	
*/


module General_CC 
			( 	
				input clock,
				input [15:0] to_port,
				input udp_rx_active,
				input [7:0] udp_rx_data,
				output reg [15:0] Rx_Specific_port,
				output reg [15:0] Tx_Specific_port,
				output reg [15:0] High_Prioirty_from_PC_port,
				output reg [15:0] High_Prioirty_to_PC_port,			
				output reg [15:0] Rx_Audio_port,
				output reg [15:0] Tx_IQ_port,
				output reg [15:0] Rx0_port,
				output reg [15:0] Mic_port,
				output reg [15:0] Wideband_ADC0_port,
				output reg [7:0]  Wideband_enable,
				output reg [15:0] Wideband_samples_per_packet,				
				output reg [7:0]  Wideband_sample_size,
				output reg [7:0]  Wideband_update_rate,
				output reg [7:0]  Wideband_packets_per_frame,
				output reg [15:0] Envelope_PWM_max,
				output reg [15:0] Envelope_PWM_min,
				output reg Time_stamp,
				output reg VITA_49,				
				output reg VNA,
				output reg [7:0]  Atlas_bus,
				output reg [7:0]  _10MHz_reference,
				output reg PA_enable,
				output reg Apollo_enable,	
				output reg [7:0] Alex_enable,			
				output reg data_ready,
				output HW_reset,
				output reg HW_timer_enable
			);
			
parameter port = 16'd1024;			

localparam 
				IDLE = 2'd0,
				PROCESS = 2'd1,
				END = 2'd2;
			
//reg [31:0] CC_sequence_number;
reg [7:0] byte_number;
reg [1:0] state;

			
always @(posedge clock)
begin
  if (udp_rx_active && to_port == port)				// look for to_port = 1024
    case (state)
      IDLE:	
				begin
				byte_number <= 8'd1;
				data_ready <= 1'b0;
				//CC_sequence_number[31:24] <= udp_rx_data;  //save MSB of sequence number
				state <= PROCESS;
				end 
			
		PROCESS:
			begin
				case (byte_number) 	//save balance of sequence number
					   //1: CC_sequence_number[23:16] <= udp_rx_data;
					   //2: CC_sequence_number[15:8] <= udp_rx_data; 				
					   //3: CC_sequence_number[7:0] <= udp_rx_data; 				
					   4: if (udp_rx_data != 8'd0) state <= END;	// not for this module	
					   5: Rx_Specific_port[15:8] <= udp_rx_data;
					   6: Rx_Specific_port [7:0] <= udp_rx_data;
					   7: Tx_Specific_port[15:8] <= udp_rx_data;
					   8: Tx_Specific_port [7:0] <= udp_rx_data;
					   9: High_Prioirty_from_PC_port[15:8] <= udp_rx_data;
					  10: High_Prioirty_from_PC_port [7:0] <= udp_rx_data;
					  11: High_Prioirty_to_PC_port[15:8] <= udp_rx_data;
					  12: High_Prioirty_to_PC_port [7:0] <= udp_rx_data;
					  13: Rx_Audio_port[15:8] <= udp_rx_data;
					  14: Rx_Audio_port [7:0] <= udp_rx_data;
					  15: Tx_IQ_port[15:8] <= udp_rx_data;
					  16: Tx_IQ_port [7:0] <= udp_rx_data;		
					  17: Rx0_port[15:8] <= udp_rx_data;
					  18: Rx0_port [7:0] <= udp_rx_data;
					  19: Mic_port[15:8] <= udp_rx_data;
					  20: Mic_port [7:0] <= udp_rx_data;
					  21: Wideband_ADC0_port[15:8] <= udp_rx_data;
					  22: Wideband_ADC0_port [7:0] <= udp_rx_data;
					  23: Wideband_enable <= udp_rx_data;
					  24: Wideband_samples_per_packet[15:8] <= udp_rx_data;
					  25: Wideband_samples_per_packet [7:0] <= udp_rx_data;
					  26: Wideband_sample_size [7:0] <= udp_rx_data;					  
					  27: Wideband_update_rate [7:0] <= udp_rx_data;
					  28: Wideband_packets_per_frame <= udp_rx_data; 

					  33: Envelope_PWM_max[15:8] <= udp_rx_data;
					  34: Envelope_PWM_max [7:0] <= udp_rx_data;		
					  35: Envelope_PWM_min[15:8] <= udp_rx_data;
					  36: Envelope_PWM_min [7:0] <= udp_rx_data;	
					  37: begin 
						Time_stamp	<= udp_rx_data[0]; 
						VITA_49		<= udp_rx_data[0];
						VNA		<= udp_rx_data[0];
					      end 
					  38: HW_timer_enable  <= udp_rx_data[0];
						
					  56: Atlas_bus <= udp_rx_data;
					  57: _10MHz_reference <=  udp_rx_data;
					  58: begin
						PA_enable <= udp_rx_data[0];
						Apollo_enable <= udp_rx_data[1]; 
						data_ready <= 1'b1;
					      end 
					  59: begin	
						Alex_enable 	<= udp_rx_data;
						data_ready 		<= 1'b0;
					      end 
									  
			   default: if (byte_number > 8'd59) state <= IDLE; 
			   endcase  
		  
			   byte_number <= byte_number + 8'd1;
			end
		END: state <= IDLE;
		default: state <= IDLE;
		endcase 
	else state <= IDLE;	

end		

// inhibit HW_reset if Ethernet data stops 
assign HW_reset = (byte_number > 8'd4  && udp_rx_active);
			
endmodule			
