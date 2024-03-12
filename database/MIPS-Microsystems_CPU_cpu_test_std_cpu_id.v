module id(
    input clk, reset, RFWr_WB,
    input [31:0] Instr_ID,
    input [31:0] ForwardRD1_ID, ForwardRD2_ID, RegWriteData_WB, PC_ID,
    input [4:0] RegA3_WB,
    output [1:0] NPCOp_ID,
    output [31:0] npcValue_ID, RegData1_ID, RegData2_ID, ImmEXT_ID,
    output isJump_ID,
    input [4:0] ExcCode_in,
    output [4:0] ExcCode_out
);

    wire equal, greater, less, CmpWithZero_ID, Undefined, Exception;
    wire [1:0] EXTOp_ID;
    wire [31:0] cmp2_ID;
    grf myGRF(
        .clk(clk), .reset(reset), .WE(RFWr_WB),
        .A1(Instr_ID[25:21]), .A2(Instr_ID[20:16]), .A3(RegA3_WB),
        .WD(RegWriteData_WB), .RD1(RegData1_ID), .RD2(RegData2_ID)
    );
    npc myNPC(.pc(PC_ID), .Imm(Instr_ID[25:0]), .ra(ForwardRD1_ID), .NPCOp(NPCOp_ID), .npc(npcValue_ID));
    ext myEXT(.EXTOp(EXTOp_ID), .Imm(Instr_ID[15:0]), .out(ImmEXT_ID));
    cmp myCMP(
        .A(ForwardRD1_ID), .B(cmp2_ID), .CMPOp(1'b0),
        .equal(equal), .greater(greater), .less(less)
    );     //there has a forward or stall
    ctrl ID_Ctrl(
        .Instr(Instr_ID & {32{~Exception}}), .equal(equal), .greater(greater), .less(less),
        .EXTOp(EXTOp_ID), .NPCOp(NPCOp_ID), .CmpWithZero(CmpWithZero_ID),
        .Undefined(Undefined), .isJump(isJump_ID)
    );

    assign cmp2_ID =        (CmpWithZero_ID) ?  32'd0        :
                                                ForwardRD2_ID;
    assign ExcCode_out =    (Undefined) ?  5'd10 : ExcCode_in;
    assign Exception =      (ExcCode_in==5'd0) ? 1'b0 : 1'b1;

endmodule // id