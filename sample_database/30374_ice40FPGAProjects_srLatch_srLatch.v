// This program was cloned from: https://github.com/jasonkaufmann/ice40FPGAProjects
// License: MIT License

`timescale 1 ns / 100 ps

//NOTE: this is not routable on the ice40 FPGA. This is only for simulation purposes.

module srLatch (
    input set,
    input reset,
    output q,
    output qNot);

    assign #(1) qNot = ~(set | q);
    assign #(1) q = ~(reset | qNot);

endmodule