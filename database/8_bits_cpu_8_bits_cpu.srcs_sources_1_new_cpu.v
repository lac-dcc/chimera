// This program was cloned from: https://github.com/buttfa/8_bits_cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/10 08:56:16
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
        input clk, // 时钟信号
        input rst, // 复位信号

        output [7:0] pc_addr,
        output [7:0] instruct,
        output [7:0] command,
        output [7:0] addr,
        output [3:0] ins_code, // 指令编码
        output [4:0] state, //当前状态
        output [4:0] next_state, // 下一个状态
        output pc_en, // PC使能信号
        output jump_en, 
        output ir_en, // IR使能信号
        output rom_en, // ROM使能信号
        output [7:0] rom_out,
        output ram_en, // RAM使能信号
        output [7:0] ram_out,
        output w_r, // RAM的读写信号
        output reg_en, // 寄存器使能信号
        output [3:0] reg_addr,
        output [7:0] reg_out,
        output [1:0] reg_source, // 写寄存器的数据来源
        output ac_en, // AC使能信号
        output ac_source, // AC的数据来源
        output [7:0] ac_out,
        output alu_en, // ALU使能信号
        output [7:0] alu_out
    );

    controller controller(
        .clk(clk), // 时钟信号
        .rst(rst), // 复位信号
        .ins_code(ins_code), // 指令编码
        .reg_addr(reg_addr),

        .state(state), //当前状态
        .next_state(next_state), // 下一个状态
        .pc_en(pc_en), // PC使能信号
        .jump_en(jump_en),
        .ir_en(ir_en), // IR使能信号
        .rom_en(rom_en), // ROM使能信号
        .ram_en(ram_en), // RAM使能信号
        .w_r(w_r), // RAM的读写信号
        .reg_en(reg_en), // 寄存器使能信号
        .reg_source(reg_source), // 写寄存器的数据来源
        .ac_en(ac_en), // AC使能信号
        .ac_source(ac_source), // AC的数据来源
        .alu_en(alu_en) // ALU使能信号
    );

    rom rom(
        .rom_en(rom_en),
        .addr(addr),
        .pc_addr(pc_addr),

        .rom_out(rom_out),
        .instruct(instruct)
    );

    ram ram(
        .ram_en(ram_en),
        .w_r(w_r),
        .addr(addr),
        .ram_in(reg_out),

        .ram_out(ram_out)
    );

    program_counter program_counter(
        .rst(rst),
        .pc_en(pc_en),
        .jump_en(jump_en),
        .jump_addr(addr),
        .ins_code(ins_code),
        .ac_out(ac_out),
        .reg_out(reg_out),
        .instruct(instruct),

        .pc_addr(pc_addr),
        .command(command),
        .addr(addr)
    ); 

    instruction_register instruction_register(
        .rst(rst),
        .ir_en(ir_en),
        .command(command),

        .ins_code(ins_code),
        .reg_addr(reg_addr)
    );

    accumulator accumulator(
        .rst(rst),
        .ac_en(ac_en),
        .ac_source(ac_source),
        .reg_out(reg_out),
        .alu_out(alu_out),

        .ac_out(ac_out)
    );

    regs regs(
        .rst(rst),
        .reg_en(reg_en),
        .reg_addr(reg_addr),
        .reg_source(reg_source),
        .rom_out(rom_out),
        .ram_out(ram_out),
        .ac_out(ac_out),

        .reg_out(reg_out)
    );

    alu alu(
        .rst(rst),
        .alu_en(alu_en),
        .operation({ins_code[1],ins_code[0]}),
        .reg_out(reg_out),
        .ac_out(ac_out),
        .immediate(addr), 

        .alu_out(alu_out)
    );

endmodule
