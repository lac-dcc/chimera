module element(
    input el_in /* synthesis syn_force_pads=1 syn_noprune=1*/,
    output el_out
    );

    wire el_in /* synthesis syn_keep = 1 */;
    wire el_out /* synthesis syn_keep = 1 */;
    wire carry_out  /* synthesis syn_keep = 1 */;

    SB_CARRY my_carry (
      .CO(carry_out),
      .I0(1),
      .I1(0),
      .CI(el_in));

    assign el_out = carry_out;

endmodule
