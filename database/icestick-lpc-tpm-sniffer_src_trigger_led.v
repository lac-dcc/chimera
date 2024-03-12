/*
 * iCEstick LPC TPM Sniffer (top.v)
 * 
 * LED trigger
 */

module trigger_led(
    input wire clk,
    input wire reset,
    input wire trigger,
    output reg led
);

    // registers
	reg [23:0] counter;                                 // counter

    // synchronous logic
	always @(posedge clk or posedge trigger)
    begin
		if (trigger)
        begin
			led <= 1'b1;
			counter <= 1_000_000;
		end else
        begin
			if (~reset)
            begin
				counter <= 24'd0;
				led <= 1'b0;
			end else
            begin
				if (counter == 24'd0)
                begin
					led <= 1'b0;
				end

				counter <= counter - 1'd1;
			end
		end
	end

endmodule
