`ifndef DFF_SYNC_CLEAR
`define DFF_SYNC_CLEAR
// module d flip flop with synchronus clear
// clock is positive edge triggered
	module dff_sync_clear(d,clearb, clock, q);
		input d, clearb, clock;
		output q;
		reg q;
		
		always @(posedge clock)
			begin
				if(clearb)
					q = d;
				else
					q = 1'b0;
			end
	endmodule
`endif