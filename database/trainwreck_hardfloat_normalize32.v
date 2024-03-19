
/*----------------------------------------------------------------------------
| If `in' is zero, returns `distance' = 31 and `out' = 0.  Otherwise, returns
| normalized `in' in `out' such that `out[31]' is 1.
*----------------------------------------------------------------------------*/

module normalize32( in, distance, out );

    input  [31:0] in;
    output [4:0]  distance;
    output [31:0] out;

    wire [3:1]  reduce8s;
    wire [4:0]  distance;
    wire [31:0] normTo8, out;

    assign reduce8s[3] = ( in[31:24] != 0 );
    assign reduce8s[2] = ( in[23:16] != 0 );
    assign reduce8s[1] = ( in[15:8]  != 0 );
    assign distance[4] = ( reduce8s[3:2] == 0 );
    assign distance[3] = ~ reduce8s[3] & ( reduce8s[2] | ~ reduce8s[1] );
    assign normTo8 =
          reduce8s[3] ? in
        : reduce8s[2] ? in<<8
        : reduce8s[1] ? in<<16
        : in<<24;

    assign distance[2] = ( normTo8[31:28] == 0 );
    assign distance[1] =
        ( normTo8[31:30] == 0 )
            & ( ( normTo8[29:28] != 0 ) || ( normTo8[27:26] == 0 ) );
    assign distance[0] =
          ~ normTo8[31]
        & (   normTo8[30]
            | (   ~ normTo8[29]
                & (   normTo8[28]
                    | ( ~ normTo8[27] & ( normTo8[26] | ~ normTo8[25] ) ) )
              )
          );
    assign out =
          normTo8[31] ? normTo8
        : normTo8[30] ? normTo8<<1
        : normTo8[29] ? normTo8<<2
        : normTo8[28] ? normTo8<<3
        : normTo8[27] ? normTo8<<4
        : normTo8[26] ? normTo8<<5
        : normTo8[25] ? normTo8<<6
        : normTo8<<7;

endmodule

