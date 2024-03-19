`timescale 1ns/1ps
module ramz(
   input clka,
   input clkb,

   input [6:0] addra,
   input [6:0] addrb,

   output [31:0] douta,
   output [31:0] doutb,

   input wea,
   input [31:0] dina
);


alta_bram ram_inst (
  .DataInA(dina), 
  .AddressA(addra), .AddressB(addrb),
  .DataOutA(douta), .DataOutB(doutb),
  .Clk0(clka), .ClkEn0(1'b1), .AsyncReset0(1'b0),
  .Clk1(clkb), .ClkEn1(1'b1), .AsyncReset1(1'b0),
  .WeRenA(wea), .WeRenB(1'b0)
);

defparam ram_inst.PORTA_WIDTH     = 32;
defparam ram_inst.PORTB_WIDTH     = 32;
defparam ram_inst.CLKMODE         = "read_write";
defparam ram_inst.PORTB_READONLY  = 1'b1;
defparam ram_inst.PORTA_OUTREG    = 1'b0;
defparam ram_inst.PORTB_OUTREG    = 1'b0;
defparam ram_inst.PORTA_WRITEMODE = 1'b0;
defparam ram_inst.PORTB_WRITEMODE = 1'b0;
defparam ram_inst.PORTA_WRITETHRU = 1'b0;
defparam ram_inst.PORTB_WRITETHRU = 1'b0;
defparam ram_inst.INIT_VAL        = 4608'b0;

endmodule
