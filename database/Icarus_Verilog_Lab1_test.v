    
    
      // timescale 1ns/1ps
module mux_2_to_1(a,b,s,f);
    input a,b,s;
    output f;
    reg f;
    always@(s or a or b)
        if(s==1) f=a;
        else f=b;
endmodule
module testbench;
    reg a,b,s;
    wire f;
    mux_2_to_1 mux(a,b,s,f);
    initial
        begin
            $monitor(,$time," a=%b, b=%b, s=%b f=%b",a,b,s,f);
            #0 a=1'b0;b=1'b0;
            #1 a=1'b0;b=1'b1;
            #2 a=1'b1;b=1'b0;
            #3 a=1'b1;b=1'b1;
            #10 s=1'b1;
            #15 s=1'b0;
            #100 $finish;
        end
endmodule
    