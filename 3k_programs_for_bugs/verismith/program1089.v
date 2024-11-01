module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  assign y = {wire78,
                 wire76,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire8,
                 wire6,
                 wire5,
                 reg7,
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
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg33,
                 (1'h0)};
  assign wire5 = (~&((+$unsigned((~^wire2))) ?
                     (wire2 > (wire0[(3'h5):(2'h3)] && wire4)) : {(+(|wire4))}));
  assign wire6 = (^~wire0[(4'h9):(3'h6)]);
  always
    @(posedge clk) begin
      reg7 <= {(((~&(~|wire1)) ?
                  $unsigned((~&wire2)) : (wire4[(5'h13):(4'hb)] ?
                      (wire6 ^~ wire3) : $unsigned(wire6))) ?
              (-(8'hb2)) : (^{wire6[(1'h0):(1'h0)], wire5[(4'h9):(3'h5)]})),
          $signed($signed(wire3))};
    end
  assign wire8 = $signed(wire2[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire3[(1'h1):(1'h0)])
        begin
          if (((~&reg7) ?
              (wire2 ?
                  ((+{wire1, wire3}) || (^~(wire6 ?
                      wire2 : wire0))) : $unsigned($unsigned((wire0 < wire0)))) : $unsigned($signed(((^wire6) ?
                  {wire5} : {wire0})))))
            begin
              reg9 <= wire8[(1'h0):(1'h0)];
            end
          else
            begin
              reg9 <= (((-($unsigned(reg9) ?
                      (wire0 ? wire5 : wire1) : (^~(8'hb1)))) ?
                  $unsigned(wire0) : {(^(~|wire5))}) - $unsigned($signed(wire2[(3'h5):(3'h4)])));
              reg10 <= (^~$signed((({wire1, (7'h43)} ?
                  wire3[(3'h5):(2'h2)] : (8'hae)) ~^ (^~(-(8'ha2))))));
              reg11 <= (!$signed(reg9));
              reg12 <= wire5[(4'h8):(3'h5)];
              reg13 <= ($unsigned((^((wire4 ? wire5 : wire5) ?
                  ((8'ha5) - reg10) : (~&wire2)))) + reg7);
            end
        end
      else
        begin
          reg9 <= reg7[(1'h1):(1'h0)];
          reg10 <= wire5;
        end
      reg14 <= wire3[(1'h1):(1'h0)];
      if ((reg13[(3'h6):(2'h3)] ?
          ((~reg7) ?
              (wire8[(3'h4):(1'h1)] ?
                  $unsigned(reg11) : wire0) : $unsigned($unsigned((reg11 >> (8'h9f))))) : {reg12[(3'h6):(3'h6)],
              {wire4}}))
        begin
          reg15 <= {((8'h9c) - (^(wire0[(2'h3):(1'h0)] ?
                  wire4[(4'hc):(3'h7)] : (wire0 >>> wire3)))),
              (-({$unsigned((8'h9d))} ?
                  (~&(~&reg12)) : ((wire4 >= reg11) ?
                      wire0[(4'h9):(4'h8)] : reg13)))};
          if (wire0)
            begin
              reg16 <= {$signed((!$signed((reg10 ? reg12 : reg15)))),
                  $unsigned($signed(({reg13} <= $signed(wire1))))};
              reg17 <= $signed(wire4);
              reg18 <= (7'h41);
            end
          else
            begin
              reg16 <= (8'ha8);
            end
          if ($unsigned(wire1))
            begin
              reg19 <= $signed($unsigned((reg12 * {$signed(wire0)})));
              reg20 <= ((8'hbf) ?
                  reg9[(4'hc):(3'h7)] : $signed($signed(($unsigned(wire3) <= {(7'h41),
                      wire2}))));
              reg21 <= ($unsigned($signed($unsigned((reg14 ?
                  wire3 : wire3)))) != $unsigned((wire0[(4'h9):(2'h2)] ?
                  {reg12} : (~^(~|wire2)))));
            end
          else
            begin
              reg19 <= reg11[(2'h2):(1'h0)];
            end
          reg22 <= {(reg16[(2'h3):(2'h3)] * (8'hb7)),
              (reg9[(3'h7):(3'h4)] ?
                  (8'hb6) : {reg17[(2'h2):(1'h0)], wire6[(2'h3):(2'h3)]})};
          reg23 <= (^$unsigned({(wire5[(3'h6):(1'h0)] + $unsigned(wire1)),
              (reg7[(1'h1):(1'h0)] ? (reg7 && wire8) : $unsigned(wire1))}));
        end
      else
        begin
          reg15 <= reg9[(3'h6):(2'h3)];
          reg16 <= reg9[(5'h12):(3'h7)];
          if ((^$signed(reg15[(3'h4):(3'h4)])))
            begin
              reg17 <= (^{$unsigned((((8'hae) + wire0) || {reg15})),
                  (((reg22 || reg18) <= $unsigned(wire8)) ?
                      $unsigned($signed(reg22)) : ($unsigned(reg20) ?
                          reg19[(1'h1):(1'h1)] : (^~(8'hbe))))});
            end
          else
            begin
              reg17 <= ($unsigned(wire8) != reg20[(2'h2):(2'h2)]);
              reg18 <= (~|reg9[(1'h0):(1'h0)]);
              reg19 <= {reg22,
                  ($signed($signed($signed((8'hab)))) ?
                      (((|wire6) ~^ {reg22}) ?
                          ((wire2 | wire6) & ((8'hb6) ?
                              reg9 : (8'ha0))) : (((8'hbc) < wire6) ^ $signed(reg11))) : (+reg14))};
              reg20 <= $signed(wire6[(2'h2):(1'h1)]);
              reg21 <= (&wire1[(3'h5):(3'h4)]);
            end
          if ((reg23[(1'h1):(1'h1)] >= reg13[(1'h1):(1'h1)]))
            begin
              reg22 <= ($unsigned($unsigned((~^wire4))) ?
                  reg23[(3'h6):(3'h4)] : (|{$signed(wire4[(5'h13):(2'h3)])}));
            end
          else
            begin
              reg22 <= (&($unsigned(($unsigned(reg19) <= wire6)) + reg16[(3'h5):(3'h5)]));
              reg23 <= $unsigned($unsigned({$signed((reg12 >= reg16))}));
              reg24 <= (wire5[(1'h0):(1'h0)] << $unsigned(reg15[(2'h3):(1'h0)]));
            end
          reg25 <= reg10[(3'h5):(3'h5)];
        end
    end
  assign wire26 = wire2[(1'h1):(1'h1)];
  assign wire27 = (((~|wire5) >>> (8'hb1)) ?
                      reg9[(5'h13):(3'h7)] : ($signed(reg17[(4'hb):(1'h1)]) << reg18[(1'h0):(1'h0)]));
  assign wire28 = $unsigned(reg11[(4'h9):(3'h4)]);
  assign wire29 = (8'hb4);
  assign wire30 = (!$signed($unsigned((+$unsigned(reg16)))));
  assign wire31 = (^((wire30 ?
                          reg20 : (wire8[(1'h0):(1'h0)] ~^ wire26[(1'h0):(1'h0)])) ?
                      (-wire5) : reg14[(2'h3):(2'h2)]));
  assign wire32 = $unsigned($signed(wire31[(4'h9):(2'h3)]));
  always
    @(posedge clk) begin
      reg33 <= ((wire4[(4'hc):(4'h8)] + (~^reg17[(3'h7):(3'h7)])) ?
          $unsigned(reg18[(3'h4):(2'h2)]) : {((^$signed(reg20)) && ((-(8'hb8)) >= (!wire5))),
              (((wire29 >>> reg19) ? (~&wire4) : {(8'ha5), reg16}) ?
                  (^$unsigned(reg23)) : $unsigned($signed(wire5)))});
    end
  module34 #() modinst77 (.wire39(wire28), .wire36(reg19), .wire35(reg13), .wire38(wire27), .wire37(reg10), .y(wire76), .clk(clk));
  assign wire78 = $unsigned({$unsigned($unsigned((reg19 ? (8'hbb) : reg21))),
                      $unsigned($signed((~reg16)))});
endmodule

module module34  (y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire39;
  input wire signed [(5'h12):(1'h0)] wire38;
  input wire [(4'h8):(1'h0)] wire37;
  input wire signed [(2'h2):(1'h0)] wire36;
  input wire [(4'hb):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire69,
                 wire68,
                 wire66,
                 wire42,
                 wire41,
                 wire40,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire40 = {wire38};
  assign wire41 = $signed(wire38[(1'h1):(1'h1)]);
  assign wire42 = (~$signed((~&wire38[(3'h7):(1'h0)])));
  module43 #() modinst67 (wire66, clk, wire41, wire35, wire40, wire38);
  assign wire68 = wire40[(4'hc):(1'h0)];
  assign wire69 = (8'hbf);
  always
    @(posedge clk) begin
      reg70 <= (wire66[(2'h2):(1'h1)] == (wire36[(1'h0):(1'h0)] <<< (~&($unsigned(wire35) ?
          ((8'ha9) <<< wire69) : $signed(wire36)))));
      reg71 <= wire38[(4'h8):(1'h0)];
      reg72 <= wire40;
      reg73 <= ($signed($unsigned(((~wire37) ~^ $unsigned(wire39)))) ?
          $unsigned(wire39) : {reg71});
    end
  assign wire74 = wire40[(5'h11):(4'hf)];
  assign wire75 = (reg73[(4'ha):(2'h2)] <<< reg72);
endmodule

module module43
#(parameter param64 = (^~(((~&{(8'had), (8'hb5)}) << (((8'ha6) != (8'ha4)) ? (|(8'hbf)) : (~(8'h9e)))) | (|(^((8'h9e) + (8'haf)))))), 
parameter param65 = param64)
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire47;
  input wire [(3'h7):(1'h0)] wire46;
  input wire signed [(5'h12):(1'h0)] wire45;
  input wire [(5'h12):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire48;
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 (1'h0)};
  assign wire48 = wire45[(2'h3):(2'h2)];
  assign wire49 = ($unsigned(wire45[(3'h4):(1'h1)]) || (8'ha4));
  assign wire50 = (((8'h9d) != (~(|wire44))) ?
                      (+(-wire45[(4'h9):(3'h7)])) : $signed($signed($unsigned((~^wire46)))));
  assign wire51 = ({(wire45[(2'h2):(1'h1)] - ({(8'ha3)} >= wire45[(4'he):(1'h0)])),
                      (wire46 ?
                          $unsigned((wire50 != wire48)) : (wire46[(3'h6):(1'h0)] ?
                              $unsigned(wire48) : (wire44 ?
                                  wire44 : wire44)))} + $unsigned($signed(({wire47} ~^ (~|wire48)))));
  assign wire52 = $signed((~{$signed($signed(wire50))}));
  assign wire53 = {wire52};
  assign wire54 = $unsigned($signed(((wire44[(2'h3):(2'h2)] + (wire47 << wire45)) ^~ ((8'ha5) ^ (wire49 ?
                      wire51 : wire48)))));
  assign wire55 = (|(wire52 >>> $signed(($unsigned(wire44) == {(8'h9d)}))));
  assign wire56 = (-wire52[(3'h5):(1'h1)]);
  assign wire57 = $unsigned(wire54);
  assign wire58 = $unsigned($signed($unsigned((^(wire45 ^ wire55)))));
  assign wire59 = wire55;
  assign wire60 = ((($unsigned($unsigned(wire57)) ?
                              $signed(wire54) : {(~wire56), {wire55}}) ?
                          ((&(wire57 - wire57)) ?
                              ((wire55 || wire54) ?
                                  $signed(wire56) : (^~wire59)) : $signed((|wire57))) : $unsigned((wire52[(3'h7):(1'h0)] - (&wire58)))) ?
                      $unsigned($unsigned($unsigned((wire57 ?
                          (7'h40) : wire57)))) : (&(((!wire51) || (~wire59)) - $unsigned((wire52 == wire49)))));
  assign wire61 = $unsigned($unsigned($signed($signed((wire44 ^ wire47)))));
  assign wire62 = wire49[(4'hc):(4'ha)];
  assign wire63 = ({(8'h9d)} >= (-($unsigned($signed(wire47)) ?
                      wire44 : (~(wire61 ? wire47 : wire45)))));
endmodule
