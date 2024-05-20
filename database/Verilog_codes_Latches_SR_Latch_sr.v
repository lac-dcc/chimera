// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module sr_latch(input s, input r, output reg q, output reg q_bar);
    always @(s, r)
        if (~s & r)
            q <= 0;
        else if (s & ~r)
            q <= 1;
        else if (~s & ~r)
            q <= 1'bz;
    always @(s, r)
        q_bar = ~q;
endmodule