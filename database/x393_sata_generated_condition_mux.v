// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>condition_mux
 * @file   condition_mux.v 
 * @date   2016-12-08  
 * @author auto-generated file, see ahci_fsm_sequence.py
 * @brief  Select condition
 */

`timescale 1ns/1ps

module condition_mux (
    input        clk,
    input        ce,  // enable recording all conditions
    input [ 7:0] sel,
    output       condition,
    input        ST_NB_ND,
    input        PXCI0_NOT_CMDTOISSUE,
    input        PCTI_CTBAR_XCZ,
    input        PCTI_XCZ,
    input        NST_D2HR,
    input        NPD_NCA,
    input        CHW_DMAA,
    input        SCTL_DET_CHANGED_TO_4,
    input        SCTL_DET_CHANGED_TO_1,
    input        PXSSTS_DET_NE_3,
    input        PXSSTS_DET_EQ_1,
    input        NPCMD_FRE,
    input        FIS_OK,
    input        FIS_ERR,
    input        FIS_FERR,
    input        FIS_EXTRA,
    input        FIS_FIRST_INVALID,
    input        FR_D2HR,
    input        FIS_DATA,
    input        FIS_ANY,
    input        NB_ND_D2HR_PIO,
    input        D2HR,
    input        SDB,
    input        DMA_ACT,
    input        DMA_SETUP,
    input        BIST_ACT_FE,
    input        BIST_ACT,
    input        PIO_SETUP,
    input        NB_ND,
    input        TFD_STS_ERR,
    input        FIS_I,
    input        PIO_I,
    input        NPD,
    input        PIOX,
    input        XFER0,
    input        PIOX_XFER0,
    input        CTBAA_CTBAP,
    input        CTBAP,
    input        CTBA_B,
    input        CTBA_C,
    input        TX_ERR,
    input        SYNCESC_ERR,
    input        DMA_PRD_IRQ_PEND,
    input        X_RDY_COLLISION);

    wire [44:0] masked;
    reg  [43:0] registered;
    reg  [ 5:0] cond_r;

    assign condition = |cond_r;

    assign masked[ 0] = registered[ 0]  && sel[ 2] && sel[ 1] && sel[ 0];
    assign masked[ 1] = registered[ 1]  && sel[ 3] && sel[ 1] && sel[ 0];
    assign masked[ 2] = registered[ 2]  && sel[ 4] && sel[ 1] && sel[ 0];
    assign masked[ 3] = registered[ 3]  && sel[ 5] && sel[ 1] && sel[ 0];
    assign masked[ 4] = registered[ 4]  && sel[ 6] && sel[ 1] && sel[ 0];
    assign masked[ 5] = registered[ 5]  && sel[ 7] && sel[ 1] && sel[ 0];
    assign masked[ 6] = registered[ 6]  && sel[ 3] && sel[ 2] && sel[ 0];
    assign masked[ 7] = registered[ 7]  && sel[ 4] && sel[ 2] && sel[ 0];
    assign masked[ 8] = registered[ 8]  && sel[ 5] && sel[ 2] && sel[ 0];
    assign masked[ 9] = registered[ 9]  && sel[ 6] && sel[ 2] && sel[ 0];
    assign masked[10] = registered[10]  && sel[ 7] && sel[ 2] && sel[ 0];
    assign masked[11] = registered[11]  && sel[ 4] && sel[ 3] && sel[ 0];
    assign masked[12] = registered[12]  && sel[ 5] && sel[ 3] && sel[ 0];
    assign masked[13] = registered[13]  && sel[ 6] && sel[ 3] && sel[ 0];
    assign masked[14] = registered[14]  && sel[ 7] && sel[ 3] && sel[ 0];
    assign masked[15] = registered[15]  && sel[ 5] && sel[ 4] && sel[ 0];
    assign masked[16] = registered[16]  && sel[ 6] && sel[ 4] && sel[ 0];
    assign masked[17] = registered[17]  && sel[ 7] && sel[ 4] && sel[ 0];
    assign masked[18] = registered[18]  && sel[ 6] && sel[ 5] && sel[ 0];
    assign masked[19] = registered[19]  && sel[ 7] && sel[ 5] && sel[ 0];
    assign masked[20] = registered[20]  && sel[ 7] && sel[ 6] && sel[ 0];
    assign masked[21] = registered[21]  && sel[ 3] && sel[ 2] && sel[ 1];
    assign masked[22] = registered[22]  && sel[ 4] && sel[ 2] && sel[ 1];
    assign masked[23] = registered[23]  && sel[ 5] && sel[ 2] && sel[ 1];
    assign masked[24] = registered[24]  && sel[ 6] && sel[ 2] && sel[ 1];
    assign masked[25] = registered[25]  && sel[ 7] && sel[ 2] && sel[ 1];
    assign masked[26] = registered[26]  && sel[ 4] && sel[ 3] && sel[ 1];
    assign masked[27] = registered[27]  && sel[ 5] && sel[ 3] && sel[ 1];
    assign masked[28] = registered[28]  && sel[ 6] && sel[ 3] && sel[ 1];
    assign masked[29] = registered[29]  && sel[ 7] && sel[ 3] && sel[ 1];
    assign masked[30] = registered[30]  && sel[ 5] && sel[ 4] && sel[ 1];
    assign masked[31] = registered[31]  && sel[ 6] && sel[ 4] && sel[ 1];
    assign masked[32] = registered[32]  && sel[ 7] && sel[ 4] && sel[ 1];
    assign masked[33] = registered[33]  && sel[ 6] && sel[ 5] && sel[ 1];
    assign masked[34] = registered[34]  && sel[ 7] && sel[ 5] && sel[ 1];
    assign masked[35] = registered[35]  && sel[ 7] && sel[ 6] && sel[ 1];
    assign masked[36] = registered[36]  && sel[ 4] && sel[ 3] && sel[ 2];
    assign masked[37] = registered[37]  && sel[ 5] && sel[ 3] && sel[ 2];
    assign masked[38] = registered[38]  && sel[ 6] && sel[ 3] && sel[ 2];
    assign masked[39] = registered[39]  && sel[ 7] && sel[ 3] && sel[ 2];
    assign masked[40] = registered[40]  && sel[ 5] && sel[ 4] && sel[ 2];
    assign masked[41] = registered[41]  && sel[ 6] && sel[ 4] && sel[ 2];
    assign masked[42] = registered[42]  && sel[ 7] && sel[ 4] && sel[ 2];
    assign masked[43] = registered[43]  && sel[ 6] && sel[ 5] && sel[ 2];
    assign masked[44] = !(|sel); // always TRUE condition (sel ==0)

    always @(posedge clk) begin
        if (ce) begin
            registered[ 0] <= ST_NB_ND;
            registered[ 1] <= PXCI0_NOT_CMDTOISSUE;
            registered[ 2] <= PCTI_CTBAR_XCZ;
            registered[ 3] <= PCTI_XCZ;
            registered[ 4] <= NST_D2HR;
            registered[ 5] <= NPD_NCA;
            registered[ 6] <= CHW_DMAA;
            registered[ 7] <= SCTL_DET_CHANGED_TO_4;
            registered[ 8] <= SCTL_DET_CHANGED_TO_1;
            registered[ 9] <= PXSSTS_DET_NE_3;
            registered[10] <= PXSSTS_DET_EQ_1;
            registered[11] <= NPCMD_FRE;
            registered[12] <= FIS_OK;
            registered[13] <= FIS_ERR;
            registered[14] <= FIS_FERR;
            registered[15] <= FIS_EXTRA;
            registered[16] <= FIS_FIRST_INVALID;
            registered[17] <= FR_D2HR;
            registered[18] <= FIS_DATA;
            registered[19] <= FIS_ANY;
            registered[20] <= NB_ND_D2HR_PIO;
            registered[21] <= D2HR;
            registered[22] <= SDB;
            registered[23] <= DMA_ACT;
            registered[24] <= DMA_SETUP;
            registered[25] <= BIST_ACT_FE;
            registered[26] <= BIST_ACT;
            registered[27] <= PIO_SETUP;
            registered[28] <= NB_ND;
            registered[29] <= TFD_STS_ERR;
            registered[30] <= FIS_I;
            registered[31] <= PIO_I;
            registered[32] <= NPD;
            registered[33] <= PIOX;
            registered[34] <= XFER0;
            registered[35] <= PIOX_XFER0;
            registered[36] <= CTBAA_CTBAP;
            registered[37] <= CTBAP;
            registered[38] <= CTBA_B;
            registered[39] <= CTBA_C;
            registered[40] <= TX_ERR;
            registered[41] <= SYNCESC_ERR;
            registered[42] <= DMA_PRD_IRQ_PEND;
            registered[43] <= X_RDY_COLLISION;
        end
        cond_r[ 0] <= |masked[ 7: 0];
        cond_r[ 1] <= |masked[15: 8];
        cond_r[ 2] <= |masked[23:16];
        cond_r[ 3] <= |masked[31:24];
        cond_r[ 4] <= |masked[39:32];
        cond_r[ 5] <= |masked[44:40];
    end
endmodule
