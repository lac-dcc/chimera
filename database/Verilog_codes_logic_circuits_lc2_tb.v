// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module lc2_tb;
reg a,b,c,d;
wire w,x,y,z,q;

lc2 uut(.a(a),.b(b),.c(c),.d(d),.w(w),.x(x),.y(y),.z(z),.q(q));
initial begin
    $dumpfile("lc2.vcd");
    $dumpvars(0,lc2_tb);
    a = 0; b = 0; c=0; d=0;
    #10
    $display("a | b | c | d | w | x | y | z | Output" );
    $display("%b | %b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,d,w,x,y,z,q);
    a = 0; b = 0; c=0; d=1;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,d,w,x,y,z,q);
    a = 0; b = 0; c=1; d=0;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,d,w,x,y,z,q);
    a = 0; b = 0; c=1; d=1;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,d,w,x,y,z,q);
    a = 0; b = 1; c=0; d=0;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,d,w,x,y,z,q);
    a = 0; b = 1; c=0; d=1;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,d,w,x,y,z,q);
    a = 0; b = 1; c=1; d=0;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,d,w,x,y,z,q);
    a = 0; b = 1; c=1; d=1;
    #10
    $display("%b | %b | %b | %b | %b | %b | %b | %b | %b" , a,b,c,d,w,x,y,z,q);
    end
endmodule