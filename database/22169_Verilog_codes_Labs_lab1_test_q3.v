// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module test_q3;
    reg x;
    reg y;
    reg z;
    wire out;
    
    q3 dut (.x(x),.y(y),.z(z),.out(out));
    
    initial begin
        $dumpfile("test_q3.vcd");
        $dumpvars(0, test_q3);
        $monitor("x=%b, y=%b, z=%b, out=%b", x, y, z, out);
        
        x = 0;
        y = 0;
        z = 0;
        #10;
        
        x = 1;
        y = 0;
        z = 1;
        #10;
        
        x = 1;
        y = 1;
        z = 0;
        #10;
        
        x = 0;
        y = 1;
        z = 1;
        #10;
        
        $finish;
    end
    
endmodule