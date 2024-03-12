module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [3:0] cout_temp;
    
    bcd_fadd u_bcd_fadd(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(cout_temp[0]),
        .sum(sum[3:0])
    );

    generate
    	genvar i;
    	for(i=1; i<4; i++) 
    	begin : adding
    		bcd_fadd u_bcd_fadd(
    				.a(a[4*i+3 : 4*i]),
    				.b(b[4*i+3 : 4*i]),
    				.cin(cout_temp[i-1]),
    				.cout(cout_temp[i]),
    				.sum(sum[4*i+3 : 4*i])
    			);	
    	end
    endgenerate

    assign cout = cout_temp[3];
    
endmodule
