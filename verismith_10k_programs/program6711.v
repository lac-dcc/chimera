module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire244;
  wire signed [(4'hd):(1'h0)] wire243;
  wire signed [(4'hb):(1'h0)] wire242;
  wire [(4'he):(1'h0)] wire240;
  wire signed [(5'h14):(1'h0)] wire239;
  wire [(4'h9):(1'h0)] wire238;
  wire [(5'h13):(1'h0)] wire236;
  wire signed [(5'h12):(1'h0)] wire235;
  wire [(2'h3):(1'h0)] wire234;
  wire signed [(4'hc):(1'h0)] wire232;
  wire signed [(3'h4):(1'h0)] wire230;
  wire [(5'h12):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire22;
  reg [(3'h6):(1'h0)] reg237 = (1'h0);
  assign y = {wire244,
                 wire243,
                 wire242,
                 wire240,
                 wire239,
                 wire238,
                 wire236,
                 wire235,
                 wire234,
                 wire232,
                 wire230,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire22,
                 reg237,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = wire3;
  assign wire6 = (8'hae);
  assign wire7 = (((wire0 != wire6) ?
                     wire0 : (wire0[(1'h1):(1'h1)] == wire6)) != wire3);
  assign wire8 = (wire1[(1'h1):(1'h1)] ?
                     (~(~&(^wire6))) : (+(wire5 + $unsigned((8'hbf)))));
  module9 #() modinst23 (.wire11(wire0), .clk(clk), .y(wire22), .wire10(wire3), .wire12(wire2), .wire13(wire5), .wire14(wire6));
  module24 #() modinst231 (wire230, clk, wire4, wire0, wire7, wire3);
  module24 #() modinst233 (.y(wire232), .wire25(wire7), .wire26(wire230), .wire27(wire3), .clk(clk), .wire28(wire5));
  assign wire234 = wire5;
  assign wire235 = ((8'hb8) - $signed((((~wire234) + (wire2 ^~ wire230)) != $unsigned($signed(wire1)))));
  assign wire236 = ($signed((((&wire22) ?
                           (+wire234) : (wire8 ?
                               wire235 : wire5)) | ((~&wire1) >>> $unsigned(wire3)))) ?
                       (^$unsigned((~&$unsigned(wire235)))) : wire22[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg237 <= (^$signed((wire230 & (+(+wire0)))));
    end
  assign wire238 = (~^wire2);
  assign wire239 = (~^((((wire3 ? wire0 : wire235) ?
                       wire7 : {wire1}) >> (wire7 ?
                       (wire22 && (7'h40)) : (+wire0))) - (&$signed((~|wire8)))));
  module211 #() modinst241 (.wire212(wire232), .wire215(wire1), .clk(clk), .wire213(wire22), .wire214(wire235), .y(wire240));
  assign wire242 = $signed((~&wire235));
  assign wire243 = (8'ha9);
  assign wire244 = ((($unsigned(((8'hb4) ? wire1 : wire243)) > {(!wire234)}) ?
                       $signed($signed({wire8,
                           wire230})) : ((wire238 ~^ $unsigned(wire4)) ?
                           $unsigned($unsigned(wire22)) : wire236[(5'h10):(2'h3)])) > wire240[(2'h3):(1'h0)]);
endmodule

module module24  (y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire28;
  input wire [(4'hc):(1'h0)] wire27;
  input wire signed [(3'h4):(1'h0)] wire26;
  input wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire228;
  wire [(5'h14):(1'h0)] wire210;
  wire [(5'h14):(1'h0)] wire208;
  wire signed [(5'h14):(1'h0)] wire162;
  wire signed [(4'hc):(1'h0)] wire161;
  wire [(3'h5):(1'h0)] wire157;
  wire signed [(4'hf):(1'h0)] wire80;
  wire [(5'h13):(1'h0)] wire78;
  reg [(4'hf):(1'h0)] reg160 = (1'h0);
  reg [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  assign y = {wire228,
                 wire210,
                 wire208,
                 wire162,
                 wire161,
                 wire157,
                 wire80,
                 wire78,
                 reg160,
                 reg159,
                 reg29,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg29 <= (($unsigned(($unsigned((8'hb4)) >>> wire25[(4'hd):(4'h9)])) ?
          wire26 : $signed(wire26[(1'h0):(1'h0)])) >>> $signed(wire27[(2'h3):(1'h1)]));
      reg30 <= {$unsigned((wire25[(5'h13):(1'h0)] << {(&wire25)}))};
    end
  module31 #() modinst79 (.clk(clk), .wire33(wire25), .y(wire78), .wire35(wire27), .wire32(reg30), .wire34(reg29));
  assign wire80 = wire78[(4'he):(4'h9)];
  module81 #() modinst158 (wire157, clk, wire27, reg30, wire25, wire80, wire26);
  always
    @(posedge clk) begin
      reg159 <= (|$unsigned(($signed($signed(wire157)) ?
          (wire26 ~^ $signed(wire78)) : wire157[(2'h2):(1'h1)])));
      reg160 <= (((wire26[(2'h2):(2'h2)] <= $signed((wire27 ?
              wire78 : (7'h40)))) ?
          wire25 : $signed(((~wire78) ^~ $signed(wire26)))) + reg30[(2'h3):(2'h3)]);
    end
  assign wire161 = $signed((((-reg29) ?
                           {$signed(wire157),
                               (reg160 | wire25)} : reg160[(4'ha):(1'h0)]) ?
                       $signed({wire27[(3'h6):(3'h6)]}) : (($unsigned(wire80) <= (!wire28)) ?
                           ((reg160 - wire25) ?
                               $signed((8'hb1)) : {wire25}) : reg160[(3'h5):(1'h1)])));
  assign wire162 = $signed((|($signed((wire28 ? wire25 : (8'ha3))) ?
                       {(-wire157)} : $signed($signed(wire80)))));
  module163 #() modinst209 (.wire164(reg30), .wire167(wire162), .wire165(wire161), .clk(clk), .y(wire208), .wire166(reg29));
  assign wire210 = (&{wire80});
  module211 #() modinst229 (wire228, clk, wire80, wire208, wire78, wire25);
endmodule

module module9
#(parameter param20 = (7'h41), 
parameter param21 = ((~param20) ^~ (~{{{param20}, {param20, param20}}, param20})))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire signed [(3'h5):(1'h0)] wire12;
  input wire signed [(2'h2):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  assign y = {wire19, wire18, wire17, wire16, reg15, (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= ($signed((wire13[(4'h9):(1'h0)] ?
              wire10 : wire13[(3'h7):(3'h5)])) ?
          $signed((&wire13)) : wire14[(2'h2):(2'h2)]);
    end
  assign wire16 = (-wire12[(1'h1):(1'h0)]);
  assign wire17 = (7'h44);
  assign wire18 = (~|wire12);
  assign wire19 = wire18[(2'h3):(1'h0)];
endmodule

module module211
#(parameter param227 = ({({((8'ha3) <= (8'hb7))} ? {{(8'ha2), (8'hb4)}, ((8'h9d) >>> (8'hba))} : (((8'had) ? (8'h9d) : (8'hb2)) ? ((8'hbf) >= (8'hb5)) : (8'hb4)))} ? (((((8'had) ? (8'hb7) : (8'hb2)) ? {(7'h44), (8'hbd)} : {(8'hae)}) ^ (((7'h44) ? (8'ha2) : (8'ha2)) ? ((8'hb2) ~^ (8'hbc)) : ((8'haf) + (8'ha2)))) ? {(((8'hb0) || (8'hba)) ^ {(8'ha6)})} : ((^~(+(7'h41))) ? (|((8'hb2) && (8'hba))) : (((8'hac) || (8'haf)) ? {(8'ha0), (8'ha9)} : ((8'ha4) ? (8'hb9) : (7'h43))))) : ((((~|(8'had)) ? (^(8'ha9)) : ((8'hac) + (8'h9d))) ? {((7'h42) ? (8'hb6) : (8'ha0))} : (|((7'h41) ? (8'hb4) : (8'ha8)))) ? {(((8'ha1) ~^ (8'hbb)) > (^~(8'hb7)))} : ({((8'ha1) ? (8'ha0) : (8'hab))} != ((~|(8'hab)) <<< (&(8'hb5)))))))
(y, clk, wire215, wire214, wire213, wire212);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire215;
  input wire [(4'hc):(1'h0)] wire214;
  input wire [(2'h2):(1'h0)] wire213;
  input wire [(4'hc):(1'h0)] wire212;
  wire signed [(4'he):(1'h0)] wire225;
  wire signed [(4'hd):(1'h0)] wire219;
  wire [(5'h15):(1'h0)] wire218;
  wire [(5'h10):(1'h0)] wire217;
  wire signed [(3'h5):(1'h0)] wire216;
  reg signed [(4'hd):(1'h0)] reg226 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg224 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg223 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg222 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg220 = (1'h0);
  assign y = {wire225,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 reg226,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 (1'h0)};
  assign wire216 = (wire213 - (~&wire212[(3'h4):(1'h0)]));
  assign wire217 = (~^$signed($unsigned(($unsigned(wire214) ?
                       wire213[(1'h1):(1'h0)] : wire214))));
  assign wire218 = $signed(wire212);
  assign wire219 = ((&(8'hb5)) || {wire212, $signed((~&wire216))});
  always
    @(posedge clk) begin
      reg220 <= $unsigned((wire212[(2'h3):(2'h3)] * ($unsigned((8'ha1)) - ((8'ha4) ?
          (wire216 && (8'h9f)) : (wire213 ? (8'h9d) : (8'hb4))))));
      reg221 <= $signed((+(wire212[(1'h0):(1'h0)] ?
          reg220 : ((wire218 ? wire214 : wire215) ?
              (^wire213) : (wire213 ? wire214 : wire214)))));
      reg222 <= wire216[(3'h5):(2'h2)];
      reg223 <= wire219[(2'h3):(2'h2)];
      reg224 <= reg223[(3'h4):(1'h1)];
    end
  assign wire225 = (+$unsigned({(wire217[(4'h8):(2'h2)] ?
                           wire216[(1'h1):(1'h1)] : (reg221 ?
                               wire218 : reg221)),
                       $signed(((8'haf) ? wire213 : reg220))}));
  always
    @(posedge clk) begin
      reg226 <= $signed($signed((|reg224)));
    end
endmodule

module module163
#(parameter param207 = {(((7'h40) - {(~|(8'hba))}) ? ((^((7'h42) ? (7'h41) : (8'hb6))) > (8'hba)) : ((((7'h42) ? (8'hae) : (8'haf)) > (7'h41)) == {{(8'ha9)}, (8'ha1)})), ((((&(8'hb1)) >> (+(8'ha7))) ? (&(~|(8'haa))) : (((8'haa) + (8'ha8)) + (+(8'ha9)))) && ((&((8'hbf) << (8'hb0))) ? (((8'hbd) ? (7'h40) : (8'hb4)) ? (^~(8'h9c)) : ((8'h9d) * (8'ha1))) : (~&((8'hb3) ? (8'h9c) : (8'ha2)))))})
(y, clk, wire167, wire166, wire165, wire164);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire167;
  input wire [(4'hc):(1'h0)] wire166;
  input wire signed [(4'hc):(1'h0)] wire165;
  input wire signed [(5'h12):(1'h0)] wire164;
  wire signed [(5'h15):(1'h0)] wire206;
  wire [(4'hf):(1'h0)] wire205;
  wire signed [(3'h4):(1'h0)] wire171;
  wire [(4'hc):(1'h0)] wire170;
  wire [(4'h9):(1'h0)] wire169;
  wire signed [(5'h10):(1'h0)] wire168;
  reg signed [(4'h8):(1'h0)] reg204 = (1'h0);
  reg signed [(4'he):(1'h0)] reg203 = (1'h0);
  reg [(5'h12):(1'h0)] reg202 = (1'h0);
  reg [(2'h3):(1'h0)] reg201 = (1'h0);
  reg [(3'h7):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg199 = (1'h0);
  reg [(4'hf):(1'h0)] reg198 = (1'h0);
  reg [(3'h7):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg196 = (1'h0);
  reg [(4'ha):(1'h0)] reg195 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg194 = (1'h0);
  reg [(3'h6):(1'h0)] reg193 = (1'h0);
  reg [(5'h15):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg191 = (1'h0);
  reg [(5'h10):(1'h0)] reg190 = (1'h0);
  reg [(4'hb):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg [(4'hd):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg186 = (1'h0);
  reg [(5'h11):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg183 = (1'h0);
  reg [(5'h13):(1'h0)] reg182 = (1'h0);
  reg [(5'h14):(1'h0)] reg181 = (1'h0);
  reg [(3'h5):(1'h0)] reg180 = (1'h0);
  reg [(2'h2):(1'h0)] reg179 = (1'h0);
  reg [(5'h10):(1'h0)] reg178 = (1'h0);
  reg [(3'h4):(1'h0)] reg177 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg176 = (1'h0);
  reg [(5'h11):(1'h0)] reg175 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg174 = (1'h0);
  reg [(3'h4):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg172 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
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
                 (1'h0)};
  assign wire168 = wire165;
  assign wire169 = $signed($unsigned({{wire168[(4'hc):(4'h8)], wire165}}));
  assign wire170 = $signed(wire164[(5'h11):(4'h8)]);
  assign wire171 = (wire168[(3'h7):(3'h4)] >> (&(((wire167 || wire167) ?
                       {wire169,
                           (8'hbb)} : wire170[(4'ha):(4'h9)]) ~^ (((8'hbb) != wire168) ?
                       (wire169 ^~ wire168) : wire170[(4'ha):(3'h6)]))));
  always
    @(posedge clk) begin
      reg172 <= wire164;
      if ((((wire168[(4'hc):(3'h5)] ^ (^wire170[(3'h5):(2'h3)])) ?
              wire171[(1'h0):(1'h0)] : $signed(({wire171} ^ (~|wire164)))) ?
          $unsigned(reg172) : (&wire165[(3'h5):(3'h4)])))
        begin
          reg173 <= wire171[(3'h4):(2'h3)];
          reg174 <= ((8'hba) > (8'haa));
          reg175 <= (8'hac);
        end
      else
        begin
          reg173 <= $signed(wire164);
          reg174 <= ((wire168 >> ({wire164[(3'h4):(2'h2)]} ?
                  ((-wire168) ^~ ((8'ha7) - wire164)) : wire171)) ?
              $signed(reg174[(2'h3):(2'h3)]) : (wire170[(4'hb):(4'hb)] <= $unsigned(($signed((8'hb7)) ?
                  (~|reg172) : wire167[(3'h6):(3'h4)]))));
          if ($signed(reg174[(3'h7):(3'h4)]))
            begin
              reg175 <= wire171[(3'h4):(1'h1)];
              reg176 <= (8'h9e);
            end
          else
            begin
              reg175 <= (-($unsigned(wire164[(5'h10):(3'h6)]) && (|wire165[(2'h2):(1'h0)])));
              reg176 <= (~reg172[(5'h13):(4'he)]);
              reg177 <= {reg175};
            end
          if (((~|(+$unsigned(wire169[(2'h3):(2'h3)]))) <= reg173))
            begin
              reg178 <= wire169[(3'h7):(1'h0)];
              reg179 <= ($signed($signed($signed(wire168))) >= $unsigned((reg178[(4'hc):(3'h4)] + (wire168 << (wire165 < wire171)))));
              reg180 <= wire167[(1'h1):(1'h1)];
              reg181 <= wire164[(5'h11):(4'h9)];
              reg182 <= (((((8'ha1) - wire166) ?
                      ((reg178 > (8'h9e)) >> (wire168 ?
                          wire167 : (7'h41))) : reg175[(5'h11):(2'h2)]) < $signed(reg175[(4'ha):(1'h1)])) ?
                  (|wire169) : (wire169 - wire169[(1'h0):(1'h0)]));
            end
          else
            begin
              reg178 <= ($signed((^~reg180)) ^ wire166);
              reg179 <= ((|$signed(wire165[(3'h7):(3'h7)])) ?
                  (^~($unsigned({reg175, reg175}) ?
                      wire171[(3'h4):(3'h4)] : wire164[(4'hd):(3'h6)])) : reg176);
              reg180 <= ((^($unsigned((wire169 ?
                  wire170 : wire167)) + {wire168[(4'he):(2'h2)]})) != wire169[(3'h5):(1'h0)]);
              reg181 <= wire166[(4'hc):(3'h4)];
              reg182 <= wire169[(2'h2):(2'h2)];
            end
          reg183 <= wire164;
        end
      if (($signed(wire164) ?
          ((~^reg178[(4'hc):(3'h6)]) & reg177[(1'h1):(1'h1)]) : reg177))
        begin
          reg184 <= ({(~^$signed((reg172 <<< reg183)))} ?
              reg180 : $signed(wire165[(3'h6):(2'h3)]));
        end
      else
        begin
          if ($unsigned((^(~|reg177))))
            begin
              reg184 <= $unsigned((-reg175[(4'hc):(3'h5)]));
              reg185 <= $unsigned({($signed(reg184[(1'h1):(1'h0)]) ^~ {(wire165 >> wire164),
                      reg181})});
              reg186 <= $unsigned(($unsigned((reg172[(4'he):(4'hd)] < (wire164 <= reg172))) & (&reg185)));
              reg187 <= $signed(wire170[(3'h7):(2'h2)]);
              reg188 <= (reg181 >= {{$signed(wire165),
                      (^(reg175 ? (8'hbf) : wire171))},
                  (8'hb3)});
            end
          else
            begin
              reg184 <= wire168;
              reg185 <= $unsigned(wire165);
            end
          if (reg187[(3'h6):(1'h1)])
            begin
              reg189 <= $signed($signed((!{{reg184}, wire171[(1'h0):(1'h0)]})));
              reg190 <= (((reg172[(5'h10):(4'hd)] >>> wire171[(1'h1):(1'h0)]) - (((reg177 >>> reg175) ?
                  (-wire169) : $unsigned(wire170)) << reg174)) >> $signed((reg188[(3'h4):(2'h3)] ?
                  {reg177} : reg185[(4'hc):(3'h7)])));
            end
          else
            begin
              reg189 <= $unsigned((8'ha8));
              reg190 <= $signed($signed((reg176 || ((reg178 << (7'h43)) ?
                  ((7'h44) ? reg172 : reg178) : $unsigned(wire164)))));
            end
        end
      if ($signed((wire169[(3'h4):(1'h0)] && $signed((reg190 ?
          (wire169 ~^ (8'hbd)) : $unsigned(reg187))))))
        begin
          if (($unsigned($unsigned(wire168)) ?
              (|(reg183[(3'h5):(1'h1)] & ($unsigned((8'h9f)) > $unsigned(reg174)))) : ($unsigned($signed(reg176)) ?
                  {wire169[(2'h2):(1'h1)]} : $signed($unsigned($signed(reg178))))))
            begin
              reg191 <= wire166;
              reg192 <= (!reg176[(1'h0):(1'h0)]);
              reg193 <= $unsigned(((reg185 <<< (&(~^reg189))) ?
                  reg191[(1'h0):(1'h0)] : wire166));
              reg194 <= reg187;
              reg195 <= wire168[(3'h4):(2'h2)];
            end
          else
            begin
              reg191 <= reg176;
              reg192 <= $unsigned({{$signed($signed((7'h40))),
                      $signed({wire167})},
                  reg188[(4'h8):(2'h2)]});
              reg193 <= reg189[(3'h6):(2'h2)];
            end
          reg196 <= ({$unsigned((~^reg178[(4'hd):(1'h0)])), reg178} ?
              $unsigned(($unsigned((wire165 ?
                  wire165 : wire165)) ^~ (^(reg176 != wire168)))) : reg191);
          reg197 <= $unsigned((reg186 ~^ {$unsigned(reg175[(3'h5):(1'h0)])}));
        end
      else
        begin
          if (reg195)
            begin
              reg191 <= reg197;
              reg192 <= reg185;
              reg193 <= reg172[(4'hf):(3'h5)];
            end
          else
            begin
              reg191 <= reg193[(3'h5):(1'h1)];
            end
        end
      if ((^{($unsigned($unsigned(reg180)) ? {$unsigned(reg180)} : reg193),
          reg190}))
        begin
          reg198 <= reg180[(3'h4):(2'h3)];
          reg199 <= {{wire168, $signed((-(reg190 ? reg192 : reg193)))}};
          if ((&{(((reg199 && reg174) & (reg196 ?
                  reg193 : reg186)) < (reg196 < reg199[(3'h5):(1'h1)])),
              $unsigned((reg185 ?
                  (wire166 ? wire167 : reg182) : $unsigned(wire169)))}))
            begin
              reg200 <= $signed($unsigned($unsigned(reg192[(5'h11):(4'h9)])));
              reg201 <= ($signed((~((reg172 ? reg197 : reg175) ?
                  (wire164 && (8'hab)) : reg174))) >= reg195);
              reg202 <= reg174;
            end
          else
            begin
              reg200 <= $unsigned($signed((((reg185 ? reg195 : reg202) ?
                  (reg190 ? reg190 : reg192) : (reg183 ?
                      (8'hb5) : reg200)) <= (wire170[(2'h2):(1'h1)] - reg175))));
              reg201 <= $signed($signed($unsigned($unsigned(reg187))));
              reg202 <= reg177[(2'h3):(2'h2)];
            end
          reg203 <= reg199;
        end
      else
        begin
          reg198 <= ($signed({reg198,
              (reg199 >= (-reg199))}) - ($unsigned((+(reg177 ?
                  reg172 : reg187))) ?
              (!$signed($signed(reg186))) : reg175));
          reg199 <= $signed($signed(($signed((!(8'haf))) ?
              $unsigned($signed(reg194)) : reg196)));
          reg200 <= {($signed($signed((reg186 <<< reg182))) ?
                  ((-(wire171 <= wire164)) < ((|reg192) != (wire165 <<< reg180))) : reg183),
              reg179};
          reg201 <= ((reg201 ?
                  (({wire168, reg179} ?
                      {reg178,
                          reg198} : $unsigned(reg185)) * reg180) : $unsigned({(-reg188),
                      $unsigned(wire170)})) ?
              ((((8'h9d) ? $unsigned(reg192) : $unsigned(reg179)) ?
                      wire165 : $unsigned((reg191 ? (8'hbc) : wire168))) ?
                  wire170[(4'h8):(1'h1)] : reg189) : (!wire168));
          if ({reg183[(2'h2):(1'h1)]})
            begin
              reg202 <= $signed((~^reg182));
              reg203 <= ((~(^reg193[(3'h6):(2'h2)])) ?
                  reg178[(3'h6):(2'h2)] : ($unsigned($signed((reg200 ^ reg196))) & ((reg183[(2'h3):(2'h2)] ?
                      reg177 : (^~(8'haf))) >>> reg175[(4'h8):(1'h1)])));
            end
          else
            begin
              reg202 <= ((^($unsigned($unsigned(reg199)) - (!(~^reg192)))) < ($unsigned((~(reg194 << reg186))) ?
                  ($signed(reg173[(1'h0):(1'h0)]) ?
                      reg177 : reg188) : $unsigned($unsigned({reg193}))));
              reg203 <= {(reg175[(4'he):(4'h9)] + reg181),
                  {(&{$signed(reg187), $unsigned(reg192)})}};
              reg204 <= {{(8'hb5)}, (~&reg194)};
            end
        end
    end
  assign wire205 = wire171[(2'h2):(1'h1)];
  assign wire206 = {{(^~reg198)}};
endmodule

module module81
#(parameter param156 = ({({(&(8'ha3)), (+(7'h44))} - ((~(8'ha2)) ? ((8'hb1) ? (8'hb9) : (8'hbe)) : ((8'hb5) & (8'hb1))))} * (~((((7'h44) ^~ (8'ha1)) != (+(8'hb0))) ^ ((~&(8'hb7)) >> ((8'hab) == (8'ha1)))))))
(y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'h312):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire86;
  input wire signed [(5'h10):(1'h0)] wire85;
  input wire signed [(5'h14):(1'h0)] wire84;
  input wire signed [(3'h4):(1'h0)] wire83;
  input wire [(3'h4):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire140;
  wire signed [(5'h12):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire113;
  wire [(3'h7):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire111;
  wire signed [(5'h13):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire102;
  wire signed [(2'h2):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire87;
  reg signed [(2'h2):(1'h0)] reg155 = (1'h0);
  reg signed [(4'he):(1'h0)] reg154 = (1'h0);
  reg [(4'hd):(1'h0)] reg153 = (1'h0);
  reg [(2'h3):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg149 = (1'h0);
  reg [(4'h9):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  reg [(4'hd):(1'h0)] reg139 = (1'h0);
  reg [(5'h14):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(5'h11):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(4'he):(1'h0)] reg118 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  assign y = {wire140,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire102,
                 wire101,
                 wire87,
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
                 reg142,
                 reg141,
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
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg105,
                 reg104,
                 reg103,
                 reg100,
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
                 (1'h0)};
  assign wire87 = (wire82[(3'h4):(1'h0)] <= wire84[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg88 <= (8'had);
      if (((reg88[(1'h1):(1'h0)] ?
              $signed(wire85[(1'h1):(1'h0)]) : wire86[(1'h0):(1'h0)]) ?
          (($signed($signed(reg88)) ? wire82 : reg88) ^~ ({$unsigned(wire84)} ?
              $unsigned($unsigned(wire82)) : {$signed((8'ha3)),
                  $unsigned(wire84)})) : $signed($signed((7'h42)))))
        begin
          reg89 <= wire82[(3'h4):(1'h0)];
          reg90 <= $signed($unsigned((8'hb1)));
          reg91 <= $signed(((((wire84 & (8'ha2)) <= wire87) || wire84[(5'h13):(4'h8)]) != (wire84[(5'h14):(5'h14)] ?
              ((7'h42) ?
                  $unsigned(wire84) : (reg88 ? (8'hbc) : reg88)) : wire83)));
          reg92 <= reg89[(1'h1):(1'h0)];
          reg93 <= $signed(((~(8'ha6)) ^ $unsigned((+$unsigned(wire83)))));
        end
      else
        begin
          reg89 <= $signed((&((&$signed(reg91)) ?
              $signed(reg88) : {reg93, (8'hb1)})));
          reg90 <= $unsigned($signed(wire86[(2'h2):(1'h1)]));
          if ((!($unsigned({(wire86 ? reg93 : wire83), (8'h9d)}) | (8'had))))
            begin
              reg91 <= $unsigned(wire86);
              reg92 <= (^~$signed((((wire87 >> reg91) | $signed((8'ha0))) ?
                  (8'h9d) : wire82[(2'h3):(1'h1)])));
              reg93 <= reg90;
            end
          else
            begin
              reg91 <= {$unsigned($signed(($unsigned(wire86) ?
                      reg90 : reg89[(3'h4):(2'h3)]))),
                  $signed(((wire85[(5'h10):(2'h3)] >>> (!wire87)) == $signed($unsigned(wire87))))};
              reg92 <= wire82[(1'h0):(1'h0)];
              reg93 <= $signed(wire86[(1'h1):(1'h0)]);
              reg94 <= ($unsigned(reg90) ?
                  (~|(~$signed((~reg93)))) : ($signed({wire86[(3'h4):(3'h4)]}) != $signed(($unsigned(reg90) ?
                      $unsigned((8'ha2)) : wire86))));
              reg95 <= (8'hae);
            end
          if (((reg91[(5'h11):(3'h5)] >= (8'hb4)) ?
              $signed((~&(reg92 ?
                  (&reg95) : $signed(wire83)))) : ((wire84 > $unsigned(reg92[(4'hd):(2'h3)])) ?
                  (~|reg93) : $signed(reg95))))
            begin
              reg96 <= (wire84 & reg89[(3'h4):(2'h3)]);
              reg97 <= $signed(((|reg91[(1'h0):(1'h0)]) != reg89[(1'h1):(1'h0)]));
              reg98 <= $unsigned((~&wire87));
              reg99 <= $signed($unsigned((($unsigned(reg88) < $signed(wire83)) ?
                  (^~$signed((8'hb8))) : wire86[(3'h4):(1'h1)])));
              reg100 <= $signed((-$unsigned(reg95)));
            end
          else
            begin
              reg96 <= (-((reg91[(4'h9):(4'h9)] << ($unsigned(reg92) == $signed(reg96))) ?
                  ($signed((+reg95)) != $signed(wire83[(1'h1):(1'h1)])) : ($signed((+(8'ha4))) >>> $signed(reg99[(1'h1):(1'h1)]))));
            end
        end
    end
  assign wire101 = reg92;
  assign wire102 = $unsigned((~$unsigned({wire82[(2'h2):(1'h0)],
                       ((8'hae) ? reg96 : reg100)})));
  always
    @(posedge clk) begin
      reg103 <= reg88[(4'h9):(4'h8)];
      reg104 <= ($unsigned(wire102) < (reg98 + reg88));
      reg105 <= reg95;
    end
  assign wire106 = $unsigned(($unsigned(((wire85 ? reg98 : reg90) ?
                           wire82 : wire101)) ?
                       $signed(($signed(reg89) ?
                           (wire85 ?
                               reg92 : reg92) : wire85[(2'h3):(2'h2)])) : $unsigned($signed($unsigned(reg105)))));
  assign wire107 = (&(^~(((^(7'h40)) != wire106[(4'hb):(2'h2)]) ?
                       wire85 : wire85)));
  assign wire108 = $unsigned($unsigned(wire85[(4'he):(4'h8)]));
  assign wire109 = wire107;
  assign wire110 = wire108;
  assign wire111 = (~(!wire82));
  assign wire112 = $unsigned((&wire87));
  assign wire113 = wire106[(1'h0):(1'h0)];
  assign wire114 = ((^~$unsigned($unsigned($unsigned(reg93)))) ?
                       $signed((7'h41)) : $unsigned($unsigned($signed((reg93 ?
                           (8'hac) : wire101)))));
  assign wire115 = (|$signed(wire110[(3'h7):(3'h7)]));
  assign wire116 = (^{wire115[(4'h8):(4'h8)]});
  assign wire117 = wire83[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg118 <= {(8'ha8)};
      reg119 <= wire115[(4'ha):(3'h5)];
      if ((+$unsigned(wire106)))
        begin
          reg120 <= reg99[(1'h0):(1'h0)];
        end
      else
        begin
          reg120 <= $unsigned(($unsigned($signed($signed(wire114))) ?
              ((~(+reg93)) >>> (~(wire84 & reg99))) : (~^reg91[(4'hf):(4'hd)])));
          reg121 <= $signed($unsigned($unsigned((^~$signed(wire86)))));
          if ((($signed(wire113) ?
              $signed($signed(reg92[(5'h15):(1'h1)])) : $unsigned($signed({wire82}))) ~^ $unsigned((8'hb6))))
            begin
              reg122 <= $unsigned(($unsigned(wire87) || (wire113[(3'h7):(2'h2)] ?
                  ((wire82 ? (8'had) : wire102) && (wire87 ?
                      reg118 : (8'ha3))) : (!reg103[(4'h8):(1'h1)]))));
              reg123 <= (($unsigned((^~reg119)) + $unsigned(wire84[(4'hb):(4'h9)])) ?
                  ((reg92 >> wire102) <= $signed(reg95[(3'h5):(2'h3)])) : {reg121[(1'h0):(1'h0)]});
            end
          else
            begin
              reg122 <= reg119;
              reg123 <= $unsigned({reg97[(1'h1):(1'h1)],
                  ($signed($signed((8'hb1))) < $signed(reg122[(4'hc):(4'ha)]))});
              reg124 <= $signed($unsigned($signed((|reg97[(1'h0):(1'h0)]))));
              reg125 <= $unsigned(((((reg98 ? wire110 : reg90) <= (8'hbf)) ?
                  (8'ha0) : $unsigned(wire117[(3'h6):(3'h6)])) < reg97[(1'h1):(1'h0)]));
            end
        end
      if (($signed($signed(((reg97 ~^ wire85) ?
          reg103[(4'h8):(3'h4)] : ((8'hb5) & reg121)))) ^ reg93[(1'h1):(1'h0)]))
        begin
          reg126 <= $signed((^~$signed(wire108[(2'h3):(2'h2)])));
          if ($unsigned(({reg121, reg103[(2'h3):(1'h1)]} >>> ($unsigned(reg91) ?
              ({reg126} >> $unsigned(wire82)) : ($signed(reg99) ?
                  wire106[(3'h6):(1'h0)] : {reg90, reg122})))))
            begin
              reg127 <= ($unsigned({wire114[(4'hf):(4'he)]}) > $signed((reg99[(1'h0):(1'h0)] < $signed(wire84))));
              reg128 <= ((+($signed($unsigned(wire116)) & $unsigned(wire85))) ?
                  ($unsigned($unsigned($unsigned(reg88))) ?
                      $unsigned($signed(wire84)) : $signed({(wire117 || reg100),
                          (reg103 - wire84)})) : ((~|($signed(reg100) ?
                      (-reg91) : (^reg127))) - reg126));
              reg129 <= $unsigned($signed((^wire82[(2'h2):(1'h1)])));
              reg130 <= $unsigned($unsigned((($unsigned(wire82) ?
                  (reg95 ?
                      reg118 : wire101) : (8'h9d)) & reg118[(4'hd):(3'h7)])));
            end
          else
            begin
              reg127 <= ($unsigned($unsigned(wire114)) != $signed($unsigned((reg128[(5'h10):(3'h5)] ?
                  wire106 : $unsigned(reg103)))));
              reg128 <= (~^$unsigned(({(wire106 ? reg121 : reg93)} ?
                  reg96 : (wire106 ? $signed(wire82) : $unsigned((8'ha0))))));
              reg129 <= {wire83};
              reg130 <= $unsigned({reg99});
            end
          if (reg88[(3'h5):(1'h0)])
            begin
              reg131 <= ({(reg89 + (~(8'hb5)))} ?
                  ((($unsigned(wire116) ?
                              (+reg98) : (wire87 ? wire106 : reg122)) ?
                          wire111 : ((~&wire107) ?
                              wire116[(2'h3):(1'h0)] : wire107[(3'h7):(3'h6)])) ?
                      (7'h42) : reg100[(3'h6):(3'h4)]) : {($signed((~&reg120)) ?
                          wire83 : (&$signed((7'h41))))});
              reg132 <= ($signed((7'h40)) >> (wire101 ?
                  $signed(wire86[(1'h0):(1'h0)]) : $signed(((reg91 <<< wire102) ?
                      {wire108, reg120} : $signed(reg93)))));
              reg133 <= (reg105[(2'h2):(1'h0)] ?
                  $signed(reg96[(3'h4):(1'h0)]) : reg98[(3'h7):(3'h5)]);
            end
          else
            begin
              reg131 <= {$unsigned((reg124 ?
                      $signed((reg89 ?
                          reg131 : reg123)) : {reg124[(1'h0):(1'h0)]}))};
            end
          if (reg119)
            begin
              reg134 <= $signed(reg122);
              reg135 <= $unsigned($signed((|({reg122, reg132} ?
                  reg131 : (reg91 ? reg122 : wire107)))));
              reg136 <= ((8'hb2) ^~ reg123);
              reg137 <= ((-(^~reg118)) || (&reg131));
            end
          else
            begin
              reg134 <= ($signed(((~^(7'h41)) ?
                      reg118[(1'h1):(1'h0)] : reg135)) ?
                  (reg118[(1'h0):(1'h0)] ~^ $unsigned(reg93)) : (|({((8'hbc) ?
                          wire110 : (8'hab)),
                      $signed(reg94)} <= $unsigned($signed(reg137)))));
              reg135 <= (~^($signed({{(8'haa)}}) >>> (|(&reg128))));
              reg136 <= ($signed((({wire113} ? reg96 : wire82) ?
                  reg90[(4'ha):(4'ha)] : ($unsigned(wire116) * (!(8'ha5))))) != wire108);
            end
          reg138 <= ((($signed({reg105, reg134}) - (!wire85[(4'he):(3'h5)])) ?
                  $unsigned(((reg119 ? reg93 : (8'hb0)) ?
                      $signed(wire87) : wire82)) : $unsigned(wire101)) ?
              (-wire82) : {(~$unsigned($signed((8'hac)))),
                  $unsigned($signed(wire101[(1'h0):(1'h0)]))});
        end
      else
        begin
          if ((~|$unsigned(wire110[(2'h3):(2'h2)])))
            begin
              reg126 <= $signed($unsigned(reg131[(4'h8):(3'h7)]));
              reg127 <= reg100[(2'h3):(2'h3)];
              reg128 <= (reg92[(5'h10):(2'h2)] ~^ reg129);
            end
          else
            begin
              reg126 <= reg105;
              reg127 <= (^~(((reg97 ?
                      reg132 : reg95[(2'h3):(2'h3)]) > $signed(wire82)) ?
                  wire106 : {$signed({reg92, reg129}), wire82}));
              reg128 <= ((wire106[(4'h8):(3'h5)] ?
                  (reg137[(4'ha):(1'h1)] ?
                      $unsigned((reg90 ?
                          (8'haf) : wire84)) : $unsigned(reg127)) : (^~(!(reg100 & wire110)))) >= reg120[(4'he):(2'h2)]);
              reg129 <= $unsigned({{((reg91 ? wire82 : (8'had)) < (reg95 ?
                          reg129 : reg94))}});
            end
          reg130 <= (~|($signed(reg138[(4'he):(3'h6)]) ?
              (~wire83[(1'h1):(1'h0)]) : $signed($unsigned((reg132 == wire115)))));
        end
    end
  always
    @(posedge clk) begin
      reg139 <= $unsigned($signed((reg122[(4'he):(2'h2)] ?
          {{reg135, reg88}, $signed(wire117)} : {$signed(reg91)})));
    end
  assign wire140 = reg89;
  always
    @(posedge clk) begin
      reg141 <= $unsigned(wire117);
      reg142 <= $signed((reg130 ?
          (&(reg104[(4'h9):(4'h9)] ^~ (reg93 && reg121))) : ($signed((wire112 && wire86)) <= $signed((reg93 ?
              wire108 : reg124)))));
      if ($signed((&(|wire110[(3'h6):(1'h1)]))))
        begin
          reg143 <= reg105[(2'h2):(2'h2)];
          reg144 <= ((^(8'hbc)) ?
              $unsigned((|$unsigned((wire115 && reg121)))) : reg131[(4'hd):(2'h3)]);
          reg145 <= $unsigned(($unsigned((^reg89[(1'h1):(1'h1)])) ~^ $unsigned({(-(8'hae)),
              reg99})));
          reg146 <= (8'h9c);
        end
      else
        begin
          reg143 <= {reg134};
          if (({reg105,
                  ($signed(reg143[(3'h5):(2'h3)]) ?
                      (8'hbc) : (^(reg132 ? (8'hbe) : wire108)))} ?
              (|$signed((-reg124[(4'h8):(3'h4)]))) : ((-$unsigned((reg145 ?
                      wire106 : wire109))) ?
                  reg125[(2'h2):(2'h2)] : reg95[(3'h6):(2'h2)])))
            begin
              reg144 <= $unsigned(((|$unsigned(wire83[(2'h2):(1'h0)])) ?
                  $signed($unsigned(reg93)) : reg144));
              reg145 <= $signed((~(~|(^(~reg145)))));
              reg146 <= ((|$unsigned((wire106[(4'h9):(2'h2)] ?
                  $signed(wire114) : reg90[(4'hb):(3'h7)]))) >>> ((8'ha9) ?
                  (reg141 ?
                      reg125 : ((wire107 ?
                          reg143 : reg141) && $unsigned(wire114))) : (reg100[(3'h5):(2'h3)] ?
                      wire112 : (-wire114))));
              reg147 <= (~&$signed((reg127[(4'he):(4'h9)] << (~&$signed((8'haa))))));
              reg148 <= (~&(wire114 ?
                  (reg123[(4'h8):(3'h4)] == $unsigned((reg124 <<< reg99))) : $signed((~^{reg130,
                      reg123}))));
            end
          else
            begin
              reg144 <= (reg99[(1'h0):(1'h0)] <<< $signed(reg119));
              reg145 <= $unsigned(reg92);
              reg146 <= $signed((!$unsigned(({wire82} - (reg89 ?
                  wire101 : wire115)))));
            end
          reg149 <= ($signed(((reg123[(3'h7):(3'h5)] || $unsigned(wire115)) ?
                  ((reg95 ? reg91 : (8'ha7)) ?
                      reg148[(1'h1):(1'h0)] : reg146[(5'h13):(4'h8)]) : ((reg129 ?
                      wire85 : (8'hba)) <= {wire113, wire140}))) ?
              $signed($signed(wire85[(4'hf):(4'h8)])) : wire109[(1'h0):(1'h0)]);
          if ($unsigned(($unsigned($signed($signed(reg143))) ?
              ($unsigned($unsigned(reg149)) ?
                  wire86 : $signed($unsigned(reg91))) : wire84[(4'h8):(2'h2)])))
            begin
              reg150 <= (~|(((reg125 ^ reg131) ?
                      reg124[(3'h4):(3'h4)] : (((8'hba) ? wire114 : wire84) ?
                          reg146[(4'hb):(3'h4)] : wire116)) ?
                  (~{$unsigned((8'hb4))}) : $signed(reg123[(2'h2):(1'h1)])));
              reg151 <= $signed((({reg90[(3'h6):(3'h6)]} ?
                      reg104[(4'ha):(4'ha)] : (!(+wire108))) ?
                  $unsigned($unsigned((~&reg100))) : wire83[(1'h1):(1'h1)]));
            end
          else
            begin
              reg150 <= (-reg122);
              reg151 <= (wire82 ?
                  ((8'ha9) * $unsigned((reg94[(2'h3):(1'h1)] ?
                      ((8'hb3) ?
                          reg96 : reg88) : (wire101 == reg100)))) : $unsigned(wire109[(4'h8):(1'h1)]));
              reg152 <= wire87;
            end
          if (reg122[(5'h13):(4'he)])
            begin
              reg153 <= {reg135,
                  $signed({(wire114[(1'h1):(1'h0)] ?
                          (wire84 ? reg104 : reg123) : reg134[(1'h1):(1'h1)]),
                      $signed((reg139 || wire116))})};
              reg154 <= reg89;
            end
          else
            begin
              reg153 <= {(~|($signed(reg153) * reg92)),
                  (&(reg141[(4'hb):(4'h9)] ^ ((wire113 < reg96) ?
                      $signed((8'hbb)) : (~&wire117))))};
            end
        end
      reg155 <= $unsigned($unsigned(reg132[(1'h1):(1'h0)]));
    end
endmodule

module module31
#(parameter param76 = (((!(((8'hb5) == (8'hb6)) ^ ((8'ha4) ? (8'hab) : (8'ha0)))) ? ((((8'ha2) >>> (7'h44)) & (~&(8'hba))) ^~ ((~(8'hb6)) > (~(8'hb0)))) : ((8'hb5) > (((8'hb4) < (8'hbd)) ? (|(8'ha9)) : ((8'h9d) ^ (7'h41))))) ? (8'ha3) : (!{{(8'hb3), (~^(8'hb9))}})), 
parameter param77 = (!{param76}))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire35;
  input wire signed [(4'ha):(1'h0)] wire34;
  input wire signed [(3'h6):(1'h0)] wire33;
  input wire signed [(4'ha):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire38,
                 wire37,
                 wire36,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire36 = ({wire33[(3'h4):(2'h3)],
                      wire34} <<< $signed($signed((8'hae))));
  assign wire37 = (7'h41);
  assign wire38 = ((~&($signed($unsigned(wire36)) ^~ wire36[(4'h8):(3'h4)])) | (wire34[(4'ha):(1'h0)] ?
                      ((^$unsigned((8'hb4))) >= (^~{wire35,
                          wire37})) : $unsigned((wire34[(2'h2):(2'h2)] ^~ {wire36}))));
  always
    @(posedge clk) begin
      if ($signed(($signed(wire34) >>> ($signed(wire32[(1'h0):(1'h0)]) ?
          wire34 : wire32[(3'h5):(3'h4)]))))
        begin
          if ({{wire36}})
            begin
              reg39 <= $signed(((!{$unsigned((8'hab))}) >>> wire35[(3'h4):(3'h4)]));
              reg40 <= wire37;
              reg41 <= wire35[(1'h1):(1'h1)];
            end
          else
            begin
              reg39 <= wire36[(2'h2):(1'h1)];
              reg40 <= $unsigned((~reg40));
              reg41 <= $unsigned((wire34 ? reg39[(2'h2):(1'h1)] : (8'hb9)));
            end
          reg42 <= $signed($signed(($signed((wire32 ^ wire32)) || (+$signed(wire33)))));
          reg43 <= $signed(reg42);
          reg44 <= ($signed({$signed({reg43, wire36})}) ?
              (~|($unsigned((reg42 ?
                  wire37 : reg41)) ^~ (reg43[(4'hb):(1'h1)] * (+wire37)))) : reg43[(4'hf):(1'h1)]);
        end
      else
        begin
          if ($unsigned((^(~&reg41[(1'h1):(1'h0)]))))
            begin
              reg39 <= {(&(^$unsigned(wire33[(1'h0):(1'h0)]))),
                  reg42[(1'h1):(1'h1)]};
              reg40 <= {$unsigned((~|(|(^wire34)))),
                  $signed(({wire38} >> reg41))};
              reg41 <= reg44[(1'h1):(1'h0)];
              reg42 <= (^(8'hbe));
              reg43 <= $unsigned($unsigned(wire37[(2'h2):(1'h1)]));
            end
          else
            begin
              reg39 <= $signed({$signed({$signed((8'ha2)),
                      wire32[(4'h9):(3'h7)]}),
                  (~((wire34 ? reg42 : (8'hb1)) ~^ reg44))});
            end
        end
      reg45 <= $unsigned(reg43[(4'hd):(4'hd)]);
      reg46 <= $signed(($unsigned(reg42[(1'h1):(1'h1)]) ?
          reg41[(3'h6):(2'h3)] : wire35[(4'h8):(2'h2)]));
      reg47 <= reg46;
    end
  assign wire48 = reg41;
  assign wire49 = (($signed((~|(wire38 ?
                          wire35 : reg40))) | reg46[(1'h0):(1'h0)]) ?
                      reg43 : wire36);
  assign wire50 = reg41;
  assign wire51 = ((~^(((reg46 ? reg45 : (8'hbc)) > (reg46 ?
                          reg42 : reg44)) ~^ $unsigned((reg46 > (7'h40))))) ?
                      ((reg41[(3'h6):(2'h3)] ?
                              ($unsigned(wire35) ?
                                  $unsigned(reg42) : {wire50}) : reg45) ?
                          {wire36} : {wire37[(2'h2):(2'h2)]}) : ((^reg41[(3'h6):(3'h4)]) ?
                          ($unsigned((-wire33)) ?
                              wire32 : ((^~(8'ha8)) ?
                                  (^reg47) : (wire34 != reg39))) : (&($signed(wire37) ?
                              $unsigned(wire34) : $signed(wire38)))));
  always
    @(posedge clk) begin
      reg52 <= reg42;
      reg53 <= ($signed(wire32) ?
          reg45[(4'hc):(3'h7)] : (~&{($unsigned(wire51) == (~reg44))}));
      reg54 <= wire50;
      if ($unsigned(reg44[(2'h2):(2'h2)]))
        begin
          reg55 <= wire33[(3'h4):(3'h4)];
        end
      else
        begin
          if (({wire50, wire34[(2'h3):(2'h2)]} ?
              reg41 : $signed((wire33[(2'h3):(2'h2)] ~^ reg44[(2'h2):(1'h1)]))))
            begin
              reg55 <= wire36;
              reg56 <= (($signed((8'hb9)) ^ (reg39[(2'h2):(1'h0)] ?
                  reg44 : {(-reg55)})) * wire34[(3'h4):(2'h3)]);
              reg57 <= $signed(($signed(($unsigned(reg53) ?
                  (~wire34) : reg52[(4'he):(1'h0)])) + $signed($unsigned($signed(reg56)))));
              reg58 <= ($signed((reg40 ?
                  $signed((^~reg46)) : wire35[(3'h6):(3'h6)])) < (reg52 ?
                  ((~^$signed(wire51)) <= wire35) : ($unsigned(wire35[(2'h2):(2'h2)]) ^ ((reg46 >> (8'ha1)) * (~^(8'hbf))))));
              reg59 <= $unsigned($unsigned($signed(($signed(wire49) < reg47[(3'h6):(3'h5)]))));
            end
          else
            begin
              reg55 <= ((&$signed($signed($signed(wire37)))) ?
                  $unsigned($unsigned(reg52[(3'h5):(2'h2)])) : ((~|reg56[(5'h11):(1'h0)]) == ({$signed(wire35),
                          {reg41, wire38}} ?
                      {(-(8'ha1))} : ((reg39 ?
                          reg45 : reg43) | reg44[(1'h1):(1'h0)]))));
            end
        end
    end
  assign wire60 = (8'hb7);
  assign wire61 = wire33[(1'h1):(1'h1)];
  assign wire62 = (~|reg59);
  always
    @(posedge clk) begin
      if ((^~reg52))
        begin
          reg63 <= reg54;
          reg64 <= reg53;
          reg65 <= (8'hb3);
        end
      else
        begin
          reg63 <= $unsigned(((~{(wire48 ? wire36 : (8'haf))}) && wire50));
          reg64 <= (^~reg40);
          reg65 <= ($signed(((((8'hbe) ? wire61 : wire61) ?
                  (wire33 ? wire33 : (8'hbc)) : (reg53 & reg57)) ?
              (reg65[(3'h4):(2'h3)] >>> wire33) : (^~(reg47 ?
                  (8'hab) : reg58)))) << $signed($unsigned((|((8'hac) ?
              wire49 : reg40)))));
          if (reg58)
            begin
              reg66 <= reg65;
            end
          else
            begin
              reg66 <= wire38;
              reg67 <= wire49;
            end
        end
      if (((8'ha5) ? reg58[(3'h4):(1'h1)] : $unsigned((-reg66[(1'h0):(1'h0)]))))
        begin
          reg68 <= (~|(wire51 ?
              ({$unsigned(reg57)} ?
                  (8'h9d) : wire50[(4'hc):(4'h9)]) : $unsigned((!(8'hbb)))));
          if ($signed($signed(reg67[(1'h0):(1'h0)])))
            begin
              reg69 <= $unsigned((!(&wire50[(3'h7):(3'h5)])));
              reg70 <= $unsigned(($unsigned((&(+wire62))) ?
                  ((reg44[(1'h0):(1'h0)] <<< $unsigned(reg56)) << $unsigned((wire37 * (8'hb0)))) : reg45[(4'hd):(1'h1)]));
              reg71 <= ((reg67 < $signed(($unsigned(reg43) ^~ reg43[(4'hd):(4'hc)]))) >> ((8'ha4) ~^ $signed(($unsigned((8'ha5)) && wire32[(4'ha):(3'h5)]))));
              reg72 <= (-wire35[(3'h7):(2'h2)]);
            end
          else
            begin
              reg69 <= reg44[(2'h2):(2'h2)];
              reg70 <= {$unsigned({((&wire32) > (reg69 ^ (8'ha7)))})};
              reg71 <= ((-(~((~|reg58) ? {reg70} : $unsigned(reg72)))) ?
                  reg67 : (reg55 != (reg39 - wire51[(2'h3):(1'h0)])));
            end
        end
      else
        begin
          reg68 <= $signed($signed(({wire36} ?
              $unsigned({(8'hb2), wire48}) : reg46)));
          reg69 <= ((~{{wire38[(1'h0):(1'h0)]}, reg66[(2'h2):(1'h0)]}) ?
              $unsigned($signed(reg59)) : (-(+($unsigned(wire38) > $signed(reg42)))));
          reg70 <= {$unsigned((-wire33))};
          if ((($unsigned($signed({reg65})) * $unsigned(wire36[(2'h3):(2'h3)])) ?
              (((~&(reg59 ~^ (8'ha2))) ?
                  (reg68 ?
                      $unsigned(reg45) : $unsigned(wire48)) : (~$signed(wire37))) ^ (8'hb3)) : {{(reg54 * reg40[(4'h9):(3'h7)]),
                      $unsigned(reg66[(2'h3):(2'h2)])}}))
            begin
              reg71 <= (~|$signed((($signed(reg70) ?
                  reg58 : $signed(reg69)) || reg44)));
            end
          else
            begin
              reg71 <= reg40;
              reg72 <= (((((~&(8'hab)) && (reg63 ?
                      reg66 : reg45)) + $signed(wire36[(1'h1):(1'h0)])) >>> $unsigned(reg46)) ?
                  (|$signed($unsigned({(8'hb4),
                      reg42}))) : $unsigned((($signed(reg43) | $signed((8'ha1))) || $unsigned((reg58 ?
                      reg57 : reg63)))));
              reg73 <= $signed($unsigned(wire49[(3'h4):(2'h3)]));
              reg74 <= (($signed(reg42[(2'h2):(1'h1)]) ?
                      ((&(reg69 || wire37)) << $signed((|reg40))) : (~(|(reg42 ?
                          reg42 : wire49)))) ?
                  $signed(((7'h41) ? wire37 : $unsigned(reg71))) : wire50);
            end
        end
      reg75 <= wire38;
    end
endmodule
