module top
#(parameter param218 = {({(((8'ha3) ? (8'hb7) : (8'h9e)) > ((8'ha5) && (7'h41))), (~|(~^(8'ha7)))} || (({(8'hb1), (8'hbc)} ? (~&(8'h9c)) : ((7'h44) ? (7'h42) : (8'h9e))) ^ (((8'hb1) | (8'hb9)) ? ((8'h9e) != (8'ha7)) : {(8'hb7), (8'hac)})))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire197;
  wire signed [(3'h5):(1'h0)] wire192;
  wire signed [(5'h12):(1'h0)] wire191;
  wire [(2'h3):(1'h0)] wire190;
  wire signed [(4'hb):(1'h0)] wire189;
  wire [(3'h4):(1'h0)] wire188;
  wire signed [(4'hf):(1'h0)] wire187;
  wire signed [(2'h3):(1'h0)] wire186;
  wire signed [(4'hc):(1'h0)] wire185;
  wire [(4'hd):(1'h0)] wire184;
  wire signed [(5'h12):(1'h0)] wire183;
  wire signed [(5'h14):(1'h0)] wire181;
  reg signed [(3'h6):(1'h0)] reg217 = (1'h0);
  reg [(5'h15):(1'h0)] reg216 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg215 = (1'h0);
  reg [(4'hd):(1'h0)] reg214 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg213 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg212 = (1'h0);
  reg [(3'h7):(1'h0)] reg211 = (1'h0);
  reg [(4'h8):(1'h0)] reg210 = (1'h0);
  reg [(5'h12):(1'h0)] reg209 = (1'h0);
  reg [(5'h12):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg207 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg204 = (1'h0);
  reg [(4'hf):(1'h0)] reg203 = (1'h0);
  reg [(4'he):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg201 = (1'h0);
  reg [(4'hc):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg198 = (1'h0);
  reg [(5'h15):(1'h0)] reg196 = (1'h0);
  reg [(4'ha):(1'h0)] reg195 = (1'h0);
  reg [(3'h5):(1'h0)] reg194 = (1'h0);
  assign y = {wire197,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire181,
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
                 reg200,
                 reg199,
                 reg198,
                 reg196,
                 reg195,
                 reg194,
                 (1'h0)};
  module5 #() modinst182 (wire181, clk, wire0, wire2, wire1, wire3);
  assign wire183 = wire181;
  assign wire184 = {(+(((wire181 - wire3) >> (^wire0)) ?
                           wire0[(1'h1):(1'h1)] : wire181)),
                       $signed($unsigned($signed((wire181 | wire183))))};
  assign wire185 = ((&(~(~^$signed(wire2)))) ?
                       wire183 : (((+(wire181 ? wire4 : (8'hab))) || (wire2 ?
                               wire1 : (wire184 || wire3))) ?
                           $signed($signed(wire181)) : ((7'h44) ?
                               $unsigned($unsigned(wire4)) : wire183[(4'h9):(3'h5)])));
  assign wire186 = (((~&($signed(wire1) ?
                           (wire0 >>> wire184) : $unsigned(wire1))) < $signed(((8'hac) && $signed(wire185)))) ?
                       $signed((!wire0)) : (($unsigned((wire181 ?
                           wire184 : wire183)) << (wire185 ?
                           (8'haa) : (wire1 ?
                               wire184 : wire0))) <<< $unsigned($unsigned($unsigned((8'hbd))))));
  assign wire187 = (((&(wire1[(1'h0):(1'h0)] ^ $signed(wire4))) & (|wire185)) ?
                       wire184 : ($signed(((wire2 ?
                           wire185 : (8'haf)) - (|wire2))) ~^ wire4));
  assign wire188 = $signed(wire184);
  assign wire189 = $unsigned((wire181 ?
                       ({$signed(wire2),
                           (wire0 ?
                               wire2 : wire2)} ^~ $signed(wire188[(1'h1):(1'h1)])) : $signed(wire2)));
  assign wire190 = wire189[(3'h6):(1'h0)];
  assign wire191 = (^~(((wire188 >= $unsigned(wire185)) ?
                           $signed((wire181 ?
                               wire181 : wire4)) : ($signed(wire185) * {wire190})) ?
                       {$signed($signed(wire190))} : wire184));
  module72 #() modinst193 (.wire73(wire187), .clk(clk), .wire74(wire191), .wire76(wire186), .y(wire192), .wire75(wire1));
  always
    @(posedge clk) begin
      if (((^({(wire184 + wire188), wire186} ?
          wire186 : ({wire2} ?
              {wire183} : $unsigned(wire191)))) <= {(((~^(8'ha8)) ?
                  wire191[(4'ha):(4'ha)] : $unsigned(wire183)) ?
              ($signed(wire184) - {(8'hb4), wire191}) : ((wire185 ?
                  wire190 : (8'h9e)) ^ ((8'ha6) ? wire4 : wire183)))}))
        begin
          reg194 <= wire3;
        end
      else
        begin
          reg194 <= ($unsigned(($unsigned($unsigned(wire191)) ?
              ($signed((8'h9e)) - $signed(wire185)) : (+wire0[(3'h5):(2'h3)]))) >> (+wire1));
        end
      reg195 <= ((($unsigned($signed(wire189)) - ({wire192} ?
              (+(8'hb5)) : wire192[(2'h3):(2'h2)])) ?
          (^{(-wire2)}) : (((wire192 ?
              wire185 : wire186) <<< wire2[(1'h1):(1'h0)]) ^~ ($unsigned(wire187) & {wire181,
              wire3}))) || wire192);
      reg196 <= wire192;
    end
  assign wire197 = (((^~(((8'ha3) + (8'ha6)) ?
                           (wire184 ?
                               (8'haf) : (8'ha2)) : (wire184 << wire187))) & $signed((+(&(8'h9e))))) ?
                       (wire181 ?
                           {((~|wire4) ? $unsigned(wire188) : (!wire3)),
                               ({(8'had)} ?
                                   $unsigned(wire4) : $unsigned(wire187))} : wire188) : (&wire188));
  always
    @(posedge clk) begin
      if ($unsigned((wire185 ?
          wire188[(2'h3):(2'h2)] : (^~((wire197 ?
              wire188 : (8'hb7)) != (wire0 > wire3))))))
        begin
          reg198 <= (~|(wire190 ?
              (8'hab) : (&((+wire0) <<< (wire4 << wire189)))));
          reg199 <= wire4;
          reg200 <= $unsigned({(^~wire2)});
          reg201 <= $unsigned(wire184[(3'h7):(3'h7)]);
        end
      else
        begin
          reg198 <= wire187;
          reg199 <= ((~&{((wire191 - wire4) ~^ (~wire190)),
                  wire188[(1'h0):(1'h0)]}) ?
              wire197 : (8'ha5));
          reg200 <= (wire2[(2'h2):(1'h1)] ?
              ($signed(wire2[(3'h6):(1'h1)]) ?
                  wire0 : $signed(((wire1 <= wire189) ?
                      (wire1 >= (8'ha7)) : wire188))) : $signed(reg200[(3'h6):(3'h4)]));
        end
      if ((reg196 ? wire185[(2'h2):(1'h1)] : wire4[(1'h0):(1'h0)]))
        begin
          reg202 <= wire188;
          reg203 <= ((^$unsigned($signed((8'ha2)))) ?
              $signed((((|reg194) * $signed(wire192)) ?
                  (8'hab) : {wire183,
                      $unsigned(reg196)})) : (({wire0[(4'ha):(3'h5)],
                          $unsigned(wire3)} ?
                      $signed({wire2, (7'h42)}) : wire3) ?
                  $unsigned((8'hb5)) : $signed(wire185)));
          reg204 <= $signed((~&{$unsigned($signed(wire190)), (8'h9c)}));
          reg205 <= ((&((reg198[(5'h14):(5'h14)] < ((8'hb2) * wire192)) ?
                  $unsigned($unsigned(reg204)) : (wire3[(4'hd):(3'h4)] << wire3[(1'h1):(1'h0)]))) ?
              $signed(($signed(wire184) >>> wire1[(4'hb):(1'h1)])) : {$unsigned(wire184),
                  (^~(~(wire0 >= wire188)))});
        end
      else
        begin
          reg202 <= reg194;
          reg203 <= {(({$signed(wire192), {wire181, reg198}} ?
                  {{(8'hb4), wire184},
                      reg203[(4'hf):(4'hc)]} : wire187) << reg200)};
        end
      reg206 <= $unsigned((^(|((reg198 ? wire187 : (8'h9f)) * (^~wire183)))));
      reg207 <= (wire185[(3'h4):(1'h1)] >>> {(~^$signed($signed(wire197))),
          wire192});
      if ($unsigned((($unsigned((|(8'ha8))) ? wire4 : wire3) ?
          wire191[(4'hb):(1'h0)] : reg195)))
        begin
          reg208 <= ({wire190[(1'h1):(1'h0)]} ?
              reg198[(4'hc):(2'h3)] : ($signed(((reg200 ? reg200 : wire188) ?
                  $unsigned(wire197) : $unsigned(reg196))) == reg204));
        end
      else
        begin
          if (reg205)
            begin
              reg208 <= (~{((reg206[(4'h9):(1'h1)] << (8'hb9)) << (8'hb2))});
              reg209 <= $signed({($unsigned(wire3) ?
                      (&reg206[(3'h6):(2'h2)]) : wire188[(2'h3):(1'h1)])});
            end
          else
            begin
              reg208 <= reg208[(4'h8):(3'h6)];
              reg209 <= (&wire197);
            end
          reg210 <= wire190[(2'h2):(1'h1)];
          reg211 <= {((8'hbc) ?
                  {reg195[(3'h4):(3'h4)],
                      $signed((reg195 ? wire184 : wire1))} : reg202),
              (7'h40)};
          if ((8'hbf))
            begin
              reg212 <= (-(wire3 << wire181[(4'hb):(3'h4)]));
              reg213 <= $unsigned((wire2 ?
                  (wire190 == (((8'hb1) ? reg209 : reg205) ?
                      reg212[(1'h0):(1'h0)] : reg194)) : reg200));
              reg214 <= (&wire186);
              reg215 <= (^~(8'ha4));
              reg216 <= (($signed(wire187[(4'h8):(3'h4)]) < {reg213[(2'h3):(2'h2)],
                      wire1[(2'h2):(2'h2)]}) ?
                  $unsigned(wire188[(2'h3):(2'h2)]) : reg208[(4'hd):(4'hc)]);
            end
          else
            begin
              reg212 <= {$signed((($unsigned(wire2) != reg199) != {reg213,
                      $signed((8'ha4))}))};
            end
          reg217 <= {(~|$signed(wire184)), $unsigned(reg202)};
        end
    end
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h237):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire179;
  wire [(4'hb):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire58;
  wire signed [(3'h5):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire131;
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  assign y = {wire179,
                 wire83,
                 wire71,
                 wire70,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire131,
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
                 reg10,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= ({$unsigned(($unsigned(wire9) >> $signed(wire6)))} ?
          wire9[(3'h6):(1'h1)] : (~^($unsigned($signed(wire9)) ?
              ((~|wire9) ?
                  (wire8 > wire7) : (8'hb1)) : $signed((wire8 == wire7)))));
    end
  assign wire11 = ({wire7[(3'h4):(2'h2)]} ?
                      $unsigned($signed({wire8[(3'h4):(2'h2)],
                          $signed(wire9)})) : $signed(wire8[(3'h4):(2'h2)]));
  assign wire12 = $unsigned({reg10});
  assign wire13 = {{$unsigned(wire9[(2'h3):(2'h3)])}, $unsigned((8'hb3))};
  assign wire14 = $signed(((reg10 ?
                      wire8 : wire7[(2'h3):(2'h3)]) ^ wire9[(3'h7):(2'h3)]));
  always
    @(posedge clk) begin
      reg15 <= (7'h43);
      reg16 <= wire11;
      reg17 <= wire6;
      reg18 <= (^wire11[(2'h2):(1'h0)]);
      if ((|(8'ha6)))
        begin
          reg19 <= $signed(reg18);
        end
      else
        begin
          reg19 <= ((|wire9) ? wire9 : reg10);
          reg20 <= ({reg19} ? reg18 : $unsigned(wire13[(3'h7):(3'h4)]));
          reg21 <= ((~^$signed((^~(|wire13)))) > (reg18[(3'h4):(2'h2)] | (reg18[(4'hb):(2'h2)] ^ $signed(wire9[(2'h2):(2'h2)]))));
          reg22 <= $unsigned({wire11[(3'h5):(1'h0)]});
          reg23 <= wire6[(4'hb):(4'h9)];
        end
    end
  assign wire24 = wire8;
  assign wire25 = (~^reg23);
  assign wire26 = ((~&{wire7}) ?
                      (8'hb5) : ($signed(wire6) ?
                          $signed((|(8'hbc))) : ((~(!reg19)) ?
                              wire8 : (|(wire24 ~^ (8'ha6))))));
  assign wire27 = (wire24 ?
                      reg21[(3'h6):(2'h2)] : {$unsigned($unsigned($unsigned(wire6)))});
  assign wire28 = (reg15 == $signed(wire26));
  assign wire29 = (((wire26 >> ((+reg22) ?
                              (reg10 ?
                                  reg18 : reg15) : wire25[(5'h11):(4'hb)])) ?
                          ($unsigned((wire27 ?
                              reg19 : reg20)) ^ {reg21[(4'ha):(3'h6)]}) : $unsigned(((~&reg23) && (reg10 == wire7)))) ?
                      $signed($signed(reg22[(5'h14):(4'hc)])) : {(($signed(wire25) ?
                                  (^wire13) : wire28[(3'h7):(3'h4)]) ?
                              ((~reg21) >= ((8'hbe) ?
                                  (8'h9d) : reg15)) : (~^(-reg21))),
                          ((+(~&reg18)) ?
                              reg20 : $unsigned(((8'hac) | reg20)))});
  module30 #() modinst55 (wire54, clk, reg20, reg17, reg19, wire8, wire13);
  assign wire56 = $unsigned(reg20);
  assign wire57 = ((|$unsigned(($unsigned(reg18) ?
                      $signed((8'hbe)) : $unsigned(reg18)))) != ($signed((~&((8'hbf) - wire12))) ~^ (($signed(reg10) && wire24) ?
                      (wire25[(4'h8):(1'h0)] ?
                          $unsigned(reg21) : $signed(reg17)) : ($unsigned(reg15) ~^ $unsigned(wire14)))));
  assign wire58 = $unsigned($signed(wire28));
  always
    @(posedge clk) begin
      reg59 <= wire29;
      if ($signed(($signed(reg15[(4'ha):(4'h8)]) >>> reg19[(3'h4):(2'h3)])))
        begin
          reg60 <= wire29;
          if (($unsigned(reg22) ? reg17 : reg10[(1'h0):(1'h0)]))
            begin
              reg61 <= $signed(reg20[(4'hf):(2'h3)]);
              reg62 <= (wire7 ?
                  wire28 : ((|(reg16[(2'h3):(1'h0)] ?
                      (wire8 ? (8'hb7) : reg22) : $signed(wire12))) >= wire24));
              reg63 <= $unsigned(({(wire7[(1'h0):(1'h0)] + reg21[(4'ha):(3'h7)]),
                      reg19} ?
                  $signed(wire24[(2'h2):(1'h1)]) : (!(reg60[(3'h6):(1'h0)] ?
                      wire12 : (reg62 + reg17)))));
            end
          else
            begin
              reg61 <= (~(!wire29[(4'hc):(1'h1)]));
              reg62 <= wire29[(3'h7):(2'h2)];
              reg63 <= (+$signed(((|$unsigned(wire12)) ?
                  ({(8'hbb)} ?
                      $unsigned((8'hb7)) : $unsigned(reg23)) : (-(|reg10)))));
            end
          reg64 <= ($signed((wire12 ?
              (-reg23[(2'h2):(1'h1)]) : $unsigned(wire29[(4'hb):(3'h4)]))) == (wire28[(5'h12):(3'h5)] & (~^($signed(wire54) ?
              (8'hb5) : (wire28 >> wire54)))));
          reg65 <= $unsigned({(~|(~&(reg60 && (7'h41))))});
          reg66 <= reg21;
        end
      else
        begin
          if ($signed(wire58[(1'h1):(1'h0)]))
            begin
              reg60 <= {(wire7 ?
                      $unsigned(($unsigned(reg22) * (8'hba))) : reg63[(2'h2):(2'h2)]),
                  ($unsigned(wire8[(2'h3):(2'h2)]) || $unsigned($unsigned((wire28 - reg19))))};
              reg61 <= wire28[(4'hc):(3'h5)];
              reg62 <= $signed((((^$unsigned(wire6)) ?
                  (8'had) : wire6) >>> (($unsigned((8'hb5)) ?
                  $signed(wire8) : reg59) | (!$signed(wire56)))));
              reg63 <= (reg59 ? wire7 : wire7);
            end
          else
            begin
              reg60 <= (~&($unsigned($unsigned((reg65 ? (8'h9e) : (8'hb1)))) ?
                  (((wire54 ?
                      reg20 : (8'ha5)) + wire27[(4'ha):(4'h8)]) <<< ($unsigned(reg63) >>> (8'hae))) : $unsigned(($unsigned(wire8) ?
                      $unsigned(reg64) : (wire7 && reg20)))));
              reg61 <= $signed($unsigned(wire57[(1'h1):(1'h1)]));
              reg62 <= wire9[(3'h4):(3'h4)];
            end
          if ({(^~(|(~$signed(wire28)))),
              ((~|reg64) ? (8'ha5) : ({$signed(wire13)} | wire11))})
            begin
              reg64 <= $signed($signed({reg22[(3'h7):(3'h7)]}));
              reg65 <= (8'hb9);
              reg66 <= reg17;
              reg67 <= (!reg21);
            end
          else
            begin
              reg64 <= $unsigned($signed((wire24[(2'h2):(2'h2)] + $unsigned((-wire54)))));
              reg65 <= reg67;
              reg66 <= reg61;
            end
          reg68 <= wire26[(3'h6):(2'h2)];
        end
      reg69 <= (~&{$unsigned((~|$signed(reg61))), wire25});
    end
  assign wire70 = (^(~^((8'ha9) | (wire26 <<< (wire58 != reg62)))));
  assign wire71 = (-(reg64 + $unsigned($unsigned($unsigned(wire54)))));
  module72 #() modinst84 (.wire75(reg17), .wire74(reg18), .wire76(reg10), .clk(clk), .wire73(wire54), .y(wire83));
  module85 #() modinst132 (wire131, clk, reg62, wire28, wire24, reg18, wire71);
  module133 #() modinst180 (wire179, clk, wire14, reg63, reg61, reg10, wire24);
endmodule

module module133  (y, clk, wire138, wire137, wire136, wire135, wire134);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire138;
  input wire [(4'h8):(1'h0)] wire137;
  input wire [(2'h3):(1'h0)] wire136;
  input wire [(4'hc):(1'h0)] wire135;
  input wire [(5'h14):(1'h0)] wire134;
  wire [(3'h4):(1'h0)] wire178;
  wire signed [(3'h6):(1'h0)] wire177;
  wire [(4'hc):(1'h0)] wire159;
  wire [(4'he):(1'h0)] wire158;
  wire [(5'h15):(1'h0)] wire157;
  wire signed [(4'h8):(1'h0)] wire151;
  wire signed [(3'h6):(1'h0)] wire150;
  wire signed [(3'h7):(1'h0)] wire149;
  wire signed [(5'h14):(1'h0)] wire148;
  wire [(2'h2):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire146;
  wire signed [(4'h8):(1'h0)] wire139;
  reg [(4'hd):(1'h0)] reg176 = (1'h0);
  reg [(4'hd):(1'h0)] reg175 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg [(4'ha):(1'h0)] reg169 = (1'h0);
  reg [(5'h10):(1'h0)] reg168 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg167 = (1'h0);
  reg [(4'hb):(1'h0)] reg166 = (1'h0);
  reg [(2'h2):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg162 = (1'h0);
  reg [(5'h13):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg160 = (1'h0);
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  reg [(2'h2):(1'h0)] reg155 = (1'h0);
  reg [(5'h14):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire159,
                 wire158,
                 wire157,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire139,
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
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 (1'h0)};
  assign wire139 = wire138[(5'h10):(1'h1)];
  always
    @(posedge clk) begin
      if ({{(~&wire135[(1'h0):(1'h0)]), {{(&wire139), wire138}}},
          $signed(wire137)})
        begin
          if (wire134[(3'h4):(2'h3)])
            begin
              reg140 <= $signed((wire134 >> wire135));
              reg141 <= $unsigned((wire138 ?
                  wire137[(4'h8):(3'h7)] : $signed(wire139)));
            end
          else
            begin
              reg140 <= (wire139[(2'h2):(1'h0)] ^ ($unsigned(wire138) ?
                  (!$signed((wire138 ?
                      wire136 : wire135))) : wire139[(1'h0):(1'h0)]));
              reg141 <= wire134[(4'hf):(3'h5)];
            end
        end
      else
        begin
          reg140 <= $unsigned($unsigned(wire135[(3'h6):(1'h1)]));
        end
      reg142 <= $unsigned((+$unsigned($unsigned(reg140[(4'h8):(2'h3)]))));
      reg143 <= (((8'hac) != {(-(wire139 ? wire136 : wire136))}) ?
          wire137[(2'h3):(1'h0)] : $unsigned($unsigned((~|(~^wire134)))));
      reg144 <= $unsigned((8'h9f));
      reg145 <= $signed(($unsigned({(reg143 ? wire137 : wire138)}) >>> reg144));
    end
  assign wire146 = (~($unsigned(((wire139 && wire135) ?
                           (wire139 ^ wire137) : reg144[(4'hc):(4'h8)])) ?
                       ((!$unsigned(wire136)) <<< $signed($unsigned(wire134))) : $unsigned((7'h41))));
  assign wire147 = reg145[(4'h8):(3'h4)];
  assign wire148 = (~|{(~&$signed((reg143 & (8'hbc)))),
                       wire135[(3'h5):(1'h0)]});
  assign wire149 = $unsigned(((wire135 && $signed((-wire147))) ?
                       (((&wire136) ?
                           $unsigned(wire137) : wire136[(2'h2):(1'h1)]) + wire137) : wire135[(4'hc):(3'h5)]));
  assign wire150 = (!($unsigned(($unsigned(reg142) + (wire146 ?
                       wire148 : reg141))) > $signed((!((8'ha0) ?
                       reg143 : wire138)))));
  assign wire151 = $unsigned(($signed((reg142[(1'h0):(1'h0)] ^~ (wire136 + wire147))) ?
                       reg143 : (8'ha0)));
  always
    @(posedge clk) begin
      reg152 <= {(wire136 || wire139[(1'h0):(1'h0)])};
      reg153 <= (wire150 ?
          (wire134[(2'h2):(1'h0)] ?
              ($signed(wire148) - $unsigned((+reg141))) : wire147) : wire146);
      reg154 <= ({(((wire149 ? wire146 : (8'hbf)) + (-reg143)) <<< {wire137,
                  reg142[(3'h4):(1'h0)]}),
              ($signed($signed(wire139)) ?
                  $signed($signed(wire148)) : wire148[(1'h1):(1'h1)])} ?
          (+$signed(($signed(wire137) ?
              $unsigned(reg142) : $signed(reg140)))) : $unsigned(wire148[(5'h13):(4'he)]));
      reg155 <= (~wire135[(3'h5):(2'h2)]);
      reg156 <= $unsigned(reg142[(4'h9):(1'h0)]);
    end
  assign wire157 = wire134[(4'ha):(1'h0)];
  assign wire158 = reg154;
  assign wire159 = wire138[(5'h13):(4'he)];
  always
    @(posedge clk) begin
      if (wire151[(1'h0):(1'h0)])
        begin
          if (((-(&$signed($unsigned(wire148)))) ?
              reg142 : ({wire137[(3'h5):(1'h1)]} + wire151)))
            begin
              reg160 <= (!reg145[(1'h1):(1'h1)]);
              reg161 <= ($signed(wire134) << (wire149[(2'h2):(2'h2)] ?
                  wire139[(3'h4):(1'h1)] : {(reg144[(2'h2):(2'h2)] >> wire148[(4'ha):(4'ha)]),
                      ({(8'hb8)} & {(7'h42), (8'ha2)})}));
            end
          else
            begin
              reg160 <= {reg144[(4'h8):(1'h0)],
                  {(((^~(8'hab)) <= (reg140 ~^ reg160)) ^ wire149)}};
              reg161 <= (+$unsigned((wire158[(1'h1):(1'h1)] + reg155)));
              reg162 <= ($signed(($signed({wire135}) ?
                      (wire147[(1'h1):(1'h0)] >>> (+(8'ha1))) : $signed((reg154 | reg152)))) ?
                  $unsigned((-wire147)) : $unsigned($unsigned($signed(reg143))));
              reg163 <= wire134;
              reg164 <= ((|(^~{{wire137, wire150}})) ?
                  wire137[(3'h6):(1'h1)] : (|wire157[(5'h15):(5'h14)]));
            end
          if (reg142)
            begin
              reg165 <= wire138;
              reg166 <= reg153;
              reg167 <= {$signed(wire146)};
              reg168 <= ((~&$signed($unsigned((wire147 ? wire136 : wire148)))) ?
                  $signed($signed(reg154[(4'ha):(2'h3)])) : $unsigned(wire134));
              reg169 <= ($signed((($unsigned(wire134) ?
                      reg144 : $signed(wire138)) != reg164[(1'h0):(1'h0)])) ?
                  $signed((&{$unsigned(wire135)})) : ($unsigned(((reg152 ?
                              (8'hb5) : wire151) ?
                          (reg161 >>> wire146) : $unsigned(reg162))) ?
                      {reg168[(4'hb):(3'h5)]} : {({wire146} ?
                              (reg155 ~^ wire158) : wire136[(2'h3):(1'h0)])}));
            end
          else
            begin
              reg165 <= $signed(((^~$unsigned((wire146 << reg152))) ?
                  (wire147[(2'h2):(1'h0)] ?
                      ((|reg168) ?
                          wire150 : (reg164 || reg141)) : $unsigned({(7'h41)})) : wire151[(4'h8):(2'h3)]));
              reg166 <= (~^wire148);
              reg167 <= wire134[(3'h5):(3'h5)];
              reg168 <= $unsigned($signed((~wire138)));
            end
          if ((((~^$signed((wire151 != reg143))) >>> {(~$unsigned((8'hb7)))}) != $signed($unsigned(reg168))))
            begin
              reg170 <= {wire151[(3'h7):(3'h5)]};
            end
          else
            begin
              reg170 <= reg166;
            end
          if (($unsigned(reg163[(2'h2):(1'h1)]) != reg160))
            begin
              reg171 <= wire149[(2'h2):(2'h2)];
            end
          else
            begin
              reg171 <= (~|(((!(~(7'h40))) & ({(8'h9f)} ?
                  (reg145 >> reg140) : (wire136 ?
                      wire138 : wire148))) >> $unsigned($unsigned((wire149 >= reg144)))));
              reg172 <= reg154[(4'ha):(2'h2)];
              reg173 <= (((|reg162) >>> $signed(($unsigned(wire149) <= reg143[(4'h8):(1'h0)]))) ?
                  $unsigned($unsigned($signed($unsigned(wire158)))) : $unsigned((wire151 ?
                      reg145[(1'h1):(1'h0)] : ((^wire139) ?
                          (reg161 ? reg154 : reg171) : (reg169 >>> wire148)))));
            end
        end
      else
        begin
          if ($signed(reg145))
            begin
              reg160 <= (!(~^($signed(reg155) && (7'h43))));
            end
          else
            begin
              reg160 <= wire151[(2'h2):(2'h2)];
            end
        end
      reg174 <= (-(reg162 | {($signed(reg141) ?
              reg141 : (wire136 >>> wire158))}));
      reg175 <= reg171;
      reg176 <= (((reg144[(4'h9):(3'h4)] << reg142[(2'h3):(1'h0)]) ?
          wire150 : wire147) >>> wire150);
    end
  assign wire177 = (wire159[(1'h0):(1'h0)] + $unsigned($signed(((reg171 <<< wire139) ?
                       (reg162 == reg171) : (reg144 ? (8'hb4) : reg153)))));
  assign wire178 = (wire177 ?
                       reg140[(4'h8):(2'h3)] : (^~({(wire139 ^ reg168),
                           $unsigned(wire134)} ^~ $unsigned($unsigned(reg174)))));
endmodule

module module85  (y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h198):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire90;
  input wire signed [(4'hf):(1'h0)] wire89;
  input wire signed [(3'h6):(1'h0)] wire88;
  input wire signed [(4'he):(1'h0)] wire87;
  input wire [(2'h2):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire123;
  wire signed [(4'hb):(1'h0)] wire121;
  wire [(3'h5):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire signed [(3'h4):(1'h0)] wire118;
  wire [(3'h4):(1'h0)] wire117;
  wire [(5'h13):(1'h0)] wire116;
  wire [(5'h12):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire95;
  wire signed [(5'h12):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire91;
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg122 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  assign y = {wire123,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg122,
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
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire91 = {({$signed((wire87 & wire88)),
                          {(~|wire90),
                              wire86[(2'h2):(1'h0)]}} > $signed(((wire87 ?
                          wire87 : wire86) - (wire90 + (8'haa))))),
                      wire88[(2'h3):(2'h2)]};
  assign wire92 = wire91;
  assign wire93 = $signed((^wire88));
  assign wire94 = $signed($unsigned(wire91[(2'h2):(2'h2)]));
  assign wire95 = ($unsigned((wire94[(5'h10):(4'hf)] < (8'ha3))) ?
                      {$unsigned(wire90),
                          (~&(wire92 == $signed((8'ha6))))} : ((^wire88[(3'h6):(1'h0)]) ?
                          $signed($unsigned($signed(wire87))) : $unsigned(((wire92 >= wire88) ?
                              $signed(wire90) : wire90[(4'h8):(1'h0)]))));
  assign wire96 = ({(&wire90)} << ((wire95 ?
                          $signed({wire88}) : (-$unsigned(wire87))) ?
                      wire88 : (~^((wire93 & wire92) >>> ((8'hbb) || wire88)))));
  always
    @(posedge clk) begin
      reg97 <= (+$signed(wire89[(1'h0):(1'h0)]));
      reg98 <= wire94;
      if (wire89)
        begin
          reg99 <= (!$unsigned($unsigned({reg98, wire95[(3'h7):(3'h5)]})));
          if ($unsigned($unsigned(({(wire87 ?
                  reg99 : wire89)} <= $signed(((8'ha7) ? wire94 : wire95))))))
            begin
              reg100 <= $signed($unsigned($signed(wire88)));
              reg101 <= wire96[(3'h4):(1'h0)];
              reg102 <= {wire87[(4'he):(1'h1)]};
            end
          else
            begin
              reg100 <= $signed(reg97[(1'h0):(1'h0)]);
              reg101 <= wire94;
              reg102 <= ((~|wire88) ? (8'hac) : ((^~wire87) | (8'hba)));
            end
          reg103 <= wire86;
        end
      else
        begin
          reg99 <= $signed(reg101);
          reg100 <= (reg101 == ((((wire86 <= wire92) ?
                  (reg101 ? wire95 : (8'ha2)) : (wire92 ? (8'hb6) : wire92)) ?
              (~&$signed(reg103)) : wire93[(4'h8):(1'h0)]) && (-wire91)));
          if ((~&(reg99[(4'ha):(4'h9)] || wire88)))
            begin
              reg101 <= (&reg102[(2'h3):(2'h2)]);
              reg102 <= $unsigned($signed({reg101[(4'ha):(4'ha)]}));
              reg103 <= (7'h41);
              reg104 <= (($signed($unsigned(wire94)) >> (~|(wire86[(1'h1):(1'h0)] & ((7'h43) ?
                      wire89 : (8'ha9))))) ?
                  reg100 : ((&$unsigned(reg103)) ?
                      $signed({$unsigned(reg100)}) : wire87));
            end
          else
            begin
              reg101 <= reg103;
            end
          if (reg103[(1'h0):(1'h0)])
            begin
              reg105 <= reg101[(4'hb):(1'h1)];
              reg106 <= ($signed($signed({{reg101, reg99},
                      (wire91 ? (8'h9c) : wire92)})) ?
                  reg99 : (^~$unsigned((~&$unsigned(wire90)))));
              reg107 <= $unsigned((wire88 <= $signed(reg106)));
              reg108 <= (^~wire95[(1'h0):(1'h0)]);
              reg109 <= $signed(reg103);
            end
          else
            begin
              reg105 <= (reg102 ?
                  $unsigned(((reg101 - $unsigned(wire87)) >> (8'hb5))) : $unsigned(wire90[(4'hb):(1'h1)]));
              reg106 <= (reg106 + $signed($signed(wire88[(1'h1):(1'h0)])));
              reg107 <= (8'h9f);
            end
          if (wire89[(2'h2):(2'h2)])
            begin
              reg110 <= ((&((wire96 ? (&wire90) : {wire92, (8'hbf)}) ?
                      $unsigned((wire96 ? (8'ha1) : wire90)) : reg107)) ?
                  (|(~^(~&(reg104 ? wire87 : reg104)))) : wire96);
              reg111 <= wire94;
            end
          else
            begin
              reg110 <= ((wire95[(1'h1):(1'h0)] ?
                      (({reg98} ? {reg111, wire87} : reg106) ?
                          $unsigned($signed(reg105)) : (^reg110[(3'h4):(1'h0)])) : (({reg106,
                                  reg102} ?
                              (^~reg108) : (reg111 ? wire92 : (8'hbd))) ?
                          (reg108[(1'h0):(1'h0)] ~^ ((8'hba) <<< reg110)) : (reg108[(2'h2):(1'h1)] != wire96[(5'h12):(4'hd)]))) ?
                  (((~&((7'h40) ? wire91 : wire87)) ^~ $unsigned({reg109,
                          wire90})) ?
                      $unsigned((8'ha2)) : $unsigned($unsigned($signed(reg107)))) : (reg106[(1'h0):(1'h0)] >= (-reg110[(3'h6):(3'h4)])));
              reg111 <= (~|reg98[(2'h3):(2'h3)]);
              reg112 <= $signed((wire94 << reg103[(3'h7):(3'h7)]));
              reg113 <= $signed(reg109[(3'h5):(1'h0)]);
            end
        end
      reg114 <= (wire88[(3'h4):(2'h3)] & ((^$signed(reg113[(3'h5):(1'h1)])) << {wire88}));
      reg115 <= $unsigned(({(!((8'haa) != reg108)),
              {wire94, reg109[(3'h4):(2'h3)]}} ?
          $unsigned(reg112) : $signed($unsigned((&wire96)))));
    end
  assign wire116 = wire92[(4'he):(3'h7)];
  assign wire117 = wire86;
  assign wire118 = ($unsigned($signed($signed($unsigned((8'hbd))))) ?
                       $unsigned($signed($signed((wire96 ?
                           reg100 : (8'hb9))))) : (wire86[(1'h0):(1'h0)] ^ reg113[(1'h1):(1'h1)]));
  assign wire119 = $signed(($signed(((reg98 - (8'hb0)) ?
                           $signed(wire87) : (wire92 ? reg108 : wire116))) ?
                       wire88[(3'h6):(3'h6)] : $unsigned((reg99 ?
                           (+reg111) : (^~wire118)))));
  assign wire120 = {{wire116,
                           (($unsigned(wire93) ?
                                   (-(7'h41)) : $unsigned(wire117)) ?
                               $signed($signed(wire88)) : $unsigned((~wire87)))},
                       (wire95 && {$unsigned(reg109)})};
  assign wire121 = (~&$unsigned($unsigned($signed($signed(reg107)))));
  always
    @(posedge clk) begin
      reg122 <= $unsigned((((reg107[(2'h3):(1'h0)] > {reg102}) ?
          ({wire90} ?
              reg108 : reg112[(1'h0):(1'h0)]) : wire89[(3'h6):(3'h5)]) >= (((reg114 || wire119) >>> wire118[(2'h3):(1'h0)]) - wire95[(3'h5):(1'h0)])));
    end
  assign wire123 = (~^(-(-wire95)));
  always
    @(posedge clk) begin
      reg124 <= (reg109[(2'h3):(2'h2)] ^ wire121);
      reg125 <= ($signed(($signed(wire89[(4'ha):(1'h0)]) ?
          (^$unsigned(wire123)) : (~$unsigned(wire86)))) <<< reg115[(3'h6):(3'h5)]);
      if ((((!$unsigned($signed(wire88))) ?
              (~((|wire87) && (wire123 ^ wire92))) : $signed(wire89[(3'h4):(3'h4)])) ?
          $signed($signed($unsigned(((8'hb4) & wire86)))) : (~&$signed(reg114[(2'h3):(1'h0)]))))
        begin
          if ((|reg101[(1'h0):(1'h0)]))
            begin
              reg126 <= $unsigned(wire86);
              reg127 <= $signed(wire95[(2'h2):(2'h2)]);
              reg128 <= reg106;
            end
          else
            begin
              reg126 <= reg114;
              reg127 <= reg111;
              reg128 <= (~^reg127[(4'hb):(2'h3)]);
              reg129 <= $signed({(8'ha5)});
            end
        end
      else
        begin
          reg126 <= $unsigned({wire94});
          if (($signed((~&$signed(reg109[(3'h4):(1'h1)]))) >> reg108))
            begin
              reg127 <= $unsigned((~&{$unsigned((&reg126))}));
              reg128 <= {(&$unsigned((7'h41)))};
              reg129 <= ($unsigned($unsigned((reg109 > reg126))) >>> (($unsigned($signed(reg97)) > wire119) ?
                  ($unsigned(reg125) ?
                      $unsigned((wire89 >>> wire119)) : $signed(reg99)) : $signed(reg101[(2'h2):(2'h2)])));
              reg130 <= reg102;
            end
          else
            begin
              reg127 <= (~&reg129[(2'h3):(2'h3)]);
              reg128 <= $unsigned((~&(^~(!$signed(reg99)))));
              reg129 <= (&reg101);
              reg130 <= $unsigned($unsigned(wire120));
            end
        end
    end
endmodule

module module72
#(parameter param81 = ({(^(|{(8'ha8)})), (+(~|((8'hb5) | (8'haf))))} ? {{(8'hb4), (~|(~&(8'hb8)))}} : (((^~(^(8'hb4))) | (-{(7'h40), (8'ha7)})) ? ((((8'h9c) ? (8'ha2) : (7'h43)) ? {(8'ha7)} : ((8'ha1) ? (8'ha7) : (8'ha5))) && (~(8'hae))) : (8'ha0))), 
parameter param82 = param81)
(y, clk, wire76, wire75, wire74, wire73);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire76;
  input wire signed [(5'h15):(1'h0)] wire75;
  input wire [(5'h12):(1'h0)] wire74;
  input wire signed [(4'hf):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  assign y = {wire80, wire79, wire78, wire77, (1'h0)};
  assign wire77 = wire73;
  assign wire78 = {wire74[(3'h6):(1'h0)], $unsigned((wire75 <= wire77))};
  assign wire79 = (~^((((+wire77) << (wire77 ^~ wire78)) <<< ({(8'hbd)} ?
                      wire73 : (wire76 ?
                          wire74 : wire74))) & (wire73 ~^ ($unsigned(wire74) ?
                      $signed(wire75) : (+wire73)))));
  assign wire80 = wire79[(4'h9):(4'h8)];
endmodule

module module30  (y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire35;
  input wire signed [(5'h15):(1'h0)] wire34;
  input wire [(2'h2):(1'h0)] wire33;
  input wire [(4'ha):(1'h0)] wire32;
  input wire [(3'h6):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  assign y = {wire53,
                 wire50,
                 wire49,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg52,
                 reg51,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire36 = $unsigned((~|wire31[(2'h3):(2'h2)]));
  assign wire37 = ($unsigned(wire35) ? wire32[(3'h4):(3'h4)] : wire35);
  assign wire38 = ((wire34 ?
                      wire32 : (^(|((8'ha6) + wire33)))) + ($signed($signed({wire32,
                          wire32})) ?
                      wire33 : $unsigned(wire34[(5'h15):(5'h15)])));
  assign wire39 = $signed((-(wire38 - $signed(wire31[(2'h3):(2'h3)]))));
  assign wire40 = wire35[(3'h5):(2'h2)];
  assign wire41 = wire36[(4'h9):(4'h9)];
  assign wire42 = {wire38};
  assign wire43 = ({($unsigned(wire34) & wire33[(1'h1):(1'h0)]),
                          $unsigned(($unsigned(wire37) > (wire42 ?
                              wire40 : wire34)))} ?
                      wire42 : ((+(~^$signed((7'h40)))) <= (~&$signed(wire42))));
  always
    @(posedge clk) begin
      reg44 <= $unsigned($signed($unsigned(wire34)));
    end
  always
    @(posedge clk) begin
      reg45 <= (($signed((wire37 ? $unsigned(wire37) : (8'h9c))) ?
              {(&(wire32 ?
                      wire39 : wire41))} : $unsigned(wire40[(4'h8):(1'h0)])) ?
          wire42 : wire38);
      reg46 <= wire43;
      reg47 <= wire37;
      reg48 <= reg46;
    end
  assign wire49 = (8'hbd);
  assign wire50 = wire31;
  always
    @(posedge clk) begin
      reg51 <= ($signed({(((7'h44) <= wire34) ?
              (|wire37) : wire43[(1'h1):(1'h1)])}) >> (&$unsigned($unsigned({reg48}))));
      reg52 <= {(!$signed($unsigned((reg51 >> wire38))))};
    end
  assign wire53 = wire49[(1'h0):(1'h0)];
endmodule
