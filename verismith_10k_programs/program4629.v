module top
#(parameter param143 = (-{{(((8'hbc) ? (8'hbf) : (8'ha4)) <= ((8'hac) | (8'ha0))), {(8'ha8), (|(8'hba))}}, (((|(8'hbc)) >>> {(8'hb7), (8'haa)}) ~^ ((+(8'hbb)) ? (~|(8'had)) : ((8'ha9) ? (8'hab) : (8'hbe))))}), 
parameter param144 = {param143, (^~(((param143 ? param143 : param143) | (param143 >> (8'hbd))) >>> ((param143 * (8'hb0)) ? (param143 < param143) : (&param143))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire142;
  wire [(4'h9):(1'h0)] wire141;
  wire signed [(4'hd):(1'h0)] wire140;
  wire signed [(5'h11):(1'h0)] wire139;
  wire [(5'h12):(1'h0)] wire138;
  wire signed [(4'hc):(1'h0)] wire137;
  wire [(4'hd):(1'h0)] wire136;
  wire signed [(2'h2):(1'h0)] wire135;
  wire signed [(5'h11):(1'h0)] wire133;
  wire signed [(5'h11):(1'h0)] wire132;
  wire signed [(5'h14):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire130;
  wire signed [(3'h4):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire83;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(2'h3):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire74;
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire127,
                 wire83,
                 wire77,
                 wire76,
                 wire4,
                 wire74,
                 reg129,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned($signed((!(~|(wire2 ? wire0 : wire1)))));
  always
    @(posedge clk) begin
      reg5 <= $unsigned(((~|wire1) ^~ (^~{wire4, $unsigned(wire1)})));
      reg6 <= {{(8'hb4)},
          ((wire1[(1'h0):(1'h0)] == reg5[(4'h8):(3'h5)]) && (~&$signed((wire3 || wire2))))};
      reg7 <= wire4[(4'h8):(2'h2)];
      reg8 <= ($signed($signed({wire2[(2'h3):(2'h3)]})) ?
          (({wire3[(4'h9):(2'h2)], wire1[(4'hc):(2'h2)]} ~^ reg5) ?
              wire3 : (|(!((7'h43) - reg7)))) : (&wire1));
    end
  module9 #() modinst75 (wire74, clk, wire2, wire0, reg7, wire3, reg6);
  assign wire76 = $signed((~|$signed(reg8[(1'h1):(1'h1)])));
  assign wire77 = {(^wire4)};
  always
    @(posedge clk) begin
      reg78 <= wire74;
      reg79 <= ((~&wire2) << wire74[(4'ha):(3'h4)]);
      reg80 <= ($unsigned($signed(((wire1 == wire4) ? wire4 : wire0))) ?
          reg6[(3'h5):(1'h0)] : $unsigned($unsigned((wire77[(3'h5):(1'h1)] == reg78))));
      reg81 <= (($signed($signed(reg5[(2'h3):(2'h3)])) << wire4[(4'hb):(3'h5)]) >> wire74);
      reg82 <= $signed(wire2[(2'h3):(1'h1)]);
    end
  assign wire83 = wire3[(5'h10):(4'ha)];
  module84 #() modinst128 (.wire85(reg82), .clk(clk), .y(wire127), .wire88(reg78), .wire87(reg81), .wire86(reg6));
  always
    @(posedge clk) begin
      reg129 <= $unsigned({reg80});
    end
  assign wire130 = {$signed(reg81), reg79[(4'h8):(1'h1)]};
  assign wire131 = {$signed(wire127[(2'h2):(1'h0)]), (^wire83)};
  assign wire132 = {$unsigned((($signed(reg79) <= ((7'h40) ?
                           (7'h41) : reg5)) * reg6)),
                       (((reg82[(1'h1):(1'h0)] ^~ wire74[(3'h6):(3'h6)]) ~^ $signed($unsigned((8'hb6)))) * ($unsigned(((8'hb5) ?
                           wire131 : reg78)) != {wire0[(4'hd):(4'hb)]}))};
  module16 #() modinst134 (wire133, clk, wire131, reg81, reg129, wire83);
  assign wire135 = $signed((wire0 >> $unsigned(reg80[(5'h12):(1'h1)])));
  assign wire136 = $unsigned($unsigned((|reg8[(2'h2):(1'h0)])));
  assign wire137 = $signed({$signed($unsigned(wire0))});
  assign wire138 = (((((~&wire3) + $signed(wire77)) || ((wire3 & reg5) ?
                               $unsigned(wire127) : $unsigned(wire135))) ?
                           wire1[(1'h1):(1'h0)] : $unsigned(($signed(wire76) ?
                               (^wire77) : (&wire4)))) ?
                       reg129 : (!wire1[(5'h10):(4'he)]));
  assign wire139 = $unsigned((wire1[(4'h9):(3'h7)] ?
                       $signed($signed((~|(8'hbc)))) : wire136[(4'hb):(2'h3)]));
  assign wire140 = $unsigned((({$signed((7'h41))} < ((wire136 ?
                           reg82 : wire83) ?
                       wire4 : (wire139 ?
                           wire0 : wire4))) ^~ ((!(wire132 ^~ wire74)) != ($signed(reg82) ?
                       {(8'hb7), reg129} : ((8'hb4) & wire127)))));
  assign wire141 = reg78;
  assign wire142 = {(+((wire3[(5'h11):(4'h9)] ?
                           reg80[(5'h10):(3'h4)] : $signed(wire139)) < (reg129[(1'h1):(1'h0)] ?
                           $unsigned(wire2) : {wire132})))};
endmodule

module module84
#(parameter param125 = ((&(((&(8'hb5)) == ((8'hb9) << (8'haf))) <<< (!{(8'ha6), (8'ha5)}))) + {(({(8'hb5), (8'hbc)} ^ ((8'hbe) | (7'h41))) <= (((8'ha6) ? (8'hb8) : (7'h41)) == ((8'h9d) ? (8'hb9) : (7'h42)))), ((((8'ha5) ? (8'hbd) : (8'hbf)) ? ((8'hbf) ? (8'haf) : (7'h41)) : (^(8'ha6))) && ((~^(8'hb6)) ? (^~(7'h44)) : ((8'ha2) == (8'hbf))))}), 
parameter param126 = ((&(param125 ? param125 : ((param125 | param125) ? {param125} : (param125 <<< param125)))) ? param125 : ((({param125, param125} ? param125 : (^~param125)) ? param125 : param125) ? (^(8'hb5)) : (^param125))))
(y, clk, wire85, wire86, wire87, wire88);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire85;
  input wire signed [(5'h13):(1'h0)] wire86;
  input wire signed [(4'ha):(1'h0)] wire87;
  input wire [(5'h15):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire123;
  wire signed [(4'hd):(1'h0)] wire89;
  wire signed [(5'h15):(1'h0)] wire90;
  wire signed [(4'hc):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire94;
  wire signed [(4'h8):(1'h0)] wire121;
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire89,
                 wire90,
                 wire91,
                 wire92,
                 wire94,
                 wire121,
                 reg93,
                 (1'h0)};
  assign wire89 = $signed(((wire85[(4'h9):(3'h4)] >> {wire87,
                      {(8'h9d), wire88}}) == wire87[(3'h7):(1'h1)]));
  assign wire90 = wire87[(1'h0):(1'h0)];
  assign wire91 = wire90;
  assign wire92 = wire91[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg93 <= (~&$signed({(-{wire87}), (~|wire91)}));
    end
  assign wire94 = (~^$signed(((!{reg93}) ?
                      {wire85, wire88} : (wire88 ?
                          wire92[(1'h0):(1'h0)] : (!wire85)))));
  module95 #() modinst122 (.y(wire121), .wire98(wire94), .wire97(wire91), .wire99(reg93), .wire96(wire90), .clk(clk));
  assign wire123 = (~^wire89[(2'h3):(2'h2)]);
  assign wire124 = $signed((wire86[(5'h10):(4'h8)] != ((wire94 ?
                           (8'hbd) : (~|wire89)) ?
                       $unsigned(wire90[(5'h11):(1'h1)]) : (wire89 ?
                           {wire121, wire85} : (wire87 == wire92)))));
endmodule

module module9
#(parameter param72 = {(&((((8'ha7) ? (8'hbd) : (8'hb9)) ^ ((8'hb0) ? (8'h9e) : (8'hac))) >>> {((8'h9d) != (8'hbb)), ((8'ha4) != (8'hb2))}))}, 
parameter param73 = param72)
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire14;
  input wire [(5'h11):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire15;
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire67,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire15,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire15 = wire10;
  module16 #() modinst49 (.wire19(wire12), .y(wire48), .wire17(wire11), .wire20(wire13), .clk(clk), .wire18(wire10));
  assign wire50 = wire11;
  assign wire51 = wire10[(4'he):(1'h0)];
  assign wire52 = ((!$signed((8'ha4))) ?
                      ($unsigned({wire50}) ~^ (-((8'hb3) ?
                          wire48 : $signed(wire15)))) : $unsigned((^(wire51 <= wire12))));
  assign wire53 = ((+((^wire14[(3'h4):(2'h3)]) | wire14)) ^ (($signed((wire50 + wire15)) ^~ (wire15 + $unsigned(wire13))) ?
                      wire48 : $unsigned((8'ha1))));
  assign wire54 = wire10;
  always
    @(posedge clk) begin
      reg55 <= $unsigned((-wire10));
      reg56 <= $unsigned(($signed({$unsigned(wire10),
          wire13}) <= (wire48[(3'h5):(3'h5)] | wire13)));
    end
  module57 #() modinst68 (.wire59(wire53), .y(wire67), .wire60(wire12), .clk(clk), .wire58(wire50), .wire61(wire15));
  assign wire69 = wire54[(3'h4):(1'h0)];
  assign wire70 = wire69;
  assign wire71 = $signed((~&wire69[(3'h5):(3'h5)]));
endmodule

module module57
#(parameter param66 = ((^{(((8'ha9) ? (7'h43) : (8'h9f)) ^~ ((7'h43) && (8'ha6)))}) ? {((~^((8'ha3) && (8'hb8))) ? {(~|(8'had))} : (~^((8'ha1) ^~ (8'ha8)))), ((8'h9c) ? {{(8'h9d), (8'hb8)}} : (((8'h9f) ~^ (8'hbd)) ? ((8'hb6) >>> (8'h9f)) : (~|(8'ha6))))} : (~|((((8'hac) ? (8'ha0) : (8'h9d)) <= (8'hb0)) ~^ (~&((8'ha9) && (8'ha1)))))))
(y, clk, wire61, wire60, wire59, wire58);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire61;
  input wire [(3'h5):(1'h0)] wire60;
  input wire [(4'h8):(1'h0)] wire59;
  input wire [(5'h11):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  assign y = {wire65, wire64, wire63, wire62, (1'h0)};
  assign wire62 = {($unsigned((~|(wire60 ? wire58 : wire58))) ?
                          ((~$unsigned(wire59)) ~^ ($unsigned(wire61) == wire58[(4'h9):(4'h8)])) : $signed($unsigned(wire58[(4'hd):(2'h2)])))};
  assign wire63 = ((~^(&$signed((wire59 ? wire61 : wire62)))) ?
                      wire62[(3'h5):(1'h1)] : $unsigned((($unsigned(wire61) ?
                          $signed(wire62) : $signed(wire62)) <= $unsigned(((7'h43) ^ (8'ha9))))));
  assign wire64 = wire60[(2'h2):(1'h1)];
  assign wire65 = {$unsigned(wire60), wire62[(4'hb):(4'h9)]};
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire [(4'hc):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire21;
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire21,
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
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire21 = wire20[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if (wire19)
        begin
          reg22 <= wire18;
          reg23 <= wire18[(5'h10):(3'h7)];
          if ((((wire18[(4'he):(4'h8)] ?
                  wire18 : ((wire19 + (7'h42)) ?
                      ((8'hbf) << wire19) : (reg22 << wire18))) ?
              (~$unsigned(reg22)) : ($unsigned($signed(reg23)) <= $unsigned((wire18 != reg23)))) <<< wire17[(4'h8):(3'h6)]))
            begin
              reg24 <= reg22;
            end
          else
            begin
              reg24 <= (wire19 ?
                  (|(wire21 ?
                      $unsigned(reg22[(1'h1):(1'h0)]) : $unsigned(reg22))) : $signed(($unsigned((~&wire17)) ~^ $unsigned(reg22))));
              reg25 <= $signed($signed($signed((reg23 <= (wire19 << wire21)))));
            end
        end
      else
        begin
          reg22 <= (~(-($signed((&(8'had))) ?
              (~|(reg23 ? wire20 : reg22)) : (+(^~wire18)))));
          if (wire19)
            begin
              reg23 <= (8'hb4);
              reg24 <= wire17[(2'h2):(2'h2)];
              reg25 <= $unsigned((~&(^((8'ha6) ? wire18 : {wire20}))));
              reg26 <= ($unsigned(wire17) ?
                  ($unsigned(($signed(wire21) ?
                      $unsigned(wire21) : {reg24})) | reg22) : ({(reg24 >> (!wire18)),
                      {$signed(reg23)}} != wire17[(1'h1):(1'h1)]));
            end
          else
            begin
              reg23 <= reg26[(4'h8):(4'h8)];
              reg24 <= wire19;
              reg25 <= $unsigned(wire17);
            end
          reg27 <= (&wire18);
          if ((~|{$signed(reg23)}))
            begin
              reg28 <= $unsigned($signed((^~$unsigned((reg25 && wire19)))));
              reg29 <= reg26[(4'ha):(1'h0)];
              reg30 <= (^~(($unsigned(reg23) | wire18) <= ((reg25 ?
                  {wire19,
                      (8'hb1)} : (+(8'ha6))) == $unsigned($unsigned(reg24)))));
              reg31 <= reg27;
              reg32 <= wire19;
            end
          else
            begin
              reg28 <= $unsigned($signed((((reg22 - (8'ha1)) - $signed(reg29)) * $unsigned(wire18))));
              reg29 <= (^~wire20[(4'h9):(3'h7)]);
              reg30 <= (reg32 >= $unsigned(((reg30[(1'h1):(1'h0)] >= (8'hbd)) ?
                  $signed(reg25) : (-$unsigned(reg32)))));
              reg31 <= wire21[(2'h2):(2'h2)];
              reg32 <= $unsigned($unsigned((($signed(wire18) != ((8'hb8) < reg30)) << $unsigned((^~reg32)))));
            end
          reg33 <= $signed((~$signed((reg22 ?
              (reg25 ? reg22 : reg23) : reg28[(2'h2):(1'h0)]))));
        end
      if ($unsigned(wire18))
        begin
          if (reg23)
            begin
              reg34 <= $signed((reg27 ?
                  ((!$unsigned(wire18)) ?
                      reg25 : ((reg26 < reg32) & wire21)) : $unsigned({(~|reg24)})));
              reg35 <= $signed((wire21 ?
                  (wire20 ?
                      (wire19[(3'h4):(1'h1)] || reg26[(2'h2):(1'h1)]) : $signed(reg22[(3'h4):(2'h2)])) : ($signed($unsigned(reg29)) ?
                      $signed((^reg30)) : ((reg23 != reg31) > (reg31 >>> (8'hb9))))));
              reg36 <= $signed((8'ha9));
              reg37 <= (+wire18);
              reg38 <= ($signed((reg30[(2'h3):(1'h1)] ?
                      ((wire20 ~^ reg32) ?
                          (reg22 ?
                              reg33 : (8'h9e)) : ((8'ha6) == reg35)) : $unsigned((&reg23)))) ?
                  reg28 : {reg24, (!wire19[(4'hc):(4'h9)])});
            end
          else
            begin
              reg34 <= {(reg25[(2'h3):(2'h2)] ?
                      (reg22 ?
                          ($unsigned(reg31) ?
                              $signed(wire21) : (~^(8'hb1))) : $unsigned((-wire20))) : $signed((+reg24[(2'h2):(2'h2)]))),
                  {($unsigned($unsigned(reg27)) << $unsigned((+reg38)))}};
            end
          reg39 <= $unsigned((^~reg38));
          reg40 <= reg26;
          reg41 <= $unsigned({reg30});
        end
      else
        begin
          if (reg24)
            begin
              reg34 <= $unsigned((reg24 ?
                  $signed({reg24,
                      (reg28 ? reg22 : reg23)}) : reg39[(2'h2):(1'h0)]));
              reg35 <= ($signed({{$unsigned(reg31), $signed(reg39)}}) ?
                  $unsigned($signed((!(wire19 ?
                      reg32 : (8'ha6))))) : {$unsigned($signed(((8'hbf) ?
                          reg37 : reg35)))});
              reg36 <= ((&wire19) || (reg35[(2'h3):(1'h0)] > reg24[(2'h2):(1'h0)]));
            end
          else
            begin
              reg34 <= reg30;
              reg35 <= $signed(($unsigned($unsigned($unsigned(reg41))) - {$signed(((8'hbb) ?
                      reg28 : reg35))}));
              reg36 <= ((reg33 >= (~&(^reg36[(4'hf):(4'hb)]))) ?
                  reg33 : $unsigned($signed((wire20 >= $unsigned(reg31)))));
              reg37 <= (&$unsigned(reg22));
            end
          reg38 <= {wire17[(4'h9):(3'h6)], reg31};
          reg39 <= $unsigned($unsigned(($signed(reg35) ?
              ((reg36 == reg36) * reg26[(3'h5):(3'h4)]) : reg36[(4'h9):(3'h6)])));
          if (reg39[(2'h3):(2'h3)])
            begin
              reg40 <= $signed(reg38);
              reg41 <= (~|(~reg35));
              reg42 <= $signed($signed((~|$unsigned(reg37))));
            end
          else
            begin
              reg40 <= ((~reg28) ~^ ($unsigned(reg26[(4'h8):(2'h2)]) ?
                  (8'hbb) : ($signed(reg31[(4'h8):(3'h5)]) ?
                      reg41[(4'h8):(4'h8)] : (^{reg31}))));
              reg41 <= (($unsigned(reg36) * (wire20 ?
                  {(|(8'hb3)), ((8'hb5) >= reg38)} : reg33)) ^~ (((reg24 ?
                  (7'h44) : wire20[(2'h2):(2'h2)]) <<< ({(7'h41)} ?
                  {reg26, wire20} : (reg37 ?
                      wire20 : reg40))) < $signed(reg31[(4'h9):(4'h8)])));
            end
          reg43 <= ((~|(((reg32 <<< reg38) > $unsigned(reg42)) ?
                  (^~$unsigned(reg39)) : {$unsigned(reg37)})) ?
              reg40 : (~&$signed((((7'h43) ?
                  (7'h43) : reg28) < $signed(reg28)))));
        end
      reg44 <= (|(!({(reg38 ? reg24 : reg42)} < reg36[(2'h3):(1'h1)])));
      reg45 <= ((~{({reg39} ? $unsigned(wire18) : $unsigned(reg42)),
              $unsigned(wire21)}) ?
          reg39[(1'h1):(1'h0)] : reg31);
    end
  assign wire46 = $unsigned(reg44[(2'h2):(1'h0)]);
  assign wire47 = (reg29 <= {reg22});
endmodule

module module95  (y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire99;
  input wire [(4'h9):(1'h0)] wire98;
  input wire signed [(4'hc):(1'h0)] wire97;
  input wire signed [(5'h15):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire120;
  wire signed [(3'h4):(1'h0)] wire119;
  wire [(5'h15):(1'h0)] wire118;
  wire signed [(3'h4):(1'h0)] wire117;
  wire signed [(4'hc):(1'h0)] wire116;
  wire [(2'h3):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire114;
  reg signed [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(4'hd):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(2'h3):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg100 <= (~$signed(($signed($signed((8'h9d))) ?
          $signed((wire99 ? wire96 : wire98)) : wire98)));
      reg101 <= ($signed((wire97 | $unsigned($signed((8'hbb))))) ?
          $signed((8'ha7)) : reg100);
      if ($signed((^~$signed($unsigned($signed(wire96))))))
        begin
          reg102 <= $unsigned($signed(reg100));
          if ($unsigned(reg102))
            begin
              reg103 <= $unsigned((8'haa));
              reg104 <= (+((^~(reg102[(4'hd):(3'h7)] * {reg101})) >> (reg103 ~^ reg102)));
            end
          else
            begin
              reg103 <= $signed(wire96);
              reg104 <= ((~^$unsigned((reg103 < (!reg101)))) ?
                  {reg102[(2'h3):(2'h3)],
                      $unsigned($signed($signed(reg103)))} : wire96);
              reg105 <= {{(7'h40), (~&(^$signed(reg103)))}};
              reg106 <= reg101;
              reg107 <= $unsigned($unsigned({$unsigned((wire96 ?
                      reg106 : reg104))}));
            end
          reg108 <= $unsigned($unsigned(reg107[(4'hc):(2'h2)]));
          reg109 <= {reg101[(2'h3):(2'h3)]};
          if ($unsigned(wire96[(4'hb):(4'ha)]))
            begin
              reg110 <= ((+{$unsigned(reg105[(1'h1):(1'h0)])}) < wire97[(3'h4):(1'h0)]);
              reg111 <= $unsigned(((!reg103) ?
                  $unsigned($unsigned({wire96,
                      reg107})) : $signed($unsigned((reg102 <= reg103)))));
            end
          else
            begin
              reg110 <= (^~($signed(reg100[(2'h2):(1'h0)]) ?
                  wire97[(3'h5):(2'h2)] : (reg110 ^ ((wire96 ?
                          reg106 : wire97) ?
                      $signed((8'hab)) : $signed(reg103)))));
              reg111 <= (reg107[(3'h6):(2'h2)] ?
                  ({$signed((wire96 ?
                          reg100 : reg108))} * ($signed((wire97 > reg101)) * ((8'h9e) > ((8'hbf) ?
                      wire98 : reg109)))) : reg110[(3'h6):(1'h0)]);
              reg112 <= reg106;
              reg113 <= reg100;
            end
        end
      else
        begin
          reg102 <= (~^reg105);
          if (wire96)
            begin
              reg103 <= (wire96 ? (reg103 < reg110) : reg108[(5'h12):(4'ha)]);
              reg104 <= ((8'hb2) ?
                  ($unsigned({$signed(reg106)}) > reg105) : wire98);
              reg105 <= wire97;
            end
          else
            begin
              reg103 <= $signed($unsigned((reg112[(3'h4):(3'h4)] ?
                  (8'hbf) : $signed((8'ha3)))));
              reg104 <= reg101[(2'h2):(1'h0)];
              reg105 <= wire98[(2'h2):(1'h0)];
            end
        end
    end
  assign wire114 = reg103[(5'h11):(3'h5)];
  assign wire115 = (reg107[(5'h11):(5'h10)] < (8'hb9));
  assign wire116 = reg103[(3'h4):(3'h4)];
  assign wire117 = wire96[(4'hf):(3'h7)];
  assign wire118 = ($signed((~&$unsigned($unsigned(wire97)))) * reg110[(1'h1):(1'h0)]);
  assign wire119 = $unsigned($unsigned({$unsigned(wire118[(3'h6):(2'h3)])}));
  assign wire120 = (reg111[(4'h9):(2'h2)] ? wire96 : wire114);
endmodule
