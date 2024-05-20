// This program was cloned from: https://github.com/DemirMahmut/RISCV_Single_Cycle_Processor
// License: MIT License

module Single_Cycle_Top(clk,rst);
    input clk,rst;
    wire [31:0] PC_Top,RD_Instr,RD1_Top,Imm_Ext_Top,ALUResult,ReadData,PCPlus4,RD2_Top,SrcB,Result,PC_Target,PC_Next;
    wire RegWrite,MemWrite,ALUSrc,PCsrc,Zero;
    wire [1:0]ImmSrc,ResultSrc;
    wire [2:0]ALUControl_Top;

    Mux Mux_PC(PCPlus4,PC_Target,PCsrc,PC_Next);

    PC_Module PC(clk,rst,PC_Top,PC_Next);

    PC_Adder PC_Adder(PC_Top,32'd4,PCPlus4);

    Instruction_Memory Instruction_Memory(rst,PC_Top,RD_Instr);

    Register_File Register_File(clk,rst,RegWrite,Result,RD_Instr[19:15],RD_Instr[24:20],RD_Instr[11:7],RD1_Top,RD2_Top);

    Sign_Extend Sign_Extend(RD_Instr,ImmSrc,Imm_Ext_Top);

    PC_Adder PC_Adder2(PC_Top,Imm_Ext_Top,PC_Target);

    Mux Mux_Register_to_ALU(RD2_Top,Imm_Ext_Top,ALUSrc,SrcB);

    ALU ALU(RD1_Top,SrcB,ALUResult,ALUControl_Top,Zero);

    Control_Unit_Top Control_Unit_Top(RD_Instr[6:0],RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,RD_Instr[14:12],RD_Instr[31:25],ALUControl_Top,Zero,PCsrc);

    Data_Memory Data_Memory(clk,rst,MemWrite,RD2_Top,ALUResult,ReadData);

    Mux_4 Mux_DataMemory_to_Register(ALUResult,ReadData,PCPlus4,ResultSrc,Result);
endmodule

module PC_Module(clk,rst,PC,PC_Next);
    input clk,rst;
    input [31:0]PC_Next;
    output [31:0]PC;
    reg [31:0]PC;

    always @(posedge clk)
    begin
        if(~rst)
            PC <= {32{1'b0}};
        else
            PC <= PC_Next;
    end
endmodule

module PC_Adder (a,b,c);

    input [31:0]a,b;
    output [31:0]c;

    assign c = a + b;
    
endmodule

module Instruction_Memory(rst,A,RD);

  input rst;
  input [31:0]A;
  output [31:0]RD;

  reg [31:0] mem [1023:0];
  
  assign RD = (~rst) ? {32{1'b0}} : mem[A[31:2]];

  initial begin
    // Memory initialization i.e. mem[0] = 32'h00000000   
  end
endmodule

module Register_File(clk,rst,WE3,WD3,A1,A2,A3,RD1,RD2);

    input clk,rst,WE3;
    input [4:0]A1,A2,A3;
    input [31:0]WD3;
    output [31:0]RD1,RD2;

    reg [31:0] Register [31:0];

    always @ (posedge clk)
    begin
        if(WE3)
            Register[A3] <= WD3;
    end

    assign RD1 = (~rst) ? 32'd0 : Register[A1];
    assign RD2 = (~rst) ? 32'd0 : Register[A2];

    initial begin
        // Register memory initialization i.e. Register[0] = 0
    end

endmodule

module Sign_Extend (In,ImmSrc,Imm_Ext);

    input [31:0]In;
    input [1:0]ImmSrc;
    output [31:0]Imm_Ext;

    assign Imm_Ext = (ImmSrc == 2'b00) ? {{20{In[31]}},In[31:20]} :
                     (ImmSrc == 2'b01) ? {{20{In[31]}},In[31:25],In[11:7]} :
                     (ImmSrc == 2'b10) ? {{20{In[31]}},In[7],In[30:25],In[11:8],1'b0} :
                                         {{12{In[31]}},In[19:12],In[20],In[30:21],1'b0} ;

endmodule

module Mux (a,b,s,c);

    input [31:0]a,b;
    input s;
    output [31:0]c;

    assign c = (~s) ? a : b ;
    
endmodule

module Mux_4 (a,b,c,s,out);
    
        input [31:0]a,b,c;
        input [1:0]s;
        output [31:0]out;
    
        assign out = (s == 2'b00) ? a :
                    (s == 2'b01) ? b :
                    (s == 2'b10) ? c :
                                32'd0 ;
    
endmodule


module ALU(A,B,Result,ALUControl,Zero);

    input [31:0]A,B;
    input [2:0]ALUControl;
    output Zero;
    output [31:0]Result;

    wire Cout;
    wire [31:0]Sum;

    assign {Cout,Sum} = (ALUControl[0] == 1'b0) ? A + B :
                                          (A + ((~B)+1)) ;
    assign Result = (ALUControl == 3'b000) ? Sum :
                    (ALUControl == 3'b001) ? Sum :
                    (ALUControl == 3'b010) ? A & B :
                    (ALUControl == 3'b011) ? A | B :
                    (ALUControl == 3'b101) ? {{31{1'b0}},(Sum[31])} : {32{1'b0}};

    assign Zero = &(~Result);

endmodule

module Control_Unit_Top(Op,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,funct3,funct7,ALUControl,Zero,PCsrc);

    input [6:0]Op,funct7;
    input [2:0]funct3;
    input Zero;
    output RegWrite,ALUSrc,MemWrite,PCsrc;
    output [1:0]ImmSrc, ResultSrc;
    output [2:0]ALUControl;

    wire [1:0]ALUOp;
    wire Jump,Branch;

    Main_Decoder Main_Decoder(
                        .Op(Op),
                        .RegWrite(RegWrite),
                        .ImmSrc(ImmSrc),
                        .ALUSrc(ALUSrc),
                        .MemWrite(MemWrite),
                        .ResultSrc(ResultSrc),
                        .Branch(Branch),
                        .ALUOp(ALUOp),
                        .Jump(Jump)
    );

    ALU_Decoder ALU_Decoder(
                            .ALUOp(ALUOp),
                            .funct3(funct3),
                            .funct7(funct7),
                            .op(Op),
                            .ALUControl(ALUControl)
    );

    assign PCsrc = ((Branch & Zero) | (Jump));

endmodule

module Data_Memory(clk,rst,WE,WD,A,RD);

    input clk,rst,WE;
    input [31:0]A,WD;
    output [31:0]RD;

    reg [31:0] mem [1023:0];

    always @ (posedge clk)
    begin
        if(WE)
            mem[A] <= WD;
    end

    assign RD = (~rst) ? 32'd0 : mem[A];

    initial begin
        // Data Memory initialization i.e. mem[0] = 0
    end

endmodule

module ALU_Decoder(ALUOp,funct3,funct7,op,ALUControl);

    input [1:0]ALUOp;
    input [2:0]funct3;
    input [6:0]funct7,op;
    output [2:0]ALUControl;

    assign ALUControl = (ALUOp == 2'b00) ? 3'b000 :
                        (ALUOp == 2'b01) ? 3'b001 :
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({op[5],funct7[5]} == 2'b11)) ? 3'b001 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({op[5],funct7[5]} != 2'b11)) ? 3'b000 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 3'b101 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b110)) ? 3'b011 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 3'b010 : 
                                                                  3'b000 ;
                                                                  
endmodule

module Main_Decoder(Op,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump);
    input [6:0]Op;
    output RegWrite,ALUSrc,MemWrite,Branch,Jump;
    output [1:0]ImmSrc,ALUOp,ResultSrc;

    assign RegWrite = (Op == 7'b0000011 | Op == 7'b0110011 | Op == 7'b0010011 | Op == 7'b1101111) ? 1'b1 :
                                                              1'b0 ;
    assign ImmSrc = (Op == 7'b0100011) ? 2'b01 : 
                    (Op == 7'b1100011) ? 2'b10 : 
                    (Op == 7'b1101111) ? 2'b11 :
                                         2'b00 ;
    assign ALUSrc = (Op == 7'b0000011 | Op == 7'b0100011 | Op == 7'b0010011) ? 1'b1 :
                                                            1'b0 ;
    assign MemWrite = (Op == 7'b0100011) ? 1'b1 :
                                           1'b0 ;
    assign ResultSrc = (Op == 7'b0000011) ? 2'b01 :
                       (Op == 7'b1101111) ? 2'b10 :
                                            2'b00 ;
    assign Branch = (Op == 7'b1100011) ? 1'b1 :
                                         1'b0 ;
    assign ALUOp = (Op == 7'b0110011 | Op == 7'b0010011) ? 2'b10 :
                   (Op == 7'b1100011) ? 2'b01 :
                                        2'b00 ;
    assign Jump = (Op == 7'b1101111) ? 1'b1 :
                                        1'b0 ;

endmodule