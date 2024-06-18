// This program was cloned from: https://github.com/Shiva9361/Simple_Processor
// License: MIT License

module nbitsubtractor(a,b,s);
parameter n=32;
input [n-1:0] a,b;
output [n-1:0] s;
wire [n-1:0] c;
genvar i;
generate
    for (i = 0 ;i<n ;i=i+1 ) 
    begin
    if (i==0) begin
        half_subtractor f(a[0],b[0],s[0],c[0]);
    end
    else begin
        full_subtractor f(a[i],b[i],c[i-1],s[i],c[i]);
    end
    end

endgenerate
endmodule

module full_subtractor(a,b,bi,y,bo);
input a,b,bi;
output y,bo;
wire w1,w2,w3;
half_subtractor g1(a,b,w1,w2);
half_subtractor g2(w1,bi,y,w3);
or(bo,w2,w3);
endmodule

module half_subtractor(a,b,d,bo);
input a,b;
output d,bo;
xor g1(d,a,b);
wire nota;
not g2(nota,a);
and g3(bo,nota,b);
endmodule