module Blinky(
   input wire clk,
   output wire[7:0] leds 
);

reg [25:0] counter;

assign leds = counter[25:18];

always @(posedge clk) begin
	counter <= counter + 1;
end

endmodule
