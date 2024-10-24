module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire192;
  wire signed [(4'ha):(1'h0)] wire191;
  wire [(2'h3):(1'h0)] wire190;
  wire [(2'h3):(1'h0)] wire189;
  wire [(4'hc):(1'h0)] wire188;
  wire signed [(3'h4):(1'h0)] wire187;
  wire [(3'h5):(1'h0)] wire183;
  wire signed [(5'h15):(1'h0)] wire182;
  wire [(5'h12):(1'h0)] wire181;
  wire [(4'hf):(1'h0)] wire180;
  wire [(5'h12):(1'h0)] wire174;
  wire [(5'h12):(1'h0)] wire173;
  wire [(4'hc):(1'h0)] wire171;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire185;
  reg signed [(5'h10):(1'h0)] reg179 = (1'h0);
  reg [(5'h14):(1'h0)] reg178 = (1'h0);
  reg [(5'h10):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg176 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire174,
                 wire173,
                 wire171,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire79,
                 wire185,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 (1'h0)};
  assign wire5 = (wire3[(4'h8):(1'h1)] <<< $unsigned({({wire1} ?
                         (wire3 ? wire0 : wire4) : (wire3 << wire0)),
                     wire4}));
  assign wire6 = $signed(((($signed(wire0) ?
                     wire1 : $unsigned(wire1)) << (&((8'hac) < wire1))) ~^ ($unsigned($unsigned(wire5)) == (8'h9d))));
  assign wire7 = $signed(((!($unsigned(wire1) && $signed((7'h43)))) ?
                     ($signed(wire1[(2'h2):(1'h1)]) != wire1[(1'h1):(1'h1)]) : wire3));
  assign wire8 = $signed((wire5[(5'h10):(4'hc)] ^~ wire7));
  module9 #() modinst80 (wire79, clk, wire5, wire0, wire2, wire8, wire7);
  module81 #() modinst172 (wire171, clk, wire8, wire7, wire1, wire6);
  assign wire173 = wire0[(4'ha):(1'h0)];
  module58 #() modinst175 (wire174, clk, wire0, wire6, wire7, wire2);
  always
    @(posedge clk) begin
      if (wire6)
        begin
          reg176 <= ((wire4 ? $unsigned({$signed(wire1)}) : wire5) ?
              wire4[(3'h6):(3'h6)] : wire174);
          reg177 <= $signed((wire171 >= $unsigned(wire8[(3'h7):(3'h7)])));
          reg178 <= (($unsigned($signed(((8'hb1) ? wire8 : wire174))) ?
                  (wire2[(4'hf):(2'h3)] ?
                      $signed((~|wire7)) : wire174) : wire2) ?
              $signed($unsigned(($signed((8'hb0)) ?
                  $signed(reg176) : ((8'h9d) ?
                      wire0 : wire79)))) : $signed(wire1[(3'h7):(3'h6)]));
        end
      else
        begin
          reg176 <= wire174;
          reg177 <= wire7[(4'h8):(3'h5)];
          reg178 <= {(wire6[(5'h12):(2'h3)] ?
                  (wire171[(4'h9):(1'h1)] != ((~|(8'had)) << wire171)) : reg177),
              (-(-(reg178[(5'h10):(4'hf)] << {wire6, reg178})))};
          reg179 <= (((~|{(reg178 && wire5)}) ?
                  (~^$signed(((8'had) ?
                      (8'ha5) : wire2))) : reg176[(5'h13):(2'h3)]) ?
              wire5 : ($unsigned($signed((8'h9c))) ?
                  ($unsigned((wire6 ? wire171 : wire0)) ?
                      wire174[(1'h1):(1'h1)] : wire0[(5'h11):(4'h9)]) : {$signed((reg178 ?
                          wire2 : (7'h43)))}));
        end
    end
  assign wire180 = ((wire8 ?
                           ((^$signed(reg179)) ?
                               wire0[(4'he):(4'hb)] : {(wire0 ^~ wire4)}) : wire7) ?
                       (wire8[(3'h4):(2'h2)] - ((wire4[(3'h7):(3'h6)] ?
                               $signed(wire79) : $unsigned(wire1)) ?
                           $unsigned($unsigned(wire4)) : (|reg178[(3'h6):(3'h5)]))) : wire3[(3'h7):(1'h0)]);
  assign wire181 = $signed($unsigned($signed($signed($signed(wire180)))));
  assign wire182 = $signed(((reg176[(4'he):(3'h5)] ?
                           $unsigned(reg178) : reg179[(3'h4):(2'h2)]) ?
                       ((|reg178) == (&(wire0 ? wire181 : wire8))) : (8'hb6)));
  module38 #() modinst184 (.y(wire183), .wire39(wire7), .wire40(reg179), .clk(clk), .wire41(wire0), .wire42(wire181));
  module38 #() modinst186 (wire185, clk, wire8, wire79, wire182, reg177);
  assign wire187 = $signed($signed(((^~(+wire79)) >>> $signed((reg176 ?
                       wire171 : wire5)))));
  assign wire188 = $unsigned({((-wire4) < ((wire174 ?
                           wire6 : wire6) + (reg179 - wire187)))});
  assign wire189 = (^(wire7[(4'h8):(2'h2)] <<< wire174[(4'hf):(4'he)]));
  assign wire190 = wire79[(1'h1):(1'h1)];
  assign wire191 = (|wire190);
  assign wire192 = (wire183[(2'h2):(1'h1)] == (7'h41));
endmodule

module module81
#(parameter param170 = (~&(|{{{(8'h9f)}, (-(8'ha5))}})))
(y, clk, wire82, wire83, wire84, wire85);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire82;
  input wire [(4'hc):(1'h0)] wire83;
  input wire [(4'h9):(1'h0)] wire84;
  input wire signed [(4'ha):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire168;
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  assign y = {wire86,
                 wire93,
                 wire168,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire86 = (wire83[(2'h3):(1'h1)] ? wire85 : wire85[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      reg87 <= ($unsigned($signed((^~wire84))) ^ $unsigned(({(~wire85)} ^~ $signed($unsigned(wire84)))));
      if ((~&$signed(reg87)))
        begin
          reg88 <= wire82[(2'h3):(1'h1)];
          reg89 <= reg88[(4'hd):(1'h0)];
          reg90 <= reg87[(2'h2):(2'h2)];
          reg91 <= {reg90};
        end
      else
        begin
          if ($unsigned((({(&reg90)} * reg91[(3'h4):(3'h4)]) ^ $unsigned(wire85))))
            begin
              reg88 <= ((wire86 ?
                  $signed($unsigned((wire84 ?
                      wire86 : reg91))) : {(|wire86[(1'h1):(1'h1)])}) < ($unsigned(({wire84,
                      reg88} ?
                  $unsigned(reg91) : wire82)) <<< (wire83 | (~&wire83[(3'h5):(1'h1)]))));
              reg89 <= (~|(((((7'h43) && (8'haa)) ?
                      reg89[(2'h3):(1'h1)] : wire83[(2'h2):(1'h1)]) ?
                  ((reg89 ? wire84 : reg88) || (wire85 ?
                      wire82 : wire86)) : (^~(reg91 ?
                      reg87 : wire84))) >= (wire84 ?
                  ((reg88 ? wire84 : reg89) ?
                      (wire82 ?
                          wire83 : reg90) : (~|wire84)) : $signed({wire86}))));
              reg90 <= {(~($unsigned($unsigned(wire86)) ?
                      $signed(reg87) : reg91[(1'h1):(1'h0)])),
                  wire84};
              reg91 <= (~^reg91[(4'h8):(2'h3)]);
            end
          else
            begin
              reg88 <= $unsigned((8'ha7));
              reg89 <= {({(wire83[(3'h6):(2'h2)] ?
                          (wire85 ?
                              (8'hbb) : reg90) : $unsigned((8'hbb)))} << (~|wire84)),
                  $unsigned($unsigned((+$signed(wire84))))};
            end
          reg92 <= ($unsigned({reg91[(3'h5):(3'h4)], {$unsigned((8'hb5))}}) ?
              $unsigned((!(&(~^wire85)))) : (^$signed({reg90})));
        end
    end
  assign wire93 = $signed($signed(((&(wire84 ?
                      reg89 : reg88)) ~^ ($signed(reg87) ?
                      $unsigned(reg90) : (8'ha2)))));
  module94 #() modinst169 (.wire98(reg89), .wire95(reg91), .clk(clk), .wire96(wire83), .wire97(reg92), .wire99(reg90), .y(wire168));
endmodule

module module9
#(parameter param77 = (+({(((8'hbf) ? (8'hbf) : (8'had)) ? ((8'ha2) <= (8'hab)) : {(8'ha3), (8'hb9)})} ? (((8'hbc) ? (~&(8'ha9)) : ((8'hb3) && (8'hb8))) & ((|(8'h9e)) ? ((8'hbd) ? (8'hb0) : (8'ha8)) : ((8'ha0) >>> (8'hbe)))) : (((+(8'hac)) >> ((8'haa) * (8'hbe))) ? {((8'h9d) == (8'hae)), ((8'hae) ? (8'hbb) : (8'h9d))} : (((8'hbd) << (8'hb3)) ? (!(8'hbf)) : ((7'h44) ? (8'hb7) : (8'h9f)))))), 
parameter param78 = (8'hb7))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire13;
  input wire [(3'h7):(1'h0)] wire12;
  input wire [(4'h8):(1'h0)] wire11;
  input wire [(4'h8):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire76;
  wire [(3'h5):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire15;
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire73,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire50,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire16,
                 wire15,
                 reg53,
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
                 (1'h0)};
  assign wire15 = wire11[(1'h1):(1'h0)];
  assign wire16 = ((wire14 ?
                      $unsigned(wire10) : (~&$unsigned(wire12))) != (((((8'h9d) || wire13) ?
                              {wire13, wire15} : (wire13 ? wire10 : (8'h9e))) ?
                          wire11 : ((wire13 ? wire13 : (8'hba)) ?
                              wire11 : wire10)) ?
                      ({(wire14 ? wire10 : (8'hac)),
                          (wire13 ?
                              wire14 : wire11)} + (wire12[(3'h6):(2'h2)] == $unsigned(wire14))) : wire14[(5'h10):(1'h0)]));
  always
    @(posedge clk) begin
      reg17 <= wire11;
      reg18 <= ($unsigned($unsigned({reg17, {(8'hb4), wire12}})) ?
          ($signed($unsigned(wire15[(1'h1):(1'h1)])) << (((wire13 - wire12) + (~&wire13)) ?
              $signed({wire15}) : wire16)) : ($signed(wire12) ?
              $unsigned({wire15}) : wire14[(4'hb):(3'h5)]));
      reg19 <= $signed($signed((((wire14 || wire12) ?
              reg17 : (reg17 ? (8'hba) : wire10)) ?
          $unsigned($unsigned(wire16)) : wire13[(5'h10):(4'h9)])));
      if (wire11)
        begin
          reg20 <= wire12;
          reg21 <= (~^(($signed(reg19[(3'h4):(1'h0)]) + reg20[(3'h6):(3'h5)]) && reg17));
          reg22 <= ($unsigned(wire11[(3'h6):(2'h2)]) ?
              wire12 : ($signed(wire14[(5'h15):(3'h7)]) ?
                  $signed($signed((~^(8'hbc)))) : (-wire16[(2'h3):(2'h2)])));
          if (reg19)
            begin
              reg23 <= (($unsigned($unsigned($signed(reg18))) * $signed(($signed(wire12) + $signed((8'h9f))))) ?
                  (8'hbb) : $signed((~$unsigned($signed(reg17)))));
              reg24 <= (wire10 | (^reg23[(2'h2):(1'h0)]));
            end
          else
            begin
              reg23 <= (($signed(wire11[(3'h7):(3'h6)]) ?
                      {wire12} : (($signed(reg24) ?
                          $signed(reg24) : reg17[(4'h9):(3'h5)]) >= ((!reg21) && wire11[(2'h2):(2'h2)]))) ?
                  (reg20[(3'h7):(2'h3)] > ($unsigned({reg18}) || (8'ha6))) : (-(reg17 ?
                      (!$unsigned(reg17)) : {(wire10 ? reg23 : reg17)})));
            end
          if (reg17)
            begin
              reg25 <= wire10;
              reg26 <= reg17;
              reg27 <= ($unsigned(wire11[(3'h4):(1'h0)]) >>> ($unsigned(((^wire10) <= (|(8'hbc)))) ?
                  (^~((!reg23) - $unsigned(reg24))) : wire14[(4'hc):(4'h9)]));
              reg28 <= $signed((+$unsigned((^$unsigned(wire15)))));
              reg29 <= ({$unsigned($unsigned((~&wire10)))} >= $unsigned($unsigned(wire11)));
            end
          else
            begin
              reg25 <= reg20[(3'h6):(3'h6)];
              reg26 <= $unsigned(($signed(((!reg23) ?
                      wire11 : $unsigned(wire16))) ?
                  $unsigned((|$unsigned(wire14))) : (wire12 || (-(~reg21)))));
            end
        end
      else
        begin
          reg20 <= (((reg23[(3'h7):(3'h4)] ?
                  reg29[(1'h0):(1'h0)] : $unsigned((!reg23))) > (reg28[(1'h0):(1'h0)] ?
                  ($unsigned(reg27) ? (|reg24) : reg17) : ({reg29} >= (reg20 ?
                      reg26 : reg26)))) ?
              (^~$unsigned({wire16[(4'h9):(1'h0)], reg18})) : wire13);
          reg21 <= (^~(reg19 ? reg29[(3'h6):(2'h3)] : (8'hb1)));
          reg22 <= ($unsigned((^~$unsigned({reg23}))) ? reg29 : (8'hb6));
          reg23 <= $signed((reg19[(4'h8):(3'h7)] ^~ (+(~&(reg17 && (8'hb7))))));
        end
      reg30 <= $unsigned($signed((^~((reg26 ? reg25 : (8'h9f)) ?
          $unsigned(wire16) : $unsigned(reg22)))));
    end
  assign wire31 = (reg28 >>> ($signed(wire15) <<< $signed(reg27)));
  assign wire32 = ($signed({(+$unsigned(reg25))}) ? wire14 : $unsigned(reg25));
  assign wire33 = reg18;
  assign wire34 = wire14;
  assign wire35 = wire14;
  assign wire36 = reg22[(2'h2):(1'h1)];
  assign wire37 = ($unsigned($unsigned(((wire36 <<< (7'h43)) < $unsigned(reg21)))) ?
                      $unsigned($unsigned($unsigned((wire34 ?
                          reg21 : reg29)))) : (wire32[(3'h7):(3'h5)] != $signed((wire15[(1'h0):(1'h0)] ?
                          wire31 : reg28[(2'h3):(2'h2)]))));
  module38 #() modinst51 (wire50, clk, reg30, reg23, wire11, wire33);
  assign wire52 = wire33;
  always
    @(posedge clk) begin
      if ($unsigned(wire35))
        begin
          reg53 <= ((wire13[(5'h13):(4'h9)] ?
              (wire12 ?
                  $unsigned((wire13 ?
                      reg23 : reg24)) : reg18[(3'h4):(1'h0)]) : (&((reg24 ?
                  reg23 : reg28) ^~ (reg17 ?
                  (8'hb2) : wire37)))) ~^ (&{((reg30 ? reg18 : reg18) ?
                  (-(8'hb2)) : (wire33 ? (8'h9c) : reg24)),
              (^wire36)}));
        end
      else
        begin
          reg53 <= reg24;
        end
    end
  assign wire54 = $signed(reg27[(4'ha):(2'h3)]);
  assign wire55 = $signed(((!wire11) >> {((8'hbd) ?
                          reg23[(4'he):(2'h3)] : (wire14 | reg20)),
                      $signed(wire37)}));
  assign wire56 = (&$unsigned(wire33));
  assign wire57 = reg26;
  module58 #() modinst74 (wire73, clk, reg29, wire50, wire35, reg27);
  assign wire75 = (8'hb7);
  assign wire76 = (reg29 ?
                      $unsigned(reg21[(3'h6):(3'h5)]) : ((((~reg53) ?
                              $unsigned(wire32) : (wire52 != reg22)) ~^ ((wire54 - (8'ha0)) ?
                              $unsigned(wire50) : (wire56 ? (7'h40) : reg26))) ?
                          {{wire32[(4'hc):(3'h4)], (wire34 ? wire35 : (8'ha5))},
                              {(wire57 ? reg29 : wire33)}} : ($unsigned((reg20 ?
                                  reg21 : wire73)) ?
                              (8'hbf) : reg19[(1'h0):(1'h0)])));
endmodule

module module58
#(parameter param72 = (8'haf))
(y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire62;
  input wire [(5'h12):(1'h0)] wire61;
  input wire signed [(5'h12):(1'h0)] wire60;
  input wire [(5'h11):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire64;
  wire signed [(5'h13):(1'h0)] wire63;
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire65,
                 wire64,
                 wire63,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire63 = wire60;
  assign wire64 = $unsigned($unsigned({$signed($unsigned((8'h9f)))}));
  assign wire65 = wire62;
  always
    @(posedge clk) begin
      reg66 <= (&$unsigned($unsigned((~&(wire60 >>> (8'h9e))))));
      reg67 <= wire63;
    end
  assign wire68 = $unsigned($signed((((~wire62) ?
                      $signed(wire61) : wire60[(5'h10):(4'ha)]) <<< $unsigned($signed(wire63)))));
  assign wire69 = (($signed({wire63}) ?
                      $signed(($signed(reg67) ?
                          $unsigned(wire61) : ((7'h43) < reg66))) : (wire64 ~^ $unsigned($unsigned(wire62)))) < reg66[(1'h1):(1'h0)]);
  assign wire70 = wire65;
  assign wire71 = wire69[(3'h6):(1'h0)];
endmodule

module module38
#(parameter param49 = (~^((~(~|((8'hb4) ? (7'h43) : (8'ha3)))) ? (^{((7'h40) ? (8'h9d) : (8'had)), ((8'ha2) ? (8'ha4) : (7'h42))}) : (~&(((8'hb0) ? (8'hb8) : (8'ha5)) > ((8'ha9) > (8'ha1)))))))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire42;
  input wire signed [(4'hf):(1'h0)] wire41;
  input wire [(3'h5):(1'h0)] wire40;
  input wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  assign y = {wire48, wire47, wire46, wire45, wire44, wire43, (1'h0)};
  assign wire43 = (((~wire40[(2'h3):(1'h1)]) ~^ (wire40 ?
                      wire40[(3'h4):(1'h0)] : (wire39 >> $signed(wire42)))) <<< (^$signed(($signed((8'ha3)) != (|wire40)))));
  assign wire44 = wire40[(2'h3):(2'h3)];
  assign wire45 = (wire42 ~^ wire42[(2'h2):(1'h1)]);
  assign wire46 = {$signed(((~|wire45[(5'h11):(3'h7)]) ?
                          $signed($signed(wire42)) : (7'h42)))};
  assign wire47 = wire46[(2'h3):(2'h2)];
  assign wire48 = $unsigned(wire42);
endmodule

module module94
#(parameter param167 = (~&(((~^(|(8'hbd))) << {((8'ha5) | (7'h41))}) ? (~^(((8'ha1) != (8'hbc)) <= (~|(8'hb0)))) : (+{((8'hbe) ^ (8'hb8))}))))
(y, clk, wire99, wire98, wire97, wire96, wire95);
  output wire [(32'h333):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire99;
  input wire [(5'h15):(1'h0)] wire98;
  input wire signed [(5'h15):(1'h0)] wire97;
  input wire [(4'hc):(1'h0)] wire96;
  input wire signed [(5'h11):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire166;
  wire [(5'h12):(1'h0)] wire165;
  wire signed [(3'h7):(1'h0)] wire164;
  wire signed [(5'h13):(1'h0)] wire163;
  wire [(2'h3):(1'h0)] wire162;
  wire signed [(4'hb):(1'h0)] wire161;
  wire [(3'h6):(1'h0)] wire160;
  wire [(4'ha):(1'h0)] wire159;
  wire signed [(4'h8):(1'h0)] wire154;
  wire [(5'h15):(1'h0)] wire153;
  wire signed [(4'he):(1'h0)] wire152;
  wire [(5'h15):(1'h0)] wire151;
  wire [(5'h10):(1'h0)] wire150;
  wire signed [(5'h10):(1'h0)] wire149;
  wire signed [(4'h9):(1'h0)] wire145;
  wire signed [(4'hb):(1'h0)] wire143;
  wire [(4'hc):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire100;
  reg signed [(4'he):(1'h0)] reg158 = (1'h0);
  reg [(5'h15):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(4'ha):(1'h0)] reg146 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg141 = (1'h0);
  reg [(3'h6):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(2'h3):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg136 = (1'h0);
  reg [(4'h8):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire145,
                 wire143,
                 wire115,
                 wire100,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg148,
                 reg147,
                 reg146,
                 reg144,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
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
                 (1'h0)};
  assign wire100 = {(wire99 & (((wire98 << wire96) + $unsigned(wire99)) << $unsigned(wire97[(4'hb):(1'h1)]))),
                       ($unsigned(wire95) << $unsigned((wire97 | wire97[(1'h0):(1'h0)])))};
  always
    @(posedge clk) begin
      reg101 <= $signed(($unsigned($unsigned($signed(wire99))) ?
          wire98[(2'h2):(1'h1)] : $unsigned(wire99[(2'h2):(2'h2)])));
      if (((($signed($signed((8'hb4))) >> ((wire95 ? wire95 : wire96) ?
                  wire96 : ((8'hbc) >> wire97))) ?
              wire99 : (-$unsigned(wire99))) ?
          ({wire98} ?
              {$unsigned(wire98[(1'h1):(1'h1)]),
                  wire95} : wire96) : $unsigned((wire99 >= $signed((wire96 || reg101))))))
        begin
          reg102 <= ((|wire100[(4'h9):(1'h1)]) > reg101);
          if (wire100)
            begin
              reg103 <= (&(reg102[(3'h6):(1'h1)] ?
                  wire96[(4'h9):(2'h3)] : $signed($signed($signed(wire99)))));
            end
          else
            begin
              reg103 <= ($unsigned({$unsigned(reg101[(5'h10):(4'ha)]),
                      $unsigned((wire96 >>> wire97))}) ?
                  (($signed((reg101 ? wire96 : wire100)) >> (8'hb7)) ?
                      wire96 : (7'h43)) : {(~&(8'hbe))});
            end
          if (((((reg103 <<< ((8'hac) >>> reg103)) ?
              (wire100 >>> (^~wire96)) : wire96[(4'h9):(3'h4)]) << ((wire99[(4'hd):(1'h1)] || wire99) ?
              ((wire96 | wire95) ?
                  wire99 : (~&wire97)) : (&$unsigned((8'h9f))))) << {(wire98[(2'h2):(1'h0)] != wire95)}))
            begin
              reg104 <= $unsigned($signed((wire100 ?
                  $signed($signed(wire96)) : reg101)));
              reg105 <= $signed({{((reg103 * wire98) ^ {wire95})},
                  {((wire97 ^ reg102) == $unsigned(reg101))}});
              reg106 <= $signed(wire97);
              reg107 <= $unsigned($unsigned((($signed(reg106) >>> wire98[(5'h13):(4'h8)]) ?
                  wire99[(4'hf):(3'h4)] : reg105[(3'h5):(2'h2)])));
            end
          else
            begin
              reg104 <= $signed(reg104);
              reg105 <= (8'h9c);
              reg106 <= (($unsigned(($unsigned(reg103) ?
                          (wire99 ? reg105 : reg101) : reg105)) ?
                      ({reg102} >> reg104) : $unsigned($signed((^~wire96)))) ?
                  $unsigned({$unsigned(reg104[(2'h2):(2'h2)]),
                      $unsigned((~&wire96))}) : {(~^($unsigned(wire100) || $signed(wire97))),
                      ($unsigned((8'hbd)) <<< {(wire98 ? reg101 : wire98)})});
            end
          reg108 <= (reg103 ?
              (~$unsigned({(reg106 ? (8'ha6) : reg103),
                  wire98})) : {(reg106[(1'h0):(1'h0)] && $unsigned(reg103))});
          if ($signed((~|((wire99[(3'h5):(2'h2)] ?
              wire98 : reg104[(4'hb):(3'h5)]) ^ ($signed((8'ha2)) ~^ $signed(reg101))))))
            begin
              reg109 <= {((~|$unsigned((wire98 ? wire96 : wire96))) ?
                      reg108 : reg101),
                  (wire96[(3'h5):(3'h5)] ?
                      $unsigned({wire100,
                          $unsigned(reg106)}) : (((wire96 | reg102) ?
                          (8'hb3) : ((7'h41) <<< (8'hb5))) <<< {$unsigned(reg104)}))};
              reg110 <= $signed((reg105[(3'h7):(3'h6)] ?
                  (((reg107 ? wire98 : wire99) ?
                          $signed(wire98) : reg103[(3'h6):(3'h6)]) ?
                      ((^~wire96) == (8'hb9)) : $signed((~^reg103))) : reg109[(4'h8):(1'h1)]));
              reg111 <= $unsigned($signed($unsigned($unsigned(wire96[(4'hc):(3'h4)]))));
              reg112 <= (wire95 ^ (wire98[(3'h4):(1'h0)] != (({(8'hb3),
                          reg108} ?
                      (wire99 >> reg111) : {(8'h9f)}) ?
                  ($signed(reg104) ?
                      (wire97 ?
                          reg108 : reg101) : (reg102 > (8'hb4))) : ((reg105 ?
                      wire96 : wire97) ^ reg102[(3'h6):(3'h6)]))));
              reg113 <= {((reg103 == (&(wire100 ?
                      (7'h42) : reg106))) && $unsigned($signed(wire97[(5'h11):(3'h7)]))),
                  ($signed($unsigned(wire100)) != ((!$signed(wire95)) ?
                      (!reg109[(2'h2):(1'h1)]) : reg106[(2'h3):(2'h2)]))};
            end
          else
            begin
              reg109 <= $signed(reg106);
              reg110 <= (reg105 | reg103[(1'h1):(1'h0)]);
              reg111 <= wire100[(4'hc):(3'h5)];
              reg112 <= (^reg110[(4'h8):(3'h4)]);
              reg113 <= (^~{($unsigned({wire96, (8'hba)}) | $unsigned((reg111 ?
                      reg112 : reg106)))});
            end
        end
      else
        begin
          reg102 <= wire97;
          reg103 <= reg108[(5'h10):(4'hd)];
          if (((~&$signed((~|{(8'ha2)}))) != ((~^reg108) >> (reg109 <<< $signed(wire100)))))
            begin
              reg104 <= wire99[(5'h13):(4'he)];
              reg105 <= ($unsigned((~^reg103[(1'h0):(1'h0)])) > $unsigned(reg101[(4'ha):(3'h5)]));
              reg106 <= ({{(reg105 ?
                          $unsigned(wire98) : ((8'ha5) ?
                              wire96 : (8'hb6)))}} <<< $signed(((8'hba) ?
                  $signed((reg113 << wire98)) : $unsigned({reg112}))));
            end
          else
            begin
              reg104 <= reg106[(1'h0):(1'h0)];
              reg105 <= wire96[(4'h9):(3'h6)];
              reg106 <= reg108[(4'h8):(3'h6)];
            end
          if ((reg104 ?
              (+$unsigned($signed((-wire96)))) : $unsigned($signed($unsigned(wire96[(4'hb):(3'h5)])))))
            begin
              reg107 <= (((~reg107) == {reg103,
                  reg110}) ^~ (reg107[(3'h4):(1'h0)] != reg102));
              reg108 <= (8'hb2);
              reg109 <= {reg106[(2'h3):(2'h2)], reg105};
              reg110 <= (8'ha4);
              reg111 <= {$unsigned(((^(^reg113)) ^ ($unsigned(wire99) == $signed(wire97))))};
            end
          else
            begin
              reg107 <= reg106[(2'h3):(1'h1)];
              reg108 <= reg108;
              reg109 <= (~^{((wire98[(4'ha):(4'h9)] ?
                          reg110 : $unsigned((8'had))) ?
                      reg101 : {$signed(wire99), $unsigned(wire98)}),
                  reg103[(3'h5):(1'h1)]});
              reg110 <= {$unsigned(((&$unsigned((8'hba))) > ($signed(reg102) > $signed(reg111))))};
            end
        end
      reg114 <= (reg101 && wire96);
    end
  assign wire115 = reg107;
  always
    @(posedge clk) begin
      if ($signed($signed((~&$signed(reg109[(4'hd):(3'h7)])))))
        begin
          if ((8'ha5))
            begin
              reg116 <= $signed($unsigned($signed($unsigned($signed(reg110)))));
              reg117 <= $unsigned((reg106[(1'h0):(1'h0)] >>> reg103));
              reg118 <= (8'hbe);
              reg119 <= (^~$unsigned((reg102 ?
                  ((reg107 ?
                      wire95 : wire97) < {(8'hb6)}) : ($unsigned(reg114) ?
                      reg104 : $signed((8'hba))))));
              reg120 <= $unsigned((-((~|$signed(reg114)) <= ($unsigned((8'h9c)) && $signed(reg103)))));
            end
          else
            begin
              reg116 <= ((-$signed($unsigned((reg118 ?
                  reg111 : wire96)))) + $unsigned(({(reg120 ?
                      reg120 : (8'had))} > ((reg103 | reg108) == (reg103 >>> reg119)))));
              reg117 <= $signed(({$signed((wire115 > reg103)),
                      (~^(reg117 ? (8'ha3) : reg119))} ?
                  (~|$signed((wire115 ?
                      reg119 : reg106))) : $unsigned(($unsigned(reg108) & {reg108,
                      reg117}))));
            end
        end
      else
        begin
          reg116 <= (&reg120);
          if (reg118[(4'ha):(3'h4)])
            begin
              reg117 <= ((({$unsigned(reg114),
                      $signed(wire98)} >> $unsigned($unsigned(reg112))) ?
                  $signed(reg111[(1'h1):(1'h0)]) : ((|reg114[(4'hf):(4'hd)]) | (reg119[(3'h4):(1'h1)] ?
                      wire99 : $unsigned(wire115)))) >= $signed($unsigned($unsigned($signed((8'hac))))));
              reg118 <= $signed((+(reg105 ?
                  $unsigned((reg104 ?
                      reg104 : reg108)) : (~^(reg120 >> reg104)))));
              reg119 <= (~^({wire96,
                  $unsigned($unsigned((8'ha7)))} + {(&$signed(reg112))}));
            end
          else
            begin
              reg117 <= ($unsigned($unsigned(({reg102, reg120} && (wire115 ?
                      reg110 : wire96)))) ?
                  $unsigned($signed(wire115)) : $unsigned(reg119));
              reg118 <= {$signed(reg108)};
              reg119 <= $signed($unsigned(($signed($unsigned(reg117)) ?
                  {(reg117 ~^ wire97)} : reg119)));
              reg120 <= $unsigned({$unsigned(reg101[(3'h7):(3'h6)])});
              reg121 <= (((~|(!(wire95 | reg114))) ?
                  reg101[(5'h11):(4'hb)] : reg104) & {wire115});
            end
          reg122 <= {$unsigned($signed(reg107[(4'h8):(4'h8)]))};
          reg123 <= $unsigned($unsigned({$unsigned($unsigned(reg119))}));
        end
      reg124 <= (8'hb8);
      if ((((reg112 ?
              $signed((wire115 ? reg104 : reg106)) : $signed((~|reg120))) ?
          {$unsigned($signed(reg106))} : reg101) ^~ reg107))
        begin
          if (reg117[(2'h3):(1'h1)])
            begin
              reg125 <= ((^~(&((+reg123) >>> reg124))) ?
                  reg110 : ((~reg107) || wire95));
              reg126 <= reg116[(2'h3):(2'h2)];
              reg127 <= (reg104 ?
                  ((8'hb1) >= (^~({reg109,
                      reg106} == $unsigned(reg113)))) : {reg120[(1'h1):(1'h0)],
                      {({reg113, wire99} ? $unsigned(reg123) : reg109),
                          reg101[(4'ha):(3'h6)]}});
            end
          else
            begin
              reg125 <= ($unsigned(wire98) ? reg102[(3'h5):(3'h4)] : (8'hb9));
            end
          reg128 <= ($signed(($unsigned(((7'h44) < wire115)) * (wire95 >>> ((8'hbd) ?
                  reg123 : reg112)))) ?
              reg124 : {wire96[(3'h4):(3'h4)]});
          reg129 <= $unsigned(((8'ha4) && wire98));
        end
      else
        begin
          reg125 <= reg125[(4'hc):(3'h5)];
          if (reg123[(1'h0):(1'h0)])
            begin
              reg126 <= reg109;
              reg127 <= (7'h40);
              reg128 <= ($signed(({(reg129 + reg107), $signed(reg101)} ?
                      (-(wire97 ? reg125 : reg108)) : reg113)) ?
                  {reg125[(4'h8):(2'h2)]} : reg102);
              reg129 <= ($signed($unsigned($signed(reg114))) ^ ({((reg120 ?
                      wire100 : reg103) ^~ $unsigned((8'ha6)))} > reg121));
            end
          else
            begin
              reg126 <= $signed((reg125 ?
                  (8'hba) : $unsigned($unsigned($unsigned(reg105)))));
              reg127 <= (reg124 ?
                  (reg126[(4'h8):(2'h3)] ?
                      reg117[(4'h9):(3'h4)] : ((reg122 ?
                          {reg105,
                              (8'hbd)} : reg126[(2'h2):(1'h0)]) <<< (((8'h9f) >> (8'hb8)) || $signed(reg122)))) : $unsigned(({{reg118},
                      (reg124 - reg106)} != (~|reg117[(1'h0):(1'h0)]))));
              reg128 <= ($unsigned((wire97[(4'hf):(4'ha)] ?
                  reg107 : reg114)) < ((8'h9d) ?
                  $signed((wire99[(4'hd):(4'h9)] ?
                      $unsigned((8'ha8)) : $signed((8'hae)))) : {reg123,
                      $signed({reg128})}));
              reg129 <= $signed($signed((+($signed(reg105) != $signed(wire100)))));
              reg130 <= (8'hb1);
            end
        end
      reg131 <= ((!{($unsigned(reg128) ?
              $signed((8'ha9)) : (reg116 ? reg111 : wire96)),
          $unsigned((~&wire100))}) && $signed(((reg119[(4'hd):(4'h9)] ?
              ((7'h44) != wire97) : (wire95 ? reg116 : (8'had))) ?
          wire95[(3'h5):(2'h3)] : $signed(reg129))));
      if ((reg111 ?
          $signed(reg104[(4'hf):(1'h0)]) : {$signed($unsigned((reg129 || reg112))),
              (reg120 ? {reg130[(4'h9):(4'h9)]} : wire100)}))
        begin
          reg132 <= $unsigned(reg128);
          if ((8'ha5))
            begin
              reg133 <= reg131[(2'h2):(2'h2)];
              reg134 <= (~&$signed($signed(reg104)));
              reg135 <= wire98;
              reg136 <= ((^($signed((reg116 ? reg117 : reg132)) ?
                      ($signed(reg128) >>> (reg112 != reg128)) : $unsigned(wire98[(5'h15):(3'h4)]))) ?
                  ((8'hac) ?
                      ($signed($unsigned((8'h9c))) ?
                          (!(8'h9f)) : (reg104 ?
                              reg105 : $signed((8'ha0)))) : $signed($signed((8'h9d)))) : wire98[(5'h10):(4'hc)]);
            end
          else
            begin
              reg133 <= (((^~((reg113 ?
                  (8'ha8) : wire96) >>> $signed((8'hae)))) <<< $unsigned(((reg118 <<< reg127) ?
                  $unsigned(wire96) : (8'h9d)))) ^ (wire98[(5'h13):(1'h1)] ?
                  (^reg117) : (&reg113[(2'h3):(1'h1)])));
              reg134 <= (7'h44);
            end
          reg137 <= {$signed(reg108[(1'h0):(1'h0)])};
          if (reg121[(3'h5):(3'h5)])
            begin
              reg138 <= (8'ha6);
              reg139 <= reg103[(2'h3):(1'h1)];
              reg140 <= reg121[(2'h2):(1'h0)];
              reg141 <= reg107;
              reg142 <= ((~^$signed($unsigned((reg136 ? (8'ha4) : reg127)))) ?
                  $unsigned((reg105 >>> (8'hac))) : (+(+reg109)));
            end
          else
            begin
              reg138 <= ($unsigned((wire95[(1'h1):(1'h0)] == reg142[(2'h2):(2'h2)])) ^ {($signed((~|reg112)) & (reg111 > reg118[(4'hc):(4'h8)])),
                  $unsigned((((8'hb7) ? reg103 : reg112) ?
                      (reg111 > (8'hb1)) : (reg132 ? reg136 : wire98)))});
              reg139 <= reg136[(3'h7):(3'h4)];
              reg140 <= (~$unsigned(($signed(reg104) * reg130[(3'h6):(1'h0)])));
            end
        end
      else
        begin
          if (($unsigned(reg107[(2'h3):(1'h1)]) ?
              (reg106 ?
                  (reg105 ?
                      reg119[(5'h11):(2'h3)] : $unsigned(reg106[(3'h4):(1'h1)])) : $unsigned(((+(8'ha4)) <= wire98[(5'h15):(4'h8)]))) : wire115[(1'h0):(1'h0)]))
            begin
              reg132 <= reg103[(4'hb):(1'h0)];
              reg133 <= {$signed((~{reg132[(4'hb):(4'hb)], (8'hae)}))};
              reg134 <= reg107[(3'h4):(3'h4)];
              reg135 <= (((+{{(7'h42), (8'h9e)},
                      (reg102 >>> reg141)}) * $signed(reg142)) ?
                  $signed(reg133) : $unsigned($unsigned(((~|(7'h44)) ^ $unsigned(reg141)))));
              reg136 <= $signed($unsigned((~$unsigned($unsigned(reg101)))));
            end
          else
            begin
              reg132 <= $signed(((((reg135 ? reg124 : reg105) & (^~reg120)) ?
                  ({reg127} << ((7'h44) ?
                      reg111 : reg110)) : $unsigned(reg132)) <<< ((reg111[(1'h0):(1'h0)] - (~reg112)) ?
                  (reg118[(4'hc):(2'h2)] > (8'hb8)) : $signed(((8'hba) ?
                      (8'ha9) : reg130)))));
              reg133 <= reg118[(2'h3):(2'h2)];
              reg134 <= $unsigned(reg133[(4'h9):(3'h6)]);
              reg135 <= (~(($unsigned(reg119[(2'h3):(1'h1)]) >>> (+(reg130 ?
                      reg111 : reg110))) ?
                  (-$signed(reg130[(2'h3):(1'h1)])) : reg125));
            end
          reg137 <= (({$signed(reg134)} > ($unsigned((reg142 ?
                      reg111 : reg114)) ?
                  $unsigned((+wire99)) : (wire100[(3'h5):(1'h1)] ?
                      (reg107 ? reg113 : reg142) : $unsigned(reg128)))) ?
              reg128[(1'h0):(1'h0)] : (((reg117 | $signed(reg123)) >= (8'haa)) ?
                  $unsigned(($unsigned((8'hb7)) ^ reg107[(4'ha):(1'h1)])) : ($unsigned(reg102) ?
                      $unsigned($unsigned(wire99)) : reg109[(3'h6):(3'h5)])));
          reg138 <= (((^~($unsigned(reg120) ?
                      $signed((8'hbf)) : {wire95, reg116})) ?
                  $unsigned(wire96) : {$signed($signed(reg123)),
                      $unsigned(wire97[(4'ha):(3'h6)])}) ?
              $unsigned(reg129) : ((reg108 ?
                      $signed({wire96, reg105}) : ($signed((7'h43)) ?
                          $signed(reg139) : (reg142 > wire96))) ?
                  ((^~(8'hbc)) - (reg121 | $signed(reg103))) : reg123[(2'h2):(2'h2)]));
        end
    end
  assign wire143 = $unsigned((~|(reg117[(3'h5):(1'h1)] ?
                       $unsigned($unsigned(reg123)) : $unsigned((8'ha7)))));
  always
    @(posedge clk) begin
      reg144 <= reg118[(3'h4):(2'h2)];
    end
  assign wire145 = ($unsigned($unsigned((wire96[(3'h6):(3'h6)] ?
                           (reg142 ? reg125 : reg120) : {reg134}))) ?
                       $unsigned($unsigned(reg109)) : $signed($signed((~&(|(8'hb9))))));
  always
    @(posedge clk) begin
      reg146 <= ((wire115 - $signed((^~reg111[(3'h5):(2'h3)]))) != reg137[(4'he):(4'hd)]);
      reg147 <= ((reg111 ?
          reg119[(4'hb):(4'ha)] : {($unsigned(reg104) ?
                  reg139 : reg119[(4'h8):(1'h0)]),
              reg132}) < reg129);
      reg148 <= $unsigned({$unsigned(reg136), $signed({{wire99, reg147}})});
    end
  assign wire149 = ($signed($unsigned(reg121[(3'h4):(1'h1)])) << ($unsigned($signed($signed(reg102))) && ($signed($signed(reg137)) && $unsigned(reg136))));
  assign wire150 = (-reg106);
  assign wire151 = $unsigned(($unsigned((|wire96)) ?
                       wire95 : $unsigned((~&reg147))));
  assign wire152 = $signed(((+$unsigned((reg101 ?
                       reg128 : reg119))) > ((reg127[(3'h7):(2'h3)] >>> wire151) ?
                       (^~((8'hb9) <= reg109)) : reg138)));
  assign wire153 = (reg133 ?
                       $unsigned($signed($signed((^reg130)))) : ((((reg131 ?
                               reg133 : wire150) <<< wire149) != wire151) ?
                           ((!((8'hb2) >>> wire152)) ?
                               reg130[(3'h5):(1'h1)] : {$unsigned(reg113)}) : {reg133,
                               ((reg124 ? reg114 : (8'hb6)) ?
                                   $signed(wire100) : (reg118 ?
                                       reg127 : reg108))}));
  assign wire154 = reg121[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg155 <= ((reg147 ? (^$signed(reg128[(3'h6):(3'h6)])) : (8'ha0)) ?
          (8'h9f) : reg129[(4'ha):(3'h7)]);
      reg156 <= $unsigned((!$signed($signed(reg112[(2'h2):(1'h0)]))));
      reg157 <= reg130[(1'h0):(1'h0)];
      reg158 <= $signed((wire98 ~^ reg104[(3'h6):(1'h1)]));
    end
  assign wire159 = ((+$unsigned(wire153[(4'hb):(1'h0)])) && wire95);
  assign wire160 = $unsigned((($signed((wire149 == (8'ha1))) ?
                           $signed({reg103,
                               (8'h9e)}) : wire151[(5'h12):(4'hb)]) ?
                       wire97 : ($signed($signed(reg118)) | ((reg130 ?
                           reg130 : reg112) ~^ (reg139 != reg102)))));
  assign wire161 = (^(reg137 ?
                       $unsigned((wire115[(2'h3):(1'h0)] ?
                           reg141 : reg138)) : $signed($unsigned(reg146))));
  assign wire162 = $signed(wire145);
  assign wire163 = (+reg142);
  assign wire164 = $unsigned(reg137[(4'ha):(3'h4)]);
  assign wire165 = (reg134[(2'h3):(1'h1)] ?
                       (((~^reg118[(4'h9):(2'h3)]) | wire143[(4'h9):(3'h6)]) ^ wire145) : reg130[(3'h7):(1'h0)]);
  assign wire166 = reg105[(4'ha):(3'h6)];
endmodule
