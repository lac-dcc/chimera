////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//File Name: Addition_Add_tb.v
//Created By: Sheetal Swaroop Burada
//Date: 30-04-2019
//Project Name: Design of 32 Bit Floating Point ALU Based on Standard IEEE-754 in Verilog and its implementation on FPGA.
//University: Dayalbagh Educational Institute
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "Addition-Subtraction.v"
`define N_TESTS 100000

module Addition_tb;

	reg clk = 0;
	reg [31:0] a_operand;
	reg [31:0] b_operand;
	
	wire [31:0] result;
	reg AddBar_Sub;

	reg [31:0] Expected_result;

	reg [95:0] testVector [`N_TESTS-1:0];

	reg test_stop_enable;

	integer mcd;
	integer test_n = 0;
	integer pass   = 0;
	integer error  = 0;

	Addition_Subtraction DUT(a_operand,b_operand,AddBar_Sub,Exception,result);

	always #5 clk = ~clk;

	initial  
	AddBar_Sub = 1'b0;
	begin 
		$readmemh("TestVectorAddition", testVector);
		mcd = $fopen("ResultsAdd.txt");
	end 

	always @(posedge clk) 
	begin
			{a_operand,b_operand,Expected_result} = testVector[test_n];
			test_n = test_n + 1'b1;

			#2;
			if (result[31:11] == Expected_result[31:11])
				begin
					//$display ("TestPassed Test Number -> %d",test_n);
					pass = pass + 1'b1;
				end

			if (result[31:11] != Expected_result[31:11])
				begin
					$fdisplay (mcd,"Test Failed Expected Result = %h, Obtained result = %h, Test Number -> %d",Expected_result,result,test_n);
					error = error + 1'b1;
				end
			
			if (test_n >= `N_TESTS) 
			begin
				$fdisplay(mcd,"Completed %d tests, %d passed and %d fails.", test_n, pass, error);
				test_stop_enable = 1'b1;
			end
	end

always @(posedge test_stop_enable)
begin
$fclose(mcd);
$finish;
end

endmodule
