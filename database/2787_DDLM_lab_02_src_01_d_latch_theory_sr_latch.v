// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module sr_latch
(
    input   s,
    input   r,
    output  q,
    output  q_n
);
    assign q   = ~ ( r | q_n );
    assign q_n = ~ ( s | q   );

endmodule
