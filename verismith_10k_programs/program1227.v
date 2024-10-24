module top
#(parameter param271 = ((((((8'haf) ? (8'hba) : (8'ha7)) ? ((7'h44) || (8'ha1)) : ((8'hb8) || (8'hb6))) > ((~(8'hb3)) & ((7'h43) + (7'h42)))) && ((~^(-(8'hb7))) ^ (((8'ha0) ? (8'hab) : (8'hbf)) <<< ((8'ha3) ? (8'hb4) : (8'hb7))))) ? (8'hac) : ((&(7'h43)) == ((8'hb7) & (|(^(8'hb0)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1e6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire269;
  wire [(5'h11):(1'h0)] wire265;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire267;
  reg signed [(4'hb):(1'h0)] reg4 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  assign y = {wire269,
                 wire265,
                 wire38,
                 wire37,
                 wire36,
                 wire28,
                 wire27,
                 wire14,
                 wire267,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (+{$unsigned(((~^wire0) ?
              $unsigned(wire2) : wire3[(2'h3):(1'h0)])),
          $signed(wire0)});
      if (reg4[(1'h0):(1'h0)])
        begin
          reg5 <= ($signed({$signed((wire0 ? wire0 : wire0)),
                  wire1[(1'h1):(1'h0)]}) ?
              wire2 : ($unsigned($signed($signed(wire3))) ?
                  wire3[(4'ha):(4'h9)] : {$unsigned((|wire1)),
                      (^((7'h44) ~^ wire3))}));
          if (reg5[(3'h5):(1'h0)])
            begin
              reg6 <= wire3[(3'h4):(1'h1)];
              reg7 <= ((reg5[(3'h4):(1'h1)] * ($signed((wire0 + wire3)) >= wire0[(5'h10):(1'h0)])) ?
                  (^~wire2[(1'h0):(1'h0)]) : ((wire3[(2'h2):(1'h1)] ?
                      $unsigned({reg5,
                          wire1}) : $signed($unsigned(reg5))) <= {wire1}));
              reg8 <= $unsigned(reg7);
              reg9 <= reg7[(1'h0):(1'h0)];
            end
          else
            begin
              reg6 <= ((wire2[(3'h5):(2'h2)] ?
                  (wire3[(3'h7):(1'h1)] ~^ $unsigned($unsigned((8'ha1)))) : $signed(((wire0 ?
                          wire0 : reg9) ?
                      wire2 : (8'haa)))) ~^ (&reg7[(4'hb):(4'ha)]));
              reg7 <= (({(wire2 ? {wire2, reg6} : $signed(wire1)),
                      (reg7 ? (8'ha1) : reg7)} >> ((7'h44) == {reg6})) ?
                  wire2[(1'h1):(1'h1)] : reg6[(1'h0):(1'h0)]);
              reg8 <= ($unsigned(reg9[(2'h3):(2'h2)]) ?
                  wire2[(1'h1):(1'h0)] : wire2[(3'h6):(3'h4)]);
            end
          reg10 <= $signed({$signed(reg8[(1'h1):(1'h1)])});
          reg11 <= ($unsigned((+(&{wire3, wire1}))) >= reg4[(2'h2):(1'h0)]);
        end
      else
        begin
          if ($signed($unsigned({{((7'h42) ? reg10 : reg7),
                  ((7'h40) ? (8'hb5) : reg11)}})))
            begin
              reg5 <= ($unsigned(reg10[(2'h3):(1'h0)]) ?
                  (($signed($signed(reg10)) || reg4[(2'h3):(1'h1)]) ?
                      ($unsigned((8'hb4)) || wire0) : $unsigned(($signed(reg9) < (^reg8)))) : $signed($signed(wire3)));
              reg6 <= (reg11[(3'h6):(2'h3)] ?
                  (|{{$signed(reg6)},
                      ($unsigned(reg9) ~^ reg9[(3'h4):(2'h2)])}) : reg8[(4'hb):(3'h5)]);
            end
          else
            begin
              reg5 <= $signed(({(^(|wire3))} ?
                  {reg9[(3'h5):(3'h5)],
                      (reg7[(3'h6):(2'h2)] & reg11)} : $unsigned({reg9[(3'h6):(1'h1)]})));
              reg6 <= (reg9[(4'ha):(2'h2)] ?
                  ((((wire1 - wire3) ?
                      wire2[(1'h1):(1'h0)] : (~reg10)) | {reg8[(3'h4):(2'h2)],
                      (^~wire0)}) != wire0[(4'h8):(3'h4)]) : $unsigned($unsigned(((reg7 ?
                          wire2 : wire3) ?
                      $unsigned((8'hb2)) : reg11[(3'h7):(1'h0)]))));
            end
          reg7 <= wire3;
          reg8 <= (reg6[(4'hf):(4'hb)] ? wire3[(3'h7):(3'h6)] : (8'h9c));
          if ({(((reg7[(3'h4):(3'h4)] >= $unsigned(reg8)) && ((8'hb1) | reg8[(2'h2):(1'h0)])) < (reg9 ?
                  {(|(8'hb7))} : (reg7[(2'h2):(1'h1)] ?
                      (reg4 == (8'hb8)) : $unsigned(reg4))))})
            begin
              reg9 <= $signed(wire2[(3'h7):(3'h6)]);
              reg10 <= (8'hbc);
              reg11 <= (~^(reg6[(2'h3):(1'h0)] || {reg11[(2'h3):(2'h3)]}));
            end
          else
            begin
              reg9 <= ($signed({(reg8 ? {reg10, (8'hb4)} : $unsigned(reg8)),
                      $signed($signed((8'hb3)))}) ?
                  ((((|reg11) ? reg7 : reg4) ?
                          ({reg7} << $signed(reg11)) : {{reg6, reg7}}) ?
                      ($signed($unsigned(reg8)) ?
                          wire0 : reg10) : $unsigned(wire0)) : $signed((+reg10)));
              reg10 <= reg8;
              reg11 <= reg10;
            end
          reg12 <= (((($unsigned(reg7) ?
                  ((8'hac) ?
                      wire1 : reg8) : wire3[(2'h3):(2'h3)]) ^ reg6[(4'hc):(4'h8)]) * (^~$unsigned((wire2 ?
                  wire1 : reg11)))) ?
              $unsigned((wire3[(3'h6):(3'h4)] ?
                  $unsigned($unsigned((8'ha5))) : (8'hb9))) : (reg5 ?
                  ($signed((reg10 >>> (8'ha3))) ~^ ((wire1 >> reg4) | ((8'haf) ?
                      wire2 : reg6))) : ($signed($signed(reg4)) >>> $unsigned(((8'hbd) + reg6)))));
        end
    end
  always
    @(posedge clk) begin
      reg13 <= (-(($unsigned($signed(reg12)) ?
          ((wire2 || reg12) ?
              (^reg8) : (reg10 > reg10)) : reg7) ^ $unsigned(reg9[(3'h7):(3'h4)])));
    end
  assign wire14 = wire3;
  always
    @(posedge clk) begin
      if (($signed(wire0) ?
          reg10 : ((reg8 ? $unsigned({reg5}) : $signed((reg10 <<< wire1))) ?
              (~&$unsigned((!reg5))) : reg4[(2'h2):(2'h2)])))
        begin
          reg15 <= ($unsigned(((-reg5) | (|(reg4 && reg9)))) ?
              ((((reg5 ? reg4 : reg7) >>> {reg13}) * ($unsigned(reg8) == (reg7 ?
                  reg12 : (8'hbd)))) ~^ (+$signed((~|wire1)))) : ((reg13 ^ $unsigned(reg11)) >>> (((reg7 ?
                      reg4 : reg12) | $unsigned(reg8)) ?
                  wire3[(4'ha):(2'h3)] : {(reg11 - reg4),
                      reg10[(1'h0):(1'h0)]})));
          if ($signed(wire0[(4'he):(2'h2)]))
            begin
              reg16 <= $unsigned((^reg11[(3'h5):(2'h3)]));
              reg17 <= $signed((reg4 - $unsigned(wire1)));
              reg18 <= wire2[(3'h4):(1'h0)];
              reg19 <= $signed($unsigned($unsigned($signed($unsigned(reg8)))));
              reg20 <= reg12;
            end
          else
            begin
              reg16 <= wire1;
              reg17 <= (reg7[(3'h4):(2'h3)] <= ($signed({reg17, (!(8'hbc))}) ?
                  wire14 : $signed($unsigned((^wire2)))));
              reg18 <= wire2;
            end
          reg21 <= $signed(reg13);
        end
      else
        begin
          reg15 <= $unsigned($signed($unsigned($unsigned($unsigned(reg4)))));
          if ($unsigned((reg4[(2'h2):(1'h1)] || {((reg20 | reg12) | (wire0 ?
                  reg15 : reg19))})))
            begin
              reg16 <= wire14;
              reg17 <= (~|wire1[(2'h3):(2'h3)]);
              reg18 <= reg7;
              reg19 <= ($signed($unsigned(((8'hbb) ?
                  reg7 : (reg17 ^ reg7)))) >= $unsigned(reg21[(1'h1):(1'h1)]));
              reg20 <= $signed($signed({$unsigned((reg12 ^ reg5))}));
            end
          else
            begin
              reg16 <= $unsigned(reg6);
              reg17 <= $unsigned($unsigned(reg16[(2'h2):(1'h1)]));
            end
          if ((((~^wire2) ?
              $unsigned($signed($signed(reg15))) : (~$signed((reg8 ?
                  reg15 : wire3)))) <<< reg6[(3'h5):(3'h5)]))
            begin
              reg21 <= reg13;
              reg22 <= (reg11[(4'hd):(3'h5)] - (~&({{wire2}, $signed(reg10)} ?
                  {(reg17 ? reg20 : (8'hb9))} : $unsigned(reg16))));
              reg23 <= (~^$signed($signed((((7'h40) ?
                  reg9 : reg22) == (reg16 < reg4)))));
            end
          else
            begin
              reg21 <= ($unsigned({$signed(wire3), ((8'haf) ? reg18 : reg16)}) ?
                  (8'ha0) : ($signed($signed($signed(wire3))) ^ reg16));
              reg22 <= (^~reg19[(2'h2):(1'h1)]);
              reg23 <= $unsigned((($signed($signed(reg8)) <= (reg7[(4'h9):(3'h7)] ?
                  reg16 : (~^reg7))) >= {{((8'haa) ? reg23 : reg19)},
                  $signed(reg23[(3'h5):(1'h0)])}));
              reg24 <= (({$signed($unsigned(reg7)),
                      (wire0 ? wire1[(4'hb):(2'h3)] : reg19[(1'h1):(1'h0)])} ?
                  reg12[(2'h3):(2'h2)] : (~^wire1)) <= reg12);
              reg25 <= $signed($unsigned($unsigned((reg13 ?
                  $unsigned(reg9) : (reg18 ? reg8 : reg6)))));
            end
          reg26 <= $signed((~|reg9[(3'h6):(1'h0)]));
        end
    end
  assign wire27 = ({$unsigned(({reg8} ? reg15 : $signed(reg18))),
                      $signed($signed((8'hb3)))} || (&wire0));
  assign wire28 = ($unsigned((wire27[(5'h13):(2'h3)] == $signed(wire27))) != $unsigned($signed(reg9[(4'h9):(4'h8)])));
  always
    @(posedge clk) begin
      if (((&reg4) + ((&$signed((reg5 ?
          wire2 : wire0))) ^~ reg23[(2'h2):(2'h2)])))
        begin
          reg29 <= $signed((&reg13[(1'h1):(1'h1)]));
          reg30 <= reg26;
          reg31 <= (^($unsigned({{wire2, reg6},
              {(8'ha3), wire3}}) <= (~((reg17 ? (8'hbf) : reg29) & (^reg7)))));
        end
      else
        begin
          reg29 <= (+reg7[(2'h3):(2'h3)]);
          reg30 <= reg20;
          reg31 <= (-((&$signed($signed(wire2))) ? wire2 : reg12));
          if (reg21)
            begin
              reg32 <= ($signed(wire28[(2'h3):(2'h2)]) & (reg4[(3'h5):(2'h3)] ?
                  wire27[(2'h2):(1'h0)] : $signed($unsigned((~reg4)))));
            end
          else
            begin
              reg32 <= (($signed((((8'hb6) ? (8'h9e) : reg4) ?
                          (!reg13) : (7'h41))) ?
                      $signed(reg19[(1'h0):(1'h0)]) : (reg32 | {reg7, reg18})) ?
                  ((^~reg25) < $unsigned($unsigned({reg22}))) : (&(-((^reg13) ?
                      $unsigned(wire27) : $signed(reg10)))));
              reg33 <= {$unsigned($signed($signed(reg5[(2'h3):(1'h0)])))};
              reg34 <= ((~|reg18) ?
                  {$unsigned($unsigned(((8'hb0) >= (8'hb3))))} : $signed($signed(($signed(reg6) - (reg17 ?
                      wire1 : reg17)))));
            end
        end
      reg35 <= {{($unsigned((^~reg7)) & ($unsigned(reg4) <= (reg17 >= (7'h41))))},
          reg24[(3'h5):(1'h0)]};
    end
  assign wire36 = reg25[(5'h11):(5'h11)];
  assign wire37 = $unsigned($signed($signed($signed($unsigned(reg34)))));
  assign wire38 = $unsigned((8'hb9));
  module39 #() modinst266 (.wire42(wire1), .y(wire265), .wire41(reg23), .clk(clk), .wire43(reg7), .wire40(reg10));
  module44 #() modinst268 (wire267, clk, wire1, reg19, reg23, reg35, reg20);
  module180 #() modinst270 (.wire184(reg35), .wire183(reg24), .wire181(wire36), .y(wire269), .clk(clk), .wire182(wire0));
endmodule

module module39
#(parameter param263 = {(~^({(~(8'hba))} ? (((8'had) + (8'h9c)) ? ((7'h40) ^ (8'hbb)) : ((8'ha0) == (8'ha1))) : ((~(8'h9c)) - {(8'hb1), (8'ha9)}))), (&(-((~&(8'hb9)) ? ((8'h9c) ? (7'h44) : (8'hbf)) : {(8'hba), (8'hb7)})))}, 
parameter param264 = (~&((((param263 != param263) ? param263 : param263) && ((-param263) && param263)) ? param263 : ((&(!(8'h9c))) > (8'hbb)))))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h1f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire43;
  input wire signed [(5'h14):(1'h0)] wire42;
  input wire [(5'h14):(1'h0)] wire41;
  input wire [(5'h13):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire262;
  wire [(4'hb):(1'h0)] wire256;
  wire [(5'h12):(1'h0)] wire253;
  wire [(3'h7):(1'h0)] wire231;
  wire signed [(5'h10):(1'h0)] wire230;
  wire [(4'hf):(1'h0)] wire228;
  wire signed [(3'h5):(1'h0)] wire179;
  wire signed [(4'hc):(1'h0)] wire178;
  wire signed [(5'h11):(1'h0)] wire176;
  wire signed [(4'h9):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire125;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire89;
  reg [(3'h5):(1'h0)] reg261 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg260 = (1'h0);
  reg [(5'h12):(1'h0)] reg259 = (1'h0);
  reg [(5'h15):(1'h0)] reg258 = (1'h0);
  reg [(3'h6):(1'h0)] reg257 = (1'h0);
  reg [(3'h6):(1'h0)] reg255 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(5'h13):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  assign y = {wire262,
                 wire256,
                 wire253,
                 wire231,
                 wire230,
                 wire228,
                 wire179,
                 wire178,
                 wire176,
                 wire126,
                 wire125,
                 wire120,
                 wire89,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg255,
                 reg129,
                 reg128,
                 reg127,
                 reg124,
                 reg123,
                 reg122,
                 reg104,
                 reg103,
                 reg102,
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
                 (1'h0)};
  module44 #() modinst90 (.wire49(wire40), .wire46(wire41), .clk(clk), .wire48(wire43), .wire47(wire42), .wire45((7'h40)), .y(wire89));
  always
    @(posedge clk) begin
      reg91 <= wire43[(4'hd):(4'hd)];
      if ($unsigned(wire89[(4'h9):(3'h7)]))
        begin
          if ((((wire40 ?
                  $signed(wire89[(4'h8):(3'h4)]) : ($signed(wire43) ^~ (wire40 - wire41))) ?
              (((wire42 ? wire40 : wire42) && ((8'ha8) < (8'ha9))) ?
                  wire89 : $unsigned((-wire89))) : (($signed((8'h9e)) >> $unsigned(wire41)) || wire41)) == wire89))
            begin
              reg92 <= ((^~$unsigned((wire89[(3'h5):(2'h2)] >= wire40))) >= wire42);
              reg93 <= {reg91[(1'h0):(1'h0)]};
              reg94 <= {reg92[(1'h1):(1'h0)],
                  (((reg92 != (wire43 ^ reg91)) >= ($unsigned(wire42) > (wire89 ?
                          reg92 : reg91))) ?
                      ((!{wire89, wire89}) | $signed({(8'hbc),
                          wire89})) : reg91[(4'he):(4'h8)])};
              reg95 <= (+($unsigned((~&{reg94})) <= ({$unsigned(reg91),
                      wire41} ?
                  (wire40[(2'h3):(2'h3)] ~^ reg93[(3'h6):(3'h6)]) : $unsigned((wire43 ?
                      wire43 : wire43)))));
            end
          else
            begin
              reg92 <= ((((~|wire41) * {((8'hb1) ?
                      wire40 : wire43)}) >= (reg91[(1'h1):(1'h1)] != ((wire42 ?
                  wire42 : (8'hb9)) && reg95))) ^ (~^(reg92[(1'h1):(1'h1)] + (~^wire89[(4'h9):(4'h9)]))));
            end
          reg96 <= $unsigned($signed(({$unsigned(reg91), $unsigned(wire42)} ?
              wire43[(4'hc):(4'h8)] : (-(reg91 | wire89)))));
          reg97 <= {$unsigned(reg94[(4'h8):(4'h8)])};
          reg98 <= (wire89 ^ reg92[(1'h0):(1'h0)]);
        end
      else
        begin
          if ((($unsigned(((reg97 ? wire43 : reg92) ~^ (reg96 ?
                  (8'ha3) : wire41))) ?
              (8'hb7) : ((&$unsigned(wire40)) ?
                  ($signed((8'hb1)) ?
                      (wire41 ?
                          wire89 : reg96) : $unsigned(reg91)) : reg97[(1'h1):(1'h1)])) < $unsigned(reg95)))
            begin
              reg92 <= ((reg95 <= $signed((^$unsigned(reg97)))) ?
                  {reg98[(3'h7):(3'h7)]} : ((8'hbd) ?
                      (reg92 || (^~(reg93 ?
                          (8'ha5) : reg91))) : reg96[(2'h3):(1'h0)]));
              reg93 <= ((reg98[(1'h1):(1'h0)] || wire41) ?
                  {wire41[(1'h0):(1'h0)]} : wire41[(4'h8):(1'h1)]);
            end
          else
            begin
              reg92 <= $unsigned(((&reg94[(1'h0):(1'h0)]) ?
                  (($signed(wire40) <= wire89) <= wire89) : wire40));
              reg93 <= $unsigned({$unsigned($signed((^reg93))), wire42});
              reg94 <= ($unsigned($signed(reg95)) * $signed((~&$unsigned($unsigned(reg94)))));
              reg95 <= $unsigned(wire42[(4'hb):(3'h4)]);
              reg96 <= {((reg93 ?
                      (~^wire40[(3'h7):(1'h1)]) : $unsigned((wire42 ?
                          (8'hb2) : wire43))) ^ (8'hb9))};
            end
          if (reg97[(5'h11):(2'h3)])
            begin
              reg97 <= (wire43 | wire43);
              reg98 <= wire42[(1'h0):(1'h0)];
              reg99 <= ({reg92} * (8'hb1));
              reg100 <= $unsigned($signed(reg94[(3'h5):(1'h1)]));
            end
          else
            begin
              reg97 <= (((reg91 < wire41[(4'hb):(3'h7)]) ?
                  ({((8'haf) ~^ wire40), $signed(wire42)} ?
                      ((reg96 - reg100) ?
                          wire41[(4'h9):(1'h0)] : ((8'haf) ?
                              reg99 : reg98)) : ($unsigned((8'hb5)) - $unsigned(reg94))) : (8'h9d)) - $unsigned({wire41[(3'h7):(3'h5)],
                  {(reg94 ? reg99 : reg92), (wire40 ? reg94 : reg96)}}));
              reg98 <= (~^((reg91[(1'h0):(1'h0)] ^~ $signed($unsigned(wire40))) ?
                  reg97[(1'h0):(1'h0)] : ($signed((-reg100)) ~^ $unsigned($signed(wire42)))));
              reg99 <= {({$unsigned(reg92[(2'h2):(2'h2)]), $signed((~^reg98))} ?
                      reg97 : (($signed(reg98) ?
                          $unsigned(reg91) : {reg95,
                              wire42}) ^~ wire43[(4'ha):(1'h0)])),
                  wire89[(4'h8):(3'h5)]};
              reg100 <= (~&$signed((~(^~(reg92 ^ wire89)))));
            end
        end
      reg101 <= $signed(reg91);
      if ((reg97 <<< (~&$signed($signed((wire43 ? reg94 : wire89))))))
        begin
          reg102 <= $signed((-reg91[(4'hc):(4'hb)]));
          reg103 <= $unsigned(reg91);
          reg104 <= {((((reg99 + reg95) || reg98) ?
                  $signed((8'hb4)) : reg103) ~^ (wire40 ?
                  reg102[(1'h0):(1'h0)] : reg101[(2'h2):(1'h1)])),
              $signed((~|(&(reg94 != wire40))))};
        end
      else
        begin
          reg102 <= (wire41 ? (~$unsigned(reg99)) : (&reg102));
          reg103 <= $signed((+(!$signed(reg91[(5'h12):(5'h12)]))));
          reg104 <= $signed((wire41[(4'hd):(4'h8)] << (+reg94)));
        end
    end
  module105 #() modinst121 (.wire109(reg98), .wire107(reg103), .wire108(reg100), .wire106(reg101), .y(wire120), .clk(clk));
  always
    @(posedge clk) begin
      reg122 <= ((reg93[(1'h0):(1'h0)] ?
          (^(~&$unsigned(reg97))) : (~&$signed(reg94[(2'h3):(2'h3)]))) <= reg92);
      reg123 <= reg99[(2'h3):(1'h0)];
      reg124 <= (wire41 <= ((+$unsigned({reg101, wire43})) ?
          $unsigned((^$unsigned(reg122))) : wire42));
    end
  assign wire125 = reg91;
  assign wire126 = {(8'hbf), wire42};
  always
    @(posedge clk) begin
      reg127 <= (+{((reg91[(4'h9):(3'h7)] | (wire89 ? reg96 : (7'h41))) ?
              ({reg91} ~^ reg123[(2'h2):(1'h0)]) : wire89[(4'hb):(3'h7)]),
          ((wire43 ?
              (reg124 != reg98) : ((7'h43) <<< reg92)) & reg95[(1'h0):(1'h0)])});
      reg128 <= (^~$unsigned((~^$unsigned($signed(wire126)))));
      reg129 <= (^((^~($unsigned(wire89) ?
          (^~reg102) : (wire125 << wire89))) >= wire125));
    end
  module130 #() modinst177 (wire176, clk, reg98, reg122, wire89, wire120);
  assign wire178 = (~&($signed($unsigned((reg127 && reg124))) != $unsigned(reg99)));
  assign wire179 = reg102[(1'h1):(1'h0)];
  module180 #() modinst229 (.wire183(reg123), .wire182(reg95), .wire181(reg103), .wire184(reg93), .clk(clk), .y(wire228));
  assign wire230 = $unsigned(wire42[(4'he):(4'hb)]);
  assign wire231 = {$unsigned($signed(reg100)),
                       $signed((($unsigned(reg94) >> $signed((8'hbf))) <= reg99[(3'h5):(2'h2)]))};
  module232 #() modinst254 (.wire235(reg97), .y(wire253), .wire236(reg96), .wire234(reg99), .clk(clk), .wire233(reg92));
  always
    @(posedge clk) begin
      reg255 <= $signed(wire179);
    end
  assign wire256 = ((~|(((reg103 ?
                           wire125 : wire179) + wire120[(2'h3):(1'h1)]) > ($signed(wire228) ?
                           $unsigned(reg102) : (8'hb9)))) ?
                       reg124[(2'h3):(1'h0)] : (-$signed((!$signed((8'hb6))))));
  always
    @(posedge clk) begin
      reg257 <= ((^~((|$unsigned(wire228)) + (^reg99))) ?
          $unsigned($signed($signed($unsigned((8'ha3))))) : (~|wire228[(4'h8):(1'h0)]));
      reg258 <= wire125[(3'h7):(1'h1)];
      if ((^{wire176[(4'ha):(4'h8)]}))
        begin
          reg259 <= (!(~^$signed(wire43)));
          if (((!(reg255 ?
              reg129[(2'h3):(2'h3)] : $signed((reg98 ?
                  wire120 : (8'h9e))))) == (((((7'h44) ? wire43 : reg98) ?
                  wire41 : ((7'h44) << wire228)) ?
              $signed((reg95 ?
                  reg257 : wire178)) : $signed((^reg92))) + ((reg124[(3'h4):(2'h3)] && $signed(reg127)) ?
              (reg257 < $signed(reg102)) : wire253[(4'hb):(1'h1)]))))
            begin
              reg260 <= $signed(((wire41 & (8'hb2)) + {$signed((~|wire253))}));
              reg261 <= wire120[(2'h2):(1'h1)];
            end
          else
            begin
              reg260 <= $signed((reg129 ?
                  {(-wire231[(1'h1):(1'h0)]),
                      ((&wire176) >= $signed(wire231))} : (~^reg129)));
              reg261 <= reg260[(4'h8):(4'h8)];
            end
        end
      else
        begin
          reg259 <= {($unsigned($signed((wire231 ?
                  reg128 : (8'hab)))) | $signed((+wire228[(3'h6):(3'h4)])))};
        end
    end
  assign wire262 = {$signed({wire41[(2'h3):(2'h3)],
                           $unsigned({reg99, reg124})}),
                       (-{wire230, (+$signed((8'hbd)))})};
endmodule

module module232  (y, clk, wire236, wire235, wire234, wire233);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire236;
  input wire [(4'hf):(1'h0)] wire235;
  input wire [(4'he):(1'h0)] wire234;
  input wire [(3'h4):(1'h0)] wire233;
  wire [(5'h11):(1'h0)] wire252;
  wire [(3'h6):(1'h0)] wire251;
  wire [(3'h4):(1'h0)] wire250;
  wire [(4'h8):(1'h0)] wire249;
  wire signed [(4'hf):(1'h0)] wire248;
  wire signed [(4'hc):(1'h0)] wire247;
  wire [(4'hd):(1'h0)] wire246;
  wire [(4'hc):(1'h0)] wire245;
  wire signed [(5'h13):(1'h0)] wire244;
  wire [(5'h11):(1'h0)] wire243;
  wire [(5'h13):(1'h0)] wire242;
  wire [(5'h11):(1'h0)] wire238;
  wire [(3'h7):(1'h0)] wire237;
  reg signed [(5'h14):(1'h0)] reg241 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg240 = (1'h0);
  reg [(4'hf):(1'h0)] reg239 = (1'h0);
  assign y = {wire252,
                 wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire238,
                 wire237,
                 reg241,
                 reg240,
                 reg239,
                 (1'h0)};
  assign wire237 = $signed({$unsigned((wire236[(1'h0):(1'h0)] ?
                           wire233 : $unsigned(wire235))),
                       ({(wire235 >> wire234)} * ($unsigned(wire233) ~^ {wire236}))});
  assign wire238 = (+wire233[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg239 <= wire234[(4'hd):(4'ha)];
      reg240 <= ((8'hae) || $unsigned(wire235));
      reg241 <= {reg240[(2'h2):(2'h2)],
          (((wire235[(1'h1):(1'h0)] & wire234) ?
                  ((^wire234) ?
                      ((8'hbc) ? reg239 : wire235) : wire233) : ((!wire233) ?
                      (~^reg240) : {(7'h41)})) ?
              wire234[(3'h6):(2'h2)] : wire233[(2'h2):(1'h1)])};
    end
  assign wire242 = ($unsigned((($signed(wire234) ~^ (reg239 ?
                               wire236 : wire236)) ?
                           wire235[(4'hd):(2'h2)] : (reg241 >= (~&wire238)))) ?
                       reg239[(4'he):(4'hd)] : ({(^~wire233[(2'h2):(2'h2)])} ?
                           ($unsigned((wire233 ?
                               reg241 : wire233)) ~^ $signed((-reg239))) : ($signed($signed(reg240)) >> $signed((wire234 ?
                               reg241 : wire237)))));
  assign wire243 = $unsigned((|$unsigned(reg240)));
  assign wire244 = wire238;
  assign wire245 = $unsigned(wire242[(3'h4):(2'h3)]);
  assign wire246 = reg241;
  assign wire247 = (^~(reg241 >> (8'had)));
  assign wire248 = ({$unsigned($unsigned(wire234[(2'h2):(2'h2)])),
                           {((reg240 * wire247) ^ (~|(8'hac))),
                               $signed($unsigned((8'hb0)))}} ?
                       wire244 : wire237);
  assign wire249 = (&wire246[(4'hb):(2'h2)]);
  assign wire250 = (wire243 ? $signed($signed($signed({wire243}))) : wire248);
  assign wire251 = $unsigned($unsigned($unsigned((wire242[(1'h1):(1'h1)] ?
                       {(8'ha2)} : wire236))));
  assign wire252 = {wire236[(2'h2):(1'h1)],
                       (wire242 ?
                           $unsigned(((wire248 ? wire249 : wire249) ?
                               {reg241} : (reg241 | wire234))) : $signed(((~^wire249) ?
                               reg241 : $unsigned(wire251))))};
endmodule

module module180  (y, clk, wire184, wire183, wire182, wire181);
  output wire [(32'h1fd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire184;
  input wire signed [(2'h2):(1'h0)] wire183;
  input wire [(4'he):(1'h0)] wire182;
  input wire signed [(4'h9):(1'h0)] wire181;
  wire [(4'ha):(1'h0)] wire218;
  wire [(4'hb):(1'h0)] wire217;
  wire [(2'h2):(1'h0)] wire216;
  wire signed [(4'hf):(1'h0)] wire215;
  wire [(3'h5):(1'h0)] wire214;
  wire [(4'ha):(1'h0)] wire213;
  wire [(4'hf):(1'h0)] wire212;
  wire signed [(3'h4):(1'h0)] wire211;
  wire [(4'h8):(1'h0)] wire210;
  wire signed [(2'h3):(1'h0)] wire209;
  wire signed [(4'hf):(1'h0)] wire208;
  wire [(4'hb):(1'h0)] wire204;
  wire [(4'he):(1'h0)] wire203;
  wire signed [(5'h11):(1'h0)] wire201;
  wire [(5'h11):(1'h0)] wire189;
  wire [(4'hc):(1'h0)] wire188;
  wire [(3'h6):(1'h0)] wire187;
  wire signed [(5'h13):(1'h0)] wire186;
  wire [(3'h4):(1'h0)] wire185;
  reg signed [(4'h8):(1'h0)] reg227 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg226 = (1'h0);
  reg [(4'he):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg223 = (1'h0);
  reg [(5'h13):(1'h0)] reg222 = (1'h0);
  reg [(5'h10):(1'h0)] reg221 = (1'h0);
  reg [(5'h14):(1'h0)] reg220 = (1'h0);
  reg [(3'h5):(1'h0)] reg219 = (1'h0);
  reg [(5'h10):(1'h0)] reg207 = (1'h0);
  reg [(4'he):(1'h0)] reg206 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg205 = (1'h0);
  reg [(3'h6):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg200 = (1'h0);
  reg [(4'hb):(1'h0)] reg199 = (1'h0);
  reg [(5'h13):(1'h0)] reg198 = (1'h0);
  reg [(4'h8):(1'h0)] reg197 = (1'h0);
  reg [(5'h15):(1'h0)] reg196 = (1'h0);
  reg [(4'hc):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg194 = (1'h0);
  reg [(4'h8):(1'h0)] reg193 = (1'h0);
  reg [(5'h12):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg191 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg190 = (1'h0);
  assign y = {wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire204,
                 wire203,
                 wire201,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg207,
                 reg206,
                 reg205,
                 reg202,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 (1'h0)};
  assign wire185 = $unsigned((!(((wire183 ?
                       wire183 : wire181) != (wire184 || wire183)) ^ wire181)));
  assign wire186 = wire183[(1'h1):(1'h0)];
  assign wire187 = ($signed($unsigned((~(wire182 ?
                       wire183 : wire184)))) * {($signed((wire184 - (8'hae))) - $unsigned(wire181[(3'h6):(3'h5)])),
                       $signed((wire186[(5'h12):(4'ha)] > $signed(wire186)))});
  assign wire188 = $signed((wire187 ?
                       ((^~((8'ha8) ? wire181 : wire187)) ?
                           {wire181} : wire183[(1'h1):(1'h0)]) : (^~((wire186 ?
                               wire186 : wire186) ?
                           wire185 : (wire186 ? wire184 : wire187)))));
  assign wire189 = (+$signed(wire182));
  always
    @(posedge clk) begin
      reg190 <= wire188;
      if ($signed(wire185))
        begin
          reg191 <= wire185;
          if ($unsigned($signed({(+(-wire189)), (~$signed(wire184))})))
            begin
              reg192 <= wire183[(2'h2):(1'h0)];
              reg193 <= $signed((!$unsigned(($signed((8'ha3)) ?
                  {wire187} : {wire185}))));
            end
          else
            begin
              reg192 <= $unsigned(wire188);
              reg193 <= $unsigned($signed($unsigned((~|$unsigned((7'h41))))));
              reg194 <= wire182[(4'h8):(1'h1)];
            end
          reg195 <= $signed($signed((($signed((8'hbd)) ?
                  $signed(wire182) : wire189) ?
              ({wire183, wire185} ~^ $signed(wire183)) : $signed(wire184))));
          reg196 <= ($unsigned({wire181,
              ($signed(reg190) ?
                  (wire183 ?
                      wire187 : (8'hbe)) : $signed(wire186))}) >= $unsigned(($unsigned($unsigned(wire181)) ?
              ($unsigned(wire187) ?
                  $unsigned(wire187) : (!(8'hba))) : (~|$unsigned(reg194)))));
          if ((~&$signed(reg192[(4'he):(4'h8)])))
            begin
              reg197 <= ((wire185 ?
                      $signed($unsigned((wire187 ?
                          wire183 : wire182))) : wire183[(2'h2):(1'h1)]) ?
                  $signed((wire186[(4'hf):(4'h9)] || reg195)) : (+{wire186[(2'h3):(1'h0)]}));
              reg198 <= ((-(&$signed($unsigned((8'hba))))) ?
                  $signed((+$signed(reg190[(2'h2):(2'h2)]))) : $unsigned($signed($unsigned({wire185,
                      wire186}))));
              reg199 <= ($unsigned(($signed((~^reg198)) >>> wire182)) << (reg190 || (wire181[(1'h0):(1'h0)] ?
                  (wire188 ^ reg195) : ((wire186 >>> wire181) <= $unsigned(reg198)))));
              reg200 <= (!(~^reg199[(1'h0):(1'h0)]));
            end
          else
            begin
              reg197 <= (~&wire188[(4'h9):(3'h4)]);
              reg198 <= {wire188};
              reg199 <= wire182;
            end
        end
      else
        begin
          reg191 <= (reg197 ?
              reg198[(2'h3):(1'h0)] : ($signed($unsigned((+reg196))) ?
                  {$unsigned((wire184 << wire185))} : (($unsigned(wire184) ~^ wire187) + (^~(wire187 > wire183)))));
        end
    end
  assign wire201 = {(8'hab), $signed(wire189[(5'h10):(1'h0)])};
  always
    @(posedge clk) begin
      reg202 <= {wire181,
          (-($signed((reg196 ? reg190 : wire186)) ~^ {(~&reg191)}))};
    end
  assign wire203 = ((-(^wire184[(4'hd):(4'hc)])) ?
                       (wire181 & (($unsigned((8'hae)) ?
                           wire184 : $unsigned(reg191)) <<< $unsigned($unsigned(reg196)))) : (reg192[(4'hb):(3'h6)] ?
                           $unsigned($unsigned((wire185 ?
                               wire188 : wire181))) : wire183));
  assign wire204 = {({$signed((reg202 ?
                               reg196 : reg190))} << $unsigned({(wire181 & wire203),
                           (reg192 ? reg192 : reg194)}))};
  always
    @(posedge clk) begin
      reg205 <= wire181;
      reg206 <= reg195;
      reg207 <= ((~|{({(8'hb8)} ? wire185[(1'h1):(1'h1)] : $unsigned(reg191)),
          reg198}) && (8'hab));
    end
  assign wire208 = (&($unsigned(wire188[(3'h7):(3'h5)]) ?
                       $signed(reg205[(3'h4):(3'h4)]) : (-$signed($signed(wire181)))));
  assign wire209 = reg199[(3'h4):(3'h4)];
  assign wire210 = (wire209 > $unsigned({((wire189 + reg207) ?
                           (reg197 | wire187) : (reg193 >>> reg200))}));
  assign wire211 = {wire183};
  assign wire212 = (^~(((8'hab) ?
                       {(reg193 ? wire182 : reg194)} : ((&wire188) ?
                           reg190 : {reg197,
                               reg196})) && (&wire187[(3'h6):(3'h5)])));
  assign wire213 = $unsigned(({$unsigned($unsigned((8'hbf)))} & reg191));
  assign wire214 = wire189;
  assign wire215 = (8'hba);
  assign wire216 = {({({reg195, wire209} ?
                               {wire183} : wire208[(4'hc):(3'h4)])} << (wire183 || ($unsigned(wire215) ~^ wire211[(2'h3):(1'h0)]))),
                       ((!$signed(wire213[(2'h3):(1'h0)])) ?
                           {(~|wire182)} : $signed(((~(8'hb7)) * wire213)))};
  assign wire217 = $unsigned($signed(($unsigned($unsigned(wire204)) >>> {wire182})));
  assign wire218 = ((8'hb3) ?
                       $unsigned(reg191[(4'h9):(1'h1)]) : $signed((reg190[(1'h0):(1'h0)] ?
                           wire217[(3'h6):(2'h2)] : ((wire209 == wire210) ?
                               $signed(reg191) : $signed(wire204)))));
  always
    @(posedge clk) begin
      reg219 <= $signed(($unsigned(reg193) ?
          ({$unsigned(reg205),
              reg195[(4'hc):(3'h5)]} >>> ($unsigned((8'hb5)) >>> (reg194 <= reg207))) : ($unsigned(reg191[(1'h0):(1'h0)]) <= (8'ha6))));
      if ((wire189[(4'he):(4'h8)] ? (8'ha1) : $signed(wire185)))
        begin
          reg220 <= $signed(wire211);
          reg221 <= reg206;
          reg222 <= wire209;
          reg223 <= wire214[(2'h3):(2'h2)];
          reg224 <= ({(~$unsigned($signed(reg198)))} | $unsigned($unsigned(reg207[(5'h10):(1'h0)])));
        end
      else
        begin
          reg220 <= (reg221 ~^ ((~(&$unsigned(wire217))) ?
              $unsigned(($unsigned(reg221) ?
                  $signed((8'hbd)) : ((8'hbf) ? reg194 : reg221))) : reg196));
          reg221 <= (reg195[(4'hb):(1'h0)] - $unsigned(reg190[(2'h2):(1'h0)]));
          reg222 <= (((reg200 - wire188[(1'h0):(1'h0)]) | (~|{$unsigned(reg223),
                  $unsigned((8'ha2))})) ?
              ((-$unsigned(reg222[(3'h4):(2'h3)])) ?
                  $unsigned(($signed(wire213) << $unsigned(reg220))) : (^~(~^(reg194 ?
                      wire185 : (8'hb4))))) : $unsigned(($signed(wire182[(2'h3):(2'h3)]) ?
                  {(reg222 ? wire186 : reg194), reg193} : {(wire218 ?
                          reg197 : (8'haf))})));
          reg223 <= reg197[(1'h0):(1'h0)];
          reg224 <= (!{((^((8'hac) | wire187)) | $unsigned((~&wire184))),
              (~$signed((reg205 ? reg224 : (8'hb7))))});
        end
      reg225 <= ($unsigned(reg197[(2'h3):(2'h3)]) >= reg195[(4'ha):(2'h3)]);
      reg226 <= $unsigned((wire217 + $signed({reg197})));
      reg227 <= $signed((reg225 ?
          reg202 : (((reg198 ? reg192 : wire211) ?
              ((8'hba) >= (8'hbb)) : $signed(wire215)) ^ wire213[(1'h0):(1'h0)])));
    end
endmodule

module module130
#(parameter param174 = (8'ha8), 
parameter param175 = param174)
(y, clk, wire134, wire133, wire132, wire131);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire134;
  input wire [(5'h11):(1'h0)] wire133;
  input wire signed [(4'h8):(1'h0)] wire132;
  input wire [(4'hc):(1'h0)] wire131;
  wire signed [(4'hb):(1'h0)] wire173;
  wire signed [(2'h3):(1'h0)] wire172;
  wire signed [(4'ha):(1'h0)] wire171;
  wire signed [(3'h4):(1'h0)] wire170;
  wire signed [(3'h4):(1'h0)] wire169;
  wire signed [(4'hc):(1'h0)] wire159;
  wire [(2'h2):(1'h0)] wire158;
  wire [(3'h6):(1'h0)] wire157;
  wire [(4'ha):(1'h0)] wire156;
  wire signed [(2'h2):(1'h0)] wire155;
  wire [(4'h8):(1'h0)] wire144;
  wire signed [(5'h12):(1'h0)] wire143;
  wire [(4'hf):(1'h0)] wire142;
  wire [(5'h10):(1'h0)] wire141;
  wire signed [(4'hc):(1'h0)] wire140;
  wire [(4'ha):(1'h0)] wire139;
  wire [(4'he):(1'h0)] wire138;
  wire signed [(4'ha):(1'h0)] wire137;
  wire [(4'h9):(1'h0)] wire136;
  wire signed [(3'h6):(1'h0)] wire135;
  reg [(5'h13):(1'h0)] reg168 = (1'h0);
  reg [(5'h12):(1'h0)] reg167 = (1'h0);
  reg [(2'h2):(1'h0)] reg166 = (1'h0);
  reg [(2'h3):(1'h0)] reg165 = (1'h0);
  reg [(4'he):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg163 = (1'h0);
  reg [(4'hf):(1'h0)] reg162 = (1'h0);
  reg [(4'ha):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg152 = (1'h0);
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg149 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  reg signed [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(4'ha):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg145 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire135 = $unsigned((+{wire131[(2'h3):(2'h3)]}));
  assign wire136 = wire135[(1'h1):(1'h1)];
  assign wire137 = (~&wire134[(3'h6):(2'h3)]);
  assign wire138 = ({{$signed($signed(wire132))}} >> wire133);
  assign wire139 = (({{(8'ha3)},
                           $unsigned(wire138[(3'h5):(3'h5)])} != ($unsigned((+(8'hbb))) ?
                           $signed($unsigned(wire138)) : (^$unsigned(wire134)))) ?
                       wire134[(4'h9):(3'h7)] : (-wire138));
  assign wire140 = ((~&$signed(({(8'hb9), wire138} >= (+wire133)))) - wire139);
  assign wire141 = $signed((wire139 <= wire138));
  assign wire142 = (wire131 >> (wire136 >> wire137[(3'h5):(1'h1)]));
  assign wire143 = $signed((|(wire137 <<< {(wire139 | wire135), wire139})));
  assign wire144 = wire134[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg145 <= wire143;
      reg146 <= wire136;
      if ($unsigned(($unsigned($signed($unsigned(wire138))) ?
          (^~((+wire141) ?
              (|wire144) : wire132[(3'h7):(3'h7)])) : wire131[(1'h0):(1'h0)])))
        begin
          reg147 <= $signed(reg146);
          reg148 <= {$unsigned(wire144)};
          reg149 <= $unsigned(wire141);
          if ($signed(reg147[(4'hd):(4'hb)]))
            begin
              reg150 <= wire133;
              reg151 <= $signed((~&$signed((~wire141[(4'hd):(4'hc)]))));
              reg152 <= wire136[(3'h4):(2'h2)];
            end
          else
            begin
              reg150 <= ($unsigned($unsigned(reg152)) ?
                  (~|(&(8'ha5))) : (8'hb2));
              reg151 <= {({reg152, (-wire136)} ?
                      $signed($signed((-reg148))) : (reg147 ?
                          $unsigned(wire139[(3'h5):(2'h3)]) : wire136[(4'h9):(2'h2)])),
                  ((8'hb7) ^ {$signed(wire140)})};
              reg152 <= (wire141[(4'he):(4'hc)] < $signed(wire135));
              reg153 <= (!wire132);
            end
          reg154 <= (~&($signed($unsigned(reg152[(3'h6):(2'h2)])) >> ((reg151[(1'h1):(1'h1)] ?
                  (~reg151) : {wire144, reg147}) ?
              $signed((~|(8'ha2))) : ($unsigned(wire136) ~^ $unsigned(reg146)))));
        end
      else
        begin
          reg147 <= $signed(($signed($signed((reg151 ?
              reg146 : wire134))) >> ($signed(wire136) == (!wire142[(1'h0):(1'h0)]))));
          reg148 <= $signed($signed($signed($signed((wire131 + wire138)))));
          reg149 <= wire132[(3'h4):(2'h2)];
          reg150 <= reg150;
          reg151 <= (((reg148[(3'h5):(2'h3)] ?
              ((wire133 >> reg151) * {wire144}) : $signed((reg145 && wire131))) <<< {reg150[(1'h0):(1'h0)],
              $unsigned((-reg146))}) != reg146[(3'h5):(2'h3)]);
        end
    end
  assign wire155 = {reg151};
  assign wire156 = (8'h9c);
  assign wire157 = (($signed(wire134[(3'h6):(1'h1)]) >= ($unsigned(((8'hb3) ?
                           (8'hbb) : reg152)) ?
                       (!$unsigned(wire139)) : (reg154 <= (8'haf)))) << wire138[(1'h1):(1'h0)]);
  assign wire158 = reg151;
  assign wire159 = ($unsigned($signed($unsigned($signed(wire156)))) && {wire131[(4'h8):(3'h6)]});
  always
    @(posedge clk) begin
      reg160 <= $signed((|($signed((wire135 ^~ reg147)) ?
          wire140[(4'h8):(1'h0)] : (wire156 && {wire141}))));
      reg161 <= (wire136[(2'h2):(1'h0)] ?
          $unsigned((~{$unsigned(wire144),
              $signed(wire138)})) : ({(wire159[(4'h9):(1'h0)] & wire138[(3'h7):(3'h6)]),
                  {(wire131 ~^ wire142), $unsigned(wire141)}} ?
              $signed(($signed(wire140) ?
                  wire142[(1'h1):(1'h0)] : ((8'h9d) ?
                      wire137 : wire155))) : $unsigned({wire134})));
      reg162 <= (&$unsigned({$unsigned((wire141 * wire140))}));
      if (((((~^wire132) ?
                  $unsigned((wire155 >>> wire140)) : (wire132[(1'h1):(1'h1)] || wire135[(3'h4):(2'h2)])) ?
              ({(reg148 ? reg147 : (7'h40))} ?
                  (~^wire132[(1'h0):(1'h0)]) : (~{(8'hbd),
                      wire141})) : ($signed($signed(wire142)) ?
                  (~|$unsigned(wire139)) : $unsigned(reg154))) ?
          ($signed(wire140) ?
              $unsigned(((reg152 ? wire138 : reg152) ?
                  ((8'ha2) >>> (8'ha5)) : {reg161})) : (^~(wire139[(2'h2):(1'h0)] ?
                  {wire139,
                      wire156} : reg146[(1'h0):(1'h0)]))) : reg151[(4'hd):(1'h0)]))
        begin
          reg163 <= reg150[(2'h2):(1'h0)];
          reg164 <= $signed(wire132[(1'h1):(1'h1)]);
          reg165 <= (reg146 > $signed($unsigned(($signed(reg163) ?
              wire139 : {(8'h9d), reg145}))));
          reg166 <= ($signed(wire133) + ((!$signed((wire137 ?
              (8'hb4) : wire156))) <<< $signed($unsigned(((7'h43) - wire136)))));
          reg167 <= wire156[(2'h3):(1'h0)];
        end
      else
        begin
          reg163 <= $unsigned((($signed(reg149[(1'h1):(1'h1)]) <= wire157) ^~ $signed($unsigned((reg164 < (8'hbe))))));
        end
      reg168 <= $signed($unsigned($unsigned(wire134)));
    end
  assign wire169 = wire143;
  assign wire170 = ({reg148} << (wire159 && (8'hb5)));
  assign wire171 = wire134[(4'h9):(2'h2)];
  assign wire172 = wire135[(1'h1):(1'h0)];
  assign wire173 = ((^~(($signed(reg147) ? (7'h43) : (+wire156)) & {((8'hb1) ?
                           reg164 : reg146),
                       wire143[(2'h3):(2'h3)]})) >>> (wire144[(4'h8):(1'h0)] ?
                       $signed((wire157 ?
                           {wire132} : reg167[(4'hc):(3'h7)])) : reg154));
endmodule

module module105
#(parameter param118 = ({(|(+((7'h42) <<< (8'hb6))))} != ((~|(~^((8'hb2) < (8'hb3)))) | ((((8'h9c) != (8'hab)) ~^ ((8'hb4) > (8'hb1))) == (((8'haf) > (8'hbd)) ? ((8'ha0) ^ (8'hab)) : ((8'hb5) ? (8'haa) : (8'ha1)))))), 
parameter param119 = (((param118 ~^ param118) ? param118 : (8'ha5)) ? ((~(^~(param118 | param118))) ? {(^~(^param118)), (~&(param118 * param118))} : (((param118 ? param118 : (7'h40)) ? (param118 || param118) : (param118 < param118)) - ({(8'hab), param118} ? (param118 ? param118 : param118) : (param118 ? param118 : param118)))) : param118))
(y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire109;
  input wire [(5'h13):(1'h0)] wire108;
  input wire [(2'h3):(1'h0)] wire107;
  input wire [(5'h13):(1'h0)] wire106;
  wire signed [(4'ha):(1'h0)] wire117;
  wire signed [(4'ha):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire115;
  wire signed [(4'hb):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire110;
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 (1'h0)};
  assign wire110 = wire107[(2'h3):(2'h2)];
  assign wire111 = (((&((^wire110) >= (wire110 ? wire109 : wire107))) ?
                           $signed(wire109[(4'hd):(4'h9)]) : wire109) ?
                       (8'hb7) : (wire107 >>> wire109[(4'hc):(4'h8)]));
  assign wire112 = ((&({$unsigned(wire106), (~wire109)} ?
                       $signed((!wire108)) : wire108)) || (wire108[(3'h5):(2'h3)] >= $unsigned(wire108[(4'h9):(3'h4)])));
  assign wire113 = (({(((8'hbe) ~^ (8'ha9)) || {wire111, wire112}),
                           ((wire111 == wire107) <= wire111[(3'h7):(2'h3)])} ?
                       (-($signed((8'ha0)) ?
                           wire108[(4'ha):(1'h0)] : wire110[(2'h3):(1'h1)])) : $unsigned((~^(~|wire106)))) | (wire107[(1'h1):(1'h0)] ?
                       (wire106 ?
                           $signed(wire110) : $signed($unsigned(wire108))) : $signed((+$unsigned(wire106)))));
  assign wire114 = (wire113[(1'h1):(1'h1)] ?
                       (~&$unsigned($unsigned($signed(wire109)))) : (wire109 ?
                           {((^wire110) <= $signed(wire112)),
                               $unsigned((!wire109))} : $unsigned($unsigned(wire113))));
  assign wire115 = $signed($signed(($unsigned((wire113 ? wire106 : (8'ha0))) ?
                       ((wire109 <= wire107) || (!wire112)) : $unsigned($unsigned(wire110)))));
  assign wire116 = wire115[(4'h8):(2'h2)];
  assign wire117 = ({(&((7'h41) ?
                               $unsigned(wire111) : ((8'hb7) ?
                                   wire110 : wire112))),
                           $unsigned($unsigned((wire112 >>> wire116)))} ?
                       (wire108[(3'h4):(1'h0)] + ($signed($unsigned(wire112)) + $unsigned({(8'ha8),
                           wire106}))) : $signed((($signed(wire110) ?
                               (wire107 ? wire106 : wire107) : (|wire107)) ?
                           $unsigned(wire115) : (8'hb8))));
endmodule

module module44  (y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire49;
  input wire signed [(5'h14):(1'h0)] wire48;
  input wire signed [(5'h14):(1'h0)] wire47;
  input wire [(5'h13):(1'h0)] wire46;
  input wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire51,
                 wire50,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire50 = {((($signed(wire47) - (-wire47)) ?
                              wire46[(4'h9):(2'h2)] : ({wire45, wire46} ?
                                  (wire47 ?
                                      wire49 : (8'hb4)) : $unsigned(wire49))) ?
                          (8'ha5) : {(~$unsigned(wire46))})};
  assign wire51 = $signed($signed(wire45));
  always
    @(posedge clk) begin
      reg52 <= $unsigned(wire45);
      reg53 <= wire48;
      reg54 <= reg52;
      reg55 <= $unsigned(((wire45 & (&$unsigned(wire50))) > (^~$signed(reg54[(1'h0):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      reg56 <= wire51;
      if ($unsigned((wire51 != reg55)))
        begin
          reg57 <= (&$signed(wire51));
          if ($signed($signed(((((8'hbd) * wire50) ?
                  reg57[(4'h9):(3'h4)] : $unsigned(wire48)) ?
              wire49[(3'h5):(3'h4)] : $signed($signed(wire48))))))
            begin
              reg58 <= reg53[(4'h9):(2'h2)];
            end
          else
            begin
              reg58 <= ($unsigned((wire48[(5'h13):(4'he)] ?
                      wire49[(3'h7):(3'h7)] : (&reg55))) ?
                  (8'hb8) : (wire50 < $unsigned((!(reg53 >> wire51)))));
              reg59 <= $signed(wire47);
              reg60 <= wire49[(1'h1):(1'h0)];
              reg61 <= wire45[(4'ha):(4'ha)];
              reg62 <= (reg55[(4'hc):(4'hb)] ^~ reg55[(4'ha):(3'h4)]);
            end
          reg63 <= reg53[(3'h7):(1'h1)];
          if ($unsigned((reg54 ?
              reg60[(2'h2):(2'h2)] : $signed(reg52[(1'h1):(1'h1)]))))
            begin
              reg64 <= (!{(~&reg53[(4'hb):(2'h2)]), (^~(7'h42))});
              reg65 <= reg62;
              reg66 <= $signed($unsigned({wire50[(1'h1):(1'h1)],
                  {{wire48, reg62}}}));
              reg67 <= $signed(reg64);
              reg68 <= reg65;
            end
          else
            begin
              reg64 <= $unsigned(wire51[(2'h3):(2'h2)]);
              reg65 <= {(($unsigned($signed(wire50)) > wire49[(4'ha):(2'h2)]) ?
                      (reg55[(3'h5):(2'h3)] ?
                          ($unsigned(wire51) << (~wire51)) : reg56) : ((|(reg57 ?
                              (8'hb1) : wire51)) ?
                          $unsigned($unsigned((8'hae))) : ((|reg65) != (reg60 <<< reg55)))),
                  (-{((reg53 ? wire51 : reg65) * (reg55 ? reg53 : wire50)),
                      reg65})};
              reg66 <= $unsigned({{wire47[(5'h12):(4'h8)]}});
            end
          reg69 <= $unsigned((reg53[(2'h2):(2'h2)] - $unsigned(((&reg59) < $unsigned((8'haf))))));
        end
      else
        begin
          reg57 <= $signed((((reg69[(2'h2):(1'h0)] == {wire50}) ?
                  $unsigned((reg56 * reg56)) : (reg60 * $signed(wire49))) ?
              wire51 : $signed(wire47[(4'hb):(1'h1)])));
          reg58 <= ((&(+$unsigned((8'hba)))) ?
              (^(~$signed((~&(8'hb9))))) : $unsigned(($signed({reg55}) ?
                  ($signed(reg60) ? reg67 : {wire47}) : {(reg65 + (8'ha7))})));
          reg59 <= $signed((~&(|((~^reg54) <= {reg56}))));
          reg60 <= reg65;
        end
      reg70 <= reg65;
      if (($unsigned((^(reg69[(1'h1):(1'h1)] ?
          (&reg54) : $signed(wire45)))) | $unsigned(wire47[(5'h14):(4'hc)])))
        begin
          reg71 <= (+(reg69[(1'h0):(1'h0)] ?
              reg59 : {$signed((reg67 ? wire48 : reg60))}));
        end
      else
        begin
          if (({(reg54[(2'h3):(1'h0)] + $signed(reg54))} ?
              (^~(8'hb8)) : (&$unsigned(($unsigned(reg67) ?
                  {(8'hb9), (8'hb6)} : ((8'h9c) ? reg65 : reg52))))))
            begin
              reg71 <= reg69[(1'h1):(1'h0)];
              reg72 <= (reg56[(2'h2):(1'h0)] >> $unsigned((8'hb5)));
            end
          else
            begin
              reg71 <= $signed((~$unsigned($signed($unsigned(reg61)))));
              reg72 <= ({{reg60[(4'hb):(3'h7)]}} ?
                  (reg66 ?
                      (~|$signed($signed((8'ha2)))) : reg52) : ($unsigned($signed((wire46 >= wire49))) | reg52));
              reg73 <= ({$unsigned((^~(reg62 ?
                      reg72 : reg67)))} >>> ($signed(reg66[(2'h3):(2'h3)]) ?
                  ((&(reg59 ? (8'hbc) : reg57)) > ($signed((8'ha7)) ?
                      wire49 : $unsigned(reg58))) : $unsigned(((7'h40) ~^ wire45[(4'h9):(3'h4)]))));
              reg74 <= $signed($unsigned($unsigned((((8'ha7) > reg52) ?
                  (8'ha3) : (+reg54)))));
              reg75 <= (($unsigned((^(reg53 ?
                      (8'ha6) : (8'ha8)))) <<< $signed((~|(8'h9e)))) ?
                  (^(~(8'hb5))) : (~|{((reg61 & (8'h9f)) ?
                          (^reg55) : $unsigned(wire48))}));
            end
          reg76 <= (!(~|(reg55 > reg60[(2'h3):(2'h2)])));
          reg77 <= reg56;
          if (((((~|$unsigned(reg68)) || $unsigned((wire46 || reg53))) ?
                  reg67[(3'h6):(2'h2)] : reg53) ?
              wire45[(1'h1):(1'h0)] : {wire48, reg69[(1'h0):(1'h0)]}))
            begin
              reg78 <= wire48;
              reg79 <= (^~$signed({$unsigned($signed(wire47)),
                  ($signed(reg73) ? reg60 : (reg60 ? (7'h44) : wire49))}));
              reg80 <= reg58[(1'h1):(1'h1)];
              reg81 <= reg69;
              reg82 <= $unsigned((reg61[(3'h6):(1'h0)] ?
                  reg77 : (+(&(reg79 ? (8'h9d) : reg63)))));
            end
          else
            begin
              reg78 <= (((((wire46 ? reg60 : reg77) ?
                          $unsigned(reg59) : $signed(reg64)) ?
                      {{reg73}} : {reg59}) < $unsigned((((7'h40) != reg63) || reg53[(1'h0):(1'h0)]))) ?
                  ((reg74[(2'h2):(1'h0)] ?
                      reg62[(1'h1):(1'h1)] : $unsigned(reg71)) >>> ($unsigned((|reg81)) ?
                      ((8'hbf) ?
                          ((8'hae) ?
                              (8'ha5) : reg73) : reg57[(2'h2):(1'h1)]) : (^(~^reg72)))) : (reg69 ?
                      ((&(reg64 ? reg69 : reg75)) ?
                          reg70[(3'h5):(1'h1)] : $signed((!reg79))) : ($unsigned({reg82,
                          wire48}) || (8'hbf))));
            end
          if ($unsigned($unsigned($unsigned({(!reg63)}))))
            begin
              reg83 <= reg78;
            end
          else
            begin
              reg83 <= wire51;
              reg84 <= ($signed(reg53) + reg60);
              reg85 <= $signed(reg61);
            end
        end
    end
  assign wire86 = (~&wire51);
  assign wire87 = (+($signed($signed({reg59, wire48})) ^~ reg58));
  assign wire88 = $signed((wire49[(3'h7):(3'h7)] ?
                      {$unsigned($unsigned(wire49))} : {($signed((8'ha4)) ?
                              (^reg63) : $signed(wire45)),
                          reg61[(4'ha):(3'h6)]}));
endmodule
