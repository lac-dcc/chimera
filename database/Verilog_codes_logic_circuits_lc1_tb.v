// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module lc1_tb;
reg a,b;
wire x,y,q;

lc1 uut(.a(a),.b(b),.x(x),.y(y),.q(q));

initial begin
    $dumpfile("lc1.vcd");
    $dumpvars(0,lc1_tb);
    a = 0; b = 0;
    #10
    $display("A | B | x | y | Output");
    $display("%b | %b | %b | %b | %b" , a,b,x,y,q);
    a = 0; b = 1;
    #10
    $display("%b | %b | %b | %b | %b" , a,b,x,y,q);
    a = 1; b = 0;
    #10
    $display("%b | %b | %b | %b | %b" , a,b,x,y,q);
    a = 1; b = 1;
    #10
    $display("%b | %b | %b | %b | %b" , a,b,x,y,q);
    end
endmodule