// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module top
(
    input        clk,
    input        reset_n,
    
    input  [3:0] key_sw,
    output [3:0] led,

    output [7:0] abcdefgh,
    output [3:0] digit,

    output       buzzer,

    output       hsync,
    output       vsync,
    output [2:0] rgb
);

    assign buzzer    = 1'b0;
    assign hsync     = 1'b1;
    assign vsync     = 1'b1;
    assign rgb       = 3'b0;

    reg  [31:0] a;
    reg  [31:0] b;

    always @*
    begin
        case (~ key_sw [3:1])
        3'b000:
        begin
                 a = 32'b0_00000000_00000000000000000000000;  // 00000000 0.000000
                 b = 32'b0_00000000_00000000000000000000000;  // 00000000 0.000000
            // Expected: 0_00000000_00000000000000000000000      00000000 0.000000
        end

        3'b001:
        begin
                 a = 32'b0_00000000_00000000000000000000000;  // 00000000 0.000000
                 b = 32'b0_01111111_00000000000000000000000;  // 3f800000 1.000000
            // Expected: 0_01111111_00000000000000000000000      3f800000 1.000000
        end

        3'b010:
        begin
                 a = 32'b0_01111111_00000000000000000000000;  // 3f800000 1.000000
                 b = 32'b0_01111111_00000000000000000000000;  // 3f800000 1.000000
            // Expected: 0_10000000_00000000000000000000000      40000000 2.000000
        end

        3'b011:
        begin
                 a = 32'b0_01111111_00111011111001110110110;  // 3f9df3b6 1.234000
                 b = 32'b0_10000001_01101011011001000101101;  // 40b5b22d 5.678000
            // Expected: 0_10000001_10111010010111100011010      40dd2f1a 6.912000
        end

        3'b100:
        begin
                 a = 32'b0_10100111_00011111010100000010001;  // 538fa811 1234000019456.000000
                 b = 32'b0_10000001_01101011011001000101101;  // 40b5b22d 5.678000
            // Expected: 0_10100111_00011111010100000010001      538fa811 1234000019456.000000
        end

        3'b101:
        begin
            // Testing rounding - will fail - TODO

                 a = 32'b0_01111101_11100111001111110000001;  // 3ef39f81 0.475826
                 b = 32'b0_01111001_11100001000111010001010;  // 3cf08e8a 0.029365
            // Expected: 0_01111110_00000010101010000110101      3f015435 0.505191
        end

        3'b110:
        begin
            // Testing infinity - will fail - TODO

                 a = 32'b0_11111111_00000000000000000000000;  // 7f800000 inf
                 b = 32'b0_01111001_11100001000111010001010;  // 3cf08e8a 0.029365
            // Expected: 0_11111111_00000000000000000000000      7f800000 inf
        end

        3'b111:
        begin
            // Testing Not a Number (NaN) - will fail - TODO

                 a = 32'b0_11111111_11110101011110011011110;  // 7ffabcde nan
                 b = 32'b0_01111001_11100001000111010001010;  // 3cf08e8a 0.029365
            // Expected: 0_11111111_11110101011110011011110      7ffabcde nan
        end
        endcase
    end

    wire [31:0] sum;
    wire zero, pos_inf, neg_inf, nan;

    incomplete_fp_adder adder
    (
      .a       ( a       ),
      .b       ( b       ),
      .sum     ( sum     ),
      .zero    ( zero    ),
      .pos_inf ( pos_inf ),
      .neg_inf ( neg_inf ),
      .nan     ( nan     )
    );

    seven_segment_4_digits display
    (
        .clock    ( clk                                   ),
        .reset    ( ~ reset_n                             ),
        .number   ( key_sw [0] ? sum [31:16] : sum [15:0] ),
        .abcdefgh ( abcdefgh                              ),
        .digit    ( digit                                 )
    );

    assign led = ~ { zero, pos_inf, neg_inf, nan };

endmodule
