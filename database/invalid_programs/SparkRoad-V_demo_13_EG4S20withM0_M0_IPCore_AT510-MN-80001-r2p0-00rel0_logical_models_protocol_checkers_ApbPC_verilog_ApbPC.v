//------------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2004-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//   Checked In : $Date: 2013-01-21 12:49:49 +0000 (Mon, 21 Jan 2013) $
//   Revision   : $Revision: 144035 $
//   Release    : Cortex-M System Design Kit-r1p0-00rel0
//
//------------------------------------------------------------------------------
// Verilog-2001 (IEEE Std 1364-2001)
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//  Purpose : AMBA Advanced Peripheral Bus Protocol Checker using OVLs
//             - Supports these revisions of the APB protocol:
//                . APB2, a.k.a. AMBA 2 APB Specification
//                . APB3, a.k.a. AMBA 3 APB Protocol Specification v1.0
//                . APB4, a.k.a. AMBA APB Protocol Specification v2.0
//             - Supports address bus widths from 1 to 32 bits
//             - Supports data bus widths from 1 to 32 bits
//             - Supports optional port PREADY  (APB3 and APB4 only)
//             - Supports optional port PSLVERR (APB3 and APB4 only)
//             - Supports optional port PPROT (APB4 only)
//             - Supports optional port PSTRB (APB4 only)
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Module Declaration
//------------------------------------------------------------------------------

module ApbPC #(
//------------------------------------------------------------------------------
// Parameter Declaration
//------------------------------------------------------------------------------

    // Set ADDR_WIDTH to the PADDR bus width required. (1 to 32)
    parameter ADDR_WIDTH = 32,

    // Set DATA_WIDTH to the PxDATA buses width required. (1 to 32)
    parameter DATA_WIDTH = 32,

    // Set SEL_WIDTH to the PSELx bus width required. (1 or more)
    parameter SEL_WIDTH  =  1,

    // Property type. (0=assert, 1=assume, 2=ignore)
    parameter MASTER_REQUIREMENT_PROPTYPE = 0,
    parameter SLAVE_REQUIREMENT_PROPTYPE  = 0,

    // Optional signals. (0=not functional, 1=functional)
    parameter PREADY_FUNCTIONAL  = 1,
    parameter PSLVERR_FUNCTIONAL = 1,
    parameter PPROT_FUNCTIONAL   = 1,
    parameter PSTRB_FUNCTIONAL   = 1

  ) (
//------------------------------------------------------------------------------
// Port Declaration
//------------------------------------------------------------------------------

    // Global Signals
    // =====
    input  wire                          PCLK,
    input  wire                          PRESETn,

    // Control Signals
    // =====
    input  wire [        ADDR_WIDTH-1:0] PADDR,
    input  wire [                   2:0] PPROT,
    input  wire [         SEL_WIDTH-1:0] PSELx,
    input  wire                          PENABLE,
    input  wire                          PWRITE,
    input  wire [((DATA_WIDTH+7)/8)-1:0] PSTRB,
    input  wire                          PREADY,
    input  wire                          PSLVERR,

    // Data Buses
    // =====
    input  wire [        DATA_WIDTH-1:0] PWDATA,
    input  wire [        DATA_WIDTH-1:0] PRDATA
  );

//------------------------------------------------------------------------------
// OVL Property Control
//------------------------------------------------------------------------------

  // Can be overridden.
  // Clock and Reset
  // =====
  //
  // For example to clock OVL on the negative edge of PCLK (to avoid race
  // hazards with auxiliary logic), use:
  //
  //   +define+APB_OVL_CLK=~PCLK
  //
  `ifdef APB_OVL_CLK
  `else
     `define APB_OVL_CLK PCLK
  `endif
  //
  `ifdef APB_OVL_RSTn
  `else
     `define APB_OVL_RSTn PRESETn
  `endif

  // OVL Version Specific Macros
  // =====
  `ifdef APB_USE_OLD_OVL
     // Old OVL library from April 2003
     // ===============================
     // severity_level
     localparam APB_SimFatal   = 0;
     localparam APB_SimError   = 1;
     localparam APB_SimWarning = 2;
  `else
     // Accellera V1.0 and later
     // ========================
     `include "std_ovl_defines.h"
     // severity_level
     localparam APB_SimFatal   = `OVL_FATAL;
     localparam APB_SimError   = `OVL_ERROR;
     localparam APB_SimWarning = `OVL_WARNING;
     //
     // Disable for X-checking
     `ifdef OVL_XCHECK_OFF
        `define APB_XCHECK_OFF
     `endif
  `endif

//------------------------------------------------------------------------------
// Simulation Initialization
//------------------------------------------------------------------------------

  initial begin
    // Indicate version
    // =====
    $display("APB_INFO: Running ApbPC $Revision: 144035 $");

    // Warn about rules that are ignored
    // =====
    if (MASTER_REQUIREMENT_PROPTYPE == 2) $display("APB_WARN: All master requirements are being ignored");
    if (SLAVE_REQUIREMENT_PROPTYPE  == 2) $display("APB_WARN: All slave  requirements are being ignored");
  end

//------------------------------------------------------------------------------
// Unused Inputs Assignment - Facilitates Linting
//------------------------------------------------------------------------------

  wire [DATA_WIDTH-1:0] unused = PRDATA;

//------------------------------------------------------------------------------
// Optional Inputs Masking
//------------------------------------------------------------------------------

  wire                          PREADYi  = (PREADY_FUNCTIONAL  != 0) ? PREADY  : 1'b1;
  wire                          PSLVERRi = (PSLVERR_FUNCTIONAL != 0) ? PSLVERR : 1'b0;
  wire [                   2:0] PPROTi   = (PPROT_FUNCTIONAL   != 0) ? PPROT   : 3'b0;
  wire [((DATA_WIDTH+7)/8)-1:0] PSTRBj   = (PSTRB_FUNCTIONAL   != 0) ? PSTRB   : {(DATA_WIDTH+7)/8{PWRITE}};

//------------------------------------------------------------------------------
// Address, Data and Strobes Masking
//------------------------------------------------------------------------------

  // Create fixed-width internal version of PADDR, PSTRB, PWDATA,
  // masked based on ADDR_WIDTH, DATA_WIDTH, PSTRB

  localparam [ 3:0] STRB_FUNC_MASK = { DATA_WIDTH > 24, DATA_WIDTH > 16, DATA_WIDTH > 8, DATA_WIDTH > 0 };
  localparam [31:0] DATA_FUNC_MASK = {32{1'b1}} >> (32 - DATA_WIDTH);

  wire [32:0] PADDRj  = { {33-ADDR_WIDTH{1'b0}}, PADDR };
  wire [31:0] PADDRi  = PADDRj[31:0];

  wire [ 3:0] PSTRBi  = PSTRBj & STRB_FUNC_MASK;

  wire [31:0] PWDATA_pstrb_mask = { {8{PSTRBi[3]}}, {8{PSTRBi[2]}}, {8{PSTRBi[1]}}, {8{PSTRBi[0]}} };

  wire [32:0] PWDATAj = { {33-DATA_WIDTH{1'b0}}, PWDATA };
  wire [31:0] PWDATAi = PWDATAj[31:0] & DATA_FUNC_MASK & PWDATA_pstrb_mask;

//------------------------------------------------------------------------------
// Register Declaration
//------------------------------------------------------------------------------

  // APB interface signals
  reg  [         31:0] PADDR_reg;
  reg  [          2:0] PPROT_reg;
  reg  [SEL_WIDTH-1:0] PSEL_reg;
  reg                  PENABLE_reg;
  reg                  PWRITE_reg;
  reg  [          3:0] PSTRB_reg;
  reg                  PREADY_reg;
  reg                  PSLVERR_reg;
  reg  [         31:0] PWDATA_reg;

  // Reset
  reg                  APB_OVL_RSTn_reg;

  // Auxiliary logic
  reg                  state_is_idle_reg;
  reg                  state_is_setup_reg;
  reg                  state_is_access_reg;

//------------------------------------------------------------------------------
// Auxiliary Logic
//------------------------------------------------------------------------------

  // OR-reduce PSELx
  wire PSELany = |PSELx;

  // APB operating states as described in section 4.1 of APB4 specification
  wire state_is_idle   = ~PSELany;
  wire state_is_setup  =  PSELany & ~PENABLE;
  wire state_is_access =  PSELany &  PENABLE;

  wire trans_from_idle_ok   = state_is_idle | // remain idle
                              state_is_setup; // go to setup phase

  wire trans_from_setup_ok  = state_is_access; // always go to access phase

  // PREADY HIGH during access phase, transfer completes
  wire trans_from_access_ok_pready_high = state_is_idle | // go to idle
                                          state_is_setup; // start new setup phase
  // PREADY LOW during access phase, transfer is waited
  wire trans_from_access_ok_pready_low  = state_is_access; // remain in access phase

  wire trans_from_access_ok = PREADY_reg ? trans_from_access_ok_pready_high : trans_from_access_ok_pready_low;

//------------------------------------------------------------------------------
// Signal Registering
//------------------------------------------------------------------------------

  always @(posedge `APB_OVL_CLK) begin
    PADDR_reg           <= PADDRi;
    PPROT_reg           <= PPROTi;
    PSEL_reg            <= PSELx;
    PENABLE_reg         <= PENABLE;
    PWRITE_reg          <= PWRITE;
    PSTRB_reg           <= PSTRBi;
    PREADY_reg          <= PREADYi;
    PSLVERR_reg         <= PSLVERRi;
    PWDATA_reg          <= PWDATAi;

    APB_OVL_RSTn_reg    <= `APB_OVL_RSTn;

    state_is_idle_reg   <= state_is_idle;
    state_is_setup_reg  <= state_is_setup;
    state_is_access_reg <= state_is_access;
  end

//------------------------------------------------------------------------------
// Parameters Properties
//------------------------------------------------------------------------------

  // APB_ERRP_ADDR_WIDTH
  // =====
  assert_proposition #(APB_SimFatal, 0, // always assert
    "APB_ERRP_ADDR_WIDTH. Parameter ADDR_WIDTH must be between 1 and 32 inclusive."
  ) u_addr_width
    (.reset_n   (`APB_OVL_RSTn),
     .test_expr ((ADDR_WIDTH >= 1) && (ADDR_WIDTH <= 32))
     );

  // APB_ERRP_DATA_WIDTH
  // =====
  assert_proposition #(APB_SimFatal, 0, // always assert
    "APB_ERRP_DATA_WIDTH. Parameter DATA_WIDTH must be between 1 and 32 inclusive."
  ) u_data_width
    (.reset_n   (`APB_OVL_RSTn),
     .test_expr ((DATA_WIDTH >= 1) && (DATA_WIDTH <= 32))
     );

  // APB_ERRP_SEL_WIDTH
  // =====
  assert_proposition #(APB_SimFatal, 0, // always assert
    "APB_ERRP_SEL_WIDTH. Parameter SEL_WIDTH must be 1 or more."
  ) u_sel_width
    (.reset_n   (`APB_OVL_RSTn),
     .test_expr (SEL_WIDTH >= 1)
     );

//------------------------------------------------------------------------------
// PSEL/PENABLE Control Properties
//------------------------------------------------------------------------------

  // APB_ERRM_STATE_VALID
  // =====
  assert_one_hot #(APB_SimError, 3, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_STATE_VALID. Invalid state."
  ) u_state_valid
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .test_expr ({state_is_idle, state_is_setup, state_is_access})
     );

  // APB_ERRM_STATE_TRANSITION_VALID
  // =====
  assert_always #(APB_SimError, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_STATE_TRANSITION_VALID. Invalid state transition."
  ) u_state_transition_valid
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .test_expr ((state_is_idle_reg   & trans_from_idle_ok  ) |
                 (state_is_setup_reg  & trans_from_setup_ok ) |
                 (state_is_access_reg & trans_from_access_ok))
     );

//------------------------------------------------------------------------------
// Other Control Properties
//------------------------------------------------------------------------------

  // APB_ERRM_PSEL_NOTRESET_01HOT
  // =====
  // NB: extended PSELx by 1-bit (set to zero) to avoid warning when SEL_WIDTH=1
  assert_zero_one_hot #(APB_SimError, (SEL_WIDTH+1), MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PSEL_NOTRESET_01HOT. When not in reset, PSELx must be zero or one-hot encoded."
  ) u_psel_notreset_01hot
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .test_expr ({1'b0, PSELx})
     );

  // APB_ERRM_PSEL_RESET_0
  // =====
  assert_never #(APB_SimError, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PSEL_RESET_0. When in reset, PSELx must be zero."
  ) u_psel_reset_0
    (.clk       (`APB_OVL_CLK),
     .reset_n   (1'b1),
     .test_expr (~APB_OVL_RSTn_reg & PSELany)
     );

  // APB_ERRM_PSTRB_READ_0
  // =====
  assert_never #(APB_SimError, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PSTRB_READ_0. During an APB read transfer, PSTRB must be zero."
  ) u_pstrb_read_0
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .test_expr (PSELany & ~PWRITE & (PSTRBi != {4{1'b0}}))
     );

//------------------------------------------------------------------------------
// Signal Stability Properties
//------------------------------------------------------------------------------

  // APB_ERRM_PADDR_CHG
  // =====
  assert_never #(APB_SimError, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PADDR_CHG. During an APB transfer, PADDR value change is not permitted."
  ) u_paddr_chg
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .test_expr (state_is_access & |(PADDRi ^ PADDR_reg))
     );

  // APB_ERRM_PPROT_CHG
  // =====
  assert_never #(APB_SimError, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PPROT_CHG. During an APB transfer, PPROT value change is not permitted."
  ) u_pprot_chg
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .test_expr (state_is_access & |(PPROTi ^ PPROT_reg))
     );

  // APB_ERRM_PSEL_CHG
  // =====
  assert_never #(APB_SimError, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PSEL_CHG. During an APB transfer, PSELx value change is not permitted."
  ) u_psel_chg
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .test_expr (state_is_access & |(PSELx ^ PSEL_reg))
    );

  // APB_ERRM_PWRITE_CHG
  // =====
  assert_never #(APB_SimError, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PWRITE_CHG. During an APB transfer, PWRITE value change is not permitted."
  ) u_pwrite_chg
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .test_expr (state_is_access & (PWRITE ^ PWRITE_reg))
     );

  // APB_ERRM_PSTRB_CHG
  // =====
  assert_never #(APB_SimError, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PSTRB_CHG. During an APB transfer, PSTRB value change is not permitted."
  ) u_pstrb_chg
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .test_expr (state_is_access & |(PSTRBi ^ PSTRB_reg))
     );

  // APB_ERRM_PWDATA_CHG
  // =====
  // Note:
  // The stability check can't be done when the data is X, so give a warning.
  // This is handled in the X checks section.
  assert_never #(APB_SimError, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PWDATA_CHG. During an APB transfer, PWDATA value change is not permitted."
  ) u_pwdata_chg
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .test_expr (state_is_access & (PWDATAi !== PWDATA_reg))
     );

//------------------------------------------------------------------------------
// X-Checking Properties
//------------------------------------------------------------------------------

`ifdef APB_XCHECK_OFF
`else  // X-Checking enabled by default

  // APB_ERRM_PADDR_X
  // =====
  assert_never_unknown #(APB_SimError, 32, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PADDR_X. When PSELx is high, a value of X on PADDR is not permitted."
  ) u_paddr_x
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .qualifier (PSELany),
     .test_expr (PADDRi)
     );

  // APB_ERRM_PPROT_X
  // =====
  assert_never_unknown #(APB_SimError, 3, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PPROT_X. When PSELx is high, a value of X on PPROT is not permitted."
  ) u_pprot_x
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .qualifier (PSELany),
     .test_expr (PPROTi)
     );

  // APB_ERRM_PSEL_X
  // =====
  assert_never_unknown #(APB_SimError, SEL_WIDTH, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PSEL_X. A value of X on PSELx is not permitted."
  ) u_psel_x
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .qualifier (1'b1),
     .test_expr (PSELx)
     );

  // APB_ERRM_PENABLE_X
  // =====
  assert_never_unknown #(APB_SimError, 1, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PENABLE_X. When PSELx is high, a value of X on PENABLE is not permitted."
  ) u_penable_x
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .qualifier (PSELany),
     .test_expr (PENABLE)
     );

  // APB_ERRM_PWRITE_X
  // =====
  assert_never_unknown #(APB_SimError, 1, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PWRITE_X. When PSELx is high, a value of X on PWRITE is not permitted."
  ) u_pwrite_x
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .qualifier (PSELany),
     .test_expr (PWRITE)
     );

  // APB_ERRM_PSTRB_X
  // =====
  assert_never_unknown #(APB_SimError, 4, MASTER_REQUIREMENT_PROPTYPE,
    "APB_ERRM_PSTRB_X. When PSELx is high, a value of X on PSTRB is not permitted."
  ) u_pstrb_x
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .qualifier (PSELany),
     .test_expr (PSTRBi)
     );

  // APB_ERRS_PREADY_X
  // =====
  assert_never_unknown #(APB_SimError, 1, SLAVE_REQUIREMENT_PROPTYPE,
    "APB_ERRS_PREADY_X. When PSELx and PENABLE are high, a value of X on PREADY is not permitted."
  ) u_pready_x
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .qualifier (PSELany & PENABLE),
     .test_expr (PREADYi)
     );

  // APB_ERRS_PSLVERR_X
  // =====
  assert_never_unknown #(APB_SimError, 1, SLAVE_REQUIREMENT_PROPTYPE,
    "APB_ERRS_PSLVERR_X. When PSELx, PENABLE and PREADY are high, a value of X on PSLVERR is not permitted."
  ) u_pslverr_x
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .qualifier (PSELany & PENABLE & PREADYi),
     .test_expr (PSLVERRi)
     );

  // APB_ERRM_PWDATA_X
  // =====
  // X in data is permitted.
  // However PWDATA stability can't be checked when it contains X, so give a
  // warning when PWDATA contains X and its stability should be checked
  localparam PWDATA_X_CHECK_PROPTYPE = (MASTER_REQUIREMENT_PROPTYPE == 0) ? 0 : 2;
  assert_never_unknown #(APB_SimWarning, 32, PWDATA_X_CHECK_PROPTYPE,
    "APB_ERRM_PWDATA_X. PWDATA contains X: stability unknown."
  ) u_pwdata_x
    (.clk       (`APB_OVL_CLK),
     .reset_n   (`APB_OVL_RSTn),
     .qualifier (state_is_access),
     .test_expr (PWDATAi)
     );

  // APB_ERRS_PRDATA_X
  // =====
  // X in data is permitted

`endif //APB_XCHECK_OFF

//------------------------------------------------------------------------------
// Macro Definition Removal
//------------------------------------------------------------------------------

  // Clock and Reset
  // =====
  `undef APB_OVL_CLK
  `undef APB_OVL_RSTn

  // Others
  // =====
  `ifdef APB_USE_OLD_OVL
  `else
    `ifdef OVL_XCHECK_OFF
      `undef APB_XCHECK_OFF
    `endif
  `endif

//------------------------------------------------------------------------------
// End of Module
//------------------------------------------------------------------------------

endmodule //ApbPC
