// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module adder_32bit(
        a,
        b,
        sum
    );
    input [31:0] a;
    input [31:0] b;
    output [31:0] sum;
    wire [15:0] \add_high.a ;
    wire [15:0] \add_high.b ;
    wire [15:0] \add_high.sum ;
    wire [7:0] \add_high.add_high.a ;
    wire [7:0] \add_high.add_high.b ;
    wire [7:0] \add_high.add_high.sum ;
    wire [7:0] \add_high.add_low.a ;
    wire [7:0] \add_high.add_low.b ;
    wire [7:0] \add_high.add_low.sum ;
    wire [15:0] \add_low.a ;
    wire [15:0] \add_low.b ;
    wire [15:0] \add_low.sum ;
    wire [7:0] \add_low.add_high.a ;
    wire [7:0] \add_low.add_high.b ;
    wire [7:0] \add_low.add_high.sum ;
    wire [7:0] \add_low.add_low.a ;
    wire [7:0] \add_low.add_low.b ;
    wire [7:0] \add_low.add_low.sum ;
    assign \add_high.a  = a[31:16];
    assign \add_high.b  = b[31:16];
    assign sum[31:16] = \add_high.sum ;
    assign \add_high.add_high.a  = \add_high.a [15:8];
    assign \add_high.add_high.b  = \add_high.b [15:8];
    assign \add_high.sum [15:8] = \add_high.add_high.sum ;
    assign \add_high.add_high.sum  = ( \add_high.add_high.a  + \add_high.add_high.b  );
    assign \add_high.add_low.a  = \add_high.a [7:0];
    assign \add_high.add_low.b  = \add_high.b [7:0];
    assign \add_high.sum [7:0] = \add_high.add_low.sum ;
    assign \add_high.add_low.sum  = ( \add_high.add_low.a  + \add_high.add_low.b  );
    assign \add_low.a  = a[15:0];
    assign \add_low.b  = b[15:0];
    assign sum[15:0] = \add_low.sum ;
    assign \add_low.add_high.a  = \add_low.a [15:8];
    assign \add_low.add_high.b  = \add_low.b [15:8];
    assign \add_low.sum [15:8] = \add_low.add_high.sum ;
    assign \add_low.add_high.sum  = ( \add_low.add_high.a  + \add_low.add_high.b  );
    assign \add_low.add_low.a  = \add_low.a [7:0];
    assign \add_low.add_low.b  = \add_low.b [7:0];
    assign \add_low.sum [7:0] = \add_low.add_low.sum ;
    assign \add_low.add_low.sum  = ( \add_low.add_low.a  + \add_low.add_low.b  );
endmodule 


