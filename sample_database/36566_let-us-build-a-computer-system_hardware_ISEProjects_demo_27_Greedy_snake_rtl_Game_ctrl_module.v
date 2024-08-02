// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

module Game_ctrl_module//游戏控制模块,根据游戏状态产生相应控制信号	
(
	input Clk_50mhz,//倍频后的50MHZ时钟
	input Rst_n,//全局复位信号

	input Key_left,//左按键
	input Key_right,//右按键
	input Key_up,//上按键
	input Key_down,//下按键
	/*	
	input Left,//左按键
	input Right,//右按键
	input Up,//上按键
	input Down,//下按键
	
	*/
	
	output reg  [2:0] Game_status,//3种游戏状态，START：001；PLAY：010；END：100；
	
	input Hit_wall_sig,//撞墙信号
	input Hit_body_sig,//撞到自己的身体信号
	
	output reg Flash_sig//FLASH信号
//	output reg Flash_over_sig
//	output reg Restart_sig//重新开始信号
		
);
	//3种游戏状态	
	parameter START = 3'b001;
	parameter  PLAY = 3'b010;
	parameter   END = 3'b100;
	
//	reg [31:0] Count1;//32位的计数器，用来计数时间的
//	reg Flash_over_sig;
	
/*	reg [31:0] Count2;
	parameter T200ms = 32'd10_000_000;
	
	always @ (posedge Clk_50mhz or negedge Rst_n)
	begin
		if(!Rst_n)
			Count2 <= 32'd0;
		
		else if(Count2 == T200ms)
				Count2 <= 32'd0;
		else
				Count2 <= Count2 + 32'd1;
	end
	
	
	
	*/
	always @ (posedge Clk_50mhz or negedge Rst_n)
	begin
		if(!Rst_n)
		begin
			Game_status <= START;;//复位的时候，送START状态
	//		Count1 <= 32'd0;//计数器清零
			Flash_sig <= 1'd1;
			
	//		Flash_over_sig <= 1'b0;
		end
		else
		begin
			Game_status <= START;
			case(Game_status)//选择游戏状态
				START://在START状态里，有任意一个按键按下，则送PLAY状态
					  
					  
							begin	
								if(Key_left | Key_right | Key_up | Key_down)
								begin		
									Game_status <= PLAY;
						/*			Key_left <= 1'd0;
									Key_right <= 1'd0;
									Key_up <= 1'd0;
									Key_down <= 1'd0;*/
								end
								else
									Game_status <= START;//这是为了避免生成锁存器
								//	Game_status <= END;
							end
					 
	
				PLAY://PLAY状态，如果撞墙或者碰到自己身体，送END状态
						begin
							if(Hit_wall_sig | Hit_body_sig)
							begin		
					/*			if(Count1 <= 32'd200_000_000)
								begin
									
									Count1 <= Count1 + 32'd1;
									if(Count1 == 32'd25_000_000)//时间达到0.5S（现在是50M的时钟）
										Flash_sig <= 1'b0;//闪动信号为0
									else if(Count1 == 32'd50_000_000)//时间达到1.0S
										Flash_sig <= 1'b1;//闪动信号为1
									else if(Count1 == 32'd75_000_000)//以此类推
										Flash_sig <= 1'b0;
									else if(Count1 == 32'd100_000_000)
										Flash_sig <= 1'b1;
									else if(Count1 == 32'd125_000_000)
										Flash_sig <= 1'b0;
									else if(Count1 == 32'd150_000_000)
											begin
												Flash_sig <= 1'b1;
												Flash_over_sig <= 1'b1;
												Count1 <= 32'd0;
											end
									end */
								Game_status <= END;
								
							end
							else
								Game_status <= PLAY;
						end
		/*************************************/
	
				END://END状态，游戏结束的时候，出现一段蛇身体闪动的画面
					begin
						
						if(Key_left | Key_right | Key_up | Key_down)
						begin
							Game_status <= START;
						//	Game_status <= END;
							Flash_sig <= 1'd1;//一直是亮的
			//				Flash_over_sig <= 1'b0;
			//				Count1 <= 32'd0;
						end
			/*			else if(Count1 <= 32'd200_000_000)
						begin
						   
							Count1 <= Count1 + 32'd1;
							if(Count1 == 32'd25_000_000)//时间达到0.5S（现在是50M的时钟）
								Flash_sig <= 1'b0;//闪动信号为0
							else if(Count1 == 32'd50_000_000)//时间达到1.0S
								Flash_sig <= 1'b1;//闪动信号为1
							else if(Count1 == 32'd75_000_000)//以此类推
								Flash_sig <= 1'b0;
							else if(Count1 == 32'd100_000_000)
								Flash_sig <= 1'b1;
							else if(Count1 == 32'd125_000_000)
								Flash_sig <= 1'b0;
							else if(Count1 == 32'd150_000_000)
									begin
										Flash_sig <= 1'b1;
										Flash_over_sig <= 1'b1;
									end
						end */
						else
						begin
							Game_status <= END;
							Flash_sig <= 1'd1;//一直是亮的
			//				Flash_over_sig <= 1'b0;
					//		Count1 <= 32'd0;
						end		
					end
			endcase
		end
	end
	
	endmodule
	
