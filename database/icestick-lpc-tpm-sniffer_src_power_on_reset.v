/*
 * iCEstick LPC TPM Sniffer (power_on_reset.v)
 * 
 * Power on reset
 */

module power_on_reset(
	input wire clk,
	input wire pll_locked,
	output reg reset
);

    // registers
    reg [31:0] counter = 32'h2;

    // synchronous logic
    always @(*)
    begin
        if (counter == 32'd0)
            reset = 1'b1;
        else
            reset = 1'b0;
    end

    always @(posedge clk)
    begin
        if (counter != 32'd0 && pll_locked)
            counter <= counter - 1'd1;
    end

endmodule
