// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module gate_level_nand(input a, input b, output y);

    supply1 pwr;
    supply0 gnd;

    wire w1;    // wire between serial nmos gates

    // 2 parallel pmos
    pmos (y, pwr, a);
    pmos (y, pwr, b);

    // 2 series nmos
    nmos (y, w1, a);
    nmos (w1, gnd, b);

endmodule
