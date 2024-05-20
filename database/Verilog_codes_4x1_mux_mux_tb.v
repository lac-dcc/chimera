// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module mux_tb();
reg a,b,c,d,s0,s1;
wire y;

mux4x1 uut(.a(a),.b(b),.c(c),.d(d),.s0(s0),.s1(s1),.y(y));
initial begin
    $monitor("a: %b | b: %b | c: %b | d: %b | s0: %b | s1: %b | y: %b ", a,b,c,d,s0,s1,y);
    $dumpfile("mux.vcd");
    $dumpvars(1);
    a = 1'b1 ; b = 1'b0 ; c = 1'b1 ; d = 1'b0;
    s0 = 1'b0 ; s1 = 1'b0 ;
    #10
    s0 = 1'b0 ; s1 = 1'b1 ;
    #10
    s0 = 1'b1 ; s1 = 1'b0 ;
    #10
    s0 = 1'b1 ; s1 = 1'b1 ;
    #10
    $finish();

end
endmodule
