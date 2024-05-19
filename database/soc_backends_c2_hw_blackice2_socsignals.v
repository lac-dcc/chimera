// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License


      // RS232
      input RX,
      output TX,
      
      // 4 LEDS
      output LED1,
      output LED2,
      output LED3,
      output LED4,
      
      // SRAM:
      output [17:0] ADR,
      inout  [15:0] DAT,
      output RAMOE_b,
      output RAMWE_b,
      output RAMCS_b,
      output RAMUB_b,
      output RAMLB_b,
      
      // VGA:
      output [3:0]  red,
      output [3:0]  green,
      output [3:0]  blue,
      output        hsync,
      output        vsync,


