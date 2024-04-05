
/*----------------------------------------------------------------------------
| If `in' is zero, returns `dist' = 31 and `out' = 0.  Otherwise, returns
| normalized `in' in `out' such that `out[31]' is 1.
*----------------------------------------------------------------------------*/

module normalize32( in, dist, out );

    input  [31:0] in;
    output [4:0]  dist;
    output [31:0] out;

    wire [3:1]  reduce8s;
    wire [4:0]  dist;
    wire [31:0] normTo8, out;

    assign reduce8s[3] = ( in[31:24] != 0 );
    assign reduce8s[2] = ( in[23:16] != 0 );
    assign reduce8s[1] = ( in[15:8]  != 0 );
    assign dist[4] = ( reduce8s[3:2] == 0 );
    assign dist[3] = ~ reduce8s[3] & ( reduce8s[2] | ~ reduce8s[1] );
    assign normTo8 =
          ( reduce8s[3]                 ? in     : 0 )
        | ( ( reduce8s[3:2] == 2'b01  ) ? in<<8  : 0 )
        | ( ( reduce8s      == 3'b001 ) ? in<<16 : 0 )
        | ( ( reduce8s      == 3'b000 ) ? in<<24 : 0 );

    assign dist[2] = ( normTo8[31:28] == 0 );
    assign dist[1] =
        ( normTo8[31:30] == 0 )
            & ( ( normTo8[29:28] != 0 ) || ( normTo8[27:26] == 0 ) );
    assign dist[0] =
          ~ normTo8[31]
        & (   normTo8[30]
            | (   ~ normTo8[29]
                & (   normTo8[28]
                    | ( ~ normTo8[27] & ( normTo8[26] | ~ normTo8[25] ) ) )
              )
          );
    assign out =
          ( normTo8[31]                      ? normTo8    : 0 )
        | ( ( normTo8[31:30] == 2'b01      ) ? normTo8<<1 : 0 )
        | ( ( normTo8[31:29] == 3'b001     ) ? normTo8<<2 : 0 )
        | ( ( normTo8[31:28] == 4'b0001    ) ? normTo8<<3 : 0 )
        | ( ( normTo8[31:27] == 5'b00001   ) ? normTo8<<4 : 0 )
        | ( ( normTo8[31:26] == 6'b000001  ) ? normTo8<<5 : 0 )
        | ( ( normTo8[31:25] == 7'b0000001 ) ? normTo8<<6 : 0 )
        | ( ( normTo8[31:25] == 7'b0000000 ) ? normTo8<<7 : 0 );

endmodule

