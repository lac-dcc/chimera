module top #(parameter param107 = (8'hbe)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire105;
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire4,
                 wire23,
                 wire28,
                 wire29,
                 wire30,
                 wire105,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed((^wire0));
  always
    @(posedge clk) begin
      if ($signed($signed(((wire1[(3'h4):(1'h0)] ? {wire0, wire0} : (-wire2)) ?
          $unsigned(wire2[(3'h4):(1'h1)]) : $unsigned(wire4)))))
        begin
          if (((+$signed($unsigned(wire0))) ?
              wire0[(1'h0):(1'h0)] : $unsigned({wire0,
                  $signed({wire3, wire4})})))
            begin
              reg5 <= wire3[(3'h6):(3'h6)];
              reg6 <= (($unsigned(((wire0 ?
                      wire4 : wire3) == (reg5 <= wire0))) ?
                  $signed($unsigned((wire2 ^~ (8'ha1)))) : $signed(({wire1} | ((7'h41) ?
                      wire0 : wire1)))) != (^~$unsigned((wire3[(3'h4):(1'h0)] ?
                  (wire4 | wire0) : $signed(wire1)))));
              reg7 <= $unsigned($unsigned((8'ha5)));
              reg8 <= ($signed(wire4[(4'h8):(3'h5)]) ^~ (&reg6[(4'h8):(2'h2)]));
              reg9 <= {$unsigned({$signed({wire4}),
                      (^~(wire3 ? (8'hb1) : wire0))})};
            end
          else
            begin
              reg5 <= $signed({((wire4[(5'h10):(3'h6)] ?
                          (wire0 ? reg6 : (8'h9f)) : (wire3 | reg6)) ?
                      ({wire1} ? reg9 : {(8'ha7), wire3}) : (reg7 && wire2))});
              reg6 <= ($unsigned(($unsigned($unsigned(wire1)) ?
                      ((reg9 ~^ reg5) ?
                          (~^reg8) : reg7) : reg8[(3'h5):(3'h5)])) ?
                  $unsigned({$unsigned(reg5),
                      reg6[(4'h9):(1'h0)]}) : $signed(wire2[(5'h11):(4'hf)]));
              reg7 <= reg8;
              reg8 <= $unsigned($unsigned((($unsigned(wire4) ?
                  (^~reg7) : (reg7 ? wire1 : wire1)) && (reg9 ?
                  {wire3, wire4} : (reg6 >>> wire2)))));
            end
          if ($unsigned($signed(($unsigned((wire4 ? (7'h42) : reg5)) ?
              (&(reg8 != wire3)) : $signed((~&reg8))))))
            begin
              reg10 <= (~&$signed($signed(wire2)));
              reg11 <= $signed(wire1);
              reg12 <= (-reg6);
              reg13 <= (~^reg6[(4'hb):(1'h0)]);
              reg14 <= (reg9 ?
                  {$signed(reg9[(4'h8):(1'h0)])} : (~reg6[(1'h0):(1'h0)]));
            end
          else
            begin
              reg10 <= $signed($unsigned(($unsigned(((8'h9e) + (8'hac))) | $signed($signed(reg14)))));
              reg11 <= $signed($unsigned((8'h9d)));
              reg12 <= reg12[(3'h6):(3'h4)];
            end
          reg15 <= (reg14[(4'hb):(3'h6)] > reg8);
          if ({($unsigned((reg5 ~^ {reg13,
                  reg15})) == (!(-reg15[(2'h2):(1'h0)]))),
              reg15})
            begin
              reg16 <= reg8[(1'h0):(1'h0)];
              reg17 <= (((wire3[(3'h4):(1'h1)] ?
                      {{wire2, (8'ha6)}} : ($unsigned(wire1) ?
                          wire3 : {reg15})) != ($signed((wire3 ?
                      (8'hac) : wire1)) | reg15)) ?
                  $unsigned((&reg12[(4'hf):(4'h8)])) : {$unsigned($signed({reg6})),
                      ($unsigned(reg9[(3'h7):(1'h0)]) ?
                          (reg13[(3'h5):(1'h0)] >> reg14[(1'h1):(1'h0)]) : $unsigned($unsigned(reg14)))});
              reg18 <= reg10[(3'h4):(3'h4)];
              reg19 <= (^~reg18);
            end
          else
            begin
              reg16 <= $signed($unsigned($unsigned(reg5)));
              reg17 <= (^~$signed($unsigned((wire2[(4'ha):(4'h9)] ?
                  (&reg8) : (7'h44)))));
              reg18 <= ($signed($signed(reg16[(4'hc):(3'h4)])) ?
                  reg16 : (reg10 ?
                      reg19[(1'h1):(1'h1)] : (^~$signed((~^wire0)))));
              reg19 <= reg18;
              reg20 <= wire2[(4'hb):(3'h6)];
            end
        end
      else
        begin
          reg5 <= $signed((~|(^wire1[(3'h5):(2'h2)])));
          reg6 <= ((^reg5) == reg8[(1'h1):(1'h0)]);
          reg7 <= $signed(reg5);
          reg8 <= $signed({reg8, reg6[(4'hb):(1'h0)]});
          reg9 <= (({(&$unsigned(wire1)), $unsigned((reg20 ? wire0 : reg7))} ?
                  ((reg15[(1'h0):(1'h0)] == {reg20}) ?
                      $unsigned((reg11 ?
                          reg8 : reg8)) : {$signed(wire3)}) : ($unsigned((wire0 <= reg6)) ?
                      (~(reg15 != (8'ha6))) : $signed((reg9 ? reg12 : reg9)))) ?
              reg20 : (reg10 ?
                  $signed((^~reg15[(2'h2):(1'h0)])) : {(reg12 & ((8'h9d) ?
                          reg11 : reg11))}));
        end
      reg21 <= ((((~&(7'h40)) <<< (reg18[(1'h0):(1'h0)] < reg7[(2'h2):(2'h2)])) << ($unsigned($unsigned(reg11)) >> ((8'ha1) ?
              (&reg16) : (reg10 <<< reg5)))) ?
          reg10 : $signed(($signed($unsigned(reg6)) >= (~(reg19 ?
              reg11 : reg10)))));
    end
  always
    @(posedge clk) begin
      reg22 <= ((($signed($unsigned(reg18)) ?
              $unsigned({reg20,
                  reg12}) : (!$signed(reg21))) >= ({$unsigned(reg20)} ?
              (8'hac) : $signed($unsigned(wire1)))) ?
          wire2[(3'h7):(3'h7)] : $signed(reg7[(1'h1):(1'h1)]));
    end
  assign wire23 = ($signed($signed(((reg11 ? reg16 : reg17) ^~ (^~reg9)))) ?
                      reg22[(4'hd):(3'h7)] : (8'hab));
  always
    @(posedge clk) begin
      if ((+(~&(((wire4 ? reg10 : wire0) * ((8'hb5) ? reg19 : reg7)) ?
          reg20 : reg9[(1'h0):(1'h0)]))))
        begin
          reg24 <= ((~(-(8'hbb))) ?
              reg19[(3'h6):(1'h1)] : ((({reg8} > (reg21 + reg16)) ?
                  $unsigned((reg11 ?
                      (8'h9f) : reg12)) : reg9[(3'h5):(2'h2)]) | wire0[(3'h4):(3'h4)]));
          reg25 <= (~(({$unsigned(reg18)} * (reg17[(4'hd):(3'h6)] * (^reg14))) << (($signed(reg13) >>> $signed(reg21)) ?
              {$signed((8'haa)), (|reg21)} : (-$signed(reg18)))));
        end
      else
        begin
          reg24 <= reg19;
          if (reg22)
            begin
              reg25 <= $signed(reg15);
              reg26 <= (~$signed(reg24));
            end
          else
            begin
              reg25 <= (reg12[(4'hb):(2'h2)] < $signed($signed($signed(wire3[(1'h1):(1'h1)]))));
            end
          reg27 <= reg24;
        end
    end
  assign wire28 = $unsigned((~^$unsigned((^~reg15[(1'h0):(1'h0)]))));
  assign wire29 = (~$unsigned((&$signed($signed(reg5)))));
  assign wire30 = (({{$unsigned((8'hb8)), reg27[(3'h5):(2'h3)]},
                              $signed((reg10 ? wire3 : reg21))} ?
                          reg22[(4'hb):(3'h4)] : $signed(reg20[(1'h0):(1'h0)])) ?
                      {(&($signed(reg7) ? (~^reg8) : (~^(8'ha1)))),
                          reg8[(3'h4):(2'h3)]} : ((reg15 ?
                          reg7 : (reg6 << (&(8'ha3)))) == reg16));
  module31 #() modinst106 (wire105, clk, reg18, reg24, reg7, reg25, wire4);
endmodule

module module31
#(parameter param104 = (^({(~&{(8'ha3), (8'hb8)})} ? (+(((8'hb6) ? (8'hb5) : (7'h43)) ? ((7'h42) ? (8'hb3) : (8'hb4)) : ((8'hb5) != (8'ha2)))) : ((((8'hb9) ~^ (8'ha7)) ? {(8'hb6), (8'h9d)} : ((8'h9d) ? (8'hb7) : (7'h40))) >>> {((7'h41) << (8'hb9))}))))
(y, clk, wire32, wire33, wire34, wire35, wire36);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire32;
  input wire signed [(5'h15):(1'h0)] wire33;
  input wire [(5'h11):(1'h0)] wire34;
  input wire signed [(5'h10):(1'h0)] wire35;
  input wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(5'h13):(1'h0)] wire90;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire82;
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire90,
                 wire86,
                 wire37,
                 wire38,
                 wire39,
                 wire82,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg89,
                 reg88,
                 reg87,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire37 = (((wire36 ? ($unsigned((8'haa)) * $signed(wire32)) : wire36) ?
                      $signed($signed($signed(wire36))) : wire35) + $unsigned((~($signed(wire32) >>> (wire34 ?
                      wire35 : wire33)))));
  assign wire38 = ((($unsigned(wire34[(1'h0):(1'h0)]) != {wire32[(2'h3):(2'h2)],
                              (wire35 ? wire32 : wire32)}) ?
                          ($signed(wire34[(4'hf):(4'ha)]) > ($signed(wire37) <= (~|wire37))) : (8'ha6)) ?
                      wire32 : $signed(wire37));
  assign wire39 = $unsigned((&$unsigned($signed($signed(wire38)))));
  module40 #() modinst83 (.y(wire82), .wire44(wire33), .wire42(wire32), .clk(clk), .wire45(wire38), .wire43(wire37), .wire41(wire36));
  always
    @(posedge clk) begin
      reg84 <= $unsigned($unsigned($unsigned(wire36[(3'h7):(3'h6)])));
      reg85 <= $signed(wire82[(5'h10):(4'hd)]);
    end
  assign wire86 = (((wire34 ?
                          (8'hbf) : ($unsigned(wire36) ?
                              (wire39 >> wire32) : (wire82 > (8'had)))) && {reg84[(4'he):(4'ha)],
                          wire36}) ?
                      ((((7'h44) ? ((8'ha5) << wire37) : $unsigned(reg84)) ?
                              wire33[(5'h15):(5'h10)] : (&wire33[(3'h4):(1'h1)])) ?
                          $unsigned($unsigned((wire82 ?
                              wire37 : wire37))) : $unsigned((^wire32[(4'h9):(3'h4)]))) : $signed($unsigned($signed($unsigned(wire32)))));
  always
    @(posedge clk) begin
      reg87 <= (wire37 ~^ wire38);
      reg88 <= (reg85[(2'h2):(1'h1)] ?
          $signed((((reg87 ? (8'ha6) : wire37) ?
                  (wire32 ? reg87 : wire37) : $signed(wire39)) ?
              reg85[(4'hd):(4'h8)] : (wire34 + $signed(reg85)))) : $signed((~&(+(^wire38)))));
      reg89 <= wire35[(3'h5):(2'h2)];
    end
  assign wire90 = ($unsigned((wire86 ?
                      (wire36[(4'hc):(4'h9)] <= $unsigned(wire35)) : (~^wire33))) ^ {reg84[(4'ha):(3'h7)],
                      wire34});
  always
    @(posedge clk) begin
      reg91 <= (~^(({{reg85},
          $signed(wire86)} && $signed(wire86)) ^~ $unsigned(reg89[(3'h5):(1'h1)])));
      reg92 <= $signed((-$signed(($signed(wire34) ? (8'h9f) : wire90))));
      reg93 <= $signed($unsigned(reg84[(3'h5):(2'h2)]));
    end
  always
    @(posedge clk) begin
      if ((((((&wire39) >> {wire32, reg84}) ?
          ((wire39 <= wire90) ?
              $unsigned(wire37) : $unsigned(wire82)) : wire36[(1'h0):(1'h0)]) >= $unsigned($unsigned(wire34[(4'h8):(2'h3)]))) + reg85))
        begin
          reg94 <= $signed(({(^~reg93),
              $unsigned($signed(reg91))} ^ $unsigned((!{(8'ha4)}))));
        end
      else
        begin
          reg94 <= wire34[(5'h11):(4'h8)];
          reg95 <= (&($signed(reg91[(4'hb):(1'h1)]) || (~|reg92[(2'h3):(1'h0)])));
        end
      reg96 <= (~^wire37);
      if ((~$signed((((reg88 ^~ wire32) ^ wire39[(1'h0):(1'h0)]) ?
          $unsigned(((8'haf) & reg85)) : ($unsigned(wire34) ?
              reg88[(1'h0):(1'h0)] : (wire36 ? reg87 : reg87))))))
        begin
          reg97 <= (($signed(reg93[(3'h4):(1'h1)]) ?
                  {(-{reg84, wire90}),
                      wire38[(4'ha):(1'h1)]} : ({reg84[(1'h0):(1'h0)],
                      (wire35 ^ wire36)} ~^ reg96[(3'h5):(3'h4)])) ?
              $unsigned(reg87[(4'hb):(2'h2)]) : reg91[(4'hd):(4'ha)]);
          reg98 <= reg84;
        end
      else
        begin
          reg97 <= (~^$signed(({(reg87 ? (8'hb3) : reg85)} ?
              $unsigned(reg89) : reg97)));
        end
      reg99 <= (^((reg97[(1'h0):(1'h0)] + reg88[(3'h6):(3'h4)]) | {$signed((8'ha2)),
          reg89[(3'h5):(3'h5)]}));
      reg100 <= $unsigned((wire82[(4'ha):(3'h4)] ?
          ($signed(reg95) == (8'hbd)) : (reg99 || ((reg92 ? wire34 : wire33) ?
              reg95 : $unsigned((8'h9d))))));
    end
  always
    @(posedge clk) begin
      reg101 <= (~&(wire86 ?
          $unsigned((|((8'had) ?
              (8'hab) : wire86))) : $unsigned({(reg93 >>> reg89)})));
    end
  assign wire102 = (wire33[(4'hf):(4'hd)] >>> reg99[(4'hd):(4'h9)]);
  assign wire103 = $unsigned((wire102 == {(~reg95)}));
endmodule

module module40
#(parameter param81 = ((!(&((8'ha2) + ((8'ha0) >= (8'ha1))))) & (!{(((8'hb1) ? (8'ha3) : (8'hab)) >> ((8'ha8) ^~ (8'ha0))), (^~(|(8'hb3)))})))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h1a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire45;
  input wire [(4'he):(1'h0)] wire44;
  input wire [(5'h12):(1'h0)] wire43;
  input wire signed [(5'h10):(1'h0)] wire42;
  input wire signed [(4'hf):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire61;
  wire signed [(2'h3):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  assign y = {wire80,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire58,
                 wire47,
                 wire46,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg60,
                 reg59,
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
                 (1'h0)};
  assign wire46 = $signed(wire44[(2'h3):(1'h1)]);
  assign wire47 = (8'hb8);
  always
    @(posedge clk) begin
      if ($unsigned(wire42))
        begin
          reg48 <= $unsigned((~^(^~(wire41[(2'h3):(2'h2)] >= wire43[(4'he):(4'hd)]))));
          reg49 <= (wire45 ?
              $unsigned(($unsigned(wire42[(4'h8):(3'h5)]) ?
                  $signed((wire42 > reg48)) : $unsigned(((8'hb4) ?
                      wire45 : (7'h41))))) : {$signed(reg48[(4'h9):(2'h2)]),
                  ((wire43[(4'hc):(1'h1)] <= (wire45 >= wire44)) ?
                      (8'hb7) : $signed(wire44))});
          reg50 <= ($signed(wire45) ?
              wire42 : (wire47[(2'h2):(2'h2)] ?
                  $unsigned($unsigned(wire44)) : ($signed($unsigned(wire43)) && {(wire44 ?
                          reg48 : (7'h42))})));
        end
      else
        begin
          if ({$unsigned(wire41[(4'ha):(3'h7)]),
              $unsigned(reg49[(3'h6):(2'h2)])})
            begin
              reg48 <= $unsigned({{($unsigned(wire41) & wire44),
                      ({wire43} ? (8'ha7) : wire43)}});
            end
          else
            begin
              reg48 <= wire42;
            end
          reg49 <= (($unsigned((wire41 ?
              (8'hb5) : ((8'hb0) ?
                  wire47 : wire45))) ~^ (~^wire44)) && $unsigned(($signed(wire44) || (^((8'hbf) ?
              (8'hb5) : wire43)))));
          reg50 <= ($signed(($unsigned((~|wire45)) >> (!(~&wire45)))) != (|(~wire45)));
          reg51 <= ((~|(wire45 ?
                  (reg50 & $signed(wire41)) : $unsigned($signed(wire43)))) ?
              (wire41[(3'h7):(3'h4)] ~^ $signed($signed((~&wire42)))) : ({reg48[(3'h6):(1'h0)]} ?
                  ((^~(wire47 ^ wire42)) ?
                      ((+(8'ha2)) <= (wire43 ?
                          wire45 : reg49)) : {(reg50 || wire45)}) : wire41));
          if ((~{(wire42 + (|$unsigned(reg51)))}))
            begin
              reg52 <= (((!wire41[(4'h8):(3'h5)]) >>> $signed(({wire41,
                      wire47} ?
                  (reg50 ?
                      wire42 : (8'hb0)) : $signed(reg48)))) && ((~^$signed(((7'h44) >= reg48))) ?
                  $unsigned((^~(8'hb2))) : (wire41 >> reg50)));
              reg53 <= ((^(((|reg50) == (reg49 << reg52)) ?
                  $unsigned($unsigned(wire43)) : $signed({reg52}))) == (wire44 ?
                  reg50 : $signed(wire47[(2'h2):(1'h0)])));
              reg54 <= (((^(^(8'haf))) ?
                      (^(~{(8'hbe)})) : $signed($unsigned($signed(reg52)))) ?
                  ($unsigned(wire47) ?
                      (^wire47) : ({$signed(wire46),
                          (8'hae)} >>> $signed({(7'h44),
                          wire41}))) : $signed($signed($signed(reg49))));
              reg55 <= wire47;
            end
          else
            begin
              reg52 <= ((8'h9d) >>> $unsigned(wire43[(2'h2):(2'h2)]));
              reg53 <= reg48[(4'h8):(3'h6)];
            end
        end
      reg56 <= wire43[(3'h5):(1'h0)];
      reg57 <= (-{((reg51[(3'h7):(3'h5)] ^~ reg56) >>> $unsigned($signed((8'hbf)))),
          (reg53 || (reg51[(3'h5):(1'h1)] ^~ reg56))});
    end
  assign wire58 = ((wire47[(1'h1):(1'h0)] ? reg48 : reg54) ?
                      $signed(($unsigned((wire44 ? wire41 : wire43)) ?
                          reg52[(4'he):(2'h3)] : (~&$unsigned((8'ha9))))) : $unsigned($signed($unsigned(((8'hab) ~^ reg50)))));
  always
    @(posedge clk) begin
      reg59 <= ($unsigned({$signed($unsigned((8'ha9))), reg56[(1'h1):(1'h1)]}) ?
          (~|(reg53[(5'h14):(4'ha)] ?
              reg52 : (wire41 ?
                  $signed(reg56) : (&wire42)))) : $unsigned($signed($signed(reg50))));
      reg60 <= (&reg55);
    end
  assign wire61 = (({(8'hae)} ?
                      $unsigned((~|reg49)) : (7'h42)) <= {($signed(reg53) ?
                          (wire58[(1'h1):(1'h0)] ?
                              (!reg53) : $signed(wire47)) : ((wire45 <= reg49) ?
                              (8'hb6) : wire58)),
                      $signed(((~^wire42) | (~wire45)))});
  assign wire62 = (8'hb7);
  assign wire63 = ((!$unsigned($signed((wire62 ?
                      (8'hbb) : reg52)))) > $signed(reg49));
  assign wire64 = $unsigned(($unsigned($unsigned((wire44 ? reg55 : (8'hbe)))) ?
                      $unsigned($unsigned(wire44)) : wire46));
  assign wire65 = (($signed((^~$signed(wire46))) & wire47) ?
                      (reg60[(5'h11):(4'h8)] ?
                          reg59[(1'h1):(1'h0)] : (reg52 ?
                              ($unsigned(reg54) ?
                                  $unsigned((8'hbb)) : reg53[(2'h2):(1'h0)]) : $unsigned((reg48 ?
                                  reg54 : reg49)))) : wire58);
  assign wire66 = (({reg56,
                      $signed((wire47 && wire41))} >>> (reg50 ~^ reg59)) ^~ (wire58[(1'h1):(1'h0)] ?
                      ($unsigned((~&wire42)) ?
                          wire62[(2'h3):(2'h3)] : wire61[(4'ha):(4'ha)]) : $signed($signed((reg49 >>> reg60)))));
  assign wire67 = (reg48 < (reg49[(1'h1):(1'h0)] ? (8'ha2) : (8'hbd)));
  assign wire68 = (wire58[(1'h1):(1'h0)] ?
                      wire66 : (wire44[(1'h0):(1'h0)] ^ (!((reg59 ?
                          wire47 : reg50) + wire67))));
  assign wire69 = wire68[(3'h7):(2'h3)];
  assign wire70 = ($signed(reg54) && reg54);
  assign wire71 = ($signed(wire61) ?
                      ($unsigned((wire43 == (reg50 ^ reg53))) >= (~&(^~reg52[(4'hf):(2'h3)]))) : ($unsigned(({reg54} << reg55)) ?
                          $signed(wire58[(2'h2):(1'h1)]) : $unsigned(reg59)));
  assign wire72 = (reg57[(2'h2):(2'h2)] ?
                      {$unsigned((^~reg59[(4'ha):(1'h0)])),
                          wire42[(1'h1):(1'h1)]} : reg59);
  always
    @(posedge clk) begin
      reg73 <= ((wire67[(1'h0):(1'h0)] ?
              ($signed(((8'h9c) == (8'h9f))) ^~ (!$signed((8'h9e)))) : {(~&(wire67 ^~ (7'h40)))}) ?
          (^{$unsigned((reg53 <= wire66)),
              reg48}) : ((wire66[(1'h0):(1'h0)] - $unsigned($unsigned((8'had)))) | ((|{wire45}) ?
              $unsigned($signed(reg50)) : $unsigned(wire65[(1'h1):(1'h0)]))));
      reg74 <= wire43[(1'h1):(1'h0)];
      reg75 <= $signed($unsigned(((~^{wire70, reg55}) | {wire61[(3'h7):(3'h6)],
          (reg55 >= reg56)})));
      reg76 <= (((reg60[(4'h9):(2'h3)] << (|$unsigned(wire58))) - $signed($unsigned($signed(reg52)))) ?
          wire41[(2'h2):(2'h2)] : reg60);
    end
  always
    @(posedge clk) begin
      reg77 <= $signed(wire69);
      reg78 <= ($unsigned($signed({$unsigned(wire62), wire70})) ?
          wire71 : $signed((~$unsigned($signed(reg53)))));
    end
  always
    @(posedge clk) begin
      reg79 <= wire46[(1'h1):(1'h1)];
    end
  assign wire80 = ($signed(wire42[(4'ha):(4'h9)]) << reg74[(5'h11):(2'h3)]);
endmodule
