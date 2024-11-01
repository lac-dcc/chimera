module top
#(parameter param91 = (({(^((8'hb9) ? (8'hb9) : (8'had)))} ? (({(8'hb5), (8'hae)} ^~ (~|(8'hb2))) <<< ({(8'ha8)} ? {(7'h43), (8'haf)} : {(8'ha5)})) : ((&((8'hbe) != (8'ha1))) ? {(~&(8'h9e)), (8'hbb)} : (((7'h44) ? (8'h9d) : (8'hab)) ? ((8'had) ? (7'h41) : (8'hbe)) : (+(8'hb8))))) == {({(8'hb4)} ? (((8'hba) | (7'h41)) ^ (^~(8'hab))) : (^~((8'hb1) ^~ (8'h9f)))), ((((8'ha1) ? (8'ha8) : (8'hb8)) ^~ (^(8'haa))) <<< (((8'hb6) & (8'hb9)) << ((8'hb0) ? (8'ha7) : (8'hb5))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire83;
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  assign y = {wire90,
                 wire86,
                 wire85,
                 wire32,
                 wire5,
                 wire4,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire83,
                 reg89,
                 reg88,
                 reg87,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire4 = (8'ha9);
  assign wire5 = wire0[(2'h3):(2'h3)];
  module6 #() modinst33 (.clk(clk), .wire7(wire0), .wire11(wire3), .wire8(wire1), .wire10(wire5), .y(wire32), .wire9(wire4));
  always
    @(posedge clk) begin
      reg34 <= (8'ha3);
      reg35 <= $unsigned(reg34);
      reg36 <= reg35;
    end
  always
    @(posedge clk) begin
      reg37 <= $unsigned((wire3[(4'hf):(4'hf)] && $unsigned(wire4[(4'hf):(4'hb)])));
    end
  assign wire38 = $signed(((~$signed(wire3[(1'h1):(1'h0)])) | (|((!wire2) ?
                      wire0[(4'hf):(4'hd)] : reg34))));
  assign wire39 = wire1[(3'h6):(1'h0)];
  assign wire40 = reg35;
  assign wire41 = $unsigned(wire2);
  module42 #() modinst84 (wire83, clk, reg34, wire4, wire3, wire39, reg35);
  assign wire85 = (~&$signed(wire3[(4'hc):(4'h9)]));
  assign wire86 = wire32[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg87 <= reg36[(3'h7):(3'h4)];
      reg88 <= wire38;
      reg89 <= (8'hae);
    end
  assign wire90 = reg34;
endmodule

module module42
#(parameter param81 = {((((&(7'h40)) <= ((8'ha4) ? (8'ha8) : (8'hac))) ? ({(8'ha8)} ? ((8'hb3) ? (7'h42) : (7'h41)) : {(8'hba), (8'hae)}) : (~|((7'h42) ? (8'hba) : (8'hb6)))) << (-(((8'ha8) | (8'hbb)) ? (~|(8'hb7)) : ((8'hbd) ? (8'hbd) : (8'h9f))))), {(8'haa), ({(^~(8'hbb)), ((8'hb2) >> (8'ha3))} ? (~^(~^(8'haf))) : ((8'h9c) ? {(8'had)} : ((8'hb8) ? (8'hb8) : (8'h9f))))}}, 
parameter param82 = {(param81 ^ param81)})
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire47;
  input wire [(4'he):(1'h0)] wire46;
  input wire signed [(4'hc):(1'h0)] wire45;
  input wire [(4'hd):(1'h0)] wire44;
  input wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire48;
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire49,
                 wire48,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
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
                 (1'h0)};
  assign wire48 = (wire46 ?
                      (($unsigned(wire46) ? wire44[(3'h4):(1'h0)] : wire46) ?
                          wire43 : $unsigned($unsigned($signed(wire47)))) : $signed(((8'ha5) ?
                          $signed((wire44 ?
                              wire45 : (8'ha9))) : ($unsigned(wire44) ?
                              (8'hbe) : {wire45, wire47}))));
  assign wire49 = $signed($signed((^wire43[(3'h6):(3'h5)])));
  always
    @(posedge clk) begin
      reg50 <= $unsigned(wire44);
      if (wire44)
        begin
          reg51 <= $unsigned((&reg50[(1'h1):(1'h1)]));
          reg52 <= (8'haa);
          if (wire44)
            begin
              reg53 <= wire46[(3'h4):(1'h1)];
              reg54 <= $unsigned({$signed({$unsigned(reg52)}),
                  $signed($signed((wire45 >= wire45)))});
              reg55 <= ((~&wire49) ?
                  $signed(reg52[(1'h0):(1'h0)]) : wire49[(3'h5):(3'h5)]);
              reg56 <= $signed(reg53[(3'h5):(1'h0)]);
            end
          else
            begin
              reg53 <= (wire49 == (($unsigned(reg50) ?
                  wire48[(3'h7):(3'h5)] : $signed(wire46[(3'h5):(1'h0)])) <= (~^(&reg53))));
              reg54 <= (~&reg55);
              reg55 <= $signed(((((~&wire45) >> reg50[(2'h2):(1'h0)]) ?
                      reg51 : wire47) ?
                  wire45 : wire44[(2'h3):(1'h1)]));
            end
          reg57 <= $unsigned(wire46[(2'h3):(2'h3)]);
          if ((!$signed(($unsigned((~^(8'hbc))) <= (reg54 ?
              wire47[(2'h3):(1'h0)] : (wire47 * wire45))))))
            begin
              reg58 <= (!$signed($unsigned((~&(~&wire49)))));
              reg59 <= (({wire49[(4'h9):(1'h1)], {$unsigned((8'ha3))}} ?
                  (wire49 ?
                      $unsigned($signed(wire43)) : (^wire45)) : wire46) < ($signed(wire47) ~^ wire43[(1'h0):(1'h0)]));
              reg60 <= {{($unsigned(wire45) ?
                          (8'h9c) : (^~reg50[(4'hb):(3'h6)])),
                      $signed((~&reg53[(3'h7):(2'h2)]))}};
              reg61 <= wire47;
              reg62 <= (~^{((^~reg60[(1'h0):(1'h0)]) ?
                      (&(~reg56)) : (reg52 ? (8'h9c) : reg51))});
            end
          else
            begin
              reg58 <= {$unsigned((((reg62 < reg57) ?
                          $signed(wire45) : (reg60 ? wire45 : (8'ha7))) ?
                      reg62[(3'h7):(2'h3)] : reg53[(4'he):(3'h6)])),
                  ($unsigned(reg50) & {wire45[(4'h9):(2'h3)]})};
              reg59 <= wire44[(4'hb):(4'hb)];
              reg60 <= $unsigned({(wire43 > $unsigned((reg53 ?
                      reg59 : reg58)))});
            end
        end
      else
        begin
          if ($unsigned((wire47[(2'h3):(2'h3)] || wire45)))
            begin
              reg51 <= wire46[(1'h0):(1'h0)];
              reg52 <= reg59[(3'h4):(3'h4)];
              reg53 <= {wire49[(1'h0):(1'h0)], reg61};
            end
          else
            begin
              reg51 <= $unsigned(wire45);
              reg52 <= ($unsigned((wire46 >= reg58[(3'h7):(3'h6)])) ?
                  (({(wire43 >>> reg50)} >= ((reg58 ? reg62 : reg50) ?
                      {(8'hba),
                          wire43} : reg54[(2'h3):(1'h1)])) + wire45[(4'hc):(2'h2)]) : reg60[(2'h2):(2'h2)]);
            end
        end
      reg63 <= $unsigned(wire43[(2'h3):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg64 <= wire43;
      reg65 <= $unsigned($signed($unsigned(($signed(wire45) && reg62))));
      reg66 <= (reg64 ^ ($signed((&(wire49 ?
          wire43 : reg56))) ~^ $signed($unsigned($unsigned(reg50)))));
      reg67 <= $signed((~|(~^$unsigned((reg64 < (8'ha8))))));
      reg68 <= $unsigned((~^($signed(reg50) ?
          $unsigned((8'ha4)) : reg50[(1'h1):(1'h0)])));
    end
  assign wire69 = reg55[(4'h9):(2'h3)];
  assign wire70 = $unsigned(({reg60, ((~^reg55) || wire47[(1'h0):(1'h0)])} ?
                      (8'ha9) : (&(8'haf))));
  assign wire71 = wire43;
  assign wire72 = reg51;
  assign wire73 = ($unsigned($unsigned($unsigned($signed(wire45)))) ?
                      (|(wire70 ^~ $unsigned((reg65 ?
                          reg50 : (8'hac))))) : (^(|(reg58 - (wire49 != reg51)))));
  assign wire74 = (+(8'ha0));
  assign wire75 = (+((((wire47 ? (8'hb4) : wire70) ? wire46 : $signed(wire43)) ?
                          ((~&reg64) || reg61[(3'h7):(1'h0)]) : reg53[(4'hc):(3'h5)]) ?
                      $unsigned(reg54[(2'h3):(1'h0)]) : {reg65[(4'hc):(4'h9)]}));
  always
    @(posedge clk) begin
      reg76 <= reg52;
      reg77 <= reg55[(4'hb):(1'h1)];
      reg78 <= {($signed({reg56[(3'h7):(2'h3)],
              wire72[(2'h3):(2'h3)]}) || ((reg51[(1'h1):(1'h0)] <<< reg64[(5'h12):(1'h0)]) ?
              ((!reg54) ?
                  wire75 : (reg58 ? reg53 : wire70)) : (~|$signed((8'hb2)))))};
      reg79 <= reg63;
      if ((wire49[(3'h4):(1'h0)] ?
          $signed({$unsigned($unsigned(reg65)),
              ((wire74 ? reg61 : reg53) < (wire71 + wire73))}) : reg68))
        begin
          reg80 <= (($unsigned($unsigned($signed(wire72))) <= $signed($unsigned((wire48 | reg64)))) ?
              (wire44[(2'h3):(1'h0)] ?
                  ($unsigned((wire75 ? reg59 : reg53)) ?
                      $unsigned($unsigned(reg58)) : $unsigned((!reg78))) : (((reg64 ?
                          reg65 : reg79) ?
                      $unsigned(reg60) : $signed(wire73)) <<< reg61[(4'ha):(2'h2)])) : (-(reg51[(4'hc):(4'h9)] ?
                  $unsigned({(8'hab)}) : reg51[(1'h0):(1'h0)])));
        end
      else
        begin
          reg80 <= reg64;
        end
    end
endmodule

module module6
#(parameter param30 = {(~&(8'haa))}, 
parameter param31 = param30)
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire12;
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire17,
                 wire12,
                 reg26,
                 reg25,
                 reg20,
                 reg19,
                 reg18,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire12 = $unsigned(wire7[(4'he):(4'h9)]);
  always
    @(posedge clk) begin
      reg13 <= wire10[(2'h2):(1'h1)];
      reg14 <= ($signed((~($unsigned((8'hae)) ~^ $signed(wire11)))) < reg13);
      reg15 <= wire10;
      reg16 <= (($unsigned((reg14[(4'h8):(1'h1)] ?
          reg14[(1'h0):(1'h0)] : (~|wire10))) + wire10[(2'h3):(2'h3)]) ~^ wire9);
    end
  assign wire17 = wire11;
  always
    @(posedge clk) begin
      reg18 <= $unsigned(((~^wire9[(1'h0):(1'h0)]) ?
          $unsigned((wire10[(1'h1):(1'h1)] & reg13)) : (reg16[(1'h0):(1'h0)] > reg15)));
      reg19 <= $signed(reg13[(2'h2):(1'h0)]);
      reg20 <= $unsigned($unsigned($unsigned(reg13[(2'h2):(2'h2)])));
    end
  assign wire21 = reg18[(1'h0):(1'h0)];
  assign wire22 = wire7[(3'h7):(3'h4)];
  assign wire23 = reg20;
  assign wire24 = $unsigned((^(|(~(^~wire22)))));
  always
    @(posedge clk) begin
      reg25 <= $signed((($signed((wire7 >= wire8)) * (^wire9)) ?
          {$signed((wire10 ? reg13 : (8'ha9))), (8'ha8)} : wire8));
      reg26 <= reg15[(1'h1):(1'h0)];
    end
  assign wire27 = (&($unsigned($signed($unsigned(wire11))) ?
                      wire21[(3'h4):(2'h3)] : reg16));
  assign wire28 = $unsigned(($signed({{wire17}, $signed(reg13)}) ?
                      wire12 : {reg18[(3'h4):(1'h0)], $unsigned((&wire7))}));
  assign wire29 = (&((((-reg15) << $signed(wire17)) ?
                      ((wire17 <= wire21) ^~ reg19) : (wire7[(3'h6):(1'h1)] ?
                          (reg14 - (8'hac)) : wire24)) != $signed($unsigned((wire12 ?
                      (8'ha4) : wire11)))));
endmodule
