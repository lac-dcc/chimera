// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module lc3_tb;
reg a,b,c;
wire w,x,y,z,q;

lc3 uut(.a(a),.b(b),.c(c),.w(w),.x(x),.y(y),.z(z),.q(q));

initial begin
    $dumpfile("lc3.vcd");
    $dumpvars(0,lc3_tb);
    a = 0; b = 0; c=0;
    #10
    $display("a | b | c | w | x | y | z | Output" );
    $display("%b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,w,x,y,z,q);
    a = 0; b = 0; c=1;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,w,x,y,z,q);
    a = 0; b = 1; c=0;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,w,x,y,z,q);
    a = 0; b = 1; c=1;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,w,x,y,z,q);
    a = 1; b = 0; c=0;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,w,x,y,z,q);
    a = 1; b = 0; c=1;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,w,x,y,z,q);
    a = 1; b = 1; c=0;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,w,x,y,z,q);
    a = 1; b = 1; c=1;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,w,x,y,z,q);
    end
endmodule