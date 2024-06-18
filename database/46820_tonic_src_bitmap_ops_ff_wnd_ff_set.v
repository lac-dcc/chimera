// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License


module ff_set #(
    parameter   VECT_WIDTH      = 64,
    parameter   VECT_IND_WIDTH  = 4,
    parameter   BLOCK_WIDTH     = 2
)(
    input   [VECT_WIDTH-1:0]        vect_in,

    output                          val_out,
    output  [VECT_IND_WIDTH-1:0]    ind_out
);

localparam BLOCK_DEPTH          = clog(VECT_WIDTH, BLOCK_WIDTH);
localparam IND_VAL_ARR_SIZE     = VECT_WIDTH * (BLOCK_DEPTH + 1);
localparam FLAT_ARR_ITEM_WIDTH  = VECT_WIDTH * VECT_IND_WIDTH;
localparam IND_FLAT_ARR_SIZE    = FLAT_ARR_ITEM_WIDTH * (BLOCK_DEPTH + 1);

wire [IND_VAL_ARR_SIZE-1:0]             ind_val_level;
wire [IND_FLAT_ARR_SIZE-1:0]            ind_flat_level;

assign val_out     = ind_val_level[BLOCK_DEPTH * VECT_WIDTH];

assign ind_out     = ind_flat_level[BLOCK_DEPTH * FLAT_ARR_ITEM_WIDTH + VECT_IND_WIDTH - 1 -: VECT_IND_WIDTH];

genvar ii, jj;

generate begin
    for (ii = 0; ii < BLOCK_DEPTH; ii = ii + 1) begin: level_gen
        if (ii == 0) begin
            assign ind_val_level[(ii + 1) * VECT_WIDTH - 1 -: VECT_WIDTH] = vect_in;

            // Generate flat level 0 indexes
            for (jj = 0; jj < VECT_WIDTH; jj = jj + 1) begin: ind_flat_level_gen
                assign ind_flat_level[(jj+1)*VECT_IND_WIDTH-1:jj*VECT_IND_WIDTH] = {VECT_IND_WIDTH{1'b0}};
            end
        end


        for (jj = 0; jj < num_blks(VECT_WIDTH, ii, BLOCK_WIDTH); jj = jj + 1) begin: block_gen
            ff_block # (
                .BLOCK_WIDTH        (BLOCK_WIDTH        ),
                .BLOCK_IND_WIDTH    (VECT_IND_WIDTH     ),
                .BLOCK_LEVEL        (ii                 )
            ) ff_block (
                .ind_val_in (ind_val_level[(ii * VECT_WIDTH) + (jj+1)*BLOCK_WIDTH-1: (ii * VECT_WIDTH) + jj*BLOCK_WIDTH]),
                .ind_flat_in(ind_flat_level[(ii * FLAT_ARR_ITEM_WIDTH) + (jj+1)*VECT_IND_WIDTH*BLOCK_WIDTH-1: (ii * FLAT_ARR_ITEM_WIDTH) + jj*VECT_IND_WIDTH*BLOCK_WIDTH]),
                .val_out(ind_val_level[(ii+1) * VECT_WIDTH + jj]),
                .ind_out(ind_flat_level[((ii+1) * FLAT_ARR_ITEM_WIDTH) + (jj+1)*VECT_IND_WIDTH-1:
                                        ((ii+1) * FLAT_ARR_ITEM_WIDTH) + jj*VECT_IND_WIDTH])
            );
        end
        assign ind_val_level[(ii + 1) * VECT_WIDTH + VECT_WIDTH - 1 : (ii + 1) * VECT_WIDTH + num_blks(VECT_WIDTH, ii, BLOCK_WIDTH)] = {(VECT_WIDTH - num_blks(VECT_WIDTH, ii, BLOCK_WIDTH)){1'b0}};
        assign ind_flat_level[(ii + 1) * FLAT_ARR_ITEM_WIDTH + FLAT_ARR_ITEM_WIDTH - 1 : (ii + 1) * FLAT_ARR_ITEM_WIDTH + (num_blks(VECT_WIDTH, ii, BLOCK_WIDTH))*VECT_IND_WIDTH] = {(VECT_IND_WIDTH * (VECT_WIDTH - num_blks(VECT_WIDTH, ii, BLOCK_WIDTH))){1'b0}};

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

function integer num_blks;
input integer w;
input integer i;
input integer bw;
begin
  num_blks = pow(bw, i + 1) > w ? 1 : w/pow(bw, i + 1);
end
endfunction

endmodule
