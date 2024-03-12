module SCCB_send
(
	input 	clk,					//50Mhz
	input		rst_n,
	input		send,					//always at posedge or negedge send !!
	input		[7:0]address,
	input		[7:0]value,
	
	output	reg SCL,
	output	reg SDA,
	
	output	reg busy,
//	output	reg send_buff,
	output	reg [15:0]time_counter
	
);
/*************************************************************************************
*实现SCCB三相写。即写三个字节，忽略ACK回应。周期100us(10KHZ)
*************************************************************************************/
parameter	[7:0]DEVICE_ID = 8'h34; //器件地址
reg  	[26:0]DATA_3_BYTE;
reg buff0,buff1, send_buff;
always @(posedge clk)
begin
	if(!rst_n)begin
		buff0 <= 1'b0;
		buff1 <= 1'b0;
	end
	else begin
	buff0 <= send;
	buff1 <= buff0;
	end
	if(buff0^buff1)				//posedge or negedge of send
		send_buff <= 1'b1;		//next clk will set send_buff to 1
	else
		send_buff <= 1'b0;
end
/*************************************************************************************
*三相写状态机
*************************************************************************************/
parameter	WAIT = 4'd0,START = 4'd1,WRITE_BYTE = 4'd2,ACK = 4'd3,STOP = 4'd4;//,DELAY = 4'd5,;
reg [3:0]state,next_state;
reg [6:0]bit_counter;
reg [3:0]byte_counter;
always @(posedge clk or negedge rst_n) //同步转移
begin
	if(!rst_n)
		state <= WAIT;
	else
		state <= next_state;
end
always @(*) 									//组合逻辑
begin
	if(!rst_n)
		next_state = WAIT;
	else if(send_buff)
		next_state = START;
	else
	case(state)
		WAIT:			begin
						next_state = WAIT;
						end
		START:		begin
						if(time_counter >= 1250*4)
							begin
							next_state = WRITE_BYTE;
							end
						else
							next_state = START;
						end
		WRITE_BYTE:	begin
						if(bit_counter >= 27)
							next_state = ACK;
						else
							next_state = WRITE_BYTE;
						end
		ACK:			begin
						next_state = STOP;
						end
		STOP:			begin
						if(time_counter > 0)
							next_state = STOP;
						else
							next_state = WAIT;

						end
	default:next_state = WAIT;
	endcase
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		SCL <= 1'b1;
		//SDA_out <= 1'b1;
		bit_counter 	<= 7'b0;
		SDA <= 1'b1;
		time_counter <= 16'd0;
		busy <= 1'b0;
	end
	else 
		case(next_state)
			WAIT:				begin
								time_counter 		<= 16'b0;
								SCL 				<= 1'b1;
								//SDA_out 			<= 1'b1;
								SDA 				<= 1'b1;
								//output_en 		<= 1'b1;
								bit_counter 		<= 7'b0;
								busy 				<= 1'b0;
								end
			START:			begin
								DATA_3_BYTE <= {DEVICE_ID,1'b0,address,1'b0,value,1'b0}; //ACK回应期间置0;
								time_counter <= time_counter + 1'b1;
								busy <= 1'b1;
								//output_en <= 1'b1;
								if(time_counter >= 1250*2)
									begin
										//SDA_out <= 1'b0;
										SDA <= 1'b0;
										if(time_counter >= 1250*3)
											SCL <= 1'b0;
										else
											SCL <= 1'b1;
									end
								else	
									//SDA_out <= 1'b1;
									SDA <= 1'b1;
								end
			WRITE_BYTE:		begin
								time_counter 	<= time_counter - 1'b1;
								//SDA_out 			<= DATA_3_BYTE[bit_counter];
								SDA <= DATA_3_BYTE[26 - bit_counter];
								if(time_counter == 0)begin
									time_counter 	<= 5000;
									bit_counter		<= bit_counter + 1'b1;
								end
								if(time_counter <= 5000-1250 && time_counter >= 5000-1250*3)
									SCL <= 1'b1;
								else
									SCL <= 1'b0;
								end	
			ACK:				begin
//								time_counter 	<= time_counter - 1'b1;
//								output_en <= 1'b0;
//								if(time_counter <= 5000-1250 && time_counter >= 5000-1250*3)
//									SCL <= 1'b1;
//								else
//									SCL <= 1'b0;
//
								end
			STOP:				begin
								time_counter <= time_counter - 1'b1;
								if(time_counter <= 5000-1250 )
									SCL <= 1'b1;
								if(time_counter <= 5000-1250*2)
									SDA <= 1'b1;
								end
					
			
			default:;
		endcase 
end
endmodule
