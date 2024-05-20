// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module b19(
        clock,
        reset,
        bs,
        na,
        hold,
        in1,
        in2,
        in3,
        ris
    );
    parameter \P1.P1.P1.Pending   = 1'b1;
    parameter \P1.P1.P1.NotPending   = 1'b0;
    parameter \P1.P1.P1.WidthByte   = 0;
    parameter \P1.P1.P1.WidthWord   = 1;
    parameter \P1.P1.P1.WidthDword   = 2;
    parameter \P1.P1.P1.StateInit   = 0;
    parameter \P1.P1.P1.StateTi   = 1;
    parameter \P1.P1.P1.StateT1   = 2;
    parameter \P1.P1.P1.StateT2   = 3;
    parameter \P1.P1.P1.StateT1P   = 4;
    parameter \P1.P1.P1.StateTh   = 5;
    parameter \P1.P1.P1.StateT2P   = 6;
    parameter \P1.P1.P1.StateT2I   = 7;
    parameter \P1.P1.P1.REP   = 8'hF3;
    parameter \P1.P1.P1.REPNE   = 8'hF2;
    parameter \P1.P1.P1.LOCK   = 8'hF0;
    parameter \P1.P1.P1.CSsop   = 8'h2E;
    parameter \P1.P1.P1.SSsop   = 8'h36;
    parameter \P1.P1.P1.DSsop   = 8'h3E;
    parameter \P1.P1.P1.ESsop   = 8'h26;
    parameter \P1.P1.P1.FSsop   = 8'h64;
    parameter \P1.P1.P1.GSsop   = 8'h65;
    parameter \P1.P1.P1.OPsop   = 8'h66;
    parameter \P1.P1.P1.ADsop   = 8'h67;
    parameter \P1.P1.P1.MOV_al_b   = 8'hB0;
    parameter \P1.P1.P1.MOV_eax_dw   = 8'hB8;
    parameter \P1.P1.P1.MOV_ebx_dw   = 8'hBB;
    parameter \P1.P1.P1.MOV_ebx_eax   = 8'h89;
    parameter \P1.P1.P1.MOV_eax_ebx   = 8'h8B;
    parameter \P1.P1.P1.IN_al   = 8'hE4;
    parameter \P1.P1.P1.OUT_al   = 8'hE6;
    parameter \P1.P1.P1.ADD_al_b   = 8'h04;
    parameter \P1.P1.P1.ADD_ax_w   = 8'h05;
    parameter \P1.P1.P1.ROL_eax_b   = 8'hD1;
    parameter \P1.P1.P1.ROL_al_1   = 8'hD0;
    parameter \P1.P1.P1.ROL_al_n   = 8'hC0;
    parameter \P1.P1.P1.INC_eax   = 8'h40;
    parameter \P1.P1.P1.INC_ebx   = 8'h43;
    parameter \P1.P1.P1.JMP_rel_short   = 8'hEB;
    parameter \P1.P1.P1.JMP_rel_near   = 8'hE9;
    parameter \P1.P1.P1.JMP_intseg_immed   = 8'hEA;
    parameter \P1.P1.P1.HLT   = 8'hF4;
    parameter \P1.P1.P1.WAITx   = 8'h9B;
    parameter \P1.P1.P1.NOP   = 8'h90;
    parameter \P1.P1.P1.InstQueueLimit   = 15;
    parameter \P1.P1.P1.Si   = 0;
    parameter \P1.P1.P1.S1   = 1;
    parameter \P1.P1.P1.S2   = 2;
    parameter \P1.P1.P1.S3   = 3;
    parameter \P1.P1.P1.S4   = 4;
    parameter \P1.P1.P1.S5   = 5;
    parameter \P1.P1.P1.S6   = 6;
    parameter \P1.P1.P1.S7   = 7;
    parameter \P1.P1.P1.S8   = 8;
    parameter \P1.P1.P1.S9   = 9;
    parameter \P1.P1.P2.Pending   = 1'b1;
    parameter \P1.P1.P2.NotPending   = 1'b0;
    parameter \P1.P1.P2.WidthByte   = 0;
    parameter \P1.P1.P2.WidthWord   = 1;
    parameter \P1.P1.P2.WidthDword   = 2;
    parameter \P1.P1.P2.StateInit   = 0;
    parameter \P1.P1.P2.StateTi   = 1;
    parameter \P1.P1.P2.StateT1   = 2;
    parameter \P1.P1.P2.StateT2   = 3;
    parameter \P1.P1.P2.StateT1P   = 4;
    parameter \P1.P1.P2.StateTh   = 5;
    parameter \P1.P1.P2.StateT2P   = 6;
    parameter \P1.P1.P2.StateT2I   = 7;
    parameter \P1.P1.P2.REP   = 8'hF3;
    parameter \P1.P1.P2.REPNE   = 8'hF2;
    parameter \P1.P1.P2.LOCK   = 8'hF0;
    parameter \P1.P1.P2.CSsop   = 8'h2E;
    parameter \P1.P1.P2.SSsop   = 8'h36;
    parameter \P1.P1.P2.DSsop   = 8'h3E;
    parameter \P1.P1.P2.ESsop   = 8'h26;
    parameter \P1.P1.P2.FSsop   = 8'h64;
    parameter \P1.P1.P2.GSsop   = 8'h65;
    parameter \P1.P1.P2.OPsop   = 8'h66;
    parameter \P1.P1.P2.ADsop   = 8'h67;
    parameter \P1.P1.P2.MOV_al_b   = 8'hB0;
    parameter \P1.P1.P2.MOV_eax_dw   = 8'hB8;
    parameter \P1.P1.P2.MOV_ebx_dw   = 8'hBB;
    parameter \P1.P1.P2.MOV_ebx_eax   = 8'h89;
    parameter \P1.P1.P2.MOV_eax_ebx   = 8'h8B;
    parameter \P1.P1.P2.IN_al   = 8'hE4;
    parameter \P1.P1.P2.OUT_al   = 8'hE6;
    parameter \P1.P1.P2.ADD_al_b   = 8'h04;
    parameter \P1.P1.P2.ADD_ax_w   = 8'h05;
    parameter \P1.P1.P2.ROL_eax_b   = 8'hD1;
    parameter \P1.P1.P2.ROL_al_1   = 8'hD0;
    parameter \P1.P1.P2.ROL_al_n   = 8'hC0;
    parameter \P1.P1.P2.INC_eax   = 8'h40;
    parameter \P1.P1.P2.INC_ebx   = 8'h43;
    parameter \P1.P1.P2.JMP_rel_short   = 8'hEB;
    parameter \P1.P1.P2.JMP_rel_near   = 8'hE9;
    parameter \P1.P1.P2.JMP_intseg_immed   = 8'hEA;
    parameter \P1.P1.P2.HLT   = 8'hF4;
    parameter \P1.P1.P2.WAITx   = 8'h9B;
    parameter \P1.P1.P2.NOP   = 8'h90;
    parameter \P1.P1.P2.InstQueueLimit   = 15;
    parameter \P1.P1.P2.Si   = 0;
    parameter \P1.P1.P2.S1   = 1;
    parameter \P1.P1.P2.S2   = 2;
    parameter \P1.P1.P2.S3   = 3;
    parameter \P1.P1.P2.S4   = 4;
    parameter \P1.P1.P2.S5   = 5;
    parameter \P1.P1.P2.S6   = 6;
    parameter \P1.P1.P2.S7   = 7;
    parameter \P1.P1.P2.S8   = 8;
    parameter \P1.P1.P2.S9   = 9;
    parameter \P1.P1.P3.Pending   = 1'b1;
    parameter \P1.P1.P3.NotPending   = 1'b0;
    parameter \P1.P1.P3.WidthByte   = 0;
    parameter \P1.P1.P3.WidthWord   = 1;
    parameter \P1.P1.P3.WidthDword   = 2;
    parameter \P1.P1.P3.StateInit   = 0;
    parameter \P1.P1.P3.StateTi   = 1;
    parameter \P1.P1.P3.StateT1   = 2;
    parameter \P1.P1.P3.StateT2   = 3;
    parameter \P1.P1.P3.StateT1P   = 4;
    parameter \P1.P1.P3.StateTh   = 5;
    parameter \P1.P1.P3.StateT2P   = 6;
    parameter \P1.P1.P3.StateT2I   = 7;
    parameter \P1.P1.P3.REP   = 8'hF3;
    parameter \P1.P1.P3.REPNE   = 8'hF2;
    parameter \P1.P1.P3.LOCK   = 8'hF0;
    parameter \P1.P1.P3.CSsop   = 8'h2E;
    parameter \P1.P1.P3.SSsop   = 8'h36;
    parameter \P1.P1.P3.DSsop   = 8'h3E;
    parameter \P1.P1.P3.ESsop   = 8'h26;
    parameter \P1.P1.P3.FSsop   = 8'h64;
    parameter \P1.P1.P3.GSsop   = 8'h65;
    parameter \P1.P1.P3.OPsop   = 8'h66;
    parameter \P1.P1.P3.ADsop   = 8'h67;
    parameter \P1.P1.P3.MOV_al_b   = 8'hB0;
    parameter \P1.P1.P3.MOV_eax_dw   = 8'hB8;
    parameter \P1.P1.P3.MOV_ebx_dw   = 8'hBB;
    parameter \P1.P1.P3.MOV_ebx_eax   = 8'h89;
    parameter \P1.P1.P3.MOV_eax_ebx   = 8'h8B;
    parameter \P1.P1.P3.IN_al   = 8'hE4;
    parameter \P1.P1.P3.OUT_al   = 8'hE6;
    parameter \P1.P1.P3.ADD_al_b   = 8'h04;
    parameter \P1.P1.P3.ADD_ax_w   = 8'h05;
    parameter \P1.P1.P3.ROL_eax_b   = 8'hD1;
    parameter \P1.P1.P3.ROL_al_1   = 8'hD0;
    parameter \P1.P1.P3.ROL_al_n   = 8'hC0;
    parameter \P1.P1.P3.INC_eax   = 8'h40;
    parameter \P1.P1.P3.INC_ebx   = 8'h43;
    parameter \P1.P1.P3.JMP_rel_short   = 8'hEB;
    parameter \P1.P1.P3.JMP_rel_near   = 8'hE9;
    parameter \P1.P1.P3.JMP_intseg_immed   = 8'hEA;
    parameter \P1.P1.P3.HLT   = 8'hF4;
    parameter \P1.P1.P3.WAITx   = 8'h9B;
    parameter \P1.P1.P3.NOP   = 8'h90;
    parameter \P1.P1.P3.InstQueueLimit   = 15;
    parameter \P1.P1.P3.Si   = 0;
    parameter \P1.P1.P3.S1   = 1;
    parameter \P1.P1.P3.S2   = 2;
    parameter \P1.P1.P3.S3   = 3;
    parameter \P1.P1.P3.S4   = 4;
    parameter \P1.P1.P3.S5   = 5;
    parameter \P1.P1.P3.S6   = 6;
    parameter \P1.P1.P3.S7   = 7;
    parameter \P1.P1.P3.S8   = 8;
    parameter \P1.P1.P3.S9   = 9;
    parameter \P1.P2.P1.Pending   = 1'b1;
    parameter \P1.P2.P1.NotPending   = 1'b0;
    parameter \P1.P2.P1.WidthByte   = 0;
    parameter \P1.P2.P1.WidthWord   = 1;
    parameter \P1.P2.P1.WidthDword   = 2;
    parameter \P1.P2.P1.StateInit   = 0;
    parameter \P1.P2.P1.StateTi   = 1;
    parameter \P1.P2.P1.StateT1   = 2;
    parameter \P1.P2.P1.StateT2   = 3;
    parameter \P1.P2.P1.StateT1P   = 4;
    parameter \P1.P2.P1.StateTh   = 5;
    parameter \P1.P2.P1.StateT2P   = 6;
    parameter \P1.P2.P1.StateT2I   = 7;
    parameter \P1.P2.P1.REP   = 8'hF3;
    parameter \P1.P2.P1.REPNE   = 8'hF2;
    parameter \P1.P2.P1.LOCK   = 8'hF0;
    parameter \P1.P2.P1.CSsop   = 8'h2E;
    parameter \P1.P2.P1.SSsop   = 8'h36;
    parameter \P1.P2.P1.DSsop   = 8'h3E;
    parameter \P1.P2.P1.ESsop   = 8'h26;
    parameter \P1.P2.P1.FSsop   = 8'h64;
    parameter \P1.P2.P1.GSsop   = 8'h65;
    parameter \P1.P2.P1.OPsop   = 8'h66;
    parameter \P1.P2.P1.ADsop   = 8'h67;
    parameter \P1.P2.P1.MOV_al_b   = 8'hB0;
    parameter \P1.P2.P1.MOV_eax_dw   = 8'hB8;
    parameter \P1.P2.P1.MOV_ebx_dw   = 8'hBB;
    parameter \P1.P2.P1.MOV_ebx_eax   = 8'h89;
    parameter \P1.P2.P1.MOV_eax_ebx   = 8'h8B;
    parameter \P1.P2.P1.IN_al   = 8'hE4;
    parameter \P1.P2.P1.OUT_al   = 8'hE6;
    parameter \P1.P2.P1.ADD_al_b   = 8'h04;
    parameter \P1.P2.P1.ADD_ax_w   = 8'h05;
    parameter \P1.P2.P1.ROL_eax_b   = 8'hD1;
    parameter \P1.P2.P1.ROL_al_1   = 8'hD0;
    parameter \P1.P2.P1.ROL_al_n   = 8'hC0;
    parameter \P1.P2.P1.INC_eax   = 8'h40;
    parameter \P1.P2.P1.INC_ebx   = 8'h43;
    parameter \P1.P2.P1.JMP_rel_short   = 8'hEB;
    parameter \P1.P2.P1.JMP_rel_near   = 8'hE9;
    parameter \P1.P2.P1.JMP_intseg_immed   = 8'hEA;
    parameter \P1.P2.P1.HLT   = 8'hF4;
    parameter \P1.P2.P1.WAITx   = 8'h9B;
    parameter \P1.P2.P1.NOP   = 8'h90;
    parameter \P1.P2.P1.InstQueueLimit   = 15;
    parameter \P1.P2.P1.Si   = 0;
    parameter \P1.P2.P1.S1   = 1;
    parameter \P1.P2.P1.S2   = 2;
    parameter \P1.P2.P1.S3   = 3;
    parameter \P1.P2.P1.S4   = 4;
    parameter \P1.P2.P1.S5   = 5;
    parameter \P1.P2.P1.S6   = 6;
    parameter \P1.P2.P1.S7   = 7;
    parameter \P1.P2.P1.S8   = 8;
    parameter \P1.P2.P1.S9   = 9;
    parameter \P1.P2.P2.Pending   = 1'b1;
    parameter \P1.P2.P2.NotPending   = 1'b0;
    parameter \P1.P2.P2.WidthByte   = 0;
    parameter \P1.P2.P2.WidthWord   = 1;
    parameter \P1.P2.P2.WidthDword   = 2;
    parameter \P1.P2.P2.StateInit   = 0;
    parameter \P1.P2.P2.StateTi   = 1;
    parameter \P1.P2.P2.StateT1   = 2;
    parameter \P1.P2.P2.StateT2   = 3;
    parameter \P1.P2.P2.StateT1P   = 4;
    parameter \P1.P2.P2.StateTh   = 5;
    parameter \P1.P2.P2.StateT2P   = 6;
    parameter \P1.P2.P2.StateT2I   = 7;
    parameter \P1.P2.P2.REP   = 8'hF3;
    parameter \P1.P2.P2.REPNE   = 8'hF2;
    parameter \P1.P2.P2.LOCK   = 8'hF0;
    parameter \P1.P2.P2.CSsop   = 8'h2E;
    parameter \P1.P2.P2.SSsop   = 8'h36;
    parameter \P1.P2.P2.DSsop   = 8'h3E;
    parameter \P1.P2.P2.ESsop   = 8'h26;
    parameter \P1.P2.P2.FSsop   = 8'h64;
    parameter \P1.P2.P2.GSsop   = 8'h65;
    parameter \P1.P2.P2.OPsop   = 8'h66;
    parameter \P1.P2.P2.ADsop   = 8'h67;
    parameter \P1.P2.P2.MOV_al_b   = 8'hB0;
    parameter \P1.P2.P2.MOV_eax_dw   = 8'hB8;
    parameter \P1.P2.P2.MOV_ebx_dw   = 8'hBB;
    parameter \P1.P2.P2.MOV_ebx_eax   = 8'h89;
    parameter \P1.P2.P2.MOV_eax_ebx   = 8'h8B;
    parameter \P1.P2.P2.IN_al   = 8'hE4;
    parameter \P1.P2.P2.OUT_al   = 8'hE6;
    parameter \P1.P2.P2.ADD_al_b   = 8'h04;
    parameter \P1.P2.P2.ADD_ax_w   = 8'h05;
    parameter \P1.P2.P2.ROL_eax_b   = 8'hD1;
    parameter \P1.P2.P2.ROL_al_1   = 8'hD0;
    parameter \P1.P2.P2.ROL_al_n   = 8'hC0;
    parameter \P1.P2.P2.INC_eax   = 8'h40;
    parameter \P1.P2.P2.INC_ebx   = 8'h43;
    parameter \P1.P2.P2.JMP_rel_short   = 8'hEB;
    parameter \P1.P2.P2.JMP_rel_near   = 8'hE9;
    parameter \P1.P2.P2.JMP_intseg_immed   = 8'hEA;
    parameter \P1.P2.P2.HLT   = 8'hF4;
    parameter \P1.P2.P2.WAITx   = 8'h9B;
    parameter \P1.P2.P2.NOP   = 8'h90;
    parameter \P1.P2.P2.InstQueueLimit   = 15;
    parameter \P1.P2.P2.Si   = 0;
    parameter \P1.P2.P2.S1   = 1;
    parameter \P1.P2.P2.S2   = 2;
    parameter \P1.P2.P2.S3   = 3;
    parameter \P1.P2.P2.S4   = 4;
    parameter \P1.P2.P2.S5   = 5;
    parameter \P1.P2.P2.S6   = 6;
    parameter \P1.P2.P2.S7   = 7;
    parameter \P1.P2.P2.S8   = 8;
    parameter \P1.P2.P2.S9   = 9;
    parameter \P1.P2.P3.Pending   = 1'b1;
    parameter \P1.P2.P3.NotPending   = 1'b0;
    parameter \P1.P2.P3.WidthByte   = 0;
    parameter \P1.P2.P3.WidthWord   = 1;
    parameter \P1.P2.P3.WidthDword   = 2;
    parameter \P1.P2.P3.StateInit   = 0;
    parameter \P1.P2.P3.StateTi   = 1;
    parameter \P1.P2.P3.StateT1   = 2;
    parameter \P1.P2.P3.StateT2   = 3;
    parameter \P1.P2.P3.StateT1P   = 4;
    parameter \P1.P2.P3.StateTh   = 5;
    parameter \P1.P2.P3.StateT2P   = 6;
    parameter \P1.P2.P3.StateT2I   = 7;
    parameter \P1.P2.P3.REP   = 8'hF3;
    parameter \P1.P2.P3.REPNE   = 8'hF2;
    parameter \P1.P2.P3.LOCK   = 8'hF0;
    parameter \P1.P2.P3.CSsop   = 8'h2E;
    parameter \P1.P2.P3.SSsop   = 8'h36;
    parameter \P1.P2.P3.DSsop   = 8'h3E;
    parameter \P1.P2.P3.ESsop   = 8'h26;
    parameter \P1.P2.P3.FSsop   = 8'h64;
    parameter \P1.P2.P3.GSsop   = 8'h65;
    parameter \P1.P2.P3.OPsop   = 8'h66;
    parameter \P1.P2.P3.ADsop   = 8'h67;
    parameter \P1.P2.P3.MOV_al_b   = 8'hB0;
    parameter \P1.P2.P3.MOV_eax_dw   = 8'hB8;
    parameter \P1.P2.P3.MOV_ebx_dw   = 8'hBB;
    parameter \P1.P2.P3.MOV_ebx_eax   = 8'h89;
    parameter \P1.P2.P3.MOV_eax_ebx   = 8'h8B;
    parameter \P1.P2.P3.IN_al   = 8'hE4;
    parameter \P1.P2.P3.OUT_al   = 8'hE6;
    parameter \P1.P2.P3.ADD_al_b   = 8'h04;
    parameter \P1.P2.P3.ADD_ax_w   = 8'h05;
    parameter \P1.P2.P3.ROL_eax_b   = 8'hD1;
    parameter \P1.P2.P3.ROL_al_1   = 8'hD0;
    parameter \P1.P2.P3.ROL_al_n   = 8'hC0;
    parameter \P1.P2.P3.INC_eax   = 8'h40;
    parameter \P1.P2.P3.INC_ebx   = 8'h43;
    parameter \P1.P2.P3.JMP_rel_short   = 8'hEB;
    parameter \P1.P2.P3.JMP_rel_near   = 8'hE9;
    parameter \P1.P2.P3.JMP_intseg_immed   = 8'hEA;
    parameter \P1.P2.P3.HLT   = 8'hF4;
    parameter \P1.P2.P3.WAITx   = 8'h9B;
    parameter \P1.P2.P3.NOP   = 8'h90;
    parameter \P1.P2.P3.InstQueueLimit   = 15;
    parameter \P1.P2.P3.Si   = 0;
    parameter \P1.P2.P3.S1   = 1;
    parameter \P1.P2.P3.S2   = 2;
    parameter \P1.P2.P3.S3   = 3;
    parameter \P1.P2.P3.S4   = 4;
    parameter \P1.P2.P3.S5   = 5;
    parameter \P1.P2.P3.S6   = 6;
    parameter \P1.P2.P3.S7   = 7;
    parameter \P1.P2.P3.S8   = 8;
    parameter \P1.P2.P3.S9   = 9;
    parameter \P1.P3.FETCH   = 0;
    parameter \P1.P3.EXEC   = 1;
    parameter \P1.P4.FETCH   = 0;
    parameter \P1.P4.EXEC   = 1;
    parameter \P2.P1.P1.Pending   = 1'b1;
    parameter \P2.P1.P1.NotPending   = 1'b0;
    parameter \P2.P1.P1.WidthByte   = 0;
    parameter \P2.P1.P1.WidthWord   = 1;
    parameter \P2.P1.P1.WidthDword   = 2;
    parameter \P2.P1.P1.StateInit   = 0;
    parameter \P2.P1.P1.StateTi   = 1;
    parameter \P2.P1.P1.StateT1   = 2;
    parameter \P2.P1.P1.StateT2   = 3;
    parameter \P2.P1.P1.StateT1P   = 4;
    parameter \P2.P1.P1.StateTh   = 5;
    parameter \P2.P1.P1.StateT2P   = 6;
    parameter \P2.P1.P1.StateT2I   = 7;
    parameter \P2.P1.P1.REP   = 8'hF3;
    parameter \P2.P1.P1.REPNE   = 8'hF2;
    parameter \P2.P1.P1.LOCK   = 8'hF0;
    parameter \P2.P1.P1.CSsop   = 8'h2E;
    parameter \P2.P1.P1.SSsop   = 8'h36;
    parameter \P2.P1.P1.DSsop   = 8'h3E;
    parameter \P2.P1.P1.ESsop   = 8'h26;
    parameter \P2.P1.P1.FSsop   = 8'h64;
    parameter \P2.P1.P1.GSsop   = 8'h65;
    parameter \P2.P1.P1.OPsop   = 8'h66;
    parameter \P2.P1.P1.ADsop   = 8'h67;
    parameter \P2.P1.P1.MOV_al_b   = 8'hB0;
    parameter \P2.P1.P1.MOV_eax_dw   = 8'hB8;
    parameter \P2.P1.P1.MOV_ebx_dw   = 8'hBB;
    parameter \P2.P1.P1.MOV_ebx_eax   = 8'h89;
    parameter \P2.P1.P1.MOV_eax_ebx   = 8'h8B;
    parameter \P2.P1.P1.IN_al   = 8'hE4;
    parameter \P2.P1.P1.OUT_al   = 8'hE6;
    parameter \P2.P1.P1.ADD_al_b   = 8'h04;
    parameter \P2.P1.P1.ADD_ax_w   = 8'h05;
    parameter \P2.P1.P1.ROL_eax_b   = 8'hD1;
    parameter \P2.P1.P1.ROL_al_1   = 8'hD0;
    parameter \P2.P1.P1.ROL_al_n   = 8'hC0;
    parameter \P2.P1.P1.INC_eax   = 8'h40;
    parameter \P2.P1.P1.INC_ebx   = 8'h43;
    parameter \P2.P1.P1.JMP_rel_short   = 8'hEB;
    parameter \P2.P1.P1.JMP_rel_near   = 8'hE9;
    parameter \P2.P1.P1.JMP_intseg_immed   = 8'hEA;
    parameter \P2.P1.P1.HLT   = 8'hF4;
    parameter \P2.P1.P1.WAITx   = 8'h9B;
    parameter \P2.P1.P1.NOP   = 8'h90;
    parameter \P2.P1.P1.InstQueueLimit   = 15;
    parameter \P2.P1.P1.Si   = 0;
    parameter \P2.P1.P1.S1   = 1;
    parameter \P2.P1.P1.S2   = 2;
    parameter \P2.P1.P1.S3   = 3;
    parameter \P2.P1.P1.S4   = 4;
    parameter \P2.P1.P1.S5   = 5;
    parameter \P2.P1.P1.S6   = 6;
    parameter \P2.P1.P1.S7   = 7;
    parameter \P2.P1.P1.S8   = 8;
    parameter \P2.P1.P1.S9   = 9;
    parameter \P2.P1.P2.Pending   = 1'b1;
    parameter \P2.P1.P2.NotPending   = 1'b0;
    parameter \P2.P1.P2.WidthByte   = 0;
    parameter \P2.P1.P2.WidthWord   = 1;
    parameter \P2.P1.P2.WidthDword   = 2;
    parameter \P2.P1.P2.StateInit   = 0;
    parameter \P2.P1.P2.StateTi   = 1;
    parameter \P2.P1.P2.StateT1   = 2;
    parameter \P2.P1.P2.StateT2   = 3;
    parameter \P2.P1.P2.StateT1P   = 4;
    parameter \P2.P1.P2.StateTh   = 5;
    parameter \P2.P1.P2.StateT2P   = 6;
    parameter \P2.P1.P2.StateT2I   = 7;
    parameter \P2.P1.P2.REP   = 8'hF3;
    parameter \P2.P1.P2.REPNE   = 8'hF2;
    parameter \P2.P1.P2.LOCK   = 8'hF0;
    parameter \P2.P1.P2.CSsop   = 8'h2E;
    parameter \P2.P1.P2.SSsop   = 8'h36;
    parameter \P2.P1.P2.DSsop   = 8'h3E;
    parameter \P2.P1.P2.ESsop   = 8'h26;
    parameter \P2.P1.P2.FSsop   = 8'h64;
    parameter \P2.P1.P2.GSsop   = 8'h65;
    parameter \P2.P1.P2.OPsop   = 8'h66;
    parameter \P2.P1.P2.ADsop   = 8'h67;
    parameter \P2.P1.P2.MOV_al_b   = 8'hB0;
    parameter \P2.P1.P2.MOV_eax_dw   = 8'hB8;
    parameter \P2.P1.P2.MOV_ebx_dw   = 8'hBB;
    parameter \P2.P1.P2.MOV_ebx_eax   = 8'h89;
    parameter \P2.P1.P2.MOV_eax_ebx   = 8'h8B;
    parameter \P2.P1.P2.IN_al   = 8'hE4;
    parameter \P2.P1.P2.OUT_al   = 8'hE6;
    parameter \P2.P1.P2.ADD_al_b   = 8'h04;
    parameter \P2.P1.P2.ADD_ax_w   = 8'h05;
    parameter \P2.P1.P2.ROL_eax_b   = 8'hD1;
    parameter \P2.P1.P2.ROL_al_1   = 8'hD0;
    parameter \P2.P1.P2.ROL_al_n   = 8'hC0;
    parameter \P2.P1.P2.INC_eax   = 8'h40;
    parameter \P2.P1.P2.INC_ebx   = 8'h43;
    parameter \P2.P1.P2.JMP_rel_short   = 8'hEB;
    parameter \P2.P1.P2.JMP_rel_near   = 8'hE9;
    parameter \P2.P1.P2.JMP_intseg_immed   = 8'hEA;
    parameter \P2.P1.P2.HLT   = 8'hF4;
    parameter \P2.P1.P2.WAITx   = 8'h9B;
    parameter \P2.P1.P2.NOP   = 8'h90;
    parameter \P2.P1.P2.InstQueueLimit   = 15;
    parameter \P2.P1.P2.Si   = 0;
    parameter \P2.P1.P2.S1   = 1;
    parameter \P2.P1.P2.S2   = 2;
    parameter \P2.P1.P2.S3   = 3;
    parameter \P2.P1.P2.S4   = 4;
    parameter \P2.P1.P2.S5   = 5;
    parameter \P2.P1.P2.S6   = 6;
    parameter \P2.P1.P2.S7   = 7;
    parameter \P2.P1.P2.S8   = 8;
    parameter \P2.P1.P2.S9   = 9;
    parameter \P2.P1.P3.Pending   = 1'b1;
    parameter \P2.P1.P3.NotPending   = 1'b0;
    parameter \P2.P1.P3.WidthByte   = 0;
    parameter \P2.P1.P3.WidthWord   = 1;
    parameter \P2.P1.P3.WidthDword   = 2;
    parameter \P2.P1.P3.StateInit   = 0;
    parameter \P2.P1.P3.StateTi   = 1;
    parameter \P2.P1.P3.StateT1   = 2;
    parameter \P2.P1.P3.StateT2   = 3;
    parameter \P2.P1.P3.StateT1P   = 4;
    parameter \P2.P1.P3.StateTh   = 5;
    parameter \P2.P1.P3.StateT2P   = 6;
    parameter \P2.P1.P3.StateT2I   = 7;
    parameter \P2.P1.P3.REP   = 8'hF3;
    parameter \P2.P1.P3.REPNE   = 8'hF2;
    parameter \P2.P1.P3.LOCK   = 8'hF0;
    parameter \P2.P1.P3.CSsop   = 8'h2E;
    parameter \P2.P1.P3.SSsop   = 8'h36;
    parameter \P2.P1.P3.DSsop   = 8'h3E;
    parameter \P2.P1.P3.ESsop   = 8'h26;
    parameter \P2.P1.P3.FSsop   = 8'h64;
    parameter \P2.P1.P3.GSsop   = 8'h65;
    parameter \P2.P1.P3.OPsop   = 8'h66;
    parameter \P2.P1.P3.ADsop   = 8'h67;
    parameter \P2.P1.P3.MOV_al_b   = 8'hB0;
    parameter \P2.P1.P3.MOV_eax_dw   = 8'hB8;
    parameter \P2.P1.P3.MOV_ebx_dw   = 8'hBB;
    parameter \P2.P1.P3.MOV_ebx_eax   = 8'h89;
    parameter \P2.P1.P3.MOV_eax_ebx   = 8'h8B;
    parameter \P2.P1.P3.IN_al   = 8'hE4;
    parameter \P2.P1.P3.OUT_al   = 8'hE6;
    parameter \P2.P1.P3.ADD_al_b   = 8'h04;
    parameter \P2.P1.P3.ADD_ax_w   = 8'h05;
    parameter \P2.P1.P3.ROL_eax_b   = 8'hD1;
    parameter \P2.P1.P3.ROL_al_1   = 8'hD0;
    parameter \P2.P1.P3.ROL_al_n   = 8'hC0;
    parameter \P2.P1.P3.INC_eax   = 8'h40;
    parameter \P2.P1.P3.INC_ebx   = 8'h43;
    parameter \P2.P1.P3.JMP_rel_short   = 8'hEB;
    parameter \P2.P1.P3.JMP_rel_near   = 8'hE9;
    parameter \P2.P1.P3.JMP_intseg_immed   = 8'hEA;
    parameter \P2.P1.P3.HLT   = 8'hF4;
    parameter \P2.P1.P3.WAITx   = 8'h9B;
    parameter \P2.P1.P3.NOP   = 8'h90;
    parameter \P2.P1.P3.InstQueueLimit   = 15;
    parameter \P2.P1.P3.Si   = 0;
    parameter \P2.P1.P3.S1   = 1;
    parameter \P2.P1.P3.S2   = 2;
    parameter \P2.P1.P3.S3   = 3;
    parameter \P2.P1.P3.S4   = 4;
    parameter \P2.P1.P3.S5   = 5;
    parameter \P2.P1.P3.S6   = 6;
    parameter \P2.P1.P3.S7   = 7;
    parameter \P2.P1.P3.S8   = 8;
    parameter \P2.P1.P3.S9   = 9;
    parameter \P2.P2.P1.Pending   = 1'b1;
    parameter \P2.P2.P1.NotPending   = 1'b0;
    parameter \P2.P2.P1.WidthByte   = 0;
    parameter \P2.P2.P1.WidthWord   = 1;
    parameter \P2.P2.P1.WidthDword   = 2;
    parameter \P2.P2.P1.StateInit   = 0;
    parameter \P2.P2.P1.StateTi   = 1;
    parameter \P2.P2.P1.StateT1   = 2;
    parameter \P2.P2.P1.StateT2   = 3;
    parameter \P2.P2.P1.StateT1P   = 4;
    parameter \P2.P2.P1.StateTh   = 5;
    parameter \P2.P2.P1.StateT2P   = 6;
    parameter \P2.P2.P1.StateT2I   = 7;
    parameter \P2.P2.P1.REP   = 8'hF3;
    parameter \P2.P2.P1.REPNE   = 8'hF2;
    parameter \P2.P2.P1.LOCK   = 8'hF0;
    parameter \P2.P2.P1.CSsop   = 8'h2E;
    parameter \P2.P2.P1.SSsop   = 8'h36;
    parameter \P2.P2.P1.DSsop   = 8'h3E;
    parameter \P2.P2.P1.ESsop   = 8'h26;
    parameter \P2.P2.P1.FSsop   = 8'h64;
    parameter \P2.P2.P1.GSsop   = 8'h65;
    parameter \P2.P2.P1.OPsop   = 8'h66;
    parameter \P2.P2.P1.ADsop   = 8'h67;
    parameter \P2.P2.P1.MOV_al_b   = 8'hB0;
    parameter \P2.P2.P1.MOV_eax_dw   = 8'hB8;
    parameter \P2.P2.P1.MOV_ebx_dw   = 8'hBB;
    parameter \P2.P2.P1.MOV_ebx_eax   = 8'h89;
    parameter \P2.P2.P1.MOV_eax_ebx   = 8'h8B;
    parameter \P2.P2.P1.IN_al   = 8'hE4;
    parameter \P2.P2.P1.OUT_al   = 8'hE6;
    parameter \P2.P2.P1.ADD_al_b   = 8'h04;
    parameter \P2.P2.P1.ADD_ax_w   = 8'h05;
    parameter \P2.P2.P1.ROL_eax_b   = 8'hD1;
    parameter \P2.P2.P1.ROL_al_1   = 8'hD0;
    parameter \P2.P2.P1.ROL_al_n   = 8'hC0;
    parameter \P2.P2.P1.INC_eax   = 8'h40;
    parameter \P2.P2.P1.INC_ebx   = 8'h43;
    parameter \P2.P2.P1.JMP_rel_short   = 8'hEB;
    parameter \P2.P2.P1.JMP_rel_near   = 8'hE9;
    parameter \P2.P2.P1.JMP_intseg_immed   = 8'hEA;
    parameter \P2.P2.P1.HLT   = 8'hF4;
    parameter \P2.P2.P1.WAITx   = 8'h9B;
    parameter \P2.P2.P1.NOP   = 8'h90;
    parameter \P2.P2.P1.InstQueueLimit   = 15;
    parameter \P2.P2.P1.Si   = 0;
    parameter \P2.P2.P1.S1   = 1;
    parameter \P2.P2.P1.S2   = 2;
    parameter \P2.P2.P1.S3   = 3;
    parameter \P2.P2.P1.S4   = 4;
    parameter \P2.P2.P1.S5   = 5;
    parameter \P2.P2.P1.S6   = 6;
    parameter \P2.P2.P1.S7   = 7;
    parameter \P2.P2.P1.S8   = 8;
    parameter \P2.P2.P1.S9   = 9;
    parameter \P2.P2.P2.Pending   = 1'b1;
    parameter \P2.P2.P2.NotPending   = 1'b0;
    parameter \P2.P2.P2.WidthByte   = 0;
    parameter \P2.P2.P2.WidthWord   = 1;
    parameter \P2.P2.P2.WidthDword   = 2;
    parameter \P2.P2.P2.StateInit   = 0;
    parameter \P2.P2.P2.StateTi   = 1;
    parameter \P2.P2.P2.StateT1   = 2;
    parameter \P2.P2.P2.StateT2   = 3;
    parameter \P2.P2.P2.StateT1P   = 4;
    parameter \P2.P2.P2.StateTh   = 5;
    parameter \P2.P2.P2.StateT2P   = 6;
    parameter \P2.P2.P2.StateT2I   = 7;
    parameter \P2.P2.P2.REP   = 8'hF3;
    parameter \P2.P2.P2.REPNE   = 8'hF2;
    parameter \P2.P2.P2.LOCK   = 8'hF0;
    parameter \P2.P2.P2.CSsop   = 8'h2E;
    parameter \P2.P2.P2.SSsop   = 8'h36;
    parameter \P2.P2.P2.DSsop   = 8'h3E;
    parameter \P2.P2.P2.ESsop   = 8'h26;
    parameter \P2.P2.P2.FSsop   = 8'h64;
    parameter \P2.P2.P2.GSsop   = 8'h65;
    parameter \P2.P2.P2.OPsop   = 8'h66;
    parameter \P2.P2.P2.ADsop   = 8'h67;
    parameter \P2.P2.P2.MOV_al_b   = 8'hB0;
    parameter \P2.P2.P2.MOV_eax_dw   = 8'hB8;
    parameter \P2.P2.P2.MOV_ebx_dw   = 8'hBB;
    parameter \P2.P2.P2.MOV_ebx_eax   = 8'h89;
    parameter \P2.P2.P2.MOV_eax_ebx   = 8'h8B;
    parameter \P2.P2.P2.IN_al   = 8'hE4;
    parameter \P2.P2.P2.OUT_al   = 8'hE6;
    parameter \P2.P2.P2.ADD_al_b   = 8'h04;
    parameter \P2.P2.P2.ADD_ax_w   = 8'h05;
    parameter \P2.P2.P2.ROL_eax_b   = 8'hD1;
    parameter \P2.P2.P2.ROL_al_1   = 8'hD0;
    parameter \P2.P2.P2.ROL_al_n   = 8'hC0;
    parameter \P2.P2.P2.INC_eax   = 8'h40;
    parameter \P2.P2.P2.INC_ebx   = 8'h43;
    parameter \P2.P2.P2.JMP_rel_short   = 8'hEB;
    parameter \P2.P2.P2.JMP_rel_near   = 8'hE9;
    parameter \P2.P2.P2.JMP_intseg_immed   = 8'hEA;
    parameter \P2.P2.P2.HLT   = 8'hF4;
    parameter \P2.P2.P2.WAITx   = 8'h9B;
    parameter \P2.P2.P2.NOP   = 8'h90;
    parameter \P2.P2.P2.InstQueueLimit   = 15;
    parameter \P2.P2.P2.Si   = 0;
    parameter \P2.P2.P2.S1   = 1;
    parameter \P2.P2.P2.S2   = 2;
    parameter \P2.P2.P2.S3   = 3;
    parameter \P2.P2.P2.S4   = 4;
    parameter \P2.P2.P2.S5   = 5;
    parameter \P2.P2.P2.S6   = 6;
    parameter \P2.P2.P2.S7   = 7;
    parameter \P2.P2.P2.S8   = 8;
    parameter \P2.P2.P2.S9   = 9;
    parameter \P2.P2.P3.Pending   = 1'b1;
    parameter \P2.P2.P3.NotPending   = 1'b0;
    parameter \P2.P2.P3.WidthByte   = 0;
    parameter \P2.P2.P3.WidthWord   = 1;
    parameter \P2.P2.P3.WidthDword   = 2;
    parameter \P2.P2.P3.StateInit   = 0;
    parameter \P2.P2.P3.StateTi   = 1;
    parameter \P2.P2.P3.StateT1   = 2;
    parameter \P2.P2.P3.StateT2   = 3;
    parameter \P2.P2.P3.StateT1P   = 4;
    parameter \P2.P2.P3.StateTh   = 5;
    parameter \P2.P2.P3.StateT2P   = 6;
    parameter \P2.P2.P3.StateT2I   = 7;
    parameter \P2.P2.P3.REP   = 8'hF3;
    parameter \P2.P2.P3.REPNE   = 8'hF2;
    parameter \P2.P2.P3.LOCK   = 8'hF0;
    parameter \P2.P2.P3.CSsop   = 8'h2E;
    parameter \P2.P2.P3.SSsop   = 8'h36;
    parameter \P2.P2.P3.DSsop   = 8'h3E;
    parameter \P2.P2.P3.ESsop   = 8'h26;
    parameter \P2.P2.P3.FSsop   = 8'h64;
    parameter \P2.P2.P3.GSsop   = 8'h65;
    parameter \P2.P2.P3.OPsop   = 8'h66;
    parameter \P2.P2.P3.ADsop   = 8'h67;
    parameter \P2.P2.P3.MOV_al_b   = 8'hB0;
    parameter \P2.P2.P3.MOV_eax_dw   = 8'hB8;
    parameter \P2.P2.P3.MOV_ebx_dw   = 8'hBB;
    parameter \P2.P2.P3.MOV_ebx_eax   = 8'h89;
    parameter \P2.P2.P3.MOV_eax_ebx   = 8'h8B;
    parameter \P2.P2.P3.IN_al   = 8'hE4;
    parameter \P2.P2.P3.OUT_al   = 8'hE6;
    parameter \P2.P2.P3.ADD_al_b   = 8'h04;
    parameter \P2.P2.P3.ADD_ax_w   = 8'h05;
    parameter \P2.P2.P3.ROL_eax_b   = 8'hD1;
    parameter \P2.P2.P3.ROL_al_1   = 8'hD0;
    parameter \P2.P2.P3.ROL_al_n   = 8'hC0;
    parameter \P2.P2.P3.INC_eax   = 8'h40;
    parameter \P2.P2.P3.INC_ebx   = 8'h43;
    parameter \P2.P2.P3.JMP_rel_short   = 8'hEB;
    parameter \P2.P2.P3.JMP_rel_near   = 8'hE9;
    parameter \P2.P2.P3.JMP_intseg_immed   = 8'hEA;
    parameter \P2.P2.P3.HLT   = 8'hF4;
    parameter \P2.P2.P3.WAITx   = 8'h9B;
    parameter \P2.P2.P3.NOP   = 8'h90;
    parameter \P2.P2.P3.InstQueueLimit   = 15;
    parameter \P2.P2.P3.Si   = 0;
    parameter \P2.P2.P3.S1   = 1;
    parameter \P2.P2.P3.S2   = 2;
    parameter \P2.P2.P3.S3   = 3;
    parameter \P2.P2.P3.S4   = 4;
    parameter \P2.P2.P3.S5   = 5;
    parameter \P2.P2.P3.S6   = 6;
    parameter \P2.P2.P3.S7   = 7;
    parameter \P2.P2.P3.S8   = 8;
    parameter \P2.P2.P3.S9   = 9;
    parameter \P2.P3.FETCH   = 0;
    parameter \P2.P3.EXEC   = 1;
    parameter \P2.P4.FETCH   = 0;
    parameter \P2.P4.EXEC   = 1;
    input clock;
    input reset;
    input bs;
    input na;
    input hold;
    input [10:0] in1;
    input [10:0] in2;
    input [19:0] in3;
    output reg [29:0] ris;
    reg  sel1;
    reg  sel2;
    wire [19:0] do1;
    wire [19:0] do2;
    integer di1;
    integer di2;
    wire [2:0] ax1;
    wire [2:0] ax2;
    wire \P1.clock ;
    wire \P1.reset ;
    wire \P1.hold ;
    wire \P1.na ;
    wire \P1.bs ;
    wire \P1.sel ;
    reg [19:0] \P1.dout ;
    wire [31:0] \P1.din ;
    reg [2:0] \P1.aux ;
    integer \P1.di1 ;
    integer \P1.di2 ;
    wire [31:0] \P1.do1 ;
    wire [31:0] \P1.do2 ;
    integer \P1.td1 ;
    integer \P1.td2 ;
    integer \P1.di3 ;
    integer \P1.di4 ;
    wire [31:0] \P1.do3 ;
    wire [31:0] \P1.do4 ;
    reg [29:0] \P1.tad1 ;
    reg [29:0] \P1.tad2 ;
    wire [29:0] \P1.ad11 ;
    wire [29:0] \P1.ad12 ;
    wire [29:0] \P1.ad21 ;
    wire [29:0] \P1.ad22 ;
    wire [19:0] \P1.ad31 ;
    wire [19:0] \P1.ad41 ;
    reg [19:0] \P1.tad3 ;
    reg [19:0] \P1.tad4 ;
    wire \P1.wr1 ;
    wire \P1.wr2 ;
    wire \P1.wr3 ;
    wire \P1.wr4 ;
    wire \P1.dc1 ;
    wire \P1.dc2 ;
    wire \P1.mio1 ;
    wire \P1.mio2 ;
    wire \P1.as11 ;
    wire \P1.as12 ;
    wire \P1.as21 ;
    wire \P1.as22 ;
    reg  \P1.r11 ;
    reg  \P1.r12 ;
    reg  \P1.r21 ;
    reg  \P1.r22 ;
    wire \P1.rd3 ;
    wire \P1.rd4 ;
    wire \P1.P1.clock ;
    wire \P1.P1.reset ;
    wire [31:0] \P1.P1.datai ;
    wire \P1.P1.datao ;
    wire \P1.P1.hold ;
    wire \P1.P1.na ;
    wire \P1.P1.bs16 ;
    reg [29:0] \P1.P1.address1 ;
    reg [29:0] \P1.P1.address2 ;
    reg  \P1.P1.wr ;
    reg  \P1.P1.dc ;
    reg  \P1.P1.mio ;
    reg  \P1.P1.ast1 ;
    reg  \P1.P1.ast2 ;
    wire \P1.P1.ready1 ;
    wire \P1.P1.ready2 ;
    integer \P1.P1.buf1 ;
    integer \P1.P1.buf2 ;
    wire [3:0] \P1.P1.be1 ;
    wire [3:0] \P1.P1.be2 ;
    wire [3:0] \P1.P1.be3 ;
    wire [29:0] \P1.P1.addr1 ;
    wire [29:0] \P1.P1.addr2 ;
    wire [29:0] \P1.P1.addr3 ;
    wire \P1.P1.wr1 ;
    wire \P1.P1.wr2 ;
    wire \P1.P1.wr3 ;
    wire \P1.P1.dc1 ;
    wire \P1.P1.dc2 ;
    wire \P1.P1.dc3 ;
    wire \P1.P1.mio1 ;
    wire \P1.P1.mio2 ;
    wire \P1.P1.mio3 ;
    wire \P1.P1.ads1 ;
    wire \P1.P1.ads2 ;
    wire \P1.P1.ads3 ;
    integer \P1.P1.di1 ;
    integer \P1.P1.di2 ;
    integer \P1.P1.di3 ;
    wire [31:0] \P1.P1.do1 ;
    wire [31:0] \P1.P1.do2 ;
    wire [31:0] \P1.P1.do3 ;
    reg  \P1.P1.rdy1 ;
    reg  \P1.P1.rdy2 ;
    reg  \P1.P1.rdy3 ;
    reg  \P1.P1.ready11 ;
    reg  \P1.P1.ready12 ;
    reg  \P1.P1.ready21 ;
    reg  \P1.P1.ready22 ;
    reg [3:0] \P1.P1.P1.BE_n ;
    reg [29:0] \P1.P1.P1.Address ;
    reg  \P1.P1.P1.W_R_n ;
    reg  \P1.P1.P1.D_C_n ;
    reg  \P1.P1.P1.M_IO_n ;
    reg  \P1.P1.P1.ADS_n ;
    wire [31:0] \P1.P1.P1.Datai ;
    wire \P1.P1.P1.Datao ;
    wire \P1.P1.P1.CLOCK ;
    wire \P1.P1.P1.NA_n ;
    wire \P1.P1.P1.BS16_n ;
    wire \P1.P1.P1.READY_n ;
    wire \P1.P1.P1.HOLD ;
    wire \P1.P1.P1.RESET ;
    reg  \P1.P1.P1.StateNA ;
    reg  \P1.P1.P1.StateBS16 ;
    reg  \P1.P1.P1.RequestPending ;
    reg  \P1.P1.P1.NonAligned ;
    reg  \P1.P1.P1.ReadRequest ;
    reg  \P1.P1.P1.MemoryFetch ;
    reg  \P1.P1.P1.CodeFetch ;
    reg [3:0] \P1.P1.P1.ByteEnable ;
    integer \P1.P1.P1.DataWidth ;
    reg [2:0] \P1.P1.P1.State ;
    integer \P1.P1.P1.EAX ;
    integer \P1.P1.P1.EBX ;
    integer \P1.P1.P1.rEIP ;
    reg [3:0] \P1.P1.P2.BE_n ;
    reg [29:0] \P1.P1.P2.Address ;
    reg  \P1.P1.P2.W_R_n ;
    reg  \P1.P1.P2.D_C_n ;
    reg  \P1.P1.P2.M_IO_n ;
    reg  \P1.P1.P2.ADS_n ;
    wire [31:0] \P1.P1.P2.Datai ;
    wire \P1.P1.P2.Datao ;
    wire \P1.P1.P2.CLOCK ;
    wire \P1.P1.P2.NA_n ;
    wire \P1.P1.P2.BS16_n ;
    wire \P1.P1.P2.READY_n ;
    wire \P1.P1.P2.HOLD ;
    wire \P1.P1.P2.RESET ;
    reg  \P1.P1.P2.StateNA ;
    reg  \P1.P1.P2.StateBS16 ;
    reg  \P1.P1.P2.RequestPending ;
    reg  \P1.P1.P2.NonAligned ;
    reg  \P1.P1.P2.ReadRequest ;
    reg  \P1.P1.P2.MemoryFetch ;
    reg  \P1.P1.P2.CodeFetch ;
    reg [3:0] \P1.P1.P2.ByteEnable ;
    integer \P1.P1.P2.DataWidth ;
    reg [2:0] \P1.P1.P2.State ;
    integer \P1.P1.P2.EAX ;
    integer \P1.P1.P2.EBX ;
    integer \P1.P1.P2.rEIP ;
    reg [3:0] \P1.P1.P3.BE_n ;
    reg [29:0] \P1.P1.P3.Address ;
    reg  \P1.P1.P3.W_R_n ;
    reg  \P1.P1.P3.D_C_n ;
    reg  \P1.P1.P3.M_IO_n ;
    reg  \P1.P1.P3.ADS_n ;
    wire [31:0] \P1.P1.P3.Datai ;
    wire \P1.P1.P3.Datao ;
    wire \P1.P1.P3.CLOCK ;
    wire \P1.P1.P3.NA_n ;
    wire \P1.P1.P3.BS16_n ;
    wire \P1.P1.P3.READY_n ;
    wire \P1.P1.P3.HOLD ;
    wire \P1.P1.P3.RESET ;
    reg  \P1.P1.P3.StateNA ;
    reg  \P1.P1.P3.StateBS16 ;
    reg  \P1.P1.P3.RequestPending ;
    reg  \P1.P1.P3.NonAligned ;
    reg  \P1.P1.P3.ReadRequest ;
    reg  \P1.P1.P3.MemoryFetch ;
    reg  \P1.P1.P3.CodeFetch ;
    reg [3:0] \P1.P1.P3.ByteEnable ;
    integer \P1.P1.P3.DataWidth ;
    reg [2:0] \P1.P1.P3.State ;
    integer \P1.P1.P3.EAX ;
    integer \P1.P1.P3.EBX ;
    integer \P1.P1.P3.rEIP ;
    wire \P1.P2.clock ;
    wire \P1.P2.reset ;
    wire [31:0] \P1.P2.datai ;
    wire \P1.P2.datao ;
    wire \P1.P2.hold ;
    wire \P1.P2.na ;
    wire \P1.P2.bs16 ;
    reg [29:0] \P1.P2.address1 ;
    reg [29:0] \P1.P2.address2 ;
    reg  \P1.P2.wr ;
    reg  \P1.P2.dc ;
    reg  \P1.P2.mio ;
    reg  \P1.P2.ast1 ;
    reg  \P1.P2.ast2 ;
    wire \P1.P2.ready1 ;
    wire \P1.P2.ready2 ;
    integer \P1.P2.buf1 ;
    integer \P1.P2.buf2 ;
    wire [3:0] \P1.P2.be1 ;
    wire [3:0] \P1.P2.be2 ;
    wire [3:0] \P1.P2.be3 ;
    wire [29:0] \P1.P2.addr1 ;
    wire [29:0] \P1.P2.addr2 ;
    wire [29:0] \P1.P2.addr3 ;
    wire \P1.P2.wr1 ;
    wire \P1.P2.wr2 ;
    wire \P1.P2.wr3 ;
    wire \P1.P2.dc1 ;
    wire \P1.P2.dc2 ;
    wire \P1.P2.dc3 ;
    wire \P1.P2.mio1 ;
    wire \P1.P2.mio2 ;
    wire \P1.P2.mio3 ;
    wire \P1.P2.ads1 ;
    wire \P1.P2.ads2 ;
    wire \P1.P2.ads3 ;
    integer \P1.P2.di1 ;
    integer \P1.P2.di2 ;
    integer \P1.P2.di3 ;
    wire [31:0] \P1.P2.do1 ;
    wire [31:0] \P1.P2.do2 ;
    wire [31:0] \P1.P2.do3 ;
    reg  \P1.P2.rdy1 ;
    reg  \P1.P2.rdy2 ;
    reg  \P1.P2.rdy3 ;
    reg  \P1.P2.ready11 ;
    reg  \P1.P2.ready12 ;
    reg  \P1.P2.ready21 ;
    reg  \P1.P2.ready22 ;
    reg [3:0] \P1.P2.P1.BE_n ;
    reg [29:0] \P1.P2.P1.Address ;
    reg  \P1.P2.P1.W_R_n ;
    reg  \P1.P2.P1.D_C_n ;
    reg  \P1.P2.P1.M_IO_n ;
    reg  \P1.P2.P1.ADS_n ;
    wire [31:0] \P1.P2.P1.Datai ;
    wire \P1.P2.P1.Datao ;
    wire \P1.P2.P1.CLOCK ;
    wire \P1.P2.P1.NA_n ;
    wire \P1.P2.P1.BS16_n ;
    wire \P1.P2.P1.READY_n ;
    wire \P1.P2.P1.HOLD ;
    wire \P1.P2.P1.RESET ;
    reg  \P1.P2.P1.StateNA ;
    reg  \P1.P2.P1.StateBS16 ;
    reg  \P1.P2.P1.RequestPending ;
    reg  \P1.P2.P1.NonAligned ;
    reg  \P1.P2.P1.ReadRequest ;
    reg  \P1.P2.P1.MemoryFetch ;
    reg  \P1.P2.P1.CodeFetch ;
    reg [3:0] \P1.P2.P1.ByteEnable ;
    integer \P1.P2.P1.DataWidth ;
    reg [2:0] \P1.P2.P1.State ;
    integer \P1.P2.P1.EAX ;
    integer \P1.P2.P1.EBX ;
    integer \P1.P2.P1.rEIP ;
    reg [3:0] \P1.P2.P2.BE_n ;
    reg [29:0] \P1.P2.P2.Address ;
    reg  \P1.P2.P2.W_R_n ;
    reg  \P1.P2.P2.D_C_n ;
    reg  \P1.P2.P2.M_IO_n ;
    reg  \P1.P2.P2.ADS_n ;
    wire [31:0] \P1.P2.P2.Datai ;
    wire \P1.P2.P2.Datao ;
    wire \P1.P2.P2.CLOCK ;
    wire \P1.P2.P2.NA_n ;
    wire \P1.P2.P2.BS16_n ;
    wire \P1.P2.P2.READY_n ;
    wire \P1.P2.P2.HOLD ;
    wire \P1.P2.P2.RESET ;
    reg  \P1.P2.P2.StateNA ;
    reg  \P1.P2.P2.StateBS16 ;
    reg  \P1.P2.P2.RequestPending ;
    reg  \P1.P2.P2.NonAligned ;
    reg  \P1.P2.P2.ReadRequest ;
    reg  \P1.P2.P2.MemoryFetch ;
    reg  \P1.P2.P2.CodeFetch ;
    reg [3:0] \P1.P2.P2.ByteEnable ;
    integer \P1.P2.P2.DataWidth ;
    reg [2:0] \P1.P2.P2.State ;
    integer \P1.P2.P2.EAX ;
    integer \P1.P2.P2.EBX ;
    integer \P1.P2.P2.rEIP ;
    reg [3:0] \P1.P2.P3.BE_n ;
    reg [29:0] \P1.P2.P3.Address ;
    reg  \P1.P2.P3.W_R_n ;
    reg  \P1.P2.P3.D_C_n ;
    reg  \P1.P2.P3.M_IO_n ;
    reg  \P1.P2.P3.ADS_n ;
    wire [31:0] \P1.P2.P3.Datai ;
    wire \P1.P2.P3.Datao ;
    wire \P1.P2.P3.CLOCK ;
    wire \P1.P2.P3.NA_n ;
    wire \P1.P2.P3.BS16_n ;
    wire \P1.P2.P3.READY_n ;
    wire \P1.P2.P3.HOLD ;
    wire \P1.P2.P3.RESET ;
    reg  \P1.P2.P3.StateNA ;
    reg  \P1.P2.P3.StateBS16 ;
    reg  \P1.P2.P3.RequestPending ;
    reg  \P1.P2.P3.NonAligned ;
    reg  \P1.P2.P3.ReadRequest ;
    reg  \P1.P2.P3.MemoryFetch ;
    reg  \P1.P2.P3.CodeFetch ;
    reg [3:0] \P1.P2.P3.ByteEnable ;
    integer \P1.P2.P3.DataWidth ;
    reg [2:0] \P1.P2.P3.State ;
    integer \P1.P2.P3.EAX ;
    integer \P1.P2.P3.EBX ;
    integer \P1.P2.P3.rEIP ;
    wire \P1.P3.clock ;
    wire \P1.P3.reset ;
    reg [19:0] \P1.P3.addr ;
    wire [31:0] \P1.P3.datai ;
    wire \P1.P3.datao ;
    reg  \P1.P3.rd ;
    reg  \P1.P3.wr ;
    wire \P1.P4.clock ;
    wire \P1.P4.reset ;
    reg [19:0] \P1.P4.addr ;
    wire [31:0] \P1.P4.datai ;
    wire \P1.P4.datao ;
    reg  \P1.P4.rd ;
    reg  \P1.P4.wr ;
    wire \P2.clock ;
    wire \P2.reset ;
    wire \P2.hold ;
    wire \P2.na ;
    wire \P2.bs ;
    wire \P2.sel ;
    reg [19:0] \P2.dout ;
    wire [31:0] \P2.din ;
    reg [2:0] \P2.aux ;
    integer \P2.di1 ;
    integer \P2.di2 ;
    wire [31:0] \P2.do1 ;
    wire [31:0] \P2.do2 ;
    integer \P2.td1 ;
    integer \P2.td2 ;
    integer \P2.di3 ;
    integer \P2.di4 ;
    wire [31:0] \P2.do3 ;
    wire [31:0] \P2.do4 ;
    reg [29:0] \P2.tad1 ;
    reg [29:0] \P2.tad2 ;
    wire [29:0] \P2.ad11 ;
    wire [29:0] \P2.ad12 ;
    wire [29:0] \P2.ad21 ;
    wire [29:0] \P2.ad22 ;
    wire [19:0] \P2.ad31 ;
    wire [19:0] \P2.ad41 ;
    reg [19:0] \P2.tad3 ;
    reg [19:0] \P2.tad4 ;
    wire \P2.wr1 ;
    wire \P2.wr2 ;
    wire \P2.wr3 ;
    wire \P2.wr4 ;
    wire \P2.dc1 ;
    wire \P2.dc2 ;
    wire \P2.mio1 ;
    wire \P2.mio2 ;
    wire \P2.as11 ;
    wire \P2.as12 ;
    wire \P2.as21 ;
    wire \P2.as22 ;
    reg  \P2.r11 ;
    reg  \P2.r12 ;
    reg  \P2.r21 ;
    reg  \P2.r22 ;
    wire \P2.rd3 ;
    wire \P2.rd4 ;
    wire \P2.P1.clock ;
    wire \P2.P1.reset ;
    wire [31:0] \P2.P1.datai ;
    wire \P2.P1.datao ;
    wire \P2.P1.hold ;
    wire \P2.P1.na ;
    wire \P2.P1.bs16 ;
    reg [29:0] \P2.P1.address1 ;
    reg [29:0] \P2.P1.address2 ;
    reg  \P2.P1.wr ;
    reg  \P2.P1.dc ;
    reg  \P2.P1.mio ;
    reg  \P2.P1.ast1 ;
    reg  \P2.P1.ast2 ;
    wire \P2.P1.ready1 ;
    wire \P2.P1.ready2 ;
    integer \P2.P1.buf1 ;
    integer \P2.P1.buf2 ;
    wire [3:0] \P2.P1.be1 ;
    wire [3:0] \P2.P1.be2 ;
    wire [3:0] \P2.P1.be3 ;
    wire [29:0] \P2.P1.addr1 ;
    wire [29:0] \P2.P1.addr2 ;
    wire [29:0] \P2.P1.addr3 ;
    wire \P2.P1.wr1 ;
    wire \P2.P1.wr2 ;
    wire \P2.P1.wr3 ;
    wire \P2.P1.dc1 ;
    wire \P2.P1.dc2 ;
    wire \P2.P1.dc3 ;
    wire \P2.P1.mio1 ;
    wire \P2.P1.mio2 ;
    wire \P2.P1.mio3 ;
    wire \P2.P1.ads1 ;
    wire \P2.P1.ads2 ;
    wire \P2.P1.ads3 ;
    integer \P2.P1.di1 ;
    integer \P2.P1.di2 ;
    integer \P2.P1.di3 ;
    wire [31:0] \P2.P1.do1 ;
    wire [31:0] \P2.P1.do2 ;
    wire [31:0] \P2.P1.do3 ;
    reg  \P2.P1.rdy1 ;
    reg  \P2.P1.rdy2 ;
    reg  \P2.P1.rdy3 ;
    reg  \P2.P1.ready11 ;
    reg  \P2.P1.ready12 ;
    reg  \P2.P1.ready21 ;
    reg  \P2.P1.ready22 ;
    reg [3:0] \P2.P1.P1.BE_n ;
    reg [29:0] \P2.P1.P1.Address ;
    reg  \P2.P1.P1.W_R_n ;
    reg  \P2.P1.P1.D_C_n ;
    reg  \P2.P1.P1.M_IO_n ;
    reg  \P2.P1.P1.ADS_n ;
    wire [31:0] \P2.P1.P1.Datai ;
    wire \P2.P1.P1.Datao ;
    wire \P2.P1.P1.CLOCK ;
    wire \P2.P1.P1.NA_n ;
    wire \P2.P1.P1.BS16_n ;
    wire \P2.P1.P1.READY_n ;
    wire \P2.P1.P1.HOLD ;
    wire \P2.P1.P1.RESET ;
    reg  \P2.P1.P1.StateNA ;
    reg  \P2.P1.P1.StateBS16 ;
    reg  \P2.P1.P1.RequestPending ;
    reg  \P2.P1.P1.NonAligned ;
    reg  \P2.P1.P1.ReadRequest ;
    reg  \P2.P1.P1.MemoryFetch ;
    reg  \P2.P1.P1.CodeFetch ;
    reg [3:0] \P2.P1.P1.ByteEnable ;
    integer \P2.P1.P1.DataWidth ;
    reg [2:0] \P2.P1.P1.State ;
    integer \P2.P1.P1.EAX ;
    integer \P2.P1.P1.EBX ;
    integer \P2.P1.P1.rEIP ;
    reg [3:0] \P2.P1.P2.BE_n ;
    reg [29:0] \P2.P1.P2.Address ;
    reg  \P2.P1.P2.W_R_n ;
    reg  \P2.P1.P2.D_C_n ;
    reg  \P2.P1.P2.M_IO_n ;
    reg  \P2.P1.P2.ADS_n ;
    wire [31:0] \P2.P1.P2.Datai ;
    wire \P2.P1.P2.Datao ;
    wire \P2.P1.P2.CLOCK ;
    wire \P2.P1.P2.NA_n ;
    wire \P2.P1.P2.BS16_n ;
    wire \P2.P1.P2.READY_n ;
    wire \P2.P1.P2.HOLD ;
    wire \P2.P1.P2.RESET ;
    reg  \P2.P1.P2.StateNA ;
    reg  \P2.P1.P2.StateBS16 ;
    reg  \P2.P1.P2.RequestPending ;
    reg  \P2.P1.P2.NonAligned ;
    reg  \P2.P1.P2.ReadRequest ;
    reg  \P2.P1.P2.MemoryFetch ;
    reg  \P2.P1.P2.CodeFetch ;
    reg [3:0] \P2.P1.P2.ByteEnable ;
    integer \P2.P1.P2.DataWidth ;
    reg [2:0] \P2.P1.P2.State ;
    integer \P2.P1.P2.EAX ;
    integer \P2.P1.P2.EBX ;
    integer \P2.P1.P2.rEIP ;
    reg [3:0] \P2.P1.P3.BE_n ;
    reg [29:0] \P2.P1.P3.Address ;
    reg  \P2.P1.P3.W_R_n ;
    reg  \P2.P1.P3.D_C_n ;
    reg  \P2.P1.P3.M_IO_n ;
    reg  \P2.P1.P3.ADS_n ;
    wire [31:0] \P2.P1.P3.Datai ;
    wire \P2.P1.P3.Datao ;
    wire \P2.P1.P3.CLOCK ;
    wire \P2.P1.P3.NA_n ;
    wire \P2.P1.P3.BS16_n ;
    wire \P2.P1.P3.READY_n ;
    wire \P2.P1.P3.HOLD ;
    wire \P2.P1.P3.RESET ;
    reg  \P2.P1.P3.StateNA ;
    reg  \P2.P1.P3.StateBS16 ;
    reg  \P2.P1.P3.RequestPending ;
    reg  \P2.P1.P3.NonAligned ;
    reg  \P2.P1.P3.ReadRequest ;
    reg  \P2.P1.P3.MemoryFetch ;
    reg  \P2.P1.P3.CodeFetch ;
    reg [3:0] \P2.P1.P3.ByteEnable ;
    integer \P2.P1.P3.DataWidth ;
    reg [2:0] \P2.P1.P3.State ;
    integer \P2.P1.P3.EAX ;
    integer \P2.P1.P3.EBX ;
    integer \P2.P1.P3.rEIP ;
    wire \P2.P2.clock ;
    wire \P2.P2.reset ;
    wire [31:0] \P2.P2.datai ;
    wire \P2.P2.datao ;
    wire \P2.P2.hold ;
    wire \P2.P2.na ;
    wire \P2.P2.bs16 ;
    reg [29:0] \P2.P2.address1 ;
    reg [29:0] \P2.P2.address2 ;
    reg  \P2.P2.wr ;
    reg  \P2.P2.dc ;
    reg  \P2.P2.mio ;
    reg  \P2.P2.ast1 ;
    reg  \P2.P2.ast2 ;
    wire \P2.P2.ready1 ;
    wire \P2.P2.ready2 ;
    integer \P2.P2.buf1 ;
    integer \P2.P2.buf2 ;
    wire [3:0] \P2.P2.be1 ;
    wire [3:0] \P2.P2.be2 ;
    wire [3:0] \P2.P2.be3 ;
    wire [29:0] \P2.P2.addr1 ;
    wire [29:0] \P2.P2.addr2 ;
    wire [29:0] \P2.P2.addr3 ;
    wire \P2.P2.wr1 ;
    wire \P2.P2.wr2 ;
    wire \P2.P2.wr3 ;
    wire \P2.P2.dc1 ;
    wire \P2.P2.dc2 ;
    wire \P2.P2.dc3 ;
    wire \P2.P2.mio1 ;
    wire \P2.P2.mio2 ;
    wire \P2.P2.mio3 ;
    wire \P2.P2.ads1 ;
    wire \P2.P2.ads2 ;
    wire \P2.P2.ads3 ;
    integer \P2.P2.di1 ;
    integer \P2.P2.di2 ;
    integer \P2.P2.di3 ;
    wire [31:0] \P2.P2.do1 ;
    wire [31:0] \P2.P2.do2 ;
    wire [31:0] \P2.P2.do3 ;
    reg  \P2.P2.rdy1 ;
    reg  \P2.P2.rdy2 ;
    reg  \P2.P2.rdy3 ;
    reg  \P2.P2.ready11 ;
    reg  \P2.P2.ready12 ;
    reg  \P2.P2.ready21 ;
    reg  \P2.P2.ready22 ;
    reg [3:0] \P2.P2.P1.BE_n ;
    reg [29:0] \P2.P2.P1.Address ;
    reg  \P2.P2.P1.W_R_n ;
    reg  \P2.P2.P1.D_C_n ;
    reg  \P2.P2.P1.M_IO_n ;
    reg  \P2.P2.P1.ADS_n ;
    wire [31:0] \P2.P2.P1.Datai ;
    wire \P2.P2.P1.Datao ;
    wire \P2.P2.P1.CLOCK ;
    wire \P2.P2.P1.NA_n ;
    wire \P2.P2.P1.BS16_n ;
    wire \P2.P2.P1.READY_n ;
    wire \P2.P2.P1.HOLD ;
    wire \P2.P2.P1.RESET ;
    reg  \P2.P2.P1.StateNA ;
    reg  \P2.P2.P1.StateBS16 ;
    reg  \P2.P2.P1.RequestPending ;
    reg  \P2.P2.P1.NonAligned ;
    reg  \P2.P2.P1.ReadRequest ;
    reg  \P2.P2.P1.MemoryFetch ;
    reg  \P2.P2.P1.CodeFetch ;
    reg [3:0] \P2.P2.P1.ByteEnable ;
    integer \P2.P2.P1.DataWidth ;
    reg [2:0] \P2.P2.P1.State ;
    integer \P2.P2.P1.EAX ;
    integer \P2.P2.P1.EBX ;
    integer \P2.P2.P1.rEIP ;
    reg [3:0] \P2.P2.P2.BE_n ;
    reg [29:0] \P2.P2.P2.Address ;
    reg  \P2.P2.P2.W_R_n ;
    reg  \P2.P2.P2.D_C_n ;
    reg  \P2.P2.P2.M_IO_n ;
    reg  \P2.P2.P2.ADS_n ;
    wire [31:0] \P2.P2.P2.Datai ;
    wire \P2.P2.P2.Datao ;
    wire \P2.P2.P2.CLOCK ;
    wire \P2.P2.P2.NA_n ;
    wire \P2.P2.P2.BS16_n ;
    wire \P2.P2.P2.READY_n ;
    wire \P2.P2.P2.HOLD ;
    wire \P2.P2.P2.RESET ;
    reg  \P2.P2.P2.StateNA ;
    reg  \P2.P2.P2.StateBS16 ;
    reg  \P2.P2.P2.RequestPending ;
    reg  \P2.P2.P2.NonAligned ;
    reg  \P2.P2.P2.ReadRequest ;
    reg  \P2.P2.P2.MemoryFetch ;
    reg  \P2.P2.P2.CodeFetch ;
    reg [3:0] \P2.P2.P2.ByteEnable ;
    integer \P2.P2.P2.DataWidth ;
    reg [2:0] \P2.P2.P2.State ;
    integer \P2.P2.P2.EAX ;
    integer \P2.P2.P2.EBX ;
    integer \P2.P2.P2.rEIP ;
    reg [3:0] \P2.P2.P3.BE_n ;
    reg [29:0] \P2.P2.P3.Address ;
    reg  \P2.P2.P3.W_R_n ;
    reg  \P2.P2.P3.D_C_n ;
    reg  \P2.P2.P3.M_IO_n ;
    reg  \P2.P2.P3.ADS_n ;
    wire [31:0] \P2.P2.P3.Datai ;
    wire \P2.P2.P3.Datao ;
    wire \P2.P2.P3.CLOCK ;
    wire \P2.P2.P3.NA_n ;
    wire \P2.P2.P3.BS16_n ;
    wire \P2.P2.P3.READY_n ;
    wire \P2.P2.P3.HOLD ;
    wire \P2.P2.P3.RESET ;
    reg  \P2.P2.P3.StateNA ;
    reg  \P2.P2.P3.StateBS16 ;
    reg  \P2.P2.P3.RequestPending ;
    reg  \P2.P2.P3.NonAligned ;
    reg  \P2.P2.P3.ReadRequest ;
    reg  \P2.P2.P3.MemoryFetch ;
    reg  \P2.P2.P3.CodeFetch ;
    reg [3:0] \P2.P2.P3.ByteEnable ;
    integer \P2.P2.P3.DataWidth ;
    reg [2:0] \P2.P2.P3.State ;
    integer \P2.P2.P3.EAX ;
    integer \P2.P2.P3.EBX ;
    integer \P2.P2.P3.rEIP ;
    wire \P2.P3.clock ;
    wire \P2.P3.reset ;
    reg [19:0] \P2.P3.addr ;
    wire [31:0] \P2.P3.datai ;
    wire \P2.P3.datao ;
    reg  \P2.P3.rd ;
    reg  \P2.P3.wr ;
    wire \P2.P4.clock ;
    wire \P2.P4.reset ;
    reg [19:0] \P2.P4.addr ;
    wire [31:0] \P2.P4.datai ;
    wire \P2.P4.datao ;
    reg  \P2.P4.rd ;
    reg  \P2.P4.wr ;
    always @ (  posedge clock or  posedge reset)
    begin
        if ( reset == 1'b1 ) 
        begin
            sel1 <= 1'b0;
            sel2 <= 1'b0;
        end
        else
        begin
            if ( do1 == 39 ) 
            begin
                sel2 <= 1'b1;
            end
            else
            begin 
                if ( do1 == 1735 ) 
                begin
                    sel2 <= 1'b0;
                end
            end
            if ( do2 == 398 ) 
            begin
                sel1 <= 1'b1;
            end
            else
            begin 
                if ( do2 == 1013 ) 
                begin
                    sel1 <= 1'b0;
                end
            end
        end
    end
    always @ (  sel1 or  sel2 or  in1 or  in2 or  in3 or  do1 or  do2 or  ax1 or  ax2)
    begin
        if ( ( sel1 == 1'b0 ) & ( sel2 == 1'b1 ) ) 
        begin
            di1 <= ( in1 / 2 );
            di2 <= ( in2 / 16 );
        end
        else
        begin
            di1 <= ( in1 / 2 );
            di2 <= ( in2 / 8 );
        end
        ris <= ( ( ( ax1 - ax2 ) * do1 ) - ( ( ax1 - ax2 ) * do2 ) );
    end
    assign \P1.clock  = clock;
    assign \P1.reset  = reset;
    assign \P1.hold  = hold;
    assign \P1.na  = na;
    assign \P1.bs  = bs;
    assign \P1.sel  = sel1;
    assign do1 = \P1.dout ;
    assign \P1.din  = di1;
    assign ax1 = \P1.aux ;
    assign \P1.P1.clock  = \P1.clock ;
    assign \P1.P1.reset  = \P1.reset ;
    assign \P1.P1.datai  = \P1.di1 ;
    assign \P1.do1  = \P1.P1.datao ;
    assign \P1.P1.hold  = \P1.hold ;
    assign \P1.P1.na  = \P1.na ;
    assign \P1.P1.bs16  = \P1.bs ;
    assign \P1.ad11  = \P1.P1.address1 ;
    assign \P1.ad12  = \P1.P1.address2 ;
    assign \P1.wr1  = \P1.P1.wr ;
    assign \P1.dc1  = \P1.P1.dc ;
    assign \P1.mio1  = \P1.P1.mio ;
    assign \P1.as11  = \P1.P1.ast1 ;
    assign \P1.as12  = \P1.P1.ast2 ;
    assign \P1.P1.ready1  = \P1.r11 ;
    assign \P1.P1.ready2  = \P1.r12 ;
    always @ (  posedge \P1.P1.clock  or  posedge \P1.P1.reset )
    begin
        if ( \P1.P1.reset  == 1'b1 ) 
        begin
            \P1.P1.buf1  <= 0;
            \P1.P1.ready11  <= 1'b0;
            \P1.P1.ready12  <= 1'b0;
        end
        else
        begin
            if ( ( ( ( ( ( \P1.P1.addr1  > ( 2 ** 29 ) ) & ( \P1.P1.ads1  == 1'b0 ) ) & ( \P1.P1.mio1  == 1'b1 ) ) & ( \P1.P1.dc1  == 1'b0 ) ) & ( \P1.P1.wr1  == 1'b1 ) ) & ( \P1.P1.be1  == 4'b0000 ) ) 
            begin
                \P1.P1.buf1  <= \P1.P1.do1 ;
                \P1.P1.ready11  <= 1'b0;
                \P1.P1.ready12  <= 1'b1;
            end
            else
            begin 
                if ( ( ( ( ( ( \P1.P1.addr2  > ( 2 ** 29 ) ) & ( \P1.P1.ads2  == 1'b0 ) ) & ( \P1.P1.mio2  == 1'b1 ) ) & ( \P1.P1.dc2  == 1'b0 ) ) & ( \P1.P1.wr2  == 1'b1 ) ) & ( \P1.P1.be2  == 4'b0000 ) ) 
                begin
                    \P1.P1.buf1  <= \P1.P1.do2 ;
                    \P1.P1.ready11  <= 1'b1;
                    \P1.P1.ready12  <= 1'b0;
                end
                else
                begin
                    \P1.P1.ready11  <= 1'b1;
                    \P1.P1.ready12  <= 1'b1;
                end
            end
        end
    end
    always @ (  posedge \P1.P1.clock  or  posedge \P1.P1.reset )
    begin
        if ( \P1.P1.reset  == 1'b1 ) 
        begin
            \P1.P1.buf2  <= 0;
            \P1.P1.ready21  <= 1'b0;
            \P1.P1.ready22  <= 1'b0;
        end
        else
        begin
            if ( ( ( ( ( ( \P1.P1.addr2  < ( 2 ** 29 ) ) & ( \P1.P1.ads2  == 1'b0 ) ) & ( \P1.P1.mio2  == 1'b1 ) ) & ( \P1.P1.dc2  == 1'b0 ) ) & ( \P1.P1.wr2  == 1'b1 ) ) & ( \P1.P1.be2  == 4'b0000 ) ) 
            begin
                \P1.P1.buf2  <= \P1.P1.do2 ;
                \P1.P1.ready21  <= 1'b0;
                \P1.P1.ready22  <= 1'b1;
            end
            else
            begin 
                if ( ( ( ( ( \P1.P1.ads3  == 1'b0 ) & ( \P1.P1.mio3  == 1'b1 ) ) & ( \P1.P1.dc3  == 1'b0 ) ) & ( \P1.P1.wr3  == 1'b0 ) ) & ( \P1.P1.be3  == 4'b0000 ) ) 
                begin
                    \P1.P1.ready21  <= 1'b1;
                    \P1.P1.ready22  <= 1'b0;
                end
                else
                begin
                    \P1.P1.ready21  <= 1'b1;
                    \P1.P1.ready22  <= 1'b1;
                end
            end
        end
    end
    always @ (  \P1.P1.addr1  or  \P1.P1.buf1  or  \P1.P1.datai )
    begin
        if ( \P1.P1.addr1  > ( 2 ** 29 ) ) 
        begin
            \P1.P1.di1  <= \P1.P1.buf1 ;
        end
        else
        begin 
            \P1.P1.di1  <= \P1.P1.datai ;
        end
    end
    always @ (  \P1.P1.addr2  or  \P1.P1.buf1  or  \P1.P1.buf2 )
    begin
        if ( \P1.P1.addr2  > ( 2 ** 29 ) ) 
        begin
            \P1.P1.di2  <= \P1.P1.buf1 ;
        end
        else
        begin 
            \P1.P1.di2  <= \P1.P1.buf2 ;
        end
    end
    always @ (  \P1.P1.addr2  or  \P1.P1.addr3  or  \P1.P1.do1  or  \P1.P1.do2  or  \P1.P1.do3 )
    begin
        if ( ( ( \P1.P1.do1  < ( 2 ** 30 ) ) & ( \P1.P1.do2  < ( 2 ** 30 ) ) ) & ( \P1.P1.do3  < ( 2 ** 30 ) ) ) 
        begin
            \P1.P1.address2  <= \P1.P1.addr3 ;
        end
        else
        begin 
            \P1.P1.address2  <= \P1.P1.addr2 ;
        end
    end
    always @ (  \P1.P1.buf2  or  \P1.P1.do3  or  \P1.P1.addr1  or  \P1.P1.wr3  or  \P1.P1.dc3  or  \P1.P1.mio3  or  \P1.P1.ads1  or  \P1.P1.ads3  or  \P1.P1.ready1  or  \P1.P1.ready2  or  \P1.P1.ready11  or  \P1.P1.ready12  or  \P1.P1.ready21  or  \P1.P1.ready22 )
    begin
        \P1.P1.di3  <= \P1.P1.buf2 ;
        \P1.P1.datao  <= \P1.P1.do3 ;
        \P1.P1.address1  <= \P1.P1.addr1 ;
        \P1.P1.wr  <= \P1.P1.wr3 ;
        \P1.P1.dc  <= \P1.P1.dc3 ;
        \P1.P1.mio  <= \P1.P1.mio3 ;
        \P1.P1.ast1  <= \P1.P1.ads1 ;
        \P1.P1.ast2  <= \P1.P1.ads3 ;
        \P1.P1.rdy1  <= ( \P1.P1.ready11  & \P1.P1.ready1  );
        \P1.P1.rdy2  <= ( \P1.P1.ready12  & \P1.P1.ready21  );
        \P1.P1.rdy3  <= ( \P1.P1.ready22  & \P1.P1.ready2  );
    end
    assign \P1.P1.be1  = \P1.P1.P1.BE_n ;
    assign \P1.P1.addr1  = \P1.P1.P1.Address ;
    assign \P1.P1.wr1  = \P1.P1.P1.W_R_n ;
    assign \P1.P1.dc1  = \P1.P1.P1.D_C_n ;
    assign \P1.P1.mio1  = \P1.P1.P1.M_IO_n ;
    assign \P1.P1.ads1  = \P1.P1.P1.ADS_n ;
    assign \P1.P1.P1.Datai  = \P1.P1.di1 ;
    assign \P1.P1.do1  = \P1.P1.P1.Datao ;
    assign \P1.P1.P1.CLOCK  = \P1.P1.clock ;
    assign \P1.P1.P1.NA_n  = \P1.P1.na ;
    assign \P1.P1.P1.BS16_n  = \P1.P1.bs16 ;
    assign \P1.P1.P1.READY_n  = \P1.P1.rdy1 ;
    assign \P1.P1.P1.HOLD  = \P1.P1.hold ;
    assign \P1.P1.P1.RESET  = \P1.P1.reset ;
    always @ (  posedge \P1.P1.P1.CLOCK  or  posedge \P1.P1.P1.RESET )
    begin : \P1.P1.P1.P0 
        if ( \P1.P1.P1.RESET  == 1'b1 ) 
        begin
            \P1.P1.P1.BE_n  <= 4'b0000;
            \P1.P1.P1.Address  <= 0;
            \P1.P1.P1.W_R_n  <= 1'b0;
            \P1.P1.P1.D_C_n  <= 1'b0;
            \P1.P1.P1.M_IO_n  <= 1'b0;
            \P1.P1.P1.ADS_n  <= 1'b0;
            \P1.P1.P1.State  <= \P1.P1.P1.StateInit ;
            \P1.P1.P1.StateNA  <= 1'b0;
            \P1.P1.P1.StateBS16  <= 1'b0;
            \P1.P1.P1.DataWidth  <= 0;
        end
        else
        begin 
            case ( \P1.P1.P1.State  ) 
            \P1.P1.P1.StateInit :
            begin
                \P1.P1.P1.D_C_n  <= 1'b1;
                \P1.P1.P1.ADS_n  <= 1'b1;
                \P1.P1.P1.State  <= \P1.P1.P1.StateTi ;
                \P1.P1.P1.StateNA  <= 1'b1;
                \P1.P1.P1.StateBS16  <= 1'b1;
                \P1.P1.P1.DataWidth  <= 2;
                \P1.P1.P1.State  <= \P1.P1.P1.StateTi ;
            end
            \P1.P1.P1.StateTi :
            begin
                if ( \P1.P1.P1.RequestPending  == \P1.P1.P1.Pending  ) 
                begin
                    \P1.P1.P1.State  <= \P1.P1.P1.StateT1 ;
                end
                else
                begin 
                    if ( \P1.P1.P1.HOLD  == 1'b1 ) 
                    begin
                        \P1.P1.P1.State  <= \P1.P1.P1.StateTh ;
                    end
                    else
                    begin 
                        \P1.P1.P1.State  <= \P1.P1.P1.StateTi ;
                    end
                end
            end
            \P1.P1.P1.StateT1 :
            begin
                \P1.P1.P1.Address  <= ( ( \P1.P1.P1.rEIP  / 4 ) % ( 2 ** 30 ) );
                \P1.P1.P1.BE_n  <= \P1.P1.P1.ByteEnable ;
                \P1.P1.P1.M_IO_n  <= \P1.P1.P1.MemoryFetch ;
                if ( \P1.P1.P1.ReadRequest  == \P1.P1.P1.Pending  ) 
                begin
                    \P1.P1.P1.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P1.P1.W_R_n  <= 1'b1;
                end
                if ( \P1.P1.P1.CodeFetch  == \P1.P1.P1.Pending  ) 
                begin
                    \P1.P1.P1.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P1.P1.D_C_n  <= 1'b1;
                end
                \P1.P1.P1.ADS_n  <= 1'b0;
                \P1.P1.P1.State  <= \P1.P1.P1.StateT2 ;
            end
            \P1.P1.P1.StateT2 :
            begin
                if ( ( ( \P1.P1.P1.READY_n  == 1'b0 ) & ( \P1.P1.P1.HOLD  == 1'b0 ) ) & ( \P1.P1.P1.RequestPending  == \P1.P1.P1.Pending  ) ) 
                begin
                    \P1.P1.P1.State  <= \P1.P1.P1.StateT1 ;
                end
                else
                begin 
                    if ( ( \P1.P1.P1.READY_n  == 1'b1 ) & ( \P1.P1.P1.NA_n  == 1'b1 ) ) 
                    begin
                    end
                    else
                    begin 
                        if ( ( ( \P1.P1.P1.RequestPending  == \P1.P1.P1.Pending  ) | ( \P1.P1.P1.HOLD  == 1'b1 ) ) & ( ( \P1.P1.P1.READY_n  == 1'b1 ) & ( \P1.P1.P1.NA_n  == 1'b0 ) ) ) 
                        begin
                            \P1.P1.P1.State  <= \P1.P1.P1.StateT2I ;
                        end
                        else
                        begin 
                            if ( ( ( ( \P1.P1.P1.RequestPending  == \P1.P1.P1.Pending  ) & ( \P1.P1.P1.HOLD  == 1'b0 ) ) & ( \P1.P1.P1.READY_n  == 1'b1 ) ) & ( \P1.P1.P1.NA_n  == 1'b0 ) ) 
                            begin
                                \P1.P1.P1.State  <= \P1.P1.P1.StateT2P ;
                            end
                            else
                            begin 
                                if ( ( ( \P1.P1.P1.RequestPending  == \P1.P1.P1.NotPending  ) & ( \P1.P1.P1.HOLD  == 1'b0 ) ) & ( \P1.P1.P1.READY_n  == 1'b0 ) ) 
                                begin
                                    \P1.P1.P1.State  <= \P1.P1.P1.StateTi ;
                                end
                                else
                                begin 
                                    if ( ( \P1.P1.P1.HOLD  == 1'b1 ) & ( \P1.P1.P1.READY_n  == 1'b1 ) ) 
                                    begin
                                        \P1.P1.P1.State  <= \P1.P1.P1.StateTh ;
                                    end
                                    else
                                    begin 
                                        \P1.P1.P1.State  <= \P1.P1.P1.StateT2 ;
                                    end
                                end
                            end
                        end
                    end
                end
                \P1.P1.P1.StateBS16  <= \P1.P1.P1.BS16_n ;
                if ( \P1.P1.P1.BS16_n  == 1'b0 ) 
                begin
                    \P1.P1.P1.DataWidth  <= \P1.P1.P1.WidthWord ;
                end
                else
                begin 
                    \P1.P1.P1.DataWidth  <= \P1.P1.P1.WidthDword ;
                end
                \P1.P1.P1.StateNA  <= \P1.P1.P1.NA_n ;
                \P1.P1.P1.ADS_n  <= 1'b1;
            end
            \P1.P1.P1.StateT1P :
            begin
                if ( ( ( \P1.P1.P1.NA_n  == 1'b0 ) & ( \P1.P1.P1.HOLD  == 1'b0 ) ) & ( \P1.P1.P1.RequestPending  == \P1.P1.P1.Pending  ) ) 
                begin
                    \P1.P1.P1.State  <= \P1.P1.P1.StateT2P ;
                end
                else
                begin 
                    if ( ( \P1.P1.P1.NA_n  == 1'b0 ) & ( ( \P1.P1.P1.HOLD  == 1'b1 ) | ( \P1.P1.P1.RequestPending  == \P1.P1.P1.NotPending  ) ) ) 
                    begin
                        \P1.P1.P1.State  <= \P1.P1.P1.StateT2I ;
                    end
                    else
                    begin 
                        if ( \P1.P1.P1.NA_n  == 1'b1 ) 
                        begin
                            \P1.P1.P1.State  <= \P1.P1.P1.StateT2 ;
                        end
                        else
                        begin 
                            \P1.P1.P1.State  <= \P1.P1.P1.StateT1P ;
                        end
                    end
                end
                \P1.P1.P1.StateBS16  <= \P1.P1.P1.BS16_n ;
                if ( \P1.P1.P1.BS16_n  == 1'b0 ) 
                begin
                    \P1.P1.P1.DataWidth  <= \P1.P1.P1.WidthWord ;
                end
                else
                begin 
                    \P1.P1.P1.DataWidth  <= \P1.P1.P1.WidthDword ;
                end
                \P1.P1.P1.StateNA  <= \P1.P1.P1.NA_n ;
                \P1.P1.P1.ADS_n  <= 1'b1;
            end
            \P1.P1.P1.StateTh :
            begin
                if ( ( \P1.P1.P1.HOLD  == 1'b0 ) & ( \P1.P1.P1.RequestPending  == \P1.P1.P1.Pending  ) ) 
                begin
                    \P1.P1.P1.State  <= \P1.P1.P1.StateT1 ;
                end
                else
                begin 
                    if ( ( \P1.P1.P1.HOLD  == 1'b0 ) & ( \P1.P1.P1.RequestPending  == \P1.P1.P1.NotPending  ) ) 
                    begin
                        \P1.P1.P1.State  <= \P1.P1.P1.StateTi ;
                    end
                    else
                    begin 
                        \P1.P1.P1.State  <= \P1.P1.P1.StateTh ;
                    end
                end
            end
            \P1.P1.P1.StateT2P :
            begin
                \P1.P1.P1.Address  <= ( ( \P1.P1.P1.rEIP  / 2 ) % ( 2 ** 30 ) );
                \P1.P1.P1.BE_n  <= \P1.P1.P1.ByteEnable ;
                \P1.P1.P1.M_IO_n  <= \P1.P1.P1.MemoryFetch ;
                if ( \P1.P1.P1.ReadRequest  == \P1.P1.P1.Pending  ) 
                begin
                    \P1.P1.P1.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P1.P1.W_R_n  <= 1'b1;
                end
                if ( \P1.P1.P1.CodeFetch  == \P1.P1.P1.Pending  ) 
                begin
                    \P1.P1.P1.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P1.P1.D_C_n  <= 1'b1;
                end
                \P1.P1.P1.ADS_n  <= 1'b0;
                if ( \P1.P1.P1.READY_n  == 1'b0 ) 
                begin
                    \P1.P1.P1.State  <= \P1.P1.P1.StateT1P ;
                end
                else
                begin 
                    \P1.P1.P1.State  <= \P1.P1.P1.StateT2P ;
                end
            end
            \P1.P1.P1.StateT2I :
            begin
                if ( ( ( \P1.P1.P1.READY_n  == 1'b1 ) & ( \P1.P1.P1.RequestPending  == \P1.P1.P1.Pending  ) ) & ( \P1.P1.P1.HOLD  == 1'b0 ) ) 
                begin
                    \P1.P1.P1.State  <= \P1.P1.P1.StateT2P ;
                end
                else
                begin 
                    if ( ( \P1.P1.P1.READY_n  == 1'b0 ) & ( \P1.P1.P1.HOLD  == 1'b1 ) ) 
                    begin
                        \P1.P1.P1.State  <= \P1.P1.P1.StateTh ;
                    end
                    else
                    begin 
                        if ( ( ( \P1.P1.P1.READY_n  == 1'b0 ) & ( \P1.P1.P1.HOLD  == 1'b0 ) ) & ( \P1.P1.P1.RequestPending  == \P1.P1.P1.Pending  ) ) 
                        begin
                            \P1.P1.P1.State  <= \P1.P1.P1.StateT1 ;
                        end
                        else
                        begin 
                            if ( ( ( \P1.P1.P1.READY_n  == 1'b0 ) & ( \P1.P1.P1.HOLD  == 1'b0 ) ) & ( \P1.P1.P1.RequestPending  == \P1.P1.P1.NotPending  ) ) 
                            begin
                                \P1.P1.P1.State  <= \P1.P1.P1.StateTi ;
                            end
                            else
                            begin 
                                \P1.P1.P1.State  <= \P1.P1.P1.StateT2I ;
                            end
                        end
                    end
                end
            end
            endcase
        end
    end
    always @ (  posedge \P1.P1.P1.CLOCK  or  posedge \P1.P1.P1.RESET )
    begin : \P1.P1.P1.P1 
        reg [7:0] \P1.P1.P1.InstQueue [15:0];
        reg [4:0] \P1.P1.P1.InstQueueRd_Addr ;
        reg [4:0] \P1.P1.P1.InstQueueWr_Addr ;
        parameter \P1.P1.P1.InstQueueLimit   = 15;
        integer \P1.P1.P1.InstAddrPointer ;
        integer \P1.P1.P1.PhyAddrPointer ;
        reg  \P1.P1.P1.Extended ;
        reg  \P1.P1.P1.More ;
        reg  \P1.P1.P1.Flush ;
        reg [15:0] \P1.P1.P1.lWord ;
        reg [14:0] \P1.P1.P1.uWord ;
        integer \P1.P1.P1.fWord ;
        reg [3:0] \P1.P1.P1.State2 ;
        parameter \P1.P1.P1.Si   = 0;
        parameter \P1.P1.P1.S1   = 1;
        parameter \P1.P1.P1.S2   = 2;
        parameter \P1.P1.P1.S3   = 3;
        parameter \P1.P1.P1.S4   = 4;
        parameter \P1.P1.P1.S5   = 5;
        parameter \P1.P1.P1.S6   = 6;
        parameter \P1.P1.P1.S7   = 7;
        parameter \P1.P1.P1.S8   = 8;
        parameter \P1.P1.P1.S9   = 9;
        if ( \P1.P1.P1.RESET  == 1'b1 ) 
        begin
            \P1.P1.P1.State2  = \P1.P1.P1.Si ;
            \P1.P1.P1.InstQueue  = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            \P1.P1.P1.InstQueueRd_Addr  = 0;
            \P1.P1.P1.InstQueueWr_Addr  = 0;
            \P1.P1.P1.InstAddrPointer  = 0;
            \P1.P1.P1.PhyAddrPointer  = 0;
            \P1.P1.P1.Extended  = 1'b0;
            \P1.P1.P1.More  = 1'b0;
            \P1.P1.P1.Flush  = 1'b0;
            \P1.P1.P1.lWord  = 0;
            \P1.P1.P1.uWord  = 0;
            \P1.P1.P1.fWord  = 0;
            \P1.P1.P1.CodeFetch  <= 1'b0;
            \P1.P1.P1.Datao  <= 0;
            \P1.P1.P1.EAX  <= 0;
            \P1.P1.P1.EBX  <= 0;
            \P1.P1.P1.rEIP  <= 0;
            \P1.P1.P1.ReadRequest  <= 1'b0;
            \P1.P1.P1.MemoryFetch  <= 1'b0;
            \P1.P1.P1.RequestPending  <= 1'b0;
        end
        else
        begin 
            case ( \P1.P1.P1.State2  ) 
            \P1.P1.P1.Si :
            begin
                \P1.P1.P1.PhyAddrPointer  = \P1.P1.P1.rEIP ;
                \P1.P1.P1.InstAddrPointer  = \P1.P1.P1.PhyAddrPointer ;
                \P1.P1.P1.State2  = \P1.P1.P1.S1 ;
                \P1.P1.P1.rEIP  <= 20'hFFFF0;
                \P1.P1.P1.ReadRequest  <= 1'b1;
                \P1.P1.P1.MemoryFetch  <= 1'b1;
                \P1.P1.P1.RequestPending  <= 1'b1;
            end
            \P1.P1.P1.S1 :
            begin
                \P1.P1.P1.RequestPending  <= \P1.P1.P1.Pending ;
                \P1.P1.P1.ReadRequest  <= \P1.P1.P1.Pending ;
                \P1.P1.P1.MemoryFetch  <= \P1.P1.P1.Pending ;
                \P1.P1.P1.CodeFetch  <= \P1.P1.P1.Pending ;
                if ( \P1.P1.P1.READY_n  == 1'b0 ) 
                begin
                    \P1.P1.P1.State2  = \P1.P1.P1.S2 ;
                end
                else
                begin 
                    \P1.P1.P1.State2  = \P1.P1.P1.S1 ;
                end
            end
            \P1.P1.P1.S2 :
            begin
                \P1.P1.P1.RequestPending  <= \P1.P1.P1.NotPending ;
                \P1.P1.P1.InstQueue [\P1.P1.P1.InstQueueWr_Addr ] = ( \P1.P1.P1.Datai  % ( 2 ** 8 ) );
                \P1.P1.P1.InstQueueWr_Addr  = ( ( \P1.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P1.P1.InstQueue [\P1.P1.P1.InstQueueWr_Addr ] = ( \P1.P1.P1.Datai  % ( 2 ** 8 ) );
                \P1.P1.P1.InstQueueWr_Addr  = ( ( \P1.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                if ( \P1.P1.P1.StateBS16  == 1'b1 ) 
                begin
                    \P1.P1.P1.InstQueue [\P1.P1.P1.InstQueueWr_Addr ] = ( ( \P1.P1.P1.Datai  / ( 2 ** 16 ) ) % ( 2 ** 8 ) );
                    \P1.P1.P1.InstQueueWr_Addr  = ( ( \P1.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P1.P1.InstQueue [\P1.P1.P1.InstQueueWr_Addr ] = ( ( \P1.P1.P1.Datai  / ( 2 ** 24 ) ) % ( 2 ** 8 ) );
                    \P1.P1.P1.InstQueueWr_Addr  = ( ( \P1.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P1.P1.PhyAddrPointer  = ( \P1.P1.P1.PhyAddrPointer  + 4 );
                    \P1.P1.P1.State2  = \P1.P1.P1.S5 ;
                end
                else
                begin
                    \P1.P1.P1.PhyAddrPointer  = ( \P1.P1.P1.PhyAddrPointer  + 2 );
                    if ( \P1.P1.P1.PhyAddrPointer  < 0 ) 
                    begin
                        \P1.P1.P1.rEIP  <=  -( \P1.P1.P1.PhyAddrPointer );
                    end
                    else
                    begin 
                        \P1.P1.P1.rEIP  <= \P1.P1.P1.PhyAddrPointer ;
                    end
                    \P1.P1.P1.State2  = \P1.P1.P1.S3 ;
                end
            end
            \P1.P1.P1.S3 :
            begin
                \P1.P1.P1.RequestPending  <= \P1.P1.P1.Pending ;
                if ( \P1.P1.P1.READY_n  == 1'b0 ) 
                begin
                    \P1.P1.P1.State2  = \P1.P1.P1.S4 ;
                end
                else
                begin 
                    \P1.P1.P1.State2  = \P1.P1.P1.S3 ;
                end
            end
            \P1.P1.P1.S4 :
            begin
                \P1.P1.P1.RequestPending  <= \P1.P1.P1.NotPending ;
                \P1.P1.P1.InstQueue [\P1.P1.P1.InstQueueWr_Addr ] = ( \P1.P1.P1.Datai  % ( 2 ** 8 ) );
                \P1.P1.P1.InstQueueWr_Addr  = ( ( \P1.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P1.P1.InstQueue [\P1.P1.P1.InstQueueWr_Addr ] = ( \P1.P1.P1.Datai  % ( 2 ** 8 ) );
                \P1.P1.P1.InstQueueWr_Addr  = ( ( \P1.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P1.P1.PhyAddrPointer  = ( \P1.P1.P1.PhyAddrPointer  + 2 );
                \P1.P1.P1.State2  = \P1.P1.P1.S5 ;
            end
            \P1.P1.P1.S5 :
            begin
                case ( \P1.P1.P1.InstQueue [\P1.P1.P1.InstQueueRd_Addr ] ) 
                \P1.P1.P1.NOP :
                begin
                    \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 1 );
                    \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P1.Flush  = 1'b0;
                    \P1.P1.P1.More  = 1'b0;
                end
                \P1.P1.P1.OPsop :
                begin
                    \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 1 );
                    \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P1.Extended  = 1'b1;
                    \P1.P1.P1.Flush  = 1'b0;
                    \P1.P1.P1.More  = 1'b0;
                end
                \P1.P1.P1.JMP_rel_short :
                begin
                    if ( ( \P1.P1.P1.InstQueueWr_Addr  - \P1.P1.P1.InstQueueRd_Addr  ) >= 3 ) 
                    begin
                        if ( \P1.P1.P1.InstQueue [( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 )] > 127 ) 
                        begin
                            \P1.P1.P1.PhyAddrPointer  = ( ( \P1.P1.P1.InstAddrPointer  + 1 ) - ( 8'hFF - \P1.P1.P1.InstQueue [( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 )] ) );
                            \P1.P1.P1.InstAddrPointer  = \P1.P1.P1.PhyAddrPointer ;
                        end
                        else
                        begin
                            \P1.P1.P1.PhyAddrPointer  = ( ( \P1.P1.P1.InstAddrPointer  + 2 ) + \P1.P1.P1.InstQueue [( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 )] );
                            \P1.P1.P1.InstAddrPointer  = \P1.P1.P1.PhyAddrPointer ;
                        end
                        \P1.P1.P1.Flush  = 1'b1;
                        \P1.P1.P1.More  = 1'b0;
                    end
                    else
                    begin
                        \P1.P1.P1.Flush  = 1'b0;
                        \P1.P1.P1.More  = 1'b1;
                    end
                end
                \P1.P1.P1.JMP_rel_near :
                begin
                    if ( ( \P1.P1.P1.InstQueueWr_Addr  - \P1.P1.P1.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P1.P1.PhyAddrPointer  = ( ( \P1.P1.P1.InstAddrPointer  + 5 ) + \P1.P1.P1.InstQueue [( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P1.P1.P1.InstAddrPointer  = \P1.P1.P1.PhyAddrPointer ;
                        \P1.P1.P1.Flush  = 1'b1;
                        \P1.P1.P1.More  = 1'b0;
                    end
                    else
                    begin
                        \P1.P1.P1.Flush  = 1'b0;
                        \P1.P1.P1.More  = 1'b1;
                    end
                end
                \P1.P1.P1.JMP_intseg_immed :
                begin
                    \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 1 );
                    \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P1.Flush  = 1'b0;
                    \P1.P1.P1.More  = 1'b0;
                end
                \P1.P1.P1.MOV_al_b :
                begin
                    \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 1 );
                    \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P1.Flush  = 1'b0;
                    \P1.P1.P1.More  = 1'b0;
                end
                \P1.P1.P1.MOV_eax_dw :
                begin
                    if ( ( \P1.P1.P1.InstQueueWr_Addr  - \P1.P1.P1.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P1.P1.EAX  <= ( ( ( ( \P1.P1.P1.InstQueue [( ( \P1.P1.P1.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P1.P1.P1.InstQueue [( ( \P1.P1.P1.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P1.P1.P1.InstQueue [( ( \P1.P1.P1.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P1.P1.P1.InstQueue [( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P1.P1.P1.More  = 1'b0;
                        \P1.P1.P1.Flush  = 1'b0;
                        \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 5 );
                        \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P1.P1.P1.Flush  = 1'b0;
                        \P1.P1.P1.More  = 1'b1;
                    end
                end
                \P1.P1.P1.MOV_ebx_dw :
                begin
                    if ( ( \P1.P1.P1.InstQueueWr_Addr  - \P1.P1.P1.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P1.P1.EBX  <= ( ( ( ( \P1.P1.P1.InstQueue [( ( \P1.P1.P1.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P1.P1.P1.InstQueue [( ( \P1.P1.P1.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P1.P1.P1.InstQueue [( ( \P1.P1.P1.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P1.P1.P1.InstQueue [( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 1 )] );
                        \P1.P1.P1.More  = 1'b0;
                        \P1.P1.P1.Flush  = 1'b0;
                        \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 5 );
                        \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P1.P1.P1.Flush  = 1'b0;
                        \P1.P1.P1.More  = 1'b1;
                    end
                end
                \P1.P1.P1.MOV_eax_ebx :
                begin
                    if ( ( \P1.P1.P1.InstQueueWr_Addr  - \P1.P1.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P1.P1.P1.EBX  < 0 ) 
                        begin
                            \P1.P1.P1.rEIP  <=  -( \P1.P1.P1.EBX );
                        end
                        else
                        begin 
                            \P1.P1.P1.rEIP  <= \P1.P1.P1.EBX ;
                        end
                        \P1.P1.P1.RequestPending  <= \P1.P1.P1.Pending ;
                        \P1.P1.P1.ReadRequest  <= \P1.P1.P1.Pending ;
                        \P1.P1.P1.MemoryFetch  <= \P1.P1.P1.Pending ;
                        \P1.P1.P1.CodeFetch  <= \P1.P1.P1.NotPending ;
                        if ( \P1.P1.P1.READY_n  == 1'b0 ) 
                        begin
                            \P1.P1.P1.RequestPending  <= \P1.P1.P1.NotPending ;
                            \P1.P1.P1.uWord  = ( \P1.P1.P1.Datai  % ( 2 ** 15 ) );
                            if ( \P1.P1.P1.StateBS16  == 1'b1 ) 
                            begin
                                \P1.P1.P1.lWord  = ( \P1.P1.P1.Datai  % ( 2 ** 16 ) );
                            end
                            else
                            begin
                                \P1.P1.P1.rEIP  <= ( \P1.P1.P1.rEIP  + 2 );
                                \P1.P1.P1.RequestPending  <= \P1.P1.P1.Pending ;
                                if ( \P1.P1.P1.READY_n  == 1'b0 ) 
                                begin
                                    \P1.P1.P1.RequestPending  <= \P1.P1.P1.NotPending ;
                                    \P1.P1.P1.lWord  = ( \P1.P1.P1.Datai  % ( 2 ** 16 ) );
                                end
                            end
                            if ( \P1.P1.P1.READY_n  == 1'b0 ) 
                            begin
                                \P1.P1.P1.EAX  <= ( ( \P1.P1.P1.uWord  * ( 2 ** 16 ) ) + \P1.P1.P1.lWord  );
                                \P1.P1.P1.More  = 1'b0;
                                \P1.P1.P1.Flush  = 1'b0;
                                \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 2 );
                                \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P1.P1.P1.Flush  = 1'b0;
                        \P1.P1.P1.More  = 1'b1;
                    end
                end
                \P1.P1.P1.MOV_ebx_eax :
                begin
                    if ( ( \P1.P1.P1.InstQueueWr_Addr  - \P1.P1.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P1.P1.P1.EBX  < 0 ) 
                        begin
                            \P1.P1.P1.rEIP  <= \P1.P1.P1.EBX ;
                        end
                        else
                        begin 
                            \P1.P1.P1.rEIP  <= \P1.P1.P1.EBX ;
                        end
                        \P1.P1.P1.lWord  = ( \P1.P1.P1.EAX  % ( 2 ** 16 ) );
                        \P1.P1.P1.uWord  = ( ( \P1.P1.P1.EAX  / ( 2 ** 16 ) ) % ( 2 ** 15 ) );
                        \P1.P1.P1.RequestPending  <= \P1.P1.P1.Pending ;
                        \P1.P1.P1.ReadRequest  <= \P1.P1.P1.NotPending ;
                        \P1.P1.P1.MemoryFetch  <= \P1.P1.P1.Pending ;
                        \P1.P1.P1.CodeFetch  <= \P1.P1.P1.NotPending ;
                        if ( ( \P1.P1.P1.State  == \P1.P1.P1.StateT1  ) | ( \P1.P1.P1.State  == \P1.P1.P1.StateT1P  ) ) 
                        begin
                            \P1.P1.P1.Datao  <= ( ( \P1.P1.P1.uWord  * ( 2 ** 16 ) ) + \P1.P1.P1.lWord  );
                            if ( \P1.P1.P1.READY_n  == 1'b0 ) 
                            begin
                                \P1.P1.P1.RequestPending  <= \P1.P1.P1.NotPending ;
                                if ( \P1.P1.P1.StateBS16  == 1'b0 ) 
                                begin
                                    \P1.P1.P1.rEIP  <= ( \P1.P1.P1.rEIP  + 2 );
                                    \P1.P1.P1.RequestPending  <= \P1.P1.P1.Pending ;
                                    \P1.P1.P1.ReadRequest  <= \P1.P1.P1.NotPending ;
                                    \P1.P1.P1.MemoryFetch  <= \P1.P1.P1.Pending ;
                                    \P1.P1.P1.CodeFetch  <= \P1.P1.P1.NotPending ;
                                    \P1.P1.P1.State2  = \P1.P1.P1.S6 ;
                                end
                                \P1.P1.P1.More  = 1'b0;
                                \P1.P1.P1.Flush  = 1'b0;
                                \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 2 );
                                \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P1.P1.P1.Flush  = 1'b0;
                        \P1.P1.P1.More  = 1'b1;
                    end
                end
                \P1.P1.P1.IN_al :
                begin
                    if ( ( \P1.P1.P1.InstQueueWr_Addr  - \P1.P1.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P1.P1.P1.rEIP  <= ( \P1.P1.P1.InstQueueRd_Addr  + 1 );
                        \P1.P1.P1.RequestPending  <= \P1.P1.P1.Pending ;
                        \P1.P1.P1.ReadRequest  <= \P1.P1.P1.Pending ;
                        \P1.P1.P1.MemoryFetch  <= \P1.P1.P1.NotPending ;
                        \P1.P1.P1.CodeFetch  <= \P1.P1.P1.NotPending ;
                        if ( \P1.P1.P1.READY_n  == 1'b0 ) 
                        begin
                            \P1.P1.P1.RequestPending  <= \P1.P1.P1.NotPending ;
                            \P1.P1.P1.EAX  <= \P1.P1.P1.Datai ;
                            \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 2 );
                            \P1.P1.P1.InstQueueRd_Addr  = ( \P1.P1.P1.InstQueueRd_Addr  + 2 );
                            \P1.P1.P1.Flush  = 1'b0;
                            \P1.P1.P1.More  = 1'b0;
                        end
                    end
                    else
                    begin
                        \P1.P1.P1.Flush  = 1'b0;
                        \P1.P1.P1.More  = 1'b1;
                    end
                end
                \P1.P1.P1.OUT_al :
                begin
                    if ( ( \P1.P1.P1.InstQueueWr_Addr  - \P1.P1.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P1.P1.P1.rEIP  <= ( \P1.P1.P1.InstQueueRd_Addr  + 1 );
                        \P1.P1.P1.RequestPending  <= \P1.P1.P1.Pending ;
                        \P1.P1.P1.ReadRequest  <= \P1.P1.P1.NotPending ;
                        \P1.P1.P1.MemoryFetch  <= \P1.P1.P1.NotPending ;
                        \P1.P1.P1.CodeFetch  <= \P1.P1.P1.NotPending ;
                        if ( ( \P1.P1.P1.State  == \P1.P1.P1.StateT1  ) | ( \P1.P1.P1.State  == \P1.P1.P1.StateT1P  ) ) 
                        begin
                            \P1.P1.P1.fWord  = ( \P1.P1.P1.EAX  % ( 2 ** 16 ) );
                            \P1.P1.P1.Datao  <= \P1.P1.P1.fWord ;
                            if ( \P1.P1.P1.READY_n  == 1'b0 ) 
                            begin
                                \P1.P1.P1.RequestPending  <= \P1.P1.P1.NotPending ;
                                \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 2 );
                                \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 2 ) % 16 );
                                \P1.P1.P1.Flush  = 1'b0;
                                \P1.P1.P1.More  = 1'b0;
                            end
                        end
                    end
                    else
                    begin
                        \P1.P1.P1.Flush  = 1'b0;
                        \P1.P1.P1.More  = 1'b1;
                    end
                end
                \P1.P1.P1.ADD_al_b :
                begin
                    \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 1 );
                    \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P1.Flush  = 1'b0;
                    \P1.P1.P1.More  = 1'b0;
                end
                \P1.P1.P1.ADD_ax_w :
                begin
                    \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 1 );
                    \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P1.Flush  = 1'b0;
                    \P1.P1.P1.More  = 1'b0;
                end
                \P1.P1.P1.ROL_al_1 :
                begin
                    \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 2 );
                    \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 2 ) % 16 );
                    \P1.P1.P1.Flush  = 1'b0;
                    \P1.P1.P1.More  = 1'b0;
                end
                \P1.P1.P1.ROL_al_n :
                begin
                    \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 2 );
                    \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 2 ) % 16 );
                    \P1.P1.P1.Flush  = 1'b0;
                    \P1.P1.P1.More  = 1'b0;
                end
                \P1.P1.P1.INC_eax :
                begin
                    \P1.P1.P1.EAX  <= ( \P1.P1.P1.EAX  + 1 );
                    \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 1 );
                    \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P1.Flush  = 1'b0;
                    \P1.P1.P1.More  = 1'b0;
                end
                \P1.P1.P1.INC_ebx :
                begin
                    \P1.P1.P1.EBX  <= ( \P1.P1.P1.EBX  + 1 );
                    \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 1 );
                    \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P1.Flush  = 1'b0;
                    \P1.P1.P1.More  = 1'b0;
                end
                default :
                begin
                    \P1.P1.P1.InstAddrPointer  = ( \P1.P1.P1.InstAddrPointer  + 1 );
                    \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P1.Flush  = 1'b0;
                    \P1.P1.P1.More  = 1'b0;
                end
                endcase
                if (  ~( ( \P1.P1.P1.InstQueueRd_Addr  < \P1.P1.P1.InstQueueWr_Addr  )) | ( ( ( ( \P1.P1.P1.InstQueueLimit  - \P1.P1.P1.InstQueueRd_Addr  ) < 4 ) | \P1.P1.P1.Flush  ) | \P1.P1.P1.More  ) ) 
                begin
                    \P1.P1.P1.State2  = \P1.P1.P1.S7 ;
                end
            end
            \P1.P1.P1.S6 :
            begin
                \P1.P1.P1.Datao  <= ( ( \P1.P1.P1.uWord  * ( 2 ** 16 ) ) + \P1.P1.P1.lWord  );
                if ( \P1.P1.P1.READY_n  == 1'b0 ) 
                begin
                    \P1.P1.P1.RequestPending  <= \P1.P1.P1.NotPending ;
                    \P1.P1.P1.State2  = \P1.P1.P1.S5 ;
                end
            end
            \P1.P1.P1.S7 :
            begin
                if ( \P1.P1.P1.Flush  ) 
                begin
                    \P1.P1.P1.InstQueueRd_Addr  = 1;
                    \P1.P1.P1.InstQueueWr_Addr  = 1;
                    if ( \P1.P1.P1.InstAddrPointer  < 0 ) 
                    begin
                        \P1.P1.P1.fWord  =  -( \P1.P1.P1.InstAddrPointer );
                    end
                    else
                    begin 
                        \P1.P1.P1.fWord  = \P1.P1.P1.InstAddrPointer ;
                    end
                    if ( ( \P1.P1.P1.fWord  % 2 ) == 1 ) 
                    begin
                        \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + ( \P1.P1.P1.fWord  % 4 ) ) % 16 );
                    end
                end
                if ( ( \P1.P1.P1.InstQueueLimit  - \P1.P1.P1.InstQueueRd_Addr  ) < 3 ) 
                begin
                    \P1.P1.P1.State2  = \P1.P1.P1.S8 ;
                    \P1.P1.P1.InstQueueWr_Addr  = 0;
                end
                else
                begin 
                    \P1.P1.P1.State2  = \P1.P1.P1.S9 ;
                end
            end
            \P1.P1.P1.S8 :
            begin
                if ( \P1.P1.P1.InstQueueRd_Addr  <= \P1.P1.P1.InstQueueLimit  ) 
                begin
                    \P1.P1.P1.InstQueue [\P1.P1.P1.InstQueueWr_Addr ] = \P1.P1.P1.InstQueue [\P1.P1.P1.InstQueueRd_Addr ];
                    \P1.P1.P1.InstQueueRd_Addr  = ( ( \P1.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P1.InstQueueWr_Addr  = ( ( \P1.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P1.P1.State2  = \P1.P1.P1.S8 ;
                end
                else
                begin
                    \P1.P1.P1.InstQueueRd_Addr  = 0;
                    \P1.P1.P1.State2  = \P1.P1.P1.S9 ;
                end
            end
            \P1.P1.P1.S9 :
            begin
                \P1.P1.P1.rEIP  <= \P1.P1.P1.PhyAddrPointer ;
                \P1.P1.P1.State2  = \P1.P1.P1.S1 ;
            end
            endcase
        end
    end
    always @ (  posedge \P1.P1.P1.CLOCK  or  posedge \P1.P1.P1.RESET )
    begin : \P1.P1.P1.P2 
        if ( \P1.P1.P1.RESET  == 1'b1 ) 
        begin
            \P1.P1.P1.ByteEnable  <= 4'b0000;
            \P1.P1.P1.NonAligned  <= 1'b0;
        end
        else
        begin 
            case ( \P1.P1.P1.DataWidth  ) 
            \P1.P1.P1.WidthByte :
            begin
                case ( \P1.P1.P1.rEIP  % 4 ) 
                0:
                begin
                    \P1.P1.P1.ByteEnable  <= 4'b1110;
                end
                1:
                begin
                    \P1.P1.P1.ByteEnable  <= 4'b1101;
                end
                2:
                begin
                    \P1.P1.P1.ByteEnable  <= 4'b1011;
                end
                3:
                begin
                    \P1.P1.P1.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            \P1.P1.P1.WidthWord :
            begin
                case ( \P1.P1.P1.rEIP  % 4 ) 
                0:
                begin
                    \P1.P1.P1.ByteEnable  <= 4'b1100;
                    \P1.P1.P1.NonAligned  <= \P1.P1.P1.NotPending ;
                end
                1:
                begin
                    \P1.P1.P1.ByteEnable  <= 4'b1001;
                    \P1.P1.P1.NonAligned  <= \P1.P1.P1.NotPending ;
                end
                2:
                begin
                    \P1.P1.P1.ByteEnable  <= 4'b0011;
                    \P1.P1.P1.NonAligned  <= \P1.P1.P1.NotPending ;
                end
                3:
                begin
                    \P1.P1.P1.ByteEnable  <= 4'b0111;
                    \P1.P1.P1.NonAligned  <= \P1.P1.P1.Pending ;
                end
                default :
                begin
                end
                endcase
            end
            \P1.P1.P1.WidthDword :
            begin
                case ( \P1.P1.P1.rEIP  % 4 ) 
                0:
                begin
                    \P1.P1.P1.ByteEnable  <= 4'b0000;
                    \P1.P1.P1.NonAligned  <= \P1.P1.P1.NotPending ;
                end
                1:
                begin
                    \P1.P1.P1.ByteEnable  <= 4'b0001;
                    \P1.P1.P1.NonAligned  <= \P1.P1.P1.Pending ;
                end
                2:
                begin
                    \P1.P1.P1.NonAligned  <= \P1.P1.P1.Pending ;
                    \P1.P1.P1.ByteEnable  <= 4'b0011;
                end
                3:
                begin
                    \P1.P1.P1.NonAligned  <= \P1.P1.P1.Pending ;
                    \P1.P1.P1.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            default :
            begin
            end
            endcase
        end
    end
    assign \P1.P1.be2  = \P1.P1.P2.BE_n ;
    assign \P1.P1.addr2  = \P1.P1.P2.Address ;
    assign \P1.P1.wr2  = \P1.P1.P2.W_R_n ;
    assign \P1.P1.dc2  = \P1.P1.P2.D_C_n ;
    assign \P1.P1.mio2  = \P1.P1.P2.M_IO_n ;
    assign \P1.P1.ads2  = \P1.P1.P2.ADS_n ;
    assign \P1.P1.P2.Datai  = \P1.P1.di2 ;
    assign \P1.P1.do2  = \P1.P1.P2.Datao ;
    assign \P1.P1.P2.CLOCK  = \P1.P1.clock ;
    assign \P1.P1.P2.NA_n  = \P1.P1.na ;
    assign \P1.P1.P2.BS16_n  = \P1.P1.bs16 ;
    assign \P1.P1.P2.READY_n  = \P1.P1.rdy2 ;
    assign \P1.P1.P2.HOLD  = \P1.P1.hold ;
    assign \P1.P1.P2.RESET  = \P1.P1.reset ;
    always @ (  posedge \P1.P1.P2.CLOCK  or  posedge \P1.P1.P2.RESET )
    begin : \P1.P1.P2.P0 
        if ( \P1.P1.P2.RESET  == 1'b1 ) 
        begin
            \P1.P1.P2.BE_n  <= 4'b0000;
            \P1.P1.P2.Address  <= 0;
            \P1.P1.P2.W_R_n  <= 1'b0;
            \P1.P1.P2.D_C_n  <= 1'b0;
            \P1.P1.P2.M_IO_n  <= 1'b0;
            \P1.P1.P2.ADS_n  <= 1'b0;
            \P1.P1.P2.State  <= \P1.P1.P2.StateInit ;
            \P1.P1.P2.StateNA  <= 1'b0;
            \P1.P1.P2.StateBS16  <= 1'b0;
            \P1.P1.P2.DataWidth  <= 0;
        end
        else
        begin 
            case ( \P1.P1.P2.State  ) 
            \P1.P1.P2.StateInit :
            begin
                \P1.P1.P2.D_C_n  <= 1'b1;
                \P1.P1.P2.ADS_n  <= 1'b1;
                \P1.P1.P2.State  <= \P1.P1.P2.StateTi ;
                \P1.P1.P2.StateNA  <= 1'b1;
                \P1.P1.P2.StateBS16  <= 1'b1;
                \P1.P1.P2.DataWidth  <= 2;
                \P1.P1.P2.State  <= \P1.P1.P2.StateTi ;
            end
            \P1.P1.P2.StateTi :
            begin
                if ( \P1.P1.P2.RequestPending  == \P1.P1.P2.Pending  ) 
                begin
                    \P1.P1.P2.State  <= \P1.P1.P2.StateT1 ;
                end
                else
                begin 
                    if ( \P1.P1.P2.HOLD  == 1'b1 ) 
                    begin
                        \P1.P1.P2.State  <= \P1.P1.P2.StateTh ;
                    end
                    else
                    begin 
                        \P1.P1.P2.State  <= \P1.P1.P2.StateTi ;
                    end
                end
            end
            \P1.P1.P2.StateT1 :
            begin
                \P1.P1.P2.Address  <= ( ( \P1.P1.P2.rEIP  / 4 ) % ( 2 ** 30 ) );
                \P1.P1.P2.BE_n  <= \P1.P1.P2.ByteEnable ;
                \P1.P1.P2.M_IO_n  <= \P1.P1.P2.MemoryFetch ;
                if ( \P1.P1.P2.ReadRequest  == \P1.P1.P2.Pending  ) 
                begin
                    \P1.P1.P2.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P1.P2.W_R_n  <= 1'b1;
                end
                if ( \P1.P1.P2.CodeFetch  == \P1.P1.P2.Pending  ) 
                begin
                    \P1.P1.P2.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P1.P2.D_C_n  <= 1'b1;
                end
                \P1.P1.P2.ADS_n  <= 1'b0;
                \P1.P1.P2.State  <= \P1.P1.P2.StateT2 ;
            end
            \P1.P1.P2.StateT2 :
            begin
                if ( ( ( \P1.P1.P2.READY_n  == 1'b0 ) & ( \P1.P1.P2.HOLD  == 1'b0 ) ) & ( \P1.P1.P2.RequestPending  == \P1.P1.P2.Pending  ) ) 
                begin
                    \P1.P1.P2.State  <= \P1.P1.P2.StateT1 ;
                end
                else
                begin 
                    if ( ( \P1.P1.P2.READY_n  == 1'b1 ) & ( \P1.P1.P2.NA_n  == 1'b1 ) ) 
                    begin
                    end
                    else
                    begin 
                        if ( ( ( \P1.P1.P2.RequestPending  == \P1.P1.P2.Pending  ) | ( \P1.P1.P2.HOLD  == 1'b1 ) ) & ( ( \P1.P1.P2.READY_n  == 1'b1 ) & ( \P1.P1.P2.NA_n  == 1'b0 ) ) ) 
                        begin
                            \P1.P1.P2.State  <= \P1.P1.P2.StateT2I ;
                        end
                        else
                        begin 
                            if ( ( ( ( \P1.P1.P2.RequestPending  == \P1.P1.P2.Pending  ) & ( \P1.P1.P2.HOLD  == 1'b0 ) ) & ( \P1.P1.P2.READY_n  == 1'b1 ) ) & ( \P1.P1.P2.NA_n  == 1'b0 ) ) 
                            begin
                                \P1.P1.P2.State  <= \P1.P1.P2.StateT2P ;
                            end
                            else
                            begin 
                                if ( ( ( \P1.P1.P2.RequestPending  == \P1.P1.P2.NotPending  ) & ( \P1.P1.P2.HOLD  == 1'b0 ) ) & ( \P1.P1.P2.READY_n  == 1'b0 ) ) 
                                begin
                                    \P1.P1.P2.State  <= \P1.P1.P2.StateTi ;
                                end
                                else
                                begin 
                                    if ( ( \P1.P1.P2.HOLD  == 1'b1 ) & ( \P1.P1.P2.READY_n  == 1'b1 ) ) 
                                    begin
                                        \P1.P1.P2.State  <= \P1.P1.P2.StateTh ;
                                    end
                                    else
                                    begin 
                                        \P1.P1.P2.State  <= \P1.P1.P2.StateT2 ;
                                    end
                                end
                            end
                        end
                    end
                end
                \P1.P1.P2.StateBS16  <= \P1.P1.P2.BS16_n ;
                if ( \P1.P1.P2.BS16_n  == 1'b0 ) 
                begin
                    \P1.P1.P2.DataWidth  <= \P1.P1.P2.WidthWord ;
                end
                else
                begin 
                    \P1.P1.P2.DataWidth  <= \P1.P1.P2.WidthDword ;
                end
                \P1.P1.P2.StateNA  <= \P1.P1.P2.NA_n ;
                \P1.P1.P2.ADS_n  <= 1'b1;
            end
            \P1.P1.P2.StateT1P :
            begin
                if ( ( ( \P1.P1.P2.NA_n  == 1'b0 ) & ( \P1.P1.P2.HOLD  == 1'b0 ) ) & ( \P1.P1.P2.RequestPending  == \P1.P1.P2.Pending  ) ) 
                begin
                    \P1.P1.P2.State  <= \P1.P1.P2.StateT2P ;
                end
                else
                begin 
                    if ( ( \P1.P1.P2.NA_n  == 1'b0 ) & ( ( \P1.P1.P2.HOLD  == 1'b1 ) | ( \P1.P1.P2.RequestPending  == \P1.P1.P2.NotPending  ) ) ) 
                    begin
                        \P1.P1.P2.State  <= \P1.P1.P2.StateT2I ;
                    end
                    else
                    begin 
                        if ( \P1.P1.P2.NA_n  == 1'b1 ) 
                        begin
                            \P1.P1.P2.State  <= \P1.P1.P2.StateT2 ;
                        end
                        else
                        begin 
                            \P1.P1.P2.State  <= \P1.P1.P2.StateT1P ;
                        end
                    end
                end
                \P1.P1.P2.StateBS16  <= \P1.P1.P2.BS16_n ;
                if ( \P1.P1.P2.BS16_n  == 1'b0 ) 
                begin
                    \P1.P1.P2.DataWidth  <= \P1.P1.P2.WidthWord ;
                end
                else
                begin 
                    \P1.P1.P2.DataWidth  <= \P1.P1.P2.WidthDword ;
                end
                \P1.P1.P2.StateNA  <= \P1.P1.P2.NA_n ;
                \P1.P1.P2.ADS_n  <= 1'b1;
            end
            \P1.P1.P2.StateTh :
            begin
                if ( ( \P1.P1.P2.HOLD  == 1'b0 ) & ( \P1.P1.P2.RequestPending  == \P1.P1.P2.Pending  ) ) 
                begin
                    \P1.P1.P2.State  <= \P1.P1.P2.StateT1 ;
                end
                else
                begin 
                    if ( ( \P1.P1.P2.HOLD  == 1'b0 ) & ( \P1.P1.P2.RequestPending  == \P1.P1.P2.NotPending  ) ) 
                    begin
                        \P1.P1.P2.State  <= \P1.P1.P2.StateTi ;
                    end
                    else
                    begin 
                        \P1.P1.P2.State  <= \P1.P1.P2.StateTh ;
                    end
                end
            end
            \P1.P1.P2.StateT2P :
            begin
                \P1.P1.P2.Address  <= ( ( \P1.P1.P2.rEIP  / 2 ) % ( 2 ** 30 ) );
                \P1.P1.P2.BE_n  <= \P1.P1.P2.ByteEnable ;
                \P1.P1.P2.M_IO_n  <= \P1.P1.P2.MemoryFetch ;
                if ( \P1.P1.P2.ReadRequest  == \P1.P1.P2.Pending  ) 
                begin
                    \P1.P1.P2.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P1.P2.W_R_n  <= 1'b1;
                end
                if ( \P1.P1.P2.CodeFetch  == \P1.P1.P2.Pending  ) 
                begin
                    \P1.P1.P2.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P1.P2.D_C_n  <= 1'b1;
                end
                \P1.P1.P2.ADS_n  <= 1'b0;
                if ( \P1.P1.P2.READY_n  == 1'b0 ) 
                begin
                    \P1.P1.P2.State  <= \P1.P1.P2.StateT1P ;
                end
                else
                begin 
                    \P1.P1.P2.State  <= \P1.P1.P2.StateT2P ;
                end
            end
            \P1.P1.P2.StateT2I :
            begin
                if ( ( ( \P1.P1.P2.READY_n  == 1'b1 ) & ( \P1.P1.P2.RequestPending  == \P1.P1.P2.Pending  ) ) & ( \P1.P1.P2.HOLD  == 1'b0 ) ) 
                begin
                    \P1.P1.P2.State  <= \P1.P1.P2.StateT2P ;
                end
                else
                begin 
                    if ( ( \P1.P1.P2.READY_n  == 1'b0 ) & ( \P1.P1.P2.HOLD  == 1'b1 ) ) 
                    begin
                        \P1.P1.P2.State  <= \P1.P1.P2.StateTh ;
                    end
                    else
                    begin 
                        if ( ( ( \P1.P1.P2.READY_n  == 1'b0 ) & ( \P1.P1.P2.HOLD  == 1'b0 ) ) & ( \P1.P1.P2.RequestPending  == \P1.P1.P2.Pending  ) ) 
                        begin
                            \P1.P1.P2.State  <= \P1.P1.P2.StateT1 ;
                        end
                        else
                        begin 
                            if ( ( ( \P1.P1.P2.READY_n  == 1'b0 ) & ( \P1.P1.P2.HOLD  == 1'b0 ) ) & ( \P1.P1.P2.RequestPending  == \P1.P1.P2.NotPending  ) ) 
                            begin
                                \P1.P1.P2.State  <= \P1.P1.P2.StateTi ;
                            end
                            else
                            begin 
                                \P1.P1.P2.State  <= \P1.P1.P2.StateT2I ;
                            end
                        end
                    end
                end
            end
            endcase
        end
    end
    always @ (  posedge \P1.P1.P2.CLOCK  or  posedge \P1.P1.P2.RESET )
    begin : \P1.P1.P2.P1 
        reg [7:0] \P1.P1.P2.InstQueue [15:0];
        reg [4:0] \P1.P1.P2.InstQueueRd_Addr ;
        reg [4:0] \P1.P1.P2.InstQueueWr_Addr ;
        parameter \P1.P1.P2.InstQueueLimit   = 15;
        integer \P1.P1.P2.InstAddrPointer ;
        integer \P1.P1.P2.PhyAddrPointer ;
        reg  \P1.P1.P2.Extended ;
        reg  \P1.P1.P2.More ;
        reg  \P1.P1.P2.Flush ;
        reg [15:0] \P1.P1.P2.lWord ;
        reg [14:0] \P1.P1.P2.uWord ;
        integer \P1.P1.P2.fWord ;
        reg [3:0] \P1.P1.P2.State2 ;
        parameter \P1.P1.P2.Si   = 0;
        parameter \P1.P1.P2.S1   = 1;
        parameter \P1.P1.P2.S2   = 2;
        parameter \P1.P1.P2.S3   = 3;
        parameter \P1.P1.P2.S4   = 4;
        parameter \P1.P1.P2.S5   = 5;
        parameter \P1.P1.P2.S6   = 6;
        parameter \P1.P1.P2.S7   = 7;
        parameter \P1.P1.P2.S8   = 8;
        parameter \P1.P1.P2.S9   = 9;
        if ( \P1.P1.P2.RESET  == 1'b1 ) 
        begin
            \P1.P1.P2.State2  = \P1.P1.P2.Si ;
            \P1.P1.P2.InstQueue  = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            \P1.P1.P2.InstQueueRd_Addr  = 0;
            \P1.P1.P2.InstQueueWr_Addr  = 0;
            \P1.P1.P2.InstAddrPointer  = 0;
            \P1.P1.P2.PhyAddrPointer  = 0;
            \P1.P1.P2.Extended  = 1'b0;
            \P1.P1.P2.More  = 1'b0;
            \P1.P1.P2.Flush  = 1'b0;
            \P1.P1.P2.lWord  = 0;
            \P1.P1.P2.uWord  = 0;
            \P1.P1.P2.fWord  = 0;
            \P1.P1.P2.CodeFetch  <= 1'b0;
            \P1.P1.P2.Datao  <= 0;
            \P1.P1.P2.EAX  <= 0;
            \P1.P1.P2.EBX  <= 0;
            \P1.P1.P2.rEIP  <= 0;
            \P1.P1.P2.ReadRequest  <= 1'b0;
            \P1.P1.P2.MemoryFetch  <= 1'b0;
            \P1.P1.P2.RequestPending  <= 1'b0;
        end
        else
        begin 
            case ( \P1.P1.P2.State2  ) 
            \P1.P1.P2.Si :
            begin
                \P1.P1.P2.PhyAddrPointer  = \P1.P1.P2.rEIP ;
                \P1.P1.P2.InstAddrPointer  = \P1.P1.P2.PhyAddrPointer ;
                \P1.P1.P2.State2  = \P1.P1.P2.S1 ;
                \P1.P1.P2.rEIP  <= 20'hFFFF0;
                \P1.P1.P2.ReadRequest  <= 1'b1;
                \P1.P1.P2.MemoryFetch  <= 1'b1;
                \P1.P1.P2.RequestPending  <= 1'b1;
            end
            \P1.P1.P2.S1 :
            begin
                \P1.P1.P2.RequestPending  <= \P1.P1.P2.Pending ;
                \P1.P1.P2.ReadRequest  <= \P1.P1.P2.Pending ;
                \P1.P1.P2.MemoryFetch  <= \P1.P1.P2.Pending ;
                \P1.P1.P2.CodeFetch  <= \P1.P1.P2.Pending ;
                if ( \P1.P1.P2.READY_n  == 1'b0 ) 
                begin
                    \P1.P1.P2.State2  = \P1.P1.P2.S2 ;
                end
                else
                begin 
                    \P1.P1.P2.State2  = \P1.P1.P2.S1 ;
                end
            end
            \P1.P1.P2.S2 :
            begin
                \P1.P1.P2.RequestPending  <= \P1.P1.P2.NotPending ;
                \P1.P1.P2.InstQueue [\P1.P1.P2.InstQueueWr_Addr ] = ( \P1.P1.P2.Datai  % ( 2 ** 8 ) );
                \P1.P1.P2.InstQueueWr_Addr  = ( ( \P1.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P1.P2.InstQueue [\P1.P1.P2.InstQueueWr_Addr ] = ( \P1.P1.P2.Datai  % ( 2 ** 8 ) );
                \P1.P1.P2.InstQueueWr_Addr  = ( ( \P1.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                if ( \P1.P1.P2.StateBS16  == 1'b1 ) 
                begin
                    \P1.P1.P2.InstQueue [\P1.P1.P2.InstQueueWr_Addr ] = ( ( \P1.P1.P2.Datai  / ( 2 ** 16 ) ) % ( 2 ** 8 ) );
                    \P1.P1.P2.InstQueueWr_Addr  = ( ( \P1.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P1.P2.InstQueue [\P1.P1.P2.InstQueueWr_Addr ] = ( ( \P1.P1.P2.Datai  / ( 2 ** 24 ) ) % ( 2 ** 8 ) );
                    \P1.P1.P2.InstQueueWr_Addr  = ( ( \P1.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P1.P2.PhyAddrPointer  = ( \P1.P1.P2.PhyAddrPointer  + 4 );
                    \P1.P1.P2.State2  = \P1.P1.P2.S5 ;
                end
                else
                begin
                    \P1.P1.P2.PhyAddrPointer  = ( \P1.P1.P2.PhyAddrPointer  + 2 );
                    if ( \P1.P1.P2.PhyAddrPointer  < 0 ) 
                    begin
                        \P1.P1.P2.rEIP  <=  -( \P1.P1.P2.PhyAddrPointer );
                    end
                    else
                    begin 
                        \P1.P1.P2.rEIP  <= \P1.P1.P2.PhyAddrPointer ;
                    end
                    \P1.P1.P2.State2  = \P1.P1.P2.S3 ;
                end
            end
            \P1.P1.P2.S3 :
            begin
                \P1.P1.P2.RequestPending  <= \P1.P1.P2.Pending ;
                if ( \P1.P1.P2.READY_n  == 1'b0 ) 
                begin
                    \P1.P1.P2.State2  = \P1.P1.P2.S4 ;
                end
                else
                begin 
                    \P1.P1.P2.State2  = \P1.P1.P2.S3 ;
                end
            end
            \P1.P1.P2.S4 :
            begin
                \P1.P1.P2.RequestPending  <= \P1.P1.P2.NotPending ;
                \P1.P1.P2.InstQueue [\P1.P1.P2.InstQueueWr_Addr ] = ( \P1.P1.P2.Datai  % ( 2 ** 8 ) );
                \P1.P1.P2.InstQueueWr_Addr  = ( ( \P1.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P1.P2.InstQueue [\P1.P1.P2.InstQueueWr_Addr ] = ( \P1.P1.P2.Datai  % ( 2 ** 8 ) );
                \P1.P1.P2.InstQueueWr_Addr  = ( ( \P1.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P1.P2.PhyAddrPointer  = ( \P1.P1.P2.PhyAddrPointer  + 2 );
                \P1.P1.P2.State2  = \P1.P1.P2.S5 ;
            end
            \P1.P1.P2.S5 :
            begin
                case ( \P1.P1.P2.InstQueue [\P1.P1.P2.InstQueueRd_Addr ] ) 
                \P1.P1.P2.NOP :
                begin
                    \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 1 );
                    \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P2.Flush  = 1'b0;
                    \P1.P1.P2.More  = 1'b0;
                end
                \P1.P1.P2.OPsop :
                begin
                    \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 1 );
                    \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P2.Extended  = 1'b1;
                    \P1.P1.P2.Flush  = 1'b0;
                    \P1.P1.P2.More  = 1'b0;
                end
                \P1.P1.P2.JMP_rel_short :
                begin
                    if ( ( \P1.P1.P2.InstQueueWr_Addr  - \P1.P1.P2.InstQueueRd_Addr  ) >= 3 ) 
                    begin
                        if ( \P1.P1.P2.InstQueue [( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 )] > 127 ) 
                        begin
                            \P1.P1.P2.PhyAddrPointer  = ( ( \P1.P1.P2.InstAddrPointer  + 1 ) - ( 8'hFF - \P1.P1.P2.InstQueue [( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 )] ) );
                            \P1.P1.P2.InstAddrPointer  = \P1.P1.P2.PhyAddrPointer ;
                        end
                        else
                        begin
                            \P1.P1.P2.PhyAddrPointer  = ( ( \P1.P1.P2.InstAddrPointer  + 2 ) + \P1.P1.P2.InstQueue [( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 )] );
                            \P1.P1.P2.InstAddrPointer  = \P1.P1.P2.PhyAddrPointer ;
                        end
                        \P1.P1.P2.Flush  = 1'b1;
                        \P1.P1.P2.More  = 1'b0;
                    end
                    else
                    begin
                        \P1.P1.P2.Flush  = 1'b0;
                        \P1.P1.P2.More  = 1'b1;
                    end
                end
                \P1.P1.P2.JMP_rel_near :
                begin
                    if ( ( \P1.P1.P2.InstQueueWr_Addr  - \P1.P1.P2.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P1.P2.PhyAddrPointer  = ( ( \P1.P1.P2.InstAddrPointer  + 5 ) + \P1.P1.P2.InstQueue [( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P1.P1.P2.InstAddrPointer  = \P1.P1.P2.PhyAddrPointer ;
                        \P1.P1.P2.Flush  = 1'b1;
                        \P1.P1.P2.More  = 1'b0;
                    end
                    else
                    begin
                        \P1.P1.P2.Flush  = 1'b0;
                        \P1.P1.P2.More  = 1'b1;
                    end
                end
                \P1.P1.P2.JMP_intseg_immed :
                begin
                    \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 1 );
                    \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P2.Flush  = 1'b0;
                    \P1.P1.P2.More  = 1'b0;
                end
                \P1.P1.P2.MOV_al_b :
                begin
                    \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 1 );
                    \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P2.Flush  = 1'b0;
                    \P1.P1.P2.More  = 1'b0;
                end
                \P1.P1.P2.MOV_eax_dw :
                begin
                    if ( ( \P1.P1.P2.InstQueueWr_Addr  - \P1.P1.P2.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P1.P2.EAX  <= ( ( ( ( \P1.P1.P2.InstQueue [( ( \P1.P1.P2.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P1.P1.P2.InstQueue [( ( \P1.P1.P2.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P1.P1.P2.InstQueue [( ( \P1.P1.P2.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P1.P1.P2.InstQueue [( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P1.P1.P2.More  = 1'b0;
                        \P1.P1.P2.Flush  = 1'b0;
                        \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 5 );
                        \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P1.P1.P2.Flush  = 1'b0;
                        \P1.P1.P2.More  = 1'b1;
                    end
                end
                \P1.P1.P2.MOV_ebx_dw :
                begin
                    if ( ( \P1.P1.P2.InstQueueWr_Addr  - \P1.P1.P2.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P1.P2.EBX  <= ( ( ( ( \P1.P1.P2.InstQueue [( ( \P1.P1.P2.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P1.P1.P2.InstQueue [( ( \P1.P1.P2.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P1.P1.P2.InstQueue [( ( \P1.P1.P2.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P1.P1.P2.InstQueue [( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 1 )] );
                        \P1.P1.P2.More  = 1'b0;
                        \P1.P1.P2.Flush  = 1'b0;
                        \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 5 );
                        \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P1.P1.P2.Flush  = 1'b0;
                        \P1.P1.P2.More  = 1'b1;
                    end
                end
                \P1.P1.P2.MOV_eax_ebx :
                begin
                    if ( ( \P1.P1.P2.InstQueueWr_Addr  - \P1.P1.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P1.P1.P2.EBX  < 0 ) 
                        begin
                            \P1.P1.P2.rEIP  <=  -( \P1.P1.P2.EBX );
                        end
                        else
                        begin 
                            \P1.P1.P2.rEIP  <= \P1.P1.P2.EBX ;
                        end
                        \P1.P1.P2.RequestPending  <= \P1.P1.P2.Pending ;
                        \P1.P1.P2.ReadRequest  <= \P1.P1.P2.Pending ;
                        \P1.P1.P2.MemoryFetch  <= \P1.P1.P2.Pending ;
                        \P1.P1.P2.CodeFetch  <= \P1.P1.P2.NotPending ;
                        if ( \P1.P1.P2.READY_n  == 1'b0 ) 
                        begin
                            \P1.P1.P2.RequestPending  <= \P1.P1.P2.NotPending ;
                            \P1.P1.P2.uWord  = ( \P1.P1.P2.Datai  % ( 2 ** 15 ) );
                            if ( \P1.P1.P2.StateBS16  == 1'b1 ) 
                            begin
                                \P1.P1.P2.lWord  = ( \P1.P1.P2.Datai  % ( 2 ** 16 ) );
                            end
                            else
                            begin
                                \P1.P1.P2.rEIP  <= ( \P1.P1.P2.rEIP  + 2 );
                                \P1.P1.P2.RequestPending  <= \P1.P1.P2.Pending ;
                                if ( \P1.P1.P2.READY_n  == 1'b0 ) 
                                begin
                                    \P1.P1.P2.RequestPending  <= \P1.P1.P2.NotPending ;
                                    \P1.P1.P2.lWord  = ( \P1.P1.P2.Datai  % ( 2 ** 16 ) );
                                end
                            end
                            if ( \P1.P1.P2.READY_n  == 1'b0 ) 
                            begin
                                \P1.P1.P2.EAX  <= ( ( \P1.P1.P2.uWord  * ( 2 ** 16 ) ) + \P1.P1.P2.lWord  );
                                \P1.P1.P2.More  = 1'b0;
                                \P1.P1.P2.Flush  = 1'b0;
                                \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 2 );
                                \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P1.P1.P2.Flush  = 1'b0;
                        \P1.P1.P2.More  = 1'b1;
                    end
                end
                \P1.P1.P2.MOV_ebx_eax :
                begin
                    if ( ( \P1.P1.P2.InstQueueWr_Addr  - \P1.P1.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P1.P1.P2.EBX  < 0 ) 
                        begin
                            \P1.P1.P2.rEIP  <= \P1.P1.P2.EBX ;
                        end
                        else
                        begin 
                            \P1.P1.P2.rEIP  <= \P1.P1.P2.EBX ;
                        end
                        \P1.P1.P2.lWord  = ( \P1.P1.P2.EAX  % ( 2 ** 16 ) );
                        \P1.P1.P2.uWord  = ( ( \P1.P1.P2.EAX  / ( 2 ** 16 ) ) % ( 2 ** 15 ) );
                        \P1.P1.P2.RequestPending  <= \P1.P1.P2.Pending ;
                        \P1.P1.P2.ReadRequest  <= \P1.P1.P2.NotPending ;
                        \P1.P1.P2.MemoryFetch  <= \P1.P1.P2.Pending ;
                        \P1.P1.P2.CodeFetch  <= \P1.P1.P2.NotPending ;
                        if ( ( \P1.P1.P2.State  == \P1.P1.P2.StateT1  ) | ( \P1.P1.P2.State  == \P1.P1.P2.StateT1P  ) ) 
                        begin
                            \P1.P1.P2.Datao  <= ( ( \P1.P1.P2.uWord  * ( 2 ** 16 ) ) + \P1.P1.P2.lWord  );
                            if ( \P1.P1.P2.READY_n  == 1'b0 ) 
                            begin
                                \P1.P1.P2.RequestPending  <= \P1.P1.P2.NotPending ;
                                if ( \P1.P1.P2.StateBS16  == 1'b0 ) 
                                begin
                                    \P1.P1.P2.rEIP  <= ( \P1.P1.P2.rEIP  + 2 );
                                    \P1.P1.P2.RequestPending  <= \P1.P1.P2.Pending ;
                                    \P1.P1.P2.ReadRequest  <= \P1.P1.P2.NotPending ;
                                    \P1.P1.P2.MemoryFetch  <= \P1.P1.P2.Pending ;
                                    \P1.P1.P2.CodeFetch  <= \P1.P1.P2.NotPending ;
                                    \P1.P1.P2.State2  = \P1.P1.P2.S6 ;
                                end
                                \P1.P1.P2.More  = 1'b0;
                                \P1.P1.P2.Flush  = 1'b0;
                                \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 2 );
                                \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P1.P1.P2.Flush  = 1'b0;
                        \P1.P1.P2.More  = 1'b1;
                    end
                end
                \P1.P1.P2.IN_al :
                begin
                    if ( ( \P1.P1.P2.InstQueueWr_Addr  - \P1.P1.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P1.P1.P2.rEIP  <= ( \P1.P1.P2.InstQueueRd_Addr  + 1 );
                        \P1.P1.P2.RequestPending  <= \P1.P1.P2.Pending ;
                        \P1.P1.P2.ReadRequest  <= \P1.P1.P2.Pending ;
                        \P1.P1.P2.MemoryFetch  <= \P1.P1.P2.NotPending ;
                        \P1.P1.P2.CodeFetch  <= \P1.P1.P2.NotPending ;
                        if ( \P1.P1.P2.READY_n  == 1'b0 ) 
                        begin
                            \P1.P1.P2.RequestPending  <= \P1.P1.P2.NotPending ;
                            \P1.P1.P2.EAX  <= \P1.P1.P2.Datai ;
                            \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 2 );
                            \P1.P1.P2.InstQueueRd_Addr  = ( \P1.P1.P2.InstQueueRd_Addr  + 2 );
                            \P1.P1.P2.Flush  = 1'b0;
                            \P1.P1.P2.More  = 1'b0;
                        end
                    end
                    else
                    begin
                        \P1.P1.P2.Flush  = 1'b0;
                        \P1.P1.P2.More  = 1'b1;
                    end
                end
                \P1.P1.P2.OUT_al :
                begin
                    if ( ( \P1.P1.P2.InstQueueWr_Addr  - \P1.P1.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P1.P1.P2.rEIP  <= ( \P1.P1.P2.InstQueueRd_Addr  + 1 );
                        \P1.P1.P2.RequestPending  <= \P1.P1.P2.Pending ;
                        \P1.P1.P2.ReadRequest  <= \P1.P1.P2.NotPending ;
                        \P1.P1.P2.MemoryFetch  <= \P1.P1.P2.NotPending ;
                        \P1.P1.P2.CodeFetch  <= \P1.P1.P2.NotPending ;
                        if ( ( \P1.P1.P2.State  == \P1.P1.P2.StateT1  ) | ( \P1.P1.P2.State  == \P1.P1.P2.StateT1P  ) ) 
                        begin
                            \P1.P1.P2.fWord  = ( \P1.P1.P2.EAX  % ( 2 ** 16 ) );
                            \P1.P1.P2.Datao  <= \P1.P1.P2.fWord ;
                            if ( \P1.P1.P2.READY_n  == 1'b0 ) 
                            begin
                                \P1.P1.P2.RequestPending  <= \P1.P1.P2.NotPending ;
                                \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 2 );
                                \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 2 ) % 16 );
                                \P1.P1.P2.Flush  = 1'b0;
                                \P1.P1.P2.More  = 1'b0;
                            end
                        end
                    end
                    else
                    begin
                        \P1.P1.P2.Flush  = 1'b0;
                        \P1.P1.P2.More  = 1'b1;
                    end
                end
                \P1.P1.P2.ADD_al_b :
                begin
                    \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 1 );
                    \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P2.Flush  = 1'b0;
                    \P1.P1.P2.More  = 1'b0;
                end
                \P1.P1.P2.ADD_ax_w :
                begin
                    \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 1 );
                    \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P2.Flush  = 1'b0;
                    \P1.P1.P2.More  = 1'b0;
                end
                \P1.P1.P2.ROL_al_1 :
                begin
                    \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 2 );
                    \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 2 ) % 16 );
                    \P1.P1.P2.Flush  = 1'b0;
                    \P1.P1.P2.More  = 1'b0;
                end
                \P1.P1.P2.ROL_al_n :
                begin
                    \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 2 );
                    \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 2 ) % 16 );
                    \P1.P1.P2.Flush  = 1'b0;
                    \P1.P1.P2.More  = 1'b0;
                end
                \P1.P1.P2.INC_eax :
                begin
                    \P1.P1.P2.EAX  <= ( \P1.P1.P2.EAX  + 1 );
                    \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 1 );
                    \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P2.Flush  = 1'b0;
                    \P1.P1.P2.More  = 1'b0;
                end
                \P1.P1.P2.INC_ebx :
                begin
                    \P1.P1.P2.EBX  <= ( \P1.P1.P2.EBX  + 1 );
                    \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 1 );
                    \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P2.Flush  = 1'b0;
                    \P1.P1.P2.More  = 1'b0;
                end
                default :
                begin
                    \P1.P1.P2.InstAddrPointer  = ( \P1.P1.P2.InstAddrPointer  + 1 );
                    \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P2.Flush  = 1'b0;
                    \P1.P1.P2.More  = 1'b0;
                end
                endcase
                if (  ~( ( \P1.P1.P2.InstQueueRd_Addr  < \P1.P1.P2.InstQueueWr_Addr  )) | ( ( ( ( \P1.P1.P2.InstQueueLimit  - \P1.P1.P2.InstQueueRd_Addr  ) < 4 ) | \P1.P1.P2.Flush  ) | \P1.P1.P2.More  ) ) 
                begin
                    \P1.P1.P2.State2  = \P1.P1.P2.S7 ;
                end
            end
            \P1.P1.P2.S6 :
            begin
                \P1.P1.P2.Datao  <= ( ( \P1.P1.P2.uWord  * ( 2 ** 16 ) ) + \P1.P1.P2.lWord  );
                if ( \P1.P1.P2.READY_n  == 1'b0 ) 
                begin
                    \P1.P1.P2.RequestPending  <= \P1.P1.P2.NotPending ;
                    \P1.P1.P2.State2  = \P1.P1.P2.S5 ;
                end
            end
            \P1.P1.P2.S7 :
            begin
                if ( \P1.P1.P2.Flush  ) 
                begin
                    \P1.P1.P2.InstQueueRd_Addr  = 1;
                    \P1.P1.P2.InstQueueWr_Addr  = 1;
                    if ( \P1.P1.P2.InstAddrPointer  < 0 ) 
                    begin
                        \P1.P1.P2.fWord  =  -( \P1.P1.P2.InstAddrPointer );
                    end
                    else
                    begin 
                        \P1.P1.P2.fWord  = \P1.P1.P2.InstAddrPointer ;
                    end
                    if ( ( \P1.P1.P2.fWord  % 2 ) == 1 ) 
                    begin
                        \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + ( \P1.P1.P2.fWord  % 4 ) ) % 16 );
                    end
                end
                if ( ( \P1.P1.P2.InstQueueLimit  - \P1.P1.P2.InstQueueRd_Addr  ) < 3 ) 
                begin
                    \P1.P1.P2.State2  = \P1.P1.P2.S8 ;
                    \P1.P1.P2.InstQueueWr_Addr  = 0;
                end
                else
                begin 
                    \P1.P1.P2.State2  = \P1.P1.P2.S9 ;
                end
            end
            \P1.P1.P2.S8 :
            begin
                if ( \P1.P1.P2.InstQueueRd_Addr  <= \P1.P1.P2.InstQueueLimit  ) 
                begin
                    \P1.P1.P2.InstQueue [\P1.P1.P2.InstQueueWr_Addr ] = \P1.P1.P2.InstQueue [\P1.P1.P2.InstQueueRd_Addr ];
                    \P1.P1.P2.InstQueueRd_Addr  = ( ( \P1.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P2.InstQueueWr_Addr  = ( ( \P1.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P1.P2.State2  = \P1.P1.P2.S8 ;
                end
                else
                begin
                    \P1.P1.P2.InstQueueRd_Addr  = 0;
                    \P1.P1.P2.State2  = \P1.P1.P2.S9 ;
                end
            end
            \P1.P1.P2.S9 :
            begin
                \P1.P1.P2.rEIP  <= \P1.P1.P2.PhyAddrPointer ;
                \P1.P1.P2.State2  = \P1.P1.P2.S1 ;
            end
            endcase
        end
    end
    always @ (  posedge \P1.P1.P2.CLOCK  or  posedge \P1.P1.P2.RESET )
    begin : \P1.P1.P2.P2 
        if ( \P1.P1.P2.RESET  == 1'b1 ) 
        begin
            \P1.P1.P2.ByteEnable  <= 4'b0000;
            \P1.P1.P2.NonAligned  <= 1'b0;
        end
        else
        begin 
            case ( \P1.P1.P2.DataWidth  ) 
            \P1.P1.P2.WidthByte :
            begin
                case ( \P1.P1.P2.rEIP  % 4 ) 
                0:
                begin
                    \P1.P1.P2.ByteEnable  <= 4'b1110;
                end
                1:
                begin
                    \P1.P1.P2.ByteEnable  <= 4'b1101;
                end
                2:
                begin
                    \P1.P1.P2.ByteEnable  <= 4'b1011;
                end
                3:
                begin
                    \P1.P1.P2.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            \P1.P1.P2.WidthWord :
            begin
                case ( \P1.P1.P2.rEIP  % 4 ) 
                0:
                begin
                    \P1.P1.P2.ByteEnable  <= 4'b1100;
                    \P1.P1.P2.NonAligned  <= \P1.P1.P2.NotPending ;
                end
                1:
                begin
                    \P1.P1.P2.ByteEnable  <= 4'b1001;
                    \P1.P1.P2.NonAligned  <= \P1.P1.P2.NotPending ;
                end
                2:
                begin
                    \P1.P1.P2.ByteEnable  <= 4'b0011;
                    \P1.P1.P2.NonAligned  <= \P1.P1.P2.NotPending ;
                end
                3:
                begin
                    \P1.P1.P2.ByteEnable  <= 4'b0111;
                    \P1.P1.P2.NonAligned  <= \P1.P1.P2.Pending ;
                end
                default :
                begin
                end
                endcase
            end
            \P1.P1.P2.WidthDword :
            begin
                case ( \P1.P1.P2.rEIP  % 4 ) 
                0:
                begin
                    \P1.P1.P2.ByteEnable  <= 4'b0000;
                    \P1.P1.P2.NonAligned  <= \P1.P1.P2.NotPending ;
                end
                1:
                begin
                    \P1.P1.P2.ByteEnable  <= 4'b0001;
                    \P1.P1.P2.NonAligned  <= \P1.P1.P2.Pending ;
                end
                2:
                begin
                    \P1.P1.P2.NonAligned  <= \P1.P1.P2.Pending ;
                    \P1.P1.P2.ByteEnable  <= 4'b0011;
                end
                3:
                begin
                    \P1.P1.P2.NonAligned  <= \P1.P1.P2.Pending ;
                    \P1.P1.P2.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            default :
            begin
            end
            endcase
        end
    end
    assign \P1.P1.be3  = \P1.P1.P3.BE_n ;
    assign \P1.P1.addr3  = \P1.P1.P3.Address ;
    assign \P1.P1.wr3  = \P1.P1.P3.W_R_n ;
    assign \P1.P1.dc3  = \P1.P1.P3.D_C_n ;
    assign \P1.P1.mio3  = \P1.P1.P3.M_IO_n ;
    assign \P1.P1.ads3  = \P1.P1.P3.ADS_n ;
    assign \P1.P1.P3.Datai  = \P1.P1.di3 ;
    assign \P1.P1.do3  = \P1.P1.P3.Datao ;
    assign \P1.P1.P3.CLOCK  = \P1.P1.clock ;
    assign \P1.P1.P3.NA_n  = \P1.P1.na ;
    assign \P1.P1.P3.BS16_n  = \P1.P1.bs16 ;
    assign \P1.P1.P3.READY_n  = \P1.P1.rdy3 ;
    assign \P1.P1.P3.HOLD  = \P1.P1.hold ;
    assign \P1.P1.P3.RESET  = \P1.P1.reset ;
    always @ (  posedge \P1.P1.P3.CLOCK  or  posedge \P1.P1.P3.RESET )
    begin : \P1.P1.P3.P0 
        if ( \P1.P1.P3.RESET  == 1'b1 ) 
        begin
            \P1.P1.P3.BE_n  <= 4'b0000;
            \P1.P1.P3.Address  <= 0;
            \P1.P1.P3.W_R_n  <= 1'b0;
            \P1.P1.P3.D_C_n  <= 1'b0;
            \P1.P1.P3.M_IO_n  <= 1'b0;
            \P1.P1.P3.ADS_n  <= 1'b0;
            \P1.P1.P3.State  <= \P1.P1.P3.StateInit ;
            \P1.P1.P3.StateNA  <= 1'b0;
            \P1.P1.P3.StateBS16  <= 1'b0;
            \P1.P1.P3.DataWidth  <= 0;
        end
        else
        begin 
            case ( \P1.P1.P3.State  ) 
            \P1.P1.P3.StateInit :
            begin
                \P1.P1.P3.D_C_n  <= 1'b1;
                \P1.P1.P3.ADS_n  <= 1'b1;
                \P1.P1.P3.State  <= \P1.P1.P3.StateTi ;
                \P1.P1.P3.StateNA  <= 1'b1;
                \P1.P1.P3.StateBS16  <= 1'b1;
                \P1.P1.P3.DataWidth  <= 2;
                \P1.P1.P3.State  <= \P1.P1.P3.StateTi ;
            end
            \P1.P1.P3.StateTi :
            begin
                if ( \P1.P1.P3.RequestPending  == \P1.P1.P3.Pending  ) 
                begin
                    \P1.P1.P3.State  <= \P1.P1.P3.StateT1 ;
                end
                else
                begin 
                    if ( \P1.P1.P3.HOLD  == 1'b1 ) 
                    begin
                        \P1.P1.P3.State  <= \P1.P1.P3.StateTh ;
                    end
                    else
                    begin 
                        \P1.P1.P3.State  <= \P1.P1.P3.StateTi ;
                    end
                end
            end
            \P1.P1.P3.StateT1 :
            begin
                \P1.P1.P3.Address  <= ( ( \P1.P1.P3.rEIP  / 4 ) % ( 2 ** 30 ) );
                \P1.P1.P3.BE_n  <= \P1.P1.P3.ByteEnable ;
                \P1.P1.P3.M_IO_n  <= \P1.P1.P3.MemoryFetch ;
                if ( \P1.P1.P3.ReadRequest  == \P1.P1.P3.Pending  ) 
                begin
                    \P1.P1.P3.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P1.P3.W_R_n  <= 1'b1;
                end
                if ( \P1.P1.P3.CodeFetch  == \P1.P1.P3.Pending  ) 
                begin
                    \P1.P1.P3.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P1.P3.D_C_n  <= 1'b1;
                end
                \P1.P1.P3.ADS_n  <= 1'b0;
                \P1.P1.P3.State  <= \P1.P1.P3.StateT2 ;
            end
            \P1.P1.P3.StateT2 :
            begin
                if ( ( ( \P1.P1.P3.READY_n  == 1'b0 ) & ( \P1.P1.P3.HOLD  == 1'b0 ) ) & ( \P1.P1.P3.RequestPending  == \P1.P1.P3.Pending  ) ) 
                begin
                    \P1.P1.P3.State  <= \P1.P1.P3.StateT1 ;
                end
                else
                begin 
                    if ( ( \P1.P1.P3.READY_n  == 1'b1 ) & ( \P1.P1.P3.NA_n  == 1'b1 ) ) 
                    begin
                    end
                    else
                    begin 
                        if ( ( ( \P1.P1.P3.RequestPending  == \P1.P1.P3.Pending  ) | ( \P1.P1.P3.HOLD  == 1'b1 ) ) & ( ( \P1.P1.P3.READY_n  == 1'b1 ) & ( \P1.P1.P3.NA_n  == 1'b0 ) ) ) 
                        begin
                            \P1.P1.P3.State  <= \P1.P1.P3.StateT2I ;
                        end
                        else
                        begin 
                            if ( ( ( ( \P1.P1.P3.RequestPending  == \P1.P1.P3.Pending  ) & ( \P1.P1.P3.HOLD  == 1'b0 ) ) & ( \P1.P1.P3.READY_n  == 1'b1 ) ) & ( \P1.P1.P3.NA_n  == 1'b0 ) ) 
                            begin
                                \P1.P1.P3.State  <= \P1.P1.P3.StateT2P ;
                            end
                            else
                            begin 
                                if ( ( ( \P1.P1.P3.RequestPending  == \P1.P1.P3.NotPending  ) & ( \P1.P1.P3.HOLD  == 1'b0 ) ) & ( \P1.P1.P3.READY_n  == 1'b0 ) ) 
                                begin
                                    \P1.P1.P3.State  <= \P1.P1.P3.StateTi ;
                                end
                                else
                                begin 
                                    if ( ( \P1.P1.P3.HOLD  == 1'b1 ) & ( \P1.P1.P3.READY_n  == 1'b1 ) ) 
                                    begin
                                        \P1.P1.P3.State  <= \P1.P1.P3.StateTh ;
                                    end
                                    else
                                    begin 
                                        \P1.P1.P3.State  <= \P1.P1.P3.StateT2 ;
                                    end
                                end
                            end
                        end
                    end
                end
                \P1.P1.P3.StateBS16  <= \P1.P1.P3.BS16_n ;
                if ( \P1.P1.P3.BS16_n  == 1'b0 ) 
                begin
                    \P1.P1.P3.DataWidth  <= \P1.P1.P3.WidthWord ;
                end
                else
                begin 
                    \P1.P1.P3.DataWidth  <= \P1.P1.P3.WidthDword ;
                end
                \P1.P1.P3.StateNA  <= \P1.P1.P3.NA_n ;
                \P1.P1.P3.ADS_n  <= 1'b1;
            end
            \P1.P1.P3.StateT1P :
            begin
                if ( ( ( \P1.P1.P3.NA_n  == 1'b0 ) & ( \P1.P1.P3.HOLD  == 1'b0 ) ) & ( \P1.P1.P3.RequestPending  == \P1.P1.P3.Pending  ) ) 
                begin
                    \P1.P1.P3.State  <= \P1.P1.P3.StateT2P ;
                end
                else
                begin 
                    if ( ( \P1.P1.P3.NA_n  == 1'b0 ) & ( ( \P1.P1.P3.HOLD  == 1'b1 ) | ( \P1.P1.P3.RequestPending  == \P1.P1.P3.NotPending  ) ) ) 
                    begin
                        \P1.P1.P3.State  <= \P1.P1.P3.StateT2I ;
                    end
                    else
                    begin 
                        if ( \P1.P1.P3.NA_n  == 1'b1 ) 
                        begin
                            \P1.P1.P3.State  <= \P1.P1.P3.StateT2 ;
                        end
                        else
                        begin 
                            \P1.P1.P3.State  <= \P1.P1.P3.StateT1P ;
                        end
                    end
                end
                \P1.P1.P3.StateBS16  <= \P1.P1.P3.BS16_n ;
                if ( \P1.P1.P3.BS16_n  == 1'b0 ) 
                begin
                    \P1.P1.P3.DataWidth  <= \P1.P1.P3.WidthWord ;
                end
                else
                begin 
                    \P1.P1.P3.DataWidth  <= \P1.P1.P3.WidthDword ;
                end
                \P1.P1.P3.StateNA  <= \P1.P1.P3.NA_n ;
                \P1.P1.P3.ADS_n  <= 1'b1;
            end
            \P1.P1.P3.StateTh :
            begin
                if ( ( \P1.P1.P3.HOLD  == 1'b0 ) & ( \P1.P1.P3.RequestPending  == \P1.P1.P3.Pending  ) ) 
                begin
                    \P1.P1.P3.State  <= \P1.P1.P3.StateT1 ;
                end
                else
                begin 
                    if ( ( \P1.P1.P3.HOLD  == 1'b0 ) & ( \P1.P1.P3.RequestPending  == \P1.P1.P3.NotPending  ) ) 
                    begin
                        \P1.P1.P3.State  <= \P1.P1.P3.StateTi ;
                    end
                    else
                    begin 
                        \P1.P1.P3.State  <= \P1.P1.P3.StateTh ;
                    end
                end
            end
            \P1.P1.P3.StateT2P :
            begin
                \P1.P1.P3.Address  <= ( ( \P1.P1.P3.rEIP  / 2 ) % ( 2 ** 30 ) );
                \P1.P1.P3.BE_n  <= \P1.P1.P3.ByteEnable ;
                \P1.P1.P3.M_IO_n  <= \P1.P1.P3.MemoryFetch ;
                if ( \P1.P1.P3.ReadRequest  == \P1.P1.P3.Pending  ) 
                begin
                    \P1.P1.P3.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P1.P3.W_R_n  <= 1'b1;
                end
                if ( \P1.P1.P3.CodeFetch  == \P1.P1.P3.Pending  ) 
                begin
                    \P1.P1.P3.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P1.P3.D_C_n  <= 1'b1;
                end
                \P1.P1.P3.ADS_n  <= 1'b0;
                if ( \P1.P1.P3.READY_n  == 1'b0 ) 
                begin
                    \P1.P1.P3.State  <= \P1.P1.P3.StateT1P ;
                end
                else
                begin 
                    \P1.P1.P3.State  <= \P1.P1.P3.StateT2P ;
                end
            end
            \P1.P1.P3.StateT2I :
            begin
                if ( ( ( \P1.P1.P3.READY_n  == 1'b1 ) & ( \P1.P1.P3.RequestPending  == \P1.P1.P3.Pending  ) ) & ( \P1.P1.P3.HOLD  == 1'b0 ) ) 
                begin
                    \P1.P1.P3.State  <= \P1.P1.P3.StateT2P ;
                end
                else
                begin 
                    if ( ( \P1.P1.P3.READY_n  == 1'b0 ) & ( \P1.P1.P3.HOLD  == 1'b1 ) ) 
                    begin
                        \P1.P1.P3.State  <= \P1.P1.P3.StateTh ;
                    end
                    else
                    begin 
                        if ( ( ( \P1.P1.P3.READY_n  == 1'b0 ) & ( \P1.P1.P3.HOLD  == 1'b0 ) ) & ( \P1.P1.P3.RequestPending  == \P1.P1.P3.Pending  ) ) 
                        begin
                            \P1.P1.P3.State  <= \P1.P1.P3.StateT1 ;
                        end
                        else
                        begin 
                            if ( ( ( \P1.P1.P3.READY_n  == 1'b0 ) & ( \P1.P1.P3.HOLD  == 1'b0 ) ) & ( \P1.P1.P3.RequestPending  == \P1.P1.P3.NotPending  ) ) 
                            begin
                                \P1.P1.P3.State  <= \P1.P1.P3.StateTi ;
                            end
                            else
                            begin 
                                \P1.P1.P3.State  <= \P1.P1.P3.StateT2I ;
                            end
                        end
                    end
                end
            end
            endcase
        end
    end
    always @ (  posedge \P1.P1.P3.CLOCK  or  posedge \P1.P1.P3.RESET )
    begin : \P1.P1.P3.P1 
        reg [7:0] \P1.P1.P3.InstQueue [15:0];
        reg [4:0] \P1.P1.P3.InstQueueRd_Addr ;
        reg [4:0] \P1.P1.P3.InstQueueWr_Addr ;
        parameter \P1.P1.P3.InstQueueLimit   = 15;
        integer \P1.P1.P3.InstAddrPointer ;
        integer \P1.P1.P3.PhyAddrPointer ;
        reg  \P1.P1.P3.Extended ;
        reg  \P1.P1.P3.More ;
        reg  \P1.P1.P3.Flush ;
        reg [15:0] \P1.P1.P3.lWord ;
        reg [14:0] \P1.P1.P3.uWord ;
        integer \P1.P1.P3.fWord ;
        reg [3:0] \P1.P1.P3.State2 ;
        parameter \P1.P1.P3.Si   = 0;
        parameter \P1.P1.P3.S1   = 1;
        parameter \P1.P1.P3.S2   = 2;
        parameter \P1.P1.P3.S3   = 3;
        parameter \P1.P1.P3.S4   = 4;
        parameter \P1.P1.P3.S5   = 5;
        parameter \P1.P1.P3.S6   = 6;
        parameter \P1.P1.P3.S7   = 7;
        parameter \P1.P1.P3.S8   = 8;
        parameter \P1.P1.P3.S9   = 9;
        if ( \P1.P1.P3.RESET  == 1'b1 ) 
        begin
            \P1.P1.P3.State2  = \P1.P1.P3.Si ;
            \P1.P1.P3.InstQueue  = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            \P1.P1.P3.InstQueueRd_Addr  = 0;
            \P1.P1.P3.InstQueueWr_Addr  = 0;
            \P1.P1.P3.InstAddrPointer  = 0;
            \P1.P1.P3.PhyAddrPointer  = 0;
            \P1.P1.P3.Extended  = 1'b0;
            \P1.P1.P3.More  = 1'b0;
            \P1.P1.P3.Flush  = 1'b0;
            \P1.P1.P3.lWord  = 0;
            \P1.P1.P3.uWord  = 0;
            \P1.P1.P3.fWord  = 0;
            \P1.P1.P3.CodeFetch  <= 1'b0;
            \P1.P1.P3.Datao  <= 0;
            \P1.P1.P3.EAX  <= 0;
            \P1.P1.P3.EBX  <= 0;
            \P1.P1.P3.rEIP  <= 0;
            \P1.P1.P3.ReadRequest  <= 1'b0;
            \P1.P1.P3.MemoryFetch  <= 1'b0;
            \P1.P1.P3.RequestPending  <= 1'b0;
        end
        else
        begin 
            case ( \P1.P1.P3.State2  ) 
            \P1.P1.P3.Si :
            begin
                \P1.P1.P3.PhyAddrPointer  = \P1.P1.P3.rEIP ;
                \P1.P1.P3.InstAddrPointer  = \P1.P1.P3.PhyAddrPointer ;
                \P1.P1.P3.State2  = \P1.P1.P3.S1 ;
                \P1.P1.P3.rEIP  <= 20'hFFFF0;
                \P1.P1.P3.ReadRequest  <= 1'b1;
                \P1.P1.P3.MemoryFetch  <= 1'b1;
                \P1.P1.P3.RequestPending  <= 1'b1;
            end
            \P1.P1.P3.S1 :
            begin
                \P1.P1.P3.RequestPending  <= \P1.P1.P3.Pending ;
                \P1.P1.P3.ReadRequest  <= \P1.P1.P3.Pending ;
                \P1.P1.P3.MemoryFetch  <= \P1.P1.P3.Pending ;
                \P1.P1.P3.CodeFetch  <= \P1.P1.P3.Pending ;
                if ( \P1.P1.P3.READY_n  == 1'b0 ) 
                begin
                    \P1.P1.P3.State2  = \P1.P1.P3.S2 ;
                end
                else
                begin 
                    \P1.P1.P3.State2  = \P1.P1.P3.S1 ;
                end
            end
            \P1.P1.P3.S2 :
            begin
                \P1.P1.P3.RequestPending  <= \P1.P1.P3.NotPending ;
                \P1.P1.P3.InstQueue [\P1.P1.P3.InstQueueWr_Addr ] = ( \P1.P1.P3.Datai  % ( 2 ** 8 ) );
                \P1.P1.P3.InstQueueWr_Addr  = ( ( \P1.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P1.P3.InstQueue [\P1.P1.P3.InstQueueWr_Addr ] = ( \P1.P1.P3.Datai  % ( 2 ** 8 ) );
                \P1.P1.P3.InstQueueWr_Addr  = ( ( \P1.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                if ( \P1.P1.P3.StateBS16  == 1'b1 ) 
                begin
                    \P1.P1.P3.InstQueue [\P1.P1.P3.InstQueueWr_Addr ] = ( ( \P1.P1.P3.Datai  / ( 2 ** 16 ) ) % ( 2 ** 8 ) );
                    \P1.P1.P3.InstQueueWr_Addr  = ( ( \P1.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P1.P3.InstQueue [\P1.P1.P3.InstQueueWr_Addr ] = ( ( \P1.P1.P3.Datai  / ( 2 ** 24 ) ) % ( 2 ** 8 ) );
                    \P1.P1.P3.InstQueueWr_Addr  = ( ( \P1.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P1.P3.PhyAddrPointer  = ( \P1.P1.P3.PhyAddrPointer  + 4 );
                    \P1.P1.P3.State2  = \P1.P1.P3.S5 ;
                end
                else
                begin
                    \P1.P1.P3.PhyAddrPointer  = ( \P1.P1.P3.PhyAddrPointer  + 2 );
                    if ( \P1.P1.P3.PhyAddrPointer  < 0 ) 
                    begin
                        \P1.P1.P3.rEIP  <=  -( \P1.P1.P3.PhyAddrPointer );
                    end
                    else
                    begin 
                        \P1.P1.P3.rEIP  <= \P1.P1.P3.PhyAddrPointer ;
                    end
                    \P1.P1.P3.State2  = \P1.P1.P3.S3 ;
                end
            end
            \P1.P1.P3.S3 :
            begin
                \P1.P1.P3.RequestPending  <= \P1.P1.P3.Pending ;
                if ( \P1.P1.P3.READY_n  == 1'b0 ) 
                begin
                    \P1.P1.P3.State2  = \P1.P1.P3.S4 ;
                end
                else
                begin 
                    \P1.P1.P3.State2  = \P1.P1.P3.S3 ;
                end
            end
            \P1.P1.P3.S4 :
            begin
                \P1.P1.P3.RequestPending  <= \P1.P1.P3.NotPending ;
                \P1.P1.P3.InstQueue [\P1.P1.P3.InstQueueWr_Addr ] = ( \P1.P1.P3.Datai  % ( 2 ** 8 ) );
                \P1.P1.P3.InstQueueWr_Addr  = ( ( \P1.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P1.P3.InstQueue [\P1.P1.P3.InstQueueWr_Addr ] = ( \P1.P1.P3.Datai  % ( 2 ** 8 ) );
                \P1.P1.P3.InstQueueWr_Addr  = ( ( \P1.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P1.P3.PhyAddrPointer  = ( \P1.P1.P3.PhyAddrPointer  + 2 );
                \P1.P1.P3.State2  = \P1.P1.P3.S5 ;
            end
            \P1.P1.P3.S5 :
            begin
                case ( \P1.P1.P3.InstQueue [\P1.P1.P3.InstQueueRd_Addr ] ) 
                \P1.P1.P3.NOP :
                begin
                    \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 1 );
                    \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P3.Flush  = 1'b0;
                    \P1.P1.P3.More  = 1'b0;
                end
                \P1.P1.P3.OPsop :
                begin
                    \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 1 );
                    \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P3.Extended  = 1'b1;
                    \P1.P1.P3.Flush  = 1'b0;
                    \P1.P1.P3.More  = 1'b0;
                end
                \P1.P1.P3.JMP_rel_short :
                begin
                    if ( ( \P1.P1.P3.InstQueueWr_Addr  - \P1.P1.P3.InstQueueRd_Addr  ) >= 3 ) 
                    begin
                        if ( \P1.P1.P3.InstQueue [( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 )] > 127 ) 
                        begin
                            \P1.P1.P3.PhyAddrPointer  = ( ( \P1.P1.P3.InstAddrPointer  + 1 ) - ( 8'hFF - \P1.P1.P3.InstQueue [( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 )] ) );
                            \P1.P1.P3.InstAddrPointer  = \P1.P1.P3.PhyAddrPointer ;
                        end
                        else
                        begin
                            \P1.P1.P3.PhyAddrPointer  = ( ( \P1.P1.P3.InstAddrPointer  + 2 ) + \P1.P1.P3.InstQueue [( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 )] );
                            \P1.P1.P3.InstAddrPointer  = \P1.P1.P3.PhyAddrPointer ;
                        end
                        \P1.P1.P3.Flush  = 1'b1;
                        \P1.P1.P3.More  = 1'b0;
                    end
                    else
                    begin
                        \P1.P1.P3.Flush  = 1'b0;
                        \P1.P1.P3.More  = 1'b1;
                    end
                end
                \P1.P1.P3.JMP_rel_near :
                begin
                    if ( ( \P1.P1.P3.InstQueueWr_Addr  - \P1.P1.P3.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P1.P3.PhyAddrPointer  = ( ( \P1.P1.P3.InstAddrPointer  + 5 ) + \P1.P1.P3.InstQueue [( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P1.P1.P3.InstAddrPointer  = \P1.P1.P3.PhyAddrPointer ;
                        \P1.P1.P3.Flush  = 1'b1;
                        \P1.P1.P3.More  = 1'b0;
                    end
                    else
                    begin
                        \P1.P1.P3.Flush  = 1'b0;
                        \P1.P1.P3.More  = 1'b1;
                    end
                end
                \P1.P1.P3.JMP_intseg_immed :
                begin
                    \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 1 );
                    \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P3.Flush  = 1'b0;
                    \P1.P1.P3.More  = 1'b0;
                end
                \P1.P1.P3.MOV_al_b :
                begin
                    \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 1 );
                    \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P3.Flush  = 1'b0;
                    \P1.P1.P3.More  = 1'b0;
                end
                \P1.P1.P3.MOV_eax_dw :
                begin
                    if ( ( \P1.P1.P3.InstQueueWr_Addr  - \P1.P1.P3.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P1.P3.EAX  <= ( ( ( ( \P1.P1.P3.InstQueue [( ( \P1.P1.P3.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P1.P1.P3.InstQueue [( ( \P1.P1.P3.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P1.P1.P3.InstQueue [( ( \P1.P1.P3.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P1.P1.P3.InstQueue [( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P1.P1.P3.More  = 1'b0;
                        \P1.P1.P3.Flush  = 1'b0;
                        \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 5 );
                        \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P1.P1.P3.Flush  = 1'b0;
                        \P1.P1.P3.More  = 1'b1;
                    end
                end
                \P1.P1.P3.MOV_ebx_dw :
                begin
                    if ( ( \P1.P1.P3.InstQueueWr_Addr  - \P1.P1.P3.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P1.P3.EBX  <= ( ( ( ( \P1.P1.P3.InstQueue [( ( \P1.P1.P3.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P1.P1.P3.InstQueue [( ( \P1.P1.P3.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P1.P1.P3.InstQueue [( ( \P1.P1.P3.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P1.P1.P3.InstQueue [( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 1 )] );
                        \P1.P1.P3.More  = 1'b0;
                        \P1.P1.P3.Flush  = 1'b0;
                        \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 5 );
                        \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P1.P1.P3.Flush  = 1'b0;
                        \P1.P1.P3.More  = 1'b1;
                    end
                end
                \P1.P1.P3.MOV_eax_ebx :
                begin
                    if ( ( \P1.P1.P3.InstQueueWr_Addr  - \P1.P1.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P1.P1.P3.EBX  < 0 ) 
                        begin
                            \P1.P1.P3.rEIP  <=  -( \P1.P1.P3.EBX );
                        end
                        else
                        begin 
                            \P1.P1.P3.rEIP  <= \P1.P1.P3.EBX ;
                        end
                        \P1.P1.P3.RequestPending  <= \P1.P1.P3.Pending ;
                        \P1.P1.P3.ReadRequest  <= \P1.P1.P3.Pending ;
                        \P1.P1.P3.MemoryFetch  <= \P1.P1.P3.Pending ;
                        \P1.P1.P3.CodeFetch  <= \P1.P1.P3.NotPending ;
                        if ( \P1.P1.P3.READY_n  == 1'b0 ) 
                        begin
                            \P1.P1.P3.RequestPending  <= \P1.P1.P3.NotPending ;
                            \P1.P1.P3.uWord  = ( \P1.P1.P3.Datai  % ( 2 ** 15 ) );
                            if ( \P1.P1.P3.StateBS16  == 1'b1 ) 
                            begin
                                \P1.P1.P3.lWord  = ( \P1.P1.P3.Datai  % ( 2 ** 16 ) );
                            end
                            else
                            begin
                                \P1.P1.P3.rEIP  <= ( \P1.P1.P3.rEIP  + 2 );
                                \P1.P1.P3.RequestPending  <= \P1.P1.P3.Pending ;
                                if ( \P1.P1.P3.READY_n  == 1'b0 ) 
                                begin
                                    \P1.P1.P3.RequestPending  <= \P1.P1.P3.NotPending ;
                                    \P1.P1.P3.lWord  = ( \P1.P1.P3.Datai  % ( 2 ** 16 ) );
                                end
                            end
                            if ( \P1.P1.P3.READY_n  == 1'b0 ) 
                            begin
                                \P1.P1.P3.EAX  <= ( ( \P1.P1.P3.uWord  * ( 2 ** 16 ) ) + \P1.P1.P3.lWord  );
                                \P1.P1.P3.More  = 1'b0;
                                \P1.P1.P3.Flush  = 1'b0;
                                \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 2 );
                                \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P1.P1.P3.Flush  = 1'b0;
                        \P1.P1.P3.More  = 1'b1;
                    end
                end
                \P1.P1.P3.MOV_ebx_eax :
                begin
                    if ( ( \P1.P1.P3.InstQueueWr_Addr  - \P1.P1.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P1.P1.P3.EBX  < 0 ) 
                        begin
                            \P1.P1.P3.rEIP  <= \P1.P1.P3.EBX ;
                        end
                        else
                        begin 
                            \P1.P1.P3.rEIP  <= \P1.P1.P3.EBX ;
                        end
                        \P1.P1.P3.lWord  = ( \P1.P1.P3.EAX  % ( 2 ** 16 ) );
                        \P1.P1.P3.uWord  = ( ( \P1.P1.P3.EAX  / ( 2 ** 16 ) ) % ( 2 ** 15 ) );
                        \P1.P1.P3.RequestPending  <= \P1.P1.P3.Pending ;
                        \P1.P1.P3.ReadRequest  <= \P1.P1.P3.NotPending ;
                        \P1.P1.P3.MemoryFetch  <= \P1.P1.P3.Pending ;
                        \P1.P1.P3.CodeFetch  <= \P1.P1.P3.NotPending ;
                        if ( ( \P1.P1.P3.State  == \P1.P1.P3.StateT1  ) | ( \P1.P1.P3.State  == \P1.P1.P3.StateT1P  ) ) 
                        begin
                            \P1.P1.P3.Datao  <= ( ( \P1.P1.P3.uWord  * ( 2 ** 16 ) ) + \P1.P1.P3.lWord  );
                            if ( \P1.P1.P3.READY_n  == 1'b0 ) 
                            begin
                                \P1.P1.P3.RequestPending  <= \P1.P1.P3.NotPending ;
                                if ( \P1.P1.P3.StateBS16  == 1'b0 ) 
                                begin
                                    \P1.P1.P3.rEIP  <= ( \P1.P1.P3.rEIP  + 2 );
                                    \P1.P1.P3.RequestPending  <= \P1.P1.P3.Pending ;
                                    \P1.P1.P3.ReadRequest  <= \P1.P1.P3.NotPending ;
                                    \P1.P1.P3.MemoryFetch  <= \P1.P1.P3.Pending ;
                                    \P1.P1.P3.CodeFetch  <= \P1.P1.P3.NotPending ;
                                    \P1.P1.P3.State2  = \P1.P1.P3.S6 ;
                                end
                                \P1.P1.P3.More  = 1'b0;
                                \P1.P1.P3.Flush  = 1'b0;
                                \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 2 );
                                \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P1.P1.P3.Flush  = 1'b0;
                        \P1.P1.P3.More  = 1'b1;
                    end
                end
                \P1.P1.P3.IN_al :
                begin
                    if ( ( \P1.P1.P3.InstQueueWr_Addr  - \P1.P1.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P1.P1.P3.rEIP  <= ( \P1.P1.P3.InstQueueRd_Addr  + 1 );
                        \P1.P1.P3.RequestPending  <= \P1.P1.P3.Pending ;
                        \P1.P1.P3.ReadRequest  <= \P1.P1.P3.Pending ;
                        \P1.P1.P3.MemoryFetch  <= \P1.P1.P3.NotPending ;
                        \P1.P1.P3.CodeFetch  <= \P1.P1.P3.NotPending ;
                        if ( \P1.P1.P3.READY_n  == 1'b0 ) 
                        begin
                            \P1.P1.P3.RequestPending  <= \P1.P1.P3.NotPending ;
                            \P1.P1.P3.EAX  <= \P1.P1.P3.Datai ;
                            \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 2 );
                            \P1.P1.P3.InstQueueRd_Addr  = ( \P1.P1.P3.InstQueueRd_Addr  + 2 );
                            \P1.P1.P3.Flush  = 1'b0;
                            \P1.P1.P3.More  = 1'b0;
                        end
                    end
                    else
                    begin
                        \P1.P1.P3.Flush  = 1'b0;
                        \P1.P1.P3.More  = 1'b1;
                    end
                end
                \P1.P1.P3.OUT_al :
                begin
                    if ( ( \P1.P1.P3.InstQueueWr_Addr  - \P1.P1.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P1.P1.P3.rEIP  <= ( \P1.P1.P3.InstQueueRd_Addr  + 1 );
                        \P1.P1.P3.RequestPending  <= \P1.P1.P3.Pending ;
                        \P1.P1.P3.ReadRequest  <= \P1.P1.P3.NotPending ;
                        \P1.P1.P3.MemoryFetch  <= \P1.P1.P3.NotPending ;
                        \P1.P1.P3.CodeFetch  <= \P1.P1.P3.NotPending ;
                        if ( ( \P1.P1.P3.State  == \P1.P1.P3.StateT1  ) | ( \P1.P1.P3.State  == \P1.P1.P3.StateT1P  ) ) 
                        begin
                            \P1.P1.P3.fWord  = ( \P1.P1.P3.EAX  % ( 2 ** 16 ) );
                            \P1.P1.P3.Datao  <= \P1.P1.P3.fWord ;
                            if ( \P1.P1.P3.READY_n  == 1'b0 ) 
                            begin
                                \P1.P1.P3.RequestPending  <= \P1.P1.P3.NotPending ;
                                \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 2 );
                                \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 2 ) % 16 );
                                \P1.P1.P3.Flush  = 1'b0;
                                \P1.P1.P3.More  = 1'b0;
                            end
                        end
                    end
                    else
                    begin
                        \P1.P1.P3.Flush  = 1'b0;
                        \P1.P1.P3.More  = 1'b1;
                    end
                end
                \P1.P1.P3.ADD_al_b :
                begin
                    \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 1 );
                    \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P3.Flush  = 1'b0;
                    \P1.P1.P3.More  = 1'b0;
                end
                \P1.P1.P3.ADD_ax_w :
                begin
                    \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 1 );
                    \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P3.Flush  = 1'b0;
                    \P1.P1.P3.More  = 1'b0;
                end
                \P1.P1.P3.ROL_al_1 :
                begin
                    \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 2 );
                    \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 2 ) % 16 );
                    \P1.P1.P3.Flush  = 1'b0;
                    \P1.P1.P3.More  = 1'b0;
                end
                \P1.P1.P3.ROL_al_n :
                begin
                    \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 2 );
                    \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 2 ) % 16 );
                    \P1.P1.P3.Flush  = 1'b0;
                    \P1.P1.P3.More  = 1'b0;
                end
                \P1.P1.P3.INC_eax :
                begin
                    \P1.P1.P3.EAX  <= ( \P1.P1.P3.EAX  + 1 );
                    \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 1 );
                    \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P3.Flush  = 1'b0;
                    \P1.P1.P3.More  = 1'b0;
                end
                \P1.P1.P3.INC_ebx :
                begin
                    \P1.P1.P3.EBX  <= ( \P1.P1.P3.EBX  + 1 );
                    \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 1 );
                    \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P3.Flush  = 1'b0;
                    \P1.P1.P3.More  = 1'b0;
                end
                default :
                begin
                    \P1.P1.P3.InstAddrPointer  = ( \P1.P1.P3.InstAddrPointer  + 1 );
                    \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P3.Flush  = 1'b0;
                    \P1.P1.P3.More  = 1'b0;
                end
                endcase
                if (  ~( ( \P1.P1.P3.InstQueueRd_Addr  < \P1.P1.P3.InstQueueWr_Addr  )) | ( ( ( ( \P1.P1.P3.InstQueueLimit  - \P1.P1.P3.InstQueueRd_Addr  ) < 4 ) | \P1.P1.P3.Flush  ) | \P1.P1.P3.More  ) ) 
                begin
                    \P1.P1.P3.State2  = \P1.P1.P3.S7 ;
                end
            end
            \P1.P1.P3.S6 :
            begin
                \P1.P1.P3.Datao  <= ( ( \P1.P1.P3.uWord  * ( 2 ** 16 ) ) + \P1.P1.P3.lWord  );
                if ( \P1.P1.P3.READY_n  == 1'b0 ) 
                begin
                    \P1.P1.P3.RequestPending  <= \P1.P1.P3.NotPending ;
                    \P1.P1.P3.State2  = \P1.P1.P3.S5 ;
                end
            end
            \P1.P1.P3.S7 :
            begin
                if ( \P1.P1.P3.Flush  ) 
                begin
                    \P1.P1.P3.InstQueueRd_Addr  = 1;
                    \P1.P1.P3.InstQueueWr_Addr  = 1;
                    if ( \P1.P1.P3.InstAddrPointer  < 0 ) 
                    begin
                        \P1.P1.P3.fWord  =  -( \P1.P1.P3.InstAddrPointer );
                    end
                    else
                    begin 
                        \P1.P1.P3.fWord  = \P1.P1.P3.InstAddrPointer ;
                    end
                    if ( ( \P1.P1.P3.fWord  % 2 ) == 1 ) 
                    begin
                        \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + ( \P1.P1.P3.fWord  % 4 ) ) % 16 );
                    end
                end
                if ( ( \P1.P1.P3.InstQueueLimit  - \P1.P1.P3.InstQueueRd_Addr  ) < 3 ) 
                begin
                    \P1.P1.P3.State2  = \P1.P1.P3.S8 ;
                    \P1.P1.P3.InstQueueWr_Addr  = 0;
                end
                else
                begin 
                    \P1.P1.P3.State2  = \P1.P1.P3.S9 ;
                end
            end
            \P1.P1.P3.S8 :
            begin
                if ( \P1.P1.P3.InstQueueRd_Addr  <= \P1.P1.P3.InstQueueLimit  ) 
                begin
                    \P1.P1.P3.InstQueue [\P1.P1.P3.InstQueueWr_Addr ] = \P1.P1.P3.InstQueue [\P1.P1.P3.InstQueueRd_Addr ];
                    \P1.P1.P3.InstQueueRd_Addr  = ( ( \P1.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P1.P3.InstQueueWr_Addr  = ( ( \P1.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P1.P3.State2  = \P1.P1.P3.S8 ;
                end
                else
                begin
                    \P1.P1.P3.InstQueueRd_Addr  = 0;
                    \P1.P1.P3.State2  = \P1.P1.P3.S9 ;
                end
            end
            \P1.P1.P3.S9 :
            begin
                \P1.P1.P3.rEIP  <= \P1.P1.P3.PhyAddrPointer ;
                \P1.P1.P3.State2  = \P1.P1.P3.S1 ;
            end
            endcase
        end
    end
    always @ (  posedge \P1.P1.P3.CLOCK  or  posedge \P1.P1.P3.RESET )
    begin : \P1.P1.P3.P2 
        if ( \P1.P1.P3.RESET  == 1'b1 ) 
        begin
            \P1.P1.P3.ByteEnable  <= 4'b0000;
            \P1.P1.P3.NonAligned  <= 1'b0;
        end
        else
        begin 
            case ( \P1.P1.P3.DataWidth  ) 
            \P1.P1.P3.WidthByte :
            begin
                case ( \P1.P1.P3.rEIP  % 4 ) 
                0:
                begin
                    \P1.P1.P3.ByteEnable  <= 4'b1110;
                end
                1:
                begin
                    \P1.P1.P3.ByteEnable  <= 4'b1101;
                end
                2:
                begin
                    \P1.P1.P3.ByteEnable  <= 4'b1011;
                end
                3:
                begin
                    \P1.P1.P3.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            \P1.P1.P3.WidthWord :
            begin
                case ( \P1.P1.P3.rEIP  % 4 ) 
                0:
                begin
                    \P1.P1.P3.ByteEnable  <= 4'b1100;
                    \P1.P1.P3.NonAligned  <= \P1.P1.P3.NotPending ;
                end
                1:
                begin
                    \P1.P1.P3.ByteEnable  <= 4'b1001;
                    \P1.P1.P3.NonAligned  <= \P1.P1.P3.NotPending ;
                end
                2:
                begin
                    \P1.P1.P3.ByteEnable  <= 4'b0011;
                    \P1.P1.P3.NonAligned  <= \P1.P1.P3.NotPending ;
                end
                3:
                begin
                    \P1.P1.P3.ByteEnable  <= 4'b0111;
                    \P1.P1.P3.NonAligned  <= \P1.P1.P3.Pending ;
                end
                default :
                begin
                end
                endcase
            end
            \P1.P1.P3.WidthDword :
            begin
                case ( \P1.P1.P3.rEIP  % 4 ) 
                0:
                begin
                    \P1.P1.P3.ByteEnable  <= 4'b0000;
                    \P1.P1.P3.NonAligned  <= \P1.P1.P3.NotPending ;
                end
                1:
                begin
                    \P1.P1.P3.ByteEnable  <= 4'b0001;
                    \P1.P1.P3.NonAligned  <= \P1.P1.P3.Pending ;
                end
                2:
                begin
                    \P1.P1.P3.NonAligned  <= \P1.P1.P3.Pending ;
                    \P1.P1.P3.ByteEnable  <= 4'b0011;
                end
                3:
                begin
                    \P1.P1.P3.NonAligned  <= \P1.P1.P3.Pending ;
                    \P1.P1.P3.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            default :
            begin
            end
            endcase
        end
    end
    assign \P1.P2.clock  = \P1.clock ;
    assign \P1.P2.reset  = \P1.reset ;
    assign \P1.P2.datai  = \P1.di2 ;
    assign \P1.do2  = \P1.P2.datao ;
    assign \P1.P2.hold  = \P1.hold ;
    assign \P1.P2.na  = \P1.na ;
    assign \P1.P2.bs16  = \P1.bs ;
    assign \P1.ad21  = \P1.P2.address1 ;
    assign \P1.ad22  = \P1.P2.address2 ;
    assign \P1.wr2  = \P1.P2.wr ;
    assign \P1.dc2  = \P1.P2.dc ;
    assign \P1.mio2  = \P1.P2.mio ;
    assign \P1.as21  = \P1.P2.ast1 ;
    assign \P1.as22  = \P1.P2.ast2 ;
    assign \P1.P2.ready1  = \P1.r21 ;
    assign \P1.P2.ready2  = \P1.r22 ;
    always @ (  posedge \P1.P2.clock  or  posedge \P1.P2.reset )
    begin
        if ( \P1.P2.reset  == 1'b1 ) 
        begin
            \P1.P2.buf1  <= 0;
            \P1.P2.ready11  <= 1'b0;
            \P1.P2.ready12  <= 1'b0;
        end
        else
        begin
            if ( ( ( ( ( ( \P1.P2.addr1  > ( 2 ** 29 ) ) & ( \P1.P2.ads1  == 1'b0 ) ) & ( \P1.P2.mio1  == 1'b1 ) ) & ( \P1.P2.dc1  == 1'b0 ) ) & ( \P1.P2.wr1  == 1'b1 ) ) & ( \P1.P2.be1  == 4'b0000 ) ) 
            begin
                \P1.P2.buf1  <= \P1.P2.do1 ;
                \P1.P2.ready11  <= 1'b0;
                \P1.P2.ready12  <= 1'b1;
            end
            else
            begin 
                if ( ( ( ( ( ( \P1.P2.addr2  > ( 2 ** 29 ) ) & ( \P1.P2.ads2  == 1'b0 ) ) & ( \P1.P2.mio2  == 1'b1 ) ) & ( \P1.P2.dc2  == 1'b0 ) ) & ( \P1.P2.wr2  == 1'b1 ) ) & ( \P1.P2.be2  == 4'b0000 ) ) 
                begin
                    \P1.P2.buf1  <= \P1.P2.do2 ;
                    \P1.P2.ready11  <= 1'b1;
                    \P1.P2.ready12  <= 1'b0;
                end
                else
                begin
                    \P1.P2.ready11  <= 1'b1;
                    \P1.P2.ready12  <= 1'b1;
                end
            end
        end
    end
    always @ (  posedge \P1.P2.clock  or  posedge \P1.P2.reset )
    begin
        if ( \P1.P2.reset  == 1'b1 ) 
        begin
            \P1.P2.buf2  <= 0;
            \P1.P2.ready21  <= 1'b0;
            \P1.P2.ready22  <= 1'b0;
        end
        else
        begin
            if ( ( ( ( ( ( \P1.P2.addr2  < ( 2 ** 29 ) ) & ( \P1.P2.ads2  == 1'b0 ) ) & ( \P1.P2.mio2  == 1'b1 ) ) & ( \P1.P2.dc2  == 1'b0 ) ) & ( \P1.P2.wr2  == 1'b1 ) ) & ( \P1.P2.be2  == 4'b0000 ) ) 
            begin
                \P1.P2.buf2  <= \P1.P2.do2 ;
                \P1.P2.ready21  <= 1'b0;
                \P1.P2.ready22  <= 1'b1;
            end
            else
            begin 
                if ( ( ( ( ( \P1.P2.ads3  == 1'b0 ) & ( \P1.P2.mio3  == 1'b1 ) ) & ( \P1.P2.dc3  == 1'b0 ) ) & ( \P1.P2.wr3  == 1'b0 ) ) & ( \P1.P2.be3  == 4'b0000 ) ) 
                begin
                    \P1.P2.ready21  <= 1'b1;
                    \P1.P2.ready22  <= 1'b0;
                end
                else
                begin
                    \P1.P2.ready21  <= 1'b1;
                    \P1.P2.ready22  <= 1'b1;
                end
            end
        end
    end
    always @ (  \P1.P2.addr1  or  \P1.P2.buf1  or  \P1.P2.datai )
    begin
        if ( \P1.P2.addr1  > ( 2 ** 29 ) ) 
        begin
            \P1.P2.di1  <= \P1.P2.buf1 ;
        end
        else
        begin 
            \P1.P2.di1  <= \P1.P2.datai ;
        end
    end
    always @ (  \P1.P2.addr2  or  \P1.P2.buf1  or  \P1.P2.buf2 )
    begin
        if ( \P1.P2.addr2  > ( 2 ** 29 ) ) 
        begin
            \P1.P2.di2  <= \P1.P2.buf1 ;
        end
        else
        begin 
            \P1.P2.di2  <= \P1.P2.buf2 ;
        end
    end
    always @ (  \P1.P2.addr2  or  \P1.P2.addr3  or  \P1.P2.do1  or  \P1.P2.do2  or  \P1.P2.do3 )
    begin
        if ( ( ( \P1.P2.do1  < ( 2 ** 30 ) ) & ( \P1.P2.do2  < ( 2 ** 30 ) ) ) & ( \P1.P2.do3  < ( 2 ** 30 ) ) ) 
        begin
            \P1.P2.address2  <= \P1.P2.addr3 ;
        end
        else
        begin 
            \P1.P2.address2  <= \P1.P2.addr2 ;
        end
    end
    always @ (  \P1.P2.buf2  or  \P1.P2.do3  or  \P1.P2.addr1  or  \P1.P2.wr3  or  \P1.P2.dc3  or  \P1.P2.mio3  or  \P1.P2.ads1  or  \P1.P2.ads3  or  \P1.P2.ready1  or  \P1.P2.ready2  or  \P1.P2.ready11  or  \P1.P2.ready12  or  \P1.P2.ready21  or  \P1.P2.ready22 )
    begin
        \P1.P2.di3  <= \P1.P2.buf2 ;
        \P1.P2.datao  <= \P1.P2.do3 ;
        \P1.P2.address1  <= \P1.P2.addr1 ;
        \P1.P2.wr  <= \P1.P2.wr3 ;
        \P1.P2.dc  <= \P1.P2.dc3 ;
        \P1.P2.mio  <= \P1.P2.mio3 ;
        \P1.P2.ast1  <= \P1.P2.ads1 ;
        \P1.P2.ast2  <= \P1.P2.ads3 ;
        \P1.P2.rdy1  <= ( \P1.P2.ready11  & \P1.P2.ready1  );
        \P1.P2.rdy2  <= ( \P1.P2.ready12  & \P1.P2.ready21  );
        \P1.P2.rdy3  <= ( \P1.P2.ready22  & \P1.P2.ready2  );
    end
    assign \P1.P2.be1  = \P1.P2.P1.BE_n ;
    assign \P1.P2.addr1  = \P1.P2.P1.Address ;
    assign \P1.P2.wr1  = \P1.P2.P1.W_R_n ;
    assign \P1.P2.dc1  = \P1.P2.P1.D_C_n ;
    assign \P1.P2.mio1  = \P1.P2.P1.M_IO_n ;
    assign \P1.P2.ads1  = \P1.P2.P1.ADS_n ;
    assign \P1.P2.P1.Datai  = \P1.P2.di1 ;
    assign \P1.P2.do1  = \P1.P2.P1.Datao ;
    assign \P1.P2.P1.CLOCK  = \P1.P2.clock ;
    assign \P1.P2.P1.NA_n  = \P1.P2.na ;
    assign \P1.P2.P1.BS16_n  = \P1.P2.bs16 ;
    assign \P1.P2.P1.READY_n  = \P1.P2.rdy1 ;
    assign \P1.P2.P1.HOLD  = \P1.P2.hold ;
    assign \P1.P2.P1.RESET  = \P1.P2.reset ;
    always @ (  posedge \P1.P2.P1.CLOCK  or  posedge \P1.P2.P1.RESET )
    begin : \P1.P2.P1.P0 
        if ( \P1.P2.P1.RESET  == 1'b1 ) 
        begin
            \P1.P2.P1.BE_n  <= 4'b0000;
            \P1.P2.P1.Address  <= 0;
            \P1.P2.P1.W_R_n  <= 1'b0;
            \P1.P2.P1.D_C_n  <= 1'b0;
            \P1.P2.P1.M_IO_n  <= 1'b0;
            \P1.P2.P1.ADS_n  <= 1'b0;
            \P1.P2.P1.State  <= \P1.P2.P1.StateInit ;
            \P1.P2.P1.StateNA  <= 1'b0;
            \P1.P2.P1.StateBS16  <= 1'b0;
            \P1.P2.P1.DataWidth  <= 0;
        end
        else
        begin 
            case ( \P1.P2.P1.State  ) 
            \P1.P2.P1.StateInit :
            begin
                \P1.P2.P1.D_C_n  <= 1'b1;
                \P1.P2.P1.ADS_n  <= 1'b1;
                \P1.P2.P1.State  <= \P1.P2.P1.StateTi ;
                \P1.P2.P1.StateNA  <= 1'b1;
                \P1.P2.P1.StateBS16  <= 1'b1;
                \P1.P2.P1.DataWidth  <= 2;
                \P1.P2.P1.State  <= \P1.P2.P1.StateTi ;
            end
            \P1.P2.P1.StateTi :
            begin
                if ( \P1.P2.P1.RequestPending  == \P1.P2.P1.Pending  ) 
                begin
                    \P1.P2.P1.State  <= \P1.P2.P1.StateT1 ;
                end
                else
                begin 
                    if ( \P1.P2.P1.HOLD  == 1'b1 ) 
                    begin
                        \P1.P2.P1.State  <= \P1.P2.P1.StateTh ;
                    end
                    else
                    begin 
                        \P1.P2.P1.State  <= \P1.P2.P1.StateTi ;
                    end
                end
            end
            \P1.P2.P1.StateT1 :
            begin
                \P1.P2.P1.Address  <= ( ( \P1.P2.P1.rEIP  / 4 ) % ( 2 ** 30 ) );
                \P1.P2.P1.BE_n  <= \P1.P2.P1.ByteEnable ;
                \P1.P2.P1.M_IO_n  <= \P1.P2.P1.MemoryFetch ;
                if ( \P1.P2.P1.ReadRequest  == \P1.P2.P1.Pending  ) 
                begin
                    \P1.P2.P1.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P2.P1.W_R_n  <= 1'b1;
                end
                if ( \P1.P2.P1.CodeFetch  == \P1.P2.P1.Pending  ) 
                begin
                    \P1.P2.P1.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P2.P1.D_C_n  <= 1'b1;
                end
                \P1.P2.P1.ADS_n  <= 1'b0;
                \P1.P2.P1.State  <= \P1.P2.P1.StateT2 ;
            end
            \P1.P2.P1.StateT2 :
            begin
                if ( ( ( \P1.P2.P1.READY_n  == 1'b0 ) & ( \P1.P2.P1.HOLD  == 1'b0 ) ) & ( \P1.P2.P1.RequestPending  == \P1.P2.P1.Pending  ) ) 
                begin
                    \P1.P2.P1.State  <= \P1.P2.P1.StateT1 ;
                end
                else
                begin 
                    if ( ( \P1.P2.P1.READY_n  == 1'b1 ) & ( \P1.P2.P1.NA_n  == 1'b1 ) ) 
                    begin
                    end
                    else
                    begin 
                        if ( ( ( \P1.P2.P1.RequestPending  == \P1.P2.P1.Pending  ) | ( \P1.P2.P1.HOLD  == 1'b1 ) ) & ( ( \P1.P2.P1.READY_n  == 1'b1 ) & ( \P1.P2.P1.NA_n  == 1'b0 ) ) ) 
                        begin
                            \P1.P2.P1.State  <= \P1.P2.P1.StateT2I ;
                        end
                        else
                        begin 
                            if ( ( ( ( \P1.P2.P1.RequestPending  == \P1.P2.P1.Pending  ) & ( \P1.P2.P1.HOLD  == 1'b0 ) ) & ( \P1.P2.P1.READY_n  == 1'b1 ) ) & ( \P1.P2.P1.NA_n  == 1'b0 ) ) 
                            begin
                                \P1.P2.P1.State  <= \P1.P2.P1.StateT2P ;
                            end
                            else
                            begin 
                                if ( ( ( \P1.P2.P1.RequestPending  == \P1.P2.P1.NotPending  ) & ( \P1.P2.P1.HOLD  == 1'b0 ) ) & ( \P1.P2.P1.READY_n  == 1'b0 ) ) 
                                begin
                                    \P1.P2.P1.State  <= \P1.P2.P1.StateTi ;
                                end
                                else
                                begin 
                                    if ( ( \P1.P2.P1.HOLD  == 1'b1 ) & ( \P1.P2.P1.READY_n  == 1'b1 ) ) 
                                    begin
                                        \P1.P2.P1.State  <= \P1.P2.P1.StateTh ;
                                    end
                                    else
                                    begin 
                                        \P1.P2.P1.State  <= \P1.P2.P1.StateT2 ;
                                    end
                                end
                            end
                        end
                    end
                end
                \P1.P2.P1.StateBS16  <= \P1.P2.P1.BS16_n ;
                if ( \P1.P2.P1.BS16_n  == 1'b0 ) 
                begin
                    \P1.P2.P1.DataWidth  <= \P1.P2.P1.WidthWord ;
                end
                else
                begin 
                    \P1.P2.P1.DataWidth  <= \P1.P2.P1.WidthDword ;
                end
                \P1.P2.P1.StateNA  <= \P1.P2.P1.NA_n ;
                \P1.P2.P1.ADS_n  <= 1'b1;
            end
            \P1.P2.P1.StateT1P :
            begin
                if ( ( ( \P1.P2.P1.NA_n  == 1'b0 ) & ( \P1.P2.P1.HOLD  == 1'b0 ) ) & ( \P1.P2.P1.RequestPending  == \P1.P2.P1.Pending  ) ) 
                begin
                    \P1.P2.P1.State  <= \P1.P2.P1.StateT2P ;
                end
                else
                begin 
                    if ( ( \P1.P2.P1.NA_n  == 1'b0 ) & ( ( \P1.P2.P1.HOLD  == 1'b1 ) | ( \P1.P2.P1.RequestPending  == \P1.P2.P1.NotPending  ) ) ) 
                    begin
                        \P1.P2.P1.State  <= \P1.P2.P1.StateT2I ;
                    end
                    else
                    begin 
                        if ( \P1.P2.P1.NA_n  == 1'b1 ) 
                        begin
                            \P1.P2.P1.State  <= \P1.P2.P1.StateT2 ;
                        end
                        else
                        begin 
                            \P1.P2.P1.State  <= \P1.P2.P1.StateT1P ;
                        end
                    end
                end
                \P1.P2.P1.StateBS16  <= \P1.P2.P1.BS16_n ;
                if ( \P1.P2.P1.BS16_n  == 1'b0 ) 
                begin
                    \P1.P2.P1.DataWidth  <= \P1.P2.P1.WidthWord ;
                end
                else
                begin 
                    \P1.P2.P1.DataWidth  <= \P1.P2.P1.WidthDword ;
                end
                \P1.P2.P1.StateNA  <= \P1.P2.P1.NA_n ;
                \P1.P2.P1.ADS_n  <= 1'b1;
            end
            \P1.P2.P1.StateTh :
            begin
                if ( ( \P1.P2.P1.HOLD  == 1'b0 ) & ( \P1.P2.P1.RequestPending  == \P1.P2.P1.Pending  ) ) 
                begin
                    \P1.P2.P1.State  <= \P1.P2.P1.StateT1 ;
                end
                else
                begin 
                    if ( ( \P1.P2.P1.HOLD  == 1'b0 ) & ( \P1.P2.P1.RequestPending  == \P1.P2.P1.NotPending  ) ) 
                    begin
                        \P1.P2.P1.State  <= \P1.P2.P1.StateTi ;
                    end
                    else
                    begin 
                        \P1.P2.P1.State  <= \P1.P2.P1.StateTh ;
                    end
                end
            end
            \P1.P2.P1.StateT2P :
            begin
                \P1.P2.P1.Address  <= ( ( \P1.P2.P1.rEIP  / 2 ) % ( 2 ** 30 ) );
                \P1.P2.P1.BE_n  <= \P1.P2.P1.ByteEnable ;
                \P1.P2.P1.M_IO_n  <= \P1.P2.P1.MemoryFetch ;
                if ( \P1.P2.P1.ReadRequest  == \P1.P2.P1.Pending  ) 
                begin
                    \P1.P2.P1.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P2.P1.W_R_n  <= 1'b1;
                end
                if ( \P1.P2.P1.CodeFetch  == \P1.P2.P1.Pending  ) 
                begin
                    \P1.P2.P1.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P2.P1.D_C_n  <= 1'b1;
                end
                \P1.P2.P1.ADS_n  <= 1'b0;
                if ( \P1.P2.P1.READY_n  == 1'b0 ) 
                begin
                    \P1.P2.P1.State  <= \P1.P2.P1.StateT1P ;
                end
                else
                begin 
                    \P1.P2.P1.State  <= \P1.P2.P1.StateT2P ;
                end
            end
            \P1.P2.P1.StateT2I :
            begin
                if ( ( ( \P1.P2.P1.READY_n  == 1'b1 ) & ( \P1.P2.P1.RequestPending  == \P1.P2.P1.Pending  ) ) & ( \P1.P2.P1.HOLD  == 1'b0 ) ) 
                begin
                    \P1.P2.P1.State  <= \P1.P2.P1.StateT2P ;
                end
                else
                begin 
                    if ( ( \P1.P2.P1.READY_n  == 1'b0 ) & ( \P1.P2.P1.HOLD  == 1'b1 ) ) 
                    begin
                        \P1.P2.P1.State  <= \P1.P2.P1.StateTh ;
                    end
                    else
                    begin 
                        if ( ( ( \P1.P2.P1.READY_n  == 1'b0 ) & ( \P1.P2.P1.HOLD  == 1'b0 ) ) & ( \P1.P2.P1.RequestPending  == \P1.P2.P1.Pending  ) ) 
                        begin
                            \P1.P2.P1.State  <= \P1.P2.P1.StateT1 ;
                        end
                        else
                        begin 
                            if ( ( ( \P1.P2.P1.READY_n  == 1'b0 ) & ( \P1.P2.P1.HOLD  == 1'b0 ) ) & ( \P1.P2.P1.RequestPending  == \P1.P2.P1.NotPending  ) ) 
                            begin
                                \P1.P2.P1.State  <= \P1.P2.P1.StateTi ;
                            end
                            else
                            begin 
                                \P1.P2.P1.State  <= \P1.P2.P1.StateT2I ;
                            end
                        end
                    end
                end
            end
            endcase
        end
    end
    always @ (  posedge \P1.P2.P1.CLOCK  or  posedge \P1.P2.P1.RESET )
    begin : \P1.P2.P1.P1 
        reg [7:0] \P1.P2.P1.InstQueue [15:0];
        reg [4:0] \P1.P2.P1.InstQueueRd_Addr ;
        reg [4:0] \P1.P2.P1.InstQueueWr_Addr ;
        parameter \P1.P2.P1.InstQueueLimit   = 15;
        integer \P1.P2.P1.InstAddrPointer ;
        integer \P1.P2.P1.PhyAddrPointer ;
        reg  \P1.P2.P1.Extended ;
        reg  \P1.P2.P1.More ;
        reg  \P1.P2.P1.Flush ;
        reg [15:0] \P1.P2.P1.lWord ;
        reg [14:0] \P1.P2.P1.uWord ;
        integer \P1.P2.P1.fWord ;
        reg [3:0] \P1.P2.P1.State2 ;
        parameter \P1.P2.P1.Si   = 0;
        parameter \P1.P2.P1.S1   = 1;
        parameter \P1.P2.P1.S2   = 2;
        parameter \P1.P2.P1.S3   = 3;
        parameter \P1.P2.P1.S4   = 4;
        parameter \P1.P2.P1.S5   = 5;
        parameter \P1.P2.P1.S6   = 6;
        parameter \P1.P2.P1.S7   = 7;
        parameter \P1.P2.P1.S8   = 8;
        parameter \P1.P2.P1.S9   = 9;
        if ( \P1.P2.P1.RESET  == 1'b1 ) 
        begin
            \P1.P2.P1.State2  = \P1.P2.P1.Si ;
            \P1.P2.P1.InstQueue  = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            \P1.P2.P1.InstQueueRd_Addr  = 0;
            \P1.P2.P1.InstQueueWr_Addr  = 0;
            \P1.P2.P1.InstAddrPointer  = 0;
            \P1.P2.P1.PhyAddrPointer  = 0;
            \P1.P2.P1.Extended  = 1'b0;
            \P1.P2.P1.More  = 1'b0;
            \P1.P2.P1.Flush  = 1'b0;
            \P1.P2.P1.lWord  = 0;
            \P1.P2.P1.uWord  = 0;
            \P1.P2.P1.fWord  = 0;
            \P1.P2.P1.CodeFetch  <= 1'b0;
            \P1.P2.P1.Datao  <= 0;
            \P1.P2.P1.EAX  <= 0;
            \P1.P2.P1.EBX  <= 0;
            \P1.P2.P1.rEIP  <= 0;
            \P1.P2.P1.ReadRequest  <= 1'b0;
            \P1.P2.P1.MemoryFetch  <= 1'b0;
            \P1.P2.P1.RequestPending  <= 1'b0;
        end
        else
        begin 
            case ( \P1.P2.P1.State2  ) 
            \P1.P2.P1.Si :
            begin
                \P1.P2.P1.PhyAddrPointer  = \P1.P2.P1.rEIP ;
                \P1.P2.P1.InstAddrPointer  = \P1.P2.P1.PhyAddrPointer ;
                \P1.P2.P1.State2  = \P1.P2.P1.S1 ;
                \P1.P2.P1.rEIP  <= 20'hFFFF0;
                \P1.P2.P1.ReadRequest  <= 1'b1;
                \P1.P2.P1.MemoryFetch  <= 1'b1;
                \P1.P2.P1.RequestPending  <= 1'b1;
            end
            \P1.P2.P1.S1 :
            begin
                \P1.P2.P1.RequestPending  <= \P1.P2.P1.Pending ;
                \P1.P2.P1.ReadRequest  <= \P1.P2.P1.Pending ;
                \P1.P2.P1.MemoryFetch  <= \P1.P2.P1.Pending ;
                \P1.P2.P1.CodeFetch  <= \P1.P2.P1.Pending ;
                if ( \P1.P2.P1.READY_n  == 1'b0 ) 
                begin
                    \P1.P2.P1.State2  = \P1.P2.P1.S2 ;
                end
                else
                begin 
                    \P1.P2.P1.State2  = \P1.P2.P1.S1 ;
                end
            end
            \P1.P2.P1.S2 :
            begin
                \P1.P2.P1.RequestPending  <= \P1.P2.P1.NotPending ;
                \P1.P2.P1.InstQueue [\P1.P2.P1.InstQueueWr_Addr ] = ( \P1.P2.P1.Datai  % ( 2 ** 8 ) );
                \P1.P2.P1.InstQueueWr_Addr  = ( ( \P1.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P2.P1.InstQueue [\P1.P2.P1.InstQueueWr_Addr ] = ( \P1.P2.P1.Datai  % ( 2 ** 8 ) );
                \P1.P2.P1.InstQueueWr_Addr  = ( ( \P1.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                if ( \P1.P2.P1.StateBS16  == 1'b1 ) 
                begin
                    \P1.P2.P1.InstQueue [\P1.P2.P1.InstQueueWr_Addr ] = ( ( \P1.P2.P1.Datai  / ( 2 ** 16 ) ) % ( 2 ** 8 ) );
                    \P1.P2.P1.InstQueueWr_Addr  = ( ( \P1.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P2.P1.InstQueue [\P1.P2.P1.InstQueueWr_Addr ] = ( ( \P1.P2.P1.Datai  / ( 2 ** 24 ) ) % ( 2 ** 8 ) );
                    \P1.P2.P1.InstQueueWr_Addr  = ( ( \P1.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P2.P1.PhyAddrPointer  = ( \P1.P2.P1.PhyAddrPointer  + 4 );
                    \P1.P2.P1.State2  = \P1.P2.P1.S5 ;
                end
                else
                begin
                    \P1.P2.P1.PhyAddrPointer  = ( \P1.P2.P1.PhyAddrPointer  + 2 );
                    if ( \P1.P2.P1.PhyAddrPointer  < 0 ) 
                    begin
                        \P1.P2.P1.rEIP  <=  -( \P1.P2.P1.PhyAddrPointer );
                    end
                    else
                    begin 
                        \P1.P2.P1.rEIP  <= \P1.P2.P1.PhyAddrPointer ;
                    end
                    \P1.P2.P1.State2  = \P1.P2.P1.S3 ;
                end
            end
            \P1.P2.P1.S3 :
            begin
                \P1.P2.P1.RequestPending  <= \P1.P2.P1.Pending ;
                if ( \P1.P2.P1.READY_n  == 1'b0 ) 
                begin
                    \P1.P2.P1.State2  = \P1.P2.P1.S4 ;
                end
                else
                begin 
                    \P1.P2.P1.State2  = \P1.P2.P1.S3 ;
                end
            end
            \P1.P2.P1.S4 :
            begin
                \P1.P2.P1.RequestPending  <= \P1.P2.P1.NotPending ;
                \P1.P2.P1.InstQueue [\P1.P2.P1.InstQueueWr_Addr ] = ( \P1.P2.P1.Datai  % ( 2 ** 8 ) );
                \P1.P2.P1.InstQueueWr_Addr  = ( ( \P1.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P2.P1.InstQueue [\P1.P2.P1.InstQueueWr_Addr ] = ( \P1.P2.P1.Datai  % ( 2 ** 8 ) );
                \P1.P2.P1.InstQueueWr_Addr  = ( ( \P1.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P2.P1.PhyAddrPointer  = ( \P1.P2.P1.PhyAddrPointer  + 2 );
                \P1.P2.P1.State2  = \P1.P2.P1.S5 ;
            end
            \P1.P2.P1.S5 :
            begin
                case ( \P1.P2.P1.InstQueue [\P1.P2.P1.InstQueueRd_Addr ] ) 
                \P1.P2.P1.NOP :
                begin
                    \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 1 );
                    \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P1.Flush  = 1'b0;
                    \P1.P2.P1.More  = 1'b0;
                end
                \P1.P2.P1.OPsop :
                begin
                    \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 1 );
                    \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P1.Extended  = 1'b1;
                    \P1.P2.P1.Flush  = 1'b0;
                    \P1.P2.P1.More  = 1'b0;
                end
                \P1.P2.P1.JMP_rel_short :
                begin
                    if ( ( \P1.P2.P1.InstQueueWr_Addr  - \P1.P2.P1.InstQueueRd_Addr  ) >= 3 ) 
                    begin
                        if ( \P1.P2.P1.InstQueue [( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 )] > 127 ) 
                        begin
                            \P1.P2.P1.PhyAddrPointer  = ( ( \P1.P2.P1.InstAddrPointer  + 1 ) - ( 8'hFF - \P1.P2.P1.InstQueue [( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 )] ) );
                            \P1.P2.P1.InstAddrPointer  = \P1.P2.P1.PhyAddrPointer ;
                        end
                        else
                        begin
                            \P1.P2.P1.PhyAddrPointer  = ( ( \P1.P2.P1.InstAddrPointer  + 2 ) + \P1.P2.P1.InstQueue [( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 )] );
                            \P1.P2.P1.InstAddrPointer  = \P1.P2.P1.PhyAddrPointer ;
                        end
                        \P1.P2.P1.Flush  = 1'b1;
                        \P1.P2.P1.More  = 1'b0;
                    end
                    else
                    begin
                        \P1.P2.P1.Flush  = 1'b0;
                        \P1.P2.P1.More  = 1'b1;
                    end
                end
                \P1.P2.P1.JMP_rel_near :
                begin
                    if ( ( \P1.P2.P1.InstQueueWr_Addr  - \P1.P2.P1.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P2.P1.PhyAddrPointer  = ( ( \P1.P2.P1.InstAddrPointer  + 5 ) + \P1.P2.P1.InstQueue [( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P1.P2.P1.InstAddrPointer  = \P1.P2.P1.PhyAddrPointer ;
                        \P1.P2.P1.Flush  = 1'b1;
                        \P1.P2.P1.More  = 1'b0;
                    end
                    else
                    begin
                        \P1.P2.P1.Flush  = 1'b0;
                        \P1.P2.P1.More  = 1'b1;
                    end
                end
                \P1.P2.P1.JMP_intseg_immed :
                begin
                    \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 1 );
                    \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P1.Flush  = 1'b0;
                    \P1.P2.P1.More  = 1'b0;
                end
                \P1.P2.P1.MOV_al_b :
                begin
                    \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 1 );
                    \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P1.Flush  = 1'b0;
                    \P1.P2.P1.More  = 1'b0;
                end
                \P1.P2.P1.MOV_eax_dw :
                begin
                    if ( ( \P1.P2.P1.InstQueueWr_Addr  - \P1.P2.P1.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P2.P1.EAX  <= ( ( ( ( \P1.P2.P1.InstQueue [( ( \P1.P2.P1.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P1.P2.P1.InstQueue [( ( \P1.P2.P1.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P1.P2.P1.InstQueue [( ( \P1.P2.P1.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P1.P2.P1.InstQueue [( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P1.P2.P1.More  = 1'b0;
                        \P1.P2.P1.Flush  = 1'b0;
                        \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 5 );
                        \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P1.P2.P1.Flush  = 1'b0;
                        \P1.P2.P1.More  = 1'b1;
                    end
                end
                \P1.P2.P1.MOV_ebx_dw :
                begin
                    if ( ( \P1.P2.P1.InstQueueWr_Addr  - \P1.P2.P1.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P2.P1.EBX  <= ( ( ( ( \P1.P2.P1.InstQueue [( ( \P1.P2.P1.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P1.P2.P1.InstQueue [( ( \P1.P2.P1.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P1.P2.P1.InstQueue [( ( \P1.P2.P1.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P1.P2.P1.InstQueue [( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 1 )] );
                        \P1.P2.P1.More  = 1'b0;
                        \P1.P2.P1.Flush  = 1'b0;
                        \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 5 );
                        \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P1.P2.P1.Flush  = 1'b0;
                        \P1.P2.P1.More  = 1'b1;
                    end
                end
                \P1.P2.P1.MOV_eax_ebx :
                begin
                    if ( ( \P1.P2.P1.InstQueueWr_Addr  - \P1.P2.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P1.P2.P1.EBX  < 0 ) 
                        begin
                            \P1.P2.P1.rEIP  <=  -( \P1.P2.P1.EBX );
                        end
                        else
                        begin 
                            \P1.P2.P1.rEIP  <= \P1.P2.P1.EBX ;
                        end
                        \P1.P2.P1.RequestPending  <= \P1.P2.P1.Pending ;
                        \P1.P2.P1.ReadRequest  <= \P1.P2.P1.Pending ;
                        \P1.P2.P1.MemoryFetch  <= \P1.P2.P1.Pending ;
                        \P1.P2.P1.CodeFetch  <= \P1.P2.P1.NotPending ;
                        if ( \P1.P2.P1.READY_n  == 1'b0 ) 
                        begin
                            \P1.P2.P1.RequestPending  <= \P1.P2.P1.NotPending ;
                            \P1.P2.P1.uWord  = ( \P1.P2.P1.Datai  % ( 2 ** 15 ) );
                            if ( \P1.P2.P1.StateBS16  == 1'b1 ) 
                            begin
                                \P1.P2.P1.lWord  = ( \P1.P2.P1.Datai  % ( 2 ** 16 ) );
                            end
                            else
                            begin
                                \P1.P2.P1.rEIP  <= ( \P1.P2.P1.rEIP  + 2 );
                                \P1.P2.P1.RequestPending  <= \P1.P2.P1.Pending ;
                                if ( \P1.P2.P1.READY_n  == 1'b0 ) 
                                begin
                                    \P1.P2.P1.RequestPending  <= \P1.P2.P1.NotPending ;
                                    \P1.P2.P1.lWord  = ( \P1.P2.P1.Datai  % ( 2 ** 16 ) );
                                end
                            end
                            if ( \P1.P2.P1.READY_n  == 1'b0 ) 
                            begin
                                \P1.P2.P1.EAX  <= ( ( \P1.P2.P1.uWord  * ( 2 ** 16 ) ) + \P1.P2.P1.lWord  );
                                \P1.P2.P1.More  = 1'b0;
                                \P1.P2.P1.Flush  = 1'b0;
                                \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 2 );
                                \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P1.P2.P1.Flush  = 1'b0;
                        \P1.P2.P1.More  = 1'b1;
                    end
                end
                \P1.P2.P1.MOV_ebx_eax :
                begin
                    if ( ( \P1.P2.P1.InstQueueWr_Addr  - \P1.P2.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P1.P2.P1.EBX  < 0 ) 
                        begin
                            \P1.P2.P1.rEIP  <= \P1.P2.P1.EBX ;
                        end
                        else
                        begin 
                            \P1.P2.P1.rEIP  <= \P1.P2.P1.EBX ;
                        end
                        \P1.P2.P1.lWord  = ( \P1.P2.P1.EAX  % ( 2 ** 16 ) );
                        \P1.P2.P1.uWord  = ( ( \P1.P2.P1.EAX  / ( 2 ** 16 ) ) % ( 2 ** 15 ) );
                        \P1.P2.P1.RequestPending  <= \P1.P2.P1.Pending ;
                        \P1.P2.P1.ReadRequest  <= \P1.P2.P1.NotPending ;
                        \P1.P2.P1.MemoryFetch  <= \P1.P2.P1.Pending ;
                        \P1.P2.P1.CodeFetch  <= \P1.P2.P1.NotPending ;
                        if ( ( \P1.P2.P1.State  == \P1.P2.P1.StateT1  ) | ( \P1.P2.P1.State  == \P1.P2.P1.StateT1P  ) ) 
                        begin
                            \P1.P2.P1.Datao  <= ( ( \P1.P2.P1.uWord  * ( 2 ** 16 ) ) + \P1.P2.P1.lWord  );
                            if ( \P1.P2.P1.READY_n  == 1'b0 ) 
                            begin
                                \P1.P2.P1.RequestPending  <= \P1.P2.P1.NotPending ;
                                if ( \P1.P2.P1.StateBS16  == 1'b0 ) 
                                begin
                                    \P1.P2.P1.rEIP  <= ( \P1.P2.P1.rEIP  + 2 );
                                    \P1.P2.P1.RequestPending  <= \P1.P2.P1.Pending ;
                                    \P1.P2.P1.ReadRequest  <= \P1.P2.P1.NotPending ;
                                    \P1.P2.P1.MemoryFetch  <= \P1.P2.P1.Pending ;
                                    \P1.P2.P1.CodeFetch  <= \P1.P2.P1.NotPending ;
                                    \P1.P2.P1.State2  = \P1.P2.P1.S6 ;
                                end
                                \P1.P2.P1.More  = 1'b0;
                                \P1.P2.P1.Flush  = 1'b0;
                                \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 2 );
                                \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P1.P2.P1.Flush  = 1'b0;
                        \P1.P2.P1.More  = 1'b1;
                    end
                end
                \P1.P2.P1.IN_al :
                begin
                    if ( ( \P1.P2.P1.InstQueueWr_Addr  - \P1.P2.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P1.P2.P1.rEIP  <= ( \P1.P2.P1.InstQueueRd_Addr  + 1 );
                        \P1.P2.P1.RequestPending  <= \P1.P2.P1.Pending ;
                        \P1.P2.P1.ReadRequest  <= \P1.P2.P1.Pending ;
                        \P1.P2.P1.MemoryFetch  <= \P1.P2.P1.NotPending ;
                        \P1.P2.P1.CodeFetch  <= \P1.P2.P1.NotPending ;
                        if ( \P1.P2.P1.READY_n  == 1'b0 ) 
                        begin
                            \P1.P2.P1.RequestPending  <= \P1.P2.P1.NotPending ;
                            \P1.P2.P1.EAX  <= \P1.P2.P1.Datai ;
                            \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 2 );
                            \P1.P2.P1.InstQueueRd_Addr  = ( \P1.P2.P1.InstQueueRd_Addr  + 2 );
                            \P1.P2.P1.Flush  = 1'b0;
                            \P1.P2.P1.More  = 1'b0;
                        end
                    end
                    else
                    begin
                        \P1.P2.P1.Flush  = 1'b0;
                        \P1.P2.P1.More  = 1'b1;
                    end
                end
                \P1.P2.P1.OUT_al :
                begin
                    if ( ( \P1.P2.P1.InstQueueWr_Addr  - \P1.P2.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P1.P2.P1.rEIP  <= ( \P1.P2.P1.InstQueueRd_Addr  + 1 );
                        \P1.P2.P1.RequestPending  <= \P1.P2.P1.Pending ;
                        \P1.P2.P1.ReadRequest  <= \P1.P2.P1.NotPending ;
                        \P1.P2.P1.MemoryFetch  <= \P1.P2.P1.NotPending ;
                        \P1.P2.P1.CodeFetch  <= \P1.P2.P1.NotPending ;
                        if ( ( \P1.P2.P1.State  == \P1.P2.P1.StateT1  ) | ( \P1.P2.P1.State  == \P1.P2.P1.StateT1P  ) ) 
                        begin
                            \P1.P2.P1.fWord  = ( \P1.P2.P1.EAX  % ( 2 ** 16 ) );
                            \P1.P2.P1.Datao  <= \P1.P2.P1.fWord ;
                            if ( \P1.P2.P1.READY_n  == 1'b0 ) 
                            begin
                                \P1.P2.P1.RequestPending  <= \P1.P2.P1.NotPending ;
                                \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 2 );
                                \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 2 ) % 16 );
                                \P1.P2.P1.Flush  = 1'b0;
                                \P1.P2.P1.More  = 1'b0;
                            end
                        end
                    end
                    else
                    begin
                        \P1.P2.P1.Flush  = 1'b0;
                        \P1.P2.P1.More  = 1'b1;
                    end
                end
                \P1.P2.P1.ADD_al_b :
                begin
                    \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 1 );
                    \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P1.Flush  = 1'b0;
                    \P1.P2.P1.More  = 1'b0;
                end
                \P1.P2.P1.ADD_ax_w :
                begin
                    \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 1 );
                    \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P1.Flush  = 1'b0;
                    \P1.P2.P1.More  = 1'b0;
                end
                \P1.P2.P1.ROL_al_1 :
                begin
                    \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 2 );
                    \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 2 ) % 16 );
                    \P1.P2.P1.Flush  = 1'b0;
                    \P1.P2.P1.More  = 1'b0;
                end
                \P1.P2.P1.ROL_al_n :
                begin
                    \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 2 );
                    \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 2 ) % 16 );
                    \P1.P2.P1.Flush  = 1'b0;
                    \P1.P2.P1.More  = 1'b0;
                end
                \P1.P2.P1.INC_eax :
                begin
                    \P1.P2.P1.EAX  <= ( \P1.P2.P1.EAX  + 1 );
                    \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 1 );
                    \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P1.Flush  = 1'b0;
                    \P1.P2.P1.More  = 1'b0;
                end
                \P1.P2.P1.INC_ebx :
                begin
                    \P1.P2.P1.EBX  <= ( \P1.P2.P1.EBX  + 1 );
                    \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 1 );
                    \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P1.Flush  = 1'b0;
                    \P1.P2.P1.More  = 1'b0;
                end
                default :
                begin
                    \P1.P2.P1.InstAddrPointer  = ( \P1.P2.P1.InstAddrPointer  + 1 );
                    \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P1.Flush  = 1'b0;
                    \P1.P2.P1.More  = 1'b0;
                end
                endcase
                if (  ~( ( \P1.P2.P1.InstQueueRd_Addr  < \P1.P2.P1.InstQueueWr_Addr  )) | ( ( ( ( \P1.P2.P1.InstQueueLimit  - \P1.P2.P1.InstQueueRd_Addr  ) < 4 ) | \P1.P2.P1.Flush  ) | \P1.P2.P1.More  ) ) 
                begin
                    \P1.P2.P1.State2  = \P1.P2.P1.S7 ;
                end
            end
            \P1.P2.P1.S6 :
            begin
                \P1.P2.P1.Datao  <= ( ( \P1.P2.P1.uWord  * ( 2 ** 16 ) ) + \P1.P2.P1.lWord  );
                if ( \P1.P2.P1.READY_n  == 1'b0 ) 
                begin
                    \P1.P2.P1.RequestPending  <= \P1.P2.P1.NotPending ;
                    \P1.P2.P1.State2  = \P1.P2.P1.S5 ;
                end
            end
            \P1.P2.P1.S7 :
            begin
                if ( \P1.P2.P1.Flush  ) 
                begin
                    \P1.P2.P1.InstQueueRd_Addr  = 1;
                    \P1.P2.P1.InstQueueWr_Addr  = 1;
                    if ( \P1.P2.P1.InstAddrPointer  < 0 ) 
                    begin
                        \P1.P2.P1.fWord  =  -( \P1.P2.P1.InstAddrPointer );
                    end
                    else
                    begin 
                        \P1.P2.P1.fWord  = \P1.P2.P1.InstAddrPointer ;
                    end
                    if ( ( \P1.P2.P1.fWord  % 2 ) == 1 ) 
                    begin
                        \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + ( \P1.P2.P1.fWord  % 4 ) ) % 16 );
                    end
                end
                if ( ( \P1.P2.P1.InstQueueLimit  - \P1.P2.P1.InstQueueRd_Addr  ) < 3 ) 
                begin
                    \P1.P2.P1.State2  = \P1.P2.P1.S8 ;
                    \P1.P2.P1.InstQueueWr_Addr  = 0;
                end
                else
                begin 
                    \P1.P2.P1.State2  = \P1.P2.P1.S9 ;
                end
            end
            \P1.P2.P1.S8 :
            begin
                if ( \P1.P2.P1.InstQueueRd_Addr  <= \P1.P2.P1.InstQueueLimit  ) 
                begin
                    \P1.P2.P1.InstQueue [\P1.P2.P1.InstQueueWr_Addr ] = \P1.P2.P1.InstQueue [\P1.P2.P1.InstQueueRd_Addr ];
                    \P1.P2.P1.InstQueueRd_Addr  = ( ( \P1.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P1.InstQueueWr_Addr  = ( ( \P1.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P2.P1.State2  = \P1.P2.P1.S8 ;
                end
                else
                begin
                    \P1.P2.P1.InstQueueRd_Addr  = 0;
                    \P1.P2.P1.State2  = \P1.P2.P1.S9 ;
                end
            end
            \P1.P2.P1.S9 :
            begin
                \P1.P2.P1.rEIP  <= \P1.P2.P1.PhyAddrPointer ;
                \P1.P2.P1.State2  = \P1.P2.P1.S1 ;
            end
            endcase
        end
    end
    always @ (  posedge \P1.P2.P1.CLOCK  or  posedge \P1.P2.P1.RESET )
    begin : \P1.P2.P1.P2 
        if ( \P1.P2.P1.RESET  == 1'b1 ) 
        begin
            \P1.P2.P1.ByteEnable  <= 4'b0000;
            \P1.P2.P1.NonAligned  <= 1'b0;
        end
        else
        begin 
            case ( \P1.P2.P1.DataWidth  ) 
            \P1.P2.P1.WidthByte :
            begin
                case ( \P1.P2.P1.rEIP  % 4 ) 
                0:
                begin
                    \P1.P2.P1.ByteEnable  <= 4'b1110;
                end
                1:
                begin
                    \P1.P2.P1.ByteEnable  <= 4'b1101;
                end
                2:
                begin
                    \P1.P2.P1.ByteEnable  <= 4'b1011;
                end
                3:
                begin
                    \P1.P2.P1.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            \P1.P2.P1.WidthWord :
            begin
                case ( \P1.P2.P1.rEIP  % 4 ) 
                0:
                begin
                    \P1.P2.P1.ByteEnable  <= 4'b1100;
                    \P1.P2.P1.NonAligned  <= \P1.P2.P1.NotPending ;
                end
                1:
                begin
                    \P1.P2.P1.ByteEnable  <= 4'b1001;
                    \P1.P2.P1.NonAligned  <= \P1.P2.P1.NotPending ;
                end
                2:
                begin
                    \P1.P2.P1.ByteEnable  <= 4'b0011;
                    \P1.P2.P1.NonAligned  <= \P1.P2.P1.NotPending ;
                end
                3:
                begin
                    \P1.P2.P1.ByteEnable  <= 4'b0111;
                    \P1.P2.P1.NonAligned  <= \P1.P2.P1.Pending ;
                end
                default :
                begin
                end
                endcase
            end
            \P1.P2.P1.WidthDword :
            begin
                case ( \P1.P2.P1.rEIP  % 4 ) 
                0:
                begin
                    \P1.P2.P1.ByteEnable  <= 4'b0000;
                    \P1.P2.P1.NonAligned  <= \P1.P2.P1.NotPending ;
                end
                1:
                begin
                    \P1.P2.P1.ByteEnable  <= 4'b0001;
                    \P1.P2.P1.NonAligned  <= \P1.P2.P1.Pending ;
                end
                2:
                begin
                    \P1.P2.P1.NonAligned  <= \P1.P2.P1.Pending ;
                    \P1.P2.P1.ByteEnable  <= 4'b0011;
                end
                3:
                begin
                    \P1.P2.P1.NonAligned  <= \P1.P2.P1.Pending ;
                    \P1.P2.P1.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            default :
            begin
            end
            endcase
        end
    end
    assign \P1.P2.be2  = \P1.P2.P2.BE_n ;
    assign \P1.P2.addr2  = \P1.P2.P2.Address ;
    assign \P1.P2.wr2  = \P1.P2.P2.W_R_n ;
    assign \P1.P2.dc2  = \P1.P2.P2.D_C_n ;
    assign \P1.P2.mio2  = \P1.P2.P2.M_IO_n ;
    assign \P1.P2.ads2  = \P1.P2.P2.ADS_n ;
    assign \P1.P2.P2.Datai  = \P1.P2.di2 ;
    assign \P1.P2.do2  = \P1.P2.P2.Datao ;
    assign \P1.P2.P2.CLOCK  = \P1.P2.clock ;
    assign \P1.P2.P2.NA_n  = \P1.P2.na ;
    assign \P1.P2.P2.BS16_n  = \P1.P2.bs16 ;
    assign \P1.P2.P2.READY_n  = \P1.P2.rdy2 ;
    assign \P1.P2.P2.HOLD  = \P1.P2.hold ;
    assign \P1.P2.P2.RESET  = \P1.P2.reset ;
    always @ (  posedge \P1.P2.P2.CLOCK  or  posedge \P1.P2.P2.RESET )
    begin : \P1.P2.P2.P0 
        if ( \P1.P2.P2.RESET  == 1'b1 ) 
        begin
            \P1.P2.P2.BE_n  <= 4'b0000;
            \P1.P2.P2.Address  <= 0;
            \P1.P2.P2.W_R_n  <= 1'b0;
            \P1.P2.P2.D_C_n  <= 1'b0;
            \P1.P2.P2.M_IO_n  <= 1'b0;
            \P1.P2.P2.ADS_n  <= 1'b0;
            \P1.P2.P2.State  <= \P1.P2.P2.StateInit ;
            \P1.P2.P2.StateNA  <= 1'b0;
            \P1.P2.P2.StateBS16  <= 1'b0;
            \P1.P2.P2.DataWidth  <= 0;
        end
        else
        begin 
            case ( \P1.P2.P2.State  ) 
            \P1.P2.P2.StateInit :
            begin
                \P1.P2.P2.D_C_n  <= 1'b1;
                \P1.P2.P2.ADS_n  <= 1'b1;
                \P1.P2.P2.State  <= \P1.P2.P2.StateTi ;
                \P1.P2.P2.StateNA  <= 1'b1;
                \P1.P2.P2.StateBS16  <= 1'b1;
                \P1.P2.P2.DataWidth  <= 2;
                \P1.P2.P2.State  <= \P1.P2.P2.StateTi ;
            end
            \P1.P2.P2.StateTi :
            begin
                if ( \P1.P2.P2.RequestPending  == \P1.P2.P2.Pending  ) 
                begin
                    \P1.P2.P2.State  <= \P1.P2.P2.StateT1 ;
                end
                else
                begin 
                    if ( \P1.P2.P2.HOLD  == 1'b1 ) 
                    begin
                        \P1.P2.P2.State  <= \P1.P2.P2.StateTh ;
                    end
                    else
                    begin 
                        \P1.P2.P2.State  <= \P1.P2.P2.StateTi ;
                    end
                end
            end
            \P1.P2.P2.StateT1 :
            begin
                \P1.P2.P2.Address  <= ( ( \P1.P2.P2.rEIP  / 4 ) % ( 2 ** 30 ) );
                \P1.P2.P2.BE_n  <= \P1.P2.P2.ByteEnable ;
                \P1.P2.P2.M_IO_n  <= \P1.P2.P2.MemoryFetch ;
                if ( \P1.P2.P2.ReadRequest  == \P1.P2.P2.Pending  ) 
                begin
                    \P1.P2.P2.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P2.P2.W_R_n  <= 1'b1;
                end
                if ( \P1.P2.P2.CodeFetch  == \P1.P2.P2.Pending  ) 
                begin
                    \P1.P2.P2.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P2.P2.D_C_n  <= 1'b1;
                end
                \P1.P2.P2.ADS_n  <= 1'b0;
                \P1.P2.P2.State  <= \P1.P2.P2.StateT2 ;
            end
            \P1.P2.P2.StateT2 :
            begin
                if ( ( ( \P1.P2.P2.READY_n  == 1'b0 ) & ( \P1.P2.P2.HOLD  == 1'b0 ) ) & ( \P1.P2.P2.RequestPending  == \P1.P2.P2.Pending  ) ) 
                begin
                    \P1.P2.P2.State  <= \P1.P2.P2.StateT1 ;
                end
                else
                begin 
                    if ( ( \P1.P2.P2.READY_n  == 1'b1 ) & ( \P1.P2.P2.NA_n  == 1'b1 ) ) 
                    begin
                    end
                    else
                    begin 
                        if ( ( ( \P1.P2.P2.RequestPending  == \P1.P2.P2.Pending  ) | ( \P1.P2.P2.HOLD  == 1'b1 ) ) & ( ( \P1.P2.P2.READY_n  == 1'b1 ) & ( \P1.P2.P2.NA_n  == 1'b0 ) ) ) 
                        begin
                            \P1.P2.P2.State  <= \P1.P2.P2.StateT2I ;
                        end
                        else
                        begin 
                            if ( ( ( ( \P1.P2.P2.RequestPending  == \P1.P2.P2.Pending  ) & ( \P1.P2.P2.HOLD  == 1'b0 ) ) & ( \P1.P2.P2.READY_n  == 1'b1 ) ) & ( \P1.P2.P2.NA_n  == 1'b0 ) ) 
                            begin
                                \P1.P2.P2.State  <= \P1.P2.P2.StateT2P ;
                            end
                            else
                            begin 
                                if ( ( ( \P1.P2.P2.RequestPending  == \P1.P2.P2.NotPending  ) & ( \P1.P2.P2.HOLD  == 1'b0 ) ) & ( \P1.P2.P2.READY_n  == 1'b0 ) ) 
                                begin
                                    \P1.P2.P2.State  <= \P1.P2.P2.StateTi ;
                                end
                                else
                                begin 
                                    if ( ( \P1.P2.P2.HOLD  == 1'b1 ) & ( \P1.P2.P2.READY_n  == 1'b1 ) ) 
                                    begin
                                        \P1.P2.P2.State  <= \P1.P2.P2.StateTh ;
                                    end
                                    else
                                    begin 
                                        \P1.P2.P2.State  <= \P1.P2.P2.StateT2 ;
                                    end
                                end
                            end
                        end
                    end
                end
                \P1.P2.P2.StateBS16  <= \P1.P2.P2.BS16_n ;
                if ( \P1.P2.P2.BS16_n  == 1'b0 ) 
                begin
                    \P1.P2.P2.DataWidth  <= \P1.P2.P2.WidthWord ;
                end
                else
                begin 
                    \P1.P2.P2.DataWidth  <= \P1.P2.P2.WidthDword ;
                end
                \P1.P2.P2.StateNA  <= \P1.P2.P2.NA_n ;
                \P1.P2.P2.ADS_n  <= 1'b1;
            end
            \P1.P2.P2.StateT1P :
            begin
                if ( ( ( \P1.P2.P2.NA_n  == 1'b0 ) & ( \P1.P2.P2.HOLD  == 1'b0 ) ) & ( \P1.P2.P2.RequestPending  == \P1.P2.P2.Pending  ) ) 
                begin
                    \P1.P2.P2.State  <= \P1.P2.P2.StateT2P ;
                end
                else
                begin 
                    if ( ( \P1.P2.P2.NA_n  == 1'b0 ) & ( ( \P1.P2.P2.HOLD  == 1'b1 ) | ( \P1.P2.P2.RequestPending  == \P1.P2.P2.NotPending  ) ) ) 
                    begin
                        \P1.P2.P2.State  <= \P1.P2.P2.StateT2I ;
                    end
                    else
                    begin 
                        if ( \P1.P2.P2.NA_n  == 1'b1 ) 
                        begin
                            \P1.P2.P2.State  <= \P1.P2.P2.StateT2 ;
                        end
                        else
                        begin 
                            \P1.P2.P2.State  <= \P1.P2.P2.StateT1P ;
                        end
                    end
                end
                \P1.P2.P2.StateBS16  <= \P1.P2.P2.BS16_n ;
                if ( \P1.P2.P2.BS16_n  == 1'b0 ) 
                begin
                    \P1.P2.P2.DataWidth  <= \P1.P2.P2.WidthWord ;
                end
                else
                begin 
                    \P1.P2.P2.DataWidth  <= \P1.P2.P2.WidthDword ;
                end
                \P1.P2.P2.StateNA  <= \P1.P2.P2.NA_n ;
                \P1.P2.P2.ADS_n  <= 1'b1;
            end
            \P1.P2.P2.StateTh :
            begin
                if ( ( \P1.P2.P2.HOLD  == 1'b0 ) & ( \P1.P2.P2.RequestPending  == \P1.P2.P2.Pending  ) ) 
                begin
                    \P1.P2.P2.State  <= \P1.P2.P2.StateT1 ;
                end
                else
                begin 
                    if ( ( \P1.P2.P2.HOLD  == 1'b0 ) & ( \P1.P2.P2.RequestPending  == \P1.P2.P2.NotPending  ) ) 
                    begin
                        \P1.P2.P2.State  <= \P1.P2.P2.StateTi ;
                    end
                    else
                    begin 
                        \P1.P2.P2.State  <= \P1.P2.P2.StateTh ;
                    end
                end
            end
            \P1.P2.P2.StateT2P :
            begin
                \P1.P2.P2.Address  <= ( ( \P1.P2.P2.rEIP  / 2 ) % ( 2 ** 30 ) );
                \P1.P2.P2.BE_n  <= \P1.P2.P2.ByteEnable ;
                \P1.P2.P2.M_IO_n  <= \P1.P2.P2.MemoryFetch ;
                if ( \P1.P2.P2.ReadRequest  == \P1.P2.P2.Pending  ) 
                begin
                    \P1.P2.P2.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P2.P2.W_R_n  <= 1'b1;
                end
                if ( \P1.P2.P2.CodeFetch  == \P1.P2.P2.Pending  ) 
                begin
                    \P1.P2.P2.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P2.P2.D_C_n  <= 1'b1;
                end
                \P1.P2.P2.ADS_n  <= 1'b0;
                if ( \P1.P2.P2.READY_n  == 1'b0 ) 
                begin
                    \P1.P2.P2.State  <= \P1.P2.P2.StateT1P ;
                end
                else
                begin 
                    \P1.P2.P2.State  <= \P1.P2.P2.StateT2P ;
                end
            end
            \P1.P2.P2.StateT2I :
            begin
                if ( ( ( \P1.P2.P2.READY_n  == 1'b1 ) & ( \P1.P2.P2.RequestPending  == \P1.P2.P2.Pending  ) ) & ( \P1.P2.P2.HOLD  == 1'b0 ) ) 
                begin
                    \P1.P2.P2.State  <= \P1.P2.P2.StateT2P ;
                end
                else
                begin 
                    if ( ( \P1.P2.P2.READY_n  == 1'b0 ) & ( \P1.P2.P2.HOLD  == 1'b1 ) ) 
                    begin
                        \P1.P2.P2.State  <= \P1.P2.P2.StateTh ;
                    end
                    else
                    begin 
                        if ( ( ( \P1.P2.P2.READY_n  == 1'b0 ) & ( \P1.P2.P2.HOLD  == 1'b0 ) ) & ( \P1.P2.P2.RequestPending  == \P1.P2.P2.Pending  ) ) 
                        begin
                            \P1.P2.P2.State  <= \P1.P2.P2.StateT1 ;
                        end
                        else
                        begin 
                            if ( ( ( \P1.P2.P2.READY_n  == 1'b0 ) & ( \P1.P2.P2.HOLD  == 1'b0 ) ) & ( \P1.P2.P2.RequestPending  == \P1.P2.P2.NotPending  ) ) 
                            begin
                                \P1.P2.P2.State  <= \P1.P2.P2.StateTi ;
                            end
                            else
                            begin 
                                \P1.P2.P2.State  <= \P1.P2.P2.StateT2I ;
                            end
                        end
                    end
                end
            end
            endcase
        end
    end
    always @ (  posedge \P1.P2.P2.CLOCK  or  posedge \P1.P2.P2.RESET )
    begin : \P1.P2.P2.P1 
        reg [7:0] \P1.P2.P2.InstQueue [15:0];
        reg [4:0] \P1.P2.P2.InstQueueRd_Addr ;
        reg [4:0] \P1.P2.P2.InstQueueWr_Addr ;
        parameter \P1.P2.P2.InstQueueLimit   = 15;
        integer \P1.P2.P2.InstAddrPointer ;
        integer \P1.P2.P2.PhyAddrPointer ;
        reg  \P1.P2.P2.Extended ;
        reg  \P1.P2.P2.More ;
        reg  \P1.P2.P2.Flush ;
        reg [15:0] \P1.P2.P2.lWord ;
        reg [14:0] \P1.P2.P2.uWord ;
        integer \P1.P2.P2.fWord ;
        reg [3:0] \P1.P2.P2.State2 ;
        parameter \P1.P2.P2.Si   = 0;
        parameter \P1.P2.P2.S1   = 1;
        parameter \P1.P2.P2.S2   = 2;
        parameter \P1.P2.P2.S3   = 3;
        parameter \P1.P2.P2.S4   = 4;
        parameter \P1.P2.P2.S5   = 5;
        parameter \P1.P2.P2.S6   = 6;
        parameter \P1.P2.P2.S7   = 7;
        parameter \P1.P2.P2.S8   = 8;
        parameter \P1.P2.P2.S9   = 9;
        if ( \P1.P2.P2.RESET  == 1'b1 ) 
        begin
            \P1.P2.P2.State2  = \P1.P2.P2.Si ;
            \P1.P2.P2.InstQueue  = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            \P1.P2.P2.InstQueueRd_Addr  = 0;
            \P1.P2.P2.InstQueueWr_Addr  = 0;
            \P1.P2.P2.InstAddrPointer  = 0;
            \P1.P2.P2.PhyAddrPointer  = 0;
            \P1.P2.P2.Extended  = 1'b0;
            \P1.P2.P2.More  = 1'b0;
            \P1.P2.P2.Flush  = 1'b0;
            \P1.P2.P2.lWord  = 0;
            \P1.P2.P2.uWord  = 0;
            \P1.P2.P2.fWord  = 0;
            \P1.P2.P2.CodeFetch  <= 1'b0;
            \P1.P2.P2.Datao  <= 0;
            \P1.P2.P2.EAX  <= 0;
            \P1.P2.P2.EBX  <= 0;
            \P1.P2.P2.rEIP  <= 0;
            \P1.P2.P2.ReadRequest  <= 1'b0;
            \P1.P2.P2.MemoryFetch  <= 1'b0;
            \P1.P2.P2.RequestPending  <= 1'b0;
        end
        else
        begin 
            case ( \P1.P2.P2.State2  ) 
            \P1.P2.P2.Si :
            begin
                \P1.P2.P2.PhyAddrPointer  = \P1.P2.P2.rEIP ;
                \P1.P2.P2.InstAddrPointer  = \P1.P2.P2.PhyAddrPointer ;
                \P1.P2.P2.State2  = \P1.P2.P2.S1 ;
                \P1.P2.P2.rEIP  <= 20'hFFFF0;
                \P1.P2.P2.ReadRequest  <= 1'b1;
                \P1.P2.P2.MemoryFetch  <= 1'b1;
                \P1.P2.P2.RequestPending  <= 1'b1;
            end
            \P1.P2.P2.S1 :
            begin
                \P1.P2.P2.RequestPending  <= \P1.P2.P2.Pending ;
                \P1.P2.P2.ReadRequest  <= \P1.P2.P2.Pending ;
                \P1.P2.P2.MemoryFetch  <= \P1.P2.P2.Pending ;
                \P1.P2.P2.CodeFetch  <= \P1.P2.P2.Pending ;
                if ( \P1.P2.P2.READY_n  == 1'b0 ) 
                begin
                    \P1.P2.P2.State2  = \P1.P2.P2.S2 ;
                end
                else
                begin 
                    \P1.P2.P2.State2  = \P1.P2.P2.S1 ;
                end
            end
            \P1.P2.P2.S2 :
            begin
                \P1.P2.P2.RequestPending  <= \P1.P2.P2.NotPending ;
                \P1.P2.P2.InstQueue [\P1.P2.P2.InstQueueWr_Addr ] = ( \P1.P2.P2.Datai  % ( 2 ** 8 ) );
                \P1.P2.P2.InstQueueWr_Addr  = ( ( \P1.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P2.P2.InstQueue [\P1.P2.P2.InstQueueWr_Addr ] = ( \P1.P2.P2.Datai  % ( 2 ** 8 ) );
                \P1.P2.P2.InstQueueWr_Addr  = ( ( \P1.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                if ( \P1.P2.P2.StateBS16  == 1'b1 ) 
                begin
                    \P1.P2.P2.InstQueue [\P1.P2.P2.InstQueueWr_Addr ] = ( ( \P1.P2.P2.Datai  / ( 2 ** 16 ) ) % ( 2 ** 8 ) );
                    \P1.P2.P2.InstQueueWr_Addr  = ( ( \P1.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P2.P2.InstQueue [\P1.P2.P2.InstQueueWr_Addr ] = ( ( \P1.P2.P2.Datai  / ( 2 ** 24 ) ) % ( 2 ** 8 ) );
                    \P1.P2.P2.InstQueueWr_Addr  = ( ( \P1.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P2.P2.PhyAddrPointer  = ( \P1.P2.P2.PhyAddrPointer  + 4 );
                    \P1.P2.P2.State2  = \P1.P2.P2.S5 ;
                end
                else
                begin
                    \P1.P2.P2.PhyAddrPointer  = ( \P1.P2.P2.PhyAddrPointer  + 2 );
                    if ( \P1.P2.P2.PhyAddrPointer  < 0 ) 
                    begin
                        \P1.P2.P2.rEIP  <=  -( \P1.P2.P2.PhyAddrPointer );
                    end
                    else
                    begin 
                        \P1.P2.P2.rEIP  <= \P1.P2.P2.PhyAddrPointer ;
                    end
                    \P1.P2.P2.State2  = \P1.P2.P2.S3 ;
                end
            end
            \P1.P2.P2.S3 :
            begin
                \P1.P2.P2.RequestPending  <= \P1.P2.P2.Pending ;
                if ( \P1.P2.P2.READY_n  == 1'b0 ) 
                begin
                    \P1.P2.P2.State2  = \P1.P2.P2.S4 ;
                end
                else
                begin 
                    \P1.P2.P2.State2  = \P1.P2.P2.S3 ;
                end
            end
            \P1.P2.P2.S4 :
            begin
                \P1.P2.P2.RequestPending  <= \P1.P2.P2.NotPending ;
                \P1.P2.P2.InstQueue [\P1.P2.P2.InstQueueWr_Addr ] = ( \P1.P2.P2.Datai  % ( 2 ** 8 ) );
                \P1.P2.P2.InstQueueWr_Addr  = ( ( \P1.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P2.P2.InstQueue [\P1.P2.P2.InstQueueWr_Addr ] = ( \P1.P2.P2.Datai  % ( 2 ** 8 ) );
                \P1.P2.P2.InstQueueWr_Addr  = ( ( \P1.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P2.P2.PhyAddrPointer  = ( \P1.P2.P2.PhyAddrPointer  + 2 );
                \P1.P2.P2.State2  = \P1.P2.P2.S5 ;
            end
            \P1.P2.P2.S5 :
            begin
                case ( \P1.P2.P2.InstQueue [\P1.P2.P2.InstQueueRd_Addr ] ) 
                \P1.P2.P2.NOP :
                begin
                    \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 1 );
                    \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P2.Flush  = 1'b0;
                    \P1.P2.P2.More  = 1'b0;
                end
                \P1.P2.P2.OPsop :
                begin
                    \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 1 );
                    \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P2.Extended  = 1'b1;
                    \P1.P2.P2.Flush  = 1'b0;
                    \P1.P2.P2.More  = 1'b0;
                end
                \P1.P2.P2.JMP_rel_short :
                begin
                    if ( ( \P1.P2.P2.InstQueueWr_Addr  - \P1.P2.P2.InstQueueRd_Addr  ) >= 3 ) 
                    begin
                        if ( \P1.P2.P2.InstQueue [( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 )] > 127 ) 
                        begin
                            \P1.P2.P2.PhyAddrPointer  = ( ( \P1.P2.P2.InstAddrPointer  + 1 ) - ( 8'hFF - \P1.P2.P2.InstQueue [( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 )] ) );
                            \P1.P2.P2.InstAddrPointer  = \P1.P2.P2.PhyAddrPointer ;
                        end
                        else
                        begin
                            \P1.P2.P2.PhyAddrPointer  = ( ( \P1.P2.P2.InstAddrPointer  + 2 ) + \P1.P2.P2.InstQueue [( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 )] );
                            \P1.P2.P2.InstAddrPointer  = \P1.P2.P2.PhyAddrPointer ;
                        end
                        \P1.P2.P2.Flush  = 1'b1;
                        \P1.P2.P2.More  = 1'b0;
                    end
                    else
                    begin
                        \P1.P2.P2.Flush  = 1'b0;
                        \P1.P2.P2.More  = 1'b1;
                    end
                end
                \P1.P2.P2.JMP_rel_near :
                begin
                    if ( ( \P1.P2.P2.InstQueueWr_Addr  - \P1.P2.P2.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P2.P2.PhyAddrPointer  = ( ( \P1.P2.P2.InstAddrPointer  + 5 ) + \P1.P2.P2.InstQueue [( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P1.P2.P2.InstAddrPointer  = \P1.P2.P2.PhyAddrPointer ;
                        \P1.P2.P2.Flush  = 1'b1;
                        \P1.P2.P2.More  = 1'b0;
                    end
                    else
                    begin
                        \P1.P2.P2.Flush  = 1'b0;
                        \P1.P2.P2.More  = 1'b1;
                    end
                end
                \P1.P2.P2.JMP_intseg_immed :
                begin
                    \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 1 );
                    \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P2.Flush  = 1'b0;
                    \P1.P2.P2.More  = 1'b0;
                end
                \P1.P2.P2.MOV_al_b :
                begin
                    \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 1 );
                    \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P2.Flush  = 1'b0;
                    \P1.P2.P2.More  = 1'b0;
                end
                \P1.P2.P2.MOV_eax_dw :
                begin
                    if ( ( \P1.P2.P2.InstQueueWr_Addr  - \P1.P2.P2.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P2.P2.EAX  <= ( ( ( ( \P1.P2.P2.InstQueue [( ( \P1.P2.P2.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P1.P2.P2.InstQueue [( ( \P1.P2.P2.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P1.P2.P2.InstQueue [( ( \P1.P2.P2.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P1.P2.P2.InstQueue [( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P1.P2.P2.More  = 1'b0;
                        \P1.P2.P2.Flush  = 1'b0;
                        \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 5 );
                        \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P1.P2.P2.Flush  = 1'b0;
                        \P1.P2.P2.More  = 1'b1;
                    end
                end
                \P1.P2.P2.MOV_ebx_dw :
                begin
                    if ( ( \P1.P2.P2.InstQueueWr_Addr  - \P1.P2.P2.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P2.P2.EBX  <= ( ( ( ( \P1.P2.P2.InstQueue [( ( \P1.P2.P2.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P1.P2.P2.InstQueue [( ( \P1.P2.P2.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P1.P2.P2.InstQueue [( ( \P1.P2.P2.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P1.P2.P2.InstQueue [( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 1 )] );
                        \P1.P2.P2.More  = 1'b0;
                        \P1.P2.P2.Flush  = 1'b0;
                        \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 5 );
                        \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P1.P2.P2.Flush  = 1'b0;
                        \P1.P2.P2.More  = 1'b1;
                    end
                end
                \P1.P2.P2.MOV_eax_ebx :
                begin
                    if ( ( \P1.P2.P2.InstQueueWr_Addr  - \P1.P2.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P1.P2.P2.EBX  < 0 ) 
                        begin
                            \P1.P2.P2.rEIP  <=  -( \P1.P2.P2.EBX );
                        end
                        else
                        begin 
                            \P1.P2.P2.rEIP  <= \P1.P2.P2.EBX ;
                        end
                        \P1.P2.P2.RequestPending  <= \P1.P2.P2.Pending ;
                        \P1.P2.P2.ReadRequest  <= \P1.P2.P2.Pending ;
                        \P1.P2.P2.MemoryFetch  <= \P1.P2.P2.Pending ;
                        \P1.P2.P2.CodeFetch  <= \P1.P2.P2.NotPending ;
                        if ( \P1.P2.P2.READY_n  == 1'b0 ) 
                        begin
                            \P1.P2.P2.RequestPending  <= \P1.P2.P2.NotPending ;
                            \P1.P2.P2.uWord  = ( \P1.P2.P2.Datai  % ( 2 ** 15 ) );
                            if ( \P1.P2.P2.StateBS16  == 1'b1 ) 
                            begin
                                \P1.P2.P2.lWord  = ( \P1.P2.P2.Datai  % ( 2 ** 16 ) );
                            end
                            else
                            begin
                                \P1.P2.P2.rEIP  <= ( \P1.P2.P2.rEIP  + 2 );
                                \P1.P2.P2.RequestPending  <= \P1.P2.P2.Pending ;
                                if ( \P1.P2.P2.READY_n  == 1'b0 ) 
                                begin
                                    \P1.P2.P2.RequestPending  <= \P1.P2.P2.NotPending ;
                                    \P1.P2.P2.lWord  = ( \P1.P2.P2.Datai  % ( 2 ** 16 ) );
                                end
                            end
                            if ( \P1.P2.P2.READY_n  == 1'b0 ) 
                            begin
                                \P1.P2.P2.EAX  <= ( ( \P1.P2.P2.uWord  * ( 2 ** 16 ) ) + \P1.P2.P2.lWord  );
                                \P1.P2.P2.More  = 1'b0;
                                \P1.P2.P2.Flush  = 1'b0;
                                \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 2 );
                                \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P1.P2.P2.Flush  = 1'b0;
                        \P1.P2.P2.More  = 1'b1;
                    end
                end
                \P1.P2.P2.MOV_ebx_eax :
                begin
                    if ( ( \P1.P2.P2.InstQueueWr_Addr  - \P1.P2.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P1.P2.P2.EBX  < 0 ) 
                        begin
                            \P1.P2.P2.rEIP  <= \P1.P2.P2.EBX ;
                        end
                        else
                        begin 
                            \P1.P2.P2.rEIP  <= \P1.P2.P2.EBX ;
                        end
                        \P1.P2.P2.lWord  = ( \P1.P2.P2.EAX  % ( 2 ** 16 ) );
                        \P1.P2.P2.uWord  = ( ( \P1.P2.P2.EAX  / ( 2 ** 16 ) ) % ( 2 ** 15 ) );
                        \P1.P2.P2.RequestPending  <= \P1.P2.P2.Pending ;
                        \P1.P2.P2.ReadRequest  <= \P1.P2.P2.NotPending ;
                        \P1.P2.P2.MemoryFetch  <= \P1.P2.P2.Pending ;
                        \P1.P2.P2.CodeFetch  <= \P1.P2.P2.NotPending ;
                        if ( ( \P1.P2.P2.State  == \P1.P2.P2.StateT1  ) | ( \P1.P2.P2.State  == \P1.P2.P2.StateT1P  ) ) 
                        begin
                            \P1.P2.P2.Datao  <= ( ( \P1.P2.P2.uWord  * ( 2 ** 16 ) ) + \P1.P2.P2.lWord  );
                            if ( \P1.P2.P2.READY_n  == 1'b0 ) 
                            begin
                                \P1.P2.P2.RequestPending  <= \P1.P2.P2.NotPending ;
                                if ( \P1.P2.P2.StateBS16  == 1'b0 ) 
                                begin
                                    \P1.P2.P2.rEIP  <= ( \P1.P2.P2.rEIP  + 2 );
                                    \P1.P2.P2.RequestPending  <= \P1.P2.P2.Pending ;
                                    \P1.P2.P2.ReadRequest  <= \P1.P2.P2.NotPending ;
                                    \P1.P2.P2.MemoryFetch  <= \P1.P2.P2.Pending ;
                                    \P1.P2.P2.CodeFetch  <= \P1.P2.P2.NotPending ;
                                    \P1.P2.P2.State2  = \P1.P2.P2.S6 ;
                                end
                                \P1.P2.P2.More  = 1'b0;
                                \P1.P2.P2.Flush  = 1'b0;
                                \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 2 );
                                \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P1.P2.P2.Flush  = 1'b0;
                        \P1.P2.P2.More  = 1'b1;
                    end
                end
                \P1.P2.P2.IN_al :
                begin
                    if ( ( \P1.P2.P2.InstQueueWr_Addr  - \P1.P2.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P1.P2.P2.rEIP  <= ( \P1.P2.P2.InstQueueRd_Addr  + 1 );
                        \P1.P2.P2.RequestPending  <= \P1.P2.P2.Pending ;
                        \P1.P2.P2.ReadRequest  <= \P1.P2.P2.Pending ;
                        \P1.P2.P2.MemoryFetch  <= \P1.P2.P2.NotPending ;
                        \P1.P2.P2.CodeFetch  <= \P1.P2.P2.NotPending ;
                        if ( \P1.P2.P2.READY_n  == 1'b0 ) 
                        begin
                            \P1.P2.P2.RequestPending  <= \P1.P2.P2.NotPending ;
                            \P1.P2.P2.EAX  <= \P1.P2.P2.Datai ;
                            \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 2 );
                            \P1.P2.P2.InstQueueRd_Addr  = ( \P1.P2.P2.InstQueueRd_Addr  + 2 );
                            \P1.P2.P2.Flush  = 1'b0;
                            \P1.P2.P2.More  = 1'b0;
                        end
                    end
                    else
                    begin
                        \P1.P2.P2.Flush  = 1'b0;
                        \P1.P2.P2.More  = 1'b1;
                    end
                end
                \P1.P2.P2.OUT_al :
                begin
                    if ( ( \P1.P2.P2.InstQueueWr_Addr  - \P1.P2.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P1.P2.P2.rEIP  <= ( \P1.P2.P2.InstQueueRd_Addr  + 1 );
                        \P1.P2.P2.RequestPending  <= \P1.P2.P2.Pending ;
                        \P1.P2.P2.ReadRequest  <= \P1.P2.P2.NotPending ;
                        \P1.P2.P2.MemoryFetch  <= \P1.P2.P2.NotPending ;
                        \P1.P2.P2.CodeFetch  <= \P1.P2.P2.NotPending ;
                        if ( ( \P1.P2.P2.State  == \P1.P2.P2.StateT1  ) | ( \P1.P2.P2.State  == \P1.P2.P2.StateT1P  ) ) 
                        begin
                            \P1.P2.P2.fWord  = ( \P1.P2.P2.EAX  % ( 2 ** 16 ) );
                            \P1.P2.P2.Datao  <= \P1.P2.P2.fWord ;
                            if ( \P1.P2.P2.READY_n  == 1'b0 ) 
                            begin
                                \P1.P2.P2.RequestPending  <= \P1.P2.P2.NotPending ;
                                \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 2 );
                                \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 2 ) % 16 );
                                \P1.P2.P2.Flush  = 1'b0;
                                \P1.P2.P2.More  = 1'b0;
                            end
                        end
                    end
                    else
                    begin
                        \P1.P2.P2.Flush  = 1'b0;
                        \P1.P2.P2.More  = 1'b1;
                    end
                end
                \P1.P2.P2.ADD_al_b :
                begin
                    \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 1 );
                    \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P2.Flush  = 1'b0;
                    \P1.P2.P2.More  = 1'b0;
                end
                \P1.P2.P2.ADD_ax_w :
                begin
                    \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 1 );
                    \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P2.Flush  = 1'b0;
                    \P1.P2.P2.More  = 1'b0;
                end
                \P1.P2.P2.ROL_al_1 :
                begin
                    \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 2 );
                    \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 2 ) % 16 );
                    \P1.P2.P2.Flush  = 1'b0;
                    \P1.P2.P2.More  = 1'b0;
                end
                \P1.P2.P2.ROL_al_n :
                begin
                    \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 2 );
                    \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 2 ) % 16 );
                    \P1.P2.P2.Flush  = 1'b0;
                    \P1.P2.P2.More  = 1'b0;
                end
                \P1.P2.P2.INC_eax :
                begin
                    \P1.P2.P2.EAX  <= ( \P1.P2.P2.EAX  + 1 );
                    \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 1 );
                    \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P2.Flush  = 1'b0;
                    \P1.P2.P2.More  = 1'b0;
                end
                \P1.P2.P2.INC_ebx :
                begin
                    \P1.P2.P2.EBX  <= ( \P1.P2.P2.EBX  + 1 );
                    \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 1 );
                    \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P2.Flush  = 1'b0;
                    \P1.P2.P2.More  = 1'b0;
                end
                default :
                begin
                    \P1.P2.P2.InstAddrPointer  = ( \P1.P2.P2.InstAddrPointer  + 1 );
                    \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P2.Flush  = 1'b0;
                    \P1.P2.P2.More  = 1'b0;
                end
                endcase
                if (  ~( ( \P1.P2.P2.InstQueueRd_Addr  < \P1.P2.P2.InstQueueWr_Addr  )) | ( ( ( ( \P1.P2.P2.InstQueueLimit  - \P1.P2.P2.InstQueueRd_Addr  ) < 4 ) | \P1.P2.P2.Flush  ) | \P1.P2.P2.More  ) ) 
                begin
                    \P1.P2.P2.State2  = \P1.P2.P2.S7 ;
                end
            end
            \P1.P2.P2.S6 :
            begin
                \P1.P2.P2.Datao  <= ( ( \P1.P2.P2.uWord  * ( 2 ** 16 ) ) + \P1.P2.P2.lWord  );
                if ( \P1.P2.P2.READY_n  == 1'b0 ) 
                begin
                    \P1.P2.P2.RequestPending  <= \P1.P2.P2.NotPending ;
                    \P1.P2.P2.State2  = \P1.P2.P2.S5 ;
                end
            end
            \P1.P2.P2.S7 :
            begin
                if ( \P1.P2.P2.Flush  ) 
                begin
                    \P1.P2.P2.InstQueueRd_Addr  = 1;
                    \P1.P2.P2.InstQueueWr_Addr  = 1;
                    if ( \P1.P2.P2.InstAddrPointer  < 0 ) 
                    begin
                        \P1.P2.P2.fWord  =  -( \P1.P2.P2.InstAddrPointer );
                    end
                    else
                    begin 
                        \P1.P2.P2.fWord  = \P1.P2.P2.InstAddrPointer ;
                    end
                    if ( ( \P1.P2.P2.fWord  % 2 ) == 1 ) 
                    begin
                        \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + ( \P1.P2.P2.fWord  % 4 ) ) % 16 );
                    end
                end
                if ( ( \P1.P2.P2.InstQueueLimit  - \P1.P2.P2.InstQueueRd_Addr  ) < 3 ) 
                begin
                    \P1.P2.P2.State2  = \P1.P2.P2.S8 ;
                    \P1.P2.P2.InstQueueWr_Addr  = 0;
                end
                else
                begin 
                    \P1.P2.P2.State2  = \P1.P2.P2.S9 ;
                end
            end
            \P1.P2.P2.S8 :
            begin
                if ( \P1.P2.P2.InstQueueRd_Addr  <= \P1.P2.P2.InstQueueLimit  ) 
                begin
                    \P1.P2.P2.InstQueue [\P1.P2.P2.InstQueueWr_Addr ] = \P1.P2.P2.InstQueue [\P1.P2.P2.InstQueueRd_Addr ];
                    \P1.P2.P2.InstQueueRd_Addr  = ( ( \P1.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P2.InstQueueWr_Addr  = ( ( \P1.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P2.P2.State2  = \P1.P2.P2.S8 ;
                end
                else
                begin
                    \P1.P2.P2.InstQueueRd_Addr  = 0;
                    \P1.P2.P2.State2  = \P1.P2.P2.S9 ;
                end
            end
            \P1.P2.P2.S9 :
            begin
                \P1.P2.P2.rEIP  <= \P1.P2.P2.PhyAddrPointer ;
                \P1.P2.P2.State2  = \P1.P2.P2.S1 ;
            end
            endcase
        end
    end
    always @ (  posedge \P1.P2.P2.CLOCK  or  posedge \P1.P2.P2.RESET )
    begin : \P1.P2.P2.P2 
        if ( \P1.P2.P2.RESET  == 1'b1 ) 
        begin
            \P1.P2.P2.ByteEnable  <= 4'b0000;
            \P1.P2.P2.NonAligned  <= 1'b0;
        end
        else
        begin 
            case ( \P1.P2.P2.DataWidth  ) 
            \P1.P2.P2.WidthByte :
            begin
                case ( \P1.P2.P2.rEIP  % 4 ) 
                0:
                begin
                    \P1.P2.P2.ByteEnable  <= 4'b1110;
                end
                1:
                begin
                    \P1.P2.P2.ByteEnable  <= 4'b1101;
                end
                2:
                begin
                    \P1.P2.P2.ByteEnable  <= 4'b1011;
                end
                3:
                begin
                    \P1.P2.P2.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            \P1.P2.P2.WidthWord :
            begin
                case ( \P1.P2.P2.rEIP  % 4 ) 
                0:
                begin
                    \P1.P2.P2.ByteEnable  <= 4'b1100;
                    \P1.P2.P2.NonAligned  <= \P1.P2.P2.NotPending ;
                end
                1:
                begin
                    \P1.P2.P2.ByteEnable  <= 4'b1001;
                    \P1.P2.P2.NonAligned  <= \P1.P2.P2.NotPending ;
                end
                2:
                begin
                    \P1.P2.P2.ByteEnable  <= 4'b0011;
                    \P1.P2.P2.NonAligned  <= \P1.P2.P2.NotPending ;
                end
                3:
                begin
                    \P1.P2.P2.ByteEnable  <= 4'b0111;
                    \P1.P2.P2.NonAligned  <= \P1.P2.P2.Pending ;
                end
                default :
                begin
                end
                endcase
            end
            \P1.P2.P2.WidthDword :
            begin
                case ( \P1.P2.P2.rEIP  % 4 ) 
                0:
                begin
                    \P1.P2.P2.ByteEnable  <= 4'b0000;
                    \P1.P2.P2.NonAligned  <= \P1.P2.P2.NotPending ;
                end
                1:
                begin
                    \P1.P2.P2.ByteEnable  <= 4'b0001;
                    \P1.P2.P2.NonAligned  <= \P1.P2.P2.Pending ;
                end
                2:
                begin
                    \P1.P2.P2.NonAligned  <= \P1.P2.P2.Pending ;
                    \P1.P2.P2.ByteEnable  <= 4'b0011;
                end
                3:
                begin
                    \P1.P2.P2.NonAligned  <= \P1.P2.P2.Pending ;
                    \P1.P2.P2.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            default :
            begin
            end
            endcase
        end
    end
    assign \P1.P2.be3  = \P1.P2.P3.BE_n ;
    assign \P1.P2.addr3  = \P1.P2.P3.Address ;
    assign \P1.P2.wr3  = \P1.P2.P3.W_R_n ;
    assign \P1.P2.dc3  = \P1.P2.P3.D_C_n ;
    assign \P1.P2.mio3  = \P1.P2.P3.M_IO_n ;
    assign \P1.P2.ads3  = \P1.P2.P3.ADS_n ;
    assign \P1.P2.P3.Datai  = \P1.P2.di3 ;
    assign \P1.P2.do3  = \P1.P2.P3.Datao ;
    assign \P1.P2.P3.CLOCK  = \P1.P2.clock ;
    assign \P1.P2.P3.NA_n  = \P1.P2.na ;
    assign \P1.P2.P3.BS16_n  = \P1.P2.bs16 ;
    assign \P1.P2.P3.READY_n  = \P1.P2.rdy3 ;
    assign \P1.P2.P3.HOLD  = \P1.P2.hold ;
    assign \P1.P2.P3.RESET  = \P1.P2.reset ;
    always @ (  posedge \P1.P2.P3.CLOCK  or  posedge \P1.P2.P3.RESET )
    begin : \P1.P2.P3.P0 
        if ( \P1.P2.P3.RESET  == 1'b1 ) 
        begin
            \P1.P2.P3.BE_n  <= 4'b0000;
            \P1.P2.P3.Address  <= 0;
            \P1.P2.P3.W_R_n  <= 1'b0;
            \P1.P2.P3.D_C_n  <= 1'b0;
            \P1.P2.P3.M_IO_n  <= 1'b0;
            \P1.P2.P3.ADS_n  <= 1'b0;
            \P1.P2.P3.State  <= \P1.P2.P3.StateInit ;
            \P1.P2.P3.StateNA  <= 1'b0;
            \P1.P2.P3.StateBS16  <= 1'b0;
            \P1.P2.P3.DataWidth  <= 0;
        end
        else
        begin 
            case ( \P1.P2.P3.State  ) 
            \P1.P2.P3.StateInit :
            begin
                \P1.P2.P3.D_C_n  <= 1'b1;
                \P1.P2.P3.ADS_n  <= 1'b1;
                \P1.P2.P3.State  <= \P1.P2.P3.StateTi ;
                \P1.P2.P3.StateNA  <= 1'b1;
                \P1.P2.P3.StateBS16  <= 1'b1;
                \P1.P2.P3.DataWidth  <= 2;
                \P1.P2.P3.State  <= \P1.P2.P3.StateTi ;
            end
            \P1.P2.P3.StateTi :
            begin
                if ( \P1.P2.P3.RequestPending  == \P1.P2.P3.Pending  ) 
                begin
                    \P1.P2.P3.State  <= \P1.P2.P3.StateT1 ;
                end
                else
                begin 
                    if ( \P1.P2.P3.HOLD  == 1'b1 ) 
                    begin
                        \P1.P2.P3.State  <= \P1.P2.P3.StateTh ;
                    end
                    else
                    begin 
                        \P1.P2.P3.State  <= \P1.P2.P3.StateTi ;
                    end
                end
            end
            \P1.P2.P3.StateT1 :
            begin
                \P1.P2.P3.Address  <= ( ( \P1.P2.P3.rEIP  / 4 ) % ( 2 ** 30 ) );
                \P1.P2.P3.BE_n  <= \P1.P2.P3.ByteEnable ;
                \P1.P2.P3.M_IO_n  <= \P1.P2.P3.MemoryFetch ;
                if ( \P1.P2.P3.ReadRequest  == \P1.P2.P3.Pending  ) 
                begin
                    \P1.P2.P3.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P2.P3.W_R_n  <= 1'b1;
                end
                if ( \P1.P2.P3.CodeFetch  == \P1.P2.P3.Pending  ) 
                begin
                    \P1.P2.P3.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P2.P3.D_C_n  <= 1'b1;
                end
                \P1.P2.P3.ADS_n  <= 1'b0;
                \P1.P2.P3.State  <= \P1.P2.P3.StateT2 ;
            end
            \P1.P2.P3.StateT2 :
            begin
                if ( ( ( \P1.P2.P3.READY_n  == 1'b0 ) & ( \P1.P2.P3.HOLD  == 1'b0 ) ) & ( \P1.P2.P3.RequestPending  == \P1.P2.P3.Pending  ) ) 
                begin
                    \P1.P2.P3.State  <= \P1.P2.P3.StateT1 ;
                end
                else
                begin 
                    if ( ( \P1.P2.P3.READY_n  == 1'b1 ) & ( \P1.P2.P3.NA_n  == 1'b1 ) ) 
                    begin
                    end
                    else
                    begin 
                        if ( ( ( \P1.P2.P3.RequestPending  == \P1.P2.P3.Pending  ) | ( \P1.P2.P3.HOLD  == 1'b1 ) ) & ( ( \P1.P2.P3.READY_n  == 1'b1 ) & ( \P1.P2.P3.NA_n  == 1'b0 ) ) ) 
                        begin
                            \P1.P2.P3.State  <= \P1.P2.P3.StateT2I ;
                        end
                        else
                        begin 
                            if ( ( ( ( \P1.P2.P3.RequestPending  == \P1.P2.P3.Pending  ) & ( \P1.P2.P3.HOLD  == 1'b0 ) ) & ( \P1.P2.P3.READY_n  == 1'b1 ) ) & ( \P1.P2.P3.NA_n  == 1'b0 ) ) 
                            begin
                                \P1.P2.P3.State  <= \P1.P2.P3.StateT2P ;
                            end
                            else
                            begin 
                                if ( ( ( \P1.P2.P3.RequestPending  == \P1.P2.P3.NotPending  ) & ( \P1.P2.P3.HOLD  == 1'b0 ) ) & ( \P1.P2.P3.READY_n  == 1'b0 ) ) 
                                begin
                                    \P1.P2.P3.State  <= \P1.P2.P3.StateTi ;
                                end
                                else
                                begin 
                                    if ( ( \P1.P2.P3.HOLD  == 1'b1 ) & ( \P1.P2.P3.READY_n  == 1'b1 ) ) 
                                    begin
                                        \P1.P2.P3.State  <= \P1.P2.P3.StateTh ;
                                    end
                                    else
                                    begin 
                                        \P1.P2.P3.State  <= \P1.P2.P3.StateT2 ;
                                    end
                                end
                            end
                        end
                    end
                end
                \P1.P2.P3.StateBS16  <= \P1.P2.P3.BS16_n ;
                if ( \P1.P2.P3.BS16_n  == 1'b0 ) 
                begin
                    \P1.P2.P3.DataWidth  <= \P1.P2.P3.WidthWord ;
                end
                else
                begin 
                    \P1.P2.P3.DataWidth  <= \P1.P2.P3.WidthDword ;
                end
                \P1.P2.P3.StateNA  <= \P1.P2.P3.NA_n ;
                \P1.P2.P3.ADS_n  <= 1'b1;
            end
            \P1.P2.P3.StateT1P :
            begin
                if ( ( ( \P1.P2.P3.NA_n  == 1'b0 ) & ( \P1.P2.P3.HOLD  == 1'b0 ) ) & ( \P1.P2.P3.RequestPending  == \P1.P2.P3.Pending  ) ) 
                begin
                    \P1.P2.P3.State  <= \P1.P2.P3.StateT2P ;
                end
                else
                begin 
                    if ( ( \P1.P2.P3.NA_n  == 1'b0 ) & ( ( \P1.P2.P3.HOLD  == 1'b1 ) | ( \P1.P2.P3.RequestPending  == \P1.P2.P3.NotPending  ) ) ) 
                    begin
                        \P1.P2.P3.State  <= \P1.P2.P3.StateT2I ;
                    end
                    else
                    begin 
                        if ( \P1.P2.P3.NA_n  == 1'b1 ) 
                        begin
                            \P1.P2.P3.State  <= \P1.P2.P3.StateT2 ;
                        end
                        else
                        begin 
                            \P1.P2.P3.State  <= \P1.P2.P3.StateT1P ;
                        end
                    end
                end
                \P1.P2.P3.StateBS16  <= \P1.P2.P3.BS16_n ;
                if ( \P1.P2.P3.BS16_n  == 1'b0 ) 
                begin
                    \P1.P2.P3.DataWidth  <= \P1.P2.P3.WidthWord ;
                end
                else
                begin 
                    \P1.P2.P3.DataWidth  <= \P1.P2.P3.WidthDword ;
                end
                \P1.P2.P3.StateNA  <= \P1.P2.P3.NA_n ;
                \P1.P2.P3.ADS_n  <= 1'b1;
            end
            \P1.P2.P3.StateTh :
            begin
                if ( ( \P1.P2.P3.HOLD  == 1'b0 ) & ( \P1.P2.P3.RequestPending  == \P1.P2.P3.Pending  ) ) 
                begin
                    \P1.P2.P3.State  <= \P1.P2.P3.StateT1 ;
                end
                else
                begin 
                    if ( ( \P1.P2.P3.HOLD  == 1'b0 ) & ( \P1.P2.P3.RequestPending  == \P1.P2.P3.NotPending  ) ) 
                    begin
                        \P1.P2.P3.State  <= \P1.P2.P3.StateTi ;
                    end
                    else
                    begin 
                        \P1.P2.P3.State  <= \P1.P2.P3.StateTh ;
                    end
                end
            end
            \P1.P2.P3.StateT2P :
            begin
                \P1.P2.P3.Address  <= ( ( \P1.P2.P3.rEIP  / 2 ) % ( 2 ** 30 ) );
                \P1.P2.P3.BE_n  <= \P1.P2.P3.ByteEnable ;
                \P1.P2.P3.M_IO_n  <= \P1.P2.P3.MemoryFetch ;
                if ( \P1.P2.P3.ReadRequest  == \P1.P2.P3.Pending  ) 
                begin
                    \P1.P2.P3.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P2.P3.W_R_n  <= 1'b1;
                end
                if ( \P1.P2.P3.CodeFetch  == \P1.P2.P3.Pending  ) 
                begin
                    \P1.P2.P3.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P1.P2.P3.D_C_n  <= 1'b1;
                end
                \P1.P2.P3.ADS_n  <= 1'b0;
                if ( \P1.P2.P3.READY_n  == 1'b0 ) 
                begin
                    \P1.P2.P3.State  <= \P1.P2.P3.StateT1P ;
                end
                else
                begin 
                    \P1.P2.P3.State  <= \P1.P2.P3.StateT2P ;
                end
            end
            \P1.P2.P3.StateT2I :
            begin
                if ( ( ( \P1.P2.P3.READY_n  == 1'b1 ) & ( \P1.P2.P3.RequestPending  == \P1.P2.P3.Pending  ) ) & ( \P1.P2.P3.HOLD  == 1'b0 ) ) 
                begin
                    \P1.P2.P3.State  <= \P1.P2.P3.StateT2P ;
                end
                else
                begin 
                    if ( ( \P1.P2.P3.READY_n  == 1'b0 ) & ( \P1.P2.P3.HOLD  == 1'b1 ) ) 
                    begin
                        \P1.P2.P3.State  <= \P1.P2.P3.StateTh ;
                    end
                    else
                    begin 
                        if ( ( ( \P1.P2.P3.READY_n  == 1'b0 ) & ( \P1.P2.P3.HOLD  == 1'b0 ) ) & ( \P1.P2.P3.RequestPending  == \P1.P2.P3.Pending  ) ) 
                        begin
                            \P1.P2.P3.State  <= \P1.P2.P3.StateT1 ;
                        end
                        else
                        begin 
                            if ( ( ( \P1.P2.P3.READY_n  == 1'b0 ) & ( \P1.P2.P3.HOLD  == 1'b0 ) ) & ( \P1.P2.P3.RequestPending  == \P1.P2.P3.NotPending  ) ) 
                            begin
                                \P1.P2.P3.State  <= \P1.P2.P3.StateTi ;
                            end
                            else
                            begin 
                                \P1.P2.P3.State  <= \P1.P2.P3.StateT2I ;
                            end
                        end
                    end
                end
            end
            endcase
        end
    end
    always @ (  posedge \P1.P2.P3.CLOCK  or  posedge \P1.P2.P3.RESET )
    begin : \P1.P2.P3.P1 
        reg [7:0] \P1.P2.P3.InstQueue [15:0];
        reg [4:0] \P1.P2.P3.InstQueueRd_Addr ;
        reg [4:0] \P1.P2.P3.InstQueueWr_Addr ;
        parameter \P1.P2.P3.InstQueueLimit   = 15;
        integer \P1.P2.P3.InstAddrPointer ;
        integer \P1.P2.P3.PhyAddrPointer ;
        reg  \P1.P2.P3.Extended ;
        reg  \P1.P2.P3.More ;
        reg  \P1.P2.P3.Flush ;
        reg [15:0] \P1.P2.P3.lWord ;
        reg [14:0] \P1.P2.P3.uWord ;
        integer \P1.P2.P3.fWord ;
        reg [3:0] \P1.P2.P3.State2 ;
        parameter \P1.P2.P3.Si   = 0;
        parameter \P1.P2.P3.S1   = 1;
        parameter \P1.P2.P3.S2   = 2;
        parameter \P1.P2.P3.S3   = 3;
        parameter \P1.P2.P3.S4   = 4;
        parameter \P1.P2.P3.S5   = 5;
        parameter \P1.P2.P3.S6   = 6;
        parameter \P1.P2.P3.S7   = 7;
        parameter \P1.P2.P3.S8   = 8;
        parameter \P1.P2.P3.S9   = 9;
        if ( \P1.P2.P3.RESET  == 1'b1 ) 
        begin
            \P1.P2.P3.State2  = \P1.P2.P3.Si ;
            \P1.P2.P3.InstQueue  = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            \P1.P2.P3.InstQueueRd_Addr  = 0;
            \P1.P2.P3.InstQueueWr_Addr  = 0;
            \P1.P2.P3.InstAddrPointer  = 0;
            \P1.P2.P3.PhyAddrPointer  = 0;
            \P1.P2.P3.Extended  = 1'b0;
            \P1.P2.P3.More  = 1'b0;
            \P1.P2.P3.Flush  = 1'b0;
            \P1.P2.P3.lWord  = 0;
            \P1.P2.P3.uWord  = 0;
            \P1.P2.P3.fWord  = 0;
            \P1.P2.P3.CodeFetch  <= 1'b0;
            \P1.P2.P3.Datao  <= 0;
            \P1.P2.P3.EAX  <= 0;
            \P1.P2.P3.EBX  <= 0;
            \P1.P2.P3.rEIP  <= 0;
            \P1.P2.P3.ReadRequest  <= 1'b0;
            \P1.P2.P3.MemoryFetch  <= 1'b0;
            \P1.P2.P3.RequestPending  <= 1'b0;
        end
        else
        begin 
            case ( \P1.P2.P3.State2  ) 
            \P1.P2.P3.Si :
            begin
                \P1.P2.P3.PhyAddrPointer  = \P1.P2.P3.rEIP ;
                \P1.P2.P3.InstAddrPointer  = \P1.P2.P3.PhyAddrPointer ;
                \P1.P2.P3.State2  = \P1.P2.P3.S1 ;
                \P1.P2.P3.rEIP  <= 20'hFFFF0;
                \P1.P2.P3.ReadRequest  <= 1'b1;
                \P1.P2.P3.MemoryFetch  <= 1'b1;
                \P1.P2.P3.RequestPending  <= 1'b1;
            end
            \P1.P2.P3.S1 :
            begin
                \P1.P2.P3.RequestPending  <= \P1.P2.P3.Pending ;
                \P1.P2.P3.ReadRequest  <= \P1.P2.P3.Pending ;
                \P1.P2.P3.MemoryFetch  <= \P1.P2.P3.Pending ;
                \P1.P2.P3.CodeFetch  <= \P1.P2.P3.Pending ;
                if ( \P1.P2.P3.READY_n  == 1'b0 ) 
                begin
                    \P1.P2.P3.State2  = \P1.P2.P3.S2 ;
                end
                else
                begin 
                    \P1.P2.P3.State2  = \P1.P2.P3.S1 ;
                end
            end
            \P1.P2.P3.S2 :
            begin
                \P1.P2.P3.RequestPending  <= \P1.P2.P3.NotPending ;
                \P1.P2.P3.InstQueue [\P1.P2.P3.InstQueueWr_Addr ] = ( \P1.P2.P3.Datai  % ( 2 ** 8 ) );
                \P1.P2.P3.InstQueueWr_Addr  = ( ( \P1.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P2.P3.InstQueue [\P1.P2.P3.InstQueueWr_Addr ] = ( \P1.P2.P3.Datai  % ( 2 ** 8 ) );
                \P1.P2.P3.InstQueueWr_Addr  = ( ( \P1.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                if ( \P1.P2.P3.StateBS16  == 1'b1 ) 
                begin
                    \P1.P2.P3.InstQueue [\P1.P2.P3.InstQueueWr_Addr ] = ( ( \P1.P2.P3.Datai  / ( 2 ** 16 ) ) % ( 2 ** 8 ) );
                    \P1.P2.P3.InstQueueWr_Addr  = ( ( \P1.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P2.P3.InstQueue [\P1.P2.P3.InstQueueWr_Addr ] = ( ( \P1.P2.P3.Datai  / ( 2 ** 24 ) ) % ( 2 ** 8 ) );
                    \P1.P2.P3.InstQueueWr_Addr  = ( ( \P1.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P2.P3.PhyAddrPointer  = ( \P1.P2.P3.PhyAddrPointer  + 4 );
                    \P1.P2.P3.State2  = \P1.P2.P3.S5 ;
                end
                else
                begin
                    \P1.P2.P3.PhyAddrPointer  = ( \P1.P2.P3.PhyAddrPointer  + 2 );
                    if ( \P1.P2.P3.PhyAddrPointer  < 0 ) 
                    begin
                        \P1.P2.P3.rEIP  <=  -( \P1.P2.P3.PhyAddrPointer );
                    end
                    else
                    begin 
                        \P1.P2.P3.rEIP  <= \P1.P2.P3.PhyAddrPointer ;
                    end
                    \P1.P2.P3.State2  = \P1.P2.P3.S3 ;
                end
            end
            \P1.P2.P3.S3 :
            begin
                \P1.P2.P3.RequestPending  <= \P1.P2.P3.Pending ;
                if ( \P1.P2.P3.READY_n  == 1'b0 ) 
                begin
                    \P1.P2.P3.State2  = \P1.P2.P3.S4 ;
                end
                else
                begin 
                    \P1.P2.P3.State2  = \P1.P2.P3.S3 ;
                end
            end
            \P1.P2.P3.S4 :
            begin
                \P1.P2.P3.RequestPending  <= \P1.P2.P3.NotPending ;
                \P1.P2.P3.InstQueue [\P1.P2.P3.InstQueueWr_Addr ] = ( \P1.P2.P3.Datai  % ( 2 ** 8 ) );
                \P1.P2.P3.InstQueueWr_Addr  = ( ( \P1.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P2.P3.InstQueue [\P1.P2.P3.InstQueueWr_Addr ] = ( \P1.P2.P3.Datai  % ( 2 ** 8 ) );
                \P1.P2.P3.InstQueueWr_Addr  = ( ( \P1.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                \P1.P2.P3.PhyAddrPointer  = ( \P1.P2.P3.PhyAddrPointer  + 2 );
                \P1.P2.P3.State2  = \P1.P2.P3.S5 ;
            end
            \P1.P2.P3.S5 :
            begin
                case ( \P1.P2.P3.InstQueue [\P1.P2.P3.InstQueueRd_Addr ] ) 
                \P1.P2.P3.NOP :
                begin
                    \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 1 );
                    \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P3.Flush  = 1'b0;
                    \P1.P2.P3.More  = 1'b0;
                end
                \P1.P2.P3.OPsop :
                begin
                    \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 1 );
                    \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P3.Extended  = 1'b1;
                    \P1.P2.P3.Flush  = 1'b0;
                    \P1.P2.P3.More  = 1'b0;
                end
                \P1.P2.P3.JMP_rel_short :
                begin
                    if ( ( \P1.P2.P3.InstQueueWr_Addr  - \P1.P2.P3.InstQueueRd_Addr  ) >= 3 ) 
                    begin
                        if ( \P1.P2.P3.InstQueue [( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 )] > 127 ) 
                        begin
                            \P1.P2.P3.PhyAddrPointer  = ( ( \P1.P2.P3.InstAddrPointer  + 1 ) - ( 8'hFF - \P1.P2.P3.InstQueue [( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 )] ) );
                            \P1.P2.P3.InstAddrPointer  = \P1.P2.P3.PhyAddrPointer ;
                        end
                        else
                        begin
                            \P1.P2.P3.PhyAddrPointer  = ( ( \P1.P2.P3.InstAddrPointer  + 2 ) + \P1.P2.P3.InstQueue [( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 )] );
                            \P1.P2.P3.InstAddrPointer  = \P1.P2.P3.PhyAddrPointer ;
                        end
                        \P1.P2.P3.Flush  = 1'b1;
                        \P1.P2.P3.More  = 1'b0;
                    end
                    else
                    begin
                        \P1.P2.P3.Flush  = 1'b0;
                        \P1.P2.P3.More  = 1'b1;
                    end
                end
                \P1.P2.P3.JMP_rel_near :
                begin
                    if ( ( \P1.P2.P3.InstQueueWr_Addr  - \P1.P2.P3.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P2.P3.PhyAddrPointer  = ( ( \P1.P2.P3.InstAddrPointer  + 5 ) + \P1.P2.P3.InstQueue [( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P1.P2.P3.InstAddrPointer  = \P1.P2.P3.PhyAddrPointer ;
                        \P1.P2.P3.Flush  = 1'b1;
                        \P1.P2.P3.More  = 1'b0;
                    end
                    else
                    begin
                        \P1.P2.P3.Flush  = 1'b0;
                        \P1.P2.P3.More  = 1'b1;
                    end
                end
                \P1.P2.P3.JMP_intseg_immed :
                begin
                    \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 1 );
                    \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P3.Flush  = 1'b0;
                    \P1.P2.P3.More  = 1'b0;
                end
                \P1.P2.P3.MOV_al_b :
                begin
                    \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 1 );
                    \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P3.Flush  = 1'b0;
                    \P1.P2.P3.More  = 1'b0;
                end
                \P1.P2.P3.MOV_eax_dw :
                begin
                    if ( ( \P1.P2.P3.InstQueueWr_Addr  - \P1.P2.P3.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P2.P3.EAX  <= ( ( ( ( \P1.P2.P3.InstQueue [( ( \P1.P2.P3.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P1.P2.P3.InstQueue [( ( \P1.P2.P3.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P1.P2.P3.InstQueue [( ( \P1.P2.P3.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P1.P2.P3.InstQueue [( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P1.P2.P3.More  = 1'b0;
                        \P1.P2.P3.Flush  = 1'b0;
                        \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 5 );
                        \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P1.P2.P3.Flush  = 1'b0;
                        \P1.P2.P3.More  = 1'b1;
                    end
                end
                \P1.P2.P3.MOV_ebx_dw :
                begin
                    if ( ( \P1.P2.P3.InstQueueWr_Addr  - \P1.P2.P3.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P1.P2.P3.EBX  <= ( ( ( ( \P1.P2.P3.InstQueue [( ( \P1.P2.P3.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P1.P2.P3.InstQueue [( ( \P1.P2.P3.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P1.P2.P3.InstQueue [( ( \P1.P2.P3.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P1.P2.P3.InstQueue [( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 1 )] );
                        \P1.P2.P3.More  = 1'b0;
                        \P1.P2.P3.Flush  = 1'b0;
                        \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 5 );
                        \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P1.P2.P3.Flush  = 1'b0;
                        \P1.P2.P3.More  = 1'b1;
                    end
                end
                \P1.P2.P3.MOV_eax_ebx :
                begin
                    if ( ( \P1.P2.P3.InstQueueWr_Addr  - \P1.P2.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P1.P2.P3.EBX  < 0 ) 
                        begin
                            \P1.P2.P3.rEIP  <=  -( \P1.P2.P3.EBX );
                        end
                        else
                        begin 
                            \P1.P2.P3.rEIP  <= \P1.P2.P3.EBX ;
                        end
                        \P1.P2.P3.RequestPending  <= \P1.P2.P3.Pending ;
                        \P1.P2.P3.ReadRequest  <= \P1.P2.P3.Pending ;
                        \P1.P2.P3.MemoryFetch  <= \P1.P2.P3.Pending ;
                        \P1.P2.P3.CodeFetch  <= \P1.P2.P3.NotPending ;
                        if ( \P1.P2.P3.READY_n  == 1'b0 ) 
                        begin
                            \P1.P2.P3.RequestPending  <= \P1.P2.P3.NotPending ;
                            \P1.P2.P3.uWord  = ( \P1.P2.P3.Datai  % ( 2 ** 15 ) );
                            if ( \P1.P2.P3.StateBS16  == 1'b1 ) 
                            begin
                                \P1.P2.P3.lWord  = ( \P1.P2.P3.Datai  % ( 2 ** 16 ) );
                            end
                            else
                            begin
                                \P1.P2.P3.rEIP  <= ( \P1.P2.P3.rEIP  + 2 );
                                \P1.P2.P3.RequestPending  <= \P1.P2.P3.Pending ;
                                if ( \P1.P2.P3.READY_n  == 1'b0 ) 
                                begin
                                    \P1.P2.P3.RequestPending  <= \P1.P2.P3.NotPending ;
                                    \P1.P2.P3.lWord  = ( \P1.P2.P3.Datai  % ( 2 ** 16 ) );
                                end
                            end
                            if ( \P1.P2.P3.READY_n  == 1'b0 ) 
                            begin
                                \P1.P2.P3.EAX  <= ( ( \P1.P2.P3.uWord  * ( 2 ** 16 ) ) + \P1.P2.P3.lWord  );
                                \P1.P2.P3.More  = 1'b0;
                                \P1.P2.P3.Flush  = 1'b0;
                                \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 2 );
                                \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P1.P2.P3.Flush  = 1'b0;
                        \P1.P2.P3.More  = 1'b1;
                    end
                end
                \P1.P2.P3.MOV_ebx_eax :
                begin
                    if ( ( \P1.P2.P3.InstQueueWr_Addr  - \P1.P2.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P1.P2.P3.EBX  < 0 ) 
                        begin
                            \P1.P2.P3.rEIP  <= \P1.P2.P3.EBX ;
                        end
                        else
                        begin 
                            \P1.P2.P3.rEIP  <= \P1.P2.P3.EBX ;
                        end
                        \P1.P2.P3.lWord  = ( \P1.P2.P3.EAX  % ( 2 ** 16 ) );
                        \P1.P2.P3.uWord  = ( ( \P1.P2.P3.EAX  / ( 2 ** 16 ) ) % ( 2 ** 15 ) );
                        \P1.P2.P3.RequestPending  <= \P1.P2.P3.Pending ;
                        \P1.P2.P3.ReadRequest  <= \P1.P2.P3.NotPending ;
                        \P1.P2.P3.MemoryFetch  <= \P1.P2.P3.Pending ;
                        \P1.P2.P3.CodeFetch  <= \P1.P2.P3.NotPending ;
                        if ( ( \P1.P2.P3.State  == \P1.P2.P3.StateT1  ) | ( \P1.P2.P3.State  == \P1.P2.P3.StateT1P  ) ) 
                        begin
                            \P1.P2.P3.Datao  <= ( ( \P1.P2.P3.uWord  * ( 2 ** 16 ) ) + \P1.P2.P3.lWord  );
                            if ( \P1.P2.P3.READY_n  == 1'b0 ) 
                            begin
                                \P1.P2.P3.RequestPending  <= \P1.P2.P3.NotPending ;
                                if ( \P1.P2.P3.StateBS16  == 1'b0 ) 
                                begin
                                    \P1.P2.P3.rEIP  <= ( \P1.P2.P3.rEIP  + 2 );
                                    \P1.P2.P3.RequestPending  <= \P1.P2.P3.Pending ;
                                    \P1.P2.P3.ReadRequest  <= \P1.P2.P3.NotPending ;
                                    \P1.P2.P3.MemoryFetch  <= \P1.P2.P3.Pending ;
                                    \P1.P2.P3.CodeFetch  <= \P1.P2.P3.NotPending ;
                                    \P1.P2.P3.State2  = \P1.P2.P3.S6 ;
                                end
                                \P1.P2.P3.More  = 1'b0;
                                \P1.P2.P3.Flush  = 1'b0;
                                \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 2 );
                                \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P1.P2.P3.Flush  = 1'b0;
                        \P1.P2.P3.More  = 1'b1;
                    end
                end
                \P1.P2.P3.IN_al :
                begin
                    if ( ( \P1.P2.P3.InstQueueWr_Addr  - \P1.P2.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P1.P2.P3.rEIP  <= ( \P1.P2.P3.InstQueueRd_Addr  + 1 );
                        \P1.P2.P3.RequestPending  <= \P1.P2.P3.Pending ;
                        \P1.P2.P3.ReadRequest  <= \P1.P2.P3.Pending ;
                        \P1.P2.P3.MemoryFetch  <= \P1.P2.P3.NotPending ;
                        \P1.P2.P3.CodeFetch  <= \P1.P2.P3.NotPending ;
                        if ( \P1.P2.P3.READY_n  == 1'b0 ) 
                        begin
                            \P1.P2.P3.RequestPending  <= \P1.P2.P3.NotPending ;
                            \P1.P2.P3.EAX  <= \P1.P2.P3.Datai ;
                            \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 2 );
                            \P1.P2.P3.InstQueueRd_Addr  = ( \P1.P2.P3.InstQueueRd_Addr  + 2 );
                            \P1.P2.P3.Flush  = 1'b0;
                            \P1.P2.P3.More  = 1'b0;
                        end
                    end
                    else
                    begin
                        \P1.P2.P3.Flush  = 1'b0;
                        \P1.P2.P3.More  = 1'b1;
                    end
                end
                \P1.P2.P3.OUT_al :
                begin
                    if ( ( \P1.P2.P3.InstQueueWr_Addr  - \P1.P2.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P1.P2.P3.rEIP  <= ( \P1.P2.P3.InstQueueRd_Addr  + 1 );
                        \P1.P2.P3.RequestPending  <= \P1.P2.P3.Pending ;
                        \P1.P2.P3.ReadRequest  <= \P1.P2.P3.NotPending ;
                        \P1.P2.P3.MemoryFetch  <= \P1.P2.P3.NotPending ;
                        \P1.P2.P3.CodeFetch  <= \P1.P2.P3.NotPending ;
                        if ( ( \P1.P2.P3.State  == \P1.P2.P3.StateT1  ) | ( \P1.P2.P3.State  == \P1.P2.P3.StateT1P  ) ) 
                        begin
                            \P1.P2.P3.fWord  = ( \P1.P2.P3.EAX  % ( 2 ** 16 ) );
                            \P1.P2.P3.Datao  <= \P1.P2.P3.fWord ;
                            if ( \P1.P2.P3.READY_n  == 1'b0 ) 
                            begin
                                \P1.P2.P3.RequestPending  <= \P1.P2.P3.NotPending ;
                                \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 2 );
                                \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 2 ) % 16 );
                                \P1.P2.P3.Flush  = 1'b0;
                                \P1.P2.P3.More  = 1'b0;
                            end
                        end
                    end
                    else
                    begin
                        \P1.P2.P3.Flush  = 1'b0;
                        \P1.P2.P3.More  = 1'b1;
                    end
                end
                \P1.P2.P3.ADD_al_b :
                begin
                    \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 1 );
                    \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P3.Flush  = 1'b0;
                    \P1.P2.P3.More  = 1'b0;
                end
                \P1.P2.P3.ADD_ax_w :
                begin
                    \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 1 );
                    \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P3.Flush  = 1'b0;
                    \P1.P2.P3.More  = 1'b0;
                end
                \P1.P2.P3.ROL_al_1 :
                begin
                    \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 2 );
                    \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 2 ) % 16 );
                    \P1.P2.P3.Flush  = 1'b0;
                    \P1.P2.P3.More  = 1'b0;
                end
                \P1.P2.P3.ROL_al_n :
                begin
                    \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 2 );
                    \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 2 ) % 16 );
                    \P1.P2.P3.Flush  = 1'b0;
                    \P1.P2.P3.More  = 1'b0;
                end
                \P1.P2.P3.INC_eax :
                begin
                    \P1.P2.P3.EAX  <= ( \P1.P2.P3.EAX  + 1 );
                    \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 1 );
                    \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P3.Flush  = 1'b0;
                    \P1.P2.P3.More  = 1'b0;
                end
                \P1.P2.P3.INC_ebx :
                begin
                    \P1.P2.P3.EBX  <= ( \P1.P2.P3.EBX  + 1 );
                    \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 1 );
                    \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P3.Flush  = 1'b0;
                    \P1.P2.P3.More  = 1'b0;
                end
                default :
                begin
                    \P1.P2.P3.InstAddrPointer  = ( \P1.P2.P3.InstAddrPointer  + 1 );
                    \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P3.Flush  = 1'b0;
                    \P1.P2.P3.More  = 1'b0;
                end
                endcase
                if (  ~( ( \P1.P2.P3.InstQueueRd_Addr  < \P1.P2.P3.InstQueueWr_Addr  )) | ( ( ( ( \P1.P2.P3.InstQueueLimit  - \P1.P2.P3.InstQueueRd_Addr  ) < 4 ) | \P1.P2.P3.Flush  ) | \P1.P2.P3.More  ) ) 
                begin
                    \P1.P2.P3.State2  = \P1.P2.P3.S7 ;
                end
            end
            \P1.P2.P3.S6 :
            begin
                \P1.P2.P3.Datao  <= ( ( \P1.P2.P3.uWord  * ( 2 ** 16 ) ) + \P1.P2.P3.lWord  );
                if ( \P1.P2.P3.READY_n  == 1'b0 ) 
                begin
                    \P1.P2.P3.RequestPending  <= \P1.P2.P3.NotPending ;
                    \P1.P2.P3.State2  = \P1.P2.P3.S5 ;
                end
            end
            \P1.P2.P3.S7 :
            begin
                if ( \P1.P2.P3.Flush  ) 
                begin
                    \P1.P2.P3.InstQueueRd_Addr  = 1;
                    \P1.P2.P3.InstQueueWr_Addr  = 1;
                    if ( \P1.P2.P3.InstAddrPointer  < 0 ) 
                    begin
                        \P1.P2.P3.fWord  =  -( \P1.P2.P3.InstAddrPointer );
                    end
                    else
                    begin 
                        \P1.P2.P3.fWord  = \P1.P2.P3.InstAddrPointer ;
                    end
                    if ( ( \P1.P2.P3.fWord  % 2 ) == 1 ) 
                    begin
                        \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + ( \P1.P2.P3.fWord  % 4 ) ) % 16 );
                    end
                end
                if ( ( \P1.P2.P3.InstQueueLimit  - \P1.P2.P3.InstQueueRd_Addr  ) < 3 ) 
                begin
                    \P1.P2.P3.State2  = \P1.P2.P3.S8 ;
                    \P1.P2.P3.InstQueueWr_Addr  = 0;
                end
                else
                begin 
                    \P1.P2.P3.State2  = \P1.P2.P3.S9 ;
                end
            end
            \P1.P2.P3.S8 :
            begin
                if ( \P1.P2.P3.InstQueueRd_Addr  <= \P1.P2.P3.InstQueueLimit  ) 
                begin
                    \P1.P2.P3.InstQueue [\P1.P2.P3.InstQueueWr_Addr ] = \P1.P2.P3.InstQueue [\P1.P2.P3.InstQueueRd_Addr ];
                    \P1.P2.P3.InstQueueRd_Addr  = ( ( \P1.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P1.P2.P3.InstQueueWr_Addr  = ( ( \P1.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                    \P1.P2.P3.State2  = \P1.P2.P3.S8 ;
                end
                else
                begin
                    \P1.P2.P3.InstQueueRd_Addr  = 0;
                    \P1.P2.P3.State2  = \P1.P2.P3.S9 ;
                end
            end
            \P1.P2.P3.S9 :
            begin
                \P1.P2.P3.rEIP  <= \P1.P2.P3.PhyAddrPointer ;
                \P1.P2.P3.State2  = \P1.P2.P3.S1 ;
            end
            endcase
        end
    end
    always @ (  posedge \P1.P2.P3.CLOCK  or  posedge \P1.P2.P3.RESET )
    begin : \P1.P2.P3.P2 
        if ( \P1.P2.P3.RESET  == 1'b1 ) 
        begin
            \P1.P2.P3.ByteEnable  <= 4'b0000;
            \P1.P2.P3.NonAligned  <= 1'b0;
        end
        else
        begin 
            case ( \P1.P2.P3.DataWidth  ) 
            \P1.P2.P3.WidthByte :
            begin
                case ( \P1.P2.P3.rEIP  % 4 ) 
                0:
                begin
                    \P1.P2.P3.ByteEnable  <= 4'b1110;
                end
                1:
                begin
                    \P1.P2.P3.ByteEnable  <= 4'b1101;
                end
                2:
                begin
                    \P1.P2.P3.ByteEnable  <= 4'b1011;
                end
                3:
                begin
                    \P1.P2.P3.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            \P1.P2.P3.WidthWord :
            begin
                case ( \P1.P2.P3.rEIP  % 4 ) 
                0:
                begin
                    \P1.P2.P3.ByteEnable  <= 4'b1100;
                    \P1.P2.P3.NonAligned  <= \P1.P2.P3.NotPending ;
                end
                1:
                begin
                    \P1.P2.P3.ByteEnable  <= 4'b1001;
                    \P1.P2.P3.NonAligned  <= \P1.P2.P3.NotPending ;
                end
                2:
                begin
                    \P1.P2.P3.ByteEnable  <= 4'b0011;
                    \P1.P2.P3.NonAligned  <= \P1.P2.P3.NotPending ;
                end
                3:
                begin
                    \P1.P2.P3.ByteEnable  <= 4'b0111;
                    \P1.P2.P3.NonAligned  <= \P1.P2.P3.Pending ;
                end
                default :
                begin
                end
                endcase
            end
            \P1.P2.P3.WidthDword :
            begin
                case ( \P1.P2.P3.rEIP  % 4 ) 
                0:
                begin
                    \P1.P2.P3.ByteEnable  <= 4'b0000;
                    \P1.P2.P3.NonAligned  <= \P1.P2.P3.NotPending ;
                end
                1:
                begin
                    \P1.P2.P3.ByteEnable  <= 4'b0001;
                    \P1.P2.P3.NonAligned  <= \P1.P2.P3.Pending ;
                end
                2:
                begin
                    \P1.P2.P3.NonAligned  <= \P1.P2.P3.Pending ;
                    \P1.P2.P3.ByteEnable  <= 4'b0011;
                end
                3:
                begin
                    \P1.P2.P3.NonAligned  <= \P1.P2.P3.Pending ;
                    \P1.P2.P3.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            default :
            begin
            end
            endcase
        end
    end
    assign \P1.P3.clock  = \P1.clock ;
    assign \P1.P3.reset  = \P1.reset ;
    assign \P1.ad31  = \P1.P3.addr ;
    assign \P1.P3.datai  = \P1.di3 ;
    assign \P1.do3  = \P1.P3.datao ;
    assign \P1.rd3  = \P1.P3.rd ;
    assign \P1.wr3  = \P1.P3.wr ;
    always @ (  posedge \P1.P3.clock  or  posedge \P1.P3.reset )
    begin : \P1.P3.xhdl0 
        integer \P1.P3.reg0 ;
        integer \P1.P3.reg1 ;
        integer \P1.P3.reg2 ;
        integer \P1.P3.reg3 ;
        reg  \P1.P3.B ;
        reg [19:0] \P1.P3.MAR ;
        integer \P1.P3.MBR ;
        reg [1:0] \P1.P3.mf ;
        reg [2:0] \P1.P3.df ;
        reg [0:0] \P1.P3.cf ;
        reg [3:0] \P1.P3.ff ;
        reg [19:0] \P1.P3.tail ;
        integer \P1.P3.IR ;
        reg [0:0] \P1.P3.state ;
        integer \P1.P3.r ;
        integer \P1.P3.m ;
        integer \P1.P3.t ;
        integer \P1.P3.d ;
        integer \P1.P3.temp ;
        reg [1:0] \P1.P3.s ;
        parameter \P1.P3.FETCH   = 0;
        parameter \P1.P3.EXEC   = 1;
        if ( \P1.P3.reset  == 1'b1 ) 
        begin
            \P1.P3.MAR  = 0;
            \P1.P3.MBR  = 0;
            \P1.P3.IR  = 0;
            \P1.P3.d  = 0;
            \P1.P3.r  = 0;
            \P1.P3.m  = 0;
            \P1.P3.s  = 0;
            \P1.P3.temp  = 0;
            \P1.P3.mf  = 0;
            \P1.P3.df  = 0;
            \P1.P3.ff  = 0;
            \P1.P3.cf  = 0;
            \P1.P3.tail  = 0;
            \P1.P3.B  = 1'b0;
            \P1.P3.reg0  = 0;
            \P1.P3.reg1  = 0;
            \P1.P3.reg2  = 0;
            \P1.P3.reg3  = 0;
            \P1.P3.addr  <= 0;
            \P1.P3.rd  <= 1'b0;
            \P1.P3.wr  <= 1'b0;
            \P1.P3.datao  <= 0;
            \P1.P3.state  = \P1.P3.FETCH ;
        end
        else
        begin
            \P1.P3.rd  <= 1'b0;
            \P1.P3.wr  <= 1'b0;
            case ( \P1.P3.state  ) 
            \P1.P3.FETCH :
            begin
                \P1.P3.MAR  = ( \P1.P3.reg3  % ( 2 ** 20 ) );
                \P1.P3.addr  <= \P1.P3.MAR ;
                \P1.P3.rd  <= 1'b1;
                \P1.P3.MBR  = \P1.P3.datai ;
                \P1.P3.IR  = \P1.P3.MBR ;
                \P1.P3.state  = \P1.P3.EXEC ;
            end
            \P1.P3.EXEC :
            begin
                if ( \P1.P3.IR  < 0 ) 
                begin
                    \P1.P3.IR  =  -( \P1.P3.IR );
                end
                \P1.P3.mf  = ( ( \P1.P3.IR  / ( 2 ** 27 ) ) % 4 );
                \P1.P3.df  = ( ( \P1.P3.IR  / ( 2 ** 24 ) ) % ( 2 ** 3 ) );
                \P1.P3.ff  = ( ( \P1.P3.IR  / ( 2 ** 19 ) ) % ( 2 ** 4 ) );
                \P1.P3.cf  = ( ( \P1.P3.IR  / ( 2 ** 23 ) ) % 2 );
                \P1.P3.tail  = ( \P1.P3.IR  % ( 2 ** 20 ) );
                \P1.P3.reg3  = ( ( \P1.P3.reg3  % ( 2 ** 29 ) ) + 8 );
                \P1.P3.s  = ( ( \P1.P3.IR  / ( 2 ** 29 ) ) % 4 );
                case ( \P1.P3.s  ) 
                0:
                begin
                    \P1.P3.r  = \P1.P3.reg0 ;
                end
                1:
                begin
                    \P1.P3.r  = \P1.P3.reg1 ;
                end
                2:
                begin
                    \P1.P3.r  = \P1.P3.reg2 ;
                end
                3:
                begin
                    \P1.P3.r  = \P1.P3.reg3 ;
                end
                endcase
                case ( \P1.P3.cf  ) 
                1:
                begin
                    case ( \P1.P3.mf  ) 
                    0:
                    begin
                        \P1.P3.m  = \P1.P3.tail ;
                    end
                    1:
                    begin
                        \P1.P3.m  = \P1.P3.datai ;
                        \P1.P3.addr  <= \P1.P3.tail ;
                        \P1.P3.rd  <= 1'b1;
                    end
                    2:
                    begin
                        \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg1  ) % ( 2 ** 20 ) );
                        \P1.P3.rd  <= 1'b1;
                        \P1.P3.m  = \P1.P3.datai ;
                    end
                    3:
                    begin
                        \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg2  ) % ( 2 ** 20 ) );
                        \P1.P3.rd  <= 1'b1;
                        \P1.P3.m  = \P1.P3.datai ;
                    end
                    endcase
                    case ( \P1.P3.ff  ) 
                    0:
                    begin
                        if ( \P1.P3.r  < \P1.P3.m  ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    1:
                    begin
                        if (  ~( ( \P1.P3.r  < \P1.P3.m  )) ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    2:
                    begin
                        if ( \P1.P3.r  == \P1.P3.m  ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    3:
                    begin
                        if (  ~( ( \P1.P3.r  == \P1.P3.m  )) ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    4:
                    begin
                        if (  ~( ( \P1.P3.r  > \P1.P3.m  )) ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    5:
                    begin
                        if ( \P1.P3.r  > \P1.P3.m  ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    6:
                    begin
                        if ( \P1.P3.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P1.P3.r  = ( \P1.P3.r  - ( 2 ** 30 ) );
                        end
                        if ( \P1.P3.r  < \P1.P3.m  ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    7:
                    begin
                        if ( \P1.P3.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P1.P3.r  = ( \P1.P3.r  - ( 2 ** 30 ) );
                        end
                        if (  ~( ( \P1.P3.r  < \P1.P3.m  )) ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    8:
                    begin
                        if ( ( \P1.P3.r  < \P1.P3.m  ) | ( \P1.P3.B  == 1'b1 ) ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    9:
                    begin
                        if (  ~( ( \P1.P3.r  < \P1.P3.m  )) | ( \P1.P3.B  == 1'b1 ) ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    10:
                    begin
                        if ( ( \P1.P3.r  == \P1.P3.m  ) | ( \P1.P3.B  == 1'b1 ) ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    11:
                    begin
                        if (  ~( ( \P1.P3.r  == \P1.P3.m  )) | ( \P1.P3.B  == 1'b1 ) ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    12:
                    begin
                        if (  ~( ( \P1.P3.r  > \P1.P3.m  )) | ( \P1.P3.B  == 1'b1 ) ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    13:
                    begin
                        if ( ( \P1.P3.r  > \P1.P3.m  ) | ( \P1.P3.B  == 1'b1 ) ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    14:
                    begin
                        if ( \P1.P3.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P1.P3.r  = ( \P1.P3.r  - ( 2 ** 30 ) );
                        end
                        if ( ( \P1.P3.r  < \P1.P3.m  ) | ( \P1.P3.B  == 1'b1 ) ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    15:
                    begin
                        if ( \P1.P3.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P1.P3.r  = ( \P1.P3.r  - ( 2 ** 30 ) );
                        end
                        if (  ~( ( \P1.P3.r  < \P1.P3.m  )) | ( \P1.P3.B  == 1'b1 ) ) 
                        begin
                            \P1.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P3.B  = 1'b0;
                        end
                    end
                    endcase
                end
                0:
                begin
                    if (  ~( ( \P1.P3.df  == 7 )) ) 
                    begin
                        if ( \P1.P3.df  == 5 ) 
                        begin
                            if (  ~( \P1.P3.B ) == 1'b1 ) 
                            begin
                                \P1.P3.d  = 3;
                            end
                        end
                        else
                        begin 
                            if ( \P1.P3.df  == 4 ) 
                            begin
                                if ( \P1.P3.B  == 1'b1 ) 
                                begin
                                    \P1.P3.d  = 3;
                                end
                            end
                            else
                            begin 
                                if ( \P1.P3.df  == 3 ) 
                                begin
                                    \P1.P3.d  = 3;
                                end
                                else
                                begin 
                                    if ( \P1.P3.df  == 2 ) 
                                    begin
                                        \P1.P3.d  = 2;
                                    end
                                    else
                                    begin 
                                        if ( \P1.P3.df  == 1 ) 
                                        begin
                                            \P1.P3.d  = 1;
                                        end
                                        else
                                        begin 
                                            if ( \P1.P3.df  == 0 ) 
                                            begin
                                                \P1.P3.d  = 0;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        case ( \P1.P3.ff  ) 
                        0:
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            1:
                            begin
                                \P1.P3.m  = \P1.P3.datai ;
                                \P1.P3.addr  <= \P1.P3.tail ;
                                \P1.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg1  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            3:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg2  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            endcase
                            \P1.P3.t  = 0;
                            case ( \P1.P3.d  ) 
                            0:
                            begin
                                \P1.P3.reg0  = ( \P1.P3.t  - \P1.P3.m  );
                            end
                            1:
                            begin
                                \P1.P3.reg1  = ( \P1.P3.t  - \P1.P3.m  );
                            end
                            2:
                            begin
                                \P1.P3.reg2  = ( \P1.P3.t  - \P1.P3.m  );
                            end
                            3:
                            begin
                                \P1.P3.reg3  = ( \P1.P3.t  - \P1.P3.m  );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        1:
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            1:
                            begin
                                \P1.P3.m  = \P1.P3.datai ;
                                \P1.P3.addr  <= \P1.P3.tail ;
                                \P1.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg1  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            3:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg2  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            endcase
                            \P1.P3.reg2  = \P1.P3.reg3 ;
                            \P1.P3.reg3  = \P1.P3.m ;
                        end
                        2:
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            1:
                            begin
                                \P1.P3.m  = \P1.P3.datai ;
                                \P1.P3.addr  <= \P1.P3.tail ;
                                \P1.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg1  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            3:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg2  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            endcase
                            case ( \P1.P3.d  ) 
                            0:
                            begin
                                \P1.P3.reg0  = \P1.P3.m ;
                            end
                            1:
                            begin
                                \P1.P3.reg1  = \P1.P3.m ;
                            end
                            2:
                            begin
                                \P1.P3.reg2  = \P1.P3.m ;
                            end
                            3:
                            begin
                                \P1.P3.reg3  = \P1.P3.m ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        3:
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            1:
                            begin
                                \P1.P3.m  = \P1.P3.datai ;
                                \P1.P3.addr  <= \P1.P3.tail ;
                                \P1.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg1  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            3:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg2  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            endcase
                            case ( \P1.P3.d  ) 
                            0:
                            begin
                                \P1.P3.reg0  = \P1.P3.m ;
                            end
                            1:
                            begin
                                \P1.P3.reg1  = \P1.P3.m ;
                            end
                            2:
                            begin
                                \P1.P3.reg2  = \P1.P3.m ;
                            end
                            3:
                            begin
                                \P1.P3.reg3  = \P1.P3.m ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        4:
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            1:
                            begin
                                \P1.P3.m  = \P1.P3.datai ;
                                \P1.P3.addr  <= \P1.P3.tail ;
                                \P1.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg1  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            3:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg2  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            endcase
                            case ( \P1.P3.d  ) 
                            0:
                            begin
                                \P1.P3.reg0  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P3.reg1  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P3.reg2  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P3.reg3  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        5:
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            1:
                            begin
                                \P1.P3.m  = \P1.P3.datai ;
                                \P1.P3.addr  <= \P1.P3.tail ;
                                \P1.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg1  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            3:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg2  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            endcase
                            case ( \P1.P3.d  ) 
                            0:
                            begin
                                \P1.P3.reg0  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P3.reg1  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P3.reg2  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P3.reg3  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        6:
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            1:
                            begin
                                \P1.P3.m  = \P1.P3.datai ;
                                \P1.P3.addr  <= \P1.P3.tail ;
                                \P1.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg1  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            3:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg2  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            endcase
                            case ( \P1.P3.d  ) 
                            0:
                            begin
                                \P1.P3.reg0  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P3.reg1  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P3.reg2  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P3.reg3  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        7:
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            1:
                            begin
                                \P1.P3.m  = \P1.P3.datai ;
                                \P1.P3.addr  <= \P1.P3.tail ;
                                \P1.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg1  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            3:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg2  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            endcase
                            case ( \P1.P3.d  ) 
                            0:
                            begin
                                \P1.P3.reg0  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P3.reg1  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P3.reg2  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P3.reg3  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        8:
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            1:
                            begin
                                \P1.P3.m  = \P1.P3.datai ;
                                \P1.P3.addr  <= \P1.P3.tail ;
                                \P1.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg1  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            3:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg2  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            endcase
                            case ( \P1.P3.d  ) 
                            0:
                            begin
                                \P1.P3.reg0  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P3.reg1  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P3.reg2  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P3.reg3  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        9:
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            1:
                            begin
                                \P1.P3.m  = \P1.P3.datai ;
                                \P1.P3.addr  <= \P1.P3.tail ;
                                \P1.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg1  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            3:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg2  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            endcase
                            case ( \P1.P3.d  ) 
                            0:
                            begin
                                \P1.P3.reg0  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P3.reg1  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P3.reg2  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P3.reg3  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        10:
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            1:
                            begin
                                \P1.P3.m  = \P1.P3.datai ;
                                \P1.P3.addr  <= \P1.P3.tail ;
                                \P1.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg1  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            3:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg2  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            endcase
                            case ( \P1.P3.d  ) 
                            0:
                            begin
                                \P1.P3.reg0  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P3.reg1  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P3.reg2  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P3.reg3  = ( ( \P1.P3.r  + \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        11:
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            1:
                            begin
                                \P1.P3.m  = \P1.P3.datai ;
                                \P1.P3.addr  <= \P1.P3.tail ;
                                \P1.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg1  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            3:
                            begin
                                \P1.P3.addr  <= ( ( \P1.P3.tail  + \P1.P3.reg2  ) % ( 2 ** 20 ) );
                                \P1.P3.rd  <= 1'b1;
                                \P1.P3.m  = \P1.P3.datai ;
                            end
                            endcase
                            case ( \P1.P3.d  ) 
                            0:
                            begin
                                \P1.P3.reg0  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P3.reg1  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P3.reg2  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P3.reg3  = ( ( \P1.P3.r  - \P1.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        12:
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.t  = ( \P1.P3.r  / 2 );
                            end
                            1:
                            begin
                                \P1.P3.t  = ( \P1.P3.r  / 2 );
                                if ( \P1.P3.B  == 1'b1 ) 
                                begin
                                    \P1.P3.t  = ( \P1.P3.t  % ( 2 ** 29 ) );
                                end
                            end
                            2:
                            begin
                                \P1.P3.t  = ( ( \P1.P3.r  % ( 2 ** 29 ) ) * 2 );
                            end
                            3:
                            begin
                                \P1.P3.t  = ( ( \P1.P3.r  % ( 2 ** 29 ) ) * 2 );
                                if ( \P1.P3.t  > ( ( 2 ** 30 ) - 1 ) ) 
                                begin
                                    \P1.P3.B  = 1'b1;
                                end
                                else
                                begin 
                                    \P1.P3.B  = 1'b0;
                                end
                            end
                            default :
                            begin
                            end
                            endcase
                            case ( \P1.P3.d  ) 
                            0:
                            begin
                                \P1.P3.reg0  = \P1.P3.t ;
                            end
                            1:
                            begin
                                \P1.P3.reg1  = \P1.P3.t ;
                            end
                            2:
                            begin
                                \P1.P3.reg2  = \P1.P3.t ;
                            end
                            3:
                            begin
                                \P1.P3.reg3  = \P1.P3.t ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        13, 
                        14, 
                        15:
                        begin
                        end
                        endcase
                    end
                    else
                    begin 
                        if ( \P1.P3.df  == 7 ) 
                        begin
                            case ( \P1.P3.mf  ) 
                            0:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            1:
                            begin
                                \P1.P3.m  = \P1.P3.tail ;
                            end
                            2:
                            begin
                                \P1.P3.m  = ( ( \P1.P3.reg1  % ( 2 ** 20 ) ) + ( \P1.P3.tail  % ( 2 ** 20 ) ) );
                            end
                            3:
                            begin
                                \P1.P3.m  = ( ( \P1.P3.reg2  % ( 2 ** 20 ) ) + ( \P1.P3.tail  % ( 2 ** 20 ) ) );
                            end
                            endcase
                            \P1.P3.addr  <= ( ( \P1.P3.m  % 2 ) * 20 );
                            \P1.P3.wr  <= 1'b1;
                            \P1.P3.datao  <= \P1.P3.r ;
                        end
                    end
                end
                endcase
                \P1.P3.state  = \P1.P3.FETCH ;
            end
            endcase
        end
    end
    assign \P1.P4.clock  = \P1.clock ;
    assign \P1.P4.reset  = \P1.reset ;
    assign \P1.ad41  = \P1.P4.addr ;
    assign \P1.P4.datai  = \P1.di4 ;
    assign \P1.do4  = \P1.P4.datao ;
    assign \P1.rd4  = \P1.P4.rd ;
    assign \P1.wr4  = \P1.P4.wr ;
    always @ (  posedge \P1.P4.clock  or  posedge \P1.P4.reset )
    begin : \P1.P4.xhdl0 
        integer \P1.P4.reg0 ;
        integer \P1.P4.reg1 ;
        integer \P1.P4.reg2 ;
        integer \P1.P4.reg3 ;
        reg  \P1.P4.B ;
        reg [19:0] \P1.P4.MAR ;
        integer \P1.P4.MBR ;
        reg [1:0] \P1.P4.mf ;
        reg [2:0] \P1.P4.df ;
        reg [0:0] \P1.P4.cf ;
        reg [3:0] \P1.P4.ff ;
        reg [19:0] \P1.P4.tail ;
        integer \P1.P4.IR ;
        reg [0:0] \P1.P4.state ;
        integer \P1.P4.r ;
        integer \P1.P4.m ;
        integer \P1.P4.t ;
        integer \P1.P4.d ;
        integer \P1.P4.temp ;
        reg [1:0] \P1.P4.s ;
        parameter \P1.P4.FETCH   = 0;
        parameter \P1.P4.EXEC   = 1;
        if ( \P1.P4.reset  == 1'b1 ) 
        begin
            \P1.P4.MAR  = 0;
            \P1.P4.MBR  = 0;
            \P1.P4.IR  = 0;
            \P1.P4.d  = 0;
            \P1.P4.r  = 0;
            \P1.P4.m  = 0;
            \P1.P4.s  = 0;
            \P1.P4.temp  = 0;
            \P1.P4.mf  = 0;
            \P1.P4.df  = 0;
            \P1.P4.ff  = 0;
            \P1.P4.cf  = 0;
            \P1.P4.tail  = 0;
            \P1.P4.B  = 1'b0;
            \P1.P4.reg0  = 0;
            \P1.P4.reg1  = 0;
            \P1.P4.reg2  = 0;
            \P1.P4.reg3  = 0;
            \P1.P4.addr  <= 0;
            \P1.P4.rd  <= 1'b0;
            \P1.P4.wr  <= 1'b0;
            \P1.P4.datao  <= 0;
            \P1.P4.state  = \P1.P4.FETCH ;
        end
        else
        begin
            \P1.P4.rd  <= 1'b0;
            \P1.P4.wr  <= 1'b0;
            case ( \P1.P4.state  ) 
            \P1.P4.FETCH :
            begin
                \P1.P4.MAR  = ( \P1.P4.reg3  % ( 2 ** 20 ) );
                \P1.P4.addr  <= \P1.P4.MAR ;
                \P1.P4.rd  <= 1'b1;
                \P1.P4.MBR  = \P1.P4.datai ;
                \P1.P4.IR  = \P1.P4.MBR ;
                \P1.P4.state  = \P1.P4.EXEC ;
            end
            \P1.P4.EXEC :
            begin
                if ( \P1.P4.IR  < 0 ) 
                begin
                    \P1.P4.IR  =  -( \P1.P4.IR );
                end
                \P1.P4.mf  = ( ( \P1.P4.IR  / ( 2 ** 27 ) ) % 4 );
                \P1.P4.df  = ( ( \P1.P4.IR  / ( 2 ** 24 ) ) % ( 2 ** 3 ) );
                \P1.P4.ff  = ( ( \P1.P4.IR  / ( 2 ** 19 ) ) % ( 2 ** 4 ) );
                \P1.P4.cf  = ( ( \P1.P4.IR  / ( 2 ** 23 ) ) % 2 );
                \P1.P4.tail  = ( \P1.P4.IR  % ( 2 ** 20 ) );
                \P1.P4.reg3  = ( ( \P1.P4.reg3  % ( 2 ** 29 ) ) + 8 );
                \P1.P4.s  = ( ( \P1.P4.IR  / ( 2 ** 29 ) ) % 4 );
                case ( \P1.P4.s  ) 
                0:
                begin
                    \P1.P4.r  = \P1.P4.reg0 ;
                end
                1:
                begin
                    \P1.P4.r  = \P1.P4.reg1 ;
                end
                2:
                begin
                    \P1.P4.r  = \P1.P4.reg2 ;
                end
                3:
                begin
                    \P1.P4.r  = \P1.P4.reg3 ;
                end
                endcase
                case ( \P1.P4.cf  ) 
                1:
                begin
                    case ( \P1.P4.mf  ) 
                    0:
                    begin
                        \P1.P4.m  = \P1.P4.tail ;
                    end
                    1:
                    begin
                        \P1.P4.m  = \P1.P4.datai ;
                        \P1.P4.addr  <= \P1.P4.tail ;
                        \P1.P4.rd  <= 1'b1;
                    end
                    2:
                    begin
                        \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg1  ) % ( 2 ** 20 ) );
                        \P1.P4.rd  <= 1'b1;
                        \P1.P4.m  = \P1.P4.datai ;
                    end
                    3:
                    begin
                        \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg2  ) % ( 2 ** 20 ) );
                        \P1.P4.rd  <= 1'b1;
                        \P1.P4.m  = \P1.P4.datai ;
                    end
                    endcase
                    case ( \P1.P4.ff  ) 
                    0:
                    begin
                        if ( \P1.P4.r  < \P1.P4.m  ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    1:
                    begin
                        if (  ~( ( \P1.P4.r  < \P1.P4.m  )) ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    2:
                    begin
                        if ( \P1.P4.r  == \P1.P4.m  ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    3:
                    begin
                        if (  ~( ( \P1.P4.r  == \P1.P4.m  )) ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    4:
                    begin
                        if (  ~( ( \P1.P4.r  > \P1.P4.m  )) ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    5:
                    begin
                        if ( \P1.P4.r  > \P1.P4.m  ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    6:
                    begin
                        if ( \P1.P4.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P1.P4.r  = ( \P1.P4.r  - ( 2 ** 30 ) );
                        end
                        if ( \P1.P4.r  < \P1.P4.m  ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    7:
                    begin
                        if ( \P1.P4.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P1.P4.r  = ( \P1.P4.r  - ( 2 ** 30 ) );
                        end
                        if (  ~( ( \P1.P4.r  < \P1.P4.m  )) ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    8:
                    begin
                        if ( ( \P1.P4.r  < \P1.P4.m  ) | ( \P1.P4.B  == 1'b1 ) ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    9:
                    begin
                        if (  ~( ( \P1.P4.r  < \P1.P4.m  )) | ( \P1.P4.B  == 1'b1 ) ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    10:
                    begin
                        if ( ( \P1.P4.r  == \P1.P4.m  ) | ( \P1.P4.B  == 1'b1 ) ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    11:
                    begin
                        if (  ~( ( \P1.P4.r  == \P1.P4.m  )) | ( \P1.P4.B  == 1'b1 ) ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    12:
                    begin
                        if (  ~( ( \P1.P4.r  > \P1.P4.m  )) | ( \P1.P4.B  == 1'b1 ) ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    13:
                    begin
                        if ( ( \P1.P4.r  > \P1.P4.m  ) | ( \P1.P4.B  == 1'b1 ) ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    14:
                    begin
                        if ( \P1.P4.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P1.P4.r  = ( \P1.P4.r  - ( 2 ** 30 ) );
                        end
                        if ( ( \P1.P4.r  < \P1.P4.m  ) | ( \P1.P4.B  == 1'b1 ) ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    15:
                    begin
                        if ( \P1.P4.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P1.P4.r  = ( \P1.P4.r  - ( 2 ** 30 ) );
                        end
                        if (  ~( ( \P1.P4.r  < \P1.P4.m  )) | ( \P1.P4.B  == 1'b1 ) ) 
                        begin
                            \P1.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.P4.B  = 1'b0;
                        end
                    end
                    endcase
                end
                0:
                begin
                    if (  ~( ( \P1.P4.df  == 7 )) ) 
                    begin
                        if ( \P1.P4.df  == 5 ) 
                        begin
                            if (  ~( \P1.P4.B ) == 1'b1 ) 
                            begin
                                \P1.P4.d  = 3;
                            end
                        end
                        else
                        begin 
                            if ( \P1.P4.df  == 4 ) 
                            begin
                                if ( \P1.P4.B  == 1'b1 ) 
                                begin
                                    \P1.P4.d  = 3;
                                end
                            end
                            else
                            begin 
                                if ( \P1.P4.df  == 3 ) 
                                begin
                                    \P1.P4.d  = 3;
                                end
                                else
                                begin 
                                    if ( \P1.P4.df  == 2 ) 
                                    begin
                                        \P1.P4.d  = 2;
                                    end
                                    else
                                    begin 
                                        if ( \P1.P4.df  == 1 ) 
                                        begin
                                            \P1.P4.d  = 1;
                                        end
                                        else
                                        begin 
                                            if ( \P1.P4.df  == 0 ) 
                                            begin
                                                \P1.P4.d  = 0;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        case ( \P1.P4.ff  ) 
                        0:
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            1:
                            begin
                                \P1.P4.m  = \P1.P4.datai ;
                                \P1.P4.addr  <= \P1.P4.tail ;
                                \P1.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg1  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            3:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg2  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            endcase
                            \P1.P4.t  = 0;
                            case ( \P1.P4.d  ) 
                            0:
                            begin
                                \P1.P4.reg0  = ( \P1.P4.t  - \P1.P4.m  );
                            end
                            1:
                            begin
                                \P1.P4.reg1  = ( \P1.P4.t  - \P1.P4.m  );
                            end
                            2:
                            begin
                                \P1.P4.reg2  = ( \P1.P4.t  - \P1.P4.m  );
                            end
                            3:
                            begin
                                \P1.P4.reg3  = ( \P1.P4.t  - \P1.P4.m  );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        1:
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            1:
                            begin
                                \P1.P4.m  = \P1.P4.datai ;
                                \P1.P4.addr  <= \P1.P4.tail ;
                                \P1.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg1  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            3:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg2  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            endcase
                            \P1.P4.reg2  = \P1.P4.reg3 ;
                            \P1.P4.reg3  = \P1.P4.m ;
                        end
                        2:
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            1:
                            begin
                                \P1.P4.m  = \P1.P4.datai ;
                                \P1.P4.addr  <= \P1.P4.tail ;
                                \P1.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg1  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            3:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg2  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            endcase
                            case ( \P1.P4.d  ) 
                            0:
                            begin
                                \P1.P4.reg0  = \P1.P4.m ;
                            end
                            1:
                            begin
                                \P1.P4.reg1  = \P1.P4.m ;
                            end
                            2:
                            begin
                                \P1.P4.reg2  = \P1.P4.m ;
                            end
                            3:
                            begin
                                \P1.P4.reg3  = \P1.P4.m ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        3:
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            1:
                            begin
                                \P1.P4.m  = \P1.P4.datai ;
                                \P1.P4.addr  <= \P1.P4.tail ;
                                \P1.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg1  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            3:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg2  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            endcase
                            case ( \P1.P4.d  ) 
                            0:
                            begin
                                \P1.P4.reg0  = \P1.P4.m ;
                            end
                            1:
                            begin
                                \P1.P4.reg1  = \P1.P4.m ;
                            end
                            2:
                            begin
                                \P1.P4.reg2  = \P1.P4.m ;
                            end
                            3:
                            begin
                                \P1.P4.reg3  = \P1.P4.m ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        4:
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            1:
                            begin
                                \P1.P4.m  = \P1.P4.datai ;
                                \P1.P4.addr  <= \P1.P4.tail ;
                                \P1.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg1  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            3:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg2  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            endcase
                            case ( \P1.P4.d  ) 
                            0:
                            begin
                                \P1.P4.reg0  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P4.reg1  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P4.reg2  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P4.reg3  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        5:
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            1:
                            begin
                                \P1.P4.m  = \P1.P4.datai ;
                                \P1.P4.addr  <= \P1.P4.tail ;
                                \P1.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg1  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            3:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg2  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            endcase
                            case ( \P1.P4.d  ) 
                            0:
                            begin
                                \P1.P4.reg0  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P4.reg1  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P4.reg2  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P4.reg3  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        6:
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            1:
                            begin
                                \P1.P4.m  = \P1.P4.datai ;
                                \P1.P4.addr  <= \P1.P4.tail ;
                                \P1.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg1  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            3:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg2  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            endcase
                            case ( \P1.P4.d  ) 
                            0:
                            begin
                                \P1.P4.reg0  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P4.reg1  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P4.reg2  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P4.reg3  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        7:
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            1:
                            begin
                                \P1.P4.m  = \P1.P4.datai ;
                                \P1.P4.addr  <= \P1.P4.tail ;
                                \P1.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg1  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            3:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg2  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            endcase
                            case ( \P1.P4.d  ) 
                            0:
                            begin
                                \P1.P4.reg0  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P4.reg1  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P4.reg2  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P4.reg3  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        8:
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            1:
                            begin
                                \P1.P4.m  = \P1.P4.datai ;
                                \P1.P4.addr  <= \P1.P4.tail ;
                                \P1.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg1  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            3:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg2  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            endcase
                            case ( \P1.P4.d  ) 
                            0:
                            begin
                                \P1.P4.reg0  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P4.reg1  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P4.reg2  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P4.reg3  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        9:
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            1:
                            begin
                                \P1.P4.m  = \P1.P4.datai ;
                                \P1.P4.addr  <= \P1.P4.tail ;
                                \P1.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg1  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            3:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg2  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            endcase
                            case ( \P1.P4.d  ) 
                            0:
                            begin
                                \P1.P4.reg0  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P4.reg1  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P4.reg2  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P4.reg3  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        10:
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            1:
                            begin
                                \P1.P4.m  = \P1.P4.datai ;
                                \P1.P4.addr  <= \P1.P4.tail ;
                                \P1.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg1  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            3:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg2  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            endcase
                            case ( \P1.P4.d  ) 
                            0:
                            begin
                                \P1.P4.reg0  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P4.reg1  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P4.reg2  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P4.reg3  = ( ( \P1.P4.r  + \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        11:
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            1:
                            begin
                                \P1.P4.m  = \P1.P4.datai ;
                                \P1.P4.addr  <= \P1.P4.tail ;
                                \P1.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg1  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            3:
                            begin
                                \P1.P4.addr  <= ( ( \P1.P4.tail  + \P1.P4.reg2  ) % ( 2 ** 20 ) );
                                \P1.P4.rd  <= 1'b1;
                                \P1.P4.m  = \P1.P4.datai ;
                            end
                            endcase
                            case ( \P1.P4.d  ) 
                            0:
                            begin
                                \P1.P4.reg0  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.P4.reg1  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.P4.reg2  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.P4.reg3  = ( ( \P1.P4.r  - \P1.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        12:
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.t  = ( \P1.P4.r  / 2 );
                            end
                            1:
                            begin
                                \P1.P4.t  = ( \P1.P4.r  / 2 );
                                if ( \P1.P4.B  == 1'b1 ) 
                                begin
                                    \P1.P4.t  = ( \P1.P4.t  % ( 2 ** 29 ) );
                                end
                            end
                            2:
                            begin
                                \P1.P4.t  = ( ( \P1.P4.r  % ( 2 ** 29 ) ) * 2 );
                            end
                            3:
                            begin
                                \P1.P4.t  = ( ( \P1.P4.r  % ( 2 ** 29 ) ) * 2 );
                                if ( \P1.P4.t  > ( ( 2 ** 30 ) - 1 ) ) 
                                begin
                                    \P1.P4.B  = 1'b1;
                                end
                                else
                                begin 
                                    \P1.P4.B  = 1'b0;
                                end
                            end
                            default :
                            begin
                            end
                            endcase
                            case ( \P1.P4.d  ) 
                            0:
                            begin
                                \P1.P4.reg0  = \P1.P4.t ;
                            end
                            1:
                            begin
                                \P1.P4.reg1  = \P1.P4.t ;
                            end
                            2:
                            begin
                                \P1.P4.reg2  = \P1.P4.t ;
                            end
                            3:
                            begin
                                \P1.P4.reg3  = \P1.P4.t ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        13, 
                        14, 
                        15:
                        begin
                        end
                        endcase
                    end
                    else
                    begin 
                        if ( \P1.P4.df  == 7 ) 
                        begin
                            case ( \P1.P4.mf  ) 
                            0:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            1:
                            begin
                                \P1.P4.m  = \P1.P4.tail ;
                            end
                            2:
                            begin
                                \P1.P4.m  = ( ( \P1.P4.reg1  % ( 2 ** 20 ) ) + ( \P1.P4.tail  % ( 2 ** 20 ) ) );
                            end
                            3:
                            begin
                                \P1.P4.m  = ( ( \P1.P4.reg2  % ( 2 ** 20 ) ) + ( \P1.P4.tail  % ( 2 ** 20 ) ) );
                            end
                            endcase
                            \P1.P4.addr  <= ( ( \P1.P4.m  % 2 ) * 20 );
                            \P1.P4.wr  <= 1'b1;
                            \P1.P4.datao  <= \P1.P4.r ;
                        end
                    end
                end
                endcase
                \P1.P4.state  = \P1.P4.FETCH ;
            end
            endcase
        end
    end
    always @ (  \P1.do1  or  \P1.rd3  or  \P1.wr1  or  \P1.mio1  or  \P1.dc1  or  \P1.as12  or  \P1.do2  or  \P1.rd4  or  \P1.wr2  or  \P1.mio2  or  \P1.dc2  or  \P1.as22  or  \P1.as21  or  \P1.as11  or  \P1.wr3  or  \P1.ad31  or  \P1.tad2  or  \P1.wr4  or  \P1.ad41  or  \P1.tad1  or  \P1.do3  or  \P1.do4  or  \P1.ad11  or  \P1.ad12  or  \P1.ad21  or  \P1.ad22  or  \P1.tad3  or  \P1.tad4  or  \P1.sel  or  \P1.din  or  \P1.td1  or  \P1.td2 )
    begin
        \P1.di3  <= ( \P1.do1  % ( 2 ** 20 ) );
        \P1.r12  <=  ~( ( ( ( ( \P1.rd3  & \P1.wr1  ) & \P1.mio1  ) & \P1.dc1  ) &  ~( \P1.as12 ) ));
        \P1.di4  <= \P1.do2 ;
        \P1.r22  <=  ~( ( ( ( ( \P1.rd4  & \P1.wr2  ) & \P1.mio2  ) & \P1.dc2  ) &  ~( \P1.as22 ) ));
        \P1.r11  <= \P1.as21 ;
        \P1.r21  <= \P1.as11 ;
        if ( \P1.wr3  == 1'b1 ) 
        begin
            \P1.tad3  <= \P1.ad31 ;
        end
        else
        begin 
            \P1.tad3  <= ( \P1.tad2  % ( 2 ** 20 ) );
        end
        if ( \P1.wr4  == 1'b1 ) 
        begin
            \P1.tad4  <= \P1.ad41 ;
        end
        else
        begin 
            \P1.tad4  <= ( \P1.tad1  % ( 2 ** 20 ) );
        end
        if ( \P1.do3  > ( 2 ** 28 ) ) 
        begin
            \P1.tad1  <= \P1.ad11 ;
        end
        else
        begin 
            \P1.tad1  <= \P1.ad12 ;
        end
        if ( \P1.do4  > ( 2 ** 29 ) ) 
        begin
            \P1.tad2  <= \P1.ad21 ;
        end
        else
        begin 
            \P1.tad2  <= \P1.ad22 ;
        end
        \P1.dout  <= ( ( \P1.tad3  * \P1.tad4  ) % ( 2 ** 19 ) );
        if ( \P1.sel  == 1'b0 ) 
        begin
            \P1.td1  <= 0;
            \P1.td2  <= \P1.din ;
        end
        else
        begin
            \P1.td1  <= \P1.din ;
            \P1.td2  <= 0;
        end
        \P1.di1  <= ( \P1.do4  * \P1.td1  );
        \P1.di2  <= ( \P1.do3  * \P1.td2  );
        \P1.aux  <= ( ( \P1.tad1  * \P1.tad2  ) % ( 2 ** 3 ) );
    end
    assign \P2.clock  = clock;
    assign \P2.reset  = reset;
    assign \P2.hold  = hold;
    assign \P2.na  = na;
    assign \P2.bs  = bs;
    assign \P2.sel  = sel2;
    assign do2 = \P2.dout ;
    assign \P2.din  = di2;
    assign ax2 = \P2.aux ;
    assign \P2.P1.clock  = \P2.clock ;
    assign \P2.P1.reset  = \P2.reset ;
    assign \P2.P1.datai  = \P2.di1 ;
    assign \P2.do1  = \P2.P1.datao ;
    assign \P2.P1.hold  = \P2.hold ;
    assign \P2.P1.na  = \P2.na ;
    assign \P2.P1.bs16  = \P2.bs ;
    assign \P2.ad11  = \P2.P1.address1 ;
    assign \P2.ad12  = \P2.P1.address2 ;
    assign \P2.wr1  = \P2.P1.wr ;
    assign \P2.dc1  = \P2.P1.dc ;
    assign \P2.mio1  = \P2.P1.mio ;
    assign \P2.as11  = \P2.P1.ast1 ;
    assign \P2.as12  = \P2.P1.ast2 ;
    assign \P2.P1.ready1  = \P2.r11 ;
    assign \P2.P1.ready2  = \P2.r12 ;
    always @ (  posedge \P2.P1.clock  or  posedge \P2.P1.reset )
    begin
        if ( \P2.P1.reset  == 1'b1 ) 
        begin
            \P2.P1.buf1  <= 0;
            \P2.P1.ready11  <= 1'b0;
            \P2.P1.ready12  <= 1'b0;
        end
        else
        begin
            if ( ( ( ( ( ( \P2.P1.addr1  > ( 2 ** 29 ) ) & ( \P2.P1.ads1  == 1'b0 ) ) & ( \P2.P1.mio1  == 1'b1 ) ) & ( \P2.P1.dc1  == 1'b0 ) ) & ( \P2.P1.wr1  == 1'b1 ) ) & ( \P2.P1.be1  == 4'b0000 ) ) 
            begin
                \P2.P1.buf1  <= \P2.P1.do1 ;
                \P2.P1.ready11  <= 1'b0;
                \P2.P1.ready12  <= 1'b1;
            end
            else
            begin 
                if ( ( ( ( ( ( \P2.P1.addr2  > ( 2 ** 29 ) ) & ( \P2.P1.ads2  == 1'b0 ) ) & ( \P2.P1.mio2  == 1'b1 ) ) & ( \P2.P1.dc2  == 1'b0 ) ) & ( \P2.P1.wr2  == 1'b1 ) ) & ( \P2.P1.be2  == 4'b0000 ) ) 
                begin
                    \P2.P1.buf1  <= \P2.P1.do2 ;
                    \P2.P1.ready11  <= 1'b1;
                    \P2.P1.ready12  <= 1'b0;
                end
                else
                begin
                    \P2.P1.ready11  <= 1'b1;
                    \P2.P1.ready12  <= 1'b1;
                end
            end
        end
    end
    always @ (  posedge \P2.P1.clock  or  posedge \P2.P1.reset )
    begin
        if ( \P2.P1.reset  == 1'b1 ) 
        begin
            \P2.P1.buf2  <= 0;
            \P2.P1.ready21  <= 1'b0;
            \P2.P1.ready22  <= 1'b0;
        end
        else
        begin
            if ( ( ( ( ( ( \P2.P1.addr2  < ( 2 ** 29 ) ) & ( \P2.P1.ads2  == 1'b0 ) ) & ( \P2.P1.mio2  == 1'b1 ) ) & ( \P2.P1.dc2  == 1'b0 ) ) & ( \P2.P1.wr2  == 1'b1 ) ) & ( \P2.P1.be2  == 4'b0000 ) ) 
            begin
                \P2.P1.buf2  <= \P2.P1.do2 ;
                \P2.P1.ready21  <= 1'b0;
                \P2.P1.ready22  <= 1'b1;
            end
            else
            begin 
                if ( ( ( ( ( \P2.P1.ads3  == 1'b0 ) & ( \P2.P1.mio3  == 1'b1 ) ) & ( \P2.P1.dc3  == 1'b0 ) ) & ( \P2.P1.wr3  == 1'b0 ) ) & ( \P2.P1.be3  == 4'b0000 ) ) 
                begin
                    \P2.P1.ready21  <= 1'b1;
                    \P2.P1.ready22  <= 1'b0;
                end
                else
                begin
                    \P2.P1.ready21  <= 1'b1;
                    \P2.P1.ready22  <= 1'b1;
                end
            end
        end
    end
    always @ (  \P2.P1.addr1  or  \P2.P1.buf1  or  \P2.P1.datai )
    begin
        if ( \P2.P1.addr1  > ( 2 ** 29 ) ) 
        begin
            \P2.P1.di1  <= \P2.P1.buf1 ;
        end
        else
        begin 
            \P2.P1.di1  <= \P2.P1.datai ;
        end
    end
    always @ (  \P2.P1.addr2  or  \P2.P1.buf1  or  \P2.P1.buf2 )
    begin
        if ( \P2.P1.addr2  > ( 2 ** 29 ) ) 
        begin
            \P2.P1.di2  <= \P2.P1.buf1 ;
        end
        else
        begin 
            \P2.P1.di2  <= \P2.P1.buf2 ;
        end
    end
    always @ (  \P2.P1.addr2  or  \P2.P1.addr3  or  \P2.P1.do1  or  \P2.P1.do2  or  \P2.P1.do3 )
    begin
        if ( ( ( \P2.P1.do1  < ( 2 ** 30 ) ) & ( \P2.P1.do2  < ( 2 ** 30 ) ) ) & ( \P2.P1.do3  < ( 2 ** 30 ) ) ) 
        begin
            \P2.P1.address2  <= \P2.P1.addr3 ;
        end
        else
        begin 
            \P2.P1.address2  <= \P2.P1.addr2 ;
        end
    end
    always @ (  \P2.P1.buf2  or  \P2.P1.do3  or  \P2.P1.addr1  or  \P2.P1.wr3  or  \P2.P1.dc3  or  \P2.P1.mio3  or  \P2.P1.ads1  or  \P2.P1.ads3  or  \P2.P1.ready1  or  \P2.P1.ready2  or  \P2.P1.ready11  or  \P2.P1.ready12  or  \P2.P1.ready21  or  \P2.P1.ready22 )
    begin
        \P2.P1.di3  <= \P2.P1.buf2 ;
        \P2.P1.datao  <= \P2.P1.do3 ;
        \P2.P1.address1  <= \P2.P1.addr1 ;
        \P2.P1.wr  <= \P2.P1.wr3 ;
        \P2.P1.dc  <= \P2.P1.dc3 ;
        \P2.P1.mio  <= \P2.P1.mio3 ;
        \P2.P1.ast1  <= \P2.P1.ads1 ;
        \P2.P1.ast2  <= \P2.P1.ads3 ;
        \P2.P1.rdy1  <= ( \P2.P1.ready11  & \P2.P1.ready1  );
        \P2.P1.rdy2  <= ( \P2.P1.ready12  & \P2.P1.ready21  );
        \P2.P1.rdy3  <= ( \P2.P1.ready22  & \P2.P1.ready2  );
    end
    assign \P2.P1.be1  = \P2.P1.P1.BE_n ;
    assign \P2.P1.addr1  = \P2.P1.P1.Address ;
    assign \P2.P1.wr1  = \P2.P1.P1.W_R_n ;
    assign \P2.P1.dc1  = \P2.P1.P1.D_C_n ;
    assign \P2.P1.mio1  = \P2.P1.P1.M_IO_n ;
    assign \P2.P1.ads1  = \P2.P1.P1.ADS_n ;
    assign \P2.P1.P1.Datai  = \P2.P1.di1 ;
    assign \P2.P1.do1  = \P2.P1.P1.Datao ;
    assign \P2.P1.P1.CLOCK  = \P2.P1.clock ;
    assign \P2.P1.P1.NA_n  = \P2.P1.na ;
    assign \P2.P1.P1.BS16_n  = \P2.P1.bs16 ;
    assign \P2.P1.P1.READY_n  = \P2.P1.rdy1 ;
    assign \P2.P1.P1.HOLD  = \P2.P1.hold ;
    assign \P2.P1.P1.RESET  = \P2.P1.reset ;
    always @ (  posedge \P2.P1.P1.CLOCK  or  posedge \P2.P1.P1.RESET )
    begin : \P2.P1.P1.P0 
        if ( \P2.P1.P1.RESET  == 1'b1 ) 
        begin
            \P2.P1.P1.BE_n  <= 4'b0000;
            \P2.P1.P1.Address  <= 0;
            \P2.P1.P1.W_R_n  <= 1'b0;
            \P2.P1.P1.D_C_n  <= 1'b0;
            \P2.P1.P1.M_IO_n  <= 1'b0;
            \P2.P1.P1.ADS_n  <= 1'b0;
            \P2.P1.P1.State  <= \P2.P1.P1.StateInit ;
            \P2.P1.P1.StateNA  <= 1'b0;
            \P2.P1.P1.StateBS16  <= 1'b0;
            \P2.P1.P1.DataWidth  <= 0;
        end
        else
        begin 
            case ( \P2.P1.P1.State  ) 
            \P2.P1.P1.StateInit :
            begin
                \P2.P1.P1.D_C_n  <= 1'b1;
                \P2.P1.P1.ADS_n  <= 1'b1;
                \P2.P1.P1.State  <= \P2.P1.P1.StateTi ;
                \P2.P1.P1.StateNA  <= 1'b1;
                \P2.P1.P1.StateBS16  <= 1'b1;
                \P2.P1.P1.DataWidth  <= 2;
                \P2.P1.P1.State  <= \P2.P1.P1.StateTi ;
            end
            \P2.P1.P1.StateTi :
            begin
                if ( \P2.P1.P1.RequestPending  == \P2.P1.P1.Pending  ) 
                begin
                    \P2.P1.P1.State  <= \P2.P1.P1.StateT1 ;
                end
                else
                begin 
                    if ( \P2.P1.P1.HOLD  == 1'b1 ) 
                    begin
                        \P2.P1.P1.State  <= \P2.P1.P1.StateTh ;
                    end
                    else
                    begin 
                        \P2.P1.P1.State  <= \P2.P1.P1.StateTi ;
                    end
                end
            end
            \P2.P1.P1.StateT1 :
            begin
                \P2.P1.P1.Address  <= ( ( \P2.P1.P1.rEIP  / 4 ) % ( 2 ** 30 ) );
                \P2.P1.P1.BE_n  <= \P2.P1.P1.ByteEnable ;
                \P2.P1.P1.M_IO_n  <= \P2.P1.P1.MemoryFetch ;
                if ( \P2.P1.P1.ReadRequest  == \P2.P1.P1.Pending  ) 
                begin
                    \P2.P1.P1.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P1.P1.W_R_n  <= 1'b1;
                end
                if ( \P2.P1.P1.CodeFetch  == \P2.P1.P1.Pending  ) 
                begin
                    \P2.P1.P1.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P1.P1.D_C_n  <= 1'b1;
                end
                \P2.P1.P1.ADS_n  <= 1'b0;
                \P2.P1.P1.State  <= \P2.P1.P1.StateT2 ;
            end
            \P2.P1.P1.StateT2 :
            begin
                if ( ( ( \P2.P1.P1.READY_n  == 1'b0 ) & ( \P2.P1.P1.HOLD  == 1'b0 ) ) & ( \P2.P1.P1.RequestPending  == \P2.P1.P1.Pending  ) ) 
                begin
                    \P2.P1.P1.State  <= \P2.P1.P1.StateT1 ;
                end
                else
                begin 
                    if ( ( \P2.P1.P1.READY_n  == 1'b1 ) & ( \P2.P1.P1.NA_n  == 1'b1 ) ) 
                    begin
                    end
                    else
                    begin 
                        if ( ( ( \P2.P1.P1.RequestPending  == \P2.P1.P1.Pending  ) | ( \P2.P1.P1.HOLD  == 1'b1 ) ) & ( ( \P2.P1.P1.READY_n  == 1'b1 ) & ( \P2.P1.P1.NA_n  == 1'b0 ) ) ) 
                        begin
                            \P2.P1.P1.State  <= \P2.P1.P1.StateT2I ;
                        end
                        else
                        begin 
                            if ( ( ( ( \P2.P1.P1.RequestPending  == \P2.P1.P1.Pending  ) & ( \P2.P1.P1.HOLD  == 1'b0 ) ) & ( \P2.P1.P1.READY_n  == 1'b1 ) ) & ( \P2.P1.P1.NA_n  == 1'b0 ) ) 
                            begin
                                \P2.P1.P1.State  <= \P2.P1.P1.StateT2P ;
                            end
                            else
                            begin 
                                if ( ( ( \P2.P1.P1.RequestPending  == \P2.P1.P1.NotPending  ) & ( \P2.P1.P1.HOLD  == 1'b0 ) ) & ( \P2.P1.P1.READY_n  == 1'b0 ) ) 
                                begin
                                    \P2.P1.P1.State  <= \P2.P1.P1.StateTi ;
                                end
                                else
                                begin 
                                    if ( ( \P2.P1.P1.HOLD  == 1'b1 ) & ( \P2.P1.P1.READY_n  == 1'b1 ) ) 
                                    begin
                                        \P2.P1.P1.State  <= \P2.P1.P1.StateTh ;
                                    end
                                    else
                                    begin 
                                        \P2.P1.P1.State  <= \P2.P1.P1.StateT2 ;
                                    end
                                end
                            end
                        end
                    end
                end
                \P2.P1.P1.StateBS16  <= \P2.P1.P1.BS16_n ;
                if ( \P2.P1.P1.BS16_n  == 1'b0 ) 
                begin
                    \P2.P1.P1.DataWidth  <= \P2.P1.P1.WidthWord ;
                end
                else
                begin 
                    \P2.P1.P1.DataWidth  <= \P2.P1.P1.WidthDword ;
                end
                \P2.P1.P1.StateNA  <= \P2.P1.P1.NA_n ;
                \P2.P1.P1.ADS_n  <= 1'b1;
            end
            \P2.P1.P1.StateT1P :
            begin
                if ( ( ( \P2.P1.P1.NA_n  == 1'b0 ) & ( \P2.P1.P1.HOLD  == 1'b0 ) ) & ( \P2.P1.P1.RequestPending  == \P2.P1.P1.Pending  ) ) 
                begin
                    \P2.P1.P1.State  <= \P2.P1.P1.StateT2P ;
                end
                else
                begin 
                    if ( ( \P2.P1.P1.NA_n  == 1'b0 ) & ( ( \P2.P1.P1.HOLD  == 1'b1 ) | ( \P2.P1.P1.RequestPending  == \P2.P1.P1.NotPending  ) ) ) 
                    begin
                        \P2.P1.P1.State  <= \P2.P1.P1.StateT2I ;
                    end
                    else
                    begin 
                        if ( \P2.P1.P1.NA_n  == 1'b1 ) 
                        begin
                            \P2.P1.P1.State  <= \P2.P1.P1.StateT2 ;
                        end
                        else
                        begin 
                            \P2.P1.P1.State  <= \P2.P1.P1.StateT1P ;
                        end
                    end
                end
                \P2.P1.P1.StateBS16  <= \P2.P1.P1.BS16_n ;
                if ( \P2.P1.P1.BS16_n  == 1'b0 ) 
                begin
                    \P2.P1.P1.DataWidth  <= \P2.P1.P1.WidthWord ;
                end
                else
                begin 
                    \P2.P1.P1.DataWidth  <= \P2.P1.P1.WidthDword ;
                end
                \P2.P1.P1.StateNA  <= \P2.P1.P1.NA_n ;
                \P2.P1.P1.ADS_n  <= 1'b1;
            end
            \P2.P1.P1.StateTh :
            begin
                if ( ( \P2.P1.P1.HOLD  == 1'b0 ) & ( \P2.P1.P1.RequestPending  == \P2.P1.P1.Pending  ) ) 
                begin
                    \P2.P1.P1.State  <= \P2.P1.P1.StateT1 ;
                end
                else
                begin 
                    if ( ( \P2.P1.P1.HOLD  == 1'b0 ) & ( \P2.P1.P1.RequestPending  == \P2.P1.P1.NotPending  ) ) 
                    begin
                        \P2.P1.P1.State  <= \P2.P1.P1.StateTi ;
                    end
                    else
                    begin 
                        \P2.P1.P1.State  <= \P2.P1.P1.StateTh ;
                    end
                end
            end
            \P2.P1.P1.StateT2P :
            begin
                \P2.P1.P1.Address  <= ( ( \P2.P1.P1.rEIP  / 2 ) % ( 2 ** 30 ) );
                \P2.P1.P1.BE_n  <= \P2.P1.P1.ByteEnable ;
                \P2.P1.P1.M_IO_n  <= \P2.P1.P1.MemoryFetch ;
                if ( \P2.P1.P1.ReadRequest  == \P2.P1.P1.Pending  ) 
                begin
                    \P2.P1.P1.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P1.P1.W_R_n  <= 1'b1;
                end
                if ( \P2.P1.P1.CodeFetch  == \P2.P1.P1.Pending  ) 
                begin
                    \P2.P1.P1.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P1.P1.D_C_n  <= 1'b1;
                end
                \P2.P1.P1.ADS_n  <= 1'b0;
                if ( \P2.P1.P1.READY_n  == 1'b0 ) 
                begin
                    \P2.P1.P1.State  <= \P2.P1.P1.StateT1P ;
                end
                else
                begin 
                    \P2.P1.P1.State  <= \P2.P1.P1.StateT2P ;
                end
            end
            \P2.P1.P1.StateT2I :
            begin
                if ( ( ( \P2.P1.P1.READY_n  == 1'b1 ) & ( \P2.P1.P1.RequestPending  == \P2.P1.P1.Pending  ) ) & ( \P2.P1.P1.HOLD  == 1'b0 ) ) 
                begin
                    \P2.P1.P1.State  <= \P2.P1.P1.StateT2P ;
                end
                else
                begin 
                    if ( ( \P2.P1.P1.READY_n  == 1'b0 ) & ( \P2.P1.P1.HOLD  == 1'b1 ) ) 
                    begin
                        \P2.P1.P1.State  <= \P2.P1.P1.StateTh ;
                    end
                    else
                    begin 
                        if ( ( ( \P2.P1.P1.READY_n  == 1'b0 ) & ( \P2.P1.P1.HOLD  == 1'b0 ) ) & ( \P2.P1.P1.RequestPending  == \P2.P1.P1.Pending  ) ) 
                        begin
                            \P2.P1.P1.State  <= \P2.P1.P1.StateT1 ;
                        end
                        else
                        begin 
                            if ( ( ( \P2.P1.P1.READY_n  == 1'b0 ) & ( \P2.P1.P1.HOLD  == 1'b0 ) ) & ( \P2.P1.P1.RequestPending  == \P2.P1.P1.NotPending  ) ) 
                            begin
                                \P2.P1.P1.State  <= \P2.P1.P1.StateTi ;
                            end
                            else
                            begin 
                                \P2.P1.P1.State  <= \P2.P1.P1.StateT2I ;
                            end
                        end
                    end
                end
            end
            endcase
        end
    end
    always @ (  posedge \P2.P1.P1.CLOCK  or  posedge \P2.P1.P1.RESET )
    begin : \P2.P1.P1.P1 
        reg [7:0] \P2.P1.P1.InstQueue [15:0];
        reg [4:0] \P2.P1.P1.InstQueueRd_Addr ;
        reg [4:0] \P2.P1.P1.InstQueueWr_Addr ;
        parameter \P2.P1.P1.InstQueueLimit   = 15;
        integer \P2.P1.P1.InstAddrPointer ;
        integer \P2.P1.P1.PhyAddrPointer ;
        reg  \P2.P1.P1.Extended ;
        reg  \P2.P1.P1.More ;
        reg  \P2.P1.P1.Flush ;
        reg [15:0] \P2.P1.P1.lWord ;
        reg [14:0] \P2.P1.P1.uWord ;
        integer \P2.P1.P1.fWord ;
        reg [3:0] \P2.P1.P1.State2 ;
        parameter \P2.P1.P1.Si   = 0;
        parameter \P2.P1.P1.S1   = 1;
        parameter \P2.P1.P1.S2   = 2;
        parameter \P2.P1.P1.S3   = 3;
        parameter \P2.P1.P1.S4   = 4;
        parameter \P2.P1.P1.S5   = 5;
        parameter \P2.P1.P1.S6   = 6;
        parameter \P2.P1.P1.S7   = 7;
        parameter \P2.P1.P1.S8   = 8;
        parameter \P2.P1.P1.S9   = 9;
        if ( \P2.P1.P1.RESET  == 1'b1 ) 
        begin
            \P2.P1.P1.State2  = \P2.P1.P1.Si ;
            \P2.P1.P1.InstQueue  = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            \P2.P1.P1.InstQueueRd_Addr  = 0;
            \P2.P1.P1.InstQueueWr_Addr  = 0;
            \P2.P1.P1.InstAddrPointer  = 0;
            \P2.P1.P1.PhyAddrPointer  = 0;
            \P2.P1.P1.Extended  = 1'b0;
            \P2.P1.P1.More  = 1'b0;
            \P2.P1.P1.Flush  = 1'b0;
            \P2.P1.P1.lWord  = 0;
            \P2.P1.P1.uWord  = 0;
            \P2.P1.P1.fWord  = 0;
            \P2.P1.P1.CodeFetch  <= 1'b0;
            \P2.P1.P1.Datao  <= 0;
            \P2.P1.P1.EAX  <= 0;
            \P2.P1.P1.EBX  <= 0;
            \P2.P1.P1.rEIP  <= 0;
            \P2.P1.P1.ReadRequest  <= 1'b0;
            \P2.P1.P1.MemoryFetch  <= 1'b0;
            \P2.P1.P1.RequestPending  <= 1'b0;
        end
        else
        begin 
            case ( \P2.P1.P1.State2  ) 
            \P2.P1.P1.Si :
            begin
                \P2.P1.P1.PhyAddrPointer  = \P2.P1.P1.rEIP ;
                \P2.P1.P1.InstAddrPointer  = \P2.P1.P1.PhyAddrPointer ;
                \P2.P1.P1.State2  = \P2.P1.P1.S1 ;
                \P2.P1.P1.rEIP  <= 20'hFFFF0;
                \P2.P1.P1.ReadRequest  <= 1'b1;
                \P2.P1.P1.MemoryFetch  <= 1'b1;
                \P2.P1.P1.RequestPending  <= 1'b1;
            end
            \P2.P1.P1.S1 :
            begin
                \P2.P1.P1.RequestPending  <= \P2.P1.P1.Pending ;
                \P2.P1.P1.ReadRequest  <= \P2.P1.P1.Pending ;
                \P2.P1.P1.MemoryFetch  <= \P2.P1.P1.Pending ;
                \P2.P1.P1.CodeFetch  <= \P2.P1.P1.Pending ;
                if ( \P2.P1.P1.READY_n  == 1'b0 ) 
                begin
                    \P2.P1.P1.State2  = \P2.P1.P1.S2 ;
                end
                else
                begin 
                    \P2.P1.P1.State2  = \P2.P1.P1.S1 ;
                end
            end
            \P2.P1.P1.S2 :
            begin
                \P2.P1.P1.RequestPending  <= \P2.P1.P1.NotPending ;
                \P2.P1.P1.InstQueue [\P2.P1.P1.InstQueueWr_Addr ] = ( \P2.P1.P1.Datai  % ( 2 ** 8 ) );
                \P2.P1.P1.InstQueueWr_Addr  = ( ( \P2.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P1.P1.InstQueue [\P2.P1.P1.InstQueueWr_Addr ] = ( \P2.P1.P1.Datai  % ( 2 ** 8 ) );
                \P2.P1.P1.InstQueueWr_Addr  = ( ( \P2.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                if ( \P2.P1.P1.StateBS16  == 1'b1 ) 
                begin
                    \P2.P1.P1.InstQueue [\P2.P1.P1.InstQueueWr_Addr ] = ( ( \P2.P1.P1.Datai  / ( 2 ** 16 ) ) % ( 2 ** 8 ) );
                    \P2.P1.P1.InstQueueWr_Addr  = ( ( \P2.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P1.P1.InstQueue [\P2.P1.P1.InstQueueWr_Addr ] = ( ( \P2.P1.P1.Datai  / ( 2 ** 24 ) ) % ( 2 ** 8 ) );
                    \P2.P1.P1.InstQueueWr_Addr  = ( ( \P2.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P1.P1.PhyAddrPointer  = ( \P2.P1.P1.PhyAddrPointer  + 4 );
                    \P2.P1.P1.State2  = \P2.P1.P1.S5 ;
                end
                else
                begin
                    \P2.P1.P1.PhyAddrPointer  = ( \P2.P1.P1.PhyAddrPointer  + 2 );
                    if ( \P2.P1.P1.PhyAddrPointer  < 0 ) 
                    begin
                        \P2.P1.P1.rEIP  <=  -( \P2.P1.P1.PhyAddrPointer );
                    end
                    else
                    begin 
                        \P2.P1.P1.rEIP  <= \P2.P1.P1.PhyAddrPointer ;
                    end
                    \P2.P1.P1.State2  = \P2.P1.P1.S3 ;
                end
            end
            \P2.P1.P1.S3 :
            begin
                \P2.P1.P1.RequestPending  <= \P2.P1.P1.Pending ;
                if ( \P2.P1.P1.READY_n  == 1'b0 ) 
                begin
                    \P2.P1.P1.State2  = \P2.P1.P1.S4 ;
                end
                else
                begin 
                    \P2.P1.P1.State2  = \P2.P1.P1.S3 ;
                end
            end
            \P2.P1.P1.S4 :
            begin
                \P2.P1.P1.RequestPending  <= \P2.P1.P1.NotPending ;
                \P2.P1.P1.InstQueue [\P2.P1.P1.InstQueueWr_Addr ] = ( \P2.P1.P1.Datai  % ( 2 ** 8 ) );
                \P2.P1.P1.InstQueueWr_Addr  = ( ( \P2.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P1.P1.InstQueue [\P2.P1.P1.InstQueueWr_Addr ] = ( \P2.P1.P1.Datai  % ( 2 ** 8 ) );
                \P2.P1.P1.InstQueueWr_Addr  = ( ( \P2.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P1.P1.PhyAddrPointer  = ( \P2.P1.P1.PhyAddrPointer  + 2 );
                \P2.P1.P1.State2  = \P2.P1.P1.S5 ;
            end
            \P2.P1.P1.S5 :
            begin
                case ( \P2.P1.P1.InstQueue [\P2.P1.P1.InstQueueRd_Addr ] ) 
                \P2.P1.P1.NOP :
                begin
                    \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 1 );
                    \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P1.Flush  = 1'b0;
                    \P2.P1.P1.More  = 1'b0;
                end
                \P2.P1.P1.OPsop :
                begin
                    \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 1 );
                    \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P1.Extended  = 1'b1;
                    \P2.P1.P1.Flush  = 1'b0;
                    \P2.P1.P1.More  = 1'b0;
                end
                \P2.P1.P1.JMP_rel_short :
                begin
                    if ( ( \P2.P1.P1.InstQueueWr_Addr  - \P2.P1.P1.InstQueueRd_Addr  ) >= 3 ) 
                    begin
                        if ( \P2.P1.P1.InstQueue [( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 )] > 127 ) 
                        begin
                            \P2.P1.P1.PhyAddrPointer  = ( ( \P2.P1.P1.InstAddrPointer  + 1 ) - ( 8'hFF - \P2.P1.P1.InstQueue [( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 )] ) );
                            \P2.P1.P1.InstAddrPointer  = \P2.P1.P1.PhyAddrPointer ;
                        end
                        else
                        begin
                            \P2.P1.P1.PhyAddrPointer  = ( ( \P2.P1.P1.InstAddrPointer  + 2 ) + \P2.P1.P1.InstQueue [( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 )] );
                            \P2.P1.P1.InstAddrPointer  = \P2.P1.P1.PhyAddrPointer ;
                        end
                        \P2.P1.P1.Flush  = 1'b1;
                        \P2.P1.P1.More  = 1'b0;
                    end
                    else
                    begin
                        \P2.P1.P1.Flush  = 1'b0;
                        \P2.P1.P1.More  = 1'b1;
                    end
                end
                \P2.P1.P1.JMP_rel_near :
                begin
                    if ( ( \P2.P1.P1.InstQueueWr_Addr  - \P2.P1.P1.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P1.P1.PhyAddrPointer  = ( ( \P2.P1.P1.InstAddrPointer  + 5 ) + \P2.P1.P1.InstQueue [( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P2.P1.P1.InstAddrPointer  = \P2.P1.P1.PhyAddrPointer ;
                        \P2.P1.P1.Flush  = 1'b1;
                        \P2.P1.P1.More  = 1'b0;
                    end
                    else
                    begin
                        \P2.P1.P1.Flush  = 1'b0;
                        \P2.P1.P1.More  = 1'b1;
                    end
                end
                \P2.P1.P1.JMP_intseg_immed :
                begin
                    \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 1 );
                    \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P1.Flush  = 1'b0;
                    \P2.P1.P1.More  = 1'b0;
                end
                \P2.P1.P1.MOV_al_b :
                begin
                    \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 1 );
                    \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P1.Flush  = 1'b0;
                    \P2.P1.P1.More  = 1'b0;
                end
                \P2.P1.P1.MOV_eax_dw :
                begin
                    if ( ( \P2.P1.P1.InstQueueWr_Addr  - \P2.P1.P1.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P1.P1.EAX  <= ( ( ( ( \P2.P1.P1.InstQueue [( ( \P2.P1.P1.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P2.P1.P1.InstQueue [( ( \P2.P1.P1.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P2.P1.P1.InstQueue [( ( \P2.P1.P1.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P2.P1.P1.InstQueue [( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P2.P1.P1.More  = 1'b0;
                        \P2.P1.P1.Flush  = 1'b0;
                        \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 5 );
                        \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P2.P1.P1.Flush  = 1'b0;
                        \P2.P1.P1.More  = 1'b1;
                    end
                end
                \P2.P1.P1.MOV_ebx_dw :
                begin
                    if ( ( \P2.P1.P1.InstQueueWr_Addr  - \P2.P1.P1.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P1.P1.EBX  <= ( ( ( ( \P2.P1.P1.InstQueue [( ( \P2.P1.P1.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P2.P1.P1.InstQueue [( ( \P2.P1.P1.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P2.P1.P1.InstQueue [( ( \P2.P1.P1.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P2.P1.P1.InstQueue [( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 1 )] );
                        \P2.P1.P1.More  = 1'b0;
                        \P2.P1.P1.Flush  = 1'b0;
                        \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 5 );
                        \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P2.P1.P1.Flush  = 1'b0;
                        \P2.P1.P1.More  = 1'b1;
                    end
                end
                \P2.P1.P1.MOV_eax_ebx :
                begin
                    if ( ( \P2.P1.P1.InstQueueWr_Addr  - \P2.P1.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P2.P1.P1.EBX  < 0 ) 
                        begin
                            \P2.P1.P1.rEIP  <=  -( \P2.P1.P1.EBX );
                        end
                        else
                        begin 
                            \P2.P1.P1.rEIP  <= \P2.P1.P1.EBX ;
                        end
                        \P2.P1.P1.RequestPending  <= \P2.P1.P1.Pending ;
                        \P2.P1.P1.ReadRequest  <= \P2.P1.P1.Pending ;
                        \P2.P1.P1.MemoryFetch  <= \P2.P1.P1.Pending ;
                        \P2.P1.P1.CodeFetch  <= \P2.P1.P1.NotPending ;
                        if ( \P2.P1.P1.READY_n  == 1'b0 ) 
                        begin
                            \P2.P1.P1.RequestPending  <= \P2.P1.P1.NotPending ;
                            \P2.P1.P1.uWord  = ( \P2.P1.P1.Datai  % ( 2 ** 15 ) );
                            if ( \P2.P1.P1.StateBS16  == 1'b1 ) 
                            begin
                                \P2.P1.P1.lWord  = ( \P2.P1.P1.Datai  % ( 2 ** 16 ) );
                            end
                            else
                            begin
                                \P2.P1.P1.rEIP  <= ( \P2.P1.P1.rEIP  + 2 );
                                \P2.P1.P1.RequestPending  <= \P2.P1.P1.Pending ;
                                if ( \P2.P1.P1.READY_n  == 1'b0 ) 
                                begin
                                    \P2.P1.P1.RequestPending  <= \P2.P1.P1.NotPending ;
                                    \P2.P1.P1.lWord  = ( \P2.P1.P1.Datai  % ( 2 ** 16 ) );
                                end
                            end
                            if ( \P2.P1.P1.READY_n  == 1'b0 ) 
                            begin
                                \P2.P1.P1.EAX  <= ( ( \P2.P1.P1.uWord  * ( 2 ** 16 ) ) + \P2.P1.P1.lWord  );
                                \P2.P1.P1.More  = 1'b0;
                                \P2.P1.P1.Flush  = 1'b0;
                                \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 2 );
                                \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P2.P1.P1.Flush  = 1'b0;
                        \P2.P1.P1.More  = 1'b1;
                    end
                end
                \P2.P1.P1.MOV_ebx_eax :
                begin
                    if ( ( \P2.P1.P1.InstQueueWr_Addr  - \P2.P1.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P2.P1.P1.EBX  < 0 ) 
                        begin
                            \P2.P1.P1.rEIP  <= \P2.P1.P1.EBX ;
                        end
                        else
                        begin 
                            \P2.P1.P1.rEIP  <= \P2.P1.P1.EBX ;
                        end
                        \P2.P1.P1.lWord  = ( \P2.P1.P1.EAX  % ( 2 ** 16 ) );
                        \P2.P1.P1.uWord  = ( ( \P2.P1.P1.EAX  / ( 2 ** 16 ) ) % ( 2 ** 15 ) );
                        \P2.P1.P1.RequestPending  <= \P2.P1.P1.Pending ;
                        \P2.P1.P1.ReadRequest  <= \P2.P1.P1.NotPending ;
                        \P2.P1.P1.MemoryFetch  <= \P2.P1.P1.Pending ;
                        \P2.P1.P1.CodeFetch  <= \P2.P1.P1.NotPending ;
                        if ( ( \P2.P1.P1.State  == \P2.P1.P1.StateT1  ) | ( \P2.P1.P1.State  == \P2.P1.P1.StateT1P  ) ) 
                        begin
                            \P2.P1.P1.Datao  <= ( ( \P2.P1.P1.uWord  * ( 2 ** 16 ) ) + \P2.P1.P1.lWord  );
                            if ( \P2.P1.P1.READY_n  == 1'b0 ) 
                            begin
                                \P2.P1.P1.RequestPending  <= \P2.P1.P1.NotPending ;
                                if ( \P2.P1.P1.StateBS16  == 1'b0 ) 
                                begin
                                    \P2.P1.P1.rEIP  <= ( \P2.P1.P1.rEIP  + 2 );
                                    \P2.P1.P1.RequestPending  <= \P2.P1.P1.Pending ;
                                    \P2.P1.P1.ReadRequest  <= \P2.P1.P1.NotPending ;
                                    \P2.P1.P1.MemoryFetch  <= \P2.P1.P1.Pending ;
                                    \P2.P1.P1.CodeFetch  <= \P2.P1.P1.NotPending ;
                                    \P2.P1.P1.State2  = \P2.P1.P1.S6 ;
                                end
                                \P2.P1.P1.More  = 1'b0;
                                \P2.P1.P1.Flush  = 1'b0;
                                \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 2 );
                                \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P2.P1.P1.Flush  = 1'b0;
                        \P2.P1.P1.More  = 1'b1;
                    end
                end
                \P2.P1.P1.IN_al :
                begin
                    if ( ( \P2.P1.P1.InstQueueWr_Addr  - \P2.P1.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P2.P1.P1.rEIP  <= ( \P2.P1.P1.InstQueueRd_Addr  + 1 );
                        \P2.P1.P1.RequestPending  <= \P2.P1.P1.Pending ;
                        \P2.P1.P1.ReadRequest  <= \P2.P1.P1.Pending ;
                        \P2.P1.P1.MemoryFetch  <= \P2.P1.P1.NotPending ;
                        \P2.P1.P1.CodeFetch  <= \P2.P1.P1.NotPending ;
                        if ( \P2.P1.P1.READY_n  == 1'b0 ) 
                        begin
                            \P2.P1.P1.RequestPending  <= \P2.P1.P1.NotPending ;
                            \P2.P1.P1.EAX  <= \P2.P1.P1.Datai ;
                            \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 2 );
                            \P2.P1.P1.InstQueueRd_Addr  = ( \P2.P1.P1.InstQueueRd_Addr  + 2 );
                            \P2.P1.P1.Flush  = 1'b0;
                            \P2.P1.P1.More  = 1'b0;
                        end
                    end
                    else
                    begin
                        \P2.P1.P1.Flush  = 1'b0;
                        \P2.P1.P1.More  = 1'b1;
                    end
                end
                \P2.P1.P1.OUT_al :
                begin
                    if ( ( \P2.P1.P1.InstQueueWr_Addr  - \P2.P1.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P2.P1.P1.rEIP  <= ( \P2.P1.P1.InstQueueRd_Addr  + 1 );
                        \P2.P1.P1.RequestPending  <= \P2.P1.P1.Pending ;
                        \P2.P1.P1.ReadRequest  <= \P2.P1.P1.NotPending ;
                        \P2.P1.P1.MemoryFetch  <= \P2.P1.P1.NotPending ;
                        \P2.P1.P1.CodeFetch  <= \P2.P1.P1.NotPending ;
                        if ( ( \P2.P1.P1.State  == \P2.P1.P1.StateT1  ) | ( \P2.P1.P1.State  == \P2.P1.P1.StateT1P  ) ) 
                        begin
                            \P2.P1.P1.fWord  = ( \P2.P1.P1.EAX  % ( 2 ** 16 ) );
                            \P2.P1.P1.Datao  <= \P2.P1.P1.fWord ;
                            if ( \P2.P1.P1.READY_n  == 1'b0 ) 
                            begin
                                \P2.P1.P1.RequestPending  <= \P2.P1.P1.NotPending ;
                                \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 2 );
                                \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 2 ) % 16 );
                                \P2.P1.P1.Flush  = 1'b0;
                                \P2.P1.P1.More  = 1'b0;
                            end
                        end
                    end
                    else
                    begin
                        \P2.P1.P1.Flush  = 1'b0;
                        \P2.P1.P1.More  = 1'b1;
                    end
                end
                \P2.P1.P1.ADD_al_b :
                begin
                    \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 1 );
                    \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P1.Flush  = 1'b0;
                    \P2.P1.P1.More  = 1'b0;
                end
                \P2.P1.P1.ADD_ax_w :
                begin
                    \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 1 );
                    \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P1.Flush  = 1'b0;
                    \P2.P1.P1.More  = 1'b0;
                end
                \P2.P1.P1.ROL_al_1 :
                begin
                    \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 2 );
                    \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 2 ) % 16 );
                    \P2.P1.P1.Flush  = 1'b0;
                    \P2.P1.P1.More  = 1'b0;
                end
                \P2.P1.P1.ROL_al_n :
                begin
                    \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 2 );
                    \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 2 ) % 16 );
                    \P2.P1.P1.Flush  = 1'b0;
                    \P2.P1.P1.More  = 1'b0;
                end
                \P2.P1.P1.INC_eax :
                begin
                    \P2.P1.P1.EAX  <= ( \P2.P1.P1.EAX  + 1 );
                    \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 1 );
                    \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P1.Flush  = 1'b0;
                    \P2.P1.P1.More  = 1'b0;
                end
                \P2.P1.P1.INC_ebx :
                begin
                    \P2.P1.P1.EBX  <= ( \P2.P1.P1.EBX  + 1 );
                    \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 1 );
                    \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P1.Flush  = 1'b0;
                    \P2.P1.P1.More  = 1'b0;
                end
                default :
                begin
                    \P2.P1.P1.InstAddrPointer  = ( \P2.P1.P1.InstAddrPointer  + 1 );
                    \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P1.Flush  = 1'b0;
                    \P2.P1.P1.More  = 1'b0;
                end
                endcase
                if (  ~( ( \P2.P1.P1.InstQueueRd_Addr  < \P2.P1.P1.InstQueueWr_Addr  )) | ( ( ( ( \P2.P1.P1.InstQueueLimit  - \P2.P1.P1.InstQueueRd_Addr  ) < 4 ) | \P2.P1.P1.Flush  ) | \P2.P1.P1.More  ) ) 
                begin
                    \P2.P1.P1.State2  = \P2.P1.P1.S7 ;
                end
            end
            \P2.P1.P1.S6 :
            begin
                \P2.P1.P1.Datao  <= ( ( \P2.P1.P1.uWord  * ( 2 ** 16 ) ) + \P2.P1.P1.lWord  );
                if ( \P2.P1.P1.READY_n  == 1'b0 ) 
                begin
                    \P2.P1.P1.RequestPending  <= \P2.P1.P1.NotPending ;
                    \P2.P1.P1.State2  = \P2.P1.P1.S5 ;
                end
            end
            \P2.P1.P1.S7 :
            begin
                if ( \P2.P1.P1.Flush  ) 
                begin
                    \P2.P1.P1.InstQueueRd_Addr  = 1;
                    \P2.P1.P1.InstQueueWr_Addr  = 1;
                    if ( \P2.P1.P1.InstAddrPointer  < 0 ) 
                    begin
                        \P2.P1.P1.fWord  =  -( \P2.P1.P1.InstAddrPointer );
                    end
                    else
                    begin 
                        \P2.P1.P1.fWord  = \P2.P1.P1.InstAddrPointer ;
                    end
                    if ( ( \P2.P1.P1.fWord  % 2 ) == 1 ) 
                    begin
                        \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + ( \P2.P1.P1.fWord  % 4 ) ) % 16 );
                    end
                end
                if ( ( \P2.P1.P1.InstQueueLimit  - \P2.P1.P1.InstQueueRd_Addr  ) < 3 ) 
                begin
                    \P2.P1.P1.State2  = \P2.P1.P1.S8 ;
                    \P2.P1.P1.InstQueueWr_Addr  = 0;
                end
                else
                begin 
                    \P2.P1.P1.State2  = \P2.P1.P1.S9 ;
                end
            end
            \P2.P1.P1.S8 :
            begin
                if ( \P2.P1.P1.InstQueueRd_Addr  <= \P2.P1.P1.InstQueueLimit  ) 
                begin
                    \P2.P1.P1.InstQueue [\P2.P1.P1.InstQueueWr_Addr ] = \P2.P1.P1.InstQueue [\P2.P1.P1.InstQueueRd_Addr ];
                    \P2.P1.P1.InstQueueRd_Addr  = ( ( \P2.P1.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P1.InstQueueWr_Addr  = ( ( \P2.P1.P1.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P1.P1.State2  = \P2.P1.P1.S8 ;
                end
                else
                begin
                    \P2.P1.P1.InstQueueRd_Addr  = 0;
                    \P2.P1.P1.State2  = \P2.P1.P1.S9 ;
                end
            end
            \P2.P1.P1.S9 :
            begin
                \P2.P1.P1.rEIP  <= \P2.P1.P1.PhyAddrPointer ;
                \P2.P1.P1.State2  = \P2.P1.P1.S1 ;
            end
            endcase
        end
    end
    always @ (  posedge \P2.P1.P1.CLOCK  or  posedge \P2.P1.P1.RESET )
    begin : \P2.P1.P1.P2 
        if ( \P2.P1.P1.RESET  == 1'b1 ) 
        begin
            \P2.P1.P1.ByteEnable  <= 4'b0000;
            \P2.P1.P1.NonAligned  <= 1'b0;
        end
        else
        begin 
            case ( \P2.P1.P1.DataWidth  ) 
            \P2.P1.P1.WidthByte :
            begin
                case ( \P2.P1.P1.rEIP  % 4 ) 
                0:
                begin
                    \P2.P1.P1.ByteEnable  <= 4'b1110;
                end
                1:
                begin
                    \P2.P1.P1.ByteEnable  <= 4'b1101;
                end
                2:
                begin
                    \P2.P1.P1.ByteEnable  <= 4'b1011;
                end
                3:
                begin
                    \P2.P1.P1.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            \P2.P1.P1.WidthWord :
            begin
                case ( \P2.P1.P1.rEIP  % 4 ) 
                0:
                begin
                    \P2.P1.P1.ByteEnable  <= 4'b1100;
                    \P2.P1.P1.NonAligned  <= \P2.P1.P1.NotPending ;
                end
                1:
                begin
                    \P2.P1.P1.ByteEnable  <= 4'b1001;
                    \P2.P1.P1.NonAligned  <= \P2.P1.P1.NotPending ;
                end
                2:
                begin
                    \P2.P1.P1.ByteEnable  <= 4'b0011;
                    \P2.P1.P1.NonAligned  <= \P2.P1.P1.NotPending ;
                end
                3:
                begin
                    \P2.P1.P1.ByteEnable  <= 4'b0111;
                    \P2.P1.P1.NonAligned  <= \P2.P1.P1.Pending ;
                end
                default :
                begin
                end
                endcase
            end
            \P2.P1.P1.WidthDword :
            begin
                case ( \P2.P1.P1.rEIP  % 4 ) 
                0:
                begin
                    \P2.P1.P1.ByteEnable  <= 4'b0000;
                    \P2.P1.P1.NonAligned  <= \P2.P1.P1.NotPending ;
                end
                1:
                begin
                    \P2.P1.P1.ByteEnable  <= 4'b0001;
                    \P2.P1.P1.NonAligned  <= \P2.P1.P1.Pending ;
                end
                2:
                begin
                    \P2.P1.P1.NonAligned  <= \P2.P1.P1.Pending ;
                    \P2.P1.P1.ByteEnable  <= 4'b0011;
                end
                3:
                begin
                    \P2.P1.P1.NonAligned  <= \P2.P1.P1.Pending ;
                    \P2.P1.P1.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            default :
            begin
            end
            endcase
        end
    end
    assign \P2.P1.be2  = \P2.P1.P2.BE_n ;
    assign \P2.P1.addr2  = \P2.P1.P2.Address ;
    assign \P2.P1.wr2  = \P2.P1.P2.W_R_n ;
    assign \P2.P1.dc2  = \P2.P1.P2.D_C_n ;
    assign \P2.P1.mio2  = \P2.P1.P2.M_IO_n ;
    assign \P2.P1.ads2  = \P2.P1.P2.ADS_n ;
    assign \P2.P1.P2.Datai  = \P2.P1.di2 ;
    assign \P2.P1.do2  = \P2.P1.P2.Datao ;
    assign \P2.P1.P2.CLOCK  = \P2.P1.clock ;
    assign \P2.P1.P2.NA_n  = \P2.P1.na ;
    assign \P2.P1.P2.BS16_n  = \P2.P1.bs16 ;
    assign \P2.P1.P2.READY_n  = \P2.P1.rdy2 ;
    assign \P2.P1.P2.HOLD  = \P2.P1.hold ;
    assign \P2.P1.P2.RESET  = \P2.P1.reset ;
    always @ (  posedge \P2.P1.P2.CLOCK  or  posedge \P2.P1.P2.RESET )
    begin : \P2.P1.P2.P0 
        if ( \P2.P1.P2.RESET  == 1'b1 ) 
        begin
            \P2.P1.P2.BE_n  <= 4'b0000;
            \P2.P1.P2.Address  <= 0;
            \P2.P1.P2.W_R_n  <= 1'b0;
            \P2.P1.P2.D_C_n  <= 1'b0;
            \P2.P1.P2.M_IO_n  <= 1'b0;
            \P2.P1.P2.ADS_n  <= 1'b0;
            \P2.P1.P2.State  <= \P2.P1.P2.StateInit ;
            \P2.P1.P2.StateNA  <= 1'b0;
            \P2.P1.P2.StateBS16  <= 1'b0;
            \P2.P1.P2.DataWidth  <= 0;
        end
        else
        begin 
            case ( \P2.P1.P2.State  ) 
            \P2.P1.P2.StateInit :
            begin
                \P2.P1.P2.D_C_n  <= 1'b1;
                \P2.P1.P2.ADS_n  <= 1'b1;
                \P2.P1.P2.State  <= \P2.P1.P2.StateTi ;
                \P2.P1.P2.StateNA  <= 1'b1;
                \P2.P1.P2.StateBS16  <= 1'b1;
                \P2.P1.P2.DataWidth  <= 2;
                \P2.P1.P2.State  <= \P2.P1.P2.StateTi ;
            end
            \P2.P1.P2.StateTi :
            begin
                if ( \P2.P1.P2.RequestPending  == \P2.P1.P2.Pending  ) 
                begin
                    \P2.P1.P2.State  <= \P2.P1.P2.StateT1 ;
                end
                else
                begin 
                    if ( \P2.P1.P2.HOLD  == 1'b1 ) 
                    begin
                        \P2.P1.P2.State  <= \P2.P1.P2.StateTh ;
                    end
                    else
                    begin 
                        \P2.P1.P2.State  <= \P2.P1.P2.StateTi ;
                    end
                end
            end
            \P2.P1.P2.StateT1 :
            begin
                \P2.P1.P2.Address  <= ( ( \P2.P1.P2.rEIP  / 4 ) % ( 2 ** 30 ) );
                \P2.P1.P2.BE_n  <= \P2.P1.P2.ByteEnable ;
                \P2.P1.P2.M_IO_n  <= \P2.P1.P2.MemoryFetch ;
                if ( \P2.P1.P2.ReadRequest  == \P2.P1.P2.Pending  ) 
                begin
                    \P2.P1.P2.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P1.P2.W_R_n  <= 1'b1;
                end
                if ( \P2.P1.P2.CodeFetch  == \P2.P1.P2.Pending  ) 
                begin
                    \P2.P1.P2.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P1.P2.D_C_n  <= 1'b1;
                end
                \P2.P1.P2.ADS_n  <= 1'b0;
                \P2.P1.P2.State  <= \P2.P1.P2.StateT2 ;
            end
            \P2.P1.P2.StateT2 :
            begin
                if ( ( ( \P2.P1.P2.READY_n  == 1'b0 ) & ( \P2.P1.P2.HOLD  == 1'b0 ) ) & ( \P2.P1.P2.RequestPending  == \P2.P1.P2.Pending  ) ) 
                begin
                    \P2.P1.P2.State  <= \P2.P1.P2.StateT1 ;
                end
                else
                begin 
                    if ( ( \P2.P1.P2.READY_n  == 1'b1 ) & ( \P2.P1.P2.NA_n  == 1'b1 ) ) 
                    begin
                    end
                    else
                    begin 
                        if ( ( ( \P2.P1.P2.RequestPending  == \P2.P1.P2.Pending  ) | ( \P2.P1.P2.HOLD  == 1'b1 ) ) & ( ( \P2.P1.P2.READY_n  == 1'b1 ) & ( \P2.P1.P2.NA_n  == 1'b0 ) ) ) 
                        begin
                            \P2.P1.P2.State  <= \P2.P1.P2.StateT2I ;
                        end
                        else
                        begin 
                            if ( ( ( ( \P2.P1.P2.RequestPending  == \P2.P1.P2.Pending  ) & ( \P2.P1.P2.HOLD  == 1'b0 ) ) & ( \P2.P1.P2.READY_n  == 1'b1 ) ) & ( \P2.P1.P2.NA_n  == 1'b0 ) ) 
                            begin
                                \P2.P1.P2.State  <= \P2.P1.P2.StateT2P ;
                            end
                            else
                            begin 
                                if ( ( ( \P2.P1.P2.RequestPending  == \P2.P1.P2.NotPending  ) & ( \P2.P1.P2.HOLD  == 1'b0 ) ) & ( \P2.P1.P2.READY_n  == 1'b0 ) ) 
                                begin
                                    \P2.P1.P2.State  <= \P2.P1.P2.StateTi ;
                                end
                                else
                                begin 
                                    if ( ( \P2.P1.P2.HOLD  == 1'b1 ) & ( \P2.P1.P2.READY_n  == 1'b1 ) ) 
                                    begin
                                        \P2.P1.P2.State  <= \P2.P1.P2.StateTh ;
                                    end
                                    else
                                    begin 
                                        \P2.P1.P2.State  <= \P2.P1.P2.StateT2 ;
                                    end
                                end
                            end
                        end
                    end
                end
                \P2.P1.P2.StateBS16  <= \P2.P1.P2.BS16_n ;
                if ( \P2.P1.P2.BS16_n  == 1'b0 ) 
                begin
                    \P2.P1.P2.DataWidth  <= \P2.P1.P2.WidthWord ;
                end
                else
                begin 
                    \P2.P1.P2.DataWidth  <= \P2.P1.P2.WidthDword ;
                end
                \P2.P1.P2.StateNA  <= \P2.P1.P2.NA_n ;
                \P2.P1.P2.ADS_n  <= 1'b1;
            end
            \P2.P1.P2.StateT1P :
            begin
                if ( ( ( \P2.P1.P2.NA_n  == 1'b0 ) & ( \P2.P1.P2.HOLD  == 1'b0 ) ) & ( \P2.P1.P2.RequestPending  == \P2.P1.P2.Pending  ) ) 
                begin
                    \P2.P1.P2.State  <= \P2.P1.P2.StateT2P ;
                end
                else
                begin 
                    if ( ( \P2.P1.P2.NA_n  == 1'b0 ) & ( ( \P2.P1.P2.HOLD  == 1'b1 ) | ( \P2.P1.P2.RequestPending  == \P2.P1.P2.NotPending  ) ) ) 
                    begin
                        \P2.P1.P2.State  <= \P2.P1.P2.StateT2I ;
                    end
                    else
                    begin 
                        if ( \P2.P1.P2.NA_n  == 1'b1 ) 
                        begin
                            \P2.P1.P2.State  <= \P2.P1.P2.StateT2 ;
                        end
                        else
                        begin 
                            \P2.P1.P2.State  <= \P2.P1.P2.StateT1P ;
                        end
                    end
                end
                \P2.P1.P2.StateBS16  <= \P2.P1.P2.BS16_n ;
                if ( \P2.P1.P2.BS16_n  == 1'b0 ) 
                begin
                    \P2.P1.P2.DataWidth  <= \P2.P1.P2.WidthWord ;
                end
                else
                begin 
                    \P2.P1.P2.DataWidth  <= \P2.P1.P2.WidthDword ;
                end
                \P2.P1.P2.StateNA  <= \P2.P1.P2.NA_n ;
                \P2.P1.P2.ADS_n  <= 1'b1;
            end
            \P2.P1.P2.StateTh :
            begin
                if ( ( \P2.P1.P2.HOLD  == 1'b0 ) & ( \P2.P1.P2.RequestPending  == \P2.P1.P2.Pending  ) ) 
                begin
                    \P2.P1.P2.State  <= \P2.P1.P2.StateT1 ;
                end
                else
                begin 
                    if ( ( \P2.P1.P2.HOLD  == 1'b0 ) & ( \P2.P1.P2.RequestPending  == \P2.P1.P2.NotPending  ) ) 
                    begin
                        \P2.P1.P2.State  <= \P2.P1.P2.StateTi ;
                    end
                    else
                    begin 
                        \P2.P1.P2.State  <= \P2.P1.P2.StateTh ;
                    end
                end
            end
            \P2.P1.P2.StateT2P :
            begin
                \P2.P1.P2.Address  <= ( ( \P2.P1.P2.rEIP  / 2 ) % ( 2 ** 30 ) );
                \P2.P1.P2.BE_n  <= \P2.P1.P2.ByteEnable ;
                \P2.P1.P2.M_IO_n  <= \P2.P1.P2.MemoryFetch ;
                if ( \P2.P1.P2.ReadRequest  == \P2.P1.P2.Pending  ) 
                begin
                    \P2.P1.P2.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P1.P2.W_R_n  <= 1'b1;
                end
                if ( \P2.P1.P2.CodeFetch  == \P2.P1.P2.Pending  ) 
                begin
                    \P2.P1.P2.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P1.P2.D_C_n  <= 1'b1;
                end
                \P2.P1.P2.ADS_n  <= 1'b0;
                if ( \P2.P1.P2.READY_n  == 1'b0 ) 
                begin
                    \P2.P1.P2.State  <= \P2.P1.P2.StateT1P ;
                end
                else
                begin 
                    \P2.P1.P2.State  <= \P2.P1.P2.StateT2P ;
                end
            end
            \P2.P1.P2.StateT2I :
            begin
                if ( ( ( \P2.P1.P2.READY_n  == 1'b1 ) & ( \P2.P1.P2.RequestPending  == \P2.P1.P2.Pending  ) ) & ( \P2.P1.P2.HOLD  == 1'b0 ) ) 
                begin
                    \P2.P1.P2.State  <= \P2.P1.P2.StateT2P ;
                end
                else
                begin 
                    if ( ( \P2.P1.P2.READY_n  == 1'b0 ) & ( \P2.P1.P2.HOLD  == 1'b1 ) ) 
                    begin
                        \P2.P1.P2.State  <= \P2.P1.P2.StateTh ;
                    end
                    else
                    begin 
                        if ( ( ( \P2.P1.P2.READY_n  == 1'b0 ) & ( \P2.P1.P2.HOLD  == 1'b0 ) ) & ( \P2.P1.P2.RequestPending  == \P2.P1.P2.Pending  ) ) 
                        begin
                            \P2.P1.P2.State  <= \P2.P1.P2.StateT1 ;
                        end
                        else
                        begin 
                            if ( ( ( \P2.P1.P2.READY_n  == 1'b0 ) & ( \P2.P1.P2.HOLD  == 1'b0 ) ) & ( \P2.P1.P2.RequestPending  == \P2.P1.P2.NotPending  ) ) 
                            begin
                                \P2.P1.P2.State  <= \P2.P1.P2.StateTi ;
                            end
                            else
                            begin 
                                \P2.P1.P2.State  <= \P2.P1.P2.StateT2I ;
                            end
                        end
                    end
                end
            end
            endcase
        end
    end
    always @ (  posedge \P2.P1.P2.CLOCK  or  posedge \P2.P1.P2.RESET )
    begin : \P2.P1.P2.P1 
        reg [7:0] \P2.P1.P2.InstQueue [15:0];
        reg [4:0] \P2.P1.P2.InstQueueRd_Addr ;
        reg [4:0] \P2.P1.P2.InstQueueWr_Addr ;
        parameter \P2.P1.P2.InstQueueLimit   = 15;
        integer \P2.P1.P2.InstAddrPointer ;
        integer \P2.P1.P2.PhyAddrPointer ;
        reg  \P2.P1.P2.Extended ;
        reg  \P2.P1.P2.More ;
        reg  \P2.P1.P2.Flush ;
        reg [15:0] \P2.P1.P2.lWord ;
        reg [14:0] \P2.P1.P2.uWord ;
        integer \P2.P1.P2.fWord ;
        reg [3:0] \P2.P1.P2.State2 ;
        parameter \P2.P1.P2.Si   = 0;
        parameter \P2.P1.P2.S1   = 1;
        parameter \P2.P1.P2.S2   = 2;
        parameter \P2.P1.P2.S3   = 3;
        parameter \P2.P1.P2.S4   = 4;
        parameter \P2.P1.P2.S5   = 5;
        parameter \P2.P1.P2.S6   = 6;
        parameter \P2.P1.P2.S7   = 7;
        parameter \P2.P1.P2.S8   = 8;
        parameter \P2.P1.P2.S9   = 9;
        if ( \P2.P1.P2.RESET  == 1'b1 ) 
        begin
            \P2.P1.P2.State2  = \P2.P1.P2.Si ;
            \P2.P1.P2.InstQueue  = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            \P2.P1.P2.InstQueueRd_Addr  = 0;
            \P2.P1.P2.InstQueueWr_Addr  = 0;
            \P2.P1.P2.InstAddrPointer  = 0;
            \P2.P1.P2.PhyAddrPointer  = 0;
            \P2.P1.P2.Extended  = 1'b0;
            \P2.P1.P2.More  = 1'b0;
            \P2.P1.P2.Flush  = 1'b0;
            \P2.P1.P2.lWord  = 0;
            \P2.P1.P2.uWord  = 0;
            \P2.P1.P2.fWord  = 0;
            \P2.P1.P2.CodeFetch  <= 1'b0;
            \P2.P1.P2.Datao  <= 0;
            \P2.P1.P2.EAX  <= 0;
            \P2.P1.P2.EBX  <= 0;
            \P2.P1.P2.rEIP  <= 0;
            \P2.P1.P2.ReadRequest  <= 1'b0;
            \P2.P1.P2.MemoryFetch  <= 1'b0;
            \P2.P1.P2.RequestPending  <= 1'b0;
        end
        else
        begin 
            case ( \P2.P1.P2.State2  ) 
            \P2.P1.P2.Si :
            begin
                \P2.P1.P2.PhyAddrPointer  = \P2.P1.P2.rEIP ;
                \P2.P1.P2.InstAddrPointer  = \P2.P1.P2.PhyAddrPointer ;
                \P2.P1.P2.State2  = \P2.P1.P2.S1 ;
                \P2.P1.P2.rEIP  <= 20'hFFFF0;
                \P2.P1.P2.ReadRequest  <= 1'b1;
                \P2.P1.P2.MemoryFetch  <= 1'b1;
                \P2.P1.P2.RequestPending  <= 1'b1;
            end
            \P2.P1.P2.S1 :
            begin
                \P2.P1.P2.RequestPending  <= \P2.P1.P2.Pending ;
                \P2.P1.P2.ReadRequest  <= \P2.P1.P2.Pending ;
                \P2.P1.P2.MemoryFetch  <= \P2.P1.P2.Pending ;
                \P2.P1.P2.CodeFetch  <= \P2.P1.P2.Pending ;
                if ( \P2.P1.P2.READY_n  == 1'b0 ) 
                begin
                    \P2.P1.P2.State2  = \P2.P1.P2.S2 ;
                end
                else
                begin 
                    \P2.P1.P2.State2  = \P2.P1.P2.S1 ;
                end
            end
            \P2.P1.P2.S2 :
            begin
                \P2.P1.P2.RequestPending  <= \P2.P1.P2.NotPending ;
                \P2.P1.P2.InstQueue [\P2.P1.P2.InstQueueWr_Addr ] = ( \P2.P1.P2.Datai  % ( 2 ** 8 ) );
                \P2.P1.P2.InstQueueWr_Addr  = ( ( \P2.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P1.P2.InstQueue [\P2.P1.P2.InstQueueWr_Addr ] = ( \P2.P1.P2.Datai  % ( 2 ** 8 ) );
                \P2.P1.P2.InstQueueWr_Addr  = ( ( \P2.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                if ( \P2.P1.P2.StateBS16  == 1'b1 ) 
                begin
                    \P2.P1.P2.InstQueue [\P2.P1.P2.InstQueueWr_Addr ] = ( ( \P2.P1.P2.Datai  / ( 2 ** 16 ) ) % ( 2 ** 8 ) );
                    \P2.P1.P2.InstQueueWr_Addr  = ( ( \P2.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P1.P2.InstQueue [\P2.P1.P2.InstQueueWr_Addr ] = ( ( \P2.P1.P2.Datai  / ( 2 ** 24 ) ) % ( 2 ** 8 ) );
                    \P2.P1.P2.InstQueueWr_Addr  = ( ( \P2.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P1.P2.PhyAddrPointer  = ( \P2.P1.P2.PhyAddrPointer  + 4 );
                    \P2.P1.P2.State2  = \P2.P1.P2.S5 ;
                end
                else
                begin
                    \P2.P1.P2.PhyAddrPointer  = ( \P2.P1.P2.PhyAddrPointer  + 2 );
                    if ( \P2.P1.P2.PhyAddrPointer  < 0 ) 
                    begin
                        \P2.P1.P2.rEIP  <=  -( \P2.P1.P2.PhyAddrPointer );
                    end
                    else
                    begin 
                        \P2.P1.P2.rEIP  <= \P2.P1.P2.PhyAddrPointer ;
                    end
                    \P2.P1.P2.State2  = \P2.P1.P2.S3 ;
                end
            end
            \P2.P1.P2.S3 :
            begin
                \P2.P1.P2.RequestPending  <= \P2.P1.P2.Pending ;
                if ( \P2.P1.P2.READY_n  == 1'b0 ) 
                begin
                    \P2.P1.P2.State2  = \P2.P1.P2.S4 ;
                end
                else
                begin 
                    \P2.P1.P2.State2  = \P2.P1.P2.S3 ;
                end
            end
            \P2.P1.P2.S4 :
            begin
                \P2.P1.P2.RequestPending  <= \P2.P1.P2.NotPending ;
                \P2.P1.P2.InstQueue [\P2.P1.P2.InstQueueWr_Addr ] = ( \P2.P1.P2.Datai  % ( 2 ** 8 ) );
                \P2.P1.P2.InstQueueWr_Addr  = ( ( \P2.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P1.P2.InstQueue [\P2.P1.P2.InstQueueWr_Addr ] = ( \P2.P1.P2.Datai  % ( 2 ** 8 ) );
                \P2.P1.P2.InstQueueWr_Addr  = ( ( \P2.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P1.P2.PhyAddrPointer  = ( \P2.P1.P2.PhyAddrPointer  + 2 );
                \P2.P1.P2.State2  = \P2.P1.P2.S5 ;
            end
            \P2.P1.P2.S5 :
            begin
                case ( \P2.P1.P2.InstQueue [\P2.P1.P2.InstQueueRd_Addr ] ) 
                \P2.P1.P2.NOP :
                begin
                    \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 1 );
                    \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P2.Flush  = 1'b0;
                    \P2.P1.P2.More  = 1'b0;
                end
                \P2.P1.P2.OPsop :
                begin
                    \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 1 );
                    \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P2.Extended  = 1'b1;
                    \P2.P1.P2.Flush  = 1'b0;
                    \P2.P1.P2.More  = 1'b0;
                end
                \P2.P1.P2.JMP_rel_short :
                begin
                    if ( ( \P2.P1.P2.InstQueueWr_Addr  - \P2.P1.P2.InstQueueRd_Addr  ) >= 3 ) 
                    begin
                        if ( \P2.P1.P2.InstQueue [( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 )] > 127 ) 
                        begin
                            \P2.P1.P2.PhyAddrPointer  = ( ( \P2.P1.P2.InstAddrPointer  + 1 ) - ( 8'hFF - \P2.P1.P2.InstQueue [( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 )] ) );
                            \P2.P1.P2.InstAddrPointer  = \P2.P1.P2.PhyAddrPointer ;
                        end
                        else
                        begin
                            \P2.P1.P2.PhyAddrPointer  = ( ( \P2.P1.P2.InstAddrPointer  + 2 ) + \P2.P1.P2.InstQueue [( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 )] );
                            \P2.P1.P2.InstAddrPointer  = \P2.P1.P2.PhyAddrPointer ;
                        end
                        \P2.P1.P2.Flush  = 1'b1;
                        \P2.P1.P2.More  = 1'b0;
                    end
                    else
                    begin
                        \P2.P1.P2.Flush  = 1'b0;
                        \P2.P1.P2.More  = 1'b1;
                    end
                end
                \P2.P1.P2.JMP_rel_near :
                begin
                    if ( ( \P2.P1.P2.InstQueueWr_Addr  - \P2.P1.P2.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P1.P2.PhyAddrPointer  = ( ( \P2.P1.P2.InstAddrPointer  + 5 ) + \P2.P1.P2.InstQueue [( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P2.P1.P2.InstAddrPointer  = \P2.P1.P2.PhyAddrPointer ;
                        \P2.P1.P2.Flush  = 1'b1;
                        \P2.P1.P2.More  = 1'b0;
                    end
                    else
                    begin
                        \P2.P1.P2.Flush  = 1'b0;
                        \P2.P1.P2.More  = 1'b1;
                    end
                end
                \P2.P1.P2.JMP_intseg_immed :
                begin
                    \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 1 );
                    \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P2.Flush  = 1'b0;
                    \P2.P1.P2.More  = 1'b0;
                end
                \P2.P1.P2.MOV_al_b :
                begin
                    \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 1 );
                    \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P2.Flush  = 1'b0;
                    \P2.P1.P2.More  = 1'b0;
                end
                \P2.P1.P2.MOV_eax_dw :
                begin
                    if ( ( \P2.P1.P2.InstQueueWr_Addr  - \P2.P1.P2.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P1.P2.EAX  <= ( ( ( ( \P2.P1.P2.InstQueue [( ( \P2.P1.P2.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P2.P1.P2.InstQueue [( ( \P2.P1.P2.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P2.P1.P2.InstQueue [( ( \P2.P1.P2.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P2.P1.P2.InstQueue [( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P2.P1.P2.More  = 1'b0;
                        \P2.P1.P2.Flush  = 1'b0;
                        \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 5 );
                        \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P2.P1.P2.Flush  = 1'b0;
                        \P2.P1.P2.More  = 1'b1;
                    end
                end
                \P2.P1.P2.MOV_ebx_dw :
                begin
                    if ( ( \P2.P1.P2.InstQueueWr_Addr  - \P2.P1.P2.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P1.P2.EBX  <= ( ( ( ( \P2.P1.P2.InstQueue [( ( \P2.P1.P2.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P2.P1.P2.InstQueue [( ( \P2.P1.P2.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P2.P1.P2.InstQueue [( ( \P2.P1.P2.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P2.P1.P2.InstQueue [( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 1 )] );
                        \P2.P1.P2.More  = 1'b0;
                        \P2.P1.P2.Flush  = 1'b0;
                        \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 5 );
                        \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P2.P1.P2.Flush  = 1'b0;
                        \P2.P1.P2.More  = 1'b1;
                    end
                end
                \P2.P1.P2.MOV_eax_ebx :
                begin
                    if ( ( \P2.P1.P2.InstQueueWr_Addr  - \P2.P1.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P2.P1.P2.EBX  < 0 ) 
                        begin
                            \P2.P1.P2.rEIP  <=  -( \P2.P1.P2.EBX );
                        end
                        else
                        begin 
                            \P2.P1.P2.rEIP  <= \P2.P1.P2.EBX ;
                        end
                        \P2.P1.P2.RequestPending  <= \P2.P1.P2.Pending ;
                        \P2.P1.P2.ReadRequest  <= \P2.P1.P2.Pending ;
                        \P2.P1.P2.MemoryFetch  <= \P2.P1.P2.Pending ;
                        \P2.P1.P2.CodeFetch  <= \P2.P1.P2.NotPending ;
                        if ( \P2.P1.P2.READY_n  == 1'b0 ) 
                        begin
                            \P2.P1.P2.RequestPending  <= \P2.P1.P2.NotPending ;
                            \P2.P1.P2.uWord  = ( \P2.P1.P2.Datai  % ( 2 ** 15 ) );
                            if ( \P2.P1.P2.StateBS16  == 1'b1 ) 
                            begin
                                \P2.P1.P2.lWord  = ( \P2.P1.P2.Datai  % ( 2 ** 16 ) );
                            end
                            else
                            begin
                                \P2.P1.P2.rEIP  <= ( \P2.P1.P2.rEIP  + 2 );
                                \P2.P1.P2.RequestPending  <= \P2.P1.P2.Pending ;
                                if ( \P2.P1.P2.READY_n  == 1'b0 ) 
                                begin
                                    \P2.P1.P2.RequestPending  <= \P2.P1.P2.NotPending ;
                                    \P2.P1.P2.lWord  = ( \P2.P1.P2.Datai  % ( 2 ** 16 ) );
                                end
                            end
                            if ( \P2.P1.P2.READY_n  == 1'b0 ) 
                            begin
                                \P2.P1.P2.EAX  <= ( ( \P2.P1.P2.uWord  * ( 2 ** 16 ) ) + \P2.P1.P2.lWord  );
                                \P2.P1.P2.More  = 1'b0;
                                \P2.P1.P2.Flush  = 1'b0;
                                \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 2 );
                                \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P2.P1.P2.Flush  = 1'b0;
                        \P2.P1.P2.More  = 1'b1;
                    end
                end
                \P2.P1.P2.MOV_ebx_eax :
                begin
                    if ( ( \P2.P1.P2.InstQueueWr_Addr  - \P2.P1.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P2.P1.P2.EBX  < 0 ) 
                        begin
                            \P2.P1.P2.rEIP  <= \P2.P1.P2.EBX ;
                        end
                        else
                        begin 
                            \P2.P1.P2.rEIP  <= \P2.P1.P2.EBX ;
                        end
                        \P2.P1.P2.lWord  = ( \P2.P1.P2.EAX  % ( 2 ** 16 ) );
                        \P2.P1.P2.uWord  = ( ( \P2.P1.P2.EAX  / ( 2 ** 16 ) ) % ( 2 ** 15 ) );
                        \P2.P1.P2.RequestPending  <= \P2.P1.P2.Pending ;
                        \P2.P1.P2.ReadRequest  <= \P2.P1.P2.NotPending ;
                        \P2.P1.P2.MemoryFetch  <= \P2.P1.P2.Pending ;
                        \P2.P1.P2.CodeFetch  <= \P2.P1.P2.NotPending ;
                        if ( ( \P2.P1.P2.State  == \P2.P1.P2.StateT1  ) | ( \P2.P1.P2.State  == \P2.P1.P2.StateT1P  ) ) 
                        begin
                            \P2.P1.P2.Datao  <= ( ( \P2.P1.P2.uWord  * ( 2 ** 16 ) ) + \P2.P1.P2.lWord  );
                            if ( \P2.P1.P2.READY_n  == 1'b0 ) 
                            begin
                                \P2.P1.P2.RequestPending  <= \P2.P1.P2.NotPending ;
                                if ( \P2.P1.P2.StateBS16  == 1'b0 ) 
                                begin
                                    \P2.P1.P2.rEIP  <= ( \P2.P1.P2.rEIP  + 2 );
                                    \P2.P1.P2.RequestPending  <= \P2.P1.P2.Pending ;
                                    \P2.P1.P2.ReadRequest  <= \P2.P1.P2.NotPending ;
                                    \P2.P1.P2.MemoryFetch  <= \P2.P1.P2.Pending ;
                                    \P2.P1.P2.CodeFetch  <= \P2.P1.P2.NotPending ;
                                    \P2.P1.P2.State2  = \P2.P1.P2.S6 ;
                                end
                                \P2.P1.P2.More  = 1'b0;
                                \P2.P1.P2.Flush  = 1'b0;
                                \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 2 );
                                \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P2.P1.P2.Flush  = 1'b0;
                        \P2.P1.P2.More  = 1'b1;
                    end
                end
                \P2.P1.P2.IN_al :
                begin
                    if ( ( \P2.P1.P2.InstQueueWr_Addr  - \P2.P1.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P2.P1.P2.rEIP  <= ( \P2.P1.P2.InstQueueRd_Addr  + 1 );
                        \P2.P1.P2.RequestPending  <= \P2.P1.P2.Pending ;
                        \P2.P1.P2.ReadRequest  <= \P2.P1.P2.Pending ;
                        \P2.P1.P2.MemoryFetch  <= \P2.P1.P2.NotPending ;
                        \P2.P1.P2.CodeFetch  <= \P2.P1.P2.NotPending ;
                        if ( \P2.P1.P2.READY_n  == 1'b0 ) 
                        begin
                            \P2.P1.P2.RequestPending  <= \P2.P1.P2.NotPending ;
                            \P2.P1.P2.EAX  <= \P2.P1.P2.Datai ;
                            \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 2 );
                            \P2.P1.P2.InstQueueRd_Addr  = ( \P2.P1.P2.InstQueueRd_Addr  + 2 );
                            \P2.P1.P2.Flush  = 1'b0;
                            \P2.P1.P2.More  = 1'b0;
                        end
                    end
                    else
                    begin
                        \P2.P1.P2.Flush  = 1'b0;
                        \P2.P1.P2.More  = 1'b1;
                    end
                end
                \P2.P1.P2.OUT_al :
                begin
                    if ( ( \P2.P1.P2.InstQueueWr_Addr  - \P2.P1.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P2.P1.P2.rEIP  <= ( \P2.P1.P2.InstQueueRd_Addr  + 1 );
                        \P2.P1.P2.RequestPending  <= \P2.P1.P2.Pending ;
                        \P2.P1.P2.ReadRequest  <= \P2.P1.P2.NotPending ;
                        \P2.P1.P2.MemoryFetch  <= \P2.P1.P2.NotPending ;
                        \P2.P1.P2.CodeFetch  <= \P2.P1.P2.NotPending ;
                        if ( ( \P2.P1.P2.State  == \P2.P1.P2.StateT1  ) | ( \P2.P1.P2.State  == \P2.P1.P2.StateT1P  ) ) 
                        begin
                            \P2.P1.P2.fWord  = ( \P2.P1.P2.EAX  % ( 2 ** 16 ) );
                            \P2.P1.P2.Datao  <= \P2.P1.P2.fWord ;
                            if ( \P2.P1.P2.READY_n  == 1'b0 ) 
                            begin
                                \P2.P1.P2.RequestPending  <= \P2.P1.P2.NotPending ;
                                \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 2 );
                                \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 2 ) % 16 );
                                \P2.P1.P2.Flush  = 1'b0;
                                \P2.P1.P2.More  = 1'b0;
                            end
                        end
                    end
                    else
                    begin
                        \P2.P1.P2.Flush  = 1'b0;
                        \P2.P1.P2.More  = 1'b1;
                    end
                end
                \P2.P1.P2.ADD_al_b :
                begin
                    \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 1 );
                    \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P2.Flush  = 1'b0;
                    \P2.P1.P2.More  = 1'b0;
                end
                \P2.P1.P2.ADD_ax_w :
                begin
                    \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 1 );
                    \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P2.Flush  = 1'b0;
                    \P2.P1.P2.More  = 1'b0;
                end
                \P2.P1.P2.ROL_al_1 :
                begin
                    \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 2 );
                    \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 2 ) % 16 );
                    \P2.P1.P2.Flush  = 1'b0;
                    \P2.P1.P2.More  = 1'b0;
                end
                \P2.P1.P2.ROL_al_n :
                begin
                    \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 2 );
                    \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 2 ) % 16 );
                    \P2.P1.P2.Flush  = 1'b0;
                    \P2.P1.P2.More  = 1'b0;
                end
                \P2.P1.P2.INC_eax :
                begin
                    \P2.P1.P2.EAX  <= ( \P2.P1.P2.EAX  + 1 );
                    \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 1 );
                    \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P2.Flush  = 1'b0;
                    \P2.P1.P2.More  = 1'b0;
                end
                \P2.P1.P2.INC_ebx :
                begin
                    \P2.P1.P2.EBX  <= ( \P2.P1.P2.EBX  + 1 );
                    \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 1 );
                    \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P2.Flush  = 1'b0;
                    \P2.P1.P2.More  = 1'b0;
                end
                default :
                begin
                    \P2.P1.P2.InstAddrPointer  = ( \P2.P1.P2.InstAddrPointer  + 1 );
                    \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P2.Flush  = 1'b0;
                    \P2.P1.P2.More  = 1'b0;
                end
                endcase
                if (  ~( ( \P2.P1.P2.InstQueueRd_Addr  < \P2.P1.P2.InstQueueWr_Addr  )) | ( ( ( ( \P2.P1.P2.InstQueueLimit  - \P2.P1.P2.InstQueueRd_Addr  ) < 4 ) | \P2.P1.P2.Flush  ) | \P2.P1.P2.More  ) ) 
                begin
                    \P2.P1.P2.State2  = \P2.P1.P2.S7 ;
                end
            end
            \P2.P1.P2.S6 :
            begin
                \P2.P1.P2.Datao  <= ( ( \P2.P1.P2.uWord  * ( 2 ** 16 ) ) + \P2.P1.P2.lWord  );
                if ( \P2.P1.P2.READY_n  == 1'b0 ) 
                begin
                    \P2.P1.P2.RequestPending  <= \P2.P1.P2.NotPending ;
                    \P2.P1.P2.State2  = \P2.P1.P2.S5 ;
                end
            end
            \P2.P1.P2.S7 :
            begin
                if ( \P2.P1.P2.Flush  ) 
                begin
                    \P2.P1.P2.InstQueueRd_Addr  = 1;
                    \P2.P1.P2.InstQueueWr_Addr  = 1;
                    if ( \P2.P1.P2.InstAddrPointer  < 0 ) 
                    begin
                        \P2.P1.P2.fWord  =  -( \P2.P1.P2.InstAddrPointer );
                    end
                    else
                    begin 
                        \P2.P1.P2.fWord  = \P2.P1.P2.InstAddrPointer ;
                    end
                    if ( ( \P2.P1.P2.fWord  % 2 ) == 1 ) 
                    begin
                        \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + ( \P2.P1.P2.fWord  % 4 ) ) % 16 );
                    end
                end
                if ( ( \P2.P1.P2.InstQueueLimit  - \P2.P1.P2.InstQueueRd_Addr  ) < 3 ) 
                begin
                    \P2.P1.P2.State2  = \P2.P1.P2.S8 ;
                    \P2.P1.P2.InstQueueWr_Addr  = 0;
                end
                else
                begin 
                    \P2.P1.P2.State2  = \P2.P1.P2.S9 ;
                end
            end
            \P2.P1.P2.S8 :
            begin
                if ( \P2.P1.P2.InstQueueRd_Addr  <= \P2.P1.P2.InstQueueLimit  ) 
                begin
                    \P2.P1.P2.InstQueue [\P2.P1.P2.InstQueueWr_Addr ] = \P2.P1.P2.InstQueue [\P2.P1.P2.InstQueueRd_Addr ];
                    \P2.P1.P2.InstQueueRd_Addr  = ( ( \P2.P1.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P2.InstQueueWr_Addr  = ( ( \P2.P1.P2.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P1.P2.State2  = \P2.P1.P2.S8 ;
                end
                else
                begin
                    \P2.P1.P2.InstQueueRd_Addr  = 0;
                    \P2.P1.P2.State2  = \P2.P1.P2.S9 ;
                end
            end
            \P2.P1.P2.S9 :
            begin
                \P2.P1.P2.rEIP  <= \P2.P1.P2.PhyAddrPointer ;
                \P2.P1.P2.State2  = \P2.P1.P2.S1 ;
            end
            endcase
        end
    end
    always @ (  posedge \P2.P1.P2.CLOCK  or  posedge \P2.P1.P2.RESET )
    begin : \P2.P1.P2.P2 
        if ( \P2.P1.P2.RESET  == 1'b1 ) 
        begin
            \P2.P1.P2.ByteEnable  <= 4'b0000;
            \P2.P1.P2.NonAligned  <= 1'b0;
        end
        else
        begin 
            case ( \P2.P1.P2.DataWidth  ) 
            \P2.P1.P2.WidthByte :
            begin
                case ( \P2.P1.P2.rEIP  % 4 ) 
                0:
                begin
                    \P2.P1.P2.ByteEnable  <= 4'b1110;
                end
                1:
                begin
                    \P2.P1.P2.ByteEnable  <= 4'b1101;
                end
                2:
                begin
                    \P2.P1.P2.ByteEnable  <= 4'b1011;
                end
                3:
                begin
                    \P2.P1.P2.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            \P2.P1.P2.WidthWord :
            begin
                case ( \P2.P1.P2.rEIP  % 4 ) 
                0:
                begin
                    \P2.P1.P2.ByteEnable  <= 4'b1100;
                    \P2.P1.P2.NonAligned  <= \P2.P1.P2.NotPending ;
                end
                1:
                begin
                    \P2.P1.P2.ByteEnable  <= 4'b1001;
                    \P2.P1.P2.NonAligned  <= \P2.P1.P2.NotPending ;
                end
                2:
                begin
                    \P2.P1.P2.ByteEnable  <= 4'b0011;
                    \P2.P1.P2.NonAligned  <= \P2.P1.P2.NotPending ;
                end
                3:
                begin
                    \P2.P1.P2.ByteEnable  <= 4'b0111;
                    \P2.P1.P2.NonAligned  <= \P2.P1.P2.Pending ;
                end
                default :
                begin
                end
                endcase
            end
            \P2.P1.P2.WidthDword :
            begin
                case ( \P2.P1.P2.rEIP  % 4 ) 
                0:
                begin
                    \P2.P1.P2.ByteEnable  <= 4'b0000;
                    \P2.P1.P2.NonAligned  <= \P2.P1.P2.NotPending ;
                end
                1:
                begin
                    \P2.P1.P2.ByteEnable  <= 4'b0001;
                    \P2.P1.P2.NonAligned  <= \P2.P1.P2.Pending ;
                end
                2:
                begin
                    \P2.P1.P2.NonAligned  <= \P2.P1.P2.Pending ;
                    \P2.P1.P2.ByteEnable  <= 4'b0011;
                end
                3:
                begin
                    \P2.P1.P2.NonAligned  <= \P2.P1.P2.Pending ;
                    \P2.P1.P2.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            default :
            begin
            end
            endcase
        end
    end
    assign \P2.P1.be3  = \P2.P1.P3.BE_n ;
    assign \P2.P1.addr3  = \P2.P1.P3.Address ;
    assign \P2.P1.wr3  = \P2.P1.P3.W_R_n ;
    assign \P2.P1.dc3  = \P2.P1.P3.D_C_n ;
    assign \P2.P1.mio3  = \P2.P1.P3.M_IO_n ;
    assign \P2.P1.ads3  = \P2.P1.P3.ADS_n ;
    assign \P2.P1.P3.Datai  = \P2.P1.di3 ;
    assign \P2.P1.do3  = \P2.P1.P3.Datao ;
    assign \P2.P1.P3.CLOCK  = \P2.P1.clock ;
    assign \P2.P1.P3.NA_n  = \P2.P1.na ;
    assign \P2.P1.P3.BS16_n  = \P2.P1.bs16 ;
    assign \P2.P1.P3.READY_n  = \P2.P1.rdy3 ;
    assign \P2.P1.P3.HOLD  = \P2.P1.hold ;
    assign \P2.P1.P3.RESET  = \P2.P1.reset ;
    always @ (  posedge \P2.P1.P3.CLOCK  or  posedge \P2.P1.P3.RESET )
    begin : \P2.P1.P3.P0 
        if ( \P2.P1.P3.RESET  == 1'b1 ) 
        begin
            \P2.P1.P3.BE_n  <= 4'b0000;
            \P2.P1.P3.Address  <= 0;
            \P2.P1.P3.W_R_n  <= 1'b0;
            \P2.P1.P3.D_C_n  <= 1'b0;
            \P2.P1.P3.M_IO_n  <= 1'b0;
            \P2.P1.P3.ADS_n  <= 1'b0;
            \P2.P1.P3.State  <= \P2.P1.P3.StateInit ;
            \P2.P1.P3.StateNA  <= 1'b0;
            \P2.P1.P3.StateBS16  <= 1'b0;
            \P2.P1.P3.DataWidth  <= 0;
        end
        else
        begin 
            case ( \P2.P1.P3.State  ) 
            \P2.P1.P3.StateInit :
            begin
                \P2.P1.P3.D_C_n  <= 1'b1;
                \P2.P1.P3.ADS_n  <= 1'b1;
                \P2.P1.P3.State  <= \P2.P1.P3.StateTi ;
                \P2.P1.P3.StateNA  <= 1'b1;
                \P2.P1.P3.StateBS16  <= 1'b1;
                \P2.P1.P3.DataWidth  <= 2;
                \P2.P1.P3.State  <= \P2.P1.P3.StateTi ;
            end
            \P2.P1.P3.StateTi :
            begin
                if ( \P2.P1.P3.RequestPending  == \P2.P1.P3.Pending  ) 
                begin
                    \P2.P1.P3.State  <= \P2.P1.P3.StateT1 ;
                end
                else
                begin 
                    if ( \P2.P1.P3.HOLD  == 1'b1 ) 
                    begin
                        \P2.P1.P3.State  <= \P2.P1.P3.StateTh ;
                    end
                    else
                    begin 
                        \P2.P1.P3.State  <= \P2.P1.P3.StateTi ;
                    end
                end
            end
            \P2.P1.P3.StateT1 :
            begin
                \P2.P1.P3.Address  <= ( ( \P2.P1.P3.rEIP  / 4 ) % ( 2 ** 30 ) );
                \P2.P1.P3.BE_n  <= \P2.P1.P3.ByteEnable ;
                \P2.P1.P3.M_IO_n  <= \P2.P1.P3.MemoryFetch ;
                if ( \P2.P1.P3.ReadRequest  == \P2.P1.P3.Pending  ) 
                begin
                    \P2.P1.P3.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P1.P3.W_R_n  <= 1'b1;
                end
                if ( \P2.P1.P3.CodeFetch  == \P2.P1.P3.Pending  ) 
                begin
                    \P2.P1.P3.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P1.P3.D_C_n  <= 1'b1;
                end
                \P2.P1.P3.ADS_n  <= 1'b0;
                \P2.P1.P3.State  <= \P2.P1.P3.StateT2 ;
            end
            \P2.P1.P3.StateT2 :
            begin
                if ( ( ( \P2.P1.P3.READY_n  == 1'b0 ) & ( \P2.P1.P3.HOLD  == 1'b0 ) ) & ( \P2.P1.P3.RequestPending  == \P2.P1.P3.Pending  ) ) 
                begin
                    \P2.P1.P3.State  <= \P2.P1.P3.StateT1 ;
                end
                else
                begin 
                    if ( ( \P2.P1.P3.READY_n  == 1'b1 ) & ( \P2.P1.P3.NA_n  == 1'b1 ) ) 
                    begin
                    end
                    else
                    begin 
                        if ( ( ( \P2.P1.P3.RequestPending  == \P2.P1.P3.Pending  ) | ( \P2.P1.P3.HOLD  == 1'b1 ) ) & ( ( \P2.P1.P3.READY_n  == 1'b1 ) & ( \P2.P1.P3.NA_n  == 1'b0 ) ) ) 
                        begin
                            \P2.P1.P3.State  <= \P2.P1.P3.StateT2I ;
                        end
                        else
                        begin 
                            if ( ( ( ( \P2.P1.P3.RequestPending  == \P2.P1.P3.Pending  ) & ( \P2.P1.P3.HOLD  == 1'b0 ) ) & ( \P2.P1.P3.READY_n  == 1'b1 ) ) & ( \P2.P1.P3.NA_n  == 1'b0 ) ) 
                            begin
                                \P2.P1.P3.State  <= \P2.P1.P3.StateT2P ;
                            end
                            else
                            begin 
                                if ( ( ( \P2.P1.P3.RequestPending  == \P2.P1.P3.NotPending  ) & ( \P2.P1.P3.HOLD  == 1'b0 ) ) & ( \P2.P1.P3.READY_n  == 1'b0 ) ) 
                                begin
                                    \P2.P1.P3.State  <= \P2.P1.P3.StateTi ;
                                end
                                else
                                begin 
                                    if ( ( \P2.P1.P3.HOLD  == 1'b1 ) & ( \P2.P1.P3.READY_n  == 1'b1 ) ) 
                                    begin
                                        \P2.P1.P3.State  <= \P2.P1.P3.StateTh ;
                                    end
                                    else
                                    begin 
                                        \P2.P1.P3.State  <= \P2.P1.P3.StateT2 ;
                                    end
                                end
                            end
                        end
                    end
                end
                \P2.P1.P3.StateBS16  <= \P2.P1.P3.BS16_n ;
                if ( \P2.P1.P3.BS16_n  == 1'b0 ) 
                begin
                    \P2.P1.P3.DataWidth  <= \P2.P1.P3.WidthWord ;
                end
                else
                begin 
                    \P2.P1.P3.DataWidth  <= \P2.P1.P3.WidthDword ;
                end
                \P2.P1.P3.StateNA  <= \P2.P1.P3.NA_n ;
                \P2.P1.P3.ADS_n  <= 1'b1;
            end
            \P2.P1.P3.StateT1P :
            begin
                if ( ( ( \P2.P1.P3.NA_n  == 1'b0 ) & ( \P2.P1.P3.HOLD  == 1'b0 ) ) & ( \P2.P1.P3.RequestPending  == \P2.P1.P3.Pending  ) ) 
                begin
                    \P2.P1.P3.State  <= \P2.P1.P3.StateT2P ;
                end
                else
                begin 
                    if ( ( \P2.P1.P3.NA_n  == 1'b0 ) & ( ( \P2.P1.P3.HOLD  == 1'b1 ) | ( \P2.P1.P3.RequestPending  == \P2.P1.P3.NotPending  ) ) ) 
                    begin
                        \P2.P1.P3.State  <= \P2.P1.P3.StateT2I ;
                    end
                    else
                    begin 
                        if ( \P2.P1.P3.NA_n  == 1'b1 ) 
                        begin
                            \P2.P1.P3.State  <= \P2.P1.P3.StateT2 ;
                        end
                        else
                        begin 
                            \P2.P1.P3.State  <= \P2.P1.P3.StateT1P ;
                        end
                    end
                end
                \P2.P1.P3.StateBS16  <= \P2.P1.P3.BS16_n ;
                if ( \P2.P1.P3.BS16_n  == 1'b0 ) 
                begin
                    \P2.P1.P3.DataWidth  <= \P2.P1.P3.WidthWord ;
                end
                else
                begin 
                    \P2.P1.P3.DataWidth  <= \P2.P1.P3.WidthDword ;
                end
                \P2.P1.P3.StateNA  <= \P2.P1.P3.NA_n ;
                \P2.P1.P3.ADS_n  <= 1'b1;
            end
            \P2.P1.P3.StateTh :
            begin
                if ( ( \P2.P1.P3.HOLD  == 1'b0 ) & ( \P2.P1.P3.RequestPending  == \P2.P1.P3.Pending  ) ) 
                begin
                    \P2.P1.P3.State  <= \P2.P1.P3.StateT1 ;
                end
                else
                begin 
                    if ( ( \P2.P1.P3.HOLD  == 1'b0 ) & ( \P2.P1.P3.RequestPending  == \P2.P1.P3.NotPending  ) ) 
                    begin
                        \P2.P1.P3.State  <= \P2.P1.P3.StateTi ;
                    end
                    else
                    begin 
                        \P2.P1.P3.State  <= \P2.P1.P3.StateTh ;
                    end
                end
            end
            \P2.P1.P3.StateT2P :
            begin
                \P2.P1.P3.Address  <= ( ( \P2.P1.P3.rEIP  / 2 ) % ( 2 ** 30 ) );
                \P2.P1.P3.BE_n  <= \P2.P1.P3.ByteEnable ;
                \P2.P1.P3.M_IO_n  <= \P2.P1.P3.MemoryFetch ;
                if ( \P2.P1.P3.ReadRequest  == \P2.P1.P3.Pending  ) 
                begin
                    \P2.P1.P3.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P1.P3.W_R_n  <= 1'b1;
                end
                if ( \P2.P1.P3.CodeFetch  == \P2.P1.P3.Pending  ) 
                begin
                    \P2.P1.P3.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P1.P3.D_C_n  <= 1'b1;
                end
                \P2.P1.P3.ADS_n  <= 1'b0;
                if ( \P2.P1.P3.READY_n  == 1'b0 ) 
                begin
                    \P2.P1.P3.State  <= \P2.P1.P3.StateT1P ;
                end
                else
                begin 
                    \P2.P1.P3.State  <= \P2.P1.P3.StateT2P ;
                end
            end
            \P2.P1.P3.StateT2I :
            begin
                if ( ( ( \P2.P1.P3.READY_n  == 1'b1 ) & ( \P2.P1.P3.RequestPending  == \P2.P1.P3.Pending  ) ) & ( \P2.P1.P3.HOLD  == 1'b0 ) ) 
                begin
                    \P2.P1.P3.State  <= \P2.P1.P3.StateT2P ;
                end
                else
                begin 
                    if ( ( \P2.P1.P3.READY_n  == 1'b0 ) & ( \P2.P1.P3.HOLD  == 1'b1 ) ) 
                    begin
                        \P2.P1.P3.State  <= \P2.P1.P3.StateTh ;
                    end
                    else
                    begin 
                        if ( ( ( \P2.P1.P3.READY_n  == 1'b0 ) & ( \P2.P1.P3.HOLD  == 1'b0 ) ) & ( \P2.P1.P3.RequestPending  == \P2.P1.P3.Pending  ) ) 
                        begin
                            \P2.P1.P3.State  <= \P2.P1.P3.StateT1 ;
                        end
                        else
                        begin 
                            if ( ( ( \P2.P1.P3.READY_n  == 1'b0 ) & ( \P2.P1.P3.HOLD  == 1'b0 ) ) & ( \P2.P1.P3.RequestPending  == \P2.P1.P3.NotPending  ) ) 
                            begin
                                \P2.P1.P3.State  <= \P2.P1.P3.StateTi ;
                            end
                            else
                            begin 
                                \P2.P1.P3.State  <= \P2.P1.P3.StateT2I ;
                            end
                        end
                    end
                end
            end
            endcase
        end
    end
    always @ (  posedge \P2.P1.P3.CLOCK  or  posedge \P2.P1.P3.RESET )
    begin : \P2.P1.P3.P1 
        reg [7:0] \P2.P1.P3.InstQueue [15:0];
        reg [4:0] \P2.P1.P3.InstQueueRd_Addr ;
        reg [4:0] \P2.P1.P3.InstQueueWr_Addr ;
        parameter \P2.P1.P3.InstQueueLimit   = 15;
        integer \P2.P1.P3.InstAddrPointer ;
        integer \P2.P1.P3.PhyAddrPointer ;
        reg  \P2.P1.P3.Extended ;
        reg  \P2.P1.P3.More ;
        reg  \P2.P1.P3.Flush ;
        reg [15:0] \P2.P1.P3.lWord ;
        reg [14:0] \P2.P1.P3.uWord ;
        integer \P2.P1.P3.fWord ;
        reg [3:0] \P2.P1.P3.State2 ;
        parameter \P2.P1.P3.Si   = 0;
        parameter \P2.P1.P3.S1   = 1;
        parameter \P2.P1.P3.S2   = 2;
        parameter \P2.P1.P3.S3   = 3;
        parameter \P2.P1.P3.S4   = 4;
        parameter \P2.P1.P3.S5   = 5;
        parameter \P2.P1.P3.S6   = 6;
        parameter \P2.P1.P3.S7   = 7;
        parameter \P2.P1.P3.S8   = 8;
        parameter \P2.P1.P3.S9   = 9;
        if ( \P2.P1.P3.RESET  == 1'b1 ) 
        begin
            \P2.P1.P3.State2  = \P2.P1.P3.Si ;
            \P2.P1.P3.InstQueue  = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            \P2.P1.P3.InstQueueRd_Addr  = 0;
            \P2.P1.P3.InstQueueWr_Addr  = 0;
            \P2.P1.P3.InstAddrPointer  = 0;
            \P2.P1.P3.PhyAddrPointer  = 0;
            \P2.P1.P3.Extended  = 1'b0;
            \P2.P1.P3.More  = 1'b0;
            \P2.P1.P3.Flush  = 1'b0;
            \P2.P1.P3.lWord  = 0;
            \P2.P1.P3.uWord  = 0;
            \P2.P1.P3.fWord  = 0;
            \P2.P1.P3.CodeFetch  <= 1'b0;
            \P2.P1.P3.Datao  <= 0;
            \P2.P1.P3.EAX  <= 0;
            \P2.P1.P3.EBX  <= 0;
            \P2.P1.P3.rEIP  <= 0;
            \P2.P1.P3.ReadRequest  <= 1'b0;
            \P2.P1.P3.MemoryFetch  <= 1'b0;
            \P2.P1.P3.RequestPending  <= 1'b0;
        end
        else
        begin 
            case ( \P2.P1.P3.State2  ) 
            \P2.P1.P3.Si :
            begin
                \P2.P1.P3.PhyAddrPointer  = \P2.P1.P3.rEIP ;
                \P2.P1.P3.InstAddrPointer  = \P2.P1.P3.PhyAddrPointer ;
                \P2.P1.P3.State2  = \P2.P1.P3.S1 ;
                \P2.P1.P3.rEIP  <= 20'hFFFF0;
                \P2.P1.P3.ReadRequest  <= 1'b1;
                \P2.P1.P3.MemoryFetch  <= 1'b1;
                \P2.P1.P3.RequestPending  <= 1'b1;
            end
            \P2.P1.P3.S1 :
            begin
                \P2.P1.P3.RequestPending  <= \P2.P1.P3.Pending ;
                \P2.P1.P3.ReadRequest  <= \P2.P1.P3.Pending ;
                \P2.P1.P3.MemoryFetch  <= \P2.P1.P3.Pending ;
                \P2.P1.P3.CodeFetch  <= \P2.P1.P3.Pending ;
                if ( \P2.P1.P3.READY_n  == 1'b0 ) 
                begin
                    \P2.P1.P3.State2  = \P2.P1.P3.S2 ;
                end
                else
                begin 
                    \P2.P1.P3.State2  = \P2.P1.P3.S1 ;
                end
            end
            \P2.P1.P3.S2 :
            begin
                \P2.P1.P3.RequestPending  <= \P2.P1.P3.NotPending ;
                \P2.P1.P3.InstQueue [\P2.P1.P3.InstQueueWr_Addr ] = ( \P2.P1.P3.Datai  % ( 2 ** 8 ) );
                \P2.P1.P3.InstQueueWr_Addr  = ( ( \P2.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P1.P3.InstQueue [\P2.P1.P3.InstQueueWr_Addr ] = ( \P2.P1.P3.Datai  % ( 2 ** 8 ) );
                \P2.P1.P3.InstQueueWr_Addr  = ( ( \P2.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                if ( \P2.P1.P3.StateBS16  == 1'b1 ) 
                begin
                    \P2.P1.P3.InstQueue [\P2.P1.P3.InstQueueWr_Addr ] = ( ( \P2.P1.P3.Datai  / ( 2 ** 16 ) ) % ( 2 ** 8 ) );
                    \P2.P1.P3.InstQueueWr_Addr  = ( ( \P2.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P1.P3.InstQueue [\P2.P1.P3.InstQueueWr_Addr ] = ( ( \P2.P1.P3.Datai  / ( 2 ** 24 ) ) % ( 2 ** 8 ) );
                    \P2.P1.P3.InstQueueWr_Addr  = ( ( \P2.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P1.P3.PhyAddrPointer  = ( \P2.P1.P3.PhyAddrPointer  + 4 );
                    \P2.P1.P3.State2  = \P2.P1.P3.S5 ;
                end
                else
                begin
                    \P2.P1.P3.PhyAddrPointer  = ( \P2.P1.P3.PhyAddrPointer  + 2 );
                    if ( \P2.P1.P3.PhyAddrPointer  < 0 ) 
                    begin
                        \P2.P1.P3.rEIP  <=  -( \P2.P1.P3.PhyAddrPointer );
                    end
                    else
                    begin 
                        \P2.P1.P3.rEIP  <= \P2.P1.P3.PhyAddrPointer ;
                    end
                    \P2.P1.P3.State2  = \P2.P1.P3.S3 ;
                end
            end
            \P2.P1.P3.S3 :
            begin
                \P2.P1.P3.RequestPending  <= \P2.P1.P3.Pending ;
                if ( \P2.P1.P3.READY_n  == 1'b0 ) 
                begin
                    \P2.P1.P3.State2  = \P2.P1.P3.S4 ;
                end
                else
                begin 
                    \P2.P1.P3.State2  = \P2.P1.P3.S3 ;
                end
            end
            \P2.P1.P3.S4 :
            begin
                \P2.P1.P3.RequestPending  <= \P2.P1.P3.NotPending ;
                \P2.P1.P3.InstQueue [\P2.P1.P3.InstQueueWr_Addr ] = ( \P2.P1.P3.Datai  % ( 2 ** 8 ) );
                \P2.P1.P3.InstQueueWr_Addr  = ( ( \P2.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P1.P3.InstQueue [\P2.P1.P3.InstQueueWr_Addr ] = ( \P2.P1.P3.Datai  % ( 2 ** 8 ) );
                \P2.P1.P3.InstQueueWr_Addr  = ( ( \P2.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P1.P3.PhyAddrPointer  = ( \P2.P1.P3.PhyAddrPointer  + 2 );
                \P2.P1.P3.State2  = \P2.P1.P3.S5 ;
            end
            \P2.P1.P3.S5 :
            begin
                case ( \P2.P1.P3.InstQueue [\P2.P1.P3.InstQueueRd_Addr ] ) 
                \P2.P1.P3.NOP :
                begin
                    \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 1 );
                    \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P3.Flush  = 1'b0;
                    \P2.P1.P3.More  = 1'b0;
                end
                \P2.P1.P3.OPsop :
                begin
                    \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 1 );
                    \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P3.Extended  = 1'b1;
                    \P2.P1.P3.Flush  = 1'b0;
                    \P2.P1.P3.More  = 1'b0;
                end
                \P2.P1.P3.JMP_rel_short :
                begin
                    if ( ( \P2.P1.P3.InstQueueWr_Addr  - \P2.P1.P3.InstQueueRd_Addr  ) >= 3 ) 
                    begin
                        if ( \P2.P1.P3.InstQueue [( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 )] > 127 ) 
                        begin
                            \P2.P1.P3.PhyAddrPointer  = ( ( \P2.P1.P3.InstAddrPointer  + 1 ) - ( 8'hFF - \P2.P1.P3.InstQueue [( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 )] ) );
                            \P2.P1.P3.InstAddrPointer  = \P2.P1.P3.PhyAddrPointer ;
                        end
                        else
                        begin
                            \P2.P1.P3.PhyAddrPointer  = ( ( \P2.P1.P3.InstAddrPointer  + 2 ) + \P2.P1.P3.InstQueue [( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 )] );
                            \P2.P1.P3.InstAddrPointer  = \P2.P1.P3.PhyAddrPointer ;
                        end
                        \P2.P1.P3.Flush  = 1'b1;
                        \P2.P1.P3.More  = 1'b0;
                    end
                    else
                    begin
                        \P2.P1.P3.Flush  = 1'b0;
                        \P2.P1.P3.More  = 1'b1;
                    end
                end
                \P2.P1.P3.JMP_rel_near :
                begin
                    if ( ( \P2.P1.P3.InstQueueWr_Addr  - \P2.P1.P3.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P1.P3.PhyAddrPointer  = ( ( \P2.P1.P3.InstAddrPointer  + 5 ) + \P2.P1.P3.InstQueue [( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P2.P1.P3.InstAddrPointer  = \P2.P1.P3.PhyAddrPointer ;
                        \P2.P1.P3.Flush  = 1'b1;
                        \P2.P1.P3.More  = 1'b0;
                    end
                    else
                    begin
                        \P2.P1.P3.Flush  = 1'b0;
                        \P2.P1.P3.More  = 1'b1;
                    end
                end
                \P2.P1.P3.JMP_intseg_immed :
                begin
                    \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 1 );
                    \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P3.Flush  = 1'b0;
                    \P2.P1.P3.More  = 1'b0;
                end
                \P2.P1.P3.MOV_al_b :
                begin
                    \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 1 );
                    \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P3.Flush  = 1'b0;
                    \P2.P1.P3.More  = 1'b0;
                end
                \P2.P1.P3.MOV_eax_dw :
                begin
                    if ( ( \P2.P1.P3.InstQueueWr_Addr  - \P2.P1.P3.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P1.P3.EAX  <= ( ( ( ( \P2.P1.P3.InstQueue [( ( \P2.P1.P3.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P2.P1.P3.InstQueue [( ( \P2.P1.P3.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P2.P1.P3.InstQueue [( ( \P2.P1.P3.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P2.P1.P3.InstQueue [( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P2.P1.P3.More  = 1'b0;
                        \P2.P1.P3.Flush  = 1'b0;
                        \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 5 );
                        \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P2.P1.P3.Flush  = 1'b0;
                        \P2.P1.P3.More  = 1'b1;
                    end
                end
                \P2.P1.P3.MOV_ebx_dw :
                begin
                    if ( ( \P2.P1.P3.InstQueueWr_Addr  - \P2.P1.P3.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P1.P3.EBX  <= ( ( ( ( \P2.P1.P3.InstQueue [( ( \P2.P1.P3.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P2.P1.P3.InstQueue [( ( \P2.P1.P3.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P2.P1.P3.InstQueue [( ( \P2.P1.P3.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P2.P1.P3.InstQueue [( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 1 )] );
                        \P2.P1.P3.More  = 1'b0;
                        \P2.P1.P3.Flush  = 1'b0;
                        \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 5 );
                        \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P2.P1.P3.Flush  = 1'b0;
                        \P2.P1.P3.More  = 1'b1;
                    end
                end
                \P2.P1.P3.MOV_eax_ebx :
                begin
                    if ( ( \P2.P1.P3.InstQueueWr_Addr  - \P2.P1.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P2.P1.P3.EBX  < 0 ) 
                        begin
                            \P2.P1.P3.rEIP  <=  -( \P2.P1.P3.EBX );
                        end
                        else
                        begin 
                            \P2.P1.P3.rEIP  <= \P2.P1.P3.EBX ;
                        end
                        \P2.P1.P3.RequestPending  <= \P2.P1.P3.Pending ;
                        \P2.P1.P3.ReadRequest  <= \P2.P1.P3.Pending ;
                        \P2.P1.P3.MemoryFetch  <= \P2.P1.P3.Pending ;
                        \P2.P1.P3.CodeFetch  <= \P2.P1.P3.NotPending ;
                        if ( \P2.P1.P3.READY_n  == 1'b0 ) 
                        begin
                            \P2.P1.P3.RequestPending  <= \P2.P1.P3.NotPending ;
                            \P2.P1.P3.uWord  = ( \P2.P1.P3.Datai  % ( 2 ** 15 ) );
                            if ( \P2.P1.P3.StateBS16  == 1'b1 ) 
                            begin
                                \P2.P1.P3.lWord  = ( \P2.P1.P3.Datai  % ( 2 ** 16 ) );
                            end
                            else
                            begin
                                \P2.P1.P3.rEIP  <= ( \P2.P1.P3.rEIP  + 2 );
                                \P2.P1.P3.RequestPending  <= \P2.P1.P3.Pending ;
                                if ( \P2.P1.P3.READY_n  == 1'b0 ) 
                                begin
                                    \P2.P1.P3.RequestPending  <= \P2.P1.P3.NotPending ;
                                    \P2.P1.P3.lWord  = ( \P2.P1.P3.Datai  % ( 2 ** 16 ) );
                                end
                            end
                            if ( \P2.P1.P3.READY_n  == 1'b0 ) 
                            begin
                                \P2.P1.P3.EAX  <= ( ( \P2.P1.P3.uWord  * ( 2 ** 16 ) ) + \P2.P1.P3.lWord  );
                                \P2.P1.P3.More  = 1'b0;
                                \P2.P1.P3.Flush  = 1'b0;
                                \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 2 );
                                \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P2.P1.P3.Flush  = 1'b0;
                        \P2.P1.P3.More  = 1'b1;
                    end
                end
                \P2.P1.P3.MOV_ebx_eax :
                begin
                    if ( ( \P2.P1.P3.InstQueueWr_Addr  - \P2.P1.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P2.P1.P3.EBX  < 0 ) 
                        begin
                            \P2.P1.P3.rEIP  <= \P2.P1.P3.EBX ;
                        end
                        else
                        begin 
                            \P2.P1.P3.rEIP  <= \P2.P1.P3.EBX ;
                        end
                        \P2.P1.P3.lWord  = ( \P2.P1.P3.EAX  % ( 2 ** 16 ) );
                        \P2.P1.P3.uWord  = ( ( \P2.P1.P3.EAX  / ( 2 ** 16 ) ) % ( 2 ** 15 ) );
                        \P2.P1.P3.RequestPending  <= \P2.P1.P3.Pending ;
                        \P2.P1.P3.ReadRequest  <= \P2.P1.P3.NotPending ;
                        \P2.P1.P3.MemoryFetch  <= \P2.P1.P3.Pending ;
                        \P2.P1.P3.CodeFetch  <= \P2.P1.P3.NotPending ;
                        if ( ( \P2.P1.P3.State  == \P2.P1.P3.StateT1  ) | ( \P2.P1.P3.State  == \P2.P1.P3.StateT1P  ) ) 
                        begin
                            \P2.P1.P3.Datao  <= ( ( \P2.P1.P3.uWord  * ( 2 ** 16 ) ) + \P2.P1.P3.lWord  );
                            if ( \P2.P1.P3.READY_n  == 1'b0 ) 
                            begin
                                \P2.P1.P3.RequestPending  <= \P2.P1.P3.NotPending ;
                                if ( \P2.P1.P3.StateBS16  == 1'b0 ) 
                                begin
                                    \P2.P1.P3.rEIP  <= ( \P2.P1.P3.rEIP  + 2 );
                                    \P2.P1.P3.RequestPending  <= \P2.P1.P3.Pending ;
                                    \P2.P1.P3.ReadRequest  <= \P2.P1.P3.NotPending ;
                                    \P2.P1.P3.MemoryFetch  <= \P2.P1.P3.Pending ;
                                    \P2.P1.P3.CodeFetch  <= \P2.P1.P3.NotPending ;
                                    \P2.P1.P3.State2  = \P2.P1.P3.S6 ;
                                end
                                \P2.P1.P3.More  = 1'b0;
                                \P2.P1.P3.Flush  = 1'b0;
                                \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 2 );
                                \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P2.P1.P3.Flush  = 1'b0;
                        \P2.P1.P3.More  = 1'b1;
                    end
                end
                \P2.P1.P3.IN_al :
                begin
                    if ( ( \P2.P1.P3.InstQueueWr_Addr  - \P2.P1.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P2.P1.P3.rEIP  <= ( \P2.P1.P3.InstQueueRd_Addr  + 1 );
                        \P2.P1.P3.RequestPending  <= \P2.P1.P3.Pending ;
                        \P2.P1.P3.ReadRequest  <= \P2.P1.P3.Pending ;
                        \P2.P1.P3.MemoryFetch  <= \P2.P1.P3.NotPending ;
                        \P2.P1.P3.CodeFetch  <= \P2.P1.P3.NotPending ;
                        if ( \P2.P1.P3.READY_n  == 1'b0 ) 
                        begin
                            \P2.P1.P3.RequestPending  <= \P2.P1.P3.NotPending ;
                            \P2.P1.P3.EAX  <= \P2.P1.P3.Datai ;
                            \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 2 );
                            \P2.P1.P3.InstQueueRd_Addr  = ( \P2.P1.P3.InstQueueRd_Addr  + 2 );
                            \P2.P1.P3.Flush  = 1'b0;
                            \P2.P1.P3.More  = 1'b0;
                        end
                    end
                    else
                    begin
                        \P2.P1.P3.Flush  = 1'b0;
                        \P2.P1.P3.More  = 1'b1;
                    end
                end
                \P2.P1.P3.OUT_al :
                begin
                    if ( ( \P2.P1.P3.InstQueueWr_Addr  - \P2.P1.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P2.P1.P3.rEIP  <= ( \P2.P1.P3.InstQueueRd_Addr  + 1 );
                        \P2.P1.P3.RequestPending  <= \P2.P1.P3.Pending ;
                        \P2.P1.P3.ReadRequest  <= \P2.P1.P3.NotPending ;
                        \P2.P1.P3.MemoryFetch  <= \P2.P1.P3.NotPending ;
                        \P2.P1.P3.CodeFetch  <= \P2.P1.P3.NotPending ;
                        if ( ( \P2.P1.P3.State  == \P2.P1.P3.StateT1  ) | ( \P2.P1.P3.State  == \P2.P1.P3.StateT1P  ) ) 
                        begin
                            \P2.P1.P3.fWord  = ( \P2.P1.P3.EAX  % ( 2 ** 16 ) );
                            \P2.P1.P3.Datao  <= \P2.P1.P3.fWord ;
                            if ( \P2.P1.P3.READY_n  == 1'b0 ) 
                            begin
                                \P2.P1.P3.RequestPending  <= \P2.P1.P3.NotPending ;
                                \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 2 );
                                \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 2 ) % 16 );
                                \P2.P1.P3.Flush  = 1'b0;
                                \P2.P1.P3.More  = 1'b0;
                            end
                        end
                    end
                    else
                    begin
                        \P2.P1.P3.Flush  = 1'b0;
                        \P2.P1.P3.More  = 1'b1;
                    end
                end
                \P2.P1.P3.ADD_al_b :
                begin
                    \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 1 );
                    \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P3.Flush  = 1'b0;
                    \P2.P1.P3.More  = 1'b0;
                end
                \P2.P1.P3.ADD_ax_w :
                begin
                    \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 1 );
                    \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P3.Flush  = 1'b0;
                    \P2.P1.P3.More  = 1'b0;
                end
                \P2.P1.P3.ROL_al_1 :
                begin
                    \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 2 );
                    \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 2 ) % 16 );
                    \P2.P1.P3.Flush  = 1'b0;
                    \P2.P1.P3.More  = 1'b0;
                end
                \P2.P1.P3.ROL_al_n :
                begin
                    \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 2 );
                    \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 2 ) % 16 );
                    \P2.P1.P3.Flush  = 1'b0;
                    \P2.P1.P3.More  = 1'b0;
                end
                \P2.P1.P3.INC_eax :
                begin
                    \P2.P1.P3.EAX  <= ( \P2.P1.P3.EAX  + 1 );
                    \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 1 );
                    \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P3.Flush  = 1'b0;
                    \P2.P1.P3.More  = 1'b0;
                end
                \P2.P1.P3.INC_ebx :
                begin
                    \P2.P1.P3.EBX  <= ( \P2.P1.P3.EBX  + 1 );
                    \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 1 );
                    \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P3.Flush  = 1'b0;
                    \P2.P1.P3.More  = 1'b0;
                end
                default :
                begin
                    \P2.P1.P3.InstAddrPointer  = ( \P2.P1.P3.InstAddrPointer  + 1 );
                    \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P3.Flush  = 1'b0;
                    \P2.P1.P3.More  = 1'b0;
                end
                endcase
                if (  ~( ( \P2.P1.P3.InstQueueRd_Addr  < \P2.P1.P3.InstQueueWr_Addr  )) | ( ( ( ( \P2.P1.P3.InstQueueLimit  - \P2.P1.P3.InstQueueRd_Addr  ) < 4 ) | \P2.P1.P3.Flush  ) | \P2.P1.P3.More  ) ) 
                begin
                    \P2.P1.P3.State2  = \P2.P1.P3.S7 ;
                end
            end
            \P2.P1.P3.S6 :
            begin
                \P2.P1.P3.Datao  <= ( ( \P2.P1.P3.uWord  * ( 2 ** 16 ) ) + \P2.P1.P3.lWord  );
                if ( \P2.P1.P3.READY_n  == 1'b0 ) 
                begin
                    \P2.P1.P3.RequestPending  <= \P2.P1.P3.NotPending ;
                    \P2.P1.P3.State2  = \P2.P1.P3.S5 ;
                end
            end
            \P2.P1.P3.S7 :
            begin
                if ( \P2.P1.P3.Flush  ) 
                begin
                    \P2.P1.P3.InstQueueRd_Addr  = 1;
                    \P2.P1.P3.InstQueueWr_Addr  = 1;
                    if ( \P2.P1.P3.InstAddrPointer  < 0 ) 
                    begin
                        \P2.P1.P3.fWord  =  -( \P2.P1.P3.InstAddrPointer );
                    end
                    else
                    begin 
                        \P2.P1.P3.fWord  = \P2.P1.P3.InstAddrPointer ;
                    end
                    if ( ( \P2.P1.P3.fWord  % 2 ) == 1 ) 
                    begin
                        \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + ( \P2.P1.P3.fWord  % 4 ) ) % 16 );
                    end
                end
                if ( ( \P2.P1.P3.InstQueueLimit  - \P2.P1.P3.InstQueueRd_Addr  ) < 3 ) 
                begin
                    \P2.P1.P3.State2  = \P2.P1.P3.S8 ;
                    \P2.P1.P3.InstQueueWr_Addr  = 0;
                end
                else
                begin 
                    \P2.P1.P3.State2  = \P2.P1.P3.S9 ;
                end
            end
            \P2.P1.P3.S8 :
            begin
                if ( \P2.P1.P3.InstQueueRd_Addr  <= \P2.P1.P3.InstQueueLimit  ) 
                begin
                    \P2.P1.P3.InstQueue [\P2.P1.P3.InstQueueWr_Addr ] = \P2.P1.P3.InstQueue [\P2.P1.P3.InstQueueRd_Addr ];
                    \P2.P1.P3.InstQueueRd_Addr  = ( ( \P2.P1.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P1.P3.InstQueueWr_Addr  = ( ( \P2.P1.P3.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P1.P3.State2  = \P2.P1.P3.S8 ;
                end
                else
                begin
                    \P2.P1.P3.InstQueueRd_Addr  = 0;
                    \P2.P1.P3.State2  = \P2.P1.P3.S9 ;
                end
            end
            \P2.P1.P3.S9 :
            begin
                \P2.P1.P3.rEIP  <= \P2.P1.P3.PhyAddrPointer ;
                \P2.P1.P3.State2  = \P2.P1.P3.S1 ;
            end
            endcase
        end
    end
    always @ (  posedge \P2.P1.P3.CLOCK  or  posedge \P2.P1.P3.RESET )
    begin : \P2.P1.P3.P2 
        if ( \P2.P1.P3.RESET  == 1'b1 ) 
        begin
            \P2.P1.P3.ByteEnable  <= 4'b0000;
            \P2.P1.P3.NonAligned  <= 1'b0;
        end
        else
        begin 
            case ( \P2.P1.P3.DataWidth  ) 
            \P2.P1.P3.WidthByte :
            begin
                case ( \P2.P1.P3.rEIP  % 4 ) 
                0:
                begin
                    \P2.P1.P3.ByteEnable  <= 4'b1110;
                end
                1:
                begin
                    \P2.P1.P3.ByteEnable  <= 4'b1101;
                end
                2:
                begin
                    \P2.P1.P3.ByteEnable  <= 4'b1011;
                end
                3:
                begin
                    \P2.P1.P3.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            \P2.P1.P3.WidthWord :
            begin
                case ( \P2.P1.P3.rEIP  % 4 ) 
                0:
                begin
                    \P2.P1.P3.ByteEnable  <= 4'b1100;
                    \P2.P1.P3.NonAligned  <= \P2.P1.P3.NotPending ;
                end
                1:
                begin
                    \P2.P1.P3.ByteEnable  <= 4'b1001;
                    \P2.P1.P3.NonAligned  <= \P2.P1.P3.NotPending ;
                end
                2:
                begin
                    \P2.P1.P3.ByteEnable  <= 4'b0011;
                    \P2.P1.P3.NonAligned  <= \P2.P1.P3.NotPending ;
                end
                3:
                begin
                    \P2.P1.P3.ByteEnable  <= 4'b0111;
                    \P2.P1.P3.NonAligned  <= \P2.P1.P3.Pending ;
                end
                default :
                begin
                end
                endcase
            end
            \P2.P1.P3.WidthDword :
            begin
                case ( \P2.P1.P3.rEIP  % 4 ) 
                0:
                begin
                    \P2.P1.P3.ByteEnable  <= 4'b0000;
                    \P2.P1.P3.NonAligned  <= \P2.P1.P3.NotPending ;
                end
                1:
                begin
                    \P2.P1.P3.ByteEnable  <= 4'b0001;
                    \P2.P1.P3.NonAligned  <= \P2.P1.P3.Pending ;
                end
                2:
                begin
                    \P2.P1.P3.NonAligned  <= \P2.P1.P3.Pending ;
                    \P2.P1.P3.ByteEnable  <= 4'b0011;
                end
                3:
                begin
                    \P2.P1.P3.NonAligned  <= \P2.P1.P3.Pending ;
                    \P2.P1.P3.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            default :
            begin
            end
            endcase
        end
    end
    assign \P2.P2.clock  = \P2.clock ;
    assign \P2.P2.reset  = \P2.reset ;
    assign \P2.P2.datai  = \P2.di2 ;
    assign \P2.do2  = \P2.P2.datao ;
    assign \P2.P2.hold  = \P2.hold ;
    assign \P2.P2.na  = \P2.na ;
    assign \P2.P2.bs16  = \P2.bs ;
    assign \P2.ad21  = \P2.P2.address1 ;
    assign \P2.ad22  = \P2.P2.address2 ;
    assign \P2.wr2  = \P2.P2.wr ;
    assign \P2.dc2  = \P2.P2.dc ;
    assign \P2.mio2  = \P2.P2.mio ;
    assign \P2.as21  = \P2.P2.ast1 ;
    assign \P2.as22  = \P2.P2.ast2 ;
    assign \P2.P2.ready1  = \P2.r21 ;
    assign \P2.P2.ready2  = \P2.r22 ;
    always @ (  posedge \P2.P2.clock  or  posedge \P2.P2.reset )
    begin
        if ( \P2.P2.reset  == 1'b1 ) 
        begin
            \P2.P2.buf1  <= 0;
            \P2.P2.ready11  <= 1'b0;
            \P2.P2.ready12  <= 1'b0;
        end
        else
        begin
            if ( ( ( ( ( ( \P2.P2.addr1  > ( 2 ** 29 ) ) & ( \P2.P2.ads1  == 1'b0 ) ) & ( \P2.P2.mio1  == 1'b1 ) ) & ( \P2.P2.dc1  == 1'b0 ) ) & ( \P2.P2.wr1  == 1'b1 ) ) & ( \P2.P2.be1  == 4'b0000 ) ) 
            begin
                \P2.P2.buf1  <= \P2.P2.do1 ;
                \P2.P2.ready11  <= 1'b0;
                \P2.P2.ready12  <= 1'b1;
            end
            else
            begin 
                if ( ( ( ( ( ( \P2.P2.addr2  > ( 2 ** 29 ) ) & ( \P2.P2.ads2  == 1'b0 ) ) & ( \P2.P2.mio2  == 1'b1 ) ) & ( \P2.P2.dc2  == 1'b0 ) ) & ( \P2.P2.wr2  == 1'b1 ) ) & ( \P2.P2.be2  == 4'b0000 ) ) 
                begin
                    \P2.P2.buf1  <= \P2.P2.do2 ;
                    \P2.P2.ready11  <= 1'b1;
                    \P2.P2.ready12  <= 1'b0;
                end
                else
                begin
                    \P2.P2.ready11  <= 1'b1;
                    \P2.P2.ready12  <= 1'b1;
                end
            end
        end
    end
    always @ (  posedge \P2.P2.clock  or  posedge \P2.P2.reset )
    begin
        if ( \P2.P2.reset  == 1'b1 ) 
        begin
            \P2.P2.buf2  <= 0;
            \P2.P2.ready21  <= 1'b0;
            \P2.P2.ready22  <= 1'b0;
        end
        else
        begin
            if ( ( ( ( ( ( \P2.P2.addr2  < ( 2 ** 29 ) ) & ( \P2.P2.ads2  == 1'b0 ) ) & ( \P2.P2.mio2  == 1'b1 ) ) & ( \P2.P2.dc2  == 1'b0 ) ) & ( \P2.P2.wr2  == 1'b1 ) ) & ( \P2.P2.be2  == 4'b0000 ) ) 
            begin
                \P2.P2.buf2  <= \P2.P2.do2 ;
                \P2.P2.ready21  <= 1'b0;
                \P2.P2.ready22  <= 1'b1;
            end
            else
            begin 
                if ( ( ( ( ( \P2.P2.ads3  == 1'b0 ) & ( \P2.P2.mio3  == 1'b1 ) ) & ( \P2.P2.dc3  == 1'b0 ) ) & ( \P2.P2.wr3  == 1'b0 ) ) & ( \P2.P2.be3  == 4'b0000 ) ) 
                begin
                    \P2.P2.ready21  <= 1'b1;
                    \P2.P2.ready22  <= 1'b0;
                end
                else
                begin
                    \P2.P2.ready21  <= 1'b1;
                    \P2.P2.ready22  <= 1'b1;
                end
            end
        end
    end
    always @ (  \P2.P2.addr1  or  \P2.P2.buf1  or  \P2.P2.datai )
    begin
        if ( \P2.P2.addr1  > ( 2 ** 29 ) ) 
        begin
            \P2.P2.di1  <= \P2.P2.buf1 ;
        end
        else
        begin 
            \P2.P2.di1  <= \P2.P2.datai ;
        end
    end
    always @ (  \P2.P2.addr2  or  \P2.P2.buf1  or  \P2.P2.buf2 )
    begin
        if ( \P2.P2.addr2  > ( 2 ** 29 ) ) 
        begin
            \P2.P2.di2  <= \P2.P2.buf1 ;
        end
        else
        begin 
            \P2.P2.di2  <= \P2.P2.buf2 ;
        end
    end
    always @ (  \P2.P2.addr2  or  \P2.P2.addr3  or  \P2.P2.do1  or  \P2.P2.do2  or  \P2.P2.do3 )
    begin
        if ( ( ( \P2.P2.do1  < ( 2 ** 30 ) ) & ( \P2.P2.do2  < ( 2 ** 30 ) ) ) & ( \P2.P2.do3  < ( 2 ** 30 ) ) ) 
        begin
            \P2.P2.address2  <= \P2.P2.addr3 ;
        end
        else
        begin 
            \P2.P2.address2  <= \P2.P2.addr2 ;
        end
    end
    always @ (  \P2.P2.buf2  or  \P2.P2.do3  or  \P2.P2.addr1  or  \P2.P2.wr3  or  \P2.P2.dc3  or  \P2.P2.mio3  or  \P2.P2.ads1  or  \P2.P2.ads3  or  \P2.P2.ready1  or  \P2.P2.ready2  or  \P2.P2.ready11  or  \P2.P2.ready12  or  \P2.P2.ready21  or  \P2.P2.ready22 )
    begin
        \P2.P2.di3  <= \P2.P2.buf2 ;
        \P2.P2.datao  <= \P2.P2.do3 ;
        \P2.P2.address1  <= \P2.P2.addr1 ;
        \P2.P2.wr  <= \P2.P2.wr3 ;
        \P2.P2.dc  <= \P2.P2.dc3 ;
        \P2.P2.mio  <= \P2.P2.mio3 ;
        \P2.P2.ast1  <= \P2.P2.ads1 ;
        \P2.P2.ast2  <= \P2.P2.ads3 ;
        \P2.P2.rdy1  <= ( \P2.P2.ready11  & \P2.P2.ready1  );
        \P2.P2.rdy2  <= ( \P2.P2.ready12  & \P2.P2.ready21  );
        \P2.P2.rdy3  <= ( \P2.P2.ready22  & \P2.P2.ready2  );
    end
    assign \P2.P2.be1  = \P2.P2.P1.BE_n ;
    assign \P2.P2.addr1  = \P2.P2.P1.Address ;
    assign \P2.P2.wr1  = \P2.P2.P1.W_R_n ;
    assign \P2.P2.dc1  = \P2.P2.P1.D_C_n ;
    assign \P2.P2.mio1  = \P2.P2.P1.M_IO_n ;
    assign \P2.P2.ads1  = \P2.P2.P1.ADS_n ;
    assign \P2.P2.P1.Datai  = \P2.P2.di1 ;
    assign \P2.P2.do1  = \P2.P2.P1.Datao ;
    assign \P2.P2.P1.CLOCK  = \P2.P2.clock ;
    assign \P2.P2.P1.NA_n  = \P2.P2.na ;
    assign \P2.P2.P1.BS16_n  = \P2.P2.bs16 ;
    assign \P2.P2.P1.READY_n  = \P2.P2.rdy1 ;
    assign \P2.P2.P1.HOLD  = \P2.P2.hold ;
    assign \P2.P2.P1.RESET  = \P2.P2.reset ;
    always @ (  posedge \P2.P2.P1.CLOCK  or  posedge \P2.P2.P1.RESET )
    begin : \P2.P2.P1.P0 
        if ( \P2.P2.P1.RESET  == 1'b1 ) 
        begin
            \P2.P2.P1.BE_n  <= 4'b0000;
            \P2.P2.P1.Address  <= 0;
            \P2.P2.P1.W_R_n  <= 1'b0;
            \P2.P2.P1.D_C_n  <= 1'b0;
            \P2.P2.P1.M_IO_n  <= 1'b0;
            \P2.P2.P1.ADS_n  <= 1'b0;
            \P2.P2.P1.State  <= \P2.P2.P1.StateInit ;
            \P2.P2.P1.StateNA  <= 1'b0;
            \P2.P2.P1.StateBS16  <= 1'b0;
            \P2.P2.P1.DataWidth  <= 0;
        end
        else
        begin 
            case ( \P2.P2.P1.State  ) 
            \P2.P2.P1.StateInit :
            begin
                \P2.P2.P1.D_C_n  <= 1'b1;
                \P2.P2.P1.ADS_n  <= 1'b1;
                \P2.P2.P1.State  <= \P2.P2.P1.StateTi ;
                \P2.P2.P1.StateNA  <= 1'b1;
                \P2.P2.P1.StateBS16  <= 1'b1;
                \P2.P2.P1.DataWidth  <= 2;
                \P2.P2.P1.State  <= \P2.P2.P1.StateTi ;
            end
            \P2.P2.P1.StateTi :
            begin
                if ( \P2.P2.P1.RequestPending  == \P2.P2.P1.Pending  ) 
                begin
                    \P2.P2.P1.State  <= \P2.P2.P1.StateT1 ;
                end
                else
                begin 
                    if ( \P2.P2.P1.HOLD  == 1'b1 ) 
                    begin
                        \P2.P2.P1.State  <= \P2.P2.P1.StateTh ;
                    end
                    else
                    begin 
                        \P2.P2.P1.State  <= \P2.P2.P1.StateTi ;
                    end
                end
            end
            \P2.P2.P1.StateT1 :
            begin
                \P2.P2.P1.Address  <= ( ( \P2.P2.P1.rEIP  / 4 ) % ( 2 ** 30 ) );
                \P2.P2.P1.BE_n  <= \P2.P2.P1.ByteEnable ;
                \P2.P2.P1.M_IO_n  <= \P2.P2.P1.MemoryFetch ;
                if ( \P2.P2.P1.ReadRequest  == \P2.P2.P1.Pending  ) 
                begin
                    \P2.P2.P1.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P2.P1.W_R_n  <= 1'b1;
                end
                if ( \P2.P2.P1.CodeFetch  == \P2.P2.P1.Pending  ) 
                begin
                    \P2.P2.P1.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P2.P1.D_C_n  <= 1'b1;
                end
                \P2.P2.P1.ADS_n  <= 1'b0;
                \P2.P2.P1.State  <= \P2.P2.P1.StateT2 ;
            end
            \P2.P2.P1.StateT2 :
            begin
                if ( ( ( \P2.P2.P1.READY_n  == 1'b0 ) & ( \P2.P2.P1.HOLD  == 1'b0 ) ) & ( \P2.P2.P1.RequestPending  == \P2.P2.P1.Pending  ) ) 
                begin
                    \P2.P2.P1.State  <= \P2.P2.P1.StateT1 ;
                end
                else
                begin 
                    if ( ( \P2.P2.P1.READY_n  == 1'b1 ) & ( \P2.P2.P1.NA_n  == 1'b1 ) ) 
                    begin
                    end
                    else
                    begin 
                        if ( ( ( \P2.P2.P1.RequestPending  == \P2.P2.P1.Pending  ) | ( \P2.P2.P1.HOLD  == 1'b1 ) ) & ( ( \P2.P2.P1.READY_n  == 1'b1 ) & ( \P2.P2.P1.NA_n  == 1'b0 ) ) ) 
                        begin
                            \P2.P2.P1.State  <= \P2.P2.P1.StateT2I ;
                        end
                        else
                        begin 
                            if ( ( ( ( \P2.P2.P1.RequestPending  == \P2.P2.P1.Pending  ) & ( \P2.P2.P1.HOLD  == 1'b0 ) ) & ( \P2.P2.P1.READY_n  == 1'b1 ) ) & ( \P2.P2.P1.NA_n  == 1'b0 ) ) 
                            begin
                                \P2.P2.P1.State  <= \P2.P2.P1.StateT2P ;
                            end
                            else
                            begin 
                                if ( ( ( \P2.P2.P1.RequestPending  == \P2.P2.P1.NotPending  ) & ( \P2.P2.P1.HOLD  == 1'b0 ) ) & ( \P2.P2.P1.READY_n  == 1'b0 ) ) 
                                begin
                                    \P2.P2.P1.State  <= \P2.P2.P1.StateTi ;
                                end
                                else
                                begin 
                                    if ( ( \P2.P2.P1.HOLD  == 1'b1 ) & ( \P2.P2.P1.READY_n  == 1'b1 ) ) 
                                    begin
                                        \P2.P2.P1.State  <= \P2.P2.P1.StateTh ;
                                    end
                                    else
                                    begin 
                                        \P2.P2.P1.State  <= \P2.P2.P1.StateT2 ;
                                    end
                                end
                            end
                        end
                    end
                end
                \P2.P2.P1.StateBS16  <= \P2.P2.P1.BS16_n ;
                if ( \P2.P2.P1.BS16_n  == 1'b0 ) 
                begin
                    \P2.P2.P1.DataWidth  <= \P2.P2.P1.WidthWord ;
                end
                else
                begin 
                    \P2.P2.P1.DataWidth  <= \P2.P2.P1.WidthDword ;
                end
                \P2.P2.P1.StateNA  <= \P2.P2.P1.NA_n ;
                \P2.P2.P1.ADS_n  <= 1'b1;
            end
            \P2.P2.P1.StateT1P :
            begin
                if ( ( ( \P2.P2.P1.NA_n  == 1'b0 ) & ( \P2.P2.P1.HOLD  == 1'b0 ) ) & ( \P2.P2.P1.RequestPending  == \P2.P2.P1.Pending  ) ) 
                begin
                    \P2.P2.P1.State  <= \P2.P2.P1.StateT2P ;
                end
                else
                begin 
                    if ( ( \P2.P2.P1.NA_n  == 1'b0 ) & ( ( \P2.P2.P1.HOLD  == 1'b1 ) | ( \P2.P2.P1.RequestPending  == \P2.P2.P1.NotPending  ) ) ) 
                    begin
                        \P2.P2.P1.State  <= \P2.P2.P1.StateT2I ;
                    end
                    else
                    begin 
                        if ( \P2.P2.P1.NA_n  == 1'b1 ) 
                        begin
                            \P2.P2.P1.State  <= \P2.P2.P1.StateT2 ;
                        end
                        else
                        begin 
                            \P2.P2.P1.State  <= \P2.P2.P1.StateT1P ;
                        end
                    end
                end
                \P2.P2.P1.StateBS16  <= \P2.P2.P1.BS16_n ;
                if ( \P2.P2.P1.BS16_n  == 1'b0 ) 
                begin
                    \P2.P2.P1.DataWidth  <= \P2.P2.P1.WidthWord ;
                end
                else
                begin 
                    \P2.P2.P1.DataWidth  <= \P2.P2.P1.WidthDword ;
                end
                \P2.P2.P1.StateNA  <= \P2.P2.P1.NA_n ;
                \P2.P2.P1.ADS_n  <= 1'b1;
            end
            \P2.P2.P1.StateTh :
            begin
                if ( ( \P2.P2.P1.HOLD  == 1'b0 ) & ( \P2.P2.P1.RequestPending  == \P2.P2.P1.Pending  ) ) 
                begin
                    \P2.P2.P1.State  <= \P2.P2.P1.StateT1 ;
                end
                else
                begin 
                    if ( ( \P2.P2.P1.HOLD  == 1'b0 ) & ( \P2.P2.P1.RequestPending  == \P2.P2.P1.NotPending  ) ) 
                    begin
                        \P2.P2.P1.State  <= \P2.P2.P1.StateTi ;
                    end
                    else
                    begin 
                        \P2.P2.P1.State  <= \P2.P2.P1.StateTh ;
                    end
                end
            end
            \P2.P2.P1.StateT2P :
            begin
                \P2.P2.P1.Address  <= ( ( \P2.P2.P1.rEIP  / 2 ) % ( 2 ** 30 ) );
                \P2.P2.P1.BE_n  <= \P2.P2.P1.ByteEnable ;
                \P2.P2.P1.M_IO_n  <= \P2.P2.P1.MemoryFetch ;
                if ( \P2.P2.P1.ReadRequest  == \P2.P2.P1.Pending  ) 
                begin
                    \P2.P2.P1.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P2.P1.W_R_n  <= 1'b1;
                end
                if ( \P2.P2.P1.CodeFetch  == \P2.P2.P1.Pending  ) 
                begin
                    \P2.P2.P1.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P2.P1.D_C_n  <= 1'b1;
                end
                \P2.P2.P1.ADS_n  <= 1'b0;
                if ( \P2.P2.P1.READY_n  == 1'b0 ) 
                begin
                    \P2.P2.P1.State  <= \P2.P2.P1.StateT1P ;
                end
                else
                begin 
                    \P2.P2.P1.State  <= \P2.P2.P1.StateT2P ;
                end
            end
            \P2.P2.P1.StateT2I :
            begin
                if ( ( ( \P2.P2.P1.READY_n  == 1'b1 ) & ( \P2.P2.P1.RequestPending  == \P2.P2.P1.Pending  ) ) & ( \P2.P2.P1.HOLD  == 1'b0 ) ) 
                begin
                    \P2.P2.P1.State  <= \P2.P2.P1.StateT2P ;
                end
                else
                begin 
                    if ( ( \P2.P2.P1.READY_n  == 1'b0 ) & ( \P2.P2.P1.HOLD  == 1'b1 ) ) 
                    begin
                        \P2.P2.P1.State  <= \P2.P2.P1.StateTh ;
                    end
                    else
                    begin 
                        if ( ( ( \P2.P2.P1.READY_n  == 1'b0 ) & ( \P2.P2.P1.HOLD  == 1'b0 ) ) & ( \P2.P2.P1.RequestPending  == \P2.P2.P1.Pending  ) ) 
                        begin
                            \P2.P2.P1.State  <= \P2.P2.P1.StateT1 ;
                        end
                        else
                        begin 
                            if ( ( ( \P2.P2.P1.READY_n  == 1'b0 ) & ( \P2.P2.P1.HOLD  == 1'b0 ) ) & ( \P2.P2.P1.RequestPending  == \P2.P2.P1.NotPending  ) ) 
                            begin
                                \P2.P2.P1.State  <= \P2.P2.P1.StateTi ;
                            end
                            else
                            begin 
                                \P2.P2.P1.State  <= \P2.P2.P1.StateT2I ;
                            end
                        end
                    end
                end
            end
            endcase
        end
    end
    always @ (  posedge \P2.P2.P1.CLOCK  or  posedge \P2.P2.P1.RESET )
    begin : \P2.P2.P1.P1 
        reg [7:0] \P2.P2.P1.InstQueue [15:0];
        reg [4:0] \P2.P2.P1.InstQueueRd_Addr ;
        reg [4:0] \P2.P2.P1.InstQueueWr_Addr ;
        parameter \P2.P2.P1.InstQueueLimit   = 15;
        integer \P2.P2.P1.InstAddrPointer ;
        integer \P2.P2.P1.PhyAddrPointer ;
        reg  \P2.P2.P1.Extended ;
        reg  \P2.P2.P1.More ;
        reg  \P2.P2.P1.Flush ;
        reg [15:0] \P2.P2.P1.lWord ;
        reg [14:0] \P2.P2.P1.uWord ;
        integer \P2.P2.P1.fWord ;
        reg [3:0] \P2.P2.P1.State2 ;
        parameter \P2.P2.P1.Si   = 0;
        parameter \P2.P2.P1.S1   = 1;
        parameter \P2.P2.P1.S2   = 2;
        parameter \P2.P2.P1.S3   = 3;
        parameter \P2.P2.P1.S4   = 4;
        parameter \P2.P2.P1.S5   = 5;
        parameter \P2.P2.P1.S6   = 6;
        parameter \P2.P2.P1.S7   = 7;
        parameter \P2.P2.P1.S8   = 8;
        parameter \P2.P2.P1.S9   = 9;
        if ( \P2.P2.P1.RESET  == 1'b1 ) 
        begin
            \P2.P2.P1.State2  = \P2.P2.P1.Si ;
            \P2.P2.P1.InstQueue  = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            \P2.P2.P1.InstQueueRd_Addr  = 0;
            \P2.P2.P1.InstQueueWr_Addr  = 0;
            \P2.P2.P1.InstAddrPointer  = 0;
            \P2.P2.P1.PhyAddrPointer  = 0;
            \P2.P2.P1.Extended  = 1'b0;
            \P2.P2.P1.More  = 1'b0;
            \P2.P2.P1.Flush  = 1'b0;
            \P2.P2.P1.lWord  = 0;
            \P2.P2.P1.uWord  = 0;
            \P2.P2.P1.fWord  = 0;
            \P2.P2.P1.CodeFetch  <= 1'b0;
            \P2.P2.P1.Datao  <= 0;
            \P2.P2.P1.EAX  <= 0;
            \P2.P2.P1.EBX  <= 0;
            \P2.P2.P1.rEIP  <= 0;
            \P2.P2.P1.ReadRequest  <= 1'b0;
            \P2.P2.P1.MemoryFetch  <= 1'b0;
            \P2.P2.P1.RequestPending  <= 1'b0;
        end
        else
        begin 
            case ( \P2.P2.P1.State2  ) 
            \P2.P2.P1.Si :
            begin
                \P2.P2.P1.PhyAddrPointer  = \P2.P2.P1.rEIP ;
                \P2.P2.P1.InstAddrPointer  = \P2.P2.P1.PhyAddrPointer ;
                \P2.P2.P1.State2  = \P2.P2.P1.S1 ;
                \P2.P2.P1.rEIP  <= 20'hFFFF0;
                \P2.P2.P1.ReadRequest  <= 1'b1;
                \P2.P2.P1.MemoryFetch  <= 1'b1;
                \P2.P2.P1.RequestPending  <= 1'b1;
            end
            \P2.P2.P1.S1 :
            begin
                \P2.P2.P1.RequestPending  <= \P2.P2.P1.Pending ;
                \P2.P2.P1.ReadRequest  <= \P2.P2.P1.Pending ;
                \P2.P2.P1.MemoryFetch  <= \P2.P2.P1.Pending ;
                \P2.P2.P1.CodeFetch  <= \P2.P2.P1.Pending ;
                if ( \P2.P2.P1.READY_n  == 1'b0 ) 
                begin
                    \P2.P2.P1.State2  = \P2.P2.P1.S2 ;
                end
                else
                begin 
                    \P2.P2.P1.State2  = \P2.P2.P1.S1 ;
                end
            end
            \P2.P2.P1.S2 :
            begin
                \P2.P2.P1.RequestPending  <= \P2.P2.P1.NotPending ;
                \P2.P2.P1.InstQueue [\P2.P2.P1.InstQueueWr_Addr ] = ( \P2.P2.P1.Datai  % ( 2 ** 8 ) );
                \P2.P2.P1.InstQueueWr_Addr  = ( ( \P2.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P2.P1.InstQueue [\P2.P2.P1.InstQueueWr_Addr ] = ( \P2.P2.P1.Datai  % ( 2 ** 8 ) );
                \P2.P2.P1.InstQueueWr_Addr  = ( ( \P2.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                if ( \P2.P2.P1.StateBS16  == 1'b1 ) 
                begin
                    \P2.P2.P1.InstQueue [\P2.P2.P1.InstQueueWr_Addr ] = ( ( \P2.P2.P1.Datai  / ( 2 ** 16 ) ) % ( 2 ** 8 ) );
                    \P2.P2.P1.InstQueueWr_Addr  = ( ( \P2.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P2.P1.InstQueue [\P2.P2.P1.InstQueueWr_Addr ] = ( ( \P2.P2.P1.Datai  / ( 2 ** 24 ) ) % ( 2 ** 8 ) );
                    \P2.P2.P1.InstQueueWr_Addr  = ( ( \P2.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P2.P1.PhyAddrPointer  = ( \P2.P2.P1.PhyAddrPointer  + 4 );
                    \P2.P2.P1.State2  = \P2.P2.P1.S5 ;
                end
                else
                begin
                    \P2.P2.P1.PhyAddrPointer  = ( \P2.P2.P1.PhyAddrPointer  + 2 );
                    if ( \P2.P2.P1.PhyAddrPointer  < 0 ) 
                    begin
                        \P2.P2.P1.rEIP  <=  -( \P2.P2.P1.PhyAddrPointer );
                    end
                    else
                    begin 
                        \P2.P2.P1.rEIP  <= \P2.P2.P1.PhyAddrPointer ;
                    end
                    \P2.P2.P1.State2  = \P2.P2.P1.S3 ;
                end
            end
            \P2.P2.P1.S3 :
            begin
                \P2.P2.P1.RequestPending  <= \P2.P2.P1.Pending ;
                if ( \P2.P2.P1.READY_n  == 1'b0 ) 
                begin
                    \P2.P2.P1.State2  = \P2.P2.P1.S4 ;
                end
                else
                begin 
                    \P2.P2.P1.State2  = \P2.P2.P1.S3 ;
                end
            end
            \P2.P2.P1.S4 :
            begin
                \P2.P2.P1.RequestPending  <= \P2.P2.P1.NotPending ;
                \P2.P2.P1.InstQueue [\P2.P2.P1.InstQueueWr_Addr ] = ( \P2.P2.P1.Datai  % ( 2 ** 8 ) );
                \P2.P2.P1.InstQueueWr_Addr  = ( ( \P2.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P2.P1.InstQueue [\P2.P2.P1.InstQueueWr_Addr ] = ( \P2.P2.P1.Datai  % ( 2 ** 8 ) );
                \P2.P2.P1.InstQueueWr_Addr  = ( ( \P2.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P2.P1.PhyAddrPointer  = ( \P2.P2.P1.PhyAddrPointer  + 2 );
                \P2.P2.P1.State2  = \P2.P2.P1.S5 ;
            end
            \P2.P2.P1.S5 :
            begin
                case ( \P2.P2.P1.InstQueue [\P2.P2.P1.InstQueueRd_Addr ] ) 
                \P2.P2.P1.NOP :
                begin
                    \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 1 );
                    \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P1.Flush  = 1'b0;
                    \P2.P2.P1.More  = 1'b0;
                end
                \P2.P2.P1.OPsop :
                begin
                    \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 1 );
                    \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P1.Extended  = 1'b1;
                    \P2.P2.P1.Flush  = 1'b0;
                    \P2.P2.P1.More  = 1'b0;
                end
                \P2.P2.P1.JMP_rel_short :
                begin
                    if ( ( \P2.P2.P1.InstQueueWr_Addr  - \P2.P2.P1.InstQueueRd_Addr  ) >= 3 ) 
                    begin
                        if ( \P2.P2.P1.InstQueue [( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 )] > 127 ) 
                        begin
                            \P2.P2.P1.PhyAddrPointer  = ( ( \P2.P2.P1.InstAddrPointer  + 1 ) - ( 8'hFF - \P2.P2.P1.InstQueue [( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 )] ) );
                            \P2.P2.P1.InstAddrPointer  = \P2.P2.P1.PhyAddrPointer ;
                        end
                        else
                        begin
                            \P2.P2.P1.PhyAddrPointer  = ( ( \P2.P2.P1.InstAddrPointer  + 2 ) + \P2.P2.P1.InstQueue [( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 )] );
                            \P2.P2.P1.InstAddrPointer  = \P2.P2.P1.PhyAddrPointer ;
                        end
                        \P2.P2.P1.Flush  = 1'b1;
                        \P2.P2.P1.More  = 1'b0;
                    end
                    else
                    begin
                        \P2.P2.P1.Flush  = 1'b0;
                        \P2.P2.P1.More  = 1'b1;
                    end
                end
                \P2.P2.P1.JMP_rel_near :
                begin
                    if ( ( \P2.P2.P1.InstQueueWr_Addr  - \P2.P2.P1.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P2.P1.PhyAddrPointer  = ( ( \P2.P2.P1.InstAddrPointer  + 5 ) + \P2.P2.P1.InstQueue [( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P2.P2.P1.InstAddrPointer  = \P2.P2.P1.PhyAddrPointer ;
                        \P2.P2.P1.Flush  = 1'b1;
                        \P2.P2.P1.More  = 1'b0;
                    end
                    else
                    begin
                        \P2.P2.P1.Flush  = 1'b0;
                        \P2.P2.P1.More  = 1'b1;
                    end
                end
                \P2.P2.P1.JMP_intseg_immed :
                begin
                    \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 1 );
                    \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P1.Flush  = 1'b0;
                    \P2.P2.P1.More  = 1'b0;
                end
                \P2.P2.P1.MOV_al_b :
                begin
                    \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 1 );
                    \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P1.Flush  = 1'b0;
                    \P2.P2.P1.More  = 1'b0;
                end
                \P2.P2.P1.MOV_eax_dw :
                begin
                    if ( ( \P2.P2.P1.InstQueueWr_Addr  - \P2.P2.P1.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P2.P1.EAX  <= ( ( ( ( \P2.P2.P1.InstQueue [( ( \P2.P2.P1.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P2.P2.P1.InstQueue [( ( \P2.P2.P1.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P2.P2.P1.InstQueue [( ( \P2.P2.P1.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P2.P2.P1.InstQueue [( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P2.P2.P1.More  = 1'b0;
                        \P2.P2.P1.Flush  = 1'b0;
                        \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 5 );
                        \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P2.P2.P1.Flush  = 1'b0;
                        \P2.P2.P1.More  = 1'b1;
                    end
                end
                \P2.P2.P1.MOV_ebx_dw :
                begin
                    if ( ( \P2.P2.P1.InstQueueWr_Addr  - \P2.P2.P1.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P2.P1.EBX  <= ( ( ( ( \P2.P2.P1.InstQueue [( ( \P2.P2.P1.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P2.P2.P1.InstQueue [( ( \P2.P2.P1.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P2.P2.P1.InstQueue [( ( \P2.P2.P1.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P2.P2.P1.InstQueue [( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 1 )] );
                        \P2.P2.P1.More  = 1'b0;
                        \P2.P2.P1.Flush  = 1'b0;
                        \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 5 );
                        \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P2.P2.P1.Flush  = 1'b0;
                        \P2.P2.P1.More  = 1'b1;
                    end
                end
                \P2.P2.P1.MOV_eax_ebx :
                begin
                    if ( ( \P2.P2.P1.InstQueueWr_Addr  - \P2.P2.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P2.P2.P1.EBX  < 0 ) 
                        begin
                            \P2.P2.P1.rEIP  <=  -( \P2.P2.P1.EBX );
                        end
                        else
                        begin 
                            \P2.P2.P1.rEIP  <= \P2.P2.P1.EBX ;
                        end
                        \P2.P2.P1.RequestPending  <= \P2.P2.P1.Pending ;
                        \P2.P2.P1.ReadRequest  <= \P2.P2.P1.Pending ;
                        \P2.P2.P1.MemoryFetch  <= \P2.P2.P1.Pending ;
                        \P2.P2.P1.CodeFetch  <= \P2.P2.P1.NotPending ;
                        if ( \P2.P2.P1.READY_n  == 1'b0 ) 
                        begin
                            \P2.P2.P1.RequestPending  <= \P2.P2.P1.NotPending ;
                            \P2.P2.P1.uWord  = ( \P2.P2.P1.Datai  % ( 2 ** 15 ) );
                            if ( \P2.P2.P1.StateBS16  == 1'b1 ) 
                            begin
                                \P2.P2.P1.lWord  = ( \P2.P2.P1.Datai  % ( 2 ** 16 ) );
                            end
                            else
                            begin
                                \P2.P2.P1.rEIP  <= ( \P2.P2.P1.rEIP  + 2 );
                                \P2.P2.P1.RequestPending  <= \P2.P2.P1.Pending ;
                                if ( \P2.P2.P1.READY_n  == 1'b0 ) 
                                begin
                                    \P2.P2.P1.RequestPending  <= \P2.P2.P1.NotPending ;
                                    \P2.P2.P1.lWord  = ( \P2.P2.P1.Datai  % ( 2 ** 16 ) );
                                end
                            end
                            if ( \P2.P2.P1.READY_n  == 1'b0 ) 
                            begin
                                \P2.P2.P1.EAX  <= ( ( \P2.P2.P1.uWord  * ( 2 ** 16 ) ) + \P2.P2.P1.lWord  );
                                \P2.P2.P1.More  = 1'b0;
                                \P2.P2.P1.Flush  = 1'b0;
                                \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 2 );
                                \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P2.P2.P1.Flush  = 1'b0;
                        \P2.P2.P1.More  = 1'b1;
                    end
                end
                \P2.P2.P1.MOV_ebx_eax :
                begin
                    if ( ( \P2.P2.P1.InstQueueWr_Addr  - \P2.P2.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P2.P2.P1.EBX  < 0 ) 
                        begin
                            \P2.P2.P1.rEIP  <= \P2.P2.P1.EBX ;
                        end
                        else
                        begin 
                            \P2.P2.P1.rEIP  <= \P2.P2.P1.EBX ;
                        end
                        \P2.P2.P1.lWord  = ( \P2.P2.P1.EAX  % ( 2 ** 16 ) );
                        \P2.P2.P1.uWord  = ( ( \P2.P2.P1.EAX  / ( 2 ** 16 ) ) % ( 2 ** 15 ) );
                        \P2.P2.P1.RequestPending  <= \P2.P2.P1.Pending ;
                        \P2.P2.P1.ReadRequest  <= \P2.P2.P1.NotPending ;
                        \P2.P2.P1.MemoryFetch  <= \P2.P2.P1.Pending ;
                        \P2.P2.P1.CodeFetch  <= \P2.P2.P1.NotPending ;
                        if ( ( \P2.P2.P1.State  == \P2.P2.P1.StateT1  ) | ( \P2.P2.P1.State  == \P2.P2.P1.StateT1P  ) ) 
                        begin
                            \P2.P2.P1.Datao  <= ( ( \P2.P2.P1.uWord  * ( 2 ** 16 ) ) + \P2.P2.P1.lWord  );
                            if ( \P2.P2.P1.READY_n  == 1'b0 ) 
                            begin
                                \P2.P2.P1.RequestPending  <= \P2.P2.P1.NotPending ;
                                if ( \P2.P2.P1.StateBS16  == 1'b0 ) 
                                begin
                                    \P2.P2.P1.rEIP  <= ( \P2.P2.P1.rEIP  + 2 );
                                    \P2.P2.P1.RequestPending  <= \P2.P2.P1.Pending ;
                                    \P2.P2.P1.ReadRequest  <= \P2.P2.P1.NotPending ;
                                    \P2.P2.P1.MemoryFetch  <= \P2.P2.P1.Pending ;
                                    \P2.P2.P1.CodeFetch  <= \P2.P2.P1.NotPending ;
                                    \P2.P2.P1.State2  = \P2.P2.P1.S6 ;
                                end
                                \P2.P2.P1.More  = 1'b0;
                                \P2.P2.P1.Flush  = 1'b0;
                                \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 2 );
                                \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P2.P2.P1.Flush  = 1'b0;
                        \P2.P2.P1.More  = 1'b1;
                    end
                end
                \P2.P2.P1.IN_al :
                begin
                    if ( ( \P2.P2.P1.InstQueueWr_Addr  - \P2.P2.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P2.P2.P1.rEIP  <= ( \P2.P2.P1.InstQueueRd_Addr  + 1 );
                        \P2.P2.P1.RequestPending  <= \P2.P2.P1.Pending ;
                        \P2.P2.P1.ReadRequest  <= \P2.P2.P1.Pending ;
                        \P2.P2.P1.MemoryFetch  <= \P2.P2.P1.NotPending ;
                        \P2.P2.P1.CodeFetch  <= \P2.P2.P1.NotPending ;
                        if ( \P2.P2.P1.READY_n  == 1'b0 ) 
                        begin
                            \P2.P2.P1.RequestPending  <= \P2.P2.P1.NotPending ;
                            \P2.P2.P1.EAX  <= \P2.P2.P1.Datai ;
                            \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 2 );
                            \P2.P2.P1.InstQueueRd_Addr  = ( \P2.P2.P1.InstQueueRd_Addr  + 2 );
                            \P2.P2.P1.Flush  = 1'b0;
                            \P2.P2.P1.More  = 1'b0;
                        end
                    end
                    else
                    begin
                        \P2.P2.P1.Flush  = 1'b0;
                        \P2.P2.P1.More  = 1'b1;
                    end
                end
                \P2.P2.P1.OUT_al :
                begin
                    if ( ( \P2.P2.P1.InstQueueWr_Addr  - \P2.P2.P1.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P2.P2.P1.rEIP  <= ( \P2.P2.P1.InstQueueRd_Addr  + 1 );
                        \P2.P2.P1.RequestPending  <= \P2.P2.P1.Pending ;
                        \P2.P2.P1.ReadRequest  <= \P2.P2.P1.NotPending ;
                        \P2.P2.P1.MemoryFetch  <= \P2.P2.P1.NotPending ;
                        \P2.P2.P1.CodeFetch  <= \P2.P2.P1.NotPending ;
                        if ( ( \P2.P2.P1.State  == \P2.P2.P1.StateT1  ) | ( \P2.P2.P1.State  == \P2.P2.P1.StateT1P  ) ) 
                        begin
                            \P2.P2.P1.fWord  = ( \P2.P2.P1.EAX  % ( 2 ** 16 ) );
                            \P2.P2.P1.Datao  <= \P2.P2.P1.fWord ;
                            if ( \P2.P2.P1.READY_n  == 1'b0 ) 
                            begin
                                \P2.P2.P1.RequestPending  <= \P2.P2.P1.NotPending ;
                                \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 2 );
                                \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 2 ) % 16 );
                                \P2.P2.P1.Flush  = 1'b0;
                                \P2.P2.P1.More  = 1'b0;
                            end
                        end
                    end
                    else
                    begin
                        \P2.P2.P1.Flush  = 1'b0;
                        \P2.P2.P1.More  = 1'b1;
                    end
                end
                \P2.P2.P1.ADD_al_b :
                begin
                    \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 1 );
                    \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P1.Flush  = 1'b0;
                    \P2.P2.P1.More  = 1'b0;
                end
                \P2.P2.P1.ADD_ax_w :
                begin
                    \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 1 );
                    \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P1.Flush  = 1'b0;
                    \P2.P2.P1.More  = 1'b0;
                end
                \P2.P2.P1.ROL_al_1 :
                begin
                    \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 2 );
                    \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 2 ) % 16 );
                    \P2.P2.P1.Flush  = 1'b0;
                    \P2.P2.P1.More  = 1'b0;
                end
                \P2.P2.P1.ROL_al_n :
                begin
                    \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 2 );
                    \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 2 ) % 16 );
                    \P2.P2.P1.Flush  = 1'b0;
                    \P2.P2.P1.More  = 1'b0;
                end
                \P2.P2.P1.INC_eax :
                begin
                    \P2.P2.P1.EAX  <= ( \P2.P2.P1.EAX  + 1 );
                    \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 1 );
                    \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P1.Flush  = 1'b0;
                    \P2.P2.P1.More  = 1'b0;
                end
                \P2.P2.P1.INC_ebx :
                begin
                    \P2.P2.P1.EBX  <= ( \P2.P2.P1.EBX  + 1 );
                    \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 1 );
                    \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P1.Flush  = 1'b0;
                    \P2.P2.P1.More  = 1'b0;
                end
                default :
                begin
                    \P2.P2.P1.InstAddrPointer  = ( \P2.P2.P1.InstAddrPointer  + 1 );
                    \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P1.Flush  = 1'b0;
                    \P2.P2.P1.More  = 1'b0;
                end
                endcase
                if (  ~( ( \P2.P2.P1.InstQueueRd_Addr  < \P2.P2.P1.InstQueueWr_Addr  )) | ( ( ( ( \P2.P2.P1.InstQueueLimit  - \P2.P2.P1.InstQueueRd_Addr  ) < 4 ) | \P2.P2.P1.Flush  ) | \P2.P2.P1.More  ) ) 
                begin
                    \P2.P2.P1.State2  = \P2.P2.P1.S7 ;
                end
            end
            \P2.P2.P1.S6 :
            begin
                \P2.P2.P1.Datao  <= ( ( \P2.P2.P1.uWord  * ( 2 ** 16 ) ) + \P2.P2.P1.lWord  );
                if ( \P2.P2.P1.READY_n  == 1'b0 ) 
                begin
                    \P2.P2.P1.RequestPending  <= \P2.P2.P1.NotPending ;
                    \P2.P2.P1.State2  = \P2.P2.P1.S5 ;
                end
            end
            \P2.P2.P1.S7 :
            begin
                if ( \P2.P2.P1.Flush  ) 
                begin
                    \P2.P2.P1.InstQueueRd_Addr  = 1;
                    \P2.P2.P1.InstQueueWr_Addr  = 1;
                    if ( \P2.P2.P1.InstAddrPointer  < 0 ) 
                    begin
                        \P2.P2.P1.fWord  =  -( \P2.P2.P1.InstAddrPointer );
                    end
                    else
                    begin 
                        \P2.P2.P1.fWord  = \P2.P2.P1.InstAddrPointer ;
                    end
                    if ( ( \P2.P2.P1.fWord  % 2 ) == 1 ) 
                    begin
                        \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + ( \P2.P2.P1.fWord  % 4 ) ) % 16 );
                    end
                end
                if ( ( \P2.P2.P1.InstQueueLimit  - \P2.P2.P1.InstQueueRd_Addr  ) < 3 ) 
                begin
                    \P2.P2.P1.State2  = \P2.P2.P1.S8 ;
                    \P2.P2.P1.InstQueueWr_Addr  = 0;
                end
                else
                begin 
                    \P2.P2.P1.State2  = \P2.P2.P1.S9 ;
                end
            end
            \P2.P2.P1.S8 :
            begin
                if ( \P2.P2.P1.InstQueueRd_Addr  <= \P2.P2.P1.InstQueueLimit  ) 
                begin
                    \P2.P2.P1.InstQueue [\P2.P2.P1.InstQueueWr_Addr ] = \P2.P2.P1.InstQueue [\P2.P2.P1.InstQueueRd_Addr ];
                    \P2.P2.P1.InstQueueRd_Addr  = ( ( \P2.P2.P1.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P1.InstQueueWr_Addr  = ( ( \P2.P2.P1.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P2.P1.State2  = \P2.P2.P1.S8 ;
                end
                else
                begin
                    \P2.P2.P1.InstQueueRd_Addr  = 0;
                    \P2.P2.P1.State2  = \P2.P2.P1.S9 ;
                end
            end
            \P2.P2.P1.S9 :
            begin
                \P2.P2.P1.rEIP  <= \P2.P2.P1.PhyAddrPointer ;
                \P2.P2.P1.State2  = \P2.P2.P1.S1 ;
            end
            endcase
        end
    end
    always @ (  posedge \P2.P2.P1.CLOCK  or  posedge \P2.P2.P1.RESET )
    begin : \P2.P2.P1.P2 
        if ( \P2.P2.P1.RESET  == 1'b1 ) 
        begin
            \P2.P2.P1.ByteEnable  <= 4'b0000;
            \P2.P2.P1.NonAligned  <= 1'b0;
        end
        else
        begin 
            case ( \P2.P2.P1.DataWidth  ) 
            \P2.P2.P1.WidthByte :
            begin
                case ( \P2.P2.P1.rEIP  % 4 ) 
                0:
                begin
                    \P2.P2.P1.ByteEnable  <= 4'b1110;
                end
                1:
                begin
                    \P2.P2.P1.ByteEnable  <= 4'b1101;
                end
                2:
                begin
                    \P2.P2.P1.ByteEnable  <= 4'b1011;
                end
                3:
                begin
                    \P2.P2.P1.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            \P2.P2.P1.WidthWord :
            begin
                case ( \P2.P2.P1.rEIP  % 4 ) 
                0:
                begin
                    \P2.P2.P1.ByteEnable  <= 4'b1100;
                    \P2.P2.P1.NonAligned  <= \P2.P2.P1.NotPending ;
                end
                1:
                begin
                    \P2.P2.P1.ByteEnable  <= 4'b1001;
                    \P2.P2.P1.NonAligned  <= \P2.P2.P1.NotPending ;
                end
                2:
                begin
                    \P2.P2.P1.ByteEnable  <= 4'b0011;
                    \P2.P2.P1.NonAligned  <= \P2.P2.P1.NotPending ;
                end
                3:
                begin
                    \P2.P2.P1.ByteEnable  <= 4'b0111;
                    \P2.P2.P1.NonAligned  <= \P2.P2.P1.Pending ;
                end
                default :
                begin
                end
                endcase
            end
            \P2.P2.P1.WidthDword :
            begin
                case ( \P2.P2.P1.rEIP  % 4 ) 
                0:
                begin
                    \P2.P2.P1.ByteEnable  <= 4'b0000;
                    \P2.P2.P1.NonAligned  <= \P2.P2.P1.NotPending ;
                end
                1:
                begin
                    \P2.P2.P1.ByteEnable  <= 4'b0001;
                    \P2.P2.P1.NonAligned  <= \P2.P2.P1.Pending ;
                end
                2:
                begin
                    \P2.P2.P1.NonAligned  <= \P2.P2.P1.Pending ;
                    \P2.P2.P1.ByteEnable  <= 4'b0011;
                end
                3:
                begin
                    \P2.P2.P1.NonAligned  <= \P2.P2.P1.Pending ;
                    \P2.P2.P1.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            default :
            begin
            end
            endcase
        end
    end
    assign \P2.P2.be2  = \P2.P2.P2.BE_n ;
    assign \P2.P2.addr2  = \P2.P2.P2.Address ;
    assign \P2.P2.wr2  = \P2.P2.P2.W_R_n ;
    assign \P2.P2.dc2  = \P2.P2.P2.D_C_n ;
    assign \P2.P2.mio2  = \P2.P2.P2.M_IO_n ;
    assign \P2.P2.ads2  = \P2.P2.P2.ADS_n ;
    assign \P2.P2.P2.Datai  = \P2.P2.di2 ;
    assign \P2.P2.do2  = \P2.P2.P2.Datao ;
    assign \P2.P2.P2.CLOCK  = \P2.P2.clock ;
    assign \P2.P2.P2.NA_n  = \P2.P2.na ;
    assign \P2.P2.P2.BS16_n  = \P2.P2.bs16 ;
    assign \P2.P2.P2.READY_n  = \P2.P2.rdy2 ;
    assign \P2.P2.P2.HOLD  = \P2.P2.hold ;
    assign \P2.P2.P2.RESET  = \P2.P2.reset ;
    always @ (  posedge \P2.P2.P2.CLOCK  or  posedge \P2.P2.P2.RESET )
    begin : \P2.P2.P2.P0 
        if ( \P2.P2.P2.RESET  == 1'b1 ) 
        begin
            \P2.P2.P2.BE_n  <= 4'b0000;
            \P2.P2.P2.Address  <= 0;
            \P2.P2.P2.W_R_n  <= 1'b0;
            \P2.P2.P2.D_C_n  <= 1'b0;
            \P2.P2.P2.M_IO_n  <= 1'b0;
            \P2.P2.P2.ADS_n  <= 1'b0;
            \P2.P2.P2.State  <= \P2.P2.P2.StateInit ;
            \P2.P2.P2.StateNA  <= 1'b0;
            \P2.P2.P2.StateBS16  <= 1'b0;
            \P2.P2.P2.DataWidth  <= 0;
        end
        else
        begin 
            case ( \P2.P2.P2.State  ) 
            \P2.P2.P2.StateInit :
            begin
                \P2.P2.P2.D_C_n  <= 1'b1;
                \P2.P2.P2.ADS_n  <= 1'b1;
                \P2.P2.P2.State  <= \P2.P2.P2.StateTi ;
                \P2.P2.P2.StateNA  <= 1'b1;
                \P2.P2.P2.StateBS16  <= 1'b1;
                \P2.P2.P2.DataWidth  <= 2;
                \P2.P2.P2.State  <= \P2.P2.P2.StateTi ;
            end
            \P2.P2.P2.StateTi :
            begin
                if ( \P2.P2.P2.RequestPending  == \P2.P2.P2.Pending  ) 
                begin
                    \P2.P2.P2.State  <= \P2.P2.P2.StateT1 ;
                end
                else
                begin 
                    if ( \P2.P2.P2.HOLD  == 1'b1 ) 
                    begin
                        \P2.P2.P2.State  <= \P2.P2.P2.StateTh ;
                    end
                    else
                    begin 
                        \P2.P2.P2.State  <= \P2.P2.P2.StateTi ;
                    end
                end
            end
            \P2.P2.P2.StateT1 :
            begin
                \P2.P2.P2.Address  <= ( ( \P2.P2.P2.rEIP  / 4 ) % ( 2 ** 30 ) );
                \P2.P2.P2.BE_n  <= \P2.P2.P2.ByteEnable ;
                \P2.P2.P2.M_IO_n  <= \P2.P2.P2.MemoryFetch ;
                if ( \P2.P2.P2.ReadRequest  == \P2.P2.P2.Pending  ) 
                begin
                    \P2.P2.P2.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P2.P2.W_R_n  <= 1'b1;
                end
                if ( \P2.P2.P2.CodeFetch  == \P2.P2.P2.Pending  ) 
                begin
                    \P2.P2.P2.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P2.P2.D_C_n  <= 1'b1;
                end
                \P2.P2.P2.ADS_n  <= 1'b0;
                \P2.P2.P2.State  <= \P2.P2.P2.StateT2 ;
            end
            \P2.P2.P2.StateT2 :
            begin
                if ( ( ( \P2.P2.P2.READY_n  == 1'b0 ) & ( \P2.P2.P2.HOLD  == 1'b0 ) ) & ( \P2.P2.P2.RequestPending  == \P2.P2.P2.Pending  ) ) 
                begin
                    \P2.P2.P2.State  <= \P2.P2.P2.StateT1 ;
                end
                else
                begin 
                    if ( ( \P2.P2.P2.READY_n  == 1'b1 ) & ( \P2.P2.P2.NA_n  == 1'b1 ) ) 
                    begin
                    end
                    else
                    begin 
                        if ( ( ( \P2.P2.P2.RequestPending  == \P2.P2.P2.Pending  ) | ( \P2.P2.P2.HOLD  == 1'b1 ) ) & ( ( \P2.P2.P2.READY_n  == 1'b1 ) & ( \P2.P2.P2.NA_n  == 1'b0 ) ) ) 
                        begin
                            \P2.P2.P2.State  <= \P2.P2.P2.StateT2I ;
                        end
                        else
                        begin 
                            if ( ( ( ( \P2.P2.P2.RequestPending  == \P2.P2.P2.Pending  ) & ( \P2.P2.P2.HOLD  == 1'b0 ) ) & ( \P2.P2.P2.READY_n  == 1'b1 ) ) & ( \P2.P2.P2.NA_n  == 1'b0 ) ) 
                            begin
                                \P2.P2.P2.State  <= \P2.P2.P2.StateT2P ;
                            end
                            else
                            begin 
                                if ( ( ( \P2.P2.P2.RequestPending  == \P2.P2.P2.NotPending  ) & ( \P2.P2.P2.HOLD  == 1'b0 ) ) & ( \P2.P2.P2.READY_n  == 1'b0 ) ) 
                                begin
                                    \P2.P2.P2.State  <= \P2.P2.P2.StateTi ;
                                end
                                else
                                begin 
                                    if ( ( \P2.P2.P2.HOLD  == 1'b1 ) & ( \P2.P2.P2.READY_n  == 1'b1 ) ) 
                                    begin
                                        \P2.P2.P2.State  <= \P2.P2.P2.StateTh ;
                                    end
                                    else
                                    begin 
                                        \P2.P2.P2.State  <= \P2.P2.P2.StateT2 ;
                                    end
                                end
                            end
                        end
                    end
                end
                \P2.P2.P2.StateBS16  <= \P2.P2.P2.BS16_n ;
                if ( \P2.P2.P2.BS16_n  == 1'b0 ) 
                begin
                    \P2.P2.P2.DataWidth  <= \P2.P2.P2.WidthWord ;
                end
                else
                begin 
                    \P2.P2.P2.DataWidth  <= \P2.P2.P2.WidthDword ;
                end
                \P2.P2.P2.StateNA  <= \P2.P2.P2.NA_n ;
                \P2.P2.P2.ADS_n  <= 1'b1;
            end
            \P2.P2.P2.StateT1P :
            begin
                if ( ( ( \P2.P2.P2.NA_n  == 1'b0 ) & ( \P2.P2.P2.HOLD  == 1'b0 ) ) & ( \P2.P2.P2.RequestPending  == \P2.P2.P2.Pending  ) ) 
                begin
                    \P2.P2.P2.State  <= \P2.P2.P2.StateT2P ;
                end
                else
                begin 
                    if ( ( \P2.P2.P2.NA_n  == 1'b0 ) & ( ( \P2.P2.P2.HOLD  == 1'b1 ) | ( \P2.P2.P2.RequestPending  == \P2.P2.P2.NotPending  ) ) ) 
                    begin
                        \P2.P2.P2.State  <= \P2.P2.P2.StateT2I ;
                    end
                    else
                    begin 
                        if ( \P2.P2.P2.NA_n  == 1'b1 ) 
                        begin
                            \P2.P2.P2.State  <= \P2.P2.P2.StateT2 ;
                        end
                        else
                        begin 
                            \P2.P2.P2.State  <= \P2.P2.P2.StateT1P ;
                        end
                    end
                end
                \P2.P2.P2.StateBS16  <= \P2.P2.P2.BS16_n ;
                if ( \P2.P2.P2.BS16_n  == 1'b0 ) 
                begin
                    \P2.P2.P2.DataWidth  <= \P2.P2.P2.WidthWord ;
                end
                else
                begin 
                    \P2.P2.P2.DataWidth  <= \P2.P2.P2.WidthDword ;
                end
                \P2.P2.P2.StateNA  <= \P2.P2.P2.NA_n ;
                \P2.P2.P2.ADS_n  <= 1'b1;
            end
            \P2.P2.P2.StateTh :
            begin
                if ( ( \P2.P2.P2.HOLD  == 1'b0 ) & ( \P2.P2.P2.RequestPending  == \P2.P2.P2.Pending  ) ) 
                begin
                    \P2.P2.P2.State  <= \P2.P2.P2.StateT1 ;
                end
                else
                begin 
                    if ( ( \P2.P2.P2.HOLD  == 1'b0 ) & ( \P2.P2.P2.RequestPending  == \P2.P2.P2.NotPending  ) ) 
                    begin
                        \P2.P2.P2.State  <= \P2.P2.P2.StateTi ;
                    end
                    else
                    begin 
                        \P2.P2.P2.State  <= \P2.P2.P2.StateTh ;
                    end
                end
            end
            \P2.P2.P2.StateT2P :
            begin
                \P2.P2.P2.Address  <= ( ( \P2.P2.P2.rEIP  / 2 ) % ( 2 ** 30 ) );
                \P2.P2.P2.BE_n  <= \P2.P2.P2.ByteEnable ;
                \P2.P2.P2.M_IO_n  <= \P2.P2.P2.MemoryFetch ;
                if ( \P2.P2.P2.ReadRequest  == \P2.P2.P2.Pending  ) 
                begin
                    \P2.P2.P2.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P2.P2.W_R_n  <= 1'b1;
                end
                if ( \P2.P2.P2.CodeFetch  == \P2.P2.P2.Pending  ) 
                begin
                    \P2.P2.P2.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P2.P2.D_C_n  <= 1'b1;
                end
                \P2.P2.P2.ADS_n  <= 1'b0;
                if ( \P2.P2.P2.READY_n  == 1'b0 ) 
                begin
                    \P2.P2.P2.State  <= \P2.P2.P2.StateT1P ;
                end
                else
                begin 
                    \P2.P2.P2.State  <= \P2.P2.P2.StateT2P ;
                end
            end
            \P2.P2.P2.StateT2I :
            begin
                if ( ( ( \P2.P2.P2.READY_n  == 1'b1 ) & ( \P2.P2.P2.RequestPending  == \P2.P2.P2.Pending  ) ) & ( \P2.P2.P2.HOLD  == 1'b0 ) ) 
                begin
                    \P2.P2.P2.State  <= \P2.P2.P2.StateT2P ;
                end
                else
                begin 
                    if ( ( \P2.P2.P2.READY_n  == 1'b0 ) & ( \P2.P2.P2.HOLD  == 1'b1 ) ) 
                    begin
                        \P2.P2.P2.State  <= \P2.P2.P2.StateTh ;
                    end
                    else
                    begin 
                        if ( ( ( \P2.P2.P2.READY_n  == 1'b0 ) & ( \P2.P2.P2.HOLD  == 1'b0 ) ) & ( \P2.P2.P2.RequestPending  == \P2.P2.P2.Pending  ) ) 
                        begin
                            \P2.P2.P2.State  <= \P2.P2.P2.StateT1 ;
                        end
                        else
                        begin 
                            if ( ( ( \P2.P2.P2.READY_n  == 1'b0 ) & ( \P2.P2.P2.HOLD  == 1'b0 ) ) & ( \P2.P2.P2.RequestPending  == \P2.P2.P2.NotPending  ) ) 
                            begin
                                \P2.P2.P2.State  <= \P2.P2.P2.StateTi ;
                            end
                            else
                            begin 
                                \P2.P2.P2.State  <= \P2.P2.P2.StateT2I ;
                            end
                        end
                    end
                end
            end
            endcase
        end
    end
    always @ (  posedge \P2.P2.P2.CLOCK  or  posedge \P2.P2.P2.RESET )
    begin : \P2.P2.P2.P1 
        reg [7:0] \P2.P2.P2.InstQueue [15:0];
        reg [4:0] \P2.P2.P2.InstQueueRd_Addr ;
        reg [4:0] \P2.P2.P2.InstQueueWr_Addr ;
        parameter \P2.P2.P2.InstQueueLimit   = 15;
        integer \P2.P2.P2.InstAddrPointer ;
        integer \P2.P2.P2.PhyAddrPointer ;
        reg  \P2.P2.P2.Extended ;
        reg  \P2.P2.P2.More ;
        reg  \P2.P2.P2.Flush ;
        reg [15:0] \P2.P2.P2.lWord ;
        reg [14:0] \P2.P2.P2.uWord ;
        integer \P2.P2.P2.fWord ;
        reg [3:0] \P2.P2.P2.State2 ;
        parameter \P2.P2.P2.Si   = 0;
        parameter \P2.P2.P2.S1   = 1;
        parameter \P2.P2.P2.S2   = 2;
        parameter \P2.P2.P2.S3   = 3;
        parameter \P2.P2.P2.S4   = 4;
        parameter \P2.P2.P2.S5   = 5;
        parameter \P2.P2.P2.S6   = 6;
        parameter \P2.P2.P2.S7   = 7;
        parameter \P2.P2.P2.S8   = 8;
        parameter \P2.P2.P2.S9   = 9;
        if ( \P2.P2.P2.RESET  == 1'b1 ) 
        begin
            \P2.P2.P2.State2  = \P2.P2.P2.Si ;
            \P2.P2.P2.InstQueue  = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            \P2.P2.P2.InstQueueRd_Addr  = 0;
            \P2.P2.P2.InstQueueWr_Addr  = 0;
            \P2.P2.P2.InstAddrPointer  = 0;
            \P2.P2.P2.PhyAddrPointer  = 0;
            \P2.P2.P2.Extended  = 1'b0;
            \P2.P2.P2.More  = 1'b0;
            \P2.P2.P2.Flush  = 1'b0;
            \P2.P2.P2.lWord  = 0;
            \P2.P2.P2.uWord  = 0;
            \P2.P2.P2.fWord  = 0;
            \P2.P2.P2.CodeFetch  <= 1'b0;
            \P2.P2.P2.Datao  <= 0;
            \P2.P2.P2.EAX  <= 0;
            \P2.P2.P2.EBX  <= 0;
            \P2.P2.P2.rEIP  <= 0;
            \P2.P2.P2.ReadRequest  <= 1'b0;
            \P2.P2.P2.MemoryFetch  <= 1'b0;
            \P2.P2.P2.RequestPending  <= 1'b0;
        end
        else
        begin 
            case ( \P2.P2.P2.State2  ) 
            \P2.P2.P2.Si :
            begin
                \P2.P2.P2.PhyAddrPointer  = \P2.P2.P2.rEIP ;
                \P2.P2.P2.InstAddrPointer  = \P2.P2.P2.PhyAddrPointer ;
                \P2.P2.P2.State2  = \P2.P2.P2.S1 ;
                \P2.P2.P2.rEIP  <= 20'hFFFF0;
                \P2.P2.P2.ReadRequest  <= 1'b1;
                \P2.P2.P2.MemoryFetch  <= 1'b1;
                \P2.P2.P2.RequestPending  <= 1'b1;
            end
            \P2.P2.P2.S1 :
            begin
                \P2.P2.P2.RequestPending  <= \P2.P2.P2.Pending ;
                \P2.P2.P2.ReadRequest  <= \P2.P2.P2.Pending ;
                \P2.P2.P2.MemoryFetch  <= \P2.P2.P2.Pending ;
                \P2.P2.P2.CodeFetch  <= \P2.P2.P2.Pending ;
                if ( \P2.P2.P2.READY_n  == 1'b0 ) 
                begin
                    \P2.P2.P2.State2  = \P2.P2.P2.S2 ;
                end
                else
                begin 
                    \P2.P2.P2.State2  = \P2.P2.P2.S1 ;
                end
            end
            \P2.P2.P2.S2 :
            begin
                \P2.P2.P2.RequestPending  <= \P2.P2.P2.NotPending ;
                \P2.P2.P2.InstQueue [\P2.P2.P2.InstQueueWr_Addr ] = ( \P2.P2.P2.Datai  % ( 2 ** 8 ) );
                \P2.P2.P2.InstQueueWr_Addr  = ( ( \P2.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P2.P2.InstQueue [\P2.P2.P2.InstQueueWr_Addr ] = ( \P2.P2.P2.Datai  % ( 2 ** 8 ) );
                \P2.P2.P2.InstQueueWr_Addr  = ( ( \P2.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                if ( \P2.P2.P2.StateBS16  == 1'b1 ) 
                begin
                    \P2.P2.P2.InstQueue [\P2.P2.P2.InstQueueWr_Addr ] = ( ( \P2.P2.P2.Datai  / ( 2 ** 16 ) ) % ( 2 ** 8 ) );
                    \P2.P2.P2.InstQueueWr_Addr  = ( ( \P2.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P2.P2.InstQueue [\P2.P2.P2.InstQueueWr_Addr ] = ( ( \P2.P2.P2.Datai  / ( 2 ** 24 ) ) % ( 2 ** 8 ) );
                    \P2.P2.P2.InstQueueWr_Addr  = ( ( \P2.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P2.P2.PhyAddrPointer  = ( \P2.P2.P2.PhyAddrPointer  + 4 );
                    \P2.P2.P2.State2  = \P2.P2.P2.S5 ;
                end
                else
                begin
                    \P2.P2.P2.PhyAddrPointer  = ( \P2.P2.P2.PhyAddrPointer  + 2 );
                    if ( \P2.P2.P2.PhyAddrPointer  < 0 ) 
                    begin
                        \P2.P2.P2.rEIP  <=  -( \P2.P2.P2.PhyAddrPointer );
                    end
                    else
                    begin 
                        \P2.P2.P2.rEIP  <= \P2.P2.P2.PhyAddrPointer ;
                    end
                    \P2.P2.P2.State2  = \P2.P2.P2.S3 ;
                end
            end
            \P2.P2.P2.S3 :
            begin
                \P2.P2.P2.RequestPending  <= \P2.P2.P2.Pending ;
                if ( \P2.P2.P2.READY_n  == 1'b0 ) 
                begin
                    \P2.P2.P2.State2  = \P2.P2.P2.S4 ;
                end
                else
                begin 
                    \P2.P2.P2.State2  = \P2.P2.P2.S3 ;
                end
            end
            \P2.P2.P2.S4 :
            begin
                \P2.P2.P2.RequestPending  <= \P2.P2.P2.NotPending ;
                \P2.P2.P2.InstQueue [\P2.P2.P2.InstQueueWr_Addr ] = ( \P2.P2.P2.Datai  % ( 2 ** 8 ) );
                \P2.P2.P2.InstQueueWr_Addr  = ( ( \P2.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P2.P2.InstQueue [\P2.P2.P2.InstQueueWr_Addr ] = ( \P2.P2.P2.Datai  % ( 2 ** 8 ) );
                \P2.P2.P2.InstQueueWr_Addr  = ( ( \P2.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P2.P2.PhyAddrPointer  = ( \P2.P2.P2.PhyAddrPointer  + 2 );
                \P2.P2.P2.State2  = \P2.P2.P2.S5 ;
            end
            \P2.P2.P2.S5 :
            begin
                case ( \P2.P2.P2.InstQueue [\P2.P2.P2.InstQueueRd_Addr ] ) 
                \P2.P2.P2.NOP :
                begin
                    \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 1 );
                    \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P2.Flush  = 1'b0;
                    \P2.P2.P2.More  = 1'b0;
                end
                \P2.P2.P2.OPsop :
                begin
                    \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 1 );
                    \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P2.Extended  = 1'b1;
                    \P2.P2.P2.Flush  = 1'b0;
                    \P2.P2.P2.More  = 1'b0;
                end
                \P2.P2.P2.JMP_rel_short :
                begin
                    if ( ( \P2.P2.P2.InstQueueWr_Addr  - \P2.P2.P2.InstQueueRd_Addr  ) >= 3 ) 
                    begin
                        if ( \P2.P2.P2.InstQueue [( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 )] > 127 ) 
                        begin
                            \P2.P2.P2.PhyAddrPointer  = ( ( \P2.P2.P2.InstAddrPointer  + 1 ) - ( 8'hFF - \P2.P2.P2.InstQueue [( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 )] ) );
                            \P2.P2.P2.InstAddrPointer  = \P2.P2.P2.PhyAddrPointer ;
                        end
                        else
                        begin
                            \P2.P2.P2.PhyAddrPointer  = ( ( \P2.P2.P2.InstAddrPointer  + 2 ) + \P2.P2.P2.InstQueue [( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 )] );
                            \P2.P2.P2.InstAddrPointer  = \P2.P2.P2.PhyAddrPointer ;
                        end
                        \P2.P2.P2.Flush  = 1'b1;
                        \P2.P2.P2.More  = 1'b0;
                    end
                    else
                    begin
                        \P2.P2.P2.Flush  = 1'b0;
                        \P2.P2.P2.More  = 1'b1;
                    end
                end
                \P2.P2.P2.JMP_rel_near :
                begin
                    if ( ( \P2.P2.P2.InstQueueWr_Addr  - \P2.P2.P2.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P2.P2.PhyAddrPointer  = ( ( \P2.P2.P2.InstAddrPointer  + 5 ) + \P2.P2.P2.InstQueue [( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P2.P2.P2.InstAddrPointer  = \P2.P2.P2.PhyAddrPointer ;
                        \P2.P2.P2.Flush  = 1'b1;
                        \P2.P2.P2.More  = 1'b0;
                    end
                    else
                    begin
                        \P2.P2.P2.Flush  = 1'b0;
                        \P2.P2.P2.More  = 1'b1;
                    end
                end
                \P2.P2.P2.JMP_intseg_immed :
                begin
                    \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 1 );
                    \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P2.Flush  = 1'b0;
                    \P2.P2.P2.More  = 1'b0;
                end
                \P2.P2.P2.MOV_al_b :
                begin
                    \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 1 );
                    \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P2.Flush  = 1'b0;
                    \P2.P2.P2.More  = 1'b0;
                end
                \P2.P2.P2.MOV_eax_dw :
                begin
                    if ( ( \P2.P2.P2.InstQueueWr_Addr  - \P2.P2.P2.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P2.P2.EAX  <= ( ( ( ( \P2.P2.P2.InstQueue [( ( \P2.P2.P2.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P2.P2.P2.InstQueue [( ( \P2.P2.P2.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P2.P2.P2.InstQueue [( ( \P2.P2.P2.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P2.P2.P2.InstQueue [( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P2.P2.P2.More  = 1'b0;
                        \P2.P2.P2.Flush  = 1'b0;
                        \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 5 );
                        \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P2.P2.P2.Flush  = 1'b0;
                        \P2.P2.P2.More  = 1'b1;
                    end
                end
                \P2.P2.P2.MOV_ebx_dw :
                begin
                    if ( ( \P2.P2.P2.InstQueueWr_Addr  - \P2.P2.P2.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P2.P2.EBX  <= ( ( ( ( \P2.P2.P2.InstQueue [( ( \P2.P2.P2.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P2.P2.P2.InstQueue [( ( \P2.P2.P2.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P2.P2.P2.InstQueue [( ( \P2.P2.P2.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P2.P2.P2.InstQueue [( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 1 )] );
                        \P2.P2.P2.More  = 1'b0;
                        \P2.P2.P2.Flush  = 1'b0;
                        \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 5 );
                        \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P2.P2.P2.Flush  = 1'b0;
                        \P2.P2.P2.More  = 1'b1;
                    end
                end
                \P2.P2.P2.MOV_eax_ebx :
                begin
                    if ( ( \P2.P2.P2.InstQueueWr_Addr  - \P2.P2.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P2.P2.P2.EBX  < 0 ) 
                        begin
                            \P2.P2.P2.rEIP  <=  -( \P2.P2.P2.EBX );
                        end
                        else
                        begin 
                            \P2.P2.P2.rEIP  <= \P2.P2.P2.EBX ;
                        end
                        \P2.P2.P2.RequestPending  <= \P2.P2.P2.Pending ;
                        \P2.P2.P2.ReadRequest  <= \P2.P2.P2.Pending ;
                        \P2.P2.P2.MemoryFetch  <= \P2.P2.P2.Pending ;
                        \P2.P2.P2.CodeFetch  <= \P2.P2.P2.NotPending ;
                        if ( \P2.P2.P2.READY_n  == 1'b0 ) 
                        begin
                            \P2.P2.P2.RequestPending  <= \P2.P2.P2.NotPending ;
                            \P2.P2.P2.uWord  = ( \P2.P2.P2.Datai  % ( 2 ** 15 ) );
                            if ( \P2.P2.P2.StateBS16  == 1'b1 ) 
                            begin
                                \P2.P2.P2.lWord  = ( \P2.P2.P2.Datai  % ( 2 ** 16 ) );
                            end
                            else
                            begin
                                \P2.P2.P2.rEIP  <= ( \P2.P2.P2.rEIP  + 2 );
                                \P2.P2.P2.RequestPending  <= \P2.P2.P2.Pending ;
                                if ( \P2.P2.P2.READY_n  == 1'b0 ) 
                                begin
                                    \P2.P2.P2.RequestPending  <= \P2.P2.P2.NotPending ;
                                    \P2.P2.P2.lWord  = ( \P2.P2.P2.Datai  % ( 2 ** 16 ) );
                                end
                            end
                            if ( \P2.P2.P2.READY_n  == 1'b0 ) 
                            begin
                                \P2.P2.P2.EAX  <= ( ( \P2.P2.P2.uWord  * ( 2 ** 16 ) ) + \P2.P2.P2.lWord  );
                                \P2.P2.P2.More  = 1'b0;
                                \P2.P2.P2.Flush  = 1'b0;
                                \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 2 );
                                \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P2.P2.P2.Flush  = 1'b0;
                        \P2.P2.P2.More  = 1'b1;
                    end
                end
                \P2.P2.P2.MOV_ebx_eax :
                begin
                    if ( ( \P2.P2.P2.InstQueueWr_Addr  - \P2.P2.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P2.P2.P2.EBX  < 0 ) 
                        begin
                            \P2.P2.P2.rEIP  <= \P2.P2.P2.EBX ;
                        end
                        else
                        begin 
                            \P2.P2.P2.rEIP  <= \P2.P2.P2.EBX ;
                        end
                        \P2.P2.P2.lWord  = ( \P2.P2.P2.EAX  % ( 2 ** 16 ) );
                        \P2.P2.P2.uWord  = ( ( \P2.P2.P2.EAX  / ( 2 ** 16 ) ) % ( 2 ** 15 ) );
                        \P2.P2.P2.RequestPending  <= \P2.P2.P2.Pending ;
                        \P2.P2.P2.ReadRequest  <= \P2.P2.P2.NotPending ;
                        \P2.P2.P2.MemoryFetch  <= \P2.P2.P2.Pending ;
                        \P2.P2.P2.CodeFetch  <= \P2.P2.P2.NotPending ;
                        if ( ( \P2.P2.P2.State  == \P2.P2.P2.StateT1  ) | ( \P2.P2.P2.State  == \P2.P2.P2.StateT1P  ) ) 
                        begin
                            \P2.P2.P2.Datao  <= ( ( \P2.P2.P2.uWord  * ( 2 ** 16 ) ) + \P2.P2.P2.lWord  );
                            if ( \P2.P2.P2.READY_n  == 1'b0 ) 
                            begin
                                \P2.P2.P2.RequestPending  <= \P2.P2.P2.NotPending ;
                                if ( \P2.P2.P2.StateBS16  == 1'b0 ) 
                                begin
                                    \P2.P2.P2.rEIP  <= ( \P2.P2.P2.rEIP  + 2 );
                                    \P2.P2.P2.RequestPending  <= \P2.P2.P2.Pending ;
                                    \P2.P2.P2.ReadRequest  <= \P2.P2.P2.NotPending ;
                                    \P2.P2.P2.MemoryFetch  <= \P2.P2.P2.Pending ;
                                    \P2.P2.P2.CodeFetch  <= \P2.P2.P2.NotPending ;
                                    \P2.P2.P2.State2  = \P2.P2.P2.S6 ;
                                end
                                \P2.P2.P2.More  = 1'b0;
                                \P2.P2.P2.Flush  = 1'b0;
                                \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 2 );
                                \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P2.P2.P2.Flush  = 1'b0;
                        \P2.P2.P2.More  = 1'b1;
                    end
                end
                \P2.P2.P2.IN_al :
                begin
                    if ( ( \P2.P2.P2.InstQueueWr_Addr  - \P2.P2.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P2.P2.P2.rEIP  <= ( \P2.P2.P2.InstQueueRd_Addr  + 1 );
                        \P2.P2.P2.RequestPending  <= \P2.P2.P2.Pending ;
                        \P2.P2.P2.ReadRequest  <= \P2.P2.P2.Pending ;
                        \P2.P2.P2.MemoryFetch  <= \P2.P2.P2.NotPending ;
                        \P2.P2.P2.CodeFetch  <= \P2.P2.P2.NotPending ;
                        if ( \P2.P2.P2.READY_n  == 1'b0 ) 
                        begin
                            \P2.P2.P2.RequestPending  <= \P2.P2.P2.NotPending ;
                            \P2.P2.P2.EAX  <= \P2.P2.P2.Datai ;
                            \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 2 );
                            \P2.P2.P2.InstQueueRd_Addr  = ( \P2.P2.P2.InstQueueRd_Addr  + 2 );
                            \P2.P2.P2.Flush  = 1'b0;
                            \P2.P2.P2.More  = 1'b0;
                        end
                    end
                    else
                    begin
                        \P2.P2.P2.Flush  = 1'b0;
                        \P2.P2.P2.More  = 1'b1;
                    end
                end
                \P2.P2.P2.OUT_al :
                begin
                    if ( ( \P2.P2.P2.InstQueueWr_Addr  - \P2.P2.P2.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P2.P2.P2.rEIP  <= ( \P2.P2.P2.InstQueueRd_Addr  + 1 );
                        \P2.P2.P2.RequestPending  <= \P2.P2.P2.Pending ;
                        \P2.P2.P2.ReadRequest  <= \P2.P2.P2.NotPending ;
                        \P2.P2.P2.MemoryFetch  <= \P2.P2.P2.NotPending ;
                        \P2.P2.P2.CodeFetch  <= \P2.P2.P2.NotPending ;
                        if ( ( \P2.P2.P2.State  == \P2.P2.P2.StateT1  ) | ( \P2.P2.P2.State  == \P2.P2.P2.StateT1P  ) ) 
                        begin
                            \P2.P2.P2.fWord  = ( \P2.P2.P2.EAX  % ( 2 ** 16 ) );
                            \P2.P2.P2.Datao  <= \P2.P2.P2.fWord ;
                            if ( \P2.P2.P2.READY_n  == 1'b0 ) 
                            begin
                                \P2.P2.P2.RequestPending  <= \P2.P2.P2.NotPending ;
                                \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 2 );
                                \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 2 ) % 16 );
                                \P2.P2.P2.Flush  = 1'b0;
                                \P2.P2.P2.More  = 1'b0;
                            end
                        end
                    end
                    else
                    begin
                        \P2.P2.P2.Flush  = 1'b0;
                        \P2.P2.P2.More  = 1'b1;
                    end
                end
                \P2.P2.P2.ADD_al_b :
                begin
                    \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 1 );
                    \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P2.Flush  = 1'b0;
                    \P2.P2.P2.More  = 1'b0;
                end
                \P2.P2.P2.ADD_ax_w :
                begin
                    \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 1 );
                    \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P2.Flush  = 1'b0;
                    \P2.P2.P2.More  = 1'b0;
                end
                \P2.P2.P2.ROL_al_1 :
                begin
                    \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 2 );
                    \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 2 ) % 16 );
                    \P2.P2.P2.Flush  = 1'b0;
                    \P2.P2.P2.More  = 1'b0;
                end
                \P2.P2.P2.ROL_al_n :
                begin
                    \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 2 );
                    \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 2 ) % 16 );
                    \P2.P2.P2.Flush  = 1'b0;
                    \P2.P2.P2.More  = 1'b0;
                end
                \P2.P2.P2.INC_eax :
                begin
                    \P2.P2.P2.EAX  <= ( \P2.P2.P2.EAX  + 1 );
                    \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 1 );
                    \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P2.Flush  = 1'b0;
                    \P2.P2.P2.More  = 1'b0;
                end
                \P2.P2.P2.INC_ebx :
                begin
                    \P2.P2.P2.EBX  <= ( \P2.P2.P2.EBX  + 1 );
                    \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 1 );
                    \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P2.Flush  = 1'b0;
                    \P2.P2.P2.More  = 1'b0;
                end
                default :
                begin
                    \P2.P2.P2.InstAddrPointer  = ( \P2.P2.P2.InstAddrPointer  + 1 );
                    \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P2.Flush  = 1'b0;
                    \P2.P2.P2.More  = 1'b0;
                end
                endcase
                if (  ~( ( \P2.P2.P2.InstQueueRd_Addr  < \P2.P2.P2.InstQueueWr_Addr  )) | ( ( ( ( \P2.P2.P2.InstQueueLimit  - \P2.P2.P2.InstQueueRd_Addr  ) < 4 ) | \P2.P2.P2.Flush  ) | \P2.P2.P2.More  ) ) 
                begin
                    \P2.P2.P2.State2  = \P2.P2.P2.S7 ;
                end
            end
            \P2.P2.P2.S6 :
            begin
                \P2.P2.P2.Datao  <= ( ( \P2.P2.P2.uWord  * ( 2 ** 16 ) ) + \P2.P2.P2.lWord  );
                if ( \P2.P2.P2.READY_n  == 1'b0 ) 
                begin
                    \P2.P2.P2.RequestPending  <= \P2.P2.P2.NotPending ;
                    \P2.P2.P2.State2  = \P2.P2.P2.S5 ;
                end
            end
            \P2.P2.P2.S7 :
            begin
                if ( \P2.P2.P2.Flush  ) 
                begin
                    \P2.P2.P2.InstQueueRd_Addr  = 1;
                    \P2.P2.P2.InstQueueWr_Addr  = 1;
                    if ( \P2.P2.P2.InstAddrPointer  < 0 ) 
                    begin
                        \P2.P2.P2.fWord  =  -( \P2.P2.P2.InstAddrPointer );
                    end
                    else
                    begin 
                        \P2.P2.P2.fWord  = \P2.P2.P2.InstAddrPointer ;
                    end
                    if ( ( \P2.P2.P2.fWord  % 2 ) == 1 ) 
                    begin
                        \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + ( \P2.P2.P2.fWord  % 4 ) ) % 16 );
                    end
                end
                if ( ( \P2.P2.P2.InstQueueLimit  - \P2.P2.P2.InstQueueRd_Addr  ) < 3 ) 
                begin
                    \P2.P2.P2.State2  = \P2.P2.P2.S8 ;
                    \P2.P2.P2.InstQueueWr_Addr  = 0;
                end
                else
                begin 
                    \P2.P2.P2.State2  = \P2.P2.P2.S9 ;
                end
            end
            \P2.P2.P2.S8 :
            begin
                if ( \P2.P2.P2.InstQueueRd_Addr  <= \P2.P2.P2.InstQueueLimit  ) 
                begin
                    \P2.P2.P2.InstQueue [\P2.P2.P2.InstQueueWr_Addr ] = \P2.P2.P2.InstQueue [\P2.P2.P2.InstQueueRd_Addr ];
                    \P2.P2.P2.InstQueueRd_Addr  = ( ( \P2.P2.P2.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P2.InstQueueWr_Addr  = ( ( \P2.P2.P2.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P2.P2.State2  = \P2.P2.P2.S8 ;
                end
                else
                begin
                    \P2.P2.P2.InstQueueRd_Addr  = 0;
                    \P2.P2.P2.State2  = \P2.P2.P2.S9 ;
                end
            end
            \P2.P2.P2.S9 :
            begin
                \P2.P2.P2.rEIP  <= \P2.P2.P2.PhyAddrPointer ;
                \P2.P2.P2.State2  = \P2.P2.P2.S1 ;
            end
            endcase
        end
    end
    always @ (  posedge \P2.P2.P2.CLOCK  or  posedge \P2.P2.P2.RESET )
    begin : \P2.P2.P2.P2 
        if ( \P2.P2.P2.RESET  == 1'b1 ) 
        begin
            \P2.P2.P2.ByteEnable  <= 4'b0000;
            \P2.P2.P2.NonAligned  <= 1'b0;
        end
        else
        begin 
            case ( \P2.P2.P2.DataWidth  ) 
            \P2.P2.P2.WidthByte :
            begin
                case ( \P2.P2.P2.rEIP  % 4 ) 
                0:
                begin
                    \P2.P2.P2.ByteEnable  <= 4'b1110;
                end
                1:
                begin
                    \P2.P2.P2.ByteEnable  <= 4'b1101;
                end
                2:
                begin
                    \P2.P2.P2.ByteEnable  <= 4'b1011;
                end
                3:
                begin
                    \P2.P2.P2.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            \P2.P2.P2.WidthWord :
            begin
                case ( \P2.P2.P2.rEIP  % 4 ) 
                0:
                begin
                    \P2.P2.P2.ByteEnable  <= 4'b1100;
                    \P2.P2.P2.NonAligned  <= \P2.P2.P2.NotPending ;
                end
                1:
                begin
                    \P2.P2.P2.ByteEnable  <= 4'b1001;
                    \P2.P2.P2.NonAligned  <= \P2.P2.P2.NotPending ;
                end
                2:
                begin
                    \P2.P2.P2.ByteEnable  <= 4'b0011;
                    \P2.P2.P2.NonAligned  <= \P2.P2.P2.NotPending ;
                end
                3:
                begin
                    \P2.P2.P2.ByteEnable  <= 4'b0111;
                    \P2.P2.P2.NonAligned  <= \P2.P2.P2.Pending ;
                end
                default :
                begin
                end
                endcase
            end
            \P2.P2.P2.WidthDword :
            begin
                case ( \P2.P2.P2.rEIP  % 4 ) 
                0:
                begin
                    \P2.P2.P2.ByteEnable  <= 4'b0000;
                    \P2.P2.P2.NonAligned  <= \P2.P2.P2.NotPending ;
                end
                1:
                begin
                    \P2.P2.P2.ByteEnable  <= 4'b0001;
                    \P2.P2.P2.NonAligned  <= \P2.P2.P2.Pending ;
                end
                2:
                begin
                    \P2.P2.P2.NonAligned  <= \P2.P2.P2.Pending ;
                    \P2.P2.P2.ByteEnable  <= 4'b0011;
                end
                3:
                begin
                    \P2.P2.P2.NonAligned  <= \P2.P2.P2.Pending ;
                    \P2.P2.P2.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            default :
            begin
            end
            endcase
        end
    end
    assign \P2.P2.be3  = \P2.P2.P3.BE_n ;
    assign \P2.P2.addr3  = \P2.P2.P3.Address ;
    assign \P2.P2.wr3  = \P2.P2.P3.W_R_n ;
    assign \P2.P2.dc3  = \P2.P2.P3.D_C_n ;
    assign \P2.P2.mio3  = \P2.P2.P3.M_IO_n ;
    assign \P2.P2.ads3  = \P2.P2.P3.ADS_n ;
    assign \P2.P2.P3.Datai  = \P2.P2.di3 ;
    assign \P2.P2.do3  = \P2.P2.P3.Datao ;
    assign \P2.P2.P3.CLOCK  = \P2.P2.clock ;
    assign \P2.P2.P3.NA_n  = \P2.P2.na ;
    assign \P2.P2.P3.BS16_n  = \P2.P2.bs16 ;
    assign \P2.P2.P3.READY_n  = \P2.P2.rdy3 ;
    assign \P2.P2.P3.HOLD  = \P2.P2.hold ;
    assign \P2.P2.P3.RESET  = \P2.P2.reset ;
    always @ (  posedge \P2.P2.P3.CLOCK  or  posedge \P2.P2.P3.RESET )
    begin : \P2.P2.P3.P0 
        if ( \P2.P2.P3.RESET  == 1'b1 ) 
        begin
            \P2.P2.P3.BE_n  <= 4'b0000;
            \P2.P2.P3.Address  <= 0;
            \P2.P2.P3.W_R_n  <= 1'b0;
            \P2.P2.P3.D_C_n  <= 1'b0;
            \P2.P2.P3.M_IO_n  <= 1'b0;
            \P2.P2.P3.ADS_n  <= 1'b0;
            \P2.P2.P3.State  <= \P2.P2.P3.StateInit ;
            \P2.P2.P3.StateNA  <= 1'b0;
            \P2.P2.P3.StateBS16  <= 1'b0;
            \P2.P2.P3.DataWidth  <= 0;
        end
        else
        begin 
            case ( \P2.P2.P3.State  ) 
            \P2.P2.P3.StateInit :
            begin
                \P2.P2.P3.D_C_n  <= 1'b1;
                \P2.P2.P3.ADS_n  <= 1'b1;
                \P2.P2.P3.State  <= \P2.P2.P3.StateTi ;
                \P2.P2.P3.StateNA  <= 1'b1;
                \P2.P2.P3.StateBS16  <= 1'b1;
                \P2.P2.P3.DataWidth  <= 2;
                \P2.P2.P3.State  <= \P2.P2.P3.StateTi ;
            end
            \P2.P2.P3.StateTi :
            begin
                if ( \P2.P2.P3.RequestPending  == \P2.P2.P3.Pending  ) 
                begin
                    \P2.P2.P3.State  <= \P2.P2.P3.StateT1 ;
                end
                else
                begin 
                    if ( \P2.P2.P3.HOLD  == 1'b1 ) 
                    begin
                        \P2.P2.P3.State  <= \P2.P2.P3.StateTh ;
                    end
                    else
                    begin 
                        \P2.P2.P3.State  <= \P2.P2.P3.StateTi ;
                    end
                end
            end
            \P2.P2.P3.StateT1 :
            begin
                \P2.P2.P3.Address  <= ( ( \P2.P2.P3.rEIP  / 4 ) % ( 2 ** 30 ) );
                \P2.P2.P3.BE_n  <= \P2.P2.P3.ByteEnable ;
                \P2.P2.P3.M_IO_n  <= \P2.P2.P3.MemoryFetch ;
                if ( \P2.P2.P3.ReadRequest  == \P2.P2.P3.Pending  ) 
                begin
                    \P2.P2.P3.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P2.P3.W_R_n  <= 1'b1;
                end
                if ( \P2.P2.P3.CodeFetch  == \P2.P2.P3.Pending  ) 
                begin
                    \P2.P2.P3.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P2.P3.D_C_n  <= 1'b1;
                end
                \P2.P2.P3.ADS_n  <= 1'b0;
                \P2.P2.P3.State  <= \P2.P2.P3.StateT2 ;
            end
            \P2.P2.P3.StateT2 :
            begin
                if ( ( ( \P2.P2.P3.READY_n  == 1'b0 ) & ( \P2.P2.P3.HOLD  == 1'b0 ) ) & ( \P2.P2.P3.RequestPending  == \P2.P2.P3.Pending  ) ) 
                begin
                    \P2.P2.P3.State  <= \P2.P2.P3.StateT1 ;
                end
                else
                begin 
                    if ( ( \P2.P2.P3.READY_n  == 1'b1 ) & ( \P2.P2.P3.NA_n  == 1'b1 ) ) 
                    begin
                    end
                    else
                    begin 
                        if ( ( ( \P2.P2.P3.RequestPending  == \P2.P2.P3.Pending  ) | ( \P2.P2.P3.HOLD  == 1'b1 ) ) & ( ( \P2.P2.P3.READY_n  == 1'b1 ) & ( \P2.P2.P3.NA_n  == 1'b0 ) ) ) 
                        begin
                            \P2.P2.P3.State  <= \P2.P2.P3.StateT2I ;
                        end
                        else
                        begin 
                            if ( ( ( ( \P2.P2.P3.RequestPending  == \P2.P2.P3.Pending  ) & ( \P2.P2.P3.HOLD  == 1'b0 ) ) & ( \P2.P2.P3.READY_n  == 1'b1 ) ) & ( \P2.P2.P3.NA_n  == 1'b0 ) ) 
                            begin
                                \P2.P2.P3.State  <= \P2.P2.P3.StateT2P ;
                            end
                            else
                            begin 
                                if ( ( ( \P2.P2.P3.RequestPending  == \P2.P2.P3.NotPending  ) & ( \P2.P2.P3.HOLD  == 1'b0 ) ) & ( \P2.P2.P3.READY_n  == 1'b0 ) ) 
                                begin
                                    \P2.P2.P3.State  <= \P2.P2.P3.StateTi ;
                                end
                                else
                                begin 
                                    if ( ( \P2.P2.P3.HOLD  == 1'b1 ) & ( \P2.P2.P3.READY_n  == 1'b1 ) ) 
                                    begin
                                        \P2.P2.P3.State  <= \P2.P2.P3.StateTh ;
                                    end
                                    else
                                    begin 
                                        \P2.P2.P3.State  <= \P2.P2.P3.StateT2 ;
                                    end
                                end
                            end
                        end
                    end
                end
                \P2.P2.P3.StateBS16  <= \P2.P2.P3.BS16_n ;
                if ( \P2.P2.P3.BS16_n  == 1'b0 ) 
                begin
                    \P2.P2.P3.DataWidth  <= \P2.P2.P3.WidthWord ;
                end
                else
                begin 
                    \P2.P2.P3.DataWidth  <= \P2.P2.P3.WidthDword ;
                end
                \P2.P2.P3.StateNA  <= \P2.P2.P3.NA_n ;
                \P2.P2.P3.ADS_n  <= 1'b1;
            end
            \P2.P2.P3.StateT1P :
            begin
                if ( ( ( \P2.P2.P3.NA_n  == 1'b0 ) & ( \P2.P2.P3.HOLD  == 1'b0 ) ) & ( \P2.P2.P3.RequestPending  == \P2.P2.P3.Pending  ) ) 
                begin
                    \P2.P2.P3.State  <= \P2.P2.P3.StateT2P ;
                end
                else
                begin 
                    if ( ( \P2.P2.P3.NA_n  == 1'b0 ) & ( ( \P2.P2.P3.HOLD  == 1'b1 ) | ( \P2.P2.P3.RequestPending  == \P2.P2.P3.NotPending  ) ) ) 
                    begin
                        \P2.P2.P3.State  <= \P2.P2.P3.StateT2I ;
                    end
                    else
                    begin 
                        if ( \P2.P2.P3.NA_n  == 1'b1 ) 
                        begin
                            \P2.P2.P3.State  <= \P2.P2.P3.StateT2 ;
                        end
                        else
                        begin 
                            \P2.P2.P3.State  <= \P2.P2.P3.StateT1P ;
                        end
                    end
                end
                \P2.P2.P3.StateBS16  <= \P2.P2.P3.BS16_n ;
                if ( \P2.P2.P3.BS16_n  == 1'b0 ) 
                begin
                    \P2.P2.P3.DataWidth  <= \P2.P2.P3.WidthWord ;
                end
                else
                begin 
                    \P2.P2.P3.DataWidth  <= \P2.P2.P3.WidthDword ;
                end
                \P2.P2.P3.StateNA  <= \P2.P2.P3.NA_n ;
                \P2.P2.P3.ADS_n  <= 1'b1;
            end
            \P2.P2.P3.StateTh :
            begin
                if ( ( \P2.P2.P3.HOLD  == 1'b0 ) & ( \P2.P2.P3.RequestPending  == \P2.P2.P3.Pending  ) ) 
                begin
                    \P2.P2.P3.State  <= \P2.P2.P3.StateT1 ;
                end
                else
                begin 
                    if ( ( \P2.P2.P3.HOLD  == 1'b0 ) & ( \P2.P2.P3.RequestPending  == \P2.P2.P3.NotPending  ) ) 
                    begin
                        \P2.P2.P3.State  <= \P2.P2.P3.StateTi ;
                    end
                    else
                    begin 
                        \P2.P2.P3.State  <= \P2.P2.P3.StateTh ;
                    end
                end
            end
            \P2.P2.P3.StateT2P :
            begin
                \P2.P2.P3.Address  <= ( ( \P2.P2.P3.rEIP  / 2 ) % ( 2 ** 30 ) );
                \P2.P2.P3.BE_n  <= \P2.P2.P3.ByteEnable ;
                \P2.P2.P3.M_IO_n  <= \P2.P2.P3.MemoryFetch ;
                if ( \P2.P2.P3.ReadRequest  == \P2.P2.P3.Pending  ) 
                begin
                    \P2.P2.P3.W_R_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P2.P3.W_R_n  <= 1'b1;
                end
                if ( \P2.P2.P3.CodeFetch  == \P2.P2.P3.Pending  ) 
                begin
                    \P2.P2.P3.D_C_n  <= 1'b0;
                end
                else
                begin 
                    \P2.P2.P3.D_C_n  <= 1'b1;
                end
                \P2.P2.P3.ADS_n  <= 1'b0;
                if ( \P2.P2.P3.READY_n  == 1'b0 ) 
                begin
                    \P2.P2.P3.State  <= \P2.P2.P3.StateT1P ;
                end
                else
                begin 
                    \P2.P2.P3.State  <= \P2.P2.P3.StateT2P ;
                end
            end
            \P2.P2.P3.StateT2I :
            begin
                if ( ( ( \P2.P2.P3.READY_n  == 1'b1 ) & ( \P2.P2.P3.RequestPending  == \P2.P2.P3.Pending  ) ) & ( \P2.P2.P3.HOLD  == 1'b0 ) ) 
                begin
                    \P2.P2.P3.State  <= \P2.P2.P3.StateT2P ;
                end
                else
                begin 
                    if ( ( \P2.P2.P3.READY_n  == 1'b0 ) & ( \P2.P2.P3.HOLD  == 1'b1 ) ) 
                    begin
                        \P2.P2.P3.State  <= \P2.P2.P3.StateTh ;
                    end
                    else
                    begin 
                        if ( ( ( \P2.P2.P3.READY_n  == 1'b0 ) & ( \P2.P2.P3.HOLD  == 1'b0 ) ) & ( \P2.P2.P3.RequestPending  == \P2.P2.P3.Pending  ) ) 
                        begin
                            \P2.P2.P3.State  <= \P2.P2.P3.StateT1 ;
                        end
                        else
                        begin 
                            if ( ( ( \P2.P2.P3.READY_n  == 1'b0 ) & ( \P2.P2.P3.HOLD  == 1'b0 ) ) & ( \P2.P2.P3.RequestPending  == \P2.P2.P3.NotPending  ) ) 
                            begin
                                \P2.P2.P3.State  <= \P2.P2.P3.StateTi ;
                            end
                            else
                            begin 
                                \P2.P2.P3.State  <= \P2.P2.P3.StateT2I ;
                            end
                        end
                    end
                end
            end
            endcase
        end
    end
    always @ (  posedge \P2.P2.P3.CLOCK  or  posedge \P2.P2.P3.RESET )
    begin : \P2.P2.P3.P1 
        reg [7:0] \P2.P2.P3.InstQueue [15:0];
        reg [4:0] \P2.P2.P3.InstQueueRd_Addr ;
        reg [4:0] \P2.P2.P3.InstQueueWr_Addr ;
        parameter \P2.P2.P3.InstQueueLimit   = 15;
        integer \P2.P2.P3.InstAddrPointer ;
        integer \P2.P2.P3.PhyAddrPointer ;
        reg  \P2.P2.P3.Extended ;
        reg  \P2.P2.P3.More ;
        reg  \P2.P2.P3.Flush ;
        reg [15:0] \P2.P2.P3.lWord ;
        reg [14:0] \P2.P2.P3.uWord ;
        integer \P2.P2.P3.fWord ;
        reg [3:0] \P2.P2.P3.State2 ;
        parameter \P2.P2.P3.Si   = 0;
        parameter \P2.P2.P3.S1   = 1;
        parameter \P2.P2.P3.S2   = 2;
        parameter \P2.P2.P3.S3   = 3;
        parameter \P2.P2.P3.S4   = 4;
        parameter \P2.P2.P3.S5   = 5;
        parameter \P2.P2.P3.S6   = 6;
        parameter \P2.P2.P3.S7   = 7;
        parameter \P2.P2.P3.S8   = 8;
        parameter \P2.P2.P3.S9   = 9;
        if ( \P2.P2.P3.RESET  == 1'b1 ) 
        begin
            \P2.P2.P3.State2  = \P2.P2.P3.Si ;
            \P2.P2.P3.InstQueue  = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            \P2.P2.P3.InstQueueRd_Addr  = 0;
            \P2.P2.P3.InstQueueWr_Addr  = 0;
            \P2.P2.P3.InstAddrPointer  = 0;
            \P2.P2.P3.PhyAddrPointer  = 0;
            \P2.P2.P3.Extended  = 1'b0;
            \P2.P2.P3.More  = 1'b0;
            \P2.P2.P3.Flush  = 1'b0;
            \P2.P2.P3.lWord  = 0;
            \P2.P2.P3.uWord  = 0;
            \P2.P2.P3.fWord  = 0;
            \P2.P2.P3.CodeFetch  <= 1'b0;
            \P2.P2.P3.Datao  <= 0;
            \P2.P2.P3.EAX  <= 0;
            \P2.P2.P3.EBX  <= 0;
            \P2.P2.P3.rEIP  <= 0;
            \P2.P2.P3.ReadRequest  <= 1'b0;
            \P2.P2.P3.MemoryFetch  <= 1'b0;
            \P2.P2.P3.RequestPending  <= 1'b0;
        end
        else
        begin 
            case ( \P2.P2.P3.State2  ) 
            \P2.P2.P3.Si :
            begin
                \P2.P2.P3.PhyAddrPointer  = \P2.P2.P3.rEIP ;
                \P2.P2.P3.InstAddrPointer  = \P2.P2.P3.PhyAddrPointer ;
                \P2.P2.P3.State2  = \P2.P2.P3.S1 ;
                \P2.P2.P3.rEIP  <= 20'hFFFF0;
                \P2.P2.P3.ReadRequest  <= 1'b1;
                \P2.P2.P3.MemoryFetch  <= 1'b1;
                \P2.P2.P3.RequestPending  <= 1'b1;
            end
            \P2.P2.P3.S1 :
            begin
                \P2.P2.P3.RequestPending  <= \P2.P2.P3.Pending ;
                \P2.P2.P3.ReadRequest  <= \P2.P2.P3.Pending ;
                \P2.P2.P3.MemoryFetch  <= \P2.P2.P3.Pending ;
                \P2.P2.P3.CodeFetch  <= \P2.P2.P3.Pending ;
                if ( \P2.P2.P3.READY_n  == 1'b0 ) 
                begin
                    \P2.P2.P3.State2  = \P2.P2.P3.S2 ;
                end
                else
                begin 
                    \P2.P2.P3.State2  = \P2.P2.P3.S1 ;
                end
            end
            \P2.P2.P3.S2 :
            begin
                \P2.P2.P3.RequestPending  <= \P2.P2.P3.NotPending ;
                \P2.P2.P3.InstQueue [\P2.P2.P3.InstQueueWr_Addr ] = ( \P2.P2.P3.Datai  % ( 2 ** 8 ) );
                \P2.P2.P3.InstQueueWr_Addr  = ( ( \P2.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P2.P3.InstQueue [\P2.P2.P3.InstQueueWr_Addr ] = ( \P2.P2.P3.Datai  % ( 2 ** 8 ) );
                \P2.P2.P3.InstQueueWr_Addr  = ( ( \P2.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                if ( \P2.P2.P3.StateBS16  == 1'b1 ) 
                begin
                    \P2.P2.P3.InstQueue [\P2.P2.P3.InstQueueWr_Addr ] = ( ( \P2.P2.P3.Datai  / ( 2 ** 16 ) ) % ( 2 ** 8 ) );
                    \P2.P2.P3.InstQueueWr_Addr  = ( ( \P2.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P2.P3.InstQueue [\P2.P2.P3.InstQueueWr_Addr ] = ( ( \P2.P2.P3.Datai  / ( 2 ** 24 ) ) % ( 2 ** 8 ) );
                    \P2.P2.P3.InstQueueWr_Addr  = ( ( \P2.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P2.P3.PhyAddrPointer  = ( \P2.P2.P3.PhyAddrPointer  + 4 );
                    \P2.P2.P3.State2  = \P2.P2.P3.S5 ;
                end
                else
                begin
                    \P2.P2.P3.PhyAddrPointer  = ( \P2.P2.P3.PhyAddrPointer  + 2 );
                    if ( \P2.P2.P3.PhyAddrPointer  < 0 ) 
                    begin
                        \P2.P2.P3.rEIP  <=  -( \P2.P2.P3.PhyAddrPointer );
                    end
                    else
                    begin 
                        \P2.P2.P3.rEIP  <= \P2.P2.P3.PhyAddrPointer ;
                    end
                    \P2.P2.P3.State2  = \P2.P2.P3.S3 ;
                end
            end
            \P2.P2.P3.S3 :
            begin
                \P2.P2.P3.RequestPending  <= \P2.P2.P3.Pending ;
                if ( \P2.P2.P3.READY_n  == 1'b0 ) 
                begin
                    \P2.P2.P3.State2  = \P2.P2.P3.S4 ;
                end
                else
                begin 
                    \P2.P2.P3.State2  = \P2.P2.P3.S3 ;
                end
            end
            \P2.P2.P3.S4 :
            begin
                \P2.P2.P3.RequestPending  <= \P2.P2.P3.NotPending ;
                \P2.P2.P3.InstQueue [\P2.P2.P3.InstQueueWr_Addr ] = ( \P2.P2.P3.Datai  % ( 2 ** 8 ) );
                \P2.P2.P3.InstQueueWr_Addr  = ( ( \P2.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P2.P3.InstQueue [\P2.P2.P3.InstQueueWr_Addr ] = ( \P2.P2.P3.Datai  % ( 2 ** 8 ) );
                \P2.P2.P3.InstQueueWr_Addr  = ( ( \P2.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                \P2.P2.P3.PhyAddrPointer  = ( \P2.P2.P3.PhyAddrPointer  + 2 );
                \P2.P2.P3.State2  = \P2.P2.P3.S5 ;
            end
            \P2.P2.P3.S5 :
            begin
                case ( \P2.P2.P3.InstQueue [\P2.P2.P3.InstQueueRd_Addr ] ) 
                \P2.P2.P3.NOP :
                begin
                    \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 1 );
                    \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P3.Flush  = 1'b0;
                    \P2.P2.P3.More  = 1'b0;
                end
                \P2.P2.P3.OPsop :
                begin
                    \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 1 );
                    \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P3.Extended  = 1'b1;
                    \P2.P2.P3.Flush  = 1'b0;
                    \P2.P2.P3.More  = 1'b0;
                end
                \P2.P2.P3.JMP_rel_short :
                begin
                    if ( ( \P2.P2.P3.InstQueueWr_Addr  - \P2.P2.P3.InstQueueRd_Addr  ) >= 3 ) 
                    begin
                        if ( \P2.P2.P3.InstQueue [( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 )] > 127 ) 
                        begin
                            \P2.P2.P3.PhyAddrPointer  = ( ( \P2.P2.P3.InstAddrPointer  + 1 ) - ( 8'hFF - \P2.P2.P3.InstQueue [( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 )] ) );
                            \P2.P2.P3.InstAddrPointer  = \P2.P2.P3.PhyAddrPointer ;
                        end
                        else
                        begin
                            \P2.P2.P3.PhyAddrPointer  = ( ( \P2.P2.P3.InstAddrPointer  + 2 ) + \P2.P2.P3.InstQueue [( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 )] );
                            \P2.P2.P3.InstAddrPointer  = \P2.P2.P3.PhyAddrPointer ;
                        end
                        \P2.P2.P3.Flush  = 1'b1;
                        \P2.P2.P3.More  = 1'b0;
                    end
                    else
                    begin
                        \P2.P2.P3.Flush  = 1'b0;
                        \P2.P2.P3.More  = 1'b1;
                    end
                end
                \P2.P2.P3.JMP_rel_near :
                begin
                    if ( ( \P2.P2.P3.InstQueueWr_Addr  - \P2.P2.P3.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P2.P3.PhyAddrPointer  = ( ( \P2.P2.P3.InstAddrPointer  + 5 ) + \P2.P2.P3.InstQueue [( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P2.P2.P3.InstAddrPointer  = \P2.P2.P3.PhyAddrPointer ;
                        \P2.P2.P3.Flush  = 1'b1;
                        \P2.P2.P3.More  = 1'b0;
                    end
                    else
                    begin
                        \P2.P2.P3.Flush  = 1'b0;
                        \P2.P2.P3.More  = 1'b1;
                    end
                end
                \P2.P2.P3.JMP_intseg_immed :
                begin
                    \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 1 );
                    \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P3.Flush  = 1'b0;
                    \P2.P2.P3.More  = 1'b0;
                end
                \P2.P2.P3.MOV_al_b :
                begin
                    \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 1 );
                    \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P3.Flush  = 1'b0;
                    \P2.P2.P3.More  = 1'b0;
                end
                \P2.P2.P3.MOV_eax_dw :
                begin
                    if ( ( \P2.P2.P3.InstQueueWr_Addr  - \P2.P2.P3.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P2.P3.EAX  <= ( ( ( ( \P2.P2.P3.InstQueue [( ( \P2.P2.P3.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P2.P2.P3.InstQueue [( ( \P2.P2.P3.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P2.P2.P3.InstQueue [( ( \P2.P2.P3.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P2.P2.P3.InstQueue [( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 )] );
                        \P2.P2.P3.More  = 1'b0;
                        \P2.P2.P3.Flush  = 1'b0;
                        \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 5 );
                        \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P2.P2.P3.Flush  = 1'b0;
                        \P2.P2.P3.More  = 1'b1;
                    end
                end
                \P2.P2.P3.MOV_ebx_dw :
                begin
                    if ( ( \P2.P2.P3.InstQueueWr_Addr  - \P2.P2.P3.InstQueueRd_Addr  ) >= 5 ) 
                    begin
                        \P2.P2.P3.EBX  <= ( ( ( ( \P2.P2.P3.InstQueue [( ( \P2.P2.P3.InstQueueRd_Addr  + 4 ) % 16 )] * ( 2 ** 23 ) ) + ( \P2.P2.P3.InstQueue [( ( \P2.P2.P3.InstQueueRd_Addr  + 3 ) % 16 )] * ( 2 ** 16 ) ) ) + ( \P2.P2.P3.InstQueue [( ( \P2.P2.P3.InstQueueRd_Addr  + 2 ) % 16 )] * ( 2 ** 8 ) ) ) + \P2.P2.P3.InstQueue [( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 1 )] );
                        \P2.P2.P3.More  = 1'b0;
                        \P2.P2.P3.Flush  = 1'b0;
                        \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 5 );
                        \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 5 ) % 16 );
                    end
                    else
                    begin
                        \P2.P2.P3.Flush  = 1'b0;
                        \P2.P2.P3.More  = 1'b1;
                    end
                end
                \P2.P2.P3.MOV_eax_ebx :
                begin
                    if ( ( \P2.P2.P3.InstQueueWr_Addr  - \P2.P2.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P2.P2.P3.EBX  < 0 ) 
                        begin
                            \P2.P2.P3.rEIP  <=  -( \P2.P2.P3.EBX );
                        end
                        else
                        begin 
                            \P2.P2.P3.rEIP  <= \P2.P2.P3.EBX ;
                        end
                        \P2.P2.P3.RequestPending  <= \P2.P2.P3.Pending ;
                        \P2.P2.P3.ReadRequest  <= \P2.P2.P3.Pending ;
                        \P2.P2.P3.MemoryFetch  <= \P2.P2.P3.Pending ;
                        \P2.P2.P3.CodeFetch  <= \P2.P2.P3.NotPending ;
                        if ( \P2.P2.P3.READY_n  == 1'b0 ) 
                        begin
                            \P2.P2.P3.RequestPending  <= \P2.P2.P3.NotPending ;
                            \P2.P2.P3.uWord  = ( \P2.P2.P3.Datai  % ( 2 ** 15 ) );
                            if ( \P2.P2.P3.StateBS16  == 1'b1 ) 
                            begin
                                \P2.P2.P3.lWord  = ( \P2.P2.P3.Datai  % ( 2 ** 16 ) );
                            end
                            else
                            begin
                                \P2.P2.P3.rEIP  <= ( \P2.P2.P3.rEIP  + 2 );
                                \P2.P2.P3.RequestPending  <= \P2.P2.P3.Pending ;
                                if ( \P2.P2.P3.READY_n  == 1'b0 ) 
                                begin
                                    \P2.P2.P3.RequestPending  <= \P2.P2.P3.NotPending ;
                                    \P2.P2.P3.lWord  = ( \P2.P2.P3.Datai  % ( 2 ** 16 ) );
                                end
                            end
                            if ( \P2.P2.P3.READY_n  == 1'b0 ) 
                            begin
                                \P2.P2.P3.EAX  <= ( ( \P2.P2.P3.uWord  * ( 2 ** 16 ) ) + \P2.P2.P3.lWord  );
                                \P2.P2.P3.More  = 1'b0;
                                \P2.P2.P3.Flush  = 1'b0;
                                \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 2 );
                                \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P2.P2.P3.Flush  = 1'b0;
                        \P2.P2.P3.More  = 1'b1;
                    end
                end
                \P2.P2.P3.MOV_ebx_eax :
                begin
                    if ( ( \P2.P2.P3.InstQueueWr_Addr  - \P2.P2.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        if ( \P2.P2.P3.EBX  < 0 ) 
                        begin
                            \P2.P2.P3.rEIP  <= \P2.P2.P3.EBX ;
                        end
                        else
                        begin 
                            \P2.P2.P3.rEIP  <= \P2.P2.P3.EBX ;
                        end
                        \P2.P2.P3.lWord  = ( \P2.P2.P3.EAX  % ( 2 ** 16 ) );
                        \P2.P2.P3.uWord  = ( ( \P2.P2.P3.EAX  / ( 2 ** 16 ) ) % ( 2 ** 15 ) );
                        \P2.P2.P3.RequestPending  <= \P2.P2.P3.Pending ;
                        \P2.P2.P3.ReadRequest  <= \P2.P2.P3.NotPending ;
                        \P2.P2.P3.MemoryFetch  <= \P2.P2.P3.Pending ;
                        \P2.P2.P3.CodeFetch  <= \P2.P2.P3.NotPending ;
                        if ( ( \P2.P2.P3.State  == \P2.P2.P3.StateT1  ) | ( \P2.P2.P3.State  == \P2.P2.P3.StateT1P  ) ) 
                        begin
                            \P2.P2.P3.Datao  <= ( ( \P2.P2.P3.uWord  * ( 2 ** 16 ) ) + \P2.P2.P3.lWord  );
                            if ( \P2.P2.P3.READY_n  == 1'b0 ) 
                            begin
                                \P2.P2.P3.RequestPending  <= \P2.P2.P3.NotPending ;
                                if ( \P2.P2.P3.StateBS16  == 1'b0 ) 
                                begin
                                    \P2.P2.P3.rEIP  <= ( \P2.P2.P3.rEIP  + 2 );
                                    \P2.P2.P3.RequestPending  <= \P2.P2.P3.Pending ;
                                    \P2.P2.P3.ReadRequest  <= \P2.P2.P3.NotPending ;
                                    \P2.P2.P3.MemoryFetch  <= \P2.P2.P3.Pending ;
                                    \P2.P2.P3.CodeFetch  <= \P2.P2.P3.NotPending ;
                                    \P2.P2.P3.State2  = \P2.P2.P3.S6 ;
                                end
                                \P2.P2.P3.More  = 1'b0;
                                \P2.P2.P3.Flush  = 1'b0;
                                \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 2 );
                                \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 2 ) % 16 );
                            end
                        end
                    end
                    else
                    begin
                        \P2.P2.P3.Flush  = 1'b0;
                        \P2.P2.P3.More  = 1'b1;
                    end
                end
                \P2.P2.P3.IN_al :
                begin
                    if ( ( \P2.P2.P3.InstQueueWr_Addr  - \P2.P2.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P2.P2.P3.rEIP  <= ( \P2.P2.P3.InstQueueRd_Addr  + 1 );
                        \P2.P2.P3.RequestPending  <= \P2.P2.P3.Pending ;
                        \P2.P2.P3.ReadRequest  <= \P2.P2.P3.Pending ;
                        \P2.P2.P3.MemoryFetch  <= \P2.P2.P3.NotPending ;
                        \P2.P2.P3.CodeFetch  <= \P2.P2.P3.NotPending ;
                        if ( \P2.P2.P3.READY_n  == 1'b0 ) 
                        begin
                            \P2.P2.P3.RequestPending  <= \P2.P2.P3.NotPending ;
                            \P2.P2.P3.EAX  <= \P2.P2.P3.Datai ;
                            \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 2 );
                            \P2.P2.P3.InstQueueRd_Addr  = ( \P2.P2.P3.InstQueueRd_Addr  + 2 );
                            \P2.P2.P3.Flush  = 1'b0;
                            \P2.P2.P3.More  = 1'b0;
                        end
                    end
                    else
                    begin
                        \P2.P2.P3.Flush  = 1'b0;
                        \P2.P2.P3.More  = 1'b1;
                    end
                end
                \P2.P2.P3.OUT_al :
                begin
                    if ( ( \P2.P2.P3.InstQueueWr_Addr  - \P2.P2.P3.InstQueueRd_Addr  ) >= 2 ) 
                    begin
                        \P2.P2.P3.rEIP  <= ( \P2.P2.P3.InstQueueRd_Addr  + 1 );
                        \P2.P2.P3.RequestPending  <= \P2.P2.P3.Pending ;
                        \P2.P2.P3.ReadRequest  <= \P2.P2.P3.NotPending ;
                        \P2.P2.P3.MemoryFetch  <= \P2.P2.P3.NotPending ;
                        \P2.P2.P3.CodeFetch  <= \P2.P2.P3.NotPending ;
                        if ( ( \P2.P2.P3.State  == \P2.P2.P3.StateT1  ) | ( \P2.P2.P3.State  == \P2.P2.P3.StateT1P  ) ) 
                        begin
                            \P2.P2.P3.fWord  = ( \P2.P2.P3.EAX  % ( 2 ** 16 ) );
                            \P2.P2.P3.Datao  <= \P2.P2.P3.fWord ;
                            if ( \P2.P2.P3.READY_n  == 1'b0 ) 
                            begin
                                \P2.P2.P3.RequestPending  <= \P2.P2.P3.NotPending ;
                                \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 2 );
                                \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 2 ) % 16 );
                                \P2.P2.P3.Flush  = 1'b0;
                                \P2.P2.P3.More  = 1'b0;
                            end
                        end
                    end
                    else
                    begin
                        \P2.P2.P3.Flush  = 1'b0;
                        \P2.P2.P3.More  = 1'b1;
                    end
                end
                \P2.P2.P3.ADD_al_b :
                begin
                    \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 1 );
                    \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P3.Flush  = 1'b0;
                    \P2.P2.P3.More  = 1'b0;
                end
                \P2.P2.P3.ADD_ax_w :
                begin
                    \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 1 );
                    \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P3.Flush  = 1'b0;
                    \P2.P2.P3.More  = 1'b0;
                end
                \P2.P2.P3.ROL_al_1 :
                begin
                    \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 2 );
                    \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 2 ) % 16 );
                    \P2.P2.P3.Flush  = 1'b0;
                    \P2.P2.P3.More  = 1'b0;
                end
                \P2.P2.P3.ROL_al_n :
                begin
                    \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 2 );
                    \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 2 ) % 16 );
                    \P2.P2.P3.Flush  = 1'b0;
                    \P2.P2.P3.More  = 1'b0;
                end
                \P2.P2.P3.INC_eax :
                begin
                    \P2.P2.P3.EAX  <= ( \P2.P2.P3.EAX  + 1 );
                    \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 1 );
                    \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P3.Flush  = 1'b0;
                    \P2.P2.P3.More  = 1'b0;
                end
                \P2.P2.P3.INC_ebx :
                begin
                    \P2.P2.P3.EBX  <= ( \P2.P2.P3.EBX  + 1 );
                    \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 1 );
                    \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P3.Flush  = 1'b0;
                    \P2.P2.P3.More  = 1'b0;
                end
                default :
                begin
                    \P2.P2.P3.InstAddrPointer  = ( \P2.P2.P3.InstAddrPointer  + 1 );
                    \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P3.Flush  = 1'b0;
                    \P2.P2.P3.More  = 1'b0;
                end
                endcase
                if (  ~( ( \P2.P2.P3.InstQueueRd_Addr  < \P2.P2.P3.InstQueueWr_Addr  )) | ( ( ( ( \P2.P2.P3.InstQueueLimit  - \P2.P2.P3.InstQueueRd_Addr  ) < 4 ) | \P2.P2.P3.Flush  ) | \P2.P2.P3.More  ) ) 
                begin
                    \P2.P2.P3.State2  = \P2.P2.P3.S7 ;
                end
            end
            \P2.P2.P3.S6 :
            begin
                \P2.P2.P3.Datao  <= ( ( \P2.P2.P3.uWord  * ( 2 ** 16 ) ) + \P2.P2.P3.lWord  );
                if ( \P2.P2.P3.READY_n  == 1'b0 ) 
                begin
                    \P2.P2.P3.RequestPending  <= \P2.P2.P3.NotPending ;
                    \P2.P2.P3.State2  = \P2.P2.P3.S5 ;
                end
            end
            \P2.P2.P3.S7 :
            begin
                if ( \P2.P2.P3.Flush  ) 
                begin
                    \P2.P2.P3.InstQueueRd_Addr  = 1;
                    \P2.P2.P3.InstQueueWr_Addr  = 1;
                    if ( \P2.P2.P3.InstAddrPointer  < 0 ) 
                    begin
                        \P2.P2.P3.fWord  =  -( \P2.P2.P3.InstAddrPointer );
                    end
                    else
                    begin 
                        \P2.P2.P3.fWord  = \P2.P2.P3.InstAddrPointer ;
                    end
                    if ( ( \P2.P2.P3.fWord  % 2 ) == 1 ) 
                    begin
                        \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + ( \P2.P2.P3.fWord  % 4 ) ) % 16 );
                    end
                end
                if ( ( \P2.P2.P3.InstQueueLimit  - \P2.P2.P3.InstQueueRd_Addr  ) < 3 ) 
                begin
                    \P2.P2.P3.State2  = \P2.P2.P3.S8 ;
                    \P2.P2.P3.InstQueueWr_Addr  = 0;
                end
                else
                begin 
                    \P2.P2.P3.State2  = \P2.P2.P3.S9 ;
                end
            end
            \P2.P2.P3.S8 :
            begin
                if ( \P2.P2.P3.InstQueueRd_Addr  <= \P2.P2.P3.InstQueueLimit  ) 
                begin
                    \P2.P2.P3.InstQueue [\P2.P2.P3.InstQueueWr_Addr ] = \P2.P2.P3.InstQueue [\P2.P2.P3.InstQueueRd_Addr ];
                    \P2.P2.P3.InstQueueRd_Addr  = ( ( \P2.P2.P3.InstQueueRd_Addr  + 1 ) % 16 );
                    \P2.P2.P3.InstQueueWr_Addr  = ( ( \P2.P2.P3.InstQueueWr_Addr  + 1 ) % 16 );
                    \P2.P2.P3.State2  = \P2.P2.P3.S8 ;
                end
                else
                begin
                    \P2.P2.P3.InstQueueRd_Addr  = 0;
                    \P2.P2.P3.State2  = \P2.P2.P3.S9 ;
                end
            end
            \P2.P2.P3.S9 :
            begin
                \P2.P2.P3.rEIP  <= \P2.P2.P3.PhyAddrPointer ;
                \P2.P2.P3.State2  = \P2.P2.P3.S1 ;
            end
            endcase
        end
    end
    always @ (  posedge \P2.P2.P3.CLOCK  or  posedge \P2.P2.P3.RESET )
    begin : \P2.P2.P3.P2 
        if ( \P2.P2.P3.RESET  == 1'b1 ) 
        begin
            \P2.P2.P3.ByteEnable  <= 4'b0000;
            \P2.P2.P3.NonAligned  <= 1'b0;
        end
        else
        begin 
            case ( \P2.P2.P3.DataWidth  ) 
            \P2.P2.P3.WidthByte :
            begin
                case ( \P2.P2.P3.rEIP  % 4 ) 
                0:
                begin
                    \P2.P2.P3.ByteEnable  <= 4'b1110;
                end
                1:
                begin
                    \P2.P2.P3.ByteEnable  <= 4'b1101;
                end
                2:
                begin
                    \P2.P2.P3.ByteEnable  <= 4'b1011;
                end
                3:
                begin
                    \P2.P2.P3.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            \P2.P2.P3.WidthWord :
            begin
                case ( \P2.P2.P3.rEIP  % 4 ) 
                0:
                begin
                    \P2.P2.P3.ByteEnable  <= 4'b1100;
                    \P2.P2.P3.NonAligned  <= \P2.P2.P3.NotPending ;
                end
                1:
                begin
                    \P2.P2.P3.ByteEnable  <= 4'b1001;
                    \P2.P2.P3.NonAligned  <= \P2.P2.P3.NotPending ;
                end
                2:
                begin
                    \P2.P2.P3.ByteEnable  <= 4'b0011;
                    \P2.P2.P3.NonAligned  <= \P2.P2.P3.NotPending ;
                end
                3:
                begin
                    \P2.P2.P3.ByteEnable  <= 4'b0111;
                    \P2.P2.P3.NonAligned  <= \P2.P2.P3.Pending ;
                end
                default :
                begin
                end
                endcase
            end
            \P2.P2.P3.WidthDword :
            begin
                case ( \P2.P2.P3.rEIP  % 4 ) 
                0:
                begin
                    \P2.P2.P3.ByteEnable  <= 4'b0000;
                    \P2.P2.P3.NonAligned  <= \P2.P2.P3.NotPending ;
                end
                1:
                begin
                    \P2.P2.P3.ByteEnable  <= 4'b0001;
                    \P2.P2.P3.NonAligned  <= \P2.P2.P3.Pending ;
                end
                2:
                begin
                    \P2.P2.P3.NonAligned  <= \P2.P2.P3.Pending ;
                    \P2.P2.P3.ByteEnable  <= 4'b0011;
                end
                3:
                begin
                    \P2.P2.P3.NonAligned  <= \P2.P2.P3.Pending ;
                    \P2.P2.P3.ByteEnable  <= 4'b0111;
                end
                default :
                begin
                end
                endcase
            end
            default :
            begin
            end
            endcase
        end
    end
    assign \P2.P3.clock  = \P2.clock ;
    assign \P2.P3.reset  = \P2.reset ;
    assign \P2.ad31  = \P2.P3.addr ;
    assign \P2.P3.datai  = \P2.di3 ;
    assign \P2.do3  = \P2.P3.datao ;
    assign \P2.rd3  = \P2.P3.rd ;
    assign \P2.wr3  = \P2.P3.wr ;
    always @ (  posedge \P2.P3.clock  or  posedge \P2.P3.reset )
    begin : \P2.P3.xhdl0 
        integer \P2.P3.reg0 ;
        integer \P2.P3.reg1 ;
        integer \P2.P3.reg2 ;
        integer \P2.P3.reg3 ;
        reg  \P2.P3.B ;
        reg [19:0] \P2.P3.MAR ;
        integer \P2.P3.MBR ;
        reg [1:0] \P2.P3.mf ;
        reg [2:0] \P2.P3.df ;
        reg [0:0] \P2.P3.cf ;
        reg [3:0] \P2.P3.ff ;
        reg [19:0] \P2.P3.tail ;
        integer \P2.P3.IR ;
        reg [0:0] \P2.P3.state ;
        integer \P2.P3.r ;
        integer \P2.P3.m ;
        integer \P2.P3.t ;
        integer \P2.P3.d ;
        integer \P2.P3.temp ;
        reg [1:0] \P2.P3.s ;
        parameter \P2.P3.FETCH   = 0;
        parameter \P2.P3.EXEC   = 1;
        if ( \P2.P3.reset  == 1'b1 ) 
        begin
            \P2.P3.MAR  = 0;
            \P2.P3.MBR  = 0;
            \P2.P3.IR  = 0;
            \P2.P3.d  = 0;
            \P2.P3.r  = 0;
            \P2.P3.m  = 0;
            \P2.P3.s  = 0;
            \P2.P3.temp  = 0;
            \P2.P3.mf  = 0;
            \P2.P3.df  = 0;
            \P2.P3.ff  = 0;
            \P2.P3.cf  = 0;
            \P2.P3.tail  = 0;
            \P2.P3.B  = 1'b0;
            \P2.P3.reg0  = 0;
            \P2.P3.reg1  = 0;
            \P2.P3.reg2  = 0;
            \P2.P3.reg3  = 0;
            \P2.P3.addr  <= 0;
            \P2.P3.rd  <= 1'b0;
            \P2.P3.wr  <= 1'b0;
            \P2.P3.datao  <= 0;
            \P2.P3.state  = \P2.P3.FETCH ;
        end
        else
        begin
            \P2.P3.rd  <= 1'b0;
            \P2.P3.wr  <= 1'b0;
            case ( \P2.P3.state  ) 
            \P2.P3.FETCH :
            begin
                \P2.P3.MAR  = ( \P2.P3.reg3  % ( 2 ** 20 ) );
                \P2.P3.addr  <= \P2.P3.MAR ;
                \P2.P3.rd  <= 1'b1;
                \P2.P3.MBR  = \P2.P3.datai ;
                \P2.P3.IR  = \P2.P3.MBR ;
                \P2.P3.state  = \P2.P3.EXEC ;
            end
            \P2.P3.EXEC :
            begin
                if ( \P2.P3.IR  < 0 ) 
                begin
                    \P2.P3.IR  =  -( \P2.P3.IR );
                end
                \P2.P3.mf  = ( ( \P2.P3.IR  / ( 2 ** 27 ) ) % 4 );
                \P2.P3.df  = ( ( \P2.P3.IR  / ( 2 ** 24 ) ) % ( 2 ** 3 ) );
                \P2.P3.ff  = ( ( \P2.P3.IR  / ( 2 ** 19 ) ) % ( 2 ** 4 ) );
                \P2.P3.cf  = ( ( \P2.P3.IR  / ( 2 ** 23 ) ) % 2 );
                \P2.P3.tail  = ( \P2.P3.IR  % ( 2 ** 20 ) );
                \P2.P3.reg3  = ( ( \P2.P3.reg3  % ( 2 ** 29 ) ) + 8 );
                \P2.P3.s  = ( ( \P2.P3.IR  / ( 2 ** 29 ) ) % 4 );
                case ( \P2.P3.s  ) 
                0:
                begin
                    \P2.P3.r  = \P2.P3.reg0 ;
                end
                1:
                begin
                    \P2.P3.r  = \P2.P3.reg1 ;
                end
                2:
                begin
                    \P2.P3.r  = \P2.P3.reg2 ;
                end
                3:
                begin
                    \P2.P3.r  = \P2.P3.reg3 ;
                end
                endcase
                case ( \P2.P3.cf  ) 
                1:
                begin
                    case ( \P2.P3.mf  ) 
                    0:
                    begin
                        \P2.P3.m  = \P2.P3.tail ;
                    end
                    1:
                    begin
                        \P2.P3.m  = \P2.P3.datai ;
                        \P2.P3.addr  <= \P2.P3.tail ;
                        \P2.P3.rd  <= 1'b1;
                    end
                    2:
                    begin
                        \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg1  ) % ( 2 ** 20 ) );
                        \P2.P3.rd  <= 1'b1;
                        \P2.P3.m  = \P2.P3.datai ;
                    end
                    3:
                    begin
                        \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg2  ) % ( 2 ** 20 ) );
                        \P2.P3.rd  <= 1'b1;
                        \P2.P3.m  = \P2.P3.datai ;
                    end
                    endcase
                    case ( \P2.P3.ff  ) 
                    0:
                    begin
                        if ( \P2.P3.r  < \P2.P3.m  ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    1:
                    begin
                        if (  ~( ( \P2.P3.r  < \P2.P3.m  )) ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    2:
                    begin
                        if ( \P2.P3.r  == \P2.P3.m  ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    3:
                    begin
                        if (  ~( ( \P2.P3.r  == \P2.P3.m  )) ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    4:
                    begin
                        if (  ~( ( \P2.P3.r  > \P2.P3.m  )) ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    5:
                    begin
                        if ( \P2.P3.r  > \P2.P3.m  ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    6:
                    begin
                        if ( \P2.P3.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P2.P3.r  = ( \P2.P3.r  - ( 2 ** 30 ) );
                        end
                        if ( \P2.P3.r  < \P2.P3.m  ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    7:
                    begin
                        if ( \P2.P3.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P2.P3.r  = ( \P2.P3.r  - ( 2 ** 30 ) );
                        end
                        if (  ~( ( \P2.P3.r  < \P2.P3.m  )) ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    8:
                    begin
                        if ( ( \P2.P3.r  < \P2.P3.m  ) | ( \P2.P3.B  == 1'b1 ) ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    9:
                    begin
                        if (  ~( ( \P2.P3.r  < \P2.P3.m  )) | ( \P2.P3.B  == 1'b1 ) ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    10:
                    begin
                        if ( ( \P2.P3.r  == \P2.P3.m  ) | ( \P2.P3.B  == 1'b1 ) ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    11:
                    begin
                        if (  ~( ( \P2.P3.r  == \P2.P3.m  )) | ( \P2.P3.B  == 1'b1 ) ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    12:
                    begin
                        if (  ~( ( \P2.P3.r  > \P2.P3.m  )) | ( \P2.P3.B  == 1'b1 ) ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    13:
                    begin
                        if ( ( \P2.P3.r  > \P2.P3.m  ) | ( \P2.P3.B  == 1'b1 ) ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    14:
                    begin
                        if ( \P2.P3.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P2.P3.r  = ( \P2.P3.r  - ( 2 ** 30 ) );
                        end
                        if ( ( \P2.P3.r  < \P2.P3.m  ) | ( \P2.P3.B  == 1'b1 ) ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    15:
                    begin
                        if ( \P2.P3.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P2.P3.r  = ( \P2.P3.r  - ( 2 ** 30 ) );
                        end
                        if (  ~( ( \P2.P3.r  < \P2.P3.m  )) | ( \P2.P3.B  == 1'b1 ) ) 
                        begin
                            \P2.P3.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P3.B  = 1'b0;
                        end
                    end
                    endcase
                end
                0:
                begin
                    if (  ~( ( \P2.P3.df  == 7 )) ) 
                    begin
                        if ( \P2.P3.df  == 5 ) 
                        begin
                            if (  ~( \P2.P3.B ) == 1'b1 ) 
                            begin
                                \P2.P3.d  = 3;
                            end
                        end
                        else
                        begin 
                            if ( \P2.P3.df  == 4 ) 
                            begin
                                if ( \P2.P3.B  == 1'b1 ) 
                                begin
                                    \P2.P3.d  = 3;
                                end
                            end
                            else
                            begin 
                                if ( \P2.P3.df  == 3 ) 
                                begin
                                    \P2.P3.d  = 3;
                                end
                                else
                                begin 
                                    if ( \P2.P3.df  == 2 ) 
                                    begin
                                        \P2.P3.d  = 2;
                                    end
                                    else
                                    begin 
                                        if ( \P2.P3.df  == 1 ) 
                                        begin
                                            \P2.P3.d  = 1;
                                        end
                                        else
                                        begin 
                                            if ( \P2.P3.df  == 0 ) 
                                            begin
                                                \P2.P3.d  = 0;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        case ( \P2.P3.ff  ) 
                        0:
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            1:
                            begin
                                \P2.P3.m  = \P2.P3.datai ;
                                \P2.P3.addr  <= \P2.P3.tail ;
                                \P2.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg1  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            3:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg2  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            endcase
                            \P2.P3.t  = 0;
                            case ( \P2.P3.d  ) 
                            0:
                            begin
                                \P2.P3.reg0  = ( \P2.P3.t  - \P2.P3.m  );
                            end
                            1:
                            begin
                                \P2.P3.reg1  = ( \P2.P3.t  - \P2.P3.m  );
                            end
                            2:
                            begin
                                \P2.P3.reg2  = ( \P2.P3.t  - \P2.P3.m  );
                            end
                            3:
                            begin
                                \P2.P3.reg3  = ( \P2.P3.t  - \P2.P3.m  );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        1:
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            1:
                            begin
                                \P2.P3.m  = \P2.P3.datai ;
                                \P2.P3.addr  <= \P2.P3.tail ;
                                \P2.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg1  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            3:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg2  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            endcase
                            \P2.P3.reg2  = \P2.P3.reg3 ;
                            \P2.P3.reg3  = \P2.P3.m ;
                        end
                        2:
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            1:
                            begin
                                \P2.P3.m  = \P2.P3.datai ;
                                \P2.P3.addr  <= \P2.P3.tail ;
                                \P2.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg1  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            3:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg2  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            endcase
                            case ( \P2.P3.d  ) 
                            0:
                            begin
                                \P2.P3.reg0  = \P2.P3.m ;
                            end
                            1:
                            begin
                                \P2.P3.reg1  = \P2.P3.m ;
                            end
                            2:
                            begin
                                \P2.P3.reg2  = \P2.P3.m ;
                            end
                            3:
                            begin
                                \P2.P3.reg3  = \P2.P3.m ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        3:
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            1:
                            begin
                                \P2.P3.m  = \P2.P3.datai ;
                                \P2.P3.addr  <= \P2.P3.tail ;
                                \P2.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg1  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            3:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg2  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            endcase
                            case ( \P2.P3.d  ) 
                            0:
                            begin
                                \P2.P3.reg0  = \P2.P3.m ;
                            end
                            1:
                            begin
                                \P2.P3.reg1  = \P2.P3.m ;
                            end
                            2:
                            begin
                                \P2.P3.reg2  = \P2.P3.m ;
                            end
                            3:
                            begin
                                \P2.P3.reg3  = \P2.P3.m ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        4:
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            1:
                            begin
                                \P2.P3.m  = \P2.P3.datai ;
                                \P2.P3.addr  <= \P2.P3.tail ;
                                \P2.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg1  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            3:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg2  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            endcase
                            case ( \P2.P3.d  ) 
                            0:
                            begin
                                \P2.P3.reg0  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P3.reg1  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P3.reg2  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P3.reg3  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        5:
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            1:
                            begin
                                \P2.P3.m  = \P2.P3.datai ;
                                \P2.P3.addr  <= \P2.P3.tail ;
                                \P2.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg1  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            3:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg2  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            endcase
                            case ( \P2.P3.d  ) 
                            0:
                            begin
                                \P2.P3.reg0  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P3.reg1  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P3.reg2  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P3.reg3  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        6:
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            1:
                            begin
                                \P2.P3.m  = \P2.P3.datai ;
                                \P2.P3.addr  <= \P2.P3.tail ;
                                \P2.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg1  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            3:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg2  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            endcase
                            case ( \P2.P3.d  ) 
                            0:
                            begin
                                \P2.P3.reg0  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P3.reg1  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P3.reg2  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P3.reg3  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        7:
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            1:
                            begin
                                \P2.P3.m  = \P2.P3.datai ;
                                \P2.P3.addr  <= \P2.P3.tail ;
                                \P2.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg1  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            3:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg2  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            endcase
                            case ( \P2.P3.d  ) 
                            0:
                            begin
                                \P2.P3.reg0  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P3.reg1  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P3.reg2  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P3.reg3  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        8:
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            1:
                            begin
                                \P2.P3.m  = \P2.P3.datai ;
                                \P2.P3.addr  <= \P2.P3.tail ;
                                \P2.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg1  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            3:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg2  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            endcase
                            case ( \P2.P3.d  ) 
                            0:
                            begin
                                \P2.P3.reg0  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P3.reg1  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P3.reg2  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P3.reg3  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        9:
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            1:
                            begin
                                \P2.P3.m  = \P2.P3.datai ;
                                \P2.P3.addr  <= \P2.P3.tail ;
                                \P2.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg1  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            3:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg2  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            endcase
                            case ( \P2.P3.d  ) 
                            0:
                            begin
                                \P2.P3.reg0  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P3.reg1  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P3.reg2  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P3.reg3  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        10:
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            1:
                            begin
                                \P2.P3.m  = \P2.P3.datai ;
                                \P2.P3.addr  <= \P2.P3.tail ;
                                \P2.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg1  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            3:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg2  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            endcase
                            case ( \P2.P3.d  ) 
                            0:
                            begin
                                \P2.P3.reg0  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P3.reg1  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P3.reg2  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P3.reg3  = ( ( \P2.P3.r  + \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        11:
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            1:
                            begin
                                \P2.P3.m  = \P2.P3.datai ;
                                \P2.P3.addr  <= \P2.P3.tail ;
                                \P2.P3.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg1  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            3:
                            begin
                                \P2.P3.addr  <= ( ( \P2.P3.tail  + \P2.P3.reg2  ) % ( 2 ** 20 ) );
                                \P2.P3.rd  <= 1'b1;
                                \P2.P3.m  = \P2.P3.datai ;
                            end
                            endcase
                            case ( \P2.P3.d  ) 
                            0:
                            begin
                                \P2.P3.reg0  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P3.reg1  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P3.reg2  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P3.reg3  = ( ( \P2.P3.r  - \P2.P3.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        12:
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.t  = ( \P2.P3.r  / 2 );
                            end
                            1:
                            begin
                                \P2.P3.t  = ( \P2.P3.r  / 2 );
                                if ( \P2.P3.B  == 1'b1 ) 
                                begin
                                    \P2.P3.t  = ( \P2.P3.t  % ( 2 ** 29 ) );
                                end
                            end
                            2:
                            begin
                                \P2.P3.t  = ( ( \P2.P3.r  % ( 2 ** 29 ) ) * 2 );
                            end
                            3:
                            begin
                                \P2.P3.t  = ( ( \P2.P3.r  % ( 2 ** 29 ) ) * 2 );
                                if ( \P2.P3.t  > ( ( 2 ** 30 ) - 1 ) ) 
                                begin
                                    \P2.P3.B  = 1'b1;
                                end
                                else
                                begin 
                                    \P2.P3.B  = 1'b0;
                                end
                            end
                            default :
                            begin
                            end
                            endcase
                            case ( \P2.P3.d  ) 
                            0:
                            begin
                                \P2.P3.reg0  = \P2.P3.t ;
                            end
                            1:
                            begin
                                \P2.P3.reg1  = \P2.P3.t ;
                            end
                            2:
                            begin
                                \P2.P3.reg2  = \P2.P3.t ;
                            end
                            3:
                            begin
                                \P2.P3.reg3  = \P2.P3.t ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        13, 
                        14, 
                        15:
                        begin
                        end
                        endcase
                    end
                    else
                    begin 
                        if ( \P2.P3.df  == 7 ) 
                        begin
                            case ( \P2.P3.mf  ) 
                            0:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            1:
                            begin
                                \P2.P3.m  = \P2.P3.tail ;
                            end
                            2:
                            begin
                                \P2.P3.m  = ( ( \P2.P3.reg1  % ( 2 ** 20 ) ) + ( \P2.P3.tail  % ( 2 ** 20 ) ) );
                            end
                            3:
                            begin
                                \P2.P3.m  = ( ( \P2.P3.reg2  % ( 2 ** 20 ) ) + ( \P2.P3.tail  % ( 2 ** 20 ) ) );
                            end
                            endcase
                            \P2.P3.addr  <= ( ( \P2.P3.m  % 2 ) * 20 );
                            \P2.P3.wr  <= 1'b1;
                            \P2.P3.datao  <= \P2.P3.r ;
                        end
                    end
                end
                endcase
                \P2.P3.state  = \P2.P3.FETCH ;
            end
            endcase
        end
    end
    assign \P2.P4.clock  = \P2.clock ;
    assign \P2.P4.reset  = \P2.reset ;
    assign \P2.ad41  = \P2.P4.addr ;
    assign \P2.P4.datai  = \P2.di4 ;
    assign \P2.do4  = \P2.P4.datao ;
    assign \P2.rd4  = \P2.P4.rd ;
    assign \P2.wr4  = \P2.P4.wr ;
    always @ (  posedge \P2.P4.clock  or  posedge \P2.P4.reset )
    begin : \P2.P4.xhdl0 
        integer \P2.P4.reg0 ;
        integer \P2.P4.reg1 ;
        integer \P2.P4.reg2 ;
        integer \P2.P4.reg3 ;
        reg  \P2.P4.B ;
        reg [19:0] \P2.P4.MAR ;
        integer \P2.P4.MBR ;
        reg [1:0] \P2.P4.mf ;
        reg [2:0] \P2.P4.df ;
        reg [0:0] \P2.P4.cf ;
        reg [3:0] \P2.P4.ff ;
        reg [19:0] \P2.P4.tail ;
        integer \P2.P4.IR ;
        reg [0:0] \P2.P4.state ;
        integer \P2.P4.r ;
        integer \P2.P4.m ;
        integer \P2.P4.t ;
        integer \P2.P4.d ;
        integer \P2.P4.temp ;
        reg [1:0] \P2.P4.s ;
        parameter \P2.P4.FETCH   = 0;
        parameter \P2.P4.EXEC   = 1;
        if ( \P2.P4.reset  == 1'b1 ) 
        begin
            \P2.P4.MAR  = 0;
            \P2.P4.MBR  = 0;
            \P2.P4.IR  = 0;
            \P2.P4.d  = 0;
            \P2.P4.r  = 0;
            \P2.P4.m  = 0;
            \P2.P4.s  = 0;
            \P2.P4.temp  = 0;
            \P2.P4.mf  = 0;
            \P2.P4.df  = 0;
            \P2.P4.ff  = 0;
            \P2.P4.cf  = 0;
            \P2.P4.tail  = 0;
            \P2.P4.B  = 1'b0;
            \P2.P4.reg0  = 0;
            \P2.P4.reg1  = 0;
            \P2.P4.reg2  = 0;
            \P2.P4.reg3  = 0;
            \P2.P4.addr  <= 0;
            \P2.P4.rd  <= 1'b0;
            \P2.P4.wr  <= 1'b0;
            \P2.P4.datao  <= 0;
            \P2.P4.state  = \P2.P4.FETCH ;
        end
        else
        begin
            \P2.P4.rd  <= 1'b0;
            \P2.P4.wr  <= 1'b0;
            case ( \P2.P4.state  ) 
            \P2.P4.FETCH :
            begin
                \P2.P4.MAR  = ( \P2.P4.reg3  % ( 2 ** 20 ) );
                \P2.P4.addr  <= \P2.P4.MAR ;
                \P2.P4.rd  <= 1'b1;
                \P2.P4.MBR  = \P2.P4.datai ;
                \P2.P4.IR  = \P2.P4.MBR ;
                \P2.P4.state  = \P2.P4.EXEC ;
            end
            \P2.P4.EXEC :
            begin
                if ( \P2.P4.IR  < 0 ) 
                begin
                    \P2.P4.IR  =  -( \P2.P4.IR );
                end
                \P2.P4.mf  = ( ( \P2.P4.IR  / ( 2 ** 27 ) ) % 4 );
                \P2.P4.df  = ( ( \P2.P4.IR  / ( 2 ** 24 ) ) % ( 2 ** 3 ) );
                \P2.P4.ff  = ( ( \P2.P4.IR  / ( 2 ** 19 ) ) % ( 2 ** 4 ) );
                \P2.P4.cf  = ( ( \P2.P4.IR  / ( 2 ** 23 ) ) % 2 );
                \P2.P4.tail  = ( \P2.P4.IR  % ( 2 ** 20 ) );
                \P2.P4.reg3  = ( ( \P2.P4.reg3  % ( 2 ** 29 ) ) + 8 );
                \P2.P4.s  = ( ( \P2.P4.IR  / ( 2 ** 29 ) ) % 4 );
                case ( \P2.P4.s  ) 
                0:
                begin
                    \P2.P4.r  = \P2.P4.reg0 ;
                end
                1:
                begin
                    \P2.P4.r  = \P2.P4.reg1 ;
                end
                2:
                begin
                    \P2.P4.r  = \P2.P4.reg2 ;
                end
                3:
                begin
                    \P2.P4.r  = \P2.P4.reg3 ;
                end
                endcase
                case ( \P2.P4.cf  ) 
                1:
                begin
                    case ( \P2.P4.mf  ) 
                    0:
                    begin
                        \P2.P4.m  = \P2.P4.tail ;
                    end
                    1:
                    begin
                        \P2.P4.m  = \P2.P4.datai ;
                        \P2.P4.addr  <= \P2.P4.tail ;
                        \P2.P4.rd  <= 1'b1;
                    end
                    2:
                    begin
                        \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg1  ) % ( 2 ** 20 ) );
                        \P2.P4.rd  <= 1'b1;
                        \P2.P4.m  = \P2.P4.datai ;
                    end
                    3:
                    begin
                        \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg2  ) % ( 2 ** 20 ) );
                        \P2.P4.rd  <= 1'b1;
                        \P2.P4.m  = \P2.P4.datai ;
                    end
                    endcase
                    case ( \P2.P4.ff  ) 
                    0:
                    begin
                        if ( \P2.P4.r  < \P2.P4.m  ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    1:
                    begin
                        if (  ~( ( \P2.P4.r  < \P2.P4.m  )) ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    2:
                    begin
                        if ( \P2.P4.r  == \P2.P4.m  ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    3:
                    begin
                        if (  ~( ( \P2.P4.r  == \P2.P4.m  )) ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    4:
                    begin
                        if (  ~( ( \P2.P4.r  > \P2.P4.m  )) ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    5:
                    begin
                        if ( \P2.P4.r  > \P2.P4.m  ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    6:
                    begin
                        if ( \P2.P4.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P2.P4.r  = ( \P2.P4.r  - ( 2 ** 30 ) );
                        end
                        if ( \P2.P4.r  < \P2.P4.m  ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    7:
                    begin
                        if ( \P2.P4.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P2.P4.r  = ( \P2.P4.r  - ( 2 ** 30 ) );
                        end
                        if (  ~( ( \P2.P4.r  < \P2.P4.m  )) ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    8:
                    begin
                        if ( ( \P2.P4.r  < \P2.P4.m  ) | ( \P2.P4.B  == 1'b1 ) ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    9:
                    begin
                        if (  ~( ( \P2.P4.r  < \P2.P4.m  )) | ( \P2.P4.B  == 1'b1 ) ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    10:
                    begin
                        if ( ( \P2.P4.r  == \P2.P4.m  ) | ( \P2.P4.B  == 1'b1 ) ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    11:
                    begin
                        if (  ~( ( \P2.P4.r  == \P2.P4.m  )) | ( \P2.P4.B  == 1'b1 ) ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    12:
                    begin
                        if (  ~( ( \P2.P4.r  > \P2.P4.m  )) | ( \P2.P4.B  == 1'b1 ) ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    13:
                    begin
                        if ( ( \P2.P4.r  > \P2.P4.m  ) | ( \P2.P4.B  == 1'b1 ) ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    14:
                    begin
                        if ( \P2.P4.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P2.P4.r  = ( \P2.P4.r  - ( 2 ** 30 ) );
                        end
                        if ( ( \P2.P4.r  < \P2.P4.m  ) | ( \P2.P4.B  == 1'b1 ) ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    15:
                    begin
                        if ( \P2.P4.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P2.P4.r  = ( \P2.P4.r  - ( 2 ** 30 ) );
                        end
                        if (  ~( ( \P2.P4.r  < \P2.P4.m  )) | ( \P2.P4.B  == 1'b1 ) ) 
                        begin
                            \P2.P4.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.P4.B  = 1'b0;
                        end
                    end
                    endcase
                end
                0:
                begin
                    if (  ~( ( \P2.P4.df  == 7 )) ) 
                    begin
                        if ( \P2.P4.df  == 5 ) 
                        begin
                            if (  ~( \P2.P4.B ) == 1'b1 ) 
                            begin
                                \P2.P4.d  = 3;
                            end
                        end
                        else
                        begin 
                            if ( \P2.P4.df  == 4 ) 
                            begin
                                if ( \P2.P4.B  == 1'b1 ) 
                                begin
                                    \P2.P4.d  = 3;
                                end
                            end
                            else
                            begin 
                                if ( \P2.P4.df  == 3 ) 
                                begin
                                    \P2.P4.d  = 3;
                                end
                                else
                                begin 
                                    if ( \P2.P4.df  == 2 ) 
                                    begin
                                        \P2.P4.d  = 2;
                                    end
                                    else
                                    begin 
                                        if ( \P2.P4.df  == 1 ) 
                                        begin
                                            \P2.P4.d  = 1;
                                        end
                                        else
                                        begin 
                                            if ( \P2.P4.df  == 0 ) 
                                            begin
                                                \P2.P4.d  = 0;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        case ( \P2.P4.ff  ) 
                        0:
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            1:
                            begin
                                \P2.P4.m  = \P2.P4.datai ;
                                \P2.P4.addr  <= \P2.P4.tail ;
                                \P2.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg1  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            3:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg2  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            endcase
                            \P2.P4.t  = 0;
                            case ( \P2.P4.d  ) 
                            0:
                            begin
                                \P2.P4.reg0  = ( \P2.P4.t  - \P2.P4.m  );
                            end
                            1:
                            begin
                                \P2.P4.reg1  = ( \P2.P4.t  - \P2.P4.m  );
                            end
                            2:
                            begin
                                \P2.P4.reg2  = ( \P2.P4.t  - \P2.P4.m  );
                            end
                            3:
                            begin
                                \P2.P4.reg3  = ( \P2.P4.t  - \P2.P4.m  );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        1:
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            1:
                            begin
                                \P2.P4.m  = \P2.P4.datai ;
                                \P2.P4.addr  <= \P2.P4.tail ;
                                \P2.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg1  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            3:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg2  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            endcase
                            \P2.P4.reg2  = \P2.P4.reg3 ;
                            \P2.P4.reg3  = \P2.P4.m ;
                        end
                        2:
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            1:
                            begin
                                \P2.P4.m  = \P2.P4.datai ;
                                \P2.P4.addr  <= \P2.P4.tail ;
                                \P2.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg1  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            3:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg2  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            endcase
                            case ( \P2.P4.d  ) 
                            0:
                            begin
                                \P2.P4.reg0  = \P2.P4.m ;
                            end
                            1:
                            begin
                                \P2.P4.reg1  = \P2.P4.m ;
                            end
                            2:
                            begin
                                \P2.P4.reg2  = \P2.P4.m ;
                            end
                            3:
                            begin
                                \P2.P4.reg3  = \P2.P4.m ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        3:
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            1:
                            begin
                                \P2.P4.m  = \P2.P4.datai ;
                                \P2.P4.addr  <= \P2.P4.tail ;
                                \P2.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg1  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            3:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg2  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            endcase
                            case ( \P2.P4.d  ) 
                            0:
                            begin
                                \P2.P4.reg0  = \P2.P4.m ;
                            end
                            1:
                            begin
                                \P2.P4.reg1  = \P2.P4.m ;
                            end
                            2:
                            begin
                                \P2.P4.reg2  = \P2.P4.m ;
                            end
                            3:
                            begin
                                \P2.P4.reg3  = \P2.P4.m ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        4:
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            1:
                            begin
                                \P2.P4.m  = \P2.P4.datai ;
                                \P2.P4.addr  <= \P2.P4.tail ;
                                \P2.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg1  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            3:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg2  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            endcase
                            case ( \P2.P4.d  ) 
                            0:
                            begin
                                \P2.P4.reg0  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P4.reg1  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P4.reg2  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P4.reg3  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        5:
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            1:
                            begin
                                \P2.P4.m  = \P2.P4.datai ;
                                \P2.P4.addr  <= \P2.P4.tail ;
                                \P2.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg1  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            3:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg2  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            endcase
                            case ( \P2.P4.d  ) 
                            0:
                            begin
                                \P2.P4.reg0  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P4.reg1  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P4.reg2  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P4.reg3  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        6:
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            1:
                            begin
                                \P2.P4.m  = \P2.P4.datai ;
                                \P2.P4.addr  <= \P2.P4.tail ;
                                \P2.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg1  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            3:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg2  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            endcase
                            case ( \P2.P4.d  ) 
                            0:
                            begin
                                \P2.P4.reg0  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P4.reg1  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P4.reg2  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P4.reg3  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        7:
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            1:
                            begin
                                \P2.P4.m  = \P2.P4.datai ;
                                \P2.P4.addr  <= \P2.P4.tail ;
                                \P2.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg1  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            3:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg2  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            endcase
                            case ( \P2.P4.d  ) 
                            0:
                            begin
                                \P2.P4.reg0  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P4.reg1  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P4.reg2  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P4.reg3  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        8:
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            1:
                            begin
                                \P2.P4.m  = \P2.P4.datai ;
                                \P2.P4.addr  <= \P2.P4.tail ;
                                \P2.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg1  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            3:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg2  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            endcase
                            case ( \P2.P4.d  ) 
                            0:
                            begin
                                \P2.P4.reg0  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P4.reg1  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P4.reg2  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P4.reg3  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        9:
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            1:
                            begin
                                \P2.P4.m  = \P2.P4.datai ;
                                \P2.P4.addr  <= \P2.P4.tail ;
                                \P2.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg1  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            3:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg2  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            endcase
                            case ( \P2.P4.d  ) 
                            0:
                            begin
                                \P2.P4.reg0  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P4.reg1  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P4.reg2  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P4.reg3  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        10:
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            1:
                            begin
                                \P2.P4.m  = \P2.P4.datai ;
                                \P2.P4.addr  <= \P2.P4.tail ;
                                \P2.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg1  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            3:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg2  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            endcase
                            case ( \P2.P4.d  ) 
                            0:
                            begin
                                \P2.P4.reg0  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P4.reg1  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P4.reg2  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P4.reg3  = ( ( \P2.P4.r  + \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        11:
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            1:
                            begin
                                \P2.P4.m  = \P2.P4.datai ;
                                \P2.P4.addr  <= \P2.P4.tail ;
                                \P2.P4.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg1  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            3:
                            begin
                                \P2.P4.addr  <= ( ( \P2.P4.tail  + \P2.P4.reg2  ) % ( 2 ** 20 ) );
                                \P2.P4.rd  <= 1'b1;
                                \P2.P4.m  = \P2.P4.datai ;
                            end
                            endcase
                            case ( \P2.P4.d  ) 
                            0:
                            begin
                                \P2.P4.reg0  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.P4.reg1  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.P4.reg2  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.P4.reg3  = ( ( \P2.P4.r  - \P2.P4.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        12:
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.t  = ( \P2.P4.r  / 2 );
                            end
                            1:
                            begin
                                \P2.P4.t  = ( \P2.P4.r  / 2 );
                                if ( \P2.P4.B  == 1'b1 ) 
                                begin
                                    \P2.P4.t  = ( \P2.P4.t  % ( 2 ** 29 ) );
                                end
                            end
                            2:
                            begin
                                \P2.P4.t  = ( ( \P2.P4.r  % ( 2 ** 29 ) ) * 2 );
                            end
                            3:
                            begin
                                \P2.P4.t  = ( ( \P2.P4.r  % ( 2 ** 29 ) ) * 2 );
                                if ( \P2.P4.t  > ( ( 2 ** 30 ) - 1 ) ) 
                                begin
                                    \P2.P4.B  = 1'b1;
                                end
                                else
                                begin 
                                    \P2.P4.B  = 1'b0;
                                end
                            end
                            default :
                            begin
                            end
                            endcase
                            case ( \P2.P4.d  ) 
                            0:
                            begin
                                \P2.P4.reg0  = \P2.P4.t ;
                            end
                            1:
                            begin
                                \P2.P4.reg1  = \P2.P4.t ;
                            end
                            2:
                            begin
                                \P2.P4.reg2  = \P2.P4.t ;
                            end
                            3:
                            begin
                                \P2.P4.reg3  = \P2.P4.t ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        13, 
                        14, 
                        15:
                        begin
                        end
                        endcase
                    end
                    else
                    begin 
                        if ( \P2.P4.df  == 7 ) 
                        begin
                            case ( \P2.P4.mf  ) 
                            0:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            1:
                            begin
                                \P2.P4.m  = \P2.P4.tail ;
                            end
                            2:
                            begin
                                \P2.P4.m  = ( ( \P2.P4.reg1  % ( 2 ** 20 ) ) + ( \P2.P4.tail  % ( 2 ** 20 ) ) );
                            end
                            3:
                            begin
                                \P2.P4.m  = ( ( \P2.P4.reg2  % ( 2 ** 20 ) ) + ( \P2.P4.tail  % ( 2 ** 20 ) ) );
                            end
                            endcase
                            \P2.P4.addr  <= ( ( \P2.P4.m  % 2 ) * 20 );
                            \P2.P4.wr  <= 1'b1;
                            \P2.P4.datao  <= \P2.P4.r ;
                        end
                    end
                end
                endcase
                \P2.P4.state  = \P2.P4.FETCH ;
            end
            endcase
        end
    end
    always @ (  \P2.do1  or  \P2.rd3  or  \P2.wr1  or  \P2.mio1  or  \P2.dc1  or  \P2.as12  or  \P2.do2  or  \P2.rd4  or  \P2.wr2  or  \P2.mio2  or  \P2.dc2  or  \P2.as22  or  \P2.as21  or  \P2.as11  or  \P2.wr3  or  \P2.ad31  or  \P2.tad2  or  \P2.wr4  or  \P2.ad41  or  \P2.tad1  or  \P2.do3  or  \P2.do4  or  \P2.ad11  or  \P2.ad12  or  \P2.ad21  or  \P2.ad22  or  \P2.tad3  or  \P2.tad4  or  \P2.sel  or  \P2.din  or  \P2.td1  or  \P2.td2 )
    begin
        \P2.di3  <= ( \P2.do1  % ( 2 ** 20 ) );
        \P2.r12  <=  ~( ( ( ( ( \P2.rd3  & \P2.wr1  ) & \P2.mio1  ) & \P2.dc1  ) &  ~( \P2.as12 ) ));
        \P2.di4  <= \P2.do2 ;
        \P2.r22  <=  ~( ( ( ( ( \P2.rd4  & \P2.wr2  ) & \P2.mio2  ) & \P2.dc2  ) &  ~( \P2.as22 ) ));
        \P2.r11  <= \P2.as21 ;
        \P2.r21  <= \P2.as11 ;
        if ( \P2.wr3  == 1'b1 ) 
        begin
            \P2.tad3  <= \P2.ad31 ;
        end
        else
        begin 
            \P2.tad3  <= ( \P2.tad2  % ( 2 ** 20 ) );
        end
        if ( \P2.wr4  == 1'b1 ) 
        begin
            \P2.tad4  <= \P2.ad41 ;
        end
        else
        begin 
            \P2.tad4  <= ( \P2.tad1  % ( 2 ** 20 ) );
        end
        if ( \P2.do3  > ( 2 ** 28 ) ) 
        begin
            \P2.tad1  <= \P2.ad11 ;
        end
        else
        begin 
            \P2.tad1  <= \P2.ad12 ;
        end
        if ( \P2.do4  > ( 2 ** 29 ) ) 
        begin
            \P2.tad2  <= \P2.ad21 ;
        end
        else
        begin 
            \P2.tad2  <= \P2.ad22 ;
        end
        \P2.dout  <= ( ( \P2.tad3  * \P2.tad4  ) % ( 2 ** 19 ) );
        if ( \P2.sel  == 1'b0 ) 
        begin
            \P2.td1  <= 0;
            \P2.td2  <= \P2.din ;
        end
        else
        begin
            \P2.td1  <= \P2.din ;
            \P2.td2  <= 0;
        end
        \P2.di1  <= ( \P2.do4  * \P2.td1  );
        \P2.di2  <= ( \P2.do3  * \P2.td2  );
        \P2.aux  <= ( ( \P2.tad1  * \P2.tad2  ) % ( 2 ** 3 ) );
    end
endmodule 


