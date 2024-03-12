`timescale 1ns/1ps

module memc3_infrastructure #
  (
   parameter C_MEMCLK_PERIOD    = 2500,
   parameter C_RST_ACT_LOW      = 1,
   parameter C_INPUT_CLK_TYPE   = "DIFFERENTIAL"
   )
  (
   input  wire sys_clk,
   input  wire sys_rst_n,
   output wire clk0,
   output wire rst0,
   output wire async_rst,
   output wire sysclk_2x,
   output wire sysclk_2x_180,
   output wire mcb_drp_clk,
   output wire pll_ce_0,
   output wire pll_ce_90,
   output wire pll_lock
   );

  // # of clock cycles to delay deassertion of reset. Needs to be a fairly
  // high number not so much for metastability protection, but to give time
  // for reset (i.e. stable clock cycles) to propagate through all state
  // machines and to all control signals (i.e. not all control signals have
  // resets, instead they rely on base state logic being reset, and the effect
  // of that reset propagating through the logic). Need this because we may not
  // be getting stable clock cycles while reset asserted (i.e. since reset
  // depends on PLL/DCM lock status)

  localparam RST_SYNC_NUM = 25;
  localparam CLK_PERIOD_NS = 10;  //C_MEMCLK_PERIOD / 1000.0;
  localparam CLK_PERIOD_INT = 10;  //C_MEMCLK_PERIOD/1000;

  wire                       clk_2x_0;
  wire                       clk_2x_180;
  wire                       clk0_bufg;
  wire                       clk0_bufg_in;
  wire                       mcb_drp_clk_bufg_in;
  wire                       clkfbout_clkfbin;
  wire                       locked;
  reg [RST_SYNC_NUM-1:0]     rst0_sync_r    /* synthesis syn_maxfan = 10 */;
  wire                       rst_tmp;
  reg                        powerup_pll_locked;
  wire                       sys_rst;
  wire                       bufpll_mcb_locked;
  
  assign sys_rst = C_RST_ACT_LOW ? ~sys_rst_n: sys_rst_n;
  assign clk0        = clk0_bufg;
  assign pll_lock    = locked;

  //***************************************************************************
  // Global clock generation and distribution
  //***************************************************************************

    PLL_ADV #
        (
         .BANDWIDTH          ("OPTIMIZED"),
         .CLKIN1_PERIOD      (CLK_PERIOD_NS),
         .CLKIN2_PERIOD      (CLK_PERIOD_NS),
         .CLKOUT0_DIVIDE     (1),              // 625 MHz system clock
         .CLKOUT1_DIVIDE     (1),              // 625 MHz system clock (180 deg)
         .CLKOUT2_DIVIDE     (4),              // 156.256 MHz test bench clock
         .CLKOUT3_DIVIDE     (8),              // 78.125 MHz calibration clock
         .CLKOUT4_DIVIDE     (1),
         .CLKOUT5_DIVIDE     (1),
         .CLKOUT0_PHASE      (0.000),
         .CLKOUT1_PHASE      (180.000),
         .CLKOUT2_PHASE      (0.000),
         .CLKOUT3_PHASE      (0.000),
         .CLKOUT4_PHASE      (0.000),
         .CLKOUT5_PHASE      (0.000),
         .CLKOUT0_DUTY_CYCLE (0.500),
         .CLKOUT1_DUTY_CYCLE (0.500),
         .CLKOUT2_DUTY_CYCLE (0.500),
         .CLKOUT3_DUTY_CYCLE (0.500),
         .CLKOUT4_DUTY_CYCLE (0.500),
         .CLKOUT5_DUTY_CYCLE (0.500),
         .COMPENSATION       ("INTERNAL"),
         .DIVCLK_DIVIDE      (4),
         .CLKFBOUT_MULT      (25),             // 25MHz x 25 = 625 MHz system clock
         .CLKFBOUT_PHASE     (0.0),
         .REF_JITTER         (0.005000)
         )
        u_pll_adv
          (
           .CLKFBIN     (clkfbout_clkfbin),
           .CLKINSEL    (1'b1),
           .CLKIN1      (sys_clk),
           .CLKIN2      (1'b0),
           .DADDR       (5'b0),
           .DCLK        (1'b0),
           .DEN         (1'b0),
           .DI          (16'b0),
           .DWE         (1'b0),
           .REL         (1'b0),
           .RST         (sys_rst),
           .CLKFBDCM    (),
           .CLKFBOUT    (clkfbout_clkfbin),
           .CLKOUTDCM0  (),
           .CLKOUTDCM1  (),
           .CLKOUTDCM2  (),
           .CLKOUTDCM3  (),
           .CLKOUTDCM4  (),
           .CLKOUTDCM5  (),
           .CLKOUT0     (clk_2x_0),
           .CLKOUT1     (clk_2x_180),
           .CLKOUT2     (clk0_bufg_in),
           .CLKOUT3     (mcb_drp_clk_bufg_in),
           .CLKOUT4     (),
           .CLKOUT5     (),
           .DO          (),
           .DRDY        (),
           .LOCKED      (locked)
           );

 

   BUFG U_BUFG_CLK0
    (
     .O (clk0_bufg),
     .I (clk0_bufg_in)
     );

   BUFG U_BUFG_CLK1
    (
     .O (mcb_drp_clk),
     .I (mcb_drp_clk_bufg_in)
     );


  always @(posedge clk0_bufg , posedge sys_rst)
      if(sys_rst)
         powerup_pll_locked <= 1'b0;
       
      else if (bufpll_mcb_locked)
         powerup_pll_locked <= 1'b1;

  //***************************************************************************
  // Reset synchronization
  // NOTES:
  //   1. shut down the whole operation if the PLL hasn't yet locked (and
  //      by inference, this means that external SYS_RST_IN has been asserted -
  //      PLL deasserts LOCKED as soon as SYS_RST_IN asserted)
  //   2. asynchronously assert reset. This was we can assert reset even if
  //      there is no clock (needed for things like 3-stating output buffers).
  //      reset deassertion is synchronous.
  //   3. asynchronous reset only look at pll_lock from PLL during power up. After
  //      power up and pll_lock is asserted, the powerup_pll_locked will be asserted
  //      forever until sys_rst is asserted again. PLL will lose lock when FPGA 
  //      enters suspend mode. We don't want reset to MCB get
  //      asserted in the application that needs suspend feature.
  //***************************************************************************

  assign rst_tmp = sys_rst | ~powerup_pll_locked;

  assign async_rst = rst_tmp;
  // synthesis attribute max_fanout of rst0_sync_r is 10
  always @(posedge clk0_bufg or posedge rst_tmp)
    if (rst_tmp)
      rst0_sync_r <= {RST_SYNC_NUM{1'b1}};
    else
      // logical left shift by one (pads with 0)
      rst0_sync_r <= rst0_sync_r << 1;


  assign rst0    = rst0_sync_r[RST_SYNC_NUM-1];


BUFPLL_MCB BUFPLL_MCB1 
( .IOCLK0         (sysclk_2x),	
  .IOCLK1         (sysclk_2x_180), 
  .LOCKED         (locked),
  .GCLK           (mcb_drp_clk),
  .SERDESSTROBE0  (pll_ce_0), 
  .SERDESSTROBE1  (pll_ce_90), 
  .PLLIN0         (clk_2x_0),  
  .PLLIN1         (clk_2x_180),
  .LOCK           (bufpll_mcb_locked) 
  );


endmodule
