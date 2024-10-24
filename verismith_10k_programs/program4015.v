module top
#(parameter param283 = ({((+{(8'hbc)}) ~^ (8'hab)), ((&((8'hbe) | (7'h41))) ? ((|(8'hb4)) << (~^(8'hbe))) : (^((8'h9d) == (8'h9c))))} - (7'h44)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h296):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire271;
  wire [(4'h9):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire138;
  wire signed [(5'h14):(1'h0)] wire140;
  wire [(5'h10):(1'h0)] wire141;
  wire signed [(5'h12):(1'h0)] wire154;
  wire signed [(4'ha):(1'h0)] wire155;
  wire signed [(4'h9):(1'h0)] wire156;
  wire signed [(2'h2):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire269;
  reg signed [(3'h7):(1'h0)] reg282 = (1'h0);
  reg [(2'h3):(1'h0)] reg281 = (1'h0);
  reg [(5'h11):(1'h0)] reg280 = (1'h0);
  reg [(4'hb):(1'h0)] reg279 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg278 = (1'h0);
  reg [(5'h10):(1'h0)] reg277 = (1'h0);
  reg [(5'h11):(1'h0)] reg276 = (1'h0);
  reg [(3'h4):(1'h0)] reg275 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg274 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg273 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg272 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg145 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg [(4'h8):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(5'h12):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg153 = (1'h0);
  assign y = {wire271,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire138,
                 wire140,
                 wire141,
                 wire154,
                 wire155,
                 wire156,
                 wire157,
                 wire269,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
                 reg10,
                 reg9,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (|(!(wire1 || (~^wire3))));
  assign wire6 = (|wire3[(4'hf):(2'h2)]);
  assign wire7 = ((~$unsigned((-(wire3 != wire5)))) ~^ $unsigned(wire4[(3'h4):(1'h0)]));
  assign wire8 = (7'h44);
  always
    @(posedge clk) begin
      reg9 <= wire7;
      reg10 <= (reg9 ?
          $unsigned({((wire4 ? wire4 : wire1) < reg9),
              wire2}) : (!wire1[(4'ha):(4'ha)]));
      reg11 <= $unsigned({(^(&$signed(reg9)))});
    end
  always
    @(posedge clk) begin
      reg12 <= (wire8 != (wire8[(1'h0):(1'h0)] ? reg9 : wire8[(1'h1):(1'h0)]));
      reg13 <= wire5[(5'h10):(4'he)];
      if (wire3[(3'h4):(3'h4)])
        begin
          reg14 <= ((($signed(((8'hbb) ? wire3 : reg13)) == $signed(wire3)) ?
              $signed(((reg11 ? wire1 : wire8) + (wire1 ?
                  reg10 : wire3))) : wire1) ^ wire1[(4'hf):(2'h3)]);
        end
      else
        begin
          reg14 <= reg13;
          reg15 <= {wire4[(1'h1):(1'h0)]};
          reg16 <= $unsigned(((+{{reg10}, $signed(wire3)}) ?
              (~((-(8'ha1)) ?
                  (reg12 ? wire4 : reg15) : (wire2 ?
                      wire2 : wire8))) : ((8'hbf) ?
                  (reg13 ~^ (wire7 ? wire3 : (8'h9f))) : ((8'hb7) ?
                      reg12[(3'h6):(3'h6)] : (wire8 ? wire8 : reg15)))));
          reg17 <= $unsigned({(&(&(reg12 ? (8'hbc) : (8'haf)))),
              $unsigned($unsigned((reg11 ? (8'hb9) : reg15)))});
          if ($unsigned($signed($signed({wire5}))))
            begin
              reg18 <= $unsigned(reg13[(2'h2):(2'h2)]);
              reg19 <= ((reg10 != reg16[(4'hb):(4'hb)]) ?
                  (($signed((-wire4)) >>> (reg10 != wire4[(3'h6):(1'h1)])) & $signed(((reg14 > reg18) << (8'ha2)))) : reg16[(3'h4):(1'h0)]);
              reg20 <= $unsigned(wire1);
            end
          else
            begin
              reg18 <= ((8'ha6) > (($unsigned(wire6) == wire0) << reg18[(4'hc):(4'h8)]));
              reg19 <= (~(((((8'hb7) ~^ (8'ha9)) & {reg14,
                  reg15}) - $unsigned($signed((8'hac)))) == (-(reg18[(3'h5):(1'h0)] ?
                  $signed(wire2) : reg16[(3'h7):(1'h0)]))));
              reg20 <= wire3;
            end
        end
      if (wire4)
        begin
          reg21 <= reg15;
          reg22 <= reg20;
          reg23 <= $unsigned($unsigned($signed(($signed((8'h9e)) ?
              wire6 : (wire2 ? reg21 : reg15)))));
          if ((~&wire6))
            begin
              reg24 <= reg18;
              reg25 <= ($signed((wire2[(3'h5):(1'h1)] ? reg20 : reg13)) ?
                  $unsigned({$signed(((8'hb8) ?
                          wire4 : (8'haa)))}) : (^(reg23 > $signed(reg16))));
              reg26 <= $unsigned((8'haf));
              reg27 <= ({$unsigned({(+wire7),
                      (reg15 ? reg21 : reg17)})} ^~ $unsigned(wire0));
              reg28 <= $signed((~|$unsigned(wire1)));
            end
          else
            begin
              reg24 <= (reg18 > ((reg20[(5'h12):(4'hc)] ?
                      (!(reg26 >>> wire8)) : (wire8[(1'h0):(1'h0)] || $unsigned(wire0))) ?
                  $unsigned($signed((~|wire8))) : ((reg19 >>> (8'hb6)) ?
                      {(+reg25),
                          (reg9 >>> reg9)} : (reg15 >= $signed((8'ha5))))));
              reg25 <= {{wire2}};
              reg26 <= reg17[(2'h3):(1'h1)];
              reg27 <= $unsigned(((wire3 ?
                  ((reg15 >= reg16) >= reg20[(3'h4):(2'h3)]) : (wire0[(1'h0):(1'h0)] < {reg23,
                      wire3})) < $signed(reg24[(2'h3):(2'h2)])));
              reg28 <= (reg20[(3'h5):(3'h5)] != $signed($unsigned(($signed((8'hb5)) > (wire7 ?
                  wire2 : (8'haa))))));
            end
        end
      else
        begin
          reg21 <= reg13;
          if ((8'hb9))
            begin
              reg22 <= {{reg13}};
              reg23 <= (^~wire3);
              reg24 <= reg16[(3'h7):(3'h7)];
            end
          else
            begin
              reg22 <= (|((~(^~(^(8'hab)))) ?
                  (wire3[(3'h5):(1'h1)] <= reg25) : ($unsigned($signed(reg18)) ?
                      reg16 : ((8'ha3) ? {reg14} : {wire2}))));
            end
          reg25 <= wire3[(3'h4):(1'h1)];
        end
    end
  module29 #() modinst139 (wire138, clk, reg18, reg12, reg10, reg27, reg15);
  assign wire140 = reg16;
  assign wire141 = $unsigned(reg25);
  always
    @(posedge clk) begin
      if ($signed(wire1[(4'hd):(2'h2)]))
        begin
          reg142 <= $signed($unsigned((^(!$signed(wire5)))));
          reg143 <= $unsigned((reg19[(3'h7):(3'h7)] << (-$unsigned({wire2}))));
          reg144 <= reg17;
          reg145 <= (8'had);
          reg146 <= (reg142[(5'h13):(1'h1)] & (|($signed($signed(reg23)) <<< reg11)));
        end
      else
        begin
          if ($unsigned(reg13))
            begin
              reg142 <= reg23[(2'h3):(2'h3)];
            end
          else
            begin
              reg142 <= $signed(reg26);
              reg143 <= $signed(wire5);
              reg144 <= $unsigned((~&reg15[(5'h12):(2'h3)]));
            end
          reg145 <= $signed($unsigned(((8'h9e) ?
              reg11[(4'ha):(3'h5)] : ($unsigned(reg27) ^~ (reg12 != reg23)))));
          reg146 <= reg22[(3'h7):(2'h2)];
        end
      reg147 <= ((((wire7 >> ((7'h44) * wire141)) ?
              ((reg23 ? (8'hba) : reg143) & (&reg143)) : (8'h9d)) ?
          {$unsigned(reg17[(2'h3):(1'h1)]),
              ((~^reg145) >= reg13)} : reg9[(3'h7):(1'h1)]) >>> (({(|reg18)} ?
              $signed((~reg9)) : reg21) ?
          (^~wire140[(4'hc):(4'hc)]) : $unsigned((7'h41))));
      reg148 <= reg146[(2'h2):(2'h2)];
      if ($signed((wire4 <= $unsigned(reg144))))
        begin
          reg149 <= {(reg145[(5'h11):(3'h7)] ?
                  $unsigned(($unsigned(reg147) ^~ wire8)) : (~^($signed(reg11) ?
                      {reg143} : (wire140 * reg22))))};
          reg150 <= $signed({wire138[(5'h11):(1'h0)],
              $unsigned((-(reg18 ? reg17 : reg12)))});
          reg151 <= ($signed(reg149[(3'h6):(2'h2)]) ?
              (!reg18[(2'h2):(1'h1)]) : ((wire0[(4'hf):(4'ha)] ?
                  ((reg23 >> reg150) ?
                      (|(8'ha8)) : ((7'h40) * wire1)) : $signed(wire7[(2'h3):(2'h3)])) ^~ $signed({$unsigned(reg146)})));
          reg152 <= (+($unsigned((~wire5)) > ((reg146 * $unsigned(wire141)) ?
              $signed($unsigned(reg23)) : reg13)));
        end
      else
        begin
          reg149 <= ({{wire2[(4'h9):(2'h2)]},
              (~&wire138[(3'h4):(1'h1)])} >= wire7[(2'h3):(1'h1)]);
          reg150 <= wire0[(1'h0):(1'h0)];
        end
      reg153 <= reg146;
    end
  assign wire154 = ($unsigned(($unsigned((reg18 ?
                           (8'ha4) : (8'ha3))) && reg9[(3'h6):(3'h5)])) ?
                       ($unsigned($signed((8'ha4))) >> $signed({wire6})) : (((reg148[(1'h0):(1'h0)] ?
                                   ((8'hb4) == wire5) : $signed(reg18)) ?
                               ($signed(reg17) ?
                                   reg151[(2'h3):(1'h1)] : (reg148 && wire140)) : reg28[(5'h11):(3'h4)]) ?
                           reg143 : $signed((^reg24[(3'h4):(2'h2)]))));
  assign wire155 = (wire138 - $signed(reg25[(3'h4):(3'h4)]));
  assign wire156 = {$unsigned($signed($signed(reg145[(3'h7):(2'h3)]))),
                       (~|reg143)};
  assign wire157 = wire155[(1'h1):(1'h1)];
  module158 #() modinst270 (.wire159(reg151), .y(wire269), .wire161(reg10), .wire162(wire6), .wire160(reg26), .clk(clk));
  assign wire271 = wire0;
  always
    @(posedge clk) begin
      reg272 <= $signed(reg12);
      if (wire141)
        begin
          reg273 <= reg142;
          if (reg25)
            begin
              reg274 <= reg27[(4'ha):(2'h2)];
              reg275 <= $signed(((((reg11 ?
                          (8'hb5) : reg23) ^~ reg274[(1'h1):(1'h1)]) ?
                      {{reg20, wire271}} : reg12[(3'h5):(2'h2)]) ?
                  {{wire7[(1'h0):(1'h0)], (~reg19)},
                      ($signed(reg18) ?
                          $unsigned(reg273) : (reg145 << wire141))} : (~|((wire140 * (8'ha9)) < ((8'ha4) ?
                      reg272 : reg145)))));
              reg276 <= wire138[(2'h3):(1'h0)];
            end
          else
            begin
              reg274 <= $signed(wire6[(3'h4):(2'h3)]);
            end
          reg277 <= $signed({(wire154 ? reg9[(4'hc):(2'h2)] : {(8'haf)})});
          if ($signed(($unsigned($unsigned($signed(reg20))) ?
              $unsigned((reg142 != ((8'ha1) - (7'h44)))) : (($signed(reg272) + reg27) ?
                  ({wire6} ? wire141 : reg19[(2'h2):(1'h0)]) : reg26))))
            begin
              reg278 <= ({{(8'hb7)}} || $unsigned(((wire138[(1'h0):(1'h0)] ?
                  (~|reg11) : $signed(wire4)) | wire157[(1'h0):(1'h0)])));
              reg279 <= ((~^(wire141 << (&$signed(reg143)))) || ((((reg26 >> reg17) ?
                  $signed(reg26) : $unsigned(wire155)) >> (^~(reg25 ?
                  reg21 : reg28))) < $signed(((+reg144) ?
                  $unsigned(reg151) : ((8'hb6) ~^ (8'hb4))))));
              reg280 <= $signed(reg27[(3'h6):(2'h2)]);
              reg281 <= $unsigned($signed((^~reg19[(3'h5):(1'h1)])));
              reg282 <= wire8[(1'h1):(1'h1)];
            end
          else
            begin
              reg278 <= $unsigned(((8'hb8) != (reg147 ?
                  reg10 : $signed((reg23 ? reg11 : reg150)))));
              reg279 <= {reg279[(4'h8):(3'h7)], reg16[(2'h3):(1'h1)]};
              reg280 <= reg272[(3'h5):(1'h1)];
              reg281 <= ((&reg152[(4'he):(1'h1)]) ?
                  $signed((({reg279} ? (reg26 ? (7'h44) : (8'ha6)) : reg22) ?
                      $signed({wire140,
                          (8'had)}) : ((~(8'hbd)) ^~ reg146[(2'h2):(1'h1)]))) : ({reg279,
                          $signed($signed(reg23))} ?
                      (8'hb1) : (~&((&(8'h9c)) ?
                          reg25[(1'h0):(1'h0)] : (reg276 ? reg280 : reg277)))));
              reg282 <= (((((wire5 ? (8'hb6) : reg153) ^ (reg25 ?
                              reg272 : (8'h9f))) ?
                          (reg13 | ((7'h42) && reg147)) : $unsigned(reg146[(1'h0):(1'h0)])) ?
                      ((reg15[(2'h3):(1'h1)] ?
                          reg19[(3'h4):(2'h2)] : $unsigned(reg23)) <<< (reg149[(3'h4):(1'h1)] ?
                          $unsigned((8'hba)) : {(7'h41),
                              (8'h9f)})) : (reg20[(4'hf):(4'ha)] & (((8'hb5) ?
                              wire3 : reg22) ?
                          $unsigned((8'h9c)) : $signed(reg274)))) ?
                  $signed(reg21[(3'h5):(1'h1)]) : ((wire157 - reg12) * {((reg276 - reg12) != (reg143 ?
                          reg153 : reg277))}));
            end
        end
      else
        begin
          reg273 <= (8'hb0);
        end
    end
endmodule

module module158
#(parameter param267 = ({((-((8'h9e) <<< (8'hb0))) ? (-(-(8'ha5))) : {(-(7'h44))})} << {(&(-{(8'hb1), (8'hae)}))}), 
parameter param268 = (param267 > (&{(~&(param267 ? param267 : param267)), (~^((8'hb1) <= param267))})))
(y, clk, wire159, wire160, wire161, wire162);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire159;
  input wire signed [(4'hc):(1'h0)] wire160;
  input wire signed [(4'hc):(1'h0)] wire161;
  input wire [(5'h13):(1'h0)] wire162;
  wire [(3'h4):(1'h0)] wire266;
  wire [(4'hb):(1'h0)] wire265;
  wire signed [(5'h14):(1'h0)] wire175;
  wire signed [(4'h9):(1'h0)] wire188;
  wire signed [(4'he):(1'h0)] wire189;
  wire signed [(4'hf):(1'h0)] wire190;
  wire signed [(5'h15):(1'h0)] wire191;
  wire [(4'hf):(1'h0)] wire203;
  wire [(4'hc):(1'h0)] wire263;
  reg signed [(2'h3):(1'h0)] reg177 = (1'h0);
  reg [(4'h9):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg180 = (1'h0);
  reg [(4'hd):(1'h0)] reg181 = (1'h0);
  reg [(4'h9):(1'h0)] reg182 = (1'h0);
  reg [(3'h6):(1'h0)] reg183 = (1'h0);
  reg [(4'he):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg187 = (1'h0);
  reg [(4'h9):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg193 = (1'h0);
  reg [(4'h8):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg195 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg196 = (1'h0);
  reg [(5'h11):(1'h0)] reg197 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg198 = (1'h0);
  reg [(4'hc):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg200 = (1'h0);
  reg [(5'h15):(1'h0)] reg201 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg202 = (1'h0);
  assign y = {wire266,
                 wire265,
                 wire175,
                 wire188,
                 wire189,
                 wire190,
                 wire191,
                 wire203,
                 wire263,
                 reg177,
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
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
                 (1'h0)};
  module163 #() modinst176 (wire175, clk, wire159, wire160, wire162, wire161, (8'hba));
  always
    @(posedge clk) begin
      if (wire161)
        begin
          reg177 <= (~&wire159[(2'h2):(1'h1)]);
          reg178 <= wire162;
          reg179 <= reg177;
        end
      else
        begin
          reg177 <= ({$unsigned((&$signed(wire162))),
              $signed(wire161)} << (wire162[(4'hf):(3'h7)] ?
              (($signed((8'h9d)) & (7'h42)) <= wire162) : wire159[(3'h5):(2'h2)]));
          reg178 <= $signed(($unsigned($unsigned((~^reg179))) << $unsigned(wire161)));
          reg179 <= $unsigned((^((-{wire160}) ?
              $unsigned($unsigned(wire162)) : $unsigned((wire161 > reg178)))));
        end
    end
  always
    @(posedge clk) begin
      if (wire161)
        begin
          reg180 <= reg179;
          reg181 <= wire160;
          if (reg179[(1'h1):(1'h1)])
            begin
              reg182 <= (!$unsigned(wire162[(5'h13):(1'h1)]));
              reg183 <= ($signed(wire175[(5'h13):(4'he)]) ?
                  (!(!((reg179 ? reg181 : wire159) ?
                      reg179 : {reg178}))) : $unsigned(reg177[(1'h1):(1'h1)]));
              reg184 <= (^~((8'hba) ? {(~|wire160[(3'h4):(2'h3)])} : wire160));
              reg185 <= reg178[(2'h2):(2'h2)];
            end
          else
            begin
              reg182 <= (^$signed($signed(($unsigned(wire159) ~^ (8'ha9)))));
            end
        end
      else
        begin
          reg180 <= (reg183 ?
              (reg184[(4'ha):(3'h6)] && {($unsigned(wire160) ?
                      (reg184 ? wire160 : wire159) : reg182),
                  (^~wire159)}) : (^~(!(8'ha6))));
          reg181 <= ($signed((~&($unsigned(reg181) ^~ {wire159, wire161}))) ?
              $signed((reg185 ?
                  (reg177[(1'h1):(1'h1)] <= reg181[(4'hc):(4'hc)]) : $unsigned((reg179 ?
                      reg181 : wire162)))) : reg178[(1'h1):(1'h1)]);
          reg182 <= wire175[(5'h14):(5'h12)];
          reg183 <= ($unsigned(wire159[(3'h6):(3'h4)]) ?
              reg179[(4'hb):(1'h1)] : (&wire162));
          reg184 <= reg182;
        end
      reg186 <= (wire160 ?
          (&$signed((reg185 && {reg177}))) : wire175[(3'h7):(3'h6)]);
      reg187 <= reg178[(3'h4):(2'h2)];
    end
  assign wire188 = $unsigned((!{($unsigned((8'ha0)) || (~^(8'ha3))), reg178}));
  assign wire189 = $signed((wire175[(2'h2):(1'h0)] ?
                       ((&{reg183, reg180}) ?
                           {wire188} : $signed((!reg180))) : $unsigned(wire162[(1'h1):(1'h1)])));
  assign wire190 = reg187[(5'h11):(2'h3)];
  assign wire191 = $signed({(reg186[(5'h11):(3'h7)] ?
                           $unsigned($signed(reg179)) : {reg186[(5'h12):(1'h1)],
                               $unsigned(wire188)})});
  always
    @(posedge clk) begin
      reg192 <= (wire160 >>> (wire188 - reg184));
      reg193 <= (!(~reg185));
      reg194 <= wire191;
      if ((~&({reg177[(1'h0):(1'h0)]} > reg185[(1'h0):(1'h0)])))
        begin
          reg195 <= ((8'ha1) ?
              (&(|((reg180 | reg184) ?
                  $signed(wire161) : (wire159 * wire189)))) : (!(($unsigned(reg178) & {wire188,
                      reg180}) ?
                  $unsigned({reg192}) : reg181)));
          reg196 <= reg187;
        end
      else
        begin
          reg195 <= wire161;
          if (reg178)
            begin
              reg196 <= (($signed((reg179 ?
                      (reg185 ?
                          (8'hb9) : wire159) : reg192[(2'h3):(1'h0)])) ^~ (~{wire159,
                      reg193})) ?
                  (^wire160[(1'h1):(1'h1)]) : $unsigned({({reg195,
                          wire160} >>> {wire162}),
                      $signed(reg187)}));
            end
          else
            begin
              reg196 <= (reg193[(4'hc):(3'h7)] ?
                  (^~$signed(((^reg186) ?
                      (~reg194) : (wire162 ?
                          wire191 : reg196)))) : $unsigned((8'ha2)));
              reg197 <= reg186[(5'h10):(2'h2)];
              reg198 <= wire190;
            end
          reg199 <= (~&(^~$signed({(reg198 ^~ reg183)})));
          reg200 <= reg195;
        end
      if ((^~(reg199 | (reg183[(2'h2):(1'h1)] ?
          $unsigned((wire159 - wire191)) : ($signed(reg178) * (~reg184))))))
        begin
          reg201 <= (((~|$signed((reg185 ?
              reg178 : reg197))) ~^ (((reg199 + (7'h41)) | (wire189 ?
              wire159 : reg178)) || reg186)) || reg194[(1'h0):(1'h0)]);
        end
      else
        begin
          reg201 <= wire160[(4'ha):(1'h1)];
          reg202 <= ($signed(reg192[(3'h6):(2'h3)]) ?
              $unsigned((8'hbb)) : $unsigned($signed(reg180)));
        end
    end
  assign wire203 = reg201[(2'h2):(2'h2)];
  module204 #() modinst264 (.y(wire263), .clk(clk), .wire207(wire161), .wire205(reg197), .wire206(reg182), .wire208(reg186));
  assign wire265 = $signed($unsigned((~&wire190[(3'h6):(3'h6)])));
  assign wire266 = {(($signed({wire265}) ?
                               wire191[(5'h13):(4'hb)] : ($unsigned(reg194) ?
                                   (~&reg202) : {wire189, reg178})) ?
                           $unsigned($signed($unsigned(reg178))) : ((reg200[(4'ha):(1'h1)] < {reg185,
                                   wire160}) ?
                               $unsigned(reg192[(4'h9):(2'h2)]) : ($unsigned(wire263) >> (~|reg201))))};
endmodule

module module29
#(parameter param136 = {(~|(-(((8'ha8) ? (8'h9f) : (8'hb4)) << {(8'ha8)})))}, 
parameter param137 = param136)
(y, clk, wire30, wire31, wire32, wire33, wire34);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire30;
  input wire signed [(3'h5):(1'h0)] wire31;
  input wire signed [(2'h3):(1'h0)] wire32;
  input wire signed [(5'h12):(1'h0)] wire33;
  input wire [(5'h12):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire135;
  wire [(4'h8):(1'h0)] wire133;
  wire signed [(4'hb):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire131;
  reg signed [(2'h2):(1'h0)] reg134 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  assign y = {wire135,
                 wire133,
                 wire35,
                 wire36,
                 wire38,
                 wire62,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire68,
                 wire69,
                 wire131,
                 reg134,
                 reg37,
                 (1'h0)};
  assign wire35 = ((wire30 ?
                      (~&(8'hb4)) : wire33[(2'h2):(1'h1)]) ^~ {({$signed(wire34),
                              $unsigned(wire34)} ?
                          (wire31[(2'h2):(1'h0)] ?
                              {(8'h9c)} : $signed(wire32)) : wire34[(4'he):(2'h2)])});
  assign wire36 = (^~($unsigned({wire31, (wire31 ? wire34 : wire35)}) ?
                      ($unsigned($signed(wire32)) ?
                          $signed(wire33) : $unsigned($unsigned((8'hab)))) : $signed({{(8'hac),
                              wire35},
                          wire32[(2'h2):(1'h1)]})));
  always
    @(posedge clk) begin
      reg37 <= wire31;
    end
  assign wire38 = (8'ha8);
  module39 #() modinst63 (wire62, clk, wire35, wire36, wire38, wire31, reg37);
  assign wire64 = (^wire32[(2'h2):(1'h0)]);
  assign wire65 = wire64[(2'h3):(1'h1)];
  assign wire66 = {wire35, wire34};
  assign wire67 = ((wire65[(1'h1):(1'h1)] * wire64) ? {wire66} : (|wire36));
  assign wire68 = ($signed((wire67 <= ((wire64 != wire62) ?
                      (reg37 ?
                          wire65 : wire34) : ((8'ha2) < wire36)))) | wire64[(1'h0):(1'h0)]);
  assign wire69 = wire30;
  module70 #() modinst132 (wire131, clk, wire64, wire66, wire69, wire36, wire33);
  assign wire133 = wire32;
  always
    @(posedge clk) begin
      reg134 <= ((^~wire65) ?
          $unsigned($signed($signed($signed(wire34)))) : {$signed($unsigned((wire133 ?
                  wire69 : (8'hab)))),
              {$unsigned($signed(wire32)),
                  ((wire35 ? wire69 : wire69) ?
                      wire31[(1'h1):(1'h1)] : (+wire67))}});
    end
  assign wire135 = $unsigned($signed((~^((wire69 < (8'ha4)) | (wire38 ?
                       wire131 : wire35)))));
endmodule

module module70
#(parameter param129 = (~((-(((8'hac) ? (8'ha1) : (8'ha3)) ? (^~(8'had)) : ((7'h42) ? (8'hab) : (8'ha0)))) | ({((8'ha4) - (7'h43)), {(7'h42), (8'ha0)}} ? ({(8'hbe)} + {(8'ha3), (8'ha3)}) : (-((8'hae) == (8'hbb)))))), 
parameter param130 = ((-(!param129)) > ((|param129) != param129)))
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h26e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire75;
  input wire [(5'h12):(1'h0)] wire74;
  input wire signed [(3'h5):(1'h0)] wire73;
  input wire [(5'h13):(1'h0)] wire72;
  input wire [(4'he):(1'h0)] wire71;
  wire signed [(4'hc):(1'h0)] wire128;
  wire signed [(4'h9):(1'h0)] wire127;
  wire [(5'h10):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire76;
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(2'h3):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire102,
                 wire80,
                 wire76,
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
                 reg104,
                 reg103,
                 reg101,
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
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire76 = ((!wire75[(1'h0):(1'h0)]) ? wire73 : wire74);
  always
    @(posedge clk) begin
      reg77 <= (wire72 ?
          $signed($signed(wire72[(5'h11):(4'he)])) : $signed($signed((wire72 ?
              wire76[(2'h2):(1'h0)] : ((8'hb7) ? wire71 : wire74)))));
      reg78 <= ($unsigned($unsigned((wire75 <<< $signed((8'ha0))))) ?
          (+$signed($unsigned({wire72}))) : $signed(((8'h9c) >>> $unsigned((wire74 ?
              (8'hb3) : wire75)))));
      reg79 <= $unsigned(wire73[(2'h2):(2'h2)]);
    end
  assign wire80 = reg78[(4'hd):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed(((|(!$signed(reg79))) >= {({wire75} ?
              $unsigned(reg77) : reg78[(5'h14):(4'hb)]),
          (wire76[(1'h1):(1'h0)] ? (wire76 >>> wire73) : (~&wire71))})))
        begin
          if (wire73)
            begin
              reg81 <= wire80[(4'ha):(1'h1)];
              reg82 <= $unsigned($unsigned($unsigned(wire80)));
              reg83 <= (wire76 ? wire75[(4'hb):(4'hb)] : reg82);
            end
          else
            begin
              reg81 <= $signed(reg83);
              reg82 <= (^(&{(!(wire75 >>> wire72)), $unsigned((~^reg79))}));
              reg83 <= reg82;
              reg84 <= ((wire80[(4'ha):(4'h8)] * (^~$signed(wire72))) + ($unsigned({{reg77},
                  (reg82 ? wire80 : reg79)}) <<< (reg83[(1'h0):(1'h0)] ?
                  ((wire74 ? wire72 : (8'hb1)) << (+wire80)) : wire80)));
            end
          reg85 <= ((~^$signed(reg83)) ?
              $signed((&{{wire72}})) : reg77[(1'h0):(1'h0)]);
          if ($signed(($signed(reg77[(4'h9):(3'h6)]) ?
              wire80 : (wire75 ?
                  ((wire76 ? wire74 : wire76) ~^ (8'hb4)) : (8'hb8)))))
            begin
              reg86 <= (wire75 ^ (^$unsigned(wire71)));
              reg87 <= (reg77 ?
                  (reg85 ?
                      reg78[(5'h10):(5'h10)] : $signed({$signed(reg77),
                          wire74})) : reg85);
            end
          else
            begin
              reg86 <= ((((^~$signed(reg84)) ?
                          $signed(((7'h42) ? reg87 : reg86)) : (^~{wire76})) ?
                      {(+{(7'h43)})} : wire72[(2'h3):(1'h0)]) ?
                  {(!($signed((8'hb5)) ?
                          $unsigned(wire75) : wire75[(4'h8):(1'h0)]))} : $unsigned(reg83));
              reg87 <= ({(7'h41)} == $signed(((~^(8'ha7)) ?
                  reg77 : ($unsigned(reg82) <= ((8'hb0) ? (8'hac) : wire75)))));
              reg88 <= (reg77 ?
                  (!$signed(wire76)) : (&((reg86 | (wire71 - wire74)) >> ((wire75 | wire71) ?
                      (|reg79) : reg79[(3'h6):(3'h5)]))));
              reg89 <= reg86[(1'h1):(1'h0)];
            end
          reg90 <= wire73[(2'h2):(1'h0)];
          reg91 <= $signed(((wire71[(4'hd):(4'h9)] ?
              (~|(wire73 ?
                  (8'ha2) : reg79)) : reg82[(3'h5):(1'h1)]) >> ({reg85[(1'h0):(1'h0)],
                  reg88[(1'h0):(1'h0)]} ?
              ({(8'hb3), (8'hb5)} ^ $unsigned(reg87)) : (^~(&reg81)))));
        end
      else
        begin
          reg81 <= reg87;
        end
      if ($unsigned($unsigned(($signed({(8'haf), reg86}) ?
          ($signed(reg81) ?
              (wire73 ? reg88 : reg89) : (reg91 ? reg89 : wire76)) : reg79))))
        begin
          if (($unsigned((+$unsigned((|reg88)))) <<< $unsigned((!(8'hb5)))))
            begin
              reg92 <= (($signed(((|wire75) ~^ $unsigned((8'hbc)))) ?
                      ($signed($signed(reg88)) >> $unsigned((reg88 << wire75))) : wire76[(3'h4):(1'h1)]) ?
                  {($signed(reg88) >= $unsigned(((8'ha9) <<< reg90)))} : (^reg79[(5'h13):(4'hf)]));
              reg93 <= $signed(((~^$signed((~^wire75))) != ((~|(-reg78)) ?
                  $unsigned((+wire73)) : $signed((reg89 != reg86)))));
            end
          else
            begin
              reg92 <= (($signed($unsigned((|wire76))) ?
                  (($unsigned(reg77) ? (reg77 + reg91) : (8'ha4)) ?
                      (!$unsigned((8'hb4))) : $signed((8'ha5))) : (wire75 == $unsigned($signed((8'haa))))) ^ reg85[(3'h4):(1'h1)]);
              reg93 <= ((wire75[(3'h7):(3'h7)] || {$signed(reg87),
                  ((reg91 * reg91) ?
                      {reg77,
                          reg82} : reg82)}) <<< $unsigned($signed($signed(reg82))));
              reg94 <= $signed({$unsigned($signed((wire75 ~^ reg92))),
                  (((8'ha8) ?
                      wire80 : $signed(reg88)) + $unsigned($unsigned(reg89)))});
              reg95 <= $signed((wire76[(2'h3):(2'h2)] ^~ $unsigned((reg85[(3'h4):(1'h1)] < (reg83 == (8'hb7))))));
              reg96 <= wire80[(5'h13):(4'hb)];
            end
          if ((!(~^$signed(reg94[(4'hb):(3'h7)]))))
            begin
              reg97 <= (reg89[(4'ha):(3'h4)] ~^ $unsigned((~|reg83)));
              reg98 <= reg92;
              reg99 <= reg83;
              reg100 <= reg87[(4'h8):(1'h1)];
            end
          else
            begin
              reg97 <= reg90[(5'h10):(3'h5)];
              reg98 <= $signed(($signed($signed(reg83)) && (&((reg97 != wire76) ?
                  $signed(reg87) : (wire74 >= reg99)))));
              reg99 <= $signed((8'hb6));
            end
          reg101 <= reg86;
        end
      else
        begin
          if ((^~((~&{(reg88 ? (8'hb7) : reg83)}) ? (8'hb9) : (8'hbe))))
            begin
              reg92 <= wire71;
              reg93 <= $signed((((~|wire76) ?
                  reg87[(4'h9):(1'h1)] : wire74) >>> $unsigned({(reg89 ?
                      reg95 : wire73),
                  (reg89 | reg91)})));
            end
          else
            begin
              reg92 <= $signed((+wire74));
              reg93 <= ((reg90[(4'h9):(3'h4)] ?
                  reg101 : (((wire76 ? wire73 : (8'ha5)) ?
                          (reg82 ? reg86 : reg85) : wire72) ?
                      (((7'h42) < reg97) ?
                          (~^reg95) : (reg86 >= (8'hb9))) : (reg91 != reg85))) || ((+{reg83[(1'h0):(1'h0)],
                  $signed((8'h9d))}) || (wire71 ?
                  (|(reg92 ?
                      wire75 : reg91)) : ($signed(reg84) | ((7'h42) & wire71)))));
              reg94 <= {(reg94 ?
                      ($signed((&wire72)) || $signed(reg81[(1'h0):(1'h0)])) : (&{(~^reg94),
                          $signed(reg84)})),
                  $signed(reg100[(5'h15):(5'h12)])};
              reg95 <= wire71[(4'h9):(4'h9)];
            end
          reg96 <= $signed($signed($signed(wire73[(2'h2):(2'h2)])));
          reg97 <= {$unsigned(wire71[(3'h7):(2'h3)])};
          reg98 <= $signed(reg92[(4'hc):(4'hb)]);
        end
    end
  assign wire102 = ($unsigned(reg91[(2'h2):(1'h0)]) ?
                       reg81 : reg96[(4'h8):(4'h8)]);
  always
    @(posedge clk) begin
      if ($unsigned(reg89))
        begin
          reg103 <= $signed(((~|({wire71, (8'ha9)} ? {reg84} : {reg82})) ?
              $signed(((wire76 ?
                  reg86 : (8'hb9)) > reg78[(5'h11):(3'h7)])) : (&$unsigned($signed(reg93)))));
          if (((!(+(wire76 ?
              reg88 : $signed((8'hae))))) >>> $signed((|$signed(reg87[(2'h3):(2'h3)])))))
            begin
              reg104 <= (8'hb7);
              reg105 <= $signed(reg79[(2'h2):(1'h1)]);
            end
          else
            begin
              reg104 <= {{(8'ha8), reg78[(5'h13):(4'hb)]},
                  $unsigned(({reg94[(3'h7):(3'h7)]} >> $unsigned(wire72)))};
              reg105 <= reg85[(2'h3):(2'h2)];
              reg106 <= (reg82 | ($unsigned($signed($unsigned(wire102))) ?
                  (^($signed(reg104) <<< (reg92 ?
                      reg96 : wire71))) : reg93[(3'h6):(3'h6)]));
              reg107 <= $signed({($signed($signed(reg84)) ?
                      $unsigned((reg99 ~^ wire71)) : ($unsigned((8'hb4)) <= (reg85 ?
                          reg84 : reg81))),
                  (reg92 ?
                      ($signed(reg82) ?
                          (&wire102) : $signed((7'h42))) : reg104[(3'h7):(1'h1)])});
            end
          if (reg95[(3'h4):(2'h3)])
            begin
              reg108 <= wire73;
            end
          else
            begin
              reg108 <= reg104;
              reg109 <= wire80;
            end
          reg110 <= $unsigned({$signed((reg87[(4'he):(4'he)] ^~ (~reg84))),
              $unsigned($unsigned($signed(reg77)))});
          if ((^~$unsigned(reg107[(2'h2):(2'h2)])))
            begin
              reg111 <= $unsigned($signed(($unsigned(reg108[(2'h3):(1'h1)]) - reg84)));
            end
          else
            begin
              reg111 <= $signed({(reg83[(1'h1):(1'h0)] ?
                      (+{reg83}) : ({(8'ha4), reg110} ?
                          (reg85 == (8'ha8)) : (&reg90))),
                  ($signed($signed(reg86)) ?
                      wire80 : (((8'hbd) ? reg87 : wire80) + (reg108 ?
                          reg85 : reg86)))});
              reg112 <= ((reg111[(3'h7):(3'h6)] ?
                  (+{$unsigned(reg103),
                      (~^reg110)}) : $signed((~|(~|reg106)))) & (^~((~&$unsigned((8'hab))) ?
                  $signed(reg103[(4'ha):(1'h1)]) : reg78[(4'hb):(1'h1)])));
              reg113 <= $unsigned($signed(reg110));
              reg114 <= reg113[(1'h0):(1'h0)];
              reg115 <= ((($unsigned($signed(reg112)) ?
                      reg91[(2'h3):(2'h2)] : reg83[(2'h3):(2'h3)]) && (~^($signed(reg100) > (reg93 ?
                      reg104 : reg112)))) ?
                  reg103 : reg86);
            end
        end
      else
        begin
          reg103 <= $signed($signed((~&reg111[(2'h3):(2'h3)])));
          if ((|reg105[(1'h1):(1'h0)]))
            begin
              reg104 <= ({(^$unsigned({reg77, (8'h9c)})),
                  $unsigned({(~|wire72)})} <<< $unsigned((~|((^reg94) > (reg108 + wire74)))));
              reg105 <= (reg112 >= ((^~reg85[(1'h0):(1'h0)]) << {(&reg105[(4'hf):(4'h9)])}));
              reg106 <= (wire71 ?
                  (((+(reg83 ? reg86 : reg90)) ?
                          ($signed(reg115) >> (reg87 * reg91)) : (!reg92[(3'h4):(1'h1)])) ?
                      $signed(({reg90,
                          reg113} > reg96[(1'h1):(1'h1)])) : reg113) : reg105);
            end
          else
            begin
              reg104 <= reg87;
              reg105 <= reg77[(3'h5):(2'h3)];
              reg106 <= $signed(wire76);
              reg107 <= ((reg109[(2'h3):(1'h0)] ?
                  (reg93[(4'h8):(4'h8)] ?
                      $signed(reg107) : reg79) : $unsigned(({wire75} >= $signed(reg87)))) < reg98[(5'h10):(4'h9)]);
              reg108 <= ((8'haf) ? (!$signed(reg87)) : reg79[(5'h13):(2'h3)]);
            end
          if ($unsigned(($signed(reg98) <= {$unsigned($unsigned((7'h41))),
              {wire102[(2'h2):(2'h2)], (reg79 ? reg86 : reg78)}})))
            begin
              reg109 <= ($signed($signed($unsigned(reg105[(5'h12):(3'h6)]))) >= {$unsigned((~|(~reg89))),
                  {wire73, reg107}});
              reg110 <= $signed(wire73[(1'h0):(1'h0)]);
              reg111 <= wire72;
              reg112 <= (8'h9f);
              reg113 <= reg104;
            end
          else
            begin
              reg109 <= reg84;
              reg110 <= $signed((((~&(reg77 ?
                  wire80 : reg109)) >> (!reg115[(2'h2):(2'h2)])) ^~ $unsigned($unsigned((reg93 ?
                  reg106 : reg79)))));
            end
          reg114 <= {wire71[(3'h7):(3'h4)]};
        end
    end
  always
    @(posedge clk) begin
      if (wire102[(4'h9):(1'h1)])
        begin
          reg116 <= (8'hb1);
          reg117 <= reg97;
          reg118 <= wire75;
        end
      else
        begin
          if (reg118[(4'h8):(1'h0)])
            begin
              reg116 <= reg90;
              reg117 <= {$signed($signed((8'haf)))};
              reg118 <= reg83[(1'h0):(1'h0)];
              reg119 <= reg103;
            end
          else
            begin
              reg116 <= $unsigned((!$unsigned((reg90[(3'h7):(1'h1)] ?
                  $unsigned((8'hb0)) : (reg93 * reg96)))));
              reg117 <= reg85[(3'h5):(1'h1)];
            end
          reg120 <= reg83[(2'h3):(1'h1)];
        end
      reg121 <= wire75[(2'h3):(1'h0)];
      reg122 <= (reg121[(4'h8):(4'h8)] ^~ (|{($signed((8'hb4)) ?
              {reg104, reg116} : reg87),
          {$signed(reg116), reg104[(3'h6):(3'h5)]}}));
      if ((8'hbc))
        begin
          reg123 <= $signed(reg81[(1'h0):(1'h0)]);
        end
      else
        begin
          reg123 <= reg103[(2'h3):(1'h0)];
          reg124 <= $unsigned(reg97[(4'h8):(3'h4)]);
          reg125 <= $unsigned(reg108[(1'h0):(1'h0)]);
        end
      reg126 <= (~^((reg98 ^ ($unsigned(reg79) <<< $unsigned(reg86))) ^ $signed(($unsigned(reg125) * $unsigned(reg118)))));
    end
  assign wire127 = reg95[(1'h1):(1'h1)];
  assign wire128 = reg99;
endmodule

module module39
#(parameter param61 = (((~&(((8'hb2) ~^ (8'hb4)) >>> ((8'ha0) ? (8'hbd) : (8'had)))) >>> (8'hab)) ^~ ({(^((8'had) ? (7'h42) : (8'h9c))), ({(8'hb6)} ^ {(8'hb0)})} ^~ ({(|(8'hb2)), {(8'hae)}} | {((8'hb5) * (7'h40))}))))
(y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire44;
  input wire [(4'hc):(1'h0)] wire43;
  input wire signed [(4'h9):(1'h0)] wire42;
  input wire [(2'h2):(1'h0)] wire41;
  input wire signed [(3'h6):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire45;
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 (1'h0)};
  assign wire45 = wire41;
  assign wire46 = wire40[(2'h3):(2'h2)];
  assign wire47 = wire43;
  assign wire48 = ((^~(wire46[(4'he):(4'hd)] & $signed((wire42 ?
                          wire42 : wire45)))) ?
                      wire45 : (8'haf));
  assign wire49 = wire43;
  assign wire50 = wire46[(4'h9):(3'h6)];
  assign wire51 = wire44;
  assign wire52 = wire40[(1'h0):(1'h0)];
  assign wire53 = wire51[(3'h6):(2'h2)];
  assign wire54 = ((wire42 >>> ({{wire49},
                      (~|wire48)} <= $signed(wire49))) != ($signed($signed(wire49)) ?
                      (wire42[(1'h1):(1'h0)] ?
                          wire53 : wire41[(1'h0):(1'h0)]) : (~wire42[(3'h5):(1'h0)])));
  assign wire55 = (+wire54[(3'h5):(3'h4)]);
  assign wire56 = {((wire48 ? wire49[(1'h0):(1'h0)] : wire53[(1'h0):(1'h0)]) ?
                          (~|(8'hb9)) : ({(~wire51)} <= wire43[(3'h6):(2'h3)]))};
  assign wire57 = $unsigned((wire42[(2'h2):(2'h2)] & (wire55 <<< ((wire54 ?
                      wire47 : wire55) >>> ((8'hb0) || wire55)))));
  assign wire58 = $unsigned(($signed((wire52[(4'ha):(2'h3)] <= (wire43 ?
                      wire50 : wire55))) - {(~^{wire48})}));
  assign wire59 = (wire40 ?
                      wire51 : {((-(&wire42)) - ((wire42 ?
                              (8'hb8) : wire55) <= wire53)),
                          ((-((8'ha4) > (8'hab))) ?
                              $signed({wire52}) : $signed(wire54))});
  assign wire60 = {$unsigned(wire48)};
endmodule

module module204
#(parameter param261 = {{((-(&(8'ha5))) ? ((^~(7'h41)) || ((8'hba) ? (8'hbb) : (7'h41))) : (~&((8'hb8) == (8'hac))))}}, 
parameter param262 = (param261 * ((((param261 ? param261 : param261) ? param261 : (param261 && param261)) || ((param261 ? param261 : param261) ? (|param261) : (param261 ? param261 : param261))) ? {(~^(+param261)), (~^((8'hb6) ? param261 : param261))} : (((param261 ? param261 : param261) ? (param261 ? param261 : param261) : (param261 ? param261 : (8'hbf))) >= ((7'h41) << (param261 ? param261 : param261))))))
(y, clk, wire208, wire207, wire206, wire205);
  output wire [(32'h242):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire208;
  input wire signed [(3'h4):(1'h0)] wire207;
  input wire [(2'h3):(1'h0)] wire206;
  input wire signed [(4'he):(1'h0)] wire205;
  wire signed [(4'ha):(1'h0)] wire260;
  wire signed [(4'ha):(1'h0)] wire254;
  wire signed [(5'h13):(1'h0)] wire253;
  wire signed [(3'h5):(1'h0)] wire238;
  wire [(5'h15):(1'h0)] wire237;
  wire signed [(5'h13):(1'h0)] wire222;
  wire [(5'h14):(1'h0)] wire221;
  wire [(5'h12):(1'h0)] wire220;
  wire signed [(4'h9):(1'h0)] wire218;
  wire [(4'hd):(1'h0)] wire217;
  wire [(5'h10):(1'h0)] wire216;
  wire [(3'h4):(1'h0)] wire213;
  wire signed [(3'h5):(1'h0)] wire212;
  wire [(3'h4):(1'h0)] wire211;
  reg signed [(4'hc):(1'h0)] reg259 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg258 = (1'h0);
  reg [(3'h4):(1'h0)] reg257 = (1'h0);
  reg [(4'he):(1'h0)] reg256 = (1'h0);
  reg [(2'h2):(1'h0)] reg255 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg252 = (1'h0);
  reg [(5'h11):(1'h0)] reg251 = (1'h0);
  reg [(5'h11):(1'h0)] reg250 = (1'h0);
  reg [(4'hd):(1'h0)] reg249 = (1'h0);
  reg [(3'h6):(1'h0)] reg248 = (1'h0);
  reg [(3'h6):(1'h0)] reg247 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg246 = (1'h0);
  reg [(3'h7):(1'h0)] reg245 = (1'h0);
  reg [(5'h10):(1'h0)] reg244 = (1'h0);
  reg [(4'h8):(1'h0)] reg243 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg242 = (1'h0);
  reg [(2'h2):(1'h0)] reg241 = (1'h0);
  reg signed [(4'he):(1'h0)] reg240 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg239 = (1'h0);
  reg [(5'h10):(1'h0)] reg236 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg235 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg234 = (1'h0);
  reg [(2'h3):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg232 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg230 = (1'h0);
  reg [(4'he):(1'h0)] reg229 = (1'h0);
  reg [(3'h6):(1'h0)] reg228 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg226 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg225 = (1'h0);
  reg [(4'h8):(1'h0)] reg224 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg223 = (1'h0);
  reg [(3'h7):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg215 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg214 = (1'h0);
  reg [(5'h15):(1'h0)] reg210 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg209 = (1'h0);
  assign y = {wire260,
                 wire254,
                 wire253,
                 wire238,
                 wire237,
                 wire222,
                 wire221,
                 wire220,
                 wire218,
                 wire217,
                 wire216,
                 wire213,
                 wire212,
                 wire211,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg219,
                 reg215,
                 reg214,
                 reg210,
                 reg209,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg209 <= (-wire208);
      reg210 <= {reg209,
          ($unsigned(((~&wire208) ^~ (wire208 ?
              wire207 : wire206))) == reg209)};
    end
  assign wire211 = wire208;
  assign wire212 = $unsigned(wire211);
  assign wire213 = wire207[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg214 <= (7'h41);
      reg215 <= wire207[(3'h4):(2'h3)];
    end
  assign wire216 = $signed(((((~&wire206) ?
                               reg210[(4'hd):(4'hc)] : $unsigned(reg210)) ?
                           (&(~^wire205)) : $unsigned(wire212[(2'h3):(1'h1)])) ?
                       wire213[(1'h0):(1'h0)] : (wire213 ?
                           wire205[(4'hc):(1'h0)] : (((8'haa) ?
                                   reg215 : wire213) ?
                               $unsigned((7'h42)) : $unsigned(wire207)))));
  assign wire217 = (reg209[(1'h1):(1'h0)] ?
                       ({($unsigned(wire212) | $signed(wire216))} == $signed(($unsigned(wire207) ?
                           ((8'ha1) ?
                               reg209 : wire216) : (~wire213)))) : (~&({wire212[(1'h0):(1'h0)],
                           (wire216 ?
                               wire212 : wire212)} >> $unsigned((wire206 | wire206)))));
  assign wire218 = ($unsigned(wire213) <<< (wire212[(3'h5):(3'h4)] ?
                       (~&$signed(reg215[(1'h1):(1'h1)])) : (-wire207[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg219 <= ($signed((($signed(reg210) ?
          (~wire206) : (wire218 ? wire208 : wire211)) == $signed((reg214 ?
          wire207 : wire213)))) || $signed(wire206[(1'h1):(1'h0)]));
    end
  assign wire220 = reg210;
  assign wire221 = $unsigned((wire216[(1'h1):(1'h0)] != $unsigned(wire217)));
  assign wire222 = ($unsigned((^~{(~^reg215)})) | $unsigned(wire206));
  always
    @(posedge clk) begin
      if (($signed($unsigned(((!wire222) ? wire218 : $signed(wire211)))) ?
          {$unsigned((wire221[(3'h5):(1'h0)] - (wire220 ? wire218 : wire222))),
              wire222[(4'hb):(1'h1)]} : $unsigned(reg210)))
        begin
          reg223 <= wire207;
          reg224 <= wire216[(4'he):(1'h0)];
          if (((wire220[(1'h0):(1'h0)] ^ (wire212[(2'h2):(2'h2)] ?
              reg223[(2'h3):(1'h0)] : wire216)) << wire217))
            begin
              reg225 <= ($unsigned(((reg219 >= $signed(wire220)) <<< reg223)) == wire206[(2'h2):(2'h2)]);
              reg226 <= wire216[(3'h4):(1'h1)];
              reg227 <= $unsigned((reg215 != {$signed($unsigned(reg215)),
                  $signed(wire208)}));
            end
          else
            begin
              reg225 <= ((+reg214[(1'h1):(1'h1)]) >>> $unsigned((~($signed(reg224) & ((8'hbf) ?
                  wire205 : (8'h9e))))));
              reg226 <= (+$signed($unsigned((&(reg225 << wire222)))));
              reg227 <= {({(7'h43)} ?
                      $unsigned({reg215}) : ((wire218[(1'h1):(1'h1)] ?
                          (reg225 ?
                              wire221 : wire207) : (-reg214)) >> (~^(~&wire213))))};
            end
          if (wire221[(4'hb):(4'ha)])
            begin
              reg228 <= (reg224 <<< {$signed((-(wire206 < wire221)))});
              reg229 <= (8'hb6);
              reg230 <= ((wire207[(2'h3):(2'h2)] ?
                      wire220 : (reg215[(5'h12):(4'h9)] ?
                          ((wire216 ? reg225 : reg210) ?
                              (wire220 ?
                                  reg219 : (8'hac)) : (-wire205)) : reg209[(2'h2):(2'h2)])) ?
                  ((^(+(reg210 ? wire205 : (8'ha6)))) ?
                      $signed(wire220[(5'h12):(3'h7)]) : $signed(reg224)) : reg219[(1'h0):(1'h0)]);
            end
          else
            begin
              reg228 <= ($signed(reg209) + {($unsigned((^wire207)) ?
                      (|(~reg209)) : $signed(wire212[(3'h5):(3'h4)])),
                  {reg210}});
              reg229 <= reg226;
              reg230 <= (~&$unsigned($unsigned($unsigned($signed(wire207)))));
              reg231 <= (-($signed((+{wire220, (8'hb4)})) ?
                  wire207 : reg209[(1'h1):(1'h0)]));
              reg232 <= ($unsigned($unsigned(reg210[(5'h14):(4'hb)])) ?
                  wire206[(2'h2):(1'h1)] : wire216[(4'hf):(4'h9)]);
            end
        end
      else
        begin
          if (($unsigned(reg230[(4'h8):(4'h8)]) && reg231))
            begin
              reg223 <= (reg214[(1'h0):(1'h0)] && ({wire216,
                  (~^(wire211 ? wire211 : wire205))} <<< wire221));
              reg224 <= (reg227 ? wire212[(2'h3):(2'h2)] : wire208);
              reg225 <= wire218;
              reg226 <= (wire212[(1'h0):(1'h0)] * {$unsigned(($signed(wire206) ?
                      wire212[(1'h0):(1'h0)] : (reg209 ^~ reg232))),
                  reg232});
            end
          else
            begin
              reg223 <= (&reg210[(4'h9):(1'h0)]);
              reg224 <= ((!reg226) + $unsigned($signed((+wire216))));
            end
          reg227 <= $signed((($unsigned((wire221 + reg223)) ?
              ($unsigned(wire220) ? {(8'hbf)} : $signed(wire221)) : (^(reg226 ?
                  (8'hbf) : wire208))) ^ reg219));
          reg228 <= reg230[(4'ha):(3'h6)];
        end
    end
  always
    @(posedge clk) begin
      reg233 <= $signed((8'hb5));
      reg234 <= (^~wire206[(2'h3):(1'h0)]);
      reg235 <= $unsigned((((^~reg214) >> ((reg234 != reg219) - (^~reg230))) <= (reg219[(3'h6):(2'h2)] - $signed($signed(reg230)))));
      reg236 <= $signed($signed((7'h44)));
    end
  assign wire237 = $signed($unsigned(reg223[(3'h4):(1'h1)]));
  assign wire238 = $signed((8'h9d));
  always
    @(posedge clk) begin
      reg239 <= reg215;
      reg240 <= (((reg234 << (((8'hb5) << reg228) ?
              wire212 : {wire206, reg236})) + $unsigned({(~&reg226)})) ?
          wire218 : (($signed($unsigned((8'hab))) ?
                  (+reg215[(4'h9):(1'h1)]) : $unsigned(reg239)) ?
              ({wire222} ^ wire221[(4'hd):(3'h6)]) : (reg226[(4'hf):(3'h6)] || wire216)));
      if ((((8'h9f) == {$signed(wire218)}) - {reg219[(3'h5):(2'h2)], reg235}))
        begin
          reg241 <= $unsigned($signed($signed(reg226[(2'h3):(2'h2)])));
        end
      else
        begin
          if ((-(~^reg229)))
            begin
              reg241 <= ((~&reg227[(1'h1):(1'h1)]) >= $signed($signed($signed({reg233,
                  reg223}))));
              reg242 <= wire218[(3'h5):(2'h3)];
              reg243 <= reg229[(4'ha):(3'h6)];
              reg244 <= (8'ha0);
            end
          else
            begin
              reg241 <= $signed($signed(((((8'h9d) ? wire205 : reg240) ?
                      reg223 : reg227) ?
                  ((reg225 >> wire238) || $signed(reg223)) : $unsigned(reg223[(3'h4):(1'h0)]))));
            end
          reg245 <= $signed(($unsigned(reg225) < $unsigned({(reg233 >= (8'ha1)),
              $signed(reg244)})));
          if (wire216)
            begin
              reg246 <= (8'ha0);
              reg247 <= ({$unsigned(((+reg244) ?
                          (reg232 * reg246) : (reg219 <<< (8'hbd)))),
                      (^$unsigned((reg243 ? reg232 : wire213)))} ?
                  (+(((~reg225) ?
                      $unsigned(wire237) : (reg226 ?
                          wire205 : wire222)) > {$signed(wire208)})) : ($unsigned(reg224) && $signed((8'hb9))));
              reg248 <= ($signed($unsigned({(^~reg244)})) <= (~^$unsigned({(~|(8'hab))})));
              reg249 <= $unsigned((+wire213));
              reg250 <= $unsigned($signed($unsigned($signed($unsigned(wire238)))));
            end
          else
            begin
              reg246 <= {$unsigned($signed({{reg210}})),
                  $signed(reg233[(2'h3):(1'h0)])};
              reg247 <= reg214;
            end
          reg251 <= ($unsigned(((((8'haf) - reg224) ?
              wire221[(2'h2):(1'h1)] : ((8'hbc) ?
                  wire206 : reg209)) >>> $signed((reg215 ^ reg235)))) >= ($unsigned(reg209) ?
              $unsigned((^reg234[(4'he):(4'ha)])) : (^((&(8'h9c)) & {reg234}))));
        end
      reg252 <= reg248;
    end
  assign wire253 = (wire212 ^ $unsigned((8'ha1)));
  assign wire254 = ($signed($signed(reg214[(1'h1):(1'h0)])) ?
                       ($unsigned((reg228 ?
                               {reg251, reg239} : (wire221 ?
                                   reg250 : wire220))) ?
                           (&$signed((7'h41))) : (((^reg236) ?
                               (^(8'hac)) : (|(8'hb2))) & $signed((!reg250)))) : (reg243 || {((reg250 ?
                                   (8'ha7) : wire205) ?
                               wire222 : reg223)}));
  always
    @(posedge clk) begin
      reg255 <= (+wire222);
      reg256 <= wire208[(5'h10):(4'hc)];
      reg257 <= reg249[(4'h9):(4'h8)];
      reg258 <= {(((wire218[(1'h0):(1'h0)] ?
                      {wire213, reg228} : $unsigned(reg233)) ?
                  (-{reg245, reg231}) : {(wire216 ^ wire221), (~reg224)}) ?
              {{$signed((8'h9e)), $signed(wire253)},
                  {(reg256 >> reg228),
                      ((7'h42) != reg233)}} : reg256[(4'h8):(2'h2)])};
      reg259 <= ($unsigned($signed(((wire221 ? (8'ha0) : wire212) ?
          reg214 : $signed(wire205)))) < reg209[(1'h1):(1'h0)]);
    end
  assign wire260 = ($signed(reg244[(2'h2):(1'h1)]) ?
                       (^~{wire218}) : wire254[(3'h4):(1'h1)]);
endmodule

module module163
#(parameter param174 = (({{{(8'ha2), (7'h42)}}} ? {((^(8'hb8)) != ((8'h9d) ? (8'hb7) : (8'ha0)))} : (!((!(8'hbc)) >>> ((8'hb8) <= (8'hac))))) ? {((((7'h43) == (7'h41)) ? (&(8'ha1)) : ((8'hab) ^ (8'h9e))) ^~ (((7'h40) + (8'ha7)) ? ((7'h44) - (8'hb0)) : ((8'ha8) && (7'h44)))), (^~(8'hbe))} : ((({(7'h43), (8'hb7)} ? (+(7'h43)) : (8'hab)) - ({(7'h41), (8'hac)} >>> {(8'ha3), (8'hb7)})) ? ((-((8'haa) ? (8'ha7) : (8'h9d))) ? (((8'hab) ? (8'h9c) : (8'ha6)) > ((8'hbf) ? (8'ha2) : (8'hbd))) : ((^~(7'h40)) ? (8'haf) : (~(8'ha1)))) : (&((+(8'hbd)) ? ((8'hab) || (8'hb7)) : ((8'hbf) ? (8'ha3) : (8'h9f)))))))
(y, clk, wire168, wire167, wire166, wire165, wire164);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire168;
  input wire [(3'h5):(1'h0)] wire167;
  input wire [(5'h11):(1'h0)] wire166;
  input wire [(3'h7):(1'h0)] wire165;
  input wire [(3'h6):(1'h0)] wire164;
  wire [(5'h13):(1'h0)] wire173;
  wire signed [(4'hc):(1'h0)] wire172;
  wire [(2'h3):(1'h0)] wire171;
  wire signed [(4'he):(1'h0)] wire170;
  wire [(4'ha):(1'h0)] wire169;
  assign y = {wire173, wire172, wire171, wire170, wire169, (1'h0)};
  assign wire169 = (~^wire167);
  assign wire170 = wire168;
  assign wire171 = wire168;
  assign wire172 = (|wire164);
  assign wire173 = {(-wire165), {((8'hb2) << $signed(wire167))}};
endmodule
