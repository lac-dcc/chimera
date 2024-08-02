// This program was cloned from: https://github.com/Mr-Kaushal-22/WS2812_Interfacing
// License: MIT License


// Efinity Top-level template
// Version: 2023.2.307
// Date: 2024-04-30 12:40

// Copyright (C) 2013 - 2023 Efinix Inc. All rights reserved.

// This file may be used as a starting point for Efinity synthesis top-level target.
// The port list here matches what is expected by Efinity constraint files generated
// by the Efinity Interface Designer.

// To use this:
//     #1)  Save this file with a different name to a different directory, where source files are kept.
//              Example: you may wish to save as /home/kaush/Desktop/Efinity/WS2812_Protocol/WS2812_Protocol.v
//     #2)  Add the newly saved file into Efinity project as design file
//     #3)  Edit the top level entity in Efinity project to:  WS2812_Protocol
//     #4)  Insert design content.


module WS2812_Protocol
(
  input i_rx_serial,
  input pll_clk,
  input clk,
  output data,
  output led
);


endmodule

