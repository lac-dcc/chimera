// This program was cloned from: https://github.com/AngeloJacobo/FPGA_Book_Experiments
// License: MIT License

`timescale 1ns / 1ps

module binary_decoder_2x4(
	input en,
	input[1:0] a,
	output[3:0] bcode
    );
	 assign bcode[0]= en && !a[1] && !a[0],
				bcode[1]= en && !a[1] && a[0],
				bcode[2]= en && a[1] && !a[0],
				bcode[3]= en && a[1] && a[0]; 


endmodule
