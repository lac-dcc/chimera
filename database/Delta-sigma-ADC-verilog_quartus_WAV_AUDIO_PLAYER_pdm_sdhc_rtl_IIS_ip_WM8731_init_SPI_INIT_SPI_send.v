/***************************************************
*	Name		: 	SPI_send  
*	Origin		:	171003
*	Important	:	Only for wm8731 
*	Author		:	Helrori
****************************************************/
module SPI_send
(
	input		clk_50M,		//50M
	input		rst_n,
	input		ENABLE,
	input		[15:0]DATA,
	
	output	reg CSB,
	output	SCLK,
	output	SDIN,
	output	DONE
);
reg [12:0]Divide_Cnt;
reg [3:0]Sel_Cnt;
reg clk_10K;
assign	SCLK = (ENABLE)?clk_10K:0;
assign	SDIN = (ENABLE)?DATA[~Sel_Cnt]:0;
assign	DONE = CSB;
always@(posedge clk_50M or negedge rst_n)
begin
	if(!rst_n)
		CSB <= 1;
	else if(Sel_Cnt == 15 && ENABLE)
		CSB <= 0;
	else
		CSB <= 1;
end
always@(posedge clk_50M or negedge rst_n)
begin
	if(!rst_n)
		Divide_Cnt <= 13'd0;
	else if(Divide_Cnt > 5000/2-1 && ENABLE)//10k
	begin
		Divide_Cnt 	<= 13'd0;
		clk_10K		<= ~clk_10K;
	end
	else if(ENABLE)
		Divide_Cnt <= Divide_Cnt + 13'd1;		
end
always@(negedge clk_10K or negedge rst_n)
begin
	if(!rst_n)
		Sel_Cnt <= 4'd0;
	else
		Sel_Cnt <= Sel_Cnt + 4'd1;
end

endmodule
