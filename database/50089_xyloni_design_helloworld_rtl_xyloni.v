// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License


// Efinity Top-level template
// Version: 2020.1.140
// Date: 2020-07-24 21:04

// Copyright (C) 2017 - 2020 Efinix Inc. All rights reserved.

// This file may be used as a starting point for Efinity synthesis top-level target.
// The port list here matches what is expected by Efinity constraint files generated
// by the Efinity Interface Designer.

// To use this:
//     #1)  Save this file with a different name to a different directory, where source files are kept.
//              Example: you may wish to save as /home/alfredw_local/github/xyloni/design/helloworld/efinity/xyloni.v
//     #2)  Add the newly saved file into Efinity project as design file
//     #3)  Edit the top level entity in Efinity project to:  xyloni
//     #4)  Insert design content.


module xyloni
(
  input BTN1,
  input BTN2_J2_7,
  input [14:0] GPIO_J1_IN,
  input [13:0] GPIO_J2_IN,
  input [8:0] GPIO_J3_IN,
  input RXD,
  input SD_DI,
  input SPI_MISO,
  input i_sysclk,
  input i_pll_locked,
  output [14:0] GPIO_J1_OUT,
  output [14:0] GPIO_J1_OE,
  output [13:0] GPIO_J2_OUT,
  output [13:0] GPIO_J2_OE,
  output [8:0] GPIO_J3_OUT,
  output [8:0] GPIO_J3_OE,
  output LED1,
  output LED2,
  output LED3_J2_6,
  output LED4_J2_5,
  output SD_CS,
  output SD_DO,
  output SD_SCLK,
  output SPI_MOSI,
  output SPI_SCLK,
  output SPI_SS,
  output TXD
);


endmodule

