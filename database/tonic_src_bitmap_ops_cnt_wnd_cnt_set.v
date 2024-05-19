// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

module cnt_set #(
    parameter   VECT_WIDTH      = 64,
    parameter   VECT_IND_WIDTH  = 4,
    parameter   BLOCK_WIDTH     = 2
)(
    input   [VECT_WIDTH-1:0]        vect_in,

    output  [VECT_IND_WIDTH-1:0]    cnt_out
);

localparam BLOCK_DEPTH      = clog(VECT_WIDTH, BLOCK_WIDTH);
localparam BLOCK_WIDTH_LOG  = clog(BLOCK_WIDTH, 2);

wire [VECT_WIDTH-1:0]    cnt_level[BLOCK_DEPTH:0];


assign cnt_out     = cnt_level[BLOCK_DEPTH][VECT_IND_WIDTH-1:0];

genvar ii, jj;


generate begin
    for (ii = 0; ii < BLOCK_DEPTH; ii = ii + 1) begin: level_gen
        if (ii == 0) begin
            assign cnt_level[ii] = vect_in;
        end

        // wire [VECT_WIDTH/pow(BLOCK_WIDTH,ii)-1:0] val_out_prev_level;
        for (jj = 0; jj < pow(BLOCK_WIDTH, BLOCK_DEPTH-ii-1); jj = jj + 1) begin: block_gen
            cnt_block # (
                .BLOCK_WIDTH        (BLOCK_WIDTH        ),
                .BLOCK_IND_WIDTH    (ii + 1             ),
                .BLOCK_LEVEL        (ii                 )
            ) cnt_block (
                .cnts_in    (cnt_level[ii][(jj+1)*(BLOCK_WIDTH*(ii+1))-1 :jj*BLOCK_WIDTH*(ii+1)]),
                .cnt_out    (cnt_level[ii+1][(jj+1)*(ii+1+BLOCK_WIDTH_LOG)-1:jj*(ii+1+BLOCK_WIDTH_LOG)])
            );
        end
    end
end
endgenerate

function integer clog;
input integer val;
input integer base;
begin
    clog = 1;
    for (val = val/base; val > 1; val = val/base) begin
        clog = clog + 1;
    end
end
endfunction


function integer pow;
input integer base;
input integer val;
begin
    pow = 1;
    for (val = val; val > 0; val = val - 1) begin
        pow = pow*base;
    end
end
endfunction


endmodule
