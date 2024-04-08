//Adder
 
 module adder(a,b,c,s);
 input [7:0] a,b;
 output [7:0] s;
 output c; 
 assign {c,s}=a+b;
 endmodule
