module flip_flop(
    input el_in     /* synthesis syn_force_pads=1 syn_noprune=1*/,
    output el_out   /* synthesis syn_force_pads=1 syn_noprune=1*/
    );

    wire el_in      /* synthesis syn_keep = 1 */;
    wire el_out     /* synthesis syn_keep = 1 */;

    // See the SiliconBlue ICE Technology Library by Lattice Semiconductor

    SB_DFFSR dffs (
        .Q(el_out),
        .C(el_in),
        .R(1'b1),
        .D(1'b1)
    ) /* synthesis syn_keep = 1 */;

endmodule
