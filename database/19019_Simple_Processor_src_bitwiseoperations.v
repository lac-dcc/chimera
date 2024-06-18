// This program was cloned from: https://github.com/Shiva9361/Simple_Processor
// License: MIT License

module nbitand(a,b,s);
parameter n=32;
input [n-1:0] a;
input [n-1:0]b;
output [n-1:0] s;
genvar i;
generate
    for (i = 0 ;i<n ;i=i+1 ) 
        begin
            and uut(s[i],a[i],b[i]);
        end
    
endgenerate
endmodule 

module nbitor(a,b,s);
parameter n=32;
input [n-1:0] a;
input [n-1:0]b;
output [n-1:0] s;
genvar i;
generate
    for (i = 0 ;i<n ;i=i+1 ) 
        begin
            or uut(s[i],a[i],b[i]);
        end
    
endgenerate
endmodule

module nbitxor(a,b,s);
parameter n=32;
input [n-1:0] a;
input [n-1:0]b;
output [n-1:0] s;
genvar i;
generate
    for (i = 0 ;i<n ;i=i+1 ) 
        begin
            xor uut(s[i],a[i],b[i]);
        end
    
endgenerate
endmodule