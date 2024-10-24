module top
#(parameter param124 = ((((((8'hbd) ? (8'hae) : (8'ha8)) ? (+(8'h9d)) : (7'h41)) ? ({(8'hb0)} ? (+(8'hb9)) : ((8'hbc) ? (8'ha2) : (8'ha5))) : {((8'hae) ? (8'hb1) : (8'hae))}) ? ((((8'hbb) | (8'ha9)) ? ((8'hbf) ^ (8'h9d)) : ((8'ha2) ? (8'ha5) : (8'hb4))) ? ((8'hb2) + {(8'h9d), (8'ha2)}) : (((8'hac) | (8'hbc)) || ((7'h42) ? (8'ha8) : (8'hb9)))) : {((8'ha4) ? (^~(8'hb5)) : ((8'ha9) ? (8'hae) : (8'hb2)))}) ? (((((8'hbb) * (8'hb0)) <<< ((8'h9f) ? (8'hb6) : (8'ha6))) ? {(8'ha6), ((8'h9e) == (8'ha8))} : (((8'ha2) - (8'h9c)) > (^(8'hae)))) >> (!(((8'ha3) > (7'h43)) & ((8'hac) ? (8'h9d) : (8'hac))))) : (&{((~^(7'h42)) ? {(8'hb3), (8'had)} : ((8'ha1) + (8'ha4))), ((8'hb6) ? ((7'h40) <<< (8'hba)) : ((8'hb6) >>> (8'hb6)))})), 
parameter param125 = ((-(8'haa)) ^ param124))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire123;
  wire [(3'h6):(1'h0)] wire122;
  wire [(4'hc):(1'h0)] wire121;
  wire signed [(3'h7):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire signed [(5'h14):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire116;
  wire signed [(3'h4):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire114,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = $signed(wire0[(3'h4):(2'h3)]);
  module6 #() modinst115 (.clk(clk), .wire10(wire3), .wire8(wire1), .wire9(wire5), .y(wire114), .wire7(wire4));
  assign wire116 = {$unsigned(((^{wire2}) ?
                           wire1[(4'h8):(2'h3)] : wire3[(1'h1):(1'h0)])),
                       $signed(wire1)};
  assign wire117 = wire5[(2'h2):(1'h0)];
  assign wire118 = (~|$signed($signed(($signed((8'hb4)) & wire114[(2'h2):(1'h1)]))));
  assign wire119 = wire4;
  assign wire120 = (((-wire119[(1'h1):(1'h1)]) ~^ wire117) << wire0[(4'h8):(1'h1)]);
  assign wire121 = wire119[(1'h1):(1'h0)];
  assign wire122 = $signed(((&$unsigned($signed(wire117))) >= $unsigned(wire2[(4'ha):(4'h9)])));
  assign wire123 = (&wire0);
endmodule

module module6
#(parameter param113 = {(|((&(~^(8'ha6))) ? {((8'ha5) ? (8'hbf) : (7'h40))} : (((8'ha3) < (8'hb1)) ? ((8'hb6) ? (7'h44) : (8'hae)) : (|(8'hbf))))), {(^~((-(8'hb0)) ? ((8'hac) ^ (8'hbc)) : ((8'hbb) == (7'h42)))), ({(-(7'h41))} ? (~^((8'h9e) <= (8'hb6))) : (((8'h9e) && (7'h44)) ^~ ((8'hab) | (8'hae))))}})
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(4'hd):(1'h0)] wire104;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire33;
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire104,
                 wire45,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire11,
                 wire12,
                 wire33,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire11 = (~$signed($signed({wire10[(4'hd):(3'h5)]})));
  assign wire12 = $signed((~(~wire11)));
  module13 #() modinst34 (.y(wire33), .wire16(wire12), .wire17(wire7), .wire14(wire8), .wire15(wire11), .wire18(wire9), .clk(clk));
  assign wire35 = wire9;
  assign wire36 = ((wire35[(4'hf):(4'hd)] || (wire9[(3'h4):(1'h1)] ?
                      (^$signed((8'hbd))) : $unsigned((^wire9)))) > $signed(wire35[(3'h6):(2'h3)]));
  assign wire37 = wire36;
  assign wire38 = wire11;
  assign wire39 = wire38;
  assign wire40 = wire9[(4'he):(3'h5)];
  always
    @(posedge clk) begin
      reg41 <= ((^wire39) ~^ (^(wire33 != (^~$unsigned(wire40)))));
      reg42 <= $unsigned((wire33 && $signed((wire10 ^~ $signed((8'hb0))))));
      reg43 <= wire40[(2'h2):(1'h1)];
      reg44 <= wire39;
    end
  assign wire45 = ({$signed(($unsigned(reg43) ?
                          (wire36 ?
                              wire8 : wire12) : wire40))} && (($unsigned((wire9 || wire38)) ?
                          {{wire9, wire40}} : ((^~wire38) ?
                              reg43 : (~wire11))) ?
                      reg42[(3'h5):(1'h0)] : {$unsigned({wire38}),
                          {(^wire33), (wire39 <= wire38)}}));
  module46 #() modinst105 (.wire50(wire40), .wire47(wire10), .y(wire104), .wire48(wire12), .clk(clk), .wire49(wire35));
  always
    @(posedge clk) begin
      reg106 <= wire37;
      reg107 <= wire11[(1'h0):(1'h0)];
      reg108 <= reg44;
    end
  always
    @(posedge clk) begin
      reg109 <= $unsigned(wire12[(4'h8):(3'h6)]);
      reg110 <= (wire104 ?
          ($unsigned($unsigned((7'h40))) - (8'ha1)) : $unsigned({reg43[(2'h2):(1'h1)]}));
    end
  assign wire111 = $signed((&$signed((|(wire7 ^~ (8'hb2))))));
  assign wire112 = (8'ha5);
endmodule

module module46  (y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h1fc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire50;
  input wire signed [(4'ha):(1'h0)] wire49;
  input wire signed [(2'h2):(1'h0)] wire48;
  input wire [(4'h8):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  wire signed [(4'h8):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire99;
  wire [(3'h5):(1'h0)] wire98;
  wire signed [(5'h11):(1'h0)] wire97;
  wire signed [(3'h5):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire51;
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(5'h14):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire51,
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
  assign wire51 = (!(8'had));
  always
    @(posedge clk) begin
      if ({$unsigned((((wire48 ^~ wire48) || $unsigned(wire50)) ?
              (8'hab) : ($unsigned(wire49) ?
                  wire47[(1'h1):(1'h0)] : (wire50 & (8'hae))))),
          wire51[(4'hb):(2'h3)]})
        begin
          reg52 <= $unsigned($signed(({(wire51 ?
                  wire49 : wire51)} >> (8'h9e))));
          reg53 <= ((wire51[(4'ha):(3'h7)] * {((~|(8'hae)) > wire51[(4'hb):(2'h3)]),
                  wire49[(3'h4):(3'h4)]}) ?
              (~((wire47 ?
                  (wire47 < (8'hb9)) : wire49[(2'h3):(2'h2)]) <<< $unsigned(wire50[(2'h3):(2'h3)]))) : wire49[(2'h3):(1'h1)]);
        end
      else
        begin
          reg52 <= $signed($signed({(~&(^~reg52)),
              $unsigned(wire48[(2'h2):(1'h1)])}));
          reg53 <= (~$unsigned($unsigned(({wire49, wire47} ?
              $unsigned((8'h9f)) : reg52[(1'h0):(1'h0)]))));
          reg54 <= wire49[(4'h9):(3'h4)];
        end
      if ((~^((!$signed(wire50[(1'h1):(1'h0)])) && (((reg52 ?
          reg53 : wire48) ^~ (wire47 ? wire48 : reg53)) << ($signed((8'hb9)) ?
          (&wire51) : reg54[(1'h1):(1'h1)])))))
        begin
          reg55 <= reg52[(3'h6):(3'h6)];
          reg56 <= $unsigned(reg53);
          reg57 <= (reg52[(3'h4):(1'h0)] < (~&wire50[(1'h0):(1'h0)]));
        end
      else
        begin
          reg55 <= (+$signed($unsigned($signed(reg53[(4'ha):(3'h5)]))));
          reg56 <= reg56;
          reg57 <= wire49;
          reg58 <= (reg52 ^~ {wire50[(2'h2):(2'h2)],
              (((|reg53) ?
                  wire47[(3'h5):(3'h4)] : (-reg55)) | $unsigned($unsigned((8'hbf))))});
          reg59 <= $signed($unsigned({(8'ha8), reg52[(2'h2):(1'h0)]}));
        end
      reg60 <= {$signed((~&reg57[(3'h4):(3'h4)]))};
      reg61 <= (^reg53[(4'hc):(4'ha)]);
      reg62 <= reg58[(3'h5):(2'h2)];
    end
  assign wire63 = ({($signed(reg61) >>> reg53[(1'h0):(1'h0)]),
                          ($unsigned($unsigned(wire47)) <= reg57[(1'h0):(1'h0)])} ?
                      (((-(|wire50)) ^ $unsigned((^wire50))) ~^ (|$unsigned($unsigned(reg57)))) : $unsigned($signed(((~wire50) ^ (wire49 ?
                          wire51 : (8'ha8))))));
  assign wire64 = {(&reg60[(2'h3):(2'h2)]), $unsigned({wire50})};
  assign wire65 = $signed({(~&$unsigned($signed(reg52)))});
  assign wire66 = $signed(($signed($unsigned((wire49 ?
                      reg61 : (8'ha0)))) ^ {wire48}));
  assign wire67 = (~&(-wire49));
  assign wire68 = $signed($unsigned((&$signed((^~wire64)))));
  assign wire69 = ($signed($signed(wire50)) ?
                      $unsigned($signed(wire67)) : ((^~$unsigned((reg53 ~^ reg60))) ?
                          ($signed(reg54) ?
                              wire47[(3'h5):(2'h3)] : (|wire47[(3'h4):(3'h4)])) : (((8'hba) ?
                                  $signed(wire64) : $signed(reg56)) ?
                              reg62[(4'hc):(1'h0)] : {reg57[(1'h0):(1'h0)],
                                  reg60})));
  assign wire70 = (($unsigned(((reg56 ? wire66 : wire48) ?
                          $unsigned(wire67) : $unsigned(wire66))) ?
                      (wire47 ? (-(~&wire69)) : (^~{reg62, reg54})) : (((reg62 ?
                              wire50 : (8'hbd)) ?
                          $unsigned((8'hbf)) : wire65[(2'h3):(1'h0)]) ^ (~wire49))) >>> ((+((reg57 ?
                          wire64 : wire65) > (reg53 | wire66))) ?
                      (8'hb6) : reg60));
  assign wire71 = ({(~&(-(&wire67))),
                      wire68[(1'h0):(1'h0)]} < (reg54 && reg57[(2'h3):(1'h0)]));
  assign wire72 = wire51[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg73 <= $signed($unsigned((8'ha2)));
      if ((~^wire69))
        begin
          if ((reg54 ? reg62[(4'he):(3'h6)] : reg62[(3'h7):(3'h5)]))
            begin
              reg74 <= (^~(((reg57[(3'h4):(1'h1)] << {wire65,
                  wire47}) ^~ $unsigned((8'ha0))) ~^ reg62));
              reg75 <= ($signed(reg58[(2'h2):(1'h0)]) | {reg62[(4'hf):(3'h6)]});
              reg76 <= ($unsigned($unsigned(($signed(reg57) ?
                      (+(8'haf)) : (wire65 ? wire49 : reg58)))) ?
                  reg53 : {reg56, reg75});
              reg77 <= $unsigned($unsigned({((reg58 ? reg56 : wire65) < reg57),
                  ((&(8'hb6)) ? wire68 : (~|reg57))}));
            end
          else
            begin
              reg74 <= {reg61[(4'hf):(3'h7)],
                  $unsigned((reg55[(4'h9):(2'h3)] + ((wire67 >>> reg52) != {reg62,
                      reg76})))};
            end
          reg78 <= (-($unsigned($signed($signed(wire63))) ?
              reg76[(1'h0):(1'h0)] : wire48));
          reg79 <= (({wire69[(1'h1):(1'h0)], reg60[(3'h5):(3'h5)]} * (&((reg54 ?
                  wire64 : wire72) ?
              (reg75 ?
                  reg73 : wire70) : $signed((8'ha9))))) ^~ reg78[(2'h3):(1'h0)]);
          if (wire65[(2'h3):(1'h1)])
            begin
              reg80 <= (wire70[(1'h0):(1'h0)] >= $unsigned($unsigned((!{wire67}))));
              reg81 <= wire71[(2'h2):(2'h2)];
              reg82 <= ((^~$signed(((+wire69) >> ((8'ha5) >> wire68)))) ~^ reg56[(4'ha):(3'h7)]);
              reg83 <= $unsigned($signed($signed(reg75)));
              reg84 <= ($unsigned(((8'ha7) | ($unsigned(reg82) ?
                  $unsigned(reg56) : $unsigned(wire67)))) == ({$signed((~wire64))} ?
                  ({((8'hb0) ?
                          (8'h9f) : (8'haa))} ~^ (&(reg58 > wire50))) : reg60[(3'h6):(1'h1)]));
            end
          else
            begin
              reg80 <= $unsigned((!wire48));
            end
        end
      else
        begin
          reg74 <= reg57;
        end
      reg85 <= $signed(reg77);
      reg86 <= reg57;
    end
  always
    @(posedge clk) begin
      reg87 <= $signed((reg74 == ($unsigned($unsigned(wire64)) ?
          ({reg77, reg55} ? (-(8'hb2)) : $unsigned(wire66)) : wire66)));
      reg88 <= $signed(wire48);
      reg89 <= {$unsigned((~^$signed($signed((8'hb8)))))};
      reg90 <= $unsigned((reg59 - {{((8'hb0) ? (7'h42) : reg83), (8'ha4)}}));
      if ((reg83[(2'h2):(1'h0)] ? $unsigned(reg90) : reg57[(2'h3):(1'h1)]))
        begin
          reg91 <= (reg81[(4'ha):(3'h7)] ?
              $signed((((&reg80) >> (|reg59)) ?
                  (-(-reg53)) : $unsigned($unsigned(reg89)))) : {(^$signed($unsigned(reg62)))});
          reg92 <= ($unsigned(reg89[(3'h6):(1'h0)]) <<< $signed(reg61));
          reg93 <= (({(8'hbc),
                  $unsigned((wire71 ? wire66 : (8'hb5)))} >= ((((8'hac) ?
                      reg61 : (8'hb5)) >= $signed(wire50)) ?
                  reg74 : reg73)) ?
              $unsigned((reg52 ?
                  reg62 : reg53[(3'h7):(3'h5)])) : $unsigned(reg57));
        end
      else
        begin
          reg91 <= $signed((reg73[(1'h1):(1'h0)] ?
              $unsigned(($signed(wire65) ?
                  ((8'hb5) << reg60) : (!reg87))) : reg92));
          if ((reg73 ~^ ((^~((reg73 ? reg75 : reg56) ?
              (reg86 != wire69) : $signed(reg75))) < ($unsigned((wire47 << reg62)) >= wire70))))
            begin
              reg92 <= ((&$unsigned(((reg52 ? (8'hb2) : reg92) ?
                  (~&reg75) : wire67))) >= reg80);
              reg93 <= $unsigned((8'haa));
              reg94 <= $unsigned((reg89 ?
                  ((8'ha8) ?
                      $signed($unsigned(wire64)) : (-(reg76 ?
                          reg77 : wire49))) : wire70[(1'h1):(1'h1)]));
              reg95 <= ($unsigned(((!(reg93 >> (8'hab))) ^~ wire67[(2'h3):(2'h3)])) * ($signed((~&(reg58 ?
                      wire50 : reg82))) ?
                  ((~^reg85[(4'hc):(3'h5)]) != $signed((~|reg89))) : $signed(((^reg52) ?
                      (reg91 >= (8'hb8)) : ((8'hbb) ? reg74 : reg87)))));
              reg96 <= $unsigned($signed((~^(wire63[(3'h6):(1'h1)] ?
                  (wire71 ? reg77 : reg56) : (reg92 ? wire68 : wire69)))));
            end
          else
            begin
              reg92 <= $unsigned((^$signed((8'hb2))));
              reg93 <= ((-((^~(8'hac)) ?
                      {$signed(wire65)} : ({(8'had)} ?
                          wire64 : ((8'hb9) + wire48)))) ?
                  $signed($unsigned(reg73)) : {((^reg85) >= (reg60[(2'h2):(2'h2)] ?
                          (wire66 < reg93) : $unsigned((8'ha7))))});
              reg94 <= $signed($signed((-{$unsigned(wire68)})));
              reg95 <= $signed(((~reg80[(1'h1):(1'h0)]) ?
                  {wire65} : $signed({(~|reg93), $unsigned(wire64)})));
            end
        end
    end
  assign wire97 = ($signed((({(8'hba)} * (reg74 && reg52)) ?
                      reg87 : reg85[(4'hb):(4'h8)])) * ($unsigned(wire72[(3'h5):(2'h2)]) ?
                      wire51 : (!wire64)));
  assign wire98 = (reg56 ?
                      $signed(($unsigned(reg62) ~^ reg84[(1'h0):(1'h0)])) : (reg79[(1'h1):(1'h0)] ?
                          $unsigned((reg58[(3'h5):(3'h4)] >> reg74[(2'h2):(1'h0)])) : ($signed((-wire63)) >> (|(8'hb2)))));
  assign wire99 = $unsigned($signed((($signed(wire98) ^~ (reg60 ?
                      wire49 : reg85)) != (~|(wire69 ? reg89 : reg87)))));
  assign wire100 = wire68;
  assign wire101 = {$unsigned((wire69[(1'h1):(1'h1)] & reg60)),
                       (~&(($signed(wire70) ?
                               wire51[(3'h6):(2'h3)] : reg77[(3'h7):(3'h5)]) ?
                           reg85 : $unsigned($unsigned(reg55))))};
  assign wire102 = wire67[(1'h0):(1'h0)];
  assign wire103 = reg89;
endmodule

module module13
#(parameter param31 = {(-(+(((8'hb9) * (8'hab)) - ((8'haa) ? (8'hb3) : (8'hb2)))))}, 
parameter param32 = {((8'ha5) >> (~((param31 ? param31 : (8'ha4)) > (param31 == param31))))})
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire [(3'h6):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  input wire signed [(4'he):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire27;
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg19 <= $signed($unsigned(wire15[(2'h3):(1'h1)]));
      reg20 <= $unsigned($signed((-$signed(reg19[(4'hb):(4'h9)]))));
      reg21 <= ((-(^~((^wire18) ?
          (reg19 ?
              wire18 : reg20) : (wire14 << wire16)))) > wire17[(3'h5):(2'h3)]);
      reg22 <= (~|wire18);
      reg23 <= {reg22[(1'h1):(1'h0)]};
    end
  always
    @(posedge clk) begin
      if ($signed(wire17[(1'h1):(1'h1)]))
        begin
          reg24 <= ((((reg23 || $unsigned(wire16)) ?
                      ((!reg20) > ((8'hb1) && reg19)) : $unsigned((wire18 > reg23))) ?
                  $unsigned($signed((reg20 > (8'hb3)))) : $unsigned(wire15[(1'h0):(1'h0)])) ?
              (((8'ha0) ?
                      $unsigned((~&reg19)) : ($signed(wire17) ^ $unsigned((8'hb2)))) ?
                  {{{(8'hb2), wire17}, reg20},
                      wire14} : ((7'h40) - (~&((8'hb2) || wire17)))) : (&wire14));
        end
      else
        begin
          reg24 <= wire18;
        end
      reg25 <= wire14;
      reg26 <= ((wire17 < $unsigned(reg23)) <= wire15);
    end
  assign wire27 = reg26;
  assign wire28 = $unsigned($unsigned({(^~$signed((8'hb3))), (~&reg26)}));
  assign wire29 = (wire17[(1'h0):(1'h0)] ?
                      (^((~$signed(reg22)) ?
                          {{wire27,
                                  reg24}} : reg26)) : ($unsigned(((~^(7'h43)) + {reg23,
                          wire27})) != $unsigned((~^(&reg23)))));
  assign wire30 = reg24;
endmodule
