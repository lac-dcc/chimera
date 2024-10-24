module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  wire signed [(4'hf):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire69;
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  assign y = {wire71,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire39,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire69,
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
                 (1'h0)};
  assign wire4 = (wire1 > (8'ha0));
  assign wire5 = ($signed(wire3) - $unsigned(($signed(((8'ha1) ?
                         wire1 : wire2)) ?
                     {(~&wire2)} : wire1)));
  assign wire6 = (8'ha1);
  assign wire7 = (^$signed($unsigned(wire4)));
  always
    @(posedge clk) begin
      if (((wire6[(3'h6):(1'h1)] - $signed(((wire0 ? wire3 : wire7) ?
          {wire7,
              wire6} : (~|wire5)))) < $unsigned($unsigned($unsigned((&wire2))))))
        begin
          reg8 <= $signed(($signed(wire0[(1'h0):(1'h0)]) ?
              wire6[(4'h8):(3'h4)] : wire5[(1'h1):(1'h1)]));
          reg9 <= $signed(({$signed(reg8),
              $signed((^(7'h42)))} != $unsigned(wire2[(3'h6):(1'h1)])));
          reg10 <= (!((($signed(wire6) >= wire2[(4'h9):(1'h1)]) >> wire4[(4'he):(4'hb)]) ?
              $signed($signed(reg8[(1'h1):(1'h1)])) : ($unsigned($signed(reg9)) < $unsigned((&wire2)))));
        end
      else
        begin
          reg8 <= ((&{{(~^wire3), wire3}, wire1[(4'ha):(4'ha)]}) ?
              $signed((|wire6[(2'h3):(1'h0)])) : ($unsigned(wire6) | wire1));
        end
      if (({$signed($unsigned(wire2[(2'h3):(1'h1)])), wire4[(3'h7):(1'h1)]} ?
          (~wire4) : $signed({reg9})))
        begin
          reg11 <= ((~^(((8'hb4) ?
                  wire0[(2'h3):(1'h0)] : $unsigned(wire3)) <= wire6[(2'h3):(1'h0)])) ?
              ({(~|reg9)} ?
                  (!{reg8[(2'h3):(2'h3)]}) : (wire5 ?
                      (!(+wire1)) : reg8[(1'h1):(1'h1)])) : (~|(($signed((8'hbd)) ?
                      reg9 : (wire5 >> (7'h41))) ?
                  wire5 : {((8'hb2) <<< (8'ha9))})));
          reg12 <= (!(((+$signed(wire0)) <<< ($signed(wire7) == (~|wire7))) < wire6[(1'h0):(1'h0)]));
        end
      else
        begin
          reg11 <= $unsigned((&$unsigned(((reg11 ? wire0 : (8'hbf)) & {wire1,
              wire6}))));
          reg12 <= wire2;
          reg13 <= $signed({reg9});
          reg14 <= wire2;
          reg15 <= (&(~&(^~(|reg13))));
        end
      reg16 <= $unsigned(wire2[(4'h8):(1'h1)]);
      reg17 <= $signed(reg13);
      reg18 <= (|reg9[(3'h7):(2'h2)]);
    end
  assign wire19 = ((!wire5) ?
                      reg12[(2'h2):(2'h2)] : (($unsigned((reg17 ~^ reg9)) <= (reg17[(1'h1):(1'h1)] ?
                          (wire5 ?
                              reg8 : reg15) : ((8'hb1) & wire5))) == $signed($unsigned($signed((8'hb5))))));
  assign wire20 = $unsigned(reg17[(1'h0):(1'h0)]);
  assign wire21 = ((+$unsigned({reg9, (8'h9f)})) >>> wire0);
  assign wire22 = (((($unsigned(wire21) ~^ $unsigned((8'hab))) ?
                          ($unsigned(wire1) ?
                              $signed(reg18) : reg15[(1'h1):(1'h1)]) : reg16) ?
                      $signed((~&wire0)) : $unsigned((8'ha1))) == wire21);
  module23 #() modinst40 (wire39, clk, reg13, wire19, wire3, reg15, reg10);
  assign wire41 = $unsigned((&(~&($unsigned((8'hb3)) ?
                      $signed(wire4) : $unsigned(reg14)))));
  assign wire42 = (((8'hbd) == {(reg10 <<< reg12),
                      ((reg13 ? wire7 : reg11) ?
                          (wire21 - reg15) : (-(8'ha8)))}) && (~&wire5[(2'h2):(1'h0)]));
  assign wire43 = reg12[(2'h3):(1'h1)];
  assign wire44 = $unsigned(((8'h9e) < (wire20[(3'h4):(3'h4)] >= (reg10 ?
                      wire41 : $signed(wire20)))));
  assign wire45 = (8'ha0);
  assign wire46 = (reg14[(2'h2):(2'h2)] ?
                      $signed((wire43 ~^ $signed({reg10, wire4}))) : wire2);
  module47 #() modinst70 (.clk(clk), .wire49(wire1), .wire51(reg15), .wire52(wire20), .y(wire69), .wire48(wire3), .wire50(reg12));
  assign wire71 = wire46[(3'h4):(2'h3)];
endmodule

module module47
#(parameter param67 = (({(((8'hb3) + (8'hb5)) >= (~&(8'ha1))), (+((8'ha2) || (8'hbc)))} <= {(~&(~&(8'hb6)))}) << ((8'hb4) ? ((((8'ha0) ? (8'ha5) : (7'h42)) <= ((8'hba) ? (8'hac) : (8'hbd))) ? ({(8'hb6), (8'hb6)} ? (8'hb2) : ((8'h9d) & (8'h9c))) : ({(8'hbf)} >>> ((8'hbc) >= (8'hb5)))) : {(((8'hba) ? (8'hbe) : (8'ha3)) ? ((8'ha8) ? (8'ha9) : (8'h9c)) : {(8'hb7), (8'had)})})), 
parameter param68 = {((param67 ? param67 : param67) * {(~|(param67 || (8'h9e)))}), param67})
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire52;
  input wire [(4'hd):(1'h0)] wire51;
  input wire [(5'h13):(1'h0)] wire50;
  input wire signed [(4'hc):(1'h0)] wire49;
  input wire [(3'h7):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg53 <= (8'hb9);
      reg54 <= $signed($signed(wire49[(4'h9):(3'h4)]));
      if ($unsigned(($unsigned($signed(wire48)) != wire49[(4'hb):(4'hb)])))
        begin
          if (wire51[(4'hc):(3'h7)])
            begin
              reg55 <= ((7'h42) < ({$signed((reg54 <<< wire51)),
                  (8'hb6)} ^~ reg54));
              reg56 <= $signed(reg53);
              reg57 <= wire49;
              reg58 <= $unsigned((-(&(|$unsigned((7'h40))))));
            end
          else
            begin
              reg55 <= $signed(reg53);
              reg56 <= (wire52 ?
                  $signed(reg57) : $unsigned($unsigned($signed((|reg53)))));
              reg57 <= (~&reg54);
            end
          reg59 <= $signed($unsigned($signed(wire49[(1'h1):(1'h1)])));
          reg60 <= $unsigned($unsigned({(~^$signed(reg56))}));
        end
      else
        begin
          reg55 <= wire49[(3'h4):(3'h4)];
          reg56 <= reg59;
        end
    end
  assign wire61 = ($unsigned((-reg60[(3'h5):(3'h5)])) & (reg54 ?
                      (!(~((8'hbb) ?
                          reg59 : wire51))) : ((reg53[(1'h1):(1'h1)] <= (~|reg56)) | $unsigned($signed(wire50)))));
  assign wire62 = {wire48};
  assign wire63 = {wire49};
  assign wire64 = {{(^reg58[(2'h2):(1'h0)])}, $unsigned(reg55)};
  assign wire65 = $signed(wire52[(1'h0):(1'h0)]);
  assign wire66 = {(-$signed($signed({(8'hba)})))};
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire28;
  input wire signed [(3'h6):(1'h0)] wire27;
  input wire signed [(2'h2):(1'h0)] wire26;
  input wire signed [(5'h13):(1'h0)] wire25;
  input wire signed [(4'h8):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 (1'h0)};
  assign wire29 = wire25[(5'h10):(3'h4)];
  assign wire30 = wire29[(4'hc):(3'h6)];
  assign wire31 = {{(wire30[(5'h10):(1'h0)] <= (!(+wire25)))},
                      {$unsigned($unsigned({wire26}))}};
  assign wire32 = wire24[(3'h4):(2'h2)];
  assign wire33 = ($unsigned(wire32[(3'h4):(2'h3)]) ?
                      $unsigned((!$unsigned(wire32[(3'h6):(1'h0)]))) : {$signed(wire32),
                          ((-wire27) >= $unsigned($unsigned(wire24)))});
  assign wire34 = (^wire29[(4'he):(3'h6)]);
  assign wire35 = (^~wire31[(3'h5):(3'h5)]);
  assign wire36 = ($unsigned(wire30[(4'h8):(1'h0)]) ?
                      $unsigned((wire29[(4'he):(4'h8)] <<< $unsigned($signed(wire27)))) : $unsigned((wire32[(4'h9):(3'h5)] ?
                          wire32 : (wire27[(2'h2):(1'h0)] >= (wire24 ?
                              wire35 : (8'ha1))))));
  assign wire37 = wire25[(2'h2):(2'h2)];
  assign wire38 = $unsigned(wire26);
endmodule
