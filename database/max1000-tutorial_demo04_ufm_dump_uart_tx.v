module uart_tx (
	input wire nreset,
	input wire clk,
	
	input wire tx_valid,
	output reg tx_ready,
	input wire [7:0] tx_data,
	
	output reg tx
);

parameter clk_freq = 12000000;
parameter baud_rate =  115200;

parameter width = 8; // Enough bits to fit prescaler!
	
localparam prescaler = clk_freq / baud_rate - 1;
	
reg [width-1:0] counter; // clk prescaler
reg [width-1:0] cmax;

reg [3:0] bit_counter; // count from 0 to 9, 10 values. 1start+8bits+1stop
reg [7:0] bit_sreg;
	
always @(posedge clk or negedge nreset)
	if (~nreset) begin
		tx <= 1'b1; // Idle is 1 in RS-232
		tx_ready <= 1'b1;
		counter 	<= 8'b0;
		cmax		<= prescaler;
		bit_counter <= 4'b0;
		bit_sreg	<= 8'b0;
	end else begin
		if (tx_ready) begin
			if (tx_valid) begin
				tx_ready <= 1'b0;
				counter 	<= 8'b0;
				cmax		<= prescaler;
				//bit_counter <= 4'b0;
				tx <= 1'b0; // start bit
				bit_sreg <= tx_data;
			end
		end else begin
			if (counter == cmax) begin
				counter <= 8'b0;
				
				if (bit_counter == 4'd9) begin // finisihed
					bit_counter <= 4'b0;
					tx_ready <= 1'b1;
					
				end else if (bit_counter == 4'd8) begin // stop bit
					tx <= 1'b1;
					bit_counter <= bit_counter + 4'b1;
					
				end else begin // data bits
					tx <= bit_sreg[0]; // send LSB
					bit_sreg <= {1'b0, bit_sreg[7:1]}; // shift right
					bit_counter <= bit_counter + 4'b1;
				end
				
			end else begin
				counter <= counter + 8'b1;
			end
		end
	end

endmodule
