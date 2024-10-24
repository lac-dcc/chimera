module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire125;
  wire [(5'h11):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire123;
  wire [(4'ha):(1'h0)] wire120;
  wire signed [(2'h3):(1'h0)] wire119;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire117;
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire120,
                 wire119,
                 wire18,
                 wire19,
                 wire23,
                 wire117,
                 reg122,
                 reg121,
                 reg22,
                 reg21,
                 reg20,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((&wire0))
        begin
          if ({wire1[(1'h1):(1'h0)], wire1})
            begin
              reg5 <= ({{$signed(wire3[(4'hd):(3'h5)])},
                  {(~&(~|wire4)),
                      $unsigned($unsigned(wire2))}} >> (wire4 >>> wire0));
              reg6 <= wire4;
              reg7 <= {$unsigned((~reg5)), wire3[(4'h9):(4'h9)]};
            end
          else
            begin
              reg5 <= (wire1[(3'h6):(2'h2)] == ($signed((wire1[(3'h7):(2'h3)] ^ $signed(wire1))) << $unsigned(reg6)));
              reg6 <= (|({$signed((8'hae))} + $unsigned((8'hb1))));
              reg7 <= ($unsigned(wire2[(2'h3):(2'h3)]) ?
                  (!reg6[(1'h0):(1'h0)]) : wire0);
            end
          if ({({wire3} ?
                  reg5[(2'h2):(1'h0)] : $signed($unsigned($unsigned(wire2)))),
              ($unsigned($signed(wire4)) ?
                  ((+(~&(8'hb8))) ?
                      wire0 : (^~wire0)) : {$signed((wire4 <= reg7))})})
            begin
              reg8 <= reg5;
            end
          else
            begin
              reg8 <= $unsigned(((&$unsigned((reg7 * wire0))) >> $unsigned($unsigned($signed(reg6)))));
              reg9 <= wire3;
              reg10 <= (~($signed({(~&reg7)}) != wire1));
            end
        end
      else
        begin
          reg5 <= (($signed($signed((reg8 ? wire2 : wire2))) & reg6) ?
              reg10 : wire4);
          reg6 <= $signed((8'ha7));
          if ($unsigned($unsigned((^(8'hb1)))))
            begin
              reg7 <= {wire0};
              reg8 <= (({($signed(wire2) ?
                      ((8'h9f) ? reg8 : wire2) : (&(8'ha5))),
                  reg10[(3'h5):(3'h5)]} >>> (!$unsigned($unsigned(reg10)))) >= ((($signed(reg10) ?
                      ((8'h9e) >>> reg7) : wire0[(3'h6):(3'h5)]) <= wire0[(3'h5):(3'h4)]) ?
                  (wire2 > ($signed(wire2) << (wire4 > (8'hae)))) : $signed((((8'ha3) ?
                      reg10 : reg7) != $signed(reg10)))));
              reg9 <= ((-(((~wire0) ?
                      (wire4 ? wire1 : reg10) : $signed(reg7)) >= (^(wire0 ?
                      reg6 : (8'haa))))) ?
                  $unsigned({((reg9 ? reg6 : wire2) - wire1),
                      (^(^(8'ha6)))}) : ((~(reg8[(4'hf):(4'hf)] ?
                      reg8 : reg7[(4'h8):(4'h8)])) || ($unsigned(wire3[(4'hb):(3'h6)]) ?
                      reg6 : (wire0 ? (~wire4) : $unsigned(reg9)))));
              reg10 <= (!wire3[(1'h0):(1'h0)]);
            end
          else
            begin
              reg7 <= reg7[(4'hc):(2'h3)];
              reg8 <= reg7[(2'h3):(1'h1)];
              reg9 <= wire1;
              reg10 <= reg6;
            end
        end
      if ((!reg5))
        begin
          reg11 <= $signed(($unsigned((^~(reg6 ? wire1 : reg8))) < reg9));
          reg12 <= {$signed($unsigned((-(~^reg5)))),
              {($unsigned(wire1[(3'h6):(2'h2)]) ?
                      $signed((reg11 ~^ reg8)) : wire4)}};
          if (wire1[(3'h4):(3'h4)])
            begin
              reg13 <= ({(!$unsigned((|wire2))), reg12} ?
                  $unsigned((|{{reg12}, reg6})) : reg5);
              reg14 <= $signed(($signed($signed(reg11[(2'h2):(2'h2)])) <= $signed($unsigned($signed((8'hbd))))));
              reg15 <= (~^((+$unsigned($signed(reg14))) ?
                  reg5[(3'h5):(1'h0)] : (~reg5[(2'h2):(1'h0)])));
            end
          else
            begin
              reg13 <= ($signed({wire4}) ? reg7 : wire1);
            end
          reg16 <= ($unsigned({(^~(reg5 ?
                  (8'hbe) : reg10))}) | wire3[(3'h4):(1'h0)]);
        end
      else
        begin
          reg11 <= $signed((~^{(~|$unsigned(reg12)),
              $unsigned(wire1[(3'h7):(3'h4)])}));
          reg12 <= (wire2[(2'h3):(2'h3)] ^~ wire0);
          reg13 <= ((~|{({reg7, reg7} * (+reg10)),
                  ($unsigned(reg6) != (&wire4))}) ?
              reg16[(3'h4):(2'h3)] : wire2[(2'h2):(1'h0)]);
        end
      reg17 <= (-wire0);
    end
  assign wire18 = reg10;
  assign wire19 = reg14[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg20 <= $signed((7'h43));
      reg21 <= $signed(((|reg14[(4'h8):(3'h7)]) ?
          ($unsigned({wire19, (8'haa)}) ^~ {reg8,
              (reg13 ? (8'ha5) : reg7)}) : (&reg6[(3'h7):(3'h6)])));
      reg22 <= (!((8'ha3) ?
          (!$signed($unsigned(reg7))) : reg14[(3'h5):(2'h3)]));
    end
  assign wire23 = $unsigned(wire18);
  module24 #() modinst118 (.wire29(reg17), .wire28(wire18), .wire27(reg16), .clk(clk), .y(wire117), .wire26(reg6), .wire25(reg5));
  assign wire119 = (8'ha8);
  assign wire120 = (reg20[(3'h4):(3'h4)] ?
                       $signed($unsigned($signed(reg17))) : (8'hbf));
  always
    @(posedge clk) begin
      reg121 <= (($signed(reg9) ?
          $unsigned({(wire1 ?
                  reg5 : wire19)}) : reg17[(3'h4):(3'h4)]) * {reg20});
      reg122 <= {$unsigned(reg8)};
    end
  assign wire123 = (^$unsigned({wire2,
                       ((~reg8) ? (~&reg21) : (reg7 && reg22))}));
  assign wire124 = (~|(|reg21));
  assign wire125 = $signed((~&(~|reg17)));
endmodule

module module24  (y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'h350):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire25;
  input wire signed [(4'ha):(1'h0)] wire26;
  input wire [(3'h6):(1'h0)] wire27;
  input wire [(3'h6):(1'h0)] wire28;
  input wire signed [(4'ha):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire116;
  wire signed [(3'h7):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire110;
  wire signed [(3'h7):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire66;
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(3'h6):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire110,
                 wire109,
                 wire88,
                 wire86,
                 wire85,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire39,
                 wire51,
                 wire66,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
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
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg87,
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
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~^(((~{wire28, wire26}) ?
          $unsigned(((8'ha1) ? (8'ha7) : wire26)) : (wire25[(4'hb):(2'h2)] ?
              (~^wire27) : wire25)) <<< {($signed(wire29) <= $unsigned(wire26)),
          $signed(wire26)})))
        begin
          reg30 <= ($signed(($unsigned((wire27 ?
                  wire26 : wire25)) >>> $signed((wire27 != wire27)))) ?
              $signed($signed($signed($unsigned(wire28)))) : $signed($unsigned($unsigned(wire25[(4'h8):(2'h2)]))));
          reg31 <= wire28;
        end
      else
        begin
          reg30 <= ((reg30 == $unsigned($signed(wire29[(3'h4):(1'h1)]))) != $unsigned({$signed($signed(reg31)),
              wire28[(2'h3):(1'h0)]}));
          reg31 <= $unsigned($signed($signed((reg30[(1'h1):(1'h1)] << (wire25 * (8'hbe))))));
          reg32 <= wire25[(4'he):(2'h2)];
          reg33 <= ($unsigned(($unsigned((reg31 << wire25)) ?
              reg32[(4'ha):(2'h2)] : $unsigned((reg31 < wire25)))) >= $signed(wire28));
          reg34 <= ((wire25[(4'hd):(3'h7)] * ($signed((&reg33)) ?
                  $unsigned((wire28 ? (8'hb9) : reg30)) : (^(reg30 ?
                      wire25 : reg32)))) ?
              ($signed(((reg33 & wire28) - (~|wire25))) ?
                  (-$unsigned(wire27)) : ((wire25[(2'h2):(1'h0)] <<< wire27) != (((8'h9c) ?
                          reg33 : reg32) ?
                      wire28 : (reg33 && (7'h41))))) : {($signed((reg30 ?
                      wire29 : reg31)) || $signed(reg32)),
                  $signed($unsigned(wire28[(2'h3):(1'h0)]))});
        end
      reg35 <= {$signed((!(~^(wire25 > wire27))))};
      reg36 <= ((8'ha7) ? wire29 : reg33);
      reg37 <= reg31;
      reg38 <= ($signed($signed($unsigned($signed(wire27)))) ?
          ({reg31[(2'h2):(1'h0)]} ?
              $signed($signed($signed(reg37))) : reg31[(1'h0):(1'h0)]) : (wire27 || reg30));
    end
  assign wire39 = $unsigned((~^$signed($signed($unsigned(wire28)))));
  always
    @(posedge clk) begin
      reg40 <= reg34[(1'h0):(1'h0)];
      if ($unsigned(wire28[(1'h1):(1'h0)]))
        begin
          reg41 <= {($signed((&(8'hb4))) ?
                  wire29 : (((-wire28) >= ((8'ha6) ?
                      reg35 : reg34)) < $signed($signed(reg32))))};
          reg42 <= $unsigned((!wire39));
        end
      else
        begin
          reg41 <= ((^~{$signed($unsigned(reg32))}) ?
              $signed(((&(wire25 <= reg33)) + $unsigned($signed(reg30)))) : (!reg38));
          reg42 <= $signed(wire26);
        end
      if ((&reg30))
        begin
          reg43 <= (((|((reg35 >= wire39) ?
                  reg38 : $unsigned(wire25))) <<< (~&({reg42,
                  reg42} << (wire39 || wire28)))) ?
              reg35[(3'h5):(3'h5)] : $signed((|(8'ha8))));
          if (($signed(($unsigned(reg43[(1'h1):(1'h0)]) < ($signed(reg41) ^~ (reg43 ?
                  reg41 : wire27)))) ?
              (+reg38[(3'h6):(1'h0)]) : reg41[(3'h6):(2'h2)]))
            begin
              reg44 <= ($signed($unsigned($unsigned((-wire25)))) | reg38[(1'h1):(1'h0)]);
              reg45 <= $signed(wire25);
              reg46 <= {$signed(reg32), (|$signed($unsigned(reg40)))};
              reg47 <= reg42[(1'h1):(1'h1)];
              reg48 <= (reg46[(1'h1):(1'h1)] <<< {$signed($signed(reg41[(4'h8):(2'h2)])),
                  ((^reg46) | wire25)});
            end
          else
            begin
              reg44 <= (+reg34);
            end
        end
      else
        begin
          reg43 <= {($signed((reg40 * $unsigned(reg30))) >> {{reg34[(2'h3):(2'h2)]}}),
              {reg42}};
          if ({$unsigned((8'h9e))})
            begin
              reg44 <= reg37[(1'h1):(1'h0)];
              reg45 <= reg40;
            end
          else
            begin
              reg44 <= (~$signed(reg34));
              reg45 <= wire28[(2'h2):(1'h0)];
              reg46 <= ((~(^$signed($signed(reg43)))) ?
                  (7'h44) : $unsigned($signed((+reg31))));
            end
        end
      reg49 <= (~($unsigned(reg36[(1'h1):(1'h0)]) ^ ((8'ha7) == wire29)));
      reg50 <= reg30[(3'h6):(1'h0)];
    end
  assign wire51 = (($unsigned($unsigned({reg35,
                      reg47})) - reg37[(1'h1):(1'h0)]) ~^ (((8'had) | $unsigned($signed(wire28))) ?
                      (&(7'h42)) : wire27[(3'h6):(3'h5)]));
  module52 #() modinst67 (wire66, clk, wire39, reg43, wire28, reg40, wire26);
  assign wire68 = $unsigned(wire51[(4'h8):(2'h3)]);
  assign wire69 = reg49[(5'h14):(5'h14)];
  assign wire70 = (~|$signed({wire69[(4'hd):(4'h8)], (^reg50[(4'hc):(3'h7)])}));
  assign wire71 = ($unsigned(({((8'hbe) | (8'h9e))} | (wire68 <<< $signed(wire66)))) * $unsigned((~({(8'ha2),
                      reg38} & (wire39 ? wire66 : wire69)))));
  assign wire72 = ((((&(!reg37)) ?
                      ((-wire25) >>> (reg48 ?
                          (8'hb7) : reg45)) : wire51) && reg50) < (((reg41[(3'h7):(2'h2)] ^~ $signed(wire25)) <<< {((8'ha9) ?
                          reg44 : wire29)}) <= wire68[(3'h4):(3'h4)]));
  assign wire73 = reg45[(1'h0):(1'h0)];
  assign wire74 = reg44;
  always
    @(posedge clk) begin
      reg75 <= wire69[(1'h0):(1'h0)];
      if ((-reg48[(4'he):(4'h9)]))
        begin
          if ((((+$unsigned((~|wire29))) ?
                  ((((8'hac) != wire71) ^~ reg41) > ((wire71 * reg30) <= wire74)) : (+(reg34[(3'h6):(2'h2)] ?
                      $signed(reg38) : $unsigned(reg49)))) ?
              $unsigned(reg46) : (^~(wire28[(3'h4):(2'h2)] << (reg75 ?
                  (wire69 <<< wire74) : $signed(reg50))))))
            begin
              reg76 <= wire70[(1'h0):(1'h0)];
              reg77 <= reg75;
              reg78 <= $signed((reg42[(3'h4):(2'h3)] ?
                  ($signed(reg35[(3'h7):(3'h6)]) >= ($signed(reg31) ?
                      (wire74 ?
                          (8'ha5) : wire66) : $signed(reg49))) : {(~((8'ha8) ?
                          reg77 : wire73)),
                      (-(reg40 == reg34))}));
            end
          else
            begin
              reg76 <= (|reg33[(1'h1):(1'h1)]);
              reg77 <= $unsigned((((~&$unsigned(reg48)) ?
                  (8'had) : $signed(wire51[(4'hd):(4'hd)])) << ((~&(+reg75)) ?
                  reg41[(1'h0):(1'h0)] : {(reg40 ? reg49 : reg45)})));
              reg78 <= (($unsigned($unsigned($signed(wire68))) || (|wire71)) ^~ (^~$signed($signed($signed(wire68)))));
              reg79 <= $signed(reg31);
            end
        end
      else
        begin
          if (($signed({{(&reg34), (reg42 ? (8'ha4) : reg49)},
              wire27}) << reg43[(5'h13):(3'h6)]))
            begin
              reg76 <= wire25[(5'h11):(2'h3)];
              reg77 <= (((!((reg77 + wire29) ?
                      (reg77 ? wire70 : reg49) : wire73)) ~^ reg42) ?
                  $unsigned({({reg78, wire70} ?
                          $signed(wire51) : (~reg33))}) : $unsigned(($unsigned((wire66 & wire68)) > $unsigned((~|(8'hbc))))));
              reg78 <= reg49[(1'h0):(1'h0)];
              reg79 <= (reg43 | $unsigned({($unsigned((8'hb0)) ?
                      (reg34 != reg31) : (reg32 ? reg33 : reg38))}));
              reg80 <= (({$unsigned(wire72[(2'h2):(1'h1)]), $signed((-reg36))} ?
                      (reg75 & $unsigned($signed(wire74))) : reg44) ?
                  reg49 : (8'ha3));
            end
          else
            begin
              reg76 <= $signed(((-(|{(8'hbb)})) ?
                  reg76 : $unsigned(($unsigned((8'hbc)) - {reg38, wire68}))));
              reg77 <= reg76[(4'hd):(4'h8)];
              reg78 <= ((((reg44 - (reg30 ?
                      wire25 : reg40)) && reg38[(1'h0):(1'h0)]) | wire29) ?
                  wire28[(1'h0):(1'h0)] : (reg43[(1'h0):(1'h0)] ~^ reg43[(4'hf):(3'h5)]));
            end
          reg81 <= $unsigned(reg77[(4'h9):(3'h5)]);
          reg82 <= {wire27};
          reg83 <= wire26[(3'h4):(2'h2)];
        end
      reg84 <= $unsigned(reg31);
    end
  assign wire85 = wire74[(4'hd):(2'h3)];
  assign wire86 = ({$unsigned($signed(reg81[(4'h8):(2'h3)]))} - wire26);
  always
    @(posedge clk) begin
      reg87 <= (&{(((reg75 | wire25) >>> (|reg76)) ?
              reg79[(1'h1):(1'h1)] : wire39)});
    end
  assign wire88 = $signed(($signed({$unsigned(reg32)}) - {reg77[(4'hc):(4'h8)]}));
  always
    @(posedge clk) begin
      if ($unsigned($signed((wire69 - ($unsigned(wire27) ~^ $unsigned(wire70))))))
        begin
          reg89 <= $unsigned({((+wire71[(4'hf):(3'h4)]) ?
                  $unsigned(wire70) : reg38)});
          reg90 <= (!((reg49 >>> $signed(reg35[(4'ha):(4'h8)])) ?
              reg44 : $unsigned((reg81[(3'h7):(3'h4)] && reg32))));
          if ((&reg44))
            begin
              reg91 <= (^~{reg79[(1'h0):(1'h0)]});
              reg92 <= $unsigned(($signed((~|$unsigned(reg45))) ?
                  $signed((8'h9c)) : reg33));
            end
          else
            begin
              reg91 <= (^reg45[(1'h0):(1'h0)]);
              reg92 <= $signed(($signed(((reg91 | reg37) ?
                      $unsigned(wire66) : (~^reg35))) ?
                  $signed((8'ha9)) : (8'hb3)));
              reg93 <= ((|reg49) > (8'hb4));
              reg94 <= reg89;
              reg95 <= (((~^({(8'hb7)} ?
                  $signed(reg33) : (reg89 ^ reg89))) && $unsigned($unsigned((reg37 ?
                  wire66 : reg42)))) >> ((&wire68[(4'hb):(3'h5)]) <<< reg42[(2'h2):(2'h2)]));
            end
          if (wire73[(2'h3):(1'h0)])
            begin
              reg96 <= {wire69[(3'h7):(2'h2)], $signed(reg35)};
              reg97 <= (8'ha8);
              reg98 <= (|$signed($unsigned($unsigned((8'hb0)))));
              reg99 <= (wire68[(3'h6):(2'h3)] ^ $unsigned($signed(reg36)));
              reg100 <= $signed($unsigned({({wire68} << wire86),
                  $signed(reg47)}));
            end
          else
            begin
              reg96 <= $unsigned((wire86[(4'hb):(3'h7)] ?
                  (wire29 + ((~wire86) >>> reg35[(4'hb):(3'h7)])) : $signed($unsigned(reg98))));
              reg97 <= $signed($signed((({reg37, reg41} ~^ reg96) && reg82)));
              reg98 <= wire27[(3'h6):(3'h6)];
            end
          reg101 <= (|(8'hb2));
        end
      else
        begin
          reg89 <= (~&{$unsigned(((7'h44) && (wire39 < (8'hb9))))});
          reg90 <= ((reg101 ? (8'haa) : reg42) & (wire73 << (((reg81 ?
              reg92 : reg43) & reg32) >> wire86)));
          reg91 <= ($unsigned(wire29[(4'h9):(2'h3)]) ?
              reg84[(4'h8):(2'h3)] : (+$unsigned(($unsigned(reg42) ?
                  $unsigned(wire26) : $unsigned(wire25)))));
          reg92 <= reg90[(1'h0):(1'h0)];
        end
      reg102 <= ((~&($signed(reg32[(3'h4):(3'h4)]) - ((!(8'h9e)) ^~ reg49))) ?
          $unsigned(reg34) : {reg97[(2'h3):(2'h3)]});
      reg103 <= {$signed((~^((wire71 > wire39) >= {reg40, reg82}))),
          wire70[(1'h1):(1'h0)]};
      if ($signed($signed(((~^$unsigned(wire85)) && wire39))))
        begin
          reg104 <= wire25;
        end
      else
        begin
          reg104 <= reg95[(2'h2):(2'h2)];
        end
      if ((reg87[(1'h0):(1'h0)] ?
          reg98[(1'h1):(1'h1)] : $unsigned($unsigned(((~|reg34) ^~ (reg92 ?
              reg32 : wire29))))))
        begin
          reg105 <= $unsigned(((+$signed($signed(reg50))) <= (($unsigned(reg47) ?
              $unsigned((8'ha8)) : reg104[(4'he):(4'hb)]) <<< ((~reg103) - {reg38}))));
          reg106 <= $unsigned(reg103);
          reg107 <= (^reg32[(4'hd):(1'h1)]);
          reg108 <= {({$unsigned((reg32 == (7'h41))),
                      ({reg91} | reg104[(4'ha):(2'h3)])} ?
                  $unsigned($signed((&(8'h9f)))) : $signed(((&reg47) > reg75[(2'h3):(2'h3)]))),
              (wire71 ? ({(~|reg97)} ^ (+(^~wire25))) : wire69)};
        end
      else
        begin
          reg105 <= ($unsigned(wire51) ?
              $signed($unsigned((reg46 ?
                  (|reg96) : (!wire70)))) : ((($unsigned(wire86) ?
                      reg99[(2'h2):(2'h2)] : {(7'h43), (8'hb5)}) ?
                  reg83[(1'h0):(1'h0)] : $unsigned((reg95 & (8'hbc)))) << {{$unsigned(reg37)}}));
          reg106 <= (+$unsigned({{$signed((8'h9c)), (-reg36)}}));
          if (((~^wire86) ^~ ($unsigned(reg102[(2'h3):(2'h3)]) | (wire69 * ((wire72 ~^ wire86) >> wire86[(3'h4):(1'h0)])))))
            begin
              reg107 <= $unsigned(wire68[(2'h3):(2'h3)]);
            end
          else
            begin
              reg107 <= ($signed({{(wire68 ? reg32 : wire86), (|(8'hb0))}}) ?
                  $unsigned(reg41[(2'h3):(2'h2)]) : wire73[(2'h3):(1'h0)]);
              reg108 <= (~^(~(~&((reg87 == wire72) ?
                  (wire88 << reg49) : (~^reg76)))));
            end
        end
    end
  assign wire109 = $signed((+(((|reg101) ?
                       wire69 : {(8'hbd)}) == $unsigned({wire29, wire66}))));
  assign wire110 = (^(($unsigned((!reg83)) <<< $signed(reg80)) ?
                       wire74 : (wire26 + ($signed(wire26) ?
                           {reg106, reg48} : (wire85 & reg106)))));
  always
    @(posedge clk) begin
      reg111 <= $signed(($signed(reg100[(4'h8):(3'h6)]) >>> ($signed($unsigned(wire66)) >> ({wire66} ?
          reg31 : reg98))));
      reg112 <= (8'haf);
      reg113 <= reg93[(3'h7):(3'h5)];
      reg114 <= reg113;
    end
  assign wire115 = reg34[(1'h1):(1'h0)];
  assign wire116 = ((($unsigned(reg99) ^~ reg89) + (~(reg40[(1'h0):(1'h0)] ?
                       $unsigned((8'hb4)) : (wire74 != reg80)))) >= reg84);
endmodule

module module52
#(parameter param64 = {{((((8'hbf) & (8'had)) ? (~|(8'hb6)) : ((8'hb2) != (8'hae))) << (((8'hb5) ? (8'h9e) : (8'hb5)) ? ((8'ha7) >= (7'h43)) : ((8'ha3) ? (7'h42) : (7'h41)))), ((-((7'h42) ? (8'ha7) : (8'hab))) == (~^{(8'haa)}))}}, 
parameter param65 = param64)
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire57;
  input wire signed [(5'h15):(1'h0)] wire56;
  input wire signed [(3'h6):(1'h0)] wire55;
  input wire [(4'hc):(1'h0)] wire54;
  input wire signed [(3'h4):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  assign y = {wire63, wire62, wire61, wire60, wire59, wire58, (1'h0)};
  assign wire58 = $signed(wire53);
  assign wire59 = ((wire57 && wire54) <<< $unsigned(wire53));
  assign wire60 = wire54;
  assign wire61 = ($unsigned($unsigned(($unsigned(wire58) != (+wire57)))) ?
                      ($unsigned((wire58 >>> (wire55 ^~ wire57))) ?
                          ((~|(wire59 ? wire55 : wire53)) ?
                              $unsigned((~&wire57)) : wire59) : wire58) : (&wire56[(4'hf):(4'h8)]));
  assign wire62 = wire57;
  assign wire63 = (($signed((8'hb0)) ?
                      wire60 : ($signed(wire54[(4'hb):(3'h6)]) & $unsigned((wire61 ?
                          wire57 : wire56)))) <<< $unsigned(($signed(wire60) ?
                      {(wire62 & wire54)} : $unsigned((8'ha2)))));
endmodule
