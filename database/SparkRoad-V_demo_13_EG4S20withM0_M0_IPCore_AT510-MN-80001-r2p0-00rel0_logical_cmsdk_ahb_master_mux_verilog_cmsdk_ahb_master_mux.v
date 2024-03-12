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
//      Checked In          : $Date: 2013-04-05 16:06:17 +0100 (Fri, 05 Apr 2013) $
//
//      Revision            : $Revision: 243003 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Three to One AHB master multiplexer
//-----------------------------------------------------------------------------
// This block allows up to three bus masters to connect to an AHB slave.
// Each slave port for master connection (S0, S1, S2) can be disabled by
// parameter if not used.
// Port 0 and Port 1 are same priority - and use round robin arbitration.
// Port 2 is higher priority.

module cmsdk_ahb_master_mux #(
  // Parameters to enable/disable ports
  parameter PORT0_ENABLE=1,
  parameter PORT1_ENABLE=1,
  parameter PORT2_ENABLE=1,
  parameter DW=32)
 (
  // --------------------------------------------------------------------------------
  // I/O declaration
  // --------------------------------------------------------------------------------

  input  wire          HCLK,       // Clock
  input  wire          HRESETn,    // Reset

  // AHB connection to master #0
  input  wire          HSELS0,
  input  wire [31:0]   HADDRS0,
  input  wire  [1:0]   HTRANSS0,
  input  wire  [2:0]   HSIZES0,
  input  wire          HWRITES0,
  input  wire          HREADYS0,
  input  wire  [3:0]   HPROTS0,
  input  wire  [2:0]   HBURSTS0,
  input  wire          HMASTLOCKS0,
  input  wire [DW-1:0] HWDATAS0,

  output wire          HREADYOUTS0,
  output wire          HRESPS0,
  output wire [DW-1:0] HRDATAS0,

  // AHB connection to master #1
  input  wire          HSELS1,
  input  wire [31:0]   HADDRS1,
  input  wire  [1:0]   HTRANSS1,
  input  wire  [2:0]   HSIZES1,
  input  wire          HWRITES1,
  input  wire          HREADYS1,
  input  wire  [3:0]   HPROTS1,
  input  wire  [2:0]   HBURSTS1,
  input  wire          HMASTLOCKS1,
  input  wire [DW-1:0] HWDATAS1,

  output wire          HREADYOUTS1,
  output wire          HRESPS1,
  output wire [DW-1:0] HRDATAS1,

  // AHB connection to master #2
  input  wire          HSELS2,
  input  wire [31:0]   HADDRS2,
  input  wire  [1:0]   HTRANSS2,
  input  wire  [2:0]   HSIZES2,
  input  wire          HWRITES2,
  input  wire          HREADYS2,
  input  wire  [3:0]   HPROTS2,
  input  wire  [2:0]   HBURSTS2,
  input  wire          HMASTLOCKS2,
  input  wire [DW-1:0] HWDATAS2,

  output wire          HREADYOUTS2,
  output wire          HRESPS2,
  output wire [DW-1:0] HRDATAS2,

  // AHB output master port
  output wire          HSELM,
  output wire [31:0]   HADDRM,
  output wire  [1:0]   HTRANSM,
  output wire  [2:0]   HSIZEM,
  output wire          HWRITEM,
  output wire          HREADYM,
  output wire  [3:0]   HPROTM,
  output wire  [2:0]   HBURSTM,
  output wire          HMASTLOCKM,
  output wire [DW-1:0] HWDATAM,

  input  wire          HREADYOUTM,
  input  wire          HRESPM,
  input  wire [DW-1:0] HRDATAM,

  output wire  [1:0]   HMASTERM); // Indicate which master is currently selected
                                  // (address phase)
  // --------------------------------------------------------------------------------
  // Derived parameters

  localparam       HSIZE_W   = (DW > 64) ? 3 : 2; // Width of HSIZE that need to be stored
  localparam       HSIZE_MAX = HSIZE_W - 1;       // MSB of HSIZE register

  // ----------------------------------------
  // Internal wires declarations
  reg     [2:0] mux_sel_addr_phase; // Address phase select signal (one hot)
  reg     [2:0] mux_sel_data_phase; // Data phase select signal (one hot)
  reg     [2:0] mux_sel_addr_phase_reg; // Last mux_sel_addr_phase
  wire    [2:0] bus_request;      //  Bus transfer request from each master

  // Input stage #0
  wire          port_s0_trans_valid;
  wire          port_s0_input_hold;
  reg           port_s0_hold_active;
  wire          nxt_port_s0_hold_active;

  reg   [31:0]  haddr_s0_reg;    // Input buffer signals
  reg           htrans_s0_reg;   // HTRANS buffer:only bit 0 is needed because bit 1 is always 1
  reg           hwrite_s0_reg;
  reg    [HSIZE_MAX:0]  hsize_s0_reg;
  reg    [3:0]  hprot_s0_reg;
  reg    [2:0]  hburst_s0_reg;
  reg           hmastlock_s0_reg;

  // Input stage #0  results
  wire  [31:0]  haddr_s0_ips;
  wire   [1:0]  htrans_s0_ips;
  wire          hwrite_s0_ips;
  wire   [HSIZE_MAX:0]  hsize_s0_ips;
  wire   [3:0]  hprot_s0_ips;
  wire   [2:0]  hburst_s0_ips;
  wire          hmastlock_s0_ips;
  wire          hready_s0_ips;

  // Input stage #1
  wire          port_s1_trans_valid;
  wire          port_s1_input_hold;
  reg           port_s1_hold_active;
  wire          nxt_port_s1_hold_active;

  reg   [31:0]  haddr_s1_reg;    // Input buffer signals
  reg           htrans_s1_reg;   // HTRANS buffer:only bit 0 is needed because bit 1 is always 1
  reg           hwrite_s1_reg;
  reg    [HSIZE_MAX:0]  hsize_s1_reg;
  reg    [3:0]  hprot_s1_reg;
  reg    [2:0]  hburst_s1_reg;
  reg           hmastlock_s1_reg;

  // Input stage #1  results
  wire  [31:0]  haddr_s1_ips;
  wire   [1:0]  htrans_s1_ips;
  wire          hwrite_s1_ips;
  wire   [HSIZE_MAX:0]  hsize_s1_ips;
  wire   [3:0]  hprot_s1_ips;
  wire   [2:0]  hburst_s1_ips;
  wire          hmastlock_s1_ips;
  wire          hready_s1_ips;

  // Input stage #2
  wire          port_s2_trans_valid;
  wire          port_s2_input_hold;
  reg           port_s2_hold_active;
  wire          nxt_port_s2_hold_active;

  reg   [31:0]  haddr_s2_reg;    // Input buffer signals
  reg           htrans_s2_reg;   // HTRANS buffer:only bit 0 is needed because bit 1 is always 1
  reg           hwrite_s2_reg;
  reg    [HSIZE_MAX:0]  hsize_s2_reg;
  reg    [3:0]  hprot_s2_reg;
  reg    [2:0]  hburst_s2_reg;
  reg           hmastlock_s2_reg;

  // Input stage #2  results
  wire  [31:0]  haddr_s2_ips;
  wire   [1:0]  htrans_s2_ips;
  wire          hwrite_s2_ips;
  wire   [HSIZE_MAX:0]  hsize_s2_ips;
  wire   [3:0]  hprot_s2_ips;
  wire   [2:0]  hburst_s2_ips;
  wire          hmastlock_s2_ips;
  wire          hready_s2_ips;

  // Master Multiplexer signals
  wire          hsel_mux;
  wire  [31:0]  haddr_mux;
  wire   [1:0]  htrans_mux;
  wire          hwrite_mux;
  wire   [HSIZE_MAX:0]  hsize_mux;
  wire   [3:0]  hprot_mux;
  wire   [2:0]  hburst_mux;
  wire          hmastlock_mux;
  wire          hready_mux;
  wire  [DW-1:0]  hwdata_mux;

  wire   [2:0]  port_enable_mask;
  reg           active_transfer_reg; // active data phase
  wire          nxt_active_transfer;

  // ----------------------------------------
  // Start of main code
    // mask signal to remove unused logic
  assign port_enable_mask[0] = (PORT0_ENABLE!=1'b0) ? 1'b1 : 1'b0;
  assign port_enable_mask[1] = (PORT1_ENABLE!=1'b0) ? 1'b1 : 1'b0;
  assign port_enable_mask[2] = (PORT2_ENABLE!=1'b0) ? 1'b1 : 1'b0;
  // ----------------------------------------
  // Port #0 Input stage

  // A transfer request is made
  assign port_s0_trans_valid = HSELS0 & HTRANSS0[1] & HREADYS0;
  // A transfer needs to be held
  assign port_s0_input_hold  = port_s0_trans_valid & (~(mux_sel_addr_phase[0] & HREADYOUTM));
  // Hold the active status until the request has been transfered to slave port
  assign nxt_port_s0_hold_active = port_s0_input_hold | (port_s0_hold_active & (~(mux_sel_addr_phase[0] & HREADYOUTM)));

  // Hold active register
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      port_s0_hold_active <= 1'b0;
    else if (port_enable_mask[0])
      port_s0_hold_active <= nxt_port_s0_hold_active;
  end

  // Holding registers
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      begin
      haddr_s0_reg     <= {32{1'b0}};
      htrans_s0_reg    <= 1'b0;
      hwrite_s0_reg    <= 1'b0;
      hsize_s0_reg     <= {HSIZE_W{1'b0}};
      hprot_s0_reg     <= {4{1'b0}};
      hburst_s0_reg    <= {3{1'b0}};
      hmastlock_s0_reg <= 1'b0;
      end
    else if (port_s0_input_hold & port_enable_mask[0])
      begin
      haddr_s0_reg     <= HADDRS0;
      htrans_s0_reg    <= HTRANSS0[0];
      hwrite_s0_reg    <= HWRITES0;
      hsize_s0_reg     <= HSIZES0[HSIZE_MAX:0];
      hprot_s0_reg     <= HPROTS0;
      hburst_s0_reg    <= HBURSTS0;
      hmastlock_s0_reg <= HMASTLOCKS0;
      end
  end

  // multiplexing of input/holding registers
  assign haddr_s0_ips     = (port_s0_hold_active) ? haddr_s0_reg    : HADDRS0;
  assign htrans_s0_ips    = (port_s0_hold_active) ? {1'b1, htrans_s0_reg}: HTRANSS0;
  assign hwrite_s0_ips    = (port_s0_hold_active) ? hwrite_s0_reg   : HWRITES0;
  assign hsize_s0_ips     = (port_s0_hold_active) ? hsize_s0_reg    : HSIZES0[HSIZE_MAX:0];
  assign hprot_s0_ips     = (port_s0_hold_active) ? hprot_s0_reg    : HPROTS0;
  assign hburst_s0_ips    = (port_s0_hold_active) ? hburst_s0_reg   : HBURSTS0;
  assign hmastlock_s0_ips = (port_s0_hold_active) ? hmastlock_s0_reg: HMASTLOCKS0;
  assign hready_s0_ips    = (port_s0_hold_active) ? 1'b1            : HREADYS0;

  // Result to master
    // Wait state generated if transfer request held in hold buffer, or
    // Data phase select active and HREADYOUTM is low, otherwise HREADYOUT is 1
  assign HREADYOUTS0 = (~port_s0_hold_active) &
                       ((mux_sel_data_phase[0]) ? HREADYOUTM : 1'b1);
  assign HRESPS0     = ((mux_sel_data_phase[0]) ? HRESPM     : 1'b0);
  assign HRDATAS0    =                            HRDATAM;

  // ----------------------------------------
  // Port #1 Input stage

  // A transfer request is made
  assign port_s1_trans_valid = HSELS1 & HTRANSS1[1] & HREADYS1;
  // A transfer needs to be held
  assign port_s1_input_hold  = port_s1_trans_valid & (~(mux_sel_addr_phase[1] & HREADYOUTM));
  // Hold the active status until the request has been transfered to slave port
  assign nxt_port_s1_hold_active = port_s1_input_hold | (port_s1_hold_active & (~(mux_sel_addr_phase[1] & HREADYOUTM)));

  // Hold active register
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      port_s1_hold_active <= 1'b0;
    else if (port_enable_mask[1])
      port_s1_hold_active <= nxt_port_s1_hold_active;
  end

  // Holding registers
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      begin
      haddr_s1_reg     <= {32{1'b0}};
      htrans_s1_reg    <= 1'b0;
      hwrite_s1_reg    <= 1'b0;
      hsize_s1_reg     <= {HSIZE_W{1'b0}};
      hprot_s1_reg     <= {4{1'b0}};
      hburst_s1_reg    <= {3{1'b0}};
      hmastlock_s1_reg <= 1'b0;
      end
    else if (port_s1_input_hold & port_enable_mask[1])
      begin
      haddr_s1_reg     <= HADDRS1;
      htrans_s1_reg    <= HTRANSS1[0];
      hwrite_s1_reg    <= HWRITES1;
      hsize_s1_reg     <= HSIZES1[HSIZE_MAX:0];
      hprot_s1_reg     <= HPROTS1;
      hburst_s1_reg    <= HBURSTS1;
      hmastlock_s1_reg <= HMASTLOCKS1;
      end
  end

  // multiplexing of input/holding registers
  assign haddr_s1_ips     = (port_s1_hold_active) ? haddr_s1_reg    : HADDRS1;
  assign htrans_s1_ips    = (port_s1_hold_active) ? {1'b1, htrans_s1_reg}: HTRANSS1;
  assign hwrite_s1_ips    = (port_s1_hold_active) ? hwrite_s1_reg   : HWRITES1;
  assign hsize_s1_ips     = (port_s1_hold_active) ? hsize_s1_reg    : HSIZES1[HSIZE_MAX:0];
  assign hprot_s1_ips     = (port_s1_hold_active) ? hprot_s1_reg    : HPROTS1;
  assign hburst_s1_ips    = (port_s1_hold_active) ? hburst_s1_reg   : HBURSTS1;
  assign hmastlock_s1_ips = (port_s1_hold_active) ? hmastlock_s1_reg: HMASTLOCKS1;
  assign hready_s1_ips    = (port_s1_hold_active) ? 1'b1            : HREADYS1;

  // Result to master
    // Wait state generated if transfer request held in hold buffer, or
    // Data phase select active and HREADYOUTM is low, otherwise HREADYOUT is 1
  assign HREADYOUTS1 = (~port_s1_hold_active) &
                       ((mux_sel_data_phase[1]) ? HREADYOUTM : 1'b1);
  assign HRESPS1     = ((mux_sel_data_phase[1]) ? HRESPM     : 1'b0);
  assign HRDATAS1    =                            HRDATAM;

  // ----------------------------------------
  // Port #2 Input stage

  // A transfer request is made
  assign port_s2_trans_valid = HSELS2 & HTRANSS2[1] & HREADYS2;

  // A transfer need to be hold
  assign port_s2_input_hold  = port_s2_trans_valid & (~(mux_sel_addr_phase[2] & HREADYOUTM));

  // Hold the active status until the request has been transfered to slave port
  assign nxt_port_s2_hold_active = port_s2_input_hold | (port_s2_hold_active & (~(mux_sel_addr_phase[2] & HREADYOUTM)));

  // Hold active register
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      port_s2_hold_active <= 1'b0;
    else if (port_enable_mask[2])
      port_s2_hold_active <= nxt_port_s2_hold_active;
  end

  // Holding registers
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      begin
      haddr_s2_reg     <= {32{1'b0}};
      htrans_s2_reg    <= 1'b0;
      hwrite_s2_reg    <= 1'b0;
      hsize_s2_reg     <= {HSIZE_W{1'b0}};
      hprot_s2_reg     <= {4{1'b0}};
      hburst_s2_reg    <= {3{1'b0}};
      hmastlock_s2_reg <= 1'b0;
      end
    else if (port_s2_input_hold & port_enable_mask[2])
      begin
      haddr_s2_reg     <= HADDRS2;
      htrans_s2_reg    <= HTRANSS2[0];
      hwrite_s2_reg    <= HWRITES2;
      hsize_s2_reg     <= HSIZES2[HSIZE_MAX:0];
      hprot_s2_reg     <= HPROTS2;
      hburst_s2_reg    <= HBURSTS2;
      hmastlock_s2_reg <= HMASTLOCKS2;
      end
  end

  // multiplexing of input/holding registers
  assign haddr_s2_ips     = (port_s2_hold_active) ? haddr_s2_reg    : HADDRS2;
  assign htrans_s2_ips    = (port_s2_hold_active) ? {1'b1, htrans_s2_reg}: HTRANSS2;
  assign hwrite_s2_ips    = (port_s2_hold_active) ? hwrite_s2_reg   : HWRITES2;
  assign hsize_s2_ips     = (port_s2_hold_active) ? hsize_s2_reg    : HSIZES2[HSIZE_MAX:0];
  assign hprot_s2_ips     = (port_s2_hold_active) ? hprot_s2_reg    : HPROTS2;
  assign hburst_s2_ips    = (port_s2_hold_active) ? hburst_s2_reg   : HBURSTS2;
  assign hmastlock_s2_ips = (port_s2_hold_active) ? hmastlock_s2_reg: HMASTLOCKS2;
  assign hready_s2_ips    = (port_s2_hold_active) ? 1'b1            : HREADYS2;

  // Result to master
    // Wait state generated if transfer request held in hold buffer, or
    // Data phase select active and HREADYOUTM is low, otherwise HREADYOUT is 1
  assign HREADYOUTS2 = (~port_s2_hold_active) &
                       ((mux_sel_data_phase[2]) ? HREADYOUTM : 1'b1);
  assign HRESPS2     = ((mux_sel_data_phase[2]) ? HRESPM     : 1'b0);
  assign HRDATAS2    =                            HRDATAM;

  // ----------------------------------------
  // Arbiter stage

  // Determine cases where it must not switch over
        // 1) Transfer is announced on the bus in last cycle but HREADY (HREADYM to slaves) was low
        wire   trans_announced_stalled = hsel_mux & htrans_mux[1] & (~hready_mux);
        reg    trans_announced_stalled_reg;

        always @(posedge HCLK or negedge HRESETn)
          begin
          if (~HRESETn)
            trans_announced_stalled_reg <= 1'b0;
          else
            trans_announced_stalled_reg <= trans_announced_stalled;
          end

        // 2) Locked transfer (dataphase HMASTLOCK is 1)
        //    - Sample at address phase
        wire   locked_active_trans = hsel_mux & hmastlock_mux;
        reg    locked_active_trans_reg;

        //    - Register to data phase
        always @(posedge HCLK or negedge HRESETn)
          begin
          if (~HRESETn)
            locked_active_trans_reg <= 1'b0;
          else if (hready_mux)
            locked_active_trans_reg <= locked_active_trans;
          end

        // 3) Fixed length Burst
           // Fixed length Burst on going in port #0 and was last selected port
        wire   fixed_length_burst0 = HSELS0 & HTRANSS0[0] & (HBURSTS0[2:1] != 2'b00) & mux_sel_addr_phase_reg[0];
           // Fixed length Burst on going in port #1 and was last selected port
        wire   fixed_length_burst1 = HSELS1 & HTRANSS1[0] & (HBURSTS1[2:1] != 2'b00) & mux_sel_addr_phase_reg[1];
           // Fixed length Burst on going in port #2 and was last selected port
        wire   fixed_length_burst2 = HSELS2 & HTRANSS2[0] & (HBURSTS2[2:1] != 2'b00) & mux_sel_addr_phase_reg[2];
           // Combined burst detect
        wire   fixed_length_burst = fixed_length_burst0 | fixed_length_burst1 | fixed_length_burst2;

        // 4) Error response canceling in burst
           //  A master might switch to idle in the 2nd cycle of error response during a fixed length
           //  burst.  In this case, the cmsdk_ahb_master_mux should not switch over the bus to another
           //  master and let the idle transfer get through
        reg   reg_fixed_length_burst;  // Fixed length burst in data phase
        wire  nxt_fixed_length_burst;  // Detect of active fixed length burst
        reg   reg_fixed_length_burst_err; // Registered error detect signal during fixed length burst
        wire  nxt_fixed_length_burst_err; // Error detect signal during fixed length burst (1st cycle)

        // Detect fixed length bursts
        assign nxt_fixed_length_burst = (hburst_mux[2:1] != 2'b00) & (|htrans_mux);
        // Register information to data phase
        always @(posedge HCLK or negedge HRESETn)
          begin
          if (~HRESETn)
            reg_fixed_length_burst <= 1'b0;
          else if (hready_mux)
            reg_fixed_length_burst <= nxt_fixed_length_burst;
          end

        // Set to 1 in the first cycle of error response during a fixed length burst data phase
        assign nxt_fixed_length_burst_err = active_transfer_reg & reg_fixed_length_burst &
                                            (~HREADYOUTM) & HRESPM;

        // Delay the pulse to 2nd cycle of the error response
        always @(posedge HCLK or negedge HRESETn)
          begin
          if (~HRESETn)
            reg_fixed_length_burst_err <= 1'b0;
          else if (nxt_fixed_length_burst_err|reg_fixed_length_burst_err)
            reg_fixed_length_burst_err <= nxt_fixed_length_burst_err;
          end

  // Store last address selection
  always @(posedge HCLK or negedge HRESETn)
    begin
      if (~HRESETn)
        mux_sel_addr_phase_reg <= 3'b000;
      else
        mux_sel_addr_phase_reg <= mux_sel_addr_phase;
    end

  // Registering last master selection between port 0 and port 1
  // for round robin arbitration. Set if port 1 is selected, clear if port 0 is selected.
  // No change if port 2 is selected.
  reg  reg_round_robin_state;
  wire nxt_round_robin_state;
  assign nxt_round_robin_state = (mux_sel_addr_phase[1] & port_enable_mask[1]) |
                                 (reg_round_robin_state & ((~mux_sel_addr_phase[0]) & port_enable_mask[0]));

  always @(posedge HCLK or negedge HRESETn)
    begin
      if (~HRESETn)
        reg_round_robin_state <= 1'b0;
      else if (hready_mux)
        reg_round_robin_state <= nxt_round_robin_state;
    end

  // Arbitration
  assign bus_request[0] = (port_s0_hold_active | port_s0_trans_valid) & port_enable_mask[0];
  assign bus_request[1] = (port_s1_hold_active | port_s1_trans_valid) & port_enable_mask[1];
  assign bus_request[2] = (port_s2_hold_active | port_s2_trans_valid) & port_enable_mask[2];

  // Arbitration process
  always @(mux_sel_addr_phase_reg or trans_announced_stalled_reg or
           locked_active_trans_reg or fixed_length_burst or reg_fixed_length_burst_err or
           bus_request or reg_round_robin_state or port_enable_mask)
    begin
      if (trans_announced_stalled_reg | locked_active_trans_reg | fixed_length_burst |
          reg_fixed_length_burst_err)
        // Selection unchange for four conditions
        // (announced transfer delayed, locked transfer, fixed length burst, error at fixed length bursts)
        mux_sel_addr_phase = mux_sel_addr_phase_reg & port_enable_mask;
      else if (bus_request[2]) // Port 2 - high priority
        mux_sel_addr_phase = 3'b100 & port_enable_mask; // Port 2 selected
      else if (bus_request[1:0]==2'b11) // Round robin
        // if data phase is selecting port #1, then select port #0
        // else select port #1
        mux_sel_addr_phase = ({1'b0, ~reg_round_robin_state, reg_round_robin_state}) & port_enable_mask;
      else
        mux_sel_addr_phase = bus_request & port_enable_mask;
    end

  // Data phase select signal
  wire [2:0] nxt_mux_sel_data_phase;
  assign     nxt_mux_sel_data_phase = mux_sel_addr_phase & port_enable_mask;

  always @(posedge HCLK or negedge HRESETn)
    begin
      if (~HRESETn)
        mux_sel_data_phase <= 3'b000;
      else if (hready_mux)
        mux_sel_data_phase <= nxt_mux_sel_data_phase;
    end

  // Detect active transfer in data phase
  assign nxt_active_transfer = hsel_mux & htrans_mux[1];

  always @(posedge HCLK or negedge HRESETn)
    begin
      if (~HRESETn)
        active_transfer_reg <= 1'b0;
      else if (hready_mux)
        active_transfer_reg <= nxt_active_transfer;
    end

  // ----------------------------------------
  // Master Multiplexer signals

  // Address phase
  assign   hsel_mux   =  ((   mux_sel_addr_phase[0]) & (port_s0_hold_active|HSELS0)) |
                         ((   mux_sel_addr_phase[1]) & (port_s1_hold_active|HSELS1)) |
                         ((   mux_sel_addr_phase[2]) & (port_s2_hold_active|HSELS2)) ;
  assign   haddr_mux  =  ({32{mux_sel_addr_phase[0]}} & haddr_s0_ips) |
                         ({32{mux_sel_addr_phase[1]}} & haddr_s1_ips) |
                         ({32{mux_sel_addr_phase[2]}} & haddr_s2_ips) ;
  assign   htrans_mux =  ({ 2{mux_sel_addr_phase[0]}} & htrans_s0_ips) |
                         ({ 2{mux_sel_addr_phase[1]}} & htrans_s1_ips) |
                         ({ 2{mux_sel_addr_phase[2]}} & htrans_s2_ips) ;
  assign   hwrite_mux =  (    mux_sel_addr_phase[0]   & hwrite_s0_ips) |
                         (    mux_sel_addr_phase[1]   & hwrite_s1_ips) |
                         (    mux_sel_addr_phase[2]   & hwrite_s2_ips) ;
  assign   hsize_mux  =  ({ HSIZE_W{mux_sel_addr_phase[0]}} & hsize_s0_ips) |
                         ({ HSIZE_W{mux_sel_addr_phase[1]}} & hsize_s1_ips) |
                         ({ HSIZE_W{mux_sel_addr_phase[2]}} & hsize_s2_ips) ;
  assign   hprot_mux  =  ({ 4{mux_sel_addr_phase[0]}} & hprot_s0_ips) |
                         ({ 4{mux_sel_addr_phase[1]}} & hprot_s1_ips) |
                         ({ 4{mux_sel_addr_phase[2]}} & hprot_s2_ips) ;
  assign   hburst_mux =  ({ 3{mux_sel_addr_phase[0]}} & hburst_s0_ips) |
                         ({ 3{mux_sel_addr_phase[1]}} & hburst_s1_ips) |
                         ({ 3{mux_sel_addr_phase[2]}} & hburst_s2_ips) ;
  assign   hmastlock_mux=(    mux_sel_addr_phase[0]   & hmastlock_s0_ips) |
                         (    mux_sel_addr_phase[1]   & hmastlock_s1_ips) |
                         (    mux_sel_addr_phase[2]   & hmastlock_s2_ips) ;

  //  If there is an active data transfer, hready_mux = HREADYOUTM
  //  otherwise, route HREADY signals from master side
  assign   hready_mux =  (active_transfer_reg) ?
                         HREADYOUTM :
                         (
                          (    mux_sel_addr_phase[0]   & hready_s0_ips) |
                          (    mux_sel_addr_phase[1]   & hready_s1_ips) |
                          (    mux_sel_addr_phase[2]   & hready_s2_ips) |
                          (    mux_sel_addr_phase == 3'b000)); // if nothing is selected, HREADY=1

  // Data phase
  assign   hwdata_mux =  ({DW{(mux_sel_data_phase[0] & port_enable_mask[0])}} & HWDATAS0) |
                         ({DW{(mux_sel_data_phase[1] & port_enable_mask[1])}} & HWDATAS1) |
                         ({DW{(mux_sel_data_phase[2] & port_enable_mask[2])}} & HWDATAS2) ;

  // If HTRANSM has been IDLE, make sure HTRANSM will not switch from IDLE->SEQ
  // or IDLE->NSEQ->SEQ within one address phase.  The flag is reset for ever address phase.
  reg      reg_idle_flag;
  wire     nxt_idle_flag = ((HTRANSM==2'b00) | reg_idle_flag) & (~HREADYOUTM);

  always @(posedge HCLK or negedge HRESETn)
    begin
      if (~HRESETn)
        reg_idle_flag <= 1'b0;
      else
        reg_idle_flag <= nxt_idle_flag;
    end

  // If master has been switched or if idle_flag is set, make sure HTRANSM is not SEQ
  wire    [1:0]  seq_tran_suppress = ((mux_sel_addr_phase != mux_sel_data_phase)|reg_idle_flag) ? 2'b10 : 2'b11;

  // ----------------------------------------
  // Connect to top levels
  assign   HSELM      = hsel_mux;
  assign   HADDRM     = haddr_mux;
  assign   HTRANSM    = htrans_mux & seq_tran_suppress;
  assign   HWRITEM    = hwrite_mux;
  assign   HREADYM    = hready_mux;
  assign   HSIZEM[1:0] = hsize_mux;
  assign   HSIZEM[2]   = (DW > 64) ? hsize_mux[HSIZE_MAX] : 1'b0;
  assign   HPROTM     = hprot_mux;
  assign   HBURSTM    = hburst_mux;
  assign   HMASTLOCKM = hmastlock_mux;
  assign   HWDATAM    = hwdata_mux;

  // HMASTER : 2'b00 = Port 0 (mux_sel_addr_phase==3'b001)
  //           2'b01 = Port 1 (mux_sel_addr_phase==3'b010)
  //           2'b10 = Port 2 (mux_sel_addr_phase==3'b100)
  //           2'b11 = None   (mux_sel_addr_phase==3'b000)
  assign   HMASTERM[1]  = mux_sel_addr_phase[2] | (mux_sel_addr_phase==3'b000);
  assign   HMASTERM[0]  = mux_sel_addr_phase[1] | (mux_sel_addr_phase==3'b000);

`ifdef ARM_AHB_ASSERT_ON
`include "std_ovl_defines.h"
   // ------------------------------------------------------------
   // Assertions
   // ------------------------------------------------------------


   // mux_sel_addr_phase must be one-hot
   assert_zero_one_hot
     #(`OVL_FATAL,3,`OVL_ASSERT,
       "Only one bit of mux_sel_addr_phase can be activated at a time.")
   u_ovl_mux_sel_addr_phase_one_hot
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr(mux_sel_addr_phase));

   // mux_sel_data_phase must be one-hot
   assert_zero_one_hot
     #(`OVL_FATAL,3,`OVL_ASSERT,
       "Only one bit of mux_sel_data_phase can be activated at a time.")
   u_ovl_mux_sel_data_phase_one_hot
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr(mux_sel_data_phase));

   // When HREADYOUTM is low, HREADYM should be low
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "HREADY should be low when HREADYOUT is low")
   u_ovl_ready_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr( (~HREADYOUTM) & HREADYM )
      );

   // When a port is disabled, HMASTERM should never indicate it is active
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "HMASTER indicate port 0 selected but port 0 is disabled")
   u_ovl_hmaster_disable_mismatch_0
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((HMASTERM==2'b00) & (port_enable_mask[0]==1'b0))
      );

   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "HMASTER indicate port 1 selected but port 1 is disabled")
   u_ovl_hmaster_disable_mismatch_1
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((HMASTERM==2'b01) & (port_enable_mask[1]==1'b0))
      );

   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "HMASTER indicate port 2 selected but port 2 is disabled")
   u_ovl_hmaster_disable_mismatch_2
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((HMASTERM==2'b10) & (port_enable_mask[2]==1'b0))
      );

   //  When mux_sel_data_phase is 0 (no master active),
   //  HREADYOUTM should be high and HRESPM should be 0
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "When no port is selected at data phase, response from slave should be okay")
   u_ovl_no_select_data_phase
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(mux_sel_data_phase==3'b000),
      .consequent_expr((HREADYOUTM==1'b1) &
                       (HRESPM==1'b0))
      );

   // If a master port is disabled, HREADOUTSx and HRESPSx should
   // always be OKAY
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Non-OKAY response in disabled port")
   u_ovl_disabled_port_non_okay_resp_0
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(port_enable_mask[0]==1'b0),
      .consequent_expr((HREADYOUTS0==1'b1) &
                       (HRESPS0==1'b0))
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Non-OKAY response in disabled port")
   u_ovl_disabled_port_non_okay_resp_1
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(port_enable_mask[1]==1'b0),
      .consequent_expr((HREADYOUTS1==1'b1) &
                       (HRESPS1==1'b0))
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Non-OKAY response in disabled port")
   u_ovl_disabled_port_non_okay_resp_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(port_enable_mask[2]==1'b0),
      .consequent_expr((HREADYOUTS2==1'b1) &
                       (HRESPS2==1'b0))
      );

   // Detect incorrect parameter values
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "Active transfer in disabled port 0")
   u_ovl_disable_cfg_mismatch_0
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((port_s0_trans_valid==1'b1) & (port_enable_mask[0]==1'b0))
      );

   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "Active transfer in disabled port 1")
   u_ovl_disable_cfg_mismatch_1
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((port_s1_trans_valid==1'b1) & (port_enable_mask[1]==1'b0))
      );

   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "Active transfer in disabled port 2")
   u_ovl_disable_cfg_mismatch_2
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((port_s2_trans_valid==1'b1) & (port_enable_mask[2]==1'b0))
      );

   // Create data phase active signal for each input stage
   reg      ovl_reg_data_phase_active_0;
   reg      ovl_reg_data_phase_active_1;
   reg      ovl_reg_data_phase_active_2;

   always @(posedge HCLK or negedge HRESETn)
   begin
   if (~HRESETn)
     ovl_reg_data_phase_active_0 <= 1'b0;
   else if (HREADYS0 & port_enable_mask[0])
     ovl_reg_data_phase_active_0 <= port_s0_trans_valid;
   end

   always @(posedge HCLK or negedge HRESETn)
   begin
   if (~HRESETn)
     ovl_reg_data_phase_active_1 <= 1'b0;
   else if (HREADYS1 & port_enable_mask[1])
     ovl_reg_data_phase_active_1 <= port_s1_trans_valid;
   end

   always @(posedge HCLK or negedge HRESETn)
   begin
   if (~HRESETn)
     ovl_reg_data_phase_active_2 <= 1'b0;
   else if (HREADYS2 & port_enable_mask[2])
     ovl_reg_data_phase_active_2 <= port_s2_trans_valid;
   end

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Non-OKAY response in IDLE/BUSY transfers in port 0")
   u_ovl_idle_or_busy_non_okay_resp_0
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_data_phase_active_0==1'b0)),
      .consequent_expr((HREADYOUTS0==1'b1) &
                       (HRESPS0==1'b0))
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Non-OKAY response in IDLE/BUSY transfers in port 1")
   u_ovl_idle_or_busy_non_okay_resp_1
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_data_phase_active_1==1'b0)),
      .consequent_expr((HREADYOUTS1==1'b1) &
                       (HRESPS1==1'b0))
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Non-OKAY response in IDLE/BUSY transfers in port 2")
   u_ovl_idle_or_busy_non_okay_resp_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_data_phase_active_2==1'b0)),
      .consequent_expr((HREADYOUTS2==1'b1) &
                       (HRESPS2==1'b0))
      );

   // During transfer data phase, when master receive HREADYOUTS[n] = 1,
   // mux_sel_data_phase[n] should also be 1
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Data phase select error in port 0")
   u_ovl_active_data_phase_ctrl_mismatch_0
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_data_phase_active_0==1'b1) & (HREADYOUTS0==1'b1)),
      .consequent_expr(mux_sel_data_phase[0]==1'b1)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Data phase select error in port 1")
   u_ovl_active_data_phase_ctrl_mismatch_1
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_data_phase_active_1==1'b1) & (HREADYOUTS1==1'b1)),
      .consequent_expr(mux_sel_data_phase[1]==1'b1)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Data phase select error in port 2")
   u_ovl_active_data_phase_ctrl_mismatch_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_data_phase_active_2==1'b1) & (HREADYOUTS2==1'b1)),
      .consequent_expr(mux_sel_data_phase[2]==1'b1)
      );

   // Check response match at the end of transfer
   // Note: data cannot be checked because data could be X (it is legal)
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Data phase resp mistmatch in port 0")
   u_ovl_active_data_phase_resp_mismatch_0
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_data_phase_active_0==1'b1) & (HREADYOUTS0==1'b1)),
      .consequent_expr(HRESPS0==HRESPM));

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Data phase resp mistmatch in port 1")
   u_ovl_active_data_phase_resp_mismatch_1
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_data_phase_active_1==1'b1) & (HREADYOUTS1==1'b1)),
      .consequent_expr(HRESPS1==HRESPM));

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Data phase resp mistmatch in port 2")
   u_ovl_active_data_phase_resp_mismatch_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((ovl_reg_data_phase_active_2==1'b1) & (HREADYOUTS2==1'b1)),
      .consequent_expr(HRESPS2==HRESPM));

`endif

`ifdef ARM_ASSERT_ON

`ifdef ARM_AHB_ASSERT_ON
`else
`include "std_ovl_defines.h"
`endif


`endif
endmodule
