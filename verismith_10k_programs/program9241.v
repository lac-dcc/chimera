module top
#(parameter param13 = (^{((((8'ha8) == (8'hbe)) ? (8'h9f) : ((7'h42) ? (8'hb9) : (8'ha0))) ? (((8'ha7) ? (8'haa) : (8'hbc)) >> ((7'h44) ? (8'hb7) : (8'ha4))) : (~^(!(8'ha6)))), (-({(8'ha7)} * ((8'ha9) ? (8'hb5) : (7'h43))))}), 
parameter param14 = {{((&(8'h9d)) - ((param13 ? param13 : param13) ? param13 : (param13 ? param13 : (8'ha5))))}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = {$unsigned((((wire2 < wire1) < wire1) ?
                         $signed($signed(wire0)) : ($unsigned(wire1) ?
                             (wire1 >= wire2) : (wire3 && wire3)))),
                     (+(~&wire0[(3'h4):(3'h4)]))};
  assign wire5 = wire1;
  assign wire6 = $unsigned(wire3[(1'h0):(1'h0)]);
  assign wire7 = ($unsigned((((wire0 | wire1) ?
                     $signed(wire6) : wire5) | $signed((wire4 <= wire6)))) <= (~&$unsigned(((7'h40) ^ wire6))));
  always
    @(posedge clk) begin
      reg8 <= ($signed(($signed(wire5[(2'h3):(1'h0)]) || ($signed(wire7) ?
              (~wire3) : (^~wire1)))) ?
          $signed((~|{(wire6 ? (8'haf) : wire2),
              wire1[(3'h5):(3'h4)]})) : $signed({wire6[(4'ha):(1'h1)]}));
      reg9 <= $unsigned((8'ha7));
      reg10 <= $unsigned(wire3[(2'h2):(1'h1)]);
      reg11 <= $unsigned($unsigned($unsigned({(~^wire0)})));
      reg12 <= wire3;
    end
endmodule
