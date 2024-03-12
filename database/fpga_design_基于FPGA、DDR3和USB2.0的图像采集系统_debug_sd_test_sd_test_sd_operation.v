`timescale 1ns / 1ps

//Filename:sd_opeartion.v
//Creat:2011_9_13 11am
//Author:lichenlin
//Commit:sd card operation in read or write.

module	sd_operation(
	sys_clk,             //系统时钟
	
	init_repeat_req,     //复位请求
	
	read_req,
	sd_ram_blockaddress, //sd地址
	
	outdata_en,
	outdata,
	outdata_num,
	
	write_req,
	
	read_ram_data,
	read_ram_en,
	read_ram_address,
	
	sd_idle_flag,
	
	sd_command,          
	sd_data,
	sd_clk,
	 
	crc7_outdata_en,
	crc7_outdata,
	crc7_indata,
	crc7_indata_req
	
	);

input	sys_clk;//系统时钟50MHz
input	init_repeat_req;//重新初始化

input read_req;//读数据请求

input[31:0]	sd_ram_blockaddress;//读或者写块地址

output	outdata_en;//数据有效
output[7:0]	outdata;//数据输出
output[8:0]	outdata_num;//数据输出计数器


input	write_req;//写请求
input[7:0]	read_ram_data;//从写缓存读取数据
output read_ram_en;//从写缓存读取使能
output[31:0]	read_ram_address;//从写缓存读取地址

output sd_idle_flag;//数据空闲标志

inout sd_command;//sd输出命令
inout[3:0]	sd_data;//sd三根数据线
output	sd_clk;//sd时钟

input	crc7_outdata_en;
input[6:0]	crc7_outdata;
output[39:0]	crc7_indata;
output	crc7_indata_req;

wire	sd_command_dir;
wire	sd_command_in;
wire	sd_command_out;


assign	sd_command_in=(sd_command_dir==1'b1)?sd_command:1'bz;
assign	sd_command=(sd_command_dir==1'b0)?sd_command_out:1'bz;

reg	sd_sddata_dir;
reg	sd_int_sddata_dir;
wire[3:0]	sd_sddata_out;
wire[3:0]	sd_sddata_in;

assign	sd_sddata_out=4'b1111;
assign	sd_sddata_in=((sd_int_sddata_dir==1'b1)||(sd_sddata_dir==1'b1)) ? sd_data:4'bzzzz;//1为输入
assign	sd_data=((sd_int_sddata_dir==1'b0)&&(sd_sddata_dir==1'b0)) ? sd_sddata_out:4'bzzzz;//0为输出



//SD卡认证和初始化模式的时钟
parameter	counter2_5us=8'd250;//7'd125;
reg[7:0]	id_clk_counter;
reg	id_clk_pluse;
reg	id_clk;
always @(posedge	sys_clk)
begin
	if(id_clk_counter==counter2_5us)
		begin
			id_clk_counter<=0;
			id_clk_pluse<=1'b1;
		end
	else
		begin
			id_clk_pluse<=1'b0;
			if(id_clk_counter>(counter2_5us[7:1]))
				begin
					id_clk_counter<=id_clk_counter+1'd1;
					id_clk<=1'b1;			
				end
			else
				begin
					id_clk_counter<=id_clk_counter+1'b1;
					id_clk<=1'b0;		
				end
		end
end	

//SD卡数据传输模式下的时钟
reg	data_clk;
always @(posedge	sys_clk)
begin
	data_clk<=~data_clk;		
end	


//SD认证与初始化模式
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
		sd_int_idle: //1
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

wire	cmd_clk;
//数据传输模式
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
		sd_tran_getdata: //getdata  12
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

//命令CLK

assign	cmd_clk=(sd_int_req)?id_clk_pluse:data_clk;

//数据传输中发送命令
parameter	send_cmd_idle=2'd0,
			send_cmd_sync=2'd1,
			send_cmd_bitdata=2'd2,
			send_cmd_over=2'd3;

reg[1:0]	send_cmd_state;
//reg	send_cmd_overflag;
reg[2:0]	cmd_sync_counter;
reg[37:0]	cmd_outdata;
reg[6:0]	cmd_bit_counter;
reg[7:0]	cmd_last_data;
reg	cmd_last_data_outreq;

reg	sd_command_out_temp;

reg[39:0]	crc7_indata;
reg	crc7_indata_req;

reg[37:0] send_cmd;
reg	send_cmd_req;
reg	sd_out_command_dir;
reg send_cmd_overflag;

always @(posedge	sys_clk)
	case(send_cmd_state)
		send_cmd_idle:
			begin
				if(send_cmd_req==1'b1)
					send_cmd_state<=send_cmd_sync;
			end
		send_cmd_sync://同步几次时钟
			begin
				if(cmd_sync_counter==3'd5)
					begin
						cmd_sync_counter<=0;
						crc7_indata_req<=1'b0;//禁止crc7请求信号
						send_cmd_state<=send_cmd_bitdata;
					end
				else
					begin
						if(cmd_clk==1'b1)
							begin
								sd_command_out_temp<=1'b1;
								sd_out_command_dir<=1'b1;//command输出
														
								cmd_outdata<=send_cmd;//得到cmd
								
								crc7_indata<={2'b01,send_cmd[37:0]};//输出crc7的命令值
								crc7_indata_req<=1'b1;//crc7请求信号
								
								cmd_sync_counter<=cmd_sync_counter+1'd1;
							end
					end
			end
		send_cmd_bitdata://发送单个bit值
			begin
				if(cmd_clk==1'b1)
					case(cmd_bit_counter)
						0://起始0
							begin
								sd_command_out_temp<=1'b0;
								cmd_bit_counter<=1;
							end
						1://方向1
							begin
								sd_command_out_temp<=1'b1;
								cmd_bit_counter<=2;
							end
						39://输出第40bit位，接下来是crc值
							begin
								sd_command_out_temp<=cmd_outdata[37];
								cmd_bit_counter<=40;
								if(crc7_outdata_en==1'b1)//CRC7的值
									begin 
										cmd_last_data<={crc7_outdata,1'b1};
										cmd_last_data_outreq<=1'b1;
									end
								else
									begin
										cmd_last_data<=8'hff;
									end
							end
						48:
							begin
								send_cmd_state<=send_cmd_over;
								send_cmd_overflag<=1'b1;
								
								cmd_last_data_outreq<=1'b0;
								cmd_bit_counter<=0;
							end
						default:
							begin
								cmd_bit_counter<=cmd_bit_counter+1'd1;
								if(cmd_last_data_outreq==1'b1)
									begin
										sd_command_out_temp<=cmd_last_data[7];
										cmd_last_data<={cmd_last_data[6:0],1'b0};										
									end
								else
									begin
										sd_command_out_temp<=cmd_outdata[37];
										cmd_outdata<={cmd_outdata[36:0],1'b0};
									end
							end
					endcase
			end
		send_cmd_over:
			begin
				send_cmd_state<=send_cmd_idle;
				sd_out_command_dir<=1'b0;
				send_cmd_overflag<=1'b0;
			end
	endcase

//得到数据回应 在CMD线上
parameter	get_respone_idle=3'd0,
					get_respone_bitstart=3'd1,
					get_respone_iddata=3'd2,
					get_respone_timeoutover=3'd3,
					get_respone_shiftdata=3'd4,
					get_respone_last=3'd5,
					get_respone_sendover=3'd6;
					
reg[2:0]	get_respone_state;
reg	sd_in_command_dir;
reg[6:0]	get_outtime_counter;
//reg	get_respone_overflag;
//reg	get_respone_timeout;			
//reg[133:0]	res_longdata;
//reg[45:0]	res_shortdata;
reg[1:0]	zero_counter;
reg[7:0]	respone_shift_counter;
reg[133:0]	sd_command_intemp;
reg[3:0]	get_last_counter;

reg get_respone_req;
reg respone_long_req;
reg get_respone_overflag;
reg	get_respone_timeout;
reg[133:0]	respone_longdata;
reg[45:0]	respone_shortdata;

always @(posedge	sys_clk)
case(get_respone_state)
	get_respone_idle:
		begin
			if(get_respone_req==1'b1)
				get_respone_state<=get_respone_bitstart;
		end
	get_respone_bitstart:
		begin
			sd_in_command_dir<=1'b1;//数据输入
			get_respone_state<=get_respone_iddata;
		end
	get_respone_iddata://识别起始和方向数据
		begin
			if(cmd_clk==1'b1)
				begin
					if(get_outtime_counter==7'd80)
						begin
							get_outtime_counter<=0;
							
							get_respone_state<=get_respone_timeoutover;
						end
					else
						begin
							get_outtime_counter<=get_outtime_counter+1'd1;
							case(zero_counter)//首位2个0
								0:
									begin
										if(sd_command_in==1'b0)
											zero_counter<=1;
									end
								1:
									begin
										if(sd_command_in==1'b0)
											begin
												zero_counter<=0;
												get_respone_state<=get_respone_shiftdata;
											end	
										else
											begin
												zero_counter<=0;
												get_respone_state<=get_respone_timeoutover;
											end
									end
							endcase										
						end
				end
		end
	get_respone_timeoutover:
		begin
			if(cmd_clk==1'b1)
				begin
					get_outtime_counter<=0;
					get_respone_timeout<=1'b1;
					get_respone_overflag<=1'b1;
					get_respone_state<=get_respone_sendover;
				end
		end
	get_respone_shiftdata://数据移入 暂时不做crc校验
		begin				
			if(cmd_clk==1'b1)
				begin
					get_outtime_counter<=0;
					case(respone_shift_counter)
						46:
							begin
								if(respone_long_req==1'b1)//如果是长数据回应
									begin
										sd_command_intemp<={sd_command_intemp[132:0],sd_command_in};
										respone_shift_counter<=47;
									end
								else//短数据回应
									begin
										get_respone_state<=get_respone_last;
										respone_shift_counter<=0;
									end
							end
						134://用于134bit的回应
							begin
								get_respone_state<=get_respone_last;							
								respone_shift_counter<=0;
							end
						default:
							begin
								sd_command_intemp<={sd_command_intemp[132:0],sd_command_in};;
								respone_shift_counter<=respone_shift_counter+1'd1;
							end
					endcase		
				end
		end
	get_respone_last://用于crc回转 16crc+8状态回转 回应和下个CMD间隔
		begin
			if(get_last_counter==4'd10)
				begin
					get_last_counter<=0;
					get_respone_overflag<=1'b1;
					get_respone_state<=get_respone_sendover;
					if(respone_long_req==1'b1)
						respone_longdata<=sd_command_intemp[133:0];
					else
						respone_shortdata<=sd_command_intemp[45:0];				
				end
			else
				if(cmd_clk==1'b1)
					begin
						get_last_counter<=get_last_counter+1'd1;
					end
		end
	get_respone_sendover:
		begin
			get_respone_state<=get_respone_idle;
			get_respone_overflag<=1'b0;
			get_respone_timeout<=1'b0;
			sd_in_command_dir<=1'b0;
			sd_command_intemp<=0;
		end
endcase		


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


assign	sd_command_dir=(sd_in_command_dir==1'b1)?1'b1:1'b0;//SD_IN决定方向 dir-方向 

assign	sd_command_out=(sd_out_command_dir==1'b1)?sd_command_out_temp:1'b1;//设置SD_CMD默认是1

assign	sd_clk=(sd_int_req==1'b1)?id_clk:data_clk;

assign	sd_idle_flag=(sd_int_req==1'b1)?1'b0:sd_tran_idle_flag;


// synopsys translate_off
initial	
begin

	id_clk_counter=0;
	id_clk_pluse=0;
	id_clk=0;
	data_clk=0;

	sd_int_state=sd_int_idle;
	sd_int_time_counter=0;

	sd_int_req=0;

	cmd0time_counter=0;
	sd_int_next_cmd0=0;
	SD_ACMD41=0;
	sd_type=0;
	sd_rca=0;
	sd_int_overflag=0;


	send_int_cmd=0;
	send_int_cmd_req=0;
	send_int_cmd_overflag=0;
//Respone
	int_get_respone_req=0;
	int_respone_long_req=0;
	int_get_respone_overflag=0;
	int_get_respone_timeout=0;			
	int_res_longdata=0;
	int_res_shortdata=0;

//ERR
	int_errout=0;

	sd_tran_state=sd_tran_idle;
	sd_tran_data_sync_counter=0;

	tran_data_timout=0;

	sd_block_address=0;
	block_counter=0;			
	trant_errout=0;

//SD_DATA
	get_sddata_outtime_flag=0;
	get_sddata_overflag=0;
	get_sddata_req<=0;
//CMD
	send_tran_cmd=0;
	send_tran_cmd_req=0;
	send_tran_cmd_overflag=0;
//Respone
	tran_get_respone_req=0;
	tran_respone_long_req=0;
	tran_get_respone_overflag=0;
	tran_get_respone_timeout=0;			
	tran_res_longdata=0;
	tran_res_shortdata=0;

	sd_tran_idle_flag<=0;

	send_cmd_state=send_cmd_idle;
//reg	send_cmd_overflag;
	cmd_sync_counter=0;
	cmd_outdata=0;
	cmd_bit_counter=0;
	cmd_last_data=0;
	cmd_last_data_outreq=0;

	sd_command_out_temp=0;

	crc7_indata=0;
	crc7_indata_req=0;

	send_cmd=0;
	send_cmd_req=0;
	sd_out_command_dir=0;
	send_cmd_overflag=0;


	get_respone_state=get_respone_idle;
	sd_in_command_dir=0;
	get_outtime_counter=0;

	zero_counter=0;
	respone_shift_counter=0;
	sd_command_intemp=0;
	get_last_counter=0;

	get_respone_req=0;
	respone_long_req=0;
	get_respone_overflag=0;
	get_respone_timeout=0;
	respone_longdata=0;
	respone_shortdata=0;


	get_sddata_state=get_sddata_idle;

	get_sddata_outtime_req=0;
	get_sddata_times=0;
	half_flag=0;
	outdata=0;
	outdata_en=0;
	outdata_num=0;

	sd_sddata_dir<=0;

	get_sddata_outtime_flag=0;

	clk1ms_pluse=0;
	clk1ms_counter=0;

	get_sddata_outtime_counter=0;
	
end
//synopsys translate_on 
endmodule
