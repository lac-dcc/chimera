// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`include "gate_level_inverter.v"

module gate_level_21mux(input a, input b, input sel, output y);

    // Simple behavioral description would be -> assign y = sel ? b : a;

    wire sel_n;
    gate_level_inverter inv(sel, sel_n);    // for the sake of using our own inverter; could have done instead: assig sel_n = ~sel;

    cmos(y, a, sel_n, sel); // cmos(output, input, ncontrol, pcontrol);
    cmos(y, b, sel, sel_n);

endmodule
