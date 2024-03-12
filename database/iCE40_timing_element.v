module element(
    input el_in /* synthesis syn_force_pads=1 syn_noprune=1*/,
    output el_out
    );

    wire el_in /* synthesis syn_keep = 1 */;
    wire el_out /* synthesis syn_keep = 1 */;
    wire t = 1 /* synthesis syn_keep = 1 */;

    assign el_out = t & el_in;

endmodule
