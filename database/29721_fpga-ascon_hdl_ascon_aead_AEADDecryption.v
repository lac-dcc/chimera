// This program was cloned from: https://github.com/phn210/fpga-ascon
// License: MIT License

module AEADDecryption #(
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
    input       cipher_textxSI,
    input       decryption_startxSI,

    output reg  plain_textxSO,
    output reg  tagxSO,
    output      decryption_readyxSO
);
    
    reg     [k-1:0]     key;      
    reg     [127:0]     nonce;
    reg     [l-1:0]     associated_data; 
    reg     [y-1:0]     cipher_text;
    reg     [31:0]      i, j;
    wire    [y-1:0]     plain_text;
    wire    [127:0]     tag;
    wire                ready, decryption_start, decryption_ready;

    // Left shift for Inputs
    always @(posedge clk) begin
        if(!rst)
            {key, nonce, associated_data, cipher_text, i, j} <= 0;

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
                cipher_text <= {cipher_text[y-2:0], cipher_textxSI};
            end
            
            i <= i+1;
        end

        // Right Shift for decryption outputs
        if(decryption_ready) begin
            if(j < y)
                plain_textxSO <= plain_text[j];
            
            if(j < 128)
                tagxSO <= tag[j];

            j <= j+1;
        end
    end

    assign ready = ((i>k) && (i>128) && (i>l) && (i>y))? 1 : 0;
    assign decryption_start = ready & decryption_startxSI;
    assign decryption_readyxSO = decryption_ready;

    Decryption #(
        k,r,a,b,l,y
    ) d2 (
        clk,
        rst,
        key,
        nonce,
        associated_data,
        cipher_text,
        decryption_start,
        plain_text,             
        tag,                     
        decryption_ready        
    );
    
endmodule