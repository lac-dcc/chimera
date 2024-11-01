module top
#(parameter param257 = (8'ha9), 
parameter param258 = ({param257} ? (~|(8'haa)) : param257))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire256;
  wire [(4'h8):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire254;
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire256,
                 wire73,
                 wire18,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire254,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire5 = {$signed(({$unsigned(wire0),
                         (~wire4)} <<< $signed((wire0 < wire4))))};
  assign wire6 = $unsigned((8'haf));
  assign wire7 = $unsigned(wire5);
  assign wire8 = wire2[(2'h3):(2'h3)];
  assign wire9 = $unsigned(wire1[(4'hc):(3'h6)]);
  always
    @(posedge clk) begin
      if ($unsigned(wire3))
        begin
          reg10 <= $unsigned((8'hbb));
          reg11 <= {{$signed(wire6)}};
          if ({wire1})
            begin
              reg12 <= (~&$unsigned(wire6[(2'h2):(1'h1)]));
              reg13 <= ($signed((((wire6 ? wire9 : wire5) ?
                          $unsigned(wire5) : (wire7 <<< wire5)) ?
                      $unsigned((+reg12)) : (~^reg10))) ?
                  wire3[(1'h1):(1'h1)] : $unsigned(($unsigned(reg10[(3'h6):(1'h0)]) ?
                      (~|reg12) : (wire7[(1'h0):(1'h0)] == (wire2 ?
                          reg11 : wire5)))));
              reg14 <= (8'hb4);
              reg15 <= ((wire7[(4'ha):(4'h8)] ?
                  wire4 : reg14[(4'h8):(2'h3)]) || wire6[(3'h4):(2'h3)]);
            end
          else
            begin
              reg12 <= (-wire2[(1'h0):(1'h0)]);
              reg13 <= (+reg11);
              reg14 <= wire8;
              reg15 <= wire3[(4'h9):(3'h6)];
            end
          reg16 <= (|wire8);
        end
      else
        begin
          reg10 <= $signed(($unsigned(reg14) ^ ((wire8[(4'ha):(1'h0)] && (+wire2)) - $signed((~^wire3)))));
          reg11 <= $unsigned((~|reg13[(4'hc):(1'h0)]));
          reg12 <= $signed((^$unsigned(((-reg11) ?
              (~&reg12) : $unsigned(wire4)))));
          if (wire3[(4'hc):(2'h2)])
            begin
              reg13 <= ({wire4} ? reg14 : reg11[(1'h1):(1'h1)]);
              reg14 <= reg14;
              reg15 <= (wire0[(2'h3):(1'h1)] ? wire3 : reg14);
            end
          else
            begin
              reg13 <= wire4[(2'h3):(2'h2)];
              reg14 <= wire0;
              reg15 <= ((|$unsigned(((~^reg11) ?
                  wire7 : (reg10 ?
                      reg10 : wire0)))) << $unsigned((~($signed((8'hac)) != {(8'hb7)}))));
              reg16 <= reg15[(3'h6):(3'h6)];
              reg17 <= wire0[(3'h5):(2'h3)];
            end
        end
    end
  assign wire18 = ({({((8'ha3) ? wire0 : reg12),
                              wire4} || (reg13 ^~ reg12[(2'h2):(2'h2)]))} ?
                      wire1 : $unsigned($signed(wire1[(4'h8):(1'h1)])));
  module19 #() modinst74 (.wire20(wire18), .y(wire73), .wire23(wire5), .wire21(wire4), .wire22(reg14), .clk(clk));
  module75 #() modinst255 (.y(wire254), .clk(clk), .wire78(wire18), .wire80(wire7), .wire76(wire3), .wire77(reg11), .wire79(reg16));
  assign wire256 = (reg12[(3'h6):(3'h6)] ?
                       (reg16 ^~ (($unsigned(reg12) ?
                               reg16[(3'h7):(1'h0)] : {wire5, reg14}) ?
                           reg15[(4'hb):(3'h6)] : (8'hb0))) : (&(+$signed($unsigned(wire1)))));
endmodule

module module75
#(parameter param253 = {(&((8'hbc) <<< {((8'hb9) - (8'ha7))}))})
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h274):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire80;
  input wire [(4'h8):(1'h0)] wire79;
  input wire [(4'he):(1'h0)] wire78;
  input wire [(5'h13):(1'h0)] wire77;
  input wire signed [(4'he):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire246;
  wire signed [(4'h9):(1'h0)] wire245;
  wire signed [(4'ha):(1'h0)] wire220;
  wire signed [(5'h11):(1'h0)] wire219;
  wire [(4'ha):(1'h0)] wire217;
  wire [(4'hd):(1'h0)] wire191;
  wire signed [(4'h8):(1'h0)] wire150;
  wire [(5'h11):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire121;
  wire [(5'h14):(1'h0)] wire120;
  wire [(5'h12):(1'h0)] wire119;
  wire [(5'h15):(1'h0)] wire118;
  wire signed [(4'ha):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire81;
  reg [(4'h9):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg251 = (1'h0);
  reg [(5'h11):(1'h0)] reg250 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg249 = (1'h0);
  reg [(5'h14):(1'h0)] reg248 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg247 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg244 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg243 = (1'h0);
  reg [(3'h7):(1'h0)] reg242 = (1'h0);
  reg [(4'ha):(1'h0)] reg241 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg240 = (1'h0);
  reg [(4'hc):(1'h0)] reg239 = (1'h0);
  reg [(2'h2):(1'h0)] reg238 = (1'h0);
  reg [(4'h8):(1'h0)] reg237 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg236 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg235 = (1'h0);
  reg [(4'hd):(1'h0)] reg234 = (1'h0);
  reg [(4'h9):(1'h0)] reg233 = (1'h0);
  reg [(4'he):(1'h0)] reg232 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg231 = (1'h0);
  reg [(4'hd):(1'h0)] reg230 = (1'h0);
  reg [(4'h8):(1'h0)] reg229 = (1'h0);
  reg [(5'h11):(1'h0)] reg228 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg227 = (1'h0);
  reg [(5'h10):(1'h0)] reg226 = (1'h0);
  reg [(4'h9):(1'h0)] reg225 = (1'h0);
  reg [(2'h2):(1'h0)] reg224 = (1'h0);
  reg [(5'h14):(1'h0)] reg223 = (1'h0);
  reg [(4'hb):(1'h0)] reg222 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg221 = (1'h0);
  assign y = {wire246,
                 wire245,
                 wire220,
                 wire219,
                 wire217,
                 wire191,
                 wire150,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire116,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 (1'h0)};
  assign wire81 = ((8'hac) ^ (^~($unsigned(wire77) == $signed({wire79}))));
  assign wire82 = $unsigned($signed(wire80[(1'h0):(1'h0)]));
  assign wire83 = $signed(wire77[(5'h11):(5'h10)]);
  assign wire84 = $unsigned({(^~wire77[(1'h1):(1'h0)])});
  assign wire85 = wire84;
  module86 #() modinst117 (.y(wire116), .wire88(wire77), .wire89(wire78), .wire90(wire76), .wire87(wire81), .clk(clk));
  assign wire118 = ($signed(wire79) ?
                       {(($signed(wire82) ^~ (wire80 ?
                               wire76 : wire77)) ^ wire76),
                           (({wire81,
                               wire77} | wire81[(3'h7):(3'h7)]) + (~$signed(wire77)))} : $signed($unsigned(wire85[(3'h7):(1'h0)])));
  assign wire119 = $unsigned($unsigned((~|wire78)));
  assign wire120 = wire85[(2'h2):(2'h2)];
  assign wire121 = wire80[(1'h0):(1'h0)];
  assign wire122 = wire81[(4'hf):(4'h8)];
  module123 #() modinst151 (wire150, clk, wire78, wire122, wire121, wire120);
  module152 #() modinst192 (wire191, clk, wire85, wire116, wire120, wire83);
  module193 #() modinst218 (wire217, clk, wire76, wire118, wire77, wire122);
  assign wire219 = wire80;
  assign wire220 = wire122[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if ((($unsigned(wire79[(3'h5):(3'h5)]) ?
          (wire78 + (^~(~wire79))) : (wire118[(1'h1):(1'h1)] || wire116[(4'h9):(3'h4)])) >= wire84))
        begin
          reg221 <= wire77;
        end
      else
        begin
          reg221 <= ($signed($signed(wire220)) ?
              (^(+$signed((~&wire81)))) : wire220);
          reg222 <= wire81[(1'h0):(1'h0)];
          reg223 <= wire83;
        end
      if ((7'h44))
        begin
          reg224 <= wire217[(3'h5):(3'h5)];
          reg225 <= $unsigned((~^(|(!$signed(wire122)))));
        end
      else
        begin
          reg224 <= $signed(((reg223 || wire119[(2'h3):(2'h3)]) ^~ wire116[(2'h2):(2'h2)]));
          if ($unsigned((8'ha3)))
            begin
              reg225 <= ($signed($signed((|(~reg222)))) <= (wire82 ?
                  $unsigned((!wire82)) : {$unsigned(wire150[(1'h1):(1'h1)])}));
              reg226 <= (($unsigned(reg223) || $unsigned($unsigned(reg223))) ?
                  wire81 : wire84[(5'h12):(4'ha)]);
              reg227 <= wire80[(1'h0):(1'h0)];
              reg228 <= ((~^(($unsigned(wire119) ?
                      $unsigned(wire82) : (-wire150)) ^~ wire219)) ?
                  (!(wire78[(4'hc):(3'h6)] ?
                      wire217 : ((|wire217) ?
                          $unsigned(wire116) : $signed(reg226)))) : ($unsigned($unsigned((wire219 ?
                      wire121 : wire118))) || (+(wire85 ?
                      {wire84, wire120} : ((8'ha6) ? wire83 : reg227)))));
              reg229 <= wire81;
            end
          else
            begin
              reg225 <= wire150;
              reg226 <= $signed(wire83[(5'h13):(3'h7)]);
              reg227 <= ($unsigned(reg221[(1'h0):(1'h0)]) == wire79[(3'h6):(3'h6)]);
              reg228 <= ($unsigned($unsigned((~|$signed((8'ha8))))) ?
                  $unsigned({reg224[(2'h2):(1'h1)]}) : wire150[(2'h2):(1'h1)]);
            end
          if (((!(reg229[(2'h2):(1'h0)] >> wire79)) ?
              $unsigned((((~|wire116) >> (wire119 || wire150)) ?
                  $signed(wire80[(2'h2):(1'h1)]) : (~&(reg228 ?
                      wire77 : wire220)))) : ($unsigned(((wire78 ?
                          (8'ha0) : reg224) ?
                      $unsigned(wire77) : wire122)) ?
                  ({wire77[(5'h12):(3'h4)], wire120[(5'h10):(3'h4)]} ?
                      $unsigned($signed(reg223)) : (((7'h40) + wire217) <<< (!wire219))) : wire217[(3'h5):(2'h3)])))
            begin
              reg230 <= $signed(wire83);
              reg231 <= reg226;
              reg232 <= reg225[(1'h0):(1'h0)];
              reg233 <= $unsigned($signed(($unsigned((8'hbc)) ?
                  ((reg223 <= (8'hb7)) - wire84) : ($unsigned(reg222) ?
                      (reg226 ? (8'hac) : (8'hbb)) : $signed(wire118)))));
            end
          else
            begin
              reg230 <= wire80[(1'h1):(1'h0)];
              reg231 <= (&{$unsigned(((~wire217) ?
                      (+wire119) : wire85[(1'h1):(1'h0)]))});
              reg232 <= $unsigned(wire217[(2'h3):(2'h2)]);
              reg233 <= ($signed($unsigned((wire76[(3'h4):(2'h2)] <<< (wire191 <<< reg231)))) ?
                  wire121 : {((+(wire78 ~^ reg228)) || $unsigned({wire83})),
                      ((^$signed(wire77)) ?
                          wire84 : $signed($signed(wire118)))});
            end
          reg234 <= $unsigned(wire80);
          if (reg227[(2'h2):(2'h2)])
            begin
              reg235 <= wire116;
              reg236 <= reg227[(3'h4):(2'h2)];
            end
          else
            begin
              reg235 <= wire120;
            end
        end
      reg237 <= {$signed(($signed((wire79 >>> wire118)) + ((reg235 >= reg224) ~^ (!(8'hb6))))),
          reg231[(2'h3):(2'h3)]};
      if ((((&$unsigned(reg229)) ?
              ((~|(-(8'h9f))) ?
                  (^~reg232[(4'ha):(4'ha)]) : $unsigned((reg226 < reg237))) : (reg226[(4'he):(3'h5)] < wire81)) ?
          reg235 : ((wire191 ?
                  $signed((|wire220)) : ((wire78 >> wire77) ?
                      wire79[(1'h1):(1'h0)] : reg234[(1'h1):(1'h1)])) ?
              $unsigned(($unsigned(wire77) >>> (wire220 >> reg225))) : reg227)))
        begin
          if ((({(|$unsigned(reg237)),
                      ($unsigned(wire119) ?
                          (reg226 ? reg224 : wire191) : $signed(wire220))} ?
                  $unsigned(((~reg224) - wire220)) : wire119[(3'h4):(3'h4)]) ?
              (wire118 ?
                  ($unsigned(wire82) ?
                      wire78 : (reg223[(4'he):(1'h1)] > (8'hb7))) : $signed((wire82[(3'h7):(3'h7)] ?
                      {wire121,
                          wire122} : wire77))) : (wire220[(4'ha):(3'h6)] ~^ reg236)))
            begin
              reg238 <= (reg223 <= (8'ha3));
            end
          else
            begin
              reg238 <= reg229;
            end
          if ($unsigned({$unsigned(reg234[(2'h2):(1'h1)])}))
            begin
              reg239 <= $signed(($unsigned($unsigned((^~reg221))) ?
                  (8'hb2) : $signed({(wire83 ? (8'hbe) : wire219)})));
              reg240 <= (|$signed(reg235[(3'h6):(3'h4)]));
              reg241 <= ($unsigned({{wire219, ((8'hbb) ? reg232 : reg235)},
                  ((reg233 ?
                      wire76 : (8'hac)) + wire120)}) >>> $unsigned(reg237));
            end
          else
            begin
              reg239 <= (|((~&reg240) != $unsigned((wire121 | (-reg228)))));
            end
          reg242 <= reg234;
          reg243 <= (((($signed(wire220) ?
                          (reg235 ? reg234 : reg233) : (&wire191)) ?
                      $unsigned((reg225 ?
                          wire77 : reg238)) : ((reg231 ^ wire76) ^~ (reg230 ?
                          wire83 : reg234))) ?
                  $unsigned(wire116) : wire80) ?
              ((~^(|(reg240 == wire150))) ?
                  $unsigned(wire80) : (~|((~|(8'ha2)) ?
                      (wire78 || wire121) : ((7'h42) * reg233)))) : $unsigned($signed({(wire217 != wire79)})));
          reg244 <= ($signed((|(!{reg233, wire80}))) ?
              ($unsigned(reg242) ?
                  {((|wire191) + {(8'hb9), wire217}),
                      wire116} : ({$signed(reg239),
                      $unsigned(reg226)} << $unsigned($unsigned(reg224)))) : $unsigned(wire118));
        end
      else
        begin
          reg238 <= wire150[(3'h4):(1'h1)];
          reg239 <= reg226[(3'h6):(1'h1)];
        end
    end
  assign wire245 = ((8'ha7) ~^ {(reg241 ?
                           $unsigned((reg223 > wire217)) : ($unsigned(reg224) ?
                               (8'hab) : (^~reg241)))});
  assign wire246 = wire191[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg247 <= ({$unsigned({(reg224 ? reg232 : wire76), {reg240, wire219}}),
          wire217[(2'h3):(2'h2)]} | {$unsigned(reg229), (^{(+(8'haa))})});
    end
  always
    @(posedge clk) begin
      reg248 <= $unsigned($unsigned($unsigned(wire79[(3'h4):(2'h3)])));
      reg249 <= $signed(reg230[(4'h9):(1'h1)]);
      reg250 <= (^$signed((((+(8'ha9)) < ((8'hb3) ~^ reg234)) ~^ reg232[(4'hd):(4'hc)])));
      reg251 <= (-$unsigned($signed({$unsigned(reg226), $signed((8'ha1))})));
      reg252 <= $unsigned($signed(reg237[(4'h8):(4'h8)]));
    end
endmodule

module module19  (y, clk, wire20, wire21, wire22, wire23);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire20;
  input wire signed [(5'h13):(1'h0)] wire21;
  input wire [(5'h11):(1'h0)] wire22;
  input wire [(4'hb):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire66;
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire24,
                 wire50,
                 wire66,
                 reg68,
                 (1'h0)};
  assign wire24 = wire20;
  module25 #() modinst51 (wire50, clk, wire20, wire21, wire22, wire24);
  module52 #() modinst67 (.wire56(wire50), .wire54(wire23), .clk(clk), .wire53(wire21), .y(wire66), .wire55(wire22), .wire57(wire20));
  always
    @(posedge clk) begin
      reg68 <= wire24[(2'h3):(1'h0)];
    end
  assign wire69 = {(wire23[(4'ha):(3'h4)] ^~ ($unsigned((-wire20)) ?
                          wire21 : (8'ha5)))};
  assign wire70 = $unsigned($unsigned(($unsigned(wire66[(4'h9):(4'h9)]) ?
                      $unsigned(((8'hae) << wire20)) : wire24)));
  assign wire71 = wire22;
  assign wire72 = (~^((wire66[(2'h3):(1'h1)] || $unsigned(wire70[(2'h2):(1'h0)])) ?
                      (8'ha2) : wire24));
endmodule

module module52  (y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire57;
  input wire signed [(4'ha):(1'h0)] wire56;
  input wire [(5'h11):(1'h0)] wire55;
  input wire signed [(4'hb):(1'h0)] wire54;
  input wire [(5'h11):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire58;
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 reg59,
                 (1'h0)};
  assign wire58 = {wire53[(3'h6):(3'h4)]};
  always
    @(posedge clk) begin
      reg59 <= (((wire54[(3'h5):(2'h2)] ?
              wire56 : $signed(wire55)) << {wire53}) ?
          {wire53} : wire56[(3'h7):(2'h3)]);
    end
  assign wire60 = wire56[(2'h3):(1'h0)];
  assign wire61 = wire56;
  assign wire62 = ((wire53[(4'h8):(3'h7)] ?
                      $signed(wire53[(4'h8):(3'h5)]) : $unsigned({(^wire53),
                          (~|wire58)})) > ($signed((~^$signed(wire57))) >= $signed(wire60[(2'h3):(2'h2)])));
  assign wire63 = (^~((wire60 <= {(wire54 ? wire54 : wire55),
                      (wire54 ? wire57 : (8'hbf))}) + (((^wire56) ?
                          $signed(wire61) : $signed(wire61)) ?
                      (wire60 ?
                          $signed(wire58) : $unsigned(wire62)) : $unsigned((wire58 ?
                          wire56 : wire55)))));
  assign wire64 = (wire62[(1'h1):(1'h0)] << {($unsigned($signed(wire53)) * (-$signed(wire58))),
                      $signed(((wire56 >> (8'hb2)) ?
                          ((8'hab) - wire63) : $unsigned(wire62)))});
  assign wire65 = (wire56 ?
                      wire60[(2'h3):(1'h1)] : $unsigned((wire56 ?
                          $signed($signed(wire63)) : wire56[(3'h5):(2'h2)])));
endmodule

module module25
#(parameter param48 = ((~^(8'ha7)) ? (&{(^{(8'hbc), (8'hac)}), ({(7'h44), (8'hb9)} ? (|(8'hba)) : ((8'haa) ? (8'ha7) : (8'hbd)))}) : ((^((+(8'hb0)) >>> (8'hb5))) ? {{{(8'hb3), (8'ha7)}}} : (-(((8'hab) ? (8'ha8) : (8'hab)) ? (~^(8'ha8)) : ((8'hb9) > (8'h9e)))))), 
parameter param49 = param48)
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire29;
  input wire signed [(5'h13):(1'h0)] wire28;
  input wire signed [(2'h2):(1'h0)] wire27;
  input wire signed [(5'h15):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire30;
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg47,
                 reg46,
                 reg45,
                 reg37,
                 (1'h0)};
  assign wire30 = ($signed(wire29[(2'h2):(1'h0)]) == $signed((({wire27} ?
                      (~&wire28) : wire29) << wire28[(5'h13):(5'h11)])));
  assign wire31 = (^(wire26[(4'hf):(3'h4)] > (wire26[(4'ha):(1'h1)] == $unsigned((8'hb6)))));
  assign wire32 = (^~(wire26 ?
                      $unsigned(($unsigned(wire30) ^~ wire27)) : (wire28 ?
                          $unsigned(((8'hab) == (8'haa))) : ({wire31,
                              (8'ha4)} ^~ $signed(wire31)))));
  assign wire33 = {{wire28}};
  assign wire34 = wire31[(2'h3):(1'h0)];
  assign wire35 = (8'ha8);
  assign wire36 = wire29;
  always
    @(posedge clk) begin
      reg37 <= {({(~^$signed(wire33))} ?
              wire32[(5'h10):(4'hb)] : {({wire33, wire26} ?
                      $unsigned(wire35) : wire29),
                  (~&$signed(wire29))})};
    end
  assign wire38 = (~$signed(({{wire34}} ?
                      ($signed((8'ha0)) > (~|wire31)) : ($signed(wire33) == (wire31 >= wire27)))));
  assign wire39 = $unsigned(wire27[(2'h2):(1'h0)]);
  assign wire40 = (8'ha1);
  assign wire41 = wire35;
  assign wire42 = wire40[(1'h1):(1'h0)];
  assign wire43 = (~wire33);
  assign wire44 = $signed((wire40 <<< wire39));
  always
    @(posedge clk) begin
      reg45 <= wire35;
      reg46 <= wire34;
      reg47 <= $unsigned((&wire42[(4'hc):(3'h6)]));
    end
endmodule

module module193  (y, clk, wire197, wire196, wire195, wire194);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire197;
  input wire [(4'hc):(1'h0)] wire196;
  input wire [(3'h5):(1'h0)] wire195;
  input wire [(3'h6):(1'h0)] wire194;
  wire signed [(3'h7):(1'h0)] wire216;
  wire [(5'h11):(1'h0)] wire215;
  wire signed [(4'h8):(1'h0)] wire214;
  wire [(4'hd):(1'h0)] wire213;
  wire [(4'h9):(1'h0)] wire212;
  wire signed [(4'ha):(1'h0)] wire211;
  wire [(5'h11):(1'h0)] wire210;
  wire [(4'h9):(1'h0)] wire209;
  wire [(5'h15):(1'h0)] wire208;
  wire signed [(5'h14):(1'h0)] wire207;
  wire [(4'h9):(1'h0)] wire201;
  wire [(5'h10):(1'h0)] wire200;
  wire signed [(3'h6):(1'h0)] wire199;
  wire signed [(3'h6):(1'h0)] wire198;
  reg [(5'h15):(1'h0)] reg206 = (1'h0);
  reg [(5'h13):(1'h0)] reg205 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg204 = (1'h0);
  reg [(2'h3):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg202 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 (1'h0)};
  assign wire198 = $unsigned(({wire196[(3'h5):(1'h0)]} < $signed({$signed(wire194)})));
  assign wire199 = (!wire197[(4'h9):(3'h5)]);
  assign wire200 = $unsigned($unsigned($signed(($signed((7'h42)) ^~ $signed(wire196)))));
  assign wire201 = {$unsigned($signed(wire197[(4'h8):(2'h2)])),
                       (!wire196[(2'h2):(1'h0)])};
  always
    @(posedge clk) begin
      reg202 <= (wire194 ?
          ($unsigned(((wire200 ? wire201 : wire200) ?
              (wire197 >>> (7'h40)) : (-wire200))) > (~&$unsigned($unsigned(wire200)))) : wire201);
      reg203 <= (~&($unsigned(wire198) << ((^wire201[(2'h2):(2'h2)]) ?
          (-wire194[(3'h5):(2'h2)]) : reg202[(4'he):(3'h5)])));
      reg204 <= reg202;
      reg205 <= ($signed({wire196}) ~^ wire201);
      reg206 <= (~^((^$unsigned((reg203 ?
          wire195 : reg202))) ^~ {{wire197[(4'hc):(3'h5)], {reg205}},
          ((~&reg205) < wire201)}));
    end
  assign wire207 = (8'hae);
  assign wire208 = $signed($signed(((reg203 ?
                       wire199 : reg203) < $signed({wire207}))));
  assign wire209 = $signed((-$unsigned(wire196[(1'h1):(1'h1)])));
  assign wire210 = wire207[(3'h5):(2'h3)];
  assign wire211 = (7'h40);
  assign wire212 = ($signed($signed({{wire197, wire195},
                           wire198[(3'h6):(3'h4)]})) ?
                       (~|{(-(8'hb6)),
                           ((reg206 >> wire194) && {wire198,
                               wire194})}) : ($signed(wire207[(4'hc):(1'h0)]) ?
                           reg204 : wire201));
  assign wire213 = (reg205 ? $unsigned($signed(wire211)) : wire200);
  assign wire214 = ((^~(~^wire196)) ?
                       reg204 : ($signed(wire213) ?
                           (({(8'h9f), wire196} ?
                               $signed(wire199) : {wire211}) << wire210) : (((wire212 >= wire201) ?
                               (reg202 ?
                                   wire213 : wire198) : reg202[(3'h5):(2'h2)]) & ((~|wire208) & $signed(wire201)))));
  assign wire215 = {((($signed(wire201) ?
                               $unsigned(wire198) : (wire210 ^ wire210)) + ((wire211 ?
                                   (8'ha4) : wire214) ?
                               ((7'h42) == wire194) : (^~wire208))) ?
                           wire199[(1'h1):(1'h1)] : (^$unsigned((wire207 > reg203))))};
  assign wire216 = reg206;
endmodule

module module152
#(parameter param189 = (&{{(^~{(8'h9f), (8'hb6)})}}), 
parameter param190 = ((~|{(|param189), ((param189 ? param189 : param189) ? (param189 ? (8'hb6) : (8'ha6)) : param189)}) ? ((^~param189) ? (param189 && {(param189 ^ param189), {param189, param189}}) : ((^~(&param189)) < (7'h42))) : (!(-(^(param189 ? param189 : param189))))))
(y, clk, wire156, wire155, wire154, wire153);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire156;
  input wire [(2'h2):(1'h0)] wire155;
  input wire [(3'h4):(1'h0)] wire154;
  input wire [(5'h15):(1'h0)] wire153;
  wire [(4'h8):(1'h0)] wire188;
  wire [(5'h12):(1'h0)] wire187;
  wire [(5'h11):(1'h0)] wire186;
  wire signed [(2'h2):(1'h0)] wire185;
  wire [(3'h4):(1'h0)] wire184;
  wire [(3'h5):(1'h0)] wire183;
  wire signed [(4'hc):(1'h0)] wire170;
  wire signed [(5'h11):(1'h0)] wire169;
  wire [(4'hc):(1'h0)] wire168;
  wire signed [(4'h9):(1'h0)] wire167;
  wire signed [(3'h6):(1'h0)] wire166;
  wire signed [(4'h9):(1'h0)] wire165;
  wire [(3'h6):(1'h0)] wire164;
  wire signed [(4'he):(1'h0)] wire163;
  wire [(2'h3):(1'h0)] wire162;
  wire [(4'hb):(1'h0)] wire161;
  wire signed [(4'hc):(1'h0)] wire160;
  wire [(5'h11):(1'h0)] wire159;
  wire [(4'hc):(1'h0)] wire158;
  wire [(2'h2):(1'h0)] wire157;
  reg [(2'h2):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg181 = (1'h0);
  reg [(3'h6):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg179 = (1'h0);
  reg [(5'h10):(1'h0)] reg178 = (1'h0);
  reg [(4'hb):(1'h0)] reg177 = (1'h0);
  reg [(4'he):(1'h0)] reg176 = (1'h0);
  reg [(2'h2):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg171 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 (1'h0)};
  assign wire157 = wire153;
  assign wire158 = wire154[(1'h0):(1'h0)];
  assign wire159 = ((~&($unsigned((wire157 + wire153)) * wire153)) ?
                       wire158 : ((((wire153 ~^ wire155) <<< (wire156 <<< wire154)) ?
                           wire153[(4'h8):(2'h2)] : $unsigned({wire157})) >>> (~(~wire154))));
  assign wire160 = $signed($unsigned($unsigned(($signed(wire153) * $signed(wire154)))));
  assign wire161 = $signed($signed({(+(+wire154)), {wire158[(4'ha):(3'h7)]}}));
  assign wire162 = wire157[(1'h1):(1'h1)];
  assign wire163 = $unsigned((+($signed($unsigned(wire161)) <= $signed(wire153[(4'hf):(2'h2)]))));
  assign wire164 = $unsigned(($signed(({wire161, wire161} ?
                       {wire160, (8'hbc)} : wire153)) | (+($unsigned(wire161) ?
                       $unsigned(wire154) : $unsigned(wire162)))));
  assign wire165 = (~$signed(wire156));
  assign wire166 = $signed($signed((!{wire159, $unsigned((8'ha3))})));
  assign wire167 = $unsigned($unsigned(wire162[(1'h1):(1'h1)]));
  assign wire168 = wire157[(1'h0):(1'h0)];
  assign wire169 = ({$signed(wire165)} * $unsigned({$signed((-wire164)),
                       wire155[(1'h1):(1'h0)]}));
  assign wire170 = (wire155 ?
                       $signed((wire165[(2'h3):(1'h1)] ?
                           ((^~wire166) > (wire155 & (8'hac))) : wire154)) : (($signed({wire158,
                               (7'h40)}) ?
                           ($unsigned(wire156) ?
                               wire163[(4'he):(4'ha)] : wire167) : wire157) ~^ {wire154,
                           $unsigned((wire154 && (8'hb3)))}));
  always
    @(posedge clk) begin
      reg171 <= $signed((8'hb9));
    end
  always
    @(posedge clk) begin
      reg172 <= wire154[(2'h2):(1'h0)];
      if (wire161)
        begin
          reg173 <= (wire158[(2'h2):(1'h1)] ?
              $unsigned($unsigned(wire159[(2'h3):(1'h1)])) : (8'hb5));
          reg174 <= $signed(((!wire166) ^~ (reg171[(4'he):(4'he)] >>> reg172)));
          reg175 <= {reg172[(4'ha):(3'h4)]};
          reg176 <= (~&(&(wire167[(3'h6):(1'h1)] ?
              wire166 : wire169[(4'hd):(3'h5)])));
          reg177 <= ({$signed(reg173[(2'h3):(1'h0)])} ?
              wire155 : {wire167, wire157});
        end
      else
        begin
          if ((~|$unsigned({($unsigned(reg171) ?
                  (reg175 <= wire170) : (~^reg174))})))
            begin
              reg173 <= $signed((wire160 << (~&{(~|wire161)})));
              reg174 <= $unsigned($unsigned((|$signed({wire156}))));
              reg175 <= wire160;
              reg176 <= $unsigned((((~$unsigned(wire164)) ~^ reg176) || $unsigned({(^~(7'h43))})));
            end
          else
            begin
              reg173 <= (8'h9d);
              reg174 <= ((~&reg172) >= reg177);
              reg175 <= $signed(($unsigned(wire164[(3'h6):(3'h5)]) == wire160[(2'h3):(2'h2)]));
            end
          reg177 <= wire160[(3'h4):(2'h3)];
        end
      reg178 <= wire161[(2'h3):(1'h1)];
      if (((reg172[(3'h4):(1'h1)] && (8'ha4)) >>> $unsigned($unsigned({$unsigned(reg176),
          (wire161 > wire165)}))))
        begin
          reg179 <= $unsigned(((({(8'ha7), reg178} >>> $signed(wire165)) ?
              reg176 : $signed($signed(wire164))) >> $signed(($unsigned(wire163) ?
              reg171[(4'ha):(3'h5)] : (reg173 ? wire166 : reg178)))));
          reg180 <= wire156;
          reg181 <= (~|reg175);
          reg182 <= $signed($unsigned((wire158 ?
              {(wire156 == (8'hb5))} : wire155)));
        end
      else
        begin
          reg179 <= $unsigned((reg179 < $signed((wire159[(4'h9):(1'h1)] ^~ (wire156 && reg171)))));
          reg180 <= $unsigned(wire154[(1'h0):(1'h0)]);
        end
    end
  assign wire183 = (+((((reg172 >> wire164) > ((8'ha9) ? (7'h42) : (7'h43))) ?
                           (wire159[(5'h11):(5'h10)] ?
                               $signed(reg180) : (wire165 ?
                                   wire154 : reg175)) : reg181) ?
                       $unsigned((8'ha8)) : wire157[(1'h0):(1'h0)]));
  assign wire184 = $signed($signed((~^reg182[(1'h0):(1'h0)])));
  assign wire185 = ((-$signed(wire158)) ?
                       {reg177[(3'h4):(2'h3)],
                           reg174[(2'h3):(2'h2)]} : wire168[(3'h5):(3'h4)]);
  assign wire186 = ($unsigned(($signed((reg181 == wire169)) ?
                       $signed({(8'hb4), reg180}) : wire157)) <<< ((({reg175} ?
                           reg178 : $signed(wire154)) ?
                       {(reg182 || wire184)} : {wire159[(3'h7):(2'h2)]}) & wire161[(2'h3):(1'h1)]));
  assign wire187 = $signed($signed((((wire158 ~^ reg180) ?
                           (~&(8'hae)) : (wire155 ? wire186 : (8'hbf))) ?
                       $signed($unsigned(wire161)) : wire163)));
  assign wire188 = (^~{{(|(reg181 ? wire161 : reg171)), reg182[(1'h1):(1'h0)]},
                       (~reg179)});
endmodule

module module123
#(parameter param149 = {(((((7'h44) >= (8'hb7)) ? ((7'h43) >= (8'ha2)) : (!(8'hbc))) ? (~|(~&(7'h42))) : (((8'hb0) ? (8'hbc) : (8'hb7)) >>> (!(8'ha0)))) * (((&(8'hb3)) >= ((8'hb1) ? (8'hb4) : (8'ha6))) >> {((8'h9f) << (8'hbf)), ((7'h40) >>> (8'hb9))}))})
(y, clk, wire127, wire126, wire125, wire124);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire127;
  input wire signed [(4'hf):(1'h0)] wire126;
  input wire [(4'h8):(1'h0)] wire125;
  input wire [(5'h14):(1'h0)] wire124;
  wire [(4'ha):(1'h0)] wire134;
  wire [(3'h4):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire132;
  wire [(4'h8):(1'h0)] wire131;
  wire [(5'h10):(1'h0)] wire130;
  wire [(3'h4):(1'h0)] wire129;
  wire signed [(4'hb):(1'h0)] wire128;
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(4'h8):(1'h0)] reg147 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg146 = (1'h0);
  reg [(4'hc):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  reg [(5'h14):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(2'h3):(1'h0)] reg137 = (1'h0);
  reg [(2'h2):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire128 = $signed($signed($unsigned((~&wire126))));
  assign wire129 = wire128;
  assign wire130 = wire124[(5'h13):(5'h13)];
  assign wire131 = wire126[(4'hf):(2'h3)];
  assign wire132 = (~^(($unsigned((&(7'h41))) ?
                       ($signed(wire130) - {wire130,
                           wire131}) : $unsigned((wire125 == wire124))) + ($unsigned((+wire126)) ?
                       (wire127 ?
                           $unsigned(wire124) : {wire126}) : (wire124[(4'h9):(3'h5)] == $signed(wire129)))));
  assign wire133 = $unsigned(wire129);
  assign wire134 = wire126;
  always
    @(posedge clk) begin
      if (($signed(wire133[(1'h1):(1'h0)]) ?
          (^(^~$unsigned(wire133))) : (-(((wire130 > wire132) ^~ $unsigned(wire128)) | wire133))))
        begin
          if ($unsigned(wire127))
            begin
              reg135 <= wire124[(4'he):(4'h9)];
              reg136 <= ((&$signed({$signed(wire134),
                  wire124})) ^ (!wire132[(3'h6):(3'h6)]));
              reg137 <= {(~|(wire130 > ($signed(wire132) ?
                      (wire130 ? (8'had) : wire126) : $unsigned(wire134)))),
                  (((8'hb2) <= $unsigned((wire133 && wire124))) || (wire129[(1'h1):(1'h0)] != {(wire127 ?
                          wire125 : wire125),
                      ((8'hb6) && wire129)}))};
              reg138 <= (|wire134);
            end
          else
            begin
              reg135 <= wire130;
              reg136 <= wire124;
            end
          reg139 <= wire126[(2'h2):(2'h2)];
        end
      else
        begin
          reg135 <= (wire124 >= (&wire126[(4'hd):(4'hd)]));
          if ((|({{reg138[(1'h1):(1'h1)]},
              wire128[(4'h9):(2'h2)]} >= wire129[(1'h0):(1'h0)])))
            begin
              reg136 <= $unsigned(((wire129[(1'h0):(1'h0)] ?
                      (wire131 ^~ (wire124 ?
                          wire130 : reg137)) : wire130[(4'h9):(4'h9)]) ?
                  wire126[(4'hd):(1'h0)] : $signed((wire127 ?
                      (^wire124) : (|wire126)))));
              reg137 <= reg138;
            end
          else
            begin
              reg136 <= $signed(((~&(wire129 ?
                      (wire127 ? wire127 : (8'hba)) : {wire128, wire126})) ?
                  $signed(((wire131 || reg137) ?
                      (wire133 ?
                          wire133 : wire131) : wire125[(4'h8):(3'h6)])) : $unsigned($signed((8'hb5)))));
              reg137 <= (~^wire133[(2'h2):(1'h0)]);
              reg138 <= (~($unsigned((|{(8'h9c), wire129})) ?
                  (((|(8'ha7)) - (!wire134)) ?
                      $unsigned(reg138) : wire130[(3'h7):(3'h6)]) : $signed(reg137[(1'h0):(1'h0)])));
              reg139 <= (8'hb3);
            end
          if ($signed((wire133[(2'h3):(2'h2)] ?
              (reg136 << $unsigned($signed(wire129))) : {(+(wire128 == wire128))})))
            begin
              reg140 <= reg136[(1'h1):(1'h0)];
              reg141 <= reg136[(1'h0):(1'h0)];
              reg142 <= $signed(($unsigned({$signed(wire127)}) > wire133[(2'h2):(1'h0)]));
            end
          else
            begin
              reg140 <= ($signed(wire132[(2'h2):(1'h1)]) | {(8'haa)});
            end
          if ($unsigned(((7'h44) ?
              reg136[(1'h1):(1'h1)] : wire127[(1'h1):(1'h0)])))
            begin
              reg143 <= {((~^((wire132 ? wire126 : wire129) ?
                      (8'ha1) : wire125)) <<< $unsigned((8'h9d))),
                  $unsigned((~wire134))};
              reg144 <= $signed(wire128);
              reg145 <= {((($signed(reg143) ?
                          {(8'hab), reg140} : $signed(wire125)) != (^{wire126,
                          (8'hb1)})) ?
                      (|({wire125} ?
                          wire126 : wire129)) : (-wire129[(1'h1):(1'h1)])),
                  (~&$unsigned((reg144[(2'h3):(2'h3)] ?
                      wire131 : $unsigned(wire125))))};
              reg146 <= $signed($signed(($signed($signed(wire131)) ?
                  $signed((-reg144)) : ($signed(reg135) ?
                      (reg137 & (8'ha6)) : ((8'ha7) != wire129)))));
            end
          else
            begin
              reg143 <= (&$unsigned((reg143 ?
                  $signed(wire133) : $unsigned($signed((8'haf))))));
              reg144 <= ($unsigned(wire131) ?
                  ((reg146[(4'h8):(2'h3)] >>> reg143[(4'he):(4'hb)]) <= $signed(((wire130 ?
                          (7'h44) : wire129) ?
                      wire132[(4'hb):(4'hb)] : (8'ha1)))) : wire130[(2'h3):(2'h2)]);
              reg145 <= $signed(wire131[(1'h1):(1'h1)]);
              reg146 <= (^~$unsigned((~^(^$unsigned((7'h43))))));
              reg147 <= (reg140[(2'h2):(1'h0)] ?
                  reg139[(2'h2):(1'h1)] : (&reg138));
            end
        end
      reg148 <= (wire124 ?
          {$unsigned({(8'hb7)})} : (^$unsigned(wire133[(2'h2):(1'h1)])));
    end
endmodule

module module86
#(parameter param115 = ((+({((8'hb5) >= (8'ha9)), ((8'hb5) ? (8'ha3) : (8'hab))} ~^ ((^(8'hb7)) >>> ((8'hb7) ? (8'hac) : (8'hb8))))) ? (~|({{(8'hbf)}} << (((7'h41) ? (8'hb6) : (8'hb8)) + {(8'hbf), (7'h44)}))) : (^(((^(8'ha4)) ? ((8'haf) ? (8'hba) : (8'hab)) : ((8'hbe) & (8'ha0))) >>> {(~|(8'hb3)), {(8'had)}}))))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire90;
  input wire signed [(2'h3):(1'h0)] wire89;
  input wire [(4'hb):(1'h0)] wire88;
  input wire signed [(5'h15):(1'h0)] wire87;
  wire signed [(3'h4):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire113;
  wire [(4'ha):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire111;
  wire [(4'hb):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire101;
  wire signed [(3'h4):(1'h0)] wire100;
  wire signed [(4'hd):(1'h0)] wire99;
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg91 <= ((({{wire89, wire87}} ?
          wire88 : (((8'hb6) ? wire88 : (8'hb5)) ?
              (-(8'hac)) : wire87[(3'h5):(1'h0)])) >> {wire88[(4'ha):(4'h8)]}) < wire87[(5'h12):(2'h3)]);
      if ((~&(wire88[(2'h3):(1'h1)] ?
          wire90[(3'h4):(2'h3)] : $signed($unsigned({wire87, (8'ha6)})))))
        begin
          reg92 <= ((^wire90) ?
              (|wire89[(2'h2):(2'h2)]) : wire88[(3'h5):(2'h2)]);
        end
      else
        begin
          reg92 <= $signed({wire87[(4'ha):(4'ha)]});
        end
      reg93 <= {reg91};
      reg94 <= reg92[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      if ($unsigned(wire90[(2'h2):(2'h2)]))
        begin
          if (reg93)
            begin
              reg95 <= (~$signed((($unsigned(reg92) > ((8'hba) != reg92)) ?
                  $signed($unsigned(reg92)) : ((wire87 ?
                      (7'h40) : reg94) & $unsigned(reg93)))));
              reg96 <= (((($signed(reg93) - $signed(reg93)) ?
                      reg93[(2'h2):(1'h1)] : ($signed(reg95) && ((8'ha9) ?
                          wire90 : (8'hab)))) ^ (wire90[(3'h4):(1'h0)] < ((8'hb3) >= reg95))) ?
                  {$signed(wire87)} : ((~|$unsigned({reg94,
                      wire87})) >>> $signed((~^$signed(wire88)))));
              reg97 <= ((&($signed(wire89[(1'h0):(1'h0)]) ?
                  ((~&wire87) - $unsigned(wire88)) : reg95[(4'h8):(2'h3)])) ^~ wire89);
              reg98 <= (8'hbc);
            end
          else
            begin
              reg95 <= (({((wire87 * wire87) ? {wire89} : $signed(reg93)),
                      ((wire87 ^~ reg96) < ((8'haf) ~^ wire90))} ?
                  ($signed((!reg94)) ?
                      $unsigned((-reg94)) : $signed(reg91[(4'hf):(4'ha)])) : (^~$unsigned(reg92[(2'h2):(2'h2)]))) && $signed(reg96));
            end
        end
      else
        begin
          reg95 <= $unsigned((~|(~($unsigned(wire88) >>> $signed(reg95)))));
        end
    end
  assign wire99 = $unsigned((^(!((wire90 ~^ reg93) - wire89))));
  assign wire100 = {(wire99 ? (&wire90[(3'h7):(3'h7)]) : reg91),
                       (|$unsigned(wire99))};
  assign wire101 = reg92;
  assign wire102 = reg97;
  assign wire103 = ($signed(((wire87[(5'h12):(3'h6)] <<< (wire87 ~^ (7'h41))) > reg92)) && reg94);
  always
    @(posedge clk) begin
      reg104 <= $unsigned(($unsigned($unsigned($signed(wire89))) ?
          ($signed((~&(8'ha6))) < (~^(wire101 & reg98))) : (~^(|(8'hbf)))));
      reg105 <= $unsigned(((^(~$unsigned(wire99))) >= wire90[(3'h5):(1'h0)]));
      reg106 <= (^~{$signed(reg92[(1'h0):(1'h0)]), (~|(+(reg91 + wire88)))});
      if (reg98[(4'he):(4'hb)])
        begin
          reg107 <= ((~wire102) && (reg93 ?
              wire99 : (reg94 - $unsigned(((8'ha2) >> reg98)))));
          reg108 <= reg93[(2'h3):(2'h3)];
        end
      else
        begin
          if (reg96[(1'h1):(1'h0)])
            begin
              reg107 <= reg91;
            end
          else
            begin
              reg107 <= reg107;
              reg108 <= $unsigned({(&((reg105 << reg108) ?
                      reg94[(4'h9):(3'h7)] : reg107[(4'hd):(3'h5)])),
                  $unsigned($signed((reg93 || wire99)))});
            end
          reg109 <= {reg98, reg94[(3'h7):(1'h0)]};
          reg110 <= (^~reg108[(4'ha):(1'h1)]);
        end
    end
  assign wire111 = wire89[(1'h0):(1'h0)];
  assign wire112 = $signed((^({reg106[(4'he):(4'hc)]} ?
                       $unsigned($signed(wire111)) : $unsigned((|wire100)))));
  assign wire113 = $unsigned(reg96);
  assign wire114 = $unsigned($unsigned(({$unsigned(reg94)} ?
                       (+reg96) : ((reg95 ?
                           reg108 : reg108) ^~ $signed(reg109)))));
endmodule
