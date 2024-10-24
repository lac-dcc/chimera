module top
#(parameter param208 = ((~|({(7'h44)} ? {(~^(8'ha8)), ((8'hb4) <<< (8'hbb))} : (8'hb8))) ? ({{((8'ha9) ? (8'hb8) : (8'hbd))}, (8'hbe)} < ((((7'h40) ? (7'h40) : (8'hb9)) != {(8'ha3)}) + (((8'haa) ? (7'h42) : (8'haa)) ? (-(8'hb8)) : ((8'ha9) ? (8'hb4) : (7'h41))))) : ((-((~^(8'h9e)) ^~ ((8'h9c) >= (8'ha1)))) ? (({(8'hb0), (8'hbc)} ? {(8'ha9)} : (-(8'hb6))) ? (((7'h44) ? (7'h42) : (8'hbf)) ? (~|(8'h9c)) : ((8'hb9) ? (8'h9e) : (8'h9e))) : (((8'ha2) ? (8'hb8) : (8'hb1)) + {(8'ha1), (8'hae)})) : (({(8'hb8)} ? ((8'ha8) ? (8'hb6) : (8'hb2)) : {(8'hb6)}) - (((7'h44) >>> (8'ha0)) || ((8'ha6) ^~ (8'ha8)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire207;
  wire signed [(4'h9):(1'h0)] wire182;
  wire signed [(5'h10):(1'h0)] wire180;
  wire [(3'h7):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg202 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg201 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg200 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg199 = (1'h0);
  reg [(5'h11):(1'h0)] reg198 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg196 = (1'h0);
  reg [(4'ha):(1'h0)] reg195 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg194 = (1'h0);
  reg [(5'h12):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg192 = (1'h0);
  reg [(3'h6):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg190 = (1'h0);
  reg [(4'ha):(1'h0)] reg189 = (1'h0);
  reg [(3'h4):(1'h0)] reg188 = (1'h0);
  reg [(2'h3):(1'h0)] reg187 = (1'h0);
  reg [(3'h6):(1'h0)] reg186 = (1'h0);
  reg [(4'h9):(1'h0)] reg185 = (1'h0);
  reg [(3'h6):(1'h0)] reg184 = (1'h0);
  reg [(5'h13):(1'h0)] reg183 = (1'h0);
  assign y = {wire207,
                 wire182,
                 wire180,
                 wire7,
                 wire6,
                 wire5,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
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
                 (1'h0)};
  assign wire5 = $unsigned(wire1);
  assign wire6 = $unsigned((8'hbd));
  assign wire7 = wire1[(3'h6):(2'h3)];
  module8 #() modinst181 (wire180, clk, wire3, wire2, wire0, wire7);
  assign wire182 = $signed((~wire5[(4'hb):(3'h7)]));
  always
    @(posedge clk) begin
      reg183 <= wire2[(4'ha):(3'h5)];
      if ($signed((^$signed($unsigned($unsigned(wire3))))))
        begin
          if ($unsigned({(((wire182 ^~ wire3) ?
                  wire1[(2'h2):(2'h2)] : (wire0 > (8'hb1))) - (wire5 ?
                  (wire182 <= wire1) : (wire7 + wire5))),
              wire180}))
            begin
              reg184 <= $unsigned(($unsigned((|wire182)) ?
                  (wire182[(3'h5):(2'h3)] ?
                      (|{(8'hbe)}) : (~wire180)) : wire6[(1'h0):(1'h0)]));
              reg185 <= (^(^~({(wire5 == reg183)} != $signed(wire3[(2'h2):(1'h0)]))));
              reg186 <= (wire7[(3'h4):(2'h3)] <<< $unsigned(($unsigned(wire182[(3'h5):(3'h5)]) ?
                  wire6 : {(^~wire1), $signed(wire3)})));
              reg187 <= ((~$unsigned($unsigned((+reg184)))) >> ($signed(wire180) ~^ $unsigned(wire6[(3'h4):(2'h2)])));
            end
          else
            begin
              reg184 <= wire6;
              reg185 <= ($unsigned(wire0) ?
                  (((8'hbc) != (((8'ha9) ? (8'ha3) : reg184) ?
                      wire2 : {wire182, wire5})) << (wire182 ?
                      wire182[(3'h7):(3'h5)] : (wire7[(3'h6):(1'h1)] ~^ (reg187 ?
                          reg183 : wire180)))) : $signed(($unsigned((+wire7)) ?
                      ((wire182 ?
                          (8'hb9) : reg186) <<< $unsigned(wire1)) : $unsigned($signed(wire2)))));
              reg186 <= ((8'hae) ?
                  ({wire7[(3'h4):(1'h0)],
                      wire3[(1'h1):(1'h1)]} ^ wire7) : $signed((8'had)));
            end
          reg188 <= (((^~{$signed(wire2)}) ^~ reg184) ?
              wire3[(4'h8):(3'h7)] : $unsigned($unsigned(((!wire180) ?
                  $unsigned((8'hbd)) : (reg186 ? wire5 : reg186)))));
          if ($signed((((reg185 ?
              $signed(wire2) : reg183[(3'h7):(2'h3)]) >> reg187) & $unsigned($signed((&wire1))))))
            begin
              reg189 <= (wire3[(4'h9):(2'h3)] ?
                  (((wire4 ? (wire182 ? reg183 : wire7) : (^~wire2)) ?
                      $signed($signed(reg184)) : reg183) != {$signed(wire6[(2'h3):(1'h0)])}) : (((&reg186) ?
                          (reg183[(2'h2):(1'h0)] ~^ wire3[(4'h8):(2'h3)]) : reg183) ?
                      ((reg185[(1'h0):(1'h0)] ?
                              (reg188 ? reg183 : (8'hac)) : (wire5 ?
                                  wire180 : (8'ha6))) ?
                          wire7[(3'h5):(1'h1)] : ({wire0, reg187} ?
                              $signed((7'h40)) : (~|wire7))) : {$unsigned((^~wire4)),
                          (reg188 > wire4[(3'h5):(1'h1)])}));
              reg190 <= {$signed(($signed(reg187) ? reg187 : reg184))};
            end
          else
            begin
              reg189 <= ((~reg183[(2'h2):(1'h0)]) <<< $signed((~&$signed(reg186[(1'h0):(1'h0)]))));
              reg190 <= $unsigned($signed(($unsigned((~^wire0)) ?
                  wire3 : (((8'ha9) ? wire4 : reg187) ?
                      wire180[(1'h1):(1'h1)] : (wire5 > (8'hbb))))));
              reg191 <= ($signed($signed(($signed(wire180) ?
                  (reg189 ?
                      wire6 : reg184) : (^wire180)))) >> wire180[(4'hc):(1'h1)]);
              reg192 <= wire1[(3'h6):(1'h0)];
              reg193 <= ($unsigned(wire180[(3'h4):(3'h4)]) < $signed(reg192[(2'h2):(2'h2)]));
            end
        end
      else
        begin
          if (((reg185 ?
                  $signed(reg192[(4'ha):(4'h9)]) : $signed($unsigned((8'hab)))) ?
              (+(wire4 ^~ $signed((reg183 >>> wire1)))) : (^(-reg183[(3'h4):(3'h4)]))))
            begin
              reg184 <= (&((^~{$unsigned(reg183)}) < ((~^$unsigned(reg188)) ?
                  ($unsigned((7'h44)) ?
                      (~^wire0) : {wire2}) : reg187[(2'h3):(1'h0)])));
              reg185 <= (-(~&$signed(reg190)));
              reg186 <= $signed($signed(reg189[(3'h4):(1'h1)]));
            end
          else
            begin
              reg184 <= (~&wire5[(4'hd):(4'hd)]);
              reg185 <= (($unsigned($unsigned(((8'hb5) ?
                      wire6 : (7'h40)))) >>> (~|{(!reg191)})) ?
                  wire4 : reg185[(4'h8):(2'h2)]);
            end
          reg187 <= ($unsigned({(!(8'h9d)),
              ($signed(reg183) > $signed(reg187))}) >= ($signed({reg188[(2'h2):(2'h2)],
                  (wire4 ? wire180 : wire182)}) ?
              (^~$signed($signed(wire6))) : (+($unsigned(wire6) << wire4))));
        end
      reg194 <= (|{$unsigned($unsigned($signed(reg189)))});
      if ($unsigned($signed(reg184)))
        begin
          if ({wire4})
            begin
              reg195 <= (wire2 ?
                  reg185 : (reg189 ?
                      ($unsigned($signed(wire3)) ?
                          $unsigned(wire5) : (&(8'hae))) : (+{(~&(8'ha6)),
                          wire4[(3'h4):(3'h4)]})));
              reg196 <= ($unsigned((($unsigned(reg188) != (wire182 ?
                      wire4 : (7'h40))) ^ (wire2[(4'hf):(4'hb)] * $signed(wire180)))) ?
                  $unsigned(wire7) : ($unsigned(reg189) < (reg191[(2'h2):(1'h0)] ~^ $signed((|reg191)))));
              reg197 <= {(~(wire3[(4'hb):(4'ha)] ~^ $signed($signed(wire3))))};
            end
          else
            begin
              reg195 <= $signed(($unsigned(reg190[(3'h5):(1'h0)]) * (~|reg196)));
            end
          reg198 <= (($unsigned(wire0) + reg188[(1'h1):(1'h0)]) ?
              wire2[(4'ha):(3'h6)] : $signed((8'ha9)));
          reg199 <= (((!(!reg188[(3'h4):(1'h1)])) ?
              $unsigned($signed({reg188,
                  wire180})) : $signed(reg187)) >>> reg183[(3'h6):(3'h5)]);
          reg200 <= wire3[(1'h1):(1'h1)];
        end
      else
        begin
          if ((8'had))
            begin
              reg195 <= wire0;
            end
          else
            begin
              reg195 <= reg195;
              reg196 <= reg189;
              reg197 <= ((+$signed(reg188)) ?
                  wire182 : (($signed($unsigned(wire180)) > ($unsigned(wire7) > (+reg188))) ?
                      reg191[(2'h3):(1'h1)] : $unsigned($signed(reg186))));
            end
          if ($unsigned(((~|$signed($unsigned((7'h41)))) ?
              (+$unsigned(reg198)) : reg187)))
            begin
              reg198 <= reg197[(1'h0):(1'h0)];
              reg199 <= (wire3 ?
                  $signed($unsigned({$signed((8'had)),
                      ((8'had) != (8'hb6))})) : ({(!(^~reg187)), reg199} ?
                      reg195 : ($signed(wire3[(4'hc):(3'h6)]) ^~ reg189)));
            end
          else
            begin
              reg198 <= $signed($unsigned(($signed({wire180, wire0}) ?
                  $signed($signed(reg195)) : $signed((-(8'ha1))))));
              reg199 <= (((($unsigned(reg184) ?
                      reg194[(1'h1):(1'h0)] : (wire7 ? wire7 : reg197)) ?
                  $unsigned($signed(reg186)) : ({reg197} <= (reg188 ?
                      reg199 : wire4))) > {((reg195 ? reg199 : reg187) ?
                      (wire2 > wire7) : {reg196, (8'h9d)}),
                  (reg193 >>> wire0)}) >> ($signed(reg199[(4'h8):(3'h5)]) != (wire7[(2'h3):(1'h0)] << $signed($signed(reg185)))));
              reg200 <= $signed(wire182);
              reg201 <= ((((((8'hb4) ? wire0 : (8'hbe)) ?
                          $unsigned(wire182) : (reg190 ?
                              reg190 : (8'ha3))) | $unsigned({(8'hbe),
                          reg191})) ?
                      (($signed((8'hae)) * reg189) ?
                          (reg187[(2'h3):(1'h0)] >> reg187) : reg191) : $unsigned($unsigned((wire2 ?
                          reg194 : reg189)))) ?
                  reg196[(4'hc):(3'h6)] : $signed(({reg183[(4'hf):(4'ha)],
                      reg193} ^~ (~(reg183 ? reg200 : (8'hb3))))));
              reg202 <= $signed({reg196[(5'h11):(5'h10)]});
            end
          reg203 <= $unsigned((~(reg187[(1'h1):(1'h1)] || (&(wire5 ?
              wire4 : reg194)))));
          reg204 <= {$unsigned(((8'hbd) && {$unsigned((8'hb0))})),
              (((!(reg192 ?
                  (8'hac) : wire4)) * reg191[(1'h0):(1'h0)]) ^ reg198)};
          reg205 <= (8'hb5);
        end
      reg206 <= ($unsigned($unsigned((((8'hbc) <= reg185) & wire7))) < ($signed(reg205) << (((&reg202) == (reg186 < wire1)) ?
          reg190 : ((wire1 ? reg199 : reg188) || (&wire3)))));
    end
  assign wire207 = $unsigned(reg198);
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire11;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire167;
  wire [(2'h3):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire131;
  wire signed [(3'h6):(1'h0)] wire165;
  reg [(2'h3):(1'h0)] reg179 = (1'h0);
  reg [(3'h7):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg172 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg171 = (1'h0);
  reg [(4'hf):(1'h0)] reg170 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg168 = (1'h0);
  assign y = {wire167,
                 wire42,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire44,
                 wire45,
                 wire131,
                 wire165,
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
                 (1'h0)};
  assign wire13 = (wire10 <= (wire10[(3'h7):(3'h6)] ?
                      ((8'h9f) >>> $signed((wire10 ?
                          wire11 : wire9))) : wire12[(1'h0):(1'h0)]));
  assign wire14 = wire11;
  assign wire15 = (+($signed((wire11[(2'h3):(1'h0)] || $signed(wire10))) ?
                      ($signed((wire10 ? wire9 : (8'h9e))) || ({wire14} ?
                          (wire14 ?
                              wire11 : wire14) : $signed((8'ha4)))) : {(wire13 <<< (wire14 | wire14)),
                          {{wire10}}}));
  assign wire16 = (8'haf);
  assign wire17 = wire11;
  assign wire18 = (~^wire16);
  assign wire19 = (-wire10);
  assign wire20 = wire14;
  assign wire21 = wire17[(3'h4):(2'h2)];
  module22 #() modinst43 (.y(wire42), .clk(clk), .wire26(wire20), .wire23(wire17), .wire25(wire15), .wire27(wire10), .wire24(wire11));
  assign wire44 = wire14;
  assign wire45 = wire13;
  module46 #() modinst132 (wire131, clk, wire18, wire21, wire16, wire14);
  module133 #() modinst166 (wire165, clk, wire13, wire17, wire19, wire12, wire45);
  assign wire167 = $signed($unsigned((7'h42)));
  always
    @(posedge clk) begin
      reg168 <= $signed({(|$unsigned($unsigned(wire17))), wire20});
      reg169 <= wire167[(3'h6):(1'h1)];
      if ($unsigned($unsigned((($signed(wire10) | (!wire17)) ?
          $unsigned($unsigned((8'ha1))) : wire42))))
        begin
          reg170 <= (wire167 ?
              ($signed((^(wire42 ? wire11 : wire165))) ?
                  ({{wire16,
                          wire15}} < $signed({(8'ha9)})) : $signed((~&{wire45,
                      (8'ha0)}))) : wire44[(4'he):(4'hb)]);
          if (wire15[(3'h6):(3'h6)])
            begin
              reg171 <= (^((~|$signed($unsigned(wire131))) - reg168));
              reg172 <= wire18[(4'hc):(3'h5)];
            end
          else
            begin
              reg171 <= (wire13 ?
                  $unsigned($signed(wire42)) : ($unsigned({wire11[(3'h5):(1'h1)],
                      (wire13 ? wire42 : wire11)}) >>> wire131));
              reg172 <= ((~&($signed({wire17, wire167}) ?
                      (8'hab) : {wire9[(2'h2):(2'h2)]})) ?
                  $unsigned({wire131,
                      wire44}) : ((8'hae) + $signed(({(8'hbc)} ^ wire45))));
            end
          reg173 <= $signed((~((&wire131) ?
              $unsigned({wire17}) : ($unsigned(wire44) + $unsigned(wire18)))));
          reg174 <= ($signed(wire13) - (wire167 ?
              $unsigned($signed((wire19 - (8'h9d)))) : {(!$unsigned((8'hae))),
                  ({wire11, wire42} ? (reg172 | wire15) : $unsigned(reg169))}));
          if (((-(reg171[(1'h1):(1'h1)] < (((8'hb3) << (8'h9f)) ?
                  (^~reg173) : $unsigned(wire10)))) ?
              wire44 : ($unsigned((7'h44)) <<< ((8'ha2) - wire42))))
            begin
              reg175 <= wire15[(4'hb):(4'ha)];
            end
          else
            begin
              reg175 <= wire21;
              reg176 <= wire20[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg170 <= ($unsigned($signed($signed($signed(wire18)))) ?
              (($signed(wire44[(3'h7):(1'h0)]) ?
                      $signed((reg175 != wire42)) : $unsigned($signed(reg168))) ?
                  $signed(reg168) : $unsigned(({wire20, reg172} != (reg175 ?
                      wire19 : (8'hbe))))) : $unsigned($signed($signed($signed(wire45)))));
          reg171 <= $signed((&$unsigned(((wire165 ? wire16 : (8'ha2)) ?
              $signed(wire42) : $unsigned(wire17)))));
        end
      if ({wire42[(2'h2):(2'h2)]})
        begin
          reg177 <= wire167[(3'h6):(1'h0)];
          reg178 <= ((-wire45[(2'h2):(2'h2)]) ?
              $signed((((wire13 ? (8'ha3) : wire9) ?
                      wire13 : ((8'hb5) > reg174)) ?
                  wire13 : ((wire9 >= (7'h44)) ?
                      (8'ha2) : (~|reg172)))) : $unsigned(($signed($unsigned(wire17)) && $signed($unsigned(reg172)))));
        end
      else
        begin
          reg177 <= wire10[(4'h8):(1'h1)];
          reg178 <= (!(8'hb6));
        end
      reg179 <= $unsigned({wire44, (|wire165)});
    end
endmodule

module module133
#(parameter param164 = ((+((7'h43) ? (!{(8'hbb)}) : ({(8'hb7), (8'hba)} ~^ ((8'ha7) >= (8'hb1))))) >> (~(({(8'ha3)} ? ((8'h9f) <<< (8'hb4)) : ((8'hac) ? (8'hab) : (8'hb8))) ^ (((8'hb6) ? (8'hb3) : (8'hb0)) | (8'ha3))))))
(y, clk, wire138, wire137, wire136, wire135, wire134);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire138;
  input wire signed [(4'he):(1'h0)] wire137;
  input wire signed [(5'h12):(1'h0)] wire136;
  input wire [(3'h5):(1'h0)] wire135;
  input wire signed [(4'hd):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire163;
  wire [(4'he):(1'h0)] wire159;
  wire [(3'h4):(1'h0)] wire158;
  wire signed [(3'h4):(1'h0)] wire157;
  wire [(5'h12):(1'h0)] wire156;
  wire signed [(3'h7):(1'h0)] wire155;
  wire signed [(3'h7):(1'h0)] wire154;
  wire [(4'hf):(1'h0)] wire153;
  wire signed [(4'hb):(1'h0)] wire152;
  wire signed [(4'hb):(1'h0)] wire151;
  wire [(4'hf):(1'h0)] wire150;
  wire [(3'h5):(1'h0)] wire149;
  wire signed [(5'h15):(1'h0)] wire148;
  wire [(4'he):(1'h0)] wire147;
  wire [(5'h12):(1'h0)] wire146;
  wire [(3'h7):(1'h0)] wire145;
  wire [(3'h4):(1'h0)] wire144;
  wire signed [(4'h8):(1'h0)] wire140;
  wire signed [(3'h7):(1'h0)] wire139;
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg143 = (1'h0);
  reg [(5'h13):(1'h0)] reg142 = (1'h0);
  reg [(4'hc):(1'h0)] reg141 = (1'h0);
  assign y = {wire163,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire140,
                 wire139,
                 reg162,
                 reg161,
                 reg160,
                 reg143,
                 reg142,
                 reg141,
                 (1'h0)};
  assign wire139 = wire138[(5'h10):(3'h6)];
  assign wire140 = (wire136 ^~ $unsigned($signed($unsigned(wire136[(4'hc):(1'h1)]))));
  always
    @(posedge clk) begin
      reg141 <= wire135[(1'h0):(1'h0)];
      reg142 <= wire135[(3'h5):(2'h3)];
      reg143 <= wire134[(3'h7):(1'h0)];
    end
  assign wire144 = $signed({{($unsigned(wire138) != wire137[(4'hb):(1'h1)])}});
  assign wire145 = {($unsigned({wire144[(1'h1):(1'h0)]}) ?
                           {wire140} : (wire136[(4'he):(1'h0)] ?
                               $unsigned((&(8'hb8))) : (((7'h42) != wire140) ~^ (~wire144)))),
                       $signed((^~((8'h9c) ? $signed((8'hba)) : (^~(8'hb1)))))};
  assign wire146 = $signed((((-$signed(wire145)) + (~|$signed(wire139))) < (~reg142[(5'h11):(4'he)])));
  assign wire147 = {wire146[(2'h2):(1'h0)],
                       ((~|wire146) ?
                           (wire146[(4'h9):(4'h9)] == reg143[(3'h4):(1'h0)]) : (^~(wire145[(2'h2):(1'h0)] ?
                               (wire135 ?
                                   reg142 : reg143) : $signed(wire145))))};
  assign wire148 = (8'hab);
  assign wire149 = wire134[(4'hc):(2'h2)];
  assign wire150 = wire136;
  assign wire151 = wire134;
  assign wire152 = $unsigned(reg142);
  assign wire153 = $unsigned(reg141[(3'h5):(1'h0)]);
  assign wire154 = {(({wire136} ~^ wire137) ?
                           (&(wire137 | {wire153})) : {(^$unsigned(wire134))})};
  assign wire155 = $unsigned((8'hbb));
  assign wire156 = reg143;
  assign wire157 = (((({wire139, wire156} <= wire136) && ({wire135,
                       wire147} > (wire151 ?
                       wire154 : wire146))) - $unsigned($signed((&wire156)))) > (~|$unsigned($unsigned(reg142))));
  assign wire158 = $signed(((^~wire136) >= ((~^(wire134 ? reg141 : (8'hac))) ?
                       $signed((8'ha3)) : ($unsigned(wire135) ?
                           (~wire134) : reg142[(5'h12):(3'h6)]))));
  assign wire159 = $unsigned(($unsigned($signed({wire145,
                       wire137})) - $unsigned($unsigned($signed(reg143)))));
  always
    @(posedge clk) begin
      reg160 <= (($signed($unsigned((8'ha7))) | wire138) != wire149[(1'h1):(1'h0)]);
      reg161 <= wire153;
      reg162 <= {wire157[(1'h0):(1'h0)], wire138};
    end
  assign wire163 = $signed((wire152 == ({$signed(wire150)} << wire148[(4'he):(1'h0)])));
endmodule

module module46
#(parameter param129 = {{(|((~^(7'h43)) ~^ (7'h43))), (({(8'ha9), (8'ha4)} * (|(8'hb5))) == (((8'h9f) - (8'hb0)) + {(8'had)}))}}, 
parameter param130 = (((8'hb7) < ((8'hac) ? (+(|param129)) : (~&(~param129)))) > ((-{(~(8'ha1))}) ? ({(param129 & param129), (~^param129)} ? ((^~param129) ? (~^param129) : (+(8'ha2))) : ((~|param129) < ((8'ha2) ? param129 : (8'hbb)))) : (^(param129 ? (param129 ? param129 : param129) : param129)))))
(y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h388):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire50;
  input wire signed [(5'h15):(1'h0)] wire49;
  input wire [(3'h6):(1'h0)] wire48;
  input wire [(4'h8):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire123;
  wire signed [(5'h10):(1'h0)] wire100;
  wire signed [(3'h4):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire88;
  wire signed [(3'h5):(1'h0)] wire80;
  wire signed [(5'h11):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire77;
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg [(4'hc):(1'h0)] reg125 = (1'h0);
  reg [(3'h4):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  assign y = {wire128,
                 wire123,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire90,
                 wire89,
                 wire88,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
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
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(wire48[(1'h1):(1'h1)]))
        begin
          if (wire48)
            begin
              reg51 <= wire47[(3'h6):(3'h6)];
            end
          else
            begin
              reg51 <= $signed(((wire50[(3'h5):(2'h2)] ?
                  ((8'hb4) & reg51[(3'h4):(2'h2)]) : (|$signed(wire48))) != (~wire50[(3'h4):(2'h3)])));
              reg52 <= (^~(~&$unsigned((8'ha2))));
              reg53 <= $signed($signed($unsigned($unsigned($unsigned(wire49)))));
            end
        end
      else
        begin
          reg51 <= reg51[(3'h6):(2'h2)];
          reg52 <= $signed((wire48 >= $unsigned({$unsigned(reg51),
              wire48[(2'h3):(1'h1)]})));
        end
      if ($unsigned((^$signed(wire50[(2'h2):(2'h2)]))))
        begin
          if (({(7'h44), $signed(reg53)} ~^ $signed($unsigned(wire50))))
            begin
              reg54 <= $signed(((-wire49) ?
                  {(+wire48[(3'h6):(2'h3)]), $unsigned((~|wire50))} : (((reg52 ?
                          wire47 : (8'h9c)) ?
                      (8'ha9) : wire49[(4'ha):(4'h8)]) | wire50[(2'h2):(1'h1)])));
              reg55 <= reg54[(3'h5):(1'h1)];
              reg56 <= (&{(wire50 ?
                      (~^(reg51 != reg55)) : ($signed(wire49) ?
                          $signed(reg54) : (wire47 ? wire48 : wire49))),
                  wire48});
              reg57 <= ($signed(($unsigned((reg55 + reg52)) << ($signed(reg56) * (wire47 ?
                  reg56 : wire48)))) <= ($signed($signed(reg54)) ?
                  $signed($signed((~&wire47))) : reg51[(1'h0):(1'h0)]));
              reg58 <= $unsigned(($unsigned($signed($signed(wire48))) ?
                  $unsigned($signed($unsigned((7'h42)))) : reg52));
            end
          else
            begin
              reg54 <= {{reg54}};
              reg55 <= reg56;
              reg56 <= {{(!{wire47})}};
            end
          if ($signed(($signed(reg53[(2'h3):(2'h3)]) ?
              (((~&reg52) < (wire48 & reg58)) ?
                  (~^((8'ha8) || wire47)) : reg58[(5'h13):(4'hb)]) : $signed((wire50 ?
                  $unsigned(wire49) : (reg52 <<< reg56))))))
            begin
              reg59 <= (~&$signed({reg54[(2'h2):(1'h1)]}));
              reg60 <= reg56;
            end
          else
            begin
              reg59 <= (^(~&(($signed((8'haa)) * {reg52}) ?
                  (|reg55) : $unsigned((reg51 != wire49)))));
              reg60 <= $unsigned(($unsigned({{(8'hb7)}}) ?
                  (~|$unsigned((~^reg54))) : (($unsigned(reg60) ?
                          (~|(7'h40)) : $unsigned((8'hbf))) ?
                      ((-reg56) + (wire48 ?
                          reg51 : wire48)) : reg52[(3'h7):(3'h6)])));
              reg61 <= ($signed($signed((~&reg55[(4'hf):(2'h3)]))) ?
                  reg60[(4'h8):(1'h0)] : (reg59[(1'h0):(1'h0)] ?
                      reg55 : $unsigned($unsigned($signed(reg56)))));
            end
          reg62 <= $unsigned($unsigned(reg59));
          reg63 <= $signed(((($unsigned((8'haa)) + (reg62 ? wire47 : reg51)) ?
              reg57[(3'h4):(2'h3)] : $signed($signed(wire50))) == reg55));
          reg64 <= (~(8'hb1));
        end
      else
        begin
          reg54 <= reg52[(4'hb):(1'h1)];
          reg55 <= reg64;
          reg56 <= reg59;
          reg57 <= ($signed(reg63[(1'h0):(1'h0)]) <= $signed($unsigned(($signed(reg55) ?
              (reg61 ? reg58 : reg54) : $signed(reg55)))));
          if ((((~|wire50[(4'h8):(2'h3)]) ?
              reg52 : reg54) && ({{reg63[(2'h3):(1'h0)]}} ?
              reg58 : (((-reg63) ?
                  (~|reg62) : $unsigned(reg51)) + ($signed(wire47) ?
                  $signed(reg63) : (reg63 >= reg56))))))
            begin
              reg58 <= (!(~|($signed({reg56}) ?
                  reg56[(2'h2):(1'h0)] : (^~(reg60 ? reg53 : reg61)))));
              reg59 <= (((|(!wire48)) >> $signed(reg54[(1'h1):(1'h1)])) ?
                  $unsigned((|(reg60[(2'h3):(2'h2)] ?
                      reg53 : reg51))) : $signed(reg51[(2'h2):(2'h2)]));
              reg60 <= $signed(reg57);
            end
          else
            begin
              reg58 <= (((!{$signed(reg54)}) >>> reg58) << reg56[(2'h2):(1'h1)]);
              reg59 <= (8'hac);
              reg60 <= {(reg64 ?
                      $unsigned((&$signed(wire48))) : (reg56 | (((8'ha0) ?
                              (8'ha4) : reg53) ?
                          $signed(reg60) : reg61[(3'h6):(2'h3)]))),
                  ((($unsigned(reg58) > reg52[(4'he):(4'hb)]) || $unsigned($unsigned(reg58))) < reg63)};
              reg61 <= reg58[(1'h0):(1'h0)];
            end
        end
      reg65 <= $unsigned(reg52[(3'h7):(2'h3)]);
      if (($unsigned($unsigned(reg62[(3'h4):(2'h2)])) ^~ ((|((reg57 ?
                  (8'hb0) : wire50) ?
              $signed(reg59) : (reg65 * wire49))) ?
          $signed((reg51 ? $signed(reg51) : (reg53 & wire47))) : (7'h40))))
        begin
          if (reg64[(2'h3):(2'h3)])
            begin
              reg66 <= (-$unsigned(reg53));
              reg67 <= $unsigned($unsigned(($unsigned((reg60 ? reg55 : reg57)) ?
                  ((!reg53) >>> $signed(wire50)) : $signed((8'hb3)))));
            end
          else
            begin
              reg66 <= (reg65[(2'h2):(1'h1)] * reg57);
              reg67 <= ((~^reg54[(3'h5):(1'h0)]) ?
                  (($unsigned((reg66 ? reg65 : (7'h44))) ?
                          (reg60 ?
                              $signed(reg58) : $unsigned((8'h9e))) : reg66[(2'h2):(1'h1)]) ?
                      (reg55[(5'h10):(4'hc)] ?
                          ((reg56 ? (8'ha7) : reg54) ?
                              reg53 : $signed((8'ha9))) : $signed((wire50 <= reg61))) : (wire49 ?
                          $unsigned((reg59 ?
                              reg58 : reg64)) : reg59[(3'h5):(3'h5)])) : (8'hae));
              reg68 <= $unsigned($unsigned($signed((!reg51[(2'h3):(2'h2)]))));
            end
        end
      else
        begin
          if (reg53)
            begin
              reg66 <= (wire48 ?
                  {reg61[(4'h8):(1'h0)], reg52} : wire47[(3'h5):(1'h0)]);
            end
          else
            begin
              reg66 <= ($signed((!$signed((reg68 & reg57)))) ?
                  ({$unsigned((reg54 ? reg65 : wire50)), reg53} ?
                      {$unsigned((reg52 ? reg59 : (8'hb0))),
                          reg61[(4'hc):(4'h9)]} : (((~&(8'ha8)) ?
                              (~&(8'hb9)) : reg57) ?
                          reg51[(3'h6):(2'h3)] : reg65[(3'h5):(1'h1)])) : (-reg68));
              reg67 <= reg58[(2'h2):(2'h2)];
              reg68 <= $signed(((~reg58) <= (({reg55, reg54} ^ (&reg54)) ?
                  ($signed(reg52) ?
                      (reg65 < reg68) : $unsigned(wire47)) : (-(~^(7'h40))))));
              reg69 <= reg62;
            end
          reg70 <= reg54[(1'h1):(1'h0)];
          reg71 <= reg67[(5'h13):(1'h0)];
          if (($unsigned(reg71) ? (^reg52[(5'h12):(1'h0)]) : reg55))
            begin
              reg72 <= reg59;
              reg73 <= (~^reg57);
              reg74 <= $unsigned($signed(reg63[(2'h3):(2'h3)]));
              reg75 <= (~|(($signed((reg69 ? wire49 : wire49)) ?
                      $signed((wire50 * reg63)) : ((~(8'ha2)) ?
                          {(7'h40)} : $unsigned(reg51))) ?
                  (reg56 <<< (reg68[(2'h2):(1'h0)] ?
                      (reg62 ?
                          reg55 : reg51) : (reg74 >>> reg57))) : (~^(&reg62[(3'h7):(3'h6)]))));
              reg76 <= (reg51 | ((((reg57 ? reg52 : reg67) - (reg58 * reg60)) ?
                      ((+reg73) & reg60) : reg66) ?
                  (-$signed(reg67)) : $unsigned(((~(8'ha8)) >= (~^wire47)))));
            end
          else
            begin
              reg72 <= $unsigned({reg68[(4'hd):(3'h7)]});
              reg73 <= ((8'hbb) == {wire48[(3'h4):(3'h4)]});
              reg74 <= $unsigned(reg59[(2'h3):(1'h0)]);
              reg75 <= $unsigned($signed($unsigned(wire48[(3'h6):(2'h2)])));
              reg76 <= (^((~^((^~reg74) ? reg55 : (reg66 ? reg61 : reg68))) ?
                  $unsigned($unsigned((~^reg59))) : (((reg73 ~^ reg54) ?
                          reg58[(4'h8):(1'h1)] : wire49) ?
                      ($signed(reg64) ?
                          (reg65 ^ (8'hac)) : $signed(reg69)) : (+$signed(reg65)))));
            end
        end
    end
  assign wire77 = wire47;
  assign wire78 = ($unsigned({{$unsigned(reg73), (!reg63)}}) ?
                      (~&(((^~(8'had)) >>> (!wire47)) * (reg55[(4'hb):(2'h3)] ?
                          (~^reg55) : $signed(reg74)))) : $signed(($signed((-wire48)) + ((8'ha0) ?
                          $unsigned(reg63) : reg67))));
  assign wire79 = $unsigned(reg59[(4'h8):(3'h5)]);
  assign wire80 = reg63;
  always
    @(posedge clk) begin
      reg81 <= $unsigned(reg57[(3'h4):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg82 <= $unsigned((wire78 ? reg73[(1'h1):(1'h0)] : reg71));
      reg83 <= ($signed($unsigned({$signed(reg70),
          reg58[(4'hd):(3'h6)]})) * reg70[(5'h11):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg84 <= ((~|{(8'hbe)}) ?
          ($signed($signed($unsigned(reg55))) ?
              wire47 : {((7'h40) ? $signed(reg59) : reg60[(4'hd):(4'h8)]),
                  (~&$signed(reg60))}) : $unsigned(((~|{(8'hb0), reg55}) ?
              $signed((~reg76)) : {reg64[(2'h3):(2'h2)], $signed(reg61)})));
      if ($unsigned((($unsigned((-reg51)) < $unsigned($unsigned((8'hb5)))) ?
          reg56[(1'h0):(1'h0)] : reg64[(4'h9):(2'h3)])))
        begin
          reg85 <= ($unsigned(reg71[(5'h10):(4'hf)]) ^ (~$signed((reg76 <<< {reg64,
              wire79}))));
          reg86 <= (&reg69[(1'h1):(1'h0)]);
          reg87 <= ((8'hb4) ? (8'ha7) : reg83[(3'h4):(2'h2)]);
        end
      else
        begin
          reg85 <= $unsigned((reg67 ?
              (~|reg67) : {{((8'hbe) <<< reg73), $unsigned(reg63)},
                  ($signed(reg74) ? $unsigned(reg59) : (~&wire78))}));
          if ($signed($unsigned(reg87[(4'ha):(4'ha)])))
            begin
              reg86 <= reg69[(4'hc):(1'h1)];
            end
          else
            begin
              reg86 <= $signed((-(^wire77)));
            end
          reg87 <= ((8'ha1) & $unsigned(({wire50[(3'h4):(3'h4)]} > (8'hba))));
        end
    end
  assign wire88 = wire48;
  assign wire89 = reg52;
  assign wire90 = (reg70 ?
                      (8'h9f) : {reg62,
                          ((reg57 != reg68[(3'h6):(2'h2)]) | (^(reg74 ?
                              reg60 : reg84)))});
  always
    @(posedge clk) begin
      reg91 <= $unsigned((^~(wire48 ?
          {(^reg55)} : ((reg87 < reg65) ?
              reg66[(3'h4):(2'h2)] : reg63[(2'h3):(1'h0)]))));
      reg92 <= reg64[(4'he):(4'hb)];
      if ($signed($unsigned($signed(reg55))))
        begin
          reg93 <= ($signed(wire79[(3'h4):(2'h3)]) ?
              (+reg74) : $unsigned(reg53));
          reg94 <= ($unsigned(reg59) ?
              $signed({reg87[(2'h3):(2'h3)],
                  $unsigned($unsigned(wire80))}) : wire89);
          reg95 <= (~$unsigned($signed((|$signed(reg56)))));
          reg96 <= (($signed($unsigned(reg87)) << reg68[(3'h4):(2'h2)]) * (reg71 * {(!$signed(wire77))}));
        end
      else
        begin
          reg93 <= (reg95 ?
              (~|$unsigned((~|(+reg68)))) : (+$signed((~{(7'h44), wire80}))));
          reg94 <= {(~|{reg96})};
        end
    end
  assign wire97 = $signed($signed($unsigned(($unsigned(reg82) != reg52))));
  assign wire98 = {reg65,
                      ((({reg61, reg72} && reg82) ?
                              reg85[(5'h10):(4'h8)] : $signed((wire79 ?
                                  reg84 : (8'hb8)))) ?
                          $signed((|(^~wire88))) : $signed((^wire79[(4'hb):(4'h9)])))};
  assign wire99 = (8'h9c);
  assign wire100 = (((7'h44) ?
                       (+$unsigned($signed(reg70))) : wire49) + ($signed(reg76) ?
                       reg70 : $unsigned($unsigned((~&wire97)))));
  always
    @(posedge clk) begin
      reg101 <= ($signed($signed(reg85)) ?
          (({(wire48 * reg62),
                  $signed((8'h9d))} || ((wire80 ~^ reg96) ~^ $signed(wire77))) ?
              (+{(~wire77),
                  $signed(reg86)}) : $signed(wire80)) : (reg55[(4'hf):(1'h1)] >>> (((reg85 && reg71) & (wire79 ?
              reg61 : reg69)) < (^~reg57))));
      if ((|$unsigned(wire98[(3'h4):(2'h2)])))
        begin
          reg102 <= $unsigned({$unsigned(($unsigned(reg61) ?
                  (reg68 <= reg60) : {wire98, wire50}))});
          reg103 <= ((({$signed(reg51)} ~^ reg84) ?
                  reg73 : (((reg86 != wire98) >= {reg54,
                      reg82}) >= $unsigned((-reg64)))) ?
              ($unsigned((8'hb5)) < wire99) : (((^~(wire99 ? reg91 : reg66)) ?
                  $unsigned(reg55[(3'h6):(2'h3)]) : reg71[(3'h4):(2'h3)]) + {$signed(reg62)}));
          reg104 <= (wire78[(1'h1):(1'h0)] ?
              $signed((($signed(reg83) + $signed(reg82)) ?
                  (~&(&reg54)) : reg58[(3'h5):(3'h5)])) : ((((!reg81) ?
                  (reg103 ?
                      reg56 : wire78) : wire99) == ((reg81 <= (7'h42)) & {wire49})) < reg103));
        end
      else
        begin
          if ($unsigned($unsigned((^~$signed({reg72})))))
            begin
              reg102 <= $signed((wire80[(1'h1):(1'h1)] ?
                  {reg60} : (($unsigned(reg60) >>> $signed((8'hae))) ?
                      $unsigned(reg86) : {$signed(reg72), (~^reg82)})));
            end
          else
            begin
              reg102 <= reg74[(5'h11):(3'h5)];
              reg103 <= reg68[(3'h4):(1'h1)];
              reg104 <= $signed(reg53);
            end
          reg105 <= (8'hbb);
          if (reg82[(1'h1):(1'h1)])
            begin
              reg106 <= (reg57[(3'h5):(2'h2)] * $unsigned(reg59));
            end
          else
            begin
              reg106 <= $unsigned($signed((reg84 ?
                  ((^~reg83) ?
                      reg51[(3'h7):(3'h5)] : (wire49 ^~ reg73)) : reg64)));
              reg107 <= (8'hb6);
              reg108 <= (^(~reg83));
              reg109 <= (~^((|((8'hbd) ?
                  $unsigned(reg76) : ((8'had) ?
                      reg59 : (7'h40)))) ^~ ($signed((^reg105)) ?
                  ((reg96 ? wire98 : reg81) ?
                      $unsigned(wire90) : (reg83 ?
                          reg72 : reg106)) : (-(8'ha3)))));
              reg110 <= (~&(wire97 << (^~(^~(|reg75)))));
            end
        end
      reg111 <= (~^(reg61 ?
          reg60[(4'hd):(3'h5)] : (reg94 ?
              {(reg75 ? (8'hb1) : wire89),
                  (|(8'haa))} : (wire77[(1'h0):(1'h0)] ~^ reg66[(3'h5):(2'h2)]))));
      if ($signed(reg101[(5'h10):(2'h2)]))
        begin
          reg112 <= ($unsigned((8'ha1)) + ((wire98 ?
                  (((8'had) ? (8'hbc) : wire48) ?
                      {reg107, reg105} : (reg60 ?
                          reg62 : (8'ha9))) : (~&(reg76 ? reg63 : reg55))) ?
              {$unsigned($unsigned(reg72)),
                  $signed(reg60)} : ($signed(reg52[(5'h11):(5'h11)]) ~^ reg107[(3'h4):(2'h2)])));
          reg113 <= $signed(reg76);
        end
      else
        begin
          reg112 <= reg101;
          reg113 <= $unsigned(((~|(reg58 || (!reg51))) ?
              ((~|$unsigned(reg74)) <<< (wire80 ?
                  reg110[(1'h0):(1'h0)] : $unsigned(reg58))) : (reg81 & ($signed(wire78) == reg76))));
          reg114 <= (8'ha4);
          reg115 <= (~{$unsigned($unsigned($unsigned(reg109)))});
          reg116 <= (((~wire77) != ($unsigned(reg91[(2'h3):(1'h1)]) && (!reg70))) ^ $signed($signed(reg73)));
        end
      if ($signed(wire48))
        begin
          reg117 <= (^~(reg107[(4'h9):(2'h3)] ?
              reg66 : ($signed(reg105) ?
                  reg63[(2'h3):(1'h1)] : reg82[(4'h8):(3'h5)])));
          reg118 <= (reg85 ?
              ((-((!reg53) ? reg58[(5'h14):(4'he)] : $unsigned(reg58))) ?
                  (|reg106) : ($unsigned(reg86) ?
                      $signed(reg86[(5'h13):(1'h1)]) : reg64)) : $unsigned(reg58));
          reg119 <= $unsigned($signed({$unsigned((reg110 & (8'ha2))),
              reg86[(5'h13):(4'hb)]}));
          reg120 <= reg113[(1'h1):(1'h0)];
        end
      else
        begin
          reg117 <= (8'ha3);
          reg118 <= (((($signed(reg54) == (wire100 ?
                  reg53 : reg110)) || reg119) ^ (-($unsigned(reg82) <= wire97))) ?
              (~|$unsigned($signed(reg112))) : ($signed({$unsigned(reg58),
                  reg55[(3'h5):(2'h3)]}) && ((reg85[(3'h7):(1'h1)] ?
                  $unsigned(reg110) : (reg65 >= reg96)) || $signed({wire47}))));
          if ($unsigned((~reg95)))
            begin
              reg119 <= $unsigned(((8'haa) << reg118[(3'h7):(1'h0)]));
              reg120 <= $signed(reg109);
              reg121 <= (reg86 ?
                  ($signed(reg62) ?
                      reg117[(4'he):(3'h5)] : (^(8'hbb))) : (reg53[(2'h2):(1'h0)] ?
                      {reg69} : wire90));
              reg122 <= reg56;
            end
          else
            begin
              reg119 <= $unsigned({{((reg103 != reg101) & $signed(reg76)),
                      $unsigned((-reg58))},
                  reg101});
            end
        end
    end
  assign wire123 = (reg92[(3'h6):(1'h0)] << (~reg51[(3'h6):(2'h3)]));
  always
    @(posedge clk) begin
      reg124 <= (-(($signed(reg114) <= $signed((~^reg51))) >= reg69[(3'h6):(3'h4)]));
      reg125 <= ($unsigned((-reg68[(2'h3):(1'h1)])) ? reg84 : (|reg62));
      reg126 <= reg60[(2'h3):(1'h1)];
      reg127 <= $signed({reg119[(1'h0):(1'h0)]});
    end
  assign wire128 = $unsigned(($unsigned({(reg95 ? reg72 : reg62),
                           $signed(reg75)}) ?
                       ($signed(wire78[(1'h0):(1'h0)]) + ($unsigned(reg124) ?
                           $signed(reg68) : (~^reg63))) : $unsigned($signed((reg61 <<< wire90)))));
endmodule

module module22  (y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire27;
  input wire signed [(4'h8):(1'h0)] wire26;
  input wire [(4'he):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire24;
  input wire signed [(5'h15):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire28;
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire30,
                 wire29,
                 wire28,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire28 = (^(+$unsigned(($unsigned(wire25) ?
                      ((8'hb9) ? (8'hb8) : wire27) : $signed(wire24)))));
  assign wire29 = $unsigned((!wire23[(5'h13):(4'hf)]));
  assign wire30 = wire28[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg31 <= (wire26 != wire25);
      reg32 <= $unsigned((8'hbc));
      reg33 <= (&{$signed(((!wire23) ?
              wire27[(2'h2):(2'h2)] : wire30[(3'h5):(3'h4)])),
          wire24[(2'h2):(1'h1)]});
    end
  assign wire34 = reg31;
  assign wire35 = wire29[(1'h1):(1'h0)];
  assign wire36 = reg33;
  assign wire37 = ($signed((~|wire25[(4'ha):(3'h7)])) ?
                      {$unsigned(((wire36 ^ reg33) ?
                              $signed(wire27) : (!(8'hac)))),
                          wire36} : wire29);
  assign wire38 = (~(!$unsigned({(8'hbb)})));
  assign wire39 = wire27;
  assign wire40 = wire28[(3'h5):(1'h0)];
  assign wire41 = {(+reg31)};
endmodule
