module logarithm(input [31:0] a,b,output [127:0] a_out, b_out);
  assign a_out = 1000000000 * $ln(a);
  assign b_out = 1000000000 * $log10(b);
endmodule

module logarithm_tb;
  reg [31:0] a;
  reg [31:0] b;
  wire [127:0] a_out;
  wire [127:0] b_out;
  logarithm uut(a,b,a_out,b_out);
initial begin
a=0;b=0;
#20 a= 123;b=123;
#20 a =4;b=4; 
#20 a=234;b=34;
end

initial 
  $monitor(" a = %d, b = %d, ln(a) = %d, log10(b) = %d",a,b,a_out,b_out);

endmodule
