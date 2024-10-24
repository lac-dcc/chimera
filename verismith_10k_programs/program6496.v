module top
#(parameter param237 = (((+(&((7'h41) ? (8'ha4) : (8'hbb)))) < ((^((8'hb8) ? (8'hbe) : (8'hb1))) << (~(~|(8'hb2))))) >> (~&(~|((~|(8'ha1)) << ((8'hb4) ? (8'hb2) : (8'hb6)))))), 
parameter param238 = (^~{((&param237) ? param237 : ((~^(8'hb0)) && ((8'hb0) ? param237 : param237))), (-(^{param237}))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire236;
  wire [(2'h3):(1'h0)] wire235;
  wire signed [(4'hc):(1'h0)] wire203;
  wire [(4'ha):(1'h0)] wire224;
  wire signed [(4'hd):(1'h0)] wire225;
  wire [(5'h11):(1'h0)] wire227;
  wire signed [(4'hd):(1'h0)] wire228;
  wire [(3'h7):(1'h0)] wire229;
  wire signed [(5'h14):(1'h0)] wire231;
  wire signed [(4'h9):(1'h0)] wire232;
  wire [(5'h10):(1'h0)] wire233;
  reg signed [(5'h10):(1'h0)] reg205 = (1'h0);
  reg [(5'h14):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg207 = (1'h0);
  reg [(4'hc):(1'h0)] reg208 = (1'h0);
  reg [(4'h8):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg210 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg211 = (1'h0);
  reg [(3'h4):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg213 = (1'h0);
  reg [(4'ha):(1'h0)] reg214 = (1'h0);
  reg [(4'hc):(1'h0)] reg215 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg216 = (1'h0);
  reg [(3'h4):(1'h0)] reg217 = (1'h0);
  reg [(4'he):(1'h0)] reg218 = (1'h0);
  reg signed [(4'he):(1'h0)] reg219 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg221 = (1'h0);
  reg [(4'hb):(1'h0)] reg222 = (1'h0);
  reg [(3'h7):(1'h0)] reg223 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg226 = (1'h0);
  assign y = {wire236,
                 wire235,
                 wire203,
                 wire224,
                 wire225,
                 wire227,
                 wire228,
                 wire229,
                 wire231,
                 wire232,
                 wire233,
                 reg205,
                 reg206,
                 reg207,
                 reg208,
                 reg209,
                 reg210,
                 reg211,
                 reg212,
                 reg213,
                 reg214,
                 reg215,
                 reg216,
                 reg217,
                 reg218,
                 reg219,
                 reg220,
                 reg221,
                 reg222,
                 reg223,
                 reg226,
                 (1'h0)};
  module4 #() modinst204 (wire203, clk, wire1, wire0, wire3, wire2, (8'haa));
  always
    @(posedge clk) begin
      if ($unsigned(wire0))
        begin
          reg205 <= ($signed($unsigned({{wire3}, $unsigned(wire3)})) ?
              $signed(wire203) : wire1[(4'ha):(4'ha)]);
          if (($signed((~^($unsigned(wire1) ? {wire203, wire0} : (^~wire1)))) ?
              ($signed(({wire1, wire3} ?
                  (reg205 != reg205) : (wire3 && wire1))) < wire2) : $signed((&(+$unsigned(wire0))))))
            begin
              reg206 <= $signed(({$unsigned((wire3 && wire0))} & ($unsigned(wire3) ?
                  (~^$unsigned(reg205)) : (-$signed(wire3)))));
            end
          else
            begin
              reg206 <= $unsigned(((+reg205) ?
                  wire1 : ({(wire0 ? reg205 : wire3),
                      (^~wire2)} <<< $unsigned($unsigned(wire203)))));
              reg207 <= $signed({($unsigned($signed((8'hb3))) << {wire2,
                      $unsigned(reg205)})});
              reg208 <= $unsigned($signed($unsigned({(wire1 << wire1)})));
            end
          reg209 <= reg206[(5'h11):(3'h5)];
        end
      else
        begin
          reg205 <= (8'ha6);
          reg206 <= {$unsigned($signed(reg206)), reg206};
        end
      if ({(+reg206)})
        begin
          reg210 <= wire2;
          reg211 <= (~^(reg210 ?
              $unsigned(wire2[(2'h3):(2'h3)]) : {reg206[(4'h9):(3'h4)],
                  (^((8'hb1) ? (8'hbc) : reg208))}));
        end
      else
        begin
          reg210 <= $signed(($unsigned(reg206[(4'he):(2'h3)]) <= ({(reg205 ?
                      reg209 : wire1)} ?
              $signed(wire2) : (~|(+wire2)))));
          reg211 <= wire1;
          if (reg208)
            begin
              reg212 <= (reg205[(2'h2):(1'h1)] ?
                  {$signed(($signed(reg209) ?
                          (reg206 || wire1) : $signed((8'hbd))))} : (8'hb6));
              reg213 <= $signed((~&reg212[(3'h4):(1'h0)]));
              reg214 <= reg213;
              reg215 <= ((|$unsigned((-wire2))) - wire1[(1'h1):(1'h0)]);
              reg216 <= $unsigned(((($unsigned(reg208) <= reg214) ?
                  (&(reg212 ~^ wire3)) : (^~$unsigned(reg213))) >> ((-(wire3 ?
                      wire1 : reg214)) ?
                  (7'h42) : reg206)));
            end
          else
            begin
              reg212 <= reg209;
              reg213 <= wire1[(4'h8):(1'h0)];
            end
          reg217 <= $signed($unsigned((~^(((8'hb6) == wire203) ?
              ((7'h42) ? wire2 : reg212) : $signed(reg207)))));
        end
      if ($signed($unsigned({{(wire1 ? wire1 : (8'hb7)), (^wire2)}, reg215})))
        begin
          if ({((wire3[(5'h11):(3'h6)] - $signed({wire2})) || $unsigned((^~$signed(reg211))))})
            begin
              reg218 <= $signed((reg212[(2'h3):(2'h2)] ?
                  $unsigned(((reg215 ?
                      reg208 : reg207) >> (reg212 < (8'ha7)))) : ($unsigned($unsigned(reg208)) ?
                      wire1 : ($signed(wire3) && ((8'haa) >> reg207)))));
              reg219 <= {$unsigned((($unsigned(wire203) ?
                      $signed(wire0) : $signed((8'ha2))) <= $unsigned(reg217[(3'h4):(1'h1)]))),
                  $signed({(reg212[(2'h3):(2'h2)] == (~wire2)),
                      $unsigned($unsigned(reg211))})};
            end
          else
            begin
              reg218 <= (|($signed((((8'haa) ? reg213 : (8'hab)) ?
                  (reg210 ? reg205 : reg214) : (wire203 ?
                      (7'h40) : wire0))) ^ (^$unsigned($unsigned(reg206)))));
              reg219 <= ((reg215[(1'h1):(1'h1)] ?
                  ($signed((reg217 >>> reg218)) * $unsigned(reg215)) : wire2) ^ reg206);
              reg220 <= wire1;
            end
          if (reg208)
            begin
              reg221 <= wire203[(3'h7):(3'h4)];
              reg222 <= (^~((~^reg205[(3'h4):(2'h3)]) <<< reg210[(4'hc):(1'h1)]));
              reg223 <= $signed((!$signed((8'ha8))));
            end
          else
            begin
              reg221 <= $signed(reg216[(3'h4):(1'h1)]);
              reg222 <= reg207;
            end
        end
      else
        begin
          reg218 <= ({{((reg209 ? wire0 : (7'h42)) ?
                      $signed(reg221) : $unsigned(reg221))},
              (reg219 ?
                  {reg207[(3'h5):(2'h3)]} : $unsigned((reg207 ?
                      reg211 : reg209)))} - (!reg211));
          reg219 <= $signed(reg218);
        end
    end
  assign wire224 = {($unsigned(((reg221 ? reg205 : reg219) ?
                               (+reg209) : (wire0 || (8'hb3)))) ?
                           (((reg211 >>> reg209) ?
                               (reg215 ?
                                   wire3 : (8'hae)) : $unsigned(reg209)) + $unsigned({wire2})) : reg207)};
  assign wire225 = reg206;
  always
    @(posedge clk) begin
      reg226 <= wire0;
    end
  assign wire227 = $signed((7'h44));
  assign wire228 = (8'haf);
  module99 #() modinst230 (wire229, clk, wire228, reg218, wire2, reg213, reg215);
  assign wire231 = (!$unsigned($signed($signed((reg226 && reg221)))));
  assign wire232 = $unsigned(($signed((^wire203[(4'h8):(3'h5)])) != ((8'hb3) >>> wire203)));
  module53 #() modinst234 (wire233, clk, reg220, reg205, wire227, wire231, wire203);
  assign wire235 = wire2;
  assign wire236 = ($unsigned($unsigned($unsigned((+reg210)))) ~^ (~|wire232));
endmodule

module module4
#(parameter param201 = ((((&((8'hac) ? (8'ha3) : (8'had))) << ((~|(8'hb7)) ^ ((8'hbd) == (8'hbb)))) ? (((-(8'ha1)) ? ((8'hbd) ? (8'hb9) : (7'h44)) : ((7'h40) != (8'hbd))) ? (^~{(8'hac)}) : (^~((8'ha7) ? (8'hb1) : (8'hb3)))) : ((((8'hb0) ? (8'haa) : (7'h41)) == {(8'ha5), (8'hbd)}) ? (~(8'hbe)) : (~^((8'ha5) ? (7'h42) : (7'h43))))) << {(&(+((8'hab) ? (7'h42) : (8'hb3)))), ((((8'hb5) ? (8'hac) : (8'hb6)) ? (~^(8'ha7)) : ((8'ha6) - (8'hb8))) < (~(!(8'hb3))))}), 
parameter param202 = {(({((8'h9c) ? param201 : (8'ha8))} ~^ param201) ? (param201 ? {(^~param201)} : {param201, param201}) : param201)})
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h27e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire5;
  input wire signed [(4'hc):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire200;
  wire [(3'h4):(1'h0)] wire199;
  wire signed [(4'h9):(1'h0)] wire198;
  wire signed [(3'h4):(1'h0)] wire189;
  wire [(4'h8):(1'h0)] wire150;
  wire [(4'hd):(1'h0)] wire138;
  wire signed [(5'h13):(1'h0)] wire136;
  wire [(5'h13):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire134;
  reg signed [(4'hb):(1'h0)] reg197 = (1'h0);
  reg [(5'h10):(1'h0)] reg196 = (1'h0);
  reg [(4'hf):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg194 = (1'h0);
  reg [(5'h15):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg191 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg145 = (1'h0);
  reg [(3'h4):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(4'hd):(1'h0)] reg137 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire198,
                 wire189,
                 wire150,
                 wire138,
                 wire136,
                 wire90,
                 wire52,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire50,
                 wire134,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg149,
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
                 reg137,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (({(8'ha3)} ?
          $signed(wire9[(1'h1):(1'h1)]) : (($signed((^~wire7)) ?
                  ((^wire5) ?
                      $signed(wire8) : wire5[(3'h5):(2'h3)]) : {((8'hbf) * wire7),
                      wire6}) ?
              $unsigned(wire8) : wire9)))
        begin
          reg10 <= $signed($signed((((~^wire9) ?
              $signed(wire6) : (7'h43)) >> wire7[(2'h3):(1'h1)])));
          if (($signed({$signed((reg10 * wire8))}) ?
              wire8[(2'h3):(2'h3)] : $unsigned($signed(wire6))))
            begin
              reg11 <= (((($signed(wire8) ?
                      (reg10 ? reg10 : reg10) : $unsigned(reg10)) ?
                  wire8 : $signed(wire7)) == ($unsigned(wire8[(2'h3):(2'h2)]) > ((&wire6) ?
                  $signed(wire5) : (~|wire9)))) ^ (8'hac));
              reg12 <= {wire7, wire9};
              reg13 <= $unsigned(wire5[(3'h5):(1'h1)]);
            end
          else
            begin
              reg11 <= ($unsigned((|reg12[(1'h1):(1'h1)])) && (~&$signed(wire7[(1'h0):(1'h0)])));
              reg12 <= (^~wire9);
              reg13 <= reg10;
            end
        end
      else
        begin
          reg10 <= $signed($unsigned(wire6));
          reg11 <= {(((~|(|wire6)) > $unsigned((wire9 > wire7))) > (~&$signed($signed(wire8))))};
          if ($signed($unsigned((reg13 ?
              {(wire7 ? (7'h40) : (8'hb1))} : (^~(wire8 || wire7))))))
            begin
              reg12 <= $unsigned(wire5);
              reg13 <= $signed(($signed(reg12) ? wire7 : wire5[(4'h9):(3'h6)]));
              reg14 <= ((($unsigned(wire9[(4'h9):(1'h1)]) ?
                      $signed((wire7 * wire5)) : $unsigned($signed(reg10))) - $signed(($signed(reg10) ^ $signed(wire5)))) ?
                  (8'hbe) : $signed(({((8'hb5) ? wire8 : wire9),
                      reg13[(4'h9):(3'h4)]} * $signed(reg13[(3'h6):(3'h5)]))));
              reg15 <= $unsigned((wire7 ?
                  (+$signed({wire7})) : (reg11 + reg12[(1'h1):(1'h0)])));
              reg16 <= (~|reg11[(4'hb):(3'h5)]);
            end
          else
            begin
              reg12 <= (+$signed((reg12[(2'h2):(1'h0)] | reg11)));
              reg13 <= (^(^~reg10));
              reg14 <= $signed({$signed(wire5[(1'h1):(1'h0)]),
                  wire7[(3'h4):(1'h1)]});
              reg15 <= (reg13[(4'ha):(2'h3)] ?
                  $unsigned($unsigned($unsigned((reg16 ?
                      wire6 : reg15)))) : wire5);
              reg16 <= $unsigned($signed($unsigned(((~&wire5) ?
                  wire9[(4'h9):(4'h9)] : reg10[(1'h0):(1'h0)]))));
            end
        end
      reg17 <= $signed((((!$unsigned(reg10)) ?
          (wire7 ?
              $signed((8'ha9)) : $signed(wire9)) : ($signed(wire7) ~^ reg13[(4'hc):(4'hc)])) && (~(reg14[(3'h7):(3'h7)] ?
          $signed((8'h9f)) : (|reg16)))));
      reg18 <= ((8'h9c) * {$unsigned($unsigned(reg10[(1'h1):(1'h0)])), wire7});
    end
  assign wire19 = $unsigned((wire5[(2'h2):(1'h0)] ?
                      reg18[(4'h8):(4'h8)] : (~|$signed(wire7))));
  assign wire20 = reg14[(3'h5):(2'h2)];
  assign wire21 = ($signed(wire6) ?
                      ((-reg11[(1'h0):(1'h0)]) + (+((reg15 ?
                          wire9 : reg18) < $unsigned(wire20)))) : $signed((^~$unsigned(wire8))));
  assign wire22 = {(wire8[(2'h2):(1'h0)] * {$unsigned($signed(reg12))})};
  module23 #() modinst51 (wire50, clk, reg12, reg10, wire20, reg11);
  assign wire52 = (((reg15[(1'h1):(1'h0)] & (reg10 ?
                              (reg16 << reg10) : $signed(wire9))) ?
                          (^~{(reg17 && reg13)}) : $unsigned(wire5)) ?
                      $unsigned(reg16[(3'h5):(3'h4)]) : (^reg15[(2'h2):(1'h1)]));
  module53 #() modinst91 (.wire54(wire6), .wire57(reg16), .wire58(wire50), .wire56(reg13), .wire55(wire7), .y(wire90), .clk(clk));
  always
    @(posedge clk) begin
      if ($signed((7'h42)))
        begin
          reg92 <= (reg14[(1'h1):(1'h1)] ?
              $unsigned((-((|reg14) ?
                  wire8 : {wire22, reg15}))) : ($unsigned($unsigned((wire19 ?
                  wire20 : reg18))) >>> wire9[(2'h3):(1'h0)]));
          reg93 <= {$unsigned(wire52[(3'h6):(2'h2)])};
          reg94 <= (($unsigned((&reg18)) ^~ wire20) >> (((~^(wire52 & (8'hb5))) ?
                  (+$signed(reg93)) : ($signed(wire6) ?
                      $signed(reg11) : reg13[(4'h9):(4'h9)])) ?
              {(wire6[(4'hb):(1'h1)] ? (~&wire8) : (~^wire90)),
                  (!wire22[(3'h5):(2'h3)])} : wire90[(2'h2):(1'h0)]));
          if ((~&$signed((((reg18 ? wire90 : wire20) ?
                  $signed(wire50) : (!(8'hb0))) ?
              $signed((wire19 >> wire52)) : $signed(wire20[(3'h6):(3'h6)])))))
            begin
              reg95 <= $signed(reg92);
              reg96 <= (reg17[(4'hd):(4'hb)] <= (|wire22[(3'h5):(3'h4)]));
              reg97 <= (($unsigned(reg14[(3'h4):(3'h4)]) || (^$signed(((8'ha6) | reg11)))) ?
                  wire21 : $signed(((reg15[(2'h3):(2'h3)] ?
                          wire50[(3'h7):(1'h1)] : reg14) ?
                      ($unsigned(wire20) & $unsigned(reg12)) : ($unsigned(reg13) ?
                          reg12[(4'h8):(3'h4)] : (reg17 ~^ wire50)))));
              reg98 <= {(^~(wire22 ?
                      reg93[(1'h1):(1'h0)] : (+(reg14 ? (8'hbc) : reg95)))),
                  (({(wire6 >> reg97)} * wire90[(3'h4):(2'h2)]) ?
                      reg17[(4'hd):(1'h0)] : {wire52[(2'h3):(1'h0)]})};
            end
          else
            begin
              reg95 <= (8'hbb);
              reg96 <= reg97;
            end
        end
      else
        begin
          reg92 <= wire7[(4'hb):(3'h4)];
          reg93 <= {((8'hb1) || $signed($signed((8'ha5)))),
              (&((-wire52) >> $signed((reg16 ? wire9 : wire20))))};
          if ($unsigned((+(((reg93 ? reg13 : wire21) >>> wire21) ?
              (+$signed((8'hb4))) : ($signed(wire6) != reg97)))))
            begin
              reg94 <= {$signed(wire52[(3'h7):(1'h0)]),
                  $unsigned((reg94 + reg94[(2'h2):(1'h1)]))};
            end
          else
            begin
              reg94 <= reg13;
            end
        end
    end
  module99 #() modinst135 (wire134, clk, reg97, wire8, reg14, reg12, reg98);
  assign wire136 = {({($signed(reg94) ~^ {wire7})} ?
                           ($signed({reg95, reg11}) <<< (!reg13)) : wire9),
                       $unsigned(wire6[(1'h1):(1'h0)])};
  always
    @(posedge clk) begin
      reg137 <= {reg93[(2'h3):(1'h1)]};
    end
  assign wire138 = {{(8'hb3), ($signed((reg94 ? (8'ha0) : reg14)) ~^ reg137)}};
  always
    @(posedge clk) begin
      if ((reg92[(4'h8):(3'h7)] ?
          (($unsigned($unsigned(wire6)) ?
                  ((wire5 ? reg11 : reg97) | (8'hb2)) : $unsigned((reg11 ?
                      wire5 : reg96))) ?
              (($unsigned(wire52) ?
                  wire9[(4'h9):(1'h1)] : reg10[(2'h3):(2'h2)]) || reg12[(4'h9):(3'h7)]) : $signed($signed((reg12 + wire21)))) : (^$unsigned(((wire90 >>> (8'h9f)) ?
              (!reg16) : $unsigned(wire5))))))
        begin
          reg139 <= wire9;
          reg140 <= {$signed(({(-reg95), {reg16}} ?
                  ((~reg17) - (reg15 ? wire21 : reg97)) : wire22)),
              $signed((((&reg18) >> wire5) ? reg98 : (8'ha0)))};
          if ($signed(wire20[(4'hc):(2'h3)]))
            begin
              reg141 <= (~(|(~&$unsigned(reg14[(2'h3):(2'h3)]))));
              reg142 <= ($unsigned($unsigned((&reg10))) ?
                  ($signed(reg17) ?
                      (((+reg16) ?
                          $unsigned(reg97) : reg18[(3'h5):(1'h1)]) == (8'hac)) : ($signed({reg96,
                          reg13}) - reg95[(2'h2):(1'h0)])) : reg141);
              reg143 <= (~|{((&wire22) <<< $signed($signed(reg97)))});
            end
          else
            begin
              reg141 <= reg15;
              reg142 <= $unsigned((~|{(reg98[(3'h5):(1'h1)] + wire22),
                  {(reg18 ? (8'hb5) : reg98)}}));
              reg143 <= (reg141 ?
                  $signed((reg18[(3'h7):(3'h4)] ?
                      wire50 : $unsigned(wire90[(5'h13):(1'h1)]))) : $signed((wire9 & $signed(reg93))));
              reg144 <= wire134[(4'ha):(1'h1)];
            end
        end
      else
        begin
          reg139 <= {($signed($unsigned($unsigned(wire52))) > {(~&reg12),
                  ((wire5 ? reg16 : wire52) ?
                      (reg97 ? reg142 : (8'hbf)) : $signed((8'hb1)))}),
              (({wire20, $unsigned((8'hab))} < {{wire9,
                      reg143}}) ~^ reg98[(3'h7):(3'h6)])};
          reg140 <= ((!($signed({(8'ha9)}) ?
                  ($unsigned((8'hba)) ?
                      ((8'hb6) ?
                          wire138 : wire7) : (reg93 == wire6)) : $signed(((8'hab) ?
                      (7'h42) : wire7)))) ?
              reg92 : (~$unsigned((((8'h9e) == wire90) >> wire52[(4'h9):(3'h6)]))));
          if (wire50)
            begin
              reg141 <= reg14;
              reg142 <= (wire5 ?
                  $signed((|$unsigned((reg97 ?
                      reg12 : (8'hae))))) : ({$signed((wire90 ?
                          wire19 : reg96)),
                      ({reg12,
                          (8'ha0)} | $unsigned(reg98))} | ((reg95[(3'h7):(2'h2)] + (~&reg11)) ?
                      $unsigned({reg94, reg143}) : ($unsigned(wire7) ?
                          $signed(reg18) : (-reg140)))));
              reg143 <= reg98;
              reg144 <= (reg98[(4'hc):(1'h1)] == reg18[(2'h3):(1'h0)]);
            end
          else
            begin
              reg141 <= wire5;
              reg142 <= reg15[(1'h0):(1'h0)];
              reg143 <= (((~^{$unsigned((8'hb5))}) ?
                      (reg96[(3'h5):(1'h0)] != ((wire8 ? reg16 : (8'ha2)) ?
                          $unsigned(wire138) : (reg144 << (8'had)))) : reg140[(4'ha):(2'h3)]) ?
                  reg144[(1'h0):(1'h0)] : $unsigned($unsigned((~{reg95}))));
              reg144 <= wire138;
            end
          if (($signed(($signed((wire5 == reg13)) ?
                  $signed({reg94, wire7}) : (~&$signed(wire22)))) ?
              reg144 : $signed((reg14 ?
                  ((reg142 ?
                      (8'hba) : reg18) & $signed(reg12)) : $unsigned((^reg16))))))
            begin
              reg145 <= {(8'hb9), $signed(reg141[(3'h6):(1'h0)])};
              reg146 <= (8'h9e);
              reg147 <= wire138[(4'hd):(4'h8)];
              reg148 <= {(reg146[(1'h0):(1'h0)] >>> $unsigned(wire90))};
            end
          else
            begin
              reg145 <= reg144[(1'h1):(1'h0)];
            end
          reg149 <= wire50[(2'h3):(2'h3)];
        end
    end
  assign wire150 = $signed(((reg141[(3'h4):(1'h0)] >> $signed(reg94)) <<< $signed(((wire19 << (8'hbf)) <= ((8'h9f) ?
                       reg139 : reg15)))));
  module151 #() modinst190 (.y(wire189), .wire153(reg98), .wire155(reg140), .wire152(reg92), .wire154(reg143), .clk(clk));
  always
    @(posedge clk) begin
      reg191 <= reg140;
      reg192 <= $signed(({reg93[(1'h0):(1'h0)]} ?
          $unsigned((|$signed(wire5))) : (((~^wire20) >>> $signed(reg141)) ?
              (reg10[(3'h7):(2'h2)] <= wire9[(2'h3):(2'h3)]) : {$unsigned(reg143)})));
      if ($signed($signed(((~&$signed(reg148)) ?
          ($signed(reg11) ?
              reg96[(3'h4):(2'h3)] : reg14) : $signed(reg146[(3'h5):(2'h2)])))))
        begin
          reg193 <= $signed({$unsigned((&$signed(wire8))),
              {$signed((^~wire150))}});
          reg194 <= {wire9, reg146[(4'hf):(3'h5)]};
          reg195 <= ((reg16[(3'h7):(1'h1)] >> reg137) ?
              wire22[(3'h4):(2'h2)] : reg97[(2'h2):(1'h1)]);
        end
      else
        begin
          reg193 <= reg137;
          reg194 <= ((((-(reg96 ~^ reg97)) >>> reg17[(4'he):(4'h9)]) ?
                  {{(reg195 + reg94), $unsigned(reg95)},
                      {(reg149 ? reg194 : reg11),
                          {reg13,
                              reg145}}} : $signed($signed((reg145 | (8'hb9))))) ?
              ((reg11[(3'h4):(2'h3)] ? $signed(reg12) : wire189) ?
                  wire19[(4'h9):(3'h5)] : $unsigned(wire50)) : (^(reg96 ?
                  $unsigned($signed(reg192)) : {((8'hb7) || wire52)})));
          if (wire8)
            begin
              reg195 <= $unsigned(reg18);
              reg196 <= ((~^(reg16[(5'h10):(4'hd)] ^~ $unsigned((reg143 + reg11)))) ?
                  (8'hbb) : reg148[(4'h8):(3'h7)]);
            end
          else
            begin
              reg195 <= $signed(($unsigned((|(&wire21))) < (reg149[(5'h11):(5'h11)] ?
                  wire150 : {$unsigned(reg98)})));
            end
          reg197 <= reg14[(2'h2):(1'h0)];
        end
    end
  assign wire198 = $signed($signed(($signed(reg14[(3'h4):(2'h3)]) < (8'ha7))));
  assign wire199 = $unsigned(reg148[(4'h8):(2'h2)]);
  assign wire200 = $signed($unsigned({$unsigned(reg193[(4'hf):(4'hf)]),
                       reg10}));
endmodule

module module151  (y, clk, wire155, wire154, wire153, wire152);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire155;
  input wire [(4'hb):(1'h0)] wire154;
  input wire signed [(5'h12):(1'h0)] wire153;
  input wire [(3'h6):(1'h0)] wire152;
  wire signed [(4'hb):(1'h0)] wire188;
  wire signed [(4'ha):(1'h0)] wire187;
  wire signed [(3'h4):(1'h0)] wire186;
  wire [(3'h5):(1'h0)] wire185;
  wire signed [(5'h10):(1'h0)] wire169;
  wire signed [(4'h9):(1'h0)] wire167;
  wire [(2'h2):(1'h0)] wire166;
  wire signed [(3'h6):(1'h0)] wire165;
  wire signed [(4'he):(1'h0)] wire164;
  wire signed [(4'hf):(1'h0)] wire163;
  wire signed [(4'hf):(1'h0)] wire162;
  wire signed [(4'hf):(1'h0)] wire161;
  wire [(3'h4):(1'h0)] wire160;
  wire [(4'hc):(1'h0)] wire159;
  wire [(2'h2):(1'h0)] wire158;
  wire [(3'h4):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire156;
  reg [(3'h4):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg183 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg182 = (1'h0);
  reg [(5'h14):(1'h0)] reg181 = (1'h0);
  reg [(5'h14):(1'h0)] reg180 = (1'h0);
  reg [(2'h3):(1'h0)] reg179 = (1'h0);
  reg [(4'hf):(1'h0)] reg178 = (1'h0);
  reg [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg173 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg172 = (1'h0);
  reg [(5'h14):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg170 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg168 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire169,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 reg184,
                 reg183,
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
                 reg168,
                 (1'h0)};
  assign wire156 = wire154[(4'h9):(4'h9)];
  assign wire157 = wire154[(3'h6):(3'h4)];
  assign wire158 = wire153;
  assign wire159 = (wire155 ? wire158[(2'h2):(2'h2)] : wire156[(2'h2):(2'h2)]);
  assign wire160 = (~(wire155[(2'h2):(1'h1)] && wire152[(3'h5):(1'h0)]));
  assign wire161 = wire152;
  assign wire162 = ((-(wire159[(3'h5):(3'h5)] < {(8'h9e),
                       (~wire152)})) + {{wire157}});
  assign wire163 = {(($unsigned((~wire161)) ?
                           wire160 : wire157) || (~&((wire154 ?
                           wire152 : wire159) << (wire157 ?
                           (8'ha3) : wire156)))),
                       wire157[(1'h1):(1'h1)]};
  assign wire164 = {wire153[(3'h4):(1'h0)], wire154[(3'h7):(1'h1)]};
  assign wire165 = wire154[(1'h0):(1'h0)];
  assign wire166 = $signed(wire164[(1'h1):(1'h1)]);
  assign wire167 = $unsigned({$signed((wire157 ^ $signed(wire152)))});
  always
    @(posedge clk) begin
      reg168 <= $unsigned(wire161[(3'h6):(1'h0)]);
    end
  assign wire169 = $unsigned(((^~wire155[(1'h0):(1'h0)]) ^~ $signed(reg168)));
  always
    @(posedge clk) begin
      if ((~|wire164))
        begin
          if (wire154[(3'h4):(2'h3)])
            begin
              reg170 <= wire158[(1'h1):(1'h1)];
              reg171 <= $unsigned((((^~(reg168 ? wire164 : wire167)) ?
                  wire161[(4'he):(4'hb)] : (wire157 != wire164)) && (~|wire159[(4'hc):(4'hc)])));
            end
          else
            begin
              reg170 <= $unsigned($signed(wire166[(2'h2):(2'h2)]));
            end
        end
      else
        begin
          reg170 <= (+(((~^$unsigned(wire161)) <<< $unsigned((reg171 == (8'h9c)))) >> (~^(!(-reg168)))));
          reg171 <= reg170[(2'h2):(2'h2)];
          reg172 <= $unsigned($signed(wire166[(1'h0):(1'h0)]));
          reg173 <= wire156[(4'h9):(4'h8)];
          if ((-$unsigned($unsigned((reg170[(1'h0):(1'h0)] ?
              {wire161} : (8'hbe))))))
            begin
              reg174 <= reg172[(1'h1):(1'h1)];
              reg175 <= $signed({$unsigned((8'hbb))});
              reg176 <= ($signed((~&{$signed(reg172)})) ?
                  wire165 : $unsigned($unsigned({((7'h40) <= reg175),
                      (wire169 <<< (8'hbd))})));
              reg177 <= (~&$unsigned((!wire161[(3'h7):(3'h7)])));
            end
          else
            begin
              reg174 <= wire157[(2'h2):(1'h1)];
              reg175 <= ($signed(((wire159 != $signed(wire164)) + (^~(reg168 ?
                      wire156 : wire165)))) ?
                  wire152 : ((((~wire160) < (wire157 ?
                          (8'hb6) : wire169)) >>> $unsigned((wire158 & reg177))) ?
                      ((!$unsigned(wire157)) ?
                          {(+(8'hb5))} : (-(wire161 & wire154))) : wire155[(2'h2):(1'h1)]));
            end
        end
      reg178 <= (~&wire157[(2'h3):(2'h2)]);
      reg179 <= {wire169[(1'h0):(1'h0)]};
      reg180 <= ((reg176[(3'h4):(2'h2)] <= $unsigned(($signed(wire164) ?
              (reg171 ? wire166 : wire167) : reg175[(1'h0):(1'h0)]))) ?
          (!($unsigned({reg170}) ^~ $signed((wire164 ?
              reg178 : wire161)))) : {wire156,
              $unsigned($signed((reg175 ? reg176 : wire152)))});
      reg181 <= $unsigned({$unsigned((reg171 & (wire167 + (8'hab))))});
    end
  always
    @(posedge clk) begin
      reg182 <= $unsigned($signed(reg176));
      reg183 <= ((^wire164[(1'h1):(1'h1)]) ?
          $signed($signed($signed(wire158[(1'h1):(1'h1)]))) : ((!wire159) ?
              reg176[(3'h4):(1'h0)] : (wire165 <= reg175)));
      reg184 <= wire165;
    end
  assign wire185 = $unsigned((wire164[(4'hb):(4'ha)] ?
                       {reg180} : $unsigned(wire166[(2'h2):(1'h1)])));
  assign wire186 = ((+reg168[(1'h0):(1'h0)]) ?
                       (8'ha3) : ($signed(wire166[(2'h2):(1'h0)]) | {(^(wire166 >> wire155))}));
  assign wire187 = {$signed(wire162[(3'h5):(2'h2)])};
  assign wire188 = (wire187[(1'h0):(1'h0)] > {(-($signed(wire165) * $signed(reg178))),
                       $signed($unsigned($unsigned(wire163)))});
endmodule

module module99  (y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire104;
  input wire [(3'h5):(1'h0)] wire103;
  input wire signed [(3'h5):(1'h0)] wire102;
  input wire signed [(5'h11):(1'h0)] wire101;
  input wire signed [(4'hc):(1'h0)] wire100;
  wire [(5'h10):(1'h0)] wire133;
  wire signed [(4'ha):(1'h0)] wire132;
  wire signed [(5'h13):(1'h0)] wire131;
  wire [(4'ha):(1'h0)] wire130;
  wire [(4'hc):(1'h0)] wire129;
  wire signed [(3'h5):(1'h0)] wire128;
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg105 <= $signed((wire102[(1'h0):(1'h0)] | wire100[(4'hb):(3'h7)]));
      reg106 <= ((8'ha8) ? wire100[(3'h5):(2'h3)] : reg105[(2'h3):(1'h1)]);
      if ((((8'ha4) & $unsigned($unsigned(wire102))) >>> wire103))
        begin
          reg107 <= wire103;
        end
      else
        begin
          if ({(reg107 ?
                  wire101[(4'he):(3'h5)] : $signed($signed((wire100 ?
                      wire102 : reg105))))})
            begin
              reg107 <= wire100[(4'hb):(3'h7)];
              reg108 <= (((|wire100) > ((&$unsigned(reg107)) ?
                  (wire104[(2'h2):(2'h2)] ?
                      wire100[(4'ha):(2'h2)] : (wire104 && wire100)) : {wire104,
                      (reg105 ? wire102 : reg106)})) ^ wire103[(2'h3):(1'h0)]);
              reg109 <= {$signed(reg105)};
              reg110 <= {((reg106[(2'h2):(1'h0)] ?
                          (~|(wire100 ?
                              reg105 : wire103)) : (^~$signed(reg105))) ?
                      (~(^(reg109 >= wire102))) : wire102[(1'h0):(1'h0)])};
            end
          else
            begin
              reg107 <= ($unsigned(((^$unsigned((8'hb5))) & reg110)) ?
                  reg106 : (~&reg107[(1'h0):(1'h0)]));
            end
          if ($signed((reg110[(4'hb):(3'h7)] ?
              ($unsigned(((8'h9f) ? reg106 : reg105)) ?
                  $signed((wire104 ?
                      reg105 : reg107)) : wire101) : $unsigned(reg106))))
            begin
              reg111 <= reg106[(1'h1):(1'h1)];
              reg112 <= $signed(reg105);
              reg113 <= (8'hbe);
            end
          else
            begin
              reg111 <= wire103;
            end
          reg114 <= $signed($signed((reg108 ?
              $unsigned(wire100[(4'h8):(2'h2)]) : ({(8'h9d)} ?
                  reg105[(2'h3):(1'h1)] : (wire101 ? (8'ha4) : reg113)))));
          if ($signed({reg110}))
            begin
              reg115 <= (~&reg108[(4'h9):(2'h2)]);
              reg116 <= ({{wire104[(2'h2):(1'h1)]}} & reg112);
            end
          else
            begin
              reg115 <= (reg109[(3'h7):(3'h5)] ^~ $unsigned((&$signed(((8'ha5) ?
                  reg114 : (8'hb1))))));
              reg116 <= (reg105[(1'h0):(1'h0)] ^~ $signed(reg105[(2'h3):(1'h1)]));
              reg117 <= $signed(($signed($unsigned(reg106[(4'ha):(2'h2)])) ?
                  (-reg109) : ((|reg114) ?
                      reg110[(1'h1):(1'h0)] : $signed(wire101[(4'h8):(3'h7)]))));
              reg118 <= $unsigned({reg109});
            end
        end
      if ((reg109 ? wire102[(2'h2):(1'h0)] : wire100[(3'h5):(3'h4)]))
        begin
          reg119 <= wire104[(2'h2):(1'h1)];
        end
      else
        begin
          reg119 <= ((reg110 ? (~$unsigned($signed(reg114))) : (8'hb0)) ?
              ($signed($signed(reg106)) >>> wire103) : ((+((reg105 ?
                  reg105 : reg112) >= $signed(reg106))) * reg106));
          if ((+reg118[(4'hb):(4'ha)]))
            begin
              reg120 <= reg113;
              reg121 <= $unsigned(wire104[(2'h3):(2'h2)]);
              reg122 <= $unsigned({reg116[(2'h2):(1'h0)]});
            end
          else
            begin
              reg120 <= {$signed(($unsigned((wire104 <= reg110)) != ((&reg117) == {reg122}))),
                  (8'hb6)};
              reg121 <= (((((-reg106) ?
                          (reg106 ? reg115 : reg119) : (-wire100)) * ((reg105 ?
                          reg121 : (8'ha3)) ^~ reg122[(4'h9):(3'h6)])) ?
                      ($signed((&(8'hb6))) >> ((reg107 <= reg116) ?
                          (+wire102) : ((8'ha7) ?
                              (8'h9f) : reg115))) : $signed(reg109[(4'hb):(4'h9)])) ?
                  (~&(!reg117)) : {reg119[(5'h11):(3'h6)]});
              reg122 <= reg108;
            end
          if (reg110[(3'h4):(2'h2)])
            begin
              reg123 <= reg110;
            end
          else
            begin
              reg123 <= (~|($unsigned(((reg120 ?
                      reg117 : reg109) ^~ (reg112 > reg106))) ?
                  ({{reg122}, {(8'ha4)}} == reg106) : $signed($signed((wire101 ?
                      (8'hab) : reg107)))));
              reg124 <= ($unsigned($signed((~|(^~reg118)))) ?
                  {wire102} : {(~|{$signed(reg113), $unsigned(reg107)}),
                      ((~(~^reg107)) <= $signed(reg115[(3'h5):(1'h1)]))});
              reg125 <= ({(8'ha4), ($signed((reg117 - (8'hae))) <= wire101)} ?
                  {reg107,
                      (~|(~reg109[(4'h9):(2'h3)]))} : $signed($signed(((+wire101) <<< (wire104 && (8'had))))));
              reg126 <= reg117[(3'h5):(3'h5)];
            end
          reg127 <= (+((8'haf) > ((7'h42) ?
              reg110[(1'h0):(1'h0)] : $unsigned($signed(reg115)))));
        end
    end
  assign wire128 = {$signed((reg127 << ($signed(reg120) ?
                           $signed(reg112) : {reg112, (8'ha5)})))};
  assign wire129 = wire128[(1'h0):(1'h0)];
  assign wire130 = {(+(&((^reg113) >> $signed(reg114)))),
                       reg127[(2'h2):(1'h0)]};
  assign wire131 = wire100[(4'ha):(4'h9)];
  assign wire132 = (reg124 ?
                       (8'ha2) : ((8'ha0) ?
                           wire128[(2'h2):(1'h0)] : $unsigned({$signed(reg112),
                               reg127})));
  assign wire133 = {$unsigned((wire103[(2'h3):(1'h1)] ?
                           ((reg118 >> wire103) >>> $signed(reg119)) : {(reg113 ?
                                   reg113 : reg114)}))};
endmodule

module module53  (y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire58;
  input wire [(5'h10):(1'h0)] wire57;
  input wire [(5'h11):(1'h0)] wire56;
  input wire [(5'h14):(1'h0)] wire55;
  input wire [(4'hc):(1'h0)] wire54;
  wire signed [(2'h2):(1'h0)] wire89;
  wire signed [(5'h12):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire59;
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire59,
                 reg85,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire59 = $signed(({$signed((wire56 & wire55)),
                          ($unsigned(wire54) <<< {wire58})} ?
                      (wire58[(3'h5):(3'h5)] ?
                          wire54[(2'h3):(2'h2)] : {wire56}) : $signed(wire56)));
  always
    @(posedge clk) begin
      reg60 <= (&(&((|wire54[(3'h4):(2'h3)]) | ((wire54 > (8'haf)) ?
          $signed(wire58) : wire55[(2'h3):(2'h3)]))));
      reg61 <= (wire56[(5'h11):(4'h8)] >>> wire54[(4'h9):(3'h6)]);
      reg62 <= $unsigned((-(8'h9e)));
    end
  assign wire63 = wire54;
  assign wire64 = ($unsigned($unsigned($signed(((8'hba) == wire56)))) - (wire55 <<< reg61));
  assign wire65 = wire55[(3'h7):(3'h7)];
  assign wire66 = $signed($unsigned(((wire57 ? (wire64 ~^ wire63) : reg61) ?
                      ((wire55 ?
                          wire64 : wire63) > reg60[(1'h0):(1'h0)]) : $signed((~(8'hbd))))));
  assign wire67 = ($unsigned($unsigned((8'hb6))) ? wire54 : wire65);
  always
    @(posedge clk) begin
      reg68 <= {(-reg62)};
      reg69 <= wire64[(5'h11):(3'h4)];
      if (wire66)
        begin
          reg70 <= wire64;
        end
      else
        begin
          reg70 <= reg68[(5'h12):(5'h10)];
          reg71 <= ((+wire57) ?
              reg62[(4'hf):(3'h4)] : $signed(((wire54 < wire56[(4'hf):(4'ha)]) ?
                  wire67 : wire58[(3'h4):(3'h4)])));
        end
      reg72 <= $signed((8'h9e));
    end
  always
    @(posedge clk) begin
      reg73 <= ($unsigned(wire59) + $unsigned(((wire55 >= $signed(wire67)) <<< (&reg72[(1'h0):(1'h0)]))));
      reg74 <= reg72;
      reg75 <= (-(wire55 <<< ($signed(wire63[(3'h5):(1'h0)]) ?
          ((8'ha7) << {reg74}) : wire64)));
    end
  assign wire76 = (8'hb4);
  assign wire77 = reg62;
  assign wire78 = {$signed(wire63[(1'h0):(1'h0)]),
                      (reg73 >>> (-(wire67[(2'h3):(1'h1)] ?
                          (wire77 ? reg72 : wire55) : (~|reg60))))};
  assign wire79 = reg62[(4'hb):(1'h1)];
  assign wire80 = (((|(((8'hbe) && wire77) ?
                          $signed(wire65) : (reg69 ?
                              wire65 : wire58))) >= $unsigned(reg75[(2'h3):(1'h0)])) ?
                      reg71[(2'h3):(2'h2)] : wire76);
  assign wire81 = (8'h9f);
  assign wire82 = ($signed((wire76 * reg75)) ?
                      ({reg69} < ((|(wire65 ?
                          reg70 : wire59)) ^~ reg62[(3'h5):(3'h5)])) : (!wire80[(2'h2):(2'h2)]));
  assign wire83 = ((~wire78[(1'h1):(1'h0)]) >>> {wire58[(4'ha):(4'h9)],
                      wire67});
  assign wire84 = (reg70[(3'h6):(2'h2)] ?
                      $unsigned($signed(({reg60,
                          reg70} || (reg72 >> wire58)))) : $signed(reg74[(3'h6):(3'h5)]));
  always
    @(posedge clk) begin
      reg85 <= $unsigned((!$unsigned(reg61[(1'h0):(1'h0)])));
    end
  assign wire86 = {wire76[(4'h8):(2'h3)], {$signed((8'hab))}};
  assign wire87 = {$signed(($signed(wire66[(3'h5):(2'h3)]) != reg71))};
  assign wire88 = (&{wire65[(4'h9):(2'h2)],
                      ((^~(reg70 ? reg68 : wire63)) < ((wire66 ?
                          wire55 : wire84) >= $signed(reg75)))});
  assign wire89 = (^($unsigned(wire77[(4'ha):(3'h7)]) ?
                      ($signed(wire86[(1'h0):(1'h0)]) ?
                          {wire67} : {{wire59,
                                  wire57}}) : $unsigned(((reg73 * wire63) ?
                          wire56[(3'h6):(3'h5)] : wire59[(2'h3):(2'h2)]))));
endmodule

module module23  (y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire27;
  input wire [(3'h6):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire [(5'h11):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire32;
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 reg46,
                 reg39,
                 reg38,
                 reg33,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= $signed($signed((~|$unsigned($unsigned((8'hb4))))));
      reg29 <= (8'hb1);
      reg30 <= wire26[(3'h5):(3'h4)];
      reg31 <= wire24;
    end
  assign wire32 = $unsigned((^$unsigned(((+reg28) != wire27[(4'he):(1'h0)]))));
  always
    @(posedge clk) begin
      reg33 <= $signed(wire27[(3'h5):(1'h0)]);
    end
  assign wire34 = (~&(-{{$unsigned(reg31)}, wire25[(1'h1):(1'h1)]}));
  assign wire35 = reg28[(2'h2):(1'h0)];
  assign wire36 = reg28;
  assign wire37 = ($unsigned((wire24[(2'h2):(2'h2)] > wire24[(5'h10):(4'hc)])) ?
                      ($signed(wire27[(4'hc):(3'h7)]) ?
                          ((~(wire36 ?
                              (8'hba) : reg30)) > wire32) : $signed({wire32[(1'h1):(1'h0)],
                              $signed(wire24)})) : (!{$unsigned($unsigned(reg28)),
                          $unsigned((wire26 ? reg31 : reg30))}));
  always
    @(posedge clk) begin
      reg38 <= wire27[(1'h1):(1'h0)];
      reg39 <= wire27[(4'h9):(3'h6)];
    end
  assign wire40 = reg30[(2'h3):(1'h0)];
  assign wire41 = ((((^((8'hbf) < wire40)) & ($signed(reg33) ?
                          (wire36 ? reg30 : (8'h9d)) : wire34)) ?
                      $unsigned(reg39) : (({wire25} < {wire40, (8'hbf)}) ?
                          reg31[(1'h0):(1'h0)] : $signed($unsigned(wire36)))) <<< (^wire34));
  assign wire42 = ((|$unsigned($signed(wire40[(5'h11):(1'h1)]))) ?
                      wire26[(3'h4):(3'h4)] : $signed((8'h9c)));
  assign wire43 = reg31;
  assign wire44 = (reg31 ? wire24[(4'he):(2'h3)] : (|wire43[(2'h3):(2'h2)]));
  assign wire45 = (reg29[(2'h3):(2'h2)] < $signed((|($unsigned(wire37) ?
                      ((8'ha7) * wire35) : (|wire26)))));
  always
    @(posedge clk) begin
      reg46 <= {($signed(({wire43} <= $signed((8'haf)))) ?
              $unsigned(wire41) : (((wire34 && (8'haf)) ~^ {reg30}) >= (!(wire41 ?
                  wire37 : wire41))))};
    end
  assign wire47 = ((!(((^~wire37) > $signed(reg38)) ?
                      reg31 : wire44[(3'h5):(1'h0)])) * $signed(($signed({wire36}) ?
                      (~^(~wire26)) : (!(&wire27)))));
  assign wire48 = ($signed(((+$signed(wire40)) ~^ $signed((!wire27)))) ?
                      wire37[(1'h1):(1'h0)] : {wire43[(3'h4):(2'h2)],
                          (((~|(8'ha0)) ? (wire27 >>> wire47) : (|(7'h40))) ?
                              (((8'ha4) ^~ reg31) ?
                                  $unsigned(wire41) : (wire26 ?
                                      (8'ha8) : wire47)) : wire35[(1'h1):(1'h0)])});
  assign wire49 = reg29[(1'h0):(1'h0)];
endmodule
