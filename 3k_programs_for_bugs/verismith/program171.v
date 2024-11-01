module top
#(parameter param210 = (-((^(^~(|(8'hb9)))) ? (((!(8'ha1)) <= (8'ha4)) != (((8'hb3) < (8'hb1)) | ((8'hb0) ? (8'h9c) : (8'ha6)))) : (((|(8'hba)) ? {(8'haa)} : ((7'h40) & (8'hab))) ? (~&((8'ha9) && (8'hae))) : ({(8'ha7), (8'hb8)} ? {(8'ha0)} : (8'hb8))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1f8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire209;
  wire [(4'he):(1'h0)] wire206;
  wire signed [(4'h9):(1'h0)] wire205;
  wire [(3'h7):(1'h0)] wire204;
  wire signed [(4'h8):(1'h0)] wire203;
  wire [(3'h6):(1'h0)] wire174;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire172;
  reg signed [(5'h12):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg201 = (1'h0);
  reg [(5'h13):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg198 = (1'h0);
  reg [(5'h13):(1'h0)] reg197 = (1'h0);
  reg [(2'h3):(1'h0)] reg196 = (1'h0);
  reg [(4'hb):(1'h0)] reg195 = (1'h0);
  reg signed [(4'he):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg193 = (1'h0);
  reg [(4'hb):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg191 = (1'h0);
  reg [(5'h11):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg189 = (1'h0);
  reg [(3'h6):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg186 = (1'h0);
  reg [(5'h12):(1'h0)] reg185 = (1'h0);
  reg [(4'hc):(1'h0)] reg184 = (1'h0);
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg182 = (1'h0);
  reg [(4'h9):(1'h0)] reg181 = (1'h0);
  reg [(5'h10):(1'h0)] reg180 = (1'h0);
  reg [(4'hd):(1'h0)] reg179 = (1'h0);
  reg [(5'h14):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg177 = (1'h0);
  reg [(2'h3):(1'h0)] reg176 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg175 = (1'h0);
  assign y = {wire209,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire174,
                 wire5,
                 wire6,
                 wire7,
                 wire172,
                 reg208,
                 reg207,
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
                 (1'h0)};
  assign wire5 = (wire3[(5'h12):(4'hd)] ?
                     $unsigned(wire2[(2'h3):(2'h2)]) : $signed($unsigned(wire2)));
  assign wire6 = (!(~($signed({wire0, wire4}) ? wire3[(4'hf):(4'hc)] : wire3)));
  assign wire7 = wire2[(3'h4):(2'h2)];
  module8 #() modinst173 (wire172, clk, wire0, wire7, wire3, wire2, wire1);
  assign wire174 = $unsigned($signed($unsigned($unsigned($signed(wire5)))));
  always
    @(posedge clk) begin
      reg175 <= wire172;
      if ($signed(wire2[(4'hb):(4'h9)]))
        begin
          reg176 <= (~$unsigned($unsigned($signed((reg175 ?
              wire174 : wire174)))));
          reg177 <= (wire0 * {((8'ha2) > ({wire0, reg176} == wire0))});
          if (wire1)
            begin
              reg178 <= (wire3 ?
                  (^~$signed(((wire2 == reg175) ?
                      (reg177 ?
                          wire0 : wire2) : $signed(wire3)))) : (~|(((~|reg175) ?
                      wire6[(4'he):(4'he)] : $unsigned((8'had))) >> $unsigned((wire174 ?
                      (8'ha8) : wire4)))));
              reg179 <= (&$unsigned($unsigned(((|wire5) || $unsigned(reg178)))));
            end
          else
            begin
              reg178 <= $unsigned((+reg178));
              reg179 <= $unsigned($signed(wire5[(4'h8):(3'h5)]));
              reg180 <= (reg175[(4'h9):(1'h1)] ?
                  {(-(~&reg175[(4'h9):(3'h4)]))} : (8'ha4));
            end
          reg181 <= {((+reg176) ~^ ({(wire4 <<< reg178)} ?
                  {(~wire5), wire0[(4'ha):(3'h5)]} : reg179))};
          if (wire2[(3'h7):(3'h5)])
            begin
              reg182 <= $unsigned(((wire1 ?
                      $unsigned((^wire3)) : $signed(wire1[(5'h10):(1'h0)])) ?
                  (wire3 - (8'h9d)) : reg179));
            end
          else
            begin
              reg182 <= wire1;
              reg183 <= (7'h43);
              reg184 <= $signed(wire3[(4'hf):(4'hc)]);
              reg185 <= (8'hbf);
              reg186 <= (-(~$signed(wire5)));
            end
        end
      else
        begin
          if (reg185)
            begin
              reg176 <= wire6[(4'h8):(3'h5)];
            end
          else
            begin
              reg176 <= reg178;
              reg177 <= $unsigned((~|$signed({(wire0 ? wire5 : reg182)})));
              reg178 <= reg182;
              reg179 <= $signed($signed($signed({(reg178 ? wire174 : wire2),
                  ((7'h41) ? wire1 : wire5)})));
            end
          reg180 <= $signed(($signed(reg177[(5'h11):(5'h10)]) * ((^~wire172[(2'h2):(2'h2)]) ^ (!reg184))));
          if ($signed((+(reg181[(3'h5):(1'h0)] >> $unsigned(((8'hb4) ?
              wire3 : wire5))))))
            begin
              reg181 <= (reg185[(4'hb):(2'h2)] ?
                  ({(+(7'h40))} <= ($signed($signed(wire1)) ?
                      wire5 : (wire2[(4'hd):(4'hb)] + reg182[(3'h7):(1'h1)]))) : ($unsigned(reg184) && ($unsigned(wire7) != reg178[(4'hc):(3'h4)])));
              reg182 <= (8'hab);
              reg183 <= (({$signed((^wire7))} < reg186[(2'h2):(2'h2)]) ?
                  $unsigned({$signed((reg175 >> wire2))}) : ((wire7[(3'h5):(2'h2)] ?
                      $unsigned({reg180}) : (wire4 ?
                          $unsigned(reg183) : (reg175 ?
                              reg177 : (7'h44)))) >> {wire6,
                      $signed(wire172)}));
              reg184 <= ($unsigned(((reg177[(4'h9):(2'h3)] + (wire5 ?
                      reg183 : reg181)) <= (&{wire1, reg185}))) ?
                  $unsigned(reg182) : ($signed(($signed((8'hba)) <<< (wire1 ?
                          reg176 : wire1))) ?
                      {(reg175[(1'h0):(1'h0)] ?
                              wire6[(2'h2):(2'h2)] : (reg176 == wire7))} : $unsigned($unsigned($signed(reg178)))));
              reg185 <= reg179;
            end
          else
            begin
              reg181 <= $unsigned((~&wire174[(2'h2):(1'h0)]));
              reg182 <= (8'hbd);
              reg183 <= $signed((wire6[(3'h6):(3'h5)] ?
                  ($signed(wire6[(4'ha):(1'h0)]) ?
                      wire174[(1'h1):(1'h0)] : ($signed(reg183) ?
                          {reg185} : $unsigned((8'hac)))) : (~&wire1[(2'h3):(2'h2)])));
              reg184 <= reg184;
            end
        end
      if (((-$signed(wire172)) - (wire174[(2'h3):(2'h2)] + $unsigned(wire5))))
        begin
          reg187 <= ({wire6, (-reg178)} ?
              reg175[(2'h3):(1'h0)] : ((reg182[(4'h9):(3'h5)] * ($unsigned(wire172) ?
                  $unsigned(reg177) : (wire7 + reg182))) <<< $unsigned({(reg180 >>> wire0)})));
          reg188 <= {({((&reg179) ? reg182 : $signed((8'hb8)))} ?
                  (^~(reg177[(4'hc):(2'h3)] ?
                      (reg183 | wire1) : $unsigned(reg185))) : wire0[(4'h8):(2'h3)]),
              {(wire174[(3'h5):(2'h2)] ~^ $unsigned(reg186[(1'h1):(1'h0)])),
                  $unsigned((~^(reg176 ~^ wire6)))}};
          reg189 <= $unsigned({reg176,
              (($unsigned(wire172) ?
                  (wire5 + wire2) : (~|reg180)) <<< reg176)});
        end
      else
        begin
          reg187 <= reg180;
          reg188 <= (+(~$signed(($unsigned(reg177) ? (^~reg188) : {reg177}))));
          reg189 <= (wire3[(4'h8):(3'h4)] | wire4);
        end
      reg190 <= wire6[(3'h5):(3'h4)];
      if (reg190[(4'hb):(3'h6)])
        begin
          if (({(+($signed(wire0) && (reg179 ? reg190 : (8'hb8))))} ?
              wire7[(2'h2):(1'h0)] : ((reg178[(3'h6):(3'h5)] ^ reg179) ?
                  $signed(reg185[(4'h8):(3'h4)]) : {(+{reg188, wire3})})))
            begin
              reg191 <= $signed(wire5[(4'ha):(1'h1)]);
              reg192 <= ($signed($signed(wire1)) ?
                  {{($unsigned(wire174) || (wire7 ? (8'hb0) : wire6))},
                      $signed(($signed(wire3) ?
                          {(8'haf),
                              reg175} : reg187[(2'h2):(1'h1)]))} : (~$unsigned($signed($signed(wire2)))));
            end
          else
            begin
              reg191 <= wire174[(2'h2):(2'h2)];
              reg192 <= $unsigned((wire4[(5'h10):(4'he)] ?
                  ($signed($signed((8'ha8))) ?
                      (8'hb0) : wire0) : (reg182 * $signed(wire7[(2'h2):(1'h0)]))));
              reg193 <= reg181[(4'h9):(2'h3)];
              reg194 <= ((~^(8'hb9)) && reg175);
              reg195 <= $unsigned((&$unsigned((8'hab))));
            end
          reg196 <= ($unsigned(((!wire0) <= reg193)) ?
              (reg179 >>> (&(reg194 ?
                  reg182[(5'h10):(2'h2)] : {(8'hb5)}))) : reg190[(3'h7):(1'h0)]);
          reg197 <= (&reg182);
          if ((reg182[(4'ha):(2'h3)] | ((~(~reg192[(3'h5):(1'h1)])) >>> wire2)))
            begin
              reg198 <= {(!(|($signed((8'hb1)) ?
                      (^~reg178) : reg186[(2'h2):(2'h2)]))),
                  reg193};
              reg199 <= (^~$unsigned((~&({wire3} ?
                  ((8'had) << wire1) : (wire4 ? (7'h41) : reg184)))));
              reg200 <= reg187;
              reg201 <= $unsigned(((((reg192 ?
                      wire1 : (8'hbf)) ^~ (reg182 <<< reg183)) ~^ reg193) ?
                  reg191[(1'h0):(1'h0)] : $unsigned($signed(((8'ha8) <= (8'ha8))))));
            end
          else
            begin
              reg198 <= reg190[(4'he):(4'he)];
              reg199 <= reg198[(3'h5):(1'h1)];
            end
          reg202 <= (7'h44);
        end
      else
        begin
          if ((!reg202))
            begin
              reg191 <= (^($unsigned((~&$signed(reg189))) ^ reg182));
              reg192 <= {($unsigned(reg185) ?
                      ((&reg195) + {$signed(reg175)}) : wire4)};
              reg193 <= (8'ha1);
            end
          else
            begin
              reg191 <= wire0[(5'h11):(4'hb)];
              reg192 <= (reg188 > $signed({(~^{wire172, reg200})}));
              reg193 <= $unsigned($signed(reg183));
              reg194 <= (($unsigned(reg192[(1'h0):(1'h0)]) ?
                  $unsigned((reg189[(1'h1):(1'h1)] >> {reg175,
                      (7'h44)})) : {reg187,
                      $unsigned($unsigned(reg190))}) > $signed(($unsigned($unsigned(wire0)) ?
                  $unsigned(reg191[(3'h4):(3'h4)]) : {(wire4 ~^ (8'had)),
                      reg182})));
            end
          reg195 <= (reg199[(3'h6):(2'h2)] >> reg195);
          reg196 <= {(reg185[(5'h10):(1'h1)] ?
                  reg178[(5'h11):(4'h8)] : $signed(reg197)),
              ($signed((((8'ha9) ? reg201 : wire172) + (8'haf))) ?
                  {$unsigned(reg175[(3'h5):(2'h3)]),
                      {$signed(wire5)}} : wire3)};
        end
    end
  assign wire203 = $signed({(|{reg194, (wire1 ? reg178 : wire1)})});
  assign wire204 = $unsigned($signed((^~$signed(wire7[(4'h8):(3'h4)]))));
  assign wire205 = ($signed(($signed((reg195 << wire0)) && ($signed(wire174) && reg182[(4'hf):(3'h7)]))) << ((|((8'hab) < reg179[(4'hb):(2'h2)])) | wire174[(1'h1):(1'h0)]));
  assign wire206 = (8'ha4);
  always
    @(posedge clk) begin
      reg207 <= {$unsigned((reg187[(3'h4):(2'h3)] ?
              $signed((~|wire5)) : $unsigned((reg180 ? (8'haa) : reg199)))),
          wire2};
      reg208 <= $signed($signed((|({reg193,
          reg187} <<< reg198[(2'h2):(1'h0)]))));
    end
  assign wire209 = reg186[(3'h5):(3'h5)];
endmodule

module module8
#(parameter param171 = {{((((8'h9f) >>> (8'hb6)) ? (8'hae) : ((8'h9d) ^ (8'hbf))) >> (((8'hb3) != (8'ha8)) <= ((8'ha6) <= (8'hbf)))), (^~(~^((8'hb2) > (7'h44))))}, ({({(8'hbc), (8'hbc)} ^ ((8'ha9) || (8'ha7)))} <= (8'ha4))})
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h219):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire13;
  input wire [(3'h4):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire170;
  wire signed [(5'h13):(1'h0)] wire169;
  wire signed [(4'hf):(1'h0)] wire153;
  wire [(2'h2):(1'h0)] wire152;
  wire signed [(5'h14):(1'h0)] wire151;
  wire [(4'h9):(1'h0)] wire149;
  wire signed [(5'h10):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire96;
  reg signed [(5'h15):(1'h0)] reg168 = (1'h0);
  reg [(5'h10):(1'h0)] reg167 = (1'h0);
  reg [(4'hc):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg165 = (1'h0);
  reg [(4'h8):(1'h0)] reg164 = (1'h0);
  reg [(5'h15):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg161 = (1'h0);
  reg [(4'hb):(1'h0)] reg160 = (1'h0);
  reg [(4'hb):(1'h0)] reg159 = (1'h0);
  reg [(5'h14):(1'h0)] reg158 = (1'h0);
  reg [(3'h4):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  assign y = {wire170,
                 wire169,
                 wire153,
                 wire152,
                 wire151,
                 wire149,
                 wire54,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire15,
                 wire14,
                 wire56,
                 wire57,
                 wire58,
                 wire70,
                 wire72,
                 wire96,
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
                 (1'h0)};
  assign wire14 = (!wire11);
  assign wire15 = (^~(!wire14[(2'h3):(2'h2)]));
  module16 #() modinst29 (.wire20(wire13), .wire19(wire15), .y(wire28), .wire17(wire11), .wire18(wire12), .clk(clk));
  assign wire30 = $signed((-$unsigned((~$signed(wire28)))));
  assign wire31 = (7'h41);
  assign wire32 = (-(~|wire28));
  assign wire33 = (+$signed($unsigned({$unsigned(wire28),
                      ((8'hbc) >>> wire11)})));
  assign wire34 = $unsigned($unsigned(wire32));
  assign wire35 = ({wire30, wire30} ?
                      $unsigned(wire12[(3'h4):(1'h0)]) : $signed($unsigned((8'ha9))));
  module36 #() modinst55 (wire54, clk, wire34, wire15, wire14, wire11, wire31);
  assign wire56 = {$signed(($signed($signed((8'ha1))) ?
                          ((wire15 ?
                              wire28 : wire54) ~^ $signed(wire12)) : (wire14 << wire28))),
                      (wire9 <<< ({$unsigned(wire9)} | $unsigned($unsigned(wire13))))};
  assign wire57 = (+wire10[(3'h7):(3'h4)]);
  assign wire58 = wire57[(3'h5):(1'h1)];
  module59 #() modinst71 (wire70, clk, wire15, wire32, wire33, wire28);
  assign wire72 = $signed({(wire14[(2'h3):(1'h1)] ? wire54 : $signed(wire33))});
  module73 #() modinst97 (.wire78(wire33), .wire76(wire54), .wire74(wire34), .wire75(wire28), .clk(clk), .y(wire96), .wire77(wire58));
  module98 #() modinst150 (wire149, clk, wire35, wire70, wire10, wire56);
  assign wire151 = $unsigned($signed(wire30));
  assign wire152 = wire58[(5'h11):(3'h5)];
  assign wire153 = ((($unsigned($unsigned(wire10)) ?
                       {wire54} : (&wire70[(4'hf):(3'h6)])) ~^ (wire149 ?
                       wire14 : $signed((wire54 ?
                           wire9 : (8'ha7))))) - wire32[(4'hd):(3'h5)]);
  always
    @(posedge clk) begin
      if ($signed((&wire9[(2'h3):(1'h1)])))
        begin
          reg154 <= (wire34 ^ (wire32[(3'h5):(2'h2)] ^~ wire96[(4'hd):(3'h7)]));
          reg155 <= $unsigned(((((wire56 ? (7'h42) : wire149) || (wire12 ?
                  wire96 : wire33)) ?
              $unsigned($signed((8'ha0))) : wire70[(4'h8):(4'h8)]) ^ wire30));
          reg156 <= {({$signed($signed(reg154))} == {(wire10 <<< $unsigned(reg154)),
                  $unsigned($signed(wire151))}),
              {$unsigned({wire10, $unsigned(wire28)})}};
        end
      else
        begin
          if (((~$signed(((wire31 ? wire57 : wire10) ?
              $signed(wire32) : (wire153 ?
                  reg156 : wire9)))) * ({(~&$signed((8'hbe)))} < wire57[(3'h7):(3'h7)])))
            begin
              reg154 <= (wire14 & wire10);
              reg155 <= wire35;
              reg156 <= {wire30};
            end
          else
            begin
              reg154 <= ($signed((wire28 & $unsigned({reg156}))) ?
                  wire149 : wire35[(1'h1):(1'h0)]);
              reg155 <= wire15;
            end
          if ((~|$unsigned({wire33})))
            begin
              reg157 <= wire32;
              reg158 <= $signed((wire72[(3'h7):(3'h4)] ?
                  (^~((7'h44) ?
                      {wire56,
                          (8'hb8)} : $signed(wire58))) : (((~wire32) * (~^wire14)) ?
                      (^$signed(reg156)) : (wire72 >>> (wire72 >= wire72)))));
              reg159 <= wire151;
              reg160 <= wire57;
            end
          else
            begin
              reg157 <= {(-(reg155[(3'h4):(1'h1)] > ($unsigned(wire30) ?
                      wire57 : {(8'ha4)}))),
                  $signed((wire31[(3'h4):(1'h0)] ?
                      $signed((!wire11)) : $signed((wire35 > reg157))))};
              reg158 <= reg154;
              reg159 <= (wire70[(4'hc):(2'h2)] | (!((|(reg155 >= wire33)) > wire72)));
            end
          reg161 <= (~wire72[(1'h1):(1'h0)]);
          if (reg157)
            begin
              reg162 <= (($unsigned({((8'hb9) >> wire58)}) ?
                      $unsigned((-(reg157 ? wire70 : wire152))) : reg158) ?
                  ({(|(~wire34))} ?
                      (!((^(8'hae)) == $unsigned(reg161))) : $unsigned({wire13,
                          $signed(reg156)})) : (($unsigned(wire28) ^~ (!((8'hbd) ?
                          reg155 : wire31))) ?
                      wire11 : ((&wire13) * (~$signed(wire9)))));
              reg163 <= (8'hb2);
              reg164 <= reg162[(1'h1):(1'h1)];
              reg165 <= $signed($signed(reg164));
              reg166 <= {reg161,
                  $unsigned((reg160 ?
                      $signed((-(7'h41))) : $unsigned($unsigned(reg157))))};
            end
          else
            begin
              reg162 <= {wire54[(4'h9):(3'h6)],
                  $unsigned({wire33[(4'he):(4'ha)]})};
              reg163 <= $unsigned(wire12);
              reg164 <= $signed($unsigned((+((8'hb0) < wire33))));
            end
          reg167 <= (&$unsigned(((wire152[(1'h1):(1'h1)] | (8'ha1)) < (^~(8'hbe)))));
        end
      reg168 <= $signed(wire153);
    end
  assign wire169 = ({$unsigned(wire35)} ?
                       (($signed({wire14, (8'ha7)}) - wire35) ?
                           $signed($signed((reg167 ?
                               reg156 : wire15))) : (wire13 - ((reg164 << reg162) ?
                               reg165[(2'h3):(1'h1)] : $signed(wire58)))) : wire54[(4'hc):(3'h4)]);
  assign wire170 = (~|(~|{($unsigned((8'ha7)) ? (^reg162) : $signed(reg154)),
                       $signed(((8'hbd) > reg168))}));
endmodule

module module98
#(parameter param148 = {(!((((8'h9f) ? (8'ha6) : (8'hb9)) >> ((8'ha5) >>> (8'hb0))) <<< ((^(8'hbd)) ? (8'ha4) : {(8'h9c)})))})
(y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'h203):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire102;
  input wire signed [(5'h11):(1'h0)] wire101;
  input wire signed [(4'ha):(1'h0)] wire100;
  input wire signed [(4'hd):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire144;
  wire [(5'h15):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire131;
  wire [(3'h5):(1'h0)] wire116;
  wire signed [(4'h9):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire108;
  wire [(4'hb):(1'h0)] wire107;
  wire [(2'h3):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire104;
  wire [(3'h5):(1'h0)] wire103;
  reg [(5'h11):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg140 = (1'h0);
  reg [(2'h2):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg138 = (1'h0);
  reg [(3'h4):(1'h0)] reg137 = (1'h0);
  reg [(5'h10):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  assign y = {wire147,
                 wire144,
                 wire141,
                 wire131,
                 wire116,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 reg146,
                 reg145,
                 reg143,
                 reg142,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
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
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire103 = ((((&$unsigned((8'hb6))) >> (8'hbd)) ?
                       $signed({wire99}) : (-(wire102[(5'h11):(1'h0)] ?
                           (wire102 ?
                               wire101 : wire102) : $signed((8'h9f))))) | ((~wire99[(1'h0):(1'h0)]) ^~ ($unsigned((wire102 ?
                           wire99 : wire101)) ?
                       wire101[(4'hb):(3'h4)] : $signed({wire101}))));
  assign wire104 = ({wire103} ?
                       (wire100[(3'h6):(2'h3)] ?
                           $unsigned(($unsigned((8'ha5)) ?
                               (wire100 ?
                                   (8'haa) : wire99) : wire100[(3'h6):(3'h5)])) : ((~wire99) != (~|wire101))) : ($unsigned((^~wire99)) < $unsigned((wire100 >>> {wire99,
                           wire103}))));
  assign wire105 = {(~|(8'ha1)), wire104[(4'hf):(4'h8)]};
  assign wire106 = $signed(wire105);
  assign wire107 = $unsigned(((+$signed((8'hb6))) & ((!$unsigned(wire100)) ^ $signed({(7'h42),
                       wire106}))));
  assign wire108 = $signed(wire107);
  assign wire109 = $signed((-{$unsigned($unsigned(wire99))}));
  always
    @(posedge clk) begin
      if ((wire101[(3'h6):(2'h2)] ?
          $signed({($signed(wire102) | {wire99})}) : wire109))
        begin
          reg110 <= wire109[(3'h4):(1'h1)];
        end
      else
        begin
          reg110 <= ({(^~(!((7'h42) ? wire109 : reg110))),
              ({$signed(wire106)} ?
                  {(wire103 ? (8'hac) : wire103),
                      (wire104 > wire108)} : $signed(wire103))} << (wire106 ?
              $signed((~^wire103[(2'h3):(2'h2)])) : $unsigned(wire102[(3'h5):(2'h3)])));
          reg111 <= wire103[(2'h2):(1'h1)];
          reg112 <= wire100;
          reg113 <= ((((wire104 != (+wire109)) ?
              wire108[(3'h5):(2'h3)] : wire102[(3'h5):(3'h4)]) * ((~&(-wire105)) ?
              wire103 : $unsigned((wire108 <<< wire104)))) && $unsigned($unsigned($signed(wire100))));
          reg114 <= ($signed({((reg112 <= reg110) ?
                  $signed(reg113) : $unsigned(wire109)),
              (|wire109[(4'h8):(1'h1)])}) || $signed((((!reg111) ?
                  $unsigned((8'ha5)) : $unsigned((8'hac))) ?
              $unsigned(reg111) : reg113[(4'h9):(2'h3)])));
        end
      reg115 <= wire101;
    end
  assign wire116 = (reg112 == (&$signed((wire101 ^ (wire101 ?
                       reg113 : reg115)))));
  always
    @(posedge clk) begin
      if ((~|$signed($unsigned(({wire104} ^ {(8'h9d)})))))
        begin
          if ((&(wire101[(1'h1):(1'h0)] ?
              {wire104, $signed((wire105 != reg113))} : $signed(((8'hb7) ?
                  $signed(reg111) : wire107[(3'h7):(1'h1)])))))
            begin
              reg117 <= reg113[(4'h9):(3'h6)];
              reg118 <= ((wire102[(5'h12):(4'hc)] * (wire104[(5'h11):(4'hb)] ?
                  (~|reg115[(4'h8):(1'h1)]) : (~{wire101}))) & (^$signed(($unsigned(wire102) ?
                  (wire108 ? wire99 : reg115) : $signed((8'hb1))))));
            end
          else
            begin
              reg117 <= reg114[(4'hb):(2'h2)];
              reg118 <= reg117;
              reg119 <= ($signed($unsigned($signed((reg117 ?
                  (8'ha5) : wire103)))) >= ($signed($signed(((8'hbd) ~^ wire101))) ?
                  $signed($unsigned(reg115[(3'h7):(3'h5)])) : $signed((reg112[(2'h2):(1'h0)] ?
                      wire108 : {wire102}))));
            end
          reg120 <= $signed($unsigned($signed(reg111[(5'h12):(4'hd)])));
          if ($signed($unsigned($unsigned((|$signed((7'h43)))))))
            begin
              reg121 <= reg114[(3'h5):(2'h2)];
            end
          else
            begin
              reg121 <= (reg115 | $signed((~&((!wire102) ?
                  $signed(wire106) : (~^wire100)))));
              reg122 <= (+($unsigned($signed(((8'had) ^~ (7'h40)))) ?
                  {reg111, $signed(wire103[(2'h3):(1'h0)])} : wire105));
              reg123 <= $unsigned((~^$signed((wire105 ?
                  (reg114 >>> wire105) : wire104))));
              reg124 <= (|((wire100[(2'h3):(1'h1)] ?
                      reg114 : $signed((wire107 ? wire107 : reg121))) ?
                  wire106 : reg111));
              reg125 <= ($unsigned(reg117) > $unsigned(reg122));
            end
          reg126 <= wire109;
          reg127 <= reg119[(1'h0):(1'h0)];
        end
      else
        begin
          if ((~|$unsigned(wire101)))
            begin
              reg117 <= $signed(reg127[(3'h5):(2'h2)]);
              reg118 <= ((((~(+(8'ha7))) ?
                      (~&wire102[(3'h5):(1'h1)]) : wire106) ?
                  {$unsigned(wire102[(4'h9):(2'h3)])} : $unsigned(($signed((8'hb0)) != reg124[(4'hb):(3'h7)]))) ~^ wire102);
              reg119 <= $signed($signed((reg117[(2'h3):(1'h1)] <= (+{reg124,
                  reg112}))));
              reg120 <= (8'hae);
            end
          else
            begin
              reg117 <= reg113[(1'h0):(1'h0)];
              reg118 <= ($signed((!(~|$unsigned(reg118)))) >>> (|$unsigned({$signed(reg120)})));
              reg119 <= (reg113 + (^~$unsigned(($signed(reg111) ?
                  (reg117 ? wire116 : wire102) : $signed(reg121)))));
              reg120 <= reg125;
            end
          reg121 <= {(8'hbd),
              (($signed($unsigned(reg111)) ~^ $unsigned((reg127 || reg110))) ?
                  reg125 : $unsigned(reg115[(4'hf):(4'h9)]))};
        end
      reg128 <= $signed(wire116[(3'h4):(1'h1)]);
      reg129 <= $unsigned((~|(^~reg128[(3'h4):(2'h3)])));
      reg130 <= ((~|{$unsigned($unsigned(reg113)),
          ({reg111, (8'hb3)} + $unsigned((8'ha5)))}) != reg114[(3'h4):(2'h2)]);
    end
  assign wire131 = ((8'h9d) >>> ((!reg120) ?
                       $unsigned(((|reg121) ~^ $signed(wire100))) : (({wire100,
                                   reg129} ?
                               $signed(reg128) : reg130[(5'h12):(3'h6)]) ?
                           ((reg120 ? wire104 : reg115) ?
                               reg124 : ((7'h43) ?
                                   wire104 : reg127)) : wire106)));
  always
    @(posedge clk) begin
      reg132 <= ((!$signed(({reg128, wire103} ?
              (|reg125) : reg117[(3'h7):(3'h6)]))) ?
          (~$signed(wire101)) : $unsigned((reg113[(3'h5):(1'h1)] & ((wire102 ?
                  wire101 : reg113) ?
              {(8'ha9), wire104} : wire104))));
      reg133 <= (~reg130);
    end
  always
    @(posedge clk) begin
      if ((-(!reg130[(4'hd):(4'hb)])))
        begin
          if ((~&$unsigned((~|reg130))))
            begin
              reg134 <= $unsigned($unsigned(wire105[(4'h8):(1'h1)]));
              reg135 <= ({reg130[(5'h12):(4'hf)], reg124} + ((~^(+{reg120,
                      reg126})) ?
                  (8'ha6) : reg130));
              reg136 <= $unsigned(reg129);
              reg137 <= {$signed(reg113[(1'h1):(1'h0)]), reg115};
            end
          else
            begin
              reg134 <= $signed($signed(reg114[(2'h2):(1'h0)]));
              reg135 <= {(reg133[(1'h1):(1'h0)] == $signed(($unsigned(reg128) ?
                      reg118 : {reg132})))};
            end
          reg138 <= {reg133[(3'h4):(3'h4)], reg111};
        end
      else
        begin
          if (($unsigned((8'hb6)) ?
              (~|(($signed(wire102) ?
                      reg135[(3'h5):(3'h5)] : (wire101 ? wire108 : reg126)) ?
                  $signed((wire100 && reg114)) : ((~|reg138) ?
                      wire99[(2'h3):(1'h0)] : (-reg127)))) : ($signed($signed((!(8'hb6)))) ?
                  reg138 : wire108)))
            begin
              reg134 <= $signed({reg128[(4'hc):(3'h5)]});
              reg135 <= reg114;
              reg136 <= (8'ha9);
              reg137 <= reg133[(3'h4):(2'h3)];
              reg138 <= reg138[(3'h7):(3'h5)];
            end
          else
            begin
              reg134 <= ({((~^{reg132, reg133}) > reg137[(3'h4):(3'h4)]),
                      ($unsigned(reg128) == reg121)} ?
                  reg138 : {($unsigned(reg113[(1'h1):(1'h1)]) ?
                          (~&{wire104}) : ((wire108 ?
                              reg129 : reg136) ^~ $signed(reg132))),
                      (~^wire101)});
              reg135 <= reg121;
            end
        end
      reg139 <= (wire100 < $signed({(reg134 ?
              $unsigned(wire104) : (wire101 ? reg127 : (8'hb2)))}));
      reg140 <= $unsigned(reg118);
    end
  assign wire141 = $signed(reg124);
  always
    @(posedge clk) begin
      reg142 <= wire109[(3'h5):(2'h3)];
      reg143 <= $unsigned($signed((^~(8'h9f))));
    end
  assign wire144 = $unsigned({(reg114 > (~&reg129[(1'h0):(1'h0)]))});
  always
    @(posedge clk) begin
      reg145 <= reg135;
      reg146 <= wire105[(1'h0):(1'h0)];
    end
  assign wire147 = $signed($signed({((-reg112) | (reg124 ^~ (8'ha5)))}));
endmodule

module module73  (y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire78;
  input wire [(5'h11):(1'h0)] wire77;
  input wire [(5'h10):(1'h0)] wire76;
  input wire signed [(4'h9):(1'h0)] wire75;
  input wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire89;
  wire [(2'h3):(1'h0)] wire88;
  wire [(3'h5):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire79;
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire79 = wire77;
  assign wire80 = $signed(wire79[(3'h4):(2'h2)]);
  assign wire81 = $unsigned(wire78);
  assign wire82 = ((wire76[(4'ha):(3'h7)] != $unsigned(wire81[(1'h0):(1'h0)])) ?
                      ($signed((wire75 ?
                          wire77[(3'h4):(2'h3)] : $unsigned((8'hab)))) << (-(^~{wire75}))) : (|($signed(wire76) ?
                          ({wire78} ?
                              wire74 : wire76[(4'hb):(3'h4)]) : wire75[(1'h0):(1'h0)])));
  assign wire83 = wire75;
  assign wire84 = ((^(wire77 || (8'hb5))) ?
                      (wire77[(4'hd):(3'h7)] + (|wire78[(3'h6):(2'h3)])) : wire76);
  always
    @(posedge clk) begin
      reg85 <= wire79[(2'h2):(2'h2)];
      reg86 <= $signed((^(-wire78[(4'h9):(1'h1)])));
    end
  assign wire87 = reg85[(2'h2):(2'h2)];
  assign wire88 = ((wire82[(4'h8):(3'h4)] ?
                      wire82[(1'h0):(1'h0)] : ((^~(wire78 | reg85)) <<< wire75[(3'h5):(3'h5)])) ^ wire84);
  assign wire89 = $unsigned($unsigned(wire77));
  assign wire90 = (wire79[(4'he):(1'h0)] ?
                      wire74[(4'hf):(3'h5)] : (~&$unsigned(wire87)));
  assign wire91 = (+(~$unsigned(((wire79 ? wire75 : wire82) ?
                      $unsigned(wire83) : wire78))));
  assign wire92 = ($signed(wire87[(2'h3):(1'h1)]) >> wire88[(1'h1):(1'h1)]);
  assign wire93 = $unsigned(wire91);
  assign wire94 = (wire88 >> wire75);
  assign wire95 = (!wire91[(5'h14):(4'h8)]);
endmodule

module module59
#(parameter param68 = (((!((~&(8'hb1)) ? {(8'hb0), (7'h42)} : ((8'hab) ? (8'ha7) : (8'h9f)))) + (+((~(8'hb9)) ? ((7'h42) * (8'h9d)) : ((8'hac) ? (8'ha8) : (8'ha5))))) | (((((8'hb7) ~^ (8'hb6)) - (~|(8'ha8))) ? {((8'h9c) < (8'ha1)), (-(8'ha4))} : ((~^(8'hbc)) ? ((8'h9c) ? (8'ha3) : (8'ha0)) : ((8'hbd) ? (8'hb2) : (7'h40)))) ^ (^~(((8'hbb) ? (8'hb2) : (8'hbf)) != ((8'hb2) < (8'hb6)))))), 
parameter param69 = (|({(~param68), {(8'had)}} ? (((param68 ^~ param68) ? param68 : (param68 ? param68 : param68)) ? ((!param68) ? ((8'ha1) | param68) : (~(8'h9f))) : ((param68 * (8'haf)) <= (param68 ~^ param68))) : (8'hb6))))
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire63;
  input wire signed [(4'hf):(1'h0)] wire62;
  input wire signed [(4'hc):(1'h0)] wire61;
  input wire [(5'h15):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  assign y = {wire67, wire66, wire65, wire64, (1'h0)};
  assign wire64 = {wire61[(3'h7):(3'h5)]};
  assign wire65 = wire64[(4'ha):(3'h5)];
  assign wire66 = (((^~(-wire60)) < ({$unsigned((8'ha1))} - wire61[(1'h1):(1'h0)])) ?
                      wire64[(1'h0):(1'h0)] : (({wire60, (wire64 & wire61)} ?
                          wire64[(4'h9):(3'h7)] : (wire62[(4'h9):(1'h1)] < $signed((8'h9f)))) >>> wire63[(2'h3):(1'h1)]));
  assign wire67 = $unsigned(wire63);
endmodule

module module36  (y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire41;
  input wire [(5'h15):(1'h0)] wire40;
  input wire [(5'h13):(1'h0)] wire39;
  input wire [(2'h3):(1'h0)] wire38;
  input wire [(4'h9):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  assign y = {wire52,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg53,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire42 = wire40;
  assign wire43 = $signed(wire39);
  assign wire44 = ($signed((wire40[(4'ha):(4'h9)] ~^ wire43)) <<< {wire37[(1'h1):(1'h1)],
                      wire39});
  assign wire45 = (-{{{$unsigned((8'hb9)), $signed(wire38)}, wire39},
                      wire41[(2'h2):(1'h1)]});
  assign wire46 = (((wire39[(1'h0):(1'h0)] + $unsigned({wire39})) <<< ($unsigned($unsigned(wire44)) ^ (wire38 && wire43))) ^ $unsigned(wire45[(3'h6):(3'h4)]));
  assign wire47 = wire43[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg48 <= $unsigned(($signed($unsigned((wire43 ?
          wire45 : wire45))) * $unsigned({(wire45 ? wire45 : wire46)})));
      reg49 <= (($signed(wire45) ?
              (^~wire41[(2'h3):(2'h2)]) : $unsigned(wire40[(4'hd):(4'hb)])) ?
          ($signed($signed($unsigned(reg48))) >> ((wire43 ?
              (wire40 > wire44) : wire47) <<< $unsigned($signed(wire42)))) : wire38[(1'h1):(1'h1)]);
      reg50 <= wire45;
      reg51 <= ((-($signed(((8'hb2) >= wire38)) ?
              ((wire43 >= wire38) ?
                  (|wire45) : wire44) : $signed(((8'h9f) < wire47)))) ?
          (~^wire46[(3'h6):(1'h1)]) : (+wire39[(4'ha):(4'h8)]));
    end
  assign wire52 = wire46[(5'h11):(1'h0)];
  always
    @(posedge clk) begin
      reg53 <= $unsigned((8'h9e));
    end
endmodule

module module16
#(parameter param27 = (((^~(8'hb7)) ? {(((8'ha3) ~^ (8'hb3)) ? ((7'h41) || (8'had)) : ((8'hb2) >= (8'hb7)))} : ({((8'ha2) ? (8'hbe) : (8'ha9))} == (((7'h41) ? (8'hb4) : (8'ha4)) > ((8'hb3) < (8'hac))))) >> (({(&(8'hb1))} * ((|(8'hb4)) ? (~|(8'hb9)) : (~&(8'hac)))) > {(~|((7'h40) || (8'haa)))})))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire signed [(3'h5):(1'h0)] wire19;
  input wire signed [(3'h4):(1'h0)] wire18;
  input wire signed [(3'h4):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  assign y = {wire26, wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = ($signed({wire18[(3'h4):(1'h0)]}) ?
                      $signed(wire19) : (~^wire18));
  assign wire22 = wire17;
  assign wire23 = $unsigned(wire17[(3'h4):(3'h4)]);
  assign wire24 = wire22;
  assign wire25 = (~|wire23[(1'h1):(1'h1)]);
  assign wire26 = ($unsigned($unsigned($signed((wire21 ?
                      wire19 : wire23)))) < ((((wire18 ?
                      wire18 : wire21) ~^ wire19) == (wire22 ?
                      (&wire23) : (wire24 ? wire21 : (8'h9f)))) || ((8'hba) ?
                      (wire17[(3'h4):(1'h0)] ?
                          (|wire23) : wire25[(1'h0):(1'h0)]) : $signed(wire18))));
endmodule
