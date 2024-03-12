/************************************************************************************************************************
*	Name		:	此模块用于初始化WM8731,直接使用了初始化摄像头的代码.
*	Author	:	Helrori
*************************************************************************************************************************/
module SCCB_top
(
	input 	init_ov,		//上升沿或下降沿触发一次OV2640初始化
	input		clk,				//50Mhz
	input		rst_n,			//触发一次OV2640初始化
	
	output	SCL,
	output	SDA,
	output	reg OV2640_PWDN,
	output	reg OV2640_RST,
	
	output	reg init_ov_done
);
`define	DELAY 			5//00000			//发送两帧(软复位)后的延时2500000==50ms
`define	NUMBER_TO_SEND	10					//发送个数减一
`define	TA 				50000				//OV_RST硬件复位时间
/**********************************************************************************************************************
*	SCCB通信顶层；用于与ov摄像头的通信配置相关寄存器。DELAY为发送两个数据后必要的的延时。NUMBER_TO_SEND为要写配置寄存器的个数减一
*	TA 为OV2640_RST硬件复位时间。
*	by_helrori_170329
*	Interface		N/A
***********************************************************************************************************************/
SCCB_send SCCB_send
(
	.clk(clk),			//50Mhz
	.rst_n(rst_n),
	.send(send_),
	.address(address_),
	.value(value_),
	
	.SCL(SCL),
	.SDA(SDA),
	
	.busy(busy_),
	.time_counter()

);
wire	[7:0]address_,value_;
wire	busy_;
reg [7:0]addr_;
reg send_;
WM8731_reg WM8731_reg
(	
	.clk(clk),
	.addr(addr_),
	.reg_addr(address_),
	.value(value_)
);

reg buff0,buff1,init_ov_buff;
always @(posedge clk)
begin
	buff0 <= init_ov;
	buff1 <= buff0;
	if(buff0^buff1)				//posedge  or negedge of init_ov
		init_ov_buff <= 1'b1;	//next clk will set send_buff to 1
	else
		init_ov_buff <= 1'b0;
end

reg buff00,buff11,busy_buff;
always @(posedge clk)
begin
	buff00 <= busy_;
	buff11 <= buff00;
	if(buff11&~buff00)		//negedge of busy_
		busy_buff <= 1'b1;	//next clk will set send_buff to 1
	else
		busy_buff <= 1'b0;
end

/*************************************************************************************
*连续 三相写寄存器 状态机
*************************************************************************************/
reg [31:0]time_counter1;
reg [7:0]byte_counter;
reg [2:0]state,next_state;
parameter WAIT = 3'd1,START = 3'd0,WRITE = 3'd2,DONE = 3'd3,POINT0 = 3'd4,POINT1 = 3'd5,POINT2 = 3'd6;
always @(posedge clk or negedge rst_n)
	if(!rst_n)
		state <= START;
	else
		state <= next_state;

always @(*)
	if(!rst_n)
		next_state = START;
	else if(init_ov_buff)
		next_state = START;
	else
		case(state)
			WAIT:	next_state = WAIT;
			START:begin
					if(time_counter1 >= `TA*3)//500000===10ms//50Mhz
						next_state = POINT0;
					else
						next_state = START;
					end
			POINT0:next_state = WRITE;
			WRITE:	begin
						if(byte_counter >= `NUMBER_TO_SEND)
							next_state = DONE;
						else if(byte_counter == 1 && busy_buff == 1)
							next_state = POINT1;
						else
							next_state = WRITE;
						end
			POINT1:	begin	
							if(time_counter1 >= `DELAY)
								next_state = POINT2;
							else
								next_state = POINT1;
						end
			POINT2:next_state = POINT0;
			DONE:next_state = WAIT;
		default:next_state = WAIT;
		endcase

always @(posedge clk or negedge rst_n)
	if(!rst_n)begin
		time_counter1 	<= 32'd0 ;
		send_ 			<= 1'b0;
		byte_counter 	<= 1'b0; 
		init_ov_done 	<= 1'b0;
		OV2640_RST 		<= 1'b1;
		OV2640_PWDN 	<= 0;
		end
	else
		case(next_state)
		WAIT:	begin
				time_counter1 	<= 32'd0 ;
				send_ 			<= 1'b0;
				byte_counter 	<= 1'b0;
				end
		START:begin
					time_counter1 	<= time_counter1 + 1'd1;
					OV2640_PWDN 	<= 0;
					if(time_counter1 >= `TA && time_counter1 < `TA*2)
						OV2640_RST 	<= 0;
					else
						OV2640_RST 	<= 1'b1;
				end
		POINT0:begin	time_counter1 <= 32'd0;send_ <= ~send_;end
		WRITE:	begin
						if(busy_buff)begin
							byte_counter <= byte_counter + 8'd1;addr_ <= addr_ + 8'b1;send_ <= ~send_;
							end
					end
		POINT1:	begin
					time_counter1 <= time_counter1 + 32'b1;
					end
		POINT2:	begin addr_ <= addr_ + 8'b1;byte_counter <= byte_counter + 8'd1;end
		DONE:		init_ov_done <= 1'b1;
		default:;
		endcase
endmodule
