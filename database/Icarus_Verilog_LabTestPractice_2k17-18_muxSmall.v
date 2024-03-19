`ifndef MUX_SMALL
`define MUX_SMALL

    module muxSmall(
        output outp,
        input [1:0] inp,
        input sel
    );

        wire selBar;
        not(selBar, sel);

        wire tmp1, tmp2;
        and(tmp1, selBar, inp[0]);
        and(tmp2, sel, inp[1]);
        or(outp, tmp1, tmp2);

    endmodule
`endif