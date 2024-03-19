`ifndef MUX_4TO1
`define MUX_4TO1

    module mux4to1_glvl(
        output outp,
        input [3:0] inp,
        input [1:0] sel
    );

        wire [1:0] selBar;
        not(selBar[0], sel[0]);
        not(selBar[1], sel[1]);

        wire case1, case2, case3, case4;
        and (case1, selBar[0], selBar[1], inp[0]);
        and (case2, sel[0], selBar[1], inp[1]);
        and (case3, selBar[0], sel[1], inp[2]);
        and (case4, sel[0], sel[1], inp[3]);

        or(outp, case1, case2, case3, case4);

    endmodule

`endif