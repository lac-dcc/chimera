// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

/*-----------------------------------------------\
 --         

The role of the data controller is to control the data output from the accumulator. 
The data bus is time-multiplexed and will transmit instructions or data 
depending on the current state.

The data is only allowed to be output when writing to the RAM area or port, 
otherwise it shows a high resistance state.

in is the 8bit data input.
data_ena is the enable signal
data is an 8-bit data output.          --
\-----------------------------------------------*/

module datactl (
	input [7:0] in 		, // Data input
	input 	 	data_ena, // Data Enable
	output wire [7:0] data // Data output
	
);

	assign data = (data_ena) ? in : 8'bzzzz_zzzz;

endmodule