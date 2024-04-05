`include "fpu_common.v"

module estNormDistPNPosSumS( a, b, out );

    parameter N = 24;
    parameter size = 50;

    localparam normDistSize = `ceilLog2( size + N );

    input  [size-1:0]         a, b;
    output [normDistSize-1:0] out;

    wire [size-1:0] key;
    reg  [normDistSize-1:0] out;
    integer i;

    assign key = ( a ^ b ) ^ ( ( a | b )<<1 );

    always @(*) begin
        out = size - 1 + N;
        for(i = 1; i < size; i = i+1)
            out = key[i] ? size - 1 - i + N : out;
    end

endmodule

