// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module mdr_mux_2_to_1 (
    output reg [31:0] out,              // output of the MDR Mux
    input wire read,                    // 0 for from bus, 1 for from mem chip
    input wire [31:0] from_bus,         // input from bus
    input wire [31:0] from_mem_chip		// input from mem chip
);
	always @(*) begin
		if (read)
			out <= from_mem_chip;
		else
			out <= from_bus;
	end

endmodule