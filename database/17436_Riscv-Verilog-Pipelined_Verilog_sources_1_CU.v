// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 04:22:31 PM
// Design Name: 
// Module Name: CU
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

`define OPCODE_Branch 5'b11_000
`define OPCODE_Load 5'b00_000
`define OPCODE_Store 5'b01_000
`define OPCODE_JALR 5'b11_001
`define OPCODE_JAL 5'b11_011
`define OPCODE_Arith_I 5'b00_100
`define OPCODE_Arith_R 5'b01_100
`define OPCODE_AUIPC 5'b00_101
`define OPCODE_LUI 5'b01_101
`define OPCODE_SYSTEM 5'b11_100 
`define OPCODE_Custom 5'b10_001




module CU (
    input [31:0] inst,
    output reg Branch,
    MemRead,
    MemtoReg,
    MemWrite,
    ALUSrc,
    RegWrite,
    AUIPCsel,
    Jal,
    Jalr,
    ecall,
    output reg [1:0] ALUOp,
    output reg [2:0] branch_type
);


  always @(*) begin
    ecall = 0;
      {Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, AUIPCsel, Jal, Jalr} = 9'b000000000;
  ALUOp = 2'b00;
  branch_type = 3'b011; 
  
    //Default to no operation which accounts for FENCE and EBREAK as they will not be defined so they will be a no-op
//default to non of the implemented branches unique code 3

    case (inst[6:2])


      `OPCODE_Arith_R: begin  //R  
        Branch = 0;
        MemRead = 0;
        MemtoReg = 0;
        ALUOp = 2'b10;
        MemWrite = 0;
        ALUSrc = 0;
        RegWrite = 1;
        AUIPCsel = 0;
        {Jal, Jalr} = 2'b00;
      end
      `OPCODE_Load: begin  //load
      if(inst[1:0]!=0)begin
        Branch = 0;
        MemRead = 1;
        MemtoReg = 1;
        ALUOp = 2'b00;
        MemWrite = 0;
        ALUSrc = 1;
        RegWrite = 1;
        AUIPCsel = 0;
        {Jal, Jalr} = 2'b00;
        end 
        else begin
        Branch = 0;
        MemRead = 0;
        MemtoReg = 0;
        ALUOp = 2'b00;
        MemWrite = 0;
        ALUSrc = 0;
        RegWrite = 0;
        AUIPCsel = 0;
        {Jal, Jalr} = 2'b00;
        end

      end
      `OPCODE_Store: begin  //store
        Branch = 0;
        MemRead = 0;
        MemtoReg = 0;  //dc
        ALUOp = 2'b00;
        MemWrite = 1;
        ALUSrc = 1;
        RegWrite = 0;
        AUIPCsel = 0;
        {Jal, Jalr} = 2'b00;
      end
      `OPCODE_Branch: begin  //Branch
        Branch = 1;
        MemRead = 0;
        MemtoReg = 0;  //dc
        ALUOp = 2'b01;
        MemWrite = 0;
        ALUSrc = 0;
        RegWrite = 0;
        AUIPCsel = 0;
        {Jal, Jalr} = 2'b00;
        branch_type = inst[14:12];

      end


      `OPCODE_Arith_I: begin  //Immediate
        {Branch,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite, AUIPCsel}=9'b0_0_0_10_0_1_1_0;
        {Jal, Jalr} = 2'b00;
      end

      `OPCODE_AUIPC: begin
        Branch= 0;
        MemRead= 0;
        MemtoReg= 0;
        ALUOp= 2'b00;
        MemWrite= 0;
        ALUSrc= 1;     // ALU source is immediate (for adding to PC)
        RegWrite= 1;
        AUIPCsel = 1;
        {Jal,Jalr}=2'b00;
      end

      `OPCODE_LUI: begin
        Branch = 0;
        MemRead = 0;
        MemtoReg = 0;
        ALUOp = 2'b00;
        MemWrite = 0;
        ALUSrc = 1;
        RegWrite = 1;
        AUIPCsel = 0;
        {Jal, Jalr} = 2'b00;
      end

      `OPCODE_JAL: begin

        Branch = 1;
        MemRead = 0;
        MemtoReg = 0;
        ALUOp = 2'b00;
        MemWrite = 0;
        ALUSrc = 0;
        RegWrite = 1;
        AUIPCsel = 0;
        {Jal, Jalr} = 2'b10;

      end

      `OPCODE_JALR: begin
        Branch = 0;
        MemRead = 0;
        MemtoReg = 0;
        ALUOp = 2'b00;
        MemWrite = 0;
        ALUSrc = 1;
        RegWrite = 1;
        AUIPCsel = 0;
        {Jal, Jalr} = 2'b01;
      end



      `OPCODE_SYSTEM: begin
        // Check if this is specifically an ECALL instruction
        if (inst[31:7] == 25'b0) begin
          ecall = 1;
          Branch = 0;
          MemRead = 0;
          MemtoReg = 0;
          MemWrite = 0;
          ALUSrc = 0;
          RegWrite = 0;
          AUIPCsel = 0;
          {Jal, Jalr} = 2'b00;
        end
      end
    endcase

  end


endmodule

  //    reg [13:0]signals;
  //    always @ (*) begin
  //        case (inst[6:0])
  //            //I-format 
  //            7'b0010011 : signals = 14'b00_000_01_011_00_11;

  //            //R-format
  //            7'b0110011 : begin 
  //                          if (inst[25]) begin // I SPEC 
  //                            signals = 14'b00_000_01_100_00_01;
  //                          end 
  //                          else begin //M SPEC
  //                            signals = 14'b00_000_01_011_00_01;
  //                          end
  //                         end


  //            //Load
  //            7'b0000011 : begin 
  //                            case(inst[14:12]) 
  //                                3'b010 : signals = 14'b00_001_00_010_00_11; //LW  
  //                                3'b000 : signals = 14'b00_100_00_010_00_11; //LB 
  //                                3'b001 : signals = 14'b00_010_00_010_00_11; //LH 
  //                                3'b100 : signals = 14'b00_101_00_010_00_11; //LBU 
  //                                3'b101 : signals = 14'b00_011_00_010_00_11; //LHU  

  //                                default : signals = 14'b00_000_00_000_00_00;
  //                            endcase 
  //                         end
  //             //Store
  //            7'b0100011 : begin  
  //                            case(inst[14:12]) 

  //                                3'b010: signals = 14'b00_000_00_010_01_10;    //SW
  //                                3'b000: signals = 14'b00_000_00_010_11_10;    //SB 
  //                                3'b001: signals = 14'b00_000_00_010_10_10;    //SH

  //                                default: signals = 14'b00_000_00_000_00_00;
  //                            endcase  
  //                        end
  //           //Branch         
  //            7'b1100011 : signals = 14'b01_000_01_001_00_00;




  //            default    : signals = 14'b00_000_00_000_00_00; 

  //       endcase

  //         end