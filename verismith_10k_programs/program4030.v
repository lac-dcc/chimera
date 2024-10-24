module top
#(parameter param114 = ((~&(^~(((8'hb9) ? (7'h44) : (8'ha8)) >= ((8'ha2) ? (8'hb2) : (8'hb4))))) ? (~|({((7'h44) ? (8'hb6) : (8'hbd)), ((8'haa) ? (8'hac) : (8'h9c))} ? (((8'ha9) ? (7'h40) : (8'hbb)) >>> (~|(8'hb4))) : (&((8'hb3) ? (8'had) : (8'hbd))))) : (~^({((8'ha7) | (8'ha8)), ((8'hb4) ? (8'ha1) : (8'hbd))} || (((8'hb9) ^~ (8'h9f)) > ((8'haa) ? (8'haa) : (8'hb0)))))), 
parameter param115 = (((&((param114 ? (8'hb5) : (8'hb6)) ? (param114 <= param114) : param114)) && (param114 ~^ ((param114 ? param114 : param114) <<< (^~param114)))) ? (param114 ? ((^~param114) + (param114 == (param114 ? param114 : (7'h40)))) : {((+param114) ? (param114 < param114) : (~&param114))}) : ((param114 | param114) ? param114 : (param114 ? ({param114, param114} ? (param114 == param114) : (param114 ? param114 : param114)) : ((param114 >> (8'hbb)) || param114)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire111;
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  assign y = {wire113, wire29, wire4, wire111, reg31, (1'h0)};
  assign wire4 = (~(~^({(wire0 << wire3)} ?
                     (+$signed(wire2)) : ({(7'h44), wire1} ^ $signed(wire1)))));
  module5 #() modinst30 (wire29, clk, wire0, wire4, wire1, wire3, wire2);
  always
    @(posedge clk) begin
      reg31 <= (wire0[(1'h0):(1'h0)] ?
          (({(wire4 || wire4), (wire4 || (8'h9d))} ?
                  {$signed(wire3)} : (7'h41)) ?
              $unsigned(wire29) : $unsigned($signed((8'ha2)))) : wire4);
    end
  module32 #() modinst112 (wire111, clk, wire2, wire29, wire0, reg31);
  assign wire113 = ({(~&$unsigned((+wire0))),
                       wire4[(3'h7):(3'h6)]} ~^ (($unsigned((reg31 ?
                               wire4 : (8'ha8))) ?
                           wire1 : wire29) ?
                       {wire1[(3'h6):(2'h2)]} : reg31[(3'h4):(1'h0)]));
endmodule

module module32
#(parameter param110 = ((({(+(8'had)), ((8'haa) ? (8'hbe) : (8'ha0))} ? (8'ha6) : (((8'hb3) ? (8'ha0) : (8'hab)) ? ((8'hb2) ~^ (8'hb6)) : (8'h9d))) | ((!((8'ha3) << (8'ha7))) ? {((8'hb2) ? (8'hb9) : (8'ha2)), {(8'ha1), (8'hb2)}} : (!((7'h44) ? (8'h9d) : (8'hab))))) ? (((~&((8'h9d) | (8'ha0))) ? {((8'ha6) ? (8'hbb) : (7'h40))} : (~^((7'h44) ^~ (8'h9f)))) ? (({(8'ha5)} ? {(7'h40), (8'hbd)} : (!(8'hb5))) & (((8'haf) <= (8'ha1)) >> {(8'ha4), (8'hba)})) : (((~(8'hbc)) ? {(8'ha7)} : (7'h43)) + (((7'h40) <<< (8'ha5)) ? (~(8'hbd)) : {(8'hb0), (8'had)}))) : {((((8'hbf) ? (8'hbc) : (8'ha7)) ? ((8'ha9) ? (8'ha7) : (8'hbb)) : ((8'ha9) + (8'h9d))) ? (|((8'ha3) ^~ (8'ha1))) : ((~^(8'ha3)) >= ((8'haa) ? (8'hb6) : (8'ha0)))), ((((8'h9d) ? (8'hb4) : (8'hb2)) != ((7'h40) <<< (8'hbd))) == ({(8'h9f)} ? {(8'hbc), (7'h42)} : (|(8'hbd))))}))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire36;
  input wire signed [(5'h10):(1'h0)] wire35;
  input wire [(5'h14):(1'h0)] wire34;
  input wire signed [(3'h4):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire108;
  wire [(4'hc):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire103;
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire50,
                 wire37,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire57,
                 wire103,
                 reg56,
                 (1'h0)};
  assign wire37 = wire34;
  module38 #() modinst51 (.wire43(wire35), .clk(clk), .wire39(wire37), .wire40(wire36), .wire41(wire33), .wire42(wire34), .y(wire50));
  assign wire52 = wire50[(3'h7):(1'h1)];
  assign wire53 = (~&$unsigned((((|(8'ha1)) ? wire35 : {wire37, wire36}) ?
                      $unsigned((wire52 ? wire50 : wire52)) : (8'ha9))));
  assign wire54 = wire50[(4'h8):(1'h1)];
  assign wire55 = $signed(wire34);
  always
    @(posedge clk) begin
      reg56 <= wire37;
    end
  assign wire57 = wire53;
  module58 #() modinst104 (.wire59(wire54), .wire61(wire34), .y(wire103), .wire63(wire50), .wire62(wire52), .wire60(wire57), .clk(clk));
  assign wire105 = $unsigned($unsigned(wire34[(4'ha):(1'h1)]));
  assign wire106 = $unsigned($unsigned((~^{(8'h9c), wire53})));
  assign wire107 = $signed((~&((^wire34) < ($signed(wire55) + wire50))));
  assign wire108 = wire105;
  assign wire109 = (^{(~^$unsigned($unsigned(wire54))),
                       $signed((~|$signed(wire36)))});
endmodule

module module5
#(parameter param27 = (^(!(((!(8'ha5)) + ((8'hb2) ? (8'hab) : (8'ha3))) ? ({(8'hae)} >> ((8'ha8) ? (8'ha5) : (8'hb1))) : (((8'ha4) ^~ (8'ha2)) >> ((8'hbd) ? (8'hae) : (8'hb5)))))), 
parameter param28 = param27)
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire12,
                 wire11,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = (^~(wire8[(2'h2):(2'h2)] ?
                      $signed($signed(wire10)) : $unsigned(((wire10 || (8'hb4)) ?
                          wire6 : wire7[(3'h5):(2'h2)]))));
  assign wire12 = $unsigned((8'haa));
  always
    @(posedge clk) begin
      reg13 <= ($signed($unsigned(((wire7 >= wire12) != wire10))) & $signed($unsigned((-(wire11 ?
          (8'hb6) : wire11)))));
      reg14 <= wire9[(4'hb):(3'h5)];
      reg15 <= (~reg13);
      reg16 <= ($unsigned($unsigned(wire10[(2'h2):(2'h2)])) ?
          $signed(wire10[(4'he):(3'h4)]) : ((8'ha8) <= $signed(reg13)));
      reg17 <= (((reg15[(2'h3):(2'h2)] ? (~&$signed(reg16)) : wire7) ?
              (~|((reg14 & reg15) >> (&wire6))) : (~^$signed({wire11,
                  reg15}))) ?
          (~^(({reg15} <= $signed(wire7)) & wire8[(2'h2):(2'h2)])) : $unsigned($signed((~&(wire11 <= reg14)))));
    end
  assign wire18 = ((|(wire7 ?
                      (-$unsigned(reg17)) : reg15[(2'h2):(2'h2)])) << ((wire10 ?
                          wire11 : {$unsigned(reg16), wire11}) ?
                      (wire8[(3'h7):(2'h3)] ~^ (wire10[(4'hd):(3'h4)] <= (reg15 ?
                          reg16 : wire10))) : $signed((wire6[(2'h2):(2'h2)] ?
                          $signed(wire12) : (+wire10)))));
  assign wire19 = (($unsigned({$unsigned(wire9), {(7'h40)}}) > reg14) ?
                      (~^reg15[(2'h2):(2'h2)]) : wire7[(1'h1):(1'h1)]);
  assign wire20 = reg16[(3'h5):(2'h3)];
  assign wire21 = $signed($unsigned(wire8));
  assign wire22 = (wire21[(3'h5):(3'h5)] + wire21[(4'hd):(3'h6)]);
  assign wire23 = wire12[(4'hc):(1'h1)];
  assign wire24 = wire20[(3'h5):(2'h2)];
  assign wire25 = wire23;
  assign wire26 = (^$unsigned((&reg14)));
endmodule

module module58
#(parameter param101 = ((^~(((~(8'hbe)) > ((8'haf) <= (8'ha0))) ? (8'hb8) : (^((8'h9e) ? (8'hb5) : (8'ha5))))) != {((&((8'had) ~^ (8'hb8))) & (~^((8'ha3) ^ (8'hbf)))), (({(8'ha3)} >> (^~(8'ha7))) | (((8'hb4) - (8'hb5)) >= (8'hbf)))}), 
parameter param102 = (({(^{param101, (8'haa)})} ? (~&(~|(param101 ? param101 : param101))) : param101) & (!(8'hb3))))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'h1ae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire63;
  input wire signed [(5'h14):(1'h0)] wire62;
  input wire [(5'h14):(1'h0)] wire61;
  input wire [(4'h8):(1'h0)] wire60;
  input wire signed [(4'hd):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire81;
  wire signed [(4'ha):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
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
                 reg87,
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
                 (1'h0)};
  assign wire64 = wire61;
  assign wire65 = wire63;
  assign wire66 = (!(|($signed((wire61 ? wire64 : wire62)) ?
                      $signed({wire64, wire60}) : $signed(wire62))));
  assign wire67 = (wire66 ? wire60[(3'h7):(3'h4)] : wire60);
  always
    @(posedge clk) begin
      if ($signed(((wire64 >> ((8'h9f) != $signed((7'h42)))) ^~ $unsigned(wire67))))
        begin
          if ($signed($signed($unsigned((|wire59[(2'h3):(1'h0)])))))
            begin
              reg68 <= {wire63[(2'h2):(1'h1)], wire65[(4'h8):(3'h7)]};
              reg69 <= (!wire67[(3'h4):(2'h3)]);
              reg70 <= (wire66[(2'h3):(1'h1)] <<< wire66[(4'hb):(4'hb)]);
              reg71 <= {(wire62[(4'hc):(4'h8)] ?
                      $signed(($unsigned(wire62) >= $unsigned(wire62))) : wire63),
                  $signed({{reg69[(4'h9):(1'h0)], (wire63 >> wire59)},
                      $unsigned((^reg68))})};
            end
          else
            begin
              reg68 <= (($unsigned(wire61) <<< ((~|(wire64 ? reg70 : wire66)) ?
                      (reg70 ?
                          $unsigned(wire62) : (reg69 ?
                              (7'h41) : reg70)) : (((8'hb7) ?
                          reg70 : reg69) || (wire61 ~^ wire62)))) ?
                  wire65[(3'h6):(3'h6)] : $signed((|{((8'hb3) ?
                          wire60 : wire61),
                      $signed(wire62)})));
              reg69 <= reg71[(4'h8):(2'h3)];
              reg70 <= (8'hae);
              reg71 <= (~^wire62);
            end
          reg72 <= reg68[(3'h5):(2'h2)];
          reg73 <= {$unsigned((reg71[(1'h1):(1'h1)] ?
                  reg70 : (~&reg71[(5'h11):(3'h6)])))};
        end
      else
        begin
          reg68 <= $unsigned($unsigned(wire59[(4'hd):(4'hb)]));
        end
      if (($unsigned((~|{(wire61 & wire60)})) ?
          ((~wire59[(2'h2):(2'h2)]) >> (8'ha3)) : (~wire59)))
        begin
          if ((wire59[(4'hc):(1'h0)] ?
              wire62[(1'h0):(1'h0)] : ($signed($unsigned($signed(wire60))) <<< wire66)))
            begin
              reg74 <= reg71;
              reg75 <= ((~^$signed((!(wire59 ? (8'hb0) : wire59)))) ?
                  ($signed(wire64[(4'h9):(1'h0)]) ?
                      ($unsigned($unsigned(wire60)) >>> ((~|reg73) ?
                          (wire67 ~^ wire60) : (reg74 >> wire66))) : {(reg68[(4'hf):(1'h1)] ?
                              reg69 : (wire59 ?
                                  wire61 : (8'hb9)))}) : (~&(($signed(reg73) ?
                          $signed(wire63) : reg68[(4'h9):(3'h4)]) ?
                      {$signed(wire67),
                          (wire66 ?
                              reg71 : reg71)} : $signed((reg71 ^~ (8'ha5))))));
              reg76 <= ((reg73[(1'h1):(1'h0)] ?
                      $signed(($unsigned(wire67) ?
                          ((8'hb3) ? wire64 : reg68) : wire66)) : wire67) ?
                  $signed(wire62) : reg71[(3'h5):(3'h4)]);
              reg77 <= $unsigned(reg70);
            end
          else
            begin
              reg74 <= (((wire63[(1'h0):(1'h0)] ?
                  $unsigned($unsigned(wire67)) : (reg72 ?
                      $unsigned(wire63) : (^~reg70))) - reg77) >>> (8'had));
              reg75 <= ((wire61 ?
                      {(|((8'h9c) ? reg77 : wire64)),
                          (8'h9c)} : ((|$signed((8'h9c))) ?
                          ((reg74 >= wire61) - {reg70,
                              wire65}) : $unsigned((wire62 && wire66)))) ?
                  (^(^wire65)) : (|wire67[(1'h1):(1'h0)]));
            end
        end
      else
        begin
          reg74 <= $unsigned(reg75[(4'h8):(1'h1)]);
        end
      reg78 <= $unsigned({({(reg71 - wire67)} ?
              (wire59[(3'h7):(3'h7)] ?
                  $unsigned(reg73) : wire61) : (^(wire59 - reg72))),
          wire66[(3'h4):(2'h3)]});
      if (wire67[(3'h7):(3'h5)])
        begin
          reg79 <= wire63[(1'h1):(1'h0)];
        end
      else
        begin
          reg79 <= {((-$unsigned((reg71 ? reg78 : (7'h42)))) ?
                  $unsigned($unsigned(wire64)) : (reg71 <<< $signed(wire66)))};
          reg80 <= wire61[(4'h8):(1'h0)];
        end
    end
  assign wire81 = ($unsigned(wire65) ?
                      reg69 : {reg75,
                          (wire61 >> {$unsigned(wire61), $signed(reg70)})});
  assign wire82 = (|((wire64 & {$signed(reg69)}) ?
                      {(wire67[(2'h3):(2'h2)] ? $signed(reg75) : (~|wire65)),
                          reg71[(3'h7):(3'h7)]} : (reg79[(2'h2):(1'h1)] - ((reg70 & wire65) ?
                          (wire64 ? wire59 : reg68) : (wire64 != reg77)))));
  assign wire83 = reg69[(3'h4):(1'h1)];
  assign wire84 = (((wire64 || ($signed(reg74) ^ (reg75 ?
                      wire66 : reg70))) << (wire61 << reg71[(5'h14):(4'h8)])) <= $signed(reg69[(3'h4):(2'h2)]));
  assign wire85 = (8'ha8);
  assign wire86 = reg76[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg87 <= (&wire66[(1'h0):(1'h0)]);
      reg88 <= ((8'h9c) ?
          (~$unsigned((wire61[(1'h1):(1'h0)] << $signed(wire86)))) : $signed((($unsigned(reg71) && (^(8'h9c))) | {wire84[(1'h1):(1'h1)]})));
      if (reg74)
        begin
          reg89 <= $unsigned(({{(wire65 + reg88), (wire60 ? reg71 : wire82)}} ?
              {wire60} : (((reg77 ?
                  wire60 : reg88) | ((8'hb2) >> wire60)) || reg79)));
          reg90 <= (+wire61[(5'h14):(1'h0)]);
        end
      else
        begin
          reg89 <= (((|wire64[(4'h8):(3'h7)]) == $unsigned((^~(~reg76)))) ~^ wire83);
          if ((reg72 ? $signed(reg74) : wire67))
            begin
              reg90 <= (((!(wire65[(4'h8):(3'h5)] << (wire64 > reg75))) ?
                      (((~^reg69) ~^ (reg69 ? reg90 : wire65)) ?
                          wire59[(2'h2):(1'h0)] : $unsigned($signed(wire60))) : $unsigned(reg88[(2'h2):(2'h2)])) ?
                  (($unsigned((reg90 + wire84)) ?
                          {(wire82 ? reg79 : wire62)} : wire63) ?
                      wire81[(3'h7):(1'h1)] : reg88) : $signed(reg87));
              reg91 <= (reg80[(1'h1):(1'h1)] <<< reg88[(1'h0):(1'h0)]);
              reg92 <= ((8'hbd) >>> wire66[(1'h0):(1'h0)]);
              reg93 <= (((reg72[(1'h0):(1'h0)] ?
                      (~reg68) : wire66[(4'ha):(4'h9)]) << $signed(({reg87} <= reg78))) ?
                  ((-$unsigned($signed(wire64))) ?
                      ((~|(reg80 * wire86)) >> $signed((wire60 || wire82))) : {(wire61 ~^ wire65[(1'h1):(1'h1)])}) : $signed(reg70));
              reg94 <= (~&wire59);
            end
          else
            begin
              reg90 <= reg87;
              reg91 <= {wire86[(4'hc):(3'h5)],
                  ({wire62, wire84} >= {($unsigned(reg69) ?
                          $unsigned((8'h9f)) : reg90[(4'ha):(1'h1)])})};
              reg92 <= (^~reg79[(2'h3):(1'h0)]);
            end
          reg95 <= wire63[(2'h3):(1'h1)];
        end
      if ((!($unsigned(wire61) ?
          $unsigned(($unsigned(reg92) <= $signed((8'ha4)))) : (~^((!wire65) ?
              ((8'hb6) ^~ wire66) : $unsigned(wire84))))))
        begin
          reg96 <= $unsigned((reg72 != $unsigned(((~^reg95) & (+reg90)))));
          reg97 <= (|(8'hbc));
          reg98 <= {($unsigned((&(wire84 ? wire67 : reg75))) ?
                  wire86 : (+$signed(reg76[(1'h1):(1'h1)])))};
          reg99 <= wire82[(2'h3):(2'h3)];
          reg100 <= (reg69[(3'h6):(2'h2)] >= ($unsigned(((~&reg74) - $signed(reg71))) != wire63[(3'h5):(3'h5)]));
        end
      else
        begin
          reg96 <= $signed(reg75[(4'he):(1'h1)]);
          reg97 <= (~{$unsigned($signed(wire86))});
        end
    end
endmodule

module module38
#(parameter param49 = {((&(((8'ha0) + (8'hab)) ? ((8'hb7) == (8'h9c)) : (~^(8'hb2)))) >> (~|(((7'h40) ^ (8'hbe)) ? ((8'ha6) ? (8'hb8) : (8'ha7)) : ((8'haa) ? (8'hb9) : (8'hb3)))))})
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire43;
  input wire signed [(5'h13):(1'h0)] wire42;
  input wire signed [(2'h2):(1'h0)] wire41;
  input wire [(3'h5):(1'h0)] wire40;
  input wire [(3'h5):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  assign y = {wire48, wire45, wire44, reg47, reg46, (1'h0)};
  assign wire44 = wire40[(2'h2):(2'h2)];
  assign wire45 = $unsigned(wire42);
  always
    @(posedge clk) begin
      reg46 <= ({($signed($signed(wire44)) < $unsigned(wire45[(3'h5):(3'h4)]))} == wire43[(1'h0):(1'h0)]);
      reg47 <= $signed((((wire43 ?
          (wire42 ?
              (8'h9e) : reg46) : wire43) >= (wire45[(1'h1):(1'h0)] & (wire43 ^~ wire39))) * (((wire45 ?
              reg46 : (8'ha7)) ?
          wire40 : (^reg46)) == wire40[(3'h5):(3'h5)])));
    end
  assign wire48 = ($unsigned($signed({wire42})) >> reg46);
endmodule
