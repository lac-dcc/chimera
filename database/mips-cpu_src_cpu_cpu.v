// This program was cloned from: https://github.com/sxtyzhangzk/mips-cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/21 13:08:03
// Design Name: 
// Module Name: cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cpu(
	input EXCLK,
	input button,
	output Tx,
	input Rx
	);
	
	//reg CLK = 0;
//	reg RST_Powerup;
//	reg reseted = 0;
//	always @(posedge EXCLK) begin
//		RST_Powerup <= 0;
//		if(!reseted) begin
//			RST_Powerup <= 1;
//			reseted <= 1;
//		end
//		//CLK <= !CLK;
//	end
	
	reg RST;
	reg RST_delay;
	
	wire CLK;
	clk_wiz_0 clk(CLK, 1'b0, EXCLK);
	
	always @(posedge CLK or posedge button) begin
		if(button) begin
			RST <= 1;
			RST_delay <= 1;
		end else begin
			RST_delay <= 0;
			RST <= RST_delay;
		end
	end
	
	wire 		UART_send_flag;
	wire [7:0]	UART_send_data;
	wire 		UART_recv_flag;
	wire [7:0]	UART_recv_data;
	wire		UART_sendable;
	wire		UART_receivable;
	
	uart_comm #(.BAUDRATE(5000000/*115200*/), .CLOCKRATE(66667000)) UART(
		CLK, RST,
		UART_send_flag, UART_send_data,
		UART_recv_flag, UART_recv_data,
		UART_sendable, UART_receivable,
		Tx, Rx);
	
	localparam CHANNEL_BIT = 1;
	localparam MESSAGE_BIT = 72;
	localparam CHANNEL = 1 << CHANNEL_BIT;
	
	wire 					COMM_read_flag[CHANNEL-1:0];
	wire [MESSAGE_BIT-1:0]	COMM_read_data[CHANNEL-1:0];
	wire [4:0]				COMM_read_length[CHANNEL-1:0];
	wire 					COMM_write_flag[CHANNEL-1:0];
	wire [MESSAGE_BIT-1:0]	COMM_write_data[CHANNEL-1:0];
	wire [4:0]				COMM_write_length[CHANNEL-1:0];
	wire					COMM_readable[CHANNEL-1:0];
	wire					COMM_writable[CHANNEL-1:0];
	
	multchan_comm #(.MESSAGE_BIT(MESSAGE_BIT), .CHANNEL_BIT(CHANNEL_BIT)) COMM(
		CLK, RST,
		UART_send_flag, UART_send_data,
		UART_recv_flag, UART_recv_data,
		UART_sendable, UART_receivable,
		{COMM_read_flag[1], COMM_read_flag[0]},
		{COMM_read_length[1], COMM_read_data[1], COMM_read_length[0], COMM_read_data[0]},
		{COMM_write_flag[1], COMM_write_flag[0]},
		{COMM_write_length[1], COMM_write_data[1], COMM_write_length[0], COMM_write_data[0]},
		{COMM_readable[1], COMM_readable[0]},
		{COMM_writable[1], COMM_writable[0]});
	
	wire [2*2-1:0]	MEM_rw_flag;
	wire [2*32-1:0]	MEM_addr;
	wire [2*32-1:0]	MEM_read_data;
	wire [2*32-1:0]	MEM_write_data;
	wire [2*4-1:0]	MEM_write_mask;
	wire [1:0]		MEM_busy;
	wire [1:0]		MEM_done;
	
	memory_controller MEM_CTRL(
		CLK, RST,
		COMM_write_flag[0], COMM_write_data[0], COMM_write_length[0],
		COMM_read_flag[0], COMM_read_data[0], COMM_read_length[0],
		COMM_writable[0], COMM_readable[0],
		MEM_rw_flag, MEM_addr,
		MEM_read_data, MEM_write_data, MEM_write_mask,
		MEM_busy, MEM_done);
	
	cpu_core CORE(
		CLK, RST,
		MEM_rw_flag, MEM_addr,
		MEM_read_data, MEM_write_data, MEM_write_mask,
		MEM_busy, MEM_done);
endmodule
