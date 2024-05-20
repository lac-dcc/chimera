// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module and_gate_tb;
reg a,b;
wire y;
and_gate uut(.a(a),.b(b),.y(y));
initial begin
    $dumpfile("and.vcd");
    $dumpvars(0,and_gate_tb);
    a = 0; b = 0;
    #10
    $display("%b | %b | %b" , a,b,y);
    a = 0; b = 1;
    #10
    $display("%b | %b | %b" , a,b,y);
    a = 1; b = 0;
    #10
    $display("%b | %b | %b" , a,b,y);
    a = 1; b = 1;
    #10
    $display("%b | %b | %b" , a,b,y);
    end
endmodule