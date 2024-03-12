module RCOSC_1MHZ ( 
  CLKOUT );

/* synthesis syn_black_box */
/* synthesis syn_noprune=1 */

output CLKOUT;

endmodule

module RCOSC_25_50MHZ ( 
  CLKOUT );

/* synthesis syn_black_box */
/* synthesis syn_noprune=1 */

output CLKOUT;

parameter FREQUENCY = 50.0;

endmodule

module XTLOSC ( 
  CLKOUT,
  XTL );

/* synthesis syn_black_box */
/* synthesis syn_noprune=1 */
/* synthesis black_box_pad_pin ="XTL" */

output CLKOUT;
input XTL;

parameter MODE = 'h3;
parameter FREQUENCY = 20.0;

endmodule

module RCOSC_1MHZ_FAB ( 
  CLKOUT,
  A );

/* synthesis syn_black_box */
/* synthesis syn_noprune=1 */

output CLKOUT;
input A;

endmodule

module RCOSC_25_50MHZ_FAB ( 
  CLKOUT,
  A );

/* synthesis syn_black_box */
/* synthesis syn_noprune=1 */

output CLKOUT;
input A;

endmodule

module XTLOSC_FAB ( 
  CLKOUT,
  A );

/* synthesis syn_black_box */
/* synthesis syn_noprune=1 */

output CLKOUT;
input A;

endmodule
