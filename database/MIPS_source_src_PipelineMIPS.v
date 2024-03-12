`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/01/11 19:01:08
// Design Name: 
// Module Name: PipelineMIPS
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


module PipelineMIPS(
input wire                  clk,
input wire                  rst,
output wire [31:0]          pc,
input wire [31:0]           instruction,
input wire [12:0]		    user_addr,
input wire                  user_we,
input wire [31:0]           user_din,
output wire [31:0]	         user_dout
    );
    
    /* the IF stage */
    wire [31:0]             if_reg_pc;
    wire [31:0]             if_reg_instruction;
    wire [1:0]              if_reg_bht_token;
    
    /* the ID stage */
     wire [31:0]             id_reg1_data;
     wire [31:0]             id_reg2_data;
     wire [31:0]             id_reg_immediate;
     wire [4:0]              id_reg_rt;
     wire [4:0]              id_reg_rd;
     wire [31:0]             id_reg_pc;
     wire [31:0]             id_reg_instruction;
     wire [3:0]              id_reg_ctr_ex;
     wire [5:0]              id_reg_ctr_m;
     wire [1:0]              id_reg_ctr_wb;
     wire                    isHazard;
     wire [1:0]              id_reg_forward_a;
     wire [1:0]              id_reg_forward_b;
     wire [3:0]              id_reg_ALUcmd;
     wire [1:0]              id_reg_bht_token;
     
     /* the EX stage */
     wire [31:0]             ex_reg_ALU_out;
     wire [31:0]             ex_reg_reg2_data;
     wire [4:0]              ex_reg_write_reg;
     wire [5:0]              ex_reg_ctr_m;
     wire [1:0]              ex_reg_ctr_wb;
     wire [4:0]              ex_write_reg;
     wire                    ex_regwrite_flag;
     wire [1:0]              ex_reg_bht_token;
     wire [31:0]             ex_reg_pc;
     
     
     /* the MEM stage */
     wire [31:0]             m_reg_mem_out;
     wire [31:0]             m_reg_ALU_out;
     wire [4:0]              m_reg_write_reg;
     wire [1:0]              m_reg_ctr_wb;
     wire                    isFlush;
     wire [31:0]             pc_branch;
     wire [31:0]             pc_jump;
     wire [31:0]             pc_next;
     wire                    real_token;
     wire                    jump_token;
     wire                    isCacheStall;
     wire [9:0]              bht_write_addr;
     wire                    bht_we;
     wire [33:0]             bht_din;
     
     /* the WB stage */
     wire [31:0]             wb_write_data;
     wire                    wb_regwrite_flag;
     
     assign pc = if_reg_pc;
    /* the IF stage */
    fetch fetch_inst(
        .clk(               clk                 ),
        .rst(               rst                 ),
        .instruction(       instruction         ),
        .pc_branch(         pc_branch           ),
        .pc_jump(           pc_jump             ),
        .pc_next(           pc_next             ),
        .real_token(        real_token          ),
        .jump_token(        jump_token          ),
        .isHazard(          isHazard            ),
        .isFlush(           isFlush             ),
        .isCacheStall(      isCacheStall        ),
        .reg_pc(            if_reg_pc           ),
        .reg_instruction(   if_reg_instruction  ),
        .reg_bht_token(     if_reg_bht_token    ),
        .bht_write_addr(    bht_write_addr      ),
        .bht_we(            bht_we              ),
        .bht_din(           bht_din             )
    );
    
 
    /* the ID stage */
    decode decode_inst(
        .clk(               clk                 ),
        .rst(               rst                 ),
        .pc(                if_reg_pc           ),
        .instruction(       if_reg_instruction  ),
        .regwrite_flag(     wb_regwrite_flag    ),
        .write_reg(         m_reg_write_reg     ),
        .write_data(        wb_write_data       ),
        .isFlush(           isFlush             ),
        .isCacheStall(      isCacheStall        ),
        .reg1_data(         id_reg1_data        ),
        .reg2_data(         id_reg2_data        ),
        .reg_immediate(     id_reg_immediate    ),
        .reg_instruction(   id_reg_instruction  ),
        .reg_rt(            id_reg_rt           ),
        .reg_rd(            id_reg_rd           ),
        .reg_pc(            id_reg_pc           ),
        .reg_ctr_ex(        id_reg_ctr_ex       ),
        .reg_ctr_m(         id_reg_ctr_m        ),
        .reg_ctr_wb(        id_reg_ctr_wb       ),
        .isHazard(          isHazard            ),
        .ex_write_reg(      ex_write_reg        ),
        .ex_regwrite_flag(  ex_regwrite_flag    ),
        .mem_write_reg(     ex_reg_write_reg    ),
        .mem_regwrite_flag( ex_reg_ctr_wb[1]    ),
        .reg_forward_a(     id_reg_forward_a    ),
        .reg_forward_b(     id_reg_forward_b    ),
        .reg_ALUcmd(        id_reg_ALUcmd       ),
        .bht_token(         if_reg_bht_token    ),
        .reg_bht_token(     id_reg_bht_token    )
    );
    

    /* the EX stage */
    execute execute_inst(
        .clk(               clk                 ),
        .rst(               rst                 ),
        .ctr_ex(            id_reg_ctr_ex       ),
        .ctr_m(             id_reg_ctr_m        ),
        .ctr_wb(            id_reg_ctr_wb       ),
        .pc(                id_reg_pc           ),
        .instruction(       id_reg_instruction  ),
        .reg1_data(         id_reg1_data        ),
        .reg2_data(         id_reg2_data        ),
        .immediate(         id_reg_immediate    ),
        .rt(                id_reg_rt           ),
        .rd(                id_reg_rd           ),
        .isFlush(           isFlush             ),
        .isCacheStall(      isCacheStall        ),
        .ALUcmd(            id_reg_ALUcmd       ),
        .reg_ALU_out(       ex_reg_ALU_out      ),
        .reg_reg2_data(     ex_reg_reg2_data    ),
        .reg_write_reg(     ex_reg_write_reg    ),
        .reg_ctr_m(         ex_reg_ctr_m        ),
        .reg_ctr_wb(        ex_reg_ctr_wb       ),
        .ex_mem_data(       ex_reg_ALU_out      ),
        .mem_wb_data(       wb_write_data       ),
        .forward_a(         id_reg_forward_a    ),
        .forward_b(         id_reg_forward_b    ),
        .ex_write_reg(      ex_write_reg        ),
        .ex_regwrite_flag(  ex_regwrite_flag    ),
        .bht_token(         id_reg_bht_token    ),
        .reg_bht_token(     ex_reg_bht_token    ),
        .reg_pc(            ex_reg_pc           ),
        .reg_pc_branch(     pc_branch           ),
        .reg_pc_jump(       pc_jump             ),
        .reg_pc_next(       pc_next             )
    );
    
    /* the MEM stage */
    mem     mem_inst(
        .clk(               clk                 ),
        .rst(               rst                 ),
        .ctr_m(             ex_reg_ctr_m        ),
        .ctr_wb(            ex_reg_ctr_wb       ),
        .ALU_out(           ex_reg_ALU_out      ),
        .reg2_data(         ex_reg_reg2_data    ),
        .write_reg(         ex_reg_write_reg    ),
        .reg_mem_out(       m_reg_mem_out       ),
        .reg_ALU_out(       m_reg_ALU_out       ),
        .reg_write_reg(     m_reg_write_reg     ),
        .reg_ctr_wb(        m_reg_ctr_wb        ),
        .isFlush(           isFlush             ),
        .isCacheStall(      isCacheStall        ),
        .pc(                ex_reg_pc           ),
        .pc_branch(         pc_branch           ),
        .pc_jump(           pc_jump             ),
        .real_token(        real_token          ),
        .jump_token(        jump_token          ),
        .bht_token(         ex_reg_bht_token    ),
        .bht_write_addr(    bht_write_addr      ),
        .bht_we(            bht_we              ),
        .bht_din(           bht_din             ),
        .user_addr(         user_addr           ),
        .user_we(           user_we             ),
        .user_din(          user_din            ),
        .user_dout(         user_dout           )
    );
    
    /* the WB stage */
    writeback   writeback_inst(
        .ctr_wb(            m_reg_ctr_wb        ),
        .mem_out(           m_reg_mem_out       ),
        .ALU_out(           m_reg_ALU_out       ),
        .write_data(        wb_write_data       ),
        .regwrite_flag(     wb_regwrite_flag    )       
    );
    
    
endmodule
