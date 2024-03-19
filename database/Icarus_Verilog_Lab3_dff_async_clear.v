// module d flip flop with synchronus clear
// clock is negative edge triggered and clear signal is active low
`ifndef DFF_ASYNC_CLEAR
`define DFF_ASYNC_CLEAR
	module dff_async_clear(d,clearb, clock, q);
		input d, clearb, clock;
		output q;
		reg q;
		
		always @(posedge clock or negedge clearb)
			begin
				if(clearb)
					q = d;
				else
					q = 1'b0;
			end
	endmodule
`endif