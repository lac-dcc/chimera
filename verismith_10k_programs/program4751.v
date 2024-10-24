module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire215;
  wire signed [(5'h15):(1'h0)] wire188;
  wire [(3'h5):(1'h0)] wire187;
  wire signed [(4'he):(1'h0)] wire185;
  wire [(5'h14):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg213 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg212 = (1'h0);
  reg [(3'h4):(1'h0)] reg211 = (1'h0);
  reg [(5'h13):(1'h0)] reg210 = (1'h0);
  reg [(2'h3):(1'h0)] reg209 = (1'h0);
  reg [(5'h12):(1'h0)] reg208 = (1'h0);
  reg [(4'hb):(1'h0)] reg207 = (1'h0);
  reg [(4'h8):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg205 = (1'h0);
  reg [(3'h6):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg203 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg202 = (1'h0);
  reg [(4'hb):(1'h0)] reg201 = (1'h0);
  reg signed [(4'he):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg199 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg198 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg196 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg195 = (1'h0);
  reg [(5'h10):(1'h0)] reg194 = (1'h0);
  reg [(4'h9):(1'h0)] reg193 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg190 = (1'h0);
  assign y = {wire215,
                 wire188,
                 wire187,
                 wire185,
                 wire97,
                 wire5,
                 wire4,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
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
  assign wire4 = $signed({wire2[(3'h4):(2'h3)],
                     $unsigned((wire0 ? {wire2, wire0} : (wire1 * wire2)))});
  assign wire5 = $signed($unsigned($unsigned((~&(8'hb2)))));
  module6 #() modinst98 (wire97, clk, wire2, wire4, wire1, wire5);
  module99 #() modinst186 (wire185, clk, wire5, wire4, wire2, wire3);
  assign wire187 = wire3;
  module6 #() modinst189 (.clk(clk), .wire8(wire185), .wire7(wire5), .wire9(wire97), .y(wire188), .wire10(wire1));
  always
    @(posedge clk) begin
      reg190 <= wire4[(5'h13):(3'h4)];
      reg191 <= $unsigned(wire185[(3'h7):(2'h2)]);
      reg192 <= wire97[(3'h5):(1'h1)];
      if ($signed(wire5[(4'h9):(3'h6)]))
        begin
          reg193 <= wire1[(5'h13):(4'hc)];
          if ((reg193 ?
              $signed((&$signed(wire4[(3'h6):(3'h5)]))) : (!($signed($unsigned(wire3)) <= wire188[(4'h8):(3'h4)]))))
            begin
              reg194 <= ($signed(wire4[(4'h9):(2'h3)]) && (~^{reg190[(4'h8):(3'h5)]}));
            end
          else
            begin
              reg194 <= {wire187[(3'h5):(1'h0)]};
              reg195 <= (-(((~^wire185) ?
                      $unsigned(((8'hbc) ? reg191 : (8'hac))) : ({(7'h40),
                              wire185} ?
                          (^wire3) : (~|wire0))) ?
                  (^~wire97) : wire1));
              reg196 <= $signed((wire2 + $signed(wire1[(4'hf):(2'h3)])));
              reg197 <= (&($signed(wire5[(1'h1):(1'h1)]) ?
                  {((wire187 ?
                          wire187 : wire0) <<< (wire97 >>> wire0))} : wire2));
              reg198 <= (^({(~&(wire185 ? reg191 : wire5))} ^~ (^~{{(8'hb3),
                      reg192}})));
            end
          reg199 <= reg193[(2'h3):(2'h2)];
          reg200 <= ((~&(((wire185 ? wire0 : reg190) ^~ wire4) ?
                  reg191[(4'h8):(2'h3)] : wire2)) ?
              $unsigned(wire97) : $unsigned($unsigned((((8'hb3) ?
                      reg190 : (7'h41)) ?
                  (reg193 ? reg197 : reg197) : $unsigned(reg190)))));
        end
      else
        begin
          reg193 <= reg191[(3'h6):(2'h2)];
          if ($unsigned((^~$signed((&wire97)))))
            begin
              reg194 <= (($signed(reg197) ?
                      $signed((((8'ha1) ? wire2 : wire1) ?
                          {reg192} : (+wire2))) : wire185[(4'h9):(2'h2)]) ?
                  reg191 : (($signed((wire5 << wire187)) >> $unsigned((7'h40))) ?
                      $unsigned((8'ha2)) : (+($signed((8'hb4)) ^ $signed(reg196)))));
              reg195 <= wire187;
              reg196 <= reg191;
              reg197 <= $signed((8'hb7));
              reg198 <= $unsigned(wire5);
            end
          else
            begin
              reg194 <= $signed((8'haa));
            end
          reg199 <= (~($signed((wire0 ? $signed(wire0) : $unsigned(reg193))) ?
              $unsigned($signed(reg192[(3'h5):(2'h3)])) : wire0[(4'h8):(3'h6)]));
          reg200 <= (8'ha4);
        end
      if ((reg199[(2'h2):(1'h0)] ?
          (reg196 ?
              (~^reg195[(1'h1):(1'h1)]) : (($signed(wire3) ?
                      wire1 : (wire5 ^~ reg198)) ?
                  ((wire188 > reg199) ^ $signed(reg196)) : (!$unsigned((8'hb5))))) : wire187[(2'h2):(2'h2)]))
        begin
          reg201 <= (8'hb3);
          reg202 <= wire0[(3'h6):(3'h6)];
          reg203 <= reg197;
        end
      else
        begin
          reg201 <= (^~$signed((+((reg200 ^ wire0) > (wire5 ?
              reg194 : wire5)))));
          if (({$unsigned(reg203)} ?
              wire185 : ($unsigned(wire0) ? reg191 : $unsigned(wire187))))
            begin
              reg202 <= reg193[(1'h0):(1'h0)];
            end
          else
            begin
              reg202 <= ((wire97 ?
                  (^~$unsigned($signed(reg196))) : {reg201,
                      ({wire2, reg194} ^~ ((8'ha2) ?
                          reg203 : reg194))}) <<< {$unsigned(((^(8'hb5)) != {wire5,
                      wire185}))});
              reg203 <= reg203;
              reg204 <= (reg193 ?
                  ($signed($unsigned($unsigned(reg191))) ?
                      $unsigned(reg190) : ($unsigned((|reg203)) * (~&$unsigned(reg191)))) : $unsigned((7'h43)));
              reg205 <= $unsigned($unsigned($unsigned($unsigned(wire1[(4'hd):(3'h7)]))));
              reg206 <= reg204[(2'h2):(1'h0)];
            end
          if ((^$signed({reg198})))
            begin
              reg207 <= $unsigned($unsigned(((-$signed(reg198)) << $unsigned($unsigned(wire97)))));
              reg208 <= (~^($signed($signed((8'hae))) ?
                  (reg199[(2'h3):(1'h0)] ?
                      {$unsigned(wire185)} : {(wire188 ?
                              wire5 : reg194)}) : $unsigned(($unsigned(reg190) ^ (reg197 <<< reg194)))));
              reg209 <= reg200;
              reg210 <= ($unsigned(((reg200 ?
                      $unsigned((8'h9d)) : wire2) <<< $signed({reg201,
                      reg204}))) ?
                  reg201 : $signed(($signed($unsigned(wire5)) < reg207)));
              reg211 <= $signed($signed(($signed($signed(reg191)) > ($signed(reg207) - (^~(8'hbd))))));
            end
          else
            begin
              reg207 <= (reg204 && $unsigned((($signed(reg209) != {wire0}) << (wire97 << $signed(reg202)))));
              reg208 <= (+reg193[(4'h9):(4'h9)]);
              reg209 <= ($unsigned((|(reg204[(1'h0):(1'h0)] ?
                  $signed(reg198) : reg201))) != $unsigned($signed((|((8'ha9) >>> reg205)))));
              reg210 <= $signed(($unsigned((~$signed((8'ha1)))) ?
                  ($unsigned((+wire2)) ?
                      reg202 : reg198) : ($unsigned(reg205[(3'h7):(2'h3)]) >>> (8'h9f))));
            end
          if (wire5[(5'h13):(1'h1)])
            begin
              reg212 <= $signed(($unsigned(((|(8'hac)) ^~ reg204[(1'h0):(1'h0)])) ?
                  ($unsigned((^~(8'hb8))) <<< reg205) : ((~&{reg208}) ?
                      (^~$unsigned(reg201)) : $signed(reg200[(4'hc):(4'h9)]))));
              reg213 <= ({$signed((((8'hbe) << reg209) ^~ {wire1})), reg190} ?
                  $unsigned({($unsigned(reg202) ?
                          $signed((8'hba)) : reg210)}) : $signed(reg206[(1'h1):(1'h0)]));
              reg214 <= (($unsigned(((~reg202) ?
                      $signed(reg192) : $signed(wire187))) ?
                  $unsigned($signed((reg204 || reg195))) : (+$signed(reg194))) | (~^wire5));
            end
          else
            begin
              reg212 <= ($unsigned($signed({(&reg204), wire4})) ^ wire3);
              reg213 <= (^~({($unsigned(reg197) ?
                          {(8'hb5), (8'ha0)} : $signed(reg201))} ?
                  $signed({$signed(reg200), (&reg204)}) : wire188));
              reg214 <= ({(reg201 != $signed(wire188)), wire97[(1'h0):(1'h0)]} ?
                  (~^wire2) : $signed(wire188[(4'hc):(1'h0)]));
            end
        end
    end
  assign wire215 = reg209;
endmodule

module module99
#(parameter param183 = (((~&(((8'haa) == (8'hbf)) && (~&(8'hb7)))) == ((|(!(8'hbe))) || (((8'hab) << (8'hb9)) <<< ((8'ha3) + (8'hbc))))) ^ (-((^~(~(8'h9c))) == (&{(8'ha6), (8'h9c)})))), 
parameter param184 = (param183 ~^ (param183 ~^ {(~^(param183 >>> param183)), (((7'h43) ? param183 : (8'ha8)) >> (param183 < param183))})))
(y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire103;
  input wire [(5'h15):(1'h0)] wire102;
  input wire [(4'h9):(1'h0)] wire101;
  input wire [(4'h9):(1'h0)] wire100;
  wire signed [(5'h15):(1'h0)] wire181;
  wire signed [(4'hb):(1'h0)] wire140;
  wire [(5'h15):(1'h0)] wire110;
  wire [(4'hb):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire107;
  wire signed [(5'h14):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire104;
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  assign y = {wire181,
                 wire140,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire104,
                 reg105,
                 (1'h0)};
  assign wire104 = (^~{wire103, wire103[(3'h7):(3'h4)]});
  always
    @(posedge clk) begin
      reg105 <= (((wire101[(1'h0):(1'h0)] ? wire101 : $unsigned((~wire104))) ?
              (wire100[(4'h9):(4'h9)] - ($unsigned(wire104) + $signed(wire104))) : (((~|wire104) > (wire102 * wire104)) ?
                  $unsigned((wire104 ?
                      wire102 : (8'hbf))) : ($unsigned(wire103) << $signed(wire102)))) ?
          $unsigned((-wire101)) : $unsigned((($signed(wire102) ?
              $signed((8'ha0)) : $unsigned(wire100)) < $unsigned($signed(wire102)))));
    end
  assign wire106 = $unsigned($signed({wire104[(2'h3):(1'h0)],
                       ((reg105 ^~ (8'h9e)) & $signed(reg105))}));
  assign wire107 = reg105;
  assign wire108 = {wire100,
                       ((((wire106 ?
                               wire106 : wire101) <<< (8'ha9)) == wire104[(1'h0):(1'h0)]) ?
                           (8'h9e) : (+((wire101 > (8'hb5)) <= $unsigned(wire107))))};
  assign wire109 = reg105[(3'h4):(3'h4)];
  assign wire110 = wire102[(2'h3):(1'h1)];
  module111 #() modinst141 (.wire115(wire102), .y(wire140), .clk(clk), .wire113(wire110), .wire112(wire106), .wire114(wire108));
  module142 #() modinst182 (wire181, clk, wire104, wire103, wire102, reg105, wire140);
endmodule

module module6
#(parameter param96 = ((&((~^{(7'h41)}) ? (((8'hb4) == (8'had)) >> {(7'h44), (8'hb7)}) : (((8'hb4) ? (8'h9e) : (8'hbf)) ? {(8'hae), (7'h41)} : ((8'had) && (8'hb6))))) && (8'hb0)))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  wire signed [(2'h3):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire68;
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire90,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire28,
                 wire29,
                 wire68,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= wire9[(2'h3):(2'h3)];
      if (wire7[(4'h9):(4'h9)])
        begin
          reg12 <= (+($unsigned((&$unsigned(wire10))) ?
              $signed($signed((wire10 ?
                  wire7 : wire7))) : (-$signed($unsigned(wire7)))));
          reg13 <= $unsigned($signed(wire7[(4'hf):(3'h6)]));
          reg14 <= wire9[(4'he):(4'hb)];
          reg15 <= reg14[(1'h0):(1'h0)];
          reg16 <= ($signed($signed(reg15)) ?
              ((($signed(wire8) ? (reg13 ? reg15 : wire8) : {wire7}) ?
                      ($unsigned(wire10) ?
                          (reg12 ?
                              reg13 : reg13) : $signed(reg13)) : $signed($unsigned(reg12))) ?
                  reg15[(2'h3):(1'h1)] : wire7[(4'hb):(3'h7)]) : reg13);
        end
      else
        begin
          reg12 <= $unsigned($signed(reg14[(2'h2):(1'h0)]));
          reg13 <= (wire7[(2'h2):(1'h1)] >= reg12);
          reg14 <= $unsigned($signed((wire9 >>> reg12)));
          reg15 <= (8'h9f);
        end
    end
  assign wire17 = (8'hb4);
  assign wire18 = (+reg14);
  assign wire19 = $signed(wire8[(3'h7):(3'h6)]);
  assign wire20 = $signed($unsigned($signed(wire9)));
  assign wire21 = reg11;
  always
    @(posedge clk) begin
      reg22 <= (~|(^~($unsigned($unsigned(reg14)) + $unsigned($signed(reg12)))));
      if (((|($unsigned(((8'hbe) <= wire9)) * (8'ha3))) == reg22[(3'h7):(1'h0)]))
        begin
          if ((((^~reg14) ?
              $signed(((wire21 ~^ wire21) * (reg13 > wire9))) : ($unsigned(reg13) <<< $unsigned(wire17[(4'hd):(1'h0)]))) >>> $signed((+$signed($signed(reg22))))))
            begin
              reg23 <= $unsigned({$signed($signed(reg22[(5'h11):(3'h4)])),
                  reg15});
            end
          else
            begin
              reg23 <= wire10;
              reg24 <= (wire10 ?
                  ($signed(($unsigned(reg11) << (reg15 ?
                      (8'h9d) : reg12))) <= reg23) : $signed(reg22));
              reg25 <= $unsigned((wire10[(1'h0):(1'h0)] ~^ wire7[(4'ha):(3'h7)]));
              reg26 <= (reg12[(5'h11):(4'h9)] ^ $unsigned(wire7[(5'h10):(4'hb)]));
            end
          if (reg12)
            begin
              reg27 <= $signed(($signed(reg22[(4'hd):(4'h8)]) == (((^reg22) ?
                  {reg16, reg24} : {reg22, reg12}) == $signed((reg14 ?
                  (7'h42) : (8'haa))))));
            end
          else
            begin
              reg27 <= reg13[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg23 <= $unsigned(wire20);
          reg24 <= reg11;
          reg25 <= (+((~^$unsigned({(8'h9c), reg27})) ?
              wire17[(5'h13):(3'h6)] : (8'ha6)));
          reg26 <= reg22;
        end
    end
  assign wire28 = $unsigned(((({(8'hbb)} >>> (~|reg13)) <= $signed((wire18 ?
                      wire18 : wire17))) <= wire17));
  assign wire29 = (wire20[(5'h10):(4'hd)] ? wire9 : (!wire21[(2'h2):(1'h1)]));
  module30 #() modinst69 (wire68, clk, wire10, wire29, reg25, wire8);
  assign wire70 = $signed($signed((wire9[(4'hb):(1'h1)] ?
                      $signed((+reg23)) : ((wire17 & reg11) ~^ $signed(wire18)))));
  assign wire71 = $signed(reg26);
  assign wire72 = $unsigned(($signed($signed((!wire21))) <= {$unsigned($signed((8'hb7)))}));
  assign wire73 = $unsigned(({wire70} - $signed((reg24 ?
                      {(8'hac), reg23} : (reg25 ? reg13 : reg24)))));
  assign wire74 = wire17;
  assign wire75 = ((7'h44) ?
                      reg16 : {$signed(wire74), {$signed($signed(wire28))}});
  assign wire76 = (wire73 ?
                      ($signed((&(wire68 ? reg13 : wire74))) ?
                          wire10 : ((-$unsigned((8'hbd))) < ((|wire75) ?
                              (!reg15) : reg12))) : wire7);
  module77 #() modinst91 (wire90, clk, reg13, wire29, reg14, wire8);
  assign wire92 = ({wire29} ?
                      ((~^($signed(wire74) < $unsigned(reg23))) | (~|($signed(wire29) == reg14))) : $signed(wire68));
  assign wire93 = (+($unsigned(wire29) * wire90));
  assign wire94 = $signed(wire8[(4'h9):(2'h3)]);
  assign wire95 = (~(reg24 ? wire75[(3'h6):(1'h1)] : reg11[(2'h3):(1'h0)]));
endmodule

module module77
#(parameter param88 = {(~&((~^((8'hb5) ? (8'h9e) : (8'h9e))) ? {{(8'ha8), (8'hb0)}, (|(8'hb5))} : (~^(8'hb1)))), (((((7'h42) ? (7'h40) : (8'ha8)) ^~ ((7'h43) - (8'hba))) >>> {(8'ha3), (&(8'h9c))}) ? (!(~&((8'ha8) >= (8'hba)))) : (8'had))}, 
parameter param89 = ((((-(-param88)) ? ({param88} - (param88 ? (8'hb1) : param88)) : ((~^param88) <= (param88 && param88))) + (~&((param88 ^ param88) || (param88 ~^ (8'h9e))))) ? (|(((~&param88) ? ((8'hae) ? (8'h9f) : (8'hbe)) : {param88}) ? ((~^param88) ? param88 : {param88}) : {(param88 ? param88 : (8'ha4)), ((8'ha0) == (8'h9c))})) : (~|param88)))
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire81;
  input wire [(3'h6):(1'h0)] wire80;
  input wire signed [(5'h14):(1'h0)] wire79;
  input wire [(3'h7):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire87;
  wire [(4'hd):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire82;
  assign y = {wire87, wire86, wire85, wire84, wire83, wire82, (1'h0)};
  assign wire82 = ($signed(((&{wire78}) ?
                      $signed(wire81) : $signed((!wire78)))) && (|{((wire79 <= wire79) || wire81),
                      ((wire80 ? wire78 : wire78) || (~|wire80))}));
  assign wire83 = wire78;
  assign wire84 = $signed((wire79[(4'hd):(2'h2)] ?
                      ($unsigned($unsigned(wire78)) ?
                          wire83[(4'h8):(2'h3)] : $signed($signed(wire81))) : (~$signed((wire81 ?
                          wire80 : wire80)))));
  assign wire85 = $unsigned((((!$unsigned(wire81)) * wire84) ^~ wire81[(4'ha):(3'h6)]));
  assign wire86 = ({wire83[(1'h1):(1'h1)], (wire85 && (8'hb0))} && (~&wire79));
  assign wire87 = ($unsigned(wire85) + $signed((|wire85[(4'hc):(4'hb)])));
endmodule

module module30
#(parameter param66 = ((&(((~&(7'h40)) ? ((8'ha7) ? (8'ha5) : (8'ha6)) : ((8'h9e) < (8'hbf))) && (((7'h43) & (8'ha0)) ? (8'hb3) : ((8'haa) ? (8'hbd) : (8'hb2))))) ? (~&(({(8'ha2)} >= {(8'ha2), (8'h9c)}) ? ((~^(8'hb9)) | ((8'hac) ? (7'h40) : (8'h9e))) : (((8'ha6) ? (8'hac) : (8'ha8)) ? ((8'hb3) ? (8'hb6) : (8'hb4)) : ((8'hb3) ? (8'hb6) : (8'ha3))))) : {((|(~&(8'had))) ? (((8'hbf) >>> (8'hae)) < (~&(8'ha5))) : ((~|(8'hb4)) ? (+(8'hb9)) : (^~(8'ha0)))), ((((8'hbc) ? (8'hb4) : (8'ha2)) <= {(7'h44), (8'h9e)}) ? (~&((8'ha1) ~^ (7'h40))) : {((7'h44) ? (8'hae) : (8'ha8)), (8'hac)})}), 
parameter param67 = ((((param66 ^~ (-param66)) ? (8'hb7) : ((param66 ? param66 : param66) ? {param66} : (~|param66))) ? param66 : ({(8'ha2)} ? ((param66 ? param66 : param66) ? {param66, param66} : (param66 >> (8'hac))) : param66)) || (8'hb7)))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire34;
  input wire [(4'hd):(1'h0)] wire33;
  input wire [(3'h5):(1'h0)] wire32;
  input wire signed [(3'h6):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire64;
  wire [(2'h3):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire35;
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire50,
                 wire49,
                 wire37,
                 wire35,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg36,
                 (1'h0)};
  assign wire35 = (wire33 * ((|((~^wire33) ?
                      wire32 : wire31)) <= ((wire32[(2'h3):(1'h1)] ~^ wire31[(3'h5):(2'h2)]) ?
                      (~^(+wire31)) : wire32[(3'h5):(1'h1)])));
  always
    @(posedge clk) begin
      reg36 <= wire32;
    end
  assign wire37 = ($unsigned({($unsigned(wire33) != wire31[(2'h3):(1'h0)])}) - $unsigned(((^~(wire34 <= wire32)) && wire31[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      reg38 <= {(~&((~|((8'hac) ^ wire32)) <<< ($unsigned(reg36) ?
              wire35[(2'h3):(2'h3)] : wire33)))};
      if (wire35)
        begin
          reg39 <= ((!wire35) & $signed((!$signed(wire37[(4'hd):(1'h1)]))));
          reg40 <= $signed(((wire32 || $unsigned(wire35[(2'h2):(1'h0)])) ?
              (-(wire35[(3'h4):(1'h1)] ?
                  reg38[(2'h3):(2'h2)] : {(8'had),
                      (8'ha5)})) : wire37[(1'h1):(1'h0)]));
          reg41 <= reg36;
          reg42 <= $unsigned((!(-{(&reg38), reg40})));
        end
      else
        begin
          reg39 <= (wire34 ?
              (wire34 != (^$unsigned(reg36[(5'h11):(4'hf)]))) : (wire37[(3'h4):(1'h1)] ?
                  reg38 : (reg42[(2'h2):(1'h1)] ?
                      $unsigned(reg36) : $signed((reg40 ? reg39 : reg41)))));
          reg40 <= wire35;
          reg41 <= $signed($unsigned(wire33));
          reg42 <= (($signed($signed($unsigned(reg39))) ?
                  reg36 : $signed($signed(wire33[(1'h0):(1'h0)]))) ?
              $signed((^wire31)) : reg38);
          if (($signed(reg42) & $unsigned($unsigned(($unsigned((8'ha8)) ?
              $signed((8'hb4)) : (!wire32))))))
            begin
              reg43 <= $unsigned($signed((~^reg38[(3'h7):(3'h5)])));
              reg44 <= wire37[(1'h0):(1'h0)];
            end
          else
            begin
              reg43 <= reg42;
              reg44 <= $unsigned((reg44 < reg41[(1'h0):(1'h0)]));
              reg45 <= (~^(!$signed(((wire37 != (8'hb7)) ? wire34 : reg36))));
              reg46 <= reg38[(4'hb):(4'h8)];
              reg47 <= (~&$unsigned(reg44));
            end
        end
    end
  always
    @(posedge clk) begin
      reg48 <= ($signed($signed($signed($signed(reg46)))) ?
          wire33[(3'h4):(3'h4)] : $signed({$unsigned($unsigned((7'h40))),
              (!$signed(reg43))}));
    end
  assign wire49 = reg45;
  assign wire50 = $unsigned(reg47[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg51 <= (((($unsigned(wire33) ? $unsigned(reg42) : $unsigned(reg43)) ?
                  wire32 : (^~{wire31})) ?
              (reg43 >> (^~$unsigned(reg48))) : $unsigned($signed({reg38}))) ?
          ($unsigned($signed((wire49 << reg38))) ^~ wire31[(1'h1):(1'h0)]) : reg43[(1'h1):(1'h0)]);
      reg52 <= ((wire33 ? ((8'ha3) | $signed($signed(wire33))) : wire50) ?
          {{(!(reg51 ? wire31 : reg38))},
              (+{$unsigned(reg47),
                  (wire37 << (8'ha6))})} : $unsigned((((reg38 | reg36) ?
                  $signed(reg43) : reg46) ?
              ((wire33 ? wire34 : (8'hb7)) ?
                  $signed(wire35) : reg47[(2'h2):(1'h0)]) : {(wire49 ?
                      wire31 : reg38)})));
      reg53 <= {$signed((({wire49, reg48} ?
                  (reg41 ? reg52 : reg38) : (reg43 ? wire37 : wire49)) ?
              $unsigned((!reg46)) : (&$signed(reg43))))};
      reg54 <= ((($unsigned({wire32, reg47}) << ($unsigned(reg52) ?
              $signed(reg46) : (wire34 ? reg39 : wire50))) < ((|(wire32 ?
                  reg47 : reg36)) ?
              ((reg40 ? reg46 : reg45) && (wire37 ?
                  (8'hbf) : wire34)) : reg51)) ?
          reg52[(2'h2):(2'h2)] : reg53[(4'ha):(3'h4)]);
    end
  assign wire55 = {reg45};
  assign wire56 = $unsigned(reg51);
  assign wire57 = (8'ha3);
  assign wire58 = (-(!$unsigned(reg47[(2'h3):(1'h1)])));
  assign wire59 = $unsigned($unsigned($signed(reg42[(3'h6):(2'h3)])));
  assign wire60 = reg40;
  assign wire61 = wire55[(4'h9):(3'h6)];
  assign wire62 = $unsigned($unsigned(($unsigned((wire34 ? reg38 : wire49)) ?
                      ((~&reg38) == (wire35 & (8'ha5))) : (~reg51))));
  assign wire63 = ((wire59[(2'h2):(1'h0)] > ((wire58[(1'h0):(1'h0)] >= $unsigned(reg38)) + wire49[(3'h4):(1'h0)])) * (~&{wire58[(2'h2):(2'h2)]}));
  assign wire64 = wire58[(2'h2):(1'h1)];
  assign wire65 = (~^((&$unsigned((wire63 >= reg48))) < ((|(reg48 != (7'h44))) ?
                      $signed($unsigned(reg48)) : wire58)));
endmodule

module module142  (y, clk, wire147, wire146, wire145, wire144, wire143);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire147;
  input wire signed [(4'h8):(1'h0)] wire146;
  input wire [(3'h4):(1'h0)] wire145;
  input wire signed [(4'hf):(1'h0)] wire144;
  input wire [(4'ha):(1'h0)] wire143;
  wire [(4'ha):(1'h0)] wire180;
  wire signed [(5'h13):(1'h0)] wire179;
  wire [(2'h3):(1'h0)] wire171;
  wire signed [(4'hc):(1'h0)] wire170;
  wire [(5'h12):(1'h0)] wire169;
  wire signed [(4'he):(1'h0)] wire168;
  wire signed [(5'h10):(1'h0)] wire159;
  wire [(5'h14):(1'h0)] wire155;
  wire signed [(4'hc):(1'h0)] wire154;
  wire [(5'h14):(1'h0)] wire153;
  wire signed [(3'h4):(1'h0)] wire152;
  wire signed [(2'h2):(1'h0)] wire150;
  wire [(4'hd):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire148;
  reg signed [(4'h8):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg174 = (1'h0);
  reg [(4'ha):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg172 = (1'h0);
  reg [(3'h7):(1'h0)] reg167 = (1'h0);
  reg [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(4'hb):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg158 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg156 = (1'h0);
  reg [(4'h9):(1'h0)] reg151 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire159,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire150,
                 wire149,
                 wire148,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg158,
                 reg157,
                 reg156,
                 reg151,
                 (1'h0)};
  assign wire148 = (~|(~^wire144));
  assign wire149 = (7'h43);
  assign wire150 = (wire146 + (wire144[(2'h2):(1'h1)] && $unsigned(wire149[(3'h4):(2'h2)])));
  always
    @(posedge clk) begin
      reg151 <= ((^~($unsigned(wire149[(1'h1):(1'h0)]) <= (+(~&wire149)))) - {(!(^(wire144 ?
              wire145 : wire145)))});
    end
  assign wire152 = $unsigned(wire147[(3'h5):(1'h0)]);
  assign wire153 = $signed((({wire143} ?
                       $signed((wire145 ? (8'hb6) : wire144)) : ((wire143 ?
                           (8'h9f) : wire144) ~^ (wire145 < wire145))) > wire150[(1'h1):(1'h1)]));
  assign wire154 = (~(wire153[(4'hc):(4'h9)] & $unsigned(($signed((8'ha8)) ?
                       ((8'hab) ? (8'hb0) : reg151) : (wire144 ~^ wire147)))));
  assign wire155 = wire145[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg156 <= $signed(wire144[(4'hc):(4'h9)]);
      reg157 <= ($signed(wire153[(4'he):(1'h1)]) ?
          (~^wire152[(1'h0):(1'h0)]) : wire154);
      reg158 <= ({$unsigned(wire146),
              ((~|(wire145 == reg156)) ?
                  (~$signed(wire143)) : ((wire155 ^ reg156) == (wire150 ~^ wire149)))} ?
          ((~^$unsigned({wire150,
              wire153})) < (~&$unsigned($signed(wire155)))) : (~&($signed((reg151 + (8'hb4))) <= wire154[(3'h5):(2'h3)])));
    end
  assign wire159 = (8'hb1);
  always
    @(posedge clk) begin
      reg160 <= wire148;
      reg161 <= (8'ha0);
      if (wire143[(2'h2):(1'h1)])
        begin
          reg162 <= (~(wire147[(4'h8):(3'h6)] <= ((^$signed((8'hbe))) ?
              ((~^wire153) ?
                  $unsigned(wire147) : $unsigned(wire155)) : reg151[(1'h0):(1'h0)])));
          reg163 <= ((^~$unsigned(reg160[(2'h3):(2'h2)])) ?
              (wire159 - reg158[(4'hb):(3'h5)]) : ((reg156[(2'h3):(1'h1)] ?
                  $unsigned((|reg160)) : wire146) != wire147));
        end
      else
        begin
          reg162 <= (reg163 ?
              (($signed($signed((8'hb5))) || ($unsigned(wire143) ?
                      (~&wire148) : reg156[(3'h6):(1'h0)])) ?
                  $signed(wire159) : (&$signed(wire150[(2'h2):(1'h1)]))) : $signed(($signed((reg163 ?
                  wire145 : reg163)) << $signed((~|wire143)))));
          if (($signed(($signed($unsigned(wire155)) ^ $unsigned($unsigned(wire153)))) ?
              (wire143 * wire159[(2'h2):(1'h1)]) : ($unsigned(reg163) ~^ ($signed((8'h9d)) ?
                  (reg157[(4'ha):(1'h1)] ?
                      (wire148 ?
                          reg163 : wire143) : wire146) : ($signed(wire154) ?
                      (reg161 ? wire150 : wire148) : wire159[(1'h0):(1'h0)])))))
            begin
              reg163 <= $unsigned((reg156[(2'h3):(1'h1)] ?
                  (reg156 ?
                      reg156 : ({wire144} ?
                          (wire147 ?
                              wire143 : wire148) : $unsigned(wire144))) : wire147));
              reg164 <= $signed(wire143);
              reg165 <= (($unsigned(wire146[(4'h8):(2'h3)]) ?
                      wire150 : reg161) ?
                  ((|{reg162, $signed(reg151)}) ?
                      wire152 : (((|wire149) ?
                          (wire154 ?
                              wire150 : wire152) : reg161[(1'h0):(1'h0)]) < wire155[(5'h13):(3'h7)])) : $signed((reg161 * {$unsigned(wire153),
                      reg158[(5'h10):(2'h2)]})));
            end
          else
            begin
              reg163 <= reg165;
              reg164 <= (wire152[(1'h0):(1'h0)] < wire147);
            end
          reg166 <= {(!wire148)};
          reg167 <= ((($signed(reg161) ?
                      $signed(wire144[(4'h9):(1'h1)]) : $unsigned(wire149)) ?
                  (($unsigned(wire159) ?
                      reg163[(4'h8):(4'h8)] : reg156) != ($signed(wire143) ~^ (reg158 ?
                      wire155 : reg158))) : $unsigned((wire150[(1'h1):(1'h0)] ?
                      $signed(reg151) : $signed(wire146)))) ?
              wire153 : (wire148 >= ((~|(wire147 > (8'h9e))) && $signed((&reg165)))));
        end
    end
  assign wire168 = $signed(({wire145, wire143[(2'h2):(1'h0)]} ?
                       ($signed({wire148, reg161}) << reg163) : (&((wire155 ?
                               reg151 : reg166) ?
                           $unsigned(reg162) : reg158[(1'h0):(1'h0)]))));
  assign wire169 = (|reg151[(2'h3):(2'h3)]);
  assign wire170 = (reg158[(1'h0):(1'h0)] < {($unsigned((wire146 ?
                           wire153 : wire148)) * wire148),
                       ((wire154[(2'h2):(1'h0)] == (reg162 && wire153)) ?
                           {reg163,
                               $signed(reg167)} : ((wire146 < (8'ha2)) != (reg158 ?
                               reg160 : (8'hba))))});
  assign wire171 = ((wire170 < (wire168[(4'hd):(3'h4)] ?
                       wire145 : $signed((+reg165)))) * ({(&(~|wire154)),
                       (~$signed((8'ha6)))} + $signed((wire143[(2'h2):(1'h0)] ?
                       ((8'ha0) ? reg162 : (8'hac)) : (wire147 != (8'h9f))))));
  always
    @(posedge clk) begin
      reg172 <= (wire145[(1'h0):(1'h0)] ? wire169[(5'h12):(5'h11)] : (8'hba));
      reg173 <= (~|reg156[(3'h4):(1'h1)]);
      reg174 <= $unsigned(reg163[(3'h7):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg175 <= $unsigned($unsigned($unsigned($unsigned($unsigned((8'ha5))))));
      reg176 <= (~wire152[(2'h2):(2'h2)]);
      reg177 <= $unsigned($unsigned($signed(reg158[(3'h7):(1'h1)])));
      reg178 <= wire153;
    end
  assign wire179 = (^($signed($unsigned(wire145)) >= ($signed(((8'h9e) ?
                           wire148 : reg158)) ?
                       ((reg163 < reg151) >= (wire152 ?
                           reg164 : reg176)) : ((reg177 ? wire147 : reg157) ?
                           $signed((8'ha0)) : $unsigned((8'had))))));
  assign wire180 = ((^reg176[(4'h9):(3'h6)]) + (|$signed({$signed(reg164),
                       $unsigned(reg178)})));
endmodule

module module111  (y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire115;
  input wire [(4'he):(1'h0)] wire114;
  input wire signed [(5'h15):(1'h0)] wire113;
  input wire [(5'h11):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire139;
  wire [(4'hd):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire137;
  wire [(4'ha):(1'h0)] wire136;
  wire signed [(4'hb):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(4'hb):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire126;
  wire [(3'h5):(1'h0)] wire125;
  wire [(5'h10):(1'h0)] wire124;
  wire [(4'hc):(1'h0)] wire116;
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(4'hb):(1'h0)] reg133 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire116,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire116 = ((wire113[(4'hd):(4'hd)] ?
                           wire113[(4'hb):(3'h6)] : ({{wire115},
                                   (wire112 ? wire112 : wire112)} ?
                               ((wire114 ?
                                   wire113 : wire114) == wire115) : $signed(wire112[(4'hb):(4'h9)]))) ?
                       wire113[(3'h4):(1'h0)] : ($unsigned($unsigned((wire115 ?
                               (8'h9f) : (8'hb1)))) ?
                           (~$unsigned($signed(wire115))) : $signed(wire113)));
  always
    @(posedge clk) begin
      reg117 <= wire116;
      reg118 <= wire113;
      reg119 <= wire112[(3'h5):(3'h5)];
      reg120 <= (&wire116[(2'h2):(2'h2)]);
      reg121 <= $unsigned($unsigned((^$signed($unsigned(reg120)))));
    end
  always
    @(posedge clk) begin
      reg122 <= (+$signed(reg119));
      reg123 <= $unsigned({{wire115, reg118[(2'h2):(1'h0)]}});
    end
  assign wire124 = (((($unsigned(wire115) + $unsigned(wire113)) ?
                           $signed((reg120 ?
                               wire112 : wire116)) : reg119[(4'hb):(4'hb)]) <<< (+(wire112[(4'hf):(3'h6)] ?
                           reg119 : (reg119 ? reg121 : wire114)))) ?
                       ({(^(|reg122)), reg120} ?
                           {$unsigned((reg120 * wire112))} : $signed((~&(|reg119)))) : (+((+$signed((8'hab))) ?
                           ((~wire112) ?
                               (8'h9f) : reg123[(1'h1):(1'h1)]) : {reg120,
                               wire112})));
  assign wire125 = reg119[(2'h3):(1'h1)];
  assign wire126 = (~^{wire112[(2'h3):(2'h2)]});
  assign wire127 = ((reg122 ?
                           ((-$unsigned((8'hab))) ?
                               ((wire126 * wire112) * $unsigned((8'ha9))) : $signed($unsigned(wire113))) : ((wire114[(4'hb):(1'h1)] ?
                               (reg118 ?
                                   reg122 : wire125) : $unsigned(wire115)) >= $unsigned($signed(reg122)))) ?
                       {((wire115[(1'h0):(1'h0)] ?
                                   $signed(wire115) : $unsigned(reg121)) ?
                               (reg121 != (reg123 >>> reg117)) : wire126[(4'h8):(3'h6)])} : (wire126 | $unsigned(((+wire126) ?
                           {reg122, (8'hb9)} : (wire124 ^~ (8'haa))))));
  assign wire128 = ((~^$unsigned(((reg121 ?
                       reg122 : wire114) > (wire115 ~^ (8'hb9))))) >= (($signed(wire124[(4'hf):(3'h4)]) ?
                       (~|reg117) : (-$unsigned(reg121))) >= wire114[(3'h4):(2'h3)]));
  assign wire129 = (wire127[(3'h4):(2'h2)] ?
                       {wire112,
                           ($signed({reg118}) ?
                               wire116[(2'h2):(2'h2)] : reg120[(5'h10):(2'h3)])} : $signed(($signed((reg121 + reg118)) ?
                           {$signed(reg119),
                               (!reg121)} : (wire128[(1'h1):(1'h0)] ?
                               $unsigned(reg121) : (reg119 ?
                                   reg117 : wire115)))));
  assign wire130 = ((((!(reg119 || (8'ha8))) ?
                           (wire125 ?
                               $signed(reg117) : (+wire128)) : ($signed(reg121) << wire113[(5'h10):(4'h9)])) == reg121[(3'h5):(1'h0)]) ?
                       wire127[(4'h8):(3'h7)] : reg119[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg131 <= (~$unsigned($unsigned($unsigned((~wire127)))));
      reg132 <= {reg131[(4'ha):(4'ha)]};
      reg133 <= reg120;
      reg134 <= (wire127 <<< $unsigned(wire129));
    end
  assign wire135 = {{((&(~&wire127)) ^~ (reg120 & $signed(reg121))),
                           $signed(($signed(reg121) && wire126[(1'h1):(1'h0)]))}};
  assign wire136 = (~$signed((~(8'h9f))));
  assign wire137 = $unsigned(($unsigned((|reg118)) ?
                       (wire116[(1'h1):(1'h1)] >= reg131) : $signed((~&wire130))));
  assign wire138 = $unsigned(((((reg132 ? (8'hab) : (8'h9f)) ?
                           (reg119 >>> wire116) : $signed(reg118)) >= reg117) ?
                       $signed(reg121) : (8'ha0)));
  assign wire139 = (wire130 + $signed((-(wire129[(4'hc):(2'h2)] ?
                       reg123[(3'h5):(1'h0)] : (reg118 ? reg134 : reg118)))));
endmodule
