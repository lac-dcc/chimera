
module estNormDistP24NegSum50( a, b, out );

    input  [49:0] a, b;
    output [6:0]  out;

    wire [49:0] key;

    assign key = ( a ^ b ) ^~ ( ( a & b )<<1 );
    assign out =
          key[49] ? 24
        : key[48] ? 25
        : key[47] ? 26
        : key[46] ? 27
        : key[45] ? 28
        : key[44] ? 29
        : key[43] ? 30
        : key[42] ? 31
        : key[41] ? 32
        : key[40] ? 33
        : key[39] ? 34
        : key[38] ? 35
        : key[37] ? 36
        : key[36] ? 37
        : key[35] ? 38
        : key[34] ? 39
        : key[33] ? 40
        : key[32] ? 41
        : key[31] ? 42
        : key[30] ? 43
        : key[29] ? 44
        : key[28] ? 45
        : key[27] ? 46
        : key[26] ? 47
        : key[25] ? 48
        : key[24] ? 49
        : key[23] ? 50
        : key[22] ? 51
        : key[21] ? 52
        : key[20] ? 53
        : key[19] ? 54
        : key[18] ? 55
        : key[17] ? 56
        : key[16] ? 57
        : key[15] ? 58
        : key[14] ? 59
        : key[13] ? 60
        : key[12] ? 61
        : key[11] ? 62
        : key[10] ? 63
        : key[9]  ? 64
        : key[8]  ? 65
        : key[7]  ? 66
        : key[6]  ? 67
        : key[5]  ? 68
        : key[4]  ? 69
        : key[3]  ? 70
        : key[2]  ? 71
        : key[1]  ? 72
        : 73;

endmodule

