module top
#(parameter param186 = {({((^~(8'haf)) != ((8'hb6) <<< (8'hba))), (~|(+(7'h41)))} ? ((&((8'hba) >= (7'h40))) ? ({(8'ha9)} ? {(8'h9d), (8'hbf)} : ((8'hb0) ? (8'hbe) : (8'hbd))) : {((8'hae) ? (8'hbd) : (8'hb1)), (~&(8'ha2))}) : ((((8'ha2) ? (8'ha1) : (8'hab)) == ((8'hac) ? (8'ha6) : (8'hbd))) != ((~^(8'hb0)) ? (~^(8'ha8)) : ((8'hb0) ? (7'h44) : (8'ha3))))), (~&(+({(8'ha0)} | (~&(8'hb2)))))}, 
parameter param187 = (((((-param186) - (8'hb2)) >= ((param186 >>> param186) ? (^(8'hab)) : {param186})) ? (({param186} + param186) ^~ param186) : (param186 ^~ {(~|param186), ((8'hb7) ^ param186)})) ~^ param186))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire177;
  wire signed [(5'h11):(1'h0)] wire176;
  wire signed [(4'hc):(1'h0)] wire175;
  wire [(4'hc):(1'h0)] wire174;
  wire signed [(3'h6):(1'h0)] wire173;
  wire signed [(4'hf):(1'h0)] wire172;
  wire signed [(5'h11):(1'h0)] wire166;
  wire [(4'h9):(1'h0)] wire165;
  wire signed [(4'hf):(1'h0)] wire164;
  wire [(2'h3):(1'h0)] wire163;
  wire signed [(4'h9):(1'h0)] wire161;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg185 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg183 = (1'h0);
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg [(5'h10):(1'h0)] reg181 = (1'h0);
  reg [(2'h2):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg179 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg178 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg170 = (1'h0);
  reg [(3'h4):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg168 = (1'h0);
  reg [(4'hc):(1'h0)] reg167 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire161,
                 wire7,
                 wire6,
                 wire5,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 (1'h0)};
  assign wire5 = (wire2[(3'h7):(2'h3)] && (-wire1[(4'hc):(4'hb)]));
  assign wire6 = (wire0 != {(wire2[(3'h7):(1'h0)] ?
                         wire2[(1'h1):(1'h1)] : wire2[(1'h0):(1'h0)])});
  assign wire7 = wire3[(4'he):(2'h3)];
  module8 #() modinst162 (.y(wire161), .wire12(wire3), .wire10(wire0), .wire11(wire5), .wire9(wire4), .clk(clk));
  assign wire163 = $signed((&(wire4[(4'hd):(2'h2)] <= $signed(((8'hb5) ?
                       wire7 : wire5)))));
  assign wire164 = wire161[(1'h1):(1'h0)];
  assign wire165 = wire7[(5'h11):(4'hd)];
  assign wire166 = $unsigned(((($signed(wire164) ? wire165 : $signed(wire7)) ?
                           (~^wire3[(3'h7):(3'h5)]) : $unsigned((wire0 ?
                               wire0 : wire0))) ?
                       (wire5[(1'h0):(1'h0)] ?
                           (wire163[(2'h2):(1'h1)] ?
                               wire4 : wire6) : {$signed(wire163)}) : (($unsigned(wire161) ?
                               (wire165 > wire6) : ((8'ha6) ? wire4 : wire6)) ?
                           (-((8'ha3) && wire7)) : wire6)));
  always
    @(posedge clk) begin
      reg167 <= $signed(($signed({$unsigned((8'hbf))}) ?
          $signed((|(8'ha3))) : $signed(({wire0} ?
              $signed(wire161) : (wire6 ^ (7'h43))))));
      if ((~&wire166))
        begin
          reg168 <= {{((wire3[(3'h4):(1'h0)] ?
                      (|wire165) : (wire2 ?
                          wire163 : reg167)) > reg167[(4'hc):(3'h7)])}};
          reg169 <= $signed((~reg168[(1'h0):(1'h0)]));
        end
      else
        begin
          reg168 <= ({wire3} != wire163[(1'h0):(1'h0)]);
          reg169 <= $signed((($unsigned($signed((8'hab))) >= ((wire166 >> wire4) ?
              ((8'ha3) ?
                  reg168 : (8'hab)) : $signed(wire165))) >> wire166[(1'h0):(1'h0)]));
          reg170 <= $unsigned((8'h9f));
          reg171 <= ({$signed((^~wire161))} <= {($unsigned($unsigned((8'h9d))) <<< ($unsigned(wire161) * (wire0 ?
                  (8'hb3) : reg169)))});
        end
    end
  assign wire172 = $unsigned($signed($unsigned((wire0[(3'h5):(2'h3)] == (-wire2)))));
  assign wire173 = ($unsigned(((&(^reg170)) ^ reg170)) <<< (!wire2[(1'h0):(1'h0)]));
  assign wire174 = wire3[(2'h2):(1'h1)];
  assign wire175 = (~($unsigned($unsigned($unsigned(wire166))) ?
                       $signed($unsigned(((8'ha3) ?
                           wire4 : wire165))) : $signed(wire165[(3'h4):(1'h0)])));
  assign wire176 = $signed((({{reg169}} >>> $signed((&wire161))) ?
                       wire161 : $unsigned(wire6)));
  assign wire177 = (~^(~{wire161[(2'h2):(2'h2)], (|$signed((8'hb0)))}));
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed(($signed(wire163) * wire173[(1'h1):(1'h0)])))))
        begin
          reg178 <= wire164[(2'h2):(1'h0)];
          reg179 <= wire4;
          reg180 <= reg167;
          reg181 <= $unsigned(($unsigned((wire176 - wire7[(3'h4):(3'h4)])) ?
              reg170 : $signed(wire166)));
        end
      else
        begin
          if (wire164[(2'h2):(2'h2)])
            begin
              reg178 <= wire0;
              reg179 <= wire2[(1'h1):(1'h1)];
            end
          else
            begin
              reg178 <= (wire166[(5'h11):(3'h5)] ?
                  $signed($signed(wire1)) : {(8'hab),
                      $unsigned($unsigned($signed(wire1)))});
              reg179 <= (reg168 == ($unsigned((8'hbc)) ?
                  (-$unsigned($signed(wire0))) : ((|((8'hbc) - reg179)) || (wire0[(1'h1):(1'h0)] == (wire3 ?
                      wire3 : (8'hb5))))));
              reg180 <= (wire161[(1'h0):(1'h0)] ?
                  (($unsigned(wire1[(5'h13):(5'h11)]) != $unsigned((~&(8'hb7)))) == (-{(reg169 + (8'hba)),
                      ((8'hb9) ? wire164 : reg168)})) : wire1);
              reg181 <= reg171;
              reg182 <= $unsigned(wire176[(1'h0):(1'h0)]);
            end
          reg183 <= $signed(wire6);
          reg184 <= wire174;
        end
      reg185 <= wire173;
    end
endmodule

module module8
#(parameter param160 = (-((8'had) == ((~(+(8'h9c))) ? (((8'ha5) ? (8'hbb) : (8'ha1)) | (~&(7'h41))) : {{(8'ha1), (8'h9f)}}))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire159;
  wire [(5'h14):(1'h0)] wire158;
  wire signed [(4'ha):(1'h0)] wire157;
  wire [(4'hd):(1'h0)] wire156;
  wire signed [(4'hd):(1'h0)] wire155;
  wire [(4'hc):(1'h0)] wire154;
  wire signed [(4'hd):(1'h0)] wire153;
  wire [(5'h15):(1'h0)] wire151;
  wire [(3'h6):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(2'h2):(1'h0)] wire90;
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire151,
                 wire45,
                 wire13,
                 wire54,
                 wire90,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire13 = (wire10[(1'h0):(1'h0)] ?
                      wire10[(3'h5):(3'h4)] : wire10[(4'h9):(3'h4)]);
  module14 #() modinst46 (wire45, clk, wire12, wire10, wire9, wire11, wire13);
  always
    @(posedge clk) begin
      if (wire13[(3'h4):(1'h1)])
        begin
          reg47 <= $unsigned({{{$signed(wire45)}, wire13},
              (^~(wire10[(2'h2):(1'h1)] ?
                  (wire10 ? wire11 : wire11) : wire9))});
          if ($unsigned(reg47[(4'hc):(4'hc)]))
            begin
              reg48 <= wire9;
              reg49 <= {{$signed((+(&wire10))), $unsigned((~^$signed(wire10)))},
                  $unsigned(reg47[(3'h6):(1'h1)])};
            end
          else
            begin
              reg48 <= wire9;
            end
          reg50 <= {(~&reg48)};
        end
      else
        begin
          reg47 <= {{(({reg49} ? (+wire9) : (wire45 ? wire10 : reg47)) ?
                      ((8'ha3) < wire9) : wire11)},
              (~|(((reg49 ? wire12 : wire9) ?
                      reg47[(4'hd):(4'hc)] : $signed(reg48)) ?
                  {wire12} : $signed(wire45[(1'h1):(1'h1)])))};
        end
      reg51 <= ((($unsigned((!reg48)) - $unsigned($signed(wire9))) ?
          reg47 : wire10) * ($unsigned($signed(wire45)) - wire12[(4'h8):(3'h4)]));
      if ($signed($signed(reg48)))
        begin
          reg52 <= wire13;
          reg53 <= {wire9[(4'h9):(4'h8)], $signed($unsigned(reg52))};
        end
      else
        begin
          reg52 <= {{{(reg49[(3'h6):(3'h6)] >> $signed(reg47)), reg53}}};
          reg53 <= $signed((wire13 - {reg50, {reg53}}));
        end
    end
  assign wire54 = (($unsigned((8'hbc)) < $signed(reg53)) * $unsigned($unsigned(reg47[(4'hc):(4'h9)])));
  module55 #() modinst91 (wire90, clk, wire45, wire54, reg49, wire12);
  module92 #() modinst152 (wire151, clk, reg47, wire54, reg52, reg48, wire12);
  assign wire153 = $unsigned($signed($unsigned((|$signed(wire9)))));
  assign wire154 = wire11;
  assign wire155 = $signed((!(~(-$unsigned(reg48)))));
  assign wire156 = (&(($unsigned($signed(reg50)) * $signed((+(8'hb9)))) > {($unsigned((8'hb7)) * (^~reg47)),
                       (8'hbc)}));
  assign wire157 = wire90;
  assign wire158 = (wire54 ?
                       ($unsigned(($signed(reg48) <<< wire9[(3'h5):(1'h1)])) ?
                           reg47[(3'h4):(3'h4)] : $signed($signed((8'haf)))) : reg51);
  assign wire159 = (^{($unsigned($unsigned(reg48)) ?
                           (reg51[(1'h1):(1'h1)] ?
                               wire90[(1'h0):(1'h0)] : reg53[(2'h2):(2'h2)]) : wire12[(1'h1):(1'h0)]),
                       $signed(({wire90, wire153} ?
                           $signed(wire45) : $unsigned(wire45)))});
endmodule

module module92
#(parameter param150 = (|(7'h40)))
(y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'h23f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire97;
  input wire [(2'h2):(1'h0)] wire96;
  input wire [(2'h2):(1'h0)] wire95;
  input wire signed [(4'hc):(1'h0)] wire94;
  input wire [(3'h4):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire149;
  wire [(2'h3):(1'h0)] wire148;
  wire signed [(3'h6):(1'h0)] wire129;
  wire signed [(4'hd):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire127;
  wire signed [(4'hb):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire125;
  wire signed [(4'hb):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire118;
  wire [(4'hc):(1'h0)] wire117;
  wire [(4'ha):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire115;
  reg signed [(5'h15):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg144 = (1'h0);
  reg [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg [(4'hd):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg [(5'h15):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
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
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg98 <= wire96[(1'h1):(1'h0)];
      if (wire97[(4'h8):(1'h1)])
        begin
          reg99 <= (-wire96);
          reg100 <= (^(8'ha3));
          if (reg99[(2'h3):(1'h1)])
            begin
              reg101 <= ((~|$unsigned(reg100[(3'h4):(3'h4)])) == (+$signed({(~&wire93),
                  ((8'hb4) <<< wire96)})));
            end
          else
            begin
              reg101 <= $unsigned((({(^~wire97),
                  wire95[(1'h0):(1'h0)]} >= $unsigned($unsigned(wire95))) ^ ((~&(wire94 ~^ (8'had))) ^ (~|reg101))));
              reg102 <= $signed(reg99);
              reg103 <= $signed(wire97[(5'h10):(3'h6)]);
            end
          reg104 <= (({(~reg102[(4'h8):(3'h6)])} && $unsigned((reg99[(2'h2):(1'h0)] ?
              (reg98 ?
                  (8'haf) : reg102) : wire97[(3'h4):(2'h2)]))) | $unsigned({$signed($unsigned(wire93)),
              $signed({(8'hb1)})}));
          reg105 <= (^wire97[(1'h1):(1'h0)]);
        end
      else
        begin
          reg99 <= wire94;
          reg100 <= (($signed((|$unsigned(reg104))) ?
                  {($signed(reg105) >>> (wire97 ?
                          wire93 : reg99))} : ($signed((|reg103)) ?
                      ((reg102 ? (7'h41) : wire96) && {wire97,
                          reg105}) : $signed({reg100}))) ?
              $signed(reg103[(3'h6):(3'h4)]) : wire97);
          reg101 <= (((reg100 ?
                  (~|(~(8'hb7))) : ($signed(wire94) + (reg100 ?
                      reg102 : wire94))) || $unsigned(reg105)) ?
              wire96 : wire94[(3'h6):(3'h4)]);
          if (($unsigned({($unsigned(reg104) ?
                  (reg100 < wire93) : (reg105 <= (8'hb5))),
              reg100}) | wire96[(1'h0):(1'h0)]))
            begin
              reg102 <= (~&$signed(($signed((wire93 ? wire97 : (8'hb0))) ?
                  $unsigned((!reg100)) : ((wire97 <= wire96) ?
                      $unsigned(wire95) : (reg98 ? reg102 : reg99)))));
              reg103 <= (reg100 >= (^~(reg100 ?
                  (^~$signed((8'hb5))) : $unsigned((reg100 * wire96)))));
              reg104 <= reg99[(4'ha):(4'ha)];
              reg105 <= {((^$signed($unsigned(wire96))) < ((|{wire96,
                      wire97}) >= $signed((reg102 ? (8'hb1) : reg98)))),
                  ((+wire96[(1'h1):(1'h1)]) ?
                      wire93[(2'h2):(1'h1)] : (((wire95 & reg101) < ((7'h43) ?
                          wire95 : (8'hbc))) && (wire97 ?
                          (-reg101) : (reg98 ? reg102 : (8'ha9)))))};
            end
          else
            begin
              reg102 <= wire95;
              reg103 <= {reg100[(2'h2):(1'h0)],
                  (|(((wire96 ~^ wire97) ?
                          $unsigned((8'hbc)) : reg105[(2'h2):(1'h1)]) ?
                      {reg98, ((8'ha3) && (8'hb2))} : wire96))};
              reg104 <= $unsigned(reg101);
            end
        end
      reg106 <= wire96[(1'h0):(1'h0)];
      if ((reg98 ? wire94[(1'h1):(1'h1)] : wire94[(3'h7):(2'h2)]))
        begin
          if ($signed($signed(($unsigned({wire93, reg106}) ?
              reg100 : reg98[(4'hb):(3'h4)]))))
            begin
              reg107 <= (!({{((8'ha8) ? wire96 : reg98),
                          (reg104 ? (8'h9f) : reg100)},
                      (reg102[(4'h9):(3'h6)] ?
                          reg101[(2'h2):(2'h2)] : (8'hb1))} ?
                  ($signed(wire93[(1'h1):(1'h1)]) && $signed($unsigned(wire94))) : (reg102[(4'h9):(4'h9)] ?
                      {(wire95 ?
                              reg103 : (8'hb5))} : $signed($unsigned(reg98)))));
              reg108 <= $unsigned(reg106[(4'h8):(1'h1)]);
              reg109 <= $signed((^~$signed($signed(reg100))));
              reg110 <= ($signed((reg104 == (-((8'hae) ?
                  reg101 : reg106)))) < (8'hab));
              reg111 <= reg101[(1'h1):(1'h0)];
            end
          else
            begin
              reg107 <= reg106;
              reg108 <= (8'hb3);
            end
          reg112 <= $unsigned((({reg105[(1'h0):(1'h0)]} ?
              ((&reg107) ?
                  (8'hb1) : $signed(reg110)) : (~wire97)) - ((-wire93) ?
              (reg100[(2'h2):(1'h0)] ? wire93 : (8'hb8)) : ($signed(reg102) ?
                  (&wire93) : (8'hac)))));
        end
      else
        begin
          if ((reg99 & (reg108 ?
              ($signed((-reg102)) ~^ (-(reg102 << wire94))) : (reg106 < $unsigned((reg100 ?
                  (8'ha0) : (8'ha0)))))))
            begin
              reg107 <= $unsigned($signed(($unsigned($unsigned(reg106)) << ((~reg107) & (wire95 ?
                  (8'hb2) : reg109)))));
              reg108 <= ($unsigned(reg98) != (&($signed((wire97 << (8'h9f))) != $unsigned(reg108))));
            end
          else
            begin
              reg107 <= (((8'hac) ? reg112 : $unsigned((^~reg105))) ?
                  (~|reg101) : $unsigned($unsigned(reg105)));
              reg108 <= $unsigned($signed(wire97[(4'hf):(4'hf)]));
              reg109 <= reg103[(3'h5):(1'h0)];
              reg110 <= (~$unsigned({reg100[(2'h2):(2'h2)]}));
            end
          reg111 <= reg105[(2'h2):(2'h2)];
          reg112 <= wire97;
          reg113 <= reg99;
          reg114 <= $signed($signed((&($unsigned(reg105) ^~ (reg106 ?
              reg107 : reg109)))));
        end
    end
  assign wire115 = ($signed((!reg109[(3'h5):(2'h3)])) * $unsigned({reg110[(4'h8):(4'h8)]}));
  assign wire116 = reg106;
  assign wire117 = (&$unsigned((wire95 >>> $signed((wire97 ?
                       (7'h41) : reg99)))));
  assign wire118 = reg114[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg119 <= (($unsigned(wire97[(5'h10):(3'h6)]) ?
              reg103[(1'h0):(1'h0)] : (wire96[(1'h1):(1'h1)] > wire93[(1'h0):(1'h0)])) ?
          (-((+(&reg112)) ^ $signed((!reg108)))) : (!{$unsigned((^reg103)),
              $signed(wire94[(4'hc):(2'h3)])}));
      reg120 <= (&(~wire115));
      reg121 <= ((reg113 & (+(~$unsigned(wire94)))) ?
          $unsigned($unsigned(reg108)) : ($signed(((wire116 ?
                  reg100 : (7'h43)) > $signed(reg114))) ?
              (8'hb9) : (8'hae)));
      reg122 <= $signed($signed({wire117}));
      reg123 <= $signed($signed((~|reg100[(3'h4):(1'h1)])));
    end
  assign wire124 = {wire117};
  assign wire125 = ($signed($unsigned($unsigned(reg98[(4'hb):(2'h3)]))) ?
                       (-wire117[(4'h9):(3'h7)]) : $signed((wire95[(2'h2):(2'h2)] | (+reg114))));
  assign wire126 = $unsigned(wire97);
  assign wire127 = (wire115[(3'h5):(3'h4)] ?
                       (wire97[(5'h10):(2'h2)] && {(|(~|reg114))}) : ({((!reg102) ?
                                   $unsigned((8'hb7)) : $unsigned(reg109))} ?
                           (-($signed(reg99) ?
                               (wire124 | reg105) : $unsigned(wire116))) : $unsigned(wire95)));
  assign wire128 = (^~$unsigned((&{reg123[(1'h0):(1'h0)]})));
  assign wire129 = reg120[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg130 <= reg119[(2'h2):(1'h1)];
      reg131 <= (({$unsigned($unsigned((8'hbb))),
                  (wire127[(1'h1):(1'h1)] ?
                      $signed(reg121) : $unsigned((7'h41)))} ?
              wire94 : (|wire117[(2'h2):(1'h1)])) ?
          ($unsigned(({wire127} > reg99[(2'h3):(2'h2)])) >> $signed((-$unsigned((8'had))))) : {$signed({wire128[(4'h9):(3'h5)]})});
      if (((((~&$unsigned(reg110)) == wire116) + wire125) ?
          wire126[(3'h4):(1'h0)] : reg121))
        begin
          reg132 <= ((+$signed($unsigned($signed(wire115)))) ?
              (wire125 || (({wire93} <<< $signed(reg109)) ?
                  ((~&(8'ha9)) ?
                      {(7'h41)} : (~(7'h44))) : ($signed(wire116) + (wire127 >> wire125)))) : ({{{reg106},
                          (reg120 << wire124)},
                      $unsigned({reg113})} ?
                  $unsigned($signed(wire118[(2'h2):(2'h2)])) : reg104));
          reg133 <= $unsigned($unsigned((~^$signed((~&(8'ha7))))));
          reg134 <= $unsigned((~&({reg106, $unsigned(reg130)} ?
              $signed($signed(wire95)) : (reg132 != {reg112}))));
          reg135 <= (wire129 ~^ ({reg103[(1'h1):(1'h1)],
                  wire93[(1'h1):(1'h0)]} ?
              (reg114[(2'h2):(2'h2)] ? (-(-reg103)) : wire118) : {((wire117 ?
                      reg109 : reg106) | (~|reg131)),
                  $signed(reg110)}));
          reg136 <= wire125[(3'h5):(1'h0)];
        end
      else
        begin
          reg132 <= $unsigned((reg111 <<< ({reg133[(2'h2):(1'h1)]} ?
              $unsigned((wire116 | (8'hb2))) : reg135)));
        end
      reg137 <= reg107;
      reg138 <= reg120;
    end
  always
    @(posedge clk) begin
      reg139 <= {(((wire117[(3'h7):(2'h2)] != $signed(wire116)) > $unsigned($unsigned((8'hb7)))) * (wire95 ?
              ((~^reg136) ? $unsigned((8'haf)) : (^~reg107)) : wire127))};
      reg140 <= reg113[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      if ((8'hbf))
        begin
          reg141 <= (|({{(wire128 >= wire129)}, wire95} ?
              $signed($unsigned((reg108 ?
                  reg139 : reg119))) : ($unsigned((~^reg119)) ?
                  (+reg131) : $signed(reg137[(2'h2):(1'h1)]))));
        end
      else
        begin
          if ((~$unsigned(((&((8'hba) ? wire116 : reg135)) ?
              $unsigned((+wire95)) : reg140[(3'h6):(3'h5)]))))
            begin
              reg141 <= $signed(($signed($unsigned($unsigned(wire93))) ?
                  (^(reg100 >>> (!wire125))) : (~$signed((wire127 ^ reg140)))));
              reg142 <= reg130;
              reg143 <= $signed({reg100});
              reg144 <= ((reg103 ?
                  $signed((|(|(8'hb7)))) : $unsigned(({(8'hb2)} ?
                      $signed(reg142) : (reg112 ?
                          reg134 : (8'hbb))))) || reg131[(4'h8):(1'h0)]);
              reg145 <= reg144;
            end
          else
            begin
              reg141 <= reg135;
            end
          reg146 <= reg142;
          reg147 <= ($unsigned((reg98 == $signed((reg122 ? reg139 : reg107)))) ?
              (~^({(8'h9f),
                  (reg105 >= reg133)} != $signed($unsigned(reg109)))) : ($signed(reg112) ?
                  (reg138 ?
                      $signed((wire124 ?
                          (8'h9c) : wire94)) : $unsigned(wire93[(2'h3):(2'h2)])) : reg108[(1'h1):(1'h1)]));
        end
    end
  assign wire148 = $unsigned((&reg141));
  assign wire149 = reg110;
endmodule

module module55
#(parameter param89 = {((((|(8'h9e)) <<< ((8'ha2) >>> (7'h40))) ~^ ({(8'h9c)} || {(8'hb2)})) ? (~|(^((7'h44) ? (8'hab) : (8'hb4)))) : {(~^(^(8'hbf))), (+((7'h41) ? (8'hb2) : (8'hb7)))}), (((|((8'hbd) && (8'ha6))) ? (((8'ha0) ? (8'h9e) : (8'hb5)) ? (&(8'h9c)) : ((8'ha8) ? (7'h42) : (8'hb8))) : (~(+(8'hb4)))) == ((~((8'hb2) <<< (7'h40))) ? (~|(~&(8'hb5))) : {((8'hb1) ? (8'ha6) : (7'h40)), ((8'h9c) << (8'ha6))}))})
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire59;
  input wire [(3'h5):(1'h0)] wire58;
  input wire [(5'h14):(1'h0)] wire57;
  input wire [(5'h10):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire60;
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire60,
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
                 reg65,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire60 = {$unsigned($signed($unsigned(wire59))), wire58};
  always
    @(posedge clk) begin
      reg61 <= wire58[(2'h2):(2'h2)];
      reg62 <= $unsigned((wire59[(2'h2):(1'h1)] ?
          wire56[(4'hf):(4'hf)] : $unsigned(wire56)));
    end
  assign wire63 = (reg62[(3'h4):(2'h3)] - $unsigned((!$signed((8'hbd)))));
  assign wire64 = (|$unsigned((~&(wire60 ?
                      (wire57 ? (8'hb1) : reg61) : $signed(wire63)))));
  always
    @(posedge clk) begin
      reg65 <= (((wire58[(1'h1):(1'h1)] ?
                  (wire63 & $signed(wire64)) : (|{(8'hb7)})) ?
              $unsigned(wire57[(5'h13):(3'h7)]) : $unsigned(($signed(wire58) ~^ (wire56 << reg62)))) ?
          (|wire60) : {$unsigned($signed((!wire64))),
              $unsigned($unsigned({wire57}))});
      reg66 <= ((($signed({wire59}) ? reg61 : wire59[(2'h2):(1'h0)]) ?
          reg65 : ((wire58[(1'h0):(1'h0)] >> $unsigned(reg62)) ?
              wire63 : $unsigned($signed(wire63)))) * wire59);
      reg67 <= ((-wire63) << (^~$signed($signed(wire64))));
      if (wire58[(3'h4):(1'h0)])
        begin
          reg68 <= $signed(reg62[(4'hd):(1'h0)]);
          if ((wire56 || ((($unsigned((8'haf)) ^~ $unsigned(reg67)) ?
              $unsigned((wire59 ? wire58 : reg62)) : {(|reg68),
                  (reg62 ? wire59 : reg66)}) >> {(8'hb4),
              $unsigned($signed(wire59))})))
            begin
              reg69 <= wire58[(3'h4):(3'h4)];
            end
          else
            begin
              reg69 <= $unsigned(wire58);
              reg70 <= (8'hb9);
              reg71 <= $signed(((((wire63 >>> wire56) > $unsigned(wire58)) <<< (8'h9c)) ?
                  $signed(reg65[(3'h5):(2'h2)]) : reg70));
            end
          reg72 <= (~^(((+((8'h9e) >>> reg68)) & reg67[(3'h6):(1'h1)]) ?
              (wire64 ?
                  $signed(((8'ha1) ?
                      wire58 : reg69)) : ((reg66 ^ wire57) >= (wire64 | wire59))) : $signed(reg69)));
        end
      else
        begin
          if (wire60)
            begin
              reg68 <= $signed($signed({$unsigned((reg62 ? reg69 : reg68))}));
              reg69 <= (~|$unsigned($unsigned($signed(wire64[(5'h11):(2'h2)]))));
              reg70 <= reg69;
              reg71 <= reg70;
              reg72 <= wire56;
            end
          else
            begin
              reg68 <= ((wire60[(2'h3):(2'h3)] << reg65) ?
                  reg66[(4'hb):(4'ha)] : reg61[(3'h7):(2'h3)]);
              reg69 <= {reg72[(4'ha):(4'ha)],
                  $signed((+($unsigned(wire63) ~^ $signed(reg69))))};
            end
        end
    end
  always
    @(posedge clk) begin
      if (wire63[(1'h1):(1'h0)])
        begin
          reg73 <= ((wire57 & {(+$signed(reg62))}) ?
              (~(reg61 <<< $signed(reg67))) : (((~|$unsigned(wire57)) || $signed($unsigned(reg62))) >>> (reg67 >= ({(8'ha8),
                  reg66} >> (reg70 ? reg68 : reg71)))));
          reg74 <= ({$unsigned($signed((wire57 | reg73))),
              ($signed((8'hb7)) ^ (^~(reg65 * wire58)))} >>> $unsigned(($signed($signed(reg67)) ?
              wire57[(1'h0):(1'h0)] : reg71)));
        end
      else
        begin
          reg73 <= {reg68[(3'h5):(3'h5)]};
          if ($signed((8'hb4)))
            begin
              reg74 <= ((-$unsigned({$signed(reg62)})) ?
                  wire59[(1'h0):(1'h0)] : ({(wire56[(2'h2):(2'h2)] ?
                          $signed(wire63) : reg74[(4'hb):(3'h4)])} <= {wire58}));
              reg75 <= ($unsigned($unsigned(reg66)) ?
                  (reg61[(4'hb):(3'h6)] <<< (((^~wire64) ?
                          {wire59, reg67} : $unsigned(wire56)) ?
                      (~^(~|reg62)) : reg67)) : $unsigned((~|($unsigned(wire58) ?
                      $signed(reg69) : (wire63 ? (8'hb9) : reg67)))));
            end
          else
            begin
              reg74 <= $unsigned(reg65);
            end
        end
      if ((-(reg61[(1'h0):(1'h0)] ? wire58 : (&reg68))))
        begin
          reg76 <= {{(+$unsigned({reg75, wire56}))},
              (+((-reg70) + (-{reg72})))};
          reg77 <= (8'hb4);
          reg78 <= $signed({(reg74 ? reg70[(4'h9):(1'h0)] : reg70)});
          reg79 <= reg62;
        end
      else
        begin
          reg76 <= {reg78[(1'h1):(1'h1)],
              (reg77[(1'h1):(1'h1)] ^ $unsigned($signed($signed(reg72))))};
          reg77 <= (reg66[(1'h0):(1'h0)] ^~ {{wire57[(4'h9):(3'h7)]},
              ($signed((^reg75)) >> ($unsigned(reg73) ?
                  ((7'h41) ~^ reg65) : reg72[(2'h2):(2'h2)]))});
        end
    end
  always
    @(posedge clk) begin
      if (($unsigned(($unsigned((reg70 ? reg68 : reg71)) - reg72)) ?
          $signed(wire56[(4'h8):(1'h0)]) : (+($signed((reg66 ? reg67 : reg78)) ?
              (!{reg66, wire64}) : $signed((reg68 ? (8'hbb) : wire58))))))
        begin
          reg80 <= ($signed(({(8'hb3)} || reg69[(4'h8):(3'h5)])) < (($signed((^~reg79)) | reg77) ?
              ((reg77 ?
                  $unsigned(wire57) : (|(8'hba))) != wire64) : reg73[(4'h9):(4'h8)]));
          reg81 <= ($signed($unsigned($signed(reg68))) ?
              (7'h40) : $unsigned((wire58[(1'h1):(1'h1)] ^ {$unsigned(wire58),
                  ((8'ha7) ? wire57 : wire58)})));
        end
      else
        begin
          if ((-(8'hab)))
            begin
              reg80 <= $unsigned((+$unsigned((+reg76))));
              reg81 <= (~|($signed(((8'ha5) >= reg74[(5'h13):(4'ha)])) ?
                  reg75[(3'h4):(1'h0)] : $signed((+reg78))));
            end
          else
            begin
              reg80 <= $unsigned($unsigned((~(~|$signed(reg72)))));
              reg81 <= ((reg68 >>> reg74[(4'hd):(2'h3)]) >>> reg77);
              reg82 <= (^~$unsigned((-reg76[(4'hd):(4'h8)])));
              reg83 <= ((reg70 ?
                      $unsigned(((reg78 ? reg73 : (8'hba)) ?
                          $unsigned(reg65) : (~reg76))) : $unsigned((~&reg67[(3'h5):(1'h0)]))) ?
                  reg79 : $signed((((reg67 & reg62) ?
                          {reg70, reg67} : wire59[(2'h2):(2'h2)]) ?
                      (reg61[(3'h4):(3'h4)] <<< (reg76 ?
                          wire56 : reg73)) : reg79[(1'h1):(1'h0)])));
              reg84 <= $unsigned(wire58[(2'h3):(1'h0)]);
            end
        end
      reg85 <= $unsigned(((reg67[(2'h2):(2'h2)] >= $signed((+reg66))) ?
          (~|(wire64 ?
              $unsigned(reg74) : $unsigned(reg78))) : $unsigned(reg62)));
      reg86 <= ((^~$signed(reg73)) ? reg68 : reg74[(4'hd):(4'hb)]);
      reg87 <= $unsigned(reg70);
      reg88 <= ((|$signed({{reg84}})) * ($signed(reg68) ?
          $signed(((~^reg81) == $signed(reg82))) : wire60[(2'h2):(1'h1)]));
    end
endmodule

module module14
#(parameter param43 = {{(((~&(8'ha0)) > {(8'hb6), (8'hb1)}) != (((8'hb5) < (8'hb2)) + ((8'hb7) || (8'ha5)))), (~|(7'h43))}, (((+((7'h44) <= (8'h9f))) & (!((8'ha4) >> (7'h42)))) * ({((8'h9f) & (8'hba)), {(8'hb2), (8'hbd)}} ? (&((8'h9e) ? (8'h9e) : (7'h43))) : {((8'h9c) ? (8'hbd) : (8'hbe))}))}, 
parameter param44 = (((((param43 ? param43 : param43) ? (8'ha7) : (~^param43)) > param43) >>> {param43, (param43 ? (param43 >>> param43) : (param43 ~^ (8'had)))}) ? param43 : ((param43 * (param43 ? (+param43) : param43)) ? param43 : {param43})))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire signed [(3'h4):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire21,
                 wire20,
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
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire20 = ($signed(wire17) ? (8'hb9) : (8'hbb));
  assign wire21 = {$unsigned(((|wire18[(1'h0):(1'h0)]) == $unsigned((wire15 || (7'h44)))))};
  always
    @(posedge clk) begin
      if ($unsigned(wire19))
        begin
          reg22 <= $unsigned($unsigned(wire17[(2'h3):(1'h0)]));
          reg23 <= ((reg22 & {wire18,
              ((^(8'haf)) >>> (~|(8'ha5)))}) ^ $unsigned((wire21 ~^ wire18[(2'h3):(2'h3)])));
        end
      else
        begin
          reg22 <= wire21;
          reg23 <= wire15[(3'h4):(2'h2)];
          reg24 <= (((+$unsigned($signed(wire20))) ?
              $unsigned(((wire15 ? wire15 : wire18) ?
                  (^(8'h9e)) : (wire18 >= reg22))) : $signed((8'ha0))) ^ ({$signed((wire20 >>> reg22))} ?
              (8'ha1) : {$unsigned($unsigned(wire17))}));
          if ($unsigned(reg23))
            begin
              reg25 <= ((($unsigned((~&reg24)) ?
                      $unsigned(wire21[(3'h5):(3'h5)]) : {$signed(wire19)}) ?
                  $signed($unsigned(wire16)) : $signed((~(wire15 << wire15)))) < (^wire15));
            end
          else
            begin
              reg25 <= (8'ha1);
              reg26 <= wire20;
              reg27 <= wire17[(4'he):(3'h4)];
              reg28 <= $signed(wire19[(4'he):(4'hc)]);
              reg29 <= $unsigned((^~$unsigned($signed(wire18[(3'h4):(1'h0)]))));
            end
        end
      if (($signed(reg25[(3'h7):(3'h5)]) <= reg29))
        begin
          reg30 <= reg22[(3'h7):(3'h7)];
          reg31 <= $signed((|($signed((!(8'haf))) ?
              reg27[(4'hc):(2'h2)] : reg30)));
          if ($signed($signed(($unsigned(wire15[(1'h1):(1'h1)]) ?
              (~^$unsigned(wire15)) : ((reg27 ? (8'hb9) : reg26) ?
                  (reg24 ? reg28 : reg24) : (wire16 << (8'ha3)))))))
            begin
              reg32 <= ((+$unsigned(((^wire15) ?
                      (reg28 ^ (8'had)) : $signed(reg24)))) ?
                  $signed($signed(reg28)) : (!(((+wire17) ?
                          {(8'h9d), reg30} : {reg22, reg27}) ?
                      wire21 : $signed({wire15}))));
              reg33 <= (($unsigned(($signed(reg29) ?
                          $unsigned(wire18) : (8'hb1))) ?
                      $unsigned($signed(wire18)) : ((+$signed((8'hac))) - $unsigned(wire16[(3'h6):(3'h5)]))) ?
                  reg29 : {(reg32[(3'h5):(3'h4)] ~^ $signed((8'haf)))});
            end
          else
            begin
              reg32 <= {$signed(reg29[(1'h0):(1'h0)]),
                  (~($unsigned($signed(reg30)) > ($unsigned(reg30) ?
                      $unsigned((7'h40)) : (-wire17))))};
              reg33 <= reg28;
            end
        end
      else
        begin
          reg30 <= reg23[(1'h0):(1'h0)];
          if ($signed($unsigned((^~{$unsigned((8'hb1))}))))
            begin
              reg31 <= $signed(wire15);
            end
          else
            begin
              reg31 <= $signed(reg27);
              reg32 <= reg30[(4'h8):(2'h3)];
              reg33 <= ({reg29[(1'h0):(1'h0)],
                      ($unsigned((reg30 >= reg24)) <= (^(reg23 ?
                          wire16 : (8'hbf))))} ?
                  (8'h9f) : wire16);
            end
          if ({($unsigned($unsigned(reg30)) ?
                  (reg27 << reg25[(4'h9):(3'h7)]) : ({(|reg33)} ?
                      $unsigned((^~reg25)) : (reg32 ?
                          (|(8'ha9)) : $unsigned(reg22)))),
              (((wire20 >= wire20[(1'h1):(1'h1)]) ?
                  (8'hb8) : $signed((~reg23))) + wire20[(1'h0):(1'h0)])})
            begin
              reg34 <= reg31;
              reg35 <= wire21[(2'h3):(2'h2)];
              reg36 <= $signed(reg24[(5'h11):(4'hb)]);
              reg37 <= (^$unsigned($signed((~&(wire20 ^~ wire19)))));
            end
          else
            begin
              reg34 <= ($signed((^$unsigned(reg26[(2'h2):(1'h0)]))) ?
                  reg37 : $unsigned(reg28[(3'h6):(2'h2)]));
              reg35 <= $unsigned($signed((wire21 ^ (wire16[(1'h0):(1'h0)] - reg25))));
              reg36 <= {{(((reg26 != reg24) ? reg35 : {(8'ha0)}) ^ reg36)},
                  {(reg37 ?
                          (((8'ha7) || wire16) >>> {reg36,
                              reg35}) : $signed((8'had)))}};
              reg37 <= $signed(((({reg34} >= $signed(reg34)) ?
                  $unsigned((+wire19)) : reg34[(5'h12):(3'h4)]) >= reg26[(2'h3):(2'h2)]));
            end
          reg38 <= (+((((~reg30) ? reg30[(2'h3):(1'h0)] : (reg28 & wire21)) ?
              ((^~(8'hbe)) ~^ (reg23 ?
                  wire19 : reg28)) : wire21[(3'h4):(1'h1)]) ~^ reg22));
        end
    end
  always
    @(posedge clk) begin
      reg39 <= {$signed({wire18[(2'h3):(1'h0)]})};
      reg40 <= wire16;
    end
  assign wire41 = $unsigned(($signed((&reg39)) ^~ wire20));
  assign wire42 = ({(((reg24 ? reg31 : reg34) != wire18[(1'h1):(1'h0)]) ?
                          reg22[(2'h3):(2'h3)] : (reg33[(3'h4):(3'h4)] ?
                              {reg24} : $unsigned(reg35))),
                      $signed(reg24)} & reg29);
endmodule
