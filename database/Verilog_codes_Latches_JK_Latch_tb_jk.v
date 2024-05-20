// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module jk_latch_tb;
    reg j, k, en;
    wire q, q_bar;
    jk_latch uut(
        .j(j),
        .k(k),
        .q(q),
        .q_bar(q_bar),
        .en(en)
    );
    initial begin
        $dumpfile("jk_latch.vcd");
        $dumpvars(0, jk_latch_tb);
        $display("\t\t    EN | J | K | Q | Q_bar");
        $monitor($time," %b | %b | %b | %b | %b ",en,j,k,q,q_bar);
        #10 en = 1; j = 1; k = 0;
        #10 en = 1; j = 0; k = 1;
        #10 en = 1; j = 0; k = 0;
        #10 en = 1; j = 1; k = 1;
        #10 en = 1; j = 0; k = 1;
        #10 $finish;
    end
endmodule