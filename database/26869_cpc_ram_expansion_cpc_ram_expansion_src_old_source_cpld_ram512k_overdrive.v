// This program was cloned from: https://github.com/revaldinho/cpc_ram_expansion
// License: GNU General Public License v3.0

/*
 * This code is part of the cpc_ram_expansion set of Amstrad CPC peripherals.
 * https://github.com/revaldinho/cpc_ram_expansion
 * 
 * Copyright (C) 2018 Revaldinho
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
/* cpld_ram512K
 *
 * ==============================================================================
 * THIS CODE IS NOT SUITABLE FOR RUNNING IN A V1.00 CPLD BOARD WITHOUT MANUAL 
 * MODIFICATIONS TO HOOK UP ADDITIONAL CPC SIGNALS AND BREAK EXISTING CONNECTIONS
 * ==============================================================================
 * 
 * CPLD module to implement all logic for an Amstrad CPC 512K RAM extension card
 *
 * (c) 2018, Revaldinho
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
 * 0100-0111       -       -      1      -      0      1       2      3     -      -       5      -     4      5      6      7
 * 0000-0011       -       -      0      -      -      -      -      -      -      -       4      -     -      -      -      -
 * -------------------------------------------------------------------------------------------------------------------------------
 *
 * 
 * Check-in Status table - 464 Mode
 * ================================
 * 
 * 464 Serial Number    : 
 * Overdrive Mode       : ON/RD_B + ADR15
 * Shadow Mode          : ON/Partial
 * Write cycle control  : State Machine
 * A15_Q                : Flopped (not latched)
 * 
 *                     |Result| Notes                                                 
 * --------------------+------+-------------------------------------------------------+
 * Tests/Voltage       |5.00V |                                                       |
 * --------------------+------+-------------------------------------------------------+
 * Test Programs       |      |                                                       |
 *  o test.bin         | PASS |                                                       |
 *  o ramtest.bin      | PASS |                                                       |
 * Apps                |      |                                                       |
 *  o CP/M+ TurboPascal| PASS |                                                       |
 *  o CP/M+ BBC BASIC  | FAIL | "Cannot load program" disk loading error              |
 *  o CP/M+ WordStar   | PASS |                                                       |
 *  o FutureOS Desktop | PASS | Desktop in mono, but fully operational                |
 *  o Amstrad Bankman  | NA   |                                                       |
 *  o DK'T Bankman     | PASS |                                                       |
 *  o DK'T SiDisc      | PASS |                                                       |
 * Demos               |      |                                                       |
 *  o Phortem          | PASS |                                                       |
 *  o Batman           | NA   | Unsupported CRTC - not a RAM board issue              |
 * Other               |      |                                                       |
 *  o Chase HQ         | PASS | 128K Version with digitized speech                    |
 *  o ZapTBalls        | PASS |                                                       |
 *  o Double Dragon    | PASS | Loading graphics corrupt but game runs fine           |
 *  o P47              | FAIL | Loads and start ok but game screen corrupt - unusable |
 *  o HardDrivin'      | PASS |                                                       |
 *  o Prehistorik 2    | PASS |                                                       |
 *  o RoboCop          |      | 128K version with digitized speech                    |
 *  o Gryzor           |      |                                                       |
 *  o R-Type           |      | Loads and start ok but game screen corrupt - unusable |
 * --------------------+------+-------------------------------------------------------+
 * 
 */


// Conditional compilation options
`define OVERDRIVE            1 // Disable writing to base RAM when accessing expansion, remap writes in mode C3. This is the 464 mode.
`define SHADOW_MODE 1          // Need to define this to get full C3 mode operation on a 464. Will be a DIP switch on a revised board
//`define FULL_SHADOW_MODE   1 // Always prefer shadow RAM for reads to base RAM, all blocks. Otherwise a partial shadow scheme is used.
`define STATE_MACHINE        1 // Use state machine to compute end of write cycle rather than sensing via mreq/m1/rfsh etc.

`ifdef FULL_SHADOW_MODE
    `define SHADOW_MODE 1
`endif    
      
module cpld_ram512k_overdrive(rfsh_b,adr15,adr14,iorq_b,mreq_b,ramrd_b,reset_b,wr_b,rd_b,data,ramdis,ramcs_b,ramadrhi,ready, clk, ramoe_b, ramwe_b);
  input            rfsh_b;
  inout            adr15;    
  input            adr14;
  input            iorq_b;
  input            mreq_b;
  input            ramrd_b;
  input            reset_b;
  input            wr_b;
  inout            rd_b;    
  input [7:0]      data;
  input            ready;
  input            clk;

  output           ramdis;
  output           ramcs_b;
  output [4:0]     ramadrhi;
  output           ramoe_b;
  output           ramwe_b;
  
  reg [5:0]        ramblock_q;
  reg [2:0]        hibit_tmp_r;  
  reg [4:0]        ramadrhi_r;
  reg [1:0]        state_q;
  reg              ready_f_q;              
  reg              ramcs_b_r;
  reg              clken_lat_qb;
  reg              adr15_q;
  reg              mreq_b_q;
  reg              mwr_cyc_q, mwr_cyc_f_q;
  reg              exp_ram_r;   
  reg              shadow_en_b_r;
  reg              adr15_overdrive_r;
  wire             mwr_cyc_w;

`ifdef OVERDRIVE  
  wire             overdrive_mode = 1'b1; // (aka  464 mode) enable only on 464/664
`else  
  wire             overdrive_mode = 1'b0; // (aka  464 mode) enable only on 464/664
`endif
  
`ifdef SHADOW_MODE  
  wire             shadow_mode = 1'b1;    // enable only on 464/664
`else  
  wire             shadow_mode = 1'b0;    // enable only on 464/664
`endif  
  wire [2:0]       shadow_bank = 3'b111; // use 3'b111 or 3'b011

  // Create negedge clock on IO write event - clock low pulse will be suppressed if not an IOWR* event
  // but if the pulse is allowed through use the trailing (rising) edge to capture data
  wire             wclk    = !(clk|clken_lat_qb); 

  assign ramadrhi = ramadrhi_r ;
  assign ramwe_b = wr_b ;
  // Combination of RAMCS and RAMRD determine whether RAM output is enabled 
  assign ramoe_b = ramrd_b | (overdrive_mode & mwr_cyc_w) ;

  //          ____      ____      ____      ____      ____  
  // CLK     /    \____/    \____/    \____/    \____/    \_
  //         _____     :    .    :    .    :    .   ________
  // MREQ*        \________________________________/ :    .
  //         _______________________________________________
  // RFSH*   1         :    .    :    .    :    .    :    .
  //         _________________   :    .    :    .  _________
  // WR*               :    . \___________________/  :    .    
  //         _____________       ___________________________
  // READY             :  \_____/      
  //                   :    .    :    .    :    .    :    .
  //                   :_____________________________:    .        
  // MWR_CYC    _______/    .    :    .    :    .    \______
  //          _________:_________:_________:_________:______
  // State    _IDLE____X___T1____X____T1___X___T2____X_END__
  // 
  // overdrive rd_b for all expansion write accesses only - need to keep overdriving beyond mreq_b rising edge
  assign rd_b  = ( overdrive_mode ) ? ( exp_ram_r & mwr_cyc_w ) ? 1'b0 : 1'bz : 1'bz;
  assign adr15 = ( adr15_overdrive_r ) ? 1'b1 : 1'bz;
 
`ifdef FULL_SHADOW_MODE  
  // Never, ever use internal RAM for reads in full shadow mode
  assign ramdis = 1'b1;
  // In full shadow mode SRAM is always enabled for all real RAM accesses
  assign ramcs_b = mreq_b | !rfsh_b;
`else // PARTIAL_SHADOW_MODE
  assign ramdis  = !ramcs_b_r  ;
  assign ramcs_b = ramcs_b_r | mreq_b | !rfsh_b ;
`endif      
  
`ifdef STATE_MACHINE    
  parameter IDLE=2'b00, T1=2'b01, T2=2'b11, END=2'b10;  
  // alternative calculation of mwr_cyc_w once a write event is triggered    
  assign mwr_cyc_w = (state_q==T1)|(state_q==T2);
  
  always @ (negedge reset_b or posedge clk)
    if ( !reset_b )
      state_q <= IDLE;
    else
      case ( state_q ) 
        IDLE: state_q <= (!mreq_b & mreq_b_q & rfsh_b & rd_b ) ? T1 : IDLE ;
        T1:   state_q <= (ready_f_q) ? T2: T1;
        T2:   state_q <= END;
        // END same as IDLE but provide option to extend RAMDIS etc over last cycle by decoding this state
        END:  state_q <= (!mreq_b & mreq_b_q & rfsh_b & rd_b ) ? T1 : IDLE ;
      endcase
  
  always @ ( negedge reset_b or negedge clk)
    if ( !reset_b )
      ready_f_q = 1'b1;
    else
      ready_f_q = ready;
`else
  mwr_cyc_w = mwr_cyc_q;

  always @ ( negedge reset_b or posedge clk )
    if ( !reset_b)
      mwr_cyc_q <= 1'b0;
    else
      if ( !mreq_b & mreq_b_q & rfsh_b & rd_b )
        mwr_cyc_q <= 1'b1;
      else if ( mreq_b | !rfsh_b ) // | !m1_b  
        mwr_cyc_q <= 1'b0;
`endif                      

  always @ ( negedge reset_b or posedge clk )
      if ( !reset_b)
          mreq_b_q <= 1'b1;                                      
      else
          mreq_b_q <= mreq_b;                                     

  always @ ( negedge reset_b or negedge clk )
    if ( !reset_b)
      mwr_cyc_f_q <= 1'b0;
    else
      mwr_cyc_f_q <= mwr_cyc_q;

   always @ (negedge reset_b or negedge mreq_b ) 
     if ( !reset_b ) 
       adr15_q <= 1'b0;
     else
       adr15_q <= adr15;
  
//  always @ (*)
//    if ( mreq_b ) 
//      adr15_q <= adr15;
  
  always @ ( * )
    if ( clk ) 
      clken_lat_qb <= !(!iorq_b && !wr_b && !adr15 && data[6] && data[7]);
  
  always @ (negedge reset_b or posedge wclk )
    if (!reset_b)
      ramblock_q <= 6'b0;
    else
      ramblock_q <= data[5:0];

  always @ (*) begin
    adr15_overdrive_r = 0;
    if (overdrive_mode)
      if ( shadow_mode )
        // Restrict overdrive of A15 to writes as read will be remapped from shadow RAM
        adr15_overdrive_r = (ramblock_q[2:0]==3'b011) & !adr15_q & adr14 & mwr_cyc_w ;
      else
        // Need to overdrive A15 for both reads and writes if shadow RAM not enabled
        adr15_overdrive_r = (ramblock_q[2:0]==3'b011) & !adr15_q & adr14 & !mreq_b ; //  ?? (!mreq_b|!ram_rd|mwr_cyc_w) ;
  end
  
  always @ ( * ) begin
    if ( shadow_mode ) begin
      hibit_tmp_r = ramblock_q[5:3] ;        
      if ( hibit_tmp_r == shadow_bank )  
        hibit_tmp_r[0] = 1'b0; // alias the even bank below shadow bank to the shadow bank      
`ifdef FULL_SHADOW_MODE
      // FULL SHADOW MODE - all read accesses come from shadow bank except for CRTC accesses to internal memory  
      case (ramblock_q[2:0])
 	3'b000: {exp_ram_r, ramcs_b_r, ramadrhi_r} = { 2'b00, shadow_bank, adr15,adr14 };
 	3'b001: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ({adr15,adr14}==2'b11) ? {2'b10, hibit_tmp_r,adr15,adr14} : { 2'b00, shadow_bank, adr15, adr14 };
 	3'b010: {exp_ram_r, ramcs_b_r, ramadrhi_r} = { 1'b1, 1'b0,hibit_tmp_r,adr15,adr14} ; 
 	3'b011: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ({adr15_q,adr14}==2'b11) ? {2'b10,hibit_tmp_r,2'b11} : { 2'b00, shadow_bank, (adr15_q|adr14), adr14 };              
 	3'b100: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ({adr15,adr14}==2'b01) ? {2'b10,hibit_tmp_r,2'b00} : { 2'b00, shadow_bank, adr15, adr14 };              
 	3'b101: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ({adr15,adr14}==2'b01) ? {2'b10,hibit_tmp_r,2'b01} : { 2'b00, shadow_bank, adr15, adr14 };              
 	3'b110: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ({adr15,adr14}==2'b01) ? {2'b10,hibit_tmp_r,2'b10} : { 2'b00, shadow_bank, adr15, adr14 };              
 	3'b111: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ({adr15,adr14}==2'b01) ? {2'b10,hibit_tmp_r,2'b11} : { 2'b00, shadow_bank, adr15, adr14 };
      endcase // case (hibit_tmp_r[2:0])
`else 
      // PARTIAL SHADOW MODE - all write accesses go to shadow memory but only shadow block 3 is ever read in mode C3 at bank 0x4000 (remapped to 0xC000)
      shadow_en_b_r = !(!wr_b & adr14 & adr15_q);
      case (ramblock_q[2:0])
 	3'b000: {exp_ram_r, ramcs_b_r, ramadrhi_r} = { 1'b0, shadow_en_b_r , shadow_bank, adr15_q,adr14 };
 	3'b001: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14}==2'b11 ) ? {1'b1, 1'b0, hibit_tmp_r,2'b11} : { 1'b0, shadow_en_b_r , shadow_bank, adr15_q,adr14 };
 	3'b010: {exp_ram_r, ramcs_b_r, ramadrhi_r} = { 1'b1, 1'b0,hibit_tmp_r, adr15_q,adr14} ; 
 	3'b011: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14}==2'b11 ) ? {2'b10,hibit_tmp_r,2'b11} : ({adr15_q,adr14}==2'b01) ? {2'b00,shadow_bank,2'b11} : { 1'b0, shadow_en_b_r , shadow_bank, adr15_q,adr14 };
 	3'b100: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14}==2'b01 ) ? {2'b10,hibit_tmp_r,2'b00} : { 1'b0, shadow_en_b_r , shadow_bank, adr15_q, adr14 };              
 	3'b101: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14}==2'b01 ) ? {2'b10,hibit_tmp_r,2'b01} : { 1'b0, shadow_en_b_r , shadow_bank, adr15_q, adr14 };              
 	3'b110: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14}==2'b01 ) ? {2'b10,hibit_tmp_r,2'b10} : { 1'b0, shadow_en_b_r , shadow_bank, adr15_q, adr14 };              
 	3'b111: {exp_ram_r, ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14}==2'b01 ) ? {2'b10,hibit_tmp_r,2'b11} : { 1'b0, shadow_en_b_r , shadow_bank, adr15_q, adr14 };
      endcase // case (hibit_tmp_r[2:0])
`endif 
    end
    else begin
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
  end
  
endmodule
