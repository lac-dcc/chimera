// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns/1ns
module i2c_eeprom_test_tb;
reg clk;
reg rst_n;
reg key1;
wire SCL;
wire SDA;
initial
begin
	clk = 1'b0;
	rst_n = 1'b0;
	key1 = 1'b1;
	#100 rst_n = 1'b1;
	#250 key1 = 1'b0;
	#100000000 key1 = 1'b1;
end
always#10 clk = ~clk;//50Mhz
pullup p1(SDA);
pullup p2(SCL);
i2c_eeprom_test dut(
	.clk     (clk),
	.rst_n   (rst_n),
	.key1    (key1),
    .i2c_sda (SDA),
    .i2c_scl (SCL),
    .seg_sel (),
    .seg_data()	
);
M24AA02 memory
(
	.A0(1'b0), 
	.A1(1'b0), 
	.A2(1'b0), 
	.WP(1'b0), 
	.SDA(SDA), 
	.SCL(SCL), 
	.RESET(1'b0));
endmodule 