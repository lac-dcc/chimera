module top
#(parameter param23 = (~^(((((8'h9d) + (8'hac)) << (|(8'hb2))) ? {((8'ha5) | (8'h9c)), {(7'h42)}} : (-((8'hb5) ? (7'h43) : (8'ha5)))) ? (({(7'h44), (8'hb6)} ? {(8'haf)} : (~|(7'h44))) == {(8'hb8)}) : ((((8'hb8) ? (8'hbd) : (8'ha4)) && ((8'hba) ? (8'ha0) : (8'h9e))) ? ((~(8'h9f)) <= ((8'hbd) >> (8'ha8))) : (~^{(8'hb1)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire15,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire4 = (wire2[(2'h3):(1'h1)] ?
                     $unsigned(((wire3 ?
                             (wire3 ? wire2 : wire3) : $unsigned(wire3)) ?
                         (&(wire3 ^ wire0)) : $unsigned(wire1[(1'h1):(1'h1)]))) : (($signed((wire3 ^ wire3)) ?
                             ((wire1 ?
                                 wire0 : wire2) >> $unsigned(wire3)) : (wire2[(3'h4):(2'h2)] ?
                                 $unsigned(wire2) : wire1[(3'h5):(3'h4)])) ?
                         ($unsigned((^wire2)) ?
                             wire1 : $signed(wire3)) : $unsigned((^(&(8'hb7))))));
  assign wire5 = (wire0[(4'h8):(2'h2)] ?
                     $signed(wire3[(3'h6):(2'h2)]) : (wire2 ?
                         ((^(wire0 > wire2)) ?
                             (-(wire2 ^~ wire4)) : $signed((~&wire4))) : ($signed($unsigned(wire1)) ?
                             {$unsigned(wire1)} : $unsigned($signed(wire4)))));
  assign wire6 = wire5[(2'h2):(1'h1)];
  assign wire7 = (!(^$signed($unsigned((wire3 == wire1)))));
  assign wire8 = (~^wire3);
  assign wire9 = wire1[(1'h1):(1'h0)];
  assign wire10 = (wire4 << $unsigned(wire6));
  assign wire11 = $unsigned({((wire3[(3'h5):(2'h3)] * (wire5 ?
                          wire1 : (8'hb4))) >> wire9[(1'h1):(1'h1)])});
  assign wire12 = $signed(wire4);
  always
    @(posedge clk) begin
      reg13 <= {$unsigned(($unsigned($unsigned((8'hbe))) < ($unsigned(wire4) ?
              $unsigned((8'had)) : (^~wire4)))),
          ((($unsigned(wire5) >>> $unsigned(wire2)) ?
                  wire10[(3'h4):(2'h3)] : ((wire8 ? wire6 : wire1) ?
                      (wire1 ? wire4 : wire11) : wire5[(1'h1):(1'h1)])) ?
              $unsigned(((~&wire7) >>> $signed(wire4))) : wire10[(4'hc):(3'h4)])};
      reg14 <= (~^$signed({(&(~wire8)), wire9[(1'h0):(1'h0)]}));
    end
  assign wire15 = $signed($unsigned(({(!wire0), $signed(reg13)} ?
                      ($signed((8'ha9)) ? {reg14} : $unsigned(wire8)) : (wire4 ?
                          wire4[(4'hc):(3'h6)] : {wire9}))));
  always
    @(posedge clk) begin
      reg16 <= wire2;
      reg17 <= (+($unsigned(wire9[(2'h3):(2'h2)]) ?
          (wire8[(1'h1):(1'h0)] & (~&$signed(wire8))) : {($unsigned(wire0) ?
                  $signed((8'h9e)) : $signed((8'ha2)))}));
      reg18 <= (+(wire5 << wire0[(4'he):(3'h6)]));
      reg19 <= $signed(((!((wire6 == reg16) ^ (!(8'hb5)))) ?
          (!wire4[(4'hf):(3'h6)]) : (~|((~|wire15) ? reg16 : $signed(wire3)))));
    end
  assign wire20 = {(({wire15[(3'h4):(1'h1)]} ?
                              ((wire4 != reg19) ?
                                  $unsigned(reg17) : {reg13}) : ($signed(wire2) & reg13)) ?
                          (reg14[(3'h4):(1'h0)] ?
                              $signed((~^reg19)) : $unsigned($unsigned(wire6))) : wire2),
                      ($unsigned($unsigned((~wire7))) ?
                          ({(reg14 && wire6),
                              (~reg19)} << $unsigned((^wire3))) : ((reg16[(4'h9):(1'h1)] ?
                              $signed((8'hbd)) : (~&wire11)) < {{wire12},
                              {wire12}}))};
  assign wire21 = (~&$unsigned((~&(&(wire0 || wire8)))));
  assign wire22 = (reg14 + ($unsigned((((8'hb4) - reg14) && (!reg18))) ?
                      (!($unsigned(wire11) == (~^wire8))) : $unsigned({$signed(wire1)})));
endmodule
