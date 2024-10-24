module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h229):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire185;
  wire signed [(5'h11):(1'h0)] wire184;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire172;
  wire signed [(5'h15):(1'h0)] wire174;
  wire [(3'h4):(1'h0)] wire175;
  wire [(4'ha):(1'h0)] wire176;
  wire [(5'h15):(1'h0)] wire178;
  wire signed [(5'h10):(1'h0)] wire179;
  wire [(5'h15):(1'h0)] wire180;
  wire [(5'h14):(1'h0)] wire181;
  wire signed [(5'h11):(1'h0)] wire182;
  reg signed [(5'h14):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg218 = (1'h0);
  reg [(5'h11):(1'h0)] reg217 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg216 = (1'h0);
  reg [(5'h11):(1'h0)] reg215 = (1'h0);
  reg [(4'he):(1'h0)] reg214 = (1'h0);
  reg [(3'h7):(1'h0)] reg213 = (1'h0);
  reg [(5'h14):(1'h0)] reg212 = (1'h0);
  reg [(4'h8):(1'h0)] reg211 = (1'h0);
  reg [(3'h7):(1'h0)] reg210 = (1'h0);
  reg [(2'h2):(1'h0)] reg209 = (1'h0);
  reg [(5'h10):(1'h0)] reg208 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg207 = (1'h0);
  reg [(5'h11):(1'h0)] reg206 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg205 = (1'h0);
  reg [(5'h15):(1'h0)] reg204 = (1'h0);
  reg [(3'h5):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg198 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg197 = (1'h0);
  reg [(3'h6):(1'h0)] reg196 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg195 = (1'h0);
  reg [(5'h11):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg193 = (1'h0);
  reg [(2'h2):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg191 = (1'h0);
  reg [(4'h8):(1'h0)] reg190 = (1'h0);
  reg [(4'hc):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg188 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg186 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire60,
                 wire172,
                 wire174,
                 wire175,
                 wire176,
                 wire178,
                 wire179,
                 wire180,
                 wire181,
                 wire182,
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
                 (1'h0)};
  module5 #() modinst61 (.wire7(wire3), .wire6(wire0), .wire8(wire4), .wire10(wire1), .y(wire60), .clk(clk), .wire9(wire2));
  module62 #() modinst173 (.clk(clk), .wire65(wire4), .wire64(wire3), .y(wire172), .wire63(wire1), .wire66(wire0));
  assign wire174 = $unsigned(wire0[(4'hb):(3'h4)]);
  assign wire175 = (!{(-((^wire4) * {(7'h43), wire174})),
                       wire172[(3'h6):(2'h3)]});
  module62 #() modinst177 (wire176, clk, wire172, wire4, wire174, wire3);
  assign wire178 = ((wire3[(3'h5):(2'h3)] == $unsigned({wire174[(5'h14):(4'he)]})) ?
                       wire176[(4'h8):(1'h0)] : $unsigned(($signed(wire176) ^ wire4)));
  assign wire179 = (~({({wire1} || wire178)} ?
                       $unsigned(({wire60} ?
                           (wire2 ?
                               (8'hae) : wire1) : $unsigned(wire3))) : ((7'h40) != wire174)));
  assign wire180 = (8'hb9);
  assign wire181 = wire174[(4'h8):(2'h2)];
  module68 #() modinst183 (.y(wire182), .wire73(wire172), .clk(clk), .wire70(wire180), .wire72(wire3), .wire69(wire174), .wire71(wire178));
  assign wire184 = ((wire178[(3'h7):(3'h6)] ?
                           wire176[(3'h4):(2'h3)] : ({wire172} ?
                               ((~&wire3) ?
                                   (~|wire182) : $unsigned(wire0)) : wire1[(4'hf):(4'h8)])) ?
                       (wire179[(4'hc):(3'h7)] ?
                           {(|(+(8'hb2))),
                               ((7'h44) && (-wire182))} : $signed(wire182)) : $unsigned(($signed(wire181[(4'hc):(1'h0)]) == {((7'h42) >>> (8'hb7)),
                           {(8'hbc), wire3}})));
  assign wire185 = ((8'ha3) <<< (~^({(wire176 ?
                           wire175 : wire179)} && wire3[(5'h10):(5'h10)])));
  always
    @(posedge clk) begin
      reg186 <= (~|$unsigned($unsigned(((wire1 < wire184) ?
          wire172[(1'h0):(1'h0)] : (wire0 >= wire60)))));
      reg187 <= $unsigned(reg186[(3'h4):(2'h2)]);
      reg188 <= $signed(((^~$unsigned(((8'ha0) == wire4))) * {(wire3[(4'hd):(3'h7)] | $unsigned(wire1))}));
      reg189 <= wire185;
      reg190 <= (($unsigned($unsigned($unsigned(reg186))) ?
          (((~wire60) ^~ (wire179 ? wire175 : (7'h43))) ?
              wire172 : wire181[(4'ha):(3'h5)]) : ($unsigned({wire182,
                  (8'ha9)}) ?
              {(reg187 ? wire2 : (7'h40)),
                  (reg187 ? reg186 : wire1)} : (reg186[(1'h1):(1'h1)] ?
                  wire185 : $unsigned(wire176)))) == (+($unsigned($unsigned(reg188)) ?
          $unsigned((^reg186)) : $signed((wire178 ? reg188 : wire172)))));
    end
  always
    @(posedge clk) begin
      reg191 <= ({{$signed((reg186 ? (8'hab) : wire182))},
          {((wire1 <<< (8'ha2)) ? wire181 : (wire176 ? reg189 : wire2)),
              ((wire2 ? wire172 : wire185) ?
                  (wire172 ?
                      reg188 : reg186) : (8'hb0))}} ^ $signed(($unsigned($signed(wire2)) ?
          (~$signed(reg187)) : ($signed(wire3) ?
              (wire60 ? wire179 : wire181) : {wire179}))));
      if (reg188)
        begin
          reg192 <= $unsigned(wire185[(3'h5):(3'h4)]);
        end
      else
        begin
          reg192 <= ({wire175[(3'h4):(1'h0)], $signed(wire60)} < wire4);
          if ($signed((~^(-wire2))))
            begin
              reg193 <= (-reg192[(2'h2):(2'h2)]);
              reg194 <= ((reg191[(4'hb):(2'h2)] <<< ($signed({wire180}) ?
                      (&(wire3 * reg190)) : (wire178[(4'h8):(3'h4)] ?
                          (-reg186) : $unsigned(wire181)))) ?
                  $unsigned(((~&reg190) >> $unsigned($unsigned(reg189)))) : (^~(~^$unsigned(wire184))));
            end
          else
            begin
              reg193 <= reg188;
              reg194 <= $unsigned((+reg192));
              reg195 <= (((($unsigned((8'hb9)) ?
                              (|wire0) : $unsigned(wire179)) ?
                          reg190 : wire184[(4'hc):(3'h4)]) ?
                      wire185[(4'hc):(3'h4)] : $unsigned($unsigned((~^wire184)))) ?
                  wire178 : $signed(((reg189[(4'hb):(2'h2)] << (~|wire185)) <= ((wire181 >= wire60) * reg187[(1'h1):(1'h0)]))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg196 <= ($signed(wire182) ?
          (((8'ha3) ?
                  (wire179 ?
                      ((8'hbd) < reg186) : (wire178 >= reg192)) : (reg195[(2'h2):(1'h1)] ?
                      $signed(wire60) : wire181[(5'h13):(5'h13)])) ?
              ({$unsigned(reg186), reg195} << wire182) : wire175) : ({(reg186 ?
                  wire1 : wire185)} + ((wire4[(3'h7):(3'h4)] | (wire172 ?
                  reg187 : wire180)) ?
              $signed($unsigned(reg187)) : $signed((wire2 ?
                  reg192 : wire175)))));
      if (reg194[(2'h3):(1'h0)])
        begin
          if ($signed({$signed(wire178[(4'hc):(3'h7)]),
              (reg193[(2'h3):(1'h1)] ?
                  $unsigned({(8'hb0),
                      (8'h9d)}) : ($unsigned(wire180) >>> wire184))}))
            begin
              reg197 <= reg189[(4'hb):(4'ha)];
            end
          else
            begin
              reg197 <= wire1;
              reg198 <= wire176;
              reg199 <= reg198[(1'h1):(1'h0)];
              reg200 <= (-wire172);
            end
          reg201 <= (((~^wire3[(4'ha):(2'h3)]) << (({reg198} ?
              wire172[(2'h2):(1'h0)] : (wire179 ?
                  wire184 : (8'h9c))) <<< (~|$unsigned(wire2)))) >> wire174[(3'h5):(2'h3)]);
          reg202 <= $signed((&wire172[(4'hd):(4'hd)]));
        end
      else
        begin
          reg197 <= (|(~|(((wire60 >>> reg190) ?
              (|wire60) : $signed(reg195)) == reg194)));
          reg198 <= reg193[(2'h2):(1'h0)];
          reg199 <= reg195;
          if ($signed($signed($unsigned((!$unsigned(reg192))))))
            begin
              reg200 <= wire176[(2'h2):(1'h1)];
              reg201 <= $signed($unsigned((wire174[(2'h2):(2'h2)] * (8'hb7))));
              reg202 <= (((wire60[(4'hd):(4'ha)] ?
                  (!(-reg201)) : (8'haf)) & $unsigned(((-reg188) ?
                  reg197 : $unsigned(reg198)))) && reg195);
              reg203 <= (&reg197[(1'h1):(1'h1)]);
            end
          else
            begin
              reg200 <= $unsigned((^$unsigned(wire1[(4'hc):(3'h6)])));
            end
          reg204 <= (reg200[(3'h4):(2'h3)] <<< $signed($unsigned($unsigned($unsigned((8'haa))))));
        end
      if (reg186)
        begin
          if ($unsigned(wire172))
            begin
              reg205 <= $unsigned((wire180[(4'he):(3'h4)] >>> $signed(reg194[(1'h1):(1'h0)])));
            end
          else
            begin
              reg205 <= $unsigned((wire2 ?
                  ((~^{wire185, reg200}) ?
                      wire178[(4'h8):(3'h6)] : ({reg202, wire185} ^ (wire4 ?
                          reg203 : reg191))) : (wire2 != ({reg191,
                      wire184} - ((8'hbe) ? (8'hb5) : wire180)))));
              reg206 <= $unsigned($signed((|(-$unsigned(reg188)))));
            end
          reg207 <= (($unsigned($unsigned((wire3 ? reg204 : wire2))) ?
              wire3 : reg205[(3'h6):(1'h1)]) | reg193[(2'h2):(2'h2)]);
          reg208 <= $unsigned(({$unsigned((|wire184))} ?
              (reg194[(3'h7):(3'h6)] < (&$signed(reg186))) : {(reg186[(1'h0):(1'h0)] * (wire60 - reg192)),
                  reg203}));
          reg209 <= $signed(reg199);
        end
      else
        begin
          reg205 <= reg205[(2'h3):(1'h1)];
          reg206 <= $signed(reg209[(1'h1):(1'h0)]);
        end
      reg210 <= (-(|(8'hae)));
      if (reg205)
        begin
          reg211 <= reg210[(2'h3):(2'h3)];
        end
      else
        begin
          if (wire181[(3'h5):(3'h5)])
            begin
              reg211 <= reg211[(3'h7):(2'h3)];
              reg212 <= (-reg210);
              reg213 <= reg207;
              reg214 <= reg190[(2'h2):(1'h1)];
              reg215 <= $signed(wire60[(4'hb):(3'h7)]);
            end
          else
            begin
              reg211 <= (!(&$unsigned(reg211[(1'h1):(1'h1)])));
            end
          reg216 <= reg193;
          reg217 <= $unsigned((-(!((reg194 <= reg198) | reg190))));
          reg218 <= $unsigned((reg214[(3'h5):(2'h3)] * $unsigned(reg217[(1'h0):(1'h0)])));
          reg219 <= reg203[(2'h3):(2'h2)];
        end
    end
endmodule

module module62
#(parameter param170 = ((((((8'h9e) > (7'h44)) >= (~|(8'hb9))) ? (((8'h9e) ^~ (8'hab)) >> (&(8'h9e))) : (8'hae)) ? ((((8'hb4) ? (8'ha1) : (8'ha1)) * (|(8'h9d))) > {((8'h9f) ? (8'ha0) : (8'hb6)), ((8'ha1) ? (8'hb0) : (8'ha7))}) : (((~|(8'ha3)) + {(8'hb7)}) ? (((7'h42) ? (8'ha0) : (8'ha1)) ? (-(8'haa)) : (8'hb4)) : ((!(8'haa)) <= ((7'h43) <= (8'hb6))))) ? ({(((8'hb0) ? (8'hba) : (7'h41)) ? {(8'h9f), (8'hba)} : ((8'ha7) ~^ (8'hb5))), (((8'hbb) ? (8'h9d) : (8'hb6)) == (~|(8'ha4)))} ? ((~(!(8'ha8))) << ((!(8'ha8)) >= ((8'hba) ? (8'h9f) : (8'hb1)))) : ({(8'hb1)} ? ({(8'hbd)} + ((7'h42) ? (8'hbf) : (8'hb1))) : {((8'hb9) & (8'haa))})) : (7'h40)), 
parameter param171 = {((+param170) ? (^param170) : (~&((param170 ? (8'ha2) : param170) > {param170})))})
(y, clk, wire63, wire64, wire65, wire66);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire63;
  input wire [(5'h15):(1'h0)] wire64;
  input wire signed [(5'h14):(1'h0)] wire65;
  input wire [(4'he):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire169;
  wire signed [(3'h4):(1'h0)] wire168;
  wire [(4'h8):(1'h0)] wire167;
  wire [(3'h4):(1'h0)] wire166;
  wire signed [(4'ha):(1'h0)] wire165;
  wire [(5'h15):(1'h0)] wire164;
  wire signed [(5'h13):(1'h0)] wire163;
  wire [(5'h14):(1'h0)] wire162;
  wire signed [(2'h2):(1'h0)] wire161;
  wire signed [(4'h9):(1'h0)] wire160;
  wire [(4'hf):(1'h0)] wire159;
  wire signed [(3'h6):(1'h0)] wire145;
  wire [(3'h6):(1'h0)] wire143;
  wire [(5'h12):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire104;
  wire [(4'hf):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire102;
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  reg [(4'hd):(1'h0)] reg157 = (1'h0);
  reg signed [(4'he):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(5'h12):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg151 = (1'h0);
  reg [(2'h3):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(4'hb):(1'h0)] reg146 = (1'h0);
  assign y = {wire169,
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
                 wire145,
                 wire143,
                 wire105,
                 wire104,
                 wire67,
                 wire102,
                 reg158,
                 reg157,
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
                 (1'h0)};
  assign wire67 = {((wire66 ?
                          wire65[(4'hb):(2'h3)] : {wire64[(2'h2):(1'h1)],
                              $unsigned(wire63)}) == $unsigned($unsigned($unsigned(wire63)))),
                      {wire66[(4'h8):(3'h5)],
                          $unsigned({(!wire64), wire63[(3'h7):(2'h3)]})}};
  module68 #() modinst103 (.wire71(wire64), .wire72(wire67), .clk(clk), .y(wire102), .wire69(wire66), .wire73(wire63), .wire70(wire65));
  assign wire104 = (8'ha6);
  assign wire105 = (!wire66);
  module106 #() modinst144 (.clk(clk), .wire109(wire64), .wire107(wire67), .wire108(wire105), .wire110(wire104), .y(wire143));
  assign wire145 = $signed(wire102[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg146 <= (8'hbb);
      if (($signed(({{wire102, (8'hb7)}} ?
              (-(wire102 >= (8'hb3))) : (+$unsigned(wire65)))) ?
          wire66 : ({(~|(~^wire67)), (~&$signed(wire105))} ?
              (8'ha8) : wire102[(1'h0):(1'h0)])))
        begin
          reg147 <= ($unsigned(($unsigned(wire63) + $unsigned($signed(wire64)))) ?
              ($signed((8'hb4)) >= {({reg146} ?
                      (!wire63) : (wire67 ? wire63 : wire66)),
                  wire105}) : wire102[(3'h6):(3'h5)]);
          if (wire105)
            begin
              reg148 <= {$unsigned($signed(wire143[(3'h6):(3'h6)])),
                  wire66[(3'h7):(2'h3)]};
              reg149 <= ($signed((((8'hab) ^~ $signed(wire63)) < ((~^(8'hbd)) > (wire145 ~^ wire63)))) != (!reg147));
            end
          else
            begin
              reg148 <= $unsigned((^(|wire67[(4'he):(2'h3)])));
              reg149 <= wire64[(4'ha):(4'h8)];
            end
          reg150 <= (($unsigned((reg148 == (wire145 - reg147))) << $signed({(wire66 <<< (8'ha9)),
                  (wire104 <= wire64)})) ?
              wire64[(5'h13):(2'h2)] : (~|wire66[(4'hd):(3'h4)]));
          reg151 <= {$unsigned($signed($signed(((8'hb3) <<< (8'hbd)))))};
          if (($unsigned((8'hbf)) ?
              (~$signed(((wire64 ^ wire64) ~^ reg146))) : {reg150,
                  {wire64[(2'h2):(2'h2)]}}))
            begin
              reg152 <= {$signed(wire64[(5'h12):(3'h5)]), $unsigned((8'hb3))};
              reg153 <= wire66;
              reg154 <= ($signed((^($unsigned(wire143) ?
                      $unsigned(wire63) : $signed(wire65)))) ?
                  (wire65[(1'h0):(1'h0)] == (&reg148)) : (($signed(((8'h9e) ^~ (8'hae))) + $signed((wire67 & (8'ha7)))) >> (!((wire145 != reg152) <= (~reg152)))));
            end
          else
            begin
              reg152 <= (!(&(wire64 ?
                  ((+reg147) & $unsigned(wire102)) : (8'h9f))));
              reg153 <= reg152;
              reg154 <= {({wire145[(1'h1):(1'h0)]} ?
                      (wire105[(4'ha):(1'h1)] ^ $signed((wire66 ?
                          wire65 : reg150))) : (8'ha7)),
                  ($signed((&(reg146 ? wire66 : wire64))) ?
                      ($signed((8'hba)) ?
                          ($unsigned(wire105) ?
                              (wire102 ?
                                  reg151 : wire105) : reg152) : (reg147[(1'h0):(1'h0)] > ((8'hb4) ?
                              wire64 : reg150))) : wire64)};
              reg155 <= ($signed(({$unsigned(wire105)} ?
                  reg149[(4'ha):(1'h1)] : reg153[(4'hc):(3'h7)])) != (($unsigned($signed(reg149)) ?
                      $signed(wire105) : (8'hb3)) ?
                  ($unsigned((8'had)) ?
                      {(reg154 & reg148)} : wire66) : $unsigned($signed($signed(wire63)))));
              reg156 <= (reg147 - $signed(((~(+(7'h43))) ?
                  ((~reg150) || (reg152 | reg152)) : $unsigned(wire66[(4'hb):(4'h9)]))));
            end
        end
      else
        begin
          reg147 <= (8'ha0);
        end
      reg157 <= $signed($unsigned(reg155));
      reg158 <= ($unsigned($unsigned((^reg157[(2'h3):(2'h2)]))) <<< reg147[(2'h3):(2'h2)]);
    end
  assign wire159 = (((wire143[(2'h2):(1'h0)] >>> ({(7'h40),
                           wire145} | (reg148 && wire104))) & $unsigned({((8'ha4) ?
                               reg157 : reg155)})) ?
                       ((!{(reg157 >> reg151),
                           reg153}) > reg157[(1'h1):(1'h0)]) : $unsigned((-(reg153 ?
                           $signed(reg156) : (reg148 < wire67)))));
  assign wire160 = reg152;
  assign wire161 = reg152;
  assign wire162 = (+{(|$signed($unsigned(reg153))),
                       $signed(reg157[(4'hb):(3'h6)])});
  assign wire163 = {{$unsigned((|(reg150 ? reg156 : reg147)))}, wire64};
  assign wire164 = ($signed($unsigned((^~(+wire67)))) ~^ (~wire162));
  assign wire165 = ($signed($unsigned((-reg154[(2'h3):(2'h3)]))) >= ($signed(wire160) ?
                       wire104[(1'h1):(1'h0)] : reg154[(3'h4):(1'h1)]));
  assign wire166 = wire66;
  assign wire167 = (!reg151[(1'h1):(1'h1)]);
  assign wire168 = ({({reg158, wire145[(3'h5):(3'h4)]} | (reg147 ?
                           (|wire161) : (~wire63))),
                       wire162} < ($unsigned(wire105) << wire145));
  assign wire169 = (+{$signed(({wire105} >> $unsigned((8'hbb))))});
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire53,
                 wire13,
                 wire12,
                 wire11,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire11 = $unsigned((|(wire10 && (!$signed(wire6)))));
  assign wire12 = wire9;
  assign wire13 = $unsigned(wire9[(4'hb):(3'h7)]);
  module14 #() modinst54 (.y(wire53), .wire16(wire12), .wire15(wire8), .wire17(wire11), .clk(clk), .wire18(wire13));
  always
    @(posedge clk) begin
      if ((wire12 ? wire12[(1'h1):(1'h1)] : wire53))
        begin
          reg55 <= {(~|(((wire7 <<< wire7) ^~ (wire12 ?
                  wire10 : (8'hba))) * (|$signed((8'haf))))),
              ($unsigned(wire7[(3'h5):(2'h2)]) <<< (8'hba))};
        end
      else
        begin
          reg55 <= wire9;
          reg56 <= $unsigned(wire12);
        end
    end
  assign wire57 = wire12;
  assign wire58 = $signed((&wire10));
  assign wire59 = ((wire9 <<< $unsigned($signed($unsigned(wire8)))) == $signed({reg56[(2'h3):(2'h2)]}));
endmodule

module module14
#(parameter param51 = (^~(((!((8'ha5) ? (7'h42) : (8'ha6))) ? (((8'ha0) ? (7'h42) : (8'hb5)) || ((8'hba) ? (8'hb4) : (7'h44))) : (~&(7'h41))) * ((!((8'ha5) <<< (8'hb8))) ? ((~&(7'h41)) ? (&(7'h41)) : ((8'hb2) > (8'haf))) : (^((8'hbc) ? (7'h44) : (8'hb1)))))), 
parameter param52 = param51)
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire signed [(4'he):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire28,
                 wire27,
                 wire21,
                 wire20,
                 wire19,
                 reg46,
                 reg45,
                 reg44,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = (({(&(~&wire16))} && $unsigned({(wire15 >>> wire15)})) * {{$signed(((8'hb4) ?
                              wire16 : wire17))},
                      wire18});
  assign wire20 = (wire16[(2'h3):(2'h2)] * (8'ha0));
  assign wire21 = wire16[(4'he):(4'h9)];
  always
    @(posedge clk) begin
      reg22 <= wire17[(3'h6):(3'h6)];
      reg23 <= (wire21[(2'h2):(1'h1)] ?
          (~&({((8'h9c) && wire19)} ?
              (|{wire17,
                  wire18}) : {(7'h42)})) : $unsigned(wire15[(3'h4):(2'h3)]));
      reg24 <= wire19[(1'h1):(1'h0)];
      reg25 <= (^~(8'hbf));
      reg26 <= (reg23 ~^ {{((reg23 ? wire16 : wire21) | (wire20 ?
                  (8'hae) : reg25)),
              reg25}});
    end
  assign wire27 = (|$signed($signed(($unsigned(wire17) ?
                      $signed(wire15) : $signed(reg22)))));
  assign wire28 = (8'ha8);
  always
    @(posedge clk) begin
      if (reg25[(2'h2):(1'h1)])
        begin
          reg29 <= (wire18 != (8'ha6));
          reg30 <= (reg23 ?
              (wire16[(4'hd):(3'h7)] ?
                  (reg25[(3'h6):(1'h0)] == reg22) : (!{$unsigned(reg26)})) : (reg22[(1'h0):(1'h0)] <<< wire27[(3'h4):(3'h4)]));
        end
      else
        begin
          if ((!{{($signed(wire20) | (^~(7'h40))),
                  $signed((reg24 ? wire21 : wire20))},
              (wire20 ?
                  $signed((wire16 ?
                      wire20 : wire15)) : $signed($unsigned(wire21)))}))
            begin
              reg29 <= {{($unsigned((+reg29)) ?
                          $signed(reg25[(3'h4):(1'h1)]) : ($unsigned(wire16) ?
                              (~&reg26) : $unsigned(reg24)))}};
              reg30 <= $signed(wire15[(2'h2):(1'h1)]);
              reg31 <= (~$signed((-({(8'h9f), wire20} ?
                  $unsigned(wire28) : reg30[(5'h12):(4'ha)]))));
              reg32 <= wire18[(4'hf):(3'h5)];
            end
          else
            begin
              reg29 <= {((+$unsigned($unsigned((8'haf)))) > (((reg26 < reg24) <<< $signed(reg32)) > (~&(!reg23)))),
                  $signed($unsigned($signed($unsigned(wire28))))};
              reg30 <= $signed($signed($signed((~(&(8'hb6))))));
              reg31 <= $unsigned($unsigned($unsigned((^~$signed(wire16)))));
            end
          reg33 <= reg24[(1'h0):(1'h0)];
          reg34 <= $signed(((((^(8'haf)) ?
              $unsigned(reg29) : {wire28,
                  reg23}) ~^ ($unsigned(reg22) <<< (reg31 ?
              reg31 : (7'h44)))) * ((&(wire16 ?
              wire21 : wire15)) == $unsigned($unsigned(wire15)))));
          reg35 <= $unsigned(((($signed(wire15) ? wire19 : (-reg29)) ?
              ((reg29 ? wire17 : wire16) ?
                  (reg32 || (8'h9f)) : $unsigned(wire20)) : (8'h9f)) ~^ (wire28 ~^ (reg26[(1'h1):(1'h1)] ?
              reg22[(1'h1):(1'h0)] : {wire17, wire21}))));
        end
    end
  assign wire36 = reg24;
  assign wire37 = $signed(((7'h40) < ($signed((wire36 <<< (8'ha6))) ?
                      wire21[(4'hb):(4'hb)] : reg35[(2'h3):(2'h3)])));
  assign wire38 = reg22;
  assign wire39 = (reg29 > (reg34[(3'h4):(1'h1)] >> (((wire21 ?
                          reg24 : (7'h40)) < (reg35 ? reg23 : (8'ha6))) ?
                      ((reg35 >> wire21) >= reg35[(3'h4):(1'h1)]) : $signed($signed(wire18)))));
  assign wire40 = wire16;
  assign wire41 = $unsigned(reg22[(1'h0):(1'h0)]);
  assign wire42 = ($unsigned((reg34[(2'h2):(2'h2)] ?
                      (+$unsigned(wire18)) : $unsigned(wire18))) + ((wire28 ?
                          $signed((^wire18)) : (!wire15[(3'h4):(2'h3)])) ?
                      ($unsigned($unsigned((8'hb8))) ?
                          (~$unsigned(wire18)) : ((~^wire17) << (reg33 >> reg23))) : reg31[(3'h6):(3'h6)]));
  assign wire43 = (~|(^$unsigned(((wire27 ?
                      reg34 : reg33) == reg32[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      reg44 <= (^~(wire39[(2'h2):(1'h0)] ?
          $unsigned({(wire28 && wire37)}) : wire40[(4'hd):(4'hd)]));
      reg45 <= {wire15[(4'h8):(3'h7)],
          $unsigned($signed(({reg26, wire17} ?
              $unsigned(reg22) : ((7'h41) ? (7'h43) : wire43))))};
      reg46 <= (~^$signed({$signed($signed(wire39))}));
    end
  assign wire47 = (((wire28 ?
                      wire21 : wire15[(4'h9):(2'h2)]) || reg34) ^~ reg46);
  assign wire48 = ({$signed(reg32[(4'hb):(3'h5)]),
                          ((&(wire20 ? reg46 : wire43)) || $signed(reg46))} ?
                      wire17[(4'ha):(2'h3)] : (reg46 ?
                          ($unsigned($signed(reg26)) ?
                              reg32 : {(wire38 ? (8'ha1) : reg34),
                                  (reg31 < (8'ha5))}) : $signed((8'hb2))));
  assign wire49 = (-$unsigned(wire21));
  assign wire50 = ((wire17 ?
                      (|$unsigned((reg31 ?
                          (8'ha2) : wire15))) : wire43) && $unsigned(($signed((wire41 ^~ wire42)) ?
                      $unsigned((wire47 >>> reg45)) : (~$unsigned(wire19)))));
endmodule

module module106  (y, clk, wire110, wire109, wire108, wire107);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire110;
  input wire signed [(2'h3):(1'h0)] wire109;
  input wire [(4'h8):(1'h0)] wire108;
  input wire signed [(3'h7):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire124;
  wire signed [(4'hd):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire122;
  wire [(4'h8):(1'h0)] wire121;
  wire [(3'h4):(1'h0)] wire120;
  wire [(4'ha):(1'h0)] wire119;
  wire signed [(5'h12):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire116;
  wire [(2'h2):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire111;
  reg signed [(3'h7):(1'h0)] reg142 = (1'h0);
  reg [(4'hb):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg134 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg132 = (1'h0);
  reg [(4'h9):(1'h0)] reg131 = (1'h0);
  reg [(5'h11):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg125 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
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
                 (1'h0)};
  assign wire111 = $unsigned($unsigned($signed(($signed(wire108) || wire107[(3'h7):(1'h0)]))));
  assign wire112 = ({wire109} == wire111[(1'h1):(1'h0)]);
  assign wire113 = (({$signed(wire107),
                           $signed({wire107})} || (&wire107[(3'h7):(3'h4)])) ?
                       wire110[(4'hb):(4'h9)] : wire112);
  assign wire114 = $signed(wire107);
  assign wire115 = $unsigned({$signed(wire112[(4'h8):(2'h2)])});
  assign wire116 = {wire108};
  assign wire117 = (|(|((~(wire114 ?
                       wire107 : wire110)) ^ wire110[(3'h5):(1'h0)])));
  assign wire118 = wire117;
  assign wire119 = wire112[(3'h7):(3'h7)];
  assign wire120 = ($unsigned((($signed(wire109) ?
                               (~|wire117) : wire111[(2'h2):(1'h0)]) ?
                           {(wire112 - wire115)} : (wire110 ?
                               (|wire118) : wire111))) ?
                       wire118[(2'h3):(2'h2)] : wire113[(2'h3):(2'h3)]);
  assign wire121 = $unsigned((^(+wire114[(2'h2):(1'h1)])));
  assign wire122 = $unsigned((wire111[(1'h1):(1'h0)] || (-((wire118 ~^ (8'hb7)) ^~ (^~wire115)))));
  assign wire123 = {$signed(((wire116[(3'h7):(3'h5)] ?
                               wire115 : $unsigned(wire113)) ?
                           wire119[(3'h4):(2'h3)] : (wire111[(1'h1):(1'h0)] ~^ $unsigned(wire113))))};
  assign wire124 = (wire114 & wire117[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire111[(3'h5):(3'h5)])
        begin
          if ({(wire123 ^~ (wire124 ?
                  $unsigned($unsigned(wire109)) : ((wire113 > wire121) > $signed(wire109))))})
            begin
              reg125 <= {((&($signed((8'ha5)) ?
                      (~|(8'ha7)) : (wire123 >>> wire108))) < $signed($unsigned(wire122[(2'h2):(1'h1)])))};
              reg126 <= $signed(($unsigned((8'hb5)) >> $unsigned(wire107[(2'h2):(2'h2)])));
              reg127 <= (^wire109[(2'h3):(2'h2)]);
            end
          else
            begin
              reg125 <= (reg126[(2'h3):(1'h0)] ?
                  wire109 : ($signed(wire120) - (((wire108 ? wire116 : reg126) ?
                      $signed(wire117) : (~^(8'hb9))) ~^ {wire109})));
            end
          reg128 <= {wire118[(4'h8):(4'h8)]};
        end
      else
        begin
          reg125 <= wire121;
          if (((wire123 != (+$unsigned((wire111 ? wire114 : (8'hb3))))) ?
              wire119 : ($unsigned(wire111[(4'h8):(2'h3)]) >= ($unsigned(reg127[(1'h1):(1'h1)]) ?
                  (&wire119[(4'h8):(2'h3)]) : $signed((wire115 >= (8'hb7)))))))
            begin
              reg126 <= ((|reg125[(3'h6):(3'h6)]) ?
                  ((wire107[(1'h1):(1'h0)] ?
                      $unsigned(wire117) : {$unsigned((8'hb7)),
                          reg125[(2'h2):(1'h0)]}) + wire118) : $unsigned((~|(wire121[(2'h3):(1'h0)] ?
                      ((7'h41) >= wire119) : $signed(wire123)))));
              reg127 <= ((((reg125[(1'h0):(1'h0)] ?
                      (~wire119) : (wire121 ?
                          wire115 : wire113)) <= ($signed((8'hac)) ?
                      (~&(8'h9c)) : (wire111 ? (8'haf) : wire109))) ?
                  (-(wire111 ?
                      wire111[(2'h2):(1'h1)] : {wire123,
                          reg127})) : reg127[(1'h1):(1'h1)]) ^~ (($unsigned($unsigned(wire109)) ?
                      wire113[(2'h2):(2'h2)] : (wire119 ~^ $signed((7'h41)))) ?
                  $signed(((wire113 > wire109) != (wire121 | (8'hba)))) : {(~&$unsigned((8'hb1)))}));
              reg128 <= wire111[(3'h7):(3'h7)];
              reg129 <= wire109;
              reg130 <= (8'hb1);
            end
          else
            begin
              reg126 <= reg128;
              reg127 <= ($unsigned($signed(reg126[(4'h8):(4'h8)])) ^ $signed(wire123));
              reg128 <= ($signed(wire118) ?
                  ($signed($unsigned((wire108 | wire120))) ?
                      (($signed(wire124) ?
                          $unsigned(reg127) : wire124) || reg130) : reg130[(4'h8):(3'h6)]) : $unsigned(wire123[(4'h9):(3'h6)]));
              reg129 <= $signed(wire108[(2'h3):(2'h2)]);
              reg130 <= wire115[(1'h1):(1'h0)];
            end
          reg131 <= wire120;
          reg132 <= (wire109 ?
              (&wire107[(1'h1):(1'h1)]) : ($signed({$signed((7'h43))}) & (reg125 ^~ $unsigned(wire109[(1'h1):(1'h0)]))));
          reg133 <= wire124[(3'h4):(2'h2)];
        end
      reg134 <= (8'hb4);
      reg135 <= reg126[(2'h3):(2'h2)];
      if (reg135)
        begin
          if ((+(!$signed($unsigned($signed((8'ha5)))))))
            begin
              reg136 <= ($signed(wire110) + reg129[(1'h0):(1'h0)]);
              reg137 <= $signed((^((8'h9e) ?
                  wire110 : ((reg125 && wire110) ?
                      $signed(wire107) : (~wire116)))));
              reg138 <= (reg132 << ((8'hb9) <= {wire108[(3'h5):(1'h0)]}));
              reg139 <= wire115[(1'h0):(1'h0)];
            end
          else
            begin
              reg136 <= $unsigned($signed((($signed(wire108) & (^~reg133)) ?
                  $signed(((8'hb8) ? reg126 : wire117)) : ((wire116 ?
                          reg126 : wire122) ?
                      reg130[(4'ha):(1'h1)] : wire110[(4'he):(2'h2)]))));
              reg137 <= (((~wire122) ?
                  ((8'haf) ?
                      $signed($signed(reg136)) : ($unsigned(wire114) ^ $signed(wire114))) : ((~|$unsigned(reg127)) != $signed(wire120[(2'h2):(2'h2)]))) >= (~&(~|((reg131 + (8'h9d)) - $signed((8'ha2))))));
              reg138 <= ((~(^~($signed(wire109) ^~ {wire119}))) ?
                  reg128[(2'h2):(1'h0)] : {$unsigned($unsigned($signed(reg127))),
                      (~$signed((reg136 > wire115)))});
              reg139 <= reg136;
            end
          reg140 <= ($unsigned({({reg136, (8'hb8)} ?
                      (~|reg129) : ((8'ha2) <= reg131))}) ?
              reg127 : $signed(($signed($unsigned(reg130)) ?
                  reg130[(4'he):(2'h2)] : reg129[(1'h0):(1'h0)])));
        end
      else
        begin
          reg136 <= reg134;
          if ((wire121[(1'h0):(1'h0)] ?
              ({$unsigned((reg126 <<< reg138))} ?
                  wire119[(1'h0):(1'h0)] : $unsigned((((8'ha6) << wire114) | (reg126 != reg133)))) : reg135[(1'h0):(1'h0)]))
            begin
              reg137 <= $unsigned((^~reg132[(2'h3):(1'h0)]));
              reg138 <= reg126;
              reg139 <= $signed(((wire122[(1'h0):(1'h0)] != $signed($unsigned(reg136))) ?
                  $signed(reg128) : reg129));
            end
          else
            begin
              reg137 <= (^~(reg140[(1'h1):(1'h1)] <= $signed(reg133)));
              reg138 <= (&$unsigned((8'ha9)));
              reg139 <= {(wire122[(2'h2):(1'h1)] ?
                      reg139[(1'h1):(1'h1)] : $signed(reg130[(3'h6):(3'h4)])),
                  (((~(~reg140)) ?
                          ((reg131 ?
                              wire124 : reg136) + $signed(wire124)) : wire108) ?
                      (wire114 ?
                          ($unsigned(reg135) & (reg127 ^ wire112)) : ({wire122,
                              reg134} & $signed(wire111))) : (|reg127[(1'h1):(1'h0)]))};
              reg140 <= reg133[(4'hb):(4'h8)];
              reg141 <= reg133;
            end
          reg142 <= $unsigned((~|$signed($unsigned(wire121))));
        end
    end
endmodule

module module68  (y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire73;
  input wire signed [(4'hf):(1'h0)] wire72;
  input wire signed [(5'h15):(1'h0)] wire71;
  input wire signed [(4'ha):(1'h0)] wire70;
  input wire [(4'h9):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire signed [(4'ha):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire89;
  wire signed [(2'h3):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire74;
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire75,
                 wire74,
                 reg98,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire74 = $signed($unsigned(wire72));
  assign wire75 = (wire70[(4'ha):(4'ha)] < (^~((^~{wire72,
                      wire70}) ~^ (8'hb6))));
  always
    @(posedge clk) begin
      reg76 <= (|(-{{wire75}}));
      reg77 <= (~|wire73);
      reg78 <= (^~((wire70 ?
          ((!wire75) ?
              $signed((8'hb1)) : (!wire73)) : $signed((wire72 * (8'hab)))) ^ {(((7'h42) ?
              wire72 : wire69) || $unsigned(reg76))}));
      if (wire70)
        begin
          reg79 <= wire75[(3'h5):(3'h4)];
        end
      else
        begin
          reg79 <= $signed((^~{$unsigned($signed((8'ha4)))}));
          reg80 <= $signed(wire75[(1'h1):(1'h0)]);
          reg81 <= $signed(((+{$signed(wire69), (reg78 ? reg76 : wire75)}) ?
              (~^$signed(wire72)) : {wire70[(4'ha):(4'h8)]}));
        end
      reg82 <= ($unsigned($unsigned(reg79[(4'h8):(3'h4)])) <= {{reg81[(1'h0):(1'h0)]},
          (($signed(wire70) << {reg81}) <= (+(~wire69)))});
    end
  assign wire83 = wire74[(2'h3):(1'h0)];
  assign wire84 = reg81[(4'h8):(1'h0)];
  assign wire85 = (~|{(+$signed((~^reg79))), reg82[(3'h6):(1'h0)]});
  assign wire86 = wire69[(4'h9):(3'h4)];
  assign wire87 = wire70;
  assign wire88 = ($signed((+$signed(wire86))) | wire75[(1'h0):(1'h0)]);
  assign wire89 = {({$signed((reg77 ? wire71 : (8'hbf))),
                              (wire71[(5'h12):(3'h6)] ?
                                  (8'hb8) : $unsigned(wire73))} ?
                          ({$signed(wire85)} ?
                              (^~wire71) : $signed($unsigned(reg82))) : (~|reg81))};
  assign wire90 = (wire71[(5'h15):(1'h1)] || (^$unsigned({$signed(reg79),
                      wire83[(1'h0):(1'h0)]})));
  assign wire91 = $unsigned((({(8'h9c), (-wire88)} ?
                      (wire86 ?
                          wire75 : ((7'h40) ?
                              reg79 : wire89)) : wire71) ^~ $unsigned(wire86[(4'hc):(4'h8)])));
  assign wire92 = $signed((reg80 ?
                      ($signed(wire74) ?
                          $signed(((8'hbb) >= (8'h9e))) : (wire89 & (+wire71))) : $unsigned(((wire90 >> wire87) ?
                          (wire84 ^ wire69) : $signed(wire91)))));
  assign wire93 = ($signed(wire88) ^~ $signed({($signed(wire73) >= wire92[(2'h2):(1'h0)]),
                      wire89[(1'h1):(1'h0)]}));
  assign wire94 = wire70;
  assign wire95 = {reg78[(3'h4):(3'h4)]};
  assign wire96 = (~&$signed(reg79));
  assign wire97 = ($signed(((~wire85) ^ $unsigned(wire88))) ?
                      (+reg76[(3'h6):(2'h3)]) : wire86[(4'hd):(2'h3)]);
  always
    @(posedge clk) begin
      reg98 <= (($signed(reg78) ?
              {$signed(reg81[(3'h7):(3'h4)]), reg79} : (^~$signed(((8'hba) ?
                  wire73 : reg76)))) ?
          wire73[(2'h3):(2'h3)] : (|($unsigned((wire89 ? wire97 : reg80)) ?
              wire86[(5'h10):(4'hc)] : wire97)));
    end
  assign wire99 = reg79[(4'ha):(2'h2)];
  assign wire100 = ((^$signed({(~^reg82)})) ?
                       $signed({wire74}) : wire71[(5'h10):(4'hd)]);
  assign wire101 = reg82;
endmodule
