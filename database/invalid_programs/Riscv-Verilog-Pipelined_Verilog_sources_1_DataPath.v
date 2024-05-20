// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 04:08:35 PM
// Design Name: 
// Module Name: DataPath
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
`include "defines.v"


module DataPath(input clk, rst, input [1:0] led_sel, input[3:0]SSD_sel, output reg[15:0] LED, output reg[12:0] ssd);


     wire [31:0]pc_out; 
    wire [31:0]pc_in, pc_mux1_out;
    
    //----------------------------------------------------------------------
    wire  [31:0]Inst;
    //----------------------------------------------------------------------
    wire Branch, MemRead ,MemtoReg ,MemWrite ,ALUSrc ,RegWrite, AUIPCsel; 
    wire Jal,Jalr;//Jumping-Tawfik
    wire cf, zf, vf, sf;
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
    wire[31:0] alu_in1;
    wire[31:0] alu_out;

    //----------------------------------------------------------------------

    wire [31:0] mem_data_out;
    wire [31:0] reg_write_data, RF_data_in;
    //-----------------------------system instructions--------------------------------
    wire ecall;
    wire [31:0] pc_mux2_out;
    //---------------------------------branching unit-----------------------------------
    wire branch_condition;
    wire [2:0] branch_type;


    //\\---------------------------/--------PIPELINING--------\-----------------------------//\\

    //---------------------------------------IF_ID------------------------------------------
    wire [31:0] IF_ID_INST;
    wire [31:0] IF_ID_PC;
    
    //--------------------------------------ID_EX-------------------------------------------
    wire ID_EX_Branch, ID_EX_MemRead ,ID_EX_MemtoReg ,ID_EX_MemWrite ,ID_EX_ALUSrc ,ID_EX_RegWrite, ID_EX_AUIPCsel, ID_EX_Jal, ID_EX_Jalr, ID_EX_ecall;
    wire [1:0] ID_EX_ALUOp;
    wire [2:0] ID_EX_branch_type;

    wire [31:0] ID_EX_PC, ID_EX_r_data1, ID_EX_r_data2, ID_EX_immediate, ID_EX_INST;
    wire [4:0] ID_EX_INST_WriteReg, ID_EX_Rs1, ID_EX_Rs2;




    //--------------------------------------EX_MEM-------------------------------------------
    wire EX_MEM_zf;
    wire EX_MEM_MemtoReg, EX_MEM_Branch, EX_MEM_MemRead, EX_MEM_MemWrite;
    wire [31:0] EX_MEM_jump_inst_sum, EX_MEM_alu_out, EX_MEM_r_data2;
    wire [4:0] EX_MEM_INST_WriteReg;
    wire EX_MEM_RegWrite;
    wire [31:0] EX_MEM_INST;
    

    //--------------------------------------MEM_WB-------------------------------------------
    wire [31:0]  MEM_WB_mem_data_out, MEM_WB_alu_out;
    wire MEM_WB_RegWrite, MEM_WB_MemtoReg;
    wire [4:0] MEM_WB_INST_WriteReg;




    //------------------------------------Forwarding--------------------------------------
    wire [1:0] forwardA, forwardB;
    wire [31:0] fwd_mux_out1, fwd_mux_out2;

    wire stall;

   //----------------------------Flushing-------------------------------
    wire [31:0] nop_inst = 32'b0000000_00000_00000_000_00000_0110011; //Hussein
    wire [31:0] temp_Inst; //Hussein
    wire [4:0] nop_mux2_out; //Hussein
    //EX_MEM_Branch = pcsrc or pc mux sel






  
//\\---------------------------------()--[]-Datapath-[]--()-----------------------------------//\\



//----------------------------------------IF-----------------------------------------------------
    NBitReg #(32)pc(.clk(clk), .rst(rst),.Load(!stall), .D(pc_mux2_out),.Q(pc_out));

 nbit_mux #(32) mx_pc(.a(pc_in),.b(pc_out),.s(ecall),.c(pc_mux2_out)); //PC MUX for ecall Hussein (just before the PC register)

  nbit_mux #(32) jmp_mux(.a(pc_mux1_out),.b(alu_out),.s(Jalr),.c(pc_in)); //Mux after PC_mux  to check jalr //Jumping-Tawfik    
 
  //Husssein  --- instruction flushing - part 1: fetch stage by mux to send if_id stage a nop instruction
nbit_mux #(32) nop_mux(.a(temp_Inst),.b(nop_inst),.s(EX_MEM_Branch),.c(mem_data_out)); //-- Hussein-------------------

 nbit_mux #(32) imm_reg_mx(.a({pc_update_sum}),.b({EX_MEM_jump_inst_sum}),.s((branch_condition)),.c(pc_mux1_out)); //PC_MUX
// nbit_mux #(32) imm_reg_mx(.a(pc_update_sum),.b(jump_inst_sum),.s((branch_condition)),.c(pc_mux1_out)); //PC_MUX

//  InstMem IM(.addr(pc_out[7:2]), .data_out(Inst));

    FullAdder #(32)fa2(.a(4), .b(pc_out),  .addsub(0), .c_in(0), .sum(pc_update_sum), .c_out(pc_update_cout)); // normal case

  

    NBitReg #(64) IF_ID(.clk(clk), .rst(rst),.Load(!stall), .D({pc_out,mem_data_out}),.Q({IF_ID_PC,IF_ID_INST}));
   

  

 


//------------------------------------------ID---------------------------------------------------
    
    ImmGen immgen(.IR(IF_ID_INST), .gen_out(immediate));

    N_bit_RegFile#(32) nbrf(.r_addr1(IF_ID_INST[19:15]), .r_addr2(IF_ID_INST[24:20]),.w_addr(MEM_WB_INST_WriteReg),
     .w_data(RF_data_in),.w_en(MEM_WB_RegWrite),.clk(clk), .rst(rst), .r_data1(r_data1), .r_data2(r_data2));//Jumping-Tawfik


    nbit_mux #(32) mx_RF_writedata(.a(reg_write_data),.b(IF_ID_PC+4),.s(Jal|Jalr),.c(RF_data_in)); // Write-data MUX    //Jumping-Tawfik
    
    
    CU cu( .inst(IF_ID_INST), .Branch(Branch), .MemRead(MemRead) ,.MemtoReg(MemtoReg) ,.MemWrite(MemWrite) ,.ALUSrc(ALUSrc) ,.RegWrite(RegWrite), . ALUOp(ALUOp), .AUIPCsel(AUIPCsel), .Jal(Jal),.Jalr(Jalr),.ecall(ecall),.branch_type(branch_type));//system call Hussein
   
    
    wire [14:0]signals;



                                                                            //instruction flushing - part 2: control values to be stored in the ID/EX register  (Hussein)
                                                                                               //check | or || (Hussein)
  nbit_mux #(15) hzrd_MUX(.a({Branch, MemRead, MemtoReg, MemWrite,ALUSrc, RegWrite, AUIPCsel, Jal,Jalr, ecall, ALUOp, branch_type}),
     .b(15'b0),.s(stall || EX_MEM_Branch),.c(signals)); //  Tawfik modified by Hussein

hazard_detection_unit hzrd( .IF_ID_Rs1(IF_ID_INST[19:15]), .IF_ID_Rs2(IF_ID_INST[24:20]),.ID_EX_MemRead(ID_EX_MemRead),
    .EX_MEM_MemRead (EX_MEM_MemRead),.EX_MEM_MemWrite(EX_MEM_MemWrite),.ID_EX_RegisterRd(ID_EX_INST_WriteReg),.stall(stall));



NBitReg #(190) ID_EX(.clk(clk), .rst(rst),.Load(1),
     .D({signals, IF_ID_PC,r_data1,r_data2,immediate,IF_ID_INST,IF_ID_INST[19:15],IF_ID_INST[ 24:20],IF_ID_INST[11:7]}),       
     .Q({ID_EX_Branch,ID_EX_MemRead,ID_EX_MemtoReg,ID_EX_MemWrite,ID_EX_ALUSrc,ID_EX_RegWrite,ID_EX_AUIPCsel,ID_EX_Jal,ID_EX_Jalr, ID_EX_ecall, ID_EX_ALUOp,
      ID_EX_branch_type,  ID_EX_PC,ID_EX_r_data1,ID_EX_r_data2,ID_EX_immediate,ID_EX_INST,ID_EX_Rs1,ID_EX_Rs2,ID_EX_INST_WriteReg}));  

//------------------------------------------EX-----------------------------------------------------------------
   FullAdder #(32)fa(.a(ID_EX_PC), .b(new_imm),  .addsub(0), .c_in(0), .sum(jump_inst_sum), .c_out(jump_inst_cout)); // beq case


   branch_CU branch_cu(.branch_type(ID_EX_branch_type), .branch(ID_EX_Branch), .cf(cf), .zf(zf), .sf(sf), .branch_condition(branch_condition)); //Branching unit Hussein


  nbit_mux #(32) mxAUIPCalu(.a(fwd_mux_out1), .b(ID_EX_PC), .s(ID_EX_AUIPCsel), .c(alu_in1)); //ALU_MUX for AUIPC
    nbit_mux #(32) mxalu(.a(fwd_mux_out2),.b(ID_EX_immediate),.s(ID_EX_ALUSrc),.c(alu_in2)); //ALU _ MUX
  
  
  //instruction flushing - part 3: execute stage by mux to send id_ex stage a nop instruction (Hussein) 
    nbit_mux #(5) nop_mux2(.a({ID_EX_MemtoReg,ID_EX_Branch,ID_EX_MemRead,ID_EX_MemWrite,ID_EX_RegWrite}),.b(5'b0),.s(EX_MEM_Branch),.c(nop_mux2_out)); //Hussein


    
   N_Bit_ALU #(32) alu( .a(alu_in1), .b(alu_in2), .alufn(ALU_selection), .zf(zf), .cf(cf), .vf(vf), .sf(sf), .r(alu_out) );
     

  nBit_Shift_Left#(32) n_bit_shifter(.num(ID_EX_immediate), .res(new_imm));//Can use shifter module here


    ALU_CU alucu(.ALUop(ID_EX_ALUOp), .inst(ID_EX_INST), .ALU_selection(ALU_selection) );

    NBitReg #(139) EX_MEM(.clk(clk), .rst(rst),.Load(1),
     .D({nop_mux2_out[4], nop_mux2_out[3], nop_mux2_out[2], nop_mux2_out[1],  jump_inst_sum,           zf,        alu_out,       fwd_mux_out2,      nop_mux2_out[0], ID_EX_INST_WriteReg, ID_EX_INST}),
     .Q({EX_MEM_MemtoReg,  EX_MEM_Branch,  EX_MEM_MemRead,  EX_MEM_MemWrite,  EX_MEM_jump_inst_sum,  EX_MEM_zf,  EX_MEM_alu_out,  EX_MEM_r_data2, EX_MEM_RegWrite,EX_MEM_INST_WriteReg, EX_MEM_INST}) );
 
//---------------------------------------------------------------Mem-----------------------------------------------------
   
  //Byte addressable data mem                              
  //  DataMem datamem ( .clk(clk), .fun3(EX_MEM_INST[14:12]), .MemRead(EX_MEM_MemRead),  .MemWrite(EX_MEM_MemWrite), .addr(EX_MEM_alu_out[7:0]),  .data_in(EX_MEM_r_data2),  .data_out(mem_data_out));

 
    NBitReg #(71) MEM_WB(.clk(clk), .rst(rst),.Load(1),
     .D({EX_MEM_RegWrite, EX_MEM_MemtoReg, mem_data_out, EX_MEM_alu_out,EX_MEM_INST_WriteReg}),
     .Q({MEM_WB_RegWrite, MEM_WB_MemtoReg, MEM_WB_mem_data_out, MEM_WB_alu_out,MEM_WB_INST_WriteReg}) );
                                                                        
 
//---------------------------------------------------------------WB-----------------------------------------------------
    
    
                                                        
   nbit_mux #(32) mem_alu_mx(.a(MEM_WB_alu_out),.b(MEM_WB_mem_data_out),.s(MEM_WB_MemtoReg),.c(reg_write_data)); //MEM_TO_REG MUX


    //-------------------------------------Forwarding Unit ----------------------------------------

    Forwarding_Unit Fwd_unit (
        .ID_EX_Rs1(ID_EX_Rs1),
        .ID_EX_Rs2(ID_EX_Rs2),
        .EX_MEM_RegWrite(EX_MEM_RegWrite),
        .MEM_WB_RegWrite(MEM_WB_RegWrite),
        .EX_MEM_RegisterRd(EX_MEM_INST_WriteReg),
        .MEM_WB_RegisterRd(MEM_WB_INST_WriteReg),
        .forwardA(forwardA),
        .forwardB(forwardB)
    );

    Mux4x1 #(32) fwd_mux1( .a(ID_EX_r_data1),.b(reg_write_data), .x(EX_MEM_alu_out),.y(),.s(forwardA), .c(fwd_mux_out1));
    
    Mux4x1 #(32) fwd_mux2( .a(ID_EX_r_data2),.b(reg_write_data), .x(EX_MEM_alu_out),.y(),.s(forwardB), .c(fwd_mux_out2));




//-----------------------------MEMORY------------------------------------

    wire[5:0]addr;
  nbit_mux #(6) mem_in(.a(pc_out[7:2]),.b(EX_MEM_alu_out[5:0]),.s(EX_MEM_MemWrite|EX_MEM_MemRead),.c(addr)); //WB_MUX
  
  Memory main_mem ( .clk(clk),.fun3(EX_MEM_INST[14:12]), .MemRead(EX_MEM_MemRead),  .MemWrite(EX_MEM_MemWrite), .addr(addr), 
   .data_in(EX_MEM_r_data2),  .data_out(temp_Inst)); 




endmodule

