
//从data数据线得到数据
parameter	get_sddata_idle=3'd0,
			get_sddat_ready=3'd1,
			get_sddata_wait_start=3'd2,
			get_sddata_shiftdata=3'd3,
			get_sddata_waitlast=3'd4,
			get_sddata_over=3'd5;
			
reg[2:0]	get_sddata_state;
//reg	get_sddata_outtime_flag;
//reg	sd_sddata_dir;
//reg	get_sddata_overflag;
reg	get_sddata_outtime_req;
reg[15:0]	get_sddata_times;
reg	half_flag;

reg[8:0]	outdata_num_delay;
reg		get_sddata_outtime_over;
reg	first_data_flag;
reg[4:0]	get_sddata_waitlast_couter;
reg[3:0]	sd_sddata_in_delay;
reg	sddata_valid_flag;
reg[8:0]	sddata_num;

always@(posedge	sys_clk)
begin
	case(get_sddata_state)	
		get_sddata_idle:
			begin
				if(get_sddata_req==1'b1)
					get_sddata_state<=get_sddat_ready;
			end
		get_sddat_ready:
			begin
				sd_sddata_dir<=1'b1;//变为输入
				get_sddata_state<=get_sddata_wait_start;
			end
		get_sddata_wait_start:
			begin
				if(get_sddata_outtime_over==1'b1)
					begin
						get_sddata_outtime_req<=1'b0;// 清除超时计算器
						get_sddata_outtime_flag<=1'b1;
						get_sddata_overflag<=1'b1;
						get_sddata_state<=get_sddata_over;
					end
				else				
					if((cmd_clk==1'b1)&&(sd_sddata_in==4'd0))						
						begin
							get_sddata_state<=get_sddata_shiftdata;
							get_sddata_outtime_req<=1'b0;// 清除超时计算器
						end
					else
						begin
							get_sddata_outtime_req<=1'b1;// 超时计算器
							get_sddata_times<=tran_data_timout;
							//get_sddata_times<=2000;
						end
			end
		get_sddata_shiftdata:
			begin
				if(cmd_clk==1'b1)
					begin
						sd_sddata_in_delay<=sd_sddata_in;//延时控制
						case(half_flag)
							0:
								begin
									half_flag<=1'b1;
									if(sddata_valid_flag==1'b1)
										sddata_num<=sddata_num+1'd1;
								end
							1:
								begin
									half_flag<=1'b0;
									if(sddata_num==9'd511)
										begin											
											get_sddata_state<=get_sddata_waitlast;
											sddata_valid_flag<=1'b0;//数据不可用
										end
									else
										begin
											sddata_valid_flag<=1'b1;//数据可用
										end
								end
						endcase	
					end
			end
		get_sddata_waitlast:
			begin
				if(get_sddata_waitlast_couter==5'd20)
					begin
						get_sddata_waitlast_couter<=0;
						get_sddata_overflag<=1'b1;
						get_sddata_state<=get_sddata_over;
					end
				else
					begin
						get_sddata_waitlast_couter<=get_sddata_waitlast_couter+1'd1;
						half_flag<=0;
						sddata_num<=0;
					end
			end
		get_sddata_over:
			begin
				get_sddata_overflag<=1'b0;
				get_sddata_state<=get_sddata_idle;
				sd_sddata_dir<=1'b0;//变为输出
			end
	endcase
end


//数据输出 
reg[7:0]	outdata;
reg	outdata_en;
reg[8:0]	outdata_num;
reg[1:0]	delay_num;

always @(posedge	sys_clk)
begin
	if(outdata_num==511)
		begin
			case(delay_num)
				0:
					begin
						delay_num<=1;						
					end
				1:
					begin
						delay_num<=2;
					end
				2:
					begin
						delay_num<=0;
						outdata_num<=0;
						outdata_en<=1'b0;
						outdata<=0;
					end
			endcase
		end
	else
		if((half_flag==1'b1)&&(cmd_clk==1'b1))
			begin
				outdata<={sd_sddata_in_delay,sd_sddata_in};
				outdata_en<=1'b1;
				if(outdata_en==1'b1)
					outdata_num<=outdata_num+1'd1;
			end
end
//数据传输过程等待数据内容超时
parameter	counter1ms=9'd400;

reg	clk1ms_pluse;
reg[8:0]	clk1ms_counter;
always @(posedge	sys_clk)
begin
	if(clk1ms_counter==counter1ms)
		begin
			clk1ms_counter<=0;
			clk1ms_pluse<=1'b1;
		end
	else
		begin
			clk1ms_pluse<=1'b0;
			if(id_clk_pluse==1'b1)
				clk1ms_counter<=clk1ms_counter+1'd1;
		end
end

reg[15:0]	get_sddata_outtime_counter;
//reg	get_sddata_outtime_over;
always @(posedge	sys_clk)
begin
	if(get_sddata_outtime_req==1'b1)
		begin
			if(get_sddata_outtime_counter==get_sddata_times)
				get_sddata_outtime_over<=1'b1;
			else
				if(clk1ms_pluse==1'b1)
					get_sddata_outtime_counter<=get_sddata_outtime_counter+1'd1;
		end
	else
		begin
			get_sddata_outtime_over<=0;
			get_sddata_outtime_counter<=0;
		end
end



//复用命令输出和命令响应模块（分别在认证和初始化模式以及数据传输模式）

always @(*)
begin
	if(sd_int_req==1'b1)
		begin
			send_cmd=send_int_cmd;
			send_cmd_req=send_int_cmd_req;
			send_int_cmd_overflag=send_cmd_overflag;
			
			get_respone_req=int_get_respone_req;
			respone_long_req=int_respone_long_req;
			int_get_respone_overflag=get_respone_overflag;
			int_get_respone_timeout=get_respone_timeout;			
			int_res_longdata=respone_longdata;
			int_res_shortdata=respone_shortdata;

			send_tran_cmd_overflag=0;
			
			tran_get_respone_overflag=0;
			tran_get_respone_timeout=0;
			tran_res_longdata=0;
			tran_res_shortdata=0;			
		end
	else
		begin
			send_cmd=send_tran_cmd;
			send_cmd_req=send_tran_cmd_req;
			send_tran_cmd_overflag=send_cmd_overflag;
			
			get_respone_req=tran_get_respone_req;
			respone_long_req=tran_respone_long_req;
			tran_get_respone_overflag=get_respone_overflag;
			tran_get_respone_timeout=get_respone_timeout;			
			tran_res_longdata=respone_longdata;
			tran_res_shortdata=respone_shortdata;	
		
			send_int_cmd_overflag=0;
			
			int_get_respone_overflag=0;
			int_get_respone_timeout=0;
			int_res_longdata=0;
			int_res_shortdata=0;			
		end
end


assign	sd_command_dir=(sd_in_command_dir==1'b1)?1'b1:1'b0;//SD_IN决定方向

assign	sd_command_out=(sd_out_command_dir==1'b1)?sd_command_out_temp:1'b1;//设置SD_CMD默认是1

assign	sd_clk=(sd_int_req==1'b1)?id_clk:data_clk;

assign	sd_idle_flag=(sd_int_req==1'b1)?1'b0:sd_tran_idle_flag;