module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire84;
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire15,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire39,
                 wire41,
                 wire84,
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
                 reg88,
                 reg42,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  module5 #() modinst16 (wire15, clk, wire1, wire0, wire4, wire2);
  assign wire17 = ($signed(wire15) & wire2);
  assign wire18 = (wire17 ?
                      ($unsigned(($signed(wire4) ?
                          {(8'ha8)} : (wire4 ?
                              (8'ha1) : wire15))) | (($signed(wire17) ?
                              {wire4} : (^~wire1)) ?
                          (^~$unsigned(wire1)) : $unsigned($unsigned(wire15)))) : wire0[(4'ha):(3'h4)]);
  assign wire19 = $signed((^($signed(wire4[(2'h3):(1'h0)]) >>> $signed((-wire4)))));
  assign wire20 = wire17;
  always
    @(posedge clk) begin
      if (wire15)
        begin
          reg21 <= wire2;
          if ($signed(wire0))
            begin
              reg22 <= $unsigned({$signed($unsigned((wire1 + reg21))),
                  $signed({(wire0 + wire19)})});
              reg23 <= (^(wire15 >= wire2));
              reg24 <= wire3[(1'h1):(1'h1)];
              reg25 <= wire2;
            end
          else
            begin
              reg22 <= (|wire4[(1'h1):(1'h0)]);
              reg23 <= $unsigned({(~{wire3}),
                  {$signed(((8'hab) || (8'hb0))),
                      (wire3 ? (~|reg23) : wire3[(1'h1):(1'h0)])}});
              reg24 <= ($signed(($unsigned($signed(wire1)) - (~^$signed((8'hb1))))) - (~&(^$unsigned($unsigned(reg25)))));
              reg25 <= {(($signed(wire20) ?
                      ((reg24 ?
                          wire20 : wire20) && (reg25 + wire15)) : (&$signed(reg24))) > (wire15 <<< (-wire20[(4'he):(4'hb)])))};
              reg26 <= (&$unsigned({({wire18} ?
                      $signed(wire2) : ((8'h9e) ? wire2 : wire19)),
                  wire3[(1'h0):(1'h0)]}));
            end
        end
      else
        begin
          reg21 <= reg21;
          reg22 <= reg23[(4'he):(1'h0)];
        end
    end
  module27 #() modinst40 (.wire31(wire4), .wire28(wire20), .wire29(wire3), .y(wire39), .wire30(wire0), .clk(clk));
  assign wire41 = wire4;
  always
    @(posedge clk) begin
      reg42 <= {($signed({$signed(reg22)}) ?
              (7'h43) : $signed(((wire2 ? wire39 : reg26) ?
                  (^(8'hb9)) : $signed(reg24)))),
          (~reg26[(2'h2):(1'h0)])};
    end
  module43 #() modinst85 (.y(wire84), .wire47(reg21), .wire45(wire20), .wire44(wire2), .wire48(wire17), .clk(clk), .wire46(reg23));
  assign wire86 = ({($signed((wire84 ?
                          (8'hbb) : wire15)) != $signed(wire3))} != reg22[(1'h0):(1'h0)]);
  assign wire87 = reg23;
  always
    @(posedge clk) begin
      reg88 <= (^($signed($signed((wire20 ?
          reg25 : reg26))) << $signed($unsigned(reg26))));
      reg89 <= (wire3 > (($unsigned($unsigned(wire3)) - $unsigned($signed(wire39))) ?
          $unsigned((~$signed((8'hb1)))) : {(8'hb6), {$unsigned(wire86)}}));
    end
  always
    @(posedge clk) begin
      reg90 <= reg88;
      if ($signed(($signed(wire17) ?
          wire4[(2'h2):(1'h0)] : (|wire84[(1'h0):(1'h0)]))))
        begin
          reg91 <= ({$unsigned($signed($unsigned(wire15)))} >>> (-$signed(({wire15} || (reg25 ?
              reg22 : wire2)))));
          reg92 <= (-wire86);
          reg93 <= $unsigned(wire84);
          reg94 <= (^~(reg90[(1'h0):(1'h0)] ?
              (|wire0[(3'h7):(3'h4)]) : ((reg93[(2'h2):(1'h0)] >>> (wire17 <<< wire0)) != $signed($unsigned(wire20)))));
          reg95 <= $unsigned((({reg89[(1'h1):(1'h1)]} < (~&wire2[(4'h9):(4'h9)])) ~^ reg88[(2'h3):(2'h2)]));
        end
      else
        begin
          reg91 <= ({reg92} ?
              $unsigned(reg88[(5'h11):(4'h9)]) : $signed(((reg24[(3'h4):(3'h4)] ?
                  (wire1 ? (8'hb6) : reg92) : (reg22 || wire41)) < ((8'hbb) ?
                  reg88 : $signed(wire41)))));
          reg92 <= reg88;
          reg93 <= reg25;
        end
      if ($signed((+wire2[(4'hb):(3'h6)])))
        begin
          if (reg23)
            begin
              reg96 <= ({$signed($unsigned((wire2 ?
                      wire86 : wire19)))} ^~ $signed(wire19));
              reg97 <= (wire15[(3'h5):(1'h1)] | (|wire4));
              reg98 <= $unsigned(($signed($signed(wire39)) && ({$signed(wire15)} ^~ (-{wire15}))));
              reg99 <= (reg95[(5'h12):(2'h2)] ?
                  (8'hac) : wire20[(4'h9):(2'h2)]);
            end
          else
            begin
              reg96 <= {$signed($signed($unsigned(wire0))), wire86};
              reg97 <= $signed((((!wire0[(1'h1):(1'h1)]) ?
                  $signed((reg42 < (8'hbe))) : (~^(reg95 | reg88))) ~^ $unsigned($unsigned($unsigned(reg93)))));
              reg98 <= ((!((8'hbf) ?
                  ((^~wire39) ?
                      (wire86 != (8'hb9)) : reg88[(3'h7):(1'h1)]) : wire2[(4'ha):(3'h6)])) * $signed($unsigned((!{reg22,
                  reg42}))));
              reg99 <= wire87;
              reg100 <= ((&(($signed((8'ha9)) ? (!reg89) : reg94) ?
                      wire41[(1'h0):(1'h0)] : (reg42 ?
                          $unsigned(wire17) : (reg98 ? reg96 : reg95)))) ?
                  {wire87, ($unsigned((~^wire18)) && wire2)} : reg91);
            end
          if (wire19[(3'h5):(2'h2)])
            begin
              reg101 <= (((8'ha4) >= {(-(-(8'hbf))),
                      (~&wire3[(3'h4):(2'h2)])}) ?
                  (reg24[(3'h4):(3'h4)] ?
                      ((+(reg92 ? reg93 : wire20)) ?
                          $unsigned($signed(reg22)) : $signed((wire4 ^ reg42))) : $signed((wire86 << (~^wire15)))) : wire2);
            end
          else
            begin
              reg101 <= (+(reg96 == reg26));
            end
          reg102 <= (((reg23 ?
                      (wire19[(3'h4):(2'h2)] ?
                          (8'hbf) : reg91[(4'ha):(2'h3)]) : {(wire84 ?
                              wire20 : reg89),
                          $signed(wire1)}) ?
                  (wire39[(2'h2):(1'h0)] ?
                      reg95[(4'hc):(1'h1)] : $signed((+reg96))) : $unsigned(wire18[(4'hc):(1'h1)])) ?
              reg97[(4'hd):(4'hd)] : wire1);
        end
      else
        begin
          if (({$signed(wire19),
              (^(wire87 == wire39))} && $signed({reg90[(2'h2):(1'h1)]})))
            begin
              reg96 <= $unsigned(wire18);
              reg97 <= wire18;
              reg98 <= wire0;
              reg99 <= ({{$signed($unsigned(reg97))},
                      (wire4[(3'h5):(2'h3)] || $signed(reg25[(1'h1):(1'h0)]))} ?
                  reg98 : wire18[(3'h5):(2'h3)]);
            end
          else
            begin
              reg96 <= $signed($unsigned($unsigned($signed((wire41 ^~ reg98)))));
            end
          if ({$unsigned((reg88 ?
                  (reg101 ?
                      (reg24 ?
                          wire15 : wire41) : {reg25}) : (reg92 ~^ $unsigned((8'hb3))))),
              $signed(reg89[(1'h0):(1'h0)])})
            begin
              reg100 <= $unsigned((({{wire1, reg97},
                      (wire39 ? reg23 : wire87)} ?
                  reg88[(4'he):(4'h8)] : $signed($signed(reg89))) | {((reg92 << (8'hbb)) >>> reg92[(3'h7):(3'h7)])}));
              reg101 <= ({wire4, $signed(reg21)} * (~$signed((~&{reg99,
                  reg97}))));
            end
          else
            begin
              reg100 <= $unsigned((~&((+((8'haa) * (8'ha1))) ?
                  (8'hb9) : wire3)));
              reg101 <= $signed(wire2[(4'h9):(3'h4)]);
              reg102 <= (((wire87[(4'h8):(1'h0)] ?
                      $unsigned((!reg95)) : {(8'hab)}) | reg100[(1'h0):(1'h0)]) ?
                  $unsigned($unsigned((8'hb5))) : {{((+wire15) ?
                              reg92 : (wire20 ? reg42 : reg24)),
                          (+wire19[(3'h4):(3'h4)])}});
            end
          reg103 <= reg100[(3'h5):(1'h0)];
          reg104 <= {$unsigned($unsigned((&$signed(wire17)))),
              wire19[(1'h1):(1'h0)]};
          reg105 <= ((wire4 ?
              {({reg25} ? reg22[(3'h6):(3'h4)] : reg89),
                  $signed(reg97[(3'h7):(3'h7)])} : $signed({reg103,
                  (8'h9c)})) | (reg21[(3'h6):(3'h6)] ?
              $unsigned($signed((|(8'hb5)))) : $signed((^$unsigned((7'h42))))));
        end
    end
endmodule

module module43
#(parameter param82 = ((^((~^((8'hb6) ? (8'ha3) : (7'h42))) != (~^(~&(8'hbd))))) << (((~((7'h43) & (8'h9e))) - {((8'hbd) ? (8'ha2) : (8'hb4))}) | ((((8'hb4) | (8'hb6)) - ((8'ha2) ? (7'h40) : (8'hae))) ? (7'h43) : (((8'ha9) && (8'ha5)) >= (+(8'hb1)))))), 
parameter param83 = ((^~((param82 << {param82}) ? (8'ha5) : (param82 ? ((8'hbc) ? param82 : param82) : {param82, param82}))) ? (^(~|(^~param82))) : {(((param82 ? param82 : param82) ^~ {(7'h40)}) && param82)}))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire48;
  input wire signed [(4'hb):(1'h0)] wire47;
  input wire [(2'h3):(1'h0)] wire46;
  input wire signed [(5'h10):(1'h0)] wire45;
  input wire [(3'h4):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  assign y = {wire78,
                 wire76,
                 wire50,
                 wire49,
                 reg81,
                 reg80,
                 reg79,
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
                 reg63,
                 reg64,
                 (1'h0)};
  assign wire49 = $unsigned(wire48);
  assign wire50 = $signed(((({wire48, wire45} ?
                      (wire49 && wire49) : wire48) >>> wire48) - (wire46 ?
                      wire48[(2'h2):(1'h1)] : wire46[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      if (wire49)
        begin
          reg51 <= (wire49 & (|$signed((^{wire48, wire47}))));
          if ({wire50})
            begin
              reg52 <= (({{$signed(wire44), $unsigned(wire46)},
                  wire47[(1'h0):(1'h0)]} + reg51) == (-wire49[(3'h7):(2'h3)]));
              reg53 <= (8'hb0);
              reg54 <= ((({$unsigned(reg51),
                      $unsigned(reg51)} * $signed((-reg51))) ?
                  wire50 : ({$signed(reg52),
                      $unsigned(wire46)} != (+reg53))) - reg52[(1'h1):(1'h1)]);
              reg55 <= wire48;
            end
          else
            begin
              reg52 <= {wire49[(1'h0):(1'h0)]};
            end
        end
      else
        begin
          reg51 <= (!($unsigned(((8'hbd) == $signed(reg55))) && (reg52[(3'h6):(3'h4)] ?
              $unsigned((-reg54)) : $signed((reg55 ? reg53 : reg51)))));
          reg52 <= ($signed($unsigned({{reg52,
                  wire44}})) >>> $unsigned(({$signed(wire49), $signed(wire48)} ?
              reg52[(2'h2):(2'h2)] : ($signed((7'h42)) ?
                  $unsigned(wire48) : $unsigned(reg55)))));
          if (reg52)
            begin
              reg53 <= (^(wire48 & wire44[(2'h2):(1'h1)]));
              reg54 <= $unsigned(($unsigned(((&wire46) << $signed(wire44))) - reg52[(3'h4):(2'h3)]));
              reg55 <= wire47[(1'h1):(1'h1)];
            end
          else
            begin
              reg53 <= $signed($signed((((!reg51) ?
                  reg53[(1'h1):(1'h1)] : wire45[(4'hf):(3'h7)]) ~^ wire48[(4'h9):(1'h0)])));
            end
          reg56 <= $unsigned($unsigned((!(~&(wire44 ? wire46 : reg53)))));
          reg57 <= (((~&(8'hac)) ?
                  $unsigned(($unsigned(reg51) - reg52)) : ($signed((reg53 ~^ reg53)) ?
                      (reg52[(3'h4):(3'h4)] ?
                          $unsigned(wire46) : ((8'hb9) ?
                              reg54 : reg55)) : wire44[(2'h2):(1'h0)])) ?
              $unsigned(reg54) : $signed($signed($signed((reg54 ?
                  reg52 : wire45)))));
        end
      reg58 <= {((8'hae) ~^ $unsigned((~^{reg54, wire45}))),
          reg55[(1'h0):(1'h0)]};
      reg59 <= reg57;
      reg60 <= (^~{(!$signed({(7'h44)}))});
      if ((reg58[(4'ha):(3'h6)] ? reg51 : $signed($unsigned($signed(wire47)))))
        begin
          reg61 <= ($signed(($signed({reg53,
              reg56}) >>> wire47)) && (reg59[(3'h4):(2'h3)] <= {$signed((wire45 ?
                  wire47 : (7'h40)))}));
        end
      else
        begin
          if (wire49)
            begin
              reg61 <= wire44[(2'h2):(2'h2)];
              reg62 <= (wire50[(4'h9):(1'h1)] > reg58);
              reg63 <= (8'hae);
            end
          else
            begin
              reg61 <= ($unsigned((~^(^~(!reg53)))) << (($unsigned($unsigned(wire50)) | (((8'ha4) ?
                          reg57 : (8'ha7)) ?
                      (~|reg59) : $signed(wire46))) ?
                  {($unsigned(reg53) <= ((8'hba) ?
                          (8'hab) : reg53))} : wire49));
              reg62 <= $unsigned(($unsigned((reg59[(3'h7):(1'h0)] ^~ $unsigned(reg61))) && ((~&wire48[(3'h4):(1'h0)]) ?
                  (^(&(8'hb4))) : ($unsigned(reg60) ?
                      $unsigned(reg62) : {reg63}))));
              reg63 <= reg58[(3'h5):(3'h4)];
            end
          reg64 <= ($unsigned(reg55) >= {($unsigned((reg60 ?
                  reg59 : reg56)) != {reg51[(4'hb):(1'h1)],
                  wire46[(1'h1):(1'h1)]})});
        end
    end
  module65 #() modinst77 (.wire69(wire48), .wire66(reg54), .wire70(reg52), .wire67(reg58), .y(wire76), .clk(clk), .wire68(wire44));
  assign wire78 = $signed($signed(($signed($unsigned(wire49)) ?
                      wire46[(1'h0):(1'h0)] : $signed((reg54 & reg54)))));
  always
    @(posedge clk) begin
      reg79 <= $unsigned($unsigned($unsigned((+(reg62 == reg52)))));
      reg80 <= $signed(reg54);
      reg81 <= {((~^(reg58[(5'h10):(3'h7)] != (~&reg53))) & (~|(wire78 ?
              (!wire46) : reg56)))};
    end
endmodule

module module27
#(parameter param37 = ((^~(((~&(8'ha7)) ? (~|(8'hb9)) : ((8'h9f) ? (8'ha4) : (8'hb2))) ? (|(~&(7'h44))) : (|(!(8'hb2))))) || {(!(-((8'hab) ? (7'h44) : (8'hb0))))}), 
parameter param38 = param37)
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire31;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire signed [(4'hd):(1'h0)] wire29;
  input wire [(4'hf):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire32;
  assign y = {wire36, wire35, wire34, wire33, wire32, (1'h0)};
  assign wire32 = wire30[(4'hf):(4'h9)];
  assign wire33 = ($signed((~wire32)) ?
                      $unsigned({wire31, (^~{wire31, wire28})}) : (8'h9d));
  assign wire34 = $unsigned(wire32[(3'h6):(3'h6)]);
  assign wire35 = (({(wire31[(4'hd):(4'hc)] ?
                              $signed(wire33) : {wire34})} < wire31[(4'hb):(4'hb)]) ?
                      $signed($unsigned(((wire32 != wire28) ?
                          (wire31 ?
                              wire28 : (7'h40)) : (8'ha3)))) : $signed(wire31));
  assign wire36 = wire29[(1'h1):(1'h1)];
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  assign y = {wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = $unsigned(((~&$signed($signed(wire8))) ?
                      $unsigned($signed((wire7 ? wire8 : (8'hb1)))) : wire8));
  assign wire11 = $signed(wire10[(3'h5):(3'h4)]);
  assign wire12 = (wire8 <= $signed($signed({$unsigned(wire9),
                      (wire9 | wire10)})));
  assign wire13 = (~^{(+(wire12[(3'h4):(1'h1)] ?
                          $unsigned(wire7) : (wire9 - wire11))),
                      (8'hbb)});
  assign wire14 = ($unsigned($unsigned({wire10[(4'ha):(3'h7)]})) ?
                      (($unsigned($unsigned(wire10)) || $signed((wire13 >= wire6))) & {((~&wire10) ?
                              (&(8'hbe)) : (wire13 ? wire11 : wire11)),
                          (~&(^wire12))}) : wire6);
endmodule

module module65  (y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire70;
  input wire [(2'h3):(1'h0)] wire69;
  input wire [(3'h4):(1'h0)] wire68;
  input wire [(5'h12):(1'h0)] wire67;
  input wire [(4'h9):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire71;
  assign y = {wire75, wire74, wire73, wire72, wire71, (1'h0)};
  assign wire71 = wire70[(3'h7):(2'h3)];
  assign wire72 = (~^$signed($unsigned($signed($signed(wire66)))));
  assign wire73 = wire69;
  assign wire74 = ($signed({(wire71[(4'h9):(2'h3)] + wire66[(3'h4):(1'h0)]),
                          (^~wire71)}) ?
                      (!(-wire70)) : {$unsigned($signed(((8'ha2) ?
                              wire72 : wire69))),
                          wire72[(3'h6):(3'h6)]});
  assign wire75 = ((($unsigned($signed(wire71)) << wire71) == wire74[(1'h1):(1'h0)]) || ((wire69 || wire68) ?
                      $unsigned((-(wire69 ?
                          wire71 : wire72))) : wire74[(3'h4):(1'h1)]));
endmodule
