module top
#(parameter param10 = (((^~(((8'hb0) ? (8'hb1) : (8'haf)) ? ((8'h9f) >= (7'h41)) : ((8'h9c) != (8'hae)))) ? (&(((8'ha1) ? (8'hb7) : (8'h9f)) ? (^(8'ha3)) : ((7'h42) ? (8'hb6) : (8'hbd)))) : {(((8'ha8) >= (8'ha8)) ? (~&(8'hab)) : ((8'ha9) == (8'h9f)))}) ? (~^((|{(8'hbd)}) - (~&{(8'hb9)}))) : (+((((8'ha7) | (8'haa)) ? {(8'hb9)} : (!(8'haf))) ? {(8'had), {(7'h43), (8'ha8)}} : (8'hbc)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire9, wire8, wire4, reg7, reg6, reg5, (1'h0)};
  assign wire4 = ($unsigned($signed($unsigned((&wire3)))) ?
                     (8'hb0) : $signed(((~wire3) || ($unsigned(wire2) >> (wire2 - wire1)))));
  always
    @(posedge clk) begin
      reg5 <= ((~|wire0[(4'hc):(4'hc)]) ~^ ((+$signed($signed(wire0))) ?
          (((^~(8'hb5)) + ((8'hbd) ? wire3 : wire4)) ?
              $signed((wire3 << (8'hb0))) : wire4) : $signed(((+wire0) < (8'haa)))));
      reg6 <= $signed((wire0[(2'h2):(2'h2)] >>> (~{$signed(wire3)})));
      reg7 <= {(&reg6)};
    end
  assign wire8 = ((reg6[(2'h2):(1'h0)] ?
                     wire1 : (wire3 <<< $signed(wire1))) == ($signed(reg6) >= $signed(wire1)));
  assign wire9 = (!({reg5[(2'h2):(2'h2)]} || $unsigned((&{wire0}))));
endmodule
