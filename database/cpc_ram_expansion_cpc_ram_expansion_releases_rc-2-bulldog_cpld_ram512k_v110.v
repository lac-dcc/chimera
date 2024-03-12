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
 * - FutureOS Desktop prefers higher voltage to get best cursor definition - 5.25V and above
 * 
 * Crib
 * 1. Keeping a net in synthesis
 * //synthesis attribute keep of input_a_reg is "true"
 * BUF mybuf (.I(input_a_reg),.O(comb));
 */

module cpld_ram512k_v110(
  input        rfsh_b,
  inout        adr15,
  inout        adr15_aux, 
  input        adr14,
  input        adr8, 
  input        iorq_b,
  input        mreq_b,
  input        ramrd_b,
  input        reset_b,
  input        wr_b,
  inout        rd_b,
  inout        rd_b_aux, 
  input [7:0]  data,
  inout        ready,
  input        clk,
  input        m1_b,
  input [1:0]  dip,
    
  output       ramdis,
  output       ramcs_b,
  inout [4:0]  ramadrhi, // bits 4,3 also connected to DIP switches 2,1 resp and read on startup
  output       ramoe_b,
  output       ramwe_b
);
  
  reg [5:0]        ramblock_q;
  reg [4:0]        ramadrhi_r;
  reg [3:0]        dip_q;
  reg              mode3_q;              
  reg              mwr_cyc_q;
  reg              mwr_cyc_f_q;  
  reg              ramcs_b_r;
  reg              clken_lat_qb;
  reg              adr15_q;
  reg              exp_ram_r;
  reg              mreq_b_q, mreq_b_f_q;
  wire             mwr_cyc_d;  
  wire             adr15_overdrive_w;

  // Planned DIP options (switches are numbered 1-4 rather than 0-3 on the physical component)
  // 
  // 1 2 3 4| Note                                                               | Supported Video Modes (Notes)
  // -------+--------------------------------------------------------------------+------------------------------
  //        | Recommended Video Modes                                            |
  // -------+--------------------------------------------------------------------+------------------------------
  // 0 0 0 0| Only valid 6128 or 464+, 6128+ setting                             | 0-7
  // -------+--------------------------------------------------------------------+------------------------------  
  // 1 1 0 0| 464 overdrive mode, partial shadow RAM, shadow bank number 3'b011  | 0-7
  // 1 1 0 1| 464 overdrive mode, partial shadow RAM, shadow bank number 3'b111  | 0-7
  // 1 1 1 0| 464 overdrive mode, full shadow RAM, shadow bank number 3'b011     | 0-7
  // 1 1 1 1| 464 overdrive mode, full shadow RAM, shadow bank number 3'b111     | 0-7
  // -------+--------------------------------------------------------------------+------------------------------
  //        | Limited Video Modes                                                |
  // -------+--------------------------------------------------------------------+------------------------------
  // 0 1 1 0| 464 full shadow RAM, no overdrive, shadow bank number 3'b011       | 0,4-7(1)
  // 0 1 1 1| 464 full shadow RAM, no overdrive, shadow bank number 3'b111       | 0,4-7(1)
  // 1 0 0 0| 464 overdrive mode, no shadow RAM                                  | 0,1,2,3(2),4-7    
  // -------+--------------------------------------------------------------------+------------------------------
  // Notes
  // (1) - no screen protection, visible interference whenever writing to expansion memory overlaid on screen memory
  // (2) - remapping of _internal_ memory in mode C3 done but subject to errors when foreground ROM is selected
  //

  wire        overdrive_mode = dip[0];                     // AKA 464 mode [1] or 6128 mode [0]
  wire        shadow_mode = dip[1];                        // Only valid in overdrive mode for 464
  // Latching these two DIP switches requires the CPC to be powered down/up rather than just a ctrl-shift-esc reset
  wire        full_shadow = dip_q[2] & shadow_mode;        // Full shadow mode [1] or partial mode [0] for 464
  wire [2:0]  shadow_bank = {dip_q[3], 2'b11};             // use 3'b111 or 3'b011 for shadow bank for 464

  // Create negedge clock on IO write event - clock low pulse will be suppressed if not an IOWR* event
  // but if the pulse is allowed through use the trailing (rising) edge to capture data
  wire             wclk    = !(clk|clken_lat_qb); 

  // Dont drive address outputs during reset due to overlay of DIP switches    
  assign ramadrhi = (reset_b) ? ramadrhi_r : {2'bzz, ramadrhi_r[2:0]} ; 
  assign ramwe_b  = wr_b ;
  // Combination of RAMCS and RAMRD determine whether RAM output is enabled 
  assign ramoe_b = ramrd_b ;
  
 // Memory Data Access
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
  // MWR_CYC    _______/    .    :    .    :    .    \______  FF'd Version 
  // State    _IDLE____X___T1____X____T1___X___T2____X_END__
  //
  
  // overdrive rd_b for all expansion write accesses only - extend overdrive to trailing edge following mreq going high
  assign { rd_b, rd_b_aux }    = ( overdrive_mode & exp_ram_r & (mwr_cyc_q|mwr_cyc_f_q)) ? 2'b00 : 2'bzz ;

  // Overdrive A15 for writes only in shadow modes (full and partial) but for all access types otherwise
  // Need to compute whether A15 will need to be driven before the first rising edge of the MREQ cycle for the
  // gate array to act on it. Cant wait to sample mwr_cyc_q after it has been set initially.
  assign mwr_cyc_d = (mreq_b_f_q | mreq_b_q) & !mreq_b & rfsh_b & rd_b & m1_b ;  
  assign adr15_overdrive_w   =  overdrive_mode & mode3_q & adr14 & rfsh_b & ((shadow_mode) ? (mwr_cyc_q|mwr_cyc_d): !mreq_b) ;
  assign { adr15, adr15_aux} = (adr15_overdrive_w  ) ? 2'b11 : 2'bzz; 

  // Never, ever use internal RAM for reads in full shadow mode
  assign ramdis = (full_shadow) ? 1'b1 :  !ramcs_b_r ;
  
  // In full shadow mode SRAM is always enabled for all real memory accesses but dont clash with ROM access (ramrd_b will control oe_b)
  assign ramcs_b = !( !ramcs_b_r | full_shadow) | mreq_b | !rfsh_b ;

  always @ (negedge reset_b or posedge clk)
    if ( !reset_b )
      mwr_cyc_q <= 1'b0;
    else begin
      if ( mwr_cyc_d ) 
        mwr_cyc_q <= 1'b1;
      else if (mreq_b)
        mwr_cyc_q <= 1'b0;
    end

  always @ (negedge reset_b or negedge clk)
    if ( !reset_b ) begin
      mreq_b_f_q = 1'b1;
      mwr_cyc_f_q <= 1'b0;      
    end     
    else begin
      mreq_b_f_q = mreq_b;
      mwr_cyc_f_q <= mwr_cyc_q;            
    end
  
  always @ (negedge reset_b or posedge clk)
    if ( !reset_b ) 
      mreq_b_q = 1'b1;
    else 
      mreq_b_q = mreq_b;
  
  always @ (negedge reset_b or negedge mreq_b ) 
    if ( !reset_b ) 
      adr15_q <= 1'b0;
    else
      adr15_q <= adr15;

  // Latch DIP switch settings on reset - need a CPC power down/up.
  always @ ( * )
    if ( !reset_b ) 
      dip_q <= { ramadrhi[4:3], dip[1:0] } ;
  
  always @ ( * )
    if ( clk ) 
      clken_lat_qb <= !(!iorq_b && !wr_b && !adr15 && data[6] && data[7]);
  
  // Pre-decode mode 3 setting and noodle shadow bank alias if required to save decode
  // time after the Q
  always @ (negedge reset_b or posedge wclk )
    if (!reset_b) begin
      ramblock_q <= 6'b0;
      mode3_q <= 1'b0;
    end        
    else begin
      if ( shadow_mode && (data[5:3]==shadow_bank) )
        ramblock_q <= {data[5:4],1'b0, data[2:0]};          
      else
        ramblock_q <= data[5:0] ;
      mode3_q <= (data[2:0] == 3'b011);
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
