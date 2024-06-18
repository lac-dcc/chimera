// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module full_adder_tb();
    reg a, b, cin;
    wire sum, cout;

    full_adder fa1(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0);
    a = 1; b = 0; cin = 0;
    #10;
    $display($time,"A: %b , B: %b , Cin: %b, Sum: %b, Cout: %b ",a,b,cin,sum,cout);
    #10;

    a = 1; b = 1; cin = 0;
    #10;
    $display($time,"A: %b , B: %b , Cin: %b, Sum: %b, Cout: %b ",a,b,cin,sum,cout);
    #10;

    a = 0; b = 0; cin = 1;
    #10;
    $display($time,"A: %b , B: %b , Cin: %b, Sum: %b, Cout: %b ",a,b,cin,sum,cout);
    #10;

    a = 1; b = 1; cin = 1;
    #10;
    $display($time,"A: %b , B: %b , Cin: %b, Sum: %b, Cout: %b ",a,b,cin,sum,cout);
    #10;
end
endmodule
