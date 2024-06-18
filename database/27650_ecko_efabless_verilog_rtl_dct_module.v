// This program was cloned from: https://github.com/Lefteris-B/ecko_efabless
// License: Apache License 2.0

module dct_module #(
    parameter Q_L = 11, // Number of fractional bits for logarithm output
    parameter Q_D = 4,  // Number of fractional bits for DCT output
    parameter N = 32    // Size of the DCT input vector
) (
    input wire clk,
    input wire rst,
    input wire signed [15:0] data_in, // INT16 Q11
    input wire data_valid,
    output reg [639:0] dct_out, // 40 features * 16 bits = 640 bits
    output reg dct_valid
);

localparam COEFF_WIDTH = 16;
reg signed [15:0] input_buffer [0:N-1]; // INT16 Q11
reg [$clog2(N)-1:0] input_counter;
reg [5:0] output_counter;
reg signed [COEFF_WIDTH-1:0] coeff;
reg signed [Q_L+COEFF_WIDTH-1:0] mult;
reg signed [Q_L+COEFF_WIDTH-1:0] accumulator;
reg [1:0] state;

// Precompute DCT coefficients using integer arithmetic
wire signed [COEFF_WIDTH-1:0] sqrt_2_over_N = 16'h3B21; // sqrt(2/32) in Q15 format
wire signed [COEFF_WIDTH-1:0] sqrt_1_over_N = 16'h2D41; // sqrt(1/32) in Q15 format
reg signed [COEFF_WIDTH-1:0] cos_term;
reg [$clog2(N)-1:0] x;

always @(*) begin
    if (output_counter == 0) begin
        coeff = sqrt_1_over_N;
        x = 0;
        cos_term = 16'h7FFF; // Initialize to 1 in Q15 format
    end else begin
        x = (2 * input_counter + 1) * output_counter;
        cos_term = 16'h7FFF; // Initialize to 1 in Q15 format
        repeat (5) begin
            cos_term = cos_term - ((cos_term * x * x) >> 14);
            x = x << 1;
        end
        coeff = (sqrt_2_over_N * cos_term) >> 15;
    end
end

always @(posedge clk) begin
    if (rst) begin
        input_counter <= 0;
        output_counter <= 0;
        accumulator <= 0;
        dct_out <= 0;
        dct_valid <= 0;
        state <= 0;
    end else begin
        case (state)
            0: begin
                if (data_valid) begin
                    input_buffer[input_counter] <= data_in;
                    input_counter <= input_counter + 1;
                    if (input_counter == N - 1) begin
                        input_counter <= 0;
                        state <= 1;
                    end
                end
            end

            1: begin
                mult <= input_buffer[input_counter] * coeff;
                accumulator <= accumulator + mult;
                input_counter <= input_counter + 1;
                if (input_counter == N - 1) begin
                    dct_out[output_counter*16 +: 16] <= accumulator[26:11] >>> (Q_L + COEFF_WIDTH - Q_D);
                    accumulator <= 0;
                    output_counter <= output_counter + 1;
                    input_counter <= 0;
                    if (output_counter == 39) begin
                        output_counter <= 0;
                        dct_valid <= 1;
                        state <= 0;
                    end
                end
            end
        endcase
    end
end

endmodule

