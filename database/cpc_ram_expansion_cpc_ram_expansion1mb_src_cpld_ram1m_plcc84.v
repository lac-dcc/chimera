// This program was cloned from: https://github.com/revaldinho/cpc_ram_expansion
// License: GNU General Public License v3.0

/*
 * This code is part of the cpc_ram_expansion set of Amstrad CPC peripherals.
 * https://github.com/revaldinho/cpc_ram_expansion
 *
 * Copyright (C) 2018,2019,2020 Revaldinho
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 * ----------------------------------------------------------------------
 *
 * Optional definitions
 * ====================
 *
 *  PLUS = default OFF
 *
 *  - enable additional AMSTRAD PLUS compatibility to allow use of expansion RAM
 *    when using additional ASIC features
 *  - full CPC PLUS functionality is not yet tested and released
 *
 *
 * CPC6128_ONLY = default OFF
 *
 *  - removes all shadow and overdrive logic
 *  - board will then be incompatible with 464/664 machines
 *  - logic will fit in very small CPLD, or take up less space when integrating in a multi-function
 *    peripheral
 *
 * EXT_RAMRD = default OFF
 *
 * - uses external gate array generated RAMRD_B rather than internally generated version
 * - saves logic on boards not implementing the shadow mode, ie still suitable for boards
 *   targetting 6128/Plus or DK'Tronics mode operation for 464/664.
 * - use of the external RAMRD_B makes timing more critical for shadow mode operation on
 *   the 464/664, so this is not recommended if needing to use video mode C3 on those machines
 * - NB. EXTRAM_RD should always be set if CPC6128_ONLY define is set
 *
 * DISABLE_RESET_RESYNC = default OFF
 *
 * - disables the two stage reset release synchroniser
 * - this is purely to save logic in small CPLDs
 * - very small risk that start up won't be clean once in a while (almost never in fact)
 *
 * FULL_SHADOW_ONLY - default OFF
 *
 * - enables full shadow mode operation whenever shadow mode is selected.
 * - simplifies and reduces shadow mode logic slightly
 * - mainly of benefit in trying to fit in small CPLDs but still support CPC464/664 mode
 *   C3 operation
 * - little disadvantage here since full and partial shadow schemes behave identically
 *   to the end user - full shadow has the slight advantage of 'repairing' some internal
 *   RAM faults
 *
 * FIT_XC9536 - default ON
 *
 * - selects combination of the above to fit the design in a Xilinx XC9536 CPLD
 *
 */


`define PLUS 1
//`define REDUCED_COMPARE 1

// //`define CPC6128_ONLY 1
// //`define EXT_RAMRD 1
// //`define DISABLE_RESET_RESYNC 1
// //`define FULL_SHADOW_ONLY     1
//
// //`define FIT_XC9536 1
//
// `ifdef CPC6128_ONLY
//   `define EXT_RAMRD 1
// `endif
//
//  `ifdef FIT_XC9536
//   // Disable resynchronisation of reset
//   `define DISABLE_RESET_RESYNC 1
//   `define FULL_SHADOW_ONLY     1
// `endif



module cpld_ram1m_plcc84(
                         input        rfsh_b,
                         inout        adr15,
                         inout        adr15_aux,

                         input [14:0] adr,
                         input        ioreq_b,
                         input        mreq_b,
                         input        reset_b,
                         input        busreset_b,
                         input        busack_b,
                         inout        wr_b,
                         inout        rd_b,
                         input        m1_b,
                         input [7:0]  data,
                         input        clk,
                         input [3:0]  dip,
                         input        ramrd_b,
                         input        romen_b,

                         inout        ramdis,
                         inout        int_b,
                         inout        nmi_b,
                         inout        ready,
                         inout [7:0]  gpio,
                         inout        romdis,
                         output [4:0]  ramadrhi, 

                         inout [4:0]  tp,
                         output       ramcs0_b,
                         output       ramcs1_b,
                         output       busreq_b,
                         output       ramoe_b,
                         output       ramwe_b
);

  parameter   shadow_bank= 4'b0111;  // Shadow bank always high bank in 7FFE RAM (SRAM0)

  reg [6:0]        ramblock_q;
  reg [5:0]        ramadrhi_r;
  wire             cardsel_w;
  wire             adr15_mx_w;
  reg              mode3_overdrive_q;
  reg              mwr_cyc_q;
  reg              mwr_cyc_f_q;
  reg              ramcs_b_r;
  reg              adr15_q;
  reg              exp_ram_r;
`ifndef DISABLE_RESET_RESYNC
  reg              reset_b_q;
  reg              reset1_b_q;
`endif
  reg              exp_ram_q;
  reg 	           urom_disable_q;
  reg 	           lrom_disable_q;
`ifndef EXT_RAMRD
  reg              int_ramrd_b_r ;    // compute local ramrd signal rather than wait on one from ULA
  wire             ramrd_b_w = int_ramrd_b_r;
`else
  wire             ramrd_b_w = ramrd_b;
`endif
  wire             ram_ctrl_select_w;
  wire             rom_ctrl_select_w;
  wire             full_shadow;
  wire             overdrive_mode;
  wire             mwr_cyc_d;
  wire             adr15_overdrive_w;
  wire             ram64kb_mode;
  wire             ram1mb_mode;
  wire             reset_b_w;

`ifdef PLUS
  wire             plus_unlock_w;
  wire             rmr2_ctrl_select_w;
  reg              plus_map_enable_q;

  asic_lock al_0(
                 .clk(clk),
                 .reset_b(reset_b_w),
                 .ioreq_b(ioreq_b),
                 .wr_b(wr_b),
                 .data(data),
                 .io_cs( ({ adr15, adr[14:8]} == 8'hBC) ), // High when relevant IO address is decoded [ &BCxx]
                 .enf(plus_unlock_w)
                 );
`endif


  /*
   * DIP Switch Settings
   * ===================
   *
   * NB DIPs are numbered 1-4 on the physical component and in the table  here, but 0..3 in Verilog
   *
   * ---------+-----------------------------------------
   * DIP1 DIP2|  Mode selection
   * ---------+-----------------------------------------
   *  OFF  OFF|  6128 Mode
   *  OFF   ON|  DK'Tronics Mode
   *   ON  OFF|  Shadow mode  (Full shadow on XC9536/Partial Shadow on XC9572)
   *   ON   ON|  Full shadow mode if enabled/Shadow mode if not
   * ---------+-----------------------------------------
   * DIP3 DIP4|  RAM size selection
   * ---------+-----------------------------------------
   *  OFF OFF |  Card Disabled
   * ---------+-----------------------------------------
   *  OFF  ON |  64K mode (Max 6128 compatibility)
   *   ON OFF |  512K Mode
   *   ON  ON |  1MB mode
   * ---------+-----------------------------------------
   */

`ifdef CPC6128_ONLY
  assign overdrive_mode = 1'b0;
  assign full_shadow = 1'b0;
  assign shadow_mode = 1'b0;
`else
  `ifdef FULL_SHADOW_ONLY
  assign full_shadow   = dip[0];
  `else
  assign full_shadow   = dip[1] & dip[0];
  `endif
  assign shadow_mode   = dip[0] ;
  assign overdrive_mode= dip[0] | dip[1];
`endif

  assign ram64kb_mode  = !dip[2] & dip[3];
  assign ram1mb_mode   = dip[2] & dip[3];
  assign cardsel_w     = dip[2] | dip[3];

  // Dont drive address outputs during reset due to overlay of DIP switches
  assign ramadrhi =  ( !reset_b_w ) ? 5'bzzzzz : ramadrhi_r[4:0];

`ifdef PLUS
  assign ram_ctrl_select_w = (!ioreq_b & !wr_b & !adr15 & data[6] & data[7]  );
  assign rom_ctrl_select_w = (!ioreq_b & !wr_b & !adr15 & !data[6] & data[7] & !data[5] );
  assign rmr2_ctrl_select_w = (!ioreq_b & !wr_b & !adr15 & !data[6] & data[7] & data[5] & plus_unlock_w );
`else
  assign ram_ctrl_select_w = (!ioreq_b & !wr_b & !adr15 & data[6] & data[7] );
  assign rom_ctrl_select_w = (!ioreq_b & !wr_b & !adr15 & !data[6] & data[7] & !data[5]);
`endif

`ifdef DISABLE_RESET_RESYNC
  assign reset_b_w = busreset_b;
`else
  assign reset_b_w = reset1_b_q & busreset_b & reset_b_q;
`endif

`ifndef EXT_RAMRD
  // NB mode 3 DK'T 0x4000 -> remapped to 0xC000, so allow for this when
  // creating our internal version of ramrd_b_r
  always @ ( * ) begin
    int_ramrd_b_r = 1'b1 ; 	 // default disable RAM accesses
    if ( rfsh_b & !mreq_b & !rd_b)
      if ( adr15_mx_w != adr[14] )
        int_ramrd_b_r = 1'b0; // RAM in range 0x4000 - 0xBFFF never overlapped by ROM
                            // and this is true even if we overdrive adr15.
      else if ( urom_disable_q & ( {adr15_q,adr[14]} == 2'b11 ))
        int_ramrd_b_r = 1'b0; // RAM read in 0xC000 - 0xFFFF only if UROM disabled
      else if ( lrom_disable_q & ( {adr15_q,adr[14]} == 2'b00 ))
        int_ramrd_b_r = 1'b0; // RAM read in 0x0000 - 0x3FFF only if LROM disabled
  end
`endif //  `ifndef EXT_RAMRD

  // Remember that wr_b is overdrive for first high phase of clock for M4 compatibility so don't write ;
  assign ramwe_b = ! ( !wr_b & mwr_cyc_q & mwr_cyc_f_q );
  assign ramoe_b = ramrd_b_w ;

  /* Memory Data Access
   *          ____      ____      ____      ____      ____
   * CLK     /    \____/    \____/    \____/    \____/    \_
   *         _____     :    .    :    .    :    .   ________
   * MREQ*        \________________________________/ :    .
   *         _______________________________________________
   * RFSH*   1         :    .    :    .    :    .    :    .
   *         _________________   :    .    :    .  _________
   * WR*               :    . \___________________/  :    .
   *         _____________       ___________________________
   * READY             :  \_____/
   *                   :    .    :    .    :    .    :    .
   *                   :_____________________________:    .
   * MWR_CYC    _______/    .    :    .    :    .    \______  FF'd Version
   * State    _IDLE____X___T1____X____T1___X___T2____X_END__
   */

  // M4 Compatibility: overdrive wr_b for the first high phase of CLK
  // of an expansion RAM write to fool the M4 card
  assign wr_b = ( overdrive_mode & exp_ram_q & (mwr_cyc_q & !mwr_cyc_f_q)) ? 1'b0 : 1'bz;
  assign rd_b = ( overdrive_mode & exp_ram_q & (mwr_cyc_q|mwr_cyc_f_q)) ? 1'b0 : 1'bz ;

  // Overdrive A15 for writes only in shadow modes (full and partial) but for all
  // access types otherwise. Need to compute whether A15 will need to be driven
  // before the first rising edge of the MREQ cycle for the gate array to act on
  // it. Cant wait to sample mwr_cyc_q after it has been set initially.
  assign mwr_cyc_d = !mreq_b & rd_b & rfsh_b;
  assign adr15_overdrive_w = mode3_overdrive_q & adr[14] & !adr15_mx_w & ((shadow_mode) ? (mwr_cyc_q|mwr_cyc_d): !mreq_b) ;
  assign { adr15, adr15_aux} = (adr15_overdrive_w ) ? 2'b11 : 2'bzz;
  assign adr15_mx_w = (mreq_b) ? adr15: adr15_q;

  // Never, ever use internal RAM for reads in full shadow mode
  assign ramdis = (cardsel_w & (full_shadow | !ramcs_b_r)) ? 1'b1 : 1'bz;

  // Alternative
  // - drive ramdis and romdis
  // - always overdrive ADR15 in mode3 allowing gate array to  initiate ROM or RAM access
  // - block both and generate a RAM access internally
  // - full shadow mode not addressed here
  //
  // assign adr15_overdrive_w = mode3_overdrive_q & adr14 & !adr15_q & !mreq_b ;
  // assign ramromdis = (cardsel_w & !ramcs_b_r & int_ramrd_r) ? 1'b1 : 1'bz;

  // Low RAM is enabled for all (base memory) shadow writes and when selected by 0x7Exx
`ifdef FULL_SHADOW_ONLY
  assign ramcs0_b =  !cardsel_w | !((!ramadrhi_r[5] & exp_ram_r) | (full_shadow & !exp_ram_r)) | mreq_b | !rfsh_b;
`else
  assign ramcs0_b =  !cardsel_w | !((!ramadrhi_r[5] & exp_ram_r) | (full_shadow & !exp_ram_r) | (shadow_mode & !exp_ram_r & !ramcs_b_r)) | mreq_b | !rfsh_b;
`endif
  // High RAM is enabled only for expansion RAM accesses to 0x7Fxx
  assign ramcs1_b = (!cardsel_w) | !(ramadrhi_r[5] & exp_ram_r) | mreq_b | !rfsh_b ;

  always @ (posedge clk)
    if ( mwr_cyc_d )
      mwr_cyc_q <= 1'b1;
    else if (mreq_b)
      mwr_cyc_q <= 1'b0;

  always @ (negedge mreq_b)
    adr15_q <= adr15;

  always @ (negedge clk or negedge reset_b_w)
    if ( !reset_b_w ) begin
      mwr_cyc_f_q <= 1'b0;
    end
    else begin
      mwr_cyc_f_q <= mwr_cyc_q;
    end

  always @ (posedge clk or negedge reset_b_w)
     if ( !reset_b_w ) begin
      exp_ram_q = 1'b0;
    end
    else begin
      exp_ram_q = exp_ram_r;
    end

`ifndef DISABLE_RESET_RESYNC
   always @ (posedge clk or negedge busreset_b)
     if ( !busreset_b )
       {reset1_b_q, reset_b_q}  = 2'b00;
     else
       {reset1_b_q, reset_b_q}  = {reset_b_q, busreset_b};
`endif

  // Pre-decode mode 3 setting and <noodle shadow bank alias if required to save decode
  // time after the Q
  always @ (negedge clk or negedge reset_b_w)
    if (!reset_b_w) begin
      ramblock_q <= 7'b0;
      mode3_overdrive_q <= 1'b0;
    end
    else begin
       if ( ram_ctrl_select_w ) begin
         if (ram64kb_mode)
           // 64KB mode, selects always bank 0 in upper RAM (and doesn't clash with shadow bank)
           ramblock_q <= {4'b1000, data[2:0]} ;
         else if (ram1mb_mode)
           // 1MB mode uses given bank in upper (0x7FFF) or lower (0x7FFE) RAM, but if bank selected is lower 0b111
           // (which is used for shadow RAM) then must alias that to the next lower bank 0b110
           if ( shadow_mode & {adr[8],data[5:3]}==shadow_bank )
             ramblock_q <= {adr[8],data[5:4], 1'b0, data[2:0]};
           else
             ramblock_q <= {adr[8],data[5:0]};
         else
           // 512KB mode selects always upper RAM (and doesn't clash with shadow bank)
           ramblock_q <= {1'b1,data[5:0]};
         mode3_overdrive_q <= overdrive_mode & (data[2:0] == 3'b011);
       end
    end

`ifndef EXT_RAMRD
  always @ (negedge clk or negedge reset_b_w)
    if (!reset_b_w)
      { urom_disable_q, lrom_disable_q}  <= 2'b00;
    else if ( rom_ctrl_select_w )
      { urom_disable_q, lrom_disable_q } <= data[3:2];
`endif

`ifdef PLUS
  always @ (negedge clk or negedge reset_b_w)
    if (!reset_b_w)
      plus_map_enable_q  <= 1'b0;
    else if (rmr2_ctrl_select_w & data[4] & data[3])
      plus_map_enable_q  <= 1'b1;
`endif

  always @ ( * ) begin
`ifdef PLUS
    // If PLUS map is enabled then disable expansion RAM accesses to area 0x4000-0x7FFF
    if ( plus_map_enable_q & !adr15 & adr[14] ) begin
      {exp_ram_r, ramcs_b_r, ramadrhi_r} = { 1'b0, 1'b1, 6'bxxxxxx };
    end
    else
`endif
    if ( shadow_mode )
      // FULL SHADOW MODE    - all CPU read accesses come from external memory (ramcs_b_r computed here is ignored)
      // PARTIAL SHADOW MODE - all CPU write accesses go to shadow memory but only shadow block 3 is ever read in mode C3 at bank 0x4000 (remapped to 0xC000)
      case (ramblock_q[2:0])
 	3'b000: {exp_ram_r, ramcs_b_r, ramadrhi_r} = { 1'b0, !mwr_cyc_q , shadow_bank, adr15,adr[14] };
 	3'b001: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr[14]}==2'b11 ) ? {2'b10, ramblock_q[6:3],2'b11} : { 1'b0, !mwr_cyc_q , shadow_bank, adr15,adr[14] };
 	3'b010: {exp_ram_r, ramcs_b_r, ramadrhi_r} = { 2'b10, ramblock_q[5:3], adr15,adr[14]} ;
 	3'b011: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15_mx_w,adr[14]}==2'b11 ) ? {2'b10,ramblock_q[6:3],2'b11} : ({adr15_mx_w,adr[14]}==2'b01) ? {2'b00,shadow_bank,2'b11} : { 1'b0, !mwr_cyc_q , shadow_bank, adr15,adr[14] };
 	3'b100: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr[14]}==2'b01 ) ? {2'b10,ramblock_q[6:3],2'b00} : { 1'b0, !mwr_cyc_q , shadow_bank, adr15, adr[14] };
 	3'b101: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr[14]}==2'b01 ) ? {2'b10,ramblock_q[6:3],2'b01} : { 1'b0, !mwr_cyc_q , shadow_bank, adr15, adr[14] };
 	3'b110: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr[14]}==2'b01 ) ? {2'b10,ramblock_q[6:3],2'b10} : { 1'b0, !mwr_cyc_q , shadow_bank, adr15, adr[14] };
 	3'b111: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr[14]}==2'b01 ) ? {2'b10,ramblock_q[6:3],2'b11} : { 1'b0, !mwr_cyc_q , shadow_bank, adr15, adr[14] };
      endcase
    else
      // 6128 mode. In 464 mode (ie overdrive ON but no shadow memory) means that C3 is not fully supported for FutureOS etc, but other modes are ok
      case (ramblock_q[2:0])
 	3'b000: {exp_ram_r, ramcs_b_r, ramadrhi_r} = { 2'b01, 6'bxxxxx };
 	3'b001: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr[14]}==2'b11 ) ? {2'b10,ramblock_q[6:3],2'b11} : {2'b01, 6'bxxxxx};
 	3'b010: {exp_ram_r, ramcs_b_r, ramadrhi_r} = { 2'b10,ramblock_q[6:3],adr15,adr[14]} ;
 	3'b011: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15_mx_w,adr[14]}==2'b11 ) ? {2'b10,ramblock_q[6:3],2'b11} : {2'b01, 6'bxxxxx };
 	3'b100: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr[14]}==2'b01 ) ? {2'b10,ramblock_q[6:3],2'b00} : {2'b01, 6'bxxxxx };
 	3'b101: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr[14]}==2'b01 ) ? {2'b10,ramblock_q[6:3],2'b01} : {2'b01, 6'bxxxxx };
 	3'b110: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr[14]}==2'b01 ) ? {2'b10,ramblock_q[6:3],2'b10} : {2'b01, 6'bxxxxx };
 	3'b111: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr[14]}==2'b01 ) ? {2'b10,ramblock_q[6:3],2'b11} : {2'b01, 6'bxxxxx };
      endcase
  end

endmodule
