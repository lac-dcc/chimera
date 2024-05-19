// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

module ram_rw_control
(
	input 	wire			clk_25m,		//外部输入25MHz时钟信号
	input 	wire			sys_rst_n,		//外部输入复位信号，低电平有效
	input 	wire			rx_int,		
	input	wire	[7:0]	rx_data,
	output	wire			ram_rw_ce,
	output 	wire	[7:0]	ram_output,
	output	wire			led			
);

//-------------------------------------
//接收数据完毕标志位
reg		rx_int0,rx_int1,rx_int2;			//rx_int信号寄存器，捕捉沿滤波用
wire	neg_rx_int;							//rx_int下降沿标志位
//-------------------------------------
//Double RAM 
reg 	[7:0]	ram_input;
reg 	[7:0]	ram_wr_addr, ram_re_addr;
reg 			ram_rw_ce_r;  				//RAM读写使能，0-->写，1--读
reg 			LED_FLAG;

//-------------------------------------
//接收数据完毕标志位
//-------------------------------------
always @ (posedge clk_25m or negedge sys_rst_n)
begin 
	if(!sys_rst_n) 
	begin
		rx_int0 <= 1'b0;
		rx_int1 <= 1'b0;
		rx_int2 <= 1'b0;
	end
	else 
	begin
		rx_int0 <= rx_int;
		rx_int1 <= rx_int0;
		rx_int2 <= rx_int1;
	end
end

assign neg_rx_int =  ~rx_int1 & rx_int2;    //接收到数据期间rx_int始终为高电平,它的下降沿表示数据接收完毕。这里捕捉到下升沿后，neg_rx_int拉高保持一个主时钟周期

//-------------------------------------
//RAM读写时序控制
//-------------------------------------
// Port a
always @(posedge clk_25m or negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin
		ram_wr_addr <= 0;
		ram_input   <= 0;
		LED_FLAG    <= 1;
	end
	else if(ram_wr_addr<255) 
	begin  									//在RAM中写入与其地址对应的256个8bit递增数据
		ram_wr_addr <= ram_wr_addr + 1'b1;
		ram_input   <= ram_input + 1;
	end
	else 
	begin
		ram_wr_addr <= ram_wr_addr;
		ram_input   <= ram_input;
		LED_FLAG    <= 0;
	end
end

// Port b
always @(posedge clk_25m or negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin
		ram_re_addr <= 0;
		ram_rw_ce_r <= 1'b0;
	end
	else if(neg_rx_int) 
	begin 
	    ram_re_addr <= rx_data;  
		ram_rw_ce_r <= 1'b1;
	end
	else 
	begin
	    ram_re_addr <= 0;
		ram_rw_ce_r <= 1'b0;
	end
end

//-------------------------------------
//例化双口RAM核
//-------------------------------------
 Double_RAM_uut uut_Double_RAM
 ( 

	.dob    (ram_output ),
	.dia    (ram_input  ),
	.addra  (ram_wr_addr),
	.addrb  (ram_re_addr),
	.ceb    (ram_rw_ce  ),
	.clka   (clk_25m    ),
	.clkb   (clk_25m    )
);
	
assign led 		 = LED_FLAG; 
assign ram_rw_ce = ram_rw_ce_r; 
	
endmodule

	
