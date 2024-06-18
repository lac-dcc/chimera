// This program was cloned from: https://github.com/Fe1LDr/Grinch
// License: MIT License

module accel (
  //-------------------- CLOCK        ----------------//
    input             clk               ,  // 25 MHz, phase   0 degrees
    input             spi_clk           ,  //  2 MHz, phase   0 degrees
    input             spi_clk_out       ,  //  2 MHz, phase 270 degrees
  //-------------------- ARSTn        ----------------//
    input             arst_n            ,
  //-------------------- Coordinates  ----------------//
    output  [15:0]    accel_data_x      ,
    output  [15:0]    accel_data_y      ,
    output            accel_data_update ,
  //-------------------- Accelerometer ports ---------//
    output            GSENSOR_CS_N      ,
    input   [ 2:1]    GSENSOR_INT       ,
    output            GSENSOR_SCLK      ,
    inout             GSENSOR_SDI       ,
    inout             GSENSOR_SDO
);

  localparam SPI_CLK_FREQ  = 200;  // SPI Clock (Hz)
  localparam UPDATE_FREQ   = 1;    // Sampling frequency (Hz)

  //---- Instantiation of the spi_control module which provides the logic to interface to the accelerometer ----//
    spi_control #(     // parameters
      .SPI_CLK_FREQ   ( SPI_CLK_FREQ      ),
      .UPDATE_FREQ    ( UPDATE_FREQ       )
    ) spi_ctrl (      // port connections
      .reset_n        ( arst_n            ),
      .clk            ( clk               ),
      .spi_clk        ( spi_clk           ),
      .spi_clk_out    ( spi_clk_out       ),
      .data_update    ( accel_data_update ),
      .data_x         ( accel_data_x      ),
      .data_y         ( accel_data_y      ),
      .SPI_SDI        ( GSENSOR_SDI       ),
      .SPI_SDO        ( GSENSOR_SDO       ),
      .SPI_CSN        ( GSENSOR_CS_N      ),
      .SPI_CLK        ( GSENSOR_SCLK      ),
      .interrupt      ( GSENSOR_INT       )
    );

endmodule