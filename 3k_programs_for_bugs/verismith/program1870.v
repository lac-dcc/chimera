module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire298;
  wire [(4'hf):(1'h0)] wire295;
  wire [(2'h2):(1'h0)] wire294;
  wire [(3'h4):(1'h0)] wire293;
  wire [(5'h10):(1'h0)] wire292;
  wire signed [(4'hd):(1'h0)] wire291;
  wire signed [(5'h13):(1'h0)] wire289;
  wire signed [(4'hf):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire136;
  wire signed [(3'h7):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire108;
  wire [(2'h3):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire104;
  reg signed [(4'hc):(1'h0)] reg297 = (1'h0);
  reg [(3'h5):(1'h0)] reg296 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg148 = (1'h0);
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg144 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  reg [(5'h11):(1'h0)] reg139 = (1'h0);
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  assign y = {wire298,
                 wire295,
                 wire294,
                 wire293,
                 wire292,
                 wire291,
                 wire289,
                 wire141,
                 wire140,
                 wire136,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire104,
                 reg297,
                 reg296,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg139,
                 reg138,
                 (1'h0)};
  assign wire5 = ($unsigned(($unsigned($signed(wire3)) ?
                     {{wire0, wire0}, (^~wire3)} : $signed({wire3,
                         wire3}))) <<< $unsigned(($signed({wire3}) ?
                     $signed(wire3[(2'h3):(1'h0)]) : wire3)));
  assign wire6 = wire1;
  assign wire7 = wire5;
  assign wire8 = (wire5 ?
                     wire5 : $signed((|{(wire3 < wire5),
                         wire0[(4'he):(4'hb)]})));
  assign wire9 = wire2;
  module10 #() modinst105 (wire104, clk, wire6, wire8, wire5, wire3, wire0);
  assign wire106 = (^wire4[(4'h8):(3'h6)]);
  assign wire107 = ({wire2[(3'h4):(2'h3)],
                           $unsigned((wire4[(4'hd):(2'h3)] >= (^~wire9)))} ?
                       $signed(wire3) : $unsigned($unsigned($signed((+wire1)))));
  assign wire108 = ($signed((^$unsigned($unsigned(wire6)))) ?
                       (($unsigned((8'hab)) ^~ ((~&wire9) ?
                               wire7 : wire6[(4'hc):(4'ha)])) ?
                           (((wire6 - wire3) <<< {wire0}) ?
                               wire9[(1'h1):(1'h1)] : {(~|wire9),
                                   wire4}) : (!{((8'ha1) * wire5),
                               (wire6 ?
                                   wire1 : wire2)})) : (wire8 >= ($signed($unsigned((8'had))) <<< $unsigned((wire5 + wire6)))));
  assign wire109 = (wire0 & $signed($signed(($signed(wire8) <<< (wire8 <<< wire8)))));
  module110 #() modinst137 (.clk(clk), .wire112(wire0), .wire111(wire3), .wire114(wire8), .wire113(wire1), .y(wire136));
  always
    @(posedge clk) begin
      reg138 <= $unsigned((wire9 ? {(8'had)} : $unsigned($signed(wire5))));
      reg139 <= $unsigned(wire7[(2'h2):(1'h1)]);
    end
  assign wire140 = $unsigned((-(({wire104} + wire7) ?
                       wire104 : $unsigned(wire8[(4'hd):(1'h1)]))));
  assign wire141 = reg139;
  always
    @(posedge clk) begin
      if (($signed(($signed((wire104 ?
              wire2 : wire5)) * wire107[(2'h2):(2'h2)])) ?
          $unsigned(wire2) : wire9[(1'h1):(1'h1)]))
        begin
          if ((^~((~|wire5) * wire8)))
            begin
              reg142 <= (7'h42);
              reg143 <= (|{$signed(($signed(wire109) ?
                      (~&reg139) : (-(8'hb9))))});
              reg144 <= $unsigned((~|{$signed((~&wire141)),
                  $unsigned(reg139[(4'hb):(4'h9)])}));
            end
          else
            begin
              reg142 <= (~(((~|(&wire7)) - {(wire3 * wire106),
                  wire8[(5'h10):(4'hb)]}) - (^$signed((^~wire107)))));
              reg143 <= wire6;
              reg144 <= {((~&(-$signed(wire6))) ?
                      (({wire9, wire8} > (|wire3)) != ((wire4 ?
                          wire7 : wire3) && $unsigned(wire7))) : wire141),
                  ($unsigned((-$unsigned(wire8))) - wire0[(4'hb):(3'h7)])};
              reg145 <= ($signed(wire0) && wire9);
            end
          reg146 <= wire106[(5'h11):(4'h8)];
          reg147 <= ($unsigned(wire6) - $unsigned($signed((reg138[(1'h1):(1'h0)] - (wire140 ?
              wire8 : reg144)))));
          reg148 <= (wire4[(5'h14):(3'h6)] ?
              ((({reg146, wire109} + $signed(reg142)) ?
                  ($unsigned(reg138) - {wire3}) : ((wire1 ? reg147 : (8'h9d)) ?
                      $unsigned(reg142) : $signed(wire5))) * (~|wire141[(4'hb):(3'h4)])) : wire5);
          reg149 <= (|($signed((wire1 ?
                  ((8'hb7) ? (8'hab) : reg148) : reg143)) ?
              wire109[(2'h3):(2'h2)] : (((wire106 >= reg142) ?
                      (&wire108) : {wire0}) ?
                  (reg146 ?
                      wire2 : ((8'hbf) << wire8)) : $signed((!wire109)))));
        end
      else
        begin
          reg142 <= ((-$signed((+wire104))) | $unsigned($signed($unsigned((~|wire3)))));
          reg143 <= {reg144[(3'h6):(1'h0)],
              {$signed(((wire8 ? reg148 : wire0) - (wire2 < wire3))),
                  $unsigned($signed({wire6, wire106}))}};
        end
      reg150 <= (wire3[(4'he):(4'hd)] ?
          {$unsigned($unsigned((+wire3))),
              {$unsigned(wire136),
                  (+(reg149 ?
                      (8'ha5) : (8'haf)))}} : (reg142 | $signed(((!reg143) ?
              ((8'ha8) + reg149) : (8'hb2)))));
      reg151 <= wire106[(4'ha):(1'h0)];
    end
  module152 #() modinst290 (.wire154(wire3), .wire155(reg143), .wire153(wire5), .wire156(reg148), .y(wire289), .clk(clk));
  assign wire291 = wire8;
  assign wire292 = $signed(reg143);
  assign wire293 = wire0;
  assign wire294 = ((((~&{wire2}) ^ ((wire106 * wire6) ?
                       (8'hb8) : $unsigned(wire293))) ^ reg142[(4'hc):(4'h8)]) - wire291[(4'hd):(3'h7)]);
  assign wire295 = wire0;
  always
    @(posedge clk) begin
      reg296 <= wire108;
      reg297 <= {($signed({((8'h9c) ? wire7 : reg142)}) ?
              $unsigned((8'haa)) : (wire1[(1'h1):(1'h0)] ?
                  $unsigned({wire108}) : ((wire293 ?
                      wire291 : wire293) * (~reg296)))),
          (({(reg142 ? reg143 : wire2), $signed(reg146)} ?
              ((^~reg142) ?
                  $unsigned(wire293) : (reg296 ?
                      wire7 : (8'h9c))) : ((-reg145) ?
                  {wire140, (7'h44)} : (~^reg296))) >>> wire4)};
    end
  assign wire298 = wire6;
endmodule

module module152
#(parameter param287 = ((^(8'hb0)) << {({{(8'hab), (8'hbf)}} ? (^((8'hbb) ? (7'h42) : (8'ha6))) : (((7'h44) ? (8'ha9) : (8'haa)) ? (-(8'hbf)) : (~|(7'h42)))), (^~{(^~(8'ha7))})}), 
parameter param288 = ({({param287} ~^ (~^(~&param287))), (({(8'hba)} ? (^~param287) : ((8'ha0) != param287)) * ((^~param287) ? (param287 ? param287 : param287) : param287))} ? param287 : (!(8'hb3))))
(y, clk, wire153, wire154, wire155, wire156);
  output wire [(32'h248):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire153;
  input wire [(4'hd):(1'h0)] wire154;
  input wire [(3'h6):(1'h0)] wire155;
  input wire [(5'h10):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire179;
  wire [(5'h14):(1'h0)] wire180;
  wire [(3'h5):(1'h0)] wire224;
  wire signed [(5'h11):(1'h0)] wire237;
  wire signed [(5'h14):(1'h0)] wire238;
  wire [(5'h14):(1'h0)] wire239;
  wire [(4'hf):(1'h0)] wire241;
  wire signed [(5'h13):(1'h0)] wire285;
  reg [(5'h15):(1'h0)] reg159 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(4'hb):(1'h0)] reg163 = (1'h0);
  reg [(5'h15):(1'h0)] reg164 = (1'h0);
  reg [(5'h11):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg166 = (1'h0);
  reg [(5'h12):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg168 = (1'h0);
  reg [(5'h13):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg170 = (1'h0);
  reg [(5'h10):(1'h0)] reg171 = (1'h0);
  reg [(3'h5):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg173 = (1'h0);
  reg [(3'h5):(1'h0)] reg174 = (1'h0);
  reg [(5'h14):(1'h0)] reg175 = (1'h0);
  reg [(5'h12):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg177 = (1'h0);
  reg [(4'h9):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg227 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg228 = (1'h0);
  reg [(4'hb):(1'h0)] reg229 = (1'h0);
  reg [(5'h13):(1'h0)] reg230 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg231 = (1'h0);
  reg [(5'h10):(1'h0)] reg232 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg234 = (1'h0);
  reg [(5'h15):(1'h0)] reg235 = (1'h0);
  reg [(3'h4):(1'h0)] reg236 = (1'h0);
  reg [(3'h6):(1'h0)] reg240 = (1'h0);
  assign y = {wire157,
                 wire158,
                 wire179,
                 wire180,
                 wire224,
                 wire237,
                 wire238,
                 wire239,
                 wire241,
                 wire285,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 reg226,
                 reg227,
                 reg228,
                 reg229,
                 reg230,
                 reg231,
                 reg232,
                 reg233,
                 reg234,
                 reg235,
                 reg236,
                 reg240,
                 (1'h0)};
  assign wire157 = ($signed($signed(({wire153} ?
                           $signed((8'hb4)) : {wire156}))) ?
                       wire154[(4'hc):(1'h1)] : wire153[(5'h15):(4'h8)]);
  assign wire158 = (~^((((wire156 || wire156) ?
                           (wire156 ? (8'hbe) : (8'ha2)) : (wire154 ?
                               wire157 : wire157)) <<< (!wire154[(4'hd):(4'ha)])) ?
                       wire157[(1'h0):(1'h0)] : wire156[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if ((|$unsigned($signed(((wire158 ? wire157 : wire153) ~^ (8'hb1))))))
        begin
          if (wire155)
            begin
              reg159 <= (^(+((wire157[(1'h0):(1'h0)] ?
                      wire158 : $signed(wire156)) ?
                  $signed((&wire155)) : (&(wire156 ? wire157 : wire153)))));
              reg160 <= ($unsigned(wire158[(2'h2):(2'h2)]) << ($signed((-wire157)) ?
                  $signed($unsigned({reg159})) : wire153));
              reg161 <= wire154[(3'h5):(3'h5)];
              reg162 <= $unsigned(reg159[(4'hf):(1'h1)]);
            end
          else
            begin
              reg159 <= reg159[(2'h3):(1'h0)];
            end
          reg163 <= {(wire157[(4'he):(4'ha)] ?
                  reg159[(3'h4):(2'h3)] : {reg159}),
              wire157[(4'hb):(1'h1)]};
          reg164 <= $unsigned(({$unsigned(((8'hbb) * wire155)),
              (~&reg161)} <= reg161[(3'h7):(3'h4)]));
          reg165 <= wire158[(3'h7):(1'h0)];
        end
      else
        begin
          reg159 <= (reg159[(3'h6):(3'h6)] < wire156[(4'h8):(3'h5)]);
          reg160 <= (wire155 >= reg163[(2'h3):(1'h1)]);
          reg161 <= (+($signed({reg162[(3'h7):(2'h3)],
              (^wire154)}) - wire156[(2'h3):(2'h3)]));
        end
      reg166 <= {((((reg163 >>> wire157) ?
              {reg160,
                  (7'h44)} : $signed(reg162)) ^ $signed($signed(wire157))) ^~ $signed({reg162})),
          wire153};
      if (($signed($signed($signed(reg165))) ?
          (~^$unsigned((&wire158[(4'h8):(3'h6)]))) : $signed($signed($unsigned($signed(wire155))))))
        begin
          reg167 <= $unsigned((~|(!(~|$signed(wire157)))));
        end
      else
        begin
          if (reg165)
            begin
              reg167 <= $signed((|(wire155[(3'h5):(3'h5)] <= ($unsigned(reg161) < reg166))));
            end
          else
            begin
              reg167 <= {(-(~$signed((reg163 ? reg164 : wire154)))),
                  $unsigned(({reg161, ((8'ha5) ? reg163 : wire153)} - {(reg161 ?
                          reg165 : (8'haa)),
                      {reg166, wire156}}))};
              reg168 <= reg161;
              reg169 <= wire154;
              reg170 <= {(~&(+{reg160[(3'h6):(1'h1)], (8'hab)}))};
              reg171 <= wire153;
            end
          reg172 <= ((($signed((reg167 ?
                  (8'hb6) : reg159)) >>> wire157[(3'h6):(3'h4)]) && wire153) ?
              $unsigned($signed(((reg169 ?
                  reg164 : reg162) > reg170))) : ($signed($signed((-wire156))) ?
                  reg168 : $signed(((8'ha2) << $unsigned(wire154)))));
          reg173 <= (wire158[(2'h2):(2'h2)] ~^ $unsigned(($unsigned((^~(8'haf))) ?
              reg161[(1'h0):(1'h0)] : (~wire157))));
        end
      reg174 <= (reg173[(2'h2):(2'h2)] ? reg173[(4'h8):(1'h0)] : reg159);
      if ((wire156 ?
          $signed((((reg166 | reg172) ?
              $unsigned(reg174) : $unsigned(reg172)) ^ $signed({wire155,
              reg163}))) : $signed(reg172)))
        begin
          reg175 <= reg171;
          reg176 <= wire158;
          reg177 <= (~&(&{((-wire156) != (reg162 ^~ reg161))}));
          reg178 <= ({$unsigned(wire154[(1'h1):(1'h0)])} - reg176);
        end
      else
        begin
          if ($unsigned({{({reg160, wire155} ? reg178[(3'h7):(3'h4)] : reg166),
                  $unsigned($unsigned(reg159))}}))
            begin
              reg175 <= wire156;
            end
          else
            begin
              reg175 <= reg164[(2'h2):(1'h1)];
              reg176 <= (^~({$unsigned(reg167[(3'h6):(3'h5)])} ?
                  $unsigned({(wire153 ? (8'ha6) : wire156),
                      (~^reg164)}) : (($unsigned((8'h9c)) < $signed(reg175)) << ((-wire155) >> ((7'h40) == reg177)))));
              reg177 <= reg169;
              reg178 <= ($signed(reg173[(3'h5):(3'h4)]) & reg165[(4'hd):(1'h1)]);
            end
        end
    end
  assign wire179 = reg168[(2'h2):(1'h0)];
  assign wire180 = ((!({reg177[(3'h4):(1'h0)], (~|wire155)} ?
                       {(reg174 & wire155)} : reg162)) >> ((~|{$signed(reg174)}) <= (-reg177)));
  module181 #() modinst225 (wire224, clk, wire180, reg163, reg174, wire157);
  always
    @(posedge clk) begin
      reg226 <= wire158[(3'h4):(2'h3)];
      if (($signed(reg166) != (reg170 ? reg175[(2'h3):(1'h0)] : wire157)))
        begin
          reg227 <= wire154[(4'h8):(3'h7)];
          if (wire180[(5'h12):(4'he)])
            begin
              reg228 <= (7'h43);
              reg229 <= $unsigned((^~$signed((+{reg178}))));
              reg230 <= $unsigned($unsigned(reg165));
              reg231 <= (((reg171[(3'h4):(2'h3)] + (reg170[(3'h5):(3'h4)] ?
                      $unsigned(wire156) : reg173)) > $unsigned(wire179)) ?
                  wire179 : (|(~^({(7'h41)} << (~(8'hba))))));
            end
          else
            begin
              reg228 <= $signed(((!{reg162,
                  {reg175, reg231}}) ~^ {((reg166 >= reg164) ?
                      wire179[(1'h1):(1'h0)] : (~|reg227)),
                  (~|(reg163 ^~ reg176))}));
              reg229 <= (reg166 ?
                  $unsigned({(~$unsigned(reg175)),
                      $unsigned((reg161 + wire157))}) : reg162);
              reg230 <= reg174[(2'h2):(2'h2)];
              reg231 <= ($signed($unsigned($unsigned((~&(8'hb9))))) ?
                  $unsigned(($signed(reg162[(3'h5):(1'h1)]) ?
                      $signed((reg227 ~^ (8'hae))) : $unsigned($signed(reg174)))) : (~wire155));
              reg232 <= {$unsigned((wire153 < {{reg163, reg227},
                      $signed(reg227)}))};
            end
          reg233 <= $signed({$unsigned(($unsigned((8'hb5)) > $signed(reg178))),
              ($signed((reg160 <<< reg227)) ^~ wire156[(4'hc):(1'h1)])});
          if (reg172[(3'h4):(2'h3)])
            begin
              reg234 <= wire154[(4'hd):(1'h1)];
            end
          else
            begin
              reg234 <= reg226;
              reg235 <= $signed((!reg171));
            end
          reg236 <= reg176;
        end
      else
        begin
          if ($signed($unsigned(reg231)))
            begin
              reg227 <= ($unsigned($signed(reg228)) ?
                  ($signed($signed(reg163)) ^~ $unsigned($signed((reg165 ?
                      wire155 : reg228)))) : ((((reg159 ? reg168 : reg175) ?
                              ((8'ha4) ?
                                  wire157 : (8'hb6)) : $unsigned(reg176)) ?
                          $unsigned((reg171 <<< reg165)) : $signed(((8'haf) ?
                              wire153 : (8'hb5)))) ?
                      (reg230 >> ((reg229 ?
                          reg165 : reg160) >> $signed(reg228))) : (((reg177 ?
                              (8'ha8) : reg173) ?
                          $unsigned(wire180) : (7'h42)) ^ {$signed(wire155)})));
            end
          else
            begin
              reg227 <= reg177;
              reg228 <= wire158;
              reg229 <= $unsigned({($unsigned((wire179 ? reg233 : reg227)) ?
                      ((reg174 ? (8'ha9) : reg234) ?
                          $unsigned(wire224) : ((8'hb2) ^ (8'hab))) : (^~wire153[(4'h9):(3'h4)]))});
            end
        end
    end
  assign wire237 = {{(7'h44), reg172[(2'h2):(2'h2)]}};
  assign wire238 = $signed(reg159[(2'h2):(1'h1)]);
  assign wire239 = $unsigned($unsigned(wire158));
  always
    @(posedge clk) begin
      reg240 <= {reg173,
          ($signed(({reg171, wire239} ~^ (reg159 > (8'ha1)))) ?
              ({reg164[(5'h10):(2'h3)],
                  (reg169 >>> reg175)} <<< reg161) : ($signed($signed(reg173)) << (((8'hb6) ?
                      wire237 : reg159) ?
                  $unsigned(reg162) : (~&(8'hae)))))};
    end
  assign wire241 = (|{(wire179[(4'h9):(2'h3)] ?
                           reg161 : {reg162[(3'h7):(1'h1)]})});
  module242 #() modinst286 (wire285, clk, wire239, reg174, reg232, reg226);
endmodule

module module110
#(parameter param134 = (((((8'haa) & {(8'h9c), (8'hab)}) ~^ (~|(|(8'hb2)))) ? ((((8'hb0) ? (8'h9f) : (8'h9e)) <= ((8'ha6) || (8'hbe))) ? (&((8'hb3) || (8'ha6))) : (8'hb1)) : ((&{(8'hbb)}) | ({(8'ha3)} <<< ((8'hb1) - (8'ha1))))) ? ((~&(((8'ha1) >= (8'haa)) ? (8'haf) : ((7'h42) + (8'hb9)))) < {(((7'h42) ? (8'hbf) : (8'hba)) == ((7'h42) + (8'hba))), (~{(8'ha7), (8'hba)})}) : {((^(~|(8'hb8))) ? {{(8'h9e), (8'ha6)}} : (((8'ha8) >= (8'hb6)) >>> {(8'ha1)})), ((((7'h44) ? (8'haa) : (8'hb7)) ? ((8'hbe) + (8'haf)) : (~(8'hb2))) ^~ (|(8'hb3)))}), 
parameter param135 = (param134 ^ param134))
(y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire114;
  input wire [(3'h4):(1'h0)] wire113;
  input wire signed [(5'h11):(1'h0)] wire112;
  input wire signed [(3'h5):(1'h0)] wire111;
  wire [(4'he):(1'h0)] wire133;
  wire signed [(4'hd):(1'h0)] wire125;
  wire signed [(5'h13):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire [(5'h14):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  wire signed [(4'hc):(1'h0)] wire115;
  reg [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  assign y = {wire133,
                 wire125,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire115 = ($unsigned((8'hb5)) - wire113[(1'h1):(1'h1)]);
  assign wire116 = $unsigned(((((wire114 ?
                           (8'hac) : wire115) >>> (wire111 ^ wire114)) ?
                       wire112 : wire111) == $signed((^~$signed(wire115)))));
  assign wire117 = wire115;
  assign wire118 = wire114[(2'h3):(2'h2)];
  assign wire119 = $signed(($unsigned(($unsigned(wire118) <= {(8'haf)})) ?
                       ((wire116 ?
                           wire111[(3'h5):(3'h5)] : $unsigned(wire117)) < wire118[(5'h13):(3'h6)]) : $unsigned(wire115)));
  assign wire120 = ($unsigned(wire114[(2'h2):(1'h1)]) >>> $signed((+wire113[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      reg121 <= (~^($unsigned(($unsigned(wire112) | {wire117,
          wire118})) || {wire116, $signed(wire111)}));
      reg122 <= wire115;
      reg123 <= ($signed((wire114[(3'h6):(1'h0)] ^ $signed((^wire117)))) < (({(+(8'ha7))} ?
          ((wire112 ?
              reg121 : wire114) <<< $signed(wire112)) : $unsigned((wire116 ^~ (8'hb0)))) || $signed((^(8'hab)))));
      reg124 <= $unsigned((~^(~&{$unsigned(wire114), (+reg122)})));
    end
  assign wire125 = {($signed(wire111) < (reg124[(4'h9):(1'h0)] ?
                           (^(|reg124)) : {(8'hbc)}))};
  always
    @(posedge clk) begin
      if (wire111)
        begin
          reg126 <= {$signed($unsigned((^(wire114 ? wire119 : (8'haf))))),
              $signed(reg122)};
        end
      else
        begin
          reg126 <= wire115[(3'h4):(2'h2)];
          reg127 <= (reg126[(1'h1):(1'h1)] ?
              {(reg123[(1'h0):(1'h0)] <= $unsigned(wire119[(2'h2):(1'h1)])),
                  ((((8'ha3) - wire117) ?
                      wire117 : $unsigned(wire117)) ^ wire117[(4'hc):(4'hc)])} : wire115);
          reg128 <= (~wire112[(3'h5):(1'h1)]);
          reg129 <= wire120;
          reg130 <= $signed((((reg123 ?
              $unsigned(reg124) : (wire116 == wire114)) || (8'ha0)) ^~ (&(~&$unsigned((8'hb4))))));
        end
      reg131 <= reg126;
      reg132 <= ((^~{wire116[(4'h8):(3'h7)]}) ?
          {wire115} : reg121[(2'h2):(2'h2)]);
    end
  assign wire133 = $unsigned((&$signed(reg132)));
endmodule

module module10
#(parameter param102 = (({(8'hb9)} <= (8'ha5)) + (~(((~&(8'h9c)) > ((8'h9c) ? (8'hae) : (8'ha8))) ? (!{(8'ha9)}) : {(~|(8'ha7))}))), 
parameter param103 = {{{(param102 ? param102 : (param102 ? param102 : param102))}, (~|((&param102) ? (^~param102) : (param102 ? param102 : param102)))}, ((-{(param102 ? param102 : param102)}) ^~ (param102 >>> ((param102 < param102) ? param102 : {param102})))})
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire15;
  input wire [(5'h10):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire99;
  wire signed [(4'he):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire54;
  wire [(3'h5):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire16;
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire92,
                 wire90,
                 wire54,
                 wire50,
                 wire16,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg52,
                 reg53,
                 (1'h0)};
  assign wire16 = (|(-($unsigned($signed(wire15)) ?
                      $unsigned(wire14) : (+(wire12 ? wire15 : wire11)))));
  module17 #() modinst51 (.wire19(wire15), .y(wire50), .wire18(wire14), .wire20(wire11), .wire21(wire12), .clk(clk));
  always
    @(posedge clk) begin
      reg52 <= (($signed(($signed(wire11) ?
              wire16[(3'h6):(1'h0)] : (wire13 ? wire15 : wire15))) ?
          wire12[(3'h5):(2'h2)] : ($signed(wire11) ~^ wire13)) & (&$unsigned(wire16[(2'h3):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg53 <= (|wire14);
    end
  assign wire54 = wire50;
  module55 #() modinst91 (wire90, clk, wire11, wire12, reg52, wire16, wire54);
  assign wire92 = (8'ha1);
  always
    @(posedge clk) begin
      if ($signed($signed(wire15)))
        begin
          reg93 <= wire13;
          reg94 <= wire16[(3'h5):(1'h0)];
          reg95 <= (+$signed($signed($unsigned($unsigned(wire15)))));
        end
      else
        begin
          reg93 <= (~^$signed(({reg53[(4'h8):(3'h4)]} & (((8'h9f) ~^ reg93) ?
              reg93 : $unsigned(wire50)))));
          reg94 <= $unsigned($unsigned((^({(8'ha9),
              reg52} && $unsigned((8'hbe))))));
          reg95 <= (^(^~wire90));
          reg96 <= (8'hb4);
        end
      reg97 <= (((!$unsigned($signed(reg95))) - $unsigned(((wire15 * wire90) ?
          (wire16 ? wire92 : reg53) : (!(7'h41))))) & $signed((7'h44)));
      reg98 <= $unsigned(($signed(wire92) ?
          wire16[(2'h3):(1'h1)] : ((^(^~wire90)) != $signed($signed(reg93)))));
    end
  assign wire99 = reg93;
  assign wire100 = $signed($signed(reg52[(2'h3):(1'h0)]));
  assign wire101 = $signed($unsigned({{{(8'hae), (8'ha5)}, wire11}}));
endmodule

module module55  (y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire60;
  input wire signed [(4'h9):(1'h0)] wire59;
  input wire [(5'h12):(1'h0)] wire58;
  input wire [(4'hb):(1'h0)] wire57;
  input wire [(5'h12):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire63,
                 wire62,
                 wire61,
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
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire61 = (&($signed($unsigned((wire58 ? wire60 : wire58))) ?
                      (($signed((8'hb4)) * (wire58 | wire60)) && wire58) : (!wire58)));
  assign wire62 = {wire58,
                      ($unsigned($unsigned($unsigned(wire61))) <<< (~|$signed(wire56)))};
  assign wire63 = wire58[(5'h10):(4'hf)];
  always
    @(posedge clk) begin
      reg64 <= (&$unsigned(wire63[(3'h5):(1'h1)]));
      reg65 <= ($unsigned((~&$unsigned(wire59[(3'h7):(3'h6)]))) ?
          $signed($signed(((wire56 < wire59) ?
              wire59 : $signed(wire58)))) : (wire62 ?
              $signed($signed(wire58)) : (({wire60} | (reg64 * wire56)) && ({wire57,
                      wire57} ?
                  $unsigned(wire63) : $unsigned(wire61)))));
      if (wire56[(4'hd):(3'h7)])
        begin
          if ((-wire58[(4'hc):(4'ha)]))
            begin
              reg66 <= $unsigned($unsigned({{wire58[(4'he):(1'h0)]}}));
            end
          else
            begin
              reg66 <= ({wire61[(4'hc):(4'ha)], wire58} ?
                  {{$unsigned((wire59 << wire59)),
                          $unsigned(reg64[(4'ha):(3'h4)])}} : ({(~|reg66)} & (^~{(^~reg64),
                      wire59[(2'h3):(2'h2)]})));
            end
          reg67 <= wire57[(4'h9):(4'h8)];
          reg68 <= (wire61 && (!wire58[(5'h11):(1'h1)]));
        end
      else
        begin
          reg66 <= (~(wire61[(2'h2):(1'h0)] ? reg68 : reg65));
          reg67 <= ((~$signed((8'h9f))) ? wire58 : $unsigned(reg66));
          reg68 <= (reg66 | $signed($signed(wire56)));
        end
    end
  assign wire69 = $signed(wire63[(3'h5):(3'h4)]);
  assign wire70 = (-(&$unsigned(($unsigned(reg68) ?
                      (8'h9c) : $unsigned(reg64)))));
  assign wire71 = wire57[(4'hb):(3'h7)];
  assign wire72 = wire62;
  assign wire73 = ($signed($unsigned($unsigned({(7'h44)}))) & wire61);
  assign wire74 = $signed((($signed((reg64 && wire69)) ?
                      {(reg66 + wire63)} : ((!wire56) ?
                          wire60 : (~&reg66))) ^ reg68[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg75 <= (~($signed((!$signed(wire57))) && $signed((-(^~wire71)))));
      if ((-($unsigned($unsigned(wire70)) ?
          (&reg75) : $signed($unsigned(reg75)))))
        begin
          reg76 <= wire71;
          reg77 <= ((^wire58) << wire63);
          reg78 <= (^~($signed(reg76) > $unsigned((^(wire56 < wire56)))));
          reg79 <= $signed(wire58);
          reg80 <= wire70[(2'h2):(1'h0)];
        end
      else
        begin
          if ((~^wire61[(4'hf):(1'h0)]))
            begin
              reg76 <= {wire61};
            end
          else
            begin
              reg76 <= $signed((7'h41));
              reg77 <= ((wire62[(1'h0):(1'h0)] ?
                  (($signed(reg76) ?
                      (reg77 ? wire56 : reg66) : (wire72 ?
                          wire73 : wire61)) >> ((!reg66) ?
                      (!(8'hbe)) : wire59)) : $unsigned(wire74[(3'h7):(1'h0)])) || $unsigned(wire62[(4'h8):(3'h7)]));
              reg78 <= (~&$signed((reg75 >> reg64)));
              reg79 <= (wire69[(3'h4):(2'h3)] ?
                  wire57[(4'ha):(3'h5)] : (^(+(reg78 ?
                      reg64 : $signed(wire74)))));
            end
        end
      reg81 <= reg67[(2'h3):(1'h1)];
      if (wire59)
        begin
          if ($signed((-(wire70[(4'h8):(2'h2)] ?
              ($signed(reg65) ?
                  wire62[(4'ha):(4'h8)] : reg67[(1'h1):(1'h0)]) : (8'haf)))))
            begin
              reg82 <= $unsigned(reg80[(2'h3):(1'h0)]);
              reg83 <= (reg78[(2'h2):(2'h2)] && $unsigned($unsigned($signed({wire60,
                  reg66}))));
              reg84 <= (~&reg66);
              reg85 <= reg78[(2'h3):(1'h0)];
            end
          else
            begin
              reg82 <= ({reg75[(2'h2):(2'h2)], reg75[(4'hc):(4'h8)]} ?
                  wire60[(2'h3):(2'h3)] : $signed(reg79[(4'ha):(1'h0)]));
              reg83 <= wire74[(4'hf):(3'h6)];
              reg84 <= (|$unsigned((8'hb0)));
            end
          reg86 <= (+(~^reg75));
          reg87 <= ($unsigned(((~(reg80 ? reg67 : wire73)) ?
              (^$signed(wire63)) : $unsigned(reg86))) >>> ($unsigned(wire63[(1'h0):(1'h0)]) << $unsigned(reg80)));
          reg88 <= reg64;
          reg89 <= ($signed({wire62[(1'h1):(1'h1)]}) ?
              $signed(reg82[(1'h0):(1'h0)]) : (($signed($signed(reg65)) != (reg87[(1'h1):(1'h1)] ?
                  (~^(8'haa)) : wire61)) <<< ({$unsigned(wire69),
                  $unsigned(reg81)} & {(reg68 ? (8'ha0) : wire59)})));
        end
      else
        begin
          reg82 <= $unsigned(reg79[(2'h2):(1'h1)]);
          reg83 <= $signed((^(+reg86[(3'h6):(2'h2)])));
        end
    end
endmodule

module module17
#(parameter param48 = {(+(((-(8'h9e)) != (~|(8'hb8))) ^~ (|((8'hb2) & (8'hb6))))), (((((8'hb3) ? (8'h9c) : (7'h41)) == ((8'hbd) ? (8'hb2) : (8'ha6))) ? ((8'hbf) ? ((8'hab) ? (8'hb4) : (8'hb2)) : {(8'hb2), (8'hb5)}) : ({(8'haf)} ? (+(8'h9d)) : {(8'h9c)})) ? ({(!(8'hb8))} || ((^(8'ha5)) ? ((7'h44) ? (8'ha3) : (8'hb3)) : {(8'ha0), (8'hb5)})) : (!(^~((8'hac) <= (8'ha0)))))}, 
parameter param49 = (param48 ? (!({(param48 <<< param48)} <<< ((-(8'ha4)) ^ (param48 ? param48 : param48)))) : (((&param48) ? {{param48, param48}, (param48 ^~ param48)} : param48) || (~&((param48 ? param48 : param48) ? (param48 ? param48 : (7'h42)) : param48)))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire21;
  input wire [(5'h14):(1'h0)] wire20;
  input wire signed [(2'h3):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire22;
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire22,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire22 = (&$signed(wire20));
  always
    @(posedge clk) begin
      reg23 <= $unsigned((wire22 ?
          $unsigned(wire18[(1'h1):(1'h1)]) : wire20[(3'h4):(2'h2)]));
      reg24 <= ((^~(wire20[(4'hf):(4'hf)] ?
              $unsigned(wire18[(5'h10):(1'h1)]) : {(~&wire21),
                  (wire20 ? wire22 : reg23)})) ?
          ({$signed((reg23 + wire21))} ?
              ($unsigned((~^wire19)) >> wire18) : $signed({{(7'h43), wire21},
                  wire21})) : $signed($unsigned(wire19)));
      reg25 <= wire22;
      reg26 <= (((8'hb7) > (($unsigned(wire22) ? {(8'h9c)} : reg23) ?
              wire22[(3'h4):(1'h1)] : (~&(reg23 >= reg25)))) ?
          $unsigned({(~((8'hba) << wire20))}) : wire22);
    end
  assign wire27 = (($signed({(^~(8'hb8))}) ?
                      $unsigned($unsigned((+reg23))) : reg24) & $unsigned($signed($signed($signed(reg23)))));
  assign wire28 = wire27;
  assign wire29 = {wire20[(5'h12):(4'hc)], (+(~(-wire22)))};
  assign wire30 = reg25[(4'ha):(3'h6)];
  assign wire31 = $unsigned(((-(reg23 ?
                          reg23[(5'h11):(4'h8)] : $signed(wire21))) ?
                      (|(^(wire30 ? (8'ha5) : (7'h44)))) : reg24));
  assign wire32 = (($unsigned((~^(reg24 ^ wire31))) && (8'ha3)) ?
                      $unsigned(wire31) : reg24[(3'h4):(1'h0)]);
  assign wire33 = $signed(wire32[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg34 <= (&wire19[(2'h2):(2'h2)]);
      reg35 <= $signed($signed((!(!wire21))));
      if ((($signed({(wire19 ? reg34 : reg23)}) - (8'hb1)) ?
          ($signed($unsigned(reg23)) ?
              wire32[(1'h0):(1'h0)] : wire18[(4'h8):(3'h5)]) : {($signed((reg26 ?
                      wire22 : wire30)) ?
                  ((^wire33) ? wire18 : reg34[(4'hf):(3'h4)]) : wire28)}))
        begin
          if ($signed(($signed($unsigned({reg34,
              (8'hb2)})) && ($signed(reg24[(2'h2):(2'h2)]) ?
              (|(wire19 ? wire22 : wire28)) : (!reg34)))))
            begin
              reg36 <= (~wire19[(1'h0):(1'h0)]);
              reg37 <= (~&(8'hb6));
            end
          else
            begin
              reg36 <= $unsigned(wire31);
              reg37 <= $unsigned({$signed(($signed(reg35) ?
                      wire29[(2'h3):(2'h3)] : (wire30 ? reg37 : reg24))),
                  $unsigned(($unsigned(reg25) ? (-(8'hbe)) : (~reg26)))});
              reg38 <= $signed((-$unsigned((reg25 > (|reg24)))));
              reg39 <= wire19;
              reg40 <= $unsigned(reg38[(3'h4):(3'h4)]);
            end
        end
      else
        begin
          reg36 <= $signed(($unsigned(reg35) ? wire21[(3'h5):(1'h1)] : wire31));
          reg37 <= $signed($signed($signed((^reg39))));
          reg38 <= (8'haa);
        end
    end
  assign wire41 = wire18[(4'ha):(3'h5)];
  assign wire42 = $signed($unsigned(wire21));
  assign wire43 = {wire32, (8'hb9)};
  assign wire44 = ($signed(wire43[(2'h3):(2'h3)]) ?
                      (reg23 ?
                          {(wire19 ? (reg35 * wire29) : $signed(wire19)),
                              (+$unsigned(wire31))} : (reg34 ^ wire18[(4'h8):(3'h7)])) : ((8'ha5) ?
                          $signed(reg38[(3'h4):(1'h0)]) : (reg26[(3'h5):(1'h1)] ?
                              wire19 : $unsigned(wire20[(1'h0):(1'h0)]))));
  assign wire45 = reg39[(4'h8):(1'h1)];
  assign wire46 = reg40[(1'h1):(1'h0)];
  assign wire47 = {$unsigned(wire33[(3'h4):(1'h0)]),
                      ((&(~^$signed((8'hb9)))) ?
                          reg24 : $signed($signed((reg39 < reg39))))};
endmodule

module module242  (y, clk, wire246, wire245, wire244, wire243);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire246;
  input wire [(3'h4):(1'h0)] wire245;
  input wire signed [(4'hb):(1'h0)] wire244;
  input wire [(5'h13):(1'h0)] wire243;
  wire [(4'hc):(1'h0)] wire284;
  wire signed [(4'ha):(1'h0)] wire283;
  wire [(5'h12):(1'h0)] wire267;
  wire signed [(5'h15):(1'h0)] wire266;
  wire signed [(4'h9):(1'h0)] wire262;
  wire [(5'h15):(1'h0)] wire261;
  wire signed [(3'h6):(1'h0)] wire260;
  wire signed [(5'h10):(1'h0)] wire259;
  wire signed [(4'hd):(1'h0)] wire258;
  wire signed [(5'h15):(1'h0)] wire257;
  wire signed [(2'h3):(1'h0)] wire250;
  wire signed [(2'h2):(1'h0)] wire249;
  wire [(2'h3):(1'h0)] wire248;
  wire [(4'hf):(1'h0)] wire247;
  reg [(2'h2):(1'h0)] reg282 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg281 = (1'h0);
  reg [(5'h15):(1'h0)] reg280 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg279 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg278 = (1'h0);
  reg [(4'h9):(1'h0)] reg277 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg276 = (1'h0);
  reg [(3'h4):(1'h0)] reg275 = (1'h0);
  reg [(3'h6):(1'h0)] reg274 = (1'h0);
  reg [(5'h15):(1'h0)] reg273 = (1'h0);
  reg [(3'h4):(1'h0)] reg272 = (1'h0);
  reg [(4'hd):(1'h0)] reg271 = (1'h0);
  reg [(4'h9):(1'h0)] reg270 = (1'h0);
  reg [(4'hb):(1'h0)] reg269 = (1'h0);
  reg [(5'h15):(1'h0)] reg268 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg265 = (1'h0);
  reg [(2'h2):(1'h0)] reg264 = (1'h0);
  reg [(4'ha):(1'h0)] reg263 = (1'h0);
  reg [(5'h12):(1'h0)] reg256 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg255 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg254 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg253 = (1'h0);
  reg [(3'h4):(1'h0)] reg252 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg251 = (1'h0);
  assign y = {wire284,
                 wire283,
                 wire267,
                 wire266,
                 wire262,
                 wire261,
                 wire260,
                 wire259,
                 wire258,
                 wire257,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg265,
                 reg264,
                 reg263,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 (1'h0)};
  assign wire247 = (wire245 <<< ({wire244[(2'h3):(2'h2)]} ?
                       ({$signed((8'h9c))} * $signed($signed(wire246))) : (8'h9d)));
  assign wire248 = wire244[(4'hb):(4'h8)];
  assign wire249 = (7'h43);
  assign wire250 = (~&wire249[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg251 <= wire244[(4'h9):(2'h3)];
      reg252 <= ((wire250[(1'h1):(1'h1)] ^ wire244[(3'h6):(2'h2)]) ~^ wire244);
      reg253 <= reg251;
      if (reg251[(3'h4):(3'h4)])
        begin
          if (wire246)
            begin
              reg254 <= ({reg253} ^ wire249);
            end
          else
            begin
              reg254 <= (wire243[(3'h5):(3'h5)] >> ((&($unsigned(wire248) ?
                  (wire248 + reg254) : $signed((8'h9f)))) * (~wire249)));
              reg255 <= ($unsigned($unsigned(wire249)) && (reg252[(2'h3):(2'h2)] ?
                  {(reg253 + reg252),
                      $unsigned($signed(wire246))} : {(~|{(8'ha8)}), wire244}));
            end
          reg256 <= $unsigned(((reg253 ?
              wire244 : {$signed(wire250),
                  (^reg252)}) != (((wire245 ^~ (8'hbb)) ^ wire247[(4'h9):(1'h1)]) <= ({wire246,
              wire246} + $unsigned(wire245)))));
        end
      else
        begin
          reg254 <= {({reg256[(5'h11):(4'ha)],
                  wire249} < wire249[(1'h0):(1'h0)])};
          reg255 <= (wire248[(1'h0):(1'h0)] ?
              ($signed($unsigned((8'ha0))) >>> wire246) : {reg253[(4'hb):(2'h2)],
                  (~^reg253[(3'h7):(3'h5)])});
          reg256 <= ((8'ha1) ? (&reg254) : wire248[(2'h2):(2'h2)]);
        end
    end
  assign wire257 = $signed((8'ha3));
  assign wire258 = ($unsigned(wire249) < ((~($unsigned(wire243) ?
                       wire248 : (reg251 < wire248))) != (~reg253[(4'ha):(4'h8)])));
  assign wire259 = ((^(reg252 & $unsigned({wire249}))) ^ $signed(($signed(wire246) & $signed(wire246[(1'h1):(1'h1)]))));
  assign wire260 = wire243[(4'he):(2'h2)];
  assign wire261 = $unsigned(reg255);
  assign wire262 = (($unsigned(wire248) ?
                       reg253[(3'h4):(2'h2)] : (wire245[(1'h0):(1'h0)] ?
                           $signed(((8'hb4) || wire261)) : $unsigned(reg252))) < wire260);
  always
    @(posedge clk) begin
      if (((8'haa) && wire243[(5'h12):(1'h0)]))
        begin
          if ($signed(wire245))
            begin
              reg263 <= (wire243 ?
                  wire245[(3'h4):(2'h2)] : reg255[(1'h0):(1'h0)]);
              reg264 <= $signed(((~|($signed(wire259) ?
                  wire250[(1'h0):(1'h0)] : reg256)) ^~ {((~wire244) ?
                      {wire250} : (wire245 ? wire260 : (7'h44))),
                  (^~(~^reg254))}));
              reg265 <= $signed((~^reg251));
            end
          else
            begin
              reg263 <= $unsigned(wire259[(3'h6):(1'h1)]);
              reg264 <= {(wire258[(2'h2):(1'h0)] == ($signed($unsigned(reg255)) >= ($unsigned(wire243) ?
                      {wire245} : (wire258 ? wire245 : wire248)))),
                  (7'h42)};
              reg265 <= wire246;
            end
        end
      else
        begin
          reg263 <= ($unsigned((reg265 ?
                  ($unsigned(reg255) ?
                      wire249 : (wire261 ? reg264 : (8'hb1))) : reg251)) ?
              (!$unsigned($signed((reg252 ?
                  wire258 : wire244)))) : ((($unsigned(reg264) <<< (wire257 ?
                          wire244 : reg265)) ?
                      {(wire244 ? (8'hb6) : wire257)} : ({reg255,
                          wire257} == (reg252 ? (8'ha8) : wire258))) ?
                  $signed(wire243[(3'h6):(2'h3)]) : $unsigned(wire245[(1'h0):(1'h0)])));
        end
    end
  assign wire266 = $unsigned(((8'hb5) * wire248));
  assign wire267 = {$unsigned((wire247[(4'h8):(3'h4)] <= ($signed(wire258) ?
                           (wire261 ? reg251 : reg256) : (|wire259))))};
  always
    @(posedge clk) begin
      if ($signed($unsigned($signed($signed((~^reg256))))))
        begin
          reg268 <= ($signed($unsigned({(reg265 ?
                  wire262 : reg255)})) << reg252[(1'h0):(1'h0)]);
          if (reg265)
            begin
              reg269 <= reg253[(4'hc):(4'hb)];
              reg270 <= (((8'hb4) ?
                      (&wire246[(2'h2):(1'h1)]) : wire258[(4'hd):(3'h5)]) ?
                  reg269 : reg253);
            end
          else
            begin
              reg269 <= wire243;
            end
        end
      else
        begin
          reg268 <= ($signed($signed({(wire248 ~^ reg253), $signed(reg255)})) ?
              {(~($signed(reg264) ?
                      (reg256 ? wire250 : reg255) : $unsigned(wire262))),
                  $signed((&$unsigned(wire245)))} : (^(+wire260)));
          reg269 <= ($signed((((wire260 <= reg255) ?
                  wire246[(2'h3):(2'h3)] : (reg268 != wire245)) ?
              ($signed(wire260) ?
                  (reg256 ?
                      (8'hac) : reg268) : reg256[(5'h10):(1'h1)]) : wire246)) && (8'ha8));
          reg270 <= (reg255[(4'hf):(4'hb)] & {($signed((reg269 != wire260)) ?
                  $signed((reg254 ? wire262 : wire259)) : (reg263 ?
                      ((7'h42) ? wire260 : wire259) : (reg254 <= reg265)))});
        end
      reg271 <= (wire246 >>> reg265);
      if (reg255)
        begin
          reg272 <= $signed((wire245[(1'h0):(1'h0)] ?
              ((^(reg265 ? reg254 : wire249)) == $unsigned((wire243 ?
                  wire266 : (8'ha3)))) : (~&wire250)));
          reg273 <= wire266;
          reg274 <= $unsigned(((~wire266) <= $unsigned($unsigned((~&reg268)))));
          reg275 <= wire250[(2'h3):(1'h1)];
        end
      else
        begin
          reg272 <= reg256[(4'ha):(3'h5)];
          reg273 <= reg253;
          if ($signed($signed(reg265)))
            begin
              reg274 <= reg264[(1'h1):(1'h0)];
              reg275 <= reg256;
              reg276 <= (((&$signed($unsigned(wire262))) > $signed($signed((~wire261)))) & (reg254[(2'h2):(2'h2)] ?
                  $signed((~((8'haa) ~^ (8'hb5)))) : wire260));
              reg277 <= (!$signed(wire266));
              reg278 <= $signed((8'hb7));
            end
          else
            begin
              reg274 <= wire259;
              reg275 <= reg269[(3'h5):(3'h4)];
              reg276 <= ($signed((^~($signed(reg251) & {reg253,
                  reg272}))) > (|reg253[(3'h5):(1'h1)]));
            end
          reg279 <= wire246[(2'h3):(2'h2)];
          reg280 <= ((($unsigned((&wire248)) && ($signed((8'hbe)) - $signed(reg277))) >> wire246[(2'h3):(1'h0)]) ^~ $unsigned({$unsigned((reg265 == reg275))}));
        end
      reg281 <= $unsigned((wire260[(3'h6):(2'h2)] > $signed((((8'hb8) ?
              wire266 : (7'h41)) ?
          $unsigned(wire266) : (wire261 << wire261)))));
      reg282 <= wire260;
    end
  assign wire283 = $signed(((reg281[(4'h9):(2'h2)] ?
                       $signed($signed(reg274)) : reg253[(4'h8):(3'h7)]) << (+$signed((reg254 | (8'ha1))))));
  assign wire284 = ($signed($signed($signed((7'h40)))) > reg274);
endmodule

module module181  (y, clk, wire185, wire184, wire183, wire182);
  output wire [(32'h1d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire185;
  input wire signed [(3'h5):(1'h0)] wire184;
  input wire [(3'h4):(1'h0)] wire183;
  input wire signed [(4'he):(1'h0)] wire182;
  wire signed [(4'hc):(1'h0)] wire223;
  wire signed [(3'h6):(1'h0)] wire222;
  wire [(4'hc):(1'h0)] wire221;
  wire signed [(4'he):(1'h0)] wire220;
  wire [(5'h14):(1'h0)] wire219;
  wire signed [(4'hc):(1'h0)] wire218;
  wire [(2'h2):(1'h0)] wire217;
  wire [(5'h15):(1'h0)] wire216;
  wire [(4'ha):(1'h0)] wire215;
  wire signed [(5'h13):(1'h0)] wire199;
  wire [(4'hb):(1'h0)] wire198;
  wire [(3'h6):(1'h0)] wire197;
  wire signed [(4'h8):(1'h0)] wire196;
  wire [(3'h7):(1'h0)] wire195;
  wire signed [(4'hd):(1'h0)] wire194;
  wire [(4'h8):(1'h0)] wire193;
  wire signed [(5'h11):(1'h0)] wire189;
  wire [(5'h11):(1'h0)] wire188;
  wire signed [(4'ha):(1'h0)] wire187;
  wire [(5'h12):(1'h0)] wire186;
  reg [(5'h12):(1'h0)] reg214 = (1'h0);
  reg [(4'ha):(1'h0)] reg213 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg212 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg211 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg210 = (1'h0);
  reg [(4'hf):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg208 = (1'h0);
  reg [(5'h10):(1'h0)] reg207 = (1'h0);
  reg [(5'h11):(1'h0)] reg206 = (1'h0);
  reg [(5'h12):(1'h0)] reg205 = (1'h0);
  reg [(4'h8):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg203 = (1'h0);
  reg [(3'h5):(1'h0)] reg202 = (1'h0);
  reg [(5'h15):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg200 = (1'h0);
  reg [(3'h6):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg190 = (1'h0);
  assign y = {wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 reg214,
                 reg213,
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
                 reg192,
                 reg191,
                 reg190,
                 (1'h0)};
  assign wire186 = (!wire183);
  assign wire187 = (($signed($signed($signed(wire185))) < wire183) ?
                       $unsigned(wire185) : $unsigned(wire182));
  assign wire188 = ((wire184 ?
                           ($signed($signed((8'hb8))) ?
                               ((&wire184) ?
                                   (~wire184) : (wire187 ~^ wire187)) : $signed(wire186[(3'h4):(3'h4)])) : (^$unsigned((~|(8'ha7))))) ?
                       $unsigned($unsigned($unsigned((wire182 && wire182)))) : (&(|(^(wire186 > wire186)))));
  assign wire189 = $unsigned(wire185[(4'h8):(3'h7)]);
  always
    @(posedge clk) begin
      reg190 <= $signed(($signed(wire185) < (^(^(wire188 ?
          wire189 : wire188)))));
      reg191 <= (+($unsigned({$unsigned(reg190)}) ?
          {$signed((|wire188))} : wire186[(4'he):(3'h4)]));
      reg192 <= (~|wire182[(4'h8):(2'h2)]);
    end
  assign wire193 = (~|$unsigned($signed($signed($signed(reg192)))));
  assign wire194 = $signed((wire188 ?
                       wire189 : $signed($unsigned((wire183 ?
                           (8'hae) : wire187)))));
  assign wire195 = ({(~|((!wire186) || ((8'h9d) && wire193))),
                           ($signed($signed(wire182)) ^~ $signed(reg191[(4'h8):(4'h8)]))} ?
                       (wire186 ? wire194 : (8'hbf)) : (&{wire193,
                           ((^wire184) ? (^reg191) : {wire184})}));
  assign wire196 = $signed($signed({(8'ha9)}));
  assign wire197 = ($unsigned(wire194[(4'hc):(4'h9)]) >= $signed({$signed((-wire186))}));
  assign wire198 = ((~wire189[(3'h7):(3'h4)]) ^~ (!($unsigned((wire187 ?
                       wire196 : reg192)) != wire193[(1'h1):(1'h0)])));
  assign wire199 = ($unsigned(wire189) | {wire193});
  always
    @(posedge clk) begin
      if ({((+$unsigned($unsigned(wire188))) ? $signed({wire186}) : wire182)})
        begin
          if ($signed({(wire193 ?
                  (wire193[(3'h7):(1'h0)] ?
                      ((8'hb9) ?
                          (8'hbf) : (8'hbe)) : (-wire194)) : ($unsigned(wire198) ?
                      $signed(wire184) : (wire182 ? wire183 : wire182)))}))
            begin
              reg200 <= (({(^~wire196), wire182} || (|wire183[(1'h0):(1'h0)])) ?
                  (((8'ha7) | reg192[(3'h5):(1'h0)]) ?
                      (((&wire196) * (wire182 ? wire186 : reg191)) ?
                          wire193[(4'h8):(1'h1)] : wire186) : $signed(((wire193 ?
                          reg190 : (8'ha1)) >= wire194))) : {$unsigned($signed(reg191))});
              reg201 <= wire188[(4'h9):(3'h5)];
              reg202 <= {wire183[(1'h1):(1'h0)]};
            end
          else
            begin
              reg200 <= (~&((($unsigned(reg192) ?
                      (wire195 ? wire193 : wire188) : (wire198 - reg202)) ?
                  $unsigned(wire189) : ((wire183 ^~ wire195) ?
                      $signed(wire197) : $signed(reg192))) | $unsigned((~|(reg190 >= wire189)))));
              reg201 <= (~&($unsigned(reg202[(3'h5):(2'h2)]) > {((wire193 > wire187) ?
                      (wire183 ? reg200 : wire196) : $signed(wire186))}));
              reg202 <= reg201[(2'h3):(2'h3)];
              reg203 <= ($signed((+(-$signed(reg190)))) * reg191);
            end
          reg204 <= wire182;
          reg205 <= (^wire196);
          reg206 <= wire199;
          reg207 <= reg200;
        end
      else
        begin
          reg200 <= reg191;
        end
      reg208 <= $signed((reg191[(4'h8):(3'h4)] * $signed(reg200[(4'he):(2'h2)])));
      reg209 <= $unsigned($signed($signed((^~$unsigned(wire197)))));
      if (($signed({$unsigned(wire198), $signed((~|(8'hbc)))}) ~^ ((|reg190) ?
          wire186[(4'he):(3'h5)] : ($unsigned((!reg190)) * reg200))))
        begin
          reg210 <= (&$unsigned(wire186[(4'h8):(4'h8)]));
          reg211 <= ({(8'h9f)} ?
              $unsigned($signed(($signed((8'hb3)) != ((8'h9f) & reg201)))) : $signed((!$signed($signed(reg203)))));
          reg212 <= reg207[(4'hc):(1'h1)];
        end
      else
        begin
          if (((~$unsigned((~^(wire189 >>> reg191)))) ?
              (-reg192[(2'h3):(1'h1)]) : $signed(wire184)))
            begin
              reg210 <= (((~wire196) ?
                      (+(wire196[(3'h6):(2'h2)] ?
                          (reg203 ? wire194 : (8'hb7)) : reg208)) : reg204) ?
                  (reg210[(4'ha):(1'h1)] * {($unsigned(wire186) ^~ (reg211 ?
                          reg200 : reg205))}) : wire189);
              reg211 <= $signed(((7'h42) ^~ (~|((reg208 ? reg205 : reg203) ?
                  (~&reg201) : (~^wire186)))));
              reg212 <= $signed(($unsigned(reg211[(1'h1):(1'h1)]) ?
                  {{$unsigned(reg192)}} : reg208[(4'h8):(3'h7)]));
              reg213 <= (8'h9d);
            end
          else
            begin
              reg210 <= wire182[(3'h7):(2'h3)];
              reg211 <= (&$signed((~|(((7'h44) & (8'hab)) || $signed(reg212)))));
              reg212 <= wire199;
              reg213 <= $unsigned((^~(wire187[(1'h0):(1'h0)] ?
                  reg208[(2'h2):(1'h1)] : (!$unsigned(reg206)))));
            end
          reg214 <= $signed((wire193 ?
              $unsigned($signed((reg201 == reg200))) : (({(8'ha0)} ?
                  wire187[(1'h0):(1'h0)] : (reg200 | reg211)) < (~&(-reg207)))));
        end
    end
  assign wire215 = (&(reg207[(2'h2):(1'h1)] ?
                       $unsigned((8'hb3)) : $signed(({reg192} > (^~reg206)))));
  assign wire216 = $signed(($unsigned((reg207[(4'h9):(3'h6)] & {reg201,
                       wire188})) <= (((reg190 <= reg191) >= reg200) * reg191)));
  assign wire217 = reg190[(4'ha):(2'h2)];
  assign wire218 = $unsigned(({$signed({reg209}), (+$signed((7'h44)))} ?
                       $signed($signed((wire182 < wire216))) : wire217));
  assign wire219 = reg206;
  assign wire220 = ($unsigned($signed(reg211[(3'h6):(2'h3)])) ?
                       $signed((~&(~|(~reg204)))) : (({(~reg214),
                           ((8'hb1) ?
                               wire188 : (7'h43))} >= $signed(reg192[(1'h0):(1'h0)])) && (wire218 ?
                           $signed((reg191 + reg192)) : wire215[(4'h8):(2'h3)])));
  assign wire221 = {($signed((|reg212[(1'h0):(1'h0)])) ?
                           $unsigned(wire184[(2'h3):(1'h1)]) : (8'hb8)),
                       $unsigned(reg192)};
  assign wire222 = $signed({reg213});
  assign wire223 = wire216;
endmodule
