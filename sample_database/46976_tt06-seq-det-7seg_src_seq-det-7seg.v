// This program was cloned from: https://github.com/atharv-004/tt06-seq-det-7seg
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
*/

/*
      -- 3 --
     |       |
     4       2
     |       |
      -- 7 --
     |       |
     5       1
     |       |
      -- 6 --    . 8
*/

`define default_netname none

module tt_um_sequence_detector (
    input  wire [7:0] ui_in,    // Dedicated inputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uo_out,   // Dedicated outputs
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    reg [7:0] seg;                // 7-segment display output
    reg [1:0] PS, NS;             // State registers
    reg z;                        // Sequence detection flag

    wire x = ui_in[0];            // Extract LSB of ui_in as x

    assign uo_out = seg;          // Connect 7-segment output to dedicated output
    assign uio_out = 8'b0;        // Connect all bits of uio_out to ground

    // Replicate ena to match the width of uio_oe
    assign uio_oe = {8{ena}};

    reg [7:0] seg_test = uio_in[7:0]; // Extract 8-bit input for segment test
    reg [6:0] condition = ui_in[7:1]; // Adjusted width to match ui_in range

    // Sequential logic for segment selection and sequence detection
    always @(posedge clk) begin
        if (condition == 7'b1111111) begin // Check if condition is met
            case (seg_test) // Select segment based on input pattern
                8'b00000000 : seg <= 8'b11111101;   // display 0.
                8'b00000001 : seg <= 8'b11000001;   // display 1.
                8'b00000010 : seg <= 8'b01101111;   // display 2.
                8'b00000011 : seg <= 8'b11100111;   // display 3.
                8'b00000100 : seg <= 8'b11010011;   // display 4.
                8'b00000101 : seg <= 8'b10110111;   // display 5.
                8'b00000110 : seg <= 8'b10111111;   // display 6.
                8'b00000111 : seg <= 8'b11100001;   // display 7.
                8'b00001000 : seg <= 8'b11111111;   // display 8.
                8'b00001001 : seg <= 8'b11110111;   // display 9.
                // Additional cases for other segments
                8'b11110000 : seg <= 8'b10000000;   // glow led 1
                8'b11110001 : seg <= 8'b01000000;   // glow led 2
                8'b11110010 : seg <= 8'b00100000;   // glow led 3
                8'b11110011 : seg <= 8'b00010000;   // glow led 4
                8'b11110100 : seg <= 8'b00001000;   // glow led 5
                8'b11110101 : seg <= 8'b00000100;   // glow led 6
                8'b11110110 : seg <= 8'b00000010;   // glow led 7
                8'b11110111 : seg <= 8'b00000001;   // glow led 8
                default     : seg <= 8'b00000000;    // Default value if none of the above match
            endcase
        end else begin
            // Display '-' on 7-segment if sequence not detected, else display '8.'
            case (z)
                1'b0: seg <= 8'b00000010; // Display '-' on 7-segment (sequence not detected)
                1'b1: seg <= 8'b11111111; // Display '8.' on 7-segment (sequence detected)
            endcase;
        end
    end

    // State machine for sequence detection
    always @(posedge clk) begin
        if (!rst_n) begin
            PS <= 2'b00; // Initialize state to S0
            z <= 1'b0;   // Reset sequence detection flag
        end else begin
            if (ena) begin // Check if module is enabled
                PS <= NS; // Update state based on next state
                // Set sequence detection flag if in state S3 and x is 1
                z <= (PS == 2'b11) && (x == 1'b1);
            end
        end
    end

    // Next state logic for state machine
    always @(posedge clk) begin
        case (PS)
            2'b00: NS <= x ? 2'b01 : 2'b00; // S0, Next state is S1 if x is 1, else remain in S0
            2'b01: NS <= x ? 2'b01 : 2'b10; // S1, Next state is S1 if x is 1, else transition to S2
            2'b10: NS <= x ? 2'b01 : 2'b11; // S2, Next state is S3 if x is 0, else return to S0
            2'b11: NS <= x ? 2'b01 : 2'b00; // S3, Always return to S0
        endcase
    end

endmodule
