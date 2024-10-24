module top
#(parameter param77 = ({(~(((8'hb6) ? (8'hbd) : (8'h9e)) ? (!(8'h9e)) : ((8'hba) ? (8'h9c) : (8'ha7)))), ({{(8'hab), (8'h9e)}, (~^(8'h9f))} < ((8'ha4) || (~(7'h43))))} ? ((~&(^~(&(8'hbc)))) <<< (((|(8'hbe)) ? ((8'hba) ? (7'h41) : (8'h9e)) : (|(8'hbc))) ? ({(8'hbb), (8'h9d)} < ((8'h9f) - (7'h41))) : (~|((8'ha8) >> (8'hbb))))) : (8'had)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  assign y = {wire75,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire21,
                 wire11,
                 wire10,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg22,
                 reg23,
                 reg29,
                 reg30,
                 reg31,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire4[(2'h2):(1'h1)];
      reg6 <= $signed($unsigned(reg5));
      reg7 <= $unsigned($unsigned((+{$unsigned(reg6)})));
      reg8 <= ({reg6} ?
          $signed((8'ha4)) : ({wire4} > (wire3[(4'h8):(1'h1)] >= (8'hb7))));
      reg9 <= {$unsigned(wire0[(3'h4):(2'h2)])};
    end
  assign wire10 = (wire3[(3'h7):(1'h1)] >>> $signed(($unsigned($unsigned(wire0)) ?
                      ($unsigned(reg9) ?
                          (reg5 ?
                              (8'hb2) : wire1) : {reg8}) : $signed((wire3 != reg7)))));
  assign wire11 = (~reg5[(4'hc):(2'h3)]);
  always
    @(posedge clk) begin
      if ((reg8 - $unsigned($signed($signed(wire4[(1'h0):(1'h0)])))))
        begin
          reg12 <= $signed(((reg7 | $signed((8'hb1))) ?
              $unsigned(wire10[(5'h10):(4'hb)]) : $signed($unsigned(wire10[(5'h13):(4'h9)]))));
          if (((((~|(wire1 ? wire0 : wire10)) ?
                      (~|(wire11 ? wire3 : wire1)) : (~^{reg6, wire1})) ?
                  reg5[(1'h0):(1'h0)] : {(reg7[(3'h4):(2'h3)] ?
                          wire2 : $unsigned(reg12))}) ?
              $signed(reg8[(3'h4):(1'h0)]) : $unsigned($unsigned(wire2[(2'h2):(2'h2)]))))
            begin
              reg13 <= wire1[(2'h3):(1'h1)];
              reg14 <= reg12[(1'h1):(1'h1)];
            end
          else
            begin
              reg13 <= $unsigned(({(reg7[(4'ha):(3'h4)] << wire4)} >> (~reg9[(3'h5):(3'h4)])));
              reg14 <= (-$signed($signed($signed($signed(wire4)))));
              reg15 <= wire4;
            end
        end
      else
        begin
          if ((^~reg7[(1'h0):(1'h0)]))
            begin
              reg12 <= (($unsigned(((^wire10) | $signed((7'h42)))) ?
                  reg9 : (7'h40)) + reg7);
            end
          else
            begin
              reg12 <= reg5[(1'h1):(1'h0)];
              reg13 <= $signed($unsigned(reg5[(2'h3):(1'h1)]));
            end
          reg14 <= (((~reg14) << {($signed((8'hb2)) && (^~wire0))}) != (~|reg5));
          reg15 <= ($unsigned((((reg5 != wire4) ?
                  $signed(wire4) : wire3[(1'h0):(1'h0)]) != {$signed(wire0),
                  (-(8'hb0))})) ?
              wire2 : (8'had));
          reg16 <= (~|((($signed(reg14) ?
                  reg8[(2'h2):(1'h0)] : $signed(wire3)) ?
              reg7[(4'he):(3'h6)] : reg7[(3'h5):(1'h0)]) == $unsigned((+reg8))));
        end
      reg17 <= ((+(!$signed((8'hbb)))) ?
          $unsigned(((8'ha1) >> ((~&reg14) ?
              {reg16} : {(8'ha1),
                  wire0}))) : ($unsigned($unsigned({reg14})) > wire3[(2'h3):(1'h0)]));
      reg18 <= (reg15 ?
          reg12[(2'h2):(1'h0)] : ((&$signed(((8'ha7) | reg6))) ?
              wire11[(1'h0):(1'h0)] : $signed(($unsigned(reg16) ^ (reg14 ?
                  wire11 : (8'h9d))))));
      reg19 <= $unsigned((8'hb8));
      reg20 <= wire0[(1'h1):(1'h1)];
    end
  assign wire21 = reg17[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg22 <= ($unsigned((reg15[(3'h4):(3'h4)] >>> ((wire21 - (8'ha1)) ?
          (wire1 ^~ (8'hbc)) : $signed((8'ha8))))) ~^ ({$signed($unsigned(wire10))} || ($signed($signed(reg19)) ?
          ($unsigned(wire2) ? wire1 : (reg20 >> reg6)) : ((^~wire4) ?
              reg19 : reg19[(2'h2):(1'h1)]))));
      reg23 <= $unsigned((8'hbc));
    end
  assign wire24 = (8'hbd);
  assign wire25 = $signed(reg5[(4'ha):(3'h7)]);
  assign wire26 = (reg7[(1'h1):(1'h0)] ^~ wire25[(4'hf):(2'h3)]);
  assign wire27 = $signed((|wire2));
  assign wire28 = (8'ha9);
  always
    @(posedge clk) begin
      reg29 <= (~reg22[(2'h2):(1'h0)]);
      reg30 <= wire0[(2'h2):(1'h0)];
      reg31 <= $signed($unsigned($signed(wire21)));
    end
  module32 #() modinst76 (wire75, clk, wire4, wire3, wire27, reg6, wire26);
endmodule

module module32
#(parameter param73 = ((&((~&((8'hbe) >>> (8'ha8))) >> ((~^(8'hb5)) ? (~(7'h40)) : ((8'ha3) ? (8'hb0) : (8'hb4))))) && (+((7'h43) ? (^((8'ha0) ? (7'h44) : (8'hbe))) : (+(-(7'h43)))))), 
parameter param74 = (-{((^~param73) - (^~{param73, param73})), param73}))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire37;
  input wire [(4'hd):(1'h0)] wire36;
  input wire [(4'he):(1'h0)] wire35;
  input wire [(5'h14):(1'h0)] wire34;
  input wire [(5'h10):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
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
                 reg49,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg38 <= wire35[(4'hc):(4'ha)];
      if ($signed(wire35))
        begin
          reg39 <= wire34[(4'he):(3'h7)];
          reg40 <= (wire34 ?
              (($unsigned(((8'hb5) + (8'ha1))) ?
                  $unsigned(wire37[(4'h9):(3'h6)]) : (reg38[(2'h3):(2'h2)] << $signed((8'ha2)))) + wire33[(1'h1):(1'h0)]) : $unsigned(wire36));
          reg41 <= wire36;
          reg42 <= $unsigned({(wire33[(3'h6):(1'h0)] & $unsigned({wire34}))});
        end
      else
        begin
          reg39 <= (((^($unsigned(reg42) ?
              wire34 : (~reg42))) >>> ((~|$signed((7'h44))) ?
              $unsigned($unsigned(reg41)) : ($unsigned(wire35) == (wire37 * wire35)))) - (reg40[(1'h1):(1'h0)] ?
              (!$signed({reg39, wire33})) : reg42));
          reg40 <= ($signed($signed({{(8'hac)}})) ?
              $signed($unsigned($unsigned($signed(reg41)))) : $unsigned($unsigned(($signed(wire36) ?
                  (8'hac) : wire34[(4'hb):(2'h3)]))));
        end
      reg43 <= {(^wire34[(4'h8):(1'h0)]),
          {(reg42[(4'hc):(2'h2)] ?
                  (reg40[(4'h9):(1'h1)] ?
                      wire37[(4'h9):(2'h3)] : reg40[(1'h0):(1'h0)]) : (reg39[(2'h2):(1'h1)] ?
                      (wire37 ? reg41 : reg38) : (wire34 ? wire33 : reg38))),
              (reg40[(4'hd):(3'h6)] ?
                  ((|(8'hb1)) ?
                      (reg40 * reg38) : ((8'hba) || wire35)) : reg42)}};
      reg44 <= $signed(((reg39[(4'ha):(2'h3)] ?
          (+reg39[(1'h0):(1'h0)]) : {$unsigned(reg40)}) <<< ($unsigned({wire34}) ?
          (^reg38[(2'h2):(2'h2)]) : $unsigned({reg39}))));
    end
  assign wire45 = {reg42[(4'ha):(2'h2)]};
  assign wire46 = ($signed(wire36) ?
                      wire35[(3'h4):(1'h0)] : (-(wire45 != $unsigned({(8'h9d),
                          reg38}))));
  assign wire47 = $unsigned((wire35[(3'h4):(2'h3)] <<< $unsigned((-(-reg39)))));
  assign wire48 = wire36[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg49 <= {(reg43[(3'h4):(1'h0)] ?
              ($unsigned($unsigned((8'hac))) << wire33) : reg42[(4'hf):(4'h9)]),
          {$unsigned({(reg44 == wire47), {reg44}}), (^~reg38)}};
    end
  always
    @(posedge clk) begin
      if (reg39[(3'h7):(2'h2)])
        begin
          if ((~^{(^~(^{wire35, wire36}))}))
            begin
              reg50 <= (wire47 == $unsigned($unsigned(wire33)));
              reg51 <= wire48;
              reg52 <= ({wire45} ?
                  $unsigned({reg41}) : $signed(reg40[(3'h4):(2'h2)]));
              reg53 <= (!(~|(wire34[(3'h6):(3'h4)] << ((~^wire35) ?
                  (reg42 ? (8'ha0) : (8'hb6)) : {reg39, reg40}))));
              reg54 <= $unsigned($unsigned($signed(reg44[(4'h8):(1'h1)])));
            end
          else
            begin
              reg50 <= (wire46 ^ (~&$signed($unsigned($unsigned(reg43)))));
              reg51 <= $unsigned(($unsigned(wire36) ?
                  reg41[(4'h8):(2'h2)] : reg52));
              reg52 <= (reg54[(2'h3):(2'h3)] ^ ((~&$signed(reg50)) || reg42));
              reg53 <= $unsigned(reg44);
              reg54 <= reg43;
            end
          reg55 <= wire34[(5'h10):(4'h8)];
          reg56 <= $signed($signed($signed($signed((reg43 && wire36)))));
        end
      else
        begin
          reg50 <= ((^{(~wire45), (!$signed((7'h42)))}) < reg53[(1'h0):(1'h0)]);
          if ($unsigned(reg50))
            begin
              reg51 <= $signed(wire45[(3'h7):(3'h4)]);
              reg52 <= ($unsigned((!$signed((+reg38)))) >> (($signed(reg44[(3'h6):(2'h3)]) ?
                  (wire36 ?
                      (8'ha3) : (reg41 ?
                          wire46 : reg51)) : reg51) >>> (^~(reg42[(4'h9):(3'h5)] ?
                  reg40 : reg49))));
              reg53 <= reg51;
              reg54 <= $signed(wire48[(3'h5):(3'h5)]);
              reg55 <= ($signed(reg54[(4'h9):(1'h0)]) ?
                  ((~&$signed(reg39[(4'ha):(2'h3)])) > (8'hb9)) : ((({reg41,
                          reg40} ?
                      {wire35} : reg54[(4'he):(4'hb)]) - wire34[(4'h8):(1'h1)]) ^~ (~&(-wire35[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg51 <= $unsigned((^(reg38[(2'h2):(2'h2)] ?
                  (+wire35[(1'h1):(1'h1)]) : (~|wire37))));
              reg52 <= ((+(((wire34 <= (7'h42)) >> (-reg38)) ?
                      reg40[(3'h5):(3'h5)] : ((wire45 ? (7'h43) : reg38) ?
                          (reg43 ~^ reg43) : $signed(wire36)))) ?
                  ((~&reg50) ?
                      ($unsigned(reg39[(1'h0):(1'h0)]) & ($signed(reg52) ?
                          reg40[(4'hf):(4'he)] : $signed(wire34))) : reg38) : $unsigned(((~wire36[(2'h2):(2'h2)]) * (~^wire37))));
              reg53 <= $unsigned((+($unsigned((wire46 ?
                  reg49 : wire35)) >> (^reg40))));
              reg54 <= reg51[(3'h5):(3'h4)];
            end
          if ((^~reg50))
            begin
              reg56 <= reg42[(4'hd):(3'h6)];
              reg57 <= $unsigned(reg44[(2'h3):(2'h3)]);
              reg58 <= ($unsigned((~&($unsigned(reg57) ?
                  $unsigned((8'ha5)) : (reg38 ?
                      reg42 : reg54)))) * wire35[(2'h3):(2'h3)]);
              reg59 <= reg55;
            end
          else
            begin
              reg56 <= $signed($unsigned(($unsigned($unsigned((8'hae))) ^ ($unsigned(wire45) ?
                  wire47[(1'h0):(1'h0)] : $unsigned(reg40)))));
              reg57 <= (~&(($signed((reg56 ?
                  reg59 : reg56)) && (8'hbf)) | reg38[(3'h4):(3'h4)]));
              reg58 <= (((8'ha4) >>> (wire37[(3'h7):(3'h7)] == $unsigned(wire34[(5'h10):(4'h9)]))) ?
                  reg50 : wire36[(3'h7):(2'h2)]);
            end
        end
      reg60 <= (wire34 * reg54[(4'h8):(3'h6)]);
      if ((((reg58 ?
          (~$signed((8'h9f))) : {wire48,
              (reg40 ?
                  reg56 : wire46)}) | $signed(($unsigned(reg39) & (-reg50)))) + ((~&({reg58,
                  wire47} ?
              reg44[(2'h2):(2'h2)] : $unsigned(reg56))) ?
          $signed((^$signed(reg43))) : reg53[(1'h0):(1'h0)])))
        begin
          reg61 <= wire48;
          reg62 <= {($unsigned($unsigned(reg54[(4'hc):(3'h6)])) & $unsigned(reg55)),
              ({reg54} < reg57)};
          reg63 <= ((~&reg44[(1'h1):(1'h0)]) || reg60);
        end
      else
        begin
          reg61 <= ((reg56[(3'h7):(2'h3)] ?
                  reg52 : (|(reg43 ~^ (reg59 - reg61)))) ?
              $signed(($unsigned((~|reg44)) ? (+(|reg52)) : {reg38})) : reg42);
          reg62 <= ({reg55[(1'h0):(1'h0)], {$signed({reg57, (8'hbd)})}} ?
              {(8'h9f)} : reg61);
          if ((8'hb1))
            begin
              reg63 <= $unsigned({$unsigned(reg58[(3'h4):(2'h3)]),
                  wire37[(4'he):(3'h4)]});
            end
          else
            begin
              reg63 <= wire45;
              reg64 <= ({(~^((reg57 ~^ reg59) << (~|wire46))),
                  (!(reg57 == ((8'hbc) ~^ reg55)))} - reg61[(1'h1):(1'h0)]);
              reg65 <= (|(-{({reg61, reg56} ~^ reg54)}));
              reg66 <= $signed(((~&wire37[(4'hd):(3'h4)]) <= reg52[(1'h1):(1'h0)]));
            end
          reg67 <= ($unsigned(reg52[(5'h14):(4'he)]) ?
              ((($signed(wire48) ?
                      (wire36 ? wire37 : wire36) : (wire48 ? (8'hbe) : reg41)) ?
                  (~^(reg65 + (8'h9e))) : reg63) + ($unsigned((reg56 ?
                  reg58 : reg42)) <<< $unsigned((reg61 >> reg65)))) : (reg58[(4'ha):(2'h3)] ?
                  $unsigned($signed(wire34[(5'h10):(4'hf)])) : reg55));
        end
      reg68 <= (wire37 >> wire46[(1'h0):(1'h0)]);
    end
  assign wire69 = (wire45[(4'hb):(4'h8)] ?
                      $signed($signed($signed($signed(reg43)))) : ((8'ha3) > wire47));
  assign wire70 = (((($signed(reg39) >> {reg40, reg68}) ?
                          (reg53[(1'h1):(1'h1)] ?
                              {reg55} : $unsigned(reg66)) : ((reg53 ?
                              reg65 : wire33) ~^ $signed((8'hac)))) ?
                      (~&$unsigned(reg66)) : reg53) * wire35);
  assign wire71 = (8'h9d);
  assign wire72 = {(~^wire36[(4'h8):(1'h1)]),
                      (((wire70[(3'h5):(2'h3)] ?
                              (~wire71) : wire37) && (^~reg51)) ?
                          (8'hba) : ((wire35[(3'h5):(3'h5)] ~^ reg63) >= $unsigned(wire37[(3'h6):(2'h2)])))};
endmodule
