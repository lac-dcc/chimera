module top
#(parameter param180 = ({(-((~(8'hb4)) ? (&(8'hb6)) : {(8'hb7)})), (~^(~^((7'h44) ? (8'haf) : (7'h43))))} ? ({(((7'h43) ? (8'haf) : (7'h41)) << (~&(8'ha8)))} ? (~|(((8'had) - (8'hac)) ? ((8'hbd) ? (8'hb1) : (8'hbd)) : (!(8'hb4)))) : ((((8'hae) ? (8'hb7) : (8'h9c)) & ((8'hb6) >>> (8'hb5))) ? {((8'hb7) ? (8'hac) : (8'hbb))} : (((8'hb8) | (8'hbe)) ? (~&(8'h9d)) : ((8'hbd) ? (8'hb5) : (8'ha9))))) : (~^({(~(8'hac)), ((8'hbb) ? (8'hb5) : (8'hb0))} ? ({(8'hb9)} ? ((8'hb4) || (8'hb0)) : (!(8'hb8))) : (((8'hb5) ? (7'h44) : (8'ha9)) ? ((8'h9d) ? (8'haf) : (8'haf)) : ((8'hb1) ? (8'ha3) : (8'ha8)))))), 
parameter param181 = ((((7'h41) >= (param180 != (+param180))) | ({param180} ? (~&param180) : (&param180))) ^ (((8'hb7) ? (^~(param180 ? (8'h9e) : (8'ha7))) : {((8'ha9) ? param180 : param180), (param180 == param180)}) ? (param180 ? ((param180 ? param180 : param180) > ((8'hbb) != param180)) : (^(param180 ? param180 : param180))) : {param180})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire179;
  wire signed [(5'h10):(1'h0)] wire178;
  wire [(4'hb):(1'h0)] wire177;
  wire signed [(5'h11):(1'h0)] wire167;
  wire signed [(5'h15):(1'h0)] wire166;
  wire signed [(5'h11):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire163;
  wire [(2'h2):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg175 = (1'h0);
  reg [(2'h2):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg173 = (1'h0);
  reg [(3'h6):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg171 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg168 = (1'h0);
  assign y = {wire179,
                 wire178,
                 wire177,
                 wire167,
                 wire166,
                 wire165,
                 wire163,
                 wire5,
                 wire4,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 (1'h0)};
  assign wire4 = ($signed($signed(wire0[(1'h1):(1'h0)])) ?
                     (($signed(wire3) < {$unsigned((8'ha6)), wire1}) ?
                         (wire3[(4'h8):(2'h3)] ?
                             $unsigned($unsigned(wire2)) : ($signed(wire2) ?
                                 (wire0 ?
                                     (7'h40) : (8'ha3)) : wire1)) : (wire0 ^ (|wire2))) : (!{(wire0[(1'h1):(1'h1)] ?
                             (wire1 ? wire3 : wire1) : wire3)}));
  assign wire5 = wire2;
  module6 #() modinst164 (wire163, clk, wire3, wire2, wire1, wire4);
  assign wire165 = (wire2 ? wire4 : wire1[(2'h3):(1'h1)]);
  assign wire166 = (8'h9d);
  assign wire167 = ((((wire3[(3'h5):(1'h1)] ?
                               wire2 : {(8'hbe), wire3}) >= wire1) ?
                           $unsigned((wire3[(3'h7):(3'h7)] ?
                               $unsigned(wire1) : (wire3 <<< wire5))) : (wire4 ?
                               (~&$signed(wire0)) : (((8'ha4) > wire5) ?
                                   $unsigned(wire0) : $unsigned(wire3)))) ?
                       ((((~&wire3) <<< $signed(wire0)) ?
                               wire163[(1'h0):(1'h0)] : (~|wire4)) ?
                           $signed(wire5[(2'h2):(1'h0)]) : (8'hb9)) : ($signed(((8'hbe) ?
                           (&wire165) : (~^(8'haa)))) << (|$unsigned({wire2}))));
  always
    @(posedge clk) begin
      reg168 <= (wire4 | ($unsigned({$unsigned(wire2),
          wire166}) == wire1[(4'h9):(3'h5)]));
      reg169 <= (!$unsigned($signed($unsigned({wire165}))));
      if ((~&({{(wire163 ? wire166 : wire5)},
          (~&reg169[(2'h2):(1'h0)])} ^~ ((&$unsigned((8'ha7))) || reg169[(3'h6):(3'h4)]))))
        begin
          if ((($unsigned(reg169) ?
                  wire166[(4'hd):(4'h8)] : $signed((^~$signed(wire163)))) ?
              wire1 : (~&reg169)))
            begin
              reg170 <= ((~wire1[(4'ha):(3'h4)]) ?
                  {wire165,
                      $signed(({(8'ha8),
                          wire167} ~^ $signed(wire2)))} : $signed(wire2[(3'h6):(1'h1)]));
              reg171 <= $signed((wire1 ?
                  (wire167[(5'h11):(3'h6)] | $unsigned($unsigned((8'hb9)))) : wire0[(1'h1):(1'h1)]));
              reg172 <= {{wire5[(1'h0):(1'h0)], $unsigned(wire0)}};
              reg173 <= $unsigned(wire5);
              reg174 <= $unsigned(wire3);
            end
          else
            begin
              reg170 <= {(reg171[(3'h5):(3'h5)] && wire2), reg174};
              reg171 <= reg169;
            end
          reg175 <= reg171;
        end
      else
        begin
          if ((reg173 ?
              (wire1 + $signed(($signed(reg170) ?
                  (reg172 ?
                      wire167 : wire3) : (reg175 <= reg172)))) : $unsigned((|((reg168 ?
                  wire1 : (8'h9e)) * wire163)))))
            begin
              reg170 <= {$signed($signed($signed(reg169))), reg175};
            end
          else
            begin
              reg170 <= (((wire165 != (wire167[(3'h7):(1'h0)] ?
                  (wire165 ?
                      wire1 : wire0) : wire4[(1'h1):(1'h0)])) <<< {$unsigned($unsigned((7'h42)))}) < ((reg170 ?
                  $unsigned(wire3[(1'h0):(1'h0)]) : (wire165 ?
                      $signed(reg175) : wire0[(2'h3):(2'h3)])) << (|(((8'ha9) * wire5) >= (wire2 ?
                  (8'ha1) : wire166)))));
              reg171 <= reg173;
            end
          reg172 <= reg173[(2'h3):(1'h0)];
          reg173 <= ($signed(reg168) || reg171[(5'h11):(3'h5)]);
          reg174 <= {((8'hbd) ?
                  $signed(($signed(wire0) << wire0[(2'h3):(2'h2)])) : (wire166[(4'he):(1'h0)] ?
                      $unsigned((~&wire166)) : {$unsigned((8'hb3)), wire2}))};
          reg175 <= (^~$signed(reg172));
        end
      reg176 <= wire165[(4'hf):(3'h7)];
    end
  assign wire177 = (|(-{(-wire166[(3'h5):(2'h3)])}));
  assign wire178 = $signed($signed($unsigned(wire0)));
  assign wire179 = $signed($signed((($unsigned(reg174) ?
                       reg172 : wire178[(4'h8):(3'h6)]) >>> $unsigned(reg172))));
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire161;
  wire signed [(4'hb):(1'h0)] wire144;
  wire [(4'hd):(1'h0)] wire143;
  wire [(5'h13):(1'h0)] wire142;
  wire signed [(4'h8):(1'h0)] wire141;
  wire signed [(4'hb):(1'h0)] wire127;
  wire signed [(5'h13):(1'h0)] wire126;
  wire [(3'h5):(1'h0)] wire125;
  wire [(3'h5):(1'h0)] wire123;
  wire [(3'h6):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire33;
  reg [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(5'h15):(1'h0)] reg128 = (1'h0);
  assign y = {wire161,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire127,
                 wire126,
                 wire125,
                 wire123,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
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
                 (1'h0)};
  module11 #() modinst34 (wire33, clk, wire10, wire7, wire9, wire8);
  assign wire35 = $signed(({$signed(wire9)} ?
                      $unsigned($signed($signed(wire33))) : ($signed($unsigned(wire8)) >> wire33[(3'h4):(2'h3)])));
  assign wire36 = (8'hbb);
  assign wire37 = wire8;
  module38 #() modinst124 (wire123, clk, wire8, wire36, wire35, wire10);
  assign wire125 = wire36;
  assign wire126 = ($unsigned(wire9[(5'h14):(4'hc)]) + $unsigned((~(8'h9d))));
  assign wire127 = (((^~{wire36[(3'h6):(3'h5)], (wire125 ? (8'hb0) : wire10)}) ?
                           (^~((7'h41) <= {wire33,
                               (8'ha6)})) : $unsigned((^~$signed(wire126)))) ?
                       wire123[(3'h5):(3'h5)] : wire35[(5'h10):(2'h3)]);
  always
    @(posedge clk) begin
      reg128 <= ((((8'haa) ?
          ($unsigned(wire36) ?
              ((7'h41) < wire37) : $unsigned((7'h41))) : (~&(wire33 ?
              wire125 : wire9))) ~^ {wire127[(1'h0):(1'h0)],
          ((8'hb0) ?
              wire9[(5'h15):(1'h1)] : wire8[(2'h3):(2'h3)])}) - ({wire9} * wire127));
      reg129 <= $unsigned(wire33);
      reg130 <= (wire8 << reg128[(5'h13):(2'h3)]);
      reg131 <= (8'hab);
      reg132 <= (|$unsigned(reg129[(4'hb):(4'ha)]));
    end
  always
    @(posedge clk) begin
      reg133 <= (~&($unsigned($signed(wire7)) ?
          (wire10[(3'h6):(2'h3)] ?
              $unsigned((~^wire9)) : reg128[(1'h0):(1'h0)]) : $unsigned(wire37)));
      reg134 <= $signed(reg128[(5'h15):(4'h8)]);
      if ((^~{wire10[(2'h2):(1'h1)]}))
        begin
          reg135 <= (~^(8'hbc));
          if ({($signed(wire127) ?
                  wire127[(4'hb):(4'h9)] : $signed($signed($unsigned(wire37))))})
            begin
              reg136 <= $unsigned(wire8[(3'h5):(1'h0)]);
              reg137 <= $signed(wire9);
              reg138 <= (wire7 ?
                  ((8'hb3) ? $signed((+{wire10})) : (8'hab)) : (8'ha1));
            end
          else
            begin
              reg136 <= $signed(reg132);
            end
          reg139 <= ((^$unsigned(reg128[(4'ha):(3'h7)])) ?
              wire8[(4'h9):(1'h1)] : {(reg133[(4'h9):(3'h4)] > $unsigned({wire123}))});
        end
      else
        begin
          reg135 <= reg138[(2'h3):(2'h3)];
          reg136 <= ((!(wire125 ?
                  ($unsigned((8'hb2)) && $signed((7'h43))) : ((reg136 | (8'ha3)) >= $signed(wire127)))) ?
              $signed($unsigned($unsigned($unsigned(reg137)))) : $unsigned({reg133[(4'h9):(2'h3)],
                  ($unsigned(wire8) ? $signed(reg131) : (reg133 & wire10))}));
        end
      reg140 <= reg132;
    end
  assign wire141 = reg133;
  assign wire142 = (wire10 ? wire126 : {$unsigned(wire9)});
  assign wire143 = $signed((^reg131));
  assign wire144 = ((reg129[(4'hd):(4'hc)] * wire123) ?
                       $unsigned((wire9 && $signed((wire142 ?
                           wire126 : wire143)))) : (wire143[(1'h1):(1'h1)] << {reg133}));
  module145 #() modinst162 (wire161, clk, wire7, reg136, reg128, wire142);
endmodule

module module145  (y, clk, wire149, wire148, wire147, wire146);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire149;
  input wire [(2'h3):(1'h0)] wire148;
  input wire [(4'hb):(1'h0)] wire147;
  input wire signed [(4'hc):(1'h0)] wire146;
  wire signed [(5'h11):(1'h0)] wire160;
  wire [(5'h15):(1'h0)] wire159;
  wire signed [(3'h4):(1'h0)] wire156;
  wire [(2'h2):(1'h0)] wire155;
  wire signed [(5'h13):(1'h0)] wire154;
  wire [(4'hc):(1'h0)] wire153;
  wire signed [(4'h9):(1'h0)] wire152;
  wire signed [(4'hc):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire150;
  reg signed [(2'h2):(1'h0)] reg158 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg157 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 reg158,
                 reg157,
                 (1'h0)};
  assign wire150 = wire148[(2'h3):(1'h1)];
  assign wire151 = wire146;
  assign wire152 = $unsigned({((~|(wire148 ? wire149 : wire149)) ?
                           wire150[(5'h15):(4'hd)] : $signed((wire150 ?
                               wire147 : wire147))),
                       wire146});
  assign wire153 = $signed({wire148[(2'h2):(1'h1)], (~|wire149)});
  assign wire154 = $unsigned(wire153);
  assign wire155 = ($signed(((+(wire153 ^ wire149)) ?
                           (wire148 ?
                               (wire150 && wire154) : $signed(wire151)) : wire147)) ?
                       wire146[(1'h0):(1'h0)] : ($signed(wire147) || (|((wire154 >= wire151) ?
                           {wire152, wire153} : {wire152, wire148}))));
  assign wire156 = ($unsigned((($unsigned(wire146) ?
                               (wire149 >>> wire147) : (wire154 ?
                                   wire153 : wire149)) ?
                           $signed(wire149) : wire152)) ?
                       {(((~^(7'h41)) ?
                               ((8'hb5) != wire151) : (wire147 >> wire151)) >= wire150)} : $unsigned(wire148[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg157 <= $signed(wire151);
      reg158 <= ($unsigned(wire147) != {((&wire150) ?
              $unsigned((~wire151)) : ((~&wire150) ?
                  wire146 : wire152[(4'h8):(3'h4)]))});
    end
  assign wire159 = $unsigned(wire149);
  assign wire160 = $signed({$signed({wire147[(4'h8):(1'h1)],
                           (wire149 ? wire159 : wire156)})});
endmodule

module module38
#(parameter param121 = ({(((-(7'h40)) || {(8'hb6), (8'hbc)}) >= {(-(8'had))})} ? ((|(!(~&(8'ha7)))) > {(~(^(7'h41)))}) : (({((8'ha2) ? (8'hbb) : (7'h43)), ((8'ha4) == (8'h9f))} + ((~|(7'h44)) ^ ((8'ha7) ? (8'ha4) : (8'ha9)))) ? {((|(8'hb6)) ~^ ((8'hae) ? (8'h9d) : (8'haa))), {(^(8'ha8))}} : (-{((8'hb2) & (8'ha6)), {(8'hbd)}}))), 
parameter param122 = param121)
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h3c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire42;
  input wire signed [(5'h10):(1'h0)] wire41;
  input wire [(3'h4):(1'h0)] wire40;
  input wire [(4'hd):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire118;
  wire [(4'h9):(1'h0)] wire117;
  wire signed [(4'ha):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire43;
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire50,
                 wire49,
                 wire43,
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
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
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
                 reg51,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire43 = wire42[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg44 <= ($unsigned($unsigned($signed((8'ha4)))) ?
          $signed(wire43) : wire43);
      reg45 <= {$signed($unsigned(wire42))};
      reg46 <= (|$signed(wire43));
      reg47 <= $signed({($unsigned((!reg44)) ?
              ({reg46} ?
                  (reg44 ? wire39 : (8'hbd)) : (&wire42)) : $signed(wire41))});
      reg48 <= $signed(((8'hac) * (~({reg47} ?
          (^wire40) : (wire43 ? wire42 : wire39)))));
    end
  assign wire49 = $unsigned((~(reg44[(2'h3):(1'h0)] < ((reg45 * reg44) >= reg45[(3'h6):(3'h4)]))));
  assign wire50 = {($unsigned(wire40[(3'h4):(1'h0)]) ^ $unsigned(wire42[(2'h3):(1'h1)])),
                      $signed(wire39)};
  always
    @(posedge clk) begin
      reg51 <= ((!$unsigned(wire50[(4'hb):(3'h6)])) <<< $unsigned($unsigned({(~^wire49)})));
      reg52 <= (!$unsigned((-(~|$unsigned(wire50)))));
      if ((-$unsigned(wire40)))
        begin
          reg53 <= $signed(wire41[(2'h2):(2'h2)]);
        end
      else
        begin
          if ($unsigned((wire41 <= reg46[(4'hc):(3'h7)])))
            begin
              reg53 <= (~^$signed({(^(~reg53))}));
              reg54 <= {$unsigned((~|(+(8'hbd))))};
              reg55 <= ($signed($signed(($signed(reg46) ?
                      $signed(wire49) : $unsigned(wire41)))) ?
                  $unsigned(reg53[(4'hb):(3'h7)]) : (reg54 << (wire43 ^ $unsigned(reg54[(5'h15):(4'hd)]))));
              reg56 <= reg52[(4'hb):(1'h1)];
            end
          else
            begin
              reg53 <= {($signed($signed((~|reg51))) ^ wire43[(5'h15):(3'h6)]),
                  $unsigned($signed(reg51[(4'h9):(2'h2)]))};
              reg54 <= (($unsigned($unsigned((reg51 ?
                      (8'haa) : wire49))) ^~ $signed((wire49[(4'ha):(1'h1)] ?
                      {reg56} : (wire50 ? wire42 : reg44)))) ?
                  $signed((reg45 >> $signed({reg56,
                      wire42}))) : ($signed(($unsigned(reg54) ?
                      $signed((8'hb0)) : $signed(reg52))) ^ wire42[(3'h6):(3'h6)]));
              reg55 <= reg52[(3'h7):(3'h6)];
              reg56 <= {reg45[(3'h4):(1'h0)],
                  $signed((|((~wire50) ^~ $unsigned(wire49))))};
            end
          reg57 <= ({(wire39 ?
                      ((^wire39) & reg48[(2'h2):(1'h0)]) : reg48[(1'h1):(1'h0)])} ?
              $signed({{reg53[(4'hb):(3'h5)], $unsigned(wire43)}}) : (~|reg54));
          reg58 <= $signed($signed($unsigned(((reg44 >= reg48) << reg46[(3'h5):(3'h4)]))));
          reg59 <= reg54;
        end
      reg60 <= wire50;
      if ((wire40[(2'h2):(2'h2)] > $unsigned($signed((&wire50)))))
        begin
          reg61 <= ($signed((((~wire49) ?
                  $unsigned(reg55) : (wire42 ?
                      wire49 : reg54)) * ($unsigned(reg58) ?
                  $unsigned(wire49) : (wire39 ? wire41 : (8'h9f))))) ?
              reg60 : wire40[(1'h0):(1'h0)]);
          if ($unsigned((+$signed($unsigned({reg47, wire40})))))
            begin
              reg62 <= reg51[(3'h5):(2'h3)];
            end
          else
            begin
              reg62 <= reg61;
            end
          if ((wire40 ?
              (((reg53 ?
                  {wire42} : (reg61 ^~ wire40)) | (8'hb9)) - (($unsigned(reg45) >= wire42) > $unsigned((reg62 & (8'hbb))))) : (reg61[(1'h1):(1'h0)] ?
                  ((~&$signed(wire50)) ?
                      {(~reg48)} : reg61) : {(^$signed(wire39))})))
            begin
              reg63 <= (^~$unsigned((+((reg45 | reg47) ?
                  (~reg51) : $signed(reg48)))));
              reg64 <= (8'haa);
              reg65 <= (reg44[(2'h2):(1'h1)] ?
                  ((8'hb8) ?
                      $signed(($unsigned(wire40) ?
                          $signed(reg45) : (reg62 ~^ reg60))) : $signed((reg45[(1'h0):(1'h0)] == $unsigned(reg55)))) : (8'hb9));
              reg66 <= wire41;
              reg67 <= ((8'ha3) ?
                  wire39[(3'h7):(2'h2)] : ((reg59[(1'h0):(1'h0)] != (~reg45[(2'h3):(1'h1)])) ?
                      $unsigned(wire43) : (8'haf)));
            end
          else
            begin
              reg63 <= (reg53 ?
                  (reg54 ^ $unsigned(($signed(reg63) ?
                      {reg57,
                          reg61} : wire42))) : ((reg60 > $unsigned((wire50 || reg67))) == wire50[(2'h2):(2'h2)]));
              reg64 <= ($signed($signed(($unsigned(reg51) ?
                      (reg53 < reg55) : $signed(reg51)))) ?
                  wire39[(3'h6):(3'h6)] : {reg55[(3'h7):(3'h5)],
                      ((~|$unsigned(wire39)) <= (^~$signed(wire43)))});
              reg65 <= {{$signed((~&reg62)),
                      ($signed($unsigned(reg45)) < reg60)},
                  $unsigned($unsigned(((reg61 ?
                      reg57 : wire49) >> reg48[(4'hd):(3'h5)])))};
            end
          reg68 <= ((($unsigned({reg58}) << wire50[(4'hc):(1'h1)]) ?
                  reg64[(3'h6):(2'h2)] : (reg63[(1'h0):(1'h0)] && {$unsigned(reg62)})) ?
              $unsigned(reg46[(5'h11):(3'h5)]) : {($signed((!(8'hac))) | ((wire49 < wire42) ?
                      (reg46 ? reg48 : reg59) : wire40))});
          reg69 <= ($unsigned($signed(reg47)) ~^ ($signed($signed((reg64 + reg56))) <<< (((^~reg45) ?
              (8'hb1) : (~&(8'hb6))) + ((reg45 ? reg53 : reg56) ?
              reg59[(2'h2):(2'h2)] : (^reg65)))));
        end
      else
        begin
          if ($signed((reg60[(3'h4):(1'h0)] << $signed(reg51[(3'h4):(3'h4)]))))
            begin
              reg61 <= (reg55[(4'hb):(3'h6)] ~^ (reg64[(4'h8):(2'h3)] & $signed($signed((wire50 ?
                  reg46 : wire43)))));
              reg62 <= wire49;
              reg63 <= reg46[(5'h10):(4'hc)];
              reg64 <= (($signed($unsigned((reg46 | reg66))) ?
                  (-$unsigned($signed(reg61))) : $unsigned(wire49)) < $signed({(8'hb9)}));
              reg65 <= $signed($unsigned(($unsigned($signed(reg44)) ?
                  ({reg52, (8'hbc)} < ((8'ha1) ?
                      reg48 : reg54)) : (reg60[(1'h0):(1'h0)] && wire39[(4'hd):(2'h2)]))));
            end
          else
            begin
              reg61 <= $signed(((~&($unsigned(reg55) ~^ {(8'hae),
                  reg58})) ^ (((reg44 ? reg60 : wire39) ?
                      ((8'h9f) >> reg57) : (reg44 < wire50)) ?
                  reg64 : $signed(((8'had) ? reg55 : wire40)))));
              reg62 <= {(reg68 ~^ reg47)};
              reg63 <= {{((wire41[(4'h9):(1'h0)] ?
                              {wire41, (8'hb1)} : wire39[(4'hb):(3'h4)]) ?
                          $signed({reg68, wire39}) : reg57[(2'h3):(2'h2)])}};
              reg64 <= (^reg56[(1'h1):(1'h1)]);
            end
          reg66 <= wire41[(3'h5):(3'h4)];
          if ($signed((+reg69[(2'h3):(1'h0)])))
            begin
              reg67 <= $signed($signed(wire43[(4'he):(3'h6)]));
              reg68 <= (~{($signed((~&reg58)) >>> {{reg58, reg59}})});
            end
          else
            begin
              reg67 <= (((&reg66[(1'h0):(1'h0)]) ?
                  (($signed(reg47) ? (reg64 ? reg44 : reg66) : reg69) ?
                      ($unsigned(reg53) ?
                          reg63[(2'h3):(2'h2)] : $signed(wire41)) : $unsigned((reg66 ?
                          wire39 : wire39))) : $signed({(wire43 ?
                          reg54 : wire40)})) * wire41);
              reg68 <= $signed(({(~^(wire40 ? wire49 : reg57))} ?
                  (7'h42) : reg65[(1'h0):(1'h0)]));
            end
          reg69 <= ($signed((|(^~$signed((8'h9c))))) >= wire50);
        end
    end
  assign wire70 = reg67;
  assign wire71 = $signed((^reg57));
  assign wire72 = (&{$unsigned((8'h9f)),
                      ((-$signed(reg56)) ?
                          ((reg47 && wire71) ?
                              reg56[(5'h12):(4'h8)] : $signed(reg53)) : reg64)});
  assign wire73 = (&(((!$signed(reg53)) <<< (&reg57)) || $signed($unsigned({reg51,
                      reg58}))));
  always
    @(posedge clk) begin
      if (({(^$signed(((8'hb7) ? reg51 : reg45))),
              (wire39[(1'h1):(1'h1)] ?
                  ((reg56 ? (8'ha8) : reg48) ?
                      {reg62, (8'hbc)} : (~&reg44)) : ({wire72, reg69} ?
                      (|reg45) : $signed(reg46)))} ?
          (&reg59[(1'h0):(1'h0)]) : {reg47[(4'ha):(3'h6)],
              (reg47[(4'hb):(2'h3)] ?
                  (+wire73) : ($unsigned(reg61) ?
                      $signed(wire71) : reg54[(3'h7):(3'h4)]))}))
        begin
          reg74 <= $signed(wire49);
          reg75 <= $signed((|{$unsigned($signed(reg48)),
              (reg55 ~^ $unsigned(reg74))}));
          reg76 <= reg47;
        end
      else
        begin
          reg74 <= $unsigned(($unsigned($signed($unsigned((8'hbb)))) ^ reg60));
          if ((~|(^reg75)))
            begin
              reg75 <= wire39;
              reg76 <= reg51[(4'hb):(2'h2)];
              reg77 <= $signed(((8'haf) ?
                  reg51[(3'h4):(2'h3)] : wire40[(1'h1):(1'h0)]));
            end
          else
            begin
              reg75 <= reg74;
            end
          reg78 <= $signed(($signed((8'ha4)) == {$signed($unsigned(reg47))}));
          if (reg76[(1'h0):(1'h0)])
            begin
              reg79 <= $unsigned({(((~|(7'h43)) ?
                      (wire41 ? reg54 : reg66) : (-(8'hac))) || reg58)});
              reg80 <= {{(-((reg53 & (8'haa)) ? $signed(reg45) : (~wire43)))}};
            end
          else
            begin
              reg79 <= reg57[(1'h0):(1'h0)];
              reg80 <= {(+$signed(((&(8'haf)) ?
                      reg67[(4'hc):(4'ha)] : $signed(reg80))))};
              reg81 <= ($signed((((reg74 ? reg60 : wire70) ?
                      $unsigned(reg51) : (-wire72)) ?
                  $signed({wire70}) : (~|(reg68 ?
                      wire43 : reg54)))) == (&(((8'hb7) ?
                  wire50 : (reg51 ?
                      reg55 : reg53)) > $unsigned(reg69[(3'h5):(1'h0)]))));
              reg82 <= (+{$signed(($unsigned(reg47) && {reg45}))});
            end
          reg83 <= reg55;
        end
      if (reg79)
        begin
          if ({$signed({wire42[(1'h0):(1'h0)], ((-wire70) & wire39)})})
            begin
              reg84 <= ($unsigned((((reg54 ?
                  reg77 : wire49) ~^ (~|reg45)) | reg80[(1'h1):(1'h0)])) && $signed($unsigned((~^{reg45}))));
              reg85 <= ({$signed((~|$unsigned(reg51))), (&$unsigned(wire41))} ?
                  $signed(reg74) : (^~wire41));
              reg86 <= ((8'hba) ?
                  ({reg55,
                      $unsigned($signed(wire43))} << $unsigned(reg66)) : reg84);
            end
          else
            begin
              reg84 <= (|(($signed(reg78) - reg47[(3'h6):(2'h3)]) ?
                  $unsigned($unsigned((reg45 ?
                      (8'ha2) : (8'ha4)))) : (((reg80 ^ reg63) ?
                          reg58[(1'h0):(1'h0)] : reg69) ?
                      reg51 : (~|((8'hac) >> wire49)))));
            end
          reg87 <= $signed($signed($signed($signed({(8'ha7)}))));
          reg88 <= (|($signed(($signed(reg68) ?
              (reg67 == reg47) : $unsigned(wire71))) ^ reg51[(1'h0):(1'h0)]));
          reg89 <= $signed(({$signed($signed((8'hb4))), reg68[(1'h1):(1'h0)]} ?
              (($unsigned((8'haa)) & {reg62}) ^~ (reg79[(3'h7):(3'h4)] * reg63)) : $unsigned(((+reg54) - reg63[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg84 <= reg45;
          reg85 <= reg46[(4'ha):(3'h7)];
        end
      if ((|({reg62} <<< (-reg85[(2'h3):(1'h0)]))))
        begin
          if ((((|($signed(reg69) ? $unsigned(reg44) : reg75)) ?
                  (reg48 ?
                      $signed((reg61 >> reg54)) : reg87) : wire49[(4'h8):(3'h4)]) ?
              (8'hae) : reg81[(1'h1):(1'h0)]))
            begin
              reg90 <= $signed((~^$unsigned($signed((!reg85)))));
              reg91 <= (~^reg67);
              reg92 <= (-{reg85[(3'h4):(2'h3)]});
              reg93 <= $unsigned($signed($signed(($unsigned(reg86) << reg52))));
            end
          else
            begin
              reg90 <= (~(^$signed(((+(8'ha8)) || (reg54 ? wire39 : reg65)))));
              reg91 <= reg82[(1'h0):(1'h0)];
              reg92 <= $signed($signed(reg64));
              reg93 <= {(+reg74[(4'hf):(4'ha)]), (8'hae)};
            end
          if ((^~$signed(wire50)))
            begin
              reg94 <= reg83[(3'h7):(1'h1)];
              reg95 <= ((reg61[(2'h3):(2'h2)] ?
                  $signed((~{reg57})) : (|reg92)) * ({reg89,
                      ({wire42, reg51} ?
                          reg91[(2'h2):(2'h2)] : ((8'hbd) ? reg76 : reg76))} ?
                  reg55 : $unsigned($signed({reg86, (8'hb7)}))));
            end
          else
            begin
              reg94 <= $unsigned(wire49);
            end
          reg96 <= $unsigned(reg91);
          reg97 <= (((^wire42[(2'h3):(1'h0)]) || (^~reg86)) ?
              (reg85[(2'h3):(1'h0)] ?
                  reg74 : $unsigned(((reg66 - reg75) ?
                      (&wire41) : (reg84 ?
                          reg81 : wire72)))) : $unsigned(wire49));
          reg98 <= $unsigned($unsigned((~^$unsigned((wire39 ?
              reg93 : reg60)))));
        end
      else
        begin
          reg90 <= wire42;
          reg91 <= ({(|(8'hb3))} ? reg62[(4'hd):(4'ha)] : reg62[(4'h8):(4'h8)]);
        end
      reg99 <= $unsigned(reg57);
    end
  always
    @(posedge clk) begin
      reg100 <= reg98;
      reg101 <= {wire73, (~&$signed((~|{wire50, reg83})))};
      reg102 <= (8'hb2);
      if ($signed($signed(reg79)))
        begin
          reg103 <= (~&reg87[(1'h0):(1'h0)]);
          if ((8'hb8))
            begin
              reg104 <= $signed(reg63);
              reg105 <= reg44;
              reg106 <= (+(reg48[(4'h8):(1'h1)] != $signed((7'h44))));
            end
          else
            begin
              reg104 <= $signed($unsigned($signed(reg89[(4'h8):(2'h2)])));
            end
          if ($unsigned((reg82 != $signed(reg68[(1'h0):(1'h0)]))))
            begin
              reg107 <= $signed(reg93[(1'h1):(1'h1)]);
              reg108 <= $signed((reg103 ?
                  ($signed($signed(wire39)) ?
                      (~^$signed(reg65)) : reg94[(4'hb):(2'h2)]) : ($unsigned(reg62) ?
                      ((reg88 && reg48) ?
                          (^wire41) : $unsigned(reg60)) : reg87[(4'hf):(2'h3)])));
            end
          else
            begin
              reg107 <= reg105;
              reg108 <= $unsigned((&($unsigned((reg108 ?
                  reg67 : reg84)) > $unsigned({reg60}))));
              reg109 <= ((&reg108[(5'h10):(2'h3)]) >>> {$signed($unsigned($unsigned(reg58)))});
              reg110 <= (^~reg83);
            end
          reg111 <= (^((8'hae) ?
              (8'hb9) : $signed(($signed(reg87) >>> (reg80 != reg57)))));
          if ($signed(((~$signed((reg101 ? reg107 : (8'ha5)))) ?
              $signed((8'hb6)) : (((~&wire39) ?
                  $unsigned(reg46) : $unsigned(reg60)) < $signed($unsigned(reg59))))))
            begin
              reg112 <= reg64[(3'h7):(1'h0)];
              reg113 <= ($signed(wire73[(2'h3):(2'h2)]) - $signed((reg111[(4'hd):(4'ha)] ~^ reg74)));
              reg114 <= wire39[(4'hc):(4'hb)];
              reg115 <= {$signed($signed(reg52[(2'h3):(1'h1)])),
                  ($signed(reg81[(4'hc):(1'h1)]) ~^ wire41[(4'hd):(3'h7)])};
              reg116 <= (({$signed($unsigned(reg81))} ?
                  (reg83 ?
                      (~(reg47 < reg68)) : $signed((+reg89))) : reg109[(4'h8):(2'h2)]) && ($unsigned((~&(!reg53))) + (+$signed(reg54[(4'he):(3'h4)]))));
            end
          else
            begin
              reg112 <= ({$signed(reg46[(1'h1):(1'h1)])} ?
                  {(!((reg88 & (8'ha3)) && $unsigned(reg69))),
                      (!((reg101 ? wire40 : (8'hb0)) ?
                          (reg84 ?
                              reg84 : reg51) : $unsigned(reg106)))} : ((reg94[(1'h1):(1'h0)] && ((8'ha2) ?
                      wire39 : reg103[(3'h7):(1'h0)])) <= reg91));
              reg113 <= (8'ha8);
              reg114 <= $unsigned(((~&(wire72 ?
                  $unsigned(reg61) : (!reg45))) <<< $signed(((reg63 ?
                      (8'ha7) : reg75) ?
                  reg84[(4'hc):(3'h5)] : {wire50}))));
            end
        end
      else
        begin
          reg103 <= (reg88[(2'h2):(1'h0)] ?
              (&((8'hb3) ~^ reg111[(2'h2):(1'h0)])) : (-(^~{reg108[(5'h12):(5'h11)],
                  $unsigned(reg92)})));
          reg104 <= $signed(({(+reg85), wire40[(3'h4):(1'h0)]} ~^ reg98));
          if ($signed((|(|(&(reg60 != (8'hb8)))))))
            begin
              reg105 <= reg66;
              reg106 <= $signed((reg56 ?
                  reg98 : $unsigned({(+reg74), $unsigned(reg77)})));
            end
          else
            begin
              reg105 <= ((8'haf) != $unsigned((+({reg100} | $signed(reg87)))));
              reg106 <= reg94[(3'h7):(2'h3)];
            end
        end
    end
  assign wire117 = ((-reg107[(3'h6):(3'h4)]) ?
                       $signed((^reg111[(4'hb):(3'h5)])) : reg79[(4'h9):(1'h1)]);
  assign wire118 = (~|(wire41 && (($signed(reg76) != $unsigned(reg111)) ?
                       reg44[(2'h3):(2'h2)] : reg58)));
  assign wire119 = (+(~^($signed($signed(reg63)) + ($signed(wire50) ?
                       (reg54 ? reg79 : reg116) : (wire40 ? reg65 : reg105)))));
  assign wire120 = (^(8'ha0));
endmodule

module module11
#(parameter param31 = (~({(8'ha5)} ? (!(((8'hae) != (8'hbf)) ? ((8'hbf) ? (8'haa) : (8'hb9)) : ((8'hac) ? (8'hb0) : (8'h9e)))) : ((~((8'ha6) ~^ (8'h9c))) << (+{(7'h42), (8'ha1)})))), 
parameter param32 = (((&param31) ? (param31 ? ((+param31) ? (param31 ? param31 : param31) : param31) : ((param31 ? param31 : (8'hbc)) >> (8'ha0))) : param31) && (({{param31}} + param31) ? ({(~|param31)} - (~|{param31, param31})) : (((param31 != param31) ? param31 : (-param31)) ? (~param31) : ((param31 <<< param31) ? (param31 ? param31 : param31) : (-param31))))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire15;
  input wire [(4'ha):(1'h0)] wire14;
  input wire [(3'h7):(1'h0)] wire13;
  input wire [(4'he):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  assign y = {wire30,
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
                 wire16,
                 (1'h0)};
  assign wire16 = $signed($unsigned((((~wire13) ?
                          (wire14 >= (8'hac)) : ((8'had) - wire15)) ?
                      wire13 : $signed($signed(wire13)))));
  assign wire17 = (wire14 ? $unsigned(wire15) : (8'haa));
  assign wire18 = $unsigned($signed($signed((((8'h9f) ?
                      wire13 : wire14) + (~wire16)))));
  assign wire19 = ($unsigned(($unsigned({wire15, wire17}) >= (-(wire12 ?
                          (8'hbe) : wire12)))) ?
                      wire16[(4'hd):(4'hb)] : {{{wire18}}});
  assign wire20 = $unsigned(wire17[(4'h8):(2'h3)]);
  assign wire21 = $unsigned(((((~|wire15) ?
                          (^(8'hb1)) : wire13[(1'h1):(1'h0)]) ?
                      ($signed(wire15) ?
                          wire15 : (wire13 + (8'hac))) : $unsigned(wire15[(3'h6):(3'h6)])) >>> ((-{wire14}) ?
                      {wire19[(1'h0):(1'h0)]} : wire20)));
  assign wire22 = wire16;
  assign wire23 = (^~$signed(wire22[(3'h4):(1'h0)]));
  assign wire24 = {wire14[(3'h5):(1'h1)]};
  assign wire25 = wire23[(3'h5):(2'h2)];
  assign wire26 = wire21;
  assign wire27 = wire26[(4'h8):(1'h1)];
  assign wire28 = $unsigned((wire21 ?
                      (^~(|(wire17 != wire19))) : $unsigned((wire14[(2'h2):(1'h1)] != (~|wire25)))));
  assign wire29 = ({wire28} + ($unsigned((~&{wire19,
                      (8'h9d)})) | ((wire13[(1'h1):(1'h0)] ?
                          {wire22} : (~^wire28)) ?
                      {$signed(wire18)} : wire25[(1'h0):(1'h0)])));
  assign wire30 = ((^wire20[(1'h1):(1'h0)]) ?
                      $unsigned((wire17[(3'h5):(1'h1)] < {wire22[(3'h4):(1'h1)]})) : {(^~$signed({(7'h44)})),
                          wire28});
endmodule
