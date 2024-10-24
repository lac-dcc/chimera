module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire88;
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  assign y = {wire90,
                 wire5,
                 wire6,
                 wire7,
                 wire34,
                 wire35,
                 wire88,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 (1'h0)};
  assign wire5 = ((~|$signed(wire4)) ? wire4 : $signed((&wire3)));
  assign wire6 = wire5;
  assign wire7 = (~|{(8'hac), (+$signed(wire6))});
  always
    @(posedge clk) begin
      if ($signed($unsigned($signed($signed((!wire1))))))
        begin
          reg8 <= wire6[(4'ha):(2'h2)];
          if ((~&wire4[(4'hc):(3'h7)]))
            begin
              reg9 <= $unsigned((reg8[(2'h2):(2'h2)] ?
                  (&$unsigned($signed(wire4))) : $signed((~^wire7))));
            end
          else
            begin
              reg9 <= $unsigned($unsigned($signed(wire5[(1'h0):(1'h0)])));
              reg10 <= $unsigned((wire4[(3'h6):(2'h2)] < (reg8[(3'h6):(3'h4)] ?
                  (^~(8'hb2)) : ((wire1 ? wire1 : reg8) ?
                      (~&(8'ha1)) : wire2[(1'h0):(1'h0)]))));
              reg11 <= (+wire5[(1'h0):(1'h0)]);
            end
          reg12 <= $unsigned((((wire0 * {(8'hb4)}) * $unsigned((reg8 <= wire6))) ?
              reg9[(3'h6):(3'h4)] : wire0[(4'hb):(2'h2)]));
        end
      else
        begin
          reg8 <= ((8'ha4) - $unsigned(($unsigned(wire1) ~^ wire4[(3'h7):(1'h0)])));
          reg9 <= (reg11[(1'h1):(1'h0)] << {reg8[(4'hb):(3'h7)],
              (((reg9 ?
                  reg11 : reg11) >= wire2[(1'h1):(1'h0)]) + wire4[(3'h6):(3'h4)])});
        end
      reg13 <= wire5[(3'h4):(3'h4)];
      reg14 <= {((&reg9) ? wire1 : (wire7 * $signed(reg8[(4'h8):(2'h2)])))};
      if (wire5[(2'h3):(2'h3)])
        begin
          if ((-$signed(reg8[(4'h8):(1'h1)])))
            begin
              reg15 <= (+wire6);
            end
          else
            begin
              reg15 <= ((8'ha6) ?
                  wire2[(3'h6):(2'h3)] : (wire0 ?
                      {(^(~&(8'had))),
                          ($unsigned(reg12) ?
                              reg15 : reg13[(3'h4):(1'h0)])} : (reg13[(1'h1):(1'h0)] < ((~^(8'haf)) ?
                          reg11[(1'h0):(1'h0)] : (reg10 ? reg14 : reg15)))));
              reg16 <= reg8[(2'h3):(2'h3)];
              reg17 <= wire3[(2'h2):(1'h0)];
              reg18 <= wire0[(2'h3):(2'h3)];
            end
          reg19 <= $unsigned(wire2);
          reg20 <= $signed(wire7);
          if (($unsigned(wire6) ?
              ({($unsigned(reg15) | $unsigned(reg9))} ?
                  $unsigned({((8'hbe) + wire6)}) : reg19[(2'h2):(1'h1)]) : (8'hbd)))
            begin
              reg21 <= (wire1[(2'h2):(1'h0)] << (~|$signed(($unsigned(reg8) ?
                  wire2 : $signed(wire2)))));
            end
          else
            begin
              reg21 <= $signed(((!(8'hac)) <= {(-(reg14 != wire3))}));
            end
        end
      else
        begin
          reg15 <= (reg21[(4'hc):(2'h2)] ? reg9 : $unsigned(reg8));
          if ((((8'hbc) ? $signed((~^reg14)) : reg16[(3'h5):(2'h3)]) ?
              $unsigned($signed(((&reg12) ^~ (~|reg9)))) : $signed(((|$unsigned(reg14)) == $unsigned(((7'h44) <<< reg20))))))
            begin
              reg16 <= (($unsigned((~^(wire2 ?
                  reg18 : (7'h44)))) == $unsigned(wire1)) << wire3[(1'h0):(1'h0)]);
              reg17 <= ($signed($unsigned(($signed(reg8) ?
                      $unsigned(wire4) : (reg9 ^~ wire2)))) ?
                  ((reg11[(1'h0):(1'h0)] <= (!((8'haa) ?
                      reg18 : reg17))) > (^((wire2 >> wire5) ?
                      $signed(reg15) : ((8'hae) == (8'hbd))))) : $signed({{(~|wire4)},
                      reg10[(3'h6):(3'h5)]}));
              reg18 <= $unsigned((($unsigned($signed(reg21)) ? (8'hb2) : reg9) ?
                  ($signed((8'hb8)) >>> (wire2[(3'h6):(2'h3)] ?
                      reg20 : ((8'hb2) < wire3))) : ((wire5 >> (8'hbd)) ?
                      $signed({reg20, (8'ha7)}) : {{wire2}, (reg12 > reg14)})));
            end
          else
            begin
              reg16 <= reg21[(3'h4):(2'h3)];
            end
          reg19 <= $unsigned($unsigned(($unsigned((8'h9c)) ?
              ((^~reg10) ?
                  (wire3 ?
                      reg20 : reg21) : reg15[(2'h2):(1'h0)]) : (~((8'ha1) * wire3)))));
          reg20 <= ($signed($unsigned(($signed(wire4) ?
                  $signed((8'had)) : $signed(reg16)))) ?
              reg11 : ($unsigned(wire6) ?
                  wire7 : ((!$signed(reg11)) == (~$unsigned(reg10)))));
        end
    end
  always
    @(posedge clk) begin
      reg22 <= $signed({(^~$unsigned($signed(reg18)))});
    end
  always
    @(posedge clk) begin
      if ({{{($signed(reg17) != ((8'hba) << reg21))}}, {reg11[(2'h2):(2'h2)]}})
        begin
          if (reg12[(3'h5):(2'h2)])
            begin
              reg23 <= reg14[(2'h3):(1'h0)];
              reg24 <= $signed((+((~reg14[(4'ha):(1'h0)]) ?
                  ((reg11 ? wire0 : reg23) ?
                      $unsigned(reg20) : reg20) : wire6[(3'h7):(1'h0)])));
              reg25 <= (7'h40);
            end
          else
            begin
              reg23 <= ($unsigned($signed($signed(reg16))) | (8'hb8));
              reg24 <= $unsigned($unsigned(reg13[(2'h3):(1'h1)]));
              reg25 <= $signed((reg10[(4'he):(3'h5)] ?
                  wire2[(1'h0):(1'h0)] : (|$signed(reg25))));
              reg26 <= reg16[(1'h0):(1'h0)];
            end
          if (((reg21 ?
              $unsigned(((~^reg23) >> (~^(8'hbf)))) : $unsigned({reg24})) <= $signed(reg20)))
            begin
              reg27 <= (wire4 >= wire4[(1'h0):(1'h0)]);
              reg28 <= {$signed(wire5[(1'h1):(1'h0)])};
            end
          else
            begin
              reg27 <= $signed((~$unsigned(reg13[(4'h8):(1'h0)])));
              reg28 <= ((8'hbd) >= ((8'hb7) > ($signed((reg8 ? reg13 : wire0)) ?
                  reg28 : $signed((!(8'hbe))))));
              reg29 <= $unsigned($unsigned(($unsigned((wire7 ?
                      (7'h42) : reg24)) ?
                  $unsigned((reg8 ? (7'h41) : reg10)) : (wire3[(1'h0):(1'h0)] ?
                      (reg26 >>> wire6) : (^~reg9)))));
            end
          reg30 <= $unsigned({{$unsigned({wire3, reg10})}});
        end
      else
        begin
          reg23 <= (~$unsigned((wire1 >>> reg30)));
          if (($unsigned({(wire7 ? $unsigned((7'h44)) : reg11)}) ?
              $unsigned(reg12[(1'h1):(1'h0)]) : (reg19[(1'h1):(1'h0)] ?
                  $signed({((8'h9c) && reg9)}) : reg28)))
            begin
              reg24 <= (~&$signed({({reg30, (8'ha9)} ?
                      (wire0 ? reg22 : reg13) : reg13)}));
              reg25 <= ((~(~^(|(~|reg13)))) ?
                  (($signed((^~(8'hac))) + reg20[(3'h4):(2'h3)]) ?
                      wire6[(1'h0):(1'h0)] : ({$unsigned(wire3)} ?
                          reg16 : (|$unsigned(reg10)))) : {(~^reg20)});
              reg26 <= $signed($signed(reg18[(4'hc):(4'ha)]));
            end
          else
            begin
              reg24 <= reg14[(4'h9):(4'h9)];
              reg25 <= reg22[(3'h4):(2'h2)];
              reg26 <= {$unsigned((^reg14)), reg29[(4'h8):(4'h8)]};
            end
        end
      reg31 <= reg15;
      reg32 <= $signed((wire5 | (reg24 ?
          (wire4 ? $signed(reg22) : reg25) : reg26)));
      reg33 <= (~^{(8'h9d)});
    end
  assign wire34 = $unsigned((reg13 ?
                      (!reg31[(4'hd):(1'h1)]) : (^~$unsigned({reg31}))));
  assign wire35 = ({$unsigned(reg14), (~&$unsigned((reg19 ~^ reg21)))} ?
                      (reg30 && (~$unsigned($unsigned(reg10)))) : reg28[(2'h3):(1'h1)]);
  module36 #() modinst89 (wire88, clk, wire5, reg32, reg33, reg21);
  assign wire90 = wire34[(1'h1):(1'h0)];
endmodule

module module36
#(parameter param86 = ({((!(~|(8'hb1))) ? (^(~^(8'hb0))) : (&((8'ha3) << (8'ha9))))} >> ((&(((8'ha6) ? (8'hba) : (8'ha0)) || ((8'hae) >= (8'ha9)))) ^~ ((((7'h41) ? (8'had) : (8'ha6)) < ((8'hba) - (8'hbe))) ? ((|(8'h9f)) * ((8'haa) <<< (7'h40))) : {(~^(8'haa)), {(8'hbb), (8'ha9)}}))), 
parameter param87 = (({((param86 ? param86 : param86) ^~ (param86 ~^ param86))} ? (({param86} ? param86 : param86) ? {(param86 ? param86 : param86), {param86, param86}} : (param86 ? param86 : param86)) : param86) ? (~|(~&(param86 ? (~param86) : (~param86)))) : {param86, ({(~&param86)} ? ((&param86) * param86) : (&param86))}))
(y, clk, wire37, wire38, wire39, wire40);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire37;
  input wire [(5'h10):(1'h0)] wire38;
  input wire [(5'h13):(1'h0)] wire39;
  input wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire60;
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  assign y = {wire85,
                 wire82,
                 wire80,
                 wire79,
                 wire73,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire62,
                 wire41,
                 wire42,
                 wire43,
                 wire60,
                 reg84,
                 reg83,
                 reg81,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg72,
                 reg64,
                 (1'h0)};
  assign wire41 = wire37;
  assign wire42 = wire38[(2'h2):(1'h1)];
  assign wire43 = ((+$signed(wire40)) ?
                      wire42[(3'h4):(1'h1)] : $unsigned($signed((8'h9e))));
  module44 #() modinst61 (wire60, clk, wire38, wire42, wire41, wire40, wire43);
  assign wire62 = wire39[(4'hc):(1'h0)];
  assign wire63 = (wire37 ?
                      {{$signed($unsigned(wire42))},
                          $signed($signed((~&wire37)))} : (((~|wire37[(4'hb):(1'h0)]) ?
                          wire60 : (^~(~^(8'hbf)))) ^~ (~&(^~$unsigned((8'hab))))));
  always
    @(posedge clk) begin
      reg64 <= $unsigned(($signed(((wire40 >>> wire63) & (wire37 ?
              wire38 : wire41))) ?
          ($unsigned(wire38[(2'h3):(2'h2)]) ?
              (~|(&(8'hb4))) : (wire62 != $signed(wire37))) : (-(+{wire63}))));
    end
  assign wire65 = wire40[(2'h2):(1'h0)];
  assign wire66 = $unsigned(wire38);
  assign wire67 = $signed($unsigned($unsigned((wire43[(3'h5):(1'h0)] || (wire43 >> reg64)))));
  assign wire68 = ($unsigned(((!wire37) * (wire37[(4'ha):(3'h7)] ?
                          (wire62 ? wire40 : wire37) : ((8'ha4) ?
                              (8'ha4) : wire38)))) ?
                      {wire37, wire62[(4'hb):(2'h3)]} : wire62);
  assign wire69 = (+((wire42[(4'h9):(4'h8)] | (^~$signed(wire37))) ?
                      ({$unsigned(wire40),
                          (wire41 ? wire60 : wire38)} <<< $unsigned((wire65 ?
                          wire43 : wire42))) : ($unsigned($unsigned(wire37)) | {((8'h9e) ?
                              wire40 : (8'hbe))})));
  assign wire70 = (~|wire38[(3'h7):(2'h3)]);
  assign wire71 = ($unsigned((!$unsigned(wire42[(1'h1):(1'h0)]))) ?
                      wire63 : ($signed($unsigned(wire70[(1'h0):(1'h0)])) ?
                          {wire42[(2'h2):(1'h0)],
                              $unsigned((wire69 - wire43))} : $signed($unsigned($unsigned(wire63)))));
  always
    @(posedge clk) begin
      reg72 <= ($unsigned(wire41[(4'hc):(4'ha)]) ?
          wire62[(4'hc):(3'h6)] : wire38[(5'h10):(3'h4)]);
    end
  assign wire73 = $unsigned(wire67);
  always
    @(posedge clk) begin
      if ({$unsigned($signed($signed(wire43[(1'h0):(1'h0)])))})
        begin
          reg74 <= wire70[(2'h3):(2'h2)];
          reg75 <= wire73[(4'hd):(4'hd)];
        end
      else
        begin
          reg74 <= (((^~($signed(wire71) ^~ $signed(wire65))) | (((wire40 || wire41) ?
                  $signed(wire65) : $unsigned((8'hab))) < $unsigned($unsigned((8'h9f))))) ?
              (~^reg64[(3'h5):(1'h0)]) : ($signed((reg64 >>> wire71[(4'hd):(3'h6)])) < wire42[(2'h2):(1'h0)]));
          reg75 <= wire37[(1'h1):(1'h0)];
          reg76 <= reg64[(3'h6):(3'h4)];
        end
      reg77 <= (wire37[(3'h6):(3'h4)] ?
          $signed(wire62) : (wire65 ?
              ($unsigned(wire60[(1'h0):(1'h0)]) <<< ((-wire67) ?
                  (^~reg64) : wire62[(1'h0):(1'h0)])) : (+((~^wire70) ?
                  (wire37 ? wire70 : (8'hae)) : (wire40 * reg64)))));
      reg78 <= $unsigned((~$signed(wire68[(2'h2):(2'h2)])));
    end
  assign wire79 = $unsigned($signed($unsigned(wire63[(1'h1):(1'h1)])));
  assign wire80 = ({(8'hbc),
                      ((~|(|reg78)) ?
                          $unsigned((wire40 > reg76)) : ((+wire69) ?
                              $unsigned(wire62) : reg78))} || reg78[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg81 <= (reg76 ?
          ({wire62[(5'h10):(5'h10)]} << $signed(wire67)) : (({(wire60 ?
                      wire41 : wire60)} <= $unsigned({wire73})) ?
              wire79 : ({((7'h43) < wire39)} ?
                  (wire60 >> wire79[(2'h3):(2'h2)]) : {wire70,
                      (wire60 ? wire65 : reg72)})));
    end
  assign wire82 = (~&(wire70 ?
                      ($signed($unsigned(wire73)) << $signed(wire68)) : $signed(wire67[(5'h13):(5'h11)])));
  always
    @(posedge clk) begin
      reg83 <= {$signed($signed(wire70[(2'h2):(1'h1)]))};
      reg84 <= $unsigned(wire67[(3'h6):(1'h1)]);
    end
  assign wire85 = $unsigned($unsigned($unsigned(wire67[(4'hb):(4'h8)])));
endmodule

module module44  (y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire49;
  input wire signed [(4'h9):(1'h0)] wire48;
  input wire [(2'h3):(1'h0)] wire47;
  input wire [(5'h15):(1'h0)] wire46;
  input wire [(2'h2):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire50;
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire50,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire50 = $signed($unsigned(($signed((wire46 ^ wire47)) & ((wire47 ?
                          wire48 : wire49) ?
                      (wire47 ? wire47 : wire45) : wire47))));
  always
    @(posedge clk) begin
      reg51 <= ($signed($signed(wire46)) - (&(!(+(wire46 ? wire49 : wire48)))));
      reg52 <= (wire45 ? wire46[(4'hc):(3'h4)] : (~&(~|(!(7'h40)))));
    end
  assign wire53 = ($signed($unsigned((!reg52))) != ({$unsigned(wire45),
                      $signed(wire49[(4'hf):(4'h8)])} >= (~|(8'hab))));
  assign wire54 = (^~(&$signed((~&reg52))));
  assign wire55 = wire53;
  assign wire56 = wire55[(2'h2):(1'h1)];
  assign wire57 = $signed((8'hbf));
  assign wire58 = $unsigned({$signed($unsigned({wire47}))});
  assign wire59 = $unsigned($unsigned(wire58));
endmodule
