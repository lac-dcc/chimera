module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire86;
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire86,
                 (1'h0)};
  assign wire5 = (($signed(((~|wire1) <<< wire1[(4'hf):(4'h8)])) ?
                         wire0[(1'h1):(1'h1)] : wire0[(3'h5):(3'h5)]) ?
                     ((((wire3 ? wire2 : wire3) ?
                             $signed(wire3) : ((8'h9d) ? wire0 : wire3)) ?
                         ((wire0 ? (8'hb6) : wire3) >> {(7'h44),
                             wire1}) : ((~wire3) ?
                             wire3[(1'h1):(1'h0)] : (~wire1))) >> $signed(wire2[(4'hd):(4'h8)])) : wire4);
  assign wire6 = (wire0[(2'h3):(2'h2)] <= {$unsigned($signed(((8'hb5) ?
                         wire3 : wire4))),
                     ((wire4[(2'h3):(1'h0)] ?
                         $unsigned(wire5) : $signed((8'hb1))) ^~ wire4[(2'h3):(2'h3)])});
  assign wire7 = wire5;
  assign wire8 = wire1[(5'h12):(3'h7)];
  assign wire9 = $signed((8'hbe));
  assign wire10 = (((~wire7[(4'hb):(4'hb)]) <= wire0[(1'h1):(1'h1)]) ?
                      $signed(($signed(wire2) ?
                          ((!wire1) ?
                              $unsigned(wire6) : $unsigned(wire7)) : {(wire1 != wire9),
                              (wire9 & wire9)})) : ((({wire0} ?
                              $signed(wire0) : wire7) - $signed($signed(wire6))) ?
                          $unsigned((wire9[(1'h0):(1'h0)] || wire7[(5'h12):(5'h11)])) : ($signed({wire5,
                              wire5}) & $signed({(8'ha9)}))));
  assign wire11 = (8'had);
  assign wire12 = $unsigned($unsigned($signed((wire6[(3'h7):(2'h2)] ?
                      wire7[(2'h3):(1'h0)] : $signed(wire3)))));
  module13 #() modinst87 (.wire16(wire6), .wire18(wire11), .wire14(wire9), .wire17(wire8), .y(wire86), .clk(clk), .wire15(wire4));
endmodule

module module13
#(parameter param84 = (^({(((8'ha9) ? (8'haf) : (8'hb5)) ? ((8'h9f) ? (8'hb6) : (8'hac)) : ((8'hbe) ? (8'ha8) : (7'h44))), (^{(8'h9e)})} && (&(8'haf)))), 
parameter param85 = (param84 ? (param84 ? ((~^param84) ? param84 : ({param84, param84} ? (+param84) : param84)) : (8'hb6)) : param84))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire18;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire signed [(3'h5):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  input wire signed [(4'hd):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire19;
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  assign y = {wire83,
                 wire81,
                 wire23,
                 wire19,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire19 = (^~((+($unsigned((8'hb9)) ?
                      $signed(wire17) : $signed(wire16))) || {wire14[(1'h0):(1'h0)]}));
  always
    @(posedge clk) begin
      reg20 <= $signed($signed(((|(-wire15)) > wire16[(3'h4):(3'h4)])));
      reg21 <= (~&$signed(wire18[(1'h0):(1'h0)]));
      reg22 <= (wire19 ^ wire19[(2'h2):(2'h2)]);
    end
  assign wire23 = {(((~^reg21) + (~&(wire19 ?
                          reg21 : wire15))) ~^ $unsigned((reg20[(3'h5):(3'h5)] ?
                          $unsigned(wire16) : reg21))),
                      wire18};
  always
    @(posedge clk) begin
      reg24 <= ((wire17[(2'h3):(2'h2)] | $unsigned(reg20[(2'h2):(2'h2)])) ?
          {($unsigned(wire15) >= (wire17 == wire17))} : wire23[(5'h10):(1'h0)]);
    end
  always
    @(posedge clk) begin
      if (wire17)
        begin
          reg25 <= wire16[(3'h4):(2'h2)];
        end
      else
        begin
          if ((~$signed(wire19[(1'h0):(1'h0)])))
            begin
              reg25 <= ($signed($signed($signed(wire15))) ?
                  (&$signed(((wire23 ?
                      wire19 : wire19) && (8'ha0)))) : wire14[(3'h4):(2'h3)]);
            end
          else
            begin
              reg25 <= ((wire14[(4'hd):(1'h0)] != ({(^(8'h9e))} - $signed((!wire18)))) ?
                  (reg21 ?
                      $signed({$signed(wire17),
                          reg24[(3'h6):(3'h5)]}) : {reg25[(5'h10):(2'h2)]}) : wire18[(2'h2):(1'h1)]);
              reg26 <= wire15[(3'h6):(2'h3)];
              reg27 <= $unsigned($signed($signed($signed(wire14))));
              reg28 <= $signed(reg26[(4'hc):(3'h6)]);
              reg29 <= (((reg21 != wire15[(1'h0):(1'h0)]) ?
                  ((-{reg26}) && ((reg21 ? wire18 : reg20) ?
                      reg24[(5'h12):(3'h4)] : wire17)) : (8'ha8)) || (8'hae));
            end
          reg30 <= $unsigned($unsigned((8'hb1)));
          reg31 <= {$unsigned(wire16[(2'h3):(1'h1)])};
          reg32 <= $signed(wire23);
        end
    end
  module33 #() modinst82 (.wire37(reg27), .wire36(reg24), .clk(clk), .wire34(reg32), .y(wire81), .wire35(reg22));
  assign wire83 = (+$signed($unsigned((reg31[(2'h3):(1'h1)] ?
                      ((8'ha0) ? reg29 : reg27) : (~(8'haf))))));
endmodule

module module33
#(parameter param79 = ((((~&(8'hb8)) & (((8'ha4) ? (8'hac) : (8'ha2)) ? ((8'h9c) - (8'hac)) : ((8'hb1) >= (8'hbe)))) ? ((~&((8'hb1) + (8'hb2))) ? ((^(8'hae)) ? ((7'h41) ? (8'ha1) : (8'h9e)) : ((8'hba) ? (8'hbb) : (8'ha8))) : {((7'h42) ? (8'hac) : (7'h43)), {(8'ha7), (8'ha7)}}) : ({(!(8'ha3))} - (((7'h44) << (8'ha8)) ? (|(8'hb0)) : ((8'ha9) ? (8'hbd) : (8'ha9))))) - ((-(+((8'ha9) >> (7'h44)))) >>> (^(~|(!(8'hb7)))))), 
parameter param80 = param79)
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h1f8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire37;
  input wire [(5'h15):(1'h0)] wire36;
  input wire signed [(5'h14):(1'h0)] wire35;
  input wire [(5'h13):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire44;
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg38 <= $unsigned((|$signed(wire36)));
      reg39 <= $unsigned(wire35);
      reg40 <= (wire36 ?
          (^$signed($signed(wire37[(4'ha):(2'h3)]))) : {wire34[(5'h12):(4'he)],
              ($signed($signed(reg38)) ?
                  (~&$unsigned(wire35)) : ($signed(wire34) ^ (~|reg39)))});
      if (reg40)
        begin
          reg41 <= ((~&({(wire35 ? wire37 : wire34)} ?
              ((wire34 ^~ reg38) & ((8'hb6) ?
                  (8'ha8) : reg40)) : $unsigned((wire36 <= wire37)))) & wire37);
        end
      else
        begin
          reg41 <= ($unsigned($signed((^~(reg40 >> reg40)))) ?
              $signed($signed(((reg41 ^~ wire35) << $unsigned(wire34)))) : wire34[(4'he):(3'h4)]);
          reg42 <= ($signed(reg41) - $signed($unsigned(wire35)));
          reg43 <= ((($unsigned(reg39[(1'h1):(1'h1)]) ?
                  (~^{reg40}) : $signed($unsigned(reg40))) << ((~^$signed(wire34)) ~^ wire35)) ?
              wire36 : ((reg40 || $signed($signed(reg42))) ?
                  wire35[(3'h5):(1'h1)] : reg42));
        end
    end
  assign wire44 = ({(((reg38 ? wire37 : reg38) ?
                              (+wire37) : wire35) * ((reg41 > reg40) ?
                              $signed(wire36) : $unsigned((8'hb8)))),
                          ($signed(reg40) ?
                              ((^~reg39) >= (reg41 ^~ reg42)) : wire36[(3'h6):(3'h5)])} ?
                      $unsigned($unsigned((^(reg39 >= reg40)))) : reg38[(1'h0):(1'h0)]);
  assign wire45 = ((+reg39[(1'h1):(1'h1)]) != wire44);
  assign wire46 = (wire34 <<< (~&reg40));
  assign wire47 = (wire44[(1'h0):(1'h0)] ?
                      (~&((8'hb4) ?
                          {(wire36 ?
                                  (8'h9c) : reg42)} : (-reg39))) : {$signed((^(reg41 ?
                              wire46 : reg38))),
                          (^~wire34)});
  assign wire48 = wire44;
  assign wire49 = {$signed(wire36), (-(~^$signed($unsigned(wire48))))};
  assign wire50 = (reg43 ^~ $signed($unsigned(wire46[(3'h6):(3'h6)])));
  assign wire51 = wire35;
  always
    @(posedge clk) begin
      reg52 <= wire34[(5'h10):(1'h0)];
      if (wire35)
        begin
          if (((&(&reg42)) ? reg52 : wire50))
            begin
              reg53 <= wire48;
            end
          else
            begin
              reg53 <= wire45[(4'h8):(1'h0)];
              reg54 <= (($signed(((reg52 ^ reg39) ?
                          (reg53 ? reg41 : wire37) : $signed(wire49))) ?
                      wire46 : reg40[(2'h2):(1'h1)]) ?
                  (~|{wire36[(4'hc):(1'h0)],
                      (^~wire46)}) : (reg41[(1'h0):(1'h0)] ?
                      $unsigned(reg42) : wire37));
            end
          if ((+wire51[(3'h6):(2'h3)]))
            begin
              reg55 <= $signed((|$unsigned(((+reg53) >> $signed(reg43)))));
              reg56 <= $signed({(wire45[(2'h3):(2'h3)] ?
                      (^~reg38) : $unsigned((8'had))),
                  $signed((wire46[(4'ha):(1'h1)] == $unsigned((7'h42))))});
              reg57 <= (-(~^$signed($unsigned($unsigned(wire34)))));
              reg58 <= $signed((~&wire44));
              reg59 <= (-$unsigned({$signed((~&reg39)),
                  $signed(((7'h41) ? reg58 : reg42))}));
            end
          else
            begin
              reg55 <= wire34;
              reg56 <= (8'ha7);
              reg57 <= $signed(((8'hb8) << ($signed(reg42[(4'he):(4'hc)]) ?
                  (&reg58) : (wire49[(3'h7):(3'h5)] ?
                      reg39[(1'h1):(1'h0)] : $unsigned(reg41)))));
              reg58 <= $unsigned((~$signed($unsigned((~(8'hb4))))));
            end
          reg60 <= ((^~(~(reg43[(1'h1):(1'h0)] ?
                  $unsigned(wire46) : {wire48, wire34}))) ?
              ($unsigned($signed(reg55[(3'h6):(3'h6)])) * {$signed((wire34 ^~ reg41)),
                  ({wire44} ?
                      (wire37 ~^ wire35) : (reg55 ?
                          wire36 : reg54))}) : (8'h9e));
          if ((~|wire35[(3'h6):(3'h4)]))
            begin
              reg61 <= wire50[(4'hb):(2'h3)];
              reg62 <= (~(((+{reg52, reg55}) ?
                      ($unsigned(wire49) - reg56) : (-(wire44 ?
                          wire50 : reg42))) ?
                  (reg56[(3'h4):(1'h1)] ?
                      ((~wire37) + (^~reg58)) : ((+reg43) >> reg56)) : $unsigned(({reg42} ?
                      reg57 : (wire45 ? reg42 : reg60)))));
              reg63 <= ({(((reg59 ? (8'h9f) : wire37) ?
                      (wire50 < wire48) : $signed(wire50)) && reg62),
                  {$signed(((8'hb8) * reg54)),
                      wire51[(3'h6):(1'h1)]}} == $unsigned(wire45));
              reg64 <= $signed($unsigned($signed(wire34[(4'hc):(3'h4)])));
            end
          else
            begin
              reg61 <= (~|$unsigned((~^({wire36} | ((8'haa) - wire48)))));
              reg62 <= (^~reg39[(2'h2):(1'h0)]);
              reg63 <= (8'h9e);
              reg64 <= ((!(~^reg56)) >> $unsigned((reg53 ?
                  ({wire45, reg38} && (reg41 ? wire34 : wire49)) : reg63)));
            end
          if ($unsigned((($unsigned((reg57 ?
                  wire47 : wire47)) - $unsigned({reg64, wire45})) ?
              $signed(($unsigned((8'hbc)) ?
                  (wire44 + wire47) : (reg57 ? wire45 : reg55))) : (!reg59))))
            begin
              reg65 <= (reg60[(1'h0):(1'h0)] ?
                  reg59[(1'h0):(1'h0)] : (&($unsigned((reg52 ?
                      (8'h9c) : reg39)) >= {(wire45 ? reg58 : wire35)})));
              reg66 <= (8'hae);
            end
          else
            begin
              reg65 <= (^~$signed(($unsigned($signed(reg59)) + (reg41 ?
                  (reg38 | reg65) : (reg62 ~^ reg57)))));
              reg66 <= wire34[(1'h1):(1'h1)];
              reg67 <= reg53;
              reg68 <= (~&wire35[(3'h6):(2'h2)]);
            end
        end
      else
        begin
          reg53 <= $unsigned(($signed((reg42 ? (reg42 | reg59) : (~&reg54))) ?
              ($signed((wire36 > reg40)) && $signed((reg40 | reg66))) : (({(8'h9d)} >>> reg67) <= ((~|(8'hb0)) | reg40))));
          reg54 <= $signed(reg40);
          if (({{reg43, ((^~(8'hb1)) != (reg66 || wire47))},
              {$signed((reg38 ? reg40 : (8'hae)))}} - reg39))
            begin
              reg55 <= ((wire51[(4'hf):(1'h0)] >= {wire36[(2'h3):(1'h1)]}) ^ wire35);
            end
          else
            begin
              reg55 <= $signed($signed(({((8'hb0) ?
                      reg68 : wire49)} >>> (-reg67))));
              reg56 <= (reg54[(3'h4):(1'h1)] ?
                  ((~reg41) << (&((8'h9d) - reg40[(3'h4):(3'h4)]))) : wire45);
              reg57 <= (-$signed((((+reg40) ?
                  ((8'hae) >>> wire44) : (|wire51)) <= (!(reg54 ^~ wire51)))));
              reg58 <= ((8'ha1) > reg40);
            end
        end
      reg69 <= wire34;
      if ({((wire48 != (-wire51[(4'hf):(1'h0)])) ?
              (&$signed($unsigned(reg60))) : (|({reg65} ~^ {reg62, reg68})))})
        begin
          if ({wire47, {$signed(reg68[(2'h3):(2'h2)]), reg41[(1'h0):(1'h0)]}})
            begin
              reg70 <= (reg43[(1'h0):(1'h0)] & reg41);
            end
          else
            begin
              reg70 <= ($unsigned($signed($unsigned((!(8'hbf))))) <= (&$unsigned($unsigned((wire51 == reg69)))));
              reg71 <= {$unsigned(wire47[(1'h1):(1'h0)]),
                  {(wire49[(3'h6):(1'h1)] ?
                          reg41 : (reg64 && reg43[(1'h1):(1'h1)])),
                      wire44[(2'h2):(1'h0)]}};
            end
        end
      else
        begin
          reg70 <= $unsigned(reg52);
          reg71 <= (~|reg63);
        end
      reg72 <= ((reg65[(4'h8):(3'h6)] ^ (8'hba)) ?
          {wire35[(4'hd):(2'h2)]} : ({wire50[(4'he):(3'h4)]} ?
              ((wire44 ^ (wire49 << reg43)) >>> wire45[(4'hb):(3'h6)]) : wire44[(1'h0):(1'h0)]));
    end
  assign wire73 = (8'haa);
  assign wire74 = $unsigned({(~^(wire44[(2'h2):(2'h2)] > wire50))});
  assign wire75 = ({(+wire74), $signed({(reg60 ? wire45 : wire73)})} > wire35);
  assign wire76 = $unsigned(wire50);
  assign wire77 = {$unsigned(wire36),
                      $signed((($signed((8'hb7)) ?
                          $signed(wire44) : $signed(reg72)) | ($unsigned(wire34) ~^ reg59)))};
  assign wire78 = $signed($unsigned(reg62));
endmodule
