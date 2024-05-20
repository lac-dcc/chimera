// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_sr_flip_flop;
    reg s, r, clk;
    wire q, q_bar;
    sr_flip_flop sr_ff_inst(
        .s(s),
        .r(r),
        .clk(clk),
        .q(q),
        .q_bar(q_bar)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_sr_flip_flop);
        clk = 1'b0;       
        #5 s = 1'b1;      
        #5 r = 1'b0;      
        #5 s = 1'b0;      
        #5 r = 1'b1;      
        #5 s = 1'b1;      
        #5 r = 1'b0;      
        #5 s = 1'b0;      
        #5 r = 1'b1;      
        #5 $finish;
    end
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t, s=%b, r=%b, clk=%b, q=%b, q_bar=%b", $time, s, r, clk, q, q_bar);
    end
endmodule