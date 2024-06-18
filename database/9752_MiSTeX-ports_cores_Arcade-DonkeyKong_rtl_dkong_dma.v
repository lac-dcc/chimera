// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

//============================================================================
// Sprite DMA.
// 
// Author: gaz68 (https://github.com/gaz68)
// October 2019
//
// Simplified sprite DMA. To Do: Implement full 8257 DMA controller.
// Added HRQ/HLDA - slingshot
//============================================================================

module dkong_dma
(
	input		I_CLK,
	input		I_CLK_EN,
	input		I_RSTn,
	input		I_DMA_TRIG,
	input		[7:0]I_DMA_DS,
	input   I_HLDA,

	output  reg O_HRQ,
	output	[9:0]O_DMA_AS,
	output 	[9:0]O_DMA_AD,
	output	[7:0]O_DMA_DD,
	output	O_DMA_CES,
	output	O_DMA_CED
);

parameter dma_cnt_end = 10'h17F;

reg W_DMA_EN = 1'b0;
reg [10:0]W_DMA_CNT;
reg [7:0]W_DMA_DATA;
reg [9:0]DMA_ASr;
reg [9:0]DMA_ADr;
reg [7:0]DMA_DDr;
reg DMA_CESr, DMA_CEDr;

always @(posedge I_CLK)
if (I_CLK_EN) begin : dma_block
	reg old_trig;

	old_trig <= I_DMA_TRIG;

	if(~old_trig & I_DMA_TRIG)
		begin
			DMA_ASr   <= 10'h100; 
			DMA_ADr   <= 0;
			W_DMA_CNT <= 0;
			W_DMA_EN  <= 1'b1;
			DMA_CESr  <= 1'b1;
			DMA_CEDr  <= 1'b1;
			O_HRQ     <= 1'b1;
		end
	else if(W_DMA_EN) begin
		if (I_HLDA) begin
			case(W_DMA_CNT[1:0])
				1: DMA_DDr <= I_DMA_DS;
				2: DMA_ASr <= DMA_ASr + 1'd1;
				3: DMA_ADr <= DMA_ADr + 1'd1;
				default:;
			endcase 
			W_DMA_CNT <= W_DMA_CNT + 1'd1;
			W_DMA_EN <= W_DMA_CNT==dma_cnt_end*4 ? 1'b0 : 1'b1;
		end
	end else
		begin
			O_HRQ <= 1'b0;
			DMA_CESr <= 1'b0;
			DMA_CEDr <= 1'b0;
		end
end

assign O_DMA_AS	= DMA_ASr;
assign O_DMA_AD   = DMA_ADr;
assign O_DMA_DD   = DMA_DDr;
assign O_DMA_CES  = DMA_CESr;
assign O_DMA_CED  = DMA_CEDr;


endmodule
