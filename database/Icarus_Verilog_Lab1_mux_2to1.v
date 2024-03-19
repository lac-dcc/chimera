// Gate model
// Dataflow model
// Behavioral model

module mux2tol_gate (a, b, s, f);
	input a, b, s;
	output f;
	wire c, d, e;
	
	not n1(e, s); // e=~s
	and a1(c, a, s);
	and a2(d, b, e);
	or o1(f, c, d);
endmodule

module mux2tol_df (a, b, s, f);
	input a, b, s;
	output f;
	assign f = s?a:b;
endmodule

module mux2tol_beh(a, b, s, f);
	input a, b, s;
	output f;
	reg f;
	always@ (s or a or b)
		if(s==1) f=1;
		else f=b;
endmodule

// testbench is the driver program
module testbench;
	// no variable list is needed in testbench declaration
	reg a, b, s; // in testbench inputs are registers
	wire f; // in testbench output is a wire
	
	
	mux2tol_gate mux_df (a, b, s, f);
	// mux_df is an instance of mux2tol_df
	// registers are don't cares (x) until assigned
	initial
		begin
			$monitor(, $time, " a=%b, b=%b, s=%b, f=%b", a, b, s, f);
			// $monitor outputs to screen
			// new output is displayed on every input state change
			#0 a=1'b0; b=1'b0;
			#2 s=1'b1;
			#5 s=1'b0;
			#10 a=1'b1; b=1'b0;
			#15 s=1'b1;
			#20 s=1'b0;
			#50 $finish;
		end
	
    initial
		begin
			$dumpfile("filename.vcd");
			$dumpvars;
		end

endmodule