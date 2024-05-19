// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: execute
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

module execute
(
    input   wire		clk,
    
    // 译码结果输入
    input   wire [39:0]	decode_cmd,
    input   wire [7:0]	decode_data,

    // ram
	output	reg			ram_wen,
	output	reg  [7:0]	ram_waddr,
	output	reg  [7:0]	ram_wdata,
    output  reg			ram_ren,
	output  wire [7:0]	ram_raddr,
	input   wire [7:0]	ram_rdata,
    
    // bus
	output	reg			bus_wen,
	output	wire [7:0]	bus_waddr,
	output	wire [7:0]	bus_wdata,
	output  reg			bus_ren,
	output  wire [7:0]	bus_raddr,
	input   wire [7:0]	bus_rdata,
    
	// alu
    output  reg  [10:0]	alu_cmd,
	output  wire [7:0]	alu_in1,
	output  wire [7:0]	alu_in2,
	input   wire [8:0]	alu_out0,
	input   wire [15:0]	alu_out1,
	input   wire [7:0]	alu_out2,
	input   wire [7:0]	alu_out3,
	input   wire [7:0]	alu_out4,
    
    // pc
    output  reg			pc_wen,
    output  reg  [23:0]	pc_wdata,

    // uart buffer
    input   wire [3:0]	read_abcd,
    output  reg			dbg_info_en,
    output  reg  [15:0]	dbg_info,
    
    // timer
    output  reg			timer_wen,
    output  reg [23:0]	timer_wdata
);

reg [7:0] A;
reg [7:0] B;
reg [7:0] C;
reg [7:0] D;
reg [7:0] rom_data;
reg pc_wen0;
reg timer_wen0;
reg dbg_info_en0;
reg rom_to_a_wen;
reg rom_to_b_wen;
reg rom_to_c_wen;
reg rom_to_d_wen;
reg ram_to_a_wen;
reg ram_to_b_wen;
reg ram_to_c_wen;
reg ram_to_d_wen;
reg bus_to_a_wen;
reg bus_to_b_wen;
reg bus_to_c_wen;
reg bus_to_d_wen;
wire null_cmd;
wire wt_a_cmd;
wire wt_b_cmd;
wire wt_c_cmd;
wire wt_d_cmd;
wire wt_a_rt_cmd;
wire wt_b_rt_cmd;
wire wt_c_rt_cmd;
wire wt_d_rt_cmd;
wire wt_a_bt_cmd;
wire wt_b_bt_cmd;
wire wt_c_bt_cmd;
wire wt_d_bt_cmd;
wire wt_pc_cmd;
wire wt_timer_cmd;
wire ex_alua_cmd;
wire ex_alub_cmd;
wire ex_aluc_cmd;
wire ex_alud_cmd;
wire ex_alue_cmd;
wire ex_aluf_cmd;
wire ex_alug_cmd;
wire ex_aluh_cmd;
wire ex_alui_cmd;
wire ex_aluj_cmd;
wire ex_aluk_cmd;
wire wt_bus_cmd;
wire rd_bus_cmd;
wire rd_ram_cmd;
wire wt_ram_a_cmd;
wire wt_ram_b_cmd;
wire wt_ram_c_cmd;
wire wt_ram_alu0_cmd;
wire wt_ram_alu1_cmd;
wire wt_ram_alu2_cmd;
wire wt_ram_alu3_cmd;
wire wt_ram_alu4_cmd;
wire wt_ram_alu5_cmd;
wire wt_ram_alu6_cmd;
wire dbg_info_cmd;
reg [9:0] wt_ram_cmd;

assign null_cmd = decode_cmd[0]; 
assign wt_a_cmd = decode_cmd[1]; 
assign wt_b_cmd = decode_cmd[2]; 
assign wt_c_cmd = decode_cmd[3]; 
assign wt_d_cmd = decode_cmd[4]; 
assign wt_a_rt_cmd = decode_cmd[5]; 
assign wt_b_rt_cmd = decode_cmd[6]; 
assign wt_c_rt_cmd = decode_cmd[7]; 
assign wt_d_rt_cmd = decode_cmd[8]; 
assign wt_a_bt_cmd = decode_cmd[9]; 
assign wt_b_bt_cmd = decode_cmd[10];
assign wt_c_bt_cmd = decode_cmd[11];
assign wt_d_bt_cmd = decode_cmd[12];
assign wt_pc_cmd = decode_cmd[13];
assign wt_timer_cmd = decode_cmd[14];
assign ex_alua_cmd = decode_cmd[15];
assign ex_alub_cmd = decode_cmd[16];
assign ex_aluc_cmd = decode_cmd[17];
assign ex_alud_cmd = decode_cmd[18];
assign ex_alue_cmd = decode_cmd[19];
assign ex_aluf_cmd = decode_cmd[20];
assign ex_alug_cmd = decode_cmd[21];
assign ex_aluh_cmd = decode_cmd[22];
assign ex_alui_cmd = decode_cmd[23];
assign ex_aluj_cmd = decode_cmd[24];
assign ex_aluk_cmd = decode_cmd[25];
assign wt_bus_cmd = decode_cmd[26];
assign rd_bus_cmd = decode_cmd[27];
assign rd_ram_cmd = decode_cmd[28];
assign wt_ram_a_cmd = decode_cmd[29];
assign wt_ram_b_cmd = decode_cmd[30];
assign wt_ram_c_cmd = decode_cmd[31];
assign wt_ram_alu0_cmd = decode_cmd[32];
assign wt_ram_alu1_cmd = decode_cmd[33];
assign wt_ram_alu2_cmd = decode_cmd[34];
assign wt_ram_alu3_cmd = decode_cmd[35];
assign wt_ram_alu4_cmd = decode_cmd[36];
assign wt_ram_alu5_cmd = decode_cmd[37];
assign wt_ram_alu6_cmd = decode_cmd[38];
assign dbg_info_cmd = decode_cmd[39];

// 空指令
/*
always@(posedge clk)
begin
    `null_cmd
end
*/

// 指令1、2、3、4数据
always@(posedge clk)
begin
    rom_data <= decode_data;
end

// rom数据写入{A,B,C,D}寄存器
always@(posedge clk)
begin
	rom_to_a_wen <= wt_a_cmd;
	rom_to_b_wen <= wt_b_cmd;
	rom_to_c_wen <= wt_c_cmd;
	rom_to_d_wen <= wt_d_cmd;
end

// ram数据写入{A,B,C,D}寄存器
always@(posedge clk)
begin
	ram_to_a_wen <= wt_a_rt_cmd;
	ram_to_b_wen <= wt_b_rt_cmd;
	ram_to_c_wen <= wt_c_rt_cmd;
	ram_to_d_wen <= wt_d_rt_cmd;
end

// bus数据写入{A,B,C,D}寄存器
always@(posedge clk)
begin
	bus_to_a_wen <= wt_a_bt_cmd;
	bus_to_b_wen <= wt_b_bt_cmd;
	bus_to_c_wen <= wt_c_bt_cmd;
	bus_to_d_wen <= wt_d_bt_cmd;
end

// 写A寄存器
always@(posedge clk)
begin
    if(rom_to_a_wen)
        A <= rom_data;
    else if(bus_to_a_wen)
        A <= bus_rdata;
    else if(ram_to_a_wen)
	begin
		if(ram_raddr == ram_waddr)
			A <= ram_wdata;
		else
			A <= ram_rdata;
	end
end

// 写B寄存器
always@(posedge clk)
begin
    if(rom_to_b_wen)
        B <= rom_data;
    else if(bus_to_b_wen)
        B <= bus_rdata;
    else if(ram_to_b_wen)
	begin
		if(ram_raddr == ram_waddr)
			B <= ram_wdata;
		else
			B <= ram_rdata;
	end
end

// 写C寄存器
always@(posedge clk)
begin
    if(rom_to_c_wen)
        C <= rom_data;
    else if(bus_to_c_wen)
        C <= bus_rdata;
    else if(ram_to_c_wen)
	begin
		if(ram_raddr == ram_waddr)
			C <= ram_wdata;
		else
			C <= ram_rdata;
	end
end

// 写D寄存器
always@(posedge clk)
begin
    if(rom_to_d_wen)
        D <= rom_data;
    else if(bus_to_d_wen)
        D <= bus_rdata;
    else if(ram_to_d_wen)
	begin
		if(ram_raddr == ram_waddr)
			D <= ram_wdata;
		else
			D <= ram_rdata;
	end
end

// 写PC寄存器
always@(posedge clk)
begin
	pc_wen0 <= wt_pc_cmd;
	if(!D)
	begin
		pc_wen <= pc_wen0;
		pc_wdata <= {A,B,C};
	end
end

// 写Timer寄存器
always@(posedge clk)
begin
	timer_wen0 <= wt_timer_cmd;
	timer_wen <= timer_wen0;
	timer_wdata <= {A,B,C};
end

// alu操作
always@(posedge clk)
begin
	alu_cmd <= decode_cmd[25:15];
end

assign alu_in1 = A;
assign alu_in2 = B;

// 写bus
always@(posedge clk)
begin
    bus_wen <= wt_bus_cmd;
end

assign bus_waddr = D;
assign bus_wdata = A;

// 读bus
always@(posedge clk)
begin
    bus_ren <= rd_bus_cmd;
end

assign bus_raddr = D;

// 读ram
always@(posedge clk)
begin
    ram_ren <= rd_ram_cmd;
end

assign ram_raddr = D;

// 串口调试信息
always@(posedge clk)
begin
    dbg_info_en0 <= dbg_info_cmd;
    dbg_info_en <= dbg_info_en0 || read_abcd;
end

// 串口调试信息
always@(posedge clk)
begin
    if(dbg_info_en0)
        dbg_info <= {A,B};
    else if(read_abcd[0])
        dbg_info <= {8'd6,A};
    else if(read_abcd[1])
        dbg_info <= {8'd7,B};
    else if(read_abcd[2])
        dbg_info <= {8'd8,C};
    else if(read_abcd[3])
        dbg_info <= {8'd9,D};
end

//-------------- ram写数据,增加一级流水线,降低关键路径延时 --------------//
// 写ram使能
always@(posedge clk)
begin
	wt_ram_cmd <= decode_cmd[38:29];
    ram_wen <= (|wt_ram_cmd);
end

// 写ram地址
always@(posedge clk)
begin
    if(|wt_ram_cmd)
        ram_waddr <= D;
end

// 写ram数据
always@(posedge clk)
begin
    if(wt_ram_cmd[0])
        ram_wdata <= A;
    else if(wt_ram_cmd[1])
        ram_wdata <= B;
    else if(wt_ram_cmd[2])
        ram_wdata <= C;
    else if(wt_ram_cmd[3])
        ram_wdata <= alu_out0[8];
    else if(wt_ram_cmd[4])
        ram_wdata <= alu_out0[7:0];
    else if(wt_ram_cmd[5])
        ram_wdata <= alu_out1[15:8];
    else if(wt_ram_cmd[6])
        ram_wdata <= alu_out1[7:0];
    else if(wt_ram_cmd[7])
        ram_wdata <= alu_out2;
    else if(wt_ram_cmd[8])
        ram_wdata <= alu_out3;
    else if(wt_ram_cmd[9])
        ram_wdata <= alu_out4;
end

endmodule
