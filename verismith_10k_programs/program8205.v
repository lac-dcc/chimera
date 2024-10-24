module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire228;
  wire [(4'ha):(1'h0)] wire226;
  wire [(4'hc):(1'h0)] wire225;
  wire signed [(3'h4):(1'h0)] wire224;
  wire signed [(3'h5):(1'h0)] wire223;
  wire signed [(5'h12):(1'h0)] wire222;
  wire signed [(3'h4):(1'h0)] wire221;
  wire [(5'h12):(1'h0)] wire219;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  assign y = {wire228,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire219,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire7,
                 wire6,
                 wire5,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (($unsigned((wire1 ? $signed(wire3) : $unsigned(wire1))) ?
                         $signed(((-wire3) ?
                             (wire2 ?
                                 (7'h42) : (8'hbd)) : (wire2 ^~ wire2))) : ($signed($unsigned((8'hbb))) ?
                             {wire3[(3'h6):(1'h0)],
                                 (wire2 ?
                                     wire3 : wire0)} : wire4[(4'h9):(3'h5)])) ?
                     $unsigned((~&wire4)) : (!wire4[(1'h0):(1'h0)]));
  assign wire6 = ({(7'h44)} ?
                     (-wire2[(4'h8):(2'h3)]) : (({(wire0 > wire4),
                         $signed(wire3)} & $unsigned({wire3,
                         wire3})) >> $unsigned($signed((wire0 <<< wire3)))));
  assign wire7 = ($unsigned(wire0[(2'h3):(1'h0)]) ?
                     (~wire0) : ((((wire4 ? wire0 : wire5) ?
                             wire1[(1'h0):(1'h0)] : {wire1, wire3}) ?
                         $unsigned((8'hbc)) : $unsigned({wire2,
                             wire2})) * wire0[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg8 <= $signed($unsigned((^$unsigned($signed(wire1)))));
      reg9 <= $unsigned(($signed(($signed(wire6) ?
              $unsigned(wire6) : (wire6 == wire6))) ?
          $signed((+(~|wire7))) : (-({wire6, (8'hb3)} ?
              (~&wire2) : (~|wire0)))));
      reg10 <= (wire6[(1'h0):(1'h0)] ?
          ($signed(reg9[(2'h3):(1'h0)]) - wire7[(1'h0):(1'h0)]) : (~|wire5));
      reg11 <= {wire1};
    end
  assign wire12 = reg9;
  assign wire13 = ((({$unsigned(reg10)} ?
                          ((wire1 * wire1) ~^ {(7'h42)}) : (&$unsigned(wire7))) ?
                      $unsigned(((-wire4) > (~reg11))) : wire0) + $unsigned(wire6));
  assign wire14 = ((7'h43) <<< ((+((reg9 ? wire13 : (8'hbf)) + (wire2 ?
                      (8'hbe) : wire0))) | wire6[(4'hb):(4'ha)]));
  assign wire15 = $signed((reg8 ?
                      ({reg9[(3'h4):(2'h3)]} || reg8[(4'hf):(2'h2)]) : wire3[(5'h12):(3'h5)]));
  assign wire16 = (~^($unsigned(((wire1 ?
                      wire6 : wire1) != reg8[(5'h15):(5'h13)])) & ((~&$signed(wire0)) ~^ $unsigned((wire15 ?
                      wire6 : (8'hbf))))));
  assign wire17 = $signed((wire1[(1'h1):(1'h0)] >> {(7'h43)}));
  module18 #() modinst220 (.clk(clk), .wire23(wire4), .wire22(wire7), .wire21(wire12), .y(wire219), .wire20(reg10), .wire19(wire17));
  assign wire221 = ($signed($unsigned(wire15[(4'h8):(3'h7)])) <<< $signed({wire13[(1'h0):(1'h0)]}));
  assign wire222 = $signed(wire4[(3'h5):(3'h5)]);
  assign wire223 = ({((+(wire14 >>> wire15)) || $signed((reg11 ?
                               wire16 : wire221)))} ?
                       (wire17[(4'h8):(1'h0)] ?
                           $unsigned((8'ha9)) : (8'ha5)) : (($unsigned(reg11[(5'h10):(5'h10)]) ?
                           (wire13 ^ $signed(reg8)) : ((8'hab) >>> reg10[(4'h8):(3'h6)])) + reg11));
  assign wire224 = wire15;
  assign wire225 = wire224[(2'h3):(1'h1)];
  module102 #() modinst227 (wire226, clk, wire222, reg9, reg8, wire6);
  module53 #() modinst229 (wire228, clk, wire1, reg10, wire14, wire5, wire7);
endmodule

module module18
#(parameter param217 = (({(((8'haf) <= (8'ha1)) | (8'h9d)), ((!(8'h9d)) ? (^(8'hb0)) : (^(8'ha7)))} ? (!(|(~&(8'ha5)))) : ((~|(~&(8'haa))) ? (!((8'hbc) >> (8'hb0))) : (~(-(8'hae))))) >> ({(((8'hbc) ? (7'h44) : (8'haf)) ? (~|(8'hb7)) : ((8'hae) ? (8'hbd) : (8'ha8)))} - ((((8'hbc) ? (8'hb0) : (8'hb9)) >>> {(8'hb7)}) + (^(&(8'haf)))))), 
parameter param218 = (-(&(-((~param217) ? (param217 ? param217 : param217) : ((8'hb9) ? (8'hbd) : param217))))))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire [(5'h12):(1'h0)] wire22;
  input wire [(5'h11):(1'h0)] wire21;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire [(5'h15):(1'h0)] wire19;
  wire [(4'h9):(1'h0)] wire206;
  wire [(5'h13):(1'h0)] wire204;
  wire signed [(4'ha):(1'h0)] wire203;
  wire signed [(4'hc):(1'h0)] wire202;
  wire signed [(5'h15):(1'h0)] wire201;
  wire [(5'h14):(1'h0)] wire200;
  wire [(5'h15):(1'h0)] wire198;
  wire signed [(5'h13):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire153;
  wire signed [(4'ha):(1'h0)] wire166;
  wire [(4'hc):(1'h0)] wire196;
  reg [(3'h7):(1'h0)] reg216 = (1'h0);
  reg signed [(4'he):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg214 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg213 = (1'h0);
  reg [(5'h13):(1'h0)] reg212 = (1'h0);
  reg [(4'he):(1'h0)] reg211 = (1'h0);
  reg [(2'h3):(1'h0)] reg210 = (1'h0);
  reg [(3'h6):(1'h0)] reg209 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg208 = (1'h0);
  reg [(2'h3):(1'h0)] reg207 = (1'h0);
  assign y = {wire206,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire198,
                 wire100,
                 wire52,
                 wire51,
                 wire49,
                 wire25,
                 wire24,
                 wire153,
                 wire166,
                 wire196,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 (1'h0)};
  assign wire24 = ((wire23 < $unsigned(($signed(wire20) * $signed(wire20)))) || $unsigned((((wire22 ?
                          wire21 : (8'ha5)) == wire19[(5'h14):(4'hb)]) ?
                      (^$unsigned(wire22)) : $signed($signed(wire21)))));
  assign wire25 = $signed((wire23[(3'h7):(2'h3)] ?
                      (({(8'ha2), wire22} ? (~wire20) : ((8'hbe) <<< wire24)) ?
                          ((wire24 ? wire23 : wire23) ?
                              (wire20 - wire22) : (~^(8'hb6))) : wire23[(1'h0):(1'h0)]) : wire22[(4'h9):(2'h2)]));
  module26 #() modinst50 (wire49, clk, wire21, wire20, wire23, wire22);
  assign wire51 = ($unsigned({$unsigned($unsigned(wire49)),
                      wire22[(3'h4):(3'h4)]}) > (^wire23[(4'ha):(4'h9)]));
  assign wire52 = wire23[(4'hb):(3'h6)];
  module53 #() modinst101 (.wire54(wire51), .wire56(wire19), .wire57(wire22), .clk(clk), .wire55(wire24), .wire58(wire23), .y(wire100));
  module102 #() modinst154 (wire153, clk, wire21, wire49, wire52, wire19);
  module155 #() modinst167 (wire166, clk, wire23, wire25, wire52, wire24);
  module168 #() modinst197 (wire196, clk, wire153, wire24, wire52, wire25, wire100);
  module155 #() modinst199 (.wire156(wire166), .wire157(wire21), .clk(clk), .y(wire198), .wire158(wire52), .wire159(wire24));
  assign wire200 = (~&{$unsigned(($signed((8'hac)) ?
                           $unsigned(wire21) : (wire196 != wire100))),
                       $signed(((^(8'haf)) ?
                           $unsigned(wire198) : $signed(wire21)))});
  assign wire201 = $signed($unsigned(wire22[(5'h12):(4'h9)]));
  assign wire202 = {wire49[(3'h6):(3'h4)]};
  assign wire203 = (~^$signed($signed(((~wire23) ?
                       (wire153 ? wire52 : wire201) : (+wire22)))));
  module102 #() modinst205 (.wire103(wire52), .clk(clk), .y(wire204), .wire106(wire166), .wire105(wire19), .wire104(wire203));
  assign wire206 = $unsigned((^$unsigned(((8'h9d) >> (wire196 ?
                       wire198 : (8'hb0))))));
  always
    @(posedge clk) begin
      reg207 <= wire22;
      reg208 <= (wire206 ?
          (~|(wire20[(1'h1):(1'h0)] ?
              ($unsigned(wire196) >> $signed(wire21)) : (wire198[(3'h6):(3'h6)] ^ (wire23 >> wire25)))) : (8'hbd));
      reg209 <= (((wire198 && {(wire23 ? wire100 : wire166),
              (wire25 <<< wire51)}) ?
          $signed(wire22) : ((|(wire52 & wire100)) ?
              (wire206 ?
                  ((8'haa) >= wire206) : (^~wire51)) : reg207[(1'h0):(1'h0)])) + ($signed(wire22) - ((wire201[(3'h7):(1'h0)] ?
          (wire166 == wire201) : $signed(wire24)) ^~ {wire202[(3'h7):(2'h3)]})));
      reg210 <= wire204;
      if (reg208[(1'h1):(1'h1)])
        begin
          reg211 <= ($signed((~^{((8'h9e) ? (8'hab) : (8'ha5))})) >>> (reg209 ?
              ($unsigned((wire166 ~^ wire196)) ?
                  (^~(|(8'hbb))) : $signed(((8'hb8) ?
                      reg210 : wire153))) : (8'haa)));
          reg212 <= ((~(&wire21[(1'h1):(1'h1)])) << (~$signed($unsigned({wire23,
              wire25}))));
        end
      else
        begin
          reg211 <= (reg211[(1'h0):(1'h0)] >>> (($unsigned((&reg209)) < (~|(wire21 ?
                  wire200 : (8'ha4)))) ?
              (~((reg209 ? wire19 : wire21) ?
                  ((8'ha2) ? wire23 : wire49) : wire200)) : wire153));
          if ((~&$unsigned((wire51 ^~ {$signed(wire200),
              wire19[(2'h2):(2'h2)]}))))
            begin
              reg212 <= ({(((wire49 ? wire153 : wire166) ?
                          reg207[(2'h3):(1'h0)] : (wire19 >>> wire153)) ^ ({reg208,
                              wire201} ?
                          reg211 : (+wire196)))} ?
                  $unsigned((wire23[(3'h4):(1'h1)] | ($unsigned(reg209) ?
                      $unsigned(wire24) : reg209))) : $unsigned((((~^wire153) && (wire204 + wire198)) ?
                      ({wire202, wire166} ?
                          wire166 : $unsigned(wire202)) : $signed($signed(reg210)))));
            end
          else
            begin
              reg212 <= ((~^(reg212[(3'h5):(2'h3)] ?
                  (&((8'hbd) ^~ reg212)) : reg210[(1'h0):(1'h0)])) & $signed($unsigned($signed((reg209 ^~ (8'hbe))))));
              reg213 <= wire19;
            end
          reg214 <= $signed(((8'ha2) ?
              ((~^$unsigned(wire24)) ?
                  wire52[(4'hd):(4'h9)] : {(wire153 > wire51),
                      $signed(reg213)}) : {(wire21[(2'h2):(1'h1)] ?
                      wire204 : (8'hb0)),
                  $unsigned((~^wire166))}));
          reg215 <= $signed($signed($signed(wire21)));
          reg216 <= wire196[(4'hb):(3'h6)];
        end
    end
endmodule

module module168
#(parameter param195 = ((~|(~&((8'ha6) ? ((8'hb3) > (8'hac)) : (&(8'ha0))))) > (^({((8'hbe) ? (8'ha2) : (8'hbe))} && (~^{(7'h41)})))))
(y, clk, wire173, wire172, wire171, wire170, wire169);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire173;
  input wire signed [(5'h13):(1'h0)] wire172;
  input wire signed [(5'h12):(1'h0)] wire171;
  input wire signed [(4'hf):(1'h0)] wire170;
  input wire signed [(5'h13):(1'h0)] wire169;
  wire signed [(4'hb):(1'h0)] wire194;
  wire [(4'hb):(1'h0)] wire190;
  wire signed [(5'h15):(1'h0)] wire189;
  wire [(5'h11):(1'h0)] wire188;
  wire signed [(4'h8):(1'h0)] wire187;
  wire [(5'h15):(1'h0)] wire178;
  wire [(5'h11):(1'h0)] wire177;
  wire [(4'hd):(1'h0)] wire176;
  wire signed [(3'h5):(1'h0)] wire175;
  wire [(4'hf):(1'h0)] wire174;
  reg signed [(5'h11):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg192 = (1'h0);
  reg [(4'ha):(1'h0)] reg191 = (1'h0);
  reg [(4'hd):(1'h0)] reg186 = (1'h0);
  reg [(3'h6):(1'h0)] reg185 = (1'h0);
  reg signed [(4'he):(1'h0)] reg184 = (1'h0);
  reg [(3'h4):(1'h0)] reg183 = (1'h0);
  reg [(4'hf):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg181 = (1'h0);
  reg [(5'h15):(1'h0)] reg180 = (1'h0);
  reg [(4'h8):(1'h0)] reg179 = (1'h0);
  assign y = {wire194,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 reg193,
                 reg192,
                 reg191,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 (1'h0)};
  assign wire174 = (((~&(~^{wire169})) ?
                           wire172[(5'h10):(4'hd)] : (((8'ha5) * (|(7'h42))) >= wire171[(4'hc):(4'hc)])) ?
                       ($unsigned((wire170[(3'h7):(1'h0)] ?
                               (~wire173) : $unsigned(wire172))) ?
                           ($signed((&wire170)) ?
                               wire169[(5'h10):(1'h1)] : (((8'hba) ?
                                       wire170 : wire170) ?
                                   {wire171} : $signed(wire171))) : ($signed($unsigned((8'ha2))) >>> {{(8'ha5),
                                   wire171},
                               $signed((8'h9c))})) : wire171[(1'h1):(1'h0)]);
  assign wire175 = $unsigned((({(7'h42), (wire172 || wire171)} ?
                           wire174 : $signed(wire174)) ?
                       (~&($unsigned(wire173) > wire170)) : wire173[(4'h8):(3'h4)]));
  assign wire176 = $unsigned($signed(({(wire175 + wire175)} ?
                       ((wire171 ?
                           wire171 : wire175) ~^ $unsigned(wire175)) : (~wire175))));
  assign wire177 = (($signed($signed((&wire174))) < wire176) ^ $unsigned($signed($signed(wire176))));
  assign wire178 = (-$signed((!wire173)));
  always
    @(posedge clk) begin
      if ((~^(|wire170[(4'h9):(3'h4)])))
        begin
          reg179 <= (!wire174[(3'h5):(3'h5)]);
        end
      else
        begin
          reg179 <= wire175[(1'h0):(1'h0)];
          reg180 <= wire177;
        end
      reg181 <= ($unsigned($signed($signed((wire174 & wire174)))) && (^reg180));
      reg182 <= (8'haf);
      if (({($unsigned((wire175 ?
                  wire169 : wire175)) <= (^(reg180 >>> wire173))),
              wire173} ?
          wire172 : ((&{{(8'hbc)}}) - $signed(wire173[(1'h1):(1'h0)]))))
        begin
          reg183 <= {(~($unsigned({reg182, wire178}) ?
                  ($signed(wire175) * wire178[(5'h15):(2'h3)]) : wire174[(4'ha):(3'h7)])),
              wire176[(4'hc):(3'h4)]};
          reg184 <= (~^wire172[(5'h13):(2'h2)]);
          reg185 <= $signed($unsigned(reg179));
          reg186 <= $unsigned(reg181[(3'h5):(3'h5)]);
        end
      else
        begin
          reg183 <= (wire176 > $signed((|wire176[(3'h6):(3'h6)])));
        end
    end
  assign wire187 = $signed(((~|reg186) ?
                       (reg186[(3'h6):(3'h6)] ?
                           reg182 : ((wire177 | wire169) - reg183[(1'h1):(1'h1)])) : $unsigned($unsigned(wire171[(4'hc):(1'h0)]))));
  assign wire188 = (8'hae);
  assign wire189 = (-$unsigned(($unsigned((wire170 ?
                       reg179 : wire177)) ~^ $signed($signed(wire169)))));
  assign wire190 = $unsigned($unsigned((^(reg180 ? (-(8'hb2)) : (~wire169)))));
  always
    @(posedge clk) begin
      reg191 <= (reg183[(1'h1):(1'h1)] ?
          wire187 : ($unsigned(($unsigned(wire169) ?
                  wire177[(3'h4):(2'h3)] : {wire169})) ?
              (8'hb0) : (|wire170)));
      reg192 <= (wire171 << (~&($unsigned($unsigned((7'h43))) ?
          (8'h9c) : (wire190 & wire172[(4'hb):(4'h9)]))));
      reg193 <= $unsigned($signed((^~$unsigned((&wire188)))));
    end
  assign wire194 = {(wire176 ?
                           $signed($signed($signed((8'hba)))) : $signed(wire173)),
                       (+(wire178 & wire190[(4'h9):(2'h2)]))};
endmodule

module module155
#(parameter param164 = (~{({(~&(7'h43)), ((8'ha5) ? (8'ha7) : (8'hac))} ? ({(8'ha1)} ? (&(8'ha6)) : ((8'hb6) >>> (8'hb6))) : {(-(8'hb3)), {(8'hbc)}}), (!{(^~(8'hb1)), ((7'h42) ^~ (8'haf))})}), 
parameter param165 = param164)
(y, clk, wire159, wire158, wire157, wire156);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire159;
  input wire signed [(2'h3):(1'h0)] wire158;
  input wire signed [(4'h8):(1'h0)] wire157;
  input wire [(3'h5):(1'h0)] wire156;
  wire [(5'h10):(1'h0)] wire163;
  wire [(5'h11):(1'h0)] wire162;
  wire [(2'h3):(1'h0)] wire161;
  wire signed [(5'h14):(1'h0)] wire160;
  assign y = {wire163, wire162, wire161, wire160, (1'h0)};
  assign wire160 = wire159[(3'h7):(3'h5)];
  assign wire161 = wire156[(3'h5):(3'h5)];
  assign wire162 = $signed($signed(((wire158 ? $unsigned(wire161) : (8'h9c)) ?
                       wire161[(1'h0):(1'h0)] : wire157)));
  assign wire163 = $signed((~&((8'hb5) * $unsigned({wire157, wire161}))));
endmodule

module module102
#(parameter param151 = ({(((~|(8'ha1)) ~^ ((8'ha1) >= (8'hae))) ? ({(8'ha1)} && ((8'hbd) & (8'hb1))) : ((^~(8'hbc)) ? ((8'hbf) ? (8'hb3) : (8'ha2)) : ((7'h40) << (8'hb3))))} * {((((8'hb2) << (8'had)) ? ((8'hba) || (8'haa)) : ((8'hab) ^ (8'ha9))) ~^ {{(8'hb4)}, ((8'hbf) & (7'h41))})}), 
parameter param152 = param151)
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h208):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire106;
  input wire signed [(5'h15):(1'h0)] wire105;
  input wire signed [(4'ha):(1'h0)] wire104;
  input wire signed [(5'h11):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire150;
  wire signed [(3'h5):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire148;
  wire [(5'h14):(1'h0)] wire147;
  wire [(2'h3):(1'h0)] wire146;
  wire signed [(5'h13):(1'h0)] wire145;
  wire signed [(5'h10):(1'h0)] wire144;
  wire [(4'hc):(1'h0)] wire127;
  wire signed [(4'h9):(1'h0)] wire126;
  wire signed [(3'h7):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire107;
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(5'h14):(1'h0)] reg138 = (1'h0);
  reg [(3'h4):(1'h0)] reg137 = (1'h0);
  reg [(4'h9):(1'h0)] reg136 = (1'h0);
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  reg [(4'hd):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
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
                 (1'h0)};
  assign wire107 = $signed(wire106[(1'h0):(1'h0)]);
  assign wire108 = (^{((-(wire104 == wire103)) - $unsigned(wire105)),
                       (!($signed(wire107) ?
                           (wire105 ?
                               wire103 : wire107) : wire105[(5'h15):(4'h8)]))});
  assign wire109 = (wire107[(3'h7):(2'h3)] ?
                       ((~&wire107) ?
                           wire108 : $unsigned(($unsigned(wire103) ?
                               wire107 : $signed((7'h40))))) : wire107[(4'hb):(2'h3)]);
  assign wire110 = wire103[(4'hf):(4'h9)];
  always
    @(posedge clk) begin
      if ({(wire105[(4'hd):(4'h9)] - $unsigned(((~&(7'h42)) ?
              {wire105, wire103} : (wire109 > wire107))))})
        begin
          reg111 <= $unsigned((&($unsigned($unsigned(wire105)) ?
              (wire104[(3'h7):(1'h1)] ?
                  (wire107 && wire107) : wire109) : {(wire108 ?
                      wire107 : (7'h42)),
                  {wire110, wire106}})));
          reg112 <= {$unsigned(({(~reg111), ((8'had) ? reg111 : wire110)} ?
                  $signed((reg111 != wire105)) : {(reg111 ? (8'ha0) : wire106),
                      {wire110, reg111}}))};
          reg113 <= $signed((|{$unsigned(reg112[(3'h5):(2'h3)])}));
          if ((wire104 > (&(wire106 > (^$signed(wire110))))))
            begin
              reg114 <= ($unsigned((&$signed($signed(wire107)))) & (wire103 ?
                  ($signed((!wire103)) && (~^(wire107 ?
                      (8'hbf) : wire105))) : ((((8'hbf) ?
                          (8'hb9) : wire104) >> reg111[(4'hd):(4'hb)]) ?
                      $unsigned({wire108, (7'h44)}) : (~$signed(wire106)))));
              reg115 <= $unsigned($signed(($unsigned((-wire106)) ?
                  wire110[(2'h2):(2'h2)] : {(reg114 ? reg112 : wire106)})));
            end
          else
            begin
              reg114 <= reg112[(3'h4):(2'h3)];
              reg115 <= wire106[(3'h6):(3'h4)];
              reg116 <= (reg115[(1'h1):(1'h1)] ~^ (~|{reg111[(5'h12):(4'h9)],
                  wire103}));
            end
        end
      else
        begin
          reg111 <= wire105;
          reg112 <= (wire107 > $unsigned($unsigned({(wire108 ?
                  wire105 : wire108)})));
          reg113 <= (($unsigned($signed(((8'hb4) != wire109))) ?
                  $unsigned({$signed(wire104)}) : $signed($signed((8'hb5)))) ?
              $unsigned(reg115[(4'ha):(1'h0)]) : $signed((!wire103[(4'ha):(4'h8)])));
          reg114 <= ((+wire105[(3'h6):(3'h5)]) - reg111);
          reg115 <= $unsigned(((~&reg114[(2'h3):(2'h3)]) < $unsigned((~wire108))));
        end
      reg117 <= (wire108[(4'hc):(4'hc)] ~^ {(wire110 ?
              (wire107[(4'h8):(1'h1)] < wire106[(4'ha):(4'h8)]) : ((reg115 ^ wire105) && $signed(wire103))),
          ((+reg116) >> wire105[(4'he):(4'h9)])});
      if ($unsigned(wire107[(1'h0):(1'h0)]))
        begin
          reg118 <= {$signed(($signed({wire110, (8'h9d)}) != (7'h42)))};
          reg119 <= $signed((|wire110[(3'h6):(3'h6)]));
          reg120 <= (-(|wire108));
        end
      else
        begin
          reg118 <= {(wire104[(1'h1):(1'h0)] ?
                  ($signed(wire106) ~^ $signed((&reg115))) : reg118)};
          if ((-(&$unsigned(reg119))))
            begin
              reg119 <= (!$signed((&({reg113} - (~wire104)))));
              reg120 <= (wire106 ?
                  $signed((&$signed((8'hb6)))) : ($unsigned(reg117) != reg116));
              reg121 <= {(~{reg119[(3'h7):(1'h0)]}),
                  ((~^reg114[(2'h2):(1'h0)]) ?
                      (|(wire109 && $signed((8'hb1)))) : ((8'hbc) ?
                          wire108[(3'h6):(3'h4)] : wire107[(3'h4):(3'h4)]))};
              reg122 <= (+wire110[(1'h0):(1'h0)]);
            end
          else
            begin
              reg119 <= ({reg115[(4'h9):(1'h1)]} ?
                  $signed((reg122[(2'h2):(1'h0)] ?
                      ((^wire108) ?
                          wire103 : $unsigned(reg116)) : (wire104[(4'ha):(3'h6)] ?
                          {reg121} : (wire106 ?
                              reg122 : (8'h9c))))) : (wire103 >= $signed((wire103 ^~ {reg122}))));
              reg120 <= {$unsigned(($signed((&reg117)) ?
                      (reg122[(1'h1):(1'h0)] ?
                          (reg114 + reg119) : ((8'hac) * wire106)) : ($unsigned((8'ha1)) ?
                          (reg118 ? wire104 : wire105) : (reg122 ?
                              wire110 : (8'ha5)))))};
            end
          reg123 <= {$unsigned((({reg121} < (!(7'h40))) ?
                  (&(wire109 >>> wire110)) : reg118)),
              $unsigned({({reg114, wire107} <= $signed(wire107))})};
        end
    end
  assign wire124 = $signed({($signed($signed(reg111)) >> (~|$signed(reg116)))});
  assign wire125 = ($signed($signed($unsigned({reg118, (8'hb8)}))) ?
                       wire103[(3'h6):(1'h0)] : (((wire110 >> (8'haa)) ?
                               $unsigned(wire108) : reg114) ?
                           reg118[(4'hf):(4'hf)] : ($signed(wire106[(3'h6):(1'h1)]) ?
                               $unsigned((~|(8'h9d))) : (reg122[(2'h2):(2'h2)] >= {reg113}))));
  assign wire126 = reg112;
  assign wire127 = $signed(($unsigned($unsigned($signed(reg122))) < reg122));
  always
    @(posedge clk) begin
      reg128 <= $signed(reg118[(4'hc):(2'h3)]);
      reg129 <= $signed(wire108[(4'hb):(3'h7)]);
      if (reg123[(3'h4):(2'h3)])
        begin
          if ((({(~((8'hbf) ? reg121 : wire105)), reg116} ?
              wire103[(3'h7):(1'h0)] : $unsigned(reg118[(4'hd):(3'h5)])) ^~ $unsigned($signed({(reg120 ?
                  wire125 : reg122)}))))
            begin
              reg130 <= $unsigned($unsigned($signed($signed((reg120 && wire108)))));
              reg131 <= $signed($signed((8'hae)));
              reg132 <= (($signed((^~$unsigned((8'haf)))) ? reg117 : reg123) ?
                  $signed(wire106) : ((((-(8'h9f)) && (reg114 ?
                              (8'ha1) : wire108)) ?
                          $unsigned($unsigned(reg112)) : {wire106[(4'ha):(3'h7)]}) ?
                      (reg120 > {$unsigned(reg128)}) : wire126));
              reg133 <= $unsigned($signed(($signed(reg122) ?
                  (|(reg115 ?
                      reg122 : wire107)) : ((!wire109) - ((8'hab) >= (8'hb8))))));
              reg134 <= (8'ha8);
            end
          else
            begin
              reg130 <= (|reg120[(2'h2):(2'h2)]);
              reg131 <= $signed($unsigned($signed((reg119 ?
                  $signed(wire107) : $unsigned(wire105)))));
              reg132 <= reg111;
              reg133 <= {(8'hba)};
            end
          reg135 <= (+(~&$unsigned(($unsigned(reg130) <<< (!wire103)))));
        end
      else
        begin
          if (reg121[(1'h0):(1'h0)])
            begin
              reg130 <= wire108;
              reg131 <= (reg114 > (|(-((~(8'hbf)) ?
                  $signed((7'h43)) : reg112[(1'h1):(1'h1)]))));
              reg132 <= ($unsigned(reg113) ? {wire105, wire107} : (8'hb2));
              reg133 <= $signed((~|((reg128 ?
                  $unsigned(reg129) : (~&reg128)) ~^ {{wire126},
                  $unsigned(reg133)})));
              reg134 <= (-((8'h9d) ? reg120 : wire107));
            end
          else
            begin
              reg130 <= reg122;
              reg131 <= $signed(($signed($unsigned($unsigned(reg121))) && (~^$signed((wire108 && wire110)))));
              reg132 <= (~wire127[(4'h8):(3'h7)]);
            end
          reg135 <= $signed({(reg122 == wire103[(4'hd):(4'h8)]),
              reg121[(5'h10):(3'h4)]});
          reg136 <= wire109;
          reg137 <= (~(8'hbf));
          reg138 <= (((|((reg120 == reg119) ? $unsigned(reg133) : reg111)) ?
                  {(^$unsigned((8'hbe)))} : (~^reg128[(1'h0):(1'h0)])) ?
              (reg116[(4'ha):(3'h4)] <= reg130[(4'h8):(1'h0)]) : $signed($signed($unsigned(reg111[(4'he):(4'he)]))));
        end
    end
  always
    @(posedge clk) begin
      reg139 <= {reg131,
          ((((reg113 ? (8'haa) : wire109) < (reg121 ^ reg120)) ?
                  $signed((reg137 <<< (7'h42))) : (reg128 + $unsigned(reg131))) ?
              $signed((|$unsigned(wire108))) : reg131[(2'h2):(1'h1)])};
      reg140 <= $signed({(((!reg114) ?
              $unsigned(reg128) : wire124[(5'h15):(4'ha)]) && ({reg136} ?
              reg116[(3'h5):(3'h5)] : $unsigned(wire104)))});
      reg141 <= reg137;
      reg142 <= $unsigned((~|$signed($unsigned(reg130))));
      reg143 <= ($signed(reg138) & {{reg136[(3'h5):(1'h1)], reg132}});
    end
  assign wire144 = ($signed({reg118,
                       ($signed(reg120) >>> reg114[(3'h7):(2'h2)])}) & wire104[(3'h4):(1'h0)]);
  assign wire145 = (({reg141, reg142[(3'h6):(1'h1)]} != ((reg131 ?
                           reg129 : $signed(reg131)) ?
                       reg117 : {(|wire109)})) == (|reg122));
  assign wire146 = (reg135[(2'h2):(1'h1)] ?
                       $signed((8'hb5)) : (+(((7'h43) ?
                               $signed(reg141) : (reg122 || (8'hb1))) ?
                           $unsigned(reg141[(4'hb):(2'h2)]) : (~$signed(reg137)))));
  assign wire147 = ($signed((&reg135)) < $unsigned((~$signed((+reg112)))));
  assign wire148 = (((^~(!reg116[(2'h3):(1'h0)])) > reg117) ?
                       ((((|wire125) ?
                           $signed(reg131) : $signed(wire110)) >>> $unsigned(reg128[(4'ha):(3'h7)])) || {wire110[(1'h1):(1'h0)],
                           {(wire105 > wire125),
                               (reg143 ^~ wire106)}}) : (wire125[(2'h2):(1'h0)] ?
                           reg117[(4'ha):(3'h7)] : (^~reg118[(1'h0):(1'h0)])));
  assign wire149 = {{$unsigned((^reg130)), (&$signed($signed(reg132)))},
                       wire110[(2'h3):(2'h3)]};
  assign wire150 = (($signed({$signed(reg114), (reg111 ^~ reg138)}) ?
                       ((^~(reg136 ? reg117 : reg119)) ?
                           ($signed(wire124) ^ (reg138 ?
                               (8'hb8) : (8'hbd))) : $unsigned(wire109)) : $unsigned(((reg143 ?
                           wire148 : reg139) - {reg120,
                           reg119}))) ~^ (!(reg119[(4'h9):(2'h2)] ?
                       $signed((wire148 ?
                           reg141 : wire124)) : (|$unsigned(reg123)))));
endmodule

module module53
#(parameter param99 = (((~|(+((8'hae) ^~ (8'hb8)))) >= ({(+(8'h9d))} <= (((8'hb9) == (8'ha3)) << ((8'ha8) <= (8'ha1))))) || ((^~(((8'h9d) ? (8'ha6) : (7'h42)) ? {(8'ha0), (8'hb3)} : {(8'h9f), (8'ha3)})) >> (^~(((8'had) ? (8'haf) : (7'h41)) ? {(7'h40), (7'h41)} : (~|(8'hb4)))))))
(y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h1fa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire58;
  input wire signed [(5'h11):(1'h0)] wire57;
  input wire signed [(5'h10):(1'h0)] wire56;
  input wire [(4'hf):(1'h0)] wire55;
  input wire [(4'h9):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire98;
  wire signed [(5'h14):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire59;
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire85,
                 wire67,
                 wire66,
                 wire65,
                 wire59,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg84,
                 reg83,
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
                 reg68,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire59 = $unsigned(((-wire56[(4'h8):(3'h6)]) & ((wire58 ?
                          $signed(wire55) : wire56[(4'hb):(1'h0)]) ?
                      {((8'hb5) == wire56),
                          wire57[(2'h3):(2'h2)]} : ({wire54} > (~(8'ha0))))));
  always
    @(posedge clk) begin
      if ((wire56 ?
          $signed($unsigned((+wire56[(4'hd):(4'h8)]))) : $unsigned($signed(($signed((8'hae)) ?
              $signed(wire58) : (^wire56))))))
        begin
          reg60 <= $signed(wire54);
        end
      else
        begin
          if ((8'ha6))
            begin
              reg60 <= $signed(wire58);
              reg61 <= wire58;
              reg62 <= wire57[(4'h9):(1'h1)];
            end
          else
            begin
              reg60 <= (8'hb6);
            end
          reg63 <= ($signed($signed((|{reg61}))) == (reg61 && wire55));
        end
      reg64 <= $signed(reg60[(3'h5):(3'h5)]);
    end
  assign wire65 = $signed({reg63,
                      ($unsigned(wire54[(3'h7):(2'h2)]) ?
                          (-$signed((8'hb7))) : wire59[(2'h2):(1'h1)])});
  assign wire66 = ((+(~|wire57[(4'h8):(2'h2)])) & (^~{($unsigned(wire65) ?
                          wire56 : wire55[(4'hf):(4'ha)]),
                      $signed({reg60})}));
  assign wire67 = $signed((~^$signed(wire59[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      if (wire66)
        begin
          reg68 <= $signed(wire59[(1'h0):(1'h0)]);
          reg69 <= (((wire54 & $unsigned((wire54 << wire65))) ?
              ((!(wire55 || reg62)) >>> (wire65[(2'h2):(2'h2)] <<< (reg61 ?
                  wire58 : reg64))) : $signed(wire67[(3'h6):(2'h2)])) <= $unsigned((+wire56[(3'h4):(1'h0)])));
          reg70 <= ((+(((reg60 + wire59) ?
              {wire55,
                  reg64} : wire57) != ($unsigned(wire66) >= wire66))) * wire56);
          reg71 <= (reg62[(3'h7):(2'h2)] ?
              $unsigned(wire59) : (~^(~|$signed($signed(reg60)))));
        end
      else
        begin
          reg68 <= (7'h40);
          if (reg63)
            begin
              reg69 <= reg63;
              reg70 <= $unsigned(((~|(wire57[(4'hd):(4'hb)] ?
                      $unsigned((8'ha7)) : reg69)) ?
                  (&{$signed(reg63),
                      $unsigned(wire66)}) : $signed(reg70[(2'h2):(1'h1)])));
            end
          else
            begin
              reg69 <= ((!(~|(!wire58))) ?
                  $signed(wire57) : $signed($signed((8'hbc))));
              reg70 <= wire56[(3'h6):(2'h3)];
              reg71 <= {($signed(reg60) == $unsigned({reg71[(4'hf):(4'hf)]}))};
              reg72 <= $unsigned((-$signed($unsigned((reg68 >>> reg70)))));
            end
          if ({($unsigned(($signed(wire65) && wire55)) ?
                  (~&$unsigned((8'hbc))) : {((reg64 ? reg72 : (8'hb7)) ?
                          $unsigned(wire65) : $signed(reg70)),
                      $signed((reg68 ? reg72 : reg60))}),
              (wire59[(1'h0):(1'h0)] ? (8'hb9) : reg72[(1'h1):(1'h0)])})
            begin
              reg73 <= (^~wire66);
            end
          else
            begin
              reg73 <= $unsigned($unsigned({reg68,
                  $unsigned($unsigned((8'ha5)))}));
              reg74 <= {($unsigned((~^wire67)) | reg64), reg61[(1'h1):(1'h1)]};
              reg75 <= (+wire59[(1'h1):(1'h1)]);
              reg76 <= $signed({($unsigned($signed((8'ha9))) + reg71[(1'h1):(1'h1)]),
                  wire54});
            end
        end
      reg77 <= {$signed((reg60[(4'ha):(2'h2)] ?
              $signed(reg72[(2'h2):(1'h1)]) : $unsigned((~reg60))))};
      reg78 <= ((wire58 <= {$signed($unsigned(reg74))}) * reg68);
      reg79 <= $unsigned(({(reg61[(2'h3):(2'h2)] ?
              $unsigned(wire66) : ((8'ha5) ? reg69 : reg75))} * (7'h42)));
      reg80 <= (wire54[(2'h3):(1'h1)] ? (8'haa) : wire66[(2'h3):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg81 <= $signed(($signed($unsigned((reg78 >>> reg63))) ?
          (8'hb0) : ($unsigned($unsigned(reg64)) ?
              reg63[(4'hb):(2'h2)] : (reg62 ^ reg71))));
      reg82 <= $signed(wire58);
      reg83 <= $unsigned((wire59 * (^((reg72 * reg60) ^ $signed((8'hb9))))));
      reg84 <= (~|(^wire67));
    end
  assign wire85 = wire56[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      if ({{$unsigned(wire67)}})
        begin
          reg86 <= reg79[(5'h10):(4'hd)];
          reg87 <= $unsigned(reg76[(1'h0):(1'h0)]);
          if ((!reg60[(1'h0):(1'h0)]))
            begin
              reg88 <= wire67[(2'h2):(2'h2)];
              reg89 <= reg72;
              reg90 <= reg69[(2'h2):(1'h1)];
              reg91 <= (((+(8'hb8)) <= reg83[(4'h8):(4'h8)]) > $unsigned(reg87[(4'hb):(2'h3)]));
              reg92 <= (({{$unsigned(reg74),
                      {reg68,
                          reg89}}} != reg77[(4'ha):(1'h0)]) + reg81[(2'h2):(2'h2)]);
            end
          else
            begin
              reg88 <= $signed($unsigned($signed($signed({wire67}))));
              reg89 <= $signed($unsigned($signed($unsigned($signed(reg90)))));
            end
          reg93 <= ((~^$unsigned(reg64[(2'h3):(1'h1)])) == $signed(reg62));
          if (reg69)
            begin
              reg94 <= $unsigned(((({wire55, wire54} >= (~reg69)) - reg68) ?
                  $unsigned(($unsigned(reg63) >= wire57[(3'h4):(2'h2)])) : ((reg90 ?
                          $unsigned(wire57) : (8'hba)) ?
                      ((&(8'hb7)) ~^ (wire56 == reg74)) : $signed((~|reg71)))));
            end
          else
            begin
              reg94 <= (wire58 >> reg61[(3'h4):(1'h0)]);
            end
        end
      else
        begin
          reg86 <= $unsigned($unsigned(reg75[(4'ha):(4'ha)]));
        end
    end
  assign wire95 = wire55[(2'h3):(1'h1)];
  assign wire96 = ({{$signed(wire66[(3'h7):(1'h1)]),
                          wire66[(1'h1):(1'h0)]}} * wire57[(5'h10):(4'hd)]);
  assign wire97 = ((reg62 ?
                      ((7'h41) | reg89[(2'h2):(2'h2)]) : $unsigned($signed((wire96 >= reg84)))) ~^ reg82[(4'hb):(3'h7)]);
  assign wire98 = ((((~reg83[(2'h3):(2'h2)]) | reg61) ?
                      ($signed({(8'hae), reg61}) ? wire67 : reg62) : (!((reg86 ?
                          (8'hae) : reg84) ^~ {(8'ha8)}))) ^~ ((^~{{wire66,
                              (7'h44)}}) ?
                      $signed($signed({reg79})) : ((-$signed(reg83)) ~^ (reg80[(4'h8):(3'h6)] ?
                          {reg79} : (^~reg75)))));
endmodule

module module26
#(parameter param47 = ((~^(((^(8'hac)) ? ((8'hb5) - (8'haf)) : {(8'ha2)}) + {((7'h44) ? (8'hac) : (8'ha3)), ((8'hb5) ? (8'h9d) : (8'hb0))})) && (+(^~(((8'hbb) ? (8'h9e) : (8'hb1)) | (8'hb5))))), 
parameter param48 = (param47 ? ((|((param47 <= param47) ? (param47 >= param47) : (|param47))) ? (^{(+param47), {param47}}) : param47) : (param47 > (8'hbf))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire30;
  input wire signed [(3'h4):(1'h0)] wire29;
  input wire [(5'h13):(1'h0)] wire28;
  input wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg40,
                 (1'h0)};
  assign wire31 = $signed($signed(((^$signed((8'hb9))) - wire29)));
  assign wire32 = (wire31[(1'h0):(1'h0)] ?
                      (^(wire27 << {(!wire30),
                          wire30})) : {(({wire31} < wire29) >> $signed($unsigned((8'hb2))))});
  assign wire33 = ({{($unsigned(wire27) <= (wire30 ? wire31 : wire28))}} ?
                      ((^{(wire27 ? (7'h42) : wire30)}) ?
                          (wire30 >> (wire32 != (wire29 << wire31))) : (wire32[(4'h8):(1'h0)] ?
                              (wire29[(2'h3):(2'h2)] == $signed(wire32)) : (|(+wire31)))) : $signed($signed(((8'hb8) >> wire28))));
  assign wire34 = (~|{$signed((+$unsigned(wire33)))});
  assign wire35 = {$unsigned((&(|{wire34, (8'hb0)}))),
                      (|{$unsigned((|wire30))})};
  assign wire36 = wire34[(4'hd):(3'h6)];
  assign wire37 = wire29[(1'h0):(1'h0)];
  assign wire38 = {{(((~|wire36) ?
                              wire37 : $unsigned(wire32)) ^~ wire34[(2'h3):(2'h2)])}};
  assign wire39 = ((!wire32) ? wire33 : wire33);
  always
    @(posedge clk) begin
      reg40 <= $unsigned($unsigned($signed(((8'ha3) * (~|wire35)))));
    end
  assign wire41 = $unsigned(wire29[(2'h2):(1'h0)]);
  assign wire42 = {$unsigned((wire37 ?
                          wire32[(2'h3):(2'h3)] : wire38[(1'h0):(1'h0)])),
                      wire41[(3'h4):(3'h4)]};
  assign wire43 = (wire35 ?
                      wire35[(4'hc):(4'ha)] : ((^($signed((7'h42)) + (-wire31))) ?
                          {reg40} : ((wire27 ?
                                  $unsigned(wire41) : {wire42, wire33}) ?
                              {wire41[(2'h2):(2'h2)]} : ($signed(wire39) + $signed(wire31)))));
  assign wire44 = (wire35 ?
                      ((wire35 * (wire43 ?
                          $signed(wire36) : (8'hae))) * wire38) : ({($unsigned(wire30) ?
                              ((8'ha2) ~^ (8'hae)) : (wire32 ?
                                  wire34 : wire41))} * {(wire29[(2'h2):(2'h2)] >>> (wire27 ?
                              wire36 : wire42))}));
  assign wire45 = (+$signed($signed($signed(wire27))));
  assign wire46 = (~$signed($unsigned((wire32[(3'h5):(3'h4)] ?
                      (wire45 > wire32) : ((8'hbe) <<< wire42)))));
endmodule
