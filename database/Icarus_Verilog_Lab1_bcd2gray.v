// BCD to gray conversion

module bcd2gray_gate(a, b);
	// gate level
	input [3:0]a;
	output [3:0]b;
	// Assignment statement
	xor x0(b[3], 0, a[3]);
	xor x1(b[2], a[3], a[2]);
	xor x2(b[1], a[2], a[1]);
	xor x3(b[0], a[1], a[0]);
endmodule

module bcd2gray_df(a, b);
	// dataflow model
	input [3:0]a;
	output [3:0]b;
	
	assign b[3] = a[3];
	assign b[2] = a[3] ^ a[2];
	assign b[1] = a[2] ^ a[1];
	assign b[0] = a[1] ^ a[0];
	
endmodule

module testbench;
	reg [3:0]a;
	wire [3:0]b;
	
	bcd2gray_df bcd2gray(a, b);
	initial
		begin
			$monitor(, $time, " a=%4b, b=%4b", a, b);
			#0 a=4'b0000;
			
			// repeat(n): repeats the statement below n times
			repeat(16)
				// updates 'a' 16 times at an interval of 10 time units
				#10 a=a+4'b0001;
			
			#180 $finish;
		end
		
endmodule