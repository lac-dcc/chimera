module top
#(parameter param144 = (~^(((8'had) ? {{(8'h9c), (8'hb0)}, {(8'hb1), (8'hbd)}} : ((8'hbd) != ((8'h9c) ? (8'hab) : (8'h9f)))) >= ((8'hba) || (&((8'hb9) + (8'ha5)))))), 
parameter param145 = param144)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire143;
  wire [(5'h10):(1'h0)] wire127;
  wire signed [(3'h7):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire122;
  reg [(5'h15):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg140 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(4'hd):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  reg [(4'hb):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire143,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire9,
                 wire10,
                 wire11,
                 wire18,
                 wire19,
                 wire20,
                 wire122,
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
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((^~($signed(({wire3, wire3} <= (wire0 ?
          wire2 : wire1))) ^ wire4[(5'h12):(2'h2)])))
        begin
          reg5 <= wire4[(3'h7):(3'h4)];
          reg6 <= wire1[(4'hb):(3'h6)];
        end
      else
        begin
          reg5 <= (-$unsigned((+wire1)));
        end
      reg7 <= {$unsigned({((reg5 || wire2) | $unsigned((8'hbe))),
              wire1[(3'h7):(3'h6)]})};
      reg8 <= wire2[(2'h2):(1'h1)];
    end
  assign wire9 = {reg7,
                     $signed(((~&wire2) ?
                         {$signed(reg6), (~^(8'ha6))} : wire3[(3'h6):(3'h6)]))};
  assign wire10 = $signed({{(wire9[(2'h2):(1'h1)] >= $unsigned(wire1))},
                      $signed((~&(|wire1)))});
  assign wire11 = wire3;
  always
    @(posedge clk) begin
      reg12 <= wire4[(2'h3):(2'h3)];
      if (((wire0 + wire3) - wire2))
        begin
          reg13 <= $signed($signed(((wire9 | wire2[(4'hd):(3'h7)]) && (~|(wire10 & reg7)))));
          reg14 <= $unsigned(({$signed((wire10 >= wire0)),
              wire11} && {(~&(reg13 ? reg6 : wire10)), $unsigned(reg7)}));
        end
      else
        begin
          if ($signed(wire2))
            begin
              reg13 <= $unsigned($signed($signed(((+(8'hb6)) - reg5))));
            end
          else
            begin
              reg13 <= ((((|$unsigned(wire3)) ?
                  (8'ha4) : {wire10[(3'h4):(2'h2)],
                      (^~(8'h9c))}) >= $signed($unsigned({wire0}))) * $signed(($signed(reg14[(4'hd):(2'h2)]) == (&{wire0,
                  wire1}))));
            end
          reg14 <= $signed(wire10[(4'hb):(2'h2)]);
          reg15 <= wire1;
        end
      reg16 <= ((wire4 >>> ({reg6[(3'h5):(3'h5)]} < reg15)) ^ $signed((($signed(reg15) ?
              wire10[(1'h1):(1'h0)] : (wire2 ? wire10 : wire9)) ?
          wire2[(2'h3):(1'h0)] : wire1)));
      reg17 <= $signed($unsigned(($signed({wire4,
          reg8}) | $signed((^~wire4)))));
    end
  assign wire18 = {({($unsigned(reg6) && $signed(reg7)),
                          $unsigned(reg17)} * reg6[(3'h4):(2'h2)]),
                      ((~&$unsigned((^~reg16))) ?
                          ((reg14 | (wire9 ?
                              (8'h9f) : reg7)) * (^~$unsigned(wire3))) : $signed(((~&reg5) - ((8'hbf) & reg8))))};
  assign wire19 = ((~&$signed(({reg12} || wire0))) ?
                      ($unsigned(((7'h40) <= ((8'hb3) && wire10))) ?
                          ((&$unsigned(reg12)) ?
                              ($signed(wire0) ?
                                  reg5[(3'h6):(3'h5)] : (reg6 >>> reg8)) : reg8[(4'h9):(4'h8)]) : {(+(reg8 >= wire18)),
                              $signed(wire10)}) : reg17[(2'h2):(2'h2)]);
  assign wire20 = (8'hb7);
  module21 #() modinst123 (wire122, clk, wire4, reg6, reg7, reg15, reg12);
  assign wire124 = (~|wire0[(4'hb):(3'h7)]);
  assign wire125 = $unsigned(wire18);
  assign wire126 = reg6[(1'h1):(1'h1)];
  assign wire127 = (^$unsigned(reg17));
  always
    @(posedge clk) begin
      reg128 <= $signed($unsigned({$signed(((8'ha7) ? wire127 : wire124))}));
      reg129 <= ({{reg5, {(-wire19)}}, {(-(7'h43))}} ^~ wire124[(1'h1):(1'h1)]);
      if ($signed(wire0))
        begin
          reg130 <= (^~{(reg128[(3'h5):(3'h5)] || $signed(reg15[(5'h10):(3'h4)]))});
          if (wire10[(1'h0):(1'h0)])
            begin
              reg131 <= wire18;
            end
          else
            begin
              reg131 <= {$signed($signed($signed($signed(wire20))))};
              reg132 <= wire1;
            end
          reg133 <= reg8;
        end
      else
        begin
          reg130 <= reg13[(2'h3):(2'h2)];
        end
      if (reg131[(3'h7):(2'h3)])
        begin
          reg134 <= (^~(~|(!($signed((7'h43)) ?
              ((7'h44) ~^ reg133) : (8'hb1)))));
          reg135 <= (wire122[(4'hc):(4'h9)] ?
              wire3 : (|$unsigned(($signed(reg133) <= (8'had)))));
          if (wire11[(4'hb):(2'h2)])
            begin
              reg136 <= (({$unsigned(reg129[(5'h10):(2'h3)]),
                          ((wire4 ? wire1 : wire4) * wire18[(2'h2):(1'h1)])} ?
                      reg131[(3'h7):(3'h4)] : $signed($unsigned($signed((8'h9d))))) ?
                  $signed($unsigned($unsigned($signed(reg130)))) : $signed({(wire0[(1'h1):(1'h1)] ?
                          {(8'hab)} : (reg6 ? wire125 : wire11))}));
              reg137 <= (8'ha4);
              reg138 <= $signed(wire0);
              reg139 <= $signed(reg7[(4'hc):(4'h9)]);
              reg140 <= $unsigned($signed(($unsigned((reg132 || reg14)) ?
                  reg139[(1'h0):(1'h0)] : ((reg139 ?
                      wire124 : wire9) >> {wire1}))));
            end
          else
            begin
              reg136 <= $signed((8'hb5));
              reg137 <= ((($signed({wire19}) >> reg133) ?
                      {{wire125[(1'h1):(1'h0)],
                              $signed(wire3)}} : (wire4[(4'hf):(3'h4)] ?
                          (8'hb7) : $unsigned(((8'hbe) | (8'ha6))))) ?
                  ($unsigned($signed($unsigned(reg140))) ?
                      $unsigned((reg139[(1'h1):(1'h1)] + $signed(reg134))) : (|(^~(reg17 & (8'h9e))))) : (+reg138[(4'ha):(2'h2)]));
              reg138 <= ((reg136 + wire124) <<< (reg132 && reg132[(2'h3):(1'h0)]));
            end
          if (reg15)
            begin
              reg141 <= wire127;
            end
          else
            begin
              reg141 <= (^~(&{$unsigned({reg128}),
                  ((-wire20) ? (reg140 ? reg131 : wire20) : (-(8'hbd)))}));
            end
        end
      else
        begin
          reg134 <= $unsigned({reg137[(4'hf):(3'h6)],
              $unsigned($signed($unsigned(wire127)))});
          if (reg17)
            begin
              reg135 <= {({$signed((~&wire126))} ?
                      reg138[(2'h2):(2'h2)] : $signed((7'h41)))};
              reg136 <= wire10;
              reg137 <= $unsigned(reg139);
              reg138 <= $signed($signed(reg132[(1'h1):(1'h0)]));
              reg139 <= (&(~|$unsigned(({reg5} >= $signed(wire122)))));
            end
          else
            begin
              reg135 <= wire122;
              reg136 <= (wire20[(2'h2):(1'h1)] ?
                  (+wire1) : (($signed(((8'hb8) >> reg12)) ?
                      reg7 : wire122[(3'h7):(3'h7)]) ^ $signed($unsigned($unsigned(reg8)))));
              reg137 <= $unsigned($unsigned(($unsigned(reg131) | $unsigned((~|reg8)))));
            end
        end
      reg142 <= reg139;
    end
  assign wire143 = ((-{$signed((8'hba))}) ^~ $signed(reg12[(4'h8):(1'h0)]));
endmodule

module module21  (y, clk, wire22, wire23, wire24, wire25, wire26);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire22;
  input wire [(4'h8):(1'h0)] wire23;
  input wire [(5'h10):(1'h0)] wire24;
  input wire signed [(5'h13):(1'h0)] wire25;
  input wire [(5'h13):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire121;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire119;
  assign y = {wire121, wire44, wire46, wire86, wire119, (1'h0)};
  module27 #() modinst45 (wire44, clk, wire22, wire24, wire26, wire25);
  assign wire46 = wire24;
  module47 #() modinst87 (.y(wire86), .clk(clk), .wire50(wire44), .wire49(wire24), .wire51(wire26), .wire48(wire22));
  module88 #() modinst120 (wire119, clk, wire26, wire86, wire46, wire44, wire22);
  assign wire121 = (8'ha7);
endmodule

module module88
#(parameter param118 = ((((((7'h42) ? (8'h9c) : (8'ha0)) - {(8'h9f)}) ? {(|(7'h43))} : (((8'hbf) >= (7'h40)) <<< {(8'hb9), (8'hac)})) ? (~&{((8'h9c) ? (8'hbf) : (8'hb3)), ((8'haa) ? (8'h9c) : (8'ha3))}) : ({((8'hb9) ? (8'hbc) : (8'hbc))} ? ((~|(8'hb7)) != ((8'ha9) ? (8'ha9) : (7'h43))) : {(~&(8'hb5))})) ^~ ((7'h40) & ({((8'ha9) == (8'hb7))} ^ ((^~(8'hba)) && ((8'ha0) | (8'hb2)))))))
(y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire93;
  input wire signed [(4'ha):(1'h0)] wire92;
  input wire [(4'hf):(1'h0)] wire91;
  input wire signed [(4'hb):(1'h0)] wire90;
  input wire signed [(4'hf):(1'h0)] wire89;
  wire signed [(5'h12):(1'h0)] wire96;
  wire [(2'h2):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire94;
  reg signed [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
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
                 (1'h0)};
  assign wire94 = $signed($signed((wire92[(1'h0):(1'h0)] ?
                      (8'hb9) : ((wire93 ? wire91 : wire90) ?
                          (wire90 ^ wire91) : $signed(wire90)))));
  assign wire95 = (8'hb6);
  assign wire96 = $unsigned(wire92[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg97 <= $unsigned($unsigned(($signed(((8'hbb) & wire94)) << ((wire89 ?
              wire92 : (8'ha7)) ?
          (wire95 < wire90) : (wire93 ? wire91 : wire96)))));
      reg98 <= $signed(wire91[(4'h9):(3'h4)]);
      reg99 <= ({wire95,
          (wire89 ?
              ({wire93,
                  wire90} ^ (^~wire93)) : {$signed(wire95)})} * (~|{$signed($unsigned((7'h43)))}));
      if ({wire91[(4'h8):(2'h3)], wire91[(4'hf):(2'h3)]})
        begin
          reg100 <= ($signed($unsigned(((wire89 + reg99) ?
              {reg98} : reg97[(2'h2):(1'h1)]))) ^~ $unsigned((+(8'hbc))));
          if (wire89[(4'h8):(1'h1)])
            begin
              reg101 <= ((8'hb6) ?
                  (wire92[(2'h3):(1'h1)] ?
                      {($signed(reg98) & $signed(wire91))} : $unsigned(reg98)) : reg98[(4'hb):(4'h9)]);
            end
          else
            begin
              reg101 <= ($signed({wire92[(1'h1):(1'h1)],
                  wire91[(4'hf):(1'h1)]}) ~^ wire91[(3'h4):(3'h4)]);
              reg102 <= {{(wire93[(4'hf):(1'h0)] ? reg99 : $unsigned(reg98)),
                      (~(((8'hb9) && wire94) >= $unsigned(wire91)))}};
              reg103 <= ((((&(wire95 ? wire95 : reg101)) ?
                      $signed($unsigned(wire89)) : $unsigned((wire94 || (8'ha4)))) ?
                  ($unsigned($signed((8'hbf))) - wire94) : {$unsigned(wire90[(1'h1):(1'h1)])}) ~^ $unsigned(({wire95} - reg99)));
            end
        end
      else
        begin
          if (({$signed(reg100)} ?
              (wire95[(1'h1):(1'h0)] ?
                  wire96 : (wire96[(4'hb):(3'h5)] ^~ (wire90[(3'h6):(1'h1)] + (~|reg99)))) : ((reg99 ?
                      wire93 : $unsigned($signed(wire92))) ?
                  wire91[(4'h9):(2'h3)] : $unsigned(reg103[(4'h8):(3'h7)]))))
            begin
              reg100 <= (wire96 == wire90[(3'h4):(1'h0)]);
            end
          else
            begin
              reg100 <= reg99[(3'h7):(3'h6)];
              reg101 <= $signed($signed(reg97[(2'h3):(2'h3)]));
              reg102 <= wire94;
              reg103 <= $signed(($unsigned((reg100 >> (wire93 ?
                  wire90 : (8'h9f)))) * $unsigned({(wire89 ?
                      reg97 : (8'ha2))})));
              reg104 <= (&reg99);
            end
          if ($signed($signed(wire95[(2'h2):(1'h0)])))
            begin
              reg105 <= (8'hb1);
              reg106 <= $unsigned($signed((~|wire92)));
            end
          else
            begin
              reg105 <= reg104;
              reg106 <= (^~reg104);
              reg107 <= $signed(($unsigned((&(wire92 >>> wire94))) <= (^~wire89[(4'ha):(3'h7)])));
              reg108 <= reg106[(2'h2):(1'h0)];
              reg109 <= (wire95 ? reg99 : reg97);
            end
          if ((($signed(($unsigned(reg103) >= wire94[(4'h8):(2'h2)])) | (!wire93)) ^~ (^$signed($unsigned($signed(wire89))))))
            begin
              reg110 <= {(wire90 ?
                      $unsigned(($signed(reg98) ?
                          (~reg109) : ((7'h43) == reg105))) : ($unsigned($signed((8'hb4))) ?
                          $signed((wire90 + wire95)) : reg108[(5'h11):(4'hd)]))};
              reg111 <= (!$unsigned($unsigned((!(wire91 ?
                  (8'h9c) : (8'ha2))))));
            end
          else
            begin
              reg110 <= $signed($signed($unsigned((~^$signed(reg97)))));
            end
          reg112 <= $unsigned((reg102[(2'h2):(2'h2)] ?
              (reg99 < (8'ha2)) : $signed(((wire90 <<< reg101) ?
                  reg102[(4'hd):(4'hb)] : (&(8'ha9))))));
          if ($signed(reg100))
            begin
              reg113 <= ((+((&wire94) ?
                  (~^(reg100 >> reg107)) : (&{wire95}))) >= wire93[(3'h5):(3'h4)]);
            end
          else
            begin
              reg113 <= (8'hbf);
              reg114 <= {(~^({$unsigned(wire93)} ?
                      $unsigned($signed(reg108)) : ({(8'hae)} ?
                          reg99 : $unsigned(reg113)))),
                  $signed(((|(&reg111)) ? reg113 : $unsigned($signed(reg98))))};
              reg115 <= (reg110[(4'hd):(4'hb)] || $unsigned($unsigned(wire90)));
              reg116 <= $unsigned(wire93);
              reg117 <= reg105;
            end
        end
    end
endmodule

module module47
#(parameter param85 = {(8'hbb)})
(y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire51;
  input wire [(5'h12):(1'h0)] wire50;
  input wire [(5'h10):(1'h0)] wire49;
  input wire signed [(4'hd):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
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
                 reg66,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire49))
        begin
          reg52 <= (wire50[(1'h0):(1'h0)] || $signed(wire48[(4'hd):(2'h3)]));
          if (((~wire49[(5'h10):(3'h4)]) >>> wire51[(1'h1):(1'h0)]))
            begin
              reg53 <= reg52[(3'h5):(3'h4)];
              reg54 <= (~&wire51[(2'h3):(1'h0)]);
              reg55 <= wire49[(4'hc):(4'h9)];
              reg56 <= ({$unsigned($unsigned((&wire48))),
                  $signed(((&wire48) && ((8'hb6) ?
                      wire50 : wire51)))} && $unsigned((((~|wire48) ?
                  (-wire50) : reg55[(3'h6):(1'h0)]) ~^ (~&(wire48 > wire48)))));
            end
          else
            begin
              reg53 <= ({$unsigned((8'hb6))} ?
                  reg53[(1'h1):(1'h0)] : $unsigned($signed($unsigned((~|reg56)))));
              reg54 <= $signed(($signed({(~&reg54)}) ?
                  reg53 : ($unsigned(wire49[(2'h2):(1'h0)]) ^~ reg55)));
              reg55 <= {reg54,
                  ($signed(wire51[(3'h4):(1'h1)]) ?
                      (-reg52) : reg52[(1'h0):(1'h0)])};
              reg56 <= reg56[(4'h9):(1'h1)];
              reg57 <= $signed($unsigned((($unsigned(wire51) ?
                  {(8'haf)} : $unsigned(wire49)) <<< {(reg56 >= reg53),
                  $signed(wire48)})));
            end
          reg58 <= reg55[(1'h0):(1'h0)];
        end
      else
        begin
          reg52 <= $unsigned((^~(~^(&(reg57 < wire48)))));
          reg53 <= reg53[(4'hc):(4'hb)];
          reg54 <= (-reg54);
          if ((((~&$signed($unsigned((8'hb9)))) == reg54) << (reg56[(4'h9):(3'h6)] ?
              {$unsigned({wire49}), (~|$signed((8'ha0)))} : (8'h9c))))
            begin
              reg55 <= (({$signed((~&reg54)), reg58[(4'hf):(4'hb)]} ?
                      reg53 : wire49[(4'hf):(1'h0)]) ?
                  {wire48[(4'h9):(4'h9)]} : (reg57 > ($unsigned(reg54) ?
                      ((reg53 ^ (8'ha5)) ?
                          $signed(wire51) : wire48[(3'h7):(3'h6)]) : (((8'ha0) || reg55) ?
                          $signed(wire49) : $signed((8'hb4))))));
              reg56 <= $signed(reg58);
            end
          else
            begin
              reg55 <= ((wire48[(4'h8):(2'h3)] ?
                  $signed(((^wire50) ?
                      (^reg56) : (8'ha5))) : {(wire48[(1'h0):(1'h0)] || (&reg57))}) & {$signed(((+reg54) - (&reg52))),
                  ($unsigned(reg57) ?
                      wire49 : ($unsigned(reg54) ?
                          reg52[(1'h0):(1'h0)] : (reg58 ? reg54 : reg55)))});
              reg56 <= reg56[(3'h5):(3'h4)];
              reg57 <= ($signed(((wire48 >= $unsigned(reg55)) ?
                      $signed($unsigned(wire48)) : (^(reg55 >> reg55)))) ?
                  (~(((wire48 ~^ wire48) + $unsigned(reg53)) ^ {(reg53 ?
                          wire51 : wire48),
                      {(8'hbd)}})) : (^{((wire50 ?
                          reg56 : reg53) ^~ reg56[(3'h5):(3'h5)]),
                      (8'hac)}));
              reg58 <= ((($signed({(8'hb0),
                      reg57}) > (+(|(8'hb5)))) & ({(reg56 & (8'hb0)),
                      (-(8'h9e))} < {(7'h42), {wire50}})) ?
                  reg55 : wire49);
            end
          reg59 <= $signed((~|reg52));
        end
    end
  assign wire60 = reg59;
  assign wire61 = $unsigned(reg59);
  assign wire62 = wire51[(3'h5):(2'h3)];
  assign wire63 = $unsigned(($unsigned(($signed(reg53) << $signed(reg57))) ?
                      (((wire48 - reg56) * (^reg53)) ?
                          $unsigned((wire61 ? wire61 : wire48)) : (reg56 ?
                              reg58[(4'ha):(3'h4)] : (8'hbb))) : (((wire60 != reg54) >= $unsigned(wire49)) ?
                          ((~^(8'haa)) ?
                              (reg57 == reg55) : (reg58 ^~ (7'h41))) : $signed((8'hbd)))));
  assign wire64 = (8'ha3);
  assign wire65 = {$signed($unsigned(((reg58 ? reg53 : reg55) ?
                          reg55 : (wire63 ? wire60 : wire60)))),
                      reg58};
  always
    @(posedge clk) begin
      reg66 <= $unsigned(((((!(8'hbd)) && wire49) & ({wire64} ?
          wire63[(1'h1):(1'h0)] : wire51)) & $signed(reg56[(3'h4):(1'h1)])));
    end
  assign wire67 = ((($signed($unsigned((8'h9e))) ?
                          $unsigned((wire60 << wire65)) : ((~|wire61) ?
                              (wire61 != wire61) : $unsigned(reg54))) <= wire60) ?
                      {(reg58[(2'h2):(1'h0)] ?
                              {((8'hbd) ? (8'ha3) : wire64),
                                  wire60[(4'he):(4'ha)]} : wire49),
                          (wire61[(4'h9):(2'h3)] << wire50[(1'h1):(1'h1)])} : $signed($signed((((8'ha1) ?
                          wire63 : reg55) >= wire65[(3'h7):(1'h0)]))));
  assign wire68 = (|((wire49 <= (&$unsigned((8'hb1)))) ?
                      (&reg56[(4'h9):(3'h4)]) : reg55[(2'h2):(1'h1)]));
  assign wire69 = ($signed((|wire62[(1'h0):(1'h0)])) ?
                      reg66[(4'h8):(4'h8)] : (reg55 != $unsigned(($signed(wire63) ?
                          wire67[(2'h2):(2'h2)] : wire68))));
  assign wire70 = wire50[(5'h12):(3'h5)];
  assign wire71 = reg59;
  always
    @(posedge clk) begin
      reg72 <= (({wire50[(2'h2):(1'h0)]} ?
              {$signed(wire65[(4'hb):(2'h3)])} : (({wire68, reg54} ?
                      ((8'ha8) ? wire69 : wire50) : wire48) ?
                  $signed(wire62[(2'h3):(1'h0)]) : wire71[(3'h6):(3'h5)])) ?
          {$unsigned((-$signed(reg66)))} : (wire67 <<< (($signed(wire67) <<< reg55[(4'h8):(3'h7)]) ?
              $signed({wire49, wire67}) : (^$unsigned(reg66)))));
      reg73 <= $unsigned($unsigned((~{$signed(wire60), (^~reg54)})));
      reg74 <= $signed(wire63);
      if ($signed((($unsigned($signed(reg66)) ?
          $unsigned((|reg56)) : reg52) >> $unsigned($unsigned($signed(reg54))))))
        begin
          reg75 <= (~^(^reg54));
          reg76 <= (&reg53[(4'hc):(2'h3)]);
          reg77 <= reg56;
          if ((8'hb2))
            begin
              reg78 <= $unsigned(wire70[(4'ha):(4'h8)]);
              reg79 <= (^(((&wire69[(3'h5):(1'h1)]) > (~$unsigned(wire62))) ?
                  ((^~(reg73 ? reg59 : (8'ha2))) ?
                      $signed((8'ha5)) : (8'hb3)) : (^(!$unsigned((8'h9f))))));
              reg80 <= $signed((+(wire65 || (7'h44))));
              reg81 <= ($unsigned(reg66) ?
                  ((({wire67} ? wire70[(3'h5):(2'h3)] : (wire51 > (8'ha7))) ?
                          (reg59 ?
                              reg56 : reg74[(1'h1):(1'h1)]) : reg52[(4'h9):(4'h8)]) ?
                      reg58 : wire67[(1'h0):(1'h0)]) : (~|$signed({{reg58,
                          wire69},
                      {(8'hae)}})));
            end
          else
            begin
              reg78 <= {$signed({(~|$signed(wire70))}),
                  {(($signed(wire48) & $unsigned(reg76)) << wire60[(2'h2):(1'h0)])}};
              reg79 <= wire62[(3'h5):(1'h0)];
              reg80 <= {$unsigned((reg79[(4'h8):(3'h5)] >= wire62[(1'h0):(1'h0)]))};
            end
        end
      else
        begin
          if (({$unsigned($signed(wire51))} == ($unsigned(wire64) ?
              (^~($signed(wire63) ~^ (8'hba))) : wire71)))
            begin
              reg75 <= $signed((((reg80 ?
                      {reg58, wire51} : reg80) == $signed({wire61, wire70})) ?
                  $unsigned($signed($signed(reg59))) : wire61));
              reg76 <= (({reg74} ?
                      reg53 : ((((8'haf) || (8'h9c)) ?
                              (8'h9d) : $unsigned((8'h9f))) ?
                          wire65 : reg58)) ?
                  (~|wire65) : (((-(wire48 ?
                          (8'hb3) : reg58)) > $unsigned((-wire50))) ?
                      reg72[(4'h9):(4'h8)] : ((-$signed(reg74)) + $unsigned((reg52 ~^ reg58)))));
              reg77 <= (reg59[(4'he):(4'h8)] | {$unsigned((reg52[(4'h8):(3'h5)] || (^~reg81)))});
              reg78 <= reg77;
            end
          else
            begin
              reg75 <= (!$unsigned(($unsigned(wire68[(3'h5):(3'h5)]) ?
                  ((wire69 <<< (7'h44)) & reg58) : (&$unsigned(reg59)))));
              reg76 <= (reg76 || wire51[(1'h1):(1'h1)]);
            end
          reg79 <= $unsigned((^$unsigned(reg56)));
          reg80 <= (wire60[(4'h8):(1'h1)] <<< wire62);
          reg81 <= (~^reg73);
          reg82 <= (($signed($unsigned(reg81)) ^~ (reg66[(1'h0):(1'h0)] ?
                  $signed({wire48}) : {$signed(wire63)})) ?
              {{($signed(wire61) ? (+wire67) : (~reg74))}} : (!reg54));
        end
    end
  assign wire83 = $signed($signed((~&{(wire61 ^ reg81), {(8'ha2), reg57}})));
  assign wire84 = (!(|(|((8'ha0) > $unsigned(reg74)))));
endmodule

module module27
#(parameter param43 = (^~({(7'h44)} ^~ (+(((8'h9c) > (8'hbc)) * {(7'h43), (8'had)})))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire31;
  input wire [(4'h8):(1'h0)] wire30;
  input wire signed [(5'h13):(1'h0)] wire29;
  input wire [(3'h6):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire32 = {((~wire30) != $signed($unsigned(wire31[(3'h7):(2'h2)]))),
                      wire29[(3'h6):(1'h1)]};
  assign wire33 = $unsigned(wire28[(3'h4):(2'h3)]);
  assign wire34 = (((wire28 || $signed($unsigned(wire28))) ?
                      wire31 : $unsigned($unsigned((wire29 ?
                          wire31 : wire32)))) | wire31[(3'h4):(1'h0)]);
  assign wire35 = wire34;
  assign wire36 = ((+$signed(wire34[(4'h9):(4'h9)])) << ({wire31} ?
                      ($unsigned(wire31[(3'h7):(2'h2)]) >> (~^$signed(wire31))) : (((wire28 ?
                              wire32 : wire29) ?
                          (wire35 ?
                              wire28 : wire31) : (wire29 ^~ wire28)) * $signed((~&wire31)))));
  always
    @(posedge clk) begin
      reg37 <= (~(^wire31[(4'hf):(2'h3)]));
      reg38 <= {$unsigned((8'ha3)), reg37[(1'h0):(1'h0)]};
      reg39 <= $signed($signed(wire34[(3'h4):(2'h3)]));
      reg40 <= wire31[(4'ha):(2'h3)];
    end
  assign wire41 = wire29[(5'h10):(4'hd)];
  assign wire42 = {reg37[(1'h1):(1'h0)]};
endmodule
