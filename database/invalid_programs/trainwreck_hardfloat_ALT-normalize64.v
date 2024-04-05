
/*----------------------------------------------------------------------------
| If `in' is zero, returns `dist' = 63 and `out' = 0.  Otherwise, returns
| normalized `in' in `out' such that `out[31]' is 1.
*----------------------------------------------------------------------------*/

module normalize64( in, dist, out );

    input  [63:0] in;
    output [5:0]  dist;
    output [63:0] out;

    wire [3:1]  reduce16s;
    wire [5:0]  dist;
    wire [63:0] normTo16;
    wire [3:1]  reduce4s;
    wire [63:0] normTo4, out;

    assign reduce16s[3] = ( in[63:48] != 0 );
    assign reduce16s[2] = ( in[47:32] != 0 );
    assign reduce16s[1] = ( in[31:16] != 0 );
    assign dist[5] = ( reduce16s[3:2] == 0 );
    assign dist[4] = ~ reduce16s[3] & ( reduce16s[2] | ~ reduce16s[1] );
    assign normTo16 =
          ( reduce16s[3]                 ? in     : 0 )
        | ( ( reduce16s[3:2] == 2'b01  ) ? in<<16 : 0 )
        | ( ( reduce16s      == 3'b001 ) ? in<<32 : 0 )
        | ( ( reduce16s      == 3'b000 ) ? in<<48 : 0 );

    assign reduce4s[3] = ( normTo16[63:60] != 0 );
    assign reduce4s[2] = ( normTo16[59:56] != 0 );
    assign reduce4s[1] = ( normTo16[55:52] != 0 );
    assign dist[3] = ( reduce4s[3:2] == 0 );
    assign dist[2] = ~ reduce4s[3] & ( reduce4s[2] | ~ reduce4s[1] );
    assign normTo4 =
          ( reduce4s[3]                 ? normTo16     : 0 )
        | ( ( reduce4s[3:2] == 2'b01  ) ? normTo16<<4  : 0 )
        | ( ( reduce4s      == 3'b001 ) ? normTo16<<8  : 0 )
        | ( ( reduce4s      == 3'b000 ) ? normTo16<<12 : 0 );

    assign dist[1] = ( normTo4[63:62] == 0 );
    assign dist[0] = ~ normTo4[63] & ( normTo4[62] | ~ normTo4[61] );
    assign out =
          ( normTo4[63]                  ? normTo4    : 0 )
        | ( ( normTo4[63:62] == 2'b01  ) ? normTo4<<1 : 0 )
        | ( ( normTo4[63:61] == 3'b001 ) ? normTo4<<2 : 0 )
        | ( ( normTo4[63:61] == 3'b000 ) ? normTo4<<3 : 0 );

endmodule

