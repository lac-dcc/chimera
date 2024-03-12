`timescale 10ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:06:06 11/23/2012
// Design Name:   USB_LOOP_TEST
// Module Name:   D:/project/Verilog_luo/USB_LOOP_TEST/USB_LOOP_Sim.v
// Project Name:  USB_LOOP_TEST
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: USB_LOOP_TEST
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module USB_LOOP_Sim;

	// Inputs
	reg FPGA_GCLK1;
	reg CPU_RESET;
	reg USB_FLAGA;
	reg USB_FLAGB;
	reg USB_FLAGC;

	// Outputs
	wire [1:0] USB_FIFOADR;
	wire USB_SLCS;
	wire USB_SLOE;
	wire USB_SLRD;
	wire USB_SLWR;

	// Bidirs
	wire [15:0] USB_FD;

	// Instantiate the Unit Under Test (UUT)
	USB_LOOP_TEST uut (
		.FPGA_GCLK1(FPGA_GCLK1), 
		.CPU_RESET(CPU_RESET), 
		.USB_FIFOADR(USB_FIFOADR), 
		.USB_SLCS(USB_SLCS), 
		.USB_SLOE(USB_SLOE), 
		.USB_SLRD(USB_SLRD), 
		.USB_SLWR(USB_SLWR), 
		.USB_FD(USB_FD), 
		.USB_FLAGA(USB_FLAGA), 
		.USB_FLAGB(USB_FLAGB), 
		.USB_FLAGC(USB_FLAGC)
	);

	initial begin
		// Initialize Inputs
		FPGA_GCLK1 = 0;
		CPU_RESET = 1;
		USB_FLAGA = 1;
		USB_FLAGB = 0;
		USB_FLAGC = 0;

		// Wait 100 ns for global reset to finish
		#100;
		CPU_RESET = 0;		
		#1000;
		USB_FLAGA = 0;
      #1000; 


	end
	
	always #5 FPGA_GCLK1 = !FPGA_GCLK1;
      
endmodule

