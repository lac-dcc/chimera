//------------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2014-2017 ARM Limited or its affiliates.
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
//-----------------------------------------------------------------------------

module arduino_shield (
  input  wire        UART,
  input  wire        I2C,
  input  wire        SPI,
  inout  wire [15:0] SH_IO,
  output wire        I2C_OE
  );

    wire [15:0] gpio;

    wire uart_rx;
    wire uart_tx;

    wire i2c_scl;
    wire i2c_sda;
    wire i2c_scl_int;
    wire i2c_sda_int;
    wire i2c_oe_int;

    wire spi_sck;
    wire spi_ss;
    wire spi_mosi;
    wire spi_miso;

    wire sh_io_int14;
    // Intentionally unused signals
    wire   unused;


//---------------------UART / GPIO Mux---------------------------------------------
    assign SH_IO[0] = UART ? uart_rx  : gpio[0];
    assign uart_tx  = UART ? SH_IO[1] : 1'bz;


//---------------------------------------------------------------------------------

//---------------------I2C / GPIO Mux----------------------------------------------
    pullup (i2c_scl); // pullup scl line
    pullup (i2c_sda); // pullup sda line

    assign i2c_scl_int = I2C         ? SH_IO[15] : 1'bz;
    assign i2c_scl     = i2c_scl_int ? 1'bz      : 1'b0;

    assign sh_io_int14 = I2C_OE                     ? i2c_sda     : 1'bz;   // I2C_SDA <=> SH_IO[14]
    assign SH_IO[14]   = I2C                        ? sh_io_int14 : gpio[14];
    assign i2c_sda_int = (~SH_IO[14] & ~i2c_oe_int) ? 1'b0        : 1'bz;
    assign i2c_sda     = I2C                        ? i2c_sda_int : 1'bz;

    assign I2C_OE = I2C ? i2c_oe_int : 1'bz;

  I2C_SRAM u_i2c_sram (
   .power_cycle (1'b1),
   .A0          (1'b0),
   .A1          (1'b0),
   .A2          (1'b0),
   .WP          (1'b0),
   .SDA         (i2c_sda),
   .SCL         (i2c_scl),
   .SDA_OE      (i2c_oe_int),
   .HSB_bar     (),
   .INT         ()
  );

//---------------------------------------------------------------------------------

//---------------------SPI / GPIO Mux----------------------------------------------

    assign spi_sck   = SPI ? SH_IO[13] : 1'bz;
    assign spi_ss    = SPI ? SH_IO[10] : 1'bz;
    assign spi_mosi  = SPI ? SH_IO[11] : 1'bz;
    assign SH_IO[12] = SPI ? spi_miso  : gpio[12];
    assign gpio[13]  = SPI ? 1'bz      : SH_IO[13];
    assign gpio[10]  = SPI ? 1'bz      : SH_IO[10];
    assign SH_IO[11] = SPI ? 1'bz      : gpio[11];

   SPI_EEPROM u_spi_eeprom (
     .SI          (spi_mosi),
     .SCK         (spi_sck),
     .CS_N        (spi_ss),
     .WP_N        (1'b1),
     .HOLD_N      (1'b1),
     .RESET       (1'b0),
     .SO          (spi_miso)
  );

//---------------------------------------------------------------------------------

  assign unused = |{gpio[10],
                    gpio[13],
                    uart_tx
                    };


endmodule
