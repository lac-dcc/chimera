//调整车牌的边框，调整后仅包含字符

module plate_boarder_adjust (
	//global clock
	input				clk,  				
	input				rst_n,				

	input				per_frame_vsync,	

    input      [9:0] 	max_line_up 	,		//输入的车牌候选区域
    input      [9:0] 	max_line_down	,
    input      [9:0] 	max_line_left 	,     
    input      [9:0] 	max_line_right	,
	
    output reg [9:0] 	plate_boarder_up 	,  	//调整后的边框
    output reg [9:0] 	plate_boarder_down	, 
    output reg [9:0] 	plate_boarder_left 	,
    output reg [9:0] 	plate_boarder_right	,
	
	output reg 			plate_exist_flag		//根据输入的边框宽高比，判断是否存在车牌	
);

reg per_frame_vsync_r;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		per_frame_vsync_r 	<= 0;
	else
		per_frame_vsync_r 	<= 	per_frame_vsync	;
end

//场同步信号上升沿，输入的边界有效

wire vsync_pos_flag;
assign vsync_pos_flag = per_frame_vsync & (~per_frame_vsync_r);

//计算边界的宽高
wire [9:0] max_line_height;       
wire [9:0] max_line_width ;
	
assign max_line_height	= max_line_down  - max_line_up;
assign max_line_width   = max_line_right - max_line_left;


//车牌的宽高比大致为“3比1”，误差不能超出一定的范围，该范围设置为宽度的1/8
reg [11:0] height_mult_3;	//高度*3
reg [ 9:0] width_div_8;		//宽度/8
reg [11:0] difference;		//误差


//下面计算宽高比的误差，这段逻辑不用关心时序，因为计算结果在VSYNC上升沿才会用到，此时数据稳定不变

//高度*3
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		height_mult_3 	<= 12'd0;
	else
		height_mult_3  <= max_line_height + max_line_height + max_line_height;
end

//计算宽高比的误差
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		difference	<= 12'd0;
	else begin
		if(height_mult_3 > max_line_width)
			difference	<= height_mult_3 - max_line_width;
		else
		if(height_mult_3 <= max_line_width)
			difference	<= max_line_width - height_mult_3;
	end
end

//计算误差上限，宽度/8
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		width_div_8	<= 12'd0;
	else
		width_div_8	<= max_line_width[9:3];
end

//判断车牌是否存在
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		plate_exist_flag 	<= 0;
	else if(vsync_pos_flag) begin
	
		if(max_line_down <= max_line_up)				//车牌的下边框不能小于上边框
			plate_exist_flag <= 0;
		else
		if(max_line_right <= max_line_left)				//车牌的右边框不能小于左边框
			plate_exist_flag <= 0;
		else
		if(max_line_height < 10'd16)					//高度不能小于16
			plate_exist_flag <= 0;
		else
		if(max_line_width < 10'd48)						//宽度不能小于48
			plate_exist_flag <= 0;
		else
		if(difference > width_div_8)					//车牌宽高比的误差超过上限
			plate_exist_flag <= 0;
		else
			plate_exist_flag <= 1;
	end
end

//按照一定比例修正车牌字符的边界

reg [9:0] h_shift;	//水平方向边界偏移量 =  width/32
reg [9:0] v_shift;	//竖直方向边界偏移量 =  (heitht*3)/16

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) 
		h_shift	<= 10'd0;
	else
		h_shift	<= max_line_width[9:5];
end

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) 
		v_shift	<= 10'd0;
	else
		v_shift	<= height_mult_3[11:4];
end

//输出修正后的边界
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) begin
		plate_boarder_up 	<= 10'd0;
		plate_boarder_down	<= 10'd0;
		plate_boarder_left 	<= 10'd0;
		plate_boarder_right	<= 10'd0;
	end
	else if(vsync_pos_flag) begin
		plate_boarder_up 	<= max_line_up 	  + v_shift;
		plate_boarder_down	<= max_line_down  - v_shift;
		plate_boarder_left 	<= max_line_left  + h_shift;
		plate_boarder_right	<= max_line_right - h_shift;
	end
end

endmodule