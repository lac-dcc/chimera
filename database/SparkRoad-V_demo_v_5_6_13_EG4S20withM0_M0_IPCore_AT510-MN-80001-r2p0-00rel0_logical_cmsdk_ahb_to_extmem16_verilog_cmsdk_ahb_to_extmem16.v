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
//      Checked In          : $Date: 2013-01-09 18:19:45 +0000 (Wed, 09 Jan 2013) $
//
//      Revision            : $Revision: 233164 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : AHB to external memory interface
//-----------------------------------------------------------------------------
// Support 16-bit and 8-bit memory devices only
//
module cmsdk_ahb_to_extmem16 #(
  // Parameter to define address width
  // 16 = 64KByte memory
  parameter  AW = 16)
 (
// --------------------------------------------------------------------------
// Port Definitions
// --------------------------------------------------------------------------
  input  wire          HCLK,    // Clock
  input  wire          HRESETn, // Reset
  input  wire          HSEL,    // Device select
  input  wire [AW-1:0] HADDR,   // Address
  input  wire    [1:0] HTRANS,  // Transfer control
  input  wire    [2:0] HSIZE,   // Transfer size
  input  wire          HWRITE,  // Write control
  input  wire   [31:0] HWDATA,  // Write data
  input  wire          HREADY,  // Transfer phase done
  output wire          HREADYOUT, // Device ready
  output wire   [31:0] HRDATA,  // Read data output
  output wire          HRESP,   // Device response (always OKAY)

  // Static configuration
  input  wire    [2:0] CFGREADCYCLE,    // Read cycles
  input  wire    [2:0] CFGWRITECYCLE,   // Write cycles
  input  wire    [2:0] CFGTURNAROUNDCYCLE,    // Turn around cycles
  input  wire          CFGSIZE, // port size (0=8-bit, 1=16-bit)

  input  wire   [15:0] DATAIN,  // Data input

  output wire [AW-1:0] ADDR,    // Address output
  output wire   [15:0] DATAOUT, // Data output
  output wire          DATAOEn, // Tristate buffer output enable

  output wire          WEn,     // Write Controls
  output wire          OEn,     // Output enable (read)
  output wire          CEn,     // Chip enable
  output wire          LBn,     // Lower byte enable
  output wire          UBn);    // Upper byte enable

  // --------------------------------------------------------------------------
  // Internal wires
  // --------------------------------------------------------------------------
  wire            RDREQ;   // Read request to memory i/f FSM
  wire            WRREQ;   // Write request to memory i/f FSM
  wire            DONE;    // memory i/f FSM done
  wire      [1:0] NXTBYTEMASK; // Early byte mask from AHB FSM to memory i/f FSM

  wire      [2:0] MEMFSMSTATE; // Memory Interface Finite State Machine
  wire      [2:0] BUSFSMSTATE; // Bus Interface Finite State Machine

  // Handshaking between AHB FSM (ahb_fsm) and Memory Interface FSM (mem_fsm):
  //
  // Single stage operation (e.g. 16-bit transfers on 16-bit memory)
  //                     _________
  //   RDREQ/WRREQ _____|        |________
  //                              _____
  //   DONE        ______________|    |___
  //
  // Multiple stage operation (e.g. 32-bit on 8-bit memory)
  //                     _______________________________________
  //   RDREQ/WRREQ _____|        |         |         |         |_________
  //                              _____     _____     _____     _____
  //   DONE        ______________|    |____|    |____|    |____|    |____
  //
  // The request signals (RDREQ/WRREQ) are dependent on current DONE signal.
  // If request and done are asserted at the same time, it means a new transfer
  // is requested.
  //
  //        RDREQ/WRREQ    DONE    Meaning
  //            0            0      Idle
  //            1            0      A request occurred or the request is on progress
  //            0            1      The memory interface completed the request,
  //                                and no more request pending.
  //            1            1      The memory interface completed the request,
  //                                and a new request pending.
  // --------------------------------------------------------------------------
  // Start of main code
  // --------------------------------------------------------------------------
  // State machine to split a transfer into multiple memory transfer
  // Also handle data routing
  cmsdk_ahb_to_extmem16_ahb_fsm
    #(.AW (AW))
      u_ahb_to_extmem16_ahb_fsm (
    .HCLK         (HCLK),
    .HRESETn      (HRESETn),
    .HSEL         (HSEL),
    .HADDR        (HADDR),
    .HTRANS       (HTRANS),
    .HSIZE        (HSIZE),
    .HWRITE       (HWRITE),
    .HREADY       (HREADY),
    .HWDATA       (HWDATA),

    .HREADYOUT    (HREADYOUT),
    .HRDATA       (HRDATA),
    .HRESP        (HRESP),

    .CFGSIZE      (CFGSIZE),

    .ADDR         (ADDR),
    .DATAOUT      (DATAOUT),
    .DATAIN       (DATAIN),

    .RDREQ        (RDREQ),
    .WRREQ        (WRREQ),
    .NXTBYTEMASK  (NXTBYTEMASK),
    .DONE         (DONE),

    .BUSFSMSTATE  (BUSFSMSTATE)
    );

  // State machine to control each memory transfer
  // (memory control signal generation)
  cmsdk_ahb_to_extmem16_mem_fsm
    u_ahb_to_extmem16_mem_fsm (
    .HCLK         (HCLK),
    .HRESETn      (HRESETn),

    .RDREQ        (RDREQ),
    .WRREQ        (WRREQ),
    .NXTBYTEMASK  (NXTBYTEMASK),
    .DONE         (DONE),

    .CFGREADCYCLE         (CFGREADCYCLE),
    .CFGWRITECYCLE        (CFGWRITECYCLE),
    .CFGTURNAROUNDCYCLE   (CFGTURNAROUNDCYCLE),

    .DATAOEn      (DATAOEn),
    .WEn          (WEn),
    .OEn          (OEn),
    .CEn          (CEn),
    .LBn          (LBn),
    .UBn          (UBn),

    .MEMFSMSTATE  (MEMFSMSTATE)
  );

`ifdef ARM_AHB_ASSERT_ON
   // ------------------------------------------------------------
   // Assertions
   // ------------------------------------------------------------
`include "std_ovl_defines.h"

  // FSM state encodings
  localparam BUSCNV_FSM_DEF      = 3'b000;
  localparam BUSCNV_FSM_32BIT_8A = 3'b001;
  localparam BUSCNV_FSM_32BIT_8B = 3'b011;
  localparam BUSCNV_FSM_32BIT_8C = 3'b010;
  localparam BUSCNV_FSM_32BIT_16 = 3'b100;
  localparam BUSCNV_FSM_16BIT_8  = 3'b101;

  localparam EXTMEM_FSM_IDLE   = 3'b000;
  localparam EXTMEM_FSM_WRITE1 = 3'b001;
  localparam EXTMEM_FSM_WRITE2 = 3'b011;
  localparam EXTMEM_FSM_WRITE3 = 3'b010;
  localparam EXTMEM_FSM_READ1  = 3'b100;

  // Configuration should be stable during operations
  reg             ovl_last_cfgsize;
  reg       [2:0] ovl_last_cfgreadcycle;
  reg       [2:0] ovl_last_cfgwritecycle;
  reg       [2:0] ovl_last_cfgturnaroundcycle;
  reg    [AW-1:0] ovl_last_addr;
  reg             ovl_last_wen;
  reg             ovl_last_lbn;
  reg             ovl_last_ubn;

  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      begin
      ovl_last_cfgsize        <= 1'b0;
      ovl_last_cfgreadcycle   <= {3{1'b0}};
      ovl_last_cfgwritecycle  <= {3{1'b0}};
      ovl_last_cfgturnaroundcycle <= {3{1'b0}};
      ovl_last_addr           <= {AW{1'b0}};
      ovl_last_wen            <= 1'b1;
      ovl_last_lbn            <= 1'b1;
      ovl_last_ubn            <= 1'b1;
      end
    else
      begin
      ovl_last_cfgsize        <= CFGSIZE;
      ovl_last_cfgreadcycle   <= CFGREADCYCLE;
      ovl_last_cfgwritecycle  <= CFGWRITECYCLE;
      ovl_last_cfgturnaroundcycle <= CFGTURNAROUNDCYCLE;
      ovl_last_addr           <= ADDR;
      ovl_last_wen            <= WEn;
      ovl_last_lbn            <= LBn;
      ovl_last_ubn            <= UBn;
      end
    end

  // Assumptions: CFGSIZE must not change during operation
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "CFGSIZE should be stable during operation")
   u_ovl_cfgsize_stable_check
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((MEMFSMSTATE==EXTMEM_FSM_READ1)|
                       (MEMFSMSTATE==EXTMEM_FSM_WRITE1)|
                       (MEMFSMSTATE==EXTMEM_FSM_WRITE2)|
                       (MEMFSMSTATE==EXTMEM_FSM_WRITE3)|
                        RDREQ | WRREQ),
      .consequent_expr(CFGSIZE==ovl_last_cfgsize)
      );

  // Assumptions: CFGREADCYCLE must not change during operation
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "CFGREADCYCLE should be stable during read operation")
   u_ovl_cfgreadcycle_stable_check
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((MEMFSMSTATE==EXTMEM_FSM_READ1)),
      .consequent_expr(CFGREADCYCLE==ovl_last_cfgreadcycle)
      );

  // Assumptions: CFGWRITECYCLE must not change during operation
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "CFGWRITECYCLE should be stable during write operation")
   u_ovl_cfgwritecycle_stable_check
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((MEMFSMSTATE==EXTMEM_FSM_WRITE1)|
                       (MEMFSMSTATE==EXTMEM_FSM_WRITE2)|
                       (MEMFSMSTATE==EXTMEM_FSM_WRITE3)),
      .consequent_expr(CFGWRITECYCLE==ovl_last_cfgwritecycle)
      );

  // Assumptions: CFGTURNAROUNDCYCLE must not change during operation
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "CFGTURNAROUNDCYCLE should be stable during operation")
   u_ovl_cfgturnaroundcycle_stable_check
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(RDREQ|WRREQ),
      .consequent_expr(CFGTURNAROUNDCYCLE==ovl_last_cfgturnaroundcycle)
      );

  // Address output should not change when WEn is active
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Address output should be stable during write operation")
   u_ovl_address_stable_check_write
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((WEn==1'b0)|(ovl_last_wen==1'b0)),
      .consequent_expr(ADDR==ovl_last_addr)
      );

  //  LBn and UBn should not change when WEn is active
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "WEn output should be stable during write operation")
   u_ovl_byte_enable_stable_check_write
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((WEn==1'b0)|(ovl_last_wen==1'b0)),
      .consequent_expr((LBn==ovl_last_lbn) & (UBn==ovl_last_ubn))
      );

  // Should not have 16-bit write on memory when CFGSIZE is 0
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "16-bit access when CFGSIZE is 8-bit")
   u_ovl_illegal_size
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((UBn==1'b0)&(CFGSIZE==1'b0)));

  // Generate Data phase address and size information
  reg     [1:0]  ovl_reg_hsize;
  reg  [AW-1:0]  ovl_reg_haddr;
  reg            ovl_reg_dataphase;
  wire           ovl_nxt_dataphase;

  assign ovl_nxt_dataphase = HSEL & HTRANS[1];

  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      begin
      ovl_reg_hsize        <= 2'b00;
      ovl_reg_haddr        <= {AW{1'b0}};
      ovl_reg_dataphase    <= 1'b0;
      end
    else if (HREADY)
      begin
      ovl_reg_hsize        <= HSIZE[1:0];
      ovl_reg_haddr        <= HADDR;
      ovl_reg_dataphase    <= ovl_nxt_dataphase;
      end
    end

  // Address mapping
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Address mapping:Byte transfer on 8-bit memory")
   u_ovl_addr_map_8bit_memory_byte
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b0) & (ovl_reg_hsize==2'b00)),
      .consequent_expr(ADDR==ovl_reg_haddr)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Address mapping:16-bit transfer on 8-bit memory, part 1")
   u_ovl_addr_map_8bit_memory_half_word_1
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b0) & (ovl_reg_hsize==2'b01) &
      (BUSFSMSTATE==BUSCNV_FSM_16BIT_8)),
      .consequent_expr(ADDR==ovl_reg_haddr)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Address mapping:16-bit transfer on 8-bit memory, part 2")
   u_ovl_addr_map_8bit_memory_half_word_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b0) & (ovl_reg_hsize==2'b01) &
      (BUSFSMSTATE==BUSCNV_FSM_DEF)),
      .consequent_expr((ADDR[AW-1:1]==ovl_reg_haddr[AW-1:1])&(ADDR[0]==1'b1))
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Address mapping:32-bit transfer on 8-bit memory, part 1")
   u_ovl_addr_map_8bit_memory_word_1
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b0) & (ovl_reg_hsize==2'b10) &
      (BUSFSMSTATE==BUSCNV_FSM_32BIT_8A)),
      .consequent_expr(ADDR==ovl_reg_haddr)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Address mapping:32-bit transfer on 8-bit memory, part 2")
   u_ovl_addr_map_8bit_memory_word_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b0) & (ovl_reg_hsize==2'b10) &
      (BUSFSMSTATE==BUSCNV_FSM_32BIT_8B)),
      .consequent_expr((ADDR[AW-1:2]==ovl_reg_haddr[AW-1:2])&(ADDR[1:0]==2'b01))
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Address mapping:32-bit transfer on 8-bit memory, part 3")
   u_ovl_addr_map_8bit_memory_word_3
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b0) & (ovl_reg_hsize==2'b10) &
      (BUSFSMSTATE==BUSCNV_FSM_32BIT_8C)),
      .consequent_expr((ADDR[AW-1:2]==ovl_reg_haddr[AW-1:2])&(ADDR[1:0]==2'b10))
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Address mapping:32-bit transfer on 8-bit memory, part 4")
   u_ovl_addr_map_8bit_memory_word_4
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b0) & (ovl_reg_hsize==2'b10) &
      (BUSFSMSTATE==BUSCNV_FSM_DEF)),
      .consequent_expr((ADDR[AW-1:2]==ovl_reg_haddr[AW-1:2])&(ADDR[1:0]==2'b11))
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Address mapping:Byte transfer on 16-bit memory")
   u_ovl_addr_map_16bit_memory_byte
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b1) & (ovl_reg_hsize==2'b00)),
      .consequent_expr(ADDR==ovl_reg_haddr)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Address mapping:Halfword transfer on 16-bit memory")
   u_ovl_addr_map_16bit_memory_halfword
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b1) & (ovl_reg_hsize==2'b01)),
      .consequent_expr(ADDR==ovl_reg_haddr)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Address mapping:Word transfer on 16-bit memory, part 1")
   u_ovl_addr_map_16bit_memory_word_1
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b1) & (ovl_reg_hsize==2'b10) &
      (BUSFSMSTATE==BUSCNV_FSM_32BIT_16)),
      .consequent_expr(ADDR==ovl_reg_haddr)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Address mapping:Word transfer on 16-bit memory, part 2")
   u_ovl_addr_map_16bit_memory_word_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b1) & (ovl_reg_hsize==2'b10) &
      (BUSFSMSTATE==BUSCNV_FSM_DEF)),
      .consequent_expr((ADDR[AW-1:2]==ovl_reg_haddr[AW-1:2])&(ADDR[1:0]==2'b10))
      );

  // FSM check
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "FSM check:Byte transfer on 8-bit memory")
   u_ovl_fsm_chk_8bit_memory_byte
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b0) & (ovl_reg_hsize==2'b00)),
      .consequent_expr(BUSFSMSTATE==BUSCNV_FSM_DEF)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "FSM check:Halfword transfer on 16-bit memory")
   u_ovl_fsm_chk_16bit_memory_halfword
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b1) & (ovl_reg_hsize==2'b01)),
      .consequent_expr(BUSFSMSTATE==BUSCNV_FSM_DEF)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "FSM check:Byte transfer on 16-bit memory")
   u_ovl_fsm_chk_16bit_memory_byte
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_dataphase) & (CFGSIZE==1'b1) & (ovl_reg_hsize==2'b00)),
      .consequent_expr(BUSFSMSTATE==BUSCNV_FSM_DEF)
      );


  // Note: Data routing cannot be tested with OVL because data value can be X



`endif

endmodule


