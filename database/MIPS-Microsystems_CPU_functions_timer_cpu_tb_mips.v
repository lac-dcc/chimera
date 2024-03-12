`timescale 1ns / 1ps

module tb_mips;

	// Inputs
	reg clk;
	reg reset;
	reg RxD;
	reg [7:0] dip_switch7;
	reg [7:0] dip_switch6;
	reg [7:0] dip_switch5;
	reg [7:0] dip_switch4;
	reg [7:0] dip_switch3;
	reg [7:0] dip_switch2;
	reg [7:0] dip_switch1;
	reg [7:0] dip_switch0;
	reg [7:0] user_key;

	// Outputs
	wire TxD;
	wire [31:0] lights;
	wire [7:0] digital_tube0;
	wire [7:0] digital_tube1;
	wire [7:0] digital_tube2;
	wire [3:0] digital_Sel0;
	wire [3:0] digital_Sel1;
	wire [3:0] digital_Sel2;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk), 
		.reset(reset), 
		.RxD(RxD), 
		.dip_switch7(dip_switch7), 
		.dip_switch6(dip_switch6), 
		.dip_switch5(dip_switch5), 
		.dip_switch4(dip_switch4), 
		.dip_switch3(dip_switch3), 
		.dip_switch2(dip_switch2), 
		.dip_switch1(dip_switch1), 
		.dip_switch0(dip_switch0), 
		.user_key(user_key), 
		.TxD(TxD), 
		.lights(lights), 
		.digital_tube0(digital_tube0), 
		.digital_tube1(digital_tube1), 
		.digital_tube2(digital_tube2), 
		.digital_Sel0(digital_Sel0), 
		.digital_Sel1(digital_Sel1), 
		.digital_Sel2(digital_Sel2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		RxD = 0;
		dip_switch7 = 0;
		dip_switch6 = 0;
		dip_switch5 = 0;
		dip_switch4 = 0;
		dip_switch3 = 0;
		dip_switch2 = 0;
		dip_switch1 = 0;
		dip_switch0 = 0;
		user_key = 0;

		// Wait 100 ns for global reset to finish
		#100;
        reset=0;
		// Add stimulus here
		#10000 $finish;
	end
	
	always #5 clk=~clk;
      
endmodule

