module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire208;
  wire signed [(4'h9):(1'h0)] wire207;
  wire signed [(5'h10):(1'h0)] wire206;
  wire signed [(4'hf):(1'h0)] wire205;
  wire [(4'h8):(1'h0)] wire156;
  wire signed [(5'h12):(1'h0)] wire158;
  wire [(4'hd):(1'h0)] wire159;
  wire [(5'h11):(1'h0)] wire161;
  wire signed [(4'ha):(1'h0)] wire162;
  wire [(5'h15):(1'h0)] wire163;
  wire [(5'h11):(1'h0)] wire164;
  wire [(4'hc):(1'h0)] wire179;
  wire [(3'h5):(1'h0)] wire195;
  wire [(3'h7):(1'h0)] wire200;
  wire signed [(5'h14):(1'h0)] wire201;
  wire signed [(3'h6):(1'h0)] wire202;
  wire [(4'hf):(1'h0)] wire203;
  reg signed [(5'h14):(1'h0)] reg211 = (1'h0);
  reg [(4'ha):(1'h0)] reg210 = (1'h0);
  reg [(3'h6):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg198 = (1'h0);
  reg [(5'h13):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg196 = (1'h0);
  reg [(5'h14):(1'h0)] reg194 = (1'h0);
  reg [(5'h13):(1'h0)] reg193 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg190 = (1'h0);
  reg [(4'hb):(1'h0)] reg189 = (1'h0);
  reg [(3'h4):(1'h0)] reg188 = (1'h0);
  reg [(2'h3):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg185 = (1'h0);
  reg [(4'h9):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg183 = (1'h0);
  reg [(4'hb):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg181 = (1'h0);
  reg [(4'hc):(1'h0)] reg160 = (1'h0);
  assign y = {wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire156,
                 wire158,
                 wire159,
                 wire161,
                 wire162,
                 wire163,
                 wire164,
                 wire179,
                 wire195,
                 wire200,
                 wire201,
                 wire202,
                 wire203,
                 reg211,
                 reg210,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
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
                 reg160,
                 (1'h0)};
  module5 #() modinst157 (wire156, clk, wire4, wire0, wire2, wire1, wire3);
  assign wire158 = $signed(wire3[(1'h0):(1'h0)]);
  assign wire159 = {(($unsigned(((8'hb6) <= wire2)) ?
                           $signed(((8'h9f) ?
                               (8'ha0) : wire156)) : ((8'hb0) ^~ $signed((8'ha7)))) || {$signed($unsigned(wire156)),
                           $unsigned((^~(7'h44)))}),
                       {$unsigned($unsigned($signed(wire158)))}};
  always
    @(posedge clk) begin
      reg160 <= $unsigned((~|wire3));
    end
  assign wire161 = $unsigned({wire3, (8'hb9)});
  assign wire162 = ((($unsigned((wire2 ? wire158 : wire0)) ?
                           wire2[(4'hb):(2'h2)] : wire159) == $signed($signed($unsigned((8'hbb))))) ?
                       $unsigned(($signed($unsigned(wire159)) || (~&{wire156}))) : $signed(wire159));
  assign wire163 = (^(!wire158[(1'h1):(1'h1)]));
  assign wire164 = $signed($signed(wire163[(3'h7):(1'h1)]));
  module165 #() modinst180 (.wire167(wire162), .clk(clk), .wire169(wire163), .wire168(wire159), .wire166(wire158), .y(wire179));
  always
    @(posedge clk) begin
      reg181 <= wire164[(4'he):(4'h9)];
      reg182 <= reg181[(2'h2):(2'h2)];
      if ($signed({($unsigned((wire1 <= wire1)) ?
              $signed(wire162[(2'h3):(1'h0)]) : (wire0 ?
                  (8'hbc) : ((8'hb6) ? reg182 : wire0))),
          wire0}))
        begin
          if ({wire158, wire4[(5'h13):(3'h7)]})
            begin
              reg183 <= $signed($signed(wire4));
              reg184 <= (wire158[(5'h10):(4'hb)] >= (~^((~(~|wire2)) ?
                  ((wire156 ?
                      (8'hb2) : wire1) + wire164) : ($signed(wire179) | $unsigned(reg181)))));
              reg185 <= reg160;
            end
          else
            begin
              reg183 <= $unsigned((wire3 ^ ($unsigned((~|(8'hbe))) ^ (^~{wire1,
                  wire161}))));
              reg184 <= $signed({wire158[(4'hf):(3'h7)], {$signed({wire161})}});
              reg185 <= ({$signed(wire1)} ?
                  {($unsigned(wire164) ?
                          reg181 : $unsigned($unsigned((8'ha1)))),
                      (|(-(wire179 * (7'h43))))} : ((wire2[(3'h5):(3'h4)] < (&wire156[(3'h5):(2'h3)])) ?
                      (^reg185[(3'h7):(3'h6)]) : wire1));
              reg186 <= wire179[(4'h8):(1'h0)];
              reg187 <= ($unsigned($unsigned((!$signed(wire1)))) - $unsigned((^(wire0 == $signed(wire161)))));
            end
          reg188 <= (reg183[(4'h9):(4'h8)] <<< reg184[(2'h2):(1'h1)]);
        end
      else
        begin
          reg183 <= reg183[(4'he):(4'h8)];
          if (wire163[(4'ha):(4'h9)])
            begin
              reg184 <= $signed(wire159[(3'h6):(1'h0)]);
              reg185 <= wire3[(3'h4):(2'h2)];
              reg186 <= (wire162 ?
                  ({$signed(wire4)} ?
                      $signed(wire159[(1'h1):(1'h1)]) : (wire164 | $signed(wire1))) : (($unsigned($signed(wire158)) ?
                      (+(!wire179)) : $signed((7'h42))) > $unsigned(reg184[(2'h2):(2'h2)])));
              reg187 <= ((((~|(wire156 - (8'hb7))) ?
                      (wire156[(3'h7):(1'h0)] ?
                          $unsigned(wire2) : wire162[(4'h9):(1'h0)]) : $signed((wire179 ?
                          reg183 : (8'ha7)))) ?
                  wire179[(3'h4):(2'h3)] : $unsigned($unsigned($unsigned(wire161)))) | wire3);
            end
          else
            begin
              reg184 <= reg188[(3'h4):(2'h3)];
              reg185 <= wire179[(3'h6):(1'h0)];
              reg186 <= (8'hbc);
              reg187 <= (^(reg187 ^~ (^((|reg184) | {wire179, reg185}))));
              reg188 <= $signed(wire163);
            end
          reg189 <= $signed({((~&wire162) ? {(^wire0)} : reg182)});
          reg190 <= reg187[(2'h2):(2'h2)];
          if ((-wire162))
            begin
              reg191 <= {(reg182[(4'h8):(4'h8)] ?
                      wire179[(4'h8):(2'h3)] : (!(wire159 ?
                          wire161 : $unsigned((8'hae)))))};
              reg192 <= wire179;
              reg193 <= (reg187[(2'h2):(2'h2)] ?
                  $unsigned($signed(wire164)) : (($signed(((8'hb0) << reg190)) ?
                      {(~|wire164), wire156} : ((!wire0) ?
                          (wire0 - (8'h9e)) : wire163)) ^~ (-wire164)));
            end
          else
            begin
              reg191 <= $unsigned($signed((($signed(reg182) ?
                  $unsigned(reg190) : $signed(reg182)) > ($signed(wire4) ?
                  $unsigned((8'hb5)) : $unsigned(wire2)))));
              reg192 <= $signed(wire164);
              reg193 <= wire158[(4'hd):(3'h5)];
              reg194 <= $unsigned($unsigned($unsigned($unsigned((~|wire1)))));
            end
        end
    end
  assign wire195 = reg185;
  always
    @(posedge clk) begin
      reg196 <= $unsigned($unsigned({wire164[(2'h2):(2'h2)]}));
      reg197 <= $unsigned(reg187);
      reg198 <= ($unsigned({{{wire159, reg189},
              reg183[(3'h4):(2'h3)]}}) <= $unsigned($signed(wire163[(1'h0):(1'h0)])));
      reg199 <= $signed($signed(wire1));
    end
  assign wire200 = reg181[(1'h1):(1'h1)];
  assign wire201 = (+((~&$signed((!(8'h9d)))) ~^ ($signed($signed((8'hbe))) & wire200[(1'h0):(1'h0)])));
  assign wire202 = $signed({$signed($unsigned((wire195 > wire159))), wire4});
  module5 #() modinst204 (wire203, clk, reg197, reg190, reg160, reg194, wire0);
  assign wire205 = wire195[(1'h0):(1'h0)];
  assign wire206 = ((!((7'h44) ?
                           ($unsigned(wire156) ?
                               $unsigned((8'ha6)) : $signed(wire195)) : {$unsigned(reg188),
                               $signed(reg183)})) ?
                       wire162 : $signed((8'ha8)));
  assign wire207 = (+(({(~|reg160)} ?
                       $unsigned(((8'ha0) >= reg196)) : reg188[(1'h0):(1'h0)]) || ({reg191} ?
                       $unsigned((reg182 || wire205)) : {(8'hbd)})));
  module16 #() modinst209 (wire208, clk, wire161, wire0, reg196, reg185);
  always
    @(posedge clk) begin
      reg210 <= (&wire1[(3'h7):(1'h1)]);
      reg211 <= (wire208[(1'h1):(1'h1)] >= $signed($unsigned(reg189)));
    end
endmodule

module module165
#(parameter param178 = (+((({(8'h9f), (7'h40)} <<< ((8'ha1) >= (8'hb8))) && (!(~|(8'h9c)))) ^~ (((&(8'hb8)) - ((8'ha7) ? (8'hb4) : (8'ha2))) & ({(8'ha0), (8'ha2)} >= {(7'h41), (8'hbb)})))))
(y, clk, wire169, wire168, wire167, wire166);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire169;
  input wire signed [(4'hb):(1'h0)] wire168;
  input wire [(3'h6):(1'h0)] wire167;
  input wire signed [(5'h12):(1'h0)] wire166;
  wire [(4'h8):(1'h0)] wire177;
  wire [(5'h14):(1'h0)] wire176;
  wire [(5'h10):(1'h0)] wire175;
  wire [(4'h8):(1'h0)] wire174;
  wire signed [(4'hb):(1'h0)] wire173;
  wire [(3'h6):(1'h0)] wire172;
  wire [(5'h10):(1'h0)] wire171;
  wire [(4'h8):(1'h0)] wire170;
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 (1'h0)};
  assign wire170 = wire166;
  assign wire171 = (wire166 > (~(~&(7'h41))));
  assign wire172 = {(~$signed(((wire167 << wire171) ?
                           wire171 : (wire166 >> wire168)))),
                       wire168[(4'h8):(1'h1)]};
  assign wire173 = wire172;
  assign wire174 = {(wire166 && (wire169 ?
                           $signed(wire169[(3'h4):(1'h1)]) : ((wire172 ?
                               wire173 : wire171) || (wire173 ?
                               wire167 : wire172))))};
  assign wire175 = {$signed(wire172)};
  assign wire176 = ((!wire175[(4'hc):(2'h3)]) ?
                       (($unsigned((wire169 - wire168)) ?
                               ((wire166 >= wire170) < wire172) : ((wire175 ?
                                   wire170 : wire167) + $unsigned(wire167))) ?
                           wire173[(1'h1):(1'h1)] : $unsigned(({(7'h43)} | wire172[(1'h0):(1'h0)]))) : {(|$unsigned({wire174,
                               wire170}))});
  assign wire177 = (-wire173[(4'hb):(4'h8)]);
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire6;
  input wire [(5'h11):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire155;
  wire [(4'h9):(1'h0)] wire140;
  wire [(4'hd):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire103;
  wire [(2'h2):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire57;
  reg signed [(2'h2):(1'h0)] reg154 = (1'h0);
  reg signed [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(3'h7):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg149 = (1'h0);
  reg [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg142 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  assign y = {wire155,
                 wire140,
                 wire107,
                 wire106,
                 wire105,
                 wire103,
                 wire73,
                 wire67,
                 wire60,
                 wire59,
                 wire11,
                 wire12,
                 wire13,
                 wire15,
                 wire57,
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
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg14,
                 (1'h0)};
  assign wire11 = (({(~|{wire8})} - wire10) ?
                      (wire9[(4'hc):(1'h1)] ?
                          (wire10[(2'h2):(2'h2)] + ((wire8 ?
                              wire6 : wire10) <<< (wire9 ?
                              wire8 : wire10))) : $signed(wire7)) : ({(~|$unsigned(wire6))} ^~ (wire10 ?
                          ($signed((8'hb2)) <<< $signed((7'h41))) : wire7[(2'h3):(2'h2)])));
  assign wire12 = {((!(7'h40)) ?
                          ((~(7'h40)) <= $unsigned((wire8 != (8'hb8)))) : $unsigned($unsigned((wire10 ~^ wire7))))};
  assign wire13 = $signed(wire9);
  always
    @(posedge clk) begin
      reg14 <= {wire7};
    end
  assign wire15 = ((^$signed(wire8)) ?
                      {($unsigned($signed((8'ha3))) < {wire12}),
                          wire10} : (^wire7));
  module16 #() modinst58 (.wire19(wire15), .y(wire57), .wire20(reg14), .wire17(wire13), .clk(clk), .wire18(wire7));
  assign wire59 = $unsigned((reg14 >> $unsigned($unsigned((wire12 ?
                      wire6 : wire12)))));
  assign wire60 = (|{($signed((8'hb0)) >>> wire57[(3'h4):(1'h1)]),
                      $signed($signed($signed(wire57)))});
  always
    @(posedge clk) begin
      if (wire59[(1'h1):(1'h1)])
        begin
          reg61 <= ({(^~$unsigned((!wire60)))} ?
              wire57[(1'h0):(1'h0)] : $signed($unsigned({wire10})));
          reg62 <= reg61[(3'h5):(1'h0)];
        end
      else
        begin
          reg61 <= ((~|wire9[(3'h7):(3'h5)]) ?
              $unsigned($signed((~&(wire59 ? reg62 : wire8)))) : reg14);
          if (wire13[(2'h3):(2'h2)])
            begin
              reg62 <= $signed(($signed((|$unsigned(reg61))) ?
                  wire13[(5'h10):(4'hf)] : (((wire8 >= wire10) * $unsigned(reg61)) ?
                      (wire60 ?
                          $unsigned(wire57) : wire12[(3'h7):(1'h1)]) : (8'hb4))));
            end
          else
            begin
              reg62 <= {(+($signed({wire11}) <= ((wire11 + wire10) ?
                      (wire60 ? (8'h9f) : wire10) : ((8'hb1) <= wire12)))),
                  wire57[(2'h2):(2'h2)]};
              reg63 <= ((8'hac) ?
                  $signed($signed(wire12[(1'h1):(1'h1)])) : $unsigned($unsigned(wire11)));
            end
        end
      reg64 <= wire10[(3'h7):(1'h1)];
      reg65 <= $unsigned({((wire12 ?
              wire57 : $signed(reg14)) + $unsigned(wire57[(3'h4):(2'h3)])),
          reg61[(2'h3):(1'h0)]});
      reg66 <= $signed((((-wire7) ? reg63 : wire10) ?
          $signed({((8'ha7) ? reg63 : wire11)}) : reg14[(2'h3):(1'h1)]));
    end
  assign wire67 = (reg65[(4'hb):(4'h8)] ?
                      (wire13[(3'h5):(1'h0)] != $signed(wire11)) : reg64);
  always
    @(posedge clk) begin
      reg68 <= (~|(~&((reg64 ? reg62 : wire8) ?
          wire57[(1'h1):(1'h1)] : $signed(reg66))));
      reg69 <= $unsigned((wire60[(5'h10):(4'hc)] ?
          (wire6[(2'h2):(2'h2)] ^ (wire57 << wire7[(3'h7):(3'h7)])) : reg68));
      reg70 <= wire13[(4'hb):(2'h2)];
      reg71 <= $signed((&wire57[(1'h0):(1'h0)]));
      reg72 <= ($unsigned((($unsigned((8'hbd)) ?
              $signed(wire60) : (^reg66)) != (~&wire13[(4'h8):(2'h3)]))) ?
          (wire8 ?
              wire15 : wire67) : $unsigned(((wire67[(4'h8):(2'h3)] + $unsigned(reg14)) | ((-wire60) >> wire7[(3'h7):(1'h1)]))));
    end
  assign wire73 = reg61[(2'h2):(2'h2)];
  module74 #() modinst104 (.wire75(wire10), .wire76(wire6), .y(wire103), .wire77(wire15), .wire78(wire12), .clk(clk));
  assign wire105 = {$unsigned($signed(reg14)),
                       $signed((!$unsigned((wire6 ? (8'hba) : wire10))))};
  assign wire106 = (wire8[(4'h9):(4'h9)] ?
                       wire15 : (wire9[(4'ha):(4'h8)] * $signed({reg61[(3'h6):(2'h2)]})));
  assign wire107 = wire103;
  module108 #() modinst141 (wire140, clk, wire11, wire103, wire105, wire13);
  always
    @(posedge clk) begin
      if (wire13[(5'h12):(4'he)])
        begin
          if ({wire60[(4'hf):(3'h7)]})
            begin
              reg142 <= (reg71[(5'h15):(1'h0)] ? wire15 : reg61);
              reg143 <= $signed(($signed(wire11) ~^ wire10));
              reg144 <= $signed(reg62);
              reg145 <= $signed({reg68});
              reg146 <= wire10;
            end
          else
            begin
              reg142 <= (reg69[(4'ha):(2'h3)] && ($signed(({wire57, reg63} ?
                  $unsigned(wire105) : (wire105 >> reg66))) - wire105[(1'h1):(1'h0)]));
              reg143 <= reg69[(2'h2):(2'h2)];
              reg144 <= ({(wire105 > (wire106[(4'h8):(3'h6)] ?
                      $signed(wire60) : reg65)),
                  wire107} && (|$unsigned(reg63)));
            end
          reg147 <= (!(+$signed(wire15[(4'hc):(4'hb)])));
          reg148 <= $unsigned((($unsigned($signed(wire7)) ?
                  $unsigned($signed(wire107)) : ($signed(wire73) ^~ (reg147 ^ wire60))) ?
              $signed({$unsigned((8'hb4))}) : {((wire15 ?
                      (8'hb4) : reg70) + $unsigned(reg61)),
                  ((wire59 + reg72) ^~ (wire10 ? reg68 : reg146))}));
        end
      else
        begin
          reg142 <= ($unsigned(wire8) >= (^~reg66[(2'h2):(2'h2)]));
          if ($signed(($signed($unsigned((+wire106))) * (&(~&wire103)))))
            begin
              reg143 <= $unsigned($unsigned(reg63[(1'h1):(1'h1)]));
              reg144 <= $unsigned(wire11[(4'hb):(2'h2)]);
              reg145 <= reg145[(2'h2):(1'h1)];
              reg146 <= ($unsigned((^reg66)) >= $signed((~&$unsigned({reg64,
                  reg145}))));
            end
          else
            begin
              reg143 <= (+($signed(wire57[(3'h4):(1'h0)]) && $signed(wire7)));
              reg144 <= ((^($unsigned((reg65 ?
                  reg62 : (8'hac))) & $unsigned($unsigned(wire73)))) && $signed(reg71));
              reg145 <= {{$unsigned(reg70[(4'hd):(4'hc)])}};
            end
          reg147 <= reg142[(2'h3):(1'h1)];
          reg148 <= (($signed((reg61[(1'h0):(1'h0)] ?
                      wire60[(4'ha):(1'h1)] : (reg146 ? (8'h9d) : wire67))) ?
                  $signed((~^(wire59 ?
                      wire140 : reg65))) : ($unsigned((^~wire60)) ?
                      $unsigned(wire73[(2'h2):(1'h1)]) : reg142)) ?
              $signed({((wire12 && reg72) ?
                      ((8'haa) ?
                          (8'haa) : wire57) : (reg69 > wire11))}) : ((~^(-reg145[(1'h0):(1'h0)])) + wire73[(1'h1):(1'h0)]));
        end
      reg149 <= wire67[(3'h5):(2'h2)];
      if ((~(&($signed($unsigned(wire107)) + ((wire7 | reg63) ~^ (^~reg61))))))
        begin
          reg150 <= (^~wire9[(4'hb):(3'h6)]);
          reg151 <= $unsigned(reg142[(3'h4):(3'h4)]);
        end
      else
        begin
          if ($signed((!reg61[(4'h9):(1'h0)])))
            begin
              reg150 <= $unsigned(({{(wire12 && reg71), $signed(reg149)},
                  reg63[(1'h1):(1'h1)]} >>> (!{(!wire106)})));
              reg151 <= ($unsigned(((wire12 ^~ (~^reg70)) ?
                  ($signed((8'had)) ^~ (8'h9f)) : wire15)) > (8'had));
              reg152 <= (reg64 ?
                  $signed(wire106) : ({(wire140 ?
                          $unsigned(wire9) : {reg62})} > (~((wire13 ?
                      wire11 : reg71) ^ reg66[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg150 <= ((+(|((reg145 ? reg148 : wire57) ?
                  $signed(wire15) : {reg147,
                      wire60}))) & (^$unsigned($unsigned((~reg145)))));
              reg151 <= wire106[(4'hc):(3'h7)];
              reg152 <= $signed(wire106);
            end
          reg153 <= $unsigned(($signed(wire8[(4'h9):(3'h7)]) ?
              (wire60[(3'h7):(2'h2)] ?
                  reg69[(2'h3):(1'h1)] : ($unsigned((8'ha3)) ?
                      wire7 : (|reg71))) : (&$unsigned({reg65, (8'h9f)}))));
          reg154 <= ($signed({(^reg61[(4'h9):(1'h0)]), wire57[(1'h1):(1'h1)]}) ?
              ((reg152[(1'h1):(1'h1)] > (~|$signed(reg142))) ?
                  ((^(reg70 ? wire60 : reg149)) ?
                      reg151 : ((reg148 - wire105) ?
                          $unsigned(wire105) : $signed(reg64))) : ((&(reg142 < reg151)) ?
                      reg61 : ($signed(wire140) ?
                          wire106[(2'h2):(2'h2)] : (-(8'hab))))) : $signed($unsigned(reg64[(2'h2):(2'h2)])));
        end
    end
  assign wire155 = (-($signed(reg151[(1'h1):(1'h1)]) ?
                       ($signed(reg68[(3'h4):(2'h2)]) ?
                           $unsigned(wire59) : $unsigned(wire9[(3'h5):(2'h2)])) : reg71));
endmodule

module module108
#(parameter param138 = ({((|((8'hbb) ? (8'ha8) : (8'hb7))) ^ (-{(8'hb3), (8'h9e)})), ({((8'hbc) ~^ (8'hbc)), {(8'hbe), (8'hbe)}} - (8'hac))} ? (~^(!(((8'ha2) ? (8'hba) : (8'hb8)) <<< ((8'ha1) ? (8'ha0) : (8'ha3))))) : (((~^((8'ha5) ? (8'hb8) : (8'ha2))) ? (((8'ha8) ? (8'hb4) : (8'ha8)) ? (~|(8'hae)) : ((8'hba) <<< (8'ha4))) : ((!(8'ha9)) == ((8'hba) ? (8'ha2) : (8'hb7)))) ? (~&(~&{(8'hab), (8'ha3)})) : (8'ha7))), 
parameter param139 = (param138 ^ {((7'h44) ? {(~|(8'ha7))} : ((~^param138) & (|param138)))}))
(y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire112;
  input wire signed [(5'h10):(1'h0)] wire111;
  input wire signed [(2'h2):(1'h0)] wire110;
  input wire signed [(5'h15):(1'h0)] wire109;
  wire signed [(4'he):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire136;
  wire signed [(4'hf):(1'h0)] wire135;
  wire [(4'hb):(1'h0)] wire134;
  wire [(4'he):(1'h0)] wire133;
  wire [(4'h9):(1'h0)] wire132;
  wire signed [(3'h6):(1'h0)] wire131;
  wire [(4'h9):(1'h0)] wire130;
  wire signed [(5'h13):(1'h0)] wire129;
  wire [(3'h5):(1'h0)] wire128;
  wire signed [(5'h15):(1'h0)] wire127;
  wire [(4'h8):(1'h0)] wire126;
  wire [(4'hd):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire124;
  wire signed [(4'ha):(1'h0)] wire122;
  wire signed [(3'h4):(1'h0)] wire121;
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg115 = (1'h0);
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire122,
                 wire121,
                 reg123,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg113 <= $unsigned((wire112[(2'h2):(1'h1)] >= $signed({wire112})));
      if ((~^(($signed((-wire109)) > (~|(wire110 ? wire111 : wire111))) ?
          {$signed(reg113),
              (~$signed(wire111))} : ((wire112[(1'h0):(1'h0)] ^ reg113[(3'h4):(1'h0)]) ^~ (&$signed(wire109))))))
        begin
          reg114 <= $signed($unsigned((8'hb1)));
          reg115 <= $signed(($unsigned(((wire109 * reg113) ?
                  wire112[(1'h1):(1'h1)] : $signed(wire110))) ?
              wire111 : ((~^(~&wire111)) >>> ((8'h9f) ?
                  wire109 : (~^reg114)))));
          reg116 <= reg114;
        end
      else
        begin
          reg114 <= ((~($signed($signed(wire110)) >= wire111[(4'hf):(2'h3)])) == $unsigned($signed(({(8'ha4)} ?
              (reg113 == reg113) : (7'h41)))));
          if ($signed(reg114[(3'h5):(2'h2)]))
            begin
              reg115 <= (8'had);
            end
          else
            begin
              reg115 <= (^wire109[(1'h0):(1'h0)]);
              reg116 <= (8'hbb);
              reg117 <= {($unsigned($signed(reg115)) == (((reg113 >> wire110) | (reg114 ?
                      reg113 : reg116)) != $signed(((8'hab) ?
                      wire109 : reg115))))};
              reg118 <= reg114[(1'h1):(1'h1)];
            end
        end
      reg119 <= $signed($signed(reg117[(3'h4):(1'h1)]));
      reg120 <= $unsigned(reg113[(1'h0):(1'h0)]);
    end
  assign wire121 = $unsigned((8'hba));
  assign wire122 = $unsigned($unsigned({reg114}));
  always
    @(posedge clk) begin
      reg123 <= wire122;
    end
  assign wire124 = reg115;
  assign wire125 = reg119;
  assign wire126 = $unsigned(reg117[(4'hf):(2'h3)]);
  assign wire127 = ((wire124[(2'h3):(1'h1)] > ($signed(wire122) && reg113)) ?
                       (|$signed({(wire110 ~^ reg115),
                           (wire110 | reg115)})) : ((((&wire110) ?
                                   (|wire121) : (&wire122)) ?
                               (reg117 || {wire121}) : wire109[(2'h3):(2'h2)]) ?
                           ($signed((+(8'ha8))) <<< reg114) : $unsigned(wire124)));
  assign wire128 = (8'ha7);
  assign wire129 = (wire112 - (wire124 ?
                       ((wire121[(1'h1):(1'h1)] > (wire127 ^~ wire126)) >> (|((8'h9f) < reg113))) : (+(((8'hbc) ?
                               reg119 : (8'h9f)) ?
                           wire121[(1'h1):(1'h0)] : (reg118 ?
                               reg113 : (8'ha3))))));
  assign wire130 = $unsigned(($signed(reg118) + $unsigned({(^~wire124),
                       reg114})));
  assign wire131 = (-$unsigned(($signed($signed(reg123)) ?
                       ((wire122 >> (8'hb9)) == {reg115}) : $signed((wire110 ?
                           wire121 : (8'hbb))))));
  assign wire132 = wire128;
  assign wire133 = (($unsigned(((&reg117) ^~ $unsigned(reg114))) < wire112) | {(8'hb5),
                       (^($signed(reg113) & wire131))});
  assign wire134 = (((8'ha3) ?
                       ($unsigned((~|wire130)) >> ($unsigned((8'hba)) ?
                           (wire112 << wire127) : (wire129 ~^ wire110))) : wire131) >= wire124[(3'h5):(3'h4)]);
  assign wire135 = ($unsigned(wire111) != $signed((($signed(wire133) > (wire111 ?
                           (8'ha3) : reg116)) ?
                       ((!reg116) ?
                           $unsigned(wire122) : $unsigned((8'hb2))) : (8'hae))));
  assign wire136 = wire109;
  assign wire137 = $unsigned(((~|wire109) + ($signed(wire129[(3'h5):(1'h1)]) ?
                       {(|wire132),
                           (wire133 ?
                               reg123 : wire112)} : reg114[(2'h2):(1'h1)])));
endmodule

module module74
#(parameter param101 = (~(((((8'hb4) ? (8'ha2) : (8'hb5)) ? ((8'had) ? (8'hb2) : (8'haa)) : ((8'hb3) ? (8'haf) : (8'hab))) <= (-((8'ha2) & (8'hb7)))) || ({((8'ha0) ? (8'hbd) : (8'ha1))} ? (((7'h44) ? (8'hbe) : (8'hba)) ? (&(7'h40)) : ((8'hb0) ? (8'h9f) : (8'ha8))) : ({(8'haf)} ~^ ((8'hbe) ? (8'hbb) : (8'ha7)))))), 
parameter param102 = (8'hb7))
(y, clk, wire78, wire77, wire76, wire75);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire78;
  input wire signed [(4'hd):(1'h0)] wire77;
  input wire [(4'h9):(1'h0)] wire76;
  input wire signed [(2'h3):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire86,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire79 = ((wire75[(2'h3):(2'h3)] ?
                          ($signed(wire76[(4'h9):(1'h1)]) ?
                              (^~(wire77 > wire77)) : $unsigned((wire77 + wire75))) : wire76) ?
                      (({$signed(wire76)} == wire78) ?
                          ((wire75 << $signed(wire76)) | ($signed(wire76) ?
                              wire76[(4'h8):(1'h0)] : $signed(wire78))) : wire77) : wire77);
  assign wire80 = (~(($signed(wire76[(1'h0):(1'h0)]) ^~ $unsigned($unsigned((8'h9f)))) ?
                      $signed((-wire78)) : {$signed(wire76),
                          {(wire76 ? wire77 : wire76), wire75}}));
  assign wire81 = {wire77, (~&wire80[(1'h0):(1'h0)])};
  assign wire82 = {({{{wire77}, {wire76}},
                          {$signed(wire78)}} * (~(wire77[(3'h5):(1'h1)] << (wire75 ?
                          wire76 : wire75))))};
  assign wire83 = (wire76 ^~ $signed(wire77));
  always
    @(posedge clk) begin
      reg84 <= $signed($unsigned((^~{(wire78 ? wire81 : wire79),
          wire80[(4'ha):(1'h1)]})));
      reg85 <= wire79[(4'hd):(3'h5)];
    end
  assign wire86 = (^~wire75[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg87 <= (wire82[(3'h6):(2'h2)] ?
          wire83[(2'h2):(2'h2)] : $signed((wire86 ?
              (((8'ha4) ?
                  reg84 : wire81) != reg84[(4'h9):(3'h4)]) : wire83[(5'h11):(4'hf)])));
      reg88 <= wire80[(4'hc):(4'hc)];
      reg89 <= reg88;
      reg90 <= (|wire80);
      if ($signed(wire82))
        begin
          reg91 <= {(~&(((wire82 ? reg88 : reg84) ?
                  $unsigned((8'hae)) : (wire79 | reg88)) - $signed((wire77 ?
                  wire81 : (8'had))))),
              (reg89[(5'h14):(3'h4)] ?
                  (8'haa) : $unsigned($signed(wire86[(4'h8):(2'h3)])))};
          reg92 <= (^~(reg90 ^ (+$unsigned((wire76 ? wire81 : (8'h9c))))));
          reg93 <= reg84;
        end
      else
        begin
          if ((reg91 > $unsigned(wire82)))
            begin
              reg91 <= wire83[(4'ha):(3'h5)];
            end
          else
            begin
              reg91 <= $unsigned(wire82[(1'h0):(1'h0)]);
              reg92 <= (~&(reg88[(1'h1):(1'h0)] - reg88[(3'h4):(1'h0)]));
              reg93 <= ($signed(wire75) && wire86[(4'h9):(3'h5)]);
            end
          reg94 <= (!((|$signed((reg93 * (7'h43)))) >> wire75[(2'h2):(2'h2)]));
        end
    end
  assign wire95 = ({{$signed(reg85), $signed($signed(reg85))}} ?
                      ((8'hae) < reg87) : (wire80[(1'h0):(1'h0)] >= $unsigned($signed(wire75))));
  assign wire96 = $signed($unsigned((~^(!((8'hab) ? wire77 : wire86)))));
  assign wire97 = ($unsigned(wire81) || (~$unsigned(wire76[(2'h2):(1'h1)])));
  assign wire98 = (($signed($unsigned($signed(wire78))) ~^ ($unsigned(wire83[(4'ha):(3'h6)]) == $unsigned((wire95 & wire83)))) ?
                      (~^reg94[(3'h4):(2'h2)]) : wire86[(3'h5):(2'h2)]);
  assign wire99 = $signed($unsigned($signed($signed((wire97 != wire82)))));
  assign wire100 = (wire75[(1'h1):(1'h0)] ?
                       wire95[(1'h0):(1'h0)] : ({(|$signed(reg87)),
                               wire97[(2'h3):(2'h2)]} ?
                           $unsigned(($signed(wire97) ?
                               (wire96 ? reg85 : wire79) : (wire99 ?
                                   (8'hab) : reg94))) : (wire75 ?
                               $signed(((8'hae) - wire77)) : wire86)));
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire21;
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire21,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire21 = (wire20 <<< ((8'ha7) != wire17[(3'h6):(2'h3)]));
  always
    @(posedge clk) begin
      if ((8'hbd))
        begin
          reg22 <= (8'ha1);
        end
      else
        begin
          reg22 <= $signed($signed((!(wire18 ?
              (wire20 ? wire19 : wire21) : wire18[(3'h5):(1'h1)]))));
          reg23 <= wire19;
          if (reg23)
            begin
              reg24 <= wire18;
              reg25 <= $signed((((~|wire17[(4'h8):(3'h7)]) >= ($unsigned(wire19) ?
                      $unsigned(reg24) : $unsigned(reg24))) ?
                  $unsigned($signed(reg23[(4'h9):(3'h4)])) : wire20));
              reg26 <= ((^~wire19) ?
                  $unsigned((($signed(wire21) - $unsigned(reg24)) ?
                      wire21[(4'hd):(4'hc)] : ((~&(8'h9c)) * (reg24 ?
                          wire18 : (8'hb8))))) : (~|((wire21 ?
                          $signed((8'ha6)) : $unsigned(reg22)) ?
                      (wire18 ?
                          wire17[(2'h2):(1'h1)] : (reg22 <<< wire21)) : (^(~^reg22)))));
              reg27 <= (-$signed(($signed($signed(wire20)) ?
                  $unsigned(wire21) : ($signed(wire20) ? (+reg23) : reg26))));
              reg28 <= reg24;
            end
          else
            begin
              reg24 <= ($unsigned(reg28) ^ wire18[(3'h5):(1'h1)]);
            end
          reg29 <= wire20[(4'hd):(4'hc)];
        end
      reg30 <= wire21[(4'hb):(4'hb)];
      reg31 <= $unsigned(((reg27[(1'h0):(1'h0)] ? wire19 : {(reg22 > reg27)}) ?
          (reg27[(2'h3):(2'h3)] - ((-wire19) ?
              (8'hbc) : (reg23 ? wire19 : wire20))) : (^(8'hae))));
      reg32 <= (~&$unsigned(reg26[(2'h2):(1'h0)]));
    end
  assign wire33 = (~&(-reg22[(1'h0):(1'h0)]));
  assign wire34 = (($unsigned((8'hb4)) ?
                          (8'ha5) : (($unsigned(wire18) || (wire20 & wire33)) >>> ((reg26 >= reg22) > reg27))) ?
                      $signed(wire19) : reg23[(4'h8):(1'h1)]);
  assign wire35 = {{($unsigned($signed(wire20)) ?
                              reg30[(3'h4):(1'h0)] : (wire33[(4'ha):(3'h6)] ?
                                  (reg27 ?
                                      (8'ha0) : reg22) : (wire21 == wire17))),
                          $unsigned(reg27[(1'h0):(1'h0)])},
                      reg26[(2'h2):(2'h2)]};
  assign wire36 = $unsigned((8'h9f));
  always
    @(posedge clk) begin
      reg37 <= $signed($signed(wire33));
      reg38 <= reg30[(4'h8):(1'h1)];
      reg39 <= {reg37, (^~$signed($unsigned(reg22[(2'h3):(2'h2)])))};
      reg40 <= {$unsigned($signed(($signed(reg31) ?
              $unsigned(reg32) : reg26[(2'h2):(1'h0)])))};
      reg41 <= $signed({($unsigned(reg29) ?
              $unsigned((8'ha3)) : $signed(reg28[(5'h10):(5'h10)])),
          (!((+(8'ha0)) ? (reg39 ? (7'h41) : reg27) : (!wire36)))});
    end
  assign wire42 = $signed((+(8'ha3)));
  assign wire43 = (8'hb1);
  assign wire44 = reg22[(1'h0):(1'h0)];
  assign wire45 = (+{(+wire17),
                      ($unsigned(wire20[(2'h2):(1'h0)]) ^~ $unsigned($signed(reg41)))});
  assign wire46 = $unsigned((^(+(~|(reg40 ^~ (8'h9c))))));
  assign wire47 = {(($unsigned(wire34[(4'he):(4'hb)]) <= (!(~^wire33))) || (+reg37))};
  assign wire48 = ($signed(wire20[(4'he):(3'h5)]) ~^ (7'h44));
  assign wire49 = (8'ha2);
  always
    @(posedge clk) begin
      reg50 <= (!(~&(~wire35[(1'h0):(1'h0)])));
      reg51 <= $signed((&wire21[(4'ha):(4'ha)]));
      reg52 <= (8'ha1);
      reg53 <= (-wire48[(1'h1):(1'h1)]);
      reg54 <= reg31;
    end
  assign wire55 = (((&(!wire46[(1'h1):(1'h0)])) ^~ (^~(!(~reg41)))) <= ($unsigned(wire44) ?
                      reg40[(3'h6):(1'h0)] : reg30[(4'h8):(1'h0)]));
  assign wire56 = ($signed(({reg32} ?
                      $unsigned({wire33}) : {(reg40 ?
                              reg50 : (8'h9d))})) || reg27);
endmodule
