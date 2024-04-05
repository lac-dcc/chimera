`include "timescale.v"
`include "define.v"

module df_mem_ctrl(
input clk,reset_n,
input [5:0] DF_edge_counter_MW,DF_edge_counter_MR,
input [1:0] one_edge_counter_MW,one_edge_counter_MR,
input [2:0] bs_curr_MR,bs_curr_MW,
input [7:0] mb_num_h_DF,mb_num_v_DF,
input [7:0] q0_MW,q1_MW,q2_MW,q3_MW,p0_MW,p1_MW,p2_MW,p3_MW,
input  DF_duration,
input [7:0] pic_width_in_mbs_minus1, 
input [7:0] pic_height_in_map_units_minus1,
output reg [31:0] buf0_0,buf0_1,buf0_2,buf0_3,
output reg [31:0] buf1_0,buf1_1,buf1_2,buf1_3,
output reg [31:0] buf2_0,buf2_1,buf2_2,buf2_3,
output reg [31:0] buf3_0,buf3_1,buf3_2,buf3_3,
output reg [31:0] t0_0,t0_1,t0_2,t0_3,
output reg [31:0] t1_0,t1_1,t1_2,t1_3,
output reg [31:0] t2_0,t2_1,t2_2,t2_3,

output reg end_of_MB_DF,end_of_lastMB_DF,

output DF_mbAddrA_RF_rd,
output DF_mbAddrA_RF_wr,
output  [4:0] DF_mbAddrA_RF_rd_addr,
output  [4:0] DF_mbAddrA_RF_wr_addr,
output reg [31:0] DF_mbAddrA_RF_din,
	
output DF_mbAddrB_RAM_rd,
output DF_mbAddrB_RAM_wr,
output  [12:0] DF_mbAddrB_RAM_addr,
output reg [31:0] DF_mbAddrB_RAM_din,

output final_frame_RAM_wr,
output [20:0] final_frame_RAM_addr,
output reg [31:0] final_frame_RAM_din,

output luma_ram_w,chroma_ram_w,
output [19:0] luma_ram_addr,
output [18:0] chroma_ram_addr
);


wire Is_mbAddrA_wr;
wire Is_mbAddrA_real_wr;
wire Is_mbAddrA_virtual_wr;
wire Is_mbAddrB_wr;
wire Is_currMB_wr;
wire Is_12cycles_wr;
wire final_frame_RAM_wr_tmp;

//------------------------------------------------------
//buf0
//------------------------------------------------------
wire buf0_no_transpose;	//buf0 updated without transpose
wire buf0_transpose;	//buf0 updated after   transpose
assign buf0_no_transpose = (
		DF_edge_counter_MW == 6'd0  || DF_edge_counter_MW == 6'd4  || DF_edge_counter_MW == 6'd6  ||
		DF_edge_counter_MW == 6'd12 || DF_edge_counter_MW == 6'd16 || DF_edge_counter_MW == 6'd20 ||
		DF_edge_counter_MW == 6'd22 || DF_edge_counter_MW == 6'd28 || DF_edge_counter_MW == 6'd32 ||
		DF_edge_counter_MW == 6'd36 || DF_edge_counter_MW == 6'd40 || DF_edge_counter_MW == 6'd44);
assign buf0_transpose = (
		DF_edge_counter_MW == 6'd1  || DF_edge_counter_MW == 6'd5  || DF_edge_counter_MW == 6'd10 ||
		DF_edge_counter_MW == 6'd14 || DF_edge_counter_MW == 6'd17 || DF_edge_counter_MW == 6'd26 ||
		DF_edge_counter_MW == 6'd30 || DF_edge_counter_MW == 6'd33 || DF_edge_counter_MW == 6'd38 ||
		DF_edge_counter_MW == 6'd41 || DF_edge_counter_MW == 6'd46);
		
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin 
		buf0_0 <= 0;	buf0_1 <= 0;	buf0_2 <= 0;	buf0_3 <= 0;
	end
	//no transpose update,always "q" position (right or down of the edge to be filtered)
	else if(DF_duration)begin
		if (buf0_no_transpose)
		case (one_edge_counter_MW)
		2'd0:buf0_0 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		2'd1:buf0_1 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		2'd2:buf0_2 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		2'd3:buf0_3 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		endcase
		//transpose update,always "p" position (left or up of the edge to be filtered)
	else if (buf0_transpose)
		case (one_edge_counter_MW)
		2'd0:begin	buf0_0[7:0]   <= p3_MW;	buf0_1[7:0]   <= p2_MW;
				buf0_2[7:0]   <= p1_MW;	buf0_3[7:0]   <= p0_MW;	end
		2'd1:begin	buf0_0[15:8]  <= p3_MW;	buf0_1[15:8]  <= p2_MW;
				buf0_2[15:8]  <= p1_MW;	buf0_3[15:8]  <= p0_MW;	end
		2'd2:begin	buf0_0[23:16] <= p3_MW;	buf0_1[23:16] <= p2_MW;
				buf0_2[23:16] <= p1_MW;	buf0_3[23:16] <= p0_MW;	end
		2'd3:begin	buf0_0[31:24] <= p3_MW;	buf0_1[31:24] <= p2_MW;
				buf0_2[31:24] <= p1_MW;	buf0_3[31:24] <= p0_MW;	end
		endcase	
	end
//------------------------------------------------------
//buf1
//------------------------------------------------------
wire buf1_no_transpose;	//buf1 updated without transpose
wire buf1_transpose;	//buf1 updated after   transpose
wire buf1_transpose_p;	//buf1 transpose and buf1 stores "p" position pixels
assign buf1_no_transpose = ( 
		DF_edge_counter_MW == 6'd1  || DF_edge_counter_MW == 6'd8  || DF_edge_counter_MW == 6'd13 ||
		DF_edge_counter_MW == 6'd17 || DF_edge_counter_MW == 6'd24 || DF_edge_counter_MW == 6'd29 ||
		DF_edge_counter_MW == 6'd37 || DF_edge_counter_MW == 6'd45);
assign buf1_transpose = (
		DF_edge_counter_MW == 6'd6  || DF_edge_counter_MW == 6'd10 || DF_edge_counter_MW == 6'd22 || 
		DF_edge_counter_MW == 6'd26 || DF_edge_counter_MW == 6'd33 || DF_edge_counter_MW == 6'd41);
assign buf1_transpose_p = (DF_edge_counter_MW == 6'd6  || DF_edge_counter_MW == 6'd9  
							|| DF_edge_counter_MW == 6'd22);
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin 
		buf1_0 <= 0;	buf1_1 <= 0;	buf1_2 <= 0;	buf1_3 <= 0;
	end
	//no transpose update,always "q" position (right or down of the edge to be filtered)
	else if(DF_duration)begin
		if (buf1_no_transpose)
		case (one_edge_counter_MW)
		2'd0:buf1_0 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		2'd1:buf1_1 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		2'd2:buf1_2 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		2'd3:buf1_3 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		endcase
	//transpose update,"p":6/9/22,"q":10,26,33,41
	else if (buf1_transpose)begin 
		if (buf1_transpose_p)	// edge 6,22  "p"
			case (one_edge_counter_MW)
			2'd0:begin	buf1_0[7:0]   <= p3_MW;	buf1_1[7:0]   <= p2_MW;
					buf1_2[7:0]   <= p1_MW;	buf1_3[7:0]   <= p0_MW;	end
			2'd1:begin	buf1_0[15:8]  <= p3_MW;	buf1_1[15:8]  <= p2_MW;
					buf1_2[15:8]  <= p1_MW;	buf1_3[15:8]  <= p0_MW;	end
			2'd2:begin	buf1_0[23:16] <= p3_MW;	buf1_1[23:16] <= p2_MW;
					buf1_2[23:16] <= p1_MW;	buf1_3[23:16] <= p0_MW;	end
			2'd3:begin	buf1_0[31:24] <= p3_MW;	buf1_1[31:24] <= p2_MW;
					buf1_2[31:24] <= p1_MW;	buf1_3[31:24] <= p0_MW;	end
			endcase
		else
			case (one_edge_counter_MW)
			2'd0:begin	buf1_0[7:0]   <= q0_MW;	buf1_1[7:0]   <= q1_MW;
					buf1_2[7:0]   <= q2_MW;	buf1_3[7:0]   <= q3_MW;	end
			2'd1:begin	buf1_0[15:8]  <= q0_MW;	buf1_1[15:8]  <= q1_MW;
					buf1_2[15:8]  <= q2_MW;	buf1_3[15:8]  <= q3_MW;	end
			2'd2:begin	buf1_0[23:16] <= q0_MW;	buf1_1[23:16] <= q1_MW;
					buf1_2[23:16] <= q2_MW;	buf1_3[23:16] <= q3_MW;	end
			2'd3:begin	buf1_0[31:24] <= q0_MW;	buf1_1[31:24] <= q1_MW;
					buf1_2[31:24] <= q2_MW;	buf1_3[31:24] <= q3_MW;	end
		endcase
		end
	end
//------------------------------------------------------
//buf2
//------------------------------------------------------
wire buf2_no_transpose;	//buf2 updated without transpose
wire buf2_transpose;	//buf2 updated after   transpose
wire buf2_transpose_p;	//buf2 transpose and buf2 stores "p" position pixels
assign buf2_no_transpose = ( 
		DF_edge_counter_MW == 6'd2  || DF_edge_counter_MW == 6'd7  || DF_edge_counter_MW == 6'd18 ||
		DF_edge_counter_MW == 6'd23 || DF_edge_counter_MW == 6'd34 || DF_edge_counter_MW == 6'd42);
assign buf2_transpose = (
		DF_edge_counter_MW == 6'd3  || DF_edge_counter_MW == 6'd11 || DF_edge_counter_MW == 6'd19 ||
		DF_edge_counter_MW == 6'd21 || DF_edge_counter_MW == 6'd27 || DF_edge_counter_MW == 6'd30 ||
		DF_edge_counter_MW == 6'd35 || DF_edge_counter_MW == 6'd38 || DF_edge_counter_MW == 6'd43 ||
		DF_edge_counter_MW == 6'd46);
assign buf2_transpose_p = (DF_edge_counter_MW == 6'd3  || DF_edge_counter_MW == 6'd11  
			|| DF_edge_counter_MW == 6'd19 || DF_edge_counter_MW == 6'd27
			|| DF_edge_counter_MW == 6'd35 || DF_edge_counter_MW == 6'd43);
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin 
		buf2_0 <= 0;	buf2_1 <= 0;	buf2_2 <= 0;	buf2_3 <= 0;
	end
	//no transpose update,always "q" position (right or down of the edge to be filtered)
	else if(DF_duration)begin
		if (buf2_no_transpose)
		case (one_edge_counter_MW)
		2'd0:buf2_0 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		2'd1:buf2_1 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		2'd2:buf2_2 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		2'd3:buf2_3 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		endcase
	//transpose update,"p":3,11,19,27,35,43  "q":21,30,38,46
		else if (buf2_transpose)begin 
			if (buf2_transpose_p)	//"p":3,11,19,27,35,43
			case (one_edge_counter_MW)
			2'd0:begin	buf2_0[7:0]   <= p3_MW;	buf2_1[7:0]   <= p2_MW;
					buf2_2[7:0]   <= p1_MW;	buf2_3[7:0]   <= p0_MW;	end
			2'd1:begin	buf2_0[15:8]  <= p3_MW;	buf2_1[15:8]  <= p2_MW;
					buf2_2[15:8]  <= p1_MW;	buf2_3[15:8]  <= p0_MW;	end
			2'd2:begin	buf2_0[23:16] <= p3_MW;	buf2_1[23:16] <= p2_MW;
					buf2_2[23:16] <= p1_MW;	buf2_3[23:16] <= p0_MW;	end
			2'd3:begin	buf2_0[31:24] <= p3_MW;	buf2_1[31:24] <= p2_MW;
					buf2_2[31:24] <= p1_MW;	buf2_3[31:24] <= p0_MW;	end
			endcase
		else					//"q":21,30,38,46
			case (one_edge_counter_MW)
			2'd0:begin	buf2_0[7:0]   <= q0_MW;	buf2_1[7:0]   <= q1_MW;
					buf2_2[7:0]   <= q2_MW;	buf2_3[7:0]   <= q3_MW;	end
			2'd1:begin	buf2_0[15:8]  <= q0_MW;	buf2_1[15:8]  <= q1_MW;
					buf2_2[15:8]  <= q2_MW;	buf2_3[15:8]  <= q3_MW;	end
			2'd2:begin	buf2_0[23:16] <= q0_MW;	buf2_1[23:16] <= q1_MW;
					buf2_2[23:16] <= q2_MW;	buf2_3[23:16] <= q3_MW;	end
			2'd3:begin	buf2_0[31:24] <= q0_MW;	buf2_1[31:24] <= q1_MW;
					buf2_2[31:24] <= q2_MW;	buf2_3[31:24] <= q3_MW;	end
			endcase
		end	
	end
//------------------------------------------------------
//buf3
//------------------------------------------------------
wire buf3_no_transpose;	//buf3 updated without transpose
wire buf3_transpose;	//buf3 updated after   transpose
wire buf3_transpose_p;	//buf3 transpose and buf1 stores "p" position pixels
assign buf3_no_transpose = (DF_edge_counter_MW == 6'd3  || DF_edge_counter_MW == 6'd19);
assign buf3_transpose = (	DF_edge_counter_MW == 6'd7  || 
	DF_edge_counter_MW == 6'd11 || DF_edge_counter_MW == 6'd23 || DF_edge_counter_MW == 6'd27 || 
	DF_edge_counter_MW == 6'd25 || DF_edge_counter_MW == 6'd35 || DF_edge_counter_MW == 6'd43);
assign buf3_transpose_p = (DF_edge_counter_MW == 6'd7  || DF_edge_counter_MW == 6'd23);  
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin 
		buf3_0 <= 0;	buf3_1 <= 0;	buf3_2 <= 0;	buf3_3 <= 0;
	end
	//no transpose update,always "q" position (right or down of the edge to be filtered)
	else if(DF_duration)begin
		if (buf3_no_transpose)
		case (one_edge_counter_MW)
		2'd0:buf3_0 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		2'd1:buf3_1 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		2'd2:buf3_2 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		2'd3:buf3_3 <= {q3_MW,q2_MW,q1_MW,q0_MW};
		endcase
	//transpose update,"p":7,23  "q":11,25,27,35,43
		else if (buf3_transpose)begin 
			if (buf3_transpose_p)	//"p":7,23
			case (one_edge_counter_MW)
			2'd0:begin	buf3_0[7:0]   <= p3_MW;	buf3_1[7:0]   <= p2_MW;
					buf3_2[7:0]   <= p1_MW;	buf3_3[7:0]   <= p0_MW;	end
			2'd1:begin	buf3_0[15:8]  <= p3_MW;	buf3_1[15:8]  <= p2_MW;
					buf3_2[15:8]  <= p1_MW;	buf3_3[15:8]  <= p0_MW;	end
			2'd2:begin	buf3_0[23:16] <= p3_MW;	buf3_1[23:16] <= p2_MW;
					buf3_2[23:16] <= p1_MW;	buf3_3[23:16] <= p0_MW;	end
			2'd3:begin	buf3_0[31:24] <= p3_MW;	buf3_1[31:24] <= p2_MW;
					buf3_2[31:24] <= p1_MW;	buf3_3[31:24] <= p0_MW;	end
			endcase
		else					//"q":11,25,35,43
			case (one_edge_counter_MW)
			2'd0:begin	buf3_0[7:0]   <= q0_MW;	buf3_1[7:0]   <= q1_MW;
					buf3_2[7:0]   <= q2_MW;	buf3_3[7:0]   <= q3_MW;	end
			2'd1:begin	buf3_0[15:8]  <= q0_MW;	buf3_1[15:8]  <= q1_MW;
					buf3_2[15:8]  <= q2_MW;	buf3_3[15:8]  <= q3_MW;	end
			2'd2:begin	buf3_0[23:16] <= q0_MW;	buf3_1[23:16] <= q1_MW;
					buf3_2[23:16] <= q2_MW;	buf3_3[23:16] <= q3_MW;	end
			2'd3:begin	buf3_0[31:24] <= q0_MW;	buf3_1[31:24] <= q1_MW;
					buf3_2[31:24] <= q2_MW;	buf3_3[31:24] <= q3_MW;	end
			endcase
		end
	end
//------------------------------------------------------
//T0:always updated after transpose,always "p" position
//------------------------------------------------------
wire t0_transpose;		//t0 updated after transpose
assign t0_transpose = (
	DF_edge_counter_MW == 6'd4  || DF_edge_counter_MW == 6'd8  || DF_edge_counter_MW == 6'd12 || DF_edge_counter_MW == 6'd36 || 
	DF_edge_counter_MW == 6'd44 || DF_edge_counter_MW == 6'd15 || DF_edge_counter_MW == 6'd20 || DF_edge_counter_MW == 6'd24 || 
	DF_edge_counter_MW == 6'd28 || DF_edge_counter_MW == 6'd31 || DF_edge_counter_MW == 6'd39 || DF_edge_counter_MW == 6'd47);

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin 
		t0_0 <= 0;	t0_1 <= 0;	t0_2 <= 0;	t0_3 <= 0;
	end
	//always transpose update for "p" position
	else if (t0_transpose&&DF_duration)
		case (one_edge_counter_MW)
		2'd0:begin	t0_0[7:0]   <= p3_MW;	t0_1[7:0]   <= p2_MW;
				t0_2[7:0]   <= p1_MW;	t0_3[7:0]   <= p0_MW;	end
		2'd1:begin	t0_0[15:8]  <= p3_MW;	t0_1[15:8]  <= p2_MW;
				t0_2[15:8]  <= p1_MW;	t0_3[15:8]  <= p0_MW;	end
		2'd2:begin	t0_0[23:16] <= p3_MW;	t0_1[23:16] <= p2_MW;
				t0_2[23:16] <= p1_MW;	t0_3[23:16] <= p0_MW;	end
		2'd3:begin	t0_0[31:24] <= p3_MW;	t0_1[31:24] <= p2_MW;
				t0_2[31:24] <= p1_MW;	t0_3[31:24] <= p0_MW;	end
		endcase
//------------------------------------------------------
//T1:always updated after transpose
//------------------------------------------------------
wire t1_transpose;		//t1 updated after   transpose
wire t1_transpose_q;	//t1 transpose and t1 stores "q" position pixels
assign t1_transpose = (
	DF_edge_counter_MW == 6'd13 || DF_edge_counter_MW == 6'd37 || DF_edge_counter_MW == 6'd45 || DF_edge_counter_MW == 6'd9  || 
	DF_edge_counter_MW == 6'd21 || DF_edge_counter_MW == 6'd25 || DF_edge_counter_MW == 6'd29 || DF_edge_counter_MW == 6'd31 || 
	DF_edge_counter_MW == 6'd39 || DF_edge_counter_MW == 6'd47);
	
assign t1_transpose_q = (DF_edge_counter_MW == 6'd31 || DF_edge_counter_MW == 6'd39 || 
							 DF_edge_counter_MW == 6'd47);
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin 
		t1_0 <= 0;	t1_1 <= 0;	t1_2 <= 0;	t1_3 <= 0;
	end
	else if(DF_duration)begin
		if (t1_transpose && !t1_transpose_q)	//t1 transpose "p"
		case (one_edge_counter_MW)
		2'd0:begin	t1_0[7:0]   <= p3_MW;	t1_1[7:0]   <= p2_MW;
				t1_2[7:0]   <= p1_MW;	t1_3[7:0]   <= p0_MW;	end
		2'd1:begin	t1_0[15:8]  <= p3_MW;	t1_1[15:8]  <= p2_MW;
				t1_2[15:8]  <= p1_MW;	t1_3[15:8]  <= p0_MW;	end
		2'd2:begin	t1_0[23:16] <= p3_MW;	t1_1[23:16] <= p2_MW;
				t1_2[23:16] <= p1_MW;	t1_3[23:16] <= p0_MW;	end
		2'd3:begin	t1_0[31:24] <= p3_MW;	t1_1[31:24] <= p2_MW;
				t1_2[31:24] <= p1_MW;	t1_3[31:24] <= p0_MW;	end
		endcase
	else if (t1_transpose)						//t1 transpose "q"
		case (one_edge_counter_MW)
		2'd0:begin	t1_0[7:0]   <= q0_MW;	t1_1[7:0]   <= q1_MW;
				t1_2[7:0]   <= q2_MW;	t1_3[7:0]   <= q3_MW;	end
		2'd1:begin	t1_0[15:8]  <= q0_MW;	t1_1[15:8]  <= q1_MW;
				t1_2[15:8]  <= q2_MW;	t1_3[15:8]  <= q3_MW;	end
		2'd2:begin	t1_0[23:16] <= q0_MW;	t1_1[23:16] <= q1_MW;
				t1_2[23:16] <= q2_MW;	t1_3[23:16] <= q3_MW;	end
		2'd3:begin	t1_0[31:24] <= q0_MW;	t1_1[31:24] <= q1_MW;
				t1_2[31:24] <= q2_MW;	t1_3[31:24] <= q3_MW;	end
		endcase
	end
//--------------------------------------------------------------------
//T2:only used after filter edge 18/34/42 to update mbAddrB of left MB
//-------------------------------------------------------------------- 
wire t2_wr;
assign t2_wr = ((mb_num_h_DF != 0 && mb_num_v_DF != pic_height_in_map_units_minus1) && 
	(DF_edge_counter_MW == 6'd18 || DF_edge_counter_MW == 6'd34 || DF_edge_counter_MW == 6'd42));
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		t2_0 <= 0;	t2_1 <= 0;	t2_2 <= 0;	t2_3 <= 0;
	end
	else if (t2_wr&&DF_duration)
		case (one_edge_counter_MW)
		2'd0:begin	t2_0[7:0]   <= p3_MW;	t2_1[7:0]   <= p2_MW;
				t2_2[7:0]   <= p1_MW;	t2_3[7:0]   <= p0_MW;	end
		2'd1:begin	t2_0[15:8]  <= p3_MW;	t2_1[15:8]  <= p2_MW;
				t2_2[15:8]  <= p1_MW;	t2_3[15:8]  <= p0_MW;	end
		2'd2:begin	t2_0[23:16] <= p3_MW;	t2_1[23:16] <= p2_MW;
				t2_2[23:16] <= p1_MW;	t2_3[23:16] <= p0_MW;	end
		2'd3:begin	t2_0[31:24] <= p3_MW;	t2_1[31:24] <= p2_MW;
				t2_2[31:24] <= p1_MW;	t2_3[31:24] <= p0_MW;	end
		endcase


reg [3:0] DF_12_cycles; 
always @ (posedge clk)
	if (reset_n == 1'b0)
		DF_12_cycles <= 4'd12;
	else if (DF_edge_counter_MW == 6'd47 && one_edge_counter_MW == 2'd3)
		DF_12_cycles <= 0;
	else if (DF_12_cycles != 4'd12)
		DF_12_cycles <= DF_12_cycles + 1;


always @ (posedge clk)
	if (reset_n == 1'b0)begin
		end_of_MB_DF 	 <= 1'b0;
		end_of_lastMB_DF <= 1'b0;end	
	else if (DF_12_cycles == 4'd11)begin
		end_of_MB_DF 	   <= (!(mb_num_h_DF == pic_width_in_mbs_minus1 && mb_num_v_DF == pic_height_in_map_units_minus1))? 1'b1:1'b0;
		end_of_lastMB_DF <=   (mb_num_h_DF == pic_width_in_mbs_minus1 && mb_num_v_DF == pic_height_in_map_units_minus1)?  1'b1:1'b0;end
	else begin
		end_of_MB_DF 	   <= 1'b0;
		end_of_lastMB_DF <= 1'b0;end

wire [1:0] write_0to3_cycle; 
assign write_0to3_cycle = (DF_12_cycles == 4'd12)? one_edge_counter_MW:DF_12_cycles[1:0];

//-------------------------------------------------------------------
//DF_mbAddrA_RF control
//-------------------------------------------------------------------
	
//For edge 18,34,42,it will update mbAddrB of left MB.So no matter bs_curr_MR is equal to 0 or not,
//mbAddrA should be read out for writing to mbAddrB of left MB.Otherwise,the value written to left
//mbAddrB will be a wrong value.
assign DF_mbAddrA_RF_rd = (mb_num_h_DF != 0 && (((
	DF_edge_counter_MR == 6'd0  || DF_edge_counter_MR == 6'd2  || DF_edge_counter_MR == 6'd16 || 
	DF_edge_counter_MR == 6'd32 || DF_edge_counter_MR == 6'd40) && bs_curr_MR != 0) || (
	DF_edge_counter_MR == 6'd18 || DF_edge_counter_MR == 6'd34 || DF_edge_counter_MR == 6'd42)));
	
assign DF_mbAddrA_RF_wr = 	  (DF_edge_counter_MW == 6'd16 || DF_edge_counter_MW == 6'd30 ||
	DF_edge_counter_MW == 6'd32 || DF_edge_counter_MW == 6'd33 || DF_edge_counter_MW == 6'd40 ||
	DF_edge_counter_MW == 6'd41 || DF_12_cycles[3:2] == 2'b01  || DF_12_cycles[3:2] == 2'b10);

reg [2:0] DF_mbAddrA_RF_rd_addr_blk4x4;
always @ (DF_mbAddrA_RF_rd or DF_edge_counter_MR)
	if (DF_mbAddrA_RF_rd)
		case (DF_edge_counter_MR)
		6'd0 :DF_mbAddrA_RF_rd_addr_blk4x4 = 3'd0;	//mbAddrA0
		6'd2 :DF_mbAddrA_RF_rd_addr_blk4x4 = 3'd1;	//mbAddrA1
		6'd16:DF_mbAddrA_RF_rd_addr_blk4x4 = 3'd2;	//mbAddrA2
		6'd18:DF_mbAddrA_RF_rd_addr_blk4x4 = 3'd3;	//mbAddrA3
		6'd32:DF_mbAddrA_RF_rd_addr_blk4x4 = 3'd4;	//mbAddrA4
		6'd34:DF_mbAddrA_RF_rd_addr_blk4x4 = 3'd5;	//mbAddrA5
		6'd40:DF_mbAddrA_RF_rd_addr_blk4x4 = 3'd6;	//mbAddrA6
		6'd42:DF_mbAddrA_RF_rd_addr_blk4x4 = 3'd7;	//mbAddrA7
		default:DF_mbAddrA_RF_rd_addr_blk4x4 = 0;
		endcase
	else
		DF_mbAddrA_RF_rd_addr_blk4x4 = 0;

assign DF_mbAddrA_RF_rd_addr = {5{DF_mbAddrA_RF_rd}} & 
				({DF_mbAddrA_RF_rd_addr_blk4x4,2'b0} + {3'b0,one_edge_counter_MR}); 

reg [2:0] DF_mbAddrA_RF_wr_addr_blk4x4;
always @ (DF_mbAddrA_RF_wr or DF_edge_counter_MW or DF_12_cycles[3:2])
	if (DF_mbAddrA_RF_wr)begin
		if (DF_edge_counter_MW != 6'd48)
			case (DF_edge_counter_MW)
			6'd16:DF_mbAddrA_RF_wr_addr_blk4x4 = 3'd0;	//mbAddrA0
			6'd30:DF_mbAddrA_RF_wr_addr_blk4x4 = 3'd1;	//mbAddrA1
			6'd32:DF_mbAddrA_RF_wr_addr_blk4x4 = 3'd2;	//mbAddrA2
			6'd33:DF_mbAddrA_RF_wr_addr_blk4x4 = 3'd3;	//mbAddrA3
			6'd40:DF_mbAddrA_RF_wr_addr_blk4x4 = 3'd4;	//mbAddrA4
			6'd41:DF_mbAddrA_RF_wr_addr_blk4x4 = 3'd5;	//mbAddrA5
			default:DF_mbAddrA_RF_wr_addr_blk4x4 = 0;
			endcase
		else if (DF_12_cycles[3:2] == 2'b01)
				DF_mbAddrA_RF_wr_addr_blk4x4 = 3'd6;
		else
				DF_mbAddrA_RF_wr_addr_blk4x4 = 3'd7;
		end
	else
		DF_mbAddrA_RF_wr_addr_blk4x4 = 0;
				
assign DF_mbAddrA_RF_wr_addr = {5{DF_mbAddrA_RF_wr}} & 
				({DF_mbAddrA_RF_wr_addr_blk4x4,write_0to3_cycle});

wire Is_mbAddrA_t1; 
assign Is_mbAddrA_t1 = (DF_edge_counter_MW == 6'd30 || DF_edge_counter_MW == 6'd33 || 
					DF_edge_counter_MW == 6'd41 || DF_12_cycles[3:2] == 2'b10);
	 
always @ (DF_mbAddrA_RF_wr or Is_mbAddrA_t1 or write_0to3_cycle or 
		t0_0 or t0_1 or t0_2 or t0_3 or t1_0 or t1_1 or t1_2 or t1_3)
	if (DF_mbAddrA_RF_wr)begin 
		if (Is_mbAddrA_t1)
			case (write_0to3_cycle)
			2'd0:DF_mbAddrA_RF_din = t1_0;
			2'd1:DF_mbAddrA_RF_din = t1_1;
			2'd2:DF_mbAddrA_RF_din = t1_2;
			2'd3:DF_mbAddrA_RF_din = t1_3;
			endcase
		else
			case (write_0to3_cycle)
			2'd0:DF_mbAddrA_RF_din = t0_0;
			2'd1:DF_mbAddrA_RF_din = t0_1;
			2'd2:DF_mbAddrA_RF_din = t0_2;
			2'd3:DF_mbAddrA_RF_din = t0_3;
			endcase
			end
		else
		DF_mbAddrA_RF_din = 0;

//-------------------------------------------------------------------
//DF_mbAddrB_RAM control
//-------------------------------------------------------------------
assign DF_mbAddrB_RAM_rd = (((
	DF_edge_counter_MR == 6'd4  || DF_edge_counter_MR == 6'd8  || DF_edge_counter_MR == 6'd12 || 
	DF_edge_counter_MR == 6'd13	|| DF_edge_counter_MR == 6'd36 || DF_edge_counter_MR == 6'd37 || 
	DF_edge_counter_MR == 6'd44 || DF_edge_counter_MR == 6'd45) && mb_num_v_DF != 0) || 
	DF_edge_counter_MR == 6'd20 || DF_edge_counter_MR == 6'd24 || DF_edge_counter_MR == 6'd28 || 
	DF_edge_counter_MR == 6'd29); 
	
wire DF_mbAddrB_RAM_wr_curr;
assign DF_mbAddrB_RAM_wr_curr = (((
	DF_edge_counter_MW == 6'd21 || DF_edge_counter_MW == 6'd25 || DF_edge_counter_MW == 6'd30 || 
	DF_edge_counter_MW == 6'd31 || DF_edge_counter_MW == 6'd38 || DF_edge_counter_MW == 6'd39 || 
	DF_edge_counter_MW == 6'd46 || DF_edge_counter_MW == 6'd47) && mb_num_v_DF != pic_height_in_map_units_minus1) || 
	DF_edge_counter_MW == 6'd5  || DF_edge_counter_MW == 6'd9  || DF_edge_counter_MW == 6'd14 || 
	DF_edge_counter_MW == 6'd15); 
	
wire DF_mbAddrB_RAM_wr_leftMB;
assign DF_mbAddrB_RAM_wr_leftMB = (mb_num_h_DF != 0 && mb_num_v_DF != pic_height_in_map_units_minus1 && ( 
	DF_edge_counter_MW == 6'd20 || DF_edge_counter_MW == 6'd37 || DF_edge_counter_MW == 6'd45));
	
assign DF_mbAddrB_RAM_wr = DF_mbAddrB_RAM_wr_curr | DF_mbAddrB_RAM_wr_leftMB;
	
reg [2:0] DF_mbAddrB_RAM_addr_blk4x4;
always @ (DF_mbAddrB_RAM_rd or DF_edge_counter_MR or DF_mbAddrB_RAM_wr_curr 
		or DF_mbAddrB_RAM_wr_leftMB or DF_edge_counter_MW)
		if (DF_mbAddrB_RAM_rd)
			case (DF_edge_counter_MR)
				6'd4, 6'd20:DF_mbAddrB_RAM_addr_blk4x4 = 3'd0;
				6'd8, 6'd24:DF_mbAddrB_RAM_addr_blk4x4 = 3'd1;
				6'd12,6'd28:DF_mbAddrB_RAM_addr_blk4x4 = 3'd2;
				6'd13,6'd29:DF_mbAddrB_RAM_addr_blk4x4 = 3'd3;
				6'd36	   :DF_mbAddrB_RAM_addr_blk4x4 = 3'd4;
				6'd37	   :DF_mbAddrB_RAM_addr_blk4x4 = 3'd5;
				6'd44	   :DF_mbAddrB_RAM_addr_blk4x4 = 3'd6;
				6'd45	   :DF_mbAddrB_RAM_addr_blk4x4 = 3'd7;
				default	   :DF_mbAddrB_RAM_addr_blk4x4 = 0;
			endcase
		else if (DF_mbAddrB_RAM_wr_curr)
			case (DF_edge_counter_MW)
				6'd5, 6'd21:DF_mbAddrB_RAM_addr_blk4x4 = 3'd0;
				6'd9, 6'd25:DF_mbAddrB_RAM_addr_blk4x4 = 3'd1;
				6'd14,6'd30:DF_mbAddrB_RAM_addr_blk4x4 = 3'd2;
				6'd15,6'd31:DF_mbAddrB_RAM_addr_blk4x4 = 3'd3;
				6'd38	   :DF_mbAddrB_RAM_addr_blk4x4 = 3'd4;
				6'd39	   :DF_mbAddrB_RAM_addr_blk4x4 = 3'd5;
				6'd46	   :DF_mbAddrB_RAM_addr_blk4x4 = 3'd6;
				6'd47	   :DF_mbAddrB_RAM_addr_blk4x4 = 3'd7;
				default	   :DF_mbAddrB_RAM_addr_blk4x4 = 0;
			endcase
		else if (DF_mbAddrB_RAM_wr_leftMB)
			case (DF_edge_counter_MW)
				6'd20:DF_mbAddrB_RAM_addr_blk4x4 = 3'd3;
				6'd37:DF_mbAddrB_RAM_addr_blk4x4 = 3'd5;
				default:DF_mbAddrB_RAM_addr_blk4x4 = 3'd7;
			endcase
		else
			DF_mbAddrB_RAM_addr_blk4x4 = 0;	
	
reg [1:0] DF_mbAddrB_RAM_addr_offset;
always @ (DF_mbAddrB_RAM_rd or one_edge_counter_MR or DF_mbAddrB_RAM_wr or one_edge_counter_MW)
	if 	(DF_mbAddrB_RAM_rd)	DF_mbAddrB_RAM_addr_offset = one_edge_counter_MR;
	else if (DF_mbAddrB_RAM_wr)	DF_mbAddrB_RAM_addr_offset = one_edge_counter_MW;
	else				DF_mbAddrB_RAM_addr_offset = 0;
	
wire [7:0] mb_num_h_DF_m1;
assign mb_num_h_DF_m1 = {8{Is_mbAddrA_wr | DF_mbAddrB_RAM_wr_leftMB}} & (mb_num_h_DF - 1);
	
wire [12:0] mb_num_h_DF_x32;
assign mb_num_h_DF_x32 = (DF_mbAddrB_RAM_wr_leftMB)? {mb_num_h_DF_m1,5'b0}:{mb_num_h_DF,5'b0};
assign DF_mbAddrB_RAM_addr = mb_num_h_DF_x32 + {8'b0,DF_mbAddrB_RAM_addr_blk4x4,2'b0} + {11'b0,DF_mbAddrB_RAM_addr_offset};
	
always @ (DF_mbAddrB_RAM_wr_curr or DF_mbAddrB_RAM_wr_leftMB or one_edge_counter_MW
		or q0_MW or q1_MW or q2_MW or q3_MW or t2_0 or t2_1 or t2_2 or t2_3)
		if (DF_mbAddrB_RAM_wr_curr)
			DF_mbAddrB_RAM_din = {q3_MW,q2_MW,q1_MW,q0_MW};
		else if (DF_mbAddrB_RAM_wr_leftMB)
			case (one_edge_counter_MW)
				2'd0:DF_mbAddrB_RAM_din = t2_0;
				2'd1:DF_mbAddrB_RAM_din = t2_1;
				2'd2:DF_mbAddrB_RAM_din = t2_2;
				2'd3:DF_mbAddrB_RAM_din = t2_3;
			endcase
		else
			DF_mbAddrB_RAM_din = 0;

//final

//h v num(0-23) 0123
//7 7 5 2
wire [6:0] final_mb_num_h,final_mb_num_v;
reg [4:0] final_num;

wire [8:0] luma_final_x;
wire [10:0] luma_final_y;
wire [1:0] luma_final_x_l,luma_final_y_l;
wire chroma_final_x_l,chroma_final_y_l;
wire [7:0] chroma_final_x;
wire [9:0] chroma_final_y;

assign luma_final_x_l =  (final_num == 0||final_num == 2||final_num == 8||final_num == 10)?2'd0:
		  	(final_num == 1||final_num == 3||final_num == 9||final_num == 11)?2'd1:
		  	(final_num == 4||final_num == 6||final_num == 12||final_num == 14)?2'd2:
		  	(final_num == 5||final_num == 7||final_num == 13||final_num == 15)?2'd3:0;

assign luma_final_y_l = (final_num == 0||final_num == 1||final_num == 4||final_num == 5)?2'd0:
		  	(final_num == 2||final_num == 3||final_num == 6||final_num == 7)?2'd1:
		  	(final_num == 8||final_num == 9||final_num == 12||final_num == 13)?2'd2:
		  	(final_num == 10||final_num == 11||final_num == 14||final_num == 15)?2'd3:0;  

assign chroma_final_x_l = (final_num == 17||final_num == 19||final_num == 21||final_num == 23)?1:0;

assign chroma_final_y_l = (final_num == 18||final_num == 19||final_num == 22||final_num == 23)?1:0;


assign luma_final_x = {final_mb_num_h,luma_final_x_l};
assign luma_final_y = {final_mb_num_v,luma_final_y_l,write_0to3_cycle};

assign chroma_final_x = {final_mb_num_h,chroma_final_x_l};
assign chroma_final_y = {final_mb_num_v,chroma_final_y_l,write_0to3_cycle};

assign luma_ram_w = final_frame_RAM_wr&&final_num[4]==0;
assign chroma_ram_w = final_frame_RAM_wr&&final_num[4]==1;

assign luma_ram_addr = {luma_final_x,luma_final_y};
assign chroma_ram_addr = {final_num[2],chroma_final_x,chroma_final_y};








assign final_mb_num_h = Is_mbAddrA_real_wr?(mb_num_h_DF[6:0]-1):mb_num_h_DF[6:0];
assign final_mb_num_v = Is_mbAddrB_wr?(mb_num_v_DF[6:0]-1):mb_num_v_DF[6:0];
assign final_frame_RAM_addr = {final_mb_num_h,final_mb_num_v,final_num,write_0to3_cycle};

always@(DF_edge_counter_MW or DF_12_cycles or Is_12cycles_wr or
		 Is_mbAddrA_real_wr or Is_mbAddrB_wr or final_frame_RAM_wr or reset_n)
	if (reset_n == 1'b0)
		final_num = 0;
	else if ( final_frame_RAM_wr)
		case({Is_mbAddrA_real_wr,Is_mbAddrB_wr,Is_currMB_wr,Is_12cycles_wr})
		4'b1000:
			case(DF_edge_counter_MW)
			0:final_num=5;
			2:final_num=7;
			16:final_num=13;
			18:final_num=15;
			32:final_num=17;
			34:final_num=19;
			40:final_num=21;
			42:final_num=23;
			endcase
		4'b0100:
			case(DF_edge_counter_MW)
			5:final_num=10;
			9:final_num=11;
			13:final_num=14;
			14:final_num=15;
			37:final_num=18;
			38:final_num=19;
			45:final_num=22;
			46:final_num=23;
			endcase
		4'b0010:
			case(DF_edge_counter_MW)
			6:final_num=0;
			10:final_num=1;
			15:final_num=4;
			17:final_num=5;
			21:final_num=2;
			22:final_num=10;
			23:final_num=8;
			25:final_num=3;
			26:final_num=11;
			27:final_num=9;
			29:final_num=6;
			30:final_num=7;
			31:final_num=12;
			33:final_num=14;
			35:final_num=13;
			36:final_num=15;
			39:final_num=16;
			41:final_num=18;
			43:final_num=17;
			44:final_num=19;
			47:final_num=20;
			endcase
		4'b0001:
			case (DF_12_cycles[3:2])
			2'b00:final_num=22;//0 ~ 3,buf2 -> blk22
			2'b01:final_num=21;//4 ~ 7,T0   -> blk21		
			default:final_num=23;//8 ~ 11,T1 -> blk23
				
			endcase
		default:;
		endcase
	
		
			
		
			


assign Is_mbAddrA_wr = (mb_num_h_DF != 0 && (
	DF_edge_counter_MW == 6'd0  || DF_edge_counter_MW == 6'd2  || DF_edge_counter_MW == 6'd16 ||
	DF_edge_counter_MW == 6'd18 || DF_edge_counter_MW == 6'd32 || DF_edge_counter_MW == 6'd34 ||
	DF_edge_counter_MW == 6'd40 || DF_edge_counter_MW == 6'd42));
assign Is_mbAddrA_real_wr    = (Is_mbAddrA_wr && bs_curr_MW != 0);
assign Is_mbAddrA_virtual_wr = (Is_mbAddrA_wr && bs_curr_MW == 0);
	
assign Is_mbAddrB_wr = (mb_num_v_DF != 0 && (
	DF_edge_counter_MW == 6'd5  || DF_edge_counter_MW == 6'd9  || DF_edge_counter_MW == 6'd13 ||
	DF_edge_counter_MW == 6'd14 || DF_edge_counter_MW == 6'd37 || DF_edge_counter_MW == 6'd38 || 
	DF_edge_counter_MW == 6'd45 || DF_edge_counter_MW == 6'd46));
assign Is_currMB_wr = ((
	DF_edge_counter_MW == 6'd6  || DF_edge_counter_MW == 6'd10 || DF_edge_counter_MW == 6'd15 ||
	DF_edge_counter_MW == 6'd17 || DF_edge_counter_MW == 6'd21 || DF_edge_counter_MW == 6'd22 ||
	DF_edge_counter_MW == 6'd23 || DF_edge_counter_MW == 6'd25 || DF_edge_counter_MW == 6'd26 ||
	DF_edge_counter_MW == 6'd27 || DF_edge_counter_MW == 6'd29 || DF_edge_counter_MW == 6'd30 || 
	DF_edge_counter_MW == 6'd31 || DF_edge_counter_MW == 6'd33 || DF_edge_counter_MW == 6'd35 ||
	DF_edge_counter_MW == 6'd36 || DF_edge_counter_MW == 6'd39 || DF_edge_counter_MW == 6'd41 || 
	DF_edge_counter_MW == 6'd43 || DF_edge_counter_MW == 6'd44 || DF_edge_counter_MW == 6'd47) /*&& one_edge_counter_MW != 4*/);
assign Is_12cycles_wr = (DF_12_cycles != 4'd12); 
assign final_frame_RAM_wr_tmp = 
	//( disable_DF && blk4x4_sum_counter[2] != 1'b1) || 
	 (Is_mbAddrA_wr || Is_mbAddrB_wr || Is_currMB_wr || Is_12cycles_wr);
assign final_frame_RAM_wr = (final_frame_RAM_wr_tmp & (~Is_mbAddrA_virtual_wr));

wire Is_mbAddrB_t1;
wire Is_currMB_buf0;
wire Is_currMB_buf2;
wire Is_currMB_buf3;
wire Is_currMB_t1;
assign Is_mbAddrB_t1  = (DF_edge_counter_MW == 6'd14 || DF_edge_counter_MW == 6'd38 || 
				 DF_edge_counter_MW == 6'd46);
assign Is_currMB_buf0 = (DF_edge_counter_MW == 6'd6  || DF_edge_counter_MW == 6'd15 || 
			 DF_edge_counter_MW == 6'd31 || DF_edge_counter_MW == 6'd39 ||
			 DF_edge_counter_MW == 6'd47);
assign Is_currMB_buf2 = (DF_edge_counter_MW == 6'd22 || DF_edge_counter_MW == 6'd33 || 
			 DF_edge_counter_MW == 6'd41);
assign Is_currMB_buf3 = (DF_edge_counter_MW == 6'd26);
assign Is_currMB_t1   = (DF_edge_counter_MW == 6'd10 || DF_edge_counter_MW == 6'd23 || 
			 DF_edge_counter_MW == 6'd27 || DF_edge_counter_MW == 6'd30 || 
			 DF_edge_counter_MW == 6'd36 || DF_edge_counter_MW == 6'd44); 

always @ ( final_frame_RAM_wr  or one_edge_counter_MW or 
	DF_12_cycles or Is_mbAddrA_real_wr or Is_mbAddrB_wr or Is_mbAddrB_t1 or Is_currMB_buf0 or 
	Is_currMB_buf2 or Is_currMB_buf3 or Is_currMB_t1 or Is_currMB_wr or 
	p0_MW or p1_MW or p2_MW or p3_MW or 
	buf0_0 or buf0_1 or buf0_2 or buf0_3 or  
	buf2_0 or buf2_1 or buf2_2 or buf2_3 or buf3_0 or buf3_1 or buf3_2 or buf3_3 or 
	t0_0 or t0_1 or t0_2 or t0_3 or t1_0 or t1_1 or t1_2 or t1_3)
	if ( final_frame_RAM_wr)
		case ({Is_mbAddrA_real_wr,Is_mbAddrB_wr,Is_currMB_wr})
		3'b100:	//Is_mbAddrA_wr
		final_frame_RAM_din = {p0_MW,p1_MW,p2_MW,p3_MW};
		3'b010:	//Is_mbAddrB_wr
		begin
			if (Is_mbAddrB_t1)		//T1 -> mbAddrB
				case (one_edge_counter_MW)
				2'd0:final_frame_RAM_din = t1_0;
				2'd1:final_frame_RAM_din = t1_1;
				2'd2:final_frame_RAM_din = t1_2;
				2'd3:final_frame_RAM_din = t1_3;
				endcase
			else 					//T0 -> mbAddrB
				case (one_edge_counter_MW)
				2'd0:final_frame_RAM_din = t0_0;
				2'd1:final_frame_RAM_din = t0_1;
				2'd2:final_frame_RAM_din = t0_2;
				2'd3:final_frame_RAM_din = t0_3;
				endcase
		end
		3'b001:	//Is_currMB_wr
			case ({Is_currMB_buf0,Is_currMB_buf2,Is_currMB_buf3,Is_currMB_t1})
			4'b1000:	//Is_currMB_buf0
				case (one_edge_counter_MW)
				2'd0:final_frame_RAM_din = buf0_0;
				2'd1:final_frame_RAM_din = buf0_1;
				2'd2:final_frame_RAM_din = buf0_2;
				2'd3:final_frame_RAM_din = buf0_3;
				endcase
			4'b0100:	//Is_currMB_buf2
				case (one_edge_counter_MW)
				2'd0:final_frame_RAM_din = buf2_0;
				2'd1:final_frame_RAM_din = buf2_1;
				2'd2:final_frame_RAM_din = buf2_2;
				2'd3:final_frame_RAM_din = buf2_3;
				endcase
			4'b0010:	//Is_currMB_buf3
				case (one_edge_counter_MW)
				2'd0:final_frame_RAM_din = buf3_0;
				2'd1:final_frame_RAM_din = buf3_1;
				2'd2:final_frame_RAM_din = buf3_2;
				2'd3:final_frame_RAM_din = buf3_3;
				endcase
			4'b0001:	//Is_currMB_t1
				case (one_edge_counter_MW)
				2'd0:final_frame_RAM_din = t1_0;
				2'd1:final_frame_RAM_din = t1_1;
				2'd2:final_frame_RAM_din = t1_2;
				2'd3:final_frame_RAM_din = t1_3;
				endcase
			default:	//Is_currMB_t0
				case (one_edge_counter_MW)
				2'd0:final_frame_RAM_din = t0_0;
				2'd1:final_frame_RAM_din = t0_1;
				2'd2:final_frame_RAM_din = t0_2;
				2'd3:final_frame_RAM_din = t0_3;
				endcase
			endcase
		default://additional 12 cycles
			case (DF_12_cycles[3:2])
			2'b00:	//0 ~ 3,buf2 -> blk22
				case (DF_12_cycles[1:0])
				2'd0:final_frame_RAM_din = buf2_0;
				2'd1:final_frame_RAM_din = buf2_1;
				2'd2:final_frame_RAM_din = buf2_2;
				2'd3:final_frame_RAM_din = buf2_3;
				endcase
			2'b01:	//4 ~ 7,T0	-> blk21
				case (DF_12_cycles[1:0])
				2'd0:final_frame_RAM_din = t0_0;
				2'd1:final_frame_RAM_din = t0_1;
				2'd2:final_frame_RAM_din = t0_2;
				2'd3:final_frame_RAM_din = t0_3;
				endcase
			default://8 ~ 11,T1 -> blk23
				case (DF_12_cycles[1:0])
				2'd0:final_frame_RAM_din = t1_0;
				2'd1:final_frame_RAM_din = t1_1;
				2'd2:final_frame_RAM_din = t1_2;
				2'd3:final_frame_RAM_din = t1_3;
			endcase
		endcase
	endcase
		else
			final_frame_RAM_din = 0;











endmodule
