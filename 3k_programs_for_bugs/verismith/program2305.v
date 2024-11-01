module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire71,
                 wire20,
                 wire19,
                 wire18,
                 wire8,
                 wire6,
                 wire5,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 (1'h0)};
  assign wire5 = {(|wire2), $unsigned(wire3[(1'h0):(1'h0)])};
  assign wire6 = wire3[(4'ha):(4'ha)];
  always
    @(posedge clk) begin
      reg7 <= (($unsigned(((wire2 ? wire5 : wire5) ?
                  (~&(8'hb2)) : ((8'hb3) ? wire0 : wire6))) ?
              $signed({$unsigned(wire4), (-wire2)}) : wire0) ?
          $signed($signed(($signed((8'hb7)) - $unsigned(wire6)))) : $unsigned(wire1));
    end
  assign wire8 = ($unsigned((|reg7[(1'h0):(1'h0)])) ^~ ($signed(((wire2 ~^ wire2) <= (wire5 << wire0))) && (wire3 ?
                     {$unsigned(reg7)} : reg7[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg9 <= wire3;
      reg10 <= $unsigned(((wire0[(3'h4):(3'h4)] > wire0[(3'h6):(3'h4)]) ?
          $signed(($unsigned(wire3) ? wire4 : $signed(wire0))) : wire1));
      if (({{(^~(reg7 ? wire6 : reg10))},
          ($signed(reg10) == reg10[(1'h0):(1'h0)])} << $signed(wire0[(2'h2):(1'h1)])))
        begin
          if (reg10)
            begin
              reg11 <= (wire5[(3'h7):(3'h6)] + (~(^(((7'h41) ?
                  wire6 : wire5) == wire6[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg11 <= wire5[(5'h12):(5'h12)];
            end
          reg12 <= wire0;
          reg13 <= {$signed(($unsigned((8'hb9)) ?
                  (((8'hbc) ? wire5 : wire2) ?
                      (reg12 ? wire2 : wire8) : wire1) : {wire8})),
              wire5[(3'h4):(2'h2)]};
          reg14 <= wire2[(2'h3):(2'h2)];
          reg15 <= (^~reg7[(2'h2):(1'h0)]);
        end
      else
        begin
          reg11 <= (8'had);
          reg12 <= {($unsigned($signed($unsigned(wire1))) ?
                  $unsigned($unsigned(reg7[(3'h5):(3'h4)])) : (!wire3[(4'ha):(1'h0)]))};
          reg13 <= ((^reg9[(1'h1):(1'h0)]) * $signed((~&(~^(reg11 < reg11)))));
        end
      reg16 <= reg13;
      reg17 <= reg13[(2'h2):(2'h2)];
    end
  assign wire18 = {(8'hb0), reg15[(4'hd):(4'hb)]};
  assign wire19 = (wire4 ? reg11 : (~^{$signed(reg12)}));
  assign wire20 = (wire2[(3'h4):(2'h3)] ?
                      (!(|reg12[(1'h1):(1'h1)])) : wire1[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg21 <= reg15;
      reg22 <= reg13;
      if ($unsigned($signed(($signed(reg22[(4'h8):(2'h3)]) > (wire3[(4'h8):(3'h4)] != (reg16 << wire5))))))
        begin
          reg23 <= (reg13[(1'h0):(1'h0)] + reg21[(3'h6):(3'h6)]);
          if ({reg12[(3'h4):(1'h0)]})
            begin
              reg24 <= $signed(wire8[(3'h4):(1'h0)]);
              reg25 <= ((((reg12 ?
                          (wire1 || wire19) : (reg17 ? wire18 : reg24)) ?
                      reg21 : reg10) & (wire5 ~^ wire8[(1'h1):(1'h0)])) ?
                  (~|(reg7 << (8'h9f))) : $unsigned($signed((!(|reg12)))));
              reg26 <= {(~$signed($unsigned(reg12[(2'h2):(1'h1)])))};
              reg27 <= $unsigned(wire0);
              reg28 <= (^~(reg16[(4'ha):(1'h0)] ^~ (wire1[(1'h1):(1'h1)] ?
                  ((reg24 ^ wire3) ?
                      (reg26 & wire4) : (reg10 ^~ reg21)) : (~|(!reg7)))));
            end
          else
            begin
              reg24 <= {({reg7} ?
                      $unsigned(wire18[(4'ha):(2'h3)]) : {$unsigned((^~wire2)),
                          (!(wire20 ? wire6 : wire1))}),
                  (+$unsigned(($signed(wire1) << wire18)))};
            end
        end
      else
        begin
          reg23 <= (8'hb6);
        end
      reg29 <= wire1[(1'h1):(1'h1)];
      reg30 <= (~reg29);
    end
  module31 #() modinst72 (.wire35(reg22), .wire34(reg16), .wire32(reg14), .wire33(reg25), .clk(clk), .y(wire71));
  assign wire73 = $signed((^(!reg17[(1'h1):(1'h0)])));
  assign wire74 = $signed($unsigned(($signed((reg30 && (8'hbb))) - ({reg27} >= (8'ha2)))));
endmodule

module module31  (y, clk, wire32, wire33, wire34, wire35);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire32;
  input wire signed [(5'h15):(1'h0)] wire33;
  input wire signed [(5'h10):(1'h0)] wire34;
  input wire signed [(5'h12):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire59;
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire36,
                 wire37,
                 wire38,
                 wire59,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire36 = wire34[(4'hf):(4'h9)];
  assign wire37 = $unsigned(wire34);
  assign wire38 = {$signed($signed(wire33)), $unsigned((8'hab))};
  module39 #() modinst60 (.y(wire59), .wire44(wire38), .wire43(wire32), .clk(clk), .wire40(wire34), .wire41(wire35), .wire42(wire36));
  assign wire61 = wire35;
  assign wire62 = ((wire38 ?
                          ((wire61[(3'h7):(3'h6)] ?
                              $unsigned(wire61) : $signed(wire59)) - (&$signed((8'hb7)))) : ((wire61[(2'h3):(2'h3)] <= (!wire59)) ?
                              ({wire32} ?
                                  wire33 : $unsigned(wire33)) : ($signed(wire38) ?
                                  (wire37 ? wire33 : wire35) : wire61))) ?
                      $unsigned(wire34[(1'h0):(1'h0)]) : ((((wire35 <<< wire34) != (wire61 ^~ (8'hab))) ?
                          $signed($signed(wire61)) : $unsigned((~&wire36))) <= (~|$unsigned($unsigned((8'ha9))))));
  assign wire63 = wire35[(3'h6):(3'h6)];
  assign wire64 = (wire33 ?
                      $signed(((wire61[(3'h6):(1'h0)] ^~ (wire33 == wire59)) ^ $unsigned((wire34 ?
                          wire35 : wire37)))) : $signed($signed(wire38)));
  assign wire65 = (($unsigned((~&(~&(7'h40)))) ?
                      $signed(wire36) : (~&$unsigned(wire59))) < $unsigned($unsigned($signed((wire64 < wire59)))));
  always
    @(posedge clk) begin
      reg66 <= wire61;
      if ($signed(wire64[(3'h4):(2'h3)]))
        begin
          reg67 <= ((^~($unsigned((wire38 <<< reg66)) - (8'hb5))) ?
              reg66[(3'h5):(3'h5)] : (wire63[(3'h7):(3'h5)] < wire35[(3'h6):(1'h1)]));
        end
      else
        begin
          reg67 <= (wire64[(2'h2):(1'h0)] ?
              $unsigned($signed(((wire63 * reg66) ?
                  (wire35 ? wire65 : wire63) : wire61))) : reg66);
        end
      reg68 <= (~&wire59[(4'hf):(4'h9)]);
    end
  assign wire69 = {(~wire59), $signed(reg66)};
  assign wire70 = $unsigned(($signed($unsigned(wire36)) ~^ (((wire36 ?
                          wire32 : reg66) ?
                      {wire38} : (wire32 || wire37)) < (wire65[(3'h4):(2'h2)] ?
                      wire33[(1'h0):(1'h0)] : $unsigned(wire32)))));
endmodule

module module39  (y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire44;
  input wire signed [(3'h6):(1'h0)] wire43;
  input wire [(3'h6):(1'h0)] wire42;
  input wire signed [(5'h12):(1'h0)] wire41;
  input wire [(4'h8):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
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
                 (1'h0)};
  assign wire45 = wire44[(2'h3):(2'h3)];
  assign wire46 = (|wire45);
  assign wire47 = ((~|wire41[(4'hb):(4'hb)]) ?
                      ((&{(wire44 ? wire44 : wire45),
                          wire44[(4'hc):(3'h4)]}) < $signed($signed($signed(wire43)))) : $unsigned(($unsigned({wire44,
                          wire45}) >= wire42)));
  assign wire48 = $unsigned(($unsigned((~^{wire40, (8'hb1)})) ?
                      $signed({$signed(wire46)}) : (wire42[(2'h3):(2'h2)] <<< wire46[(4'h9):(3'h5)])));
  always
    @(posedge clk) begin
      reg49 <= wire44[(4'hf):(1'h1)];
      if (((|{$signed((-(8'hb3))),
          wire42}) || (((+$signed(wire44)) && reg49[(1'h1):(1'h1)]) - {$signed(wire40),
          $signed($unsigned(wire43))})))
        begin
          if ((-wire40[(4'h8):(1'h0)]))
            begin
              reg50 <= (+($signed((~(~^wire40))) <<< wire48));
              reg51 <= (~(($signed((!reg50)) ?
                      wire42 : (wire40[(3'h4):(1'h0)] ?
                          (|(8'ha1)) : wire43[(2'h3):(1'h0)])) ?
                  wire46[(3'h6):(1'h1)] : wire45));
              reg52 <= reg51;
            end
          else
            begin
              reg50 <= $signed(($signed(($signed(reg51) | (wire43 ?
                  wire43 : wire43))) <<< (^(wire48[(3'h4):(2'h2)] + (^~reg52)))));
              reg51 <= ($unsigned(wire42[(2'h3):(2'h3)]) ? {wire40} : wire46);
              reg52 <= (reg52[(4'he):(4'ha)] < wire45);
              reg53 <= (~&(|wire43[(2'h2):(1'h0)]));
              reg54 <= (wire47[(1'h0):(1'h0)] ?
                  reg51[(2'h2):(1'h1)] : $signed($unsigned($signed((reg50 && wire44)))));
            end
          reg55 <= $unsigned($unsigned(($unsigned({(8'hb8),
              wire46}) + {wire46})));
          reg56 <= (!$signed($signed((|(8'haa)))));
          reg57 <= (&wire40[(3'h6):(3'h6)]);
          reg58 <= reg51;
        end
      else
        begin
          reg50 <= reg50[(1'h0):(1'h0)];
          reg51 <= {{wire42[(2'h2):(1'h1)], wire41}, reg57};
          if (reg53)
            begin
              reg52 <= {($unsigned((!$signed(wire41))) ^ wire44),
                  $signed(reg53)};
              reg53 <= $unsigned((((!$unsigned(wire46)) & ((reg56 <= wire42) | (wire48 ^~ wire42))) ^~ reg54));
            end
          else
            begin
              reg52 <= wire45;
              reg53 <= (~^($signed(reg55) ?
                  reg53[(4'h8):(3'h7)] : reg55[(4'ha):(1'h0)]));
              reg54 <= $unsigned((wire48[(4'h9):(3'h7)] << wire43[(1'h0):(1'h0)]));
              reg55 <= $signed((8'hb3));
            end
          reg56 <= $signed(($unsigned(wire43[(3'h4):(1'h0)]) ?
              $unsigned($signed($unsigned(wire43))) : reg54[(1'h0):(1'h0)]));
          reg57 <= {{wire45, $signed(((wire44 + reg57) && $unsigned(reg51)))},
              $signed(($signed(((8'h9f) ? wire44 : wire45)) + (8'ha9)))};
        end
    end
endmodule
