module top
#(parameter param11 = (~|(^(~|(^((7'h43) || (8'ha0)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ($signed(({$unsigned(wire3)} <= wire3)) & $unsigned($unsigned($signed((|wire0)))));
  assign wire6 = wire2[(4'h9):(3'h6)];
  assign wire7 = wire3[(1'h0):(1'h0)];
  assign wire8 = (^~((~wire6[(4'h8):(1'h0)]) ? wire5[(3'h6):(3'h6)] : wire7));
  assign wire9 = wire3[(2'h2):(1'h1)];
  assign wire10 = $unsigned(((wire9 ? wire3[(1'h0):(1'h0)] : wire4) ?
                      wire2 : wire7[(1'h0):(1'h0)]));
endmodule
