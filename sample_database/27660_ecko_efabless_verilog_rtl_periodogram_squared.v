// This program was cloned from: https://github.com/Lefteris-B/ecko_efabless
// License: Apache License 2.0

module periodogram_squared (
    input wire clk,
    input wire rst,
    input wire signed [15:0] sample_in_real, // INT16 Q15
    input wire signed [15:0] sample_in_imag, // INT16 Q15
    input wire sample_valid,
    output reg signed [31:0] periodogram_out, // INT32 Q30
    output reg periodogram_valid
);

localparam NF = 512; // Power-of-two size for FFT
localparam Q = 15; // Number of fractional bits

reg signed [15:0] sample_buffer_real [0:NF-1];
reg signed [15:0] sample_buffer_imag [0:NF-1];
reg [$clog2(NF)-1:0] sample_count;
reg [3:0] fft_stage;
reg [$clog2(NF)-1:0] fft_index;
reg signed [15:0] fft_buffer_real [0:NF-1];
reg signed [15:0] fft_buffer_imag [0:NF-1];
reg signed [15:0] mult_real;
reg signed [15:0] mult_imag;

// Bit-reversed indexing
wire [$clog2(NF)-1:0] bit_reversed_index;
assign bit_reversed_index[0] = fft_index[$clog2(NF)-1];
assign bit_reversed_index[1] = fft_index[$clog2(NF)-2];
assign bit_reversed_index[2] = fft_index[$clog2(NF)-3];
assign bit_reversed_index[3] = fft_index[$clog2(NF)-4];
assign bit_reversed_index[4] = fft_index[$clog2(NF)-5];
assign bit_reversed_index[5] = fft_index[$clog2(NF)-6];
assign bit_reversed_index[6] = fft_index[$clog2(NF)-7];
assign bit_reversed_index[7] = fft_index[$clog2(NF)-8];
assign bit_reversed_index[8] = fft_index[$clog2(NF)-9];

// Twiddle factor calculation
wire [15:0] twiddle_real;
wire [15:0] twiddle_imag;
assign twiddle_real = (fft_stage == 0 || fft_index == 0) ? 16'h7FFF :
                      (fft_stage == 1) ? (fft_index[0] ? -16'h5A82 : 16'h7FFF) :
                      (fft_stage == 2) ? (fft_index[1:0] == 2'b00 ? 16'h7FFF :
                                          fft_index[1:0] == 2'b01 ? 16'h5A82 :
                                          fft_index[1:0] == 2'b10 ? 16'h0000 : -16'h5A82) :
                      (fft_stage == 3) ? (fft_index[2:0] == 3'b000 ? 16'h7FFF :
                                          fft_index[2:0] == 3'b001 ? 16'h7642 :
                                          fft_index[2:0] == 3'b010 ? 16'h5A82 :
                                          fft_index[2:0] == 3'b011 ? 16'h30FC :
                                          fft_index[2:0] == 3'b100 ? 16'h0000 :
                                          fft_index[2:0] == 3'b101 ? -16'h30FC :
                                          fft_index[2:0] == 3'b110 ? -16'h5A82 : -16'h7642) :
                      16'h0000;

assign twiddle_imag = (fft_stage == 0 || fft_index == 0) ? 16'h0000 :
                      (fft_stage == 1) ? (fft_index[0] ? -16'h5A82 : 16'h0000) :
                      (fft_stage == 2) ? (fft_index[1:0] == 2'b00 ? 16'h0000 :
                                          fft_index[1:0] == 2'b01 ? -16'h5A82 :
                                          fft_index[1:0] == 2'b10 ? -16'h7FFF : -16'h5A82) :
                      (fft_stage == 3) ? (fft_index[2:0] == 3'b000 ? 16'h0000 :
                                          fft_index[2:0] == 3'b001 ? -16'h30FC :
                                          fft_index[2:0] == 3'b010 ? -16'h5A82 :
                                          fft_index[2:0] == 3'b011 ? -16'h7642 :
                                          fft_index[2:0] == 3'b100 ? -16'h7FFF :
                                          fft_index[2:0] == 3'b101 ? -16'h7642 :
                                          fft_index[2:0] == 3'b110 ? -16'h5A82 : -16'h30FC) :
                      16'h0000;

always @(posedge clk) begin
    if (rst) begin
        sample_count <= 0;
        fft_stage <= 0;
        fft_index <= 0;
        periodogram_valid <= 0;
    end else begin
        if (sample_valid) begin
            sample_buffer_real[sample_count] <= sample_in_real;
            sample_buffer_imag[sample_count] <= sample_in_imag;
            sample_count <= sample_count + 1;
            if (sample_count == NF-1) begin
                // Start FFT
                fft_stage <= 0;
                fft_index <= 0;
            end
        end else if (fft_index < NF) begin
            // Load samples into FFT buffer in bit-reversed order
            fft_buffer_real[fft_index] <= sample_buffer_real[bit_reversed_index];
            fft_buffer_imag[fft_index] <= sample_buffer_imag[bit_reversed_index];
            fft_index <= fft_index + 1;
        end else if (fft_stage < 4) begin
            // Perform butterfly operation
            integer i;
            for (i = 0; i < NF/2; i = i + 1) begin
                if ((i & (1 << fft_stage)) == 0) begin
                    mult_real = (twiddle_real * fft_buffer_real[i + (1 << fft_stage)] - twiddle_imag * fft_buffer_imag[i + (1 << fft_stage)]) >>> Q;
                    mult_imag = (twiddle_real * fft_buffer_imag[i + (1 << fft_stage)] + twiddle_imag * fft_buffer_real[i + (1 << fft_stage)]) >>> Q;
                    fft_buffer_real[i + (1 << fft_stage)] <= fft_buffer_real[i] - mult_real;
                    fft_buffer_imag[i + (1 << fft_stage)] <= fft_buffer_imag[i] - mult_imag;
                    fft_buffer_real[i] <= fft_buffer_real[i] + mult_real;
                    fft_buffer_imag[i] <= fft_buffer_imag[i] + mult_imag;
                end
            end
            fft_stage <= fft_stage + 1;
        end else begin
            // Calculate squared magnitude
            periodogram_out <= (fft_buffer_real[fft_index] * fft_buffer_real[fft_index] + fft_buffer_imag[fft_index] * fft_buffer_imag[fft_index]) >>> Q;
            periodogram_valid <= 1;
            fft_index <= fft_index + 1;
            if (fft_index == NF-1) begin
                fft_index <= 0;
                fft_stage <= 0;
                periodogram_valid <= 0;
            end
        end
    end
end

endmodule
