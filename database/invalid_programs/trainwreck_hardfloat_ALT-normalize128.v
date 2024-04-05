
/*----------------------------------------------------------------------------
| If `in' is zero, returns `dist' = 127 and `out' = 0.  Otherwise, returns
| normalized `in' in `out' such that `out[127]' is 1.
*----------------------------------------------------------------------------*/

module normalize128( in, dist, out );

    input  [127:0] in;
    output [6:0]   dist;
    output [127:0] out;

    wire [3:1]   reduce32s;
    wire [6:0]   dist;
    wire [127:0] normTo32;
    wire [3:1]   reduce8s;
    wire [127:0] normTo8, out;

    assign reduce32s[3] = ( in[127:96] != 0 );
    assign reduce32s[2] = ( in[95:64]  != 0 );
    assign reduce32s[1] = ( in[63:32]  != 0 );
    assign dist[6] = ( reduce32s[3:2] == 0 );
    assign dist[5] = ~ reduce32s[3] & ( reduce32s[2] | ~ reduce32s[1] );
    assign normTo32 =
          ( reduce32s[3]                 ? in     : 0 )
        | ( ( reduce32s[3:2] == 2'b01  ) ? in<<32 : 0 )
        | ( ( reduce32s      == 3'b001 ) ? in<<64 : 0 )
        | ( ( reduce32s      == 3'b000 ) ? in<<96 : 0 );

    assign reduce8s[3] = ( normTo32[127:120] != 0 );
    assign reduce8s[2] = ( normTo32[119:112] != 0 );
    assign reduce8s[1] = ( normTo32[111:104] != 0 );
    assign dist[4] = ( reduce8s[3:2] == 0 );
    assign dist[3] = ~ reduce8s[3] & ( reduce8s[2] | ~ reduce8s[1] );
    assign normTo8 =
          ( reduce8s[3]                 ? normTo32     : 0 )
        | ( ( reduce8s[3:2] == 2'b01  ) ? normTo32<<8  : 0 )
        | ( ( reduce8s      == 3'b001 ) ? normTo32<<16 : 0 )
        | ( ( reduce8s      == 3'b000 ) ? normTo32<<24 : 0 );

    assign dist[2] = ( normTo8[127:124] == 0 );
    assign dist[1] =
        ( normTo8[127:126] == 0 )
            & ( ( normTo8[125:124] != 0 ) || ( normTo8[123:122] == 0 ) );
    assign dist[0] =
          ~ normTo8[127]
        & (   normTo8[126]
            | (   ~ normTo8[125]
                & (   normTo8[124]
                    | ( ~ normTo8[123] & ( normTo8[122] | ~ normTo8[121] ) ) )
              )
          );
    assign out =
          ( normTo8[127]                       ? normTo8    : 0 )
        | ( ( normTo8[127:126] == 2'b01      ) ? normTo8<<1 : 0 )
        | ( ( normTo8[127:125] == 3'b001     ) ? normTo8<<2 : 0 )
        | ( ( normTo8[127:124] == 4'b0001    ) ? normTo8<<3 : 0 )
        | ( ( normTo8[127:123] == 5'b00001   ) ? normTo8<<4 : 0 )
        | ( ( normTo8[127:122] == 6'b000001  ) ? normTo8<<5 : 0 )
        | ( ( normTo8[127:121] == 7'b0000001 ) ? normTo8<<6 : 0 )
        | ( ( normTo8[127:121] == 7'b0000000 ) ? normTo8<<7 : 0 );

endmodule

