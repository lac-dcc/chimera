module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire127;
  wire [(4'ha):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire125;
  wire signed [(3'h6):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire4;
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire123,
                 wire44,
                 wire43,
                 wire41,
                 wire4,
                 (1'h0)};
  assign wire4 = (8'hbe);
  module5 #() modinst42 (wire41, clk, wire2, wire4, wire1, wire0);
  assign wire43 = ((!$signed(((wire41 ? wire1 : wire3) ?
                      (~^wire3) : $unsigned(wire41)))) ~^ $unsigned((-(^~wire3[(2'h3):(2'h2)]))));
  assign wire44 = $unsigned($signed($unsigned({(wire41 * wire0)})));
  module45 #() modinst124 (.clk(clk), .wire48(wire41), .wire46(wire2), .y(wire123), .wire49(wire4), .wire47(wire3));
  assign wire125 = (&wire4);
  assign wire126 = ((!((~|wire41[(3'h4):(2'h3)]) ?
                           ((wire123 <= wire4) > (!wire44)) : wire44[(1'h0):(1'h0)])) ?
                       $signed($unsigned(((+wire41) | (wire0 == wire41)))) : (($signed(wire43[(3'h4):(1'h0)]) - wire41) - wire41[(2'h3):(1'h0)]));
  assign wire127 = $unsigned((wire44 & $signed((+((8'hb0) ?
                       wire126 : (8'ha2))))));
  assign wire128 = wire41;
endmodule

module module45  (y, clk, wire46, wire47, wire48, wire49);
  output wire [(32'h1fd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire46;
  input wire signed [(5'h13):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire48;
  input wire signed [(4'he):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire122;
  wire [(3'h5):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire120;
  reg [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  assign y = {wire122,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire61,
                 wire62,
                 wire120,
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
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg51,
                 reg50,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg50 <= (((($unsigned(wire48) ?
              $signed(wire49) : $unsigned(wire47)) >> wire48) || (~wire46)) ?
          $signed(wire46) : wire48);
      reg51 <= wire46;
    end
  assign wire52 = ($signed((~&($unsigned((8'hb9)) ?
                      (wire49 - wire49) : (reg50 >> reg50)))) >> $signed((~&$unsigned((wire48 || wire49)))));
  assign wire53 = (($unsigned((&(7'h42))) <<< wire47) ?
                      wire46 : reg50[(4'h9):(4'h9)]);
  assign wire54 = wire48;
  assign wire55 = ((7'h40) & $signed(wire48));
  always
    @(posedge clk) begin
      reg56 <= reg51[(2'h2):(1'h0)];
      reg57 <= reg50;
      reg58 <= ({wire54,
              ({wire52[(2'h2):(1'h1)]} ?
                  (((8'haf) | wire52) || $unsigned(wire52)) : wire52)} ?
          $signed(((&{wire55}) ?
              $unsigned($signed(wire46)) : {wire47})) : $signed(((~&wire52[(3'h5):(2'h3)]) ?
              $signed({wire55, wire55}) : wire54)));
      reg59 <= ($unsigned(($signed(reg56[(4'ha):(3'h6)]) + ((wire46 >>> wire46) ?
          $signed(wire46) : (wire46 ? wire47 : reg50)))) > (8'hae));
      reg60 <= wire48[(1'h1):(1'h0)];
    end
  assign wire61 = wire54[(3'h5):(1'h0)];
  assign wire62 = reg59[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      if (wire55)
        begin
          reg63 <= ({$unsigned(wire47[(1'h1):(1'h1)])} >> reg60[(2'h2):(1'h0)]);
          if (wire46)
            begin
              reg64 <= {wire47[(2'h2):(2'h2)]};
            end
          else
            begin
              reg64 <= (((((^~reg56) ?
                      (wire54 ?
                          reg50 : wire46) : wire61[(1'h1):(1'h0)]) & $signed($unsigned(wire46))) ?
                  (8'hab) : (&wire49[(4'h9):(2'h2)])) != $signed($unsigned($unsigned({reg56}))));
              reg65 <= {((!(8'h9e)) ?
                      {{(wire52 ? wire55 : reg59),
                              {wire52, wire62}}} : (!wire48))};
              reg66 <= $signed($signed(wire48));
            end
          reg67 <= $unsigned({{((reg57 >> reg65) - reg50),
                  {(wire62 >>> reg57)}}});
          if (($signed(($unsigned((reg59 != wire55)) <= $signed({wire54}))) >= ((wire55[(3'h4):(1'h0)] << reg63) > {(reg51[(4'hb):(4'ha)] ^~ reg51[(1'h0):(1'h0)]),
              ({(8'hb5)} << ((8'hb3) ^~ reg59))})))
            begin
              reg68 <= $signed(reg58[(4'hf):(4'ha)]);
              reg69 <= $signed(((+$unsigned($unsigned((8'haa)))) & wire47[(1'h1):(1'h0)]));
              reg70 <= {$unsigned((8'had))};
              reg71 <= reg59[(5'h12):(2'h3)];
              reg72 <= (&$unsigned((8'hb2)));
            end
          else
            begin
              reg68 <= $signed($signed(wire61[(1'h0):(1'h0)]));
            end
          reg73 <= wire48[(4'h8):(1'h0)];
        end
      else
        begin
          reg63 <= $unsigned((wire46 ?
              {({(8'hb9)} ?
                      (reg57 ? reg59 : reg58) : wire46)} : (!($signed(reg51) ?
                  (7'h40) : wire48))));
          if (wire62[(5'h13):(4'h8)])
            begin
              reg64 <= $unsigned(reg57);
              reg65 <= (8'hb5);
              reg66 <= ((~|wire48[(3'h7):(3'h5)]) ?
                  $signed($unsigned($signed(reg67))) : (wire61 ?
                      $signed(($unsigned(wire54) ?
                          $signed(reg56) : (~|(8'ha1)))) : $signed(reg63)));
              reg67 <= $unsigned($unsigned((^~{$unsigned(wire54),
                  $signed(wire47)})));
              reg68 <= (wire54 + $unsigned($signed(wire61[(1'h1):(1'h1)])));
            end
          else
            begin
              reg64 <= {reg69[(4'h8):(1'h1)]};
            end
          reg69 <= (reg70[(1'h1):(1'h1)] ? reg63[(4'h9):(4'h9)] : (8'hb3));
        end
      if ((((({reg64, (8'ha7)} << (-reg58)) ?
                  ((~reg51) - $unsigned(wire55)) : ($signed((7'h40)) ?
                      (~(8'hb6)) : $signed(reg65))) ?
              {wire62, reg66} : (wire54 < reg51[(4'ha):(2'h2)])) ?
          ((8'ha2) + ($signed((reg72 | reg65)) ?
              reg50 : wire55[(3'h5):(2'h3)])) : (reg65 ?
              {reg72[(3'h5):(3'h5)], {(reg58 >= reg71), reg66}} : (reg51 ?
                  reg65 : wire47))))
        begin
          reg74 <= $signed((($unsigned($signed(reg66)) ?
              wire52[(1'h0):(1'h0)] : reg50) != ($unsigned((reg56 && reg59)) ?
              (wire49 ?
                  (reg73 ? (8'h9c) : reg60) : reg68[(3'h5):(3'h4)]) : {(!reg50),
                  $signed((8'hb8))})));
          reg75 <= ((8'hb4) == reg72[(1'h1):(1'h0)]);
        end
      else
        begin
          reg74 <= $signed($signed($unsigned((&(8'h9c)))));
          reg75 <= (wire48 ?
              $unsigned($signed({((8'hae) ? wire54 : reg67),
                  {reg58}})) : $signed(($unsigned({reg72}) <<< (wire54[(2'h2):(1'h1)] ?
                  $signed(reg70) : $unsigned(reg70)))));
          reg76 <= reg69[(4'he):(3'h5)];
          if ((~&$unsigned(reg68[(1'h0):(1'h0)])))
            begin
              reg77 <= (~((reg63 | ((~^wire46) ?
                  (reg59 ?
                      (8'hb5) : reg63) : reg70[(2'h2):(2'h2)])) >>> reg71));
              reg78 <= (~^(($signed(wire62) <= $signed(reg66)) >> ({$signed(reg71),
                      (wire61 >= reg57)} ?
                  (~^$signed(wire49)) : wire49[(4'he):(3'h4)])));
              reg79 <= (^($unsigned((reg60[(3'h4):(1'h0)] ?
                      {wire48, reg68} : (wire62 == wire55))) ?
                  $unsigned(reg67) : $unsigned((reg57[(4'hc):(4'hb)] ?
                      $unsigned(wire53) : (~^reg64)))));
            end
          else
            begin
              reg77 <= ((($signed((8'ha1)) <<< {$unsigned(wire53)}) ^ $signed((~^(wire52 || reg78)))) <= reg74[(3'h7):(2'h3)]);
              reg78 <= ($signed(wire48) <= reg51[(4'ha):(1'h1)]);
              reg79 <= ($signed(({(wire46 ~^ reg72), (wire61 > reg76)} ?
                      wire47[(1'h0):(1'h0)] : (~^$unsigned(reg72)))) ?
                  (($signed((reg76 ? reg72 : reg76)) >>> reg68) ?
                      reg76[(1'h1):(1'h0)] : $signed($signed((8'h9e)))) : $unsigned($unsigned(((reg70 + reg50) - reg75))));
            end
        end
      reg80 <= (8'hb8);
      if (reg58[(4'hd):(4'h9)])
        begin
          reg81 <= ((~^(reg75[(1'h1):(1'h1)] << (reg60[(1'h0):(1'h0)] ?
              reg56[(3'h5):(2'h3)] : wire54[(4'hb):(3'h5)]))) * $unsigned((($unsigned((8'ha9)) ?
                  $unsigned(wire55) : reg71[(4'h8):(3'h5)]) ?
              $unsigned((reg76 * wire47)) : reg74[(4'hb):(4'ha)])));
          reg82 <= (wire49[(4'hd):(4'ha)] ?
              ($signed((8'ha8)) == $signed((|$signed(wire53)))) : (~$unsigned((+$signed(reg78)))));
          if (((~((8'ha6) ?
              (wire54[(4'hc):(3'h7)] >>> $signed((8'hab))) : $signed((reg75 ?
                  reg81 : reg69)))) <<< $signed((reg71[(2'h3):(1'h0)] ?
              $signed(reg56) : ({reg51} ?
                  reg81[(1'h1):(1'h1)] : (wire52 ? reg63 : reg70))))))
            begin
              reg83 <= (~|reg60[(1'h0):(1'h0)]);
              reg84 <= (({$unsigned((reg51 ?
                      (8'ha2) : reg79))} > ((&$signed(reg56)) + ($unsigned((8'hab)) ?
                  (|wire47) : reg58))) - ((reg60[(3'h4):(3'h4)] ?
                  (wire49 ^ reg58[(4'ha):(4'h8)]) : {{wire61},
                      (7'h41)}) << $signed((reg82 ? (~reg80) : wire61))));
              reg85 <= (~&reg51);
              reg86 <= reg73;
            end
          else
            begin
              reg83 <= (((^~reg71[(3'h6):(3'h6)]) > ((wire62[(4'hd):(4'hb)] >>> $signed(reg75)) ?
                      (-(reg75 | reg68)) : ($signed(wire55) ?
                          reg58 : $unsigned(wire47)))) ?
                  $signed($unsigned(($signed(reg81) ?
                      reg68[(3'h7):(1'h1)] : (~^reg59)))) : reg68[(1'h1):(1'h1)]);
            end
          reg87 <= $unsigned({(+(8'ha0))});
        end
      else
        begin
          if ($signed((~|$unsigned($signed((+wire55))))))
            begin
              reg81 <= (reg79[(1'h1):(1'h1)] ?
                  (($signed((-reg77)) ?
                      (-$signed(reg60)) : ((reg74 | wire55) ^ $unsigned(wire47))) ~^ wire49) : $signed($unsigned({reg81})));
              reg82 <= reg50[(4'hf):(4'hf)];
              reg83 <= (reg82 << {{{(^reg79), {reg78, reg80}}}});
              reg84 <= $unsigned($signed(($unsigned((+reg59)) << reg60)));
            end
          else
            begin
              reg81 <= (((reg77 <<< ((^wire52) ?
                      $signed(reg66) : (wire61 > reg84))) ?
                  reg67 : $signed($unsigned($signed(reg56)))) >>> $unsigned((~{reg65[(2'h3):(2'h2)]})));
              reg82 <= reg74;
              reg83 <= (8'hae);
            end
          reg85 <= reg86[(4'h9):(4'h9)];
          if ($unsigned((^reg80)))
            begin
              reg86 <= (reg76 >> (($unsigned(wire46) <<< reg63[(4'hb):(4'hb)]) >>> ($signed(reg72[(4'h8):(1'h0)]) > {reg67[(5'h13):(4'hf)]})));
              reg87 <= ((^~reg81[(1'h0):(1'h0)]) | reg86);
            end
          else
            begin
              reg86 <= ($unsigned(wire49[(3'h4):(1'h1)]) ?
                  (wire62 <<< $unsigned($unsigned({reg76,
                      reg81}))) : wire48[(2'h3):(1'h1)]);
              reg87 <= (wire61[(1'h1):(1'h1)] << $signed(($unsigned(reg56) ?
                  reg63 : wire55[(3'h5):(1'h0)])));
            end
          reg88 <= reg79[(1'h1):(1'h1)];
          reg89 <= (reg76[(3'h4):(1'h0)] ? {reg74} : $signed(reg75));
        end
      reg90 <= {(|reg64),
          ((((8'h9f) == (reg76 ? wire52 : wire52)) <<< reg57) ?
              (($unsigned(reg59) >>> $signed((8'had))) < wire52) : ($unsigned($signed(reg68)) && {reg59[(5'h10):(1'h0)]}))};
    end
  module91 #() modinst121 (wire120, clk, wire47, reg51, reg72, reg80, reg81);
  assign wire122 = ($unsigned(reg89) ^ (reg56 ?
                       reg84 : ((-(reg69 ? reg82 : (8'hb8))) ?
                           ((~^reg74) & (~reg67)) : (^$unsigned((8'hb1))))));
endmodule

module module5
#(parameter param40 = ((-((~|((8'h9e) ? (8'ha4) : (8'hbc))) ? (((8'ha6) << (7'h40)) ? (^(8'hb4)) : ((8'hb5) ? (8'hbb) : (8'hbe))) : {((8'ha9) ? (8'hb2) : (8'hb5))})) ? ((|{((8'ha7) ? (8'hb6) : (8'hb8))}) ? {(((8'h9f) ? (8'hab) : (8'ha3)) ? ((8'ha5) >> (8'hb4)) : (|(7'h43)))} : ({((8'hb4) ? (8'ha6) : (8'ha4))} ? ((^~(8'hac)) > {(7'h40)}) : (((8'hb1) ? (8'hba) : (8'hbe)) ? {(8'hae)} : {(8'hb7)}))) : (({((8'ha5) < (8'h9e))} * (((8'ha6) | (8'h9d)) ? ((8'h9e) ? (8'hbc) : (8'hbe)) : {(8'hb3)})) - ((|(^~(8'ha0))) & (((8'haa) - (8'hb4)) ? ((8'ha8) ? (7'h42) : (7'h40)) : ((8'hb0) ? (8'ha9) : (8'hbb)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire10;
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  assign y = {wire34,
                 wire26,
                 wire25,
                 wire24,
                 wire21,
                 wire10,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg23,
                 reg22,
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
  assign wire10 = (^~(~(7'h42)));
  always
    @(posedge clk) begin
      reg11 <= (wire7[(5'h14):(5'h11)] ?
          (|(~|wire6[(3'h4):(1'h1)])) : $signed($unsigned($signed(wire9))));
      reg12 <= $unsigned(((wire9 ? (8'hb9) : $signed($signed(reg11))) ?
          wire8 : ($signed($signed(wire6)) ^ wire8)));
      reg13 <= reg12;
      if (reg13[(4'h8):(3'h7)])
        begin
          reg14 <= ($unsigned((wire7 ? wire9 : wire9)) != wire9);
          reg15 <= (+($signed({(~|wire6)}) ~^ $unsigned($signed($unsigned(reg11)))));
          reg16 <= wire6[(3'h7):(1'h0)];
        end
      else
        begin
          reg14 <= (8'hbc);
          reg15 <= reg11;
          if (wire10[(4'hc):(3'h4)])
            begin
              reg16 <= (reg15[(3'h5):(2'h3)] ^ wire6);
              reg17 <= reg12[(4'hc):(4'hb)];
              reg18 <= $unsigned($signed(wire10));
              reg19 <= (^~((~((wire9 ? reg15 : reg15) ?
                      $signed(wire10) : wire9)) ?
                  $signed(wire8[(2'h3):(2'h2)]) : wire9));
              reg20 <= ({(^reg18[(2'h2):(1'h0)])} & (~$signed((((8'ha7) ?
                      wire6 : reg13) ?
                  {reg16} : $unsigned(wire7)))));
            end
          else
            begin
              reg16 <= (~|$unsigned((~^$unsigned(reg16))));
              reg17 <= (!((!reg15) - {$unsigned((reg16 ^ reg20)), reg12}));
            end
        end
    end
  assign wire21 = (!$signed(((^~(reg11 ? reg15 : (8'h9f))) ^~ (8'h9e))));
  always
    @(posedge clk) begin
      reg22 <= wire21;
      reg23 <= (&reg19);
    end
  assign wire24 = (^reg14);
  assign wire25 = {$signed((~&{$signed(reg13), (&reg22)})),
                      (^(($signed(wire7) ? $signed(reg19) : (wire24 ~^ reg12)) ?
                          wire10 : reg23))};
  assign wire26 = ((8'hae) ?
                      (wire25 ?
                          reg14[(3'h5):(3'h4)] : $unsigned($unsigned(wire10))) : ($unsigned($signed($signed(reg20))) > {reg14}));
  always
    @(posedge clk) begin
      reg27 <= reg14[(3'h4):(1'h1)];
      if (($signed($unsigned($signed($signed(wire24)))) ?
          ((|(reg11[(2'h2):(1'h1)] + (!wire8))) & {$unsigned({reg20, wire26}),
              reg17}) : (~&{wire24})))
        begin
          if ($unsigned(reg20))
            begin
              reg28 <= (({($signed(reg17) ? $unsigned(reg16) : $signed(wire25)),
                          $unsigned({wire24})} ?
                      (8'hbb) : {(^~(reg22 >= reg23)), reg15[(3'h7):(1'h0)]}) ?
                  $signed($signed(($unsigned(wire8) ?
                      wire7 : (reg14 ^ wire25)))) : reg12[(4'ha):(3'h4)]);
              reg29 <= $signed(wire9);
              reg30 <= (({((~|wire6) - $signed(wire25))} ?
                  wire10 : (~|{wire7[(2'h2):(1'h1)]})) == ($signed($signed((reg28 || reg27))) ?
                  reg12 : $unsigned($unsigned($unsigned(reg18)))));
              reg31 <= ((^reg15) + ((wire25[(2'h2):(2'h2)] >> ($unsigned(reg17) ?
                  $signed(wire24) : (8'hb1))) ^ $unsigned((~|(wire21 & reg17)))));
            end
          else
            begin
              reg28 <= (~&reg13);
            end
        end
      else
        begin
          if ({reg22[(3'h6):(2'h3)]})
            begin
              reg28 <= (8'ha4);
              reg29 <= {reg28,
                  $unsigned(($unsigned($unsigned(wire25)) & (reg16 << reg13)))};
            end
          else
            begin
              reg28 <= (reg12[(4'h8):(3'h5)] ?
                  reg23 : $signed((~|(reg28 <= reg29))));
              reg29 <= ($signed(($signed(((7'h41) & (8'h9e))) ?
                      $unsigned(((8'hba) ?
                          wire6 : wire9)) : reg29[(1'h1):(1'h1)])) ?
                  (|($unsigned((&wire6)) ^ reg28)) : reg31);
              reg30 <= $signed($unsigned(($unsigned((8'hba)) ?
                  wire24[(4'h8):(3'h6)] : ((wire9 ? reg11 : reg27) ?
                      (reg23 ? (8'ha6) : reg17) : {reg13, wire21}))));
              reg31 <= (-reg13[(2'h3):(1'h0)]);
              reg32 <= reg27;
            end
          reg33 <= $signed({$unsigned(((reg12 ? wire10 : reg28) ?
                  reg23 : (reg32 + (8'hb2))))});
        end
    end
  assign wire34 = (|$signed((|reg20)));
  always
    @(posedge clk) begin
      reg35 <= {({({reg27} ? wire7[(4'he):(2'h2)] : (wire25 == (8'h9d))),
                  {reg27}} ?
              wire9[(1'h0):(1'h0)] : (((wire10 && wire7) >>> $signed(reg15)) ?
                  (~|(wire24 ? reg13 : reg18)) : (+$unsigned((8'hb1)))))};
      reg36 <= $signed((reg14[(3'h4):(2'h3)] ?
          ($unsigned((~wire34)) ?
              (~|(!wire21)) : ((reg33 || (7'h41)) ?
                  $signed(wire10) : (reg16 ?
                      (8'hbc) : reg20))) : ((&$signed(reg35)) ~^ reg17[(2'h2):(1'h1)])));
      reg37 <= (reg23 <= wire21);
      reg38 <= (~((-((reg30 ? reg29 : reg30) ?
          {reg19, wire26} : reg20[(3'h4):(1'h0)])) >= $unsigned({reg11})));
      reg39 <= (&reg17[(3'h7):(3'h7)]);
    end
endmodule

module module91  (y, clk, wire96, wire95, wire94, wire93, wire92);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire96;
  input wire signed [(5'h15):(1'h0)] wire95;
  input wire signed [(4'h8):(1'h0)] wire94;
  input wire [(3'h4):(1'h0)] wire93;
  input wire [(3'h5):(1'h0)] wire92;
  wire [(4'h8):(1'h0)] wire119;
  wire signed [(4'hb):(1'h0)] wire118;
  wire signed [(4'ha):(1'h0)] wire117;
  wire signed [(5'h13):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire115;
  wire [(4'h9):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire [(5'h10):(1'h0)] wire112;
  wire signed [(5'h10):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire101;
  wire [(5'h12):(1'h0)] wire100;
  wire signed [(3'h4):(1'h0)] wire99;
  wire [(4'h8):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire105,
                 wire104,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire97 = wire95[(5'h15):(4'he)];
  assign wire98 = wire96[(3'h5):(1'h0)];
  assign wire99 = wire96[(5'h11):(1'h0)];
  assign wire100 = wire98;
  assign wire101 = $unsigned($signed(wire97));
  always
    @(posedge clk) begin
      reg102 <= $signed((&$unsigned(wire92)));
      reg103 <= (-$signed((wire100 ?
          $signed($unsigned(wire92)) : $unsigned((reg102 << wire92)))));
    end
  assign wire104 = (reg102 ? {(8'haf)} : (8'ha2));
  assign wire105 = wire97[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      if ($signed(wire92[(1'h0):(1'h0)]))
        begin
          if (wire93[(3'h4):(2'h2)])
            begin
              reg106 <= (~&$signed((wire98[(1'h0):(1'h0)] ^ {(wire99 ?
                      wire94 : reg103),
                  {wire94}})));
              reg107 <= $unsigned(reg106);
            end
          else
            begin
              reg106 <= $unsigned($unsigned($signed($unsigned((wire101 ?
                  wire94 : reg102)))));
              reg107 <= wire93;
              reg108 <= wire104[(3'h4):(1'h0)];
            end
          reg109 <= $signed(({$signed((8'ha5)), $signed((+reg108))} ?
              (wire96 || $unsigned($signed((8'hbc)))) : $signed((!(wire105 > wire104)))));
        end
      else
        begin
          reg106 <= wire98;
          reg107 <= ($unsigned(reg103[(2'h2):(1'h0)]) ~^ (~|{$signed((wire98 ~^ (8'hbc))),
              $unsigned((reg108 ? reg103 : reg103))}));
        end
      reg110 <= (wire93[(2'h2):(2'h2)] ?
          (wire95[(4'hf):(4'hf)] && {(8'hae),
              (8'hae)}) : wire95[(1'h1):(1'h0)]);
      reg111 <= $signed($signed((reg110[(3'h4):(2'h2)] || ((reg102 > reg108) ?
          $unsigned((8'ha1)) : $unsigned(reg110)))));
    end
  assign wire112 = ($unsigned((($signed(wire104) ~^ (^~wire97)) <<< reg107)) ?
                       (!$signed((+(&wire99)))) : {(^{reg102[(3'h4):(2'h3)]})});
  assign wire113 = $signed(($signed(wire99) ?
                       $signed($unsigned((^wire112))) : $unsigned((wire112 ?
                           (&reg102) : (~&wire98)))));
  assign wire114 = $unsigned((wire96[(4'he):(1'h1)] ?
                       wire94[(2'h2):(1'h0)] : ((reg108 ?
                               (~|wire98) : (wire113 | wire105)) ?
                           {(|wire98),
                               reg107[(1'h1):(1'h1)]} : wire95[(2'h3):(2'h3)])));
  assign wire115 = {wire100};
  assign wire116 = (^(((((8'ha3) ? wire112 : reg107) >>> (wire100 ?
                               wire105 : wire94)) ?
                           {$signed(wire114)} : ((~wire98) ?
                               wire95[(3'h5):(2'h2)] : $unsigned(wire98))) ?
                       $unsigned(reg108) : wire98[(2'h3):(2'h3)]));
  assign wire117 = $unsigned($signed(($signed((reg108 ? (8'hb0) : wire104)) ?
                       ((^reg109) ? wire114 : wire93) : (((8'hb6) + wire98) ?
                           (reg103 ? reg106 : wire93) : (7'h40)))));
  assign wire118 = reg108;
  assign wire119 = reg110;
endmodule
