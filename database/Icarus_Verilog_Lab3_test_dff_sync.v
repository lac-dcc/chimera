`include "dff_sync_clear.v"
module test_dff_sync;
	reg d, clk, rst;
	wire q;
	
	always @(posedge clk)
		begin
			$monitor("d = %b, clk = %b, rst = %b, q = %b", d,clk,rst,q);
		end
	
	initial begin
		forever begin
				clk = 0;
			#5	clk = 1;
			#5	clk = 0;
		end
	end
	initial begin
		d = 0; rst = 1;
		#4 d = 1; rst = 0;
		#50 d = 1; rst = 1;
		#20 d = 0; rst = 0;
	end
	
	dff_sync_clear dff(d,rst,clk,q);
endmodule