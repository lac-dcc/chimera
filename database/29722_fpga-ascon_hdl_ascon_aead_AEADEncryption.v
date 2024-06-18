// This program was cloned from: https://github.com/phn210/fpga-ascon
// License: MIT License

module AEADEncryption #(
    parameter k = 128,            // Key size
    parameter r = 64,            // Rate
    parameter a = 12,             // Initialization round no.
    parameter b = 6,              // Intermediate round no.
    parameter l = 40,            // Length of associated data
    parameter y = 40             // Length of Plain Text
)(
    input       clk,
    input       rst,
    input       keyxSI,
    input       noncexSI,
    input       associated_dataxSI,
    input       plain_textxSI,
    input       encryption_startxSI,

    output reg  cipher_textxSO,
    output reg  tagxSO,
    output      encryption_readyxSO
);
    
    reg     [k-1:0]     key;      
    reg     [127:0]     nonce;
    reg     [l-1:0]     associated_data; 
    reg     [y-1:0]     plain_text;
    reg     [31:0]      i, j;
    wire    [y-1:0]     cipher_text;
    wire    [127:0]     tag;
    wire                ready, encryption_start, encryption_ready;

    assign ready = ((i>k) && (i>128) && (i>l) && (i>y))? 1 : 0;
    assign encryption_start = ready & encryption_startxSI;

    assign encryption_readyxSO = encryption_ready;

    // Left shift for Inputs
    always @(posedge clk) begin
        if(!rst)
            {key, nonce, associated_data, plain_text, i, j} <= 0;

        else begin
            if(i < k) begin
                key <= {key[k-2:0], keyxSI}; 
            end

            if(i < 128) begin
                nonce <= {nonce[126:0], noncexSI};
            end

            if(i < l) begin
                associated_data <= {associated_data[l-2:0], associated_dataxSI};
            end

            if(i < y) begin
                plain_text <= {plain_text[y-2:0], plain_textxSI};
            end
            
            i <= i+1;
        end

        // Right Shift for encryption outputs
        if(encryption_ready) begin
            if(j < y)
                cipher_textxSO <= cipher_text[j];
            
            if(j < 128)
                tagxSO <= tag[j];

            j <= j+1;
        end
    end
    
    Encryption #(
        k,r,a,b,l,y
    ) d1 (
        clk,
        rst,
        key, 
        nonce, 
        associated_data,
        plain_text,
        encryption_start,
        cipher_text,
        tag,          
        encryption_ready
    );
    
endmodule