module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h229):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire308;
  wire [(4'hf):(1'h0)] wire307;
  wire [(4'h9):(1'h0)] wire306;
  wire [(4'hc):(1'h0)] wire305;
  wire [(4'hc):(1'h0)] wire300;
  wire [(2'h2):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire302;
  wire signed [(4'he):(1'h0)] wire303;
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  assign y = {wire308,
                 wire307,
                 wire306,
                 wire305,
                 wire300,
                 wire101,
                 wire100,
                 wire99,
                 wire5,
                 wire6,
                 wire10,
                 wire11,
                 wire72,
                 wire302,
                 wire303,
                 reg9,
                 reg8,
                 reg7,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 (1'h0)};
  assign wire5 = (^~(wire3 ?
                     (~$signed(wire4[(1'h0):(1'h0)])) : {((wire0 ?
                                 wire4 : wire0) ?
                             (wire2 * (8'had)) : wire3)}));
  assign wire6 = $signed((|$unsigned(wire0[(4'hb):(2'h2)])));
  always
    @(posedge clk) begin
      reg7 <= wire3[(4'hb):(2'h3)];
    end
  always
    @(posedge clk) begin
      if (wire2[(3'h6):(1'h0)])
        begin
          reg8 <= wire6;
          reg9 <= $signed((&((~$signed((7'h44))) ?
              $signed($unsigned((8'hb7))) : (^~(+wire1)))));
        end
      else
        begin
          reg8 <= (-$unsigned((+reg7[(4'h9):(1'h1)])));
        end
    end
  assign wire10 = (-(&wire3[(1'h0):(1'h0)]));
  assign wire11 = wire0[(3'h6):(2'h2)];
  module12 #() modinst73 (wire72, clk, wire4, wire3, reg8, wire1);
  always
    @(posedge clk) begin
      reg74 <= {wire10,
          $unsigned($unsigned(($signed(wire10) ?
              {reg9} : wire11[(4'h9):(3'h6)])))};
      if ((($unsigned((wire10[(4'ha):(4'h8)] | ((8'hba) ^~ reg74))) ?
              (wire5[(4'ha):(3'h5)] < (-wire5)) : reg8) ?
          {wire5[(3'h5):(1'h0)], reg9[(4'ha):(4'h9)]} : reg74))
        begin
          reg75 <= {reg74};
          reg76 <= {$unsigned($unsigned(wire2[(3'h6):(2'h3)]))};
          reg77 <= (reg9[(2'h3):(2'h2)] ?
              $signed($signed((~^(reg8 ~^ wire6)))) : $unsigned($unsigned(((|(8'ha9)) ?
                  ((8'hbb) | (8'h9e)) : $unsigned(wire0)))));
          reg78 <= wire3;
          reg79 <= wire4;
        end
      else
        begin
          if (reg9[(3'h7):(2'h3)])
            begin
              reg75 <= ({$unsigned(reg9)} ?
                  (^~wire11[(4'h9):(2'h2)]) : $unsigned(reg76));
            end
          else
            begin
              reg75 <= wire11;
              reg76 <= wire11;
              reg77 <= ((reg78 ?
                  $signed((!$signed(wire72))) : (!(!(^~reg77)))) ^ $unsigned((reg77 ?
                  wire3[(3'h5):(1'h0)] : wire2[(3'h5):(2'h2)])));
              reg78 <= wire0;
              reg79 <= (($signed($unsigned({wire72, wire0})) ?
                  wire1 : wire0) >= $signed($unsigned($unsigned((~^reg74)))));
            end
          reg80 <= $signed(($unsigned($signed($signed(wire5))) * $signed(((~|reg8) ?
              $unsigned(wire72) : ((8'ha0) ? reg74 : (8'ha2))))));
        end
      if ((^~$unsigned({(!(wire11 ~^ reg80)), $signed((^~reg80))})))
        begin
          reg81 <= reg74;
          reg82 <= {$unsigned({(^~(|(7'h42)))})};
          if (($unsigned($signed(wire11[(4'hc):(4'h8)])) ?
              ((~^$unsigned(reg79)) | $signed($signed((~reg9)))) : ((wire3 != ($signed(wire5) >> $signed(reg79))) ?
                  ({wire0} * (^~reg8[(4'h9):(4'h8)])) : $unsigned(reg80[(4'h8):(4'h8)]))))
            begin
              reg83 <= reg74[(3'h5):(1'h1)];
            end
          else
            begin
              reg83 <= $unsigned(reg83[(3'h7):(3'h7)]);
              reg84 <= ((wire11 ?
                  $signed(reg74) : $unsigned(($unsigned(wire11) <= (wire3 >= wire10)))) < $signed({((reg78 | wire4) ?
                      $unsigned((8'hbd)) : (wire11 ? (8'hbe) : wire6))}));
              reg85 <= ((8'ha2) ^ $signed(wire72[(1'h0):(1'h0)]));
              reg86 <= $unsigned(wire4[(2'h2):(2'h2)]);
              reg87 <= $signed((wire2[(3'h6):(1'h1)] ?
                  (^~reg75[(4'hc):(4'h9)]) : ((~&(7'h43)) << reg8[(4'h9):(4'h9)])));
            end
          reg88 <= (&(((~(wire3 > reg80)) ?
                  (~{reg87, reg84}) : (^~$signed(wire4))) ?
              wire3[(1'h0):(1'h0)] : $unsigned({(~|(8'hba))})));
        end
      else
        begin
          reg81 <= ($signed(($unsigned($signed((8'hb9))) ~^ reg77[(3'h4):(2'h3)])) && {(8'ha7)});
          reg82 <= (($signed((~|$signed(reg8))) ? (-reg75) : reg75) ^~ reg8);
          reg83 <= ({{reg74[(1'h0):(1'h0)], reg75}} ?
              reg78[(3'h7):(3'h7)] : {((((8'h9e) ?
                      wire4 : reg8) == wire0) > ((reg76 ~^ reg83) ?
                      $signed(reg79) : $unsigned(wire72))),
                  wire0[(4'hc):(3'h6)]});
          reg84 <= (wire4[(1'h1):(1'h1)] ?
              (8'hb8) : (!(+(-reg7[(3'h7):(1'h1)]))));
        end
      reg89 <= wire1[(1'h1):(1'h1)];
      if ((~^reg83))
        begin
          reg90 <= ((~|$signed($unsigned((reg79 ? reg89 : reg75)))) ?
              (wire5 ?
                  $signed($unsigned($signed(reg84))) : (wire1[(1'h1):(1'h1)] * reg7[(3'h7):(3'h6)])) : {(((reg89 ?
                          reg7 : reg82) ?
                      (wire3 + (8'ha6)) : $unsigned(reg88)) <<< ({wire10,
                          reg76} ?
                      ((8'h9e) ? wire4 : (8'hba)) : (&reg88))),
                  $signed(($unsigned(wire11) * {reg79, reg84}))});
          reg91 <= $unsigned(((~(^((8'hbb) >>> reg78))) - reg79[(5'h10):(3'h5)]));
          reg92 <= $signed(reg86);
          reg93 <= reg77[(3'h7):(2'h2)];
          if ({wire10[(4'hd):(3'h6)],
              ((($unsigned(reg74) && $signed(reg79)) ~^ reg91[(3'h6):(1'h0)]) - {(^wire5[(2'h3):(2'h3)])})})
            begin
              reg94 <= wire72[(2'h3):(2'h3)];
              reg95 <= ((8'haf) << wire0[(4'hb):(3'h4)]);
              reg96 <= ($unsigned((((8'ha8) ?
                          reg80[(3'h5):(1'h1)] : ((8'hb4) ? reg77 : reg9)) ?
                      (^~reg9) : $signed((wire2 >= (8'ha3))))) ?
                  (~(($unsigned(wire4) ?
                      (reg85 ?
                          reg77 : wire5) : (reg78 & reg89)) != reg9)) : ((|wire1[(3'h5):(2'h3)]) + ($unsigned((wire2 <<< (8'hb8))) ^~ reg83)));
              reg97 <= reg80;
              reg98 <= (($unsigned($unsigned((wire4 + wire1))) + $unsigned(reg96[(3'h4):(2'h2)])) - $signed(reg76));
            end
          else
            begin
              reg94 <= wire10;
              reg95 <= reg94;
              reg96 <= $unsigned(reg90[(3'h5):(2'h2)]);
              reg97 <= reg91[(2'h3):(1'h1)];
            end
        end
      else
        begin
          if ((!(reg7[(4'hb):(2'h2)] ?
              (($unsigned(reg92) ?
                      reg87[(2'h2):(1'h1)] : (wire6 ? wire0 : reg77)) ?
                  wire5[(4'hc):(3'h6)] : reg81[(4'ha):(3'h6)]) : {wire10[(4'he):(3'h4)]})))
            begin
              reg90 <= $unsigned($unsigned(reg76[(4'h8):(3'h7)]));
              reg91 <= reg92[(4'hc):(1'h1)];
              reg92 <= $unsigned((-$unsigned((!(-reg91)))));
              reg93 <= ($unsigned((($signed((8'hba)) >> (^(7'h40))) ?
                  ($unsigned(reg74) || (reg83 || (8'hae))) : $signed((8'ha3)))) * $unsigned(($signed($unsigned(wire4)) + reg95[(3'h7):(3'h7)])));
            end
          else
            begin
              reg90 <= (+$unsigned(($unsigned((&wire2)) >>> $unsigned({reg95,
                  reg8}))));
              reg91 <= ((((~^wire6) - $unsigned((^~reg90))) >> (~|$unsigned($unsigned(reg83)))) <<< (~&(8'hbf)));
              reg92 <= ($unsigned(($unsigned(((8'hb2) ?
                  reg88 : wire11)) > $signed(reg84[(4'hc):(4'hc)]))) - reg82);
              reg93 <= reg81;
            end
        end
    end
  assign wire99 = reg79;
  assign wire100 = reg91[(1'h1):(1'h1)];
  assign wire101 = reg80[(3'h6):(2'h2)];
  module102 #() modinst301 (.y(wire300), .wire104(reg74), .wire103(reg84), .clk(clk), .wire105(wire5), .wire106(reg82));
  assign wire302 = (($signed($signed((reg92 & reg98))) ?
                           (^~reg9) : reg96[(2'h3):(1'h0)]) ?
                       (~|reg74[(4'h9):(4'h9)]) : reg83);
  module254 #() modinst304 (wire303, clk, reg9, wire300, reg85, wire5, wire302);
  assign wire305 = $unsigned((~^($signed($unsigned(reg91)) ?
                       $unsigned((8'h9f)) : $unsigned(reg79))));
  assign wire306 = {(+(8'hbe)),
                       ({$signed((reg87 ? reg86 : reg76)),
                               wire2[(3'h4):(1'h0)]} ?
                           (^~(reg85 | $signed(wire10))) : wire300)};
  assign wire307 = (&$unsigned($unsigned(reg95[(3'h7):(3'h6)])));
  assign wire308 = {(&reg81), (8'h9c)};
endmodule

module module102  (y, clk, wire103, wire104, wire105, wire106);
  output wire [(32'h1d8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire103;
  input wire [(4'hf):(1'h0)] wire104;
  input wire signed [(5'h14):(1'h0)] wire105;
  input wire [(5'h12):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire279;
  wire [(4'hf):(1'h0)] wire253;
  wire signed [(4'hd):(1'h0)] wire252;
  wire signed [(2'h2):(1'h0)] wire251;
  wire [(5'h15):(1'h0)] wire215;
  wire signed [(4'hd):(1'h0)] wire167;
  wire signed [(4'hf):(1'h0)] wire166;
  wire signed [(5'h12):(1'h0)] wire107;
  wire [(5'h11):(1'h0)] wire124;
  wire [(4'he):(1'h0)] wire125;
  wire signed [(4'ha):(1'h0)] wire126;
  wire signed [(4'hb):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire164;
  wire signed [(4'hf):(1'h0)] wire249;
  wire [(4'hd):(1'h0)] wire298;
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(4'he):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg130 = (1'h0);
  assign y = {wire279,
                 wire253,
                 wire252,
                 wire251,
                 wire215,
                 wire167,
                 wire166,
                 wire107,
                 wire124,
                 wire125,
                 wire126,
                 wire131,
                 wire164,
                 wire249,
                 wire298,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 (1'h0)};
  assign wire107 = wire104[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (($unsigned(wire104) ?
          wire105[(4'hb):(2'h3)] : $signed(((-{(7'h43)}) ?
              $unsigned((wire107 ? wire106 : wire104)) : $signed(wire103)))))
        begin
          if ((|(-(-wire104))))
            begin
              reg108 <= $signed((^~$signed(((+wire106) ^ (wire104 ?
                  wire103 : wire107)))));
              reg109 <= $signed(($unsigned(((wire103 ? wire104 : reg108) ?
                  $unsigned(reg108) : $signed(wire104))) & wire107[(4'he):(2'h2)]));
              reg110 <= ((wire107 >= $unsigned(wire106[(3'h7):(3'h4)])) ?
                  (wire106[(1'h1):(1'h0)] ?
                      wire104[(3'h6):(2'h3)] : (8'had)) : reg109[(3'h6):(1'h0)]);
            end
          else
            begin
              reg108 <= wire106;
              reg109 <= reg108[(2'h2):(2'h2)];
              reg110 <= $unsigned(wire106[(4'h9):(1'h0)]);
              reg111 <= $signed(reg110[(2'h2):(2'h2)]);
            end
          if (((((!(wire107 ? reg109 : reg111)) && wire103[(4'hc):(1'h1)]) ?
                  wire105[(5'h11):(4'hb)] : $signed(((!(8'hba)) & $unsigned(reg110)))) ?
              reg110 : $signed($unsigned(($unsigned(reg109) ?
                  ((8'had) ? reg108 : reg110) : (-wire104))))))
            begin
              reg112 <= (-($signed({$signed(reg109)}) + reg111[(2'h2):(2'h2)]));
              reg113 <= $signed(wire103[(3'h7):(2'h2)]);
              reg114 <= (({$unsigned((reg113 ? wire104 : (8'ha5))),
                  (+reg111)} << (!$unsigned(reg109))) + reg110);
            end
          else
            begin
              reg112 <= $signed((^~($unsigned($unsigned((8'h9f))) ?
                  $signed(reg112) : ($signed((8'ha5)) ?
                      reg109[(5'h12):(4'h8)] : (reg110 ? reg112 : wire105)))));
              reg113 <= (~|((($signed(wire107) ?
                      wire106[(1'h1):(1'h0)] : {reg111}) << ($unsigned(wire104) ?
                      reg109[(4'ha):(1'h1)] : reg113[(2'h2):(2'h2)])) ?
                  ({(wire105 ? wire105 : wire106)} ?
                      wire107 : $unsigned(reg109[(1'h1):(1'h1)])) : ($signed((8'had)) >>> (7'h40))));
              reg114 <= (reg109[(5'h13):(5'h13)] ?
                  (reg114[(3'h5):(2'h2)] ?
                      $signed(((!reg108) >>> (reg111 ?
                          reg110 : reg112))) : $unsigned((8'hbe))) : reg113[(2'h2):(1'h1)]);
              reg115 <= (~&(reg111[(2'h2):(1'h1)] | (7'h40)));
            end
          if (reg111)
            begin
              reg116 <= (+reg114[(1'h0):(1'h0)]);
              reg117 <= wire103;
            end
          else
            begin
              reg116 <= ((wire105 ^ ($unsigned((+reg113)) ?
                      $unsigned(((8'haa) <<< wire103)) : wire104[(3'h6):(2'h2)])) ?
                  {({reg117[(1'h0):(1'h0)]} ?
                          reg114 : (reg117[(3'h5):(1'h1)] >= reg117[(2'h2):(2'h2)]))} : $signed((~&wire107)));
              reg117 <= $unsigned(($signed($signed(wire105[(2'h3):(2'h3)])) <= reg115[(1'h1):(1'h1)]));
              reg118 <= ({$unsigned(((~reg117) != wire103)),
                  $signed($signed((wire104 ?
                      reg113 : reg110)))} - $signed((-(wire106[(3'h5):(1'h0)] ?
                  reg117[(1'h1):(1'h1)] : (|reg109)))));
            end
          reg119 <= $signed((|$signed((wire107[(4'hd):(4'hb)] * (8'ha3)))));
          reg120 <= $unsigned((wire105 * $unsigned((+$signed(wire107)))));
        end
      else
        begin
          reg108 <= $signed(($signed($unsigned(((8'ha9) & reg115))) > (($signed(reg109) < $signed(reg114)) << $unsigned((reg113 ?
              (7'h42) : reg110)))));
          reg109 <= reg116[(4'hb):(1'h1)];
          reg110 <= (&((($unsigned((8'hb6)) <= $signed(wire103)) ?
                  $signed({reg114}) : ((wire103 ? wire105 : wire105) ?
                      $unsigned(reg109) : $signed(reg115))) ?
              (!reg111[(2'h3):(2'h3)]) : ({$signed(reg120)} ?
                  $signed(reg108) : wire103)));
        end
      if ((8'hbb))
        begin
          reg121 <= reg115;
        end
      else
        begin
          reg121 <= (reg116[(3'h7):(3'h7)] ?
              (reg111[(2'h2):(1'h0)] ?
                  $unsigned((!(^~reg112))) : $unsigned($unsigned($unsigned(wire106)))) : (reg119[(1'h1):(1'h0)] ?
                  reg120 : $signed(wire103[(4'hd):(4'hd)])));
          reg122 <= $unsigned(reg116[(3'h4):(1'h1)]);
        end
      reg123 <= (reg118 <<< $signed((($unsigned(reg113) & (reg114 ~^ wire103)) ~^ $unsigned(reg117[(2'h3):(2'h3)]))));
    end
  assign wire124 = reg109;
  assign wire125 = reg121;
  assign wire126 = reg118[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      reg127 <= $unsigned($signed($signed($unsigned((reg121 ?
          reg114 : wire106)))));
      reg128 <= reg109[(3'h5):(3'h5)];
      reg129 <= (({(8'ha8), wire126} ?
          ($unsigned(reg119) < $unsigned((reg121 < reg122))) : (($signed(reg123) < reg108) ?
              ((8'h9c) ?
                  (~&reg114) : ((8'ha4) >> reg115)) : (reg108[(3'h6):(1'h0)] ?
                  reg108 : (wire106 * reg112)))) | ((reg114[(1'h1):(1'h0)] << ((wire126 * reg122) ?
              (|wire107) : (~|reg117))) ?
          $unsigned(reg128[(3'h5):(1'h1)]) : (((wire105 > wire103) ?
                  ((8'hb5) | (8'hae)) : reg109[(2'h2):(2'h2)]) ?
              reg119[(1'h1):(1'h1)] : $signed($signed(reg119)))));
      reg130 <= (wire124[(3'h4):(1'h1)] ?
          $unsigned($unsigned(reg128[(1'h0):(1'h0)])) : (+(^~$signed((8'ha1)))));
    end
  assign wire131 = {wire103[(3'h4):(2'h3)], $unsigned(wire104[(2'h3):(1'h0)])};
  module132 #() modinst165 (.wire137(wire107), .y(wire164), .wire136(wire106), .wire134(reg108), .wire135(reg114), .wire133(wire124), .clk(clk));
  assign wire166 = ($signed($signed((|wire131))) ?
                       (reg113 ?
                           (8'hb1) : (&(~|$signed(reg127)))) : $signed($unsigned((reg111[(2'h3):(1'h1)] ?
                           (~&reg109) : reg117[(1'h1):(1'h1)]))));
  assign wire167 = wire107;
  module168 #() modinst216 (.y(wire215), .clk(clk), .wire171(wire103), .wire169(wire105), .wire172(wire126), .wire170(reg113));
  module217 #() modinst250 (.clk(clk), .wire221(wire126), .wire222(reg118), .wire219(wire164), .wire218(reg128), .y(wire249), .wire220(wire104));
  assign wire251 = (-(+(($signed((8'hb1)) ?
                       ((8'hb6) ?
                           (7'h43) : reg123) : reg113) >> reg114[(3'h4):(1'h1)])));
  assign wire252 = wire166;
  assign wire253 = (({$signed(wire215)} | (($unsigned(reg108) >= wire107) < {$unsigned(reg109)})) * $unsigned($unsigned(($unsigned(wire252) && wire249[(2'h2):(1'h1)]))));
  module254 #() modinst280 (wire279, clk, reg121, reg110, reg108, reg115, wire131);
  module281 #() modinst299 (wire298, clk, reg127, wire106, wire253, wire124, reg113);
endmodule

module module12
#(parameter param70 = (~^(8'had)), 
parameter param71 = (((~|{(+param70)}) | {param70}) <<< ((+param70) * (!param70))))
(y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire14;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire [(2'h2):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire signed [(3'h6):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire58;
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire58,
                 (1'h0)};
  assign wire17 = wire14[(4'hf):(2'h2)];
  assign wire18 = wire13;
  assign wire19 = $unsigned($unsigned(wire14[(3'h7):(2'h3)]));
  assign wire20 = ((-(8'ha6)) ?
                      {(&((wire16 ? wire16 : wire18) ?
                              (wire13 == wire19) : {wire19})),
                          $signed({(wire13 != wire15)})} : (8'hac));
  assign wire21 = $signed((&wire18[(4'he):(3'h4)]));
  assign wire22 = (!wire15[(3'h5):(3'h4)]);
  module23 #() modinst59 (wire58, clk, wire14, wire20, wire13, wire17, wire18);
  assign wire60 = wire22;
  assign wire61 = wire58[(4'ha):(2'h2)];
  assign wire62 = $signed(wire58);
  assign wire63 = (~^wire62[(1'h0):(1'h0)]);
  assign wire64 = wire21[(2'h2):(2'h2)];
  assign wire65 = $unsigned({((8'hb5) < ($unsigned(wire15) ?
                          (wire60 ? (8'ha7) : (8'haf)) : {wire60}))});
  assign wire66 = ((wire60[(3'h4):(2'h2)] ?
                          (($unsigned(wire63) ?
                              (wire16 & wire61) : wire15) & $signed((!(8'ha9)))) : $unsigned($unsigned(wire15[(2'h2):(2'h2)]))) ?
                      {wire21,
                          wire17[(4'hc):(2'h3)]} : (!(&$signed($signed(wire21)))));
  assign wire67 = ((+$unsigned($unsigned(wire61[(2'h2):(1'h1)]))) ?
                      $unsigned({wire16}) : (($unsigned($signed(wire15)) << $unsigned(wire65)) ?
                          (($signed(wire64) ? wire17 : wire16) ?
                              ($signed(wire14) ?
                                  $unsigned(wire17) : $signed(wire63)) : wire58) : $signed(wire65[(4'ha):(4'h8)])));
  assign wire68 = $unsigned($signed(wire15));
  assign wire69 = wire17[(1'h1):(1'h0)];
endmodule

module module23
#(parameter param57 = ((((((8'hb3) < (8'hbf)) != {(7'h44)}) ? (((8'ha6) ? (8'ha4) : (8'hbe)) ? ((8'hb6) ^~ (8'ha1)) : ((8'hbe) > (8'had))) : (~^((8'h9d) > (8'h9c)))) & (^~(!(|(8'ha8))))) <<< ({(~((8'hbd) > (8'h9c))), ((+(8'hb7)) <= ((8'hac) < (8'hb7)))} ? ((~&((8'hab) ? (8'h9d) : (8'hb0))) ? (8'hba) : {(8'ha5), ((8'ha6) ? (8'hb3) : (8'hb7))}) : (((-(8'hbf)) ? {(8'hb8), (8'hb0)} : {(7'h44), (8'hb0)}) - {((8'ha6) ? (8'ha8) : (8'haf)), ((8'haf) < (7'h43))}))))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire28;
  input wire signed [(3'h7):(1'h0)] wire27;
  input wire signed [(2'h2):(1'h0)] wire26;
  input wire [(5'h10):(1'h0)] wire25;
  input wire signed [(2'h2):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire47,
                 wire46,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg45,
                 reg39,
                 reg38,
                 reg37,
                 reg30,
                 reg29,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg29 <= {wire27[(3'h6):(3'h4)]};
      reg30 <= ((($signed((^wire26)) - (!$unsigned(wire26))) + {(8'hb4),
          wire26}) < $unsigned({((wire24 <= wire25) ?
              (wire28 ? wire24 : reg29) : (|(7'h41))),
          {reg29, (^~wire24)}}));
    end
  assign wire31 = (($unsigned(wire28[(1'h0):(1'h0)]) == reg29) ?
                      (+wire27) : (^($unsigned({(8'hb0)}) || wire28)));
  assign wire32 = wire31;
  assign wire33 = wire25;
  assign wire34 = ({$signed(reg30), wire33} ? wire33[(2'h2):(1'h1)] : wire24);
  assign wire35 = (reg30 && $signed($signed(reg30)));
  assign wire36 = $unsigned($unsigned(wire26));
  always
    @(posedge clk) begin
      reg37 <= wire27[(3'h7):(3'h5)];
      reg38 <= $signed(wire27[(3'h7):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg39 <= ($signed(wire31) || (8'hb1));
    end
  assign wire40 = $unsigned($signed((-$signed((wire25 < reg37)))));
  assign wire41 = ($unsigned($signed((wire28 ? (^~wire24) : wire34))) ?
                      ((wire28[(3'h7):(3'h4)] ~^ $unsigned($signed(wire36))) <<< (|wire33[(4'h9):(3'h5)])) : $unsigned((8'hbf)));
  assign wire42 = (wire40[(2'h3):(2'h3)] ?
                      (($signed(wire40) | reg30[(4'ha):(1'h1)]) ?
                          reg30 : reg37) : $signed((~|wire33[(4'hf):(4'h8)])));
  assign wire43 = $signed({{wire28}, wire31[(3'h4):(2'h2)]});
  assign wire44 = (((($unsigned((8'hbf)) ?
                              ((7'h40) - wire36) : reg38) != (8'hba)) ?
                          (reg39[(1'h0):(1'h0)] ^ ($unsigned(wire35) ?
                              $unsigned(wire35) : $signed(wire34))) : (((wire33 || wire42) ?
                              ((8'hba) ^ wire25) : ((8'ha0) ?
                                  reg38 : wire28)) >= {(wire41 ?
                                  reg30 : wire41)})) ?
                      wire25 : reg29[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg45 <= wire32;
    end
  assign wire46 = ({((8'hb3) ?
                              {$unsigned(reg39),
                                  (wire36 == wire35)} : $unsigned(((7'h44) ?
                                  reg45 : wire40)))} ?
                      $signed(((wire41[(4'hb):(4'h9)] ?
                              wire40[(3'h4):(2'h2)] : $signed((8'hbe))) ?
                          (&(wire31 ? (8'ha9) : reg37)) : ((reg30 ~^ (8'h9e)) ?
                              (wire35 ?
                                  wire42 : wire26) : $signed(wire32)))) : wire42);
  assign wire47 = (8'had);
  always
    @(posedge clk) begin
      reg48 <= (wire44[(4'hd):(4'h9)] - $unsigned(wire27[(2'h3):(1'h1)]));
      reg49 <= reg45[(1'h0):(1'h0)];
      reg50 <= (($unsigned(({reg30,
          (8'hb3)} & reg48)) < (8'ha8)) >= (~^{$signed($signed(wire46)),
          $unsigned((reg39 ? wire44 : wire32))}));
      reg51 <= (reg45 && {wire41[(4'hf):(4'hf)]});
      reg52 <= $signed($signed((~|wire41[(5'h14):(2'h3)])));
    end
  assign wire53 = ($signed((((reg50 ? reg50 : (8'haf)) ?
                              $unsigned(reg52) : (8'ha2)) ?
                          {(reg37 >= wire46),
                              reg45[(2'h2):(1'h1)]} : reg45[(2'h3):(1'h1)])) ?
                      $signed((+(wire24 ?
                          {(8'hbc),
                              (8'ha9)} : (^~reg50)))) : (wire46 <= $unsigned($unsigned(wire31))));
  assign wire54 = $signed(((~^((reg45 > wire47) * (wire47 == reg37))) > (!(wire47[(1'h1):(1'h0)] != wire47[(1'h0):(1'h0)]))));
  assign wire55 = $unsigned(((^($signed(reg52) & $unsigned(wire43))) <= $signed($signed((&wire42)))));
  assign wire56 = $unsigned(reg51);
endmodule

module module281  (y, clk, wire286, wire285, wire284, wire283, wire282);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire286;
  input wire [(5'h12):(1'h0)] wire285;
  input wire [(4'he):(1'h0)] wire284;
  input wire signed [(5'h10):(1'h0)] wire283;
  input wire [(5'h14):(1'h0)] wire282;
  wire [(4'hf):(1'h0)] wire297;
  wire signed [(5'h11):(1'h0)] wire296;
  wire signed [(4'hd):(1'h0)] wire295;
  wire signed [(4'hd):(1'h0)] wire294;
  wire [(3'h6):(1'h0)] wire287;
  reg [(5'h10):(1'h0)] reg293 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg292 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg291 = (1'h0);
  reg [(5'h15):(1'h0)] reg290 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg289 = (1'h0);
  reg [(4'hd):(1'h0)] reg288 = (1'h0);
  assign y = {wire297,
                 wire296,
                 wire295,
                 wire294,
                 wire287,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 (1'h0)};
  assign wire287 = ((wire286 ?
                           wire286[(1'h1):(1'h0)] : {wire286,
                               ($signed(wire285) >> {wire284})}) ?
                       (!$unsigned($signed((wire286 >>> wire283)))) : {(!{$unsigned(wire286)})});
  always
    @(posedge clk) begin
      if ($signed(wire283))
        begin
          reg288 <= $unsigned({($unsigned((7'h42)) | $unsigned((wire284 << wire285)))});
          reg289 <= (&(~|($signed((~wire285)) & {$signed(wire286)})));
        end
      else
        begin
          reg288 <= (($signed((wire285 << reg289[(4'h9):(3'h5)])) ?
              wire287 : ($unsigned($signed(wire285)) ?
                  ((~|(7'h43)) ?
                      (wire284 ?
                          wire282 : wire282) : $unsigned(wire286)) : $signed((reg289 ?
                      wire285 : wire286)))) >> {(8'hbc)});
          if ((((8'had) & (wire286[(1'h0):(1'h0)] ?
                  ((reg288 << (8'ha3)) ?
                      ((8'h9e) ?
                          wire283 : reg289) : $unsigned(wire286)) : $unsigned($signed(wire283)))) ?
              $unsigned($unsigned($unsigned($signed(wire282)))) : $unsigned(($signed(wire286[(2'h2):(1'h1)]) - (^wire287[(2'h2):(1'h0)])))))
            begin
              reg289 <= wire283;
            end
          else
            begin
              reg289 <= reg288[(3'h6):(3'h6)];
              reg290 <= ({($signed((+wire285)) ?
                      $signed(wire282) : ((wire287 == (8'ha0)) >> ((8'hba) ?
                          wire287 : (8'hb7))))} ^~ $signed($unsigned($signed((~wire282)))));
              reg291 <= $unsigned($unsigned(($unsigned({(7'h44)}) ?
                  (reg288[(2'h2):(1'h1)] ^ reg290) : $signed($signed(wire285)))));
            end
          reg292 <= ($unsigned(wire285[(3'h7):(1'h1)]) ?
              ($unsigned(($signed(reg291) ^ (^wire285))) ^ wire287) : (^(~^reg288)));
          reg293 <= (({$unsigned($signed((8'hbb)))} ?
              reg290 : {((~|(8'ha2)) & $unsigned(wire283)),
                  {wire287[(2'h3):(2'h2)]}}) * ({(^$unsigned(wire283)),
              (8'h9f)} <<< ($signed((reg290 ? reg289 : wire284)) <= ((-reg289) ?
              (+(8'h9e)) : (wire285 && wire284)))));
        end
    end
  assign wire294 = ($signed((wire283 ?
                           $signed(wire282[(3'h4):(3'h4)]) : $signed((wire283 > reg290)))) ?
                       ((+((reg293 ?
                           (8'h9e) : (8'ha6)) || reg291[(1'h1):(1'h1)])) ~^ $signed(($unsigned(reg288) == reg289[(3'h4):(2'h3)]))) : reg288);
  assign wire295 = $signed({((reg290 >= $signed(wire287)) ?
                           {(|(7'h44)),
                               wire282[(5'h13):(1'h0)]} : ({reg292} | (^wire287))),
                       ((reg293[(3'h5):(2'h3)] > (|wire284)) ?
                           $unsigned((8'ha7)) : ({wire294, (8'hb4)} ?
                               (wire286 ^ reg291) : (-reg288)))});
  assign wire296 = $signed({wire282, wire294[(4'hc):(4'hb)]});
  assign wire297 = reg290;
endmodule

module module254
#(parameter param277 = ((!(-{((8'haa) * (8'hb8)), ((8'hae) ? (8'hab) : (8'hb9))})) ? (-(~(|((8'hb5) >= (8'ha6))))) : ((!(((8'haa) >> (7'h42)) ? {(8'hbe)} : ((7'h44) < (8'had)))) ? ({((7'h43) ? (8'hbc) : (8'ha5))} ^ (((8'h9e) ? (7'h43) : (8'hb7)) >> {(8'hbf), (8'ha3)})) : (8'hb8))), 
parameter param278 = (((param277 ? ({param277} ? (param277 ? param277 : param277) : param277) : param277) ? param277 : (param277 ? {param277} : ((&param277) ? (param277 != param277) : param277))) != (^(8'ha0))))
(y, clk, wire259, wire258, wire257, wire256, wire255);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire259;
  input wire signed [(4'hc):(1'h0)] wire258;
  input wire [(5'h11):(1'h0)] wire257;
  input wire signed [(5'h14):(1'h0)] wire256;
  input wire signed [(2'h3):(1'h0)] wire255;
  wire [(4'he):(1'h0)] wire276;
  wire signed [(5'h13):(1'h0)] wire275;
  wire signed [(4'hf):(1'h0)] wire274;
  wire signed [(3'h4):(1'h0)] wire273;
  wire signed [(4'h9):(1'h0)] wire272;
  wire [(2'h2):(1'h0)] wire271;
  wire [(4'hd):(1'h0)] wire263;
  wire [(5'h14):(1'h0)] wire262;
  wire [(5'h13):(1'h0)] wire261;
  wire [(3'h4):(1'h0)] wire260;
  reg signed [(3'h6):(1'h0)] reg270 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg269 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg268 = (1'h0);
  reg [(4'hc):(1'h0)] reg267 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg266 = (1'h0);
  reg [(3'h5):(1'h0)] reg265 = (1'h0);
  reg [(4'h9):(1'h0)] reg264 = (1'h0);
  assign y = {wire276,
                 wire275,
                 wire274,
                 wire273,
                 wire272,
                 wire271,
                 wire263,
                 wire262,
                 wire261,
                 wire260,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 (1'h0)};
  assign wire260 = (7'h44);
  assign wire261 = $signed(((wire259 == ((~&wire258) <= wire256[(3'h5):(3'h4)])) ?
                       ({$signed(wire256)} ?
                           {$signed((7'h44))} : (~^wire256)) : (~&wire256[(4'hd):(2'h2)])));
  assign wire262 = $signed($signed(((+$unsigned(wire256)) ?
                       (wire257[(1'h1):(1'h1)] ?
                           {wire258,
                               wire261} : (^wire258)) : ($signed(wire256) != $signed(wire257)))));
  assign wire263 = wire256[(5'h13):(2'h2)];
  always
    @(posedge clk) begin
      reg264 <= wire260;
      if ($signed(wire263[(4'hb):(1'h1)]))
        begin
          reg265 <= (wire256 | (|(~&(wire258 ? $signed(wire261) : (8'hbf)))));
          reg266 <= (|((wire256 ?
                  {wire257[(3'h6):(3'h6)],
                      $unsigned(wire258)} : ((~wire260) - wire255[(1'h0):(1'h0)])) ?
              $unsigned(((8'hb0) ^~ wire259)) : $unsigned((~(wire262 ?
                  (8'h9f) : reg264)))));
          reg267 <= (wire258[(1'h1):(1'h0)] && ((^(!(wire262 ^ wire260))) ?
              wire257 : (~|wire258[(1'h0):(1'h0)])));
          reg268 <= (~|(&reg267[(3'h5):(2'h3)]));
        end
      else
        begin
          if (wire260)
            begin
              reg265 <= $signed($signed(wire258));
              reg266 <= (({(~&{wire255, wire262}), wire260} ?
                      wire263[(2'h2):(1'h1)] : wire258) ?
                  reg267[(3'h7):(1'h0)] : $unsigned(wire263[(3'h6):(3'h6)]));
              reg267 <= ($unsigned($signed((~|(|wire263)))) > ($unsigned(wire255) ?
                  $unsigned((reg265 ?
                      $unsigned((8'hb4)) : wire259[(1'h1):(1'h1)])) : reg265));
              reg268 <= reg264;
            end
          else
            begin
              reg265 <= $unsigned(wire255);
              reg266 <= reg266;
              reg267 <= (wire260[(2'h3):(2'h2)] ?
                  $signed($signed(((^~wire260) - (!(8'ha8))))) : ($unsigned(wire261) == $unsigned($signed((wire255 ?
                      reg266 : wire257)))));
              reg268 <= (reg268[(3'h4):(2'h3)] ?
                  ((8'ha7) ~^ (~|(8'hb5))) : (((|(~^reg264)) ?
                      {wire259,
                          $unsigned(wire255)} : $unsigned(wire257)) > wire258[(4'hb):(4'hb)]));
            end
          reg269 <= ((^~((^~((8'ha7) ? reg268 : reg265)) && (((7'h44) ?
              wire259 : reg267) <<< $signed(wire257)))) > reg267);
        end
      reg270 <= $signed((&$signed(wire256[(2'h3):(1'h0)])));
    end
  assign wire271 = wire260[(1'h1):(1'h1)];
  assign wire272 = (reg268 << ($unsigned((wire260[(2'h2):(1'h0)] ^ wire263)) ?
                       $unsigned($signed(reg265)) : $signed(wire256)));
  assign wire273 = $signed(reg264[(4'h9):(3'h6)]);
  assign wire274 = wire259[(1'h1):(1'h1)];
  assign wire275 = (wire273 << (+(+{$unsigned((8'hab))})));
  assign wire276 = ((wire274 | reg270) ?
                       wire256[(3'h6):(3'h5)] : (!(~|$unsigned((wire273 ?
                           (8'ha8) : wire274)))));
endmodule

module module217  (y, clk, wire222, wire221, wire220, wire219, wire218);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire222;
  input wire [(4'ha):(1'h0)] wire221;
  input wire [(4'hf):(1'h0)] wire220;
  input wire signed [(5'h13):(1'h0)] wire219;
  input wire signed [(5'h14):(1'h0)] wire218;
  wire signed [(5'h15):(1'h0)] wire245;
  wire [(2'h2):(1'h0)] wire244;
  wire [(3'h4):(1'h0)] wire243;
  wire signed [(3'h4):(1'h0)] wire227;
  wire signed [(3'h5):(1'h0)] wire226;
  wire signed [(2'h3):(1'h0)] wire225;
  wire signed [(3'h4):(1'h0)] wire224;
  wire [(3'h6):(1'h0)] wire223;
  reg signed [(4'hd):(1'h0)] reg248 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg247 = (1'h0);
  reg [(4'hf):(1'h0)] reg246 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg242 = (1'h0);
  reg [(4'h8):(1'h0)] reg241 = (1'h0);
  reg [(4'ha):(1'h0)] reg240 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg239 = (1'h0);
  reg [(5'h11):(1'h0)] reg238 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg237 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg236 = (1'h0);
  reg [(4'he):(1'h0)] reg235 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg234 = (1'h0);
  reg [(5'h15):(1'h0)] reg233 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg232 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg231 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg230 = (1'h0);
  reg [(3'h6):(1'h0)] reg229 = (1'h0);
  reg [(5'h12):(1'h0)] reg228 = (1'h0);
  assign y = {wire245,
                 wire244,
                 wire243,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 reg248,
                 reg247,
                 reg246,
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
                 (1'h0)};
  assign wire223 = (~|($signed({((8'h9d) ? wire220 : wire222)}) ?
                       (8'hab) : (((^wire218) ?
                           (wire221 ?
                               wire221 : wire221) : wire218) >= (wire222[(4'h9):(3'h4)] <<< $unsigned(wire221)))));
  assign wire224 = {$unsigned((wire222[(4'hb):(3'h4)] ?
                           (~&(wire222 >= wire222)) : $signed($unsigned(wire221)))),
                       ($unsigned((((8'hb2) ^~ wire218) ?
                           wire221[(2'h2):(1'h1)] : (8'hac))) != (|(~(8'hbc))))};
  assign wire225 = wire224;
  assign wire226 = ((&$unsigned({$unsigned(wire222)})) ?
                       {wire218[(4'h9):(3'h5)]} : ({$signed({wire220}),
                               $signed($unsigned((8'h9d)))} ?
                           wire224 : wire222[(4'h9):(4'h8)]));
  assign wire227 = ($unsigned(wire225) ?
                       (wire219[(5'h10):(3'h4)] != {($signed(wire221) >> (wire226 >> wire221)),
                           ({wire226, wire221} ?
                               wire222 : (-wire225))}) : (8'ha1));
  always
    @(posedge clk) begin
      reg228 <= ($unsigned(((wire219 | wire221) <<< ($unsigned(wire218) ?
          (wire225 & wire221) : wire219[(4'he):(3'h7)]))) + $signed((^~wire220)));
      reg229 <= $signed((|$signed((8'ha3))));
      reg230 <= ($signed(wire223[(1'h1):(1'h0)]) ~^ ({$unsigned((wire222 ?
              wire224 : wire221))} | (((wire225 && wire227) == wire221[(2'h2):(1'h1)]) ?
          ((|wire219) ?
              wire227 : (+wire226)) : (reg228[(1'h0):(1'h0)] < (wire219 ?
              wire220 : (7'h44))))));
      if (($unsigned({$signed((|wire227)),
          ((wire218 ? wire222 : wire225) <= (-(8'hb5)))}) ^~ (wire221 ?
          (wire220[(4'he):(2'h3)] == ((wire224 ?
              reg229 : wire218) == wire225)) : wire224[(1'h1):(1'h1)])))
        begin
          if ($unsigned($unsigned(($unsigned((wire220 ?
              (8'haf) : wire225)) < wire222[(2'h3):(2'h3)]))))
            begin
              reg231 <= wire220[(3'h4):(3'h4)];
              reg232 <= (^($unsigned((~&(~&reg231))) ?
                  (~((wire226 < wire220) ?
                      $unsigned(wire221) : wire221)) : $signed((-(|wire221)))));
              reg233 <= wire219;
              reg234 <= wire218[(5'h11):(1'h0)];
              reg235 <= $signed((wire227[(2'h3):(1'h0)] ?
                  $signed(wire224) : $signed((wire221 & reg230[(4'ha):(1'h0)]))));
            end
          else
            begin
              reg231 <= (reg230[(2'h3):(1'h1)] ?
                  ($signed(reg230) ~^ $signed($unsigned($unsigned(wire225)))) : wire224);
              reg232 <= ((((wire225[(1'h1):(1'h0)] && $unsigned(wire225)) >>> {$unsigned(wire227),
                      reg229[(3'h5):(3'h4)]}) ?
                  ({(^(8'ha7))} * $signed((wire226 ?
                      wire223 : (7'h42)))) : $unsigned((&wire219[(4'h8):(3'h4)]))) * $signed(wire223[(3'h6):(2'h3)]));
              reg233 <= ((~&$signed(((~|wire218) & wire225[(1'h1):(1'h1)]))) ?
                  ($unsigned((reg231 <= (~^wire218))) ?
                      ((reg233[(3'h4):(2'h2)] ?
                              $signed(reg233) : (reg234 ? reg234 : reg228)) ?
                          reg228[(5'h10):(2'h2)] : (~reg233[(2'h2):(1'h1)])) : wire219) : $signed($signed(reg233[(5'h10):(4'hf)])));
            end
        end
      else
        begin
          if (wire224[(2'h2):(2'h2)])
            begin
              reg231 <= (reg232[(3'h7):(2'h3)] || reg233[(5'h10):(3'h6)]);
              reg232 <= (((8'hbb) ?
                  (~^wire220) : (wire219[(1'h1):(1'h0)] ?
                      (((7'h43) ?
                          reg233 : (8'haa)) && {(8'ha2)}) : {wire226[(2'h3):(1'h1)]})) >>> {(($unsigned((8'hb5)) ?
                      (8'hbe) : ((8'ha1) != wire220)) >= $signed(reg232)),
                  ((&(wire226 == reg231)) ?
                      ($unsigned(wire221) ?
                          (wire221 ? (8'hb7) : reg232) : (wire220 ?
                              wire224 : (8'ha1))) : reg235)});
              reg233 <= $signed(wire221);
              reg234 <= wire219;
              reg235 <= ($unsigned((reg228[(4'h9):(3'h4)] ?
                  ($signed(wire224) - $unsigned(wire221)) : $signed($unsigned(reg231)))) >>> wire221);
            end
          else
            begin
              reg231 <= wire222[(1'h1):(1'h0)];
              reg232 <= $signed($unsigned(wire221));
            end
          reg236 <= $signed(reg228);
          reg237 <= reg233[(2'h2):(2'h2)];
          reg238 <= wire219;
        end
      if ((((reg228 >> wire226[(3'h4):(1'h1)]) ~^ ((((8'ha5) <<< (8'hba)) > wire227[(1'h1):(1'h0)]) ?
          (((8'hb2) ?
              (8'hb9) : reg234) ~^ $signed(reg230)) : (!reg231))) ^~ (wire221[(3'h4):(2'h2)] | wire218)))
        begin
          if (({$unsigned(((reg233 ? reg236 : (8'hb5)) ?
                  $unsigned(reg236) : $unsigned(wire225)))} ^~ wire218))
            begin
              reg239 <= wire219;
              reg240 <= (($signed($unsigned(reg230)) <<< $signed((+wire219))) ?
                  (~&wire220) : reg237[(2'h3):(1'h1)]);
              reg241 <= (wire225[(1'h1):(1'h0)] ?
                  $signed(reg235) : ($unsigned(reg230[(4'ha):(1'h0)]) ?
                      {$signed((wire218 & reg238))} : $unsigned($unsigned((8'hbb)))));
            end
          else
            begin
              reg239 <= reg228[(4'hc):(2'h2)];
            end
          reg242 <= (-(^~wire219[(2'h3):(1'h1)]));
        end
      else
        begin
          if ((~|wire218))
            begin
              reg239 <= ((+(~&((8'hb3) < $unsigned(wire226)))) * {reg234[(4'h8):(4'h8)]});
              reg240 <= reg236[(4'hb):(1'h1)];
              reg241 <= ($unsigned($unsigned(reg241)) + (((!{(8'hb2)}) >= reg233[(3'h6):(1'h1)]) ?
                  wire221 : (8'h9e)));
              reg242 <= {(-$signed($signed((reg242 > (8'ha2)))))};
            end
          else
            begin
              reg239 <= ($unsigned(((~(reg242 != reg235)) ?
                      reg237[(2'h3):(2'h2)] : ((^wire221) ?
                          (wire220 ? wire226 : reg241) : (~reg232)))) ?
                  ($unsigned($signed(reg229[(3'h4):(1'h0)])) >>> $signed((reg235 ^~ $unsigned(wire219)))) : (~^(-reg234)));
            end
        end
    end
  assign wire243 = {(~reg236), (|{reg242})};
  assign wire244 = reg228[(4'hf):(3'h5)];
  assign wire245 = (~&wire220);
  always
    @(posedge clk) begin
      reg246 <= wire245[(5'h13):(5'h13)];
      reg247 <= (((((wire226 ?
                  reg231 : wire243) ^ $signed(wire221)) ^~ reg234[(4'hc):(3'h5)]) ?
              (wire221 > $unsigned((~reg232))) : $unsigned((((8'hab) ?
                      wire218 : (7'h42)) ?
                  $unsigned(wire245) : (wire218 ? wire243 : reg228)))) ?
          (wire220 - (+(reg232 ?
              wire223[(3'h5):(3'h4)] : {wire220,
                  reg237}))) : reg241[(4'h8):(3'h5)]);
      reg248 <= $unsigned({$signed((wire221 ?
              wire225 : (reg239 ? wire220 : wire221))),
          reg240});
    end
endmodule

module module168
#(parameter param213 = (+{(~^(((8'hbf) <= (7'h40)) ? {(8'ha5), (8'hb3)} : ((8'hb8) ^~ (8'ha2)))), (^(((7'h44) ? (7'h40) : (8'ha4)) ? (8'haf) : (~|(8'ha4))))}), 
parameter param214 = (param213 ^ param213))
(y, clk, wire172, wire171, wire170, wire169);
  output wire [(32'h1ae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire172;
  input wire [(4'hd):(1'h0)] wire171;
  input wire signed [(4'hc):(1'h0)] wire170;
  input wire signed [(4'ha):(1'h0)] wire169;
  wire [(5'h10):(1'h0)] wire212;
  wire signed [(4'hf):(1'h0)] wire211;
  wire signed [(4'hc):(1'h0)] wire200;
  wire signed [(3'h6):(1'h0)] wire199;
  wire [(4'ha):(1'h0)] wire198;
  wire [(4'ha):(1'h0)] wire197;
  wire signed [(2'h2):(1'h0)] wire196;
  wire signed [(4'h8):(1'h0)] wire195;
  wire signed [(5'h13):(1'h0)] wire194;
  wire [(5'h15):(1'h0)] wire183;
  wire [(4'he):(1'h0)] wire182;
  wire [(3'h5):(1'h0)] wire181;
  wire signed [(3'h5):(1'h0)] wire180;
  wire signed [(4'hb):(1'h0)] wire179;
  wire signed [(3'h6):(1'h0)] wire178;
  wire signed [(4'hd):(1'h0)] wire177;
  wire signed [(5'h12):(1'h0)] wire176;
  wire [(4'ha):(1'h0)] wire175;
  wire signed [(5'h10):(1'h0)] wire174;
  wire signed [(2'h2):(1'h0)] wire173;
  reg [(5'h12):(1'h0)] reg210 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg209 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg208 = (1'h0);
  reg [(3'h7):(1'h0)] reg207 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg206 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg204 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg203 = (1'h0);
  reg [(5'h14):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg201 = (1'h0);
  reg [(3'h5):(1'h0)] reg193 = (1'h0);
  reg [(4'ha):(1'h0)] reg192 = (1'h0);
  reg [(4'hc):(1'h0)] reg191 = (1'h0);
  reg [(4'h9):(1'h0)] reg190 = (1'h0);
  reg [(4'hb):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg188 = (1'h0);
  reg [(3'h6):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg185 = (1'h0);
  reg [(4'he):(1'h0)] reg184 = (1'h0);
  assign y = {wire212,
                 wire211,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
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
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 (1'h0)};
  assign wire173 = (&wire169[(4'h8):(2'h2)]);
  assign wire174 = wire171;
  assign wire175 = $unsigned(({((wire170 ? wire173 : wire173) | (~&wire173))} ?
                       (wire169 ~^ ($unsigned(wire174) || ((8'hab) ?
                           (8'hb1) : (8'ha8)))) : $signed(wire173)));
  assign wire176 = ((wire170[(1'h1):(1'h0)] >= ($unsigned((8'haa)) ?
                       (8'ha2) : (~wire170[(2'h2):(2'h2)]))) & wire170[(1'h0):(1'h0)]);
  assign wire177 = wire175[(3'h5):(2'h3)];
  assign wire178 = wire177[(4'h8):(3'h6)];
  assign wire179 = wire174;
  assign wire180 = {(&(~^wire171))};
  assign wire181 = wire180[(3'h4):(2'h2)];
  assign wire182 = (~wire170);
  assign wire183 = {(+$signed($unsigned({wire176, wire182}))),
                       {(-wire181), wire171}};
  always
    @(posedge clk) begin
      reg184 <= $signed((^~$unsigned(wire183)));
      reg185 <= {$unsigned(wire170)};
      if (wire172[(1'h0):(1'h0)])
        begin
          if ($signed(wire177[(4'hc):(4'h9)]))
            begin
              reg186 <= wire172;
              reg187 <= reg184[(3'h4):(3'h4)];
            end
          else
            begin
              reg186 <= ((+$unsigned(reg184)) >> $signed((8'hbb)));
              reg187 <= $unsigned(reg185[(2'h3):(1'h0)]);
              reg188 <= $signed(wire172);
              reg189 <= $unsigned($unsigned($signed(((wire179 && (8'hb1)) <= (wire183 != wire174)))));
              reg190 <= (!$unsigned(wire174));
            end
          reg191 <= (|((~^reg187) ?
              ($unsigned((reg187 ?
                  wire170 : wire182)) * $signed(wire170[(2'h2):(2'h2)])) : $unsigned(wire172)));
          reg192 <= wire178[(3'h5):(3'h5)];
        end
      else
        begin
          reg186 <= reg188[(3'h4):(1'h0)];
          reg187 <= reg192;
        end
      reg193 <= $signed($unsigned($unsigned($unsigned((wire179 ?
          (8'hb6) : reg192)))));
    end
  assign wire194 = (-($signed($unsigned((wire182 > wire177))) >> (+$signed($unsigned((8'hae))))));
  assign wire195 = $signed((~&($unsigned(reg184) ~^ ({wire176, reg192} ?
                       wire173 : wire194))));
  assign wire196 = (($unsigned(reg188) ?
                       $unsigned((wire182[(4'he):(3'h7)] ?
                           {(8'ha7),
                               wire176} : {wire176})) : ({reg184} * (!(~&(8'ha0))))) | (&(^~(wire169[(4'h8):(1'h1)] ?
                       (wire173 ? wire194 : (8'hac)) : $unsigned(wire195)))));
  assign wire197 = {{(~|reg186[(3'h7):(3'h6)]),
                           ($unsigned($unsigned(reg189)) ?
                               $unsigned(wire182[(4'hc):(3'h5)]) : wire194)},
                       ((wire196[(1'h1):(1'h1)] ?
                           {wire196,
                               reg186[(1'h1):(1'h1)]} : wire194) && $signed($signed((|wire171))))};
  assign wire198 = (((wire180 | $unsigned({wire171, wire197})) ?
                       (reg188 ?
                           (&wire170[(3'h5):(3'h4)]) : (8'hb0)) : $unsigned($unsigned((reg190 ?
                           wire194 : wire183)))) > $unsigned((($unsigned(reg188) ~^ ((7'h42) ?
                       reg186 : wire179)) >>> (reg184[(4'hd):(3'h5)] ?
                       (wire181 ? reg190 : reg189) : $signed(wire170)))));
  assign wire199 = (+(reg190 == (^~wire196)));
  assign wire200 = (8'hbf);
  always
    @(posedge clk) begin
      reg201 <= {wire200, reg193};
      if ((|$unsigned(({(!wire172),
          wire198[(3'h4):(1'h0)]} <= $unsigned(reg187[(3'h4):(2'h3)])))))
        begin
          if (($unsigned((-($signed(wire179) != $unsigned(wire173)))) ?
              (^~{$signed(wire180[(1'h1):(1'h1)])}) : $signed((wire199[(1'h1):(1'h0)] ?
                  reg186 : {((8'ha7) ? (8'ha7) : wire183)}))))
            begin
              reg202 <= (wire181[(2'h3):(1'h1)] ?
                  reg187[(2'h2):(2'h2)] : ($unsigned((!(wire172 >> wire172))) ?
                      $unsigned($signed((wire172 ?
                          wire197 : reg190))) : reg190));
              reg203 <= $unsigned((~^{(~|(reg191 ? wire197 : wire200)),
                  (8'hbe)}));
              reg204 <= wire196[(2'h2):(2'h2)];
              reg205 <= {{((wire175 <= wire181) & wire194[(4'h8):(1'h0)])},
                  $unsigned({reg201,
                      ($unsigned(wire175) ?
                          (~reg204) : ((8'h9c) ? wire199 : wire182))})};
            end
          else
            begin
              reg202 <= ($unsigned((|((wire181 - wire181) ?
                      wire170[(2'h3):(1'h1)] : ((8'hbb) > wire195)))) ?
                  ($unsigned(wire181[(1'h0):(1'h0)]) ?
                      (reg185 ?
                          (-(reg190 || wire194)) : $unsigned((wire181 ?
                              (8'hbd) : reg189))) : (((reg188 ?
                                  wire169 : reg184) ?
                              $signed(wire170) : (~&wire170)) ?
                          (wire194 ?
                              (&(8'haa)) : ((8'ha3) ^ wire180)) : ({wire197,
                              wire172} & $unsigned(reg203)))) : $signed(({(reg185 ?
                          reg203 : reg203)} * $unsigned((~&wire170)))));
              reg203 <= $signed((!(((reg190 ? wire198 : reg191) ?
                  {(8'ha3), wire197} : (reg205 ?
                      wire178 : wire199)) & wire172)));
            end
          if ((|(^($signed(wire200) << ((wire180 & wire182) ?
              $unsigned(reg201) : (wire181 == (8'hb5)))))))
            begin
              reg206 <= reg205;
              reg207 <= reg189;
              reg208 <= (((!(wire181 ~^ $unsigned(wire173))) & $signed(wire200)) < wire179);
              reg209 <= ((({(reg208 ^~ reg191)} * {((8'hb7) ^~ wire170)}) ?
                  $unsigned({reg190}) : {wire198,
                      (wire171[(3'h5):(2'h3)] ?
                          (reg201 - (8'hbc)) : (^reg185))}) <<< (($unsigned(reg204[(2'h2):(1'h1)]) | ((~wire179) <= $signed(reg208))) ?
                  wire176 : $signed({reg202[(1'h1):(1'h1)]})));
            end
          else
            begin
              reg206 <= $signed((~&$signed((~$unsigned(wire195)))));
            end
        end
      else
        begin
          if ($unsigned(wire170))
            begin
              reg202 <= ($unsigned($signed((|(wire173 ?
                  reg204 : wire179)))) ^ (|$signed((wire183 ?
                  (wire176 ? reg192 : wire170) : wire172[(3'h5):(3'h5)]))));
              reg203 <= ($unsigned($signed({reg201[(1'h0):(1'h0)]})) * wire200);
              reg204 <= ({{reg190}} ^ reg187);
              reg205 <= (!reg203);
              reg206 <= $signed(($unsigned(reg191[(2'h3):(2'h2)]) * ($signed(wire179) < $signed(wire180))));
            end
          else
            begin
              reg202 <= $unsigned($unsigned(reg190[(1'h0):(1'h0)]));
            end
          reg207 <= ($unsigned(wire196) ?
              ($signed($signed({reg207})) > (8'hb8)) : (~&$unsigned({(wire183 ?
                      wire172 : wire171),
                  (wire171 ? reg184 : wire183)})));
          reg208 <= ((reg192 ?
                  reg192[(3'h4):(2'h2)] : $unsigned(reg185[(3'h5):(1'h0)])) ?
              reg205 : reg188);
          reg209 <= reg189[(4'h8):(1'h0)];
          reg210 <= ({(|(~{wire182}))} ?
              $unsigned(((7'h44) ~^ (8'ha2))) : (~&(~|wire179)));
        end
    end
  assign wire211 = reg205;
  assign wire212 = $signed(reg189[(2'h2):(1'h0)]);
endmodule

module module132
#(parameter param163 = (-((^~(((8'hbf) >= (8'hbc)) ? ((8'hbe) < (8'hae)) : (!(8'hac)))) ? ((((8'h9c) ? (8'hb4) : (8'haa)) | ((8'hb8) ? (7'h44) : (8'ha5))) ? ({(8'ha8)} ^ ((8'hb8) <= (8'h9f))) : {((8'haf) ? (8'h9c) : (8'hbf))}) : (((7'h41) ? {(8'hb1), (8'h9f)} : ((8'hbb) >> (8'hb7))) >>> (((8'hb7) >= (8'hbd)) * (^(8'ha2)))))))
(y, clk, wire137, wire136, wire135, wire134, wire133);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire137;
  input wire [(3'h7):(1'h0)] wire136;
  input wire [(4'he):(1'h0)] wire135;
  input wire signed [(4'ha):(1'h0)] wire134;
  input wire signed [(4'hd):(1'h0)] wire133;
  wire signed [(5'h14):(1'h0)] wire162;
  wire [(2'h2):(1'h0)] wire161;
  wire [(4'hb):(1'h0)] wire157;
  wire [(3'h6):(1'h0)] wire156;
  wire signed [(4'he):(1'h0)] wire155;
  wire [(3'h6):(1'h0)] wire152;
  wire signed [(4'hd):(1'h0)] wire151;
  wire [(3'h4):(1'h0)] wire150;
  wire signed [(4'h9):(1'h0)] wire149;
  wire signed [(5'h10):(1'h0)] wire147;
  wire [(3'h7):(1'h0)] wire146;
  wire [(5'h10):(1'h0)] wire145;
  wire signed [(2'h2):(1'h0)] wire139;
  wire [(4'hd):(1'h0)] wire138;
  reg signed [(2'h3):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  reg [(3'h6):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg153 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire157,
                 wire156,
                 wire155,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire147,
                 wire146,
                 wire145,
                 wire139,
                 wire138,
                 reg160,
                 reg159,
                 reg158,
                 reg154,
                 reg153,
                 reg148,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 (1'h0)};
  assign wire138 = (&((~|((wire137 != wire137) << (wire134 ?
                           wire137 : wire136))) ?
                       wire137[(4'hf):(1'h0)] : (((wire137 | wire137) <= wire134[(3'h7):(1'h1)]) >>> (&(wire133 ?
                           wire135 : wire136)))));
  assign wire139 = $unsigned((8'h9e));
  always
    @(posedge clk) begin
      reg140 <= wire138[(3'h6):(2'h2)];
      reg141 <= wire134;
      reg142 <= $unsigned({{(&(wire137 ? wire136 : wire139)), wire138}});
      reg143 <= (+wire136[(2'h2):(1'h0)]);
      reg144 <= wire138;
    end
  assign wire145 = wire134;
  assign wire146 = $unsigned((reg143 ?
                       ({wire137[(4'ha):(4'h9)]} > $signed({reg140})) : ($signed($signed((8'hbd))) || $signed(reg143))));
  assign wire147 = wire145;
  always
    @(posedge clk) begin
      reg148 <= (~wire137[(4'hb):(4'h9)]);
    end
  assign wire149 = (^(!(-((wire146 < reg148) == (reg144 ? wire138 : reg142)))));
  assign wire150 = $signed({(&wire135[(4'hb):(3'h4)]),
                       $unsigned(wire149[(4'h8):(1'h1)])});
  assign wire151 = $signed(((^~{(~reg144), ((8'hb5) ? wire133 : wire147)}) ?
                       $signed(($unsigned(reg148) ?
                           $unsigned(wire146) : $unsigned(wire147))) : $unsigned((+(wire146 ?
                           (8'hac) : wire135)))));
  assign wire152 = (reg144 && ((((~|(8'ha0)) == $signed(wire139)) ?
                       {(wire138 - (8'ha1)),
                           $signed(reg142)} : $signed((reg148 ?
                           reg141 : reg141))) >> (~({(8'h9d)} >= wire137))));
  always
    @(posedge clk) begin
      reg153 <= $unsigned(wire134);
      reg154 <= $signed(reg144[(1'h1):(1'h1)]);
    end
  assign wire155 = (8'hb8);
  assign wire156 = wire155;
  assign wire157 = wire155[(4'h9):(1'h1)];
  always
    @(posedge clk) begin
      reg158 <= $signed(reg153[(3'h4):(2'h3)]);
      reg159 <= reg142[(1'h0):(1'h0)];
      reg160 <= wire135;
    end
  assign wire161 = $unsigned(reg154);
  assign wire162 = ((($signed($signed(wire145)) & wire161[(2'h2):(1'h1)]) << $signed((((8'hac) >= reg160) >>> $signed(reg140)))) ?
                       (^(|wire150)) : reg141);
endmodule
