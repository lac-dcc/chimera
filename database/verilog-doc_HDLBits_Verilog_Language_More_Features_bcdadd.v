module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [99:0]	coutw;
    
    bcd_fadd fadd1(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(coutw[0]),
        .sum(sum[3:0])
    );
    
    genvar i;
    generate
        for(i=1;i<100;i=i+1) begin: test
            bcd_fadd faddi(
                .a(a[4*i+3:4*i]),
                .b(b[4*i+3:4*i]),
                .cin(coutw[i-1]),
                .cout(coutw[i]),
                .sum(sum[4*i+3:4*i])
            ); 
        end
    endgenerate
    
    assign	cout = coutw[99];
    
endmodule

