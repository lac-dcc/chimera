// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

// Note:
//      BLOCK_WIDTH must be power of 2
module cnt_block #(
    parameter   BLOCK_WIDTH     = 2,
    parameter   BLOCK_IND_WIDTH = 10,
    parameter   BLOCK_LEVEL     = -1,
    parameter   BLOCK_WIDTH_LOG = clogb2(BLOCK_WIDTH)
)(
    input       [BLOCK_IND_WIDTH*BLOCK_WIDTH-1:0]       cnts_in,

    output      [BLOCK_IND_WIDTH+BLOCK_WIDTH_LOG-1:0]   cnt_out
);

generate 
    if (BLOCK_WIDTH == 2) begin
        assign cnt_out = {{BLOCK_WIDTH_LOG{1'b0}}, cnts_in[BLOCK_IND_WIDTH * BLOCK_WIDTH - 1 -: BLOCK_IND_WIDTH]} +
                   {{BLOCK_WIDTH_LOG{1'b0}}, cnts_in[BLOCK_IND_WIDTH-1:0]};
    end
    else begin
        assign cnt_out = {(BLOCK_IND_WIDTH+BLOCK_WIDTH_LOG){1'b0}};
    end
endgenerate


function integer clogb2;
input integer val;
begin
    clogb2 = 1;
    for (val = val/2; val > 1; val = val/2) begin
        clogb2 = clogb2 + 1;
    end
end
endfunction

endmodule
