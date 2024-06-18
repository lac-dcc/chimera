// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2023 04:58:47 PM
// Design Name: 
// Module Name: Data_Path
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


module datapath(
        input rst, clk, JumpD, BranchD, MemWriteD, ALUSrcD, RegWriteD, WD3_SrcD, StallF, StallD, FlushD, FlushE,
        input[1:0] ResultSrcD, ForwardAE, ForwardBE,
        input [2:0] Imm_SrcD,
        input [2:0]ALUControlD,
        
        output [6:0] OP ,funct7 ,
        output [2:0] funct3,
        output [4:0] A1, A2, RdE, RdM, RdW, Rs1E, Rs2E,
        output [1:0] PCSrcE, ResultSrcE, 
        output RegWriteM, RegWriteW
    );

        wire [31:0] RD1, RD2, RD1E, RD2E, ALUResult, ALUResultM, A, ALUResultW, WriteDataM, WriteDataE, ZeroE
        , ExtImmD, ExtImmE, ExtImmM, ExtImmW, SrcAE, SrcBE, ResultW, instructionD, PCPlus4F, PCPlus4E, PCPlus4M,
        PCPlus4W, PCPlus4D, PCTargetE, PCnext, PCF, PCE, PCD, ReadData, ReadDataW, RD, instruction, WD3, OUTWD3, WD
        ,JumpE, BranchE;
        wire ALUSrcE, MemWriteE, MemWriteM, RegWriteE, WE3, WE;
        wire [24:0] Imm;
        wire [1:0] ResultSrcM, ResultSrcW;
        wire [2:0] ALUControlE, funct3E;
        wire [4:0] A3;
        wire [6:0] OPE;
        
        mux_SrcBE1 muxb1(
                .RD2E(RD2E), 
                .ResultW(ResultW), 
                .ALUResultM(ALUResultM), 
                .ForwardBE(ForwardBE), 
                .WriteDataE(WriteDataE)
        );
        
        mux_SrcBE2 muxb2(
                 .WriteDataE(WriteDataE), 
                 .ExtImmE(ExtImmE), 
                 .ALUSrcE(ALUSrcE), 
                 .SrcBE(SrcBE)
        );
        
        mux_SrcAE muxa(
                .RD1E(RD1E), 
                .ResultW(ResultW), 
                .ALUResultM(ALUResultM), 
                .ForwardAE(ForwardAE), 
                .SrcAE(SrcAE)
        );
        
        Instruction_Fetch fetch ( 
                .instructionD(instructionD), 
                .A1(A1), 
                .A2(A2), 
                .A3(A3), 
                .OP(OP), 
                .funct3(funct3), 
                .Imm(Imm), 
                .funct7(funct7)
        );
        
        pc_mux muxpc (
                .PCPlus4F(PCPlus4F), 
                .PCTargetE(PCTargetE), 
                .ALUResultM(ALUResult), 
                .PCSrcE(PCSrcE), 
                .PCnext(PCnext)
        );
        
        PCPlus4_adder pc4add(
                .PCF(PCF),
                .PCPlus4F(PCPlus4F)
        );
        
        PCTarget_adder pcimmadd(
                .PCE(PCE), 
                .ExtImmE(ExtImmE), 
                .PCTargetE(PCTargetE)
        );
        
        reglayer_four lay4 (
                .ALUResultM(ALUResultM), 
                .ReadData(ReadData), 
                .PCPlus4M(PCPlus4M), 
                .RdM(RdM), 
                .rst(rst), 
                .clk(clk), 
                .RegWriteM(RegWriteM), 
                .ResultSrcM(ResultSrcM), 
                .ExtImmM(ExtImmM), 
                .ALUResultW(ALUResultW),
                        
                .ReadDataW(ReadDataW),
                .PCPlus4W(PCPlus4W), 
                .RdW(RdW), 
                .ResultSrcW(ResultSrcW), 
                .RegWriteW(RegWriteW), 
                .ExtImmW(ExtImmW)
        );
        
        Instruction_Memory instmeme (
                .A(PCF),
                .rst(rst), 
                .RD(instruction)
        );
        
        reglayer_three lay3(
                .WriteDataE(WriteDataE), 
                .ALUResult(ALUResult), 
                .PCPlus4E(PCPlus4E), 
                .RdE(RdE), 
                .clk(clk), 
                .rst(rst), 
                .RegWriteE(RegWriteE), 
                .MemWriteE(MemWriteE), 
                .ResultSrcE(ResultSrcE),
                .ExtImmE(ExtImmE),
                .ALUResultM(ALUResultM), 
                .WriteDataM(WriteDataM), 
                .PCPlus4M(PCPlus4M), 
                .RdM(RdM), 
                .RegWriteM(RegWriteM), 
                .MemWriteM(MemWriteM), 
                .ResultSrcM(ResultSrcM), 
                .ExtImmM(ExtImmM)
        );
        
        
        Register_File regf (
                .A1(A1), 
                .A2(A2), 
                .A3(RdW), 
                .WD3(ResultW), 
                .clk(clk), 
                .WE3(RegWriteW), 
                .rst(rst), 
                .RD1(RD1), 
                .RD2(RD2)
        );
        
        result_mux resmux(
                .ALUResultW(ALUResultW), 
                .ReadDataW(ReadDataW), 
                .PCPlus4W(PCPlus4W), 
                .ExtImmW(ExtImmW), 
                .ResultSrcW(ResultSrcW), 
                .ResultW(ResultW)
      );
        
        alu aluuuu(
                .SrcAE(SrcAE),
                .SrcBE(SrcBE), 
                .ALUControlE(ALUControlE), 
                .funct3E(funct3E), 
                .ALUResult(ALUResult), 
                .ZeroE(ZeroE)
        );
        
        Data_Memory datameme (
                .WD(WriteDataM), 
                .A(ALUResultM), 
                .clk(clk), 
                .WE(MemWriteM), 
                .rst(rst), 
                .RD(ReadData)
         );
        
        reglayer_one lay1(
                .rst(rst), 
                .clk(clk), 
                .StallD(StallD), 
                .FlushD(FlushD), 
                .instruction(instruction), 
                .PCF(PCF), 
                .PCPlus4F(PCPlus4F), 
                .instructionD(instructionD), 
                .PCD(PCD), 
                .PCPlus4D(PCPlus4D)
         );
        
        Adress_Generator pcgen (
                .rst(rst),
                .clk(clk), 
                .StallF(StallF),
                .PCnext(PCnext), 
                .PCF(PCF)
         );
        
        sign_ext siext(
                .Imm_SrcD(Imm_SrcD), 
                .Imm(Imm), 
                .ExtImmD(ExtImmD)
        );
        //WD3_mux muxbewd3(.PCPlus4D(PCPlus4D), .ResultW(ResultW), .WD3_SrcD(WD3_SrcD), .OUTWD3(OUTWD3));
        
        reglayer_two lay2(
                .OPD(OP),
                .OPE(OPE),
                .PCD(PCD), 
                .ExtImmD(ExtImmD), 
                .PCPlus4D(PCPlus4D), 
                .RD1(RD1), 
                .RD2(RD2), 
                .A3(A3), 
                .A1(A1), 
                .A2(A2), 
                .funct3(funct3), 
                .rst(rst), 
                .clk(clk), 
                .RegWriteD(RegWriteD),
        
                .MemWriteD(MemWriteD), 
                .JumpD(JumpD), 
                .BranchD(BranchD), 
                .ALUSrcD(ALUSrcD), 
                .ZeroE(ZeroE), 
                .FlushE(FlushE), 
                .ResultSrcD(ResultSrcD), 
                .ALUControlD(ALUControlD), 
                .RegWriteE(RegWriteE), 
                .MemWriteE(MemWriteE), 
                .JumpE(JumpE), 
                .BranchE(BranchE), 
                .ALUSrcE(ALUSrcE),
        
                .PCSrcE(PCSrcE), 
                .ResultSrcE(ResultSrcE), 
                .ALUControlE(ALUControlE), 
                .PCE(PCE), 
                .ExtImmE(ExtImmE), 
                .PCPlus4E(PCPlus4E), 
                .RD1E(RD1E), 
                .RD2E(RD2E), 
                .funct3E(funct3E), 
                .RdE(RdE), 
                .Rs1E(Rs1E), 
                .Rs2E(Rs2E)
       );
endmodule

module mux_SrcAE(input [31:0] RD1E, ResultW, ALUResultM,input [1:0] ForwardAE, output [31:0] SrcAE);
    assign SrcAE = (ForwardAE==2'b00) ? RD1E : (ForwardAE==2'b01) ? ResultW : ALUResultM;
endmodule

module mux_SrcBE1(input [31:0] RD2E, ResultW, ALUResultM,input [1:0] ForwardBE, output [31:0] WriteDataE);
    assign WriteDataE = (ForwardBE==2'b00) ? RD2E : (ForwardBE==2'b01) ? ResultW : ALUResultM;
endmodule


module mux_SrcBE2(input [31:0] WriteDataE, ExtImmE, input ALUSrcE, output [31:0] SrcBE);
     assign SrcBE = ALUSrcE ?  ExtImmE:WriteDataE;
endmodule



module Instruction_Fetch (
    input [31:0] instructionD,
    output reg [4:0] A1,A2,A3,
    output reg [6:0] OP,
    output reg [2:0] funct3,
    output reg [24:0] Imm,
    output reg [6:0] funct7
);
    always @(*) begin
        A1 <= instructionD[19:15];
        A2 <= instructionD[24:20];
        A3 <= instructionD[11:7];
        OP <= instructionD[6:0];
        funct3 <= instructionD[14:12];
        Imm <= instructionD[31:7];
        funct7 <= instructionD[31:25];
    end
endmodule

module pc_mux (input  [31:0] PCPlus4F,PCTargetE,ALUResultM,input  [1:0] PCSrcE,output [31:0] PCnext);
     assign PCnext = (PCSrcE==2'b00)?PCPlus4F:(PCSrcE==2'b01)?PCTargetE:ALUResultM;
endmodule


module PCPlus4_adder(input[31:0]PCF,output[31:0]PCPlus4F);
    assign PCPlus4F = PCF + 32'd4;
endmodule

module PCTarget_adder(input[31:0]PCE,ExtImmE,output[31:0]PCTargetE);
    assign PCTargetE = PCE + ExtImmE;
endmodule


module reglayer_four (
    input      [31:0] ALUResultM,
    input      [31:0] ReadData,
    input      [31:0] PCPlus4M,
    input      [4:0]  RdM,
    input             rst,
    input             clk,
    input             RegWriteM,
    input      [1:0]  ResultSrcM,
    input      [31:0] ExtImmM,
    output reg [31:0] ALUResultW,
    output reg [31:0] ReadDataW,
    output reg [31:0] PCPlus4W,
    output reg [4:0]  RdW,
    output reg [1:0]  ResultSrcW,
    output reg        RegWriteW,
    output reg [31:0] ExtImmW
);
    always @(posedge clk) begin
        if(rst) begin
            ALUResultW <= 32'd0;
            ReadDataW  <= 32'd0;
            PCPlus4W   <= 32'd0;
            RdW        <= 5'd0;
            ResultSrcW <= 2'd0;
            RegWriteW  <= 0; 
            ExtImmW <= 32'd0;
        end
        else begin
            ALUResultW <= ALUResultM;
            ReadDataW  <= ReadData;
            PCPlus4W   <= PCPlus4M;
            RdW        <= RdM;
            ResultSrcW <= ResultSrcM;
            RegWriteW  <= RegWriteM; 
            ExtImmW <= ExtImmM;
        end

    end
    
endmodule


module reglayer_three (
    input      [31:0] WriteDataE,
    input      [31:0] ALUResult,
    input      [31:0] PCPlus4E,
    input      [4:0]  RdE,
    input             clk,
    input             rst,
    input             RegWriteE,
    input             MemWriteE,
    input      [1:0]  ResultSrcE,
    input      [31:0] ExtImmE,
    output reg [31:0] ALUResultM,
    output reg [31:0] WriteDataM,
    output reg [31:0] PCPlus4M,
    output reg [4:0]  RdM,
    output reg        RegWriteM,
    output reg        MemWriteM,
    output reg [1:0]  ResultSrcM,
    output reg [31:0] ExtImmM
);
    always @(posedge clk) begin
        if (rst) begin
           RegWriteM  <= 0;
           MemWriteM  <= 0;
           ResultSrcM <= 2'b00;
           ALUResultM <= 32'd0;
           WriteDataM <= 32'd0;
           RdM        <= 5'd0;
           PCPlus4M   <= 32'd0;
           ExtImmM <= 32'd0;
        end
        else begin
           RegWriteM  <= RegWriteE;
           MemWriteM  <= MemWriteE;
           ResultSrcM <= ResultSrcE;
           ALUResultM <= ALUResult;
           WriteDataM <= WriteDataE;
           RdM        <= RdE;
           PCPlus4M   <= PCPlus4E;
           ExtImmM <= ExtImmE;
        end
    end
    
endmodule

module result_mux (input  [31:0] ALUResultW, ReadDataW, PCPlus4W,ExtImmW,input  [1:0] ResultSrcW,output [31:0] ResultW);
     assign ResultW = (ResultSrcW==2'b00)?ALUResultW:(ResultSrcW==2'b01)?ReadDataW:(ResultSrcW==2'b10)?PCPlus4W:ExtImmW;
endmodule

module alu(
           input [31:0] SrcAE,SrcBE,  // ALU 32-bit Inputs
           input [2:0] ALUControlE,// ALU Selection
           input [2:0] funct3E,
           output[31:0] ALUResult, // ALU 32-bit Output
       output reg ZeroE  // Zero Flag
    );
    reg [31:0] ALU_Result;
    wire [32:0] tmp;
    assign ALUResult = ALU_Result; // ALU out
    assign tmp = {1'b0,SrcAE} + {1'b0,SrcBE};
  //assign Zero = (ALU_Result == 0);  // Zero Flag ALU_Result
  always @(*)
  begin
     case(funct3E)
     3'b000: ZeroE <= SrcAE == SrcBE; //beq
     3'b001: ZeroE <=  SrcAE != SrcBE; //bne
     3'b100: ZeroE <=  $signed(SrcAE) < $signed(SrcBE); //blt
     3'b101: ZeroE <=  $signed(SrcAE) > $signed(SrcBE); //bge
     default : ZeroE <= 0;
     endcase
  end
    always @(*)
    begin
        case(ALUControlE)
        3'b000: ALU_Result = SrcAE + SrcBE ;
        3'b001: ALU_Result= SrcAE - SrcBE ;
        3'b010: ALU_Result = SrcAE & SrcBE;
        3'b011: ALU_Result = SrcAE | SrcBE;
        3'b100: ALU_Result = ($signed(SrcAE)<$signed(SrcBE))?32'd1:32'd0;
        3'b101: ALU_Result = SrcAE ^ SrcBE;
        default: ALU_Result = SrcAE + SrcBE;
        endcase
    end
endmodule

module reglayer_one(input rst,clk,StallD,FlushD,input [31:0] instruction,PCF,PCPlus4F,
output reg [31:0] instructionD,PCD,PCPlus4D);
    always @(posedge clk) begin
        if (rst)begin
            PCD <= 32'd0;
            instructionD <= 32'd0;
            PCPlus4D <= 32'd0;
        end
        else if(StallD)begin
            PCD <= PCD;
            instructionD <= instructionD;
            PCPlus4D <= PCPlus4D;
        end
        else if(FlushD)begin
            PCD <= 32'd0;
            instructionD <= 32'd0;
            PCPlus4D <= 32'd0; 
        end
        else begin
            instructionD <=instruction;
            PCD <= PCF;
            PCPlus4D <= PCPlus4F;
        end
    end 
endmodule

module Adress_Generator (
     input rst,clk,StallF,input[31:0]PCnext,
    output reg [31:0] PCF
);
    always @(posedge clk) begin
        if (rst)
            PCF <= 32'd0;
        else if(StallF)
            PCF <= PCF;
        else
            PCF <= PCnext;    
    end 
endmodule

module sign_ext (input [2:0]Imm_SrcD,input [24:0] Imm,output reg [31:0]ExtImmD);
  always@(*)
  case(Imm_SrcD)
  //I_type
  3'b000: ExtImmD={{20{Imm[24]}},Imm[24:13]};
  //S_type
  3'b001: ExtImmD = {{20{Imm[24]}}, Imm[24:18], Imm[4:0]};
  //B_type
  3'b010: ExtImmD = {{20{Imm[24]}}, Imm[0],  Imm[23:18], Imm[4:1], 1'b0};
  // u type
	3'b011: ExtImmD ={Imm[24:5],12'b000000000000};
  // j type
	3'b100: ExtImmD =  {{12{Imm[24]}}, Imm[12:5],  Imm[13], Imm[23:14], 1'b0};
  default: 	ExtImmD = 32'bx; // undefined
    endcase
endmodule



module reglayer_two (
    input [31:0]      PCD, 
    input [31:0]      ExtImmD,
    input [31:0]      PCPlus4D,
    input [31:0]      RD1,
    input [31:0]      RD2,
    input [4:0]       A3,
    input [4:0]       A1,
    input [4:0]       A2,
    input [2:0]       funct3,
    input             rst,
    input             clk,
    input             RegWriteD,
    input             MemWriteD,
    input             JumpD,
    input             BranchD,
    input             ALUSrcD,
    input             ZeroE,
    input             FlushE,
    input [1:0]       ResultSrcD,
    input [2:0]       ALUControlD,
    input [6:0]       OPD,
    output reg        RegWriteE,
    output reg        MemWriteE,
    output reg        JumpE,
    output reg        BranchE,
    output reg        ALUSrcE,
    output reg [1:0]  PCSrcE,
    output reg [1:0]  ResultSrcE,
    output reg [2:0]  ALUControlE,
    output reg [31:0] PCE,
    output reg [31:0] ExtImmE,
    output reg [31:0] PCPlus4E,
    output reg [31:0] RD1E,
    output reg [31:0] RD2E,
    output reg [2:0]  funct3E,
    output reg [4:0]  RdE,
    output reg [4:0]  Rs1E,
    output reg [4:0]  Rs2E,
    output reg [6:0] OPE
);
    always @(posedge clk) begin
        if (rst) begin
            RegWriteE   <= 0;
            MemWriteE   <= 0;
            JumpE       <= 0;
            BranchE     <= 0;
            PCSrcE      <= 2'b00;
            ALUSrcE     <= 0;
            ResultSrcE  <= 2'b00;
            ALUControlE <= 3'b000;
            PCE         <= 32'd0;
            ExtImmE     <= 32'd0;
            PCPlus4E    <= 32'd0;
            RD1E        <= 32'd0;
            RD2E        <= 32'd0;
            funct3E     <= 3'd0;
            RdE         <= 5'd0;
            Rs1E        <= 5'd0;
            Rs2E        <= 5'd0;
            OPE <=7'd0;
        end
        else if (FlushE) begin
            RegWriteE   <= 0;
            MemWriteE   <= 0;
            JumpE       <= 0;
            BranchE     <= 0;
            PCSrcE      <= 2'b00;
            ALUSrcE     <= 0;
            ResultSrcE  <= 2'b00;
            ALUControlE <= 3'b000;
            PCE         <= 32'd0;
            ExtImmE     <= 32'd0;
            PCPlus4E    <= 32'd0;
            RD1E        <= 32'd0;
            RD2E        <= 32'd0;
            funct3E     <= 3'd0;
            RdE         <= 5'd0;
            Rs1E        <= 5'd0;
            Rs2E        <= 5'd0;
            OPE <=7'd0;
        end
        else begin
            RegWriteE   <= RegWriteD;
            MemWriteE   <= MemWriteD;
            JumpE       <= JumpD;
            BranchE     <= BranchD;
            ALUSrcE     <= ALUSrcD;
            ResultSrcE  <= ResultSrcD;
            ALUControlE <= ALUControlD;
            PCE         <= PCD;
            ExtImmE     <= ExtImmD;
            PCPlus4E    <= PCPlus4D;
            RD1E        <= RD1;
            RD2E        <= RD2;
            funct3E     <= funct3;
            RdE         <= A3;//A3=RdD
            Rs1E        <= A1;//A1=Rs1D
            Rs2E        <= A2;//A1=Rs2D
            OPE <=OPD;
        end
        
    end
    
    always @(*) begin    //this is a combinational block, so block assignment should be used
        PCSrcE = ((ZeroE && BranchE) | (OPE==7'b1101111))?2'b01:(OPE==7'b1100111)?2'b10:2'b00;
    end
endmodule












