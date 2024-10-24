module top
#(parameter param117 = (|((-((!(8'hb6)) <<< {(7'h41)})) ? (8'hae) : {(((8'h9d) < (8'hae)) != {(8'hbe), (8'hbf)}), (-((8'ha1) <= (8'hbe)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1fc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire116;
  wire [(4'hb):(1'h0)] wire115;
  wire signed [(4'he):(1'h0)] wire114;
  wire signed [(3'h4):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire111;
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire4,
                 wire5,
                 wire28,
                 wire29,
                 wire30,
                 wire41,
                 wire111,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
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
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (wire0[(3'h6):(3'h5)] >>> $unsigned(($signed(wire2) ?
                     $signed((wire2 ? wire2 : wire3)) : wire2)));
  assign wire5 = $signed((~^$signed(wire0[(3'h6):(2'h2)])));
  always
    @(posedge clk) begin
      if (($unsigned($signed({wire3})) >>> $signed(((+$unsigned(wire0)) | $signed((wire1 ?
          wire3 : wire2))))))
        begin
          reg6 <= wire5[(1'h1):(1'h0)];
          reg7 <= (wire1 ? reg6 : wire4[(1'h0):(1'h0)]);
          reg8 <= wire1[(1'h0):(1'h0)];
        end
      else
        begin
          reg6 <= wire4;
          reg7 <= (~|wire3[(3'h4):(1'h1)]);
          reg8 <= ((wire0[(4'hb):(4'ha)] <<< $signed((8'ha8))) & ($signed((^~wire5)) == (~&wire3)));
        end
      reg9 <= (((reg6[(2'h3):(1'h1)] ?
          wire2[(4'h8):(2'h3)] : (~^wire0)) & wire0) >= wire2);
      if (wire5[(4'ha):(2'h3)])
        begin
          if ((-$unsigned($signed(wire4))))
            begin
              reg10 <= (+$signed(((!wire3) != ($signed(wire5) ?
                  $unsigned(wire5) : wire2[(3'h7):(3'h7)]))));
              reg11 <= ((wire3 ?
                  wire5 : (~$unsigned(reg9))) ^~ $unsigned($signed(($signed(wire5) || $unsigned(reg9)))));
              reg12 <= ($signed({$signed((wire4 < reg9)), $signed(reg9)}) ?
                  (-reg8[(5'h12):(3'h6)]) : (reg6 ?
                      ($signed((~&wire4)) - (&(reg6 ? wire0 : reg6))) : wire5));
            end
          else
            begin
              reg10 <= reg11;
            end
          reg13 <= ((wire3[(3'h4):(1'h0)] ?
              $unsigned(wire3[(4'ha):(2'h2)]) : (reg7 >> $signed((reg10 ?
                  reg12 : reg9)))) & ($unsigned((reg6 ^~ wire3)) ?
              (|wire0) : {$signed((~&wire1))}));
          if ((wire4[(4'hd):(1'h1)] ?
              wire0[(3'h5):(1'h0)] : $unsigned(reg8[(3'h4):(1'h1)])))
            begin
              reg14 <= ($signed({(~^$signed(wire2))}) - {(reg13 ?
                      $signed($signed(reg7)) : reg6)});
              reg15 <= {$signed(reg7),
                  $unsigned({($signed((7'h40)) ?
                          $unsigned(wire3) : $unsigned(reg7))})};
              reg16 <= (reg14[(1'h0):(1'h0)] ? reg10 : reg11);
              reg17 <= (8'h9c);
              reg18 <= (8'hb3);
            end
          else
            begin
              reg14 <= $signed((((7'h41) - (&{(8'h9c), (8'ha0)})) ^ ((((8'ha3) ?
                      reg14 : reg7) ?
                  $signed(reg14) : reg9) ^ (8'hb7))));
              reg15 <= reg8;
              reg16 <= ($unsigned((^~(~^reg16))) > $unsigned(($signed((reg10 >= reg11)) >= reg13[(1'h1):(1'h1)])));
              reg17 <= $signed($signed(wire3));
            end
          reg19 <= wire0;
        end
      else
        begin
          reg10 <= reg16;
          reg11 <= $signed((&($unsigned(wire0[(1'h1):(1'h1)]) ?
              (!$unsigned(reg11)) : ((wire0 >>> reg11) && $unsigned(wire5)))));
          reg12 <= ($unsigned(wire4) != $unsigned((reg8 << (reg12[(1'h0):(1'h0)] < {reg15,
              (8'ha2)}))));
          reg13 <= ((wire2 * $signed($signed((wire4 << reg13)))) ?
              $unsigned((+wire3[(4'hc):(2'h2)])) : (~&($signed({reg18}) ?
                  ($signed(reg17) ?
                      reg18 : $signed(reg19)) : reg14[(3'h5):(1'h1)])));
        end
      if ($signed(($unsigned($signed($unsigned(reg16))) <= ((reg15[(2'h3):(2'h2)] >>> (&reg14)) >>> ((reg17 < wire1) ?
          reg19 : (~reg14))))))
        begin
          if ({(~((|(wire5 ^~ reg17)) >>> $unsigned((reg6 ? reg15 : reg13))))})
            begin
              reg20 <= ((8'hb4) || $signed(($unsigned({(8'hb3),
                  reg19}) < wire2[(2'h2):(1'h1)])));
              reg21 <= wire3[(4'hc):(1'h1)];
              reg22 <= ((^~reg13) || $signed(($unsigned(wire1[(1'h1):(1'h0)]) >> wire5)));
            end
          else
            begin
              reg20 <= $signed($signed($unsigned((~|$unsigned(wire1)))));
              reg21 <= (wire3 ?
                  $signed((((reg18 ? reg22 : reg10) ?
                      {reg18, wire5} : $signed(reg13)) >> ({reg16,
                      reg13} & $signed(wire3)))) : $unsigned(wire3[(1'h0):(1'h0)]));
            end
          if (((^~reg16) ? wire1 : reg16[(3'h4):(1'h1)]))
            begin
              reg23 <= {(wire5[(3'h6):(1'h1)] ?
                      reg8 : ((&reg9[(3'h7):(3'h6)]) <= wire4))};
              reg24 <= $unsigned((~|$signed($unsigned($signed(reg20)))));
              reg25 <= reg14;
              reg26 <= $unsigned(wire0);
              reg27 <= reg13;
            end
          else
            begin
              reg23 <= reg18[(1'h1):(1'h0)];
            end
        end
      else
        begin
          if ($signed({reg21}))
            begin
              reg20 <= (reg9 < reg15[(1'h1):(1'h0)]);
              reg21 <= (reg23 ? wire1 : wire3);
              reg22 <= (reg8 || reg27);
            end
          else
            begin
              reg20 <= {$unsigned(reg15),
                  ((~&{{(8'ha1), reg6}, $signed(wire1)}) ?
                      $unsigned($unsigned((-wire4))) : (wire0[(4'h8):(3'h7)] > $unsigned((wire3 ?
                          reg7 : reg7))))};
              reg21 <= wire2;
            end
          if (({$unsigned(reg20)} - (8'hb8)))
            begin
              reg23 <= $unsigned($signed(wire3));
              reg24 <= $unsigned((8'ha7));
            end
          else
            begin
              reg23 <= (({{$signed(wire3),
                      reg14[(4'h8):(2'h3)]}} && $signed(reg22)) * ($signed(reg23[(5'h12):(1'h1)]) > reg10));
              reg24 <= $signed(reg25[(1'h0):(1'h0)]);
            end
        end
    end
  assign wire28 = (reg6[(2'h3):(1'h0)] ?
                      ($unsigned($unsigned($signed(reg20))) ?
                          (^~$signed({wire5,
                              wire2})) : $signed(reg17)) : (^{wire4[(4'hd):(4'h9)],
                          reg26[(4'ha):(1'h0)]}));
  assign wire29 = $unsigned((~{reg6, reg24[(1'h1):(1'h0)]}));
  assign wire30 = ((~$unsigned(reg11)) >> $signed((8'haf)));
  always
    @(posedge clk) begin
      reg31 <= $signed(reg18[(1'h0):(1'h0)]);
      reg32 <= wire28;
      if ((wire5[(4'hc):(3'h7)] ?
          wire2[(3'h5):(3'h4)] : (+(($signed(reg27) ?
                  reg32[(1'h0):(1'h0)] : (reg16 ~^ reg15)) ?
              $signed((reg26 ? reg10 : wire1)) : $unsigned(reg9)))))
        begin
          reg33 <= reg25[(3'h5):(3'h4)];
        end
      else
        begin
          reg33 <= (reg24[(3'h5):(2'h2)] - $unsigned((wire0 <= (~&$signed((8'hb7))))));
          reg34 <= $signed($signed(reg20[(4'he):(3'h7)]));
          if ((((-(reg15 ^ $signed(reg8))) ?
                  $signed(reg23) : reg10[(2'h3):(2'h2)]) ?
              (&((8'ha9) >>> ((+(8'hbe)) ?
                  $unsigned((8'ha0)) : (reg25 < reg16)))) : wire28))
            begin
              reg35 <= reg25;
            end
          else
            begin
              reg35 <= reg8;
              reg36 <= ({(|(~^{(8'hb7), reg10}))} ?
                  $unsigned({reg22}) : ($signed((reg8[(3'h4):(2'h2)] ?
                      (wire29 ?
                          (8'hb2) : reg8) : (~&wire3))) ^~ ($unsigned(reg6) ?
                      reg16 : ($signed(wire2) * reg18))));
              reg37 <= $signed({$unsigned($unsigned(reg20)), reg36});
              reg38 <= (8'ha4);
              reg39 <= $unsigned(reg36);
            end
        end
      reg40 <= wire28;
    end
  assign wire41 = wire0[(4'he):(2'h2)];
  module42 #() modinst112 (wire111, clk, wire3, reg12, reg11, reg7, reg39);
  assign wire113 = (reg34[(4'hb):(1'h1)] ? reg35 : reg26);
  assign wire114 = reg22;
  assign wire115 = wire30[(2'h2):(2'h2)];
  assign wire116 = wire28;
endmodule

module module42
#(parameter param109 = (&((((8'had) != ((8'haa) && (8'h9c))) ? (((8'hb8) ? (8'h9c) : (8'hb7)) >> ((8'hae) | (8'haa))) : {((8'hb0) | (8'h9e)), ((8'haa) ? (7'h44) : (8'hb0))}) * (^(-((8'hb8) || (8'ha8)))))), 
parameter param110 = param109)
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire47;
  input wire signed [(5'h11):(1'h0)] wire46;
  input wire [(5'h14):(1'h0)] wire45;
  input wire signed [(4'hc):(1'h0)] wire44;
  input wire signed [(4'hd):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire108;
  wire signed [(3'h4):(1'h0)] wire106;
  wire signed [(4'h9):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire56;
  wire signed [(5'h10):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  assign y = {wire108,
                 wire106,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire49,
                 wire48,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 (1'h0)};
  assign wire48 = $unsigned(wire45);
  assign wire49 = $signed($unsigned($signed({$signed(wire47)})));
  always
    @(posedge clk) begin
      reg50 <= ($unsigned((-($signed(wire47) - ((8'hb5) <= (8'hba))))) ^~ ((8'ha5) ?
          (wire47 << ({wire47} ?
              (wire43 ? wire45 : wire47) : {wire49})) : $unsigned(wire44)));
      reg51 <= (({$unsigned($unsigned(wire45)),
          reg50} + wire48[(1'h0):(1'h0)]) || wire49[(2'h2):(1'h1)]);
      reg52 <= ($unsigned((wire44[(1'h0):(1'h0)] >> wire46[(1'h0):(1'h0)])) << $unsigned(wire45[(4'hb):(1'h1)]));
      reg53 <= $unsigned((8'hb9));
    end
  assign wire54 = $signed((|(reg50 >= $unsigned(wire49))));
  assign wire55 = (|((&{(wire43 ? wire47 : wire47)}) ?
                      $signed((~|$unsigned(reg52))) : $signed(reg51)));
  assign wire56 = $signed($unsigned(reg53[(2'h3):(1'h0)]));
  assign wire57 = (($signed((wire48 ?
                          $signed((8'ha0)) : (wire46 ?
                              reg50 : reg50))) < $unsigned($unsigned($unsigned(wire49)))) ?
                      ((!$signed($signed(reg51))) << wire47) : $signed(($signed(((8'ha1) ?
                              reg50 : wire48)) ?
                          wire43 : $signed($unsigned(wire56)))));
  assign wire58 = ({(|(&wire47[(1'h1):(1'h1)]))} ?
                      wire48 : (~^wire49[(2'h3):(2'h3)]));
  assign wire59 = ((wire44 ?
                          (((-(7'h40)) ?
                              (wire56 * (8'hb6)) : (reg52 ?
                                  wire46 : (8'hb8))) < $signed(wire48)) : $signed(wire55)) ?
                      ({$unsigned($signed(wire57)), {(-wire55)}} ?
                          (+$unsigned((!wire44))) : wire49) : (wire48[(3'h4):(2'h2)] >> $unsigned($unsigned(wire54))));
  assign wire60 = wire46;
  assign wire61 = wire56;
  always
    @(posedge clk) begin
      reg62 <= $unsigned(wire61[(2'h2):(1'h0)]);
      reg63 <= {wire56[(2'h3):(1'h1)],
          $signed((({reg51, reg50} ? (-(8'ha9)) : $unsigned(wire44)) ?
              ((reg62 >>> wire43) ?
                  (wire46 ^ reg51) : {wire59, reg62}) : $unsigned(reg52)))};
      if (reg50)
        begin
          reg64 <= reg51[(4'hd):(4'hc)];
          reg65 <= (&wire60[(4'hb):(3'h7)]);
          reg66 <= ((wire49[(2'h2):(2'h2)] ?
                  $signed(((~&wire58) ?
                      {wire56} : (wire48 ?
                          reg65 : reg64))) : (|((wire57 ~^ reg51) ?
                      reg50 : (~^reg50)))) ?
              {$unsigned(reg63)} : $signed(((reg52[(4'ha):(3'h4)] && {(8'hb1)}) || wire60[(4'ha):(4'h8)])));
          reg67 <= wire47[(3'h4):(3'h4)];
        end
      else
        begin
          if (wire59[(3'h4):(2'h2)])
            begin
              reg64 <= ((7'h44) > (reg66 ?
                  reg63[(3'h6):(2'h2)] : $signed(wire61)));
              reg65 <= ($unsigned({reg62, (~&$unsigned((8'hb7)))}) ?
                  (^(&$unsigned($unsigned(wire47)))) : (($signed((wire44 ?
                          reg51 : wire56)) ?
                      (+$signed(reg52)) : reg64[(4'h8):(4'h8)]) != reg64[(3'h4):(3'h4)]));
            end
          else
            begin
              reg64 <= $unsigned({reg52});
            end
          reg66 <= $signed(((~&reg64[(2'h3):(1'h0)]) >> reg51));
          reg67 <= reg64;
        end
      reg68 <= ({{(reg67 < reg50), (&$signed(wire45))}, wire48} ?
          wire59[(3'h4):(2'h2)] : reg66[(2'h3):(1'h1)]);
    end
  module69 #() modinst107 (wire106, clk, reg63, reg62, wire60, reg64, wire44);
  assign wire108 = wire48[(2'h3):(2'h2)];
endmodule

module module69
#(parameter param104 = (((~^((8'ha5) ? ((8'hb9) ? (7'h41) : (8'hae)) : ((8'ha2) ? (7'h41) : (8'hb8)))) != (((8'h9e) >= ((8'ha6) << (8'ha9))) >> (^~((8'hbd) << (8'hbf))))) ? (((((8'hb6) ? (8'hb4) : (8'ha0)) ? {(8'hbe), (8'ha6)} : (~&(8'ha6))) * (((8'ha4) ? (8'h9f) : (8'hb3)) ? ((8'hbd) ? (8'ha7) : (8'hb3)) : {(8'ha1)})) ? (~|(^((8'hbc) <<< (8'hb2)))) : ((((7'h41) | (8'hba)) || (-(8'hbe))) * (((8'h9f) ? (8'ha6) : (8'hac)) ? ((8'ha6) ? (8'ha2) : (8'hae)) : ((8'ha2) ? (8'h9d) : (8'hb5))))) : (((((8'ha4) ? (8'had) : (8'hb5)) ? ((8'ha1) ? (8'hbe) : (8'hb2)) : ((8'haa) == (8'ha8))) + (^~{(8'hbc), (8'hb2)})) <= ((((8'hb6) ? (8'hb4) : (8'h9d)) ? (~(8'h9d)) : ((8'ha4) > (7'h43))) & (((8'hae) ? (8'ha1) : (8'hbf)) == ((8'ha7) >= (7'h42)))))), 
parameter param105 = (((((param104 * param104) ^ {param104}) ? {param104} : (~(param104 ? (8'hb4) : param104))) ? param104 : (param104 << ((param104 ? param104 : param104) * {param104, param104}))) | param104))
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire74;
  input wire signed [(4'hd):(1'h0)] wire73;
  input wire [(4'h9):(1'h0)] wire72;
  input wire signed [(3'h4):(1'h0)] wire71;
  input wire [(4'hc):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire103;
  wire [(4'hc):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire signed [(4'hc):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire95;
  wire [(3'h5):(1'h0)] wire91;
  wire signed [(3'h6):(1'h0)] wire75;
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire91,
                 wire75,
                 reg94,
                 reg93,
                 reg92,
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
                 (1'h0)};
  assign wire75 = $unsigned(wire72);
  always
    @(posedge clk) begin
      if (wire72[(1'h0):(1'h0)])
        begin
          reg76 <= wire73;
          if (((&$signed(wire74[(2'h2):(1'h1)])) ?
              ($unsigned(wire73[(3'h5):(3'h4)]) ?
                  wire75[(1'h1):(1'h0)] : (wire70 ?
                      wire72[(1'h0):(1'h0)] : (((8'hbc) ? wire72 : wire70) ?
                          (wire75 ?
                              wire71 : wire72) : ((8'hb2) != wire74)))) : wire74[(1'h1):(1'h1)]))
            begin
              reg77 <= wire71;
              reg78 <= reg77;
              reg79 <= (~(wire74[(1'h0):(1'h0)] | $signed(((7'h44) ?
                  $signed(wire73) : reg78[(3'h7):(1'h1)]))));
              reg80 <= (~|$unsigned((^wire75[(3'h5):(3'h4)])));
            end
          else
            begin
              reg77 <= $unsigned((8'hb4));
              reg78 <= $unsigned((((reg78 - (wire73 * (8'ha2))) ?
                      ((wire71 >> reg76) ?
                          (|reg77) : reg78[(3'h6):(3'h4)]) : $unsigned($signed(wire70))) ?
                  $signed((wire74 <= ((7'h44) ?
                      wire71 : wire71))) : $signed($unsigned(wire70[(1'h1):(1'h1)]))));
              reg79 <= reg78;
              reg80 <= ($unsigned(((!(~&wire73)) ?
                      ($signed(wire70) + ((7'h42) ^ wire72)) : wire73)) ?
                  ((8'haf) - (reg77[(2'h2):(2'h2)] ~^ {((8'haf) < (8'ha2))})) : $unsigned((+wire71[(3'h4):(1'h1)])));
            end
          reg81 <= wire75;
          reg82 <= ($signed(((&(wire75 ?
                  wire70 : wire71)) ~^ (~|$unsigned(wire75)))) ?
              reg80[(2'h3):(2'h2)] : reg80);
        end
      else
        begin
          reg76 <= reg81;
          reg77 <= $signed(wire75[(2'h3):(2'h2)]);
        end
      if (wire73)
        begin
          reg83 <= (+reg76[(4'ha):(3'h6)]);
          reg84 <= wire75[(1'h1):(1'h1)];
          reg85 <= (~&$signed($unsigned({$unsigned(reg82), {(8'ha8)}})));
          reg86 <= (8'hb7);
          reg87 <= reg79;
        end
      else
        begin
          reg83 <= ((-$unsigned(wire70[(4'hb):(3'h4)])) ?
              ((^~{reg82}) ?
                  wire74 : ((&(reg82 ?
                      wire74 : reg83)) & $signed(reg76[(1'h0):(1'h0)]))) : reg83[(4'ha):(4'ha)]);
        end
      reg88 <= reg84[(3'h6):(2'h3)];
      reg89 <= $signed({(((~|(8'hb3)) ? (~wire71) : (8'ha3)) ?
              ((8'hba) ? reg79 : (reg83 <<< (8'had))) : reg85),
          (!(-(8'hb4)))});
      reg90 <= $unsigned(reg79);
    end
  assign wire91 = (~(reg78 ?
                      $signed($signed((wire75 ?
                          reg82 : (8'ha3)))) : ($signed((~^(8'ha3))) ?
                          ((|wire75) ?
                              (reg89 ^ wire75) : wire70) : $signed((reg87 ?
                              reg77 : wire71)))));
  always
    @(posedge clk) begin
      reg92 <= $unsigned((wire74 <= $signed(({reg83} ?
          {reg89, (8'ha6)} : (wire73 & reg88)))));
      reg93 <= (($signed((~&wire74)) * $unsigned((~|(8'hb9)))) != (reg79[(4'hd):(4'h9)] | $signed($signed((8'haf)))));
      reg94 <= reg78;
    end
  assign wire95 = ({reg81} ~^ ($signed(((reg94 * (8'h9e)) ?
                          (7'h44) : $signed(wire70))) ?
                      reg89[(4'hf):(3'h7)] : reg78));
  assign wire96 = $unsigned($unsigned($signed($unsigned((~|wire95)))));
  assign wire97 = ($signed((!$signed((reg85 ? reg83 : reg85)))) ?
                      $signed(((8'hbc) ^~ (!(~^wire91)))) : (((~&reg77[(4'ha):(1'h1)]) > {wire70[(3'h6):(2'h3)]}) ?
                          reg77[(4'hb):(1'h0)] : $unsigned(reg83[(2'h3):(1'h1)])));
  assign wire98 = (((~$signed(reg86)) != wire96) ?
                      ((~wire75) != (wire96 ?
                          (8'haa) : $unsigned((reg89 != wire91)))) : (((wire70 | $signed(reg89)) ?
                              reg77[(3'h4):(1'h1)] : $signed((reg85 <<< reg83))) ?
                          (((^~wire70) * ((8'hb7) << reg90)) ?
                              (reg85 ?
                                  $signed(reg85) : {reg94}) : (^~reg94)) : (~wire70)));
  assign wire99 = (!($unsigned($signed(reg84)) ?
                      $signed((!(reg83 ?
                          reg93 : wire91))) : $unsigned((reg92 ~^ reg80[(3'h7):(3'h6)]))));
  assign wire100 = $signed(reg77[(4'he):(2'h3)]);
  assign wire101 = $signed(wire99[(3'h5):(1'h1)]);
  assign wire102 = wire101;
  assign wire103 = reg92;
endmodule
