module RCOSC_1MHZ ( 
  CLKOUT );

/* synthesis black_box */

output CLKOUT;

endmodule

module RCOSC_25_50MHZ ( 
  CLKOUT );

/* synthesis black_box */

output CLKOUT;

parameter FREQUENCY = 50.0;

endmodule

module XTLOSC ( 
  CLKOUT,
  XTL );

/* synthesis black_box */
/* synthesis black_box black_box_pad ="XTL" */

output CLKOUT;
input XTL;

parameter MODE = 'h3;
parameter FREQUENCY = 20.0;

endmodule

module RCOSC_1MHZ_FAB ( 
  CLKOUT,
  A );

/* synthesis black_box */

output CLKOUT;
input A;

endmodule

module RCOSC_25_50MHZ_FAB ( 
  CLKOUT,
  A );

/* synthesis black_box */

output CLKOUT;
input A;

endmodule

module XTLOSC_FAB ( 
  CLKOUT,
  A );

/* synthesis black_box */

output CLKOUT;
input A;

endmodule
