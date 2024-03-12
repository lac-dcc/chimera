/************************************************************************
*	Name:			16bit IIS Driver
*  Diagram:		 					   __________
*								rst_n ->|u	 		o|<- IIS_BCLK
*						  Write_Clk ->|s  ____	u|<- IIS_DACLRC
*					       Data_In =>|e-|fifo|-t|-> IIS_DACDAT
*					  Write_Enable ->|r |512 |  |<- IIS_ADCLRC(not use)
*					   Write_Allow <-|  |32b |	 |<- IIS_ADCDAT(not use)
*
*	Important:	when Write_Allow==1 that mean :
*					we can set Write_Enable and write data to fifo by Write_Clk.
*					IIS set mode for:Master,DSP模式且为首bit空模式
*					写入FIFO 的PCM数据支持:16bit*2*(采样率由Master设备决定),48k以上未测. 
*					[31:0]Data_In格式:	{16'L,16'R},高16bit为Left.
*					Write_Clk > IIS_DACLRC,IIS_DACLRC频率即为采样率
*					Only used DAC yet. 
*	Interface:	N/A
*	Origin:		171002
*	Author:		Helrori2011@gmail.com
*************************************************************************/
module IIS_driver_top
#(
	parameter DATA_WIDTH = 16//修改此数的同时也要手动修改FIFO宽度
)
(
	input				rst_n,
	input				Write_Clk,		//IIS运作状态机参考时钟以及FIFO写时钟
	input		[DATA_WIDTH*2-1:0]Data_In,			//16bit*2,{L,R},24bit and 32bit 向高位对齐
	input				Write_Enable,	//when Write_Allow==1 that mean we can set Write_Enable and write data to fifo by Write_Clk.
	
	input				IIS_BCLK,
	input				IIS_DACLRC,
	input				IIS_ADCLRC,				//not use
	input				IIS_ADCDAT,				//not use
	output			IIS_DACDAT,
	output	reg	Write_Allow,
	output			[8:0]wrusedw
);
reg IIS_DACLRC_Delay_1_IIS_BCLK;
reg [1:0]CTRL_STATE;
reg [5:0]Sel_Cnt;
wire [DATA_WIDTH*2-1:0]q;
//wire[9:0]wrusedw;
reg IIS_DACDAT_OUT_EN;
reg [7:0]cnt;
initial
begin
	CTRL_STATE = 2'd0;
	cnt		  = 8'd0;
	IIS_DACDAT_OUT_EN = 1;
end
fifo fifo_U1(//512*32bit{L,R}
	.aclr(~rst_n),
	.data(Data_In),
	.rdclk(IIS_DACLRC),
	.rdreq(1),				//输出连续
	.wrclk(Write_Clk),
	.wrreq(Write_Enable),
	.q(q),
	.rdempty(),
	.wrusedw(wrusedw));
/********************************************************************
*	input logic,小于一半连续写满 状态机
*********************************************************************/
always@(negedge Write_Clk or negedge rst_n)
begin
	if(!rst_n)
		CTRL_STATE <= 2'd0;
	else
	begin
		case(CTRL_STATE)
		4'd0:begin//UNKNOW
				if(wrusedw[8] == 0)
					CTRL_STATE <= 2'd1;//fifo data less than half
				else
					CTRL_STATE <= 2'd2;//fifo data more than half
				Write_Allow <= 0;
		end
		4'd1:begin//LESS_HALF_WRITE_OVER
				if(wrusedw == 512-4)//######该数至少要比满数小4
						CTRL_STATE <= 2'd2;
				else
						CTRL_STATE <= 2'd1;	
				Write_Allow <= 1;
		end
		4'd2:begin//MORE_HALF
				if(wrusedw[8] == 0)
					CTRL_STATE <= 2'd1;//fifo data less than half
				else
					CTRL_STATE <= 2'd2;//fifo data more than half
				Write_Allow <= 0;
		end
		default:CTRL_STATE <= 2'd0;
		endcase
	end
end
/********************************************************************
*	output logic,以下为对应 DSP模式首bit空模式
*********************************************************************/
assign IIS_DACDAT= (IIS_DACDAT_OUT_EN)?q[DATA_WIDTH*2-1-Sel_Cnt]:1'd0;//高位先
always@(posedge IIS_BCLK)
	IIS_DACLRC_Delay_1_IIS_BCLK <= IIS_DACLRC;
always@(negedge IIS_BCLK or negedge rst_n)
begin
	if(!rst_n)
		Sel_Cnt <= 6'd0;
	else if(IIS_DACLRC_Delay_1_IIS_BCLK == 1)//在DSP模式首空bit处（DSP模式设置成首bit空模式），及时清零帧内计数器
		Sel_Cnt <= 6'd0;
	else	
		Sel_Cnt <= Sel_Cnt + 6'd1;
end
always@(negedge IIS_BCLK or negedge rst_n)
begin
	if(~rst_n)begin
		IIS_DACDAT_OUT_EN <= 1;
		cnt					<= 7'd0;
	end
	else if(IIS_DACLRC_Delay_1_IIS_BCLK == 1)
	begin
		cnt <= 7'd0;
		IIS_DACDAT_OUT_EN <= 1;
	end
	else if(cnt == DATA_WIDTH*2-1)
	begin
		cnt <= 7'd0;
		IIS_DACDAT_OUT_EN <= 0;
	end
	else
	begin
		cnt <= cnt + 7'd1;
		IIS_DACDAT_OUT_EN <= IIS_DACDAT_OUT_EN;
	end
end
/********************************************************************
*	output logic2,以下为对应 IIS模式 没完成
*********************************************************************/
//reg buff0,buff1,IIS_DACLRC_;
//always@(posedge IIS_BCLK or negedge rst_n)
//begin
//	if(!rst_n)
//	begin
//		buff0 <= 0;
//		buff1 <= 0;
//	end
//	else
//	begin
//		buff0 <= IIS_DACLRC;
//		buff1 <= buff0;
//		if(buff0&~buff1)//buff0==0&&buff1==1;negedge of IIS_DACLRC
//			IIS_DACLRC_ <= 1;
//		else
//			IIS_DACLRC_ <= 0;
//	end
//end
endmodule
