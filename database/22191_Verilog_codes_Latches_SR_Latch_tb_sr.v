// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module sr_latch_tb;
    reg s, r;
    wire q, q_bar;
    sr_latch uut(
        .s(s),
        .r(r),
        .q(q),
        .q_bar(q_bar)
    );
    initial begin
        $dumpfile("sr_latch.vcd");
        $dumpvars(0, sr_latch_tb);
        $display("\t\t     S | R | Q | Q_bar");
        $monitor($time," %b | %b | %b | %b ",s,r,q,q_bar);
        #10 s = 1; r = 0;
        #10 s = 0; r = 1;
        #10 s = 0; r = 0;
        #10 s = 1; r = 1;
        #10 s = 0; r = 1;
        #10 $finish;
    end
endmodule