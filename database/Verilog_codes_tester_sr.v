// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module jk_flip_flop(input j, input k, input clk, output reg q, output wire q_bar);

    always @(posedge clk) begin
        if (j & ~k)
            q <= 1;
        else if (~j & k)
            q <= 0;
        else if (j & k)
            q <= ~q;
    end

    assign q_bar = ~q;

endmodule

module sr_flip_flop(input s, input r, input clk, output wire q, output wire q_bar);
    wire j, k;
    assign j = s;
    assign k = r;

    jk_flip_flop jk_ff (.j(j), .k(k), .clk(clk), .q(q), .q_bar(q_bar));

endmodule
