module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire129;
  wire signed [(4'hc):(1'h0)] wire128;
  wire [(5'h10):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire92;
  assign y = {wire129,
                 wire128,
                 wire126,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire92,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (wire4 ~^ wire1[(4'ha):(1'h1)]);
  assign wire6 = wire4[(4'hf):(1'h0)];
  assign wire7 = wire3;
  assign wire8 = $signed(wire2);
  assign wire9 = $signed(wire2);
  module10 #() modinst93 (.wire14(wire2), .y(wire92), .wire12(wire7), .wire13(wire4), .clk(clk), .wire15(wire3), .wire11(wire5));
  module94 #() modinst127 (.y(wire126), .wire96(wire6), .wire98(wire4), .wire97(wire2), .wire95(wire0), .clk(clk));
  assign wire128 = ({wire7, wire92} ?
                       (wire8[(4'h9):(1'h1)] >= (wire1[(2'h2):(2'h2)] ?
                           $signed((wire5 + wire1)) : $unsigned($unsigned(wire126)))) : ({$unsigned((wire126 && wire9))} - (-$signed({wire92,
                           wire3}))));
  assign wire129 = wire126[(4'hb):(4'hb)];
endmodule

module module94
#(parameter param125 = (8'h9f))
(y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire98;
  input wire signed [(4'h8):(1'h0)] wire97;
  input wire signed [(4'h8):(1'h0)] wire96;
  input wire [(5'h13):(1'h0)] wire95;
  wire [(5'h13):(1'h0)] wire124;
  wire signed [(2'h2):(1'h0)] wire123;
  wire [(5'h11):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire121;
  wire signed [(4'h9):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire106;
  wire signed [(4'ha):(1'h0)] wire105;
  wire [(4'hc):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire103;
  wire [(2'h2):(1'h0)] wire102;
  wire signed [(2'h2):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire100;
  wire signed [(5'h14):(1'h0)] wire99;
  reg signed [(4'ha):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg [(4'h8):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg [(4'h8):(1'h0)] reg116 = (1'h0);
  reg [(5'h11):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg108 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
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
                 reg110,
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire99 = (wire98 ?
                      ($signed(((wire98 ?
                          wire96 : wire96) ~^ (&(8'hbc)))) << $signed(((wire97 && wire97) ~^ (-wire97)))) : ((wire98 ?
                          $signed($signed((8'hb0))) : wire96) <<< {($signed(wire96) ?
                              $unsigned((8'hab)) : {wire96, wire97}),
                          ((wire96 <<< wire97) * {wire98, wire97})}));
  assign wire100 = wire96;
  assign wire101 = (^~wire95);
  assign wire102 = wire95[(3'h7):(3'h4)];
  assign wire103 = ((wire97[(1'h1):(1'h0)] >>> (~|({wire95,
                       wire99} << wire97))) && wire97);
  assign wire104 = $unsigned(wire103);
  assign wire105 = ($signed($signed(($signed((8'hb0)) ?
                       wire97 : wire96))) | (|{((wire95 ? wire96 : (8'hbf)) ?
                           {wire98} : (+wire95))}));
  assign wire106 = $unsigned((wire98[(2'h2):(1'h0)] ^~ ($unsigned((wire98 ?
                       wire97 : wire105)) || ((~wire95) ?
                       wire100[(1'h1):(1'h0)] : ((8'hb9) ? wire95 : wire95)))));
  assign wire107 = (~&$signed({((&(8'hb1)) ? (&wire106) : {wire101, wire106}),
                       $signed($unsigned(wire101))}));
  always
    @(posedge clk) begin
      reg108 <= $unsigned({$signed(wire107[(2'h2):(1'h0)]), (&wire105)});
      if ((($unsigned(((wire107 ? reg108 : wire100) * (~&wire97))) ?
              $signed(wire97) : $signed({wire98[(5'h10):(4'h8)],
                  (wire95 ? wire95 : wire102)})) ?
          ((+wire102[(2'h2):(2'h2)]) + (!(+((8'hb6) ?
              wire107 : reg108)))) : ((wire107[(4'h8):(3'h4)] * ($unsigned(wire105) ?
                  wire105 : wire101)) ?
              wire105[(4'h9):(1'h1)] : wire102)))
        begin
          reg109 <= {(~&{wire97}), {$signed(wire106)}};
          if (wire107)
            begin
              reg110 <= (reg109[(4'hd):(2'h2)] ^~ $signed(wire98[(4'h9):(2'h3)]));
              reg111 <= (!$unsigned((wire104[(4'h9):(3'h5)] ?
                  wire100[(3'h6):(3'h4)] : (~&(~wire102)))));
              reg112 <= wire101[(1'h0):(1'h0)];
              reg113 <= (+wire101[(1'h1):(1'h1)]);
            end
          else
            begin
              reg110 <= reg112[(3'h4):(2'h2)];
              reg111 <= $signed(wire103[(3'h6):(2'h2)]);
              reg112 <= wire96;
              reg113 <= ({{wire98}} < {reg112});
              reg114 <= $signed($unsigned(($unsigned({reg112}) - reg111)));
            end
          reg115 <= $signed((~|$signed(reg112[(2'h3):(2'h3)])));
          reg116 <= (!($unsigned(wire100) < (wire102 ?
              (^~((8'hbc) ? wire98 : (8'hae))) : {$unsigned((8'hbd))})));
        end
      else
        begin
          reg109 <= $unsigned($signed($signed(reg108[(2'h3):(2'h3)])));
          reg110 <= (~$signed(reg111));
          reg111 <= wire101[(1'h0):(1'h0)];
        end
      if (wire105[(4'ha):(4'h8)])
        begin
          reg117 <= ((8'ha9) == (~&$signed($unsigned(wire101))));
          reg118 <= reg113[(2'h2):(1'h1)];
        end
      else
        begin
          if (reg115)
            begin
              reg117 <= ((~^(&$signed(wire106[(4'hb):(2'h2)]))) - reg118[(2'h2):(2'h2)]);
            end
          else
            begin
              reg117 <= $signed({$signed({(reg115 ? wire98 : (8'hb0)),
                      (~^reg110)})});
            end
          reg118 <= (-wire95[(3'h4):(1'h0)]);
        end
      reg119 <= reg109[(2'h3):(1'h0)];
      reg120 <= wire103;
    end
  assign wire121 = {wire104};
  assign wire122 = (7'h40);
  assign wire123 = $signed((~&(((wire103 ?
                           wire121 : reg117) | wire103[(4'he):(2'h2)]) ?
                       wire97 : $unsigned((~|wire105)))));
  assign wire124 = reg115;
endmodule

module module10
#(parameter param91 = {(&(~&(^~((8'ha1) ? (7'h41) : (8'haf))))), (((8'hb6) || (!((8'ha1) ? (8'had) : (8'hbb)))) * ((((8'hbf) ? (8'haa) : (8'haa)) ^ (8'hbd)) ? {{(7'h41)}, ((8'hb9) || (8'hbb))} : {((8'ha7) ? (8'hb8) : (8'hb4))}))})
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire89;
  assign y = {wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire38,
                 wire40,
                 wire41,
                 wire42,
                 wire89,
                 (1'h0)};
  assign wire16 = $unsigned(wire14[(2'h2):(1'h0)]);
  assign wire17 = (wire13 ? wire15 : $unsigned(wire16));
  assign wire18 = wire11[(3'h4):(1'h0)];
  assign wire19 = $unsigned($unsigned((((~(8'hb5)) ?
                      (~&wire17) : (wire14 ?
                          (8'ha1) : wire12)) <= {wire17[(4'h9):(3'h4)],
                      wire18})));
  module20 #() modinst39 (.y(wire38), .wire23(wire12), .clk(clk), .wire22(wire15), .wire24(wire13), .wire21(wire17));
  assign wire40 = $unsigned(wire15[(2'h3):(1'h0)]);
  assign wire41 = wire12[(1'h0):(1'h0)];
  assign wire42 = ((!{$signed($unsigned((8'ha1)))}) ?
                      {(wire11 | wire13[(4'he):(4'h9)])} : ((($unsigned((8'hb5)) ?
                              $unsigned(wire15) : (~^wire12)) ?
                          (wire17[(2'h2):(2'h2)] <<< {wire17,
                              wire11}) : {(wire15 - wire17),
                              $unsigned(wire40)}) << wire38[(1'h0):(1'h0)]));
  module43 #() modinst90 (wire89, clk, wire13, wire15, wire14, wire18, wire12);
endmodule

module module43
#(parameter param88 = (((((~|(8'haf)) ? ((8'h9d) >= (8'hbd)) : (~|(7'h44))) ? (((8'had) ? (8'ha6) : (8'hbc)) ? ((8'h9c) <= (8'h9f)) : ((7'h43) + (8'hbd))) : (!((7'h42) <= (8'hb5)))) ? ((~^((8'ha1) != (7'h41))) <<< ((~|(8'ha1)) ? ((8'h9d) >>> (8'h9d)) : {(8'hbb), (8'hb0)})) : ((((8'hbb) ? (7'h41) : (8'h9f)) ? (!(8'ha6)) : ((7'h41) & (8'ha5))) ? (((8'haa) - (8'hb9)) <<< ((8'hb3) ? (8'haa) : (8'ha0))) : (((7'h43) ^~ (8'hb5)) ? (|(8'h9c)) : {(8'h9e)}))) <= ((~{{(8'ha9)}, ((7'h44) * (8'hb8))}) ? (|({(7'h42)} ? ((7'h41) >> (8'hbc)) : (&(8'hbc)))) : (&(^~((8'hb5) & (8'h9c)))))))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire48;
  input wire signed [(3'h5):(1'h0)] wire47;
  input wire signed [(5'h13):(1'h0)] wire46;
  input wire signed [(4'ha):(1'h0)] wire45;
  input wire signed [(5'h12):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire70,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
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
                 (1'h0)};
  assign wire49 = $signed(wire44[(4'h9):(2'h3)]);
  assign wire50 = ((&$signed(((wire46 >> (8'h9c)) ?
                          wire44[(3'h5):(1'h1)] : (~wire46)))) ?
                      ($signed((^~$unsigned((8'hb0)))) ?
                          wire44 : (8'hb8)) : ((+(wire46 > (wire44 * wire44))) > wire44));
  assign wire51 = wire44[(4'hb):(2'h3)];
  assign wire52 = $unsigned((+(((wire49 ? wire47 : (8'hbe)) ?
                      (-wire49) : $signed(wire48)) || {$signed(wire49)})));
  always
    @(posedge clk) begin
      reg53 <= {$unsigned($signed(({wire48} ? $signed(wire47) : (^wire47)))),
          $unsigned(wire44)};
      reg54 <= {(wire44[(4'hb):(3'h6)] >= (~&($unsigned(wire46) | (reg53 ?
              (8'hbb) : wire52))))};
      reg55 <= $signed((wire49[(2'h2):(1'h0)] ?
          (wire47[(1'h1):(1'h0)] >= wire49[(1'h1):(1'h1)]) : $unsigned($unsigned($unsigned((8'hbc))))));
    end
  always
    @(posedge clk) begin
      reg56 <= ($unsigned((wire52 ?
          reg55 : (~|reg55[(5'h10):(3'h4)]))) >> {(wire44 != $unsigned({wire46,
              reg53}))});
      if ((((((wire48 ? reg54 : wire49) << (wire52 ? (8'hba) : wire51)) ?
          wire46 : (&reg56)) <= ($unsigned((^(8'hb0))) ?
          wire48 : $unsigned($signed(reg53)))) || wire51))
        begin
          reg57 <= {(($unsigned(wire50[(2'h2):(2'h2)]) ?
                      (8'haf) : $unsigned(wire45)) ?
                  $signed(wire50) : reg56[(4'h8):(2'h3)]),
              (((~$signed(reg53)) ~^ {(wire49 ?
                      (8'ha8) : reg55)}) * ((~^(wire52 ? wire44 : wire48)) ?
                  ((^~wire51) == (^~wire44)) : $unsigned($unsigned((8'hb4)))))};
          if ((reg53 ^~ wire50))
            begin
              reg58 <= ({(((~^(8'ha1)) ? (7'h43) : (7'h44)) ?
                      wire47 : (!(reg57 ?
                          wire50 : reg56)))} << ((8'hbf) == $signed((wire47[(1'h1):(1'h1)] ^~ (7'h42)))));
            end
          else
            begin
              reg58 <= $signed($unsigned($unsigned(($unsigned(wire46) ?
                  $unsigned((7'h42)) : $signed(reg58)))));
            end
          reg59 <= $unsigned(((((|reg58) != reg56) * {(8'ha8)}) ?
              {wire51, reg55} : wire51[(2'h3):(1'h0)]));
          if ((({$signed(reg57),
              ((reg59 ? reg55 : wire45) ?
                  wire44 : (reg56 == reg57))} & (((+(8'hb6)) & wire44) < (~&(~wire45)))) >> wire50))
            begin
              reg60 <= (wire49 ?
                  ((+(~^(reg58 > reg56))) ?
                      wire44[(3'h4):(3'h4)] : wire46) : $signed($signed((|wire52))));
              reg61 <= reg54;
              reg62 <= reg54;
              reg63 <= (&{((&(8'hb0)) ?
                      ((wire51 > wire46) ?
                          reg53[(2'h2):(1'h0)] : (wire44 == reg54)) : reg55)});
            end
          else
            begin
              reg60 <= ((-((8'ha3) ?
                  (+reg59) : reg55)) - $unsigned($signed(reg60)));
            end
        end
      else
        begin
          reg57 <= wire44[(5'h12):(4'hb)];
          if (reg59[(1'h0):(1'h0)])
            begin
              reg58 <= reg59[(4'ha):(3'h4)];
            end
          else
            begin
              reg58 <= $signed(reg58[(1'h0):(1'h0)]);
              reg59 <= wire45[(1'h1):(1'h0)];
              reg60 <= reg62[(3'h7):(2'h2)];
              reg61 <= wire44[(4'hb):(4'hb)];
            end
          reg62 <= (wire47 ?
              $signed((|{(reg55 ? wire52 : wire50),
                  {reg57}})) : $unsigned((wire49 ?
                  $unsigned({reg54, reg53}) : reg54)));
          reg63 <= $unsigned((reg57[(4'he):(4'hb)] ?
              (reg61 ?
                  ($unsigned(reg61) ?
                      (8'h9e) : (!reg59)) : $signed(reg57[(1'h1):(1'h1)])) : (~|(reg53[(1'h0):(1'h0)] ?
                  (reg56 * (8'hb6)) : (|reg54)))));
          reg64 <= $unsigned((reg58 & (((wire46 - (8'ha2)) != reg60[(4'ha):(2'h3)]) < reg56[(4'h9):(1'h0)])));
        end
      reg65 <= reg53;
      if ((!((reg63 ? (^wire48[(1'h0):(1'h0)]) : reg53) ?
          (~((|reg65) ?
              (wire45 ?
                  reg59 : wire50) : $unsigned(reg54))) : (+$signed(wire50)))))
        begin
          reg66 <= ((|(~wire48[(1'h1):(1'h1)])) && (~reg65));
          reg67 <= ($unsigned((~^((&reg62) ?
              (reg66 ?
                  reg64 : reg60) : (~wire51)))) != (({reg62[(3'h4):(3'h4)]} == $unsigned($unsigned((8'ha1)))) < reg55));
          reg68 <= wire45;
        end
      else
        begin
          reg66 <= ({$signed((!$signed(reg68)))} == $signed(($signed((-wire51)) ?
              {$signed(reg66)} : $signed(wire52[(4'h8):(2'h2)]))));
          reg67 <= ($signed(reg67) ?
              reg54 : $unsigned(($signed((reg64 * wire44)) || ($signed((7'h42)) ^ $signed(wire46)))));
          reg68 <= reg62;
          reg69 <= wire45[(3'h5):(3'h5)];
        end
    end
  assign wire70 = (~^$unsigned(wire44[(3'h5):(1'h0)]));
  always
    @(posedge clk) begin
      if ((~^wire48[(2'h3):(2'h2)]))
        begin
          reg71 <= $signed((+((-reg67[(1'h1):(1'h0)]) ?
              $unsigned($unsigned(wire49)) : (reg57[(4'hd):(1'h0)] >> (-reg58)))));
          reg72 <= (^wire48[(1'h1):(1'h1)]);
          reg73 <= reg66[(4'hb):(2'h3)];
          reg74 <= reg57[(2'h2):(1'h0)];
          reg75 <= (({wire52, ($signed(wire52) <= (^wire49))} ?
                  reg58[(1'h1):(1'h0)] : reg60[(4'h9):(3'h5)]) ?
              $unsigned((reg65[(2'h3):(2'h2)] ?
                  ($unsigned(reg64) - reg54[(2'h2):(1'h1)]) : (wire48 + reg68[(2'h3):(1'h1)]))) : wire51);
        end
      else
        begin
          if ({$unsigned(reg56), $unsigned($signed(wire44[(4'he):(3'h4)]))})
            begin
              reg71 <= (({reg73[(1'h0):(1'h0)]} ?
                      $unsigned({$unsigned(reg73)}) : $signed(wire70[(4'h9):(1'h0)])) ?
                  (~^((^$unsigned(wire47)) ?
                      {(wire47 ?
                              wire46 : reg71)} : $unsigned(wire45[(4'h8):(3'h7)]))) : (^((~^wire48[(1'h1):(1'h0)]) ?
                      wire51[(2'h3):(2'h2)] : (!{reg71}))));
            end
          else
            begin
              reg71 <= $unsigned((+(!($signed(reg65) ?
                  (!(8'hb4)) : reg73[(3'h5):(1'h0)]))));
              reg72 <= (~reg59[(2'h2):(1'h0)]);
              reg73 <= wire52;
              reg74 <= {($signed(wire49) <= (~|(8'hb1)))};
              reg75 <= (!(-$signed(((~^reg74) && $signed(reg71)))));
            end
        end
      reg76 <= ((reg55 ?
              wire44 : {$signed((-reg55)), {$signed((8'ha5)), (~|reg56)}}) ?
          ($signed($signed(reg72[(2'h3):(1'h0)])) << $unsigned(({reg54} && reg64[(2'h2):(1'h0)]))) : $signed($signed($signed((~&reg72)))));
      reg77 <= wire51[(2'h3):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg78 <= reg69;
      if ($unsigned($signed($unsigned((~^(reg65 ? wire52 : reg57))))))
        begin
          reg79 <= ($unsigned(($signed(wire50) ?
              (~|(reg54 | (8'hb9))) : reg60[(1'h0):(1'h0)])) == (&wire44[(1'h0):(1'h0)]));
        end
      else
        begin
          reg79 <= ((!$signed(((reg78 - reg69) ?
                  reg72[(3'h7):(3'h5)] : (&wire46)))) ?
              reg78[(5'h11):(2'h2)] : $signed(reg58[(1'h0):(1'h0)]));
          reg80 <= ((~|(reg75[(1'h1):(1'h0)] ?
                  reg63[(1'h1):(1'h1)] : ((~^reg53) ?
                      (reg69 ? wire48 : wire50) : $unsigned(reg73)))) ?
              reg65 : (reg74 >>> $signed($unsigned(((8'hac) != wire51)))));
        end
    end
  assign wire81 = ((~|reg54) ? $unsigned($signed({reg79})) : $unsigned(wire48));
  assign wire82 = (+$signed($unsigned((7'h41))));
  assign wire83 = $signed((^(reg73 ?
                      wire44[(1'h0):(1'h0)] : wire82[(4'hf):(4'hf)])));
  assign wire84 = $signed((~|((~(|wire81)) >> (((8'hbc) < wire70) ?
                      $signed(reg61) : {reg63}))));
  assign wire85 = ((reg71[(2'h2):(2'h2)] ?
                          ((&wire52) > $unsigned((reg59 ^~ reg63))) : wire48) ?
                      (!(reg59 ?
                          wire52[(3'h6):(3'h5)] : (-(|wire82)))) : (reg58[(2'h3):(1'h0)] ~^ (((reg75 > reg60) >> (reg76 ?
                          wire46 : reg77)) ^~ reg55[(3'h4):(1'h0)])));
  assign wire86 = reg71;
  assign wire87 = $signed(reg74);
endmodule

module module20
#(parameter param37 = ((!{(~&(~^(7'h42)))}) ? (((((8'hbe) != (8'haf)) << {(8'ha7)}) + (+((8'hba) || (8'hb7)))) ? (((~(8'hb3)) ? (|(8'hbe)) : {(8'hae), (8'hb4)}) && {(+(8'hb5))}) : (8'hbe)) : ({{(8'ha8), ((8'ha1) >>> (8'hb7))}} ? (-(!((8'hb6) & (8'hba)))) : ((+{(8'had)}) == (7'h41)))))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire23;
  input wire signed [(4'h9):(1'h0)] wire22;
  input wire signed [(5'h10):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 (1'h0)};
  assign wire25 = wire21;
  assign wire26 = ($signed($unsigned($signed($signed((8'hae))))) && wire25[(3'h7):(2'h3)]);
  assign wire27 = $signed({{(&$signed(wire21)),
                          (wire24[(2'h3):(2'h2)] ? (|wire21) : wire21)},
                      (wire21[(2'h2):(1'h1)] ?
                          (8'hb0) : $signed((^~(8'ha8))))});
  assign wire28 = ((wire23 ?
                      (wire22[(2'h2):(1'h0)] ?
                          $unsigned($unsigned(wire24)) : wire26) : wire23) ~^ $signed($unsigned(wire23[(4'h8):(3'h6)])));
  assign wire29 = wire27[(4'ha):(4'h9)];
  assign wire30 = $signed((8'haa));
  assign wire31 = wire29[(3'h5):(3'h5)];
  assign wire32 = (^{((~|{wire30}) ?
                          ((wire30 && wire27) - (wire25 ?
                              wire22 : wire25)) : (wire30[(4'hf):(3'h5)] <= $unsigned(wire21))),
                      wire22});
  assign wire33 = ($signed((wire31[(4'he):(4'hc)] || $unsigned($unsigned(wire29)))) || wire25[(2'h2):(1'h0)]);
  assign wire34 = $signed(wire25);
  assign wire35 = $unsigned((~&(!$signed($unsigned(wire32)))));
  assign wire36 = wire32;
endmodule
