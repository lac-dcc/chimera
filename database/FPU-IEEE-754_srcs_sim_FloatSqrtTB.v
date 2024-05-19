// This program was cloned from: https://github.com/akilm/FPU-IEEE-754
// License: MIT License

`timescale 1ns / 1ps
module FloatSqrtTBmodule #(parameter XLEN = 32);   
reg [XLEN-1:0] A;
reg overflow, underflow, exception;
wire [XLEN-1:0] result;
real  value;
FloatingSqrt F_Mult (.A(A),.result(result));

initial  
begin
A = 32'h41c80000;  // 25
#20
A = 32'h42040000;  // 33
#20
A = 32'h42aa0000;  // 85
#20
A = 32'h42b80000;  // 92
end

initial
begin
#15
value =(2**(result[30:23]-127))*($itor({1'b1,result[22:0]})/2**23)*((-1)**(result[31]));
$display("Expected Value : %f Result : %f",5.0,value);
#20
value =(2**(result[30:23]-127))*($itor({1'b1,result[22:0]})/2**23)*((-1)**(result[31]));
$display("Expected Value : %f Result : %f",5.744562646538029,value);
#20
value =(2**(result[30:23]-127))*($itor({1'b1,result[22:0]})/2**23)*((-1)**(result[31]));
$display("Expected Value : %f Result : %f",9.219544457292887,value);
#20
value =(2**(result[30:23]-127))*($itor({1'b1,result[22:0]})/2**23)*((-1)**(result[31]));
$display("Expected Value : %f Result : %f",9.591663046625438,value);
$finish;
end

endmodule
