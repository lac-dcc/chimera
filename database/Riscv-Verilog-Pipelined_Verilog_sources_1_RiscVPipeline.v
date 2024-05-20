// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 03:10:07 PM
// Design Name: 
// Module Name: RiscVPipeline
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


module RiscVPipeline (input clk, rst, input [1:0] led_sel, input[3:0]SSD_sel, output reg[15:0] LED, output reg[12:0] ssd);


    wire [31:0]pc_out; 
    wire [31:0]pc_in;
    //----------------------------------------------------------------------
    wire  [31:0]Inst;
    //----------------------------------------------------------------------
    wire Branch, MemRead ,MemtoReg ,MemWrite ,ALUSrc ,RegWrite;
    wire zf;
    wire [1:0] ALUOp;

    //----------------------------------------------------------------------
    wire [3:0]ALU_selection;
    //----------------------------------------------------------------------

    wire [31:0] r_data1, r_data2;
    //----------------------------------------------------------------------
    wire [31:0] immediate, new_imm;
    //----------------------------------------------------------------------
    wire [31:0] jump_inst_sum;
    wire  jump_inst_cout;

    wire [31:0] pc_update_sum;
    wire  pc_update_cout;
    //----------------------------------------------------------------------
    wire[31:0] alu_in2;
    wire[31:0] alu_out;

    //----------------------------------------------------------------------

    wire [31:0] mem_data_out;
    wire [31:0] reg_write_data;




    //--------------------------------IF_ID------------------------------

    wire [31:0] IF_ID_INST;
    wire [31:0] IF_ID_PC;

    //--------------------------------ID_EX------------------------------
    wire ID_EX_Branch, ID_EX_MemRead ,ID_EX_MemtoReg ,ID_EX_MemWrite ,ID_EX_ALUSrc ,ID_EX_RegWrite;
    wire [1:0] ID_EX_ALUOp;
    wire [31:0] ID_EX_PC;
    wire [31:0] ID_EX_r_data1, ID_EX_r_data2, ID_EX_immediate;
    wire [31:0] ID_EX_INST;
    wire [4:0] ID_EX_INST_WriteReg;
  
  //--------------------------------EX_MEM------------------------------
     wire EX_MEM_zf;
     wire EX_MEM_MemtoReg, EX_MEM_Branch, EX_MEM_MemRead, EX_MEM_MemWrite;
     wire [31:0] EX_MEM_jump_inst_sum, EX_MEM_alu_out, EX_MEM_r_data2;
     wire [4:0] EX_MEM_INST_WriteReg;
     wire EX_MEM_RegWrite;
    //--------------------------------MEM_WB------------------------------
    wire [31:0]  MEM_WB_mem_data_out, MEM_WB_alu_out;
    wire MEM_WB_RegWrite, MEM_WB_MemtoReg;
      wire [4:0] MEM_WB_INST_WriteReg;




//-----------------------IF----------------------------------------------
    NBitReg #(32)pc(.clk(clk), .rst(rst),.Load(1), .D(pc_in),.Q(pc_out) );

    NBitReg #(64) IF_ID(.clk(clk), .rst(rst),.Load(1), .D({pc_out,Inst}),.Q({IF_ID_PC,IF_ID_INST}));

   InstMem IM(.addr(pc_out[7:2]), .data_out(Inst));
//-----------------------ID----------------------------------------------
    ImmGen immgen(.inst(IF_ID_INST), .gen_out(immediate));
                                                                                
    N_bit_RegFile#(32) nbrf(.r_addr1(IF_ID_INST[19:15]), .r_addr2(IF_ID_INST[24:20]),.w_addr(MEM_WB_INST_WriteReg), .w_data(reg_write_data),.w_en(MEM_WB_RegWrite),.clk(clk), .rst(rst), .r_data1(r_data1), .r_data2(r_data2));

    CU cu( .inst(IF_ID_INST), .Branch(Branch), .MemRead(MemRead) ,.MemtoReg(MemtoReg) ,.MemWrite(MemWrite) ,.ALUSrc(ALUSrc) ,.RegWrite(RegWrite), . ALUOp(ALUOp));
     
         
    NBitReg #(173) ID_EX(.clk(clk), .rst(rst),.Load(1),
             .D({Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,ALUOp,IF_ID_PC,r_data1,r_data2,immediate,IF_ID_INST,IF_ID_INST[11:7]}),
             .Q({ID_EX_Branch,ID_EX_MemRead,ID_EX_MemtoReg,ID_EX_MemWrite,ID_EX_ALUSrc,ID_EX_RegWrite,ID_EX_ALUOp,ID_EX_PC,ID_EX_r_data1,ID_EX_r_data2,ID_EX_immediate,ID_EX_INST,ID_EX_INST_WriteReg}) );
//-----------------------EX----------------------------------------------
    nBit_Shift_Left#(32) n_bit_shifter(.num(ID_EX_immediate), .res(new_imm));
                                    
    FullAdder #(32)fa(.a(ID_EX_PC), .b(new_imm),  .addsub(0), .c_in(0), .sum(jump_inst_sum), .c_out(jump_inst_cout)); // beq case
  
    nbit_mux #(32) mxalu(.a(ID_EX_r_data2),.b(ID_EX_immediate),.s(ID_EX_ALUSrc),.c(alu_in2)); //ALU _ MUX
   
    ALU_CU alucu(.ALUop(ID_EX_ALUOp), .inst(ID_EX_INST), .ALU_selection(ALU_selection) );
   
    N_Bit_ALU #(32) alu( .a(ID_EX_r_data1), .b(alu_in2), .sel(ALU_selection),  .zf(zf), .alu_out(alu_out) );
                                                                                                            
    NBitReg #(107) EX_MEM(.clk(clk), .rst(rst),.Load(1),
     .D({ID_EX_MemtoReg,ID_EX_Branch,ID_EX_MemRead,ID_EX_MemWrite,jump_inst_sum,zf,alu_out,ID_EX_r_data2,ID_EX_RegWrite,ID_EX_INST_WriteReg}),
     .Q({EX_MEM_MemtoReg,EX_MEM_Branch,EX_MEM_MemRead,EX_MEM_MemWrite,EX_MEM_jump_inst_sum,EX_MEM_zf,EX_MEM_alu_out,EX_MEM_r_data2,EX_MEM_RegWrite,EX_MEM_INST_WriteReg}) );

//-----------------------MEM----------------------------------------------
   //DataMem datamem ( .clk(clk),  .MemRead(EX_MEM_MemRead),  .MemWrite(EX_MEM_MemWrite), .addr(EX_MEM_alu_out[7:2]),
   //  .data_in(EX_MEM_r_data2),  .data_out(mem_data_out));
   

    nbit_mux #(32) imm_reg_mx(.a(pc_update_sum),.b(EX_MEM_jump_inst_sum),.s((EX_MEM_zf && EX_MEM_Branch)),.c(pc_in)); //PC_MUX
    
    FullAdder #(32)fa2(.a(4), .b(pc_out),  .addsub(0), .c_in(0), .sum(pc_update_sum), .c_out(pc_update_cout)); 

                                        //KAML YAD                                                             
    NBitReg #(71) MEM_WB(.clk(clk), .rst(rst),.Load(1), 
    .D({EX_MEM_RegWrite, EX_MEM_MemtoReg, mem_data_out, EX_MEM_alu_out,EX_MEM_INST_WriteReg}),
    .Q({MEM_WB_RegWrite, MEM_WB_MemtoReg, MEM_WB_mem_data_out, MEM_WB_alu_out,MEM_WB_INST_WriteReg}) );

//-----------------------WB----------------------------------------------

    nbit_mux #(32) mxwb(.a(MEM_WB_alu_out),.b(MEM_WB_mem_data_out),.s(MEM_WB_MemtoReg),.c(reg_write_data)); //WB_MUX
          
          
          
  ///------------------MEMORY-----------------------------------
  wire[5:0]addr;
  nbit_mux #(6) mem_in(.a(pc_out[7:2]),.b(EX_MEM_alu_out[7:2]),.s(EX_MEM_MemWrite|EX_MEM_MemRead),.c(addr)); //WB_MUX
  
  Memory main_mem ( .clk(clk),  .MemRead(EX_MEM_MemRead),  .MemWrite(EX_MEM_MemWrite), .addr(addr), 
   .data_in(EX_MEM_r_data2),  .data_out(mem_data_out));                                                            

endmodule