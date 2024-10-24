module top
#(parameter param228 = (((~^((~&(8'haa)) ? ((8'haa) > (8'hbc)) : {(8'ha6), (7'h43)})) <= {({(8'had), (8'had)} * ((8'ha5) <= (8'hb9))), (((8'ha2) ? (8'haa) : (8'hb9)) || ((8'hbe) >> (8'hb7)))}) ^ (((((8'h9f) | (8'hb4)) ? (+(7'h43)) : (&(8'hb2))) ? (!(~&(8'ha6))) : ({(8'ha2)} > ((8'had) ? (8'haf) : (8'ha0)))) + {{((8'ha4) << (8'hbc))}})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire227;
  wire signed [(3'h5):(1'h0)] wire220;
  wire signed [(5'h11):(1'h0)] wire179;
  wire signed [(5'h14):(1'h0)] wire178;
  wire [(4'hb):(1'h0)] wire177;
  wire [(3'h5):(1'h0)] wire175;
  wire signed [(5'h13):(1'h0)] wire174;
  wire signed [(4'hd):(1'h0)] wire172;
  wire signed [(3'h7):(1'h0)] wire181;
  wire signed [(5'h10):(1'h0)] wire182;
  wire [(4'he):(1'h0)] wire183;
  wire [(5'h12):(1'h0)] wire184;
  wire signed [(4'hf):(1'h0)] wire185;
  wire signed [(5'h14):(1'h0)] wire213;
  wire signed [(5'h14):(1'h0)] wire214;
  wire signed [(3'h7):(1'h0)] wire215;
  wire signed [(4'hf):(1'h0)] wire216;
  wire signed [(2'h3):(1'h0)] wire217;
  wire signed [(3'h4):(1'h0)] wire218;
  reg [(4'hd):(1'h0)] reg226 = (1'h0);
  reg [(4'hd):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg224 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg223 = (1'h0);
  reg signed [(4'he):(1'h0)] reg222 = (1'h0);
  reg [(4'h8):(1'h0)] reg221 = (1'h0);
  reg [(2'h2):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg186 = (1'h0);
  reg [(5'h13):(1'h0)] reg187 = (1'h0);
  reg [(2'h2):(1'h0)] reg188 = (1'h0);
  reg [(5'h12):(1'h0)] reg189 = (1'h0);
  reg [(5'h14):(1'h0)] reg190 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg194 = (1'h0);
  reg [(4'ha):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg196 = (1'h0);
  reg [(4'he):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg198 = (1'h0);
  reg signed [(4'he):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg200 = (1'h0);
  reg [(5'h11):(1'h0)] reg201 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg202 = (1'h0);
  reg [(4'he):(1'h0)] reg203 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg204 = (1'h0);
  reg [(4'hf):(1'h0)] reg205 = (1'h0);
  reg [(5'h12):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg207 = (1'h0);
  reg [(4'h9):(1'h0)] reg208 = (1'h0);
  reg [(5'h12):(1'h0)] reg209 = (1'h0);
  reg [(5'h10):(1'h0)] reg210 = (1'h0);
  reg [(5'h14):(1'h0)] reg211 = (1'h0);
  reg [(5'h11):(1'h0)] reg212 = (1'h0);
  assign y = {wire227,
                 wire220,
                 wire179,
                 wire178,
                 wire177,
                 wire175,
                 wire174,
                 wire172,
                 wire181,
                 wire182,
                 wire183,
                 wire184,
                 wire185,
                 wire213,
                 wire214,
                 wire215,
                 wire216,
                 wire217,
                 wire218,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg5,
                 reg4,
                 reg186,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 reg196,
                 reg197,
                 reg198,
                 reg199,
                 reg200,
                 reg201,
                 reg202,
                 reg203,
                 reg204,
                 reg205,
                 reg206,
                 reg207,
                 reg208,
                 reg209,
                 reg210,
                 reg211,
                 reg212,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (|$unsigned((wire3[(3'h6):(3'h4)] || $unsigned((wire1 <= wire2)))));
      reg5 <= ((($signed(wire0) ? (8'ha5) : {$signed((8'hb3))}) ?
              wire1 : $unsigned(((8'hb9) ? (8'hb5) : {wire0}))) ?
          ($unsigned($signed(reg4)) && (~|($signed(wire3) + (!reg4)))) : ($signed(wire3[(4'h8):(3'h7)]) ?
              $signed((((8'haf) ?
                  (8'ha1) : wire1) + (reg4 + wire3))) : $signed(wire3[(2'h3):(2'h2)])));
    end
  module6 #() modinst173 (wire172, clk, wire2, wire1, reg4, wire0, wire3);
  assign wire174 = (~|(~&(({reg5, wire172} ?
                       $signed(wire2) : wire172[(1'h0):(1'h0)]) & wire2)));
  module37 #() modinst176 (wire175, clk, wire172, wire3, wire1, wire0);
  assign wire177 = ($signed((wire3 ?
                       wire175 : wire2)) + {wire172[(1'h1):(1'h0)]});
  assign wire178 = (($unsigned(($unsigned((8'h9f)) ?
                           (+wire1) : (wire177 ?
                               wire2 : wire1))) ^ wire175[(1'h0):(1'h0)]) ?
                       $unsigned(((wire174[(3'h5):(2'h3)] * (+(8'hbb))) <<< ($signed(wire2) <<< $unsigned(wire0)))) : $signed($signed((wire177 ?
                           (reg5 | wire177) : (^wire2)))));
  module12 #() modinst180 (wire179, clk, wire0, reg4, wire174, wire1, reg5);
  assign wire181 = reg4;
  assign wire182 = {$signed(({{wire0, wire178}, reg5} >> $unsigned((wire175 ?
                           wire2 : reg5)))),
                       {(wire174 ?
                               reg5[(2'h2):(2'h2)] : (^~((8'haa) ?
                                   wire1 : wire175)))}};
  assign wire183 = $signed((8'hb7));
  assign wire184 = (&reg5);
  assign wire185 = ({wire177[(3'h5):(3'h5)], wire0} < reg4);
  always
    @(posedge clk) begin
      if (((8'hb5) - wire182[(2'h2):(1'h0)]))
        begin
          reg186 <= ((~^(8'had)) ?
              (wire178 ?
                  $unsigned(((8'h9c) <= (wire177 ~^ reg4))) : {(~$signed(wire184)),
                      (^~$signed(wire2))}) : ((8'hb7) <= $signed(wire172[(4'hc):(2'h3)])));
          reg187 <= $unsigned(($signed((^~$unsigned(wire177))) ^ ($signed(((8'haa) ?
              (8'ha0) : wire2)) + {wire181})));
          reg188 <= wire182;
          reg189 <= wire178;
        end
      else
        begin
          reg186 <= $signed($signed((((8'ha4) <= $unsigned(wire1)) ?
              (wire183 ? $unsigned(reg4) : {reg4}) : wire1[(5'h10):(4'hb)])));
          reg187 <= (wire172[(4'h9):(3'h5)] || (reg5 ^ wire183));
          reg188 <= wire174[(5'h10):(4'hc)];
          reg189 <= {wire2};
        end
      if ((((~^wire182) == (wire2 ?
          reg5[(2'h2):(1'h0)] : (^~{wire179,
              reg189}))) * {($signed((reg189 - wire185)) + (wire177[(4'h9):(3'h7)] - (wire182 >> wire184))),
          $signed((wire1 ? wire172[(4'hd):(2'h2)] : wire3[(4'hc):(2'h3)]))}))
        begin
          if (reg187)
            begin
              reg190 <= wire179[(5'h11):(3'h4)];
              reg191 <= wire183[(4'hd):(1'h1)];
              reg192 <= $unsigned(wire172);
              reg193 <= $signed($signed(((reg186[(1'h0):(1'h0)] - {wire1,
                  reg191}) <= wire179[(3'h6):(2'h3)])));
              reg194 <= {wire185[(1'h1):(1'h1)], wire0[(4'h9):(3'h4)]};
            end
          else
            begin
              reg190 <= reg193;
              reg191 <= $signed(($unsigned($signed((8'haa))) ?
                  wire184[(4'ha):(3'h7)] : $signed(($unsigned(wire181) ?
                      $unsigned(wire0) : $signed(wire185)))));
              reg192 <= (~&$unsigned(wire172));
              reg193 <= wire175;
              reg194 <= $unsigned(wire3);
            end
          reg195 <= $signed((^$signed({wire1[(3'h7):(2'h3)],
              (wire181 ? (8'hb8) : wire3)})));
          reg196 <= wire3[(4'hf):(4'hb)];
          reg197 <= ($signed((($unsigned(wire172) ?
                      (reg187 ? (8'ha9) : wire185) : {wire2}) ?
                  $signed($signed((8'hb8))) : $signed((~reg189)))) ?
              $unsigned(wire1[(4'hf):(2'h2)]) : (-wire172[(4'h8):(3'h6)]));
        end
      else
        begin
          reg190 <= reg187;
          reg191 <= reg5;
          reg192 <= $signed({$unsigned(((&reg192) >>> (reg197 == (8'ha3))))});
        end
      reg198 <= {(((~|wire185[(4'hb):(1'h0)]) + (^~(&reg197))) || (7'h41))};
      reg199 <= {wire2[(3'h7):(1'h0)]};
      if (reg4)
        begin
          reg200 <= $signed($unsigned((~&(&((8'hbb) ? reg195 : wire184)))));
          if ($signed($unsigned(((~|(~wire185)) + reg188[(2'h2):(1'h0)]))))
            begin
              reg201 <= $unsigned(reg200);
              reg202 <= wire2[(4'h8):(3'h7)];
              reg203 <= $unsigned((7'h40));
            end
          else
            begin
              reg201 <= (8'ha6);
              reg202 <= $signed(($signed(reg187) > $unsigned(wire183[(4'he):(3'h7)])));
              reg203 <= reg201[(5'h11):(4'hb)];
              reg204 <= {(({(reg198 - wire1), reg197} ?
                      $signed($unsigned(reg198)) : (!((7'h40) == wire1))) & reg201[(4'hc):(4'hb)])};
              reg205 <= {$signed(reg4[(3'h4):(2'h2)])};
            end
          reg206 <= ($signed($unsigned(((wire2 ? reg201 : (8'hba)) ?
              $unsigned(reg191) : reg192))) >>> (($unsigned({reg186}) >> {$signed(reg195),
                  (reg202 ? wire0 : wire0)}) ?
              reg191 : wire177[(3'h7):(2'h3)]));
          if (reg198[(3'h6):(3'h5)])
            begin
              reg207 <= (|{(wire184[(4'he):(4'hd)] ?
                      $unsigned(wire3) : reg200[(3'h6):(1'h1)])});
            end
          else
            begin
              reg207 <= reg187;
              reg208 <= ({(reg207[(2'h3):(1'h0)] | $signed((wire3 ?
                      wire177 : (8'hb2)))),
                  (reg191[(1'h1):(1'h0)] ?
                      reg190 : $signed($unsigned((8'h9d))))} <= (((~|(reg194 ?
                      wire177 : (8'ha1))) < ((~|reg5) ^ $signed((8'ha4)))) ?
                  $signed(({(7'h44), wire172} ?
                      (reg4 ? wire3 : (7'h40)) : reg192)) : $unsigned(({wire181,
                          (8'ha4)} ?
                      reg192 : (wire184 - reg191)))));
              reg209 <= $signed({$signed((wire178 ?
                      (reg195 ? (8'h9d) : wire185) : $unsigned((8'h9d))))});
              reg210 <= wire184[(3'h7):(2'h3)];
              reg211 <= reg198;
            end
          reg212 <= $unsigned(($signed($unsigned(wire174)) ?
              $unsigned($unsigned((reg195 ?
                  wire182 : reg200))) : (|($unsigned(reg207) != ((8'hb2) ?
                  reg201 : wire174)))));
        end
      else
        begin
          if ((reg192 ?
              reg201[(4'hc):(3'h6)] : $unsigned((reg198 << reg195[(3'h6):(2'h2)]))))
            begin
              reg200 <= $signed((reg188 + {(reg192[(3'h7):(2'h3)] ?
                      reg188 : (~wire172)),
                  $unsigned(wire177)}));
              reg201 <= ((^reg198[(5'h11):(2'h2)]) >> (8'hb5));
            end
          else
            begin
              reg200 <= wire181[(3'h7):(2'h2)];
              reg201 <= $unsigned($unsigned((7'h40)));
              reg202 <= reg212[(5'h11):(3'h6)];
              reg203 <= $signed($signed($signed($unsigned($signed(reg193)))));
              reg204 <= $signed(($signed((8'hbd)) ?
                  wire178 : $unsigned({reg187[(5'h11):(3'h5)]})));
            end
          reg205 <= (&wire175[(1'h1):(1'h1)]);
          reg206 <= reg190[(4'h8):(1'h1)];
          reg207 <= (~^wire3);
          reg208 <= reg198;
        end
    end
  assign wire213 = (^$unsigned($unsigned((&(reg212 ? reg193 : wire184)))));
  assign wire214 = (8'ha4);
  assign wire215 = (~wire177[(2'h2):(1'h0)]);
  assign wire216 = $unsigned((&(((reg202 >= (8'ha0)) < (reg201 ?
                           (8'hbc) : wire179)) ?
                       $signed((wire175 ?
                           reg198 : reg192)) : ((+reg196) ^ (reg5 || reg192)))));
  assign wire217 = (^{($unsigned($unsigned((8'haa))) == $unsigned((reg186 ?
                           wire185 : wire213))),
                       $unsigned($unsigned(wire172))});
  module101 #() modinst219 (.wire102(reg208), .wire103(reg211), .wire105(reg204), .wire104(wire213), .clk(clk), .y(wire218));
  assign wire220 = (8'had);
  always
    @(posedge clk) begin
      reg221 <= (!(wire174 ? $unsigned(wire181[(1'h1):(1'h1)]) : reg193));
    end
  always
    @(posedge clk) begin
      reg222 <= (&(^wire178));
      reg223 <= (!reg198);
      reg224 <= ((8'hb5) == (reg212 ? reg195[(3'h7):(3'h5)] : (&wire2)));
      reg225 <= (reg193[(4'hb):(3'h4)] >>> $unsigned((wire215 ?
          wire184 : $signed((|(8'hab))))));
      reg226 <= (-reg200[(4'he):(4'h8)]);
    end
  assign wire227 = wire177;
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire171;
  wire [(4'ha):(1'h0)] wire170;
  wire signed [(5'h12):(1'h0)] wire169;
  wire [(5'h15):(1'h0)] wire168;
  wire [(5'h10):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire98;
  wire signed [(4'hb):(1'h0)] wire99;
  wire signed [(4'ha):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire137;
  wire [(3'h6):(1'h0)] wire138;
  wire [(2'h2):(1'h0)] wire139;
  wire signed [(3'h4):(1'h0)] wire140;
  wire [(2'h2):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire142;
  wire signed [(5'h15):(1'h0)] wire143;
  wire signed [(2'h3):(1'h0)] wire144;
  wire signed [(5'h15):(1'h0)] wire166;
  assign y = {wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire34,
                 wire36,
                 wire96,
                 wire98,
                 wire99,
                 wire100,
                 wire135,
                 wire137,
                 wire138,
                 wire139,
                 wire140,
                 wire141,
                 wire142,
                 wire143,
                 wire144,
                 wire166,
                 (1'h0)};
  module12 #() modinst35 (wire34, clk, wire9, wire7, wire8, wire11, wire10);
  assign wire36 = $unsigned({($unsigned((^~wire8)) ?
                          (~wire10[(4'hb):(4'ha)]) : (8'hbf)),
                      (wire7 ?
                          wire8[(5'h12):(1'h1)] : ((wire8 ? (7'h43) : wire34) ?
                              (~&wire7) : $unsigned(wire8)))});
  module37 #() modinst97 (wire96, clk, wire8, wire34, wire10, wire9);
  assign wire98 = wire96;
  assign wire99 = wire7[(3'h7):(3'h5)];
  assign wire100 = (wire10[(2'h3):(2'h2)] ?
                       wire11[(3'h5):(1'h1)] : $signed((~|$signed(wire9))));
  module101 #() modinst136 (wire135, clk, wire99, wire10, wire96, wire98);
  assign wire137 = {(($unsigned((wire99 & wire135)) <= {$signed(wire96)}) ?
                           wire100 : ($signed($signed(wire36)) >= wire100[(2'h2):(1'h1)])),
                       wire9[(4'hf):(4'he)]};
  assign wire138 = {wire100, wire100};
  assign wire139 = $unsigned((((8'ha3) || {$unsigned(wire34)}) ?
                       wire137[(4'hd):(3'h4)] : wire137[(2'h3):(1'h0)]));
  assign wire140 = $unsigned($signed((~(~&wire137[(5'h14):(5'h13)]))));
  assign wire141 = ($unsigned($signed(wire10)) == {(8'hab),
                       {$unsigned($signed(wire140)),
                           (wire8[(5'h10):(4'h9)] ?
                               $signed(wire8) : $signed(wire36))}});
  assign wire142 = $signed((((wire141[(1'h0):(1'h0)] ?
                       wire34 : wire8[(4'h9):(3'h7)]) & ((^~wire8) ?
                       $unsigned(wire9) : wire8[(5'h14):(3'h4)])) ~^ wire135));
  assign wire143 = wire139[(1'h0):(1'h0)];
  assign wire144 = $unsigned($signed(wire139));
  module145 #() modinst167 (.wire150(wire8), .wire146(wire10), .wire147(wire11), .wire149(wire34), .y(wire166), .clk(clk), .wire148(wire36));
  assign wire168 = wire99;
  assign wire169 = $unsigned((wire98 || (~&(~&(wire138 ? wire98 : wire166)))));
  assign wire170 = {($signed($unsigned(wire166)) >>> (wire169 ?
                           ((wire137 ?
                               wire11 : (8'h9c)) < $unsigned(wire11)) : {$signed(wire36),
                               (7'h44)}))};
  assign wire171 = wire7[(4'he):(3'h6)];
endmodule

module module145  (y, clk, wire150, wire149, wire148, wire147, wire146);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire150;
  input wire signed [(2'h3):(1'h0)] wire149;
  input wire signed [(5'h12):(1'h0)] wire148;
  input wire signed [(4'hc):(1'h0)] wire147;
  input wire signed [(2'h3):(1'h0)] wire146;
  wire signed [(4'hb):(1'h0)] wire163;
  wire signed [(5'h11):(1'h0)] wire160;
  wire signed [(5'h15):(1'h0)] wire159;
  wire [(3'h7):(1'h0)] wire158;
  wire [(4'h9):(1'h0)] wire157;
  wire signed [(4'h9):(1'h0)] wire156;
  wire [(3'h5):(1'h0)] wire155;
  wire signed [(4'hd):(1'h0)] wire154;
  wire [(4'h8):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire152;
  wire [(3'h6):(1'h0)] wire151;
  reg [(2'h2):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg164 = (1'h0);
  reg [(2'h3):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg161 = (1'h0);
  assign y = {wire163,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 reg165,
                 reg164,
                 reg162,
                 reg161,
                 (1'h0)};
  assign wire151 = $signed($signed($signed(({wire148} <= $unsigned(wire149)))));
  assign wire152 = wire149[(1'h1):(1'h0)];
  assign wire153 = $unsigned((8'hb5));
  assign wire154 = (^(|(&wire150)));
  assign wire155 = (($unsigned((~wire148[(2'h3):(2'h3)])) ?
                           (((~&wire153) ? (^wire149) : (+wire147)) ?
                               (8'hb3) : wire149) : (^(wire146 + (wire149 != wire154)))) ?
                       ($signed($unsigned((+wire152))) || {(8'h9d)}) : (~wire147[(2'h3):(2'h3)]));
  assign wire156 = (wire147 >> wire155[(1'h0):(1'h0)]);
  assign wire157 = wire152[(3'h6):(3'h5)];
  assign wire158 = (wire152 ?
                       $signed(({(wire150 ? wire148 : wire150),
                               $unsigned(wire149)} ?
                           (wire155 ?
                               {(8'hba), wire153} : (wire150 ?
                                   wire149 : (8'ha1))) : wire153[(3'h6):(3'h4)])) : wire154);
  assign wire159 = wire156;
  assign wire160 = $signed(((-$signed($signed((8'ha0)))) ?
                       $unsigned($signed($signed(wire150))) : wire155[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg161 <= (((!(8'ha7)) ?
              $signed($signed(wire147)) : (!((wire158 ?
                  wire153 : wire148) == (wire151 ? wire154 : wire151)))) ?
          wire158[(3'h4):(1'h1)] : $signed((|wire151)));
      reg162 <= wire151[(3'h5):(1'h1)];
    end
  assign wire163 = ($signed((-(wire154[(3'h7):(3'h4)] <= $unsigned((8'h9f))))) >> (&$unsigned(((reg161 ?
                       wire153 : wire158) && $signed(wire160)))));
  always
    @(posedge clk) begin
      reg164 <= $unsigned($unsigned($signed((+$unsigned(wire156)))));
      reg165 <= ((|wire147) ?
          $unsigned(wire154[(4'hc):(1'h0)]) : (~|wire155[(1'h0):(1'h0)]));
    end
endmodule

module module101
#(parameter param133 = ((8'ha6) ? ((^(-((8'hab) ? (8'hbd) : (7'h43)))) ? (((~|(8'hbe)) || (&(8'ha7))) + {{(8'hbb), (8'hba)}}) : ((((8'hb8) >= (8'ha9)) >> ((8'hb7) ? (8'ha8) : (8'h9f))) ? (~|(&(8'h9f))) : ({(8'hb0)} | (~(8'hb7))))) : ({(((8'ha7) ? (8'hba) : (8'ha0)) >> ((8'hbd) - (8'hb5)))} || (~^(+((7'h42) ? (8'hb5) : (8'hb3)))))), 
parameter param134 = (^~param133))
(y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire105;
  input wire signed [(3'h6):(1'h0)] wire104;
  input wire signed [(3'h5):(1'h0)] wire103;
  input wire [(4'h9):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire132;
  wire signed [(4'h8):(1'h0)] wire131;
  wire signed [(5'h15):(1'h0)] wire130;
  wire signed [(4'hf):(1'h0)] wire129;
  wire signed [(4'hf):(1'h0)] wire128;
  wire signed [(5'h15):(1'h0)] wire127;
  wire [(4'hd):(1'h0)] wire126;
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg123 = (1'h0);
  reg signed [(4'he):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg106 <= ((^~wire102[(1'h0):(1'h0)]) ?
          (^~(wire102[(1'h1):(1'h1)] ?
              {((8'ha9) ?
                      wire104 : wire102)} : $unsigned($unsigned(wire102)))) : $signed($signed($signed((&(8'h9c))))));
      reg107 <= wire104[(2'h2):(2'h2)];
      reg108 <= $signed($signed({(reg106 ?
              $signed(reg107) : wire102[(2'h2):(2'h2)])}));
    end
  always
    @(posedge clk) begin
      reg109 <= $unsigned($signed(wire105));
      if ($unsigned(($signed(reg107[(2'h2):(2'h2)]) || ($signed((7'h44)) | ($unsigned(wire104) >= {(8'h9d)})))))
        begin
          reg110 <= (+(^(~^{wire104[(1'h0):(1'h0)]})));
          reg111 <= $unsigned(((reg107 << (^~$unsigned((8'h9c)))) != (reg106[(3'h6):(2'h2)] ?
              $signed({reg106, wire103}) : (^~(+wire105)))));
        end
      else
        begin
          reg110 <= ({(reg107 ?
                  reg110[(4'h8):(3'h5)] : ((^~reg111) ^ reg108[(2'h3):(1'h1)])),
              ($signed({(8'hae)}) & wire104[(1'h0):(1'h0)])} | (^(~|$signed($signed(reg111)))));
          reg111 <= (($signed(wire103) ^~ wire104[(3'h4):(3'h4)]) ?
              $unsigned(($unsigned((wire102 ?
                  wire103 : wire103)) * wire103)) : {(reg109 ^ (((7'h43) && reg107) ~^ $unsigned((8'ha2))))});
          reg112 <= $unsigned({wire103});
          if (wire102)
            begin
              reg113 <= (8'hab);
              reg114 <= {reg106};
              reg115 <= $signed($signed({$signed((~^(8'hae)))}));
              reg116 <= reg114;
              reg117 <= (~&($unsigned((!{reg107, (8'ha9)})) ?
                  {$signed((wire103 >>> reg107))} : (+wire104[(3'h4):(2'h2)])));
            end
          else
            begin
              reg113 <= reg109;
              reg114 <= $signed(reg117[(1'h0):(1'h0)]);
              reg115 <= {{(~&({wire103} ? reg107 : (reg113 > wire105)))}};
            end
          reg118 <= ($unsigned(wire105) & (~|({$signed(reg113)} ?
              reg117 : reg108[(1'h1):(1'h1)])));
        end
    end
  always
    @(posedge clk) begin
      reg119 <= (~&((+reg112) ^~ reg112[(1'h1):(1'h0)]));
      if ($signed($unsigned(reg106[(4'h9):(3'h6)])))
        begin
          reg120 <= reg115;
        end
      else
        begin
          reg120 <= (!$unsigned($unsigned((~|(reg116 ^ reg117)))));
          if ((8'ha7))
            begin
              reg121 <= reg112[(1'h0):(1'h0)];
              reg122 <= wire102;
            end
          else
            begin
              reg121 <= ({wire102,
                  (($unsigned(reg120) ?
                          $signed(reg108) : (reg118 ? wire105 : (8'hb0))) ?
                      (7'h41) : ((~reg108) <<< reg120[(3'h5):(2'h3)]))} >>> (8'hb2));
              reg122 <= (reg119 >>> reg114);
            end
          reg123 <= reg121[(3'h7):(3'h5)];
        end
      reg124 <= $signed((($unsigned({reg110,
          (8'h9e)}) < reg111[(1'h1):(1'h0)]) == {reg113,
          $unsigned({reg121, reg117})}));
      reg125 <= reg110[(3'h5):(1'h0)];
    end
  assign wire126 = (reg111[(3'h5):(2'h3)] ?
                       reg116[(1'h1):(1'h0)] : ($unsigned({reg123,
                               $signed(reg109)}) ?
                           (-$signed(wire102[(4'h9):(1'h0)])) : wire105[(3'h4):(1'h1)]));
  assign wire127 = (~|(~{reg111}));
  assign wire128 = reg123[(4'he):(4'he)];
  assign wire129 = $unsigned({reg119[(5'h12):(1'h0)]});
  assign wire130 = reg110;
  assign wire131 = {wire127, wire104[(1'h0):(1'h0)]};
  assign wire132 = {$signed(($signed($unsigned((8'hb8))) & ((wire102 > reg113) - reg113))),
                       (8'hbd)};
endmodule

module module37  (y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h2ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire41;
  input wire [(5'h10):(1'h0)] wire40;
  input wire signed [(4'h9):(1'h0)] wire39;
  input wire [(2'h2):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  wire [(3'h7):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire84;
  wire [(5'h13):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  assign y = {wire95,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire68,
                 wire67,
                 wire63,
                 wire62,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
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
                 reg66,
                 reg65,
                 reg64,
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
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire42 = {$unsigned((wire39[(3'h4):(3'h4)] ?
                          ((8'ha6) ?
                              {wire39} : $signed(wire38)) : (wire38[(1'h0):(1'h0)] <= $unsigned(wire38)))),
                      (wire41 * (((wire38 ? wire38 : wire39) ?
                          (wire41 ?
                              wire41 : wire41) : wire38) && (wire40 > (8'ha6))))};
  assign wire43 = ((!wire39) >= $unsigned(wire40[(3'h4):(2'h2)]));
  assign wire44 = (($unsigned((^~(8'had))) && $signed(wire39[(3'h6):(2'h3)])) ?
                      ((~|wire43) + $unsigned(((wire41 ? wire40 : wire40) ?
                          (wire39 ?
                              wire38 : (8'hb5)) : wire43[(4'h8):(3'h6)]))) : $signed((wire43[(3'h7):(1'h1)] & (wire42[(3'h5):(3'h5)] ^ (+wire43)))));
  assign wire45 = (($unsigned(wire43[(4'hc):(2'h2)]) ?
                      $unsigned(((|wire39) ?
                          {wire43,
                              wire42} : wire42)) : $unsigned(wire38)) <<< {wire43});
  assign wire46 = $unsigned((wire45 ^~ $unsigned(wire39[(3'h7):(2'h2)])));
  always
    @(posedge clk) begin
      reg47 <= wire46[(1'h0):(1'h0)];
      if ($unsigned(wire46[(2'h2):(1'h0)]))
        begin
          reg48 <= $signed(wire44);
          if ($signed((~|$signed(($signed(reg47) ?
              (wire40 && wire42) : (wire44 ? (8'ha0) : wire40))))))
            begin
              reg49 <= (8'hac);
              reg50 <= (^wire43[(2'h3):(1'h1)]);
              reg51 <= (~|(~|wire41[(2'h3):(2'h3)]));
              reg52 <= reg48;
              reg53 <= $unsigned($unsigned(wire39[(3'h5):(3'h4)]));
            end
          else
            begin
              reg49 <= (~|reg47);
              reg50 <= $unsigned(reg52[(3'h7):(1'h1)]);
              reg51 <= {$unsigned(($unsigned({reg50, (8'hb9)}) < wire41)),
                  wire45[(3'h6):(2'h3)]};
              reg52 <= {wire45,
                  (~$signed((((8'ha4) ? reg47 : reg50) ?
                      wire43 : $unsigned(reg47))))};
            end
          reg54 <= wire45;
        end
      else
        begin
          if (({(((wire40 ? reg49 : reg53) ? $signed(wire40) : wire43) ?
                  $unsigned((wire46 > (8'hb7))) : (&(reg47 >> wire39))),
              {(8'hb8)}} >= $signed(reg47)))
            begin
              reg48 <= (&reg53);
              reg49 <= wire46;
            end
          else
            begin
              reg48 <= reg47;
              reg49 <= (~|$signed((wire43 & {$unsigned(reg48), reg50})));
              reg50 <= (&$unsigned(wire44[(1'h0):(1'h0)]));
              reg51 <= $signed(((^($signed(reg51) ?
                  (wire39 ?
                      reg47 : wire39) : reg52[(1'h0):(1'h0)])) * (-$signed($signed(reg47)))));
            end
          reg52 <= reg49[(2'h2):(1'h1)];
          reg53 <= (((reg50 ^ $unsigned(wire39[(1'h0):(1'h0)])) >= $signed(wire39[(3'h5):(1'h0)])) ?
              wire39 : ($unsigned($signed($unsigned(wire46))) ?
                  $unsigned($signed((reg50 >>> wire38))) : $signed($unsigned((wire39 ?
                      reg53 : wire43)))));
          if (wire41)
            begin
              reg54 <= wire38;
              reg55 <= (~&(^reg51));
              reg56 <= (~|wire38);
              reg57 <= reg48[(2'h2):(1'h0)];
            end
          else
            begin
              reg54 <= (~^reg49);
              reg55 <= {$unsigned($unsigned((~|wire46)))};
              reg56 <= (~{$signed(reg48[(4'he):(4'hb)])});
              reg57 <= (-(wire44[(3'h5):(2'h3)] ?
                  reg52[(4'h8):(3'h4)] : reg54));
            end
          reg58 <= {({reg50[(2'h3):(2'h3)]} <<< wire41),
              (($signed($unsigned(reg50)) >>> $unsigned($signed(wire45))) ?
                  reg53 : reg53[(1'h1):(1'h0)])};
        end
      reg59 <= wire38;
      reg60 <= (reg57 ?
          reg48[(4'h9):(3'h6)] : $unsigned({($unsigned(reg51) ?
                  $unsigned(reg55) : wire38)}));
      reg61 <= reg54[(2'h2):(1'h1)];
    end
  assign wire62 = ($unsigned(({wire38} != $unsigned((^reg55)))) ?
                      wire43[(3'h4):(1'h1)] : (($signed((!reg51)) < $unsigned($unsigned((7'h43)))) ?
                          (^(wire46[(1'h0):(1'h0)] << $signed(reg57))) : (reg53[(4'h9):(3'h5)] >>> (^(wire42 ?
                              reg53 : wire41)))));
  assign wire63 = $signed(reg61[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg64 <= wire39[(3'h6):(3'h4)];
      reg65 <= (+reg49);
      reg66 <= (!(($signed((|wire39)) ?
          reg48[(3'h5):(1'h0)] : wire45[(4'hb):(2'h2)]) & (^reg61[(4'hd):(3'h5)])));
    end
  assign wire67 = ((8'hb9) ?
                      ($unsigned((^(reg54 ? (8'hae) : reg59))) ?
                          ($signed((~(7'h42))) ?
                              $signed(reg51[(2'h3):(2'h2)]) : {$unsigned(wire41),
                                  (reg59 | reg51)}) : $unsigned($signed($signed(reg57)))) : ($signed(($unsigned(reg51) << reg64[(4'hb):(1'h1)])) ?
                          (reg52 ?
                              $unsigned({wire44,
                                  wire45}) : reg66[(4'ha):(3'h7)]) : (!reg57)));
  assign wire68 = (~&(^(&reg65)));
  always
    @(posedge clk) begin
      reg69 <= $unsigned($signed((8'hbc)));
      if ($signed(reg57[(4'ha):(4'h9)]))
        begin
          reg70 <= wire40;
        end
      else
        begin
          reg70 <= reg53[(3'h6):(2'h2)];
          reg71 <= (|(!($unsigned(reg47) << wire67)));
        end
      reg72 <= $unsigned({reg56[(1'h1):(1'h0)], $signed(reg55[(4'h9):(3'h6)])});
      reg73 <= $unsigned(reg61[(2'h3):(1'h1)]);
      if (reg49)
        begin
          reg74 <= ((((^(reg69 || wire43)) ?
                      $unsigned((reg48 ? wire46 : reg52)) : ((wire67 ?
                              wire45 : reg54) ?
                          $unsigned(wire45) : $unsigned(reg71))) ?
                  reg60[(4'hd):(4'hb)] : (((&reg56) ?
                      (reg54 >> reg53) : (reg49 ? wire42 : wire62)) | reg60)) ?
              ({{(reg71 ^ reg52)}} == reg49[(4'hd):(4'hb)]) : wire41[(1'h1):(1'h0)]);
        end
      else
        begin
          if (($signed(reg53[(2'h2):(2'h2)]) | ($signed(reg49[(5'h13):(3'h7)]) ?
              reg65 : $unsigned(reg52[(3'h4):(1'h1)]))))
            begin
              reg74 <= wire45;
              reg75 <= reg74[(4'hb):(2'h3)];
              reg76 <= (^(!$unsigned((!{wire42}))));
              reg77 <= $signed(reg75[(4'h8):(3'h5)]);
              reg78 <= reg47[(4'he):(1'h1)];
            end
          else
            begin
              reg74 <= wire45;
              reg75 <= $unsigned((((~|(-reg57)) ?
                      wire62[(3'h7):(2'h3)] : $signed({wire38})) ?
                  $signed(wire42) : $unsigned($signed($unsigned(reg69)))));
              reg76 <= reg65[(3'h6):(3'h6)];
              reg77 <= $signed($signed($signed(reg48[(5'h10):(4'hd)])));
              reg78 <= ((($unsigned((8'hb7)) && wire46[(1'h0):(1'h0)]) && (reg49[(4'hd):(4'ha)] ?
                  $signed(reg72) : reg54[(4'hc):(1'h1)])) == ((-(&$signed(wire62))) ?
                  reg72[(2'h2):(2'h2)] : ((^(wire44 ?
                      (7'h40) : reg78)) < wire45[(3'h6):(3'h6)])));
            end
          if (reg69[(2'h2):(1'h1)])
            begin
              reg79 <= (~|$signed($unsigned(reg57)));
              reg80 <= reg79[(3'h6):(2'h3)];
              reg81 <= $unsigned(reg61);
            end
          else
            begin
              reg79 <= (8'hba);
              reg80 <= $unsigned({(($unsigned(reg76) ?
                      (reg59 != reg72) : $unsigned(reg65)) * ((reg57 ?
                      reg61 : (7'h43)) - $unsigned(wire46))),
                  wire40[(4'hd):(4'hc)]});
              reg81 <= ((!$unsigned(reg61)) >>> (|wire42[(3'h6):(3'h4)]));
              reg82 <= $unsigned(($signed(reg77) + $signed(reg71[(3'h5):(1'h1)])));
            end
        end
    end
  assign wire83 = (^~(|(^~(8'ha6))));
  assign wire84 = ((wire68[(1'h1):(1'h1)] ? $signed((8'ha5)) : $signed(reg81)) ?
                      reg54 : $signed(wire38[(1'h1):(1'h0)]));
  assign wire85 = reg70;
  assign wire86 = (&reg72[(2'h2):(1'h1)]);
  assign wire87 = ($signed((wire46 <= (wire84[(1'h1):(1'h0)] | $signed(wire40)))) + reg77[(1'h0):(1'h0)]);
  assign wire88 = $signed($signed((7'h41)));
  assign wire89 = $unsigned((8'hae));
  assign wire90 = $signed(wire39);
  always
    @(posedge clk) begin
      reg91 <= {($signed((8'hb9)) ?
              (reg52 ~^ reg52) : ((~&$signed(wire43)) | ($signed(wire46) ?
                  $unsigned(reg75) : (8'ha8))))};
      reg92 <= ((-reg60) != ($signed($signed((8'ha8))) ?
          $unsigned({$unsigned(wire38), (-(8'haa))}) : reg75[(4'h8):(3'h6)]));
      reg93 <= {reg49[(2'h3):(1'h0)],
          $signed({$signed((+reg50)), ($signed(reg79) >>> $signed(wire68))})};
      reg94 <= ((^wire42) & $unsigned(wire90[(2'h2):(1'h0)]));
    end
  assign wire95 = wire87;
endmodule

module module12
#(parameter param32 = ({({((8'ha3) > (8'hb1))} | ((~^(8'hbd)) ^ (|(8'h9c)))), ({((7'h42) < (8'ha6)), ((8'hbe) ? (8'h9d) : (8'hbc))} ? (((8'ha7) ? (7'h42) : (7'h43)) + ((8'ha6) << (8'hb6))) : (((8'hba) * (7'h42)) ? {(7'h40), (8'hac)} : (^~(8'hbb))))} ? (~|(~(((8'hb3) ? (8'ha7) : (8'ha1)) >> (8'hb9)))) : ((~{((8'hbf) ? (8'ha1) : (8'hb9))}) << (((&(8'hbc)) < {(8'hbb), (8'ha2)}) ? (((8'ha9) == (7'h40)) & (~&(7'h43))) : (~|(|(8'ha0)))))), 
parameter param33 = (8'hbf))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire17;
  input wire [(3'h4):(1'h0)] wire16;
  input wire [(3'h7):(1'h0)] wire15;
  input wire [(4'h9):(1'h0)] wire14;
  input wire [(2'h2):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire18;
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  assign y = {wire31,
                 wire28,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg30,
                 reg29,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire18 = {$signed({wire15, wire16[(1'h1):(1'h0)]}), (wire15 * wire13)};
  assign wire19 = wire16[(2'h3):(1'h1)];
  assign wire20 = $signed(wire19);
  assign wire21 = $unsigned(wire13[(2'h2):(1'h0)]);
  assign wire22 = {wire13[(1'h1):(1'h0)]};
  assign wire23 = (wire14[(1'h0):(1'h0)] ?
                      wire19[(1'h1):(1'h0)] : {$unsigned(((wire18 && (8'hab)) ?
                              {wire16} : wire22)),
                          (wire16 ^ ($unsigned(wire20) ?
                              (8'hb9) : $unsigned((8'hb5))))});
  assign wire24 = ($unsigned((wire22[(2'h3):(1'h0)] ?
                      {wire20[(1'h1):(1'h0)]} : (wire20 ?
                          $unsigned(wire14) : $signed(wire22)))) + ($unsigned({wire22}) ?
                      wire18[(3'h6):(1'h0)] : wire19));
  assign wire25 = $signed($signed($unsigned(({wire24} == $signed(wire20)))));
  always
    @(posedge clk) begin
      reg26 <= wire13[(2'h2):(1'h1)];
      reg27 <= (((wire18[(3'h7):(1'h0)] ? (~|wire17) : $unsigned((-reg26))) ?
              $unsigned({$unsigned(wire15)}) : wire15[(2'h3):(2'h3)]) ?
          (wire25[(1'h0):(1'h0)] > $signed({wire22[(2'h3):(1'h1)]})) : ({wire19,
                  ((~&wire14) ? wire14 : reg26[(3'h5):(3'h4)])} ?
              wire17[(2'h2):(1'h1)] : {$unsigned(((8'had) ?
                      wire14 : wire13))}));
    end
  assign wire28 = (~$signed($signed((8'h9f))));
  always
    @(posedge clk) begin
      reg29 <= wire21;
      reg30 <= reg26[(3'h5):(3'h5)];
    end
  assign wire31 = reg26[(1'h0):(1'h0)];
endmodule
