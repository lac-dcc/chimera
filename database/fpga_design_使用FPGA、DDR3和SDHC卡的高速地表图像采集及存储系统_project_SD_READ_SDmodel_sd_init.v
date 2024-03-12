//用于数据传输情况下的时钟。
reg	data_clk;
always @(posedge	sys_clk)
begin
	data_clk<=~data_clk;		
end	

//系统初始化过程
parameter	counterncc=4'd15;
parameter	sd_int_idle=4'd0,
					sd_int_sendcmd0=4'd1,
					sd_int_waitcmd0=4'd2,
					sd_int_sendcmd8=4'd3,
					sd_int_get_res_r7=4'd4,
					sd_int_send_cmd55=4'd5,
					sd_int_get_res_fisrt_r1=4'd6,
					sd_int_send_acmd41=4'd7,
					sd_int_get_first_r3=4'd8,
					sd_int_send_cmd2=4'd9,
					sd_int_get_first_r2=4'd10,
					sd_int_send_cmd3=4'd11,
					sd_int_get_first_r6=4'd12,
					sd_int_over=4'd13,
					sd_int_errorout=4'd14;
reg[3:0]	sd_int_state;
reg[23:0]	sd_int_time_counter;

reg	sd_int_req;

reg[3:0]	cmd0time_counter;
reg	sd_int_next_cmd0;
reg[37:0]	SD_ACMD41;
reg[1:0]	sd_type;
reg[15:0]	sd_rca;
reg	sd_int_overflag;

//CMD
reg[37:0] send_int_cmd;
reg	send_int_cmd_req;
reg	send_int_cmd_overflag;
//Respone
reg int_get_respone_req;
reg int_respone_long_req;
reg	int_get_respone_overflag;
reg	int_get_respone_timeout;			
reg[133:0]	int_res_longdata;
reg[45:0]	int_res_shortdata;
//ERR
reg[7:0] int_errout;

always@(posedge	sys_clk)
begin
	case(sd_int_state)
		sd_int_idle://0
			begin
				//sd_int_state<=sd_int_wait_insert;
				sd_int_state<=sd_int_sendcmd0;
				sd_int_req<=1'b1;//切换成int模式下
				sd_int_overflag<=1'b0;
			end
		sd_int_sendcmd0://复位 2
			begin
				if(send_int_cmd_overflag==1'b1)
					begin
						sd_int_state<=sd_int_waitcmd0;
						send_int_cmd_req<=1'b0;
					end
				else
					begin
						send_int_cmd<={6'h0,32'h0};//cmd0
						send_int_cmd_req<=1'b1;
					end
			end
		sd_int_waitcmd0://cmd0等待指令间隔时间 3
			begin
				if(cmd0time_counter==counterncc)
					begin
						cmd0time_counter<=0;
						if(sd_int_next_cmd0==1'b1)
							begin
								sd_int_state<=sd_int_send_cmd55;
							end
						else
							begin
								sd_int_state<=sd_int_sendcmd8;
								//sd_int_state<=sd_int_wait_insert;
							end
					end
				else
					if(id_clk_pluse==1'b1)
						begin
							cmd0time_counter<=cmd0time_counter+1'd1;
						end
			end
		sd_int_sendcmd8://发送CMD8，支持V2 4
			begin
				if(send_int_cmd_overflag==1'b1)
					begin
						sd_int_state<=sd_int_get_res_r7;
						send_int_cmd_req<=1'b0;
					end
				else
					begin
						send_int_cmd<={6'd8,20'h0,4'h1,8'haa};//cmd8 2.7V-3.6V
						send_int_cmd_req<=1'b1;
					end			
			end
		sd_int_get_res_r7://得到R7回应 48bit 5
			begin
				if(int_get_respone_overflag==1'b1)
					begin
						int_get_respone_req<=1'b0;
						int_respone_long_req<=1'b0;
						if(int_get_respone_timeout==1'b1)//超时无回应
							begin
								sd_int_state<=sd_int_sendcmd0;
								sd_int_next_cmd0<=1'b1;//说明是下一次的CMD0
								SD_ACMD41<={6'd41,8'b0000_0000,8'hff,8'b0,8'b0};//第一个版本的设置数据 [31:0] OCR
								sd_type<=2'd1;//ver1.0 标准容量sd卡
							end
						else//回应需要检查
							if((int_res_shortdata[45:40]==6'd8)
							&&(int_res_shortdata[19:16]==4'd1)
							&&(int_res_shortdata[0]==1'd1))
								begin
									sd_int_state<=sd_int_send_cmd55;
									SD_ACMD41<={6'd41,8'b0100_0000,8'hff,8'h80,8'b0};//第二个版本的设置数据 支持HC 
									sd_type<=2'd2;//ver2.0 标准容量或者高容量sd卡
								end
							else
								begin
									sd_int_state<=sd_int_errorout;
								end						
					end
				else
					begin
						int_get_respone_req<=1'b1;
						int_respone_long_req<=1'b0;
					end
			end
		sd_int_send_cmd55://Acmd命令头 6
			begin
				if(send_int_cmd_overflag==1'b1)
					begin
						sd_int_state<=sd_int_get_res_fisrt_r1;
						send_int_cmd_req<=1'b0;
					end
				else
					begin
						sd_int_next_cmd0<=1'b0;//清除
						send_int_cmd_req<=1'b1;
						send_int_cmd<={6'd55,32'd0};//RCA为0						
					end					
			end			
		sd_int_get_res_fisrt_r1://CMD55 回应 48bits 7
			begin
				if(int_get_respone_overflag==1'b1)
					begin
						int_get_respone_req<=1'b0;
						int_respone_long_req<=1'b0;
						if(int_get_respone_timeout==1'b1)//超时无回应
							begin
								sd_int_state<=sd_int_idle;//错误输出
								sd_int_next_cmd0<=1'b0;//清除下次cmd0发出
							end
						else//有回应需要检查APP_CMD,READ
							begin
								if((int_res_shortdata[45:40]==6'd55)&&(int_res_shortdata[13]==1'b1)
								&&(int_res_shortdata[0]==1'b1))
								//int_res_shortdata[13]	card status [5]
									sd_int_state<=sd_int_send_acmd41;
								else
									sd_int_state<=sd_int_errorout;
							end
					end
				else
					begin
						int_get_respone_req<=1'b1;
						int_respone_long_req<=1'b0;
					end					
			end
		sd_int_send_acmd41://acmd41 8
			begin
				if(send_int_cmd_overflag==1'b1)
					begin
						sd_int_state<=sd_int_get_first_r3;
						send_int_cmd_req<=1'b0;
					end
				else
					begin 
						send_int_cmd<=SD_ACMD41;//发送ACMD41		index 41 
						send_int_cmd_req<=1'b1;						
					end				
			end
		sd_int_get_first_r3://得到R3应答 48bits  9
			begin
				if(int_get_respone_overflag==1'b1)
					begin
						int_get_respone_req<=1'b0;
						int_respone_long_req<=1'b0;
						if(int_get_respone_timeout==1'b1)//超时无回应
							begin
								sd_int_state<=sd_int_idle;
							end
						else//检查HCS的值
							begin
								if((int_res_shortdata[39]==1'b1)&&(int_res_shortdata[0]==1'b1))
								//检查busy是否为1,1表示完成上电操作
									begin
										sd_int_state<=sd_int_send_cmd2;
										if(int_res_shortdata[38]==1'b0)
											sd_type<=2'd2;//ver2.0 标准容量容量sd卡
										else
											sd_type<=2'd3;//ver2.0 高容量sd卡
									end									
								else
									sd_int_state<=sd_int_send_cmd55;//持续发送ACMD41
							end
					end	
				else
					begin
						int_get_respone_req<=1'b1;
						int_respone_long_req<=1'b0;
					end					
			end
	sd_int_send_cmd2://SD 制造信息 10
		begin
			if(send_int_cmd_overflag==1'b1)
				begin
					sd_int_state<=sd_int_get_first_r2;
					send_int_cmd_req<=1'b0;	
				end
			else
				begin
					send_int_cmd<={6'h2,32'h0};//发送CMD2
					send_int_cmd_req<=1'b1;						
				end			
		end
	sd_int_get_first_r2://134 bits 11
		begin
			if(int_get_respone_overflag==1'b1)
				begin
					int_get_respone_req<=1'b0;
					int_respone_long_req<=1'b0;
					if(int_get_respone_timeout==1'b1)//超时无回应
						begin
							sd_int_state<=sd_int_idle;
						end
					else//如果有回应不需要检查
						if(int_res_shortdata[0]==1'b1)
							begin
								sd_int_state<=sd_int_send_cmd3;
							end
						else
							begin
								sd_int_state<=sd_int_errorout;
							end
				end	
			else
				begin
					int_get_respone_req<=1'b1;
					int_respone_long_req<=1'b1;
				end
		end
	sd_int_send_cmd3://得到新的RCA值 12
		begin
			if(send_int_cmd_overflag==1'b1)
				begin
					sd_int_state<=sd_int_get_first_r6;
					send_int_cmd_req<=1'b0;
				end
			else
				begin
					send_int_cmd<={6'h3,32'h0};//发送CMD3
					send_int_cmd_req<=1'b1;					
				end			
		end
	sd_int_get_first_r6:// 48 bits  13
		begin
			if(int_get_respone_overflag==1'b1)
				begin
					int_get_respone_req<=1'b0;
					int_respone_long_req<=1'b0;
					if(int_get_respone_timeout==1'b1)//超时无回应
						begin
							sd_int_state<=sd_int_idle;
						end
					else//如果有回应检查RCA
						begin
							sd_rca<=int_res_shortdata[39:24];
							sd_int_state<=sd_int_over;
						end
				end
			else
				begin
					int_get_respone_req<=1'b1;
					int_respone_long_req<=1'b0;
				end
		end
	sd_int_over:// 14
		begin
			sd_int_overflag<=1'b1;//完成初始化标志
			sd_int_req<=1'b0;//退出int模式下
		end
	sd_int_errorout:
		begin		
			int_errout<=8'b0;
		end
	endcase
end
