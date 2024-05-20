// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

module Snake_ctrl_module//蛇的运动情况控制模块
(
	input Clk_50mhz,//50M时钟
	input Rst_n,//全局复位信号
	
	input Key_left,//左按键
	input Key_right,//右按键
	input Key_up,//上按键
	input Key_down,//下按键
	
	output reg [1:0] Object,//用于表示当前扫描的对象，有四种状态 00：NONE； 01：HEAD； 10：BODY； 11：WALL；
									//也用于后面的VGA，通过Object来判断颜色的输出
	input [9:0] Pixel_x,//低4位表示一个格子内像素的坐标，高5位表示格坐标
	input [9:0] Pixel_y,//扫描坐标，单位：“像素点”
	
	output [5:0] Head_x,	//蛇的头部那一格的X坐标
	output [5:0] Head_y,//蛇的头部那一格的Y坐标
	
	input Body_add_sig,//身体长度增加信号
	
	input [2:0] Game_status,//3种游戏状态，START：001；PLAY：010；END：100；
	
	output reg Hit_body_sig,//撞到身体信号
	output reg Hit_wall_sig,//撞到墙信号
	input Flash_sig//闪动信号
);
/***************************************************************************/
	
	localparam Up = 2'b00;
	localparam Down = 2'b01;
	localparam Left = 2'b10;
	localparam Right = 2'b11;
	
	
	localparam NONE = 2'b00;
	localparam HEAD = 2'b01;
	localparam BODY = 2'b10;
	localparam WALL = 2'b11;
	
	
	parameter   END = 3'b100;
/***************************************************************************/
/***************************************************************************/
	
	reg [6:0] Body_num;//7位身体节数，这里最大是16节
	
	reg [31:0] Count;//32位计数器，用来计时
	
	wire [1:0] Direct;
	reg [1:0] Direct_r;//寄存方向的寄存器
	reg [1:0] Direct_next;//下一个方向的寄存器
	
	assign Direct = Direct_r;
	
	
	reg Direct_left;//方向左
	reg Direct_right;//方向右
	reg Direct_up;//方向上
	reg Direct_down;//方向下
	
	reg [5:0] Body_x [15:0];//这种格式是二维数组的意思，地址为0~15，每个地址为6bits
	reg [5:0] Body_y [15:0];//体长坐标，单位：“格子” ，16*16像素组成的格子
	reg [15:0] Snake_light_sig;//这用来控制蛇体亮暗，1为亮，0为暗
	
	reg [2:0] color;//RGB三个位
	
	assign Head_x = Body_x[0];//Body_x，Body_y表示一整条蛇身体各节的格坐标
	assign Head_y = Body_y[0];
	
/***************************************************************************/
	
	always @ (posedge Clk_50mhz or negedge Rst_n)
	begin
		if(!Rst_n)
			Direct_r <= Right;//默认一出来就是向右前进
		else
			Direct_r <= Direct_next;
	end

/***************************************************************************/
/***************************************************************************/
	
	always @ (posedge Clk_50mhz or negedge Rst_n)
	begin
		if(!Rst_n)
		begin
			Count <= 32'd0;
			//X从左到右递增，Y从上到下递增
			Body_x[0] <= 6'd10;//蛇头默认出现的X坐标是10
			Body_y[0] <= 6'd5;//蛇头默认出现的Y坐标是5
			
			Body_x[1] <= 6'd9;//第一节身体的X坐标是9
			Body_y[1] <= 6'd5;//第一节身体的Y坐标还是5
			
			Body_x[2] <= 6'd8;//第二节身体的X坐标是8
			Body_y[2] <= 6'd5;//第二节身体的Y坐标还是5
			
			//后面的身体暂时还没有，所以没有所谓的坐标，都为0，最多是16节身体
			Body_x[3] <= 6'd0;
			Body_y[3] <= 6'd0;
			
			Body_x[4] <= 6'd0;
			Body_y[4] <= 6'd0;
			
			Body_x[5] <= 6'd0;
			Body_y[5] <= 6'd0;
			
			Body_x[6] <= 6'd0;
			Body_y[6] <= 6'd0;
			
			Body_x[7] <= 6'd0;
			Body_y[7] <= 6'd0;
			
			Body_x[8] <= 6'd0;
			Body_y[8] <= 6'd0;
			
			Body_x[9] <= 6'd0;
			Body_y[9] <= 6'd0;
			
			Body_x[10] <= 6'd0;
			Body_y[10] <= 6'd0;
			
			Body_x[11] <= 6'd0;
			Body_y[11] <= 6'd0;
			
			Body_x[12] <= 6'd0;
			Body_y[12] <= 6'd0;
			
			Body_x[13] <= 6'd0;
			Body_y[13] <= 6'd0;
			
			Body_x[14] <= 6'd0;
			Body_y[14] <= 6'd0;
			
			Body_x[15] <= 6'd0;
			Body_y[15] <= 6'd0;
			
			Hit_wall_sig <= 1'd0;
			Hit_body_sig <= 1'd0;
		end
		else	if(Count == 32'd12_500_000) //0.02us*12'500'000 = 0.25s，每秒移动四次
				begin
					Count <= 32'd0;
		//************************************************下面改了			
					if(Game_status == END)
					begin
						Body_x[0] <= 6'd10;//蛇头默认出现的X坐标是10
						Body_y[0] <= 6'd5;//蛇头默认出现的Y坐标是5
						
						Body_x[1] <= 6'd9;//第一节身体的X坐标是9
						Body_y[1] <= 6'd5;//第一节身体的Y坐标还是5
						
						Body_x[2] <= 6'd8;//第二节身体的X坐标是8
						Body_y[2] <= 6'd5;//第二节身体的Y坐标还是5
						
						//后面的身体暂时还没有，所以没有所谓的坐标，都为0，最多是16节身体
						Body_x[3] <= 6'd0;
						Body_y[3] <= 6'd0;
						
						Body_x[4] <= 6'd0;
						Body_y[4] <= 6'd0;
						
						Body_x[5] <= 6'd0;
						Body_y[5] <= 6'd0;
						
						Body_x[6] <= 6'd0;
						Body_y[6] <= 6'd0;
						
						Body_x[7] <= 6'd0;
						Body_y[7] <= 6'd0;
						
						Body_x[8] <= 6'd0;
						Body_y[8] <= 6'd0;
						
						Body_x[9] <= 6'd0;
						Body_y[9] <= 6'd0;
						
						Body_x[10] <= 6'd0;
						Body_y[10] <= 6'd0;
						
						Body_x[11] <= 6'd0;
						Body_y[11] <= 6'd0;
						
						Body_x[12] <= 6'd0;
						Body_y[12] <= 6'd0;
						
						Body_x[13] <= 6'd0;
						Body_y[13] <= 6'd0;
						
						Body_x[14] <= 6'd0;
						Body_y[14] <= 6'd0;
						
						Body_x[15] <= 6'd0;
						Body_y[15] <= 6'd0;
						
						Hit_wall_sig <= 1'd0;
						Hit_body_sig <= 1'd0;

					end
					else
					begin//撞墙有四种情况，上下左右，撞到上，Y = 1；撞到下边，Y = 28；撞到左边，X = 1；撞到右边，X = 38；画个图就知道了~
						if(((Direct == Up) && (Body_y[0] == 6'd1)) | 
							((Direct == Down) && (Body_y[0] == 6'd28)) | 
							((Direct == Left) && (Body_x[0] == 6'd1)) | 
							((Direct == Right) && (Body_x[0] == 6'd38)))
							
							Hit_wall_sig <= 1'd1;
						else if(((Body_y[0] == Body_y[1]) && (Body_x[0] == Body_x[1]) && (Snake_light_sig[1] == 1'd1)) | 
								((Body_y[0] == Body_y[2]) && (Body_x[0] == Body_x[2]) && (Snake_light_sig[2] == 1'd1)) | 
								((Body_y[0] == Body_y[3]) && (Body_x[0] == Body_x[3]) && (Snake_light_sig[3] == 1'd1)) | 
								((Body_y[0] == Body_y[4]) && (Body_x[0] == Body_x[4]) && (Snake_light_sig[4] == 1'd1)) | 
								((Body_y[0] == Body_y[5]) && (Body_x[0] == Body_x[5]) && (Snake_light_sig[5] == 1'd1)) | 
								((Body_y[0] == Body_y[6]) && (Body_x[0] == Body_x[6]) && (Snake_light_sig[6] == 1'd1)) | 
								((Body_y[0] == Body_y[7]) && (Body_x[0] == Body_x[7]) && (Snake_light_sig[7] == 1'd1)) | 
								((Body_y[0] == Body_y[8]) && (Body_x[0] == Body_x[8]) && (Snake_light_sig[8] == 1'd1)) | 
								((Body_y[0] == Body_y[9]) && (Body_x[0] == Body_x[9]) && (Snake_light_sig[9] == 1'd1)) | 
								((Body_y[0] == Body_y[10]) && (Body_x[0] == Body_x[10]) && (Snake_light_sig[10] == 1'd1)) | 
								((Body_y[0] == Body_y[11]) && (Body_x[0] == Body_x[11]) && (Snake_light_sig[11] == 1'd1)) | 
								((Body_y[0] == Body_y[12]) && (Body_x[0] == Body_x[12]) && (Snake_light_sig[12] == 1'd1)) | 
								((Body_y[0] == Body_y[13]) && (Body_x[0] == Body_x[13]) && (Snake_light_sig[13] == 1'd1)) | 
								((Body_y[0] == Body_y[14]) && (Body_x[0] == Body_x[14]) && (Snake_light_sig[14] == 1'd1)) | 
								((Body_y[0] == Body_y[15]) && (Body_x[0] == Body_x[15]) && (Snake_light_sig[15] == 1'd1)))
								
								Hit_body_sig <= 1'd1;//蛇头的Y坐标=任一位身体的Y坐标，头的X坐标=任一位身体的X坐标，身体的该长度位存在=碰到身体
						else
						begin//下面的代码是产生跟随现象，后面一节身体跟着前面一节身体的地址~
							Body_x[1] <= Body_x[0];
							Body_y[1] <= Body_y[0];
							
							Body_x[2] <= Body_x[1];
							Body_y[2] <= Body_y[1];
							
							Body_x[3] <= Body_x[2];
							Body_y[3] <= Body_y[2];
							
							Body_x[4] <= Body_x[3];
							Body_y[4] <= Body_y[3];
							
							Body_x[5] <= Body_x[4];
							Body_y[5] <= Body_y[4];
							
							Body_x[6] <= Body_x[5];
							Body_y[6] <= Body_y[5];
							
							Body_x[7] <= Body_x[6];
							Body_y[7] <= Body_y[6];
							
							Body_x[8] <= Body_x[7];
							Body_y[8] <= Body_y[7];
							
							Body_x[9] <= Body_x[8];
							Body_y[9] <= Body_y[8];
							
							Body_x[10] <= Body_x[9];
							Body_y[10] <= Body_y[9];
							
							Body_x[11] <= Body_x[10];
							Body_y[11] <= Body_y[10];
							
							Body_x[12] <= Body_x[11];
							Body_y[12] <= Body_y[11];
							
							Body_x[13] <= Body_x[12];
							Body_y[13] <= Body_y[12];
							
							Body_x[14] <= Body_x[13];
							Body_y[14] <= Body_y[13];
							
							Body_x[15] <= Body_x[14];
							Body_y[15] <= Body_y[14];
						
							case(Direct)//这里选择的是按键，在墙边的时候,根据按下按键判断是否撞墙 否则按规律改变头部坐标							
								Up:
									begin
									if(Body_y[0] == 6'd1)//如果第一个移动的节坐标已经是1了，再按上，则会撞墙
											Hit_wall_sig <= 1'd1;
										else
											Body_y[0] <= Body_y[0] - 6'd1;//注意坐标系，这里是 - 1，因为最上面是0，所以向上走的话，Y是 - 1的。
									end
								
								Down:
									begin
										if(Body_y[0] == 6'd28)
											Hit_wall_sig <= 1'd1;
										else
											Body_y[0] <= Body_y[0] + 6'd1;
									end
								Left:
									begin
										if(Body_x[0] == 6'd1)
											Hit_wall_sig <= 1'd1;
										else
											Body_x[0] <= Body_x[0] - 6'd1;//注意坐标系，这里是 + 1，因为最左面是0，所以向左走的话，X是 - 1的。	
									end
								
								Right:
									begin
										if(Body_x[0] == 6'd38)
											Hit_wall_sig <= 1'd1;
										else
											Body_x[0] <= Body_x[0] + 6'd1;
									end
							endcase																	
						end					
					end
			end 
		else
			Count <= Count + 32'd1;//如果不满足时间到0.25秒，则计数器加1
	end
/***************************************************************************/
	
	always @ (posedge Clk_50mhz)//给四个按键赋值
	begin
		if(Key_left == 1'd1)
				Direct_left <= 1'd1;//把按键信息锁存起来
		else if(Key_right == 1'd1)
				Direct_right <= 1'd1;
		else if(Key_up == 1'd1)
				Direct_up <= 1'd1;
		else if(Key_down == 1'd1)
				Direct_down <= 1'd1;			
		else 
		begin
			Direct_left <= 1'd0;
			Direct_right <= 1'd0;
			Direct_up <= 1'd0;
			Direct_down <= 1'd0;
		end
	end
	/***************************************************************************/
	
	always @ (*)//这里也是电平触发
	begin   //根据当前运动状态即按下键位判断下一步运动情况，不在墙边的情况
		Direct_next = Right;//默认刚开始是向右走
		
		case(Direct)
			Up://根据按键进行三个方向的选择，这里是按键按下的时候，信号传导Direct_next，然后由Direct_next送给Direct_r，最后再赋值给Direct
				begin
					if(Direct_left)
						Direct_next = Left;
					else if(Direct_right)
						Direct_next = Right;
					else
						Direct_next = Up;
				end
			
			Down:
				begin
					if(Direct_left)
						Direct_next = Left;
					else if(Direct_right)
						Direct_next = Right;
					else
						Direct_next = Down;
				end		
			Left:
				begin
					if(Direct_up)
						Direct_next = Up;
					else if(Direct_down)
						Direct_next = Down;
					else
						Direct_next = Left;
				end
			
			Right:
				begin
					if(Direct_up)
						Direct_next = Up;
					else if(Direct_down)
						Direct_next = Down;
					else
						Direct_next = Right;
				end		
		endcase
	end

/***************************************************************************/
	reg Eaten_sig;//吃苹果状态
	
	always @ (posedge Clk_50mhz or negedge Rst_n)//吃下苹果没？，吃下则Body_add_sig == 1，显示体长增加一位，"Snake_light_sig[Body_num] <= 1;",让第Body_num位“出现”
	begin
		if(!Rst_n)
		begin
			Snake_light_sig <= 16'd7;//0111，3节是亮的
			Body_num <= 7'd3;
			Eaten_sig <= 1'd0;//初始显示长度为3，Snake_light_sig = 0000_0000_0111
		end		
		else if(Game_status == END)
				begin
					Body_num <= 7'd3;
					Eaten_sig <= 1'd0;
					Snake_light_sig <= 16'd7;
				end 
		else				
		begin//判断蛇头与苹果坐标是否重合
			case(Eaten_sig)
				1'd0	:
					begin
						if(Body_add_sig)
						begin
							Body_num <= Body_num + 7'd1;
							Snake_light_sig[Body_num] <= 1'b1;
							Eaten_sig <= 1'd1;//“吃下”信号
						end
						else
							Snake_light_sig[Body_num] <= Snake_light_sig[Body_num];
					end
				1'd1	:
					begin
						if(!Body_add_sig)//等待身体增长信号为0
							Eaten_sig <= 0;
						else
							Eaten_sig <= Eaten_sig;
					end
			endcase
		end
	end
	
	
	always @ (Pixel_x or Pixel_y or Snake_light_sig or Flash_sig)//注意，这里是电平触发，所以用的是阻塞赋值“=”
	begin
		if((Pixel_x >= 10'd0) && (Pixel_x < 10'd640) && (Pixel_y >= 10'd0) && (Pixel_y < 10'd480))//如果扫描像素在目标框640*480内
		begin
			if(Pixel_x[9:4] == 6'd0 |
				Pixel_y[9:4] == 6'd0 | 
				Pixel_x[9:4] == 6'd39 | 
				Pixel_y[9:4] == 6'd29)
				
				Object = WALL;//扫描对象是墙
			else if(Pixel_x[9:4] == Body_x[0] && Pixel_y[9:4] == Body_y[0] && Snake_light_sig[0] == 1'd1)//如果扫描对象是蛇头
					Object = (Flash_sig == 1'd1)?		HEAD		:		NONE;//满足条件则送头部的颜色，不满足送黑颜色
			else if(((Pixel_x[9:4] == Body_x[1]) && (Pixel_y[9:4] == Body_y[1]) && (Snake_light_sig[1] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[2]) && (Pixel_y[9:4] == Body_y[2]) && (Snake_light_sig[2] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[3]) && (Pixel_y[9:4] == Body_y[3]) && (Snake_light_sig[3] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[4]) && (Pixel_y[9:4] == Body_y[4]) && (Snake_light_sig[4] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[5]) && (Pixel_y[9:4] == Body_y[5]) && (Snake_light_sig[5] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[6]) && (Pixel_y[9:4] == Body_y[6]) && (Snake_light_sig[6] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[7]) && (Pixel_y[9:4] == Body_y[7]) && (Snake_light_sig[8] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[8]) && (Pixel_y[9:4] == Body_y[8]) && (Snake_light_sig[8] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[9]) && (Pixel_y[9:4] == Body_y[9]) && (Snake_light_sig[9] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[10]) && (Pixel_y[9:4] == Body_y[10]) && (Snake_light_sig[10] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[11]) && (Pixel_y[9:4] == Body_y[11]) && (Snake_light_sig[11] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[12]) && (Pixel_y[9:4] == Body_y[12]) && (Snake_light_sig[12] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[13]) && (Pixel_y[9:4] == Body_y[13]) && (Snake_light_sig[13] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[14]) && (Pixel_y[9:4] == Body_y[14]) && (Snake_light_sig[14] == 1'd1)) | 
					 ((Pixel_x[9:4] == Body_x[15]) && (Pixel_y[9:4] == Body_y[15]) && (Snake_light_sig[15] == 1'd1)))
					//扫描对象是身体					
					Object = (Flash_sig == 1)?		BODY		:		NONE;//满足条件则送身体的颜色，不满足送黑颜色
			else 
					Object = NONE;
		end
		else
			Object = NONE;
	end
	
endmodule
