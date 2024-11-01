module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire211;
  wire signed [(5'h11):(1'h0)] wire210;
  wire [(4'h9):(1'h0)] wire209;
  wire signed [(4'hb):(1'h0)] wire208;
  wire signed [(5'h14):(1'h0)] wire201;
  wire signed [(5'h14):(1'h0)] wire197;
  wire signed [(5'h10):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire199;
  reg signed [(3'h4):(1'h0)] reg207 = (1'h0);
  reg [(3'h5):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg203 = (1'h0);
  reg [(2'h3):(1'h0)] reg202 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire201,
                 wire197,
                 wire4,
                 wire199,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (+(~^wire0[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire3)
        begin
          if ({wire0, $signed($unsigned($unsigned(wire3)))})
            begin
              reg5 <= {wire4[(4'he):(4'h9)]};
              reg6 <= wire2[(4'hf):(4'hd)];
              reg7 <= $unsigned($signed(reg5[(2'h2):(1'h1)]));
              reg8 <= ($signed(({(wire3 ? reg7 : (8'ha3)), $signed(reg7)} ?
                  reg7 : (^$unsigned(reg6)))) && $signed(reg5));
              reg9 <= wire3;
            end
          else
            begin
              reg5 <= $signed((+$unsigned($unsigned(wire3))));
              reg6 <= (-(&$unsigned(wire3[(2'h3):(1'h0)])));
            end
          reg10 <= (^~($unsigned({$unsigned(wire1),
              (wire3 ~^ (8'hab))}) + $signed(((-wire1) & ((8'had) ?
              wire4 : reg6)))));
          if ($signed(wire4[(5'h10):(3'h4)]))
            begin
              reg11 <= wire2[(4'ha):(4'h9)];
              reg12 <= $unsigned(wire1[(3'h5):(2'h2)]);
              reg13 <= ($unsigned($unsigned((8'hb6))) ?
                  $signed((~($unsigned(wire0) ?
                      $signed(wire3) : $signed(wire4)))) : $signed((wire4[(2'h2):(1'h1)] >= $signed({reg6}))));
              reg14 <= (wire1[(4'ha):(4'ha)] ?
                  ((!$signed((~&reg12))) ? reg8 : wire2) : reg7[(4'ha):(1'h1)]);
            end
          else
            begin
              reg11 <= {$signed($unsigned(({reg7} | wire3)))};
            end
        end
      else
        begin
          reg5 <= $signed(wire4);
          if (reg12)
            begin
              reg6 <= (~&({(^~(7'h40)), reg14[(3'h7):(2'h3)]} ?
                  reg9 : (-(wire3 ?
                      (reg5 ^~ wire0) : (reg11 ? wire0 : wire2)))));
            end
          else
            begin
              reg6 <= reg6[(3'h6):(1'h1)];
              reg7 <= ((~&(+$unsigned(wire1[(2'h2):(1'h0)]))) ?
                  $unsigned(((reg8[(4'hb):(3'h4)] <= $signed(reg5)) ?
                      ((|(8'hac)) ?
                          (^reg12) : $unsigned(reg13)) : wire1[(4'hc):(4'ha)])) : $signed(reg12));
              reg8 <= $signed(reg7);
            end
          reg9 <= reg10[(3'h5):(2'h2)];
          reg10 <= $unsigned((&({(|reg11), (reg5 == wire2)} ?
              wire0 : reg7[(1'h0):(1'h0)])));
          reg11 <= $signed((reg5 + wire0[(1'h0):(1'h0)]));
        end
    end
  module15 #() modinst198 (.wire17(reg6), .wire18(wire2), .wire19(reg8), .clk(clk), .wire16(wire1), .y(wire197), .wire20(wire3));
  module15 #() modinst200 (wire199, clk, reg8, reg14, wire197, reg13, reg5);
  assign wire201 = $signed({$unsigned($signed(reg13))});
  always
    @(posedge clk) begin
      reg202 <= wire1;
      reg203 <= {wire199};
      reg204 <= reg6;
      reg205 <= (8'hb4);
    end
  always
    @(posedge clk) begin
      reg206 <= reg202;
      reg207 <= ($signed(($unsigned(wire199) ?
          reg9[(3'h4):(2'h3)] : reg7[(1'h1):(1'h0)])) | reg12);
    end
  assign wire208 = (~&((($signed(reg13) <= reg9) * $signed($signed(wire3))) ?
                       ($signed((reg5 < (8'ha2))) >>> reg6) : $unsigned($signed($signed(wire3)))));
  assign wire209 = $unsigned(wire4);
  assign wire210 = {$signed(reg13)};
  assign wire211 = (($signed($unsigned((wire209 >= reg204))) << reg203) ~^ wire199);
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire20;
  input wire [(3'h6):(1'h0)] wire19;
  input wire [(5'h11):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire17;
  input wire [(4'hb):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire126;
  wire signed [(4'hd):(1'h0)] wire148;
  wire signed [(2'h2):(1'h0)] wire195;
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(2'h2):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(5'h15):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  reg [(5'h14):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(5'h11):(1'h0)] reg146 = (1'h0);
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  assign y = {wire124,
                 wire47,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire87,
                 wire126,
                 wire148,
                 wire195,
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
                 reg145,
                 reg146,
                 reg147,
                 (1'h0)};
  assign wire21 = wire16;
  assign wire22 = ($signed(wire19[(1'h0):(1'h0)]) ?
                      ($signed((^((8'hb5) ? wire21 : wire18))) ?
                          $unsigned($signed((wire18 && (8'hb6)))) : $signed($signed((~|wire21)))) : $unsigned($unsigned($signed($unsigned(wire18)))));
  assign wire23 = ($unsigned((&wire20[(3'h7):(3'h5)])) >>> $signed(((&{wire19,
                      wire20}) >> ({wire18} << wire22))));
  assign wire24 = (~^$signed(($unsigned(wire22) ?
                      {wire19[(2'h3):(2'h2)],
                          ((8'h9d) ?
                              wire22 : (8'hba))} : $unsigned($unsigned(wire23)))));
  assign wire25 = (7'h43);
  module26 #() modinst48 (.y(wire47), .wire31(wire16), .clk(clk), .wire28(wire21), .wire29(wire17), .wire27(wire23), .wire30(wire25));
  assign wire49 = (8'hb3);
  assign wire50 = $unsigned($unsigned(wire22[(1'h0):(1'h0)]));
  assign wire51 = $unsigned(({(|wire18[(3'h4):(2'h2)])} ?
                      wire20 : wire20[(4'hd):(2'h3)]));
  assign wire52 = $signed({(^~(~&(wire51 && wire50))),
                      $unsigned((^$unsigned(wire23)))});
  assign wire53 = ((~&$unsigned(wire20[(2'h2):(2'h2)])) ?
                      wire51 : $unsigned($unsigned(wire51)));
  assign wire54 = ($signed((((~wire19) ?
                          wire47[(3'h7):(1'h1)] : $signed(wire21)) ^~ ($signed(wire52) ?
                          (+(8'hb1)) : wire52))) ?
                      (&$signed((~wire22))) : wire49);
  assign wire55 = (~|(8'ha3));
  assign wire56 = $signed(((((wire49 >> (8'hbd)) + $signed(wire17)) * wire25[(4'he):(4'hb)]) ?
                      ((^~wire51) ?
                          {wire53[(1'h0):(1'h0)]} : (~|$unsigned(wire49))) : (((wire24 || wire53) || (wire25 >>> wire51)) ?
                          ((8'hb3) ? $signed(wire24) : {wire23}) : wire24)));
  assign wire57 = ($signed(((^wire21) >= ($signed(wire17) || wire17))) ?
                      (~^$signed(wire56[(2'h3):(2'h2)])) : ($unsigned((8'hb3)) << $unsigned($unsigned($unsigned(wire56)))));
  module58 #() modinst88 (wire87, clk, wire18, wire55, wire49, wire23, wire25);
  module89 #() modinst125 (wire124, clk, wire24, wire54, wire25, wire47, wire21);
  assign wire126 = wire20;
  always
    @(posedge clk) begin
      if ($signed(wire55))
        begin
          reg127 <= (($signed($unsigned($unsigned(wire54))) >> $unsigned($unsigned((wire25 ?
              wire53 : wire47)))) >= wire19);
          reg128 <= (((((reg127 ? wire53 : wire87) ?
              (8'hb2) : (wire55 ?
                  wire53 : wire25)) || $signed((&wire20))) && wire54) < wire49);
        end
      else
        begin
          if (wire23)
            begin
              reg127 <= wire54[(4'ha):(3'h5)];
              reg128 <= (reg127[(3'h5):(1'h1)] ?
                  ((((wire57 ? reg128 : (8'hb3)) * (~&wire25)) ?
                      ($signed((7'h44)) >> (wire52 ^ wire55)) : wire24[(1'h1):(1'h1)]) >> (((^wire17) ?
                          wire21 : (~^wire50)) ?
                      $unsigned({wire53}) : $signed((wire20 ?
                          wire21 : (8'hb8))))) : $signed($unsigned($unsigned(wire17))));
            end
          else
            begin
              reg127 <= {{((8'hb6) ~^ ((wire55 || wire50) & (~|wire18))),
                      wire126[(4'h8):(3'h4)]},
                  reg127[(2'h3):(2'h2)]};
              reg128 <= wire126[(4'hb):(4'hb)];
              reg129 <= $unsigned(({(~&(wire47 && wire24)),
                  ((+wire55) - wire47[(3'h5):(2'h3)])} - wire54[(3'h5):(1'h0)]));
              reg130 <= {((wire53 * ((wire53 ? (8'hbc) : wire25) ?
                          (wire87 < wire51) : (wire23 ? wire53 : wire56))) ?
                      ($unsigned({wire16}) & wire54) : ($unsigned(wire50[(2'h2):(1'h1)]) || $signed({wire23,
                          (8'hb2)}))),
                  ($unsigned($unsigned($unsigned(wire22))) <= (wire25 && wire18))};
              reg131 <= wire47;
            end
          reg132 <= reg128[(1'h0):(1'h0)];
          reg133 <= (^~($signed((~(&wire51))) ?
              (wire19[(2'h2):(1'h1)] ?
                  wire18[(3'h4):(2'h3)] : ((~&wire49) ?
                      (wire50 <<< wire53) : {wire22})) : (^($unsigned(reg127) >>> {(8'ha1)}))));
          reg134 <= {(-($signed(wire22) ?
                  (^~(wire51 ? (7'h43) : wire53)) : ((wire53 ?
                          (8'hbb) : reg131) ?
                      $unsigned((8'haf)) : (~|reg128))))};
          if ($signed(wire25))
            begin
              reg135 <= ((wire50[(3'h7):(1'h1)] > (-$signed((+(7'h42))))) ?
                  (|reg130) : ($unsigned((8'hb5)) << reg128));
              reg136 <= $unsigned(wire55);
              reg137 <= wire52;
              reg138 <= ((!$unsigned($unsigned((wire21 ?
                  reg128 : (8'hbd))))) & (^reg128));
            end
          else
            begin
              reg135 <= reg129[(5'h12):(1'h1)];
            end
        end
      reg139 <= (~^$signed((($unsigned(wire49) >= ((8'ha7) ?
              (8'h9e) : wire21)) ?
          (-$unsigned(wire126)) : $signed((wire24 * wire17)))));
      reg140 <= reg129[(4'h9):(3'h7)];
      if ((-$unsigned((^~(wire21 ? wire47[(4'h8):(3'h4)] : $signed(wire20))))))
        begin
          reg141 <= wire22[(3'h5):(3'h4)];
          reg142 <= (~(($unsigned(reg128[(1'h0):(1'h0)]) == {$signed(wire16),
              (reg137 ? reg138 : wire24)}) != {$unsigned((reg136 ?
                  wire53 : reg140)),
              $signed((reg139 & wire21))}));
          if (((reg136 <= $signed({(^reg134)})) ?
              ((~(8'hb4)) <<< $unsigned($signed(reg129))) : (-wire124[(4'hc):(1'h0)])))
            begin
              reg143 <= (8'hb5);
              reg144 <= (~|$signed({reg130,
                  $signed((wire53 ? wire16 : (8'hab)))}));
              reg145 <= ((~{$unsigned(wire57[(4'h9):(4'h8)])}) != $signed(reg130));
            end
          else
            begin
              reg143 <= ($unsigned((&reg137)) + $unsigned(reg133[(3'h6):(3'h6)]));
              reg144 <= $signed($signed(((wire50 ?
                  (8'hb2) : wire16[(4'h8):(3'h6)]) < $signed((wire19 + wire87)))));
              reg145 <= (wire53[(2'h3):(2'h3)] >> reg141[(5'h11):(4'hd)]);
            end
          reg146 <= $unsigned((~^$unsigned($signed((reg141 ?
              (8'hac) : reg138)))));
          reg147 <= $signed(reg131);
        end
      else
        begin
          reg141 <= {($signed((~^{wire20})) << {reg133})};
          if (wire51[(1'h1):(1'h1)])
            begin
              reg142 <= reg134[(1'h1):(1'h0)];
              reg143 <= reg147[(3'h5):(2'h3)];
              reg144 <= ((-((8'hb5) ?
                      (reg129[(3'h4):(2'h2)] ?
                          (reg136 && (8'h9f)) : reg127[(2'h3):(2'h2)]) : ((wire51 ^ wire47) ?
                          (8'ha4) : (8'hae)))) ?
                  reg147 : (!{(wire53[(2'h2):(2'h2)] ?
                          $signed(wire18) : (8'hb7)),
                      $unsigned((wire21 | wire56))}));
              reg145 <= $unsigned(((!(wire54[(4'hb):(2'h2)] ^ wire22)) ?
                  wire126[(3'h5):(2'h3)] : {({wire25} ?
                          (wire87 <<< wire56) : wire124[(3'h7):(3'h4)])}));
              reg146 <= reg140[(1'h1):(1'h0)];
            end
          else
            begin
              reg142 <= wire23[(4'hd):(2'h3)];
              reg143 <= (reg140[(4'hb):(2'h3)] ?
                  (reg131[(1'h0):(1'h0)] >= reg137[(2'h3):(1'h0)]) : $signed((({wire53,
                      wire51} || (8'haf)) + ($signed((8'hb3)) ?
                      (wire17 == wire17) : (reg128 && wire87)))));
              reg144 <= ($unsigned(((~^wire50[(3'h7):(3'h6)]) ?
                  $signed((-wire24)) : ((reg128 - reg141) ?
                      (7'h44) : reg132[(1'h1):(1'h0)]))) | $unsigned({wire25}));
              reg145 <= (wire19[(2'h3):(2'h2)] >> $unsigned(wire19));
              reg146 <= $unsigned((wire25[(4'hc):(4'hc)] ? wire23 : (!wire57)));
            end
        end
    end
  assign wire148 = (({$signed((~(8'ha1))), (^~(~&reg132))} ?
                           ($signed(((8'had) ? reg128 : wire56)) | ((8'had) ?
                               ((8'hb0) >= reg135) : $signed(reg140))) : wire124[(4'hd):(1'h1)]) ?
                       (^~$signed((+reg142))) : ((~&{wire51,
                           (reg134 ? reg129 : wire16)}) << $unsigned(wire23)));
  module149 #() modinst196 (.wire151(reg140), .y(wire195), .wire150(wire148), .wire152(reg144), .clk(clk), .wire153(reg134));
endmodule

module module149  (y, clk, wire153, wire152, wire151, wire150);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire153;
  input wire signed [(5'h15):(1'h0)] wire152;
  input wire [(5'h15):(1'h0)] wire151;
  input wire signed [(2'h3):(1'h0)] wire150;
  wire signed [(4'hf):(1'h0)] wire194;
  wire signed [(4'hf):(1'h0)] wire193;
  wire [(5'h10):(1'h0)] wire192;
  wire [(5'h14):(1'h0)] wire191;
  wire signed [(5'h14):(1'h0)] wire179;
  wire [(2'h2):(1'h0)] wire176;
  wire signed [(4'hb):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire169;
  wire signed [(4'h8):(1'h0)] wire168;
  wire [(4'hc):(1'h0)] wire154;
  reg signed [(4'hd):(1'h0)] reg190 = (1'h0);
  reg [(2'h3):(1'h0)] reg189 = (1'h0);
  reg [(3'h6):(1'h0)] reg188 = (1'h0);
  reg signed [(4'he):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg186 = (1'h0);
  reg [(3'h4):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg184 = (1'h0);
  reg [(5'h12):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg181 = (1'h0);
  reg [(4'hc):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg178 = (1'h0);
  reg [(2'h2):(1'h0)] reg177 = (1'h0);
  reg [(4'h9):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg173 = (1'h0);
  reg [(2'h2):(1'h0)] reg172 = (1'h0);
  reg [(4'ha):(1'h0)] reg171 = (1'h0);
  reg [(4'hd):(1'h0)] reg167 = (1'h0);
  reg [(3'h4):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg164 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg159 = (1'h0);
  reg [(3'h6):(1'h0)] reg158 = (1'h0);
  reg [(3'h7):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  assign y = {wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire179,
                 wire176,
                 wire170,
                 wire169,
                 wire168,
                 wire154,
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
                 reg178,
                 reg177,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
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
                 (1'h0)};
  assign wire154 = (wire150 ?
                       $signed((($signed((8'hbb)) | (wire153 ?
                           wire150 : wire151)) >> $signed((wire152 ?
                           wire150 : (8'ha1))))) : ((wire151 <<< $signed((8'ha4))) ?
                           {$signed($unsigned(wire152))} : wire152[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      if ((+(wire153[(3'h6):(1'h1)] ~^ $unsigned($signed(((8'hbc) > (8'h9d)))))))
        begin
          if ($signed($unsigned(($signed(wire151[(5'h15):(3'h7)]) ^~ wire150[(1'h0):(1'h0)]))))
            begin
              reg155 <= (wire152 ?
                  $unsigned((^($signed(wire154) - $signed(wire152)))) : $signed((wire154 ?
                      ((wire150 | wire150) ?
                          $signed(wire154) : $unsigned(wire153)) : wire151)));
              reg156 <= $unsigned((~(8'h9e)));
            end
          else
            begin
              reg155 <= (((wire150[(1'h0):(1'h0)] || $unsigned($signed(wire152))) ?
                      (reg155[(2'h3):(2'h2)] ?
                          {{reg155},
                              wire152} : reg156) : $signed(((~^(8'ha0)) >> $signed(reg155)))) ?
                  ($unsigned(($unsigned(wire150) >>> reg155)) ?
                      wire153[(5'h13):(5'h12)] : wire153) : (-wire154[(3'h6):(1'h0)]));
            end
          reg157 <= {wire150[(2'h3):(2'h3)]};
          reg158 <= reg156;
        end
      else
        begin
          if ($signed($unsigned(((8'haa) ?
              $signed(wire153) : $signed((wire152 ? reg157 : reg157))))))
            begin
              reg155 <= {(8'h9d)};
            end
          else
            begin
              reg155 <= ((-(~|(^(^~wire152)))) <<< $unsigned((wire151[(4'hc):(3'h7)] ^ (-$signed(reg157)))));
              reg156 <= (8'ha2);
              reg157 <= $unsigned((~($unsigned((!wire153)) ?
                  (8'hbb) : (wire150 + $signed(wire152)))));
              reg158 <= {(^(~(+$signed((8'hb8))))), $unsigned((7'h42))};
              reg159 <= {($signed($signed((!wire152))) ?
                      wire153[(4'hb):(4'ha)] : reg156[(2'h2):(1'h0)])};
            end
          reg160 <= $unsigned(({(reg159[(2'h3):(2'h2)] ?
                  wire152 : reg157[(1'h1):(1'h1)]),
              (wire153[(5'h10):(3'h4)] ?
                  $unsigned(wire152) : $unsigned(reg157))} - $unsigned((~^wire150))));
          if ($signed({wire153}))
            begin
              reg161 <= ($unsigned({{reg160},
                  ($signed(reg160) <= $signed(reg155))}) > ($unsigned(reg156[(2'h3):(1'h1)]) && reg156));
              reg162 <= reg160[(3'h5):(2'h3)];
              reg163 <= $signed($unsigned(reg158));
              reg164 <= (~^$signed($unsigned(((reg163 ?
                  reg157 : reg160) != $unsigned(reg156)))));
              reg165 <= {reg157, {$signed((~(reg162 ^ wire152)))}};
            end
          else
            begin
              reg161 <= ((reg156 > $signed((~|(reg155 ^~ reg157)))) ?
                  $signed(wire152) : (-reg155));
              reg162 <= wire151[(4'he):(2'h2)];
              reg163 <= $signed($unsigned(((^~{reg158, wire151}) || (^~(reg160 ?
                  reg155 : wire153)))));
              reg164 <= wire150[(2'h2):(1'h0)];
            end
          reg166 <= reg160;
          if (($signed(reg166) - (reg163[(1'h1):(1'h1)] ?
              $unsigned($unsigned((reg161 ?
                  wire153 : wire152))) : ((((8'h9c) - wire151) | $unsigned(reg165)) ?
                  (8'hae) : reg156))))
            begin
              reg167 <= wire151;
            end
          else
            begin
              reg167 <= reg167[(1'h1):(1'h1)];
            end
        end
    end
  assign wire168 = reg155;
  assign wire169 = ((wire168[(2'h2):(1'h0)] && reg165) ?
                       $unsigned($signed(wire151[(4'h8):(4'h8)])) : $signed($signed($signed($signed(reg165)))));
  assign wire170 = $unsigned(wire168[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg171 <= ((reg165[(3'h4):(3'h4)] != reg156[(5'h13):(4'he)]) - (($signed((reg156 ?
                  reg163 : reg164)) ?
              $signed($signed((8'hb9))) : wire168[(2'h3):(2'h2)]) ?
          reg167[(4'ha):(2'h2)] : $unsigned(reg156[(5'h10):(3'h4)])));
      reg172 <= $signed(({(^(reg161 ? reg161 : reg166)), $signed(reg171)} ?
          $signed((|(reg161 ?
              (8'hb7) : reg167))) : ((reg160[(4'hd):(1'h0)] ~^ $signed(reg166)) ?
              ($unsigned(reg166) > (reg164 ? reg166 : reg167)) : ((reg157 ?
                      wire150 : reg160) ?
                  reg162 : $signed(wire153)))));
      reg173 <= (~&((-(wire151[(4'hd):(3'h5)] ?
          ((8'hb1) && reg157) : wire170[(2'h3):(1'h0)])) ~^ $unsigned($unsigned((reg160 ?
          wire152 : (8'ha3))))));
      reg174 <= ({(reg164 || (8'hba)),
              (((wire150 ? reg162 : reg167) ? (wire153 + reg172) : (-reg160)) ?
                  $signed((reg156 <<< reg162)) : ({reg156} ^ reg160[(3'h6):(3'h5)]))} ?
          reg172[(1'h0):(1'h0)] : ($unsigned({wire151[(1'h1):(1'h0)]}) ?
              $unsigned(reg171) : $unsigned({wire154})));
      reg175 <= $signed({$signed($signed(reg162))});
    end
  assign wire176 = (reg167 ?
                       reg171 : (({{reg173, reg163}, (~&reg158)} ?
                           ($signed(wire170) ?
                               (&reg158) : (reg157 || reg157)) : ($signed(reg167) ?
                               {reg175, reg161} : (wire170 ?
                                   reg157 : (8'ha3)))) - (~&wire150)));
  always
    @(posedge clk) begin
      reg177 <= (+reg157[(3'h5):(2'h3)]);
      reg178 <= (8'hae);
    end
  assign wire179 = reg161[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      if ($signed({(8'hb4)}))
        begin
          reg180 <= $unsigned(((8'hab) < ((|wire179[(1'h1):(1'h1)]) ^~ $signed((wire179 != wire153)))));
          reg181 <= $unsigned((-($signed($unsigned(reg164)) ?
              {(wire170 - (8'hb0))} : ((reg178 ? wire179 : reg165) ?
                  $signed(reg167) : reg163[(2'h2):(1'h1)]))));
        end
      else
        begin
          reg180 <= reg177;
          reg181 <= (~^(~(((wire169 - reg177) & reg178[(5'h11):(3'h6)]) ?
              (reg165 ?
                  reg177[(2'h2):(1'h0)] : (~|reg160)) : $unsigned((reg173 ?
                  reg156 : (7'h40))))));
          reg182 <= (reg165 ?
              ((wire154[(2'h3):(2'h2)] ?
                      (~&(^reg155)) : reg158[(3'h6):(1'h0)]) ?
                  reg177 : (((reg156 ? reg161 : wire152) || (~&reg165)) ?
                      ($unsigned(reg181) < $signed((8'hbe))) : reg157)) : $signed((wire152 || (!(|wire150)))));
          reg183 <= ((-$unsigned((~|$unsigned(wire170)))) ?
              $unsigned((~|((!reg167) >> reg164))) : reg164);
          reg184 <= (^~(wire153[(3'h6):(3'h5)] - (|reg178)));
        end
      reg185 <= (|reg156[(4'ha):(2'h2)]);
      if ($unsigned({reg184}))
        begin
          reg186 <= {(!(((reg157 != (8'hb8)) * (wire150 > (8'hb3))) ?
                  (^wire154[(3'h6):(3'h4)]) : wire179[(5'h10):(1'h1)])),
              wire168};
          reg187 <= $signed($signed(wire169[(4'h9):(2'h2)]));
          reg188 <= reg159[(2'h3):(1'h0)];
          reg189 <= ($signed((($signed(wire150) ? reg180 : $signed((8'hb1))) ?
                  $unsigned((reg161 | wire152)) : wire150[(1'h0):(1'h0)])) ?
              (($signed(wire168[(2'h3):(1'h1)]) ~^ $signed((reg167 ?
                      (8'ha7) : reg165))) ?
                  $unsigned((+(~&reg159))) : (|$unsigned($signed(reg185)))) : (~|$signed(reg180)));
        end
      else
        begin
          reg186 <= (8'haa);
          reg187 <= (~|(^{(wire153[(3'h5):(1'h1)] && (^reg171))}));
          reg188 <= wire179;
          reg189 <= $signed((~reg188));
          reg190 <= {{$unsigned($signed((reg186 + reg164))),
                  $signed($signed(reg160))},
              reg175[(3'h5):(3'h4)]};
        end
    end
  assign wire191 = {((&(-$signed(reg157))) << (wire153[(5'h12):(4'he)] ?
                           ((reg162 ? reg166 : reg180) ?
                               $signed(reg171) : $unsigned(wire151)) : (+$signed(wire176))))};
  assign wire192 = {$unsigned((~^{(^wire168)}))};
  assign wire193 = reg172;
  assign wire194 = (reg183[(4'ha):(3'h5)] | $unsigned(wire154));
endmodule

module module89
#(parameter param122 = ({(|{((8'ha1) ? (8'hbc) : (8'hb3))})} ? (|(((8'hac) & {(8'ha5), (8'hb2)}) + (|((8'hb0) ? (7'h44) : (8'hb2))))) : (((8'hbb) ? ((+(8'ha9)) != (~&(8'hbb))) : (((8'hab) << (8'hb5)) > (|(8'hb9)))) ? ((((8'h9e) ? (7'h42) : (8'hbb)) | ((8'ha1) ? (8'ha2) : (8'hb1))) >>> (((7'h44) ? (8'hb0) : (8'h9c)) ? (8'hb5) : ((8'ha5) ? (7'h42) : (8'ha4)))) : (^~(((8'hbb) <= (8'ha8)) <= {(7'h42)})))), 
parameter param123 = (~|((((param122 ^~ param122) == param122) ? param122 : (((8'hb6) ? param122 : param122) ? param122 : {(8'hba)})) || (8'hb6))))
(y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire94;
  input wire signed [(4'he):(1'h0)] wire93;
  input wire signed [(2'h2):(1'h0)] wire92;
  input wire signed [(4'h8):(1'h0)] wire91;
  input wire signed [(4'h8):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire108;
  wire [(5'h12):(1'h0)] wire107;
  wire signed [(4'hf):(1'h0)] wire106;
  wire signed [(3'h5):(1'h0)] wire102;
  wire signed [(5'h13):(1'h0)] wire96;
  wire [(5'h12):(1'h0)] wire95;
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire102,
                 wire96,
                 wire95,
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
                 reg105,
                 reg104,
                 reg103,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire95 = (8'ha5);
  assign wire96 = wire93;
  always
    @(posedge clk) begin
      reg97 <= $unsigned((^~$signed(wire91)));
      reg98 <= (~^(~($signed(wire91[(2'h2):(1'h1)]) ?
          (((8'hb1) ~^ wire91) ? (~&reg97) : wire91[(3'h6):(1'h1)]) : ((wire90 ?
              wire96 : wire92) > {reg97, wire95}))));
      reg99 <= {$unsigned(({$signed(reg97), (&wire92)} ?
              $signed($signed(reg98)) : $signed((&wire90))))};
      reg100 <= $unsigned($signed($signed({$unsigned(reg98)})));
      reg101 <= $signed($unsigned($signed((|wire92))));
    end
  assign wire102 = reg100;
  always
    @(posedge clk) begin
      reg103 <= $unsigned({$signed(wire93)});
      reg104 <= ($unsigned(wire102) << $unsigned($unsigned({wire94})));
      reg105 <= ((((^(-reg99)) ?
                  wire90 : (wire96[(4'h9):(2'h3)] >> (reg97 ^ reg104))) ?
              reg104[(1'h1):(1'h0)] : $unsigned(wire90)) ?
          $unsigned(((wire91 ?
              (wire93 | wire95) : wire102[(1'h1):(1'h1)]) > wire91)) : (wire96 ?
              reg97 : $unsigned((wire95 ^ $signed(wire92)))));
    end
  assign wire106 = reg97[(2'h2):(1'h1)];
  assign wire107 = (wire106 ? reg100 : wire91[(1'h0):(1'h0)]);
  assign wire108 = $signed(reg101[(3'h6):(3'h5)]);
  assign wire109 = reg100[(2'h3):(1'h0)];
  assign wire110 = $unsigned(reg104[(3'h5):(2'h3)]);
  assign wire111 = (wire96 < wire93);
  always
    @(posedge clk) begin
      reg112 <= wire93[(4'he):(1'h0)];
      if ($unsigned($unsigned($unsigned($unsigned({reg100})))))
        begin
          if ((-((wire92 == $signed($unsigned(wire106))) ?
              (~^wire106[(4'he):(3'h7)]) : {wire94[(4'ha):(4'h8)],
                  {(wire93 ? wire106 : wire92)}})))
            begin
              reg113 <= reg97;
              reg114 <= $signed({{$unsigned({reg99, wire109})}, reg113});
            end
          else
            begin
              reg113 <= reg101[(3'h5):(1'h0)];
              reg114 <= ($unsigned(($signed($signed(wire110)) ?
                  $signed(wire109) : {(reg97 >= reg112),
                      {reg103}})) <<< ($unsigned((^(wire93 ?
                  wire109 : reg104))) << ($signed((wire106 >> (7'h41))) == $unsigned((~^reg114)))));
              reg115 <= ((reg99[(4'h9):(1'h1)] & $unsigned($signed($unsigned(reg113)))) ?
                  wire111[(5'h11):(4'h8)] : (reg98[(4'ha):(3'h5)] ?
                      (((~reg99) < wire111[(1'h1):(1'h0)]) ~^ (reg114 >>> {(8'h9d)})) : (^$unsigned((reg101 != wire102)))));
              reg116 <= $signed((~{((8'h9d) ?
                      wire91 : (wire94 ? wire107 : reg115))}));
            end
        end
      else
        begin
          reg113 <= reg98;
          reg114 <= (reg98[(3'h6):(1'h0)] - (!(((reg114 ?
              reg103 : reg105) <<< $unsigned(wire94)) * wire108)));
          reg115 <= $unsigned($unsigned($signed(reg99)));
        end
    end
  always
    @(posedge clk) begin
      reg117 <= (reg114[(4'hb):(3'h4)] - reg99);
      reg118 <= $unsigned(reg103);
      reg119 <= reg98[(4'h9):(1'h1)];
      reg120 <= ({wire96[(4'hb):(4'h9)]} ?
          reg98 : ((+$signed(wire107[(3'h5):(3'h5)])) ?
              (~(wire110 ?
                  wire94[(3'h7):(3'h4)] : $unsigned(wire92))) : $unsigned($unsigned((^~reg119)))));
      reg121 <= {reg115[(4'h9):(4'h8)],
          ({wire94[(5'h13):(4'hf)], wire106[(4'hb):(4'hb)]} ?
              (((reg105 ? wire111 : reg112) ? wire90 : $unsigned(reg115)) ?
                  $unsigned(reg100) : ((+(8'hae)) + (~wire111))) : ($unsigned(reg119[(3'h6):(3'h4)]) > reg100[(3'h4):(1'h0)]))};
    end
endmodule

module module58  (y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire63;
  input wire signed [(3'h7):(1'h0)] wire62;
  input wire [(4'h9):(1'h0)] wire61;
  input wire [(4'ha):(1'h0)] wire60;
  input wire signed [(4'he):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire85;
  wire [(4'hb):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire69,
                 wire68,
                 reg79,
                 reg72,
                 reg71,
                 reg70,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($signed(wire60[(1'h0):(1'h0)]))))
        begin
          reg64 <= {(((&(wire63 ? wire63 : (8'ha2))) ?
                  $signed((wire60 << wire59)) : {$unsigned(wire59)}) >= $unsigned($signed({wire59}))),
              wire62[(3'h4):(3'h4)]};
          reg65 <= (-(+$unsigned(((reg64 >>> wire62) <<< $signed(reg64)))));
        end
      else
        begin
          reg64 <= $signed({$unsigned($unsigned($signed(wire63))), wire62});
        end
      reg66 <= $signed(((^~{$unsigned(wire62)}) >>> $unsigned(((wire62 - wire61) < $unsigned(wire63)))));
      reg67 <= {wire63[(4'hd):(3'h4)], $signed(wire61)};
    end
  assign wire68 = $unsigned($unsigned((~^$signed(((8'hab) || wire62)))));
  assign wire69 = wire63;
  always
    @(posedge clk) begin
      reg70 <= wire63[(3'h7):(1'h1)];
      reg71 <= reg66[(2'h2):(1'h0)];
      reg72 <= wire69[(4'hd):(4'h9)];
    end
  assign wire73 = wire62;
  assign wire74 = $signed(reg64[(3'h7):(3'h5)]);
  assign wire75 = $unsigned(($unsigned(({wire61} >> reg70)) ?
                      reg72 : (!$unsigned((|reg67)))));
  assign wire76 = wire69[(1'h1):(1'h0)];
  assign wire77 = reg70[(4'hf):(4'h8)];
  assign wire78 = $signed(wire74[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg79 <= wire68;
    end
  assign wire80 = $signed(((!{reg66, (~|wire60)}) ?
                      $signed($signed($unsigned(wire69))) : wire59));
  assign wire81 = $unsigned($signed(((&(wire63 >> reg71)) ?
                      ((!reg66) ?
                          $signed((8'hb0)) : $unsigned(wire60)) : $unsigned(wire75))));
  assign wire82 = $signed(wire68[(3'h7):(1'h0)]);
  assign wire83 = $signed(wire60[(4'ha):(1'h0)]);
  assign wire84 = (~|wire68[(3'h4):(1'h0)]);
  assign wire85 = {((~&$unsigned((~^wire62))) ?
                          (~^$unsigned((reg65 == reg70))) : $signed(((wire78 ?
                              wire60 : reg64) == (-reg72))))};
  assign wire86 = $signed((7'h44));
endmodule

module module26
#(parameter param46 = ({((!{(8'ha9)}) ^ (^~((7'h41) >>> (7'h43)))), (^({(8'hbd), (8'hbb)} <= (~&(7'h42))))} < (&(8'hb4))))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire31;
  input wire [(4'hf):(1'h0)] wire30;
  input wire [(2'h3):(1'h0)] wire29;
  input wire [(5'h11):(1'h0)] wire28;
  input wire signed [(5'h10):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire42,
                 wire41,
                 wire40,
                 reg43,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire29[(2'h3):(2'h3)])
        begin
          reg32 <= (~&{wire30,
              (wire27[(2'h2):(1'h1)] * wire28[(4'h8):(3'h4)])});
        end
      else
        begin
          if ($signed(wire30[(4'hb):(3'h5)]))
            begin
              reg32 <= ((~&$signed($signed($signed(wire28)))) || wire29);
              reg33 <= (reg32 ? wire31[(1'h0):(1'h0)] : reg32[(1'h0):(1'h0)]);
              reg34 <= $unsigned((|((wire30[(3'h5):(2'h2)] <= $unsigned(reg33)) & $unsigned(wire27[(4'hf):(1'h0)]))));
            end
          else
            begin
              reg32 <= $unsigned(($unsigned(wire31) != reg34));
              reg33 <= (7'h40);
              reg34 <= (8'ha0);
            end
          reg35 <= (8'hbb);
        end
      reg36 <= wire31[(1'h0):(1'h0)];
      reg37 <= (wire31 ? (-reg36) : wire29);
      reg38 <= (-reg35);
      reg39 <= (8'hb7);
    end
  assign wire40 = wire31[(1'h0):(1'h0)];
  assign wire41 = {wire31};
  assign wire42 = $signed(((|($signed(wire31) ?
                      $unsigned(reg38) : (~&wire29))) << reg37));
  always
    @(posedge clk) begin
      reg43 <= (({(reg37 ? $signed(wire41) : (~reg35)),
              $signed($unsigned(reg38))} ?
          (-reg38[(2'h3):(1'h1)]) : wire42[(2'h2):(2'h2)]) || (&wire41));
    end
  assign wire44 = $signed($unsigned(($signed({wire41}) ?
                      reg36 : (reg33[(2'h2):(1'h1)] ?
                          (reg35 ? wire42 : reg36) : reg35))));
  assign wire45 = (8'ha2);
endmodule
