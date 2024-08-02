// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns/1ns
module buzzer_pwm_test_tb;
reg clk;
reg rst_n;
reg key1;
wire buzzer;
initial
begin
	clk = 1'b0;
	rst_n = 1'b0;
	key1 = 1'b1;
	#100 rst_n = 1'b1;
	#2000 key1 = 1'b0;
	#({$random} %1000)
	key1 = ~key1;
	#({$random} %1000)
	key1 = ~key1;
	#({$random} %1000)
	key1 = ~key1;
	#({$random} %1000)
	key1 = ~key1;	
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;	
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = 1'b0;
	#1000000000
	key1 = 1'b1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;	
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = 1'b1;
	
	#1000000000 key1 = 1'b0;
	#({$random} %1000)
	key1 = ~key1;
	#({$random} %1000)
	key1 = ~key1;
	#({$random} %1000)
	key1 = ~key1;
	#({$random} %1000)
	key1 = ~key1;	
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;	
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = 1'b0;
	#1000000000
	key1 = 1'b1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;	
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = ~key1;
	#({$random} %10000000)
	key1 = 1'b1;
	#10 $stop;
	
end
always#10 clk = ~clk;//50Mhz

buzzer_pwm_test dut(
	.clk     (clk),
	.rst_n   (rst_n),
	.key1    (key1),
	.buzzer  (buzzer)
);
endmodule 