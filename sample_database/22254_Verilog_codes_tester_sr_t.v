// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_sr_flip_flop();

    reg s, r, clk;
    wire q, q_bar;
    sr_flip_flop sr_ff (.s(s), .r(r), .clk(clk), .q(q), .q_bar(q_bar));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("sr_waveform.vcd");
        $dumpvars(0);
        s = 0; r = 0;
        #10;
        s = 1; r = 0;
        #10;
        s = 0; r = 1;
        #10;
        s = 1; r = 1;
        #10;
        $finish;
    end

    always @(posedge clk)
        $display("s=%b, r=%b, q=%b, q_bar=%b", s, r, q, q_bar);

endmodule