/* MFP priority encoders
 * Copyright(c) 2017 Stanislav Zhelnio
 */

module priority_encoder255
(
    input      [ 255 : 0 ] in,
    output reg             detect,
    output reg [   7 : 0 ] out
);
    wire [3:0] detectL;
    wire [5:0] preoutL [3:0];
    wire [1:0] preoutM;

    //1st order entries
    priority_encoder64 e10( in[  63:0   ], detectL[0], preoutL[0] );
    priority_encoder64 e11( in[ 127:64  ], detectL[1], preoutL[1] );
    priority_encoder64 e12( in[ 191:128 ], detectL[2], preoutL[2] );
    priority_encoder64 e13( in[ 255:192 ], detectL[3], preoutL[3] );

    always @ (*)
        casez(detectL)
            default : {detect, out} = 9'b0;
            4'b0001 : {detect, out} = { 3'b100, preoutL[0] };
            4'b001? : {detect, out} = { 3'b101, preoutL[1] };
            4'b01?? : {detect, out} = { 3'b110, preoutL[2] };
            4'b1??? : {detect, out} = { 3'b111, preoutL[3] };
        endcase
endmodule

module priority_encoder64
(
    input      [ 63 : 0 ] in,
    output                detect,
    output     [  5 : 0 ] out
);
    wire [7:0] detectL;
    wire [2:0] preoutL [7:0];
    wire [2:0] preoutM;

    //3rd order entries
    priority_encoder8 e30( in[  7:0  ], detectL[0], preoutL[0] );
    priority_encoder8 e31( in[ 15:8  ], detectL[1], preoutL[1] );
    priority_encoder8 e32( in[ 23:16 ], detectL[2], preoutL[2] );
    priority_encoder8 e33( in[ 31:24 ], detectL[3], preoutL[3] );
    priority_encoder8 e34( in[ 39:32 ], detectL[4], preoutL[4] );
    priority_encoder8 e35( in[ 47:40 ], detectL[5], preoutL[5] );
    priority_encoder8 e36( in[ 55:48 ], detectL[6], preoutL[6] );
    priority_encoder8 e37( in[ 63:56 ], detectL[7], preoutL[7] );

    //2nd order entry
    priority_encoder8 e20(detectL, detect, preoutM);

    assign out = detect ? { preoutM, preoutL[preoutM] } : 6'b0;
endmodule

module priority_encoder8
(
    input       [ 7 : 0 ] in,
    output reg            detect,
    output reg  [ 2 : 0 ] out
);
    always @ (*)
        casez(in)
            default     : {detect, out} = 4'b0000;
            8'b00000001 : {detect, out} = 4'b1000;
            8'b0000001? : {detect, out} = 4'b1001;
            8'b000001?? : {detect, out} = 4'b1010;
            8'b00001??? : {detect, out} = 4'b1011;
            8'b0001???? : {detect, out} = 4'b1100;
            8'b001????? : {detect, out} = 4'b1101;
            8'b01?????? : {detect, out} = 4'b1110;
            8'b1??????? : {detect, out} = 4'b1111;
        endcase
endmodule

module priority_encoder8_r
(
    input       [ 7 : 0 ] in,
    output reg            detect,
    output reg  [ 2 : 0 ] out
);
    always @ (*)
        casez(in)
            default     : {detect, out} = 4'b0000;
            8'b???????1 : {detect, out} = 4'b1000;
            8'b??????10 : {detect, out} = 4'b1001;
            8'b?????100 : {detect, out} = 4'b1010;
            8'b????1000 : {detect, out} = 4'b1011;
            8'b???10000 : {detect, out} = 4'b1100;
            8'b??100000 : {detect, out} = 4'b1101;
            8'b?1000000 : {detect, out} = 4'b1110;
            8'b10000000 : {detect, out} = 4'b1111;
        endcase
endmodule

module priority_encoder16_r
(
    input      [  15 : 0 ] in,
    output reg             detect,
    output reg [   3 : 0 ] out
);
    wire [1:0] detectL;
    wire [2:0] preoutL [1:0];

    //1st order entries
    priority_encoder8_r e10( in[  7:0 ], detectL[0], preoutL[0] );
    priority_encoder8_r e11( in[ 15:8 ], detectL[1], preoutL[1] );

    always @ (*)
        casez(detectL)
            default : {detect, out} = 5'b0;
            2'b?1   : {detect, out} = { 2'b10, preoutL[0] };
            2'b10   : {detect, out} = { 2'b11, preoutL[1] };
        endcase
endmodule
