`include "timescale.v"
`include "define.v"

module POC_decoding(
input clk,reset_n,
input [4:0] nal_unit_type,
input [1:0] pic_order_cnt_type,
input [3:0] frame_num,log2_max_frame_num_minus4,
input [3:0] log2_max_pic_order_cnt_lsb_minus4,
input [4:0] slice_header_state,seq_parameter_set_state,
input [1:0] nal_ref_idc,
input memory_management_control_operation_5,
input [9:0] pic_order_cnt_lsb,
input [7:0] num_ref_frames_in_pic_order_cnt_cycle,
input [10:0] offset_for_ref_frame,offset_for_ref_frame_i,
input [10:0] delta_pic_order_cnt,offset_for_non_ref_pic,
output POC_end,
output reg [15:0] POC,

output reg offset_for_ref_frame_rd_n,
output reg [7:0] offset_for_ref_frame_rd_addr


);

parameter poc_rst  = 3'b000;
parameter poc_frameNumInPicOrderCntCycle  = 3'b001;
parameter poc_expectedPicOrderCnt  = 3'b010;
parameter poc_buf  = 3'b100;
parameter poc_end  = 3'b011;

wire [15:0] absFrameNum;
reg [2:0] state;
reg [15:0] picOrderCntCycleCnt,frameNumInPicOrderCntCycle;
reg [15:0] picOrderCntCycleCnt_tmp,frameNumInPicOrderCntCycle_tmp;
reg frameNumInPicOrderCntCycle_keep;
reg [15:0] expectedPicOrderCnt_tmp,frameNumInPicOrderCntCycle_i;
reg [15:0] expectedPicOrderCnt;
reg expectedPicOrderCnt_keep;

always@(posedge clk or negedge reset_n)
	if (reset_n == 0)
		state <= poc_rst;
	else if(slice_header_state == `slice_header_POC)
		case(state)
		poc_rst:
			if(pic_order_cnt_type == 0 || pic_order_cnt_type == 2 )
				state <= poc_end;
			else if(absFrameNum > 0)
				state <= poc_frameNumInPicOrderCntCycle;
			else 	state <= poc_expectedPicOrderCnt;
		poc_frameNumInPicOrderCntCycle:
				state <= frameNumInPicOrderCntCycle_keep ? poc_frameNumInPicOrderCntCycle:
				frameNumInPicOrderCntCycle != 0?poc_expectedPicOrderCnt:poc_buf;
		poc_expectedPicOrderCnt:
				state <= expectedPicOrderCnt_keep?poc_expectedPicOrderCnt:poc_buf;
		poc_buf:	state <= poc_end;
		poc_end:	state <= poc_rst;
		default:;
		endcase



assign POC_end = state == poc_end;
//type == 0

wire [15:0] prevPicOrderCntMsb;
wire [9:0]  prevPicOrderCntLsb;
wire [15:0] PicOrderCntMsb;
reg [15:0]  PicOrderCntMsb_reg;
reg [9:0]   PicOrderCntLsb_reg;
wire [9:0]  MaxPicOrderCntLsb;

assign MaxPicOrderCntLsb = 10'b1<<(log2_max_pic_order_cnt_lsb_minus4 + 4'd4);
assign prevPicOrderCntMsb = (nal_unit_type == 5'b00101 || memory_management_control_operation_5)?
				0:PicOrderCntMsb_reg;
assign prevPicOrderCntLsb = (nal_unit_type == 5'b00101 || memory_management_control_operation_5)?
				0:PicOrderCntLsb_reg;

assign PicOrderCntMsb = (pic_order_cnt_lsb < prevPicOrderCntLsb)&&((prevPicOrderCntLsb - pic_order_cnt_lsb)>={1'b0,MaxPicOrderCntLsb[9:1]})?
				prevPicOrderCntMsb + {6'b0,MaxPicOrderCntLsb}:
			(pic_order_cnt_lsb > prevPicOrderCntLsb)&&((pic_order_cnt_lsb - prevPicOrderCntLsb)>{1'b0,MaxPicOrderCntLsb[9:1]})?
				prevPicOrderCntMsb - {6'b0,MaxPicOrderCntLsb}:prevPicOrderCntMsb;



always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		PicOrderCntMsb_reg <= 0; PicOrderCntLsb_reg <= 0;end
	else if(state == poc_end)begin
		PicOrderCntMsb_reg <= PicOrderCntMsb; PicOrderCntLsb_reg <= pic_order_cnt_lsb;end

//type == 2
wire [15:0] max_frame_num;
reg [3:0] frame_num_reg;

assign max_frame_num = 5'b1<<(log2_max_frame_num_minus4+4'd4);

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		frame_num_reg <= 0;
	else if(slice_header_state == `pic_parameter_set_id_slice_header_s)
		frame_num_reg <= frame_num;

wire [15:0] FrameNumOffset;
reg [15:0] prevFrameNumOffset;
assign FrameNumOffset = (nal_unit_type == 5'b00101)?0:
			(frame_num < frame_num_reg)?prevFrameNumOffset + max_frame_num:prevFrameNumOffset;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		prevFrameNumOffset <= 0;
	else if(state == poc_end)
		prevFrameNumOffset <= FrameNumOffset;

wire [15:0] tempPicOrderCnt;
assign tempPicOrderCnt = (nal_unit_type == 5'b00101)?0:
			 (nal_ref_idc == 0)?(FrameNumOffset + {12'b0,frame_num})<<1 - 1:(FrameNumOffset + {12'b0,frame_num})<<1;


//type == 1


assign absFrameNum = (num_ref_frames_in_pic_order_cnt_cycle != 0 && nal_ref_idc == 0 && (FrameNumOffset + {12'b0,frame_num}) != 0)?
			(FrameNumOffset + {12'b0,frame_num} - 1):
		     (num_ref_frames_in_pic_order_cnt_cycle != 0)?(FrameNumOffset + {12'b0,frame_num}):0;



always@(reset_n or state or num_ref_frames_in_pic_order_cnt_cycle or absFrameNum or frameNumInPicOrderCntCycle or picOrderCntCycleCnt)
	if (reset_n == 0)begin
		picOrderCntCycleCnt_tmp = 0; frameNumInPicOrderCntCycle_tmp = 0;
		frameNumInPicOrderCntCycle_keep = 0;end
	else if(slice_header_state == `slice_header_POC)
		if(state == poc_rst && pic_order_cnt_type == 1 && absFrameNum > 0)begin
			picOrderCntCycleCnt_tmp = 0;
			frameNumInPicOrderCntCycle_tmp = (absFrameNum - 1);end
		else if(state == poc_frameNumInPicOrderCntCycle && frameNumInPicOrderCntCycle >= {8'b0,num_ref_frames_in_pic_order_cnt_cycle})begin
			picOrderCntCycleCnt_tmp = picOrderCntCycleCnt + 1;
			frameNumInPicOrderCntCycle_tmp = frameNumInPicOrderCntCycle - {8'b0,num_ref_frames_in_pic_order_cnt_cycle};
			frameNumInPicOrderCntCycle_keep = 1;end
		else if(state == poc_frameNumInPicOrderCntCycle && frameNumInPicOrderCntCycle < {8'b0,num_ref_frames_in_pic_order_cnt_cycle})begin
			frameNumInPicOrderCntCycle_keep = 0;end
			
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		picOrderCntCycleCnt <= 0; frameNumInPicOrderCntCycle <= 0;end
	else if(state == poc_frameNumInPicOrderCntCycle)begin
		picOrderCntCycleCnt <= picOrderCntCycleCnt_tmp;
		frameNumInPicOrderCntCycle <= frameNumInPicOrderCntCycle_tmp;end

reg [15:0] expectedDeltaPerPicOrderCntCycle;

always@(posedge clk or negedge reset_n)
	if (reset_n == 0)
		expectedDeltaPerPicOrderCntCycle <= 0;
	else if(seq_parameter_set_state == `num_ref_frames_in_pic_order_cnt_cycle)
		expectedDeltaPerPicOrderCntCycle <= 0;
	else if(seq_parameter_set_state == `offset_for_ref_frame)
		expectedDeltaPerPicOrderCntCycle <= expectedDeltaPerPicOrderCntCycle + {5'b0,offset_for_ref_frame};







always@(reset_n or state or picOrderCntCycleCnt or expectedDeltaPerPicOrderCntCycle or offset_for_ref_frame_i
		or frameNumInPicOrderCntCycle or frameNumInPicOrderCntCycle_i or expectedPicOrderCnt or pic_order_cnt_type
		or frameNumInPicOrderCntCycle_keep or absFrameNum)
	if(reset_n == 0)begin
		expectedPicOrderCnt_tmp = 0; expectedPicOrderCnt_keep = 0;  end
	else if(state == poc_rst && pic_order_cnt_type == 1 && absFrameNum == 0)begin
		expectedPicOrderCnt_tmp = 0; expectedPicOrderCnt_keep = 0;  end
	else if(state == poc_frameNumInPicOrderCntCycle && frameNumInPicOrderCntCycle_keep == 0)begin
		expectedPicOrderCnt_tmp = picOrderCntCycleCnt * expectedDeltaPerPicOrderCntCycle;
		expectedPicOrderCnt_keep = 0;  end
	else if(state == poc_expectedPicOrderCnt)begin	
		expectedPicOrderCnt_tmp = expectedPicOrderCnt + {5'b0,offset_for_ref_frame_i};
		expectedPicOrderCnt_keep = (frameNumInPicOrderCntCycle_i < frameNumInPicOrderCntCycle);  end
	else if(state == poc_buf)
		expectedPicOrderCnt_tmp = expectedPicOrderCnt + {5'b0,offset_for_ref_frame_i};

always@(reset_n or state or frameNumInPicOrderCntCycle_i)
	if(reset_n == 0)begin
		offset_for_ref_frame_rd_n = 1;  offset_for_ref_frame_rd_addr = 0;end
	else if(state == poc_frameNumInPicOrderCntCycle && frameNumInPicOrderCntCycle_keep == 0)begin
		offset_for_ref_frame_rd_n = 0; 
		offset_for_ref_frame_rd_addr = frameNumInPicOrderCntCycle_i[7:0];end
	else if(state == poc_expectedPicOrderCnt)begin
		offset_for_ref_frame_rd_n = 0; 
		offset_for_ref_frame_rd_addr = frameNumInPicOrderCntCycle_i[7:0];end
	else begin
		offset_for_ref_frame_rd_n = 1;  offset_for_ref_frame_rd_addr = 0;end
		
	
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		frameNumInPicOrderCntCycle_i <= 0;
		expectedPicOrderCnt <= 0;end
	else if(state == poc_expectedPicOrderCnt || (state == poc_frameNumInPicOrderCntCycle && frameNumInPicOrderCntCycle_keep == 0))begin
		frameNumInPicOrderCntCycle_i <= frameNumInPicOrderCntCycle_i + 1;
		expectedPicOrderCnt <= expectedPicOrderCnt_tmp;end
	else if(state == poc_buf)
		expectedPicOrderCnt <= expectedPicOrderCnt_tmp;





//POC
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		POC <= 0;
	else if(state == poc_end)
		case(pic_order_cnt_type)
		0:POC <= PicOrderCntMsb + {6'b0,pic_order_cnt_lsb};
		1:POC <= nal_ref_idc == 0 ? expectedPicOrderCnt + {5'b0,delta_pic_order_cnt} + {5'b0,offset_for_non_ref_pic} : 
					    expectedPicOrderCnt + {5'b0,delta_pic_order_cnt};
		2:POC <= tempPicOrderCnt;
		default:;
		endcase
endmodule 
