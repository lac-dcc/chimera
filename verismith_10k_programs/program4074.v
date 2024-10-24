module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire171;
  wire signed [(4'hb):(1'h0)] wire168;
  wire signed [(4'hb):(1'h0)] wire167;
  wire [(4'h8):(1'h0)] wire166;
  wire [(5'h12):(1'h0)] wire159;
  wire [(5'h11):(1'h0)] wire118;
  wire [(3'h4):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg161 = (1'h0);
  reg [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg163 = (1'h0);
  reg [(3'h7):(1'h0)] reg164 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg165 = (1'h0);
  assign y = {wire171,
                 wire168,
                 wire167,
                 wire166,
                 wire159,
                 wire118,
                 wire117,
                 wire115,
                 wire7,
                 wire6,
                 wire5,
                 reg170,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 (1'h0)};
  assign wire5 = $unsigned((($unsigned($unsigned((7'h40))) ?
                         wire1 : wire1[(1'h1):(1'h0)]) ?
                     (wire0[(4'hc):(1'h1)] <= ($unsigned(wire0) != (wire3 ?
                         wire4 : wire0))) : $unsigned($signed($signed(wire3)))));
  assign wire6 = (wire2[(2'h3):(1'h1)] << wire4[(2'h3):(2'h3)]);
  assign wire7 = wire4[(3'h4):(2'h2)];
  module8 #() modinst116 (.wire11(wire6), .y(wire115), .wire10(wire1), .clk(clk), .wire12(wire3), .wire9(wire2));
  assign wire117 = wire2;
  assign wire118 = wire117;
  module119 #() modinst160 (.wire122(wire0), .wire123(wire7), .wire121(wire4), .wire120(wire5), .y(wire159), .clk(clk));
  always
    @(posedge clk) begin
      reg161 <= (~|wire118);
      reg162 <= wire2;
      reg163 <= (|$unsigned(((~^{wire5}) ? wire5 : (^(+reg161)))));
      reg164 <= {(wire159 <= (-$unsigned(wire7[(3'h5):(2'h2)]))),
          (!(^~((7'h41) - wire4)))};
      reg165 <= {wire1};
    end
  assign wire166 = $unsigned(($signed((reg162 ?
                           (-wire7) : reg161[(3'h5):(3'h4)])) ?
                       $unsigned(($signed(wire6) ?
                           (^wire118) : (&(8'hbf)))) : $signed(($signed((8'hbe)) ?
                           wire0 : $signed(wire6)))));
  assign wire167 = $unsigned((~(wire0 ~^ (+(^wire3)))));
  module16 #() modinst169 (wire168, clk, wire2, wire1, wire7, reg164, wire3);
  always
    @(posedge clk) begin
      reg170 <= (wire115[(1'h1):(1'h1)] ?
          {$unsigned({$signed(wire167)})} : wire5);
    end
  assign wire171 = $signed(reg162);
endmodule

module module119
#(parameter param158 = {(-(~(+((8'h9e) ? (8'hb4) : (8'hb2))))), (({((8'hb7) ? (8'ha1) : (8'haa)), ((8'hb6) ? (8'hac) : (8'ha5))} <= (8'hb4)) ? ({(~^(8'h9e)), ((8'hb9) - (8'h9f))} ^~ (|(7'h42))) : ({(~|(7'h44)), (~(8'hb4))} ? (&{(7'h44)}) : ((|(7'h41)) ? ((8'ha6) ^~ (8'ha6)) : ((7'h40) == (7'h41)))))})
(y, clk, wire123, wire122, wire121, wire120);
  output wire [(32'h24):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire123;
  input wire [(4'hd):(1'h0)] wire122;
  input wire signed [(4'h9):(1'h0)] wire121;
  input wire signed [(5'h15):(1'h0)] wire120;
  wire signed [(4'ha):(1'h0)] wire157;
  wire signed [(4'h9):(1'h0)] wire156;
  wire [(2'h3):(1'h0)] wire155;
  wire signed [(4'hd):(1'h0)] wire153;
  assign y = {wire157, wire156, wire155, wire153, (1'h0)};
  module124 #() modinst154 (.wire127(wire123), .wire128(wire121), .clk(clk), .wire129(wire122), .y(wire153), .wire126(wire120), .wire125((8'hbf)));
  assign wire155 = $signed(wire120[(2'h3):(1'h1)]);
  assign wire156 = (+(wire121 ?
                       $unsigned(({wire153} >>> (!wire155))) : wire155[(1'h1):(1'h1)]));
  assign wire157 = $unsigned($signed((~^(-$unsigned(wire123)))));
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire110;
  wire signed [(2'h3):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire105;
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire56,
                 wire15,
                 wire14,
                 wire13,
                 wire58,
                 wire59,
                 wire105,
                 reg114,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire13 = {(~&(wire12 ?
                          ((8'haa) ?
                              $unsigned(wire10) : (wire12 ?
                                  (8'haf) : wire12)) : $unsigned((wire10 >> wire12))))};
  assign wire14 = {wire9};
  assign wire15 = ({(^~{wire14[(4'ha):(3'h7)],
                          $unsigned(wire11)})} <<< $signed($unsigned({$unsigned(wire14),
                      (~^wire14)})));
  module16 #() modinst57 (wire56, clk, wire11, wire10, wire15, wire12, wire14);
  assign wire58 = (~|(wire12 ?
                      {wire12[(3'h4):(2'h2)],
                          $unsigned($signed(wire13))} : $signed((((8'ha3) >= wire12) ?
                          wire15 : (^wire13)))));
  assign wire59 = (~{wire11[(4'hc):(1'h0)],
                      $unsigned($unsigned($unsigned(wire56)))});
  always
    @(posedge clk) begin
      if (wire13)
        begin
          reg60 <= (wire12 ?
              {$unsigned($signed(wire58[(2'h3):(2'h2)])),
                  (wire10 ?
                      wire11 : $unsigned((wire13 ?
                          wire56 : wire14)))} : (($signed((^wire9)) || (wire11 ?
                      $unsigned(wire13) : (~wire56))) ?
                  $unsigned($unsigned($signed(wire12))) : wire9[(5'h11):(4'h8)]));
        end
      else
        begin
          reg60 <= (|((wire10 < wire11) ? wire14 : wire15[(2'h2):(1'h0)]));
        end
      reg61 <= {($signed({$signed(wire14)}) ?
              wire15 : ({$unsigned(wire56)} ?
                  wire14 : ((^~wire14) ? wire12 : ((8'hbe) != wire58)))),
          wire12};
      reg62 <= wire58;
      reg63 <= (-$signed((8'ha0)));
      reg64 <= wire13;
    end
  module65 #() modinst106 (.wire68(reg61), .wire69(wire11), .wire66(wire14), .wire70(reg62), .y(wire105), .clk(clk), .wire67(wire9));
  assign wire107 = (^~(&wire11[(4'hf):(4'ha)]));
  assign wire108 = ((({(wire15 || wire14)} ?
                       wire9[(3'h7):(3'h6)] : reg61) ~^ (^reg62)) == wire13[(2'h2):(1'h0)]);
  assign wire109 = ((({reg64[(4'h9):(4'h8)]} ?
                       {(wire59 ^~ wire10),
                           reg62[(3'h7):(3'h4)]} : (reg62[(4'ha):(3'h4)] ?
                           reg64[(5'h10):(4'ha)] : (-wire14))) & wire11[(3'h4):(2'h2)]) + $unsigned(reg64));
  assign wire110 = $unsigned((+$unsigned($unsigned((|wire108)))));
  assign wire111 = $signed((wire108[(2'h2):(1'h1)] ~^ $signed(((8'ha6) <= wire105[(3'h4):(2'h2)]))));
  assign wire112 = (((((^wire109) && (!wire14)) ?
                               ($signed((8'ha1)) && $unsigned(wire108)) : (&$signed(wire56))) ?
                           ({(+reg60),
                               $signed(wire13)} <= wire109) : ($signed({wire107,
                                   (8'ha8)}) ?
                               wire58[(2'h2):(1'h1)] : wire108)) ?
                       {(((~^wire15) ?
                               (wire111 >> reg60) : $unsigned(wire56)) >= wire109[(2'h3):(1'h1)])} : ((~wire13) && {$signed($unsigned((8'haa)))}));
  assign wire113 = $signed(((|(8'hb2)) ^ $unsigned(((-wire108) ?
                       $signed(wire56) : $signed(wire108)))));
  always
    @(posedge clk) begin
      reg114 <= {wire59[(1'h1):(1'h1)],
          (wire59 ? reg62 : (wire109 * $unsigned((~|wire13))))};
    end
endmodule

module module65
#(parameter param104 = ((-(-(((8'hb5) ? (8'ha1) : (8'ha2)) >>> ((8'hb1) ? (8'ha5) : (8'hb0))))) <= {(~^(~((8'hb9) ? (8'h9e) : (8'hb3))))}))
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire70;
  input wire [(4'he):(1'h0)] wire69;
  input wire signed [(4'hb):(1'h0)] wire68;
  input wire signed [(2'h3):(1'h0)] wire67;
  input wire signed [(4'he):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire71;
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire71,
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
                 reg90,
                 reg89,
                 reg88,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire71 = ((^~$signed({(wire70 ? wire67 : (8'hb5)), wire68})) ?
                      $signed(wire66) : (wire66[(1'h0):(1'h0)] | {wire69[(3'h4):(2'h2)]}));
  always
    @(posedge clk) begin
      reg72 <= (~&(wire67 <= wire66[(4'hc):(3'h4)]));
      if (reg72[(4'h8):(3'h5)])
        begin
          reg73 <= (wire68 && $unsigned(wire68[(3'h7):(3'h5)]));
          reg74 <= ((|$signed($signed(wire69))) >> (|(!wire71[(4'ha):(4'ha)])));
          reg75 <= (8'ha9);
          if ({(8'hb4), reg72})
            begin
              reg76 <= ($signed($unsigned((reg75 ?
                  (~|wire66) : {(8'hb3), reg74}))) >= wire70);
              reg77 <= {($unsigned(reg75) >= reg75[(1'h1):(1'h1)])};
              reg78 <= wire69;
              reg79 <= ({wire66[(4'hb):(3'h4)]} == {$signed($signed($unsigned(wire66))),
                  (|wire71)});
            end
          else
            begin
              reg76 <= (^~$unsigned($signed((-$signed(reg76)))));
            end
          reg80 <= $unsigned({$signed((reg77[(3'h5):(1'h0)] ~^ wire66)),
              wire66});
        end
      else
        begin
          reg73 <= $signed((&($unsigned(reg72) || reg75[(4'hd):(3'h6)])));
          reg74 <= ($signed($signed(reg73[(4'he):(3'h5)])) & $signed($signed((reg80[(3'h5):(2'h3)] ?
              $signed(reg75) : reg75))));
          reg75 <= reg77[(4'ha):(1'h0)];
          reg76 <= $signed(reg80);
          reg77 <= (&$unsigned(($unsigned($signed(wire66)) << ((+reg72) ^ (8'ha7)))));
        end
    end
  assign wire81 = wire66[(2'h3):(2'h3)];
  assign wire82 = {$unsigned(reg77[(4'hb):(1'h1)]),
                      ((^~((&(8'ha7)) ~^ $unsigned(wire69))) || (8'h9c))};
  assign wire83 = $signed({wire81[(4'h9):(4'h8)], wire81});
  assign wire84 = reg78;
  assign wire85 = wire66;
  assign wire86 = $signed(wire69);
  assign wire87 = wire67[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (($signed(wire82[(1'h1):(1'h0)]) ? $signed($unsigned(reg80)) : reg80))
        begin
          reg88 <= (wire71 | ((~^wire66) >= reg80));
          reg89 <= reg74[(1'h1):(1'h1)];
          if (wire66[(4'h9):(4'h8)])
            begin
              reg90 <= (wire69[(4'ha):(1'h1)] >= wire85);
              reg91 <= (reg78 ?
                  $signed((reg88[(4'h9):(1'h0)] ?
                      ((wire84 + reg73) ?
                          $signed(reg79) : (|(8'ha3))) : ($signed(reg74) & (reg77 ?
                          reg74 : (8'hae))))) : wire84[(2'h2):(1'h1)]);
              reg92 <= reg80[(3'h4):(3'h4)];
              reg93 <= reg91[(5'h14):(4'hd)];
            end
          else
            begin
              reg90 <= (reg72 << $unsigned((8'hae)));
              reg91 <= $signed($unsigned(((~^wire87[(3'h6):(3'h5)]) || $signed($signed(reg92)))));
              reg92 <= $signed($signed(($unsigned(((8'ha3) * reg88)) ?
                  (((8'hb7) ? wire68 : (7'h44)) ?
                      ((8'hb7) ?
                          wire82 : wire71) : (reg89 * wire71)) : reg90[(1'h0):(1'h0)])));
              reg93 <= ((((-(wire86 * wire84)) - wire67) > $signed(reg75)) || $signed(reg88));
            end
        end
      else
        begin
          if ($signed((~^wire81[(4'hb):(2'h2)])))
            begin
              reg88 <= ((($signed((reg88 ? wire70 : reg73)) ?
                  (-$unsigned((8'hbb))) : reg73) | reg93[(1'h0):(1'h0)]) != {(wire71[(2'h2):(2'h2)] ?
                      wire87 : (&((8'hac) <= reg91))),
                  (&$unsigned(((8'hb2) ? reg74 : reg93)))});
              reg89 <= (reg90 ?
                  {$unsigned($signed(wire69)),
                      $signed(($unsigned((8'haa)) & {reg90}))} : (^wire69[(2'h2):(1'h1)]));
            end
          else
            begin
              reg88 <= reg92;
            end
          reg90 <= $signed(($unsigned(reg92) ?
              wire66[(3'h7):(3'h6)] : $unsigned((^~((8'ha5) ?
                  (8'hab) : reg74)))));
          reg91 <= (!$unsigned((-wire69[(4'hd):(3'h5)])));
          reg92 <= (~reg75[(4'h8):(3'h5)]);
        end
      reg94 <= reg73;
      if ((~&$unsigned(wire82)))
        begin
          reg95 <= $signed(reg74);
          reg96 <= $unsigned($signed($signed((reg89[(1'h0):(1'h0)] ^ (reg80 ?
              reg73 : reg94)))));
        end
      else
        begin
          reg95 <= $signed(wire86[(3'h5):(3'h5)]);
          if (({{reg78[(2'h2):(2'h2)], wire84}} >> ((8'ha4) || wire67)))
            begin
              reg96 <= wire69[(4'h9):(3'h7)];
              reg97 <= {$signed($signed((&(8'ha2)))), wire85};
              reg98 <= $unsigned(reg76[(4'hb):(3'h5)]);
              reg99 <= reg95[(1'h1):(1'h1)];
              reg100 <= $unsigned($unsigned((wire87[(1'h0):(1'h0)] ?
                  reg90 : ($signed(reg78) - reg91[(3'h4):(3'h4)]))));
            end
          else
            begin
              reg96 <= $signed(wire83[(5'h13):(4'ha)]);
            end
          reg101 <= $unsigned(((reg91 ?
                  ($signed(reg75) ?
                      (wire87 | reg79) : $unsigned(reg78)) : ((reg100 ?
                          reg97 : (8'hac)) ?
                      (wire68 <= reg98) : (wire66 <<< reg95))) ?
              (~$signed((&(8'hb3)))) : (~reg72)));
          reg102 <= ($signed((|$unsigned(((8'haf) + reg92)))) ?
              $unsigned($signed($signed($unsigned(reg97)))) : (($signed({wire68,
                  reg73}) & reg77) || (wire66[(4'h9):(1'h1)] <<< (|(reg95 ?
                  wire69 : wire71)))));
        end
      reg103 <= $signed((!(~|($unsigned(reg91) == (^~reg101)))));
    end
endmodule

module module16
#(parameter param54 = ((+((~((8'had) ^~ (8'ha1))) ^ (((7'h40) >= (8'hb3)) ^ ((8'hb0) ? (8'hbc) : (8'ha0))))) - (&({((8'hb9) ? (8'h9c) : (8'hba))} ? (((8'hbb) + (8'hbb)) ? ((8'ha0) <<< (8'hbb)) : (^(8'hbd))) : ((8'hb2) == ((8'hbf) >>> (8'ha6)))))), 
parameter param55 = param54)
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h1ab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire21;
  input wire [(4'hd):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire [(3'h6):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  assign y = {wire53,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire34,
                 wire23,
                 wire22,
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
                 reg35,
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
                 (1'h0)};
  assign wire22 = wire20[(4'h8):(1'h0)];
  assign wire23 = {(|(^wire22[(3'h4):(1'h0)])),
                      $signed({((~^(8'h9d)) ? (~|(8'hb5)) : (~&wire22)),
                          (!$unsigned(wire21))})};
  always
    @(posedge clk) begin
      if (wire17[(3'h4):(1'h0)])
        begin
          reg24 <= $signed($signed($signed((8'hbe))));
          reg25 <= $signed(wire18[(1'h0):(1'h0)]);
        end
      else
        begin
          reg24 <= (~&{wire18, wire18});
          if ($unsigned((8'haa)))
            begin
              reg25 <= $signed(((&(^(8'hae))) ^~ wire22[(2'h3):(2'h3)]));
            end
          else
            begin
              reg25 <= ($unsigned($unsigned(reg24[(3'h7):(3'h5)])) ?
                  wire20[(3'h7):(1'h0)] : ((wire20[(3'h4):(2'h3)] ?
                      $signed(wire17) : wire17) | reg25[(3'h6):(2'h3)]));
              reg26 <= (|wire18);
              reg27 <= wire23;
            end
          reg28 <= (!((($signed(wire21) - (wire23 <= wire18)) ?
                  $unsigned($signed(reg25)) : {wire21}) ?
              $signed({((8'hbd) ? wire20 : reg26),
                  (wire17 * reg24)}) : $unsigned((^~$signed(reg26)))));
          reg29 <= (|({reg24, wire18} < (!reg28[(4'h8):(1'h0)])));
          reg30 <= reg27;
        end
      reg31 <= (+((!wire18[(2'h3):(1'h0)]) ?
          wire21 : {$unsigned($signed(reg29))}));
      reg32 <= reg30;
      reg33 <= reg25;
    end
  assign wire34 = reg29[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg35 <= wire17[(5'h10):(4'h8)];
    end
  assign wire36 = ($unsigned($unsigned({(|wire23), (reg25 * (8'h9e))})) ?
                      (+wire20[(3'h6):(1'h0)]) : $unsigned((wire22 ~^ (reg26 ?
                          (8'hb1) : $unsigned(reg25)))));
  assign wire37 = reg28[(4'hf):(4'hd)];
  assign wire38 = ((+wire22) <<< ($unsigned({reg33[(2'h2):(1'h0)],
                          $signed(reg28)}) ?
                      $signed({(~|reg27), $signed((8'hb8))}) : reg27));
  assign wire39 = $unsigned((wire22 * $signed($unsigned((wire21 ?
                      reg25 : wire34)))));
  assign wire40 = (~|({$unsigned((-wire36))} >= (wire17[(1'h0):(1'h0)] || $unsigned($signed((8'ha7))))));
  assign wire41 = (~^wire19);
  assign wire42 = reg26[(4'hd):(2'h2)];
  always
    @(posedge clk) begin
      if (reg32)
        begin
          reg43 <= wire19[(4'hb):(4'hb)];
        end
      else
        begin
          if ((^(^~$unsigned({(wire39 >> reg29)}))))
            begin
              reg43 <= (-reg27[(4'hd):(1'h1)]);
              reg44 <= (~^((+$unsigned({reg31, (8'hb0)})) ?
                  $unsigned((|$unsigned(reg43))) : wire22[(2'h2):(1'h1)]));
              reg45 <= $unsigned((($signed((reg26 ?
                  wire41 : (8'h9d))) <= $unsigned({reg26})) >= ((^(|reg31)) ^ $signed((wire17 ?
                  (7'h43) : reg44)))));
              reg46 <= ($signed(({(wire39 ~^ wire34)} ~^ {(wire17 ?
                      reg43 : wire22)})) <<< {(~|($signed(wire40) >= wire34[(1'h0):(1'h0)]))});
              reg47 <= $unsigned($unsigned((reg44[(3'h6):(2'h3)] >= $signed(wire38[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg43 <= $unsigned($signed((((!wire39) - {wire19, wire34}) ?
                  $signed(wire17[(4'h9):(2'h3)]) : $unsigned(wire39[(1'h0):(1'h0)]))));
              reg44 <= $signed($unsigned((reg43[(2'h3):(1'h1)] & $signed(wire41))));
            end
          reg48 <= wire39[(2'h2):(1'h0)];
          reg49 <= wire34;
          reg50 <= ($signed(wire17[(4'h8):(2'h2)]) * ($unsigned({wire22[(5'h11):(4'he)]}) ?
              $signed((wire19 ?
                  $signed(reg43) : reg33)) : ($signed(((8'hb9) ^ reg28)) ~^ wire21[(1'h0):(1'h0)])));
          reg51 <= ($signed((($signed(wire41) == $unsigned(wire18)) - (reg45[(1'h0):(1'h0)] << reg46))) ?
              wire36 : $signed((({wire37, (7'h41)} ?
                  wire38 : $unsigned(wire36)) >>> reg25[(4'h8):(2'h2)])));
        end
      if (reg49[(1'h1):(1'h1)])
        begin
          reg52 <= (wire37[(3'h5):(3'h4)] ?
              $signed((wire40[(1'h0):(1'h0)] ?
                  $signed({wire18,
                      reg35}) : $unsigned($signed(reg50)))) : {reg33[(4'he):(4'ha)]});
        end
      else
        begin
          reg52 <= wire21[(4'h8):(2'h3)];
        end
    end
  assign wire53 = $unsigned($signed((+wire39)));
endmodule

module module124
#(parameter param152 = (&({(((7'h40) ? (8'ha5) : (8'hb6)) - ((8'ha4) ? (8'hb0) : (8'h9f)))} ^ (({(8'hb6), (8'ha8)} ? {(7'h42), (8'hb1)} : ((8'hbe) <<< (8'hac))) >= (((8'ha1) ? (8'hb0) : (8'hb8)) + ((8'hb1) ? (8'ha5) : (8'hb6)))))))
(y, clk, wire129, wire128, wire127, wire126, wire125);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire129;
  input wire signed [(4'h9):(1'h0)] wire128;
  input wire [(4'hc):(1'h0)] wire127;
  input wire signed [(5'h15):(1'h0)] wire126;
  input wire signed [(3'h4):(1'h0)] wire125;
  wire signed [(4'h9):(1'h0)] wire151;
  wire [(4'hf):(1'h0)] wire150;
  wire signed [(4'ha):(1'h0)] wire149;
  wire signed [(4'h9):(1'h0)] wire141;
  wire signed [(3'h4):(1'h0)] wire140;
  wire signed [(4'hd):(1'h0)] wire139;
  wire signed [(4'hd):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire137;
  wire signed [(3'h6):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire130;
  reg [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg [(4'h8):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(4'hb):(1'h0)] reg142 = (1'h0);
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire130,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  assign wire130 = wire128[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg131 <= (($unsigned(($signed(wire130) <= (^wire130))) > (8'hb7)) ?
          (+wire128[(3'h4):(2'h2)]) : (($signed({wire127,
                  wire129}) >>> ((wire127 | wire128) ?
                  ((8'h9c) ? (8'hae) : wire127) : {wire125})) ?
              ($unsigned((wire129 || wire130)) || ((wire127 ?
                      wire130 : wire126) ?
                  $signed(wire125) : (wire129 <<< wire125))) : wire128[(2'h2):(2'h2)]));
      if ({wire127})
        begin
          reg132 <= (wire128[(1'h0):(1'h0)] & wire130);
        end
      else
        begin
          reg132 <= wire127[(3'h6):(3'h5)];
          reg133 <= ($signed((wire125 <= ({wire128, wire126} ?
              (wire126 ? (8'ha2) : wire125) : $signed(wire129)))) ~^ (wire130 ?
              (&$signed((reg132 ? (8'hb4) : reg131))) : (7'h42)));
          reg134 <= reg132[(5'h10):(2'h2)];
        end
      reg135 <= {$signed((((wire125 ? wire127 : reg132) ?
              $unsigned(wire126) : wire125) != reg134))};
    end
  assign wire136 = $unsigned($signed(reg134));
  assign wire137 = wire127[(4'h9):(3'h6)];
  assign wire138 = $unsigned((&$signed($unsigned($unsigned(wire126)))));
  assign wire139 = {reg131[(4'ha):(1'h1)], $unsigned(wire130[(2'h2):(2'h2)])};
  assign wire140 = ((wire125[(2'h3):(2'h3)] ?
                           wire136 : ((~wire129) >= $unsigned((&(8'hb4))))) ?
                       wire130[(1'h0):(1'h0)] : wire129);
  assign wire141 = (({{wire126},
                       (^((8'hb6) <= wire125))} <<< (&$unsigned(wire140[(1'h0):(1'h0)]))) >>> (wire139 ^ ($unsigned((~^(8'hb9))) ?
                       ($unsigned((8'hb2)) ?
                           reg134 : reg132[(5'h10):(3'h6)]) : $unsigned((wire126 - (8'hb8))))));
  always
    @(posedge clk) begin
      if ((wire128 & wire138[(4'ha):(2'h3)]))
        begin
          if ({$signed(wire125[(1'h0):(1'h0)])})
            begin
              reg142 <= $signed(($signed(wire138[(4'ha):(3'h4)]) ?
                  $unsigned(($unsigned(reg132) ?
                      (wire125 ?
                          reg132 : wire125) : (|wire139))) : (&$signed(((8'hbe) ?
                      reg135 : wire128)))));
            end
          else
            begin
              reg142 <= $unsigned(wire138);
              reg143 <= $unsigned((reg142 + wire129));
              reg144 <= {$signed(reg134[(2'h2):(1'h1)])};
              reg145 <= wire140[(1'h0):(1'h0)];
            end
          reg146 <= wire136;
          reg147 <= {{{((~|wire136) != (-reg131))}}};
          reg148 <= (reg132[(3'h7):(3'h6)] ?
              wire127 : $signed($unsigned((reg146 * (~|wire126)))));
        end
      else
        begin
          reg142 <= (-($unsigned({((8'ha7) > reg132), (reg133 < reg133)}) ?
              ($signed((~^wire136)) ?
                  reg146[(1'h1):(1'h1)] : ((reg135 || wire130) ?
                      wire141 : wire139[(3'h5):(3'h4)])) : wire129[(3'h5):(2'h2)]));
          reg143 <= (wire140[(2'h2):(2'h2)] ?
              ($signed($signed(wire127[(2'h2):(2'h2)])) ?
                  reg142[(1'h1):(1'h1)] : (~&($unsigned(wire139) ?
                      $signed((8'hbe)) : (&wire137)))) : $unsigned($unsigned(reg147[(1'h0):(1'h0)])));
          reg144 <= {(+wire125[(2'h2):(1'h1)]), $unsigned(reg148)};
          reg145 <= $signed((^~reg148));
          reg146 <= ($unsigned({(-(wire129 >>> reg143))}) ?
              (reg134[(1'h0):(1'h0)] ?
                  $unsigned((~&reg133)) : {{((8'ha4) ? wire138 : wire127),
                          $unsigned(wire130)}}) : $signed(($signed((reg146 ?
                  (8'hb7) : reg143)) & reg147[(3'h5):(1'h1)])));
        end
    end
  assign wire149 = ($signed((8'hbf)) || $signed((~^(^~(reg134 && reg131)))));
  assign wire150 = ((~&(reg144[(2'h3):(2'h2)] ^ $unsigned($unsigned((8'haf))))) ?
                       (+$unsigned(($signed((8'hb9)) ?
                           $signed(reg148) : $unsigned(reg134)))) : $signed($unsigned(wire140)));
  assign wire151 = $signed((wire125[(3'h4):(2'h2)] ?
                       $signed($unsigned((reg135 | (8'ha2)))) : (&(wire141 ^ {reg132}))));
endmodule
