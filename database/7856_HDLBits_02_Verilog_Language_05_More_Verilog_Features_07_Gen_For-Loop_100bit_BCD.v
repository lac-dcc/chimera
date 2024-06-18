// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] cout_int;

	bcd_fadd bcd_fadd_0
	(
		.a(a[1*4-1:0]),
		.b(b[1*4-1:0]),
		.cin(cin),
        .cout(cout_int[0]),
		.sum(sum[1*4:0])
	);

	genvar i;

	generate
		for(i = 1; i <= 99; i = i + 1) begin: bcd_full_adders
			bcd_fadd bcd_fadd_inst
			(
				.a(a[ 4*(i+1)-1 : i*4 ]),
				.b(b[ 4*(i+1)-1 : i*4 ]),
                .cin(cout_int[i-1]),
                .cout(cout_int[i]),
				.sum(sum[ 4*(i+1)-1 : i*4 ])
			);
		end
	endgenerate

	assign cout = cout_int[99];
    

endmodule