//filename:fat_read.v
//Author:lichenlin
//Creat:2011-10-3 3pm
//comit:用于fat文件读操作算法。

module fat_read(
	sys_clk,
	
	//读取目录请求
	fat_read_dir_req,
	
	//FAT文件根目录文件输出
	fat_dirout_ram_wr,
	fat_dirout_ram_wrdata,
	fat_dirout_ram_wraddress,	

	//FAT文件根目录缓冲中读取数据
	
	fat_dirout_temp_ram_wr,
	fat_dirout_temp_ram_wrdata,
	fat_dirout_temp_ram_wraddress,
	
	fat_dirout_temp_ram_rden,
	fat_dirout_temp_ram_rddata,
	fat_dirout_temp_ram_rdaddress,
	
	//FAT文件选择
	fat_read_file_select,
	fat_read_file_select_req,
	
	//FAT文件输出
	fat_filedata_data,
	fat_filedata_dataen,
	fat_filedata_address,
	
	
	//SD卡RAM读取
	sd_ram_rden,
	sd_ram_rdaddress,
	sd_ram_rddata,
	
	sd_ram_blockaddress,
	sd_ram_req,
	
	//FAT表
	fat_table_rden,
	fat_table_rdaddress,
	fat_table_rddata,
	fat_table_sel,
		
	sd_idle_flag,
	
	file_error
	);
parameter	fat_dir_address_total=8'd255;
	
input sys_clk;
input	fat_read_dir_req;

output	fat_dirout_ram_wr;
output[7:0]	fat_dirout_ram_wrdata;
output[7:0]	fat_dirout_ram_wraddress;

output	fat_dirout_temp_ram_wr;
output[7:0]	fat_dirout_temp_ram_wrdata;
output[7:0]	fat_dirout_temp_ram_wraddress;

output	fat_dirout_temp_ram_rden;
input[7:0]	fat_dirout_temp_ram_rddata;
output[7:0]	fat_dirout_temp_ram_rdaddress;

input[4:0] fat_read_file_select;//文件选择
input	fat_read_file_select_req;

output	sd_ram_rden;//SD输出缓存中有效读信号
output[8:0]	sd_ram_rdaddress;//SD输出缓存地址
input[7:0]	sd_ram_rddata;//SD输出缓存中数据

output[31:0] sd_ram_blockaddress;//sd卡的开始块
output sd_ram_req;//sd卡的有效信号

output	fat_table_rden;//FAT表缓冲读取
output[8:0]	fat_table_rdaddress;//FAT表缓冲地址
input[7:0]	fat_table_rddata;//FAT表缓冲数据
output	fat_table_sel;//FAT表输出选择

output	fat_filedata_dataen;//外部数据输出写入
output[7:0]	fat_filedata_data;//外部数据输出
output[31:0]	fat_filedata_address;//外部数据输出字节数

input	sd_idle_flag;//sd卡的空闲状态中
output[1:0]	file_error;

parameter	file_idle=4'd0;
parameter	file_wait_dir_req=4'd1;
parameter	file_wait_sd_intover=4'd2;
parameter	file_get_param=4'd3;
parameter	file_get_getdir=4'd4;
parameter	file_wati_selectfile=4'd5;
parameter	file_get_filedata=4'd6;
parameter	file_error_out=4'd7;
reg[3:0]	file_state;
reg[1:0]	file_error;

reg get_param_req;
reg	get_param_overflag;

reg	get_param_error;

reg	get_filedir_overflag;
reg	get_filedir_req;

reg get_filedata_req;
reg get_filedata_overflag;

reg[1:0]	param_error_code;

reg[4:0]	fat_read_file_select_reg;

always@(posedge	sys_clk)
begin
	case(file_state)
		file_idle:
			begin
				file_state<=file_wait_dir_req;
			end
		file_wait_dir_req:
			begin
				if(fat_read_dir_req==1'b1)
					begin
						file_state<=file_wait_sd_intover;
					end					
			end
		file_wait_sd_intover://等待sd卡初始化完成
			begin
				if(sd_idle_flag==1'b1)
					begin
						file_state<=file_get_param;//从第0个block得到参数
					end
			end
		file_get_param://得到参数
			begin
				if(get_param_overflag==1'b1)
					begin
						get_param_req<=1'b0;
						if(get_param_error==1'b1)
							begin
								file_error<=param_error_code;
								file_state<=file_error_out;
							end
						else
							begin
								file_state<=file_get_getdir;
							end
					end
				else
					begin
						get_param_req<=1'b1;
					end
			end
		file_get_getdir://得到目录
			begin
				if(get_filedir_overflag==1'b1)
					begin
						file_state<=file_wati_selectfile;
						get_filedir_req<=1'b0;
					end
				else
					begin
						get_filedir_req<=1'b1;
					end
			end
		file_wati_selectfile://等待选择文件 
			begin
				if(fat_read_file_select_req==1'b1)
					begin	
						file_state<=file_get_filedata;
						fat_read_file_select_reg<=fat_read_file_select;
					end
			end
		file_get_filedata://从文件的第一个簇号，读取数据
			begin
				if(get_filedata_overflag==1'b1)
					begin
						file_state<=file_wati_selectfile;
						get_filedata_req<=1'b0;
					end
				else
					begin
						get_filedata_req<=1'b1;
					end
			end
		file_error_out:
			begin
				file_state<=file_idle;
			end
	endcase		
end


parameter	get_param_idle=3'd0;
parameter	get_param_send_readreq=3'd1;
parameter	get_param_read_param=3'd2;
parameter	get_param_judge_data=3'd3;
parameter	get_param_over=3'd4;
reg[2:0]	get_param_state;
reg[3:0]	param_read_counter;

reg	fat_table_sel;

reg	sd_param_ram_rden;
reg[8:0]	sd_param_ram_rdaddress;
reg[15:0]	fat_bytes_per_sec;
reg[7:0]	fat_ser_per_clus;
reg[15:0]	fat_rsvd_sec_cnt;
reg[15:0]	fat_root_ent_cont;
reg[15:0]	fat_fat_size;

reg sd_param_ram_out_req;
reg[31:0] sd_param_ram_out_blockaddress;
reg sd_read_req_overflag;
//in get_param_req;
//out get_param_overflag;
always@(posedge	sys_clk)
begin
case(get_param_state)
	get_param_idle:
		begin
			if(get_param_req)
				get_param_state<=get_param_send_readreq;
		end
	get_param_send_readreq:
		begin
			if(sd_read_req_overflag==1'b1)
				begin
					sd_param_ram_out_req<=1'b0;
					get_param_state<=get_param_read_param;
				end
			else
				begin
					sd_param_ram_out_blockaddress<=0;
					sd_param_ram_out_req<=1'b1;
				end
		end
	get_param_read_param://block 参数读取
		begin
			case(param_read_counter)
				0:
					begin
						param_read_counter<=1;
						sd_param_ram_rden<=1'b1;
						sd_param_ram_rdaddress<=9'd11;
					end
				1:
					begin
						param_read_counter<=2;
						sd_param_ram_rdaddress<=9'd12;
					end
				2:
					begin
						param_read_counter<=3;
						fat_bytes_per_sec[7:0]<=sd_ram_rddata;//得到数据 每个扇区的字节数低位
						sd_param_ram_rdaddress<=9'd13;						
					end
				3:
					begin
						param_read_counter<=4;
						fat_bytes_per_sec[15:8]<=sd_ram_rddata;//得到数据 每个扇区的字节数高位
						sd_param_ram_rdaddress<=9'd14;						
					end
				4:
					begin
						param_read_counter<=5;
						fat_ser_per_clus[7:0]<=sd_ram_rddata;//得到数据 每个簇的扇区数目
						sd_param_ram_rdaddress<=9'd15;						
					end
				5:
					begin
						fat_rsvd_sec_cnt[7:0]<=sd_ram_rddata;//得到数据 保留扇区的低字节
						param_read_counter<=6;
						sd_param_ram_rdaddress<=9'd17;						
					end
				6:
					begin
						fat_rsvd_sec_cnt[15:8]<=sd_ram_rddata;//得到数据 保留扇区的高字节
						param_read_counter<=7;
						sd_param_ram_rdaddress<=9'd18;						
					end
				7:
					begin
						fat_root_ent_cont[7:0]<=sd_ram_rddata;//得到数据 根目录中的目录项数低字节
						param_read_counter<=8;
						sd_param_ram_rdaddress<=9'd22;						
					end	
				8:
					begin
						fat_root_ent_cont[15:8]<=sd_ram_rddata;//得到数据 根目录中的目录项数高字节
						param_read_counter<=9;
						sd_param_ram_rdaddress<=9'd23;						
					end	
				9:
					begin
						fat_fat_size[7:0]<=sd_ram_rddata;//得到数据 FAT表占用扇区数低字节
						param_read_counter<=10;
						sd_param_ram_rden<=1'b0;//停止读
						sd_param_ram_rdaddress<=9'd0;
					end
				10:
					begin
						fat_fat_size[15:8]<=sd_ram_rddata;//得到数据 FAT表占用扇区数高字节
						param_read_counter<=0;
						sd_param_ram_rdaddress<=9'd0;
						get_param_state<=get_param_judge_data;
					end
			endcase
		end
	get_param_judge_data://判断数据内容是否支持  输出错误代码
		begin
			get_param_state<=get_param_over;
			get_param_overflag<=1'b1;
			if(fat_bytes_per_sec!=16'd512)//不是512，不支持
				begin
					get_param_error<=1'b1;//输出错误
					param_error_code<=2'd1;//错误编码		不是512字节/扇区 不支持			
				end
			else
				if(fat_fat_size==0)
					begin
						get_param_error<=1'b1;//输出错误
						param_error_code<=2'd2;//错误编码	 不是FAT16
					end
				else
					if(fat_root_ent_cont!=10'd512)
						begin
							get_param_error<=1'b1;
							param_error_code<=2'd3;//错误编码	 目录项不兼容
						end
					else
						begin
							param_error_code<=2'd0;
							get_param_error<=1'b0;
						end
		end	
	get_param_over:
		begin
			get_param_state<=get_param_idle;
			get_param_overflag<=1'b0;
			get_param_error<=1'b0;
		end
	endcase
end

parameter	get_filedir_idle=3'd0;
parameter	get_filedir_send_readreq=3'd1;
parameter	get_filedir_read_dir=3'd2;
parameter	get_filedir_table_counter_judge=3'd3;
parameter	get_filedir_nextblock_judge=3'd4;
parameter	get_filedir_clrlast=3'd5;
parameter	get_filedir_over=3'd6;
reg[2:0]	get_filedir_state;
reg[4:0]	read_dir_counter;

reg[3:0]	sd_ram_address_step;
reg[3:0]	filename_table_counter;
reg	fat_dirout_ram_wr;
reg[7:0]	fat_dirout_ram_wrdata;
reg[7:0]	fat_dirout_ram_wraddress;
reg[31:0]	next_dirblock;

reg	fat_dirout_temp_ram_wr;
reg[7:0]	fat_dirout_temp_ram_wrdata;
reg[7:0]	fat_dirout_temp_ram_wraddress;

reg	sd_filedir_ram_out_req;
reg[31:0]	sd_filedir_ram_out_blockaddress;

//in get_filedir_req;
//out get_filedir_overflag;

reg	sd_filedir_ram_rden;
reg[8:0]	sd_filedir_ram_rdaddress;

always @(posedge sys_clk)
begin
case(get_filedir_state)
	get_filedir_idle:
		begin
			if(get_filedir_req)
				get_filedir_state<=get_filedir_send_readreq;
		end
	get_filedir_send_readreq:
		begin
			if(sd_read_req_overflag==1'b1)
				begin
					sd_filedir_ram_out_req<=1'b0;
					get_filedir_state<=get_filedir_read_dir;
				end
			else
				begin
					sd_filedir_ram_out_blockaddress<=fat_rsvd_sec_cnt
																	+{fat_fat_size[15:0],1'b0}
																	+next_dirblock;
					sd_filedir_ram_out_req<=1'b1;
				end
		end
	get_filedir_read_dir://重要是其中18个字节 0~10 11 26-27 28-31 
		begin
			case(read_dir_counter)
				0:
					begin
						read_dir_counter<=1;
						sd_filedir_ram_rden<=1'b1;
						sd_filedir_ram_rdaddress<={sd_ram_address_step,5'b0}+1'd0;
					end
				1:
					begin
						read_dir_counter<=2;
						sd_filedir_ram_rdaddress<=sd_filedir_ram_rdaddress+1'd1;
						
						fat_dirout_ram_wr<=1'b1;
						fat_dirout_ram_wrdata<=filename_table_counter;//文件序号从0开始
						fat_dirout_ram_wraddress<=1'd0+{filename_table_counter,4'b0};//16bit	
					end
				2:
					begin
						sd_filedir_ram_rdaddress<=sd_filedir_ram_rdaddress+1'd1;
						case(sd_ram_rddata[7:0])
							0:
								begin
									get_filedir_state<=get_filedir_clrlast;//清除剩余的RAM
									read_dir_counter<=0;
								end
							8'he5:
								begin
									get_filedir_state<=get_filedir_nextblock_judge;//读取下个32字节的数据
									read_dir_counter<=0;
								end
							default:
								begin
									read_dir_counter<=3;
									fat_dirout_ram_wrdata<=sd_ram_rddata;//文件序号从0开始
									fat_dirout_ram_wraddress<=fat_dirout_ram_wraddress+1'd1;	
								
								end
						endcase
					end
				3,4,5,6,7,8,9,10:
					begin
						read_dir_counter<=read_dir_counter+1'd1;
						sd_filedir_ram_rdaddress<=sd_filedir_ram_rdaddress+1'd1;
						
						fat_dirout_ram_wrdata<=sd_ram_rddata;
						fat_dirout_ram_wraddress<=fat_dirout_ram_wraddress+1'd1;	
					end
				11:
					begin
						read_dir_counter<=12;
						sd_filedir_ram_rdaddress<={sd_ram_address_step,5'b0}+9'd11;

						fat_dirout_ram_wrdata<=sd_ram_rddata;
						fat_dirout_ram_wraddress<=fat_dirout_ram_wraddress+1'd1;								
					end
				12:
					begin
						read_dir_counter<=13;
						sd_filedir_ram_rdaddress<={sd_ram_address_step,5'b0}+9'd26;

						fat_dirout_ram_wrdata<=sd_ram_rddata;
						fat_dirout_ram_wraddress<=fat_dirout_ram_wraddress+1'd1;						
					end
				13://第12个字节 从0开始
					begin
						if(((sd_ram_rddata&&8'h3f)!=8'h0f)//不是ALL_LONG_NAME
							&&(sd_ram_rddata!=8'h08)//不是卷标,
							&&(sd_ram_rddata!=8'h10))//不是目录
								begin
									sd_filedir_ram_rdaddress<=sd_filedir_ram_rdaddress+1'd1;
									read_dir_counter<=14;
								end
							else
								begin
									get_filedir_state<=get_filedir_nextblock_judge;
									read_dir_counter<=0;
								end
					end
				14://开始簇号低字节
					begin
						read_dir_counter<=15;
						sd_filedir_ram_rdaddress<=sd_filedir_ram_rdaddress+1'd1;
						
						fat_dirout_ram_wrdata<=sd_ram_rddata;
						fat_dirout_ram_wraddress<=fat_dirout_ram_wraddress+1'd1;	
						
						fat_dirout_temp_ram_wr<=1'b1;
						fat_dirout_temp_ram_wrdata<=sd_ram_rddata;
						fat_dirout_temp_ram_wraddress<=1'd0+{filename_table_counter,3'b0};//8字节偏移						
						
					end
				15,16,17:
					begin
						read_dir_counter<=read_dir_counter+1'd1;
						sd_filedir_ram_rdaddress<=sd_filedir_ram_rdaddress+1'd1;	

						fat_dirout_ram_wrdata<=sd_ram_rddata;
						fat_dirout_ram_wraddress<=fat_dirout_ram_wraddress+1'd1;	
						
						fat_dirout_temp_ram_wrdata<=sd_ram_rddata;
						fat_dirout_temp_ram_wraddress<=fat_dirout_temp_ram_wraddress+1'd1;						
					end
				18:
					begin
						read_dir_counter<=19;
						sd_filedir_ram_rdaddress<=0;
						sd_filedir_ram_rden<=1'b0;
						
						fat_dirout_ram_wrdata<=sd_ram_rddata;
						fat_dirout_ram_wraddress<=fat_dirout_ram_wraddress+1'd1;

						fat_dirout_temp_ram_wrdata<=sd_ram_rddata;
						fat_dirout_temp_ram_wraddress<=fat_dirout_temp_ram_wraddress+1'd1;				
					end
				19:
					begin
						read_dir_counter<=0;
						
						fat_dirout_ram_wrdata<=sd_ram_rddata;
						fat_dirout_ram_wraddress<=fat_dirout_ram_wraddress+1'd1;
						
						fat_dirout_temp_ram_wrdata<=sd_ram_rddata;
						fat_dirout_temp_ram_wraddress<=fat_dirout_temp_ram_wraddress+1'd1;	

						get_filedir_state<=get_filedir_table_counter_judge;
					end		
			endcase
		end
	get_filedir_table_counter_judge://文件名目录表数量判断
		begin
			if(filename_table_counter==15)
				begin
					filename_table_counter<=0;
					get_filedir_state<=get_filedir_clrlast;
				end
			else
				begin
					filename_table_counter<=filename_table_counter+1'd1;//文件序号增加
					get_filedir_state<=get_filedir_nextblock_judge;					
				end			
		end
	get_filedir_nextblock_judge://遍历是否跳转新的FAT根目录扇区判断
		begin
			if(sd_ram_address_step==15)//最后的一块
				begin
					next_dirblock<=next_dirblock+1'd1;
					sd_ram_address_step<=0;
					get_filedir_state<=get_filedir_send_readreq;//读取下个扇区的数据
				end
			else
				begin
					sd_ram_address_step<=sd_ram_address_step+1'd1;//增加32地址偏移
					get_filedir_state<=get_filedir_read_dir;
				end
		end
	get_filedir_clrlast://清除剩余的RAM单元
		begin
			fat_dirout_temp_ram_wr<=1'b0;
			fat_dirout_temp_ram_wraddress<=0;
			if(fat_dirout_ram_wraddress<fat_dir_address_total)
				begin
					fat_dirout_ram_wraddress<=fat_dirout_ram_wraddress+1'd1;
					fat_dirout_ram_wrdata<=0;				
				end
			else
				begin
					fat_dirout_ram_wr<=1'b0;//dir ram停止写入
					fat_dirout_ram_wraddress<=0;
					
					get_filedir_overflag<=1'b1;
					get_filedir_state<=get_filedir_over;
				end
		end
	get_filedir_over:
		begin
			get_filedir_state<=get_filedir_idle;
			get_filedir_overflag<=1'b0;
			sd_ram_address_step<=0;
			next_dirblock<=0;
		end
	endcase
end

parameter	get_filedata_idle=4'd0;
parameter	get_filedata_get_first_param=4'd1;
parameter	get_filedata_sec=4'd2;
parameter	get_filedata_readblock=4'd03;
parameter	get_filedata_wait_dataready=4'd4;
parameter	get_filedata_begin_outdata=4'd5;
parameter	get_filedata_send_outdata=4'd6;
parameter	get_filedata_judge=4'd7;
parameter	get_filedata_next_clu=4'd8;
parameter	get_filedata_over=4'd9;
reg[3:0]	get_filedata_state;
reg[31:0]	filedata_last_size;
reg[15:0]	filedata_clu_address;
reg[31:0]	filedata_sec_block;
reg[1:0]	begin_fatout_counter;
reg[31:0]	fat_filedata_address;
reg	fat_filedata_dataen;
reg[7:0]	fat_filedata_data;
reg[9:0]	address_counter;
reg[7:0]	sec_block_step;
reg[15:0]	filedata_clu_new_address;

reg	get_fat_table_overflag;

reg[2:0]	get_first_param_counter;
reg	fat_dirout_temp_ram_rden;
reg[7:0]	fat_dirout_temp_ram_rdaddress;
reg	get_fat_table_req;
reg[31:0]	sd_filedata_ram_out_blockaddress;
reg	sd_filedata_ram_out_req;
reg[8:0]	sd_filedata_ram_rdaddress;
reg	sd_filedata_ram_rden;

//in get_filedata_req;
//out get_filedata_overflag;
always @(posedge	 sys_clk)
begin
	case(get_filedata_state)
		get_filedata_idle:
			begin
				if(get_filedata_req)
					get_filedata_state<=get_filedata_get_first_param;
			end
		get_filedata_get_first_param:
			begin
				case(get_first_param_counter)
					0:
						begin
							get_first_param_counter<=1;
							fat_dirout_temp_ram_rden<=1;
							fat_dirout_temp_ram_rdaddress<={fat_read_file_select_reg,3'd0};
						end
					1:
						begin
							get_first_param_counter<=2;						
							fat_dirout_temp_ram_rdaddress<=fat_dirout_temp_ram_rdaddress+1'd1;
						end
					2://FIRST CLU
						begin
							get_first_param_counter<=3;
							filedata_clu_address[7:0]<=fat_dirout_temp_ram_rddata;
							fat_dirout_temp_ram_rdaddress<=fat_dirout_temp_ram_rdaddress+1'd1;
						end
					3:
						begin
							get_first_param_counter<=4;
							filedata_clu_address[15:8]<=fat_dirout_temp_ram_rddata;
							fat_dirout_temp_ram_rdaddress<=fat_dirout_temp_ram_rdaddress+1'd1;							
						end
					4://文件大小
						begin
							get_first_param_counter<=5;
							filedata_last_size[7:0]<=fat_dirout_temp_ram_rddata;
							fat_dirout_temp_ram_rdaddress<=fat_dirout_temp_ram_rdaddress+1'd1;							
						end
					5://文件大小
						begin
							get_first_param_counter<=6;
							filedata_last_size[15:8]<=fat_dirout_temp_ram_rddata;
							fat_dirout_temp_ram_rdaddress<=fat_dirout_temp_ram_rdaddress+1'd1;							
						end
					6://文件大小
						begin
							get_first_param_counter<=7;
							filedata_last_size[23:16]<=fat_dirout_temp_ram_rddata;
							fat_dirout_temp_ram_rdaddress<=0;
							fat_dirout_temp_ram_rden<=1'b0;
						end
					7:
						begin
							get_first_param_counter<=0;
							filedata_last_size[31:24]<=fat_dirout_temp_ram_rddata;
							get_filedata_state<=get_filedata_sec;
						end
				endcase	
			end
		get_filedata_sec://得到扇区值
			begin
				if(fat_fat_size==0)
					begin
						get_filedata_overflag<=1'b1;
						get_filedata_state<=get_filedata_over;
					end
				else
					begin
						filedata_sec_block<=filedata_clu_address[15:0]*fat_ser_per_clus[7:0]
														-{fat_ser_per_clus[7:0],1'b0}
														+fat_rsvd_sec_cnt[15:0]+{fat_fat_size[15:0],1'b0}
														+9'd32+sec_block_step;//sec_block_step 扇区增加步长
						get_filedata_state<=get_filedata_readblock;//开始簇号										
					end
										
			end
		get_filedata_readblock:
			begin
				if(sd_read_req_overflag==1'b1)
					begin
						sd_filedata_ram_out_req<=1'b0;
						get_filedata_state<=get_filedata_begin_outdata;
					end
				else
					begin
						sd_filedata_ram_out_blockaddress<=filedata_sec_block;
						sd_filedata_ram_out_req<=1'b1;
					end
			end
		get_filedata_begin_outdata://开始输出数据
			begin
				case(begin_fatout_counter)
					0:
						begin							
							sd_filedata_ram_rden<=1'b1;
							sd_filedata_ram_rdaddress<=9'd0;
							begin_fatout_counter<=1;							
						end
					1:
						begin							
							sd_filedata_ram_rdaddress<=9'd1;							
							begin_fatout_counter<=2;							
						end
					2:
						begin
							fat_filedata_dataen<=1'b1;
							begin_fatout_counter<=0;
							get_filedata_state<=get_filedata_send_outdata;
						end
				endcase
			end
		get_filedata_send_outdata://输出数据
			begin
				if(address_counter==(filedata_last_size-1))
					begin
						fat_filedata_address<=0;
						fat_filedata_dataen<=1'b0;
						address_counter<=0;
						
						sd_filedata_ram_rdaddress<=0;//停止读sd卡缓存
						sd_filedata_ram_rden<=1'b0;//停止读sd卡缓存
						
						get_filedata_overflag<=1'b1;
						get_filedata_state<=get_filedata_over;//完成数据输出
					end
				else
					case(address_counter)
						0:	
							begin
								sd_filedata_ram_rdaddress<=9'd2;
								
								fat_filedata_dataen<=1'b1;
								fat_filedata_data<=sd_ram_rddata;
								fat_filedata_address<=fat_filedata_address+1'b1;
								
								address_counter<=1;
							end
						510:
							begin
								sd_filedata_ram_rden<=1'b0;
								sd_filedata_ram_rdaddress<=0;
								
								address_counter<=511;
								fat_filedata_data<=sd_ram_rddata;
								fat_filedata_address<=fat_filedata_address+1'd1;
							end
						511:
							begin
								address_counter<=0;
								get_filedata_state<=get_filedata_judge;
								filedata_last_size<=filedata_last_size-10'd512;//减去512
							end
						default:
							begin
								sd_filedata_ram_rdaddress<=sd_filedata_ram_rdaddress+1'd1;
								address_counter<=address_counter+1'd1;
								fat_filedata_data<=sd_ram_rddata;
								fat_filedata_address<=fat_filedata_address+1'd1;							
							end
					endcase
			end
		get_filedata_judge://判断是否读取下个扇区 下个簇号
			begin
				if(filedata_last_size[31:9]>=(fat_ser_per_clus[7:0]-1))//大于一个簇情况下
					begin
						if(sec_block_step==fat_ser_per_clus[7:0]-1'd1)
							begin
								sec_block_step<=0;
								get_filedata_state<=get_filedata_next_clu;//下个簇号表
							end
						else
							begin
								sec_block_step<=sec_block_step+1'd1;
								get_filedata_state<=get_filedata_sec;
								fat_filedata_address<=fat_filedata_address+1'd1;
							end
					end
				else
					begin
						if(filedata_last_size!=0)//如果小于1个簇
							begin
								fat_filedata_address<=fat_filedata_address+1'd1;//新地址加1开始
								get_filedata_state<=get_filedata_sec;
								sec_block_step<=sec_block_step+1'd1;//扇区地址增加								
							end
						else
							begin
								get_filedata_state<=get_filedata_over	;
								get_filedata_overflag<=1'b1;
								fat_filedata_dataen<=1'b0;//停止写出
								fat_filedata_address<=0;
							end
					end
			end
		get_filedata_next_clu://从FAT得到下个簇号
			begin
				if(get_fat_table_overflag==1'b1)
					begin
						get_fat_table_req<=1'b0;
						filedata_last_size<={{filedata_last_size[31:9]
															-fat_ser_per_clus[7:0]},filedata_last_size[7:0]};
						filedata_clu_address<=filedata_clu_new_address;
						get_filedata_state<=get_filedata_sec	;//读取下一个扇区值
					end
				else
					begin
						get_fat_table_req<=1'b1;
					end
			end
		get_filedata_over:
			begin
				get_filedata_overflag<=1'b0;
				sec_block_step<=0;
				get_filedata_state<=get_filedata_idle;
			end
	endcase
end

//得到FAT表

//IN filedata_clu_address[15:0]
//IN  get_fat_table_req
//OUT	filedata_clu_new_address[15:0]
//OUT get_fat_table_overflag
parameter	get_fat_table_idle=3'd0;
parameter	get_fat_table_get_sec=3'd1;
parameter	get_fat_get_sec_judge=3'd2;
parameter	get_fat_table_get_block=3'd3;
parameter	get_fat_table_wait_dataready=3'd4;
parameter	get_fat_fat_read=3'd5;
parameter	get_fat_judge=3'd6;
parameter	get_fat_over=3'd7;
reg[2:0]	get_fat_table_state;
reg[15:0]	fat_sec_block;
reg[15:0]	fat_sec_next_block;
reg[8:0]	fat_sec_byte_position;
reg	fat_table_rden;
reg[8:0]	fat_table_rdaddress;
reg[15:0]	next_sec_address;
reg[1:0]	fat_read_counter;
reg[15:0]	sd_fat_table_out_blockaddress;
reg	sd_fat_table_ram_out_req;


reg	sd_ram_out_req;
reg[31:0]	sd_ram_out_blockaddress;

always @(*)
case({get_param_req,get_filedir_req,get_filedata_req,get_fat_table_req})
	4'b1000:
		begin
			sd_ram_out_req=sd_param_ram_out_req;
			sd_ram_out_blockaddress=sd_param_ram_out_blockaddress;
		end
	4'b0100:
		begin
			sd_ram_out_req=sd_filedir_ram_out_req;
			sd_ram_out_blockaddress=sd_filedir_ram_out_blockaddress;		
		end
	4'b0010:
		begin
			sd_ram_out_req=sd_filedata_ram_out_req;
			sd_ram_out_blockaddress=sd_filedata_ram_out_blockaddress;
		end
	4'b0001:
		begin
			sd_ram_out_req=sd_fat_table_ram_out_req;
			sd_ram_out_blockaddress=sd_fat_table_out_blockaddress;
			end
	default:
		begin
			sd_ram_out_req=0;
			sd_ram_out_blockaddress=0;				
		end
endcase

always @(posedge	sys_clk)
begin
	case(get_fat_table_state)
		get_fat_table_idle:
			begin
				if(get_fat_table_req)
					get_fat_table_state<=get_fat_table_get_sec;
			end
		get_fat_table_get_sec://得到FAT扇区地址，具体在哪个字节上
			begin
				fat_sec_block<=(filedata_clu_address[15:8]+fat_rsvd_sec_cnt);
				/*{filedata_clu_address[15:0],1'b0} >> 9; */
				fat_sec_byte_position<={ filedata_clu_address[7:0],1'b0};
				/* {filedata_clu_address[15:0],1'b0} << 9 out the shift bit [8:0] */
				get_fat_table_state<=get_fat_get_sec_judge;
			end
		get_fat_get_sec_judge://是否刷新新FAT扇区
			begin
				if(fat_sec_block!=fat_sec_next_block)//新的扇区
					begin
						get_fat_table_state<=get_fat_table_get_block;
					end
				else
					begin
						get_fat_table_state<=get_fat_fat_read;
					end
			end
		get_fat_table_get_block://得到特定扇区的内容
			begin
				if(sd_read_req_overflag==1'b1)
					begin
						sd_fat_table_ram_out_req<=1'b0;
						get_fat_table_state<=get_fat_fat_read;
						fat_table_sel<=0;//取消选择fat表
					end
				else
					begin
						sd_fat_table_out_blockaddress<=fat_sec_block;
						sd_fat_table_ram_out_req<=1'b1;
						fat_table_sel<=1;//选择fat表
					end
			end
		get_fat_fat_read://读取FAT表
			begin
				case(fat_read_counter)
					0:
						begin
							fat_read_counter<=1;
							fat_table_rden<=1'b1;//FAT表缓冲读取
							fat_table_rdaddress<=fat_sec_byte_position;//FAT表缓冲地址低字节						
						end
					1:
						begin
							fat_read_counter<=2;
							fat_table_rdaddress<=fat_sec_byte_position+1'd1;//FAT表缓冲地址高字节								
						end
					2:
						begin
							fat_table_rden<=1'b0;
							fat_read_counter<=3;
							fat_table_rdaddress<=0;
							fat_table_rden<=1'b0;
							next_sec_address[7:0]<=fat_table_rddata;
						end
					3:
						begin
							fat_read_counter<=0;
							next_sec_address[15:8]<=fat_table_rddata;
							get_fat_table_state<=get_fat_judge;
						end
				endcase
			end
		get_fat_judge://对FAT表簇号判断
			begin
				get_fat_table_state<=get_fat_over;
				get_fat_table_overflag<=1'b1;
				fat_sec_next_block<=fat_sec_block;
				if((next_sec_address<16'hfff0)&&(next_sec_address>16'h0001))
					begin
						filedata_clu_new_address<=next_sec_address;
					end
				else
					filedata_clu_new_address<=16'h0;
			end
		get_fat_over:
			begin
				get_fat_table_overflag<=1'b0;
				get_fat_table_state<=get_fat_table_idle;
			end
	endcase
end

//in sd_ram_out_req;
//in sd_ram_out_blockaddress
//out sd_read_req_overflag
parameter	sd_read_req_idle=2'd0;
parameter	sd_read_req_send_req=2'd1;
parameter	sd_read_req_wait_over=2'd2;
parameter	sd_read_req_over=2'd3;
reg[1:0]	send_sd_read_req_state;
reg[1:0]	sd_read_req_counter;
reg	sd_ram_req;
reg[31:0]	sd_ram_blockaddress;

always @(posedge	sys_clk)
begin
	case(send_sd_read_req_state)
		sd_read_req_idle:
			begin
				if(sd_ram_out_req==1'b1)
					send_sd_read_req_state<=sd_read_req_send_req;
			end
		sd_read_req_send_req:
			begin
				case(sd_read_req_counter)
					0:
						begin
							sd_read_req_counter<=1;
							sd_ram_req<=1'b1;
							sd_ram_blockaddress<=sd_ram_out_blockaddress;
						end
					1:
						begin
							sd_read_req_counter<=2;
							sd_ram_req<=1'b0;
						end
					2:
						begin
							sd_read_req_counter<=3;					
						end
					3:
						begin
							sd_read_req_counter<=0;
							send_sd_read_req_state<=sd_read_req_wait_over;
						end
				endcase
			end
		sd_read_req_wait_over:
			begin
				if(sd_idle_flag==1'b1)
					begin
						send_sd_read_req_state<=sd_read_req_over;
						sd_read_req_overflag<=1'b1;
					end
			end
		sd_read_req_over:
			begin
				send_sd_read_req_state<=sd_read_req_idle;
				sd_read_req_overflag<=1'b0;
			end
	endcase
end


reg	sd_ram_rden;
reg[8:0]	sd_ram_rdaddress;

always @(*)
begin
	case({get_param_req,get_filedir_req,get_filedata_req})
		3'b100:
			begin
				sd_ram_rden=sd_param_ram_rden;
				sd_ram_rdaddress=sd_param_ram_rdaddress;
			end
		3'b010:
			begin
				sd_ram_rden=sd_filedir_ram_rden;
				sd_ram_rdaddress=sd_filedir_ram_rdaddress;				
			end
		3'b001:
			begin
				sd_ram_rden=sd_filedata_ram_rden;
				sd_ram_rdaddress=sd_filedata_ram_rdaddress;
			end
		default:
			begin
				sd_ram_rden=0;
				sd_ram_rdaddress=0;
			end
	endcase
end

//modelsim test initial
initial	
begin
	file_state<=0;
	file_error<=0;
	

	get_param_overflag<=0;
	get_param_error<=0;
	get_filedir_overflag<=0;
	param_error_code<=0;
	get_filedata_overflag<=0;

	get_param_state<=0;
	param_read_counter<=0;

	sd_ram_blockaddress<=0;
	sd_ram_req<=0;
	fat_table_sel<=0;

	sd_ram_rden=0;
	sd_ram_rdaddress=0;
	fat_bytes_per_sec=0;
	fat_ser_per_clus=0;
	fat_rsvd_sec_cnt=0;
	fat_root_ent_cont=0;
	fat_fat_size=0;

	get_filedir_state=0;
	read_dir_counter=0;

	sd_ram_address_step=0;
	filename_table_counter=0;
	
	fat_dirout_ram_wr=0;
	fat_dirout_ram_wrdata=0;
	fat_dirout_ram_wraddress=0;
	next_dirblock=0;
	
	
	get_filedata_state=0;
	filedata_last_size=0;
	filedata_clu_address=0;
	filedata_sec_block=0;
	begin_fatout_counter=0;
	fat_filedata_address=0;
	fat_filedata_dataen=0;
	fat_filedata_data=0;
	address_counter=0;
	sec_block_step=0;

	
	filedata_clu_new_address=0;
	get_fat_table_overflag=0;


	get_fat_table_state=0;
	fat_sec_block=0;
	fat_sec_next_block=0;
	fat_sec_byte_position=0;
	fat_table_rden=0;
	fat_table_rdaddress=0;
	next_sec_address=0;
	fat_read_counter=0;
	
	sd_ram_out_req=0;
	sd_ram_out_blockaddress=0;

	sd_param_ram_out_req=0;
	sd_param_ram_out_blockaddress=0;
	
	sd_filedir_ram_out_req=0;
	sd_filedir_ram_out_blockaddress=0;		
			
	sd_filedata_ram_out_req=0;
	sd_filedata_ram_out_blockaddress=0;

	sd_fat_table_ram_out_req=0;
	sd_fat_table_out_blockaddress=0;
	
	
	sd_ram_rden=0;
	sd_ram_rdaddress=0;

	sd_param_ram_rden=0;
	sd_param_ram_rdaddress=0;

	sd_filedir_ram_rden=0;
	sd_filedir_ram_rdaddress=0;			

	sd_filedata_ram_rden=0;
	sd_filedata_ram_rdaddress=0;
	
	
	fat_dirout_temp_ram_wr=0;
	fat_dirout_temp_ram_wrdata=0;
	fat_dirout_temp_ram_wraddress=0;

	fat_dirout_temp_ram_rden=0;
	fat_dirout_temp_ram_rdaddress=0;	

	
	get_param_req=0;

	get_filedir_req=0;

	get_filedata_req=0;

	fat_read_file_select_reg=0;

	sd_read_req_overflag=0;

	get_first_param_counter	=0;
	
	get_fat_table_req=0;
	
	send_sd_read_req_state=0;
	sd_read_req_counter=0;
end
	

endmodule
