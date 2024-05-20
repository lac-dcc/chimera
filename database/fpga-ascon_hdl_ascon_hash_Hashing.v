// This program was cloned from: https://github.com/phn210/fpga-ascon
// License: MIT License

module Hashing #(
    parameter r = 64,
    parameter a = 12,
    parameter b = 12,
    parameter h = 256,
    parameter l = 256,
    parameter y = 40
)(
    input       clk,
    input       rst,
    input       messagexSI,
    input       startxSI,

    output reg  hash_digestxSO,
    output      hash_readyxSO
);

    reg     [y-1:0]     message;
    reg     [31:0]      i,j;
    wire    [l-1:0]     hash_digest;
    wire                ready, hash_ready, start;
    wire                permutation_ready, permutation_start;

    // Left shift for Inputs
    always @(posedge clk) begin
        if(!rst)
            {message, i, j} <= 0;

        else begin
            if(i < y) begin
                message <= {message[y-2:0], messagexSI};
            end

            i <= i+1;
        end

        // Right Shift for encryption outputs
        if(hash_ready) begin
            if(j < l)
                hash_digestxSO <= hash_digest[j];

            j <= j + 1;
        end
    end

    assign ready = ((i>y) && (i>l) && (i>64))? 1 : 0;
    assign start = ready & startxSI;
    assign hash_readyxSO = hash_ready;

    Hash #(
        r,a,b,h,l,y
    ) d1 (
        clk,
        rst,
        message,
        start,
        hash_ready,
        hash_digest
    );
endmodule