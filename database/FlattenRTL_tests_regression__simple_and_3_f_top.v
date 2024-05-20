// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License



module simple_and_3 ( in1, in2, out1 );
parameter N1 = 4;
parameter N2 = N1 + 1;
input [N2:0]in1, in2;
output [0:N2]out1;

	mid inst1(in1[0], in2[0], out1[0]);
	mid inst2(in1[1], in2[1], out1[1]);
	mid inst3(in1[2], in2[2], out1[2]);
	bottom inst4(in1[3], in2[3], out1[3]);
	bottom2 inst5(in1[5:4], out1[4:5]);
endmodule


module bottom2( i1, o1 );
	input [1:0]i1;
	output [0:1]o1;
	reg [0:1]o1;

	always@ (posedge i1)
	begin : l1
		#10 o1 = #20 i1;
	end
endmodule


module mid( a, b, z );
	input  a;
	input  b;
	output  z;
	bottom inst1(a, b, z);
endmodule

module bottom( i1, i2, o1 );
	input i1, i2;
	output o1;
	reg o1;
	wire w1 = 1'b1;
	always @( i1 or i2 )
		o1 = i1 ? i1 : i2;
endmodule
