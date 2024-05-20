// This program was cloned from: https://github.com/buttfa/8_bits_cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 13:09:17
// Design Name: 
// Module Name: controller
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


module controller(
        input clk, // 时钟信号
        input rst, // 复位信号
        input [3:0] ins_code, // 指令编码
        input [3:0] reg_addr,

        output reg [4:0] state, //当前状态
        output reg [4:0] next_state, // 下一个状态
        output reg pc_en, // PC使能信号
        output reg jump_en, // PC跳转使能信号
        output reg ir_en, // IR使能信号
        output reg rom_en, // ROM使能信号
        output reg ram_en, // RAM使能信号
        output reg w_r, // RAM的读写信号
        output reg reg_en, // 寄存器使能信号
        output reg [ 1:0] reg_source, // 写寄存器的数据来源
        output reg ac_en, // AC使能信号
        output reg ac_source, // AC的数据来源
        output reg alu_en // ALU使能信号
    );

    parameter 
        S0 = 5'd0,
        PREPARE = 5'd31, // 0x1f
        S1 = 5'd1, // 0x01
        S2 = 5'd2, // 0x02
        S3 = 5'd3, // 0x03
    
        LDO_1 = 5'd4, // 0x04
        LDO_2 = 5'd5, // 0x05
        LDO_3 = 5'd6, // 0x06
        LDO_4 = 5'd7, // 0x07

        LDA_1 = 5'd8, // 0x08
        LDA_2 = 5'd9, // 0x09
        LDA_3 = 5'd10, // 0x0a
        LDA_4 = 5'd11, // 0x0b

        STO_1 = 5'd12, // 0x0c
        STO_2 = 5'd13, // 0x0d
        STO_3 = 5'd14, // 0x0e
        STO_4 = 5'd15, // 0x0f

        PRE_1 = 5'd16, // 0x10
        PRE_2 = 5'd17, // 0x11
        
        LDM_1 = 5'd18, // 0x12

        OPERAL_1 = 5'd19, // 0x13
        OPERAL_2 = 5'd20, // 0x14
        OPERAL_3 = 5'd21, // 0x15
        OPERAL_4 = 5'd22, // 0x16
        OPERAL_5 = 5'd23, // 0x17

        OPERAS_1 = 5'd24, // 0x18
        OPERAS_2 = 5'd25, // 0x19
        OPERAS_3 = 5'd26, // 0x1a

        JUMP_1   = 5'd27, // 0x1b
        JUMP_2   = 5'd28, // 0x1c
        JUMP_3   = 5'd29, // 0x1d
        JUMP_4   = 5'd30; // 0x1e

    always @(negedge rst or posedge clk) begin
        if (!rst) begin
            state = PREPARE;
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 0; 
            ram_en = 0; 
            w_r = 1'bZ; 
            reg_en = 0; 
            reg_source = 2'b00; 
            ac_en = 0; 
            alu_en = 0;  jump_en = 0; 
        end else if (clk) begin
            state <= next_state;
        end
    end

    parameter 
        NOP   = 4'b0000,
        LDO   = 4'b0101,
        LDA   = 4'b0110,
        STO   = 4'b0111,
        PRE   = 4'b1001,
        LDM   = 4'b1010,
        
        ADDI  = 4'b1100,
        ADD   = 4'b1101,
        LS    = 4'b1110,
        RS    = 4'b1111,

        B     = 4'b0001,
        BEQ   = 4'b0010,
        BLT   = 4'b0011;

    // 确定下一个状态
    always @(*) begin
        case (state)
            S0: next_state <= S0;
            PREPARE: next_state <= S1;
            S1: next_state <= S2;
            S2: next_state <= S3;
            S3: case (ins_code)
                NOP: begin
                    if (reg_addr == 4'b0000) begin
                        next_state <= S1;
                    end else begin
                        next_state <= S0;
                    end
                end
                LDO: next_state <= LDO_1; 
                LDA: next_state <= LDA_1;
                STO: next_state <= STO_1;
                PRE: next_state <= PRE_1;
                LDM: next_state <= LDM_1;

                ADDI: next_state <= OPERAL_1;
                
                ADD: next_state <= OPERAS_1;
                LS: next_state <= OPERAS_1;
                RS: next_state <= OPERAS_1;

                B: next_state <= JUMP_1;
                BEQ: next_state <= JUMP_1;
                BLT: next_state <= JUMP_1;
                default: next_state <= S0;
            endcase 

            // LDO指令
            LDO_1: next_state <= LDO_2;
            LDO_2: next_state <= LDO_3;
            LDO_3: next_state <= LDO_4;
            LDO_4: next_state <= S1;

            // LDA指令
            LDA_1: next_state <= LDA_2;
            LDA_2: next_state <= LDA_3;
            LDA_3: next_state <= LDA_4;
            LDA_4: next_state <= S1;            

            // STO指令
            STO_1: next_state <= STO_2;
            STO_2: next_state <= STO_3;
            STO_3: next_state <= STO_4;
            STO_4: next_state <= S1;

            // PRE指令
            PRE_1: next_state <= PRE_2;
            PRE_2: next_state <= S1;

            // LDM指令
            LDM_1: next_state <= S1;

            // OPERAL指令
            OPERAL_1: next_state <= OPERAL_2;
            OPERAL_2: next_state <= OPERAL_3;
            OPERAL_3: next_state <= OPERAL_4;
            OPERAL_4: next_state <= OPERAL_5;
            OPERAL_5: next_state <= S1;

            // OPERAS指令
            OPERAS_1: next_state <= OPERAS_2;
            OPERAS_2: next_state <= OPERAS_3;
            OPERAS_3: next_state <= S1;

            // JUMP指令
            JUMP_1: next_state <= JUMP_2;
            JUMP_2: next_state <= JUMP_3;
            JUMP_3: next_state <= JUMP_4;
            JUMP_4: next_state <= S1;
            default: next_state <= S0;
        endcase
    end

    always @(*) begin
        if (state == S0) begin
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 0; 
            
            w_r = 1'bZ; ram_en = 0; 
            
            reg_source = 2'b00; reg_en = 0; 
            
            ac_source = 1'bZ; ac_en = 0; 
            
            alu_en = 0;  jump_en = 0; 
        end else if (state == S1 || state == LDO_1 || state == LDA_1 || state == STO_1 || state == OPERAL_1 || state == JUMP_1) begin
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 1; 
            w_r = 1'bZ; ram_en = 0; 
             
            reg_source = 2'b00; reg_en = 0;
             
            ac_source = 1'bZ; ac_en = 0;

            alu_en = 0;  jump_en = 0; 
        end else if (state == S2) begin
            pc_en = 0; 
            ir_en = 1; 
            rom_en = 0; 
            
            w_r = 1'bZ; ram_en = 0; 
            
            reg_source = 2'b00; reg_en = 0; 
            
            ac_source = 1'bZ; ac_en = 0; 
            alu_en = 0;  jump_en = 0; 
        end else if (state == S3 || state == LDO_2 || state == LDA_2 || state == STO_2 || state == OPERAL_2 || state == JUMP_2) begin
            pc_en = 1; 
            ir_en = 0; 
            rom_en = 0; 
            
            w_r = 1'bZ; ram_en = 0; 
            
            reg_source = 2'b00; reg_en = 0; 
            
            ac_source = 1'bZ; ac_en = 0; 
            alu_en = 0;  jump_en = 0; 
        end else if (state == LDO_3) begin // S4
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 1; 
            
            w_r = 1'bZ; ram_en = 0; 
            
            reg_source = 2'b00; reg_en = 0; 
            
            ac_source = 1'bZ; ac_en = 0; 
            alu_en = 0;  jump_en = 0; 
        end else if (state == LDA_3) begin // S5
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 0; 
            
            w_r = 1'b1; ram_en = 1; 
            
            reg_source = 2'b00; reg_en = 0; 
            
            ac_source = 1'bZ; ac_en = 0; 
            alu_en = 0;  jump_en = 0; 
        end else if (state == STO_4) begin // S6
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 0; 
            
            w_r = 1'b0;ram_en = 1; 

            reg_source = 2'b00; reg_en = 0;
             
            ac_source = 1'bZ;  ac_en = 0; 
           
            alu_en = 0;  jump_en = 0; 
        end else if (state == STO_3 || state == PRE_1 || state == OPERAL_3 || state == OPERAS_1 || state == JUMP_3) begin  // S7
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 0; 
            
            w_r = 1'bZ; ram_en = 0; 
            
            reg_source = 2'b00; reg_en = 1; 
            
            ac_source = 1'bZ; ac_en = 0; 
            alu_en = 0;  jump_en = 0; 
        end else if (state == LDO_4) begin  // S8
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 0; 
            
            w_r = 1'bZ; ram_en = 0; 
           
            reg_source = 2'b01;  reg_en = 1; 
            
            ac_source= 1'bZ; ac_en = 0; 
            alu_en = 0;  jump_en = 0; 
        end else if (state == LDA_4) begin  // S9
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 0; 
            
            w_r = 1'bZ; ram_en = 0; 
            
            reg_source = 2'b10; reg_en = 1; 
             
            ac_source = 1'bZ; ac_en = 0;
            alu_en = 0;  jump_en = 0; 
        end else if (state == LDM_1) begin // S10
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 0; 
            
            w_r = 1'bZ; ram_en = 0; 
            
            reg_source = 2'b11; reg_en = 1; 
            
            ac_source = 1'bZ; ac_en = 0; 
            
            alu_en = 0;  jump_en = 0; 
        end else if (state == PRE_2) begin // S11
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 0; 
            
            w_r = 1'bZ; ram_en = 0; 
            
            reg_source = 2'b00; reg_en = 0; 
            
            ac_source = 1'b0; ac_en = 1; 
            
            alu_en = 0;  jump_en = 0; 
        end else if (state == OPERAL_5 || state == OPERAS_3) begin // S12
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 0; 
            
            w_r = 1'bZ; ram_en = 0; 
            
            reg_source = 2'b00; reg_en = 0; 
            
            ac_source = 1'b1; ac_en = 1; 
            
            alu_en = 0;  jump_en = 0; 
        end else if (state == OPERAL_4 || state == OPERAS_2) begin // S13
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 0; 
            
            w_r = 1'bZ; ram_en = 0; 
            
            reg_source = 2'b00; reg_en = 0; 
            
            ac_source = 1'bZ; ac_en = 0; 
            
            alu_en = 1;  jump_en = 0;
        end else if (state == JUMP_4) begin // S14
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 0; 
            
            w_r = 1'bZ; ram_en = 0; 
            
            reg_source = 2'b00; reg_en = 0; 
            
            ac_source = 1'bZ; ac_en = 0; 
            
            alu_en = 0;  jump_en = 1; 
        end else begin
            pc_en = 0; 
            ir_en = 0; 
            rom_en = 0; 
            
            w_r = 1'bZ; ram_en = 0; 
            
            reg_source = 2'b00; reg_en = 0; 
            
            ac_source = 1'bZ; ac_en = 0; 
            
            alu_en = 0;  jump_en = 0; 
        end
    end
endmodule
