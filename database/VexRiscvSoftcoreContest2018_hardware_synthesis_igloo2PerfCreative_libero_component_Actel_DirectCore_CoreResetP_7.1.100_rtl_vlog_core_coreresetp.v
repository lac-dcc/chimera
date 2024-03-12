// ***********************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2012 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:	CoreResetP
//				Soft IP reset controller.
//              Sequences various reset signals to peripheral blocks in a
//              SmartFusion2 or IGLOO2 device.
//
//
// SVN Revision Information:
// SVN $Revision: 22245 $
// SVN $Date: 2014-03-28 16:55:59 +0000 (Fri, 28 Mar 2014) $
//
// Notes:
//
// ***********************************************************************/

module CoreResetP (
    // Clock from RC oscillator
    input           RCOSC_25_50MHZ,
    // Clock from fabric CCC
    input           CLK_BASE,
    // Clock for sampling LTSSM data
    input           CLK_LTSSM,
    // Power on reset signal from g4m_control
    input           POWER_ON_RESET_N,
    // Reset output intended for connection to external logic.
    output  reg     EXT_RESET_OUT,
    // Signals to/from MSS/HPMS
    output  reg     RESET_N_F2M,
    output  reg     M3_RESET_N,
    input           RESET_N_M2F,
    input           FIC_2_APB_M_PRESET_N,
    output  reg     MDDR_DDR_AXI_S_CORE_RESET_N,
    // MSS_HPMS_READY is essentially controlled by either RESET_N_M2F (at
    // power on) or FIC_2_APB_M_PRESET_N (after power on, during warm
    // resets).
    output  wire    MSS_HPMS_READY,
    // Signal indicating readiness of DDR controllers
    output  wire    DDR_READY,
    // Signal indicating readiness of SERDES interfaces
    output  wire    SDIF_READY,
    // Signals to/from CoreConfigP
    input           CONFIG1_DONE,
    output  wire    SDIF_RELEASED,
    input           CONFIG2_DONE,
    output  wire    INIT_DONE,
    // Reset input from fabric.
    input           FAB_RESET_N,
    // FDDR signals
    input           FPLL_LOCK,
    output  reg     FDDR_CORE_RESET_N,
    // SERDESIF_0 signals
    input           SDIF0_SPLL_LOCK,
    output  reg     SDIF0_PHY_RESET_N,
    output  reg     SDIF0_CORE_RESET_N,
    // The following two signals are used when targeting an 090 or 060 device
    // which has two PCIe controllers within a single SERDES interface
    // block.
    output  reg     SDIF0_0_CORE_RESET_N,
    output  reg     SDIF0_1_CORE_RESET_N,
    // SERDESIF_1 signals
    input           SDIF1_SPLL_LOCK,
    output  reg     SDIF1_PHY_RESET_N,
    output  reg     SDIF1_CORE_RESET_N,
    // SERDESIF_2 signals
    input           SDIF2_SPLL_LOCK,
    output  reg     SDIF2_PHY_RESET_N,
    output  reg     SDIF2_CORE_RESET_N,
    // SERDESIF_3 signals
    input           SDIF3_SPLL_LOCK,
    output  reg     SDIF3_PHY_RESET_N,
    output  reg     SDIF3_CORE_RESET_N,
    // PERST_N (PCIe reset) signals
    input           SDIF0_PERST_N,
    input           SDIF1_PERST_N,
    input           SDIF2_PERST_N,
    input           SDIF3_PERST_N,
    // Some SDIF APB interface signals are brought into this core to
    // provide access to status information that is present on the PRDATA
    // bus when an APB read is not in progress.
    // This status information is used in this core to implement a HotReset
    // workaround when an SDIF block has been configured for PCIe.
    // (Parameters are used to include/exclude the HotReset workaround.)
    input           SDIF0_PSEL,
    input           SDIF0_PWRITE,
    input   [31:0]  SDIF0_PRDATA,
    input           SDIF1_PSEL,
    input           SDIF1_PWRITE,
    input   [31:0]  SDIF1_PRDATA,
    input           SDIF2_PSEL,
    input           SDIF2_PWRITE,
    input   [31:0]  SDIF2_PRDATA,
    input           SDIF3_PSEL,
    input           SDIF3_PWRITE,
    input   [31:0]  SDIF3_PRDATA,
    // The following inputs can be used to control the reset outputs to the
    // peripheral blocks. The intention is that these may be used by
    // software to allow software control of individual resets outputs.
    // When a SOFT_xxx input is high, the corresponding reset output is
    // asserted. Most (all?) reset outputs are active low.
    input           SOFT_EXT_RESET_OUT,
    input           SOFT_RESET_F2M,
    input           SOFT_M3_RESET,
    input           SOFT_MDDR_DDR_AXI_S_CORE_RESET,
    input           SOFT_FDDR_CORE_RESET,
    input           SOFT_SDIF0_PHY_RESET,
    input           SOFT_SDIF0_CORE_RESET,
    input           SOFT_SDIF1_PHY_RESET,
    input           SOFT_SDIF1_CORE_RESET,
    input           SOFT_SDIF2_PHY_RESET,
    input           SOFT_SDIF2_CORE_RESET,
    input           SOFT_SDIF3_PHY_RESET,
    input           SOFT_SDIF3_CORE_RESET,
    // The following two signals are used when targeting an 090 or 060 device
    // which has two PCIe controllers within a single SERDES interface
    // block.
    input           SOFT_SDIF0_0_CORE_RESET,
    input           SOFT_SDIF0_1_CORE_RESET
    );

    parameter FAMILY = 19;

    // EXT_RESET_CFG is used to determine what can cause the external reset
    // to be driven (by asserting EXT_RESET_OUT).
    //    0 = EXT_RESET_OUT is never asserted
    //    1 = EXT_RESET_OUT is asserted if power up reset
    //        (POWER_ON_RESET_N) is asserted
    //    2 = EXT_RESET_OUT is asserted if MSS_HPMS_READY is not
    //        asserted
    //    3 = EXT_RESET_OUT is asserted if power up reset
    //        (POWER_ON_RESET_N) or MSS_HPMS_READY not is asserted.
    parameter EXT_RESET_CFG = 3;

    // DEVICE_VOLTAGE is set to according to the supply voltage to the
    // device. The supply voltage determines the RC oscillator frequency.
    // This can be 25 or 50 MHz.
    //    1 = 1.0 V (RC osc freq = 25 MHz)
    //    2 = 1.2 V (RC osc freq = 50 MHz)
    parameter DEVICE_VOLTAGE = 2;

    // Use the following parameters to indicate whether or not a particular
    // peripheral block is being used (and connected to this core).
    parameter MDDR_IN_USE  = 1;
    parameter FDDR_IN_USE  = 1;
    parameter SDIF0_IN_USE = 1;
    parameter SDIF1_IN_USE = 1;
    parameter SDIF2_IN_USE = 1;
    parameter SDIF3_IN_USE = 1;

    // Following are used to indicate if a particular SDIF block is used
    // for PCIe.
    parameter SDIF0_PCIE = 0;
    parameter SDIF1_PCIE = 0;
    parameter SDIF2_PCIE = 0;
    parameter SDIF3_PCIE = 0;

    // Following are used to enable or disable PCIe HotReset/DLUP
    // workaround for SDIF blocks. The workaround involves tracking LTSSM
    // state machine within SDIF and asserting SDIFx_CORE_RESET_N signal
    // to SDIF when appropriate.
    parameter SDIF0_PCIE_HOTRESET = 1;
    parameter SDIF1_PCIE_HOTRESET = 1;
    parameter SDIF2_PCIE_HOTRESET = 1;
    parameter SDIF3_PCIE_HOTRESET = 1;

    // Following enable or disable PCIe L2/P2 workaround for SDIF blocks.
    // When enabled, SDIF PHY and CORE resets are asserted when a rising
    // edge is observed on PERST_N signal.
    parameter SDIF0_PCIE_L2P2     = 1;
    parameter SDIF1_PCIE_L2P2     = 1;
    parameter SDIF2_PCIE_L2P2     = 1;
    parameter SDIF3_PCIE_L2P2     = 1;

    // Set the following parameter to 1 to enable the SOFT_XXX inputs that
    // can be used to directly control the various reset outputs.
    parameter ENABLE_SOFT_RESETS = 0;

    // Set the DEVICE_090 parameter to 1 when an 090 or 060 device is being
    // targeted, otherwise set to 0.
    // When DEVICE_090 = 1, two core reset signals are available for
    // connection to SDIF0 instead of just one. This supports the two
    // PCIe controllers within SDIF0 on an 090 or 060 device.
    parameter DEVICE_090 = 0;

    // DDR_WAIT specifies the time in microseconds that must have elapsed
    // between release of the reset to the FDDR block (FDDR_CORE_RESET_N)
    // and assertion of INIT_DONE output.
    parameter DDR_WAIT = 200;

    localparam RCOSC_MEGAHERTZ  = 25 * DEVICE_VOLTAGE;

    localparam SDIF_INTERVAL    = 130      * RCOSC_MEGAHERTZ;
    localparam DDR_INTERVAL     = DDR_WAIT * RCOSC_MEGAHERTZ;


    function integer calc_count_width;
        input x;
        integer x;
        begin
            if      (x > 2147483647) calc_count_width =  32;
            else if (x > 1073741823) calc_count_width =  31;
            else if (x >  536870911) calc_count_width =  30;
            else if (x >  268435455) calc_count_width =  29;
            else if (x >  134217727) calc_count_width =  28;
            else if (x >   67108863) calc_count_width =  27;
            else if (x >   33554431) calc_count_width =  26;
            else if (x >   16777215) calc_count_width =  25;
            else if (x >    8388607) calc_count_width =  24;
            else if (x >    4194303) calc_count_width =  23;
            else if (x >    2097151) calc_count_width =  22;
            else if (x >    1048575) calc_count_width =  21;
            else if (x >     524287) calc_count_width =  20;
            else if (x >     262143) calc_count_width =  19;
            else if (x >     131071) calc_count_width =  18;
            else if (x >      65535) calc_count_width =  17;
            else if (x >      32767) calc_count_width =  16;
            else if (x >      16383) calc_count_width =  15;
            else if (x >       8191) calc_count_width =  14;
            else if (x >       4095) calc_count_width =  13;
            else if (x >       2047) calc_count_width =  12;
            else if (x >       1023) calc_count_width =  11;
            else if (x >        511) calc_count_width =  10;
            else if (x >        255) calc_count_width =   9;
            else if (x >        127) calc_count_width =   8;
            else if (x >         63) calc_count_width =   7;
            else if (x >         31) calc_count_width =   6;
            else if (x >         15) calc_count_width =   5;
            else if (x >          7) calc_count_width =   4;
            else if (x >          3) calc_count_width =   3;
            else                     calc_count_width =   2;
        end
    endfunction


    localparam COUNT_WIDTH_SDIF = calc_count_width(SDIF_INTERVAL);
    localparam COUNT_WIDTH_DDR  = calc_count_width(DDR_INTERVAL);

    // Parameters for state machine states
    localparam S0 = 0;
    localparam S1 = 1;
    localparam S2 = 2;
    localparam S3 = 3;
    localparam S4 = 4;
    localparam S5 = 5;
    localparam S6 = 6;

    // Signals
    reg     [2:0]   sm0_state;
    //reg     [2:0]   sm1_state;
    reg     [2:0]   sm2_state;
    reg     [2:0]   sdif0_state;
    reg     [2:0]   sdif1_state;
    reg     [2:0]   sdif2_state;
    reg     [2:0]   sdif3_state;
    reg     [2:0]   next_sm0_state;
    //reg     [2:0]   next_sm1_state;
    reg     [2:0]   next_sm2_state;
    reg     [2:0]   next_sdif0_state;
    reg     [2:0]   next_sdif1_state;
    reg     [2:0]   next_sdif2_state;
    reg     [2:0]   next_sdif3_state;
    reg             next_ext_reset_out;
    reg             next_fddr_core_reset_n;
    reg             next_sdif0_phy_reset_n;
    reg             next_sdif0_core_reset_n;
    reg             next_sdif1_phy_reset_n;
    reg             next_sdif1_core_reset_n;
    reg             next_sdif2_phy_reset_n;
    reg             next_sdif2_core_reset_n;
    reg             next_sdif3_phy_reset_n;
    reg             next_sdif3_core_reset_n;
    reg             next_mddr_core_reset_n;
    reg             next_count_sdif0_enable;
    reg             next_count_sdif1_enable;
    reg             next_count_sdif2_enable;
    reg             next_count_sdif3_enable;
    reg             next_count_ddr_enable;
    reg             next_ddr_ready;
    reg             next_sdif_released;
    reg             next_sdif_ready;
    reg             next_init_done;
    reg             release_ext_reset;
    reg             next_release_ext_reset;

    reg             sm0_areset_n;
    reg             sm1_areset_n;
    reg             sm2_areset_n;
    reg             sdif0_areset_n;
    reg             sdif1_areset_n;
    reg             sdif2_areset_n;
    reg             sdif3_areset_n;

    wire            SDIF0_PERST_N_int;
    wire            SDIF1_PERST_N_int;
    wire            SDIF2_PERST_N_int;
    wire            SDIF3_PERST_N_int;

    reg             SDIF0_PERST_N_q1;
    reg             SDIF0_PERST_N_q2;
    reg             SDIF0_PERST_N_q3;
    reg             SDIF0_PERST_N_re;

    reg             SDIF1_PERST_N_q1;
    reg             SDIF1_PERST_N_q2;
    reg             SDIF1_PERST_N_q3;
    reg             SDIF1_PERST_N_re;

    reg             SDIF2_PERST_N_q1;
    reg             SDIF2_PERST_N_q2;
    reg             SDIF2_PERST_N_q3;
    reg             SDIF2_PERST_N_re;

    reg             SDIF3_PERST_N_q1;
    reg             SDIF3_PERST_N_q2;
    reg             SDIF3_PERST_N_q3;
    reg             SDIF3_PERST_N_re;

    reg             sm0_areset_n_q1;
    reg             sm0_areset_n_clk_base;
    reg             sm1_areset_n_q1;
    reg             sm1_areset_n_clk_base;
    reg             sm2_areset_n_q1;
    reg             sm2_areset_n_clk_base;
    reg             sdif0_areset_n_q1;
    reg             sdif0_areset_n_clk_base;
    reg             sdif1_areset_n_q1;
    reg             sdif1_areset_n_clk_base;
    reg             sdif2_areset_n_q1;
    reg             sdif2_areset_n_clk_base;
    reg             sdif3_areset_n_q1;
    reg             sdif3_areset_n_clk_base;

    reg             sm0_areset_n_rcosc_q1;
    reg             sm0_areset_n_rcosc;
    reg             sdif0_areset_n_rcosc_q1;
    reg             sdif0_areset_n_rcosc;
    reg             sdif1_areset_n_rcosc_q1;
    reg             sdif1_areset_n_rcosc;
    reg             sdif2_areset_n_rcosc_q1;
    reg             sdif2_areset_n_rcosc;
    reg             sdif3_areset_n_rcosc_q1;
    reg             sdif3_areset_n_rcosc;

    reg             fpll_lock_q1;
    reg             fpll_lock_q2;
    reg             sdif0_spll_lock_q1;
    reg             sdif0_spll_lock_q2;
    reg             sdif1_spll_lock_q1;
    reg             sdif1_spll_lock_q2;
    reg             sdif2_spll_lock_q1;
    reg             sdif2_spll_lock_q2;
    reg             sdif3_spll_lock_q1;
    reg             sdif3_spll_lock_q2;

    reg             count_ddr_enable;
    reg             ddr_settled;
    reg             count_sdif0_enable;
    reg             count_sdif1_enable;
    reg             count_sdif2_enable;
    reg             count_sdif3_enable;
    reg             release_sdif0_core;
    reg             release_sdif1_core;
    reg             release_sdif2_core;
    reg             release_sdif3_core;

    reg             DDR_READY_int;
    reg             SDIF_RELEASED_int;
    reg             SDIF_READY_int;
    reg             INIT_DONE_int;

    reg [COUNT_WIDTH_SDIF-1:0] count_sdif0;
    reg [COUNT_WIDTH_SDIF-1:0] count_sdif1;
    reg [COUNT_WIDTH_SDIF-1:0] count_sdif2;
    reg [COUNT_WIDTH_SDIF-1:0] count_sdif3;
    reg [COUNT_WIDTH_DDR -1:0] count_ddr;

    wire            FPLL_LOCK_int;
    wire            SDIF0_SPLL_LOCK_int;
    wire            SDIF1_SPLL_LOCK_int;
    wire            SDIF2_SPLL_LOCK_int;
    wire            SDIF3_SPLL_LOCK_int;

    reg             CONFIG1_DONE_q1;
    reg             CONFIG1_DONE_clk_base;

    reg             CONFIG2_DONE_q1;
    reg             CONFIG2_DONE_clk_base;

    reg             POWER_ON_RESET_N_q1;
    reg             POWER_ON_RESET_N_clk_base;
    reg             RESET_N_M2F_q1;
    reg             RESET_N_M2F_clk_base;
    reg             FIC_2_APB_M_PRESET_N_q1;
    reg             FIC_2_APB_M_PRESET_N_clk_base;
    reg             mss_ready_state;
    reg             mss_ready_select;
    //reg             FAB_RESET_N_int;
    reg             MSS_HPMS_READY_int;

    reg             count_ddr_enable_q1;
    reg             count_ddr_enable_rcosc;
    reg             ddr_settled_q1;
    reg             ddr_settled_clk_base;
    reg             count_sdif0_enable_q1;
    reg             count_sdif1_enable_q1;
    reg             count_sdif2_enable_q1;
    reg             count_sdif3_enable_q1;
    reg             count_sdif0_enable_rcosc;
    reg             count_sdif1_enable_rcosc;
    reg             count_sdif2_enable_rcosc;
    reg             count_sdif3_enable_rcosc;
    reg             release_sdif0_core_q1;
    reg             release_sdif1_core_q1;
    reg             release_sdif2_core_q1;
    reg             release_sdif3_core_q1;
    reg             release_sdif0_core_clk_base;
    reg             release_sdif1_core_clk_base;
    reg             release_sdif2_core_clk_base;
    reg             release_sdif3_core_clk_base;

    reg             EXT_RESET_OUT_int;
    reg             RESET_N_F2M_int;
    reg             M3_RESET_N_int;
    reg             MDDR_DDR_AXI_S_CORE_RESET_N_int;
    reg             FDDR_CORE_RESET_N_int;
    reg             SDIF0_PHY_RESET_N_int;
    reg             SDIF0_CORE_RESET_N_0;
    wire            SDIF0_CORE_RESET_N_int;
    reg             SDIF1_PHY_RESET_N_int;
    reg             SDIF1_CORE_RESET_N_0;
    wire            SDIF1_CORE_RESET_N_int;
    reg             SDIF2_PHY_RESET_N_int;
    reg             SDIF2_CORE_RESET_N_0;
    wire            SDIF2_CORE_RESET_N_int;
    reg             SDIF3_PHY_RESET_N_int;
    reg             SDIF3_CORE_RESET_N_0;
    wire            SDIF3_CORE_RESET_N_int;


    // When a SOFT_XXX input is asserted (high), the corresponding reset
    // output is asserted. (Reset outputs are mainly active low.)
    // When a SOFT_XXX input is low, the corresponding reset output is
    // controlled by the logic contained within this core.
    always @(*)
    begin
        if (ENABLE_SOFT_RESETS && SOFT_EXT_RESET_OUT            ) EXT_RESET_OUT               = 1'b1; else EXT_RESET_OUT               = EXT_RESET_OUT_int;
        if (ENABLE_SOFT_RESETS && SOFT_RESET_F2M                ) RESET_N_F2M                 = 1'b0; else RESET_N_F2M                 = RESET_N_F2M_int;
        if (ENABLE_SOFT_RESETS && SOFT_M3_RESET                 ) M3_RESET_N                  = 1'b0; else M3_RESET_N                  = M3_RESET_N_int;
        if (ENABLE_SOFT_RESETS && SOFT_MDDR_DDR_AXI_S_CORE_RESET) MDDR_DDR_AXI_S_CORE_RESET_N = 1'b0; else MDDR_DDR_AXI_S_CORE_RESET_N = MDDR_DDR_AXI_S_CORE_RESET_N_int;
        //if (ENABLE_SOFT_RESETS && SOFT_FAB_RESET                ) FAB_RESET_N                 = 1'b0; else FAB_RESET_N                 = FAB_RESET_N_int;
        //if (ENABLE_SOFT_RESETS && SOFT_USER_FAB_RESET           ) USER_FAB_RESET_N            = 1'b0; else USER_FAB_RESET_N            = USER_FAB_RESET_N_int;
        if (ENABLE_SOFT_RESETS && SOFT_FDDR_CORE_RESET          ) FDDR_CORE_RESET_N           = 1'b0; else FDDR_CORE_RESET_N           = FDDR_CORE_RESET_N_int;
        if (ENABLE_SOFT_RESETS && SOFT_SDIF0_PHY_RESET          ) SDIF0_PHY_RESET_N           = 1'b0; else SDIF0_PHY_RESET_N           = SDIF0_PHY_RESET_N_int;
        if (ENABLE_SOFT_RESETS && SOFT_SDIF0_CORE_RESET         ) SDIF0_CORE_RESET_N          = 1'b0; else SDIF0_CORE_RESET_N          = SDIF0_CORE_RESET_N_int;
        if (ENABLE_SOFT_RESETS && SOFT_SDIF1_PHY_RESET          ) SDIF1_PHY_RESET_N           = 1'b0; else SDIF1_PHY_RESET_N           = SDIF1_PHY_RESET_N_int;
        if (ENABLE_SOFT_RESETS && SOFT_SDIF1_CORE_RESET         ) SDIF1_CORE_RESET_N          = 1'b0; else SDIF1_CORE_RESET_N          = SDIF1_CORE_RESET_N_int;
        if (ENABLE_SOFT_RESETS && SOFT_SDIF2_PHY_RESET          ) SDIF2_PHY_RESET_N           = 1'b0; else SDIF2_PHY_RESET_N           = SDIF2_PHY_RESET_N_int;
        if (ENABLE_SOFT_RESETS && SOFT_SDIF2_CORE_RESET         ) SDIF2_CORE_RESET_N          = 1'b0; else SDIF2_CORE_RESET_N          = SDIF2_CORE_RESET_N_int;
        if (ENABLE_SOFT_RESETS && SOFT_SDIF3_PHY_RESET          ) SDIF3_PHY_RESET_N           = 1'b0; else SDIF3_PHY_RESET_N           = SDIF3_PHY_RESET_N_int;
        if (ENABLE_SOFT_RESETS && SOFT_SDIF3_CORE_RESET         ) SDIF3_CORE_RESET_N          = 1'b0; else SDIF3_CORE_RESET_N          = SDIF3_CORE_RESET_N_int;
        // SDIF0_0_CORE_RESET_N and SDIF0_1_CORE_RESET_N are intended for
        // use in an 090 or 060 device. This device has a single SERDES
        // interface with two separate PCIe controllers within it.
        // Separate CORE reset signals are provided for these two PCIe
        // cores.
        if (ENABLE_SOFT_RESETS && SOFT_SDIF0_0_CORE_RESET       ) SDIF0_0_CORE_RESET_N        = 1'b0; else SDIF0_0_CORE_RESET_N        = SDIF0_CORE_RESET_N_int;
        if (ENABLE_SOFT_RESETS && SOFT_SDIF0_1_CORE_RESET       ) SDIF0_1_CORE_RESET_N        = 1'b0; else SDIF0_1_CORE_RESET_N        = SDIF0_CORE_RESET_N_int;
    end

    // If a peripheral block is not in use, internally tie its PLL lock
    // signal high.
    assign FPLL_LOCK_int       = FDDR_IN_USE  ? FPLL_LOCK       : 1'b1;
    assign SDIF0_SPLL_LOCK_int = SDIF0_IN_USE ? SDIF0_SPLL_LOCK : 1'b1;
    assign SDIF1_SPLL_LOCK_int = SDIF1_IN_USE ? SDIF1_SPLL_LOCK : 1'b1;
    assign SDIF2_SPLL_LOCK_int = SDIF2_IN_USE ? SDIF2_SPLL_LOCK : 1'b1;
    assign SDIF3_SPLL_LOCK_int = SDIF3_IN_USE ? SDIF3_SPLL_LOCK : 1'b1;

    //---------------------------------------------------------------------
    // The following code creates a signal named MSS_HPMS_READY.
    //
    // After a power on reset, MSS_HPMS_READY will not go high until
    // FIC_2_APB_M_PRESET_N has gone high, and RESET_N_M2F has been
    // seen to be high for at least one cycle of RCOSC_25_50MHZ at some
    // stage.
    //
    // For subsequent warm resets, MSS_HPMS_READY will essentially follow
    // FIC_2_APB_M_PRESET_N and RESET_N_M2F is not considered at all.
    //---------------------------------------------------------------------
    // Synchronize POWER_ON_RESET_N to CLK_BASE domain.
    always @(posedge CLK_BASE or negedge POWER_ON_RESET_N)
    begin
        if (!POWER_ON_RESET_N)
        begin
            POWER_ON_RESET_N_q1         <= 1'b0;
            POWER_ON_RESET_N_clk_base   <= 1'b0;
        end
        else
        begin
            POWER_ON_RESET_N_q1         <= 1'b1;
            POWER_ON_RESET_N_clk_base   <= POWER_ON_RESET_N_q1;
        end
    end

    // Synchronize RESET_N_M2F to CLK_BASE domain.
    always @(posedge CLK_BASE or negedge RESET_N_M2F)
    begin
        if (!RESET_N_M2F)
        begin
            RESET_N_M2F_q1          <= 1'b0;
            RESET_N_M2F_clk_base    <= 1'b0;
        end
        else
        begin
            RESET_N_M2F_q1          <= 1'b1;
            RESET_N_M2F_clk_base    <= RESET_N_M2F_q1;
        end
    end

    // Synchronize FIC_2_APB_M_PRESET_N to CLK_BASE domain.
    always @(posedge CLK_BASE or negedge FIC_2_APB_M_PRESET_N)
    begin
        if (!FIC_2_APB_M_PRESET_N)
        begin
            FIC_2_APB_M_PRESET_N_q1         <= 1'b0;
            FIC_2_APB_M_PRESET_N_clk_base   <= 1'b0;
        end
        else
        begin
            FIC_2_APB_M_PRESET_N_q1         <= 1'b1;
            FIC_2_APB_M_PRESET_N_clk_base   <= FIC_2_APB_M_PRESET_N_q1;
        end
    end

    // At power on, state = '0' and select = '0'.
    // state will advance to '1' (and remain at '1') when RESET_N_M2F
    // is seen to be high.
    // When state = '1', select will move to '1' (and remain at '1') when
    // FIC_2_APB_M_PRESET_N is seen to be high.
    always @(posedge CLK_BASE or negedge POWER_ON_RESET_N_clk_base)
    begin
        if (!POWER_ON_RESET_N_clk_base)
        begin
            mss_ready_state  <= 1'b0;
            mss_ready_select <= 1'b0;
        end
        else
        begin
            if (RESET_N_M2F_clk_base)
            begin
                mss_ready_state  <= 1'b1;
            end
            if (FIC_2_APB_M_PRESET_N_clk_base && mss_ready_state == 1'b1)
            begin
                mss_ready_select <= 1'b1;
            end
        end
    end

    always @(posedge CLK_BASE or negedge POWER_ON_RESET_N_clk_base)
    begin
        if (!POWER_ON_RESET_N_clk_base)
        begin
            MSS_HPMS_READY_int <= 1'b0;
        end
        else
        begin
            if (mss_ready_select == 1'b0)
            begin
                MSS_HPMS_READY_int <= FIC_2_APB_M_PRESET_N_clk_base && RESET_N_M2F_clk_base;
            end
            else
            begin
                MSS_HPMS_READY_int <= FIC_2_APB_M_PRESET_N_clk_base;
            end
        end
    end

    assign MSS_HPMS_READY = MSS_HPMS_READY_int;

    //---------------------------------------------------------------------
    // Create a number of asynchronous resets.
    // Some source reset signals may be "combined" to create a single
    // asynchronous reset.
    //---------------------------------------------------------------------
    always @(*)
    begin
        sm0_areset_n = FAB_RESET_N
                       && POWER_ON_RESET_N
                       && MSS_HPMS_READY_int;
    end

    // Assertion of resets to MSS (RESET_N_F2M and M3_RESET_N) caused
    // by assertion of reset signal from fabric.
    always @(*)
    begin
        sm1_areset_n = FAB_RESET_N;
    end

    // There are a number of options for what can cause the external reset
    // to be asserted.
generate
  if (EXT_RESET_CFG == 0)
  begin
    always @(*)
    begin
        sm2_areset_n = POWER_ON_RESET_N;
    end
  end
  else if (EXT_RESET_CFG == 1)
  begin
    always @(*)
    begin
        sm2_areset_n = POWER_ON_RESET_N;
    end
  end
  else if (EXT_RESET_CFG == 2)
  begin
    always @(*)
    begin
        sm2_areset_n = MSS_HPMS_READY_int;
    end
  end
  else
  begin
    always @(*)
    begin
        sm2_areset_n = POWER_ON_RESET_N && MSS_HPMS_READY_int;
    end
  end
endgenerate

    // Individual async resets for each SDIF block
    always @(*)
    begin
        sdif0_areset_n = FAB_RESET_N
                         && POWER_ON_RESET_N
                         && MSS_HPMS_READY_int
                         && !SDIF0_PERST_N_re;
    end
    always @(*)
    begin
        sdif1_areset_n = FAB_RESET_N
                         && POWER_ON_RESET_N
                         && MSS_HPMS_READY_int
                         && !SDIF1_PERST_N_re;
    end
    always @(*)
    begin
        sdif2_areset_n = FAB_RESET_N
                         && POWER_ON_RESET_N
                         && MSS_HPMS_READY_int
                         && !SDIF2_PERST_N_re;
    end
    always @(*)
    begin
        sdif3_areset_n = FAB_RESET_N
                         && POWER_ON_RESET_N
                         && MSS_HPMS_READY_int
                         && !SDIF3_PERST_N_re;
    end

    // Internally tie-off PERST_N signals if SDIFx_PCIE_L2P2 parameters
    // are not set.
    assign SDIF0_PERST_N_int = SDIF0_PCIE_L2P2 ? SDIF0_PERST_N : 1'b0;
    assign SDIF1_PERST_N_int = SDIF1_PCIE_L2P2 ? SDIF1_PERST_N : 1'b0;
    assign SDIF2_PERST_N_int = SDIF2_PCIE_L2P2 ? SDIF2_PERST_N : 1'b0;
    assign SDIF3_PERST_N_int = SDIF3_PCIE_L2P2 ? SDIF3_PERST_N : 1'b0;

    // Detect rising edge on SDIF0_PERST_N signal
    always @(posedge CLK_BASE or negedge SDIF0_PERST_N_int)
    begin
        if (!SDIF0_PERST_N_int)
        begin
            SDIF0_PERST_N_q1 <= 1'b0;
            SDIF0_PERST_N_q2 <= 1'b0;
            SDIF0_PERST_N_q3 <= 1'b0;
            SDIF0_PERST_N_re <= 1'b0;
        end
        else
        begin
            SDIF0_PERST_N_q1 <= 1'b1;
            SDIF0_PERST_N_q2 <= SDIF0_PERST_N_q1;
            SDIF0_PERST_N_q3 <= SDIF0_PERST_N_q2;
            SDIF0_PERST_N_re <= SDIF0_PERST_N_q2 & !SDIF0_PERST_N_q3;
        end
    end

    // Detect rising edge on SDIF1_PERST_N signal
    always @(posedge CLK_BASE or negedge SDIF1_PERST_N_int)
    begin
        if (!SDIF1_PERST_N_int)
        begin
            SDIF1_PERST_N_q1 <= 1'b0;
            SDIF1_PERST_N_q2 <= 1'b0;
            SDIF1_PERST_N_q3 <= 1'b0;
            SDIF1_PERST_N_re <= 1'b0;
        end
        else
        begin
            SDIF1_PERST_N_q1 <= 1'b1;
            SDIF1_PERST_N_q2 <= SDIF1_PERST_N_q1;
            SDIF1_PERST_N_q3 <= SDIF1_PERST_N_q2;
            SDIF1_PERST_N_re <= SDIF1_PERST_N_q2 & !SDIF1_PERST_N_q3;
        end
    end

    // Detect rising edge on SDIF2_PERST_N signal
    always @(posedge CLK_BASE or negedge SDIF2_PERST_N_int)
    begin
        if (!SDIF2_PERST_N_int)
        begin
            SDIF2_PERST_N_q1 <= 1'b0;
            SDIF2_PERST_N_q2 <= 1'b0;
            SDIF2_PERST_N_q3 <= 1'b0;
            SDIF2_PERST_N_re <= 1'b0;
        end
        else
        begin
            SDIF2_PERST_N_q1 <= 1'b1;
            SDIF2_PERST_N_q2 <= SDIF2_PERST_N_q1;
            SDIF2_PERST_N_q3 <= SDIF2_PERST_N_q2;
            SDIF2_PERST_N_re <= SDIF2_PERST_N_q2 & !SDIF2_PERST_N_q3;
        end
    end

    // Detect rising edge on SDIF3_PERST_N signal
    always @(posedge CLK_BASE or negedge SDIF3_PERST_N_int)
    begin
        if (!SDIF3_PERST_N_int)
        begin
            SDIF3_PERST_N_q1 <= 1'b0;
            SDIF3_PERST_N_q2 <= 1'b0;
            SDIF3_PERST_N_q3 <= 1'b0;
            SDIF3_PERST_N_re <= 1'b0;
        end
        else
        begin
            SDIF3_PERST_N_q1 <= 1'b1;
            SDIF3_PERST_N_q2 <= SDIF3_PERST_N_q1;
            SDIF3_PERST_N_q3 <= SDIF3_PERST_N_q2;
            SDIF3_PERST_N_re <= SDIF3_PERST_N_q2 & !SDIF3_PERST_N_q3;
        end
    end

    //---------------------------------------------------------------------
    // Create versions of asynchronous resets that are released
    // synchronous to CLK_BASE.
    //---------------------------------------------------------------------
    always @(posedge CLK_BASE or negedge sm0_areset_n)
    begin
        if (!sm0_areset_n)
        begin
            sm0_areset_n_q1         <= 1'b0;
            sm0_areset_n_clk_base   <= 1'b0;
        end
        else
        begin
            sm0_areset_n_q1         <= 1'b1;
            sm0_areset_n_clk_base   <= sm0_areset_n_q1;
        end
    end

    always @(posedge CLK_BASE or negedge sm1_areset_n)
    begin
        if (!sm1_areset_n)
        begin
            sm1_areset_n_q1         <= 1'b0;
            sm1_areset_n_clk_base   <= 1'b0;
        end
        else
        begin
            sm1_areset_n_q1         <= 1'b1;
            sm1_areset_n_clk_base   <= sm1_areset_n_q1;
        end
    end

    always @(posedge CLK_BASE or negedge sm2_areset_n)
    begin
        if (!sm2_areset_n)
        begin
            sm2_areset_n_q1         <= 1'b0;
            sm2_areset_n_clk_base   <= 1'b0;
        end
        else
        begin
            sm2_areset_n_q1         <= 1'b1;
            sm2_areset_n_clk_base   <= sm2_areset_n_q1;
        end
    end

    always @(posedge CLK_BASE or negedge sdif0_areset_n)
    begin
        if (!sdif0_areset_n)
        begin
            sdif0_areset_n_q1       <= 1'b0;
            sdif0_areset_n_clk_base <= 1'b0;
        end
        else
        begin
            sdif0_areset_n_q1       <= 1'b1;
            sdif0_areset_n_clk_base <= sdif0_areset_n_q1;
        end
    end

    always @(posedge CLK_BASE or negedge sdif1_areset_n)
    begin
        if (!sdif1_areset_n)
        begin
            sdif1_areset_n_q1       <= 1'b0;
            sdif1_areset_n_clk_base <= 1'b0;
        end
        else
        begin
            sdif1_areset_n_q1       <= 1'b1;
            sdif1_areset_n_clk_base <= sdif1_areset_n_q1;
        end
    end

    always @(posedge CLK_BASE or negedge sdif2_areset_n)
    begin
        if (!sdif2_areset_n)
        begin
            sdif2_areset_n_q1       <= 1'b0;
            sdif2_areset_n_clk_base <= 1'b0;
        end
        else
        begin
            sdif2_areset_n_q1       <= 1'b1;
            sdif2_areset_n_clk_base <= sdif2_areset_n_q1;
        end
    end

    always @(posedge CLK_BASE or negedge sdif3_areset_n)
    begin
        if (!sdif3_areset_n)
        begin
            sdif3_areset_n_q1       <= 1'b0;
            sdif3_areset_n_clk_base <= 1'b0;
        end
        else
        begin
            sdif3_areset_n_q1       <= 1'b1;
            sdif3_areset_n_clk_base <= sdif3_areset_n_q1;
        end
    end

    //---------------------------------------------------------------------
    // Synchronize some resets to RCOSC_25_50MHZ domain.
    //---------------------------------------------------------------------
    always @(posedge RCOSC_25_50MHZ or negedge sm0_areset_n)
    begin
        if (!sm0_areset_n)
        begin
            sm0_areset_n_rcosc_q1   <= 1'b0;
            sm0_areset_n_rcosc      <= 1'b0;
        end
        else
        begin
            sm0_areset_n_rcosc_q1   <= 1'b1;
            sm0_areset_n_rcosc      <= sm0_areset_n_rcosc_q1;
        end
    end

    always @(posedge RCOSC_25_50MHZ or negedge sdif0_areset_n)
    begin
        if (!sdif0_areset_n)
        begin
            sdif0_areset_n_rcosc_q1 <= 1'b0;
            sdif0_areset_n_rcosc    <= 1'b0;
        end
        else
        begin
            sdif0_areset_n_rcosc_q1 <= 1'b1;
            sdif0_areset_n_rcosc    <= sdif0_areset_n_rcosc_q1;
        end
    end

    always @(posedge RCOSC_25_50MHZ or negedge sdif1_areset_n)
    begin
        if (!sdif1_areset_n)
        begin
            sdif1_areset_n_rcosc_q1 <= 1'b0;
            sdif1_areset_n_rcosc    <= 1'b0;
        end
        else
        begin
            sdif1_areset_n_rcosc_q1 <= 1'b1;
            sdif1_areset_n_rcosc    <= sdif1_areset_n_rcosc_q1;
        end
    end

    always @(posedge RCOSC_25_50MHZ or negedge sdif2_areset_n)
    begin
        if (!sdif2_areset_n)
        begin
            sdif2_areset_n_rcosc_q1 <= 1'b0;
            sdif2_areset_n_rcosc    <= 1'b0;
        end
        else
        begin
            sdif2_areset_n_rcosc_q1 <= 1'b1;
            sdif2_areset_n_rcosc    <= sdif2_areset_n_rcosc_q1;
        end
    end

    always @(posedge RCOSC_25_50MHZ or negedge sdif3_areset_n)
    begin
        if (!sdif3_areset_n)
        begin
            sdif3_areset_n_rcosc_q1 <= 1'b0;
            sdif3_areset_n_rcosc    <= 1'b0;
        end
        else
        begin
            sdif3_areset_n_rcosc_q1 <= 1'b1;
            sdif3_areset_n_rcosc    <= sdif3_areset_n_rcosc_q1;
        end
    end

    //---------------------------------------------------------------------
    // Synchronize CONFIG1_DONE input to CLK_BASE domain.
    //---------------------------------------------------------------------
    always @(posedge CLK_BASE or negedge sm0_areset_n_clk_base)
    begin
        if (!sm0_areset_n_clk_base)
        begin
            CONFIG1_DONE_q1         <= 1'b0;
            CONFIG1_DONE_clk_base   <= 1'b0;
        end
        else
        begin
            CONFIG1_DONE_q1         <= CONFIG1_DONE;
            CONFIG1_DONE_clk_base   <= CONFIG1_DONE_q1;
        end
    end

    //---------------------------------------------------------------------
    // Synchronize CONFIG2_DONE input to CLK_BASE domain.
    //---------------------------------------------------------------------
    always @(posedge CLK_BASE or negedge sm0_areset_n_clk_base)
    begin
        if (!sm0_areset_n_clk_base)
        begin
            CONFIG2_DONE_q1         <= 1'b0;
            CONFIG2_DONE_clk_base   <= 1'b0;
        end
        else
        begin
            CONFIG2_DONE_q1         <= CONFIG2_DONE;
            CONFIG2_DONE_clk_base   <= CONFIG2_DONE_q1;
        end
    end

    //---------------------------------------------------------------------
    // Synchronize PLL lock signals to CLK_BASE domain.
    //---------------------------------------------------------------------
    always @(posedge CLK_BASE or negedge sm0_areset_n_clk_base)
    begin
        if (!sm0_areset_n_clk_base)
        begin
            fpll_lock_q1       <= 1'b0;
            fpll_lock_q2       <= 1'b0;
            sdif0_spll_lock_q1 <= 1'b0;
            sdif0_spll_lock_q2 <= 1'b0;
            sdif1_spll_lock_q1 <= 1'b0;
            sdif1_spll_lock_q2 <= 1'b0;
            sdif2_spll_lock_q1 <= 1'b0;
            sdif2_spll_lock_q2 <= 1'b0;
            sdif3_spll_lock_q1 <= 1'b0;
            sdif3_spll_lock_q2 <= 1'b0;
        end
        else
        begin
            fpll_lock_q1       <= FPLL_LOCK_int;
            fpll_lock_q2       <= fpll_lock_q1;
            sdif0_spll_lock_q1 <= SDIF0_SPLL_LOCK_int;
            sdif0_spll_lock_q2 <= sdif0_spll_lock_q1;
            sdif1_spll_lock_q1 <= SDIF1_SPLL_LOCK_int;
            sdif1_spll_lock_q2 <= sdif1_spll_lock_q1;
            sdif2_spll_lock_q1 <= SDIF2_SPLL_LOCK_int;
            sdif2_spll_lock_q2 <= sdif2_spll_lock_q1;
            sdif3_spll_lock_q1 <= SDIF3_SPLL_LOCK_int;
            sdif3_spll_lock_q2 <= sdif3_spll_lock_q1;
        end
    end

    //---------------------------------------------------------------------
    // State machine 0
    // This is essentially the main state machine in the design.
    // Controls DDR resets and INIT_DONE output.
    // Can hold EXT_RESET (if core is appropriately configured).
    //---------------------------------------------------------------------
    // State machine 0 - combinational part
    always @(*)
    begin
        next_sm0_state = sm0_state;
        next_fddr_core_reset_n = FDDR_CORE_RESET_N_int;
        next_mddr_core_reset_n = MDDR_DDR_AXI_S_CORE_RESET_N_int;
        next_count_ddr_enable = count_ddr_enable;
        next_ddr_ready = DDR_READY_int;
        next_sdif_released = SDIF_RELEASED_int;
        next_sdif_ready = SDIF_READY_int;
        next_release_ext_reset = release_ext_reset;
        next_init_done = INIT_DONE_int;
        case (sm0_state)
            S0:
            begin
                next_sm0_state = S1;
            end
            S1:
            begin
                next_sm0_state = S2;
                // Release resets to FDDR and MDDR blocks
                next_fddr_core_reset_n = 1'b1;
                next_mddr_core_reset_n = 1'b1;
            end
            S2:
            begin
                // Wait for CONFIG1_DONE
                if (CONFIG1_DONE_clk_base)
                begin
                    next_sm0_state = S3;
                end
            end
            S3:
            begin
                // Start DDR counter after FPLL lock is asserted.
                // (CONFIG1_DONE assertion is necessary to enter this state.)
                if (fpll_lock_q2)
                begin
                    next_count_ddr_enable = 1'b1;
                end
                // Wait for assertion of all PLL lock signals
                if (fpll_lock_q2
                    && sdif0_spll_lock_q2 && sdif1_spll_lock_q2
                    && sdif2_spll_lock_q2 && sdif3_spll_lock_q2
                   )
                begin
                    next_sm0_state = S4;
                end
            end
            S4:
            begin
                if (ddr_settled_clk_base)
                begin
                    next_count_ddr_enable   = 1'b0;
                    next_ddr_ready          = 1'b1;
                end
                if (ddr_settled_clk_base
                    && release_sdif0_core_clk_base
                    && release_sdif1_core_clk_base
                    && release_sdif2_core_clk_base
                    && release_sdif3_core_clk_base
                   )
                begin
                    next_sm0_state          = S5;
                    next_sdif_released      = 1'b1;
                end
            end
            S5:
            begin
                // Wait for indication from configuration master that SDIF
                // configuration has been completed.
                if (CONFIG2_DONE_clk_base)
                begin
                    next_sm0_state          = S6;
                    next_sdif_ready         = 1'b1;
                    next_release_ext_reset  = 1'b1;
                end
            end
            S6:
            begin
                next_init_done = 1'b1;
            end
            default:
            begin
                next_sm0_state = S0;
            end
        endcase
    end

    // State machine 0 - sequential part
    always @(posedge CLK_BASE or negedge sm0_areset_n_clk_base)
    begin
        if (!sm0_areset_n_clk_base)
        begin
            sm0_state                       <= S0;
            FDDR_CORE_RESET_N_int           <= 1'b0;
            MDDR_DDR_AXI_S_CORE_RESET_N_int <= 1'b0;
            count_ddr_enable                <= 1'b0;
            DDR_READY_int                   <= 1'b0;
            SDIF_RELEASED_int               <= 1'b0;
            SDIF_READY_int                  <= 1'b0;
            release_ext_reset               <= 1'b0;
            INIT_DONE_int                   <= 1'b0;
        end
        else
        begin
            sm0_state                       <= next_sm0_state;
            FDDR_CORE_RESET_N_int           <= next_fddr_core_reset_n;
            MDDR_DDR_AXI_S_CORE_RESET_N_int <= next_mddr_core_reset_n;
            count_ddr_enable                <= next_count_ddr_enable;
            DDR_READY_int                   <= next_ddr_ready;
            SDIF_RELEASED_int               <= next_sdif_released;
            SDIF_READY_int                  <= next_sdif_ready;
            release_ext_reset               <= next_release_ext_reset;
            INIT_DONE_int                   <= next_init_done;
        end
    end

    assign DDR_READY        = DDR_READY_int;
    assign SDIF_RELEASED    = SDIF_RELEASED_int;
    assign SDIF_READY       = SDIF_READY_int;
    assign INIT_DONE        = INIT_DONE_int;

    // End of state machine 0.
    //---------------------------------------------------------------------

    //---------------------------------------------------------------------
    // State machine for controlling SDIF0 reset signals
    //---------------------------------------------------------------------
    always @(*)
    begin
        next_sdif0_state = sdif0_state;
        next_sdif0_phy_reset_n = SDIF0_PHY_RESET_N_int;
        next_sdif0_core_reset_n = SDIF0_CORE_RESET_N_0;
        next_count_sdif0_enable = count_sdif0_enable;
        case (sdif0_state)
            S0:
            begin
                next_sdif0_state = S1;
            end
            S1:
            begin
                next_sdif0_state = S2;
            end
            S2:
            begin
                // Wait for CONFIG1_DONE and PLL lock signal
                if (CONFIG1_DONE_clk_base && sdif0_spll_lock_q2)
                begin
                    next_sdif0_state = S3;
                    // Release SDIF0 phy reset and start SDIF0 counter
                    next_sdif0_phy_reset_n  = 1'b1;
                    next_count_sdif0_enable = 1'b1;
                end
            end
            S3:
            begin
                if (ddr_settled_clk_base && release_sdif0_core_clk_base)
                begin
                    next_sdif0_state = S3;
                    next_sdif0_core_reset_n = 1'b1;
                    next_count_sdif0_enable = 1'b0;
                end
            end
            default:
            begin
                next_sdif0_state = S0;
            end
        endcase
    end

    always @(posedge CLK_BASE or negedge sdif0_areset_n_clk_base)
    begin
        if (!sdif0_areset_n_clk_base)
        begin
            sdif0_state             <= S0;
            SDIF0_PHY_RESET_N_int   <= 1'b0;
            SDIF0_CORE_RESET_N_0    <= 1'b0;
            count_sdif0_enable      <= 1'b0;
        end
        else
        begin
            sdif0_state             <= next_sdif0_state;
            SDIF0_PHY_RESET_N_int   <= next_sdif0_phy_reset_n;
            SDIF0_CORE_RESET_N_0    <= next_sdif0_core_reset_n;
            count_sdif0_enable      <= next_count_sdif0_enable;
        end
    end
    // End of state machine for controlling SDIF0 reset signals.
    //---------------------------------------------------------------------

    //---------------------------------------------------------------------
    // State machine for controlling SDIF1 reset signals
    //---------------------------------------------------------------------
    always @(*)
    begin
        next_sdif1_state = sdif1_state;
        next_sdif1_phy_reset_n = SDIF1_PHY_RESET_N_int;
        next_sdif1_core_reset_n = SDIF1_CORE_RESET_N_0;
        next_count_sdif1_enable = count_sdif1_enable;
        case (sdif1_state)
            S0:
            begin
                next_sdif1_state = S1;
            end
            S1:
            begin
                next_sdif1_state = S2;
            end
            S2:
            begin
                // Wait for CONFIG1_DONE and PLL lock signal
                if (CONFIG1_DONE_clk_base && sdif1_spll_lock_q2)
                begin
                    next_sdif1_state = S3;
                    // Release SDIF1 phy reset and start SDIF1 counter
                    next_sdif1_phy_reset_n  = 1'b1;
                    next_count_sdif1_enable = 1'b1;
                end
            end
            S3:
            begin
                if (ddr_settled_clk_base && release_sdif1_core_clk_base)
                begin
                    next_sdif1_state = S3;
                    next_sdif1_core_reset_n = 1'b1;
                    next_count_sdif1_enable = 1'b0;
                end
            end
            default:
            begin
                next_sdif1_state = S0;
            end
        endcase
    end

    always @(posedge CLK_BASE or negedge sdif1_areset_n_clk_base)
    begin
        if (!sdif1_areset_n_clk_base)
        begin
            sdif1_state             <= S0;
            SDIF1_PHY_RESET_N_int   <= 1'b0;
            SDIF1_CORE_RESET_N_0    <= 1'b0;
            count_sdif1_enable      <= 1'b0;
        end
        else
        begin
            sdif1_state             <= next_sdif1_state;
            SDIF1_PHY_RESET_N_int   <= next_sdif1_phy_reset_n;
            SDIF1_CORE_RESET_N_0    <= next_sdif1_core_reset_n;
            count_sdif1_enable      <= next_count_sdif1_enable;
        end
    end
    // End of state machine for controlling SDIF1 reset signals.
    //---------------------------------------------------------------------

    //---------------------------------------------------------------------
    // State machine for controlling SDIF2 reset signals
    //---------------------------------------------------------------------
    always @(*)
    begin
        next_sdif2_state = sdif2_state;
        next_sdif2_phy_reset_n = SDIF2_PHY_RESET_N_int;
        next_sdif2_core_reset_n = SDIF2_CORE_RESET_N_0;
        next_count_sdif2_enable = count_sdif2_enable;
        case (sdif2_state)
            S0:
            begin
                next_sdif2_state = S1;
            end
            S1:
            begin
                next_sdif2_state = S2;
            end
            S2:
            begin
                // Wait for CONFIG1_DONE and PLL lock signal
                if (CONFIG1_DONE_clk_base && sdif2_spll_lock_q2)
                begin
                    next_sdif2_state = S3;
                    // Release SDIF2 phy reset and start SDIF2 counter
                    next_sdif2_phy_reset_n  = 1'b1;
                    next_count_sdif2_enable = 1'b1;
                end
            end
            S3:
            begin
                if (ddr_settled_clk_base && release_sdif2_core_clk_base)
                begin
                    next_sdif2_state = S3;
                    next_sdif2_core_reset_n = 1'b1;
                    next_count_sdif2_enable = 1'b0;
                end
            end
            default:
            begin
                next_sdif2_state = S0;
            end
        endcase
    end

    always @(posedge CLK_BASE or negedge sdif2_areset_n_clk_base)
    begin
        if (!sdif2_areset_n_clk_base)
        begin
            sdif2_state             <= S0;
            SDIF2_PHY_RESET_N_int   <= 1'b0;
            SDIF2_CORE_RESET_N_0    <= 1'b0;
            count_sdif2_enable      <= 1'b0;
        end
        else
        begin
            sdif2_state             <= next_sdif2_state;
            SDIF2_PHY_RESET_N_int   <= next_sdif2_phy_reset_n;
            SDIF2_CORE_RESET_N_0    <= next_sdif2_core_reset_n;
            count_sdif2_enable      <= next_count_sdif2_enable;
        end
    end
    // End of state machine for controlling SDIF2 reset signals.
    //---------------------------------------------------------------------

    //---------------------------------------------------------------------
    // State machine for controlling SDIF3 reset signals
    //---------------------------------------------------------------------
    always @(*)
    begin
        next_sdif3_state = sdif3_state;
        next_sdif3_phy_reset_n = SDIF3_PHY_RESET_N_int;
        next_sdif3_core_reset_n = SDIF3_CORE_RESET_N_0;
        next_count_sdif3_enable = count_sdif3_enable;
        case (sdif3_state)
            S0:
            begin
                next_sdif3_state = S1;
            end
            S1:
            begin
                next_sdif3_state = S2;
            end
            S2:
            begin
                // Wait for CONFIG1_DONE and PLL lock signal
                if (CONFIG1_DONE_clk_base && sdif3_spll_lock_q2)
                begin
                    next_sdif3_state = S3;
                    // Release SDIF3 phy reset and start SDIF3 counter
                    next_sdif3_phy_reset_n  = 1'b1;
                    next_count_sdif3_enable = 1'b1;
                end
            end
            S3:
            begin
                if (ddr_settled_clk_base && release_sdif3_core_clk_base)
                begin
                    next_sdif3_state = S3;
                    next_sdif3_core_reset_n = 1'b1;
                    next_count_sdif3_enable = 1'b0;
                end
            end
            default:
            begin
                next_sdif3_state = S0;
            end
        endcase
    end

    always @(posedge CLK_BASE or negedge sdif3_areset_n_clk_base)
    begin
        if (!sdif3_areset_n_clk_base)
        begin
            sdif3_state             <= S0;
            SDIF3_PHY_RESET_N_int   <= 1'b0;
            SDIF3_CORE_RESET_N_0    <= 1'b0;
            count_sdif3_enable      <= 1'b0;
        end
        else
        begin
            sdif3_state             <= next_sdif3_state;
            SDIF3_PHY_RESET_N_int   <= next_sdif3_phy_reset_n;
            SDIF3_CORE_RESET_N_0    <= next_sdif3_core_reset_n;
            count_sdif3_enable      <= next_count_sdif3_enable;
        end
    end
    // End of state machine for controlling SDIF3 reset signals.
    //---------------------------------------------------------------------

    //---------------------------------------------------------------------
    // Control of RESET_N_F2M and M3_RESET_N signals.
    //---------------------------------------------------------------------
    always @(posedge CLK_BASE or negedge sm1_areset_n_clk_base)
    begin
        if (!sm1_areset_n_clk_base)
        begin
            RESET_N_F2M_int <= 1'b0;
            M3_RESET_N_int  <= 1'b0;
        end
        else
        begin
            RESET_N_F2M_int <= 1'b1;
            M3_RESET_N_int  <= 1'b1;
        end
    end
    //---------------------------------------------------------------------

    //---------------------------------------------------------------------
    // State machine 2
    // Controls EXT_RESET_OUT signal.
    //---------------------------------------------------------------------
    // State machine 2 - combinational part
    always @(*)
    begin
        next_sm2_state = sm2_state;
        next_ext_reset_out = EXT_RESET_OUT_int;
        case (sm2_state)
            S0:
            begin
                next_sm2_state = S1;
            end
            S1:
            begin
                // release_ext_reset is controlled by state machine 0.
                if (release_ext_reset)
                begin
                    next_ext_reset_out = 1'b0;
                end
            end
            default:
            begin
                next_sm2_state = S0;
            end
        endcase
    end

    // State machine 2 - sequential part
    always @(posedge CLK_BASE or negedge sm2_areset_n_clk_base)
    begin
        if (!sm2_areset_n_clk_base)
        begin
            sm2_state           <= S0;
            EXT_RESET_OUT_int   <= (EXT_RESET_CFG > 0) ? 1'b1 : 1'b0;
        end
        else
        begin
            sm2_state           <= next_sm2_state;
            EXT_RESET_OUT_int   <= next_ext_reset_out;
        end
    end
    // End of state machine 2.
    //---------------------------------------------------------------------

    //---------------------------------------------------------------------
    // Counters clocked by RCOSC_25_50MHZ used to time SERDES and DDR
    // intervals.
    //

    // Synchronize enable signals to RCOSC_25_50MHZ domain
    always @(posedge RCOSC_25_50MHZ or negedge sm0_areset_n_rcosc)
    begin
        if (!sm0_areset_n_rcosc)
        begin
            count_sdif0_enable_q1       <= 1'b0;
            count_sdif1_enable_q1       <= 1'b0;
            count_sdif2_enable_q1       <= 1'b0;
            count_sdif3_enable_q1       <= 1'b0;
            count_sdif0_enable_rcosc    <= 1'b0;
            count_sdif1_enable_rcosc    <= 1'b0;
            count_sdif2_enable_rcosc    <= 1'b0;
            count_sdif3_enable_rcosc    <= 1'b0;
            count_ddr_enable_q1         <= 1'b0;
            count_ddr_enable_rcosc      <= 1'b0;
        end
        else
        begin
            count_sdif0_enable_q1       <= count_sdif0_enable;
            count_sdif1_enable_q1       <= count_sdif1_enable;
            count_sdif2_enable_q1       <= count_sdif2_enable;
            count_sdif3_enable_q1       <= count_sdif3_enable;
            count_sdif0_enable_rcosc    <= count_sdif0_enable_q1;
            count_sdif1_enable_rcosc    <= count_sdif1_enable_q1;
            count_sdif2_enable_rcosc    <= count_sdif2_enable_q1;
            count_sdif3_enable_rcosc    <= count_sdif3_enable_q1;
            count_ddr_enable_q1         <= count_ddr_enable;
            count_ddr_enable_rcosc      <= count_ddr_enable_q1;
        end
    end

    always @(posedge RCOSC_25_50MHZ or negedge sdif0_areset_n_rcosc)
    begin
        if (!sdif0_areset_n_rcosc)
        begin
            count_sdif0 <= 'd0;
            release_sdif0_core <= 1'b0;
        end
        else
        begin
            // If the SDIF0 interface is not being used, then set
            // release_sdif0_core high. This ensures that there is no
            // unnecessary waiting for SDIF0.
            if (SDIF0_IN_USE == 0)
            begin
                release_sdif0_core <= 1'b1;
            end
            else
            begin
                if (count_sdif0_enable_rcosc)
                begin
                    count_sdif0 <= count_sdif0 + 'd1;
                end
                // Detect when enough time has elapsed since release of
                // SDIF0 PHY reset to allow release of SDIF0 core reset.
                if (count_sdif0 == SDIF_INTERVAL)
                begin
                    release_sdif0_core <= 1'b1;
                end
            end
        end
    end

    always @(posedge RCOSC_25_50MHZ or negedge sdif1_areset_n_rcosc)
    begin
        if (!sdif1_areset_n_rcosc)
        begin
            count_sdif1 <= 'd0;
            release_sdif1_core <= 1'b0;
        end
        else
        begin
            // If the SDIF1 interface is not being used, then set
            // release_sdif1_core high. This ensures that there is no
            // unnecessary waiting for SDIF1.
            if (SDIF1_IN_USE == 0)
            begin
                release_sdif1_core <= 1'b1;
            end
            else
            begin
                if (count_sdif1_enable_rcosc)
                begin
                    count_sdif1 <= count_sdif1 + 'd1;
                end
                // Detect when enough time has elapsed since release of
                // SDIF1 PHY reset to allow release of SDIF1 core reset.
                if (count_sdif1 == SDIF_INTERVAL)
                begin
                    release_sdif1_core <= 1'b1;
                end
            end
        end
    end

    always @(posedge RCOSC_25_50MHZ or negedge sdif2_areset_n_rcosc)
    begin
        if (!sdif2_areset_n_rcosc)
        begin
            count_sdif2 <= 'd0;
            release_sdif2_core <= 1'b0;
        end
        else
        begin
            // If the SDIF2 interface is not being used, then set
            // release_sdif2_core high. This ensures that there is no
            // unnecessary waiting for SDIF2.
            if (SDIF2_IN_USE == 0)
            begin
                release_sdif2_core <= 1'b1;
            end
            else
            begin
                if (count_sdif2_enable_rcosc)
                begin
                    count_sdif2 <= count_sdif2 + 'd1;
                end
                // Detect when enough time has elapsed since release of
                // SDIF2 PHY reset to allow release of SDIF2 core reset.
                if (count_sdif2 == SDIF_INTERVAL)
                begin
                    release_sdif2_core <= 1'b1;
                end
            end
        end
    end

    always @(posedge RCOSC_25_50MHZ or negedge sdif3_areset_n_rcosc)
    begin
        if (!sdif3_areset_n_rcosc)
        begin
            count_sdif3 <= 'd0;
            release_sdif3_core <= 1'b0;
        end
        else
        begin
            // If the SDIF3 interface is not being used, then set
            // release_sdif3_core high. This ensures that there is no
            // unnecessary waiting for SDIF3.
            if (SDIF3_IN_USE == 0)
            begin
                release_sdif3_core <= 1'b1;
            end
            else
            begin
                if (count_sdif3_enable_rcosc)
                begin
                    count_sdif3 <= count_sdif3 + 'd1;
                end
                // Detect when enough time has elapsed since release of
                // SDIF3 PHY reset to allow release of SDIF3 core reset.
                if (count_sdif3 == SDIF_INTERVAL)
                begin
                    release_sdif3_core <= 1'b1;
                end
            end
        end
    end

    always @(posedge RCOSC_25_50MHZ or negedge sm0_areset_n_rcosc)
    begin
        if (!sm0_areset_n_rcosc)
        begin
            count_ddr <= 'd0;
            ddr_settled <= 1'b0;
        end
        else
        begin
            // If DDR is not being used, then set ddr_settled high. This
            // ensures that there is no unnecessary waiting for DDR
            // readiness.
            if (MDDR_IN_USE == 0 && FDDR_IN_USE == 0)
            begin
                ddr_settled <= 1'b1;
            end
            else
            begin
                if (count_ddr_enable_rcosc)
                begin
                    count_ddr <= count_ddr + 'd1;
                end
                // Detect when enough time has elapsed since release of DDR
                // core reset to allow DDR memory to be ready for use.
                if (count_ddr == DDR_INTERVAL)
                begin
                    ddr_settled <= 1'b1;
                end
            end
        end
    end

    // Synchronize "ready" signals to CLK_BASE domain
    always @(posedge CLK_BASE or negedge sm0_areset_n_clk_base)
    begin
        if (!sm0_areset_n_clk_base)
        begin
            release_sdif0_core_q1           <= 1'b0;
            release_sdif1_core_q1           <= 1'b0;
            release_sdif2_core_q1           <= 1'b0;
            release_sdif3_core_q1           <= 1'b0;
            release_sdif0_core_clk_base     <= 1'b0;
            release_sdif1_core_clk_base     <= 1'b0;
            release_sdif2_core_clk_base     <= 1'b0;
            release_sdif3_core_clk_base     <= 1'b0;
            ddr_settled_q1                  <= 1'b0;
            ddr_settled_clk_base            <= 1'b0;
        end
        else
        begin
            release_sdif0_core_q1           <= release_sdif0_core;
            release_sdif1_core_q1           <= release_sdif1_core;
            release_sdif2_core_q1           <= release_sdif2_core;
            release_sdif3_core_q1           <= release_sdif3_core;
            release_sdif0_core_clk_base     <= release_sdif0_core_q1;
            release_sdif1_core_clk_base     <= release_sdif1_core_q1;
            release_sdif2_core_clk_base     <= release_sdif2_core_q1;
            release_sdif3_core_clk_base     <= release_sdif3_core_q1;
            ddr_settled_q1                  <= ddr_settled;
            ddr_settled_clk_base            <= ddr_settled_q1;
        end
    end


    //---------------------------------------------------------------------
    // Implement PCIe HotReset workaround for SDIF blocks (if configured).
    //---------------------------------------------------------------------
generate
    if (
           (SDIF0_IN_USE        == 1)
        && (SDIF0_PCIE          == 1)
        && (SDIF0_PCIE_HOTRESET == 1)
       )
    begin
        coreresetp_pcie_hotreset sdif0_phr (
            .CLK_BASE               (CLK_BASE),
            .CLK_LTSSM              (CLK_LTSSM),
            .psel                   (SDIF0_PSEL),
            .pwrite                 (SDIF0_PWRITE),
            .prdata                 (SDIF0_PRDATA),
            .sdif_core_reset_n_0    (SDIF0_CORE_RESET_N_0),
            .sdif_core_reset_n      (SDIF0_CORE_RESET_N_int)
        );
    end
    else
    begin
        assign SDIF0_CORE_RESET_N_int = SDIF0_CORE_RESET_N_0;
    end
endgenerate

generate
    if (
           (SDIF1_IN_USE        == 1)
        && (SDIF1_PCIE          == 1)
        && (SDIF1_PCIE_HOTRESET == 1)
       )
    begin
        coreresetp_pcie_hotreset sdif1_phr (
            .CLK_BASE               (CLK_BASE),
            .CLK_LTSSM              (CLK_LTSSM),
            .psel                   (SDIF1_PSEL),
            .pwrite                 (SDIF1_PWRITE),
            .prdata                 (SDIF1_PRDATA),
            .sdif_core_reset_n_0    (SDIF1_CORE_RESET_N_0),
            .sdif_core_reset_n      (SDIF1_CORE_RESET_N_int)
        );
    end
    else
    begin
        assign SDIF1_CORE_RESET_N_int = SDIF1_CORE_RESET_N_0;
    end
endgenerate

generate
    if (
           (SDIF2_IN_USE        == 1)
        && (SDIF2_PCIE          == 1)
        && (SDIF2_PCIE_HOTRESET == 1)
       )
    begin
        coreresetp_pcie_hotreset sdif2_phr (
            .CLK_BASE               (CLK_BASE),
            .CLK_LTSSM              (CLK_LTSSM),
            .psel                   (SDIF2_PSEL),
            .pwrite                 (SDIF2_PWRITE),
            .prdata                 (SDIF2_PRDATA),
            .sdif_core_reset_n_0    (SDIF2_CORE_RESET_N_0),
            .sdif_core_reset_n      (SDIF2_CORE_RESET_N_int)
        );
    end
    else
    begin
        assign SDIF2_CORE_RESET_N_int = SDIF2_CORE_RESET_N_0;
    end
endgenerate

generate
    if (
           (SDIF3_IN_USE        == 1)
        && (SDIF3_PCIE          == 1)
        && (SDIF3_PCIE_HOTRESET == 1)
       )
    begin
        coreresetp_pcie_hotreset sdif3_phr (
            .CLK_BASE               (CLK_BASE),
            .CLK_LTSSM              (CLK_LTSSM),
            .psel                   (SDIF3_PSEL),
            .pwrite                 (SDIF3_PWRITE),
            .prdata                 (SDIF3_PRDATA),
            .sdif_core_reset_n_0    (SDIF3_CORE_RESET_N_0),
            .sdif_core_reset_n      (SDIF3_CORE_RESET_N_int)
        );
    end
    else
    begin
        assign SDIF3_CORE_RESET_N_int = SDIF3_CORE_RESET_N_0;
    end
endgenerate

endmodule
