module top
#(parameter param221 = (&((({(8'ha9), (8'hb7)} << ((8'ha7) << (8'h9e))) && (((8'hb2) << (8'ha8)) ^ ((8'hbc) >> (8'hae)))) + ((~^((8'had) ? (8'h9c) : (8'h9d))) ? ((-(8'ha8)) ^ (|(8'hab))) : {((8'hb1) >>> (8'hac))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire220;
  wire signed [(5'h11):(1'h0)] wire219;
  wire signed [(3'h6):(1'h0)] wire218;
  wire [(5'h15):(1'h0)] wire200;
  wire signed [(5'h10):(1'h0)] wire199;
  wire signed [(4'h8):(1'h0)] wire198;
  wire [(4'hb):(1'h0)] wire197;
  wire [(4'hf):(1'h0)] wire196;
  wire [(4'ha):(1'h0)] wire194;
  wire signed [(5'h10):(1'h0)] wire193;
  wire [(5'h12):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire190;
  reg signed [(4'hd):(1'h0)] reg217 = (1'h0);
  reg [(5'h10):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg215 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg214 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg213 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg211 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg210 = (1'h0);
  reg [(3'h7):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg208 = (1'h0);
  reg [(5'h12):(1'h0)] reg207 = (1'h0);
  reg [(3'h5):(1'h0)] reg206 = (1'h0);
  reg [(5'h10):(1'h0)] reg205 = (1'h0);
  reg [(4'hf):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg203 = (1'h0);
  reg [(2'h2):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg201 = (1'h0);
  reg signed [(4'he):(1'h0)] reg192 = (1'h0);
  assign y = {wire220,
                 wire219,
                 wire218,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire194,
                 wire193,
                 wire65,
                 wire190,
                 reg217,
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
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg192,
                 (1'h0)};
  module4 #() modinst66 (wire65, clk, wire3, wire2, wire0, wire1, (8'hba));
  module67 #() modinst191 (wire190, clk, wire1, wire65, wire3, wire2, wire0);
  always
    @(posedge clk) begin
      reg192 <= $unsigned(wire65[(3'h7):(3'h7)]);
    end
  assign wire193 = wire3;
  module67 #() modinst195 (.clk(clk), .y(wire194), .wire68(reg192), .wire71(wire190), .wire70(wire1), .wire72(wire0), .wire69(wire2));
  assign wire196 = (!wire3);
  assign wire197 = reg192;
  assign wire198 = $unsigned(wire0);
  assign wire199 = {reg192[(4'h8):(2'h3)],
                       (~^({wire0} ^~ (wire196 >> (8'hbf))))};
  assign wire200 = $unsigned({wire199[(3'h6):(2'h2)],
                       {{$unsigned(wire196), (~(8'h9f))},
                           reg192[(4'ha):(4'h8)]}});
  always
    @(posedge clk) begin
      if ($unsigned((+(~&(reg192 ?
          (wire193 ? wire3 : wire200) : (wire200 || wire3))))))
        begin
          reg201 <= ({$signed(wire0[(4'h8):(3'h5)]),
              (~|wire190[(3'h5):(1'h1)])} ^ $unsigned(($signed($signed(wire200)) ?
              (wire198 ?
                  wire196 : $unsigned((8'had))) : $signed(((8'hbc) != wire198)))));
          reg202 <= ($signed($unsigned(wire3[(5'h10):(3'h6)])) ?
              $signed(wire196[(4'hd):(3'h4)]) : $unsigned(($unsigned(wire65[(5'h11):(1'h0)]) - wire65)));
          reg203 <= wire3[(1'h0):(1'h0)];
          if ({(wire193 ? reg192 : wire198)})
            begin
              reg204 <= ($signed((&$unsigned(reg192))) <<< (|(~|(wire200[(4'h9):(2'h3)] ^ $signed(wire198)))));
              reg205 <= (^(wire199[(2'h3):(1'h0)] == reg203));
              reg206 <= $signed(({{wire194, {reg205}},
                  ($signed(wire196) <= (!wire65))} & $signed((-$signed(wire198)))));
              reg207 <= (((wire197 ?
                      $signed((reg202 != reg201)) : (~|$unsigned(reg202))) <= (~&(8'ha8))) ?
                  {wire0, $signed(reg206)} : ((~&$signed({(8'haf),
                      reg206})) ^~ wire196));
            end
          else
            begin
              reg204 <= $signed($signed($unsigned($unsigned((wire65 ?
                  (8'hb5) : reg205)))));
              reg205 <= wire199[(4'hf):(4'hf)];
            end
        end
      else
        begin
          reg201 <= $unsigned(((((reg207 ^ reg192) && $signed(wire199)) ?
                  (~^reg207[(4'hd):(4'ha)]) : (-(reg206 && wire3))) ?
              reg206[(2'h2):(1'h1)] : $signed($signed(((8'hbd) >>> wire65)))));
        end
      if ($unsigned(({wire197[(1'h0):(1'h0)]} <<< wire193)))
        begin
          if (($unsigned({(^{reg202}), $signed($signed(wire198))}) ?
              ($signed($signed(((8'had) <= (8'ha4)))) && reg204[(4'ha):(1'h1)]) : (&{($unsigned(reg206) >= $unsigned(wire0)),
                  $unsigned($unsigned((8'h9d)))})))
            begin
              reg208 <= (({$signed((wire190 || wire193))} ?
                      ($unsigned(wire3) >> (|(wire1 + reg202))) : {(!wire65),
                          wire199[(3'h6):(2'h2)]}) ?
                  ($unsigned(reg207[(5'h12):(5'h10)]) > wire3[(5'h10):(4'hb)]) : $signed((~^((~|wire1) >>> wire194))));
              reg209 <= $signed(wire194[(3'h6):(2'h3)]);
            end
          else
            begin
              reg208 <= $signed((-$signed($unsigned(wire196[(3'h7):(2'h3)]))));
              reg209 <= (({(&$signed(reg205)),
                      ((~wire199) ? ((8'ha8) ? reg204 : wire2) : (~^wire1))} ?
                  (($signed(wire190) >> (wire197 ? wire198 : reg206)) ?
                      $signed((reg202 ?
                          reg192 : reg202)) : $signed(wire2)) : (-(wire0[(4'h9):(4'h8)] || reg209))) + (((8'h9c) ?
                  {$signed(reg206),
                      (reg207 ?
                          wire1 : wire197)} : wire197) <<< wire197[(3'h4):(3'h4)]));
            end
          reg210 <= {($unsigned($unsigned((~^reg205))) < reg202),
              $unsigned({{wire0[(4'h9):(4'h9)]}})};
          reg211 <= ($unsigned((!$signed(wire200))) ^ wire65[(4'hf):(4'ha)]);
          reg212 <= $signed(((~&(~|reg207[(4'hd):(3'h7)])) < {reg206[(3'h4):(3'h4)]}));
          reg213 <= ($signed(wire198) ?
              (($unsigned($signed(reg211)) == (((8'hb2) * wire199) & (wire196 ?
                      (8'hb9) : reg210))) ?
                  (~((reg212 ? reg209 : (7'h40)) ?
                      (~wire196) : (reg205 ?
                          reg206 : reg208))) : $unsigned(({wire0, reg192} ?
                      (&wire193) : reg205))) : $signed((~&reg209[(1'h1):(1'h0)])));
        end
      else
        begin
          reg208 <= (7'h40);
          reg209 <= wire199[(3'h7):(1'h1)];
          if ($signed($unsigned(((8'hab) ?
              ({(8'h9c)} ?
                  (!reg211) : $unsigned(wire197)) : (reg213[(2'h3):(2'h3)] ^ (reg210 ?
                  wire190 : wire197))))))
            begin
              reg210 <= reg204;
              reg211 <= (reg209[(1'h0):(1'h0)] * ($signed((~^reg213[(3'h4):(1'h1)])) < wire65[(2'h3):(1'h1)]));
            end
          else
            begin
              reg210 <= ((~|(|$signed($signed(reg192)))) ?
                  reg210[(1'h1):(1'h1)] : $signed((((wire197 ^ wire194) ?
                          wire197 : $unsigned(wire198)) ?
                      $unsigned(reg204) : $signed(wire0[(3'h5):(1'h0)]))));
              reg211 <= $signed(wire2[(3'h5):(1'h1)]);
              reg212 <= reg209;
            end
          reg213 <= reg203;
          reg214 <= reg212[(1'h0):(1'h0)];
        end
      reg215 <= $signed($unsigned($unsigned({wire65[(4'hb):(2'h3)]})));
      reg216 <= {$unsigned((8'hb6))};
      reg217 <= wire196;
    end
  assign wire218 = $unsigned(({(+$unsigned(reg202)),
                           (reg192[(2'h3):(2'h3)] - $signed(reg215))} ?
                       {$unsigned($signed(reg210))} : {(^(wire3 ^~ reg204))}));
  assign wire219 = $signed({reg202[(2'h2):(1'h1)], reg204[(3'h4):(2'h3)]});
  assign wire220 = $signed((((wire194 ?
                       (-wire3) : wire219[(3'h4):(2'h3)]) - $unsigned(reg215[(2'h3):(2'h3)])) & (wire219 || $signed({wire197}))));
endmodule

module module67  (y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire72;
  input wire [(3'h6):(1'h0)] wire71;
  input wire signed [(5'h15):(1'h0)] wire70;
  input wire signed [(5'h10):(1'h0)] wire69;
  input wire signed [(4'he):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire189;
  wire [(3'h4):(1'h0)] wire183;
  wire [(5'h10):(1'h0)] wire182;
  wire signed [(5'h15):(1'h0)] wire181;
  wire signed [(4'hf):(1'h0)] wire180;
  wire signed [(5'h13):(1'h0)] wire179;
  wire [(5'h15):(1'h0)] wire178;
  wire [(4'he):(1'h0)] wire177;
  wire [(2'h3):(1'h0)] wire176;
  wire [(4'hf):(1'h0)] wire114;
  wire signed [(2'h3):(1'h0)] wire174;
  reg signed [(4'hb):(1'h0)] reg188 = (1'h0);
  reg [(3'h5):(1'h0)] reg187 = (1'h0);
  reg [(4'he):(1'h0)] reg186 = (1'h0);
  reg [(4'hb):(1'h0)] reg185 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg184 = (1'h0);
  assign y = {wire189,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire114,
                 wire174,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 (1'h0)};
  module73 #() modinst115 (.clk(clk), .wire77(wire70), .wire76(wire72), .wire78(wire71), .wire74(wire69), .y(wire114), .wire75(wire68));
  module116 #() modinst175 (.wire119(wire70), .wire121(wire69), .wire117(wire72), .clk(clk), .wire120(wire114), .y(wire174), .wire118(wire68));
  assign wire176 = wire114[(4'h8):(1'h1)];
  assign wire177 = wire69[(2'h2):(2'h2)];
  assign wire178 = wire71[(3'h5):(1'h0)];
  assign wire179 = ($signed((wire68[(2'h3):(2'h3)] ?
                           wire69 : wire178[(4'hd):(4'hc)])) ?
                       $unsigned($signed($unsigned((|wire114)))) : ((~$unsigned(wire174[(1'h1):(1'h0)])) ?
                           (($unsigned(wire68) < wire70) ?
                               {$unsigned(wire176),
                                   $signed(wire177)} : ($unsigned((8'haf)) ?
                                   wire70 : wire69)) : $signed($unsigned($signed(wire178)))));
  assign wire180 = (wire69 <= $unsigned({wire179[(4'he):(3'h7)]}));
  assign wire181 = wire70;
  assign wire182 = ((wire176[(2'h3):(2'h2)] > (((~&wire68) ?
                               (-wire69) : (7'h43)) ?
                           ($signed((8'hba)) ?
                               $signed(wire69) : $signed((8'hb7))) : {(!wire180),
                               (-wire71)})) ?
                       (wire71[(2'h2):(1'h0)] || wire177) : (wire180[(3'h5):(1'h0)] != (~^wire69)));
  assign wire183 = wire179;
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($signed(wire180[(4'hc):(4'ha)]))))
        begin
          reg184 <= $signed({(~(8'haf)), (&wire178)});
        end
      else
        begin
          reg184 <= ($signed((((wire69 != wire178) && {wire69, wire114}) ?
                  wire178[(5'h15):(3'h7)] : $unsigned({(8'ha3), wire182}))) ?
              ($unsigned($signed((~|wire179))) ?
                  ($unsigned(wire72) || wire177) : wire178[(5'h11):(5'h11)]) : (wire114[(4'hb):(3'h6)] >= wire69));
          reg185 <= (wire181 ?
              wire180[(3'h7):(1'h0)] : $unsigned({$signed((wire70 ?
                      wire69 : wire69))}));
        end
      reg186 <= $unsigned($signed($signed(wire178)));
      reg187 <= (+$signed({wire181}));
      reg188 <= (^((|{$signed(wire69)}) || $unsigned(((wire114 ?
          wire176 : wire182) * (wire70 != reg184)))));
    end
  assign wire189 = $unsigned(wire72);
endmodule

module module4
#(parameter param64 = (&(&((~|((8'hac) || (8'hbf))) ? ({(8'hbe)} >>> ((8'h9e) ? (8'ha7) : (8'hae))) : {(|(8'hb3)), ((7'h43) << (7'h40))}))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire62;
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  assign y = {wire37,
                 wire39,
                 wire41,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire62,
                 reg40,
                 reg42,
                 reg43,
                 reg44,
                 (1'h0)};
  module10 #() modinst38 (wire37, clk, wire7, wire8, wire9, wire5, wire6);
  assign wire39 = (wire7[(3'h7):(3'h7)] ? wire37 : wire6);
  always
    @(posedge clk) begin
      reg40 <= ($unsigned((8'ha1)) == wire8[(3'h7):(3'h7)]);
    end
  assign wire41 = ((8'hba) ?
                      wire7[(2'h3):(2'h3)] : (wire6 < wire39[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg42 <= ($unsigned($signed((8'ha6))) ?
          ((|wire41) >>> {($unsigned(wire7) ?
                  wire39[(1'h1):(1'h1)] : wire8[(5'h13):(3'h7)]),
              $unsigned((8'ha7))}) : $unsigned(((wire39 || wire41) ?
              ((wire41 << (8'h9d)) ?
                  {wire37} : wire37) : $signed($signed(wire5)))));
      reg43 <= $unsigned(wire41);
      reg44 <= $unsigned((wire9 ?
          (^(!(wire6 + wire39))) : wire6[(4'ha):(3'h4)]));
    end
  assign wire45 = ((~&(8'hbf)) << $unsigned(reg40[(1'h1):(1'h0)]));
  assign wire46 = $signed($unsigned(wire41[(3'h4):(2'h3)]));
  assign wire47 = wire9;
  assign wire48 = ((reg44 || $signed(($unsigned(wire45) ?
                          $signed(wire46) : ((8'hb9) ? wire46 : (8'h9e))))) ?
                      wire37[(1'h1):(1'h1)] : {((((8'haf) ? wire45 : (8'h9d)) ?
                              (wire5 ? wire6 : reg44) : (wire41 ?
                                  wire5 : wire46)) >>> (+$unsigned(reg42))),
                          reg42[(3'h7):(3'h5)]});
  assign wire49 = wire39[(4'h8):(3'h7)];
  module50 #() modinst63 (wire62, clk, wire45, wire6, wire48, reg40);
endmodule

module module50
#(parameter param60 = (8'ha7), 
parameter param61 = param60)
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire54;
  input wire signed [(3'h4):(1'h0)] wire53;
  input wire signed [(5'h12):(1'h0)] wire52;
  input wire signed [(2'h3):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire55;
  assign y = {wire59, wire58, wire57, wire56, wire55, (1'h0)};
  assign wire55 = (^(~&wire52));
  assign wire56 = $signed(wire53[(3'h4):(2'h3)]);
  assign wire57 = wire55[(1'h1):(1'h0)];
  assign wire58 = $signed((~^{($unsigned(wire51) >= $unsigned((8'hb1)))}));
  assign wire59 = ($unsigned((wire55[(4'hc):(4'hc)] ?
                      ((wire57 ^ wire51) ?
                          $unsigned(wire53) : $unsigned(wire52)) : wire54)) >>> $unsigned((~|$signed(wire58[(1'h0):(1'h0)]))));
endmodule

module module10
#(parameter param36 = (^~(!((^~((8'had) ? (8'ha4) : (8'hb1))) || {((8'hb7) ? (8'hb7) : (8'hb7)), {(8'ha6), (7'h44)}}))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'hff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire16;
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg29,
                 (1'h0)};
  assign wire16 = (8'had);
  assign wire17 = $signed(wire13[(2'h3):(2'h2)]);
  assign wire18 = $signed(wire13);
  assign wire19 = (~&(~&(8'hab)));
  assign wire20 = ($signed((((wire11 ? wire19 : wire12) ?
                          $signed(wire17) : wire15) < wire17)) ?
                      {(($unsigned((7'h44)) < wire13) ?
                              ((+wire12) >>> $signed(wire11)) : $signed($unsigned(wire16)))} : {$unsigned($unsigned($unsigned(wire16))),
                          wire18});
  assign wire21 = wire18;
  assign wire22 = wire11[(4'h8):(4'h8)];
  assign wire23 = ((^$signed($unsigned((+wire14)))) ?
                      $signed($unsigned(({wire22,
                          (8'hb9)} >>> $unsigned(wire19)))) : wire14[(5'h13):(4'he)]);
  assign wire24 = {(!wire16)};
  assign wire25 = ($signed((8'ha0)) ?
                      $unsigned((((|wire24) != (wire11 >> wire24)) - {wire11,
                          wire13})) : (~|((!$unsigned(wire13)) ?
                          wire18[(3'h7):(1'h0)] : $signed((~wire11)))));
  assign wire26 = {{wire24[(2'h2):(1'h0)]},
                      ($signed($unsigned($signed(wire25))) | wire18)};
  assign wire27 = wire22;
  assign wire28 = $unsigned({({(wire13 ? wire19 : wire26)} ?
                          {{wire22}} : wire14[(5'h14):(4'he)])});
  always
    @(posedge clk) begin
      reg29 <= {(wire22[(4'hf):(3'h7)] ?
              (wire24[(3'h6):(2'h2)] ?
                  ($unsigned(wire23) ?
                      (~^wire28) : wire14) : ((wire17 << (8'hbf)) ?
                      (8'hb9) : (wire22 * wire13))) : wire17),
          $signed((&$signed((wire20 ? wire17 : wire24))))};
    end
  assign wire30 = $signed($unsigned((~&$signed({wire28, wire22}))));
  assign wire31 = (~(~^($unsigned((wire12 < wire27)) <<< wire25)));
  assign wire32 = $signed((|$unsigned($unsigned((wire27 ? wire28 : wire18)))));
  assign wire33 = ((wire28[(4'h9):(3'h5)] >= (8'h9c)) == (!$signed(wire28)));
  assign wire34 = (+({(~|(wire20 ? (8'hae) : wire17)),
                          $unsigned((reg29 ? wire13 : wire16))} ?
                      $unsigned(((~&(8'h9f)) ^ $signed(wire20))) : {$signed($unsigned(wire22))}));
  assign wire35 = wire32;
endmodule

module module116  (y, clk, wire121, wire120, wire119, wire118, wire117);
  output wire [(32'h299):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire121;
  input wire signed [(4'hf):(1'h0)] wire120;
  input wire signed [(5'h15):(1'h0)] wire119;
  input wire [(2'h3):(1'h0)] wire118;
  input wire signed [(4'hd):(1'h0)] wire117;
  wire signed [(5'h11):(1'h0)] wire173;
  wire [(5'h15):(1'h0)] wire172;
  wire [(5'h12):(1'h0)] wire171;
  wire [(4'h8):(1'h0)] wire170;
  wire [(2'h3):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire152;
  wire signed [(4'he):(1'h0)] wire151;
  wire [(4'hb):(1'h0)] wire150;
  wire [(5'h11):(1'h0)] wire149;
  wire signed [(4'he):(1'h0)] wire148;
  wire signed [(5'h11):(1'h0)] wire147;
  wire [(3'h5):(1'h0)] wire146;
  wire signed [(5'h14):(1'h0)] wire145;
  wire signed [(4'he):(1'h0)] wire144;
  wire [(5'h15):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire123;
  wire [(2'h3):(1'h0)] wire122;
  reg [(4'he):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg165 = (1'h0);
  reg [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(4'hd):(1'h0)] reg163 = (1'h0);
  reg [(5'h12):(1'h0)] reg162 = (1'h0);
  reg [(4'ha):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg160 = (1'h0);
  reg [(2'h3):(1'h0)] reg159 = (1'h0);
  reg [(4'hb):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg156 = (1'h0);
  reg [(4'h9):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(5'h14):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(4'he):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg127 = (1'h0);
  reg [(4'hc):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire171,
                 wire170,
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
                 wire143,
                 wire123,
                 wire122,
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
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
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
                 reg126,
                 reg125,
                 reg124,
                 (1'h0)};
  assign wire122 = (&wire121[(4'h9):(1'h0)]);
  assign wire123 = wire121[(4'hf):(3'h6)];
  always
    @(posedge clk) begin
      if (wire120)
        begin
          reg124 <= wire121[(4'he):(2'h2)];
          if ((|$signed({$unsigned((wire119 ? (8'haf) : wire122))})))
            begin
              reg125 <= wire123[(3'h7):(3'h5)];
              reg126 <= wire120;
              reg127 <= wire117;
              reg128 <= (~wire119);
            end
          else
            begin
              reg125 <= $unsigned($unsigned((wire123 ^ {wire118})));
              reg126 <= wire118[(2'h2):(2'h2)];
              reg127 <= ((^~$unsigned(reg127[(4'h8):(2'h2)])) + wire121);
              reg128 <= (wire118 ?
                  reg125 : $unsigned($signed($unsigned($unsigned(reg128)))));
              reg129 <= (!$signed(($unsigned(wire117) == $unsigned(wire120[(4'hd):(1'h0)]))));
            end
          reg130 <= (~{$signed((((8'ha1) ?
                  wire118 : reg126) || $signed(wire123)))});
        end
      else
        begin
          reg124 <= wire118;
          if ((wire123 - $signed(reg125[(3'h4):(2'h2)])))
            begin
              reg125 <= ((~^$unsigned(reg128[(3'h6):(1'h0)])) - $signed(((wire121 ?
                  $signed((8'ha4)) : reg130) - $signed((reg126 >= wire119)))));
              reg126 <= ($signed((~{$unsigned(wire118),
                  reg125})) << $unsigned((|$unsigned($signed(wire117)))));
              reg127 <= reg127;
              reg128 <= $unsigned($signed({(wire117[(3'h6):(3'h4)] ?
                      (wire121 ? wire119 : reg130) : (reg127 && reg130))}));
              reg129 <= (reg124 ?
                  (reg125[(4'h9):(2'h2)] <= wire119[(5'h13):(4'ha)]) : (reg126 ?
                      (~|$signed((^~reg128))) : $signed(($signed(reg129) >> $unsigned(reg128)))));
            end
          else
            begin
              reg125 <= ((|wire121[(3'h4):(2'h2)]) < ((~($unsigned((8'hb8)) ?
                      (&reg124) : wire119[(5'h14):(5'h11)])) ?
                  (~&(~|reg129)) : $unsigned(reg128)));
              reg126 <= ((~^(reg128[(2'h2):(1'h1)] | reg129)) >> ((reg124[(2'h3):(1'h1)] != ($signed(reg129) ?
                  (reg128 ?
                      wire119 : reg126) : $signed(reg130))) ~^ ((~&(reg130 ?
                      wire119 : (8'ha7))) ?
                  (~(wire121 ^ reg127)) : ((~(8'hb9)) ?
                      (wire118 ? (8'ha9) : reg128) : (reg130 <<< wire119)))));
              reg127 <= (wire122[(1'h1):(1'h0)] == (&$unsigned($signed(reg130[(3'h6):(3'h5)]))));
              reg128 <= ($unsigned((|$unsigned($unsigned(wire117)))) ^ (reg126[(4'h9):(3'h4)] ?
                  wire119 : ($unsigned((wire119 ? wire118 : wire118)) ?
                      $unsigned(wire120[(4'h8):(3'h6)]) : $unsigned($unsigned(wire121)))));
            end
        end
      reg131 <= (^{$unsigned($signed((wire122 ? wire117 : wire120)))});
      reg132 <= $signed($signed(($signed((~&wire118)) ?
          (~$unsigned((7'h44))) : $signed({wire123, reg131}))));
      reg133 <= (^~{($signed(((8'hb3) >> reg125)) - wire122[(2'h3):(1'h0)]),
          reg131[(1'h0):(1'h0)]});
      if ((-{$signed(($signed((8'hb4)) ? $unsigned(reg125) : reg131))}))
        begin
          reg134 <= reg124[(2'h3):(1'h0)];
          reg135 <= {($signed($signed((reg127 << reg127))) ?
                  (($unsigned(wire121) ?
                      (wire119 ?
                          reg127 : (8'hb3)) : $signed(reg128)) * $unsigned(reg134[(1'h1):(1'h1)])) : $signed(reg124))};
          reg136 <= (($signed($signed({reg129,
                  reg127})) < (!(wire118 > (&reg134)))) ?
              $signed(wire119) : reg127[(3'h6):(2'h3)]);
          if ({(({(|reg125), $signed(reg135)} ?
                  $signed((wire118 && wire117)) : (-reg132)) || wire117[(3'h6):(2'h3)]),
              reg134})
            begin
              reg137 <= reg127;
              reg138 <= $signed(($unsigned(reg130[(3'h4):(1'h1)]) ?
                  (&($unsigned((8'ha9)) ?
                      (wire123 * reg125) : {wire119})) : reg129));
              reg139 <= reg134[(2'h3):(1'h0)];
            end
          else
            begin
              reg137 <= wire123;
              reg138 <= $signed($unsigned(reg139[(5'h10):(5'h10)]));
              reg139 <= ((!(reg124 ?
                  wire117 : $signed((~|reg133)))) <<< (reg125[(2'h2):(1'h0)] + $unsigned(((reg127 >>> (8'hb7)) ?
                  reg135[(4'h9):(4'h9)] : $unsigned(reg136)))));
              reg140 <= {reg126, wire121};
              reg141 <= reg138[(1'h0):(1'h0)];
            end
          reg142 <= reg134[(1'h1):(1'h0)];
        end
      else
        begin
          reg134 <= (($unsigned({reg135,
                  (reg141 ? reg125 : wire120)}) && ({(reg142 ?
                          wire118 : reg129)} ?
                  {(reg125 <= wire122)} : ((^~reg136) ?
                      $signed(wire119) : (wire122 >= (8'hbc))))) ?
              (!wire118[(2'h2):(1'h1)]) : $signed((-reg138[(4'hf):(2'h2)])));
        end
    end
  assign wire143 = $signed($unsigned(reg142[(4'he):(3'h6)]));
  assign wire144 = (!reg125);
  assign wire145 = $signed($unsigned(reg126[(3'h5):(1'h0)]));
  assign wire146 = (~|reg130);
  assign wire147 = wire143[(5'h11):(1'h0)];
  assign wire148 = (~{wire143[(3'h7):(2'h3)]});
  assign wire149 = wire120;
  assign wire150 = $unsigned(wire121[(1'h1):(1'h0)]);
  assign wire151 = (({$unsigned((wire121 * reg133)),
                           ($unsigned(wire119) ?
                               (^(8'ha9)) : reg139[(5'h12):(4'hd)])} ?
                       {wire146} : (8'hb9)) >= $signed($unsigned({wire117[(4'ha):(4'h8)],
                       reg124})));
  assign wire152 = {(~|(8'hac))};
  assign wire153 = reg128[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg154 <= $unsigned($unsigned(({reg130} >= (reg124[(1'h1):(1'h1)] ?
          (reg130 * wire151) : reg131))));
      reg155 <= (~^($signed((((8'hae) ?
          reg142 : reg130) * reg130)) != (($signed(wire120) ?
              wire123 : (wire152 ? wire122 : wire123)) ?
          (!(reg128 ? reg132 : wire120)) : reg138)));
      if (wire123[(4'h8):(2'h2)])
        begin
          reg156 <= (($signed(($signed((8'ha9)) ?
                  (reg125 << wire153) : {reg124, wire148})) < {((!wire118) ?
                      (!reg128) : ((8'hae) * reg155)),
                  {(~&wire118)}}) ?
              (wire153[(1'h1):(1'h1)] >= (((&wire152) != reg136) ?
                  wire153 : {wire118[(1'h1):(1'h1)],
                      $unsigned((8'ha0))})) : $unsigned($signed(({wire144,
                      wire149} ?
                  (wire146 ? reg135 : reg132) : (~&wire119)))));
          reg157 <= wire152;
          reg158 <= reg141;
        end
      else
        begin
          if ((reg129[(4'hc):(2'h3)] ?
              $unsigned(((!wire151) ?
                  reg134 : (-(|wire123)))) : $unsigned((($unsigned(reg158) ?
                      $unsigned((8'h9c)) : $unsigned(reg158)) ?
                  $signed((reg138 <= (8'hb3))) : {(reg128 ? reg130 : reg129),
                      $signed(wire147)}))))
            begin
              reg156 <= (((((~^wire143) >> $signed(reg141)) < wire123) & ({wire148[(4'ha):(3'h7)]} ?
                  (~&reg157[(2'h2):(1'h1)]) : wire123[(4'hd):(4'h9)])) != (({wire145[(4'he):(4'ha)],
                  (8'had)} >>> wire150) - reg136[(3'h4):(2'h3)]));
              reg157 <= wire146;
              reg158 <= wire118[(1'h0):(1'h0)];
              reg159 <= reg157[(2'h2):(1'h0)];
              reg160 <= reg141;
            end
          else
            begin
              reg156 <= $signed((reg155[(2'h2):(1'h1)] == $unsigned((&reg131[(1'h0):(1'h0)]))));
              reg157 <= ((~^(!$unsigned($unsigned(wire152)))) ?
                  (wire121 ?
                      ($unsigned((~(8'ha2))) + (reg154[(2'h3):(1'h1)] < $signed((8'hb7)))) : {{$unsigned(reg133),
                              $signed(reg127)}}) : (reg154 & (+$unsigned(wire147[(1'h1):(1'h0)]))));
              reg158 <= (^(&reg154));
              reg159 <= ({wire147, reg125} ?
                  $unsigned(wire122) : $signed(({$signed(reg124),
                          $unsigned(reg137)} ?
                      (8'ha2) : reg124)));
              reg160 <= reg132;
            end
          reg161 <= reg126;
          reg162 <= wire122;
          if (reg162)
            begin
              reg163 <= reg134;
              reg164 <= (|wire119);
            end
          else
            begin
              reg163 <= (($unsigned($signed($unsigned(reg142))) ?
                  reg127 : (^$signed($signed(wire145)))) ~^ $unsigned(reg163));
            end
          reg165 <= (~^{(|reg126)});
        end
      if (reg131)
        begin
          reg166 <= ((^($unsigned(reg124) << ($signed(reg133) < reg157))) ?
              $signed(reg141[(1'h1):(1'h1)]) : (~&(((reg156 ?
                      wire149 : wire118) << (reg134 ? reg129 : wire144)) ?
                  reg138 : ($signed(reg134) ?
                      $unsigned(reg125) : (~|reg162)))));
          reg167 <= (|(reg142[(1'h0):(1'h0)] | (^~((wire146 ^ wire143) == (wire123 - wire148)))));
          reg168 <= (~&(wire152[(1'h1):(1'h1)] == ((reg127[(3'h5):(3'h5)] ?
              wire146[(1'h1):(1'h1)] : reg163[(4'ha):(3'h5)]) || {(reg138 <= reg129),
              ((8'ha1) ? reg161 : reg128)})));
        end
      else
        begin
          reg166 <= (!reg162);
          reg167 <= reg129;
          reg168 <= (~|(8'hb5));
          reg169 <= (((7'h40) << (&$unsigned($signed(wire146)))) ^~ $signed({$signed((reg128 >>> reg140))}));
        end
    end
  assign wire170 = $signed((wire120 ?
                       $unsigned((reg165 ?
                           $signed(wire148) : (reg156 >= reg169))) : ($unsigned((8'hbc)) >>> (!(reg157 - reg133)))));
  assign wire171 = reg157[(2'h2):(1'h1)];
  assign wire172 = ({(reg166 <<< (^((8'ha7) <= reg124)))} > ((reg138[(4'hd):(2'h2)] ?
                       wire171[(4'ha):(4'ha)] : ($signed((8'hb5)) & wire120[(1'h1):(1'h1)])) >> (^$unsigned($signed(reg137)))));
  assign wire173 = (((!{$signed(wire144),
                       $unsigned(reg132)}) < (({reg128} || reg169) ?
                       {(wire146 ?
                               reg164 : wire121)} : {wire148})) <<< (reg154 == ((reg131[(2'h2):(2'h2)] ?
                           $signed(reg135) : $unsigned(reg128)) ?
                       $signed($unsigned(wire151)) : ($signed(reg162) < (reg133 > (8'had))))));
endmodule

module module73
#(parameter param112 = ((~^(~(((7'h43) >= (8'hbb)) ? {(7'h42)} : ((8'ha1) ? (8'ha5) : (7'h44))))) ? {(-(((8'ha8) ? (8'hac) : (8'hb6)) ? ((8'hbd) ? (8'hac) : (8'ha0)) : (!(8'hbe))))} : {(({(8'hbc)} ? (|(8'ha0)) : ((7'h43) | (8'hbb))) ? ({(8'hac)} && (+(8'hb3))) : (((8'h9d) ? (7'h44) : (7'h44)) + ((8'hb8) ? (8'hb7) : (7'h42))))}), 
parameter param113 = ((param112 ^ (param112 && param112)) | param112))
(y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire78;
  input wire [(4'he):(1'h0)] wire77;
  input wire signed [(4'h9):(1'h0)] wire76;
  input wire [(4'he):(1'h0)] wire75;
  input wire signed [(4'hb):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire111;
  wire [(5'h10):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire103;
  wire signed [(5'h11):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire84;
  wire [(3'h4):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire104,
                 wire103,
                 wire99,
                 wire98,
                 wire97,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg102,
                 reg101,
                 reg100,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire79 = (wire76[(1'h1):(1'h1)] && $signed((wire77 << ((wire74 ?
                      (7'h41) : wire74) << wire75[(3'h6):(2'h3)]))));
  assign wire80 = ((8'hbf) <<< ((~&(~|$unsigned(wire74))) ^~ (($unsigned(wire78) ?
                      ((8'ha1) ?
                          (8'hbc) : wire79) : (wire75 >>> wire79)) != $unsigned(wire78))));
  assign wire81 = $signed($signed(wire74[(4'h8):(2'h2)]));
  assign wire82 = (^$signed($unsigned(wire81)));
  assign wire83 = $signed(wire82[(3'h4):(1'h0)]);
  assign wire84 = (($signed(wire82[(4'ha):(1'h1)]) ?
                          $signed($signed(wire78[(1'h0):(1'h0)])) : $unsigned(((wire74 && wire82) ?
                              wire75 : ((8'ha9) >>> (8'ha7))))) ?
                      wire77 : wire81[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire83[(2'h3):(2'h3)])
        begin
          reg85 <= wire84;
          if (({reg85[(1'h1):(1'h0)], (~|(-$signed(wire79)))} || ((^{wire80}) ?
              $signed((~^$unsigned(wire79))) : (((~^(8'ha8)) | {wire83,
                      wire81}) ?
                  (+(reg85 ? (8'ha0) : wire82)) : wire84))))
            begin
              reg86 <= (wire78 ? wire80[(2'h3):(2'h3)] : $unsigned((-wire78)));
              reg87 <= reg86[(5'h11):(3'h6)];
              reg88 <= $signed(($unsigned((~|reg85[(1'h1):(1'h0)])) ?
                  ($signed({wire80, wire76}) * {wire82[(2'h2):(1'h1)],
                      ((8'hab) ? wire76 : (8'had))}) : wire79));
            end
          else
            begin
              reg86 <= wire80;
              reg87 <= ((+wire82[(4'h8):(1'h0)]) || $signed(((+(wire77 >= wire82)) >= wire79[(1'h0):(1'h0)])));
              reg88 <= {(+reg85)};
            end
          reg89 <= (((~$unsigned($unsigned(wire76))) ?
                  (!$unsigned(wire80[(1'h0):(1'h0)])) : $unsigned(((wire74 ?
                          wire74 : wire75) ?
                      {wire78, (8'hb2)} : (|wire80)))) ?
              wire84 : $signed((&reg88)));
          reg90 <= $signed((wire77[(3'h7):(3'h7)] ?
              (wire74 ?
                  $unsigned($signed(wire83)) : $signed($unsigned((8'hbc)))) : (reg87 ?
                  (wire77 >= ((8'hb1) ?
                      reg85 : (8'hb9))) : (reg85[(3'h4):(2'h2)] ~^ (^~wire84)))));
          if (reg85)
            begin
              reg91 <= $signed(wire84[(4'h9):(4'h9)]);
              reg92 <= $signed((^~(^~$unsigned($signed(reg85)))));
            end
          else
            begin
              reg91 <= (reg90 <= wire82[(4'ha):(4'h9)]);
              reg92 <= reg91;
              reg93 <= ({(-((reg91 ^~ reg86) >= (wire79 | reg85)))} << ((reg91 ?
                      $unsigned($signed(reg92)) : wire84) ?
                  {((wire81 ? (8'hb5) : wire82) | {(7'h43)}),
                      ($signed(wire83) != wire78[(3'h5):(3'h4)])} : ((wire76 ?
                      $unsigned((8'hab)) : (wire74 ?
                          (7'h42) : wire83)) || reg91[(4'hb):(4'h9)])));
            end
        end
      else
        begin
          reg85 <= {(wire84[(4'hc):(4'h9)] ^ ((((8'hb0) > wire77) ?
                      reg87 : wire80) ?
                  {wire83, wire81[(2'h3):(1'h0)]} : ((reg91 ?
                      reg85 : reg90) != (~&(8'hb7)))))};
        end
      reg94 <= (|reg91[(5'h11):(3'h5)]);
      reg95 <= wire78;
      reg96 <= wire74[(4'h8):(2'h3)];
    end
  assign wire97 = (reg96 ? wire81 : wire74);
  assign wire98 = ({(~|((wire81 ^~ reg94) ?
                          (wire75 << reg89) : $signed(reg85))),
                      $signed($signed({wire82}))} || (+($signed((reg87 ?
                          wire83 : wire81)) ?
                      wire79[(2'h3):(2'h3)] : (^~(reg89 ? wire75 : wire81)))));
  assign wire99 = wire83;
  always
    @(posedge clk) begin
      reg100 <= ((wire99[(2'h3):(1'h1)] ^~ $signed($signed((reg90 < wire97)))) ?
          (~&(~reg96[(3'h5):(2'h3)])) : reg95);
      reg101 <= $signed(wire76);
      reg102 <= (wire76[(1'h1):(1'h0)] >> $unsigned((reg94[(4'hb):(4'h8)] ^~ reg92)));
    end
  assign wire103 = ($unsigned($unsigned(wire82[(3'h6):(3'h6)])) <<< (wire98[(4'hc):(4'hb)] | ((-$signed(wire81)) ?
                       $unsigned(reg92[(1'h0):(1'h0)]) : ({reg100, (8'hb0)} ?
                           (wire82 != wire76) : wire82))));
  assign wire104 = ((~&(((!reg93) ^~ {reg93,
                       wire79}) + reg89[(3'h4):(3'h4)])) > $signed((^(~&(wire75 + wire83)))));
  always
    @(posedge clk) begin
      reg105 <= (^(reg89 | reg85));
      reg106 <= (reg101 || wire81);
      reg107 <= wire82[(4'h8):(3'h6)];
      reg108 <= wire104[(2'h2):(1'h1)];
    end
  assign wire109 = $unsigned(($signed(reg91) ?
                       {($signed(wire83) ? {reg101} : (~&wire83)),
                           $signed((^wire74))} : wire74));
  assign wire110 = wire76;
  assign wire111 = $signed($unsigned((wire84 ? reg108 : wire84)));
endmodule
