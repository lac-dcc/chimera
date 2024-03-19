(* blackbox *)
module alta_bram (
  DataInA,  DataInB,
  AddressA, AddressB,
  DataOutA, DataOutB,
  Clk0, ClkEn0, AsyncReset0,
  Clk1, ClkEn1, AsyncReset1,
  WeRenA, WeRenB,
  devclrn, devpor, devoe
);
input  [17:0]  DataInA,  DataInB;
input  [11:0] AddressA, AddressB;
output [17:0] DataOutA, DataOutB;
input  Clk0, ClkEn0, AsyncReset0;
input  Clk1, ClkEn1, AsyncReset1;
input  WeRenA, WeRenB;
input  devclrn, devpor, devoe;

////parameter coord_x  = 0;
////parameter coord_y  = 0;
////parameter coord_z  = 0;
parameter lpm_type = "alta_bram";

parameter CLKMODE         = 1'b0;
parameter PORTA_WIDTH     = 4'b0000;
parameter PORTB_WIDTH     = 4'b0000;
parameter PORTA_WRITEMODE = 1'b0;
parameter PORTB_WRITEMODE = 1'b0;
parameter PORTA_WRITETHRU = 1'b0;
parameter PORTB_WRITETHRU = 1'b0;
parameter PORTA_OUTREG    = 1'b0;
parameter PORTB_OUTREG    = 1'b0;
parameter PORTB_READONLY  = 1'b0;
parameter INIT_VAL        = 4608'b0;
parameter Clk0CFG         = 2'b0;
parameter Clk1CFG         = 2'b0;

endmodule
