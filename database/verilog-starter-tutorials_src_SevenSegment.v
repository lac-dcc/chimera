// hex value to seven segment decoder
// dp is ignored here, in this code
// a(b[0]),b(b[1]),c(b[2]),d(b[3]),e(b[4]),f(b[5]),g(b[6])
module seg_disp(inp, out);
	input[3:0] inp;
	output[6:0] out;
	reg[6:0] out;
	always @(*)
	begin

		case (inp)
			4'b0000 :      	//Hexadecimal 0
				out = 7'b0111111;
			4'b0001 :    		//Hexadecimal 1
				out = 7'b0000110  ;
			4'b0010 :  		// Hexadecimal 2
				out = 7'b1011011 ; 
			4'b0011 : 		// Hexadecimal 3
				out = 7'b1001111 ;
			4'b0100 :		// Hexadecimal 4
				out = 7'b1100110 ;
			4'b0101 :		// Hexadecimal 5
				out = 7'b1101101 ;  
			4'b0110 :		// Hexadecimal 6
				out = 7'b1011111 ;
			4'b0111 :		// Hexadecimal 7
				out = 7'b0000111;
			4'b1000 :     		 //Hexadecimal 8
				out = 7'b1111111;
			4'b1001 :    		//Hexadecimal 9
				out = 7'b1101111;
			4'b1010 :  		// Hexadecimal A
				out = 7'b1110111; 
			4'b1011 : 		// Hexadecimal B
				out = 7'b1111100;
			4'b1100 :		// Hexadecimal C
				out = 7'b0111001;
			4'b1101 :		// Hexadecimal D
				out = 7'b1011110;
			4'b1110 :		// Hexadecimal E
				out = 7'b1111001;
			4'b1111 :		// Hexadecimal F
				out = 7'b1110001;
	endcase
	end
endmodule


module testbench;

	wire[6:0] out;
	reg[3:0] inp;
	seg_disp sd(inp, out);

	initial begin

	$dumpfile("vcd/SevenSegment.vcd");
	$dumpvars(0,testbench);
	$display("input\t\toutput");
	$monitor("%b\t%b",inp,out);
		#10
		inp = 4'b0000;  
		#10
		inp = 4'b0001;
		#10
		inp = 4'b0010;
		#10
		inp = 4'b0011;
		#10
		inp = 4'b0100;
		#10
		inp = 4'b0101;
		#10
		inp = 4'b0110;
		#10
		inp = 4'b0111;
		#10
		inp = 4'b1000;
		#10
		inp = 4'b1001;
		#10
		inp = 4'b1010;
		#10
		inp = 4'b1011;
		#10
		inp = 4'b1100;
		#10
		inp = 4'b1101;
		#10
		inp = 4'b1110;
		#10
		inp = 4'b1111;

		$finish;
		end
endmodule






