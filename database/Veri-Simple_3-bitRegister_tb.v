// This program was cloned from: https://github.com/Mariam-Katamashvili/Veri-Simple
// License: MIT License

module tb();
	reg reset, set, load, clock; // Inputs
	reg [2:0] in;
	wire [2:0] out; // Outputs
	
	register3_bit dut( // Instantiate the DUT (Device Under Test)
		.reset(reset),
		.set(set),
		.load(load),
		.clock(clock),
		.in(in),
		.out(out)
	);
	
	always #10 clock = ~clock; // Clock generator. We need to generate a clock signal with a period of 10 time units
	
	initial begin
		// Initialize inputs
		reset = 1;
		set = 0;
		load = 0;
		in = 3'b000;
	
		#10 reset = 0; // Assert reset for 10 time units
		
		in = 3'b101; // Load input data and verify output
		load = 1;
		#10 load = 0;
		if (out !== 3'b101) $error("Error: unexpected output value");
		
		set = 1; // Set register and verify output
		#10 set = 0;
		if (out !== 3'b001) $error("Error: unexpected output value");
		
		reset = 1; // Reset register and verify output
		#10 reset = 0;
		if (out !== 3'b000) $error("Error: unexpected output value");
		
		#10 $finish; // Finish simulation
	end
	
endmodule 