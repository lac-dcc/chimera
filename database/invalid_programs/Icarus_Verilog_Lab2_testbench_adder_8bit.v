`include "ADDER_8bit.v"
module testbench_adder_8bit;
	 reg [7:0] num1,num2;
	 wire [7:0] sum;
	 wire cfinal;
	 wire cin;
	 
	 assign cin = 0;
	 
	 ADDER_8bit fl(cfinal,sum,num1,num2,cin);
	 initial
		$monitor(,$time,"sum=%b, cfinal = %b, num1=%b, num2=%b, cin = %b",sum,cfinal,num1,num2,cin);
	 
	 initial
		 begin
			#0 num1=8'b00000001;num2=8'b11111111;
			#10 num1=8'b00000000;num2=8'b11111110;
			#20 num1=8'b00000000;num2=8'b11111101;
			#30 num1=8'b00000000;num2=8'b11111011;
			#40 num1=8'b00000000;num2=8'b11110111;
		 end
endmodule