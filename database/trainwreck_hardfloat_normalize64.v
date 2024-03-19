
/*----------------------------------------------------------------------------
| If `in' is zero, returns `distance' = 63 and `out' = 0.  Otherwise, returns
| normalized `in' in `out' such that `out[31]' is 1.
*----------------------------------------------------------------------------*/

module normalize64( in, distance, out );

    input  [63:0] in;
    output [5:0]  distance;
    output [63:0] out;

    wire [3:1]  reduce16s;
    wire [5:0]  distance;
    wire [63:0] normTo16;
    wire [3:1]  reduce4s;
    wire [63:0] normTo4, out;

    assign reduce16s[3] = ( in[63:48] != 0 );
    assign reduce16s[2] = ( in[47:32] != 0 );
    assign reduce16s[1] = ( in[31:16] != 0 );
    assign distance[5] = ( reduce16s[3:2] == 0 );
    assign distance[4] = ~ reduce16s[3] & ( reduce16s[2] | ~ reduce16s[1] );
    assign normTo16 =
          reduce16s[3] ? in
        : reduce16s[2] ? in<<16
        : reduce16s[1] ? in<<32
        : in<<48;

    assign reduce4s[3] = ( normTo16[63:60] != 0 );
    assign reduce4s[2] = ( normTo16[59:56] != 0 );
    assign reduce4s[1] = ( normTo16[55:52] != 0 );
    assign distance[3] = ( reduce4s[3:2] == 0 );
    assign distance[2] = ~ reduce4s[3] & ( reduce4s[2] | ~ reduce4s[1] );
    assign normTo4 =
          reduce4s[3] ? normTo16
        : reduce4s[2] ? normTo16<<4
        : reduce4s[1] ? normTo16<<8
        : normTo16<<12;

    assign distance[1] = ( normTo4[63:62] == 0 );
    assign distance[0] = ~ normTo4[63] & ( normTo4[62] | ~ normTo4[61] );
    assign out =
          normTo4[63] ? normTo4
        : normTo4[62] ? normTo4<<1
        : normTo4[61] ? normTo4<<2
        : normTo4<<3;

endmodule

