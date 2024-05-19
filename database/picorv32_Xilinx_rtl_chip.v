// This program was cloned from: https://github.com/cjhonlyone/picorv32_Xilinx
// License: MIT License

module chip #
(
  parameter DMA_RX_INTERVAL = 32'd1999999,
  parameter UART_BAUD       = 32'd434
)(
  // input [31:0] test,
  input        FCLKIN_P,
  input        FCLKIN_N,
  input        FPGA_RESET,
  output [3:0] F_LED,

  output       PHY_RESET,
  // output       PHY_INT,

  output       PHY_TXC_GTXCLK,
  output       PHY_TXCLK,
  output [7:0] PHY_TXD,
  output       PHY_TXCTL_TXEN,
  output       PHY_TXER,

  input  [7:0] PHY_RXD,
  input        PHY_RXCTL_RXDV,
  input        PHY_RXER,
  input        PHY_RXCLK
);
	wire LOCKED;

  wire clk_125mhz;
  wire clk_200mhz;
  wire resetn_125mhz;
  wire resetn_200mhz;
	dcm _pll(.CLK_IN1_P(FCLKIN_P),.CLK_IN1_N(FCLKIN_N),
    .CLK_OUT1(clk_125mhz), .CLK_OUT2(clk_200mhz),.RESET(1'b0), .LOCKED(LOCKED)); 
	 
  reset_gen _reset_gen_125mhz
    (
    .clk(clk_125mhz), 
    .reset_async(FPGA_RESET & LOCKED), 
    .resetn(resetn_125mhz)
    );

  reset_gen _reset_gen_200mhz
    (
    .clk(clk_200mhz), 
    .reset_async(FPGA_RESET & LOCKED), 
    .resetn(resetn_200mhz)
    );

  wire [1:0] led;
  wire _tx;
  top #
    (
      .DMA_RX_INTERVAL (DMA_RX_INTERVAL),
      .UART_BAUD       (UART_BAUD)
    )
  _top
    (
      // .test        (test),
      .clk_125mhz         (clk_125mhz),
      .resetn_125mhz      (resetn_125mhz),

      .clk_200mhz         (clk_200mhz),
      .resetn_200mhz      (resetn_200mhz),

      .led         ({led, F_LED[1:0]}),
      .rxd         (1'b1),
      .txd         (_tx),

      .phy_rx_clk  (PHY_RXCLK),
      .phy_rxd     (PHY_RXD),
      .phy_rx_dv   (PHY_RXCTL_RXDV),
      .phy_rx_er   (PHY_RXER),

      .phy_gtx_clk (PHY_TXC_GTXCLK),
      .phy_tx_clk  (PHY_TXCLK),
      .phy_txd     (PHY_TXD),
      .phy_tx_en   (PHY_TXCTL_TXEN),
      .phy_tx_er   (PHY_TXER),

      .phy_reset_n (PHY_RESET)
    );

  assign F_LED[3] = _tx;
  assign F_LED[2] = 0;
endmodule

module reset_gen(
  input clk,
  input reset_async,
  output resetn
);

  reg [7:0] x = 8'hff;

  always @(posedge clk) begin
    if (!reset_async)
		x <= 8'hff;
	 else
      x <= {x[6:0], 1'b0};
  end
    
  assign resetn = !x[7];

endmodule

//(* CORE_GENERATION_INFO = "dcm,clk_wiz_v3_6,{component_name=dcm,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,feedback_source=FDBK_AUTO,primtype_sel=MMCM_ADV,num_out_clk=1,clkin1_period=8.000,clkin2_period=10.000,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,use_status=false,use_freeze=false,use_clk_valid=false,feedback_type=SINGLE,clock_mgr_type=MANUAL,manual_override=false}" *)
module dcm
 (// Clock in ports
  input         CLK_IN1_P,
  input         CLK_IN1_N,
  // Clock out ports
  output        CLK_OUT1,
  output        CLK_OUT2,
  // Status and control signals
  input         RESET,
  output        LOCKED
 );

  // Input buffering
  //------------------------------------
  IBUFGDS clkin1_buf
   (.O  (clkin1),
    .I  (CLK_IN1_P),
    .IB (CLK_IN1_N));


  // Clocking primitive
  //------------------------------------
  // Instantiation of the MMCM primitive
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused
  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        psdone_unused;
  wire        clkfbout;
  wire        clkfbout_buf;
  wire        clkfboutb_unused;
  wire        clkout0b_unused;
  wire        clkout1b_unused;
  wire        clkout2_unused;
  wire        clkout2b_unused;
  wire        clkout3_unused;
  wire        clkout3b_unused;
  wire        clkout4_unused;
  wire        clkout5_unused;
  wire        clkout6_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;

  MMCM_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .CLKOUT4_CASCADE      ("FALSE"),
    .CLOCK_HOLD           ("FALSE"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT_F      (8.000),
    .CLKFBOUT_PHASE       (0.000),
    .CLKFBOUT_USE_FINE_PS ("FALSE"),
    .CLKOUT0_DIVIDE_F     (8.000),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT0_USE_FINE_PS  ("FALSE"),
    .CLKOUT1_DIVIDE       (5),
    .CLKOUT1_PHASE        (0.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT1_USE_FINE_PS  ("FALSE"),
    .CLKIN1_PERIOD        (8.000),
    .REF_JITTER1          (0.010))
  mmcm_adv_inst
    // Output clocks
   (.CLKFBOUT            (clkfbout),
    .CLKFBOUTB           (clkfboutb_unused),
    .CLKOUT0             (clkout0),
    .CLKOUT0B            (clkout0b_unused),
    .CLKOUT1             (clkout1),
    .CLKOUT1B            (clkout1b_unused),
    .CLKOUT2             (clkout2_unused),
    .CLKOUT2B            (clkout2b_unused),
    .CLKOUT3             (clkout3_unused),
    .CLKOUT3B            (clkout3b_unused),
    .CLKOUT4             (clkout4_unused),
    .CLKOUT5             (clkout5_unused),
    .CLKOUT6             (clkout6_unused),
     // Input clock control
    .CLKFBIN             (clkfbout_buf),
    .CLKIN1              (clkin1),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    // Ports for dynamic phase shift
    .PSCLK               (1'b0),
    .PSEN                (1'b0),
    .PSINCDEC            (1'b0),
    .PSDONE              (psdone_unused),
    // Other control and status signals
    .LOCKED              (LOCKED),
    .CLKINSTOPPED        (clkinstopped_unused),
    .CLKFBSTOPPED        (clkfbstopped_unused),
    .PWRDWN              (1'b0),
    .RST                 (RESET));

  // Output buffering
  //-----------------------------------
  BUFG clkf_buf
   (.O (clkfbout_buf),
    .I (clkfbout));

  BUFG clkout1_buf
   (.O   (CLK_OUT1),
    .I   (clkout0));


  BUFG clkout2_buf
   (.O   (CLK_OUT2),
    .I   (clkout1));




endmodule

`include "top.v"
`include "picorv32.v"
// `include "simpleuart.v"
`include "DMAC.v"

`include "./eth/axis_adapter.v"
`include "./eth/axis_async_fifo.v"
`include "./eth/axis_async_fifo_adapter.v"
`include "./eth/axis_gmii_rx.v"
`include "./eth/axis_gmii_tx.v"
`include "./eth/eth_mac_1g.v"
`include "./eth/eth_mac_1g_gmii.v"
`include "./eth/eth_mac_1g_gmii_fifo.v"
`include "./eth/gmii_phy_if.v"
`include "./eth/lfsr.v"
`include "./eth/oddr.v"
`include "./eth/ssio_sdr_in.v"
`include "./eth/ssio_sdr_out.v"

`include "./uart/uart.v"
`include "./uart/uart_fifo.v"
`include "./uart/uart_top.v"
`include "./uart/fifo.v"