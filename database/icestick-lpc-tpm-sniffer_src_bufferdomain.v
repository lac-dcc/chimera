/*
 * iCEstick LPC TPM Sniffer (bufferdomain.v)
 * 
 * buffer domain
 */
module bufferdomain #(parameter AW = 8)(
    input wire clk,
    input wire reset,                       // active low
    input wire [AW - 1:0] input_data,
    input wire input_enable,
    output reg [AW - 1:0] output_data,
    output reg output_enable
);

    // registers
	reg [1:0] counter;

    // synchronous logic
	always @(posedge input_enable)
    begin
		if (input_enable)
        begin
			output_data <= input_data;
		end
	end

	always @(posedge clk or posedge input_enable)
    begin
		if (input_enable)
        begin
			counter <= 2'd2;
		end else
        begin
			if (~reset)
            begin
				counter <= 2'd0;
			end else begin
				if (counter != 2'd0)
					counter <= counter - 1'd1;
			end
		end
	end

	always @(*)
    begin
		if (counter == 2'd1)
			output_enable = 1'b1;
		else
			output_enable = 1'b0;
	end

endmodule
