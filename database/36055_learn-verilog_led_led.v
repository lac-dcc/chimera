// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// LED controlled by keys.

module led(
    input k1,
    input k2,
    input k3,
    input k4,
    output[3:0] leds
);
    assign leds[0] = k1;
    assign leds[1] = k2;
    assign leds[2] = ~k3;
    assign leds[3] = ~k4;
endmodule
