// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
//                          sdr receive
//-----------------------------------------------------------------------------

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


//  Metis code copyright 2010, 2011, 2012, 2013 Phil Harman VK6APH


module sdr_receive(
	// inputs
	input rx_clock,
	input [7:0] udp_rx_data,
	input udp_rx_active,
	input sending_sync,
	input broadcast,
	input erase_ACK,
	input send_more_ACK,					// set when sdr_send has seen send_more request
	input discovery_ACK,					// set when sdr_send has seen discovery_reply request
	input [9:0] EPCS_wrused,
	input [47:0] local_mac,
	input [15:0] to_port,

	// outputs
	output reg discovery_reply,
	output reg erase,					   	// set when we receive an EPCS16 erase command from PC 
	output reg [31:0]num_blocks,			// holds number of blocks of 256 bytes that we will save in the EPCS16
	output EPCS_FIFO_enable,				// set when we write to the EPCS fifo
	output reg set_ip,						// set when new static IP address available 
	output reg [31:0] assign_ip,			// static IP address to save in EEPROM.
	output reg [31:0] sequence_number	// sequence number from PC when programming.
);


reg [11:0] state;
reg [31:0] PC_sequence_number;		// sequence number from PC
reg [31:0] temp_PC_sequence_number;
reg [31:0] prev_seq_number;
reg [8:0]  EPCS_data_count;     		// counts how many bytes we send to the EPCS_Rx_fifo
reg [8:0]  byte_cnt;						// counts bytes sent to EPCS fifo 
reg [7:0]  byte_no;
reg [47:0] mac;

localparam 
	ST_IDLE		= 12'd0,			// use 'one-hot' for state machine
	ST_COMMAND	= 12'd1,
	ST_DISCOVERY	= 12'd2,
	ST_SETIP	= 12'd4,
	ST_PROGRAM	= 12'd8,
	ST_TX		= 12'd16,
	ST_ERASE	= 12'd32,
	ST_PROGRAM_FIFO = 12'd64,
	ST_WAIT		= 12'd128;

// ****** NOTE: This state machine only runs when udp_rx_active ******	

always @(posedge rx_clock)
begin

  if (udp_rx_active && to_port == 1024) begin	// look for HPSDR udp packet to port 1024
    case (state)
	 
		ST_IDLE:	
			begin
			byte_no <= 8'd0;
			sequence_number[31:24] <=  udp_rx_data;  //save MSB of sequence number 
			state <= ST_COMMAND;
			end 
			
		ST_COMMAND:
			begin
			byte_cnt <= 9'd5;
				case (byte_no) 	//save balance of sequence number
					0: sequence_number[23:16]  <= udp_rx_data;
					1: sequence_number[15:8]   <= udp_rx_data; 
					2: sequence_number[7:0]    <= udp_rx_data;
					3: begin 
						case (udp_rx_data)				// get command 
							2: state <= ST_DISCOVERY;		// allow Discovery to this address or broadcast 
							3: if (broadcast)  state <= ST_SETIP; 
							4: if (!broadcast) state <= ST_ERASE;
							5: if (!broadcast) state <= ST_PROGRAM_FIFO;
							default: state <= ST_WAIT;		// command not for us so wait for this to end
						endcase
					end

					default: state <= ST_WAIT;  // command not for us so wait for this to end
				endcase
				byte_no <= byte_no + 8'd1;  // byte_no will be 4 when we leave this state
			end
				

		ST_DISCOVERY:  state <= ST_TX;   


		ST_SETIP: 
			begin
				case(byte_no)
					 4: mac[47:40] <= udp_rx_data;
					 5: mac[39:32] <= udp_rx_data;							 
					 6: mac[31:24] <= udp_rx_data;
					 7: mac[23:16] <= udp_rx_data;
					 8: mac[15:8]  <= udp_rx_data;
					 9: mac[7:0]   <= udp_rx_data;

					10: begin 
						if (mac != local_mac) state <= ST_IDLE;   // not for this MAC so return
						else assign_ip[31:24] <= udp_rx_data;
					 end
					11: assign_ip[23:16] <= udp_rx_data;
					12: assign_ip[15:8]  <= udp_rx_data; 
					13: assign_ip[7:0]   <= udp_rx_data; 

					14: set_ip <= 1'b1;				// indicate new ip address available
					40: state <= ST_IDLE;				// leave set_ip active since read on very slow clock 
											// and FPGA is reset once new IP address is set
					default: state <= ST_IDLE;
				endcase
				byte_no <= byte_no + 8'd1;
			end 
		
		ST_ERASE: state <= ST_TX; 
			
		ST_PROGRAM_FIFO:
			begin 
				case (byte_cnt)						// can't use byte_no since byte_cnt enables the FIFO
					5: num_blocks[31:24] <= udp_rx_data;
					6: num_blocks[23:16] <= udp_rx_data;
					7: num_blocks[15:8]  <= udp_rx_data;						
					8: num_blocks[7:0]   <= udp_rx_data;	

					default: if(byte_cnt > 264) state <= ST_IDLE;
				endcase
				byte_cnt <= byte_cnt + 9'd1;
			end
	
		// wait for the end of sending
		ST_TX:  if (!sending_sync) state <= ST_IDLE;
		
		ST_WAIT: if (!udp_rx_active) state <= ST_IDLE;				// command not for us so loop until it ends.

		default: if (!udp_rx_active) state <= ST_IDLE;
		
	  endcase	
	end
	  
	else state <= ST_IDLE;  // rx not active
	
end 

//	assign discovery_reply = (state == ST_DISCOVERY);
   assign EPCS_FIFO_enable = (byte_cnt > 8 && byte_cnt < 265);   // enable 256 bytes to EPCS fifo


// Code to erase EPCS fifo. Needs separate state machine since above code only runs when udp_rx_active	
reg [2:0] EPCS_state;	
reg [26:0]delay;
always @ (posedge  rx_clock)  
begin
	case (EPCS_state)
	0: begin
		if (state == ST_ERASE) begin
			erase <= 1'b1;
			delay <= 27'd1;
			EPCS_state <= 	1;
		end 
	end 

	1: begin 								
		if (erase_ACK | delay == 27'd0) begin  // time out ACK so we don't get stuck here. 
			erase <= 1'b0;
			EPCS_state <= 0;
		end
		else delay <= delay + 27'd1;
	end 
	endcase
end
	
	
// wait for acknowledgement that sdr_send has seen the discovery reply request. 
// Needs separate state machine since udb Rx code only runs when udp_rx_active			
reg [2:0] DISC_state;	
reg [26:0]delay1;
always @ (posedge rx_clock)  
begin
	case (DISC_state)
	0: begin
		if (state == ST_DISCOVERY) begin
			discovery_reply <= 1'b1;
			delay1 <= 27'd1;
			DISC_state <= 	1;
		end 
	end 

	1: begin 								
		if (discovery_ACK | delay1 == 27'd0) begin  // time out ACK so we don't get stuck here. 
			discovery_reply <= 1'b0;
			DISC_state <= 0;
		end
		else delay1 <= delay1 + 27'd1;
	end 
	endcase
end	

endmodule
