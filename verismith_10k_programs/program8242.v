module top
#(parameter param206 = ((-((^~((8'ha0) ? (8'ha1) : (8'ha0))) << (^(^(8'hb4))))) ^ {{(((8'hac) ? (8'h9d) : (8'hb3)) ^ (~^(8'hbf))), ({(8'hae)} ? ((8'ha9) <= (8'hb5)) : {(8'ha3)})}}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1f3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire204;
  wire [(4'h8):(1'h0)] wire203;
  wire signed [(5'h15):(1'h0)] wire201;
  wire [(4'hf):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire128;
  reg [(3'h7):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg162 = (1'h0);
  reg [(5'h14):(1'h0)] reg161 = (1'h0);
  reg [(5'h10):(1'h0)] reg160 = (1'h0);
  reg [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(3'h7):(1'h0)] reg156 = (1'h0);
  reg signed [(4'he):(1'h0)] reg155 = (1'h0);
  reg [(4'hb):(1'h0)] reg154 = (1'h0);
  reg [(4'hd):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg143 = (1'h0);
  reg signed [(4'he):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(4'hc):(1'h0)] reg134 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  assign y = {wire204,
                 wire203,
                 wire201,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire22,
                 wire24,
                 wire128,
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
                 (1'h0)};
  assign wire4 = wire1[(4'hc):(3'h5)];
  assign wire5 = (!$signed((^~((wire1 | wire4) ? (wire3 || wire1) : wire4))));
  assign wire6 = wire3[(1'h1):(1'h1)];
  assign wire7 = {($signed(($unsigned(wire4) ~^ $unsigned(wire4))) ?
                         ((-{wire3, wire2}) ?
                             $unsigned((wire5 - wire6)) : wire5) : (((~&wire6) ?
                             $signed(wire6) : $signed((8'ha8))) <<< $unsigned($unsigned(wire6))))};
  module8 #() modinst23 (.y(wire22), .wire12(wire4), .wire11(wire1), .wire9(wire5), .clk(clk), .wire10(wire3));
  assign wire24 = (8'haf);
  module25 #() modinst129 (wire128, clk, wire24, wire22, wire5, wire0, wire2);
  always
    @(posedge clk) begin
      reg130 <= wire5;
      reg131 <= wire7;
      reg132 <= wire1;
      if ($signed(wire7))
        begin
          if ((8'ha0))
            begin
              reg133 <= (^~$signed(({(&wire7)} ?
                  (8'hbb) : $unsigned({wire1}))));
              reg134 <= (((wire3[(4'hb):(1'h1)] ?
                          wire0[(5'h11):(4'hd)] : ((~wire7) <= (wire24 ^ reg132))) ?
                      ((wire0 ?
                              $unsigned((8'hb0)) : (reg130 ?
                                  wire22 : (8'hb2))) ?
                          ((wire24 << reg130) ?
                              wire22 : {wire2}) : ($signed(wire128) >= {reg133})) : reg132) ?
                  wire24[(4'h8):(2'h2)] : $signed(wire7[(3'h4):(1'h1)]));
              reg135 <= $signed(($signed(reg134) ?
                  {$signed(wire6),
                      $signed((wire6 ^~ wire2))} : $signed(($unsigned(wire1) - reg131))));
              reg136 <= (^~wire5);
              reg137 <= wire1[(3'h6):(1'h1)];
            end
          else
            begin
              reg133 <= $unsigned($signed(({wire6[(2'h2):(2'h2)],
                  (wire7 ~^ reg130)} | $unsigned(reg135[(3'h6):(2'h3)]))));
              reg134 <= $unsigned(((wire22[(5'h10):(2'h2)] < (~|$unsigned((8'hb6)))) <= reg135));
              reg135 <= $signed(wire22[(1'h1):(1'h0)]);
              reg136 <= (((8'ha2) ^ $signed(wire1[(5'h12):(2'h3)])) ?
                  $signed(((8'hb5) ?
                      $unsigned((wire2 <= wire5)) : ((reg135 ?
                              (8'hab) : wire0) ?
                          (reg130 >= reg132) : (8'ha2)))) : $unsigned((^~$signed(wire128[(4'hf):(4'hf)]))));
            end
          reg138 <= (-wire4);
          if ((!reg137[(5'h13):(5'h10)]))
            begin
              reg139 <= wire5[(2'h2):(1'h1)];
            end
          else
            begin
              reg139 <= (^$signed((((wire4 - wire0) >>> $signed(wire22)) ?
                  ({wire5} - (~wire22)) : $signed((wire1 + (8'hb3))))));
              reg140 <= (($signed($signed((reg130 ? wire24 : wire3))) ?
                  reg138[(1'h1):(1'h0)] : $signed((reg130[(1'h1):(1'h0)] ?
                      wire3[(2'h3):(1'h0)] : $unsigned((8'haf))))) ^ wire0);
              reg141 <= ((wire128 | reg134) ? reg132[(4'h9):(2'h3)] : wire1);
              reg142 <= reg133;
              reg143 <= (({$unsigned((wire6 <<< reg133)), wire6} ?
                  $signed(wire7[(2'h2):(1'h1)]) : $unsigned(reg130)) ^~ $signed(wire3));
            end
          reg144 <= wire0;
          reg145 <= (~&$signed($unsigned($signed((wire0 >>> reg137)))));
        end
      else
        begin
          reg133 <= wire6;
          reg134 <= {(~{$unsigned(wire24)}), $unsigned(reg138)};
          reg135 <= ($unsigned($unsigned({(reg136 ? wire4 : wire7),
              $signed(wire7)})) << $unsigned((8'hae)));
          if ($signed($unsigned($signed(reg132))))
            begin
              reg136 <= $unsigned(reg140[(3'h7):(2'h2)]);
              reg137 <= $signed($signed((&$unsigned($signed(reg136)))));
              reg138 <= $signed(reg135[(4'ha):(1'h1)]);
              reg139 <= {reg130,
                  $unsigned($signed({wire4, $unsigned(reg141)}))};
              reg140 <= reg140;
            end
          else
            begin
              reg136 <= (reg145 != (~&wire6[(2'h3):(2'h3)]));
              reg137 <= ({wire22} ? wire4 : reg142);
            end
          if ((reg141 >> {(^~$unsigned($unsigned((8'ha4)))),
              $unsigned((~(reg132 || reg140)))}))
            begin
              reg141 <= $signed($signed(reg135));
              reg142 <= $unsigned(($signed(wire7) != {(reg135[(2'h2):(1'h0)] + wire6[(1'h0):(1'h0)]),
                  reg143}));
              reg143 <= reg144;
              reg144 <= $signed((-wire4));
            end
          else
            begin
              reg141 <= $unsigned((~&reg144));
              reg142 <= (8'hb5);
            end
        end
      reg146 <= (reg135 ?
          {(~|$unsigned((~&reg139))),
              $unsigned($signed((^~reg134)))} : (^$unsigned((~|reg140))));
    end
  always
    @(posedge clk) begin
      reg147 <= reg146[(3'h7):(3'h6)];
      reg148 <= (^$signed(((^~reg140) ? reg138 : reg130)));
      if ($unsigned(reg140))
        begin
          reg149 <= (reg137[(1'h1):(1'h1)] == reg134[(1'h0):(1'h0)]);
          reg150 <= reg133[(3'h7):(3'h7)];
          reg151 <= $signed(reg138[(1'h0):(1'h0)]);
          if ($unsigned(wire4))
            begin
              reg152 <= {wire24[(2'h3):(2'h3)]};
              reg153 <= (&($signed(wire24[(2'h3):(1'h0)]) ?
                  (|$unsigned((^~(7'h41)))) : (!((reg151 ? reg152 : wire1) ?
                      reg152[(1'h1):(1'h1)] : $signed(wire5)))));
              reg154 <= {((wire4[(1'h0):(1'h0)] ?
                      {(~reg145)} : reg133[(3'h7):(3'h6)]) ~^ $unsigned($signed(((8'hb7) | wire5))))};
              reg155 <= (8'hb5);
            end
          else
            begin
              reg152 <= (8'h9f);
            end
          reg156 <= ($unsigned(reg144[(4'h8):(3'h7)]) >= (+reg150));
        end
      else
        begin
          if (reg149)
            begin
              reg149 <= (~(~$signed((reg137[(3'h7):(3'h6)] > (wire4 * wire0)))));
            end
          else
            begin
              reg149 <= reg136;
              reg150 <= $unsigned((($signed((-(8'hbd))) ?
                      ((wire5 - (8'hac)) >>> (~&reg132)) : wire5) ?
                  (((8'hae) ? wire6[(1'h0):(1'h0)] : (~|wire1)) ?
                      wire0[(3'h6):(3'h6)] : ($unsigned((7'h40)) ?
                          (!wire2) : (reg134 == reg149))) : $signed(wire128)));
            end
          if (reg145[(2'h2):(1'h0)])
            begin
              reg151 <= reg130;
            end
          else
            begin
              reg151 <= $signed($unsigned(($unsigned($unsigned(reg151)) ?
                  {(^reg149)} : reg155)));
              reg152 <= $unsigned((reg142 ~^ (({reg141, reg151} ?
                      reg154 : (^~reg136)) ?
                  $signed((wire2 ? wire24 : reg141)) : $signed((-reg143)))));
              reg153 <= (reg153[(1'h0):(1'h0)] ?
                  (reg136[(5'h13):(4'h8)] ?
                      reg145[(2'h2):(1'h0)] : $signed($unsigned(wire0))) : {(reg131[(1'h1):(1'h0)] || (8'hb2)),
                      $signed(((reg151 >> (8'hb1)) ?
                          $unsigned(reg143) : {wire24}))});
              reg154 <= $unsigned((~&$unsigned(reg139[(3'h6):(2'h2)])));
              reg155 <= $signed((-$unsigned($unsigned((-reg144)))));
            end
          reg156 <= wire5;
          reg157 <= ((^wire0[(4'ha):(1'h1)]) >> ($unsigned(reg148) ?
              $signed(reg149) : $signed((((8'ha5) || wire1) > (reg140 == reg150)))));
          reg158 <= reg143;
        end
    end
  always
    @(posedge clk) begin
      reg159 <= (({reg131[(1'h1):(1'h1)]} ~^ $signed((wire5 ?
          $unsigned(reg131) : (reg154 ?
              reg138 : wire4)))) ^ $signed(((reg150 >= (wire24 ?
              reg142 : reg136)) ?
          {reg132} : ($unsigned(reg155) & reg139[(4'hb):(4'h8)]))));
      reg160 <= ($signed(wire4[(1'h1):(1'h0)]) ?
          (((|(reg141 ? reg132 : reg156)) ^~ ((+wire5) ~^ wire1)) ?
              reg144[(4'ha):(3'h7)] : $signed($unsigned((reg153 != wire1)))) : wire128);
      reg161 <= $signed(($signed((+reg157)) >> (($unsigned(wire0) != reg134[(4'hc):(1'h1)]) <<< reg134)));
      reg162 <= $unsigned({(((reg157 ? reg144 : (8'hab)) ?
                  reg132 : {reg149, wire1}) ?
              $signed(reg141) : (reg158[(1'h0):(1'h0)] << reg159[(4'hb):(3'h5)]))});
      reg163 <= $signed($signed(wire24[(5'h11):(4'hf)]));
    end
  module164 #() modinst202 (wire201, clk, reg163, reg161, reg142, wire22, wire0);
  assign wire203 = $signed((+reg145));
  module164 #() modinst205 (wire204, clk, reg161, reg158, reg132, reg154, reg157);
endmodule

module module164
#(parameter param199 = (~|(^((7'h40) ? (((8'ha1) >> (8'hbf)) > (~(8'ha3))) : (!((8'hb9) - (8'ha1)))))), 
parameter param200 = ((^~param199) != param199))
(y, clk, wire169, wire168, wire167, wire166, wire165);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire169;
  input wire signed [(3'h6):(1'h0)] wire168;
  input wire signed [(4'he):(1'h0)] wire167;
  input wire [(4'hb):(1'h0)] wire166;
  input wire [(3'h6):(1'h0)] wire165;
  wire [(4'hb):(1'h0)] wire198;
  wire [(5'h14):(1'h0)] wire189;
  wire [(5'h12):(1'h0)] wire188;
  wire [(3'h6):(1'h0)] wire187;
  wire signed [(5'h14):(1'h0)] wire186;
  wire [(2'h2):(1'h0)] wire185;
  wire signed [(5'h12):(1'h0)] wire183;
  wire [(5'h15):(1'h0)] wire182;
  wire [(4'hb):(1'h0)] wire181;
  wire [(4'hd):(1'h0)] wire180;
  wire [(2'h2):(1'h0)] wire179;
  wire [(3'h4):(1'h0)] wire178;
  wire signed [(3'h5):(1'h0)] wire177;
  wire signed [(4'ha):(1'h0)] wire172;
  wire [(4'hf):(1'h0)] wire171;
  wire signed [(4'hc):(1'h0)] wire170;
  reg [(5'h15):(1'h0)] reg197 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg194 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg193 = (1'h0);
  reg [(3'h4):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg191 = (1'h0);
  reg [(3'h6):(1'h0)] reg190 = (1'h0);
  reg [(4'hb):(1'h0)] reg184 = (1'h0);
  reg signed [(4'he):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg175 = (1'h0);
  reg [(2'h2):(1'h0)] reg174 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg173 = (1'h0);
  assign y = {wire198,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire172,
                 wire171,
                 wire170,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg184,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 (1'h0)};
  assign wire170 = $signed({(((wire168 * wire166) ^ $signed(wire167)) ?
                           ($signed(wire168) ?
                               wire166[(3'h5):(1'h0)] : (~|wire165)) : $signed($unsigned(wire165))),
                       $unsigned($signed((wire169 >> wire166)))});
  assign wire171 = wire166[(3'h5):(1'h0)];
  assign wire172 = (^~wire168);
  always
    @(posedge clk) begin
      reg173 <= $unsigned(($signed(((wire169 == wire166) << $unsigned(wire166))) <<< wire165[(2'h2):(1'h1)]));
      reg174 <= (wire169 ?
          $signed({((7'h40) ? (wire168 >> wire171) : (|wire172)),
              wire167}) : (~&(wire168 ?
              (~((8'hb6) ? wire168 : reg173)) : reg173)));
      reg175 <= (reg174 ? $signed(reg173) : $signed((8'h9f)));
      reg176 <= $signed((~|(-((wire169 < (8'ha0)) <<< $signed(reg175)))));
    end
  assign wire177 = ({($unsigned((~|wire170)) == (-(~|(7'h42)))),
                           wire171[(3'h6):(3'h6)]} ?
                       wire171[(4'hd):(4'ha)] : (&(((wire166 | (8'haa)) - wire165[(2'h2):(1'h0)]) ^~ $unsigned((wire169 ?
                           reg173 : wire172)))));
  assign wire178 = wire166[(3'h7):(3'h7)];
  assign wire179 = reg176[(3'h4):(1'h0)];
  assign wire180 = wire172;
  assign wire181 = $unsigned($signed((^~(wire166 == (&wire171)))));
  assign wire182 = $unsigned(((reg176[(4'hb):(3'h5)] ?
                       {reg176} : wire167[(4'he):(4'hd)]) ^~ $unsigned((8'h9c))));
  assign wire183 = ((&$signed(($signed((8'h9e)) ?
                       $signed(wire170) : $signed(reg174)))) * (^((&$signed(wire169)) ?
                       $unsigned(wire167) : wire168[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg184 <= ($unsigned($unsigned(reg173)) >>> $unsigned({$unsigned((~^wire165))}));
    end
  assign wire185 = wire170;
  assign wire186 = $signed({$signed((|reg174))});
  assign wire187 = reg173;
  assign wire188 = $signed($signed({(+(reg174 <<< wire166))}));
  assign wire189 = wire177[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      if (((wire169 ?
              wire181[(3'h6):(1'h0)] : $signed(wire179[(1'h0):(1'h0)])) ?
          (!($unsigned($signed((8'hb3))) + $signed($unsigned((8'hba))))) : (|$signed((^$unsigned(wire177))))))
        begin
          reg190 <= $signed({$unsigned(reg176),
              ((wire170[(4'hc):(2'h3)] && $unsigned(wire169)) ^~ wire179)});
          reg191 <= wire172;
          reg192 <= $unsigned((-wire182[(4'ha):(4'ha)]));
          reg193 <= $unsigned($unsigned((~^wire183)));
          reg194 <= ($signed($unsigned($unsigned((~^reg191)))) ?
              $unsigned($unsigned(((wire171 ?
                  reg184 : wire187) == reg192[(2'h3):(1'h0)]))) : $unsigned(((8'hb6) << reg173)));
        end
      else
        begin
          reg190 <= wire169[(3'h4):(2'h3)];
          reg191 <= wire188;
          if ($unsigned($signed(($signed(wire183) ?
              ({reg190,
                  wire170} >= wire179) : ({reg174} >>> (reg184 || wire187))))))
            begin
              reg192 <= {(reg193 ?
                      (({wire187, wire171} ?
                              (reg175 ? (8'ha3) : wire185) : ((8'hbb) ?
                                  wire171 : wire167)) ?
                          wire189[(3'h5):(1'h1)] : wire183) : (reg191[(4'hd):(2'h2)] ?
                          wire169[(1'h1):(1'h0)] : {(wire178 ^~ reg174),
                              wire180}))};
              reg193 <= ($unsigned({(wire188 && (+reg191))}) ?
                  wire168[(1'h1):(1'h1)] : $signed(reg175[(3'h4):(1'h1)]));
              reg194 <= $unsigned((reg174 ? (~(~|wire168)) : wire182));
              reg195 <= ((wire179 << $unsigned($unsigned(wire170))) ?
                  wire168[(2'h2):(1'h1)] : (~&(~^((+wire187) ?
                      wire168 : wire177))));
            end
          else
            begin
              reg192 <= {{wire185}};
              reg193 <= $unsigned($signed(((-(wire178 > reg184)) == {(wire180 <= wire165),
                  $signed(wire178)})));
              reg194 <= reg194[(1'h0):(1'h0)];
            end
          reg196 <= (((^~(+{reg190,
              wire168})) < $signed((8'ha8))) != $signed(($unsigned((reg194 < wire183)) ?
              ((reg174 | (8'hb5)) ?
                  $unsigned(wire178) : (&wire166)) : ($signed(reg176) ?
                  wire187[(1'h1):(1'h1)] : {wire183}))));
          reg197 <= {$signed($signed(reg174[(1'h0):(1'h0)]))};
        end
    end
  assign wire198 = wire167;
endmodule

module module25
#(parameter param127 = (~|{((|(~|(7'h40))) << ((~(8'ha6)) + ((8'hbe) && (8'haf)))), (-(-((8'haf) <<< (8'hb8))))}))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire30;
  input wire [(5'h14):(1'h0)] wire29;
  input wire [(2'h2):(1'h0)] wire28;
  input wire [(5'h14):(1'h0)] wire27;
  input wire signed [(5'h11):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire126;
  wire signed [(3'h7):(1'h0)] wire80;
  wire [(5'h13):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire124;
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  assign y = {wire126,
                 wire80,
                 wire42,
                 wire32,
                 wire31,
                 wire82,
                 wire86,
                 wire124,
                 reg85,
                 reg84,
                 reg83,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 (1'h0)};
  assign wire31 = ($signed($unsigned($signed($unsigned(wire28)))) ?
                      $unsigned((8'hbe)) : wire30);
  assign wire32 = wire28;
  always
    @(posedge clk) begin
      if (($unsigned((^wire26)) ?
          (-$unsigned({wire31[(2'h3):(1'h0)],
              $unsigned(wire32)})) : $unsigned({{{wire29, wire31},
                  wire28[(1'h0):(1'h0)]}})))
        begin
          reg33 <= {(wire31 ?
                  (((~^wire26) ~^ $unsigned(wire31)) * ((wire29 >>> wire31) ?
                      (wire31 <= wire28) : (wire27 ?
                          wire28 : wire26))) : $signed((wire32[(1'h1):(1'h1)] ?
                      $unsigned(wire28) : wire27))),
              {wire31[(3'h4):(1'h0)]}};
          reg34 <= $signed(wire27);
          reg35 <= $signed((~reg34));
          reg36 <= wire31;
          reg37 <= $unsigned($unsigned((7'h43)));
        end
      else
        begin
          reg33 <= ($signed($signed((wire31 ^~ reg37))) ?
              reg33[(1'h1):(1'h0)] : $unsigned({($unsigned(wire30) ?
                      {(8'ha4)} : $signed(reg36)),
                  reg35[(1'h0):(1'h0)]}));
          if (wire27)
            begin
              reg34 <= (|({{((7'h43) | wire30), (reg37 ? reg36 : (8'had))},
                      ({wire28, reg34} ?
                          wire28[(2'h2):(2'h2)] : $signed(wire28))} ?
                  {$unsigned($unsigned(wire29)),
                      wire29[(1'h1):(1'h0)]} : $unsigned(wire32[(3'h6):(1'h0)])));
            end
          else
            begin
              reg34 <= (~|reg36[(3'h4):(2'h3)]);
              reg35 <= reg33[(1'h1):(1'h0)];
              reg36 <= (~|{wire27[(1'h1):(1'h1)],
                  (^((wire31 ~^ wire26) ?
                      (wire28 ? (8'hbe) : wire29) : {wire26, wire28}))});
              reg37 <= wire28[(1'h0):(1'h0)];
            end
        end
      reg38 <= {wire27,
          $unsigned(((wire29[(2'h2):(1'h1)] ?
              $unsigned(reg35) : (wire32 >> wire29)) <= (^$unsigned(reg37))))};
      reg39 <= (&(reg34 <= (wire29 ?
          $signed((wire30 == wire30)) : $signed((+wire32)))));
      reg40 <= (^(wire28 > wire30[(2'h3):(2'h2)]));
      reg41 <= ($signed(wire32[(3'h5):(1'h1)]) ?
          $unsigned((wire27 & (-(~(8'hbe))))) : reg34);
    end
  assign wire42 = reg34;
  always
    @(posedge clk) begin
      reg43 <= $unsigned(($signed({reg40[(2'h3):(2'h2)]}) <= $unsigned(({(8'hbb)} ?
          (reg40 >> reg41) : $signed((8'ha6))))));
      reg44 <= (((^(reg41[(1'h0):(1'h0)] ?
          (reg35 ?
              reg41 : reg33) : (|reg43))) > (^reg41)) & (reg34[(2'h2):(2'h2)] + reg34[(1'h1):(1'h0)]));
      if ($unsigned({$signed((~^wire32))}))
        begin
          reg45 <= (|wire32[(3'h4):(1'h0)]);
        end
      else
        begin
          if ((8'hb3))
            begin
              reg45 <= wire27[(3'h6):(1'h1)];
              reg46 <= $signed((((&(7'h42)) + reg44[(2'h3):(2'h3)]) - wire26));
              reg47 <= $signed(reg40[(1'h0):(1'h0)]);
              reg48 <= $unsigned((8'ha2));
            end
          else
            begin
              reg45 <= ({$signed($unsigned(reg46[(1'h0):(1'h0)])),
                  {(reg36[(4'hc):(4'h8)] ?
                          wire31 : (wire30 || wire32))}} ^~ reg41);
              reg46 <= reg39[(4'hb):(3'h4)];
            end
          reg49 <= $unsigned((~&wire28[(2'h2):(1'h0)]));
          reg50 <= ((^~$signed(($unsigned(wire31) ?
              wire29[(1'h0):(1'h0)] : $signed(reg34)))) + reg45[(2'h2):(1'h1)]);
        end
      if (((($signed((&reg39)) ?
                  reg47 : (wire31[(3'h7):(3'h5)] <<< ((8'h9c) >= (8'ha1)))) ?
              (((^(8'ha8)) ? $unsigned(wire27) : (&wire27)) ?
                  wire30[(3'h5):(1'h1)] : ((reg47 & reg41) ?
                      $unsigned((8'hbe)) : (wire27 ?
                          reg35 : (8'hbc)))) : {(+reg43),
                  wire29[(2'h3):(2'h2)]}) ?
          {$signed($unsigned(reg39[(4'hb):(4'h8)]))} : $signed(reg45[(3'h4):(1'h1)])))
        begin
          reg51 <= reg46;
          if (wire29[(1'h0):(1'h0)])
            begin
              reg52 <= (~&reg48[(1'h1):(1'h0)]);
              reg53 <= reg37[(4'he):(4'ha)];
              reg54 <= $signed(((-(reg39[(3'h5):(1'h1)] ?
                  $unsigned((8'haf)) : (&reg38))) < $unsigned((~^(-(8'hbd))))));
              reg55 <= ({$unsigned($signed((wire28 >>> reg46))),
                      (((~|reg49) ?
                          (wire27 ?
                              reg33 : wire30) : $signed(reg33)) - reg53)} ?
                  ((($unsigned(reg38) ?
                      {(7'h42),
                          (8'ha0)} : (reg34 << wire32)) <<< (!wire28)) == (wire30 ?
                      wire30 : ((reg38 ?
                          reg43 : wire31) >>> (!reg38)))) : $unsigned((reg48 ?
                      wire30[(4'hc):(2'h3)] : $unsigned(reg48[(4'hf):(2'h3)]))));
            end
          else
            begin
              reg52 <= reg38;
              reg53 <= {({(reg38 ?
                          $unsigned(reg50) : $signed(reg40))} < wire27[(2'h2):(1'h0)]),
                  (reg51 ?
                      (($signed(reg46) ?
                          $unsigned(reg38) : (reg34 || reg46)) * $unsigned($unsigned(wire28))) : (|reg40))};
              reg54 <= (reg34 || $signed({reg44[(3'h6):(2'h3)]}));
            end
          if (wire27)
            begin
              reg56 <= wire28[(1'h0):(1'h0)];
              reg57 <= $unsigned($unsigned($unsigned(reg53)));
            end
          else
            begin
              reg56 <= (~&$signed(((wire30[(4'hd):(2'h3)] ?
                  reg37[(2'h2):(1'h0)] : reg40[(1'h1):(1'h1)]) * $signed((reg52 ~^ reg48)))));
              reg57 <= reg43;
              reg58 <= ($unsigned($unsigned((~^reg52[(4'h9):(4'h9)]))) ?
                  reg35 : reg56[(3'h7):(3'h6)]);
              reg59 <= ((reg53 ?
                  reg50[(2'h3):(1'h1)] : (reg55[(4'hf):(4'hc)] ?
                      {(reg38 && wire29),
                          reg53[(3'h6):(1'h1)]} : reg53)) * reg58[(1'h0):(1'h0)]);
              reg60 <= ($signed((wire26[(2'h2):(2'h2)] ?
                      ((!(8'ha7)) ?
                          (~^wire26) : $unsigned(reg47)) : ($unsigned(reg43) ~^ reg33[(4'h9):(1'h1)]))) ?
                  {{reg49[(1'h1):(1'h1)],
                          $signed(reg37[(4'hf):(4'h9)])}} : reg53);
            end
        end
      else
        begin
          reg51 <= reg41;
        end
    end
  always
    @(posedge clk) begin
      reg61 <= (~&wire31[(4'hb):(2'h2)]);
      reg62 <= $signed($signed($signed($signed((reg38 ? reg39 : wire30)))));
    end
  module63 #() modinst81 (wire80, clk, reg56, reg55, reg62, wire26);
  assign wire82 = reg53[(4'ha):(3'h7)];
  always
    @(posedge clk) begin
      reg83 <= ((($signed(reg43) ^~ reg44) >> wire31[(4'ha):(3'h6)]) <= wire28[(1'h1):(1'h0)]);
      reg84 <= {reg37};
      reg85 <= ((((wire82 ? reg49[(2'h2):(1'h1)] : wire30[(5'h11):(4'hf)]) ?
          reg52[(2'h2):(2'h2)] : reg83[(3'h5):(1'h1)]) ~^ $signed((&$unsigned(wire31)))) & (reg39[(2'h2):(2'h2)] >= (((8'hb2) < $signed((8'ha7))) ?
          ((~reg43) | $unsigned(reg38)) : ((reg56 ? reg48 : reg56) ?
              reg57[(3'h5):(1'h0)] : $signed(reg50)))));
    end
  assign wire86 = $signed($unsigned(reg47));
  module87 #() modinst125 (.wire90(reg59), .wire89(reg55), .wire88(reg53), .clk(clk), .y(wire124), .wire91(reg50), .wire92(wire29));
  assign wire126 = (-($unsigned(((reg36 ? reg61 : (8'had)) ?
                           (reg55 * (8'hab)) : (reg46 ? wire86 : reg47))) ?
                       $signed((+$unsigned(reg40))) : $unsigned((+reg33))));
endmodule

module module8
#(parameter param21 = ({{{(&(8'ha8))}}} ? (((~|((8'hab) && (8'ha0))) <= (~|(7'h44))) ? ((~^{(8'ha6)}) > (((8'hae) + (8'ha6)) ? ((8'ha1) ? (7'h43) : (8'hb9)) : ((8'hb4) ? (8'h9e) : (8'h9c)))) : ((+((7'h40) || (8'ha5))) ? ((~(8'hb4)) | (~|(8'ha3))) : (&((8'ha8) ? (8'haa) : (7'h40))))) : (((((7'h41) >>> (8'h9e)) != ((8'ha2) ? (8'ha6) : (8'ha3))) ? (!((7'h40) ~^ (8'h9e))) : (+(!(8'hab)))) | {{{(8'hb6)}, (&(8'hba))}})))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(4'hd):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  assign y = {wire20,
                 wire14,
                 wire13,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire13 = {((wire11[(3'h5):(2'h2)] ?
                              (+(8'hb4)) : wire11[(3'h6):(2'h2)]) ?
                          $signed(wire11) : ((&(~|wire9)) ?
                              wire10 : wire9[(2'h3):(2'h2)])),
                      wire9[(2'h2):(2'h2)]};
  assign wire14 = {$signed({$signed((~&(8'h9f)))})};
  always
    @(posedge clk) begin
      reg15 <= (&(($signed($unsigned(wire13)) * $signed(wire9[(1'h0):(1'h0)])) | (wire11 && $unsigned((wire14 ?
          (8'hbe) : wire14)))));
      reg16 <= (^$signed((wire10 <<< (!$signed(reg15)))));
      reg17 <= (wire13[(3'h5):(1'h0)] ?
          {((reg16 & $signed(wire9)) & $unsigned(wire14[(2'h2):(1'h0)])),
              (8'hba)} : $unsigned($unsigned((^reg16[(4'hb):(3'h4)]))));
      reg18 <= wire9;
      reg19 <= {(((^~(wire12 != reg17)) || $unsigned($unsigned(reg16))) ?
              (((8'ha8) ? {wire13, wire11} : {wire13, reg16}) ?
                  wire12[(1'h0):(1'h0)] : ({wire10, reg18} ~^ (wire11 ?
                      wire10 : reg16))) : $unsigned((wire11 ?
                  (~^reg15) : $signed(wire14))))};
    end
  assign wire20 = wire14[(1'h0):(1'h0)];
endmodule

module module87
#(parameter param122 = (8'ha2), 
parameter param123 = ({param122, param122} ^ param122))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire92;
  input wire signed [(5'h12):(1'h0)] wire91;
  input wire signed [(4'hf):(1'h0)] wire90;
  input wire signed [(2'h3):(1'h0)] wire89;
  input wire [(4'h8):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire121;
  wire signed [(5'h12):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire signed [(3'h7):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire97;
  wire [(2'h3):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire93;
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg106 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire100,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
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
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire93 = wire89[(1'h1):(1'h1)];
  assign wire94 = ((&$unsigned((wire92 - $signed(wire93)))) ?
                      {{wire90}, wire89[(1'h0):(1'h0)]} : {wire89});
  assign wire95 = wire93;
  assign wire96 = wire92;
  assign wire97 = wire88;
  always
    @(posedge clk) begin
      reg98 <= (~^(^~$signed((+{(8'hb5), (7'h44)}))));
      reg99 <= (~(wire97[(1'h1):(1'h0)] * wire92[(5'h11):(4'h8)]));
    end
  assign wire100 = (^{(-(8'hbb))});
  always
    @(posedge clk) begin
      reg101 <= (~^(wire96 ^~ (($unsigned(wire88) < (wire95 ?
          wire89 : wire88)) >>> wire89[(2'h2):(1'h0)])));
      if (($unsigned($signed((wire90[(3'h6):(3'h5)] + $signed(wire92)))) ?
          $signed($unsigned($unsigned((wire96 || wire92)))) : wire90[(4'h8):(4'h8)]))
        begin
          if ((+$signed({{$unsigned((8'hb4))}})))
            begin
              reg102 <= (((!$unsigned({(8'haa)})) ?
                  {{(!reg99),
                          wire88[(4'h8):(3'h5)]}} : $signed(((wire89 - reg101) && wire93))) >= (wire100[(3'h6):(2'h3)] == (wire93[(2'h2):(1'h0)] != (wire94[(1'h0):(1'h0)] >= (~(7'h43))))));
              reg103 <= wire89;
              reg104 <= wire90[(4'hf):(3'h4)];
            end
          else
            begin
              reg102 <= ($signed(((^wire94[(4'hd):(3'h5)]) ?
                      {$unsigned(wire92),
                          (wire97 ?
                              (8'hae) : (8'hb3))} : wire100[(3'h5):(2'h3)])) ?
                  (reg98[(3'h7):(1'h0)] >> wire92) : (reg99 ?
                      (reg102 & $signed((wire93 && reg99))) : wire96[(2'h2):(1'h1)]));
              reg103 <= (reg103 ?
                  ($signed($unsigned(wire91[(4'ha):(2'h3)])) ?
                      (^~wire89) : wire95[(2'h2):(2'h2)]) : (-wire100));
              reg104 <= $unsigned(wire96);
              reg105 <= $unsigned(wire94);
            end
          reg106 <= wire89[(1'h0):(1'h0)];
          if ($signed((($signed(reg98[(3'h7):(2'h2)]) ^ $signed((wire96 && wire89))) ?
              ({$unsigned(wire100)} == (8'ha0)) : reg103)))
            begin
              reg107 <= $signed((^wire94[(3'h6):(3'h6)]));
              reg108 <= {(((8'ha3) == ((reg105 <= (8'ha2)) + reg105)) ^~ wire88[(2'h3):(1'h1)])};
              reg109 <= (((($signed(wire88) ?
                      $unsigned(reg104) : (reg98 ? reg99 : reg101)) ?
                  wire93[(1'h1):(1'h1)] : $unsigned($signed(reg105))) & wire95[(4'h8):(1'h1)]) >>> $unsigned(((^~$unsigned(reg104)) != {$signed(reg104),
                  {wire93, reg105}})));
            end
          else
            begin
              reg107 <= (!(reg101[(4'h8):(3'h5)] ?
                  $unsigned($unsigned($signed(wire100))) : $signed(((wire88 ?
                          wire90 : reg109) ?
                      (wire96 | (8'hbb)) : (reg101 >>> reg108)))));
              reg108 <= $unsigned(wire91[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg102 <= $unsigned(wire97[(1'h1):(1'h1)]);
          reg103 <= (-$unsigned(reg101));
          reg104 <= (($unsigned(((+(8'ha4)) == (~|wire95))) ?
                  reg103 : wire89[(1'h1):(1'h0)]) ?
              ((~&$signed($unsigned(reg105))) ?
                  wire92 : $signed($unsigned({(8'ha7)}))) : (&wire93));
          reg105 <= $unsigned(wire90);
          reg106 <= {$signed((~reg104))};
        end
      if ((|(($unsigned((~|wire89)) != (((8'hb4) && reg104) <<< $unsigned(wire97))) ?
          (~&(wire88[(3'h6):(2'h2)] && ((8'hae) << wire95))) : wire90)))
        begin
          reg110 <= {$signed(wire96)};
        end
      else
        begin
          reg110 <= (reg106 ?
              $unsigned(reg104) : ($signed(wire91) | reg101[(1'h0):(1'h0)]));
          reg111 <= (wire91 <= (8'h9e));
          if ($unsigned(reg103[(1'h1):(1'h0)]))
            begin
              reg112 <= ((7'h40) - reg98[(5'h10):(3'h7)]);
              reg113 <= ({reg111[(3'h7):(3'h7)]} ?
                  wire97[(1'h1):(1'h0)] : wire92);
              reg114 <= reg111;
            end
          else
            begin
              reg112 <= $unsigned(({(8'h9c)} ?
                  $unsigned({(reg112 & wire91)}) : reg105));
              reg113 <= wire92;
            end
          reg115 <= (|$signed(wire95[(4'hb):(4'ha)]));
        end
      reg116 <= $unsigned(reg107[(4'h9):(1'h0)]);
      reg117 <= wire90[(3'h6):(2'h2)];
    end
  assign wire118 = reg117;
  assign wire119 = reg103[(1'h0):(1'h0)];
  assign wire120 = {{(+$unsigned({reg117, reg98})), wire100[(2'h3):(1'h0)]},
                       (|$unsigned((~|wire118[(3'h5):(2'h3)])))};
  assign wire121 = reg105[(1'h0):(1'h0)];
endmodule

module module63
#(parameter param78 = {(+((((8'ha8) ? (7'h43) : (8'ha6)) > (-(8'haa))) >>> (~&((8'hab) ? (8'hb4) : (8'hbf)))))}, 
parameter param79 = param78)
(y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire67;
  input wire signed [(2'h2):(1'h0)] wire66;
  input wire [(4'h9):(1'h0)] wire65;
  input wire [(3'h5):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire72;
  wire [(5'h13):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire68;
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire68 = ($unsigned((~^wire66)) & {$unsigned(wire65[(3'h4):(3'h4)])});
  assign wire69 = $unsigned($signed($signed({$signed((8'ha8))})));
  assign wire70 = $signed((8'hb2));
  assign wire71 = {$unsigned((wire66[(1'h0):(1'h0)] <<< (wire70 ?
                          wire66 : (wire66 < wire68)))),
                      ((~^wire68) && $signed($signed($unsigned((8'ha3)))))};
  assign wire72 = wire65[(3'h7):(3'h7)];
  assign wire73 = {(wire67 >> wire67)};
  always
    @(posedge clk) begin
      reg74 <= $signed(((&wire65) ?
          (8'hae) : $signed((~|wire68[(1'h1):(1'h0)]))));
      reg75 <= (~|(8'ha4));
      reg76 <= ($signed(((reg74[(4'h9):(3'h5)] ?
          (^(8'hbe)) : $signed(wire66)) & reg75[(3'h5):(3'h5)])) | wire67[(4'h9):(2'h2)]);
      reg77 <= {(^wire70)};
    end
endmodule
