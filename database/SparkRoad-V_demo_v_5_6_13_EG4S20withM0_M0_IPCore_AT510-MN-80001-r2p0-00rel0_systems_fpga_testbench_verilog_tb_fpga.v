//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2015-2017 ARM Limited or its affiliates.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
//  Version and Release Control Information:
//
//  File Revision       : $Revision: 368471 $
//  File Date           : $Date: 2017-07-26 11:38:31 +0100 (Wed, 26 Jul 2017) $
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
// Purpose :
//     Top level testbench of the FPGA on the MPS2 board
//     This includes models of the PSRAM and SSRAM fitted to the board
//     and a UART receiver such that printf() can be shown in the simulator console
//
//     This testbench instantiates 3rd party models from GSI and ISSI
//-----------------------------------------------------------------------------


`timescale 1ns/1ps
`define sg701               // PSRAM part
`define x16                 // PSRAM width
`define ZBT_ADDR_WIDTH 19   // Address width of devices fitted to MPS2 board
`define ZBT_MEM_SPEED  150  // Speed of devices fitted to MPS2 board

// Includes the Rev define for the particular board
`include "fpga_options_defs.v"

module tb_fpga;

    reg           clk25MHz;
    reg           clk12MHz;
    wire  [2:0]   osc;
    reg           n_rst;
    reg           n_por;
    wire  [1:0]   clk_loop;
    
    wire  [1:0]   leds;
    wire  [1:0]   buttons;
    
    wire [51:0]   exp;            // I/O ports

    // --------------------------------------------------------------------
    // Debug and Trace
    // --------------------------------------------------------------------
    wire          CS_GNDDETECT;   // Ground detect
    wire          CS_nTRST;       // JTAG nTRST
    wire          CS_TDI;         // JTAG TDI
    wire          CS_TCK;         // SWD Clk / JTAG TCK
    wire          CS_TMS;         // SWD I/O / JTAG TMS
    wire          CS_TDO;         // SWV     / JTAG TDO
    wire          CS_nSRST;       // nSRST
    wire          CS_TRACECLK;    // Trace clock
    wire          CS_TRACECTL;    // Trace control
    wire [15:0]   CS_TRACEDATA;   // Trace data

    // --------------------------------------------------------------------
    // ZBT Synchronous SRAM
    // --------------------------------------------------------------------
    wire  [1:0]  #1  SSRAM1_CLK;     // Clocks
    wire  [20:0] #2  SSRAM1_A;       // Address
    wire  [63:0] #2  SSRAM1_DQ;      // Data
    wire  [7:0]  #2  SSRAM1_nBW;     // Byte lane writes (active low)
    wire  [7:0]  #2  SSRAM1_DQP;     // Parity - not used
    wire         #2  SSRAM1_nCE1;    // Chip Select (active low)
    wire         #2  SSRAM1_nWE;     // Write enable (lower 32-bit)
    wire         #2  SSRAM1_nOE;     // Output enable (active low)
    wire         #2  SSRAM1_MODE;    // Not used (tied to 0)
    wire         #2  SSRAM1_ADVnLD;  // Not used (tied to 0)
    wire         #2  SSRAM1_ZZ;      // Not used (tied to 0)
    wire         #2  SSRAM1_nCEN;    // Write clock enable (active low, tied to 0)

    // 32-bit ZBT Synchronous SRAM0 connections
    wire         #1  SSRAM2_CLK;     // Clock
    wire [20:0]  #2  SSRAM2_A;       // Address
    wire [31:0]  #2  SSRAM2_DQ;      // Data (byte lane #A)
    wire [3:0]   #2  SSRAM2_nBW;     // Byte lane writes (active low)
    wire [3:0]   #2  SSRAM2_DQP;     // not used
    wire         #2  SSRAM2_nCE1;    // Chip Select (active low)
    wire         #2  SSRAM2_nWE;     // Write enable
    wire         #2  SSRAM2_nOE;     // Output enable (active low)
    wire         #2  SSRAM2_MODE;    // Not used (tied to 0)
    wire         #2  SSRAM2_ADVnLD;  // Not used (tied to 0)
    wire         #2  SSRAM2_ZZ;      // Not used (tied to 0)
    wire         #2  SSRAM2_nCEN;    // Write clock enable (active low, tied to 0)

    // 32-bit ZBT Synchronous SRAM3 connections
    wire         #1  SSRAM3_CLK;     // Clock
    wire  [20:0] #2  SSRAM3_A;       // Address
    wire  [31:0] #2  SSRAM3_DQ;      // Data (byte lane #A)
    wire  [3:0]  #2  SSRAM3_nBW;     // Byte lane writes (active low)
    wire  [3:0]  #2  SSRAM3_DQP;     // not used
    wire         #2  SSRAM3_nCE1;    // Chip Select (active low)
    wire         #2  SSRAM3_nWE;     // Write enable
    wire         #2  SSRAM3_nOE;     // Output enable (active low)
    wire         #2  SSRAM3_MODE;    // Not used (tied to 0)
    wire         #2  SSRAM3_ADVnLD;  // Not used (tied to 0)
    wire         #2  SSRAM3_ZZ;      // Not used (tied to 0)
    wire         #2  SSRAM3_nCEN;    // Write clock enable (active low, tied to 0)

    // --------------------------------------------------------------------
    // SMB
    // --------------------------------------------------------------------
    wire  [22:0]    SMB_A;
    wire  [15:0]    SMB_DQ;
    wire            SMB_ETH_IRQ; 
    wire            SMB_ETH_nCS;
    wire            SMB_nLB;         // Need to be asserted before other control signals
    wire            SMB_nOE;
    wire         #2 SMB_nRD;
    wire            SMB_nRESET;
    wire            SMB_nUB;         // Need to be asserted before other control signals
    wire         #2 SMB_nWE;
    wire [1:0]   #2 SMB_PSRAM_nCE;  // PSRAM chip select (active low)
    wire         #2 SMB_nZZ;        // Sleep (active low)

    // --------------------------------------------------------------------
    // UART
    // --------------------------------------------------------------------
    wire          UART_RXD;       // UART receive data
    wire          UART_TXD;       // UART transmit data

    wire          uart_rxd_mcu;   // Microcontroller UART receive data
    wire          uart_txd_mcu;   // Microcontroller UART transmit data

    // --------------------------------------------------------------------
    // SPI
    // --------------------------------------------------------------------
    wire          SPI_SCK;        // SPI clock
    wire          SPI_MOSI;       // SPI data out
    wire          SPI_MISO;       // SPI data in
    wire          SPI_nSS;        // SPI device select

    // --------------------------------------------------------------------
    // VGA
    // --------------------------------------------------------------------
    wire          VGA_HSYNC;      // VGA H-Sync
    wire          VGA_VSYNC;      // VGA V-Sync
    wire [3:0]    VGA_R;          // VGA red data
    wire [3:0]    VGA_G;          // VGA green data
    wire [3:0]    VGA_B;          // VGA blue data

    // --------------------------------------------------------------------
    // Audio
    // --------------------------------------------------------------------
    wire          AUD_MCLK;       // Audio codec master clock (12MHz)
    wire          AUD_SCLK;       // Audio interface bit clock
    wire          AUD_LRCK;       // Audio Left/Right clock
    wire          AUD_SDOUT;      // Audio DAC data
    wire          AUD_SDIN;       // Audio ADC data
    wire          AUD_nRESET;     // Reset

    wire          AUD_SCL;        // Configuration clock
    wire          AUD_SDA;        // Bi directional cfg data

    // --------------------------
    // Colour LCD
    // --------------------------
    wire          CLCD_T_SCL;
    wire          CLCD_T_SDA;
    wire          CLCD_CS;
    wire          CLCD_RS;
    wire          CLCD_WR_SCL;
    wire          CLCD_RD;
    wire          CLCD_RESET;
    wire [17:10]  CLCD_PDH;
    wire [8:1]    CLCD_PDL;
    wire          CLCD_BL_CTRL;
    wire          CLCD_SDO;       // Direction needs checking.
    wire          CLCD_SDI;       // Could be an IO replacing SDI and SDO.
    wire          CLCD_T_CS;
    wire          CLCD_T_SCK;
    
    // --------------------------------------------------------------------
    // FPGA config
    // --------------------------------------------------------------------

    // Dual Purpose Config Pins
    // ------------------------

    wire          FPGA_CONFIG_CRCERROR; // Config CRC_ERROR output
    wire [15:0]   FPGA_CONFIG_DATA;     // Although only [5:15] are dual IO pins
                                        // the chip top level instanciates the whole bus
    wire          FPGA_CONFIG_INITDONE; // INIT_DONE
    wire          FPGA_CONFIG_PRREQ;    // PR_REQUEST
    wire          FPGA_CONFIG_PRREADY;  // PR_READY
    wire          FPGA_CONFIG_PRERROR;  // PR_ERROR
    wire          FPGA_CONFIG_PRDONE;   // PR_DONE
    wire          DCLK;                 // PR configuration clock
    
    reg           spi_nreset;           //SPI Reset  
    reg           nCFGRST;              //SCC Reset

    // --------------------------------------------------------------------
    // Shield Function enables
    // --------------------------------------------------------------------
    wire          SPI0;
    wire          SPI1;
    wire          I2C0;
    wire          I2C1;
    wire          UART0;
    wire          UART1;

  //-----------------------------------------
  // Clocks and reset
  //-----------------------------------------
  localparam PERIOD_25MHz  = 40;
  localparam PERIOD_12MHz  = 84;
  
  initial
  begin
    clk25MHz  = 1'b1;
    clk12MHz  = 1'b1;
  end
  
  always #(PERIOD_25MHz/2)  clk25MHz  = ~clk25MHz;
  always #(PERIOD_12MHz/2)  clk12MHz  = ~clk12MHz;

  assign osc = {clk25MHz, clk12MHz, clk25MHz};
  
  // Need a config clock in order to let the chip know it is not in PR loading
  assign DCLK = clk12MHz;
  assign FPGA_CONFIG_DATA[5:0] = 6'b0;
  assign FPGA_CONFIG_DATA[8:7] = 2'b0;
  assign FPGA_CONFIG_DATA[10]  = 1'b0;

  initial
    begin
    n_rst = 1'b1;
    n_por = 1'b1;
    spi_nreset = 1'b1;
    nCFGRST = 1'b1;
    #100
    n_rst = 1'b0;
    n_por = 1'b0;
    spi_nreset = 1'b0;
    nCFGRST = 1'b0;
    #100
    n_por = 1'b1;
    #2000
    spi_nreset = 1'b1;
    #15000
    n_rst = 1'b1;
    #15000
    nCFGRST = 1'b1;
    end

  assign CS_nTRST = n_rst;
  
  assign FPGA_CONFIG_DATA[12] = nCFGRST; // Alternative config options
  assign CLCD_PDH[14]         = nCFGRST; // Alternative config options
   
  // Hold the PR loading inactive
  assign FPGA_CONFIG_PRREQ = 1'b0;
  
  // Assign the usused debug inputs
  assign CS_GNDDETECT = 1'b1;
  assign CS_nSRST     = 1'b1;

  // Assign untested inputs
  assign SPI_MISO     = 1'b0;
  assign AUD_SDOUT    = 1'b0;
  assign CLCD_SDO     = 1'b0;
  
  //-----------------------------------------
  // FPGA
  //-----------------------------------------
 
  fpga_top u_fpga_top (
      .OSCCLK            (osc),
      .CB_nRST           (n_rst),
      .CB_nPOR           (n_por),
      .CLKOUT            (clk_loop),
      .CLKIN             (clk_loop),
    
      .USER_LED          (leds),
      .USER_PB           (buttons),
      .EXP               (exp),
      .TP                (),


      .CS_GNDDETECT      (CS_GNDDETECT),
      .CS_nTRST          (CS_nTRST),
      .CS_TDI            (CS_TDI),
      .CS_TCK            (CS_TCK),
      .CS_TMS            (CS_TMS),
      .CS_TDO            (CS_TDO),
      .CS_nSRST          (CS_nSRST),
      .CS_TRACECLK       (CS_TRACECLK),
      .CS_TRACECTL       (CS_TRACECTL),
      .CS_TRACEDATA      (CS_TRACEDATA),

    // 64-bit ZBT Synchronous SRAM1 connections
      .SSRAM1_CLK        (SSRAM1_CLK),     // Clocks
      .SSRAM1_A          (SSRAM1_A[20:0]),       // Address
      .SSRAM1_DQ         (SSRAM1_DQ),      // Data (byte lane #A)
      .SSRAM1_nBW        (SSRAM1_nBW),     // Byte lane writes (active low)
      .SSRAM1_DQP        (SSRAM1_DQP),
      .SSRAM1_nCE1       (SSRAM1_nCE1),    // Chip Select (active low)
      .SSRAM1_nWE        (SSRAM1_nWE),     // Write enable
      .SSRAM1_nOE        (SSRAM1_nOE),     // Output enable (active low)
      .SSRAM1_MODE       (SSRAM1_MODE),    // Not used (tied to 0)
      .SSRAM1_ADVnLD     (SSRAM1_ADVnLD),  // Not used (tied to 0)
      .SSRAM1_ZZ         (SSRAM1_ZZ),      // Not used (tied to 0)
      .SSRAM1_nCEN       (SSRAM1_nCEN),

    // 32-bit ZBT Synchronous SRAM2 connections
      .SSRAM2_CLK        (SSRAM2_CLK),     // Clocks
      .SSRAM2_A          (SSRAM2_A[20:0]),       // Address
      .SSRAM2_DQ         (SSRAM2_DQ),      // Data (byte lane #A)
      .SSRAM2_DQP        (SSRAM2_DQP),
      .SSRAM2_nBW        (SSRAM2_nBW),     // Byte lane writes (active low)
      .SSRAM2_nCE1       (SSRAM2_nCE1),    // Chip Select (active low)
      .SSRAM2_nWE        (SSRAM2_nWE),     // Write enable
      .SSRAM2_nOE        (SSRAM2_nOE),     // Output enable (active low)
      .SSRAM2_MODE       (SSRAM2_MODE),    // Not used (tied to 0)
      .SSRAM2_ADVnLD     (SSRAM2_ADVnLD),  // Not used (tied to 0)
      .SSRAM2_ZZ         (SSRAM2_ZZ),      // Not used (tied to 0)
      .SSRAM2_nCEN       (SSRAM2_nCEN),

    // 32-bit ZBT Synchronous SRAM3 connections
      .SSRAM3_CLK        (SSRAM3_CLK),     // Clocks
      .SSRAM3_A          (SSRAM3_A[20:0]),       // Address
      .SSRAM3_DQ         (SSRAM3_DQ),      // Data (byte lane #A)
      .SSRAM3_DQP        (SSRAM3_DQP),
      .SSRAM3_nBW        (SSRAM3_nBW),     // Byte lane writes (active low)
      .SSRAM3_nCE1       (SSRAM3_nCE1),    // Chip Select (active low)
      .SSRAM3_nWE        (SSRAM3_nWE),     // Write enable
      .SSRAM3_nOE        (SSRAM3_nOE),     // Output enable (active low)
      .SSRAM3_MODE       (SSRAM3_MODE),    // Not used (tied to 0)
      .SSRAM3_ADVnLD     (SSRAM3_ADVnLD),  // Not used (tied to 0)
      .SSRAM3_ZZ         (SSRAM3_ZZ),      // Not used (tied to 0)
      .SSRAM3_nCEN       (SSRAM3_nCEN),
     
    //SMB
      .SMB_A             (SMB_A),           // Address
      .SMB_DQ            (SMB_DQ),          // Data read
      .SMB_ETH_IRQ       (SMB_ETH_IRQ),
      .SMB_ETH_nCS       (SMB_ETH_nCS),
      .SMB_nLB           (SMB_nLB),         // Active low lower byte enable
      .SMB_nOE           (SMB_nOE),         // Active low output enable (read)
      .SMB_nRD           (SMB_nRD),         // Active low read enable
      .SMB_nRESET        (SMB_nRESET),      // Not currently used
      .SMB_nUB           (SMB_nUB),         // Active low upper byte enable
      .SMB_nWE           (SMB_nWE),         // Active low write enable
      .SMB_PSRAM_nCE     (SMB_PSRAM_nCE),   // [1:0] chip enable for rev B/C
      .SMB_nZZ           (SMB_nZZ),         // Sleep (active low)

    // UART
      .UART_RXD          (UART_RXD),
      .UART_TXD          (UART_TXD),

    // SPI
      .SPI_SCK           (SPI_SCK),
      .SPI_MOSI          (SPI_MOSI),
      .SPI_MISO          (SPI_MISO),
      .SPI_nSS           (SPI_nSS),
    
    // VGA
      .VGA_HSYNC         (VGA_HSYNC),
      .VGA_VSYNC         (VGA_VSYNC),
      .VGA_R             (VGA_R),
      .VGA_G             (VGA_G),
      .VGA_B             (VGA_B),

    // Audio
      .AUD_MCLK          (AUD_MCLK),
      .AUD_SCLK          (AUD_SCLK),
      .AUD_LRCK          (AUD_LRCK),
      .AUD_SDOUT         (AUD_SDOUT),
      .AUD_SDIN          (AUD_SDIN),
      .AUD_nRESET        (AUD_nRESET),
      .AUD_SCL           (AUD_SCL),
      .AUD_SDA           (AUD_SDA),

    // CLCD
      .CLCD_T_SCL        (CLCD_T_SCL),
      .CLCD_T_SDA        (CLCD_T_SDA),
      .CLCD_CS           (CLCD_CS),
      .CLCD_RS           (CLCD_RS),
      .CLCD_WR_SCL       (CLCD_WR_SCL),
      .CLCD_RD           (CLCD_RD),
      .CLCD_RESET        (CLCD_RESET),
      .CLCD_PDH          (CLCD_PDH),
      .CLCD_PDL          (CLCD_PDL),
      .CLCD_BL_CTRL      (CLCD_BL_CTRL),
      .CLCD_SDO          (CLCD_SDO),
      .CLCD_SDI          (CLCD_SDI),
      .CLCD_T_CS         (CLCD_T_CS),
      .CLCD_T_SCK        (CLCD_T_SCK),

      .FPGA_CONFIG_nLRST (),
      .CRC_ERROR         (),                        // Config CRC_ERROR output
      .PR_DATA           (FPGA_CONFIG_DATA[15:5]),  // Only [5:15] are dual IO pins too
      .PR_REQUEST        (FPGA_CONFIG_PRREQ),       // PR_REQUEST
      .PR_READY          (FPGA_CONFIG_PRREADY),     // PR_READY
      .PR_ERROR          (FPGA_CONFIG_PRERROR),     // PR_ERROR
      .PR_DONE           (FPGA_CONFIG_PRDONE)       // PR_DONE
    
    );
    
  //-----------------------------------------
  // Pullup and pulldown
  //-----------------------------------------
  pullup(CS_TDI);
  pullup(CS_TMS);
  //pullup(dbg_swclk_tck);
  assign CS_TCK = 1'b0;
  
  pullup(buttons[0]);
  pullup(buttons[1]);
  pullup(UART_RXD);
  pullup(uart_rxd_mcu);
  pullup(FPGA_CONFIG_DATA[6]);
  pullup(CLCD_PDL[7]);
  pullup(AUD_SCL);
  pullup(AUD_SDA);
  pullup(CLCD_T_SCL);
  pullup(CLCD_T_SDA);
  pullup(CLCD_T_CS);
  
  pullup  (FPGA_CONFIG_DATA[11]);   
  pulldown(FPGA_CONFIG_DATA[12]);   
  pullup  (FPGA_CONFIG_DATA[13]);   
  pullup  (FPGA_CONFIG_DATA[14]);   
  pullup  (FPGA_CONFIG_DATA[15]);   

  pullup  (CLCD_PDH[13]);   
  pulldown(CLCD_PDH[14]);   
  pullup  (CLCD_PDH[15]);   
  pullup  (CLCD_PDH[16]);   
  pullup  (CLCD_PDH[17]); 
  
  pullup(SMB_ETH_IRQ); // Configured is active low
  
  genvar i1;
  generate
    for (i1=0;i1<52;i1=i1+1)
      begin: gen_exp_pullup
        pullup(exp[i1]);
      end
  endgenerate

  //-----------------------------------------
  // Loop back
  //-----------------------------------------    

  assign buttons = leds;

  // uart_mcu = uart2 internally.
  // tx pin connects to CLCD_PDH[10]
  // rx pin connects to CLCD_PDH[11]
  assign uart_txd_mcu        = CLCD_PDH[10];
  assign CLCD_PDH[11]        = uart_rxd_mcu;
  assign uart_rxd_mcu        = uart_txd_mcu;
  
  //-----------------------------------------
  // Retarget (printf) on uart0
  //-----------------------------------------
  cmsdk_uart_capture_ard u_cmsdk_uart_capture_ard (
  .RESETn              (n_rst),       // Power on reset
  .CLK                 (clk25MHz),    // Clock (baud rate)
  .RXD                 (UART_TXD),    // Received data
  .SIMULATIONEND       (),            // Simulation end indicator
  .DEBUG_TESTER_ENABLE (),            // Enable debug tester
  .AUXCTRL             (),            // Auxiliary control
  .SPI0                (SPI0),        // Shield0 SPI enable
  .SPI1                (SPI1),        // Shield1 SPI enable
  .I2C0                (I2C0),        // Shield0 I2C enable
  .I2C1                (I2C1),        // Shield1 I2C enable
  .UART0               (UART0),       // Shield0 UART enable
  .UART1               (UART1)        // Shield1 UART enable
  );


  //-----------------------------------------
  // Ethernet
  //-----------------------------------------
  cmsdk_sram256x16 #(
    .AW (9),                          // Note: Keep memory small for faster simulation
    .filename (""))
  u_ethernet (
    .Address       ({SMB_A[7:0],1'b0}), // Note: Not all address pins are used
    .DataIO        (SMB_DQ),
    .WEn           (SMB_nWE),
    .OEn           (SMB_nOE),
    .CEn           (SMB_ETH_nCS),
    .LBn           (SMB_nLB | SMB_ETH_nCS),
    .UBn           (SMB_nUB | SMB_ETH_nCS)
    );

  //-----------------------------------------
  // PSRAM
  //-----------------------------------------
  IS66WVE409616BLL uPSRAM0(
    .ceb           (SMB_PSRAM_nCE[0]),
    .oeb           (SMB_nOE),
    .web           (SMB_nWE),
    .lbb           (SMB_nLB),
    .ubb           (SMB_nUB),
    .zzb           (SMB_nZZ),
    .addr          (SMB_A[21:0]),
    .dq            (SMB_DQ)
  );
  IS66WVE409616BLL uPSRAM1(
    .ceb           (SMB_PSRAM_nCE[1]),
    .oeb           (SMB_nOE),
    .web           (SMB_nWE),
    .lbb           (SMB_nLB),
    .ubb           (SMB_nUB),
    .zzb           (SMB_nZZ),
    .addr          (SMB_A[21:0]),
    .dq            (SMB_DQ)
  );
   
  //-----------------------------------------
  // ZBT SRAM 64 Bit - 1
  //-----------------------------------------
  
  GS8160Z36DT  #( 
    .A_bits (`ZBT_ADDR_WIDTH ),
    .SPEED  (`ZBT_MEM_SPEED )
  )
  uSSRAM1A (
    .DQa   ({SSRAM1_DQP[0],SSRAM1_DQ[7:0]}),
    .DQb   ({SSRAM1_DQP[1],SSRAM1_DQ[15:8]}),
    .DQc   ({SSRAM1_DQP[2],SSRAM1_DQ[23:16]}),
    .DQd   ({SSRAM1_DQP[3],SSRAM1_DQ[31:24]}),
    .A     (SSRAM1_A[`ZBT_ADDR_WIDTH-1:0]),
    .nLBO  (SSRAM1_MODE),
    .CK    (SSRAM1_CLK[0]),
    .nCKE  (SSRAM1_nCEN),
    .pADV  (SSRAM1_ADVnLD),
    .nBa   (SSRAM1_nBW[0]),
    .nBb   (SSRAM1_nBW[1]),
    .nBc   (SSRAM1_nBW[2]),
    .nBd   (SSRAM1_nBW[3]),
    .nW    (SSRAM1_nWE),
    .nG    (SSRAM1_nOE),
    .nE1   (SSRAM1_nCE1),
    .E2    (1'b1),
    .nE3   (1'b0),
    .ZZ    (SSRAM1_ZZ),
    .nFT   (1'b0)
  );

  GS8160Z36DT  #( 
    .A_bits (`ZBT_ADDR_WIDTH ),
    .SPEED  (`ZBT_MEM_SPEED )
  )
  uSSRAM1B (
    .DQa   ({SSRAM1_DQP[4],SSRAM1_DQ[39:32]}),
    .DQb   ({SSRAM1_DQP[5],SSRAM1_DQ[47:40]}),
    .DQc   ({SSRAM1_DQP[6],SSRAM1_DQ[55:48]}),
    .DQd   ({SSRAM1_DQP[7],SSRAM1_DQ[63:56]}),
    .A     (SSRAM1_A[`ZBT_ADDR_WIDTH-1:0]),
    .nLBO  (SSRAM1_MODE),
    .CK    (SSRAM1_CLK[1]),
    .nCKE  (SSRAM1_nCEN),
    .pADV  (SSRAM1_ADVnLD),
    .nBa   (SSRAM1_nBW[4]),
    .nBb   (SSRAM1_nBW[5]),
    .nBc   (SSRAM1_nBW[6]),
    .nBd   (SSRAM1_nBW[7]),
    .nW    (SSRAM1_nWE),
    .nG    (SSRAM1_nOE),
    .nE1   (SSRAM1_nCE1),
    .E2    (1'b1),
    .nE3   (1'b0),
    .ZZ    (SSRAM1_ZZ),
    .nFT   (1'b0)
  );

  //-----------------------------------------
  // ZBT SRAM 32 Bit - 2 
  //-----------------------------------------

  GS8160Z36DT  #( 
    .A_bits (`ZBT_ADDR_WIDTH ),
    .SPEED  (`ZBT_MEM_SPEED )
  )
  uSSRAM2 (
    .DQa   ({SSRAM2_DQP[0],SSRAM2_DQ[7:0]}),
    .DQb   ({SSRAM2_DQP[1],SSRAM2_DQ[15:8]}),
    .DQc   ({SSRAM2_DQP[2],SSRAM2_DQ[23:16]}),
    .DQd   ({SSRAM2_DQP[3],SSRAM2_DQ[31:24]}),
    .A     (SSRAM2_A[`ZBT_ADDR_WIDTH-1:0]),
    .nLBO  (SSRAM2_MODE),
    .CK    (SSRAM2_CLK),
    .nCKE  (SSRAM2_nCEN),
    .pADV  (SSRAM2_ADVnLD),
    .nBa   (SSRAM2_nBW[0]),
    .nBb   (SSRAM2_nBW[1]),
    .nBc   (SSRAM2_nBW[2]),
    .nBd   (SSRAM2_nBW[3]),
    .nW    (SSRAM2_nWE),
    .nG    (SSRAM2_nOE),
    .nE1   (SSRAM2_nCE1),
    .E2    (1'b1),
    .nE3   (1'b0),
    .ZZ    (SSRAM2_ZZ),
    .nFT   (1'b0)
  );

  //-----------------------------------------
  // ZBT SRAM 32 Bit - 3
  //-----------------------------------------

  GS8160Z36DT  #( 
    .A_bits (`ZBT_ADDR_WIDTH ),
    .SPEED  (`ZBT_MEM_SPEED )
  )
  uSSRAM3 (
    .DQa   ({SSRAM3_DQP[0],SSRAM3_DQ[7:0]}),
    .DQb   ({SSRAM3_DQP[1],SSRAM3_DQ[15:8]}),
    .DQc   ({SSRAM3_DQP[2],SSRAM3_DQ[23:16]}),
    .DQd   ({SSRAM3_DQP[3],SSRAM3_DQ[31:24]}),
    .A     (SSRAM3_A[`ZBT_ADDR_WIDTH-1:0]),
    .nLBO  (SSRAM3_MODE),
    .CK    (SSRAM3_CLK),
    .nCKE  (SSRAM3_nCEN),
    .pADV  (SSRAM3_ADVnLD),
    .nBa   (SSRAM3_nBW[0]),
    .nBb   (SSRAM3_nBW[1]),
    .nBc   (SSRAM3_nBW[2]),
    .nBd   (SSRAM3_nBW[3]),
    .nW    (SSRAM3_nWE),
    .nG    (SSRAM3_nOE),
    .nE1   (SSRAM3_nCE1),
    .E2    (1'b1),
    .nE3   (1'b0),
    .ZZ    (SSRAM3_ZZ),
    .nFT   (1'b0)
  );
  
  //-----------------------------------------
  // Config SPI
  //-----------------------------------------
 dcc_spi_axi udcc_spi_axi (
  .SSPRSTn  (spi_nreset),
  .SSPCK    (CLCD_PDL[6]),
  .SSPDI    (CLCD_PDL[8]),
  .SSPDO    (CLCD_PDL[7])
  );  
  
  //-----------------------------------------
  // Audio
  //-----------------------------------------
  // Audio I2S loop back for simple test
  assign AUD_SDIN = AUD_SDOUT;
  
  //-----------------------------------------
  // SCC
  //-----------------------------------------
 scc_tb uscc_tb (
  .CFGCLK       (CLCD_PDH[13]), 
  .nCFGRST      (CLCD_PDH[14]), 
  .CFGLOAD      (CLCD_PDH[15]), 
  .CFGWnR       (CLCD_PDH[16]), 
  .CFGDATAIN    (CLCD_PDH[17]), 
  .CFGDATAOUT   (CLCD_PDH[12])
);

  //-----------------------------------------
  // Arduino support
  //-----------------------------------------
 tb_arduino_shield u_tb_arduino_shield (
  .EXP     (exp),
  .SPI0    (SPI0),
  .SPI1    (SPI1),
  .I2C0    (I2C0),
  .I2C1    (I2C1),
  .UART0   (UART0),
  .UART1   (UART1)
);

  endmodule
