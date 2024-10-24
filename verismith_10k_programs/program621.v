module top
#(parameter param172 = ({{{(~(8'hbd))}, (((8'ha6) <<< (8'haa)) >> ((8'hb8) > (8'hac)))}, (({(8'haf)} ? (^(8'ha8)) : ((8'hbd) ~^ (8'ha5))) | (~^((7'h42) ? (8'hb8) : (8'hba))))} ? ({{((7'h43) >= (8'hab)), (^(8'hba))}, {((8'hb2) != (8'ha1)), {(8'hb1)}}} ^~ ((((8'haf) - (7'h42)) < ((8'ha6) ? (7'h40) : (8'h9c))) <= (|((8'hb8) > (8'ha8))))) : (~|(+(((8'hb7) != (8'ha9)) ? (~(8'ha3)) : (-(8'ha9)))))), 
parameter param173 = ((param172 ? (8'ha6) : ((^~(param172 ? param172 : (7'h41))) ? ((param172 ~^ param172) ? (param172 <<< (8'haf)) : (8'hb5)) : (~(param172 ? param172 : param172)))) << (((^~(~&param172)) != ((param172 == param172) ? {param172} : param172)) ? (param172 ? param172 : (~(8'ha0))) : (~({param172, param172} ? (param172 == param172) : (+param172))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire168;
  wire [(5'h10):(1'h0)] wire167;
  wire [(4'hd):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire165;
  reg [(4'ha):(1'h0)] reg171 = (1'h0);
  reg [(2'h2):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg169 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire165,
                 reg171,
                 reg170,
                 reg169,
                 (1'h0)};
  assign wire4 = (wire3[(1'h0):(1'h0)] ~^ (8'hbd));
  assign wire5 = ((($unsigned(((8'ha2) ?
                             wire1 : wire1)) >>> wire2[(2'h3):(2'h2)]) ?
                         ((~&$unsigned(wire3)) ?
                             wire4[(4'ha):(1'h0)] : ((wire3 ? wire1 : wire4) ?
                                 wire0[(1'h1):(1'h1)] : wire0)) : wire4[(3'h5):(1'h0)]) ?
                     $signed(wire2[(2'h2):(1'h1)]) : ({($unsigned(wire2) >= $unsigned((8'ha1))),
                         ($unsigned(wire2) ?
                             wire2[(2'h3):(1'h1)] : $signed((8'hbc)))} | (wire2[(3'h5):(3'h4)] || (wire1 ?
                         (wire3 ^ (8'hae)) : (8'ha9)))));
  assign wire6 = {{wire0[(1'h0):(1'h0)]}};
  assign wire7 = $unsigned((8'ha3));
  assign wire8 = wire7;
  assign wire9 = wire4[(3'h4):(2'h3)];
  module10 #() modinst166 (wire165, clk, wire1, wire6, wire2, wire3, wire5);
  assign wire167 = $unsigned(wire5);
  assign wire168 = (($unsigned($signed((wire8 ? (7'h42) : (8'hb8)))) ?
                           (~((7'h42) ?
                               $signed(wire165) : (~|wire2))) : $signed(wire3)) ?
                       ($signed(((wire9 ? wire2 : wire1) <<< (wire165 ?
                               (8'hbf) : wire165))) ?
                           (^($signed(wire4) ^ wire1)) : wire1) : ((($unsigned(wire8) * ((8'had) ?
                                   wire7 : wire3)) ?
                               wire3[(3'h5):(1'h0)] : (wire1 && (^(8'hbc)))) ?
                           ($signed(wire2[(4'hd):(3'h6)]) ^ ($signed(wire167) << $signed(wire1))) : $unsigned(($unsigned(wire9) > (wire165 ?
                               wire5 : wire2)))));
  always
    @(posedge clk) begin
      reg169 <= ($unsigned(wire3[(3'h5):(2'h2)]) ?
          (!wire165[(4'ha):(3'h6)]) : $signed((+$signed((wire165 * wire0)))));
      reg170 <= wire8;
      reg171 <= $unsigned({wire0[(2'h2):(1'h0)]});
    end
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire [(5'h10):(1'h0)] wire14;
  input wire [(4'he):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire164;
  wire signed [(2'h3):(1'h0)] wire163;
  wire [(4'ha):(1'h0)] wire162;
  wire signed [(2'h2):(1'h0)] wire161;
  wire signed [(5'h11):(1'h0)] wire160;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire158;
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  assign y = {wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire50,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire17,
                 wire16,
                 wire52,
                 wire53,
                 wire158,
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
                 (1'h0)};
  assign wire16 = wire12;
  assign wire17 = $signed((~^$unsigned({(wire12 ? wire12 : wire15)})));
  always
    @(posedge clk) begin
      reg18 <= wire11;
      reg19 <= $unsigned((wire17 ?
          (($signed(wire16) ? wire17[(2'h3):(2'h3)] : (^~reg18)) ?
              {$signed(wire13)} : ((wire11 || wire14) ?
                  wire15[(4'h9):(1'h0)] : ((8'haf) ?
                      wire12 : reg18))) : $signed({$signed(reg18),
              $signed(wire12)})));
      reg20 <= (wire17[(1'h0):(1'h0)] ?
          $unsigned(wire11[(4'hc):(4'hc)]) : {((wire12 ?
                      $unsigned(wire14) : wire16) ?
                  (-wire15[(1'h0):(1'h0)]) : (^(reg18 && (8'h9d)))),
              (((wire13 ^ (8'hbe)) >>> (!wire12)) ?
                  ($signed(wire14) ? (&wire14) : wire13) : wire13)});
      if ({(~^(-{wire15, (wire17 | reg18)}))})
        begin
          if (reg18[(3'h4):(1'h0)])
            begin
              reg21 <= $unsigned(((8'hbc) ?
                  (reg18[(3'h6):(3'h5)] != (wire11 ?
                      (~wire17) : wire11)) : {((reg18 ? wire15 : reg18) ?
                          wire12[(3'h7):(1'h1)] : (|(8'ha5)))}));
            end
          else
            begin
              reg21 <= ($unsigned(wire14) ?
                  (8'hb1) : $unsigned($unsigned(($unsigned(reg18) ?
                      (~&reg19) : (wire13 >= wire11)))));
              reg22 <= wire14;
              reg23 <= {reg20,
                  ({($signed(reg22) ? wire17[(1'h0):(1'h0)] : (^reg20)),
                          reg18[(3'h6):(2'h3)]} ?
                      (($signed(wire14) >>> $unsigned((8'hbf))) ?
                          wire13[(3'h7):(3'h6)] : (8'ha9)) : (($unsigned(wire13) - reg22[(4'hf):(4'ha)]) ?
                          reg19 : wire13[(4'hc):(4'hc)]))};
              reg24 <= (wire13 == (-reg20));
              reg25 <= $signed((wire11 ?
                  {$signed((reg23 ? wire12 : reg19)),
                      ($unsigned(reg21) ?
                          (8'hb4) : $signed(wire14))} : (reg23 <= (8'ha6))));
            end
          reg26 <= $unsigned(wire14);
          reg27 <= (((~(8'hba)) & $unsigned((&(reg26 ?
              reg24 : reg18)))) ^ $unsigned((-$unsigned($signed((8'hbb))))));
        end
      else
        begin
          reg21 <= $unsigned(($unsigned((((8'hac) ? reg19 : reg19) ?
              $unsigned(wire13) : (~&reg19))) + {reg25[(2'h2):(2'h2)]}));
          reg22 <= $signed($signed($signed((+$signed(reg25)))));
          reg23 <= (reg19[(3'h7):(3'h5)] * wire15[(1'h1):(1'h0)]);
          reg24 <= $signed(($unsigned(({wire17} < $signed(reg18))) ^ ((((8'h9e) ?
                  wire16 : reg22) ~^ (~^wire17)) ?
              ((reg21 > reg24) ?
                  wire14[(4'hd):(4'hb)] : (reg22 && wire16)) : $signed((+(7'h43))))));
          reg25 <= reg26;
        end
    end
  assign wire28 = (~|$unsigned(wire16));
  assign wire29 = $signed($signed(wire16[(1'h0):(1'h0)]));
  assign wire30 = $unsigned((^{wire28}));
  assign wire31 = $signed(wire29[(1'h0):(1'h0)]);
  module32 #() modinst51 (.wire36(reg19), .wire33(wire11), .wire35(reg25), .wire34(wire14), .y(wire50), .clk(clk), .wire37(wire17));
  assign wire52 = (reg19 < ($signed((7'h42)) ?
                      (-(reg27[(1'h1):(1'h0)] - wire12[(2'h2):(1'h0)])) : ($unsigned(reg23) << (&(&reg22)))));
  assign wire53 = wire14[(2'h3):(1'h1)];
  module54 #() modinst159 (.wire59(wire11), .y(wire158), .clk(clk), .wire55(wire31), .wire56(wire29), .wire58(wire53), .wire57(wire30));
  assign wire160 = ((((-wire13[(4'hb):(3'h4)]) ?
                           (wire11 ?
                               wire28[(1'h0):(1'h0)] : {(8'ha1)}) : $unsigned((^~wire12))) ?
                       ($signed({(8'hb2),
                           reg18}) >>> (^$unsigned(reg19))) : $signed((+(wire14 ?
                           wire12 : wire13)))) ~^ (($signed($unsigned(wire31)) ?
                       (^~$signed(reg21)) : $signed(wire16[(3'h6):(3'h6)])) <= (({wire53} ?
                       (wire15 ?
                           wire16 : (8'hb7)) : reg26) < $unsigned(reg24[(1'h1):(1'h0)]))));
  assign wire161 = reg18;
  assign wire162 = reg19;
  assign wire163 = $unsigned(reg18[(2'h3):(1'h1)]);
  assign wire164 = $unsigned((&(~&wire162)));
endmodule

module module54
#(parameter param157 = {{(&(((8'hb1) ? (8'ha6) : (8'hba)) < (|(8'hb3))))}, {{(8'h9c)}, {((-(8'ha3)) ? (~&(8'h9e)) : ((8'hbe) && (8'ha6))), ({(7'h41), (8'had)} ~^ {(8'hb2), (8'hb8)})}}})
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h422):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire59;
  input wire signed [(5'h10):(1'h0)] wire58;
  input wire signed [(4'hc):(1'h0)] wire57;
  input wire [(4'hc):(1'h0)] wire56;
  input wire signed [(4'he):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire156;
  wire signed [(5'h14):(1'h0)] wire126;
  wire signed [(3'h4):(1'h0)] wire125;
  wire [(3'h5):(1'h0)] wire124;
  wire [(3'h6):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire87;
  wire [(3'h7):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire60;
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(3'h7):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg153 = (1'h0);
  reg [(3'h4):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg140 = (1'h0);
  reg [(5'h10):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg135 = (1'h0);
  reg [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(4'he):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  assign y = {wire156,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire60,
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
                 reg121,
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
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
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
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire60 = wire55;
  always
    @(posedge clk) begin
      reg61 <= wire55[(3'h4):(1'h0)];
      reg62 <= (+wire56);
      if (reg61)
        begin
          reg63 <= wire58;
          reg64 <= wire60;
          reg65 <= ((~&(-(&{wire56, (8'ha1)}))) && ((($unsigned(wire59) ?
                  $signed(reg62) : ((7'h44) ? wire55 : wire55)) >> {(wire58 ?
                      wire55 : wire55)}) ?
              reg62 : $signed(wire57[(4'hb):(4'h9)])));
        end
      else
        begin
          reg63 <= (((-reg61) > (((reg62 >= (8'h9d)) <<< {reg64,
                  reg65}) < reg61)) ?
              wire60 : $unsigned((8'h9e)));
          if ((reg63[(3'h6):(2'h3)] & $signed((($signed(wire55) * $signed(reg61)) << ((wire56 ?
                  wire57 : wire58) ?
              reg65[(2'h2):(2'h2)] : $unsigned(reg62))))))
            begin
              reg64 <= (~&($unsigned(wire55) | $signed(reg61)));
            end
          else
            begin
              reg64 <= reg61;
            end
        end
      reg66 <= (wire55[(3'h6):(3'h4)] ?
          $unsigned(reg64[(3'h5):(3'h4)]) : $unsigned(reg61[(1'h0):(1'h0)]));
    end
  assign wire67 = reg63;
  assign wire68 = $unsigned(wire67);
  assign wire69 = $unsigned({$unsigned(wire68)});
  assign wire70 = $unsigned(reg62);
  always
    @(posedge clk) begin
      reg71 <= wire56;
      reg72 <= ((^~((+{reg71}) || (wire60[(2'h2):(1'h0)] ?
          $unsigned(reg65) : $unsigned(wire68)))) < $signed($unsigned(wire70)));
      reg73 <= (!(-(reg61[(3'h4):(1'h1)] >= ($unsigned(reg62) == ((7'h44) > wire59)))));
      if ($unsigned($unsigned($unsigned(wire58))))
        begin
          reg74 <= (wire55[(4'he):(4'h8)] < reg66);
          reg75 <= wire70[(4'h8):(1'h1)];
          if (((~^$signed(reg73)) ?
              $signed($signed($unsigned($unsigned(reg75)))) : $unsigned((&(!{wire68})))))
            begin
              reg76 <= ($unsigned({$signed(wire68[(3'h4):(2'h3)]),
                  (^~wire68)}) < (~^$unsigned((~|reg63[(4'h8):(3'h7)]))));
              reg77 <= {(&(!$signed($unsigned(reg75)))),
                  (reg73 ? reg62 : $unsigned($unsigned($unsigned(wire58))))};
              reg78 <= reg76;
              reg79 <= (^~(reg63 ?
                  reg75[(1'h1):(1'h0)] : wire67[(4'h8):(1'h0)]));
              reg80 <= (((wire70[(1'h0):(1'h0)] || $unsigned((reg77 ?
                  reg64 : wire60))) <= $unsigned({(wire70 ?
                      wire69 : (8'hba))})) ^~ ((((!wire59) >>> (^~wire68)) != $unsigned(reg75[(3'h5):(3'h4)])) - reg71[(4'h8):(3'h6)]));
            end
          else
            begin
              reg76 <= $unsigned($unsigned((-wire67[(1'h0):(1'h0)])));
              reg77 <= (($unsigned(wire58[(4'hb):(4'h9)]) ?
                  reg77[(1'h1):(1'h1)] : wire68[(4'h9):(3'h5)]) || wire57[(3'h7):(3'h6)]);
            end
        end
      else
        begin
          reg74 <= (($signed($signed(wire56)) | (-((reg61 <<< (8'hb6)) ?
                  (+reg66) : reg62))) ?
              (8'hbc) : (!{((8'ha1) ? (reg66 >= reg64) : $unsigned(wire57))}));
          reg75 <= wire56[(2'h2):(1'h1)];
          if (reg78[(3'h4):(2'h3)])
            begin
              reg76 <= (8'h9d);
            end
          else
            begin
              reg76 <= wire68;
              reg77 <= $unsigned((wire56[(4'hc):(4'hc)] || (~&$signed((~&wire57)))));
              reg78 <= reg66[(3'h6):(3'h6)];
              reg79 <= reg61[(2'h3):(2'h2)];
              reg80 <= $unsigned(((((~&reg76) | {reg64, reg64}) ?
                      (|wire67[(4'hc):(3'h6)]) : {wire58[(3'h6):(3'h5)],
                          (reg61 ? wire68 : reg78)}) ?
                  ($signed(reg77[(2'h2):(1'h1)]) ?
                      (-$unsigned(reg77)) : ($signed(wire60) ?
                          $signed(reg66) : reg77[(2'h2):(1'h0)])) : reg65));
            end
          reg81 <= $unsigned(((^reg76) ?
              (~&(wire58 >> (~&reg61))) : $unsigned($unsigned((reg62 & wire59)))));
        end
      reg82 <= (8'hbf);
    end
  assign wire83 = (reg77 ? reg63[(3'h6):(2'h3)] : {reg63[(3'h6):(3'h4)]});
  assign wire84 = ((($unsigned((reg65 ? (8'hbf) : reg81)) ?
                          $unsigned((reg61 ?
                              reg80 : wire70)) : wire83) | $unsigned($unsigned($signed(reg77)))) ?
                      reg82[(3'h7):(3'h7)] : wire67[(4'h9):(2'h2)]);
  assign wire85 = reg74[(3'h5):(2'h2)];
  assign wire86 = $signed((~^wire57[(4'hb):(4'hb)]));
  assign wire87 = $signed(($unsigned(reg77) + $signed($signed((reg65 != reg81)))));
  assign wire88 = ((^(&{(reg72 ?
                          (8'ha1) : wire83)})) >> ((|(|$signed(wire55))) - (8'ha0)));
  always
    @(posedge clk) begin
      if ($unsigned((reg65 || $signed(reg62))))
        begin
          if (wire70)
            begin
              reg89 <= ((+$signed($unsigned((~|reg72)))) != (+reg77[(1'h0):(1'h0)]));
              reg90 <= (reg71[(4'hd):(4'h9)] >= (^(^{$unsigned(reg72)})));
              reg91 <= reg79;
              reg92 <= (~&{(|$signed((reg89 ? reg64 : wire67))),
                  (((reg66 ? (8'hbb) : wire56) ?
                      $unsigned(wire57) : (reg80 ?
                          wire86 : wire57)) - wire84[(2'h2):(1'h1)])});
            end
          else
            begin
              reg89 <= ((+$unsigned(reg62[(3'h4):(3'h4)])) ?
                  (wire57[(4'hc):(4'h9)] <<< ($unsigned(reg77) ?
                      ($signed(wire59) ?
                          {reg78,
                              wire84} : (reg73 - reg66)) : reg74[(1'h0):(1'h0)])) : $unsigned($unsigned($signed((^(7'h40))))));
              reg90 <= (8'ha5);
              reg91 <= reg80;
              reg92 <= $signed(reg91);
              reg93 <= (!reg64);
            end
          if ((wire87[(4'h8):(3'h7)] == reg61))
            begin
              reg94 <= reg62[(2'h3):(1'h0)];
              reg95 <= reg77;
              reg96 <= ({wire85} ?
                  (($signed($unsigned(wire87)) || (~^reg80)) ?
                      reg78[(1'h0):(1'h0)] : $unsigned(wire55[(4'he):(3'h6)])) : reg77[(1'h1):(1'h0)]);
              reg97 <= (~wire56);
              reg98 <= (((&$unsigned(((8'h9c) ? reg96 : reg65))) ~^ reg97) ?
                  ((8'hb0) ?
                      (({(8'had)} & wire67) <<< (8'hac)) : reg82) : $signed($signed((wire83[(1'h1):(1'h1)] - (wire68 ?
                      (8'h9d) : reg71)))));
            end
          else
            begin
              reg94 <= (8'ha7);
            end
        end
      else
        begin
          reg89 <= reg66;
          reg90 <= $unsigned($unsigned((~|$unsigned((^~reg81)))));
        end
      reg99 <= (&{reg63[(4'ha):(1'h0)]});
      reg100 <= $signed((~|$signed(((wire57 ? (8'h9e) : reg99) ?
          $unsigned(wire84) : {wire56, (8'hac)}))));
      if ($signed(reg96))
        begin
          reg101 <= (wire86 ^~ {$signed($signed(reg89[(1'h1):(1'h0)])),
              (~$unsigned((~&reg65)))});
          reg102 <= ((($signed((|reg78)) ?
                  $unsigned((~|reg90)) : {$signed(reg80),
                      ((8'hb3) ^~ wire67)}) ?
              $unsigned(wire55[(4'he):(1'h1)]) : ($unsigned($signed(reg71)) ?
                  reg65 : (&$unsigned((8'hb9))))) << (+(reg81 ?
              reg66[(1'h1):(1'h0)] : (&reg93))));
          reg103 <= {((($unsigned(wire85) << (wire56 ^~ (7'h43))) << wire87[(1'h0):(1'h0)]) ?
                  {$signed({reg100, (8'hb4)})} : $signed((reg95 ?
                      (reg89 || reg74) : (^(8'ha3))))),
              $unsigned({{(reg96 ? reg76 : (8'hb8)), $signed((8'ha5))},
                  (^$unsigned(reg102))})};
          if ((~^$unsigned((-((|wire86) <= $signed(reg64))))))
            begin
              reg104 <= reg94[(1'h1):(1'h1)];
              reg105 <= reg92[(4'hf):(4'ha)];
            end
          else
            begin
              reg104 <= wire58;
              reg105 <= ((reg101 ^ $signed(($unsigned(reg90) ?
                  $unsigned(reg77) : $signed((7'h40))))) < reg75);
            end
          reg106 <= reg101[(4'hb):(3'h4)];
        end
      else
        begin
          if (reg76)
            begin
              reg101 <= ({{$signed(wire57)}} ?
                  $signed(($unsigned((~|reg101)) ^~ wire88)) : $signed({reg89[(2'h2):(2'h2)],
                      (|reg77[(2'h2):(2'h2)])}));
              reg102 <= reg63[(4'ha):(3'h7)];
              reg103 <= $signed((~reg78[(3'h4):(1'h1)]));
              reg104 <= $signed($unsigned((7'h42)));
            end
          else
            begin
              reg101 <= ($unsigned((&(reg82[(1'h1):(1'h1)] ?
                      (-(8'ha2)) : (reg100 > wire58)))) ?
                  $unsigned(reg63[(3'h6):(3'h6)]) : (|(reg102 != (&(reg90 ?
                      reg99 : (8'hb2))))));
              reg102 <= ((wire70 ?
                  $signed((&(reg102 || reg102))) : ((!reg61[(3'h5):(2'h2)]) ?
                      wire58[(4'hd):(4'hd)] : $unsigned($unsigned(wire84)))) == $signed(reg79));
              reg103 <= $signed((~(($unsigned(reg105) ^ $unsigned((8'hbd))) < $unsigned($unsigned(reg104)))));
              reg104 <= {reg77[(2'h2):(1'h1)]};
              reg105 <= $signed($unsigned((|wire70)));
            end
          reg106 <= ($unsigned((($signed(wire59) ~^ reg61[(1'h0):(1'h0)]) ?
                  ({reg78} > (wire67 && reg95)) : $signed((reg95 * reg92)))) ?
              $unsigned(reg64[(3'h4):(1'h0)]) : (wire68[(2'h2):(1'h0)] && (^~(wire58[(5'h10):(3'h5)] ?
                  wire88[(4'h9):(1'h0)] : $unsigned(reg101)))));
          if (reg79[(3'h6):(1'h1)])
            begin
              reg107 <= (8'h9d);
              reg108 <= (~&$signed((~^reg77)));
              reg109 <= $unsigned((reg100[(4'hb):(4'ha)] ?
                  ((^reg95[(1'h1):(1'h1)]) > {(^wire68)}) : $signed($unsigned((reg71 * reg99)))));
            end
          else
            begin
              reg107 <= ((&((^(~^reg62)) >> $signed((&wire69)))) ?
                  $signed($signed((wire88 * (reg102 ?
                      (8'hac) : reg65)))) : (-$signed(reg80[(2'h3):(2'h2)])));
            end
          reg110 <= ((|$unsigned($signed((reg74 ? (8'hb2) : wire68)))) ?
              (~|(~(+(7'h43)))) : wire55);
          reg111 <= $unsigned({(reg81[(3'h6):(1'h0)] ?
                  (^~$unsigned(reg72)) : $signed((8'ha1))),
              $signed($unsigned(reg106))});
        end
      if (reg73[(1'h0):(1'h0)])
        begin
          reg112 <= $signed((-$signed((~|reg79))));
          reg113 <= (~&$signed($unsigned($unsigned($signed(wire56)))));
          if (((((^(7'h44)) || (~&$unsigned(wire88))) ?
                  wire83[(1'h1):(1'h1)] : (($signed(reg66) ?
                      $unsigned(reg91) : ((8'h9f) ?
                          reg82 : reg74)) && $signed(reg91))) ?
              $signed(reg63[(2'h3):(2'h2)]) : (((reg66[(3'h5):(3'h5)] | (reg81 ^~ wire83)) << reg112[(3'h4):(3'h4)]) ?
                  $signed(((-(8'hb7)) ?
                      (reg104 + wire56) : (reg92 - reg66))) : (!$unsigned(reg79[(3'h6):(3'h4)])))))
            begin
              reg114 <= (+reg81[(1'h1):(1'h1)]);
              reg115 <= (8'hae);
              reg116 <= $signed($signed(reg64[(3'h5):(3'h5)]));
            end
          else
            begin
              reg114 <= {$signed($signed(wire85)), wire57[(4'h9):(3'h5)]};
              reg115 <= (reg106[(4'he):(3'h4)] ?
                  $signed((~^{reg104, (|reg104)})) : (($unsigned((reg91 ?
                          reg114 : (8'h9e))) ?
                      ((+reg66) && $unsigned(reg111)) : reg94) > reg96[(2'h3):(1'h1)]));
              reg116 <= (&($signed((+(wire67 ? reg78 : reg108))) ?
                  ((((7'h42) ~^ reg109) ?
                      (~|reg89) : wire70[(2'h2):(2'h2)]) != $signed({wire58,
                      reg106})) : reg100[(3'h6):(2'h3)]));
            end
          if (reg75)
            begin
              reg117 <= (^{(($signed(reg63) && $signed(wire88)) ?
                      $signed({reg101, reg108}) : $unsigned(reg81)),
                  wire58});
              reg118 <= reg80;
            end
          else
            begin
              reg117 <= (~&reg110[(4'h8):(1'h1)]);
              reg118 <= reg81[(5'h10):(4'he)];
              reg119 <= (~^reg112);
              reg120 <= reg115;
              reg121 <= ((+$signed($unsigned((8'ha3)))) ?
                  (^~(&$signed(reg97))) : (8'had));
            end
        end
      else
        begin
          reg112 <= (^$unsigned(wire68[(4'h8):(1'h1)]));
          reg113 <= ($unsigned($unsigned({$unsigned(reg107),
              ((7'h41) ?
                  reg96 : wire83)})) <= $unsigned(reg111[(2'h2):(2'h2)]));
          reg114 <= (reg73[(2'h2):(2'h2)] ?
              {(+((~|reg61) ? reg82 : {wire57}))} : reg116[(4'h9):(2'h2)]);
          reg115 <= $unsigned(reg63[(3'h4):(3'h4)]);
        end
    end
  assign wire122 = $unsigned(reg98[(3'h6):(1'h0)]);
  assign wire123 = (((^($unsigned(reg65) ?
                       (^~reg72) : reg94)) == wire57[(3'h7):(2'h3)]) | reg111);
  assign wire124 = (^wire68);
  assign wire125 = $unsigned(({{$unsigned((8'hac)), (^reg110)}} ?
                       wire124[(1'h1):(1'h0)] : wire87[(4'he):(1'h0)]));
  assign wire126 = ((^{reg118, $unsigned($signed(reg76))}) ?
                       (($unsigned((reg63 ? reg66 : reg119)) ?
                               $signed(reg71[(4'h9):(4'h8)]) : $unsigned((reg61 ?
                                   wire70 : reg89))) ?
                           (!reg111[(2'h2):(2'h2)]) : ($unsigned($unsigned(reg81)) ~^ (+{wire57,
                               (8'hac)}))) : ((((8'h9e) == $unsigned((8'hab))) - ((reg74 + reg80) ?
                               (wire70 ? reg94 : reg104) : reg115)) ?
                           $signed($signed((wire58 ?
                               wire58 : reg92))) : $unsigned($unsigned($unsigned(reg106)))));
  always
    @(posedge clk) begin
      reg127 <= (8'haf);
      reg128 <= reg94;
      if ({($signed($signed(reg118)) << (^~((reg112 && wire122) ~^ $signed(reg127))))})
        begin
          if ($signed(reg116[(3'h5):(2'h3)]))
            begin
              reg129 <= ((-(~&((&reg79) ?
                  reg73 : $unsigned(reg114)))) != reg114[(3'h4):(2'h2)]);
            end
          else
            begin
              reg129 <= ((wire124 || $signed((8'hb9))) ?
                  ($signed($signed((reg119 >= reg101))) < reg76) : (~^($signed($unsigned(reg79)) < $signed(wire124))));
              reg130 <= (^~($signed((((7'h43) ?
                      reg77 : wire60) ^~ $signed(reg110))) ?
                  (+$signed({reg90})) : (($signed(reg79) ?
                          ((8'haf) && (8'ha3)) : (reg105 ^~ reg112)) ?
                      reg118 : reg115)));
              reg131 <= wire83;
            end
          reg132 <= (reg130 > ((8'ha4) ?
              {(~wire87), $signed($signed((8'h9f)))} : reg82));
          reg133 <= $unsigned(wire60[(4'hd):(4'hd)]);
        end
      else
        begin
          if ($signed(wire126))
            begin
              reg129 <= reg129;
              reg130 <= wire55[(4'hc):(1'h0)];
              reg131 <= $signed($signed(($unsigned($unsigned(reg109)) > ({reg77,
                      reg65} ?
                  wire85 : $signed(reg108)))));
              reg132 <= (((wire68 & (|wire69[(2'h3):(1'h1)])) ~^ reg81) ^~ (+{(reg128 || wire69[(3'h4):(2'h2)])}));
              reg133 <= (wire67 ?
                  (^~$unsigned($unsigned($signed(reg81)))) : wire67[(3'h5):(3'h4)]);
            end
          else
            begin
              reg129 <= wire60;
              reg130 <= reg93[(3'h6):(2'h2)];
              reg131 <= $unsigned(wire85);
            end
          if (($signed({(wire60 < (reg82 ? reg76 : (8'hb9)))}) ?
              (8'hb8) : $signed(wire122[(1'h1):(1'h1)])))
            begin
              reg134 <= ((~^(&(!$unsigned(reg127)))) >>> ((&$signed((reg130 != (8'hb3)))) ?
                  reg112 : {(8'h9e), reg99[(1'h1):(1'h1)]}));
              reg135 <= (reg134[(4'h8):(1'h0)] - $unsigned(reg107[(3'h4):(2'h3)]));
            end
          else
            begin
              reg134 <= $unsigned(reg63);
              reg135 <= reg82[(3'h4):(2'h3)];
              reg136 <= $unsigned(wire56[(2'h3):(2'h2)]);
              reg137 <= $signed((|reg97[(4'ha):(2'h3)]));
            end
        end
    end
  always
    @(posedge clk) begin
      reg138 <= reg105[(1'h0):(1'h0)];
      if (wire83[(1'h0):(1'h0)])
        begin
          reg139 <= wire125;
          reg140 <= (reg77 ?
              $signed(((&((8'hb9) ? wire85 : wire83)) ?
                  {reg107[(4'hb):(4'hb)]} : wire55[(4'ha):(1'h0)])) : wire84[(1'h0):(1'h0)]);
          reg141 <= reg78[(3'h5):(2'h2)];
        end
      else
        begin
          if ($signed(reg128[(2'h3):(1'h0)]))
            begin
              reg139 <= (((($signed(reg80) - (reg93 ?
                  reg108 : wire83)) - (reg118 ?
                  (~^reg108) : (~&(8'hb4)))) | wire59[(3'h4):(1'h1)]) <<< (~(8'hb7)));
              reg140 <= (8'hb1);
              reg141 <= $signed(($unsigned({reg100,
                  reg130[(1'h1):(1'h0)]}) ~^ ((reg129[(5'h13):(3'h7)] + wire125[(1'h0):(1'h0)]) ?
                  $unsigned(reg105[(4'h8):(1'h1)]) : $signed(reg140[(3'h6):(2'h3)]))));
            end
          else
            begin
              reg139 <= (~&$unsigned((^~((reg96 ? reg73 : reg72) ?
                  (reg95 ? reg115 : reg111) : (wire124 >= (8'hae))))));
              reg140 <= $unsigned((&((reg114 > (reg63 <<< wire60)) > reg98)));
              reg141 <= (~$signed($unsigned(reg100)));
            end
          reg142 <= reg114[(2'h3):(2'h2)];
          reg143 <= $unsigned(($signed({reg139[(2'h3):(1'h1)], reg97}) ?
              $signed($unsigned((8'hb5))) : $unsigned($unsigned(wire85))));
          if (($unsigned(reg135[(3'h7):(3'h6)]) ?
              (8'hae) : (|(reg62 <<< reg109[(4'hb):(2'h3)]))))
            begin
              reg144 <= $unsigned(wire69);
              reg145 <= (reg78 ?
                  {$unsigned({{(8'hb2), wire55}, reg121})} : (~&(8'haa)));
            end
          else
            begin
              reg144 <= ((|($unsigned(reg81[(3'h5):(3'h4)]) ~^ (reg75 ?
                      (!reg79) : (reg119 | reg134)))) ?
                  reg141 : (reg107[(2'h2):(2'h2)] ?
                      (((~|reg94) && (!(8'hbb))) ?
                          $unsigned(reg61[(4'h9):(4'h9)]) : ((reg100 ?
                                  wire86 : reg119) ?
                              $signed(reg66) : {reg104})) : wire88));
              reg145 <= reg132;
              reg146 <= $signed(((((!(8'haa)) ?
                      reg62[(2'h3):(1'h1)] : $unsigned(reg73)) ?
                  (~&reg140) : ((~&reg94) * (wire86 << reg65))) <<< $unsigned({(reg77 & (8'had)),
                  $signed(reg64)})));
              reg147 <= $signed(reg145[(2'h2):(1'h1)]);
            end
        end
      if (reg66[(3'h4):(2'h2)])
        begin
          reg148 <= reg99;
          if ($unsigned((((reg73[(3'h4):(2'h3)] * (reg100 && reg120)) >> $unsigned((reg113 ?
              reg140 : reg74))) != (8'hac))))
            begin
              reg149 <= $signed($signed($unsigned($signed(reg110))));
              reg150 <= $unsigned((8'hab));
              reg151 <= reg91;
              reg152 <= $signed((~&{(8'hac), reg98[(3'h5):(1'h1)]}));
              reg153 <= reg121[(4'ha):(4'ha)];
            end
          else
            begin
              reg149 <= $unsigned(($unsigned((!$unsigned(reg80))) == (~&(8'hb0))));
            end
          if (($unsigned({$unsigned((reg151 ?
                  reg74 : reg102))}) ~^ $unsigned({$unsigned($signed(reg151)),
              $signed(reg79[(1'h0):(1'h0)])})))
            begin
              reg154 <= $signed(reg95[(2'h2):(1'h0)]);
              reg155 <= {((^~(|(-reg114))) != (~reg92[(5'h11):(5'h11)]))};
            end
          else
            begin
              reg154 <= $signed($signed((^reg65[(1'h1):(1'h1)])));
              reg155 <= ((({(reg89 ? reg139 : reg131)} ?
                      $unsigned((wire58 ?
                          reg81 : reg130)) : ($unsigned(wire56) ?
                          reg152 : ((8'h9d) * reg130))) ?
                  (~reg62) : (8'hab)) >>> ($unsigned(((reg103 ?
                      reg142 : reg104) ?
                  reg139 : $signed(reg128))) <= reg127[(2'h3):(1'h0)]));
            end
        end
      else
        begin
          reg148 <= (~|reg109[(4'h9):(3'h5)]);
          reg149 <= $signed(reg108[(4'hc):(4'ha)]);
          reg150 <= (-{reg115,
              (($unsigned((8'hb0)) == (wire56 < reg149)) ?
                  reg140[(1'h0):(1'h0)] : $unsigned({reg133, reg115}))});
        end
    end
  assign wire156 = reg151;
endmodule

module module32
#(parameter param48 = ((^{({(7'h42), (8'hba)} * (+(8'ha5)))}) + (~|{{((7'h42) ~^ (8'hb0)), ((8'hbc) == (7'h40))}})), 
parameter param49 = (8'h9f))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire37;
  input wire signed [(4'hc):(1'h0)] wire36;
  input wire signed [(3'h5):(1'h0)] wire35;
  input wire [(5'h10):(1'h0)] wire34;
  input wire [(5'h15):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire45;
  wire signed [(4'h8):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 (1'h0)};
  assign wire38 = ($signed(($unsigned($unsigned(wire36)) >= $unsigned(wire36))) ^~ (&wire37));
  assign wire39 = wire33;
  assign wire40 = wire33[(1'h1):(1'h1)];
  assign wire41 = $signed(((~&((wire35 << wire38) ?
                          (wire39 ? wire35 : wire34) : (wire33 >>> wire38))) ?
                      $signed({(wire36 ?
                              (8'h9f) : wire40)}) : wire39[(3'h6):(3'h4)]));
  assign wire42 = (wire38[(1'h1):(1'h0)] - $unsigned(($signed({wire39,
                      wire33}) >>> {(~|(8'ha7))})));
  assign wire43 = $unsigned((($signed((wire35 > wire42)) && ($signed(wire35) ?
                      wire34[(2'h2):(2'h2)] : (wire37 ?
                          wire35 : wire33))) & (wire40[(2'h3):(1'h0)] + ((wire36 ?
                      (8'haa) : wire39) == wire35))));
  assign wire44 = $unsigned(wire43);
  assign wire45 = {wire34[(1'h0):(1'h0)]};
  assign wire46 = ($signed(($unsigned(wire39) ?
                          ($unsigned(wire38) | {(8'hb7), wire44}) : ((wire42 ?
                                  wire44 : wire44) ?
                              $unsigned(wire39) : wire35[(2'h2):(1'h1)]))) ?
                      {({(~|wire44), wire36[(4'h9):(3'h5)]} && {wire42,
                              (wire37 ~^ wire35)}),
                          (~&wire35[(1'h1):(1'h0)])} : ((8'haf) && wire41[(2'h2):(1'h0)]));
  assign wire47 = wire42[(3'h7):(3'h5)];
endmodule
