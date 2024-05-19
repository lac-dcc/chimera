// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

// Description:
//      Input: Multiple {val, ind} pairs, where several pairs can be valid
//      Output: least significant valid pair
// Note:
//      BLOCK_WIDTH must be power of 2
module ff_block #(
    parameter   BLOCK_WIDTH = 4,
    parameter   BLOCK_IND_WIDTH = 10,
    parameter   BLOCK_LEVEL = -1
)(
    input       [BLOCK_WIDTH-1:0]                   ind_val_in,
    input       [BLOCK_IND_WIDTH*BLOCK_WIDTH-1:0]   ind_flat_in,

    output                                          val_out,
    output      [BLOCK_IND_WIDTH-1:0]               ind_out
);

localparam  INPUT_DIR_NUM_WIDTH = clogb2(BLOCK_WIDTH);
localparam  INPUT_DIR_SHIFT     = clogb2(BLOCK_WIDTH)*BLOCK_LEVEL;

wire    [BLOCK_WIDTH-1:0]           single_valid_bus;
wire    [BLOCK_IND_WIDTH-1:0]       selected_ind;
wire    [BLOCK_IND_WIDTH-1:0]       ind_matr[BLOCK_WIDTH-1:0];
wire    [INPUT_DIR_NUM_WIDTH-1:0]   selected_direction;
wire    [BLOCK_WIDTH-1:0]           ind_in_revert_matrix[BLOCK_IND_WIDTH-1:0];
wire    [INPUT_DIR_NUM_WIDTH-1:0]   direction_matrix[BLOCK_WIDTH-1:0];
wire    [BLOCK_WIDTH-1:0]           direction_matrix_inv[INPUT_DIR_NUM_WIDTH-1:0];

genvar ii, jj;

assign val_out = |ind_val_in;

//assign ind_out = (selected_direction << INPUT_DIR_SHIFT) + selected_ind;
assign ind_out = (selected_direction << INPUT_DIR_SHIFT) + selected_ind;


// Vector with at most one valid bit set
generate begin
    for (ii = 0; ii < BLOCK_WIDTH; ii = ii + 1) begin: single_valid_bus_gen
        if (ii == 0) begin
            assign single_valid_bus[ii] = ind_val_in[ii];
        end
        else begin
            assign single_valid_bus[ii] = ~(|ind_val_in[ii-1:0]) & ind_val_in[ii];
        end
    end
end
endgenerate


// Parallel OR input indexes masked by a vector with at most one valid bit set
generate begin
    for (ii = 0; ii < BLOCK_WIDTH; ii = ii + 1) begin: ind_matr_gen
        assign ind_matr[ii] = ind_flat_in[(ii+1)*BLOCK_IND_WIDTH-1:ii*BLOCK_IND_WIDTH];
    end


    for (ii = 0; ii < BLOCK_IND_WIDTH; ii = ii + 1) begin: selected_ind_gen
        for (jj = 0; jj < BLOCK_WIDTH; jj = jj + 1) begin: ind_in_revert_gen
            assign ind_in_revert_matrix[ii][jj] = ind_matr[jj][ii] & single_valid_bus[jj];
        end
        assign selected_ind[ii] = |ind_in_revert_matrix[ii];
    end
end
endgenerate

// Get Input Direction number curresponding to a set bit in single_valid_bus
generate begin
    for (ii = 0; ii < BLOCK_WIDTH; ii = ii + 1) begin: direction_matrix_gen
        wire    [31:0]  tmp_index = ii;
        assign direction_matrix[ii] = tmp_index[INPUT_DIR_NUM_WIDTH-1:0];
    end

    for (ii = 0; ii < INPUT_DIR_NUM_WIDTH; ii = ii + 1) begin: selected_direction_gen
        for (jj = 0; jj < BLOCK_WIDTH; jj = jj + 1) begin: direction_matrix_gen
            assign direction_matrix_inv[ii][jj] = direction_matrix[jj][ii] & single_valid_bus[jj];
        end
        assign selected_direction[ii] = |direction_matrix_inv[ii];
    end
end
endgenerate

// clogb2 function
`include "clogb2.vh"

endmodule
