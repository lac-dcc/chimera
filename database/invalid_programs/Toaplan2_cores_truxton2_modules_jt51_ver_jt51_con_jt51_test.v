// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module jt51_test;

	`include "../common/jt51_test.vh"

	integer cnt0;

	initial #(100*1000*1000) $finish;

	always @(posedge clk) begin
		if( rst ) begin
			cnt0 <= 0;
		end
		else
		if( prog_done ) begin
		`ifdef WAITFOR0
			// Wait until the output becomes zero
			if( left == 16'd0 ) begin
				cnt0 <= cnt0+1;
				if( cnt0==2048 )	#10000 $finish;
			end
			else cnt0 <= 0;
		`else
			// Dump data
			#80000000;
			$display("dump end");
			$finish;
		`endif
		end
	end

endmodule

