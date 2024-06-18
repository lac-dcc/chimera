// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module HalfAdder (a,b,sum,ca);
input a,b;
output sum,ca;

assign sum = a ^ b;
assign ca = a & b;
    
endmodule 
