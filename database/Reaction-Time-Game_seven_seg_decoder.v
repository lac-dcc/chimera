// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

module seven_seg_decoder(X3, X2, X1, X0, A, B, C, D, E, F, G);
    input X3, X2, X1, X0;
    output A, B, C, D, E, F, G;

    assign A = (~X3 & ~X2 & ~X1 & X0) | (~X3 & X2 & ~X1 & ~X0) | (X3 & X2 & ~X1 & X0) | (X3 & ~X2 & X1 & X0);
    assign B = (~X3 & X2 & ~X1 & X0) | (~X3 & X2 & X1 & ~X0) | (X3 & ~X2 & X1 & X0) | (X3 & X2 & ~(~X1 & X0));
    assign C = (~X3 & ~X2 & X1 & ~X0) | (X3 & X2 & (X1 | ~X0));
    assign D = (~X3 & ~X2 & ~X1 & X0) | (~X3 & X2 & ~X1 & ~X0) | (~X3 & X2 & X1 & X0) | (X3 & ~X2 & X1 & ~X0) | (X3 & X2 & X1 & X0);
    assign E = (~X3 & (~X2 | X1) & X0) | (~X3 & X2 & ~X1) | (X3 & ~X2 & ~X1 & X0);
    assign F = (~X3 & ~X2 & (X1 | X0)) | (~X3 & X2 & X1 & X0) | (X3 & X2 & ~X1 & X0);
    assign G = (~X3 & ~X2 & ~X1 & ~X0) | (~X3 & X2 & X1 & X0) | (X3 & X2 & ~X1 & ~X0) | (~X3 & ~X2 & ~X1 & X0);

endmodule