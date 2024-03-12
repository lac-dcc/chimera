module forward(
    input [31:0] Instr_ID, Instr_EX, Instr_MEM, Instr_WB,
    input [4:0] RegA3_EX, RegA3_MEM, RegA3_WB,
    output [1:0] ForwardRS_ID, ForwardRT_ID, ForwardRS_EX, ForwardRT_EX, ForwardRT_MEM
);

    wire isCalc_R_ID, isCalc_I_ID, isLoad_ID, isStore_ID, isBranch_ID, isJr_ID;
    wire [4:0] rs_ID, rt_ID;

    ctrl ID_CTRL(
        .Instr(Instr_ID),
        .isCalc_R(isCalc_R_ID), .isCalc_I(isCalc_I_ID),
        .isLoad(isLoad_ID), .isStore(isStore_ID), .isBranch(isBranch_ID), .isJr(isJr_ID)
    );
    assign rs_ID = Instr_ID[25:21];
    assign rt_ID = Instr_ID[20:16];


    wire isCalc_R_EX, isCalc_I_EX, isLoad_EX, isStore_EX, isJal_EX, isMtc0_EX;
    wire [4:0] rs_EX, rt_EX;

    ctrl EX_CTRL(
        .Instr(Instr_EX),
        .isCalc_R(isCalc_R_EX), .isCalc_I(isCalc_I_EX), .isLoad(isLoad_EX), .isStore(isStore_EX), .isJal(isJal_EX), .isMtc0(isMtc0_EX)
    );
    assign rs_EX = Instr_EX[25:21];
    assign rt_EX = Instr_EX[20:16];


    wire isLoad_MEM, isJal_MEM, isCalc_R_MEM, isCalc_I_MEM, isStore_MEM, isMtc0_MEM;
    wire [4:0] rt_MEM;

    ctrl MEM_CTRL(
        .Instr(Instr_MEM),
        .isCalc_R(isCalc_R_MEM), .isCalc_I(isCalc_I_MEM), .isLoad(isLoad_MEM), .isStore(isStore_MEM), .isJal(isJal_MEM), .isMtc0(isMtc0_MEM)
    );
    assign rt_MEM = Instr_MEM[20:16];


    wire isCalc_R_WB, isCalc_I_WB, isLoad_WB, isJal_WB, isRegWrite_WB, isMfc0_WB;

    ctrl WB_CTRL(
        .Instr(Instr_WB),
        .isCalc_R(isCalc_R_WB), .isCalc_I(isCalc_I_WB), .isLoad(isLoad_WB), .isJal(isJal_WB), .RFWr(isRegWrite_WB), .isMfc0(isMfc0_WB)
    );


    assign ForwardRS_ID =   (isBranch_ID || isJr_ID) && (rs_ID==RegA3_EX&&rs_ID!=5'd0) && isJal_EX                      ?   2'b11 :
                            (isBranch_ID || isJr_ID) && (rs_ID==RegA3_MEM&&rs_ID!=5'd0) && isJal_MEM                    ?   2'b10 :
                            (isBranch_ID || isJr_ID) && (rs_ID==RegA3_MEM&&rs_ID!=5'd0) && (isCalc_R_MEM||isCalc_I_MEM) ?   2'b01 :
                                                                                                                            2'b00;
    assign ForwardRT_ID =   (isBranch_ID) && (rt_ID==RegA3_EX&&rt_ID!=5'd0) && isJal_EX                         ?   2'b11 :
                            (isBranch_ID) && (rt_ID==RegA3_MEM&&rt_ID!=5'd0) && isJal_MEM                       ?   2'b10 :
                            (isBranch_ID) && (rt_ID==RegA3_MEM&&rt_ID!=5'd0) && (isCalc_R_MEM||isCalc_I_MEM)    ?   2'b01 :
                                                                                                                    2'b00;
    assign ForwardRS_EX =   (isCalc_R_EX||isCalc_I_EX||isLoad_EX||isStore_EX) && (rs_EX==RegA3_MEM&&rs_EX!=5'd0) && (isCalc_R_MEM||isCalc_I_MEM)    ?   2'b11 :
                            (isCalc_R_EX||isCalc_I_EX||isLoad_EX||isStore_EX) && (rs_EX==RegA3_MEM&&rs_EX!=5'd0) && isJal_MEM                       ?   2'b10 :
                            (isCalc_R_EX||isCalc_I_EX||isLoad_EX||isStore_EX) && (rs_EX==RegA3_WB&&rs_EX!=5'd0) && isRegWrite_WB                    ?   2'b01 :
                                                                                                                                                        2'b00;
    assign ForwardRT_EX =   (isCalc_R_EX) && (rt_EX==RegA3_MEM&&rt_EX!=5'd0) && (isCalc_R_MEM||isCalc_I_MEM)        ?   2'b11 :
                            (isCalc_R_EX) && (rt_EX==RegA3_MEM&&rt_EX!=5'd0) && isJal_MEM                           ?   2'b10 :
                            (isCalc_R_EX||isStore_EX||isMtc0_EX) && (rt_EX==RegA3_WB&&rt_EX!=5'd0) && isRegWrite_WB ?   2'b01 :
                                                                                                                        2'b00;
    assign ForwardRT_MEM =  (isStore_MEM||isMtc0_MEM) && (rt_MEM==RegA3_WB&&rt_MEM!=5'd0) && isRegWrite_WB      ?   2'b01 :
                                                                                                                    2'b00;

endmodule // forward