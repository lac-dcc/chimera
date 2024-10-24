module top
#(parameter param209 = ((({{(7'h44)}, ((8'hab) ? (8'hab) : (8'ha3))} - (((7'h44) ? (8'hb7) : (8'ha8)) ^ (~(8'hbb)))) ? ((((8'hbf) ? (8'h9f) : (8'hba)) ? (+(7'h42)) : ((8'ha2) << (8'hb0))) <= ({(8'hbe), (8'hbd)} <<< ((8'hb2) + (8'hab)))) : (({(8'ha5)} + (8'hbc)) ? {((8'hbe) && (7'h40)), (~|(8'hb3))} : (((8'ha1) ? (7'h40) : (8'had)) && (~|(8'ha9))))) ? (((~&{(8'hb9)}) ? (((8'hb0) & (8'hb2)) | ((8'ha8) && (8'hb1))) : ({(8'h9d), (7'h43)} ? (|(8'hb0)) : ((8'ha8) ? (8'ha2) : (8'hb4)))) ? (8'ha1) : {(~|((8'hb8) ? (7'h44) : (8'h9d))), ({(8'ha0), (8'hbb)} ? ((8'ha4) ? (8'hb0) : (8'ha9)) : {(8'hb4)})}) : (((((8'hb5) ~^ (8'h9e)) * (~&(8'hb2))) <= (|(!(8'h9c)))) << ({(8'hb6)} ^~ ({(7'h44), (8'hb1)} ? {(8'ha6)} : (^(8'hb5)))))), 
parameter param210 = (({(8'ha8)} ? (((8'hbc) > param209) <= ((~^param209) - (!param209))) : (((~&param209) ? (param209 ? param209 : param209) : ((8'hb0) >= (8'had))) ? (~^((8'ha8) > param209)) : {(param209 && param209)})) != ((^({param209, param209} ^ param209)) || (param209 > (param209 << param209)))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire208;
  wire [(3'h4):(1'h0)] wire207;
  wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire195;
  wire [(5'h15):(1'h0)] wire197;
  wire [(3'h4):(1'h0)] wire198;
  wire [(4'ha):(1'h0)] wire205;
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  reg [(2'h3):(1'h0)] reg199 = (1'h0);
  reg [(5'h12):(1'h0)] reg200 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg201 = (1'h0);
  reg [(3'h5):(1'h0)] reg202 = (1'h0);
  reg [(5'h13):(1'h0)] reg203 = (1'h0);
  reg [(4'hf):(1'h0)] reg204 = (1'h0);
  assign y = {wire208,
                 wire207,
                 wire4,
                 wire11,
                 wire195,
                 wire197,
                 wire198,
                 wire205,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg199,
                 reg200,
                 reg201,
                 reg202,
                 reg203,
                 reg204,
                 (1'h0)};
  assign wire4 = (($unsigned($unsigned((wire2 >= wire2))) || (!wire2)) > (((8'hbe) ?
                     ((wire2 * wire3) ?
                         wire1 : $signed(wire2)) : (wire2 ^~ (wire1 ?
                         wire1 : wire2))) | $unsigned((^(wire1 ^~ wire2)))));
  always
    @(posedge clk) begin
      reg5 <= ((!wire3[(2'h3):(1'h1)]) >> ({$signed($unsigned(wire1)), wire0} ?
          wire3[(4'h9):(3'h5)] : wire3[(3'h6):(3'h4)]));
      if ((~|((8'h9d) ?
          $unsigned($unsigned(wire0)) : {$unsigned($unsigned(wire0))})))
        begin
          reg6 <= $signed(($signed({(reg5 ? reg5 : wire4), (wire3 >>> reg5)}) ?
              (7'h40) : $unsigned($unsigned($signed(wire2)))));
          reg7 <= (wire3[(2'h2):(2'h2)] ?
              (((|(wire4 ? wire4 : wire1)) ?
                      $unsigned((wire4 + reg6)) : $unsigned((~&wire1))) ?
                  reg6[(4'h8):(3'h5)] : wire2) : ((^~(^(wire4 ?
                      reg6 : wire0))) ?
                  wire3 : reg6));
        end
      else
        begin
          reg6 <= $unsigned(wire2[(3'h7):(2'h2)]);
          reg7 <= $signed($signed((reg7[(4'h9):(1'h0)] ?
              $signed((reg6 < wire2)) : ((reg6 << reg5) & reg7[(2'h2):(1'h0)]))));
        end
      reg8 <= $unsigned(reg6[(4'hc):(4'h9)]);
      reg9 <= wire4;
      reg10 <= $unsigned((wire0[(1'h1):(1'h0)] ?
          ((8'ha0) & {$unsigned(reg7),
              (reg9 ~^ wire2)}) : (reg8 ~^ wire4[(4'ha):(3'h7)])));
    end
  assign wire11 = (~|(!((|$signed(reg8)) >> reg5[(4'h8):(2'h3)])));
  always
    @(posedge clk) begin
      reg12 <= $signed(wire0[(4'hb):(3'h5)]);
      if ((($signed(reg12) ? reg8 : $signed(reg12[(2'h2):(1'h1)])) ?
          ($signed($unsigned((wire0 ? reg9 : reg7))) ?
              (~&{$unsigned(wire3),
                  (reg12 ? reg8 : wire11)}) : (8'hb4)) : wire1))
        begin
          reg13 <= $unsigned($unsigned((reg6[(4'he):(4'hd)] ?
              (|{wire11}) : ((wire0 & reg10) << (8'h9e)))));
          reg14 <= {$signed((~^reg6[(4'h8):(1'h0)])),
              $signed({reg7, wire4[(1'h1):(1'h1)]})};
          reg15 <= $unsigned($unsigned(($signed((reg10 ? (8'hab) : wire0)) ?
              (((8'had) != (8'ha5)) ?
                  (reg8 ~^ (8'ha5)) : (~wire3)) : ($signed(reg12) + (reg6 >> reg6)))));
        end
      else
        begin
          if (($signed(wire1) * $signed($unsigned($signed((reg15 ?
              wire11 : reg9))))))
            begin
              reg13 <= {wire11[(1'h0):(1'h0)]};
              reg14 <= (reg6[(2'h3):(1'h0)] <= reg9[(2'h2):(2'h2)]);
              reg15 <= ((~&(reg13[(1'h0):(1'h0)] ?
                  (-(reg7 + wire11)) : (+reg10))) < (-(wire11 ?
                  reg14[(4'hd):(3'h4)] : $signed($unsigned(reg14)))));
              reg16 <= (reg13 ?
                  (wire1 ?
                      $unsigned(($unsigned(reg7) ?
                          $unsigned((8'hbc)) : (8'hbb))) : (^~(|$signed(reg12)))) : (($unsigned((~&wire0)) << wire1) ?
                      ((8'h9d) || ({reg14} || reg6)) : ($signed($signed(reg6)) != $signed((^~wire3)))));
              reg17 <= (((7'h43) ?
                  wire1[(4'h8):(3'h5)] : (reg12[(3'h4):(2'h3)] <= (^~reg9))) && {$signed(reg10[(2'h3):(2'h3)]),
                  reg12});
            end
          else
            begin
              reg13 <= $unsigned((reg5[(3'h4):(2'h3)] + $signed(wire2[(4'hc):(3'h4)])));
              reg14 <= $signed((reg16 ?
                  $unsigned($unsigned((wire1 ? reg6 : reg14))) : (({wire3} ?
                      (~|reg7) : $signed((8'ha4))) - ($unsigned(reg7) ?
                      (+wire0) : wire11))));
              reg15 <= (wire3 >> (~|wire3[(1'h1):(1'h0)]));
              reg16 <= (reg7 + $unsigned((-{reg9[(3'h6):(3'h6)], reg14})));
              reg17 <= wire2[(2'h3):(1'h0)];
            end
        end
      reg18 <= (~$unsigned(reg9));
      reg19 <= (~(+(reg5 || $signed(reg17[(4'hb):(2'h3)]))));
      reg20 <= (~&reg14[(3'h6):(3'h5)]);
    end
  module21 #() modinst196 (wire195, clk, reg12, reg15, wire2, wire0, reg8);
  assign wire197 = reg15[(4'ha):(4'h8)];
  assign wire198 = $unsigned($unsigned((8'h9f)));
  always
    @(posedge clk) begin
      reg199 <= $unsigned((8'hbd));
      if (reg12[(4'hc):(2'h2)])
        begin
          reg200 <= $unsigned((8'haa));
        end
      else
        begin
          if ((~$signed((8'haa))))
            begin
              reg200 <= (+($unsigned($signed((^~wire0))) >>> reg12[(4'hc):(4'ha)]));
              reg201 <= (wire2 ?
                  $signed((8'hbc)) : $signed({{reg199, reg200[(4'he):(2'h3)]},
                      $unsigned((~|reg17))}));
              reg202 <= $unsigned((($unsigned($unsigned(wire195)) < wire197[(5'h14):(5'h14)]) * {$signed((&wire198))}));
              reg203 <= (^~(({$unsigned(reg6), $signed(reg14)} ?
                      ({reg14} ? $signed(wire1) : $signed(reg16)) : ((|reg202) ?
                          {(8'hae), wire1} : (reg8 || wire198))) ?
                  (+reg201) : (8'ha1)));
            end
          else
            begin
              reg200 <= reg16;
              reg201 <= {wire198[(2'h2):(1'h1)]};
            end
        end
      reg204 <= wire4;
    end
  module36 #() modinst206 (wire205, clk, reg203, wire2, reg20, reg19);
  assign wire207 = (!$unsigned((wire197 == $signed($signed(wire197)))));
  assign wire208 = $signed(wire0);
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h1bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire26;
  input wire signed [(5'h12):(1'h0)] wire25;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire [(4'hc):(1'h0)] wire23;
  input wire [(4'hc):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire193;
  wire signed [(5'h15):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire164;
  wire [(4'h8):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire110;
  wire signed [(3'h5):(1'h0)] wire111;
  wire [(4'hb):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire113;
  wire [(3'h7):(1'h0)] wire114;
  wire signed [(4'hb):(1'h0)] wire162;
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  assign y = {wire193,
                 wire165,
                 wire164,
                 wire107,
                 wire61,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire109,
                 wire110,
                 wire111,
                 wire112,
                 wire113,
                 wire114,
                 wire162,
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
                 (1'h0)};
  assign wire27 = wire24;
  assign wire28 = wire27;
  assign wire29 = wire25[(4'h9):(3'h7)];
  assign wire30 = (((^~$signed(((7'h43) ?
                          wire28 : wire27))) ^~ wire22[(1'h1):(1'h0)]) ?
                      wire25 : (+$signed((~|wire25))));
  assign wire31 = wire26;
  assign wire32 = wire29;
  assign wire33 = wire31;
  assign wire34 = $unsigned($signed({((wire32 ? wire32 : wire23) ?
                          wire24[(4'h9):(4'h8)] : (8'ha3)),
                      (8'hb0)}));
  assign wire35 = ($signed(($signed(wire26) ?
                      $signed(wire25) : $unsigned(((8'ha4) ?
                          wire34 : wire22)))) <= (-(|(|(~wire32)))));
  module36 #() modinst62 (.clk(clk), .wire37(wire35), .wire38(wire22), .wire40(wire26), .y(wire61), .wire39(wire33));
  module63 #() modinst108 (.clk(clk), .wire64(wire32), .wire67(wire28), .y(wire107), .wire66(wire25), .wire65(wire29), .wire68(wire22));
  assign wire109 = wire25[(3'h4):(2'h2)];
  assign wire110 = ({($signed((+wire32)) | wire33[(3'h5):(2'h2)]),
                       wire29} >> (~&(8'hbf)));
  assign wire111 = (+wire110[(4'hb):(2'h2)]);
  assign wire112 = wire30;
  assign wire113 = ({(wire107 << wire61),
                       {wire30[(1'h0):(1'h0)],
                           ((wire109 ? wire31 : wire25) ?
                               wire107 : $unsigned(wire112))}} ~^ ((($signed(wire22) ?
                           (7'h42) : (wire28 > (8'h9d))) | $unsigned((wire110 - wire109))) ?
                       {$unsigned((wire112 ?
                               wire110 : wire25))} : wire30[(1'h0):(1'h0)]));
  assign wire114 = (~wire29[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg115 <= wire29[(3'h5):(2'h3)];
      reg116 <= reg115[(1'h1):(1'h1)];
      reg117 <= ({($signed(wire35[(3'h5):(1'h0)]) ~^ $unsigned($signed(wire112))),
          (^$signed(((8'hbd) ?
              (8'ha7) : (8'hbf))))} & $unsigned($signed((wire24 & $unsigned(wire110)))));
      if ($unsigned($signed(((+((7'h41) | wire22)) ?
          wire111 : ({wire109} ? (!wire28) : (wire26 | wire33))))))
        begin
          reg118 <= wire113[(4'hc):(1'h0)];
          if (wire25[(4'h9):(3'h4)])
            begin
              reg119 <= (~&$signed(((reg118 <= wire29) ?
                  $unsigned(wire111[(3'h4):(2'h2)]) : wire107)));
            end
          else
            begin
              reg119 <= wire114[(1'h1):(1'h0)];
              reg120 <= wire111[(3'h5):(3'h5)];
              reg121 <= (($signed(({wire109} >>> {wire113})) + ((~^(+wire33)) ?
                      ($unsigned(wire22) * wire28) : {wire113})) ?
                  ($signed(({wire33,
                      wire22} <<< wire28[(4'h9):(3'h5)])) + {$signed((~wire25)),
                      $unsigned(wire114)}) : wire113[(4'hc):(4'ha)]);
              reg122 <= (-(+wire61));
            end
          reg123 <= wire110[(4'hd):(4'ha)];
          reg124 <= $signed(((&$unsigned(wire22)) ?
              ((~&(reg116 ~^ wire110)) ?
                  $unsigned(reg121) : $unsigned((wire28 ?
                      reg123 : wire29))) : $signed(({wire110, wire109} ?
                  {wire31, wire35} : $signed(wire35)))));
          reg125 <= wire22[(3'h7):(3'h5)];
        end
      else
        begin
          reg118 <= wire27[(1'h0):(1'h0)];
          reg119 <= $signed((-(-{wire109[(2'h2):(1'h1)],
              reg121[(4'h9):(1'h1)]})));
          reg120 <= $unsigned({(~reg117)});
        end
      reg126 <= wire107[(2'h2):(1'h0)];
    end
  module127 #() modinst163 (wire162, clk, wire24, wire23, reg122, wire27);
  assign wire164 = (^~reg121[(5'h15):(4'h8)]);
  assign wire165 = (+(8'ha6));
  module166 #() modinst194 (wire193, clk, reg118, wire165, wire114, wire112, wire35);
endmodule

module module166
#(parameter param191 = (8'hae), 
parameter param192 = (-(param191 ? (8'had) : param191)))
(y, clk, wire171, wire170, wire169, wire168, wire167);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire171;
  input wire [(5'h11):(1'h0)] wire170;
  input wire [(2'h3):(1'h0)] wire169;
  input wire [(4'h8):(1'h0)] wire168;
  input wire signed [(4'hd):(1'h0)] wire167;
  wire [(5'h10):(1'h0)] wire183;
  wire [(5'h10):(1'h0)] wire182;
  wire signed [(3'h5):(1'h0)] wire173;
  wire [(5'h14):(1'h0)] wire172;
  reg [(3'h4):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg189 = (1'h0);
  reg [(3'h4):(1'h0)] reg188 = (1'h0);
  reg [(4'hb):(1'h0)] reg187 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg185 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg184 = (1'h0);
  reg [(4'hd):(1'h0)] reg181 = (1'h0);
  reg [(5'h15):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg179 = (1'h0);
  reg [(4'hf):(1'h0)] reg178 = (1'h0);
  reg signed [(4'he):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg174 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire173,
                 wire172,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 (1'h0)};
  assign wire172 = $signed($signed(($unsigned($signed(wire170)) || wire168)));
  assign wire173 = (~^wire167[(4'h8):(3'h5)]);
  always
    @(posedge clk) begin
      if (({(~^((&wire170) ? (^(7'h41)) : {wire172}))} <= wire167))
        begin
          reg174 <= ($unsigned((~(~^(^wire170)))) << (~^(~|($signed(wire171) ^~ (wire172 ?
              (8'h9d) : wire172)))));
          if (wire168[(4'h8):(3'h4)])
            begin
              reg175 <= $signed(wire173);
            end
          else
            begin
              reg175 <= reg175;
              reg176 <= (~&$unsigned($unsigned((|$signed(wire169)))));
            end
          reg177 <= reg175[(2'h3):(1'h0)];
        end
      else
        begin
          reg174 <= (!$unsigned((~^$signed({reg177, wire171}))));
          if ((($signed(((+reg176) ?
              (wire168 < reg175) : (wire171 ?
                  reg177 : wire169))) <<< $signed(wire170[(1'h0):(1'h0)])) ~^ {{wire170[(4'h8):(4'h8)]}}))
            begin
              reg175 <= $signed(wire173);
              reg176 <= ((~|$signed($signed((|reg177)))) ?
                  ((!(~|(+wire172))) >> {({(7'h44),
                          reg176} - wire169[(1'h1):(1'h1)]),
                      ($unsigned((8'hb8)) | ((8'hb2) ?
                          (8'hb0) : reg175))}) : $signed(((+(wire167 ?
                          (8'had) : wire173)) ?
                      (!$signed(wire171)) : (^~wire170))));
              reg177 <= wire173[(1'h1):(1'h1)];
              reg178 <= wire173;
              reg179 <= $unsigned($unsigned((((reg177 ^ wire172) + (reg177 ?
                      wire167 : wire168)) ?
                  (+{reg178, reg175}) : ($unsigned(wire173) ?
                      $signed(wire169) : $signed(reg177)))));
            end
          else
            begin
              reg175 <= $unsigned((~&((8'ha7) ?
                  {$signed((8'ha3))} : ($signed(wire167) < $unsigned(wire167)))));
            end
          reg180 <= reg175[(2'h3):(2'h3)];
        end
      reg181 <= (8'ha5);
    end
  assign wire182 = $unsigned((($signed(reg174) ?
                       (reg179 >= (wire169 >= (8'hbc))) : (wire171[(1'h1):(1'h1)] ?
                           {reg180} : {reg180,
                               wire170})) << wire172[(4'hd):(4'h8)]));
  assign wire183 = reg180[(5'h14):(4'hb)];
  always
    @(posedge clk) begin
      if (($signed(({wire169[(2'h3):(2'h3)]} != wire167)) + reg181))
        begin
          reg184 <= $unsigned($unsigned(reg174));
          if (((($unsigned((reg177 >>> reg174)) ^ ((reg177 ?
                  reg175 : reg176) <<< (^reg178))) ?
              wire173[(2'h3):(1'h0)] : ($unsigned((reg179 ?
                  wire169 : reg178)) + (&(wire169 ?
                  (8'ha5) : wire169)))) <<< (wire172 ?
              (~(|reg184[(2'h3):(1'h1)])) : (-{(wire169 ? wire182 : reg178),
                  reg178}))))
            begin
              reg185 <= ((^reg179[(4'he):(4'hb)]) ?
                  wire167 : $signed((^$unsigned($unsigned(wire168)))));
              reg186 <= {wire183};
            end
          else
            begin
              reg185 <= (!{(($signed(reg184) ?
                      reg176 : $signed(wire168)) >>> (((8'hbb) ?
                          (8'ha0) : reg178) ?
                      wire170[(1'h1):(1'h0)] : (reg186 && wire183))),
                  reg174});
            end
          reg187 <= $unsigned(wire168);
          reg188 <= (((wire172 == (|wire170[(3'h7):(3'h5)])) <= reg179[(1'h1):(1'h0)]) < ((^reg180) ?
              ($unsigned((wire183 ? reg180 : reg185)) ?
                  (8'ha6) : ((7'h40) ^~ $unsigned(wire172))) : (^~(8'hb3))));
          reg189 <= (|wire169);
        end
      else
        begin
          reg184 <= ((^~$signed($unsigned((wire169 - reg186)))) ~^ reg174[(2'h3):(2'h3)]);
        end
      reg190 <= $signed({reg188});
    end
endmodule

module module127  (y, clk, wire131, wire130, wire129, wire128);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire131;
  input wire signed [(4'hc):(1'h0)] wire130;
  input wire [(3'h4):(1'h0)] wire129;
  input wire [(5'h14):(1'h0)] wire128;
  wire [(4'h8):(1'h0)] wire161;
  wire [(4'h8):(1'h0)] wire160;
  wire [(5'h11):(1'h0)] wire159;
  wire [(4'h8):(1'h0)] wire158;
  wire [(5'h15):(1'h0)] wire157;
  wire signed [(5'h12):(1'h0)] wire150;
  wire [(3'h5):(1'h0)] wire149;
  wire signed [(3'h6):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire137;
  wire signed [(4'hd):(1'h0)] wire136;
  wire signed [(5'h14):(1'h0)] wire135;
  wire signed [(4'hd):(1'h0)] wire134;
  wire signed [(4'hf):(1'h0)] wire133;
  wire signed [(3'h4):(1'h0)] wire132;
  reg [(5'h13):(1'h0)] reg156 = (1'h0);
  reg [(4'h9):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(4'hf):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  reg [(5'h12):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg144 = (1'h0);
  reg [(4'hf):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg140 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire150,
                 wire149,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 (1'h0)};
  assign wire132 = $unsigned({wire130[(2'h2):(1'h1)]});
  assign wire133 = {wire130,
                       $signed($unsigned((((8'hb7) >>> wire132) ?
                           (~&wire128) : (wire132 <<< (7'h43)))))};
  assign wire134 = wire128[(3'h6):(3'h4)];
  assign wire135 = wire134[(4'hb):(4'hb)];
  assign wire136 = (~|(($unsigned((~|wire134)) ?
                           $unsigned((wire134 ?
                               wire128 : wire135)) : {$unsigned(wire130)}) ?
                       $unsigned(((^wire134) ?
                           {(8'hbd),
                               wire135} : (~|wire129))) : $signed(wire131[(4'hd):(4'h8)])));
  assign wire137 = $unsigned($unsigned(((~^$signed(wire132)) ^ $unsigned(wire132))));
  assign wire138 = wire133[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg139 <= (({$signed(((8'hb3) ? wire138 : wire134))} >>> wire134) ?
          ({wire133[(4'ha):(4'h8)],
              ($signed((8'had)) ?
                  wire133[(4'hf):(3'h4)] : {wire137,
                      wire136})} ^~ wire132[(2'h3):(2'h2)]) : (~^(&wire137)));
      if (wire138[(3'h6):(2'h3)])
        begin
          if ((($unsigned(($unsigned(wire134) ? wire130 : (!(8'hb1)))) ?
              wire129[(2'h3):(1'h1)] : (((+wire135) - $signed(wire132)) ?
                  wire133[(4'hc):(4'ha)] : (((8'h9f) ? wire135 : reg139) ?
                      $unsigned(wire135) : $signed((8'hac))))) <= wire129))
            begin
              reg140 <= $unsigned(wire133[(4'h8):(3'h4)]);
              reg141 <= (8'ha8);
              reg142 <= $unsigned($signed(wire135[(5'h11):(3'h7)]));
              reg143 <= wire128[(4'hd):(4'hd)];
              reg144 <= (^($unsigned(($signed(wire132) ?
                      wire135 : {reg140, wire133})) ?
                  {$signed(reg141),
                      ($unsigned(reg143) - {reg143})} : (^~$signed($signed(wire129)))));
            end
          else
            begin
              reg140 <= $unsigned(wire133);
              reg141 <= wire128[(3'h7):(3'h5)];
              reg142 <= $signed((~|{($signed(reg139) && $unsigned(wire138))}));
            end
          reg145 <= (|wire131[(1'h0):(1'h0)]);
          reg146 <= $unsigned($unsigned(wire132[(1'h1):(1'h0)]));
          reg147 <= $signed((reg146 ?
              (reg140 ?
                  wire133 : ($unsigned(reg140) ?
                      $signed(wire129) : wire132[(2'h2):(1'h1)])) : $signed($unsigned($unsigned(reg140)))));
          reg148 <= (((&(|$signed(wire132))) & reg143) ? wire131 : wire135);
        end
      else
        begin
          reg140 <= reg145;
          reg141 <= (!(|wire130[(4'h8):(1'h0)]));
          reg142 <= (($signed(wire136[(4'ha):(4'h8)]) ?
              (({wire131} ? ((8'haf) - reg140) : wire131) ?
                  $unsigned((8'ha7)) : wire130[(4'h8):(1'h1)]) : ((wire132 ?
                  $unsigned(wire138) : $unsigned(wire135)) && $signed(wire133[(4'hc):(2'h3)]))) != (($unsigned((wire132 ?
              wire138 : wire133)) ~^ $signed($unsigned(wire134))) && wire131));
          if (wire130[(1'h1):(1'h0)])
            begin
              reg143 <= reg141;
              reg144 <= (8'h9e);
              reg145 <= (^~wire138);
            end
          else
            begin
              reg143 <= reg144;
              reg144 <= reg146;
              reg145 <= ($signed(reg146) ?
                  $unsigned($signed(reg146[(1'h1):(1'h1)])) : $signed((((&(8'h9c)) ?
                      (-reg145) : (reg144 >= wire132)) + {(^~reg145),
                      wire134})));
            end
        end
    end
  assign wire149 = wire138;
  assign wire150 = (reg140 ?
                       $signed($signed((reg142 >> (&wire138)))) : ($unsigned(wire136[(1'h0):(1'h0)]) << (^{{wire137,
                               reg143},
                           wire134})));
  always
    @(posedge clk) begin
      reg151 <= ((wire137 <<< (+$unsigned(wire131[(3'h6):(1'h1)]))) ^~ $unsigned({$signed(((7'h40) * reg139)),
          reg139[(1'h0):(1'h0)]}));
      reg152 <= $unsigned($signed(wire129));
    end
  always
    @(posedge clk) begin
      reg153 <= reg146[(3'h6):(2'h2)];
      reg154 <= $unsigned(($unsigned(((!reg151) & (wire133 ?
              wire149 : reg143))) ?
          $unsigned((reg143[(4'h9):(1'h0)] ^ $unsigned((8'hbc)))) : (!$signed(wire129[(2'h2):(1'h1)]))));
      reg155 <= (wire150[(4'hf):(2'h2)] ^ $unsigned((~&(!$unsigned(wire137)))));
      reg156 <= {(reg140[(4'h8):(3'h4)] ?
              reg142 : ($signed((&reg144)) >> ($unsigned(wire149) == $unsigned(wire149)))),
          $unsigned({reg152, wire138})};
    end
  assign wire157 = ($unsigned(reg139[(1'h0):(1'h0)]) ?
                       {(reg144 ?
                               $unsigned(wire128[(5'h13):(4'he)]) : reg153)} : reg145);
  assign wire158 = (((($unsigned((8'hb3)) < {reg141}) <= $signed((~reg147))) ?
                           (-(~&(reg140 ? reg152 : wire150))) : (wire157 ?
                               ({(8'ha3)} ?
                                   (reg143 ? wire135 : reg153) : {wire129,
                                       reg145}) : $signed(wire129))) ?
                       (~|(~&(reg144 * reg155[(3'h4):(2'h2)]))) : $unsigned((((!wire136) ?
                           (^(8'ha1)) : $unsigned((7'h40))) << ($unsigned((8'hb5)) < reg154))));
  assign wire159 = ((($unsigned(reg146) ?
                           ($signed(wire135) << (^~reg144)) : reg147[(3'h5):(2'h2)]) + ((^~(wire136 ?
                               reg154 : wire130)) ?
                           wire136[(3'h4):(2'h3)] : ((^wire149) ?
                               wire157 : reg148[(4'hd):(1'h0)]))) ?
                       $unsigned({{$unsigned(reg154),
                               (reg141 ? reg154 : wire133)},
                           (+$unsigned(wire137))}) : reg147[(4'h8):(3'h4)]);
  assign wire160 = {{((8'hb2) ^~ ($signed((8'ha2)) != $unsigned(reg139))),
                           (($unsigned(reg156) ^ (wire149 ?
                               reg142 : wire131)) >>> $unsigned($unsigned(wire149)))},
                       wire158};
  assign wire161 = ((reg145 != (({reg143} << ((8'hbc) ?
                           wire131 : wire137)) << ({wire137, reg147} ?
                           (!reg144) : wire130))) ?
                       $unsigned($unsigned($signed(wire135))) : $unsigned(reg139));
endmodule

module module63  (y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h1c8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire68;
  input wire signed [(5'h14):(1'h0)] wire67;
  input wire signed [(5'h12):(1'h0)] wire66;
  input wire signed [(5'h14):(1'h0)] wire65;
  input wire signed [(5'h13):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire105;
  wire signed [(5'h13):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire82;
  wire [(3'h7):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire73;
  reg signed [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire91,
                 wire82,
                 wire81,
                 wire74,
                 wire73,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg69 <= ((wire65[(4'hf):(4'hc)] ?
          ($signed((wire67 ? wire67 : wire67)) ?
              wire68 : wire67) : $unsigned((8'hbb))) >> $signed((wire67 << {$unsigned(wire64),
          (wire65 ? wire66 : (8'ha8))})));
    end
  always
    @(posedge clk) begin
      reg70 <= wire65[(4'ha):(4'ha)];
      if ($signed($signed($signed($unsigned($signed(reg69))))))
        begin
          reg71 <= (wire64[(4'h8):(2'h3)] || reg70[(4'ha):(2'h2)]);
          reg72 <= ((((|(8'ha9)) ?
              (+reg70) : $signed((reg71 ?
                  wire68 : reg71))) << reg69) >>> (((8'hb3) ?
              wire68[(1'h1):(1'h0)] : {$signed(wire67),
                  $signed(wire68)}) < $unsigned($unsigned(reg70[(4'he):(4'h8)]))));
        end
      else
        begin
          reg71 <= (($signed({(+reg69)}) >> ({wire64[(4'hd):(4'h8)],
                      $unsigned(wire67)} ?
                  reg70[(4'hb):(4'hb)] : (reg71 ^~ wire66[(3'h4):(2'h2)]))) ?
              wire64[(4'h8):(1'h1)] : (~&{({reg70} ?
                      $signed((8'hbc)) : (~|reg69)),
                  ((~|reg71) > $signed(wire65))}));
        end
    end
  assign wire73 = (~wire68[(1'h1):(1'h0)]);
  assign wire74 = {$signed($unsigned(wire67[(3'h7):(3'h7)]))};
  always
    @(posedge clk) begin
      reg75 <= wire65[(4'h8):(3'h4)];
      if (((wire73 >>> $unsigned(wire73)) ?
          (-$signed((~&wire73[(4'he):(2'h3)]))) : wire68[(1'h1):(1'h1)]))
        begin
          reg76 <= {{reg72[(3'h4):(2'h3)]}};
          reg77 <= $signed(((^~((!wire67) ?
              $unsigned(wire74) : {wire73})) <= $signed(wire74[(4'h8):(3'h5)])));
        end
      else
        begin
          reg76 <= (~wire65);
          reg77 <= $unsigned(((wire64[(4'hb):(4'h8)] != reg75) ?
              {$signed($unsigned(reg76)),
                  (wire68[(2'h3):(1'h1)] ^ reg75)} : $unsigned(wire73)));
          reg78 <= ((reg77 && $unsigned($signed(reg69))) ?
              $unsigned({(8'hbd)}) : ($unsigned({wire67[(3'h5):(3'h4)],
                      reg76[(1'h0):(1'h0)]}) ?
                  (!$signed((~^wire66))) : (wire73[(4'ha):(2'h3)] ?
                      reg71 : ((reg72 ? (8'hb1) : wire66) ?
                          (reg69 ? wire65 : reg75) : $signed((7'h44))))));
        end
      reg79 <= $signed({wire65, reg77[(4'ha):(4'ha)]});
      reg80 <= $signed($unsigned(reg69));
    end
  assign wire81 = (wire64 ?
                      ((~^reg79[(1'h0):(1'h0)]) ?
                          $unsigned(wire64) : wire66[(4'hf):(4'hd)]) : (|$unsigned(((wire73 <= reg79) < (reg69 - (8'h9e))))));
  assign wire82 = (((8'ha6) ?
                          $unsigned(((reg76 ? wire66 : wire68) ?
                              (|wire67) : (wire74 && wire68))) : $unsigned(((^~reg78) ?
                              reg79[(1'h1):(1'h1)] : (8'hb6)))) ?
                      ($unsigned((8'ha0)) >>> (((+reg76) <<< $unsigned(reg72)) ?
                          ((reg76 ? wire67 : wire65) ?
                              $signed((8'h9e)) : (wire74 ?
                                  (8'haa) : (7'h40))) : reg70[(4'hb):(3'h5)])) : ((+(((8'hae) ?
                          reg80 : wire64) | reg75[(3'h6):(1'h0)])) | wire74));
  always
    @(posedge clk) begin
      if ((({$signed(((8'hbd) ? (8'ha3) : reg79))} ?
              ($signed(wire81) <<< ((!wire67) ?
                  $unsigned(wire68) : reg71[(2'h3):(1'h1)])) : $signed((~^$unsigned((8'hb7))))) ?
          $unsigned(($signed((wire74 ? reg70 : reg76)) ?
              ((~^wire68) ?
                  ((8'hba) ~^ reg78) : {reg76}) : $signed(reg79[(4'hf):(3'h7)]))) : $unsigned($signed($unsigned(wire66[(5'h10):(3'h7)])))))
        begin
          if ($unsigned(((|reg75) ?
              (wire81[(3'h4):(1'h1)] ~^ wire64) : wire81[(2'h3):(1'h0)])))
            begin
              reg83 <= ({(+$unsigned((reg76 == reg80))),
                  ((+$unsigned((8'ha7))) ?
                      $unsigned((wire68 - reg78)) : $signed((wire66 ?
                          wire74 : reg71)))} || (8'ha4));
              reg84 <= reg83[(2'h2):(2'h2)];
              reg85 <= $unsigned((~&$unsigned(wire65[(2'h2):(1'h1)])));
            end
          else
            begin
              reg83 <= (~wire74[(2'h2):(2'h2)]);
              reg84 <= {(~reg77[(3'h5):(1'h1)]), $signed(reg84)};
              reg85 <= wire67;
            end
          if ($signed($unsigned(((7'h41) == ((reg84 != (8'hb1)) ?
              (~|(8'hb2)) : (wire67 ? reg75 : reg84))))))
            begin
              reg86 <= wire67;
              reg87 <= (((~&(~(~^reg79))) && $signed(wire67[(1'h0):(1'h0)])) == $signed((wire66[(3'h7):(3'h5)] | ($signed(reg85) <= $unsigned(reg83)))));
              reg88 <= wire74;
            end
          else
            begin
              reg86 <= {{(~((&wire64) ? (wire66 <<< reg76) : reg84)), reg69}};
              reg87 <= (reg85[(3'h6):(3'h5)] + ((!{(wire66 ? reg76 : reg70),
                  (reg76 ? reg84 : reg76)}) > wire74[(4'h8):(3'h5)]));
              reg88 <= {(reg85[(3'h6):(2'h2)] ?
                      {((&wire73) <<< $unsigned(reg69)),
                          reg85[(3'h4):(3'h4)]} : wire68)};
            end
          reg89 <= (!$unsigned((((|reg78) ?
              $signed(wire82) : $unsigned(reg80)) & {(wire82 ?
                  wire74 : (8'hb2)),
              (reg78 >> wire68)})));
        end
      else
        begin
          reg83 <= reg69[(1'h1):(1'h0)];
        end
      reg90 <= reg75[(3'h6):(1'h0)];
    end
  assign wire91 = wire67;
  always
    @(posedge clk) begin
      reg92 <= $unsigned($signed(($unsigned(reg75) ~^ reg80)));
      reg93 <= {((((wire66 << wire81) ? (reg87 ^ reg92) : wire91) ?
              (~(reg86 ?
                  reg86 : wire64)) : $unsigned(reg85[(4'hb):(3'h6)])) == wire82),
          $unsigned({reg83, reg88})};
      if ($signed((8'ha3)))
        begin
          reg94 <= $signed((|((reg72[(1'h1):(1'h1)] ~^ {reg90}) ^~ (reg89[(1'h0):(1'h0)] ?
              reg92 : $unsigned(reg72)))));
          if ((^(&({reg75} >>> wire74))))
            begin
              reg95 <= (8'haf);
            end
          else
            begin
              reg95 <= {$signed($unsigned($unsigned($unsigned(reg93))))};
              reg96 <= (wire64[(4'h9):(1'h0)] < (-(^reg70[(1'h0):(1'h0)])));
              reg97 <= (-((reg94[(1'h1):(1'h1)] >> $signed($signed(reg78))) ?
                  wire74[(4'h9):(3'h4)] : (wire81[(1'h1):(1'h0)] << wire73[(5'h14):(4'he)])));
            end
        end
      else
        begin
          reg94 <= $unsigned({$signed($unsigned((reg94 ? wire65 : reg92)))});
        end
      if (wire64)
        begin
          reg98 <= reg77[(3'h4):(1'h0)];
          reg99 <= $signed({{(^(~|wire64)), $unsigned(reg84[(4'hc):(4'h8)])}});
          if ($unsigned(reg84[(4'hd):(3'h5)]))
            begin
              reg100 <= ({$signed((!(~|reg97)))} + $unsigned((|($unsigned(wire64) > (~(8'hb4))))));
              reg101 <= (&(wire67[(4'hb):(3'h5)] ?
                  $signed(wire66[(5'h11):(4'hc)]) : {reg75[(5'h10):(2'h2)],
                      reg71}));
            end
          else
            begin
              reg100 <= reg98[(2'h2):(1'h0)];
              reg101 <= $unsigned((7'h41));
            end
          reg102 <= $signed((+$signed((reg97 == (reg95 ^~ wire67)))));
        end
      else
        begin
          reg98 <= (~&$unsigned(reg95[(3'h6):(2'h2)]));
          reg99 <= (+($unsigned((~(reg87 >> reg98))) == (((reg80 ?
                  (7'h40) : wire64) >= (wire66 ? (7'h42) : wire91)) ?
              (&(~reg84)) : ((~|reg87) <<< {wire64, reg69}))));
          reg100 <= reg94;
          reg101 <= $signed((&($unsigned($unsigned(wire65)) && wire68[(2'h2):(1'h1)])));
          reg102 <= (((&(wire64 ? (&reg83) : {(8'ha4), reg87})) ?
              reg69 : ((8'hb7) || (8'hac))) | (((wire73[(4'hb):(3'h7)] ?
                  reg77 : $unsigned(reg70)) + $unsigned(reg71[(3'h7):(2'h2)])) ?
              reg72 : reg88[(4'ha):(1'h0)]));
        end
    end
  assign wire103 = ((reg92[(4'ha):(4'h8)] ?
                           reg78 : ((^(reg85 && reg88)) <= (~&(~&reg75)))) ?
                       {((!((8'ha9) && reg86)) ?
                               $unsigned({reg93}) : ((reg77 ? wire68 : reg85) ?
                                   reg92 : $unsigned(reg88))),
                           wire68} : $signed($signed($unsigned(reg70))));
  assign wire104 = (^~reg72);
  assign wire105 = (({$unsigned((~&(8'hb4))),
                           wire103[(3'h6):(1'h0)]} >> $unsigned($signed(reg86))) ?
                       ($unsigned(reg70[(4'h8):(1'h1)]) ?
                           reg83[(2'h3):(1'h1)] : $unsigned(((8'hb6) == {reg98}))) : $unsigned((reg80[(3'h5):(2'h3)] ?
                           $unsigned({reg86}) : $unsigned(reg88))));
  assign wire106 = wire65[(5'h13):(1'h1)];
endmodule

module module36
#(parameter param59 = (!((~&(-((8'hab) << (8'hbb)))) ? (!(((7'h44) ? (8'had) : (8'ha9)) ? ((7'h42) ? (8'hab) : (8'hbb)) : (!(8'hb3)))) : (^~((~^(8'ha6)) || ((8'hb9) ^ (8'hae)))))), 
parameter param60 = param59)
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire40;
  input wire [(4'h8):(1'h0)] wire39;
  input wire [(4'hc):(1'h0)] wire38;
  input wire [(5'h11):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire41;
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 (1'h0)};
  assign wire41 = wire40[(4'hc):(3'h7)];
  assign wire42 = (wire38 || wire37);
  assign wire43 = {wire39, (~^$signed((-$unsigned((8'hb5)))))};
  assign wire44 = wire42;
  assign wire45 = wire43;
  assign wire46 = $signed({$unsigned(((!wire44) ?
                          (wire43 ? wire42 : (8'hbf)) : (-wire42))),
                      ({$unsigned(wire38), (~wire40)} != {$signed((8'hb1))})});
  assign wire47 = wire37[(4'he):(4'h8)];
  assign wire48 = ((&(8'ha2)) ?
                      {{(wire43 | wire46), (^~$unsigned(wire45))},
                          wire38} : (wire41[(1'h1):(1'h0)] ?
                          wire38 : {$signed((^~wire40)),
                              ((^wire46) * (|(8'ha4)))}));
  assign wire49 = ({wire41[(2'h2):(1'h0)], wire42} ?
                      ((wire43[(4'hf):(3'h5)] ?
                          ($unsigned(wire47) ?
                              $unsigned((8'h9c)) : $unsigned(wire41)) : $unsigned({(8'ha1)})) <= (~($signed(wire40) ^~ $signed(wire37)))) : (wire48 >= $signed(wire41)));
  assign wire50 = $signed(wire42);
  assign wire51 = (((&{{wire49, wire44}}) <<< wire39) ?
                      wire37 : {((wire48[(1'h1):(1'h0)] + $signed(wire45)) ?
                              (~wire37) : ((wire40 ?
                                  wire37 : wire40) <= wire45))});
  assign wire52 = $unsigned(wire38[(1'h1):(1'h1)]);
  assign wire53 = ($signed($signed(wire37)) && ((~$signed($unsigned((8'hbe)))) + $unsigned(wire50[(3'h6):(3'h6)])));
  assign wire54 = ($signed(wire39) ?
                      wire37[(4'hc):(4'h9)] : {$unsigned($unsigned(wire40))});
  assign wire55 = wire46;
  assign wire56 = {$signed(wire46[(4'h8):(2'h3)]),
                      (^(wire46 ?
                          ((wire50 - wire46) ?
                              wire54[(3'h5):(1'h0)] : {wire51,
                                  wire50}) : ((wire44 > wire51) ?
                              (wire43 ? wire43 : wire53) : wire54)))};
  assign wire57 = ($signed($signed((wire49[(3'h6):(2'h2)] >= (wire49 ?
                          wire52 : (8'hb2))))) ?
                      ($signed(wire54) >= $unsigned($unsigned({wire55,
                          wire56}))) : ($unsigned((8'hac)) ?
                          wire56[(1'h1):(1'h0)] : (~$signed((8'hb0)))));
  assign wire58 = ({$signed(((~wire45) * (8'haa)))} ?
                      ((-($signed(wire40) ?
                              ((7'h43) ?
                                  (8'ha7) : (8'ha2)) : $signed(wire39))) ?
                          ((&(wire44 - wire56)) >>> $signed((~&wire55))) : (wire46[(2'h2):(1'h1)] ?
                              wire47 : (-(wire47 ?
                                  (8'h9f) : wire47)))) : (~^$signed(wire45[(1'h1):(1'h0)])));
endmodule
