module audio(
    clock25mhz, clock12500khz, resetn,
    sample,

    //////////// Audio //////////
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK
);

input clock25mhz;
input clock12500khz;
input resetn;

input [23:0] sample;

//////////// Audio //////////
input AUD_ADCDAT;
inout AUD_ADCLRCK;
inout AUD_BCLK  = ~clock12500khz;
output AUD_DACDAT = pbdat;
inout AUD_DACLRCK = pblrc;
output AUD_XCK = ~clock25mhz;


reg [23:0] buffer;
reg [4:0] buffer_ctr;

reg pblrc;
reg pbdat;

reg [1:0] state;


always @(posedge clock12500khz or negedge resetn) begin
    if (!resetn) begin
        state <= 0;
		pblrc <= 1;
		pbdat <= 0;
    end else begin
		if (state == 0) begin
			buffer <= sample;
			pblrc <= 0;
			pbdat <= buffer[23];
			buffer_ctr <= 23;
			state <= 1;
		end else if (state == 1) begin
			pblrc <= 0;
			pbdat <= buffer[buffer_ctr];

			if (buffer_ctr == 0) begin
				buffer_ctr <= 23;
				state <= 2;
			end else begin
				buffer_ctr <= buffer_ctr - 1'b1;
				state <= 1;
			end
		end else if (state == 2) begin
			pblrc <= 1;
			pbdat <= buffer[buffer_ctr];

			if (buffer_ctr == 0) begin
				buffer_ctr <= 23;
				state <= 3;
			end else begin
				buffer_ctr <= buffer_ctr - 1'b1;
				state <= 2;
			end
		end else begin
			buffer <= sample;
			pblrc <= 1;
			pbdat <= 0;
			buffer_ctr <= 23;
			state <= 1;
		end
    end
end

endmodule
