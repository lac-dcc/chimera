module top
#(parameter param88 = ((8'hb9) ? (8'had) : (8'hb5)), 
parameter param89 = {param88, ((&(+(param88 < param88))) ? {((+param88) || (param88 <<< param88)), ((param88 != param88) ? {param88} : (param88 <<< param88))} : (((|param88) ? (|param88) : (param88 >> param88)) ^~ (((7'h42) ? param88 : param88) ^ param88)))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire84;
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire84,
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
                 (1'h0)};
  assign wire5 = $signed(wire2[(5'h10):(4'hb)]);
  assign wire6 = $signed(wire4);
  assign wire7 = $signed($unsigned((~^($unsigned(wire2) ?
                     $signed(wire6) : $signed(wire3)))));
  assign wire8 = (wire3[(3'h7):(2'h3)] + (wire6 >> {wire4}));
  always
    @(posedge clk) begin
      if ($unsigned(wire4))
        begin
          reg9 <= wire4;
          reg10 <= (wire5[(4'hf):(4'hf)] ^ (({{wire2}} ?
              (~|wire5) : wire7[(3'h7):(2'h2)]) <<< reg9[(3'h7):(3'h4)]));
        end
      else
        begin
          reg9 <= $unsigned((^~$signed(wire3)));
        end
      reg11 <= (wire3 ?
          {(~^((reg9 ? wire5 : wire4) ?
                  (!wire7) : (wire1 != reg10)))} : {{wire4}});
      if ((&$signed((~|(wire4[(1'h0):(1'h0)] ? (wire5 >> wire5) : (!reg10))))))
        begin
          reg12 <= (($unsigned(wire5) ?
              $signed($unsigned(reg9[(4'ha):(3'h4)])) : $unsigned(wire6)) >= (&wire8[(1'h1):(1'h1)]));
          if (((!$unsigned($unsigned((wire2 ? wire5 : reg10)))) ?
              {{((wire1 ? wire7 : wire2) ^ $signed(wire7)),
                      ((wire6 ? reg10 : wire4) & wire8)}} : (|wire8)))
            begin
              reg13 <= (!$unsigned(((7'h43) ?
                  (wire5[(4'hc):(2'h2)] ?
                      $signed(wire1) : wire8[(4'h9):(3'h5)]) : $signed($signed(wire6)))));
            end
          else
            begin
              reg13 <= ($unsigned(reg11[(3'h4):(2'h2)]) ~^ $signed($unsigned(({reg13} ?
                  $signed(wire6) : $unsigned((7'h42))))));
              reg14 <= $signed(wire8[(3'h6):(3'h4)]);
              reg15 <= (($unsigned(wire4) ? wire6[(2'h2):(2'h2)] : reg10) ?
                  $unsigned((^~((wire3 ? (8'hbd) : wire0) ?
                      $unsigned(wire6) : $unsigned((8'haf))))) : wire2);
            end
          reg16 <= (|((+$unsigned({wire1})) ?
              ((^$unsigned(wire5)) ?
                  $signed((reg14 ?
                      wire7 : reg10)) : wire5[(3'h5):(2'h2)]) : (8'h9f)));
          reg17 <= $unsigned($unsigned(reg12));
        end
      else
        begin
          if (((wire2[(4'h8):(1'h0)] ?
              wire8[(2'h2):(1'h0)] : (&wire6)) >= wire6))
            begin
              reg12 <= $unsigned($unsigned($signed(((~&reg10) ?
                  {(8'h9c)} : $signed(reg16)))));
            end
          else
            begin
              reg12 <= ((wire2[(4'hf):(4'h8)] & ({{wire4, wire4}} ?
                  wire3 : ($signed(reg16) == (wire6 < (8'ha3))))) && $signed($signed(wire1[(4'h8):(4'h8)])));
              reg13 <= (wire5 ?
                  $unsigned(((8'hbb) ?
                      $unsigned(reg9) : (~|(reg13 ?
                          reg12 : (8'had))))) : reg11);
              reg14 <= {wire6, reg9[(1'h1):(1'h0)]};
              reg15 <= ($unsigned((($signed(wire1) ?
                      reg17[(1'h1):(1'h1)] : ((7'h41) | (8'hb3))) | (-$signed(wire6)))) ?
                  wire8[(1'h0):(1'h0)] : $signed(($signed((wire2 < reg12)) != (~^$unsigned(reg12)))));
              reg16 <= (wire8[(4'ha):(3'h7)] >= (&reg12));
            end
          reg17 <= (7'h40);
          reg18 <= wire4[(1'h1):(1'h0)];
          reg19 <= $unsigned({wire1[(4'hb):(4'hb)]});
          if ((~$unsigned((8'ha6))))
            begin
              reg20 <= (!reg18);
              reg21 <= $unsigned((~&(&(~|$unsigned((7'h41))))));
              reg22 <= {wire3, wire1};
              reg23 <= $signed(wire2[(1'h1):(1'h1)]);
              reg24 <= {{reg17[(4'ha):(1'h0)]}};
            end
          else
            begin
              reg20 <= (^reg19[(4'hb):(4'hb)]);
              reg21 <= ((reg15 <<< wire3) << reg10);
            end
        end
    end
  module25 #() modinst85 (.wire26(wire1), .wire29(wire3), .y(wire84), .clk(clk), .wire30(reg16), .wire27(wire2), .wire28(reg21));
  assign wire86 = reg24;
  assign wire87 = ((wire3[(3'h5):(3'h5)] > (((wire8 ? reg15 : wire1) ?
                              wire7[(3'h4):(1'h0)] : reg19[(4'hb):(3'h5)]) ?
                          reg15[(2'h3):(1'h0)] : reg10[(1'h0):(1'h0)])) ?
                      reg23[(3'h5):(1'h0)] : reg10[(1'h0):(1'h0)]);
endmodule

module module25
#(parameter param83 = (8'ha4))
(y, clk, wire26, wire27, wire28, wire29, wire30);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire26;
  input wire signed [(4'hc):(1'h0)] wire27;
  input wire signed [(5'h14):(1'h0)] wire28;
  input wire signed [(4'hb):(1'h0)] wire29;
  input wire [(4'hf):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire76;
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  assign y = {wire82, wire78, wire76, reg81, reg80, reg79, (1'h0)};
  module31 #() modinst77 (wire76, clk, wire26, wire30, wire29, wire27, wire28);
  assign wire78 = (-$unsigned((!$unsigned(wire28))));
  always
    @(posedge clk) begin
      reg79 <= ({wire30} | wire76[(3'h6):(2'h3)]);
      reg80 <= $signed($signed(reg79[(4'h9):(2'h3)]));
      reg81 <= $unsigned(wire76);
    end
  assign wire82 = $unsigned(wire27[(3'h5):(1'h0)]);
endmodule

module module31  (y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h1c6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire36;
  input wire [(4'hf):(1'h0)] wire35;
  input wire [(4'hb):(1'h0)] wire34;
  input wire signed [(3'h7):(1'h0)] wire33;
  input wire signed [(5'h14):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  wire [(5'h13):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire45,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
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
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg44,
                 (1'h0)};
  assign wire37 = $unsigned((^~wire33));
  assign wire38 = ((wire34 ?
                      $signed((wire34 ?
                          $unsigned(wire36) : wire37[(2'h2):(1'h1)])) : ({(wire35 >= wire35)} ?
                          {(wire33 ? wire37 : wire34),
                              $unsigned(wire33)} : ({wire37} << $unsigned(wire36)))) & wire34[(3'h4):(2'h3)]);
  assign wire39 = wire38;
  assign wire40 = ($unsigned(wire32) ? wire36 : wire32[(4'hd):(3'h6)]);
  assign wire41 = (^~$signed($signed($unsigned((wire33 == (8'hb6))))));
  assign wire42 = $unsigned(wire35);
  assign wire43 = wire37;
  always
    @(posedge clk) begin
      reg44 <= wire37;
    end
  assign wire45 = wire35;
  always
    @(posedge clk) begin
      reg46 <= ($signed((~((wire42 >> wire34) > $unsigned(wire42)))) ?
          {$signed($unsigned(wire34))} : $unsigned((~&wire33[(3'h5):(3'h5)])));
      if (wire38)
        begin
          reg47 <= $signed(reg44);
          reg48 <= (reg46[(4'h9):(3'h7)] <<< $signed(wire35[(2'h3):(2'h2)]));
        end
      else
        begin
          reg47 <= $signed($unsigned({((+reg46) >> wire39)}));
          reg48 <= {$signed(((~|$signed(wire35)) ?
                  {(wire38 ? wire38 : wire40)} : ((wire43 ? reg44 : wire35) ?
                      (wire36 <<< wire38) : wire38[(3'h4):(2'h2)])))};
          if (reg44)
            begin
              reg49 <= {((($unsigned(reg47) ?
                              (+wire35) : ((8'hbe) ? wire40 : (7'h43))) ?
                          reg47 : wire38) ?
                      wire37 : ($signed(wire37[(3'h6):(2'h3)]) ?
                          wire43[(1'h1):(1'h0)] : $unsigned($signed(reg47))))};
              reg50 <= {reg46[(3'h7):(2'h2)]};
            end
          else
            begin
              reg49 <= (~|wire42);
              reg50 <= wire41;
            end
          reg51 <= $signed((~&wire33));
          if ($signed($unsigned((~|$signed($unsigned(reg48))))))
            begin
              reg52 <= wire37[(1'h0):(1'h0)];
              reg53 <= ({wire39[(4'ha):(3'h5)]} ?
                  wire33 : wire41[(1'h0):(1'h0)]);
              reg54 <= reg44[(4'hc):(1'h1)];
              reg55 <= $unsigned(($unsigned({reg53}) ?
                  $unsigned($signed($unsigned(wire34))) : wire35));
            end
          else
            begin
              reg52 <= $unsigned(wire38[(4'h8):(1'h1)]);
              reg53 <= wire33[(1'h0):(1'h0)];
              reg54 <= reg52;
              reg55 <= ($signed($signed((&(wire43 ?
                  wire38 : wire45)))) < reg47[(3'h5):(3'h4)]);
            end
        end
      reg56 <= (|{{(~$signed(reg50)), reg46}});
      reg57 <= $signed(reg48[(3'h7):(2'h2)]);
      if (reg48[(2'h3):(1'h0)])
        begin
          reg58 <= reg47;
          if ($unsigned({($unsigned((reg54 | reg55)) >>> reg51),
              {($signed((8'h9d)) || {reg47}), $unsigned((wire39 << reg50))}}))
            begin
              reg59 <= ((!$signed((reg58[(4'ha):(3'h6)] <<< reg50[(1'h0):(1'h0)]))) ?
                  $signed($unsigned(wire43)) : reg55);
              reg60 <= (~|(-(reg56 <= wire40)));
              reg61 <= (^~wire37);
              reg62 <= $unsigned(wire34[(3'h5):(2'h3)]);
              reg63 <= wire41;
            end
          else
            begin
              reg59 <= reg50[(1'h0):(1'h0)];
              reg60 <= {(($signed($signed(reg46)) ?
                          {$signed(wire33),
                              $unsigned((8'hb0))} : reg61[(1'h1):(1'h0)]) ?
                      $unsigned($signed({reg55})) : (((reg58 ? reg46 : reg58) ?
                          (~reg46) : reg54[(2'h2):(2'h2)]) || wire43))};
              reg61 <= (wire39 & wire35);
              reg62 <= reg47[(3'h4):(1'h0)];
              reg63 <= (|$unsigned($unsigned((wire34 ?
                  (|(8'hb6)) : $unsigned(wire40)))));
            end
          reg64 <= ($unsigned($signed(reg58[(4'ha):(4'h9)])) == reg50);
          reg65 <= (8'ha1);
        end
      else
        begin
          if (wire34[(4'hb):(2'h2)])
            begin
              reg58 <= (($unsigned($signed(wire42)) ?
                  $unsigned((wire45[(3'h7):(1'h0)] | $signed(wire32))) : reg63) >> ($unsigned((^~reg49)) + reg51));
            end
          else
            begin
              reg58 <= reg60[(4'h8):(3'h7)];
              reg59 <= (-reg64[(3'h5):(2'h3)]);
              reg60 <= $signed(((reg44[(3'h4):(1'h0)] >= ($unsigned(reg56) < reg62[(3'h4):(1'h0)])) ?
                  ($signed($signed(reg50)) && (8'hb1)) : reg64));
            end
        end
    end
  assign wire66 = (!(-(((wire32 >>> reg57) * (8'hb5)) ?
                      $unsigned((-(8'hb8))) : $signed((~wire33)))));
  assign wire67 = reg54[(4'h8):(4'h8)];
  assign wire68 = (!((reg58 > ((reg48 ? reg47 : (8'ha3)) ?
                          (reg52 + (8'ha2)) : wire42)) ?
                      (reg62 ?
                          ((wire45 ? (8'hb3) : wire38) == {reg44,
                              wire41}) : reg47) : (~&(^~{reg51}))));
  assign wire69 = reg60[(1'h1):(1'h1)];
  assign wire70 = {$signed((~(reg55 << (wire66 ~^ wire36))))};
  assign wire71 = $unsigned(wire32[(4'hb):(4'hb)]);
  assign wire72 = {(($unsigned((wire43 & wire41)) * ((wire34 ?
                              wire67 : reg57) | reg49)) ?
                          reg55 : (-((wire68 ? reg50 : reg53) ?
                              $signed(wire37) : $unsigned(reg55))))};
  assign wire73 = {($signed($unsigned((reg46 ? reg57 : (8'h9c)))) ?
                          {(wire32[(5'h10):(3'h5)] ?
                                  wire37[(2'h2):(2'h2)] : (wire70 && (8'hb1))),
                              (wire69 >= (~|reg53))} : (!($unsigned(wire32) <<< (wire33 ?
                              wire42 : reg54)))),
                      $unsigned($unsigned(((reg57 ? wire43 : reg51) ?
                          (|reg46) : ((8'hab) ? (8'h9e) : reg51))))};
  assign wire74 = $signed($unsigned(({$signed(wire68)} ?
                      reg57 : $signed($signed(reg64)))));
  assign wire75 = reg60[(3'h6):(2'h3)];
endmodule
