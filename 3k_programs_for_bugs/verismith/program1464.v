module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire224;
  wire [(3'h7):(1'h0)] wire223;
  wire signed [(5'h14):(1'h0)] wire222;
  wire signed [(5'h13):(1'h0)] wire64;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire66;
  wire signed [(5'h13):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire220;
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  assign y = {wire224,
                 wire223,
                 wire222,
                 wire64,
                 wire35,
                 wire34,
                 wire33,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire30,
                 wire66,
                 wire67,
                 wire68,
                 wire220,
                 reg32,
                 (1'h0)};
  assign wire5 = $signed($signed((8'ha4)));
  assign wire6 = (!wire2[(1'h0):(1'h0)]);
  assign wire7 = (wire4 ?
                     (wire1 & $signed($signed($unsigned(wire4)))) : $signed(((wire6 ?
                         {wire0, wire2} : (wire3 ? wire3 : wire0)) ^~ {(wire3 ?
                             (8'hbc) : wire2),
                         (wire6 ? wire3 : wire5)})));
  assign wire8 = (~wire1);
  assign wire9 = wire3[(3'h4):(1'h0)];
  assign wire10 = {($unsigned($unsigned((wire0 ? wire6 : wire2))) ?
                          $unsigned($signed((wire7 ?
                              wire6 : wire2))) : wire3[(4'h9):(2'h3)]),
                      wire3[(4'ha):(1'h0)]};
  assign wire11 = $unsigned($unsigned(((8'h9f) ?
                      $unsigned((!wire0)) : ({wire1} ~^ (wire1 ^~ wire4)))));
  assign wire12 = wire0[(4'h8):(3'h5)];
  assign wire13 = {(((wire8 != wire9) ?
                          (~^(wire8 ?
                              wire11 : (8'had))) : (8'ha1)) + $unsigned((8'hbf))),
                      ((-$unsigned((wire7 ? (8'haf) : wire4))) ?
                          $signed((wire1[(2'h3):(1'h0)] ?
                              (wire4 >> (8'haa)) : (wire5 <<< wire12))) : (-$unsigned((~&wire0))))};
  assign wire14 = $signed(wire5[(4'he):(1'h1)]);
  module15 #() modinst31 (.clk(clk), .wire18(wire5), .wire17(wire8), .wire19(wire10), .wire20(wire13), .wire16(wire11), .y(wire30));
  always
    @(posedge clk) begin
      reg32 <= wire3;
    end
  assign wire33 = wire9[(2'h2):(1'h1)];
  assign wire34 = {((8'hb8) ?
                          (($unsigned(wire7) + $unsigned(wire14)) && $signed(wire0[(1'h1):(1'h1)])) : ({$signed(wire5),
                              wire5[(4'h9):(4'h8)]} ~^ ({wire3} ?
                              wire0[(4'hf):(3'h6)] : $signed(wire13)))),
                      $unsigned({(wire33[(3'h5):(2'h3)] + $unsigned(wire3)),
                          ((8'hb8) ?
                              wire1[(4'hf):(3'h7)] : (wire0 ~^ wire12))})};
  assign wire35 = (wire14 ?
                      wire0 : $unsigned(((-((8'ha7) >> wire8)) ?
                          wire13[(3'h7):(1'h0)] : wire2[(1'h1):(1'h1)])));
  module36 #() modinst65 (wire64, clk, wire35, wire6, wire13, wire0, wire3);
  assign wire66 = $unsigned(wire9);
  assign wire67 = ((8'ha7) == (8'hb1));
  assign wire68 = ($unsigned(({{wire0}} ?
                      (^~$unsigned(wire4)) : $signed(((7'h44) ?
                          reg32 : wire12)))) < (|wire66));
  module69 #() modinst221 (.wire71(wire6), .wire72(reg32), .wire70(wire13), .y(wire220), .wire73(wire64), .clk(clk));
  assign wire222 = (($unsigned($unsigned($unsigned(wire6))) ?
                       ($signed(wire4) > ((~^wire67) < (wire0 ?
                           wire11 : wire2))) : (+(+(~^wire4)))) & $signed($signed(wire34[(3'h5):(3'h5)])));
  assign wire223 = ((~$signed($signed($unsigned((8'ha2))))) & wire1[(4'h8):(3'h7)]);
  assign wire224 = (wire4 & $unsigned({$unsigned((wire64 ? (8'had) : (8'h9c))),
                       ({wire68} >> $signed(wire3))}));
endmodule

module module69
#(parameter param218 = (8'hbb), 
parameter param219 = (~^(!(^(^param218)))))
(y, clk, wire70, wire71, wire72, wire73);
  output wire [(32'h299):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire70;
  input wire signed [(4'hf):(1'h0)] wire71;
  input wire [(4'hf):(1'h0)] wire72;
  input wire signed [(5'h13):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire213;
  wire [(4'h9):(1'h0)] wire212;
  wire [(4'h8):(1'h0)] wire211;
  wire [(4'hf):(1'h0)] wire187;
  wire signed [(4'he):(1'h0)] wire180;
  wire [(3'h7):(1'h0)] wire179;
  wire signed [(2'h2):(1'h0)] wire175;
  wire [(4'h8):(1'h0)] wire139;
  wire signed [(4'he):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire105;
  wire signed [(4'h8):(1'h0)] wire148;
  wire signed [(4'hd):(1'h0)] wire162;
  reg signed [(4'h9):(1'h0)] reg217 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg216 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg215 = (1'h0);
  reg [(3'h7):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg210 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg208 = (1'h0);
  reg [(5'h14):(1'h0)] reg207 = (1'h0);
  reg [(4'hd):(1'h0)] reg206 = (1'h0);
  reg [(5'h11):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg204 = (1'h0);
  reg [(2'h2):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg202 = (1'h0);
  reg [(2'h3):(1'h0)] reg201 = (1'h0);
  reg [(5'h13):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg198 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg196 = (1'h0);
  reg [(3'h5):(1'h0)] reg195 = (1'h0);
  reg [(5'h14):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg193 = (1'h0);
  reg [(4'h8):(1'h0)] reg192 = (1'h0);
  reg [(5'h11):(1'h0)] reg191 = (1'h0);
  reg [(4'h8):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg189 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg188 = (1'h0);
  reg [(4'hd):(1'h0)] reg186 = (1'h0);
  reg [(3'h7):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg184 = (1'h0);
  reg signed [(4'he):(1'h0)] reg183 = (1'h0);
  reg [(4'hb):(1'h0)] reg182 = (1'h0);
  reg [(3'h6):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg178 = (1'h0);
  reg [(5'h12):(1'h0)] reg177 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg143 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg146 = (1'h0);
  reg [(5'h13):(1'h0)] reg147 = (1'h0);
  assign y = {wire213,
                 wire212,
                 wire211,
                 wire187,
                 wire180,
                 wire179,
                 wire175,
                 wire139,
                 wire107,
                 wire74,
                 wire75,
                 wire105,
                 wire148,
                 wire162,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
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
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg178,
                 reg177,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 (1'h0)};
  assign wire74 = wire71;
  assign wire75 = (|($signed((8'hb4)) ?
                      (wire72[(3'h6):(2'h3)] ?
                          $unsigned($unsigned(wire72)) : ((wire74 ?
                                  wire72 : wire71) ?
                              (&(8'hba)) : (wire73 ?
                                  (8'hbd) : wire73))) : wire74));
  module76 #() modinst106 (wire105, clk, wire74, wire73, wire71, wire70, wire75);
  assign wire107 = wire105[(1'h0):(1'h0)];
  module108 #() modinst140 (wire139, clk, wire107, wire72, wire71, wire105, wire73);
  always
    @(posedge clk) begin
      reg141 <= $unsigned({wire75, $signed(wire139[(2'h2):(1'h1)])});
      if (($signed((~((&wire72) <= (wire105 ?
          wire73 : wire74)))) || $signed(((~^(wire71 ?
          wire107 : (8'h9e))) <= reg141))))
        begin
          if (wire139)
            begin
              reg142 <= wire105;
              reg143 <= $unsigned(((wire72 || $signed($unsigned(wire71))) ?
                  ($unsigned((~^(7'h40))) >>> ($signed(wire107) ?
                      (!wire70) : (^~wire105))) : (^(~^wire72[(4'hb):(1'h0)]))));
              reg144 <= $unsigned((~|$unsigned((-(wire73 >>> wire139)))));
              reg145 <= (wire72[(3'h6):(1'h1)] ^~ ($signed($unsigned($signed(wire72))) ?
                  reg143[(4'hd):(4'h9)] : wire105[(2'h2):(2'h2)]));
            end
          else
            begin
              reg142 <= (reg144 ?
                  (($unsigned($signed(wire71)) ?
                          (wire105[(3'h6):(3'h5)] != {wire139}) : (&$signed((8'ha6)))) ?
                      (^$signed(reg142[(3'h5):(2'h3)])) : $unsigned($unsigned(wire105))) : wire73[(4'he):(4'h9)]);
              reg143 <= (~reg141[(4'ha):(4'h8)]);
              reg144 <= $unsigned(wire107);
            end
        end
      else
        begin
          if ({(^(reg142 - (wire70 ? reg143[(2'h3):(2'h2)] : wire139))),
              (~|$signed($signed($signed(reg143))))})
            begin
              reg142 <= $signed($unsigned(wire73[(5'h12):(1'h0)]));
              reg143 <= ($signed((8'ha7)) == $signed(wire71));
              reg144 <= $unsigned((|($unsigned(wire107) ?
                  ($unsigned(wire139) ?
                      (reg144 << (8'h9e)) : $signed(reg144)) : $signed((^~wire74)))));
            end
          else
            begin
              reg142 <= (!(({$unsigned(wire107)} ?
                  ((+(8'ha3)) ?
                      wire105 : $unsigned(wire75)) : $unsigned(wire75)) & ({reg144} ?
                  reg142[(3'h4):(3'h4)] : $signed(reg144))));
              reg143 <= ($signed($signed(($unsigned(wire105) >= $unsigned(reg143)))) ^~ (8'hba));
            end
          reg145 <= (|($signed(((reg144 ? (7'h40) : reg144) + (wire107 ?
              reg143 : wire107))) >> $signed(wire73[(5'h11):(5'h10)])));
          reg146 <= ({{$signed($unsigned(reg145)), $signed(reg141)},
                  reg143[(2'h2):(1'h0)]} ?
              wire107[(1'h0):(1'h0)] : (^($unsigned(((8'hae) ^~ reg143)) ?
                  wire139 : ($unsigned(wire72) >= $unsigned(reg145)))));
        end
      reg147 <= ($unsigned({{$signed(wire105)}}) ?
          $signed((($signed((8'ha7)) || wire70) ?
              (-wire105) : $unsigned((!reg144)))) : $signed(reg145));
    end
  assign wire148 = {reg143};
  module149 #() modinst163 (.wire152(wire105), .clk(clk), .wire151(reg147), .y(wire162), .wire153(wire71), .wire150(wire73));
  module164 #() modinst176 (wire175, clk, wire105, reg146, wire139, reg141);
  always
    @(posedge clk) begin
      reg177 <= {$unsigned((!wire73)),
          ($unsigned(({reg143, reg147} ?
                  ((8'ha0) ? (7'h40) : wire107) : (reg147 <<< wire71))) ?
              (|{$unsigned(wire105)}) : wire107[(2'h2):(1'h0)])};
      reg178 <= (((($unsigned(wire105) | reg146[(4'h8):(1'h0)]) ?
          ($unsigned(wire75) ?
              wire73 : (reg142 ? wire162 : (8'h9e))) : (wire70 ?
              $unsigned(wire105) : $signed(wire139))) == wire162) != ((~^$unsigned(reg142[(3'h5):(1'h0)])) ?
          $unsigned((+$unsigned(wire72))) : reg144));
    end
  assign wire179 = $unsigned((({{reg143, (8'ha1)}} ?
                       (wire72 ?
                           {reg145,
                               reg147} : (-reg143)) : ($signed(reg144) * (^reg147))) ~^ wire162[(2'h2):(1'h1)]));
  assign wire180 = $unsigned(reg144);
  always
    @(posedge clk) begin
      if (reg144)
        begin
          reg181 <= ($signed($unsigned(($signed(wire70) ?
                  (wire162 <= wire107) : ((7'h40) ? wire70 : wire70)))) ?
              $signed(($unsigned($unsigned(wire75)) ?
                  ((!(8'hbe)) ?
                      reg143 : (wire70 * reg145)) : wire72[(4'hd):(4'hd)])) : ((-wire107) ?
                  (+wire107) : $unsigned($unsigned((!reg178)))));
        end
      else
        begin
          reg181 <= (((8'hbf) ?
              ((wire179[(3'h7):(3'h6)] == (~reg141)) ?
                  wire162 : $unsigned((reg146 ?
                      (8'hb0) : reg141))) : $unsigned({(wire179 - wire148),
                  ((8'hb9) != wire139)})) >>> $signed(wire71[(3'h4):(1'h1)]));
          reg182 <= ((~$signed($unsigned((reg147 && reg143)))) != reg146[(5'h13):(4'h9)]);
        end
      reg183 <= wire105;
      reg184 <= (wire139 ?
          ($signed((reg178[(4'h9):(3'h5)] ?
              (wire71 <<< reg144) : {reg177, wire175})) ^~ (((|wire105) ?
                  (~|reg141) : $unsigned(wire71)) ?
              {$unsigned(wire75), reg142} : reg141)) : (8'h9d));
      reg185 <= wire73[(4'ha):(2'h2)];
      reg186 <= (wire75 ?
          ((({wire72, (8'ha9)} ?
                  reg181 : $signed((8'hb9))) == {(wire72 ^ wire75),
                  $signed((8'haf))}) ?
              $signed({reg184[(2'h2):(1'h0)],
                  wire74}) : ((wire107[(3'h7):(2'h3)] ?
                      $unsigned((8'ha6)) : $unsigned(wire175)) ?
                  (^~(~wire71)) : ($signed(wire179) ?
                      wire179[(1'h0):(1'h0)] : wire107))) : $unsigned(($signed((8'h9d)) == ((~reg182) ~^ (wire175 <<< reg177)))));
    end
  assign wire187 = wire107[(4'hb):(2'h2)];
  always
    @(posedge clk) begin
      reg188 <= wire175[(1'h0):(1'h0)];
      reg189 <= wire162;
      if ((wire71 >= ({$signed($unsigned(wire71))} && ((~^$signed(wire180)) ?
          ((reg146 >= reg183) + $signed(wire75)) : (wire74 ?
              reg143 : reg178[(4'hb):(3'h7)])))))
        begin
          reg190 <= ((({$unsigned(wire72)} > ($unsigned(reg142) == (wire75 != (8'ha2)))) ?
                  (reg145 ? (~^$unsigned(reg144)) : wire179) : ({(+reg178),
                      (wire148 <<< wire148)} | (~^{reg178}))) ?
              wire74 : (8'hb4));
          reg191 <= reg142[(3'h4):(2'h3)];
          if ((($unsigned($unsigned($unsigned(wire187))) > (!$unsigned($unsigned(reg181)))) - reg182[(1'h0):(1'h0)]))
            begin
              reg192 <= $signed({(+(-(reg178 < reg186))), reg147});
              reg193 <= ($signed($signed(wire180[(3'h5):(2'h3)])) == $signed(((((8'hba) ^~ reg185) ~^ $signed(wire187)) + ((wire105 >> reg188) ~^ (reg192 & reg182)))));
              reg194 <= (reg183 ?
                  (((~^(reg188 ? reg184 : reg142)) >= reg190[(3'h5):(1'h0)]) ?
                      wire175 : ($unsigned($signed(reg191)) ?
                          (+(^~(8'ha9))) : reg189[(2'h2):(2'h2)])) : reg181[(2'h3):(1'h1)]);
              reg195 <= $unsigned($unsigned({(-$unsigned(reg178))}));
            end
          else
            begin
              reg192 <= $signed(wire74);
              reg193 <= (&wire71[(4'he):(3'h5)]);
              reg194 <= ($unsigned((reg144 & (|reg190))) ?
                  ($signed($unsigned(reg191)) ?
                      {($signed(reg193) + $unsigned(wire180)),
                          (-$signed(reg194))} : ($signed($signed(reg189)) >>> ((reg191 >= reg188) >>> $unsigned((8'h9e))))) : $signed($unsigned(reg147)));
              reg195 <= (reg186 <= (8'hb5));
              reg196 <= $signed((wire70 > wire105));
            end
          if ($signed((~(wire75 ?
              (reg195[(1'h0):(1'h0)] ?
                  reg184[(2'h2):(1'h0)] : reg185[(1'h1):(1'h0)]) : {(!(8'hb5)),
                  wire72[(4'hc):(3'h7)]}))))
            begin
              reg197 <= $unsigned((~|$signed(reg182)));
              reg198 <= reg145;
              reg199 <= reg143;
              reg200 <= $unsigned(($signed($unsigned(((8'hbb) <<< reg196))) + $unsigned((~|reg189))));
            end
          else
            begin
              reg197 <= ($unsigned(wire179[(3'h6):(3'h5)]) <<< {{$signed($signed((8'ha9))),
                      wire105},
                  $signed($unsigned(reg185))});
              reg198 <= (reg177 != reg189[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          if ($signed((+reg182)))
            begin
              reg190 <= reg142;
              reg191 <= reg181[(2'h2):(1'h1)];
              reg192 <= $unsigned(reg194[(2'h3):(1'h0)]);
              reg193 <= $unsigned($signed(wire148));
            end
          else
            begin
              reg190 <= (8'ha0);
              reg191 <= ({(~^$signed((reg141 ? reg182 : wire72))),
                  {(wire175 == (-reg190)),
                      ($signed(reg197) ?
                          $signed(wire72) : {wire139,
                              reg147})}} | $signed((($signed(wire105) ?
                  ((8'ha0) > wire180) : reg147) & ((~^(8'hae)) && (wire162 & wire180)))));
              reg192 <= reg142;
              reg193 <= wire75[(2'h3):(2'h2)];
            end
        end
      if ($unsigned($unsigned((8'ha3))))
        begin
          reg201 <= (+(reg198 ?
              $signed(((reg186 >>> wire71) ?
                  $signed(reg197) : ((8'hb9) ?
                      reg147 : reg178))) : wire139[(4'h8):(3'h4)]));
          reg202 <= ((-($unsigned((reg199 || reg192)) ?
                  reg201 : $unsigned(((8'h9d) ? reg183 : (8'hbc))))) ?
              $signed($signed((8'hb3))) : $unsigned((-((&wire105) ?
                  (reg144 << reg197) : reg199))));
          if (wire162[(3'h7):(2'h3)])
            begin
              reg203 <= (reg142[(4'he):(3'h7)] ?
                  (($unsigned($signed(reg195)) ?
                          $signed((reg184 > (8'ha4))) : {reg144,
                              (reg181 ? reg188 : reg142)}) ?
                      ({wire175[(1'h1):(1'h1)]} ?
                          $unsigned({wire74}) : {(reg201 >> wire74)}) : (~wire139)) : {$signed((8'hbb))});
              reg204 <= $unsigned(($signed(reg189[(4'h8):(1'h0)]) >>> (wire180 ?
                  wire139[(2'h3):(2'h3)] : wire179)));
              reg205 <= $unsigned(($unsigned($signed($unsigned(reg177))) > (reg202 << $unsigned((wire72 ?
                  reg193 : reg186)))));
              reg206 <= ({$signed(reg194)} ?
                  reg178[(5'h10):(4'hd)] : (reg145 >> (8'hb5)));
              reg207 <= {$unsigned((~^$unsigned((reg190 ? reg195 : wire180))))};
            end
          else
            begin
              reg203 <= ($signed(wire75[(1'h0):(1'h0)]) ?
                  (wire75 ?
                      ($unsigned((reg195 ? reg190 : reg185)) ?
                          {(wire179 ? reg145 : reg204),
                              reg188} : ($signed(reg205) & $unsigned(reg141))) : (~{{reg145},
                          wire107[(2'h3):(2'h2)]})) : $signed($unsigned(wire148)));
              reg204 <= $unsigned($unsigned(wire72[(4'hf):(3'h4)]));
              reg205 <= $unsigned($unsigned((+wire187[(4'h9):(1'h1)])));
              reg206 <= ($signed($unsigned((reg145 && (&wire187)))) ?
                  (|$unsigned(($signed(reg199) ?
                      reg177[(5'h12):(1'h1)] : $signed(reg197)))) : (8'hb3));
            end
          reg208 <= wire70;
          reg209 <= reg142[(4'hf):(3'h6)];
        end
      else
        begin
          reg201 <= (-$unsigned($unsigned($signed((wire75 ?
              wire73 : reg182)))));
          reg202 <= ({wire162[(4'h9):(3'h5)],
              (~$unsigned(((8'hb1) < (8'ha7))))} + ({(wire107 ^ (|reg197))} <<< $unsigned($unsigned($signed(wire105)))));
        end
      reg210 <= ((8'ha0) || $signed(wire162[(3'h4):(2'h3)]));
    end
  assign wire211 = ((~^{(~&(reg177 ? reg189 : (8'hbb))),
                       ((reg147 ? reg194 : (8'hbe)) ?
                           (wire70 ? reg186 : wire105) : (reg183 ?
                               reg145 : wire162))}) | reg202);
  assign wire212 = $signed(($signed(reg204[(3'h5):(2'h2)]) ?
                       ((&(reg206 ? reg147 : wire75)) ?
                           ({reg196} >= (^~reg182)) : reg204[(5'h14):(4'hd)]) : (reg184[(1'h1):(1'h1)] ?
                           (reg185[(1'h0):(1'h0)] | $signed(reg186)) : ({reg196} >> $signed(reg146)))));
  assign wire213 = (&(~&{((|wire148) ~^ reg198[(4'hd):(3'h5)])}));
  always
    @(posedge clk) begin
      reg214 <= (reg200 ? $signed(reg203[(1'h1):(1'h1)]) : reg186);
      reg215 <= $signed((reg206[(2'h3):(2'h3)] ~^ $signed(reg143)));
      reg216 <= (-(-$unsigned(($signed(wire70) ?
          $unsigned(wire175) : reg141))));
      reg217 <= (reg214 ? wire187[(4'ha):(1'h0)] : (-(8'h9f)));
    end
endmodule

module module36
#(parameter param62 = (((~^(^~((8'h9e) || (8'hbf)))) >> (~^(-((8'hb2) ^ (7'h44))))) ^ (({((8'h9e) ? (7'h41) : (8'hb4))} ? (~|((8'ha2) ^~ (7'h42))) : (~(~&(8'hac)))) ? ((((8'ha6) ^~ (8'ha5)) && ((8'ha9) ? (7'h44) : (8'ha6))) >= (+((8'had) ? (8'ha0) : (8'ha9)))) : ((((8'ha2) ^ (8'hb2)) ? {(8'hbd)} : (-(8'ha5))) ? (((8'ha1) ? (8'hb7) : (8'hbb)) ? ((8'ha6) ? (7'h44) : (8'haf)) : ((7'h41) ? (8'hb7) : (8'hb5))) : (((7'h40) ? (8'haf) : (8'h9f)) && (8'had))))), 
parameter param63 = ((^~(param62 ? ((param62 ? param62 : param62) ? (param62 >>> param62) : (-param62)) : {(8'hb2), (param62 == param62)})) << {(~&(param62 && (+param62))), param62}))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire41;
  input wire [(2'h2):(1'h0)] wire40;
  input wire signed [(4'hc):(1'h0)] wire39;
  input wire signed [(4'h8):(1'h0)] wire38;
  input wire [(3'h4):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire43,
                 wire42,
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
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire42 = (+wire38);
  assign wire43 = $signed($unsigned((8'hab)));
  always
    @(posedge clk) begin
      if (((~|(8'ha8)) && $unsigned((-wire40))))
        begin
          reg44 <= $signed(((^~(+$signed(wire37))) * $unsigned($signed($unsigned(wire39)))));
        end
      else
        begin
          reg44 <= (^~wire40);
          reg45 <= wire37;
          reg46 <= (($signed($signed((8'haa))) ?
              $unsigned($signed((-wire39))) : $unsigned(($unsigned(wire37) <<< wire41[(1'h1):(1'h1)]))) <<< ((((~^wire41) ?
                      (8'hbb) : (!wire41)) ?
                  ((^wire41) ?
                      (wire43 ?
                          (8'h9c) : wire43) : wire40[(2'h2):(1'h1)]) : reg45) ?
              (wire37[(3'h4):(1'h1)] ?
                  reg44 : ($signed(wire39) >= (!(8'hb4)))) : ({((8'hab) <= wire42),
                      (wire43 ? wire42 : wire37)} ?
                  (wire41 ?
                      reg45[(5'h10):(3'h7)] : wire40) : $unsigned(wire39[(4'hc):(3'h5)]))));
          reg47 <= ($signed((wire42 ?
              $unsigned((wire43 ? (8'hba) : wire41)) : ((~^wire41) ?
                  (reg46 ^~ wire41) : $unsigned(wire41)))) << (8'haa));
        end
      reg48 <= wire43[(1'h1):(1'h1)];
      if ($unsigned((!wire43)))
        begin
          reg49 <= (wire39 ? (~|{(+wire42[(4'he):(4'hd)])}) : (8'hbc));
          if ({$unsigned(reg44),
              {($unsigned($unsigned(wire41)) ?
                      (8'hb0) : ({wire39, wire43} ?
                          wire37 : $signed(wire39)))}})
            begin
              reg50 <= (reg46[(1'h0):(1'h0)] ?
                  $signed($unsigned(reg45)) : (((reg44[(3'h5):(2'h2)] >> wire43) <<< $signed(wire43[(1'h0):(1'h0)])) ?
                      ((+reg48) == ($signed(wire37) == (wire41 ?
                          reg49 : wire41))) : {$signed((wire40 || wire43)),
                          wire38[(2'h2):(2'h2)]}));
              reg51 <= ($signed(wire43) <= wire42);
              reg52 <= $unsigned(reg44[(4'h9):(3'h5)]);
              reg53 <= (((reg48 >>> ({reg48, (8'hae)} ?
                          wire41[(1'h0):(1'h0)] : (~wire41))) ?
                      {($unsigned(wire38) ? $unsigned(reg50) : (!(8'h9c))),
                          (reg52[(1'h0):(1'h0)] ?
                              (~^reg50) : (reg47 + (8'hb2)))} : (~|((reg48 >= reg49) & wire40))) ?
                  ($unsigned((((8'hab) != wire43) ?
                          (reg49 ? reg44 : wire43) : $signed(reg45))) ?
                      $unsigned($signed((reg46 * reg49))) : {wire42[(1'h0):(1'h0)]}) : ((($signed(reg48) == wire41) > (reg50 ?
                      $unsigned((7'h44)) : {wire41, reg50})) ~^ (!((wire39 ?
                          reg47 : reg50) ?
                      (^wire37) : ((8'hba) >> reg44)))));
            end
          else
            begin
              reg50 <= (~$unsigned(reg51));
              reg51 <= {wire42[(4'hc):(2'h2)], wire39[(3'h5):(2'h3)]};
              reg52 <= $signed($unsigned($unsigned(wire41)));
            end
        end
      else
        begin
          reg49 <= $unsigned((~&($unsigned((!reg52)) * ($signed((8'ha5)) >= (8'hb1)))));
          if ((wire38[(4'h8):(3'h7)] && wire41[(2'h2):(2'h2)]))
            begin
              reg50 <= $unsigned($signed(wire37));
              reg51 <= reg50[(1'h0):(1'h0)];
              reg52 <= $signed({(8'ha7),
                  $signed(((^~wire43) ?
                      (wire40 ? wire40 : wire42) : {(8'ha6), wire39}))});
              reg53 <= reg46[(4'h9):(4'h9)];
            end
          else
            begin
              reg50 <= ((wire38[(1'h0):(1'h0)] < $signed((~&(reg52 ?
                      reg44 : reg48)))) ?
                  (wire43[(4'ha):(2'h3)] ?
                      ($signed(reg48[(3'h5):(1'h1)]) ?
                          reg48 : $signed({wire37,
                              wire43})) : (~^(&$signed(wire41)))) : (!({(~^reg47),
                          reg46} ?
                      {reg52[(3'h5):(2'h2)],
                          (reg49 ^~ reg45)} : $signed(wire41[(2'h2):(1'h1)]))));
              reg51 <= ((|$signed($signed({wire39}))) || (wire42[(4'ha):(3'h4)] - (8'hb6)));
              reg52 <= $unsigned((wire38 <= $unsigned(reg47[(4'he):(1'h1)])));
              reg53 <= reg47[(4'hd):(4'ha)];
            end
          if ((reg51 ?
              {($unsigned({(8'ha9)}) & reg52[(4'h9):(2'h2)])} : ({(reg45 ?
                      {wire40} : (reg51 ^~ wire40)),
                  (((8'hbb) - wire43) >= (wire41 ?
                      (7'h42) : wire41))} < $unsigned(reg48[(3'h5):(3'h5)]))))
            begin
              reg54 <= reg50[(3'h6):(1'h1)];
              reg55 <= (+reg45[(5'h13):(3'h6)]);
              reg56 <= ({$unsigned($unsigned((7'h44)))} ?
                  (reg50 ?
                      $unsigned(wire39) : ($unsigned(wire37[(1'h0):(1'h0)]) ?
                          (8'ha4) : ((wire38 ?
                              wire38 : reg47) ^ wire42[(2'h2):(1'h0)]))) : (reg51[(2'h3):(1'h1)] ?
                      reg46 : ((7'h43) ? {$signed(reg44)} : wire41)));
              reg57 <= (((wire43[(2'h3):(1'h0)] - $unsigned($signed(reg48))) && ((reg51 ?
                          (wire40 ? wire38 : reg56) : wire38[(2'h2):(1'h0)]) ?
                      (wire40 ?
                          (reg56 ? wire40 : (8'hbe)) : (reg54 ?
                              (8'hbf) : reg56)) : (^~reg50[(4'h8):(3'h4)]))) ?
                  (reg53[(5'h11):(3'h6)] ?
                      $signed(($signed(wire41) | $signed((7'h42)))) : $unsigned($signed(((8'hb0) ?
                          reg52 : reg56)))) : $unsigned($unsigned($signed(wire37[(2'h2):(1'h1)]))));
              reg58 <= $unsigned($signed(wire42));
            end
          else
            begin
              reg54 <= (&(8'hab));
              reg55 <= wire41[(1'h0):(1'h0)];
            end
        end
      reg59 <= reg57[(3'h4):(2'h2)];
    end
  assign wire60 = $unsigned({(reg54 ?
                          {$unsigned(wire41)} : (|(wire41 + (8'haa))))});
  assign wire61 = reg59[(5'h11):(3'h4)];
endmodule

module module15
#(parameter param28 = (^~(~(~&(~^((8'hb6) > (8'hb3)))))), 
parameter param29 = (({{(param28 ? param28 : (8'hba)), (^param28)}, ((param28 ? param28 : param28) ? (+param28) : (-param28))} ? (param28 != (^~{param28, param28})) : param28) > {param28, ((8'hb3) & (param28 ? (param28 != param28) : param28))}))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire signed [(5'h14):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  assign y = {wire27, wire26, wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = $unsigned(($unsigned($unsigned($signed(wire18))) + (|((wire17 ?
                      (8'ha5) : (8'hb5)) * (!wire18)))));
  assign wire22 = $unsigned((-wire17));
  assign wire23 = (wire20[(3'h4):(2'h3)] || $signed($signed((+wire22[(2'h2):(2'h2)]))));
  assign wire24 = {(((wire17 ? $unsigned((7'h44)) : wire20) ?
                              $signed(wire19[(4'hf):(4'hc)]) : $signed({(8'ha7),
                                  (8'hb2)})) ?
                          {wire20[(3'h6):(1'h1)]} : $unsigned(((wire16 ~^ wire21) ?
                              $signed(wire22) : (-wire17))))};
  assign wire25 = wire21[(2'h3):(2'h2)];
  assign wire26 = wire17;
  assign wire27 = ((wire20[(3'h7):(2'h2)] + wire16[(3'h4):(1'h1)]) ?
                      (|($unsigned({wire21}) == (wire17 ^ {wire16}))) : wire22);
endmodule

module module164  (y, clk, wire168, wire167, wire166, wire165);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire168;
  input wire signed [(5'h13):(1'h0)] wire167;
  input wire signed [(3'h5):(1'h0)] wire166;
  input wire [(3'h4):(1'h0)] wire165;
  wire [(4'he):(1'h0)] wire174;
  wire [(3'h4):(1'h0)] wire170;
  wire signed [(5'h11):(1'h0)] wire169;
  reg signed [(3'h4):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg172 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg171 = (1'h0);
  assign y = {wire174, wire170, wire169, reg173, reg172, reg171, (1'h0)};
  assign wire169 = $unsigned((~^wire165));
  assign wire170 = wire168;
  always
    @(posedge clk) begin
      reg171 <= (+$signed((~&wire167[(4'he):(1'h0)])));
      reg172 <= (&($unsigned($unsigned((~&wire168))) <= $signed(wire166)));
      reg173 <= (7'h41);
    end
  assign wire174 = ({{(~&((8'hbe) << reg172))},
                       $unsigned($signed($signed(wire166)))} < $signed($signed(wire169)));
endmodule

module module149
#(parameter param161 = ((~(!(((8'hbc) ? (8'h9f) : (8'ha3)) ? (&(8'hb7)) : ((8'hae) >> (8'h9c))))) ? (7'h43) : ({(8'had)} ? ((|{(8'haf)}) - {(|(7'h41))}) : ((!((8'h9d) > (8'hb8))) ? {(&(8'hbd)), ((8'hab) ? (8'hbe) : (7'h42))} : ({(8'h9f)} ? ((7'h40) | (8'h9d)) : {(8'hb9), (8'hbc)})))))
(y, clk, wire153, wire152, wire151, wire150);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire153;
  input wire [(3'h5):(1'h0)] wire152;
  input wire [(5'h13):(1'h0)] wire151;
  input wire [(5'h11):(1'h0)] wire150;
  wire signed [(5'h12):(1'h0)] wire160;
  wire [(4'ha):(1'h0)] wire159;
  wire signed [(5'h14):(1'h0)] wire158;
  wire [(4'h8):(1'h0)] wire157;
  wire [(3'h5):(1'h0)] wire156;
  wire [(5'h14):(1'h0)] wire155;
  wire signed [(2'h3):(1'h0)] wire154;
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 (1'h0)};
  assign wire154 = wire150;
  assign wire155 = (((+wire153) ^~ wire152[(1'h1):(1'h0)]) << (8'ha3));
  assign wire156 = (^(wire155[(3'h7):(1'h1)] ?
                       (8'hba) : (|((wire152 ?
                           wire154 : wire154) || $signed(wire153)))));
  assign wire157 = (!$unsigned((~^$signed((wire154 ? wire155 : wire150)))));
  assign wire158 = $signed((^(~&($signed(wire156) ? wire153 : (+wire156)))));
  assign wire159 = $unsigned(wire150[(4'hc):(2'h3)]);
  assign wire160 = $signed(($signed(((wire156 ? wire158 : wire150) >>> {(8'hab),
                       wire156})) << $signed($unsigned((|wire156)))));
endmodule

module module108  (y, clk, wire113, wire112, wire111, wire110, wire109);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire113;
  input wire signed [(4'hf):(1'h0)] wire112;
  input wire signed [(4'hc):(1'h0)] wire111;
  input wire [(4'hc):(1'h0)] wire110;
  input wire signed [(5'h13):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire138;
  wire [(3'h4):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire136;
  wire [(5'h12):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire125;
  wire signed [(4'hd):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire123;
  wire signed [(4'ha):(1'h0)] wire122;
  wire [(2'h2):(1'h0)] wire121;
  wire [(4'hb):(1'h0)] wire120;
  wire [(4'he):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  wire signed [(5'h13):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire115;
  wire [(4'hc):(1'h0)] wire114;
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(4'hd):(1'h0)] reg127 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire126,
                 wire125,
                 wire124,
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
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire114 = wire111[(1'h1):(1'h1)];
  assign wire115 = (^(&wire110));
  assign wire116 = $unsigned($unsigned({(~|wire111[(2'h2):(1'h1)])}));
  assign wire117 = (~&(&wire116));
  assign wire118 = ({($unsigned(wire115) ~^ wire115[(3'h6):(1'h0)]),
                           ({{wire117, wire109}} >> wire113)} ?
                       wire115[(4'h8):(4'h8)] : (~|$signed((+((8'hab) <= wire114)))));
  assign wire119 = ($signed(wire110[(1'h0):(1'h0)]) ?
                       (wire118[(2'h3):(1'h0)] ?
                           (8'hb4) : (wire117[(3'h7):(2'h2)] >= {{(8'hac)}})) : $unsigned((((wire118 >= wire112) ^ (+wire111)) ?
                           (8'hbc) : $unsigned((~^wire113)))));
  assign wire120 = (wire119[(4'hc):(3'h6)] ?
                       {$unsigned({{wire111, wire113},
                               {wire109, (8'h9c)}})} : ((&wire111) ?
                           ((~^wire111[(4'h8):(3'h4)]) * wire110) : $signed(wire119)));
  assign wire121 = (wire112[(1'h1):(1'h1)] ?
                       wire110 : (($signed(wire117) || ((wire117 > wire119) && wire113[(2'h3):(1'h1)])) <<< (~|$signed(wire112[(3'h6):(1'h1)]))));
  assign wire122 = wire112[(4'h8):(3'h6)];
  assign wire123 = $signed((wire115 == (wire121 <= ($signed(wire114) >= (wire115 ?
                       wire113 : wire112)))));
  assign wire124 = $unsigned(wire111[(3'h7):(2'h3)]);
  assign wire125 = (!($unsigned(wire120[(3'h5):(1'h0)]) ?
                       (-wire116) : ($signed(wire120) ?
                           wire117 : $unsigned({(8'hbe), wire109}))));
  assign wire126 = wire122;
  always
    @(posedge clk) begin
      reg127 <= $signed((8'hb4));
      if ((!wire115))
        begin
          reg128 <= ($unsigned((8'h9c)) | ((+($signed(wire113) * $signed(wire113))) ?
              (wire123 ?
                  wire115[(2'h2):(1'h0)] : $signed((-wire118))) : wire117));
          if (wire111[(4'hc):(4'ha)])
            begin
              reg129 <= (^(+$signed((wire120 || $signed(wire123)))));
              reg130 <= {wire125[(2'h3):(2'h3)]};
            end
          else
            begin
              reg129 <= (((8'hbe) != $signed($unsigned((wire115 ~^ wire122)))) > ((wire117 ?
                      (~&(wire125 ^~ wire118)) : ($signed(reg130) ?
                          (wire111 ? (8'hab) : reg128) : (wire110 & wire109))) ?
                  (({wire115} - (reg128 && wire121)) ?
                      $signed($signed(wire122)) : (~|((8'ha8) * wire110))) : (8'hb0)));
              reg130 <= {$signed($signed((reg128 && reg128[(1'h0):(1'h0)]))),
                  wire115};
              reg131 <= $unsigned(wire122);
              reg132 <= {(wire120[(1'h0):(1'h0)] ?
                      {$unsigned($unsigned((8'hb6))),
                          ($signed(wire118) >>> wire110[(3'h6):(3'h6)])} : reg129)};
            end
          reg133 <= $signed(wire126[(4'hf):(3'h5)]);
        end
      else
        begin
          reg128 <= {($signed(wire117[(3'h6):(2'h3)]) ?
                  (~&($unsigned(wire110) ?
                      (&wire116) : $unsigned(reg129))) : reg130)};
          reg129 <= $signed((wire112[(3'h5):(2'h3)] ?
              (($unsigned(reg132) ^ $unsigned(reg132)) ?
                  $unsigned($signed(wire124)) : reg131) : $signed((^~(~wire113)))));
          reg130 <= (~^reg132[(3'h6):(3'h5)]);
          reg131 <= (~&$unsigned(($signed(((8'hae) ?
              reg133 : wire121)) >> reg127[(1'h0):(1'h0)])));
          if (((^(~^(&(~(8'hae))))) & (^({wire117[(5'h12):(2'h3)]} > (~$unsigned((7'h43)))))))
            begin
              reg132 <= wire112;
              reg133 <= ({$signed(wire120[(2'h3):(2'h2)]),
                      $unsigned((!(~^wire112)))} ?
                  reg127 : ((wire120 ?
                      (reg127[(1'h1):(1'h0)] ?
                          (-wire125) : {wire111}) : (8'ha1)) ~^ {wire122[(4'h8):(2'h3)]}));
              reg134 <= $unsigned(((-wire118[(4'hd):(3'h5)]) ?
                  (+(((8'hab) ?
                      wire110 : wire124) != (reg129 ^~ wire119))) : $signed((8'hba))));
              reg135 <= {$unsigned({$unsigned($unsigned(wire126)),
                      (+wire125[(1'h1):(1'h0)])})};
            end
          else
            begin
              reg132 <= reg134;
              reg133 <= (wire113[(4'hb):(4'ha)] ?
                  (~&wire118) : $signed((+($signed(reg129) ?
                      wire124 : wire122))));
            end
        end
    end
  assign wire136 = $unsigned(wire116);
  assign wire137 = (~^reg135);
  assign wire138 = ($signed($unsigned(((reg134 >>> wire119) ?
                       (wire117 | reg128) : (^wire111)))) != wire111);
endmodule

module module76
#(parameter param104 = (8'hbf))
(y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire81;
  input wire signed [(4'ha):(1'h0)] wire80;
  input wire signed [(4'hb):(1'h0)] wire79;
  input wire [(4'h8):(1'h0)] wire78;
  input wire [(2'h2):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire signed [(5'h14):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire95;
  wire [(4'hd):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire84;
  wire [(5'h14):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire82;
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire82 = $signed({($unsigned({wire80, wire81}) == $signed((wire81 ?
                          (7'h41) : (7'h41))))});
  assign wire83 = wire81;
  assign wire84 = ($unsigned((^~($signed(wire78) ?
                          {wire80, wire78} : wire78[(2'h3):(2'h2)]))) ?
                      wire80[(1'h0):(1'h0)] : ((($signed(wire79) ?
                          ((8'h9d) || wire79) : $signed(wire78)) != (~|wire80)) ^ ((~&$signed(wire77)) ?
                          ((8'ha2) != $signed(wire77)) : {(wire77 >= wire82)})));
  assign wire85 = $signed(((+{(wire81 * wire80)}) != wire81));
  assign wire86 = wire78;
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((8'hb8))))
        begin
          reg87 <= ((~^(wire86[(4'hd):(2'h3)] == ((~^wire79) != ((8'hbe) ?
                  (8'hb1) : wire82)))) ?
              {wire79[(1'h1):(1'h0)], wire81} : $signed(wire80[(3'h7):(1'h1)]));
          reg88 <= {(~&wire79)};
        end
      else
        begin
          reg87 <= ($signed(reg88) ? {(8'ha7)} : wire77[(1'h1):(1'h1)]);
          if ($signed((|wire78[(2'h3):(2'h2)])))
            begin
              reg88 <= wire80;
              reg89 <= ((8'ha6) ? wire85 : wire84[(3'h6):(1'h1)]);
              reg90 <= $signed($unsigned($unsigned((reg89 ?
                  $signed(wire85) : $signed(reg88)))));
              reg91 <= ({{wire79[(3'h6):(1'h1)], reg88}} ?
                  (!(+wire77[(2'h2):(1'h0)])) : wire79);
            end
          else
            begin
              reg88 <= $signed($signed($unsigned({(!wire80)})));
              reg89 <= (-((~wire81[(2'h3):(1'h0)]) ?
                  wire86 : (wire77[(1'h0):(1'h0)] ?
                      wire84[(2'h3):(1'h0)] : (wire86 ?
                          (wire82 | (8'haf)) : $unsigned(wire81)))));
              reg90 <= (reg91 ?
                  reg87[(3'h7):(3'h5)] : ((wire81[(3'h5):(3'h4)] << $signed((wire84 >>> wire78))) >= $unsigned($unsigned((wire85 ?
                      wire81 : (7'h42))))));
              reg91 <= reg89[(4'hc):(4'h8)];
            end
          if ($signed((~|(wire82[(2'h2):(1'h1)] >> reg91[(4'hd):(4'hc)]))))
            begin
              reg92 <= {(8'h9d),
                  ((~&$signed(wire80[(4'h8):(3'h7)])) >>> reg91[(4'ha):(1'h0)])};
              reg93 <= $unsigned((~&$unsigned((~|(reg89 <<< wire82)))));
            end
          else
            begin
              reg92 <= (($unsigned((7'h44)) ^~ wire85) >>> (-($signed($unsigned(reg92)) ?
                  $unsigned($signed(wire81)) : $unsigned((&reg93)))));
              reg93 <= wire84;
            end
          reg94 <= (!$signed($unsigned($signed((reg93 <<< reg90)))));
        end
    end
  assign wire95 = (((((reg94 ? wire79 : reg94) ?
                      wire81[(4'ha):(2'h2)] : (reg89 ^~ wire82)) >> (wire85 ?
                      (wire83 >> reg90) : reg90)) <<< {(wire77 ?
                          reg87[(2'h2):(1'h0)] : $signed(reg89)),
                      (-$unsigned(wire78))}) <= {$signed((wire80[(1'h1):(1'h0)] < $unsigned(reg89)))});
  assign wire96 = (wire81 ?
                      (+(!$signed(wire85))) : $unsigned({$signed($signed(wire85))}));
  assign wire97 = {reg90};
  assign wire98 = $signed($unsigned((8'hbd)));
  assign wire99 = ((~$unsigned((|{wire80}))) ?
                      $signed((~($unsigned(reg92) * ((8'hba) ?
                          wire97 : reg91)))) : {$signed($unsigned((+reg94)))});
  assign wire100 = ($unsigned($unsigned(((wire84 ?
                           reg88 : wire82) >>> wire77[(1'h1):(1'h0)]))) ?
                       ($signed($signed((&(8'hb3)))) + $unsigned(wire78)) : $signed((&{$unsigned(reg93),
                           (wire97 ? (7'h41) : wire81)})));
  assign wire101 = (^~(($signed($unsigned(wire81)) ?
                       (-((7'h40) * reg90)) : $signed(((8'hb1) - wire78))) > $signed((wire79 ?
                       $signed(reg92) : (&wire85)))));
  assign wire102 = (!((+$unsigned((wire100 ? wire81 : reg92))) ?
                       (wire95 ?
                           ({wire83,
                               wire81} ^~ $unsigned(reg94)) : ((8'ha8) - $unsigned(wire95))) : $unsigned({(^~reg87),
                           (reg89 ? wire84 : wire79)})));
  assign wire103 = wire98[(1'h0):(1'h0)];
endmodule
