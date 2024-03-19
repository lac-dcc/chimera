 module TOP( in, out );
        input [7:0] in;
        output [5:0] out;
        COUNT_BITS8 count_bits( .IN( in ), .C( out ) );
endmodule

