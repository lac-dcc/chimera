// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0





//  TLV320 is in I2S mode.
module mic_I2S ( 	input clock, 
						input CLRCLK,
						input in, 
						output reg[15:0]mic_data, 
						output reg ready);

reg [4:0] TX_state;
reg [15:0] Tx_q;

always @ (posedge clock)
begin 
 		
		Tx_q[15:0] <= {Tx_q[14:0], in};			// shift current TLV320 data left and add next bit
		
case (TX_state)

5'd0:		begin
				ready <= 0;
				if(CLRCLK) TX_state <= 5'd1;				// loop until TX_LRCLK is high so we grab the correct samples for line in.
			end
		
5'd1:		if(!CLRCLK) TX_state <= TX_state + 1'b1; 	// loop until TX_LRCLK is low

5'd18:	begin
				mic_data <= Tx_q;								// microphone or line data
				ready <= 1'b1;
				TX_state <= 5'd0;							 
			end

default:TX_state <= TX_state + 1'b1;
endcase
end  

endmodule
