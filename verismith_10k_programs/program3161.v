module top
#(parameter param183 = (-(~|((~&{(8'hac)}) ? (~&(+(7'h42))) : (^~((8'hba) ? (8'hb6) : (8'hb0)))))), 
parameter param184 = ((~&param183) ? ((|param183) ~^ ((!((8'hb0) && param183)) || param183)) : (param183 ^~ (!((param183 > param183) < {param183})))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire178;
  wire [(5'h13):(1'h0)] wire177;
  wire signed [(5'h12):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire140;
  wire [(3'h5):(1'h0)] wire141;
  wire signed [(2'h3):(1'h0)] wire142;
  wire signed [(4'hc):(1'h0)] wire143;
  wire [(5'h11):(1'h0)] wire144;
  wire [(4'he):(1'h0)] wire145;
  wire signed [(4'ha):(1'h0)] wire146;
  wire [(4'hd):(1'h0)] wire147;
  wire signed [(3'h5):(1'h0)] wire148;
  wire signed [(4'hc):(1'h0)] wire149;
  wire signed [(5'h15):(1'h0)] wire150;
  wire [(5'h12):(1'h0)] wire159;
  wire [(4'hd):(1'h0)] wire160;
  wire [(4'hb):(1'h0)] wire161;
  wire signed [(4'hb):(1'h0)] wire175;
  reg [(5'h15):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg181 = (1'h0);
  reg [(4'h8):(1'h0)] reg180 = (1'h0);
  reg [(4'ha):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg154 = (1'h0);
  reg [(3'h4):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg158 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire138,
                 wire140,
                 wire141,
                 wire142,
                 wire143,
                 wire144,
                 wire145,
                 wire146,
                 wire147,
                 wire148,
                 wire149,
                 wire150,
                 wire159,
                 wire160,
                 wire161,
                 wire175,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 (1'h0)};
  module5 #() modinst139 (.wire8(wire2), .wire7(wire3), .wire9(wire4), .wire6(wire1), .clk(clk), .y(wire138));
  assign wire140 = (~|(&wire3));
  assign wire141 = {(!$unsigned((&(wire140 ? wire2 : wire138))))};
  assign wire142 = wire1[(3'h7):(2'h3)];
  assign wire143 = (|(({(|wire0),
                       (wire2 >= wire2)} | ((-wire141) - wire138)) > ($signed((wire0 & wire142)) ?
                       wire3[(3'h4):(1'h1)] : $unsigned((wire138 ?
                           wire142 : wire142)))));
  assign wire144 = $signed((wire138 ?
                       ({$signed(wire1)} ~^ ((8'haf) > (wire142 ?
                           wire142 : wire141))) : $unsigned(wire142)));
  assign wire145 = (!$unsigned(((!$signed(wire142)) ^~ ($unsigned(wire1) >>> wire3))));
  assign wire146 = (((((wire3 < wire143) ?
                           (wire140 || wire4) : (wire143 ? (8'hb6) : wire143)) ?
                       ((wire140 ? wire3 : wire4) <= (wire145 ?
                           wire1 : wire145)) : $signed((wire2 ^~ wire142))) || $unsigned(((wire140 + wire142) ?
                       $signed((8'ha1)) : $signed(wire144)))) << (wire3 >>> (wire4 > (+$signed(wire145)))));
  assign wire147 = $signed($signed(wire145[(3'h6):(1'h1)]));
  assign wire148 = ($unsigned(wire2) > ((&$signed((-wire140))) > wire3[(2'h2):(2'h2)]));
  assign wire149 = {wire140[(3'h4):(3'h4)],
                       ((|$unsigned(wire2)) && (^~(wire147 - wire146[(4'ha):(3'h5)])))};
  assign wire150 = (~^wire2);
  always
    @(posedge clk) begin
      reg151 <= (($unsigned((!(~wire143))) > wire2) ?
          (wire150[(5'h15):(1'h1)] & $unsigned((|(wire138 ?
              wire148 : (8'hb9))))) : (~|$unsigned({wire145})));
      if (((((wire150 == wire2[(4'ha):(4'h9)]) << wire3[(3'h4):(3'h4)]) ?
              (($unsigned(wire148) ?
                  (wire3 != wire149) : {wire0, wire145}) < ((wire144 ?
                  wire143 : wire142) <<< (wire1 ?
                  wire2 : wire141))) : ($signed((wire143 ^~ wire2)) ^ wire2)) ?
          $signed($unsigned($unsigned(wire148))) : ((((~|wire140) ?
                  (wire144 ?
                      wire144 : (8'haf)) : {wire144}) != $signed(wire150[(5'h10):(4'he)])) ?
              wire146 : ($unsigned(wire149[(4'ha):(4'h8)]) ?
                  wire146[(3'h6):(3'h6)] : $unsigned($signed((8'ha1)))))))
        begin
          reg152 <= $signed(({(+$unsigned(wire4))} ?
              (~|$signed(wire150)) : $signed(((wire142 ^ reg151) ?
                  $signed((8'ha3)) : wire142))));
          if ((8'ha1))
            begin
              reg153 <= $unsigned(wire143[(3'h7):(1'h1)]);
              reg154 <= wire138;
              reg155 <= (((^(&wire141)) * wire140[(3'h6):(2'h2)]) ?
                  ({wire4} >= reg154[(2'h3):(1'h1)]) : ($unsigned({wire142}) >> wire143));
            end
          else
            begin
              reg153 <= wire145;
              reg154 <= reg151;
              reg155 <= {wire140,
                  $signed($signed((wire144[(5'h10):(4'h9)] <= $unsigned(wire149))))};
            end
          reg156 <= (~|wire145);
          reg157 <= $unsigned($unsigned(wire141[(1'h1):(1'h0)]));
        end
      else
        begin
          reg152 <= $signed((~reg151));
        end
      reg158 <= $unsigned({(^($unsigned(wire147) && $signed(wire3))),
          (wire0[(2'h3):(1'h0)] ? (7'h42) : $signed(wire148))});
    end
  assign wire159 = $signed($signed(reg155[(1'h1):(1'h1)]));
  assign wire160 = wire159[(3'h5):(1'h1)];
  assign wire161 = $unsigned($unsigned((wire143 * ($signed(wire3) * wire143[(2'h3):(2'h3)]))));
  module162 #() modinst176 (wire175, clk, wire4, reg158, wire147, wire138);
  assign wire177 = $signed(wire3[(2'h3):(1'h1)]);
  assign wire178 = $unsigned({{((wire145 < wire142) ^ (-reg158))}, wire175});
  always
    @(posedge clk) begin
      reg179 <= wire161;
      reg180 <= wire149;
      reg181 <= $signed(wire4);
      reg182 <= {($signed(wire149[(4'h9):(3'h6)]) ? wire2 : reg181)};
    end
endmodule

module module162
#(parameter param174 = (~((!(-((8'hb6) - (8'haf)))) >= (~((~^(7'h43)) << ((8'h9c) >>> (8'hb1)))))))
(y, clk, wire166, wire165, wire164, wire163);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire166;
  input wire signed [(3'h5):(1'h0)] wire165;
  input wire signed [(2'h3):(1'h0)] wire164;
  input wire signed [(3'h7):(1'h0)] wire163;
  wire [(2'h3):(1'h0)] wire173;
  wire signed [(5'h14):(1'h0)] wire170;
  wire [(4'he):(1'h0)] wire169;
  wire signed [(2'h3):(1'h0)] wire168;
  wire [(5'h14):(1'h0)] wire167;
  reg signed [(5'h13):(1'h0)] reg172 = (1'h0);
  reg [(5'h10):(1'h0)] reg171 = (1'h0);
  assign y = {wire173,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 reg172,
                 reg171,
                 (1'h0)};
  assign wire167 = wire164[(2'h2):(1'h1)];
  assign wire168 = wire167;
  assign wire169 = (-(wire163 ?
                       wire168 : $unsigned(((+(8'h9d)) ?
                           (wire164 ? wire167 : (8'ha8)) : $signed(wire164)))));
  assign wire170 = $unsigned(({$signed((wire164 ? wire164 : (8'ha0)))} ?
                       $signed((8'hb4)) : $signed(wire165[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg171 <= wire170[(3'h7):(2'h3)];
      reg172 <= wire168;
    end
  assign wire173 = wire165[(1'h0):(1'h0)];
endmodule

module module5
#(parameter param136 = ({(+(((7'h42) >> (8'hb7)) >> {(8'ha3)}))} ? {(-(((8'hae) <= (8'h9e)) ? ((8'ha8) - (8'hb7)) : (8'ha7)))} : ((((&(8'haf)) ? ((7'h41) ? (8'h9d) : (8'ha8)) : ((8'had) ? (7'h44) : (8'hb9))) & (((8'hab) << (7'h43)) ? (+(8'hb0)) : {(8'haa), (8'ha1)})) >> {(!(^~(8'ha9)))})), 
parameter param137 = param136)
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h209):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire131;
  wire [(3'h4):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire10;
  reg signed [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(5'h12):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  assign y = {wire131,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire41,
                 wire40,
                 wire37,
                 wire36,
                 wire35,
                 wire24,
                 wire10,
                 reg135,
                 reg134,
                 reg133,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg38,
                 reg39,
                 (1'h0)};
  assign wire10 = wire7;
  always
    @(posedge clk) begin
      if ($signed(wire7[(1'h1):(1'h1)]))
        begin
          if ($signed({wire7}))
            begin
              reg11 <= ((({(!wire6), (^~wire7)} ?
                      wire10[(3'h7):(1'h1)] : (-$unsigned((8'hb4)))) ?
                  ($unsigned($signed(wire10)) & wire7[(2'h2):(2'h2)]) : (^~(8'ha8))) != (wire6 << ($unsigned($signed(wire8)) && (!((7'h44) > (7'h44))))));
              reg12 <= $signed(reg11);
              reg13 <= (wire7 < $unsigned({$signed($signed(wire10))}));
            end
          else
            begin
              reg11 <= reg12;
            end
          reg14 <= reg12;
        end
      else
        begin
          reg11 <= (!(-wire9));
          reg12 <= (^(((8'hbf) & reg13) != (|$signed(wire6[(2'h2):(1'h1)]))));
        end
      reg15 <= (wire6[(1'h0):(1'h0)] || $unsigned($unsigned($unsigned($signed(wire10)))));
      if ($unsigned($signed({reg15[(3'h4):(2'h2)],
          (wire10[(5'h12):(4'hc)] << $signed((7'h41)))})))
        begin
          if ($signed($signed($signed($unsigned(((7'h41) ? reg12 : reg13))))))
            begin
              reg16 <= wire6[(3'h6):(3'h6)];
            end
          else
            begin
              reg16 <= ((((wire10[(3'h4):(2'h2)] <<< $signed(reg16)) ^ (wire10[(3'h6):(3'h4)] ?
                  (reg14 ?
                      wire8 : reg11) : reg12[(2'h3):(2'h3)])) != $unsigned(({reg12,
                      reg12} ?
                  (reg16 ? (8'ha7) : (7'h42)) : (^(8'hb6))))) != wire8);
              reg17 <= (((|wire6) == ($unsigned($signed(reg14)) ?
                  ({reg15} <<< wire10) : (&(reg15 <= reg13)))) <<< $unsigned((8'ha4)));
              reg18 <= (^~$unsigned(($unsigned(wire10[(1'h0):(1'h0)]) << ($unsigned(reg12) <= reg17))));
              reg19 <= (wire9 & ((((reg14 && wire8) ?
                      (reg11 ?
                          reg11 : wire9) : (reg13 < wire9)) * $unsigned($signed(reg18))) ?
                  (reg11[(2'h3):(1'h0)] < wire6[(4'he):(4'hc)]) : reg14));
            end
          reg20 <= $unsigned($signed(wire6[(4'hf):(3'h6)]));
          reg21 <= wire9;
          reg22 <= (wire7 ^ reg16[(3'h6):(2'h2)]);
        end
      else
        begin
          reg16 <= (reg19 >> ($signed($signed(reg21)) || wire7[(2'h2):(1'h0)]));
          if ((^~$signed((($signed(wire8) ? (8'hb5) : $unsigned(reg18)) ?
              wire9[(2'h2):(2'h2)] : $signed((wire7 ? (8'ha3) : reg13))))))
            begin
              reg17 <= reg12;
              reg18 <= (+$signed((|reg18)));
              reg19 <= (~|$unsigned((((reg14 > wire7) ^~ reg21) || ($unsigned((7'h40)) ?
                  (reg22 ? reg20 : wire7) : ((8'hb6) && reg22)))));
              reg20 <= ($signed((~$unsigned({reg12}))) ?
                  (wire10[(4'hb):(4'ha)] ?
                      {(^~(reg21 ? (8'hb9) : wire6)),
                          $signed($unsigned((8'ha0)))} : reg22[(1'h1):(1'h0)]) : (~reg17[(4'h9):(3'h7)]));
              reg21 <= ((reg15 ?
                  (reg18[(1'h1):(1'h1)] >= {{reg17, wire7},
                      reg12}) : $unsigned($signed({reg13,
                      reg14}))) >> $unsigned({$unsigned((~wire8)),
                  ((reg12 ? (8'hb2) : (8'hb1)) == (wire10 ~^ (8'hab)))}));
            end
          else
            begin
              reg17 <= (8'ha5);
              reg18 <= (^~wire6[(3'h5):(2'h2)]);
              reg19 <= $signed({wire10[(5'h11):(4'hf)],
                  ($signed((~reg19)) ?
                      ((reg20 ^ wire7) ?
                          wire7[(2'h2):(2'h2)] : $unsigned(reg11)) : wire8[(2'h2):(2'h2)])});
              reg20 <= wire7;
            end
          reg22 <= reg16;
        end
      reg23 <= $signed($unsigned((((reg19 < reg11) ?
          $unsigned(wire8) : (wire7 < reg15)) >> (wire9 ?
          reg21[(3'h7):(3'h4)] : reg11))));
    end
  assign wire24 = ($signed(wire7) ? reg17[(4'h8):(3'h6)] : (!reg16));
  always
    @(posedge clk) begin
      reg25 <= (reg14 & $signed((({reg14} ?
          reg22[(1'h0):(1'h0)] : $signed(wire10)) & $signed((reg23 & reg12)))));
      reg26 <= (^(reg25 >= $signed(($signed(reg23) && $signed(reg15)))));
      if ($signed({wire7,
          (wire7[(1'h1):(1'h1)] == {((8'had) ? wire10 : (8'ha7)),
              $signed((7'h43))})}))
        begin
          if ($unsigned($signed(reg17[(3'h4):(1'h0)])))
            begin
              reg27 <= $signed(reg21[(1'h1):(1'h1)]);
              reg28 <= (($unsigned($signed($unsigned(reg22))) ?
                  wire24 : $unsigned($unsigned(wire8))) < $signed(reg27[(1'h1):(1'h0)]));
              reg29 <= (((reg16 < {{reg28, reg22}}) ?
                      wire10[(5'h13):(4'hd)] : reg18) ?
                  (reg25 ?
                      (reg20 >= ($unsigned((8'hb7)) ?
                          reg23 : $unsigned(wire10))) : {$signed((&reg16)),
                          ((reg11 < wire24) * wire8[(3'h7):(3'h7)])}) : (&(reg15[(4'ha):(3'h5)] ^ (!(reg17 ?
                      reg23 : wire10)))));
            end
          else
            begin
              reg27 <= (reg12 ?
                  ((reg14[(5'h10):(4'h9)] ?
                      $unsigned(reg16) : reg27[(1'h1):(1'h0)]) & $signed(reg23[(2'h3):(2'h2)])) : wire6);
              reg28 <= ({($unsigned($unsigned(wire24)) + $signed($unsigned(reg18))),
                      wire6[(4'h8):(1'h1)]} ?
                  $unsigned(($unsigned({wire9}) < (~^(wire8 | reg11)))) : $unsigned((reg25[(3'h4):(1'h0)] >= $unsigned($unsigned(reg13)))));
              reg29 <= ($unsigned(($unsigned((7'h43)) & reg25)) ?
                  $unsigned($unsigned($signed($signed(wire7)))) : $signed(($unsigned((!(8'ha1))) ?
                      (reg12[(3'h6):(2'h2)] ? (-reg26) : (!(8'hac))) : reg25)));
            end
          reg30 <= $signed($signed($unsigned($unsigned(reg15))));
          reg31 <= (reg21[(2'h3):(2'h3)] < wire7[(2'h2):(2'h2)]);
        end
      else
        begin
          reg27 <= $unsigned(((wire8[(3'h5):(3'h5)] * $signed({reg19, reg22})) ?
              (reg12[(1'h0):(1'h0)] ?
                  $unsigned(((7'h41) & wire9)) : reg20) : (!(reg23 == reg13[(2'h3):(1'h0)]))));
          reg28 <= (|{{$signed($unsigned(wire7)), reg30[(4'he):(4'hd)]}});
          if ({$signed(reg25), (~^reg25[(1'h1):(1'h0)])})
            begin
              reg29 <= ($unsigned($unsigned((wire6 ^ (^reg26)))) ?
                  $unsigned(reg31) : reg16);
            end
          else
            begin
              reg29 <= (((-{$unsigned((8'hb8))}) ~^ (8'hb6)) ^ (($signed(wire24) >= reg26) == ((+$signed(reg13)) ^ (^~{(8'hb2)}))));
              reg30 <= ((($signed((-wire6)) - ((reg17 ?
                      reg17 : (8'hb3)) <<< reg17[(4'hb):(3'h4)])) > $signed(($signed(reg31) ?
                      reg22 : $unsigned(reg20)))) ?
                  (((&$signed(wire7)) ?
                          {$unsigned(wire9),
                              (reg29 != wire6)} : $unsigned($signed(reg18))) ?
                      {{(reg28 ? reg30 : reg13),
                              {wire7}}} : $unsigned((+(reg30 ?
                          wire10 : (8'h9c))))) : (((8'hb3) + reg27) > ((&{(8'hb8),
                      wire7}) ~^ (8'ha3))));
              reg31 <= reg15;
              reg32 <= $unsigned(reg22);
            end
        end
      reg33 <= $signed($signed($unsigned((((8'h9e) ? wire6 : reg25) ?
          $signed((8'h9d)) : (wire24 + (7'h42))))));
      reg34 <= ($signed(reg27[(1'h1):(1'h1)]) ?
          $signed($signed($unsigned($signed(reg32)))) : $unsigned(reg12));
    end
  assign wire35 = $signed(({reg18[(3'h4):(1'h0)]} ?
                      $unsigned(reg15[(4'h8):(3'h6)]) : (((8'hb7) << $unsigned(reg17)) ~^ (8'hb5))));
  assign wire36 = $unsigned($signed((+reg27)));
  assign wire37 = {$unsigned(($unsigned((wire35 >= wire24)) == (reg28 + {reg14,
                          reg20})))};
  always
    @(posedge clk) begin
      reg38 <= wire9;
      reg39 <= {(!($signed((^reg21)) <= ($signed(wire37) <= (reg29 > wire37))))};
    end
  assign wire40 = (~$unsigned((((wire36 + reg31) ?
                          reg25 : reg14[(4'h8):(3'h6)]) ?
                      wire8 : {$signed((8'had))})));
  assign wire41 = (~|(reg25[(3'h5):(1'h1)] >= $signed($unsigned($signed(reg16)))));
  module42 #() modinst76 (wire75, clk, reg16, wire10, reg20, wire8);
  assign wire77 = (^~(&(~|$signed(((8'hb0) ? wire75 : reg17)))));
  assign wire78 = $signed($unsigned({{wire24[(3'h6):(2'h2)]}, wire40}));
  assign wire79 = $signed($signed((wire37[(4'hd):(1'h0)] ?
                      $unsigned(reg19[(1'h0):(1'h0)]) : (~(~&reg25)))));
  assign wire80 = (~^(($signed(reg39[(3'h6):(1'h1)]) + reg34) || (8'hb5)));
  assign wire81 = ({(|$signed((~^wire36)))} ? wire79 : reg32);
  assign wire82 = {reg13};
  assign wire83 = ($signed($signed(((!reg38) ?
                      (&reg39) : (wire10 + reg12)))) != (({$unsigned(reg11),
                          (~|wire7)} >> (^~(reg15 ? reg19 : (8'hb0)))) ?
                      {((reg32 & wire82) ?
                              ((8'hb6) > reg29) : $unsigned((7'h41))),
                          $unsigned((wire79 ?
                              wire7 : wire9))} : {$signed((wire24 ?
                              wire41 : (8'hb4))),
                          ((reg18 == reg26) != (~^reg20))}));
  assign wire84 = wire40[(3'h7):(2'h2)];
  module85 #() modinst132 (wire131, clk, reg13, wire82, wire83, wire7, wire37);
  always
    @(posedge clk) begin
      reg133 <= {(&$signed(wire77)),
          ((7'h44) ?
              $unsigned(($signed(wire40) ?
                  $signed((8'haf)) : reg20[(1'h1):(1'h0)])) : (&(!(wire40 == reg17))))};
      reg134 <= (reg31 & (^(^reg20)));
      reg135 <= $unsigned((reg34 ? (&$signed($signed(reg39))) : reg134));
    end
endmodule

module module85
#(parameter param129 = (8'haa), 
parameter param130 = (((~|({param129} ? param129 : (~^param129))) >= (param129 ? param129 : param129)) ? (|((|(param129 <<< param129)) <= ((param129 - (8'ha7)) + (param129 << param129)))) : (|(~|param129))))
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h1cf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire90;
  input wire signed [(3'h5):(1'h0)] wire89;
  input wire signed [(4'h9):(1'h0)] wire88;
  input wire signed [(2'h2):(1'h0)] wire87;
  input wire [(3'h5):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire109;
  wire signed [(2'h3):(1'h0)] wire108;
  wire [(2'h3):(1'h0)] wire107;
  wire [(4'h9):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire105;
  wire signed [(4'hb):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire98;
  wire [(4'hd):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire94;
  wire [(4'hd):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire92;
  wire signed [(4'hc):(1'h0)] wire91;
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(3'h4):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(4'he):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
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
                 reg111,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire91 = $unsigned(((wire90 * wire90[(3'h7):(3'h7)]) ?
                      (~wire90) : {$signed((7'h41)), $signed((^~wire86))}));
  assign wire92 = wire89[(2'h3):(1'h0)];
  assign wire93 = wire88;
  assign wire94 = wire90[(1'h0):(1'h0)];
  assign wire95 = wire89[(1'h1):(1'h0)];
  assign wire96 = $unsigned((|(|(+$signed(wire87)))));
  assign wire97 = wire96[(1'h1):(1'h0)];
  assign wire98 = wire88;
  always
    @(posedge clk) begin
      reg99 <= ((~|($signed((-wire88)) ?
          wire91 : (+wire90))) || $unsigned((&wire98)));
      reg100 <= wire88;
      reg101 <= {((^~($signed(wire96) != wire87)) * (~&(^~wire97[(4'hc):(4'h8)])))};
      if ({$unsigned((!{(reg101 ? wire98 : reg100), reg100[(2'h3):(1'h1)]})),
          {$unsigned($signed((wire89 ? wire96 : wire87))),
              ($signed({wire91}) & ((!(8'hba)) ?
                  $unsigned(wire91) : wire88[(1'h0):(1'h0)]))}})
        begin
          reg102 <= wire88[(3'h6):(3'h6)];
          reg103 <= ((wire89[(3'h5):(2'h2)] ~^ (({wire90} + wire94[(4'hf):(4'h9)]) * reg100)) ?
              $unsigned(wire95[(4'he):(1'h0)]) : (8'hb0));
        end
      else
        begin
          if ($unsigned((8'hb6)))
            begin
              reg102 <= (~|(~|(~|((-(8'hac)) ?
                  (reg102 * wire94) : ((8'hab) >> wire91)))));
              reg103 <= (reg99[(3'h7):(3'h6)] ?
                  wire97 : $signed({((8'h9e) ? (wire96 & wire94) : (~&reg100)),
                      $signed((wire95 ? wire97 : reg101))}));
            end
          else
            begin
              reg102 <= wire93[(2'h2):(2'h2)];
              reg103 <= reg100[(3'h6):(3'h5)];
            end
        end
    end
  assign wire104 = (wire88 ?
                       $unsigned(reg103[(1'h0):(1'h0)]) : {wire87[(1'h0):(1'h0)],
                           $signed((wire96[(1'h1):(1'h1)] ?
                               (wire89 == wire92) : (reg102 ?
                                   wire89 : wire97)))});
  assign wire105 = $unsigned($unsigned((((~&reg100) ?
                       reg101[(2'h3):(2'h3)] : (~&wire90)) && wire98)));
  assign wire106 = $signed(((((~&reg99) ? (~^wire104) : (~&wire89)) ?
                       wire87[(2'h2):(1'h1)] : $signed($unsigned(wire86))) ^ wire93));
  assign wire107 = ((wire105[(3'h5):(1'h0)] ?
                           $unsigned(reg99[(3'h4):(1'h0)]) : (($unsigned(wire104) ?
                                   (~|wire92) : (!wire93)) ?
                               wire95[(2'h3):(1'h1)] : wire87[(2'h2):(1'h0)])) ?
                       wire105 : $signed({(~^(reg103 >> wire96))}));
  assign wire108 = (($unsigned((~(wire87 > (8'ha7)))) >>> wire95) <<< {wire88[(4'h9):(3'h6)]});
  assign wire109 = (($unsigned({(reg102 - wire104),
                           $unsigned(wire104)}) ^~ (8'hb5)) ?
                       (wire88 ?
                           ($unsigned((wire107 ~^ (8'hb8))) >> $unsigned(wire104)) : $signed($signed((~|wire91)))) : $unsigned(($unsigned({(8'ha9)}) ?
                           $unsigned($signed(wire90)) : wire105)));
  assign wire110 = reg99;
  always
    @(posedge clk) begin
      reg111 <= (wire109[(3'h6):(2'h2)] ? (8'h9f) : wire92);
      if ($unsigned((8'ha1)))
        begin
          if ((^~{$signed($unsigned(((8'had) | wire96))), wire93}))
            begin
              reg112 <= reg111;
              reg113 <= wire109[(2'h2):(2'h2)];
              reg114 <= {$unsigned(wire108[(2'h2):(2'h2)])};
              reg115 <= wire109[(1'h1):(1'h1)];
              reg116 <= wire108;
            end
          else
            begin
              reg112 <= (($unsigned($unsigned((reg103 && reg114))) != ({(^~wire95),
                          ((8'hb3) ? reg113 : reg111)} ?
                      ((reg101 ?
                          reg113 : wire109) >= reg99[(4'h9):(2'h3)]) : (^wire104))) ?
                  reg100 : (wire107 ?
                      $unsigned($unsigned((wire86 | wire106))) : wire92[(4'ha):(1'h1)]));
              reg113 <= wire92[(2'h3):(1'h0)];
              reg114 <= (&((~^$unsigned((reg114 <= wire93))) < (!($signed(wire98) > $signed((8'ha1))))));
            end
          reg117 <= wire106[(2'h2):(1'h1)];
          if ((!reg103[(3'h5):(3'h4)]))
            begin
              reg118 <= wire89[(3'h4):(3'h4)];
              reg119 <= (8'ha6);
              reg120 <= (|((~^{reg102[(3'h5):(3'h5)]}) || $signed(reg117[(2'h3):(2'h2)])));
              reg121 <= (reg119[(5'h13):(4'hb)] * (reg102[(3'h7):(1'h1)] - (^(wire91[(4'hb):(1'h1)] ~^ wire92))));
            end
          else
            begin
              reg118 <= wire93[(4'h9):(1'h0)];
            end
          if ({reg117[(1'h0):(1'h0)],
              (reg103[(1'h0):(1'h0)] == $signed($unsigned(wire86[(2'h2):(1'h1)])))})
            begin
              reg122 <= (~&((~|$signed(wire88)) < ($signed(((8'ha7) >= wire104)) < $unsigned((wire110 * reg111)))));
              reg123 <= ({reg116[(2'h3):(2'h3)]} > reg119);
              reg124 <= reg103[(3'h4):(2'h2)];
            end
          else
            begin
              reg122 <= reg118[(2'h3):(1'h1)];
              reg123 <= ((wire91[(4'h9):(2'h2)] >> $signed({$signed((8'ha8)),
                      $unsigned(reg119)})) ?
                  $signed($unsigned($signed((wire108 ^~ (8'ha6))))) : ($signed({$signed(wire87),
                      (&(7'h40))}) >= ($signed(wire98) ?
                      $signed((8'hb8)) : $signed((~|wire93)))));
            end
          reg125 <= wire98[(4'h8):(3'h6)];
        end
      else
        begin
          reg112 <= (reg121[(4'h8):(1'h1)] || wire92);
          reg113 <= wire104;
          reg114 <= reg115;
          reg115 <= (~reg125[(4'hb):(4'h8)]);
          reg116 <= ((-(($signed(reg121) ?
                  (reg123 ? reg103 : wire97) : (^(8'hae))) << ((&wire109) ?
                  reg119[(4'hb):(1'h1)] : wire107[(1'h1):(1'h0)]))) ?
              $signed(reg101[(3'h7):(3'h7)]) : wire86);
        end
      reg126 <= (!reg115[(4'h9):(3'h5)]);
      if ((8'hbd))
        begin
          reg127 <= ((~^(~&(~{reg112, wire96}))) ?
              reg102[(3'h5):(1'h1)] : $signed($unsigned($signed(reg116))));
        end
      else
        begin
          reg127 <= {{wire105[(4'hc):(4'hc)], reg100}};
          reg128 <= (~$unsigned(($unsigned(wire93[(3'h5):(2'h3)]) ?
              (-reg127) : $unsigned($unsigned(wire88)))));
        end
    end
endmodule

module module42  (y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire46;
  input wire [(4'h9):(1'h0)] wire45;
  input wire signed [(2'h3):(1'h0)] wire44;
  input wire signed [(3'h7):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire47;
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire59,
                 wire58,
                 wire49,
                 wire48,
                 wire47,
                 reg61,
                 reg60,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire47 = (wire45 <= (-wire46));
  assign wire48 = $signed((|($signed(wire43) * $signed((wire43 ?
                      wire45 : wire47)))));
  assign wire49 = (8'haa);
  always
    @(posedge clk) begin
      if ((($unsigned((^~(wire46 ? (7'h44) : wire46))) ?
              (&{$unsigned(wire44),
                  (wire43 ^ (8'hab))}) : $unsigned((|(-(8'h9d))))) ?
          $signed(wire49) : (wire45[(2'h2):(1'h0)] | (-wire45[(3'h5):(3'h5)]))))
        begin
          if ($unsigned(($signed((wire45[(1'h1):(1'h0)] & {(7'h44),
              wire44})) ^ $unsigned(wire49[(3'h4):(3'h4)]))))
            begin
              reg50 <= $signed((-(({(8'ha5)} ?
                  $signed(wire49) : (~wire49)) ~^ wire44)));
              reg51 <= $unsigned(wire48[(1'h1):(1'h1)]);
              reg52 <= wire48[(3'h7):(3'h5)];
              reg53 <= reg52;
              reg54 <= (~^$unsigned({({wire46, wire48} ?
                      (wire48 != reg52) : ((8'haf) ? reg52 : reg51)),
                  ((wire44 ? reg51 : wire49) ?
                      $unsigned(wire45) : reg52[(2'h3):(2'h3)])}));
            end
          else
            begin
              reg50 <= (~&(-($unsigned((reg54 >= reg51)) ?
                  ($unsigned(wire48) < (wire48 ?
                      wire47 : wire49)) : $unsigned(wire46))));
              reg51 <= reg54;
            end
        end
      else
        begin
          reg50 <= $unsigned((+{$unsigned($unsigned(reg52))}));
          if (($unsigned(reg51[(2'h2):(2'h2)]) < wire46))
            begin
              reg51 <= reg52;
              reg52 <= {$signed(($unsigned($signed(wire44)) & $signed((reg50 <= wire49))))};
            end
          else
            begin
              reg51 <= $unsigned($unsigned((~|$signed((reg52 <= reg54)))));
              reg52 <= (&{wire47[(4'he):(2'h2)]});
              reg53 <= ($signed($signed(((wire46 - wire47) | wire43[(3'h6):(3'h4)]))) ?
                  $unsigned((wire43[(2'h3):(2'h2)] ?
                      $signed(wire45) : ((wire49 ? wire49 : (8'hb7)) ?
                          (reg51 <<< reg51) : wire48))) : ((&(~&$unsigned((8'ha0)))) & reg52));
            end
          reg54 <= (-(wire43[(2'h2):(2'h2)] ?
              (~&(7'h40)) : (-((reg51 ?
                  reg51 : wire47) && $unsigned(wire48)))));
          reg55 <= $unsigned(wire43[(2'h2):(1'h1)]);
        end
      reg56 <= ((~($signed($signed(reg55)) <= ($unsigned(wire43) <<< reg55[(3'h6):(3'h5)]))) ?
          reg54[(4'ha):(2'h3)] : $unsigned(wire48));
      reg57 <= $signed(reg50[(3'h6):(2'h3)]);
    end
  assign wire58 = wire47[(4'hd):(4'hb)];
  assign wire59 = wire45;
  always
    @(posedge clk) begin
      reg60 <= $signed($unsigned($unsigned($signed(wire45[(3'h7):(3'h4)]))));
      reg61 <= {wire45[(3'h7):(1'h1)],
          {reg51[(2'h3):(1'h0)],
              $signed({(reg54 ? wire44 : wire45), wire44[(2'h3):(2'h3)]})}};
    end
  assign wire62 = $unsigned(($signed($signed(reg51[(3'h4):(2'h3)])) ?
                      (((~^reg54) ? $unsigned(wire43) : $unsigned(reg61)) ?
                          wire46 : {(~&wire45), (reg56 << wire46)}) : ((8'hbe) ?
                          $unsigned((^wire59)) : wire46[(3'h4):(1'h1)])));
  assign wire63 = {(({reg50,
                          wire58[(1'h0):(1'h0)]} ^~ $unsigned(reg60[(4'he):(4'h9)])) >>> reg56)};
  assign wire64 = wire62[(4'ha):(4'ha)];
  assign wire65 = reg56;
  assign wire66 = reg54[(3'h4):(1'h1)];
  assign wire67 = {{$unsigned((!(+wire44)))}, reg50[(4'h9):(4'h9)]};
  assign wire68 = ($unsigned((8'ha3)) << $unsigned($unsigned($signed((wire67 & (8'ha9))))));
  assign wire69 = $signed((^~(|((!(7'h42)) * $unsigned(reg50)))));
  assign wire70 = $unsigned((((~&wire45[(4'h8):(3'h5)]) ?
                          (!(reg53 ?
                              wire69 : reg54)) : $unsigned((wire64 | (8'hb2)))) ?
                      reg60 : (wire58 ?
                          reg61[(2'h2):(1'h0)] : (|(reg54 ? reg55 : reg60)))));
  assign wire71 = wire49[(2'h2):(1'h1)];
  assign wire72 = wire43;
  assign wire73 = {(($unsigned((wire63 ? (8'hba) : (8'hbd))) ?
                              (wire66 ?
                                  wire63[(1'h0):(1'h0)] : $unsigned(wire70)) : $signed({reg50})) ?
                          wire69[(1'h0):(1'h0)] : (~((reg51 <= (8'hbd)) ?
                              wire71 : (reg56 <<< wire68)))),
                      {{(+{wire64, wire68}), reg55[(4'ha):(1'h1)]},
                          (({reg57} == {reg55}) ?
                              (wire63 ?
                                  (reg60 ?
                                      reg57 : wire68) : {(8'hae)}) : wire49[(2'h3):(2'h2)])}};
  assign wire74 = $signed(reg55[(4'h8):(3'h7)]);
endmodule
