// This program was cloned from: https://github.com/Mariam-Katamashvili/Veri-Simple
// License: MIT License

module register3_bit (
	input reset, set, load, clock, // Reset, set, load and clock inputs
	input [2:0] in, // 3-bit input
	output reg [2:0] out // 3-bit register outputs
);

// The ouput is set to the value of the input at the rising edge of the clock signal
// Posedge represents a positive egde on the clock signal. Without it behavior of the code will not be synchronized.
	always @(posedge clock, posedge reset, posedge set) begin// The always block inside the module is triggered on the rising edge of the clock.
		// When the reset input signal is asserted (signal goes high), the code within the if statement will be executed.
		if (reset) begin // Asynchronously reset the register to 0
			out <= 3'b000;
		end 
		
		else if (set) begin // Asynchronously set the register to 1
			out <= 3'b001;
		end 
		
		else if (load) begin // Synchronously load the input data on the rising clock edge
			out <= in;
		end
		
	end

endmodule 