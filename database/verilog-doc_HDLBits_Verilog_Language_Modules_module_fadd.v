module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire cout,cout1;
    wire [15:0] sum1, sum2;
    add16 ins1(a[15:0],b[15:0],0,sum1,cout);
    add16 ins2(a[31:16],b[31:16],cout,sum2,cout1);
    assign sum = {sum2[15:0],sum1[15:0]};

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign {cout,sum} = a+b+cin;
endmodule
