`include "timescale.v"
`include "define.v"

module h264i(
input         clk,reset_n,
input [15:0]  ai_data,
input         ai_we,
output        ao_next,
output 	slice_end,
output [7:0]  pic_width_in_mbs_minus1,pic_height_in_map_units_minus1,

output [31:0] img0,img1,img2,img3,
output img_wr_n,
output [6:0] mb_h,mb_v,
output [5:0] intra16_pred_num,
output sps_complete



);
   
wire                    rbi_next;
wire                    rbo_we;   
wire [15:0]             rbo_data;

wire [6:0]              pc,pc_reg;
wire [4:0] 					pc_delta;
wire [15:0]             BitStream_buffer_output;
wire [31:0]             BitStream_buffer_output_ex32;
   
wire [1:0] 		   remove_03_flag;
wire [15:0] 		   removed_03;
/*wire bo_ce,bo_oe;
 
assign bo_ce = 1;
assign bo_oe = 1;*/


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
	.we(rbo_we),.pc(pc[6:0]),.pc_delta(pc_delta),.pc_reg(pc_reg),
   .next(rbi_next),.remove_03_flag(remove_03_flag),
	.BitStream_buffer_output(BitStream_buffer_output),
	.BitStream_buffer_output_ex32(BitStream_buffer_output_ex32),
	.removed_03(removed_03)
);



h264_top h264_top(
	.clk(clk),.reset_n(reset_n),
   .BitStream_buffer_output(BitStream_buffer_output),
	.BitStream_buffer_output_ex32(BitStream_buffer_output_ex32),
   .pc(pc),.pc_delta(pc_delta),.pc_reg(pc_reg),
	.removed_03(removed_03),
	.slice_end(slice_end),.sps_complete(sps_complete),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),
	.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.img0(img0),.img1(img1),.img2(img2),.img3(img3),
	.img_wr_n(img_wr_n),.mb_h(mb_h),.mb_v(mb_v),
	.intra16_pred_num(intra16_pred_num)
	
);



endmodule
