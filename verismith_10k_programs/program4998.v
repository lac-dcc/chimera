module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1bf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire110;
  wire [(3'h4):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire82;
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg [(2'h2):(1'h0)] reg91 = (1'h0);
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  assign y = {wire110,
                 wire96,
                 wire84,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire82,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
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
                 (1'h0)};
  assign wire5 = $signed({wire3[(2'h2):(1'h1)], wire3[(1'h1):(1'h1)]});
  assign wire6 = $signed((wire2 & (wire0 ?
                     $unsigned((!wire2)) : ((wire2 << wire5) ^~ wire4))));
  assign wire7 = $signed($signed($unsigned($signed($signed(wire6)))));
  assign wire8 = (^~wire3);
  assign wire9 = (8'hb1);
  assign wire10 = $signed($signed((($signed(wire1) ?
                      (wire5 ^ wire1) : $signed(wire0)) >>> wire1[(1'h0):(1'h0)])));
  assign wire11 = ($signed($signed($signed((wire3 ?
                      wire0 : wire10)))) ^ $signed(((~&$unsigned(wire10)) * (((8'hbc) ?
                      wire2 : wire6) >>> (^wire5)))));
  assign wire12 = wire8[(4'h8):(3'h5)];
  assign wire13 = (&wire11[(2'h2):(1'h0)]);
  module14 #() modinst83 (wire82, clk, wire10, wire0, wire12, wire4, wire9);
  assign wire84 = wire11;
  always
    @(posedge clk) begin
      if ($signed((~&$signed({(wire6 == wire84)}))))
        begin
          reg85 <= wire8[(1'h1):(1'h1)];
          reg86 <= $signed(wire7[(5'h15):(4'ha)]);
          if ($signed({(wire5[(4'h9):(3'h6)] ?
                  $unsigned($signed(wire2)) : wire7),
              wire11}))
            begin
              reg87 <= reg85[(4'ha):(3'h4)];
              reg88 <= (($unsigned((|(wire1 ?
                  wire1 : wire0))) + reg87[(3'h5):(3'h4)]) >= wire9[(3'h7):(1'h1)]);
              reg89 <= {(wire5[(4'h9):(1'h0)] | $signed($signed(wire2[(1'h1):(1'h0)])))};
              reg90 <= $signed($unsigned(($signed($signed(wire5)) <= $signed((reg88 <= wire11)))));
            end
          else
            begin
              reg87 <= (((((wire13 << reg85) ?
                      (wire4 ?
                          (8'ha2) : (8'hb6)) : $unsigned((8'haa))) < $signed((wire1 ?
                      (8'hb5) : reg88))) ?
                  wire6[(3'h5):(3'h4)] : $signed((~&$unsigned((8'ha8))))) >> $unsigned($signed(wire13)));
            end
          if (($signed(wire0[(5'h13):(5'h12)]) ^ $unsigned($unsigned($signed((wire2 ?
              wire9 : wire2))))))
            begin
              reg91 <= {$signed(wire2), wire8[(3'h6):(2'h3)]};
              reg92 <= {$signed($unsigned(((~&wire2) ?
                      $signed(wire10) : $signed(reg85)))),
                  ((~^wire82) ^ $signed($signed((!(8'hb9)))))};
              reg93 <= $signed(((8'hbf) | {{(wire7 ? (8'haa) : wire13)}}));
              reg94 <= (reg87[(2'h2):(2'h2)] != reg85);
              reg95 <= (8'hbc);
            end
          else
            begin
              reg91 <= $unsigned((7'h42));
            end
        end
      else
        begin
          reg85 <= $signed(wire10);
          reg86 <= (($signed($signed((^wire10))) & $signed(((&(8'hae)) ?
              wire1 : wire1))) != $signed(wire9));
          reg87 <= (reg95[(3'h4):(2'h2)] ?
              $unsigned($unsigned($unsigned((~|reg90)))) : $unsigned((+$signed(((7'h43) ?
                  (8'ha3) : (8'hbc))))));
          if (($unsigned((((~|reg92) | (wire13 ? reg86 : (8'had))) ?
                  ($unsigned(wire1) ?
                      (reg88 ?
                          (8'hb8) : wire10) : $unsigned(reg95)) : reg88[(3'h4):(1'h1)])) ?
              (&(8'ha9)) : wire4[(4'ha):(4'h8)]))
            begin
              reg88 <= ((8'ha2) ?
                  {wire7,
                      wire9[(4'hc):(4'ha)]} : (((8'hbd) < wire2[(1'h0):(1'h0)]) ?
                      {$unsigned(wire10)} : (8'h9f)));
            end
          else
            begin
              reg88 <= wire0;
            end
          if ($unsigned($unsigned(reg86[(4'h8):(3'h7)])))
            begin
              reg89 <= reg87[(3'h4):(1'h1)];
              reg90 <= wire8;
              reg91 <= wire5[(5'h12):(3'h6)];
              reg92 <= ((reg87[(1'h0):(1'h0)] ?
                      $signed($unsigned((wire11 == (8'hbd)))) : $signed($unsigned((wire1 & wire11)))) ?
                  $signed({(!(reg93 ^ (8'haa))),
                      wire7}) : {$unsigned($unsigned((wire84 ?
                          wire0 : (8'haf)))),
                      (wire2[(2'h3):(2'h3)] ~^ {$unsigned(reg95)})});
            end
          else
            begin
              reg89 <= {$signed((wire3[(3'h7):(3'h5)] ?
                      wire8 : reg95[(2'h3):(1'h0)])),
                  ((reg95[(4'hb):(2'h3)] ?
                          reg95[(3'h4):(3'h4)] : ((wire7 * wire12) ?
                              $signed((8'haa)) : wire7)) ?
                      wire9 : $signed(($signed(reg90) ?
                          (~&reg87) : wire13[(4'hc):(2'h3)])))};
              reg90 <= $signed({(~^wire3),
                  (($unsigned(wire9) + reg93[(3'h7):(3'h5)]) ?
                      ($unsigned((8'hb1)) & wire10) : $signed((wire84 & wire12)))});
              reg91 <= wire2[(2'h3):(2'h3)];
              reg92 <= $unsigned(reg89);
              reg93 <= ($signed((reg88[(2'h3):(1'h1)] == (wire3[(2'h2):(1'h0)] <= $unsigned((8'hb5))))) ?
                  reg85[(4'ha):(1'h1)] : ((($signed(wire1) ?
                      (~&wire1) : (&(8'haf))) >= reg85) << ($signed($signed((8'ha5))) - (~^$signed(reg86)))));
            end
        end
    end
  assign wire96 = wire3;
  always
    @(posedge clk) begin
      if ($unsigned(wire11))
        begin
          reg97 <= ($unsigned(wire5[(4'hf):(1'h0)]) <<< wire11);
          if ((^~wire84[(3'h6):(3'h5)]))
            begin
              reg98 <= (^$unsigned(wire5[(4'hc):(1'h0)]));
              reg99 <= (($unsigned($signed($unsigned(reg86))) + ($signed($signed(wire6)) | reg85)) <<< (^~$signed((wire8[(4'h8):(3'h6)] ?
                  wire10 : (-(7'h41))))));
              reg100 <= reg97;
              reg101 <= reg92;
            end
          else
            begin
              reg98 <= $unsigned($unsigned($unsigned(reg92[(4'h9):(4'h8)])));
            end
          reg102 <= (reg101 + ($signed($signed((wire82 > (7'h41)))) >= (reg100 > reg88[(1'h1):(1'h0)])));
          reg103 <= reg87[(3'h6):(2'h3)];
          if ((((8'haf) << {$unsigned({wire10,
                  wire1})}) <<< (wire7 * wire13[(3'h5):(3'h4)])))
            begin
              reg104 <= (&($signed($unsigned(reg93[(3'h7):(2'h2)])) ?
                  $signed((8'hba)) : wire13[(3'h7):(3'h6)]));
              reg105 <= wire7;
              reg106 <= ($unsigned(($signed($unsigned((8'h9e))) ?
                  ($signed(reg85) | reg95[(3'h7):(3'h5)]) : $signed($signed(wire4)))) != (^(($signed(reg87) ^~ (|(8'hb8))) ?
                  reg99[(3'h5):(2'h3)] : reg87[(3'h5):(2'h2)])));
              reg107 <= reg100;
              reg108 <= reg88;
            end
          else
            begin
              reg104 <= reg86[(4'h9):(3'h6)];
              reg105 <= $unsigned($unsigned(wire96[(2'h3):(1'h1)]));
              reg106 <= (|($unsigned($signed(wire82[(4'hd):(4'ha)])) ?
                  (reg104 == reg90[(1'h1):(1'h0)]) : $unsigned(reg102)));
              reg107 <= {$unsigned($signed(($unsigned(wire8) ?
                      (reg104 + reg93) : wire12)))};
            end
        end
      else
        begin
          reg97 <= ($unsigned(wire7) && $unsigned({reg106[(1'h0):(1'h0)],
              ((reg104 ? (8'had) : reg99) ? (8'hb8) : (reg100 >= reg99))}));
          reg98 <= $signed(reg88);
          if ((8'had))
            begin
              reg99 <= $unsigned($unsigned(reg102[(1'h1):(1'h1)]));
            end
          else
            begin
              reg99 <= {$signed(reg88), wire7};
              reg100 <= $signed($unsigned(($signed({wire96, reg86}) ?
                  $signed((~^reg92)) : ($signed(wire82) ?
                      (~reg93) : reg103[(4'he):(4'he)]))));
            end
        end
      reg109 <= ($signed(reg85) ?
          $signed((reg98[(3'h5):(1'h1)] ?
              $unsigned((wire9 ?
                  wire5 : wire82)) : $signed((~reg108)))) : (~reg92[(4'h8):(1'h0)]));
    end
  assign wire110 = ({(-reg99), reg95} ?
                       (~|$unsigned($unsigned(wire12))) : (reg101 ^ (wire7[(2'h2):(1'h1)] ^ reg94)));
endmodule

module module14  (y, clk, wire15, wire16, wire17, wire18, wire19);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire15;
  input wire [(5'h10):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire66;
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  assign y = {wire81,
                 wire71,
                 wire70,
                 wire66,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg69,
                 reg68,
                 (1'h0)};
  module20 #() modinst67 (wire66, clk, wire19, wire16, wire17, wire15, wire18);
  always
    @(posedge clk) begin
      reg68 <= ($unsigned((&wire19)) << $signed(((8'ha7) <<< (~&$unsigned(wire15)))));
      reg69 <= wire18[(1'h1):(1'h1)];
    end
  assign wire70 = (~(~&wire15[(3'h6):(1'h0)]));
  assign wire71 = ($signed((^~$signed(wire19[(1'h1):(1'h1)]))) ?
                      $unsigned((8'ha6)) : (&wire16));
  always
    @(posedge clk) begin
      reg72 <= $unsigned(($unsigned($unsigned(reg68[(2'h2):(1'h0)])) ?
          $signed(reg68[(3'h7):(3'h7)]) : $signed($unsigned(((8'hab) || reg69)))));
      reg73 <= (~^{wire70});
      if (reg73)
        begin
          if ($unsigned((^~{$unsigned(wire18)})))
            begin
              reg74 <= (wire17 | (($signed(reg73) ^ (~$signed(wire15))) ^ {(-(8'hb8)),
                  ((reg69 ? wire70 : wire66) <<< (wire16 ^ reg69))}));
              reg75 <= ($signed($signed(reg69[(1'h0):(1'h0)])) ?
                  (wire66[(1'h0):(1'h0)] ?
                      wire15 : wire19) : (wire70[(1'h1):(1'h0)] ^~ (+(~&wire18[(4'hc):(4'hb)]))));
            end
          else
            begin
              reg74 <= (^~(8'ha4));
              reg75 <= (wire66[(3'h4):(2'h3)] < (8'ha2));
              reg76 <= (!((^{(-reg72)}) ?
                  {((wire70 * reg75) << (-reg73))} : ((reg72[(2'h2):(1'h1)] ?
                      (|wire19) : wire18[(1'h0):(1'h0)]) >= ($unsigned((8'haf)) + ((8'haf) ~^ reg73)))));
            end
          reg77 <= $signed((wire18[(4'ha):(4'h9)] == ((((8'ha8) ?
                  reg72 : wire15) ?
              (wire18 ~^ reg76) : (+reg74)) & (~&reg74))));
          reg78 <= $signed({{$signed(wire66[(1'h0):(1'h0)]), wire16}});
          reg79 <= reg78[(3'h6):(2'h3)];
          if (wire18[(4'hc):(4'hc)])
            begin
              reg80 <= {(8'hb8)};
            end
          else
            begin
              reg80 <= $unsigned($unsigned(reg79[(2'h3):(1'h0)]));
            end
        end
      else
        begin
          reg74 <= $unsigned(reg79);
          if (wire17)
            begin
              reg75 <= $unsigned((reg73 != {$unsigned($signed((8'hbe)))}));
              reg76 <= (^$unsigned(reg72));
              reg77 <= ((^$unsigned((8'hb4))) <= (~|$unsigned(($unsigned(reg73) & $signed(wire70)))));
              reg78 <= $unsigned((((wire18 ? {wire71} : reg74[(3'h7):(1'h1)]) ?
                      reg72 : $unsigned($unsigned(reg80))) ?
                  (reg79 * ((8'hb2) ?
                      {wire16} : (~&reg68))) : ((reg68[(3'h4):(2'h3)] == {reg77}) ?
                      ($signed((8'hb7)) ?
                          $unsigned(reg68) : $unsigned(wire15)) : $signed((wire66 < reg80)))));
            end
          else
            begin
              reg75 <= {(((|$signed(reg69)) == ($unsigned(wire15) ^ reg69[(2'h2):(1'h0)])) <= $signed($signed(reg78)))};
              reg76 <= ($signed($unsigned(wire16[(3'h7):(3'h5)])) != reg76[(1'h1):(1'h1)]);
              reg77 <= (-($signed((reg76 - $signed(reg72))) >> wire70));
            end
          reg79 <= {(({reg73} & $unsigned({reg79})) ^ $signed(($signed(reg74) ?
                  reg75[(5'h10):(1'h0)] : $unsigned(reg72))))};
          reg80 <= $signed((((~$unsigned((8'hba))) ?
                  ((wire71 ?
                      reg80 : (8'hb6)) && wire70[(3'h6):(1'h0)]) : {$unsigned(reg76)}) ?
              $unsigned($unsigned($unsigned(reg74))) : wire70));
        end
    end
  assign wire81 = (&reg75);
endmodule

module module20
#(parameter param65 = (((8'ha3) + ((((8'hac) ? (7'h43) : (8'hab)) ? (~|(8'hbf)) : (^~(8'h9c))) & (((7'h41) >> (8'hb2)) ? {(8'h9d), (8'ha4)} : ((8'h9e) <= (8'hb3))))) < {(8'hb6)}))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h1bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire25;
  input wire [(3'h7):(1'h0)] wire24;
  input wire [(3'h6):(1'h0)] wire23;
  input wire signed [(4'h8):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire26;
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire54,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire39,
                 wire38,
                 wire37,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire26 = ($unsigned(({(^(8'hbc)), (^wire25)} ?
                          $signed($signed(wire23)) : $signed($unsigned(wire21)))) ?
                      (wire21[(2'h2):(1'h1)] == $signed($unsigned(wire22))) : (~^wire22));
  assign wire27 = wire23;
  assign wire28 = wire22[(2'h2):(2'h2)];
  assign wire29 = wire25;
  assign wire30 = wire23;
  always
    @(posedge clk) begin
      reg31 <= $signed($unsigned($unsigned(($unsigned(wire24) - (+(8'hb4))))));
      reg32 <= wire21;
      reg33 <= reg32;
      reg34 <= {(^(wire28 ? $unsigned($unsigned(wire22)) : (^~(~wire27)))),
          wire25};
    end
  always
    @(posedge clk) begin
      reg35 <= ($unsigned(($unsigned((wire28 ?
          wire21 : wire30)) - reg31)) && ((wire28[(1'h0):(1'h0)] == $signed((wire22 ?
          wire24 : wire30))) - (reg33 ?
          $unsigned($signed((8'hb5))) : $unsigned(wire30[(2'h2):(1'h1)]))));
      reg36 <= reg34[(3'h5):(2'h3)];
    end
  assign wire37 = $unsigned($signed(reg34[(3'h6):(2'h2)]));
  assign wire38 = $unsigned((~&wire26));
  assign wire39 = $signed((wire30 ?
                      wire22[(2'h2):(1'h0)] : $unsigned($signed(reg35[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      reg40 <= ((((8'ha9) ?
          ((7'h43) | (!reg35)) : {reg35[(4'he):(3'h5)]}) << wire27[(1'h0):(1'h0)]) < wire27[(5'h13):(1'h1)]);
      reg41 <= reg34[(3'h5):(3'h5)];
      reg42 <= ((!reg34[(4'he):(4'he)]) ?
          $signed($signed((wire28[(4'hc):(2'h2)] != (|wire24)))) : (&wire26[(1'h1):(1'h1)]));
      reg43 <= ((&(^~((wire22 ? wire23 : reg40) ^~ {reg36}))) ?
          (+(wire24[(1'h0):(1'h0)] > $signed((~&wire23)))) : {(((wire22 ?
                      (8'h9e) : wire28) < reg33) ?
                  $unsigned((reg34 ? reg41 : reg31)) : wire29),
              reg31[(3'h5):(2'h2)]});
    end
  assign wire44 = (^~(|wire24[(3'h4):(1'h0)]));
  assign wire45 = $signed(((wire37 ?
                          wire25[(3'h4):(1'h1)] : $unsigned((~|(8'hb6)))) ?
                      {reg35[(4'hd):(4'hc)]} : (|reg40)));
  assign wire46 = wire24[(1'h0):(1'h0)];
  assign wire47 = ((wire44[(2'h3):(1'h0)] <= $unsigned($unsigned($signed((8'hb1))))) ?
                      $unsigned((((reg42 ~^ reg36) ?
                              $unsigned(wire30) : wire23) ?
                          $unsigned(reg35) : $unsigned(wire45[(2'h2):(2'h2)]))) : {wire24[(2'h3):(2'h2)]});
  always
    @(posedge clk) begin
      if (wire44)
        begin
          reg48 <= wire24[(2'h3):(1'h1)];
          reg49 <= (-$unsigned((((wire27 > reg40) - wire30) == ($unsigned((8'h9f)) ?
              wire22[(2'h2):(1'h0)] : (wire26 ? reg31 : wire27)))));
          if (($unsigned(wire44) ?
              (&$unsigned($signed($signed(wire46)))) : reg41[(3'h7):(3'h5)]))
            begin
              reg50 <= (!($signed(($signed(reg43) << $signed(wire30))) ?
                  reg49 : (({wire39} > $unsigned(reg48)) | reg42)));
              reg51 <= (^~wire44[(1'h0):(1'h0)]);
            end
          else
            begin
              reg50 <= {reg41};
            end
          reg52 <= (~&reg32);
        end
      else
        begin
          if ((^~({({wire38, wire44} >> (wire30 && (8'hb7))),
                  $signed($unsigned(wire24))} ?
              wire37 : reg36)))
            begin
              reg48 <= ((wire27[(3'h4):(3'h4)] ?
                  reg31[(1'h1):(1'h0)] : (+$signed((reg33 - reg40)))) <= reg35);
              reg49 <= (wire28[(4'hb):(4'hb)] ?
                  (~&wire39[(3'h5):(1'h1)]) : wire21);
              reg50 <= (~&($unsigned($unsigned($unsigned((8'ha2)))) >>> wire30[(4'h8):(3'h6)]));
            end
          else
            begin
              reg48 <= (8'ha2);
              reg49 <= {(((~|$unsigned(wire25)) ?
                          ($signed((8'hae)) >= reg31) : (~$unsigned((8'ha7)))) ?
                      reg40 : wire21[(3'h4):(1'h1)])};
            end
        end
      reg53 <= wire30[(5'h13):(4'he)];
    end
  assign wire54 = (~(-$unsigned((wire27[(4'h8):(3'h4)] ?
                      (^(7'h41)) : $signed((8'hae))))));
  always
    @(posedge clk) begin
      if (wire30)
        begin
          reg55 <= reg32[(1'h1):(1'h0)];
          reg56 <= $unsigned(wire24);
          reg57 <= $signed(($unsigned(((reg34 ? wire26 : wire26) ?
                  (wire29 != reg31) : $signed(wire26))) ?
              $signed($unsigned($signed(wire38))) : reg49[(1'h1):(1'h0)]));
          reg58 <= reg35;
        end
      else
        begin
          reg55 <= {(({{wire26, reg52}} != (reg49[(1'h1):(1'h1)] ?
                      reg35[(4'h9):(3'h6)] : (wire24 ? (8'hb0) : wire30))) ?
                  (~&(wire23[(3'h6):(1'h0)] ?
                      (8'had) : $signed(wire47))) : (^(^~(reg36 ?
                      reg48 : wire30))))};
          if (((~|$unsigned(reg56[(3'h6):(1'h0)])) ?
              wire30 : (($unsigned(reg40) ? (+wire27) : reg56) ?
                  (($signed(wire25) ? ((8'hb3) ? reg57 : wire28) : (~&wire22)) ?
                      wire27 : wire21[(1'h0):(1'h0)]) : wire29[(4'hb):(3'h5)])))
            begin
              reg56 <= ($unsigned(wire54) ?
                  (~&(((+reg52) | (&wire22)) << {(+reg55)})) : ((&($unsigned(wire29) ?
                      $signed(reg34) : $signed(wire27))) < $unsigned(($signed(wire47) * $unsigned(wire25)))));
              reg57 <= $signed($unsigned((reg50[(1'h0):(1'h0)] ?
                  wire27 : $signed(reg48[(2'h2):(1'h1)]))));
              reg58 <= reg58[(4'ha):(3'h7)];
            end
          else
            begin
              reg56 <= $signed(wire45);
              reg57 <= wire26;
              reg58 <= (-(reg33 + (~^($unsigned((8'ha2)) ?
                  {(8'ha3), wire39} : {wire39, wire26}))));
            end
          if (reg42[(1'h0):(1'h0)])
            begin
              reg59 <= {{reg49[(3'h4):(1'h1)],
                      $unsigned($unsigned((&(7'h40))))}};
              reg60 <= (reg56 ?
                  (((~$signed(reg42)) < {(reg40 && reg55)}) == $signed(((reg53 | (8'ha1)) <<< (!reg49)))) : (reg59[(3'h4):(1'h1)] ?
                      $unsigned($unsigned({reg59, (8'hac)})) : reg33));
              reg61 <= {($unsigned(((~|(8'hbf)) ?
                          reg58[(4'hb):(2'h2)] : reg60[(1'h1):(1'h1)])) ?
                      $signed($signed($unsigned(reg40))) : reg32[(2'h3):(1'h1)])};
              reg62 <= $unsigned(wire26[(1'h0):(1'h0)]);
            end
          else
            begin
              reg59 <= reg36[(4'hc):(2'h2)];
              reg60 <= $unsigned((|(((reg53 ? reg58 : reg52) ?
                  wire28[(4'hf):(3'h7)] : $signed((8'hb0))) < $signed({(8'h9e),
                  wire22}))));
              reg61 <= $unsigned($signed(reg40));
              reg62 <= ($signed(((wire37[(1'h0):(1'h0)] ?
                  ((8'hb0) | reg58) : (reg41 >= reg51)) || {$unsigned(wire27),
                  (wire54 ^ reg57)})) | reg41);
            end
        end
    end
  assign wire63 = (~$signed(reg49[(1'h0):(1'h0)]));
  assign wire64 = ({wire29} ? (8'hb8) : $signed($signed((~|(|wire27)))));
endmodule
