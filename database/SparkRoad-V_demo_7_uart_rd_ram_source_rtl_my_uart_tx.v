/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
module my_uart_tx
(
	input			clk,
	input			rst_n,
	input	[7:0]	rx_data,
	input			rx_int,
	output			uart_tx,
	input			clk_bps,
	output			bps_start
);

//---------------------------------------------------------
reg 	rx_int0,rx_int1,rx_int2;	//rx_int信号寄存器，捕捉下降沿滤波用
wire 	neg_rx_int;					//rx_int下降沿标志位

always @ (posedge clk or negedge rst_n) 
	if(!rst_n) 
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

assign neg_rx_int =  ~rx_int1 & rx_int2;	//捕捉到下降沿后，neg_rx_int拉高保持一个主时钟周期

//---------------------------------------------------------
reg	[7:0] 	tx_data;		//待发送数据的寄存器
reg 		bps_start_r;
reg 		tx_en;			//发送数据使能信号，高有效
reg	[3:0] 	num;

always @ (posedge clk or negedge rst_n) 
	if(!rst_n) 
    begin
		bps_start_r <= 1'bz;
		tx_en 		<= 1'b0;
		tx_data 	<= 8'd0;
	end
	else if(neg_rx_int) 
    begin		                    //接收数据完毕，准备把接收到的数据发回去
		bps_start_r <= 1'b1;
		tx_data 	<= rx_data;		//把接收到的数据存入发送数据寄存器
		tx_en 		<= 1'b1;		//进入发送数据状态中
	end
	else if(num == 4'd10) 
    begin		                    //数据发送完成，复位
		bps_start_r <= 1'b0;
		tx_en		<= 1'b0;
	end

assign bps_start = bps_start_r;

//---------------------------------------------------------
reg uart_tx_r;

always @ (posedge clk or negedge rst_n)
	if(!rst_n) 
    begin
		num 		<= 4'd0;
		uart_tx_r 	<= 1'b1;
	end
	else if(tx_en) 
    begin
		if(clk_bps)	
        begin
			num <= num+1'b1;
			case (num)
				4'd0: uart_tx_r <= 1'b0; 		//发送起始位
				4'd1: uart_tx_r <= tx_data[0];	//发送bit0
				4'd2: uart_tx_r <= tx_data[1];	//发送bit1
				4'd3: uart_tx_r <= tx_data[2];	//发送bit2
				4'd4: uart_tx_r <= tx_data[3];	//发送bit3
				4'd5: uart_tx_r <= tx_data[4];	//发送bit4
				4'd6: uart_tx_r <= tx_data[5];	//发送bit5
				4'd7: uart_tx_r <= tx_data[6];	//发送bit6
				4'd8: uart_tx_r <= tx_data[7];	//发送bit7
				4'd9: uart_tx_r <= 1'b1;		//发送结束位
			 	default: uart_tx_r <= 1'b1;
			endcase
		end
		else if(num == 4'd10)
                num <= 4'd0;		//复位
	end

assign uart_tx = uart_tx_r;

endmodule


