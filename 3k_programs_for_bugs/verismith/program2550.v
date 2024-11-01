module top
#(parameter param209 = (8'ha2), 
parameter param210 = {(^~(|{(!param209)}))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire208;
  wire [(4'ha):(1'h0)] wire207;
  wire signed [(2'h2):(1'h0)] wire206;
  wire signed [(5'h15):(1'h0)] wire205;
  wire [(5'h15):(1'h0)] wire203;
  wire signed [(2'h3):(1'h0)] wire172;
  wire [(3'h6):(1'h0)] wire171;
  wire [(5'h11):(1'h0)] wire170;
  wire [(3'h4):(1'h0)] wire169;
  wire signed [(5'h10):(1'h0)] wire168;
  wire signed [(5'h13):(1'h0)] wire167;
  wire signed [(4'hf):(1'h0)] wire164;
  wire [(4'he):(1'h0)] wire163;
  wire signed [(5'h14):(1'h0)] wire162;
  wire signed [(4'h9):(1'h0)] wire161;
  wire signed [(3'h6):(1'h0)] wire159;
  wire signed [(5'h14):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire102;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg166 = (1'h0);
  reg [(5'h13):(1'h0)] reg165 = (1'h0);
  assign y = {wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire203,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire159,
                 wire104,
                 wire102,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg166,
                 reg165,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = wire4;
  assign wire6 = $unsigned($signed($signed($signed($signed(wire5)))));
  assign wire7 = wire1;
  module8 #() modinst103 (wire102, clk, wire2, wire5, wire4, wire3);
  assign wire104 = {(^wire7[(3'h4):(3'h4)]), $signed(wire1)};
  module105 #() modinst160 (wire159, clk, wire102, wire1, wire7, wire3);
  assign wire161 = {$signed((~{(wire0 <= wire2), $signed(wire0)}))};
  assign wire162 = (!($signed(wire0[(2'h3):(1'h1)]) ?
                       wire2[(2'h2):(1'h1)] : {wire4, wire159[(2'h2):(1'h1)]}));
  assign wire163 = $unsigned($unsigned({{$unsigned((8'hb1))}}));
  assign wire164 = (~|(|(|{wire6})));
  always
    @(posedge clk) begin
      reg165 <= (!{$unsigned((!(^wire0))), (8'hae)});
      reg166 <= $signed((~|$unsigned($unsigned({reg165}))));
    end
  assign wire167 = wire163;
  assign wire168 = ($unsigned((&(8'hb6))) || ((wire1 <= $unsigned((~wire159))) + $signed(((wire0 ?
                       wire159 : wire102) << $unsigned(wire102)))));
  assign wire169 = (^(wire102 ?
                       $signed($signed($unsigned(wire162))) : wire102));
  assign wire170 = ({wire6, (~|wire102)} << $unsigned((wire2[(5'h11):(4'he)] ?
                       wire6[(1'h1):(1'h1)] : $unsigned((wire164 != wire7)))));
  assign wire171 = wire159[(1'h1):(1'h0)];
  assign wire172 = (8'ha9);
  module173 #() modinst204 (.y(wire203), .wire177(wire167), .wire175(wire7), .wire176(wire163), .wire174(wire6), .clk(clk));
  assign wire205 = $unsigned(((wire4[(2'h2):(1'h1)] << wire1[(3'h7):(2'h3)]) == $signed(wire161[(2'h3):(2'h2)])));
  assign wire206 = $signed(wire4);
  assign wire207 = ($unsigned(wire159) ?
                       (wire161[(3'h4):(3'h4)] ?
                           wire102[(4'hb):(4'ha)] : (~^reg166)) : $signed((($signed(wire171) ?
                           (wire171 || wire5) : $unsigned(wire102)) ^~ $unsigned($unsigned((8'h9e))))));
  assign wire208 = (~wire104[(4'hb):(2'h3)]);
endmodule

module module173  (y, clk, wire174, wire175, wire176, wire177);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire174;
  input wire signed [(5'h13):(1'h0)] wire175;
  input wire signed [(4'he):(1'h0)] wire176;
  input wire signed [(4'hf):(1'h0)] wire177;
  wire signed [(4'hb):(1'h0)] wire202;
  wire signed [(5'h11):(1'h0)] wire201;
  wire [(5'h11):(1'h0)] wire200;
  wire signed [(2'h3):(1'h0)] wire178;
  wire signed [(4'he):(1'h0)] wire198;
  assign y = {wire202, wire201, wire200, wire178, wire198, (1'h0)};
  assign wire178 = $signed(wire175[(2'h3):(2'h2)]);
  module179 #() modinst199 (wire198, clk, wire178, wire177, wire176, wire174, wire175);
  assign wire200 = ((($signed($unsigned(wire176)) ^ {(wire177 ?
                                   wire177 : wire175)}) ?
                           (wire174[(4'h8):(1'h0)] - ($unsigned(wire178) | wire174)) : {{$unsigned(wire177)},
                               ((wire178 ?
                                   wire177 : (8'hbe)) <<< ((8'had) >> wire175))}) ?
                       (((~|$unsigned(wire177)) >> ($signed(wire174) ?
                           (wire178 ^ (8'h9c)) : {wire178,
                               wire175})) ^~ ((!(+wire178)) ?
                           $signed((~wire175)) : $unsigned((wire177 ?
                               wire178 : wire174)))) : ($unsigned(($signed(wire176) ?
                           wire174[(3'h6):(3'h6)] : (wire177 * wire176))) < $signed($signed((|(8'hb5))))));
  assign wire201 = (~&$unsigned((wire175 ?
                       $signed($signed(wire175)) : ($unsigned(wire176) >= $signed(wire175)))));
  assign wire202 = (^~(^wire175));
endmodule

module module105  (y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h1df):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire109;
  input wire signed [(4'h8):(1'h0)] wire108;
  input wire signed [(3'h7):(1'h0)] wire107;
  input wire [(4'hc):(1'h0)] wire106;
  wire [(4'hd):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire156;
  wire signed [(4'hc):(1'h0)] wire121;
  wire signed [(3'h6):(1'h0)] wire120;
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg131 = (1'h0);
  reg [(5'h15):(1'h0)] reg132 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg [(4'he):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(4'h9):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg142 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg144 = (1'h0);
  assign y = {wire158,
                 wire156,
                 wire121,
                 wire120,
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
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire107[(3'h4):(1'h0)])
        begin
          reg110 <= $unsigned($signed($unsigned({(wire107 * wire108),
              wire107})));
          reg111 <= wire107;
          reg112 <= $unsigned((|(reg111[(4'h9):(2'h2)] ?
              (~&(^~wire107)) : (+wire108))));
          if ((!(reg111[(3'h4):(1'h1)] ?
              (reg110 ?
                  (wire108 ~^ (wire108 ?
                      wire109 : reg111)) : (8'had)) : wire108[(3'h4):(1'h0)])))
            begin
              reg113 <= $signed(($unsigned(($signed(reg111) ?
                  ((8'ha7) ? wire109 : wire108) : (wire108 ?
                      wire107 : (8'ha6)))) >>> ($signed($signed(reg112)) < (~|(wire107 ?
                  reg111 : reg111)))));
              reg114 <= reg113[(3'h7):(3'h7)];
            end
          else
            begin
              reg113 <= (wire106[(1'h0):(1'h0)] * ($signed($signed($unsigned(wire106))) * wire109[(2'h2):(1'h0)]));
              reg114 <= {wire107[(3'h5):(1'h0)]};
              reg115 <= $signed($signed((reg112[(2'h2):(2'h2)] ?
                  reg113[(4'hd):(3'h6)] : wire108[(3'h7):(3'h6)])));
              reg116 <= ((-$unsigned(reg115)) ?
                  ($signed(((reg115 ~^ reg111) && $signed((8'hbc)))) <= wire106[(1'h0):(1'h0)]) : reg115);
              reg117 <= $unsigned({($unsigned((wire108 >> wire107)) ?
                      (^~$unsigned(wire109)) : (|wire108[(3'h5):(2'h3)])),
                  $signed(((&reg110) ? (reg115 ? reg115 : wire107) : reg110))});
            end
          reg118 <= (8'haa);
        end
      else
        begin
          if (reg115)
            begin
              reg110 <= {(reg111[(4'h8):(4'h8)] < (8'hbe))};
              reg111 <= $unsigned((&(~^($signed(reg117) >> wire106[(4'hc):(4'ha)]))));
              reg112 <= (reg111[(4'ha):(3'h6)] ?
                  {{$signed(wire108[(3'h4):(1'h1)]), $signed(reg110)},
                      ((((8'hb9) ^~ reg117) > $unsigned(wire109)) << {(~^(8'hb1))})} : reg116[(2'h2):(2'h2)]);
            end
          else
            begin
              reg110 <= {$signed(($unsigned(reg117[(4'h8):(4'h8)]) - $signed((~|reg110)))),
                  (~(reg118 ? reg110[(3'h4):(2'h3)] : reg117[(3'h4):(3'h4)]))};
              reg111 <= reg111;
              reg112 <= (wire107[(3'h7):(1'h1)] ?
                  reg114 : {{((reg114 ? reg112 : reg115) ?
                              {reg110, reg110} : {reg116})}});
              reg113 <= $unsigned(wire109[(2'h2):(1'h0)]);
            end
          reg114 <= $signed(($unsigned($signed({wire109})) <= {(~|reg114[(3'h4):(2'h3)])}));
          reg115 <= wire107;
          reg116 <= $unsigned($signed((reg118 <= ($signed(wire109) >= (8'h9c)))));
        end
      reg119 <= reg114[(4'h8):(4'h8)];
    end
  assign wire120 = wire107[(2'h3):(1'h0)];
  assign wire121 = {($unsigned(reg110[(2'h3):(1'h1)]) ?
                           {reg114[(2'h3):(2'h3)]} : (~|(!(~^(8'ha2)))))};
  always
    @(posedge clk) begin
      reg122 <= reg113[(1'h1):(1'h0)];
      reg123 <= wire108;
      if ((~|$signed({({wire108} ? wire109 : {(8'haa), (8'hbc)})})))
        begin
          reg124 <= (reg117[(4'hc):(3'h5)] ?
              ((^wire108) == reg113[(3'h7):(3'h6)]) : reg115);
          reg125 <= reg115[(3'h6):(1'h0)];
          reg126 <= (-((8'haf) & $signed($signed(wire107[(2'h3):(1'h0)]))));
          reg127 <= wire109[(2'h2):(1'h1)];
        end
      else
        begin
          reg124 <= ($unsigned((~$unsigned((reg124 <= wire108)))) ?
              (8'hbe) : reg124);
          reg125 <= $unsigned(reg114);
        end
      reg128 <= (~&wire107[(1'h1):(1'h0)]);
    end
  always
    @(posedge clk) begin
      if ({reg117[(1'h1):(1'h1)],
          ($unsigned(((~|wire121) ^ (reg124 ? (7'h40) : reg128))) ?
              ($signed($signed((8'hab))) ?
                  (~|reg116[(2'h2):(1'h0)]) : (~&(reg111 ?
                      (8'h9c) : reg122))) : $signed({reg125, (~&reg110)}))})
        begin
          reg129 <= reg113;
        end
      else
        begin
          reg129 <= (~|({$signed(reg122[(1'h1):(1'h1)])} ~^ ($unsigned($signed(reg127)) < $signed($unsigned(reg117)))));
          reg130 <= (reg112 >>> reg111[(3'h4):(1'h1)]);
          reg131 <= {((((7'h43) <<< reg126) ?
                      $signed($unsigned(reg112)) : reg115) ?
                  reg114[(1'h1):(1'h1)] : ($signed(wire109[(2'h3):(2'h3)]) & $signed({reg111})))};
          reg132 <= {{(reg123 || ($signed(reg123) << reg126[(5'h11):(4'hc)]))}};
          reg133 <= (wire120 < reg118);
        end
      if ($signed($signed((($signed(reg124) ?
              (reg125 >> wire121) : $signed(reg125)) ?
          reg122 : (8'hb4)))))
        begin
          if ($unsigned(wire108))
            begin
              reg134 <= reg130;
              reg135 <= (($unsigned(reg122[(2'h2):(1'h0)]) ?
                      wire106 : ($signed($unsigned(reg126)) ?
                          ((reg110 ?
                              reg128 : reg117) && ((8'ha7) & reg118)) : wire106[(1'h0):(1'h0)])) ?
                  (reg130 <= ((~|reg114[(3'h5):(1'h0)]) ?
                      {reg124[(4'hf):(3'h6)]} : reg122)) : reg112);
              reg136 <= {((~$unsigned((reg135 ? reg110 : wire120))) ?
                      reg112 : $signed(($unsigned(reg129) ?
                          reg124[(2'h3):(2'h3)] : $unsigned((8'hb6))))),
                  reg114[(3'h6):(1'h1)]};
            end
          else
            begin
              reg134 <= (({(7'h43)} << $unsigned((reg113 ~^ reg116[(1'h1):(1'h1)]))) ?
                  $signed(($unsigned($unsigned(wire121)) != wire121[(1'h0):(1'h0)])) : reg119);
              reg135 <= ((|$signed(((-reg113) ?
                      (&reg131) : reg118[(1'h0):(1'h0)]))) ?
                  $unsigned((~|{(reg124 ?
                          (8'hbe) : reg135)})) : reg126[(4'hf):(2'h2)]);
            end
          if ({((!((wire109 ? (8'ha1) : reg122) ?
                      (reg134 >>> wire121) : (wire120 ? reg115 : (8'hb9)))) ?
                  reg113[(3'h5):(3'h5)] : reg115)})
            begin
              reg137 <= $signed((((&(reg124 ? reg113 : wire107)) ?
                  reg126 : $signed($unsigned(reg132))) == $unsigned((^~reg110))));
              reg138 <= $signed($signed(reg132));
              reg139 <= ((((((7'h41) > reg123) ?
                              (reg132 ^ reg130) : (^reg136)) ?
                          reg129[(2'h2):(1'h1)] : ($unsigned(reg113) ?
                              reg115 : (reg114 ? reg131 : reg110))) ?
                      ($unsigned((~^wire107)) >>> $unsigned({wire120})) : ((((7'h44) ?
                          reg130 : wire109) << ((8'haf) | (8'hbc))) <= (reg130[(1'h0):(1'h0)] ?
                          reg112 : (wire106 ? (8'ha9) : reg135)))) ?
                  $signed({$signed(((8'ha1) + (8'ha8)))}) : ((~((wire120 == reg115) ?
                          (8'hb7) : $signed(reg128))) ?
                      (^~($unsigned((8'ha4)) ?
                          {reg136, reg116} : {(8'hab), reg130})) : (reg123 ?
                          (!{(8'hb9)}) : reg125[(3'h4):(1'h1)])));
              reg140 <= $signed((|(8'ha4)));
            end
          else
            begin
              reg137 <= wire108;
              reg138 <= $signed((reg117 != $signed($signed(reg110[(4'ha):(3'h7)]))));
            end
          reg141 <= (~&($signed(reg115) | $signed(reg126)));
        end
      else
        begin
          if (reg138)
            begin
              reg134 <= (reg112 ? {reg125} : (~^wire107[(1'h1):(1'h1)]));
            end
          else
            begin
              reg134 <= ({reg124[(2'h2):(1'h1)]} + {{(wire109 ?
                          $unsigned((8'hb7)) : reg134),
                      {reg132[(5'h14):(1'h0)], $signed(reg138)}},
                  (($signed((8'h9f)) ?
                          wire109[(3'h4):(2'h3)] : ((8'hb3) ^~ wire106)) ?
                      (reg138[(3'h7):(3'h4)] && (!reg115)) : $unsigned({(8'hbc),
                          reg137}))});
              reg135 <= ((|wire121[(2'h2):(2'h2)]) != $signed(wire106[(4'h8):(3'h4)]));
            end
          reg136 <= (reg128 ^ (reg133 ?
              ($signed((reg111 ?
                  reg122 : reg118)) + reg129) : ({reg110[(1'h0):(1'h0)]} ?
                  ((reg122 ? reg139 : reg124) ?
                      (|reg112) : (wire106 ?
                          reg133 : (8'ha4))) : (-(^~reg136)))));
          reg137 <= reg125[(5'h10):(1'h0)];
          reg138 <= $unsigned($signed($unsigned(reg138[(5'h14):(1'h0)])));
          reg139 <= ((reg115[(1'h0):(1'h0)] != reg132) ?
              $signed((reg117 || (reg139 ?
                  $signed(reg126) : reg113[(3'h6):(2'h2)]))) : (8'hb0));
        end
      reg142 <= $unsigned((((~|$unsigned((8'hae))) || $signed(reg113)) >>> reg119));
      reg143 <= $signed($unsigned(reg113[(1'h1):(1'h0)]));
      reg144 <= reg140;
    end
  module145 #() modinst157 (.clk(clk), .y(wire156), .wire148(reg136), .wire146(reg117), .wire147(reg122), .wire150(reg129), .wire149(reg118));
  assign wire158 = reg139;
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h317):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire11;
  input wire signed [(4'ha):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire101;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire48;
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  assign y = {wire101,
                 wire76,
                 wire61,
                 wire60,
                 wire50,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire48,
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
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((8'hac))
        begin
          reg13 <= ({$unsigned((~|wire9)), wire11} ?
              ({$signed((8'hb7)),
                  (~|(^wire11))} != $unsigned(((wire10 ~^ (8'hb3)) ?
                  {(8'h9d),
                      wire10} : $signed(wire10)))) : (!(($unsigned(wire10) * (wire10 || wire12)) ?
                  wire9[(5'h11):(4'he)] : $unsigned(wire11[(3'h4):(3'h4)]))));
          if ((!(wire9 ? (&($signed(reg13) != $signed(wire9))) : (~^reg13))))
            begin
              reg14 <= ($unsigned(($signed((^wire10)) ~^ ({wire10} ~^ $signed(wire9)))) ?
                  wire11 : (|(|wire12)));
              reg15 <= (wire9 && ($unsigned({wire12, (wire10 - wire11)}) ?
                  (+wire11[(2'h3):(2'h3)]) : wire9));
              reg16 <= (!$unsigned(($unsigned((~reg13)) ^~ ({wire10} ?
                  (wire11 ? wire12 : reg14) : (wire10 >> (8'hbd))))));
              reg17 <= wire10[(3'h4):(1'h0)];
              reg18 <= {$signed((~^reg16[(1'h1):(1'h1)]))};
            end
          else
            begin
              reg14 <= (reg15 <= $signed($signed(reg14)));
              reg15 <= (~&reg14[(3'h5):(1'h0)]);
              reg16 <= $unsigned($unsigned(({$signed(wire9)} ?
                  $unsigned($unsigned(wire11)) : ($signed(reg18) ?
                      ((8'hbb) ~^ reg14) : (reg18 ? (8'ha0) : reg13)))));
              reg17 <= wire9[(5'h11):(4'hb)];
              reg18 <= $unsigned(wire12[(4'h8):(2'h2)]);
            end
        end
      else
        begin
          reg13 <= reg15[(5'h13):(1'h1)];
          reg14 <= reg18;
          reg15 <= reg14;
        end
    end
  assign wire19 = wire11;
  assign wire20 = $signed({$unsigned(reg15),
                      $signed($unsigned($signed(wire9)))});
  assign wire21 = (8'ha7);
  assign wire22 = $unsigned($unsigned(({(reg15 ?
                          (8'hba) : wire9)} >= $unsigned($signed(reg14)))));
  assign wire23 = $unsigned($unsigned(wire9));
  assign wire24 = (wire19 || reg15[(4'hc):(3'h5)]);
  assign wire25 = (8'ha8);
  assign wire26 = $signed($unsigned(wire12));
  module27 #() modinst49 (wire48, clk, reg16, wire23, wire25, wire19);
  assign wire50 = (-reg14[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if ({(8'hb1), $signed(wire26)})
        begin
          reg51 <= (8'hba);
        end
      else
        begin
          if (reg16[(2'h3):(2'h2)])
            begin
              reg51 <= $signed((~|(^(reg14 ?
                  {wire10} : (wire50 ? wire9 : wire9)))));
            end
          else
            begin
              reg51 <= ($unsigned($unsigned((((8'h9e) ? (8'hac) : wire11) ?
                      reg15[(1'h1):(1'h0)] : $unsigned(reg13)))) ?
                  (^~$signed(((reg18 << reg16) ?
                      (wire23 ~^ reg15) : (wire26 & wire11)))) : (8'ha8));
              reg52 <= (~&((((wire19 && wire11) ?
                          $signed((8'ha6)) : {wire24, wire11}) ?
                      (((8'hbc) ? reg17 : wire48) ?
                          $signed(reg14) : $unsigned(wire19)) : (wire22[(1'h1):(1'h0)] ?
                          ((8'hb0) << wire12) : $unsigned(wire9))) ?
                  wire9 : ((reg17 ~^ (reg51 != wire22)) ^~ $unsigned($signed(reg15)))));
              reg53 <= (^~(reg14 | ({$unsigned(wire23), reg18[(2'h2):(1'h1)]} ?
                  (~$signed(wire26)) : $unsigned({wire23, (8'haa)}))));
            end
          reg54 <= wire23;
          if (((8'ha6) ? reg53[(4'h8):(3'h4)] : (^reg18)))
            begin
              reg55 <= $signed(wire20);
              reg56 <= reg51;
            end
          else
            begin
              reg55 <= wire48[(1'h1):(1'h1)];
            end
          reg57 <= (8'hbe);
          reg58 <= wire23[(5'h14):(5'h10)];
        end
      reg59 <= ({{$signed((-reg55)),
              (((7'h41) ?
                  wire50 : wire50) ~^ wire23[(4'hc):(2'h3)])}} | $unsigned(((wire23[(1'h1):(1'h0)] * (wire21 ?
              wire48 : wire50)) ?
          wire21 : (!wire10))));
    end
  assign wire60 = $signed((+(&((~&reg16) ?
                      ((7'h43) ? reg15 : wire9) : $signed((8'hb5))))));
  assign wire61 = reg15[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg62 <= $signed($signed(((+$unsigned(wire50)) == (|$signed(wire26)))));
      if ($signed(((|reg56) ?
          $signed(reg62[(1'h1):(1'h1)]) : (wire26[(4'h8):(2'h3)] | reg55[(3'h5):(1'h1)]))))
        begin
          if (reg53[(3'h6):(3'h4)])
            begin
              reg63 <= {({reg52, (&wire12)} ^ ($unsigned((reg56 ?
                      (8'hb7) : wire11)) * ({wire23, wire26} ?
                      $signed((7'h40)) : (reg52 >> wire21))))};
              reg64 <= ($signed(($signed($signed(wire11)) < $signed(wire22[(1'h1):(1'h1)]))) ?
                  {$unsigned($unsigned(wire10[(1'h0):(1'h0)])),
                      $signed((~wire12))} : wire20);
              reg65 <= (8'ha1);
            end
          else
            begin
              reg63 <= {$unsigned(wire10[(3'h6):(2'h2)]),
                  ($signed($unsigned((reg62 ? wire50 : reg15))) ?
                      ($unsigned((+(8'hb7))) ?
                          $unsigned(reg53[(1'h1):(1'h1)]) : wire11) : $unsigned(({reg15} ?
                          (&wire48) : {wire9, reg64})))};
              reg64 <= $unsigned((reg15 || (^~reg59[(3'h5):(2'h3)])));
              reg65 <= ($unsigned($signed(reg54)) + reg13[(5'h10):(4'he)]);
            end
          reg66 <= ({$signed((!wire22[(1'h0):(1'h0)])),
              wire23} + (($unsigned({reg59, reg54}) ?
                  $unsigned(reg58) : wire10[(3'h6):(2'h2)]) ?
              (((~&wire50) ?
                  (wire19 != reg16) : (~reg18)) > reg64[(3'h4):(3'h4)]) : wire12[(4'h8):(2'h3)]));
          if (($unsigned(((reg53 << $unsigned((8'hae))) ?
              $unsigned(reg57[(3'h6):(1'h0)]) : $unsigned((reg54 + (7'h43))))) ^ reg51))
            begin
              reg67 <= (~&(|reg55[(1'h0):(1'h0)]));
            end
          else
            begin
              reg67 <= {((8'hbe) ?
                      $unsigned($signed((reg17 || reg55))) : $unsigned(reg63[(1'h1):(1'h1)]))};
              reg68 <= ($signed((reg18 ?
                  {(wire20 ? reg51 : reg18),
                      (wire9 >> reg52)} : (reg54 != (~^wire12)))) ^~ (~&$unsigned($signed($signed(reg51)))));
              reg69 <= (+$unsigned({(8'haa)}));
              reg70 <= wire21;
              reg71 <= ($unsigned(reg65) ?
                  $unsigned((^~(^{reg14}))) : {reg68[(1'h1):(1'h1)], reg54});
            end
          reg72 <= reg69[(2'h2):(1'h1)];
        end
      else
        begin
          reg63 <= ((({(^reg71),
                  reg51[(2'h3):(2'h2)]} <<< $signed(reg71[(4'h9):(1'h0)])) ?
              (^~(~^(reg53 ? wire25 : wire48))) : {$signed((reg57 ?
                      wire10 : reg16))}) * ((!$signed((wire11 == reg63))) | $unsigned(((reg64 ?
                  wire10 : (8'hb8)) ?
              wire10[(1'h0):(1'h0)] : {(7'h44)}))));
          reg64 <= (&($unsigned((-(wire60 ? wire23 : (8'hac)))) ?
              reg70[(4'hc):(1'h0)] : ((8'hb5) >= (8'h9c))));
          reg65 <= wire26;
          reg66 <= {((((reg13 ? reg62 : reg51) && $signed(reg56)) ?
                  $unsigned({wire9, wire60}) : (reg67 ?
                      $unsigned(reg72) : $unsigned(reg62))) ^~ (^$unsigned((-reg17))))};
        end
      reg73 <= (~^{$unsigned(reg54)});
      reg74 <= $signed(wire50[(4'h8):(3'h4)]);
      reg75 <= reg52[(3'h4):(2'h3)];
    end
  assign wire76 = ($signed((8'hac)) ?
                      (~($signed(reg16) ?
                          reg51 : (wire23 > $unsigned(wire48)))) : $signed($signed((reg70[(4'he):(4'hc)] + wire26))));
  always
    @(posedge clk) begin
      reg77 <= (8'ha6);
      if ((^~$signed({($signed(wire25) ? (!reg67) : (~&reg70))})))
        begin
          if (wire21[(5'h10):(5'h10)])
            begin
              reg78 <= reg59[(2'h2):(1'h1)];
              reg79 <= (~wire23[(5'h10):(4'hb)]);
              reg80 <= {(~^$signed(($signed(reg77) ?
                      (reg79 ? reg72 : wire60) : (reg58 ? reg79 : reg72))))};
              reg81 <= {{$unsigned(wire21[(4'h9):(3'h5)]),
                      reg56[(1'h0):(1'h0)]}};
              reg82 <= ($unsigned(((reg66[(4'he):(3'h7)] ?
                      (reg58 ? reg59 : reg79) : reg68) ?
                  (&{wire12}) : reg74[(2'h2):(1'h1)])) || ({(!$signed(reg51)),
                      $unsigned((~wire12))} ?
                  wire12[(3'h7):(2'h3)] : (&$signed($signed(reg74)))));
            end
          else
            begin
              reg78 <= wire60;
              reg79 <= wire48;
            end
          reg83 <= reg16;
          if ((8'hb2))
            begin
              reg84 <= (wire11[(1'h1):(1'h0)] ?
                  $signed({((^~wire11) < (reg18 ? wire22 : reg73)),
                      reg82[(3'h5):(3'h5)]}) : (+wire48[(4'hb):(1'h1)]));
              reg85 <= $signed({$unsigned($unsigned(reg82)), wire76});
              reg86 <= {wire9,
                  ($unsigned($signed({reg58, (8'h9d)})) ?
                      {(reg64 ?
                              (wire10 ?
                                  wire10 : (8'ha0)) : reg81)} : wire25[(3'h4):(1'h0)])};
            end
          else
            begin
              reg84 <= (8'ha0);
              reg85 <= ($unsigned(wire21[(5'h12):(3'h4)]) ? reg57 : reg67);
              reg86 <= reg51[(3'h6):(1'h0)];
              reg87 <= reg80;
              reg88 <= $signed($signed($signed($signed(reg78))));
            end
          reg89 <= wire23[(1'h0):(1'h0)];
          if ($signed(($unsigned((reg63 == reg80)) ?
              reg54[(3'h6):(2'h2)] : reg74)))
            begin
              reg90 <= (~|(^({{wire50, reg63},
                  ((8'haa) != (8'ha2))} ^ $signed((wire10 | reg78)))));
              reg91 <= ((8'hab) ?
                  reg78[(3'h6):(3'h5)] : ($signed(reg56) ?
                      $unsigned($signed((|wire9))) : $unsigned($signed((reg71 ?
                          reg53 : reg85)))));
              reg92 <= ({({$unsigned(reg72)} ?
                          (|$signed(wire76)) : ((reg53 ?
                              (8'had) : reg17) <<< (wire12 ^~ reg52)))} ?
                  $unsigned($unsigned($unsigned((&reg18)))) : (~&(^{(wire60 ?
                          wire25 : reg55),
                      {reg55}})));
              reg93 <= {($signed($signed(reg80)) ?
                      reg72[(3'h7):(1'h0)] : $unsigned(wire48[(4'h8):(2'h3)])),
                  (reg79[(1'h0):(1'h0)] ?
                      reg16[(3'h5):(1'h0)] : ($signed((reg79 >> reg80)) && (wire22 != ((8'hb7) >>> reg71))))};
              reg94 <= ($signed((7'h44)) >> (reg14 >> (&(reg65[(4'h9):(4'h9)] ?
                  $unsigned(reg86) : $signed((8'ha8))))));
            end
          else
            begin
              reg90 <= $unsigned(reg94[(3'h5):(2'h3)]);
              reg91 <= $signed((({reg63,
                      (reg68 ? reg75 : (8'h9e))} && $signed((reg89 ?
                      (8'hbe) : reg83))) ?
                  ($signed($unsigned(reg63)) ?
                      ((^reg51) ?
                          (reg68 & (8'h9f)) : $signed(wire20)) : (^~reg72)) : (!{(!reg53),
                      (reg15 ? reg94 : wire9)})));
              reg92 <= $unsigned((wire9 ?
                  $signed({$unsigned(wire10)}) : reg51[(1'h1):(1'h1)]));
              reg93 <= reg68;
              reg94 <= ($unsigned((+wire60[(3'h4):(2'h3)])) ?
                  reg86[(2'h3):(2'h2)] : $unsigned({$signed((|reg16)), reg87}));
            end
        end
      else
        begin
          reg78 <= $signed(reg59);
          if ($unsigned($signed($unsigned($signed((reg91 ? reg93 : (8'h9e)))))))
            begin
              reg79 <= (~|wire24);
            end
          else
            begin
              reg79 <= {($unsigned($signed((7'h42))) ?
                      ($unsigned({reg17, reg69}) ?
                          $signed(reg65) : reg86[(2'h3):(2'h2)]) : $signed(reg86[(1'h0):(1'h0)])),
                  ((!reg81) - reg17[(1'h0):(1'h0)])};
              reg80 <= $unsigned((reg78[(3'h5):(2'h3)] << ((reg87 >>> (+reg59)) ?
                  (!{(8'h9d), reg89}) : (8'ha3))));
              reg81 <= $signed({((reg54[(4'h8):(3'h5)] | (wire60 ?
                      (8'hae) : (8'ha4))) <= $signed((&reg80))),
                  $signed((~&(8'hac)))});
              reg82 <= $signed({$signed(reg84)});
            end
        end
      reg95 <= reg82[(3'h4):(1'h1)];
      reg96 <= wire21;
      if ($signed(((^~(7'h40)) ? (8'hbb) : $unsigned({$signed(wire19)}))))
        begin
          reg97 <= $signed(($signed($signed(wire25)) ?
              $unsigned($signed({reg82})) : (+(^(~|reg65)))));
          reg98 <= reg85[(4'hd):(4'h9)];
          reg99 <= (8'ha5);
          reg100 <= (-$signed(reg80));
        end
      else
        begin
          reg97 <= reg77;
          reg98 <= ((^reg13) == ($signed(reg57) ?
              $unsigned((!(^wire24))) : $signed(((reg77 ?
                  reg80 : wire25) ^ (reg64 ? wire19 : reg94)))));
          reg99 <= (reg55[(3'h4):(3'h4)] ?
              $signed((((wire60 ?
                  reg86 : reg74) & $unsigned(reg59)) > (wire61[(3'h7):(1'h1)] <= reg86[(2'h3):(1'h1)]))) : $unsigned((($signed(wire24) >= $signed(reg94)) ~^ ((reg99 + wire11) ^~ (reg70 ?
                  reg89 : reg71)))));
        end
    end
  assign wire101 = $unsigned($unsigned(($signed($signed(reg13)) ?
                       (^~reg64[(3'h6):(1'h1)]) : (wire50 ?
                           reg53 : (+reg67)))));
endmodule

module module27
#(parameter param46 = {(^((((8'ha1) ? (8'hbc) : (7'h40)) < {(8'had), (8'hbf)}) > ((^~(8'haa)) ? ((7'h44) ? (8'hae) : (8'hbf)) : ((8'ha0) >= (8'ha9))))), {((+((8'hbc) ? (8'hb2) : (8'hbf))) ? (((8'hbc) ? (8'h9d) : (8'hbd)) <<< (^(8'hac))) : {{(8'hbb), (7'h40)}})}}, 
parameter param47 = (&param46))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire31;
  input wire signed [(4'he):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire [(4'h9):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg36,
                 (1'h0)};
  assign wire32 = (~$unsigned(wire31[(1'h1):(1'h1)]));
  assign wire33 = (|(wire28[(4'h9):(2'h3)] >>> {$signed((8'hb3)), (~|wire28)}));
  assign wire34 = $signed({$unsigned(($signed(wire30) * (wire28 << wire33))),
                      $signed({$unsigned((8'hb7))})});
  assign wire35 = ((^$signed((+$signed(wire31)))) <<< $signed(wire32[(3'h7):(3'h7)]));
  always
    @(posedge clk) begin
      reg36 <= wire32[(4'ha):(1'h1)];
    end
  assign wire37 = wire32[(3'h5):(3'h4)];
  assign wire38 = $signed((8'hab));
  assign wire39 = {wire38};
  assign wire40 = ($signed(((~&wire35[(1'h0):(1'h0)]) ?
                      wire29 : ((wire31 ? (8'hae) : wire32) ?
                          (~|wire37) : (~|wire39)))) & reg36);
  assign wire41 = $signed(wire28);
  assign wire42 = $signed({(wire30 ?
                          $unsigned((wire32 ?
                              wire35 : wire33)) : ({(8'haa)} >>> (wire34 ?
                              (7'h44) : wire37)))});
  assign wire43 = (wire28 ?
                      (((((8'ha6) < wire38) * $signed((8'h9e))) ?
                              $unsigned((~|(8'hba))) : (wire34 > $signed(wire33))) ?
                          $signed((^$unsigned(wire41))) : wire37[(4'hb):(3'h5)]) : $unsigned({wire28[(4'h9):(3'h7)],
                          (~^(+wire35))}));
  assign wire44 = $unsigned((~^wire29));
  assign wire45 = $unsigned(wire40);
endmodule

module module145  (y, clk, wire150, wire149, wire148, wire147, wire146);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire150;
  input wire [(4'h8):(1'h0)] wire149;
  input wire signed [(5'h13):(1'h0)] wire148;
  input wire signed [(5'h11):(1'h0)] wire147;
  input wire signed [(3'h5):(1'h0)] wire146;
  wire [(5'h15):(1'h0)] wire153;
  wire [(2'h3):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire151;
  reg [(5'h14):(1'h0)] reg155 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  assign y = {wire153, wire152, wire151, reg155, reg154, (1'h0)};
  assign wire151 = $unsigned({$signed($unsigned($unsigned(wire148)))});
  assign wire152 = (7'h40);
  assign wire153 = {$unsigned((+$signed((wire152 ? wire146 : wire151)))),
                       ($signed({wire152[(2'h2):(1'h0)]}) << wire149)};
  always
    @(posedge clk) begin
      reg154 <= wire146[(1'h0):(1'h0)];
      reg155 <= $signed({($signed((^~wire147)) ?
              $unsigned(wire146) : (&(-reg154))),
          wire150[(4'ha):(4'ha)]});
    end
endmodule

module module179
#(parameter param196 = ({(~&({(8'ha4)} ? ((8'hac) ? (8'hbb) : (8'h9f)) : (!(8'hb2)))), ((+{(8'ha1)}) >>> (~(^(8'haa))))} ? {(^(((8'hb1) ? (7'h41) : (8'ha0)) ? (!(8'ha1)) : (~&(8'ha9))))} : ({(((8'haf) ? (8'ha6) : (8'hb0)) ? ((8'haa) ? (8'ha3) : (7'h43)) : (~(8'ha1))), (-(8'hb6))} ? ((((8'ha6) ? (8'hb2) : (8'h9e)) ? ((8'hb4) ? (7'h41) : (8'h9d)) : (&(8'ha2))) > ((~&(8'h9c)) < {(8'hb0)})) : (~(((8'hbf) ? (8'ha9) : (8'hab)) + ((8'hb2) >> (7'h40)))))), 
parameter param197 = ((!({param196, (^~param196)} ? ({param196} ? (param196 >= param196) : (-param196)) : (param196 & param196))) ? (((~^(~|(8'hb8))) ? {{(7'h41)}, ((8'ha6) * param196)} : {(~(8'haf))}) < param196) : {param196}))
(y, clk, wire184, wire183, wire182, wire181, wire180);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire184;
  input wire signed [(4'hf):(1'h0)] wire183;
  input wire signed [(4'he):(1'h0)] wire182;
  input wire [(4'hc):(1'h0)] wire181;
  input wire signed [(5'h13):(1'h0)] wire180;
  wire [(4'hd):(1'h0)] wire195;
  wire [(3'h7):(1'h0)] wire194;
  wire signed [(4'hd):(1'h0)] wire193;
  reg [(4'h8):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg191 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg190 = (1'h0);
  reg [(3'h4):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((8'hab))
        begin
          reg185 <= (^wire183);
          if (wire182)
            begin
              reg186 <= $signed($unsigned(($unsigned(wire181) ?
                  ($signed((7'h41)) ? reg185 : wire182) : $signed({reg185,
                      wire184}))));
              reg187 <= $unsigned((~^{(+$unsigned(wire184))}));
              reg188 <= (8'haa);
              reg189 <= reg185[(2'h2):(1'h1)];
            end
          else
            begin
              reg186 <= $unsigned($signed(((~&$unsigned(reg187)) & ({reg187} >>> {wire184,
                  reg186}))));
              reg187 <= wire184;
              reg188 <= ($unsigned((((wire182 < (8'hbb)) ^~ (reg187 ?
                  (8'ha5) : reg189)) & ($unsigned(reg185) ?
                  reg185[(2'h2):(2'h2)] : wire182))) ^~ (8'had));
            end
          reg190 <= $signed({(7'h40)});
          reg191 <= $signed($signed({wire181[(3'h6):(3'h5)],
              reg189[(1'h1):(1'h0)]}));
        end
      else
        begin
          if ($unsigned(reg191))
            begin
              reg185 <= $signed(reg187[(1'h0):(1'h0)]);
              reg186 <= reg188[(1'h0):(1'h0)];
            end
          else
            begin
              reg185 <= $signed({((~^wire183[(4'hd):(4'hb)]) > ($signed(reg185) || (reg189 | wire183))),
                  reg187});
            end
          reg187 <= reg186;
          reg188 <= ((8'h9d) || (~&reg188));
          reg189 <= {$unsigned((|(-$unsigned(reg189))))};
        end
      reg192 <= (8'hb7);
    end
  assign wire193 = (+(((-((8'hbd) ? reg186 : (8'ha9))) > {(reg187 >> reg186),
                           (reg187 ? reg191 : reg189)}) ?
                       ($unsigned((reg189 ? (8'hb4) : reg187)) ?
                           (&reg185[(1'h0):(1'h0)]) : $unsigned(reg190)) : ($unsigned(reg190[(1'h0):(1'h0)]) ?
                           reg185 : $signed((reg189 ? wire182 : wire182)))));
  assign wire194 = $signed(wire181);
  assign wire195 = $unsigned(((~&wire193[(3'h4):(1'h1)]) << $unsigned(wire193[(4'hc):(4'hb)])));
endmodule
