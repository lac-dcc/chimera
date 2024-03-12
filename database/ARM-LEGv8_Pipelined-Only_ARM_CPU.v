`timescale 1ns / 1ps

/*
    Group Members: Ralph Quinto and Warren Seto
    Lab Name: ARM LEGv8 CPU Design (Pipelined-only)
*/

module ARM_CPU
(
  input RESET,
  input CLOCK,
  input [31:0] IC,
  input [63:0] mem_data_in,
  output reg [63:0] PC,
  output [63:0] mem_address_out,
  output [63:0] mem_data_out,
  output control_memwrite_out,
  output control_memread_out
);

  always @(posedge CLOCK) begin
    if (PC === 64'bx) begin
    	PC <= 0;
   	end else if (PCSrc_wire == 1'b1) begin
      PC <= jump_PC_wire;
    end else begin
      PC <= PC + 4;
  end

  //$display("Current = %0d | Jump = %0d | Natural Next = %0d", PC, jump_PC_wire, (PC + 4));
  end

  /* Stage : Instruction Fetch */
  wire PCSrc_wire;
  wire [63:0] jump_PC_wire;
  wire [63:0] IFID_PC;
  wire [31:0] IFID_IC;
  IFID cache1 (CLOCK, PC, IC, IFID_PC, IFID_IC);


  /* Stage : Instruction Decode */
  wire [1:0] CONTROL_aluop; // EX
  wire CONTROL_alusrc; // EX
  wire CONTROL_isZeroBranch; // M
  wire CONTROL_isUnconBranch; // M
  wire CONTROL_memRead; // M
  wire CONTROL_memwrite; // M
  wire CONTROL_regwrite; // WB
  wire CONTROL_mem2reg; // WB
  ARM_Control unit1 (IFID_IC[31:21], CONTROL_aluop, CONTROL_alusrc, CONTROL_isZeroBranch, CONTROL_isUnconBranch, CONTROL_memRead, CONTROL_memwrite, CONTROL_regwrite, CONTROL_mem2reg);

  wire [4:0] reg2_wire;
  ID_Mux unit2(IFID_IC[20:16], IFID_IC[4:0], IFID_IC[28], reg2_wire);

  wire [63:0] reg1_data, reg2_data;
  wire MEMWB_regwrite;
  wire [4:0] MEMWB_write_reg;
  wire [63:0] write_reg_data;
  Registers unit3(CLOCK, IFID_IC[9:5], reg2_wire, MEMWB_write_reg, write_reg_data, MEMWB_regwrite, reg1_data, reg2_data);

  wire [63:0] sign_extend_wire;
  SignExtend unit4 (IFID_IC, sign_extend_wire);

  wire [1:0] IDEX_aluop;
  wire IDEX_alusrc;
  wire IDEX_isZeroBranch;
  wire IDEX_isUnconBranch;
  wire IDEX_memRead;
  wire IDEX_memwrite;
  wire IDEX_regwrite;
  wire IDEX_mem2reg;
  wire [63:0] IDEX_reg1_data;
  wire [63:0] IDEX_reg2_data;
  wire [63:0] IDEX_PC;
  wire [63:0] IDEX_sign_extend;
  wire [10:0] IDEX_alu_control;
  wire [4:0] IDEX_write_reg;
  IDEX cache2 (CLOCK, CONTROL_aluop, CONTROL_alusrc, CONTROL_isZeroBranch, CONTROL_isUnconBranch, CONTROL_memRead, CONTROL_memwrite, CONTROL_regwrite, CONTROL_mem2reg, IFID_PC, reg1_data, reg2_data, sign_extend_wire, IFID_IC[31:21], IFID_IC[4:0], IDEX_aluop, IDEX_alusrc, IDEX_isZeroBranch, IDEX_isUnconBranch, IDEX_memRead, IDEX_memwrite, IDEX_regwrite, IDEX_mem2reg, IDEX_PC, IDEX_reg1_data, IDEX_reg2_data, IDEX_sign_extend, IDEX_alu_control, IDEX_write_reg);


  /* Stage : Execute */
  wire [63:0] shift_left_wire;
  wire [63:0] PC_jump;
  wire jump_is_zero;
  Shift_Left unit5 (IDEX_sign_extend, shift_left_wire);
  ALU unit6 (IDEX_PC, shift_left_wire, 4'b0010, PC_jump, jump_is_zero);

  wire [3:0] alu_main_control_wire;
  wire [63:0] alu_data2_wire;
  wire alu_main_is_zero;
  wire [63:0] alu_main_result;
  ALU_Control unit7(IDEX_aluop, IDEX_alu_control, alu_main_control_wire);
  ALU_Mux mux3(IDEX_reg2_data, IDEX_sign_extend, IDEX_alusrc, alu_data2_wire);
  ALU main_alu(IDEX_reg1_data, alu_data2_wire, alu_main_control_wire, alu_main_result, alu_main_is_zero);

  wire EXMEM_isZeroBranch;
  wire EXMEM_isUnconBranch;
  wire EXMEM_regwrite;
  wire EXMEM_mem2reg;
  wire EXMEM_alu_zero;
  wire [4:0] EXMEM_write_reg;
  EXMEM cache3(CLOCK, IDEX_isZeroBranch, IDEX_isUnconBranch, IDEX_memRead, IDEX_memwrite, IDEX_regwrite, IDEX_mem2reg, PC_jump, alu_main_is_zero, alu_main_result, IDEX_reg2_data, IDEX_write_reg, EXMEM_isZeroBranch, EXMEM_isUnconBranch, control_memread_out, control_memwrite_out, EXMEM_regwrite, EXMEM_mem2reg, jump_PC_wire, EXMEM_alu_zero, mem_address_out, mem_data_out, EXMEM_write_reg);


  /* Stage : Memory */
  Branch unit8 (EXMEM_isUnconBranch, EXMEM_isZeroBranch, EXMEM_alu_zero, PCSrc_wire);

  wire MEMWB_mem2reg;
  wire [63:0] MEMWB_address;
  wire [63:0] MEMWB_read_data;
  MEMWB cache4(CLOCK, mem_address_out, mem_data_in, EXMEM_write_reg, EXMEM_regwrite, EXMEM_mem2reg, MEMWB_address, MEMWB_read_data, MEMWB_write_reg, MEMWB_regwrite, MEMWB_mem2reg);


  /* Stage : Writeback */
  WB_Mux unit9 (MEMWB_address, MEMWB_read_data, MEMWB_mem2reg, write_reg_data);
endmodule


module IFID
(
  input CLOCK,
  input [63:0] PC_in,
  input [31:0] IC_in,
  output reg [63:0] PC_out,
  output reg [31:0] IC_out
);

  always @(negedge CLOCK) begin
    PC_out <= PC_in;
    IC_out <= IC_in;
  end
endmodule


module IDEX
(
  input CLOCK,
  input [1:0] aluop_in, 	       // EX Stage
  input alusrc_in, 			         // EX Stage
  input isZeroBranch_in, 	       // M Stage
  input isUnconBranch_in, 	     // M Stage
  input memRead_in, 		         // M Stage
  input memwrite_in, 		         // M Stage
  input regwrite_in, 		         // WB Stage
  input mem2reg_in, 		         // WB Stage
  input [63:0] PC_in,
  input [63:0] regdata1_in,
  input [63:0] regdata2_in,
  input [63:0] sign_extend_in,
  input [10:0] alu_control_in,
  input [4:0] write_reg_in,
  output reg [1:0] aluop_out, 	// EX Stage
  output reg alusrc_out, 		    // EX Stage
  output reg isZeroBranch_out, 	// M Stage
  output reg isUnconBranch_out, // M Stage
  output reg memRead_out, 		  // M Stage
  output reg memwrite_out, 		  // M Stage
  output reg regwrite_out,		  // WB Stage
  output reg mem2reg_out,		    // WB Stage
  output reg [63:0] PC_out,
  output reg [63:0] regdata1_out,
  output reg [63:0] regdata2_out,
  output reg [63:0] sign_extend_out,
  output reg [10:0] alu_control_out,
  output reg [4:0] write_reg_out
);

  always @(negedge CLOCK) begin
    /* Values for EX */
    aluop_out <= aluop_in;
    alusrc_out <= alusrc_in;

    /* Values for M */
  	isZeroBranch_out <= isZeroBranch_in;
    isUnconBranch_out <= isUnconBranch_in;
  	memRead_out <= memRead_in;
 	  memwrite_out <= memwrite_in;

    /* Values for WB */
    regwrite_out <= regwrite_in;
  	mem2reg_out <= mem2reg_in;

    /* Values for all Stages */
    PC_out <= PC_in;
    regdata1_out <= regdata1_in;
    regdata2_out <= regdata2_in;

    /* Values for variable stages */
    sign_extend_out <= sign_extend_in;
  	alu_control_out <= alu_control_in;
  	write_reg_out <= write_reg_in;
  end
endmodule


module EXMEM
(
  input CLOCK,
  input isZeroBranch_in, 	// M Stage
  input isUnconBranch_in, 	// M Stage
  input memRead_in, 		// M Stage
  input memwrite_in, 		// M Stage
  input regwrite_in, 		// WB Stage
  input mem2reg_in, 		// WB Stage
  input [63:0] shifted_PC_in,
  input alu_zero_in,
  input [63:0] alu_result_in,
  input [63:0] write_data_mem_in,
  input [4:0] write_reg_in,
  output reg isZeroBranch_out, 	// M Stage
  output reg isUnconBranch_out, // M Stage
  output reg memRead_out, 		// M Stage
  output reg memwrite_out, 		// M Stage
  output reg regwrite_out,		// WB Stage
  output reg mem2reg_out,		// WB Stage
  output reg [63:0] shifted_PC_out,
  output reg alu_zero_out,
  output reg [63:0] alu_result_out,
  output reg [63:0] write_data_mem_out,
  output reg [4:0] write_reg_out
);

  always @(negedge CLOCK) begin
    /* Values for M */
  	isZeroBranch_out <= isZeroBranch_in;
    isUnconBranch_out <= isUnconBranch_in;
  	memRead_out <= memRead_in;
 	memwrite_out <= memwrite_in;

    /* Values for WB */
    regwrite_out <= regwrite_in;
  	mem2reg_out <= mem2reg_in;

    /* Values for all Stages */
    shifted_PC_out <= shifted_PC_in;
    alu_zero_out <= alu_zero_in;
    alu_result_out <= alu_result_in;
    write_data_mem_out <= write_data_mem_in;
  write_reg_out <= write_reg_in;
  end
endmodule


module MEMWB
(
  input CLOCK,
  input [63:0] mem_address_in,
  input [63:0] mem_data_in,
  input [4:0] write_reg_in,
  input regwrite_in,
  input mem2reg_in,
  output reg [63:0] mem_address_out,
  output reg [63:0] mem_data_out,
  output reg [4:0] write_reg_out,
  output reg regwrite_out,
  output reg mem2reg_out
);

  always @(negedge CLOCK) begin
    regwrite_out <= regwrite_in;
    mem2reg_out <= mem2reg_in;
    mem_address_out <= mem_address_in;
    mem_data_out <= mem_data_in;
    write_reg_out <= write_reg_in;
  end
endmodule


module Registers
(
  input CLOCK,
  input [4:0] read1,
  input [4:0] read2,
  input [4:0] writeReg,
  input [63:0] writeData,
  input CONTROL_REGWRITE,
  output reg [63:0] data1,
  output reg [63:0] data2
);

  reg [63:0] Data[31:0];

  integer initCount;

  initial begin
    for (initCount = 0; initCount < 31; initCount = initCount + 1) begin
      Data[initCount] = initCount;
    end

    Data[31] = 64'h00000000;
  end

  always @(posedge CLOCK) begin

    data1 = Data[read1];
    data2 = Data[read2];

    if (CONTROL_REGWRITE == 1'b1) begin
      Data[writeReg] = writeData;
    end

    // Debug use only
    for (initCount = 0; initCount < 32; initCount = initCount + 1) begin
      $display("REGISTER[%0d] = %0d", initCount, Data[initCount]);
    end
  end
endmodule


module IC
(
  input [63:0] PC_in,
  output reg [31:0] instruction_out
);

  reg [8:0] Data[63:0];

  initial begin
    // CBZ x31 #5 (Set PC = (5*4) = 20)
   /*
    Data[0] = 8'hb4;
    Data[1] = 8'h00;
    Data[2] = 8'h00;
    Data[3] = 8'hbf;
    /*

    // B #1 (Set PC = (1*4) = 8)
   /*
    Data[0] = 8'h14;
    Data[1] = 8'h00;
    Data[2] = 8'h00;
    Data[3] = 8'h01;
    */

  	// LDUR x2, [x9, #1]
    Data[0] = 8'hf8;
    Data[1] = 8'h40;
    Data[2] = 8'h11;
    Data[3] = 8'h22;

    // ADD x3, x10, x5
    Data[4] = 8'h8b;
    Data[5] = 8'h05;
    Data[6] = 8'h01;
    Data[7] = 8'h43;

    // SUB x4, x10, x5
    Data[8] = 8'hcb;
    Data[9] = 8'h05;
    Data[10] = 8'h01;
    Data[11] = 8'h44;

    // ORR x5, x30, x10
    Data[12] = 8'haa;
    Data[13] = 8'h0a;
    Data[14] = 8'h03;
    Data[15] = 8'hc5;

    // AND x6, x30, x10
    Data[16] = 8'h8a;
    Data[17] = 8'h0a;
    Data[18] = 8'h03;
    Data[19] = 8'hc6;

    // STUR x2, [x31]
    Data[20] = 8'hf8;
    Data[21] = 8'h00;
    Data[22] = 8'h03;
    Data[23] = 8'he2;

  end

  always @(PC_in) begin
    instruction_out[8:0] = Data[PC_in + 3];
    instruction_out[16:8] = Data[PC_in + 2];
    instruction_out[24:16] = Data[PC_in + 1];
    instruction_out[31:24] = Data[PC_in];
  end
endmodule


module Data_Memory
(
  input [63:0] inputAddress,
  input [63:0] inputData,
  input CONTROL_MemWrite,
  input CONTROL_MemRead,
  output reg [63:0] outputData
);

  reg [63:0] Data[31:0];

  integer initCount;

  initial begin
    for (initCount = 0; initCount < 32; initCount = initCount + 1) begin
      Data[initCount] = initCount * 100;
    end

   Data[10] = 1540;
   Data[11] = 2117;
  end

    always @(*) begin
      if (CONTROL_MemWrite == 1'b1) begin
        Data[inputAddress] = inputData;
      end else if (CONTROL_MemRead == 1'b1) begin
        outputData = Data[inputAddress];
      end else begin
        outputData = 64'hxxxxxxxx;
      end

      // Debug use only
      for (initCount = 0; initCount < 32; initCount = initCount + 1) begin
        $display("RAM[%0d] = %0d", initCount, Data[initCount]);
      end
    end
endmodule


module ALU
(
  input [63:0] A,
  input [63:0] B,
  input [3:0] CONTROL,
  output reg [63:0] RESULT,
  output reg ZEROFLAG
);

  always @(*) begin
    case (CONTROL)
      4'b0000 : RESULT = A & B;
      4'b0001 : RESULT = A | B;
      4'b0010 : RESULT = A + B;
      4'b0110 : RESULT = A - B;
      4'b0111 : RESULT = B;
      4'b1100 : RESULT = ~(A | B);
      default : RESULT = 64'hxxxxxxxx;
    endcase

    if (RESULT == 0) begin
      ZEROFLAG = 1'b1;
    end else if (RESULT != 0) begin
      ZEROFLAG = 1'b0;
    end else begin
      ZEROFLAG = 1'bx;
    end
  end
endmodule


module ALU_Control
(
  input [1:0] ALU_Op,
  input [10:0] ALU_INSTRUCTION,
  output reg [3:0] ALU_Out
);

  always @(ALU_Op or ALU_INSTRUCTION) begin
    case (ALU_Op)
      2'b00 : ALU_Out = 4'b0010;
      2'b01 : ALU_Out = 4'b0111;
      2'b10 : begin

        case (ALU_INSTRUCTION)
          11'b10001011000 : ALU_Out = 4'b0010; // ADD
          11'b11001011000 : ALU_Out = 4'b0110; // SUB
          11'b10001010000 : ALU_Out = 4'b0000; // AND
          11'b10101010000 : ALU_Out = 4'b0001; // ORR
        endcase
      end
      default : ALU_Out = 4'bxxxx;
    endcase
  end
endmodule


module ALU_Mux
(
  input [63:0] input1,
  input [63:0] input2,
  input CONTROL_ALUSRC,
  output reg [63:0] out
);

  always @(input1, input2, CONTROL_ALUSRC, out) begin
    if (CONTROL_ALUSRC == 0) begin
      out <= input1;
    end

    else begin
      out <= input2;
    end
  end
endmodule


module ID_Mux
(
  input [4:0] read1_in,
  input [4:0] read2_in,
  input reg2loc_in,
  output reg [4:0] reg_out
);

  always @(read1_in, read2_in, reg2loc_in) begin
    case (reg2loc_in)
        1'b0 : begin
            reg_out <= read1_in;
        end
        1'b1 : begin
            reg_out <= read2_in;
        end
        default : begin
            reg_out <= 1'bx;
        end
    endcase
  end
endmodule


module WB_Mux
(
  input [63:0] input1,
  input [63:0] input2,
  input mem2reg_control,
  output reg [63:0] out
);

  always @(*) begin
    if (mem2reg_control == 0) begin
      out <= input1;
    end

    else begin
      out <= input2;
    end
  end
endmodule


module Shift_Left
(
  input [63:0] data_in,
  output reg [63:0] data_out
);

  always @(data_in) begin
    data_out = data_in << 2;
  end
endmodule


module SignExtend
(
  input [31:0] inputInstruction,
  output reg [63:0] outImmediate
);

  always @(inputInstruction) begin
    if (inputInstruction[31:26] == 6'b000101) begin // B
      outImmediate[25:0] = inputInstruction[25:0];
      outImmediate[63:26] = {64{outImmediate[25]}};

    end else if (inputInstruction[31:24] == 8'b10110100) begin // CBZ
      outImmediate[19:0] = inputInstruction[23:5];
      outImmediate[63:20] = {64{outImmediate[19]}};

    end else begin // D Type, ignored if R type
      outImmediate[9:0] = inputInstruction[20:12];
      outImmediate[63:10] = {64{outImmediate[9]}};
    end
  end
endmodule


module Branch
(
  input unconditional_branch_in,
  input conditional_branch_in,
  input alu_main_is_zero,
  output reg PC_src_out
);

  reg conditional_branch_temp;

  always @(unconditional_branch_in, conditional_branch_in, alu_main_is_zero) begin
    conditional_branch_temp = conditional_branch_in & alu_main_is_zero;
    PC_src_out = unconditional_branch_in | conditional_branch_temp;
  end
endmodule


module ARM_Control
(
  input [10:0] instruction,
  output reg [1:0] control_aluop,
  output reg control_alusrc,
  output reg control_isZeroBranch,
  output reg control_isUnconBranch,
  output reg control_memRead,
  output reg control_memwrite,
  output reg control_regwrite,
  output reg control_mem2reg
);

  always @(instruction) begin
    /* B */
    if (instruction[10:5] == 6'b000101) begin
      control_mem2reg <= 1'bx;
      control_memRead <= 1'b0;
      control_memwrite <= 1'b0;
      control_alusrc <= 1'b0;
      control_aluop <= 2'b01;
      control_isZeroBranch <= 1'b0;
      control_isUnconBranch <= 1'b1;
      control_regwrite <= 1'b0;
    end

    /* CBZ */
    else if (instruction[10:3] == 8'b10110100) begin
      control_mem2reg <= 1'bx;
      control_memRead <= 1'b0;
      control_memwrite <= 1'b0;
      control_alusrc <= 1'b0;
      control_aluop <= 2'b01;
      control_isZeroBranch <= 1'b1;
      control_isUnconBranch <= 1'b0;
      control_regwrite <= 1'b0;
    end

    /* R-Type Instructions */
    else begin
      control_isZeroBranch <= 1'b0;
      control_isUnconBranch <= 1'b0;

      case (instruction[10:0])

        /* LDUR */
        11'b11111000010 : begin
          control_mem2reg <= 1'b1;
          control_memRead <= 1'b1;
          control_memwrite <= 1'b0;
          control_alusrc <= 1'b1;
          control_aluop <= 2'b00;
          control_regwrite <= 1'b1;
        end

        /* STUR */
        11'b11111000000 : begin
          control_mem2reg <= 1'bx;
          control_memRead <= 1'b0;
          control_memwrite <= 1'b1;
          control_alusrc <= 1'b1;
          control_aluop <= 2'b00;
          control_regwrite <= 1'b0;
        end

        /* ADD */
        11'b10001011000 : begin
          control_mem2reg <= 1'b0;
          control_memRead <= 1'b0;
          control_memwrite <= 1'b0;
          control_alusrc <= 1'b0;
          control_aluop <= 2'b10;
          control_regwrite <= 1'b1;
        end

        /* SUB */
        11'b11001011000 : begin
          control_mem2reg <= 1'b0;
          control_memRead <= 1'b0;
          control_memwrite <= 1'b0;
          control_alusrc <= 1'b0;
          control_aluop <= 2'b10;
          control_regwrite <= 1'b1;
        end

        /* AND */
        11'b10001010000 : begin
          control_mem2reg <= 1'b0;
          control_memRead <= 1'b0;
          control_memwrite <= 1'b0;
          control_alusrc <= 1'b0;
          control_aluop <= 2'b10;
          control_regwrite <= 1'b1;
        end

        /* ORR */
        11'b10101010000 : begin
          control_mem2reg <= 1'b0;
          control_memRead <= 1'b0;
          control_memwrite <= 1'b0;
          control_alusrc <= 1'b0;
          control_aluop <= 2'b10;
          control_regwrite <= 1'b1;
        end

        default : begin
          control_isZeroBranch <= 1'bx;
      	  control_isUnconBranch <= 1'bx;
          control_mem2reg <= 1'bx;
          control_memRead <= 1'bx;
          control_memwrite <= 1'bx;
          control_alusrc <= 1'bx;
          control_aluop <= 2'bxx;
          control_regwrite <= 1'bx;
        end
      endcase
    end
  end
endmodule
