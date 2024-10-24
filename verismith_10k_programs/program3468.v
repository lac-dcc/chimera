module top
#(parameter param23 = (&(((+((8'hb7) ? (8'hab) : (8'hb2))) & (|((8'ha4) < (8'h9d)))) & (((^~(7'h43)) ? (-(8'h9d)) : ((8'haa) ? (8'hb1) : (8'haa))) > (((7'h42) ? (8'ha5) : (8'hac)) >= {(7'h40)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire14,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire4,
                 reg16,
                 reg15,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg5,
                 (1'h0)};
  assign wire4 = (~&wire2[(4'ha):(3'h4)]);
  always
    @(posedge clk) begin
      reg5 <= (+(($signed(wire0) ?
              ($unsigned(wire1) ?
                  (+wire1) : $unsigned(wire4)) : $signed((wire0 + wire2))) ?
          wire1 : {wire3[(1'h1):(1'h1)], (^~(8'hb1))}));
    end
  assign wire6 = wire0[(1'h0):(1'h0)];
  assign wire7 = ($unsigned(($unsigned(wire4[(4'hf):(4'ha)]) ?
                     wire0 : ($signed(wire0) ?
                         {wire0, reg5} : (wire3 < wire4)))) <= (8'h9e));
  assign wire8 = $signed((wire4 ^~ ($unsigned(wire2) ?
                     $signed((wire2 ?
                         reg5 : wire0)) : ((wire7 < wire0) * wire7))));
  assign wire9 = {$signed((~^wire6[(4'ha):(4'ha)])), wire2};
  always
    @(posedge clk) begin
      reg10 <= $unsigned((-wire1));
      reg11 <= ((($unsigned($unsigned(wire0)) ? (8'hb3) : (8'hb2)) ?
          ({reg5[(4'h8):(4'h8)]} > $unsigned($unsigned(wire1))) : (wire1 ?
              {wire9[(4'he):(4'hd)],
                  {(8'ha2), wire1}} : wire4)) && {{((&reg5) ^ (wire4 ?
                  (8'hbc) : wire9))}});
      reg12 <= {((8'ha2) ?
              $unsigned({(reg11 ? (8'hbb) : wire9),
                  $unsigned(reg10)}) : wire6)};
      reg13 <= ((^~reg5) < $signed((wire1 ?
          {(wire9 << wire3), $signed(wire9)} : reg5)));
    end
  assign wire14 = ($unsigned($signed(reg13[(2'h2):(1'h1)])) - $unsigned(reg5));
  always
    @(posedge clk) begin
      reg15 <= wire3;
      reg16 <= $signed($unsigned((($unsigned(reg5) ?
              {reg15} : $unsigned(wire7)) ?
          {$unsigned((8'ha6))} : $unsigned($signed(reg15)))));
    end
  assign wire17 = reg16[(5'h11):(4'ha)];
  assign wire18 = (~$signed({($unsigned(reg12) > $signed(wire4))}));
  assign wire19 = $unsigned({(wire17[(3'h5):(3'h4)] ?
                          ($unsigned(wire1) >= wire2[(4'hc):(3'h6)]) : $signed({reg5})),
                      $unsigned(reg10[(3'h5):(1'h1)])});
  assign wire20 = (reg12 ^~ ((~(8'hb9)) ? (8'hbb) : $signed(wire1)));
  assign wire21 = ($unsigned({((wire3 ? wire3 : wire19) >= $unsigned(wire7)),
                          wire8[(1'h1):(1'h0)]}) ?
                      (~&(($signed(wire18) ?
                              (wire9 >>> (7'h40)) : (~|(8'hb3))) ?
                          $signed($signed(reg12)) : (|(wire1 ?
                              reg13 : wire7)))) : $signed((~|$unsigned((wire2 ?
                          wire7 : (8'hb2))))));
  assign wire22 = reg11[(2'h3):(1'h0)];
endmodule
