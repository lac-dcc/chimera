// This program was cloned from: https://github.com/Mariam-Katamashvili/Veri-Simple
// License: MIT License

module rom (address, sel, data);
	input [2:0] address; // 3-bit input. 
	input sel; // Selector.
	output reg [7:0] data; // 8-bit output.
	
	// The always block is sensitive to changes in either the sel input or the in input. 
	// This means that whenever there is a change in either of these inputs, the block will execute.
	always @ (sel or address) begin
		if (~sel) data = 8'b00; // If sel is low (ROM is disabled) output is set to 0.
		else begin // If sel is high then execute cases.
			case (address)
				3'b000: data = 8'b00000001; // Input 0 maps to output 1
            			3'b001: data = 8'b00000010; // Input 1 maps to output 2
            			3'b010: data = 8'b00000100; // Input 2 maps to output 4
           			3'b011: data = 8'b00001000; // Input 3 maps to output 8
            			default: data = 8'b00000000; // Default case
			endcase
		end
	end
	
endmodule 
