// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

/*************************************************************************
* 作者：吴文强
* 日期：2019/06/10
* 说明：uart_tx.v 起始位1bit,数据位8bit,停止位2bit.
* 联系：xqandwn@sina.com
**************************************************************************/

module uart_tx
#(
	parameter BAUDRATE = 115200,
	parameter CLK_RATE = 50000000
)
(
    input	wire		clk,
	
	// uart
    output  reg			tx,
	
	// data
    input	wire		tx_en,
    input	wire [7:0]	tx_data,
	output	reg			tx_ready
);

reg start;
reg clk_en;
reg [3:0] cnt;
reg [7:0] data;
reg [31:0] clk_cnt;


// 波特率计数器
always@(posedge clk)
begin
	if(!start)
		clk_cnt <= 0;
	else if(clk_cnt == CLK_RATE / BAUDRATE - 1)
		clk_cnt <= 0;
	else
		clk_cnt <= clk_cnt + 1;
end

// 波特率计数器
always@(posedge clk)
begin
	clk_en <= (clk_cnt == CLK_RATE / BAUDRATE - 1);
end

// 数据传输控制
always@(posedge clk)
begin
    if(tx_en) // 传输开始
        start <= 1;
    else if(cnt == 10) // 传输结束
        start <= 0;
end

// 数据寄存
always@(posedge clk)
begin
	if(tx_en && !start)
		data <= tx_data;
end

// 状态计数器
always@(posedge clk)
begin
    if(!start)
		cnt <= 0;
	else if(clk_en)
        cnt <= cnt + 1;
end

// 串口发送
always@(posedge clk)
begin
    case(cnt)
		0: tx <= 1'b1;    // 发送停止位(上电状态).
        1: tx <= 1'b0;    // 传输开始
        2: tx <= data[0]; // 发送数据第1位
        3: tx <= data[1]; // 发送数据第2位
        4: tx <= data[2]; // 发送数据第3位
        5: tx <= data[3]; // 发送数据第4位
        6: tx <= data[4]; // 发送数据第5位
        7: tx <= data[5]; // 发送数据第6位
        8: tx <= data[6]; // 发送数据第7位
        9: tx <= data[7]; // 发送数据第8位
        10:tx <= 1'b1;    // 发送停止位
    endcase
end

// 发送模块可用
always@(posedge clk)
begin
	if(tx_en)
		tx_ready <= 0;
	else
		tx_ready <= !start;
end

endmodule
