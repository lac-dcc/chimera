//------------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2014-2015 ARM Limited or its affiliates.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
//  Version and Release Control Information:
//
//  File Revision       : $Revision: 368444 $
//  File Date           : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//------------------------------------------------------------------------------

module arduino_adaptor (
  input wire        SPI0,
  input wire        SPI1,
  input wire        I2C0,
  input wire        I2C1,
  inout wire [51:0] EXP,
  inout wire [15:0] SH0_IO,
  inout wire [15:0] SH1_IO,
  input wire        I2C_OE_0,
  input wire        I2C_OE_1
  );

  wire ADC_CS;
  wire ADC_DOUT;
  wire ADC_DIN;
  wire ADC_CLK;

  wire BT_UART_TX;
  wire BT_UART_RX;

  wire BT_I2C_SCL;
  wire BT_I2C_SDA;
  wire BT_I2C_OE;

  wire BT_GPIO3;
  wire BT_GPIO4;
  wire BT_GPIO6;
  wire BT_GPIO7;

  wire BT_SPI_CS;
  wire BT_SPI_MOSI;
  wire BT_SPI_MISO;
  wire BT_SPI_CLK;

  wire EXP15_int;
  wire EXP41_int;
  wire SH0_IO14_int;
  wire SH1_IO14_int;


// EXP to Arduino Adaptor Signal Renaming
// ------------------------Shield 0---------------------------------------
  assign EXP[0]       = SH1_IO[1];                                           // UART Rx loop back from Shield 1 Tx
  assign SH0_IO[1]    = EXP[4];                                              // UART Tx or GPIO Output
  assign SH0_IO[2]    = EXP[2];                                              // GPIO Output
  assign SH0_IO[3]    = EXP[3];                                              // GPIO Output
  assign SH0_IO[4]    = EXP[1];                                              // GPIO Output
  assign SH0_IO[5]    = EXP[6];                                              // GPIO Output
  assign SH0_IO[6]    = EXP[7];                                              // GPIO Output
  assign SH0_IO[7]    = EXP[8];                                              // GPIO Output
  assign SH0_IO[8]    = EXP[9];                                              // GPIO Output
  assign SH0_IO[9]    = EXP[10];                                             // GPIO Output
  assign SH0_IO[10]   = EXP[12];                                             // SPI nCS     or GPIO Output
  assign SH0_IO[11]   = SPI0                   ? EXP[13]      : 1'bz;        // SPI MOSI
  assign EXP[13]      = SPI0                   ? 1'bz         : SH0_IO[11];  // GPIO Input
  assign EXP[14]      = SH0_IO[12];                                          // SPI MISO    or GPIO Input
  assign SH0_IO[13]   = EXP[11];                                             // SPI SCK     or GPIO Output
  assign SH0_IO[15]   = EXP[5];                                              // I2C SCL     or GPIO Output
  assign EXP15_int    = I2C_OE_0               ? SH0_IO[14]   : 1'bz;        // I2C SDA
  assign EXP[15]      = I2C0                   ? EXP15_int    : SH0_IO[14];  // GPIO Input  or I2C SDA
  assign SH0_IO14_int = (~EXP[15] & ~I2C_OE_0) ? 1'b0         : 1'bz;        // bidirectional
  assign SH0_IO[14]   = I2C0                   ? SH0_IO14_int : 1'bz;
  pullup (SH0_IO[14]);
// -----------------------------------------------------------------------

// ------------------------Shield 1---------------------------------------
  assign EXP[26]      = SH0_IO[1];                                           // UART Rx loop back from Shield 0 Tx
  assign SH1_IO[1]    = EXP[30];                                             // UART Tx    or GPIO Output
  assign SH1_IO[2]    = EXP[28];                                             // GPIO Output
  assign SH1_IO[3]    = EXP[29];                                             // GPIO Output
  assign SH1_IO[4]    = EXP[27];                                             // GPIO Output
  assign SH1_IO[5]    = EXP[32];                                             // GPIO Output
  assign SH1_IO[6]    = EXP[33];                                             // GPIO Output
  assign SH1_IO[7]    = EXP[34];                                             // GPIO Output
  assign SH1_IO[8]    = EXP[35];                                             // GPIO Output
  assign SH1_IO[9]    = EXP[36];                                             // GPIO Output
  assign SH1_IO[10]   = EXP[38];                                             // SPI nCS     or GPIO Output
  assign SH1_IO[11]   = SPI1                   ? EXP[39]      : 1'bz;        // SPI MOSI
  assign EXP[39]      = SPI1                   ? 1'bz         : SH1_IO[11];  // GPIO Input
  assign EXP[40]      = SH1_IO[12];                                          // SPI MISO    or GPIO Input
  assign SH1_IO[13]   = EXP[44];                                             // SPI SCK     or GPIO Output
  assign SH1_IO[15]   = EXP[31];                                             // I2C SCL     or GPIO Output
  assign EXP41_int    = I2C_OE_1               ? SH1_IO[14]   : 1'bz;        // I2C SDA
  assign EXP[41]      = I2C1                   ? EXP41_int    : SH1_IO[14];  // GPIO Input  or I2C SDA
  assign SH1_IO14_int = (~EXP[41] & ~I2C_OE_1) ? 1'b0         : 1'bz;        // bidirectional
  assign SH1_IO[14]   = I2C1                   ? SH1_IO14_int : 1'bz;
  pullup (SH1_IO[14]);
// -----------------------------------------------------------------------

// ADC SPI Renaming
  assign ADC_CS      = EXP[16];
  assign EXP[17]     = ADC_DOUT; // MISO
  assign ADC_DIN     = EXP[18];  // MOSI
  assign ADC_CLK     = EXP[19];

// Blue Tooth UART Renaming
  assign BT_UART_TX  = EXP[24];
  assign EXP[23]     = BT_UART_RX;

// Blue Tooth I2C Renaming
  pullup (BT_I2C_SCL); // pullup scl line
  pullup (BT_I2C_SDA); // pullup sda line

  assign BT_I2C_SCL  = EXP[50]                 ? 1'bz       : 1'b0;
  assign EXP[51]     = BT_I2C_OE               ? BT_I2C_SDA : 1'bz;         // BT_I2C_SDA <=> EXP[51]
  assign BT_I2C_SDA  = (~EXP[51] & ~BT_I2C_OE) ? 1'b0       : 1'bz;

// Blue Tooth SPI Renaming
  assign BT_SPI_CS   = EXP[37];
  assign BT_SPI_MOSI = EXP[42];
  assign EXP[43]     = BT_SPI_MISO;
  assign BT_SPI_CLK  = EXP[49];

  SPI_EEPROM u_adc_spi_eeprom (
   .SI          (ADC_DIN),
   .SCK         (ADC_CLK),
   .CS_N        (ADC_CS),
   .WP_N        (1'b1),
   .HOLD_N      (1'b1),
   .RESET       (1'b0),
   .SO          (ADC_DOUT)
 );
// Blue Tooth UART Loopback Test
  assign BT_UART_RX  = BT_UART_TX;   // EXP[24] assigned to EXP[23]

// Blue Tooth I2C Test
  I2C_SRAM u_bt_i2c_sram(
   .power_cycle (1'b1),
   .A0          (1'b0),
   .A1          (1'b0),
   .A2          (1'b0),
   .WP          (1'b0),
   .SDA         (BT_I2C_SDA),
   .SCL         (BT_I2C_SCL),
   .SDA_OE      (BT_I2C_OE),
   .HSB_bar     (),
   .INT         ()
  );

  SPI_EEPROM u_bt_spi_eeprom (
    .SI          (BT_SPI_MOSI),
    .SCK         (BT_SPI_CLK),
    .CS_N        (BT_SPI_CS),
    .WP_N        (1'b1),
    .HOLD_N      (1'b1),
    .RESET       (1'b0),
    .SO          (BT_SPI_MISO)
 );

endmodule
