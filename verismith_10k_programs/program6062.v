module top
#(parameter param196 = ({({{(7'h40)}, (^(8'hb0))} > ((~(8'ha9)) <<< (!(8'ha6))))} - ((~&(((8'hb9) != (8'h9f)) ? ((7'h42) | (8'hbb)) : {(8'hbf), (8'hae)})) ? ((~^((8'hbe) & (8'haf))) + (~&(8'hab))) : (^(^~((8'hb5) >>> (8'had)))))), 
parameter param197 = (7'h40))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h209):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire signed [(3'h4):(1'h0)] wire195;
  wire [(4'he):(1'h0)] wire194;
  wire signed [(4'hd):(1'h0)] wire193;
  wire signed [(4'ha):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire178;
  wire [(4'hf):(1'h0)] wire180;
  wire signed [(5'h14):(1'h0)] wire191;
  reg [(5'h13):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg188 = (1'h0);
  reg [(3'h4):(1'h0)] reg187 = (1'h0);
  reg [(4'hd):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg185 = (1'h0);
  reg [(2'h3):(1'h0)] reg184 = (1'h0);
  reg [(3'h5):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire193,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire178,
                 wire180,
                 wire191,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = ((|((wire3[(4'he):(4'hd)] == wire0[(3'h6):(3'h6)]) ?
                         wire1[(1'h0):(1'h0)] : {((8'h9e) ^~ wire3)})) ?
                     wire0 : (wire3[(4'hf):(4'ha)] - (wire1 + wire2)));
  assign wire5 = wire2[(2'h3):(2'h3)];
  assign wire6 = wire3[(4'h9):(3'h7)];
  assign wire7 = {$signed((-$signed($unsigned((8'haa))))),
                     (~&($unsigned(wire4[(2'h3):(1'h0)]) * wire0[(3'h4):(2'h3)]))};
  assign wire8 = ((((~^$unsigned(wire2)) & (~|wire3[(2'h3):(1'h1)])) | wire0) ?
                     wire7 : wire1);
  always
    @(posedge clk) begin
      reg9 <= $unsigned(wire1[(2'h3):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg10 <= (|wire3[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire6[(3'h5):(2'h3)])))
        begin
          reg11 <= $signed($signed((8'hb7)));
          if (((-$signed(($unsigned(reg10) >>> (8'hbd)))) ?
              $unsigned(wire3) : (|reg10[(1'h1):(1'h1)])))
            begin
              reg12 <= wire8[(3'h4):(1'h0)];
              reg13 <= wire7[(3'h4):(2'h2)];
            end
          else
            begin
              reg12 <= ((~&reg11[(4'hb):(2'h2)]) * {reg13[(4'hd):(3'h7)],
                  $signed($unsigned({reg12, wire2}))});
              reg13 <= $unsigned((~$signed($unsigned($signed(wire2)))));
              reg14 <= (reg11 + (reg11 ?
                  {(~&$signed(reg9))} : (wire5 * (~&(|(8'hb7))))));
            end
          reg15 <= reg13;
          reg16 <= ($signed(reg15) >>> ($signed($signed((wire7 ?
                  wire4 : reg13))) ?
              ({(wire3 ? reg15 : wire7),
                  $signed(wire7)} >> wire0) : reg13[(4'h9):(4'h8)]));
        end
      else
        begin
          if ((|($unsigned($signed({wire8,
              reg14})) * $signed($signed(reg16[(2'h2):(1'h0)])))))
            begin
              reg11 <= $unsigned($unsigned(($signed((reg10 ?
                  (8'hbe) : (7'h44))) <<< (8'haf))));
              reg12 <= $signed(reg14);
            end
          else
            begin
              reg11 <= (-(wire8[(3'h4):(2'h2)] ? reg10 : (8'ha0)));
              reg12 <= $signed(($signed(((reg11 ?
                  reg13 : reg10) || $unsigned(reg12))) >= wire0[(1'h1):(1'h0)]));
              reg13 <= ((wire6 ?
                  ($unsigned({wire6, reg9}) ?
                      (|(~wire8)) : wire4) : (!$unsigned(reg14))) && $signed(($unsigned(wire4) ?
                  ((reg9 * reg10) ?
                      reg9[(3'h5):(1'h1)] : (8'hbd)) : ((~&wire5) & (wire8 != wire7)))));
              reg14 <= {(($unsigned((reg11 >= wire4)) > wire1[(1'h1):(1'h0)]) > ((reg13 ?
                      reg13[(4'hb):(3'h6)] : wire7[(3'h5):(3'h5)]) && (-(wire8 ?
                      reg13 : wire7)))),
                  ($unsigned(((8'hb4) ? (wire1 * reg14) : {wire1, reg12})) ?
                      (reg13 ?
                          {(reg9 ?
                                  wire0 : reg10)} : wire8[(2'h2):(2'h2)]) : ({wire4[(3'h5):(3'h5)]} || reg12[(3'h4):(2'h3)]))};
              reg15 <= reg15;
            end
          reg16 <= $signed((8'hb9));
          reg17 <= $signed(wire5);
          if (wire7[(3'h6):(1'h0)])
            begin
              reg18 <= (reg16 & $unsigned(reg16[(1'h0):(1'h0)]));
              reg19 <= reg13[(4'hc):(4'ha)];
              reg20 <= reg11;
              reg21 <= {{$signed($signed(wire8[(1'h1):(1'h0)])),
                      $signed($unsigned((7'h41)))},
                  (|reg13)};
            end
          else
            begin
              reg18 <= reg13[(4'hb):(4'hb)];
            end
          reg22 <= ($unsigned(((-reg18) >= $signed((~&reg18)))) && wire7[(4'h9):(3'h7)]);
        end
      reg23 <= $signed({reg10[(3'h4):(1'h1)]});
    end
  assign wire24 = ((^~reg15[(4'ha):(3'h6)]) ?
                      wire8 : ((~|$signed((wire8 + reg13))) == reg10[(1'h1):(1'h1)]));
  assign wire25 = {((~|{$unsigned(reg11), (~|reg14)}) ?
                          (wire24[(3'h7):(2'h2)] >= $signed({wire7,
                              wire2})) : wire6[(4'h8):(3'h6)])};
  assign wire26 = (-$unsigned($signed(({wire25, wire24} ?
                      wire24 : (wire7 >> reg11)))));
  assign wire27 = (8'hb6);
  assign wire28 = ((~wire1[(2'h2):(2'h2)]) ?
                      $unsigned(wire8) : ($signed(wire26[(4'ha):(4'h8)]) ?
                          {(^$unsigned(reg19)),
                              wire5} : ((reg18[(5'h13):(3'h5)] ?
                                  (wire6 > wire2) : reg15) ?
                              (+reg9) : reg15)));
  module29 #() modinst179 (.wire31(wire7), .wire30(reg18), .clk(clk), .y(wire178), .wire32(wire24), .wire33(reg16));
  assign wire180 = reg20[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      if ((|$unsigned((7'h42))))
        begin
          reg181 <= reg9[(1'h0):(1'h0)];
        end
      else
        begin
          if ((reg19 ?
              ((reg14[(3'h6):(3'h5)] != $unsigned((&wire28))) >> (reg181 != $signed((8'hb8)))) : wire8[(3'h7):(3'h4)]))
            begin
              reg181 <= (^(~$signed(wire27)));
              reg182 <= $signed({($signed(wire26) ?
                      $signed((reg20 * wire6)) : (wire25 ?
                          $unsigned(reg9) : (7'h42))),
                  wire0[(1'h1):(1'h1)]});
            end
          else
            begin
              reg181 <= (~|$unsigned($unsigned($signed(wire3[(4'h9):(2'h3)]))));
              reg182 <= reg23[(5'h14):(1'h1)];
              reg183 <= wire180[(4'hc):(4'h9)];
              reg184 <= wire27[(4'h9):(2'h3)];
            end
          reg185 <= wire1[(2'h3):(1'h1)];
        end
      reg186 <= $signed(wire2[(3'h6):(2'h3)]);
      if (wire2[(2'h3):(2'h2)])
        begin
          if ({(($signed((^~reg21)) ?
                      ((reg9 ? wire25 : wire4) <= (wire7 ?
                          (8'hae) : wire8)) : $unsigned(wire7)) ?
                  ((((8'hbe) ? reg20 : wire7) ? reg15 : reg184) ?
                      $unsigned(reg12) : $signed((^reg21))) : (reg182[(2'h3):(1'h0)] ?
                      $signed((wire8 ~^ (8'ha1))) : (~$unsigned(wire0)))),
              (~^$unsigned(($signed(reg184) ?
                  reg19[(4'hc):(4'hb)] : (wire6 ? wire3 : wire7))))})
            begin
              reg187 <= (wire5[(3'h4):(2'h3)] && reg12[(4'hf):(3'h6)]);
            end
          else
            begin
              reg187 <= $signed($signed((reg11[(4'hb):(4'h8)] ?
                  $unsigned((reg15 <= wire2)) : (wire3[(1'h0):(1'h0)] && ((8'hb4) ?
                      (8'ha1) : reg181)))));
              reg188 <= $unsigned($signed((8'ha3)));
              reg189 <= (($unsigned(reg12) ?
                  (^reg186) : $signed((~&(wire28 * wire6)))) * reg183);
            end
          reg190 <= $unsigned($signed({((wire8 ~^ (7'h41)) ?
                  reg189[(3'h5):(2'h2)] : $unsigned(wire7)),
              ((reg14 << (8'hb7)) ? $unsigned(wire4) : (8'hb6))}));
        end
      else
        begin
          if ($unsigned((~($unsigned(wire5) ?
              $unsigned(wire28[(2'h2):(2'h2)]) : $unsigned((reg11 ?
                  reg15 : reg14))))))
            begin
              reg187 <= {($signed(($signed(reg186) ?
                          {reg183} : $signed(wire6))) ?
                      $unsigned((~^reg183[(3'h5):(3'h4)])) : ($unsigned(reg16) ?
                          $signed($signed(wire2)) : $unsigned(wire178)))};
            end
          else
            begin
              reg187 <= $signed(reg187[(3'h4):(1'h0)]);
            end
        end
    end
  module34 #() modinst192 (wire191, clk, reg182, reg181, wire178, reg189, reg11);
  assign wire193 = wire25;
  assign wire194 = ((!reg189) <<< $signed(((wire1[(3'h4):(2'h3)] >= (~wire6)) ?
                       ((~^reg182) && (reg23 || wire24)) : (wire25 != $unsigned(wire178)))));
  assign wire195 = reg189[(3'h6):(3'h5)];
endmodule

module module29
#(parameter param176 = {((({(8'hbe), (8'hbf)} ? {(8'hae)} : {(8'haf), (8'h9f)}) != (~((8'ha9) & (8'ha4)))) ? (^{((8'hbb) ? (8'hbe) : (8'ha6)), ((8'hb1) ? (8'ha5) : (8'hb8))}) : (8'hb4)), ((({(8'hb4), (8'ha7)} ~^ (~|(8'h9d))) ^~ (|((8'h9f) ~^ (8'haa)))) == ((|(+(7'h42))) ? (~&((8'ha6) - (8'hb0))) : ({(8'hac)} & ((8'ha7) >> (8'hbd)))))}, 
parameter param177 = ((~&param176) & param176))
(y, clk, wire30, wire31, wire32, wire33);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire30;
  input wire signed [(5'h12):(1'h0)] wire31;
  input wire signed [(4'hb):(1'h0)] wire32;
  input wire [(4'hd):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire171;
  wire signed [(5'h13):(1'h0)] wire170;
  wire signed [(4'hf):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire125;
  wire [(4'h8):(1'h0)] wire127;
  wire signed [(4'hf):(1'h0)] wire128;
  wire signed [(5'h14):(1'h0)] wire144;
  wire signed [(4'hb):(1'h0)] wire167;
  reg signed [(3'h5):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg172 = (1'h0);
  reg [(4'h9):(1'h0)] reg169 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire71,
                 wire73,
                 wire74,
                 wire75,
                 wire76,
                 wire77,
                 wire125,
                 wire127,
                 wire128,
                 wire144,
                 wire167,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg169,
                 (1'h0)};
  module34 #() modinst72 (wire71, clk, wire33, wire30, wire31, wire32, (8'hb5));
  assign wire73 = (|(~^wire71));
  assign wire74 = wire73;
  assign wire75 = {(wire30 ?
                          $signed($unsigned(wire32[(2'h3):(2'h3)])) : (~|($unsigned(wire30) ?
                              $unsigned(wire31) : {wire32})))};
  assign wire76 = {{(wire31[(3'h6):(3'h4)] ?
                              ((^~(8'haa)) <= {wire30,
                                  wire33}) : ($signed(wire32) ?
                                  (wire71 >= wire30) : (wire73 ?
                                      (8'hae) : wire75))),
                          {((~|wire32) ~^ (-wire33))}}};
  assign wire77 = wire31[(4'hd):(3'h5)];
  module78 #() modinst126 (wire125, clk, wire73, wire32, wire71, wire76);
  assign wire127 = wire76;
  assign wire128 = $signed(wire31);
  module129 #() modinst145 (wire144, clk, wire128, wire30, wire74, wire76);
  module146 #() modinst168 (.y(wire167), .wire150(wire125), .clk(clk), .wire149(wire71), .wire147(wire128), .wire148(wire75), .wire151(wire144));
  always
    @(posedge clk) begin
      reg169 <= ($unsigned(($unsigned((wire128 ? wire31 : wire125)) ^ (wire144 ?
          $unsigned((8'h9f)) : (-wire128)))) < wire125[(4'h8):(2'h2)]);
    end
  assign wire170 = wire32[(3'h6):(1'h0)];
  assign wire171 = ({wire31[(2'h2):(2'h2)]} ?
                       wire125[(3'h4):(2'h2)] : $signed(wire71));
  always
    @(posedge clk) begin
      reg172 <= reg169;
      if ($unsigned(((wire167[(2'h3):(2'h3)] || wire75[(1'h1):(1'h1)]) ?
          wire77 : (-(wire144[(4'hc):(4'hc)] <<< wire75)))))
        begin
          reg173 <= (8'hac);
          reg174 <= reg172[(3'h4):(2'h2)];
        end
      else
        begin
          reg173 <= $signed(wire71);
        end
      reg175 <= reg169;
    end
endmodule

module module146
#(parameter param166 = {(~&(^~{((8'hbb) - (8'hbd)), (~|(8'ha0))})), (((8'hba) ^ {(!(8'h9c)), (-(7'h43))}) >= (7'h42))})
(y, clk, wire151, wire150, wire149, wire148, wire147);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire151;
  input wire signed [(4'hd):(1'h0)] wire150;
  input wire [(2'h3):(1'h0)] wire149;
  input wire signed [(4'hd):(1'h0)] wire148;
  input wire [(3'h6):(1'h0)] wire147;
  wire signed [(4'hd):(1'h0)] wire165;
  wire [(4'hb):(1'h0)] wire164;
  wire signed [(5'h10):(1'h0)] wire161;
  wire signed [(2'h3):(1'h0)] wire160;
  wire signed [(3'h4):(1'h0)] wire159;
  wire [(4'ha):(1'h0)] wire157;
  wire signed [(2'h2):(1'h0)] wire156;
  wire [(3'h4):(1'h0)] wire155;
  wire signed [(3'h4):(1'h0)] wire154;
  wire [(4'hb):(1'h0)] wire153;
  reg [(4'hc):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire161,
                 wire160,
                 wire159,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 reg163,
                 reg162,
                 reg158,
                 reg152,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg152 <= ({(({wire150} * ((8'h9d) ? wire151 : wire150)) ?
                  wire147[(1'h0):(1'h0)] : $signed($unsigned(wire147))),
              $unsigned(((8'hae) ? wire147[(3'h5):(1'h0)] : {wire147}))} ?
          $unsigned(wire150) : $signed(wire150[(4'hc):(1'h1)]));
    end
  assign wire153 = $unsigned($unsigned(wire147));
  assign wire154 = (~|(((^$unsigned(wire149)) ?
                           wire150 : wire148[(2'h3):(2'h3)]) ?
                       {($signed(wire147) | (wire151 ? reg152 : wire150)),
                           (~&$signed(wire150))} : ($unsigned({wire148}) ?
                           wire147[(1'h1):(1'h0)] : $signed($signed(wire150)))));
  assign wire155 = (-(({$unsigned(wire153)} != $unsigned(reg152[(3'h7):(3'h4)])) ?
                       (wire149 ?
                           (|(wire150 || wire151)) : $signed($unsigned(wire149))) : wire149));
  assign wire156 = $signed({(+{reg152[(1'h1):(1'h1)], $unsigned(wire149)})});
  assign wire157 = reg152[(4'h9):(2'h3)];
  always
    @(posedge clk) begin
      reg158 <= {(~$unsigned({$unsigned(wire157)})), wire147[(2'h2):(2'h2)]};
    end
  assign wire159 = $unsigned(wire157);
  assign wire160 = ($signed($unsigned(reg152)) ?
                       (|($unsigned({wire155, wire150}) ?
                           wire149[(2'h2):(1'h1)] : ((wire156 ^~ wire148) << wire151[(4'ha):(1'h1)]))) : wire149[(1'h1):(1'h1)]);
  assign wire161 = wire160;
  always
    @(posedge clk) begin
      reg162 <= wire156[(1'h1):(1'h0)];
      reg163 <= {$unsigned((+wire150[(4'ha):(4'h9)])),
          (|($unsigned((8'hb5)) ?
              ($signed(wire147) ?
                  ((8'ha0) ?
                      wire157 : wire157) : (8'had)) : (wire153 & reg152)))};
    end
  assign wire164 = (wire157[(3'h5):(2'h3)] ^~ ($signed(wire149[(1'h0):(1'h0)]) || $signed($signed((wire154 + wire151)))));
  assign wire165 = (~^wire160);
endmodule

module module129
#(parameter param142 = (&((({(8'hbc)} ? (+(8'haa)) : ((8'ha4) >= (8'h9f))) ? {{(8'hb6), (8'h9e)}} : (~|((8'hb6) < (8'ha2)))) * (^~(((7'h40) ? (8'hb3) : (8'haf)) ? ((8'hbd) ? (8'h9c) : (7'h40)) : {(8'ha8), (8'ha5)})))), 
parameter param143 = param142)
(y, clk, wire133, wire132, wire131, wire130);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire133;
  input wire [(4'ha):(1'h0)] wire132;
  input wire [(4'hd):(1'h0)] wire131;
  input wire signed [(3'h5):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire141;
  wire signed [(5'h13):(1'h0)] wire140;
  wire [(4'hd):(1'h0)] wire139;
  wire [(5'h10):(1'h0)] wire138;
  wire [(5'h11):(1'h0)] wire137;
  wire signed [(4'hb):(1'h0)] wire136;
  wire signed [(3'h4):(1'h0)] wire135;
  wire signed [(5'h12):(1'h0)] wire134;
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 (1'h0)};
  assign wire134 = $signed($signed((^~(~$signed(wire131)))));
  assign wire135 = {(wire130 << $unsigned(wire133[(4'he):(1'h0)])),
                       $signed(wire133)};
  assign wire136 = wire134[(3'h7):(3'h4)];
  assign wire137 = (+wire134[(4'hc):(1'h0)]);
  assign wire138 = wire133[(4'ha):(3'h4)];
  assign wire139 = wire133[(1'h1):(1'h0)];
  assign wire140 = wire132[(4'h9):(4'h8)];
  assign wire141 = $unsigned({(|wire133[(3'h7):(3'h6)])});
endmodule

module module78  (y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire82;
  input wire signed [(4'h8):(1'h0)] wire81;
  input wire signed [(4'hf):(1'h0)] wire80;
  input wire [(3'h5):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire103;
  wire [(3'h5):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire89;
  wire [(5'h10):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire87;
  wire signed [(3'h4):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  reg signed [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire103,
                 wire102,
                 wire101,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
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
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire83 = wire80;
  assign wire84 = ($signed($signed(($unsigned(wire83) || (wire83 >= wire79)))) > $signed((8'hba)));
  assign wire85 = wire79;
  assign wire86 = $unsigned((~^wire85));
  assign wire87 = wire84;
  assign wire88 = (8'hbb);
  assign wire89 = (!$unsigned($unsigned($unsigned((wire88 ?
                      wire84 : wire82)))));
  assign wire90 = wire83;
  assign wire91 = $unsigned((^($signed((^wire79)) ?
                      $unsigned(wire79) : ({wire85, wire86} ?
                          wire81[(1'h0):(1'h0)] : (~wire83)))));
  always
    @(posedge clk) begin
      reg92 <= wire88[(5'h10):(4'hf)];
      if ((!$signed($unsigned($unsigned($signed(wire91))))))
        begin
          reg93 <= wire80;
          if ($signed((+(wire85[(1'h0):(1'h0)] < {wire84,
              $unsigned((8'ha0))}))))
            begin
              reg94 <= wire82;
            end
          else
            begin
              reg94 <= $unsigned((wire86[(2'h3):(1'h1)] <= (~^$signed((wire79 != wire81)))));
              reg95 <= wire79[(2'h2):(1'h0)];
            end
          if ({{(-wire89)}})
            begin
              reg96 <= $unsigned(reg94[(4'hd):(2'h3)]);
              reg97 <= (8'hb7);
              reg98 <= {(((-wire86[(3'h4):(3'h4)]) ?
                          ({wire83} ? (~reg96) : (8'ha5)) : (8'ha7)) ?
                      {(~^(^wire85))} : $unsigned((^~(reg95 ?
                          (8'hb0) : wire90))))};
              reg99 <= wire90;
            end
          else
            begin
              reg96 <= (($unsigned((8'hb4)) ?
                      $unsigned($signed((wire85 == wire86))) : (-{reg94,
                          reg92[(3'h7):(3'h7)]})) ?
                  (+(wire87[(2'h3):(2'h2)] > wire81)) : wire87);
              reg97 <= $unsigned(wire86);
            end
        end
      else
        begin
          reg93 <= reg94[(4'hd):(3'h7)];
          if ((~&$unsigned(wire90[(2'h2):(1'h1)])))
            begin
              reg94 <= $unsigned(((($signed((8'hb0)) >= (wire85 ?
                          wire79 : wire82)) ?
                      wire79 : ($unsigned(wire82) ?
                          wire80[(1'h1):(1'h0)] : (wire89 <<< wire80))) ?
                  $signed(($unsigned(wire80) ?
                      (wire85 <<< reg97) : (!wire87))) : wire82[(3'h6):(2'h3)]));
              reg95 <= (^((wire85 << wire82) ?
                  (((^~wire88) * $signed((8'hab))) ?
                      $unsigned($unsigned(wire85)) : wire83[(1'h1):(1'h0)]) : (^~wire90[(2'h3):(1'h0)])));
              reg96 <= {wire82[(2'h2):(1'h1)]};
              reg97 <= ((8'hb4) ?
                  $unsigned((($signed(wire86) - wire87[(4'hf):(4'he)]) ?
                      ($unsigned(wire80) ?
                          $unsigned(wire90) : (wire79 ?
                              wire85 : wire82)) : wire89)) : $unsigned((-$signed($unsigned(wire85)))));
            end
          else
            begin
              reg94 <= reg92;
              reg95 <= $unsigned((wire81[(1'h1):(1'h0)] ?
                  reg98[(1'h1):(1'h0)] : (&$signed($unsigned(wire88)))));
              reg96 <= reg92[(3'h6):(3'h4)];
            end
          reg98 <= ($signed($signed(reg96[(4'hd):(2'h3)])) ?
              reg94[(3'h5):(2'h3)] : {($unsigned($signed(wire79)) + (+wire91))});
        end
      reg100 <= ({(reg99[(1'h1):(1'h1)] & wire82)} ?
          {{$signed(wire89[(3'h6):(3'h6)]),
                  ($signed(reg96) + wire81[(2'h2):(1'h0)])}} : (8'ha6));
    end
  assign wire101 = wire88[(4'h8):(4'h8)];
  assign wire102 = wire79;
  assign wire103 = $unsigned(((+reg97) ?
                       {wire87, $unsigned((!wire81))} : ({(reg100 ?
                               (8'h9d) : wire79),
                           reg97[(1'h1):(1'h1)]} && {$unsigned(reg98),
                           (reg97 ? wire81 : wire102)})));
  always
    @(posedge clk) begin
      reg104 <= ((+reg96[(4'hb):(1'h1)]) * $unsigned(((((8'h9e) ?
              wire91 : wire79) & (wire82 ? reg97 : reg100)) ?
          ((reg97 ? wire81 : wire101) ?
              (wire101 ?
                  (7'h44) : reg95) : wire81) : $signed(wire83[(2'h2):(1'h1)]))));
      if (reg95)
        begin
          reg105 <= $signed(wire85[(1'h1):(1'h0)]);
          reg106 <= $signed(((~|$signed((reg95 ~^ (8'hb6)))) ?
              (^~(~^((8'h9e) | (8'ha9)))) : wire91));
        end
      else
        begin
          reg105 <= $signed(wire89);
          reg106 <= (((&$unsigned((reg105 >> wire86))) ?
                  (((+reg105) - {wire83}) ~^ $unsigned($unsigned(reg98))) : {$unsigned(wire84[(1'h1):(1'h0)])}) ?
              ({$signed(wire81)} ?
                  $signed(({reg104} ?
                      (wire79 ?
                          wire86 : reg93) : $signed(reg99))) : (!wire91)) : (+(~&((~|reg100) << reg93[(1'h1):(1'h1)]))));
          if ((8'hba))
            begin
              reg107 <= wire80;
              reg108 <= (&$signed(wire103[(1'h1):(1'h1)]));
              reg109 <= wire90;
              reg110 <= $signed(reg99[(4'h8):(3'h4)]);
              reg111 <= ((wire101 ?
                      $unsigned($signed(reg94)) : $unsigned($signed((wire80 ?
                          reg96 : reg92)))) ?
                  $unsigned(((wire103 + $signed(reg105)) * wire90[(4'hf):(3'h4)])) : (reg107 ?
                      $signed($signed($signed(wire80))) : $unsigned((wire103 ?
                          reg95[(2'h2):(1'h0)] : (~|(8'ha4))))));
            end
          else
            begin
              reg107 <= reg92;
            end
          reg112 <= (~&(+(($signed(wire79) && (~|wire83)) ?
              $unsigned($unsigned(wire88)) : {(~reg92), {wire82, reg110}})));
        end
      reg113 <= ({$signed($signed((wire84 ? (8'hba) : wire79))),
              reg111[(3'h5):(3'h4)]} ?
          wire103 : reg100[(3'h5):(3'h5)]);
      reg114 <= (^reg100[(3'h5):(3'h4)]);
      reg115 <= {$unsigned(wire88[(1'h1):(1'h1)]), reg100};
    end
  assign wire116 = (($signed((wire103[(3'h7):(3'h6)] ?
                       (8'hba) : (~|reg105))) ^~ (reg114[(1'h1):(1'h1)] != ((&wire89) ?
                       wire89[(3'h7):(2'h2)] : (reg107 * (8'ha4))))) * $unsigned($signed((wire102 * reg108[(2'h3):(1'h1)]))));
  assign wire117 = $signed($signed($unsigned({$unsigned(reg115),
                       wire89[(4'h9):(4'h9)]})));
  assign wire118 = (~reg104);
  always
    @(posedge clk) begin
      reg119 <= ($unsigned((((reg93 < (7'h41)) < (reg100 >> reg110)) ?
          ((reg93 << wire118) ?
              $signed(reg100) : (-reg114)) : wire118[(4'hc):(4'h8)])) + {reg109});
      reg120 <= (&(^~(^~(reg119[(1'h1):(1'h0)] ? wire85 : (~reg107)))));
    end
  always
    @(posedge clk) begin
      reg121 <= reg97;
      reg122 <= (!reg96[(4'hc):(3'h4)]);
      if (((~&{($unsigned((8'hb3)) ? (reg113 || reg96) : wire90[(2'h3):(1'h1)]),
              $signed(wire88)}) ?
          ((reg113[(2'h3):(2'h3)] ?
                  wire90 : (reg106[(1'h1):(1'h0)] ~^ (wire80 <= reg96))) ?
              $signed(($unsigned((8'had)) ?
                  (reg97 <<< reg109) : $unsigned(reg106))) : $signed($unsigned((wire117 ?
                  reg122 : reg119)))) : $unsigned($unsigned(wire82[(3'h6):(3'h5)]))))
        begin
          reg123 <= ({$signed(((reg120 > wire103) < $unsigned((8'h9d))))} ?
              $unsigned((wire91[(2'h3):(1'h1)] ^ (8'hb8))) : wire103);
          reg124 <= wire81[(2'h2):(1'h1)];
        end
      else
        begin
          reg123 <= wire89[(3'h4):(2'h3)];
        end
    end
endmodule

module module34
#(parameter param70 = (&(((!{(8'haa), (8'had)}) >>> (((8'hbb) == (8'hbd)) ? (&(8'ha1)) : {(8'h9f), (8'had)})) ? (({(8'ha3), (8'hb7)} ~^ (-(8'hae))) ? (~^((7'h40) <<< (8'had))) : (((8'hb6) || (7'h43)) ? (!(8'hb8)) : {(8'ha1), (8'ha6)})) : ({((8'hba) ? (8'hb9) : (8'ha4))} >= (!(&(8'h9f)))))))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire39;
  input wire [(5'h14):(1'h0)] wire38;
  input wire [(5'h12):(1'h0)] wire37;
  input wire [(4'hb):(1'h0)] wire36;
  input wire [(4'hf):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire52,
                 wire51,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg54,
                 reg50,
                 reg49,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg40 <= wire36[(4'hb):(4'h8)];
    end
  assign wire41 = $signed((~|$unsigned($signed($signed(wire39)))));
  assign wire42 = {$unsigned($unsigned((wire41 || (wire35 & reg40))))};
  assign wire43 = $unsigned(wire39[(3'h6):(1'h0)]);
  assign wire44 = wire35[(3'h5):(3'h4)];
  assign wire45 = ($signed(wire37) ?
                      (|((8'hae) ?
                          (&(~&wire38)) : $unsigned((-wire36)))) : wire39);
  assign wire46 = wire35[(3'h4):(3'h4)];
  assign wire47 = $signed(wire38);
  assign wire48 = {(((~|(wire38 ? wire35 : wire44)) >> wire42) ?
                          ((wire42 ?
                              (wire44 > wire35) : (~wire37)) >>> ($signed(wire38) ?
                              (wire46 <<< wire41) : $unsigned((8'hb5)))) : wire35[(4'hb):(4'h9)])};
  always
    @(posedge clk) begin
      reg49 <= wire45;
      reg50 <= wire45;
    end
  assign wire51 = reg50;
  assign wire52 = (wire43[(4'h8):(3'h6)] ~^ wire46);
  assign wire53 = (wire41[(1'h1):(1'h0)] ?
                      $signed({{$unsigned(reg49),
                              (wire48 ?
                                  (8'hb2) : wire45)}}) : ($signed(($unsigned(wire39) > $unsigned((8'hb3)))) ^~ $unsigned($unsigned({(8'ha3)}))));
  always
    @(posedge clk) begin
      reg54 <= $unsigned($signed((^~wire38[(4'hb):(2'h2)])));
    end
  assign wire55 = wire36[(3'h4):(1'h0)];
  assign wire56 = (($unsigned((&(wire52 && reg40))) ?
                          ({wire55} >= $signed(reg54)) : {(8'hb7),
                              (((8'hb7) ? wire37 : (8'had)) >> (wire39 ?
                                  wire39 : (8'hae)))}) ?
                      (-wire55[(1'h1):(1'h0)]) : $signed((((reg54 ?
                              reg50 : wire44) << (~|wire47)) ?
                          reg49 : $signed((+reg50)))));
  assign wire57 = wire43;
  always
    @(posedge clk) begin
      if (wire36)
        begin
          reg58 <= wire53[(2'h2):(1'h1)];
          reg59 <= ((($unsigned($signed(wire57)) ?
                  wire43[(2'h3):(2'h3)] : ({reg54,
                      wire41} * wire35)) * {((&wire41) | (wire56 ?
                      wire43 : wire35))}) ?
              {wire57[(1'h1):(1'h0)]} : (-wire56));
          reg60 <= (wire45 || wire57[(1'h0):(1'h0)]);
          reg61 <= $signed(((~^(((8'hb0) ? wire46 : (8'hbb)) ?
                  $signed(reg40) : (wire51 ? (8'hb5) : (8'hb8)))) ?
              (($unsigned(wire41) + reg59) ?
                  (((8'ha4) ? reg40 : reg59) ~^ wire51) : $signed((wire55 ?
                      reg49 : wire42))) : reg40));
        end
      else
        begin
          reg58 <= wire43[(4'hd):(4'hb)];
          reg59 <= $signed($signed({{$unsigned(wire43), {wire35, reg61}}}));
        end
      reg62 <= (((($signed(wire51) & (8'ha2)) & $unsigned(wire38[(4'ha):(2'h3)])) & (!reg58[(3'h4):(2'h2)])) >> $signed(wire44));
      reg63 <= $unsigned($unsigned((({reg61} == {reg61, wire37}) ?
          ((wire42 ? reg60 : wire43) ?
              (wire35 ?
                  wire41 : wire56) : (wire39 >>> wire39)) : {(reg54 ^ wire45)})));
      reg64 <= wire36[(3'h4):(1'h1)];
    end
  assign wire65 = $signed($signed(wire36[(2'h2):(2'h2)]));
  assign wire66 = (~^(^~(~|((&reg40) ?
                      (wire47 | reg50) : wire45[(1'h0):(1'h0)]))));
  assign wire67 = (wire56 >= $signed(((+$signed(reg40)) ?
                      $signed(wire41) : $unsigned($signed(wire52)))));
  assign wire68 = wire43;
  assign wire69 = (($signed(wire46[(2'h3):(2'h3)]) ?
                          (~((wire35 < wire51) ?
                              (7'h40) : (+wire46))) : (+$unsigned((wire66 ?
                              reg63 : wire38)))) ?
                      (|$signed({(~|wire43)})) : $unsigned($signed($unsigned((~^reg59)))));
endmodule
