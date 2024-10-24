module top
#(parameter param220 = (((8'ha0) ? ({((8'ha9) ^ (8'hb9))} > (((8'hb6) ? (8'ha0) : (8'h9f)) && ((8'ha3) <<< (8'hbe)))) : (((-(8'hb1)) ? ((8'hb5) && (8'had)) : (~(8'hba))) ~^ ((!(8'h9f)) * ((8'ha0) >>> (8'ha1))))) || ({((~(8'hb1)) ? ((8'h9e) ? (7'h40) : (8'hb1)) : (^(8'hbb)))} ? (-(&(+(8'hb5)))) : (-((|(8'h9f)) ? (-(8'hbb)) : (~(8'hac)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire204;
  wire [(5'h14):(1'h0)] wire195;
  wire [(4'ha):(1'h0)] wire194;
  wire signed [(3'h5):(1'h0)] wire192;
  wire signed [(4'h8):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg219 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg217 = (1'h0);
  reg [(5'h13):(1'h0)] reg216 = (1'h0);
  reg [(5'h12):(1'h0)] reg215 = (1'h0);
  reg [(4'hf):(1'h0)] reg214 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg213 = (1'h0);
  reg [(4'hd):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg211 = (1'h0);
  reg [(4'hc):(1'h0)] reg210 = (1'h0);
  reg [(4'hb):(1'h0)] reg209 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg208 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg207 = (1'h0);
  reg [(3'h6):(1'h0)] reg206 = (1'h0);
  reg [(3'h5):(1'h0)] reg205 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg203 = (1'h0);
  reg [(3'h7):(1'h0)] reg202 = (1'h0);
  reg [(5'h13):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg200 = (1'h0);
  reg [(5'h13):(1'h0)] reg199 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg197 = (1'h0);
  reg [(5'h12):(1'h0)] reg196 = (1'h0);
  assign y = {wire204,
                 wire195,
                 wire194,
                 wire192,
                 wire4,
                 reg219,
                 reg218,
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
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 (1'h0)};
  assign wire4 = (+$signed(wire0));
  module5 #() modinst193 (wire192, clk, wire2, wire3, wire4, wire0);
  assign wire194 = ((^wire192[(2'h3):(2'h3)]) - $signed({(^~$unsigned(wire4)),
                       wire192}));
  assign wire195 = (8'ha6);
  always
    @(posedge clk) begin
      reg196 <= $signed(((({wire3, wire192} ?
          {wire2} : (wire1 ? wire194 : (8'ha8))) ^ ($unsigned(wire192) ?
          (8'ha9) : (8'ha4))) & ((wire0[(2'h3):(1'h0)] < wire192) ^~ $signed((wire4 ~^ wire192)))));
      reg197 <= $unsigned(($signed(wire1[(3'h4):(2'h2)]) ^ $unsigned((wire194[(4'h8):(2'h3)] ?
          $unsigned(wire0) : $signed(wire192)))));
      reg198 <= $signed((wire4[(2'h2):(1'h1)] ?
          (|$unsigned((wire0 + (8'hab)))) : (^~(8'hb7))));
      reg199 <= ($unsigned({(!wire194), {wire1[(2'h2):(2'h2)]}}) != wire4);
      if ((8'ha1))
        begin
          reg200 <= {$unsigned(reg197),
              (wire192 << $unsigned((&(reg197 ? wire192 : reg196))))};
          reg201 <= reg200;
          reg202 <= $unsigned($signed(((&(wire1 < wire192)) ^~ ($unsigned(wire192) & wire2[(4'hc):(2'h2)]))));
          reg203 <= (~$signed({(reg200[(5'h11):(4'hf)] + reg199),
              (wire194 ? {wire2, wire1} : (reg198 ? wire194 : wire3))}));
        end
      else
        begin
          reg200 <= {(&(reg202 ? {{wire192}, wire1} : (8'hbe))),
              ($unsigned((((8'ha0) * (8'ha5)) ?
                  $signed(wire3) : $signed(wire192))) << ($signed($unsigned(wire1)) ^~ ($signed(wire192) ?
                  wire0[(4'h9):(1'h1)] : wire0)))};
          reg201 <= wire1[(1'h1):(1'h1)];
        end
    end
  assign wire204 = wire1;
  always
    @(posedge clk) begin
      reg205 <= (wire1 ?
          $unsigned(((!$unsigned(wire204)) ?
              $signed((8'ha0)) : ($signed(reg201) * (reg198 >= reg202)))) : $signed(($unsigned($signed(reg200)) && $unsigned({reg201,
              wire1}))));
      reg206 <= ($unsigned($unsigned({$unsigned(wire1)})) ^~ ((&((+(8'h9f)) >> (wire3 ?
              reg198 : (8'hac)))) ?
          wire192[(3'h4):(3'h4)] : ((~&wire2[(1'h1):(1'h0)]) ?
              ($signed(wire1) ?
                  (wire1 & wire3) : (wire195 == wire1)) : (^(reg196 || reg203)))));
      if ($signed(wire4))
        begin
          reg207 <= (8'hab);
          reg208 <= ($unsigned($unsigned(reg198[(1'h1):(1'h0)])) >= ((^$unsigned(reg206[(3'h4):(2'h2)])) ?
              {{wire0}} : $unsigned(((reg199 > reg200) ?
                  wire2[(4'hd):(1'h1)] : (|reg199)))));
          reg209 <= $signed((|($unsigned($unsigned(reg205)) ~^ reg199)));
          if (((reg205 > (reg203 >= ((~wire0) - {reg205, (8'hb5)}))) ?
              (reg205 > reg198[(2'h2):(1'h0)]) : {(~^{reg206[(3'h4):(1'h0)]}),
                  reg208[(2'h3):(1'h0)]}))
            begin
              reg210 <= $unsigned((reg201 > reg201[(2'h2):(2'h2)]));
              reg211 <= {({$unsigned((!reg199))} ?
                      $signed($unsigned((reg202 ?
                          (8'hbe) : wire4))) : (wire4[(2'h2):(1'h0)] | reg200[(4'hd):(3'h7)])),
                  (8'hae)};
              reg212 <= ($unsigned({$signed($signed(reg210)), wire1}) ?
                  (!$signed($unsigned($unsigned(reg210)))) : $signed(({$signed((8'hbb)),
                          (|reg209)} ?
                      (~^wire194) : (reg196 <= (wire192 ? reg208 : reg201)))));
              reg213 <= $unsigned($signed($signed($unsigned(reg200))));
            end
          else
            begin
              reg210 <= $unsigned($unsigned(wire192));
              reg211 <= (^~{(~&$unsigned(((8'hbb) ? reg213 : wire3))),
                  $unsigned((!(wire0 ? reg196 : (7'h40))))});
              reg212 <= (~|(($signed({wire192, reg205}) ?
                  (((8'hb3) ? (8'ha2) : reg196) ?
                      (~&(8'hb6)) : reg197[(3'h4):(2'h3)]) : $unsigned($signed(wire195))) == (((reg208 ?
                      reg203 : wire204) ?
                  {wire1, reg201} : reg206) <<< reg196[(4'h9):(2'h2)])));
              reg213 <= {$unsigned((~|((~^reg206) ?
                      {wire194} : {(8'hb8), reg200})))};
              reg214 <= $unsigned(reg209);
            end
          if ((8'hb0))
            begin
              reg215 <= (-reg198[(1'h0):(1'h0)]);
              reg216 <= $unsigned(((~($signed(reg211) & (reg210 ?
                      wire194 : wire204))) ?
                  (reg206[(3'h6):(2'h3)] ?
                      (~&(8'hbd)) : ($unsigned(wire2) ?
                          ((8'ha7) ?
                              (8'ha7) : (7'h42)) : wire4)) : $signed(($unsigned(wire3) ?
                      (reg198 ? wire195 : reg196) : (8'hb6)))));
              reg217 <= $unsigned((!($unsigned($unsigned(reg201)) ?
                  wire192[(3'h4):(2'h2)] : (~^(~^reg197)))));
              reg218 <= reg197[(3'h6):(3'h5)];
              reg219 <= {(8'hb2), $unsigned((~^(8'hb4)))};
            end
          else
            begin
              reg215 <= ({$signed(((reg199 ^~ reg214) ?
                          (~^reg198) : reg215[(4'he):(4'hb)]))} ?
                  (|$unsigned($signed($unsigned(reg215)))) : reg209);
            end
        end
      else
        begin
          if ($signed({$signed((&wire0[(5'h10):(4'hb)])),
              $signed($signed($unsigned(reg205)))}))
            begin
              reg207 <= (8'ha2);
              reg208 <= (8'ha9);
            end
          else
            begin
              reg207 <= wire204[(3'h6):(3'h5)];
              reg208 <= (reg213 & (&$signed((~^$unsigned((8'haf))))));
              reg209 <= ({$unsigned((8'hb8))} ?
                  (!(wire195[(2'h2):(1'h1)] ^ (~&reg217))) : (wire195 ?
                      $unsigned({{wire204}, reg201}) : reg216));
              reg210 <= ($signed((+reg212)) <= $signed((8'hb7)));
            end
          reg211 <= {$signed(reg214),
              (!(reg209 | ((reg213 != reg214) == reg201)))};
          reg212 <= $unsigned(reg214);
        end
    end
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire98;
  wire signed [(5'h11):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire146;
  wire signed [(4'ha):(1'h0)] wire148;
  wire signed [(4'hd):(1'h0)] wire149;
  wire [(2'h2):(1'h0)] wire190;
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  assign y = {wire65,
                 wire10,
                 wire25,
                 wire26,
                 wire27,
                 wire50,
                 wire98,
                 wire100,
                 wire146,
                 wire148,
                 wire149,
                 wire190,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = {$signed($unsigned(($signed(wire7) <= (~&wire8)))),
                      $unsigned(($signed((wire6 ? wire6 : wire9)) ?
                          $signed(wire9) : wire6))};
  always
    @(posedge clk) begin
      reg11 <= $signed($unsigned(wire10[(5'h14):(4'hf)]));
      reg12 <= $signed((&wire10[(5'h13):(1'h0)]));
      reg13 <= (~|(8'hb0));
      reg14 <= $unsigned(($unsigned((~&reg11[(2'h3):(1'h0)])) >>> {(wire7 ?
              wire8 : (!wire6)),
          $unsigned((~&reg11))}));
      if ((wire10 ?
          ($signed(wire10) >> $signed((~&((8'h9c) ?
              reg13 : (8'hb0))))) : $unsigned($signed(((+(8'hae)) ?
              (reg13 ? reg14 : wire7) : (|wire8))))))
        begin
          if ((!($unsigned(($unsigned(wire7) ? (+reg11) : $unsigned(wire7))) ?
              wire8 : wire10[(4'he):(4'ha)])))
            begin
              reg15 <= wire10[(2'h2):(2'h2)];
              reg16 <= (!($signed({wire10[(4'hd):(4'hd)]}) ?
                  ((wire9 | {reg15}) | $unsigned((^wire8))) : $signed((~^(reg13 | wire9)))));
              reg17 <= {wire8[(2'h3):(1'h1)],
                  (($signed((reg13 ? reg13 : (8'hbf))) ?
                          $signed((wire7 >> reg16)) : {(|reg11),
                              $unsigned(reg12)}) ?
                      $signed(reg15) : $signed(($signed(wire8) | (^~wire9))))};
            end
          else
            begin
              reg15 <= (~^wire6);
              reg16 <= $unsigned((wire10 ?
                  (((~|(8'hba)) && wire6) >> reg15) : reg15[(2'h3):(1'h0)]));
            end
          reg18 <= (((reg11 ?
                  $signed(reg12[(3'h5):(2'h2)]) : (reg16[(1'h1):(1'h0)] < {reg11})) * reg13) ?
              wire7[(4'he):(4'h9)] : reg13[(4'ha):(1'h0)]);
          if ((wire7[(4'hc):(4'ha)] >= (!reg17)))
            begin
              reg19 <= $signed({{$signed(wire8),
                      (wire10 ?
                          (reg13 ? reg18 : wire6) : (wire7 ?
                              (8'haf) : reg18))}});
              reg20 <= (7'h41);
              reg21 <= reg18[(3'h6):(3'h4)];
              reg22 <= $unsigned((reg11[(4'h8):(3'h5)] & (reg12 ?
                  ((reg11 ? wire7 : wire9) ?
                      (~&wire9) : $signed(wire7)) : (7'h43))));
              reg23 <= (((+reg16) | (8'ha9)) ?
                  wire8 : $unsigned(((reg17[(3'h7):(3'h6)] + (reg20 <<< wire6)) <= {reg18[(2'h2):(1'h1)]})));
            end
          else
            begin
              reg19 <= ($unsigned($signed(wire6[(4'ha):(2'h2)])) ~^ {wire9[(2'h2):(1'h1)]});
              reg20 <= reg19;
              reg21 <= {($signed(reg18) ?
                      ($signed((~^reg14)) + (^reg12)) : {($unsigned(reg21) != $signed(reg13))})};
            end
          if ((wire9 != reg20))
            begin
              reg24 <= $signed($unsigned(reg13));
            end
          else
            begin
              reg24 <= wire7;
            end
        end
      else
        begin
          reg15 <= (~^(({(+reg22), $signed((8'ha9))} ?
              (((8'ha1) != (8'ha1)) & wire9) : (~^$signed(reg14))) << $unsigned($signed({wire10,
              reg16}))));
          reg16 <= ($signed(((+(reg11 ?
              reg12 : reg16)) || $signed(reg20[(4'hb):(4'h8)]))) != wire9[(1'h1):(1'h1)]);
          reg17 <= (~reg24);
          reg18 <= reg19;
          reg19 <= reg17[(3'h5):(1'h0)];
        end
    end
  assign wire25 = (~|$unsigned(($signed((reg17 <<< wire10)) || (reg18 ?
                      $unsigned(reg17) : (~|wire10)))));
  assign wire26 = reg19;
  assign wire27 = reg22;
  module28 #() modinst51 (wire50, clk, wire27, reg22, reg23, reg19);
  module52 #() modinst66 (wire65, clk, reg15, reg24, reg13, wire25);
  module67 #() modinst99 (wire98, clk, wire26, reg19, wire8, reg13);
  assign wire100 = (-wire8);
  module101 #() modinst147 (.wire105(reg15), .wire104(reg16), .wire106(wire26), .y(wire146), .wire102(wire10), .wire103(reg22), .clk(clk));
  assign wire148 = reg15;
  assign wire149 = $unsigned(((&wire10[(2'h2):(1'h0)]) ?
                       ($signed((-(8'h9d))) != (wire98[(4'hb):(3'h5)] ?
                           (wire148 | wire100) : $signed(wire65))) : ($unsigned({wire98,
                               reg23}) ?
                           ((wire146 * (8'h9f)) ?
                               $unsigned(reg15) : {reg22, reg14}) : (8'ha0))));
  module150 #() modinst191 (.wire153(wire146), .y(wire190), .wire154(reg14), .wire152(wire10), .wire151(wire8), .clk(clk));
endmodule

module module150
#(parameter param189 = ({({((8'hbf) ? (8'hae) : (7'h41))} ? (((8'ha4) | (8'ha2)) ? {(8'ha6), (8'haa)} : ((8'ha6) >= (8'hb6))) : ((~^(8'ha3)) ? ((8'ha5) ? (8'h9d) : (8'hbb)) : ((8'hb1) <= (8'ha7)))), ((8'h9d) ? (((8'hb9) ? (8'haa) : (8'hbd)) ? (8'hab) : ((8'ha9) <= (8'ha3))) : {(~^(8'ha4)), (!(8'h9c))})} || (^((~&((8'h9d) ? (8'hbc) : (8'hb2))) ? ((8'hac) && ((8'h9c) ? (8'hb2) : (7'h42))) : ((+(7'h40)) == ((7'h43) ? (8'ha2) : (7'h40)))))))
(y, clk, wire154, wire153, wire152, wire151);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire154;
  input wire signed [(4'hd):(1'h0)] wire153;
  input wire signed [(3'h6):(1'h0)] wire152;
  input wire signed [(2'h3):(1'h0)] wire151;
  wire [(5'h13):(1'h0)] wire188;
  wire signed [(4'ha):(1'h0)] wire187;
  wire [(4'h8):(1'h0)] wire186;
  wire signed [(2'h3):(1'h0)] wire168;
  wire signed [(5'h11):(1'h0)] wire167;
  wire signed [(2'h3):(1'h0)] wire166;
  wire [(2'h3):(1'h0)] wire165;
  wire signed [(4'hb):(1'h0)] wire164;
  wire signed [(4'hd):(1'h0)] wire163;
  wire signed [(4'h9):(1'h0)] wire162;
  wire signed [(5'h14):(1'h0)] wire161;
  wire [(3'h7):(1'h0)] wire160;
  wire [(2'h2):(1'h0)] wire159;
  wire signed [(4'hf):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire157;
  wire signed [(5'h11):(1'h0)] wire156;
  reg signed [(3'h4):(1'h0)] reg185 = (1'h0);
  reg [(5'h15):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg183 = (1'h0);
  reg [(3'h6):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg180 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg179 = (1'h0);
  reg [(4'hd):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg177 = (1'h0);
  reg [(4'hf):(1'h0)] reg176 = (1'h0);
  reg [(5'h13):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg [(4'h8):(1'h0)] reg173 = (1'h0);
  reg [(5'h13):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg171 = (1'h0);
  reg [(5'h13):(1'h0)] reg170 = (1'h0);
  reg [(3'h5):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg155 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire186,
                 wire168,
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
                 reg185,
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
                 reg169,
                 reg155,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg155 <= $signed(wire152[(2'h3):(2'h3)]);
    end
  assign wire156 = {((~^((wire153 < wire154) * wire152[(1'h1):(1'h1)])) ?
                           $unsigned(((8'hb8) ?
                               wire154 : (wire151 > (7'h41)))) : {$signed($signed(reg155)),
                               {$signed(wire151), reg155}})};
  assign wire157 = (^~(((|$signed((8'hbf))) ?
                       wire153[(3'h6):(2'h2)] : $signed($unsigned(reg155))) <<< wire156[(3'h4):(2'h2)]));
  assign wire158 = wire152[(2'h2):(2'h2)];
  assign wire159 = ($signed(wire156) ?
                       (($signed({wire152,
                           (8'ha7)}) | (8'h9f)) == $unsigned($unsigned({wire157,
                           wire158}))) : $unsigned((wire153[(3'h5):(1'h0)] ?
                           (wire152 ?
                               $signed(wire152) : (~|wire153)) : (wire158[(4'h8):(2'h2)] ?
                               $signed((8'hbb)) : wire153[(1'h0):(1'h0)]))));
  assign wire160 = ($unsigned(wire154[(4'hb):(4'hb)]) ^~ $signed(($unsigned($signed(wire159)) - reg155[(4'ha):(3'h7)])));
  assign wire161 = ((^(~$signed(wire153))) ?
                       ($unsigned((|(wire160 ? (8'haf) : wire160))) ?
                           $signed({((7'h44) && wire153),
                               (~|(8'hb2))}) : wire151[(1'h1):(1'h1)]) : $signed(wire158));
  assign wire162 = wire156;
  assign wire163 = {wire156};
  assign wire164 = wire161[(5'h14):(5'h10)];
  assign wire165 = (8'ha8);
  assign wire166 = wire159;
  assign wire167 = (((8'hb7) ?
                           (($signed(wire156) ?
                               (wire160 ?
                                   wire164 : wire158) : (~&wire166)) + $signed((wire164 * (8'hb1)))) : wire157) ?
                       $unsigned(($signed($unsigned(wire153)) ?
                           $unsigned((wire161 ?
                               wire157 : wire165)) : $signed($unsigned(wire161)))) : $signed(wire159));
  assign wire168 = wire159;
  always
    @(posedge clk) begin
      reg169 <= (~(&$unsigned($unsigned((~^wire153)))));
      reg170 <= wire151;
      reg171 <= $unsigned(($signed(wire159[(1'h0):(1'h0)]) ?
          (|wire163[(3'h7):(1'h1)]) : (($unsigned((7'h43)) ?
                  wire154 : (wire159 ? (8'ha7) : wire152)) ?
              wire167 : $signed({wire163}))));
      if ((wire160 & ($signed((8'ha9)) ?
          wire165 : (wire166[(2'h2):(2'h2)] <= $unsigned({wire164})))))
        begin
          if (reg170[(4'hd):(1'h0)])
            begin
              reg172 <= (wire159 ?
                  (&reg155) : $unsigned($unsigned(wire164[(2'h2):(1'h0)])));
              reg173 <= (wire163[(3'h7):(3'h4)] && {$signed((~(wire152 ^~ wire160))),
                  reg170});
              reg174 <= $signed($unsigned($unsigned((^((8'ha1) >= wire164)))));
              reg175 <= $unsigned(reg174);
            end
          else
            begin
              reg172 <= ((8'h9e) ?
                  ($unsigned((8'ha4)) >> (~^$unsigned((wire161 ?
                      wire165 : reg174)))) : reg155[(4'h8):(1'h0)]);
              reg173 <= (8'hac);
              reg174 <= ($unsigned((|$signed((^~wire158)))) << (-(wire163[(3'h4):(2'h2)] + $signed(((8'hb8) & wire168)))));
              reg175 <= $signed($signed((8'hb7)));
              reg176 <= $signed(($unsigned(wire156[(2'h2):(2'h2)]) ^ (wire168[(2'h2):(1'h0)] ?
                  {(wire166 || wire167)} : {(wire165 ? reg174 : wire154),
                      wire157[(1'h1):(1'h1)]})));
            end
          reg177 <= (~$unsigned(($signed((wire154 ?
              wire165 : wire168)) >>> ((wire161 >= (8'ha4)) ?
              {(7'h40), wire168} : reg173[(3'h7):(2'h2)]))));
        end
      else
        begin
          if ({$signed(($unsigned(reg176[(1'h0):(1'h0)]) < wire165)), reg173})
            begin
              reg172 <= (~&wire163);
              reg173 <= wire156;
              reg174 <= $signed($unsigned(($unsigned($signed(wire167)) && $unsigned((&wire165)))));
              reg175 <= $unsigned($unsigned(wire159));
              reg176 <= ((reg174[(4'h8):(3'h5)] == (~^reg174[(4'h8):(2'h3)])) ?
                  $unsigned((~^$unsigned((wire162 + reg173)))) : reg175);
            end
          else
            begin
              reg172 <= ({wire156} <= {$signed(((7'h40) ?
                      (~reg174) : $unsigned(wire151)))});
              reg173 <= (~&(~&$unsigned((reg172 != (8'ha3)))));
              reg174 <= $unsigned(wire160);
              reg175 <= ({wire158[(1'h0):(1'h0)],
                      $signed((wire163 ^~ $signed(reg155)))} ?
                  ((((wire160 > (8'ha8)) ?
                              wire164[(4'ha):(1'h1)] : {reg173, (8'haf)}) ?
                          (^~wire164[(4'h8):(1'h0)]) : ($signed(reg176) != (!wire159))) ?
                      $unsigned((wire157[(2'h3):(2'h2)] ?
                          $unsigned(reg176) : wire162[(3'h5):(2'h2)])) : $signed((+((7'h44) ?
                          wire167 : reg175)))) : $signed(wire163[(3'h4):(2'h2)]));
            end
          if (($unsigned($signed(wire158)) ?
              (+(~^(^~{(7'h42), reg176}))) : $unsigned((~&($signed((8'haf)) ?
                  (8'ha3) : ((8'hb0) ? wire166 : (7'h43)))))))
            begin
              reg177 <= (wire159[(1'h0):(1'h0)] ?
                  ($unsigned($unsigned($unsigned(reg172))) ?
                      (((reg176 - reg155) && (wire162 ?
                          wire167 : (8'hb7))) && $unsigned((&reg174))) : (|((|wire166) ?
                          $signed(wire156) : wire163[(4'hb):(2'h2)]))) : $signed((wire164 ?
                      wire157 : (^~$unsigned(wire168)))));
              reg178 <= reg169;
              reg179 <= ({(~|$unsigned($unsigned(wire159)))} ?
                  (+$signed(wire162)) : ($signed($signed(((8'hba) < wire165))) <= {wire157[(3'h6):(1'h0)],
                      $unsigned((wire158 <= wire166))}));
              reg180 <= (~^$signed(reg176));
            end
          else
            begin
              reg177 <= $signed((^~$unsigned(((wire165 ? reg178 : wire162) ?
                  (7'h40) : $signed(wire160)))));
              reg178 <= $unsigned($signed($signed(wire156[(3'h7):(1'h1)])));
              reg179 <= (&$signed(reg179[(2'h3):(2'h3)]));
            end
          if ((8'hb5))
            begin
              reg181 <= reg175;
              reg182 <= reg180[(1'h0):(1'h0)];
              reg183 <= ({wire153[(3'h5):(2'h3)],
                  (~&((wire166 ?
                      (7'h43) : reg178) << $signed(wire154)))} >= {(((wire153 ?
                          (8'haa) : wire151) ?
                      {reg175, wire163} : (&wire163)) ~^ ((wire165 <= wire168) ?
                      {wire154, reg171} : wire165[(1'h0):(1'h0)])),
                  (~{(wire166 ? wire156 : reg169)})});
              reg184 <= reg173[(4'h8):(2'h3)];
              reg185 <= $signed((~^$unsigned(wire159[(2'h2):(1'h0)])));
            end
          else
            begin
              reg181 <= (($signed((~|(reg174 <<< reg173))) ?
                  wire161[(4'hb):(3'h4)] : (~^reg185)) + (^~(+wire168[(1'h1):(1'h0)])));
              reg182 <= reg174;
              reg183 <= {(~^(&reg172[(1'h1):(1'h0)])),
                  $signed($signed(reg185[(1'h0):(1'h0)]))};
              reg184 <= wire156;
              reg185 <= ($unsigned(($signed(reg179[(3'h6):(2'h3)]) >= {wire158})) ?
                  ((|(~|(reg180 ?
                      wire163 : reg169))) > ((reg171[(4'h8):(3'h7)] ?
                      reg177 : $signed(reg185)) == ($signed(reg173) <<< ((7'h41) <<< wire167)))) : (~^wire165[(2'h3):(1'h0)]));
            end
        end
    end
  assign wire186 = $signed(wire159);
  assign wire187 = (~reg170[(2'h3):(2'h2)]);
  assign wire188 = ($unsigned(wire161[(3'h7):(1'h1)]) ?
                       $signed($unsigned((^reg174))) : wire186);
endmodule

module module101  (y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'h1fd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire106;
  input wire [(5'h14):(1'h0)] wire105;
  input wire signed [(4'hb):(1'h0)] wire104;
  input wire [(2'h3):(1'h0)] wire103;
  input wire signed [(4'hb):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire145;
  wire signed [(3'h7):(1'h0)] wire144;
  wire [(5'h12):(1'h0)] wire143;
  wire [(5'h10):(1'h0)] wire142;
  wire signed [(5'h12):(1'h0)] wire141;
  wire signed [(4'hd):(1'h0)] wire140;
  wire signed [(5'h14):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire138;
  wire [(5'h12):(1'h0)] wire137;
  wire signed [(3'h6):(1'h0)] wire136;
  wire signed [(4'hd):(1'h0)] wire135;
  wire [(3'h7):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire107;
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg133 = (1'h0);
  reg [(4'hd):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg130 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(4'h8):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(4'h8):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire108,
                 wire107,
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
                 (1'h0)};
  assign wire107 = wire104;
  assign wire108 = (wire105 * $unsigned($unsigned(wire102)));
  always
    @(posedge clk) begin
      if (((wire108[(3'h4):(2'h2)] ?
              ((^~wire108[(1'h0):(1'h0)]) ?
                  $unsigned($unsigned(wire108)) : (~wire107)) : ($unsigned(wire104[(4'h9):(4'h9)]) && $signed((wire104 ?
                  (8'hbc) : wire108)))) ?
          (wire102 > $signed(wire106[(3'h5):(1'h0)])) : $signed(wire107)))
        begin
          if ($unsigned(wire104[(2'h2):(2'h2)]))
            begin
              reg109 <= (&$signed((wire105 < {$unsigned(wire107)})));
              reg110 <= (((((~&wire104) != wire103[(1'h0):(1'h0)]) ?
                  reg109 : (~^(wire105 << wire107))) + wire104) || wire107);
              reg111 <= ($unsigned($unsigned($unsigned($unsigned(wire103)))) ?
                  $unsigned(wire107) : (+wire107));
              reg112 <= $signed(($unsigned((|$signed(wire102))) ~^ $unsigned(reg109)));
            end
          else
            begin
              reg109 <= wire105;
              reg110 <= wire106[(3'h5):(1'h0)];
              reg111 <= (~^(!$unsigned($unsigned(reg112))));
              reg112 <= reg110;
              reg113 <= reg109[(2'h2):(1'h1)];
            end
          reg114 <= $unsigned({wire102,
              $unsigned($unsigned((wire108 ? wire107 : wire107)))});
          reg115 <= (^~$unsigned(wire104));
          reg116 <= reg114;
          reg117 <= $unsigned((($unsigned(reg115[(2'h3):(1'h0)]) ?
                  reg109[(1'h0):(1'h0)] : (reg114[(4'ha):(3'h6)] ?
                      $unsigned(reg111) : (wire105 & wire106))) ?
              ((~&(wire108 | reg113)) ?
                  {(8'hae)} : reg113) : {(^~$signed(wire105))}));
        end
      else
        begin
          if ($signed(({$signed(reg110[(5'h10):(2'h2)]),
              (~&(reg116 ? (7'h44) : reg111))} == (((~wire105) ?
              (reg117 != (8'hbd)) : (reg113 != reg112)) ~^ $unsigned($signed(reg112))))))
            begin
              reg109 <= ({{((reg113 != (8'hbe)) < (|wire106))},
                  $signed(((~wire108) < (8'haa)))} || reg114[(4'he):(3'h5)]);
              reg110 <= reg109[(3'h7):(3'h7)];
              reg111 <= wire102;
              reg112 <= $signed(reg117);
            end
          else
            begin
              reg109 <= reg114;
              reg110 <= ((((|$signed(wire108)) <= (reg115 && (reg116 ?
                          reg109 : reg115))) ?
                      {(&reg115[(2'h2):(2'h2)])} : reg109) ?
                  $unsigned(reg116) : (((&$signed((8'h9e))) ?
                      $unsigned($unsigned(reg110)) : (((8'hb7) ?
                          reg110 : reg116) > reg114[(4'hc):(3'h4)])) >= {reg112[(3'h6):(3'h6)],
                      (~^wire105[(3'h6):(2'h2)])}));
              reg111 <= (((~{reg116}) ?
                      $unsigned(wire104[(4'h8):(2'h3)]) : wire103) ?
                  $signed($signed($unsigned((^(8'hb3))))) : wire108[(3'h7):(1'h1)]);
              reg112 <= wire102;
            end
        end
      reg118 <= wire107;
      if (($unsigned(((wire108[(2'h2):(2'h2)] ?
              wire106 : (wire103 ?
                  wire104 : reg109)) <= reg115[(1'h1):(1'h0)])) ?
          $unsigned(({$signed(wire108)} ?
              (~|{wire107, wire108}) : (~^(wire108 ?
                  reg117 : reg110)))) : ($signed($unsigned((~|reg114))) <= (((!wire105) ?
              (reg110 ? reg116 : reg113) : (wire102 ?
                  wire106 : reg116)) >> wire104[(3'h4):(1'h0)]))))
        begin
          reg119 <= (8'hbf);
        end
      else
        begin
          if ($unsigned(((reg116[(1'h0):(1'h0)] ?
              ((wire105 ? reg117 : reg118) || $unsigned(wire102)) : ((reg110 ?
                      reg111 : reg117) ?
                  wire106 : reg114)) <= ((wire105 ?
                  (reg110 ? (7'h44) : reg112) : (reg118 > (8'hbd))) ?
              reg116[(1'h0):(1'h0)] : reg117))))
            begin
              reg119 <= $signed(reg114[(4'ha):(3'h4)]);
              reg120 <= wire108[(3'h4):(2'h3)];
              reg121 <= (!wire102[(2'h2):(1'h0)]);
              reg122 <= $unsigned(wire106);
              reg123 <= $unsigned((~|(($unsigned(reg109) ?
                      (reg114 ? wire107 : wire106) : $signed(wire108)) ?
                  wire104 : (8'ha1))));
            end
          else
            begin
              reg119 <= $unsigned(($unsigned(reg117[(3'h6):(3'h4)]) && (reg123 ~^ $signed((reg121 ^ reg113)))));
              reg120 <= {$unsigned(($unsigned(reg116) != reg115[(2'h3):(2'h2)])),
                  wire105[(4'h8):(3'h6)]};
            end
          reg124 <= ($unsigned(reg117[(4'h9):(4'h8)]) ?
              (reg110[(1'h0):(1'h0)] - wire106) : reg115[(3'h5):(1'h0)]);
          reg125 <= $signed(($unsigned({(~^reg109)}) <<< (~(!$signed((7'h41))))));
          reg126 <= (({wire103,
              (^~(reg111 ?
                  reg111 : reg115))} & ((reg119 <= $unsigned((8'hb4))) ?
              $unsigned(((7'h40) & wire105)) : $unsigned(reg122[(3'h6):(2'h2)]))) & reg117[(4'h9):(4'h9)]);
        end
      if ($signed((($signed((reg112 ? wire108 : (8'hb4))) ?
          $signed($signed(reg124)) : reg112[(3'h4):(2'h2)]) ^~ (~|$unsigned(((8'haa) ?
          reg125 : reg113))))))
        begin
          reg127 <= (({reg113[(1'h1):(1'h1)],
              reg113} != $unsigned(($unsigned((8'had)) ?
              $unsigned(reg125) : $unsigned((8'hbd))))) && ($unsigned(reg110) >> $signed(reg115[(1'h0):(1'h0)])));
          reg128 <= ($unsigned($unsigned($signed((reg117 ?
                  reg117 : (8'hbe))))) ?
              reg119[(2'h2):(1'h1)] : wire107);
          reg129 <= {$signed($unsigned(((wire105 ? reg127 : wire108) ?
                  reg123 : (reg128 + wire102)))),
              (^{reg117[(4'h9):(1'h1)]})};
          if (reg119)
            begin
              reg130 <= reg116;
              reg131 <= (~^$signed((($unsigned(wire103) >>> $signed(reg119)) ?
                  $unsigned(wire103) : ((wire102 <<< reg123) ~^ $unsigned(reg116)))));
              reg132 <= {(8'haf)};
              reg133 <= reg120[(2'h2):(2'h2)];
              reg134 <= {$unsigned(wire103), $signed(reg127)};
            end
          else
            begin
              reg130 <= wire106[(1'h1):(1'h1)];
              reg131 <= reg119;
              reg132 <= (^(reg129[(4'hd):(4'hc)] << reg128[(3'h7):(3'h5)]));
              reg133 <= ((($signed($unsigned(reg121)) >>> $unsigned((^reg118))) ?
                      $unsigned({(reg128 ^ reg118)}) : (|$signed((~&reg131)))) ?
                  $unsigned($unsigned(((7'h40) | $unsigned(reg131)))) : wire105[(5'h13):(4'h8)]);
            end
        end
      else
        begin
          reg127 <= $signed($unsigned({$signed(wire107)}));
          reg128 <= (8'hb3);
        end
    end
  assign wire135 = $signed($unsigned((~^$signed(reg128))));
  assign wire136 = {reg118[(1'h0):(1'h0)]};
  assign wire137 = {$unsigned(wire102[(3'h4):(1'h1)]), wire102};
  assign wire138 = ((reg123 & ((~$unsigned(wire135)) ?
                           ((reg123 ? reg118 : reg120) + reg109) : reg120)) ?
                       ((reg132[(3'h7):(3'h7)] ?
                           reg109 : ($signed(reg124) ?
                               (!reg125) : reg122)) & $unsigned({(reg123 <<< reg126)})) : ((8'ha4) == (^((wire104 || wire107) < (reg117 ?
                           reg116 : reg115)))));
  assign wire139 = reg132;
  assign wire140 = ((!((reg110 ?
                       $signed(wire138) : (reg123 ?
                           wire135 : wire104)) & reg116[(3'h6):(3'h4)])) < reg126[(4'h9):(1'h1)]);
  assign wire141 = reg132[(4'hc):(4'h9)];
  assign wire142 = ($unsigned((((reg113 && reg122) ^~ wire104) ?
                           ((~(8'hbb)) ? wire105 : reg116) : (7'h40))) ?
                       reg124 : ((8'hb2) << wire107[(3'h5):(2'h3)]));
  assign wire143 = (|(8'ha1));
  assign wire144 = ($signed((~|$unsigned((wire141 & reg130)))) + (~&{reg127[(2'h2):(1'h1)],
                       reg134[(5'h12):(2'h2)]}));
  assign wire145 = $signed($unsigned((wire138 ?
                       reg116[(3'h6):(1'h0)] : ((~wire108) >= reg112[(2'h2):(1'h0)]))));
endmodule

module module67
#(parameter param96 = (8'ha5), 
parameter param97 = {(7'h43)})
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire71;
  input wire signed [(3'h4):(1'h0)] wire70;
  input wire [(2'h2):(1'h0)] wire69;
  input wire [(2'h3):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire94;
  wire [(4'hb):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire72;
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg92,
                 reg91,
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
                 (1'h0)};
  assign wire72 = wire69[(1'h1):(1'h1)];
  assign wire73 = (wire71[(1'h1):(1'h0)] < wire68);
  assign wire74 = {$unsigned(wire70[(2'h2):(2'h2)]), wire70[(2'h3):(2'h3)]};
  assign wire75 = wire70;
  always
    @(posedge clk) begin
      if (wire69)
        begin
          reg76 <= (&($signed(wire72[(4'hd):(3'h6)]) && (|((^~wire75) >>> (wire75 ^~ wire70)))));
          if ($unsigned({($unsigned(wire70[(2'h2):(1'h1)]) ^ $signed(wire68[(2'h3):(2'h2)]))}))
            begin
              reg77 <= $unsigned($unsigned(((wire75[(1'h1):(1'h1)] ?
                      wire68[(1'h1):(1'h0)] : (wire75 ^ wire71)) ?
                  (wire68 ?
                      (wire72 >> wire72) : {reg76,
                          wire73}) : $signed($unsigned(wire71)))));
              reg78 <= $unsigned(reg77);
              reg79 <= (|($unsigned($signed({reg78})) * (~wire69[(1'h1):(1'h0)])));
              reg80 <= $signed($unsigned(wire75[(3'h5):(3'h4)]));
              reg81 <= reg77;
            end
          else
            begin
              reg77 <= (($signed($unsigned((wire74 ? (8'haa) : reg80))) ?
                      (-(|$unsigned((7'h44)))) : (wire68 < $signed($signed(wire74)))) ?
                  $signed((~({reg78} - $signed(wire74)))) : reg76);
              reg78 <= wire68;
              reg79 <= {wire73[(2'h3):(2'h2)]};
            end
          if ((reg81[(1'h1):(1'h1)] << {(wire72 ? wire69 : wire70)}))
            begin
              reg82 <= (wire70 | $unsigned((((7'h41) ?
                  (wire71 | (8'hb5)) : wire70) >> {(~|wire72)})));
              reg83 <= (~|(+(&{{reg78, wire70}})));
              reg84 <= (^~({$unsigned((wire73 ? wire75 : reg76)),
                  ((wire70 != wire71) ?
                      $signed(reg76) : $unsigned(wire69))} <= wire71[(4'hc):(3'h5)]));
              reg85 <= ((((8'hab) ?
                      $signed((!reg77)) : $unsigned($signed(wire72))) ?
                  $unsigned(reg81[(3'h5):(3'h5)]) : (reg76 ?
                      (^~wire72[(4'he):(4'hc)]) : wire71[(4'h8):(1'h0)])) && ($unsigned((!wire74[(1'h1):(1'h1)])) == wire72[(3'h5):(3'h5)]));
              reg86 <= (~&$unsigned({$unsigned(wire68), $signed(wire68)}));
            end
          else
            begin
              reg82 <= (&wire73[(4'h9):(2'h2)]);
              reg83 <= (reg78[(5'h11):(4'hf)] >>> (((reg79 >> $unsigned(reg78)) > ((wire69 ?
                          reg78 : reg79) ?
                      (reg85 ? wire75 : reg86) : $signed(wire72))) ?
                  $signed((^(wire71 - wire69))) : ((~&(!reg84)) ?
                      (&wire69[(1'h1):(1'h0)]) : reg81[(3'h5):(3'h4)])));
              reg84 <= $unsigned((^~$signed($signed((~|wire74)))));
              reg85 <= (~^$signed(($signed((wire70 > wire69)) ?
                  ($signed(reg82) && wire71) : reg76[(5'h14):(5'h12)])));
              reg86 <= reg86;
            end
          if ({(((reg76[(5'h11):(3'h4)] + reg77[(1'h0):(1'h0)]) & reg81) << $unsigned($signed({wire72}))),
              $signed($unsigned({reg86[(2'h3):(1'h0)]}))})
            begin
              reg87 <= {$signed((!{wire74, {wire68}})),
                  $unsigned($signed(($signed((8'hba)) ?
                      $signed(reg81) : $unsigned(reg76))))};
              reg88 <= ((reg79[(2'h2):(1'h1)] + reg77) ?
                  $signed(wire75) : ($unsigned({(reg83 ? wire75 : (8'ha9))}) ?
                      $unsigned($unsigned((~^reg79))) : ((reg80 <= (reg85 ?
                          wire73 : wire75)) >>> $signed($signed(reg79)))));
              reg89 <= ((reg88 ? $unsigned(reg87) : $unsigned((~reg88))) ?
                  (($signed((&reg81)) ? $signed((wire69 | wire71)) : reg77) ?
                      (&reg83) : wire75) : reg82[(4'hd):(4'hc)]);
              reg90 <= (($unsigned(((|wire73) ?
                  ((8'hbe) ?
                      (7'h44) : reg82) : (reg83 < reg79))) || (~|((reg82 ?
                      (8'ha4) : wire68) ?
                  reg89 : (wire74 != reg81)))) ^~ (&(|$signed((^~wire75)))));
            end
          else
            begin
              reg87 <= $unsigned((reg90[(1'h1):(1'h0)] ? wire68 : (8'ha9)));
              reg88 <= (($unsigned($signed($unsigned((8'hae)))) * wire68) && reg90);
              reg89 <= reg82[(4'h9):(1'h1)];
            end
          reg91 <= wire68;
        end
      else
        begin
          reg76 <= (|(7'h42));
          reg77 <= ($unsigned(($signed($unsigned(wire70)) ?
              ((reg84 <<< (8'hac)) ?
                  (wire72 & reg77) : reg78) : (&reg88))) <= {wire71[(4'h9):(3'h6)]});
          if ((($unsigned(reg88) ?
              wire68 : (+wire68[(2'h2):(2'h2)])) && $unsigned($signed(wire68))))
            begin
              reg78 <= {(($signed({(8'hb0)}) * {reg76[(4'he):(3'h4)]}) ?
                      reg90[(1'h1):(1'h1)] : (((wire74 ?
                          wire74 : reg91) > $unsigned(reg78)) - reg86[(1'h0):(1'h0)]))};
              reg79 <= $unsigned(reg82);
            end
          else
            begin
              reg78 <= (reg87[(4'hb):(4'ha)] ?
                  ((($signed(reg82) <<< ((8'hb7) ^ reg90)) ?
                      (^(wire70 >>> wire73)) : reg87) > $signed(reg76)) : {reg88[(5'h10):(2'h3)]});
              reg79 <= wire72[(4'ha):(3'h6)];
            end
          reg80 <= ($unsigned((((^~reg89) ?
                  $unsigned(wire72) : (!reg82)) | $signed((wire74 >>> reg86)))) ?
              $signed((reg87 ?
                  (-$signed(reg91)) : ($unsigned(wire71) ?
                      reg86[(3'h4):(1'h0)] : {(8'ha3)}))) : (~&(reg83[(5'h10):(4'hb)] ?
                  $signed($unsigned(reg76)) : $unsigned((reg78 || reg76)))));
          reg81 <= $unsigned((($unsigned(((8'haa) ?
                  wire74 : reg77)) >= ($signed(reg85) ?
                  $unsigned(reg83) : $signed(wire71))) ?
              $signed($signed((&reg85))) : reg91[(4'ha):(4'ha)]));
        end
      reg92 <= (reg91 ?
          reg82[(2'h3):(1'h1)] : (^~$unsigned(reg89[(1'h0):(1'h0)])));
    end
  assign wire93 = $unsigned({$signed((!{reg80, reg82})), {{{reg88}}}});
  assign wire94 = (reg78[(4'hc):(4'ha)] ? reg89[(4'hd):(4'h8)] : reg76);
  assign wire95 = $unsigned(((~^{(^~wire68)}) ?
                      (($unsigned(reg79) ? $signed(reg85) : (reg84 >= wire94)) ?
                          $signed((!reg77)) : (wire74[(4'h8):(3'h4)] ?
                              {wire94} : (reg91 ~^ reg77))) : (((wire75 ?
                          (8'hae) : reg83) ~^ {reg76}) && (~&(~wire93)))));
endmodule

module module52
#(parameter param63 = ((+(!(^~(-(7'h42))))) ? ({((7'h42) * ((8'h9e) ^~ (8'hbe)))} ^ (((-(8'hb5)) >= ((8'hbd) <<< (8'ha9))) >= ({(8'hae), (8'hb4)} ? {(8'hbe)} : ((8'hb5) ? (8'hbd) : (8'h9f))))) : (((((8'ha7) >= (8'hb6)) ? (+(8'hb3)) : (~(8'hbd))) * {{(8'ha9), (8'hb6)}}) ? ((((8'had) ^~ (8'h9c)) << ((8'h9d) ? (8'h9d) : (8'ha7))) ? (((8'ha6) ? (8'hb1) : (8'hbb)) * (~(8'h9d))) : ((&(8'hb0)) ? (^~(8'haa)) : ((7'h44) == (8'ha8)))) : {(-(^(8'hba))), {(8'hb9), ((7'h43) ? (8'hb0) : (7'h41))}})), 
parameter param64 = (({(&(param63 ? param63 : (8'ha3)))} << (((~^param63) != ((8'hb5) && param63)) ? {(param63 != param63), (param63 || param63)} : ((~|param63) ? (param63 && param63) : {param63, param63}))) ? param63 : (8'hbe)))
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire56;
  input wire [(5'h11):(1'h0)] wire55;
  input wire [(4'hd):(1'h0)] wire54;
  input wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  assign y = {wire62, wire61, wire60, wire59, wire58, wire57, (1'h0)};
  assign wire57 = wire53[(1'h0):(1'h0)];
  assign wire58 = wire54;
  assign wire59 = (^((^($signed(wire58) ? wire57 : (~&wire57))) ?
                      (~(wire56[(3'h6):(1'h0)] ?
                          $unsigned(wire56) : (wire56 * wire53))) : $unsigned(($unsigned(wire58) ?
                          $unsigned(wire56) : (wire58 && wire53)))));
  assign wire60 = (^~(~^wire57[(2'h2):(2'h2)]));
  assign wire61 = (wire60 < (!$unsigned((+$unsigned(wire58)))));
  assign wire62 = $signed({wire55, wire55});
endmodule

module module28
#(parameter param49 = ((({((8'ha3) == (8'hb6)), (~|(8'ha7))} & (~|(~|(8'hb3)))) ? (8'ha0) : {{((7'h44) <<< (8'hbb))}}) ? ({(((8'haf) ^ (8'h9e)) ? ((8'ha8) * (8'hbe)) : ((8'ha5) > (8'haf)))} * {((!(8'ha4)) ? ((8'ha5) <<< (8'ha4)) : (|(8'haa))), ((~|(8'h9d)) | (+(8'hbc)))}) : ((~^(((8'hb7) - (8'h9d)) ? ((8'h9d) >> (8'hb6)) : {(8'hb3), (8'had)})) ? {({(8'ha9)} >= ((8'h9c) ? (8'hbc) : (8'h9f))), (-((7'h40) && (8'hb5)))} : ((((8'hae) ? (8'hbf) : (8'ha0)) & ((8'haf) < (8'hb5))) ? (((7'h40) ? (8'hb1) : (8'hbc)) ? ((8'ha9) ^ (8'ha0)) : (8'h9f)) : ((|(8'haa)) << {(7'h43)})))))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire32;
  input wire [(4'hd):(1'h0)] wire31;
  input wire signed [(3'h6):(1'h0)] wire30;
  input wire signed [(2'h3):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire33 = $signed(($unsigned((~&(wire29 ? wire30 : wire32))) ?
                      ((wire29[(1'h0):(1'h0)] << $signed(wire30)) ?
                          (7'h44) : wire31[(4'hd):(3'h4)]) : wire31[(4'hd):(4'hd)]));
  assign wire34 = wire31;
  assign wire35 = $unsigned(($unsigned(wire32[(4'h9):(3'h5)]) <= $unsigned(wire31)));
  assign wire36 = ((-wire29[(1'h1):(1'h0)]) ?
                      wire29 : ($unsigned(((wire33 & wire30) == wire32)) ~^ ((-$signed(wire29)) ?
                          ((8'ha1) ?
                              (wire33 ?
                                  wire29 : wire32) : (wire30 >= wire29)) : {wire29[(2'h2):(2'h2)]})));
  assign wire37 = wire32;
  assign wire38 = (~|$unsigned(($signed(wire33) && wire30)));
  assign wire39 = wire34;
  assign wire40 = $signed({({wire39, wire29} + $unsigned(((8'had) ?
                          wire37 : wire38)))});
  assign wire41 = (|($unsigned(($unsigned(wire35) ?
                          wire39 : $unsigned(wire29))) ?
                      ($unsigned(wire36) * $unsigned((wire29 >= wire38))) : $signed({$signed(wire32),
                          ((8'h9c) + wire29)})));
  always
    @(posedge clk) begin
      reg42 <= (wire34[(3'h6):(3'h5)] ? (-(+(7'h40))) : wire35[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg43 <= wire34[(3'h4):(2'h2)];
    end
  assign wire44 = $unsigned(wire30[(1'h0):(1'h0)]);
  assign wire45 = {$unsigned((((^~wire37) ?
                          wire34[(1'h1):(1'h0)] : (!wire36)) * wire40))};
  assign wire46 = wire41[(1'h0):(1'h0)];
  assign wire47 = (+{{wire45[(3'h7):(2'h2)], wire33}});
  assign wire48 = (~&reg42[(4'hf):(1'h1)]);
endmodule
