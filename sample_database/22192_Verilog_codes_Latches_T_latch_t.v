// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module t_latch(input t, input reset, output reg q);

    always @(posedge t or posedge reset)
    begin
        if (reset)
            q <= 1'b0;
        else if (t)
            q <= ~q;
    end

endmodule