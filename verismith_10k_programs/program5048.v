module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  assign y = {wire9, wire7, wire6, wire5, reg8, (1'h0)};
  assign wire5 = {wire3[(2'h2):(1'h0)],
                     (wire3[(2'h3):(2'h3)] ?
                         ($unsigned($unsigned(wire2)) ?
                             wire4[(1'h1):(1'h0)] : (wire4[(1'h1):(1'h0)] + wire4)) : $signed(wire4))};
  assign wire6 = ({$signed(((~|wire2) > (wire3 ? wire5 : wire5))),
                         (~&(^wire2[(1'h1):(1'h1)]))} ?
                     (wire4 ?
                         (&wire4[(1'h1):(1'h0)]) : (((wire1 ?
                             wire2 : (7'h43)) - $unsigned((8'ha0))) ^~ $signed(wire4))) : ($signed((-(wire4 ?
                         wire1 : wire1))) >>> ($unsigned({wire4}) | wire0[(4'hb):(4'ha)])));
  assign wire7 = $signed({{(^~(-wire2)), ((-wire1) | wire3)},
                     (~|wire4[(3'h4):(1'h0)])});
  always
    @(posedge clk) begin
      reg8 <= {wire5, $unsigned((~&(~&(^wire5))))};
    end
  assign wire9 = (reg8 ?
                     (^$unsigned((~&(~(8'ha5))))) : ((^$unsigned(wire7)) ?
                         (~^$signed({wire7,
                             wire2})) : $signed(wire4[(1'h1):(1'h1)])));
endmodule
