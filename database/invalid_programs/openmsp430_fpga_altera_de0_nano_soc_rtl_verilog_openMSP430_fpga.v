//----------------------------------------------------------------------------
// Copyright (C) 2011 Authors
//
// This source file may be used and distributed without restriction provided
// that this copyright statement is not removed from the file and that any
// derivative work contains the original copyright notice and the associated
// disclaimer.
//
// This source file is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published
// by the Free Software Foundation; either version 2.1 of the License, or
// (at your option) any later version.
//
// This source is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
// License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this source; if not, write to the Free Software Foundation,
// Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
//
//----------------------------------------------------------------------------
//
// *File Name: openMSP430_fpga.v
//
// *Module Description:
//                      openMSP430 FPGA Top-level for the DE0 Nano Soc
//
// *Author(s):
//              - Olivier Girard,    olgirard@gmail.com
//
//----------------------------------------------------------------------------
`include "openmsp430/openMSP430_defines.v"


module openMSP430_fpga (

  //-----------------------------
  // USER CLOCKS
  //-----------------------------
  input         FPGA_CLK1_50,
  input         FPGA_CLK2_50,
  input         FPGA_CLK3_50,

  //-----------------------------
  // USER INTERFACE (FPGA)
  //-----------------------------
  input   [1:0] KEY,
  input   [3:0] SW,
  output  [7:0] LED,

  //-----------------------------
  // GPIO
  //-----------------------------
  inout  [35:0] GPIO_0,
  inout  [35:0] GPIO_1,

  //-----------------------------
  // ARDUINO DIGITAL INTERFACE
  //-----------------------------
  inout  [15:0] ARDUINO_IO,
  inout         ARDUINO_RESET_N,

  //-----------------------------
  // ADC
  //-----------------------------
  output        ADC_CONVST,
  output        ADC_SCK,
  output        ADC_SDI,
  input         ADC_SDO
);

//=============================================================================
// 1)  INTERNAL WIRES/REGISTERS/PARAMETERS DECLARATION
//=============================================================================

// openMSP430 Program memory bus
wire [`PMEM_MSB:0] pmem_addr;
wire        [15:0] pmem_din;
wire               pmem_cen;
wire         [1:0] pmem_wen;
wire        [15:0] pmem_dout;

// openMSP430 Data memory bus
wire [`DMEM_MSB:0] dmem_addr;
wire        [15:0] dmem_din;
wire               dmem_cen;
wire         [1:0] dmem_wen;
wire        [15:0] dmem_dout;

// openMSP430 Peripheral memory bus
wire        [13:0] per_addr;
wire        [15:0] per_din;
wire               per_en;
wire         [1:0] per_we;
wire        [15:0] per_dout;

// openMSP430 IRQs
wire               nmi;
wire        [13:0] irq_bus;
wire        [13:0] irq_acc;

// openMSP430 debug interface
wire               dbg_freeze;
wire         [6:0] dbg_i2c_addr;
wire         [6:0] dbg_i2c_broadcast;
wire               dbg_i2c_scl;
wire               dbg_i2c_sda_in;
wire               dbg_i2c_sda_out;
wire               dbg_uart_txd;
wire               dbg_uart_rxd;

// openMSP430 clocks and resets
wire               dco_clk;
wire               lfxt_clk;
wire               aclk_en;
wire               smclk_en;
wire               mclk;
wire               reset_n;
wire               puc_rst;

// LED / KEY / SW
wire               irq_key;
wire               irq_sw;
wire        [15:0] per_dout_led_key_sw;

// Timer A
wire               irq_ta0;
wire               irq_ta1;
wire        [15:0] per_dout_tA;

// Graphic Controller
wire               irq_gfx;
wire        [15:0] per_dout_gfx;

wire         [8:0] lut_ram_addr;
wire               lut_ram_wen;
wire               lut_ram_cen;
wire        [15:0] lut_ram_din;
wire        [15:0] lut_ram_dout;

wire        [16:0] vid_ram_addr;
wire               vid_ram_wen;
wire               vid_ram_cen;
wire        [15:0] vid_ram_din;
wire        [15:0] vid_ram_dout;

// Touch-Screen Controller
wire               irq_touch;


//=============================================================================
// 2)  CLOCK AND RESET GENERATION
//=============================================================================

assign dco_clk    = FPGA_CLK1_50;
wire   reset_in_n = KEY[0];

// Release system reset a few clock cyles after the FPGA power-on-reset
reg [7:0] reset_dly_chain;
always @ (posedge dco_clk or negedge reset_in_n)
  if (!reset_in_n) reset_dly_chain <= 8'h00;
  else             reset_dly_chain <= {1'b1, reset_dly_chain[7:1]};

assign reset_n = reset_dly_chain[0];

// Generate a slow reference clock LFXT_CLK (10us period)
reg [8:0] lfxt_clk_cnt;
always @ (posedge dco_clk or negedge reset_n)
  if (!reset_n) lfxt_clk_cnt <= 9'h000;
  else          lfxt_clk_cnt <= lfxt_clk_cnt + 9'h001;

assign lfxt_clk = lfxt_clk_cnt[8];


//=============================================================================
// 3)  OPENMSP430
//=============================================================================

openMSP430 openmsp430_0 (

// OUTPUTs
    .aclk              (),                    // ASIC ONLY: ACLK
    .aclk_en           (aclk_en),             // FPGA ONLY: ACLK enable
    .dbg_freeze        (dbg_freeze),          // Freeze peripherals
    .dbg_i2c_sda_out   (dbg_i2c_sda_out),     // Debug interface: I2C SDA OUT
    .dbg_uart_txd      (dbg_uart_txd),        // Debug interface: UART TXD
    .dco_enable        (),                    // ASIC ONLY: Fast oscillator enable
    .dco_wkup          (),                    // ASIC ONLY: Fast oscillator wake-up (asynchronous)
    .dmem_addr         (dmem_addr),           // Data Memory address
    .dmem_cen          (dmem_cen),            // Data Memory chip enable (low active)
    .dmem_din          (dmem_din),            // Data Memory data input
    .dmem_wen          (dmem_wen),            // Data Memory write enable (low active)
    .irq_acc           (irq_acc),             // Interrupt request accepted (one-hot signal)
    .lfxt_enable       (),                    // ASIC ONLY: Low frequency oscillator enable
    .lfxt_wkup         (),                    // ASIC ONLY: Low frequency oscillator wake-up (asynchronous)
    .mclk              (mclk),                // Main system clock
    .dma_dout          (),                    // Direct Memory Access data output
    .dma_ready         (),                    // Direct Memory Access is complete
    .dma_resp          (),                    // Direct Memory Access response (0:Okay / 1:Error)
    .per_addr          (per_addr),            // Peripheral address
    .per_din           (per_din),             // Peripheral data input
    .per_we            (per_we),              // Peripheral write enable (high active)
    .per_en            (per_en),              // Peripheral enable (high active)
    .pmem_addr         (pmem_addr),           // Program Memory address
    .pmem_cen          (pmem_cen),            // Program Memory chip enable (low active)
    .pmem_din          (pmem_din),            // Program Memory data input (optional)
    .pmem_wen          (pmem_wen),            // Program Memory write enable (low active) (optional)
    .puc_rst           (puc_rst),             // Main system reset
    .smclk             (),                    // ASIC ONLY: SMCLK
    .smclk_en          (smclk_en),            // FPGA ONLY: SMCLK enable

// INPUTs
    .cpu_en            (1'b1),                // Enable CPU code execution (asynchronous and non-glitchy)
    .dbg_en            (1'b1),                // Debug interface enable (asynchronous and non-glitchy)
    .dbg_i2c_addr      (dbg_i2c_addr),        // Debug interface: I2C Address
    .dbg_i2c_broadcast (dbg_i2c_broadcast),   // Debug interface: I2C Broadcast Address (for multicore systems)
    .dbg_i2c_scl       (dbg_i2c_scl),         // Debug interface: I2C SCL
    .dbg_i2c_sda_in    (dbg_i2c_sda_in),      // Debug interface: I2C SDA IN
    .dbg_uart_rxd      (dbg_uart_rxd),        // Debug interface: UART RXD (asynchronous)
    .dco_clk           (dco_clk),             // Fast oscillator (fast clock)
    .dmem_dout         (dmem_dout),           // Data Memory data output
    .irq               (irq_bus),             // Maskable interrupts
    .lfxt_clk          (lfxt_clk),            // Low frequency oscillator (typ 32kHz)
    .dma_addr          (15'h0000),            // Direct Memory Access address
    .dma_din           (16'h0000),            // Direct Memory Access data input
    .dma_en            (1'b0),                // Direct Memory Access enable (high active)
    .dma_priority      (1'b0),                // Direct Memory Access priority (0:low / 1:high)
    .dma_we            (2'b00),               // Direct Memory Access write byte enable (high active)
    .dma_wkup          (1'b0),                // ASIC ONLY: DMA Sub-System Wake-up (asynchronous and non-glitchy)
    .nmi               (nmi),                 // Non-maskable interrupt (asynchronous)
    .per_dout          (per_dout),            // Peripheral data output
    .pmem_dout         (pmem_dout),           // Program Memory data output
    .reset_n           (reset_n),             // Reset Pin (low active, asynchronous and non-glitchy)
    .scan_enable       (1'b0),                // ASIC ONLY: Scan enable (active during scan shifting)
    .scan_mode         (1'b0),                // ASIC ONLY: Scan mode
    .wkup              (1'b0)                 // ASIC ONLY: System Wake-up (asynchronous and non-glitchy)
);


//=============================================================================
// 4)  OPENMSP430 PERIPHERALS
//=============================================================================

//-----------------------------
// LED / KEY / SW interface
//-----------------------------
omsp_de0_nano_soc_led_key_sw de0_nano_soc_led_key_sw_0 (

// OUTPUTs
    .irq_key           (irq_key),             // Key/Button interrupt
    .irq_sw            (irq_sw),              // Switch interrupt

    .led               (LED),                 // LED output control
    .per_dout          (per_dout_led_key_sw), // Peripheral data output

// INPUTs
    .mclk              (mclk),                // Main system clock
    .key               (KEY),                 // key/button inputs
    .sw                (SW),                  // switches inputs
    .per_addr          (per_addr),            // Peripheral address
    .per_din           (per_din),             // Peripheral data input
    .per_en            (per_en),              // Peripheral enable (high active)
    .per_we            (per_we),              // Peripheral write enable (high active)
    .puc_rst           (puc_rst)              // Main system reset
);

//-----------------------------
// Timer A
//-----------------------------

omsp_timerA timerA_0 (

// OUTPUTs
    .irq_ta0           (irq_ta0),             // Timer A interrupt: TACCR0
    .irq_ta1           (irq_ta1),             // Timer A interrupt: TAIV, TACCR1, TACCR2
    .per_dout          (per_dout_tA),         // Peripheral data output
    .ta_out0           (),                    // Timer A output 0
    .ta_out0_en        (),                    // Timer A output 0 enable
    .ta_out1           (),                    // Timer A output 1
    .ta_out1_en        (),                    // Timer A output 1 enable
    .ta_out2           (),                    // Timer A output 2
    .ta_out2_en        (),                    // Timer A output 2 enable

// INPUTs
    .aclk_en           (aclk_en),             // ACLK enable (from CPU)
    .dbg_freeze        (dbg_freeze),          // Freeze Timer A counter
    .inclk             (1'b0),                // INCLK external timer clock (SLOW)
    .irq_ta0_acc       (irq_acc[9]),          // Interrupt request TACCR0 accepted
    .mclk              (mclk),                // Main system clock
    .per_addr          (per_addr),            // Peripheral address
    .per_din           (per_din),             // Peripheral data input
    .per_en            (per_en),              // Peripheral enable (high active)
    .per_we            (per_we),              // Peripheral write enable (high active)
    .puc_rst           (puc_rst),             // Main system reset
    .smclk_en          (smclk_en),            // SMCLK enable (from CPU)
    .ta_cci0a          (1'b0),                // Timer A capture 0 input A
    .ta_cci0b          (1'b0),                // Timer A capture 0 input B
    .ta_cci1a          (1'b0),                // Timer A capture 1 input A
    .ta_cci1b          (1'b0),                // Timer A capture 1 input B
    .ta_cci2a          (1'b0),                // Timer A capture 2 input A
    .ta_cci2b          (1'b0),                // Timer A capture 2 input B
    .taclk             (1'b0)                 // TACLK external timer clock (SLOW)
);

//-------------------------------
// GRAPHIC CONTROLER
// (Interfacing with LT24 board)
//-------------------------------

// Bidirectional data bus
wire [15:0] lt24_data;
wire [15:0] lt24_d_out;
wire        lt24_d_out_en;

io_buf io_buf_lt24_data_00 (.datain(lt24_d_out[0]),  .oe(lt24_d_out_en), .dataout(lt24_data[0]),  .dataio(GPIO_0[8]) );
io_buf io_buf_lt24_data_01 (.datain(lt24_d_out[1]),  .oe(lt24_d_out_en), .dataout(lt24_data[1]),  .dataio(GPIO_0[7]) );
io_buf io_buf_lt24_data_02 (.datain(lt24_d_out[2]),  .oe(lt24_d_out_en), .dataout(lt24_data[2]),  .dataio(GPIO_0[6]) );
io_buf io_buf_lt24_data_03 (.datain(lt24_d_out[3]),  .oe(lt24_d_out_en), .dataout(lt24_data[3]),  .dataio(GPIO_0[5]) );
io_buf io_buf_lt24_data_04 (.datain(lt24_d_out[4]),  .oe(lt24_d_out_en), .dataout(lt24_data[4]),  .dataio(GPIO_0[13]));
io_buf io_buf_lt24_data_05 (.datain(lt24_d_out[5]),  .oe(lt24_d_out_en), .dataout(lt24_data[5]),  .dataio(GPIO_0[14]));
io_buf io_buf_lt24_data_06 (.datain(lt24_d_out[6]),  .oe(lt24_d_out_en), .dataout(lt24_data[6]),  .dataio(GPIO_0[15]));
io_buf io_buf_lt24_data_07 (.datain(lt24_d_out[7]),  .oe(lt24_d_out_en), .dataout(lt24_data[7]),  .dataio(GPIO_0[16]));
io_buf io_buf_lt24_data_08 (.datain(lt24_d_out[8]),  .oe(lt24_d_out_en), .dataout(lt24_data[8]),  .dataio(GPIO_0[17]));
io_buf io_buf_lt24_data_09 (.datain(lt24_d_out[9]),  .oe(lt24_d_out_en), .dataout(lt24_data[9]),  .dataio(GPIO_0[18]));
io_buf io_buf_lt24_data_10 (.datain(lt24_d_out[10]), .oe(lt24_d_out_en), .dataout(lt24_data[10]), .dataio(GPIO_0[19]));
io_buf io_buf_lt24_data_11 (.datain(lt24_d_out[11]), .oe(lt24_d_out_en), .dataout(lt24_data[11]), .dataio(GPIO_0[20]));
io_buf io_buf_lt24_data_12 (.datain(lt24_d_out[12]), .oe(lt24_d_out_en), .dataout(lt24_data[12]), .dataio(GPIO_0[21]));
io_buf io_buf_lt24_data_13 (.datain(lt24_d_out[13]), .oe(lt24_d_out_en), .dataout(lt24_data[13]), .dataio(GPIO_0[22]));
io_buf io_buf_lt24_data_14 (.datain(lt24_d_out[14]), .oe(lt24_d_out_en), .dataout(lt24_data[14]), .dataio(GPIO_0[23]));
io_buf io_buf_lt24_data_15 (.datain(lt24_d_out[15]), .oe(lt24_d_out_en), .dataout(lt24_data[15]), .dataio(GPIO_0[24]));



openGFX430 #(.BASE_ADDR(16'h0200)) opengfx430_0 (

// OUTPUTs
    .irq_gfx_o             (irq_gfx),                 // Graphic Controller interrupt

    .lt24_cs_n_o           (GPIO_0[25]),              // LT24 Chip select (Active low)
    .lt24_rd_n_o           (GPIO_0[10]),              // LT24 Read strobe (Active low)
    .lt24_wr_n_o           (GPIO_0[11]),              // LT24 Write strobe (Active low)
    .lt24_rs_o             (GPIO_0[12]),              // LT24 Command/Param selection (Cmd=0/Param=1)
    .lt24_d_o              (lt24_d_out),              // LT24 Data output
    .lt24_d_en_o           (lt24_d_out_en),           // LT24 Data output enable
    .lt24_reset_n_o        (GPIO_0[33]),              // LT24 Reset (Active Low)
    .lt24_on_o             (GPIO_0[35]),              // LT24 on/off

    .per_dout_o            (per_dout_gfx),            // Peripheral data output

    .lut_ram_addr_o        (lut_ram_addr),            // LUT-RAM address
    .lut_ram_wen_o         (lut_ram_wen ),            // LUT-RAM write enable (active low)
    .lut_ram_cen_o         (lut_ram_cen ),            // LUT-RAM enable (active low)
    .lut_ram_din_o         (lut_ram_din ),            // LUT-RAM data input

    .vid_ram_addr_o        (vid_ram_addr),            // Video-RAM address
    .vid_ram_wen_o         (vid_ram_wen ),            // Video-RAM write enable (active low)
    .vid_ram_cen_o         (vid_ram_cen ),            // Video-RAM enable (active low)
    .vid_ram_din_o         (vid_ram_din ),            // Video-RAM data input

// INPUTs
    .dbg_freeze_i          (dbg_freeze),              // Freeze address auto-incr on read
    .mclk                  (mclk),                    // Main system clock
    .per_addr_i            (per_addr),                // Peripheral address
    .per_din_i             (per_din),                 // Peripheral data input
    .per_en_i              (per_en),                  // Peripheral enable (high active)
    .per_we_i              (per_we),                  // Peripheral write enable (high active)
    .puc_rst               (puc_rst),                 // Main system reset

    .lt24_d_i              (lt24_data),               // LT24 Data input

    .lut_ram_dout_i        (lut_ram_dout),            // LUT-RAM data output
    .vid_ram_dout_i        (vid_ram_dout)             // Video-RAM  data output
);

// Video memory
ram_16x75k vid_ram_16x75k_0 (

    .address           ( vid_ram_addr),
    .byteena	       (~{2{vid_ram_wen}}),
    .clken	       (~vid_ram_cen),
    .clock             ( mclk),
    .data              ( vid_ram_din),
    .wren              (~vid_ram_wen),
    .q	               ( vid_ram_dout)
);

// LUT memory
ram_16x512 lut_ram_16x512_0 (

    .address           ( lut_ram_addr),
    .byteena           (~{2{lut_ram_wen}}),
    .clken             (~lut_ram_cen),
    .clock             ( mclk),
    .data              ( lut_ram_din),
    .wren              (~lut_ram_wen),
    .q	               ( lut_ram_dout)
);

assign GPIO_0[34] = 1'b1; //    .adc_cs_n          (GPIO_0[34]),          // ADC Chip select (Active low)
assign GPIO_0[4]  = 1'b0; //    .adc_dclk          (GPIO_0[4]),           // ADC Clock
assign GPIO_0[3]  = 1'b0; //    .adc_din           (GPIO_0[3]),           // ADC Data input
assign irq_touch  = 1'b0; //
//    .adc_busy          (GPIO_0[2]),           // ADC Busy output
//    .adc_dount         (GPIO_0[1]),           // ADC Data output
//    .adc_penirq_n      (GPIO_0[0]),           // Pen IRQ from touch controller

//-----------------------------
// Combine peripheral
// data buses
//-----------------------------

assign per_dout = per_dout_led_key_sw |
                  per_dout_tA         |
                  per_dout_gfx;


//-----------------------------
// Assign interrupts
//-----------------------------

assign nmi      =  1'b0;
assign irq_bus  = {1'b0,         // Vector 13  (0xFFFA)
                   1'b0,         // Vector 12  (0xFFF8)
                   1'b0,         // Vector 11  (0xFFF6)
                   1'b0,         // Vector 10  (0xFFF4) - Watchdog -
                   irq_ta0,      // Vector  9  (0xFFF2)
                   irq_ta1,      // Vector  8  (0xFFF0)
                   1'b0,         // Vector  7  (0xFFEE)
                   irq_gfx,      // Vector  6  (0xFFEC)
                   irq_touch,    // Vector  5  (0xFFEA)
                   1'b0,         // Vector  4  (0xFFE8)
                   irq_key,      // Vector  3  (0xFFE6)
                   irq_sw,       // Vector  2  (0xFFE4)
                   1'b0,         // Vector  1  (0xFFE2)
                   1'b0};        // Vector  0  (0xFFE0)


//=============================================================================
// 5)  PROGRAM AND DATA MEMORIES
//=============================================================================

ram_16x16k pmem_0 (
    .address   ( pmem_addr),
    .byteena   (~pmem_wen),
    .clken     (~pmem_cen),
    .clock     ( mclk),
    .data      ( pmem_din),
    .wren      (~(&pmem_wen)),
    .q         ( pmem_dout)
);

ram_16x8k dmem_0 (
    .address   ( dmem_addr),
    .byteena   (~dmem_wen),
    .clken     (~dmem_cen),
    .clock     ( mclk),
    .data      ( dmem_din),
    .wren      (~(&dmem_wen)),
    .q         ( dmem_dout)
);

//=============================================================================
// 6)  DEBUG INTERFACE
//=============================================================================

assign  dbg_i2c_addr       =  7'd50;
assign  dbg_i2c_broadcast  =  7'd49;
assign  dbg_i2c_scl        =  ARDUINO_IO[15];
io_buf io_buf_sda_0 (.datain(1'b0), .oe(~dbg_i2c_sda_out), .dataout(dbg_i2c_sda_in), .dataio(ARDUINO_IO[14]));
assign  dbg_uart_rxd       =  1'b0;

// Unused stuff
assign  GPIO_0             =  36'hzzzzzzzzz;
assign  GPIO_1             =  36'hzzzzzzzzz;
assign  ARDUINO_IO[13:0]   =  14'hzzzz;
assign  ARDUINO_RESET_N    =   1'hz;
assign  ADC_CONVST         =   1'hz;
assign  ADC_SCK            =   1'hz;
assign  ADC_SDI            =   1'hz;

endmodule
