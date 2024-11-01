module top
#(parameter param192 = (~(&(8'hae))), 
parameter param193 = {param192, param192})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1f5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire191;
  wire signed [(5'h12):(1'h0)] wire190;
  wire signed [(5'h14):(1'h0)] wire179;
  wire signed [(3'h4):(1'h0)] wire159;
  wire [(3'h6):(1'h0)] wire158;
  wire signed [(4'hb):(1'h0)] wire157;
  wire [(3'h7):(1'h0)] wire156;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire154;
  reg signed [(3'h7):(1'h0)] reg189 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg188 = (1'h0);
  reg [(4'hf):(1'h0)] reg187 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg185 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg184 = (1'h0);
  reg signed [(4'he):(1'h0)] reg183 = (1'h0);
  reg [(4'hb):(1'h0)] reg182 = (1'h0);
  reg [(3'h6):(1'h0)] reg181 = (1'h0);
  reg [(4'he):(1'h0)] reg180 = (1'h0);
  reg [(2'h2):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg177 = (1'h0);
  reg [(5'h10):(1'h0)] reg176 = (1'h0);
  reg [(4'hd):(1'h0)] reg175 = (1'h0);
  reg [(5'h11):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg173 = (1'h0);
  reg [(5'h12):(1'h0)] reg172 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg167 = (1'h0);
  reg [(3'h7):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg165 = (1'h0);
  reg [(4'h9):(1'h0)] reg164 = (1'h0);
  reg [(4'hd):(1'h0)] reg163 = (1'h0);
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  reg [(3'h5):(1'h0)] reg161 = (1'h0);
  reg [(2'h3):(1'h0)] reg160 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire179,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire154,
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
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = ((~^wire1[(3'h5):(1'h1)]) ?
                     wire5[(4'hc):(4'hc)] : ({{(wire3 * (8'h9c))},
                         wire0} << (!$unsigned(wire2))));
  assign wire7 = ($unsigned((^wire1)) ?
                     wire3[(4'h8):(1'h1)] : (~((!(wire6 ?
                         wire2 : wire0)) > {((8'hb1) ^~ wire6)})));
  assign wire8 = (+(($unsigned(wire3) << wire7) ?
                     ($unsigned(wire1[(2'h3):(2'h2)]) ?
                         $unsigned((~|wire3)) : $signed(wire0[(4'h8):(4'h8)])) : $signed((wire1[(4'hf):(4'hd)] * (wire6 ?
                         wire2 : wire5)))));
  module9 #() modinst155 (.clk(clk), .wire14(wire8), .wire12(wire1), .wire11(wire7), .wire13(wire5), .y(wire154), .wire10(wire4));
  assign wire156 = {wire6,
                       {($signed((~|wire5)) ^ ({(8'hb7)} ?
                               (!wire8) : $unsigned(wire6)))}};
  assign wire157 = (+$signed((({wire4,
                       wire3} & wire2) > $signed($unsigned(wire6)))));
  assign wire158 = wire156[(1'h1):(1'h0)];
  assign wire159 = $unsigned((wire154 ?
                       wire157 : (&$unsigned(((8'ha8) + wire157)))));
  always
    @(posedge clk) begin
      if ((~^($unsigned(($unsigned(wire5) & wire154)) >>> ($unsigned((~|(8'haf))) ?
          (8'ha7) : ((wire4 ? wire7 : wire2) <<< (~^wire157))))))
        begin
          reg160 <= (wire156 >>> ((wire156[(1'h1):(1'h1)] ^ (&$unsigned(wire1))) ?
              $signed(($unsigned(wire7) ?
                  wire157 : $unsigned(wire4))) : $signed((wire1 ?
                  wire8 : wire154))));
          reg161 <= (|wire159);
          reg162 <= ((-$unsigned($signed((wire158 <<< wire154)))) != ((!wire159[(2'h2):(1'h1)]) > wire157[(2'h2):(2'h2)]));
          reg163 <= (~(~|$unsigned({$unsigned(wire6)})));
        end
      else
        begin
          reg160 <= wire6[(3'h5):(2'h2)];
          reg161 <= (wire2[(1'h0):(1'h0)] ?
              reg162[(2'h2):(1'h0)] : reg162[(5'h13):(4'h8)]);
          reg162 <= $unsigned((8'ha2));
          reg163 <= ($signed($unsigned(($signed(wire157) >>> wire0[(1'h1):(1'h1)]))) ?
              (8'hb9) : (wire2 - $unsigned($signed(wire2))));
        end
      reg164 <= {wire4, reg160[(1'h0):(1'h0)]};
      if ((($signed((wire7 ? wire156 : wire5)) ?
              wire156[(2'h3):(2'h2)] : $signed($unsigned((^reg161)))) ?
          (^(-wire159)) : $unsigned($unsigned($unsigned($signed(wire154))))))
        begin
          reg165 <= reg160;
        end
      else
        begin
          reg165 <= reg165[(4'hc):(4'h9)];
        end
      if ((+$unsigned(wire7)))
        begin
          reg166 <= wire7[(4'h9):(1'h0)];
          reg167 <= wire4;
        end
      else
        begin
          reg166 <= wire2;
          reg167 <= wire4;
          if (reg167)
            begin
              reg168 <= ((-$unsigned(((&wire154) ?
                      (~^wire156) : reg163[(3'h5):(3'h5)]))) ?
                  $unsigned(($unsigned($unsigned(wire3)) | $signed($signed(reg165)))) : ((!({reg162,
                              wire4} ?
                          (~|wire157) : (~|reg163))) ?
                      (((reg163 <= wire157) & reg160) - ({reg167,
                          reg163} >>> reg163[(3'h6):(3'h4)])) : (!wire156)));
              reg169 <= (($signed((((7'h41) ? wire2 : reg160) ?
                  (reg166 != wire8) : (wire158 >= wire156))) > reg167) ^~ {(8'hb5)});
              reg170 <= $unsigned($signed((({wire154,
                  wire0} || (~&reg167)) ^ $signed((wire0 ?
                  (8'hab) : (7'h43))))));
              reg171 <= ($signed({wire159, {$unsigned(reg164)}}) ?
                  {wire159[(2'h2):(2'h2)],
                      (8'ha3)} : $unsigned($unsigned($signed(((7'h42) < wire5)))));
              reg172 <= $signed((~^(~^$signed(wire158[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg168 <= (^$unsigned(($signed($signed(reg169)) && $unsigned((|reg163)))));
              reg169 <= $signed(reg165);
              reg170 <= (reg167[(2'h2):(2'h2)] >= {wire1});
            end
          if (($unsigned(wire5) >>> wire3))
            begin
              reg173 <= {wire154};
            end
          else
            begin
              reg173 <= $signed(reg162[(1'h0):(1'h0)]);
              reg174 <= (-reg170);
              reg175 <= (8'hb9);
              reg176 <= (&($signed(reg167[(3'h4):(2'h2)]) ?
                  reg175[(4'h9):(2'h3)] : $unsigned(wire6[(4'hd):(3'h7)])));
              reg177 <= ((({((8'hb9) ? wire8 : wire8), $unsigned((8'h9e))} ?
                      (+(8'ha3)) : reg161[(2'h2):(1'h1)]) && ((wire157[(4'h8):(3'h7)] ?
                          $unsigned(wire1) : (~reg160)) ?
                      wire1 : ($signed((8'hb7)) ? (^~reg168) : (^~wire157)))) ?
                  (reg166 & $signed({((8'hb8) <= reg163),
                      reg173[(3'h7):(2'h3)]})) : (7'h43));
            end
          reg178 <= (((reg167[(1'h1):(1'h1)] << ((+reg171) ^~ wire0[(4'ha):(4'h8)])) ?
                  {reg161[(3'h4):(1'h0)]} : (8'ha3)) ?
              reg171[(4'ha):(4'h8)] : $signed(wire7[(2'h3):(2'h3)]));
        end
    end
  assign wire179 = (^wire7[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      if ($unsigned((reg170 ?
          ($signed((wire8 & wire1)) ?
              ((wire2 ? (8'ha8) : wire7) ?
                  {wire3} : (^~wire0)) : $signed(wire0)) : {reg174})))
        begin
          if (wire156)
            begin
              reg180 <= reg165;
              reg181 <= reg180;
              reg182 <= {$unsigned(reg171[(2'h3):(2'h2)])};
              reg183 <= (~&wire8[(4'h8):(4'h8)]);
            end
          else
            begin
              reg180 <= $signed(wire2);
              reg181 <= reg173;
              reg182 <= (reg161[(1'h1):(1'h1)] <<< wire6);
            end
          reg184 <= (^~{(^((~|wire4) ?
                  (wire179 ? wire6 : reg170) : $unsigned(reg168)))});
          reg185 <= $signed({reg171[(4'h8):(3'h4)]});
          reg186 <= wire158;
          reg187 <= wire156;
        end
      else
        begin
          reg180 <= {($unsigned(reg178[(2'h2):(1'h1)]) == $signed($signed((reg176 - reg175)))),
              (8'ha1)};
          reg181 <= $signed({(~&reg177), reg169});
          reg182 <= ($signed($signed((~reg181))) ?
              (|wire156[(1'h1):(1'h1)]) : wire2[(2'h3):(1'h1)]);
          reg183 <= wire8[(3'h5):(1'h1)];
          reg184 <= $unsigned(reg174[(4'h8):(3'h4)]);
        end
      reg188 <= reg185[(4'hf):(3'h6)];
      reg189 <= reg172[(3'h5):(2'h3)];
    end
  assign wire190 = ((|$unsigned($signed((reg181 ?
                       reg166 : (7'h44))))) + (&((|(-reg180)) ?
                       $unsigned($unsigned(reg174)) : (8'h9c))));
  assign wire191 = reg175;
endmodule

module module9
#(parameter param152 = {(((((7'h44) <<< (7'h43)) ? (+(8'hb5)) : {(7'h41), (7'h41)}) ? {((8'ha0) & (8'ha2)), ((8'hb7) ^~ (8'hb5))} : ((|(8'hab)) ? ((8'ha7) > (8'hb0)) : ((8'haf) ? (8'ha2) : (8'haa)))) ? ((((8'hbd) ? (8'h9c) : (8'ha1)) < ((8'ha0) ? (8'hbf) : (8'hb2))) << ((~(8'hb7)) ? (^~(7'h42)) : ((8'h9f) ? (8'ha4) : (8'hb6)))) : {(+((8'ha2) ? (8'ha8) : (8'hb9))), ({(8'ha3), (8'hbe)} ? ((7'h43) ? (8'hbe) : (8'hba)) : ((8'ha6) ~^ (8'hb1)))}), (~&(({(8'had), (8'hb7)} ? (~|(8'ha1)) : ((8'hb3) ? (8'hb7) : (8'hba))) > (~&((8'hbf) >= (8'hb4)))))}, 
parameter param153 = ((8'ha9) ? (!(((&(8'hab)) > (+(8'hab))) != ((&param152) ? {param152} : (param152 && param152)))) : ({param152} && ({(!param152), (~&param152)} ? ((param152 >= param152) ? ((8'h9f) >>> (8'hbd)) : (param152 <<< param152)) : (~|(param152 ? param152 : param152))))))
(y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h226):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire148;
  wire [(4'hc):(1'h0)] wire147;
  wire [(5'h11):(1'h0)] wire146;
  wire [(4'hf):(1'h0)] wire145;
  wire [(4'h9):(1'h0)] wire144;
  wire [(2'h3):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire58;
  wire signed [(5'h12):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire112;
  wire signed [(4'hb):(1'h0)] wire125;
  reg signed [(4'hd):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(5'h14):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  assign y = {wire151,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire109,
                 wire62,
                 wire17,
                 wire21,
                 wire34,
                 wire36,
                 wire58,
                 wire111,
                 wire112,
                 wire125,
                 reg150,
                 reg149,
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
                 reg61,
                 reg60,
                 reg15,
                 reg16,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= (($signed(wire14[(1'h0):(1'h0)]) ?
              $signed($signed(wire11)) : wire14[(1'h0):(1'h0)]) ?
          (8'hb7) : (-(wire14 ?
              (|(|(8'h9f))) : $unsigned((wire10 != wire10)))));
      reg16 <= wire14;
    end
  assign wire17 = reg16[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg18 <= wire11[(4'hd):(4'h9)];
      reg19 <= {$unsigned(((^~wire13) ?
              (~|{wire12, (8'hbb)}) : (|(wire10 ? reg18 : reg18)))),
          $unsigned(reg16[(3'h5):(1'h0)])};
      reg20 <= {$unsigned({wire10[(3'h7):(3'h7)],
              ($signed(wire17) ^~ $unsigned(wire14))}),
          wire17};
    end
  assign wire21 = (reg20[(2'h2):(1'h1)] <= $signed(reg19));
  module22 #() modinst35 (.wire23(wire12), .wire25(reg20), .wire24(reg19), .y(wire34), .clk(clk), .wire26(wire14));
  assign wire36 = ((reg16 - wire14[(2'h2):(1'h0)]) != (~((wire14 + {wire10}) ?
                      {$unsigned(wire12), $unsigned(wire13)} : $signed((wire11 ?
                          reg20 : wire17)))));
  module37 #() modinst59 (wire58, clk, wire36, reg15, wire10, wire17);
  always
    @(posedge clk) begin
      reg60 <= wire12;
      reg61 <= wire11;
    end
  assign wire62 = $unsigned((~&wire21[(1'h1):(1'h0)]));
  module63 #() modinst110 (.wire68(wire58), .wire64(wire11), .wire67(wire13), .y(wire109), .wire65(wire14), .clk(clk), .wire66(wire62));
  assign wire111 = (wire36 <= ((~^(wire10[(4'ha):(1'h1)] ?
                       (~reg60) : ((8'ha5) ? (8'ha1) : reg18))) & (wire10 ?
                       ((wire62 << reg20) == (~&(8'ha8))) : $signed((reg61 ?
                           (8'hae) : (7'h43))))));
  assign wire112 = reg60;
  module113 #() modinst126 (wire125, clk, reg18, wire21, reg16, wire36, wire111);
  always
    @(posedge clk) begin
      if ({(-$unsigned((~wire10)))})
        begin
          reg127 <= (reg20[(3'h7):(3'h6)] - (wire10[(4'h9):(1'h0)] >= wire34));
        end
      else
        begin
          reg127 <= (({$unsigned(((8'h9e) ? wire12 : wire21)),
                  (8'ha3)} < (((~^reg19) ~^ $signed(reg20)) * (^wire111[(4'hc):(4'h9)]))) ?
              $signed(($unsigned((reg19 ? reg18 : wire112)) ?
                  (wire34 < (8'hb6)) : wire112)) : ($signed({wire10}) * (+reg60)));
          if ((($unsigned((~^{reg18, wire111})) ?
                  wire109 : reg18[(3'h6):(2'h3)]) ?
              (!(~^reg60[(3'h6):(3'h5)])) : $signed(((~(!(8'hac))) ^~ ((8'hbe) | reg19)))))
            begin
              reg128 <= $unsigned((8'ha8));
            end
          else
            begin
              reg128 <= (~&reg60);
              reg129 <= (+$unsigned(wire109));
              reg130 <= wire111;
            end
          reg131 <= {reg127, reg130};
          reg132 <= reg131[(1'h0):(1'h0)];
        end
      if (reg128[(4'hd):(4'h8)])
        begin
          reg133 <= $signed($unsigned(wire109));
          if ($signed(((&$unsigned($signed(wire12))) >= wire109[(2'h3):(2'h2)])))
            begin
              reg134 <= (((((reg132 ? reg132 : wire58) - (-(8'h9e))) ?
                          reg132[(1'h0):(1'h0)] : ($signed(reg131) >>> wire111)) ?
                      wire58 : (|(wire109[(1'h1):(1'h0)] ^ $signed((8'hb8))))) ?
                  (~|reg127) : (~&wire62[(1'h1):(1'h0)]));
              reg135 <= $signed({reg130[(3'h7):(3'h5)]});
              reg136 <= ((reg134[(2'h3):(2'h3)] ?
                  $unsigned($signed((reg16 | (8'hbc)))) : reg133) ^ wire17[(1'h1):(1'h1)]);
            end
          else
            begin
              reg134 <= (((((&reg127) ?
                              (reg135 ? reg19 : reg20) : $signed((8'had))) ?
                          (!reg61) : ($unsigned(reg127) ?
                              $unsigned(wire112) : $signed(reg136))) ?
                      ($signed(wire11[(3'h7):(1'h0)]) ?
                          reg60[(1'h0):(1'h0)] : wire125[(1'h1):(1'h0)]) : reg133[(4'hf):(4'hd)]) ?
                  ((wire34 * $unsigned(reg15)) ?
                      (((8'hb6) ? reg61 : (wire125 <= (8'ha0))) ?
                          (reg134 ?
                              (wire34 ? reg20 : reg133) : wire17) : ((wire112 ?
                                  reg15 : wire21) ?
                              (~&(8'hb2)) : wire10[(3'h7):(2'h3)])) : (+(reg135[(2'h3):(2'h2)] ~^ wire10[(4'hc):(3'h7)]))) : ((|(wire17 ?
                          (~^reg131) : (reg136 - wire17))) ?
                      (($signed(wire11) * (reg130 ? wire21 : wire112)) ?
                          $signed((wire12 > reg61)) : wire13) : ($unsigned(wire58) ?
                          ($signed(wire34) ?
                              reg18[(1'h1):(1'h0)] : wire58) : reg133)));
              reg135 <= (~&(8'hac));
              reg136 <= reg19[(1'h0):(1'h0)];
              reg137 <= ((-($signed(reg15) ^~ $signed((wire14 ?
                  wire14 : wire17)))) >> ((^~(^((7'h44) ?
                  reg134 : reg136))) != $signed(((8'ha5) ?
                  (reg135 >= reg127) : (reg128 ? wire125 : wire14)))));
            end
        end
      else
        begin
          reg133 <= reg134[(4'h9):(3'h7)];
          if ($unsigned(((wire112 ?
              (reg61 > $signed(reg16)) : reg61[(2'h2):(1'h1)]) | wire11)))
            begin
              reg134 <= $unsigned(($signed($unsigned((reg136 && wire58))) | $signed(reg136[(4'hd):(2'h2)])));
              reg135 <= $signed(wire111[(4'hd):(4'h9)]);
              reg136 <= reg135;
            end
          else
            begin
              reg134 <= reg128[(4'hf):(4'hd)];
              reg135 <= $unsigned(($signed((reg130[(2'h3):(1'h1)] ?
                      $signed((8'hae)) : (~^reg127))) ?
                  reg16 : (8'hbb)));
              reg136 <= (8'ha8);
              reg137 <= $signed($signed($signed(reg137)));
            end
          if (wire11)
            begin
              reg138 <= $signed({wire11[(4'ha):(4'h8)],
                  ({reg137} ?
                      $signed({(8'ha5)}) : ($signed(wire111) << (reg16 ?
                          wire14 : wire17)))});
              reg139 <= $signed(((~&($signed(reg18) >= $signed(reg15))) + $signed(reg15[(3'h6):(3'h6)])));
            end
          else
            begin
              reg138 <= ((~^(8'hba)) ?
                  (~$unsigned(reg131[(2'h2):(1'h1)])) : $unsigned(wire21));
              reg139 <= (~&wire21);
              reg140 <= ((~^(8'h9f)) ?
                  (8'hbc) : ((~&$signed((wire36 ? reg18 : reg128))) ?
                      ({wire58} ?
                          $unsigned((reg139 ? reg139 : wire21)) : (wire111 ?
                              reg60 : $signed((8'h9e)))) : reg128[(3'h5):(3'h5)]));
              reg141 <= wire58[(4'hf):(1'h1)];
            end
          reg142 <= wire112;
        end
      reg143 <= (reg15 ? (reg131 ^~ $signed(wire125)) : (8'hb4));
    end
  assign wire144 = (8'ha3);
  assign wire145 = (!($signed(wire17[(1'h1):(1'h0)]) ?
                       reg129[(3'h4):(2'h3)] : {$unsigned($unsigned(reg137))}));
  assign wire146 = $signed($signed((^~$signed((reg18 ^~ wire62)))));
  assign wire147 = (|(wire144[(1'h1):(1'h0)] ?
                       ((reg133 << $unsigned(wire11)) && $signed((wire144 ?
                           reg138 : reg135))) : (wire10 ?
                           wire62 : wire144[(2'h2):(2'h2)])));
  assign wire148 = (~^($unsigned((~|$signed((8'hb3)))) ?
                       $signed((|reg20[(3'h4):(2'h2)])) : ({((8'hb9) >>> wire147),
                           (reg18 ?
                               (8'h9f) : reg142)} << wire34[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      reg149 <= wire34;
      reg150 <= reg143;
    end
  assign wire151 = wire34[(4'hd):(4'hc)];
endmodule

module module113
#(parameter param124 = {(((+(~|(8'haf))) <<< ((~(8'ha6)) == (~|(8'h9f)))) <= ((((8'hbc) ? (8'hab) : (7'h42)) & (~(8'hbd))) ? (((8'hb8) ? (8'ha0) : (7'h44)) < {(8'hae), (8'hb3)}) : (((8'ha6) ? (8'hae) : (8'hbd)) ^~ ((7'h40) ? (8'h9d) : (8'hb0))))), (((7'h43) ? (!(+(8'hbe))) : (-{(8'ha5), (7'h42)})) ? (|(~(+(8'hb2)))) : (~|(&(8'hb0))))})
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire118;
  input wire signed [(5'h15):(1'h0)] wire117;
  input wire signed [(4'h8):(1'h0)] wire116;
  input wire [(5'h11):(1'h0)] wire115;
  input wire [(5'h12):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire122;
  wire signed [(5'h14):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire120;
  wire signed [(2'h2):(1'h0)] wire119;
  assign y = {wire123, wire122, wire121, wire120, wire119, (1'h0)};
  assign wire119 = ((($signed(wire118[(2'h2):(1'h1)]) ?
                       (((8'haa) >= (8'hb3)) ?
                           (wire115 ?
                               wire118 : (8'ha6)) : wire115) : $unsigned((wire115 != wire118))) >>> (^~(~{wire117,
                       wire114}))) < $unsigned(wire114));
  assign wire120 = (~{(!($unsigned(wire116) ?
                           (wire117 >> wire118) : $signed(wire114))),
                       ((8'hb3) & wire117)});
  assign wire121 = ($unsigned((wire120[(5'h14):(5'h12)] ?
                       (wire120[(1'h0):(1'h0)] ?
                           wire120[(5'h12):(2'h2)] : (~&wire116)) : $signed($signed(wire118)))) ^ ((wire117[(5'h13):(4'h8)] ?
                           ((~|wire119) ?
                               $signed(wire115) : wire118[(3'h7):(3'h5)]) : $signed((wire120 ?
                               wire118 : (8'hb2)))) ?
                       (wire120[(3'h7):(3'h7)] * ($signed(wire117) >>> $unsigned(wire119))) : (!(8'h9d))));
  assign wire122 = (~^(&$signed(((8'hbd) ?
                       $signed(wire120) : $signed(wire114)))));
  assign wire123 = (&($signed($signed(wire121)) >= (+(~&$unsigned(wire119)))));
endmodule

module module63
#(parameter param107 = (({({(8'ha4), (8'hb8)} << (^(7'h41))), (&((8'hb5) <<< (8'h9c)))} ? ((((8'hba) >>> (8'h9c)) ? (~^(8'had)) : {(8'ha4), (8'had)}) ? (~^(^(8'h9e))) : ({(8'hb0)} >> (-(8'h9c)))) : ((((8'hbf) ? (8'hbd) : (8'ha9)) << ((8'hb4) == (8'hbb))) != (((8'hb4) & (7'h40)) << ((8'ha0) > (8'hae))))) != (((((8'hb6) ~^ (8'hbe)) ~^ ((8'haf) - (8'haf))) || ((~&(8'hb5)) * ((8'haf) ? (7'h44) : (8'ha8)))) + ((!((8'hb4) >> (8'ha9))) ? (8'ha5) : (((8'hbe) >= (8'had)) | ((8'hb0) | (8'had)))))), 
parameter param108 = param107)
(y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h194):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire68;
  input wire signed [(3'h4):(1'h0)] wire67;
  input wire [(5'h13):(1'h0)] wire66;
  input wire signed [(4'h8):(1'h0)] wire65;
  input wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire103;
  wire signed [(4'ha):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire83;
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(5'h10):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 reg106,
                 reg105,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg69 <= (wire67[(2'h3):(1'h0)] + wire65);
      reg70 <= wire65;
      reg71 <= (^($unsigned({(^~wire64),
          (wire67 ? wire68 : (8'hbf))}) == $signed($signed(wire64))));
      if ($signed(wire64[(3'h7):(1'h1)]))
        begin
          if (wire65)
            begin
              reg72 <= $signed((^~wire67));
              reg73 <= $unsigned(({$unsigned((wire64 ? wire65 : (8'hb4))),
                  $unsigned(reg70[(3'h5):(1'h1)])} >> (8'hb7)));
              reg74 <= ((-{$signed({reg69}), $signed((^wire67))}) ?
                  (^~(&$unsigned(wire65))) : (8'h9f));
              reg75 <= $unsigned($unsigned(wire65[(1'h1):(1'h1)]));
              reg76 <= $unsigned(wire64);
            end
          else
            begin
              reg72 <= ((|wire66) ?
                  $unsigned($signed($unsigned((~wire68)))) : ($unsigned((7'h41)) && {((-(8'hbe)) <= $signed(wire65))}));
            end
          if ((((($unsigned(reg70) == $unsigned(wire67)) && $signed($unsigned(reg69))) ?
              {$signed((wire67 ? wire65 : reg74)),
                  reg73[(1'h0):(1'h0)]} : $signed(((reg71 ?
                  (8'ha6) : wire66) ~^ (reg71 ?
                  reg71 : wire65)))) || ($signed((~wire68[(3'h6):(3'h6)])) ?
              (&wire67) : wire65)))
            begin
              reg77 <= {reg75[(4'h8):(3'h7)],
                  (((~&(+(8'haa))) ~^ (reg74[(4'he):(4'he)] + (reg73 ?
                          wire65 : reg75))) ?
                      $unsigned((!$signed(reg74))) : ({$unsigned(wire67)} ?
                          {(^wire68)} : reg76))};
              reg78 <= ((($signed((~wire66)) ?
                          wire67[(2'h2):(1'h0)] : ({wire64} ^~ reg69[(1'h0):(1'h0)])) ?
                      {(((7'h42) ?
                              wire65 : (8'hbc)) >= reg76)} : reg72[(4'h9):(1'h1)]) ?
                  $signed($signed(((reg69 == reg70) ?
                      ((8'haa) ?
                          wire65 : reg72) : (!wire64)))) : $unsigned(($unsigned($unsigned(wire66)) != ({wire68,
                          wire65} ?
                      (reg76 >= reg74) : (reg76 ? reg69 : reg75)))));
              reg79 <= $signed((wire68 < (&reg69[(1'h1):(1'h0)])));
              reg80 <= $signed((~|(&(reg79 ? (!wire68) : $signed(wire68)))));
            end
          else
            begin
              reg77 <= reg76;
            end
          reg81 <= (($signed($signed(reg75)) ?
              {wire68[(5'h10):(3'h5)]} : wire66[(3'h6):(3'h4)]) ~^ (|(reg76[(1'h1):(1'h1)] ?
              $unsigned(reg73) : reg70)));
        end
      else
        begin
          reg72 <= reg74[(1'h1):(1'h1)];
          reg73 <= wire67[(2'h3):(2'h2)];
          if (reg78)
            begin
              reg74 <= $unsigned(reg72);
            end
          else
            begin
              reg74 <= wire67;
              reg75 <= ({reg70} ? reg80[(2'h2):(1'h0)] : reg70[(3'h6):(2'h3)]);
              reg76 <= ((^~reg73[(1'h1):(1'h1)]) && (($unsigned($unsigned(wire67)) == ((reg76 != wire64) ?
                  (~|reg71) : (reg80 <= wire67))) >= $signed({(wire67 ^~ reg72),
                  $unsigned(reg79)})));
              reg77 <= ((~$signed(reg74)) ?
                  $signed((^~$signed((reg79 >= reg71)))) : $signed(($signed((wire68 > wire66)) ?
                      reg70[(3'h6):(2'h2)] : (|{reg76}))));
            end
          reg78 <= reg77;
          reg79 <= wire68[(3'h4):(1'h1)];
        end
      reg82 <= {{reg72[(4'h8):(3'h6)]}, reg73};
    end
  assign wire83 = $signed((7'h43));
  assign wire84 = reg81[(2'h2):(1'h0)];
  assign wire85 = $signed((wire68 ?
                      ((^(wire84 ? (8'hbc) : wire64)) ?
                          $signed(reg74) : (8'hbe)) : reg81[(1'h1):(1'h1)]));
  assign wire86 = $signed(((8'hab) && ((&$signed(wire68)) ?
                      reg75[(3'h4):(1'h1)] : wire64[(3'h5):(3'h5)])));
  assign wire87 = {(reg80[(1'h0):(1'h0)] ?
                          {reg74[(4'hb):(2'h2)],
                              (&(|wire85))} : ((((8'hb1) <= wire86) != (+reg81)) <<< (reg74 ?
                              $signed(wire64) : $unsigned(wire66))))};
  assign wire88 = wire87;
  always
    @(posedge clk) begin
      reg89 <= wire65[(3'h6):(3'h6)];
      reg90 <= (^~{(reg74[(3'h4):(3'h4)] ? reg81 : reg80)});
    end
  always
    @(posedge clk) begin
      if ($signed($unsigned(($signed($signed(wire64)) >>> ((reg89 ^~ reg82) ?
          reg82[(2'h2):(1'h1)] : (reg72 <<< wire83))))))
        begin
          reg91 <= wire64[(4'h8):(2'h2)];
          if ({(^~((&reg81) && wire84[(4'h9):(2'h2)]))})
            begin
              reg92 <= $unsigned($signed($unsigned($signed(wire65))));
              reg93 <= (($unsigned($unsigned(reg80[(1'h0):(1'h0)])) != $unsigned(reg92)) ?
                  ({reg80[(1'h0):(1'h0)], $signed($unsigned(wire86))} ?
                      (((~|wire66) ?
                              {wire67, wire64} : (reg71 ? wire65 : reg74)) ?
                          (((8'ha1) ? wire86 : reg70) ?
                              reg72[(4'hd):(3'h7)] : reg69[(1'h1):(1'h0)]) : ($unsigned(reg72) ^~ $signed(reg76))) : reg73[(4'h8):(3'h5)]) : wire84[(4'h9):(3'h5)]);
            end
          else
            begin
              reg92 <= (($signed(wire85) ?
                      reg79[(3'h7):(2'h3)] : (^~($unsigned(wire83) >>> {wire88,
                          reg79}))) ?
                  {reg70,
                      $unsigned((reg75[(2'h3):(1'h0)] >= (reg72 <= reg89)))} : (8'hb5));
              reg93 <= $signed($signed(wire65[(3'h5):(2'h2)]));
            end
        end
      else
        begin
          reg91 <= $unsigned((wire66 ?
              $unsigned(($unsigned((8'hbb)) == reg92)) : {$unsigned((reg93 ?
                      wire68 : reg74)),
                  ((~|reg77) || reg69)}));
          reg92 <= $unsigned({reg70[(4'h8):(2'h2)]});
          reg93 <= (reg77[(1'h1):(1'h0)] == ($signed($unsigned($unsigned(reg89))) >> $signed((|((7'h41) << wire68)))));
          if ((^~$unsigned($signed($signed($signed(wire83))))))
            begin
              reg94 <= ({$signed(reg71), $signed({{reg71}})} ?
                  (^(8'ha3)) : reg69);
              reg95 <= wire66[(2'h2):(1'h1)];
              reg96 <= $unsigned($signed($signed(reg79[(3'h5):(2'h3)])));
              reg97 <= (&$unsigned((-((reg82 ? reg92 : wire84) + (wire86 ?
                  wire64 : reg96)))));
              reg98 <= ((wire86[(4'hb):(3'h5)] ?
                      $unsigned({reg80[(1'h0):(1'h0)],
                          (wire85 ? reg94 : reg82)}) : (((^reg95) ?
                              (reg75 ? reg74 : reg92) : (reg97 | wire83)) ?
                          (reg69 & reg93) : $signed(reg89[(1'h1):(1'h1)]))) ?
                  wire87 : $signed(wire84[(3'h6):(1'h1)]));
            end
          else
            begin
              reg94 <= reg92[(3'h7):(3'h4)];
              reg95 <= $unsigned((($signed((reg77 ? (7'h43) : reg98)) ?
                  $unsigned($unsigned(wire86)) : (7'h42)) & reg69));
              reg96 <= (reg75 <= {(8'had)});
              reg97 <= reg79;
              reg98 <= $unsigned($unsigned(wire87));
            end
        end
      reg99 <= reg92[(4'h8):(1'h1)];
      reg100 <= (+$signed((reg78[(5'h11):(5'h10)] <<< ($unsigned((8'ha2)) ?
          (8'h9e) : (&reg82)))));
    end
  assign wire101 = reg91;
  assign wire102 = reg69;
  assign wire103 = $signed((({{(7'h44), reg77}} ?
                           (reg69 + (reg78 != reg93)) : $signed($unsigned(reg93))) ?
                       ((~|(~|wire83)) ?
                           (&(-wire65)) : (&wire101[(4'hb):(3'h7)])) : wire85[(3'h6):(1'h0)]));
  assign wire104 = (reg73 ?
                       wire87[(1'h1):(1'h1)] : ($signed(((reg90 + reg98) != {wire83,
                           (7'h41)})) == ($unsigned($signed(wire65)) ?
                           wire101[(3'h5):(2'h2)] : $unsigned((wire64 ^~ reg81)))));
  always
    @(posedge clk) begin
      reg105 <= (8'h9c);
      reg106 <= $signed(((~^$unsigned((reg75 >>> reg92))) ?
          ($unsigned($unsigned(wire84)) ?
              $unsigned($signed(reg76)) : $unsigned({wire104,
                  reg69})) : (reg72[(4'hb):(2'h2)] <= $unsigned({reg100,
              reg97}))));
    end
endmodule

module module37  (y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire41;
  input wire [(4'ha):(1'h0)] wire40;
  input wire [(4'he):(1'h0)] wire39;
  input wire [(3'h7):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire42;
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire42,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire42 = ((^wire39) < ($unsigned((wire41[(2'h2):(1'h0)] + {wire41,
                          wire40})) ?
                      (~^$unsigned((~&wire40))) : (!(&$unsigned(wire38)))));
  always
    @(posedge clk) begin
      if (((~&(wire39 ?
          $signed((wire42 ^ wire41)) : wire39)) >> {(wire41[(4'hf):(3'h7)] ?
              wire38 : wire39)}))
        begin
          reg43 <= ($signed(wire38[(3'h6):(1'h1)]) ^~ wire42[(2'h3):(2'h2)]);
          if (reg43[(3'h5):(3'h5)])
            begin
              reg44 <= (wire38[(3'h4):(3'h4)] ?
                  {$unsigned(wire42)} : (~|(+(wire40 ~^ {wire41, wire41}))));
              reg45 <= ((~&$unsigned($unsigned($unsigned(reg43)))) + (((^~((8'ha3) ?
                          (8'hb2) : wire38)) ?
                      wire38 : ((reg43 >= reg44) ~^ (wire40 << wire40))) ?
                  $unsigned(((wire42 & wire39) ?
                      $signed(wire39) : wire41[(4'h9):(3'h5)])) : {$signed((+wire41))}));
              reg46 <= (reg44 ? {wire42} : reg44[(4'he):(3'h7)]);
              reg47 <= reg43;
              reg48 <= ($unsigned($unsigned($signed(((8'hb5) ?
                      wire39 : reg44)))) ?
                  wire39[(4'hc):(4'h9)] : {{($signed(wire42) | $signed((7'h42)))}});
            end
          else
            begin
              reg44 <= $unsigned((wire38[(3'h4):(3'h4)] ~^ wire38));
              reg45 <= reg48[(1'h0):(1'h0)];
              reg46 <= $unsigned($unsigned($unsigned(($signed(reg48) & (-wire39)))));
              reg47 <= (reg47 ?
                  ($signed(($signed(reg47) ? wire42[(1'h0):(1'h0)] : (8'hae))) ?
                      (~^$unsigned($unsigned(reg43))) : reg47) : wire42[(3'h5):(1'h0)]);
              reg48 <= $unsigned({$signed($signed((^~reg43)))});
            end
        end
      else
        begin
          reg43 <= reg46[(4'ha):(2'h3)];
          if ($unsigned(wire38))
            begin
              reg44 <= {wire39[(3'h5):(3'h4)], $unsigned(wire41)};
            end
          else
            begin
              reg44 <= wire38;
              reg45 <= wire42;
            end
          reg46 <= ($signed(reg43) < reg46[(2'h2):(2'h2)]);
          reg47 <= reg46;
        end
      reg49 <= (~reg46);
      reg50 <= ((reg49 ?
              reg48[(1'h1):(1'h1)] : ($signed($unsigned(wire42)) ~^ reg47)) ?
          reg46 : reg45);
      reg51 <= $unsigned((-(~|{{reg46, reg47}, {reg49}})));
    end
  assign wire52 = $signed($unsigned((reg46[(1'h0):(1'h0)] < wire38)));
  assign wire53 = $unsigned(wire38[(3'h4):(3'h4)]);
  assign wire54 = (wire38[(3'h4):(2'h2)] ?
                      reg50[(4'hd):(3'h7)] : {(+(wire53[(1'h0):(1'h0)] ?
                              (wire41 ? reg43 : wire52) : $unsigned(wire41))),
                          ($unsigned((wire52 != wire40)) * (~&reg45[(3'h4):(2'h3)]))});
  assign wire55 = (wire41[(1'h0):(1'h0)] ?
                      $signed(reg47) : (($unsigned(reg46[(1'h0):(1'h0)]) ?
                              reg49 : ((wire40 ?
                                  wire39 : reg49) >>> reg48[(3'h4):(2'h2)])) ?
                          ($signed(reg47[(3'h6):(2'h3)]) ~^ ((~|reg49) ?
                              reg45 : $unsigned(wire41))) : wire53));
  assign wire56 = wire54[(2'h2):(1'h0)];
  assign wire57 = $signed(($signed((&reg45)) ^ reg48[(3'h5):(1'h0)]));
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire26;
  input wire [(3'h6):(1'h0)] wire25;
  input wire signed [(4'hb):(1'h0)] wire24;
  input wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  assign y = {wire33, wire32, wire31, wire30, wire29, wire28, wire27, (1'h0)};
  assign wire27 = (wire25[(1'h1):(1'h1)] ?
                      {(^~wire25[(2'h3):(2'h3)]),
                          (~^$signed(wire25[(3'h4):(2'h2)]))} : {{($signed(wire25) & wire26[(2'h2):(1'h0)]),
                              $signed(wire26)}});
  assign wire28 = wire23;
  assign wire29 = (!(-(((^wire24) ?
                      wire27 : $signed(wire26)) && (~|$signed(wire23)))));
  assign wire30 = $signed($signed(($signed(wire25[(3'h6):(1'h1)]) && ({wire28,
                      wire24} <= wire26[(1'h1):(1'h0)]))));
  assign wire31 = (~&wire23);
  assign wire32 = wire28;
  assign wire33 = ({$signed(wire27[(4'hb):(2'h3)])} << $unsigned((^($signed(wire31) ?
                      $signed(wire24) : $signed((8'ha1))))));
endmodule
