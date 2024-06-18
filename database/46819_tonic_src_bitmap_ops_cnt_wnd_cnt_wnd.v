// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module cnt_wnd # (
    parameter   VECT_WIDTH          = -1,
    parameter   VECT_IND_WIDTH      = -1,
    parameter   BLOCK_WIDTH         = 2
) (
    input   [VECT_WIDTH-1:0]        vect_in,
    input                           select_set_in,

    output  [VECT_IND_WIDTH-1:0]    cnt_out
);

wire    [VECT_WIDTH-1:0]        vect_wnd_set_bits;

genvar ii;

generate
    for (ii = 0; ii < VECT_WIDTH; ii = ii + 1) begin: vect_wnd_set_bits_gen
        assign vect_wnd_set_bits[ii] = (vect_in[ii] == select_set_in);
    end
endgenerate


cnt_set #(
    .VECT_WIDTH         (VECT_WIDTH         ),
    .VECT_IND_WIDTH     (VECT_IND_WIDTH     ),
    .BLOCK_WIDTH        (BLOCK_WIDTH        )
) cnt_set (
    .vect_in            (vect_wnd_set_bits  ),
    .cnt_out            (cnt_out            )
);

endmodule
