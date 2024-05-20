// This program was cloned from: https://github.com/Mariam-Katamashvili/Veri-Simple
// License: MIT License

module clock_divider (clk, reset, out);
	input clk; //input clock signal
	input reset; //asynchronous reset signal
	output wire out; //output signal

	reg [1:0] count_pos; //register to count positive edges
	reg [1:0] count_neg; //register to count negative edges
  
        //positive edge counter
	always @ (posedge clk) //using posedge to detect rising edges
	begin 
		//<= is a non-blocking assignment, which means that the value of count_pos is updated concurrently with the rest of the circuit. 
		if (reset) count_pos <= 0; //when reset is asserted (set to 1) counter is asserted to 0.
		//if counter reaches 2, reset counter because 2 rising edges means that there are 3 edges in total 
		//and we have to represent it as 1 according to the task
		else if (count_pos == 2) count_pos <= 0;  
		else count_pos <= count_pos + 1; //increment the counter
		
	end 
	
	//negative edge counter
	always @ (negedge clk) //using negedge tp detect falling edges
	begin 
		//<= is a non-blocking assignment, which means that the value of count_neg is updated concurrently with the rest of the circuit. 
		if (reset) count_neg <= 0; //when reset is asserted (set to 1) counter is asserted to 0.
		//if counter reaches 2, reset counter because 2 falling edges means that there are 3 edges in total 
		//and we have to represent it as 1 according to the task
		else if (count_neg == 2) count_neg <= 0;
		else count_neg <= count_neg + 1; //increment the counter
	end
	
	//output
	assign out = ((count_pos == 2) | (count_neg == 2)); //output is asserted when either counter reaches 2
endmodule 
