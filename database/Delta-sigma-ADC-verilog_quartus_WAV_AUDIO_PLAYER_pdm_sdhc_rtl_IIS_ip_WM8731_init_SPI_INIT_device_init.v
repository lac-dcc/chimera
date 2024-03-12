/***************************************************
*	Name: 	WM8731 init
*	Origin:	171003
*	Author:	Helrori
*	Important:	
				USE SPI Mode to init device,so we should
				set pin: mode to High.wm8731 master dsp mode
****************************************************/
module device_init
(
	input		clk_50M,		//50M
	input		rst_n,		//触发一次初始化
	input		init_device,//not use
	
	output	CSB,
	output	SCLK,
	output	SDIN,
	output	reg ALL_DONE
);
wire [15:0]DATA;
reg [3:0]addr;
wire DONE;
reg ENABLE;
always@(posedge DONE or negedge rst_n)
begin
	if(!rst_n)
	begin
		addr<=4'd0;
		ALL_DONE <= 0;
		ENABLE <= 1;
	end
	else if(addr == 11-1)
	begin
		ALL_DONE <= 1;
		ENABLE <= 0;
		addr<=4'd0;
	end
	else
		addr<=addr + 4'd1;		
end
SPI_send SPI_send_U1
(
	.clk_50M(clk_50M),		//50M
	.rst_n(rst_n),
	.ENABLE(ENABLE),
	.DATA(DATA),
	
	.CSB(CSB),
	.SCLK(SCLK),
	.SDIN(SDIN),
	.DONE(DONE)
);
device_init_reg device_init_reg_U1
(
   .addr(addr),
   .DATA(DATA)
);
endmodule
