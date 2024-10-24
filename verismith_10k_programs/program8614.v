module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h26a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire127;
  wire signed [(3'h7):(1'h0)] wire126;
  wire [(4'ha):(1'h0)] wire125;
  wire [(4'h8):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire109;
  reg [(2'h3):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg116 = (1'h0);
  reg [(4'ha):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg4 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire35,
                 wire36,
                 wire109,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($signed(wire0[(5'h14):(3'h4)]) * $signed($signed((wire1 ?
          $unsigned((8'hac)) : (wire0 + (8'haa))))));
    end
  always
    @(posedge clk) begin
      reg5 <= reg4[(3'h4):(2'h2)];
      if (({(wire3[(1'h0):(1'h0)] ?
                  $signed($signed(wire1)) : wire1[(4'h8):(2'h2)]),
              (((~^wire0) >= {wire0}) ? wire1 : $signed((~^(8'haa))))} ?
          ($unsigned((wire0[(4'hc):(2'h2)] <= (wire3 ? reg4 : reg5))) ?
              wire1 : ($unsigned($unsigned((7'h42))) > $signed((reg5 ?
                  (7'h43) : wire0)))) : $signed($signed(($signed(wire0) ?
              wire1[(3'h6):(3'h4)] : (8'ha6))))))
        begin
          reg6 <= ((reg5 ? (8'hbd) : (-reg4)) ? (|wire3) : reg4[(3'h4):(1'h0)]);
        end
      else
        begin
          reg6 <= (((~^{(wire0 ? (8'ha5) : wire1)}) && (+reg6[(3'h6):(3'h6)])) ?
              $signed(wire0[(4'h9):(3'h4)]) : {(~&$unsigned((~reg5))),
                  (($unsigned(reg4) ?
                      {(8'ha6)} : reg5[(5'h12):(4'hd)]) >>> {{reg5}})});
          reg7 <= ($unsigned((~&$signed((reg4 ^~ reg6)))) || wire0);
          reg8 <= (^$signed($signed((&reg4))));
          reg9 <= (~&wire1[(4'ha):(4'h8)]);
        end
    end
  assign wire10 = (($signed((~|{wire0})) | {reg6[(3'h4):(1'h0)]}) ~^ wire3);
  assign wire11 = wire3;
  assign wire12 = (~|reg9);
  assign wire13 = ({wire10,
                          $unsigned(($unsigned(wire10) ?
                              $signed(reg7) : $signed(wire10)))} ?
                      ($unsigned(wire10) ?
                          $signed((|$unsigned((8'haf)))) : {{$unsigned(wire1)}}) : ((reg5[(4'he):(4'hd)] ^ (wire2[(5'h14):(3'h5)] ?
                          (reg8 ? (8'hb6) : wire11) : (wire2 ?
                              reg6 : reg7))) == ({$signed(wire2),
                          {wire11}} << (!{reg5, wire0}))));
  always
    @(posedge clk) begin
      reg14 <= $signed($unsigned((8'hb8)));
      reg15 <= $signed(((($unsigned(wire3) ?
          (reg6 ?
              reg4 : reg6) : wire0[(5'h11):(4'hf)]) ^~ $signed($unsigned(wire2))) >= wire3));
      reg16 <= wire1[(4'he):(4'h9)];
      if ($signed((~^wire12[(4'hc):(1'h1)])))
        begin
          reg17 <= {(wire12 <= $unsigned((~(!(8'hb5)))))};
          reg18 <= wire1[(2'h2):(1'h0)];
          if (((8'had) ?
              ((~wire0[(4'hc):(4'h8)]) <<< reg6[(2'h2):(1'h1)]) : $unsigned($signed(($signed(reg9) ?
                  reg8 : $signed((8'hab)))))))
            begin
              reg19 <= $unsigned(reg14);
              reg20 <= reg9;
              reg21 <= (wire3[(2'h2):(1'h0)] >= ((^~reg6) + wire0));
              reg22 <= wire10[(2'h3):(2'h2)];
              reg23 <= (reg9 ? wire10[(3'h5):(3'h4)] : reg20);
            end
          else
            begin
              reg19 <= (8'hab);
              reg20 <= (^~(reg9 ~^ wire2));
            end
        end
      else
        begin
          reg17 <= (+$signed($unsigned($signed((&wire3)))));
          reg18 <= ($signed(reg7[(4'ha):(1'h1)]) ^ $unsigned(($signed(reg8[(3'h6):(2'h3)]) ?
              $signed((-reg18)) : ($signed(reg5) ~^ $unsigned(reg7)))));
          if ($signed(($unsigned(((reg8 ?
              (8'ha2) : wire2) >> $signed(reg8))) && $signed(((reg21 ?
                  reg14 : wire1) ?
              (^reg15) : wire13)))))
            begin
              reg19 <= reg16[(3'h4):(2'h2)];
              reg20 <= (wire1 ?
                  (8'had) : $signed((({reg22, wire0} ?
                          reg19[(4'he):(2'h3)] : $unsigned((8'hb1))) ?
                      ({(8'hac), wire11} ?
                          (&reg16) : reg19) : $unsigned($signed(wire12)))));
              reg21 <= {$signed({(~reg5),
                      ({wire0, reg4} ? reg7 : {reg5, wire10})})};
              reg22 <= (~|$unsigned(((-reg15) > {reg15, (-wire3)})));
            end
          else
            begin
              reg19 <= (8'ha3);
              reg20 <= (~$unsigned(reg7[(2'h2):(1'h1)]));
              reg21 <= reg17;
              reg22 <= (~|(&(^~(&$unsigned(reg14)))));
              reg23 <= $signed({$unsigned((8'ha5))});
            end
          reg24 <= reg16[(2'h3):(2'h3)];
        end
      if (reg23)
        begin
          reg25 <= (^~{$signed((((8'h9d) ? reg16 : (8'ha8)) != {reg22,
                  reg20}))});
          reg26 <= reg21[(2'h2):(1'h0)];
          if ({{$unsigned($unsigned((wire1 ? (8'h9d) : reg16)))}, wire11})
            begin
              reg27 <= wire13[(1'h0):(1'h0)];
            end
          else
            begin
              reg27 <= {$unsigned(wire11[(4'h8):(3'h4)])};
              reg28 <= reg22;
              reg29 <= $unsigned((({(reg14 != wire3)} ?
                      ({reg28} ? {reg22, reg6} : $unsigned(reg22)) : (&reg22)) ?
                  (~|(~|reg5[(2'h2):(2'h2)])) : reg21));
              reg30 <= $unsigned($unsigned(($signed(wire0[(4'ha):(3'h6)]) ^~ ($signed(reg14) ?
                  ((8'haa) << reg16) : (reg17 ^ wire12)))));
              reg31 <= reg6;
            end
          if ((|(reg23 ?
              $signed(reg26) : {reg15[(3'h6):(3'h5)],
                  ({wire12, reg29} ? reg9 : $signed(wire1))})))
            begin
              reg32 <= $unsigned({$unsigned((+(reg24 >>> reg19))), reg30});
              reg33 <= wire10[(4'h8):(3'h7)];
            end
          else
            begin
              reg32 <= (reg9 ^ $unsigned(reg5));
            end
          reg34 <= $signed($unsigned((wire10[(1'h0):(1'h0)] >>> reg27[(2'h3):(2'h2)])));
        end
      else
        begin
          reg25 <= $signed((reg26 << $signed((~|reg24[(4'ha):(3'h4)]))));
          reg26 <= {(+reg19)};
        end
    end
  assign wire35 = (~($signed(reg31) ?
                      ($signed((reg7 <= reg14)) * (!(~|reg30))) : reg30));
  assign wire36 = wire13[(1'h1):(1'h0)];
  module37 #() modinst110 (wire109, clk, reg24, reg34, wire11, reg22, reg9);
  always
    @(posedge clk) begin
      reg111 <= $signed((+$unsigned(($signed(reg20) | (-reg16)))));
      if (reg17)
        begin
          reg112 <= {reg16, (|(+{$signed(reg25), (reg33 ? reg28 : reg27)}))};
          reg113 <= $unsigned(reg33);
          reg114 <= ((^((^{wire10, reg28}) <<< reg8[(3'h7):(3'h5)])) ?
              reg18 : wire1);
          if ($signed((+(8'ha6))))
            begin
              reg115 <= ($unsigned((~|reg26)) ? wire13[(3'h4):(1'h1)] : reg17);
              reg116 <= (reg20 ?
                  (+((reg9[(5'h15):(4'hd)] ^~ ((8'ha7) ?
                      reg27 : reg24)) * ($signed(reg9) ?
                      $signed(reg20) : $unsigned(reg21)))) : ($signed((wire13[(2'h3):(2'h3)] ^ $signed(wire11))) ?
                      (~^((reg115 >> wire10) >> reg32[(2'h3):(1'h1)])) : reg30[(2'h3):(2'h3)]));
              reg117 <= $unsigned($unsigned(reg113[(5'h11):(2'h3)]));
              reg118 <= reg7;
              reg119 <= reg113[(5'h14):(3'h6)];
            end
          else
            begin
              reg115 <= reg118;
              reg116 <= wire35;
              reg117 <= reg113;
              reg118 <= $signed((&$signed(($signed(reg19) ?
                  ((8'hb2) ? reg116 : reg32) : (~(8'h9e))))));
            end
          if (((-(-{reg113})) == reg21[(3'h7):(1'h0)]))
            begin
              reg120 <= (8'hac);
              reg121 <= {wire13};
              reg122 <= $signed($unsigned($unsigned(reg9)));
            end
          else
            begin
              reg120 <= $signed(reg28);
              reg121 <= ($unsigned($unsigned((&(reg122 ?
                  wire12 : wire109)))) || $unsigned(((((8'hae) & reg6) ?
                      $unsigned(wire10) : $unsigned((8'hac))) ?
                  (~&(reg8 ? reg15 : reg26)) : $unsigned((~^reg20)))));
              reg122 <= ($unsigned($unsigned(reg17[(4'h8):(3'h4)])) ?
                  ($unsigned((~|{reg120})) ?
                      ({reg24[(4'ha):(3'h7)],
                          ((7'h44) ?
                              reg113 : reg21)} <= $signed((reg5 - reg5))) : (reg16 != reg24)) : wire2);
            end
        end
      else
        begin
          if (wire12)
            begin
              reg112 <= $unsigned((~&((^(^~reg122)) & reg20)));
              reg113 <= $unsigned(wire2[(2'h3):(1'h1)]);
              reg114 <= reg29;
              reg115 <= (~^((+((~(8'hb4)) - (-reg7))) ?
                  (^({reg122} - (reg114 >> reg4))) : $signed((|wire35[(4'hd):(3'h7)]))));
            end
          else
            begin
              reg112 <= reg30[(4'hd):(4'hd)];
              reg113 <= reg25;
              reg114 <= reg115;
            end
          reg116 <= (~&((reg26 ?
              (|reg33[(4'h8):(1'h1)]) : (&(8'hbb))) << {((-reg116) != (reg21 + reg115)),
              (-(-reg29))}));
          if (reg17[(4'h8):(3'h7)])
            begin
              reg117 <= ($signed({$unsigned((reg120 & wire36)),
                      reg15[(4'h8):(3'h5)]}) ?
                  $unsigned($signed($signed($signed(reg34)))) : {reg112[(1'h0):(1'h0)],
                      $signed((^~$unsigned(reg16)))});
              reg118 <= $signed(reg28);
              reg119 <= (((reg28 ?
                      $signed((reg17 ?
                          reg14 : reg4)) : $unsigned((!(8'ha6)))) * wire36[(2'h2):(1'h1)]) ?
                  $unsigned($unsigned(((^reg32) ?
                      wire0 : $signed(reg115)))) : $signed((-wire1[(4'h8):(2'h2)])));
              reg120 <= ($unsigned((wire3 ?
                      $signed($signed(wire1)) : (~&{reg111, (8'hb2)}))) ?
                  $signed(reg14[(1'h0):(1'h0)]) : $signed((^~(+reg117))));
              reg121 <= reg20[(1'h1):(1'h0)];
            end
          else
            begin
              reg117 <= $unsigned(reg26);
              reg118 <= $signed($unsigned(($signed(reg16[(1'h0):(1'h0)]) & $unsigned(((8'hbc) << reg112)))));
              reg119 <= (($signed(((reg30 > reg14) ^ reg21)) - (reg117 ?
                  ({(8'hb9)} ?
                      $signed(reg14) : $unsigned((8'hab))) : ((wire3 >> wire3) ?
                      {reg26} : (reg115 ?
                          reg5 : (8'hbf))))) >= $unsigned(reg120));
              reg120 <= {$signed($unsigned($signed($signed((8'h9f)))))};
            end
          reg122 <= $signed($unsigned(((~&(8'hb8)) ?
              wire13[(3'h6):(3'h5)] : $unsigned((reg31 ? wire35 : reg113)))));
        end
      reg123 <= ($signed($unsigned(((8'hb2) <= (wire3 << reg22)))) ^~ reg34);
    end
  assign wire124 = $signed($unsigned((~|$unsigned({reg15}))));
  assign wire125 = (~^($unsigned(((8'had) & $unsigned((8'hb0)))) || $unsigned(((7'h43) >= $unsigned(wire2)))));
  assign wire126 = reg4[(3'h5):(1'h1)];
  assign wire127 = wire35;
endmodule

module module37  (y, clk, wire38, wire39, wire40, wire41, wire42);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire38;
  input wire [(4'h8):(1'h0)] wire39;
  input wire [(5'h15):(1'h0)] wire40;
  input wire [(5'h13):(1'h0)] wire41;
  input wire signed [(5'h12):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire108;
  wire [(5'h13):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(3'h6):(1'h0)] wire104;
  wire signed [(3'h7):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire100;
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire43,
                 wire64,
                 wire66,
                 wire67,
                 wire68,
                 wire100,
                 (1'h0)};
  assign wire43 = ((+wire40[(1'h0):(1'h0)]) >> wire41);
  module44 #() modinst65 (.wire45(wire41), .y(wire64), .wire46(wire43), .clk(clk), .wire47(wire39), .wire48(wire38));
  assign wire66 = (~wire41);
  assign wire67 = (wire40[(5'h12):(3'h5)] >= $unsigned($signed(($signed(wire43) ?
                      $signed((8'hae)) : {wire43, wire41}))));
  assign wire68 = $unsigned(((((wire42 ? wire43 : wire42) ?
                          $signed(wire41) : $unsigned(wire42)) + ({(8'ha7),
                          wire67} + (wire42 ? (8'hb2) : wire42))) ?
                      $unsigned($signed($unsigned((8'ha9)))) : $unsigned($signed((wire64 ?
                          wire67 : wire43)))));
  module69 #() modinst101 (.wire74(wire42), .clk(clk), .wire73(wire66), .wire71(wire38), .y(wire100), .wire70(wire41), .wire72(wire64));
  assign wire102 = wire66[(4'h8):(1'h1)];
  assign wire103 = wire66;
  assign wire104 = $signed((($signed((~&wire66)) ?
                       $signed(wire66[(3'h6):(2'h2)]) : wire67) ^ {((~&wire68) >> $signed(wire39))}));
  assign wire105 = $unsigned(wire40[(4'he):(3'h5)]);
  assign wire106 = (^~$unsigned((({wire100} == (wire105 + (8'ha0))) > ($signed(wire103) ?
                       (^wire104) : wire42[(3'h4):(3'h4)]))));
  assign wire107 = (|{$signed(wire106[(4'hb):(4'h8)]), wire67[(2'h2):(2'h2)]});
  assign wire108 = $unsigned(wire105[(1'h1):(1'h1)]);
endmodule

module module69
#(parameter param98 = (~&(^(~|(((8'ha4) ? (8'ha0) : (8'hac)) * ((7'h42) >> (8'ha0)))))), 
parameter param99 = param98)
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire74;
  input wire [(4'ha):(1'h0)] wire73;
  input wire [(4'he):(1'h0)] wire72;
  input wire signed [(4'hf):(1'h0)] wire71;
  input wire signed [(5'h13):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire95;
  wire signed [(3'h5):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire90;
  wire [(3'h5):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire75;
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire91,
                 wire90,
                 wire82,
                 wire81,
                 wire77,
                 wire76,
                 wire75,
                 reg94,
                 reg93,
                 reg92,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire75 = wire71;
  assign wire76 = $signed(($unsigned($unsigned((wire71 ?
                      wire70 : wire70))) != $signed(wire72[(3'h5):(1'h0)])));
  assign wire77 = wire73;
  always
    @(posedge clk) begin
      reg78 <= wire70;
      reg79 <= wire76;
      reg80 <= wire75;
    end
  assign wire81 = reg80[(5'h14):(4'hd)];
  assign wire82 = reg79;
  always
    @(posedge clk) begin
      if (reg80)
        begin
          reg83 <= ((wire70 ?
                  reg78[(2'h3):(1'h0)] : ($unsigned(wire74) ^~ ((|reg80) < {wire71,
                      reg78}))) ?
              $unsigned($signed((^$unsigned(reg80)))) : wire74);
          reg84 <= {{((~&$signed(wire75)) << ($unsigned(wire82) <<< (~|(8'haf))))}};
          reg85 <= (!$unsigned(reg78[(2'h3):(1'h1)]));
        end
      else
        begin
          reg83 <= wire70[(2'h2):(1'h1)];
          reg84 <= $signed($unsigned(($signed(wire77[(4'h8):(3'h5)]) ?
              ((-wire74) * $signed(wire81)) : wire70[(4'hb):(4'h9)])));
          reg85 <= $signed($signed($signed(reg80)));
          reg86 <= $signed((!(^{(wire74 >> reg84)})));
          reg87 <= (($unsigned(($signed(reg85) ?
                  (reg83 ?
                      reg84 : wire74) : reg86[(2'h2):(1'h0)])) || ((~$unsigned(wire76)) <<< {reg86})) ?
              (!(($signed(reg83) ?
                  $signed(wire81) : (|reg86)) <<< (!$signed(reg86)))) : ($unsigned(((reg85 > (8'hb5)) * $unsigned(wire74))) - ((((7'h44) ?
                          wire81 : reg80) ?
                      $signed(reg86) : wire77) ?
                  ($unsigned(wire72) >= $signed((7'h41))) : {(reg80 ?
                          wire70 : wire71)})));
        end
      reg88 <= ($signed($signed($unsigned(wire81[(1'h1):(1'h0)]))) > {wire70,
          $signed(wire72[(3'h4):(3'h4)])});
      reg89 <= wire76;
    end
  assign wire90 = $signed(((^~($unsigned(reg79) ?
                      (^~reg84) : $signed(reg83))) > (reg86 ?
                      reg85[(2'h2):(1'h1)] : {{wire74, reg79}})));
  assign wire91 = wire76;
  always
    @(posedge clk) begin
      if ($unsigned((((|((8'ha7) - wire72)) < $unsigned((+reg78))) ?
          (((wire91 <= reg86) > (wire76 ? wire71 : wire71)) ?
              $signed((reg80 ?
                  wire77 : (8'h9e))) : reg89) : $unsigned(($signed((8'h9f)) ?
              reg78 : reg78)))))
        begin
          reg92 <= reg83[(1'h1):(1'h1)];
        end
      else
        begin
          reg92 <= wire72;
          reg93 <= $signed($signed({(|$signed(reg92)),
              {$signed(wire72), wire81}}));
        end
      reg94 <= (^~{$unsigned(({wire74, reg79} || ((8'hb5) < wire74))), wire74});
    end
  assign wire95 = ($unsigned($unsigned((-(reg80 >= reg80)))) ?
                      $unsigned(($signed((!reg87)) ?
                          reg78[(2'h3):(1'h0)] : reg79[(4'h9):(3'h5)])) : (&(7'h43)));
  assign wire96 = (~((wire72[(1'h1):(1'h0)] <= $signed(reg92[(2'h2):(1'h0)])) ?
                      (reg88[(2'h2):(2'h2)] ?
                          ({wire77,
                              wire95} >>> $signed(wire75)) : wire82[(2'h2):(1'h0)]) : (((wire73 ?
                              reg84 : wire75) ~^ (|reg80)) ?
                          reg92[(1'h1):(1'h0)] : $signed((8'hb8)))));
  assign wire97 = ((-$unsigned((8'haf))) ?
                      ((wire90[(4'ha):(2'h3)] ?
                          reg78 : wire76[(2'h2):(2'h2)]) <= wire96[(4'h9):(3'h5)]) : (^~$unsigned((8'hb5))));
endmodule

module module44  (y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire48;
  input wire [(3'h6):(1'h0)] wire47;
  input wire signed [(2'h2):(1'h0)] wire46;
  input wire [(5'h12):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire50;
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire50,
                 reg53,
                 reg52,
                 reg51,
                 reg49,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg49 <= wire46[(1'h0):(1'h0)];
    end
  assign wire50 = reg49;
  always
    @(posedge clk) begin
      reg51 <= $signed({$signed((wire48 ? (8'ha2) : (^~wire46)))});
      reg52 <= (8'haa);
      reg53 <= $unsigned(wire47[(3'h4):(1'h0)]);
    end
  assign wire54 = $unsigned(((wire45 ?
                      $signed(wire47[(3'h5):(1'h0)]) : reg49[(2'h3):(2'h3)]) << ($signed((reg49 ?
                      (8'ha4) : wire48)) - wire50)));
  assign wire55 = $unsigned($signed($signed({reg49})));
  assign wire56 = reg49[(3'h7):(3'h4)];
  assign wire57 = $signed(($signed($signed((~&reg49))) ?
                      (((wire48 >>> reg49) ~^ reg53) >> (reg49 ?
                          (~^wire55) : (^wire45))) : ($signed({reg51}) ?
                          $unsigned({wire46}) : (~&$unsigned(wire45)))));
  assign wire58 = (($signed(((~&wire56) ? (!(8'hb1)) : $signed(reg53))) ?
                          wire45 : (((wire47 ?
                              (7'h41) : wire48) || $unsigned(reg52)) <<< {$unsigned(wire46)})) ?
                      reg52 : $unsigned($signed($signed((reg49 || wire55)))));
  assign wire59 = $signed((reg53[(3'h4):(2'h3)] ~^ {wire54, $signed(reg51)}));
  assign wire60 = wire58;
  assign wire61 = $signed({(wire45[(4'hb):(4'h8)] ?
                          (wire50[(1'h0):(1'h0)] >>> $signed(reg52)) : ((-wire50) ?
                              wire58[(4'hb):(4'h8)] : $unsigned(wire59))),
                      {(8'ha8)}});
  assign wire62 = wire60[(2'h2):(1'h0)];
  assign wire63 = wire54;
endmodule
