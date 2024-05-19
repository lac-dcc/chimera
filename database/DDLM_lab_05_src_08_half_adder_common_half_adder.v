// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module half_adder
(
    input  wire x, y, 
    output wire z,
    output wire carry_out
);
	assign {carry_out, z} = x + y;
endmodule