// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

// send_data - generic test




module send_data (
						input clock,
						input send,
						input [15:0] udp_tx_length, 
						input [31:0] sequence_number,
						input [3:0] port_ID,
						input [7:0] CC_data[0:56],
						input [7:0] data_in,
						input udp_tx_active,
						input udp_tx_enable,
						input send_more,
						input erase_done,
						input [RES_H_BIT:0] response_tx_bits,
						input [7:0] board_type,
						
						output reg udp_tx_request,
						output CC_ack,
						output read_fifo,
						output [7:0] udp_tx_data,
						output reg busy,
						output reg send_more_ACK,
						output reg erase_done_ACK
						);
						
						
localparam 
	HEADER_LENGTH  = 16'd10,					// number of bytes in response udp header
	RES_H_BIT    	= HEADER_LENGTH*8 -1;  	// response header bits
					
				
				
reg state = 0;
reg [10:0] byte_no = 0;
reg send_response = 0;
reg [7:0] tx_data = 0;
reg [RES_H_BIT:0] response_shift_reg = 0;
										
always @ (posedge clock)
begin 
case (state)
	
	0: begin 
			byte_no <= 0;
			udp_tx_request <= 0;
			busy <= 0;
			send_response <= 0;
			response_shift_reg <= response_tx_bits;
			
			if (!send_more)  send_more_ACK  <= 1'b0; 		// clear ACK when sdr_receiver has seen our ACK
			if (!erase_done) erase_done_ACK <= 1'b0;		// clear ACK when ASMI_interface has seen our ACK
			if (send) begin 
					busy <= 1'b1;
					if (port_ID == 4'd1) CC_ack <= 1'b1;
					udp_tx_request <= 1'b1;	
					if (udp_tx_enable) begin
							if (port_ID == 0) begin 
								if (send_more)	 send_more_ACK  <= 1'b1;  // only send ACKs when Tx is not busy
								if (erase_done) erase_done_ACK <= 1'b1;
								send_response <= 1'b1;
							end
						tx_data <= sequence_number[31:24]; 	
						state <= 1; 
					end 
			end
		end	
		
	1: begin 
			  CC_ack <= 0;
			  if (byte_no < udp_tx_length) begin  	
				if (udp_tx_active) begin
					if (port_ID == 0)
						response_shift_reg <=  {response_shift_reg[RES_H_BIT-8:0], board_type}; 
					else begin
						case (byte_no)
							0: tx_data <= sequence_number[23:16];					
							1: begin
								tx_data <= sequence_number[15:8];
								read_fifo <= 1'b1;
								end 						
							2: tx_data <= sequence_number[7:0];	
	  udp_tx_length - 3: read_fifo <= 1'b0;
						endcase
						if (byte_no > 2) tx_data <= (port_ID == 4'd1) ? CC_data[byte_no - 3] : data_in;						
					end 
				byte_no <= byte_no + 11'd1;
			  end 
		   end
			else  state <= 0; 		// all data sent so return to start
		end	
endcase
end 
				
// tx_data needs to be available before udp_tx_active received
assign udp_tx_data = send_response  ? response_shift_reg[RES_H_BIT -: 8] :  tx_data;					
								  
endmodule
								  