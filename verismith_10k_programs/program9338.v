module top
#(parameter param227 = (!((~({(8'hb7)} ? {(8'h9c), (8'hb8)} : {(7'h40), (8'ha8)})) ? (|((^~(8'hb2)) ? ((8'hb0) * (8'hb0)) : (&(8'had)))) : ({((8'h9d) ? (8'ha9) : (8'hba))} ? {((7'h43) | (8'haf)), ((8'hbd) ? (8'hb3) : (8'ha1))} : (~&((8'hb6) ? (8'hb6) : (8'hb1)))))), 
parameter param228 = ({((^(param227 ? param227 : param227)) == ((^~param227) ? (^~param227) : (~param227))), (^~{param227, (~&param227)})} ? (param227 == param227) : param227))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire226;
  wire [(4'he):(1'h0)] wire225;
  wire [(4'ha):(1'h0)] wire224;
  wire signed [(5'h13):(1'h0)] wire223;
  wire [(5'h10):(1'h0)] wire210;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire212;
  wire signed [(4'hc):(1'h0)] wire213;
  wire [(5'h12):(1'h0)] wire215;
  wire [(4'hf):(1'h0)] wire216;
  wire signed [(4'he):(1'h0)] wire217;
  wire signed [(4'hd):(1'h0)] wire218;
  wire signed [(5'h10):(1'h0)] wire219;
  wire [(3'h7):(1'h0)] wire220;
  wire signed [(3'h7):(1'h0)] wire221;
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire210,
                 wire56,
                 wire212,
                 wire213,
                 wire215,
                 wire216,
                 wire217,
                 wire218,
                 wire219,
                 wire220,
                 wire221,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (((wire0 | $signed($unsigned(wire0))) ?
              (~&($signed(wire3) + (8'hb3))) : (|(^$unsigned(wire0)))) ?
          $signed({$signed((wire3 || wire2))}) : (!$signed((~$signed(wire3)))));
      if ((wire1[(3'h5):(1'h1)] ? reg4 : (!{wire3[(1'h0):(1'h0)], wire2})))
        begin
          if ((~((reg4 ?
              wire3 : reg4) ^ ((((8'hb5) + wire0) < $unsigned(wire2)) > ($unsigned(wire3) ?
              $unsigned(wire3) : wire0[(1'h0):(1'h0)])))))
            begin
              reg5 <= wire0[(1'h0):(1'h0)];
            end
          else
            begin
              reg5 <= reg4[(5'h11):(4'h8)];
              reg6 <= $unsigned((~^(reg4[(4'he):(4'hd)] ?
                  wire1[(1'h1):(1'h0)] : $signed(wire1[(3'h7):(2'h3)]))));
              reg7 <= wire0;
            end
        end
      else
        begin
          reg5 <= $signed(({reg4} << $signed($unsigned((~&(8'hb8))))));
          reg6 <= ({$unsigned({(reg6 ? reg7 : (8'hbd))})} ?
              ((reg6 ?
                  (~&{wire1}) : ($signed(reg4) ?
                      wire1[(1'h1):(1'h0)] : reg5)) - reg6) : $unsigned($unsigned((wire1 | (+reg7)))));
          reg7 <= $unsigned(wire2);
          reg8 <= wire0;
        end
      if ({$signed({$unsigned($unsigned(reg4))})})
        begin
          reg9 <= wire1[(3'h6):(2'h2)];
        end
      else
        begin
          reg9 <= ((~reg9[(2'h2):(1'h0)]) ?
              (({(~^reg5), reg5} ? (8'hb4) : ($unsigned(reg4) + reg9)) ?
                  $unsigned(((reg8 + reg7) ?
                      wire1 : $unsigned((8'h9e)))) : $signed(reg8)) : (|((wire3[(3'h7):(3'h4)] ?
                      (reg6 ? reg7 : reg6) : (reg6 <= (8'ha0))) ?
                  $signed(((8'hae) ? reg7 : reg9)) : reg5)));
          reg10 <= (reg7[(3'h5):(1'h0)] ?
              ((-$unsigned((reg4 + reg7))) > reg7[(3'h4):(1'h0)]) : reg8[(2'h2):(2'h2)]);
          reg11 <= ((wire0[(1'h1):(1'h0)] == $signed(reg8)) >> $signed(wire0));
          reg12 <= ($signed((~{$unsigned((8'h9c))})) ?
              $unsigned($unsigned($unsigned($signed(wire0)))) : ($signed((reg4[(5'h10):(4'hd)] == {reg6,
                  reg8})) + {(reg7[(3'h4):(2'h3)] ^~ (reg8 ? wire0 : reg11))}));
        end
    end
  module13 #() modinst57 (.clk(clk), .wire17(wire0), .wire16(reg9), .wire14(wire2), .wire15(reg4), .y(wire56));
  module58 #() modinst211 (.wire61(reg12), .wire60(reg8), .wire59(wire56), .clk(clk), .wire62(reg5), .y(wire210));
  assign wire212 = (^wire2);
  module58 #() modinst214 (wire213, clk, reg10, reg4, reg11, reg9);
  assign wire215 = (|($signed(wire2[(1'h1):(1'h0)]) ^ ($signed((reg6 ?
                           wire3 : wire1)) ?
                       wire210[(4'hd):(4'hd)] : {wire56, $unsigned(wire2)})));
  assign wire216 = $signed((~^reg11[(4'hd):(1'h1)]));
  assign wire217 = $signed(((~(^~reg12)) + {$unsigned((8'h9d)), reg12}));
  assign wire218 = $unsigned({((wire3[(3'h6):(2'h3)] ?
                           (reg6 ?
                               wire0 : wire215) : $unsigned(reg11)) ~^ (8'ha3)),
                       (reg12[(4'ha):(3'h5)] && $unsigned($unsigned(wire210)))});
  assign wire219 = (($signed($unsigned((^wire3))) > (7'h41)) ?
                       ($unsigned($unsigned(reg8[(3'h6):(1'h1)])) ?
                           (^~wire2) : ($unsigned({reg4, wire213}) ?
                               ($unsigned(wire0) ?
                                   (wire0 | reg11) : (wire3 ?
                                       (8'hb6) : reg11)) : $unsigned((&wire56)))) : wire56);
  assign wire220 = (($unsigned((8'hba)) ?
                       ((-wire215[(1'h0):(1'h0)]) + wire212[(4'h8):(1'h1)]) : {(wire210[(4'h9):(3'h4)] ?
                               (wire56 ?
                                   reg8 : (8'hb9)) : (-wire215))}) <<< ({$signed($signed((8'hbe)))} >> wire210));
  module58 #() modinst222 (.wire62(wire216), .y(wire221), .wire61(reg8), .wire59(reg12), .wire60(reg4), .clk(clk));
  assign wire223 = ($signed((!{$unsigned(wire3)})) && $signed((({wire2,
                       reg6} <= $unsigned(wire217)) >>> wire215[(3'h4):(2'h3)])));
  assign wire224 = $unsigned(wire56[(3'h4):(2'h2)]);
  assign wire225 = (~&($signed(wire224) >= wire215[(5'h11):(3'h4)]));
  assign wire226 = (|($unsigned($signed(wire1)) | (wire223[(5'h11):(4'hb)] | wire56)));
endmodule

module module58  (y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire62;
  input wire signed [(3'h6):(1'h0)] wire61;
  input wire signed [(4'hd):(1'h0)] wire60;
  input wire [(4'hd):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire209;
  wire [(2'h3):(1'h0)] wire208;
  wire signed [(3'h4):(1'h0)] wire207;
  wire signed [(4'hc):(1'h0)] wire206;
  wire [(3'h5):(1'h0)] wire205;
  wire [(5'h10):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire103;
  wire [(5'h13):(1'h0)] wire104;
  wire [(4'hc):(1'h0)] wire105;
  wire signed [(4'ha):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire144;
  wire [(5'h11):(1'h0)] wire203;
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  assign y = {wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire99,
                 wire65,
                 wire64,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire142,
                 wire144,
                 wire203,
                 reg63,
                 reg145,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg63 <= ((~((wire60 ? $signed((8'hbb)) : wire62) ?
          wire62 : {(^wire62), wire59[(3'h4):(2'h3)]})) - wire61);
    end
  assign wire64 = ((+(wire60 ~^ wire61[(1'h0):(1'h0)])) * ($unsigned((~&$signed(wire59))) ?
                      $signed(wire59[(1'h0):(1'h0)]) : wire59[(2'h2):(1'h1)]));
  assign wire65 = (($unsigned(wire64[(4'h9):(2'h3)]) ?
                      reg63[(2'h3):(2'h3)] : $signed((~|(wire60 <<< wire59)))) * $unsigned(((8'ha4) ?
                      (!$signed(reg63)) : reg63[(1'h0):(1'h0)])));
  module66 #() modinst100 (wire99, clk, wire64, wire61, wire59, wire62, wire60);
  assign wire101 = $unsigned(({(^~$signed((8'hbe))),
                       wire99[(1'h0):(1'h0)]} < (^~$unsigned((wire61 ?
                       wire62 : wire99)))));
  assign wire102 = $unsigned((+(^wire64[(4'hb):(4'h9)])));
  assign wire103 = wire60[(4'ha):(3'h5)];
  assign wire104 = (~$unsigned($signed((wire65 ?
                       {(8'hb5)} : (wire60 ? wire62 : wire103)))));
  assign wire105 = (reg63 < $unsigned((~|$unsigned($signed(wire61)))));
  assign wire106 = {wire60[(1'h1):(1'h0)]};
  module107 #() modinst143 (wire142, clk, reg63, wire65, wire59, wire64, wire104);
  assign wire144 = $unsigned({$unsigned($unsigned({(8'hab)}))});
  always
    @(posedge clk) begin
      reg145 <= (($unsigned(wire103) ?
              $unsigned($unsigned(reg63[(3'h4):(2'h2)])) : wire60) ?
          (($unsigned((wire65 & (8'hae))) + (reg63[(2'h2):(1'h0)] ?
              $signed(wire106) : (7'h41))) < wire102[(3'h5):(3'h5)]) : $unsigned($unsigned($signed(wire102))));
    end
  module146 #() modinst204 (.wire149(wire64), .wire150(wire105), .wire148(wire104), .clk(clk), .wire147(reg145), .y(wire203));
  assign wire205 = wire105;
  assign wire206 = $unsigned(($unsigned({$signed(wire99), $unsigned((8'hb9))}) ?
                       (wire65[(2'h2):(2'h2)] & (~|(^~wire142))) : $unsigned(wire59[(3'h6):(2'h2)])));
  assign wire207 = (((((^~wire60) ? (~&wire62) : wire203[(4'hf):(3'h5)]) ?
                           $signed(wire104[(3'h6):(3'h6)]) : wire106) >> (wire105 + wire144)) ?
                       $unsigned(reg145[(5'h10):(4'hf)]) : (|{((wire59 ?
                               (8'h9d) : wire104) | $unsigned(wire142))}));
  assign wire208 = ({(-(-(wire203 ?
                           wire59 : (8'haa))))} <<< reg145[(3'h5):(3'h5)]);
  assign wire209 = $unsigned((8'had));
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire signed [(5'h10):(1'h0)] wire15;
  input wire [(4'hd):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire48;
  assign y = {wire55, wire54, wire53, wire52, wire51, wire50, wire48, (1'h0)};
  module18 #() modinst49 (wire48, clk, wire17, wire16, wire14, wire15);
  assign wire50 = wire16;
  assign wire51 = {(((7'h42) ? wire16[(1'h0):(1'h0)] : $signed(wire17)) ?
                          wire16[(3'h5):(3'h5)] : $unsigned(wire48[(1'h0):(1'h0)]))};
  assign wire52 = $unsigned((wire50[(4'h8):(1'h0)] ?
                      $signed(($unsigned(wire17) ?
                          (wire14 == wire48) : (wire51 ?
                              wire17 : wire17))) : ($signed(wire51) ?
                          (((8'ha2) ?
                              wire50 : wire16) - (wire16 | wire17)) : ($unsigned(wire14) >= (wire14 ?
                              (7'h41) : wire50)))));
  assign wire53 = $unsigned($signed($signed($signed(wire50[(4'h9):(3'h5)]))));
  assign wire54 = (8'hbe);
  assign wire55 = wire16[(4'he):(2'h3)];
endmodule

module module18
#(parameter param46 = ((~({((8'h9c) ? (7'h42) : (8'ha4))} ? (^~(-(8'hb7))) : (8'hbd))) && (8'h9e)), 
parameter param47 = param46)
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire21;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire23;
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire28,
                 wire27,
                 wire23,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = wire20;
  always
    @(posedge clk) begin
      reg24 <= wire21;
      reg25 <= ($signed(wire19) ?
          (({(wire21 ? (8'ha6) : wire19)} ? $signed((&wire20)) : wire19) ?
              wire22[(3'h4):(2'h2)] : $signed(($signed(wire23) ?
                  wire22[(1'h0):(1'h0)] : $unsigned(wire21)))) : {wire22[(1'h1):(1'h1)],
              wire19});
      reg26 <= (~^$signed(wire22[(3'h5):(2'h3)]));
    end
  assign wire27 = (^~({($unsigned(wire20) ?
                          (~&wire20) : (reg24 ? (8'hb2) : wire21)),
                      (((8'hb9) ?
                          wire20 : reg26) || (wire21 <<< reg25))} ~^ wire21[(1'h0):(1'h0)]));
  assign wire28 = {({(8'ha3)} & reg26),
                      $unsigned(($signed($unsigned(wire22)) ?
                          ((reg26 ?
                              reg26 : reg24) ~^ (~|wire23)) : $signed(wire20[(4'hc):(3'h7)])))};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire20[(2'h3):(2'h3)])))
        begin
          reg29 <= $signed($unsigned(reg26));
          reg30 <= (((!(~|$unsigned(wire20))) ?
              ($unsigned({reg29, reg24}) ?
                  reg25[(2'h3):(2'h3)] : (-{(8'hac),
                      reg29})) : reg26[(1'h0):(1'h0)]) == $unsigned(($signed((~^reg24)) < $unsigned(reg25))));
          reg31 <= $unsigned($signed((((reg30 ? (8'hac) : (8'hab)) ?
              wire27[(4'h9):(2'h2)] : wire27) > {$signed(wire19)})));
          reg32 <= ((!$signed($unsigned((-reg25)))) ?
              $unsigned({(reg30 ?
                      reg31[(3'h7):(3'h6)] : $signed((8'ha0)))}) : $unsigned((reg29 ^~ {reg25,
                  (8'hb3)})));
        end
      else
        begin
          reg29 <= $signed((&(8'hab)));
          reg30 <= (reg29 + reg32[(3'h4):(2'h3)]);
          reg31 <= (~|$unsigned(((reg30 ?
              $signed(wire27) : (reg24 ? (8'h9e) : reg24)) || (8'hbc))));
          if ((&(~(7'h40))))
            begin
              reg32 <= (~|$signed(((~^((8'hb4) ?
                  wire22 : reg32)) <<< wire21[(4'ha):(3'h5)])));
            end
          else
            begin
              reg32 <= $signed({reg26, reg30});
            end
        end
    end
  assign wire33 = ((wire27 ^ ({(reg25 ~^ reg30)} + $signed($unsigned(reg29)))) ?
                      ($signed(((reg24 ?
                              wire28 : reg30) >= $unsigned(wire23))) ?
                          (~^$unsigned((^wire22))) : reg32) : wire28);
  assign wire34 = wire33;
  assign wire35 = (~(reg24[(1'h1):(1'h0)] && (~^wire23)));
  assign wire36 = (&($signed(wire33) ?
                      (reg26[(2'h2):(2'h2)] ?
                          $signed(wire22[(1'h0):(1'h0)]) : wire20[(3'h4):(2'h3)]) : ((wire20 ?
                              wire28 : $unsigned(reg26)) ?
                          (~&{wire28, wire27}) : (reg24 ?
                              (wire22 & (8'ha9)) : $signed(reg25)))));
  assign wire37 = ((((^~(8'hb6)) ?
                      $signed($unsigned((8'hbc))) : (~^(~&reg29))) < wire23) < ($unsigned(($signed(reg31) ?
                      wire19 : $unsigned(wire23))) > $signed(($unsigned(reg30) ^ $signed((8'hb4))))));
  assign wire38 = reg32[(3'h4):(3'h4)];
  assign wire39 = wire34;
  assign wire40 = $unsigned($unsigned($unsigned((wire28 ?
                      $signed(wire35) : (reg25 == (8'hb0))))));
  assign wire41 = $unsigned($signed($unsigned($signed((wire20 < wire19)))));
  assign wire42 = $unsigned(($unsigned((wire23 > wire37[(4'ha):(3'h7)])) << $signed((wire21[(4'hb):(3'h4)] ^ (wire22 ?
                      wire27 : wire40)))));
  assign wire43 = reg32;
  assign wire44 = $signed($signed((wire20[(4'ha):(3'h6)] < wire34[(3'h6):(1'h1)])));
  assign wire45 = (|(wire44[(3'h4):(2'h3)] >> ($unsigned(wire41) ^ ($signed(wire40) <<< (wire20 >>> wire22)))));
endmodule

module module146  (y, clk, wire150, wire149, wire148, wire147);
  output wire [(32'h278):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire150;
  input wire [(3'h6):(1'h0)] wire149;
  input wire signed [(4'hd):(1'h0)] wire148;
  input wire signed [(5'h14):(1'h0)] wire147;
  wire signed [(5'h13):(1'h0)] wire202;
  wire [(3'h6):(1'h0)] wire164;
  wire signed [(3'h7):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire162;
  wire signed [(5'h14):(1'h0)] wire161;
  wire signed [(5'h15):(1'h0)] wire160;
  wire [(5'h11):(1'h0)] wire159;
  wire signed [(4'hd):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire157;
  wire signed [(2'h3):(1'h0)] wire156;
  wire [(5'h10):(1'h0)] wire155;
  wire signed [(4'hc):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire153;
  wire signed [(3'h4):(1'h0)] wire152;
  wire signed [(2'h3):(1'h0)] wire151;
  reg [(5'h15):(1'h0)] reg201 = (1'h0);
  reg signed [(4'he):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg198 = (1'h0);
  reg [(4'hd):(1'h0)] reg197 = (1'h0);
  reg [(5'h14):(1'h0)] reg196 = (1'h0);
  reg [(4'he):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg194 = (1'h0);
  reg [(5'h13):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg192 = (1'h0);
  reg [(3'h6):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg189 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg185 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg183 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg181 = (1'h0);
  reg [(2'h2):(1'h0)] reg180 = (1'h0);
  reg [(4'he):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg178 = (1'h0);
  reg [(4'h8):(1'h0)] reg177 = (1'h0);
  reg signed [(4'he):(1'h0)] reg176 = (1'h0);
  reg [(5'h15):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg173 = (1'h0);
  reg [(2'h2):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg [(5'h12):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg169 = (1'h0);
  reg signed [(4'he):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg167 = (1'h0);
  reg [(5'h12):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg165 = (1'h0);
  assign y = {wire202,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
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
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 (1'h0)};
  assign wire151 = wire147[(4'h9):(2'h3)];
  assign wire152 = ($unsigned($signed(wire147)) ?
                       $signed((+$unsigned(wire148))) : ((~^$signed($signed(wire148))) ?
                           $signed($unsigned(wire148[(1'h0):(1'h0)])) : $signed($signed((wire151 ?
                               wire151 : wire150)))));
  assign wire153 = wire150[(4'h9):(3'h4)];
  assign wire154 = wire150[(4'hb):(1'h0)];
  assign wire155 = (wire153 | (^(8'hb3)));
  assign wire156 = ($unsigned(wire154) ~^ (&(((wire150 ?
                           wire147 : wire154) >>> wire147) ?
                       $unsigned(wire153[(1'h1):(1'h0)]) : wire151[(2'h2):(2'h2)])));
  assign wire157 = ((+wire151) ? wire156[(2'h2):(1'h0)] : (-(7'h40)));
  assign wire158 = wire148[(2'h2):(2'h2)];
  assign wire159 = $unsigned({{($unsigned((8'hae)) | $signed(wire156))},
                       (!(|$signed(wire158)))});
  assign wire160 = (~^{(-$unsigned($unsigned(wire147)))});
  assign wire161 = $signed(wire160[(4'he):(1'h0)]);
  assign wire162 = $unsigned((+(^(~&(wire152 ? wire160 : wire161)))));
  assign wire163 = $signed((($signed(wire159[(4'hc):(4'h8)]) ?
                       $unsigned(wire152[(1'h0):(1'h0)]) : $unsigned($unsigned(wire158))) == (^{$signed(wire155)})));
  assign wire164 = wire154;
  always
    @(posedge clk) begin
      if ((wire151[(2'h2):(1'h1)] || $unsigned((~$unsigned($unsigned(wire162))))))
        begin
          reg165 <= (!{$signed($signed({wire158, wire156})),
              $signed($signed($unsigned(wire153)))});
        end
      else
        begin
          reg165 <= ($signed(($unsigned($signed(wire155)) >> wire155)) <<< wire162[(2'h3):(1'h1)]);
          reg166 <= $unsigned((8'hb6));
          reg167 <= {wire149, $unsigned(wire151[(2'h3):(1'h1)])};
          reg168 <= ((($signed((wire159 | reg165)) ?
                  ((wire162 ? wire158 : wire159) ?
                      wire157 : (wire163 ^~ wire161)) : ((wire163 <= wire155) <= (wire149 ?
                      wire157 : reg167))) ~^ $unsigned((reg166 ?
                  (8'hb1) : $signed((8'hb2))))) ?
              {(8'ha7)} : wire159);
        end
      reg169 <= wire155[(1'h1):(1'h1)];
      reg170 <= (8'hba);
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed(reg170[(3'h7):(3'h7)])))
        begin
          if ((wire152[(1'h1):(1'h1)] ?
              ({reg166[(5'h12):(3'h6)], wire150[(3'h4):(2'h3)]} ?
                  $signed(wire148[(4'hc):(4'h8)]) : (+$signed((reg167 & wire163)))) : $unsigned({$signed(wire153[(2'h2):(2'h2)])})))
            begin
              reg171 <= ((~|(!((wire152 && wire150) ?
                      $unsigned((8'hbf)) : $unsigned((8'ha3))))) ?
                  wire160[(4'hd):(4'hc)] : ($signed($signed((wire152 ?
                      (8'ha1) : reg170))) != (wire163 ?
                      (~&(^~wire158)) : $unsigned(wire151[(1'h1):(1'h0)]))));
              reg172 <= $signed((8'had));
              reg173 <= $unsigned($signed(({wire152} ^~ $signed((8'hb3)))));
            end
          else
            begin
              reg171 <= $signed($unsigned(reg173));
              reg172 <= wire164;
              reg173 <= (~($unsigned({(wire147 ? wire147 : reg166),
                      $signed(reg172)}) ?
                  (!wire160) : wire147[(4'hd):(4'hd)]));
              reg174 <= $unsigned(((((reg165 == wire163) ?
                      reg172[(2'h2):(1'h1)] : (8'hb3)) ?
                  wire149[(1'h1):(1'h1)] : ((reg169 ? (8'hb0) : wire148) ?
                      (wire154 & wire156) : wire159)) < (wire162 ?
                  wire157[(2'h3):(2'h3)] : (wire155 > $unsigned(wire152)))));
              reg175 <= (wire155 * $unsigned((reg170 ?
                  (((8'hb5) ~^ wire155) ?
                      $signed(wire158) : (reg173 ?
                          reg169 : wire150)) : $unsigned((wire161 >>> reg173)))));
            end
          reg176 <= (reg170[(5'h10):(3'h6)] && reg174[(1'h1):(1'h0)]);
          reg177 <= reg167;
        end
      else
        begin
          if ((~^wire163))
            begin
              reg171 <= (!{reg173[(4'h8):(1'h1)]});
              reg172 <= (((^~((8'hb3) ?
                  (wire149 <= reg167) : (~^wire152))) <= $unsigned(wire153)) | (($unsigned($signed(wire152)) ?
                  wire159[(4'h9):(1'h1)] : wire158[(4'ha):(3'h5)]) - (~&$signed($signed(wire164)))));
            end
          else
            begin
              reg171 <= {(-wire157),
                  {($signed((~|wire148)) | $signed((8'ha9)))}};
              reg172 <= $signed($unsigned(({$signed(reg166), (^wire159)} ?
                  reg171 : $signed((+reg177)))));
              reg173 <= ((reg168 ?
                  ($unsigned((&(7'h44))) | (wire159 ?
                      {reg168,
                          wire159} : $signed(reg173))) : wire164) ~^ (|$signed((wire155[(3'h7):(1'h0)] ?
                  (&reg173) : $signed((8'ha7))))));
              reg174 <= reg166[(4'hf):(3'h7)];
            end
          if ($signed((&(reg172 ?
              (~^$signed(reg168)) : ((|wire147) && (wire161 ?
                  (8'ha8) : reg177))))))
            begin
              reg175 <= (~wire161[(5'h11):(3'h4)]);
            end
          else
            begin
              reg175 <= wire157[(3'h5):(1'h1)];
            end
        end
      reg178 <= wire153[(2'h2):(1'h1)];
      reg179 <= (&$signed(reg178[(1'h0):(1'h0)]));
    end
  always
    @(posedge clk) begin
      if (((reg175 & {reg178, (8'h9c)}) <= wire164[(1'h1):(1'h1)]))
        begin
          reg180 <= $unsigned((reg179 ?
              ((^{reg165}) < $unsigned((|wire147))) : {$signed(reg177)}));
          reg181 <= (((8'hae) + $signed({$unsigned(wire158)})) ?
              (~^$signed($signed(reg165[(3'h7):(3'h4)]))) : (~^{(wire161 ?
                      reg178[(3'h4):(2'h2)] : (!reg167)),
                  reg173}));
          reg182 <= (~|$signed((wire152[(1'h0):(1'h0)] && reg167[(2'h2):(2'h2)])));
        end
      else
        begin
          reg180 <= (8'h9c);
          if ((((($unsigned(reg171) ? $unsigned(reg177) : reg169) >>> (7'h43)) ?
              (7'h42) : $unsigned({$signed(wire150)})) == (reg174[(2'h3):(1'h1)] ?
              (|$signed(reg169)) : $unsigned({(wire157 ? reg167 : wire156),
                  $signed(wire151)}))))
            begin
              reg181 <= wire156[(2'h3):(1'h1)];
              reg182 <= wire154[(4'h9):(4'h8)];
              reg183 <= {(-wire148[(3'h7):(3'h5)]),
                  $unsigned((wire164[(1'h0):(1'h0)] && wire152))};
            end
          else
            begin
              reg181 <= $unsigned(((($unsigned(wire155) ?
                          $signed(reg181) : (reg166 <<< wire159)) ?
                      (wire151 >= $signed(wire161)) : reg168[(4'ha):(1'h1)]) ?
                  $unsigned((reg173 * $signed(reg165))) : wire154[(1'h1):(1'h1)]));
              reg182 <= $unsigned((~(-(8'ha0))));
              reg183 <= (~&wire149[(2'h2):(1'h0)]);
              reg184 <= reg177[(3'h6):(3'h4)];
            end
          reg185 <= (wire154[(3'h7):(2'h3)] ?
              $unsigned(wire150) : (^$signed(wire154[(1'h0):(1'h0)])));
        end
      reg186 <= ($signed({(reg175 ?
                  {reg178, wire149} : (wire161 || wire162))}) ?
          (~&((~|$signed(wire153)) <<< (8'hb9))) : $signed(reg179));
      if (((|reg184) ?
          $unsigned(reg184[(2'h2):(1'h0)]) : $unsigned(reg181[(5'h14):(1'h1)])))
        begin
          reg187 <= wire161[(5'h14):(4'h9)];
          reg188 <= {($signed($signed(((8'hb1) ?
                  wire149 : wire159))) < reg179)};
        end
      else
        begin
          if (wire164)
            begin
              reg187 <= $unsigned(((-reg188[(3'h7):(3'h5)]) - (($signed(wire163) ?
                      ((8'h9d) != reg185) : wire149[(1'h0):(1'h0)]) ?
                  reg171[(4'h9):(4'h9)] : $signed({wire147, (8'ha2)}))));
              reg188 <= reg178[(1'h1):(1'h0)];
              reg189 <= (wire155 ?
                  $signed((($unsigned((8'ha2)) >>> wire162[(3'h5):(3'h5)]) | $unsigned((reg177 ?
                      reg172 : (8'h9d))))) : ((7'h43) && reg167[(4'hd):(2'h2)]));
            end
          else
            begin
              reg187 <= reg176;
              reg188 <= (reg185[(5'h10):(3'h7)] ?
                  ({$unsigned($signed((7'h42))),
                      reg177} ^ (^~reg183)) : (~&wire152[(2'h2):(2'h2)]));
              reg189 <= $unsigned({((~^(reg170 ? reg170 : reg175)) ?
                      reg168[(2'h2):(1'h0)] : (reg183[(1'h1):(1'h1)] ?
                          wire161[(4'hf):(4'he)] : (reg171 ? reg181 : reg183))),
                  reg182[(4'h9):(4'h9)]});
              reg190 <= {($signed(reg166) ?
                      $signed($unsigned($signed(wire163))) : wire162)};
              reg191 <= reg172[(2'h2):(2'h2)];
            end
        end
      if ({(-($signed(reg174) ?
              (~(reg169 || reg166)) : $unsigned($signed(reg181))))})
        begin
          reg192 <= $signed($signed($signed(reg187[(1'h0):(1'h0)])));
        end
      else
        begin
          reg192 <= ({$unsigned((8'hae))} < $signed($unsigned({(reg167 ?
                  (8'hbc) : wire150)})));
          reg193 <= $signed(wire160[(4'h8):(2'h3)]);
          reg194 <= $unsigned((({(reg178 == wire147)} ?
                  $unsigned((|wire151)) : reg174) ?
              ((&wire163) + reg174) : (((8'h9c) ?
                  wire163 : (wire164 ? reg189 : reg186)) + {$signed(reg174),
                  reg187})));
        end
      if (wire158)
        begin
          if ((8'ha7))
            begin
              reg195 <= reg170;
              reg196 <= ((reg188[(3'h5):(1'h0)] ?
                      wire154 : reg166[(4'hd):(4'ha)]) ?
                  reg165 : reg173[(3'h4):(1'h1)]);
              reg197 <= $unsigned($unsigned($unsigned($unsigned($signed((8'hb4))))));
            end
          else
            begin
              reg195 <= $signed(($signed((reg176[(4'hd):(4'ha)] ?
                  wire163 : {reg173})) << reg165));
              reg196 <= $signed((8'h9e));
              reg197 <= (reg184 ?
                  $unsigned($unsigned((wire147[(4'hd):(4'h9)] + reg181[(4'ha):(4'h9)]))) : (^~(+wire157[(2'h3):(2'h2)])));
              reg198 <= $signed(((^{{reg178}, (8'h9d)}) ?
                  {(reg177 >>> $signed((8'ha5))),
                      wire149[(2'h3):(1'h1)]} : (reg192[(5'h10):(4'h9)] ?
                      reg183 : wire147)));
              reg199 <= $signed((&wire161));
            end
          reg200 <= ({reg183[(2'h2):(2'h2)]} <<< $signed((8'hab)));
          reg201 <= ($unsigned($signed(reg175)) > (($unsigned((reg185 << reg184)) ?
              wire162[(2'h3):(1'h1)] : $signed(wire148)) >= (((reg192 ?
                  reg168 : reg176) > wire160) ?
              (~^(!reg183)) : (&(~|(7'h41))))));
        end
      else
        begin
          if ({wire156,
              ($unsigned(({(8'hb5), reg192} ?
                      reg188[(3'h4):(2'h3)] : $signed(wire163))) ?
                  {reg176} : $signed(reg200[(4'ha):(3'h4)]))})
            begin
              reg195 <= $signed((&$signed((reg172[(2'h2):(1'h1)] ^~ reg166[(4'hc):(3'h6)]))));
              reg196 <= ({$unsigned((~&(wire158 ? reg181 : reg171)))} ?
                  (|((~(8'h9f)) == ((~reg169) ?
                      $unsigned((7'h41)) : (^~reg181)))) : wire161);
              reg197 <= reg198;
              reg198 <= (!wire162);
              reg199 <= (($signed(($unsigned(wire161) < reg175[(4'hb):(1'h1)])) ~^ wire149) ?
                  reg165 : reg198);
            end
          else
            begin
              reg195 <= $unsigned($signed(wire148));
              reg196 <= reg175[(4'hd):(1'h1)];
              reg197 <= wire161[(3'h5):(3'h5)];
              reg198 <= $unsigned(($signed(reg188) ?
                  {(reg174[(1'h1):(1'h0)] == (&reg174)),
                      ($signed(reg188) ^~ (reg191 | reg201))} : reg191[(1'h1):(1'h0)]));
            end
        end
    end
  assign wire202 = $signed(reg176);
endmodule

module module107
#(parameter param141 = {{(8'hbb)}, ({(((8'hb9) ? (8'ha8) : (8'hab)) ? (!(8'hb1)) : (~&(8'h9e))), (((8'haf) ^ (8'hb5)) ? ((8'ha5) ? (8'ha3) : (8'hae)) : ((8'hb9) && (8'hb7)))} ? (((|(8'hb6)) <= ((8'ha7) ? (8'h9d) : (8'ha0))) ? (((8'haf) ? (8'hab) : (8'ha9)) ? ((8'hb8) <= (8'ha5)) : ((8'ha9) ? (8'ha3) : (8'h9e))) : (-((8'had) && (8'ha4)))) : (({(8'hb2)} ? ((8'ha3) ? (8'hb5) : (7'h40)) : (~(8'hb9))) ? {{(8'h9e), (8'hb4)}} : (((8'ha4) ? (8'hbd) : (8'hac)) ? (~&(8'ha3)) : ((8'h9f) ? (8'ha0) : (8'hb0)))))})
(y, clk, wire112, wire111, wire110, wire109, wire108);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire112;
  input wire [(4'ha):(1'h0)] wire111;
  input wire [(4'hd):(1'h0)] wire110;
  input wire [(4'hc):(1'h0)] wire109;
  input wire [(5'h11):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire140;
  wire signed [(4'h9):(1'h0)] wire139;
  wire signed [(3'h4):(1'h0)] wire138;
  wire [(4'h8):(1'h0)] wire137;
  wire [(3'h7):(1'h0)] wire136;
  wire signed [(4'h9):(1'h0)] wire123;
  wire signed [(4'hb):(1'h0)] wire122;
  wire signed [(4'hc):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire114;
  wire signed [(4'hb):(1'h0)] wire113;
  reg [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire114,
                 wire113,
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
                 reg125,
                 reg124,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  assign wire113 = $signed(wire111[(4'ha):(3'h7)]);
  assign wire114 = $unsigned((wire113 ? wire112 : $signed(wire109)));
  always
    @(posedge clk) begin
      if ($unsigned((~^$unsigned($unsigned(wire112[(3'h4):(1'h0)])))))
        begin
          reg115 <= wire112[(1'h0):(1'h0)];
          reg116 <= ($signed(((~|$unsigned(wire112)) ?
                  ($signed(wire112) > {(8'h9e)}) : (|$signed(wire109)))) ?
              (7'h41) : $unsigned($signed((~$signed(wire111)))));
          reg117 <= ($signed(wire108) ?
              $signed(wire112[(1'h1):(1'h0)]) : reg115[(3'h5):(3'h4)]);
        end
      else
        begin
          reg115 <= (($unsigned(wire111[(3'h5):(3'h5)]) ?
              (8'haa) : {(~$signed(wire112))}) && wire111[(4'ha):(3'h7)]);
          reg116 <= $unsigned(wire112);
          reg117 <= {(+$signed(wire112[(1'h1):(1'h1)]))};
        end
      reg118 <= wire109;
      reg119 <= $unsigned($unsigned((!$signed($signed(wire112)))));
    end
  assign wire120 = $unsigned($signed((~(~&{wire114}))));
  assign wire121 = wire112;
  assign wire122 = reg116;
  assign wire123 = ((~&$unsigned($signed(((8'hb4) << wire109)))) ?
                       ($signed($unsigned(wire110[(4'h9):(3'h5)])) ?
                           {(wire122 ? (~reg115) : (~^wire122)),
                               {$unsigned(wire111),
                                   {reg118}}} : {(-$unsigned((8'hb4)))}) : $unsigned((+{(-wire109),
                           (wire109 ? reg115 : wire122)})));
  always
    @(posedge clk) begin
      if ($unsigned(reg116[(1'h0):(1'h0)]))
        begin
          if ((({((!wire109) ? $unsigned(reg115) : (~^(8'hbf))), (&wire109)} ?
                  (((-wire113) << $unsigned((8'hb4))) ~^ reg115[(3'h4):(2'h3)]) : (|wire108)) ?
              ((8'hbc) ?
                  $signed(reg116[(4'ha):(3'h7)]) : wire113) : $unsigned(reg116[(4'ha):(4'h9)])))
            begin
              reg124 <= $signed(wire110[(3'h6):(1'h1)]);
            end
          else
            begin
              reg124 <= wire123[(3'h4):(1'h0)];
              reg125 <= {{(~^{wire108[(3'h4):(2'h2)]}),
                      $unsigned({((8'hbd) ? (8'hb2) : (8'haa)),
                          $unsigned(wire108)})},
                  (wire111[(2'h2):(1'h1)] ?
                      (^~(^~(~&wire120))) : (+($unsigned(reg116) ?
                          $signed((8'hb5)) : wire108)))};
              reg126 <= $signed({$signed((8'hb9))});
            end
        end
      else
        begin
          reg124 <= {reg125,
              {(&(((8'h9f) ? wire112 : reg116) ^ (wire112 < wire109))),
                  wire122[(3'h4):(1'h1)]}};
        end
      reg127 <= wire114[(3'h4):(1'h0)];
      if (reg125)
        begin
          if ((((reg115[(1'h1):(1'h1)] ?
                      wire121[(4'h9):(2'h2)] : $signed(reg127)) ?
                  reg126[(4'hc):(4'ha)] : $signed($unsigned($signed(wire111)))) ?
              {((wire120[(4'ha):(4'h9)] & $unsigned(wire109)) - {((8'h9d) >>> wire113)}),
                  ((^~$unsigned(wire113)) ? {reg126} : {wire120})} : (8'hab)))
            begin
              reg128 <= $signed((reg126 ?
                  $signed($unsigned($unsigned(reg126))) : $unsigned({(~wire113)})));
              reg129 <= ($unsigned(reg118) ?
                  (-(|(wire120[(4'hb):(3'h5)] > $unsigned((8'ha6))))) : $signed((reg116[(4'ha):(2'h3)] ?
                      $unsigned((reg127 | wire110)) : ($unsigned(wire123) > (~^reg126)))));
              reg130 <= (reg124[(3'h5):(2'h2)] < reg118);
              reg131 <= reg124;
              reg132 <= reg115;
            end
          else
            begin
              reg128 <= $signed((($signed((reg132 <<< reg128)) ?
                      ((reg130 <<< reg119) ?
                          ((8'hb2) ? reg129 : reg115) : (reg127 ?
                              reg117 : (8'h9c))) : (wire121[(3'h4):(2'h2)] ?
                          wire113 : (7'h41))) ?
                  (reg126[(3'h5):(2'h2)] ?
                      reg117 : (8'ha2)) : reg128[(1'h1):(1'h1)]));
              reg129 <= $unsigned($unsigned($signed(wire120)));
              reg130 <= $unsigned(($unsigned(((wire110 ?
                      reg128 : wire111) || (!(8'hbe)))) ?
                  $unsigned(reg132) : wire108));
            end
          reg133 <= ($signed((((~wire110) << $unsigned(reg131)) ?
              $signed((wire110 ? reg129 : reg125)) : (((8'hbd) >> reg128) ?
                  reg132 : ((8'ha2) ? reg130 : wire111)))) ~^ reg127);
        end
      else
        begin
          reg128 <= $signed(reg130);
          reg129 <= ($unsigned(wire123[(2'h3):(1'h1)]) ?
              $signed($unsigned((-reg132))) : (~&(reg116 <<< (-$unsigned(reg124)))));
          if (reg133)
            begin
              reg130 <= $signed(reg124[(3'h6):(3'h5)]);
              reg131 <= ((($signed((!wire108)) ?
                      $unsigned(wire112) : (((8'hbb) ^~ reg127) ?
                          reg125[(4'hf):(2'h3)] : (-reg118))) || wire122) ?
                  (~(!(|$unsigned(wire113)))) : {$unsigned((wire113 ?
                          (wire121 ?
                              (8'ha9) : reg133) : reg132[(3'h5):(3'h5)]))});
            end
          else
            begin
              reg130 <= (8'ha8);
            end
        end
      reg134 <= {reg117};
      reg135 <= (reg132[(4'hc):(4'h9)] | (~^{(wire111 <<< (7'h43)),
          (~|(reg115 ? wire110 : reg127))}));
    end
  assign wire136 = $signed(reg124[(3'h4):(1'h1)]);
  assign wire137 = (-((~(!wire109)) ?
                       $signed(reg126) : (reg135 << (wire121 ?
                           $unsigned(reg130) : wire113))));
  assign wire138 = reg128[(2'h3):(2'h2)];
  assign wire139 = $unsigned(($signed((8'ha5)) == reg128[(3'h4):(1'h0)]));
  assign wire140 = {$signed((^~wire111)), (~|wire113)};
endmodule

module module66
#(parameter param98 = ((^({((8'hb8) ^~ (7'h44)), ((8'hb2) ? (8'ha9) : (8'hb2))} ? {((7'h44) >>> (8'hae))} : (+{(8'hb2)}))) ? (!(+(((8'hb0) ? (8'h9f) : (7'h42)) <<< (|(8'hb4))))) : (-(~({(8'hbe)} ? ((8'ha6) >> (8'hac)) : ((8'ha9) >>> (8'ha5)))))))
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire71;
  input wire signed [(3'h4):(1'h0)] wire70;
  input wire [(3'h7):(1'h0)] wire69;
  input wire signed [(4'h8):(1'h0)] wire68;
  input wire [(4'hd):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire96;
  wire [(4'hd):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire84;
  wire [(5'h13):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire76,
                 wire73,
                 wire72,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire72 = ($signed(((~&(wire70 ? wire70 : wire68)) ?
                          ($signed((8'hae)) | $signed(wire68)) : ((-wire69) ?
                              $signed(wire71) : {wire70, (8'ha2)}))) ?
                      ($signed(wire68[(3'h5):(3'h4)]) ?
                          wire71 : $signed($unsigned(wire69[(3'h4):(2'h3)]))) : ($unsigned(wire69[(2'h2):(2'h2)]) ~^ wire68));
  assign wire73 = ($signed($unsigned((wire72[(3'h7):(3'h7)] ?
                      (wire68 || wire67) : (!wire72)))) >> wire68[(3'h5):(2'h2)]);
  always
    @(posedge clk) begin
      reg74 <= $unsigned((~|wire72));
      reg75 <= (wire67 ?
          ((wire68 >> wire67) ?
              {(|(wire67 ?
                      wire72 : wire69))} : {(wire72[(4'hd):(2'h2)] & wire68[(3'h4):(3'h4)]),
                  ($signed(wire72) | ((8'h9e) <= wire69))}) : $unsigned($signed(($unsigned(reg74) || {wire72}))));
    end
  assign wire76 = $signed((-(&$unsigned((~^wire73)))));
  always
    @(posedge clk) begin
      reg77 <= (((+{$signed(wire76)}) ~^ (((wire69 ? wire67 : wire70) ?
                  (wire72 ~^ reg75) : (^~wire70)) ?
              (&(~|wire68)) : $unsigned((wire76 ? wire76 : wire67)))) ?
          ($unsigned(wire73[(1'h0):(1'h0)]) || (+$signed(wire73))) : $unsigned($signed((!{wire68}))));
      if (({reg75[(3'h4):(3'h4)], (~|$unsigned({wire76}))} ?
          reg75 : $signed(wire70[(1'h0):(1'h0)])))
        begin
          reg78 <= $unsigned(wire71);
          reg79 <= $unsigned({(7'h43)});
          reg80 <= (($signed({wire69[(3'h7):(3'h4)]}) == (((~^reg78) | (reg78 | reg77)) ?
                  (8'ha9) : wire72[(4'hd):(1'h1)])) ?
              (~^{$signed(reg75)}) : reg77[(2'h2):(1'h1)]);
        end
      else
        begin
          reg78 <= wire73;
        end
      reg81 <= wire70;
    end
  assign wire82 = (-wire70[(2'h2):(1'h1)]);
  assign wire83 = ((~|reg79) * wire73[(3'h4):(3'h4)]);
  assign wire84 = ($signed((~|wire67)) > $unsigned((~$unsigned(reg75[(3'h5):(1'h1)]))));
  assign wire85 = wire70;
  assign wire86 = wire85[(3'h5):(2'h3)];
  assign wire87 = {(reg74[(4'he):(1'h0)] >= (8'hb7)),
                      ((((8'hb8) == (wire67 ?
                          wire70 : (8'hae))) > (wire71 <<< {reg79,
                          reg80})) & $unsigned($signed((+wire82))))};
  assign wire88 = reg79;
  assign wire89 = (-(~(+wire67[(4'ha):(2'h2)])));
  assign wire90 = ($unsigned((~^(reg79[(5'h15):(5'h10)] >>> $signed(reg74)))) >> $signed((((reg74 ?
                          wire86 : reg77) && (wire72 ? wire89 : wire87)) ?
                      $unsigned((7'h44)) : ($unsigned((8'hb4)) & $unsigned(reg77)))));
  assign wire91 = reg75;
  assign wire92 = reg79;
  assign wire93 = ((!(8'hb2)) ?
                      (wire69[(1'h1):(1'h1)] ^~ (~^(wire73[(3'h7):(2'h3)] ?
                          ((8'hb7) ?
                              wire68 : wire82) : (&(8'hb6))))) : $signed($signed((wire85[(1'h0):(1'h0)] ?
                          wire84 : (8'hb8)))));
  assign wire94 = $unsigned($unsigned($unsigned(($unsigned(reg77) > (wire90 <<< wire82)))));
  assign wire95 = (wire84[(3'h4):(2'h2)] ? wire67 : wire92[(3'h4):(3'h4)]);
  assign wire96 = {(^~$signed((wire68[(3'h4):(2'h3)] ?
                          (8'ha0) : $unsigned((8'hbc)))))};
  assign wire97 = (8'hae);
endmodule
