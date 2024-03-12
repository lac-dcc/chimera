//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2013-01-09 12:55:25 +0000 (Wed, 09 Jan 2013) $
//
//      Revision            : $Revision: 233070 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : AHB Bit Band Wrapper
//            A bus wrapper to allow Cortex-M0 or Cortex-M1 to replicate the
//            bit-band feature in the Cortex-M3/M4.
//-----------------------------------------------------------------------------
module cmsdk_ahb_bitband #(
  parameter MW = 1, // Width of HMASTER signals
  parameter BE = 0  // Big Endian
 )
 (
  // System
  input     wire         HCLK,
  input     wire         HRESETn,
  // AHB slave interface
  input     wire         HSELS,
  input     wire  [31:0] HADDRS,
  input     wire   [1:0] HTRANSS,
  input     wire   [3:0] HPROTS,
  input     wire   [MW-1:0] HMASTERS,
  input     wire   [2:0] HBURSTS,
  input     wire         HMASTLOCKS,
  input     wire   [2:0] HSIZES,
  input     wire         HWRITES,
  input     wire         HREADYS,
  input     wire  [31:0] HWDATAS,
  output    wire         HREADYOUTS,
  output    wire  [31:0] HRDATAS,
  output    wire         HRESPS,

  // AHB master interface
  output    wire         HSELM,
  output    wire  [31:0] HADDRM,
  output    wire   [1:0] HTRANSM,
  output    wire   [3:0] HPROTM,
  output    wire   [2:0] HBURSTM,
  output    wire   [MW-1:0] HMASTERM,
  output    wire         HMASTLOCKM,
  output    wire   [2:0] HSIZEM,
  output    wire         HWRITEM,
  output    wire         HREADYM,
  output    wire  [31:0] HWDATAM,
  input     wire         HREADYOUTM,
  input     wire  [31:0] HRDATAM,
  input     wire         HRESPM);


  // --------------------------------------------------------------------------
  // Internal wires
  // --------------------------------------------------------------------------

  // Address range decode
  wire            sram_bitband_alias;       // Bit band alias address detected
  wire            perip_bitband_alias;      // Bit band alias address detected

  wire   [4:0]    bit_address_source;       // 5-bit bit address value
  reg   [20:0]    reg_bit_address;          // Registered bit address with MSB indicating
                                            // SRAM or peripheral region
  wire  [20:0]    nxt_bit_address;          // next state for reg_bit_address
  reg    [1:0]    reg_bitband_size;         // Saved version of HSIZES
  reg    [2:0]    reg_bitband_prot;         // Saved version of HPROTS
  reg [MW-1:0]    reg_bitband_hmstr;        // Saved version of HMASTERS


  reg    [1:0]    reg_fsm_state;            // FSM machine
  reg    [1:0]    nxt_fsm_state;            // Next state for FSM
  // 00 - idle / bypass / bitband read (address phase) / data phase error 2 on slave i/f
  // 01 - locked read (data phase, address phase write)
  // 10 - locked write (data phase, address phase idle)
  // 11 - error (data phase error 1 on slave i/f, address phase idle, unlock)
  wire            bitband_valid;            // bit-band alias read/write
  wire            bitband_valid_and_readys; // bitband_valid is assert and HREADYS is asserted
  wire            rmw_start;                // Read-modify-write (bit-band alias write) start

  // Slave interface - from CPU to bitband wrapper
  reg    [1:0]    byte_number_ap;           // byte-number used in slave interface - address phase
  reg    [1:0]    byte_number_dp;           // byte-number used in slave interface - data phase
  // master interface - from bitband wrapper to slave
  reg    [4:0]    bit_number_ap;            // bit-number in word - address phase
  reg    [4:0]    bit_number_dp;            // bit-number in word - data phase

  reg   [31:0]    haddr_mux;
  reg   [ 1:0]    hsize_mux;
  reg   [ 1:0]    htrans_mux;
  reg             hwrite_mux;
  reg             hmastlock_mux;
  reg [MW-1:0]    hmaster_mux;
  reg   [ 2:0]    hburst_mux;
  reg   [ 3:0]    hprot_mux;
  reg             hreadym_mux;
  reg             hreadyouts_mux;
  reg             hresps_mux;

  // Signal for error response generation
  wire            nxt_err_cycle2;
  wire            reg_err_cycle2_en;
  reg             reg_err_cycle2;

  // Extract required bit
  wire            read_bit_value;
  wire            write_bit_value;
  reg             bitband_read_dataphase;
  reg   [31:0]    reg_data_buffer;
  wire  [31:0]    nxt_data_buffer;
  wire  [31:0]    bit_mask;

  wire            BIGENDIAN;

  // --------------------------------------------------------------------------
  // Main code
  // --------------------------------------------------------------------------

  // FSM States
  localparam RMW_IDLE = 2'b00;      // Idle
  localparam RMW_ONE  = 2'b01;      // Read data phase, Write address phase
  localparam RMW_TWO  = 2'b10;      // Write data phase, Idle address phase
  localparam RMW_ERR  = 2'b11;      // Error response

  // SRAM bit-band region : 0x22000000 to 0x23FFFFFF
  assign  sram_bitband_alias  = ((HADDRS[31:25]==7'b0010_001)&(HPROTS[0])) ? 1'b1 :  1'b0;
  // Peripheral bit-band region : 0x42000000 to 0x43FFFFFF
  assign  perip_bitband_alias = ((HADDRS[31:25]==7'b0100_001)&(HPROTS[0])) ? 1'b1 :  1'b0;

  assign  bit_address_source[4:0] = HADDRS[6:2];

  // Bit-band alias remapping take place if
  // - address range matched
  // - transfer is active
  // - transfer is a data access
  assign  bitband_valid   = (sram_bitband_alias|perip_bitband_alias) & HSELS & HTRANSS[1] & HPROTS[0];
  // Signal to trigger
  // - saving of transfer information and
  // - start the FSM
  assign  rmw_start       = bitband_valid & HWRITES & HREADYS;
  // Truncate required information to avoid saving all address bit
  assign  nxt_bit_address = {HADDRS[30], HADDRS[24:5]};

  // Save information required for bit-band write phase
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      begin
      reg_bit_address <= {21{1'b0}};
      reg_bitband_size<= 2'b00;
      reg_bitband_prot<= 3'b000;
      reg_bitband_hmstr<={MW{1'b0}};
      end
    else if (rmw_start)
      begin
      reg_bit_address <= nxt_bit_address;
      reg_bitband_size<= HSIZES[1:0];
      reg_bitband_prot<= HPROTS[3:1]; // no need to save HPROT[0] because bit band only apply to data accesses
      reg_bitband_hmstr<=HMASTERS;
      end
  end

  // FSM operation
  always @(reg_fsm_state or rmw_start or HRESPM or HREADYOUTM)
    begin
    case (reg_fsm_state)
      RMW_IDLE : begin
          if (rmw_start)
            nxt_fsm_state = RMW_ONE;
          else
            nxt_fsm_state = reg_fsm_state;
          end
      RMW_ONE : begin // RMW : Read data phase, Write address phase
          if (HRESPM)
            nxt_fsm_state = RMW_ERR;
          else if (HREADYOUTM)
            nxt_fsm_state = RMW_TWO;
          else
            nxt_fsm_state = reg_fsm_state;
          end
      RMW_TWO : begin // RMW : Write data phase, Idle address phase
          if (HRESPM)
            nxt_fsm_state = RMW_ERR;
          else if (HREADYOUTM)
            nxt_fsm_state = RMW_IDLE;
          else
            nxt_fsm_state = reg_fsm_state;
          end
      RMW_ERR : begin
          nxt_fsm_state = RMW_IDLE;
          end
      default : nxt_fsm_state = 2'bxx;
    endcase
    end

  // Registering FSM state
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      reg_fsm_state <= RMW_IDLE;
    else
      reg_fsm_state <= nxt_fsm_state;
  end

  // --------------------------------------------------------------------------
  // Bit processing
  // --------------------------------------------------------------------------
  assign BIGENDIAN = (BE==1'b0) ? 1'b0 : 1'b1;

  // This signal tell which byte we should look at when a bit-band read/write
  // is carried out.  For read, we will need to set
  //     HRDATAS = <read_bit_value> << (byte_number_dp*8)
  // For write, we will need to extract
  //     <write_bit_value> = (HWDATAS >> (byte_number_dp*8)) & 1
  // Little endian
  // HSIZE          HADDR   3  2  1  0
  // Word     size    00   -- -- -- dd
  // Halfword size    00   -- -- -- dd
  // Halfword size    10   -- dd -- --
  // Byte     size    00   -- -- -- dd
  // Byte     size    01   -- -- dd --
  // Byte     size    10   -- dd -- --
  // Byte     size    11   dd -- -- --
  // Big endian
  // HSIZE          HADDR
  // Word     size    00   dd -- -- --
  // Halfword size    00   -- -- dd --
  // Halfword size    10   dd -- -- --
  // Byte     size    00   -- -- -- dd
  // Byte     size    01   -- -- dd --
  // Byte     size    10   -- dd -- --
  // Byte     size    11   dd -- -- --
  always @(BIGENDIAN or HSIZES or HADDRS)
  begin
    case (HSIZES[1:0])
      2'b00 : // bytes
        byte_number_ap = HADDRS[1:0];
      2'b01 : // half word
        byte_number_ap = {HADDRS[1], BIGENDIAN};
      2'b10 : // word
        byte_number_ap = {BIGENDIAN, BIGENDIAN};
      2'b11 : // double word - Invalid
        byte_number_ap = {BIGENDIAN, BIGENDIAN};
      default :
        byte_number_ap = 2'bxx;
    endcase
  end

  // Registering for data phase
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      byte_number_dp <= 2'b00;
    else if (HREADYS)
      byte_number_dp <= byte_number_ap;
    end


  always @(BIGENDIAN or HSIZES or bit_address_source)
  begin
    case (HSIZES[1:0])
      2'b00 : // bytes
        bit_number_ap = bit_address_source[4:0];
      2'b01 : // half word
        bit_number_ap = {bit_address_source[4], BIGENDIAN ^ bit_address_source[3], bit_address_source[2:0]};
      2'b10 : // word
        bit_number_ap = {BIGENDIAN ^ bit_address_source[4], BIGENDIAN ^ bit_address_source[3], bit_address_source[2:0]};
      2'b11 : // double word - Invalid
        bit_number_ap = {BIGENDIAN ^ bit_address_source[4], BIGENDIAN ^ bit_address_source[3], bit_address_source[2:0]};
      default :
        bit_number_ap = 5'bxxxxx;
    endcase
  end
  // Registering for data phase
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      bit_number_dp <= 5'b00000;
    else if (HREADYS)
      bit_number_dp <= bit_number_ap;
    end

  // --------------------------------------------------------------------------
  // Outputs
  // --------------------------------------------------------------------------

  // From Master to Slave
  // HSELS=1 if bit-band write address phase
  assign  HSELM = (reg_fsm_state==RMW_ONE) ? 1'b1 : HSELS;

  // Error response state
  // - first cycle of error response  : (reg_fsm_state==RMW_ERR)
  // - second cycle of error response : reg_err_cycle2==1'b1;
  assign nxt_err_cycle2    = (reg_fsm_state==RMW_ERR);
  assign reg_err_cycle2_en = nxt_err_cycle2 | reg_err_cycle2;

  // Registering state
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      reg_err_cycle2 <= 1'b0;
    else if (reg_err_cycle2_en)
      reg_err_cycle2 <= nxt_err_cycle2;
    end

  // Multiplexer to generate bit-band remapping bus transfers
  always @(*)
    begin
    if (reg_fsm_state==RMW_ONE) begin // Bit-band read (data phase) write (address phase) cycle
      // Address phase for write operation
      haddr_mux[31:20] = reg_bit_address[20] ? 12'h400 : 12'h200;
      haddr_mux[19: 2] = reg_bit_address[19:2];
      haddr_mux[    1] = reg_bit_address[1] & (~reg_bitband_size[1]);
      haddr_mux[    0] = reg_bit_address[0] & (reg_bitband_size[1:0]==2'b00);
      hsize_mux[1  :0] = reg_bitband_size[1:0];
      hmaster_mux      = reg_bitband_hmstr;
      htrans_mux[ 1:0] = 2'b10;
      hwrite_mux       = 1'b1;
      hmastlock_mux    = 1'b1;
      hburst_mux       = 3'b000; // No burst for bit-band alias
      hprot_mux        = {reg_bitband_prot[2:0], 1'b1};
      hreadym_mux      = HREADYOUTM;
      end
    else if ((reg_fsm_state==RMW_IDLE) & (sram_bitband_alias|perip_bitband_alias) & HSELS & HPROTS[0])
      begin // bit-band alias remap to bit-band region
      haddr_mux[31:20] = HADDRS[30] ? 12'h400 : 12'h200;
      haddr_mux[19: 2] = HADDRS[24:7];
      haddr_mux[    1] = HADDRS[6] & (~HSIZES[1]);
      haddr_mux[    0] = HADDRS[5] & (HSIZES[1:0]==2'b00);
      hsize_mux[1  :0] = HSIZES[1:0];
      hmaster_mux      = HMASTERS;
      htrans_mux[ 1:0] = {HTRANSS[1], 1'b0};
      hwrite_mux       = 1'b0;
      hmastlock_mux    = HWRITES|HMASTLOCKS;
      hburst_mux       = 3'b000; // No burst for bit-band alias
      hprot_mux        = HPROTS[3:0];
      hreadym_mux      = HREADYS;
      end
    else if ((reg_fsm_state==RMW_TWO)| // bit-band write data phase, address phase IDLE
             (reg_fsm_state==RMW_ERR)) // error (data phase error 1 on slave i/f, address phase idle, unlock)
      begin
      haddr_mux[31: 0] = HADDRS[31:0];
      hsize_mux[1 : 0] = HSIZES[1:0];
      hmaster_mux      = HMASTERS;
      htrans_mux[ 1:0] = 2'b00;
      hwrite_mux       = HWRITES;
      hmastlock_mux    = HMASTLOCKS; // Note : If CPU generates locked transfer to bit-band alias, this will not unlock the bus
      hburst_mux       = HBURSTS;
      hprot_mux        = HPROTS[3:0];
      hreadym_mux      = HREADYOUTM;
      end
    else  // bypass
      begin
      haddr_mux[31: 0] = HADDRS[31:0];
      hsize_mux[1 : 0] = HSIZES[1:0];
      hmaster_mux      = HMASTERS;
      htrans_mux[ 1:0] = HTRANSS[1:0];
      hwrite_mux       = HWRITES;
      hmastlock_mux    = HMASTLOCKS;
      hburst_mux       = HBURSTS;
      hprot_mux        = HPROTS[3:0];
      hreadym_mux      = HREADYS;
      end
    end

  // Generate response to bus master
  always @(reg_fsm_state or HREADYOUTM or HRESPM or reg_err_cycle2)
    begin
    case (reg_fsm_state)
    RMW_ONE: begin // Bit-band read (data phase) write (address phase) cycle
      hreadyouts_mux = 1'b0; // mask ready from bus master
      hresps_mux     = 1'b0;
      end
    RMW_IDLE: begin // bit-band alias remap to bit-band region
      hreadyouts_mux = HREADYOUTM; // Normal
      hresps_mux     = reg_err_cycle2 | HRESPM; // Error response cycle #2 from bit-band read during RMW
      end
    RMW_TWO: begin // bit-band write data phase, address phase IDLE
      hreadyouts_mux = 1'b0; // Normal
      hresps_mux     = 1'b0;
      end
    RMW_ERR: begin // error (data phase error 1 on slave i/f, address phase idle, unlock)
      hreadyouts_mux = 1'b0;
      hresps_mux     = 1'b1;
      end
    default: begin
      hreadyouts_mux = 1'bx;
      hresps_mux     = 1'bx;
      end
    endcase
    end

  // Output to top level signals
  assign HADDRM     = haddr_mux;
  assign HSIZEM     = {1'b0, hsize_mux[1:0]};
  assign HTRANSM    = htrans_mux;
  assign HWRITEM    = hwrite_mux;
  assign HMASTERM   = hmaster_mux;
  assign HMASTLOCKM = hmastlock_mux;
  assign HBURSTM    = hburst_mux;
  assign HPROTM     = hprot_mux;
  assign HREADYM    = hreadym_mux;
  assign HREADYOUTS = hreadyouts_mux;
  assign HRESPS     = hresps_mux;


  // --------------------------------------------------------------------------
  // Data processing
  // --------------------------------------------------------------------------

  // Extract bit value read from bit-band alias
  assign  read_bit_value = HRDATAM[bit_number_dp];

  assign  bitband_valid_and_readys = bitband_valid & HREADYS;

  // Control signal to indicate bit-band read data phase
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      bitband_read_dataphase <= 1'b0;
    else if ((bitband_read_dataphase & HREADYOUTM)|(bitband_valid & HREADYS))
      bitband_read_dataphase <= bitband_valid_and_readys;
       // bitband_valid can either be bit-band alias read
       // or first half of bit-band alias write. In both case a bitband
       // read operation is required
    end

  // Bit-band alias read value
  assign  HRDATAS[ 7: 0] = (bitband_read_dataphase) ?
             ((byte_number_dp==2'b00) ? {7'b0000000,read_bit_value} :  8'h00) :
             HRDATAM[7:0];
  assign  HRDATAS[15: 8] = (bitband_read_dataphase) ?
             ((byte_number_dp==2'b01) ? {7'b0000000,read_bit_value} :  8'h00) :
             HRDATAM[15:8];
  assign  HRDATAS[23:16] = (bitband_read_dataphase) ?
             ((byte_number_dp==2'b10) ? {7'b0000000,read_bit_value} :  8'h00) :
             HRDATAM[23:16];
  assign  HRDATAS[31:24] = (bitband_read_dataphase) ?
             ((byte_number_dp==2'b11) ? {7'b0000000,read_bit_value} :  8'h00) :
             HRDATAM[31:24];

  // Extract write bit value for read modify write
  assign  write_bit_value = ((byte_number_dp==2'b00) & HWDATAS[0]) |
                            ((byte_number_dp==2'b01) & HWDATAS[8]) |
                            ((byte_number_dp==2'b10) & HWDATAS[16]) |
                            ((byte_number_dp==2'b11) & HWDATAS[24]);

  // Generate bit mask for bit band read-modify-write
  // Using bit_number_dp (dat phase bit number value), the bit_mask
  // value (one hot) is generated.
  assign bit_mask = 1 << bit_number_dp;

  // Create write data
  assign   nxt_data_buffer = (HRDATAM & (~bit_mask)) | (bit_mask & {32{write_bit_value}});

  // Registering for data phase - update at the end of the bit-band read data phase
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      reg_data_buffer <= {32{1'b0}};
    else if (bitband_read_dataphase & HREADYOUTM)
      reg_data_buffer <= nxt_data_buffer;
    end

  // Select HWDATAM output
  // Use data in buffer in state two (bit-band write)
  // and in state 3 (error state) if the error was taken place
  // during write operation (~bitband_read_dataphase).
  assign HWDATAM = ((reg_fsm_state==RMW_TWO)|
                    ((reg_fsm_state==RMW_ERR) & (~bitband_read_dataphase))) ?
                    reg_data_buffer : HWDATAS;

`ifdef ARM_AHB_ASSERT_ON
   // ------------------------------------------------------------
   // Assertions
   // ------------------------------------------------------------
`include "std_ovl_defines.h"

  wire  ovl_bb_alias_address_phase;  // transfer to bit-band alias address phase

  wire  ovl_normal_address_phase;    // normal transfer address phase
  reg   ovl_normal_data_phase;       // normal transfer data phase

  wire  ovl_nxt_bb_read_data_phase;  // Bit band alias read address phase
  reg   ovl_reg_bb_read_data_phase;  // Bit band alias read data phase


  assign ovl_bb_alias_address_phase = HSELS & HTRANSS[1] & (sram_bitband_alias|perip_bitband_alias);
  assign ovl_normal_address_phase   = HSELS & HTRANSS[1] & (~(sram_bitband_alias|perip_bitband_alias));
  assign ovl_nxt_bb_read_data_phase = ovl_bb_alias_address_phase & (~HWRITES);

  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    begin
    ovl_normal_data_phase   <= 1'b0;
    ovl_reg_bb_read_data_phase <= 1'b0;
    end
  else if (HREADYS)
    begin
    ovl_normal_data_phase   <= ovl_normal_address_phase;
    ovl_reg_bb_read_data_phase <= ovl_nxt_bb_read_data_phase;
    end
  end

  wire  ovl_nxt_rmw_data_phase_1;
  reg   ovl_reg_rmw_data_phase_1;
  wire  ovl_nxt_rmw_data_phase_2;
  reg   ovl_reg_rmw_data_phase_2;

  assign ovl_nxt_rmw_data_phase_1 =
    // Set to 1 when a bit band alias write take place
    (ovl_bb_alias_address_phase & HREADYS & HWRITES) |
    // Remain high until first transfer finish
    (ovl_reg_rmw_data_phase_1 & (~HREADYOUTM));
  assign ovl_nxt_rmw_data_phase_2 =
    // Set to high when data phase 1 finish and not error
    (ovl_reg_rmw_data_phase_1 & HREADYOUTM & (~HRESPM)) |
    // Remain high until second transfer finish
    (ovl_reg_rmw_data_phase_2 & (~HREADYOUTM));

  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    begin
    ovl_reg_rmw_data_phase_1 <= 1'b0;
    ovl_reg_rmw_data_phase_2 <= 1'b0;
    end
  else
    begin
    ovl_reg_rmw_data_phase_1 <= ovl_nxt_rmw_data_phase_1;
    ovl_reg_rmw_data_phase_2 <= ovl_nxt_rmw_data_phase_2;
    end
  end

  // In normal address phase, control should be the same as usual transfer
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Normal transfer ctrl mismatch")
   u_ovl_normal_ctrl_mistmatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_normal_address_phase & HREADYS),
      .consequent_expr((HSIZES==HSIZEM) &
                       (HWRITES==HWRITEM) &
                       (HPROTS==HPROTM) &
                       (HBURSTS==HBURSTM) &
                       (HMASTERS==HMASTERM) &
                       (HMASTLOCKS==HMASTLOCKM))
      );

  // In normal address phase, address should be the same as usual transfer
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Normal transfer ctrl mismatch")
   u_ovl_normal_addr_mistmatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_normal_address_phase & HREADYS),
      .consequent_expr((HADDRS==HADDRM))
      );

  // In normal data phase, response should be the same as usual transfer
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Normal transfer response mismatch")
   u_ovl_normal_result_mistmatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_normal_data_phase),
      .consequent_expr((HREADYOUTS==HREADYOUTM) &
                       (HRESPS==HRESPM) &
                       (HREADYS==HREADYM))
      );

  // In bit-band address phase, control (apart from HMASTLOCK and HWRITEM) should be the same as usual transfer
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Bit band alias transfer ctrl mismatch")
   u_ovl_bb_alias_ctrl_mistmatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_bb_alias_address_phase & HREADYS),
      .consequent_expr((HSIZES==HSIZEM) &
                       (HPROTS==HPROTM) &
                       (HMASTERS==HMASTERM))
      );

  // In bit-band address phase, HMASTLOCK should be the 1 if it is a write
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Bit band alias write HMASTLOCKM should be 1")
   u_ovl_bb_alias_write_hmastlock_mistmatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_bb_alias_address_phase & HREADYS & HWRITES),
      .consequent_expr(HMASTLOCKM==1'b1)
      );

  // In bit-band address phase, HMASTLOCK should be the same as usual transfer if it is a read
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Bit band alias read HMASTLOCKM should be same as HMASTLOCKS")
   u_ovl_bb_alias_read_hmastlock_mistmatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_bb_alias_address_phase & HREADYS & (~HWRITES)),
      .consequent_expr(HMASTLOCKM==HMASTLOCKS)
      );

  // In bit-band address phase, HWRITEM should be the 0
  // Even if the transfer is a write, it will have to carry out a read-modify-write
  // so the HWRITEM in first address phase should be 0
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Bit band alias HWRITEM should be 0 in address phase")
   u_ovl_bb_alias_hwritem_mistmatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_bb_alias_address_phase & HREADYS),
      .consequent_expr(HWRITEM==1'b0)
      );


  // State machine check for read modify write data phase 1 (read)
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "FSM value incorrect in RMW data phase 1")
   u_ovl_fsm_data_phase_1
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_rmw_data_phase_1 & (~HRESPM)),
      .consequent_expr(reg_fsm_state == RMW_ONE)
      );

  // State machine check for error during read modify write data phase 1
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "FSM value incorrect in RMW data phase 1 error")
   u_ovl_fsm_data_phase_1_error
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_rmw_data_phase_1 & HRESPM & HREADYOUTM),
      .consequent_expr(reg_fsm_state == RMW_ERR)
      );

  // State machine check for read modify write data phase 2 (write)
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "FSM value incorrect in RMW data phase 2")
   u_ovl_fsm_data_phase_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_rmw_data_phase_2 & (~HRESPM)),
      .consequent_expr(reg_fsm_state == RMW_TWO)
      );

  // State machine check for error during read modify write data phase 2
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "FSM value incorrect in RMW data phase 2 error")
   u_ovl_fsm_data_phase_2_error
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_rmw_data_phase_2 & HRESPM & HREADYOUTM),
      .consequent_expr(reg_fsm_state == RMW_ERR)
      );

  // During data phase 1, HMASTLOCK should be high, HBURST should be SINGLE
  // and it should be a write operation
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Ctrl in RMW data phase 1 error, expecting write,single,nseq,locked")
   u_ovl_bb_alias_ctrl_data_phase_1
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_rmw_data_phase_1 & (~HRESPM)),
      .consequent_expr((HMASTLOCKM == 1'b1) &
                       (HBURSTM==3'b000) &
                       (HWRITEM==1'b1) & (HTRANSM==2'b10))
      );

  // During data phase 2, HMASTLOCK should be same as HMASTLOCK from CPU
  // Note : It is not normal for the CPU to generate locked transfers to bit band alias
  //        but architectural nothing stopping it from doing so
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Ctrl in RMW data phase 2 error, expecting idle")
   u_ovl_bb_alias_ctrl_data_phase_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_rmw_data_phase_2 & (~HRESPM)),
      .consequent_expr((HMASTLOCKM == HMASTLOCKS) & (HTRANSM==2'b00))
      );

  // Generate bit mask
  reg [31:0] ovl_nxt_bit_mask;
  reg [31:0] ovl_reg_bit_mask;

  always @(HADDRS or BIGENDIAN or HSIZES)
  begin
    if ((BIGENDIAN==1'b0) | (HSIZES[1:0]==2'b00)) // little endian or byte size
      case (HADDRS[6:2])
      5'b00000 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00000001;
      5'b00001 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00000010;
      5'b00010 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00000100;
      5'b00011 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00001000;
      5'b00100 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00010000;
      5'b00101 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00100000;
      5'b00110 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_01000000;
      5'b00111 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_10000000;
      5'b01000 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000001_00000000;
      5'b01001 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000010_00000000;
      5'b01010 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000100_00000000;
      5'b01011 : ovl_nxt_bit_mask = 32'b00000000_00000000_00001000_00000000;
      5'b01100 : ovl_nxt_bit_mask = 32'b00000000_00000000_00010000_00000000;
      5'b01101 : ovl_nxt_bit_mask = 32'b00000000_00000000_00100000_00000000;
      5'b01110 : ovl_nxt_bit_mask = 32'b00000000_00000000_01000000_00000000;
      5'b01111 : ovl_nxt_bit_mask = 32'b00000000_00000000_10000000_00000000;
      5'b10000 : ovl_nxt_bit_mask = 32'b00000000_00000001_00000000_00000000;
      5'b10001 : ovl_nxt_bit_mask = 32'b00000000_00000010_00000000_00000000;
      5'b10010 : ovl_nxt_bit_mask = 32'b00000000_00000100_00000000_00000000;
      5'b10011 : ovl_nxt_bit_mask = 32'b00000000_00001000_00000000_00000000;
      5'b10100 : ovl_nxt_bit_mask = 32'b00000000_00010000_00000000_00000000;
      5'b10101 : ovl_nxt_bit_mask = 32'b00000000_00100000_00000000_00000000;
      5'b10110 : ovl_nxt_bit_mask = 32'b00000000_01000000_00000000_00000000;
      5'b10111 : ovl_nxt_bit_mask = 32'b00000000_10000000_00000000_00000000;
      5'b11000 : ovl_nxt_bit_mask = 32'b00000001_00000000_00000000_00000000;
      5'b11001 : ovl_nxt_bit_mask = 32'b00000010_00000000_00000000_00000000;
      5'b11010 : ovl_nxt_bit_mask = 32'b00000100_00000000_00000000_00000000;
      5'b11011 : ovl_nxt_bit_mask = 32'b00001000_00000000_00000000_00000000;
      5'b11100 : ovl_nxt_bit_mask = 32'b00010000_00000000_00000000_00000000;
      5'b11101 : ovl_nxt_bit_mask = 32'b00100000_00000000_00000000_00000000;
      5'b11110 : ovl_nxt_bit_mask = 32'b01000000_00000000_00000000_00000000;
      5'b11111 : ovl_nxt_bit_mask = 32'b10000000_00000000_00000000_00000000;
      default  : ovl_nxt_bit_mask = {32{1'bx}};
      endcase
    else // big endian
      if (HSIZES[1:0]==2'b01)
        begin // Half word size, swap within half word
        case (HADDRS[6:2])
          5'b00000 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000001_00000000;
          5'b00001 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000010_00000000;
          5'b00010 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000100_00000000;
          5'b00011 : ovl_nxt_bit_mask = 32'b00000000_00000000_00001000_00000000;
          5'b00100 : ovl_nxt_bit_mask = 32'b00000000_00000000_00010000_00000000;
          5'b00101 : ovl_nxt_bit_mask = 32'b00000000_00000000_00100000_00000000;
          5'b00110 : ovl_nxt_bit_mask = 32'b00000000_00000000_01000000_00000000;
          5'b00111 : ovl_nxt_bit_mask = 32'b00000000_00000000_10000000_00000000;
          5'b01000 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00000001;
          5'b01001 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00000010;
          5'b01010 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00000100;
          5'b01011 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00001000;
          5'b01100 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00010000;
          5'b01101 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00100000;
          5'b01110 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_01000000;
          5'b01111 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_10000000;
          5'b10000 : ovl_nxt_bit_mask = 32'b00000001_00000000_00000000_00000000;
          5'b10001 : ovl_nxt_bit_mask = 32'b00000010_00000000_00000000_00000000;
          5'b10010 : ovl_nxt_bit_mask = 32'b00000100_00000000_00000000_00000000;
          5'b10011 : ovl_nxt_bit_mask = 32'b00001000_00000000_00000000_00000000;
          5'b10100 : ovl_nxt_bit_mask = 32'b00010000_00000000_00000000_00000000;
          5'b10101 : ovl_nxt_bit_mask = 32'b00100000_00000000_00000000_00000000;
          5'b10110 : ovl_nxt_bit_mask = 32'b01000000_00000000_00000000_00000000;
          5'b10111 : ovl_nxt_bit_mask = 32'b10000000_00000000_00000000_00000000;
          5'b11000 : ovl_nxt_bit_mask = 32'b00000000_00000001_00000000_00000000;
          5'b11001 : ovl_nxt_bit_mask = 32'b00000000_00000010_00000000_00000000;
          5'b11010 : ovl_nxt_bit_mask = 32'b00000000_00000100_00000000_00000000;
          5'b11011 : ovl_nxt_bit_mask = 32'b00000000_00001000_00000000_00000000;
          5'b11100 : ovl_nxt_bit_mask = 32'b00000000_00010000_00000000_00000000;
          5'b11101 : ovl_nxt_bit_mask = 32'b00000000_00100000_00000000_00000000;
          5'b11110 : ovl_nxt_bit_mask = 32'b00000000_01000000_00000000_00000000;
          5'b11111 : ovl_nxt_bit_mask = 32'b00000000_10000000_00000000_00000000;
          default  : ovl_nxt_bit_mask = {32{1'bx}};
        endcase
        end
      else begin // word size, swap all four bytes
        case (HADDRS[6:2])
          5'b00000 : ovl_nxt_bit_mask = 32'b00000001_00000000_00000000_00000000;
          5'b00001 : ovl_nxt_bit_mask = 32'b00000010_00000000_00000000_00000000;
          5'b00010 : ovl_nxt_bit_mask = 32'b00000100_00000000_00000000_00000000;
          5'b00011 : ovl_nxt_bit_mask = 32'b00001000_00000000_00000000_00000000;
          5'b00100 : ovl_nxt_bit_mask = 32'b00010000_00000000_00000000_00000000;
          5'b00101 : ovl_nxt_bit_mask = 32'b00100000_00000000_00000000_00000000;
          5'b00110 : ovl_nxt_bit_mask = 32'b01000000_00000000_00000000_00000000;
          5'b00111 : ovl_nxt_bit_mask = 32'b10000000_00000000_00000000_00000000;
          5'b01000 : ovl_nxt_bit_mask = 32'b00000000_00000001_00000000_00000000;
          5'b01001 : ovl_nxt_bit_mask = 32'b00000000_00000010_00000000_00000000;
          5'b01010 : ovl_nxt_bit_mask = 32'b00000000_00000100_00000000_00000000;
          5'b01011 : ovl_nxt_bit_mask = 32'b00000000_00001000_00000000_00000000;
          5'b01100 : ovl_nxt_bit_mask = 32'b00000000_00010000_00000000_00000000;
          5'b01101 : ovl_nxt_bit_mask = 32'b00000000_00100000_00000000_00000000;
          5'b01110 : ovl_nxt_bit_mask = 32'b00000000_01000000_00000000_00000000;
          5'b01111 : ovl_nxt_bit_mask = 32'b00000000_10000000_00000000_00000000;
          5'b10000 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000001_00000000;
          5'b10001 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000010_00000000;
          5'b10010 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000100_00000000;
          5'b10011 : ovl_nxt_bit_mask = 32'b00000000_00000000_00001000_00000000;
          5'b10100 : ovl_nxt_bit_mask = 32'b00000000_00000000_00010000_00000000;
          5'b10101 : ovl_nxt_bit_mask = 32'b00000000_00000000_00100000_00000000;
          5'b10110 : ovl_nxt_bit_mask = 32'b00000000_00000000_01000000_00000000;
          5'b10111 : ovl_nxt_bit_mask = 32'b00000000_00000000_10000000_00000000;
          5'b11000 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00000001;
          5'b11001 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00000010;
          5'b11010 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00000100;
          5'b11011 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00001000;
          5'b11100 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00010000;
          5'b11101 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_00100000;
          5'b11110 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_01000000;
          5'b11111 : ovl_nxt_bit_mask = 32'b00000000_00000000_00000000_10000000;
          default  : ovl_nxt_bit_mask = {32{1'bx}};
        endcase
        end
  end

  // Register bit mask for data phase
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    ovl_reg_bit_mask <= {32{1'b0}};
  else if (HREADYS)
    ovl_reg_bit_mask <= ovl_nxt_bit_mask;
  end

  // Check mapping of HSIZE is handled correctly
  reg  [2:0]  ovl_reg_hsize_data_phase;

  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    ovl_reg_hsize_data_phase <= 3'b000;
  else if (HREADYS)
    ovl_reg_hsize_data_phase <= HSIZES;
  end

   // Create expected bit band alias read data
   reg  [31:0] ovl_expected_bit_band_read_data;

   always @(BIGENDIAN or ovl_reg_bit_mask or HRDATAM or ovl_reg_hsize_data_phase)
   begin
     if (BIGENDIAN==1'b0) // little endian
       begin
       if ((HRDATAM & ovl_reg_bit_mask)==32'h00000000)
         ovl_expected_bit_band_read_data = 32'h00000000;
       else
         ovl_expected_bit_band_read_data = 32'h00000001;
       end
     else
       begin
       if ((HRDATAM & ovl_reg_bit_mask)==32'h00000000)
         ovl_expected_bit_band_read_data = 32'h00000000;
       else
         begin
         case (ovl_reg_hsize_data_phase[1:0])
           2'b00  : ovl_expected_bit_band_read_data = 32'h00000001; // byte, bigend
           2'b01  : ovl_expected_bit_band_read_data = 32'h00000100; // hword, bigend
           default: ovl_expected_bit_band_read_data = 32'h01000000; // word, bigend
         endcase
         end
       end
   end

   // Check return data in bit band alias read
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
     "Check data return for bit-band alias read")
   u_ovl_bb_alias_read_result_check
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_bb_read_data_phase & HREADYOUTS & (~HRESPS)),
      .consequent_expr(HRDATAS == ovl_expected_bit_band_read_data )
      );

   // Create signal to check bit band alias write
   reg  [31:0] ovl_reg_saved_bit_band_read_data;
   wire        ovl_save_bit_band_read_data =
               ovl_reg_rmw_data_phase_1 & HREADYOUTM;

   always @(posedge HCLK or negedge HRESETn)
   begin
   if (~HRESETn)
     ovl_reg_saved_bit_band_read_data <= {32{1'b0}};
   else if (ovl_save_bit_band_read_data)
     ovl_reg_saved_bit_band_read_data <= HRDATAM;
   end

   // This signal tell which byte we should look at when a bit-band read/write
   // is carried out.  For read, we will need to set
   //     HRDATAS = <read_bit_value> << (byte_number_dp*8)
   // For write, we will need to extract
   //     <write_bit_value> = (HWDATAS >> (byte_number_dp*8)) & 1
   // Little endian
   wire [1:0] ovl_be_byte_num_addr_phase = (HSIZES[1:0] == 2'b00) ? HADDRS[1:0] :
     (HSIZES[1:0] == 2'b01) ? { HADDRS[1], 1'b1} :
     2'b11;

   reg  [1:0]  ovl_be_byte_num_data_phase;

   // Registering for data phase
   always @(posedge HCLK or negedge HRESETn)
     begin
     if (~HRESETn)
       ovl_be_byte_num_data_phase <= 2'b00;
     else if (HREADYS)
       ovl_be_byte_num_data_phase <= ovl_be_byte_num_addr_phase;
     end

  // Extract write bit value for read modify write
  wire  ovl_write_bit_value = ((ovl_be_byte_num_data_phase==2'b00) & HWDATAS[0]) |
                              ((ovl_be_byte_num_data_phase==2'b01) & HWDATAS[8]) |
                              ((ovl_be_byte_num_data_phase==2'b10) & HWDATAS[16]) |
                              ((ovl_be_byte_num_data_phase==2'b11) & HWDATAS[24]);

   // See if we are going to set or clear a bit in the RMW operation
   wire   ovl_bb_rmw_setbit = ovl_reg_rmw_data_phase_2 &
                              (((BIGENDIAN==1'b0) & (HWDATAS[0]==1'b1)) |
                               ((BIGENDIAN==1'b1) & ovl_write_bit_value));

   reg  [31:0] ovl_expected_bit_band_write_data;

   always @(ovl_reg_saved_bit_band_read_data or ovl_bb_rmw_setbit
         or ovl_reg_bit_mask)
     begin
     if (ovl_bb_rmw_setbit==1'b1) // Operation is setting a bit
       ovl_expected_bit_band_write_data =
         ovl_reg_saved_bit_band_read_data | ovl_reg_bit_mask;
     else // Operation is clearing a bit
       ovl_expected_bit_band_write_data =
         ovl_reg_saved_bit_band_read_data & (~ovl_reg_bit_mask);
     end

   // Check write data in bit band alias write
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Check data write for bit-band alias write")
   u_ovl_bb_alias_write_data_check
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_rmw_data_phase_2 & HREADYOUTM & (~HRESPM)),
      .consequent_expr(HWDATAM == ovl_expected_bit_band_write_data )
      );

   // Check HADDRM during bit-band read/write oepration in first phase
   wire [31:0] ovl_expected_haddr_phase_1;
   reg  [31:0] ovl_expected_haddr_phase_2;
   assign ovl_expected_haddr_phase_1[31:20] = (HADDRS[30]) ? 12'h400 : 12'h200;
   assign ovl_expected_haddr_phase_1[19: 2] =  HADDRS[24:7];
   assign ovl_expected_haddr_phase_1[    1] =  HADDRS[6] & (~HSIZES[1]);
   assign ovl_expected_haddr_phase_1[    0] =  HADDRS[5] & (HSIZES[1:0]==2'b00);

   always @(posedge HCLK or negedge HRESETn)
   begin
   if (~HRESETn)
     ovl_expected_haddr_phase_2 <= {32{1'b0}};
   else if (HREADYS)
     ovl_expected_haddr_phase_2 <= ovl_expected_haddr_phase_1;
   end

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Check address for bit-band alias access phase 1")
   u_ovl_bb_alias_address_phase_1
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_bb_alias_address_phase & HREADYS),
      .consequent_expr( HADDRM==ovl_expected_haddr_phase_1)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Check address for bit-band alias access phase 2 (data phase 1)")
   u_ovl_bb_alias_address_phase_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_rmw_data_phase_1 & (~HRESPM)),
      .consequent_expr(HADDRM==ovl_expected_haddr_phase_2)
      );


   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Check HSIZE for bit-band alias access phase 1")
   u_ovl_bb_alias_hsize_phase_1
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_bb_alias_address_phase & HREADYS),
      .consequent_expr( HSIZEM==HSIZES)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Check HSIZE for bit-band alias access phase 2 (data phase 1)")
   u_ovl_bb_alias_hsize_phase_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_rmw_data_phase_1 & (~HRESPM)),
      .consequent_expr( HSIZEM==ovl_reg_hsize_data_phase)
      );

   // Detect read/write access to bit band alias which are not word aligned
   // This is NOT an RTL design issue. This is a software issue.

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Check bit band read/write accesses to non word aligned bit band alias address")
   u_ovl_bb_alias_haddr_non_word_aligned
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_bb_alias_address_phase & HREADYS),
      .consequent_expr(HADDRS[1:0]==2'b00)
      );

`endif

endmodule
