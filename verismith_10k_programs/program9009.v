module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h21a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire159;
  wire signed [(4'h8):(1'h0)] wire158;
  wire [(3'h5):(1'h0)] wire157;
  wire [(3'h6):(1'h0)] wire156;
  wire [(5'h10):(1'h0)] wire121;
  wire signed [(5'h13):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire143;
  reg [(4'hd):(1'h0)] reg155 = (1'h0);
  reg [(5'h11):(1'h0)] reg154 = (1'h0);
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg [(3'h6):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(4'h9):(1'h0)] reg148 = (1'h0);
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg134 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg136 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg142 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire121,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire143,
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
                 (1'h0)};
  module5 #() modinst52 (wire51, clk, wire3, wire4, wire1, wire0);
  assign wire53 = (8'hb6);
  assign wire54 = $signed($unsigned((-(wire53 ?
                      ((8'hbb) ? wire53 : wire1) : wire1[(4'hf):(4'hc)]))));
  assign wire55 = $signed((~^wire54[(1'h1):(1'h0)]));
  module56 #() modinst122 (wire121, clk, wire51, wire54, wire1, wire4, wire55);
  always
    @(posedge clk) begin
      if ((+$signed(wire54[(2'h3):(2'h3)])))
        begin
          reg123 <= {$signed($unsigned(wire55[(5'h12):(3'h6)]))};
          reg124 <= (wire51 ?
              (-reg123[(3'h7):(2'h3)]) : ($signed(((8'ha0) ?
                      (-wire53) : $signed(reg123))) ?
                  (~$signed(wire53)) : $unsigned({wire55[(4'h9):(3'h7)]})));
          reg125 <= wire121[(3'h5):(3'h5)];
          reg126 <= (~wire51);
          reg127 <= $signed($unsigned(reg123));
        end
      else
        begin
          reg123 <= wire2[(1'h0):(1'h0)];
          reg124 <= $unsigned(((($unsigned(wire4) ?
                      (~&wire51) : $unsigned(wire3)) ?
                  $unsigned((wire54 < wire2)) : $signed((^reg126))) ?
              wire51[(3'h4):(2'h3)] : (reg127 ?
                  ({wire54} >>> (~^wire55)) : $unsigned(wire53[(3'h4):(1'h0)]))));
          reg125 <= $unsigned(wire54);
          if (reg125[(5'h13):(1'h0)])
            begin
              reg126 <= (&{$unsigned((reg124[(4'hc):(2'h2)] << $unsigned(reg124)))});
            end
          else
            begin
              reg126 <= (($signed((-wire2)) <= (-$unsigned((wire121 ~^ reg123)))) * $signed($signed((((8'hba) && wire3) == wire3))));
              reg127 <= (reg125[(4'hf):(1'h0)] * (7'h41));
              reg128 <= ((&(-wire51[(5'h11):(3'h7)])) > reg124[(2'h3):(1'h0)]);
              reg129 <= ($unsigned((wire53 >>> reg124)) ?
                  (({$signed(reg125)} ?
                          $unsigned((reg124 - reg127)) : (7'h43)) ?
                      (+((wire2 ?
                          reg125 : wire55) && (wire3 <= wire1))) : ({(|wire4),
                          (7'h43)} & $signed((^~reg126)))) : (&reg125));
              reg130 <= reg126[(2'h3):(1'h0)];
            end
        end
      reg131 <= $unsigned((^$signed(wire54[(4'ha):(3'h4)])));
      if ((reg124[(2'h3):(1'h1)] + $signed(($signed(reg130) ?
          wire3 : {(wire121 ? reg127 : wire53)}))))
        begin
          reg132 <= $signed($signed(((reg127 ^ (wire1 ? wire55 : wire121)) ?
              $unsigned($signed((8'hb1))) : ($signed(reg129) != (wire121 ?
                  reg126 : reg128)))));
          reg133 <= wire54[(3'h6):(2'h3)];
          reg134 <= (|wire0[(4'he):(2'h3)]);
          reg135 <= {$unsigned((~|(-reg132))), reg128[(4'hb):(3'h6)]};
          reg136 <= (reg130 << {((!wire2) <= (~&$unsigned((7'h44)))),
              (({reg131,
                  (8'ha4)} >>> $signed(reg130)) & reg126[(2'h3):(1'h0)])});
        end
      else
        begin
          if (reg132[(1'h0):(1'h0)])
            begin
              reg132 <= ((^~$signed(((reg130 >> reg124) >>> (wire51 >>> wire2)))) ?
                  reg128 : ($signed(($unsigned(wire53) != ((8'hbf) ?
                          reg127 : reg124))) ?
                      (((~^wire54) > $signed(wire0)) ?
                          wire2 : ((reg133 ? wire121 : reg135) ?
                              $signed(reg128) : (wire54 ?
                                  wire53 : reg134))) : ((-((8'had) >>> reg135)) > ($unsigned(reg123) * (reg126 ?
                          wire4 : wire4)))));
              reg133 <= {(~^reg128)};
              reg134 <= $unsigned((8'hac));
              reg135 <= ($unsigned(reg134) ?
                  ({reg131[(5'h10):(3'h4)], {(~wire54)}} ?
                      ($unsigned({(8'haf)}) ?
                          $unsigned((&wire3)) : (wire3[(2'h3):(1'h1)] ?
                              $unsigned(reg135) : wire4[(1'h0):(1'h0)])) : $signed($unsigned((wire1 <= wire54)))) : (~&reg130));
            end
          else
            begin
              reg132 <= $unsigned($signed({($signed(reg134) ?
                      $signed((8'hb7)) : $unsigned((8'hbc))),
                  $unsigned((reg132 ? (8'ha1) : wire1))}));
              reg133 <= reg124[(2'h3):(1'h1)];
              reg134 <= $unsigned($unsigned(((~((7'h42) ?
                  reg131 : (8'h9d))) != wire2[(2'h3):(1'h1)])));
              reg135 <= reg130;
            end
          if ((reg131[(3'h5):(2'h2)] ?
              ((((~reg135) && $unsigned(wire54)) + $unsigned(((8'hae) != reg136))) ?
                  wire3[(3'h4):(2'h2)] : $signed($unsigned((reg136 ?
                      wire3 : wire51)))) : (~{wire54, wire0})))
            begin
              reg136 <= ($signed($signed((-(!reg132)))) || $signed((wire1 == reg125)));
              reg137 <= wire54;
              reg138 <= ((~^$signed(($signed(reg124) ?
                      reg137 : reg125[(3'h5):(2'h3)]))) ?
                  $unsigned((~^(~$unsigned(reg124)))) : reg132);
            end
          else
            begin
              reg136 <= {(8'h9f),
                  $signed(({$signed(reg138), wire2[(3'h4):(1'h1)]} ?
                      ({reg128} ? (^~(8'hbf)) : (8'ha5)) : reg136))};
              reg137 <= $unsigned(reg125);
              reg138 <= ((8'hb5) ?
                  (^{($unsigned(reg136) * (8'hb5))}) : (~{wire121,
                      (reg128[(3'h5):(3'h5)] ?
                          reg133 : (reg130 ? wire0 : reg138))}));
            end
          reg139 <= $signed(reg138);
          reg140 <= {$unsigned((wire0 > reg127[(4'he):(2'h3)]))};
          reg141 <= (|(reg130 ? wire4[(4'h9):(3'h5)] : wire54[(4'hd):(2'h2)]));
        end
      reg142 <= {((^~(~|reg137)) == (((~reg137) && (reg133 ? reg125 : reg130)) ?
              reg132 : (8'hbd))),
          (reg137[(1'h1):(1'h1)] ?
              {wire4[(3'h7):(3'h6)], (+(7'h44))} : $signed((wire51 ?
                  (reg131 ? reg125 : reg125) : reg132[(1'h0):(1'h0)])))};
    end
  module97 #() modinst144 (.clk(clk), .y(wire143), .wire99(wire0), .wire101(reg128), .wire100(reg125), .wire98(reg126));
  always
    @(posedge clk) begin
      reg145 <= (^(|reg141));
      reg146 <= ((8'hbf) ?
          (~$unsigned(($signed(reg129) ?
              {reg141, wire3} : reg140))) : reg127[(1'h0):(1'h0)]);
      if ($unsigned(({wire54[(1'h0):(1'h0)], {wire0}} || (8'h9d))))
        begin
          if (wire143)
            begin
              reg147 <= reg142[(2'h2):(1'h1)];
              reg148 <= $signed(($unsigned({(wire51 - (7'h43)),
                      (reg136 ? wire53 : reg140)}) ?
                  {$signed(wire51)} : reg131[(5'h10):(1'h0)]));
              reg149 <= {$unsigned(((((8'ha0) ? wire53 : reg145) ?
                          (|(8'h9d)) : {wire2}) ?
                      $unsigned({reg140}) : $signed(reg127[(3'h5):(3'h4)])))};
            end
          else
            begin
              reg147 <= (!$signed(reg138[(4'hd):(3'h5)]));
              reg148 <= wire3[(3'h5):(1'h1)];
              reg149 <= (7'h42);
            end
        end
      else
        begin
          if ((~^($unsigned(((~&(8'hb5)) || ((7'h44) << (8'hb5)))) ?
              $unsigned($unsigned((!wire51))) : (wire54[(4'hb):(4'h8)] != wire53[(4'ha):(4'h9)]))))
            begin
              reg147 <= $unsigned($signed($signed(wire3)));
              reg148 <= reg131;
              reg149 <= $unsigned(((~&$signed((^~(8'ha2)))) ?
                  (($unsigned(reg139) ?
                      (8'hb9) : (~^reg145)) > ((reg131 == reg149) ?
                      wire121[(5'h10):(2'h3)] : (|wire54))) : $unsigned(reg141)));
            end
          else
            begin
              reg147 <= reg145[(2'h2):(1'h0)];
              reg148 <= reg137;
            end
          if (reg126[(1'h1):(1'h1)])
            begin
              reg150 <= (|(^$signed($signed(reg142))));
              reg151 <= reg146[(1'h0):(1'h0)];
              reg152 <= reg150[(2'h2):(2'h2)];
              reg153 <= ((((&(-reg142)) <= reg148[(1'h1):(1'h0)]) ?
                  $signed($unsigned(((8'ha6) + wire0))) : ($signed(((7'h41) ?
                          (8'h9e) : reg130)) ?
                      ((reg136 != wire3) ?
                          (8'ha3) : (8'hbd)) : {wire0[(3'h6):(3'h4)]})) ~^ $signed(wire53));
            end
          else
            begin
              reg150 <= reg147[(3'h7):(1'h0)];
              reg151 <= ($unsigned(wire0) && ((!{reg153}) ?
                  $unsigned($signed(reg128)) : (((reg142 ? reg146 : reg148) ?
                          (reg123 & reg142) : (reg123 >> reg140)) ?
                      reg131 : ($signed(reg139) + (reg126 ?
                          reg128 : reg145)))));
              reg152 <= wire121[(3'h6):(3'h6)];
            end
          reg154 <= {reg127[(3'h5):(2'h3)], (8'hb4)};
          reg155 <= $unsigned($unsigned((+reg147)));
        end
    end
  assign wire156 = $unsigned(($signed(($signed(reg145) < reg153)) ?
                       reg145[(1'h1):(1'h0)] : reg135));
  assign wire157 = reg150[(2'h3):(2'h3)];
  assign wire158 = wire156[(1'h1):(1'h0)];
  assign wire159 = reg125[(3'h4):(2'h3)];
endmodule

module module56
#(parameter param119 = (-(((~&(~|(7'h42))) ? (((8'hb6) && (8'ha4)) ? ((8'hb6) << (8'hb1)) : (~&(7'h43))) : (~&(~(8'ha0)))) ? {(((8'ha3) != (8'hab)) ? {(8'had), (8'haf)} : ((8'hac) == (8'hb4))), ((^(8'hbf)) ? (&(8'ha9)) : ((8'hae) ? (8'h9e) : (8'h9e)))} : ((((8'hbe) ? (8'hb3) : (8'hbc)) ? {(8'hb5)} : (~|(8'hb9))) ? {{(8'ha3)}} : {((8'hbc) ? (8'ha8) : (7'h40)), (~&(8'haf))}))), 
parameter param120 = (param119 != (^~(|(~(param119 ? param119 : param119))))))
(y, clk, wire57, wire58, wire59, wire60, wire61);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire57;
  input wire signed [(5'h10):(1'h0)] wire58;
  input wire signed [(5'h14):(1'h0)] wire59;
  input wire signed [(5'h15):(1'h0)] wire60;
  input wire signed [(5'h13):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire118;
  wire signed [(3'h4):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire115;
  wire signed [(4'hb):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(5'h10):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire92;
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire112,
                 wire96,
                 wire95,
                 wire94,
                 wire62,
                 wire92,
                 (1'h0)};
  assign wire62 = $signed($unsigned(wire59[(1'h0):(1'h0)]));
  module63 #() modinst93 (wire92, clk, wire62, wire57, wire58, wire61, wire59);
  assign wire94 = (~wire59[(4'hd):(4'hb)]);
  assign wire95 = $signed($signed($unsigned($signed(((7'h40) <= wire92)))));
  assign wire96 = (8'hbb);
  module97 #() modinst113 (.clk(clk), .wire100(wire58), .y(wire112), .wire99(wire92), .wire98(wire59), .wire101(wire95));
  assign wire114 = (~&(&(^~$signed(wire59[(5'h10):(2'h3)]))));
  assign wire115 = ({(~&(~|(-wire57)))} <<< $unsigned(({$unsigned(wire62),
                       {wire62, (8'h9c)}} ^~ (+$signed((8'hb0))))));
  assign wire116 = $unsigned((+(wire115[(5'h10):(3'h4)] | (wire112[(4'hb):(3'h6)] != ((8'ha2) ?
                       wire61 : wire57)))));
  assign wire117 = (|(~&{$signed({(7'h40)}),
                       ($unsigned(wire58) ?
                           (wire60 ? wire94 : wire61) : {wire58})}));
  assign wire118 = $signed(wire112);
endmodule

module module5
#(parameter param50 = (({(^(8'h9d))} ? (8'ha3) : {((~|(8'hb0)) != (|(8'hbe))), ((&(7'h43)) ? ((8'hbf) ? (8'ha9) : (8'ha3)) : (!(8'ha3)))}) ? (~^({((8'ha9) || (7'h42))} ? ((^~(8'h9f)) ? {(8'hb6), (8'hbc)} : ((8'ha7) && (8'hb5))) : (8'hac))) : (((((8'hb9) + (8'had)) > (8'haa)) * (((8'ha1) >> (8'hb4)) < ((8'ha7) ? (8'had) : (8'hb2)))) < ((((8'h9f) ? (8'hb9) : (8'hba)) ? (&(8'h9c)) : ((8'hb2) ? (8'hb6) : (8'ha2))) ? ((|(8'ha4)) != (8'had)) : ((&(8'ha9)) || {(8'hbc)})))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  assign y = {wire48,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 (1'h0)};
  assign wire10 = wire8[(3'h6):(1'h0)];
  assign wire11 = $unsigned((~(wire8[(4'ha):(4'h8)] < wire8)));
  assign wire12 = (^{(8'hbd),
                      ((wire9[(2'h2):(2'h2)] ? (+wire6) : wire11) ?
                          wire11[(2'h3):(2'h3)] : wire10)});
  assign wire13 = (~^wire7[(1'h0):(1'h0)]);
  assign wire14 = ($signed((wire11 <<< wire13[(2'h2):(2'h2)])) * ($unsigned(wire6) ?
                      wire7[(4'h8):(3'h6)] : (^$unsigned(wire12[(2'h3):(1'h1)]))));
  assign wire15 = $signed($unsigned($signed($unsigned({wire6, (8'hb2)}))));
  assign wire16 = wire6[(1'h0):(1'h0)];
  module17 #() modinst49 (.wire21(wire9), .wire18(wire7), .wire19(wire10), .clk(clk), .wire20(wire15), .y(wire48));
endmodule

module module17
#(parameter param47 = ({{(((8'hbc) < (8'ha9)) ? ((8'ha7) ? (8'hbe) : (8'hb9)) : ((8'ha8) || (8'ha8))), {((8'had) ? (8'ha7) : (8'hb2)), ((8'h9d) ? (8'h9f) : (8'hba))}}, ((-((7'h42) ? (8'ha7) : (8'hb1))) >> (&((8'hba) ? (8'ha6) : (8'ha1))))} ~^ (((~^((8'haf) ? (8'hbf) : (8'hb6))) > ({(8'hb9), (8'haf)} - (~|(8'hbb)))) & ({((8'ha2) >>> (8'ha8)), (^~(8'hb3))} >>> ((~(8'hbd)) ? ((8'ha5) - (8'h9c)) : ((8'hb1) ? (8'hb6) : (8'ha0)))))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire21;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire [(3'h7):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire22;
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
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
                 (1'h0)};
  assign wire22 = $signed($unsigned($unsigned((((8'hba) ? wire20 : wire19) ?
                      $unsigned(wire18) : wire19))));
  assign wire23 = $signed($signed((wire19[(4'h8):(3'h4)] ?
                      wire22 : $signed((wire19 < (7'h44))))));
  assign wire24 = $unsigned($unsigned((!$unsigned(wire21[(4'h8):(2'h3)]))));
  assign wire25 = $unsigned({$unsigned(($unsigned((8'hb5)) & (wire23 || wire24)))});
  assign wire26 = $unsigned(($unsigned(wire23) ?
                      (!$signed((wire21 - wire21))) : ({$signed(wire23)} | $signed(wire20[(2'h2):(1'h1)]))));
  assign wire27 = $unsigned({(wire21[(4'h8):(3'h6)] + (((8'hb5) <= wire18) ?
                          (!wire26) : wire19))});
  assign wire28 = (8'hbb);
  always
    @(posedge clk) begin
      if ($signed($unsigned((|{wire20}))))
        begin
          reg29 <= wire21[(2'h2):(1'h0)];
          reg30 <= (wire25[(1'h0):(1'h0)] ?
              ((~&wire25) ?
                  ((^wire28[(4'he):(2'h3)]) ^~ (^$unsigned(wire22))) : {wire28,
                      ((~^wire20) ?
                          $unsigned(wire20) : (+wire25))}) : {(-(~&wire19))});
          reg31 <= (|$signed($signed(({wire24} ?
              ((8'h9c) || wire28) : wire24))));
        end
      else
        begin
          reg29 <= (|((&$unsigned($signed(reg30))) || $signed($unsigned((wire28 <<< reg29)))));
        end
      reg32 <= ((~^(-({reg30} ? {reg30} : {wire19, reg31}))) && (8'h9c));
      if ((|(((((8'ha4) ? wire25 : wire18) ?
              wire20 : wire18) <= $unsigned($signed(reg29))) ?
          wire28[(4'hc):(3'h7)] : reg31)))
        begin
          reg33 <= $signed(wire26);
          reg34 <= (^(wire21[(2'h3):(1'h0)] ?
              ({(!wire21),
                  $unsigned(reg31)} != (~|(^~reg29))) : $unsigned((~^wire26))));
          if (((~(~^$unsigned(wire24))) ?
              $unsigned({$unsigned(wire23[(4'h9):(2'h2)])}) : ($signed(wire22[(3'h4):(1'h0)]) <= reg31[(4'ha):(4'h8)])))
            begin
              reg35 <= ($signed($signed(wire25)) >>> (-((~(reg33 ^ (8'ha9))) ~^ ((~^wire23) ^ wire23))));
              reg36 <= (^{wire24[(4'hf):(4'h8)], (^~(&((8'ha2) >> wire27)))});
              reg37 <= (((!((^~wire26) ? (~|wire23) : wire24[(4'he):(3'h6)])) ?
                  $unsigned(wire25[(2'h2):(1'h1)]) : $unsigned($signed((~^reg32)))) && $signed($unsigned(($signed(reg30) ^ (wire18 - wire21)))));
              reg38 <= reg36;
            end
          else
            begin
              reg35 <= $signed((((-reg36) >>> $signed($signed(reg29))) ?
                  wire27 : $signed($unsigned(wire28))));
            end
        end
      else
        begin
          reg33 <= wire28;
          reg34 <= $unsigned($unsigned(($unsigned((wire22 * reg34)) || ((~|wire19) != $unsigned(reg30)))));
          reg35 <= $unsigned((~|$signed(wire25[(2'h2):(2'h2)])));
          reg36 <= $unsigned($unsigned(wire28[(5'h11):(1'h0)]));
          reg37 <= $signed((8'hb5));
        end
      reg39 <= (~^wire25[(1'h1):(1'h1)]);
      reg40 <= wire25;
    end
  always
    @(posedge clk) begin
      reg41 <= $unsigned($signed(wire22[(1'h1):(1'h0)]));
      reg42 <= reg38;
      reg43 <= wire23[(1'h1):(1'h1)];
    end
  assign wire44 = $signed(($signed($unsigned($signed((8'h9f)))) ?
                      ($unsigned(reg42) ?
                          reg35 : (reg31 ?
                              $unsigned(wire18) : $signed(reg37))) : (($signed(wire24) ?
                          {reg31} : (-reg38)) >>> reg41[(2'h3):(2'h2)])));
  assign wire45 = reg29[(5'h13):(5'h11)];
  assign wire46 = wire22;
endmodule

module module97
#(parameter param111 = (~((!{(8'haf)}) ? (~|((8'ha2) >= (~^(8'hbd)))) : (((-(8'ha8)) >> ((7'h40) * (8'ha1))) >= ((~&(8'hbd)) ? ((8'ha2) ? (8'hb1) : (8'h9d)) : (~^(8'h9f)))))))
(y, clk, wire101, wire100, wire99, wire98);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire101;
  input wire [(2'h3):(1'h0)] wire100;
  input wire [(4'he):(1'h0)] wire99;
  input wire [(4'he):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire107;
  wire [(4'h8):(1'h0)] wire106;
  wire [(4'hc):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire104;
  wire signed [(3'h7):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire102;
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 (1'h0)};
  assign wire102 = wire100[(2'h2):(1'h0)];
  assign wire103 = (&($unsigned($unsigned(wire100[(2'h3):(1'h0)])) ?
                       ($signed(wire101[(2'h3):(2'h3)]) ?
                           ($unsigned(wire99) ?
                               $unsigned(wire101) : wire98) : (wire102[(2'h2):(2'h2)] ?
                               (7'h40) : $unsigned((7'h40)))) : wire98));
  assign wire104 = ((~$unsigned((!wire100[(1'h1):(1'h0)]))) ?
                       {(&(|(8'ha8))),
                           $unsigned((^~(wire98 >>> (7'h40))))} : ((~|((wire101 >>> wire99) | $unsigned((7'h41)))) ?
                           ((wire99 ?
                               wire101 : (wire102 ?
                                   wire101 : wire103)) > wire101[(3'h4):(3'h4)]) : wire100[(1'h0):(1'h0)]));
  assign wire105 = (wire102 >>> $unsigned($unsigned((^~(wire104 ^~ wire99)))));
  assign wire106 = $unsigned(wire103);
  assign wire107 = wire101[(3'h4):(3'h4)];
  assign wire108 = (~|wire98);
  assign wire109 = $signed((^~wire104));
  assign wire110 = (wire106 ?
                       (^(((wire106 >= wire108) >= (wire109 ?
                           wire107 : wire104)) <<< wire98[(3'h6):(1'h0)])) : (&wire102));
endmodule

module module63
#(parameter param91 = ((+((7'h43) ? (((8'h9c) ? (8'ha6) : (7'h41)) ? ((8'h9c) <= (8'hbf)) : {(8'ha5)}) : (!(+(8'ha5))))) ? (&(((~&(7'h42)) <<< ((8'had) ^ (8'h9e))) ? {{(8'ha3)}, {(8'hb2), (8'ha1)}} : (^((8'hbf) ? (8'hb7) : (8'h9e))))) : (((~^((8'hb7) ? (7'h40) : (8'hac))) ? ((|(8'hb0)) & ((8'ha9) ~^ (8'ha4))) : {(^~(8'hb7))}) >> (^~((8'hb3) ? ((8'hb3) & (8'hb6)) : ((8'hbb) ? (8'h9f) : (8'ha8)))))))
(y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire68;
  input wire signed [(4'hc):(1'h0)] wire67;
  input wire [(4'he):(1'h0)] wire66;
  input wire [(4'hb):(1'h0)] wire65;
  input wire signed [(3'h5):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire78;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire69;
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(2'h2):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire82,
                 wire78,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg81,
                 reg80,
                 reg79,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire69 = wire65[(3'h4):(1'h1)];
  assign wire70 = {$unsigned(($unsigned(((8'hbe) + wire64)) ~^ wire69))};
  assign wire71 = wire69[(4'hc):(4'h9)];
  assign wire72 = $unsigned(wire71);
  assign wire73 = ({$unsigned(wire69[(4'ha):(2'h2)])} ?
                      (wire68 ?
                          ((8'hbe) && ({wire68} > {wire65,
                              wire68})) : $unsigned($signed(wire67))) : {wire71[(4'hc):(2'h2)],
                          $unsigned(wire66[(4'h9):(1'h0)])});
  assign wire74 = wire73[(4'hb):(3'h5)];
  always
    @(posedge clk) begin
      reg75 <= ($signed(($unsigned($signed(wire72)) ?
          wire69 : {$signed(wire64),
              ((8'hb2) * wire68)})) ^ $signed((+wire64)));
      reg76 <= $unsigned(((wire66[(1'h0):(1'h0)] ? (~&{wire64}) : (+reg75)) ?
          $signed(wire71[(3'h4):(1'h0)]) : {wire74[(3'h6):(3'h6)]}));
      reg77 <= (^~{(wire69 + $unsigned(wire66[(3'h6):(2'h2)]))});
    end
  assign wire78 = wire65[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if ((8'h9c))
        begin
          reg79 <= (~wire78);
        end
      else
        begin
          reg79 <= wire74;
          reg80 <= $signed(($unsigned((wire72 ?
                  ((8'hb9) ? wire66 : wire72) : (wire71 ? (8'hb8) : wire74))) ?
              $unsigned(($signed((7'h41)) ?
                  (wire71 <<< reg77) : $signed(wire65))) : (8'hb2)));
        end
      reg81 <= $unsigned($signed($signed((7'h44))));
    end
  assign wire82 = reg75[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg83 <= $unsigned(({($unsigned(wire78) - (wire69 ? wire72 : reg76)),
              $signed((reg76 ? wire66 : reg76))} ?
          $signed(((reg80 ~^ wire68) ?
              wire69 : (^~wire64))) : ($unsigned(wire82[(4'ha):(3'h5)]) < ((wire71 ^~ reg76) ?
              (&wire70) : $unsigned(reg79)))));
    end
  always
    @(posedge clk) begin
      reg84 <= (&(8'ha0));
      reg85 <= wire70[(4'h8):(3'h6)];
      reg86 <= wire71;
    end
  assign wire87 = ((^reg85) ? $signed($signed(wire72[(2'h3):(1'h1)])) : wire71);
  assign wire88 = reg85;
  assign wire89 = ({((wire65[(3'h4):(2'h2)] ?
                          $unsigned(wire88) : wire68) * wire71[(1'h1):(1'h1)])} > ($signed($unsigned((|wire67))) ?
                      $unsigned($signed((wire64 ?
                          reg79 : reg83))) : (!$signed((8'hba)))));
  assign wire90 = (reg84 ^ {reg81, (!((8'haf) | reg84[(4'h8):(3'h7)]))});
endmodule
