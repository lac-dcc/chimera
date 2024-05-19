// This program was cloned from: https://github.com/emeb/up5k_basic
// License: MIT License

// acia_rx.v - asynchronous serial receive submodule
// 06-02-19 E. Brombaugh

module acia_rx(
	input clk,				  // system clock
	input rst,				  // system reset
	input rx_serial,		  // raw serial input
	output reg [7:0] rx_dat,  // received byte
	output reg rx_stb,        // received data available
	output reg rx_err         // received data error
);
	// sym rate counter for 115200bps @ 16MHz clk
    parameter SCW = 8;
	parameter sym_cnt = 139;
	
	// input sync & deglitch
	reg [7:0] in_pipe;
	reg in_state;
	wire all_zero = ~|in_pipe;
	wire all_one = &in_pipe;
	always @(posedge clk)
		if(rst)
		begin
			// assume RX input idle at start
			in_pipe <= 8'hff;
			in_state <= 1'b1;
		end
		else
		begin
			// shift in a bit
			in_pipe <= {in_pipe[6:0],rx_serial};
	
			// update state
			if(in_state && all_zero)
				in_state <= 1'b0;
			else if(!in_state && all_one)
				in_state <= 1'b1;
		end

	// receive machine
	reg [8:0] rx_sr;
	reg [3:0] rx_bcnt;
	reg [SCW-1:0] rx_rcnt;
	reg rx_busy;
	always @(posedge clk)
		if(rst)
		begin
			rx_busy <= 1'b0;
			rx_stb <= 1'b0;
			rx_err <= 1'b0;
		end
		else
		begin
			if(!rx_busy)
			begin
				if(!in_state)
				begin
					// found start bit - wait 1/2 bit to sample
					rx_bcnt <= 4'h9;
					rx_rcnt <= sym_cnt/2;
					rx_busy <= 1'b1;
				end
				
				// clear the strobe
				rx_stb <= 1'b0;
			end
			else
			begin
				if(~|rx_rcnt)
				begin
					// sample data and restart for next bit
					rx_sr <= {in_state,rx_sr[8:1]};
					rx_rcnt <= sym_cnt;
					rx_bcnt <= rx_bcnt - 1;
					
					if(~|rx_bcnt)
					begin
						// final bit - check for err and finish
						rx_dat <= rx_sr[8:1];
						rx_busy <= 1'b0;
						if(in_state && ~rx_sr[0])
						begin
							// framing OK
							rx_err <= 1'b0;
							rx_stb <= 1'b1;
						end
						else
							// framing err
							rx_err <= 1'b1;
					end
				end
				else
					rx_rcnt <= rx_rcnt - 1;
			end
		end
endmodule
