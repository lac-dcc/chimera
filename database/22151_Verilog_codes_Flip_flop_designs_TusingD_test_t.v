// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module t_tb;
    reg D;
    wire Q;
    wire T;
    reg clk;
    
    T_ff dut (.T(T), .clk(clk), .Q(Q));
    
    initial begin
        $dumpfile("t_tb.vcd");
        $dumpvars(0, t_tb);
        $monitor("T=%b, clk=%b, D=%b, Q=%b", T, clk, D, Q);
        
        // Test case 1
        T = 0;
        clk = 0;
        #5;
        clk = 1;
        #5;
        
        // Test case 2
        T = 1;
        clk = 0;
        #5;
        clk = 1;
        #5;
        
        // Test case 3
        T = 0;
        clk = 0;
        #5;
        clk = 1;
        #5;
        
        // Test case 4
        T = 1;
        clk = 0;
        #5;
        clk = 1;
        #5;
        
        $finish;
    end
    
endmodule