// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>action_decoder
 * @file   action_decoder.v 
 * @date   2016-12-08  
 * @author auto-generated file, see ahci_fsm_sequence.py
 * @brief  Decode sequencer code to 1-hot actions
 */

`timescale 1ns/1ps

module action_decoder (
    input        clk,
    input        enable,
    input [10:0] data,
    output reg   PXSERR_DIAG_X,
    output reg   SIRQ_DHR,
    output reg   SIRQ_DP,
    output reg   SIRQ_DS,
    output reg   SIRQ_IF,
    output reg   SIRQ_INF,
    output reg   SIRQ_PS,
    output reg   SIRQ_SDB,
    output reg   SIRQ_TFE,
    output reg   SIRQ_UF,
    output reg   PFSM_STARTED,
    output reg   PCMD_CR_CLEAR,
    output reg   PCMD_CR_SET,
    output reg   PXCI0_CLEAR,
    output reg   PXSSTS_DET_1,
    output reg   SSTS_DET_OFFLINE,
    output reg   SCTL_DET_CLEAR,
    output reg   HBA_RST_DONE,
    output reg   SET_UPDATE_SIG,
    output reg   UPDATE_SIG,
    output reg   UPDATE_ERR_STS,
    output reg   UPDATE_PIO,
    output reg   UPDATE_PRDBC,
    output reg   CLEAR_BSY_DRQ,
    output reg   CLEAR_BSY_SET_DRQ,
    output reg   SET_BSY,
    output reg   SET_STS_7F,
    output reg   SET_STS_80,
    output reg   XFER_CNTR_CLEAR,
    output reg   DECR_DWCR,
    output reg   DECR_DWCW,
    output reg   FIS_FIRST_FLUSH,
    output reg   CLEAR_CMD_TO_ISSUE,
    output reg   DMA_ABORT,
    output reg   DMA_PRD_IRQ_CLEAR,
    output reg   XMIT_COMRESET,
    output reg   SEND_SYNC_ESC,
    output reg   SET_OFFLINE,
    output reg   R_OK,
    output reg   R_ERR,
    output reg   EN_COMINIT,
    output reg   FETCH_CMD,
    output reg   ATAPI_XMIT,
    output reg   CFIS_XMIT,
    output reg   DX_XMIT,
    output reg   GET_DATA_FIS,
    output reg   GET_DSFIS,
    output reg   GET_IGNORE,
    output reg   GET_PSFIS,
    output reg   GET_RFIS,
    output reg   GET_SDBFIS,
    output reg   GET_UFIS);

    always @(posedge clk) begin
        PXSERR_DIAG_X <=      enable && data[ 1] && data[ 0];
        SIRQ_DHR <=           enable && data[ 2] && data[ 0];
        SIRQ_DP <=            enable && data[ 3] && data[ 0];
        SIRQ_DS <=            enable && data[ 4] && data[ 0];
        SIRQ_IF <=            enable && data[ 5] && data[ 0];
        SIRQ_INF <=           enable && data[ 6] && data[ 0];
        SIRQ_PS <=            enable && data[ 7] && data[ 0];
        SIRQ_SDB <=           enable && data[ 8] && data[ 0];
        SIRQ_TFE <=           enable && data[ 9] && data[ 0];
        SIRQ_UF <=            enable && data[10] && data[ 0];
        PFSM_STARTED <=       enable && data[ 2] && data[ 1];
        PCMD_CR_CLEAR <=      enable && data[ 3] && data[ 1];
        PCMD_CR_SET <=        enable && data[ 4] && data[ 1];
        PXCI0_CLEAR <=        enable && data[ 5] && data[ 1];
        PXSSTS_DET_1 <=       enable && data[ 6] && data[ 1];
        SSTS_DET_OFFLINE <=   enable && data[ 7] && data[ 1];
        SCTL_DET_CLEAR <=     enable && data[ 8] && data[ 1];
        HBA_RST_DONE <=       enable && data[ 9] && data[ 1];
        SET_UPDATE_SIG <=     enable && data[10] && data[ 1];
        UPDATE_SIG <=         enable && data[ 3] && data[ 2];
        UPDATE_ERR_STS <=     enable && data[ 4] && data[ 2];
        UPDATE_PIO <=         enable && data[ 5] && data[ 2];
        UPDATE_PRDBC <=       enable && data[ 6] && data[ 2];
        CLEAR_BSY_DRQ <=      enable && data[ 7] && data[ 2];
        CLEAR_BSY_SET_DRQ <=  enable && data[ 8] && data[ 2];
        SET_BSY <=            enable && data[ 9] && data[ 2];
        SET_STS_7F <=         enable && data[10] && data[ 2];
        SET_STS_80 <=         enable && data[ 4] && data[ 3];
        XFER_CNTR_CLEAR <=    enable && data[ 5] && data[ 3];
        DECR_DWCR <=          enable && data[ 6] && data[ 3];
        DECR_DWCW <=          enable && data[ 7] && data[ 3];
        FIS_FIRST_FLUSH <=    enable && data[ 8] && data[ 3];
        CLEAR_CMD_TO_ISSUE <= enable && data[ 9] && data[ 3];
        DMA_ABORT <=          enable && data[10] && data[ 3];
        DMA_PRD_IRQ_CLEAR <=  enable && data[ 5] && data[ 4];
        XMIT_COMRESET <=      enable && data[ 6] && data[ 4];
        SEND_SYNC_ESC <=      enable && data[ 7] && data[ 4];
        SET_OFFLINE <=        enable && data[ 8] && data[ 4];
        R_OK <=               enable && data[ 9] && data[ 4];
        R_ERR <=              enable && data[10] && data[ 4];
        EN_COMINIT <=         enable && data[ 6] && data[ 5];
        FETCH_CMD <=          enable && data[ 7] && data[ 5];
        ATAPI_XMIT <=         enable && data[ 8] && data[ 5];
        CFIS_XMIT <=          enable && data[ 9] && data[ 5];
        DX_XMIT <=            enable && data[10] && data[ 5];
        GET_DATA_FIS <=       enable && data[ 7] && data[ 6];
        GET_DSFIS <=          enable && data[ 8] && data[ 6];
        GET_IGNORE <=         enable && data[ 9] && data[ 6];
        GET_PSFIS <=          enable && data[10] && data[ 6];
        GET_RFIS <=           enable && data[ 8] && data[ 7];
        GET_SDBFIS <=         enable && data[ 9] && data[ 7];
        GET_UFIS <=           enable && data[10] && data[ 7];
    end
endmodule
