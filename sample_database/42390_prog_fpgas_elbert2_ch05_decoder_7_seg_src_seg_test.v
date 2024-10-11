// This program was cloned from: https://github.com/simonmonk/prog_fpgas
// License: MIT License

module seg_test(
   input CLK,
   input [3:0] D,
   output [7:0] SEG,
   output [2:0]DIGIT
   );	
	
assign DIGIT = 3'b110;

decoder_7_seg decoder(.CLK (CLK), .SEG	(SEG), .D (D));  

endmodule