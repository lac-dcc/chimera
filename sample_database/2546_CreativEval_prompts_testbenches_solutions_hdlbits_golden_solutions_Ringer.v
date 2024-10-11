// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    
    assign ringer = ring & (~vibrate_mode);
    assign motor = ring & vibrate_mode;

endmodule