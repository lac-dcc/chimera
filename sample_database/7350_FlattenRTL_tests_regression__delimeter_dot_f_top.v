// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License


module delimeter_dot ( a,b,z );
	input  a,b;
	output z;
	bottom inst1(a, b,z);
endmodule

module bottom( i1, i2, o1 );
	input i1, i2;
	output o1;
	assign o1 = i1 & i2;
endmodule
