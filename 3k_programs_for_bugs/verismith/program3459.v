module top #(parameter param83 = (8'hbc)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  assign y = {wire81,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 (1'h0)};
  assign wire4 = $unsigned(((($signed(wire2) && (~^wire3)) ^ ((|wire2) ?
                         (wire1 ~^ (8'hbe)) : {wire3, wire1})) ?
                     (((wire3 ?
                         wire2 : wire0) ^ (^wire1)) * $signed((wire1 * wire3))) : (((~^wire3) >= {wire0}) - wire0)));
  assign wire5 = (^~($signed((wire3 ?
                     (wire1 ? wire1 : wire2) : ((7'h42) ?
                         wire2 : wire2))) << ((!(8'hb8)) ?
                     $signed($unsigned(wire0)) : ({wire2,
                         (8'h9c)} | (wire2 <<< wire2)))));
  assign wire6 = $unsigned($signed({$signed((-wire1))}));
  assign wire7 = (~|$unsigned((wire0[(3'h6):(1'h1)] ?
                     $signed($signed(wire5)) : $signed((|wire0)))));
  always
    @(posedge clk) begin
      if ({($unsigned(wire3) ?
              $unsigned(wire1[(4'hc):(4'hc)]) : (^$unsigned(wire2[(3'h7):(1'h0)]))),
          (~|$signed(wire3))})
        begin
          reg8 <= (wire7[(1'h1):(1'h0)] ?
              wire7[(2'h3):(1'h1)] : ((^~$unsigned((+wire5))) ?
                  $unsigned(wire5) : $signed({wire5,
                      (wire1 ? wire6 : wire6)})));
          if ($unsigned((8'h9d)))
            begin
              reg9 <= $unsigned(wire3[(1'h0):(1'h0)]);
              reg10 <= ({wire0[(1'h1):(1'h0)]} - (~(&(~reg9[(3'h6):(3'h4)]))));
              reg11 <= reg10[(4'h9):(1'h0)];
            end
          else
            begin
              reg9 <= $unsigned($unsigned((^{(reg9 ~^ wire5),
                  $signed((8'hb0))})));
              reg10 <= $unsigned(wire4);
              reg11 <= wire5;
              reg12 <= ((8'hbb) ?
                  wire3[(3'h5):(1'h1)] : (^$unsigned(($unsigned((8'ha6)) ?
                      {reg8} : $unsigned(wire4)))));
              reg13 <= {(~^reg9)};
            end
          reg14 <= $signed(wire5[(4'hd):(3'h4)]);
          reg15 <= (({($signed((8'hb6)) ?
                  reg10[(1'h1):(1'h1)] : (reg14 ? wire7 : wire2)),
              wire6[(1'h0):(1'h0)]} >> (&wire5)) >>> reg9[(4'h8):(3'h5)]);
          reg16 <= ($signed($signed((~&(reg11 ? reg12 : wire6)))) ?
              (($signed((&wire2)) != {reg12, {wire6}}) ?
                  ($unsigned(((8'ha1) ? wire0 : reg11)) ?
                      $signed(reg13[(3'h4):(3'h4)]) : $signed({wire3,
                          (8'hac)})) : {{(reg10 == reg14)}}) : $signed(($signed({reg12,
                      reg15}) ?
                  wire3[(3'h5):(1'h0)] : $unsigned(reg9))));
        end
      else
        begin
          if ((^reg13))
            begin
              reg8 <= reg13;
              reg9 <= $signed(reg10);
              reg10 <= (~|(^(-(!reg12[(4'hc):(4'hc)]))));
              reg11 <= wire4[(1'h0):(1'h0)];
              reg12 <= wire0[(4'hb):(2'h2)];
            end
          else
            begin
              reg8 <= ($signed((wire5[(4'hd):(3'h7)] ?
                      (reg9[(2'h3):(2'h3)] ~^ (reg10 + wire0)) : reg11[(4'h8):(2'h2)])) ?
                  $signed(wire0[(4'he):(4'he)]) : $signed((reg8 > $unsigned(reg12[(4'ha):(1'h1)]))));
            end
          if (($unsigned($signed($signed((reg16 ?
              wire3 : (8'hb1))))) ^ $unsigned((+{(reg12 ? wire7 : wire0)}))))
            begin
              reg13 <= (^~wire2);
              reg14 <= wire4;
              reg15 <= (((~$unsigned(wire7)) ?
                      ((&$signed(reg9)) >>> $signed((reg10 >= wire0))) : ((|(~reg11)) ?
                          wire4[(2'h2):(1'h1)] : (wire4 ?
                              $signed((8'hb6)) : reg12))) ?
                  wire4[(3'h4):(2'h3)] : (-((reg16[(1'h0):(1'h0)] ~^ $unsigned(reg10)) && {reg10})));
            end
          else
            begin
              reg13 <= $signed(reg16[(2'h2):(1'h1)]);
            end
          if ($unsigned(reg13))
            begin
              reg16 <= wire2[(3'h5):(3'h4)];
              reg17 <= ((8'hac) & $unsigned($unsigned(wire1[(4'he):(4'ha)])));
            end
          else
            begin
              reg16 <= $unsigned($signed(wire0[(4'hb):(1'h0)]));
              reg17 <= $unsigned(wire3);
              reg18 <= wire6;
              reg19 <= (($unsigned(((^~reg17) ?
                      wire5[(3'h4):(1'h0)] : ((7'h43) == wire2))) ?
                  $unsigned((reg9 << reg14[(4'ha):(3'h4)])) : ({{wire5}} ?
                      $signed($unsigned(reg9)) : (|wire2))) + wire5[(3'h4):(2'h2)]);
            end
          reg20 <= (reg12[(4'h8):(2'h3)] ?
              reg11[(1'h1):(1'h0)] : wire0[(4'h9):(4'h8)]);
          if (($signed(($unsigned(reg13[(5'h14):(3'h5)]) ?
              (wire6[(5'h12):(4'ha)] >>> $signed((8'hb2))) : ($unsigned(reg17) & reg18))) << (($signed(reg17[(3'h4):(1'h0)]) || reg8[(3'h4):(1'h0)]) ?
              (^reg18) : (reg19[(3'h5):(2'h2)] | reg10[(2'h2):(1'h1)]))))
            begin
              reg21 <= (!reg13);
              reg22 <= (reg17 == reg12);
              reg23 <= (wire7[(1'h1):(1'h0)] ?
                  $signed($unsigned(((reg17 >> reg21) ?
                      (~reg22) : (reg22 >> reg19)))) : reg9[(4'h9):(2'h2)]);
            end
          else
            begin
              reg21 <= $unsigned((|$unsigned(((reg16 ? (8'hb3) : wire3) ?
                  {reg18, reg10} : (reg11 ? wire1 : wire5)))));
            end
        end
      reg24 <= (reg17 == wire2);
      if ($signed(reg10))
        begin
          reg25 <= ($signed((8'hbf)) >= {reg11[(2'h2):(2'h2)], wire4});
          reg26 <= (-(~^$signed(wire3[(1'h0):(1'h0)])));
          reg27 <= $signed((^wire0[(3'h4):(1'h0)]));
          reg28 <= (|reg25[(2'h2):(2'h2)]);
          reg29 <= ($unsigned((^~$signed((&reg16)))) >= (((reg19 ?
                      $unsigned(wire0) : reg14[(1'h1):(1'h0)]) ?
                  reg11 : $signed(wire4[(2'h3):(2'h3)])) ?
              $signed($unsigned((reg9 | wire4))) : (!($unsigned((8'ha0)) ?
                  (reg18 - reg15) : reg24))));
        end
      else
        begin
          if ({reg15[(3'h7):(3'h7)]})
            begin
              reg25 <= ($unsigned($signed(($signed((8'ha3)) << (^~reg29)))) + wire7[(2'h2):(2'h2)]);
              reg26 <= $signed(reg17);
            end
          else
            begin
              reg25 <= $signed($unsigned($unsigned(((reg21 << (8'hb6)) ?
                  $signed((8'hb3)) : (reg8 ? reg27 : (8'hb9))))));
              reg26 <= $unsigned(reg8[(3'h6):(2'h2)]);
              reg27 <= ((reg16 ?
                  ((|reg29[(3'h6):(3'h4)]) <= $unsigned(reg11[(2'h3):(1'h0)])) : reg28) <<< $unsigned((reg14 ?
                  (reg15[(3'h4):(1'h1)] ?
                      reg8 : reg15[(1'h0):(1'h0)]) : (~&$signed(reg29)))));
              reg28 <= $signed((+(~{$signed((8'hbb))})));
              reg29 <= reg27[(2'h2):(2'h2)];
            end
          reg30 <= reg29[(4'h9):(2'h2)];
          reg31 <= wire0;
          reg32 <= {($signed(reg26) < $unsigned({(reg11 ? (8'hb2) : reg15),
                  $unsigned(reg14)})),
              $unsigned(((reg15[(4'h9):(3'h4)] ?
                  {wire4,
                      reg9} : wire5[(1'h0):(1'h0)]) & reg22[(3'h6):(3'h6)]))};
        end
    end
  module33 #() modinst82 (wire81, clk, reg21, wire5, wire4, reg11, reg9);
endmodule

module module33
#(parameter param79 = ({({(~(8'ha4))} & (!((8'hb3) ? (8'hb3) : (8'hae))))} < ((~&({(8'ha9), (8'haa)} ? (+(8'had)) : ((8'hbc) ? (8'hbe) : (8'hb5)))) == (!((&(8'hac)) ? (+(8'haa)) : ((8'ha7) ? (8'ha6) : (8'ha2)))))), 
parameter param80 = param79)
(y, clk, wire34, wire35, wire36, wire37, wire38);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire34;
  input wire signed [(5'h15):(1'h0)] wire35;
  input wire signed [(5'h10):(1'h0)] wire36;
  input wire signed [(4'hc):(1'h0)] wire37;
  input wire signed [(3'h4):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire75;
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire39,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire75,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 (1'h0)};
  assign wire39 = wire34;
  always
    @(posedge clk) begin
      reg40 <= ((^$signed(wire38)) ?
          (~&wire37) : {($unsigned((wire39 ? wire36 : wire37)) ?
                  (^~wire36) : wire34),
              (({wire37, wire34} ?
                      (wire34 ? wire35 : wire39) : wire37[(3'h5):(3'h5)]) ?
                  $unsigned($signed(wire34)) : ($unsigned((8'ha5)) * $unsigned((7'h42))))});
      reg41 <= ((~(8'hac)) | (reg40 << ($unsigned(wire36[(4'h8):(1'h1)]) == {((7'h42) ?
              wire37 : wire34),
          wire34[(3'h6):(2'h2)]})));
      reg42 <= wire37[(3'h5):(2'h3)];
      reg43 <= (((8'ha4) ?
          (wire35[(1'h0):(1'h0)] + reg40[(3'h7):(2'h3)]) : (({wire37} ?
              wire39 : wire35[(1'h1):(1'h0)]) >= wire34)) && ((~|(reg40 > $unsigned((7'h43)))) ?
          (8'hb6) : wire37));
    end
  assign wire44 = wire35;
  assign wire45 = (^~wire37[(4'hb):(2'h3)]);
  assign wire46 = ({reg42} ?
                      $signed({{((7'h42) ? wire38 : wire35)},
                          (^wire44[(5'h13):(4'hf)])}) : (-{$signed($signed(reg41)),
                          $signed(reg43)}));
  assign wire47 = wire36[(4'hf):(3'h6)];
  assign wire48 = ($signed($signed(wire47)) ?
                      (8'hac) : (&$unsigned({(wire38 <<< wire44)})));
  assign wire49 = ((-((|$signed(wire47)) && (|{wire47,
                      wire45}))) + (|(!reg40[(3'h5):(2'h3)])));
  assign wire50 = (~|(8'h9c));
  assign wire51 = reg43;
  assign wire52 = (wire36[(1'h1):(1'h1)] <= (-$signed(((wire45 >>> (8'hb7)) ^ (-wire38)))));
  module53 #() modinst76 (wire75, clk, reg42, reg41, reg43, wire35);
  assign wire77 = {wire35};
  assign wire78 = (&(+(((~wire46) | reg40) & {wire45})));
endmodule

module module53  (y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire57;
  input wire [(4'hc):(1'h0)] wire56;
  input wire signed [(3'h4):(1'h0)] wire55;
  input wire [(5'h15):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire71;
  wire [(2'h3):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  wire signed [(4'ha):(1'h0)] wire67;
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 reg72,
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
      reg58 <= wire56[(2'h3):(1'h0)];
      reg59 <= $signed(((|wire57) ^ (&(((8'hb8) || wire54) == {wire57}))));
      reg60 <= {$unsigned((wire57[(3'h5):(2'h2)] >> reg59))};
      if (wire54[(5'h10):(3'h7)])
        begin
          reg61 <= ({(((8'hac) ? $signed(wire56) : {wire57, reg60}) & reg58),
                  (~$signed(((8'hb8) >= (8'ha8))))} ?
              {{$unsigned({(8'hac)})}} : ($signed(wire54[(5'h14):(4'hb)]) ?
                  $signed($unsigned($unsigned(reg58))) : wire57));
        end
      else
        begin
          reg61 <= reg59;
          reg62 <= (reg60[(1'h0):(1'h0)] * wire54);
          reg63 <= (((((~^reg60) ^~ (wire56 ?
                  reg59 : reg58)) != ((8'ha3) ~^ reg60[(1'h1):(1'h1)])) ?
              {((reg58 != wire57) ? $unsigned(reg60) : $unsigned(wire54)),
                  wire55} : $signed(({(8'h9e), (8'hb4)} || ((8'ha5) ?
                  wire57 : reg62)))) >>> (8'hbd));
          reg64 <= ((wire55[(1'h1):(1'h0)] <= ((reg59[(3'h5):(2'h2)] ?
                      reg58 : {wire54, (7'h43)}) ?
                  wire55 : wire56[(4'hc):(2'h2)])) ?
              {$signed(wire55[(2'h2):(1'h1)])} : reg60[(1'h1):(1'h1)]);
          reg65 <= $signed($unsigned($unsigned($signed(wire55[(1'h0):(1'h0)]))));
        end
      reg66 <= $unsigned((($unsigned(reg62) ?
          (wire55[(3'h4):(3'h4)] ?
              (wire56 ? reg58 : wire55) : (reg64 - wire57)) : (reg64 ?
              wire55 : (reg65 ?
                  reg60 : reg61))) << $signed((~^(reg65 >> reg62)))));
    end
  assign wire67 = (((~&wire56) | (reg63 << (~|{reg60}))) ?
                      wire57 : ((({reg61} && (reg66 ?
                              reg62 : reg63)) + wire57[(1'h1):(1'h1)]) ?
                          ($unsigned($signed(reg59)) && ((wire56 ?
                              reg58 : wire56) > $unsigned(wire56))) : $unsigned(wire56)));
  assign wire68 = $signed((~|(&$signed({reg66, reg61}))));
  assign wire69 = $signed($unsigned(reg61[(2'h3):(1'h0)]));
  assign wire70 = (-wire68[(1'h1):(1'h0)]);
  assign wire71 = (wire54 * $signed({(+wire56)}));
  always
    @(posedge clk) begin
      reg72 <= wire55;
    end
  assign wire73 = $unsigned(reg66);
  assign wire74 = (&((^reg65) ?
                      $signed(wire69) : ($unsigned($unsigned(wire70)) || {wire68[(5'h10):(4'hf)],
                          $signed(wire73)})));
endmodule
