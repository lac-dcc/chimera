// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

module cpu(
    input clk,
    input reset,
    output [31:0] PrAddr,
    output [3:0] PrBE,
    output [31:0] PrEPC,
    input [31:0] PrRD,
    output [31:0] PrWD,
    output PrWE,
    input [7:2] HWInt
);

    wire [31:0] PC_IF, PC_ID, PC8_IF, PC8_ID, PC8_EX, PC8_MEM, PC8_WB,
                Instr_IF, Instr_ID, Instr_EX, Instr_MEM, Instr_WB,
                ALUout_EX, ALUout_MEM, ALUout_WB,
                RegData1_ID, RegData1_EX, RegData2_ID, RegData2_EX, RegData2_MEM,
                DM_RD_MEM, DM_RD_WB,
                ImmEXT_ID, ImmEXT_EX,
                epcValue_MEM,
                CP0_RD_MEM, CP0_RD_WB;
    wire [4:0]  RegA3_EX, RegA3_MEM, RegA3_WB,
                ExcCode_IF, ExcCode_ID, ExcCode_ID_To_EX, ExcCode_EX, ExcCode_EX_To_MEM, ExcCode_MEM;
    wire        IntReq_MEM, isDB_IF, isDB_ID, isDB_EX, isDB_MEM,
                Overflow_EX, Overflow_MEM, isEret_MEM;
    



//*********************************** Forward and Stall Controller Unit ***********************************************
wire [1:0] ForwardRS_ID, ForwardRT_ID, ForwardRS_EX, ForwardRT_EX, ForwardRT_MEM;
forward myForward(
    .Instr_ID(Instr_ID), .Instr_EX(Instr_EX), .Instr_MEM(Instr_MEM), .Instr_WB(Instr_WB),
    .RegA3_EX(RegA3_EX), .RegA3_MEM(RegA3_MEM), .RegA3_WB(RegA3_WB),
    .ForwardRS_ID(ForwardRS_ID), .ForwardRT_ID(ForwardRT_ID), .ForwardRS_EX(ForwardRS_EX), .ForwardRT_EX(ForwardRT_EX), .ForwardRT_MEM(ForwardRT_MEM)
);

wire PIPE_STALL, busy_EX, state_EX;
stall myStall(
    .Instr_ID(Instr_ID), .Instr_EX(Instr_EX), .Instr_MEM(Instr_MEM),
    .RegA3_EX(RegA3_EX), .RegA3_MEM(RegA3_MEM),
    .busy_EX(busy_EX), .state_EX(state_EX),
    .Stall(PIPE_STALL)
);

//*********************************************************************************************************************



//--------------------------------*** Instruction Fetch ***--------------------------------------------
    wire [31:0] pcValue_IF, npcValue_ID;
    wire [1:0] NPCOp_ID;
    wire isJump_ID;
    ifetch IF_UNIT(
        .clk(clk), .reset(reset), .WE(~PIPE_STALL), .flush(IntReq_MEM), .epc_WE(isEret_MEM),
        .NPCOp_ID(NPCOp_ID), .npcValue_ID(npcValue_ID), .epcValue_MEM(epcValue_MEM),
        .pcValue_IF(pcValue_IF), .Instr_IF(Instr_IF),
        .ExcCode_out(ExcCode_IF)
    );


/****** IF/ID Pipeline Register ******/
    pipe IF_ID_Pipe(
        .clk(clk), .reset(reset | IntReq_MEM), .WE(~PIPE_STALL),
        .Instr_in(Instr_IF),        .pc8_in(PC8_IF),    .pc_in(PC_IF),  .isDB_in(isDB_IF),
        .Instr_out(Instr_ID),       .pc8_out(PC8_ID),   .pc_out(PC_ID),  .isDB_out(isDB_ID),
        .ExcCode_in(ExcCode_IF), .ExcCode_out(ExcCode_ID)
    );
    assign PC8_IF = pcValue_IF + 32'd8;
    assign PC_IF = pcValue_IF;
    assign isDB_IF = (isJump_ID) ? 1'b1 : 1'b0;


//--------------------------------*** Instruction Decode ***--------------------------------------------
    wire [31:0] ForwardRD1_ID, ForwardRD2_ID, RegWriteData_WB;
    id ID_UNIT(
        .clk(clk), .reset(reset), .RFWr_WB(RFWr_WB),
        .Instr_ID(Instr_ID), .ForwardRD1_ID(ForwardRD1_ID), .ForwardRD2_ID(ForwardRD2_ID), .RegWriteData_WB(RegWriteData_WB),
        .PC_ID(PC_ID), .RegA3_WB(RegA3_WB),
        .NPCOp_ID(NPCOp_ID), .npcValue_ID(npcValue_ID), .RegData1_ID(RegData1_ID), .RegData2_ID(RegData2_ID), .ImmEXT_ID(ImmEXT_ID),
        .ExcCode_in(ExcCode_ID), .ExcCode_out(ExcCode_ID_To_EX), .isJump_ID(isJump_ID)
    );
    
    mux4_1 MUX_ForwardRS_ID(
        .port0(RegData1_ID), .port1(ALUout_MEM), .port2(PC8_MEM), .port3(PC8_EX),
        .Sel(ForwardRS_ID), .out(ForwardRD1_ID)
    );
    mux4_1 MUX_ForwardRT_ID(
        .port0(RegData2_ID), .port1(ALUout_MEM), .port2(PC8_MEM), .port3(PC8_EX),
        .Sel(ForwardRT_ID), .out(ForwardRD2_ID)
    );


/****** ID/EX Pipeline Register ******/
    pipe ID_EX_Pipe(
        .clk(clk), .reset(reset | PIPE_STALL | IntReq_MEM), .WE(1'b1),
        .Instr_in(Instr_ID),    .pc8_in(PC8_ID),      .RegData1_in(RegData1_ID),     .RegData2_in(RegData2_ID),     .ImmEXT_in(ImmEXT_ID),  .isDB_in(isDB_ID),
        .Instr_out(Instr_EX),   .pc8_out(PC8_EX),     .RegData1_out(RegData1_EX),    .RegData2_out(RegData2_EX),    .ImmEXT_out(ImmEXT_EX),  .isDB_out(isDB_EX),
        .ExcCode_in(ExcCode_ID_To_EX), .ExcCode_out(ExcCode_EX)
    );

//--------------------------------*** Execute ***--------------------------------------------
    wire [31:0] ForwardToALU_A_EX, ForwardToALU_B_EX;
    ex EX_UNIT(
        .clk(clk), .reset(reset), .flush(IntReq_MEM),
        .Instr_EX(Instr_EX), .ForwardToALU_A_EX(ForwardToALU_A_EX), .ForwardToALU_B_EX(ForwardToALU_B_EX), .ImmEXT_EX(ImmEXT_EX),
        .RegA3_EX(RegA3_EX), .ALUout_EX(ALUout_EX), .busy_EX(busy_EX), .state_EX(state_EX), .Overflow_EX(Overflow_EX),
        .ExcCode_in(ExcCode_EX), .ExcCode_out(ExcCode_EX_To_MEM)
    );
    
    mux4_1 MUX_ForwardRS_EX(
        .port0(RegData1_EX), .port1(RegWriteData_WB), .port2(PC8_MEM), .port3(ALUout_MEM),
        .Sel(ForwardRS_EX), .out(ForwardToALU_A_EX)
    );
    mux4_1 MUX_ForwardRT_EX(
        .port0(RegData2_EX), .port1(RegWriteData_WB), .port2(PC8_MEM), .port3(ALUout_MEM),
        .Sel(ForwardRT_EX), .out(ForwardToALU_B_EX)
    );



/****** EX/MEM Pipeline Register ******/
    pipe EX_MEM_Pipe(
        .clk(clk), .reset(reset | IntReq_MEM), .WE(1'b1),
        .Instr_in(Instr_EX),    .pc8_in(PC8_EX),      .ALUout_in(ALUout_EX),     .RegData2_in(ForwardToALU_B_EX),   .RegA3_in(RegA3_EX),    .isDB_in(isDB_EX),
        .Instr_out(Instr_MEM),  .pc8_out(PC8_MEM),    .ALUout_out(ALUout_MEM),   .RegData2_out(RegData2_MEM),       .RegA3_out(RegA3_MEM),  .isDB_out(isDB_MEM),
        .ExcCode_in(ExcCode_EX_To_MEM), .ExcCode_out(ExcCode_MEM),
        .Overflow_in(Overflow_EX), .Overflow_out(Overflow_MEM)
    );
    assign PrAddr = ALUout_MEM;


//--------------------------------*** Memory ***--------------------------------------------
    wire [31:0] ForwardToDM_WD_MEM, cp0_pcValue;
    wire [4:0] ExcCode_CP0;
    wire DMWr_MEM, CP0_Wr_MEM;
    mem MEM_UNIT(
        .clk(clk), .reset(reset), .flush(IntReq_MEM),
        .Instr_MEM(Instr_MEM), .ALUout_MEM(ALUout_MEM), .ForwardToDM_WD_MEM(ForwardToDM_WD_MEM), .PrRD(PrRD),
        .DM_RD_MEM(DM_RD_MEM), .DMWr_MEM(DMWr_MEM), .BE_MEM(PrBE), .CP0_Wr_MEM(CP0_Wr_MEM),
        .ExcCode_in(ExcCode_MEM), .ExcCode_out(ExcCode_CP0), .isEret_MEM(isEret_MEM), .Overflow_MEM(Overflow_MEM)
    );
    cp0 myCP0(
        .clk(clk), .reset(reset),
        .Din(ForwardToDM_WD_MEM), .pc(cp0_pcValue), .A1(Instr_MEM[15:11]), .A2(Instr_MEM[15:11]),
        .ExcCode(ExcCode_CP0), .HWInt(HWInt), .isDB(isDB_MEM), .isEret(isEret_MEM),
        .WE(CP0_Wr_MEM), .EXLSet(IntReq_MEM), .EXLClr(isEret_MEM),
        .Dout(CP0_RD_MEM), .epc(epcValue_MEM), .IntReq(IntReq_MEM)
    );

    
    mux4_1 MUX_ForwardRT_MEM(
        .port0(RegData2_MEM), .port1(RegWriteData_WB),
        .Sel(ForwardRT_MEM), .out(ForwardToDM_WD_MEM)
    );
    assign PrWD = ForwardToDM_WD_MEM;
    assign PrWE = DMWr_MEM;
    assign cp0_pcValue =    (PC8_MEM!=32'd0)    ?   PC8_MEM-32'd8   :
                            (PC8_EX!=32'd0)     ?   PC8_EX-32'd8    :
                            (PC8_ID!=32'd0)     ?   PC8_ID-32'd8    :
                                                    PC8_IF-32'd8;


/****** MEM/WB Pipeline Register ******/
    pipe MEM_WB_Pipe(
        .clk(clk), .reset(reset | IntReq_MEM), .WE(1'b1),
        .Instr_in(Instr_MEM),   .pc8_in(PC8_MEM),   .ALUout_in(ALUout_MEM),     .DM_RD_in(DM_RD_MEM),   .RegA3_in(RegA3_MEM),   .CP0_RD_in(CP0_RD_MEM),
        .Instr_out(Instr_WB),   .pc8_out(PC8_WB),   .ALUout_out(ALUout_WB),     .DM_RD_out(DM_RD_WB),   .RegA3_out(RegA3_WB),   .CP0_RD_out(CP0_RD_WB)
    );
    assign PrEPC = cp0_pcValue; //The port "addr" in module "mips"


//--------------------------------*** Write Back ***--------------------------------------------
    wb WB_UNIT(
        .Instr_WB(Instr_WB), .ALUout_WB(ALUout_WB), .DM_RD_WB(DM_RD_WB), .PC8_WB(PC8_WB), .CP0_RD_WB(CP0_RD_WB),
        .RegWriteData_WB(RegWriteData_WB), .RFWr_WB(RFWr_WB)
    );
    
endmodule
