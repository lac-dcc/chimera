// This program was cloned from: https://github.com/zephray/vga_to_ascii
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:53:59 02/24/2018
// Design Name:   top
// Module Name:   C:/Users/ZephRay/Documents/GitHub/vga_to_ascii/vga_input/test.v
// Project Name:  vga_input
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	wire VGA_IN_DATA_CLK;
	reg [7:0] VGA_IN_BLUE;
	reg [7:0] VGA_IN_GREEN;
	reg [7:0] VGA_IN_RED;
	wire VGA_IN_HSOUT;
	reg VGA_IN_ODD_EVEN_B;
	wire VGA_IN_VSOUT;
	reg VGA_IN_SOGOUT;
	reg GPIO_SW_C;
	reg GPIO_SW_W;
	reg GPIO_SW_E;
	reg GPIO_SW_S;
	reg GPIO_SW_N;
	reg [7:0] GPIO_DIP_SW;
	reg DVI_GPIO1;
	reg FPGA_CPU_RESET_B;
	reg CLK_33MHZ_FPGA;
	reg CLK_27MHZ_FPGA;

	// Outputs
	wire [7:0] GPIO_LED;
	wire GPIO_LED_C;
	wire GPIO_LED_W;
	wire GPIO_LED_E;
	wire GPIO_LED_S;
	wire GPIO_LED_N;
	wire [11:0] DVI_D;
	wire DVI_DE;
	wire DVI_H;
	wire DVI_RESET_B;
	wire DVI_V;
	wire DVI_XCLK_N;
	wire DVI_XCLK_P;

	// Bidirs
	wire IIC_SCL_VIDEO;
	wire IIC_SDA_VIDEO;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.IIC_SCL_VIDEO(IIC_SCL_VIDEO), 
		.IIC_SDA_VIDEO(IIC_SDA_VIDEO), 
		.VGA_IN_DATA_CLK(VGA_IN_DATA_CLK), 
		.VGA_IN_BLUE(VGA_IN_BLUE), 
		.VGA_IN_GREEN(VGA_IN_GREEN), 
		.VGA_IN_RED(VGA_IN_RED), 
		.VGA_IN_HSOUT(VGA_IN_HSOUT), 
		.VGA_IN_ODD_EVEN_B(VGA_IN_ODD_EVEN_B), 
		.VGA_IN_VSOUT(VGA_IN_VSOUT), 
		.VGA_IN_SOGOUT(VGA_IN_SOGOUT), 
		.GPIO_SW_C(GPIO_SW_C), 
		.GPIO_SW_W(GPIO_SW_W), 
		.GPIO_SW_E(GPIO_SW_E), 
		.GPIO_SW_S(GPIO_SW_S), 
		.GPIO_SW_N(GPIO_SW_N), 
		.GPIO_DIP_SW(GPIO_DIP_SW), 
		.GPIO_LED(GPIO_LED), 
		.GPIO_LED_C(GPIO_LED_C), 
		.GPIO_LED_W(GPIO_LED_W), 
		.GPIO_LED_E(GPIO_LED_E), 
		.GPIO_LED_S(GPIO_LED_S), 
		.GPIO_LED_N(GPIO_LED_N), 
		.DVI_D(DVI_D), 
		.DVI_DE(DVI_DE), 
		.DVI_H(DVI_H), 
		.DVI_RESET_B(DVI_RESET_B), 
		.DVI_V(DVI_V), 
		.DVI_XCLK_N(DVI_XCLK_N), 
		.DVI_XCLK_P(DVI_XCLK_P), 
		.DVI_GPIO1(DVI_GPIO1), 
		.FPGA_CPU_RESET_B(FPGA_CPU_RESET_B), 
		.CLK_33MHZ_FPGA(CLK_33MHZ_FPGA), 
		.CLK_27MHZ_FPGA(CLK_27MHZ_FPGA)
	);
    
    wire hs, vs;
    
    dvi_timing timgen (
        .clk(VGA_IN_DATA_CLK),
        .rst(~FPGA_CPU_RESET_B),
        .hs(hs),
        .vs(vs),
        .x(),
        .y(),
        .enable(),
        .address()
    );
    
    assign VGA_IN_HSOUT = ~hs;
    assign VGA_IN_VSOUT = ~vs;
    
    clk_gen clkgen(VGA_IN_DATA_CLK);

	initial begin
		// Initialize Inputs
		VGA_IN_BLUE = 8'hFF;
		VGA_IN_GREEN = 8'hFF;
		VGA_IN_RED = 8'hFF;
		VGA_IN_ODD_EVEN_B = 0;
		VGA_IN_SOGOUT = 0;
		GPIO_SW_C = 0;
		GPIO_SW_W = 0;
		GPIO_SW_E = 0;
		GPIO_SW_S = 0;
		GPIO_SW_N = 0;
		GPIO_DIP_SW = 0;
		DVI_GPIO1 = 0;
		FPGA_CPU_RESET_B = 0;
		CLK_33MHZ_FPGA = 0;
		CLK_27MHZ_FPGA = 0;

		// Wait 100 ns for global reset to finish
		#100;
        FPGA_CPU_RESET_B = 1;
        
		// Add stimulus here

	end
      
endmodule

module clk_gen(output reg clk);

	parameter period = 25;
	
	initial clk = 0;
	
	always begin
		#(period/2);
		clk = ~clk;
	end
	
endmodule
