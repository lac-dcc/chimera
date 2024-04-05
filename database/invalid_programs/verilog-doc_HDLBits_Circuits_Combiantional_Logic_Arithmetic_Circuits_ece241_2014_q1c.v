module top_module (
    input [7:0] a,
    input [7:0] b, 
    output [7:0] s,
    output overflow
);
    EightBitsAdder ins(a, b, s, overflow);
endmodule

module FullAdder(
    input a, b, cin,
    output sum, cout
);
    assign {cout, sum} = a + b + cin;
endmodule

module EightBitsAdder(
    input [7:0] x,
    input [7:0] y,
    output [7:0] s,
    output overflow
);
    wire [7:0] cout1;
    FullAdder ins0(x[0],y[0],0,s[0],cout1[0]);
    FullAdder ins1(x[1],y[1],cout1[0],s[1],cout1[1]);
    FullAdder ins2(x[2],y[2],cout1[1],s[2],cout1[2]);
    FullAdder ins3(x[3],y[3],cout1[2],s[3],cout1[3]);
    FullAdder ins4(x[4],y[4],cout1[3],s[4],cout1[4]);
    FullAdder ins5(x[5],y[5],cout1[4],s[5],cout1[5]);
    FullAdder ins6(x[6],y[6],cout1[5],s[6],cout1[6]);
    FullAdder ins7(x[7],y[7],cout1[6],s[7],cout1[7]);
    always @(*) begin
        if(cout1[7]^cout1[6]) begin
            overflow = 1;
        end
        else begin
            overflow = 0;
        end
    end
endmodule

