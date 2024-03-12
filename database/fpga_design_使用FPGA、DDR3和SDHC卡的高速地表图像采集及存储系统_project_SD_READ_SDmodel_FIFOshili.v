///////////////////////////////FIFO_IP_core实例化:16转4（适用于SD卡模式）
reg full;
reg empty;
reg wr_en;
reg rd_en;
reg [3:0] COMS_SD_4;

always@(posedge usb_clk or posedge SD_clk)
begin
	if(reset_n)
	begin
		wr_en<=1'b0;
		rd_en<=1'b0;
		full<=1'b0;
		empty<=1'b0;
		USB_DATA<=16'h0000;
		CMOS_SD_4<=4'b0000;
	end
	else
	begin
		if()
	end	
	
end


USB_SD USB_SD_inst(
	.RST(reset_n),
	.WR_CLK(usb_clk),
	.DIN(USB_DATA),
	.WR_EN(wr_en),
	.FULL(full),
	.RD_CLK(SD_clk),
	.DOUT(COMS_SD_4),
	.RD_EN(rd_en),
	.EMPTY(empty)
	
);
