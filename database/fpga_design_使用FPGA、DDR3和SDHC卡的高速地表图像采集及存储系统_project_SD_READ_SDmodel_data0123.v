wire	cmd_clk;
//数据传输过程
parameter	sd_tran_idle=4'd0,
					sd_tran_sync=4'd1,
					sd_tran_send_cmd9=4'd2,
					sd_tran_get_first_r2=4'd3,
					sd_tran_send_cmd7=4'd4,
					sd_tran_get_first_r1b=4'd5,
					sd_tran_send_cmd55=4'd6,
					sd_tran_get_res_first_r1=4'd7,
					sd_tran_send_acmd6=4'd8,
					sd_tran_get_res_sec_r1=4'd9,
					sd_tran_wait_req=4'd10,
					sd_tran_send_cmd17=4'd11,
					sd_tran_getdata	=4'd12,
					sd_tran_error=4'd13;
reg[3:0]	sd_tran_state;
reg[1:0]	sd_tran_data_sync_counter;

reg[6:0]	tran_data_timout;

reg[31:0]	sd_block_address;
reg[31:0]	block_counter;			
reg[7:0]	trant_errout;

//SD_DATA
reg	get_sddata_outtime_flag;
reg	get_sddata_overflag;
reg	get_sddata_req;
//CMD
reg[37:0] send_tran_cmd;
reg	send_tran_cmd_req;
reg	send_tran_cmd_overflag;
//Respone
reg tran_get_respone_req;
reg tran_respone_long_req;
reg	tran_get_respone_overflag;
reg	tran_get_respone_timeout;			
reg[133:0]	tran_res_longdata;
reg[45:0]	tran_res_shortdata;

reg	sd_tran_idle_flag;
					
always@(posedge	sys_clk)
begin
	case(sd_tran_state)
		sd_tran_idle:// 0
			begin
				if(sd_int_overflag==1'b1)//等待初始化完成
					begin						 
						sd_tran_state<=sd_tran_sync;
					end
			end
		sd_tran_sync://用于同步25M时钟  1
			begin
				if(sd_tran_data_sync_counter==3)
					begin
						sd_tran_data_sync_counter<=0;
						sd_tran_state<=sd_tran_send_cmd9;	
					end
				else
					if(cmd_clk==1'b1)
						begin
							sd_tran_data_sync_counter<=sd_tran_data_sync_counter+1'd1;
						end
			end
		sd_tran_send_cmd9://用于RCA访问CSD数据  2
			begin
				if(send_tran_cmd_overflag==1'b1)
					begin
						sd_tran_state<=sd_tran_get_first_r2;
						send_tran_cmd_req<=1'b0;
					end
				else
					begin
						send_tran_cmd<={6'd9,sd_rca[15:0],16'd0};//cmd9
						send_tran_cmd_req<=1'b1;
					end
			end
		sd_tran_get_first_r2://得到R2回应，分析CSD参数  134bits 3
			begin
				if(tran_get_respone_overflag==1'b1)
					begin
						tran_get_respone_req<=1'b0;
						tran_respone_long_req<=1'b0;
						if(tran_get_respone_timeout==1'b1)//超时无回应
							begin
								sd_tran_state<=sd_tran_error;
							end
						else//如果有回应计算卡空间，读取超时时间
							begin
								sd_tran_state<=sd_tran_send_cmd7;
								if(tran_res_longdata[127:126]==2'b00) //ver 1.0 csd
									begin
										//sd_size<=(tran_res_longdata[73:62]+1)*(
										case(tran_res_longdata[114:112])
											6:
												tran_data_timout<=8;//读取数据超时判断 ms为单位
											7:
												tran_data_timout<=80;
											default:
												tran_data_timout<=2;
										endcase
									end
								else
									if(tran_res_longdata[127:126]==2'b01)
										begin
											tran_data_timout<=2;
										end
							end
					end
				else
					begin
						tran_respone_long_req<=1'b1;//长数据分析
						tran_get_respone_req<=1'b1;
					end
			end			
		sd_tran_send_cmd7://更改状态，进入数据传输状态  4
			begin
				if(send_tran_cmd_overflag==1'b1)
					begin
						sd_tran_state<=sd_tran_get_first_r1b;
						send_tran_cmd_req<=1'b0;
					end
				else
					begin
						send_tran_cmd<={6'd7,sd_rca[15:0],16'd0};
						send_tran_cmd_req<=1'b1;
					end
			end
		sd_tran_get_first_r1b://得到R1b回应  48bits 5
			begin
				if(tran_get_respone_overflag==1'b1)
					begin
						tran_get_respone_req<=1'b0;
						tran_respone_long_req<=1'b0;
						if(tran_get_respone_timeout==1'b1)//超时无回应
							begin
								sd_tran_state<=sd_tran_error;
							end
						else//如果有回应不需要检查
							begin
								sd_tran_state<=sd_tran_send_cmd55;
							end
					end
				else
					begin
						tran_respone_long_req<=1'b0;
						tran_get_respone_req<=1'b1;						
					end
			end	
		sd_tran_send_cmd55://Acmd命令头  6
			begin
				if(send_tran_cmd_overflag==1'b1)
					begin
						sd_tran_state<=sd_tran_get_res_first_r1;
						send_tran_cmd_req<=1'b0;
					end
				else
					begin
						send_tran_cmd<={6'd55,sd_rca[15:0],16'd0};
						send_tran_cmd_req<=1'b1;						
					end					
			end
		sd_tran_get_res_first_r1://CMD55 回应  48bits 7
			begin
				if(tran_get_respone_overflag==1'b1)
					begin
						tran_get_respone_req<=1'b0;
						tran_respone_long_req<=1'b0;
						if(tran_get_respone_timeout==1'b1)//超时无回应
							begin
								sd_tran_state<=sd_tran_error;
							end
						else//有回应需要检查APP_CMD,READ
							begin
								//if((tran_res_shortdata[45:40]==6'd55)
								//&&(tran_res_shortdata[13]==1'b1)
								//&&(tran_res_shortdata[0]==1'b1))
								if(tran_res_shortdata[13]==1'b1)//APP_CMD
									sd_tran_state<=sd_tran_send_acmd6;
								else
									sd_tran_state<=sd_tran_idle;
							end
					end
				else
					begin
						tran_respone_long_req<=1'b0;
						tran_get_respone_req<=1'b1;
					end			
			end
		sd_tran_send_acmd6://acmd6 设置数据宽度  8
			begin
				if(send_tran_cmd_overflag==1'b1)
					begin
						sd_tran_state<=sd_tran_get_res_sec_r1;
						send_tran_cmd_req<=1'b0;
					end
				else
					begin
						send_tran_cmd<={6'd6,30'd0,2'b10};//发送ACMD6						
						send_tran_cmd_req<=1'b1;
					end				
			end
		sd_tran_get_res_sec_r1://得到第二个R1应答  9
			begin
				if(tran_get_respone_overflag==1'b1)
					begin
						tran_get_respone_req<=1'b0;
						tran_respone_long_req<=1'b0;
						if(tran_get_respone_timeout==1'b1)//超时无回应
							begin
								sd_tran_state<=sd_tran_error;
							end
						else//不检查
							begin
								sd_tran_state<=sd_tran_wait_req;
							end
					end
				else
					begin
						tran_respone_long_req<=1'b0;	
						tran_get_respone_req<=1'b1;
					end					
			end
		sd_tran_wait_req:// 等待写请求   10 
			begin
				if(read_req==1'b1)
					begin
						sd_tran_state<=sd_tran_send_cmd17;
						sd_tran_idle_flag<=1'b0;//处于忙状态
						case(sd_type)
							2'd1,2'd2://V1.0 V2.0 标准容量
								begin
									sd_block_address<={sd_ram_blockaddress[22:0],9'b0};
								end
							2'd3://高容量
								begin
									sd_block_address<=sd_ram_blockaddress;
								end
						endcase
					end
				else
					begin
						sd_tran_idle_flag<=1'b1;//空闲状态
						sd_tran_state<=sd_tran_wait_req;
					end
			end
		sd_tran_send_cmd17://读取单个block信息  11
			begin
				if(send_tran_cmd_overflag==1'b1)
					begin
						sd_tran_state<=sd_tran_getdata;
						send_tran_cmd_req<=1'b0;
					end
				else
					begin
						send_tran_cmd<={6'd17,sd_block_address};//发送cmd17
						send_tran_cmd_req<=1'b1;
					end			
			end		
		sd_tran_getdata://getdata  12
			begin
				if(get_sddata_overflag==1'b1)
					begin
						get_sddata_req<=1'b0;
						if(get_sddata_outtime_flag==1'b1)//读取数据超时
							begin							
								sd_tran_state<=sd_tran_wait_req;
							end
						else
							begin
								sd_tran_state<=sd_tran_wait_req;
								case(sd_type)
									2'd1,2'd2://V1.0 V2.0 标准容量
										begin
											sd_block_address<={sd_block_address[22:0]+1'd1,9'b0};
										end
									2'd3://高容量
										begin
											sd_block_address<=sd_block_address+1'd1;
										end
								endcase
								sd_tran_state<=sd_tran_send_cmd17;
							end
					end
				else
					get_sddata_req<=1'b1;
			end
		sd_tran_error:
			begin
				trant_errout<=8'b0;
			end	
	endcase
end