// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

module Apple_generate_module//苹果产生控制模块
(
	input Clk_50mhz,//50MHZ的时钟
	input Rst_n,//全局复位
	
	input [5:0] Head_x,//蛇头的X坐标
	input [5:0] Head_y,//蛇头的Y坐标
	
	output reg [5:0] Apple_x,//苹果的X坐标
	output reg [4:0] Apple_y,//苹果的Y坐标

	output reg Body_add_sig//蛇的身体增长信号
);
/***************************************************************************/
	reg [31:0] Count1;//32位的计数器，用来计数时间
	reg [10:0] Random_num;//11位的伪随机数，高6位为苹果X坐标 低5位为苹果Y坐标
	
	always@(posedge Clk_50mhz)
	begin	
		Random_num <= Random_num + 11'd921;  //用加法产生随机数，因为每一个时钟的上升沿都会让这个随机数+一个常数（这里我们假设是921），蛇吃苹果的时候
	end												 //的时刻不同，随机数就不一样，所以给人随机的感觉。
	
	always@(posedge Clk_50mhz or negedge Rst_n)
	begin
		if(!Rst_n)
		begin
			Count1 <= 32'd0;//时钟计数清零
			
			Apple_x <= 6'd28;//这是默认出现的苹果的位置
			Apple_y <= 5'd13;//这个X,Y的位置也可以自己修改
			
			Body_add_sig <= 1'd0;//0表示不增加身体节数
		end
		else	if(Count1 == 32'd250_000)//0.5秒计时
				begin
					Count1 <= 32'd0;
					if((Apple_x == Head_x) && (Apple_y == Head_y))//蛇头吃到苹果,送身体增加信号
					begin//判断随机数是否超出屏幕的坐标范围，将随机数转换为下个苹果的X Y坐标
						Body_add_sig <= 1'd1;
						Apple_x <= (Random_num[10:5]> 6'd38)?		(Random_num[10:5] - 6'd25)		:		((Random_num[10:5] == 6'd0)?		6'd1		:		Random_num[10:5]);
						Apple_y <= (Random_num[4:0] > 5'd28)?		(Random_num[4:0] - 5'd3)		:		((Random_num[4:0] == 5'd0)?		5'd1		:		Random_num[4:0]);
					end   
					else
						Body_add_sig <= 1'd0;
				end
		else
			Count1 <= Count1 + 32'd1;
	end
endmodule
