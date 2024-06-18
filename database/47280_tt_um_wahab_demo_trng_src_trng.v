// This program was cloned from: https://github.com/abbdulwahab86/tt_um_wahab_demo_trng
// License: Apache License 2.0

`timescale 1ns / 1ps

module ring_oscillator (
    input clk,  // System clock
    input n_reset,
    output reg random_bit
);

    // Ring oscillator components
    reg [2:0] ring;  // 3-stage ring oscillator

    // Generate ring oscillator
    always @(posedge clk or posedge !n_reset) begin
        if (!n_reset) begin
            ring <= 3'b001;  // Initial state
        end else begin
            ring[0] <= ring[2];
            ring[1] <= ring[0];
            ring[2] <= ~ring[1];  // Oscillate
        end
    end

    // Capture one bit of randomness from the ring oscillator
    always @(posedge clk) begin
        random_bit <= ring[0];
    end
endmodule

module trng (
    input clk,  // System clock
    input n_reset,
    output reg [7:0] random_byte
);

    reg [7:0] shift_reg;
    wire random_bit;

    // Instantiate the ring oscillator
    ring_oscillator ro (
        .clk(clk),
        .reset(!n_reset),
        .random_bit(random_bit)
    );

    // Shift the random bit into the shift register to form a random byte
    always @(posedge clk or posedge !n_reset) begin
        if (!n_reset) begin
            shift_reg <= 8'b0;
        end else begin
            shift_reg <= {shift_reg[6:0], random_bit};
        end
    end

    // Output the random byte
    always @(posedge clk or posedge !n_reset) begin
        if (!n_reset) begin
            random_byte <= 8'b0;
        end else begin
            random_byte <= shift_reg;
        end
    end
endmodule
