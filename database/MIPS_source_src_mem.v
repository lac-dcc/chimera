`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/01/11 16:52:30
// Design Name: 
// Module Name: mem
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

`include "macros.v"
module mem(
input wire                      clk,
input wire                      rst,
input wire [5:0]                ctr_m,
input wire [1:0]                ctr_wb,
input wire [31:0]               ALU_out,
input wire [31:0]               reg2_data,
input wire [4:0]                write_reg,
output reg [31:0]               reg_mem_out,
output reg [31:0]               reg_ALU_out,
output reg [4:0]                reg_write_reg,
output reg [1:0]                reg_ctr_wb,
output wire                     isFlush,
output wire                     isCacheStall,
input wire [31:0]               pc,
input wire signed [31:0]        pc_branch,
input wire signed [31:0]        pc_jump,
output wire                     real_token,
output wire                     jump_token,
input wire [1:0]                bht_token,
/* the bht interface */
output wire [9:0]               bht_write_addr,
output wire                     bht_we,
output wire [33:0]              bht_din,
/* user ram interface */
input wire [12:0]		         user_addr,
input wire                      user_we,
input wire [31:0]               user_din,
output wire [31:0]	             user_dout
    );
    
    wire [1:0]                  branch_flag;
    wire                        memread_flag;
    wire                        memwrite_flag;
    reg signed [31:0]           reg_pc;
    wire [31:0]                 mem_out;
    wire [1:0]                  next_token;
        
    /* the MEM operation related signals */
    assign memread_flag = ctr_m[1];
    assign memwrite_flag = ctr_m[0];
    assign branch_flag = ctr_m[3:2];
    assign jump_token = |ctr_m[5:4];
    
    /* check the real branch and jump situation */
    assign real_token =  ((branch_flag == `BRANCH_OP_BEQ) && (ALU_out == 32'h0)) || 
          ( (branch_flag == `BRANCH_OP_BNE) && (ALU_out != 32'h0) );
    
    /* set the flush signal when the real_token != bht_token */
    assign isFlush = ISFLUSH( real_token, jump_token, bht_token, pc, pc_branch, pc_jump );
    
    function ISFLUSH;
    input           real_token;
    input           jump_token;
    input [1:0]     bht_token;
    input [31:0]    pc;
    input [31:0]    pc_branch;
    input [31:0]    pc_jump;
        if( (real_token | jump_token) != bht_token[1] )
            ISFLUSH = 1;
        /* check whether the branch_pc is equal to the predict pc, it not equal, Flush and JUMP to the branch_pc */
        else if( (real_token == 1'b1) && (bht_token[1] == 1'b1) && ( pc != pc_branch))
            ISFLUSH = 1;
        /* check the jump */
        else if( (jump_token == 1'b1) && (bht_token[1] == 1'b1) && ( pc != pc_jump))
            ISFLUSH = 1;
        else
            ISFLUSH = 0;
    endfunction
    
    /* set the bht interface */
    assign bht_write_addr = reg_pc[11:2];
    assign bht_we = (branch_flag == `BRANCH_OP_BEQ) | (branch_flag == `BRANCH_OP_BNE) | jump_token;
    assign next_token = NEXT_TOKEN(bht_token, (real_token | jump_token) );
    assign bht_din = real_token ? {next_token, pc_branch} : {next_token, pc_jump};

`ifdef __BHT_DEBUG__
    /* debug the predict accuracy */
    reg [31:0]     total_cnt;
    reg [31:0]     right_cnt;
    always @(posedge clk)
    begin
        if( rst )
        begin
            total_cnt <= 0;
            right_cnt <= 0;
        end
        else
        begin
            if( bht_we )
            begin
                total_cnt <= total_cnt + 1'd1;
                if( isFlush )
                begin
                    $display("%x predict wrong(%d|%d)", bht_write_addr, right_cnt, total_cnt);
                end
                else
                begin
                    right_cnt <= right_cnt + 1'b1;
                    $display("%x predict right(%d|%d)", bht_write_addr, right_cnt, total_cnt);
                end
            end
        end
    end
`endif
    
    
    /* calculate the next state */
    function [1:0] NEXT_TOKEN;
    input [1:0] bht_token;
    input       all_real_token;
    case( bht_token )
    2'b00:  begin
                if( all_real_token )
                    NEXT_TOKEN = 2'b01;
                else
                    NEXT_TOKEN = 2'b00;
            end
    2'b01:  begin
                if( all_real_token )
                    NEXT_TOKEN = 2'b10;
                else
                    NEXT_TOKEN = 2'b00;
            end
    2'b10:  begin
                if( all_real_token )
                    NEXT_TOKEN = 2'b11;
                else
                    NEXT_TOKEN = 2'b01;
            end
    2'b11:  begin
                if( all_real_token )
                    NEXT_TOKEN = 2'b11;
                else
                    NEXT_TOKEN = 2'b10;
            end
    endcase
    endfunction
    
    //Instantiate of the SimpleCache
    SimpleCache SimpleCache_i(
        .clk(               clk             ),
        .rst(               rst             ),
        .CPU_read_en(       memread_flag    ),
        .CPU_read_dout(     mem_out     ),
        .CPU_write_en(      memwrite_flag   ),
        .CPU_write_din(     reg2_data       ),
        .CPU_addr(          ALU_out         ),
        .isCacheStall(       isCacheStall     ),
        .mem_b_we(          user_we         ),
        .mem_b_addr(        user_addr       ),
        .mem_b_din(         user_din        ),
        .mem_b_dout(        user_dout       )
    ); 
    
    /* register data to the next stage */
    always @(posedge clk)
    begin
        if( rst )
        begin
            reg_ALU_out <= 0;
            reg_write_reg <= 0;
            reg_ctr_wb <= 0;
            reg_mem_out <= 0;
            reg_pc <= 0;
        end
        else
        begin
            if( ~isCacheStall )
            begin
                if( ctr_m[5:4] == `JUMP_JAL)
                    reg_ALU_out <= reg_pc + 3'd4;
                else
                    reg_ALU_out <= ALU_out;
                reg_write_reg <= write_reg;
                reg_ctr_wb <= ctr_wb;
                reg_mem_out <= mem_out;
                reg_pc <= pc;
            end
        end
    end
endmodule
