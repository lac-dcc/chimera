module top
#(parameter param177 = (!((~{(^~(8'hb5))}) ? (~&(~&(~&(8'ha5)))) : (^{((8'hba) ? (8'hb4) : (8'hac))}))), 
parameter param178 = ((&(+(8'h9f))) ? param177 : (~|(param177 ? (param177 ~^ (param177 ? (8'ha3) : param177)) : ((param177 < (8'hbd)) ? (param177 - param177) : (~&param177))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire148;
  wire [(4'ha):(1'h0)] wire150;
  wire [(4'hc):(1'h0)] wire151;
  wire [(4'h8):(1'h0)] wire158;
  wire [(4'hc):(1'h0)] wire175;
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg153 = (1'h0);
  reg [(2'h2):(1'h0)] reg154 = (1'h0);
  reg [(5'h11):(1'h0)] reg155 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg157 = (1'h0);
  assign y = {wire96,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire148,
                 wire150,
                 wire151,
                 wire158,
                 wire175,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 (1'h0)};
  assign wire4 = $signed((~&(!(~|(wire3 ? wire1 : (8'h9d))))));
  assign wire5 = (wire2 >>> $unsigned({((+wire3) ?
                         $signed((8'ha7)) : ((8'h9e) ? wire3 : wire2))}));
  assign wire6 = $unsigned(wire1);
  assign wire7 = ($unsigned((wire2[(4'hd):(1'h1)] <<< $unsigned(wire0))) || wire6[(2'h3):(2'h2)]);
  assign wire8 = $signed(($signed(wire3[(3'h4):(1'h1)]) ?
                     ((8'hae) < {$unsigned(wire0)}) : $unsigned($unsigned((8'hbd)))));
  assign wire9 = (~^wire3[(1'h0):(1'h0)]);
  assign wire10 = (wire2 ?
                      $signed(wire6[(4'h9):(3'h5)]) : wire2[(4'hb):(1'h1)]);
  assign wire11 = ((wire2 ?
                      $signed($unsigned({wire8,
                          wire2})) : $unsigned((~|$unsigned((8'ha6))))) ^ $unsigned(wire3[(4'h9):(1'h1)]));
  module12 #() modinst97 (wire96, clk, wire9, wire7, wire2, wire8, wire4);
  module98 #() modinst149 (.clk(clk), .wire99(wire96), .wire101(wire2), .wire102(wire7), .wire100(wire9), .y(wire148));
  assign wire150 = wire10;
  assign wire151 = (&{$signed(wire2)});
  always
    @(posedge clk) begin
      reg152 <= (!({$unsigned((wire11 ? wire7 : wire150)), wire2} ?
          (~(wire148 <<< (~&wire2))) : {$signed({wire8, wire7}), wire3}));
      if (wire151[(3'h4):(2'h2)])
        begin
          reg153 <= $unsigned(((8'ha3) ?
              $signed($unsigned({(8'ha1), wire1})) : wire4));
          reg154 <= $unsigned({(wire3[(3'h7):(3'h6)] ?
                  (~^(8'hb3)) : ((reg152 ? wire4 : wire96) ?
                      wire151[(3'h5):(1'h1)] : {wire7})),
              $unsigned(($unsigned(wire6) != (wire8 & reg152)))});
          reg155 <= (wire151 ?
              ((wire8[(3'h6):(1'h1)] ?
                      (wire150[(4'ha):(2'h2)] != $signed(reg152)) : $unsigned({wire8})) ?
                  (&($unsigned(wire7) ~^ ((8'h9e) <= (8'hbe)))) : ($unsigned((|wire150)) ^~ (wire96[(4'h9):(3'h7)] || $unsigned(reg153)))) : $signed(($signed($signed(wire6)) ?
                  $signed(((8'hba) ?
                      wire151 : wire7)) : wire11[(3'h7):(2'h2)])));
        end
      else
        begin
          reg153 <= wire3;
          reg154 <= (!((wire1[(4'hc):(4'hb)] != $signed(((8'hb4) ?
              wire1 : wire150))) <= (wire151 + wire150)));
        end
      reg156 <= (~|($unsigned(wire96[(2'h3):(1'h1)]) ?
          (($signed(wire0) ?
              {wire150} : (wire1 * (8'hb6))) | ((wire96 != wire8) ?
              wire4 : wire96)) : ($signed((8'hba)) == wire2[(4'hb):(3'h7)])));
      reg157 <= $unsigned(reg153);
    end
  assign wire158 = wire151[(3'h5):(3'h5)];
  module159 #() modinst176 (wire175, clk, wire148, wire151, wire10, reg157);
endmodule

module module159  (y, clk, wire163, wire162, wire161, wire160);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire163;
  input wire signed [(4'hc):(1'h0)] wire162;
  input wire [(2'h2):(1'h0)] wire161;
  input wire signed [(3'h7):(1'h0)] wire160;
  wire signed [(4'hc):(1'h0)] wire167;
  wire [(3'h7):(1'h0)] wire166;
  wire [(5'h13):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire164;
  reg signed [(3'h5):(1'h0)] reg174 = (1'h0);
  reg [(3'h4):(1'h0)] reg173 = (1'h0);
  reg [(5'h10):(1'h0)] reg172 = (1'h0);
  reg [(3'h4):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg170 = (1'h0);
  reg [(4'he):(1'h0)] reg169 = (1'h0);
  reg [(2'h3):(1'h0)] reg168 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 (1'h0)};
  assign wire164 = ((!((wire163[(4'hd):(3'h6)] + (wire163 ?
                       wire163 : wire163)) >>> wire161[(1'h1):(1'h1)])) - $signed({wire160}));
  assign wire165 = $signed($unsigned((($signed(wire162) - (!wire163)) ?
                       (|(-wire164)) : wire162)));
  assign wire166 = $signed($unsigned($signed($unsigned($unsigned(wire165)))));
  assign wire167 = $signed((8'hb9));
  always
    @(posedge clk) begin
      reg168 <= wire161;
      if ((wire164[(4'ha):(4'h9)] << $signed($signed($unsigned($signed(wire164))))))
        begin
          reg169 <= ({wire160[(1'h0):(1'h0)]} ?
              wire163 : {$signed((&(wire167 | wire162))),
                  {(wire165 & (reg168 ? (8'ha7) : wire166)),
                      $unsigned(wire167)}});
          if (((wire165 ?
                  reg169 : ($signed((wire165 ?
                      reg169 : wire165)) <<< $signed((+wire166)))) ?
              (($signed(wire166) ?
                  wire167[(4'hc):(3'h5)] : $signed(((8'hac) ?
                      wire165 : wire160))) - wire167[(1'h0):(1'h0)]) : ($unsigned(wire165) & (wire167 ?
                  $signed((reg168 ?
                      wire164 : wire164)) : $signed((~&wire162))))))
            begin
              reg170 <= wire167;
              reg171 <= (wire166[(2'h2):(2'h2)] ?
                  wire162[(3'h5):(1'h0)] : $unsigned($signed(((reg169 && wire165) | (~|wire164)))));
              reg172 <= ($signed(reg170) ?
                  ((~^$unsigned(((8'hbb) ? reg170 : reg171))) ?
                      $signed($unsigned((~^reg170))) : $unsigned(reg171)) : $unsigned(reg170[(3'h4):(1'h0)]));
            end
          else
            begin
              reg170 <= $unsigned($signed(wire166[(3'h6):(3'h6)]));
              reg171 <= $signed(wire167[(4'h9):(3'h5)]);
              reg172 <= $signed(wire160[(3'h7):(3'h7)]);
            end
        end
      else
        begin
          if ($unsigned($signed(wire160[(3'h7):(3'h5)])))
            begin
              reg169 <= ($signed(wire167) != reg168[(2'h2):(1'h1)]);
              reg170 <= $unsigned(reg170);
              reg171 <= (wire166 >> (+wire161));
            end
          else
            begin
              reg169 <= $signed($signed(wire164));
            end
          reg172 <= $unsigned(($unsigned({((8'hb6) > reg168)}) ?
              (reg171 ?
                  ({(8'hbe), (8'h9e)} << {wire167,
                      wire166}) : reg172[(3'h4):(2'h2)]) : $signed(({wire167,
                      wire167} ?
                  $unsigned(reg168) : $unsigned((8'hb0))))));
          reg173 <= ((~^($signed((~|wire166)) ?
                  $signed($unsigned(reg170)) : $unsigned(reg169))) ?
              {($unsigned((wire163 || (8'ha1))) >= $signed(((8'hb0) >>> wire166)))} : reg172[(4'hf):(3'h4)]);
          reg174 <= $signed($signed($unsigned($signed((reg171 ^~ reg172)))));
        end
    end
endmodule

module module98  (y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'h21d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire102;
  input wire [(5'h14):(1'h0)] wire101;
  input wire [(5'h10):(1'h0)] wire100;
  input wire signed [(4'h9):(1'h0)] wire99;
  wire [(5'h15):(1'h0)] wire147;
  wire signed [(4'hb):(1'h0)] wire140;
  wire signed [(4'hb):(1'h0)] wire139;
  wire [(4'hc):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire132;
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg [(2'h3):(1'h0)] reg144 = (1'h0);
  reg [(5'h12):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg [(3'h6):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg133 = (1'h0);
  reg [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  assign y = {wire147,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire132,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg103 <= $signed($unsigned(wire99[(3'h6):(1'h1)]));
      if (wire102)
        begin
          reg104 <= $signed($unsigned($signed({(wire100 >> wire101),
              {wire101}})));
          reg105 <= $unsigned({$unsigned($unsigned($unsigned((8'hb2))))});
        end
      else
        begin
          reg104 <= (wire102[(5'h10):(4'hb)] < wire100);
          if (((^~(($unsigned((8'ha5)) + $signed(wire101)) ?
              reg105 : $unsigned((wire101 || wire100)))) == $signed(({(wire99 ?
                  wire102 : wire100),
              $signed(reg104)} > ($signed(wire102) ?
              (wire99 << wire102) : (~^wire100))))))
            begin
              reg105 <= $unsigned($signed(reg104));
            end
          else
            begin
              reg105 <= wire102[(4'hf):(3'h4)];
              reg106 <= ({$signed($signed((reg104 ? wire101 : wire101))),
                      $unsigned(reg103[(4'hb):(4'hb)])} ?
                  ($signed(reg105[(3'h7):(3'h6)]) ?
                      $unsigned($signed(reg105[(4'he):(4'hb)])) : wire102) : reg104);
              reg107 <= $signed(((~^$signed({reg104})) ?
                  $signed(reg105[(4'hc):(1'h1)]) : wire99[(2'h2):(1'h1)]));
              reg108 <= wire101[(4'hd):(3'h5)];
              reg109 <= wire101;
            end
          if (wire100[(4'hb):(4'h9)])
            begin
              reg110 <= wire101;
              reg111 <= $signed($unsigned(($signed((~|reg110)) ?
                  wire100[(1'h1):(1'h0)] : $unsigned(reg107[(3'h6):(3'h5)]))));
              reg112 <= ($signed(reg111[(4'hb):(4'h9)]) >> (-reg107[(3'h4):(3'h4)]));
            end
          else
            begin
              reg110 <= $unsigned(reg103);
            end
          reg113 <= ({((+reg112) > (reg104 ?
                      (~&reg103) : ((8'hb4) >> wire101))),
                  reg104[(2'h3):(2'h2)]} ?
              wire100 : {{reg105[(2'h3):(2'h3)], $unsigned($signed(reg106))},
                  $signed(((reg108 <= wire102) ?
                      (+reg110) : $signed(reg104)))});
          if (reg104)
            begin
              reg114 <= {(reg109[(3'h7):(1'h1)] ?
                      ($unsigned($signed(reg104)) ?
                          $signed((wire101 - reg107)) : $unsigned($unsigned(reg107))) : $unsigned(((7'h41) ?
                          (reg105 ? wire99 : reg112) : (+reg113)))),
                  (!($unsigned($unsigned(reg110)) ?
                      $unsigned({wire101, (8'hbb)}) : reg112))};
              reg115 <= (~(($signed($signed(reg106)) ?
                      $signed($signed(reg109)) : $unsigned((wire99 ?
                          reg113 : wire102))) ?
                  $signed((~|reg103)) : reg107[(3'h5):(2'h2)]));
              reg116 <= (^~(|reg105));
              reg117 <= (~({reg110,
                  {(reg115 ? (8'had) : (8'hae)),
                      $unsigned((7'h43))}} != reg116[(2'h2):(1'h0)]));
            end
          else
            begin
              reg114 <= (~^(^((+((8'h9d) ? reg104 : reg103)) ?
                  $signed(reg116) : $signed((reg106 ? reg114 : wire100)))));
              reg115 <= $signed(wire99[(4'h8):(3'h5)]);
            end
        end
      if ((+reg115))
        begin
          reg118 <= reg103[(2'h2):(2'h2)];
          reg119 <= ((!((reg103[(4'hf):(4'h8)] ?
                  (reg112 ? wire101 : reg115) : reg109) ?
              ((reg116 < reg111) ?
                  (|reg118) : $signed(reg117)) : wire102)) || $signed(((|(reg118 != reg114)) >= $unsigned($unsigned(reg118)))));
          reg120 <= reg109[(5'h13):(5'h11)];
        end
      else
        begin
          reg118 <= {(reg112[(1'h1):(1'h0)] ?
                  reg103 : (wire102 && reg107[(3'h4):(1'h1)]))};
          if ((7'h41))
            begin
              reg119 <= reg106[(2'h3):(2'h3)];
              reg120 <= $signed($signed(reg114));
              reg121 <= (((|{wire102}) ?
                  ($signed((+reg119)) ?
                      (8'hac) : (reg109 ~^ {(8'hb4), reg109})) : ({(wire102 ?
                              (8'hac) : reg118)} ?
                      $signed(wire99[(3'h7):(1'h1)]) : {{reg114},
                          wire100[(2'h2):(2'h2)]})) >= reg118[(5'h11):(4'hf)]);
            end
          else
            begin
              reg119 <= (((~(~&{(8'ha9)})) ^~ (|reg114)) + $unsigned({reg113}));
              reg120 <= {$signed({$unsigned({reg106, wire99}),
                      (reg120[(2'h3):(1'h0)] ^ (wire100 ^ reg107))}),
                  (reg108[(4'hb):(3'h7)] ?
                      wire99[(2'h2):(1'h1)] : (^reg118[(1'h0):(1'h0)]))};
            end
          if ($signed($signed(reg120[(1'h1):(1'h0)])))
            begin
              reg122 <= wire101[(4'hf):(4'h8)];
              reg123 <= {(^~$signed(((reg110 ?
                      (8'h9c) : reg107) ~^ {reg105})))};
              reg124 <= {(((reg107[(2'h2):(1'h0)] * (reg115 ^ reg106)) ?
                      (~|{reg108}) : (~reg121[(4'hb):(3'h6)])) == ((~{reg112,
                          reg110}) ?
                      (reg107 & (~&reg121)) : (~reg115))),
                  ($signed((((8'ha9) ? wire99 : (8'hb0)) ?
                          reg112[(1'h0):(1'h0)] : (reg108 ?
                              (8'h9c) : reg116))) ?
                      (({(8'hbc), reg104} ?
                          wire100 : (reg108 ?
                              reg103 : wire102)) && reg105) : (~(-$signed(reg121))))};
              reg125 <= (((+($signed((8'h9f)) ?
                  reg104 : reg103)) <<< (+(reg119 ?
                  (wire102 ?
                      reg116 : wire100) : (reg103 ~^ reg105)))) ^~ $signed((((~&(7'h40)) ?
                  reg111 : (reg108 ?
                      reg112 : reg118)) != $signed((reg103 * wire100)))));
              reg126 <= (reg118[(3'h5):(1'h0)] - ((^~reg119[(3'h6):(3'h5)]) & (reg107 >> (wire102[(4'hd):(4'h9)] ?
                  reg109 : (|(8'hb1))))));
            end
          else
            begin
              reg122 <= $unsigned($unsigned(($signed((|reg108)) ?
                  ($unsigned(reg105) >> reg108[(4'hb):(4'hb)]) : ($signed(reg105) ?
                      reg110 : (~wire99)))));
              reg123 <= ((wire99 ?
                      ((reg120 ~^ $unsigned(wire99)) ?
                          $signed((wire102 & reg121)) : $unsigned((&wire102))) : (^reg106)) ?
                  (wire100[(2'h3):(2'h3)] * (reg119[(2'h3):(2'h3)] ?
                      ((reg120 << reg122) <<< $unsigned(reg123)) : (-(8'ha7)))) : reg111);
              reg124 <= $unsigned((~|$unsigned(reg123[(1'h1):(1'h0)])));
              reg125 <= (($unsigned($unsigned((reg108 ? reg118 : reg120))) ?
                      {((&reg113) >>> (reg121 ? (8'h9c) : reg110)),
                          $signed((&reg114))} : $signed(reg112)) ?
                  (($signed((reg109 >= reg118)) ?
                      (+reg123[(3'h7):(2'h3)]) : ($unsigned(reg107) ?
                          (reg114 ?
                              wire99 : reg120) : wire101)) == (reg122 <= (-wire100))) : reg114[(4'he):(4'h9)]);
              reg126 <= $unsigned((reg117[(2'h2):(2'h2)] ?
                  reg108[(3'h4):(1'h1)] : $signed(($unsigned(reg103) >= reg104))));
            end
          if ($signed((~|{reg105[(3'h7):(2'h3)],
              ($signed(reg119) ? {reg117, reg112} : reg122[(2'h2):(1'h1)])})))
            begin
              reg127 <= reg123[(4'h9):(1'h1)];
              reg128 <= reg111[(3'h4):(3'h4)];
              reg129 <= $unsigned(reg127[(5'h12):(4'hf)]);
            end
          else
            begin
              reg127 <= reg120;
              reg128 <= ($unsigned((&$signed((reg106 ^~ reg125)))) >> reg126);
              reg129 <= {$unsigned($signed((reg103[(4'ha):(3'h4)] ^~ reg108))),
                  reg127[(5'h11):(1'h0)]};
            end
        end
      reg130 <= (8'h9c);
      reg131 <= (reg118 ? reg118 : reg103);
    end
  assign wire132 = wire99[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg133 <= $signed($signed($unsigned(reg104[(1'h0):(1'h0)])));
      if ((&(^~reg118)))
        begin
          reg134 <= $signed($signed((($unsigned(wire100) ^ (reg111 >> reg107)) != reg127)));
          reg135 <= reg134;
        end
      else
        begin
          reg134 <= {$signed((-$signed((8'hba)))),
              {$unsigned(($signed(reg126) ? reg120 : $unsigned(reg124))),
                  (8'h9c)}};
          reg135 <= $signed(reg125);
          reg136 <= wire132[(4'ha):(3'h6)];
        end
    end
  assign wire137 = $unsigned($signed($unsigned((&(~reg110)))));
  assign wire138 = reg128;
  assign wire139 = {(($unsigned((8'had)) ?
                           reg121 : (reg111 >= (~reg113))) == (reg136[(5'h11):(4'ha)] ?
                           reg130 : reg112[(1'h0):(1'h0)]))};
  assign wire140 = {reg134};
  always
    @(posedge clk) begin
      if ((((~((+reg107) * $unsigned(wire139))) ?
          (reg117[(4'hb):(2'h2)] ^ reg109[(2'h3):(1'h0)]) : reg103[(4'hf):(1'h0)]) <<< ((-{$signed(reg114),
          $unsigned(reg123)}) >> $unsigned((^~$unsigned(reg115))))))
        begin
          reg141 <= $unsigned(reg117[(4'h8):(3'h5)]);
          if ((+$unsigned((-((reg125 - reg103) ?
              reg103[(5'h10):(1'h1)] : (reg105 ? wire137 : reg126))))))
            begin
              reg142 <= $signed({reg123,
                  ({(reg121 ? wire137 : reg134)} << {((8'haa) == reg131)})});
              reg143 <= (-{(&{{(8'h9d)}, (reg124 ^ reg131)}),
                  {$signed((7'h42)), reg126}});
              reg144 <= reg123;
              reg145 <= {(reg119[(1'h1):(1'h0)] * (wire102 * $signed((reg121 ?
                      reg111 : reg144))))};
            end
          else
            begin
              reg142 <= $unsigned($unsigned($signed((wire100 * reg107[(3'h4):(2'h2)]))));
            end
        end
      else
        begin
          reg141 <= (($unsigned($signed($signed(reg125))) ?
              (wire138[(3'h5):(1'h0)] ?
                  (^~(^~reg129)) : {{(8'hb2)},
                      (!reg134)}) : (~^$signed($unsigned(reg116)))) ^ reg142);
          reg142 <= {$signed(reg123), reg141};
          reg143 <= ($unsigned($unsigned(((reg122 ? reg104 : (8'hb7)) ?
              (^~reg106) : (~^(8'ha4))))) > $unsigned($unsigned(reg133)));
        end
      reg146 <= (8'hb2);
    end
  assign wire147 = $unsigned($unsigned($unsigned({reg119})));
endmodule

module module12
#(parameter param94 = ((&((((8'hb5) ? (7'h43) : (7'h43)) < (|(8'ha1))) ? (((8'ha8) ? (8'ha5) : (8'hba)) ? (-(8'haa)) : (!(8'ha8))) : (8'hb2))) ? ((((^~(7'h42)) ? (~|(7'h42)) : ((8'haa) ? (8'h9e) : (8'ha9))) - ({(8'ha5)} ? {(8'hbe)} : {(8'haa)})) <= (((7'h44) ? ((8'ha3) << (8'ha1)) : ((8'hb5) - (8'hbc))) << {((8'ha8) ? (8'ha1) : (8'hb2)), ((8'h9d) || (8'haf))})) : (((((8'ha7) ? (8'ha3) : (8'h9d)) ? ((8'ha5) - (8'ha1)) : ((8'h9d) ? (8'hb5) : (7'h40))) ? {(8'hb4)} : (+((8'hbb) ? (8'ha9) : (7'h40)))) ? ((((8'h9f) ? (8'hbe) : (8'haf)) ? (!(8'h9e)) : ((8'hb8) ? (8'hb0) : (8'hab))) < (~^((7'h44) ^~ (8'ha7)))) : ((|((8'h9e) << (8'hb8))) < ((!(8'hbf)) ? {(8'h9d), (8'ha6)} : (-(8'hba)))))), 
parameter param95 = (+param94))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire18;
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  assign y = {wire92,
                 wire47,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg22,
                 (1'h0)};
  assign wire18 = (8'hb6);
  assign wire19 = wire16;
  assign wire20 = wire17[(2'h2):(1'h1)];
  assign wire21 = (wire17[(1'h0):(1'h0)] ?
                      {$signed({$signed(wire17), ((8'hbb) ? wire16 : wire20)}),
                          ($signed(wire19[(3'h6):(3'h4)]) >= $signed(wire17[(2'h3):(1'h0)]))} : (~|($signed(wire19[(3'h7):(3'h7)]) ?
                          wire18 : wire17[(4'hf):(4'h9)])));
  always
    @(posedge clk) begin
      reg22 <= $signed($signed((^~(&(^~wire16)))));
    end
  assign wire23 = ({(~&(8'hbc)), (~&(-(-wire13)))} ^ (|(8'ha9)));
  assign wire24 = (~|$signed(wire21[(2'h2):(1'h0)]));
  assign wire25 = $signed(((($unsigned(wire19) + reg22[(4'h8):(3'h4)]) || $signed($unsigned(wire23))) ^ ((~&$unsigned(wire24)) ?
                      (~^(~wire23)) : $unsigned((wire13 <<< (8'ha3))))));
  assign wire26 = (($unsigned($signed(((8'had) ? wire18 : wire17))) ?
                      (8'ha6) : reg22) - ({{((8'hbb) >= wire20)},
                      ({wire24} < reg22[(4'hc):(3'h5)])} & (wire24[(2'h2):(1'h0)] != (8'hb1))));
  assign wire27 = $signed((^(|(~|(^~wire19)))));
  always
    @(posedge clk) begin
      reg28 <= {$signed({((wire15 != wire26) ? wire18 : (wire24 && reg22))})};
      reg29 <= (|(~&({wire27} ?
          ((wire25 ? wire25 : wire20) ?
              $unsigned(wire16) : $signed(wire15)) : wire24[(2'h2):(1'h1)])));
      if ($unsigned(($signed($signed($signed((7'h41)))) ?
          $signed((&wire24[(1'h0):(1'h0)])) : $signed(wire27[(4'hf):(2'h2)]))))
        begin
          if ($signed($unsigned($signed($signed((wire24 ? wire18 : (8'hbc)))))))
            begin
              reg30 <= ($signed($unsigned($unsigned(((8'hbb) < (8'ha2))))) ?
                  wire24[(2'h2):(1'h1)] : {$signed($unsigned((wire16 >>> reg28))),
                      $unsigned(((~^wire27) ? (^wire24) : (~^wire17)))});
              reg31 <= {$signed(reg30), {(~$unsigned(wire21))}};
              reg32 <= {{wire13[(4'he):(4'hb)], reg22},
                  $unsigned(($signed($unsigned(wire27)) & (^reg29)))};
              reg33 <= $signed(($signed($unsigned((reg29 ? reg30 : reg28))) ?
                  $signed($unsigned((~|wire21))) : {(!((8'haa) + wire17)),
                      $signed((!(8'had)))}));
              reg34 <= ((((-(!wire25)) + {$unsigned(wire16),
                  $signed(reg33)}) + wire24) >> ($unsigned(wire16) == wire13[(4'hd):(4'h8)]));
            end
          else
            begin
              reg30 <= {(|$signed((+$unsigned(wire18)))),
                  (reg30 * ({{(8'hb2),
                          reg34}} < ((^~reg29) * wire20[(4'h8):(3'h7)])))};
              reg31 <= wire24[(1'h1):(1'h0)];
              reg32 <= wire26;
              reg33 <= wire13;
            end
          reg35 <= $signed(reg29);
          reg36 <= (8'ha2);
        end
      else
        begin
          if ($unsigned({(wire13 + $unsigned((reg33 ? (8'haa) : (8'hbe))))}))
            begin
              reg30 <= reg28;
              reg31 <= $signed($signed($signed((~|(reg30 > wire24)))));
            end
          else
            begin
              reg30 <= wire24;
              reg31 <= wire21;
              reg32 <= (^(~((~^wire18[(2'h2):(1'h0)]) ^~ $unsigned((wire19 || reg35)))));
              reg33 <= reg30;
            end
          if ((reg29[(3'h6):(2'h2)] >>> $unsigned((wire16 <= reg35[(1'h0):(1'h0)]))))
            begin
              reg34 <= wire17;
              reg35 <= $signed((wire16 ?
                  ({(wire24 ? reg36 : (7'h42)), reg31} - $unsigned({wire17,
                      wire20})) : (((wire24 || wire24) ? (~^(7'h44)) : wire27) ?
                      $signed((~(8'hbb))) : ({wire14} ~^ (wire24 * wire19)))));
              reg36 <= $signed((~&wire24[(1'h1):(1'h0)]));
              reg37 <= ((wire20 ^~ $signed(((^~reg32) || wire18))) > (8'hbd));
            end
          else
            begin
              reg34 <= (~|$signed((~|(&wire20[(4'ha):(1'h0)]))));
              reg35 <= $signed(($unsigned({reg35,
                  reg22}) >= $unsigned((wire25[(2'h2):(1'h0)] ?
                  $unsigned(reg32) : {reg34, reg31}))));
              reg36 <= ({($unsigned((^reg29)) ?
                          (reg32[(3'h7):(2'h3)] == {reg37,
                              wire24}) : {$signed(reg22)})} ?
                  {(|{(8'hbc)})} : wire27);
              reg37 <= (({$unsigned($unsigned((7'h44))),
                      (~&wire24[(1'h1):(1'h1)])} ?
                  (+wire24[(1'h0):(1'h0)]) : ($signed(reg33) << wire25[(2'h2):(1'h0)])) - reg22);
              reg38 <= (($unsigned((wire17 ?
                          ((8'h9c) || reg33) : reg30[(1'h0):(1'h0)])) ?
                      $signed(((^~wire15) ?
                          ((8'hb7) || (8'ha1)) : wire27[(5'h13):(1'h0)])) : ($unsigned($signed((8'hb0))) ~^ (((7'h43) > wire17) | wire15[(2'h2):(2'h2)]))) ?
                  wire17 : wire27);
            end
          if ($unsigned($signed($unsigned(reg33[(4'h9):(4'h8)]))))
            begin
              reg39 <= {($unsigned({$signed(reg30)}) ?
                      ($unsigned($signed(reg28)) ?
                          reg28 : $signed((~|reg29))) : {wire19[(4'h8):(4'h8)]})};
              reg40 <= (-{(|wire26)});
            end
          else
            begin
              reg39 <= ((~|wire25) ?
                  {reg39} : $signed(((~^(wire14 ? reg31 : reg38)) ?
                      (-$unsigned(reg32)) : wire20)));
              reg40 <= wire15;
              reg41 <= (~^(~|$signed((+(~|reg35)))));
            end
          reg42 <= ((reg31[(3'h7):(1'h0)] ?
                  (~^($unsigned(reg39) ?
                      ((8'hbd) || wire23) : reg34[(2'h2):(1'h1)])) : wire19) ?
              wire19 : (((((8'hbd) <<< wire25) & ((8'hbd) ?
                  (8'hac) : wire13)) <<< $unsigned((wire24 < reg40))) - wire18));
          reg43 <= ((^~reg35) ^~ ($unsigned((reg36 + (8'hb3))) ?
              reg31[(1'h0):(1'h0)] : ((wire24 ?
                      wire24[(1'h0):(1'h0)] : $signed(wire19)) ?
                  ((wire18 < reg22) ?
                      {reg22} : $unsigned(wire16)) : wire27[(4'hc):(4'hb)])));
        end
      reg44 <= reg41[(1'h1):(1'h1)];
      if ($unsigned(wire19))
        begin
          reg45 <= $unsigned($unsigned((((wire19 ?
              wire21 : wire26) * $unsigned(reg28)) >>> $signed($unsigned(reg35)))));
          reg46 <= wire13[(1'h1):(1'h1)];
        end
      else
        begin
          reg45 <= {reg38};
        end
    end
  assign wire47 = $signed(reg39[(2'h2):(1'h0)]);
  module48 #() modinst93 (.clk(clk), .wire49(reg40), .wire50(wire47), .y(wire92), .wire51(reg38), .wire52(wire25));
endmodule

module module48
#(parameter param91 = (8'hbb))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire52;
  input wire signed [(3'h7):(1'h0)] wire51;
  input wire signed [(2'h3):(1'h0)] wire50;
  input wire signed [(3'h6):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire87;
  wire [(4'hb):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire [(5'h10):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
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
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire53 = wire49[(2'h3):(2'h2)];
  assign wire54 = wire52[(4'hb):(3'h5)];
  assign wire55 = (~|$unsigned($unsigned(wire54[(4'hc):(4'h8)])));
  assign wire56 = ($signed(wire53[(3'h6):(1'h0)]) ?
                      ((!wire50) < ($unsigned($unsigned(wire54)) ?
                          ((wire52 ? wire53 : wire53) ?
                              $signed(wire54) : (wire54 ?
                                  wire55 : (8'ha3))) : wire49[(3'h4):(2'h2)])) : $signed($unsigned($signed((~&wire54)))));
  assign wire57 = (($unsigned(({wire56} ?
                          wire50[(1'h0):(1'h0)] : ((7'h42) ^~ wire52))) == wire55) ?
                      ((|wire49) != wire50[(2'h3):(2'h2)]) : $signed((wire51 ?
                          $unsigned(wire54[(3'h5):(2'h2)]) : (^(~wire51)))));
  always
    @(posedge clk) begin
      if (wire57)
        begin
          reg58 <= wire52;
          reg59 <= (((~|wire52[(4'hb):(4'h8)]) ?
                  $unsigned($unsigned(wire57[(1'h0):(1'h0)])) : (~|$unsigned(wire49[(3'h4):(2'h3)]))) ?
              (($signed($signed(reg58)) ?
                      (^~$unsigned(wire53)) : $signed($unsigned(wire57))) ?
                  (~^reg58[(2'h2):(2'h2)]) : (wire51 ?
                      (+wire52[(4'h9):(3'h5)]) : {wire55})) : {((8'hac) ?
                      wire52 : wire57[(1'h0):(1'h0)])});
          reg60 <= {(&wire52), wire49};
          if ($signed($signed($signed(wire51[(1'h0):(1'h0)]))))
            begin
              reg61 <= $unsigned((!{reg60[(4'h8):(3'h4)],
                  ((^wire53) > (wire54 < (7'h44)))}));
              reg62 <= $signed(($unsigned($signed(wire56)) | $unsigned((8'hba))));
              reg63 <= reg59;
              reg64 <= (wire55[(2'h3):(1'h1)] ?
                  $signed(reg59[(3'h7):(2'h2)]) : reg62[(1'h1):(1'h1)]);
              reg65 <= $signed((~(wire54[(5'h11):(5'h11)] ?
                  (+(wire53 != (8'h9f))) : reg62[(1'h0):(1'h0)])));
            end
          else
            begin
              reg61 <= $signed($unsigned(reg61));
              reg62 <= {$signed(wire49[(3'h5):(3'h5)]),
                  $signed($signed((^~(wire55 - reg61))))};
            end
        end
      else
        begin
          if ($unsigned((reg63[(1'h0):(1'h0)] >>> (^(|(8'ha2))))))
            begin
              reg58 <= $unsigned((((wire55 ?
                  (wire51 ?
                      (8'ha4) : reg59) : reg63[(3'h6):(3'h6)]) || $signed($unsigned(reg58))) > (($unsigned(reg58) * (reg63 ?
                      wire55 : reg58)) ?
                  $signed((wire50 + wire53)) : wire56)));
              reg59 <= (~|$unsigned(((reg58[(1'h0):(1'h0)] * $signed(reg61)) ^~ ((reg59 ?
                      (8'hb9) : wire54) ?
                  {wire51} : ((8'hab) ? reg58 : reg59)))));
              reg60 <= reg58;
              reg61 <= $unsigned(reg64[(3'h7):(3'h6)]);
            end
          else
            begin
              reg58 <= wire54[(5'h13):(5'h11)];
              reg59 <= $signed($signed((^((wire53 >= reg60) <<< {wire49,
                  (8'ha7)}))));
              reg60 <= $signed(wire54);
              reg61 <= $signed(reg63);
            end
          reg62 <= (~|((~|{reg65,
              reg63[(2'h2):(1'h0)]}) && (-wire53[(1'h1):(1'h0)])));
          reg63 <= $unsigned(({wire57,
              reg60[(4'hc):(3'h4)]} || reg63[(1'h0):(1'h0)]));
        end
      if (({wire53[(5'h11):(5'h10)]} <<< $signed($unsigned($signed($signed(reg60))))))
        begin
          if ((^~reg61))
            begin
              reg66 <= $unsigned($signed($unsigned($unsigned($unsigned(reg59)))));
            end
          else
            begin
              reg66 <= reg58;
              reg67 <= reg66;
              reg68 <= reg58;
              reg69 <= $unsigned(wire51[(2'h3):(1'h1)]);
            end
          reg70 <= $unsigned((7'h41));
          reg71 <= reg61[(4'hd):(2'h3)];
          if ((~|(8'h9c)))
            begin
              reg72 <= $signed(wire57);
              reg73 <= $signed(($unsigned($unsigned((-reg67))) ?
                  (wire56[(2'h3):(2'h2)] ?
                      $unsigned(reg69) : (reg62 < (wire53 || wire50))) : (8'hbb)));
              reg74 <= (|$signed(($unsigned((^~wire51)) ?
                  $signed((reg69 ? reg61 : wire51)) : (|reg72))));
              reg75 <= ($unsigned($signed(((-wire54) == reg62[(2'h2):(2'h2)]))) ?
                  reg68[(2'h3):(1'h0)] : wire52[(3'h5):(2'h2)]);
              reg76 <= {$unsigned((8'hba)),
                  (wire50[(1'h0):(1'h0)] ?
                      reg60 : (((reg67 >>> reg64) > $unsigned(wire55)) ?
                          $signed((~wire55)) : {wire55}))};
            end
          else
            begin
              reg72 <= {{(&(8'hab))}};
            end
        end
      else
        begin
          reg66 <= wire50[(2'h3):(1'h0)];
          reg67 <= reg74;
        end
      reg77 <= $signed(reg75[(2'h2):(1'h1)]);
      reg78 <= {((reg70[(4'hb):(1'h0)] ?
              ((reg59 << wire56) ?
                  (reg73 ~^ wire53) : {reg68}) : reg74[(2'h2):(1'h1)]) >> ($signed((+(8'hae))) ?
              ({reg73} ?
                  ((8'ha6) ? wire50 : wire52) : (reg71 ?
                      wire55 : reg72)) : $unsigned(((8'haf) ?
                  reg68 : wire50)))),
          ((((-reg64) ?
              $signed((8'ha9)) : {reg59}) ^ $unsigned((~|reg68))) * (7'h42))};
      reg79 <= (~^$unsigned(($signed($signed(wire52)) ?
          $signed({reg69}) : $unsigned((~&wire53)))));
    end
  assign wire80 = $unsigned(wire55[(1'h0):(1'h0)]);
  assign wire81 = reg68[(3'h7):(2'h3)];
  assign wire82 = (reg62 ?
                      (^$unsigned((reg75[(1'h0):(1'h0)] && (-reg69)))) : reg76);
  assign wire83 = (~&((~reg71) ?
                      $signed((+reg62[(1'h0):(1'h0)])) : (-wire50[(2'h2):(1'h0)])));
  assign wire84 = $unsigned((8'hb1));
  assign wire85 = $signed((($signed((^wire51)) ?
                          (wire57[(2'h3):(1'h0)] ?
                              (~^reg60) : wire80[(2'h2):(1'h1)]) : ($unsigned(reg63) != reg59)) ?
                      (~|reg66) : $unsigned(((~reg79) ?
                          (!wire51) : (reg67 ? wire81 : (8'ha4))))));
  assign wire86 = (~&$signed(((+{wire54}) ?
                      (reg59 ? $signed(reg61) : (-reg69)) : reg61)));
  assign wire87 = $unsigned((reg65[(3'h6):(1'h0)] ?
                      (($signed(wire56) >= wire85) < ((wire54 ? reg77 : reg70) ?
                          $signed(reg60) : $unsigned((7'h44)))) : $unsigned(((!reg72) <= {reg66,
                          reg75}))));
  assign wire88 = reg73;
  assign wire89 = wire81[(2'h3):(2'h3)];
  assign wire90 = $signed($signed((~|$unsigned(wire86[(3'h4):(2'h3)]))));
endmodule
