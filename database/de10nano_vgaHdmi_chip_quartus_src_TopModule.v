// This program was cloned from: https://github.com/nhasbun/de10nano_vgaHdmi_chip
// License: MIT License

/**
Descripcion,
Modulo top que envia las senales de comunicacion generadas por vga al chip
HDMI ADV7513, entregandole un reloj de 25MHz.

Este chip para comenzar debe iniciar una rutina de configuracion via i2c,
para mas informacion revisar el datasheet.

-----------------------------------------------------------------------------
Author : Nicolas Hasbun, nhasbun@gmail.com
File   : topModule.v
Create : 2017-06-15 23:21:31
Editor : sublime text3, tab size (2)
-----------------------------------------------------------------------------
*/

`include "vgaHdmi.v"
`include "i2c/I2C_HDMI_Config.v"

module TopModule(
  // **input**
  input clock50, reset_n,
  input switchR, switchG, switchB,

  // ********************************** //
  // ** HDMI CONNECTIONS **

  // AUDIO
  // SPDIF va desconectado
  output HDMI_I2S0,  // dont care, no se usan
  output HDMI_MCLK,  // dont care, no se usan
  output HDMI_LRCLK, // dont care, no se usan
  output HDMI_SCLK,   // dont care, no se usan

  // VIDEO
  output [23:0] HDMI_TX_D, // RGBchannel
  output HDMI_TX_VS,  // vsync
  output HDMI_TX_HS,  // hsync
  output HDMI_TX_DE,  // dataEnable
  output HDMI_TX_CLK, // vgaClock

  // REGISTERS AND CONFIG LOGIC
  // HPD viene del conector
  input HDMI_TX_INT,
  inout HDMI_I2C_SDA,  // HDMI i2c data
  output HDMI_I2C_SCL, // HDMI i2c clock
  output READY        // HDMI is ready signal from i2c module
  // ********************************** //
  );

wire clock25, locked;
wire reset;
assign reset = ~reset_n; //
// reset de placa presionado funciona con logica negativa

// señales de audio en alta impedancia
assign HDMI_I2S0  = 1'b z;
assign HDMI_MCLK  = 1'b z;
assign HDMI_LRCLK = 1'b z;
assign HDMI_SCLK  = 1'b z;

// **VGA CLOCK**
pll_25 pll_25(
  .refclk(clock50),
  .rst(reset),

  .outclk_0(clock25),
  .locked(locked)
  );

// **VGA MAIN CONTROLLER**
vgaHdmi vgaHdmi (
  // input
  .clock      (clock25),
  .clock50    (clock50),
  .reset      (~locked),
  .hsync      (HDMI_TX_HS),
  .vsync      (HDMI_TX_VS),
  .switchR    (switchR),
  .switchG    (switchG),
  .switchB    (switchB),

  // output
  .dataEnable (HDMI_TX_DE),
  .vgaClock   (HDMI_TX_CLK),
  .RGBchannel (HDMI_TX_D)
);

// **I2C Interface for ADV7513 initial config**
I2C_HDMI_Config #(
  .CLK_Freq (50000000), // trabajamos con reloj de 50MHz
  .I2C_Freq (20000)    // reloj de 20kHz for i2c clock
  )

  I2C_HDMI_Config (
  .iCLK        (clock50),
  .iRST_N      (reset_n),
  .I2C_SCLK    (HDMI_I2C_SCL),
  .I2C_SDAT    (HDMI_I2C_SDA),
  .HDMI_TX_INT (HDMI_TX_INT),
  .READY       (READY)
);

endmodule