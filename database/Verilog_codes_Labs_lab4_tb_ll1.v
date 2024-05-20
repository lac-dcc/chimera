// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_ll1;
    reg A, B, C;
    wire f;

    ll1 uut (.A(A),.B(B),.C(C),.f(f));

    initial begin
        $dumpfile("tb_ll1.vcd");
        $dumpvars(0, tb_ll1);
        $monitor($time, "A: %b | B: %b | C: %b | f = %b",A,B,C,f);
        A = 0;
        B = 0;
        C = 0;
        #10;
        
        A = 1;
        B = 0;
        C = 0;
        #10;
        
        A = 1;
        B = 0;
        C = 1;
        #10;

        A = 0;
        B = 0;
        C = 1;
        #10; 
        $finish;
    end
endmodule
