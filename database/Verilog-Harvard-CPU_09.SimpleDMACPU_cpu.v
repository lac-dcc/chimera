// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: CPU
// Project Name: Computer organization Project 7
//////////////////////////////////////////////////////////////////////////////////
`define WORD_SIZE 16    // data and address word size
`define LATENCY 4       // memory latency

// INCLUDE files
`include "opcodes.v"

// MODULE DECLARATION
module cpu (
        input Clk, 
        input Reset_N, 

	// Instruction memory interface
        output i_readM, 
        output i_writeM, 
        output [13:0] i_address, 
        inout [63:0] i_data, 

	// Data memory interface
        output d_readM, 
        output d_writeM, 
        output [13:0] d_address, 
        inout [63:0] d_data, 
    
    // TB purpose
        output [`WORD_SIZE-1:0] num_inst, 
        output [`WORD_SIZE-1:0] output_port, 
        output is_halted,                       // 1 if the cpu is halted
        
    // DMA
        input dma_start_int, dma_end_int, BR, 
        output BG, 
        output reg cmd
);

    ///////////////////////////// Declarations and Instantiations ///////////////////////////// 
    // Register and wire declarations
    // Testbench purposes
    reg LastCycleFetch;     // asserted when an instruction was latched into the ID stage last cycle.
    reg [`WORD_SIZE-1:0] internal_num_inst;     // only show num_inst value for exactly one cycle in each instruction
    
    // Program Counter related
    reg [`WORD_SIZE-1:0] PC, nextPC;
    
    // IF/ID pipeline registers. no control signals
    reg [`WORD_SIZE-1:0] IF_ID_Inst, IF_ID_PC, IF_ID_nextPC;
    
    // ID/EX pipeline registers
    // non - control signals
    reg [`WORD_SIZE-1:0] ID_EX_RFRead1, ID_EX_RFRead2, ID_EX_SignExtendedImm, ID_EX_PC, ID_EX_nextPC;
    reg [1:0] ID_EX_RFWriteAddress;
    // control signals
    reg ID_EX_IsBranch, ID_EX_ALUSrcA, ID_EX_DataMemRead, ID_EX_DataMemWrite, ID_EX_RegWrite, ID_EX_Halt, ID_EX_RegSrc;
    reg [1:0] ID_EX_RegDst, ID_EX_ALUSrcB;
    reg [3:0] ID_EX_ALUOp;
    
    // EX/MEM pipeline registers
    // non - control signals
    reg [`WORD_SIZE-1:0] EX_MEM_RFRead2, EX_MEM_PC, EX_MEM_ALUResult;
    reg [1:0] EX_MEM_RFWriteAddress;
    // control signals
    reg EX_MEM_DataMemRead, EX_MEM_DataMemWrite, EX_MEM_RegWrite, EX_MEM_RegSrc;
    
    // MEM/WB pipeline registers
    //non - control signals
    reg [`WORD_SIZE-1:0] MEM_WB_RFRead2, MEM_WB_MemData, MEM_WB_ALUResult;
    reg [1:0] MEM_WB_RFWriteAddress;
    // control signals
    reg MEM_WB_RegWrite, MEM_WB_RegSrc;
    
    // Control signals
    wire IsBranch, IsJump, JumpType, DataMemRead, DataMemWrite, RegWrite, PCWrite, IFIDWrite, IFIDFlush, IDEXWrite, IDEXFlush, EXMEMWrite, MEMWBWrite, ALUSrcA, RegSrc, Halt, OpenPort;
    wire [1:0] RegDst, ALUSrcB;
    wire [3:0] ALUOp;
    
    // Cache access
    wire i_readC, d_readC, d_writeC;
    wire InstCacheBusy, DataCacheBusy;
    reg [`WORD_SIZE-1:0] IR, DR;    // temporary instruction register, data register
    reg [`WORD_SIZE-1:0] FetchCompletePC, MemCompleteAddr;  // Latches the most recent fetch address (PC or memory address)
    wire [`WORD_SIZE-1:0] i_address_cache, d_address_cache;
    wire [`WORD_SIZE-1:0] i_data_cache, d_data_cache;
    
    // Hazard detection
    wire BranchMisprediction, JumpMisprediction, DataHazard;
    
    // RF
    reg [`WORD_SIZE-1:0] WriteData;
    wire [`WORD_SIZE-1:0] RFRead1, RFRead2;
    
    // ALU
    reg [`WORD_SIZE-1:0] ALUin1, ALUin2;
    wire [`WORD_SIZE-1:0] ALUResult;
    wire BranchTaken;
    
    // Module instantiations
    // Control module is located at the ID stage.
    Control control (.opcode(IF_ID_Inst[15:12]),
                     .func(IF_ID_Inst[5:0]),
                     .BranchMisprediction(BranchMisprediction),
                     .JumpMisprediction(JumpMisprediction),
                     .DataHazard(DataHazard),
                     .InstCacheBusy(InstCacheBusy),
                     .DataCacheBusy(DataCacheBusy),
                     .PCWrite(PCWrite),
                     .IFIDWrite(IFIDWrite),
                     .IFIDFlush(IFIDFlush),
                     .IDEXWrite(IDEXWrite),
                     .IDEXFlush(IDEXFlush),
                     .EXMEMWrite(EXMEMWrite),
                     .MEMWBWrite(MEMWBWrite),
                     .IsBranch(IsBranch),
                     .IsJump(IsJump),
                     .JumpType(JumpType),
                     .DataMemRead(DataMemRead),
                     .DataMemWrite(DataMemWrite),
                     .RegWrite(RegWrite),
                     .RegSrc(RegSrc),
                     .ALUSrcA(ALUSrcA),
                     .Halt(Halt),
                     .OpenPort(OpenPort),
                     .RegDst(RegDst),
                     .ALUSrcB(ALUSrcB),
                     .ALUOp(ALUOp));
    
    ICache icache(.clk(Clk),
                  .reset_n(Reset_N),
                  .i_readC(i_readC),
                  .i_address(i_address_cache),
                  .i_data(i_data_cache),
                  .InstCacheBusy(InstCacheBusy),
                  .i_readM(i_readM),
                  .i_address_mem(i_address),
                  .i_data_mem(i_data));
                  
    DCache dcache(.clk(Clk),
                  .reset_n(Reset_N),
                  .d_readC(d_readC),
                  .d_writeC(d_writeC),
                  .d_address(d_address_cache),
                  .d_data(d_data_cache),
                  .DataCacheBusy(DataCacheBusy),
                  .d_readM(d_readM),
                  .d_writeM(d_writeM),
                  .d_address_mem(d_address),
                  .d_data_mem(d_data),
                  .BR(BR),
                  .BG(BG));
    
    // Hazard Detector module is located at the ID stage.
    HazardDetector hazard_detector (.inst(IF_ID_Inst), 
                                    .ID_EX_RFWriteAddress(ID_EX_RFWriteAddress),
                                    .EX_MEM_RFWriteAddress(EX_MEM_RFWriteAddress),
                                    .MEM_WB_RFWriteAddress(MEM_WB_RFWriteAddress),
                                    .ID_EX_RegWrite(ID_EX_RegWrite),
                                    .EX_MEM_RegWrite(EX_MEM_RegWrite),
                                    .MEM_WB_RegWrite(MEM_WB_RegWrite),
                                    .DataHazard(DataHazard));

    RF rf (.write(MEM_WB_RegWrite),
           .clk(Clk),
           .reset_n(Reset_N),
           .addr1(IF_ID_Inst[11:10]),
           .addr2(IF_ID_Inst[9:8]),
           .addr3(MEM_WB_RFWriteAddress),
           .data1(RFRead1),
           .data2(RFRead2),
           .data3(WriteData));
    
    ALU alu (.A(ALUin1),
             .B(ALUin2),
             .OP(ID_EX_ALUOp),
             .C(ALUResult),
             .branch_cond(BranchTaken));
    ///////////////////////////////////////////////////////////////////////////////////////////
    
    
    ///////////////////////////////////////// CPU reset /////////////////////////////////////// 
    always @(posedge Clk) begin
        if (!Reset_N) begin     // Synchronous active-low reset
            PC <= 0;
            internal_num_inst <= 0;
            
            LastCycleFetch <= 0;
            MemCompleteAddr <= `WORD_SIZE'hffff;
            FetchCompletePC <= `WORD_SIZE'hffff;
            
            cmd <= 0;
            
            IF_ID_Inst              <= `WORD_SIZE'hffff;
            IF_ID_PC                <= 0;
            IF_ID_nextPC            <= 0;
            
            ID_EX_RFWriteAddress    <= 0;
            ID_EX_PC                <= 0;
            ID_EX_nextPC            <= 0;
            ID_EX_IsBranch          <= 0;
            ID_EX_DataMemRead       <= 0;
            ID_EX_DataMemWrite      <= 0;
            ID_EX_RegWrite          <= 0;
            ID_EX_Halt              <= 0;
            
            EX_MEM_RFRead2          <= 0;
            EX_MEM_PC               <= 0;
            EX_MEM_ALUResult        <= 0;
            EX_MEM_RFWriteAddress   <= 0;
            EX_MEM_DataMemRead      <= 0;
            EX_MEM_DataMemWrite     <= 0;
            EX_MEM_RegWrite         <= 0;
            EX_MEM_RegSrc           <= 0;
            
            MEM_WB_MemData          <= 0;
            MEM_WB_RFRead2          <= 0;
            MEM_WB_RFWriteAddress   <= 0;
            MEM_WB_RegWrite         <= 0;
            MEM_WB_RegSrc           <= 0;
            MEM_WB_ALUResult        <= 0;
        end
    end
    ///////////////////////////////////////////////////////////////////////////////////////////
    
    
    /////////////////////////////// Pipeline register transfers /////////////////////////////// 
    always @(posedge Clk) begin
        if (Reset_N) begin     // Synchronous active-low reset
        // IF/ID registers
            if (IFIDWrite) begin
                IF_ID_Inst    <= IR;
                IF_ID_PC      <= PC;
                IF_ID_nextPC  <= nextPC;
            end else if (IFIDFlush) begin
                IF_ID_Inst    <= `WORD_SIZE'hffff;
                IF_ID_PC      <= 0;
                IF_ID_nextPC  <= 0;
            end
        // ID/EX registers
            if (IDEXWrite) begin
                case (RegDst)
                    2'b00: ID_EX_RFWriteAddress <= IF_ID_Inst[9:8];
                    2'b01: ID_EX_RFWriteAddress <= IF_ID_Inst[7:6];
                    2'b10: ID_EX_RFWriteAddress <= 2'b10;
                    default: begin end
                endcase
                ID_EX_SignExtendedImm   <= {{8{IF_ID_Inst[7]}}, IF_ID_Inst[7:0]};
                ID_EX_RFRead1           <= RFRead1;
                ID_EX_RFRead2           <= RFRead2;
                ID_EX_PC                <= IF_ID_PC;
                ID_EX_nextPC            <= IF_ID_nextPC;
                ID_EX_IsBranch          <= IsBranch;
                ID_EX_ALUSrcA           <= ALUSrcA;
                ID_EX_ALUSrcB           <= ALUSrcB;
                ID_EX_DataMemRead       <= DataMemRead; 
                ID_EX_DataMemWrite      <= DataMemWrite;
                ID_EX_RegWrite          <= RegWrite;
                ID_EX_RegSrc            <= RegSrc;
                ID_EX_RegDst            <= RegDst;
                ID_EX_ALUOp             <= ALUOp;
                ID_EX_Halt              <= Halt;
            end else if (IDEXFlush) begin
                ID_EX_RFWriteAddress    <= 0;
                ID_EX_PC                <= 0;
                ID_EX_nextPC            <= 0;
                ID_EX_IsBranch          <= 0;
                ID_EX_DataMemRead       <= 0;
                ID_EX_DataMemWrite      <= 0;
                ID_EX_RegWrite          <= 0;
                ID_EX_Halt              <= 0;
            end
        // EX/MEM registers
            if (EXMEMWrite) begin
                EX_MEM_RFRead2        <= ID_EX_RFRead2;
                EX_MEM_PC             <= ID_EX_PC;
                EX_MEM_ALUResult      <= ALUResult;
                EX_MEM_RFWriteAddress <= ID_EX_RFWriteAddress;
                EX_MEM_DataMemRead    <= ID_EX_DataMemRead;
                EX_MEM_DataMemWrite   <= ID_EX_DataMemWrite;
                EX_MEM_RegWrite       <= ID_EX_RegWrite;
                EX_MEM_RegSrc         <= ID_EX_RegSrc;
            end
        // MEM/WB registers
            if (MEMWBWrite) begin
                MEM_WB_MemData        <= DR;
                MEM_WB_RFRead2        <= EX_MEM_RFRead2;
                MEM_WB_RFWriteAddress <= EX_MEM_RFWriteAddress;
                MEM_WB_RegWrite       <= EX_MEM_RegWrite;
                MEM_WB_RegSrc         <= EX_MEM_RegSrc;
                MEM_WB_ALUResult      <= EX_MEM_ALUResult;
            end else begin
                MEM_WB_MemData        <= 0;
                MEM_WB_RFRead2        <= 0;
                MEM_WB_RFWriteAddress <= 0;
                MEM_WB_RegWrite       <= 0;
                MEM_WB_RegSrc         <= 0;
                MEM_WB_ALUResult      <= 0;
            end
        end
    end
    ///////////////////////////////////////////////////////////////////////////////////////////

    
    ///////////////////////////////////// Outward Signals /////////////////////////////////////
    // Only open output_port when control signal OpenPort is asserted,
    assign output_port = OpenPort ? RFRead1 : `WORD_SIZE'bz;
    
    // HLT should be serviced when it is guaranteed not to be flushed.
    assign is_halted = ID_EX_Halt;
    
    // num_inst counts the unique number of instructions that enter the ID stage.
    assign num_inst = OpenPort ? internal_num_inst : `WORD_SIZE'bz;
    always @(posedge Clk) begin
        if (IFIDWrite) begin
            internal_num_inst <= internal_num_inst + 1;
            LastCycleFetch <= 1;
        end else begin
            LastCycleFetch <= 0;
        end
    end
    always @(negedge Clk) begin
        if (LastCycleFetch && BranchMisprediction) internal_num_inst <= internal_num_inst - 1;
    end
    ///////////////////////////////////////////////////////////////////////////////////////////
    
    
    ////////////////////////////////////// Memory Access //////////////////////////////////////
    // Instruction memory access
    assign i_address_cache = PC;
    assign i_readC = (!DataHazard && !BranchMisprediction && !JumpMisprediction && FetchCompletePC!=PC) || (internal_num_inst==0);

    // i_data is immediately latched into RR at negedge clk. 
    // On the next posedge clk, the content of IR is latched into IF_ID_Inst if IF/ID write is enabled.
    // This is because IF may stall due to data memory stall. If we don't save the fetched instruction, we will lose it.
    always @(negedge Clk) begin
        if (i_readC && !InstCacheBusy) begin
            IR <= i_data_cache;
            FetchCompletePC <= i_address_cache;
        end
    end
    
    // Data memory access
    assign d_readC = (EX_MEM_DataMemRead && MemCompleteAddr!=EX_MEM_ALUResult);
    assign d_writeC = EX_MEM_DataMemWrite;
    assign d_data_cache = (EX_MEM_DataMemWrite) ? EX_MEM_RFRead2 : `WORD_SIZE'bz;
    assign d_address_cache = (EX_MEM_DataMemRead || EX_MEM_DataMemWrite) ? EX_MEM_ALUResult : `WORD_SIZE'bz;
    
    // d_data is immediately latched into DR at negedge clk. 
    // On the next posedge clk, the content of DR is latched into MEM_WB_MemData if MEM/WB write is enabled.
    always @(negedge Clk) begin
        if (d_readC && !DataCacheBusy) begin
            DR <= d_data_cache;
            MemCompleteAddr <= d_address_cache;
        end
    end
    
    // After a write, need to flush MemCompleteAddr since data at that very data may have been changed
    // (which was indeed the case during Test #20)
    always @(posedge d_writeC)
        MemCompleteAddr <= `WORD_SIZE'hffff;
    ///////////////////////////////////////////////////////////////////////////////////////////
    
    
    /////////////////////////////////////////// DMA /// ///////////////////////////////////////
    always @(posedge dma_start_int) begin
        cmd <= 1;
    end
    always @(posedge dma_end_int) begin
        cmd <= 0;
    end
    ///////////////////////////////////////////////////////////////////////////////////////////
    
    
    /////////////////////////////////////// Updating PC ///////////////////////////////////////
    // Branch mispredictions have higher priority 
    // since it is detected at the EX stage, whereas jump mispredictions are detected at the ID stage, hence being older.
    always @(*) begin
        if (ID_EX_IsBranch & BranchMisprediction) begin
            if (BranchTaken) nextPC = ID_EX_PC + 1 + ID_EX_SignExtendedImm;  // Branch should have been taken
            else nextPC = ID_EX_PC + 1;                                      // Branch shouldn't have been taken
        end else if (IsJump & JumpMisprediction) begin
            if (JumpType) nextPC = RFRead1;                     // JPR, JRL
            else nextPC = {IF_ID_PC[15:12], IF_ID_Inst[11:0]};  // JMP, JAL
        end else begin
            nextPC = PC+1;    // by the branch_predictor. Always PC+1 in the baseline model.
        end
    end
    
    // Update PC at clock posedge
    always @(posedge Clk) begin
        if (Reset_N)
            if (PCWrite) PC <= nextPC;
    end
    ///////////////////////////////////////////////////////////////////////////////////////////
    

    ////////////////////////////////////// Register File //////////////////////////////////////
    always @(*) begin
        case (MEM_WB_RegSrc)
            0: WriteData = MEM_WB_ALUResult;
            1: WriteData = MEM_WB_MemData;
            default: begin end
        endcase
    end
    ///////////////////////////////////////////////////////////////////////////////////////////


    /////////////////////////////////////////// ALU ///////////////////////////////////////////
    always @(*) begin
        case (ID_EX_ALUSrcA)
            0: ALUin1 = ID_EX_RFRead1;
            1: ALUin1 = ID_EX_PC;
        endcase
    end
    always @(*) begin
        case (ID_EX_ALUSrcB)
            0: ALUin2 = ID_EX_RFRead2;
            1: ALUin2 = ID_EX_SignExtendedImm;
            2: ALUin2 = 1;
            default: begin end
        endcase
    end
    ///////////////////////////////////////////////////////////////////////////////////////////
    
    ///////////////////////////////// Control Hazard Detection ////////////////////////////////
    assign BranchMisprediction = ID_EX_IsBranch && ((BranchTaken && ID_EX_nextPC!=ALUResult) || (!BranchTaken && ID_EX_nextPC!=ID_EX_PC+1));
    assign JumpMisprediction = IsJump && ((JumpType && RFRead1!=IF_ID_nextPC) || (!JumpType && {IF_ID_PC[15:12], IF_ID_Inst[11:0]}!=IF_ID_nextPC));
    ///////////////////////////////////////////////////////////////////////////////////////////
    
endmodule
