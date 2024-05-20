// This program was cloned from: https://github.com/buttfa/8_bits_cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 14:50:49
// Design Name: 
// Module Name: cpu_test
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


module cpu_test();
    reg clk; // 时钟信号
    reg rst; // 复位信号

    wire [7:0] pc_addr;
    wire [7:0] instruct;
    wire [7:0] command;
    wire [7:0] addr;
    wire [3:0] ins_code; // 指令编码
    wire [4:0] state; //当前状态
    wire [4:0] next_state; // 下一个状态
    wire pc_en; // PC使能信号
    wire jump_en;
    wire ir_en; // IR使能信号
    wire rom_en; // ROM使能信号
    wire [7:0] rom_out;
    wire ram_en; // RAM使能信号
    wire [7:0] ram_out;
    wire w_r; // RAM的读写信号
    wire reg_en; // 寄存器使能信号
    wire [3:0] reg_addr;
    wire [7:0] reg_out;
    wire [1:0] reg_source; // 写寄存器的数据来源
    wire ac_en; // AC使能信号
    wire ac_source; // AC的数据来源
    wire [7:0] ac_out;
    wire alu_en; // ALU使能信号
    wire [7:0] alu_out;

    cpu cpu(
        .clk(clk),
        .rst(rst),

        
        .pc_addr(pc_addr),
        .instruct(instruct),
        .command(command),
        .addr(addr),
        .ins_code(ins_code), // 指令编码
        .state(state), //当前状态
        .next_state(next_state), // 下一个状态
        .pc_en(pc_en), // PC使能信号
        .jump_en(jump_en),
        .ir_en(ir_en), // IR使能信号
        .rom_en(rom_en), // ROM使能信号
        .rom_out(rom_out),
        .ram_en(ram_en), // RAM使能信号
        .ram_out(ram_out),
        .w_r(w_r), // RAM的读写信号
        .reg_en(reg_en), // 寄存器使能信号
        .reg_addr(reg_addr),
        .reg_out(reg_out),
        .reg_source(reg_source), // 写寄存器的数据来源
        .ac_en(ac_en), // AC使能信号
        .ac_source(ac_source), // AC的数据来源
        .ac_out(ac_out),
        .alu_en(alu_en), // ALU使能信号
        .alu_out(alu_out)
    );

    integer i = 0;

    initial begin
        clk = 0; rst = 1;
        #5; 
        rst = 0;
        #5;
        rst = 1;
        for (i = 0; i < 200; i = i + 1) begin
            #5;
            clk = ~clk;
        end
        $finish;
    end

endmodule
