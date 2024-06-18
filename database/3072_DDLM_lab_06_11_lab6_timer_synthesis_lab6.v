// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module de10_lite
(
 input        CLOCK_50,
 input [0:0]  KEY0,
 output [7:0] HEX3,
 output [7:0] HEX2,
 output [7:0] HEX1,
 output [7:0] HEX0
);

  wire [7:0]  sec_bin;
  wire [7:0]  sec_dec;
  wire [7:0]  min_bin;
  wire [7:0]  min_dec;
  
  
  timer #(.ref_clock(50000000))
  my_clock
    (
     .clk     ( CLOCK_50  ),
     .rst_n   ( KEY0    ),
     .seconds ( sec_bin   ),
     .minuts  ( min_bin   )
    );

  // Conversion time to decimal system
  bin2bcd 
    #( .IN_WIDTH (8),
       .DIGITS    (2)
     )
  sec_inst
    (
     .bin(sec_bin),
     .bcd(sec_dec)
     );

  bin2bcd 
    #( .IN_WIDTH (8),
       .DIGITS    (2)
     )
  min_inst
    (
     .bin(min_bin),
     .bcd(min_dec)
     );
  
  // Time on 7segment display
  led7 #(.COUNT(2)) sec_led
    (
     .data ( sec_dec     ),
     .leds ( {HEX1,HEX0} )
    );
  
  led7 #(.COUNT(2)) min_led
    (
     .data ( min_dec     ),
     .leds ( {HEX3,HEX2} )
    );
  
endmodule // de10_lite
