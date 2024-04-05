
`include "mux2to1_gate.v"

module testbench_mux2to1_gate;
	
	reg a;
	reg b;
	reg s;
	
	wire f;
	
	mux2to1_gate mux_gate (a,b,s,f);
	initial
		begin
			$monitor($time," a = %b, b = %b, s = %b, f = %b",a,b,s,f);
			#0 a=1'b0; b=1'b1;
			#2 s=1'b1;
			#5 s=1'b0;
			#10 a=1'b1;b=1'b0;
			#15 s=1'b1;
			#20 s=1'b0;
			#100 $finish;
		end
	
	initial
		begin
			$dumpfile("filename.vcd");
			$dumpvars;
		end
endmodule
