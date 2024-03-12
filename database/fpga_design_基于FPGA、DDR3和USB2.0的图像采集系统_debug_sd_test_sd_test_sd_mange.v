//filename:sd_mange_ram.v
//Create:2011-10-12 11am
//author:lichenlin
//comit:管理SD卡RAM输出，一个用于FAT查找的FAT表，
//另一个是文件内容，目录的SD_RAM
//以及文件目录管理单元
module	sd_mange_ram(
	sys_clk,
	
	sd_outdata_en,
	sd_outdata,
	sd_outdata_num,
	
	sd_ram_rden,
	sd_ram_rdaddress,
	sd_ram_rddata,
	
	fat_table_rden,
	fat_table_rdaddress,
	fat_table_rddata,
	fat_table_sel,

	fat_dirout_ram_wr,
	fat_dirout_ram_wrdata,
	fat_dirout_ram_wraddress,		
	
	fat_dirout_temp_ram_wr,
	fat_dirout_temp_ram_wrdata,
	fat_dirout_temp_ram_wraddress,
	
	fat_dirout_temp_ram_rden,
	fat_dirout_temp_ram_rddata,
	fat_dirout_temp_ram_rdaddress	
);
input sys_clk;

input	sd_outdata_en;//数据有效
input[7:0]	sd_outdata;//数据输出
input[8:0]	sd_outdata_num;//数据输出计数器

input	sd_ram_rden;//SD输出缓存中有效读信号
input[8:0]	sd_ram_rdaddress;//SD输出缓存地址
output[7:0]	sd_ram_rddata;//SD输出缓存中数据

input	fat_table_rden;//FAT表缓冲读取
input[8:0]	fat_table_rdaddress;//FAT表缓冲地址
output[7:0]	fat_table_rddata;//FAT表缓冲数据
input	fat_table_sel;//FAT表输出选择

reg	fat_table_wren;
reg[8:0]	fat_table_wrdaddress;
reg[7:0]	fat_table_wrddata;

reg	sd_ram_wren;//SD输出缓存中有效读信号
reg[8:0]	sd_ram_wrdaddress;//SD输出缓存地址
reg[7:0]	sd_ram_wrddata;//SD输出缓存中数据

input	fat_dirout_ram_wr;
input[7:0]	fat_dirout_ram_wrdata;
input[7:0]	fat_dirout_ram_wraddress;

output	fat_dirout_temp_ram_wr;
output[7:0]	fat_dirout_temp_ram_wrdata;
output[7:0]	fat_dirout_temp_ram_wraddress;

input	fat_dirout_temp_ram_rden;
output[7:0]	fat_dirout_temp_ram_rddata;
input[7:0]	fat_dirout_temp_ram_rdaddress;

always@(*)
begin
	if(fat_table_sel==1'b1)
		begin
			fat_table_wren=sd_outdata_en;
			fat_table_wrdaddress=sd_outdata_num;
			fat_table_wrddata=sd_outdata;

			sd_ram_wren=1'b0;//SD输出缓存中有效读信号
			sd_ram_wrdaddress=0;//SD输出缓存地址
			sd_ram_wrddata=0;//SD输出缓存中数据a
		end
	else
		begin
			fat_table_wren=1'b0;
			fat_table_wrdaddress=0;
			fat_table_wrddata=0;

			sd_ram_wren=sd_outdata_en;//SD输出缓存中有效读信号
			sd_ram_wrdaddress=sd_outdata_num;//SD输出缓存地址
			sd_ram_wrddata=sd_outdata;//SD输出缓存中数据a			
		end	
end

sd_ram sd_ram_1(
	.clock(sys_clk),
	.data(sd_ram_wrddata),
	.rdaddress(sd_ram_rdaddress),
	.rden(sd_ram_rden),
	.wraddress(sd_ram_wrdaddress),
	.wren(sd_ram_wren),
	.q(sd_ram_rddata));

sd_ram fat_table_ram_1(
	.clock(sys_clk),
	.data(fat_table_wrddata),
	.rdaddress(fat_table_rdaddress),
	.rden(fat_table_rden),
	.wraddress(fat_table_wrdaddress),
	.wren(fat_table_wren),
	.q(fat_table_rddata));
	
fat_dir_ram fat_dir_ram1(
	.clock(sys_clk),
	.data(fat_dirout_temp_ram_wrdata),
	.rdaddress(fat_dirout_temp_ram_rdaddress),
	.rden(fat_dirout_temp_ram_rden),
	.wraddress(fat_dirout_temp_ram_wraddress),
	.wren(fat_dirout_temp_ram_wr),
	.q(fat_dirout_temp_ram_rddata));
	
endmodule
	