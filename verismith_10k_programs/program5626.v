module top
#(parameter param226 = ((-(+{{(8'ha5), (8'h9f)}, ((8'hb8) >> (8'hbb))})) ? (~{(((7'h44) ? (8'hb7) : (8'haa)) >>> (~^(8'hb2)))}) : (~|((((8'haa) >= (8'hae)) ? ((8'hac) ? (8'hb6) : (8'hab)) : ((8'ha7) >> (8'hbb))) ? (((8'ha6) ? (8'hbd) : (8'hbb)) ^~ ((8'hb3) && (7'h42))) : ({(8'hae)} ? ((8'haa) >> (8'hae)) : (&(7'h44)))))), 
parameter param227 = ((|(((param226 ? param226 : param226) ? param226 : {param226, param226}) ? (~^(~param226)) : (7'h43))) + ((8'hb9) ? {(-param226)} : (^~((~param226) == (param226 ? param226 : param226))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire225;
  wire signed [(3'h7):(1'h0)] wire223;
  wire [(4'ha):(1'h0)] wire215;
  wire [(4'h9):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire217;
  wire [(2'h3):(1'h0)] wire218;
  wire [(4'hb):(1'h0)] wire219;
  reg [(3'h7):(1'h0)] reg222 = (1'h0);
  reg [(3'h4):(1'h0)] reg221 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  assign y = {wire225,
                 wire223,
                 wire215,
                 wire57,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire46,
                 wire7,
                 wire6,
                 wire5,
                 wire217,
                 wire218,
                 wire219,
                 reg222,
                 reg221,
                 reg59,
                 reg58,
                 reg56,
                 reg55,
                 reg54,
                 reg48,
                 (1'h0)};
  assign wire5 = (7'h40);
  assign wire6 = (^~(^wire0));
  assign wire7 = wire4[(5'h10):(3'h4)];
  module8 #() modinst47 (wire46, clk, wire6, wire3, wire0, wire1);
  always
    @(posedge clk) begin
      reg48 <= wire7[(3'h4):(3'h4)];
    end
  assign wire49 = $unsigned({$unsigned(($signed(wire6) || $unsigned((8'h9c))))});
  assign wire50 = (~|wire1[(1'h0):(1'h0)]);
  assign wire51 = (~^(8'hb6));
  assign wire52 = $signed($signed({(wire46[(3'h5):(3'h5)] ?
                          wire50 : $signed(wire1)),
                      (-$signed(wire1))}));
  assign wire53 = (|$signed(((+$unsigned(wire52)) ?
                      $signed($unsigned(wire1)) : ((wire6 <<< wire2) << (~^wire4)))));
  always
    @(posedge clk) begin
      reg54 <= ({$unsigned(($unsigned(reg48) ? (~wire46) : wire1)),
          (~&((^wire49) ?
              ((8'hb2) ? (7'h43) : wire0) : (~^wire4)))} <= $unsigned(wire2));
      reg55 <= (~^($signed($unsigned($signed(wire46))) ?
          ({((8'hbf) ? wire7 : wire51)} == $unsigned((wire7 ?
              reg48 : wire5))) : (wire5[(2'h3):(1'h0)] ?
              {(^~reg54)} : $unsigned((wire52 <= (8'ha3))))));
      reg56 <= (!wire50);
    end
  assign wire57 = ($signed($unsigned(reg55)) ?
                      reg56[(4'h8):(2'h2)] : {{(^(-reg48))}});
  always
    @(posedge clk) begin
      reg58 <= reg55[(3'h5):(3'h4)];
      reg59 <= (~&($unsigned($unsigned($unsigned(reg55))) ?
          reg58 : (wire4 < ($unsigned(wire7) ? $unsigned(wire3) : wire57))));
    end
  module60 #() modinst216 (.y(wire215), .clk(clk), .wire63(wire49), .wire65(reg56), .wire64(wire57), .wire61(reg48), .wire62(wire50));
  assign wire217 = (wire7 >>> {(reg48[(4'hf):(4'hd)] ?
                           (~$signed(reg58)) : wire3[(3'h6):(1'h1)])});
  assign wire218 = ({$unsigned($signed((&wire6))),
                           ((((8'ha3) >> reg59) <<< (8'ha5)) ?
                               (^(wire2 ?
                                   wire51 : wire3)) : wire215[(4'h8):(1'h0)])} ?
                       wire49[(5'h13):(3'h5)] : (8'hac));
  module60 #() modinst220 (.wire63(wire3), .wire64(reg54), .clk(clk), .wire62(wire46), .wire61(reg55), .wire65(wire7), .y(wire219));
  always
    @(posedge clk) begin
      reg221 <= wire215[(3'h5):(1'h0)];
      reg222 <= $signed((^$signed((wire52 ?
          wire1[(2'h2):(1'h0)] : $signed(reg56)))));
    end
  module96 #() modinst224 (wire223, clk, wire217, wire3, wire218, wire52);
  assign wire225 = $unsigned(reg221);
endmodule

module module60  (y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h232):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire65;
  input wire signed [(4'h9):(1'h0)] wire64;
  input wire [(5'h15):(1'h0)] wire63;
  input wire signed [(5'h10):(1'h0)] wire62;
  input wire [(4'ha):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire214;
  wire signed [(5'h14):(1'h0)] wire213;
  wire signed [(4'he):(1'h0)] wire212;
  wire signed [(3'h4):(1'h0)] wire211;
  wire [(5'h14):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire94;
  wire [(5'h14):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire197;
  reg [(4'h9):(1'h0)] reg210 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg209 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg208 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg207 = (1'h0);
  reg [(3'h7):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg205 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg203 = (1'h0);
  reg [(4'hb):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg201 = (1'h0);
  reg [(4'hf):(1'h0)] reg200 = (1'h0);
  reg [(4'he):(1'h0)] reg199 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  assign y = {wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire108,
                 wire94,
                 wire110,
                 wire197,
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
                 reg95,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire62))
        begin
          if (wire61)
            begin
              reg66 <= ((~&$signed($unsigned((+wire63)))) != wire61[(4'h9):(2'h2)]);
              reg67 <= $signed(((~(~^(8'haf))) ?
                  (wire65[(4'h9):(3'h6)] ?
                      {(wire64 ?
                              reg66 : wire65)} : $unsigned(wire62[(3'h7):(3'h5)])) : wire62));
              reg68 <= $unsigned((~|(wire64 ?
                  ({reg67} ?
                      (reg67 & reg67) : (wire65 + wire65)) : $signed({wire64}))));
              reg69 <= (~|($signed(wire65[(3'h6):(1'h0)]) | (!{$unsigned(wire62),
                  $unsigned(wire64)})));
              reg70 <= (((reg66 || (!reg66[(3'h4):(1'h1)])) & (wire64 + ((!reg66) & $signed(wire62)))) ?
                  (reg68 + $unsigned(reg66)) : ($signed(((~^(8'hb6)) ^~ $signed(wire64))) ?
                      wire62[(2'h3):(1'h0)] : $signed($unsigned((reg67 ?
                          reg68 : reg69)))));
            end
          else
            begin
              reg66 <= ($unsigned({($signed((8'hb4)) ?
                      (reg69 ? wire62 : wire63) : $unsigned((8'h9d))),
                  reg70}) > ((wire62[(1'h0):(1'h0)] >> {reg68,
                      reg69[(2'h2):(1'h1)]}) ?
                  ((wire64 ? $signed(reg68) : wire62) ?
                      (8'hbe) : {wire61[(4'h9):(3'h5)],
                          {(8'hb1)}}) : (~&(reg66 >>> (-reg69)))));
              reg67 <= $unsigned(wire61[(3'h4):(2'h2)]);
              reg68 <= $unsigned(wire65);
              reg69 <= ($unsigned(((wire64[(1'h0):(1'h0)] < (8'hab)) - {(wire63 ?
                          wire62 : reg67)})) ?
                  reg69[(1'h0):(1'h0)] : wire61[(2'h2):(1'h0)]);
              reg70 <= (($unsigned({$signed(wire63), $signed((8'ha3))}) ?
                  $signed(((reg67 ?
                      wire65 : wire65) + (+reg70))) : {(8'hbe)}) ^~ (($unsigned(reg67) & $unsigned($unsigned(wire61))) ?
                  $signed($unsigned((reg68 ^~ (8'ha5)))) : $signed(((8'hac) * {(8'h9f)}))));
            end
          if ((8'h9c))
            begin
              reg71 <= $signed(wire63);
              reg72 <= (!(|(^~((7'h42) << (~^reg67)))));
              reg73 <= (($unsigned(($unsigned(wire62) ?
                      (wire61 ? reg69 : (8'hbf)) : reg67[(4'he):(4'h9)])) ?
                  (~$signed($signed((8'h9c)))) : (&(~$signed(wire64)))) > reg67);
            end
          else
            begin
              reg71 <= $unsigned(reg69[(2'h3):(2'h3)]);
              reg72 <= wire65;
              reg73 <= {$unsigned($signed((8'hb2))), reg67[(4'hb):(1'h0)]};
              reg74 <= $signed({reg73,
                  $unsigned(($signed(reg70) ?
                      (wire65 == reg68) : $unsigned((8'hb3))))});
              reg75 <= ((&$unsigned(((~^reg67) ^~ {wire61,
                  reg73}))) <<< $signed($signed(wire63[(4'hb):(3'h4)])));
            end
        end
      else
        begin
          if (reg75)
            begin
              reg66 <= (+{reg67});
              reg67 <= {$unsigned(wire63), reg74[(3'h6):(3'h5)]};
              reg68 <= reg74;
            end
          else
            begin
              reg66 <= reg66[(1'h0):(1'h0)];
            end
          reg69 <= wire65;
          reg70 <= reg70[(1'h1):(1'h1)];
          reg71 <= $signed(((((+reg73) > reg72) >= ((wire63 ^ reg72) ?
              reg68 : (~^(7'h43)))) != (~^reg69[(1'h1):(1'h1)])));
          reg72 <= (wire62[(3'h6):(2'h2)] == $unsigned((~|$signed((~|wire64)))));
        end
      reg76 <= wire65;
      if ((~reg72[(2'h2):(2'h2)]))
        begin
          reg77 <= reg75;
        end
      else
        begin
          if (($signed(wire62) && $unsigned({reg72[(4'ha):(1'h1)]})))
            begin
              reg77 <= $unsigned($signed($unsigned(reg75[(1'h1):(1'h0)])));
              reg78 <= $unsigned(reg68);
              reg79 <= (reg75 ?
                  (^~$unsigned(wire61[(1'h1):(1'h0)])) : (^wire62));
            end
          else
            begin
              reg77 <= wire65[(3'h7):(3'h4)];
            end
        end
      if ({($unsigned(((~wire65) < $signed(wire61))) ?
              (-{(reg77 ? reg72 : reg71)}) : $unsigned(wire61[(4'h9):(4'h9)])),
          ($signed({$unsigned(reg67)}) >> (((reg69 ? reg72 : wire61) || (reg74 ?
                  (8'hb8) : reg69)) ?
              ((~|wire64) ? reg75 : reg77[(1'h0):(1'h0)]) : reg73))})
        begin
          reg80 <= ((^reg66[(3'h4):(2'h3)]) != $signed($unsigned((~&(reg69 ?
              reg77 : reg70)))));
          reg81 <= (($unsigned({(reg73 ? reg74 : reg67), $signed((8'ha3))}) ?
              $signed((~|reg73)) : $signed($signed(reg71))) || ((~|reg69) <= (+$signed($unsigned(wire61)))));
          reg82 <= ($signed((^reg81[(2'h3):(1'h1)])) << (((8'ha0) <= $signed($unsigned(reg78))) >= (+wire63)));
        end
      else
        begin
          reg80 <= reg72[(4'he):(1'h1)];
          if ((reg82[(2'h2):(2'h2)] ^~ wire61))
            begin
              reg81 <= (!wire62);
              reg82 <= (&(reg82 && (((8'hb6) ?
                  $signed(reg69) : $unsigned(reg69)) & (^~((8'hac) * reg68)))));
            end
          else
            begin
              reg81 <= $signed($signed($unsigned((|$unsigned(reg66)))));
              reg82 <= $unsigned(($unsigned((~|((8'hb8) ?
                  reg81 : reg68))) | (((reg67 == reg76) == $signed(reg72)) ?
                  $signed((reg76 != reg75)) : $signed(reg66[(1'h1):(1'h0)]))));
            end
          reg83 <= reg74[(2'h3):(1'h0)];
          reg84 <= (~^$signed($signed(reg71[(4'h8):(3'h5)])));
        end
      if (reg82[(2'h3):(1'h0)])
        begin
          if ((wire65[(3'h6):(3'h6)] ?
              (~^{(~|((8'hb2) < (8'ha0))),
                  $signed(reg80[(3'h6):(3'h4)])}) : ((^~reg73[(3'h6):(1'h0)]) ?
                  reg67 : $signed((&$unsigned(reg74))))))
            begin
              reg85 <= {$unsigned({reg73[(3'h6):(3'h4)]})};
              reg86 <= reg69[(2'h3):(1'h1)];
            end
          else
            begin
              reg85 <= $signed(wire65[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          if (reg82[(2'h2):(1'h1)])
            begin
              reg85 <= ($signed((^reg84)) >> (((+(wire64 * reg67)) ?
                  ({reg82, reg83} ?
                      $unsigned(reg78) : wire64[(3'h6):(3'h4)]) : (8'ha9)) == (7'h44)));
              reg86 <= (+($signed((8'ha9)) ?
                  (({reg81} ?
                      (wire63 != reg85) : ((8'hae) + reg84)) - wire65) : $unsigned((reg71 >> {(8'hbf)}))));
              reg87 <= {((-{$signed(reg75), wire64[(2'h3):(2'h3)]}) ?
                      {(8'hb5)} : (reg73 ? reg81 : $signed($unsigned(reg78)))),
                  (|{(reg86[(1'h1):(1'h0)] >= (reg74 ? reg84 : (8'ha1))),
                      $signed($signed(reg68))})};
            end
          else
            begin
              reg85 <= $unsigned($signed(reg80[(3'h5):(3'h5)]));
              reg86 <= $unsigned($unsigned((&reg77[(3'h5):(1'h1)])));
              reg87 <= (-($unsigned(reg80) ^ reg87[(2'h2):(1'h1)]));
            end
          reg88 <= reg83[(4'hf):(1'h1)];
          if (wire62[(3'h6):(2'h3)])
            begin
              reg89 <= reg78;
              reg90 <= $signed($signed($signed($signed($signed(reg84)))));
              reg91 <= ((((8'h9c) ^~ {(reg84 << wire62), (reg86 >>> reg69)}) ?
                  (&reg87[(2'h3):(2'h2)]) : reg72[(3'h5):(1'h0)]) || $signed($unsigned($unsigned({(7'h42),
                  reg71}))));
              reg92 <= ($unsigned($unsigned(reg80)) ?
                  ((($signed(reg70) ^ $unsigned(reg91)) ?
                      (reg76 ?
                          $unsigned((7'h41)) : (reg67 ?
                              reg66 : reg90)) : ($unsigned(reg70) ?
                          (reg72 - wire63) : $signed(reg71))) && (~^$signed(((8'ha2) > (8'haa))))) : (((-((8'ha0) ?
                          reg91 : wire61)) ?
                      ((wire64 ?
                          reg72 : (8'hb6)) >>> $unsigned(wire63)) : ({reg81} == reg79[(1'h0):(1'h0)])) >> $unsigned((reg83 < (~reg86)))));
              reg93 <= ({(+$unsigned(reg74[(3'h6):(2'h2)]))} || $unsigned(reg66[(3'h5):(3'h5)]));
            end
          else
            begin
              reg89 <= reg67;
            end
        end
    end
  assign wire94 = reg73;
  always
    @(posedge clk) begin
      reg95 <= (~|$unsigned($signed($unsigned(reg85))));
    end
  module96 #() modinst109 (wire108, clk, wire62, reg76, reg66, reg86);
  assign wire110 = (reg84 >> (^(^~(^~(wire108 + wire61)))));
  module111 #() modinst198 (wire197, clk, reg85, reg91, wire94, reg72);
  always
    @(posedge clk) begin
      if (($unsigned((8'hac)) >= $unsigned(wire65[(3'h6):(1'h1)])))
        begin
          if (reg81[(1'h1):(1'h0)])
            begin
              reg199 <= (($unsigned(reg79[(2'h2):(1'h1)]) ~^ (reg83 && ($signed((8'ha3)) ?
                      {reg93} : reg82[(1'h1):(1'h0)]))) ?
                  ((reg80 > $unsigned($signed(reg83))) ~^ $unsigned($unsigned($signed(reg67)))) : (|$unsigned({{wire65,
                          reg67},
                      $signed(reg73)})));
            end
          else
            begin
              reg199 <= $unsigned(($signed(wire61) ^~ ((+reg87[(2'h3):(1'h0)]) ?
                  {reg95} : ((reg83 < (8'ha1)) ?
                      (!reg86) : (reg81 != reg74)))));
              reg200 <= wire197;
              reg201 <= wire110;
              reg202 <= ((^reg71[(4'h9):(3'h6)]) ~^ $unsigned((reg78 >= ($signed(reg79) ?
                  $unsigned(wire94) : reg88[(4'h8):(3'h4)]))));
              reg203 <= (|($signed((wire108 ?
                  $unsigned(wire108) : (~&reg76))) & {wire94, $signed(reg80)}));
            end
          reg204 <= $signed(reg91);
          reg205 <= (^(~&reg83[(4'hc):(4'hb)]));
        end
      else
        begin
          reg199 <= $signed((($signed((7'h41)) ~^ ((~&(7'h42)) + $signed(reg93))) ?
              (-reg73[(3'h7):(2'h3)]) : (reg86[(4'h9):(3'h4)] >>> ($signed(reg201) << (wire94 >>> (8'h9f))))));
          if ($signed(({wire62[(2'h2):(2'h2)], (~^reg74[(4'he):(1'h1)])} ?
              $signed($unsigned($signed(reg199))) : reg85[(4'he):(4'hb)])))
            begin
              reg200 <= reg205[(3'h5):(2'h3)];
              reg201 <= $unsigned($unsigned(reg80[(3'h7):(3'h7)]));
              reg202 <= wire61;
            end
          else
            begin
              reg200 <= reg92[(1'h0):(1'h0)];
            end
          if (reg74[(4'ha):(4'ha)])
            begin
              reg203 <= $signed($unsigned((|reg201)));
              reg204 <= ($unsigned(reg79[(1'h1):(1'h0)]) ?
                  (~&(^$signed((wire63 ?
                      (7'h43) : reg89)))) : (($signed((reg86 ?
                          reg87 : reg204)) ?
                      (!$unsigned(reg202)) : reg88[(1'h0):(1'h0)]) <= ((wire65[(3'h5):(3'h4)] ?
                      $signed(reg86) : {(8'haa), reg67}) ~^ {$signed(reg74),
                      (wire108 <= reg205)})));
            end
          else
            begin
              reg203 <= (~&$signed((reg70[(2'h3):(1'h1)] ^ reg199[(4'h8):(2'h3)])));
              reg204 <= $unsigned({reg72[(3'h6):(3'h5)]});
              reg205 <= (($unsigned(reg205[(1'h1):(1'h0)]) | $unsigned(((&reg201) || reg80))) ?
                  (~|reg83[(4'hb):(3'h4)]) : (((&(-reg83)) ?
                          $signed($unsigned((8'h9f))) : ($unsigned((8'h9e)) ^ reg199)) ?
                      (reg81[(2'h2):(1'h1)] || {reg70,
                          ((8'had) ?
                              wire61 : reg77)}) : ($signed($signed((8'hbd))) <= (reg82 + (reg201 == (8'hb2))))));
              reg206 <= (8'ha1);
              reg207 <= ($unsigned(($signed($signed((8'hbf))) ?
                  reg201[(4'hd):(4'h8)] : $unsigned((&reg77)))) <<< (((wire64[(2'h3):(2'h3)] ?
                      (reg81 >> reg201) : (reg71 ? reg70 : (8'hb8))) ?
                  wire63[(4'ha):(2'h3)] : wire108) < wire65));
            end
          reg208 <= ($unsigned((((^reg80) ^~ (-reg200)) ?
              (~&$signed(reg206)) : ((reg95 ~^ reg68) ?
                  ((8'hbd) ?
                      reg70 : (8'haf)) : (reg207 <<< wire65)))) + (8'h9d));
          reg209 <= ($unsigned(reg206[(3'h6):(1'h1)]) ?
              reg203[(3'h7):(3'h5)] : $signed((&((reg205 ? reg200 : (7'h42)) ?
                  (reg84 > reg87) : (wire63 ? (8'ha5) : (8'ha5))))));
        end
      if ($signed($unsigned(($signed(wire64[(3'h5):(1'h1)]) < {wire63[(3'h6):(3'h5)],
          $unsigned((7'h40))}))))
        begin
          reg210 <= $unsigned($unsigned({(reg201[(4'ha):(4'ha)] == (+(8'h9d)))}));
        end
      else
        begin
          reg210 <= ((wire197 + $unsigned(((+reg70) ?
                  $unsigned(reg206) : wire64[(2'h2):(1'h1)]))) ?
              $unsigned((-reg73[(3'h6):(3'h6)])) : ({(~&(reg210 >= reg204))} ?
                  $unsigned(reg66[(3'h4):(1'h0)]) : (+$signed($signed(reg77)))));
        end
    end
  assign wire211 = reg75[(1'h1):(1'h1)];
  assign wire212 = (reg199[(2'h3):(1'h1)] <<< {{reg82[(2'h2):(1'h0)]}, reg77});
  assign wire213 = $signed((reg206 >>> {(!(reg92 && (8'ha3))), wire61}));
  assign wire214 = (8'h9f);
endmodule

module module8
#(parameter param44 = ((8'hbb) ? (((8'hb6) ? {((8'ha6) < (8'hb5)), (8'ha8)} : (((8'haa) ? (8'hb5) : (8'hb7)) ? ((8'ha1) ? (8'hb2) : (8'haa)) : (8'hbb))) << (8'hb4)) : ((((~(8'hbc)) || ((8'hab) ? (8'h9d) : (8'hb6))) * (~&(|(8'h9d)))) * (+{((8'had) >>> (8'hb8))}))), 
parameter param45 = (param44 ^~ (param44 ? (((!param44) ^ (!param44)) || (|(param44 + param44))) : param44)))
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire signed [(4'ha):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire41;
  assign y = {wire43,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire41,
                 (1'h0)};
  assign wire13 = wire9;
  assign wire14 = (~&(~wire10));
  assign wire15 = ((+$unsigned(wire10)) >= (wire9[(1'h1):(1'h0)] >> $unsigned($unsigned(wire9[(5'h12):(4'hc)]))));
  assign wire16 = (+wire10[(2'h2):(1'h1)]);
  assign wire17 = ($unsigned(((+(wire13 ? wire13 : wire16)) ?
                      wire11 : $unsigned(wire16[(4'hc):(4'ha)]))) & {($signed((+(8'hbb))) + (+$unsigned(wire16))),
                      (8'hb6)});
  assign wire18 = ((wire13 ^ (^($signed(wire14) != (wire14 <= wire9)))) < wire15[(4'h8):(1'h1)]);
  assign wire19 = (^(8'h9f));
  module20 #() modinst42 (.wire21(wire17), .wire24(wire9), .wire23(wire18), .clk(clk), .y(wire41), .wire25(wire11), .wire22(wire13));
  assign wire43 = $signed((&$signed(wire10[(4'hc):(1'h0)])));
endmodule

module module20
#(parameter param39 = ((|(^(!((7'h43) ? (8'ha2) : (8'ha3))))) < (|((((7'h44) ? (7'h44) : (8'hb9)) ? ((8'h9f) ? (8'hb3) : (7'h43)) : (|(8'haf))) ? (&((8'hba) ? (8'hb8) : (8'ha3))) : (^~((8'ha9) ? (7'h41) : (8'hbf)))))), 
parameter param40 = (^~param39))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire25;
  input wire [(2'h2):(1'h0)] wire24;
  input wire signed [(5'h15):(1'h0)] wire23;
  input wire [(4'he):(1'h0)] wire22;
  input wire [(2'h3):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire26 = wire22;
  assign wire27 = ((wire26[(3'h6):(1'h0)] ?
                      $unsigned($unsigned($signed((8'hab)))) : (wire26 ?
                          (&wire24[(1'h1):(1'h0)]) : (8'hb5))) <<< (-$unsigned($signed($unsigned(wire24)))));
  assign wire28 = ($unsigned($unsigned(wire22)) >= $signed($unsigned((~((8'h9d) <<< wire25)))));
  assign wire29 = {(-$signed(wire26[(2'h2):(1'h0)]))};
  assign wire30 = $unsigned(wire22);
  always
    @(posedge clk) begin
      if ((+(8'h9c)))
        begin
          reg31 <= wire21[(2'h3):(2'h2)];
          reg32 <= $signed(wire30);
          if (wire27[(3'h4):(2'h2)])
            begin
              reg33 <= $unsigned(wire24[(1'h0):(1'h0)]);
              reg34 <= {$unsigned((wire29[(1'h1):(1'h1)] - ($unsigned((8'ha8)) >= (^~reg32))))};
              reg35 <= (!(wire30 ? reg31 : wire24));
              reg36 <= wire27;
              reg37 <= reg34;
            end
          else
            begin
              reg33 <= {wire27};
            end
        end
      else
        begin
          reg31 <= ($signed((^$signed((reg33 >> wire22)))) <<< ($signed(wire26[(4'hb):(4'hb)]) - ($unsigned($unsigned((8'ha9))) ?
              ((wire24 || wire22) > reg32) : wire26[(4'hb):(1'h0)])));
          reg32 <= wire28[(2'h2):(1'h0)];
        end
      reg38 <= wire23;
    end
endmodule

module module111
#(parameter param195 = (|(&(((+(8'hb1)) ? ((8'hb9) + (8'ha4)) : ((8'hb8) ? (8'ha6) : (8'ha1))) == ({(8'hb6)} >> ((8'hb5) ? (8'haf) : (8'haa)))))), 
parameter param196 = {({param195} ? param195 : param195)})
(y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'h376):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire115;
  input wire signed [(4'hb):(1'h0)] wire114;
  input wire [(3'h4):(1'h0)] wire113;
  input wire signed [(4'hc):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire194;
  wire [(5'h12):(1'h0)] wire193;
  wire signed [(4'hf):(1'h0)] wire192;
  wire [(3'h7):(1'h0)] wire191;
  wire signed [(5'h11):(1'h0)] wire190;
  wire signed [(4'h8):(1'h0)] wire180;
  wire [(4'hf):(1'h0)] wire176;
  wire [(5'h12):(1'h0)] wire175;
  wire signed [(5'h15):(1'h0)] wire174;
  wire signed [(5'h11):(1'h0)] wire173;
  wire [(4'he):(1'h0)] wire172;
  wire [(4'h8):(1'h0)] wire171;
  wire [(5'h15):(1'h0)] wire170;
  wire [(5'h12):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire116;
  reg [(5'h13):(1'h0)] reg189 = (1'h0);
  reg [(4'h8):(1'h0)] reg188 = (1'h0);
  reg [(4'hf):(1'h0)] reg187 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg186 = (1'h0);
  reg [(5'h12):(1'h0)] reg185 = (1'h0);
  reg [(3'h5):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg182 = (1'h0);
  reg [(4'hc):(1'h0)] reg181 = (1'h0);
  reg [(5'h10):(1'h0)] reg179 = (1'h0);
  reg [(2'h3):(1'h0)] reg178 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg177 = (1'h0);
  reg [(4'h9):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(4'he):(1'h0)] reg163 = (1'h0);
  reg [(4'hb):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg161 = (1'h0);
  reg [(4'h8):(1'h0)] reg160 = (1'h0);
  reg [(4'he):(1'h0)] reg159 = (1'h0);
  reg signed [(4'he):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg156 = (1'h0);
  reg signed [(4'he):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg [(3'h7):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(3'h5):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg [(5'h12):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  reg [(2'h3):(1'h0)] reg136 = (1'h0);
  reg [(4'hf):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg [(3'h5):(1'h0)] reg130 = (1'h0);
  reg [(5'h11):(1'h0)] reg129 = (1'h0);
  reg [(2'h2):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg118 = (1'h0);
  assign y = {wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire180,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire117,
                 wire116,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg179,
                 reg178,
                 reg177,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
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
                 (1'h0)};
  assign wire116 = (($signed(((wire113 ~^ (8'hb9)) ?
                               wire114 : $unsigned(wire114))) ?
                           wire114[(4'h9):(3'h6)] : (!$unsigned({wire115}))) ?
                       $signed(wire115[(1'h1):(1'h0)]) : $signed({$signed($signed(wire114))}));
  assign wire117 = $unsigned(((wire114 ?
                           $signed($signed(wire113)) : $unsigned($signed(wire113))) ?
                       $signed((wire112[(4'h9):(3'h5)] ?
                           {(8'hb3),
                               (8'haa)} : wire113[(2'h2):(2'h2)])) : ((8'hbd) ?
                           wire112 : wire114[(3'h6):(2'h3)])));
  always
    @(posedge clk) begin
      reg118 <= wire112;
      reg119 <= wire113;
      reg120 <= $signed(wire115);
    end
  always
    @(posedge clk) begin
      reg121 <= $signed(($signed($signed((wire116 ? reg118 : wire114))) ?
          (($signed(wire113) && (wire112 ?
              reg119 : wire117)) <= reg119[(1'h0):(1'h0)]) : ($unsigned((reg119 ?
              wire114 : wire116)) & reg120[(3'h4):(3'h4)])));
      reg122 <= reg119;
      reg123 <= wire113[(1'h0):(1'h0)];
      reg124 <= reg123;
      if (wire114[(4'h8):(3'h7)])
        begin
          reg125 <= $unsigned({(7'h41),
              ((wire114[(4'h8):(1'h0)] ?
                  reg122 : (reg124 || reg118)) << $unsigned((|reg119)))});
          if ((reg119[(2'h3):(1'h1)] & reg120))
            begin
              reg126 <= $unsigned((~|{((reg124 ?
                      reg121 : wire113) != (~|reg121)),
                  reg119}));
            end
          else
            begin
              reg126 <= reg120;
              reg127 <= ((^(^($signed(wire112) ? wire116 : $signed(wire112)))) ?
                  (|$unsigned(reg122)) : $unsigned(reg123));
              reg128 <= ((8'ha7) ?
                  (!({(reg121 ^ (8'hbb))} && ((^reg126) ?
                      reg126[(2'h2):(2'h2)] : (reg121 ?
                          reg121 : reg126)))) : (({(8'hbe)} ^~ {(~^reg120)}) >>> ({wire112,
                      reg124[(5'h12):(4'hf)]} <<< (~|$unsigned(reg120)))));
            end
          reg129 <= (reg122[(3'h7):(2'h2)] ?
              {{((wire113 ~^ wire117) ? $signed(reg121) : $signed(reg124)),
                      ((wire116 & reg121) ? (reg126 < reg127) : wire113)},
                  reg128} : (reg126[(1'h0):(1'h0)] ?
                  (reg123 ?
                      reg121[(2'h2):(1'h0)] : $signed($signed(wire113))) : $signed((8'ha2))));
          if ($signed(($unsigned((^~$unsigned(reg122))) - $signed($unsigned($signed(wire114))))))
            begin
              reg130 <= (~^wire114[(3'h7):(2'h3)]);
              reg131 <= reg119;
              reg132 <= reg122[(5'h13):(4'h8)];
            end
          else
            begin
              reg130 <= {reg129};
              reg131 <= reg129;
              reg132 <= wire116;
            end
        end
      else
        begin
          reg125 <= wire116[(2'h2):(2'h2)];
        end
    end
  always
    @(posedge clk) begin
      if (($signed(($signed($signed(reg119)) << reg122)) ?
          $unsigned((wire115[(4'he):(3'h5)] ^ wire115)) : $signed((wire115[(1'h1):(1'h1)] + (^~reg125[(4'ha):(4'ha)])))))
        begin
          reg133 <= wire113;
          reg134 <= reg127;
          reg135 <= $unsigned(((reg126[(2'h2):(2'h2)] ?
                  ((^~reg133) ?
                      (+reg121) : (reg119 ?
                          (7'h43) : (8'hb4))) : {$signed(wire114)}) ?
              (reg123[(4'ha):(1'h1)] ?
                  {reg125[(4'h8):(1'h0)]} : $unsigned((wire117 ?
                      reg123 : reg131))) : wire116));
        end
      else
        begin
          reg133 <= {$signed(reg121)};
          if ({{$signed(reg121)},
              (~{((reg135 ^ wire114) ? $unsigned(wire113) : {reg129}),
                  ((&wire114) >= reg123)})})
            begin
              reg134 <= wire114;
              reg135 <= $unsigned(($unsigned(reg126[(1'h1):(1'h1)]) | (8'haf)));
              reg136 <= reg120;
            end
          else
            begin
              reg134 <= $unsigned((reg124 >>> (|$signed((8'haa)))));
              reg135 <= ((^(wire116[(2'h2):(1'h0)] ?
                      wire113 : (reg127[(4'hd):(2'h2)] - {reg132}))) ?
                  reg131[(3'h5):(2'h2)] : $signed((($signed(reg127) ?
                      {(8'ha4), (7'h43)} : wire114) ^ reg134[(1'h1):(1'h0)])));
              reg136 <= reg136[(2'h3):(1'h1)];
              reg137 <= $unsigned((~&(|(reg133[(3'h6):(3'h5)] ?
                  wire113[(3'h4):(1'h1)] : (reg136 ? reg130 : reg123)))));
              reg138 <= reg129;
            end
          reg139 <= $unsigned((~$unsigned(((reg124 > reg126) ?
              wire114 : wire116[(3'h5):(3'h4)]))));
          if (reg125)
            begin
              reg140 <= ({(-$signed($unsigned((8'ha5)))),
                      {(wire115 >>> (reg125 ? (8'ha4) : reg121)),
                          ({reg118} << (^~reg128))}} ?
                  $unsigned((|((~&(8'haf)) ?
                      (wire116 > wire116) : (reg119 >= reg137)))) : ({$unsigned({reg128,
                              reg122})} ?
                      (($unsigned(reg139) ?
                              wire114[(1'h1):(1'h1)] : reg120[(3'h4):(1'h1)]) ?
                          reg138[(4'h8):(3'h5)] : reg134[(1'h1):(1'h0)]) : (^~($unsigned((8'hb9)) << $signed(wire115)))));
              reg141 <= (+$unsigned((($unsigned(reg140) ?
                  reg137 : reg137[(4'ha):(1'h1)]) + {reg122})));
              reg142 <= $signed((^~(reg122[(4'he):(4'ha)] ?
                  ($signed(reg139) ?
                      reg124 : reg135[(4'hf):(4'hf)]) : (((8'ha5) ?
                      reg136 : reg133) > $unsigned(reg139)))));
            end
          else
            begin
              reg140 <= reg134[(1'h0):(1'h0)];
              reg141 <= reg120;
              reg142 <= (8'ha5);
            end
        end
      if ($unsigned(reg128[(1'h0):(1'h0)]))
        begin
          reg143 <= $signed((((reg120 ?
                  (wire115 >> reg142) : reg137) >= {(^~reg135)}) ?
              reg133[(3'h4):(3'h4)] : $unsigned((reg129 && reg132))));
        end
      else
        begin
          if ($signed($unsigned((-((reg121 ? reg123 : reg143) & (+reg120))))))
            begin
              reg143 <= $unsigned($unsigned(wire117));
              reg144 <= (+(wire117 ?
                  (($unsigned(reg120) || (^~reg125)) ?
                      reg127 : $signed(reg133)) : $unsigned({(reg143 > reg131)})));
              reg145 <= $unsigned(reg139[(3'h4):(1'h1)]);
              reg146 <= reg130[(1'h0):(1'h0)];
            end
          else
            begin
              reg143 <= $signed((reg144[(1'h0):(1'h0)] ?
                  (reg138 ^ (8'h9e)) : {(reg134[(2'h3):(2'h3)] ?
                          $signed(reg140) : $signed(wire113)),
                      $signed(((8'h9c) | reg122))}));
              reg144 <= {$signed($signed(((reg128 ? reg131 : reg135) ?
                      reg145 : $signed(reg142))))};
              reg145 <= wire113[(1'h1):(1'h1)];
              reg146 <= (wire115 ?
                  $unsigned(reg142[(4'h9):(2'h2)]) : reg146[(5'h12):(4'hf)]);
            end
          reg147 <= ((8'hbe) >= reg139[(4'hd):(4'hd)]);
          reg148 <= reg130;
          if ($unsigned(reg127[(4'hf):(2'h3)]))
            begin
              reg149 <= reg131[(2'h2):(1'h0)];
              reg150 <= wire115;
              reg151 <= ((($signed(reg146[(3'h4):(2'h2)]) ?
                      (~|(reg128 ? reg148 : reg133)) : ((7'h41) ?
                          $signed(reg134) : (wire114 ~^ reg136))) ?
                  (8'haa) : reg135[(3'h6):(1'h0)]) == (+reg144));
            end
          else
            begin
              reg149 <= $signed((^~(~$unsigned(reg147[(3'h7):(1'h0)]))));
            end
          reg152 <= $unsigned((reg120[(3'h4):(1'h1)] && reg139[(4'hd):(1'h1)]));
        end
      if (reg143)
        begin
          reg153 <= {(reg131 ? (+reg150) : $unsigned(reg139[(3'h7):(3'h6)])),
              (reg124[(3'h6):(1'h0)] << $unsigned(($unsigned(reg138) ?
                  (reg120 != reg127) : reg130[(2'h3):(1'h1)])))};
          reg154 <= $signed((((&(^~reg127)) == (reg139[(4'hd):(1'h0)] ?
              ((8'hae) == reg149) : {(8'hba), reg139})) << (~((8'hbf) ?
              (reg135 ? reg151 : reg150) : $unsigned(reg119)))));
        end
      else
        begin
          if (reg121)
            begin
              reg153 <= reg145;
              reg154 <= (~^(^~(&({reg152} | reg148[(1'h0):(1'h0)]))));
              reg155 <= (wire116[(3'h4):(3'h4)] ? reg152 : $unsigned({reg144}));
            end
          else
            begin
              reg153 <= (~reg132);
              reg154 <= (8'h9c);
              reg155 <= (~&(($unsigned(reg131) ?
                      (~&(8'hb3)) : ($unsigned(reg131) ?
                          $unsigned(reg120) : $unsigned((7'h40)))) ?
                  reg127 : {{{reg121, reg136}}, wire113}));
              reg156 <= reg138[(5'h13):(5'h12)];
            end
          if ((-(+{((&(8'ha6)) - $unsigned(reg150))})))
            begin
              reg157 <= $signed({(&(~^{reg156}))});
              reg158 <= $signed(reg120[(2'h3):(2'h2)]);
            end
          else
            begin
              reg157 <= wire115[(4'hc):(3'h5)];
              reg158 <= wire116;
              reg159 <= $signed($signed(reg147[(3'h6):(2'h2)]));
              reg160 <= (reg142 ?
                  {(reg138 ? reg125[(3'h4):(1'h1)] : (~^(^wire117))),
                      $unsigned(reg128[(2'h2):(2'h2)])} : $signed(reg133));
            end
          reg161 <= reg120;
        end
      reg162 <= (8'haa);
      if (reg130)
        begin
          if (reg147)
            begin
              reg163 <= ($unsigned((-(8'hac))) ?
                  $unsigned($signed($signed((reg148 ?
                      reg160 : reg141)))) : (8'hae));
              reg164 <= reg131;
            end
          else
            begin
              reg163 <= $unsigned($unsigned(reg134));
              reg164 <= (-{$unsigned($signed((reg163 <<< reg156))),
                  $signed(wire114[(2'h2):(1'h1)])});
              reg165 <= $signed(reg153);
              reg166 <= {(($unsigned($signed(reg130)) ^ reg121[(1'h1):(1'h0)]) ?
                      ({(reg156 ? reg129 : reg153)} ?
                          ($signed((8'ha0)) ?
                              (~&reg150) : $signed((8'h9e))) : ($signed(reg145) >= reg118[(4'ha):(2'h2)])) : {reg120,
                          $signed(reg165[(2'h2):(1'h0)])})};
            end
          reg167 <= $signed($signed($signed($unsigned((reg126 ?
              reg118 : reg126)))));
          reg168 <= reg126[(1'h0):(1'h0)];
          reg169 <= (!$unsigned((+(~(reg143 ? reg146 : (7'h40))))));
        end
      else
        begin
          if ($unsigned((reg167[(4'hf):(2'h3)] ?
              $signed(reg137[(5'h11):(5'h10)]) : (&reg154[(3'h4):(1'h1)]))))
            begin
              reg163 <= wire113;
              reg164 <= (~&(^~{reg135[(3'h6):(3'h4)],
                  $unsigned((reg146 ? reg132 : wire112))}));
            end
          else
            begin
              reg163 <= ($signed(({reg129[(3'h7):(3'h5)]} ?
                      (|$signed(wire115)) : $unsigned($unsigned(reg135)))) ?
                  (reg120 ?
                      $signed($signed((^reg128))) : (reg146[(1'h1):(1'h0)] ~^ $unsigned(reg128))) : {(~&reg127[(4'he):(2'h3)])});
            end
          reg165 <= $signed(reg155[(4'h8):(3'h7)]);
          if ((8'hb4))
            begin
              reg166 <= wire113[(1'h0):(1'h0)];
              reg167 <= (((~^reg157[(5'h11):(4'hf)]) << $signed(reg169[(4'h9):(1'h1)])) * reg132);
              reg168 <= $signed((reg165 ?
                  wire115[(3'h6):(3'h6)] : {$unsigned($unsigned(reg147)),
                      (8'haa)}));
            end
          else
            begin
              reg166 <= ({($signed(reg131) ?
                          reg126[(1'h1):(1'h1)] : ((reg121 < reg125) << ((7'h42) * reg129)))} ?
                  ($signed($signed((reg168 ?
                      wire112 : reg134))) < reg132) : (!(8'ha0)));
              reg167 <= $unsigned($signed($unsigned(reg136[(2'h2):(2'h2)])));
              reg168 <= reg118[(3'h6):(1'h1)];
            end
        end
    end
  assign wire170 = $signed(reg130);
  assign wire171 = ((^~$unsigned($unsigned(reg141))) ^~ $unsigned((($unsigned(reg121) ?
                       $unsigned(reg144) : (reg163 * reg150)) && reg143)));
  assign wire172 = reg142;
  assign wire173 = reg128;
  assign wire174 = (-((!(8'haf)) ?
                       $signed((+$signed(reg164))) : $signed({$unsigned(reg157),
                           $signed(reg158)})));
  assign wire175 = reg136[(1'h1):(1'h1)];
  assign wire176 = $signed((reg165[(1'h1):(1'h1)] ?
                       $unsigned(reg137[(1'h0):(1'h0)]) : $signed({((8'hb4) << reg160),
                           $signed((8'hb0))})));
  always
    @(posedge clk) begin
      reg177 <= reg133;
      reg178 <= wire117[(2'h2):(2'h2)];
      reg179 <= $signed({reg149});
    end
  assign wire180 = $signed(wire170);
  always
    @(posedge clk) begin
      reg181 <= $unsigned($unsigned(reg162));
      if (((~^reg118[(3'h7):(1'h0)]) ?
          ({$signed((|(8'hbc)))} ?
              $unsigned(((+(8'ha6)) == (~^reg131))) : $signed(reg152)) : wire116))
        begin
          reg182 <= (~|(($unsigned($unsigned((8'h9f))) ?
              $unsigned(reg128) : {(~^wire113),
                  (~|reg178)}) <<< (+$unsigned((^(8'hbd))))));
          reg183 <= (8'hbb);
        end
      else
        begin
          reg182 <= ((((8'h9c) ?
              (~&(reg127 <= reg133)) : wire113[(3'h4):(3'h4)]) >>> {reg183[(3'h6):(3'h4)],
              ($signed(wire115) | reg123[(4'hc):(3'h4)])}) >> $unsigned(($signed($signed(reg183)) ?
              $unsigned(reg134[(1'h0):(1'h0)]) : $unsigned($signed(reg142)))));
          if (((reg128 || $signed(reg163)) || $signed($signed($unsigned((^reg142))))))
            begin
              reg183 <= (^~(^(!(reg164 >= $signed(reg130)))));
              reg184 <= $unsigned((&(reg144 | $signed($unsigned(wire117)))));
              reg185 <= (reg125 > $signed(reg118));
            end
          else
            begin
              reg183 <= $unsigned($unsigned(($unsigned({reg132, wire180}) ?
                  reg169 : wire112[(1'h0):(1'h0)])));
              reg184 <= (8'haf);
              reg185 <= (($unsigned(((reg136 & reg152) <<< (~wire176))) ?
                  {$signed(reg162)} : reg178[(2'h2):(1'h1)]) < (^~(reg139 ?
                  (~^(wire114 ? reg156 : reg167)) : reg147)));
              reg186 <= $unsigned((|$signed($signed((reg134 >> (8'hb8))))));
            end
          reg187 <= $signed((reg150[(2'h2):(2'h2)] > $unsigned((((7'h43) && wire116) * $unsigned(reg150)))));
          reg188 <= $unsigned((((+(reg182 ? reg127 : (8'hbc))) ?
              $signed((+reg184)) : (~wire115[(3'h7):(3'h5)])) ^ wire176));
        end
      reg189 <= $signed(reg166[(2'h3):(1'h1)]);
    end
  assign wire190 = $signed(($unsigned($unsigned(reg119[(3'h4):(2'h3)])) >> (8'hb6)));
  assign wire191 = ((($signed($signed(reg124)) ?
                           $signed((~^reg153)) : $unsigned($unsigned(reg143))) == $unsigned((reg136 <= reg163[(3'h4):(1'h1)]))) ?
                       reg131[(3'h7):(3'h5)] : ($signed((+reg184[(2'h2):(2'h2)])) ?
                           (~&wire114[(3'h4):(3'h4)]) : ($unsigned((reg177 ?
                                   reg132 : reg127)) ?
                               (~^(reg177 ?
                                   reg129 : reg149)) : $signed({wire171}))));
  assign wire192 = $signed(({(^(wire175 >= (8'h9d)))} - $signed($signed(wire115[(3'h5):(3'h4)]))));
  assign wire193 = reg178[(2'h3):(2'h2)];
  assign wire194 = (reg130 > $unsigned(($unsigned({reg182}) && reg123)));
endmodule

module module96
#(parameter param107 = ((((8'hae) + (+((8'ha5) ? (8'hbb) : (8'h9d)))) ? {(~|(|(8'hb5)))} : ((~(8'ha4)) ? ((^~(8'ha3)) | ((8'ha9) ? (8'hb5) : (8'ha8))) : (^~((8'ha6) ? (8'ha5) : (8'ha5))))) ? ((((~(8'hbb)) ? (~|(7'h44)) : (~^(8'ha3))) > {((8'hb2) ? (7'h40) : (8'h9d))}) ? ((&((8'ha7) ? (8'hbe) : (8'hb4))) ? ((^~(8'hb6)) ^ ((7'h40) ? (8'haf) : (8'ha9))) : {(~^(8'ha6)), (^~(7'h41))}) : ((!((8'ha3) ? (8'hbf) : (8'hb3))) ? ((~(8'hb6)) ? ((8'hae) ? (8'had) : (8'hae)) : (^(7'h41))) : ((~|(7'h42)) ? ((8'hb8) ? (8'hb2) : (7'h43)) : (^(8'hb4))))) : (~|(-(((8'hab) | (7'h43)) ? {(8'hb0)} : ((8'h9d) ? (7'h43) : (8'hb8)))))))
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire100;
  input wire signed [(5'h12):(1'h0)] wire99;
  input wire [(2'h2):(1'h0)] wire98;
  input wire signed [(4'ha):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire103;
  wire [(2'h2):(1'h0)] wire102;
  wire [(4'he):(1'h0)] wire101;
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  assign y = {wire104, wire103, wire102, wire101, reg106, reg105, (1'h0)};
  assign wire101 = (wire99[(5'h12):(3'h5)] << ($unsigned($signed((-(8'hb8)))) ^~ wire98));
  assign wire102 = $unsigned((-wire97));
  assign wire103 = (-($unsigned((^~$signed(wire101))) ?
                       $signed({wire102,
                           $signed(wire98)}) : {$signed(wire101[(3'h5):(2'h2)])}));
  assign wire104 = $unsigned(wire99);
  always
    @(posedge clk) begin
      reg105 <= (wire101 ? wire101 : (|(~^$unsigned((wire104 ^~ wire104)))));
      reg106 <= $signed($signed((($signed(wire99) ?
          wire104[(1'h0):(1'h0)] : (^reg105)) * $unsigned($unsigned((8'hae))))));
    end
endmodule
