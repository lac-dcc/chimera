module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire226;
  wire [(2'h2):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire224;
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  assign y = {wire226,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire12,
                 wire13,
                 wire14,
                 wire224,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $signed((($unsigned((wire4 - wire2)) ?
                         wire0[(3'h6):(2'h3)] : $unsigned(wire4[(5'h10):(4'h8)])) ?
                     (8'h9e) : $signed(wire4)));
  assign wire6 = (wire4 << wire0);
  assign wire7 = wire0;
  assign wire8 = (wire7 != wire3[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg9 <= ((wire7 ?
              wire7[(2'h3):(1'h0)] : {$signed($unsigned(wire5)),
                  wire7[(1'h0):(1'h0)]}) ?
          wire6[(1'h1):(1'h1)] : {wire1});
      reg10 <= $unsigned({$signed((8'hba)), (+$unsigned((~(8'hb2))))});
      reg11 <= (7'h42);
    end
  assign wire12 = wire0;
  assign wire13 = reg10[(2'h3):(1'h0)];
  assign wire14 = ((8'h9c) ?
                      (~|(&$unsigned(wire12))) : (wire12[(3'h6):(3'h6)] ?
                          (wire1 == ((reg9 != (8'h9f)) ?
                              wire1[(3'h5):(1'h0)] : (!wire1))) : (~&$signed(wire0[(4'h9):(4'h9)]))));
  module15 #() modinst225 (wire224, clk, wire14, wire0, wire4, wire6, wire2);
  assign wire226 = {{(8'hac),
                           {{(reg9 ? wire14 : (8'hb3)), wire0[(4'hd):(4'hd)]},
                               $signed(wire13)}}};
endmodule

module module15
#(parameter param223 = ({(({(8'ha7), (7'h43)} - {(8'hb5)}) ? ({(8'hb7), (8'ha9)} ? {(8'h9e)} : ((8'hab) == (7'h42))) : {(^~(8'h9d))})} || (8'hb0)))
(y, clk, wire16, wire17, wire18, wire19, wire20);
  output wire [(32'h226):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire221;
  wire [(4'h9):(1'h0)] wire195;
  wire [(4'hc):(1'h0)] wire194;
  wire signed [(5'h14):(1'h0)] wire193;
  wire [(5'h12):(1'h0)] wire192;
  wire [(5'h10):(1'h0)] wire191;
  wire signed [(3'h7):(1'h0)] wire189;
  wire signed [(4'hb):(1'h0)] wire168;
  wire [(4'hf):(1'h0)] wire167;
  wire [(5'h15):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire165;
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  assign y = {wire221,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire189,
                 wire168,
                 wire167,
                 wire21,
                 wire27,
                 wire28,
                 wire68,
                 wire70,
                 wire71,
                 wire72,
                 wire91,
                 wire92,
                 wire165,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
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
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire21 = wire17;
  always
    @(posedge clk) begin
      if ($unsigned(wire16[(4'h8):(1'h1)]))
        begin
          if (wire16[(4'hc):(4'hc)])
            begin
              reg22 <= $unsigned($signed((~&wire19[(3'h4):(1'h1)])));
              reg23 <= $signed($signed({wire21[(4'h9):(1'h1)],
                  ((wire19 ? wire16 : wire20) ?
                      wire18 : wire16[(4'h8):(3'h7)])}));
              reg24 <= wire19;
            end
          else
            begin
              reg22 <= $signed(((-((wire18 | wire20) & wire18)) ?
                  wire17[(2'h2):(1'h1)] : wire21));
              reg23 <= {{($unsigned((wire19 >> (8'hb7))) ?
                          wire19[(4'h8):(1'h0)] : reg22)}};
            end
          reg25 <= (wire18[(3'h5):(1'h0)] > $signed(wire16[(4'h8):(1'h1)]));
        end
      else
        begin
          reg22 <= wire20[(5'h11):(4'ha)];
          reg23 <= wire17;
          reg24 <= {(!{({(8'hbe), reg25} || reg22[(3'h7):(3'h7)])}),
              (-{$signed($signed(wire17)), $unsigned((-wire20))})};
        end
      reg26 <= $unsigned((^~(wire19 << {$unsigned(wire21)})));
    end
  assign wire27 = wire19;
  assign wire28 = (8'had);
  module29 #() modinst69 (wire68, clk, wire17, reg23, reg25, wire21, reg26);
  assign wire70 = ($signed($unsigned((^~{(8'ha5),
                      reg24}))) >> {{wire18[(1'h1):(1'h1)],
                          (^(wire18 ? wire19 : (8'hbf)))}});
  assign wire71 = $signed($signed(((^(8'hb6)) ?
                      (~^$unsigned(wire68)) : wire16[(3'h4):(1'h1)])));
  assign wire72 = $unsigned(wire17[(4'h9):(4'h9)]);
  always
    @(posedge clk) begin
      reg73 <= (|(|$unsigned($signed($signed(wire27)))));
      if (wire72)
        begin
          reg74 <= $signed((((^(wire28 ? wire20 : wire16)) ?
                  $unsigned((reg24 ~^ wire72)) : {(wire21 != wire19),
                      $unsigned((7'h41))}) ?
              {{{reg26, reg26}, $signed(reg23)},
                  wire27} : wire68[(2'h2):(1'h0)]));
          if (($unsigned(reg26[(4'hc):(4'hb)]) & reg74[(3'h4):(1'h0)]))
            begin
              reg75 <= $unsigned((^~$signed((+$unsigned(wire16)))));
              reg76 <= (((|$signed(((8'hb6) + wire28))) >> ((((8'hb3) ?
                              wire68 : wire70) ?
                          (^~reg25) : $unsigned(wire28)) ?
                      (-reg22[(3'h6):(2'h3)]) : {(~(7'h43))})) ?
                  wire21 : $signed((8'ha7)));
              reg77 <= (7'h41);
            end
          else
            begin
              reg75 <= reg25[(3'h6):(2'h3)];
              reg76 <= wire18[(3'h5):(2'h3)];
              reg77 <= $unsigned(((~|$unsigned(((8'hb5) ? wire20 : reg23))) ?
                  {(8'h9f),
                      (((8'hab) ? wire68 : wire16) ?
                          $unsigned(reg76) : (reg77 ?
                              reg25 : (7'h44)))} : (wire17[(4'hd):(3'h5)] ^ (~^(^wire27)))));
              reg78 <= $unsigned({$unsigned($unsigned({(8'h9e), reg77}))});
            end
          reg79 <= wire27[(1'h0):(1'h0)];
          reg80 <= $unsigned((!($unsigned(reg25) > wire70[(4'h9):(1'h1)])));
        end
      else
        begin
          if ((~|(wire16[(2'h3):(2'h3)] ?
              $signed((8'hba)) : reg73[(1'h1):(1'h0)])))
            begin
              reg74 <= $unsigned(wire17);
              reg75 <= ((($unsigned($unsigned(wire17)) <= reg78[(5'h11):(2'h3)]) ?
                  reg75 : (~$signed($unsigned(reg75)))) & ((^(wire16[(5'h11):(5'h10)] > reg22)) >= $signed(wire16)));
              reg76 <= wire72;
            end
          else
            begin
              reg74 <= (+(+$unsigned($unsigned((&reg26)))));
            end
          reg77 <= (((((reg24 + reg79) ? (^reg26) : $signed(wire28)) ?
              reg23[(1'h0):(1'h0)] : ((reg77 ?
                  reg80 : (8'hb3)) + $unsigned(wire72))) || wire28[(2'h3):(2'h2)]) << $signed(reg79[(4'h9):(4'h9)]));
          reg78 <= $signed((~$unsigned($unsigned($signed(wire68)))));
          if (reg75[(2'h3):(1'h0)])
            begin
              reg79 <= $signed((^~$signed((reg80[(3'h4):(2'h3)] ?
                  $unsigned(reg78) : wire19[(3'h4):(1'h0)]))));
              reg80 <= $signed({{(reg73[(1'h0):(1'h0)] != $signed(wire20)),
                      (wire17[(4'h9):(2'h2)] ?
                          (reg73 ? reg80 : wire20) : reg80[(3'h5):(1'h1)])},
                  (&(wire21 >>> reg74[(4'h9):(3'h4)]))});
            end
          else
            begin
              reg79 <= reg76[(4'h8):(2'h2)];
              reg80 <= wire16;
              reg81 <= reg23;
            end
          reg82 <= ((7'h41) ?
              (reg81 <<< (~^reg24[(2'h2):(1'h0)])) : $signed($signed((|(reg81 >> wire27)))));
        end
      reg83 <= (|$unsigned((+($signed(reg80) ?
          (reg76 ? wire70 : reg24) : wire70))));
      reg84 <= (-($signed($unsigned($signed((8'hb5)))) <<< ((^(~&reg79)) == {((8'hb6) ?
              reg76 : (8'hb7))})));
      if (($unsigned($unsigned({(wire27 & wire18), (^~reg83)})) ?
          $signed({(~^(8'h9d)), wire70}) : wire72))
        begin
          reg85 <= reg77;
        end
      else
        begin
          reg85 <= (~^$signed((^~wire16)));
          reg86 <= $unsigned(($signed(reg73[(2'h2):(2'h2)]) ?
              (($signed(wire21) ?
                      (wire16 <= reg84) : (reg76 ? reg85 : wire68)) ?
                  $unsigned((wire27 != reg78)) : $unsigned((&reg74))) : $unsigned(wire20[(2'h3):(2'h3)])));
          if (reg80)
            begin
              reg87 <= ($signed(wire21[(4'ha):(4'h8)]) < reg80[(1'h0):(1'h0)]);
              reg88 <= (-(|$signed((8'hb6))));
            end
          else
            begin
              reg87 <= reg87[(2'h3):(2'h3)];
              reg88 <= (($signed((reg88 || (+wire70))) << reg82) ?
                  {$unsigned(((reg78 >> wire20) ?
                          (wire28 ? wire68 : wire27) : $unsigned((8'h9d)))),
                      (-reg84[(2'h3):(2'h3)])} : $unsigned($unsigned($unsigned((|reg84)))));
            end
          reg89 <= ((~&({reg88[(3'h6):(2'h3)]} ?
              {$signed(wire16),
                  $signed(reg26)} : $unsigned({reg23}))) <= {$unsigned($unsigned((reg79 != (8'hb7))))});
          reg90 <= (^$signed((reg81[(4'hc):(3'h6)] ?
              $unsigned(reg75[(2'h2):(2'h2)]) : reg75)));
        end
    end
  assign wire91 = reg89[(3'h4):(2'h3)];
  assign wire92 = ($unsigned(reg88[(1'h1):(1'h0)]) != $unsigned(reg88));
  module93 #() modinst166 (wire165, clk, wire70, reg90, wire72, wire21);
  assign wire167 = (reg89 == reg75[(2'h2):(2'h2)]);
  assign wire168 = wire27[(3'h6):(3'h6)];
  module169 #() modinst190 (.wire172(reg89), .wire174(wire20), .wire173(wire91), .y(wire189), .wire170(reg81), .wire171(reg87), .clk(clk));
  assign wire191 = reg86;
  assign wire192 = $signed($unsigned(((+(reg83 >> reg82)) == ($unsigned(wire168) && {wire92}))));
  assign wire193 = wire192;
  assign wire194 = (wire18[(2'h2):(1'h0)] < {wire191[(3'h6):(3'h4)],
                       $unsigned((^~(reg25 != reg78)))});
  assign wire195 = (((($unsigned(reg82) > (~&wire70)) ?
                           reg25[(5'h12):(3'h6)] : wire191) >= $signed(reg22)) ?
                       (((+$unsigned(wire20)) >> ((reg79 & wire194) ?
                           ((8'hb8) == reg26) : $unsigned(wire167))) | (wire91 >> ((wire21 ?
                               reg78 : (8'hb2)) ?
                           (-reg23) : (+reg82)))) : $signed(reg73));
  module196 #() modinst222 (.wire197(wire21), .clk(clk), .wire200(wire194), .wire198(reg77), .wire199(reg83), .y(wire221));
endmodule

module module196
#(parameter param219 = {({(|(~|(8'ha0))), (-((8'h9d) & (8'h9f)))} ? ({((8'hbe) + (8'hab)), {(8'ha2)}} + ((^~(8'hbd)) ^ (!(8'hae)))) : (^~(((8'ha0) - (8'haf)) >> {(8'ha4)})))}, 
parameter param220 = (8'hb0))
(y, clk, wire200, wire199, wire198, wire197);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire200;
  input wire signed [(2'h3):(1'h0)] wire199;
  input wire [(4'hd):(1'h0)] wire198;
  input wire signed [(5'h15):(1'h0)] wire197;
  wire [(4'he):(1'h0)] wire218;
  wire signed [(3'h5):(1'h0)] wire217;
  wire signed [(5'h14):(1'h0)] wire216;
  wire signed [(5'h12):(1'h0)] wire213;
  wire [(4'hc):(1'h0)] wire212;
  wire [(4'h8):(1'h0)] wire211;
  wire signed [(5'h12):(1'h0)] wire210;
  wire [(5'h14):(1'h0)] wire209;
  wire signed [(4'hd):(1'h0)] wire208;
  wire [(5'h12):(1'h0)] wire207;
  wire [(4'he):(1'h0)] wire201;
  reg signed [(5'h15):(1'h0)] reg215 = (1'h0);
  reg [(3'h6):(1'h0)] reg214 = (1'h0);
  reg [(5'h13):(1'h0)] reg206 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg205 = (1'h0);
  reg [(3'h5):(1'h0)] reg204 = (1'h0);
  reg [(4'hf):(1'h0)] reg203 = (1'h0);
  reg [(3'h7):(1'h0)] reg202 = (1'h0);
  assign y = {wire218,
                 wire217,
                 wire216,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire201,
                 reg215,
                 reg214,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 (1'h0)};
  assign wire201 = $signed(({$unsigned((~wire199)),
                       $unsigned((&wire197))} & $unsigned((wire199[(2'h3):(1'h1)] ?
                       wire197 : {wire199}))));
  always
    @(posedge clk) begin
      reg202 <= {(^~$unsigned(wire197)),
          (wire198[(3'h4):(1'h0)] ~^ $unsigned(wire200[(4'h9):(3'h6)]))};
      reg203 <= $signed(wire201[(3'h5):(3'h5)]);
      reg204 <= ($unsigned($signed((reg203[(1'h1):(1'h1)] || $signed(wire199)))) ~^ (wire201 ?
          (~&$unsigned($unsigned(wire198))) : wire201));
      reg205 <= reg202;
      reg206 <= reg205[(2'h2):(2'h2)];
    end
  assign wire207 = ($signed(wire201[(3'h7):(2'h2)]) <<< (((!(^reg202)) ?
                           {(!reg203), (wire201 ? reg206 : reg205)} : reg203) ?
                       (!$signed({(8'hb9), (8'ha0)})) : {((reg205 - wire197) ?
                               (reg205 ? (8'hb6) : wire199) : (-(8'hbb)))}));
  assign wire208 = {$unsigned(($signed(wire199) - ((8'ha0) ?
                           (~^reg206) : wire199))),
                       (~&(((reg205 ^ (8'ha2)) ?
                           wire199 : wire201[(4'he):(1'h0)]) < reg205[(3'h6):(1'h0)]))};
  assign wire209 = (!$signed((+(^~(&reg204)))));
  assign wire210 = $unsigned((8'hbf));
  assign wire211 = $signed($signed(wire207[(5'h12):(2'h3)]));
  assign wire212 = wire207[(3'h5):(3'h5)];
  assign wire213 = reg203;
  always
    @(posedge clk) begin
      reg214 <= (!wire199);
      reg215 <= (!(^reg205));
    end
  assign wire216 = $signed({(reg214 | (7'h44))});
  assign wire217 = (&wire201[(4'he):(4'he)]);
  assign wire218 = wire212;
endmodule

module module169
#(parameter param188 = (~|{(-(((7'h44) ^ (8'h9d)) ? ((7'h41) ^ (7'h44)) : ((8'h9f) ~^ (7'h40))))}))
(y, clk, wire174, wire173, wire172, wire171, wire170);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire174;
  input wire signed [(4'he):(1'h0)] wire173;
  input wire [(3'h7):(1'h0)] wire172;
  input wire [(4'h9):(1'h0)] wire171;
  input wire [(5'h11):(1'h0)] wire170;
  wire signed [(5'h12):(1'h0)] wire187;
  wire [(5'h13):(1'h0)] wire186;
  wire signed [(3'h7):(1'h0)] wire185;
  wire [(5'h10):(1'h0)] wire184;
  wire [(5'h10):(1'h0)] wire181;
  wire [(3'h5):(1'h0)] wire180;
  wire signed [(4'he):(1'h0)] wire179;
  wire [(5'h11):(1'h0)] wire178;
  wire [(5'h12):(1'h0)] wire177;
  wire [(3'h5):(1'h0)] wire176;
  wire [(5'h13):(1'h0)] wire175;
  reg [(3'h6):(1'h0)] reg183 = (1'h0);
  reg [(3'h6):(1'h0)] reg182 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 reg183,
                 reg182,
                 (1'h0)};
  assign wire175 = (-$unsigned((~&((~|wire171) ?
                       {(8'ha2), (8'hbe)} : ((8'hbf) >= wire170)))));
  assign wire176 = wire170[(4'hd):(1'h1)];
  assign wire177 = $signed($unsigned((wire173 < ((wire172 ?
                       wire174 : wire176) - $signed(wire175)))));
  assign wire178 = wire177[(4'hf):(1'h0)];
  assign wire179 = (~^{wire173[(4'hb):(2'h2)]});
  assign wire180 = wire178;
  assign wire181 = $signed($unsigned((wire170 ?
                       wire171[(2'h3):(2'h2)] : {{(8'hb7)}})));
  always
    @(posedge clk) begin
      reg182 <= $signed((((~wire170) ?
              {wire181[(4'h8):(3'h6)]} : wire178[(4'h8):(2'h3)]) ?
          wire171 : {((wire179 >= (8'h9d)) >> {wire175, wire178})}));
      reg183 <= (wire176 + $unsigned(($unsigned(reg182[(2'h3):(2'h3)]) == wire176[(2'h3):(2'h3)])));
    end
  assign wire184 = ({wire173,
                       (-({wire171} - $signed(wire173)))} || wire175[(4'h9):(4'h9)]);
  assign wire185 = {($signed(wire170[(4'hf):(3'h5)]) ?
                           {(-wire184[(3'h4):(2'h3)]),
                               (8'hab)} : {((+wire174) | (8'ha9)),
                               $signed($signed(wire180))}),
                       $signed(((~^wire174) - ((wire184 ? reg182 : reg183) ?
                           (~(8'hbc)) : ((8'ha1) >> wire181))))};
  assign wire186 = wire175[(5'h12):(5'h10)];
  assign wire187 = $signed(((~&(~&$signed(wire175))) <<< (wire172[(3'h7):(3'h5)] ?
                       (&(^~wire181)) : wire170)));
endmodule

module module93
#(parameter param164 = ((((((8'ha1) ? (8'hb3) : (8'ha5)) || (|(8'hab))) != (((8'ha0) ? (8'haa) : (8'hb0)) >> ((8'haa) ? (8'hbe) : (8'hb1)))) ? (((~^(8'ha4)) | ((8'ha2) << (8'ha6))) ^ (((7'h42) ? (8'ha0) : (8'ha7)) ? ((8'hbd) ? (8'ha0) : (8'ha8)) : (!(8'ha5)))) : (((&(8'h9c)) ~^ (|(8'haa))) < {{(8'hab), (8'hab)}, (~|(8'ha4))})) ^ (~|{{((7'h42) + (8'hb0)), (+(8'ha9))}, (!((8'ha0) ? (8'hae) : (8'h9e)))})))
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'h2a9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire97;
  input wire [(4'he):(1'h0)] wire96;
  input wire signed [(3'h6):(1'h0)] wire95;
  input wire signed [(4'hc):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire162;
  wire signed [(4'hb):(1'h0)] wire157;
  wire signed [(4'h9):(1'h0)] wire142;
  wire [(3'h5):(1'h0)] wire141;
  wire [(5'h14):(1'h0)] wire140;
  wire signed [(4'h9):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire122;
  wire [(2'h2):(1'h0)] wire121;
  wire [(5'h12):(1'h0)] wire103;
  wire [(5'h14):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire100;
  wire signed [(2'h2):(1'h0)] wire99;
  wire [(2'h2):(1'h0)] wire98;
  reg signed [(4'ha):(1'h0)] reg161 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg160 = (1'h0);
  reg [(4'hc):(1'h0)] reg159 = (1'h0);
  reg signed [(4'he):(1'h0)] reg158 = (1'h0);
  reg [(3'h4):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg138 = (1'h0);
  reg [(5'h11):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(4'hf):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg104 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire157,
                 wire142,
                 wire141,
                 wire140,
                 wire135,
                 wire122,
                 wire121,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
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
                 reg143,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
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
                 (1'h0)};
  assign wire98 = ({(~wire96[(4'hc):(3'h4)])} && wire95[(2'h3):(1'h1)]);
  assign wire99 = (&wire95);
  assign wire100 = wire98[(2'h2):(1'h0)];
  assign wire101 = wire94;
  assign wire102 = (($unsigned($unsigned($unsigned(wire98))) >> ((8'hb4) ?
                       (~^wire95[(2'h2):(2'h2)]) : wire95[(3'h5):(3'h5)])) == wire101[(3'h4):(1'h0)]);
  assign wire103 = $signed(wire94[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg104 <= wire103;
      if (($signed((|wire94)) ?
          (~|{$unsigned($signed((8'ha8)))}) : {wire103[(4'hf):(3'h7)]}))
        begin
          reg105 <= (8'hbd);
          reg106 <= (($signed($unsigned(wire103)) ^ $signed($signed((wire94 ?
              wire96 : wire98)))) & wire96);
          reg107 <= wire94[(3'h7):(2'h2)];
        end
      else
        begin
          reg105 <= ($unsigned(reg107) + $signed(wire96[(3'h7):(1'h1)]));
          if (wire95[(3'h5):(2'h2)])
            begin
              reg106 <= ($unsigned($signed(((wire96 ? reg105 : wire102) ?
                  {wire103, reg106} : $unsigned(reg106)))) > {wire97});
              reg107 <= {(((-wire97[(3'h6):(2'h2)]) ?
                          {((8'hbc) ? wire103 : reg105),
                              $unsigned(wire97)} : $signed(((8'hae) == (8'hab)))) ?
                      (~&$unsigned(reg106)) : (|$signed($signed((8'ha2)))))};
              reg108 <= wire97;
              reg109 <= $signed($signed($signed({$unsigned(wire103)})));
              reg110 <= wire101[(4'h8):(1'h0)];
            end
          else
            begin
              reg106 <= (~&(7'h40));
              reg107 <= (-(!(wire101[(1'h0):(1'h0)] | $signed($unsigned(wire101)))));
              reg108 <= wire99;
              reg109 <= ((~^wire98[(1'h1):(1'h1)]) * (~reg107[(3'h6):(3'h5)]));
              reg110 <= wire97[(4'h9):(3'h5)];
            end
          reg111 <= wire96;
          if (((~&reg110[(1'h0):(1'h0)]) >= ($signed($unsigned((reg104 >= reg108))) ?
              $unsigned((8'h9e)) : wire100)))
            begin
              reg112 <= wire101[(3'h7):(1'h0)];
              reg113 <= wire99[(2'h2):(1'h0)];
              reg114 <= ((^~(^~((!(8'ha9)) ?
                      $unsigned(reg108) : reg107[(4'h8):(3'h5)]))) ?
                  ({(reg111[(4'ha):(3'h6)] ? (-reg105) : reg107),
                          reg111[(4'h8):(1'h1)]} ?
                      (~|(wire94[(4'hb):(4'h9)] | (wire103 | reg104))) : wire101) : $unsigned((wire96[(1'h0):(1'h0)] ?
                      (reg106 & wire100[(4'hf):(2'h2)]) : reg104[(2'h2):(1'h0)])));
              reg115 <= (+$signed(({(reg109 <= reg104),
                  (wire100 ? (8'ha6) : (8'hb9))} ^ reg108)));
            end
          else
            begin
              reg112 <= reg107[(2'h3):(2'h3)];
              reg113 <= (^(wire95 ?
                  (((8'ha5) ? (7'h44) : (wire95 ? wire99 : wire98)) ?
                      (|wire102[(5'h12):(4'hd)]) : ((reg112 ~^ wire94) ?
                          $unsigned(reg108) : wire101)) : (reg106 ?
                      ((8'ha1) ? wire99 : reg114) : $signed((reg114 ?
                          wire95 : reg110)))));
              reg114 <= $unsigned(wire97[(4'hb):(4'h9)]);
              reg115 <= $unsigned({($unsigned(((8'hbe) > (8'hb0))) ?
                      $signed((~&reg108)) : (^(8'ha1))),
                  wire96[(4'hd):(4'hd)]});
              reg116 <= ($signed(reg105) ?
                  wire97[(3'h5):(3'h4)] : (reg112[(2'h3):(1'h1)] ?
                      $unsigned($unsigned($unsigned(wire96))) : $signed((+(reg109 ?
                          wire103 : wire103)))));
            end
          if ($signed(({(reg111 ? {reg113} : (!reg115)),
              ((~^wire95) ?
                  wire95 : (reg105 == reg105))} > $unsigned(reg104[(4'hb):(3'h5)]))))
            begin
              reg117 <= ($signed((($unsigned(reg109) >>> $signed(wire97)) ~^ (&(+wire95)))) ?
                  (~^$unsigned($signed((8'ha1)))) : ((8'ha9) + reg112));
              reg118 <= (wire94 * ((reg105 <= $unsigned(reg114)) | $signed(wire98)));
            end
          else
            begin
              reg117 <= ({reg108[(4'ha):(4'h9)]} <<< (reg114[(1'h1):(1'h1)] ?
                  {({reg105} ? wire102 : wire101[(2'h3):(1'h1)]),
                      wire100} : ($unsigned($unsigned(reg115)) * ($unsigned(wire99) ~^ reg104[(4'ha):(3'h5)]))));
              reg118 <= $signed(reg107[(3'h6):(1'h0)]);
              reg119 <= $signed({($unsigned(wire95) ?
                      {(reg105 ? reg104 : reg109),
                          reg115[(2'h3):(2'h2)]} : (8'hbc))});
              reg120 <= $unsigned($signed((wire99 ?
                  wire102[(5'h12):(1'h0)] : (wire96 ~^ wire98))));
            end
        end
    end
  assign wire121 = $unsigned(reg111);
  assign wire122 = ($unsigned({reg104[(1'h0):(1'h0)]}) ?
                       ((reg120[(4'h9):(3'h7)] >>> ((reg109 ?
                                   reg118 : wire103) ?
                               (wire94 + wire97) : $unsigned(reg109))) ?
                           $unsigned(reg106) : ($signed((reg104 >>> reg119)) ^~ (reg107[(3'h5):(3'h5)] + $signed(reg115)))) : ({wire121} - reg114));
  always
    @(posedge clk) begin
      reg123 <= $unsigned((reg104[(3'h4):(1'h1)] ?
          (7'h40) : $signed(wire103[(4'hf):(4'ha)])));
      reg124 <= $signed(wire94[(2'h2):(1'h0)]);
      reg125 <= $unsigned($signed((&wire95[(1'h0):(1'h0)])));
      if (wire99)
        begin
          reg126 <= (~|(|(~|wire98)));
          reg127 <= $signed((^$unsigned((reg107[(4'h8):(3'h7)] ?
              $unsigned(wire95) : wire96))));
        end
      else
        begin
          if ({$signed((reg110 <= {wire98}))})
            begin
              reg126 <= (~|(reg118 <= $signed($unsigned((8'h9f)))));
              reg127 <= (|$unsigned($signed($unsigned(reg118[(3'h7):(3'h7)]))));
              reg128 <= ({$unsigned(({reg112} ?
                      reg123 : (reg111 * (8'ha5))))} ~^ {(&(reg127 ?
                      (wire102 > (8'hb8)) : reg120[(4'hd):(4'h9)])),
                  reg117});
            end
          else
            begin
              reg126 <= reg109[(2'h3):(2'h3)];
              reg127 <= {(((!wire102) && ({reg109, wire94} ?
                          $signed((8'haf)) : (reg110 ? reg110 : reg104))) ?
                      $unsigned(((reg112 >>> reg127) >= (reg105 ?
                          wire94 : (7'h41)))) : reg112),
                  $unsigned(reg114)};
              reg128 <= reg126[(4'hc):(4'h8)];
            end
          reg129 <= ((wire98 ?
                  (^~$signed((reg112 ?
                      reg110 : wire122))) : $signed(((^~(8'ha6)) | (reg107 ~^ reg128)))) ?
              $signed((8'hbb)) : ((~&wire101[(3'h4):(2'h3)]) * (^$unsigned($signed((8'ha2))))));
          if (reg105)
            begin
              reg130 <= ({(reg110[(2'h3):(1'h1)] ?
                      (&(reg106 && wire96)) : $unsigned($unsigned(reg107)))} ^ $signed(reg117[(3'h7):(3'h5)]));
              reg131 <= reg124;
            end
          else
            begin
              reg130 <= ((&$unsigned(reg110)) == {wire102[(2'h3):(1'h1)]});
              reg131 <= $signed(wire100);
              reg132 <= {reg112};
              reg133 <= (^$unsigned((((wire98 ? (8'had) : reg112) ?
                  (reg132 | reg105) : (reg120 ? wire103 : reg116)) | ((wire99 ?
                  (7'h43) : reg116) ^ (reg110 != reg104)))));
              reg134 <= reg127[(2'h2):(1'h1)];
            end
        end
    end
  assign wire135 = {{({(^~reg129), $signed(wire96)} ^ reg129),
                           {{(reg127 || reg106), ((8'ha3) <<< (7'h41))}}},
                       wire121};
  always
    @(posedge clk) begin
      reg136 <= (~(+wire97));
      reg137 <= (+(~|$signed($unsigned(((8'hb5) < reg116)))));
      reg138 <= (^~$unsigned(reg119[(3'h5):(1'h1)]));
      reg139 <= $unsigned(reg115[(2'h2):(1'h0)]);
    end
  assign wire140 = $unsigned((8'hbc));
  assign wire141 = $signed(reg105);
  assign wire142 = $signed($unsigned((8'ha8)));
  always
    @(posedge clk) begin
      if ($unsigned(reg130))
        begin
          if ($unsigned(reg127[(3'h4):(3'h4)]))
            begin
              reg143 <= ($unsigned(reg106) != wire141);
              reg144 <= ($unsigned($unsigned(reg132)) > reg105);
              reg145 <= $unsigned(((reg134 ?
                  (7'h44) : ((reg127 ?
                      reg136 : reg137) != (~|reg123))) - $signed(reg110)));
              reg146 <= (-$unsigned((({reg134,
                  reg108} * reg130) >> {$signed(reg105), $signed(reg107)})));
              reg147 <= ($unsigned(wire135[(4'h9):(4'h8)]) * reg145);
            end
          else
            begin
              reg143 <= (^(+(reg147 <<< reg129)));
            end
          reg148 <= ((((reg114[(3'h4):(2'h2)] ^ {reg146, reg124}) ?
              ($unsigned(wire135) ?
                  (wire121 && wire121) : $unsigned(reg123)) : $unsigned(wire94)) * (!reg109)) >> reg119);
          reg149 <= reg118[(3'h6):(3'h4)];
        end
      else
        begin
          reg143 <= reg128[(3'h6):(1'h0)];
          reg144 <= $signed(reg137[(4'ha):(4'ha)]);
          reg145 <= {(+(-$signed($signed((7'h42))))), (7'h41)};
          reg146 <= (reg144 ?
              (reg127[(3'h4):(2'h2)] ?
                  (reg120 ?
                      reg106[(3'h6):(3'h4)] : $signed(reg124)) : {($unsigned(reg127) ?
                          reg144[(2'h2):(2'h2)] : wire96),
                      {(reg107 <= reg147),
                          (wire140 << wire142)}}) : {(^~(^(reg130 == wire96))),
                  (7'h42)});
        end
      reg150 <= (wire142 + (reg117[(3'h5):(3'h4)] + ((^reg145[(1'h0):(1'h0)]) != $signed((8'hb2)))));
      reg151 <= reg110;
      if ($unsigned((reg114 ? $unsigned(reg143) : reg139)))
        begin
          if ((((^~wire97[(2'h3):(1'h0)]) ^ (((~|reg125) | $unsigned(wire141)) == $signed(wire94))) ^~ reg145))
            begin
              reg152 <= {(~&reg108[(4'h8):(3'h7)])};
              reg153 <= $signed($unsigned({reg126}));
            end
          else
            begin
              reg152 <= reg112[(2'h2):(1'h1)];
              reg153 <= ($signed($signed($unsigned($unsigned(reg151)))) ?
                  $signed(reg109) : reg109);
            end
          reg154 <= (&(|$unsigned(($signed((8'hb1)) ?
              {(8'hb3)} : $unsigned((8'h9c))))));
          reg155 <= reg110;
        end
      else
        begin
          reg152 <= (7'h42);
          reg153 <= $unsigned($signed($signed({(reg131 ? reg118 : reg152)})));
          reg154 <= (8'hb2);
          reg155 <= $signed({$signed((8'ha7))});
          reg156 <= ($unsigned((!((wire135 ?
                  reg137 : wire103) >= (~|(8'haa))))) ?
              ($unsigned($unsigned(reg114)) == $signed($signed($signed(reg133)))) : ($signed($signed($unsigned(reg128))) | (^~reg124)));
        end
    end
  assign wire157 = (reg136 ?
                       $signed((((wire142 ? reg136 : reg146) ?
                               {reg144, reg120} : reg144[(2'h2):(1'h0)]) ?
                           $signed((|(8'hbb))) : (|$signed(reg147)))) : {reg105,
                           {(^$unsigned(reg113))}});
  always
    @(posedge clk) begin
      reg158 <= (reg110[(3'h7):(3'h6)] ? $signed(reg136) : wire140);
      reg159 <= reg134;
      reg160 <= (($unsigned(wire102) <<< (7'h42)) * {($unsigned((reg130 ?
                  reg111 : wire103)) ?
              {reg153} : reg139)});
      reg161 <= ({({wire141} ? wire102 : reg136[(4'h8):(2'h2)]),
          (~|$signed({reg152}))} || (reg133 ?
          $unsigned(reg132) : reg120[(3'h6):(2'h3)]));
    end
  assign wire162 = (reg160 ?
                       $signed({((wire103 ? (8'hbf) : (8'haa)) ?
                               (wire121 ?
                                   reg112 : reg127) : ((8'ha8) | reg117))}) : reg153);
  assign wire163 = (~wire98[(1'h0):(1'h0)]);
endmodule

module module29  (y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire34;
  input wire [(4'h8):(1'h0)] wire33;
  input wire signed [(4'h8):(1'h0)] wire32;
  input wire signed [(4'hf):(1'h0)] wire31;
  input wire [(4'hf):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire35;
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  assign y = {wire67,
                 wire49,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire35,
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
                 reg50,
                 reg48,
                 reg47,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire35 = (wire30[(4'hc):(2'h3)] ~^ $unsigned($signed($signed($signed(wire34)))));
  always
    @(posedge clk) begin
      reg36 <= wire32;
      reg37 <= $unsigned(wire32[(4'h8):(2'h2)]);
      reg38 <= wire32;
      reg39 <= ((&$signed((reg38[(3'h4):(2'h3)] > $unsigned(reg37)))) >> reg37[(2'h3):(1'h1)]);
    end
  assign wire40 = (({reg36[(5'h15):(4'h9)]} >>> reg39[(1'h1):(1'h0)]) || reg39[(1'h0):(1'h0)]);
  assign wire41 = ($signed({(~(reg37 * reg37)),
                          (wire34 ?
                              ((8'hb2) ? wire33 : reg37) : $unsigned(reg38))}) ?
                      wire32[(1'h0):(1'h0)] : ((wire34 ?
                          $signed(wire35) : reg39[(3'h5):(1'h0)]) >> wire32));
  assign wire42 = $signed(wire30);
  assign wire43 = (wire32 ?
                      $unsigned(((!wire30) ?
                          $unsigned($signed(wire41)) : (-(wire40 ?
                              wire31 : wire32)))) : {reg38[(2'h3):(2'h2)]});
  assign wire44 = ((($signed(wire31) >> reg37) >= (($unsigned(wire30) > $signed(reg37)) <<< ((wire35 ?
                              wire34 : reg36) ?
                          ((8'h9d) >= reg37) : wire33[(3'h5):(1'h1)]))) ?
                      (wire31 ?
                          reg36[(3'h4):(2'h3)] : (($unsigned(reg38) != (reg36 ?
                                  wire34 : (8'hb0))) ?
                              wire32[(2'h2):(1'h0)] : $unsigned(((8'hb7) ?
                                  wire40 : wire34)))) : (((~&{wire43}) <= $signed(wire31)) ^ $unsigned($signed((reg39 >>> (8'ha6))))));
  assign wire45 = (-$signed(wire40[(4'h8):(3'h5)]));
  assign wire46 = wire42;
  always
    @(posedge clk) begin
      reg47 <= {(reg39[(1'h0):(1'h0)] < wire31[(4'hd):(1'h0)])};
      reg48 <= ({(8'hae)} ?
          (|(8'hb7)) : {$unsigned(({wire40, wire33} >> (wire44 ?
                  reg36 : wire41)))});
    end
  assign wire49 = wire33;
  always
    @(posedge clk) begin
      if ({(~&(^~wire45[(3'h7):(3'h6)]))})
        begin
          reg50 <= {{$signed($signed($signed(reg48)))}};
          reg51 <= $signed((|(wire31[(3'h4):(1'h1)] <<< (8'had))));
          if ($unsigned((-$unsigned((8'hb8)))))
            begin
              reg52 <= reg48[(5'h11):(4'hb)];
              reg53 <= reg51;
              reg54 <= $unsigned(((({reg36, (8'hb1)} ?
                  wire34[(2'h3):(1'h0)] : reg37) > (^~((8'ha1) ?
                  wire40 : wire41))) + $unsigned($signed($unsigned(wire45)))));
            end
          else
            begin
              reg52 <= $signed(((reg47[(5'h10):(4'hc)] ?
                  (~&wire44[(1'h0):(1'h0)]) : $signed(reg36[(4'h9):(1'h0)])) * (((reg36 | wire41) ^~ {reg51,
                      wire42}) ?
                  ({wire35} ?
                      reg36[(5'h11):(3'h6)] : {reg51,
                          (8'ha1)}) : (reg48[(3'h4):(1'h0)] ?
                      $unsigned((8'hbb)) : (+wire32)))));
              reg53 <= (~|$unsigned($signed($unsigned((wire32 ^ (7'h40))))));
            end
        end
      else
        begin
          reg50 <= wire32;
          reg51 <= reg52[(1'h0):(1'h0)];
        end
      if ($unsigned(reg51[(2'h2):(2'h2)]))
        begin
          reg55 <= (((^$unsigned(wire42)) < wire44) ?
              (-($signed(wire35) ?
                  {(wire49 || reg36)} : $unsigned((&(8'hba))))) : (|wire30));
          reg56 <= wire30[(2'h3):(1'h1)];
          reg57 <= ((wire49 ?
                  reg47 : $signed(((^reg37) ?
                      $signed(wire40) : $signed(reg53)))) ?
              (^((8'h9d) ?
                  $signed((&wire34)) : ((wire35 ?
                      wire40 : wire34) >= wire45[(2'h3):(1'h1)]))) : (+($signed(wire32) ?
                  $signed((wire32 ?
                      reg51 : wire35)) : ((8'ha9) >>> wire49[(4'h9):(4'h9)]))));
          if (wire34)
            begin
              reg58 <= ((~^((8'hbe) * reg56)) ~^ $signed(($signed((&wire42)) & ($unsigned((8'hb0)) >= $unsigned(reg39)))));
              reg59 <= {$unsigned($signed($signed($signed(reg57)))),
                  ((~^wire32) * reg50)};
              reg60 <= ({{(reg37[(4'hf):(4'he)] >= wire45[(3'h4):(2'h3)]),
                          ((wire30 <= (8'h9d)) ? wire35 : (wire49 <= reg48))},
                      ((((8'hb1) < reg56) <<< (wire30 & reg39)) ?
                          $unsigned($unsigned(wire43)) : reg38)} ?
                  (8'ha7) : reg47[(3'h5):(3'h5)]);
              reg61 <= (|wire30[(4'he):(4'hb)]);
              reg62 <= wire46;
            end
          else
            begin
              reg58 <= ((({wire49[(4'hb):(4'ha)], (reg62 ? reg55 : reg59)} ?
                      (~wire30[(3'h6):(3'h6)]) : wire32[(4'h8):(2'h2)]) ?
                  (~|wire32[(1'h1):(1'h0)]) : reg56[(5'h15):(5'h14)]) && reg54);
            end
          reg63 <= reg47;
        end
      else
        begin
          reg55 <= $unsigned((8'hb0));
        end
      reg64 <= reg51[(2'h3):(2'h3)];
      reg65 <= wire42;
      reg66 <= wire31[(4'h8):(4'h8)];
    end
  assign wire67 = ((^$signed(reg52)) ^ {$signed(((reg56 ?
                          reg50 : reg36) ^~ (wire34 > reg50))),
                      reg62[(4'hf):(4'h8)]});
endmodule
