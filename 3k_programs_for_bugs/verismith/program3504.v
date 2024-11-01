module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire218;
  wire signed [(5'h10):(1'h0)] wire217;
  wire [(4'hf):(1'h0)] wire210;
  wire [(4'hc):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire212;
  wire [(5'h10):(1'h0)] wire214;
  wire [(5'h12):(1'h0)] wire215;
  wire signed [(5'h13):(1'h0)] wire220;
  wire [(2'h3):(1'h0)] wire221;
  wire signed [(4'h9):(1'h0)] wire222;
  wire signed [(5'h14):(1'h0)] wire223;
  wire [(4'h9):(1'h0)] wire224;
  wire signed [(4'hd):(1'h0)] wire225;
  wire signed [(5'h11):(1'h0)] wire226;
  wire [(4'he):(1'h0)] wire227;
  wire signed [(5'h15):(1'h0)] wire228;
  assign y = {wire218,
                 wire217,
                 wire210,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire212,
                 wire214,
                 wire215,
                 wire220,
                 wire221,
                 wire222,
                 wire223,
                 wire224,
                 wire225,
                 wire226,
                 wire227,
                 wire228,
                 (1'h0)};
  assign wire5 = ($unsigned(((wire2[(3'h6):(2'h2)] || (^~wire2)) != $unsigned(wire4[(5'h10):(3'h4)]))) ?
                     $signed($unsigned(({wire3} ?
                         $signed(wire0) : (wire1 ?
                             wire4 : (8'ha4))))) : (wire1[(5'h12):(5'h10)] >= wire4));
  assign wire6 = wire1;
  assign wire7 = (wire3 > wire1[(3'h7):(3'h5)]);
  assign wire8 = (((&{(&wire0)}) ?
                     $unsigned(wire7[(4'ha):(4'ha)]) : wire7) ^ (($signed($signed(wire4)) ^ $signed(wire1[(1'h1):(1'h0)])) ?
                     wire1 : $unsigned(wire4)));
  module9 #() modinst211 (.wire13(wire0), .y(wire210), .wire11(wire2), .clk(clk), .wire10(wire6), .wire14(wire3), .wire12(wire8));
  module125 #() modinst213 (wire212, clk, wire8, wire5, wire4, wire1);
  assign wire214 = (wire1 ? (&wire1[(4'hb):(4'ha)]) : wire1);
  module28 #() modinst216 (.wire33(wire8), .wire29(wire3), .wire32(wire212), .y(wire215), .wire30(wire1), .clk(clk), .wire31(wire2));
  assign wire217 = (|wire5[(3'h5):(3'h5)]);
  module151 #() modinst219 (wire218, clk, wire0, wire7, wire215, wire4, wire210);
  assign wire220 = (~&$signed(((~&(wire217 ? wire217 : wire4)) + {(wire215 ?
                           wire215 : (8'hba)),
                       (wire210 && wire7)})));
  assign wire221 = ($unsigned($signed($signed(wire5))) ?
                       wire215[(3'h5):(3'h4)] : wire7[(3'h5):(1'h0)]);
  assign wire222 = wire215;
  assign wire223 = wire2[(4'hd):(4'hc)];
  assign wire224 = ($unsigned((({wire6} ?
                           $unsigned(wire8) : $signed(wire221)) > $unsigned((wire214 ?
                           wire4 : wire214)))) ?
                       ((((wire218 + wire8) != wire221) >>> (-(wire221 ~^ wire7))) < $signed({wire4[(4'ha):(4'h8)],
                           wire7})) : wire8);
  assign wire225 = (({((wire212 | wire7) <= (wire5 == wire217)), (~(^wire7))} ?
                       $signed(({wire210} ?
                           (-wire218) : (~&wire223))) : $signed(wire4)) != {$unsigned($unsigned((wire217 ?
                           wire215 : (8'haf))))});
  assign wire226 = ($signed((($signed(wire0) ?
                           wire221[(1'h1):(1'h0)] : $unsigned(wire215)) - wire1)) ?
                       ($signed((~(wire7 >> wire220))) < wire0[(3'h4):(1'h1)]) : $signed((($signed(wire215) ?
                           {wire223, wire1} : {wire0,
                               (8'h9d)}) | $signed((wire221 ^~ (8'h9d))))));
  assign wire227 = $signed((~|(wire5[(3'h6):(3'h5)] ?
                       (&$signed(wire212)) : wire218)));
  module42 #() modinst229 (wire228, clk, wire214, wire2, wire5, wire4, wire227);
endmodule

module module9
#(parameter param208 = ({(8'hb1), ((((7'h40) ? (8'hb5) : (8'ha7)) * ((7'h42) - (8'hb9))) * (~((7'h40) ? (8'hb7) : (8'ha3))))} > {(~|(((7'h41) ^ (8'hbc)) ? {(8'hbe)} : {(8'haa), (8'hbc)})), {{(^(8'hb3))}, (((8'haa) ? (8'haa) : (8'ha5)) ? ((8'hb9) ? (8'hb5) : (8'haf)) : (&(7'h40)))}}), 
parameter param209 = (((~{((7'h42) && param208)}) < (((~|param208) ? (param208 & param208) : {param208, param208}) || ((param208 ? (8'ha5) : param208) ? param208 : ((8'haf) || param208)))) ? {(|(param208 ? (param208 ? param208 : param208) : (~|param208))), param208} : (8'hba)))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h1d5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire14;
  input wire [(3'h6):(1'h0)] wire13;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire signed [(3'h5):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire207;
  wire [(5'h10):(1'h0)] wire206;
  wire signed [(5'h12):(1'h0)] wire204;
  wire [(5'h12):(1'h0)] wire150;
  wire signed [(5'h13):(1'h0)] wire149;
  wire [(4'hb):(1'h0)] wire148;
  wire signed [(3'h7):(1'h0)] wire147;
  wire [(4'hb):(1'h0)] wire146;
  wire signed [(5'h14):(1'h0)] wire144;
  wire [(3'h6):(1'h0)] wire143;
  wire signed [(5'h10):(1'h0)] wire142;
  wire signed [(4'he):(1'h0)] wire141;
  wire signed [(2'h3):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire139;
  wire signed [(2'h3):(1'h0)] wire137;
  wire signed [(4'hc):(1'h0)] wire124;
  wire [(3'h4):(1'h0)] wire123;
  wire signed [(5'h14):(1'h0)] wire122;
  wire [(5'h12):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire81;
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  assign y = {wire207,
                 wire206,
                 wire204,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire137,
                 wire124,
                 wire123,
                 wire122,
                 wire120,
                 wire40,
                 wire81,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg145,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= (((((!wire11) ?
              ((8'hb0) * wire10) : (wire14 >> wire13)) < wire13) ^~ $signed($signed({wire13,
              wire13}))) ?
          wire11 : (-(~&(((7'h41) ? wire13 : wire12) ?
              $unsigned(wire10) : (~wire11)))));
      if ((((~&(((8'h9f) <= wire13) & (wire11 ?
              wire10 : (8'ha7)))) < $unsigned($unsigned((reg15 <<< wire10)))) ?
          (!$signed(wire12)) : wire11[(2'h2):(2'h2)]))
        begin
          reg16 <= (reg15[(2'h2):(1'h1)] ?
              (wire14 <<< $unsigned((+wire10))) : {($unsigned($unsigned(wire11)) ?
                      ((|reg15) ?
                          (wire13 ?
                              wire13 : reg15) : (wire11 & wire12)) : (reg15[(1'h1):(1'h1)] << (+wire13)))});
        end
      else
        begin
          reg16 <= {(wire11 != $unsigned({wire14, reg15[(3'h7):(3'h4)]}))};
          if (wire14)
            begin
              reg17 <= wire13[(2'h2):(1'h1)];
              reg18 <= $unsigned($unsigned((^wire12)));
            end
          else
            begin
              reg17 <= wire11[(2'h2):(1'h0)];
              reg18 <= {(wire13[(3'h4):(1'h1)] ?
                      (~^$unsigned((wire13 + wire14))) : (8'hb1))};
            end
          if (wire11[(3'h4):(2'h2)])
            begin
              reg19 <= $unsigned($signed({((reg15 && reg16) < (reg17 ?
                      reg16 : wire12))}));
              reg20 <= wire10[(1'h0):(1'h0)];
            end
          else
            begin
              reg19 <= reg16;
              reg20 <= reg15;
              reg21 <= wire13[(3'h6):(3'h6)];
            end
          reg22 <= $signed((8'hbc));
          reg23 <= $signed($unsigned(($signed(wire11) ?
              $signed(wire14) : wire10)));
        end
      reg24 <= wire10;
      reg25 <= $unsigned((~{(((8'hb2) ~^ reg15) ?
              $unsigned(reg15) : $signed(reg21)),
          ($unsigned(reg21) ? reg17[(2'h2):(1'h1)] : $signed(reg23))}));
      if ($signed(reg15))
        begin
          reg26 <= reg25;
        end
      else
        begin
          reg26 <= ($unsigned($unsigned((~|(|wire12)))) ?
              {($signed((wire11 * reg17)) <= (~&(~|wire12)))} : reg18);
          reg27 <= reg26[(4'hc):(4'ha)];
        end
    end
  module28 #() modinst41 (.wire31(reg16), .wire33(wire13), .wire30(reg18), .wire32(wire14), .y(wire40), .clk(clk), .wire29(wire10));
  module42 #() modinst82 (.wire44(reg17), .wire43(reg22), .y(wire81), .clk(clk), .wire46(wire40), .wire45(reg15), .wire47(reg18));
  module83 #() modinst121 (wire120, clk, reg23, wire12, wire40, reg25);
  assign wire122 = $signed(reg18[(5'h14):(5'h13)]);
  assign wire123 = reg20;
  assign wire124 = $unsigned(reg24[(4'h9):(2'h2)]);
  module125 #() modinst138 (wire137, clk, reg16, wire81, wire122, reg23);
  assign wire139 = ($unsigned(wire40[(3'h7):(1'h0)]) >= {$signed(wire120[(5'h10):(4'he)])});
  assign wire140 = reg19[(4'h9):(4'h8)];
  assign wire141 = reg19[(2'h2):(1'h0)];
  assign wire142 = (wire81 ?
                       reg19 : (~|((|$signed(reg18)) ?
                           $signed((reg21 ?
                               reg24 : reg19)) : {wire137[(1'h1):(1'h0)]})));
  assign wire143 = reg20[(4'ha):(1'h1)];
  assign wire144 = {$unsigned(wire14), (&$unsigned($signed((8'hb9))))};
  always
    @(posedge clk) begin
      reg145 <= $signed((^$signed((~&wire140))));
    end
  assign wire146 = $signed((($unsigned((reg145 ?
                           (8'ha3) : wire81)) <<< ($signed(reg24) ?
                           (wire140 | reg20) : {wire142})) ?
                       (~|$signed($signed((8'ha1)))) : (|((!wire140) ?
                           (wire122 ? (8'h9d) : wire120) : (reg21 < reg24)))));
  assign wire147 = $signed((~&wire11));
  assign wire148 = (&wire13);
  assign wire149 = (-$unsigned($signed((((8'hb6) ?
                       wire11 : wire141) ^ (+wire148)))));
  assign wire150 = wire147;
  module151 #() modinst205 (wire204, clk, wire81, wire120, reg145, reg16, reg25);
  assign wire206 = wire143[(1'h1):(1'h1)];
  assign wire207 = $signed((8'hb5));
endmodule

module module151
#(parameter param203 = ((((8'hb6) != {((8'had) ? (8'ha0) : (8'hbb)), (~(8'hbc))}) ? (~(((8'hba) || (8'hae)) != {(7'h44)})) : ((8'hab) ? (^~((8'h9e) & (8'ha0))) : (((8'hbc) == (8'hbd)) ? ((8'ha8) | (8'hbf)) : ((7'h42) ? (8'had) : (8'ha4))))) ^~ {(((-(8'hb1)) | ((8'hb7) ? (7'h41) : (8'h9e))) ? ((~^(8'haa)) ? (^~(8'had)) : ((8'hbe) || (8'hb7))) : (^~(-(7'h43))))}))
(y, clk, wire156, wire155, wire154, wire153, wire152);
  output wire [(32'h1e5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire156;
  input wire signed [(4'h9):(1'h0)] wire155;
  input wire signed [(5'h12):(1'h0)] wire154;
  input wire [(4'ha):(1'h0)] wire153;
  input wire [(4'h9):(1'h0)] wire152;
  wire signed [(2'h3):(1'h0)] wire202;
  wire signed [(5'h14):(1'h0)] wire201;
  wire signed [(4'ha):(1'h0)] wire200;
  wire signed [(2'h3):(1'h0)] wire199;
  wire signed [(2'h2):(1'h0)] wire198;
  wire [(3'h5):(1'h0)] wire185;
  wire signed [(3'h5):(1'h0)] wire184;
  wire signed [(3'h4):(1'h0)] wire183;
  wire signed [(5'h11):(1'h0)] wire164;
  wire [(5'h12):(1'h0)] wire163;
  wire signed [(2'h2):(1'h0)] wire162;
  wire [(2'h2):(1'h0)] wire161;
  wire signed [(5'h13):(1'h0)] wire160;
  wire [(2'h2):(1'h0)] wire159;
  wire signed [(5'h14):(1'h0)] wire158;
  wire [(4'ha):(1'h0)] wire157;
  reg [(4'he):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg194 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg192 = (1'h0);
  reg [(4'ha):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg190 = (1'h0);
  reg [(4'h8):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg188 = (1'h0);
  reg [(3'h6):(1'h0)] reg187 = (1'h0);
  reg [(2'h2):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg182 = (1'h0);
  reg [(5'h11):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg177 = (1'h0);
  reg [(3'h7):(1'h0)] reg176 = (1'h0);
  reg [(4'hd):(1'h0)] reg175 = (1'h0);
  reg [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(4'he):(1'h0)] reg173 = (1'h0);
  reg [(5'h11):(1'h0)] reg172 = (1'h0);
  reg [(4'h8):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg170 = (1'h0);
  reg [(4'h9):(1'h0)] reg169 = (1'h0);
  reg [(5'h13):(1'h0)] reg168 = (1'h0);
  reg [(3'h7):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg [(5'h10):(1'h0)] reg165 = (1'h0);
  assign y = {wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire185,
                 wire184,
                 wire183,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
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
  assign wire157 = (8'ha2);
  assign wire158 = $unsigned(({(wire152[(3'h6):(3'h4)] ?
                           $unsigned(wire156) : (-wire153))} != $unsigned({(^~wire153),
                       (wire152 ? (8'h9c) : wire154)})));
  assign wire159 = ($unsigned(wire153[(4'h8):(2'h2)]) ^ wire152[(2'h3):(2'h3)]);
  assign wire160 = {(^(+wire157))};
  assign wire161 = wire155[(3'h4):(1'h1)];
  assign wire162 = ((wire155[(1'h1):(1'h1)] ?
                       wire154 : wire159) << (+{wire159[(2'h2):(1'h0)]}));
  assign wire163 = $signed($unsigned({(~&(wire152 - wire161))}));
  assign wire164 = (^wire160);
  always
    @(posedge clk) begin
      if ($signed(((-$unsigned((wire163 ? wire153 : (8'hb4)))) ?
          wire155 : wire159[(1'h1):(1'h0)])))
        begin
          reg165 <= wire163[(1'h1):(1'h1)];
          if (($unsigned(wire161[(1'h0):(1'h0)]) ?
              wire157 : $signed($unsigned(($unsigned(wire158) || wire162[(2'h2):(1'h0)])))))
            begin
              reg166 <= $signed(wire160);
            end
          else
            begin
              reg166 <= (wire158 >= {((~wire154[(2'h2):(2'h2)]) << ((&reg166) > $unsigned((8'ha1))))});
              reg167 <= wire164[(5'h11):(3'h5)];
              reg168 <= ((~$unsigned(wire160[(4'hf):(4'h9)])) ~^ wire163);
              reg169 <= wire157[(3'h6):(1'h0)];
              reg170 <= reg169;
            end
        end
      else
        begin
          reg165 <= $signed($unsigned(wire157[(1'h0):(1'h0)]));
          reg166 <= (^~(^~$signed((+{wire152}))));
          if ((&($signed(({wire156, wire160} <= $signed(wire153))) ?
              {((-wire161) ? (reg169 & reg165) : $unsigned(wire162)),
                  (wire156[(3'h6):(3'h5)] * wire161[(2'h2):(1'h0)])} : (wire155 < ((wire160 ?
                  wire162 : (8'hbe)) <= $signed(reg170))))))
            begin
              reg167 <= {($signed($signed((~&reg169))) ?
                      ({((8'ha2) ? wire158 : (8'hac))} ?
                          (~|$unsigned(wire159)) : $unsigned(((8'ha0) - wire160))) : wire159),
                  (wire160 ?
                      (reg170[(4'ha):(4'h9)] ?
                          (reg165[(3'h4):(2'h2)] ?
                              (wire152 ?
                                  wire152 : wire152) : {reg170}) : wire155) : (({(8'hba),
                              wire157} ~^ wire154) ?
                          (~|(^~wire162)) : $unsigned($unsigned(reg168))))};
              reg168 <= (!reg169);
              reg169 <= (-{$unsigned($signed($unsigned(wire158))),
                  {((8'hae) ? wire159[(2'h2):(1'h0)] : (8'hb4)),
                      $unsigned({(8'ha7), reg170})}});
            end
          else
            begin
              reg167 <= $unsigned({$signed(reg166[(3'h4):(3'h4)]),
                  ((wire162 ^ wire159) || $unsigned($unsigned(wire158)))});
              reg168 <= wire156[(3'h5):(1'h0)];
            end
          reg170 <= wire155[(4'h9):(2'h3)];
          reg171 <= (wire162[(1'h0):(1'h0)] & ($unsigned({reg165}) <<< $unsigned(((wire161 >>> wire153) == reg166[(1'h1):(1'h0)]))));
        end
      reg172 <= wire155[(1'h0):(1'h0)];
      reg173 <= ($unsigned($signed($unsigned(reg172[(4'h8):(1'h0)]))) - $signed(reg167));
      if ((+{((~^{(8'hae)}) ^~ reg172[(5'h11):(4'hc)])}))
        begin
          reg174 <= (&wire162[(1'h1):(1'h1)]);
          reg175 <= (reg173[(2'h3):(2'h2)] ?
              reg169[(2'h2):(1'h1)] : wire152[(4'h9):(1'h1)]);
          reg176 <= $signed(wire152);
        end
      else
        begin
          reg174 <= {$signed(wire154[(3'h5):(2'h2)]),
              (!((((8'h9c) != reg165) ?
                      $unsigned((8'hb6)) : reg168[(1'h1):(1'h1)]) ?
                  reg167[(2'h3):(2'h3)] : {$signed((8'h9c)),
                      $signed(wire152)}))};
          reg175 <= reg168;
          reg176 <= reg175;
          if (reg176)
            begin
              reg177 <= ({((~^reg170[(2'h2):(1'h1)]) >> wire161),
                  (7'h42)} < $unsigned($unsigned($signed((reg168 ?
                  reg174 : wire155)))));
              reg178 <= {wire156, wire156};
              reg179 <= reg170[(4'ha):(2'h2)];
              reg180 <= (reg178 ^~ (^~(!($unsigned(wire156) < (reg170 < wire159)))));
              reg181 <= $signed(reg168);
            end
          else
            begin
              reg177 <= (^(^(reg166[(2'h2):(1'h0)] & reg165[(3'h6):(1'h0)])));
              reg178 <= {($unsigned({wire152, (+reg175)}) ?
                      $signed(((wire162 == reg176) ?
                          wire161 : wire161[(1'h1):(1'h0)])) : wire157)};
            end
        end
    end
  always
    @(posedge clk) begin
      reg182 <= (~|((~$unsigned((!wire152))) ?
          $unsigned((-reg179[(1'h1):(1'h0)])) : (reg180 - (((7'h44) ?
              reg175 : (8'ha1)) >> ((7'h44) ? reg176 : reg178)))));
    end
  assign wire183 = $unsigned(({wire154[(5'h11):(5'h11)]} ^~ (reg168 | (^(wire163 > wire162)))));
  assign wire184 = (wire183 < {((reg173 >= (reg177 ?
                           wire159 : wire164)) <= wire159[(2'h2):(1'h1)])});
  assign wire185 = (-(^(((wire158 ? reg171 : (8'ha3)) ?
                       (~^wire155) : $unsigned(reg181)) * {(reg177 ?
                           reg176 : wire154),
                       (reg182 >>> reg169)})));
  always
    @(posedge clk) begin
      reg186 <= (((wire185 ?
          $unsigned((reg182 ?
              (8'h9c) : reg170)) : ($signed(reg172) <<< (wire160 + reg181))) <= $signed(((-reg176) ~^ $unsigned(wire183)))) != wire157);
      reg187 <= (!($unsigned(wire163[(2'h3):(2'h3)]) ?
          {(~|(|(8'ha0)))} : (&(7'h42))));
      reg188 <= ({wire160} ?
          $signed((wire162[(1'h0):(1'h0)] ?
              {$signed(reg170),
                  wire185[(1'h1):(1'h0)]} : (wire153[(1'h0):(1'h0)] ?
                  (wire152 ?
                      wire156 : wire162) : $unsigned((8'hb9))))) : wire183[(2'h2):(1'h1)]);
      reg189 <= (8'h9d);
    end
  always
    @(posedge clk) begin
      if (reg177)
        begin
          reg190 <= wire164;
          reg191 <= $signed((reg166 ?
              (({reg187, wire155} ?
                      $unsigned(wire184) : (reg171 ? wire159 : wire185)) ?
                  ({wire155} || wire163[(4'hb):(3'h6)]) : reg167) : wire184[(3'h4):(2'h3)]));
          if (reg177)
            begin
              reg192 <= $signed($unsigned(((wire160[(5'h11):(3'h6)] ?
                      (!reg176) : reg186) ?
                  $signed((reg178 > reg171)) : {(wire183 + wire155)})));
              reg193 <= wire155[(3'h7):(1'h0)];
              reg194 <= $unsigned(($signed(reg166) | (^((wire164 & reg166) ^ (wire184 && (8'hb0))))));
              reg195 <= (wire185 < ((((~&reg174) ?
                          (^~reg170) : (reg175 * reg166)) ?
                      reg177 : ($signed(wire183) ?
                          $unsigned((7'h43)) : {(7'h40)})) ?
                  (((&reg191) ?
                      (reg190 ?
                          wire154 : reg193) : reg192) >> reg187) : (wire164[(1'h1):(1'h0)] ?
                      (+(reg165 ? wire161 : reg167)) : ((&wire158) ?
                          (&(8'hb7)) : (wire159 ? (8'h9c) : wire152)))));
              reg196 <= $signed($unsigned(($signed(reg187) && $signed((reg190 < (8'haf))))));
            end
          else
            begin
              reg192 <= wire163;
              reg193 <= (!{wire152});
              reg194 <= reg173[(2'h2):(2'h2)];
              reg195 <= $unsigned(reg175[(4'ha):(1'h0)]);
            end
          reg197 <= {$signed((((wire162 ?
                  reg195 : reg179) - wire155[(2'h2):(1'h1)]) < $unsigned((8'hab))))};
        end
      else
        begin
          reg190 <= ((($unsigned((8'hb9)) ?
                  reg194[(4'hb):(3'h6)] : reg170[(4'h8):(2'h3)]) | $unsigned(($signed(wire184) ^~ wire156))) ?
              (($signed({reg168, (8'hb2)}) ?
                      reg190 : ($signed(wire157) ?
                          $unsigned(reg195) : wire152[(3'h7):(2'h3)])) ?
                  ((~&{reg190, reg196}) >>> {(reg179 ?
                          reg171 : reg193)}) : wire185[(3'h4):(1'h0)]) : $signed((|$unsigned((reg178 ?
                  (7'h40) : wire158)))));
          reg191 <= (-reg175);
          reg192 <= (^wire183[(1'h1):(1'h0)]);
        end
    end
  assign wire198 = $unsigned((|reg175[(3'h7):(3'h5)]));
  assign wire199 = ($signed(($unsigned(reg192) ?
                       (|((8'ha4) > reg194)) : wire158[(2'h3):(1'h1)])) + {((-reg181) ?
                           $unsigned($unsigned(reg172)) : (~^(&wire162)))});
  assign wire200 = {(8'h9c)};
  assign wire201 = $signed($unsigned($unsigned($unsigned(wire159[(1'h1):(1'h1)]))));
  assign wire202 = wire185[(2'h3):(2'h3)];
endmodule

module module125
#(parameter param136 = {((~((~(8'hb9)) ? ((8'hba) & (8'ha3)) : {(7'h44)})) ? (-(((7'h41) ? (8'hb9) : (8'hb8)) ? {(8'ha1), (8'ha7)} : ((8'hb6) >>> (8'hb1)))) : (-(~^{(8'hac), (8'had)})))})
(y, clk, wire129, wire128, wire127, wire126);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire129;
  input wire signed [(3'h7):(1'h0)] wire128;
  input wire signed [(5'h14):(1'h0)] wire127;
  input wire [(4'hf):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire135;
  wire signed [(4'h9):(1'h0)] wire134;
  wire signed [(4'he):(1'h0)] wire133;
  wire [(4'ha):(1'h0)] wire132;
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg130 = (1'h0);
  assign y = {wire135, wire134, wire133, wire132, reg131, reg130, (1'h0)};
  always
    @(posedge clk) begin
      reg130 <= $signed((^((wire128[(1'h1):(1'h0)] == (wire128 ?
              wire127 : wire126)) ?
          (8'hbc) : ((wire129 ^~ wire128) > (wire128 || (8'hb9))))));
      reg131 <= (wire128[(3'h6):(3'h5)] ~^ (wire128[(3'h6):(3'h5)] ?
          $unsigned((~(wire127 ?
              (8'hb4) : wire129))) : $signed($unsigned({wire127}))));
    end
  assign wire132 = ((reg131[(4'hc):(4'h8)] == ($unsigned((reg130 > reg130)) ?
                           wire126[(4'hc):(3'h4)] : $signed(wire126))) ?
                       ($signed(({(8'hb3)} ?
                           (wire129 | wire128) : reg130)) ^~ reg130[(2'h2):(1'h1)]) : $signed((((wire126 ?
                                   (8'h9f) : reg130) ?
                               {wire127} : reg131) ?
                           (wire128 ?
                               $signed(wire128) : reg130[(3'h4):(2'h3)]) : $signed((reg130 ?
                               wire128 : reg130)))));
  assign wire133 = $unsigned(wire132[(4'h9):(3'h6)]);
  assign wire134 = $signed({reg131});
  assign wire135 = {(&(~|wire133))};
endmodule

module module83  (y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire87;
  input wire [(3'h5):(1'h0)] wire86;
  input wire [(5'h13):(1'h0)] wire85;
  input wire signed [(4'he):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire100;
  wire [(3'h6):(1'h0)] wire99;
  wire signed [(4'he):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire96;
  wire [(5'h15):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire88;
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  assign y = {wire119,
                 wire116,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire89,
                 wire88,
                 reg118,
                 reg117,
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
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire88 = (((((8'hbe) ? wire85 : (wire85 != wire87)) ?
                      {(wire84 >>> (8'hab)),
                          (-wire85)} : $unsigned((8'hb6))) != (~&(^~$signed(wire85)))) > (($signed(wire85[(1'h0):(1'h0)]) ?
                      (~|wire85) : {{wire86,
                              wire87}}) | ((+wire86[(3'h5):(1'h1)]) <<< wire86[(2'h3):(1'h0)])));
  assign wire89 = (^~$signed(wire85));
  always
    @(posedge clk) begin
      reg90 <= (-((|wire87[(3'h5):(2'h3)]) | (!(~&(|wire87)))));
      reg91 <= ((^~$signed((|wire84[(4'he):(3'h7)]))) >>> ((|(~&reg90)) && (wire88[(2'h2):(1'h0)] & reg90[(3'h5):(3'h5)])));
    end
  assign wire92 = wire87;
  assign wire93 = {({wire88[(2'h3):(1'h0)], wire84} ?
                          reg91[(3'h4):(2'h3)] : wire86)};
  assign wire94 = wire93[(1'h0):(1'h0)];
  assign wire95 = $unsigned((((~&(wire85 ?
                      wire87 : wire88)) < wire89[(4'hb):(2'h3)]) + reg90[(4'h9):(3'h5)]));
  assign wire96 = (^~$signed(({(^~wire94), (wire85 | wire92)} ?
                      $unsigned(wire94[(1'h1):(1'h0)]) : $signed((wire87 ?
                          wire92 : wire84)))));
  assign wire97 = $signed(({((wire96 <<< wire94) ?
                          (reg90 << wire95) : $signed(wire92)),
                      ((wire84 ?
                          wire88 : (8'hab)) && (&wire92))} ^~ $signed($unsigned($unsigned(wire94)))));
  assign wire98 = wire86[(2'h2):(2'h2)];
  assign wire99 = wire86;
  assign wire100 = (~|(((&$unsigned(reg90)) ? {(|reg90)} : {(reg91 >> reg91)}) ?
                       wire87 : (((reg91 ?
                           wire92 : wire98) <= (wire85 && wire99)) | ((!wire94) ?
                           (wire84 ?
                               wire89 : wire96) : reg90[(4'ha):(1'h0)]))));
  always
    @(posedge clk) begin
      reg101 <= (7'h41);
      reg102 <= (-wire86);
      if ((~^$unsigned(((~&$unsigned((8'ha3))) - $unsigned(((7'h42) ?
          reg90 : wire93))))))
        begin
          reg103 <= (((wire97[(1'h1):(1'h0)] ?
              {(wire93 >>> wire94)} : ($unsigned(wire85) ?
                  $signed(reg91) : (wire97 ?
                      wire95 : reg102))) >= $unsigned((-(wire89 >> wire85)))) == $unsigned(reg90[(3'h6):(2'h3)]));
          reg104 <= $unsigned((~^reg91[(2'h3):(1'h1)]));
        end
      else
        begin
          reg103 <= wire87[(1'h0):(1'h0)];
          reg104 <= wire99;
          reg105 <= (8'hba);
          reg106 <= (^(({$signed(wire97),
              (reg91 ?
                  (7'h41) : wire96)} << (reg101[(3'h7):(2'h2)] + (~wire92))) && (~reg104[(4'h9):(4'h9)])));
          if (((reg90 >>> (wire87[(1'h0):(1'h0)] ?
              wire96[(1'h0):(1'h0)] : ($signed((8'ha2)) ?
                  wire84[(2'h3):(1'h1)] : reg102))) >= {(wire85[(4'h9):(3'h6)] == (&wire99)),
              {$unsigned($unsigned(reg104)),
                  (reg105[(2'h3):(2'h3)] ?
                      ((8'hbc) ~^ reg104) : wire93[(3'h6):(2'h3)])}}))
            begin
              reg107 <= $unsigned(reg106);
              reg108 <= (&$unsigned($unsigned($unsigned(wire96))));
              reg109 <= $unsigned(($unsigned((|(~&wire96))) ?
                  $unsigned($signed($unsigned((8'hb5)))) : (^$signed({(8'ha5),
                      wire97}))));
            end
          else
            begin
              reg107 <= $unsigned(wire84);
              reg108 <= reg109;
              reg109 <= $signed($unsigned({reg91,
                  ($unsigned(wire96) <= {wire84, reg90})}));
              reg110 <= ((reg107[(3'h7):(3'h4)] <= $unsigned((^~reg91))) && (!$signed((-reg91))));
            end
        end
      if ((((((&wire97) >> wire94[(2'h3):(1'h1)]) ~^ wire93[(2'h2):(2'h2)]) ?
          $signed(((reg106 ^~ wire94) > $unsigned(wire93))) : $signed($unsigned((~|reg90)))) ~^ (reg90[(4'hb):(4'h9)] >>> (~^wire100))))
        begin
          reg111 <= (wire95[(4'hc):(3'h6)] ?
              ((&(wire98 ^ reg106)) ?
                  $unsigned((^wire88)) : ($unsigned((reg103 ~^ reg109)) == reg107[(3'h7):(2'h3)])) : $unsigned(($signed($signed((8'h9c))) < $signed(wire100))));
          reg112 <= reg103[(2'h2):(1'h0)];
          reg113 <= (($signed({{reg90}}) >>> ((~&(reg112 << reg108)) & ({reg103,
              wire89} <= (-(8'hab))))) >>> (reg112 ?
              ($unsigned($unsigned(wire88)) * (~&$unsigned(reg105))) : (~|((reg109 ^ reg91) << $unsigned(wire92)))));
          reg114 <= $signed(wire84[(1'h1):(1'h0)]);
          reg115 <= (~^(wire84 ~^ ((!(wire95 - (8'hbd))) ^ $unsigned((~wire85)))));
        end
      else
        begin
          reg111 <= wire93[(3'h4):(1'h0)];
        end
    end
  assign wire116 = wire84[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg117 <= wire85[(3'h7):(3'h5)];
      reg118 <= ((reg106[(4'hc):(4'h8)] ^ (~^{(wire87 == wire97)})) ?
          $unsigned({wire93, (8'hb3)}) : reg106[(3'h5):(1'h0)]);
    end
  assign wire119 = (((~((wire116 ? (8'ha6) : reg90) ?
                       (wire85 >= reg109) : {wire85})) ^ (|$signed((wire100 ?
                       wire89 : reg112)))) <<< {$signed({$signed(reg102)}),
                       $signed(($unsigned(reg105) ? reg103 : reg104))});
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire47;
  input wire signed [(3'h7):(1'h0)] wire46;
  input wire signed [(2'h2):(1'h0)] wire45;
  input wire signed [(4'h9):(1'h0)] wire44;
  input wire [(4'he):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire48;
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire48,
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
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire48 = (~|((wire43[(4'hd):(4'h9)] ?
                          (wire46[(2'h2):(2'h2)] ^~ (~|wire45)) : wire45) ?
                      wire46 : wire44[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      reg49 <= $signed(((^~wire47) ?
          wire45[(2'h2):(2'h2)] : (!((wire44 ?
              wire44 : (8'ha9)) || wire47[(1'h0):(1'h0)]))));
      reg50 <= $signed(reg49);
      reg51 <= $signed($unsigned(((wire44 ~^ (wire45 ?
          reg49 : wire48)) <<< (reg49 ? (~reg50) : (&wire43)))));
      reg52 <= (~&reg50);
      reg53 <= $unsigned(((+$signed({(8'h9c),
          wire44})) <<< wire48[(4'h8):(1'h1)]));
    end
  assign wire54 = wire47[(1'h1):(1'h1)];
  assign wire55 = ($signed(reg53) * (+{wire44}));
  assign wire56 = reg49[(3'h4):(1'h1)];
  assign wire57 = ($signed($unsigned($signed(wire43[(4'hd):(4'hb)]))) > $unsigned((|wire45)));
  assign wire58 = {wire48[(4'hd):(4'hb)]};
  assign wire59 = {wire45, $unsigned((8'h9f))};
  assign wire60 = ((!(^~$unsigned((reg53 <= reg51)))) ?
                      $signed($signed(({wire57, wire43} ?
                          (wire59 ^~ reg53) : wire48[(5'h11):(4'hf)]))) : wire58);
  assign wire61 = (reg51[(3'h4):(2'h3)] ?
                      (wire57 ?
                          {$signed(wire56)} : wire48) : $unsigned((&($signed(wire60) - wire47))));
  assign wire62 = wire57;
  assign wire63 = wire44[(4'h8):(4'h8)];
  assign wire64 = ((-{{(~|wire43), wire62[(3'h4):(3'h4)]},
                      (~&$unsigned(wire55))}) ^~ {reg52[(2'h2):(1'h1)],
                      (7'h41)});
  assign wire65 = $signed(wire46[(2'h3):(2'h2)]);
  assign wire66 = reg49;
  assign wire67 = wire61[(3'h4):(1'h1)];
  assign wire68 = ((((wire47[(1'h1):(1'h1)] ^~ $unsigned((7'h40))) ?
                          $signed(wire43[(4'he):(1'h0)]) : {(reg50 ?
                                  wire66 : wire63)}) != (wire43 >>> (&wire67))) ?
                      ((wire55 ?
                          {$signed(wire55)} : (|(reg52 ?
                              wire67 : reg53))) >> (+wire55[(4'h9):(2'h2)])) : $signed(wire58[(3'h7):(3'h4)]));
  always
    @(posedge clk) begin
      reg69 <= wire43[(3'h4):(1'h1)];
      reg70 <= {wire68, ((8'hb1) >= $unsigned($signed(reg49)))};
      reg71 <= wire60;
      if (((reg51 << wire64[(4'hc):(3'h4)]) ?
          wire56[(1'h1):(1'h0)] : ($signed($signed(reg53[(1'h1):(1'h0)])) ?
              $unsigned($signed((!wire64))) : ($unsigned(wire43[(1'h1):(1'h1)]) ?
                  wire45[(1'h1):(1'h1)] : (wire67 >> (~|wire64))))))
        begin
          reg72 <= reg69;
          reg73 <= (reg50 ?
              ($unsigned(reg52) ?
                  ($unsigned($signed(reg49)) - wire48[(3'h5):(3'h4)]) : (((^~(7'h44)) ?
                          (reg52 ? reg53 : wire43) : wire65) ?
                      (~|(wire61 ? wire55 : wire57)) : ((wire61 * (8'hb5)) ?
                          (wire44 || wire62) : $unsigned(wire57)))) : $signed((~|wire63[(3'h4):(2'h3)])));
          if ({($signed($unsigned(((8'hae) ? wire47 : reg71))) >>> {((wire60 ?
                          wire66 : (8'hb8)) ?
                      wire62 : {wire43})})})
            begin
              reg74 <= (8'hba);
              reg75 <= reg71;
              reg76 <= $signed($signed(wire43));
              reg77 <= (~&reg69);
              reg78 <= (($signed($signed(wire66)) ?
                  {$unsigned($unsigned(wire64)),
                      $signed($unsigned(wire47))} : reg49[(1'h1):(1'h0)]) == {((wire62[(1'h1):(1'h1)] ?
                      $signed(wire58) : (wire62 ?
                          wire63 : wire44)) < $unsigned(reg70[(2'h2):(1'h0)])),
                  $signed(({wire61} - (7'h43)))});
            end
          else
            begin
              reg74 <= (8'hb8);
              reg75 <= reg53;
              reg76 <= reg50[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg72 <= ((($unsigned({reg52}) ?
              wire54 : reg52[(3'h4):(2'h3)]) ^ ($signed({(8'ha0)}) ?
              reg51[(4'ha):(4'ha)] : reg71)) >>> $unsigned(wire46));
        end
    end
  assign wire79 = {wire56, $signed(reg70[(1'h1):(1'h1)])};
  assign wire80 = ($unsigned(wire55[(4'h9):(3'h4)]) ?
                      {{wire55,
                              ((|(8'h9c)) ?
                                  (~reg72) : (~|reg76))}} : ($signed((&$signed(wire55))) & reg53));
endmodule

module module28
#(parameter param38 = ((((&((8'h9e) ^~ (8'hae))) ? {(8'hbe), (~(8'hb0))} : (-((8'hbd) ^~ (8'had)))) - (^(((8'ha0) ? (8'ha8) : (8'h9f)) ? (!(8'ha4)) : (+(8'hbd))))) && ((((&(8'h9c)) ? ((8'hbf) ? (8'hb6) : (8'ha7)) : (!(8'ha0))) >= ({(8'hb3)} != ((8'h9e) >>> (7'h41)))) ? ((|((8'hbb) ? (7'h44) : (8'ha7))) | (((8'ha9) ? (8'ha2) : (8'hb2)) <= ((8'h9e) ? (8'hbb) : (8'hbb)))) : {((^(8'hb4)) ? ((8'hb7) & (8'hae)) : ((7'h43) <<< (8'ha9)))})), 
parameter param39 = (-param38))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire33;
  input wire signed [(4'hf):(1'h0)] wire32;
  input wire signed [(5'h10):(1'h0)] wire31;
  input wire [(2'h3):(1'h0)] wire30;
  input wire [(2'h2):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  assign y = {wire37, wire36, wire35, wire34, (1'h0)};
  assign wire34 = {wire31[(2'h2):(2'h2)]};
  assign wire35 = wire29;
  assign wire36 = (~($unsigned((wire33 + $unsigned(wire32))) ?
                      (-$unsigned((wire29 ?
                          wire35 : wire34))) : {$signed((~|wire29))}));
  assign wire37 = $signed({(&wire32[(4'h8):(2'h2)])});
endmodule
