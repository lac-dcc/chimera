// This program was cloned from: https://github.com/phn210/fpga-ascon
// License: MIT License

module SocEncryption #(
    parameter k = 128,            // Key size
    parameter r = 64,            // Rate
    parameter a = 12,             // Initialization round no.
    parameter b = 6,              // Intermediate round no.
    parameter l = 16,            // Length of associated data
    parameter y = 16             // Length of Plain Text
)(
    input       clk,
    input       rst,

    input   [3:0]   reg_inputxSS,
    input   [31:0]  inputxSI,

    input           reg_startxSS,
    input           encryption_startxSI,

    input           reg_readyxSS,
    output          encryption_readyxSO,

    input           reg_outxSS,
    output  [7:0]   cipher_tagxSO
);
    
    reg     [k-1:0]     key;      
    reg     [127:0]     nonce;
    reg     [l-1:0]     associated_data; 
    reg     [y-1:0]     plain_text;
    reg     [7:0]       i, j, o;
    wire    [y-1:0]     cipher_text;
    wire    [127:0]     tag;
    wire                ready, encryption_start, encryption_ready;

    reg     [1:0]       state;
    reg     [7:0]       data_out;

    assign ready = ((i>k) && (i>128) && (i>l) && (i>y)) ? 1 : 0;
    assign encryption_start = ready && reg_startxSS && encryption_startxSI;
    assign encryption_readyxSO = encryption_ready;
    assign cipher_tagxSO = data_out;

    // Write inputs
    always @(posedge clk) begin
        if(!rst)
            {key, nonce, associated_data, plain_text, i, j} <= 0;

        else begin
            if(i < k && reg_inputxSS[0]) begin
                key <= {key[k-9:0], inputxSI[7:0]}; 
            end

            if(i < 128 && reg_inputxSS[1]) begin
                nonce <= {nonce[119:0], inputxSI[15:8]};
            end

            if(i < l && reg_inputxSS[2]) begin
                associated_data <= {associated_data[l-9:0], inputxSI[23:16]};
            end

            if(i < y && reg_inputxSS[3]) begin
                plain_text <= {plain_text[y-9:0], inputxSI[31:24]};
            end
            
            i <= i+8;
        end
    end

    // Read outputs
    always @(posedge clk) begin
        if(!rst || encryption_start) begin
            state <= 0;
            o <= 0;
        end
        
        if(encryption_ready) begin
            case (state)
                0: begin
                    if (reg_outxSS) begin
                        o <= 0;
                        state <= 1;
                    end
                end
                    
                1: begin
                    data_out <= cipher_text[y-1-o-:8];
                    o <= o + 8;
                    if (o > y-1) begin
                        o <= 0;
                        state <= 2;
                    end
                end

                2: begin
                    data_out <= tag[127-o-:8];
                    o <= o + 8;
                    if (o > 127) begin
                        o <= 0;
                        state <= 3;
                    end
                end

                3: begin
                    state <= 0;
                end

                default: begin
                    state <= 0;
                end
            endcase
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