// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef seven_seg_decoder_enable
`define seven_seg_decoder_enable

module seven_seg_decoder_enable(X3, X2, X1, X0, A, B, C, D, E, F, G, EN);
    input X3, X2, X1, X0, EN;
    output A, B, C, D, E, F, G;

    assign A = ((~X3 & ~X2 & ~X1 & X0) | (~X3 & X2 & ~X1 & ~X0) | (X3 & X2 & ~X1 & X0) | (X3 & ~X2 & X1 & X0)) | ~EN;
    assign B = ((~X3 & X2 & ~X1 & X0) | (~X3 & X2 & X1 & ~X0) | (X3 & ~X2 & X1 & X0) | (X3 & X2 & ~(~X1 & X0))) | ~EN;
    assign C = ((~X3 & ~X2 & X1 & ~X0) | (X3 & X2 & (X1 | ~X0))) | ~EN;
    assign D = ((~X3 & ~X2 & ~X1 & X0) | (~X3 & X2 & ~X1 & ~X0) | (~X3 & X2 & X1 & X0) | (X3 & ~X2 & X1 & ~X0) | (X3 & X2 & X1 & X0)) | ~EN;
    assign E = ((~X3 & (~X2 | X1) & X0) | (~X3 & X2 & ~X1) | (X3 & ~X2 & ~X1 & X0)) | ~EN;
    assign F = ((~X3 & ~X2 & (X1 | X0)) | (~X3 & X2 & X1 & X0) | (X3 & X2 & ~X1 & X0)) | ~EN;
    assign G = ((~X3 & ~X2 & ~X1 & ~X0) | (~X3 & X2 & X1 & X0) | (X3 & X2 & ~X1 & ~X0) | (~X3 & ~X2 & ~X1 & X0)) | ~EN;

endmodule

`endif
