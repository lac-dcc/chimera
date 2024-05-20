// This program was cloned from: https://github.com/Shiva9361/Simple_Processor
// License: MIT License

module halfadder(a,b,s,c);
    input a,b;
    output s,c;
    xor(s,a,b);
    and(c,a,b);
endmodule
module fulladder(a,b,cin,s,cout);
    input a,b,cin;
    output s,cout;
    wire w1,w2,w3;
    halfadder h1(a,b,w1,w2);
    halfadder h2(cin,w1,s,w3);
    or(cout,w2,w3);
    
endmodule

module nbitadder(a,b,s);
parameter n=32;
input [n-1:0] a;
input [n-1:0]b;
output [n-1:0] s;
wire [n-1:0] c;
genvar i;
generate
    for (i = 0 ;i<n ;i=i+1 ) 
        begin
        if (i==0) begin
            halfadder f(a[0],b[0],s[0],c[0]);
        end
        else begin
            fulladder f(a[i],b[i],c[i-1],s[i],c[i]);
        end
        end
    
endgenerate
endmodule