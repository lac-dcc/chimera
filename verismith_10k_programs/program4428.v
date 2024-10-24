module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h392):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire100;
  wire [(5'h11):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire98;
  wire [(5'h12):(1'h0)] wire97;
  wire [(3'h6):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire95;
  wire signed [(5'h15):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire81,
                 wire80,
                 wire75,
                 wire74,
                 wire73,
                 wire49,
                 wire33,
                 wire31,
                 wire7,
                 wire6,
                 wire5,
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
                 reg79,
                 reg78,
                 reg77,
                 reg76,
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
                 reg62,
                 reg61,
                 reg60,
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
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire5 = $signed(wire0);
  assign wire6 = (^~((8'hbd) ?
                     wire5 : ((!$signed(wire5)) & wire3[(1'h1):(1'h0)])));
  assign wire7 = (~^(~&$unsigned((wire1[(1'h0):(1'h0)] ?
                     ((8'hba) == wire1) : wire1))));
  module8 #() modinst32 (.wire9(wire5), .y(wire31), .clk(clk), .wire12(wire7), .wire11(wire3), .wire10(wire1));
  assign wire33 = wire31;
  always
    @(posedge clk) begin
      reg34 <= (~|($unsigned(wire4) >>> wire2));
      reg35 <= (wire5[(3'h4):(1'h1)] ?
          (8'ha2) : (wire4 ?
              ({(reg34 < wire6), (wire7 < wire1)} ?
                  $signed(wire0) : {(!(8'hb2))}) : (~$signed((~|wire1)))));
      if ((wire3 ^~ {(($signed(wire31) ?
              (&wire6) : (wire3 ^~ wire0)) << ({wire0, (8'hb3)} ?
              reg35[(4'hd):(4'hc)] : (reg35 >> wire4))),
          (wire31[(2'h2):(1'h0)] & ((reg35 || wire5) ?
              $signed(wire4) : (wire5 ? wire2 : wire31)))}))
        begin
          if (reg34)
            begin
              reg36 <= {$signed((((8'hb3) ?
                          {reg35} : ((8'hb5) ? reg35 : wire3)) ?
                      reg35 : ((wire4 > wire31) * wire0)))};
            end
          else
            begin
              reg36 <= reg36[(4'hd):(4'h8)];
            end
          reg37 <= (reg34 >= ($unsigned($signed((wire7 ^~ reg34))) | (~&(wire4 ~^ $signed(wire0)))));
          if (reg36)
            begin
              reg38 <= wire33;
              reg39 <= wire1[(5'h10):(4'hc)];
              reg40 <= (^(wire31[(1'h0):(1'h0)] ^ {(~$signed(wire33))}));
              reg41 <= (reg40 - wire31);
              reg42 <= $signed(wire33[(5'h10):(4'hd)]);
            end
          else
            begin
              reg38 <= (reg37 ^~ wire2);
              reg39 <= $signed(wire1);
              reg40 <= reg41;
              reg41 <= (-{wire6});
              reg42 <= (+reg38);
            end
          reg43 <= (7'h41);
        end
      else
        begin
          reg36 <= $signed(($signed((^~(wire7 != wire1))) ?
              wire4[(3'h5):(1'h1)] : (!(&$signed(reg36)))));
          reg37 <= ($signed({(~(wire6 ?
                  (8'hab) : wire3))}) == $signed($unsigned((-reg43))));
          reg38 <= ($unsigned(wire2[(1'h1):(1'h0)]) > $signed($signed(wire4)));
          reg39 <= (~&({reg38} | ((~^$signed(wire33)) ^ (reg38[(4'h9):(3'h7)] >> (|(8'ha9))))));
          reg40 <= (((!reg42[(3'h6):(1'h1)]) ?
              (~(wire31[(2'h2):(2'h2)] ?
                  $unsigned(reg42) : (wire33 | reg39))) : {reg36,
                  ((^~wire7) >= (^~reg34))}) >> $signed((reg37[(2'h3):(1'h1)] ?
              $signed($unsigned(wire1)) : reg37[(2'h2):(2'h2)])));
        end
      if ((($unsigned($signed($unsigned(reg42))) ?
          $signed(((~^reg42) ?
              $signed(wire1) : (+reg39))) : reg43[(2'h3):(1'h0)]) | $unsigned((wire33 ?
          wire1 : ($unsigned(wire31) ? reg35 : reg39[(4'h9):(4'h9)])))))
        begin
          reg44 <= reg35[(5'h13):(5'h12)];
          reg45 <= reg38[(3'h6):(3'h5)];
          reg46 <= $signed(({reg42[(3'h6):(3'h5)],
                  $unsigned($unsigned(reg38))} ?
              $unsigned(reg35[(5'h12):(5'h10)]) : (+$unsigned($unsigned(wire2)))));
          reg47 <= reg40[(4'h8):(3'h6)];
          reg48 <= $signed(($signed(wire6[(3'h4):(2'h3)]) ?
              (8'had) : ({(wire7 ? (8'ha8) : wire5),
                  wire1} << $unsigned($signed((8'ha5))))));
        end
      else
        begin
          reg44 <= $unsigned($unsigned(wire1[(4'hb):(1'h0)]));
          reg45 <= $signed($signed((+$unsigned((~reg45)))));
          reg46 <= $signed($signed(reg42[(5'h10):(3'h7)]));
        end
    end
  assign wire49 = wire6;
  always
    @(posedge clk) begin
      reg50 <= $unsigned(((($unsigned(reg35) + (&reg46)) == $signed((reg48 == reg45))) ?
          $signed(reg39[(3'h4):(3'h4)]) : $unsigned(((wire1 < reg45) ?
              $unsigned(wire31) : reg42[(5'h10):(2'h3)]))));
      reg51 <= wire6[(4'hd):(3'h7)];
      if ({$signed($unsigned((^$signed(wire4)))),
          {wire49[(5'h14):(5'h12)], reg44}})
        begin
          reg52 <= {$signed($signed($signed((wire7 ? reg42 : (8'hb1)))))};
          reg53 <= $unsigned((~^reg39));
          reg54 <= ({((reg46[(2'h2):(1'h0)] ~^ $unsigned(wire5)) ?
                  $signed($unsigned((8'hb5))) : reg39[(2'h2):(2'h2)])} - (-$unsigned((+reg51[(2'h3):(2'h2)]))));
          if (reg51)
            begin
              reg55 <= wire33;
            end
          else
            begin
              reg55 <= $unsigned($signed(wire33));
            end
          reg56 <= $unsigned(wire31[(3'h6):(1'h1)]);
        end
      else
        begin
          reg52 <= wire4[(2'h2):(2'h2)];
          reg53 <= (~|$signed((((8'h9e) ?
              reg47 : $unsigned(reg38)) ^~ $signed(reg45[(5'h12):(4'h9)]))));
        end
      if (($unsigned(((~$unsigned(reg34)) ?
              reg53[(3'h5):(3'h5)] : ((8'hab) == $signed((8'hbd))))) ?
          ((^$signed(wire6[(4'h9):(3'h7)])) ?
              $signed(reg44) : reg56) : $signed(reg42[(5'h10):(2'h3)])))
        begin
          if ({{reg41}})
            begin
              reg57 <= (wire6 * $unsigned((((reg53 * (8'ha3)) ?
                  (^~reg47) : reg36[(4'ha):(2'h3)]) <= ((reg50 | wire0) < (reg35 ?
                  wire5 : wire7)))));
              reg58 <= {$signed(reg56[(4'ha):(3'h6)])};
            end
          else
            begin
              reg57 <= $unsigned({{(!reg51), (&reg57[(2'h2):(2'h2)])},
                  $unsigned($unsigned(((8'ha8) != reg44)))});
            end
        end
      else
        begin
          if ($unsigned($signed($unsigned($unsigned(wire6)))))
            begin
              reg57 <= (~^$signed((8'hbe)));
              reg58 <= wire49;
              reg59 <= $signed($signed(reg41[(4'ha):(4'h9)]));
              reg60 <= ((reg56[(3'h7):(3'h6)] + (+$signed(wire4))) == $unsigned(($signed($signed(reg55)) ?
                  (reg55 ?
                      $signed(reg37) : (reg58 >>> reg35)) : ($signed(reg57) >>> {reg59,
                      reg56}))));
            end
          else
            begin
              reg57 <= $signed($unsigned(($signed($unsigned(wire4)) ?
                  reg45 : reg52[(2'h3):(2'h2)])));
              reg58 <= (~reg37);
              reg59 <= ($signed(wire7[(4'ha):(4'ha)]) ?
                  ((^$unsigned(wire2[(4'hc):(2'h3)])) ?
                      $signed((^~{wire49, reg59})) : ($unsigned({(8'hb0),
                          reg38}) == reg51)) : (~^wire6[(3'h6):(3'h6)]));
            end
          if (((($unsigned((-wire7)) ?
                  wire0[(4'hb):(4'h9)] : wire49[(4'h8):(3'h5)]) ?
              $signed($unsigned(wire2[(3'h7):(1'h1)])) : reg39[(2'h3):(2'h3)]) * (^reg46)))
            begin
              reg61 <= reg47;
              reg62 <= ($unsigned($unsigned(($signed(reg45) ^~ reg46))) ?
                  (^~$signed((wire0[(1'h1):(1'h0)] ?
                      (^reg36) : reg51))) : reg34);
              reg63 <= reg46[(1'h0):(1'h0)];
              reg64 <= $unsigned(reg44);
              reg65 <= reg62[(4'hb):(1'h1)];
            end
          else
            begin
              reg61 <= wire7[(4'h9):(3'h4)];
              reg62 <= {($unsigned((+((8'ha9) ? reg35 : (8'haf)))) ?
                      ((((8'ha4) != reg52) ?
                          $unsigned(reg59) : $signed((8'h9d))) != $unsigned($unsigned(reg60))) : $signed($unsigned(reg59[(5'h10):(4'hf)])))};
            end
          if ($unsigned($unsigned(wire7[(4'ha):(3'h4)])))
            begin
              reg66 <= {(~|{(reg54 >>> $unsigned(wire2)), reg46}),
                  $unsigned($unsigned(reg60[(3'h5):(1'h1)]))};
              reg67 <= ($signed(reg43[(3'h5):(2'h3)]) != $signed((~|(8'hb6))));
              reg68 <= ($signed((~($unsigned(reg57) | $unsigned((8'ha8))))) ^~ reg54[(4'hf):(2'h3)]);
              reg69 <= ($unsigned((!reg34[(4'hb):(4'hb)])) ?
                  (((^~(8'h9d)) == $signed((wire3 ?
                      wire6 : wire49))) ~^ (reg53 ?
                      (reg45[(4'hb):(4'ha)] > $signed(reg61)) : $signed((reg67 > wire49)))) : ($signed(((-wire3) || wire7[(4'hc):(3'h5)])) && wire0));
              reg70 <= reg51[(2'h3):(2'h2)];
            end
          else
            begin
              reg66 <= wire1;
              reg67 <= reg36[(4'hb):(4'ha)];
              reg68 <= $unsigned((|reg34[(2'h2):(1'h1)]));
              reg69 <= (&$unsigned({$signed($unsigned(reg56)),
                  (wire5 ? $signed(reg39) : $signed(reg63))}));
              reg70 <= reg47[(1'h0):(1'h0)];
            end
          reg71 <= $signed(reg61[(1'h0):(1'h0)]);
          reg72 <= $unsigned(wire31[(3'h5):(1'h0)]);
        end
    end
  assign wire73 = wire31;
  assign wire74 = reg61[(4'hd):(1'h1)];
  assign wire75 = $signed(reg39);
  always
    @(posedge clk) begin
      reg76 <= (8'hab);
      reg77 <= ({wire0} ?
          $signed((((wire75 < reg45) ? $signed(reg46) : reg44[(2'h3):(2'h2)]) ?
              ((8'had) ?
                  wire6 : (reg43 ?
                      reg63 : reg52)) : $unsigned((reg64 ^ (8'hac))))) : reg72);
      reg78 <= $unsigned(reg56[(1'h0):(1'h0)]);
      reg79 <= (7'h43);
    end
  assign wire80 = reg50;
  assign wire81 = reg63;
  always
    @(posedge clk) begin
      reg82 <= reg67[(3'h6):(3'h5)];
      if (((wire7[(4'hd):(3'h7)] ?
          $unsigned(((reg34 * (8'ha7)) ?
              $unsigned(reg67) : (&reg40))) : $unsigned(reg46[(1'h1):(1'h1)])) || {(reg40[(4'hb):(4'hb)] ^~ $unsigned({reg43}))}))
        begin
          reg83 <= ($signed($unsigned($signed($unsigned(reg59)))) | $unsigned((~&$signed($signed((8'had))))));
          reg84 <= (~|(wire75[(1'h1):(1'h0)] ?
              reg44 : ($unsigned((wire6 ? reg61 : reg64)) ? reg72 : reg39)));
        end
      else
        begin
          if ($unsigned((({reg72, (reg65 != reg54)} ?
                  ({wire4} ? reg76[(4'ha):(4'h8)] : reg64) : $unsigned(reg65)) ?
              ((reg55[(2'h3):(2'h3)] ?
                  (reg53 > reg57) : reg57) << ($signed(wire4) <= {reg72,
                  reg35})) : reg38)))
            begin
              reg83 <= {(({wire75[(1'h1):(1'h0)]} == $unsigned({reg36})) ?
                      {({reg62} ^~ reg39[(2'h3):(1'h0)]), wire31} : {reg56,
                          $unsigned(((8'hb7) >>> (8'hb1)))}),
                  ((^~$unsigned((reg61 == wire5))) ?
                      reg76[(3'h7):(1'h1)] : $signed(((reg63 && reg82) ?
                          (reg66 ? reg63 : reg48) : (reg69 ? reg43 : wire7))))};
            end
          else
            begin
              reg83 <= reg70[(4'hd):(4'h9)];
              reg84 <= {(7'h40),
                  $signed((((~&(8'ha9)) ~^ wire4) >>> (((8'hbe) ?
                      reg63 : reg66) + $signed(reg50))))};
              reg85 <= (($unsigned(reg57) <<< reg35[(4'hc):(1'h0)]) ?
                  wire31 : reg55[(1'h0):(1'h0)]);
              reg86 <= wire74;
              reg87 <= {(~|$signed(((8'hb9) ^ (~reg59)))),
                  $signed(reg51[(2'h2):(1'h1)])};
            end
          if ((~|$signed(reg64)))
            begin
              reg88 <= $signed(($signed({$signed((7'h40))}) ?
                  reg44 : {reg50[(4'h8):(1'h0)], wire2}));
              reg89 <= (-(~reg34));
              reg90 <= ({$unsigned({reg69, reg76[(3'h7):(1'h1)]}),
                      reg41[(4'h9):(1'h0)]} ?
                  (($unsigned($signed(reg89)) ?
                          ($signed((8'hbe)) * wire1[(3'h6):(3'h6)]) : (~&(wire31 * reg76))) ?
                      (~(-(wire74 ?
                          reg59 : (8'hb6)))) : $signed(($signed((7'h40)) ?
                          {(8'hbe),
                              wire4} : reg79[(4'hd):(1'h0)]))) : ($unsigned(reg85[(4'hc):(4'ha)]) ?
                      $signed(reg79) : ({$signed(wire2)} ?
                          ({wire33} * (reg87 >= reg89)) : (~^$unsigned(reg40)))));
            end
          else
            begin
              reg88 <= (((8'ha4) & $signed(wire7[(4'hb):(3'h6)])) ?
                  reg43[(1'h0):(1'h0)] : reg36);
              reg89 <= $signed(reg41[(1'h1):(1'h0)]);
              reg90 <= (~&($unsigned(((reg42 - (8'ha3)) <<< reg37)) << {$signed($unsigned(reg37))}));
              reg91 <= $signed(reg71);
            end
        end
      reg92 <= $unsigned($unsigned((((reg67 >= (7'h43)) >> (8'hb4)) ~^ (8'hae))));
      reg93 <= (!(($unsigned(reg58) < $unsigned((|reg63))) ?
          reg77[(1'h1):(1'h1)] : wire2[(4'h9):(1'h1)]));
      reg94 <= (((reg82 ?
          $unsigned($unsigned(reg84)) : reg39[(1'h1):(1'h0)]) && ($unsigned(reg89) ?
          $signed($unsigned((8'hb0))) : {$unsigned(reg67),
              ((8'ha5) * reg41)})) ~^ $unsigned({$unsigned(reg36)}));
    end
  assign wire95 = reg58;
  assign wire96 = (&(~{(~&wire0)}));
  assign wire97 = $signed(reg71[(3'h4):(2'h3)]);
  assign wire98 = $signed(reg69[(4'ha):(2'h2)]);
  assign wire99 = $signed($signed(reg93[(3'h4):(1'h0)]));
  assign wire100 = reg92[(3'h7):(3'h4)];
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  assign y = {wire30,
                 wire25,
                 wire14,
                 wire13,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
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
                 (1'h0)};
  assign wire13 = $signed((-((+wire10[(2'h3):(2'h2)]) ?
                      wire9[(1'h1):(1'h1)] : {((7'h42) ? wire11 : wire9)})));
  assign wire14 = $signed($signed(wire13[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      reg15 <= $signed($unsigned(($unsigned((wire13 * wire11)) > ($unsigned(wire10) >>> wire9[(1'h1):(1'h0)]))));
      reg16 <= (^~wire9);
      if (reg16)
        begin
          reg17 <= wire9[(2'h3):(2'h3)];
          reg18 <= {$unsigned(wire10), wire10};
          reg19 <= $signed(((wire14 | reg17) ?
              ((wire13 ? (&wire12) : (wire9 ? reg17 : reg16)) ?
                  (wire14[(1'h1):(1'h0)] ?
                      $signed(wire14) : wire12) : $unsigned(wire9)) : wire12[(4'hb):(2'h3)]));
          if (({reg17,
              (((8'ha4) ? reg19 : (wire9 + wire12)) ?
                  reg19[(3'h6):(3'h4)] : (~|(wire11 ?
                      wire14 : (8'hb9))))} >>> ($unsigned(wire11[(4'he):(2'h3)]) ?
              wire13 : {wire11, $unsigned((wire13 ? (8'hae) : (8'hbd)))})))
            begin
              reg20 <= $unsigned($signed($unsigned(((wire13 ? wire13 : wire13) ?
                  (7'h43) : $signed(wire10)))));
            end
          else
            begin
              reg20 <= $signed(wire10);
              reg21 <= wire14[(1'h1):(1'h1)];
              reg22 <= (+(8'ha4));
              reg23 <= (reg16[(4'hd):(2'h3)] * ((|$signed($unsigned((8'hb8)))) ?
                  reg20[(4'h9):(2'h2)] : (^~reg20)));
            end
        end
      else
        begin
          reg17 <= $unsigned((wire13 ?
              (8'hb5) : (((&wire13) || $unsigned(wire14)) >>> $unsigned((!reg23)))));
          reg18 <= (reg23[(4'h9):(4'h9)] ?
              (~^{(~&{wire13, reg20}),
                  reg21}) : (reg18[(2'h2):(1'h0)] ^~ wire11[(5'h12):(5'h12)]));
          reg19 <= {reg17, $signed((~&$signed(reg22[(1'h0):(1'h0)])))};
          reg20 <= (((-$unsigned((-wire14))) ?
              $unsigned({reg19}) : wire13) == wire12);
        end
      reg24 <= $signed(((((-wire14) ?
              wire11 : reg20[(4'ha):(4'h8)]) ^ ($unsigned(wire13) ?
              ((8'ha9) ^ reg18) : (-(8'hab)))) ?
          wire9 : wire12));
    end
  assign wire25 = {{reg17[(3'h6):(3'h5)]}, ($signed(wire13) <<< wire11)};
  always
    @(posedge clk) begin
      reg26 <= {{reg23}, $signed(((~&reg16) != reg24[(2'h2):(2'h2)]))};
      reg27 <= $unsigned(reg21);
      reg28 <= ($signed($unsigned((((8'ha8) ? reg15 : reg22) ?
          $unsigned(reg27) : (reg21 ? reg16 : wire14)))) || {{reg15}, reg16});
      reg29 <= $unsigned({$unsigned($signed(reg24)),
          ((&((8'ha8) || reg27)) == reg21)});
    end
  assign wire30 = $unsigned((~|$signed(reg19)));
endmodule
