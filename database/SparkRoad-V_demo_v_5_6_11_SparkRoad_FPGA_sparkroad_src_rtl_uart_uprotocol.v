/*************************************************************************
* 作者：吴文强
* 日期：2019/06/11
* 说明：uprotocol.v 自定义串口数据帧处理
* {帧头(6Byte),地址(4Byte),数据(4Byte)}
* 写帧头：依次传输"A","B","C","D","E","F"
* 读帧头：依次传输"F","E","D","C","B","A"
* 地址：先传输低字节,再传输高字节
* 数据：先传输低字节,再传输高字节
* 联系：xqandwn@sina.com
**************************************************************************/

module uprotocol
#(
    parameter CLK_RATE = 50000000
)
(
    input   wire		clk,
    
    // uart-rx
    input   wire		rx_en,
    input   wire [7:0]	rx_data,
    
    // uart-tx
    output  reg			tx_en,
    output  reg [7:0]	tx_data,
    input   wire		tx_ready,
    
	// ubus write
	output	reg			ubus_wen,
	output	reg [31:0]	ubus_waddr,
	output	reg [31:0]	ubus_wdata,
	
	// ubus read
	output	reg			ubus_ren,
	output	reg [31:0]	ubus_raddr,
    input   wire		ubus_bken,
	input	wire [31:0]	ubus_rdata
);

// 帧头常量
localparam HEAD_0 = "A";
localparam HEAD_1 = "B";
localparam HEAD_2 = "C";
localparam HEAD_3 = "D";
localparam HEAD_4 = "E";
localparam HEAD_5 = "F";

// 数据变量
reg auto_rst;
reg [31:0] auto_rst_cnt;
reg [7:0] reg0;
reg [7:0] reg1;
reg [7:0] reg2;
reg [7:0] reg3;
reg [7:0] reg4;
reg [7:0] reg5;
reg [7:0] reg6;
reg [7:0] reg7;
reg rd_mode;
reg wt_mode;
reg wt_flag;
reg wt_flag0;
reg wt_flag1;
reg wt_flag2;
reg wt_flag3;
reg wt_flag4;
reg wt_flag5;
reg rd_flag;
reg rd_flag0;
reg rd_flag1;
reg rd_flag2;
reg rd_flag3;
reg rd_flag4;
reg rd_flag5;
reg recv_state;
reg [2:0] recv_cnt;
reg recv_flag;
reg send_start;
reg send_finish;
reg send_flag;
reg tx_ready_flag;
reg [2:0] tx_ready_cnt; // 位宽不能缩减
reg [3:0] send_cnt;
reg [31:0] tx_buffer0;
reg [31:0] tx_buffer1;

////////////////////////////////////// 抗干扰自复位 /////////////////////////////////////////

// 抗干扰自复位计数器(计数时长1s)
always@(posedge clk)
begin
    if(rx_en | tx_en)
        auto_rst_cnt <= 0;
    else if(auto_rst_cnt == CLK_RATE - 1)
        auto_rst_cnt <= 0;
    else
        auto_rst_cnt <= auto_rst_cnt + 1;
end

// 抗干扰自复位脉冲
always@(posedge clk)
begin
    auto_rst <= (auto_rst_cnt == CLK_RATE - 1);
end

//////////////////////////////////////// 接收逻辑 ///////////////////////////////////////////

// 数据缓存
always@(posedge clk)
begin
	if(rx_en)
	begin
		reg0 <= rx_data;
		reg1 <= reg0;
		reg2 <= reg1;
		reg3 <= reg2;
		reg4 <= reg3;
		reg5 <= reg4;
		reg6 <= reg5;
		reg7 <= reg6;
	end
end

// 寻找写数据帧头
always@(posedge clk)
begin
	if(!recv_state)
	begin
		wt_flag0 <= (reg5 == HEAD_0);
		wt_flag1 <= (reg4 == HEAD_1);
		wt_flag2 <= (reg3 == HEAD_2);
		wt_flag3 <= (reg2 == HEAD_3);
		wt_flag4 <= (reg1 == HEAD_4);
		wt_flag5 <= (reg0 == HEAD_5);
	end
end

// 写数据帧头脉冲
always@(posedge clk)
begin
    wt_flag <= &{rx_en,wt_flag0,wt_flag1,wt_flag2,wt_flag3,wt_flag4,wt_flag5};
end

// 寻找读数据帧头
always@(posedge clk)
begin
	if(!recv_state)
	begin
		rd_flag0 <= (reg5 == HEAD_5);
		rd_flag1 <= (reg4 == HEAD_4);
		rd_flag2 <= (reg3 == HEAD_3);
		rd_flag3 <= (reg2 == HEAD_2);
		rd_flag4 <= (reg1 == HEAD_1);
		rd_flag5 <= (reg0 == HEAD_0);
	end
end

// 读数据帧头脉冲
always@(posedge clk)
begin
    rd_flag <= &{rx_en,rd_flag0,rd_flag1,rd_flag2,rd_flag3,rd_flag4,rd_flag5};
end

// 数据帧读模式.
always@(posedge clk)
begin
	if(recv_flag)
		rd_mode <= 0;
	else if(rd_flag)
		rd_mode <= 1;
end

// 数据帧写模式.
always@(posedge clk)
begin
	if(recv_flag)
		wt_mode <= 0;
	else if(wt_flag)
		wt_mode <= 1;
end

// 数据接收状态(0:停止接收,1:正在接收)
always@(posedge clk)
begin
	if(auto_rst)
		recv_state <= 0;
    else if(wt_flag || rd_flag)
        recv_state <= 1;
	else if(recv_flag)
		recv_state <= 0;
end

// 接收计数器
always@(posedge clk)
begin
	if(auto_rst)
		recv_cnt <= 0;
	else if(!recv_state)
		recv_cnt <= 0;
	else if(rx_en)
		recv_cnt <= recv_cnt + 1;
end

// 数据接收完毕指示
always@(posedge clk)
begin
	recv_flag <= rx_en && (recv_cnt == 6);
end

// 数据输出
always@(posedge clk)
begin
    ubus_ren <= recv_flag && rd_mode;
    ubus_wen <= recv_flag && wt_mode;
end

// 数据输出
always@(posedge clk)
begin
	if(recv_flag && rd_mode)
		ubus_raddr <= {reg4,reg5,reg6,reg7};
end

// 数据输出
always@(posedge clk)
begin
	if(recv_flag && wt_mode)
	begin
		ubus_waddr <= {reg4,reg5,reg6,reg7};
		ubus_wdata <= {reg0,reg1,reg2,reg3};
	end
end

//////////////////////////////////////// 发送逻辑 ///////////////////////////////////////////

// 发送地址/数据寄存
always@(posedge clk)
begin
    // 地址
    if(ubus_ren)
        tx_buffer0 <= ubus_raddr;
    
    // 数据
    if(ubus_bken)
        tx_buffer1 <= ubus_rdata;
end

// 数据发送开始
always@(posedge clk)
begin
    if(auto_rst)
        send_start <= 0;
    else if(ubus_bken)
        send_start <= 1;
    else if(send_finish)
        send_start <= 0;
end

// 数据发送完成
always@(posedge clk)
begin
    if(auto_rst)
        send_finish <= 1;
    else if(ubus_ren)
        send_finish <= 0;
    else if(tx_en && send_cnt == 14)
        send_finish <= 1;
end

// 串口发送可用脉冲计数器
always@(posedge clk)
begin
	if(tx_ready)
		tx_ready_cnt <= tx_ready_cnt + 1;
	else
		tx_ready_cnt <= 0;
end

// 串口发送可用脉冲
always@(posedge clk)
begin
	tx_ready_flag <= &tx_ready_cnt;
end

// 发送计数器
always@(posedge clk)
begin
    if(auto_rst)
        send_cnt <= 0;
    else if(send_finish)
        send_cnt <= 0;
    else if(send_start && tx_ready_flag)
        send_cnt <= send_cnt + 1;
end

// 数据发送使能
always@(posedge clk)
begin
    send_flag <= (send_start && tx_ready_flag);
    tx_en <= send_flag;
end

// 数据发送使能
always@(posedge clk)
begin
    case(send_cnt)
     1:  tx_data <= HEAD_0;
     2:  tx_data <= HEAD_1;
     3:  tx_data <= HEAD_2;
     4:  tx_data <= HEAD_3;
     5:  tx_data <= HEAD_4;
     6:  tx_data <= HEAD_5;
     7:  tx_data <= tx_buffer0[7:0];
     8:  tx_data <= tx_buffer0[15:8];
     9:  tx_data <= tx_buffer0[23:16];
     10: tx_data <= tx_buffer0[31:24];
     11: tx_data <= tx_buffer1[7:0];
     12: tx_data <= tx_buffer1[15:8];
     13: tx_data <= tx_buffer1[23:16];
     14: tx_data <= tx_buffer1[31:24];
    endcase
end

endmodule
