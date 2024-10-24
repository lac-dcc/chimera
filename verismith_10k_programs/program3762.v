module top
#(parameter param75 = ((&(~&{{(8'hac)}})) ^ (((8'ha6) && (((8'haa) && (8'haf)) ? {(7'h42), (8'ha3)} : (+(7'h41)))) && (((~(8'hbb)) ? ((8'ha9) >>> (8'hb8)) : ((8'hb2) ? (8'ha5) : (8'haf))) ~^ (((8'ha8) ? (8'hb3) : (8'hb7)) ? (-(8'h9d)) : ((8'hab) >> (8'hab)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire73;
  assign y = {wire4, wire5, wire6, wire73, (1'h0)};
  assign wire4 = $signed(($unsigned((((8'hb6) ?
                         wire0 : wire2) != (~^(8'hab)))) ?
                     wire1 : $signed({$signed(wire2), (8'ha9)})));
  assign wire5 = ($unsigned($unsigned({$signed(wire0)})) ?
                     wire2[(4'hf):(4'h9)] : $unsigned($unsigned(wire1)));
  assign wire6 = $signed($signed(wire5));
  module7 #() modinst74 (.wire12(wire6), .wire9(wire2), .wire8(wire3), .clk(clk), .wire10(wire5), .y(wire73), .wire11(wire1));
endmodule

module module7
#(parameter param72 = (+(8'ha5)))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(3'h6):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire65;
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  assign y = {wire71,
                 wire13,
                 wire14,
                 wire15,
                 wire19,
                 wire20,
                 wire65,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg16,
                 reg17,
                 reg18,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire13 = $unsigned(wire9);
  assign wire14 = (($unsigned(((~|wire12) > $signed(wire10))) ^ ((wire11 <<< (~&(8'hbd))) ?
                          $signed(wire8[(4'he):(4'he)]) : ((7'h42) ?
                              $signed(wire11) : $signed(wire12)))) ?
                      (|(($signed(wire11) ?
                              wire13[(3'h5):(3'h4)] : (wire11 ?
                                  wire12 : wire12)) ?
                          (((7'h44) ? (8'h9e) : wire8) ?
                              {wire10,
                                  wire10} : $unsigned(wire11)) : (^~(|(8'ha8))))) : $unsigned($unsigned($signed(wire12[(1'h1):(1'h1)]))));
  assign wire15 = ($unsigned(wire14) ?
                      $unsigned($unsigned((~|$unsigned((8'h9f))))) : (8'h9f));
  always
    @(posedge clk) begin
      reg16 <= ((|$unsigned(($unsigned(wire11) ?
          wire13 : wire13))) || $signed((({wire10} > wire11) < ($signed(wire11) == (~^wire10)))));
      reg17 <= $unsigned((wire8 ? wire10[(1'h0):(1'h0)] : $unsigned(wire8)));
      reg18 <= $signed(((reg16 ?
          ((~^wire12) ?
              $unsigned(wire11) : (reg16 ?
                  wire15 : wire11)) : wire12) << wire9));
    end
  assign wire19 = (~&($unsigned(((wire13 ? wire13 : wire8) ?
                          $unsigned(wire10) : (~wire14))) ?
                      ({(8'had),
                          ((7'h44) && wire8)} * (8'hab)) : ((wire8[(1'h1):(1'h0)] ?
                          wire15[(3'h6):(3'h5)] : wire15[(3'h7):(3'h6)]) <= {wire9[(2'h3):(2'h2)]})));
  assign wire20 = {({(wire15[(4'h8):(2'h2)] << (wire8 ?
                              reg17 : reg18))} > $signed((7'h40)))};
  always
    @(posedge clk) begin
      reg21 <= ($signed(($unsigned(wire10[(4'h9):(3'h6)]) || ((~wire11) >>> {(7'h44),
              wire13}))) ?
          (^~($unsigned(wire14[(5'h11):(4'he)]) ?
              $signed(reg18[(4'hd):(3'h4)]) : (|$unsigned(wire10)))) : (7'h43));
      reg22 <= ({($signed(reg16) - $unsigned($unsigned(wire14)))} << ($signed($unsigned((reg17 ?
          wire13 : wire20))) + (($unsigned(wire20) ?
          (reg21 + wire10) : wire15) ~^ {{(8'ha5), reg16}, {wire10}})));
      reg23 <= (^$unsigned((-$signed((~|wire12)))));
      reg24 <= wire10;
      reg25 <= $unsigned($unsigned($signed(((wire15 ? reg21 : wire12) ^ (wire8 ?
          wire13 : wire8)))));
    end
  module26 #() modinst66 (.y(wire65), .clk(clk), .wire30(reg18), .wire28(reg24), .wire29(reg22), .wire27(wire19));
  always
    @(posedge clk) begin
      reg67 <= wire65[(5'h13):(4'hc)];
      reg68 <= (~^$unsigned((~&(reg24 ^~ (wire65 ? wire8 : reg67)))));
      reg69 <= {wire10, ($signed((~^reg22[(1'h0):(1'h0)])) >= reg17)};
      reg70 <= $unsigned($unsigned((~&reg69)));
    end
  assign wire71 = (!wire10[(4'hc):(3'h6)]);
endmodule

module module26
#(parameter param64 = {{{{((8'hac) ? (8'haa) : (8'ha7))}}}, (-((8'hb6) ? (~|(|(8'hbf))) : (((8'hb1) ? (8'hb2) : (8'hb0)) <= ((8'hba) * (8'hae)))))})
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire30;
  input wire [(3'h6):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  input wire signed [(4'hd):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire41,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire31 = wire29[(1'h1):(1'h0)];
  assign wire32 = $signed(wire28);
  assign wire33 = wire28;
  assign wire34 = (+(+(&wire29[(3'h4):(1'h0)])));
  assign wire35 = wire27;
  assign wire36 = $signed((8'had));
  assign wire37 = $signed((((~((8'hba) ? wire31 : (8'hb2))) ?
                      $signed($unsigned(wire35)) : ($unsigned(wire34) ?
                          $signed(wire27) : (wire29 ?
                              wire36 : wire30))) ^ (((wire33 == wire32) ?
                          wire31[(3'h4):(1'h0)] : (wire29 ^ wire28)) ?
                      wire32[(2'h3):(2'h3)] : (+$signed(wire35)))));
  always
    @(posedge clk) begin
      reg38 <= $unsigned((wire28[(3'h7):(3'h4)] == $unsigned((8'hb7))));
      reg39 <= ((8'hb4) && $signed(wire37));
      reg40 <= (reg39 < (^$unsigned(wire35)));
    end
  assign wire41 = $unsigned(((!{reg40[(4'h9):(2'h2)]}) << $signed((~^wire29))));
  always
    @(posedge clk) begin
      if ((~&$unsigned(($unsigned((~reg38)) ?
          (wire36 ?
              (wire32 ?
                  (8'hb8) : (8'hbf)) : (~&wire30)) : (|wire33[(1'h1):(1'h1)])))))
        begin
          if ((reg38 ?
              ($signed((~(wire37 ?
                  wire41 : wire36))) > (^~$unsigned(wire35[(1'h0):(1'h0)]))) : $signed(((~&(&wire28)) & reg38[(2'h2):(1'h0)]))))
            begin
              reg42 <= reg38;
              reg43 <= ((|$signed(($unsigned((8'ha1)) ?
                  ((8'hbd) ?
                      wire31 : wire35) : $unsigned(wire31)))) ^~ (({(reg42 ~^ wire28)} ?
                  (^(reg39 <<< (8'hb6))) : ($signed(wire33) ?
                      wire29[(1'h1):(1'h1)] : {wire29})) * ($unsigned(wire31) >= (wire31[(4'hf):(3'h6)] & reg39[(4'hc):(2'h3)]))));
              reg44 <= (|(~&($unsigned((wire34 >= reg42)) || (wire37[(4'hc):(4'hb)] * (8'hb6)))));
              reg45 <= $unsigned((8'hb9));
              reg46 <= $signed(({$unsigned(wire37),
                  {$unsigned(wire41), (~&reg44)}} ^ (({wire33, wire33} ?
                      $unsigned((8'h9f)) : (!wire37)) ?
                  $signed(wire27[(4'ha):(4'h9)]) : (^~$signed(reg43)))));
            end
          else
            begin
              reg42 <= reg42;
              reg43 <= $unsigned($unsigned($unsigned($unsigned(((8'hbe) ?
                  (8'hb4) : wire27)))));
              reg44 <= ((8'ha1) || $unsigned(wire28[(4'hc):(4'hb)]));
              reg45 <= reg42;
            end
          reg47 <= (wire41 + ($unsigned($signed(wire41)) != ($unsigned(reg46) ?
              (^~$signed(reg44)) : (^(^~reg42)))));
        end
      else
        begin
          reg42 <= $unsigned($unsigned($signed((8'hb1))));
          reg43 <= (reg45[(1'h0):(1'h0)] | ($unsigned((((8'haa) ?
                  wire28 : wire28) ?
              (~^wire30) : (wire30 ? (8'ha2) : (8'h9c)))) == wire30));
        end
      if ($unsigned($signed($unsigned($signed(wire27[(3'h5):(1'h0)])))))
        begin
          reg48 <= (wire34[(2'h3):(1'h0)] <<< $signed($unsigned(reg40[(3'h7):(1'h0)])));
          reg49 <= (~&{reg47[(2'h2):(1'h0)]});
          reg50 <= (wire30 ?
              (wire27[(3'h6):(2'h2)] ?
                  (~^$unsigned($signed(wire35))) : $signed(wire30[(2'h3):(1'h0)])) : ($unsigned((~^$signed(wire34))) - $unsigned(((wire30 ?
                  wire31 : wire37) + (^~reg38)))));
          reg51 <= $signed({$unsigned(wire36), {$signed((|reg48))}});
        end
      else
        begin
          reg48 <= ((|wire27) ? $unsigned((8'hab)) : {wire35[(1'h0):(1'h0)]});
          if ((8'hba))
            begin
              reg49 <= wire29[(1'h1):(1'h0)];
              reg50 <= $unsigned((~^wire29));
              reg51 <= $unsigned((^~(wire27[(4'hb):(3'h5)] & reg45[(4'h9):(1'h1)])));
              reg52 <= {(8'hbd), reg51};
              reg53 <= reg39[(2'h3):(1'h1)];
            end
          else
            begin
              reg49 <= (reg43[(3'h5):(3'h4)] & wire37);
              reg50 <= (reg52[(3'h7):(3'h4)] >= reg51);
              reg51 <= $signed((~^(reg51 ^~ ((reg42 | reg48) & $unsigned(reg43)))));
              reg52 <= $signed($signed({$signed(reg49), reg51}));
              reg53 <= $unsigned((((~&((8'hb4) ? reg42 : wire36)) ?
                      wire32[(1'h1):(1'h1)] : ($unsigned((8'hba)) >> wire37[(4'h8):(2'h2)])) ?
                  wire32[(2'h2):(1'h0)] : (($signed((8'h9c)) <<< (wire37 & wire33)) >>> wire34[(2'h2):(1'h0)])));
            end
          reg54 <= (wire36 && $signed({$signed(wire31),
              $unsigned((wire36 <= wire29))}));
          reg55 <= (wire27[(3'h5):(1'h1)] <= $unsigned(reg39[(5'h14):(4'hd)]));
          reg56 <= $signed($signed((((reg40 <= reg44) ?
              reg53[(3'h6):(2'h3)] : $unsigned(reg50)) ^~ ((^~reg51) & (wire32 ?
              reg40 : wire35)))));
        end
      reg57 <= (((^((-reg56) ? {wire35, wire37} : $signed(wire30))) ?
              (~^reg56) : $unsigned($signed(reg56))) ?
          (wire36 ?
              (7'h41) : (^reg53[(5'h15):(4'hb)])) : $unsigned(reg42[(2'h2):(1'h1)]));
      reg58 <= $unsigned({(~^{(-(8'hbc)), (reg48 ^ reg43)})});
    end
  always
    @(posedge clk) begin
      reg59 <= {reg40[(3'h7):(1'h1)]};
    end
  assign wire60 = reg56[(3'h4):(3'h4)];
  assign wire61 = ((|(reg53[(4'hf):(4'hb)] ?
                      (8'ha9) : {(wire37 | reg57),
                          reg47})) ~^ ((($signed(reg46) * $unsigned(wire32)) || $unsigned((^(8'h9f)))) - ($unsigned($signed(reg39)) || reg55)));
  assign wire62 = {wire28[(3'h6):(3'h4)]};
  assign wire63 = {($unsigned(wire60) << $unsigned(((wire33 ? reg42 : reg55) ?
                          $unsigned(reg51) : ((8'ha1) ? (8'hbf) : reg56)))),
                      (8'ha1)};
endmodule
