//根据车牌的边界识别结果，在当前帧中添加红色方框
//方框宽度为5像素，会在当前边界的基础上向内收。
module add_plate_boarder # (
	parameter	[9:0]	IMG_HDISP = 10'd640,	//640*480
	parameter	[9:0]	IMG_VDISP = 10'd480,
	parameter	[9:0]	BOARD_WIDTH = 10'd5
)(
    input               clk             ,   // 时钟信号
    input               rst_n           ,   // 复位信号（低有效）

	input				per_frame_vsync,
	input				per_frame_href ,	
	input				per_frame_clken,
	input    [15:0]     per_frame_rgb  ,		
    
    input    [9:0]      plate_boarder_up 	,//输入的车牌候选区域
    input    [9:0]      plate_boarder_down	,
    input    [9:0]      plate_boarder_left  ,   
    input    [9:0]      plate_boarder_right ,
    input               plate_exist_flag    ,
    
	output             post_frame_vsync,	
	output             post_frame_href ,	
	output             post_frame_clken,	
	output reg [15:0]  post_frame_rgb  
);
reg			per_frame_vsync_r;
reg			per_frame_href_r;	
reg			per_frame_clken_r;
reg [15:0]  per_frame_rgb_r;

reg			per_frame_vsync_r2;
reg			per_frame_href_r2;	
reg			per_frame_clken_r2;
reg [15:0]  per_frame_rgb_r2;

assign	post_frame_vsync 	= 	per_frame_vsync_r2;
assign	post_frame_href 	= 	per_frame_href_r2;	
assign	post_frame_clken 	= 	per_frame_clken_r2;
//assign  post_frame_rgb     	=   per_frame_rgb_r2;
//------------------------------------------
//lag 1 将输入信号进行两级延迟，便于流水线处理后同步
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
		per_frame_vsync_r2 	<= 0;
		per_frame_href_r2 	<= 0;
		per_frame_clken_r2 	<= 0;
		per_frame_rgb_r2		<= 0;
		end
	else
		begin
		per_frame_vsync_r2 	<= 	per_frame_vsync_r 	;
		per_frame_href_r2	<= 	per_frame_href_r 	;
		per_frame_clken_r2 	<= 	per_frame_clken_r 	;
		per_frame_rgb_r2		<= 	per_frame_rgb_r		;
		end
end

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
		per_frame_vsync_r 	<= 0;
		per_frame_href_r 	<= 0;
		per_frame_clken_r 	<= 0;
		per_frame_rgb_r		<= 0;
		end
	else
		begin
		per_frame_vsync_r 	<= 	per_frame_vsync	;
		per_frame_href_r	<= 	per_frame_href	;
		per_frame_clken_r 	<= 	per_frame_clken	;
		per_frame_rgb_r	    <= 	per_frame_rgb   ;
	    end
end

//得到场同步信号的边沿
wire vsync_pos_flag;
wire vsync_neg_flag;
wire href_pos_flag;
wire hrefr_neg_flag;
assign vsync_pos_flag = per_frame_vsync    & (~per_frame_vsync_r);
assign vsync_neg_flag = (~per_frame_vsync) & per_frame_vsync_r;
assign href_pos_flag = per_frame_href_r    & (~per_frame_href_r2);
assign hrefr_neg_flag = (~per_frame_href_r) & per_frame_href_r2;

//------------------------------------------
//对输入的像素进行"行/场"方向计数，得到其纵横坐标
reg [9:0]  	x_cnt;
reg [9:0]   y_cnt;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)begin
        x_cnt <= 10'd0;
        y_cnt <= 10'd0;
    end
	else if(vsync_pos_flag)begin
        x_cnt <= 10'd0;
        y_cnt <= 10'd0;
    end
    else if(hrefr_neg_flag)begin
        x_cnt <= 10'd0;
        y_cnt <= y_cnt + 1'b1;
    end
    else if(per_frame_clken_r) begin
        x_cnt <= x_cnt + 1'b1;
    end
end

//------------------------------------------
//添加红色方框
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        post_frame_rgb <= 16'd0;
    else if(plate_exist_flag)begin
        if(((x_cnt >= plate_boarder_left ) && (x_cnt < plate_boarder_left +BOARD_WIDTH) &&
            (y_cnt >= plate_boarder_up   ) && (y_cnt <= plate_boarder_down )               ) ||//左边框
           ((x_cnt <= plate_boarder_right) && (x_cnt > plate_boarder_right-BOARD_WIDTH) &&
            (y_cnt >= plate_boarder_up   ) && (y_cnt <= plate_boarder_down )               ) ||//右边框
           ((y_cnt >= plate_boarder_up   ) && (y_cnt < plate_boarder_up   +BOARD_WIDTH) &&
            (x_cnt >= plate_boarder_left ) && (x_cnt <= plate_boarder_right)               ) ||//上边框
           ((y_cnt <= plate_boarder_down ) && (y_cnt > plate_boarder_down -BOARD_WIDTH) &&
            (x_cnt >= plate_boarder_left ) && (x_cnt <= plate_boarder_right)               )   //下边框
           )
            post_frame_rgb <= 16'hf800;//11111_000000_00000
        else
	        post_frame_rgb <= per_frame_rgb_r;
	end
	else
	   post_frame_rgb <= per_frame_rgb_r;
end

endmodule
