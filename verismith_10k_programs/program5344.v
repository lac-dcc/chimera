module top
#(parameter param116 = {((8'ha2) ? (-((8'hbb) ^ (^~(7'h41)))) : (^~((~&(8'hb7)) << {(8'hab)})))}, 
parameter param117 = (~|{param116, param116}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire115;
  wire signed [(4'hb):(1'h0)] wire114;
  wire [(5'h15):(1'h0)] wire113;
  wire [(3'h5):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire111;
  wire [(4'hc):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire97,
                 wire96,
                 wire95,
                 wire93,
                 wire63,
                 wire5,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire5 = $signed((((^~{wire2, wire1}) >= $unsigned({wire1})) ?
                     wire3 : ({$unsigned((8'h9d)),
                         (7'h41)} ^ (+(wire3 ^ (8'had))))));
  module6 #() modinst64 (wire63, clk, wire1, wire0, wire3, wire5);
  module65 #() modinst94 (.wire66(wire3), .wire67(wire0), .y(wire93), .wire69(wire5), .wire68(wire4), .clk(clk));
  assign wire95 = $unsigned(wire3[(3'h5):(3'h4)]);
  assign wire96 = $signed($signed($signed($unsigned($unsigned(wire0)))));
  assign wire97 = ((8'hb8) ^ ($signed(wire3[(4'ha):(3'h5)]) + ($signed($unsigned(wire0)) ?
                      {(wire1 ? wire4 : wire96),
                          (wire96 != wire0)} : $signed($signed(wire5)))));
  always
    @(posedge clk) begin
      reg98 <= (-$unsigned($unsigned(wire93)));
      reg99 <= $unsigned($signed(((+$signed(wire97)) << $unsigned((wire96 ?
          (8'hb3) : wire63)))));
      if (wire3)
        begin
          reg100 <= {{wire4[(4'ha):(1'h0)]}, reg99[(3'h5):(2'h3)]};
          reg101 <= reg99[(3'h7):(3'h6)];
          reg102 <= wire97;
          if (wire97[(3'h4):(2'h3)])
            begin
              reg103 <= $unsigned(wire63);
              reg104 <= (|$signed(wire5));
              reg105 <= $unsigned($signed($signed($signed($unsigned(wire5)))));
            end
          else
            begin
              reg103 <= (reg104[(4'hd):(3'h5)] ^ (~$unsigned($unsigned(wire3))));
              reg104 <= ($signed(reg102) >> wire63[(4'hc):(4'ha)]);
              reg105 <= (wire2[(3'h7):(3'h5)] ?
                  (~|$unsigned(wire5)) : {$signed(wire97)});
              reg106 <= $unsigned($unsigned($signed(wire4)));
            end
        end
      else
        begin
          if (({$signed(wire0[(5'h14):(3'h4)]),
              ({$unsigned(wire93),
                  wire63} ~^ wire3[(1'h1):(1'h1)])} >= $unsigned($signed(reg104))))
            begin
              reg100 <= {(($signed((reg103 ? (8'ha7) : reg101)) ?
                          (^$signed((8'hb0))) : $unsigned($unsigned(reg106))) ?
                      wire63 : {((wire97 ? (8'hbb) : reg104) + reg100),
                          (wire96 == $signed(wire95))})};
              reg101 <= reg106;
            end
          else
            begin
              reg100 <= {((wire2 != wire5[(4'hd):(4'h9)]) + (((wire3 <<< reg103) ?
                      {wire0} : (reg100 ^~ reg98)) == ($signed(wire96) ?
                      wire97[(2'h3):(1'h1)] : (8'h9e))))};
              reg101 <= (-(^~(wire2[(3'h7):(2'h2)] ^~ $unsigned($signed((8'hbd))))));
              reg102 <= wire0;
              reg103 <= ({$signed(((^reg99) ?
                      $unsigned(wire4) : $unsigned(reg99))),
                  (((~|reg102) ?
                      wire4[(4'he):(4'he)] : reg105) & $unsigned({wire93,
                      wire93}))} << $unsigned({(~$unsigned(wire93)), wire2}));
              reg104 <= $unsigned(wire0);
            end
          if ($unsigned(wire5))
            begin
              reg105 <= wire96[(3'h5):(3'h4)];
              reg106 <= reg101[(1'h0):(1'h0)];
              reg107 <= reg98;
              reg108 <= wire2;
            end
          else
            begin
              reg105 <= $unsigned(reg102[(1'h0):(1'h0)]);
              reg106 <= (!$signed((&$signed(wire5))));
            end
        end
      reg109 <= $unsigned((~|{$unsigned($signed(reg106))}));
      reg110 <= reg106[(4'hb):(4'ha)];
    end
  assign wire111 = (({reg110[(1'h1):(1'h0)]} ^~ (&(wire3 >> ((8'h9d) && wire93)))) == {wire93[(3'h5):(1'h0)],
                       reg101[(2'h3):(1'h1)]});
  assign wire112 = (|($signed({(-(8'h9e))}) > (~|$unsigned((reg99 ?
                       reg109 : reg106)))));
  assign wire113 = (-wire1);
  assign wire114 = (($signed((wire3 ? (reg104 ? reg102 : wire112) : (~reg99))) ?
                       $signed(reg102) : (((+(8'h9c)) ^ (wire4 ?
                               wire63 : wire1)) ?
                           wire3[(4'h9):(3'h7)] : (wire2 < $signed(wire96)))) > ($signed(($signed(reg109) < (~reg109))) ?
                       wire5[(4'he):(3'h7)] : wire97[(1'h1):(1'h0)]));
  assign wire115 = (((~^$unsigned($signed(wire114))) ?
                           wire5 : ($signed((8'haf)) ?
                               $signed($signed((8'h9c))) : $unsigned(((8'hbe) < wire93)))) ?
                       wire5 : ((8'hab) ?
                           $unsigned($signed({(8'ha3),
                               reg102})) : (^$unsigned((8'ha7)))));
endmodule

module module65
#(parameter param92 = ((-(((~|(8'ha6)) ? (8'ha4) : ((8'h9c) ? (8'ha3) : (8'hb9))) ? (((8'hb9) ? (8'hb1) : (8'hac)) ~^ ((8'hb2) ? (8'hb0) : (8'ha3))) : (((8'ha0) >= (8'ha6)) ? {(8'haf), (7'h43)} : ((7'h44) ? (8'h9f) : (8'ha1))))) | ({(~^((8'ha8) ? (8'ha1) : (8'ha4))), {((8'hb2) ? (8'h9f) : (8'hb3))}} ? ({(-(8'hb6)), ((7'h44) ^ (8'ha4))} != ((~^(8'ha8)) ? ((8'ha0) ? (7'h40) : (8'ha0)) : (~(8'ha8)))) : (^(((7'h44) >> (8'hb6)) ? ((8'ha8) << (7'h42)) : ((8'hb9) << (8'hb9)))))))
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire69;
  input wire [(4'hf):(1'h0)] wire68;
  input wire [(4'hd):(1'h0)] wire67;
  input wire [(4'hc):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire70;
  assign y = {wire91, wire90, wire89, wire87, wire70, (1'h0)};
  assign wire70 = {((~^(!(wire67 ?
                          wire68 : wire67))) > (^(!$unsigned(wire67))))};
  module71 #() modinst88 (wire87, clk, wire69, wire68, wire70, wire66);
  assign wire89 = wire69;
  assign wire90 = wire67;
  assign wire91 = wire67;
endmodule

module module6
#(parameter param61 = (((8'ha3) ? ((((8'ha0) <= (8'ha6)) == (~&(8'hac))) != (((8'hba) ? (8'ha0) : (8'h9c)) - ((8'hbf) ? (8'h9e) : (8'hbf)))) : (^~(8'h9d))) > {(^~{(~&(8'haa))})}), 
parameter param62 = (param61 > (((~^{(8'ha8), param61}) - (~|((8'hba) | param61))) ? (({param61} - {param61}) & ((param61 && param61) ? (param61 ? param61 : (8'had)) : (param61 ? (8'hab) : (7'h43)))) : param61)))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire11;
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  assign y = {wire60,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire34,
                 wire11,
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
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire11 = $signed(wire9);
  module12 #() modinst35 (.wire13(wire9), .wire16(wire10), .wire14(wire7), .y(wire34), .clk(clk), .wire15(wire8));
  assign wire36 = {{(8'haf)}};
  assign wire37 = wire11;
  assign wire38 = wire36;
  assign wire39 = $signed($signed(wire7));
  always
    @(posedge clk) begin
      if ($signed(wire38[(2'h3):(2'h3)]))
        begin
          reg40 <= (wire34[(4'h8):(2'h2)] ?
              ((wire9[(1'h1):(1'h0)] ?
                  $signed(wire8[(4'hc):(4'h8)]) : ($unsigned(wire10) ~^ $signed(wire9))) >>> $unsigned($signed($unsigned(wire10)))) : wire36);
          reg41 <= wire10;
          reg42 <= $unsigned(((^wire9[(2'h2):(1'h1)]) != $signed(({reg40,
                  reg41} ?
              $unsigned(wire36) : (reg41 <= wire10)))));
          if ($unsigned((($signed($signed(reg40)) ?
              $unsigned(reg40[(4'he):(3'h7)]) : wire10) >>> wire34[(3'h4):(1'h0)])))
            begin
              reg43 <= $unsigned(((~^wire7[(4'hc):(4'ha)]) ~^ (^~(!$signed(reg42)))));
              reg44 <= $unsigned({{(!((7'h41) | (7'h42))),
                      {(wire36 && wire38), (^~wire38)}}});
              reg45 <= $signed($unsigned(($unsigned($unsigned(wire34)) ?
                  ((wire10 ? wire34 : reg41) ?
                      $signed(wire7) : reg42[(4'ha):(3'h5)]) : (~|(-wire38)))));
              reg46 <= (|(wire9 ? wire38 : $signed($signed((|wire11)))));
              reg47 <= (reg46 ?
                  {$unsigned(((|wire36) ? (~|wire9) : $unsigned(wire11))),
                      $signed(((wire7 - wire9) ^ (-wire36)))} : reg45);
            end
          else
            begin
              reg43 <= {wire38, $unsigned(wire39[(4'hc):(3'h4)])};
              reg44 <= ((~&($unsigned((wire11 ~^ wire39)) >= $unsigned(wire39[(4'h8):(3'h7)]))) ?
                  wire9[(2'h3):(1'h0)] : reg41);
            end
          reg48 <= reg45;
        end
      else
        begin
          reg40 <= $signed(wire34[(1'h1):(1'h1)]);
        end
      if (($unsigned((~|{(wire36 ?
              (8'hac) : wire38)})) || $signed({(^~reg48[(2'h2):(2'h2)]),
          reg47})))
        begin
          reg49 <= (wire11 ? reg46 : wire7[(5'h10):(4'hb)]);
          reg50 <= reg40;
        end
      else
        begin
          reg49 <= ((($unsigned((7'h40)) ?
                  $signed(reg48[(2'h2):(2'h2)]) : $unsigned($signed(reg48))) ?
              ((8'hbb) ?
                  $signed(wire38) : $unsigned(wire37[(3'h4):(1'h0)])) : (-$unsigned($signed((8'hbb))))) || wire38);
          reg50 <= ($signed((8'hba)) ?
              ($unsigned({(-wire34), (|reg49)}) ?
                  (reg48 ?
                      ((+reg45) ?
                          $unsigned(wire8) : (reg47 ?
                              reg48 : (8'hbd))) : reg41) : $unsigned($unsigned($signed(reg41)))) : {{reg44[(4'ha):(2'h3)]},
                  ($unsigned((reg44 ? reg43 : wire36)) ?
                      (7'h40) : $unsigned(reg46))});
        end
      if (((^$signed((~&(~(8'hbe))))) ^~ ({($signed((8'hbd)) >>> $unsigned(reg40)),
              $signed((reg46 && (7'h44)))} ?
          ($unsigned(((8'hb9) == wire37)) ?
              (|{wire39}) : ((wire34 ? reg48 : reg49) ?
                  (~&reg43) : (reg42 ?
                      reg49 : wire11))) : wire10[(4'hb):(4'ha)])))
        begin
          reg51 <= $signed(reg47);
          if ({(reg50 ?
                  $signed({(reg50 ? wire11 : reg41)}) : $unsigned(((wire37 ?
                      reg40 : reg47) != $unsigned(reg40)))),
              reg46})
            begin
              reg52 <= ($signed((-(((8'ha3) ? reg44 : wire34) | (~^reg40)))) ?
                  $unsigned($unsigned($signed(((8'ha3) != reg43)))) : $unsigned({wire11[(3'h4):(2'h3)]}));
              reg53 <= (!{{wire37[(4'ha):(1'h1)],
                      ((wire39 ? reg41 : wire7) <= $unsigned(wire36))}});
              reg54 <= (~&(^~reg42[(4'he):(3'h4)]));
              reg55 <= (&($unsigned(reg53) & $unsigned($unsigned(wire7[(4'hf):(3'h4)]))));
            end
          else
            begin
              reg52 <= {$unsigned(($signed(reg45[(4'hc):(3'h4)]) ^ {reg50[(1'h1):(1'h1)],
                      (8'hb7)}))};
            end
          reg56 <= reg52[(1'h0):(1'h0)];
          reg57 <= (+({(~^(reg40 ? wire34 : reg47)),
                  $signed((wire10 != reg54))} ?
              wire37 : $unsigned(({reg41, reg43} ?
                  wire10 : reg47[(4'h9):(4'h9)]))));
          reg58 <= (reg46[(4'hc):(1'h1)] ?
              reg44[(4'hf):(2'h3)] : wire38[(4'hc):(3'h6)]);
        end
      else
        begin
          reg51 <= $signed(((+(reg53[(4'hd):(4'h8)] & (wire11 <<< reg53))) == $unsigned($unsigned((~reg52)))));
          reg52 <= wire39;
          reg53 <= wire10;
        end
      reg59 <= (8'ha6);
    end
  assign wire60 = $unsigned(wire7[(5'h12):(5'h10)]);
endmodule

module module12
#(parameter param32 = ((~|({{(8'had)}, {(8'hae)}} ? ((^(8'hb8)) ? (^~(8'haf)) : (|(8'h9e))) : ((!(8'ha2)) ? ((8'ha4) ? (8'hba) : (8'hb7)) : (+(8'hbf))))) << ((+{{(7'h41), (8'ha2)}, ((8'hb4) ? (8'haf) : (8'hbe))}) ^ (((|(8'hae)) ? {(8'h9c)} : ((8'hb5) && (8'ha6))) == (((8'had) ? (8'ha2) : (7'h43)) ? ((8'ha9) ? (8'hba) : (8'h9c)) : (-(8'ha9)))))), 
parameter param33 = param32)
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire15;
  input wire [(2'h3):(1'h0)] wire14;
  input wire [(2'h3):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 (1'h0)};
  assign wire17 = (((!$unsigned(wire14[(1'h0):(1'h0)])) << wire15) & {(($signed(wire14) <<< ((8'haf) ?
                              wire14 : wire15)) ?
                          ($signed((8'hb6)) || wire15) : wire14[(1'h1):(1'h0)]),
                      ((^{wire13}) <<< (~$signed(wire15)))});
  assign wire18 = wire15;
  assign wire19 = {(wire16[(3'h4):(3'h4)] >= wire16)};
  assign wire20 = $unsigned(($unsigned($signed(wire19)) ?
                      $signed((!(wire17 ?
                          wire19 : wire16))) : $signed(wire18[(2'h2):(1'h1)])));
  assign wire21 = (!(($signed((-(8'hbe))) >= (~(wire17 ^ wire18))) ~^ (((wire13 ?
                          wire15 : wire13) ?
                      wire13 : $signed(wire20)) <<< ((+wire16) ^~ wire19[(3'h4):(2'h2)]))));
  assign wire22 = $signed((wire14 ?
                      $signed(wire17[(3'h6):(3'h5)]) : $unsigned(wire13[(1'h1):(1'h0)])));
  assign wire23 = (wire17 ? $signed($unsigned(wire22[(4'ha):(3'h7)])) : wire16);
  assign wire24 = $signed(wire20);
  assign wire25 = wire16[(4'hb):(3'h7)];
  assign wire26 = wire25[(3'h7):(3'h4)];
  assign wire27 = ((wire18 ?
                      (^wire26) : ($unsigned((8'h9c)) ?
                          $unsigned($signed(wire20)) : (-$signed(wire22)))) <<< $signed(($signed($unsigned(wire20)) ?
                      (~&wire18[(2'h2):(2'h2)]) : wire15)));
  assign wire28 = {((($unsigned(wire19) ?
                          ((8'hab) ?
                              wire27 : wire19) : (wire19 || wire16)) && $signed(wire24)) != wire16),
                      ((wire19[(1'h0):(1'h0)] >> wire20) ?
                          $signed(($signed(wire24) ?
                              wire24 : $unsigned(wire21))) : {wire20[(2'h2):(1'h1)],
                              (wire25 ? wire25 : wire16)})};
  assign wire29 = ({(|$signed($unsigned((8'hab)))),
                      (wire26 + (wire14[(1'h1):(1'h0)] ~^ (wire19 ?
                          (8'ha2) : wire27)))} < wire15[(4'hb):(3'h4)]);
  assign wire30 = wire17[(1'h1):(1'h1)];
  assign wire31 = $signed($unsigned(wire23));
endmodule

module module71
#(parameter param85 = ({((((8'ha2) ? (8'hbb) : (8'hbc)) ^ (~|(8'hbe))) ? ((+(7'h44)) ? ((8'hb8) != (8'hbe)) : ((7'h41) == (8'ha2))) : (~{(8'ha1), (8'hba)})), (^~{(|(8'had)), {(8'hbb)}})} >= {{(-((7'h40) >> (8'hb9))), {(8'ha7)}}, {{(&(8'hba))}}}), 
parameter param86 = (8'hbc))
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire75;
  input wire signed [(4'hf):(1'h0)] wire74;
  input wire signed [(4'hf):(1'h0)] wire73;
  input wire signed [(4'hc):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire76;
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire76,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire76 = $unsigned(((8'hb2) ~^ $unsigned(($signed(wire73) << {wire75}))));
  always
    @(posedge clk) begin
      reg77 <= ({wire74, {((-wire76) ~^ wire76[(1'h1):(1'h0)])}} ?
          $signed(({wire72} ?
              {wire74[(3'h6):(3'h4)], (|(8'hb1))} : $signed(((8'hb5) ?
                  wire73 : wire74)))) : wire74[(4'h9):(2'h3)]);
      reg78 <= (~(wire75[(4'h9):(3'h6)] <= wire75[(3'h4):(2'h2)]));
      if ($unsigned(wire73))
        begin
          reg79 <= $signed((!$signed(((^reg77) ?
              (wire73 & reg78) : wire76[(1'h1):(1'h1)]))));
        end
      else
        begin
          reg79 <= wire74;
        end
      reg80 <= wire75[(3'h5):(1'h1)];
      reg81 <= wire75;
    end
  assign wire82 = $signed($signed((^~reg81)));
  assign wire83 = $unsigned(reg79[(4'h8):(3'h5)]);
  assign wire84 = wire82[(4'h8):(1'h1)];
endmodule
