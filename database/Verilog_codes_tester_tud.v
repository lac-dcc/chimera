// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module d_flip_flop(input d, input clk, output reg q);
    always @(posedge clk)
        q <= d;
endmodule

module t_flip_flop(input t, input clk, output wire q);
    reg q_d;
    initial begin
        q_d = 0;
    end
    always @(posedge clk)
        q_d <= (q_d ^ t);
    assign q = q_d;
endmodule
