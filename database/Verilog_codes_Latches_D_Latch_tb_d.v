// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module d_latch_tb;
    reg d, enable;
    wire q;
    d_latch uut(
        .d(d),
        .enable(enable),
        .q(q)
    );
    initial begin
        $dumpfile("d_latch.vcd");
        $dumpvars(0, d_latch_tb);
        $display("\t\t    EN | D | Q |");
        $monitor($time," %b | %b | %b | ",enable,d,q);
        
        #10 d = 1; enable = 1;
        #10 d = 0; enable = 1;
        #10 d = 1; enable = 0;
        #10 d = 0; enable = 1;
        #10 $finish;
    end
endmodule