// This program was cloned from: https://github.com/SimNabong/4-Sensored-Brushless-DC-BLDC-Controller-with-UART-
// License: MIT License

//all 4 motors can individually be control to either spin CW, spin CCW, and regen brake 2. for regen brake 1, they brake together in 2's. motor 1 and 2 together and 3 and 4 together. 
//the 4 functions each motor has is clockwise spin,counter-clockwise spin, regenerative brakeing using high-side mosfets, and regen brakeing using the low-side mosfets
//this is a diverging combinationalcircuit that goes from 8(the 8-bits from the UART receiver) to 12(the input for the commutation controller for the motor)
module Diverging8bit(
	input [7:0] In, //8-bit input from the receiver
	input clk,
	output [11:0]CCin //commutationcontroller input 0to2 is M1,3-5 is m2,6-8 is m3,9-11 is m4
//these outputs are fed into the motor commutatiom controller, each motor having individual commutiontion controller with 3 input each
);

	assign CCin[0]= In[0]&In[1]&In[2]&In[3];
	assign CCin[3] = In[0]&In[1]&In[2]&In[3];
	
	assign CCin[1] = In[0]&~In[2] | In[0]&~In[3] | In[0]&~In[1];
	assign CCin[2] = In[1]&~In[3] | ~In[0]&In[1] | In[1]&~In[2];
	
	assign CCin[4] = In[2]&~In[3] | ~In[1]&In[2] | ~In[0]&In[2];
	assign CCin[5] = ~In[0]&In[3] | ~In[1]&In[3] | ~In[2]&In[3];
	
	assign CCin[6] = In[4]&In[5]&In[6]&In[7];
	assign CCin[9] = In[4]&In[5]&In[6]&In[7];
	
	assign CCin[7] = In[4]&~In[6] | In[4]&~In[7] | In[4]&~In[5];
	assign CCin[8] = In[5]&~In[7] | In[5]&~In[6] | ~In[4]&In[5];
	
	assign CCin[10] = In[6]&~In[7] | ~In[4]&In[6] | ~In[5]&In[6];
	assign CCin[11] = ~In[6]&In[7] | ~In[4]&In[7] | ~In[5]&In[7];
	

endmodule
