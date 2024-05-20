// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module adder_4bit(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
    );

    assign {cout, sum} = a + b + cin;

endmodule

module adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
    );

    wire carry;
    adder_4bit lower_half(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(sum[3:0]),
        .cout(carry) 
    );
    adder_4bit upper_half(
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(carry), 
        .sum(sum[7:4]),
        .cout(cout) 
    );
endmodule

module  adder_16bit(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
    );

    wire carry;
    adder_8bit lower_half(
        .a(a[7:0]),
        .b(b[7:0]),
        .cin(cin),
        .sum(sum[7:0]),
        .cout(carry) 
    );
    adder_8bit upper_half(
        .a(a[15:8]),
        .b(b[15:8]),
        .cin(carry), 
        .sum(sum[15:8]),
        .cout(cout) 
    );
endmodule

module adder_32bit(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
    );

    wire carry;
    adder_16bit lower_half(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(cin),
        .sum(sum[15:0]),
        .cout(carry) 
    );
    adder_16bit upper_half(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry), 
        .sum(sum[31:16]),
        .cout(cout) 
    );
endmodule
