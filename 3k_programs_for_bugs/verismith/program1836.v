module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h26d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire217;
  wire signed [(5'h13):(1'h0)] wire216;
  wire signed [(5'h11):(1'h0)] wire215;
  wire signed [(3'h6):(1'h0)] wire214;
  wire signed [(2'h3):(1'h0)] wire213;
  wire signed [(5'h10):(1'h0)] wire199;
  wire signed [(4'h8):(1'h0)] wire187;
  wire [(4'hd):(1'h0)] wire186;
  wire signed [(4'hd):(1'h0)] wire185;
  wire [(5'h14):(1'h0)] wire183;
  wire [(5'h15):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg212 = (1'h0);
  reg [(5'h12):(1'h0)] reg211 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg210 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg209 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg205 = (1'h0);
  reg [(2'h3):(1'h0)] reg204 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg202 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg200 = (1'h0);
  reg [(3'h6):(1'h0)] reg198 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg196 = (1'h0);
  reg [(2'h2):(1'h0)] reg195 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg194 = (1'h0);
  reg [(3'h5):(1'h0)] reg193 = (1'h0);
  reg [(5'h13):(1'h0)] reg192 = (1'h0);
  reg [(4'hf):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg190 = (1'h0);
  reg [(4'ha):(1'h0)] reg189 = (1'h0);
  reg [(5'h10):(1'h0)] reg188 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  assign y = {wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire199,
                 wire187,
                 wire186,
                 wire185,
                 wire183,
                 wire21,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
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
                 (1'h0)};
  assign wire5 = $signed($unsigned(wire0[(1'h1):(1'h1)]));
  assign wire6 = $signed((~&wire0));
  assign wire7 = ((!(+(wire0[(1'h1):(1'h0)] ?
                     $signed(wire5) : {(8'hb3),
                         wire1}))) >= $signed({wire2[(4'h9):(1'h0)],
                     ((!(8'ha9)) ? $unsigned(wire5) : (~|wire3))}));
  assign wire8 = $signed((($unsigned((wire3 ? (8'hb4) : wire5)) ?
                         wire2 : $unsigned(wire1)) ?
                     ({wire1,
                         $signed(wire3)} < $unsigned((wire5 | (8'hb7)))) : (((wire6 << wire7) >= (wire7 >= wire7)) * (~&$signed((8'hb6))))));
  assign wire9 = wire4[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg10 <= (^wire1[(4'hb):(3'h5)]);
      if ((|(wire1[(3'h6):(2'h3)] ?
          wire7[(2'h3):(2'h2)] : wire9[(1'h0):(1'h0)])))
        begin
          if ($unsigned((-wire0[(1'h1):(1'h0)])))
            begin
              reg11 <= {wire4[(3'h6):(3'h6)]};
              reg12 <= (-$signed((|wire5[(1'h0):(1'h0)])));
            end
          else
            begin
              reg11 <= $unsigned(wire8);
              reg12 <= $signed((wire5 ?
                  reg11[(4'h8):(3'h6)] : (((+reg11) ?
                      wire4[(1'h0):(1'h0)] : $signed(wire7)) ^~ reg10[(4'h9):(4'h8)])));
              reg13 <= (wire0 == (~(8'haa)));
              reg14 <= {$signed((|(wire5[(3'h6):(2'h3)] ?
                      reg11[(3'h6):(2'h2)] : (reg11 != wire9))))};
              reg15 <= (wire4 ?
                  $unsigned($unsigned({((8'ha1) >= (8'ha6))})) : {reg14[(4'ha):(3'h7)]});
            end
          reg16 <= $signed($unsigned(wire7[(4'hb):(4'ha)]));
          reg17 <= $signed(((+((wire2 ^ (8'hbc)) ?
              (&wire8) : (wire0 <<< wire5))) && $signed($unsigned(wire8))));
          if ($unsigned((($unsigned($signed((8'hba))) != $unsigned($signed((8'hba)))) + (((reg17 <= (8'hba)) ?
              {wire9,
                  wire3} : (&reg12)) - (reg13[(4'hf):(4'hf)] || (reg13 + reg16))))))
            begin
              reg18 <= $unsigned((~^($signed((~reg17)) ?
                  wire7 : ((wire8 ? wire8 : reg11) >> (wire1 ?
                      reg16 : reg16)))));
              reg19 <= $signed(((~&$unsigned(((8'hb2) < wire2))) ?
                  ((wire0 ?
                      wire1 : $signed(reg14)) ~^ wire4[(3'h5):(3'h4)]) : (&reg17)));
            end
          else
            begin
              reg18 <= $unsigned($unsigned(reg12));
              reg19 <= reg11[(2'h3):(1'h0)];
            end
        end
      else
        begin
          reg11 <= (((reg10[(1'h0):(1'h0)] ?
              wire8[(3'h5):(2'h3)] : $unsigned((reg14 ~^ wire7))) | reg11) * $unsigned((-reg12)));
          reg12 <= {(((-(reg19 ? wire3 : reg10)) - ($unsigned((8'hb4)) ?
                      (wire6 ? (7'h42) : wire9) : wire5)) ?
                  $unsigned((+(wire2 ? wire1 : reg16))) : reg16)};
          if ($signed({wire8,
              ((^~(reg10 == reg17)) ?
                  $unsigned((wire8 && wire1)) : {(reg10 ? reg19 : wire3)})}))
            begin
              reg13 <= (~^(7'h40));
              reg14 <= $unsigned((~|wire5[(3'h4):(2'h2)]));
              reg15 <= (^((($signed((8'ha8)) & (|reg10)) ?
                      $unsigned($unsigned(wire5)) : (wire1 ?
                          $unsigned(reg14) : $signed(reg17))) ?
                  wire4 : wire3[(4'hf):(1'h0)]));
            end
          else
            begin
              reg13 <= {((!$signed((+reg19))) ? reg16[(3'h5):(3'h4)] : reg10)};
            end
        end
      reg20 <= wire9;
    end
  assign wire21 = ($unsigned({((reg15 ? reg12 : reg19) ?
                              (~^(8'ha5)) : wire9)}) ?
                      $signed(((-(~^reg10)) ~^ reg14)) : (((~&$unsigned(reg10)) <<< ((~^reg14) ?
                              {wire9} : (wire8 != wire8))) ?
                          reg12 : (&reg12)));
  module22 #() modinst184 (wire183, clk, wire0, wire3, reg20, reg14);
  assign wire185 = $signed($unsigned(wire6));
  assign wire186 = (8'hae);
  assign wire187 = ({$unsigned($unsigned(((8'ha3) && wire185)))} == ($signed({{(8'hab)},
                       {reg12, wire9}}) * wire21[(5'h12):(5'h11)]));
  always
    @(posedge clk) begin
      reg188 <= (wire7[(2'h3):(1'h0)] <= reg18);
      reg189 <= reg17[(4'ha):(1'h1)];
      reg190 <= (reg20 ? reg14[(4'h8):(4'h8)] : (^wire8));
      if ($signed(wire186[(4'h8):(2'h2)]))
        begin
          reg191 <= (-$unsigned(reg15[(1'h1):(1'h0)]));
          if ((&(((^~{(8'ha8), wire2}) ?
              (wire187[(1'h0):(1'h0)] * $unsigned(reg11)) : reg16[(3'h5):(1'h0)]) & ((|(reg16 ?
                  wire4 : wire5)) ?
              (~&{wire187, reg20}) : (~|(wire1 ? reg16 : reg10))))))
            begin
              reg192 <= (reg16[(4'h8):(3'h6)] ?
                  $unsigned((($signed(reg16) ?
                      wire4 : (reg19 - reg16)) << {$signed(wire6),
                      (wire0 ?
                          wire183 : reg19)})) : $signed((~&$unsigned(wire3))));
              reg193 <= ($unsigned({(~|(^~(8'hae)))}) ?
                  {wire4[(2'h2):(2'h2)]} : ($unsigned(({reg17} * (-reg12))) ?
                      ((wire21 | wire9) * (~|(wire0 - reg18))) : ($unsigned((reg190 < reg19)) ^~ (~&(reg188 ?
                          reg192 : reg16)))));
              reg194 <= $unsigned(reg188);
              reg195 <= ($unsigned(((!$signed(wire21)) ?
                      $unsigned(wire5) : $unsigned($signed(wire5)))) ?
                  (^($unsigned((reg14 >> wire3)) <= (-(reg190 ?
                      reg193 : reg17)))) : (^~wire0));
              reg196 <= (~|(((wire7[(4'h9):(3'h5)] ?
                  {wire8} : (reg12 ~^ reg19)) >= (+$unsigned(wire21))) == {((!reg193) ?
                      {reg20} : $signed((8'hbf))),
                  ($unsigned(reg20) ? $signed((8'hbb)) : wire8)}));
            end
          else
            begin
              reg192 <= wire5;
              reg193 <= (^~(((~^reg12[(3'h6):(3'h6)]) ?
                      $unsigned((reg196 + (8'hb3))) : (reg19 ?
                          {reg189} : $unsigned(reg15))) ?
                  $unsigned(reg196[(4'he):(4'h9)]) : ({$signed(reg189)} ?
                      (reg16 > ((8'hb8) ?
                          wire6 : wire21)) : $signed(reg20[(4'he):(1'h0)]))));
              reg194 <= $unsigned((+$signed($unsigned(wire9[(3'h6):(2'h2)]))));
              reg195 <= $signed(reg194);
              reg196 <= (reg191 ?
                  reg20[(3'h4):(1'h0)] : {{{(~&wire7), $unsigned(reg196)}},
                      reg195[(1'h1):(1'h1)]});
            end
          reg197 <= reg196[(4'h8):(3'h5)];
          reg198 <= $signed((^~wire186));
        end
      else
        begin
          reg191 <= wire21[(2'h3):(2'h2)];
          reg192 <= $signed((-$unsigned(reg19[(4'h9):(3'h7)])));
        end
    end
  assign wire199 = $unsigned($unsigned($unsigned((~^wire7[(3'h7):(3'h6)]))));
  always
    @(posedge clk) begin
      reg200 <= wire4[(2'h2):(1'h0)];
      reg201 <= wire4[(1'h1):(1'h0)];
      if ($signed((8'ha4)))
        begin
          reg202 <= wire186;
          reg203 <= reg194[(3'h7):(1'h0)];
          reg204 <= wire9;
          reg205 <= $unsigned({$unsigned(((^~reg202) != (~wire2))),
              {{$signed(reg11)}, $signed($signed(wire199))}});
          reg206 <= (+reg204);
        end
      else
        begin
          reg202 <= (({wire9} + (8'hba)) ? (+reg195) : reg195);
          reg203 <= reg198[(1'h1):(1'h1)];
          reg204 <= wire6;
        end
      reg207 <= reg205;
      if ((~&reg192))
        begin
          reg208 <= $unsigned(((-(^(reg198 ? wire2 : reg192))) ?
              ($signed(reg192) ?
                  $signed($signed(reg194)) : $unsigned((wire2 ?
                      (8'hbe) : (8'h9d)))) : ($signed(reg197) >>> ((reg197 ?
                  reg20 : wire183) == $signed((8'haa))))));
        end
      else
        begin
          reg208 <= $signed((($signed($unsigned(reg16)) && reg15) == (($signed(reg17) ?
              (-reg11) : $signed(reg203)) * reg189)));
          if (wire4)
            begin
              reg209 <= ((7'h44) == reg11);
              reg210 <= $unsigned($unsigned((!$signed($unsigned(reg209)))));
              reg211 <= $signed({wire7});
            end
          else
            begin
              reg209 <= reg188;
              reg210 <= (~^reg207);
              reg211 <= ((|$signed(reg209[(3'h5):(3'h4)])) ~^ (~(reg188[(5'h10):(2'h3)] ?
                  ($signed(reg196) ?
                      (reg13 - wire5) : reg205) : ($signed((7'h43)) >= $signed((8'h9e))))));
              reg212 <= reg205[(4'ha):(4'h8)];
            end
        end
    end
  assign wire213 = wire199;
  assign wire214 = $unsigned(($unsigned((!wire0)) >> wire185));
  assign wire215 = ({(&(wire21 ? reg189 : $signed(reg195)))} <= ({(-wire21),
                       (^(reg201 * reg188))} ^ ({reg197} ?
                       (reg190[(3'h5):(2'h3)] ?
                           (wire6 * (7'h42)) : ((8'ha4) <<< reg204)) : (~wire3))));
  assign wire216 = $unsigned(wire4[(3'h4):(1'h0)]);
  assign wire217 = $signed((+$signed((^~(~^reg200)))));
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire26;
  input wire [(4'hb):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire182;
  wire signed [(2'h3):(1'h0)] wire181;
  wire [(4'hd):(1'h0)] wire180;
  wire signed [(4'hf):(1'h0)] wire179;
  wire [(5'h10):(1'h0)] wire178;
  wire signed [(4'hd):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire92;
  wire signed [(2'h3):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire176;
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire89,
                 wire75,
                 wire73,
                 wire91,
                 wire92,
                 wire109,
                 wire176,
                 reg95,
                 reg94,
                 reg93,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg27 <= (^$unsigned(wire25));
      reg28 <= $unsigned((($unsigned($unsigned(wire26)) ?
              wire26 : {$signed(wire25), $unsigned((8'hbd))}) ?
          (!$unsigned(wire26[(1'h1):(1'h1)])) : (wire26[(1'h0):(1'h0)] ?
              wire24 : $unsigned((wire25 ? wire23 : (8'hba))))));
      reg29 <= wire25[(1'h1):(1'h1)];
      reg30 <= $signed(reg29[(4'he):(4'hb)]);
      reg31 <= $unsigned($signed($signed($unsigned({reg27}))));
    end
  module32 #() modinst74 (.wire36(wire25), .wire37(wire23), .y(wire73), .clk(clk), .wire34(reg28), .wire33(wire26), .wire35(wire24));
  assign wire75 = ((8'ha8) ? $unsigned(wire25) : reg30[(2'h3):(2'h3)]);
  module76 #() modinst90 (wire89, clk, reg31, wire26, reg27, reg28);
  assign wire91 = ($unsigned((8'hab)) ^~ {(~(7'h40)), reg29[(2'h2):(1'h1)]});
  assign wire92 = $signed((((^~(~^reg29)) < (wire75[(4'h9):(1'h0)] ?
                          {(8'hbc), wire24} : {reg31})) ?
                      (&(reg28[(3'h6):(3'h4)] + $unsigned((8'hbf)))) : $unsigned((wire25 <<< $unsigned(wire73)))));
  always
    @(posedge clk) begin
      reg93 <= ($signed($unsigned($signed($unsigned(reg27)))) ?
          {$signed(($unsigned(reg31) <<< $signed(wire25)))} : {wire89});
    end
  always
    @(posedge clk) begin
      reg94 <= wire26;
    end
  always
    @(posedge clk) begin
      reg95 <= $signed(reg27[(4'hb):(3'h7)]);
    end
  module96 #() modinst110 (.clk(clk), .y(wire109), .wire98(wire23), .wire97(wire89), .wire100(reg27), .wire99(reg93));
  module111 #() modinst177 (.wire113(reg95), .wire115(reg29), .wire114(wire89), .wire116(wire23), .clk(clk), .y(wire176), .wire112(wire25));
  assign wire178 = ($unsigned(($signed((wire109 ? wire23 : (7'h43))) ?
                       reg29[(4'hc):(2'h2)] : ($unsigned(reg94) ?
                           (wire73 ?
                               reg30 : reg30) : $signed(reg94)))) >= (reg30 ?
                       (&((~(8'hb7)) ?
                           (wire109 > (8'hb6)) : wire26[(3'h4):(1'h0)])) : reg93));
  assign wire179 = wire75[(3'h7):(1'h1)];
  assign wire180 = (!(&({wire26[(4'hd):(4'hc)], wire26} - (8'haa))));
  assign wire181 = ($unsigned($unsigned(($unsigned(wire109) ?
                       (wire23 <<< (8'hb5)) : $unsigned(wire92)))) == reg30[(3'h7):(3'h7)]);
  assign wire182 = (+wire25[(4'ha):(3'h5)]);
endmodule

module module111  (y, clk, wire116, wire115, wire114, wire113, wire112);
  output wire [(32'h2bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire116;
  input wire signed [(3'h6):(1'h0)] wire115;
  input wire signed [(4'h9):(1'h0)] wire114;
  input wire signed [(5'h14):(1'h0)] wire113;
  input wire signed [(3'h5):(1'h0)] wire112;
  wire [(4'he):(1'h0)] wire171;
  wire [(3'h6):(1'h0)] wire170;
  wire signed [(3'h7):(1'h0)] wire169;
  wire [(4'hd):(1'h0)] wire168;
  wire signed [(5'h15):(1'h0)] wire167;
  wire [(5'h15):(1'h0)] wire166;
  wire signed [(4'ha):(1'h0)] wire160;
  wire [(5'h13):(1'h0)] wire159;
  wire [(5'h10):(1'h0)] wire158;
  wire [(5'h14):(1'h0)] wire143;
  wire [(5'h10):(1'h0)] wire142;
  reg signed [(5'h15):(1'h0)] reg175 = (1'h0);
  reg [(4'hd):(1'h0)] reg174 = (1'h0);
  reg [(2'h3):(1'h0)] reg173 = (1'h0);
  reg [(4'h8):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(5'h12):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(5'h15):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg153 = (1'h0);
  reg [(4'ha):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(3'h7):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg [(4'hb):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(4'hb):(1'h0)] reg135 = (1'h0);
  reg [(4'ha):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg131 = (1'h0);
  reg [(2'h3):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(5'h11):(1'h0)] reg127 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire160,
                 wire159,
                 wire158,
                 wire143,
                 wire142,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg157,
                 reg156,
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
                 reg144,
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
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg117 <= wire113;
      if ((((~|(wire116[(3'h4):(1'h1)] ?
              {wire116, (8'ha8)} : wire114[(3'h4):(1'h1)])) ?
          ($signed(wire112[(1'h1):(1'h0)]) ?
              (((8'hae) ?
                  wire112 : wire114) < $unsigned(wire114)) : ((wire115 <= wire112) != $unsigned(wire114))) : (~&wire115)) >= wire115))
        begin
          reg118 <= (wire115 ?
              reg117 : ((wire113 > $unsigned(wire112[(1'h1):(1'h1)])) + wire114[(3'h4):(2'h3)]));
          reg119 <= ((wire112 < (!(8'ha0))) ?
              ($signed($unsigned((reg117 >= (8'ha8)))) ?
                  {reg118} : {$signed($signed(wire115))}) : wire115[(1'h1):(1'h1)]);
          reg120 <= (reg118 == ($signed((~^wire115[(2'h3):(2'h3)])) ?
              ((^~(reg118 >>> reg118)) ?
                  reg117 : (~&$unsigned((8'h9c)))) : wire116[(3'h4):(1'h0)]));
          reg121 <= ($unsigned((wire114 << $unsigned($unsigned(reg119)))) ?
              ({reg117[(2'h3):(1'h1)],
                  $signed((~|reg117))} || reg118[(1'h0):(1'h0)]) : (~^$unsigned($signed($unsigned(wire113)))));
        end
      else
        begin
          reg118 <= ($signed($unsigned((wire116[(3'h6):(3'h4)] * (wire113 | (8'hb8))))) & reg118);
          if ($signed(wire114))
            begin
              reg119 <= $unsigned(((~&$unsigned($signed(reg117))) ^~ wire113));
              reg120 <= ($unsigned(wire114[(4'h9):(3'h7)]) && wire116[(3'h5):(1'h1)]);
              reg121 <= {(reg117 ?
                      $unsigned(wire113) : (((wire113 ?
                          wire116 : (7'h44)) ^ (~&reg118)) ^ $signed((8'hac)))),
                  {$signed($signed((!reg119))), wire112}};
            end
          else
            begin
              reg119 <= (reg119[(1'h0):(1'h0)] ?
                  (wire114[(3'h4):(1'h0)] ?
                      $signed((reg118 ?
                          wire116[(3'h6):(2'h3)] : wire112)) : (8'h9d)) : (^(reg120[(4'hf):(1'h1)] ?
                      $unsigned(((8'hbb) & reg121)) : $signed(reg118[(2'h3):(2'h3)]))));
            end
        end
      if ((((+(!{reg120})) ?
              $signed(((^reg118) + wire115)) : $signed($unsigned(wire113))) ?
          $signed($unsigned(((wire112 <= wire113) && {wire115,
              wire114}))) : ((($unsigned(wire113) ?
                  reg121 : $signed((8'ha5))) * ((8'hbf) ? reg117 : reg121)) ?
              wire113[(2'h2):(1'h1)] : wire115[(1'h1):(1'h1)])))
        begin
          reg122 <= (|(wire112[(1'h0):(1'h0)] ?
              (({wire115, reg117} ?
                  reg121[(5'h12):(2'h3)] : (~&reg120)) >> $signed((wire113 ?
                  reg120 : wire112))) : (^~(wire113 >= $signed(wire115)))));
          if (reg120)
            begin
              reg123 <= (!((|$signed(wire112[(2'h2):(2'h2)])) | ((7'h40) || (wire112 ?
                  reg120 : $unsigned(wire116)))));
              reg124 <= reg119;
              reg125 <= wire113[(4'hb):(4'h8)];
            end
          else
            begin
              reg123 <= ({reg119,
                  (($unsigned(reg121) ?
                          ((8'ha2) ^~ wire113) : {wire113, reg121}) ?
                      reg119[(2'h3):(2'h2)] : reg121)} > wire116[(3'h4):(1'h1)]);
              reg124 <= reg125[(1'h1):(1'h1)];
            end
          if ({reg124,
              (+$unsigned(((reg120 ? wire112 : reg117) ?
                  $unsigned(reg118) : {wire112})))})
            begin
              reg126 <= wire116;
              reg127 <= (7'h41);
              reg128 <= wire114[(4'h8):(4'h8)];
            end
          else
            begin
              reg126 <= (+$unsigned((wire115 ?
                  ((wire115 ? (8'hb6) : reg122) ?
                      {(8'hb9), reg126} : reg127[(3'h4):(2'h2)]) : (8'hb2))));
              reg127 <= ($unsigned(($unsigned((&wire115)) ?
                  reg119 : $signed((^reg121)))) ^~ {(wire115[(2'h2):(1'h0)] ?
                      reg122[(3'h5):(1'h1)] : ((reg121 | wire113) ?
                          reg127 : (wire113 ? wire115 : reg125))),
                  $signed((~^(wire116 * reg118)))});
              reg128 <= (^~$signed((~&$signed($signed(reg121)))));
              reg129 <= $signed((~(((reg127 ? (8'hb1) : reg119) >= (reg124 ?
                      (8'ha2) : reg124)) ?
                  wire115[(3'h5):(1'h1)] : ($signed(reg122) == reg127[(4'ha):(2'h2)]))));
            end
        end
      else
        begin
          reg122 <= reg123;
          reg123 <= ((&($signed((^reg124)) ?
                  $unsigned(reg129[(4'he):(2'h3)]) : (((8'ha3) && reg122) ~^ reg117))) ?
              (reg122[(4'hb):(3'h5)] ?
                  (^reg128[(2'h2):(1'h0)]) : $signed(($signed(reg124) ?
                      ((8'h9c) ? reg129 : reg128) : {reg123,
                          reg118}))) : $signed({(~^(reg123 ? reg126 : reg126)),
                  {((8'hb7) ? wire116 : reg120), wire116}}));
          reg124 <= $unsigned(reg117[(2'h3):(1'h1)]);
        end
      reg130 <= $signed({(((wire112 ? wire114 : reg119) + $signed(reg117)) ?
              ((~wire113) ?
                  $signed(reg128) : reg121[(5'h15):(5'h10)]) : (&$signed(reg128)))});
      if ((!(reg128[(4'h8):(3'h6)] >= reg120[(3'h4):(1'h0)])))
        begin
          reg131 <= (~|({((|wire116) - $signed(reg124))} ?
              (&{(wire114 - reg126)}) : (reg123 ?
                  $unsigned($signed(reg130)) : reg118)));
          reg132 <= $unsigned($unsigned((8'had)));
        end
      else
        begin
          reg131 <= $signed(reg119);
          if ({((^(reg132[(4'hf):(3'h6)] * ((8'ha4) ~^ (8'hb6)))) * reg130[(2'h2):(1'h0)]),
              $signed($signed((7'h42)))})
            begin
              reg132 <= (reg126[(3'h6):(3'h5)] ?
                  ({$unsigned((reg124 ? (8'h9f) : reg126))} ?
                      $unsigned(reg127[(3'h5):(3'h5)]) : $unsigned(reg130[(2'h3):(1'h0)])) : ($unsigned(wire114) ^ {$unsigned(wire113)}));
              reg133 <= reg119[(1'h1):(1'h1)];
            end
          else
            begin
              reg132 <= reg130;
              reg133 <= (+$signed(((^reg119) || $signed((wire113 ?
                  reg126 : wire114)))));
              reg134 <= $unsigned((reg124[(4'ha):(4'ha)] ?
                  reg119[(3'h4):(2'h2)] : reg124));
              reg135 <= {(reg131 ?
                      $signed($unsigned(reg125[(1'h0):(1'h0)])) : $unsigned(wire113[(3'h6):(2'h2)])),
                  $unsigned((~reg124))};
              reg136 <= {reg122, (~^reg118[(1'h0):(1'h0)])};
            end
          if ((!reg127[(3'h6):(3'h5)]))
            begin
              reg137 <= ($signed($unsigned(($unsigned(reg124) ?
                  $unsigned((8'h9e)) : $unsigned(reg131)))) >= (((|(-reg122)) ?
                      (8'hbd) : $signed((reg121 ? (8'hb7) : (8'hbf)))) ?
                  wire116[(4'h9):(3'h5)] : ($unsigned($signed(reg124)) ?
                      $unsigned(((8'hb5) < reg119)) : {$signed(reg135),
                          reg121})));
            end
          else
            begin
              reg137 <= ((~^reg136) || (|reg136));
              reg138 <= (($unsigned((~&(reg135 & reg122))) ?
                      $unsigned((^$signed((8'ha7)))) : (~&wire113)) ?
                  $signed($signed(($signed(reg128) | {reg118}))) : (~&(-($unsigned((7'h42)) ?
                      (~&wire116) : $signed(reg132)))));
              reg139 <= reg126;
              reg140 <= reg130;
            end
          reg141 <= $signed($unsigned(reg120[(4'hc):(2'h3)]));
        end
    end
  assign wire142 = $unsigned($signed((!$signed((reg118 ? reg124 : wire113)))));
  assign wire143 = {(|wire114[(4'h9):(1'h1)]),
                       {($signed((reg139 ? reg127 : reg137)) ?
                               ((&reg121) ?
                                   (reg137 ?
                                       reg133 : wire116) : reg132[(4'hf):(4'ha)]) : ($signed((8'hae)) ?
                                   (reg123 ? reg126 : (8'hba)) : (&wire114)))}};
  always
    @(posedge clk) begin
      reg144 <= $unsigned(((^~(~|$signed(reg132))) ?
          wire114[(1'h1):(1'h1)] : (^~(7'h44))));
      reg145 <= (-reg134[(4'h9):(4'h8)]);
      reg146 <= $unsigned(((wire114[(3'h7):(3'h4)] < {reg122}) ?
          reg133[(4'h8):(2'h3)] : $unsigned($signed((wire143 + reg125)))));
      if (((((reg127 ? $signed(reg122) : wire113[(4'hc):(1'h1)]) ?
                  ($unsigned(wire113) == (reg129 ?
                      reg140 : reg135)) : reg131[(3'h5):(2'h2)]) ?
              (8'hb7) : $unsigned({reg126[(4'h9):(3'h7)]})) ?
          {$unsigned(($signed(reg126) >> (reg118 >= reg122))),
              $unsigned($unsigned((|wire112)))} : ($signed(((!reg140) - (reg122 ?
              (8'haa) : (8'hac)))) << reg133[(3'h7):(3'h5)])))
        begin
          reg147 <= (((+reg146[(2'h3):(2'h2)]) > (^~$signed((reg141 + reg139)))) ?
              reg126[(3'h6):(1'h0)] : ($unsigned(reg118[(2'h3):(1'h0)]) ?
                  wire113[(4'h8):(3'h6)] : $signed($signed((8'hbc)))));
          reg148 <= $signed((+$signed(reg134[(3'h6):(1'h1)])));
          reg149 <= (&(^~($unsigned((wire114 - (8'ha5))) ?
              (|$signed((8'h9d))) : $unsigned($unsigned(wire112)))));
        end
      else
        begin
          reg147 <= reg134[(3'h6):(2'h2)];
          if ($signed(reg125))
            begin
              reg148 <= reg141[(2'h3):(2'h3)];
              reg149 <= reg132[(3'h6):(3'h4)];
              reg150 <= ((($unsigned($signed(reg139)) ~^ reg130) | {reg132[(4'ha):(4'h8)],
                      reg123[(3'h6):(2'h3)]}) ?
                  (reg138[(2'h3):(1'h0)] ?
                      $signed(wire116[(1'h1):(1'h0)]) : (|(|reg131))) : (($unsigned($signed(reg138)) ?
                      reg135 : $signed({reg141,
                          reg127})) >>> (($signed(reg133) ?
                          reg145[(1'h0):(1'h0)] : $unsigned(reg121)) ?
                      $unsigned({reg123}) : reg146[(1'h0):(1'h0)])));
            end
          else
            begin
              reg148 <= reg128[(2'h3):(1'h0)];
              reg149 <= reg119;
            end
          reg151 <= (reg147[(2'h3):(2'h3)] ?
              $unsigned(reg150[(4'hb):(4'hb)]) : reg117[(4'h9):(2'h2)]);
          if (reg120[(3'h6):(3'h6)])
            begin
              reg152 <= $unsigned(wire114);
              reg153 <= (8'h9d);
              reg154 <= ((8'ha8) ?
                  ({((reg140 ? (8'hb8) : reg119) ?
                          (reg136 + (8'hae)) : (8'ha7)),
                      reg129} <= $unsigned(reg123[(1'h1):(1'h1)])) : reg124[(4'ha):(3'h5)]);
            end
          else
            begin
              reg152 <= ($unsigned((wire112[(1'h0):(1'h0)] != ((reg118 != reg144) ?
                      $signed(reg149) : reg138[(3'h4):(1'h0)]))) ?
                  ({$unsigned((+reg129)), reg117} << $unsigned({((8'hb3) ?
                          reg123 : reg138)})) : (($signed(reg133) ?
                      $signed((~|reg129)) : {wire116,
                          reg149[(5'h13):(1'h0)]}) != ((wire113[(2'h3):(1'h0)] ?
                          (&reg154) : reg135) ?
                      reg141 : {reg137[(2'h3):(2'h3)]})));
              reg153 <= $signed(reg133[(3'h6):(3'h5)]);
              reg154 <= reg129;
              reg155 <= $unsigned({reg117, $unsigned(reg151)});
              reg156 <= $signed((($unsigned(((8'hb5) ? reg124 : reg119)) ?
                      (-(reg118 ? reg130 : reg120)) : reg147) ?
                  $signed($unsigned((reg121 * wire116))) : (^$unsigned($unsigned(reg124)))));
            end
        end
      reg157 <= (8'hb3);
    end
  assign wire158 = $unsigned($unsigned((~|reg135)));
  assign wire159 = {$unsigned((reg133 * reg130)),
                       ((~($unsigned(reg154) ?
                           (reg145 ^ reg156) : reg140)) && (reg123[(1'h1):(1'h0)] ?
                           $unsigned($unsigned(reg117)) : (^~$signed((8'h9c)))))};
  assign wire160 = reg118[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg161 <= (^({wire160[(1'h1):(1'h1)],
              $unsigned((reg145 ? reg127 : reg121))} ?
          (-$signed((reg119 ?
              reg149 : reg156))) : (~^((|reg151) - $unsigned(reg125)))));
      reg162 <= reg131[(3'h4):(2'h2)];
      reg163 <= (|$signed((reg131 ?
          reg154 : $signed((reg126 ? reg124 : reg144)))));
      reg164 <= reg152;
      reg165 <= $unsigned(((~|(~|((8'hb9) ?
          (8'hae) : wire143))) <= (|($signed(wire142) && (reg161 ?
          wire159 : reg144)))));
    end
  assign wire166 = $signed(wire159[(4'he):(3'h7)]);
  assign wire167 = ($unsigned((&reg139[(1'h1):(1'h1)])) ?
                       (~|((^~(8'ha8)) ?
                           ((reg136 ? reg149 : reg120) || (reg138 ?
                               wire166 : wire143)) : ({reg164} && reg148[(3'h7):(1'h0)]))) : $unsigned(reg164[(3'h7):(1'h1)]));
  assign wire168 = $signed(({$unsigned($unsigned(reg161))} ?
                       $unsigned($signed(reg140[(2'h2):(1'h1)])) : reg125));
  assign wire169 = (wire143[(4'ha):(3'h6)] && reg148);
  assign wire170 = reg133[(2'h3):(1'h0)];
  assign wire171 = $unsigned($unsigned($signed($signed(reg164))));
  always
    @(posedge clk) begin
      reg172 <= (reg155[(2'h2):(2'h2)] ?
          ((-$signed($unsigned(reg120))) && (|(~|reg162[(3'h4):(1'h1)]))) : (reg149 ?
              reg146 : reg148[(1'h0):(1'h0)]));
      reg173 <= wire142;
      reg174 <= ({({(reg132 ? wire114 : reg141)} ?
              $signed($unsigned(wire143)) : (wire168[(4'hb):(1'h0)] ?
                  reg128 : reg153[(4'h8):(3'h4)]))} || ((~|reg124[(4'hb):(3'h7)]) ?
          (+reg122[(4'ha):(3'h7)]) : $signed($unsigned((^~(8'ha7))))));
      reg175 <= reg144;
    end
endmodule

module module96
#(parameter param108 = (~|(^((|(|(7'h43))) ? {(^(8'hbc))} : (~|((8'h9d) >> (8'hb1)))))))
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire100;
  input wire signed [(5'h11):(1'h0)] wire99;
  input wire signed [(4'hb):(1'h0)] wire98;
  input wire [(4'hd):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire107;
  wire signed [(3'h6):(1'h0)] wire106;
  wire [(4'h8):(1'h0)] wire105;
  wire signed [(3'h5):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire signed [(4'he):(1'h0)] wire102;
  wire [(4'hc):(1'h0)] wire101;
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 (1'h0)};
  assign wire101 = wire100[(1'h0):(1'h0)];
  assign wire102 = wire100[(4'hd):(4'hd)];
  assign wire103 = wire99[(3'h6):(1'h0)];
  assign wire104 = $unsigned($signed(wire102[(2'h2):(1'h0)]));
  assign wire105 = (wire104[(2'h3):(1'h1)] ?
                       (~^{wire98[(2'h2):(1'h1)]}) : wire100[(1'h0):(1'h0)]);
  assign wire106 = (wire105 ?
                       wire98 : {$signed(((wire101 != wire97) > $signed((8'had)))),
                           $unsigned((+wire102[(1'h0):(1'h0)]))});
  assign wire107 = (~wire97[(4'ha):(4'h8)]);
endmodule

module module76
#(parameter param88 = ((({((8'hbc) ? (8'hb5) : (8'ha6))} ? (+((8'hbf) ? (8'ha6) : (8'h9e))) : (8'hb6)) ^ ((^(~|(8'haa))) ? ((^(8'ha0)) || (&(8'hbd))) : (^((8'hb4) ^~ (8'hb9))))) < ((^{((8'h9e) ? (8'hb9) : (8'ha9)), (8'ha7)}) <= {((+(8'hb0)) > {(8'haf)})})))
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire80;
  input wire [(4'hf):(1'h0)] wire79;
  input wire [(3'h6):(1'h0)] wire78;
  input wire signed [(4'ha):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire81;
  assign y = {wire87, wire86, wire85, wire84, wire83, wire82, wire81, (1'h0)};
  assign wire81 = ((&((~wire78[(3'h5):(1'h0)]) ?
                      $unsigned($unsigned(wire78)) : wire78[(2'h2):(1'h0)])) * $unsigned({wire79,
                      wire79[(4'ha):(2'h2)]}));
  assign wire82 = (~&{((8'ha6) ~^ wire80)});
  assign wire83 = $unsigned((8'ha3));
  assign wire84 = wire80;
  assign wire85 = wire80;
  assign wire86 = {(^wire81[(2'h3):(2'h3)])};
  assign wire87 = ({wire80[(2'h2):(1'h1)]} ?
                      ({(~|(wire83 + wire78))} ?
                          wire80 : {(wire78 ?
                                  (wire81 >> wire86) : (&wire80))}) : wire80[(2'h3):(2'h3)]);
endmodule

module module32
#(parameter param71 = {(~^(&(((8'h9d) ? (8'hb4) : (8'hba)) ? ((8'hb5) ? (8'h9f) : (8'h9c)) : ((7'h42) ? (8'ha8) : (8'ha6)))))}, 
parameter param72 = param71)
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire37;
  input wire [(3'h5):(1'h0)] wire36;
  input wire signed [(4'hd):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  input wire signed [(5'h11):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire55,
                 wire54,
                 wire53,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg57,
                 reg56,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire38 = (-$signed((&wire36[(1'h1):(1'h1)])));
  assign wire39 = wire33[(3'h5):(3'h4)];
  assign wire40 = (wire38 < (~(^((wire36 ? wire37 : wire39) ?
                      $unsigned(wire34) : (wire39 ? wire37 : wire34)))));
  assign wire41 = wire33;
  assign wire42 = $unsigned((wire41 ^ wire40[(2'h2):(1'h0)]));
  assign wire43 = (&($unsigned({(wire40 - wire42)}) ?
                      {{(wire34 - wire39), wire33[(4'hc):(4'h9)]},
                          wire36[(2'h2):(1'h1)]} : $unsigned(($signed((7'h44)) >> wire37))));
  assign wire44 = (((wire36[(3'h5):(2'h3)] << (8'haa)) ?
                          {$signed(wire41),
                              ((7'h40) ~^ (-(7'h40)))} : ((wire37 ?
                                  wire36[(1'h0):(1'h0)] : wire43) ?
                              (&wire42[(5'h11):(5'h10)]) : ($signed(wire39) ^~ (wire36 ?
                                  wire33 : wire43)))) ?
                      {((wire33[(3'h4):(2'h2)] ?
                              ((8'hac) != wire35) : $unsigned(wire43)) >= $unsigned((wire43 ~^ wire37)))} : (((7'h42) ?
                          wire39[(4'hf):(3'h5)] : {$signed((8'haf))}) ^~ (-((wire33 ^ wire37) ^ wire37))));
  assign wire45 = $unsigned((~&wire35[(1'h1):(1'h0)]));
  assign wire46 = wire44[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if (wire34[(4'he):(3'h4)])
        begin
          reg47 <= ({$signed({wire43, $signed(wire41)})} ?
              wire46 : $signed((wire44 > ($unsigned(wire46) ?
                  (wire42 ? wire43 : wire38) : wire45[(3'h5):(2'h2)]))));
          reg48 <= $unsigned($signed(reg47));
          reg49 <= wire43[(4'ha):(4'ha)];
        end
      else
        begin
          reg47 <= wire40;
          reg48 <= reg49[(1'h1):(1'h0)];
          reg49 <= (+((8'hb0) > ($unsigned(wire34) && wire44[(3'h4):(2'h3)])));
          reg50 <= reg47[(1'h1):(1'h1)];
        end
      reg51 <= (~&$unsigned((wire41[(4'hb):(1'h1)] < (!(8'hb6)))));
      reg52 <= wire37;
    end
  assign wire53 = (^wire43);
  assign wire54 = (wire40 < $unsigned((~$signed({wire39}))));
  assign wire55 = ($unsigned(wire37[(1'h0):(1'h0)]) ?
                      (|$signed((|reg47[(2'h3):(2'h2)]))) : reg51);
  always
    @(posedge clk) begin
      reg56 <= (~wire34[(4'hb):(4'ha)]);
      reg57 <= $signed((((wire44 ? wire37 : reg51) | {(wire39 ?
              wire40 : wire43),
          (8'ha2)}) & (~&$signed((wire45 & wire43)))));
    end
  assign wire58 = $signed(({((wire37 ? reg47 : wire39) << (wire40 ?
                          reg52 : wire45))} ~^ (~^$signed($unsigned(wire33)))));
  assign wire59 = $signed((~&{(!(~reg57)), reg50}));
  assign wire60 = (((wire38 <<< reg52) >= (8'ha9)) * (|($signed(wire39[(5'h10):(4'h8)]) >>> $unsigned(((8'hb0) ?
                      wire53 : wire54)))));
  assign wire61 = wire36;
  assign wire62 = $unsigned(((((-reg56) ? (8'ha6) : wire38) ?
                      $signed(wire42[(3'h4):(2'h2)]) : $signed(((8'had) ?
                          wire40 : wire46))) ^~ $unsigned(wire33[(3'h6):(3'h6)])));
  always
    @(posedge clk) begin
      reg63 <= wire41;
      reg64 <= $signed($unsigned((~|(reg49[(2'h2):(1'h0)] ?
          {(8'hac), wire60} : $signed((8'hb9))))));
      reg65 <= ((({$unsigned(reg49)} << $signed((~^reg64))) <= wire60) ?
          ((!((wire61 ? wire59 : reg56) ?
                  wire34[(5'h11):(2'h3)] : wire60[(4'h8):(3'h4)])) ?
              {(~^{wire40,
                      wire53})} : $unsigned({(!(8'hb2))})) : $signed(wire39));
      reg66 <= {(~|{((wire55 - wire37) ? wire55 : reg64[(1'h0):(1'h0)])})};
      reg67 <= $unsigned((((wire45 >> (wire39 ? wire62 : wire61)) ?
              (reg47[(1'h0):(1'h0)] ? reg56 : reg64) : $unsigned((+reg57))) ?
          (!((~&wire46) ?
              $signed(wire42) : ((8'hb6) ?
                  wire44 : (8'ha5)))) : $unsigned(((reg49 ?
              reg47 : wire42) ~^ (^~reg63)))));
    end
  assign wire68 = (^~wire34);
  assign wire69 = $unsigned(((~^$unsigned((wire59 ? (7'h44) : wire42))) ?
                      {(~^wire54[(1'h1):(1'h0)]),
                          $signed((~reg64))} : $unsigned($signed(wire45[(4'h9):(1'h0)]))));
  assign wire70 = $signed($unsigned($unsigned((~&$unsigned(reg65)))));
endmodule
