// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

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
//      Checked In          : $Date: 2013-04-12 18:34:22 +0100 (Fri, 12 Apr 2013) $
//
//      Revision            : $Revision: 243882 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : APB sub system
//-----------------------------------------------------------------------------
module cmsdk_apb_subsystem_m0ds #(
  // Enable setting for APB extension ports
  // By default, all four extension ports are not used.
  // This can be overriden by parameters at instantiations.
  parameter  APB_EXT_PORT12_ENABLE=0,
  parameter  APB_EXT_PORT13_ENABLE=0,
  parameter  APB_EXT_PORT14_ENABLE=0,
  parameter  APB_EXT_PORT15_ENABLE=0,

  // If peripherals are generated with asynchronous clock domain to HCLK of the processor
  // You might need to add synchroniser to the IRQ signal.
  // In this example APB subsystem, the IRQ synchroniser is used to all peripherals
  // when the INCLUDE_IRQ_SYNCHRONIZER parameter is set to 1. In practice you may have
  // some IRQ signals need to be synchronised and some do not.
  parameter  INCLUDE_IRQ_SYNCHRONIZER=0,

  // By default the APB subsystem include a simple test slave use in ARM for
  // validation purpose.  You can remove this test slave by setting the
  // INCLUDE_APB_TEST_SLAVE paramater to 0,
  parameter  INCLUDE_APB_TEST_SLAVE = 1,

  // Parameter options for including peripherals
  parameter  INCLUDE_APB_GPIO0      = 1,  // Include simple timer #0
  parameter  INCLUDE_APB_TIMER1     = 1,  // Include simple timer #1
  parameter  INCLUDE_APB_DUALTIMER0 = 1,  // Include dual timer module
  parameter  INCLUDE_APB_UART0      = 1,  // Include simple UART #0
  parameter  INCLUDE_APB_UART1      = 1,  // Include simple UART #1
  parameter  INCLUDE_APB_UART2      = 1,  // Include simple UART #2.
                                          // Note : UART #2 is required for text messages
                                          //        display and to enable debug tester in
                                          //        debug tests
  parameter  INCLUDE_APB_UART3      = 1,  // Include simple UART #3.
  parameter  INCLUDE_APB_UART4      = 1,  // Include simple UART #3.
  parameter  INCLUDE_APB_WATCHDOG   = 1,  // Include APB watchdog module

  // Big endian - Add additional endian conversion logic to support big endian.
  //              (for ARM internal testing and evaluation of the processor in
  //              big endian configuration).
  //              0 = little endian, 1 = big endian
  //
  //              The example systems including this APB subsystem are designed as
  //              little endian. Most of the peripherals and memory system are
  //              little endian. This parameter is introduced to allows ARM to
  //              perform system level tests to verified behaviour of bus
  //              components in big endian configuration, and to allow designers
  //              to evaluate the processor in big endian configuration.
  //
  //              Use of this parameter is not recommended for actual product
  //              development as this adds extra hardware. For big endian systems
  //              ideally the peripherals should be modified to use a big endian
  //              programmer's model.
  parameter  BE = 0)
 (
// --------------------------------------------------------------------------
// Port Definitions
// --------------------------------------------------------------------------
  // AHB interface for AHB to APB bridge

  input  wire           HCLK,
  input  wire           HRESETn,

  input  wire           HSEL,
  input  wire   [15:0]  HADDR,
  input  wire    [1:0]  HTRANS,
  input  wire           HWRITE,
  input  wire    [2:0]  HSIZE,
  input  wire    [3:0]  HPROT,
  input  wire           HREADY,
  input  wire   [31:0]  HWDATA,
  output wire           HREADYOUT,
  output wire   [31:0]  HRDATA,
  output wire           HRESP,

  input  wire           PCLK,    // Peripheral clock
  input  wire           PCLKG,   // Gate PCLK for bus interface only
  input  wire           PCLKEN,  // Clock divider for AHB to APB bridge
  input  wire           PRESETn, // APB reset

  output wire    [11:0] PADDR,
  output wire           PWRITE,
  output wire   [31:0]  PWDATA,
  output wire           PENABLE,

  output wire           ext12_psel,
  output wire           ext13_psel,
  output wire           ext14_psel,
  output wire           ext15_psel,

  input  wire   [31:0]  ext12_prdata,
  input  wire           ext12_pready,
  input  wire           ext12_pslverr,

  input  wire   [31:0]  ext13_prdata,
  input  wire           ext13_pready,
  input  wire           ext13_pslverr,

  input  wire   [31:0]  ext14_prdata,
  input  wire           ext14_pready,
  input  wire           ext14_pslverr,

  input  wire   [31:0]  ext15_prdata,
  input  wire           ext15_pready,
  input  wire           ext15_pslverr,

  output wire           APBACTIVE,

  // Peripherals
  // UART
  input  wire           uart0_rxd,
  output wire           uart0_txd,
  output wire           uart0_txen,
  /*
  input  wire           uart1_rxd,
  output wire           uart1_txd,
  output wire           uart1_txen,

  input  wire           uart2_rxd,
  output wire           uart2_txd,
  output wire           uart2_txen,
  
  input  wire           uart3_rxd,
  output wire           uart3_txd,
  output wire           uart3_txen,
  
  input  wire           uart4_rxd,
  output wire           uart4_txd,
  output wire           uart4_txen,
  */
  
  // GPIO
  inout  wire    [7:0]  b_pad_gpio_porta,

    // Timer
  input  wire           timer0_extin,
  input  wire           timer1_extin,

  // Interrupt outputs
  output wire   [31:0]  apbsubsys_interrupt,
  output wire           watchdog_interrupt,
  output wire           watchdog_reset);

  // --------------------------------------------------------------------------
  // Internal wires
  // --------------------------------------------------------------------------
  wire     [15:0]  i_paddr;
  wire             i_psel;
  wire             i_penable;
  wire             i_pwrite;
  wire     [2:0]   i_pprot;
  wire     [3:0]   i_pstrb;
  wire     [31:0]  i_pwdata;

  // wire from APB slave mux to APB bridge
  wire             i_pready_mux;
  wire     [31:0]  i_prdata_mux;
  wire             i_pslverr_mux;

  // Peripheral signals
  wire             gpio0_psel;
  wire     [31:0]  gpio0_prdata;
  wire             gpio0_pready;
  wire             gpio0_pslverr;

  wire             timer1_psel;
  wire     [31:0]  timer1_prdata;
  wire             timer1_pready;
  wire             timer1_pslverr;

  wire             dualtimer2_psel;
  wire     [31:0]  dualtimer2_prdata;
  wire             dualtimer2_pready;
  wire             dualtimer2_pslverr;

  wire             watchdog_psel;
  wire     [31:0]  watchdog_prdata;
  wire             watchdog_pready;
  wire             watchdog_pslverr;

  wire             uart0_psel;
  wire     [31:0]  uart0_prdata;
  wire             uart0_pready;
  wire             uart0_pslverr;

  wire             uart1_psel;
  wire     [31:0]  uart1_prdata;
  wire             uart1_pready;
  wire             uart1_pslverr;

  wire             uart2_psel;
  wire     [31:0]  uart2_prdata;
  wire             uart2_pready;
  wire             uart2_pslverr;
  
  wire             uart3_psel;
  wire     [31:0]  uart3_prdata;
  wire             uart3_pready;
  wire             uart3_pslverr;
  
  wire             uart4_psel;
  wire     [31:0]  uart4_prdata;
  wire             uart4_pready;
  wire             uart4_pslverr;

  wire             test_slave_psel;
  wire     [31:0]  test_slave_prdata;
  wire             test_slave_pready;
  wire             test_slave_pslverr;

  wire             psel3;
  wire             psel7;
  wire             psel9;
  wire             psel10;

  // Interrupt signals from peripherals
  wire    [7:0]    gpio0_intr;
  wire             timer1_int;
  wire             dualtimer2a_int;
  wire             dualtimer2b_int;
  wire             dualtimer2_comb_int;

  wire             uart0_txint;
  wire             uart0_rxint;
  wire             uart0_txovrint;
  wire             uart0_rxovrint;
  wire             uart0_combined_int;
/*
  wire             uart1_txint;
  wire             uart1_rxint;
  wire             uart1_txovrint;
  wire             uart1_rxovrint;
  wire             uart1_combined_int;

  wire             uart2_txint;
  wire             uart2_rxint;
  wire             uart2_txovrint;
  wire             uart2_rxovrint;
  wire             uart2_combined_int;
  
  wire             uart3_txint;
  wire             uart3_rxint;
  wire             uart3_txovrint;
  wire             uart3_rxovrint;
  wire             uart3_combined_int;
  
  wire             uart4_txint;
  wire             uart4_rxint;
  wire             uart4_txovrint;
  wire             uart4_rxovrint;
  wire             uart4_combined_int;
*/


  wire             uart0_overflow_int;
/*
  wire             uart1_overflow_int;
  wire             uart2_overflow_int;
  wire             uart3_overflow_int;
  wire             uart4_overflow_int;
*/
  wire             watchdog_int;
  wire             watchdog_rst;

  // Synchronized interrupt signals
  wire             i_uart0_txint;
  wire             i_uart0_rxint;
  wire             i_uart0_overflow_int;
  /*
  wire             i_uart1_txint;
  wire             i_uart1_rxint;
  wire             i_uart1_overflow_int;
  wire             i_uart2_txint;
  wire             i_uart2_rxint;
  wire             i_uart2_overflow_int;
  wire             i_uart3_txint;
  wire             i_uart3_rxint;
  wire             i_uart3_overflow_int;
  wire             i_uart4_txint;
  wire             i_uart4_rxint;
  wire             i_uart4_overflow_int;
  */
  wire	  [7:0]    i_gpio0_intr;
  wire             i_timer1_int;
  wire             i_dualtimer2_int;
  wire             i_watchdog_int;
  wire             i_watchdog_rst;

  // endian handling
  wire             bigendian;
  assign           bigendian = (BE!=0) ? 1'b1 : 1'b0;

  wire   [31:0]    hwdata_le; // Little endian write data
  wire   [31:0]    hrdata_le; // Little endian read data
  wire             reg_be_swap_ctrl_en = HSEL & HTRANS[1] & HREADY & bigendian;
  reg     [1:0]    reg_be_swap_ctrl; // registered byte swap control
  wire    [1:0]    nxt_be_swap_ctrl; // next state of byte swap control

  assign nxt_be_swap_ctrl[1] = bigendian & (HSIZE[1:0]==2'b10); // Swap upper and lower half word
  assign nxt_be_swap_ctrl[0] = bigendian & (HSIZE[1:0]!=2'b00); // Swap byte within halfword

  // Register byte swap control for data phase
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      reg_be_swap_ctrl <= 2'b00;
    else if (reg_be_swap_ctrl_en)
      reg_be_swap_ctrl <= nxt_be_swap_ctrl;
    end

  // swap byte within half word
  wire  [31:0] hwdata_mux_1 = (reg_be_swap_ctrl[0] & bigendian) ?
     {HWDATA[23:16],HWDATA[31:24],HWDATA[7:0],HWDATA[15:8]}:
     {HWDATA[31:24],HWDATA[23:16],HWDATA[15:8],HWDATA[7:0]};
  // swap lower and upper half word
  assign       hwdata_le    = (reg_be_swap_ctrl[1] & bigendian) ?
     {hwdata_mux_1[15: 0],hwdata_mux_1[31:16]}:
     {hwdata_mux_1[31:16],hwdata_mux_1[15:0]};
  // swap byte within half word
  wire  [31:0] hrdata_mux_1 = (reg_be_swap_ctrl[0] & bigendian) ?
     {hrdata_le[23:16],hrdata_le[31:24],hrdata_le[ 7:0],hrdata_le[15:8]}:
     {hrdata_le[31:24],hrdata_le[23:16],hrdata_le[15:8],hrdata_le[7:0]};
  // swap lower and upper half word
  assign       HRDATA       = (reg_be_swap_ctrl[1] & bigendian) ?
     {hrdata_mux_1[15: 0],hrdata_mux_1[31:16]}:
     {hrdata_mux_1[31:16],hrdata_mux_1[15:0]};

  // AHB to APB bus bridge
  cmsdk_ahb_to_apb
  #(.ADDRWIDTH      (16),
    .REGISTER_RDATA (1),
    .REGISTER_WDATA (0))
  u_ahb_to_apb(
    // AHB side
    .HCLK     (HCLK),
    .HRESETn  (HRESETn),
    .HSEL     (HSEL),
    .HADDR    (HADDR[15:0]),
    .HTRANS   (HTRANS),
    .HSIZE    (HSIZE),
    .HPROT    (HPROT),
    .HWRITE   (HWRITE),
    .HREADY   (HREADY),
    .HWDATA   (hwdata_le),

    .HREADYOUT(HREADYOUT), // AHB Outputs
    .HRDATA   (hrdata_le),
    .HRESP    (HRESP),

    .PADDR    (i_paddr[15:0]),
    .PSEL     (i_psel),
    .PENABLE  (i_penable),
    .PSTRB    (i_pstrb),
    .PPROT    (i_pprot),
    .PWRITE   (i_pwrite),
    .PWDATA   (i_pwdata),

    .APBACTIVE(APBACTIVE),
    .PCLKEN   (PCLKEN),     // APB clock enable signal

    .PRDATA   (i_prdata_mux),
    .PREADY   (i_pready_mux),
    .PSLVERR  (i_pslverr_mux)
    );

  // APB slave multiplexer
  cmsdk_apb_slave_mux
    #( // Parameter to determine which ports are used
    .PORT0_ENABLE  (INCLUDE_APB_GPIO0), // gpio 0
    .PORT1_ENABLE  (INCLUDE_APB_TIMER1), // timer 1
    .PORT2_ENABLE  (INCLUDE_APB_DUALTIMER0), // dual timer 0
    .PORT3_ENABLE  (0), // not used
    .PORT4_ENABLE  (INCLUDE_APB_UART0), // uart 0
    .PORT5_ENABLE  (INCLUDE_APB_UART1), // uart 1
    .PORT6_ENABLE  (INCLUDE_APB_UART2), // uart 2
    .PORT7_ENABLE  (INCLUDE_APB_UART3), // uart 3 (added for DesignStart)
    .PORT8_ENABLE  (INCLUDE_APB_WATCHDOG), // watchdog
    .PORT9_ENABLE  (INCLUDE_APB_UART4), // uart 4)(added for DesignStart)
    .PORT10_ENABLE (0), // not used
    .PORT11_ENABLE (INCLUDE_APB_TEST_SLAVE), // test slave for validation purpose
    .PORT12_ENABLE (APB_EXT_PORT12_ENABLE),
    .PORT13_ENABLE (APB_EXT_PORT13_ENABLE),
    .PORT14_ENABLE (APB_EXT_PORT14_ENABLE),
    .PORT15_ENABLE (APB_EXT_PORT15_ENABLE)
    )
    u_apb_slave_mux (
    // Inputs
    .DECODE4BIT        (i_paddr[15:12]),
    .PSEL              (i_psel),
    // PSEL (output) and return status & data (inputs) for each port
    .PSEL0             (gpio0_psel),
    .PREADY0           (gpio0_pready),
    .PRDATA0           (gpio0_prdata),
    .PSLVERR0          (gpio0_pslverr),

    .PSEL1             (timer1_psel),
    .PREADY1           (timer1_pready),
    .PRDATA1           (timer1_prdata),
    .PSLVERR1          (timer1_pslverr),

    .PSEL2             (dualtimer2_psel),
    .PREADY2           (dualtimer2_pready),
    .PRDATA2           (dualtimer2_prdata),
    .PSLVERR2          (dualtimer2_pslverr),

    .PSEL3             (psel3),
    .PREADY3           (1'b1),
    .PRDATA3           (32'h00000000),
    .PSLVERR3          (1'b0),

    .PSEL4             (uart0_psel),
    .PREADY4           (uart0_pready),
    .PRDATA4           (uart0_prdata),
    .PSLVERR4          (uart0_pslverr),
/*
    .PSEL5             (uart1_psel),
    .PREADY5           (uart1_pready),
    .PRDATA5           (uart1_prdata),
    .PSLVERR5          (uart1_pslverr),

    .PSEL6             (uart2_psel),
    .PREADY6           (uart2_pready),
    .PRDATA6           (uart2_prdata),
    .PSLVERR6          (uart2_pslverr),

    .PSEL7             (uart3_psel),
    .PREADY7           (uart3_pready),
    .PRDATA7           (uart3_prdata),
    .PSLVERR7          (uart3_pslverr),

    .PSEL8             (watchdog_psel),
    .PREADY8           (watchdog_pready),
    .PRDATA8           (watchdog_prdata),
    .PSLVERR8          (watchdog_pslverr),

    .PSEL9             (uart4_psel),
    .PREADY9           (uart4_pready),
    .PRDATA9           (uart4_prdata),
    .PSLVERR9          (uart4_pslverr),
*/
    .PSEL10            (psel10),
    .PREADY10          (1'b1),
    .PRDATA10          (32'h00000000),
    .PSLVERR10         (1'b0),

    .PSEL11            (test_slave_psel),
    .PREADY11          (test_slave_pready),
    .PRDATA11          (test_slave_prdata),
    .PSLVERR11         (test_slave_pslverr),

    .PSEL12            (ext12_psel),
    .PREADY12          (ext12_pready),
    .PRDATA12          (ext12_prdata),
    .PSLVERR12         (ext12_pslverr),

    .PSEL13            (ext13_psel),
    .PREADY13          (ext13_pready),
    .PRDATA13          (ext13_prdata),
    .PSLVERR13         (ext13_pslverr),

    .PSEL14            (ext14_psel),
    .PREADY14          (ext14_pready),
    .PRDATA14          (ext14_prdata),
    .PSLVERR14         (ext14_pslverr),

    .PSEL15            (ext15_psel),
    .PREADY15          (ext15_pready),
    .PRDATA15          (ext15_prdata),
    .PSLVERR15         (ext15_pslverr),

    // Output
    .PREADY            (i_pready_mux),
    .PRDATA            (i_prdata_mux),
    .PSLVERR           (i_pslverr_mux)
    );

  // -----------------------------------------------------------------
  // GPIO
  generate if (INCLUDE_APB_GPIO0 == 1) begin : gen_apb_gpio_0
  gpio  u_gpio_0(
        .pclk(PCLK),
	.presetn(PRESETn),

 	.psel(gpio0_psel),
	.paddr(i_paddr[6:2]),
	.penable(i_penable),	
	.pwrite(i_pwrite),
	.pwdata(i_pwdata),
	
	.prdata(gpio0_prdata),
	.pready(gpio0_pready),
	.pslverr(gpio0_pslverr),
	.b_pad_gpio_porta(b_pad_gpio_porta[7:0]),
	.pclk_intr(1'b1),
	.gpio_intr(gpio0_intr)
  );
  end else
  begin : gen_no_apb_gpio_0
    assign gpio0_prdata = {32{1'b0}};
    assign gpio0_pready = 1'b1;
    assign gpio0_pslverr = 1'b0;
    assign gpio0_intr = {8{1'b0}};
    assign b_pad_gpio_porta = {8{1'b0}};
    end endgenerate
  
  // Timers

  generate if (INCLUDE_APB_TIMER1 == 1) begin : gen_apb_timer_1
  cmsdk_apb_timer u_apb_timer_1 (
    .PCLK              (PCLK),     // PCLK for timer operation
    .PCLKG             (PCLKG),    // Gated PCLK for bus
    .PRESETn           (PRESETn),  // Reset
    // APB interface inputs
    .PSEL              (timer1_psel),
    .PADDR             (i_paddr[11:2]),
    .PENABLE           (i_penable),
    .PWRITE            (i_pwrite),
    .PWDATA            (i_pwdata),

    .ECOREVNUM         (4'h0),// Engineering-change-order revision bits

      // APB interface outputs
    .PRDATA            (timer1_prdata),
    .PREADY            (timer1_pready),
    .PSLVERR           (timer1_pslverr),

    .EXTIN             (timer1_extin),  // External input
    .TIMERINT          (timer1_int)     // interrupt output
  );
  end else
  begin : gen_no_apb_timer_1
    assign timer1_prdata  = {32{1'b0}};
    assign timer1_pready  = 1'b1;
    assign timer1_pslverr = 1'b0;
    assign timer1_int     = 1'b0;
  end endgenerate

  // -----------------------------------------------------------------
  // Dual Timers
  generate if (INCLUDE_APB_DUALTIMER0 == 1) begin : gen_apb_dualtimers_2
  cmsdk_apb_dualtimers u_apb_dualtimers_2 (
   // Inputs
    .PCLK              (PCLKG),
    .PRESETn           (PRESETn),
    .PENABLE           (i_penable),
    .PSEL              (dualtimer2_psel),
    .PADDR             (i_paddr[11:2]),
    .PWRITE            (i_pwrite),
    .PWDATA            (i_pwdata),

    .TIMCLK            (PCLK),
    .TIMCLKEN1         (1'b1), // simple case:the timer 0 clock always enable
    .TIMCLKEN2         (1'b1), // simple case:the timer 1 clock always enable

    .ECOREVNUM         (4'h0),// Engineering-change-order revision bits

   // Outputs
    .PRDATA            (dualtimer2_prdata),

    .TIMINT1           (dualtimer2a_int), // not used
    .TIMINT2           (dualtimer2b_int), // not used
    .TIMINTC           (dualtimer2_comb_int)

  );
  end else
  begin : gen_no_apb_dualtimers_2
    assign dualtimer2_prdata   = {32{1'b0}};
    assign dualtimer2_comb_int = 1'b0;
    assign dualtimer2a_int     = 1'b0;
    assign dualtimer2b_int     = 1'b0;
  end endgenerate

  // When using peripherals with APB (AMBA 2.0), the PREADY and PSLVERR
  // signals are not required. So we connect PREADY to 1 and PSLVERR to 0.
  assign dualtimer2_pslverr = 1'b0;
  assign dualtimer2_pready  = 1'b1;

  // -----------------------------------------------------------------
  // Watchdog

  generate if (INCLUDE_APB_WATCHDOG == 1) begin : gen_apb_watchdog
  cmsdk_apb_watchdog u_apb_watchdog (
   // Inputs
    .PCLK              (PCLKG),
    .PRESETn           (PRESETn),
    .PENABLE           (i_penable),
    .PSEL              (watchdog_psel),
    .PADDR             (i_paddr[11:2]),
    .PWRITE            (i_pwrite),
    .PWDATA            (i_pwdata),

    .WDOGCLK           (PCLK),
    .WDOGCLKEN         (1'b1),
    .WDOGRESn          (PRESETn),

    .ECOREVNUM         (4'h0),// Engineering-change-order revision bits

   // Outputs
    .PRDATA            (watchdog_prdata),

    .WDOGINT           (watchdog_int),  // connect to NMI
    .WDOGRES           (watchdog_rst)   // connect to reset generator

  );
  end else
  begin : gen_no_apb_watchdog
    assign watchdog_prdata  = {32{1'b0}};
    assign watchdog_int     = 1'b0;
    assign watchdog_rst     = 1'b0;
  end endgenerate

  // When using peripherals with APB (AMBA 2.0), the PREADY and PSLVERR
  // signals are not required. So we connect PREADY to 1 and PSLVERR to 0.
  assign watchdog_pslverr = 1'b0;
  assign watchdog_pready  = 1'b1;

  // -----------------------------------------------------------------
  // UARTs
  generate if (INCLUDE_APB_UART0 == 1) begin : gen_apb_uart_0
  cmsdk_apb_uart u_apb_uart_0 (
    .PCLK              (PCLK),     // Peripheral clock
    .PCLKG             (PCLKG),    // Gated PCLK for bus
    .PRESETn           (PRESETn),  // Reset

    .PSEL              (uart0_psel),     // APB interface inputs
    .PADDR             (i_paddr[11:2]),
    .PENABLE           (i_penable),
    .PWRITE            (i_pwrite),
    .PWDATA            (i_pwdata),

    .PRDATA            (uart0_prdata),   // APB interface outputs
    .PREADY            (uart0_pready),
    .PSLVERR           (uart0_pslverr),

    .ECOREVNUM         (4'h0),// Engineering-change-order revision bits

    .RXD               (uart0_rxd),      // Receive data

    .TXD               (uart0_txd),      // Transmit data
    .TXEN              (uart0_txen),     // Transmit Enabled

    .BAUDTICK          (),   // Baud rate x16 tick output (for testing)

    .TXINT             (uart0_txint),       // Transmit Interrupt
    .RXINT             (uart0_rxint),       // Receive  Interrupt
    .TXOVRINT          (uart0_txovrint),    // Transmit Overrun Interrupt
    .RXOVRINT          (uart0_rxovrint),    // Receive  Overrun Interrupt
    .UARTINT           (uart0_combined_int) // Combined Interrupt (not used)
  );
  end else
  begin : gen_no_apb_uart_0
    assign uart0_prdata  = {32{1'b0}};
    assign uart0_pready  = 1'b1;
    assign uart0_pslverr = 1'b0;
    assign uart0_txd     = 1'b1;
    assign uart0_txen    = 1'b0;
    assign uart0_txint   = 1'b0;
    assign uart0_rxint   = 1'b0;
    assign uart0_txovrint = 1'b0;
    assign uart0_rxovrint = 1'b0;
    assign uart0_combined_int = 1'b0;
  end endgenerate
/*
  generate if (INCLUDE_APB_UART1 == 1) begin : gen_apb_uart_1
  cmsdk_apb_uart u_apb_uart_1 (
    .PCLK              (PCLK),     // Peripheral clock
    .PCLKG             (PCLKG),    // Gated PCLK for bus
    .PRESETn           (PRESETn),  // Reset

    .PSEL              (uart1_psel),     // APB interface inputs
    .PADDR             (i_paddr[11:2]),
    .PENABLE           (i_penable),
    .PWRITE            (i_pwrite),
    .PWDATA            (i_pwdata),

    .PRDATA            (uart1_prdata),   // APB interface outputs
    .PREADY            (uart1_pready),
    .PSLVERR           (uart1_pslverr),

    .ECOREVNUM         (4'h0),// Engineering-change-order revision bits

    .RXD               (uart1_rxd),      // Receive data

    .TXD               (uart1_txd),      // Transmit data
    .TXEN              (uart1_txen),     // Transmit Enabled

    .BAUDTICK          (),   // Baud rate x16 tick output (for testing)

    .TXINT             (uart1_txint),       // Transmit Interrupt
    .RXINT             (uart1_rxint),       // Receive  Interrupt
    .TXOVRINT          (uart1_txovrint),    // Transmit Overrun Interrupt
    .RXOVRINT          (uart1_rxovrint),    // Receive  Overrun Interrupt
    .UARTINT           (uart1_combined_int) // Combined Interrupt (not used)
  );
  end else
  begin : gen_no_apb_uart_1
    assign uart1_prdata  = {32{1'b0}};
    assign uart1_pready  = 1'b1;
    assign uart1_pslverr = 1'b0;
    assign uart1_txd     = 1'b1;
    assign uart1_txen    = 1'b0;
    assign uart1_txint   = 1'b0;
    assign uart1_rxint   = 1'b0;
    assign uart1_txovrint = 1'b0;
    assign uart1_rxovrint = 1'b0;
    assign uart1_combined_int = 1'b0;
  end endgenerate

  generate if (INCLUDE_APB_UART2 == 1) begin : gen_apb_uart_2
  cmsdk_apb_uart u_apb_uart_2 (
    .PCLK              (PCLK),     // Peripheral clock
    .PCLKG             (PCLKG),    // Gated PCLK for bus
    .PRESETn           (PRESETn),  // Reset

    .PSEL              (uart2_psel),     // APB interface inputs
    .PADDR             (i_paddr[11:2]),
    .PENABLE           (i_penable),
    .PWRITE            (i_pwrite),
    .PWDATA            (i_pwdata),

    .PRDATA            (uart2_prdata),   // APB interface outputs
    .PREADY            (uart2_pready),
    .PSLVERR           (uart2_pslverr),

    .ECOREVNUM         (4'h0),// Engineering-change-order revision bits

    .RXD               (uart2_rxd),      // Receive data

    .TXD               (uart2_txd),      // Transmit data
    .TXEN              (uart2_txen),     // Transmit Enabled

    .BAUDTICK          (),   // Baud rate x16 tick output (for testing)

    .TXINT             (uart2_txint),       // Transmit Interrupt
    .RXINT             (uart2_rxint),       // Receive  Interrupt
    .TXOVRINT          (uart2_txovrint),    // Transmit Overrun Interrupt
    .RXOVRINT          (uart2_rxovrint),    // Receive  Overrun Interrupt
    .UARTINT           (uart2_combined_int) // Combined Interrupt (not used)
  );
  end else
  begin : gen_no_apb_uart_2
    assign uart2_prdata  = {32{1'b0}};
    assign uart2_pready  = 1'b1;
    assign uart2_pslverr = 1'b0;
    assign uart2_txd     = 1'b1;
    assign uart2_txen    = 1'b0;
    assign uart2_txint   = 1'b0;
    assign uart2_rxint   = 1'b0;
    assign uart2_txovrint = 1'b0;
    assign uart2_rxovrint = 1'b0;
    assign uart2_combined_int = 1'b0;
  end endgenerate


generate if (INCLUDE_APB_UART3 == 1) begin : gen_apb_uart_3
  
  cmsdk_apb_uart u_apb_uart_3 (
    .PCLK              (PCLK),              // Peripheral clock
    .PCLKG             (PCLKG),             // Gated PCLK for bus
    .PRESETn           (PRESETn),           // Reset

    .PSEL              (uart3_psel),     // APB interface inputs
    .PADDR             (i_paddr[11:2]),
    .PENABLE           (i_penable),
    .PWRITE            (i_pwrite),
    .PWDATA            (i_pwdata),

    .PRDATA            (uart3_prdata),   // APB interface outputs
    .PREADY            (uart3_pready),
    .PSLVERR           (uart3_pslverr),

    .ECOREVNUM         (4'h0),              // Engineering-change-order revision bits

    .RXD               (uart3_rxd),         // Receive data

    .TXD               (uart3_txd),         // Transmit data
    .TXEN              (uart3_txen),        // Transmit Enabled

    .BAUDTICK          (),                  // Baud rate x16 tick output (for testing)

    .TXINT             (uart3_txint),       // Transmit Interrupt
    .RXINT             (uart3_rxint),       // Receive  Interrupt
    .TXOVRINT          (uart3_txovrint),    // Transmit Overrun Interrupt
    .RXOVRINT          (uart3_rxovrint),    // Receive  Overrun Interrupt
    .UARTINT           (uart3_combined_int) // Combined Interrupt (not used)
  );
  end else
  begin : gen_no_apb_uart_3
    assign uart3_prdata  = {32{1'b0}};
    assign uart3_pready  = 1'b1;
    assign uart3_pslverr = 1'b0;
    assign uart3_txd     = 1'b1;
    assign uart3_txen    = 1'b0;
    assign uart3_txint   = 1'b0;
    assign uart3_rxint   = 1'b0;
    assign uart3_txovrint = 1'b0;
    assign uart3_rxovrint = 1'b0;
    assign uart3_combined_int = 1'b0;
  end endgenerate
  
  
  generate if (INCLUDE_APB_UART4 == 1) begin : gen_apb_uart_4
    
    cmsdk_apb_uart u_apb_uart_4 (
      .PCLK              (PCLK),              // Peripheral clock
      .PCLKG             (PCLKG),             // Gated PCLK for bus
      .PRESETn           (PRESETn),           // Reset
  
      .PSEL              (uart4_psel),     // APB interface inputs
      .PADDR             (i_paddr[11:2]),
      .PENABLE           (i_penable),
      .PWRITE            (i_pwrite),
      .PWDATA            (i_pwdata),
  
      .PRDATA            (uart4_prdata),   // APB interface outputs
      .PREADY            (uart4_pready),
      .PSLVERR           (uart4_pslverr),

      .ECOREVNUM         (4'h0),              // Engineering-change-order revision bits
  
      .RXD               (uart4_rxd),         // Receive data
  
      .TXD               (uart4_txd),         // Transmit data
      .TXEN              (uart4_txen),        // Transmit Enabled
  
      .BAUDTICK          (),                  // Baud rate x16 tick output (for testing)
  
      .TXINT             (uart4_txint),       // Transmit Interrupt
      .RXINT             (uart4_rxint),       // Receive  Interrupt
      .TXOVRINT          (uart4_txovrint),    // Transmit Overrun Interrupt
      .RXOVRINT          (uart4_rxovrint),    // Receive  Overrun Interrupt
      .UARTINT           (uart4_combined_int) // Combined Interrupt (not used)
    );
    end else
    begin : gen_no_apb_uart_4
      assign uart4_prdata  = {32{1'b0}};
      assign uart4_pready  = 1'b1;
      assign uart4_pslverr = 1'b0;
      assign uart4_txd     = 1'b1;
      assign uart4_txen    = 1'b0;
      assign uart4_txint   = 1'b0;
      assign uart4_rxint   = 1'b0;
      assign uart4_txovrint = 1'b0;
      assign uart4_rxovrint = 1'b0;
      assign uart4_combined_int = 1'b0;
    end endgenerate
*/

  // -----------------------------------------------------------------
  // Test slave (for validation purpose)
  generate if (INCLUDE_APB_TEST_SLAVE == 1) begin : gen_apb_test_slave

  cmsdk_apb_test_slave u_apb_test_slave(
    .PCLK              (PCLKG),    // use Gated PCLK for bus
    .PRESETn           (PRESETn),  // Reset

    .PSEL              (test_slave_psel),     // APB interface inputs
    .PADDR             (i_paddr[11:2]),
    .PENABLE           (i_penable),
    .PSTRB             (i_pstrb[3:0]),
    .PWRITE            (i_pwrite),
    .PWDATA            (i_pwdata),

    .PRDATA            (test_slave_prdata),   // APB interface outputs
    .PREADY            (test_slave_pready),
    .PSLVERR           (test_slave_pslverr)
  );

  end else
  begin : gen_no_apb_test_slave
    assign test_slave_prdata  = {32{1'b0}};
    assign test_slave_pready  = 1'b1;
    assign test_slave_pslverr = 1'b0;
  end endgenerate
  // -----------------------------------------------------------------
  // Connection to external
  assign PADDR   = i_paddr[11:0];
  assign PENABLE = i_penable;
  assign PWRITE  = i_pwrite;
  assign PWDATA  = i_pwdata;

  assign uart0_overflow_int = uart0_txovrint|uart0_rxovrint;
  /*
  assign uart1_overflow_int = uart1_txovrint|uart1_rxovrint;
  assign uart2_overflow_int = uart2_txovrint|uart2_rxovrint;
  assign uart3_overflow_int = uart3_txovrint|uart3_rxovrint;
  assign uart4_overflow_int = uart4_txovrint|uart4_rxovrint;
*/
  generate if (INCLUDE_IRQ_SYNCHRONIZER == 0) begin : gen_irq_synchroniser
    // If PCLK is synchronous to HCLK, no need to have synchronizers
    assign i_uart0_txint = uart0_txint;
    assign i_uart0_rxint = uart0_rxint;
    /*
    assign i_uart1_txint = uart1_txint;
    assign i_uart1_rxint = uart1_rxint;
    assign i_uart2_txint = uart2_txint;
    assign i_uart2_rxint = uart2_rxint;
    assign i_uart3_txint = uart3_txint;
    assign i_uart3_rxint = uart3_rxint;
    assign i_uart4_txint = uart4_txint;
    assign i_uart4_rxint = uart4_rxint;
    */
    assign i_gpio0_intr[7:0] = gpio0_intr[7:0];
    assign i_timer1_int  = timer1_int;
    assign i_dualtimer2_int = dualtimer2_comb_int;
    assign i_uart0_overflow_int = uart0_overflow_int;
    /*
    assign i_uart1_overflow_int = uart1_overflow_int;
    assign i_uart2_overflow_int = uart2_overflow_int;
    assign i_uart3_overflow_int = uart3_overflow_int;
    assign i_uart4_overflow_int = uart4_overflow_int;
    */
    assign i_watchdog_int = watchdog_int;
    assign i_watchdog_rst = watchdog_rst;
  end else
  begin : gen_no_irq_synchroniser
    // If IRQ source are asynchronous to HCLK, then we
    // need to add synchronizers to prevent metastability
    // on interrupt signals.
    cmsdk_irq_sync u_irq_sync_0 (
      .RSTn  (HRESETn),
      .CLK   (HCLK),
      .IRQIN (uart0_txint),
      .IRQOUT(i_uart0_txint)
      );

    cmsdk_irq_sync u_irq_sync_1 (
      .RSTn  (HRESETn),
      .CLK   (HCLK),
      .IRQIN (uart0_rxint),
      .IRQOUT(i_uart0_rxint)
      );
/*
    cmsdk_irq_sync u_irq_sync_2 (
      .RSTn  (HRESETn),
      .CLK   (HCLK),
      .IRQIN (uart1_txint),
      .IRQOUT(i_uart1_txint)
      );

    cmsdk_irq_sync u_irq_sync_3 (
      .RSTn  (HRESETn),
      .CLK   (HCLK),
      .IRQIN (uart1_rxint),
      .IRQOUT(i_uart1_rxint)
      );

    cmsdk_irq_sync u_irq_sync_4 (
      .RSTn  (HRESETn),
      .CLK   (HCLK),
      .IRQIN (uart2_txint),
      .IRQOUT(i_uart2_txint)
      );

    cmsdk_irq_sync u_irq_sync_5 (
      .RSTn  (HRESETn),
      .CLK   (HCLK),
      .IRQIN (uart2_rxint),
      .IRQOUT(i_uart2_rxint)
      );
*/

    cmsdk_irq_sync u_irq_sync_7 (
      .RSTn  (HRESETn),
      .CLK   (HCLK),
      .IRQIN (timer1_int),
      .IRQOUT(i_timer1_int)
      );

    cmsdk_irq_sync u_irq_sync_8 (
      .RSTn  (HRESETn),
      .CLK   (HCLK),
      .IRQIN (dualtimer2_comb_int),
      .IRQOUT(i_dualtimer2_int)
      );

    cmsdk_irq_sync u_irq_sync_9 (
      .RSTn  (HRESETn),
      .CLK   (HCLK),
      .IRQIN (uart0_overflow_int),
      .IRQOUT(i_uart0_overflow_int)
      );
/*
    cmsdk_irq_sync u_irq_sync_10 (
      .RSTn  (HRESETn),
      .CLK   (HCLK),
      .IRQIN (uart1_overflow_int),
      .IRQOUT(i_uart1_overflow_int)
      );

    cmsdk_irq_sync u_irq_sync_11 (
      .RSTn  (HRESETn),
      .CLK   (HCLK),
      .IRQIN (uart2_overflow_int),
      .IRQOUT(i_uart2_overflow_int)
      );
*/
      cmsdk_irq_sync u_irq_sync_12 (
      .RSTn  (HRESETn),
      .CLK   (HCLK),
      .IRQIN (watchdog_int),
      .IRQOUT(i_watchdog_int)
      );

    cmsdk_irq_sync u_irq_sync_13 (
      .RSTn  (HRESETn),
      .CLK   (HCLK),
      .IRQIN (watchdog_rst),
      .IRQOUT(i_watchdog_rst)
      );
  end endgenerate


  assign apbsubsys_interrupt[31:0] = {
                   {8{1'b0}},                       // 19-31 (AHB GPIO #0 individual interrupt)
                   i_gpio0_intr[7:0],                // gpio
                   1'b0,
                   /*
                   i_uart4_txint,                    // 17           
                   i_uart4_rxint,                    // 16           
                   i_uart3_overflow_int,             // 15
                   i_uart2_overflow_int,             // 14
                   i_uart1_overflow_int,             // 13
                   */
                   i_uart0_overflow_int,             // 12
                   1'b0,                             // 11
                   i_dualtimer2_int,                 // 10
                   i_timer1_int,                     // 9
                   1'b0,                             // 8
                   1'b0,
                   1'b0,
                   /*
                   i_uart3_txint,                    // 7
                   i_uart3_rxint,                    // 6
                   i_uart2_txint,                    // 5
                   i_uart2_rxint,                    // 4
                   i_uart1_txint,                    // 3
                   i_uart1_rxint,                    // 2
                   */
                   i_uart0_txint,                    // 1
                   i_uart0_rxint};                   // 0

  assign watchdog_interrupt = i_watchdog_int;
  assign watchdog_reset     = i_watchdog_rst;


endmodule
