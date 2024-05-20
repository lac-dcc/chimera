// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module gate_level_inverter(input x, output y);

    supply1 pwr;    // Vdd, logic 1
    supply0 gnd;    // Ground, logic 0

    pmos(y, pwr, x);    // (drain, source, gate)
    nmos(y, gnd, x);    // (drain, source, gate)

endmodule
