module top
#(parameter param28 = (~^(((8'ha7) ^ (((8'ha7) ? (7'h41) : (8'ha7)) >> ((8'hbc) ? (8'hba) : (8'hbb)))) || (-((&(8'ha3)) ? ((8'hb9) < (8'hb7)) : ((8'ha7) ? (8'h9d) : (8'hb1)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire4 = ((~^{(8'hb2)}) ?
                     {wire2[(2'h3):(2'h2)],
                         wire0} : $unsigned($unsigned($unsigned((+(8'hbd))))));
  assign wire5 = wire4[(3'h4):(3'h4)];
  assign wire6 = {wire5[(4'h9):(2'h2)], $signed($unsigned($signed(wire1)))};
  assign wire7 = {$signed($unsigned(wire2[(4'h9):(1'h0)])),
                     wire5[(4'hd):(4'h9)]};
  assign wire8 = ((^~(wire1 || $unsigned({wire3,
                     wire0}))) >> wire0[(2'h2):(2'h2)]);
  assign wire9 = {{wire5, (~^wire1[(4'hc):(4'hb)])}};
  assign wire10 = wire8;
  assign wire11 = (^~((|$unsigned($signed(wire8))) ?
                      (^~wire2) : $signed($signed($unsigned(wire2)))));
  assign wire12 = (~$unsigned(wire6[(2'h2):(2'h2)]));
  assign wire13 = (wire7 ?
                      $unsigned($signed(((|wire11) ?
                          (+wire5) : wire0))) : $unsigned(($unsigned((^wire8)) ?
                          $signed((wire0 ^ wire6)) : $signed($signed(wire7)))));
  assign wire14 = wire2;
  assign wire15 = $unsigned(wire2);
  assign wire16 = (~wire7[(2'h3):(2'h3)]);
  assign wire17 = {{{(wire16[(5'h10):(4'hd)] ?
                                  wire16[(4'hd):(4'h9)] : $unsigned(wire12))},
                          wire9[(4'ha):(2'h2)]},
                      wire14};
  assign wire18 = $unsigned((&(wire3 <= {(^wire10)})));
  always
    @(posedge clk) begin
      reg19 <= $unsigned(wire16[(4'hd):(4'h8)]);
      reg20 <= (~^{$signed(((^wire17) ? $unsigned(wire4) : {wire17})), wire0});
    end
  assign wire21 = $signed((wire13[(3'h4):(3'h4)] ?
                      ($unsigned($signed(wire2)) ?
                          ((-reg20) - wire0[(1'h0):(1'h0)]) : (^reg19)) : ($signed($signed(reg19)) | {(|(8'hbe)),
                          (wire0 ? wire16 : wire2)})));
  assign wire22 = {$unsigned(((wire21[(4'hc):(1'h1)] - reg19[(3'h6):(1'h1)]) ?
                          wire18[(2'h2):(2'h2)] : (-wire7)))};
  assign wire23 = $unsigned($unsigned(wire7[(3'h7):(2'h2)]));
  assign wire24 = (!($signed(wire2) ? (~$signed({wire11})) : (+reg19)));
  assign wire25 = (~&wire3);
  assign wire26 = wire24[(2'h3):(2'h2)];
  assign wire27 = reg20;
endmodule
