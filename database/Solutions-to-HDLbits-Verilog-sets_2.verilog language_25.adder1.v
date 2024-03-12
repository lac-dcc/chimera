module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout_lo;
    wire [15:0] sum_lo;
    wire [15:0] sum_hi;
    wire cout;
    wire cin_lo;
    
    add16 add16_lo(
        .a({a[15:0]}),
        .b({b[15:0]}),
        .cin(cin_lo),
        .sum(sum_lo),
        .cout(cout_lo)
    );
    add16 add16_hi(
        .a({a[31:16]}),
        .b({b[31:16]}),
        .cin(cout_lo),
        .sum(sum_hi),
        .cout(cout)
    );
    assign sum = {sum_hi, sum_lo};

endmodule
