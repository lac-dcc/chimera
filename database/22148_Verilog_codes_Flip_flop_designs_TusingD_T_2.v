// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module d_flip_flop (input clk, input reset, input d, output reg q);

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end

endmodule

module t_flip_flop (input clk, input reset, input t, output reg q);

    wire d;
    reg q_int;

    assign d = t ^ q_int;

    d_flip_flop flipflop1 (.clk(clk), .reset(reset), .d(d), .q(q_int));

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 1'b0;
        else
            q <= q_int;
    end

endmodule