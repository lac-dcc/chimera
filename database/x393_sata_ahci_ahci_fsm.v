// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>ahci_fsm
 * @file ahci_fsm.v
 * @date 2016-01-10  
 * @author Andrey Filippov     
 *
 * @brief AHCI host+port0 state machine
 *
 * @copyright Copyright (c) 2016 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * ahci_fsm.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  ahci_fsm.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 */
`timescale 1ns/1ps

module  ahci_fsm 
/*#(
//    parameter PREFETCH_ALWAYS =   0,
    parameter READ_REG_LATENCY =  2, // 0 if  reg_rdata is available with reg_re/reg_addr, 2 with re/regen
//    parameter READ_CT_LATENCY =   1, // 0 if  ct_rdata is available with reg_re/reg_addr, 2 with re/regen
    parameter ADDRESS_BITS =     10 // number of memory address bits - now fixed. Low half - RO/RW/RWC,RW1 (2-cycle write), 2-nd just RW (single-cycle)
) */
(
    input                         hba_rst, // @posedge mclk
    input                         mclk, // for command/status
    input                         was_hba_rst,    // last reset was hba reset (not counting system reset)
    input                         was_port_rst,   // last reset was port reset
    
    // Writing FSM program memory
    input                         aclk,
    input                         arst,
    input                  [17:0] pgm_ad, // @aclk, address/data to program the AHCI FSM
    input                         pgm_wa,  // @aclk, address strobe to program the AHCI FSM
    input                         pgm_wd,  // @aclk, data strobe to program the AHCI FSM

    
    // direct communication with transposrt, link and phy layers
    input                   [1:0] phy_ready,     // goes up after comreset,cominit, align, ..., showing speed 
    output                        syncesc_send,  // Send sync escape
    input                         syncesc_send_done, // "SYNC escape until the interface is quiescent..."
    output                        comreset_send,     // Not possible yet?
    input                         cominit_got,   // asynchronously jumps to P:Cominit state
    output                        set_offline, // electrically idle
//    input                         x_rdy_collision, // X_RDY/X_RDY collision on interface 
    output                        send_R_OK,    // Should it be originated in this layer SM?
    output                        send_R_ERR,
    
    // Other signals....
    
    // Communication with ahci_ctrl_stat (some are not needed)
    // update register inputs (will write to register memory current value of the corresponding register)
    output                        pfsm_started, // H: FSM done, P: FSM started (enable sensing pcmd_st_cleared)
    // update register inputs (will write to register memory current value of the corresponding register)
    // Removing - such updates are always done when startimng new state
///    input                         update_pending,
    output                        update_all,  // =fsm_jump[0]
    input                         update_busy, // valid same cycle as update_all
//    output                        update_gis,  // these following individual may be unneeded - just use universal update_all
//    output                        update_pis,
//    output                        update_ssts,
//    output                        update_serr,
//    output                        update_pcmd,
//    output                        update_pci,
///    input                         st01_pending,    // software turned PxCMD.ST from 0 to 1 - detected in the loop
///    input                         st10_pending,    // software turned PxCMD.ST from 1 to 0 - generates port reset
///    output                        st_pending_reset,// reset both st01_pending and st10_pending

// PxCMD
///   output                        pcmd_clear_icc, // clear PxCMD.ICC field
///   output                        pcmd_esp,       // external SATA port (just forward value)
///   input                         pcmd_cr,        // command list run - current
    output                        pcmd_cr_set,    // command list run set
    output                        pcmd_cr_reset,  // command list run reset
//    output                        pcmd_fr,        // ahci_fis_receive:get_fis_busy
///    output                        pcmd_clear_bsy_drq, // == ahci_fis_receive:clear_bsy_drq

// Command List override, not yet implemented (optional), keeping @SuppressWarnings VEditor
    input                         pcmd_clo,       //RW1, causes ahci_fis_receive:clear_bsy_drq, that in turn resets this bit
///    output                        pcmd_clear_st,  // RW clear ST (start) bit Seems it is software controlled only
    input                         pcmd_st,        // current value
    input                         pcmd_st_cleared,// ST bit cleared by software;
    
//clear_bsy_drq    
// Interrupt inputs
    output                        sirq_TFE, // RWC: Task File Error Status
    output                        sirq_IF,  // RWC: Interface Fatal Error Status (sect. 6.1.2)
    output                        sirq_INF, // RWC: Interface Non-Fatal Error Status (sect. 6.1.2)
    output                        sirq_OF,  // RWC: Overflow Status
    output                        sirq_PRC, // RO:  PhyRdy changed Status
    output                        sirq_PC,  // RO:  Port Connect Change Status
    output                        sirq_DP,  // RWC: Descriptor Processed with "I" bit on
    output                        sirq_UF,  // RO:  Unknown FIS
    output                        sirq_SDB, // RWC: Set Device Bits Interrupt - Set Device bits FIS with 'I' bit set
    output                        sirq_DS,  // RWC: DMA Setup FIS Interrupt - DMA Setup FIS received with 'I' bit set
    output                        sirq_PS,  // RWC: PIO Setup FIS Interrupt - PIO Setup FIS received with 'I' bit set
    output                        sirq_DHR, // RWC: D2H Register FIS Interrupt - D2H Register FIS received with 'I' bit set
// SCR1:SError (only inputs that are not available in sirq_* ones
                                  //sirq_PC,
                                  //sirq_UF
// 5.3.2.3  P:NotRunning.8 - can not be implemented now, keeping @SuppressWarnings VEditor
    input                         serr_diag_X, // value of PxSERR.DIAG.X

     
    
// SCR0: SStatus
    output                        ssts_ipm_dnp,      // device not present or communication not established
    output                        ssts_ipm_active,   // device in active state
    output                        ssts_ipm_part,     // device in partial state
    output                        ssts_ipm_slumb,    // device in slumber state
    output                        ssts_ipm_devsleep, // device in DevSleep state
    
    output                        ssts_spd_dnp,      // device not present or communication not established
    output                        ssts_spd_gen1,     // Gen 1 rate negotiated
    output                        ssts_spd_gen2,     // Gen 2 rate negotiated
    output                        ssts_spd_gen3,     // Gen 3 rate negotiated
    
    output                        ssts_det_ndnp,     // no device detected, phy communication not established
    output                        ssts_det_dnp,      // device detected, but phy communication not established
    output                        ssts_det_dp,       // device detected, phy communication established
    output                        ssts_det_offline,  // device detected, phy communication established
    input                   [3:0] ssts_det,          // current value of PxSSTS.DET

 // SCR2:SControl (written by software only)
 ///   input                   [3:0] sctl_ipm,          // Interface power management transitions allowed
 ///   input                   [3:0] sctl_spd,          // Interface maximal speed
    input                   [3:0] sctl_det,          // Device detection initialization requested
    input                         sctl_det_changed,  // Software had written new value to sctl_det
    output                        sctl_det_reset,    // clear sctl_det_changed
    
    output                        hba_rst_done,      // reset GHC.HR and other bits
    
    output                        pxci0_clear,       // PxCI clear
    input                         pxci0,             // pxCI current value
    
    // inputs from the DMA engine
///   input                         dma_prd_done, // output (finished next prd)
    output                        dma_prd_irq_clear, // reset pending prd_irq
    input                         dma_prd_irq_pend,  // prd interrupt pending. This is just a condition for irq - actual will be generated after FIS OK
    input                         dma_cmd_busy,      // output reg (DMA engine is processing PRDs)
///    input                         dma_cmd_done,   // output (last PRD is over)
    output                        dma_cmd_abort,     // try to abort a command
    input                         dma_abort_done,    // if abort is not needed, will generate dma_abort_done just next cycle
    
    // Communication with ahci_fis_receive (some are unused)
    // Debug features
    input                         fis_first_invalid, // Some data available from FIFO, but not FIS head
    output                        fis_first_flush,   // Skip FIFO data until empty or FIS head

    input                         fis_first_vld, // fis_first contains valid FIS header, reset by 'get_*'
    input                   [7:0] fis_type,      // FIS type (low byte in the first FIS DWORD), valid with  'fis_first_vld'
    input                   [7:0] bist_bits,    // bits that define built-in self test
    
    // Receiving FIS
    output                        get_dsfis,
    output                        get_psfis,
    output                        get_rfis,
    output                        get_sdbfis,
    output                        get_ufis,
    output                        get_data_fis,
    output                        get_ignore,    // ignore whatever FIS (use for DMA activate too?)
//    input                         get_fis_busy,  // busy processing FIS 
    input                         get_fis_done,  // done processing FIS (see fis_ok, fis_err, fis_ferr)
    input                         fis_ok,        // FIS done,  checksum OK reset by starting a new get FIS
    input                         fis_err,       // FIS done, checksum ERROR reset by starting a new get FIS
    input                         fis_ferr,      // FIS done, fatal error - FIS too long
    input                         fis_extra,     // more data got from FIS than DMA can accept. Does not deny fis_ok. May have latency

    output                        set_update_sig, // when set, enables get_sig (and resets itself)
///    input                         pUpdateSig,     // state variable
///    input                         sig_available,  // device signature available
    output                        update_sig,        // update signature


    // next commands use register address/data/we for 1 clock cycle - after next to command (commnd - t0, we - t2)
    output                        update_err_sts,// update PxTFD.STS and PxTFD.ERR from the last received regs d2h
    output                        update_pio,    // update PxTFD.STS and PxTFD.ERR from pio_* (entry PIO:Update)
    
    output                        update_prdbc,  // update PRDBC in registers
    output                        clear_bsy_drq, // clear PxTFD.STS.BSY and PxTFD.STS.DRQ, update
    output                        clear_bsy_set_drq, // clear PxTFD.STS.BSY and sets PxTFD.STS.DRQ, update
    
    output                        set_bsy,       // set PxTFD.STS.BSY, update
    output                        set_sts_7f,    // set PxTFD.STS = 0x7f, update
    output                        set_sts_80,    // set PxTFD.STS = 0x80 (may be combined with set_sts_7f), update
    output                        clear_xfer_cntr, // clear pXferCntr (is it needed as a separate input)?
    
    output                        decr_dwcr,     // decrement DMA Xfer counter after read // need pulse to 'update_prdbc' to write to registers
    output                        decr_dwcw,     // decrement DMA Xfer counter after write // need pulse to 'update_prdbc' to write to registers
//    output                 [11:0] decr_DXC_dw,   // decrement value (in DWORDs)
    input                         pxcmd_fre,     // control bit enables saving FIS to memory
    input                         pPioXfer,      // state variable
    input                   [7:0] tfd_sts,       // Current PxTFD status field (updated after regFIS and SDB - certain fields)
                                                 // tfd_sts[7] - BSY, tfd_sts[3] - DRQ, tfd_sts[0] - ERR
///    input                   [7:0] tfd_err,       // Current PxTFD error field (updated after regFIS and SDB)
    input                         fis_i,         // value of "I" field in received regsD2H or SDB FIS
///    input                         sdb_n,         // value of "N" field in received SDB FIS 
    input                         dma_a,         // value of "A" field in received DMA Setup FIS 
///    input                         dma_d,         // value of "D" field in received DMA Setup FIS
    input                         pio_i,         // value of "I" field in received PIO Setup FIS
    input                         pio_d,         // value of "D" field in received PIO Setup FIS
///    input                   [7:0] pio_es,        // value of PIO E_Status
///    input                         sactive0,      // bit 0 of sActive DWORD received in SDB FIS
    // Using even word count (will be rounded up), partial DWORD (last) will be handled by PRD length if needed
///    input                  [31:2] xfer_cntr,     // transfer counter in words for both DMA (31 bit) and PIO (lower 15 bits), updated after decr_dwc
    input                         xfer_cntr_zero,// valid next cycle                   
    
    // Communication with ahci_fis_transmit
    // Command pulses to execute states
    output                        fetch_cmd,    // Enter p:FetchCmd, fetch command header (from the register memory, prefetch command FIS)
                                                // wait for either fetch_cmd_busy == 0 or pCmdToIssue ==1 after fetch_cmd
    output                        cfis_xmit,    // transmit command (wait for dma_ct_busy == 0)
    output                        dx_xmit,      // send FIS header DWORD, (just 0x46), then forward DMA data
                                                // transmit until error, 2048DWords or pDmaXferCnt 
    output                        atapi_xmit,   // tarsmit ATAPI command FIS
    input                         xmit_done,
//    input                         xmit_busy,

    output                        clearCmdToIssue, // From CFIS:SUCCESS 
    input                         pCmdToIssue, // AHCI port variable
//    output                        dmaCntrZero, // DMA counter is zero - would be a duplicate to the one in receive module and dwords_sent output
//    input                         syncesc_recv, // These two inputs interrupt transmit
//    input                         xmit_err,     // 
    input                  [ 2:0] dx_err,       // bit 0 - syncesc_recv, 1 - R_ERR (was xmit_err), 2 - X_RDY/X_RDY collision (valid @ xmit_err and later, reset by new command)
    
///    input                  [15:0] ch_prdtl,    // Physical region descriptor table length (in entries, 0 is 0)
    input                         ch_c,        // Clear busy upon R_OK for this FIS
    input                         ch_b,        // Built-in self test command
    input                         ch_r,        // reset - may need to send SYNC escape before this command
    input                         ch_p,        // prefetchable - only used with non-zero PRDTL or ATAPI bit set
    input                         ch_w,        // Write: system memory -> device
    input                         ch_a,         // ATAPI: 1 means device should send PIO setup FIS for ATAPI command
    input                         unsolicited_en,    // enable processing of cominit_got and PxERR.DIAG.W interrupts from
                                                     // this bit is reset at reset, set when PxSSTS.DET==3 or PxSCTL.DET==4
    
    output reg             [ 9:0] last_jump_addr // debug feature
///    input                   [4:0] ch_cfl,      // length of the command FIS in DW, 0 means none. 0 and 1 - illegal,
                                               // maximal is 16 (0x10)
///    input                  [11:0] dwords_sent // number of DWORDs transmitted (up to 2048)                                 

);
`include "includes/ahci_localparams.vh" // @SuppressThisWarning VEditor : Unused localparams
`include "includes/fis_types.vh"        // @SuppressThisWarning VEditor : Some  localparams unused
    // Reset addresses - later use generated
    localparam LABEL_POR =        11'h000;
    localparam LABEL_HBA_RST =    11'h002;
    localparam LABEL_PORT_RST =   11'h004;
    localparam LABEL_COMINIT =    11'h006;
    localparam LABEL_ST_CLEARED = 11'h008;

    wire                           tfd_bsy =     tfd_sts[7];
    wire                           tfd_drq =     tfd_sts[3];
    wire                           tfd_sts_err = tfd_sts[0];
    
    reg                     [ 9:0] pgm_waddr;
//    wire                           pgm_ren;
//    wire                           pgm_regen;
    wire                           cond_met_w; // calculated from signals and program conditions decoder
    reg                     [ 9:0] pgm_jump_addr;
    reg                     [ 9:0] pgm_addr;
    wire                    [17:0] pgm_data;
    reg                            was_rst;
//    reg                            jump_r; 
    reg                      [2:0] fsm_jump;
    wire                           fsm_next;
//    reg                            fsm_next_r;
    reg                            fsm_actions;    // processing actions
    reg                            dis_actions;    // disable actions during async jump
    reg                            fsm_act_busy;
    reg                      [1:0] fsm_transitions; // processing transitions
    reg                            fsm_preload;    // read first sequence data (2 cycles for regen)
//    wire                     [7:0] precond_w = pgm_data[17:10];   // select what to use - cond_met_w valis after precond_w, same time as conditions
//    reg                      [7:0] conditions;
//    wire                           pre_jump_w =   (|async_pend_r) ? async_ackn : |(cond_met_w & fsm_transitions[1]);
    wire                           pre_jump_w =   (|async_pend_r) ? async_ackn : (cond_met_w & fsm_transitions[1]);
    wire                           fsm_act_done_w = get_fis_done ||
                                                  xmit_done ||
                                                  (syncesc_send_pend && syncesc_send_done) ||
                                                  dma_abort_done ||
                                                  asynq_rq; // cominit_got || pcmd_st_cleared
    reg                            fsm_act_done; // made later by 1 cycle so the new conditions are latched // TODO:check is enough ? Adding 1 extra                                              
    reg                            fsm_act_pre_done;                                              
    wire                           fsm_wait_act_w = pgm_data[16]; // this action requires waiting for done
    wire                           fsm_last_act_w = pgm_data[17];

    wire                           fsm_pre_act_w = !dis_actions && fsm_actions && fsm_next; // use it as CS for generated actions (registered)
    
    reg                      [1:0] async_pend_r; // waiting to process cominit_got
    reg                            async_from_st; // change to multi-bit if there will be more sources for async transitions
//    wire                           asynq_rq = (cominit_got && unsolicited_cominit_en) || pcmd_st_cleared;
    wire                           asynq_rq = (cominit_got && unsolicited_en) || pcmd_st_cleared;
                                   // OK to wait for some time fsm_act_busy is supposed to never hang up
    wire                           async_ackn = !fsm_preload && async_pend_r[0] && ((fsm_actions && !update_busy && !fsm_act_busy) || fsm_transitions[0]);   // OK to process async jump
//    reg                            x_rdy_collision_pend;
    reg                            syncesc_send_pend; // waiting for 'syncesc_send' confiramtion 'syncesc_send_done'
    reg                      [1:0] phy_ready_prev;    // previous state of phy_ready / speed
    reg                            phy_ready_chng_r;  // pulse when phy_ready changes
    wire                           phy_ready_chng_w = !hba_rst && !was_rst && (phy_ready != phy_ready_prev);
    reg                            was_last_action_r; // delay last action if it was fsm_wait_act;
    
    wire                           fsm_transitions_w =  // next will be transitions processing
                                       (fsm_last_act_w && fsm_actions && fsm_next && !fsm_wait_act_w) ||
                                       (fsm_act_busy && fsm_act_done && was_last_action_r);
    
    wire                           conditions_ce =  // copy all conditions to the register so they will not change while iterating through them
                                       !fsm_transitions_w && !fsm_transitions[0];
//    reg                            unsolicited_cominit_en; // allow unsolicited COMINITs
//    wire                           en_cominit; // en_cominit

    // New variable:
    reg                            pisn32; // pIssueSlot != 32
    wire                           clear_pisn32; // additional clear when in P:NotRunning state
    
    assign fsm_next = (fsm_preload || (fsm_actions && !update_busy && !fsm_act_busy) || fsm_transitions[0]) && !async_pend_r[0]; // quiet if received cominit is pending
    assign update_all = fsm_jump[0];

    assign ssts_ipm_dnp =      phy_ready_chng_r && (phy_ready_prev == 0);  // device not present or communication not established
    assign ssts_ipm_active =   phy_ready_chng_r && (phy_ready_prev != 0);  // device in active state
    assign ssts_ipm_part =     0;                                          // device in partial state
    assign ssts_ipm_slumb =    0;                                          // device in slumber state
    assign ssts_ipm_devsleep = 0;                                          // device in DevSleep state
    
    assign ssts_spd_dnp =      phy_ready_chng_r && (phy_ready_prev == 0);  // device not present or communication not established
    assign ssts_spd_gen1 =     phy_ready_chng_r && (phy_ready_prev == 1);  // Gen 1 rate negotiated
    assign ssts_spd_gen2 =     phy_ready_chng_r && (phy_ready_prev == 2);  // Gen 2 rate negotiated
    assign ssts_spd_gen3 =     phy_ready_chng_r && (phy_ready_prev == 3);  // Gen 3 rate negotiated
    
    assign ssts_det_ndnp =     phy_ready_chng_r && (phy_ready_prev == 0);  // no device detected, phy communication not established
//    assign ssts_det_dnp =      0;                                          // device detected, but phy communication not established
    assign ssts_det_dp =       phy_ready_chng_r && (phy_ready_prev != 0);  // device detected, phy communication established

    assign sirq_OF =           0;  // RWC: Overflow Status (buffer overrun - should not happen, add?)
    assign sirq_PRC =          phy_ready_chng_r; // RO:  PhyRdy changed Status



    // Writing to the FSM program memory
    always @ (posedge aclk) begin
        if      (arst)   pgm_waddr <= 0;
        else if (pgm_wa) pgm_waddr <= pgm_ad[ 9:0];
        else if (pgm_wd) pgm_waddr <=  pgm_waddr + 1;
    end

    always @ (posedge mclk) begin
        if (hba_rst || pxci0_clear || clear_pisn32) pisn32 <= 0; 
        else if (fetch_cmd)                         pisn32 <= 1;
        
    end

    always @ (posedge mclk) begin
///        if      (hba_rst)                     unsolicited_cominit_en <= !was_port_rst;
//      else if (en_cominit || comreset_send) unsolicited_cominit_en <= en_cominit;
    
    
        if      (hba_rst)                                                    pgm_jump_addr <= (was_hba_rst || was_port_rst) ? (was_hba_rst? LABEL_HBA_RST:LABEL_PORT_RST) : LABEL_POR;
//        else if (async_pend_r[1])                                            pgm_jump_addr <= async_from_st? LABEL_ST_CLEARED : LABEL_COMINIT;
        else if (async_pend_r[0])                                            pgm_jump_addr <= async_from_st? LABEL_ST_CLEARED : LABEL_COMINIT;
        else if (fsm_transitions[0] && (!cond_met_w || !fsm_transitions[1])) pgm_jump_addr <= pgm_data[9:0];
        
        was_rst <= hba_rst;
        
///     fsm_act_done <= fsm_act_done_w; // delay by 1 clock cycle
        fsm_act_pre_done <= fsm_act_done_w; // delay by 1 clock cycle
        fsm_act_done <= fsm_act_pre_done; // TODO - verify delay by 2 is needed to latch
        fsm_jump <= {fsm_jump[1:0], pre_jump_w | (was_rst & ~hba_rst)};
        
        if   (fsm_jump[0]) pgm_addr <= pgm_jump_addr;
        else if (fsm_next) pgm_addr <= pgm_addr + 1;
        
        if   (fsm_jump[0]) last_jump_addr <= pgm_jump_addr; // debug feature
        
//        if            (hba_rst) conditions <= 0; 
//        if (fsm_transitions[0]) conditions <= precond_w;
        
        if      (hba_rst)                                   fsm_actions <= 0;
        else if (fsm_jump[2])                               fsm_actions <= 1;
        else if (fsm_last_act_w && fsm_next)                fsm_actions <= 0;
        
        if      (hba_rst)                                   dis_actions <= 0;
        else if (|async_pend_r)                             dis_actions <= 1;
        else if (fsm_jump[2])                               dis_actions <= 0;
        
        
        if (fsm_actions && fsm_next)                        was_last_action_r <= fsm_last_act_w;
        
////    if      (hba_rst || pre_jump_w)                                fsm_transitions <= 0;
/// 2016.12.07 jumps were not disabled after async transitions, they came from the previously executed code
        if      (hba_rst || pre_jump_w || dis_actions)                 fsm_transitions <= 0;
        else if (fsm_transitions_w)                                    fsm_transitions <= 1; 
//        else if ((fsm_last_act_w && fsm_actions && fsm_next && !fsm_wait_act_w) ||
//                 (fsm_act_busy && fsm_act_done && was_last_action_r) ) fsm_transitions <= 1;
        else                                                           fsm_transitions <= {fsm_transitions[0],fsm_transitions[0]};
        
        if (hba_rst) fsm_preload <= 0;
        else         fsm_preload <= |fsm_jump[1:0];
        
        if      (hba_rst)       fsm_act_busy <= 0;
        else if (fsm_pre_act_w) fsm_act_busy <= fsm_wait_act_w;
        else if (fsm_act_done)  fsm_act_busy <= 0;
        
        if      (hba_rst)         async_from_st <= 0;
        else if (pcmd_st_cleared) async_from_st <= 1;
        else if (asynq_rq)        async_from_st <= 0;
        
        if (hba_rst) async_pend_r <= 0;
///        else async_pend_r <= {async_pend_r[0], asynq_rq | (async_pend_r[0] & ~async_ackn)};  
        else async_pend_r <= {async_pend_r[0], (asynq_rq | async_pend_r[0]) & ~async_ackn};  
        
        
//        if (hba_rst || pcmd_cr_set) x_rdy_collision_pend <= 0;
//        else if (x_rdy_collision)   x_rdy_collision_pend <= 1;
        
        if (hba_rst || syncesc_send_done) syncesc_send_pend <= 0;
        else if (syncesc_send)            syncesc_send_pend <= 1;
        
        if (was_rst && !hba_rst && !was_hba_rst && !was_port_rst) phy_ready_prev <= 0;
        else if (phy_ready_chng_w)                                phy_ready_prev <=  phy_ready;
        
        phy_ready_chng_r <= phy_ready_chng_w; 
        
    end

    ram18p_var_w_var_r #(
        .REGISTERS(1),
        .LOG2WIDTH_WR(4),
        .LOG2WIDTH_RD(4)
        `include "includes/ahxi_fsm_code.vh" 
    ) fsm_pgm_mem_i (
        .rclk     (mclk),      // input
        .raddr    (pgm_addr),  // input[10:0] 
        .ren      (fsm_next),  // input
        .regen    (fsm_next),  // input
        .data_out (pgm_data),  // output[17:0] 
        .wclk     (aclk),      // input
        .waddr    (pgm_waddr), // input[10:0] 
        .we       (pgm_wd),    // input
        .web      (4'hf),     // input[7:0] 
        .data_in  (pgm_ad)     // input[17:0] 
    );

    action_decoder action_decoder_i (
        .clk                (mclk),              // input
        .enable             (fsm_pre_act_w),     // input
        .data               (pgm_data[10:0]),    // input[10:0]
    // CTRL_STAT
        .PXSERR_DIAG_X      (sirq_PC),           // output reg 
        .SIRQ_DHR           (sirq_DHR),          // output reg 
        .SIRQ_DP            (sirq_DP),           // output reg 
        .SIRQ_DS            (sirq_DS),           // output reg 
        .SIRQ_IF            (sirq_IF),           // output reg 
        .SIRQ_INF           (sirq_INF),          // output reg 
        .SIRQ_PS            (sirq_PS),           // output reg 
        .SIRQ_SDB           (sirq_SDB),          // output reg 
        .SIRQ_TFE           (sirq_TFE),          // output reg 
        .SIRQ_UF            (sirq_UF),           // output reg 
        .PFSM_STARTED       (pfsm_started),      // output reg 
        .PCMD_CR_CLEAR      (pcmd_cr_reset),     // output reg 
        .PCMD_CR_SET        (pcmd_cr_set),       // output reg 
        .PXCI0_CLEAR        (pxci0_clear),       // output reg 
        .PXSSTS_DET_1       (ssts_det_dnp),      // output reg 
        .SSTS_DET_OFFLINE   (ssts_det_offline),  // output reg 
        .SCTL_DET_CLEAR     (sctl_det_reset),    // output reg 
        .HBA_RST_DONE       (hba_rst_done), // output reg 
    // FIS RECEIVE
        .SET_UPDATE_SIG     (set_update_sig),    // output reg 
        .UPDATE_SIG         (update_sig),        // output reg 
        .UPDATE_ERR_STS     (update_err_sts),    // output reg 
        .UPDATE_PIO         (update_pio),        // output reg 
        .UPDATE_PRDBC       (update_prdbc),      // output reg 
        .CLEAR_BSY_DRQ      (clear_bsy_drq),     // output reg 
        .CLEAR_BSY_SET_DRQ  (clear_bsy_set_drq), // output reg 
        .SET_BSY            (set_bsy),           // output reg 
        .SET_STS_7F         (set_sts_7f),        // output reg 
        .SET_STS_80         (set_sts_80),        // output reg 
        .XFER_CNTR_CLEAR    (clear_xfer_cntr),   // output reg 
        .DECR_DWCR          (decr_dwcr),         // output reg 
        .DECR_DWCW          (decr_dwcw),         // output reg 
        .FIS_FIRST_FLUSH    (fis_first_flush),   // output reg
    // FIS_TRANSMIT
        .CLEAR_CMD_TO_ISSUE (clearCmdToIssue),   // output reg
    // DMA
        .DMA_ABORT          (dma_cmd_abort),     // output reg 
        .DMA_PRD_IRQ_CLEAR  (dma_prd_irq_clear), // output reg
    // SATA TRANSPORT/LINK/PHY
        .XMIT_COMRESET      (comreset_send),     // output reg 
        .SEND_SYNC_ESC      (syncesc_send),      // output reg 
        .SET_OFFLINE        (set_offline),       // output reg 
        .R_OK               (send_R_OK),         // output reg 
        .R_ERR              (send_R_ERR),        // output reg
//        .EN_COMINIT         (en_cominit),      // output reg
        .EN_COMINIT         (clear_pisn32),      // output reg
    // FIS TRANSMIT/WAIT DONE
        .FETCH_CMD          (fetch_cmd),         // output reg 
        .ATAPI_XMIT         (atapi_xmit),        // output reg 
        .CFIS_XMIT          (cfis_xmit),         // output reg 
        .DX_XMIT            (dx_xmit),           // output reg
    //FIS RECEIVE/WAIT DONE
        .GET_DATA_FIS       (get_data_fis),      // output reg 
        .GET_DSFIS          (get_dsfis),         // output reg 
        .GET_IGNORE         (get_ignore),        // output reg 
        .GET_PSFIS          (get_psfis),         // output reg 
        .GET_RFIS           (get_rfis),          // output reg 
        .GET_SDBFIS         (get_sdbfis),        // output reg 
        .GET_UFIS           (get_ufis)           // output reg 
    );

// Condition inputs may be registered if needed
    condition_mux condition_mux_i (
        .clk                   (mclk),                                    // input
        .ce                    (conditions_ce),                           // input
        .sel                   (pgm_data[17:10]),                         // input[7:0]
        .condition             (cond_met_w),                              // output
    //COMPOSITE
        .ST_NB_ND              (pcmd_st && !tfd_bsy &&!tfd_drq),          // input PxCMD.ST & !PxTFD.STS.BSY & !PxTFD.STS.DRQ
//        .PXCI0_NOT_CMDTOISSUE  (pxci0 && !pCmdToIssue),                 // input pxci0 && !pCmdToIssue was pIssueSlot==32, -> p:SelectCmd
        .PXCI0_NOT_CMDTOISSUE  (pxci0 && !pisn32),                        // input pxci0 && !pCmdToIssue was pIssueSlot==32, -> p:SelectCmd
        .PCTI_CTBAR_XCZ        (pCmdToIssue && xfer_cntr_zero && ch_r ),  // input  pCmdToIssue && ch_r && xfer_cntr_zero
        .PCTI_XCZ              (pCmdToIssue && xfer_cntr_zero),           // input  pCmdToIssue && xfer_cntr_zero
        .NST_D2HR              (!pcmd_st && (fis_type == FIS_D2HR)),      // input !ST && (FIS == FIS_D2HR) TODO: does it mean either BSY or DRQ are 1?
        .NPD_NCA               (!pio_d && !ch_a),                         // input  pio_d = 0 && ch_a == 0
        .CHW_DMAA              (ch_w && dma_a),                           // input ch_w && dma_a
    // CTRL_STAT
        .SCTL_DET_CHANGED_TO_4 (sctl_det_changed && (sctl_det == 4)),     // input (requires sctl_det_reset after)
        .SCTL_DET_CHANGED_TO_1 (sctl_det_changed && (sctl_det == 1)),     // input (requires sctl_det_reset after)
        .PXSSTS_DET_NE_3       (ssts_det != 3),                           // input  ssts_det!=3, // device detected, phy communication not established
        .PXSSTS_DET_EQ_1       (ssts_det == 1),                           // input
        .NPCMD_FRE             (!pxcmd_fre),                              // input !pcmd_fre (docs: goto P:NotRunning, but we need to clear FIFO)
    // FIS RECEIVE
        .FIS_OK                (fis_ok),                                  // input
        .FIS_ERR               (fis_err),                                 // input
        .FIS_FERR              (fis_ferr),                                // input
        .FIS_EXTRA             (fis_extra),                               // input
        .FIS_FIRST_INVALID     (fis_first_invalid),                       // input
        .FR_D2HR               (fis_first_vld && (fis_type == FIS_D2HR)), // input fis_first_vld & fis_type == 0x34 (D2H Register)
        .FIS_DATA              (fis_first_vld && (fis_type == FIS_DATA)), // input fis_first_vld && (fis_type == 'h46)
        .FIS_ANY               (fis_first_vld),                           // input
        .NB_ND_D2HR_PIO        (((fis_type == FIS_D2HR) || (fis_type == FIS_PIOS)) && !tfd_bsy && !tfd_drq), // input ((FIS == FIS_D2HR) || (FIS == FIS_PIOS)) && !PxTFD.STS.BSY & !PxTFD.STS.DRQ
        .D2HR                  (  fis_type == FIS_D2HR),                  // input  FIS == FIS_D2HR
        .SDB                   (  fis_type == FIS_SDB),                   // input
        .DMA_ACT               (  fis_type == FIS_DMAA),                  // input
        .DMA_SETUP             (  fis_type == FIS_DMAS),                  // input
        .BIST_ACT_FE           (( fis_type == FIS_BIST) && (|bist_bits)), // input FIS == FIS_BIST && |bist_bits
        .BIST_ACT              (( fis_type == FIS_BIST)),                 // input FIS == FIS_BIST#  && !(|bist_bits)
        .PIO_SETUP             (  fis_type == FIS_PIOS),                  // input
        .NB_ND                 (!tfd_bsy &&!tfd_drq),                     // input PxTFD.STS.BSY =’0’ and PxTFD.STS.DRQ =’0’
        .TFD_STS_ERR           ( tfd_sts_err),                            // input  tfd_sts[0]
        .FIS_I                 (fis_i),                                   // input
        .PIO_I                 (pio_i),                                   // input
        .NPD                   (!pio_d),                                  // input pio_d = 0 , "ch_a == 1" is not needed
        .PIOX                  (pPioXfer),                                // input
        .XFER0                 (xfer_cntr_zero && !dma_cmd_busy),         // input  xfer_cntr_zero
        .PIOX_XFER0            (pPioXfer && xfer_cntr_zero &&!dma_cmd_busy), // input pPioXfer && xfer_cntr_zero
    // FIS_TRANSMIT
        .CTBAA_CTBAP           (ch_a && ch_p),                            // input
        .CTBAP                 (ch_p),                                    // input
        .CTBA_B                (ch_b),                                    // input
        .CTBA_C                (ch_c),                                    // input
        .TX_ERR                (dx_err[1]),                               // input  dx_err[1] (reset by new command)
        .SYNCESC_ERR           (dx_err[0]),                               // input
    // DMA
        .DMA_PRD_IRQ_PEND      (dma_prd_irq_pend),                        // input
    // SATA TRANSPORT/LINK/PHY        
        .X_RDY_COLLISION       (dx_err[2]) //x_rdy_collision_pend)                     // input
    );



/*
    output                        update_all,
    input                         update_busy, // valid same cycle as update_all


Notes:
 Implement sync esc request/ackn in TL (available in LL)
*/
endmodule

