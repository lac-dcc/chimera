// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

module bitCounter13(
	input clk,
	input reset,
	output reg [12:0] out
);

always @(posedge clk or posedge reset) begin
	out <= reset ? 13'b0 : (out + 1'b1);
	
end

endmodule