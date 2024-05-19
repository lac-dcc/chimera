// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    FPU指令译码器（组合逻辑）
*/

module f_decoder(
    input[31:0]         inst,
    output[3:0]         fs,
    output[3:0]         ft,
    output[3:0]         fd,
    output[`FINFOCNT - 1:0]     finfo,
    output[1:0]                 round_mode,
    output[`FPUCTRL_CNT - 1:0]  fpu_ctrl,
    output[`FCCUCTRL_CNT - 1:0] fccu_ctrl,
    output[`FPU_GLOBAL_CNT - 1:0]   fpu_global_ctrl,
    output[2:0]                 fcc_addr,
    output              reserved            //只需要识别出RI
    );

    wire[5:0]   opcode=inst[31:26];
    wire[5:0]   func=inst[5:0];
    wire[4:0]   fmt=inst[25:21];
    wire[4:0]   tmp_ft=inst[20:16];
    wire[4:0]   tmp_fs=inst[15:11];
    wire[4:0]   tmp_fd=inst[10:6];

    wire fmt_s=(fmt == 16);
    wire fmt_d=(fmt == 17);
    wire fmt_w=(fmt == 20);
    wire opfpu=(opcode == 6'b010001);
    wire fs0=~(|tmp_fs);
    wire ft0=~(|tmp_ft);
    wire fd0=~(|tmp_fd);

    wire[`FPU_INST_CNT - 1:0]   icode;

`ifdef FPU_ENABLED
    assign icode[`FI_abs]=opfpu & ft0 & (func == 6'b000101) & (fmt_s | fmt_d);
    assign icode[`FI_add]=opfpu & (func == 0) & (fmt_s | fmt_d);
    assign icode[`FI_bc1f]=opfpu & (fmt == 5'b01000) & (inst[17:16] == 2'b00);
    assign icode[`FI_bc1t]=opfpu & (fmt == 5'b01000) & (inst[17:16] == 2'b01);
    assign icode[`FI_ccond]=opfpu & (inst[7:4] == 4'b0011) & (fmt_s | fmt_d);
    assign icode[`FI_ceil]=opfpu & ft0 & (func == 6'b001110) & (fmt_s | fmt_d);
    assign icode[`FI_cvtd]=opfpu & ft0 & (func == 6'b100001) & (fmt_s | fmt_w);
    assign icode[`FI_cvts]=opfpu & ft0 & (func == 6'b100000) & (fmt_d | fmt_w);
    assign icode[`FI_cvtw]=opfpu & ft0 & (func == 6'b100100) & (fmt_s | fmt_d);
    assign icode[`FI_div]=opfpu & (func == 6'b000011) & (fmt_s | fmt_d);
    assign icode[`FI_floor]=opfpu & ft0 & (func == 6'b001111) & (fmt_s | fmt_d);
    assign icode[`FI_ldc1]=(opcode == 6'b110101);
    assign icode[`FI_lwc1]=(opcode == 6'b110001);
    assign icode[`FI_mfc1]=opfpu & (fmt == 0) & (inst[10:0] == 0);
    assign icode[`FI_mov]=opfpu & ft0 & (func == 6'b000110) & (fmt_s | fmt_d);
    assign icode[`FI_movf]=(opcode == 0) & (inst[17:16] == 0) & (inst[10:0] == 1);
    assign icode[`FI_movffmt]=opfpu & (inst[17:16] == 0) & (func == 6'b010001) & (fmt_s | fmt_d);
    assign icode[`FI_movn]=opfpu & (func == 6'b010011) & (fmt_s | fmt_d);
    assign icode[`FI_movt]=(opcode == 0) & (inst[17:16] == 1) & (inst[10:0] == 1);
    assign icode[`FI_movtfmt]=opfpu & (inst[17:16] == 1) & (func == 6'b010001) & (fmt_s | fmt_d);
    assign icode[`FI_movz]=opfpu & (func == 6'b010010) & (fmt_s | fmt_d);
    assign icode[`FI_mtc1]=opfpu & (fmt == 5'b00100) & (inst[10:0] == 0);
    assign icode[`FI_mul]=opfpu & (func == 6'b000010) & (fmt_s | fmt_d);
    assign icode[`FI_neg]=opfpu & ft0 & (func == 6'b000111) & (fmt_s | fmt_d);
    assign icode[`FI_round]=opfpu & ft0 & (func == 6'b001100) & (fmt_s | fmt_d);
    assign icode[`FI_sdc1]=(opcode == 6'b111101);
    assign icode[`FI_sqrt]=opfpu & ft0 & (func == 6'b000100) & (fmt_s | fmt_d);
    assign icode[`FI_sub]=opfpu & (func == 1) & (fmt_s | fmt_d);
    assign icode[`FI_swc1]=(opcode == 6'b111001);
    assign icode[`FI_trunc]=opfpu & ft0 & (func == 6'b001101) & (fmt_s | fmt_d);
`else
    assign icode=0;
`endif

    assign reserved=~(|icode);
    //Note: 如果源操作数只有ft，为方便起见将其重定向到fs

    wire[4:0] real_fs=(icode[`FI_swc1] | icode[`FI_sdc1]) ? tmp_ft : tmp_fs;
    wire[4:0] real_fd=icode[`FI_mtc1] ? tmp_fs : ((icode[`FI_ldc1] | icode[`FI_lwc1]) ? tmp_ft : tmp_fd);
    wire[4:0] real_ft=(icode[`FI_movffmt] | icode[`FI_movtfmt] | icode[`FI_movn] | icode[`FI_movz]) ? tmp_fd : tmp_ft;
    
    assign fs=real_fs[4:1];
    assign ft=real_ft[4:1];
    assign fd=real_fd[4:1];

    wire fdwen_fmt=icode[`FI_abs] | icode[`FI_add] | icode[`FI_div] | icode[`FI_mov] |
        icode[`FI_movffmt] | icode[`FI_movn] | icode[`FI_movtfmt] | icode[`FI_movz] |
        icode[`FI_mul] | icode[`FI_neg] | icode[`FI_sqrt] | icode[`FI_sub];
    wire fdwen_32=icode[`FI_ceil] | icode[`FI_cvts] | icode[`FI_cvtw] | icode[`FI_floor] |
        icode[`FI_lwc1] | icode[`FI_mtc1] | icode[`FI_round] | icode[`FI_trunc];
    wire fdwen_64=icode[`FI_cvtd] | icode[`FI_ldc1];

    wire usefs_fmt=icode[`FI_abs] | icode[`FI_add] | icode[`FI_ccond] | icode[`FI_ceil] | 
        icode[`FI_cvts] | icode[`FI_cvtw] | icode[`FI_div] | icode[`FI_floor] | icode[`FI_mfc1] |
        icode[`FI_mov] | icode[`FI_movffmt] | icode[`FI_movn] | icode[`FI_movtfmt] |
        icode[`FI_movz] | icode[`FI_mul] | icode[`FI_neg] | icode[`FI_round] | 
        icode[`FI_sqrt] | icode[`FI_sub] | icode[`FI_trunc];
    wire usefs_32=icode[`FI_cvtd] | icode[`FI_mfc1] | icode[`FI_swc1];
    wire usefs_64=icode[`FI_sdc1];
    wire useft_fmt=icode[`FI_add] | icode[`FI_ccond] | icode[`FI_div] | icode[`FI_mul] | icode[`FI_sub] |
        icode[`FI_movffmt] | icode[`FI_movn] | icode[`FI_movtfmt] | icode[`FI_movz];

    //finfo
    assign finfo[`FINFO_WEN0]=(fdwen_32 & ~real_fd[0]) | fdwen_64 | (fdwen_fmt & (fmt_d | ~real_fd[0]));
    assign finfo[`FINFO_WEN1]=(fdwen_32 & real_fd[0]) | fdwen_64 | (fdwen_fmt & (fmt_d | real_fd[0]));
    assign finfo[`FINFO_USEFS0]=(usefs_fmt & (fmt_d | ~real_fs[0])) | (usefs_32 & ~real_fs[0]) | usefs_64;
    assign finfo[`FINFO_USEFS1]=(usefs_fmt & (fmt_d | real_fs[0])) | (usefs_32 & real_fs[0]) | usefs_64;
    assign finfo[`FINFO_USEFT0]=useft_fmt & (fmt_d | ~real_ft[0]);
    assign finfo[`FINFO_USEFT1]=useft_fmt & (fmt_d | real_ft[0]);
    assign finfo[`FINFO_FCCINST]=icode[`FI_ccond] | icode[`FI_movf] | icode[`FI_movt] |
        icode[`FI_movffmt] | icode[`FI_movtfmt] | icode[`FI_bc1f] | icode[`FI_bc1t];
    assign finfo[`FINFO_WAITFORMU]=icode[`FI_lwc1] | icode[`FI_ldc1];
    assign finfo[`FINFO_WAITFORMDU]=icode[`FI_mtc1] | icode[`FI_movn] | icode[`FI_movz];
    assign finfo[`FINFO_TOMU]=icode[`FI_swc1] | icode[`FI_sdc1];
    assign finfo[`FINFO_TOMDU]=icode[`FI_mfc1];

    assign round_mode={icode[`FI_ceil] | icode[`FI_floor],icode[`FI_floor] | icode[`FI_trunc]};
    assign fcc_addr=icode[`FI_ccond] ? inst[10:8] : inst[20:18];

    //global
    assign fpu_global_ctrl[`FPU_G_WEN0]=finfo[`FINFO_WEN0];
    assign fpu_global_ctrl[`FPU_G_WEN1]=finfo[`FINFO_WEN1];
    assign fpu_global_ctrl[`FPU_G_JUMP]=icode[`FI_bc1f] | icode[`FI_bc1t];
    assign fpu_global_ctrl[`FPU_G_WRITECC]=icode[`FI_ccond];
    assign fpu_global_ctrl[`FPU_G_RI]=reserved;

    //fpuctrl
    assign fpu_ctrl[`FPUCTRL_DIRECT]=icode[`FI_abs] | icode[`FI_ldc1] | icode[`FI_lwc1] |
        icode[`FI_mfc1] | icode[`FI_mov] | icode[`FI_movn] | icode[`FI_movz] |
        icode[`FI_mtc1] | icode[`FI_neg] | icode[`FI_sdc1] | icode[`FI_swc1] | reserved;
    assign fpu_ctrl[`FPUCTRL_ABS]=icode[`FI_abs];
    assign fpu_ctrl[`FPUCTRL_NEG]=icode[`FI_neg];
    assign fpu_ctrl[`FPUCTRL_ADD]=icode[`FI_add] | icode[`FI_sub] | fpu_ctrl[`FPUCTRL_CAST];
    assign fpu_ctrl[`FPUCTRL_SUB]=icode[`FI_sub];
    assign fpu_ctrl[`FPUCTRL_MUL]=icode[`FI_mul];
    assign fpu_ctrl[`FPUCTRL_DIV]=icode[`FI_div];
    assign fpu_ctrl[`FPUCTRL_SQRT]=icode[`FI_sqrt];
    assign fpu_ctrl[`FPUCTRL_CINT]=icode[`FI_cvtw] | icode[`FI_round] | icode[`FI_ceil] | icode[`FI_floor] | icode[`FI_trunc];
    assign fpu_ctrl[`FPUCTRL_CVTW]=icode[`FI_cvtw];
    assign fpu_ctrl[`FPUCTRL_CFNUM]=(icode[`FI_cvtd] | icode[`FI_cvts]) & fmt_w;
    assign fpu_ctrl[`FPUCTRL_OPSNG]=(usefs_fmt & fmt_s) | usefs_32;
    assign fpu_ctrl[`FPUCTRL_RESSNG]=(fdwen_fmt & fmt_s) | fdwen_32;
    assign fpu_ctrl[`FPUCTRL_CAST]=(icode[`FI_cvtd] & fmt_s) | (icode[`FI_cvts] & fmt_d);
    assign fpu_ctrl[`FPUCTRL_MOVN]=icode[`FI_movn];
    assign fpu_ctrl[`FPUCTRL_MOVZ]=icode[`FI_movz];
    assign fpu_ctrl[`FPUCTRL_TOHIGH]=finfo[`FINFO_WEN1] & ~finfo[`FINFO_WEN0];
    assign fpu_ctrl[`FPUCTRL_MOVMU]=icode[`FI_ldc1] | icode[`FI_lwc1];
    assign fpu_ctrl[`FPUCTRL_MOVMDU]=icode[`FI_mtc1];

    //fccuctrl
    assign fccu_ctrl[`FCCUCTRL_CMP]=icode[`FI_ccond];
    assign fccu_ctrl[`FCCUCTRL_BRANCH]=icode[`FI_bc1f] | icode[`FI_bc1t];
    assign fccu_ctrl[`FCCUCTRL_FALSE]=icode[`FI_bc1f] | icode[`FI_movf] | icode[`FI_movffmt];
    assign fccu_ctrl[`FCCUCTRL_TOCPU]=icode[`FI_movf] | icode[`FI_movt];
    assign fccu_ctrl[`FCCUCTRL_CMOV]=icode[`FI_movffmt] | icode[`FI_movtfmt];
    assign fccu_ctrl[`FCCUCTRL_OPSNG]=fmt_s;
    assign fccu_ctrl[`FCCUCTRL_TOHIGH]=finfo[`FINFO_WEN1] & ~finfo[`FINFO_WEN0];


endmodule