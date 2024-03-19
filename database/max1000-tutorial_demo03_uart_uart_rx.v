module uart_rx #(
	parameter clk_freq = 12000000,
	parameter baud_rate =  115200
)  (
	input wire nreset,
	input wire clk,
	
	// Avalon source
	output reg rx_valid,
	input wire rx_ready,
	output wire [7:0] rx_data,
	
	// Debug outputs
	output wire [7:0] cmax_o,
	output wire voted_o,
	
	// RS232
	input wire rx
);

parameter NBITS = 10; // must be more than log2(prescaler)

localparam prescaler = clk_freq / baud_rate - 1;

//parameter P = $clog2(prescaler);
//$display(P);

// 1 start bit + 8 data bits + 1 stop bit
reg [3:0] bit_cnt;
reg [9:0] sreg;

assign rx_data = sreg[7:1];

reg [NBITS-1:0] counter; // clk prescaler
reg [NBITS-1:0] cmax;

reg [NBITS-1:0] popcnt_h0; // number of 1s while 0 =< counter < cmax/2 (first half)
reg [NBITS-1:0] popcnt_h1; // number of 1s while cmax =< counter < cmax (second half)

reg nbusy;
reg voted;

assign cmax_o = cmax[NBITS-1:NBITS-8];
assign voted_o = voted;

/*
	popcnt = number of ones received in one Tbit

	popcnt = popcnt_h0 + popcnt_h1
	
	voting:
		popcnt > cmax/2 -> more 1s than 0s -> symbol is 1
		popcnt < cmax/2 -> more 0s than 1s -> symbol is 0

	cmax determines the tbit period and is adjusted dynamically
		
	if symbol is a 1:
		if popcnt_h0 < popcnt_h1:
			-> more 0s in first half -> must go slower (cmax++)
			-> Simple:  cmax <= cmax + 1
			-> Complex: cmax <= cmax + ((cmax>>1) - popcnt_h1); // cmax plus no. of 0s
		else if popcnt_h0 > popcnt_h1:
			-> more 0s in second half -> must go faster (cmax--)
			-> Simple:  cmax <= cmax - 1
			-> Complex: cmax <= cmax - ((cmax>>1) - popcnt_h0); // cmax minus no. of 0s
			
	if symbol is a 0:
		if popcnt_h0 < popcnt_h1:
			-> more 1s in second half -> must go faster (cmax--)
			-> Simple:  cmax <= cmax - 1
			-> Complex: cmax <= cmax - popcnt_h0; // cmax minus number of ones in first half
		else if popcnt_h0 > popcnt_h1:
			-> more 1s in first half -> must go slower (cmax++)
			-> Simple:  cmax <= cmax + 1		
			-> Complex: cmax <= cmax + popcnt_h1; // cmax plus number of ones in second half
*/

always @(posedge clk or negedge nreset)
	if (~nreset) begin
		nbusy     <= 1'b1;
		rx_valid     <= 1'b0;
		popcnt_h0 <= 'b0; // should be enough with 7 bits
		popcnt_h1 <= 'b0;
		counter   <= 'b0;
		cmax		 <= prescaler; // approximate prescaler value
		voted     <= 1'b1; // voted bit, idle is 1
		bit_cnt   <= 4'd0;
		sreg      <= 10'b0;
	end else begin
		if (nbusy) begin
			if (rx_ready) begin
				if (~rx) begin
					nbusy   <= 1'b0;
					cmax 	  <= prescaler;
					counter <= 'b0;
				end
				rx_valid   <= 1'b0;
			end
		end else begin
			if (counter == cmax) begin
				if (bit_cnt == 4'd9) begin
					nbusy   <= 1'b1;
					bit_cnt <= 4'd0;
					voted   <= 1'b1;
					rx_valid   <= 1'b1;
				end else begin
					bit_cnt <= bit_cnt + 4'd1;
				end
				
				counter <= 'b0;
				
				popcnt_h0 <= 'b0;
				popcnt_h1 <= 'b0;
				
				if ((popcnt_h0 + popcnt_h1) > (cmax >> 1)) begin
					voted  <= 1'b1;
					sreg   <= {1'b1, sreg[9:1]}; // start pushing lsb at the left
					
					if (popcnt_h0 < popcnt_h1) begin
						cmax <= cmax + 1'b1;
					end else if (popcnt_h0 < popcnt_h1) begin
						cmax <= cmax - 1'b1;
					end
				end else begin
					voted <= 1'b0;
					sreg  <= {1'b0, sreg[9:1]}; // start pushing lsb at the left
					
					if (popcnt_h0 < popcnt_h1) begin
						cmax <= cmax - 1'b1;
					end else if (popcnt_h0 < popcnt_h1) begin
						cmax <= cmax + 1'b1;
					end
				end
			end else begin
				counter <= counter + 1'b1;
				
				if (counter < (cmax>>1)) begin
					if (rx) popcnt_h0 <= popcnt_h0 + 1'b1;
				end else begin
					if (rx) popcnt_h1 <= popcnt_h1 + 1'b1;
				end
			end
		end
	end

endmodule
