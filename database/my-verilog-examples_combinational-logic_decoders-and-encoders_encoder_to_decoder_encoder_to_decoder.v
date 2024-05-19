// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// Combining the encoder-8-3 to the decoder-3-8 to prove the input will equal the output.

module encoder_to_decoder_structural(
    input     [7:0] in,      // 8 Inputs
    output    [7:0] out      // 8 Outputs
);

    wire [7:0] connect;

    // ENCODER
    encoder_8_3_behavioral encoder_8_3 (
        .in(in),
        .out(connect)
    );

    // DECODER
    decoder_3_8_behavioral decoder_3_8 (
        .in(connect),
        .out(out)
    );

endmodule
