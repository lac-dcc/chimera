// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

module stall(
    input [31:0] Instr_ID, Instr_EX, Instr_MEM,
    input [4:0] RegA3_EX, RegA3_MEM,
    input busy_EX, state_EX,
    output Stall
);

    wire isCalc_R_ID, isCalc_I_ID, isLoad_ID, isStore_ID, isBranch_ID, isJr_ID, isHiLo_ID;
    wire [4:0] rs_ID, rt_ID;

    ctrl ID_CTRL(
        .Instr(Instr_ID),
        .isCalc_R(isCalc_R_ID), .isCalc_I(isCalc_I_ID),
        .isLoad(isLoad_ID), .isStore(isStore_ID), .isBranch(isBranch_ID), .isJr(isJr_ID), .isHiLo(isHiLo_ID)
    );
    assign rs_ID = Instr_ID[25:21];
    assign rt_ID = Instr_ID[20:16];


    wire isCalc_R_EX, isCalc_I_EX, isLoad_EX, isMfc0_EX;

    ctrl EX_CTRL(
        .Instr(Instr_EX),
        .isCalc_R(isCalc_R_EX), .isCalc_I(isCalc_I_EX), .isLoad(isLoad_EX), .isMfc0(isMfc0_EX)
    );


    wire isLoad_MEM, isMfc0_MEM;

    ctrl MEM_CTRL(
        .Instr(Instr_MEM),
        .isLoad(isLoad_MEM), .isMfc0(isMfc0_MEM)
    );


    wire stall_branch, stall_calc_r, stall_calc_i, stall_load, stall_store, stall_jr, stall_hilo;

    assign stall_branch = isBranch_ID & ( ( (isCalc_R_EX | isCalc_I_EX | isLoad_EX | isMfc0_EX) & (rs_ID==RegA3_EX || rt_ID==RegA3_EX) & (RegA3_EX!=5'd0) )
                                          | ( (isLoad_MEM | isMfc0_MEM) & (rs_ID==RegA3_MEM || rt_ID==RegA3_MEM) & (RegA3_MEM!=5'd0) ) );
    assign stall_calc_r = isCalc_R_ID & (isLoad_EX | isMfc0_EX) & (rs_ID==RegA3_EX || rt_ID==RegA3_EX) & (RegA3_EX!=5'd0);
    assign stall_calc_i = isCalc_I_ID & (isLoad_EX | isMfc0_EX) & (rs_ID==RegA3_EX) & (RegA3_EX!=5'd0);
    assign stall_load = isLoad_ID & (isLoad_EX | isMfc0_EX) & (rs_ID==RegA3_EX) & (RegA3_EX!=5'd0);
    assign stall_store = isStore_ID & (isLoad_EX | isMfc0_EX) & (rs_ID==RegA3_EX) & (RegA3_EX!=5'd0);
    assign stall_jr = isJr_ID & ( ( (isCalc_R_EX | isCalc_I_EX | isLoad_EX | isMfc0_EX) & (rs_ID==RegA3_EX) & (RegA3_EX!=5'd0) )
                                | ( (isLoad_MEM | isMfc0_MEM) & (rs_ID==RegA3_MEM) & (RegA3_MEM!=5'd0) ) );
    assign stall_hilo = isHiLo_ID & (busy_EX|state_EX);


    assign Stall = stall_branch | stall_calc_r | stall_calc_i | stall_load | stall_store | stall_jr | stall_hilo;

endmodule // stall