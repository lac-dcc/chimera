// ps2_rx.v - PS/2 receiver
// 05-30-19 E. Brombaugh

`default_nettype none

module ps2_rx(
	input clk,
	input rst,
	input ps2_clk_in,
	input ps2_dat_in,
	input ps2_clk_ena,
	input ps2_dat_sync,
	output reg [7:0] rx_code,
	output reg rx_done,
	output reg rx_frmerr,
	output reg rx_parerr
);
	// rx state machine deserializes data
	localparam ST_WAIT = 4'h0;
	localparam ST_DAT0 = 4'hA;
	localparam ST_STOP = 4'h1;	
	reg [3:0] rx_state;
	reg [8:0] rx_sreg;
	always @(posedge clk)
		if(rst)
		begin
			rx_state <= ST_WAIT;
			rx_done <= 1'b0;
			rx_frmerr <= 1'b0;
			rx_parerr <= 1'b0;
		end
		else
		begin
			if(ps2_clk_ena)
			begin
				// Start or count or wait
				if(|rx_state)
					rx_state <= rx_state - 4'h1;
				else if(ps2_dat_sync == 1'b0)
					rx_state <= ST_DAT0;
				
				// shift in data lsb first
				if(|rx_state)
					rx_sreg <= {ps2_dat_sync,rx_sreg[8:1]};
				
				// final processing
				if(rx_state == ST_STOP)
				begin
					rx_done <= 1'b1;	// flag end of cycle
					if(ps2_dat_sync == 1'b0)
						rx_frmerr <= 1'b1;	// frame error if stop = 0
					if(^rx_sreg == 1'b0)
						rx_parerr <= 1'b1;	// parity error
					rx_code <= rx_sreg[7:0]; // grab data
				end
			end
			else
				rx_done <= 1'b0;	// rx_done only lasts one cycle
		end
endmodule

