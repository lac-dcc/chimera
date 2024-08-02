// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module de10_lite
(
 input        CLOCK_50,
 input [0:0]  KEY,
 output [7:0] HEX1,
 output [7:0] HEX0,
 inout [35:0] GPIO
);
  localparam width=8;
  
  wire             key_rst;
  wire             trig_pin;
  wire             echo_pin;
  wire [width-1:0] distance;
  
 
  assign key_rst  = KEY[0];
  assign GPIO[35] = trig_pin;
  assign echo_pin = GPIO[33];
  
  hcsr04
   #(
     .clk_freq ( 50000000 ),
     .width    ( width    )
    )
  hc
    (
     .clk      ( CLOCK_50 ),
     .rst_n    ( key_rst  ),
     .echo     ( echo_pin ),
     .trig     ( trig_pin ),
     .distance ( distance )
    );
    
  led7 #(.COUNT(2)) seg7
    (
     .data ( distance    ),
     .leds ( {HEX1,HEX0} )
    );
  
  
endmodule // de10_lite

  
