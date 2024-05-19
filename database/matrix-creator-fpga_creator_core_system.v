// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

/*
* Copyright 2016 <Admobilize>
* MATRIX Labs  [http://creator.matrix.one]
* This file is part of MATRIX Creator HDL for Spartan 6
*
* MATRIX Creator HDL is like free software: you can redistribute
* it and/or modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.

* This program is distributed in the hope that it will be useful, but
* WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.

* You should have received a copy of the GNU General Public License along
* with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

module system #(
  parameter                  EVERLOOP_FILE     = "rtl/wb_everloop/image  .ram",
  parameter                  ADDR_WIDTH        = 15                     ,
  parameter                  DATA_WIDTH        = 16                     ,
  parameter                  GPIO_WIDTH        = 16                     ,
  //General Configuration
  parameter                  SYS_FREQ_HZ       = 150_000_000            ,
  parameter                  CLKFX_DIVIDE      = 1                      ,
  parameter                  CLKFX_MULTIPLY    = 3                      ,
  parameter [          63:0] VERSION           = 64'h44E8_05C3_000A_0001,
  //Microphone Configuration
  parameter                  OUT_FREQ_HZ       = 16_000                 ,
  parameter                  PDM_FREQ_HZ       = 3_000_000              , /* this frequency must be multiple of 16000, 22000, 44000, 48000 Hz */
  parameter [DATA_WIDTH-1:0] PDM_RATIO   = $floor(SYS_FREQ_HZ/PDM_FREQ_HZ)-1,
  parameter [DATA_WIDTH-1:0] PDM_READING_TIME = $floor(7*PDM_RATIO/12),
  parameter [DATA_WIDTH-1:0] DECIMATION_RATIO = $floor((SYS_FREQ_HZ ) / (OUT_FREQ_HZ * (PDM_RATIO+1)))-1,
  parameter [DATA_WIDTH-1:0] DATA_GAIN_DEFAULT = 3                      ,
  // Everloop
  parameter [DATA_WIDTH-1:0] N_LEDS            = 35
) (
  input                   clk_50         ,
  input                   resetn         ,
  /* RASPBERRY's SPI interface */
  input                   mosi           ,
  input                   ss             ,
  input                   ss1            ,
  input                   sck            ,
  output                  miso           ,
  /* RASPBERRY's UART interface */
  input                   uart_rx_pi     ,
  output                  uart_tx_pi     ,
  /* RASPBERRY's UART interface */
  input                   ir_tx_pi       ,
  output                  ir_rx_pi       ,
  /* PDM MIC Array */
  input  [           7:0] pdm_data       ,
  output                  pdm_clk        ,
  output                  mic_irq        ,
  /* Everloop */
  output                  everloop_ctl   ,
  /* MCU SAM */
  input                   mcu_nwe        ,
  input                   mcu_ncs        ,
  input                   mcu_nrd        ,
  input  [          10:0] mcu_addr       , //TODO(andres.calderon): parameterize
  inout  [           7:0] mcu_sram_data  , //TODO(andres.calderon): parameterize
  /* IR */
  input                   ir_rx          ,
  output                  ir_tx          ,
  output                  ir_ring        ,
  /* GPIO */
  inout  [GPIO_WIDTH-1:0] gpio_io        ,
  //EM358
  input                   zigbee_rx      ,
  output                  zigbee_tx      ,
  //NFC - SPI Interface
  input                   nfc_miso       ,
  output                  nfc_mosi       ,
  output                  nfc_cs         ,
  output                  nfc_sck        ,
  output                  nfc_rst        ,
  input                   nfc_irq        ,
  output                  nfc_irq_pi     ,
  //Zwave - Serial - SPI
  input                   zwave_rxd      ,
  output                  zwave_txd      ,
  inout                   zwave_mosi     ,
  input                   zwave_miso     ,
  inout                   zwave_sck      ,
  input                   zwave_cs       ,
  output                  zwave_nreset     ,
  // Serial Interruption
  output                  uart_irq       ,
  /* Debug */
  output                  debug_led      ,
  /* workarounds */
  /* workaround: resetn signal (P105) has disconnected in the v 1.0 rev 1 */
  input                   i2c_sda        ,
  input                   i2c_scl        ,
  input                   nrst_deprecated
);

//Set up IR
  assign debug_led = ~ir_rx;
  assign ir_rx_pi = ir_rx;
  assign ir_tx    = ir_tx_pi;
  assign ir_ring  = ir_tx_pi;
//Set up UART-ZWAVE
  assign zigbee_tx  = uart_rx_pi;
  assign uart_tx_pi = zigbee_rx;
//Set up NFC PN512
  assign nfc_cs     = ss1;
  assign nfc_sck    = sck;
  assign nfc_irq_pi = nfc_irq;
  assign nfc_mosi   = mosi;
  assign nfc_rst    = 1'b1;

// SPI multi-slave logic
  wire system_miso;
  assign miso = (ss == 0) ? system_miso : (ss1 == 0) ? nfc_miso : 1'b1;
//------------------------------------------------------------------
// DCM Logic
//------------------------------------------------------------------
  wire clk ;
  wire nclk;
  creator_dcm #(
    .CLKFX_DIVIDE  (CLKFX_DIVIDE  ),
    .CLKFX_MULTIPLY(CLKFX_MULTIPLY)
  ) dcm (
    .clkin       (clk_50),
    .clk_out_200 (clk   ),
    .nclk_out_200(nclk  ),
    .clk_out_25  (      )
  );
//------------------------------------------------------------------
// Whishbone Wires
//------------------------------------------------------------------
  wire                  gnd   = 1'b0              ;
  wire [           1:0] gnd2  = 4'h0              ;
  wire [DATA_WIDTH-1:0] gnd16 = {DATA_WIDTH{1'b0}};
  wire [ADDR_WIDTH-1:0] gnd15 = {ADDR_WIDTH{1'b0}};

  wire [ADDR_WIDTH-1:0] spi0_adr,
                        mcu_bram_adr,
                        uart0_adr,
                        bram0_adr,
                        mic_array_adr,
                        gpio0_adr,
                        everloop_adr,
                        zwave_gpio_adr;

  wire [DATA_WIDTH-1:0] spi0_dat_r,
                        spi0_dat_w,
                        mcu_bram_r,
                        mcu_bram_w,
                        uart0_dat_r,
                        uart0_dat_w,
                        bram0_dat_r,
                        bram0_dat_w,
                        mic_array_dat_r,
                        mic_array_dat_w,
                        gpio0_dat_r,
                        gpio0_dat_w,
                        everloop_dat_r,
                        everloop_dat_w,
                        zwave_gpio_r,
                        zwave_gpio_w;

  wire [1:0]  mcu_bram_sel,
              uart0_sel,
              bram0_sel,
              gpio0_sel,
              mic_array_sel,
              everloop_sel,
              zwave_gpio_sel;

  wire  spi0_we,
        mcu_bram_we,
        uart0_we,
        bram0_we,
        gpio0_we,
        mic_array_we,
        everloop_we,
        zwave_gpio_we;

  wire  spi0_cyc,
        mcu_bram_cyc,
        uart0_cyc,
        bram0_cyc,
        gpio0_cyc,
        mic_array_cyc,
        everloop_cyc,
        zwave_gpio_cyc;

  wire  spi0_stb,
        mcu_bram_stb,
        uart0_stb,
        bram0_stb,
        gpio0_stb,
        mic_array_stb,
        everloop_stb,
        zwave_gpio_stb;

  wire  spi0_ack,
        bram0_ack,
        mic_array_ack,
        everloop_ack,
        gpio0_ack,
        mcu_bram_ack,
        uart0_ack,
        zwave_gpio_ack;

//---------------------------------------------------------------------------
// Wishbone Interconnect
//---------------------------------------------------------------------------
  conbus #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .s_addr_w  (3         ),
    .s0_addr   (3'b000    ), // bram          000 0000 0000 0000 0x0000
    .s1_addr   (3'b001    ), // uart0         001 0000 0000 0000 0x1000
    .s2_addr   (3'b010    ), // mic_array     010 0000 0000 0000 0x2000
    .s3_addr   (3'b011    ), // everloop0     011 0000 0000 0000 0x3000
    .s4_addr   (3'b100    ), // gpio0         100 0000 0000 0000 0x4000
    .s5_addr   (3'b101    ), // mcu_bram      101 0000 0000 0000 0x5000
    .s6_addr   (3'b111    )  // zwave_gpio    111 0000 0000 0000 0x7000
  ) conbus0 (
    .sys_clk (clk            ),
    .sys_rst (resetn         ),
    // Master0 to the RPi
    .m0_dat_i(spi0_dat_r     ),
    .m0_dat_o(spi0_dat_w     ),
    .m0_adr_i(spi0_adr       ),
    .m0_we_i (spi0_we        ),
    .m0_sel_i(gnd2           ),
    .m0_cyc_i(spi0_cyc       ),
    .m0_stb_i(spi0_stb       ),
    .m0_cti_i(3'b000         ),
    .m0_ack_o(spi0_ack       ),
    // Master1
    .m1_dat_i(gnd16          ),
    .m1_adr_i(gnd15          ),
    .m1_sel_i(gnd2           ),
    .m1_cyc_i(gnd            ),
    .m1_stb_i(gnd            ),
    // Slave0  bram
    .s0_dat_i(bram0_dat_r    ),
    .s0_dat_o(bram0_dat_w    ),
    .s0_adr_o(bram0_adr      ),
    .s0_sel_o(bram0_sel      ),
    .s0_we_o (bram0_we       ),
    .s0_cyc_o(bram0_cyc      ),
    .s0_stb_o(bram0_stb      ),
    .s0_ack_i(bram0_ack      ),
    // Slave1
    .s1_dat_i(uart0_dat_r    ),
    .s1_dat_o(uart0_dat_w    ),
    .s1_adr_o(uart0_adr      ),
    .s1_sel_o(uart0_sel      ),
    .s1_we_o (uart0_we       ),
    .s1_cyc_o(uart0_cyc      ),
    .s1_stb_o(uart0_stb      ),
    .s1_ack_i(uart0_ack      ),
    // Slave3  mic_array
    .s2_dat_i(mic_array_dat_r),
    .s2_dat_o(mic_array_dat_w),
    .s2_adr_o(mic_array_adr  ),
    .s2_sel_o(mic_array_sel  ),
    .s2_we_o (mic_array_we   ),
    .s2_cyc_o(mic_array_cyc  ),
    .s2_stb_o(mic_array_stb  ),
    .s2_ack_i(mic_array_ack  ),
    // Slave3 Everloop
    .s3_dat_i(everloop_dat_r ),
    .s3_dat_o(everloop_dat_w ),
    .s3_adr_o(everloop_adr   ),
    .s3_sel_o(everloop_sel   ),
    .s3_we_o (everloop_we    ),
    .s3_cyc_o(everloop_cyc   ),
    .s3_stb_o(everloop_stb   ),
    .s3_ack_i(everloop_ack   ),
    // Slave5
    .s4_dat_i(gpio0_dat_r    ),
    .s4_dat_o(gpio0_dat_w    ),
    .s4_adr_o(gpio0_adr      ),
    .s4_sel_o(gpio0_sel      ),
    .s4_we_o (gpio0_we       ),
    .s4_cyc_o(gpio0_cyc      ),
    .s4_stb_o(gpio0_stb      ),
    .s4_ack_i(gpio0_ack      ),
    // Slave7
    .s5_dat_i(mcu_bram_r     ),
    .s5_dat_o(mcu_bram_w     ),
    .s5_adr_o(mcu_bram_adr   ),
    .s5_sel_o(mcu_bram_sel   ),
    .s5_we_o (mcu_bram_we    ),
    .s5_cyc_o(mcu_bram_cyc   ),
    .s5_stb_o(mcu_bram_stb   ),
    .s5_ack_i(mcu_bram_ack   ),
    // Slave6
    .s6_dat_i(zwave_gpio_r   ),
    .s6_dat_o(zwave_gpio_w   ),
    .s6_adr_o(zwave_gpio_adr ),
    .s6_sel_o(zwave_gpio_sel ),
    .s6_we_o (zwave_gpio_we  ),
    .s6_cyc_o(zwave_gpio_cyc ),
    .s6_stb_o(zwave_gpio_stb ),
    .s6_ack_i(zwave_gpio_ack ),
    
    .s7_ack_i(gnd            ),
    .s7_dat_i(gnd16          )
  );

//---------------------------------------------------------------------------
// RASPBERRY's SPI INTERFACE
//---------------------------------------------------------------------------
  wb_spi_slave #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
  ) spi0 (
    .clk       (clk        ),
    .resetn    (resetn     ),
    
    .mosi      (mosi       ),
    .ss        (ss         ),
    .sck       (sck        ),
    .miso      (system_miso),
    
    .data_bus_r(spi0_dat_r ),
    .data_bus_w(spi0_dat_w ),
    .addr_bus  (spi0_adr   ),
    .strobe    (spi0_stb   ),
    .cycle     (spi0_cyc   ),
    .wr        (spi0_we    ),
    .ack       (spi0_ack   )
  );

//---------------------------------------------------------------------------
// Block RAM
//---------------------------------------------------------------------------
  wire [DATA_WIDTH-1:0] mic_sample_rate;
  wire [DATA_WIDTH-1:0] mic_data_gain  ;

  wb_bram #(
    .ADDR_WIDTH       (ADDR_WIDTH       ),
    .DATA_WIDTH       (DATA_WIDTH       ),
    .VERSION          (VERSION          ),
    .CLKFX_DIVIDE     (CLKFX_DIVIDE     ),
    .CLKFX_MULTIPLY   (CLKFX_MULTIPLY   ),
    .DECIMATION_RATIO (DECIMATION_RATIO ),
    .DATA_GAIN_DEFAULT(DATA_GAIN_DEFAULT)
  ) bram0 (
    .clk            (clk            ),
    .resetn         (resetn         ),
    .wb_adr_i       (bram0_adr      ),
    .wb_dat_o       (bram0_dat_r    ),
    .wb_dat_i       (bram0_dat_w    ),
    .wb_sel_i       (bram0_sel      ),
    .wb_stb_i       (bram0_stb      ),
    .wb_cyc_i       (bram0_cyc      ),
    .wb_we_i        (bram0_we       ),
    .wb_ack_o       (bram0_ack      ),
    // MIC Configuration
    .mic_sample_rate(mic_sample_rate),
    .mic_data_gain  (mic_data_gain  )
  );
//---------------------------------------------------------------------------
// MCU BRAM
//---------------------------------------------------------------------------
  wb_mcu_bram #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
  ) mcu_bram0 (
    //Wishbone interface
    .clk_i        (clk          ),
    .wb_adr_i     (mcu_bram_adr ),
    .wb_dat_o     (mcu_bram_r   ),
    .wb_dat_i     (mcu_bram_w   ),
    .wb_sel_i     (mcu_bram_sel ),
    .wb_stb_i     (mcu_bram_stb ),
    .wb_cyc_i     (mcu_bram_cyc ),
    .wb_we_i      (mcu_bram_we  ), 
    //MCU SAM
    .mcu_clk      (nclk         ),
    .mcu_nwe      (mcu_nwe      ),
    .mcu_ncs      (mcu_ncs      ),
    .mcu_nrd      (mcu_nrd      ),
    .mcu_addr     (mcu_addr     ),
    .mcu_sram_data(mcu_sram_data),
    .wb_ack_o     (mcu_bram_ack )
  );
//---------------------------------------------------------------------------
// Microphone Array
//---------------------------------------------------------------------------
  wb_mic_array #(
    .SYS_FREQ_HZ     (SYS_FREQ_HZ     ),
    .ADDR_WIDTH      (ADDR_WIDTH      ),
    .DATA_WIDTH      (DATA_WIDTH      ),
    .PDM_FREQ_HZ     (PDM_FREQ_HZ     ),
    .PDM_RATIO       (PDM_RATIO       ),
    .PDM_READING_TIME(PDM_READING_TIME)
  ) mic_array0 (
    .clk        (clk            ),
    .resetn     (resetn         ),
    // MIC_Interface
    .pdm_data   (pdm_data       ),
    .pdm_clk    (pdm_clk        ),
    .irq        (mic_irq        ),
    // Wishbone interface
    .wb_clk     (clk            ),
    .wb_stb_i   (mic_array_stb  ),
    .wb_cyc_i   (mic_array_cyc  ),
    .wb_we_i    (mic_array_we   ),
    .wb_adr_i   (mic_array_adr  ),
    .wb_sel_i   (mic_array_sel  ),
    .wb_dat_i   (mic_array_dat_w),
    .wb_dat_o   (mic_array_dat_r),
    .wb_ack_o   (mic_array_ack  ),
    //Configuration
    .sample_rate(mic_sample_rate),
    .data_gain  (mic_data_gain  )
  );

//---------------------------------------------------------------------------
// Everloop
//---------------------------------------------------------------------------
  wb_everloop #(
    .MEM_FILE_NAME(EVERLOOP_FILE),
    .SYS_FREQ_HZ  (SYS_FREQ_HZ  ),
    .ADDR_WIDTH   (ADDR_WIDTH   ),
    .DATA_WIDTH   (DATA_WIDTH   ),
    .N_LEDS       (N_LEDS       )
  ) everloop0 (
    .clk         (clk           ),
    .resetn      (resetn        ),
    // Wishbone interface
    .wb_stb_i    (everloop_stb  ),
    .wb_cyc_i    (everloop_cyc  ),
    .wb_we_i     (everloop_we   ),
    .wb_adr_i    (everloop_adr  ),
    .wb_sel_i    (everloop_sel  ),
    .wb_dat_i    (everloop_dat_w),
    .wb_dat_o    (everloop_dat_r),
    .everloop_ctl(everloop_ctl  ),
    .wb_ack_o    (everloop_ack  )
  );

//---------------------------------------------------------------------------
// GPIO
//---------------------------------------------------------------------------
  wb_gpio #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .GPIO_WIDTH(GPIO_WIDTH)
  ) gpio0 (
    .clk     (clk        ),
    .rst     (resetn     ),
    .wb_stb_i(gpio0_stb  ),
    .wb_cyc_i(gpio0_cyc  ),
    .wb_we_i (gpio0_we   ),
    .wb_adr_i(gpio0_adr  ),
    .wb_dat_i(gpio0_dat_w),
    .wb_dat_o(gpio0_dat_r),
    .gpio_io (gpio_io    ),
    .wb_ack_o(gpio0_ack  )
  );
//---------------------------------------------------------------------------
// Zwave UART SPI interface
//---------------------------------------------------------------------------
  wb_uart #(
    .ADDR_WIDTH (ADDR_WIDTH ),
    .DATA_WIDTH (DATA_WIDTH ),
    .SYS_FREQ_HZ(SYS_FREQ_HZ),
    .BAUD_RATE  (115200     )
  ) uart0 (
    .clk     (clk        ),
    .resetn  (resetn     ),
    // Wishbone interface
    .wb_stb_i(uart0_stb  ),
    .wb_cyc_i(uart0_cyc  ),
    .wb_we_i (uart0_we   ),
    .wb_adr_i(uart0_adr  ),
    .wb_dat_i(uart0_dat_w),
    .wb_dat_o(uart0_dat_r),
    .wb_ack_o(uart0_ack  ),
    // Serial Wires
    .uart_rxd(zwave_rxd  ),
    .uart_txd(zwave_txd  ),
    .uart_irq(uart_irq   )
  );

//---------------------------------------------------------------------------
// Zwave GPIO
//---------------------------------------------------------------------------
  wb_zwave_gpio #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
  ) wb_zwave_gpio0 (
    .clk     (clk           ),
    .resetn  (resetn        ),
    // Wishbone interface
    .wb_stb_i(zwave_gpio_stb),
    .wb_cyc_i(zwave_gpio_cyc),
    .wb_we_i (zwave_gpio_we ),
    .wb_adr_i(zwave_gpio_adr),
    .wb_dat_i(zwave_gpio_w  ),
    .wb_dat_o(zwave_gpio_r  ),
    .wb_ack_o(zwave_gpio_ack),
    //Zwave Dignals
    .zwave_cs    (zwave_cs),
    .zwave_sck   (zwave_sck),
    .zwave_mosi  (zwave_mosi),
    .zwave_miso  (zwave_miso),
    .zwave_nreset(zwave_nreset)
  );

endmodule
