`include "timescale.v"
`include "define.v"

module DF_decoder (
input clk,
input reset_n,
input end_of_MB_DEC,end_of_BS_DEC,
input [7:0] mb_num_h,mb_num_v,
input [11:0] bs_V0,bs_V1,bs_V2,bs_V3,bs_H0,bs_H1,bs_H2,bs_H3,
input [5:0] QPy,QPc,
input [3:0] slice_alpha_c0_offset_div2,slice_beta_offset_div2,
input [7:0] img_4x4_00,img_4x4_01,img_4x4_02,img_4x4_03,img_4x4_10,img_4x4_11,img_4x4_12,img_4x4_13,
input [7:0] img_4x4_20,img_4x4_21,img_4x4_22,img_4x4_23,img_4x4_30,img_4x4_31,img_4x4_32,img_4x4_33,
input [4:0] intra4x4_pred_num,intra16_pred_num,
input [2:0] residual_intra4x4_state,residual_intra16_state,residual_inter_state,
input [7:0] pic_width_in_mbs_minus1, 
input [7:0] pic_height_in_map_units_minus1,
output end_of_MB_DF,end_of_lastMB_DF,
output final_frame_RAM_wr,
output [20:0] final_frame_RAM_addr,
output [31:0] final_frame_RAM_din,


output luma_ram_w,chroma_ram_w,
output [19:0] luma_ram_addr,
output [18:0] chroma_ram_addr
);
wire [7:0] mb_num_h_DF;
wire [7:0] mb_num_v_DF;
wire [5:0] DF_edge_counter_MR,DF_edge_counter_MW;
wire [1:0] one_edge_counter_MR,one_edge_counter_MW;
wire [2:0] bs_curr_MR,bs_curr_MW;
wire [7:0] q0_MW,q1_MW,q2_MW,q3_MW;
wire [7:0] p0_MW,p1_MW,p2_MW,p3_MW;
wire [31:0] buf0_0,buf0_1,buf0_2,buf0_3;
wire [31:0] buf1_0,buf1_1,buf1_2,buf1_3;
wire [31:0] buf2_0,buf2_1,buf2_2,buf2_3;
wire [31:0] buf3_0,buf3_1,buf3_2,buf3_3;
wire [31:0] t0_0,t0_1,t0_2,t0_3;
wire [31:0] t1_0,t1_1,t1_2,t1_3;
wire [31:0] t2_0,t2_1,t2_2,t2_3;
wire DF_mbAddrA_RF_rd;
wire DF_mbAddrA_RF_wr;
wire [4:0] DF_mbAddrA_RF_rd_addr;
wire [4:0] DF_mbAddrA_RF_wr_addr;
wire [31:0] DF_mbAddrA_RF_din;
wire [31:0] DF_mbAddrA_RF_dout;
wire DF_mbAddrB_RAM_rd;
wire DF_mbAddrB_RAM_wr;
wire [12:0] DF_mbAddrB_RAM_addr;
wire [31:0] DF_mbAddrB_RAM_din;
wire [31:0] DF_mbAddrB_RAM_dout;
wire DF_duration;
wire [31:0] rec_out;
wire [127:0] rec_DF_RAM1_dout,rec_DF_RAM0_dout;
wire rec_DF_RAM0_wr_n;
wire rec_DF_RAM0_rd_n;
wire [4:0]rec_DF_RAM0_addr;
wire [127:0] rec_DF_RAM0_din;

wire rec_DF_RAM1_wr_n;
wire rec_DF_RAM1_rd_n;
wire [4:0]rec_DF_RAM1_addr;
wire [127:0] rec_DF_RAM1_din;
wire [5:0] QPy_addrA,QPc_addrA,QPy_addrB,QPc_addrB;

//deblocking_filter
deblocking_filter deblocking_filter(
	.clk(clk),.reset_n(reset_n),
	.end_of_MB_DEC(end_of_MB_DEC),.end_of_BS_DEC(end_of_BS_DEC),
	.end_of_MB_DF(end_of_MB_DF),.end_of_lastMB_DF(end_of_lastMB_DF),
	.mb_num_h(mb_num_h),.mb_num_v(mb_num_v),
	.bs_V0(bs_V0),.bs_V1(bs_V1),.bs_V2(bs_V2),.bs_V3(bs_V3),
	.bs_H0(bs_H0),.bs_H1(bs_H1),.bs_H2(bs_H2),.bs_H3(bs_H3),
	.QPy(QPy),.QPc(QPc),
	.slice_alpha_c0_offset_div2(slice_alpha_c0_offset_div2),.slice_beta_offset_div2(slice_beta_offset_div2),
	.intra4x4_pred_num(intra4x4_pred_num),.intra16_pred_num(intra16_pred_num),
	.QPy_addrA(QPy_addrA),.QPc_addrA(QPc_addrA),
	.QPy_addrB(QPy_addrB),.QPc_addrB(QPc_addrB),
	.DF_mbAddrA_RF_dout(DF_mbAddrA_RF_dout),.DF_mbAddrB_RAM_dout(DF_mbAddrB_RAM_dout),.rec_out(rec_out),
	.buf0_0(buf0_0),.buf0_1(buf0_1),.buf0_2(buf0_2),.buf0_3(buf0_3),
	.buf1_0(buf1_0),.buf1_1(buf1_1),.buf1_2(buf1_2),.buf1_3(buf1_3),
	.buf2_0(buf2_0),.buf2_1(buf2_1),.buf2_2(buf2_2),.buf2_3(buf2_3),
	.buf3_0(buf3_0),.buf3_1(buf3_1),.buf3_2(buf3_2),.buf3_3(buf3_3),
	
	.DF_duration(DF_duration),
	.mb_num_h_DF(mb_num_h_DF),.mb_num_v_DF(mb_num_v_DF),
	.DF_edge_counter_MR(DF_edge_counter_MR),.DF_edge_counter_MW(DF_edge_counter_MW),
	.one_edge_counter_MR(one_edge_counter_MR),.one_edge_counter_MW(one_edge_counter_MW),
	.bs_curr_MR(bs_curr_MR),.bs_curr_MW(bs_curr_MW),
	.q0_MW(q0_MW),.q1_MW(q1_MW),.q2_MW(q2_MW),.q3_MW(q3_MW),
	.p0_MW(p0_MW),.p1_MW(p1_MW),.p2_MW(p2_MW),.p3_MW(p3_MW)
);
//df_rw
df_rw df_rw(
	.clk(clk),.reset_n(reset_n),
	.img_4x4_00(img_4x4_00),.img_4x4_01(img_4x4_01),.img_4x4_02(img_4x4_02),.img_4x4_03(img_4x4_03),
	.img_4x4_10(img_4x4_10),.img_4x4_11(img_4x4_11),.img_4x4_12(img_4x4_12),.img_4x4_13(img_4x4_13),
	.img_4x4_20(img_4x4_20),.img_4x4_21(img_4x4_21),.img_4x4_22(img_4x4_22),.img_4x4_23(img_4x4_23),
	.img_4x4_30(img_4x4_30),.img_4x4_31(img_4x4_31),.img_4x4_32(img_4x4_32),.img_4x4_33(img_4x4_33),
	.residual_intra4x4_state(residual_intra4x4_state),.residual_intra16_state(residual_intra16_state),
	.residual_inter_state(residual_inter_state),
	.intra4x4_pred_num(intra4x4_pred_num),.intra16_pred_num(intra16_pred_num),
	.end_of_MB_DEC(end_of_MB_DEC),
	.DF_edge_counter_MR(DF_edge_counter_MR),.one_edge_counter_MR(one_edge_counter_MR),
	.rec_DF_RAM1_dout(rec_DF_RAM1_dout),.rec_DF_RAM0_dout(rec_DF_RAM0_dout),


	.rec_out(rec_out),

	.rec_DF_RAM0_wr_n(rec_DF_RAM0_wr_n),
	.rec_DF_RAM0_rd_n(rec_DF_RAM0_rd_n),
	.rec_DF_RAM0_addr(rec_DF_RAM0_addr),
	.rec_DF_RAM0_din(rec_DF_RAM0_din),

	.rec_DF_RAM1_wr_n(rec_DF_RAM1_wr_n),
	.rec_DF_RAM1_rd_n(rec_DF_RAM1_rd_n),
	.rec_DF_RAM1_addr(rec_DF_RAM1_addr),
	.rec_DF_RAM1_din(rec_DF_RAM1_din)
);
//df_mem_ctrl
df_mem_ctrl df_mem_ctrl(
	.clk(clk),.reset_n(reset_n),
	.DF_edge_counter_MR(DF_edge_counter_MR),.DF_edge_counter_MW(DF_edge_counter_MW),
	.one_edge_counter_MR(one_edge_counter_MR),.one_edge_counter_MW(one_edge_counter_MW),
	.bs_curr_MR(bs_curr_MR),.bs_curr_MW(bs_curr_MW),
	.mb_num_h_DF(mb_num_h_DF),.mb_num_v_DF(mb_num_v_DF),
	.q0_MW(q0_MW),.q1_MW(q1_MW),.q2_MW(q2_MW),.q3_MW(q3_MW),
	.p0_MW(p0_MW),.p1_MW(p1_MW),.p2_MW(p2_MW),.p3_MW(p3_MW),
	.DF_duration(DF_duration),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),

	.buf0_0(buf0_0),.buf0_1(buf0_1),.buf0_2(buf0_2),.buf0_3(buf0_3),
	.buf1_0(buf1_0),.buf1_1(buf1_1),.buf1_2(buf1_2),.buf1_3(buf1_3),
	.buf2_0(buf2_0),.buf2_1(buf2_1),.buf2_2(buf2_2),.buf2_3(buf2_3),
	.buf3_0(buf3_0),.buf3_1(buf3_1),.buf3_2(buf3_2),.buf3_3(buf3_3),
	.t0_0(t0_0),.t0_1(t0_1),.t0_2(t0_2),.t0_3(t0_3),
	.t1_0(t1_0),.t1_1(t1_1),.t1_2(t1_2),.t1_3(t1_3),
	.t2_0(t2_0),.t2_1(t2_1),.t2_2(t2_2),.t2_3(t2_3),

	.end_of_MB_DF(end_of_MB_DF),.end_of_lastMB_DF(end_of_lastMB_DF),

	.DF_mbAddrA_RF_rd(DF_mbAddrA_RF_rd),
	.DF_mbAddrA_RF_wr(DF_mbAddrA_RF_wr),
	.DF_mbAddrA_RF_rd_addr(DF_mbAddrA_RF_rd_addr),
	.DF_mbAddrA_RF_wr_addr(DF_mbAddrA_RF_wr_addr),
	.DF_mbAddrA_RF_din(DF_mbAddrA_RF_din),
	.DF_mbAddrB_RAM_rd(DF_mbAddrB_RAM_rd),
	.DF_mbAddrB_RAM_wr(DF_mbAddrB_RAM_wr),
	.DF_mbAddrB_RAM_addr(DF_mbAddrB_RAM_addr),
	.DF_mbAddrB_RAM_din(DF_mbAddrB_RAM_din),
	.final_frame_RAM_wr(final_frame_RAM_wr),
	.final_frame_RAM_addr(final_frame_RAM_addr),
	.final_frame_RAM_din(final_frame_RAM_din),

	.luma_ram_w(luma_ram_w),.chroma_ram_w(chroma_ram_w),
	.luma_ram_addr(luma_ram_addr),
	.chroma_ram_addr(chroma_ram_addr)
);

df_qp_mem_ctrl df_qp_mem_ctrl(
	.clk(clk),.reset_n(reset_n),
	.QPy(QPy),.QPc(QPc),
	.end_of_BS_DEC(end_of_BS_DEC),
	.mb_num_h_DF(mb_num_h_DF),

	.QPy_addrA(QPy_addrA),.QPc_addrA(QPc_addrA),
	.QPy_addrB(QPy_addrB),.QPc_addrB(QPc_addrB)
);

//rama
ram_Synch # (32,5)
	 ram_df_addra(
	.clk(clk),.rst_n(reset_n),
	.rd_n(~DF_mbAddrA_RF_rd),.wr_n(~DF_mbAddrA_RF_wr), 
	.rd_addr(DF_mbAddrA_RF_rd_addr),.wr_addr(DF_mbAddrA_RF_wr_addr),
	.data_in(DF_mbAddrA_RF_din),.data_out(DF_mbAddrA_RF_dout)
	); 
//ramb
ram_Synch # (32,13)
	 ram_df_addrb(
	.clk(clk),.rst_n(reset_n),
	.rd_n(~DF_mbAddrB_RAM_rd),.wr_n(~DF_mbAddrB_RAM_wr), 
	.rd_addr(DF_mbAddrB_RAM_addr),.wr_addr(DF_mbAddrB_RAM_addr),
	.data_in(DF_mbAddrB_RAM_din),.data_out(DF_mbAddrB_RAM_dout)
	); 
//ram0
ram # (128,5)
	 ram_df_0(
	.clk(clk),.reset_n(reset_n),
	.cs_n(rec_DF_RAM0_wr_n),.wr_n(rec_DF_RAM0_wr_n), 
	.rd_addr(rec_DF_RAM0_addr),.wr_addr(rec_DF_RAM0_addr),
	.data_in(rec_DF_RAM0_din),.data_out(rec_DF_RAM0_dout)
	); 
//ram1
ram # (128,5)
	 ram_df_1(
	.clk(clk),.reset_n(reset_n),
	.cs_n(rec_DF_RAM1_wr_n),.wr_n(rec_DF_RAM1_wr_n), 
	.rd_addr(rec_DF_RAM1_addr),.wr_addr(rec_DF_RAM1_addr),
	.data_in(rec_DF_RAM1_din),.data_out(rec_DF_RAM1_dout)
	); 
endmodule
