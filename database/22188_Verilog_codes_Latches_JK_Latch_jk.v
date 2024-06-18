// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module jk_latch(input j, input k, input en, output reg q, output reg q_bar);
    always @(j,k,en)
        if (j & k & en)
            q <= ~q;
        else if (~j & k & en)
            q <= 0;
        else if (j & ~k & en)
            q <= 1;
        
    always @(j,k,en)
        q_bar = ~q;
endmodule