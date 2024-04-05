`include "timescale.v"
`include "define.v"

module h264i(
             input         clk,
             input         reset_n,
             input [15:0]  ai_data,
             input         ai_we,
             output        ao_next,

             output        bo_we_luma,bo_we_chroma, 
             output [19:0] bo_addr_luma,
	     output [18:0] bo_addr_chroma,
             output [31:0] bo_data,
	     output [15:0] POC,
             output        co_lastMB_DF          //last mb df for one frame

             );
   
   wire                    rbi_next;
   wire                    rbo_we;   
   wire [15:0]             rbo_data;

   wire [31:0]             pc;
   wire [15:0]             BitStream_buffer_output;
   wire [31:0]             BitStream_buffer_output_ex32;
   
   wire [1:0] 		   remove_03_flag;
   wire [15:0] 		   removed_03;



remove_03 remove_03(
	.clk(clk),.reset_n(reset_n),
	.ai_we(ai_we),.ai_data(ai_data),
	.ao_next(ao_next),

	.bi_next(rbi_next),
	.bo_we(rbo_we),                
	.bo_data(rbo_data),

	.remove_03_flag(remove_03_flag)

);

Bitstream_buffer Bitstream_buffer(
	.clk(clk),.reset_n(reset_n),
	.BitStream_buffer_input(rbo_data),
	.we(rbo_we),.pc(pc[6:0]),
        .next(rbi_next),.remove_03_flag(remove_03_flag),
	.BitStream_buffer_output(BitStream_buffer_output),
	.BitStream_buffer_output_ex32(BitStream_buffer_output_ex32),
	.removed_03(removed_03)
);



h264_top h264_top(
	.clk(clk),.reset_n(reset_n),
        .BitStream_buffer_output(BitStream_buffer_output),
	.BitStream_buffer_output_ex32(BitStream_buffer_output_ex32),
        .pc(pc),.removed_03(removed_03),
	.end_of_lastMB_DF(co_lastMB_DF),
	.POC(POC),

	.luma_ram_w(bo_we_luma),.chroma_ram_w(bo_we_chroma),
	.luma_ram_addr(bo_addr_luma),
	.chroma_ram_addr(bo_addr_chroma),
	.final_frame_RAM_din(bo_data)         //7-0 left   31-23 right
);



endmodule
