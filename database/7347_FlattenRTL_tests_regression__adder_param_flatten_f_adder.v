// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module TopModule (
        input [7:0] a1,
        input [7:0] b1,
        input [15:0] a2,
        input [15:0] b2,
        output [7:0] sum1,
        output [15+1:0] sum2) ;

    wire [ 8 -1:0] adder1_a;
    wire [ 8 -1:0] adder1_b;
    wire [ 8 -1+ 0 :0] adder1_sum;
    wire [ 16 -1:0] adder2_a;
    wire [ 16 -1:0] adder2_b;
    wire [ 16 -1+ 1 :0] adder2_sum;

    assign   adder1_sum  =(  adder1_a  +  adder1_b  )<<  0  ;



    assign   adder2_sum  =(  adder2_a  +  adder2_b  )<<  1  ;
    assign adder1_a = a1;
    assign adder1_b = b1;
    assign sum1 = adder1_sum;
    assign adder2_a = a2;
    assign adder2_b = b2;
    assign sum2 = adder2_sum;

endmodule
