`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:00:52 12/29/2016 
// Design Name: 
// Module Name:    registers 
// Project Name: 
// Target Devices: 
// Tool versions: 
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
module decode(
input wire						clk,
input wire						rst,
input wire [31:0]               pc,
input wire [31:0]               instruction,
input wire						regwrite_flag,
input wire [4:0]                write_reg,
input wire [31:0]               write_data,
input wire                      isFlush,
input wire                      isCacheStall,
output reg [31:0]               reg1_data,
output reg [31:0]               reg2_data,
output reg signed [31:0]        reg_immediate,
output reg [31:0]               reg_instruction,
output reg [4:0]                reg_rt,
output reg [4:0]                reg_rd,
output reg [31:0]               reg_pc,
output reg [3:0]                reg_ctr_ex,
output reg [5:0]                reg_ctr_m,
output reg [1:0]                reg_ctr_wb,
output wire                     isHazard,
/* bypass interface */
input wire [4:0]                ex_write_reg,
input wire                      ex_regwrite_flag,
input wire [4:0]                mem_write_reg,
input wire                      mem_regwrite_flag,
output reg [1:0]                reg_forward_a,
output reg [1:0]                reg_forward_b,
output reg [3:0]                reg_ALUcmd,
input wire [1:0]                bht_token,
output reg [1:0]                reg_bht_token             
    );
	 
	 /* define 32 32-bit width register */
	 reg	[31:0]				registers[31:0];
	 
	 /* the CPU control signals */
	 wire                    c_regdst_flag;
     wire [1:0]              c_jump_flag;
     wire [1:0]              c_branch_flag;
     wire                    c_memread_flag;
     wire                    c_memtoReg_flag;
     wire [1:0]              c_ALUOp;
     wire                    c_memwrite_flag;
     wire                    c_ALUSrc_flag;
     wire                    c_regwrite_flag;
	 
	 /* the register indes */
	 wire [4:0]                rs;
	 wire [4:0]                rt;
	 wire [4:0]                rd;
	 integer                   index;
	 
	 assign rs = instruction[25:21];
	 assign rt = instruction[20:16];
	 assign rd = instruction[15:11];
	 
	 /* detech the Hazard of LW instruction */
	 assign isHazard = (reg_ctr_m[1] == 1'b1) && ( (reg_rt == rs) || (reg_rt == rt));
	 
	 
	 wire [1:0]                    forward_a;
	 wire [1:0]                    forward_b;
	  /* instantiate of the bypass control unit */
      bypath_ctr bypath_ctr_inst(
        .id_ex_rs(                  rs                          ),
        .id_ex_rt(                  rt                          ),
        .ex_mem_rd(                 ex_write_reg                ),
        .mem_wb_rd(                 mem_write_reg             ),
        .ex_mem_regwrite_flag(      ex_regwrite_flag               ),
        .mem_wb_regwrite_flag(      mem_regwrite_flag           ),
        .forward_a(                 forward_a                   ),
        .forward_b(                 forward_b                   )
      );
      
      /* save the registers to the next stage */
      always @(posedge clk)
      begin
        if( rst )
        begin
            reg_forward_a <= 0;
            reg_forward_b <= 0;
            reg_rt <= 0;
            reg_rd <= 0;
            reg_pc <= 0;
            reg_instruction <= 0;
            reg_immediate <= 0;
            reg1_data <= 0;
            reg2_data <= 0;
        end
        else
        begin
            if( isFlush )
            begin
                reg_forward_a <= 0;
                reg_forward_b <= 0;
                reg_rt <= 0;
                reg_rd <= 0;
                reg_pc <= 0;
                reg_instruction <= 0;
                reg_immediate <= 0;
                reg1_data <= 0;
                reg2_data <= 0;
            end
            else if( isCacheStall || isHazard )
            begin
                reg_forward_a <= reg_forward_a;
                reg_forward_b <= reg_forward_b;
                reg_rt <= reg_rt;
                reg_rd <= reg_rd;
                reg_pc <= reg_pc;
                reg_instruction <= reg_instruction;
                reg_immediate <= reg_immediate;
                reg1_data <= reg1_data;
                reg2_data <= reg2_data;
            end
            else
            begin
                reg_forward_a <= forward_a;
                reg_forward_b <= forward_b;
                reg_rd <= rd;
                if( c_jump_flag == `JUMP_JAL)
                    reg_rt <= 5'd31;
                else
                    reg_rt <= rt;
                reg_pc <= pc;
                reg_instruction <= instruction;
                reg_immediate <= instruction[15] ? {16'hFFFF, instruction[15:0]} : {16'h0, instruction[15:0]};
                /* create a bypath for reg1_data */
                if( regwrite_flag && write_reg == rs)
                    reg1_data <= write_data;
                else
                    reg1_data <= registers[rs];
                /* create a bypath for reg2_data */
                if(regwrite_flag && write_reg == rt)
                    reg2_data <= write_data;
                else
                    reg2_data <= registers[rt];
            end
        end
      end
	 
	 
	 /* write the register */
	 always @(posedge clk)
	 begin
		if( rst )
			begin
				for( index = 0; index < 32; index = index + 1)
				begin
					registers[ index ] <= 0; 
				end
			end
		else
			begin  
				if( regwrite_flag )
					registers[ write_reg ] <= write_data;
			end
	 end
	 
	 // Instantiate of the ALU_ctr
	 wire [5:0]    opcode;
	 wire [5:0]    funct;
	 wire [3:0]    ALUcmd;
	 assign opcode = instruction[31:26];
	 assign funct = instruction[5:0];
     ALU_Ctr ALU_Ctr_inst (
         .opcode(       opcode        ),
         .funct(        funct         ), 
         .ALUOp(        c_ALUOp       ), 
         .cmd(          ALUcmd        )
     );
	 
	 /* generate the CPU control signals in the decode stage */
	 CPU_Ctr CPU_Ctr_inst (
         .instruction(        instruction         ), 
         .regdst_flag(        c_regdst_flag        ), 
         .jump_flag(          c_jump_flag        ), 
         .branch_flag(        c_branch_flag        ), 
         .memread_flag(       c_memread_flag    ), 
         .memtoReg_flag(      c_memtoReg_flag    ), 
         .ALUOp(              c_ALUOp            ), 
         .memwrite_flag(      c_memwrite_flag    ), 
         .ALUSrc_flag(        c_ALUSrc_flag        ), 
         .regwrite_flag(      c_regwrite_flag    )
         );
	 /* combine and save the control signals */
	 always @(posedge clk)
	 begin
	   if( rst )
	   begin
	       reg_ctr_wb <= 0;
	       reg_ctr_m <= 0;
	       reg_ctr_ex <= 0;
	       reg_bht_token <= 0;
	       reg_ALUcmd <= 0;
	   end
	   else
	   begin
	       if( isCacheStall )
	       begin
	           reg_ctr_ex <= reg_ctr_ex;
	           reg_ctr_m <= reg_ctr_m;
	           reg_ctr_wb <= reg_ctr_wb;
	           reg_ALUcmd <= reg_ALUcmd;
	           reg_bht_token <= reg_bht_token;
	       end
	       /* clear the control signals when found the Hazard or Flush  */
	       else if( isHazard || isFlush )
	       begin
	           reg_ctr_ex <= 0;
	           reg_ctr_m <= 0;
	           reg_ctr_wb <= 0;
	           reg_ALUcmd <= 0;
	           reg_bht_token <= 0;
	       end
	       else
	       begin
	           reg_ALUcmd <= ALUcmd;
	           /* control signals for EX stage */
	           reg_ctr_ex[0] <= c_ALUSrc_flag;
	           reg_ctr_ex[2:1] <= c_ALUOp;
	           reg_ctr_ex[3] <= c_regdst_flag;
	           /* control signals for M stage */
	           reg_ctr_m[0] <= c_memwrite_flag;
	           reg_ctr_m[1] <= c_memread_flag;
	           reg_ctr_m[3:2] <= c_branch_flag;
	           reg_ctr_m[5:4] <= c_jump_flag;
	           /* control signals for WB stage */
	           reg_ctr_wb[0] <= c_memtoReg_flag;
	           reg_ctr_wb[1] <= c_regwrite_flag;
	           /* the bht_token */
	           reg_bht_token <= bht_token;
	       end
	   end
	 end


endmodule
