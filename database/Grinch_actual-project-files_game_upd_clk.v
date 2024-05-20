// This program was cloned from: https://github.com/Fe1LDr/Grinch
// License: MIT License

module game_upd_clk (
	input wire in_clk, reset,
	input [9:0] x_in,
	input [9:0] y_in,
	output reg out_clk
);
	reg was_updated;
	reg [2:0] cycles;

	initial begin
		cycles <= 0;
	end

	always @(posedge in_clk) begin
		if (out_clk) begin
			was_updated <= 1;
		end
		else begin
			was_updated <=(cycles == 5) ? 1 : 0;
		end
	end

	always @(posedge in_clk) begin
		out_clk <= (~was_updated && (cycles == 5));
	end

	always @(posedge in_clk or negedge reset) begin
		if (!reset) begin
			cycles <= 0;
		end
		else begin
			if ((x_in == 39) && (y_in == 29)) begin
				cycles <= (cycles == 5) ? 0: cycles + 1;
			end
		end
	end

endmodule