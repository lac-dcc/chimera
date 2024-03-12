`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: fetch
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

module fetch
(
    input   wire		clk,
    
    // rom
    output  reg			rom_ren,
	output  reg  [23:0]	rom_raddr,
	input   wire [7:0]	rom_rdata,
    
    // debug
    input   wire		dbg_en,
    input   wire		dbg_rom_ren,
    input   wire [23:0]	dbg_rom_raddr,
    output  reg  [7:0]	dbg_rom_rdata,
    input   wire		dbg_inst_en,
    input   wire [7:0]	dbg_inst,

    // timer
    input   wire		timer_state,
    
    // pc
    input   wire		pc_wen,
    input   wire [23:0]	pc_wdata,
    
    // instruction
    output  reg			inst_en,
    output  reg [7:0]	inst
);

reg [23:0] pc;
reg fetch_en;
reg rom_bk_en;

// rom寻址使能
always@(posedge clk)
begin
    if(dbg_en)
        fetch_en <= 0;
    else if(timer_state)
        fetch_en <= 1;
    else
        fetch_en <= 0;
end

// pc计数器
always@(posedge clk)
begin
    if(dbg_en)
        pc <= 0;
    else if(pc_wen)
        pc <= pc_wdata;
    else if(fetch_en)
        pc <= pc + 1;
end

// 读rom使能
always@(posedge clk)
begin
    rom_ren <= dbg_rom_ren || fetch_en;
end

// 读rom数据
always@(posedge clk)
begin
    if(dbg_rom_ren)
        rom_raddr <= dbg_rom_raddr;
    else if(fetch_en)
        rom_raddr <= pc;
end

// 指令使能
always@(posedge clk)
begin
    rom_bk_en <= rom_ren;
    inst_en <= dbg_inst_en || rom_bk_en;
end

// 指令数据
always@(posedge clk)
begin
    if(dbg_inst_en)
        inst <= dbg_inst;
    else if(rom_bk_en)
        inst <= rom_rdata;
end

// 调试数据返回
always@(posedge clk)
begin
    if(dbg_en)
        dbg_rom_rdata <= rom_rdata;
end

endmodule
