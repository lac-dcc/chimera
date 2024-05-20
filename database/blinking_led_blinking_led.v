// This program was cloned from: https://github.com/zavala55/blinking_led
// License: Creative Commons Zero v1.0 Universal

module blinking_led (
	input clk,
	output [9:0] LED
);

reg [24:0] cnt;

initial begin
cnt <= 32'h00000000;
end

always @ (posedge clk) begin
cnt <= cnt + 1;
end

assign LED[1:0] = cnt[24:23];
assign LED[9:8] = cnt[21:20];
//assign LED[9:1] = 9'b101010101;
assign LED[7:2] = 8'b000000000;

endmodule