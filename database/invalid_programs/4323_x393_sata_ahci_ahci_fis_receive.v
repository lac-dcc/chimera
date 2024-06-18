// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>ahci_fis_receive
 * @file ahci_fis_receive.v
 * @date 2016-01-06  
 * @author Andrey Filippov      
 *
 * @brief Receives incoming FIS-es, forwards DMA ones to DMA engine
 * Stores received FIS-es if requested
 *
 * 'fis_first_vld' is asserted when the FIFO output contains first DWORD
 * of the received FIS (low byte - FIS type). FIS type is decoded
 * outside of this module, and the caller pulses one of the get_* inputs
 * to initiate incoming FIS processing (or ignoring it).
 * 'get_fis_busy' is high until the fis is being received/stored,
 * one of the 3 states (fis_ok, fis_err and fis_ferr) are raised 
 * This module also receives/updates device signature and PxTFD ERR and STS.
 *
 * @copyright Copyright (c) 2016 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * ahci_fis_receive.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  ahci_fis_receive.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 */
`timescale 1ns/1ps

module  ahci_fis_receive#(
    parameter ADDRESS_BITS = 10 // number of memory address bits - now fixed. Low half - RO/RW/RWC,RW1 (2-cycle write), 2-nd just RW (single-cycle)
)(
    input                         hba_rst, // @posedge mclk - sync reset
    input                         mclk, // for command/status
    input                         pcmd_st_cleared, // ~= hba_rst?
    // Control Interface
    output reg                    fis_first_vld,     // fis_first contains valid FIS header, reset by get_*
    // Debug features
    output                        fis_first_invalid, // Some data available from FIFO, but not FIS head
    input                         fis_first_flush,   // Skip FIFO data until empty or FIS head
    // Receiving FIS
    input                         get_dsfis,
    input                         get_psfis,
    input                         get_rfis,
    input                         get_sdbfis,
    input                         get_ufis,
    input                         get_data_fis,
    input                         get_ignore,    // ignore whatever FIS (use for DMA activate too?)
    output                        get_fis_busy,  // busy processing FIS 
    output reg                    get_fis_done,  // done processing FIS (see fis_ok, fis_err, fis_ferr)
    output reg                    fis_ok,        // FIS done,  checksum OK reset by starting a new get FIS
    output reg                    fis_err,       // FIS done, checksum ERROR reset by starting a new get FIS
    output                        fis_ferr,      // FIS done, fatal error - FIS too long
    input                         dma_prds_done, // dma is done - check if FIS is done (some data may get stuck in dma FIFO - reported separately)
    output                        fis_extra,     // all wanted data got, FIS may have extra data (non-fatal). Does not deny fis_ok
    input                         set_update_sig,// when set, enables update_sig (and resets itself)
    output                        pUpdateSig,    // state variable
    output reg                    sig_available, // device signature a ailable
    // next commands use register address/data/we for 1 clock cycle - after next to command (commnd - t0, we - t2)
    input                         update_sig,    // update signature - now after get_rfis, after FIS is already received
    input                         update_err_sts,// update PxTFD.STS and PxTFD.ERR from the last received regs d2h
    input                         update_pio,    // update PxTFD.STS and PxTFD.ERR from pio_* (entry PIO:Update)
    input                         update_prdbc,  // update PRDBC in registers
    input                         clear_prdbc,   // save resources - clear prdbc for every command - discard what is written there
    input                         clear_bsy_drq, // clear PxTFD.STS.BSY and PxTFD.STS.DRQ, update
    input                         clear_bsy_set_drq, // clear PxTFD.STS.BSY and sets PxTFD.STS.DRQ, update
    input                         set_bsy,       // set PxTFD.STS.BSY, update
    input                         set_sts_7f,    // set PxTFD.STS = 0x7f, update
    input                         set_sts_80,    // set PxTFD.STS = 0x80 (may be combined with set_sts_7f), update

    input                         clear_xfer_cntr, // clear pXferCntr (is it needed as a separate input)?
    input                         decr_dwcr,     // decrement DMA Xfer counter after read (in this module) // need pulse to 'update_prdbc' to write to registers
    input                         decr_dwcw,     // decrement DMA Xfer counter after write (from decr_DXC_dw)// need pulse to 'update_prdbc' to write to registers
    input                  [11:0] decr_DXC_dw,   // decrement value (in DWORDs)
    
    input                         pcmd_fre,      // control bit enables saving FIS to memory (will be ignored for signature)
    
    // TODO: Add writing PRDBC here? Yes, the following. B ut data may be discarded as only 0 is supposed to be written
//    input      [ADDRESS_BITS-1:0] soft_write_addr,  // register address written by software
//    input                  [31:0] soft_write_data,  // register data written (after applying wstb and type (RO, RW, RWC, RW1)
//    input                         soft_write_en,     // write enable for data write
    
    
    output reg                    pPioXfer,      // state variable
    output                  [7:0] tfd_sts,       // Current PxTFD status field (updated after regFIS and SDB - certain fields)
                                                 // tfd_sts[7] - BSY, tfd_sts[3] - DRQ, tfd_sts[0] - ERR
    output                  [7:0] tfd_err,       // Current PxTFD error field (updated after regFIS and SDB)
    output reg                    fis_i,         // value of "I" field in received regsD2H or SDB FIS or DMA Setup FIS
    output reg                    sdb_n,         // value of "N" field in received SDB FIS 
    output reg                    dma_a,         // value of "A" field in received DMA Setup FIS 
    output reg                    dma_d,         // value of "D" field in received DMA Setup FIS
    output reg                    pio_i,         // value of "I" field in received PIO Setup FIS
    output reg                    pio_d,         // value of "D" field in received PIO Setup FIS
    output                  [7:0] pio_es,        // value of PIO E_Status
    output reg                    sactive0,      // bit 0 of sActive DWORD received in SDB FIS
    // Using even word count (will be rounded up), partial DWORD (last) will be handled by PRD length if needed
    output                 [31:2] xfer_cntr,     // transfer counter in words for both DMA (31 bit) and PIO (lower 15 bits), updated after decr_dwc
    output                        xfer_cntr_zero,// valid next cycle
    output                 [11:0] data_in_dwords, // number of data dwords received (valid with 'done')
    // FSM will send this pulse
//    output reg                    data_in_words_apply, // apply data_in_words

// Registers interface
// 2. HBA R/W registers, may be added external register layer
    output reg [ADDRESS_BITS-1:0] reg_addr,      
    output reg                    reg_we,
    output reg             [31:0] reg_data,        
    
    input                  [31:0] hba_data_in,         // FIFO output data
    input                  [ 1:0] hba_data_in_type,    // 0 - data, 1 - FIS head, 2 - R_OK, 3 - R_ERR
    input                         hba_data_in_valid,  // Data available from the transport layer in FIFO                
    input                         hba_data_in_many,    // Multiple DWORDs available from the transport layer in FIFO           
    output                        hba_data_in_ready,   // This module or DMA consumes DWORD

    // Forwarding data to the DMA engine
    input                         dma_in_ready,        // DMA engine ready to accept data
    output                        dma_in_valid         // Write data to DMA dev->memory channel
    
   ,output                       debug_data_in_ready,
    output                       debug_fis_end_w,
    output                 [1:0] debug_fis_end_r,
    output                 [1:0] debug_get_fis_busy_r

);
//localparam FA_BITS =        6; // number of bits in received FIS address
//localparam CLB_OFFS32 = 'h200; // # In the second half of the register space (0x800..0xbff - 1KB)
/*
HBA_OFFS = 0x0 # All offsets are in bytes
CLB_OFFS = 0x800 # In the second half of the register space (0x800..0xbff - 1KB)
FB_OFFS =  0xc00 # Needs 0x100 bytes 
#HBA_PORT0 = 0x100 Not needed, always HBA_OFFS + 0x100

*/

`include "includes/ahci_localparams.vh" // @SuppressThisWarning VEditor : Unused localparams

localparam CLB_OFFS32 =        'h200; //  # In the second half of the register space (0x800..0xbff - 1KB)
localparam HBA_OFFS32 =         0;
localparam HBA_PORT0_OFFS32  = 'h40;
localparam PXSIG_OFFS32 = HBA_OFFS32 + HBA_PORT0_OFFS32 + 'h9; 
localparam PXTFD_OFFS32 = HBA_OFFS32 + HBA_PORT0_OFFS32 + 'h8; 
localparam FB_OFFS32 =         'h300; // # Needs 0x100 bytes 
localparam DSFIS32 =           'h0;   // DMA Setup FIS
localparam PSFIS32 =           'h8;   // PIO Setup FIS
localparam RFIS32 =            'h10;  // D2H Register FIS
localparam SDBFIS32 =          'h16;  // Set device bits FIS
localparam UFIS32 =            'h18;  // Unknown FIS
localparam DSFIS32_LENM1 =     'h6;   // DMA Setup FIS
localparam PSFIS32_LENM1 =     'h4;   // PIO Setup FIS
localparam RFIS32_LENM1 =      'h4;   // D2H Register FIS
localparam SDBFIS32_LENM1 =    'h1;
localparam UFIS32_LENM1 =      'hf;
localparam DMAH_LENM1 =        'h0; // just one word
localparam IGNORE_LENM1 =      'hf;

localparam DATA_TYPE_DMA =      0;
localparam DATA_TYPE_FIS_HEAD = 1;
localparam DATA_TYPE_OK =       2;
localparam DATA_TYPE_ERR =      3;


    reg                 xfer_cntr_zero_r;
    wire                dma_in_start;
    wire                dma_in_stop;
    wire                dma_skipping_extra; // skipping extra FIS data not needed for DMA
    reg                 dma_in;
    reg           [1:0] was_data_in;
    reg          [11:0] data_in_dwords_r;
    reg                 dwords_over;
    reg                 too_long_err;
    
    reg [ADDRESS_BITS-1:0] reg_addr_r;
    reg           [3:0] fis_dcount; // number of DWORDS left to be written to the "memory"
    reg                 fis_save;   // save FIS data
    wire                is_fis_end = (hba_data_in_type == DATA_TYPE_OK) || (hba_data_in_type == DATA_TYPE_ERR);
    wire                fis_end_w = data_in_ready && is_fis_end & ~(|fis_end_r);
    reg           [1:0] fis_end_r;
     
    reg                 fis_rec_run; // running received FIS
    reg                 is_data_fis;
    reg                 is_ignore;
    
    wire                is_FIS_HEAD =     data_in_ready && (hba_data_in_type == DATA_TYPE_FIS_HEAD);
    wire                is_FIS_NOT_HEAD = data_in_ready && (hba_data_in_type != DATA_TYPE_FIS_HEAD);
    
//    wire                data_in_ready =  hba_data_in_valid && (hba_data_in_many || (!(|was_data_in) && hba_data_in_ready));
    wire                data_in_ready =  hba_data_in_valid && (hba_data_in_many || !(|was_data_in));
    
    wire                get_fis = get_dsfis || get_psfis || get_rfis || get_sdbfis || get_ufis || get_data_fis ||  get_ignore;
    reg                 wreg_we_r; 
    
    wire                reg_we_w;

    reg           [3:0] store_sig;
    reg           [5:0] reg_ds;     //Unused?
    reg           [4:0] reg_ps;
    reg                 reg_d2h;    //unused?
    reg           [1:0] reg_sdb;    //unused?
    reg          [31:2] xfer_cntr_r;
    reg          [31:2] prdbc_r;
    

    reg          [15:0] tf_err_sts;
    reg                 update_err_sts_r;
    reg                 update_sig_r;
//    reg                 update_pio_r;
    reg                 update_prdbc_r;
    reg           [1:0] get_fis_busy_r;
    
    
    reg           [7:0] pio_es_r;        // value of PIO E_Status
    reg           [7:0] pio_err_r;
    
    reg                 pUpdateSig_r = 1; // state variable
    reg          [31:0] sig_r;            // signature register, save at
    
    reg                 fis_extra_r;
    
    reg                 fis_first_invalid_r;
    reg                 fis_first_flushing_r;
    
    assign xfer_cntr_zero = xfer_cntr_zero_r;
    
    // Forward data to DMA (dev->mem) engine 
    assign              dma_in_valid =       dma_in && dma_in_ready && (hba_data_in_type == DATA_TYPE_DMA) && data_in_ready && !too_long_err;
    // Will also try to skip to the end of too long FIS
    assign              dma_skipping_extra = dma_in && (fis_extra_r || too_long_err) && (hba_data_in_type == DATA_TYPE_DMA) && data_in_ready ;

    assign              dma_in_stop =        dma_in && data_in_ready && (hba_data_in_type != DATA_TYPE_DMA); // ||
    
    
    assign reg_we_w = wreg_we_r && !dwords_over && fis_save;
    assign dma_in_start = is_data_fis && wreg_we_r;
    
    assign hba_data_in_ready = dma_in_valid || dma_skipping_extra ||  wreg_we_r || fis_end_r[0] || (is_FIS_NOT_HEAD && fis_first_flushing_r);
    assign fis_ferr = too_long_err;
    
    
    assign tfd_sts = tf_err_sts[ 7:0];
    assign tfd_err = tf_err_sts[15:8];
    
    assign xfer_cntr = xfer_cntr_r[31:2];
    assign get_fis_busy = get_fis_busy_r[0];
//    assign data_in_dwords = data_out_dwords_r;
    assign data_in_dwords = data_in_dwords_r;
    
    assign pio_es = pio_es_r;
    assign pUpdateSig = pUpdateSig_r; 
    
    assign fis_extra = fis_extra_r;
    
    assign fis_first_invalid = fis_first_invalid_r;
    
//debug:
    assign debug_data_in_ready =  data_in_ready;
    assign debug_fis_end_w =      fis_end_w;
    assign debug_fis_end_r =      fis_end_r;
    assign debug_get_fis_busy_r = get_fis_busy_r;
    
    
    
    always @ (posedge mclk) begin
        if (hba_rst || dma_in_stop || pcmd_st_cleared) dma_in <= 0;
        else if (dma_in_start)                         dma_in <= 1;
        
        if   (hba_rst) was_data_in <= 0;
        else           was_data_in <= {was_data_in[0], hba_data_in_ready};
        
        if      (dma_in_start) data_in_dwords_r <= 0;
        else if (dma_in_valid) data_in_dwords_r <=  data_in_dwords_r + 1;
        
        if      (hba_rst)                                 too_long_err <= 0; // it is a fatal error, only reset
        else if ((dma_in_valid && data_in_dwords_r[11]) ||
                  (wreg_we_r && dwords_over))             too_long_err <= 1;
                  
        if      (hba_rst || dma_in_start || pcmd_st_cleared)                            fis_extra_r <= 0;
        else if (data_in_ready && (hba_data_in_type == DATA_TYPE_DMA) && dma_prds_done) fis_extra_r <= 1;
        
                  
        
        if (get_fis) begin
           reg_addr_r <= ({ADDRESS_BITS{get_dsfis}}  & (FB_OFFS32 + DSFIS32))  |
                         ({ADDRESS_BITS{get_psfis}}  & (FB_OFFS32 + PSFIS32))  |
                         ({ADDRESS_BITS{get_rfis}}   & (FB_OFFS32 + RFIS32))   |
                         ({ADDRESS_BITS{get_sdbfis}} & (FB_OFFS32 + SDBFIS32)) |
                         ({ADDRESS_BITS{get_ufis}}   & (FB_OFFS32 + UFIS32));
           fis_dcount <= ({4{get_dsfis}}    & DSFIS32_LENM1)  |
                         ({4{get_psfis}}    & PSFIS32_LENM1)  |
                         ({4{get_rfis}}     & RFIS32_LENM1)   |
                         ({4{get_sdbfis}}   & SDBFIS32_LENM1) |
                         ({4{get_ufis}}     & UFIS32_LENM1 )  |
                         ({4{get_data_fis}} & DMAH_LENM1)     |
                         ({4{get_ignore}}   & IGNORE_LENM1 );
           // save signature FIS to memory if waiting (if not - ignore FIS)
           // for non-signature /non-data - obey pcmd_fre 
           fis_save <=    (pUpdateSig_r && get_rfis) || (pcmd_fre && !get_data_fis && !get_ignore);
           
           is_data_fis <= get_data_fis;
           store_sig <=   (get_rfis)?    1 : 0;
           reg_ds <=      get_dsfis ? 1 : 0;
           reg_ps <=      get_psfis ? 1 : 0;
           reg_d2h <=     get_rfis ?  1 : 0;    
           reg_sdb <=     get_rfis ?  1 : 0;
           is_ignore <=   get_ignore ? 1 : 0;  
        end else if (wreg_we_r && !dwords_over) begin
           fis_dcount <= fis_dcount - 1;               // update even if not writing to registers
           if (fis_save) reg_addr_r <= reg_addr_r + 1; // update only when writing to registers
           store_sig <=   store_sig << 1;
           reg_ds <=      reg_ds << 1;
           reg_ps <=      reg_ps << 1;
           reg_d2h <=     0;    
           reg_sdb <=     reg_sdb << 1;    
           
        end
        
        if      (hba_rst || pcmd_st_cleared)  fis_rec_run <= 0;
        else if (get_fis)                     fis_rec_run <= 1;
        else if (is_fis_end && data_in_ready) fis_rec_run <= 0;
        
        if      (hba_rst ||get_fis || pcmd_st_cleared)        dwords_over <= 0;
        else if (wreg_we_r && !(|fis_dcount))                 dwords_over <= 1;
        
        if (hba_rst) wreg_we_r <= 0;
        else         wreg_we_r <= fis_rec_run && data_in_ready && !is_fis_end && !dwords_over && (|fis_dcount || !wreg_we_r) &&
                                  (!is_ignore || !wreg_we_r); // Ignore - unknown length, ned to look for is_fis_end with latency

        fis_end_r <= {fis_end_r[0], fis_end_w};
        
        if      (hba_rst || pcmd_st_cleared)  get_fis_busy_r[0] <= 0;
        else if (get_fis)                     get_fis_busy_r[0] <= 1;
        else if (too_long_err || fis_end_w)   get_fis_busy_r[0] <= 0;

        get_fis_busy_r[1] <=get_fis_busy_r[0];
        
        get_fis_done <=  get_fis_busy_r[0] && (too_long_err || fis_end_w);
        
        if      (hba_rst || (|get_fis_busy_r) || pcmd_st_cleared) fis_first_vld <= 0; // is_FIS_HEAD stays on longer than just get_fis
        else if (is_FIS_HEAD)                                     fis_first_vld <= 1;
        
        if      (hba_rst || get_fis)          fis_ok <= 0;
        else if (fis_end_w)                   fis_ok <= hba_data_in_type == DATA_TYPE_OK;
        
        if      (hba_rst || get_fis)          fis_err <= 0;
        else if (fis_end_w)                   fis_err <= hba_data_in_type != DATA_TYPE_OK;
        

        if (reg_we_w)                         reg_data <=    hba_data_in;
        else if (update_err_sts_r)            reg_data <=    {16'b0,tf_err_sts};
        else if (update_sig_r)                reg_data <=    sig_r;
        else if (update_prdbc_r)              reg_data <=    {prdbc_r[31:2],2'b0}; // xfer_cntr_r[31:2],2'b0};

        if (store_sig[1])                     sig_r[31:8] <= hba_data_in[23:0];
        if (store_sig[3])                     sig_r[ 7:0] <= hba_data_in[ 7:0];
        
        if      (hba_rst)                     tf_err_sts  <= 0;
        else if (reg_d2h)                     tf_err_sts  <= hba_data_in[31:16]; // 15:0];
        //  Sets pPioErr[pPmpCur] to Error field of the FIS
        //  Updates PxTFD.STS.ERR with pPioErr[pPmpCur] ??
        else if (reg_ps[0])                   tf_err_sts  <= {hba_data_in[31:24],hba_data_in[23:16]};
        else if (update_pio)                  tf_err_sts  <= {pio_err_r, pio_es_r};
        else if (reg_sdb[0])                  tf_err_sts  <= {hba_data_in[15:8], tf_err_sts[7], hba_data_in[6:4], tf_err_sts[3],hba_data_in[2:0]};
        else if (clear_bsy_drq || set_bsy || clear_bsy_set_drq)
                                              tf_err_sts  <= tf_err_sts & {8'hff,clear_bsy_drq,3'h7,clear_bsy_drq,3'h7} | {8'h0,set_bsy,3'h0,clear_bsy_set_drq,3'h0};
        else if (set_sts_7f || set_sts_80)    tf_err_sts  <= {tf_err_sts[15:8],set_sts_80,{7{set_sts_7f}}} ;
        
        if (hba_rst) reg_we <= 0; 
        else         reg_we <= reg_we_w || update_sig_r || update_err_sts_r || update_prdbc_r;
        
        if      (reg_we_w)                    reg_addr <=  reg_addr_r;
        else if (update_err_sts_r)            reg_addr <=  PXTFD_OFFS32;
        else if (update_sig_r)                reg_addr <=  PXSIG_OFFS32;
        else if (update_prdbc_r)              reg_addr <=  CLB_OFFS32 + 1; // location of PRDBC
        
        if (reg_d2h || reg_sdb[0] || reg_ds[0])  fis_i <=           hba_data_in[14];
        
        if (reg_sdb)                          sdb_n <=           hba_data_in[15];
        if (reg_ds[0])                        {dma_a,dma_d}  <=  {hba_data_in[15],hba_data_in[13]};

        if (reg_ps[0])                        {pio_i,pio_d}  <=  {hba_data_in[14],hba_data_in[13]};
        
        if (hba_rst)                          pio_err_r  <=      0;
        else if (reg_ps[0])                   pio_err_r  <=      hba_data_in[31:24];

        if (hba_rst)                          pio_es_r  <=       0;
        else if (reg_ps[3])                   pio_es_r  <=       hba_data_in[31:24];
        
        if (reg_sdb[1])                       sactive0 <=        hba_data_in[0];
        
        if (hba_rst || reg_sdb[0] || clear_xfer_cntr)           xfer_cntr_r[31:2] <= 0;
        else if (reg_ps[4] || reg_ds[5])                        xfer_cntr_r[31:2] <= {reg_ds[5]?hba_data_in[31:16]:16'b0,
                                                                                      hba_data_in[15:2]} + hba_data_in[1]; // round up
        else if ((decr_dwcw || decr_dwcr) && !xfer_cntr_zero_r) xfer_cntr_r[31:2] <= {xfer_cntr_r[31:2]} - 
                                                                                     {18'b0, decr_dwcr? data_in_dwords: decr_DXC_dw[11:0]};
        
        // no - it should only be updated when written by software
        //CLB_OFFS32 + 1; // location of PRDBC
/*
    input      [ADDRESS_BITS-1:0] soft_write_addr,  // register address written by software
    input                  [31:0] soft_write_data,  // register data written (after applying wstb and type (RO, RW, RWC, RW1)
    input                         soft_write_en,     // write enable for data write
*/        
//        if (hba_rst || reg_sdb[0] || reg_ps[4] || reg_ds[5])  prdbc_r[31:2] <= 0;
//        if (soft_write_en && (soft_write_addr == (CLB_OFFS32 + 1))) prdbc_r[31:2] <= soft_write_data[31:2];

        if (clear_prdbc || hba_rst)             prdbc_r[31:2] <= 0;
        else if (decr_dwcw || decr_dwcr)        prdbc_r[31:2] <= {prdbc_r[31:2]} + {18'b0, decr_dwcr? data_in_dwords: decr_DXC_dw[11:0]};
        
        xfer_cntr_zero_r <=                     xfer_cntr_r[31:2] == 0;
        
        update_err_sts_r <= update_pio || update_err_sts || clear_bsy_drq || set_bsy || set_sts_7f || set_sts_80;
        update_prdbc_r <= update_prdbc; // same latency as update_err_sts
        update_sig_r <=   update_sig && pUpdateSig_r; // do not update if not requested
        
        if (hba_rst || update_pio)     pPioXfer <= 0;
        else if (reg_ps[4])            pPioXfer <= 1;
        
        if (hba_rst || set_update_sig) pUpdateSig_r <= 1;
        else if (update_sig)           pUpdateSig_r <= 0;
        
        if (hba_rst || update_sig)     sig_available <= 0;
        else if (store_sig[3])         sig_available <= 1;
        
        // Maybe it is not needed if the fsm will send this pulse?

        if (hba_rst || (|get_fis_busy_r) ||pcmd_st_cleared) fis_first_invalid_r <= 0;
        else                                                fis_first_invalid_r <= is_FIS_NOT_HEAD;
        
        if (!fis_first_invalid_r)      fis_first_flushing_r <= 0;
        else if (fis_first_flush)      fis_first_flushing_r <= 1;
    end

endmodule
