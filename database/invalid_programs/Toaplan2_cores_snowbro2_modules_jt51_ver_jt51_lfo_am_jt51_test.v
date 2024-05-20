// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module jt51_test;
	`include "../common/jt51_test.vh"

	integer cnt0;

	`ifndef WAITFOR1K
    `ifndef WAITFOR0
	    initial begin
		    #(100*1000*1000) $display("dump end");
		    $finish;
	    end
    `endif
    `endif

	initial begin
		#(2000*1000*1000) $display("dump end");
		$finish;
	end

	always @(posedge clk or posedge rst) begin
		if( rst ) begin
			cnt0 <= 0;
		end
		else
		if( prog_done ) begin
		`ifdef WAITFOR1K
			if( xleft >= 16'd1023 ) begin
				cnt0 <= cnt0+1;
				if( cnt0==128 )	begin				
					#30000 $display("dump end");
					$finish;
				end
			end
			else cnt0 <= 0;
		`endif
		`ifdef DONTWAIT
				// Dump data
				#(100*1000*1000);
				$display("dump end");
				$finish;		
		`endif
		end
	end

endmodule

