// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
//
// Create Date: 01/13/2020 01:32:24 PM
// Module Name: delay
// Description: The key to the new structure. 
//				It can delay more than a "DFF time" according to the parameter N.
//
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module delay #(parameter N=10) (req,fin);
input req;
output wire fin;

(* dont_touch="true" *) wire [N-1:0] c /*synthesis noprune*/;  
// (* dont_touch="true" *) and /*synthesis noprune*/ make it work on both Xilinx platform and Altera platform. 

reg rec=1'b0;
assign c[0]=rec;
assign fin = c[N-1];

always@(posedge req or posedge fin) begin
	if(fin) rec<=1'b0;
	else rec<=1'b1;
end

genvar i;
generate 
	for(i=1;i<N;i=i+1)
	begin:delays
		assign c[i]=rec&(c[i-1]);
	end
endgenerate

endmodule