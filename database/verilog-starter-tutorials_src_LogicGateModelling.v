module logic_gate(a,b,c,d,e,f,g,h);
    input a,b;
    output c,d,e,f,g,h;
    and(c,a,b);
    or(d,a,b);
    xor(e,a,b);
    xnor(f,a,b);
    nand(g,a,b);
    not(h,a);
endmodule

module test_bench;
    reg a,b;
    wire c,d,e,f,g,h;
    logic_gate t(a,b,c,d,e,f,g,h);
    initial 
    begin
    $dumpfile("vcd/LogicGate.vcd");
    $dumpvars(0,test_bench);
    $monitor("a=%b,b=%b,and=%b,or=%b,nand=%b,nor=%b,xor=%b,not=%b",a,b,c,d,e,f,g,h);
    a=0; b=0; #10
    a=1; b=0; #10
    a=0; b=1; #10
    a=1; b=1; #10
    $finish;
    end
endmodule
