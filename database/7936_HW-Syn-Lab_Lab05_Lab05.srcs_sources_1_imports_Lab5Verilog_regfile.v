// This program was cloned from: https://github.com/tongplw/HW-Syn-Lab
// License: MIT License

`timescale 10ns/10ns
//-------------------------------------------------------
// File name    : regfile.v
// Title        : Register Files.
// Library      : nanoLADA
// Purpose      : Computer Architecture, Design and Verfication
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
module regfile(A, B, data, ra, rb, rw, nwr, clock);
output	[31:0]	A;
output	[31:0]	B;
input 	[31:0]	data;
input 	[4:0]	ra, rb, rw;
input			nwr;
input			clock;

reg		[31:0] regs[31:0];

assign A = regs[ra];
assign B = regs[rb];

integer i;

// register are all zero at the start
initial
begin
	for(i=0;i<32;i=i+1)
	begin
		regs[i]=0;
	end
end

always @(posedge clock)
begin
	$display("%10d - A(REG[%d]) -  %h, B(REG[%d]) -  %h\n",$time, ra,A,rb,B);
	if (nwr==0) 
	begin
		regs[rw] = data;
		$display("%10d - REG[%d] <- %h",$time, rw, data);
	end		
end

endmodule
