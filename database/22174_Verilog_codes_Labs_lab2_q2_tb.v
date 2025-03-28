// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module q2_tb; 
    reg a, b, c;
    wire result;

    q2 uut (.a(a), .b(b), .c(c), .result(result));

    initial begin
        $dumpfile("q2_str.vcd");
        $dumpvars(0);
        $monitor("Time=%0t a=%b b=%b c=%b result=%b", $time, a, b, c, result);
        a = 0; b = 0; c = 0;
        #10;

        a = 1; b = 0; c = 1;
        #10;

        a = 0; b = 1; c = 1;
        #10;

        a = 1; b = 1; c = 0;
        #10;
    end
endmodule