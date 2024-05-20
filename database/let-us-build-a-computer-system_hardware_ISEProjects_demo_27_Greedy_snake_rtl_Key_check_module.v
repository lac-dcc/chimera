// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

module Key_check_module//按键检测模块，延时消抖
(	
	input Clk_50mhz,//50M时钟
	input Rst_n,//全局复位信号
	
	input Left,//左按键
	input Right,//右按键
	input Up,//上按键
	input Down,//下按键
	
	output reg Key_left,//左按键寄存器
	output reg Key_right,//右按键寄存器
	output reg Key_up,//上按键寄存器
	output reg Key_down//下按键寄存器
);

/***************************************************************************/
	reg [31:0] Count1;//32位计数器，用来计数100MS
	
	reg Key_left2;//左按键寄存器2，用来跟寄存比较的
	reg Key_right2;//右按键寄存器2
	reg Key_up2;//上按键寄存器2
	reg Key_down2;//下按键寄存器2
	
	always @ (posedge Clk_50mhz or negedge Rst_n)
	begin
		if(!Rst_n)
		begin
			Count1 <= 32'd0;
			
			Key_left <= 1'd0;
			Key_right <= 1'd0;
			Key_up <= 1'd0;
			Key_down <= 1'd0;
			
			Key_left2 <= 1'd0;
			Key_right2 <= 1'd0;
			Key_up2 <= 1'd0;
			Key_down2 <= 1'd0;						
		end
		else 
		begin
			if(Count1 == 32'd5_0000)//100MS的延时，按键按下电平为0
			begin//按键松手才会有效果，因为寄存器2的信号比原信号滞后一个周期，这里的算法是检测到寄存器2为0，原信号变为1，则说明刚才按键按下了
				Count1 <= 0;//计数器清零
				
				Key_left2 <= Left;//将按键输入寄存
				Key_right2 <= Right;
				Key_up2 <= Up;
				Key_down2 <= Down;
			/*	
				if((Key_left2 == 1'd0) && (Left == 1'd1))
					Key_left <= 1'd1;
				if((Key_right2 == 1'd0) && (Right == 1'd1))
					Key_right <= 1'd1;
				if((Key_up2 == 1'd0) && (Up == 1'd1))
					Key_up <= 1'd1;
				if((Key_down2 == 1'd0) && (Down == 1'd1))
					Key_down <= 1'd1;	
			*/
				if((Key_left2 == 1'd1) && (Left == 1'd0))
					Key_left <= 1'd1;
				if((Key_right2 == 1'd1) && (Right == 1'd0))
					Key_right <= 1'd1;
				if((Key_up2 == 1'd1) && (Up == 1'd0))
					Key_up <= 1'd1;
				if((Key_down2 == 1'd1) && (Down == 1'd0))
					Key_down <= 1'd1;	
			end
			else
			begin
				Count1 <= Count1 + 32'd1;
				//如果没有按键按下，则保持上下左右信号都为低
				Key_left <= 1'd0;
				Key_right <= 1'd0;
				Key_up <= 1'd0;
				Key_down <= 1'd0;
			end
		end	
	end				
	
endmodule
