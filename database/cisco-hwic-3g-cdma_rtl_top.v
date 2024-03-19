
module top(
	input           clk25,
    output [3:0]    leds
	);

    reg [25:0] counter;
	
    always @(posedge clk25) begin
        counter <= counter + 1;
    end

    assign leds = counter[25:21];
	
endmodule
	
