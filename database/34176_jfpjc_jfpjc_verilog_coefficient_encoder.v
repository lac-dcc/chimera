// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

/**
 * Last paragraph of F.1.2.1.1 tells us how to convert coefficient values to coded values
 *
 * length = 1, values [ -1,  -1] --> [  0,   0]
 *             values [  1,   1] --> [  1,   1]
 *
 * length = 2, values [ -3,  -2] --> [  0,   1]
 *             values [  2,   3] --> [  2,   3]
 *
 * length = 3, values [ -7,  -4] --> [  0,   3]
 *             values [  4,   7] --> [  4,   7]
 *
 */
module coefficient_encoder(input signed [15:0] coefficient,
                           output reg [15:0] coded_value,
                           output reg  [3:0] coded_value_length);
    reg [15:0] absolute_value;

    always @* begin
        absolute_value = (coefficient[15] == 1'b1) ? (-coefficient) : (coefficient);
    end

    integer i;
    always @* begin
        if (absolute_value == 16'h0) begin
            coded_value = 16'hxxxx;
            coded_value_length = 4'h0;
        end else begin
            coded_value_length = 'h0;

            // just gonna unroll this loop myself? yosys complains about the index variable i being
            // an inferred latch...
            coded_value_length = 0;
            if (absolute_value[0]) coded_value_length = 1;
            if (absolute_value[1]) coded_value_length = 2;
            if (absolute_value[2]) coded_value_length = 3;
            if (absolute_value[3]) coded_value_length = 4;
            if (absolute_value[4]) coded_value_length = 5;
            if (absolute_value[5]) coded_value_length = 6;
            if (absolute_value[6]) coded_value_length = 7;
            if (absolute_value[7]) coded_value_length = 8;
            if (absolute_value[8]) coded_value_length = 9;
            if (absolute_value[9]) coded_value_length = 10;
            if (absolute_value[10]) coded_value_length = 11;
            if (absolute_value[11]) coded_value_length = 12;
            if (absolute_value[12]) coded_value_length = 13;
            if (absolute_value[13]) coded_value_length = 14;
            if (absolute_value[14]) coded_value_length = 15;

            if (coefficient[15]) begin
                coded_value = coefficient + ((1 << coded_value_length) - 16'h1);
            end else begin
                coded_value = coefficient;
            end
        end
    end
endmodule
