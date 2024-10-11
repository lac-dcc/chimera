// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    assign motor  = vibrate_mode && ring;
    assign ringer = (~vibrate_mode) && ring;
endmodule
