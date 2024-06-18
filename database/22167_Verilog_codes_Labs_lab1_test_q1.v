// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module q1_tb;
    reg A;
    reg B;
    reg C;
    wire Y;
    
    q1_structural dut (.A(A),.B(B),.C(C),.Y(Y));
    
    initial begin
        $dumpfile("q1_tb.vcd");
        $dumpvars(0, q1_tb);
        $monitor("A=%b, B=%b, C=%b, Y=%b", A, B, C, Y);
        
        A = 0;
        B = 0;
        C = 0;
        #10;
        
        A = 1;
        B = 0;
        C = 1;
        #10;
        
        A = 1;
        B = 1;
        C = 0;
        #10;
        
        A = 0;
        B = 1;
        C = 1;
        #10;
        
        $finish;
    end
    
endmodule