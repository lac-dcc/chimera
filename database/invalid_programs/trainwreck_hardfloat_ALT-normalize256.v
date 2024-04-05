
/*----------------------------------------------------------------------------
| If `in' is zero, returns `dist' = 255 and `out' = 0.  Otherwise, returns
| normalized `in' in `out' such that `out[255]' is 1.
*----------------------------------------------------------------------------*/

module normalize256( in, dist, out );

    input  [255:0] in;
    output [7:0]   dist;
    output [255:0] out;

    wire [3:1]   reduce64s;
    wire [7:0]   dist;
    wire [255:0] normTo64;
    wire [3:1]   reduce16s;
    wire [255:0] normTo16;
    wire [3:1]   reduce4s;
    wire [255:0] normTo4, out;

    assign reduce64s[3] = ( in[255:192] != 0 );
    assign reduce64s[2] = ( in[191:128] != 0 );
    assign reduce64s[1] = ( in[127:64]  != 0 );
    assign dist[7] = ( reduce64s[3:2] == 0 );
    assign dist[6] = ~ reduce64s[3] & ( reduce64s[2] | ~ reduce64s[1] );
    assign normTo64 =
          ( reduce64s[3]                 ? in     : 0 )
        | ( ( reduce64s[3:2] == 2'b01  ) ? in<<16 : 0 )
        | ( ( reduce64s      == 3'b001 ) ? in<<32 : 0 )
        | ( ( reduce64s      == 3'b000 ) ? in<<48 : 0 );

    assign reduce16s[3] = ( normTo64[255:240] != 0 );
    assign reduce16s[2] = ( normTo64[239:224] != 0 );
    assign reduce16s[1] = ( normTo64[223:208] != 0 );
    assign dist[5] = ( reduce16s[3:2] == 0 );
    assign dist[4] = ~ reduce16s[3] & ( reduce16s[2] | ~ reduce16s[1] );
    assign normTo16 =
          ( reduce16s[3]                 ? normTo64     : 0 )
        | ( ( reduce16s[3:2] == 2'b01  ) ? normTo64<<16 : 0 )
        | ( ( reduce16s      == 3'b001 ) ? normTo64<<32 : 0 )
        | ( ( reduce16s      == 3'b000 ) ? normTo64<<48 : 0 );

    assign reduce4s[3] = ( normTo16[255:252] != 0 );
    assign reduce4s[2] = ( normTo16[251:248] != 0 );
    assign reduce4s[1] = ( normTo16[247:244] != 0 );
    assign dist[3] = ( reduce4s[3:2] == 0 );
    assign dist[2] = ~ reduce4s[3] & ( reduce4s[2] | ~ reduce4s[1] );
    assign normTo4 =
          ( reduce4s[3]                 ? normTo16     : 0 )
        | ( ( reduce4s[3:2] == 2'b01  ) ? normTo16<<4  : 0 )
        | ( ( reduce4s      == 3'b001 ) ? normTo16<<8  : 0 )
        | ( ( reduce4s      == 3'b000 ) ? normTo16<<12 : 0 );

    assign dist[1] = ( normTo4[255:254] == 0 );
    assign dist[0] = ~ normTo4[255] & ( normTo4[254] | ~ normTo4[253] );
    assign out =
          ( normTo4[255]                   ? normTo4    : 0 )
        | ( ( normTo4[255:254] == 2'b01  ) ? normTo4<<1 : 0 )
        | ( ( normTo4[255:253] == 3'b001 ) ? normTo4<<2 : 0 )
        | ( ( normTo4[255:253] == 3'b000 ) ? normTo4<<3 : 0 );

endmodule

