// This program was cloned from: https://github.com/phn210/fpga-ascon
// License: MIT License

module AEAD #(
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
    input       decryption_startxSI,
    input       r_128xSI,
    input       r_ptxSI,

    output reg  cipher_textxSO,
    output reg  plain_textxSO,
    output reg  tagxSO, dec_tagxSO,      
    output      encryption_readyxSO,
    output      decryption_readyxSO,
    output      message_authentication
);
    
    reg     [k-1:0]     key;      
    reg     [127:0]     nonce;
    reg     [l-1:0]     associated_data; 
    reg     [y-1:0]     plain_text;
    reg     [127:0]     random_dec_1;
    reg     [y-1:0]     random_dec_2;
    reg     [31:0]      i, j, m;
    wire    [y-1:0]     dec_plain_text;
    wire    [y-1:0]     cipher_text;
    wire    [127:0]     tag, dec_tag;
    wire                ready, 
                        encryption_start, encryption_ready,
                        decryption_start, decryption_ready;
    wire                permutation_ready, permutation_start;

    // Left shift for Inputs
    always @(posedge clk) begin
        if(!rst)
            {key, nonce, associated_data, plain_text, i, j, m} <= 0;

        else begin
            if(i < k) begin
                key <= {key[k-2:0], keyxSI}; 
            end

            if(i < 128) begin
                nonce <= {nonce[126:0], noncexSI};
                random_dec_1 <= {random_dec_1[126:0], r_128xSI};
            end

            if(i < l) begin
                associated_data <= {associated_data[l-2:0], associated_dataxSI};
            end

            if(i < y) begin
                plain_text <= {plain_text[y-2:0], plain_textxSI};
                random_dec_2 <= {random_dec_2[y-2:0], r_ptxSI};
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

        // Right Shift for decryption outputs
        if(decryption_ready) begin
            if(message_authentication) begin
                if(m < y)
                    plain_textxSO <= dec_plain_text[m];
                
                if(m < 128)
                    dec_tagxSO <= dec_tag[m];

                m <= m+1;
            end
            // If message is not authenticated, then a random message is outputted
            else begin
               if(m < y)
                    plain_textxSO <= random_dec_2[m];
                
                if(m < 128)
                    dec_tagxSO <= random_dec_1[m];

                m <= m+1; 
            end
        end
    end

    assign ready = ((i>k) && (i>128) && (i>l) && (i>y))? 1 : 0;
    assign encryption_start = ready & encryption_startxSI;
    assign decryption_start = ready & decryption_startxSI;

    assign encryption_readyxSO = encryption_ready;
    assign decryption_readyxSO = decryption_ready;

    assign message_authentication = (decryption_ready)? (dec_tag == tag): 0;
    
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
        dec_plain_text,             
        dec_tag,                     
        decryption_ready        
    );
    
endmodule