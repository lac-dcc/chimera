// This program was cloned from: https://github.com/revaldinho/cpc_ram_expansion
// License: GNU General Public License v3.0



/*
 * This code is part of the cpc_ram_expansion set of Amstrad CPC peripherals.
 * https://github.com/revaldinho/cpc_ram_expansion
 *
 * Copyright (C) 2018,2019 Revaldinho
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
 */
/* cpld_ram512K_v110
 *
 * ==============================================================================
 * Only to be used with v1.10 CPLD board
 * ==============================================================================
 *
 * CPLD module to implement all logic for an Amstrad CPC 512K RAM extension card
 *
 * (c) 2018, Revaldinho
 *
 * DK'Tronics Operation
 * --------------------
 *
 * Select RAM bank scheme by writing to 0x7FXX with 0b11cccbbb, where:
 *
 * ccc - picks one of 8 possible 64K banks
 * bbb - selects a block switching scheme within the chosen bank
 *       the actual block used for a RAM access is then selected by the top 2 addr bits for that access.
 *
 * 128K RAM Expansion Mapping Example...
 *
 * In the table below '-' indicates use of CPC internal RAM rather than the RAM expansion
 * -------------------------------------------------------------------------------------------------------------------------------
 * Address\cccbbb 000000 000001 000010 000011 000100 000101 000110 000011 001000 001001 001010 001011 001100 001101 001110 001111
 * -------------------------------------------------------------------------------------------------------------------------------
 * 1100-1111       -       3      3      3      -      -      -      -      -      7       7      7     -      -      -      -
 * 1000-1011       -       -      2      -      -      -      -      -      -      -       6      -     -      -      -      -
 * 0100-0111       -       -      1      **     0      1       2      3     -      -       5      -     4      5      6      7
 * 0000-0011       -       -      0      -      -      -      -      -      -      -       4      -     -      -      -      -
 * -------------------------------------------------------------------------------------------------------------------------------
 *
 * Notes
 * - ChaseHQ does not run when FutureOS ROMs are enabled. Issues CHASEHQ4.RAM not found message
 * - Extensions to the DK'Tronics/Amstrad standard allow mapping of an additional 512K block of RAM to IO port &FExx.
 *
 * Crib
 * 1. Keeping a net in synthesis
 * //synthesis attribute keep of input_a_reg is "true"
 * BUF mybuf (.I(input_a_reg),.O(comb));
 *
 */

// Enable this option to drive A15 with two pins
`define USE_A15_AUX 1
//`define USE_RDB_AUX 1
`define M4_COMPATIBILITY  1
// Assume that MREQ is latched HIGH on a rising clock edge before a write to RAM
`ifdef M4_COMPATIBILITY
  `define OVERDRIVE_WR_B   1
`endif

// Disable reading of DIP switches 2 and 3 to save macrocells and fit a XC9536 if necessary
`define DISABLE_DIP23 1

module cpld_ram512k_v110(
  input        rfsh_b,
  inout        adr15,
`ifdef USE_A15_AUX
  inout        adr15_aux,
`else
  input        adr15_aux,
`endif
  input        adr14,
  input        adr8,
  input        iorq_b,
  input        mreq_b,
  input        reset_b,
`ifdef  OVERDRIVE_WR_B
  inout        wr_b,
`else
  input        wr_b,
`endif
  inout        rd_b,
`ifdef USE_RDB_AUX
  inout        rd_b_aux,
`else
  input        rd_b_aux,
`endif
  input [7:0]  data,
  input        ready,
  input        clk,
  input        m1_b,
  input [1:0]  dip,
  input        ramrd_b,
  inout        ramdis,
  output       ramcs_b,
`ifdef DISABLE_DIP23
  output [4:0] ramadrhi,
`else
  inout [4:0]  ramadrhi, // bits 4,3 also connected to DIP switches 2,1 resp and read on startup
`endif
  output       ramoe_b,
  output       ramwe_b
);

  reg [5:0]        ramblock_q;
  reg [4:0]        ramadrhi_r;
`ifndef DISABLE_DIP23
  reg              dip3_lat_q;
  reg              dip2_lat_q;
`endif
  reg              cardsel_q;
  reg              mode3_q;
  reg              mwr_cyc_q;
  reg              mwr_cyc_f_q;
  reg              ramcs_b_r;
  reg              adr15_q;
  reg              exp_ram_r;
  reg              mreq_b_q;
  reg              reset_b_q;
  reg              reset1_b_q;
  reg              exp_ram_q;
  reg 	           urom_disable_q;
  reg 	           lrom_disable_q;
  reg              int_ramrd_r ;    // compute local ramrd signal rather than wait on one from ULA

  wire             ram_ctrl_select_w;
  wire             rom_ctrl_select_w;
  wire [2:0]       shadow_bank;
  wire             full_shadow;
  wire             overdrive_mode;
  wire             mwr_cyc_d;
  wire             adr15_overdrive_w;
  wire             low512kb_mode;
  wire             reset_b_w;


  /*
   * DIP Switch Settings
   * ===================
   *
   * Config.|DIP |464/Z80  |    |            |Compatibility|RAM|C3  |
   *        |1234|overdrive|Port| Shadow/Bank|X-MEM |Y-MEM |Exp|Mode|Application
   *--------|----|---------|----|------------|------|------|---|----|---------------------------------
   *   0    |0000| OFF     |7Fxx| none/x     | No   | YES  |512|AMS |6128
   *   1    |0001| OFF     |7Fxx| none/x     | No   | YES  |512|AMS |6128
   *   2    |0010| OFF     |7Exx| none/x     | YES  | No   |512|AMS |6128
   *   3    |0011| OFF     |7Exx| none/x     | YES  | No   |512|AMS |6128
   *--------|----|---------|----|------------|------|------|---|----|---------------------------------
   *   4    |0100| ON      |7Fxx| none/x     | No   | YES  |512|DK'T|464 DK'Tronics compatible
   *   5    |0101| ON      |7Fxx| none/x     | No   | YES  |512|DK'T|464 DK'Tronics compatible
   *   6    |0110| ON      |7Exx| none/x     | YES  | No   |512|DK'T|464 DK'Tronics compatible
   *   7    |0111| ON      |7Exx| none/x     | YES  | No   |512|DK'T|464 DK'Tronics compatible
   *--------|----|---------|----|------------|------|------|---|----|---------------------------------
   *   8    |1000| ON      |7Fxx| partial/lo | No   | No   |448|AMS |464 full 6128 compatible  w/ SiDisk
   *   9    |1001| ON      |7Fxx| partial/hi | No   | No   |448|AMS |464 full 6128 compatible
   *  10    |1010| ON      |7Exx| partial/lo | No   | No   |448|AMS |464 full 6128 compatible  w/ SiDisk
   *  11    |1011| ON      |7Exx| partial/hi | No   | No   |448|AMS |464 full 6128 compatible
   *  12    |1100| ON      |7Fxx| full/   lo | No   | No   |448|AMS |464 full 6128 compatible  w/ faulty base RAM w/ SiDisk
   *  13    |1101| ON      |7Fxx| full/   hi | No   | No   |448|AMS |464 full 6128 compatible
   *  14    |1110| ON      |7Exx| full/   lo | No   | No   |448|AMS |464 full 6128 compatible  w/ faulty base RAM w/SiDisk
   *  15    |1111| ON      |7Exx| full/   hi | No   | No   |448|AMS |464 full 6128 compatible
   *--------+----+---------+----+------------+------+------+---+----+---------------------------------
   *
   * Notes
   * DIP switches in table numbered as on physical component. Verilog bus starts at 0 rather than 1.
   *
   * Compatibility indicates that card can be used with X-MEM or Y-MEM as appropriate in a particular
   * configuration
   *
   * It's not possible to mix a Rev. card in shadow mode with a X/Y-MEM card or another RAM card
   *
   * NB  Latching DIP3 and DIP4 switches requires the CPC to be powered down/up rather than just a ctrl-shift-esc reset
   */

  assign overdrive_mode= dip[0] | dip[1];
  assign shadow_mode   = dip[0];
  assign full_shadow   = dip[0]&dip[1];
`ifdef DISABLE_DIP23
  assign shadow_bank   = {3'b011}; // pick lower bank because DK'Tronics SiDisc doesn't do a good job of detecting RAM
  assign low512kb_mode = 1'b0 ;
  assign ramadrhi      = ramadrhi_r[4:0];
`else
  assign shadow_bank   = {dip3_lat_q,2'b11};
  assign low512kb_mode = dip2_lat_q ;
  // Dont drive address outputs during reset due to overlay of DIP switches
  assign ramadrhi =  ( !reset_b_w ) ? 5'bzzzzz : ramadrhi_r[4:0];
`endif

  assign ram_ctrl_select_w = (!iorq_b && !wr_b && !adr15 && data[6] && data[7] );
  assign rom_ctrl_select_w = (!iorq_b && !wr_b && !adr15 && !data[6] && data[7] );
  assign reset_b_w = reset1_b_q & reset_b & reset_b_q;

  // NB mode 3 DK'T  0x4000 -> remapped to 0xC000, will overlap ROM - so check adr15 and overdrive state
  always @ ( * ) begin
    int_ramrd_r = 1'b0 ; 	 // default disable RAM accesses
    if ( rfsh_b & !mreq_b )
      if ( (adr15_q|adr15_overdrive_w) != adr14 )
        int_ramrd_r = 1'b1; // RAM in range 0x4000 - 0xBFFF never overlapped by ROM
      else if ( urom_disable_q & ( {(adr15_q|adr15_overdrive_w),adr14} == 2'b11 ))
        int_ramrd_r = 1'b1; // RAM read in 0xC000 - 0xFFFF only if UROM disabled
      else if ( lrom_disable_q & ( {(adr15_q|adr15_overdrive_w),adr14} == 2'b00 ))
        int_ramrd_r = 1'b1; // RAM read in 0x0000 - 0x3FFF only if LROM disabled
  end

  // Remember that wr_b is overdrive for first high phase of clock for M4 compatibility so don't write ;
  assign ramwe_b = ! ( !wr_b & mwr_cyc_q & mwr_cyc_f_q );
  assign ramoe_b = (!int_ramrd_r) | rd_b ;
//  assign ramoe_b = ramrd_b ;

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

`ifdef OVERDRIVE_WR_B
  // overdrive wr_b for the first high phase of CLK of an expansion RAM write to fool the M4 card
  assign wr_b = ( overdrive_mode & exp_ram_q & (mwr_cyc_q & !mwr_cyc_f_q)) ? 1'b0 : 1'bz;
`endif

`ifdef USE_RDB_AUX
  assign {rd_b, rd_b_aux} = ( overdrive_mode & exp_ram_q & (mwr_cyc_q|mwr_cyc_f_q)) ? 2'b00 : 2'bzz ;
`else
  assign rd_b = ( overdrive_mode & exp_ram_q & (mwr_cyc_q|mwr_cyc_f_q)) ? 1'b0 : 1'bz ;
`endif

  // Overdrive A15 for writes only in shadow modes (full and partial) but for all access types otherwise
  // Need to compute whether A15 will need to be driven before the first rising edge of the MREQ cycle for the
  // gate array to act on it. Cant wait to sample mwr_cyc_q after it has been set initially.
 assign mwr_cyc_d = !mreq_b & rd_b;
 assign adr15_overdrive_w = overdrive_mode & mode3_q & adr14 & ((shadow_mode) ? (mwr_cyc_q|mwr_cyc_d): !mreq_b) ;

`ifdef USE_A15_AUX
  assign { adr15, adr15_aux} = (adr15_overdrive_w  ) ? 2'b11 : 2'bzz;
`else
  assign adr15 = (adr15_overdrive_w  ) ? 1'b1 : 1'bz;
`endif

  // Never, ever use internal RAM for reads in full shadow mode - allow tristate if card not selected otherwise
  assign ramdis = (full_shadow) ? 1'b1 :  (((!ramcs_b_r) & cardsel_q) ? 1'b1 : 1'bz);

  // In full shadow mode SRAM is always enabled for all real memory accesses but dont clash with ROM access (ramrd_b will control oe_b)
  assign ramcs_b = !( ((!ramcs_b_r) & cardsel_q) | full_shadow) | mreq_b | !rfsh_b ;

  always @ (posedge clk)
    if ( mwr_cyc_d )
      mwr_cyc_q <= 1'b1;
    else if (mreq_b)
      mwr_cyc_q <= 1'b0;

  always @ (negedge clk or negedge reset_b_w)
    if ( !reset_b_w )
      mwr_cyc_f_q <= 1'b0;
    else
      mwr_cyc_f_q <= mwr_cyc_q;

  always @ (posedge clk or negedge reset_b_w)
     if ( !reset_b_w ) begin
      mreq_b_q = 1'b1;
      exp_ram_q = 1'b0;
    end
    else begin
      mreq_b_q = mreq_b;
       exp_ram_q = exp_ram_r;
    end

   always @ (posedge clk or negedge reset_b)
     if ( !reset_b )
       {reset1_b_q, reset_b_q}  = 2'b00;
     else
       {reset1_b_q, reset_b_q}  = {reset_b_q, reset_b};

  always @ (negedge clk or negedge reset_b_w )
    if ( !reset_b_w )
      adr15_q <= 1'b0;
    else
      adr15_q <= (mreq_b) ? adr15 : adr15_q;

`ifndef DISABLE_DIP23
  // Latch DIP switch settings on first stage of reset - need a CPC power down/up.
  always @ ( posedge clk or negedge reset_b)
    if ( !reset_b  ) begin
      dip2_lat_q <= ramadrhi[3];
      dip3_lat_q <= ramadrhi[4];
    end
`endif

  // Pre-decode mode 3 setting and noodle shadow bank alias if required to save decode
  // time after the Q
  always @ (negedge clk or negedge reset_b_w)
    if (!reset_b_w) begin
      ramblock_q <= 6'b0;
      mode3_q <= 1'b0;
      cardsel_q <= 1'b0;
      urom_disable_q <= 1'b0;
      lrom_disable_q <= 1'b0;
    end
    else begin
       if ( ram_ctrl_select_w ) begin
          if ( shadow_mode && (data[5:3]==shadow_bank) )
            ramblock_q <= {data[5:4],1'b0, data[2:0]};
          else
            ramblock_q <= data[5:0] ;
          // Use IO Port 7Fxx or 7Exx depending on low512kb_mode
          cardsel_q <= (low512kb_mode) ? !adr8 : adr8;
          mode3_q <= (data[2:0] == 3'b011);
       end
       else if ( rom_ctrl_select_w ) begin
          { urom_disable_q, lrom_disable_q } <= data[3:2];
       end
    end

  always @ ( * ) begin
    if ( shadow_mode )
      // FULL SHADOW MODE    - all CPU read accesses come from external memory (ramcs_b_r computed here is ignored)
      // PARTIAL SHADOW MODE - all CPU write accesses go to shadow memory but only shadow block 3 is ever read in mode C3 at bank 0x4000 (remapped to 0xC000)
      case (ramblock_q[2:0])
 	3'b000: {exp_ram_r, ramcs_b_r, ramadrhi_r} = { 1'b0, !mwr_cyc_q , shadow_bank, adr15,adr14 };
 	3'b001: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b11 ) ? {2'b10, ramblock_q[5:3],2'b11} : { 1'b0, !mwr_cyc_q , shadow_bank, adr15,adr14 };
 	3'b010: {exp_ram_r, ramcs_b_r, ramadrhi_r} = { 2'b10, ramblock_q[5:3], adr15,adr14} ;
 	3'b011: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14}==2'b11 ) ? {2'b10,ramblock_q[5:3],2'b11} : ({adr15_q,adr14}==2'b01) ? {2'b00,shadow_bank,2'b11} : { 1'b0, !mwr_cyc_q , shadow_bank, adr15,adr14 };
 	3'b100: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b01 ) ? {2'b10,ramblock_q[5:3],2'b00} : { 1'b0, !mwr_cyc_q , shadow_bank, adr15, adr14 };
 	3'b101: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b01 ) ? {2'b10,ramblock_q[5:3],2'b01} : { 1'b0, !mwr_cyc_q , shadow_bank, adr15, adr14 };
 	3'b110: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b01 ) ? {2'b10,ramblock_q[5:3],2'b10} : { 1'b0, !mwr_cyc_q , shadow_bank, adr15, adr14 };
 	3'b111: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b01 ) ? {2'b10,ramblock_q[5:3],2'b11} : { 1'b0, !mwr_cyc_q , shadow_bank, adr15, adr14 };
      endcase
    else
      // 6128 mode. In 464 mode (ie overdrive ON but no shadow memory) means that C3 is not fully supported for FutureOS etc, but other modes are ok
      case (ramblock_q[2:0])
 	3'b000: {exp_ram_r, ramcs_b_r, ramadrhi_r} = { 2'b01, 5'bxxxxx };
 	3'b001: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b11 ) ? {2'b10,ramblock_q[5:3],2'b11} : {2'b01, 5'bxxxxx};
 	3'b010: {exp_ram_r, ramcs_b_r, ramadrhi_r} = { 2'b10,ramblock_q[5:3],adr15,adr14} ;
 	3'b011: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14}==2'b11 ) ? {2'b10,ramblock_q[5:3],2'b11} : {2'b01, 5'bxxxxx };
 	3'b100: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b01 ) ? {2'b10,ramblock_q[5:3],2'b00} : {2'b01, 5'bxxxxx };
 	3'b101: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b01 ) ? {2'b10,ramblock_q[5:3],2'b01} : {2'b01, 5'bxxxxx };
 	3'b110: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b01 ) ? {2'b10,ramblock_q[5:3],2'b10} : {2'b01, 5'bxxxxx };
 	3'b111: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b01 ) ? {2'b10,ramblock_q[5:3],2'b11} : {2'b01, 5'bxxxxx };
      endcase
  end

endmodule
