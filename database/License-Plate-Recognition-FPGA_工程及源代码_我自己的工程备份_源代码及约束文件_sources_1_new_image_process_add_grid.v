//1.根据车牌的边界识别结果，在当前帧中添加内收的红色方框，宽度为5像素。
//2.根据字符的边界识别结果，在当前帧中添加内收的绿色方框，宽度为3像素。
module add_grid # (
	parameter	[9:0]	PLATE_WIDTH = 10'd5,
	parameter	[9:0]	CHAR_WIDTH  = 10'd3
)(
    input               clk             ,   // 时钟信号
    input               rst_n           ,   // 复位信号（低有效）
    //输入视频流
	input				per_frame_vsync     ,
	input				per_frame_href      ,	
	input				per_frame_clken     ,
	input    [15:0]     per_frame_rgb       ,		
    //车牌边界
    input    [9:0]      plate_boarder_up 	,//输入的车牌候选区域
    input    [9:0]      plate_boarder_down	,
    input    [9:0]      plate_boarder_left  ,   
    input    [9:0]      plate_boarder_right ,
    input               plate_exist_flag    ,
    //字符边界
    input    [9:0]     char_line_up 	    ,
    input    [9:0]     char_line_down	    ,
    input    [9:0]     char1_line_left      ,
    input    [9:0]     char1_line_right     ,
    input    [9:0]     char2_line_left      ,
    input    [9:0]     char2_line_right     ,
    input    [9:0]     char3_line_left      ,
    input    [9:0]     char3_line_right     ,
    input    [9:0]     char4_line_left      ,
    input    [9:0]     char4_line_right     ,
    input    [9:0]     char5_line_left      ,
    input    [9:0]     char5_line_right     ,
    input    [9:0]     char6_line_left      ,
    input    [9:0]     char6_line_right     ,
    input    [9:0]     char7_line_left      ,
    input    [9:0]     char7_line_right     ,
    //输出视频流
	output             post_frame_vsync     ,	
	output             post_frame_href      ,	
	output             post_frame_clken     ,	
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
//添加红色车牌方框、绿色字符边框
always @(posedge clk or negedge rst_n)
if(!rst_n)
    post_frame_rgb <= 16'd0;
else begin
    if(((x_cnt >= plate_boarder_left ) && (x_cnt < plate_boarder_left +PLATE_WIDTH) &&
        (y_cnt >= plate_boarder_up   ) && (y_cnt <= plate_boarder_down )               ) ||//左边框
       ((x_cnt <= plate_boarder_right) && (x_cnt > plate_boarder_right-PLATE_WIDTH) &&
        (y_cnt >= plate_boarder_up   ) && (y_cnt <= plate_boarder_down )               ) ||//右边框
       ((y_cnt >= plate_boarder_up   ) && (y_cnt < plate_boarder_up   +PLATE_WIDTH) &&
        (x_cnt >= plate_boarder_left ) && (x_cnt <= plate_boarder_right)               ) ||//上边框
       ((y_cnt <= plate_boarder_down ) && (y_cnt > plate_boarder_down -PLATE_WIDTH) &&
        (x_cnt >= plate_boarder_left ) && (x_cnt <= plate_boarder_right)               )   //下边框
       ) //红色车牌方框
        post_frame_rgb <= plate_exist_flag ? 16'hf800 : per_frame_rgb_r;//11111_000000_00000
    else if(((y_cnt >= char_line_up   ) && (y_cnt < char_line_up  +CHAR_WIDTH) &&
             (x_cnt >= char1_line_left) && (x_cnt <= char7_line_right)               ) ||//上边框
            ((y_cnt <= char_line_down ) && (y_cnt > char_line_down-CHAR_WIDTH) &&
             (x_cnt >= char1_line_left) && (x_cnt <= char7_line_right)               ) ||//下边框
            ((x_cnt >= char1_line_left ) && (x_cnt < char1_line_left +CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               ) ||//字符1左边框
            ((x_cnt >= char2_line_left ) && (x_cnt < char2_line_left +CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               ) ||//字符2左边框
            ((x_cnt >= char3_line_left ) && (x_cnt < char3_line_left +CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               ) ||//字符3左边框
            ((x_cnt >= char4_line_left ) && (x_cnt < char4_line_left +CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               ) ||//字符4左边框
            ((x_cnt >= char5_line_left ) && (x_cnt < char5_line_left +CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               ) ||//字符5左边框
            ((x_cnt >= char6_line_left ) && (x_cnt < char6_line_left +CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               ) ||//字符6左边框
            ((x_cnt >= char7_line_left ) && (x_cnt < char7_line_left +CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               )   //字符7左边框
       )//绿色字符上下界、左边框
        post_frame_rgb <= 16'h07e0;//00000_111111_00000
    else if(((x_cnt <= char1_line_right) && (x_cnt > char1_line_right-CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               ) ||//字符1右边框
            ((x_cnt <= char2_line_right) && (x_cnt > char2_line_right-CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               ) ||//字符2右边框
            ((x_cnt <= char3_line_right) && (x_cnt > char3_line_right-CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               ) ||//字符3右边框
            ((x_cnt <= char4_line_right) && (x_cnt > char4_line_right-CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               ) ||//字符4右边框
            ((x_cnt <= char5_line_right) && (x_cnt > char5_line_right-CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               ) ||//字符5右边框
            ((x_cnt <= char6_line_right) && (x_cnt > char6_line_right-CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               ) ||//字符6右边框
            ((x_cnt <= char7_line_right) && (x_cnt > char7_line_right-CHAR_WIDTH) &&
             (y_cnt >= char_line_up    ) && (y_cnt <= char_line_down )               )   //字符7右边框
       )//蓝色字符右边框
        post_frame_rgb <= 16'h001f;//00000_000000_11111
    else
        post_frame_rgb <= per_frame_rgb_r;
end

endmodule
