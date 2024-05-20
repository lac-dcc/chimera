// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_t_flip_flop();
    reg t, clk;
    wire q;

    t_flip_flop t_ff (.t(t), .clk(clk), .q(q));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0);
        t = 0;
        #10;
        t = 1;
        #10;
        t = 0;
        #10;
        t = 1;
        #10;
        $finish;
    end

    always @(posedge clk)
        $display("t=%b, q=%b", t, q);

endmodule