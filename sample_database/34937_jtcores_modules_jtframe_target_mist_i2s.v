// This program was cloned from: https://github.com/jotego/jtcores
// License: GNU General Public License v3.0

// taken and tweaked from MiSTer sys/

module i2s #(parameter
	// Clock Setting
	I2S_Freq = 48_000,     // 48 KHz
	AUDIO_DW = 16
)(
	input        reset,
	input        clk,
	input [31:0] clk_rate,

	output reg sclk,
	output reg lrclk,
	output reg sdata,

	input [AUDIO_DW-1:0]	left_chan,
	input [AUDIO_DW-1:0]	right_chan
);


localparam I2S_FreqX2 = I2S_Freq*2*AUDIO_DW*2;

reg  [31:0] cnt;
wire [31:0] cnt_next = cnt + I2S_FreqX2;
reg         ce;
reg  [ 4:0] bit_cnt = 1;

reg [AUDIO_DW-1:0] left;
reg [AUDIO_DW-1:0] right;

always @(posedge clk) begin
	ce <= 0;
	cnt <= cnt_next;
	if(cnt_next >= clk_rate) begin
		cnt <= cnt_next - clk_rate;
		ce <= 1;
	end
end


always @(posedge clk) begin
	if (reset) begin
		bit_cnt <= 1;
		lrclk   <= 1;
		sclk    <= 1;
		sdata   <= 1;
		sclk    <= 1;
	end
	else begin
		if(ce) begin
			sclk <= ~sclk;
			if(sclk) begin
				if(bit_cnt == AUDIO_DW) begin
					bit_cnt <= 1;
					lrclk <= ~lrclk;
					if(lrclk) begin
						left  <= left_chan;
						right <= right_chan;
					end
				end
				else begin
					bit_cnt <= bit_cnt + 1'd1;
				end
				sdata <= lrclk ? right[AUDIO_DW - bit_cnt] : left[AUDIO_DW - bit_cnt];
			end
		end
	end
end

endmodule
