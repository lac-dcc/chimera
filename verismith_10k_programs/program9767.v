module top
#(parameter param78 = (~|(-(8'ha6))), 
parameter param79 = {(~|(^~(+(param78 ? (8'had) : param78)))), {((&{param78, param78}) ? (~&{param78, (8'hbc)}) : ((~&param78) >> (!param78)))}})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire62;
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire77,
                 wire75,
                 wire74,
                 wire73,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire4,
                 wire62,
                 reg76,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned(wire0);
  always
    @(posedge clk) begin
      reg5 <= (($signed(({(8'hb4)} ? wire4[(2'h2):(1'h0)] : $unsigned(wire0))) ?
              wire3[(3'h4):(2'h2)] : (~wire2[(4'h8):(3'h7)])) ?
          (((|wire3) >>> ({wire1, wire4} ?
              ((8'hbe) ?
                  (8'had) : wire0) : wire3)) ^ $unsigned(wire0[(4'h9):(2'h2)])) : {wire3[(2'h2):(1'h0)],
              $unsigned($unsigned($signed(wire0)))});
      reg6 <= ($unsigned(wire0[(1'h0):(1'h0)]) > (wire1 ?
          (wire3[(1'h1):(1'h1)] > ((reg5 <= (8'hbf)) ~^ $signed(wire0))) : ($unsigned($unsigned(wire2)) ?
              $signed(wire2[(2'h2):(1'h0)]) : $signed(wire3[(2'h2):(2'h2)]))));
    end
  module7 #() modinst63 (wire62, clk, wire1, reg6, wire4, wire3, reg5);
  assign wire64 = $unsigned((&(wire2 ?
                      $unsigned($unsigned((8'hbc))) : ((~(8'hbc)) ?
                          $unsigned(wire4) : wire62))));
  assign wire65 = (wire0 ?
                      {{((&reg6) ?
                                  ((8'hb4) ^ (8'hba)) : $signed(wire3))}} : $unsigned({((wire3 << wire3) ?
                              {wire2} : reg5)}));
  assign wire66 = wire62[(5'h10):(4'hb)];
  assign wire67 = wire65[(3'h7):(2'h3)];
  assign wire68 = (((wire65[(3'h5):(2'h2)] ^~ $signed(((8'hb2) == wire66))) < wire64[(4'ha):(1'h0)]) ?
                      wire0 : $signed({wire66}));
  always
    @(posedge clk) begin
      reg69 <= (7'h41);
      reg70 <= wire0;
      reg71 <= wire64[(5'h11):(4'hd)];
      reg72 <= reg71[(4'hc):(3'h5)];
    end
  assign wire73 = (|(reg5[(3'h5):(3'h5)] ?
                      reg6[(1'h1):(1'h0)] : {(&$signed((7'h44))),
                          ((-reg5) != $signed(reg71))}));
  assign wire74 = ((-(8'h9f)) < $signed(((wire66 ?
                      $unsigned(wire4) : (reg6 >> (7'h42))) << (+wire73[(3'h7):(3'h6)]))));
  assign wire75 = {wire74[(2'h2):(1'h1)], {{(8'h9d), wire62}}};
  always
    @(posedge clk) begin
      reg76 <= (wire3[(3'h4):(2'h3)] ^~ ((wire3[(3'h7):(3'h4)] ?
          $signed($signed(reg72)) : (wire3 < reg72[(1'h1):(1'h1)])) != wire66));
    end
  assign wire77 = $signed(reg69);
endmodule

module module7
#(parameter param61 = (((^~((~&(8'hb4)) >= {(8'hba), (8'hac)})) > (({(8'hbb), (8'hba)} - (!(8'h9f))) <<< (((8'hbc) ? (8'ha5) : (8'hb9)) == ((8'hbb) ^~ (8'hae))))) <<< (((((8'ha3) | (8'hb8)) ? ((8'haf) ? (8'hab) : (8'haa)) : (!(7'h44))) ? {(!(8'ha7)), (^(8'ha5))} : ((-(8'hb4)) ^~ ((8'haa) <<< (7'h43)))) ? ((((8'hbc) - (8'haa)) << (8'hb3)) >>> (-((8'ha0) * (8'ha0)))) : ({{(8'ha8), (8'hae)}, (^~(8'hbd))} ? (!((8'hb6) < (8'ha9))) : ((!(8'hab)) ? ((8'hb9) < (8'ha9)) : {(7'h41), (8'hbc)})))))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire48;
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire50,
                 wire13,
                 wire14,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire48,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
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
                 (1'h0)};
  assign wire13 = wire10[(4'hd):(4'h8)];
  assign wire14 = $signed($signed($signed($unsigned({wire12}))));
  always
    @(posedge clk) begin
      if (((+(wire14[(1'h1):(1'h1)] == $signed((wire9 <<< wire11)))) ?
          (~&(~((wire8 ? wire8 : wire14) ?
              (wire8 ~^ wire12) : (wire11 ?
                  wire9 : wire9)))) : $unsigned($unsigned(((~wire12) ?
              (wire12 >> wire13) : ((8'hb5) ? (8'hac) : (8'hb8)))))))
        begin
          reg15 <= wire12;
          reg16 <= ((((wire13[(1'h1):(1'h1)] ^~ {wire10}) ?
                  $unsigned(reg15) : ((wire14 != wire8) > {wire9, wire12})) ?
              ($signed(((8'hbd) >= reg15)) - $unsigned(((8'ha4) ?
                  (8'hac) : wire8))) : $unsigned(wire10[(3'h4):(3'h4)])) == ((wire13 ?
              $signed(wire12) : wire8) > reg15[(4'h9):(3'h5)]));
        end
      else
        begin
          reg15 <= {(wire8[(1'h0):(1'h0)] ^ wire14), reg15[(4'h8):(1'h1)]};
          reg16 <= $signed($unsigned((-reg16)));
        end
      reg17 <= (!(~&wire10));
      if ({$unsigned(((wire12 ?
              $signed(reg15) : $unsigned(wire14)) << ((wire14 ?
              wire14 : wire9) || (~&wire8)))),
          (((wire13 ? $unsigned(wire8) : (~&wire10)) ?
              (+$unsigned((8'h9f))) : $signed(wire13[(1'h1):(1'h1)])) ^~ {($unsigned((8'hbd)) ?
                  $unsigned(wire10) : reg15)})})
        begin
          reg18 <= wire8;
          reg19 <= (reg18 && {(((8'hac) || wire8[(3'h5):(2'h3)]) ?
                  (~(reg18 ? wire11 : (8'hb3))) : $unsigned((wire11 ?
                      (7'h40) : reg15)))});
          reg20 <= (wire11 * (^$signed(((reg18 ? wire10 : reg15) ?
              $unsigned(wire10) : $signed(wire8)))));
          reg21 <= wire9;
          if (wire14[(2'h2):(2'h2)])
            begin
              reg22 <= $unsigned((($unsigned(wire8[(2'h2):(1'h1)]) ?
                  {(|(8'ha7))} : (~&(8'hb0))) - (wire8 ?
                  (&{(8'hbe), reg21}) : (8'hb1))));
              reg23 <= wire12;
              reg24 <= (8'ha3);
            end
          else
            begin
              reg22 <= ($unsigned($unsigned((-(reg17 ?
                  wire9 : wire10)))) < reg18);
            end
        end
      else
        begin
          reg18 <= $unsigned(reg16);
          reg19 <= $unsigned(wire9);
          reg20 <= ($signed(reg16) ?
              {($signed($signed(reg22)) ?
                      (wire12[(1'h1):(1'h0)] ~^ (reg24 < wire12)) : ({reg21} <<< $signed((8'hab))))} : wire10);
        end
      reg25 <= (reg17[(4'ha):(4'h9)] == $unsigned(($unsigned($signed(wire9)) ?
          (8'hbe) : $signed($signed(reg23)))));
    end
  assign wire26 = wire9;
  assign wire27 = reg20;
  assign wire28 = ((reg24 > ((~|$signed(wire26)) ?
                          $unsigned((wire11 < wire8)) : ((!(8'haf)) | (wire8 ?
                              reg24 : reg21)))) ?
                      ((~(-{reg24,
                          wire12})) < ($unsigned($unsigned(wire27)) & {(8'ha1)})) : wire12[(1'h0):(1'h0)]);
  assign wire29 = $signed((-($unsigned($unsigned(wire27)) ?
                      (wire13[(3'h7):(3'h5)] ^ (reg15 ?
                          reg24 : reg24)) : (reg16 ?
                          wire13 : (wire28 != wire28)))));
  assign wire30 = wire11;
  assign wire31 = (reg24 ? wire30[(2'h3):(1'h0)] : (8'hb3));
  module32 #() modinst49 (wire48, clk, wire11, wire10, wire27, reg17, reg18);
  assign wire50 = (((reg23 + $unsigned($signed(wire12))) ^ ((reg15 & (wire14 <<< wire11)) ?
                      ((wire12 ? reg15 : wire10) ?
                          $signed((8'had)) : reg25[(3'h5):(1'h0)]) : $signed((wire11 >>> wire28)))) >> (^(~^wire11)));
  always
    @(posedge clk) begin
      if ((reg23[(1'h0):(1'h0)] ?
          (wire28[(4'hd):(3'h4)] ?
              (~wire31[(5'h11):(3'h6)]) : wire12[(1'h1):(1'h0)]) : wire30))
        begin
          reg51 <= reg20[(4'hd):(4'hb)];
          reg52 <= (((8'h9c) ?
              ({((8'hba) >> (8'hb1)),
                  (reg19 - reg25)} > $unsigned(reg25)) : $signed(reg17[(5'h12):(3'h6)])) <= ({$unsigned(wire27[(3'h6):(3'h6)]),
                  reg24} ?
              reg22[(1'h0):(1'h0)] : (&(wire11 < wire50[(3'h7):(3'h6)]))));
          reg53 <= $unsigned(({$signed((reg16 ? reg24 : wire14)),
                  $signed($unsigned(reg20))} ?
              reg18[(2'h2):(1'h0)] : {$unsigned(reg20), reg19[(1'h0):(1'h0)]}));
          reg54 <= (((8'h9c) ?
                  (~^$signed((wire26 ?
                      reg20 : reg24))) : $unsigned(wire26[(4'h9):(1'h1)])) ?
              $signed({$unsigned(reg21)}) : $signed({{(~&wire8)}}));
        end
      else
        begin
          reg51 <= {({((8'hb9) ? wire31 : (!wire29))} ?
                  $unsigned((&(^~(8'h9f)))) : $unsigned(wire29[(3'h7):(2'h3)])),
              reg53};
          reg52 <= reg19;
          reg53 <= ((^(wire9 <= {wire48[(4'h9):(4'h9)], (wire13 == reg24)})) ?
              wire8[(2'h3):(1'h1)] : (^(($unsigned(reg19) * (reg15 ?
                      wire27 : reg21)) ?
                  $unsigned(((8'hb9) ^~ (8'ha8))) : ((reg52 ?
                      wire30 : wire11) << $signed(wire29)))));
        end
      reg55 <= {(!(~&(~wire12[(1'h0):(1'h0)]))), (8'ha1)};
      reg56 <= reg51[(1'h0):(1'h0)];
    end
  assign wire57 = $unsigned((wire50[(1'h0):(1'h0)] ^ reg51[(3'h4):(2'h2)]));
  assign wire58 = $signed((~&$signed(reg54)));
  assign wire59 = (&$unsigned((reg15 * reg19[(3'h6):(3'h5)])));
  assign wire60 = ($signed($unsigned($signed((reg53 ? (7'h43) : wire59)))) ?
                      $unsigned({wire27[(3'h6):(2'h2)],
                          $signed((!(8'ha1)))}) : ((($unsigned(wire48) <<< (~(8'hbe))) ?
                          $unsigned($unsigned(reg17)) : (wire59 || (reg55 ?
                              reg53 : (8'haf)))) <<< {(-$unsigned(reg24))}));
endmodule

module module32
#(parameter param47 = ((8'h9e) >= (&(((8'ha3) ? ((8'ha6) * (7'h41)) : ((8'ha4) ? (7'h42) : (7'h44))) ? (((7'h44) ? (8'haf) : (8'hae)) ? (7'h42) : (~&(7'h43))) : (((8'ha5) ? (8'ha9) : (7'h43)) >= ((8'haf) << (8'h9f)))))))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire37;
  input wire [(4'h8):(1'h0)] wire36;
  input wire [(4'hc):(1'h0)] wire35;
  input wire signed [(5'h13):(1'h0)] wire34;
  input wire signed [(2'h3):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(4'h8):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 (1'h0)};
  assign wire38 = $unsigned($signed($signed({wire36})));
  assign wire39 = $signed(({$signed($signed(wire37)),
                      (wire33[(2'h2):(1'h1)] ?
                          wire35 : wire37)} != $unsigned($unsigned(wire35[(3'h7):(3'h6)]))));
  assign wire40 = (((^(~^(^wire34))) == $signed((^(wire38 == wire35)))) & wire37);
  assign wire41 = $unsigned(wire40);
  assign wire42 = wire35;
  assign wire43 = ($signed(wire40) >= (wire38[(4'h8):(2'h3)] ~^ (^~{(wire36 * wire33),
                      wire40})));
  assign wire44 = wire35;
  assign wire45 = $signed(wire35);
  assign wire46 = $signed($signed(wire34[(4'he):(4'ha)]));
endmodule
