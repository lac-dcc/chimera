///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//File Name: Multiplication_tb.v
//Created By: Sheetal Swaroop Burada
//Date: 30-04-2019
//Project Name: Design of 32 Bit Floating Point ALU Based on Standard IEEE-754 in Verilog and its implementation on FPGA.
//University: Dayalbagh Educational Institute
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module multiplication_tb;

reg [31:0] a_operand,b_operand;
wire Exception,Overflow,Underflow;
wire [31:0] result;

reg clk = 1'b1;

Multiplication dut(a_operand,b_operand,Exception,Overflow,Underflow,result);

always clk = #5 ~clk;

initial
begin
iteration (32'h4234_851F,32'h427C_851F,1'b0,1'b0,1'b0,32'h4532_10E9,`__LINE__); // 45.13 * 63.13 = 2849.0569;

iteration (32'h4049_999A,32'hC166_3D71,1'b0,1'b0,1'b0,32'hC235_5062,`__LINE__); //3.15 * -14.39 = -45.3285

iteration (32'hC152_6666,32'hC240_A3D7,1'b0,1'b0,1'b0,32'h441E_5375,`__LINE__); //-13.15 * -48.16 = 633.304

iteration (32'h4580_0000,32'h4580_0000,1'b0,1'b0,1'b0,32'h4B80_0000,`__LINE__); //4096 * 4096 = 16777216

iteration (32'h3ACA_62C1,32'h3ACA_62C1,1'b0,1'b0,1'b0,32'h361F_FFE7,`__LINE__); //0.00154408081 * 0.00154408081 = 0.00000238418

iteration (32'h0000_0000,32'h0000_0000,1'b0,1'b0,1'b0,32'h0000_0000,`__LINE__); // 0 * 0 = 0;

iteration (32'hC152_6666,32'h0000_0000,1'b0,1'b0,1'b0,32'h441E_5375,`__LINE__); //-13.15 * 0 = 0;

iteration (32'h7F80_0000,32'h7F80_0000,1'b1,1'b1,1'b0,32'h0000_0000,`__LINE__); 

iteration (32'h0080_0000,32'h00180_000,1'b0,1'b0,1'b1,32'h0000_0000,`__LINE__);

$stop;

end

task iteration(
input [31:0] operand_a,operand_b,
input Expected_Exception,Expected_Overflow,Expected_Underflow,
input [31:0] Expected_result,
input integer linenum 
);
begin
@(negedge clk)
begin
	a_operand = operand_a;
	b_operand = operand_b;
end

@(posedge clk)
begin
if ((Expected_result == result) && (Expected_Exception == Exception) && (Expected_Overflow == Overflow) && (Expected_Underflow == Underflow))
	$display ("Test Passed - %d",linenum);

else
	$display ("Test failed - Expected_result = %h, Result = %h, \n Expected_Exception = %d, Exception = %d,\n Expected_Overflow = %d, Overflow = %d, \n Expected_Underflow = %d, Underflow = %d - %d \n ",Expected_result,result,Expected_Exception,Exception,Expected_Overflow,Overflow,Expected_Underflow,Underflow,linenum);
end
end
endtask
endmodule