// This program was cloned from: https://github.com/xiaowuzxc/SparrowRV
// License: MIT License


`include "defines.v"

// 通用寄存器模块
module regs(

    input wire clk,
    input wire rst_n,

    // core 
    //r
    input wire [`RegAddrBus] raddr1_i,     // 读寄存器1地址
    input wire [`RegAddrBus] raddr2_i,     // 读寄存器2地址
    output reg [`RegBus] rdata1_o,         // 读寄存器1数据
    output reg [`RegBus] rdata2_o,         // 读寄存器2数据
    //w
    input wire we_i,                      // 写寄存器使能
    input wire [`RegAddrBus] waddr_i,      // 写寄存器地址
    input wire [`RegBus] wdata_i,          // 写寄存器数据

    // bus 
    input wire [`RegAddrBus] bus_raddr_i,  // 读寄存器地址
    output reg [`RegBus] bus_data_o       // 读寄存器数据
    );

    reg[`RegBus] regs[31:0];

    // 写寄存器
    always @ (posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            regs[0] <= 32'h0;
            regs[1] <= 32'h0;
            regs[2] <= 32'h0;
            regs[3] <= 32'h0;
            regs[4] <= 32'h0;
            regs[5] <= 32'h0;
            regs[6] <= 32'h0;
            regs[7] <= 32'h0;
            regs[8] <= 32'h0;
            regs[9] <= 32'h0;
            regs[10] <= 32'h0;
            regs[11] <= 32'h0;
            regs[12] <= 32'h0;
            regs[13] <= 32'h0;
            regs[14] <= 32'h0;
            regs[15] <= 32'h0;
            regs[16] <= 32'h0;
            regs[17] <= 32'h0;
            regs[18] <= 32'h0;
            regs[19] <= 32'h0;
            regs[20] <= 32'h0;
            regs[21] <= 32'h0;
            regs[22] <= 32'h0;
            regs[23] <= 32'h0;
            regs[24] <= 32'h0;
            regs[25] <= 32'h0;
            regs[26] <= 32'h0;
            regs[27] <= 32'h0;
            regs[28] <= 32'h0;
            regs[29] <= 32'h0;
            regs[30] <= 32'h0;
            regs[31] <= 32'h0;
        end
        else begin
            if (we_i == 1) begin
                regs[waddr_i] <= wdata_i;
            end
            else begin
                
            end
        end
    end

    // 读寄存器1
    always @ (*) begin
        if (raddr1_i == 0) begin
            rdata1_o = 0;
        end else begin
            rdata1_o = regs[raddr1_i];
        end
    end

    // 读寄存器2
    always @ (*) begin
        if (raddr2_i == 0) begin
            rdata2_o = 0;
        end else begin
            rdata2_o = regs[raddr2_i];
        end
    end

    // bus读寄存器
    always @ (*) begin
        if (bus_raddr_i == 0) begin
            bus_data_o = 0;
        end else begin
            bus_data_o = regs[bus_raddr_i];
        end
    end

//仿真观测专用
wire [31:0] ra  = regs[1];
wire [31:0] sp  = regs[2];
wire [31:0] gp  = regs[3];
wire [31:0] tp  = regs[4];
wire [31:0] t0  = regs[5];
wire [31:0] t1  = regs[6];
wire [31:0] t2  = regs[7];
wire [31:0] s0  = regs[8];
wire [31:0] s1  = regs[9];
wire [31:0] a0  = regs[10];
wire [31:0] a1  = regs[11];
wire [31:0] a2  = regs[12];
wire [31:0] a3  = regs[13];
wire [31:0] a4  = regs[14];
wire [31:0] a5  = regs[15];
wire [31:0] a6  = regs[16];
wire [31:0] a7  = regs[17];
wire [31:0] s2  = regs[18];
wire [31:0] s3  = regs[19];
wire [31:0] s4  = regs[20];
wire [31:0] s5  = regs[21];
wire [31:0] s6  = regs[22];
wire [31:0] s7  = regs[23];
wire [31:0] s8  = regs[24];
wire [31:0] s9  = regs[25];
wire [31:0] s10 = regs[26];
wire [31:0] s11 = regs[27];
wire [31:0] t3  = regs[28];
wire [31:0] t4  = regs[29];
wire [31:0] t5  = regs[30];
wire [31:0] t6  = regs[31];
endmodule
