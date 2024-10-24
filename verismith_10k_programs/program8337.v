module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire180;
  wire signed [(4'hd):(1'h0)] wire179;
  wire signed [(4'h9):(1'h0)] wire178;
  wire [(4'hc):(1'h0)] wire177;
  wire signed [(3'h4):(1'h0)] wire176;
  wire [(5'h14):(1'h0)] wire174;
  wire [(5'h12):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire52;
  reg [(4'hd):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg181 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire174,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire52,
                 reg183,
                 reg182,
                 reg181,
                 (1'h0)};
  assign wire4 = ((!wire0) == $unsigned($signed($unsigned((^wire2)))));
  assign wire5 = wire4[(1'h1):(1'h1)];
  assign wire6 = ($unsigned(wire0[(2'h3):(1'h1)]) ?
                     $signed(((~|(~&wire1)) >= $unsigned((wire1 ?
                         wire2 : wire3)))) : $signed($signed(((wire3 && wire2) ?
                         (wire0 ? wire2 : wire3) : (wire2 <= wire4)))));
  assign wire7 = {$signed($unsigned((|$signed(wire2))))};
  assign wire8 = (wire1[(1'h1):(1'h0)] ?
                     $signed($unsigned(((|wire2) ?
                         {wire0} : (-wire5)))) : $signed((|$signed($signed(wire3)))));
  module9 #() modinst53 (.wire12(wire6), .y(wire52), .clk(clk), .wire10(wire2), .wire13(wire0), .wire11(wire4), .wire14(wire5));
  assign wire54 = (wire6[(5'h10):(1'h0)] < $unsigned((wire4[(5'h10):(3'h6)] <= $unsigned(((8'hb6) ?
                      wire3 : wire2)))));
  assign wire55 = {($signed(($unsigned(wire3) - $signed(wire2))) ?
                          wire0[(3'h7):(1'h0)] : $unsigned((~|$signed(wire6)))),
                      (~|(8'hbf))};
  assign wire56 = $unsigned($signed($unsigned($unsigned($signed(wire3)))));
  assign wire57 = (((((wire54 ? wire4 : wire5) ? wire2 : $unsigned((8'hb8))) ?
                          $unsigned((wire1 ? wire4 : (8'h9d))) : ((wire2 ?
                              wire5 : wire8) & wire7[(4'h9):(3'h5)])) ?
                      (+wire6[(5'h13):(4'hd)]) : wire55) << wire54);
  assign wire58 = ($signed($unsigned(wire4)) || $unsigned(wire2[(4'hf):(4'h8)]));
  assign wire59 = wire7[(4'he):(3'h6)];
  module60 #() modinst175 (wire174, clk, wire8, wire54, wire52, wire57);
  assign wire176 = $signed($signed(wire54[(2'h2):(1'h1)]));
  assign wire177 = (~&{(wire57[(1'h1):(1'h1)] ?
                           ($unsigned((8'ha2)) ?
                               (wire8 ?
                                   wire176 : wire7) : $unsigned(wire6)) : ($unsigned(wire3) ?
                               (wire176 ? wire174 : wire54) : $signed(wire57))),
                       $signed((wire3 << wire5[(3'h5):(3'h5)]))});
  assign wire178 = (wire56 << {($unsigned((wire7 && wire4)) | (((7'h44) ?
                               (8'hbd) : wire0) ?
                           (wire5 ? wire1 : wire1) : wire176)),
                       wire177[(4'h8):(1'h1)]});
  assign wire179 = $signed($signed(((8'ha6) == {{wire0}, (wire174 > wire56)})));
  assign wire180 = wire55[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg181 <= $signed((($signed((wire7 - wire2)) + ($unsigned(wire7) | $signed(wire179))) ?
          $unsigned({{wire174}, wire57}) : $signed($unsigned({wire7}))));
      reg182 <= $signed(wire1[(4'ha):(1'h0)]);
      reg183 <= (+$unsigned((((^wire176) - {wire5,
          (8'ha0)}) || {$signed(wire59), (wire59 ? wire55 : wire56)})));
    end
endmodule

module module60  (y, clk, wire61, wire62, wire63, wire64);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire61;
  input wire [(5'h11):(1'h0)] wire62;
  input wire signed [(4'h9):(1'h0)] wire63;
  input wire signed [(5'h13):(1'h0)] wire64;
  wire signed [(5'h13):(1'h0)] wire173;
  wire signed [(2'h3):(1'h0)] wire169;
  wire signed [(4'hc):(1'h0)] wire160;
  wire [(3'h4):(1'h0)] wire158;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire120;
  reg signed [(4'ha):(1'h0)] reg172 = (1'h0);
  reg [(3'h7):(1'h0)] reg171 = (1'h0);
  reg [(4'hf):(1'h0)] reg170 = (1'h0);
  reg [(4'hf):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg167 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg166 = (1'h0);
  reg [(3'h7):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg164 = (1'h0);
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(5'h15):(1'h0)] reg161 = (1'h0);
  assign y = {wire173,
                 wire169,
                 wire160,
                 wire158,
                 wire65,
                 wire66,
                 wire120,
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
                 (1'h0)};
  assign wire65 = wire64;
  assign wire66 = wire63[(4'h8):(2'h3)];
  module67 #() modinst121 (wire120, clk, wire62, wire61, wire65, wire64, wire66);
  module122 #() modinst159 (wire158, clk, wire65, wire62, wire66, wire64);
  assign wire160 = (wire120 >> wire62[(5'h10):(4'hb)]);
  always
    @(posedge clk) begin
      reg161 <= $unsigned(((wire120 > wire63) != $signed($signed((wire66 - wire64)))));
      if ($signed(((((!wire65) == $signed(wire61)) ?
              $unsigned((~(8'haf))) : $unsigned((wire120 ?
                  wire160 : wire158))) ?
          ((wire63 <= $signed((8'hbf))) > wire65[(5'h13):(4'hb)]) : (($unsigned(wire160) ^ (!wire63)) ?
              $signed(wire66[(4'h8):(2'h3)]) : (|(wire66 ?
                  wire158 : wire62))))))
        begin
          reg162 <= ((+reg161[(3'h6):(3'h6)]) ?
              $unsigned(wire63) : (&$unsigned($signed(wire120))));
          if ((wire62[(2'h2):(1'h0)] ? $signed(wire158) : $unsigned((|wire63))))
            begin
              reg163 <= {{($signed((-wire160)) & $signed($unsigned((8'hb0))))}};
              reg164 <= {((8'had) ?
                      {wire61[(2'h2):(2'h2)]} : $unsigned(wire120[(2'h2):(2'h2)]))};
              reg165 <= wire62;
              reg166 <= (~|{wire65, $signed(wire158)});
            end
          else
            begin
              reg163 <= {({$unsigned((reg165 < reg161))} ?
                      (^~wire160) : reg163)};
              reg164 <= ((~^(+($unsigned(wire158) & wire62[(4'hb):(3'h6)]))) << {(+$unsigned((wire158 >> reg166)))});
              reg165 <= (reg165[(3'h6):(2'h3)] ?
                  (-(reg165[(3'h5):(3'h5)] ^~ (^(~^wire62)))) : wire65[(4'hc):(3'h5)]);
            end
          reg167 <= (((~|{(~|(8'hb6)), reg162[(3'h6):(1'h0)]}) ?
                  (8'hbe) : ((|$signed(reg162)) > ($signed(reg165) ?
                      $unsigned((8'ha1)) : $signed((8'hab))))) ?
              wire158[(1'h1):(1'h1)] : (reg162 & (&({wire160} ?
                  {reg166, reg165} : (8'h9e)))));
          reg168 <= {{wire66,
                  ((((7'h42) ? (7'h41) : wire62) ?
                          $signed(reg162) : $unsigned(reg163)) ?
                      (8'hae) : (((8'h9f) <= wire158) && (^~reg165)))}};
        end
      else
        begin
          reg162 <= wire120[(4'hd):(2'h2)];
        end
    end
  assign wire169 = {(({wire120[(2'h2):(1'h1)]} ?
                               (~(&wire66)) : $unsigned($unsigned(wire61))) ?
                           $signed(($signed(reg168) >> (^reg166))) : $signed({(reg167 ~^ wire160)})),
                       wire160[(4'h9):(3'h5)]};
  always
    @(posedge clk) begin
      reg170 <= wire65;
      reg171 <= (&reg170[(3'h6):(1'h0)]);
      reg172 <= $unsigned(wire66[(4'h9):(1'h1)]);
    end
  assign wire173 = ((((reg166 <= reg165) < $unsigned((reg168 || reg164))) - $signed((+(reg171 * reg172)))) ?
                       {{{$signed((8'h9e))}, reg163},
                           ((-{reg161}) ?
                               ((^wire160) ?
                                   ((8'hae) ?
                                       wire63 : wire65) : reg164) : ((wire61 ?
                                   reg163 : wire158) != (wire169 ?
                                   reg170 : reg167)))} : wire61[(5'h10):(1'h0)]);
endmodule

module module9
#(parameter param50 = (8'hb0), 
parameter param51 = (8'ha6))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire [(3'h7):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire15;
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 wire28,
                 wire27,
                 wire25,
                 wire15,
                 (1'h0)};
  assign wire15 = (wire10 ?
                      (~{wire14}) : (({$signed(wire14),
                              (~^wire12)} == ((wire11 | wire12) <<< $signed(wire12))) ?
                          $signed($signed($signed(wire11))) : $unsigned(wire10)));
  module16 #() modinst26 (wire25, clk, wire15, wire13, wire12, wire10);
  assign wire27 = {wire12};
  assign wire28 = (~&wire27);
  module29 #() modinst42 (.wire30(wire14), .wire31(wire11), .y(wire41), .wire33(wire10), .wire32(wire28), .clk(clk));
  assign wire43 = wire15[(4'hf):(4'hf)];
  assign wire44 = (^wire15);
  assign wire45 = wire25[(5'h11):(3'h5)];
  assign wire46 = wire11[(3'h5):(3'h4)];
  assign wire47 = (!wire10[(1'h0):(1'h0)]);
  assign wire48 = wire44[(4'hb):(4'h9)];
  assign wire49 = $unsigned((((8'hb1) ?
                          ((|(8'hb8)) ?
                              (~&wire10) : $unsigned(wire43)) : ((wire15 ?
                              wire25 : (8'hac)) < wire27[(1'h0):(1'h0)])) ?
                      $signed(wire41[(4'hc):(2'h3)]) : $unsigned(($unsigned(wire12) | $unsigned(wire46)))));
endmodule

module module29
#(parameter param40 = (-((-((~^(8'hab)) != (+(8'hb5)))) ? ((!((8'h9e) || (8'ha7))) || {((8'h9d) ? (7'h42) : (8'ha5)), {(8'ha7)}}) : ({(|(8'haf))} < (&((8'hac) == (8'h9c)))))))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire33;
  input wire signed [(5'h14):(1'h0)] wire32;
  input wire signed [(5'h14):(1'h0)] wire31;
  input wire [(4'he):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  assign y = {wire39, wire38, wire36, wire35, wire34, reg37, (1'h0)};
  assign wire34 = $unsigned($unsigned((&wire33[(2'h2):(1'h0)])));
  assign wire35 = $unsigned({wire31});
  assign wire36 = wire31[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg37 <= ((wire31 | wire34) >> (wire32[(1'h0):(1'h0)] - wire35[(4'hc):(4'h9)]));
    end
  assign wire38 = {wire31};
  assign wire39 = ((~^wire35) | $signed(((~&$unsigned(wire30)) ^ $signed((&wire34)))));
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire20;
  input wire signed [(3'h5):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  input wire [(4'h9):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  assign y = {wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = wire17;
  assign wire22 = ($unsigned(wire19[(1'h1):(1'h0)]) & wire20);
  assign wire23 = $signed(($signed((-((7'h42) * (8'h9f)))) << {wire22,
                      (|((8'hb2) ? wire21 : wire20))}));
  assign wire24 = (wire20[(2'h2):(2'h2)] ?
                      $signed(($unsigned($signed(wire19)) ?
                          (wire23[(4'hd):(4'hd)] ?
                              $unsigned((7'h43)) : ((8'ha1) ?
                                  (8'hb3) : wire20)) : wire21[(2'h2):(1'h0)])) : wire18[(3'h5):(3'h5)]);
endmodule

module module122
#(parameter param157 = (-{(~((8'hac) ? ((8'hbb) ? (8'hb3) : (8'haf)) : ((8'h9f) * (8'hb1))))}))
(y, clk, wire126, wire125, wire124, wire123);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire126;
  input wire [(3'h5):(1'h0)] wire125;
  input wire [(5'h14):(1'h0)] wire124;
  input wire signed [(5'h13):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire156;
  wire signed [(5'h12):(1'h0)] wire152;
  wire signed [(3'h5):(1'h0)] wire150;
  wire [(2'h3):(1'h0)] wire149;
  wire signed [(4'ha):(1'h0)] wire148;
  wire signed [(4'hb):(1'h0)] wire140;
  wire signed [(4'h9):(1'h0)] wire139;
  wire [(2'h2):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire127;
  reg signed [(5'h11):(1'h0)] reg155 = (1'h0);
  reg [(4'hf):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg153 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  reg [(3'h7):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg [(4'hb):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg141 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(5'h13):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  assign y = {wire156,
                 wire152,
                 wire150,
                 wire149,
                 wire148,
                 wire140,
                 wire139,
                 wire128,
                 wire127,
                 reg155,
                 reg154,
                 reg153,
                 reg151,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
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
                 (1'h0)};
  assign wire127 = wire126[(3'h4):(1'h0)];
  assign wire128 = (wire126[(3'h4):(1'h0)] && ($signed((^$unsigned(wire124))) - wire125[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      if ($signed(((((wire123 ? wire126 : wire128) ?
                  {(8'ha4), wire126} : (wire127 ? wire128 : wire126)) ?
              ((wire125 ?
                  wire125 : wire125) || wire125[(1'h0):(1'h0)]) : ($unsigned(wire127) && wire126)) ?
          (|($unsigned(wire128) >>> {(8'hb7)})) : (^($unsigned(wire127) ~^ ((8'hb6) ?
              wire123 : wire125))))))
        begin
          reg129 <= (8'hac);
          reg130 <= (((((~|wire128) ? $signed(wire126) : {reg129, reg129}) ?
                  wire124 : reg129[(1'h1):(1'h1)]) >> $unsigned(((wire128 ?
                  wire125 : wire128) != $unsigned(wire125)))) ?
              $unsigned(wire124) : {((~|wire124) ~^ $signed((8'hb1)))});
          reg131 <= (8'hb5);
          if (wire126)
            begin
              reg132 <= $signed(($unsigned(wire128) ^ $unsigned((&reg129))));
            end
          else
            begin
              reg132 <= (reg129 ? wire124[(4'h9):(2'h3)] : reg131);
              reg133 <= (($unsigned((~|wire128[(2'h2):(1'h1)])) - ($unsigned((wire125 ?
                      reg129 : (7'h40))) ?
                  $unsigned((~reg130)) : ((8'hbf) >= (-reg130)))) ^ (~|(((&reg129) * $signed(wire126)) ?
                  ((wire124 ? wire126 : wire125) ?
                      reg129[(2'h2):(1'h1)] : $signed(wire128)) : $signed((~|(8'ha1))))));
            end
        end
      else
        begin
          reg129 <= {{(-(^~$signed((7'h43)))), $unsigned($signed(reg133))},
              reg131};
          reg130 <= wire125;
        end
      reg134 <= $unsigned((reg132[(1'h1):(1'h1)] & ($signed((~^(8'hb7))) ?
          reg132 : $unsigned((|wire126)))));
      reg135 <= reg130;
    end
  always
    @(posedge clk) begin
      if (wire123[(5'h10):(3'h5)])
        begin
          reg136 <= reg133;
          reg137 <= (((wire127 ?
                  reg135[(4'he):(4'hb)] : {$unsigned(reg130)}) >>> wire125) ?
              (wire123 ?
                  {((~^reg135) ? reg135 : $unsigned(wire123)),
                      {(~|wire125), {reg135}}} : (wire124[(4'hb):(1'h1)] ?
                      $unsigned({reg135, wire125}) : ($unsigned((8'hb6)) ?
                          {reg133} : (wire123 | (8'hba))))) : {{(+(reg129 * wire126))}});
          reg138 <= ((|(~^wire125)) >> $unsigned($unsigned({(wire124 ?
                  reg135 : reg135),
              reg133})));
        end
      else
        begin
          reg136 <= wire128[(2'h2):(1'h0)];
          reg137 <= (^$signed({($signed(reg129) != (wire124 ?
                  wire128 : reg135))}));
        end
    end
  assign wire139 = wire123;
  assign wire140 = (($signed(reg129) >= ((8'ha8) ?
                           reg136 : $signed((reg138 && reg138)))) ?
                       $signed({$unsigned($unsigned(wire128)),
                           (~&wire128[(1'h0):(1'h0)])}) : reg136[(4'h9):(2'h3)]);
  always
    @(posedge clk) begin
      reg141 <= wire127;
      reg142 <= ($unsigned(reg129[(1'h0):(1'h0)]) ? wire126 : reg133);
      reg143 <= reg134;
    end
  always
    @(posedge clk) begin
      reg144 <= reg137[(2'h2):(1'h1)];
      reg145 <= $signed(reg137[(3'h5):(3'h4)]);
      reg146 <= $signed($unsigned((reg131[(3'h5):(2'h2)] - wire127[(1'h0):(1'h0)])));
      reg147 <= (~^reg132);
    end
  assign wire148 = ((reg135[(1'h0):(1'h0)] ?
                           (&(~&$unsigned(reg147))) : ($unsigned((~^reg143)) ?
                               $signed(reg132) : $signed({reg137}))) ?
                       (!$signed($signed((reg132 * reg135)))) : ({reg146} >>> reg131));
  assign wire149 = (reg130[(4'h9):(3'h4)] | (wire128 ?
                       (8'ha8) : reg141[(1'h0):(1'h0)]));
  assign wire150 = (^(^$signed($unsigned($signed(reg138)))));
  always
    @(posedge clk) begin
      reg151 <= wire124[(3'h5):(1'h1)];
    end
  assign wire152 = (~(wire140[(3'h4):(2'h2)] ?
                       wire139 : wire148[(3'h5):(2'h3)]));
  always
    @(posedge clk) begin
      reg153 <= (-$unsigned((^(+$signed(reg131)))));
      reg154 <= (+$signed($signed(((reg141 == (8'ha7)) ?
          $unsigned((8'ha0)) : wire140))));
      reg155 <= $signed($signed((~$unsigned((wire149 ? reg133 : (8'hbd))))));
    end
  assign wire156 = wire125[(3'h5):(2'h3)];
endmodule

module module67
#(parameter param118 = {((~|(((8'h9f) | (8'h9e)) ? ((7'h42) ? (8'h9d) : (8'ha6)) : ((8'hbc) ? (8'hb7) : (7'h42)))) ~^ {(|((7'h42) ? (8'hb4) : (8'hb0))), (|(8'hb9))}), {((((8'hb7) ? (8'ha9) : (7'h44)) != ((8'hae) - (8'haf))) && {((8'hb6) ? (8'hb2) : (8'haf))})}}, 
parameter param119 = (~|((((!param118) ^ {param118}) << (&(param118 >= param118))) * ((8'ha9) < (&(^param118))))))
(y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h255):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire72;
  input wire signed [(4'h9):(1'h0)] wire71;
  input wire [(3'h7):(1'h0)] wire70;
  input wire signed [(4'h9):(1'h0)] wire69;
  input wire [(5'h10):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(5'h13):(1'h0)] reg116 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
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
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire73 = {(~wire68[(4'hf):(3'h4)]),
                      {$unsigned($signed((+wire69))), wire69[(3'h6):(2'h2)]}};
  assign wire74 = (^~wire71);
  assign wire75 = $unsigned($signed((8'hbe)));
  assign wire76 = wire69[(1'h0):(1'h0)];
  assign wire77 = wire70[(1'h1):(1'h1)];
  assign wire78 = wire74[(1'h1):(1'h0)];
  assign wire79 = $signed(($signed($unsigned(wire77[(1'h0):(1'h0)])) ?
                      {(&wire77[(2'h2):(1'h0)])} : $unsigned($signed(wire74[(3'h7):(1'h1)]))));
  assign wire80 = wire73[(1'h0):(1'h0)];
  assign wire81 = wire75;
  assign wire82 = {$unsigned((wire72[(3'h4):(1'h1)] ^~ wire76[(3'h7):(2'h2)]))};
  assign wire83 = (8'h9c);
  always
    @(posedge clk) begin
      reg84 <= ((wire73[(1'h1):(1'h0)] <= (((wire77 - wire80) ?
          {wire79, wire75} : (wire70 ?
              wire73 : wire80)) == $unsigned((wire74 & (8'had))))) > wire78);
      reg85 <= $unsigned((-(~^(wire79 ? (|wire71) : $unsigned(wire82)))));
      if ((wire77 ?
          $signed((~^$signed({wire77}))) : (~^$unsigned((wire72[(1'h1):(1'h0)] ?
              $signed(wire69) : wire74)))))
        begin
          reg86 <= (-(((wire80[(2'h3):(2'h3)] ?
              (^wire76) : $unsigned(wire82)) < ((wire74 ? wire77 : wire79) ?
              (wire71 >= wire83) : (reg84 ?
                  wire69 : wire83))) != $signed($signed(wire81))));
          reg87 <= (|{(&((8'hb5) <<< $unsigned(wire72))),
              (|reg85[(3'h7):(3'h4)])});
        end
      else
        begin
          reg86 <= wire80;
          reg87 <= wire81[(3'h6):(1'h0)];
          reg88 <= ((~wire82[(3'h7):(2'h2)]) ?
              $unsigned($signed($unsigned($signed((7'h41))))) : $signed(wire82[(4'h9):(3'h4)]));
          reg89 <= (8'hbc);
          reg90 <= (^~$signed((~$signed((wire79 ? reg87 : wire73)))));
        end
      reg91 <= $unsigned((-wire82));
      reg92 <= wire68;
    end
  assign wire93 = (wire77 ? (8'hb1) : (^$signed((~&wire70))));
  assign wire94 = ({(((^~reg92) ? (~wire72) : {reg85}) >>> $signed(((8'ha9) ?
                          wire82 : wire79))),
                      $unsigned(({wire75, reg90} ?
                          (wire79 << wire82) : (!reg85)))} || {(reg91 ?
                          (~^(reg91 ? reg91 : wire70)) : $signed((wire77 ?
                              reg92 : reg91)))});
  assign wire95 = $signed((7'h42));
  always
    @(posedge clk) begin
      reg96 <= $unsigned(({reg84[(4'ha):(3'h6)]} + (^$signed((wire80 ?
          reg90 : reg85)))));
      if (wire95)
        begin
          reg97 <= (($unsigned(wire71[(3'h5):(3'h4)]) ?
              {{$signed(wire94)}} : $unsigned($unsigned((wire77 ?
                  reg87 : reg90)))) >> $signed((+$unsigned({reg88}))));
        end
      else
        begin
          reg97 <= $signed($unsigned((wire81[(2'h3):(1'h1)] ~^ $signed({wire76,
              wire93}))));
          if ($unsigned((8'hbf)))
            begin
              reg98 <= (^(~&$signed(((reg90 ? (8'hbd) : wire79) - wire80))));
              reg99 <= ((~&(8'h9d)) ?
                  wire72[(2'h3):(1'h0)] : $signed((^$signed(wire76[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg98 <= $signed(($unsigned((reg99 ? reg92 : (+reg91))) ?
                  (reg96 ?
                      ($signed(wire79) ?
                          $signed(reg99) : (^reg97)) : (!wire75)) : wire74[(5'h12):(2'h2)]));
              reg99 <= $signed($unsigned(wire69[(3'h7):(3'h7)]));
            end
          if (((($unsigned((^reg89)) ?
                  wire73 : ($unsigned(wire81) ? wire72 : (&(8'hbe)))) + reg91) ?
              reg86[(2'h3):(2'h3)] : $unsigned(((8'hb7) ?
                  wire93[(2'h3):(2'h3)] : ((reg89 ? reg86 : (8'hb0)) ?
                      (-(8'ha7)) : $unsigned(wire70))))))
            begin
              reg100 <= wire68;
              reg101 <= $signed($signed((8'hb4)));
              reg102 <= wire77[(3'h5):(1'h1)];
              reg103 <= $signed({$signed({(wire74 ? reg88 : reg87)}), wire78});
            end
          else
            begin
              reg100 <= ((+(($unsigned(reg98) ?
                          reg98[(1'h1):(1'h1)] : (reg87 >> wire79)) ?
                      (~&wire81[(3'h6):(2'h3)]) : ($signed((8'hbb)) ?
                          {wire78, wire71} : (~^reg84)))) ?
                  $unsigned($unsigned({wire74})) : $signed(($signed((wire68 ?
                      wire78 : wire77)) == (reg96[(2'h3):(2'h2)] ?
                      $signed(wire93) : $unsigned(reg96)))));
              reg101 <= $unsigned(wire74[(3'h7):(3'h7)]);
              reg102 <= (~&$unsigned($signed($signed((reg102 ?
                  reg85 : wire83)))));
            end
          reg104 <= (~|(~^reg100));
        end
      if ($signed({(((!wire93) <<< {reg89, reg88}) ?
              $unsigned(wire93) : ((reg90 ? reg84 : (8'hb3)) != wire80)),
          $unsigned((^~(wire72 ? (8'hba) : reg104)))}))
        begin
          if (($unsigned(((+(~&reg103)) + {wire83})) ?
              $unsigned($signed(reg91)) : {(~|((wire94 ? reg92 : (8'ha9)) ?
                      $signed(reg85) : (~&wire93))),
                  reg99}))
            begin
              reg105 <= reg103;
              reg106 <= $unsigned((!(reg91[(5'h15):(5'h11)] ?
                  $unsigned((reg92 ?
                      wire73 : wire94)) : ($unsigned(reg103) & reg86))));
              reg107 <= $signed((~$signed((!(reg100 ? (8'hb1) : reg87)))));
              reg108 <= ((($signed(wire82[(2'h2):(1'h0)]) ?
                      $signed((reg105 >= reg105)) : ((reg103 ?
                              wire80 : reg104) ?
                          $unsigned(wire80) : (-reg100))) && $unsigned(($signed(wire72) ?
                      reg100[(1'h0):(1'h0)] : (~&reg98)))) ?
                  (7'h40) : (reg101[(2'h2):(1'h0)] ?
                      $signed($unsigned(reg99)) : ($signed($unsigned(reg86)) + reg104)));
              reg109 <= {$signed(reg104), wire75};
            end
          else
            begin
              reg105 <= (~|(wire74 | ($signed(reg86) ? (~&(~reg96)) : wire72)));
              reg106 <= $signed(reg88);
              reg107 <= {(({(-reg109), $unsigned(wire77)} ?
                          ((wire76 ?
                              reg105 : reg108) >= (~^reg91)) : wire95[(3'h6):(1'h0)]) ?
                      $unsigned(($unsigned((8'had)) ?
                          wire76 : reg85[(3'h4):(2'h2)])) : $signed($signed(reg101[(2'h2):(1'h1)]))),
                  $signed((~|$signed((wire75 == wire94))))};
              reg108 <= $unsigned(reg104);
              reg109 <= (^~(8'ha8));
            end
          reg110 <= (!(^reg92[(3'h5):(1'h1)]));
          reg111 <= ((8'h9f) ^~ reg89[(3'h6):(1'h1)]);
          reg112 <= $signed(reg96);
          if (($signed(wire74) < $signed($unsigned(((^~reg84) ?
              $signed(reg100) : (~^wire93))))))
            begin
              reg113 <= (-{reg98});
              reg114 <= (^$signed(reg109));
              reg115 <= reg89;
            end
          else
            begin
              reg113 <= $signed(reg105[(4'he):(4'hb)]);
              reg114 <= reg106[(3'h7):(1'h1)];
            end
        end
      else
        begin
          reg105 <= (reg114 >= $unsigned((reg106[(3'h6):(1'h1)] ?
              {(reg110 ? wire95 : (8'ha3)),
                  (reg114 ? (8'had) : reg105)} : ((reg97 || (8'ha0)) ?
                  reg112[(4'ha):(3'h6)] : $unsigned(reg92)))));
          reg106 <= wire80[(2'h2):(1'h0)];
          if (reg104)
            begin
              reg107 <= $unsigned(wire93);
              reg108 <= (8'h9d);
              reg109 <= $signed($unsigned(($unsigned({wire78}) ?
                  {(wire70 * (8'ha4))} : $signed((reg104 ?
                      (8'haa) : reg107)))));
              reg110 <= $signed(((reg104 != reg90[(3'h4):(2'h2)]) << ($signed((wire76 ?
                  reg110 : wire77)) >>> $unsigned($signed(wire70)))));
              reg111 <= (~^$unsigned(reg87));
            end
          else
            begin
              reg107 <= (wire93 >> $unsigned($unsigned((|$signed(wire95)))));
              reg108 <= {{$unsigned((((8'h9d) ?
                          reg89 : reg111) || $unsigned(reg87))),
                      wire73}};
              reg109 <= (8'ha1);
              reg110 <= $unsigned($signed($unsigned({reg113})));
              reg111 <= wire77;
            end
          reg112 <= (|reg113);
        end
      reg116 <= (^~(8'hb5));
      reg117 <= (^~reg86);
    end
endmodule
