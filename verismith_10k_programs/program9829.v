module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire255;
  wire [(3'h5):(1'h0)] wire254;
  wire [(5'h15):(1'h0)] wire253;
  wire signed [(4'he):(1'h0)] wire252;
  wire [(5'h14):(1'h0)] wire251;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire249;
  wire signed [(4'hd):(1'h0)] wire257;
  wire [(4'hb):(1'h0)] wire258;
  assign y = {wire255,
                 wire254,
                 wire253,
                 wire252,
                 wire251,
                 wire5,
                 wire6,
                 wire7,
                 wire70,
                 wire72,
                 wire73,
                 wire249,
                 wire257,
                 wire258,
                 (1'h0)};
  assign wire5 = $signed($unsigned(((((7'h42) ? (8'ha7) : wire3) ?
                     wire3[(2'h3):(1'h1)] : $unsigned(wire0)) >> ({wire4,
                     wire3} && wire3))));
  assign wire6 = $signed(((wire1 ?
                         (~((8'h9f) - wire1)) : ((~^(8'h9f)) ^ $unsigned(wire2))) ?
                     {$signed(wire1[(4'hc):(3'h4)]),
                         ({(8'hb0)} ~^ (wire4 ^~ wire0))} : wire1[(1'h0):(1'h0)]));
  assign wire7 = wire2[(3'h6):(2'h3)];
  module8 #() modinst71 (wire70, clk, wire2, wire0, wire7, wire1);
  assign wire72 = $signed({(((wire7 > wire4) ^ $unsigned(wire0)) >= $signed($signed(wire2))),
                      $unsigned((-{wire7}))});
  assign wire73 = wire72;
  module74 #() modinst250 (.wire75(wire70), .wire76(wire7), .y(wire249), .clk(clk), .wire79(wire5), .wire78(wire2), .wire77(wire3));
  assign wire251 = (8'h9c);
  assign wire252 = {$unsigned($signed(wire73[(1'h1):(1'h1)])), wire7};
  assign wire253 = (({{(wire1 ? wire7 : (8'hae)), (^(8'hb4))}} ?
                       {($signed((7'h42)) == $unsigned(wire0))} : (8'hb4)) + (^((8'hb7) || (+{wire1,
                       wire0}))));
  assign wire254 = (-$signed(wire70[(4'he):(4'hb)]));
  module191 #() modinst256 (wire255, clk, wire0, wire6, wire73, wire72, wire252);
  assign wire257 = (wire249[(4'h8):(2'h2)] != (8'hb6));
  module148 #() modinst259 (wire258, clk, wire2, wire251, wire7, wire70, wire257);
endmodule

module module74
#(parameter param248 = (({(|((8'hbb) ? (8'hb6) : (7'h44))), (((8'hbb) > (8'hab)) ? (8'ha3) : ((8'hb6) ? (8'hbd) : (8'hbc)))} ? {(((8'hb8) != (8'hb3)) != {(8'ha4), (8'hbb)}), (((8'hbd) != (8'hb3)) ~^ {(7'h40)})} : ((((8'hb8) << (7'h42)) ? {(8'ha5), (8'h9d)} : (|(8'hab))) ? (((8'hb2) ? (8'hb1) : (7'h41)) ? {(8'hac), (8'hba)} : (&(8'ha3))) : ((~^(8'ha1)) ? ((8'hb9) - (8'hb4)) : ((8'ha4) ? (8'hb9) : (8'h9f))))) << (~^(((8'hb3) << (7'h41)) ? (((7'h40) ~^ (8'hb7)) ? (^(8'hb5)) : ((8'ha7) ? (8'hb8) : (8'ha7))) : ((7'h43) >> (|(8'hb4)))))))
(y, clk, wire79, wire78, wire77, wire76, wire75);
  output wire [(32'h216):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire79;
  input wire [(5'h13):(1'h0)] wire78;
  input wire signed [(3'h4):(1'h0)] wire77;
  input wire signed [(4'he):(1'h0)] wire76;
  input wire signed [(4'hb):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire246;
  wire [(2'h2):(1'h0)] wire209;
  wire signed [(5'h15):(1'h0)] wire208;
  wire [(5'h10):(1'h0)] wire207;
  wire [(4'h8):(1'h0)] wire188;
  wire [(5'h14):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire124;
  wire signed [(4'hc):(1'h0)] wire115;
  wire signed [(5'h14):(1'h0)] wire190;
  wire [(3'h6):(1'h0)] wire205;
  reg signed [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg146 = (1'h0);
  reg [(4'h9):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg144 = (1'h0);
  reg [(4'hb):(1'h0)] reg143 = (1'h0);
  reg [(3'h4):(1'h0)] reg142 = (1'h0);
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(4'he):(1'h0)] reg140 = (1'h0);
  reg [(4'hc):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(5'h13):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(5'h15):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  assign y = {wire246,
                 wire209,
                 wire208,
                 wire207,
                 wire188,
                 wire125,
                 wire124,
                 wire115,
                 wire190,
                 wire205,
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
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 (1'h0)};
  module80 #() modinst116 (wire115, clk, wire76, wire78, wire75, wire77);
  always
    @(posedge clk) begin
      reg117 <= wire75[(4'h9):(2'h2)];
      reg118 <= $unsigned(wire78);
      if ({wire79[(1'h0):(1'h0)], $signed((7'h41))})
        begin
          if ((^($signed((wire115 ?
              reg118 : (wire76 ? (7'h44) : wire78))) > {(wire115 ?
                  {reg117} : $signed(reg118)),
              {(reg118 || wire79), (8'hbe)}})))
            begin
              reg119 <= $unsigned((8'hbb));
            end
          else
            begin
              reg119 <= $signed(((~$signed(reg118)) ?
                  (((8'ha6) ? $unsigned(wire76) : wire75) ?
                      (~(~^wire75)) : (wire115[(3'h6):(2'h3)] ?
                          (&(8'hb9)) : (wire78 >= reg117))) : (!$signed({(8'hae),
                      wire76}))));
              reg120 <= {wire79[(1'h1):(1'h0)]};
              reg121 <= $unsigned(((~reg120[(5'h12):(4'he)]) ?
                  ((reg119 ? {wire76} : (wire75 >= wire75)) ?
                      reg117[(4'hb):(3'h7)] : $unsigned($unsigned(wire76))) : ($signed({wire79}) ~^ {$signed(reg117),
                      reg118})));
              reg122 <= $unsigned((&(!(^~(+wire79)))));
            end
          reg123 <= ({reg122} ?
              reg118[(4'h9):(2'h3)] : ({($unsigned(reg120) ?
                      reg122[(4'hb):(3'h4)] : (reg117 ?
                          reg117 : reg121))} != (-(!reg120))));
        end
      else
        begin
          reg119 <= reg122[(4'hb):(4'h9)];
        end
    end
  assign wire124 = $unsigned($unsigned(wire115[(3'h7):(1'h0)]));
  assign wire125 = reg121[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg126 <= {reg121};
    end
  always
    @(posedge clk) begin
      reg127 <= ((wire79[(1'h0):(1'h0)] >= $signed($signed(wire124[(2'h2):(1'h1)]))) ?
          reg117 : wire77);
      reg128 <= {(+($signed((^~reg122)) << ((wire76 ^~ reg119) ~^ reg118))),
          $signed({(^~wire78), wire78})};
      if ((|((!reg123) ?
          $unsigned((^reg121)) : (reg126 ?
              (wire125[(4'hf):(4'he)] ? $signed(reg120) : reg128) : reg121))))
        begin
          reg129 <= $signed(wire125);
          reg130 <= ({$unsigned({wire79, wire77[(1'h0):(1'h0)]})} ?
              (reg119 < reg119[(4'h9):(3'h7)]) : $unsigned((~^((wire79 & reg121) ?
                  {wire77, (8'hb3)} : $signed(reg128)))));
        end
      else
        begin
          reg129 <= $unsigned(reg127[(2'h2):(2'h2)]);
          reg130 <= reg117;
          if (($unsigned(wire79[(1'h0):(1'h0)]) == ({(^~$signed(reg129))} ?
              (8'hbe) : $unsigned((^$unsigned(reg127))))))
            begin
              reg131 <= $signed(((^~$unsigned($signed(reg121))) >> $signed((wire125[(4'ha):(1'h1)] <<< wire115))));
              reg132 <= (~^($signed($unsigned(((8'ha8) ?
                  wire76 : wire124))) >>> ($signed(wire76[(4'he):(1'h1)]) ?
                  (8'h9d) : (&(7'h41)))));
              reg133 <= ($unsigned(wire124) ?
                  reg126 : (^~wire75[(1'h1):(1'h0)]));
              reg134 <= (((^wire124) == {($signed(wire78) ?
                          wire79 : {reg121, reg127})}) ?
                  $signed(wire125[(3'h5):(3'h5)]) : $signed($signed($signed(wire77))));
            end
          else
            begin
              reg131 <= $unsigned(((wire75 >>> ($signed(reg132) ?
                      (reg117 && wire125) : (8'hba))) ?
                  ((~reg118) ?
                      ((wire75 ? reg132 : reg134) ?
                          reg130 : $unsigned(reg133)) : reg118) : wire125[(5'h12):(4'hd)]));
            end
          reg135 <= reg121;
        end
      if ($unsigned(({(reg126[(4'hd):(4'h9)] > {reg135, reg132}),
              $signed(reg123[(1'h0):(1'h0)])} ?
          reg132[(4'hb):(4'h8)] : reg135)))
        begin
          reg136 <= (((8'hbf) != reg120[(3'h5):(1'h1)]) ?
              $signed((-($unsigned(reg126) ?
                  $signed(reg135) : (~^reg133)))) : ((((~^(8'ha8)) & (reg117 ?
                      reg130 : reg129)) ?
                  $signed((8'hba)) : $unsigned(reg119[(3'h5):(2'h2)])) <= ({wire125[(4'hc):(4'h8)],
                      (reg126 ? reg133 : reg132)} ?
                  $unsigned($signed(reg128)) : wire77)));
          reg137 <= ({reg133[(4'ha):(3'h6)],
              {$signed(reg122),
                  $signed(reg120)}} > $unsigned($unsigned(wire77)));
          reg138 <= ($signed(wire75[(2'h2):(1'h1)]) | wire77);
        end
      else
        begin
          reg136 <= reg128;
          if (reg138[(3'h4):(3'h4)])
            begin
              reg137 <= wire75;
              reg138 <= (($unsigned(reg138[(2'h2):(1'h0)]) * $unsigned(reg123[(4'hb):(1'h1)])) ?
                  wire79 : reg130);
              reg139 <= (((wire115[(4'ha):(4'h9)] ?
                  reg122[(4'he):(2'h2)] : reg135[(3'h6):(2'h3)]) <<< (7'h42)) ~^ (|$signed($unsigned(((8'had) ^ reg123)))));
              reg140 <= {{wire76[(3'h7):(3'h5)]},
                  $unsigned(reg133[(4'hb):(4'ha)])};
              reg141 <= $signed((^{(^~wire76[(3'h4):(1'h1)]),
                  ($unsigned(reg131) ?
                      (wire77 ? (8'hb3) : reg139) : {reg135, wire77})}));
            end
          else
            begin
              reg137 <= (~&$unsigned(reg136[(3'h5):(2'h2)]));
              reg138 <= $unsigned(wire75[(3'h7):(3'h5)]);
            end
          if (reg122)
            begin
              reg142 <= ($signed({(!reg128[(1'h0):(1'h0)]),
                  reg127}) ^ (&{($signed(reg122) ?
                      (reg119 ? (8'ha7) : (8'hbb)) : (-reg122))}));
              reg143 <= reg122[(1'h0):(1'h0)];
              reg144 <= $unsigned(reg119);
            end
          else
            begin
              reg142 <= $unsigned((wire124[(1'h1):(1'h0)] ?
                  $signed($signed({wire77, wire76})) : reg133));
              reg143 <= $unsigned((({reg144[(3'h4):(2'h2)],
                  (reg143 + reg130)} << reg137) * ({$signed(reg141),
                      $signed(reg122)} ?
                  reg135 : wire78[(4'h8):(3'h6)])));
            end
          reg145 <= $unsigned($signed((({reg137} & (reg138 ?
                  wire124 : reg138)) ?
              wire75 : wire78)));
          reg146 <= ($signed(reg127) > $signed((($unsigned(reg121) ?
              wire124[(1'h1):(1'h0)] : {reg136, reg133}) & ((reg137 ?
                  reg131 : reg118) ?
              {wire78} : $signed(wire77)))));
        end
      reg147 <= {((~^((reg121 ? wire79 : reg133) ?
              wire75[(3'h7):(1'h0)] : (|reg118))) >= $unsigned(reg120[(5'h11):(1'h1)])),
          ((((reg131 | reg133) * reg120) >= reg127) ?
              {(reg143 <= $signed(reg126)),
                  $signed($signed(reg141))} : (!(~&((7'h42) ?
                  reg127 : wire76))))};
    end
  module148 #() modinst189 (wire188, clk, wire115, wire76, wire79, reg118, reg134);
  assign wire190 = {(~($signed((reg147 >= (8'hb7))) ^ (~&(|reg131))))};
  module191 #() modinst206 (wire205, clk, reg118, reg143, wire190, reg136, reg139);
  assign wire207 = (reg141[(5'h12):(5'h12)] ? reg145 : reg139[(4'h9):(2'h2)]);
  assign wire208 = ($unsigned($unsigned($signed(((8'hb6) ~^ reg130)))) && wire115[(1'h0):(1'h0)]);
  assign wire209 = (~|$signed(($signed((wire205 - (8'hb9))) & $unsigned((wire125 ?
                       reg131 : reg146)))));
  module210 #() modinst247 (.y(wire246), .wire213(reg120), .wire211(reg132), .clk(clk), .wire214(reg137), .wire212(reg122));
endmodule

module module8
#(parameter param68 = (|({(((8'haa) ~^ (8'h9c)) == (8'hac)), (((7'h40) ? (8'ha2) : (7'h41)) > ((7'h43) > (8'hb3)))} ? (~^{(~&(8'hb9))}) : (+(((8'ha9) > (8'hb6)) ? (~(7'h41)) : ((7'h44) ? (8'h9e) : (8'hb8)))))), 
parameter param69 = {(~{{{param68}, ((8'ha6) > param68)}, {(~^param68), (+(8'ha4))}})})
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire59;
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 wire40,
                 wire42,
                 wire59,
                 reg62,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= (wire10[(4'h8):(3'h7)] ^ (+(~|$signed({wire12, wire11}))));
      reg14 <= $signed(($signed((+wire12)) << wire9[(3'h4):(2'h3)]));
      reg15 <= (~|($signed($unsigned($signed(reg14))) ?
          {((wire10 << (7'h40)) <= (wire11 > wire9)),
              wire11[(1'h1):(1'h0)]} : ({(wire11 ?
                  wire10 : wire12)} + $signed($signed((8'hac))))));
      reg16 <= $unsigned((|$unsigned($signed(wire11))));
      reg17 <= $signed(((8'haf) == ($signed({wire12, wire10}) ?
          (reg15 == (reg13 ?
              reg16 : (8'hac))) : ($unsigned(wire9) <= reg15[(2'h2):(1'h1)]))));
    end
  module18 #() modinst41 (.wire21(wire11), .wire22(wire12), .wire20(reg15), .clk(clk), .wire19(reg13), .y(wire40));
  assign wire42 = (^{reg14});
  module43 #() modinst60 (wire59, clk, wire11, reg16, wire42, wire9, reg15);
  assign wire61 = $signed(wire9);
  always
    @(posedge clk) begin
      reg62 <= wire59;
    end
  assign wire63 = $signed($signed(reg13[(3'h4):(2'h3)]));
  assign wire64 = (reg14 ?
                      reg62[(2'h3):(2'h3)] : (|(((wire42 && reg62) != $unsigned(reg13)) != $unsigned(((8'ha7) ?
                          reg15 : wire11)))));
  assign wire65 = wire61[(3'h6):(3'h5)];
  assign wire66 = (+$signed($signed(({wire40} & reg13[(1'h1):(1'h1)]))));
  assign wire67 = wire9[(5'h14):(4'h8)];
endmodule

module module43
#(parameter param58 = {({(8'hb2)} ? (((^(8'hbc)) ~^ ((8'hb2) ? (8'hbe) : (8'hb3))) ? (((8'hb8) ? (7'h40) : (8'hb7)) << ((8'h9e) ? (7'h41) : (8'haa))) : {((8'hbb) ? (8'h9d) : (8'hb3)), {(7'h42), (8'hb9)}}) : (((8'hbd) ? ((8'hb4) >>> (8'ha1)) : ((8'hb5) > (8'hbc))) ? (+((7'h40) ? (8'hb4) : (8'ha1))) : (((7'h42) > (8'ha1)) >> ((8'ha6) ? (8'ha9) : (8'hbc))))), {(-((^~(8'h9c)) ? (~&(8'hb9)) : ((8'hb8) ^ (8'hbc)))), ((((8'hae) ? (8'haf) : (8'hb5)) ~^ ((8'ha8) ? (8'hbd) : (8'hb8))) ? (((8'h9d) >= (8'hbd)) <<< {(8'ha7), (8'hbd)}) : (&((8'hb5) ? (7'h41) : (8'ha3))))}})
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire48;
  input wire signed [(5'h13):(1'h0)] wire47;
  input wire signed [(5'h10):(1'h0)] wire46;
  input wire [(5'h14):(1'h0)] wire45;
  input wire signed [(4'ha):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire50,
                 wire49,
                 reg52,
                 (1'h0)};
  assign wire49 = (($unsigned((-$unsigned((8'ha4)))) > $signed($unsigned(wire46))) ?
                      $unsigned(($signed($unsigned(wire48)) ?
                          $unsigned($signed(wire47)) : $signed($unsigned(wire45)))) : ($unsigned(wire47) ?
                          $signed($unsigned((~&wire46))) : $signed($unsigned(((8'ha6) ?
                              wire46 : wire44)))));
  assign wire50 = $signed(wire44[(4'h8):(3'h6)]);
  assign wire51 = (8'ha0);
  always
    @(posedge clk) begin
      reg52 <= wire50;
    end
  assign wire53 = ({$signed((wire45 <= (wire45 <<< wire46))),
                      wire45[(3'h5):(2'h3)]} << $unsigned((+((wire44 ?
                      wire48 : wire44) + wire48[(3'h4):(1'h1)]))));
  assign wire54 = ($signed(wire46[(4'h9):(3'h5)]) ~^ wire44);
  assign wire55 = (wire47 ?
                      $unsigned($signed((!$signed(wire50)))) : $unsigned(wire45));
  assign wire56 = {wire48};
  assign wire57 = $signed(wire45[(4'h8):(2'h2)]);
endmodule

module module18
#(parameter param39 = (8'hb3))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire22;
  input wire signed [(3'h5):(1'h0)] wire21;
  input wire [(4'hf):(1'h0)] wire20;
  input wire [(3'h4):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
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
                 (1'h0)};
  assign wire23 = wire19;
  assign wire24 = (({$unsigned(wire20[(4'hc):(3'h5)]), wire20} ?
                          (((wire21 ? wire22 : wire21) ?
                              (wire21 >>> wire22) : wire19[(3'h4):(1'h1)]) - (~(wire19 * (8'haa)))) : wire23) ?
                      wire20 : (8'hb7));
  assign wire25 = wire21[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg26 <= $unsigned($signed({wire21, wire19[(2'h2):(1'h0)]}));
      reg27 <= $signed(((|(-$unsigned(wire25))) ^~ wire20[(3'h6):(3'h5)]));
    end
  always
    @(posedge clk) begin
      reg28 <= wire23;
      reg29 <= wire22[(3'h7):(3'h4)];
      reg30 <= $signed($signed(wire23[(1'h1):(1'h0)]));
      if (wire22)
        begin
          reg31 <= {(~^(((8'ha7) ? (reg29 ^~ wire22) : reg27) ?
                  ((&reg26) && (reg29 > wire20)) : ({wire25} > $unsigned(reg28))))};
          if (wire20[(4'ha):(3'h4)])
            begin
              reg32 <= $unsigned($signed(reg30[(4'hb):(3'h4)]));
              reg33 <= ((wire23 ?
                  wire21[(1'h1):(1'h1)] : reg26[(1'h1):(1'h0)]) || (reg28 ?
                  $signed(((reg27 ? (8'h9e) : wire22) ?
                      $unsigned(wire24) : $signed(reg30))) : ($signed((reg26 >> reg26)) && (8'hb2))));
            end
          else
            begin
              reg32 <= ((~&$unsigned(wire19[(2'h3):(1'h0)])) <<< ($unsigned(wire22[(4'ha):(4'ha)]) >= wire25[(3'h6):(2'h2)]));
            end
          reg34 <= $unsigned({{reg32[(4'ha):(4'ha)], wire23[(3'h5):(3'h4)]}});
        end
      else
        begin
          reg31 <= ((~&$unsigned(wire25)) > ((!($unsigned((7'h43)) != (~&(8'ha6)))) > $unsigned($unsigned($signed(wire25)))));
          reg32 <= $signed(reg28[(3'h6):(1'h1)]);
          if ((((reg29[(1'h0):(1'h0)] ?
                      reg26 : ((wire19 == (8'ha3)) >= $unsigned(wire19))) ?
                  ((|wire20[(4'hb):(4'h9)]) ?
                      ($unsigned((8'h9d)) || $unsigned(wire19)) : reg29[(3'h6):(3'h5)]) : {((wire19 ?
                              wire19 : reg32) ?
                          (!reg33) : reg28[(3'h5):(2'h3)]),
                      $signed(wire23[(3'h7):(3'h7)])}) ?
              ((((&reg27) ?
                  wire23 : $unsigned(wire19)) + $signed($signed(wire19))) || reg33[(3'h4):(2'h3)]) : $signed(wire23)))
            begin
              reg33 <= $unsigned(reg27[(4'h8):(3'h6)]);
              reg34 <= wire19[(3'h4):(1'h1)];
              reg35 <= (reg31[(2'h3):(1'h1)] == (~|(8'hb6)));
            end
          else
            begin
              reg33 <= (8'hba);
              reg34 <= wire20;
              reg35 <= $unsigned({((8'ha8) ? {$signed(reg35), reg31} : reg33),
                  $signed(((^~wire23) * {reg27, wire20}))});
              reg36 <= wire21;
            end
          if ($unsigned((wire20[(4'hb):(1'h0)] ?
              $signed($unsigned({wire21})) : reg28[(1'h0):(1'h0)])))
            begin
              reg37 <= reg36[(3'h6):(1'h0)];
              reg38 <= (8'haf);
            end
          else
            begin
              reg37 <= (~^wire24);
            end
        end
    end
endmodule

module module210  (y, clk, wire214, wire213, wire212, wire211);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire214;
  input wire signed [(5'h15):(1'h0)] wire213;
  input wire signed [(4'h9):(1'h0)] wire212;
  input wire signed [(5'h11):(1'h0)] wire211;
  wire [(4'hd):(1'h0)] wire245;
  wire signed [(5'h12):(1'h0)] wire244;
  wire signed [(3'h6):(1'h0)] wire243;
  wire [(4'hd):(1'h0)] wire242;
  wire signed [(5'h11):(1'h0)] wire241;
  wire [(2'h3):(1'h0)] wire240;
  wire [(5'h13):(1'h0)] wire224;
  wire [(4'ha):(1'h0)] wire223;
  wire [(2'h3):(1'h0)] wire222;
  wire signed [(2'h3):(1'h0)] wire221;
  wire [(4'hb):(1'h0)] wire220;
  wire [(5'h14):(1'h0)] wire219;
  wire signed [(4'hf):(1'h0)] wire217;
  wire [(4'h9):(1'h0)] wire216;
  wire [(4'hd):(1'h0)] wire215;
  reg signed [(2'h2):(1'h0)] reg239 = (1'h0);
  reg [(5'h13):(1'h0)] reg238 = (1'h0);
  reg [(5'h13):(1'h0)] reg237 = (1'h0);
  reg [(3'h5):(1'h0)] reg236 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg235 = (1'h0);
  reg [(2'h2):(1'h0)] reg234 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg232 = (1'h0);
  reg [(4'ha):(1'h0)] reg231 = (1'h0);
  reg [(3'h4):(1'h0)] reg230 = (1'h0);
  reg [(4'h9):(1'h0)] reg229 = (1'h0);
  reg [(4'hd):(1'h0)] reg228 = (1'h0);
  reg [(4'h8):(1'h0)] reg227 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg226 = (1'h0);
  reg [(3'h4):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg218 = (1'h0);
  assign y = {wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire241,
                 wire240,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire217,
                 wire216,
                 wire215,
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
                 reg227,
                 reg226,
                 reg225,
                 reg218,
                 (1'h0)};
  assign wire215 = wire212;
  assign wire216 = ((+wire213) ?
                       {(+(+(~wire213)))} : $unsigned((&({wire211,
                           wire212} >= (8'ha7)))));
  assign wire217 = wire213[(5'h13):(2'h2)];
  always
    @(posedge clk) begin
      reg218 <= (wire212 ?
          wire215[(3'h5):(1'h1)] : (($unsigned($signed(wire215)) ?
                  (wire217 ?
                      wire215[(2'h3):(2'h2)] : wire212) : (wire214[(4'hd):(2'h3)] ^~ wire214)) ?
              (~((~^wire212) ?
                  (wire213 <= wire216) : (wire213 > (8'ha6)))) : (8'h9f)));
    end
  assign wire219 = (~reg218[(3'h5):(2'h3)]);
  assign wire220 = {{wire219[(4'h8):(2'h3)]}};
  assign wire221 = (($signed($signed((~|wire213))) ?
                           ((!$signed((8'hac))) ?
                               wire219 : $unsigned(wire212)) : (wire219 ?
                               ($unsigned((8'haa)) ?
                                   {wire216,
                                       wire219} : wire214[(5'h14):(4'ha)]) : wire213[(5'h12):(4'h9)])) ?
                       $unsigned({wire217,
                           $unsigned((wire217 * wire219))}) : ($signed(wire220[(4'h8):(3'h6)]) ?
                           wire219[(5'h13):(5'h12)] : wire211));
  assign wire222 = (+$unsigned(({wire219[(5'h14):(1'h1)]} ?
                       $unsigned((wire213 || wire214)) : (~(wire221 >> wire221)))));
  assign wire223 = (((&((^~wire217) || (wire222 ?
                           wire213 : reg218))) >>> wire217) ?
                       $signed($unsigned((|(&(8'had))))) : {wire217});
  assign wire224 = $unsigned($signed((8'ha2)));
  always
    @(posedge clk) begin
      if ({$signed((^~((wire224 ? wire217 : wire217) ?
              $unsigned(wire214) : (8'hac))))})
        begin
          reg225 <= (wire211 ?
              wire216[(1'h1):(1'h0)] : ($unsigned($unsigned(((8'hba) ?
                      wire224 : wire223))) ?
                  wire221[(2'h3):(1'h1)] : (wire215 + {$signed(reg218)})));
          reg226 <= wire217;
          reg227 <= {(reg218 ?
                  $unsigned(wire213[(4'hb):(4'ha)]) : (~(reg226[(2'h2):(1'h1)] <<< (wire217 ?
                      wire216 : wire220))))};
          reg228 <= (~wire223[(2'h3):(1'h1)]);
        end
      else
        begin
          reg225 <= ((^~$unsigned($unsigned((wire223 ?
              wire215 : wire216)))) & $signed(wire224));
          reg226 <= (reg218 ?
              ({wire212[(3'h5):(2'h3)],
                  reg226} - wire212) : $signed($signed({{reg227, (8'ha9)}})));
          reg227 <= $unsigned(reg226);
        end
      reg229 <= $signed(($unsigned((wire214 ? (wire214 + reg227) : {wire219})) ?
          reg228[(4'h9):(4'h9)] : $signed(($signed(reg227) ^~ (wire211 ?
              wire219 : reg226)))));
      if ((wire214 ^~ $signed($signed(reg225))))
        begin
          reg230 <= $signed(reg229[(3'h6):(3'h5)]);
          reg231 <= (^{($unsigned($unsigned(wire223)) ?
                  (^~$signed(reg226)) : ($unsigned(wire216) < (~&reg230)))});
        end
      else
        begin
          reg230 <= $unsigned(((wire224[(5'h12):(5'h10)] >> (|(wire214 ?
              (8'hb4) : wire211))) ^ (&$unsigned((reg227 ?
              wire221 : reg230)))));
          reg231 <= $signed(wire211[(3'h6):(1'h1)]);
          if ((!wire217[(1'h1):(1'h0)]))
            begin
              reg232 <= ({reg225[(2'h2):(1'h0)]} - {$unsigned(((^(8'ha2)) ?
                      $unsigned(wire221) : $signed(wire219))),
                  (|(8'hba))});
              reg233 <= $signed(wire211[(2'h2):(1'h0)]);
              reg234 <= $unsigned($signed((&$unsigned((~^wire222)))));
              reg235 <= ((8'hb9) ?
                  ((!$unsigned(wire217[(4'h9):(4'h9)])) == ((wire214 < wire219) ?
                      ($unsigned((8'ha5)) ?
                          (~&reg233) : wire222) : ((!wire219) ?
                          $signed((8'ha5)) : $unsigned(wire224)))) : reg218);
              reg236 <= (~^$unsigned((~^({reg227} + reg232[(3'h5):(2'h3)]))));
            end
          else
            begin
              reg232 <= wire222;
              reg233 <= (wire214 ?
                  (~&{((!wire223) ?
                          (reg218 ?
                              wire223 : reg236) : (reg232 + (8'hb6)))}) : ((!(&reg232)) && $signed((!((8'ha6) != reg227)))));
              reg234 <= reg226;
            end
          reg237 <= (((($signed(reg236) < $unsigned(wire219)) * (|((8'ha5) | wire212))) <<< (|{(reg231 ?
                      wire211 : reg231),
                  reg236[(3'h5):(1'h0)]})) ?
              ($signed($signed($unsigned(reg226))) <= $signed(reg231)) : ((((8'h9c) && $signed(wire211)) ?
                  reg234[(1'h0):(1'h0)] : $unsigned(reg232[(4'hc):(2'h2)])) < $signed((wire223[(4'ha):(3'h6)] != (wire222 ?
                  wire220 : wire220)))));
        end
      reg238 <= {reg227[(4'h8):(4'h8)]};
      reg239 <= $unsigned(wire219[(3'h5):(3'h4)]);
    end
  assign wire240 = wire224;
  assign wire241 = $signed(((wire215[(1'h1):(1'h0)] ?
                       ((~^wire212) ?
                           $unsigned((7'h44)) : reg226[(4'ha):(2'h3)]) : (reg228[(3'h7):(1'h0)] ?
                           (reg235 ? wire219 : wire223) : reg233)) < wire215));
  assign wire242 = (~&($signed(($unsigned(wire213) >>> (&reg237))) * $signed($signed(reg228))));
  assign wire243 = (8'hb2);
  assign wire244 = wire216[(2'h2):(1'h1)];
  assign wire245 = reg235[(1'h1):(1'h1)];
endmodule

module module191
#(parameter param203 = ((-((~&((8'hb8) <= (7'h40))) + (&{(8'hac)}))) ~^ ((!(8'hae)) * ((&((8'hb2) ? (8'hb7) : (8'hb9))) ? {(~|(8'hbb)), ((8'hba) ? (8'h9f) : (7'h41))} : {(8'hb5), (~^(8'ha3))}))), 
parameter param204 = param203)
(y, clk, wire196, wire195, wire194, wire193, wire192);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire196;
  input wire signed [(4'h8):(1'h0)] wire195;
  input wire [(5'h10):(1'h0)] wire194;
  input wire signed [(3'h6):(1'h0)] wire193;
  input wire signed [(4'ha):(1'h0)] wire192;
  wire signed [(5'h14):(1'h0)] wire202;
  wire [(5'h11):(1'h0)] wire201;
  wire [(5'h15):(1'h0)] wire200;
  wire signed [(3'h6):(1'h0)] wire199;
  wire signed [(5'h12):(1'h0)] wire198;
  wire [(4'hf):(1'h0)] wire197;
  assign y = {wire202, wire201, wire200, wire199, wire198, wire197, (1'h0)};
  assign wire197 = wire195[(1'h0):(1'h0)];
  assign wire198 = (~wire197);
  assign wire199 = wire193;
  assign wire200 = $signed((|wire194));
  assign wire201 = $unsigned(wire192[(4'h9):(1'h1)]);
  assign wire202 = wire197[(4'h9):(3'h4)];
endmodule

module module148  (y, clk, wire153, wire152, wire151, wire150, wire149);
  output wire [(32'h1af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire153;
  input wire [(2'h2):(1'h0)] wire152;
  input wire signed [(5'h14):(1'h0)] wire151;
  input wire [(5'h12):(1'h0)] wire150;
  input wire [(4'hd):(1'h0)] wire149;
  wire signed [(5'h12):(1'h0)] wire187;
  wire signed [(4'h9):(1'h0)] wire169;
  reg signed [(3'h7):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg182 = (1'h0);
  reg [(4'ha):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg180 = (1'h0);
  reg [(3'h6):(1'h0)] reg179 = (1'h0);
  reg [(3'h7):(1'h0)] reg178 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg177 = (1'h0);
  reg [(4'hb):(1'h0)] reg176 = (1'h0);
  reg [(4'hb):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg173 = (1'h0);
  reg [(5'h12):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg170 = (1'h0);
  reg [(4'ha):(1'h0)] reg168 = (1'h0);
  reg [(5'h14):(1'h0)] reg167 = (1'h0);
  reg [(2'h3):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg165 = (1'h0);
  reg [(5'h15):(1'h0)] reg164 = (1'h0);
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(4'hd):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg158 = (1'h0);
  reg [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  assign y = {wire187,
                 wire169,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire152[(1'h1):(1'h0)])
        begin
          reg154 <= $signed({(wire149 | wire149)});
          reg155 <= $signed(({wire152} ~^ reg154[(4'hc):(4'hc)]));
          if (wire151)
            begin
              reg156 <= wire152[(2'h2):(1'h0)];
              reg157 <= reg156[(1'h0):(1'h0)];
              reg158 <= (((~|((+reg157) ?
                      (reg156 ?
                          wire150 : wire150) : $unsigned(reg157))) <<< ((^~(-wire152)) ~^ $unsigned(reg157[(3'h5):(2'h3)]))) ?
                  {(~|(~&{wire151})),
                      $signed(reg155)} : (wire152[(1'h0):(1'h0)] ?
                      (8'h9d) : reg157[(2'h2):(1'h0)]));
              reg159 <= $unsigned($unsigned(wire153[(1'h0):(1'h0)]));
            end
          else
            begin
              reg156 <= reg155;
              reg157 <= wire150;
            end
          if ($unsigned(wire150[(4'hf):(4'he)]))
            begin
              reg160 <= {$unsigned((wire153 <= ((wire151 ?
                      wire149 : reg154) != reg157))),
                  reg159};
              reg161 <= ($unsigned((8'hb2)) ?
                  reg160[(2'h2):(1'h1)] : ($signed(reg154) ?
                      ($unsigned((wire150 ? wire152 : reg157)) ?
                          {reg157} : (wire153 >>> $signed((8'hab)))) : ((+reg159[(3'h5):(1'h1)]) ?
                          (wire151 ?
                              $unsigned(wire150) : (|reg158)) : ($signed(reg160) <= $unsigned(wire150)))));
              reg162 <= (|$signed($signed($signed(reg156[(1'h0):(1'h0)]))));
              reg163 <= $signed(reg158[(2'h2):(1'h0)]);
            end
          else
            begin
              reg160 <= ($unsigned($unsigned(reg154[(1'h1):(1'h1)])) ?
                  $signed({{{(8'hb8), wire150}}}) : $unsigned(reg156));
              reg161 <= wire151[(4'h9):(4'h9)];
            end
          reg164 <= (8'ha3);
        end
      else
        begin
          reg154 <= ((8'ha2) ?
              (reg159 + {(!$signed((8'ha6))),
                  ($signed((8'hb2)) ?
                      (wire150 ?
                          wire152 : wire150) : reg158[(4'h8):(4'h8)])}) : (^~reg161[(4'hb):(4'h8)]));
          reg155 <= (7'h40);
        end
    end
  always
    @(posedge clk) begin
      reg165 <= {$unsigned(((|(reg162 < reg156)) || {(reg161 ?
                  reg162 : (8'ha0)),
              (wire149 ? wire152 : reg154)})),
          reg161[(4'hb):(3'h7)]};
      reg166 <= $unsigned((wire153[(2'h2):(1'h1)] ?
          $unsigned((!reg155[(4'h9):(1'h0)])) : (-reg163)));
      reg167 <= (&(8'hbb));
      reg168 <= $signed(reg165);
    end
  assign wire169 = ($signed($unsigned(reg166[(1'h1):(1'h0)])) ?
                       reg162 : {({reg156} > (&$signed(reg162))),
                           (wire152 ?
                               {{wire149, wire150},
                                   (reg163 <<< reg156)} : (8'ha1))});
  always
    @(posedge clk) begin
      reg170 <= (((($signed(reg157) ? (reg167 <= reg163) : wire152) < wire152) ?
              ($unsigned({reg154, wire153}) && reg155) : ({wire152} ?
                  ($signed(wire150) ? (~reg168) : (8'hb7)) : (~&(7'h43)))) ?
          $signed(($signed($unsigned(reg154)) & reg157)) : $unsigned(reg155));
      if ((wire152 ^ $signed((reg154[(2'h2):(1'h0)] >>> (+reg154[(3'h5):(1'h0)])))))
        begin
          reg171 <= wire150;
          if ((+($signed(($unsigned(wire153) ?
              $unsigned(reg156) : reg160[(3'h6):(1'h0)])) <<< reg167)))
            begin
              reg172 <= $unsigned($signed(({(reg159 * wire152)} ?
                  (((7'h44) + reg162) ?
                      (8'hbc) : {reg160, reg171}) : (8'hb2))));
              reg173 <= (~&(+reg156[(4'hd):(4'ha)]));
              reg174 <= $unsigned((~^$unsigned(reg161[(2'h2):(1'h1)])));
              reg175 <= (^(7'h40));
            end
          else
            begin
              reg172 <= {(reg158 ? (~($signed(reg158) == {wire150})) : reg165),
                  (~$signed(reg165[(3'h5):(1'h0)]))};
              reg173 <= {reg157,
                  $unsigned((reg165 ?
                      (^~wire151[(3'h7):(2'h3)]) : ((~&(8'hac)) + reg163[(3'h6):(2'h2)])))};
              reg174 <= $unsigned($signed($signed((~$unsigned((8'ha0))))));
            end
          reg176 <= {$signed(reg170),
              $unsigned(({(reg163 ? (8'hb9) : reg166)} * ({reg161,
                  reg156} <<< {reg173})))};
          reg177 <= wire150[(4'h9):(3'h7)];
          reg178 <= ({reg155[(4'h8):(1'h1)],
              $signed($unsigned((8'ha5)))} | ({$unsigned(reg160)} ?
              ({(reg171 ? wire151 : (7'h43))} ?
                  reg164[(4'hd):(2'h3)] : (^$unsigned(reg163))) : reg154));
        end
      else
        begin
          if (reg158)
            begin
              reg171 <= (reg163 <<< (&(((wire151 ?
                  reg156 : reg163) || (reg160 && reg160)) ~^ reg160)));
            end
          else
            begin
              reg171 <= $signed(wire152);
              reg172 <= reg163[(1'h0):(1'h0)];
              reg173 <= (reg155[(4'hb):(1'h1)] ?
                  (&{(8'haa), $unsigned(wire153[(1'h1):(1'h1)])}) : (7'h40));
              reg174 <= (!(reg164[(4'h9):(3'h6)] * reg174[(3'h4):(2'h3)]));
              reg175 <= reg157[(2'h2):(1'h0)];
            end
          reg176 <= $unsigned($unsigned((&$signed(reg168[(2'h3):(1'h0)]))));
          if ($signed(((($unsigned(reg160) ? (~&reg162) : {wire150}) ?
              reg174 : $unsigned(reg172)) > (($signed(reg171) << (~reg158)) ^ {reg160,
              $unsigned(reg174)}))))
            begin
              reg177 <= (-($unsigned(reg157[(3'h4):(2'h3)]) || $signed({$unsigned(reg170),
                  (reg156 == reg177)})));
            end
          else
            begin
              reg177 <= wire153;
              reg178 <= reg173[(2'h3):(1'h0)];
              reg179 <= $unsigned(reg174[(1'h1):(1'h0)]);
            end
          if ({$unsigned({($signed(reg175) & (reg168 & (8'hb3))),
                  reg173[(3'h5):(2'h2)]}),
              ((&{$signed(reg165)}) ? $signed((-(~^(8'hbb)))) : reg157)})
            begin
              reg180 <= {(!$unsigned((((8'hbb) ? wire169 : reg168) ?
                      $unsigned(reg178) : $signed(wire150))))};
              reg181 <= reg165;
              reg182 <= (~&(($signed((wire169 ^~ reg168)) ^~ $unsigned(((8'h9c) ^~ wire153))) >>> ($signed((wire151 ?
                  (8'haa) : wire169)) >= $unsigned({reg161, reg171}))));
            end
          else
            begin
              reg180 <= reg173;
              reg181 <= reg159;
              reg182 <= reg181;
              reg183 <= (((((reg167 >> reg176) != (reg176 ?
                          reg168 : reg156)) - reg182) ?
                      $signed(reg173) : reg154) ?
                  (reg170 ? reg163 : {reg179}) : (~&(|((+(8'ha2)) ?
                      $signed(reg170) : (8'ha1)))));
              reg184 <= (wire149 > ((8'hbb) ?
                  $unsigned((^~(~|(8'hb4)))) : ($signed($unsigned(reg172)) ?
                      $unsigned($signed(reg164)) : ((wire169 >>> reg163) ?
                          $unsigned((8'ha6)) : reg182[(3'h5):(1'h1)]))));
            end
          reg185 <= (reg178[(3'h4):(2'h2)] << (!reg158[(1'h1):(1'h1)]));
        end
      reg186 <= ($unsigned((reg184 ?
          $unsigned({reg177,
              wire150}) : (~&reg162))) && {{$signed($signed(reg159))}});
    end
  assign wire187 = (reg185[(2'h2):(1'h1)] & $signed($signed((8'ha6))));
endmodule

module module80
#(parameter param114 = {{{(((8'h9e) ? (8'h9d) : (8'haf)) == ((8'haf) ~^ (8'hb7))), ({(7'h42), (8'hbb)} && (+(8'ha2)))}}})
(y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire84;
  input wire [(5'h13):(1'h0)] wire83;
  input wire signed [(4'hb):(1'h0)] wire82;
  input wire [(2'h3):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire113;
  wire signed [(5'h14):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire110;
  wire signed [(2'h3):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire108;
  wire [(2'h3):(1'h0)] wire104;
  wire [(3'h4):(1'h0)] wire103;
  wire signed [(4'h9):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire100;
  wire signed [(3'h7):(1'h0)] wire99;
  wire [(4'ha):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  wire signed [(4'ha):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire85;
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire96,
                 wire95,
                 wire94,
                 wire91,
                 wire85,
                 reg107,
                 reg106,
                 reg105,
                 reg98,
                 reg97,
                 reg93,
                 reg92,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire85 = wire82[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg86 <= $signed($signed(((8'hac) ?
          ($unsigned((8'hb9)) ?
              wire83[(5'h11):(4'h8)] : wire82) : ((wire82 ^~ wire83) && wire85[(3'h4):(1'h0)]))));
      reg87 <= $unsigned((wire85 ?
          $signed($unsigned(wire84[(1'h1):(1'h0)])) : wire84[(1'h0):(1'h0)]));
      reg88 <= $unsigned((+(reg86[(4'h9):(4'h8)] >> $unsigned($signed((8'hb1))))));
      reg89 <= (~^$unsigned((!(reg86 ? $signed(reg88) : $unsigned(reg87)))));
      reg90 <= ($signed(reg86) ?
          ((|(wire84[(1'h0):(1'h0)] ?
              {(8'hba), (8'ha0)} : {wire82, reg86})) << ({(wire82 && reg88),
                  (wire81 ? reg89 : wire84)} ?
              $unsigned((wire84 ?
                  reg87 : wire85)) : $signed((~^wire85)))) : reg87);
    end
  assign wire91 = reg90[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg92 <= wire83;
      reg93 <= wire84[(1'h0):(1'h0)];
    end
  assign wire94 = ((reg87 << (+(!{(8'hb9)}))) ?
                      wire83[(5'h13):(1'h0)] : (~&wire85));
  assign wire95 = ($signed(wire85) ? (~|($signed(wire82) || (8'ha7))) : reg93);
  assign wire96 = reg87[(3'h7):(2'h3)];
  always
    @(posedge clk) begin
      reg97 <= (|wire96);
      reg98 <= $unsigned((8'h9e));
    end
  assign wire99 = $signed(reg90[(1'h0):(1'h0)]);
  assign wire100 = $signed((reg88 ?
                       reg86 : (~^((wire84 ? (8'ha4) : wire82) ?
                           {wire82, (8'haa)} : (wire94 < wire91)))));
  assign wire101 = ((~&$signed(reg89)) ?
                       ((wire94 << (|reg97[(1'h0):(1'h0)])) ?
                           {(+$signed(wire82)), (7'h44)} : wire96) : wire100);
  assign wire102 = ((+wire82) ?
                       (wire96[(3'h5):(1'h0)] ?
                           (8'hb5) : wire85[(2'h3):(2'h3)]) : reg89);
  assign wire103 = $unsigned(wire96[(3'h5):(3'h5)]);
  assign wire104 = $signed(reg87);
  always
    @(posedge clk) begin
      reg105 <= $signed($signed(wire100));
      reg106 <= {wire99[(2'h2):(1'h0)]};
      reg107 <= ($unsigned(reg98[(2'h3):(2'h2)]) * reg87);
    end
  assign wire108 = wire103[(1'h0):(1'h0)];
  assign wire109 = ((~|$unsigned(wire99)) & {reg107[(1'h1):(1'h0)], wire94});
  assign wire110 = $unsigned(wire99);
  assign wire111 = (wire91[(1'h1):(1'h1)] ?
                       wire102 : ((~^reg98) ?
                           $signed($unsigned((wire108 <= reg106))) : ((((8'ha8) < wire82) ?
                                   (wire110 != wire104) : wire110[(2'h2):(1'h0)]) ?
                               wire95[(2'h2):(2'h2)] : $signed(wire109))));
  assign wire112 = wire111;
  assign wire113 = (((!wire81) == wire91) >>> ($signed($unsigned(wire101[(4'hb):(3'h6)])) ?
                       $unsigned((|{wire82})) : $signed(reg88)));
endmodule
