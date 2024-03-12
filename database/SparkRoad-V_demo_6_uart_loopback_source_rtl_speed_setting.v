module speed_setting
#(
    parameter BPS_SET      =   96,  //波特率
    parameter CLK_PERIORD  =   40   //时钟周期40ns(25MHz)
)
(
	input	clk,		//25MHz主时钟
	input	rst_n,		//低电平复位信号
	input	bps_start,	//接收到数据后，波特率时钟启动信号置位
	output	clk_bps		//clk_bps的高电平为接收或者发送数据位的中间采样点
);

`define BPS_PARA	(10_000_000/CLK_PERIORD/BPS_SET)	//10_000_000/`CLK_PERIORD/96;
`define BPS_PARA_2	(`BPS_PARA/2)						//BPS_PARA/2;	

reg	[12:0] cnt;		    //分频计数
reg clk_bps_r;	        //波特率时钟寄存器
reg	[2:0] uart_ctrl;	//uart波特率选择寄存器

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        cnt <= 13'd0;
	else if((cnt == `BPS_PARA) || !bps_start)
        cnt <= 13'd0;	    //波特率计数清零
	else
        cnt <= cnt + 1'b1;  //波特率时钟计数启动
end

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
        clk_bps_r <= 1'b0;
	else if(cnt == `BPS_PARA_2)
        clk_bps_r <= 1'b1;			//clk_bps_r高电平为接收数据位的中间采样点,同时也作为发送数据的数据改变点
	else
        clk_bps_r <= 1'b0;
end

assign clk_bps = clk_bps_r;

endmodule

