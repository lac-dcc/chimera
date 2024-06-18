// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

module hash_acc #(
    parameter HASH_WIDTH = 36
)
(
    input  wire                         clk,
    input  wire                         rst,

    input  wire [31:0]                  hash_data,
    input  wire [1:0]                   hash_data_len,
    input  wire                         hash_data_valid,
    input  wire                         hash_clear,

    input  wire [(HASH_WIDTH+4)*8-1:0]  hash_key,

    output wire [31:0]                  hash_out
);

parameter OFFSET_WIDTH = $clog2(HASH_WIDTH);

reg [HASH_WIDTH*8-1:0] hash_data_reg = 0;
reg [OFFSET_WIDTH-1:0] offset_reg = 0;
// reg [31:0] hash_reg;

function [31:0] hash_toep(input [HASH_WIDTH*8-1:0] data, input [5:0] len, input [(HASH_WIDTH+4)*8-1:0] key);
    integer i, j;
    begin
        hash_toep = 0;
        for (i = 0; i < len; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin
                if (data[i*8 + (7-j)]) begin
                    hash_toep = hash_toep ^ key[(HASH_WIDTH+4)*8 - 32 - i*8 - j +: 32];
                end
            end
        end
    end
endfunction

wire [31:0] hash = hash_toep(hash_data_reg, HASH_WIDTH, hash_key);

assign hash_out = hash; // _reg;

always @(posedge clk) begin
    if (hash_data_valid) begin
        if (hash_data_len == 1) begin
            hash_data_reg[offset_reg*8 +: 8] <= hash_data[7:0];
            offset_reg <= offset_reg + 1;
        end else if (hash_data_len == 2) begin
            hash_data_reg[offset_reg*8 +: 16] <= hash_data[15:0];
            offset_reg <= offset_reg + 2;
        end else begin
            hash_data_reg[offset_reg*8 +: 32] <= hash_data;
            offset_reg <= offset_reg + 4;
        end
    end

    // hash_reg <= hash;

    if (rst || hash_clear) begin
        hash_data_reg <= 0;
        offset_reg <= 0;
    end
end

endmodule
