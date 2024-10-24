module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h24a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire98;
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire100,
                 wire29,
                 wire98,
                 reg51,
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
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire4;
      if ($signed(({(~^(wire1 ?
              wire4 : reg5))} | $signed((wire0 <<< (reg5 != wire1))))))
        begin
          reg6 <= (wire0 ?
              ((((wire1 != (8'hb0)) ?
                      (~&wire4) : {(8'hb8)}) ^~ {$unsigned(wire1),
                      wire2[(1'h1):(1'h0)]}) ?
                  wire1 : (+$unsigned(((8'hb7) != (8'hac))))) : {reg5[(1'h0):(1'h0)]});
        end
      else
        begin
          if ($signed({{(wire2 ? $signed(reg5) : $signed((8'haa)))}}))
            begin
              reg6 <= reg6;
              reg7 <= (wire2[(1'h0):(1'h0)] ?
                  wire1 : {(reg5[(1'h1):(1'h1)] != (wire3[(2'h2):(1'h0)] ?
                          (reg5 | wire3) : $unsigned(wire3))),
                      (!($signed(wire3) ? wire4 : (wire0 ? (8'hbd) : wire4)))});
            end
          else
            begin
              reg6 <= wire4[(3'h4):(1'h1)];
            end
          if ({((-(reg5[(2'h3):(2'h2)] > (^~wire4))) || $signed(($unsigned(wire1) ^~ (wire3 ?
                  reg7 : wire2)))),
              {$signed($signed((~&(8'hba))))}})
            begin
              reg8 <= wire4[(1'h0):(1'h0)];
              reg9 <= {(wire1 ?
                      {reg8[(5'h10):(2'h3)]} : (!$unsigned((reg5 ?
                          wire1 : wire2)))),
                  (8'hb8)};
              reg10 <= $unsigned((wire0[(4'h9):(4'h8)] ~^ $signed({(wire1 ?
                      reg8 : reg9)})));
            end
          else
            begin
              reg8 <= {wire0};
              reg9 <= $signed($unsigned((8'hb9)));
              reg10 <= $signed($unsigned((~&$unsigned($unsigned(wire0)))));
              reg11 <= reg9[(2'h2):(2'h2)];
            end
          reg12 <= $unsigned(reg5);
          if (($unsigned(($signed(((8'ha5) ? wire3 : wire1)) != reg5)) ?
              $signed({{(wire0 == wire4)},
                  ($unsigned(reg11) ?
                      (~^wire3) : reg8[(4'he):(3'h7)])}) : wire4[(2'h3):(2'h3)]))
            begin
              reg13 <= $unsigned($unsigned(reg6));
              reg14 <= reg13[(4'hb):(4'ha)];
              reg15 <= $signed($signed((((reg6 ? wire4 : wire4) ?
                      (reg13 ^ reg9) : $signed(reg8)) ?
                  $signed((reg13 >> reg11)) : reg13)));
              reg16 <= (^~{({(wire0 ? wire1 : reg11)} || reg9),
                  reg8[(4'h8):(4'h8)]});
              reg17 <= ({$signed(wire4)} == ((((8'hbb) || (^~(8'haa))) ?
                  (+$signed((7'h44))) : ($signed(reg8) + (|reg14))) <= (reg8 ?
                  $unsigned((reg14 ^~ wire1)) : ($signed(reg9) ?
                      (wire4 ? wire2 : (8'hbf)) : wire2))));
            end
          else
            begin
              reg13 <= ($unsigned((^~wire4)) ?
                  (($unsigned((7'h41)) && (~&(^reg13))) && (^{(~|wire3),
                      (~reg12)})) : {(reg16 == reg7[(1'h1):(1'h1)]),
                      ({(reg8 << reg10), $signed((7'h40))} ?
                          reg10 : (reg7 + (reg17 ? reg12 : reg7)))});
              reg14 <= ($unsigned(reg13[(3'h6):(2'h2)]) ^~ {reg8[(4'hb):(2'h3)],
                  (wire0[(4'h9):(1'h1)] ?
                      (^(!(8'hac))) : wire0[(3'h6):(3'h6)])});
            end
        end
      reg18 <= reg5[(1'h1):(1'h1)];
      reg19 <= (reg8 <= reg9);
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(($unsigned({reg13, reg12}) ?
          {reg14} : ({wire1} ? $signed(reg12) : $signed((8'hb2)))))))
        begin
          if (reg11)
            begin
              reg20 <= reg14;
              reg21 <= (~reg10);
              reg22 <= {{($unsigned({reg17, reg12}) >>> reg13),
                      $unsigned((7'h43))}};
            end
          else
            begin
              reg20 <= (($unsigned((-reg10)) && ($signed($signed(reg10)) ^~ reg11[(4'hd):(3'h6)])) ?
                  (|(^$signed(reg15))) : $signed({$signed(wire3[(4'ha):(4'h9)]),
                      (((8'h9e) ? reg13 : (7'h43)) ?
                          $unsigned(wire4) : $unsigned(reg22))}));
              reg21 <= (reg15 | (~$signed((reg9[(1'h0):(1'h0)] ?
                  (reg5 ? reg19 : reg5) : $unsigned(reg16)))));
              reg22 <= {($signed(wire4[(3'h6):(3'h5)]) == {($signed(reg20) ?
                          (reg5 ? reg11 : reg15) : (reg10 ? wire1 : reg13))})};
              reg23 <= $unsigned((|reg12));
            end
          reg24 <= ($signed(wire3) ?
              (7'h40) : $signed(({(reg23 ?
                      reg18 : reg15)} >> $signed(reg13[(4'ha):(3'h6)]))));
          reg25 <= $signed($signed($signed($unsigned($unsigned(reg7)))));
          reg26 <= $unsigned(reg15[(1'h1):(1'h0)]);
          reg27 <= wire2;
        end
      else
        begin
          reg20 <= ((~|wire3) == (~^(^~$signed(reg24))));
          reg21 <= $unsigned($signed(wire2[(1'h0):(1'h0)]));
          reg22 <= $signed(reg23);
          reg23 <= $signed(reg25[(3'h6):(3'h4)]);
        end
      reg28 <= {$signed(reg12), (^wire3)};
    end
  assign wire29 = reg20[(4'hb):(3'h7)];
  always
    @(posedge clk) begin
      reg30 <= (^(($unsigned($signed(reg5)) >>> reg14[(4'hb):(3'h4)]) * (-wire4)));
      if (((^((^{reg5, reg7}) >> (^~reg13[(4'hc):(1'h1)]))) ?
          (^{(^$signed(wire4)),
              ((wire4 <= reg14) ?
                  reg11[(4'hf):(3'h6)] : $signed(reg11))}) : $signed($signed(reg17))))
        begin
          if ({(reg18 ?
                  ({{reg28}} ?
                      $unsigned((reg16 ?
                          reg13 : reg21)) : {$signed(wire4)}) : (reg18 ^~ $signed(reg11[(4'hc):(2'h2)])))})
            begin
              reg31 <= reg6;
              reg32 <= $unsigned((reg25[(2'h3):(2'h2)] && reg6[(4'h9):(4'h8)]));
              reg33 <= $unsigned((8'ha6));
              reg34 <= $unsigned($signed(reg22));
            end
          else
            begin
              reg31 <= ($unsigned($signed($unsigned((reg15 == wire1)))) ?
                  reg7[(2'h3):(1'h1)] : reg14[(3'h6):(2'h2)]);
              reg32 <= ((8'ha5) ? reg15 : reg33[(3'h4):(2'h2)]);
            end
          reg35 <= (~(~&reg12[(4'hf):(3'h5)]));
          reg36 <= wire3;
        end
      else
        begin
          reg31 <= reg30;
          reg32 <= ($signed((($unsigned(reg11) ?
              (~(8'ha1)) : (reg8 != (8'h9d))) ~^ $signed(reg33[(3'h4):(1'h0)]))) * (&reg33[(1'h0):(1'h0)]));
        end
      reg37 <= reg7;
      reg38 <= ((+(reg30[(1'h0):(1'h0)] ?
          reg21[(4'h8):(3'h5)] : $unsigned(reg20[(4'ha):(2'h2)]))) + $signed((((8'h9c) != reg6[(1'h0):(1'h0)]) ?
          ({reg21, reg20} ?
              (reg31 || reg15) : (reg13 ? reg26 : reg35)) : wire4)));
    end
  always
    @(posedge clk) begin
      reg39 <= {(((~$signed(reg5)) ?
                  reg13 : ($unsigned(reg26) > reg36[(3'h7):(2'h2)])) ?
              {$unsigned(wire29)} : ($signed((reg11 ? reg14 : (8'hbd))) ?
                  $signed(reg22) : (reg26 ? reg37 : $signed((7'h41)))))};
      if ((|($signed(wire1[(4'h9):(3'h6)]) ? $signed(reg8) : {reg24})))
        begin
          if ($unsigned($signed(wire1[(3'h5):(3'h5)])))
            begin
              reg40 <= reg23[(2'h3):(2'h2)];
              reg41 <= reg32;
              reg42 <= $signed((((^(reg18 <= reg35)) | (^(&(8'ha3)))) ?
                  $unsigned(wire29) : reg12));
            end
          else
            begin
              reg40 <= (reg8 ? (-(8'ha3)) : $unsigned((8'ha8)));
              reg41 <= (((reg41[(1'h1):(1'h1)] ?
                      $unsigned(reg24[(5'h13):(2'h3)]) : $signed((~|reg20))) ?
                  $signed(reg40[(3'h5):(2'h3)]) : reg24[(4'hc):(3'h7)]) & {reg21,
                  $unsigned($signed(reg7[(2'h3):(1'h1)]))});
              reg42 <= {$unsigned((($signed(reg35) < $unsigned(reg28)) ?
                      (reg33 << ((8'hb3) ? reg13 : reg6)) : ({reg22,
                          reg41} | reg25)))};
              reg43 <= ($unsigned($signed(($unsigned(reg30) ~^ (8'hbd)))) ?
                  $signed(((reg17 <= (wire29 || reg20)) ?
                      ((^reg17) ?
                          $unsigned(reg12) : (wire29 ?
                              reg36 : (8'hb4))) : reg25[(1'h0):(1'h0)])) : $signed(reg22[(2'h2):(1'h1)]));
            end
          reg44 <= reg30;
        end
      else
        begin
          reg40 <= (+$signed(reg22));
          if (reg10)
            begin
              reg41 <= {((~|(+$unsigned(reg20))) ^~ (~|((8'had) ?
                      (reg14 ? reg23 : (8'hbf)) : {reg12, (7'h44)}))),
                  {reg39[(2'h2):(1'h0)], $unsigned(reg21[(4'hc):(4'h8)])}};
              reg42 <= (8'h9d);
            end
          else
            begin
              reg41 <= {($signed($unsigned((~|reg23))) ?
                      (^$signed($unsigned(reg23))) : reg36)};
              reg42 <= (((^~$unsigned((reg43 ?
                      reg43 : wire3))) >>> $unsigned($signed((-(8'hb5))))) ?
                  ((((wire2 >>> reg5) > (+(8'hbf))) - (~&{reg14})) ^~ {reg33[(1'h0):(1'h0)],
                      ((~reg43) ? $signed(reg21) : $unsigned(reg35))}) : reg35);
              reg43 <= $unsigned(((~$signed((~|reg35))) ?
                  $unsigned(wire29[(1'h0):(1'h0)]) : wire4[(3'h5):(2'h3)]));
              reg44 <= $unsigned((~^({(reg22 ?
                      wire1 : reg39)} && ((wire1 > reg38) ~^ {wire4, reg34}))));
              reg45 <= (wire2 ?
                  $unsigned($signed($signed((reg17 ?
                      reg8 : reg33)))) : reg37[(3'h5):(2'h3)]);
            end
          reg46 <= $unsigned($unsigned((^($signed(reg6) || $unsigned((8'hae))))));
          reg47 <= reg45;
        end
      reg48 <= wire1;
      if (reg34)
        begin
          reg49 <= (~|(((reg6[(3'h6):(1'h0)] ^ $unsigned(reg8)) + $signed(reg9)) ?
              reg48[(4'h9):(2'h2)] : $unsigned($signed(reg45[(1'h1):(1'h1)]))));
          reg50 <= (~^$signed(reg15[(2'h2):(2'h2)]));
        end
      else
        begin
          reg49 <= $signed({(|{((7'h41) ? reg46 : reg33)}),
              $signed((reg47 ? ((8'hbe) ? reg43 : wire0) : $signed(reg40)))});
          reg50 <= {reg27, reg14};
        end
      reg51 <= (^$unsigned($signed($signed((reg34 ? reg36 : wire2)))));
    end
  module52 #() modinst99 (.wire54(reg34), .wire57(reg37), .wire56(reg45), .wire55(reg6), .clk(clk), .y(wire98), .wire53(wire29));
  assign wire100 = reg15[(2'h2):(1'h1)];
endmodule

module module52  (y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire57;
  input wire signed [(4'he):(1'h0)] wire56;
  input wire signed [(4'hf):(1'h0)] wire55;
  input wire [(5'h13):(1'h0)] wire54;
  input wire [(4'he):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire97;
  wire signed [(3'h7):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire94;
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  assign y = {wire97,
                 wire95,
                 wire94,
                 reg96,
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
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg58 <= $signed((~&wire57[(4'hc):(1'h0)]));
      if ($unsigned((wire55 ?
          ((8'haa) == reg58[(1'h0):(1'h0)]) : $unsigned($signed((wire55 ?
              wire53 : (8'ha4)))))))
        begin
          reg59 <= wire56;
          reg60 <= (reg59 ?
              (7'h44) : {$unsigned(wire54), wire54[(2'h3):(2'h2)]});
        end
      else
        begin
          reg59 <= wire57;
          if ((~&$signed(reg60)))
            begin
              reg60 <= (wire57[(2'h3):(2'h3)] <<< reg60);
              reg61 <= ((~&$unsigned((!reg60[(1'h0):(1'h0)]))) & (reg58 || (($signed(wire55) ?
                  $unsigned(reg59) : wire55) << ((+wire55) ~^ $signed(reg59)))));
              reg62 <= $unsigned((((reg60[(1'h1):(1'h1)] ?
                  (~^wire55) : ((8'h9f) ^~ (8'h9d))) <= $signed((reg60 ?
                  wire56 : reg60))) != reg61[(1'h0):(1'h0)]));
              reg63 <= wire54;
              reg64 <= reg58;
            end
          else
            begin
              reg60 <= (wire54[(3'h7):(3'h5)] ?
                  ((~^(reg63[(3'h4):(2'h2)] ?
                      (reg62 > (8'ha3)) : (~^wire55))) != (!reg64)) : reg61);
              reg61 <= $unsigned((~|reg58));
              reg62 <= (reg61 | ({(reg59[(3'h5):(3'h5)] * reg60[(2'h2):(2'h2)]),
                  (wire53[(4'h8):(1'h0)] ~^ {reg59})} || (~(|(-wire55)))));
              reg63 <= ((+(~&reg59[(3'h5):(3'h5)])) ^ wire54[(3'h7):(1'h1)]);
            end
          reg65 <= wire54;
          reg66 <= ((^wire57) ? wire55[(4'he):(4'hd)] : (&(~^reg61)));
          reg67 <= wire56;
        end
      reg68 <= (((reg61 ~^ ($signed(reg61) ?
          {reg66} : $signed(reg61))) - ((reg58 * reg60) ?
          ((reg58 ? reg67 : reg60) ?
              $unsigned(wire57) : reg60) : $signed($unsigned(wire57)))) == reg59);
    end
  always
    @(posedge clk) begin
      reg69 <= ((reg61 ?
          $unsigned(({(8'ha3), reg63} ?
              (^wire53) : (reg68 << reg66))) : $signed(reg64)) & $signed(reg59));
      reg70 <= ($unsigned(({$signed(reg62), $unsigned(wire55)} ?
          (~^reg68) : $signed((wire57 <<< (8'hac))))) | {$unsigned({reg66[(2'h3):(1'h0)],
              {reg63, reg68}})});
      reg71 <= $unsigned($signed($signed(({wire57} || wire54[(4'he):(4'hb)]))));
      if ($unsigned((reg65[(2'h2):(2'h2)] << (reg62 ?
          ($signed(reg59) ^ (reg69 ? reg69 : wire57)) : ($signed(reg70) ?
              reg62 : $signed(reg65))))))
        begin
          reg72 <= ((&reg60) ? (~&reg66) : reg58);
        end
      else
        begin
          reg72 <= (reg58[(1'h1):(1'h0)] ?
              (((wire57[(2'h3):(1'h1)] >> (^reg60)) >= $signed($unsigned(wire57))) >> reg59[(1'h0):(1'h0)]) : (~(!(-$unsigned(reg68)))));
          reg73 <= reg65[(3'h4):(1'h0)];
          reg74 <= {{{((reg61 ^~ reg66) ? $unsigned(reg73) : $signed(wire53))},
                  $signed((~|wire57))}};
          if (({$signed((reg61 ? (reg73 ? reg64 : reg66) : (^reg64))),
                  {(~|wire55), $unsigned((reg66 ? reg72 : wire53))}} ?
              $unsigned((+reg72[(3'h5):(2'h2)])) : (reg72 != (wire55[(4'ha):(3'h5)] ?
                  (+reg60[(1'h0):(1'h0)]) : {{(8'hbb), reg58}, (~^reg65)}))))
            begin
              reg75 <= reg69[(2'h2):(1'h0)];
              reg76 <= ($signed(($signed({reg63}) ^ {(~reg69), {reg69}})) ?
                  reg61 : ((reg71 ?
                      reg75[(3'h7):(3'h7)] : reg73[(5'h11):(4'hc)]) ^~ (^(|$signed((8'hb5))))));
              reg77 <= $signed((~&(((wire54 & (8'hb3)) ^~ $unsigned(wire55)) ?
                  $unsigned(wire53) : reg70[(4'hc):(4'h8)])));
              reg78 <= {$signed(reg62)};
            end
          else
            begin
              reg75 <= reg66[(1'h1):(1'h1)];
              reg76 <= {((reg61 ?
                          ($signed(wire55) || (reg66 >> reg75)) : wire55) ?
                      reg58[(3'h4):(1'h1)] : ((wire55[(4'h9):(3'h7)] - reg60) ?
                          (~&reg62[(2'h2):(1'h0)]) : reg66[(2'h3):(2'h2)])),
                  $signed($unsigned($unsigned($unsigned(reg64))))};
            end
        end
    end
  always
    @(posedge clk) begin
      if ($signed((~$unsigned(((wire55 | reg72) ?
          $signed((8'hac)) : $unsigned(reg78))))))
        begin
          if ((8'haf))
            begin
              reg79 <= (8'hb7);
              reg80 <= (8'had);
              reg81 <= (reg60 >> $signed(((8'ha6) - $signed($unsigned(reg71)))));
            end
          else
            begin
              reg79 <= (-reg62);
              reg80 <= $unsigned((^~$signed($unsigned((reg62 * reg63)))));
              reg81 <= ((wire53[(3'h6):(1'h0)] ?
                      ((^$signed(reg58)) ^ $unsigned((reg61 == wire53))) : $unsigned(reg71[(1'h1):(1'h0)])) ?
                  reg78[(3'h7):(1'h0)] : reg65[(2'h2):(2'h2)]);
              reg82 <= ((-$unsigned((~(reg62 >= (7'h41))))) ?
                  (reg63[(3'h4):(2'h2)] ~^ {(~$signed((8'hb8))),
                      {$signed(reg60)}}) : {((!$signed(reg58)) ?
                          {(reg59 && reg80)} : (8'ha6)),
                      ((~|{reg63}) ?
                          $signed(((8'hb8) ?
                              reg80 : (8'hab))) : ((~reg68) <<< (~^reg78)))});
              reg83 <= reg79[(4'ha):(1'h0)];
            end
          reg84 <= (~&reg70[(4'hb):(2'h3)]);
          reg85 <= $signed(reg61);
        end
      else
        begin
          reg79 <= {{$unsigned(reg61[(1'h0):(1'h0)])}, reg83};
          reg80 <= (-reg72[(2'h3):(1'h1)]);
          if (reg72)
            begin
              reg81 <= (~|($unsigned(reg79) ?
                  (~$unsigned($signed(reg71))) : (^~(|$unsigned(reg64)))));
              reg82 <= (|($unsigned($signed((|wire53))) < $unsigned((|$unsigned(reg59)))));
              reg83 <= reg78[(5'h13):(2'h3)];
              reg84 <= $unsigned(reg78[(3'h4):(1'h1)]);
              reg85 <= reg67[(2'h3):(1'h1)];
            end
          else
            begin
              reg81 <= $unsigned($signed((reg82[(4'hf):(3'h5)] ?
                  (((8'hb7) >>> reg64) ?
                      $signed(reg83) : ((8'hb2) ?
                          reg82 : (8'hb9))) : ((&(8'had)) ?
                      reg76[(3'h5):(2'h2)] : $unsigned(reg67)))));
              reg82 <= ($unsigned($unsigned(wire54[(3'h4):(2'h2)])) && ($signed((^~(8'hb3))) ^ $unsigned((|{reg76}))));
              reg83 <= $signed(((((8'haf) || (reg61 ?
                      reg84 : reg74)) <<< $unsigned($signed(reg62))) ?
                  reg64 : reg64));
              reg84 <= $unsigned(((((wire57 > reg71) != reg63[(3'h7):(1'h0)]) * ((^reg85) ^ (reg61 ^ reg83))) | $signed(((~(7'h42)) ?
                  reg78[(3'h6):(1'h1)] : wire53))));
            end
          if ($signed((reg59[(3'h4):(1'h0)] ?
              ((((7'h41) || reg76) << reg75[(4'h9):(1'h0)]) <<< $signed((reg60 ?
                  (7'h44) : reg74))) : $signed(reg74))))
            begin
              reg86 <= reg61;
              reg87 <= ((~|(^~reg81)) ?
                  $unsigned($signed($signed((reg62 ?
                      (7'h40) : reg74)))) : reg61);
              reg88 <= reg83[(1'h1):(1'h0)];
              reg89 <= ($signed((wire54 ?
                      ({reg84} ?
                          (reg65 ? (8'ha4) : reg78) : (reg59 ?
                              (8'hae) : reg77)) : (!(reg74 ?
                          wire55 : reg74)))) ?
                  (!(8'hb8)) : $unsigned($signed(reg80)));
            end
          else
            begin
              reg86 <= reg72;
              reg87 <= reg68[(1'h1):(1'h0)];
              reg88 <= $signed(((((reg66 >>> reg68) ? reg60 : $signed(reg70)) ?
                      $signed({reg86}) : reg89) ?
                  $unsigned(wire55) : {{(reg68 - reg78),
                          reg79[(4'ha):(3'h6)]}}));
              reg89 <= (8'ha0);
            end
          reg90 <= (!$signed($signed($unsigned((reg84 ? reg77 : reg68)))));
        end
      reg91 <= (8'hbc);
      reg92 <= ($signed((|(^((8'ha1) ? (8'ha2) : reg81)))) | (^({(reg84 ?
              reg89 : reg85)} <<< $signed((~|reg72)))));
      reg93 <= reg65[(3'h4):(2'h2)];
    end
  assign wire94 = (~^$signed(reg62));
  assign wire95 = reg70[(4'h8):(1'h0)];
  always
    @(posedge clk) begin
      reg96 <= $signed($signed(reg85));
    end
  assign wire97 = $signed((reg96 >>> $unsigned((^(8'had)))));
endmodule
