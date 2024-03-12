module wb(
    input [31:0] Instr_WB, 
    input [31:0] ALUout_WB,
    input [31:0] DM_RD_WB,
    input [31:0] PC8_WB,
    output [31:0] RegWriteData_WB,
    input [31:0] CP0_RD_WB,
    output RFWr_WB
);

    wire [1:0] WDSel_WB;
    ctrl WB_Ctrl(
        .Instr(Instr_WB),
        .RFWr(RFWr_WB), .WDSel(WDSel_WB)
    );
    mux4_1 MUX_WD_WB(
        .port0(ALUout_WB), .port1(DM_RD_WB), .port2(PC8_WB), .port3(CP0_RD_WB),
        .Sel(WDSel_WB), .out(RegWriteData_WB)
    );

endmodule // wb
 