module top
#(parameter param76 = {((((&(7'h43)) ? ((7'h44) != (8'ha2)) : (7'h44)) && {((8'hbd) ? (8'haf) : (8'hbc)), ((8'hb6) ^ (8'hba))}) <<< {(!((8'hae) - (8'h9d))), (((8'ha2) >> (8'hb5)) ? ((8'hbc) ? (8'hbf) : (8'ha3)) : ((8'hbe) && (8'ha8)))}), (&(8'hb5))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire62,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 wire5,
                 wire4,
                 reg70,
                 reg69,
                 reg68,
                 reg64,
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
                 (1'h0)};
  assign wire4 = (~&wire3[(2'h2):(2'h2)]);
  assign wire5 = wire4;
  module6 #() modinst42 (.clk(clk), .wire7(wire2), .y(wire41), .wire9(wire4), .wire8(wire1), .wire10(wire3));
  assign wire43 = wire3[(4'he):(3'h6)];
  assign wire44 = wire5[(4'hc):(3'h4)];
  assign wire45 = (($unsigned(wire41) ?
                          $signed($signed($unsigned(wire41))) : (|($signed(wire41) ?
                              (wire43 ? wire0 : wire43) : ((7'h41) ?
                                  (8'ha0) : wire3)))) ?
                      wire4[(1'h1):(1'h1)] : (~(8'hac)));
  assign wire46 = (+$signed($signed($unsigned(wire44[(2'h3):(1'h1)]))));
  assign wire47 = wire43;
  always
    @(posedge clk) begin
      reg48 <= (wire46 ?
          $unsigned(wire0) : (wire46[(2'h2):(1'h1)] ?
              $unsigned($signed(wire47)) : (((~|wire1) ?
                  (wire2 ^~ wire44) : (wire41 ? wire44 : wire41)) >> wire43)));
      if (($signed(wire46[(2'h2):(1'h0)]) ?
          $signed(wire43) : wire43[(1'h1):(1'h1)]))
        begin
          if (((wire2[(1'h1):(1'h0)] ~^ wire41[(4'hc):(3'h6)]) ?
              (({$signed(wire3)} ?
                  $signed((wire0 >> wire47)) : wire41[(4'he):(3'h7)]) & $unsigned(((wire47 <= wire0) << $signed(wire4)))) : (+wire47)))
            begin
              reg49 <= {($unsigned($signed(wire3[(5'h10):(3'h4)])) ?
                      wire43[(2'h3):(2'h3)] : (wire4[(4'hf):(3'h4)] >> ($unsigned(wire4) == wire2)))};
            end
          else
            begin
              reg49 <= $unsigned(wire2[(4'ha):(1'h1)]);
              reg50 <= wire4;
              reg51 <= ($signed($signed((wire41 >>> wire3))) ?
                  $signed(wire5) : $unsigned($unsigned((8'hb2))));
              reg52 <= reg50[(3'h7):(2'h3)];
              reg53 <= $unsigned($unsigned({(reg48[(4'hb):(3'h4)] - reg49),
                  (~|(reg51 ? reg51 : wire45))}));
            end
          reg54 <= (wire5 == $signed($unsigned(reg48[(4'hb):(4'h8)])));
          reg55 <= ($signed(reg54) <= $signed(($unsigned((wire1 >> reg53)) & wire41[(5'h12):(3'h5)])));
          if ($signed($signed($unsigned(({reg55} && {wire0, (8'hae)})))))
            begin
              reg56 <= ((wire3 == $unsigned({(|wire3), (-reg50)})) ?
                  (8'ha6) : $unsigned($signed((^~reg52[(3'h6):(2'h2)]))));
              reg57 <= (wire43[(2'h2):(1'h0)] ?
                  reg55 : ($unsigned($unsigned($unsigned(wire46))) && $signed(reg51)));
              reg58 <= $signed((((+(|wire47)) ?
                      wire46 : wire45[(4'hd):(4'hd)]) ?
                  $unsigned(({reg52, reg57} >> $signed((7'h43)))) : {(|(reg54 ?
                          (8'ha7) : (7'h44)))}));
              reg59 <= $signed(reg51);
              reg60 <= $signed(reg55[(2'h2):(2'h2)]);
            end
          else
            begin
              reg56 <= $unsigned((+{($signed(wire41) + wire47[(2'h3):(2'h2)]),
                  reg59}));
              reg57 <= (reg50 << (reg52[(3'h7):(3'h7)] >= ((|$signed(reg54)) ?
                  wire45 : {$unsigned(wire0), reg50})));
              reg58 <= $signed(wire5);
            end
        end
      else
        begin
          reg49 <= (^~$signed($unsigned($signed((reg53 ? (8'ha6) : reg49)))));
          reg50 <= ((~$signed($signed({wire0}))) && (~^wire47[(2'h3):(1'h0)]));
        end
      reg61 <= {(8'hae), (+(wire47[(2'h2):(2'h2)] ^ (-(wire47 <= wire3))))};
    end
  assign wire62 = wire43[(4'h8):(4'h8)];
  assign wire63 = (wire3[(3'h6):(2'h3)] ?
                      (wire1[(3'h4):(1'h0)] | (($unsigned((8'hb3)) >> reg48[(2'h3):(1'h1)]) || $unsigned($signed((8'hbc))))) : ($signed({((8'hb6) ?
                              reg54 : reg54),
                          {wire47}}) == (8'ha1)));
  always
    @(posedge clk) begin
      reg64 <= wire3[(4'ha):(4'h9)];
    end
  assign wire65 = $signed({$unsigned(((-wire1) ?
                          $signed(wire41) : ((8'hac) == (7'h42))))});
  assign wire66 = $signed({wire63[(2'h2):(1'h0)]});
  assign wire67 = (&wire46[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg68 <= (~($unsigned(((~^wire46) | (reg58 ?
          reg53 : reg60))) ^~ (reg60 ^ reg56[(4'h9):(1'h0)])));
      reg69 <= $signed(((($signed(reg51) << reg53[(5'h15):(5'h15)]) | ((reg50 ?
              (8'hbe) : wire43) ?
          ((7'h44) && wire62) : (~reg48))) ~^ (&$unsigned(reg59))));
      reg70 <= (~{$unsigned((wire2[(3'h6):(1'h1)] & (wire47 < reg56))),
          wire67});
    end
  assign wire71 = wire45;
  assign wire72 = (^{(reg69 + $unsigned($signed(reg57)))});
  assign wire73 = reg54[(3'h7):(3'h6)];
  assign wire74 = $signed((!((~{wire2, (8'hb8)}) <= ($signed((8'hae)) ?
                      (reg51 ? (8'hb2) : wire3) : (reg56 <= reg53)))));
  assign wire75 = $signed(($signed({(+reg68)}) & ($signed((&wire41)) ?
                      $unsigned((-wire2)) : {$unsigned(wire62),
                          (reg69 >> reg54)})));
endmodule

module module6
#(parameter param40 = (8'ha1))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h17c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire20;
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 wire20,
                 reg33,
                 reg31,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed((((wire10[(3'h6):(3'h5)] ^~ (~|(8'hba))) ^~ wire7[(3'h6):(3'h4)]) - {{wire8}})))
        begin
          reg11 <= wire10;
          reg12 <= $unsigned((~^(!reg11)));
          reg13 <= (wire7[(1'h0):(1'h0)] ?
              {(((wire10 ? wire8 : wire8) ?
                          $unsigned((8'hb9)) : {reg11, wire8}) ?
                      $unsigned($unsigned(reg11)) : wire9[(3'h4):(3'h4)])} : {$unsigned($unsigned(wire7)),
                  wire7[(3'h6):(3'h4)]});
        end
      else
        begin
          if ((wire7[(1'h0):(1'h0)] ~^ $unsigned((~|reg12))))
            begin
              reg11 <= ($unsigned($unsigned(reg12[(1'h1):(1'h1)])) << wire8[(4'ha):(2'h3)]);
            end
          else
            begin
              reg11 <= $unsigned((($unsigned(reg12) ?
                  (8'ha1) : wire7[(2'h3):(1'h0)]) >> reg11));
              reg12 <= $signed(wire9);
              reg13 <= (|(-($unsigned({reg11,
                  wire10}) && (reg11 && (~|wire9)))));
            end
          reg14 <= $signed(({{wire8[(3'h5):(3'h5)], $signed((8'ha3))},
              {(&wire8), {wire8, reg12}}} <= reg12[(2'h3):(1'h0)]));
        end
    end
  always
    @(posedge clk) begin
      reg15 <= wire7;
      reg16 <= ($unsigned({$signed((reg12 ?
              wire10 : wire7))}) | wire8[(3'h6):(3'h4)]);
      reg17 <= (~&(wire9 ?
          $unsigned(wire8[(2'h2):(1'h1)]) : $unsigned($signed(wire7))));
      reg18 <= $unsigned({(^~(wire10 ? (&wire10) : wire9[(2'h2):(2'h2)]))});
      reg19 <= wire8;
    end
  assign wire20 = wire7[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg21 <= ({$unsigned(reg14),
              (($unsigned(reg19) ? reg18[(1'h0):(1'h0)] : $unsigned(wire7)) ?
                  reg19 : (~|wire10))} ?
          reg15 : {reg13, $signed($signed({(8'haa), reg16}))});
    end
  always
    @(posedge clk) begin
      reg22 <= ($unsigned((~(wire8 + (reg19 > (8'hbb))))) ?
          (reg21 ?
              $unsigned((~^reg19)) : wire20[(4'ha):(2'h3)]) : $unsigned(reg19));
      if ($unsigned(reg22))
        begin
          reg23 <= (reg12[(3'h6):(3'h5)] ? wire9 : reg13[(2'h3):(2'h3)]);
        end
      else
        begin
          if ((reg23 ?
              (~&$signed($unsigned(((8'hb0) ?
                  reg14 : wire7)))) : reg19[(4'h9):(3'h5)]))
            begin
              reg23 <= reg17[(4'h8):(4'h8)];
              reg24 <= (^~({$signed($unsigned(wire20))} ?
                  (+wire9[(3'h4):(2'h3)]) : wire8));
              reg25 <= (wire20 || $unsigned($signed(wire7)));
              reg26 <= $signed(((~^$signed((reg15 ? wire9 : reg23))) ?
                  ($unsigned((8'ha7)) & ((wire8 ?
                      wire8 : reg19) != reg23[(3'h5):(1'h1)])) : (!$unsigned((!wire10)))));
            end
          else
            begin
              reg23 <= $unsigned(wire9[(2'h3):(2'h3)]);
              reg24 <= (~|(~^{wire20, reg21[(3'h4):(2'h3)]}));
              reg25 <= {($unsigned(((reg23 <<< wire20) ?
                      (reg22 ?
                          reg16 : wire7) : reg18[(3'h7):(3'h7)])) == reg18[(4'hb):(4'ha)])};
              reg26 <= ((($signed($unsigned(reg26)) ?
                      ($signed((8'haf)) ?
                          {reg23} : (reg13 == reg24)) : $unsigned(wire7)) ?
                  $unsigned({{reg25},
                      (reg17 ?
                          reg12 : (8'haa))}) : reg23) | $unsigned((~&$unsigned(reg19))));
              reg27 <= (|{(8'hac)});
            end
          reg28 <= (reg18 ?
              reg19[(4'hc):(4'hc)] : $signed((reg27 | ($signed(reg27) ^ $signed(reg23)))));
          reg29 <= ((~&reg19) ?
              $unsigned($unsigned(wire7)) : ($signed(($unsigned(reg15) ?
                  $unsigned(wire9) : (8'h9d))) ^ (reg18 ? reg22 : reg21)));
          reg30 <= reg16[(4'hd):(4'h9)];
        end
      reg31 <= reg15[(1'h1):(1'h0)];
    end
  assign wire32 = $signed(((^$signed({(8'hab), reg28})) ?
                      reg11 : ((-$signed(reg29)) ?
                          (~$unsigned(reg23)) : $unsigned($unsigned((8'ha5))))));
  always
    @(posedge clk) begin
      reg33 <= ((~|(&(7'h41))) ?
          reg13 : ($unsigned(((~&reg23) ? (-reg29) : (reg27 ? reg29 : reg17))) ?
              (+wire9) : ({reg24, (reg24 - reg27)} ?
                  $signed($signed((7'h40))) : $signed(wire8[(3'h7):(3'h5)]))));
    end
  assign wire34 = reg18;
  assign wire35 = $signed((|(~&reg15)));
  assign wire36 = ((!wire7[(2'h3):(1'h1)]) ?
                      ({({(8'haa)} & (reg12 != wire8)),
                              $unsigned({reg28, (8'ha1)})} ?
                          reg21[(4'ha):(2'h3)] : (((8'ha6) >>> $unsigned(reg13)) != {(reg30 ?
                                  (7'h42) : reg26)})) : $unsigned($signed($unsigned((reg13 ?
                          reg28 : reg27)))));
  assign wire37 = reg16;
  assign wire38 = ({(reg26[(5'h14):(4'hf)] < $signed((8'hb0))),
                          ({reg22} ?
                              (reg26 >>> (&reg13)) : $unsigned({(8'hbd),
                                  reg30}))} ?
                      wire36 : (+($unsigned(((8'hbd) || wire7)) && ({reg14} <= (~&reg22)))));
  assign wire39 = (^~(~^$signed(reg12[(4'ha):(4'h9)])));
endmodule
