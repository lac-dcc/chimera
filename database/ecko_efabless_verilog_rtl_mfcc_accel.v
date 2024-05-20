// This program was cloned from: https://github.com/Lefteris-B/ecko_efabless
// License: Apache License 2.0

module mfcc_accel (
    input wire clk,
    input wire rst,
    input wire [15:0] audio_sample,
    input wire sample_valid,
    output reg [639:0] mfcc_feature, // 40 features * 16 bits = 640 bits
    output reg mfcc_valid
);

    // Signals for loading weights
    reg load_weights;
    wire [15:0] hanning_real_out;
    wire hanning_real_valid;

    // Instantiate the Hanning window real module
    hanning_window_real hanning_real (
        .clk(clk),
        .rst(rst),
        .sample_in(audio_sample),
        .sample_valid(sample_valid),
        .sample_out(hanning_real_out),
        .sample_out_valid(hanning_real_valid)
    );

    // Instantiate the Hanning window imaginary module
    wire [15:0] hanning_imag_out;
    wire hanning_imag_valid;

    hanning_window_imag hanning_imag (
        .clk(clk),
        .rst(rst),
        .sample_in(audio_sample),
        .sample_valid(sample_valid),
        .sample_out(hanning_imag_out),
        .sample_out_valid(hanning_imag_valid)
    );

    // Instantiate the periodogram module
    wire [31:0] periodogram_out;
    wire periodogram_valid;

    periodogram_squared periodogram (
        .clk(clk),
        .rst(rst),
        .sample_in_real(hanning_real_out),
        .sample_in_imag(hanning_imag_out),
        .sample_valid(hanning_real_valid), // Use the valid signal from the real Hanning window
        .periodogram_out(periodogram_out),
        .periodogram_valid(periodogram_valid)
    );

    // Instantiate the pow_module
    wire [31:0] pow_out;
    wire pow_valid;

    pow_module pow (
        .clk(clk),
        .rst(rst),
        .data_in(periodogram_out),
        .data_valid(periodogram_valid),
        .data_out(pow_out),
        .data_out_valid(pow_valid)
    );

    // Instantiate the mel_filterbank module
    wire [31:0] mel_out;
    wire mel_valid;

    mel_filterbank mel (
        .clk(clk),
        .rst(rst),
        .data_in(pow_out),
        .data_valid(pow_valid),
        .mel_out(mel_out),
        .mel_valid(mel_valid)
    );

    // Instantiate the log_module
    wire [15:0] log_out;
    wire log_valid;

    log_module log (
        .clk(clk),
        .rst(rst),
        .data_in(mel_out),
        .data_valid(mel_valid),
        .log_out(log_out),
        .log_valid(log_valid)
    );

    // Instantiate the dct_module
    wire [639:0] dct_out;
    wire dct_valid;

    dct_module dct (
        .clk(clk),
        .rst(rst),
        .data_in(log_out),
        .data_valid(log_valid),
        .dct_out(dct_out),
        .dct_valid(dct_valid)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            mfcc_feature <= 0;
            mfcc_valid <= 0;
        end else begin
            mfcc_feature <= dct_out;
            mfcc_valid <= dct_valid;
        end
    end

endmodule

