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
 */

//`define one of these only
`define X64   1
//`define X128  1
//`define UNIV    1

// Additional options
// OVERDRIVE should be used only with X64
`define OVERDRIVE 1
// USE6128FIRSTBANK should be used only with X128 
//`define USE6128FIRSTBANK 1



module cpld_ram512k(busreset_b,adr15,adr14,iorq_b,mreq_b,ramrd_b,reset_b,wr_b,rd_b,data,ramdis,ramcs_b,ramadrhi,ready, clk, ramoe_b, ramwe_b, adr15_out,
`ifdef UNIV
, mode464,shadowhi
`endif

);
  input            busreset_b;
  inout            adr15;    
  inout            adr14;
  input            iorq_b;
  input            mreq_b;
  input            ramrd_b;
  input            reset_b;
  input            wr_b;
  input            rd_b;    
  input [7:0]      data;
  input            ready;
  input            clk;
  
`ifdef UNIV
  // Switches select 464/6128 mode..
  input            mode464;
  input            shadowhi;  
`endif
  
  output           ramdis;
  output           ramcs_b;
  output [4:0]     ramadrhi;
  output           ramoe_b;
  output           ramwe_b;
  inout[1:0]       adr15_out;
  
  reg [5:0]        ramblock_q;
  reg [4:0]        ramadrhi_r;
  reg              ramcs_b_r;
  reg              clken_lat_qb;
  reg [5:0]        hibit_tmp_r;
  reg              adr15_q;
  reg              adr14_q;  
  reg              mreq_b_q;

`ifdef X64  
  wire              mode464 = 1'b1 ;
  wire              shadowhi = 1'b0 ;  
`endif    
    
`ifdef OVERDRIVE  
  reg              overdrive_hi_q ;  
  reg              overdrive_lo_q ;
`endif
  
  // Create negedge clock on IO write event - clock low pulse will be suppressed if not an IOWR* event
  // but if the pulse is allowed through use the trailing (rising) edge to capture data
  wire             wclk    = !(clk|clken_lat_qb); 
  // Combination of RAMCS and RAMRD determine whether RAM output is enabled
  assign ramoe_b = ramrd_b;		
  assign ramwe_b = wr_b ;  
  assign ramcs_b = ramcs_b_r | mreq_b ;
  assign ramdis  = !ramcs_b_r ;    
  assign ramadrhi = ramadrhi_r ;

`ifdef OVERDRIVE
  assign {adr15, adr15_out}  = (overdrive_hi_q & !mreq_b ) ?3'b111: 
                               (overdrive_lo_q & !mreq_b ) ?3'b000: 
                               3'bzzz ;  
  assign adr14               = (overdrive_lo_q & !mreq_b  ) ?1'b0: 
                               1'bz ;  

  always @ (negedge reset_b or posedge clk ) 
    if ( !reset_b ) begin
      overdrive_hi_q <= 1'b0;       
      overdrive_lo_q <= 1'b0;
    end
    else begin
      if ( mreq_b) begin
        overdrive_hi_q <= 1'b0;         
        overdrive_lo_q <= 1'b0;
      end
      else if (mreq_b_q) begin // sample when mreq inactive or first cycle of active
        // Redirect bank &4000 -> &C000 (screen)  only in mode 3 block 01 access        
        overdrive_hi_q <= (ramblock_q[2:0] == 3'b011) & ({adr15_q,adr14_q}==2'b01);                   
        // Redirect bank &C000 -> &0000  to avoid screen corruption in mode C1,2&3 and from &4000 -> &0000 in modes C4-7 (ie if screen relocated and overlaps extension RAM)!        
        overdrive_lo_q <= ((ramblock_q[2:0] == 3'b011) & (adr15_q & adr14_q)) | // Map all internal access to &C000 to &0000 in mode 3
                          ((ramblock_q[2:0] == 3'b001) & (adr15_q & adr14_q)) | // Map all internal access to &C000 to &0000 in mode 1
                          (ramblock_q[2:0] == 3'b010) |              // Map all internal access to &0000 in mode 2    
                          (ramblock_q[2] & ( !adr15_q & adr14_q)) ;  // Map &4000 -> &0000 in modes 4-7, protect screen if at &4000 when accessing external bank
      end
    end  
`else
  assign {adr15, adr15_out} = 3'bzzz;
  assign adr14 = 1'bz;  
`endif

   always @ (negedge reset_b or posedge clk ) 
     if ( !reset_b ) begin
       mreq_b_q <= 1'b1;
     end
     else begin
       mreq_b_q <= mreq_b;
     end

   always @ (negedge reset_b or negedge mreq_b ) 
     if ( !reset_b ) begin
       adr15_q <= 1'b0;
       adr14_q <= 1'b0;       
     end
     else begin
       adr15_q <= adr15;
       adr14_q <= adr14;       
     end
  
  always @ ( clk )
    if ( clk ) begin
      clken_lat_qb <= !(!iorq_b && !wr_b && !adr15 && data[6] && data[7]);
    end
  
  always @ (negedge reset_b or posedge wclk )
    if (!reset_b)
      ramblock_q <= 6'b0;
    else
      ramblock_q <= data[5:0];
  
  
`ifndef X128
  wire [2:0]        shadow_bank = { shadowhi,2'b11};    
  always @ ( * )
    begin
      hibit_tmp_r = ramblock_q;       
      if ( (ramblock_q[5:3] == shadow_bank) & mode464 ) // Shadow bank active only in the 464
        hibit_tmp_r[5:3] =   (shadow_bank) & 3'b110; // alias the even bank below shadow bank to the shadow bank
      case (hibit_tmp_r[2:0])
	3'b000: {ramcs_b_r, ramadrhi_r} = { !mode464, shadow_bank, adr15, adr14_q };
        // Modes 1 and 2 also overdrive A15 but only to prevent screen corruption
	3'b001: {ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14_q}==2'b11 ) ? {1'b0, hibit_tmp_r[5:3],2'b11} : { !mode464, shadow_bank, adr15_q, adr14_q };
	3'b010: {ramcs_b_r, ramadrhi_r} = { 1'b0,hibit_tmp_r[5:3],adr15_q,adr14_q} ; 
	// Mode 3: Map 0b1100 to New 0b1100 _and_ 0b0100 to 0b1100 but in 'shadow' bank only (can't affect internal RAM without backdriving ADR15_Q)
	3'b011: {ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14_q}==2'b11 ) ? {1'b0,hibit_tmp_r[5:3],2'b11} : {!mode464, shadow_bank, (adr15_q|adr14_q), adr14_q };
	3'b100: {ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14_q}==2'b01 ) ? {1'b0,hibit_tmp_r[5:3],2'b00} : {!mode464, shadow_bank, adr15_q, adr14_q };              
	3'b101: {ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14_q}==2'b01 ) ? {1'b0,hibit_tmp_r[5:3],2'b01} : {!mode464, shadow_bank, adr15_q, adr14_q };              
	3'b110: {ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14_q}==2'b01 ) ? {1'b0,hibit_tmp_r[5:3],2'b10} : {!mode464, shadow_bank, adr15_q, adr14_q };              
	3'b111: {ramcs_b_r, ramadrhi_r} = ( {adr15_q,adr14_q}==2'b01 ) ? {1'b0,hibit_tmp_r[5:3],2'b11} : {!mode464, shadow_bank, adr15_q, adr14_q };
      endcase // case (hibit_tmp_r[2:0])
    end 
`else
    always @ ( * )
      begin
`ifdef USE6128FIRSTBANK         
        if ( ramblock_q[5:3] == 3'b000 )
          // Use internal RAM for first bank in a 6128
    	  {ramcs_b_r, ramadrhi_r} = { 1'b1, 5'bxxxxx };         
        else
`endif          
          case (ramblock_q[2:0])
    	    3'b000: {ramcs_b_r, ramadrhi_r} = { 1'b1, 5'bxxxxx };
    	    3'b001: {ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b11 ) ? {1'b0,ramblock_q[5:3],2'b11} : { 1'b1, 5'bxxxxx};
    	    3'b010: {ramcs_b_r, ramadrhi_r} = { 1'b0,ramblock_q[5:3],adr15,adr14} ; 
    	    3'b011: {ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b11 ) ? {1'b0,ramblock_q[5:3],2'b11} : {1'b1, 5'bxxxxx };
    	    3'b100: {ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b01 ) ? {1'b0,ramblock_q[5:3],2'b00} : {1'b1, 5'bxxxxx };              
    	    3'b101: {ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b01 ) ? {1'b0,ramblock_q[5:3],2'b01} : {1'b1, 5'bxxxxx };              
    	    3'b110: {ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b01 ) ? {1'b0,ramblock_q[5:3],2'b10} : {1'b1, 5'bxxxxx };              
    	    3'b111: {ramcs_b_r, ramadrhi_r} = ( {adr15,adr14}==2'b01 ) ? {1'b0,ramblock_q[5:3],2'b11} : {1'b1, 5'bxxxxx };
          endcase // case (ramblock_q[2:0])
      end // always @ (ramblock_q, adr15, adr14 )    
`endif
    
endmodule
