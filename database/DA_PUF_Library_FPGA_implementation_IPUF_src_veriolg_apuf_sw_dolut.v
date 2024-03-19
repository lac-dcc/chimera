
//////////////////////////////////////////////////////////////////////////////////
// Company: SEAL, IIT KGP 
// Engineer: Durga Prasad Sahoo
// 
// Create Date:    18:12:08 08/23/2015 
// Design Name: 
// Module Name:    sw_dolut 
// Project Name: 
// Target Devices: Xilinx 7 series devices  
// Tool versions:  ISE 14.7
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module sw_dolut(iT,iB,c,vcc,oT,oB);

	input iT,iB;      // Input signals
	input vcc;
	input c;          // Challenge bit
	output oT,oB;     // Output signals
	
	LUT6_2 #( 
		.INIT(64'hccccaaaaaaaacccc) // Specify LUT Contents
	) SW(
		.O6(oT), 
		.O5(oB), 
		.I0(iT), 
		.I1(iB), 
		.I2(vcc), 
		.I3(vcc), 
		.I4(c), 
		.I5(vcc)                //(fast MUX select only available to O6 output)
	);


endmodule
