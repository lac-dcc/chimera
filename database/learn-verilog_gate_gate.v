// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// AND/OR gate controlled by keys.

module led(
    input k1,
    input k2,
    input k3,
    input k4,
    output a,
    output b
);
    assign a = k1 & k2;
    assign b = k3 | k4;
endmodule
