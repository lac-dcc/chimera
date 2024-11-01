module top
#(parameter param211 = (((~{((8'ha5) ? (8'ha1) : (7'h44))}) > (((^(7'h42)) <<< (!(8'hab))) ? {((7'h44) - (8'hac))} : (~^(8'hbd)))) ? (~((((8'hb9) != (8'ha2)) ? (^~(8'h9c)) : ((8'hb2) ? (8'hac) : (8'hb5))) * (8'ha8))) : (|{(((7'h40) ? (8'ha1) : (8'hb2)) && {(8'ha3), (8'hbb)})})), 
parameter param212 = ((!param211) << (~|(~|{{(8'ha7), (8'hb6)}, {param211}}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire210;
  wire signed [(4'hd):(1'h0)] wire209;
  wire [(3'h4):(1'h0)] wire203;
  wire [(5'h13):(1'h0)] wire202;
  wire [(5'h14):(1'h0)] wire186;
  wire [(5'h14):(1'h0)] wire185;
  wire signed [(5'h13):(1'h0)] wire184;
  wire [(5'h14):(1'h0)] wire183;
  wire signed [(5'h13):(1'h0)] wire182;
  wire signed [(5'h13):(1'h0)] wire181;
  wire [(5'h14):(1'h0)] wire180;
  wire [(4'h9):(1'h0)] wire178;
  wire signed [(4'ha):(1'h0)] wire188;
  wire signed [(2'h3):(1'h0)] wire205;
  wire signed [(4'h8):(1'h0)] wire206;
  wire [(5'h13):(1'h0)] wire207;
  reg [(4'hb):(1'h0)] reg201 = (1'h0);
  reg [(5'h11):(1'h0)] reg200 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg199 = (1'h0);
  reg [(5'h13):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg196 = (1'h0);
  reg [(5'h13):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg194 = (1'h0);
  reg [(4'hf):(1'h0)] reg193 = (1'h0);
  reg [(2'h2):(1'h0)] reg192 = (1'h0);
  reg [(2'h3):(1'h0)] reg191 = (1'h0);
  reg [(4'he):(1'h0)] reg190 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire210,
                 wire209,
                 wire203,
                 wire202,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire178,
                 wire188,
                 wire205,
                 wire206,
                 wire207,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire3);
      reg6 <= (~^$unsigned($unsigned({((8'ha8) ? (8'hbe) : wire0), wire0})));
      reg7 <= ($signed((7'h44)) ?
          $unsigned(wire0[(3'h5):(2'h3)]) : ($unsigned(reg6[(4'h8):(2'h3)]) ?
              $signed(reg6) : (wire2 ? (7'h43) : wire4)));
      if ({$signed($unsigned((|(8'haa))))})
        begin
          reg8 <= (!reg7[(1'h1):(1'h0)]);
        end
      else
        begin
          reg8 <= (^(wire3 ? reg5[(1'h1):(1'h0)] : wire1));
        end
    end
  module9 #() modinst179 (wire178, clk, wire0, reg8, reg5, reg7, wire3);
  assign wire180 = ($unsigned(($unsigned($signed(reg8)) ?
                           (reg8[(4'hb):(3'h5)] >= $signed(reg8)) : wire3[(4'hb):(4'ha)])) ?
                       ($signed(({wire1} ? (wire1 ? wire4 : reg5) : {reg6})) ?
                           wire4 : (wire178 ?
                               wire3[(2'h2):(1'h0)] : $signed($signed(wire3)))) : (|(8'hae)));
  assign wire181 = (|reg5);
  assign wire182 = {reg8[(3'h4):(3'h4)]};
  assign wire183 = (&$unsigned((&reg6)));
  assign wire184 = wire2;
  assign wire185 = (($signed(($signed(reg8) ?
                           (wire181 ?
                               wire180 : (8'h9c)) : reg6)) == $signed(wire182)) ?
                       $unsigned(reg8) : (-(|reg6[(3'h7):(3'h4)])));
  module133 #() modinst187 (.y(wire186), .wire136(wire182), .wire135(wire184), .clk(clk), .wire137(wire180), .wire134(reg6));
  module61 #() modinst189 (.y(wire188), .wire63(wire3), .wire66(wire2), .wire64(wire1), .clk(clk), .wire65(wire4), .wire62(wire181));
  always
    @(posedge clk) begin
      reg190 <= (8'hb6);
      if ((8'ha7))
        begin
          reg191 <= ((reg5 <<< reg5[(5'h11):(4'hb)]) + ({((8'ha9) ~^ $signed(reg7))} ?
              wire3[(5'h13):(4'he)] : (~|({wire1} ~^ $unsigned(wire3)))));
          reg192 <= (-(wire185 == wire2));
          reg193 <= $signed(wire4[(5'h12):(5'h10)]);
          reg194 <= reg5;
        end
      else
        begin
          if ({wire178})
            begin
              reg191 <= $unsigned(((reg190[(3'h4):(2'h3)] >>> wire3[(4'ha):(3'h7)]) & $signed($signed((reg8 ?
                  wire2 : reg7)))));
              reg192 <= (8'ha4);
            end
          else
            begin
              reg191 <= $unsigned(reg5);
              reg192 <= ((!(^~{(&wire181)})) - $unsigned(wire188));
              reg193 <= (^~(wire185 >= (~{{reg190, wire3},
                  (wire2 ? wire4 : wire180)})));
              reg194 <= ((^({$unsigned(reg7)} >= (~|{wire4}))) ?
                  {(|$unsigned(wire1[(1'h1):(1'h1)])),
                      wire185[(4'hc):(4'ha)]} : (^~((~&$unsigned(reg8)) ?
                      ((reg6 << (8'h9e)) ?
                          $unsigned((7'h44)) : (wire180 < (8'h9d))) : $signed($unsigned(reg7)))));
              reg195 <= (+($signed(reg194) ?
                  $unsigned(reg192[(2'h2):(1'h0)]) : wire1));
            end
          if (((-$unsigned($unsigned((wire181 | wire178)))) - wire185[(3'h5):(2'h3)]))
            begin
              reg196 <= ($unsigned(wire188) ?
                  wire186 : $signed($signed($signed((reg6 == reg194)))));
              reg197 <= wire183;
              reg198 <= (8'ha3);
              reg199 <= {((+reg195[(5'h12):(2'h2)]) < (!{wire3[(5'h11):(1'h0)]})),
                  wire178};
            end
          else
            begin
              reg196 <= (^~({(^$unsigned(reg191)),
                  wire0} ~^ $signed(($signed(wire1) || (7'h44)))));
              reg197 <= reg192;
            end
          reg200 <= {(8'had)};
        end
      reg201 <= {{{wire188, ((|wire3) & (|reg190))}, reg192}};
    end
  assign wire202 = wire182[(1'h1):(1'h0)];
  module9 #() modinst204 (.y(wire203), .wire12(reg197), .wire14(wire186), .clk(clk), .wire11(wire180), .wire13(wire0), .wire10(reg198));
  assign wire205 = (((^{(reg191 ? wire182 : (8'hb1)),
                       reg194[(2'h2):(2'h2)]}) <= (~|wire203)) >= wire202);
  assign wire206 = (reg8[(2'h2):(1'h0)] & wire203[(1'h0):(1'h0)]);
  module9 #() modinst208 (.clk(clk), .wire14(wire183), .y(wire207), .wire12(wire182), .wire13(reg200), .wire11(wire185), .wire10(reg195));
  assign wire209 = (($unsigned($unsigned($signed(wire180))) >>> (~&{(wire181 | reg193)})) ?
                       wire183 : (reg200[(4'h8):(3'h7)] ?
                           wire186[(2'h2):(2'h2)] : $unsigned(((reg191 ?
                                   wire185 : wire188) ?
                               (reg7 < wire186) : wire4))));
  assign wire210 = ((({wire180[(5'h10):(2'h3)]} ~^ $unsigned((reg194 >= wire188))) && {$unsigned(wire202[(1'h1):(1'h0)])}) ?
                       (^$unsigned(($unsigned(wire209) < reg197))) : {(^~(^reg6[(1'h1):(1'h0)]))});
endmodule

module module9
#(parameter param176 = (8'hbd), 
parameter param177 = param176)
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h22d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire175;
  wire [(5'h15):(1'h0)] wire174;
  wire signed [(3'h4):(1'h0)] wire172;
  wire signed [(4'he):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire132;
  wire [(4'hf):(1'h0)] wire144;
  wire [(5'h11):(1'h0)] wire146;
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(4'h8):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg152 = (1'h0);
  reg [(5'h15):(1'h0)] reg153 = (1'h0);
  reg [(4'he):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg158 = (1'h0);
  reg [(5'h13):(1'h0)] reg159 = (1'h0);
  reg [(5'h11):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg161 = (1'h0);
  reg [(5'h15):(1'h0)] reg162 = (1'h0);
  reg [(3'h4):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg164 = (1'h0);
  reg [(4'hb):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg [(3'h5):(1'h0)] reg167 = (1'h0);
  reg [(2'h3):(1'h0)] reg168 = (1'h0);
  reg [(5'h15):(1'h0)] reg169 = (1'h0);
  reg [(4'hc):(1'h0)] reg170 = (1'h0);
  reg [(3'h4):(1'h0)] reg171 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire172,
                 wire129,
                 wire76,
                 wire75,
                 wire74,
                 wire58,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 wire60,
                 wire72,
                 wire131,
                 wire132,
                 wire144,
                 wire146,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
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
                 (1'h0)};
  module15 #() modinst28 (.wire18(wire11), .wire16(wire10), .y(wire27), .clk(clk), .wire17(wire13), .wire19(wire14));
  assign wire29 = $unsigned(wire12);
  assign wire30 = ((!wire11[(5'h13):(4'hb)]) ?
                      wire10[(4'he):(4'hc)] : wire11[(5'h13):(4'h8)]);
  assign wire31 = wire14;
  module32 #() modinst59 (wire58, clk, wire12, wire31, wire13, wire27, wire10);
  assign wire60 = {(!wire29[(4'h8):(3'h7)])};
  module61 #() modinst73 (wire72, clk, wire14, wire30, wire27, wire11, wire31);
  assign wire74 = (~^(8'hbe));
  assign wire75 = $signed(wire30[(3'h6):(2'h2)]);
  assign wire76 = wire30[(5'h13):(2'h3)];
  module77 #() modinst130 (.wire82(wire72), .wire79(wire12), .y(wire129), .wire80(wire75), .wire81(wire76), .clk(clk), .wire78(wire11));
  assign wire131 = wire27;
  assign wire132 = $unsigned($unsigned(wire74));
  module133 #() modinst145 (wire144, clk, wire13, wire29, wire27, wire72);
  module77 #() modinst147 (wire146, clk, wire31, wire132, wire72, wire58, wire14);
  always
    @(posedge clk) begin
      reg148 <= $unsigned(wire58[(3'h7):(3'h7)]);
      if ((wire13[(2'h3):(1'h0)] ?
          (+$signed(($signed((8'h9e)) ?
              wire12[(5'h13):(2'h3)] : {wire30, (8'hb4)}))) : wire14))
        begin
          if (wire29)
            begin
              reg149 <= ($signed(($unsigned($unsigned(wire11)) ?
                      wire132 : (~^$signed(wire29)))) ?
                  (^~wire14) : (~wire144));
              reg150 <= (wire72 ?
                  (((8'ha4) ?
                      $signed(wire72[(4'hd):(4'h8)]) : $signed($signed(wire129))) <<< ((-(wire132 ?
                          (8'ha2) : (8'ha0))) ?
                      {(wire13 ? wire131 : wire72),
                          $signed(wire76)} : $signed(wire129[(4'h9):(3'h5)]))) : $signed(({$unsigned(wire58)} ?
                      wire144 : $signed((wire29 ? wire29 : wire72)))));
              reg151 <= (^~($unsigned((wire72 > wire27)) >>> $unsigned(wire13)));
              reg152 <= $signed($signed(({(wire10 ^~ (8'ha5))} ?
                  $signed(reg149) : $unsigned($unsigned((8'hab))))));
            end
          else
            begin
              reg149 <= {(8'hb7)};
              reg150 <= {wire60[(4'hc):(1'h1)]};
              reg151 <= {$unsigned($signed(($unsigned(reg151) | reg152))),
                  (($unsigned((-wire10)) * wire129[(3'h7):(1'h1)]) ?
                      {((wire58 > reg152) == wire144),
                          wire30[(3'h4):(1'h0)]} : ($unsigned(wire31) >> {(^~wire74)}))};
              reg152 <= wire146[(3'h4):(2'h2)];
            end
          reg153 <= $unsigned(((wire74 ?
                  ((wire31 ? wire31 : wire146) ?
                      (-wire30) : wire30[(5'h11):(1'h0)]) : (&(wire27 ?
                      wire76 : (7'h40)))) ?
              wire11[(3'h5):(2'h3)] : (~$unsigned((wire31 < (8'h9e))))));
        end
      else
        begin
          reg149 <= ({{((8'ha6) < (8'hb6))}} != ($unsigned($signed($unsigned(reg149))) ?
              $unsigned($signed((wire58 & reg149))) : (^reg151[(1'h0):(1'h0)])));
        end
      if ($signed($signed($unsigned(((wire129 & wire31) ?
          $signed(wire10) : reg150[(1'h1):(1'h1)])))))
        begin
          reg154 <= wire76;
          reg155 <= wire72[(2'h3):(2'h2)];
          reg156 <= $unsigned($signed(reg149));
          if ($unsigned(wire60[(1'h1):(1'h1)]))
            begin
              reg157 <= {$signed((&(wire131[(2'h3):(1'h0)] >= (&(8'hb2)))))};
              reg158 <= (wire31[(4'hc):(4'hb)] ?
                  (!$unsigned(reg150)) : $signed(wire131[(3'h7):(3'h6)]));
            end
          else
            begin
              reg157 <= $signed({(wire144 ? wire29 : $signed(wire75)),
                  (8'hb4)});
            end
        end
      else
        begin
          if ($signed(((wire10[(4'h8):(1'h0)] ?
              $unsigned($unsigned(wire10)) : $signed((~^(8'ha6)))) >> (8'had))))
            begin
              reg154 <= (wire132 ~^ $signed($unsigned(((wire10 != reg152) ?
                  reg149[(2'h3):(1'h0)] : $signed(reg151)))));
              reg155 <= $signed((({{wire72}, (reg158 <= wire11)} + ((wire31 ?
                      wire60 : wire31) < ((8'hb2) < wire27))) ?
                  $unsigned({$signed((8'hb3))}) : wire11[(5'h10):(4'h8)]));
              reg156 <= reg157[(4'h9):(4'h8)];
            end
          else
            begin
              reg154 <= $unsigned((8'hae));
              reg155 <= (!reg150[(1'h0):(1'h0)]);
            end
          reg157 <= $unsigned(wire60);
          reg158 <= $signed($signed(($signed($unsigned(wire144)) ?
              $unsigned($signed(reg151)) : wire12[(4'ha):(2'h3)])));
          reg159 <= $signed($unsigned(((|wire74[(2'h2):(1'h1)]) * (reg156[(3'h6):(3'h6)] ?
              (~^wire58) : wire129[(3'h5):(2'h2)]))));
          reg160 <= ((+(reg156 ?
                  $unsigned((8'haf)) : ((wire14 + (8'ha8)) ?
                      {wire60} : (reg150 != (8'h9e))))) ?
              ($unsigned({wire29[(4'hd):(2'h3)], (reg153 ? reg157 : wire60)}) ?
                  $signed((wire131 ?
                      {wire60} : $signed(wire60))) : (((wire12 >> wire131) ?
                      (wire72 > reg159) : {wire58}) && $signed(((8'ha2) > reg154)))) : $unsigned($signed(wire146[(4'ha):(3'h7)])));
        end
      reg161 <= (reg159 < {($signed($signed(reg160)) ^ reg158[(3'h6):(3'h5)]),
          $unsigned(reg150[(1'h1):(1'h0)])});
      if ((wire12 >>> ((~&$signed(wire75)) ?
          $signed((wire10 ^ $unsigned(wire58))) : ((8'ha6) << {$unsigned(wire74),
              (wire29 != (8'hab))}))))
        begin
          reg162 <= {$signed(reg154)};
          if ((((-$unsigned((wire31 ? reg158 : (8'hbb)))) ?
                  ($signed($signed(wire76)) ?
                      reg157 : $unsigned((wire129 ?
                          wire13 : reg153))) : $unsigned(($signed(reg155) ?
                      reg155 : ((8'ha3) ^ reg160)))) ?
              reg154[(4'hb):(2'h2)] : wire72[(5'h14):(1'h0)]))
            begin
              reg163 <= (((~(wire75 <<< {reg158,
                  reg162})) > (+$signed(reg157[(4'h9):(2'h2)]))) < {($unsigned($signed(wire29)) ?
                      wire11 : ((wire129 <<< wire132) & (reg161 ?
                          wire58 : wire27))),
                  (reg160[(1'h1):(1'h0)] ?
                      $unsigned({wire14,
                          reg162}) : $unsigned($unsigned(reg148)))});
            end
          else
            begin
              reg163 <= ($signed((wire131 - $unsigned((wire27 <= reg161)))) && (~^$signed(reg149[(1'h0):(1'h0)])));
              reg164 <= wire30[(4'h9):(3'h6)];
              reg165 <= (&((8'hb4) > wire60[(4'hb):(3'h7)]));
            end
          reg166 <= wire146[(4'hb):(4'ha)];
          reg167 <= $unsigned(reg162[(1'h0):(1'h0)]);
          if ({((wire14 ? reg165[(3'h5):(3'h4)] : reg155) ?
                  wire132 : ($unsigned(reg165) ?
                      ((reg165 - reg149) <= $unsigned(wire146)) : wire60[(4'hd):(4'h8)])),
              {(~&(-(~&reg148))), wire13[(3'h7):(1'h1)]}})
            begin
              reg168 <= wire60;
              reg169 <= $unsigned($signed(reg148));
              reg170 <= $signed((+$signed((reg164[(2'h3):(1'h1)] ?
                  (wire60 ? wire29 : reg152) : wire58[(4'h9):(3'h4)]))));
              reg171 <= reg150[(1'h1):(1'h1)];
            end
          else
            begin
              reg168 <= (~^wire72);
              reg169 <= $unsigned(((8'ha0) ?
                  (((reg168 - reg153) | $signed(reg155)) <<< $unsigned((wire74 ?
                      (8'ha8) : wire30))) : (7'h40)));
              reg170 <= (+{wire13[(5'h11):(4'he)]});
            end
        end
      else
        begin
          if ((|(~wire27[(4'hb):(2'h2)])))
            begin
              reg162 <= wire146;
            end
          else
            begin
              reg162 <= ({reg151[(1'h1):(1'h0)],
                  (reg169 > (reg155[(1'h0):(1'h0)] ?
                      $signed(wire146) : wire29[(4'h9):(2'h3)]))} << wire74);
            end
          reg163 <= (reg160 ?
              ((|$unsigned((reg164 && reg168))) ?
                  (-$signed((reg159 ^ wire13))) : ($signed($signed((8'haa))) ?
                      $unsigned($unsigned(reg170)) : ({reg148} != $unsigned(reg164)))) : reg170);
          reg164 <= (wire31[(3'h4):(3'h4)] & reg159[(4'hf):(1'h1)]);
          reg165 <= $unsigned((|$unsigned((^(reg150 >> reg162)))));
        end
    end
  module32 #() modinst173 (wire172, clk, reg164, reg160, wire11, wire129, reg159);
  assign wire174 = (($signed(($unsigned(wire75) ?
                           wire30 : (reg167 <= (8'hb0)))) ?
                       wire29 : ($unsigned((|reg154)) ?
                           $signed((7'h43)) : ({(8'hbf)} >> $signed(wire75)))) ~^ wire11);
  assign wire175 = wire29[(1'h1):(1'h1)];
endmodule

module module133
#(parameter param142 = (({(((8'hba) ? (8'hb2) : (8'hb4)) == ((8'hb5) ~^ (8'ha7)))} ? (~^(~((8'h9f) * (7'h41)))) : ({(!(8'hbf)), (^~(8'h9f))} ? (^((8'hb1) ? (8'hb5) : (8'hb5))) : (((8'hb5) ? (8'hb5) : (8'hb1)) ? ((8'hab) ? (8'hbd) : (8'ha4)) : ((8'hbb) && (8'hb4))))) ? ({({(8'hae), (8'hae)} | (^~(8'hac))), {((8'hb7) != (8'ha5)), (~^(8'hb9))}} ? (((^~(7'h44)) ? (+(8'h9d)) : ((7'h42) ? (8'h9c) : (8'hb0))) < ({(8'hb9)} ? (^(8'hbe)) : ((8'h9e) * (8'ha0)))) : ((8'ha9) ? (((8'ha1) ? (8'hbd) : (8'had)) ? ((8'h9d) ^~ (8'hbc)) : ((8'hb4) ? (8'hbe) : (8'hab))) : (((8'h9e) ? (8'hb2) : (8'ha1)) <<< ((8'hba) << (8'hb9))))) : (({((8'hbb) << (8'ha7))} >= (~((7'h41) ? (8'ha7) : (8'hb8)))) ? ({((8'h9e) ? (8'hbb) : (8'hbf)), ((7'h44) <= (8'ha0))} ? (((8'ha3) ? (8'had) : (8'h9e)) - (^~(8'h9c))) : (((8'haa) << (7'h44)) >>> ((8'hb6) ? (8'had) : (8'haa)))) : ((((8'ha8) ? (8'ha4) : (7'h44)) ? {(7'h41)} : {(8'hae)}) ? (((8'hbb) ^~ (8'h9e)) ? ((8'hbf) >= (8'hb7)) : {(8'hb9)}) : (((8'ha8) ? (7'h42) : (8'ha3)) ^~ {(8'ha7), (8'ha5)})))), 
parameter param143 = ((~&((!{param142}) * param142)) ? (~&({param142, param142} ? ((-param142) ? ((8'ha2) - param142) : (8'hb1)) : ((param142 ? param142 : param142) ? param142 : (&param142)))) : {(param142 ^ param142), {((param142 ? param142 : param142) ? (param142 == (8'h9c)) : param142), (^~((8'hb9) ? param142 : param142))}}))
(y, clk, wire137, wire136, wire135, wire134);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire137;
  input wire [(4'hc):(1'h0)] wire136;
  input wire [(5'h13):(1'h0)] wire135;
  input wire signed [(2'h3):(1'h0)] wire134;
  wire signed [(4'ha):(1'h0)] wire141;
  wire signed [(4'hb):(1'h0)] wire140;
  wire [(4'h8):(1'h0)] wire139;
  wire signed [(4'hf):(1'h0)] wire138;
  assign y = {wire141, wire140, wire139, wire138, (1'h0)};
  assign wire138 = (!wire134);
  assign wire139 = $unsigned((~|wire136[(4'h9):(3'h5)]));
  assign wire140 = {$signed((wire135 ?
                           wire134[(2'h2):(1'h0)] : ($unsigned(wire139) + (|wire135)))),
                       wire138};
  assign wire141 = (((wire139 >= ((wire138 ? (8'ha1) : (8'ha9)) ?
                           wire140 : (~^wire136))) ?
                       (^~wire134[(2'h3):(1'h1)]) : {wire134}) + wire136);
endmodule

module module77
#(parameter param128 = (|((|((|(8'hb9)) ? ((8'hb8) + (7'h40)) : ((8'ha6) <<< (8'hbc)))) ? ((|((8'ha2) ? (7'h43) : (8'hba))) < (&(-(8'ha2)))) : ({((7'h42) ? (8'hbb) : (8'hb5))} ? (8'hb4) : ({(7'h40)} << (~|(8'ha0)))))))
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h20f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire82;
  input wire signed [(4'he):(1'h0)] wire81;
  input wire [(4'hb):(1'h0)] wire80;
  input wire signed [(3'h4):(1'h0)] wire79;
  input wire signed [(4'hf):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  wire [(5'h14):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire111;
  wire [(3'h7):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(4'ha):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire104;
  wire [(3'h5):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire100;
  wire [(2'h3):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire83;
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg [(4'h8):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(4'hf):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire84,
                 wire83,
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
                 reg107,
                 reg106,
                 reg105,
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
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire83 = wire78[(3'h6):(3'h6)];
  assign wire84 = wire80[(4'h8):(2'h3)];
  always
    @(posedge clk) begin
      if (((((~|$unsigned(wire79)) ?
          ((wire80 ^~ wire82) ?
              (wire80 == (8'ha9)) : wire83) : $unsigned((wire79 ?
              wire81 : wire78))) <<< ((wire80 ?
          (wire83 ? wire78 : wire79) : wire84) | wire82)) - {($signed({wire79,
              wire81}) || wire80),
          (+(8'h9d))}))
        begin
          reg85 <= wire79[(2'h2):(1'h0)];
          reg86 <= wire79;
          reg87 <= $signed(reg85[(4'ha):(2'h2)]);
          if ((~|$unsigned($signed($unsigned((wire78 ? wire84 : (8'hba)))))))
            begin
              reg88 <= $signed((~($unsigned((+wire83)) ?
                  $signed($unsigned(wire83)) : reg86)));
              reg89 <= (+reg87);
              reg90 <= {(8'hb2),
                  ((|((~^wire80) ?
                      $unsigned(reg85) : (wire84 ^~ wire83))) != ({wire84[(2'h2):(1'h0)],
                      (wire81 ~^ wire83)} < wire81))};
            end
          else
            begin
              reg88 <= {wire79[(1'h0):(1'h0)],
                  $unsigned((|reg88[(3'h4):(1'h0)]))};
              reg89 <= (wire82 != (($signed(wire84[(1'h1):(1'h0)]) >> $signed(reg88[(1'h1):(1'h1)])) >> $unsigned(((wire82 + (8'haf)) ?
                  (reg88 ^~ reg88) : {reg90, reg87}))));
              reg90 <= reg86;
              reg91 <= $unsigned(reg85[(1'h0):(1'h0)]);
            end
          if (reg89[(4'h8):(3'h6)])
            begin
              reg92 <= $signed(({(|(^wire82))} ?
                  $signed(reg90[(4'ha):(1'h0)]) : reg85[(3'h6):(1'h1)]));
            end
          else
            begin
              reg92 <= reg90;
            end
        end
      else
        begin
          if ((+(~^{$signed({reg90, reg85})})))
            begin
              reg85 <= reg89[(4'hd):(3'h6)];
            end
          else
            begin
              reg85 <= (((($signed(reg91) ?
                          $unsigned(wire83) : wire79[(1'h0):(1'h0)]) ?
                      (^$unsigned((8'hbc))) : wire79) ?
                  ((+(wire84 ?
                      reg92 : wire83)) >> (reg86[(1'h0):(1'h0)] >= (&wire82))) : $signed(reg92[(2'h3):(1'h0)])) >>> wire84[(2'h3):(1'h1)]);
              reg86 <= (({$unsigned({reg89}), (~&((8'h9e) & (8'hbf)))} ?
                  ((reg92[(3'h7):(2'h2)] ?
                      (reg91 ^ reg92) : $unsigned(wire78)) >>> $signed({(8'hb8)})) : ($signed($unsigned(wire84)) ?
                      reg91 : reg89[(2'h3):(1'h1)])) && ((({reg88} <<< ((8'ha8) > wire84)) * (8'ha5)) | wire84));
              reg87 <= (~$unsigned(reg88[(4'h9):(4'h9)]));
              reg88 <= wire83;
              reg89 <= wire78[(4'hd):(3'h7)];
            end
          if ((+(!wire81)))
            begin
              reg90 <= ((wire79 - wire81[(3'h6):(1'h1)]) || (($signed($signed(reg92)) ?
                  (!$unsigned((8'hb0))) : wire83) != {(^$unsigned((8'hb9))),
                  ($signed(reg89) ? wire78 : reg87)}));
              reg91 <= wire81;
              reg92 <= (~^reg90[(4'he):(4'h8)]);
              reg93 <= $unsigned(wire80[(4'h8):(2'h2)]);
            end
          else
            begin
              reg90 <= reg88;
            end
          if ($signed({($unsigned(reg87[(1'h0):(1'h0)]) && $signed($signed(wire81))),
              reg86[(1'h0):(1'h0)]}))
            begin
              reg94 <= $unsigned(reg87);
              reg95 <= wire81[(4'hb):(3'h4)];
              reg96 <= (wire78 < (({reg90[(2'h3):(2'h2)]} ?
                  wire78 : reg89[(4'hf):(2'h3)]) != ((reg88 ?
                      (reg92 && reg85) : (-reg95)) ?
                  (&{wire83}) : wire83[(4'h9):(2'h2)])));
              reg97 <= $signed(reg91);
              reg98 <= ($unsigned((wire80[(4'h9):(4'h8)] ?
                  (~&(wire84 && (8'ha1))) : ((reg95 ?
                      reg87 : wire83) >> $unsigned(reg87)))) || ($signed((reg90[(5'h12):(4'ha)] | $signed(reg97))) ?
                  $unsigned($signed(wire80[(2'h3):(1'h0)])) : $unsigned((wire82[(2'h2):(1'h1)] ?
                      reg95 : {wire81, (7'h44)}))));
            end
          else
            begin
              reg94 <= (~|{(-({reg97} ? (8'ha4) : wire84[(2'h2):(1'h1)]))});
              reg95 <= (!{wire79[(1'h1):(1'h0)],
                  $signed($unsigned($signed(wire79)))});
            end
          reg99 <= reg95[(1'h0):(1'h0)];
        end
    end
  assign wire100 = (~|(^~$unsigned((!$unsigned((8'ha5))))));
  assign wire101 = reg87;
  assign wire102 = (reg92 >> ($unsigned((((8'hb6) && wire82) | $unsigned(reg88))) || wire78));
  assign wire103 = reg94[(1'h0):(1'h0)];
  assign wire104 = (reg93[(3'h5):(3'h5)] <<< $unsigned($unsigned(reg91)));
  always
    @(posedge clk) begin
      reg105 <= {$signed(((((8'h9f) <= (7'h42)) <<< (~&(7'h44))) - ((wire104 ?
              reg98 : (8'hab)) != (reg89 <<< reg90))))};
      reg106 <= $unsigned((~^wire101));
      reg107 <= reg96[(1'h0):(1'h0)];
    end
  assign wire108 = ((~&wire78) ?
                       {(reg107 ^ (wire101 ?
                               (reg87 || (8'hae)) : (!wire81)))} : (~(wire78[(3'h7):(3'h4)] ?
                           (reg86[(1'h1):(1'h1)] >= $unsigned((7'h43))) : reg105[(3'h5):(2'h3)])));
  assign wire109 = $unsigned((^{$signed(((8'hab) >>> reg92))}));
  assign wire110 = ($signed(wire81) | (~|$signed({(~reg92)})));
  assign wire111 = $unsigned(((reg91 * (|$signed(reg106))) && wire79[(2'h2):(2'h2)]));
  assign wire112 = $signed(((wire79 ?
                           $unsigned($signed(reg86)) : reg107[(3'h4):(1'h0)]) ?
                       ($unsigned($unsigned(reg93)) ?
                           $signed((wire110 ? wire84 : reg94)) : ((reg98 ?
                               (8'hb5) : wire84) | $signed(reg97))) : $unsigned({wire101})));
  assign wire113 = $signed({reg86[(3'h6):(3'h5)]});
  assign wire114 = $signed(($signed(wire79) ?
                       {(~^(-wire79))} : reg91[(4'hc):(3'h4)]));
  assign wire115 = $unsigned(((+(&$signed(reg96))) ?
                       ($signed((wire108 ?
                           wire80 : reg88)) >>> ($unsigned((8'ha7)) & (reg98 ?
                           wire80 : wire108))) : reg96[(3'h5):(1'h1)]));
  always
    @(posedge clk) begin
      reg116 <= reg96[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg117 <= $signed(($signed(reg98[(4'h8):(2'h3)]) ~^ {wire108}));
      reg118 <= wire81[(3'h4):(2'h3)];
      reg119 <= wire102;
      if ((7'h40))
        begin
          reg120 <= (~|$unsigned((-($signed(reg86) ?
              $signed(reg92) : wire108))));
          if (wire115)
            begin
              reg121 <= ($signed(($unsigned($signed((8'h9e))) && reg89[(3'h7):(1'h0)])) || ({reg105,
                  ((reg90 != wire80) ^~ $signed(wire84))} | $signed($unsigned($unsigned(wire115)))));
              reg122 <= wire114[(3'h5):(1'h0)];
              reg123 <= (^$unsigned((wire100[(3'h5):(1'h0)] != $signed((~(8'hb3))))));
              reg124 <= reg85[(4'h9):(3'h6)];
            end
          else
            begin
              reg121 <= {{reg96[(3'h4):(3'h4)], reg107},
                  $unsigned($signed(({reg95, wire104} ?
                      reg85[(3'h6):(3'h6)] : wire82[(1'h1):(1'h0)])))};
              reg122 <= (|{$unsigned((^~reg124[(4'h9):(4'h9)])),
                  reg106[(4'hb):(4'ha)]});
              reg123 <= (+$unsigned(((~^reg124) >>> ($signed((8'haa)) >> ((7'h40) ?
                  reg122 : reg90)))));
              reg124 <= (wire84 + ((7'h42) - (reg119 ?
                  $unsigned((~reg89)) : {$signed((7'h43))})));
              reg125 <= (($signed(reg86[(1'h0):(1'h0)]) ?
                  reg88 : reg119) >= $signed((($unsigned((7'h43)) ?
                  (8'ha9) : (wire115 >> wire84)) == (reg98[(3'h5):(1'h1)] ?
                  (7'h44) : {reg88}))));
            end
          reg126 <= (reg93 <<< {(reg120[(4'he):(4'hd)] ?
                  ((reg118 ? reg91 : reg123) ?
                      wire81 : wire84[(1'h0):(1'h0)]) : reg85)});
        end
      else
        begin
          reg120 <= wire84;
          reg121 <= $unsigned(((7'h41) | ((^$signed(wire110)) ?
              ((reg123 ? reg123 : (8'hb6)) ?
                  $unsigned(reg93) : $signed(wire79)) : {$signed(wire101),
                  (wire102 ^ (8'ha3))})));
          reg122 <= $unsigned(($unsigned((~&(~&reg92))) ?
              wire83[(4'hd):(4'ha)] : $signed(((reg116 + wire78) ?
                  (^~reg88) : ((8'h9e) ? reg88 : reg126)))));
        end
      reg127 <= $unsigned($signed(wire111[(4'hd):(4'ha)]));
    end
endmodule

module module61
#(parameter param71 = (((~((~&(8'hb1)) ? (7'h41) : ((8'hae) <<< (8'hae)))) ? (+(~((8'hb5) ? (8'ha8) : (8'hb4)))) : {(!((8'hbc) < (8'hbf)))}) >> (^~((((8'haa) >= (8'ha6)) && ((8'hb0) ^~ (7'h40))) == (((8'hbe) && (8'h9d)) & ((7'h40) != (8'hb9)))))))
(y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire66;
  input wire [(5'h13):(1'h0)] wire65;
  input wire [(4'hc):(1'h0)] wire64;
  input wire [(2'h2):(1'h0)] wire63;
  input wire [(5'h13):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  assign y = {wire70, wire69, wire68, wire67, (1'h0)};
  assign wire67 = $unsigned((8'hba));
  assign wire68 = wire64[(3'h5):(2'h3)];
  assign wire69 = wire64[(2'h2):(2'h2)];
  assign wire70 = $unsigned((!$unsigned(((wire67 ? wire62 : wire62) ?
                      {wire67, wire65} : {wire63, wire64}))));
endmodule

module module32
#(parameter param56 = ((~&({((8'hab) ? (8'hb6) : (8'hb2))} ^ (~((8'ha7) ? (8'ha1) : (8'hbd))))) >> (((-((8'h9c) > (7'h40))) >= ((~(8'hbe)) ? ((8'ha7) <<< (8'hb9)) : ((8'hac) ? (8'ha8) : (8'h9c)))) ? (&(~&((8'hb5) ? (7'h44) : (8'ha1)))) : (((~^(8'hb7)) ? (^~(8'ha9)) : (~^(8'haf))) >= (((8'h9e) >>> (8'hb9)) ? ((8'hb7) ? (8'had) : (8'hb1)) : ((8'ha8) ? (8'hac) : (8'hab)))))), 
parameter param57 = param56)
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire37;
  input wire signed [(5'h11):(1'h0)] wire36;
  input wire signed [(4'hb):(1'h0)] wire35;
  input wire [(4'he):(1'h0)] wire34;
  input wire [(5'h13):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(4'ha):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire52;
  wire signed [(3'h6):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg42,
                 (1'h0)};
  assign wire38 = ({$unsigned(((wire33 ?
                          wire35 : wire35) >= (wire37 >= (8'ha0)))),
                      wire34} ^ wire37);
  assign wire39 = wire38;
  assign wire40 = $unsigned((wire35[(4'h9):(3'h6)] - ((~^(8'hac)) ^ wire36)));
  assign wire41 = wire36[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg42 <= wire34;
    end
  assign wire43 = (((+((wire33 ? (8'hab) : wire40) ?
                      (&wire39) : (wire39 << reg42))) != wire40[(1'h0):(1'h0)]) + (|((-(~wire34)) * $unsigned((reg42 ^~ wire41)))));
  assign wire44 = {wire37[(4'ha):(2'h3)], (wire36 ~^ wire39)};
  assign wire45 = (wire35 ?
                      (!$signed(((wire39 ? wire40 : wire43) ?
                          $signed(wire37) : $unsigned(wire41)))) : $unsigned({(~&$signed(wire44))}));
  always
    @(posedge clk) begin
      reg46 <= ((~|(-(+$signed((8'hb0))))) ? wire44 : wire33[(2'h3):(2'h3)]);
      reg47 <= (wire45[(2'h3):(2'h3)] & (-(8'ha8)));
      reg48 <= wire36[(1'h1):(1'h1)];
      reg49 <= ({(8'hbf)} ~^ ($signed((8'hba)) ?
          reg47[(2'h2):(1'h0)] : ($signed(wire36) == $unsigned(wire38))));
    end
  assign wire50 = $signed((!wire45));
  assign wire51 = (~^(~^(~&wire40)));
  assign wire52 = wire35;
  assign wire53 = wire51[(1'h0):(1'h0)];
  assign wire54 = $signed(((!((8'ha3) ?
                          wire33[(1'h1):(1'h0)] : $unsigned(wire41))) ?
                      reg42 : (^~$unsigned(wire44))));
  assign wire55 = $unsigned((wire37[(3'h4):(3'h4)] <<< {(8'hbc)}));
endmodule

module module15
#(parameter param26 = ((((-((8'hb9) + (8'had))) ? ({(7'h40)} ? (7'h43) : ((8'had) ? (8'hb7) : (8'hb5))) : (&(|(8'ha5)))) <= {(|((8'ha4) + (8'ha4))), (~|((8'hbb) ? (8'h9c) : (8'h9f)))}) ? (-(^{((8'ha4) && (8'hb4)), ((8'h9e) ? (8'hbd) : (8'hb3))})) : (({((8'had) >> (8'hba)), (!(8'hb5))} * (((8'hab) >> (8'hbb)) ? {(8'h9e), (8'hbb)} : ((8'ha7) - (7'h42)))) != ((((8'hb3) || (8'hbd)) == (^(8'ha0))) ? ((~&(8'hab)) & ((8'ha5) ? (8'haf) : (7'h40))) : (&((8'ha5) > (8'had)))))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  input wire [(5'h11):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire20;
  assign y = {wire25, wire24, wire23, wire22, wire21, wire20, (1'h0)};
  assign wire20 = {(~^(($unsigned(wire16) >= (wire17 != (8'ha1))) ?
                          wire19 : wire18[(4'h8):(3'h4)]))};
  assign wire21 = (~&(wire16[(4'ha):(3'h7)] ?
                      wire19[(2'h2):(2'h2)] : $signed((&$unsigned(wire20)))));
  assign wire22 = wire19[(4'h9):(4'h8)];
  assign wire23 = (wire16 - ((8'h9e) ? $signed($signed({wire16})) : wire22));
  assign wire24 = $signed((~|$signed((wire19 ^ $signed(wire21)))));
  assign wire25 = {wire23[(4'ha):(2'h2)],
                      (wire24 ?
                          (($unsigned((7'h43)) && ((8'hb5) & (8'ha9))) ?
                              (^(wire21 ?
                                  wire17 : wire22)) : $signed($unsigned((8'h9c)))) : $unsigned($signed((wire17 ?
                              wire22 : (7'h43)))))};
endmodule
