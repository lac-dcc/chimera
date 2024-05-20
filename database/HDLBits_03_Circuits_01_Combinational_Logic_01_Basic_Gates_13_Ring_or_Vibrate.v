// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    
    assign motor = vibrate_mode & ring;
    assign ringer = ring & ~vibrate_mode;

endmodule
