module de10_lite
(
    input               ADC_CLK_10,
    input               MAX10_CLK1_50,
    input               MAX10_CLK2_50,

    output  [  7:0 ]    HEX0,
    output  [  7:0 ]    HEX1,
    output  [  7:0 ]    HEX2,
    output  [  7:0 ]    HEX3,
    output  [  7:0 ]    HEX4,
    output  [  7:0 ]    HEX5,

    input   [  1:0 ]    KEY,
    output  [  9:0 ]    LEDR,
    input   [  9:0 ]    SW,
    inout   [ 35:0 ]    GPIO
);

    // SPI bus
    wire        cs;
    wire        sck;
    wire        sdo;

    // ALS connection table
    // PIN     GPIO     ALS   direction
    // ==== ========== ===== ===========
    //  29   VCC        VCC
    //  31   GPIO[26]   GND   output
    //  33   GPIO[28]   SCK   output
    //  35   GPIO[30]   SDO   input
    //  37   GPIO[32]   NC    hiZ
    //  39   GPIO[34]   CS    output

    assign GPIO[26] = 1'b0;
    assign GPIO[28] = sck;
    assign sdo      = GPIO[30];
    assign GPIO[32] = 1'bz;
    assign GPIO[34] = cs;

    // global signals
    wire clk   = MAX10_CLK1_50;
    wire rst_n = KEY[0];

    // sensor value
    wire  [7:0] value;

    //sensor
    pmod_als 
        #( .QUERY_DELAY(1 << 21) )
    als
    (
        .clk    ( clk   ),
        .rst_n  ( rst_n ),
        .cs     ( cs    ),
        .sck    ( sck   ),
        .sdo    ( sdo   ),
        .value  ( value )
    );

    //outputs
    assign LEDR[0]   = ~cs;
    assign LEDR[9:1] = 8'b0;

    wire [ 31:0 ] h7segment = { 16'b0, value };

    assign HEX0 [7] = 1'b1;
    assign HEX1 [7] = 1'b1;
    assign HEX2 [7] = 1'b1;
    assign HEX3 [7] = 1'b1;
    assign HEX4 [7] = 1'b1;
    assign HEX5 [7] = 1'b1;

    hex_display digit_5 ( h7segment [23:20] , HEX5 [6:0] );
    hex_display digit_4 ( h7segment [19:16] , HEX4 [6:0] );
    hex_display digit_3 ( h7segment [15:12] , HEX3 [6:0] );
    hex_display digit_2 ( h7segment [11: 8] , HEX2 [6:0] );
    hex_display digit_1 ( h7segment [ 7: 4] , HEX1 [6:0] );
    hex_display digit_0 ( h7segment [ 3: 0] , HEX0 [6:0] );

endmodule
