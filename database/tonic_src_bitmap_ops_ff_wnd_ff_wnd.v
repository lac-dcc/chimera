// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module ff_wnd # (
    parameter   VECT_WIDTH          = -1,
    parameter   VECT_IND_WIDTH      = -1,
    parameter   BLOCK_WIDTH         = 2
) (
    input   [VECT_WIDTH-1:0]        vect_in,
    input                           select_set_in,
    input   [VECT_IND_WIDTH-1:0]    head_in,

    output                          val_out,
    output  [VECT_IND_WIDTH-1:0]    ind_out
);

wire    [VECT_WIDTH-1:0]        vect_wnd_set_bits_1;
wire                            val_out_1;
wire    [VECT_IND_WIDTH-1:0]    ind_out_1;

wire    [VECT_WIDTH-1:0]        vect_wnd_set_bits_2;
wire                            val_out_2;
wire    [VECT_IND_WIDTH-1:0]    ind_out_2;

genvar ii;

generate
    for (ii = 0; ii < VECT_WIDTH; ii = ii + 1) begin: vect_wnd_set_bits_gen
        assign vect_wnd_set_bits_1[ii] = (vect_in[ii] == select_set_in) &
                                         (ii >= head_in);


        assign vect_wnd_set_bits_2[ii] = (vect_in[ii] == select_set_in);
    end
endgenerate


ff_set #(
    .VECT_WIDTH         (VECT_WIDTH         ),
    .VECT_IND_WIDTH     (VECT_IND_WIDTH     ),
    .BLOCK_WIDTH        (BLOCK_WIDTH        )
) sfs1 (
    .vect_in            (vect_wnd_set_bits_1    ),
    .val_out            (val_out_1              ),
    .ind_out            (ind_out_1              )
);

ff_set #(
    .VECT_WIDTH         (VECT_WIDTH         ),
    .VECT_IND_WIDTH     (VECT_IND_WIDTH     ),
    .BLOCK_WIDTH        (BLOCK_WIDTH        )
) sfs2 (
    .vect_in            (vect_wnd_set_bits_2    ),
    .val_out            (val_out_2              ),
    .ind_out            (ind_out_2              )
);

assign  val_out = val_out_1 | val_out_2;
assign  ind_out = val_out_1 ? ind_out_1 : ind_out_2;

endmodule
