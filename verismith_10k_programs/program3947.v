module top
#(parameter param190 = (~&(~(~(-(~&(7'h41)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire189;
  wire signed [(5'h10):(1'h0)] wire168;
  wire [(3'h5):(1'h0)] wire167;
  wire [(4'hc):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire164;
  wire signed [(4'h8):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire162;
  wire signed [(4'h8):(1'h0)] wire161;
  wire signed [(5'h12):(1'h0)] wire160;
  wire signed [(5'h10):(1'h0)] wire159;
  wire signed [(3'h5):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire91;
  wire signed [(3'h6):(1'h0)] wire157;
  reg signed [(4'h8):(1'h0)] reg188 = (1'h0);
  reg [(4'hc):(1'h0)] reg187 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg186 = (1'h0);
  reg [(3'h6):(1'h0)] reg185 = (1'h0);
  reg [(3'h4):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg179 = (1'h0);
  reg [(2'h3):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg176 = (1'h0);
  reg [(4'hf):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg174 = (1'h0);
  reg [(4'h8):(1'h0)] reg173 = (1'h0);
  reg [(5'h14):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg166 = (1'h0);
  assign y = {wire189,
                 wire168,
                 wire167,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire88,
                 wire5,
                 wire90,
                 wire91,
                 wire157,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
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
                 reg170,
                 reg169,
                 reg166,
                 (1'h0)};
  assign wire5 = ({$unsigned(wire4[(4'h8):(3'h7)])} ?
                     ((({wire4, wire4} ? wire1[(3'h5):(3'h4)] : (^~wire0)) ?
                             wire3[(1'h1):(1'h1)] : $unsigned(wire0[(2'h2):(1'h0)])) ?
                         ((-(wire2 ? (7'h41) : wire2)) ?
                             (wire3 <<< (wire3 << wire0)) : (!(|wire3))) : wire2) : wire4[(1'h0):(1'h0)]);
  module6 #() modinst89 (wire88, clk, wire3, wire5, wire2, wire0, wire1);
  assign wire90 = (wire0 ?
                      ((~|wire1[(3'h7):(3'h7)]) ?
                          ($unsigned((wire1 < wire3)) ?
                              {wire4[(3'h7):(3'h6)]} : $unsigned({wire1})) : ($unsigned($unsigned(wire1)) ?
                              {$unsigned(wire3)} : (~^$signed(wire88)))) : (^~(-((wire88 != wire5) > $signed(wire1)))));
  assign wire91 = (~&wire88[(3'h4):(2'h2)]);
  module92 #() modinst158 (.wire96(wire2), .y(wire157), .wire94(wire91), .wire93(wire4), .clk(clk), .wire95(wire0), .wire97(wire5));
  assign wire159 = $signed({$signed(((wire1 ?
                           (8'hb4) : wire88) >> $unsigned(wire88)))});
  assign wire160 = wire90[(5'h13):(3'h4)];
  assign wire161 = (8'ha0);
  assign wire162 = {wire0};
  assign wire163 = wire160;
  assign wire164 = {(8'ha6)};
  assign wire165 = ((((-{wire163,
                       wire91}) <<< $unsigned(wire0[(3'h6):(3'h6)])) ~^ $signed(wire164[(3'h6):(1'h0)])) >>> (~&$signed((wire90 ^~ $unsigned(wire164)))));
  always
    @(posedge clk) begin
      reg166 <= {$signed($unsigned($signed($unsigned(wire157))))};
    end
  assign wire167 = (wire164[(4'ha):(3'h4)] > $unsigned(wire159));
  assign wire168 = wire167;
  always
    @(posedge clk) begin
      reg169 <= reg166[(3'h6):(1'h1)];
      reg170 <= (~wire165);
      if (wire157[(1'h1):(1'h0)])
        begin
          reg171 <= (+{wire88,
              $unsigned({((8'ha7) ? wire2 : wire157),
                  wire90[(5'h10):(3'h5)]})});
        end
      else
        begin
          if (wire91)
            begin
              reg171 <= ((($signed(wire164) - $signed((^reg169))) || (|((wire161 ~^ (7'h43)) ?
                      (wire1 ? wire91 : wire0) : (~|wire0)))) ?
                  reg166 : (!(~&(|{wire1, wire0}))));
              reg172 <= (reg166 ?
                  wire1[(3'h6):(3'h6)] : {$signed(((reg166 ? reg171 : wire5) ?
                          (wire3 ? wire0 : (8'ha8)) : $unsigned(wire2))),
                      (wire2 >= $unsigned(reg169[(3'h7):(2'h2)]))});
              reg173 <= $signed((wire161[(1'h0):(1'h0)] ?
                  ($signed(((8'h9f) ? wire157 : (8'hb3))) ?
                      $unsigned($unsigned(wire5)) : (wire165 ?
                          wire5[(4'h8):(1'h1)] : (wire3 | wire4))) : (reg170 > (wire1 ?
                      reg170[(4'hb):(4'hb)] : (-(8'hb0))))));
            end
          else
            begin
              reg171 <= (wire91 ?
                  ((~&$unsigned((wire4 & wire5))) > (((+(8'ha9)) | (wire157 ^~ (8'hbf))) & ((reg171 ?
                          wire159 : wire90) ?
                      wire2[(5'h15):(4'hd)] : (|(8'hb3))))) : ((~^(~|(^~wire159))) ?
                      wire4[(2'h3):(2'h2)] : (+$unsigned((wire91 < wire159)))));
              reg172 <= reg173[(1'h1):(1'h1)];
              reg173 <= wire3;
            end
          reg174 <= (-(reg173 ? wire4[(3'h7):(2'h3)] : wire2));
          reg175 <= (7'h44);
          reg176 <= wire88[(2'h2):(2'h2)];
        end
      if ((8'hae))
        begin
          if (((8'h9c) < (^$signed((((7'h41) << reg174) ?
              $unsigned(wire3) : reg166)))))
            begin
              reg177 <= wire168;
              reg178 <= {reg170[(5'h10):(3'h4)],
                  $signed($signed((reg175 < (-wire167))))};
            end
          else
            begin
              reg177 <= $unsigned(($signed({(reg177 ? (8'h9d) : reg171),
                      (|reg169)}) ?
                  (&($unsigned(reg178) + $signed(wire163))) : wire168));
            end
          if ((8'hbd))
            begin
              reg179 <= (((wire162[(3'h6):(1'h1)] ?
                      (^(&wire161)) : ((reg173 + wire157) ?
                          (reg174 ? wire164 : (8'hb3)) : $signed(wire5))) ?
                  ($unsigned(reg174[(2'h2):(1'h0)]) ?
                      reg172 : (|(~|wire88))) : ((!(^~wire159)) <<< wire160)) < reg176[(3'h5):(3'h4)]);
              reg180 <= $signed($unsigned((reg178[(1'h0):(1'h0)] || $unsigned((reg166 ?
                  (8'haf) : reg178)))));
              reg181 <= $signed(($signed(wire163) ?
                  $signed($signed(wire159)) : wire161[(1'h1):(1'h0)]));
              reg182 <= (~&wire157);
            end
          else
            begin
              reg179 <= {(^($unsigned((wire4 ? wire164 : wire160)) ?
                      ($unsigned((8'hae)) < (8'ha7)) : $unsigned($signed(reg174)))),
                  $signed((&((~reg176) << $signed((8'hb2)))))};
              reg180 <= (~&reg181[(4'hb):(3'h5)]);
              reg181 <= wire163;
            end
          if (reg177)
            begin
              reg183 <= $unsigned(((reg166 > ($signed(wire91) == reg173)) <<< $unsigned($unsigned(reg174[(3'h4):(1'h1)]))));
              reg184 <= wire4;
              reg185 <= wire164;
              reg186 <= ($signed($unsigned(wire91[(3'h5):(1'h0)])) == (^reg171));
            end
          else
            begin
              reg183 <= reg177;
              reg184 <= ((|(wire164[(4'hd):(4'h9)] < ((reg175 ?
                          reg173 : reg175) ?
                      reg179 : (wire3 - reg186)))) ?
                  (~^reg184[(1'h0):(1'h0)]) : $signed((($signed((8'hb9)) >= (wire164 ?
                          reg184 : (8'ha8))) ?
                      ((reg169 ? (8'ha6) : (8'had)) ?
                          {wire163,
                              reg173} : reg179[(3'h5):(1'h1)]) : $unsigned((wire159 ?
                          (8'hb9) : wire163)))));
              reg185 <= ($unsigned((((reg173 ^ wire165) ?
                      (wire162 ? wire90 : wire164) : {reg180,
                          (8'ha6)}) * ($signed(reg170) != wire161))) ?
                  (^~($signed(wire163) ?
                      $unsigned((^reg174)) : (^wire164[(5'h11):(5'h11)]))) : (~wire159[(4'hd):(4'h9)]));
              reg186 <= $signed($unsigned(((~|reg173[(2'h2):(1'h1)]) ?
                  $unsigned((~(8'hb1))) : $unsigned(reg178[(2'h2):(2'h2)]))));
              reg187 <= (~&$signed(($unsigned($unsigned(wire88)) ^ ($signed(reg177) ?
                  (8'had) : $signed(reg172)))));
            end
        end
      else
        begin
          if ($unsigned((wire88 ?
              $signed(($unsigned(reg185) | (reg176 * reg166))) : reg182)))
            begin
              reg177 <= {($unsigned({(^wire167),
                      reg180[(2'h3):(1'h0)]}) ^ {$unsigned((reg186 ^ wire157))})};
              reg178 <= (~&wire161);
            end
          else
            begin
              reg177 <= $unsigned($signed(reg171));
            end
          reg179 <= $signed($unsigned(reg179[(3'h5):(3'h5)]));
          reg180 <= $signed($unsigned((8'h9f)));
          if (reg172[(4'he):(1'h1)])
            begin
              reg181 <= wire159[(1'h1):(1'h0)];
              reg182 <= $unsigned({$signed(wire163[(3'h6):(3'h4)])});
              reg183 <= $unsigned($unsigned($unsigned($unsigned(reg172))));
            end
          else
            begin
              reg181 <= (^~reg171);
              reg182 <= $unsigned($signed(reg177));
            end
        end
      reg188 <= $unsigned(wire90);
    end
  assign wire189 = ((~^((|(~^wire165)) ?
                           $unsigned((reg166 | reg186)) : ($unsigned((8'hbe)) - reg182[(2'h2):(1'h0)]))) ?
                       (({(8'hab), $signed(wire163)} + ((^reg169) >>> ((8'hb6) ?
                               reg185 : (7'h44)))) ?
                           (($unsigned(wire165) > wire162) ?
                               (reg185[(3'h4):(1'h1)] - reg180[(4'h8):(2'h2)]) : (~|wire91)) : $unsigned(wire162)) : (~^(((^~wire157) <<< (~(8'hbd))) != reg173[(2'h3):(2'h2)])));
endmodule

module module92
#(parameter param155 = (~&((!(!(!(8'hac)))) ? {{((7'h41) ? (7'h43) : (7'h44)), ((8'hb3) - (8'hbb))}, (^((7'h44) ? (7'h41) : (8'ha6)))} : ((~|((8'hb5) == (8'hac))) <<< ({(8'hab)} ? ((7'h41) ? (8'hac) : (8'ha3)) : {(8'haf)})))), 
parameter param156 = (({(!param155), ((~&param155) ? ((8'hba) ? param155 : param155) : (param155 ? param155 : param155))} < (-(~|((7'h44) || param155)))) - {param155}))
(y, clk, wire93, wire94, wire95, wire96, wire97);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire93;
  input wire [(3'h6):(1'h0)] wire94;
  input wire signed [(5'h15):(1'h0)] wire95;
  input wire [(4'h9):(1'h0)] wire96;
  input wire [(3'h6):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire154;
  wire [(3'h5):(1'h0)] wire153;
  wire signed [(4'h8):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire99;
  wire [(4'h8):(1'h0)] wire113;
  wire [(3'h7):(1'h0)] wire114;
  wire [(4'hc):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire116;
  wire signed [(4'hc):(1'h0)] wire117;
  wire signed [(5'h10):(1'h0)] wire118;
  wire [(3'h6):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire151;
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire98,
                 wire99,
                 wire113,
                 wire114,
                 wire115,
                 wire116,
                 wire117,
                 wire118,
                 wire119,
                 wire151,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 (1'h0)};
  assign wire98 = (8'ha8);
  assign wire99 = $unsigned(wire98);
  always
    @(posedge clk) begin
      reg100 <= {$unsigned({(+$signed(wire98))})};
      if ((8'h9f))
        begin
          reg101 <= (~^(($signed({wire98, wire97}) >> ($signed(wire93) ?
              reg100 : (~^wire97))) ^~ $unsigned($unsigned((wire99 ?
              wire95 : wire95)))));
          reg102 <= $signed((((reg101[(1'h1):(1'h1)] ?
                  $signed(reg100) : (^(8'h9c))) ^ {$unsigned(wire93),
                  $unsigned((8'hbf))}) ?
              (-(reg101 == (wire96 | wire97))) : $signed(wire95[(1'h1):(1'h0)])));
          if ((~|((^$signed($signed((8'ha0)))) ^~ (~^((+reg102) ?
              wire93 : (^~(8'hbb)))))))
            begin
              reg103 <= $signed(((&wire99[(1'h1):(1'h1)]) < $signed($unsigned((reg100 ?
                  wire98 : (7'h41))))));
              reg104 <= {reg100, {(~|$unsigned($signed(wire95)))}};
              reg105 <= ((wire94 ?
                  (+$unsigned($unsigned(reg103))) : (~|{$unsigned((7'h44)),
                      $unsigned((8'hb8))})) < (wire93[(3'h7):(3'h5)] ?
                  wire95[(5'h15):(3'h4)] : wire93[(3'h5):(2'h2)]));
              reg106 <= $unsigned($signed((~((reg105 == reg101) ?
                  wire99 : $signed(reg100)))));
              reg107 <= ((^(wire93[(2'h3):(1'h0)] ?
                      $unsigned(wire97[(3'h5):(3'h5)]) : wire94)) ?
                  reg104 : $unsigned((~^(wire99 ?
                      {wire96} : (wire99 << wire99)))));
            end
          else
            begin
              reg103 <= ((~^$unsigned((8'hb8))) ?
                  {$signed(wire99)} : reg104[(4'h8):(1'h1)]);
            end
          reg108 <= reg107;
          reg109 <= $unsigned(reg104);
        end
      else
        begin
          reg101 <= reg103;
          reg102 <= $unsigned(((~|(reg109 ? $unsigned(reg103) : (|reg105))) ?
              (wire93[(3'h7):(3'h4)] - ($unsigned((8'hb3)) + wire95[(1'h1):(1'h0)])) : (~|($unsigned(wire94) | ((8'had) ^ reg105)))));
          reg103 <= wire97[(2'h3):(1'h0)];
          reg104 <= wire96;
          reg105 <= {($signed((reg103[(2'h2):(1'h0)] ?
                      ((8'h9e) && wire99) : (reg102 >> wire99))) ?
                  $signed(((reg106 ?
                      reg106 : wire95) & (~^wire99))) : ((^wire96[(1'h1):(1'h1)]) ?
                      ((reg109 ? reg101 : wire99) ?
                          reg104[(3'h6):(1'h1)] : (wire94 ?
                              wire93 : (8'h9c))) : $unsigned($signed(wire98)))),
              (~&wire98)};
        end
      reg110 <= (~{(!{wire94}), reg107[(2'h3):(2'h2)]});
      reg111 <= $unsigned(reg107);
      reg112 <= (((~&$signed((wire93 ^~ reg106))) ?
              $unsigned(reg109[(4'h8):(3'h6)]) : $signed((^(^reg110)))) ?
          (8'hb7) : $unsigned((+wire97[(1'h0):(1'h0)])));
    end
  assign wire113 = $unsigned(((~&reg112) ?
                       $unsigned($unsigned((8'ha0))) : $signed(reg104[(1'h1):(1'h1)])));
  assign wire114 = (reg103[(2'h2):(2'h2)] <<< {reg111,
                       $unsigned($signed($unsigned((8'hb0))))});
  assign wire115 = ((!{(~(wire114 ? reg109 : wire97)), wire97[(1'h0):(1'h0)]}) ?
                       $unsigned($signed(($signed(wire97) ?
                           $unsigned(wire94) : (reg104 ?
                               reg103 : wire97)))) : wire99);
  assign wire116 = wire97[(1'h0):(1'h0)];
  assign wire117 = (($unsigned({$unsigned(wire114)}) ?
                       $signed(wire116[(3'h4):(2'h3)]) : (wire95 ?
                           ((~&wire99) <<< reg103) : wire93)) <<< wire113[(1'h0):(1'h0)]);
  assign wire118 = (~|{$unsigned(reg108[(1'h1):(1'h0)]),
                       (((8'hb4) ^ (reg101 ~^ wire114)) | (8'ha0))});
  assign wire119 = $signed((wire93 ?
                       reg105[(1'h1):(1'h1)] : reg104[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned({($signed(reg109) ?
              reg109[(1'h1):(1'h0)] : $signed(reg106))})))
        begin
          reg120 <= $unsigned((+(wire118 ? wire94 : reg109)));
          reg121 <= {reg108[(2'h2):(1'h1)]};
          reg122 <= (-((^~$signed($unsigned(wire119))) ?
              {$unsigned(wire118[(4'hb):(3'h4)])} : (reg104 ^ reg103[(1'h1):(1'h0)])));
          if ((((reg120[(1'h1):(1'h0)] == (reg101 << {(8'hab)})) ?
              (($signed(reg102) ? {wire96, wire97} : reg110[(3'h6):(3'h4)]) ?
                  (&wire115) : (wire115 ?
                      $unsigned(wire98) : $unsigned(reg105))) : wire117) >= ($unsigned((~^$signed(wire116))) + (&$signed(reg101[(1'h0):(1'h0)])))))
            begin
              reg123 <= $unsigned((^~((reg103 ?
                  (reg122 ? wire99 : reg111) : $unsigned(wire114)) != (|{reg110,
                  reg108}))));
              reg124 <= wire94[(3'h4):(2'h2)];
              reg125 <= $unsigned(reg122[(4'h8):(1'h1)]);
              reg126 <= wire114[(3'h7):(3'h4)];
            end
          else
            begin
              reg123 <= reg109;
              reg124 <= $unsigned((^($signed(reg110) == (^~(wire97 ?
                  reg105 : (8'ha5))))));
              reg125 <= $signed((^~wire115));
              reg126 <= wire98;
              reg127 <= reg111[(2'h3):(1'h1)];
            end
        end
      else
        begin
          reg120 <= $unsigned(((-$unsigned(wire95)) ?
              (+reg120[(2'h3):(1'h0)]) : wire97));
        end
      reg128 <= $signed($unsigned((~&$signed((reg104 > reg112)))));
      reg129 <= ({reg120[(1'h1):(1'h1)]} <<< (({$unsigned(reg111)} ?
              reg112[(4'h9):(3'h5)] : ((reg100 - reg124) >= {wire116,
                  wire118})) ?
          $signed(reg125[(3'h6):(1'h1)]) : $signed((|$unsigned(reg112)))));
      reg130 <= $signed($signed(wire93));
    end
  module131 #() modinst152 (wire151, clk, wire95, wire96, reg130, wire115);
  assign wire153 = {{reg109[(3'h7):(3'h4)]},
                       ((^~$signed(((8'ha6) ?
                           wire117 : reg126))) << {(wire115[(1'h1):(1'h0)] ?
                               (~|reg109) : (wire151 <<< reg109)),
                           reg110})};
  assign wire154 = (~|reg123);
endmodule

module module6
#(parameter param86 = (^~{{{(-(8'ha9)), ((8'ha6) ? (8'hbc) : (8'ha0))}}}), 
parameter param87 = ((({param86, param86} ~^ (param86 >= (param86 ? param86 : param86))) || (~^(param86 ? (param86 ? param86 : param86) : ((8'hb4) && param86)))) ? param86 : ((+((param86 && (8'haf)) ? param86 : (param86 << param86))) ? (((param86 ? param86 : param86) ? (8'hbb) : param86) ? (~(param86 ? param86 : param86)) : (param86 | (param86 <<< param86))) : (((-param86) ? param86 : ((8'hba) - (8'h9e))) > (param86 >>> {param86, param86})))))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire43;
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire76,
                 wire74,
                 wire12,
                 wire15,
                 wire16,
                 wire43,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire12 = (($unsigned((8'hbc)) ?
                      (~^($signed(wire8) ?
                          $unsigned(wire7) : wire11)) : (^(wire11 ?
                          {wire11, wire7} : (wire11 ?
                              wire8 : wire10)))) && wire10);
  always
    @(posedge clk) begin
      reg13 <= ($signed((wire7 & $unsigned((wire12 == wire7)))) && (wire9[(3'h6):(2'h2)] >> $unsigned((+wire11))));
      reg14 <= reg13[(3'h5):(2'h2)];
    end
  assign wire15 = ($signed((&{((8'hb7) ? wire12 : (8'hb0)), (8'ha8)})) ?
                      $signed(((wire9[(4'hc):(4'h8)] ?
                              wire7 : ((8'hb2) + (8'ha7))) ?
                          reg13 : wire12)) : $unsigned(($signed(wire7[(2'h3):(1'h0)]) || $unsigned((~&reg13)))));
  assign wire16 = $signed(((8'hb0) ?
                      {($signed(wire7) ?
                              (wire11 ?
                                  wire8 : wire12) : $signed(wire8))} : (-(~&((8'ha6) ?
                          wire11 : reg14)))));
  module17 #() modinst44 (.y(wire43), .wire21(wire15), .clk(clk), .wire19(reg13), .wire20(wire12), .wire18(wire11));
  module45 #() modinst75 (.y(wire74), .clk(clk), .wire48(wire8), .wire49(reg13), .wire47(wire12), .wire50(wire15), .wire46(wire9));
  assign wire76 = wire8[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      if ((({(^$unsigned(wire10)), (+$signed((8'ha2)))} ?
              {(wire43 ?
                      (wire12 >> wire7) : {wire8,
                          wire16})} : (-$unsigned((+wire10)))) ?
          reg14 : ((^wire16[(4'h9):(1'h1)]) ?
              ({wire10} | (wire15[(5'h14):(3'h6)] ?
                  reg13 : (!wire76))) : $unsigned(((+wire12) ?
                  {wire12, wire12} : wire43[(2'h3):(1'h0)])))))
        begin
          reg77 <= $unsigned(wire15[(5'h12):(4'h9)]);
          reg78 <= ((&wire12) <<< (((!reg77) == reg14[(3'h4):(2'h2)]) > (^~$signed(reg13))));
        end
      else
        begin
          reg77 <= ({$unsigned(($signed(reg13) <= $signed((7'h42)))),
              wire11[(4'h8):(1'h0)]} <<< (|wire11));
          reg78 <= (7'h42);
          reg79 <= (wire9 ?
              (((&(reg13 ^ wire8)) <= {$unsigned(reg78),
                      reg14[(3'h4):(3'h4)]}) ?
                  reg77 : wire11[(4'hc):(4'hb)]) : (($signed((-(8'ha4))) ?
                      $signed($signed(wire43)) : wire76[(3'h7):(3'h4)]) ?
                  ($unsigned((~^wire76)) ?
                      (reg78[(2'h3):(1'h0)] ?
                          (wire7 && (8'h9e)) : wire74[(4'hd):(3'h5)]) : wire12) : wire9[(5'h13):(4'hb)]));
          reg80 <= ($unsigned($unsigned({{reg77}})) < ($unsigned(wire16) ?
              wire12[(3'h4):(2'h3)] : {(&wire10[(3'h4):(1'h0)]),
                  (!(wire7 ? wire8 : wire16))}));
          reg81 <= wire9[(4'ha):(3'h5)];
        end
      reg82 <= $signed(wire8[(3'h6):(2'h3)]);
      reg83 <= $unsigned($signed((8'h9f)));
    end
  assign wire84 = wire16[(4'ha):(4'h8)];
  assign wire85 = $unsigned((~($unsigned({(8'hac)}) != ({reg83} ?
                      $unsigned(wire84) : {wire74, reg77}))));
endmodule

module module45
#(parameter param73 = (((8'hb0) && (^~({(7'h40)} * ((8'ha0) ^~ (8'ha1))))) ^ (+(~|{((8'ha6) ? (8'ha4) : (8'ha4))}))))
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire50;
  input wire [(4'hd):(1'h0)] wire49;
  input wire [(3'h6):(1'h0)] wire48;
  input wire [(4'h9):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire51;
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire51,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire51 = $signed(wire46[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg52 <= $signed(((wire51 << (|(+wire49))) > (((wire49 | wire49) ?
              $unsigned((8'ha6)) : (wire51 ? wire50 : wire51)) ?
          ($signed(wire48) ?
              (wire46 <= wire49) : wire51) : ($unsigned((8'hbd)) ?
              wire51 : (|wire49)))));
      reg53 <= $unsigned($unsigned((^~wire51[(3'h4):(2'h3)])));
      reg54 <= wire46;
      reg55 <= {(~&(-(-reg54[(3'h7):(3'h5)]))),
          {(({wire49,
                  reg53} <<< reg52[(4'hc):(1'h1)]) & $signed(wire47[(2'h2):(1'h1)])),
              (wire49 & (~&wire47[(2'h2):(1'h0)]))}};
      if (($unsigned($unsigned((~|$unsigned(reg52)))) ?
          reg55[(3'h4):(2'h3)] : (wire47 ?
              $signed(reg52[(3'h6):(3'h5)]) : wire46)))
        begin
          if (($unsigned($unsigned($signed((~^(8'hbe))))) ?
              ($signed(reg54) ?
                  {wire50, (^~(~&wire46))} : wire50[(3'h7):(3'h5)]) : reg54))
            begin
              reg56 <= $signed(({($signed(wire49) << {reg53, wire48}),
                  ($signed(wire49) != (^wire49))} || (((reg54 | wire51) ?
                      wire50[(2'h2):(2'h2)] : wire46) ?
                  ({wire46, wire49} ?
                      reg52 : $signed(wire51)) : $signed($signed((7'h42))))));
            end
          else
            begin
              reg56 <= ($unsigned({reg53[(3'h5):(2'h3)]}) ?
                  (7'h41) : (|$signed($unsigned(wire49))));
              reg57 <= $unsigned(reg56[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          if (reg56[(2'h3):(2'h3)])
            begin
              reg56 <= ($unsigned((~wire46)) ? wire46[(3'h7):(3'h5)] : reg57);
              reg57 <= (reg54[(3'h6):(1'h0)] ?
                  $unsigned((($unsigned((8'hb7)) >> {reg55}) <= (^(reg56 ^~ reg54)))) : {(({reg53,
                                  wire48} ?
                              (wire47 ? (7'h40) : wire46) : (reg55 ?
                                  (8'hbf) : wire46)) ?
                          reg56[(1'h0):(1'h0)] : $unsigned(reg55[(4'h8):(3'h6)]))});
              reg58 <= $signed((+$signed((8'ha8))));
              reg59 <= $unsigned((+(wire47 ?
                  $unsigned((reg56 ? wire48 : reg57)) : ((~&reg54) << {wire46,
                      wire51}))));
              reg60 <= wire50[(3'h5):(3'h4)];
            end
          else
            begin
              reg56 <= (wire50 ?
                  (reg59 <= ((-reg52) ?
                      (^wire51[(2'h2):(2'h2)]) : $signed(reg59[(1'h1):(1'h1)]))) : ((+(!{reg55,
                          wire50})) ?
                      (~^{(reg55 >= (8'hb2))}) : reg55[(4'hc):(2'h2)]));
              reg57 <= $unsigned($signed((((wire46 ? (8'hb0) : reg58) ?
                  (wire46 + (8'h9d)) : $unsigned(wire47)) >> reg60[(3'h4):(1'h1)])));
              reg58 <= ((reg54[(3'h4):(2'h3)] != ({(~(8'ha8))} <<< (~|(^~reg53)))) <= (^(8'hb8)));
              reg59 <= (-$signed((^~((reg54 ? reg54 : reg59) ?
                  $signed(reg53) : (wire49 ~^ wire51)))));
              reg60 <= $signed($signed($signed(reg56)));
            end
          if ((8'h9d))
            begin
              reg61 <= ($signed($unsigned($signed(wire46[(2'h2):(2'h2)]))) << reg54[(4'h9):(4'h8)]);
              reg62 <= (+(+($unsigned((wire48 ? reg58 : reg52)) ?
                  (wire49 <<< wire50[(3'h4):(2'h2)]) : {reg55[(4'hd):(4'ha)]})));
              reg63 <= reg54;
              reg64 <= $unsigned($signed((+$unsigned(wire46))));
            end
          else
            begin
              reg61 <= $signed(((((wire48 + wire51) ?
                      $unsigned(wire48) : $unsigned(reg62)) ?
                  ((wire51 ^ reg59) + (reg58 ?
                      reg53 : reg60)) : wire51) - (^~$unsigned((&wire50)))));
              reg62 <= $signed((-(^$signed(reg56[(2'h3):(2'h3)]))));
              reg63 <= (((((7'h42) ?
                      reg55[(3'h7):(3'h6)] : (reg60 ^~ reg60)) || ((^~reg57) == $unsigned(reg63))) <= reg52) ?
                  (reg59 >> (reg53[(2'h3):(1'h1)] ~^ reg61[(1'h1):(1'h0)])) : $signed(reg60));
              reg64 <= $unsigned($unsigned(reg63[(2'h2):(1'h1)]));
            end
          reg65 <= reg53;
          if (((~^$signed(((reg62 ? (8'had) : reg58) < (wire49 ?
                  wire46 : wire46)))) ?
              $signed((-(^~(|wire46)))) : (8'ha0)))
            begin
              reg66 <= ((wire49 > {(8'hb9)}) == wire46[(4'h9):(3'h6)]);
              reg67 <= (+$unsigned(reg53));
              reg68 <= $signed(($signed($unsigned($signed(wire47))) ~^ $signed(wire47[(3'h5):(1'h1)])));
              reg69 <= reg68[(1'h0):(1'h0)];
              reg70 <= reg66[(3'h4):(3'h4)];
            end
          else
            begin
              reg66 <= $signed((reg66 || {$signed((8'h9e))}));
              reg67 <= reg58;
            end
        end
    end
  assign wire71 = ((reg69 ?
                      reg60[(1'h0):(1'h0)] : wire50) <= $unsigned((~|reg70[(3'h4):(2'h2)])));
  assign wire72 = (reg63[(2'h2):(2'h2)] ?
                      ({$signed($unsigned((8'hb8)))} * $unsigned(((~&(8'ha2)) <= ((8'haf) - reg56)))) : ((reg57[(2'h3):(2'h3)] ?
                              ({(8'hb4)} >>> $unsigned(wire71)) : (|wire46[(3'h4):(1'h0)])) ?
                          {$unsigned((reg61 ? reg69 : reg55)),
                              ((wire47 ? reg69 : reg66) ?
                                  $unsigned((7'h41)) : (&reg60))} : reg56));
endmodule

module module17
#(parameter param42 = ((((+(~^(8'ha8))) ~^ {(8'hb7)}) && ({((7'h44) ? (8'hb4) : (8'hbf)), ((8'h9e) ? (8'hba) : (8'hb4))} ? ({(8'had)} ? ((8'hbe) ? (8'h9f) : (8'ha3)) : ((8'haf) ~^ (7'h43))) : ((~(8'hb2)) >> {(8'h9c)}))) ? (^~{((&(7'h42)) ? (8'ha5) : (&(8'ha2)))}) : (^{((8'hb1) ? (~(8'h9f)) : {(8'ha1), (8'ha0)}), (+(~^(8'hbb)))})))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire signed [(4'ha):(1'h0)] wire20;
  input wire [(5'h14):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg30,
                 (1'h0)};
  assign wire22 = wire18;
  assign wire23 = wire19[(1'h1):(1'h1)];
  assign wire24 = $signed($signed((|{{wire19, wire23}, wire18})));
  assign wire25 = (({((wire20 << (8'h9c)) ? ((8'hb7) * wire23) : (8'hbe)),
                      $signed(wire18)} + $signed($signed($signed((8'hb9))))) >> (wire21[(3'h6):(2'h2)] >> $unsigned(wire20)));
  assign wire26 = (wire25[(3'h4):(1'h1)] ?
                      wire18 : ($signed($signed((8'ha4))) | $signed(($unsigned(wire18) >>> wire25))));
  assign wire27 = (&wire26[(1'h1):(1'h0)]);
  assign wire28 = $unsigned((~|{$unsigned((&wire26)),
                      $unsigned((wire25 ? wire20 : wire23))}));
  assign wire29 = {$unsigned($signed($unsigned($signed(wire21)))),
                      (!$unsigned($unsigned((8'had))))};
  always
    @(posedge clk) begin
      reg30 <= (-wire28);
    end
  assign wire31 = wire29[(3'h4):(1'h0)];
  assign wire32 = $unsigned((!wire20));
  assign wire33 = (^{$signed($signed(wire32[(1'h1):(1'h1)]))});
  assign wire34 = $signed(wire33[(1'h1):(1'h1)]);
  assign wire35 = {($unsigned(($unsigned(wire25) | wire29[(4'h8):(3'h5)])) | (8'h9c))};
  assign wire36 = $unsigned((&$signed(reg30)));
  assign wire37 = {wire26[(3'h4):(1'h1)]};
  assign wire38 = ($signed((wire19[(1'h1):(1'h1)] ?
                      $signed(wire35) : wire21)) - $signed(wire18[(1'h1):(1'h1)]));
  assign wire39 = wire25;
  assign wire40 = wire23[(1'h1):(1'h0)];
  assign wire41 = $unsigned((~^wire18));
endmodule

module module131
#(parameter param149 = (((8'hb1) < (+((8'hb3) ? ((8'hbb) == (8'ha9)) : (8'ha5)))) ? (((^~((8'h9f) ? (8'hbc) : (8'hbf))) ? (~((7'h44) ~^ (7'h44))) : (|((8'haf) ? (8'h9f) : (8'haf)))) ^~ (-(((8'ha6) <<< (7'h41)) ? {(8'hb2), (8'h9f)} : ((8'hb7) ? (8'hab) : (8'hb4))))) : {((((8'hb4) > (7'h44)) ? ((8'hb2) ? (8'hbe) : (8'h9c)) : ((8'hb9) >>> (8'ha8))) >= (~&(8'hb3))), (-(8'hab))}), 
parameter param150 = param149)
(y, clk, wire135, wire134, wire133, wire132);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire135;
  input wire signed [(4'h9):(1'h0)] wire134;
  input wire signed [(3'h5):(1'h0)] wire133;
  input wire [(4'hc):(1'h0)] wire132;
  wire signed [(5'h13):(1'h0)] wire148;
  wire [(4'h9):(1'h0)] wire147;
  wire signed [(3'h4):(1'h0)] wire146;
  wire signed [(4'h8):(1'h0)] wire145;
  wire [(5'h10):(1'h0)] wire144;
  wire signed [(5'h15):(1'h0)] wire143;
  wire [(5'h13):(1'h0)] wire142;
  wire [(5'h11):(1'h0)] wire141;
  wire signed [(5'h13):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire138;
  wire [(3'h5):(1'h0)] wire137;
  wire signed [(5'h15):(1'h0)] wire136;
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 (1'h0)};
  assign wire136 = (!($unsigned(($unsigned(wire132) ?
                       wire132 : wire133)) <<< wire134[(2'h3):(1'h1)]));
  assign wire137 = $unsigned($unsigned(wire134));
  assign wire138 = $signed(((&(-(wire132 ? wire133 : wire135))) ?
                       (wire134[(4'h8):(1'h0)] ?
                           (8'hb9) : {$signed((8'hb1)),
                               (wire134 - wire135)}) : wire132));
  assign wire139 = wire132[(1'h0):(1'h0)];
  assign wire140 = $unsigned(wire135);
  assign wire141 = (wire137 ?
                       $signed(((~{wire134}) * $unsigned((~^wire137)))) : $unsigned(($signed((wire138 != wire136)) < (|{wire133,
                           wire136}))));
  assign wire142 = $signed($unsigned((8'ha0)));
  assign wire143 = ({(&$unsigned((wire141 >= wire134)))} ^~ $signed((($unsigned((8'hb7)) << $unsigned(wire135)) ?
                       {wire141[(5'h11):(4'hf)],
                           wire135[(4'h8):(4'h8)]} : wire142)));
  assign wire144 = (($signed(($signed(wire143) ?
                       $unsigned(wire143) : wire141)) && ((~(8'hb2)) ?
                       {{wire134, wire133},
                           (wire135 + wire139)} : $unsigned($signed(wire139)))) > $signed((~|{((8'ha9) | wire143)})));
  assign wire145 = {{wire143}, $signed({wire135, wire143})};
  assign wire146 = $signed((+{wire136}));
  assign wire147 = $signed(wire137[(3'h4):(2'h3)]);
  assign wire148 = $unsigned((8'haa));
endmodule
