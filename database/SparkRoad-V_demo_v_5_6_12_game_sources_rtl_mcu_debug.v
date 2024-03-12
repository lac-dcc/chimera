`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: debug
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

module debug
(
    input   wire		clk,
    
    // rom write
    output  reg			rom_wen,
    output  reg [23:0]	rom_waddr,
    output  reg [7:0]	rom_wdata,
    
    // rom read
    output  reg			rom_ren,
    output  reg  [23:0]	rom_raddr,
    input   wire [7:0]	rom_rdata,
    
    // debug inst
    output  reg			dbg_en,
    output  reg			dbg_inst_en,
    output  reg  [7:0]	dbg_inst,
    
    // debug info
    output  reg  [3:0]	read_abcd,
    input   wire		dbg_info_en,
    input   wire [15:0]	dbg_info,
    
    // uart
	input	wire		recv_en,
	input	wire [7:0]	recv_cmd,
	input	wire [7:0]	recv_data,
    output  reg			send_en,
    output  reg  [7:0]	send_cmd,
    output  reg  [7:0]	send_data,
    input   wire		send_ready
);

reg free_run_cmd;
reg debug_cmd;
reg clear_rom_addr_cmd;
reg clear_rom_data_cmd;
reg read_rom_cmd;
reg write_rom_cmd;
reg read_a_cmd;
reg read_b_cmd;
reg read_c_cmd;
reg read_d_cmd;
reg rom_ren_d0;
reg rom_ren_d1;
reg rom_bk_en;

// 串口命令解析
always@(*)
begin
    free_run_cmd        = (recv_cmd == 0);
    debug_cmd           = (recv_cmd == 1);
    clear_rom_addr_cmd  = (recv_cmd == 2);
    clear_rom_data_cmd  = (recv_cmd == 3);
    read_rom_cmd        = (recv_cmd == 4);
    write_rom_cmd       = (recv_cmd == 5);
    read_a_cmd          = (recv_cmd == 6);
    read_b_cmd          = (recv_cmd == 7);
    read_c_cmd          = (recv_cmd == 8);
    read_d_cmd          = (recv_cmd == 9);
end

// 调试模式
always@(posedge clk)
begin
    if(free_run_cmd)
        dbg_en <= 0;
    else if(debug_cmd)
        dbg_en <= 1;
end

// 调试指令
always@(posedge clk)
begin
    dbg_inst_en <= recv_en && debug_cmd;
    if(debug_cmd)
        dbg_inst <= recv_data;
end

// 读取A、B、C、D寄存器值
always@(posedge clk)
begin
    read_abcd[0] <= recv_en && read_a_cmd;
    read_abcd[1] <= recv_en && read_b_cmd;
    read_abcd[2] <= recv_en && read_c_cmd;
    read_abcd[3] <= recv_en && read_d_cmd;
end

// 写rom使能
always@(posedge clk)
begin
    if(clear_rom_data_cmd)
        rom_wen <= 1;
    else
        rom_wen <= recv_en && write_rom_cmd;
end

// 写rom地址
always@(posedge clk)
begin
    if(clear_rom_addr_cmd)
        rom_waddr <= 0;
    else if(rom_wen)
        rom_waddr <= rom_waddr + 1;
end

// 写rom数据
always@(posedge clk)
begin
    if(clear_rom_data_cmd)
        rom_wdata <= 0;
    else if(recv_en && write_rom_cmd)
        rom_wdata <= recv_data;
end

// 读rom使能
always@(posedge clk)
begin
    rom_ren <= recv_en && read_rom_cmd;
end

// 读rom地址
always@(posedge clk)
begin
    if(clear_rom_addr_cmd)
        rom_raddr <= 0;
    else if(rom_ren)
        rom_raddr <= rom_raddr + 1;
end

// rom数据返回
always@(posedge clk)
begin
    rom_ren_d0 <= rom_ren;
    rom_ren_d1 <= rom_ren_d0;
    rom_bk_en <= rom_ren_d1;
end

// 串口发送使能
always@(posedge clk)
begin
    send_en <= send_ready && (dbg_info_en || rom_bk_en);
end

// 串口发送数据
always@(posedge clk)
begin
    if(dbg_info_en)
    begin
        send_cmd <= dbg_info[15:8];
        send_data <= dbg_info[7:0];
    end
    else if(rom_bk_en)
    begin
        send_cmd <= 0;
        send_data <= rom_rdata;
    end
end

endmodule
