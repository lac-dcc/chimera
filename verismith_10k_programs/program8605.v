module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire85;
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  assign y = {wire5,
                 wire85,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire5 = ((wire2 ?
                     wire4 : wire0) != ((~|$unsigned((wire3 <<< wire4))) << (wire0[(4'ha):(3'h4)] ?
                     ($unsigned(wire3) ^ (wire4 ? (8'h9e) : wire0)) : ((wire1 ?
                         wire1 : wire2) >>> wire1[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg6 <= $signed($unsigned(wire3[(2'h3):(2'h2)]));
      reg7 <= $unsigned($unsigned((-{wire2[(4'hd):(4'hd)]})));
      reg8 <= {wire1,
          (reg6[(5'h10):(4'h8)] ?
              (((wire3 ? wire2 : wire3) ? (wire3 & wire5) : wire4) ?
                  (!((8'haa) <<< (8'h9d))) : $unsigned($unsigned(wire2))) : (~|((!reg6) >= $signed(wire4))))};
      reg9 <= (~^$unsigned(wire3));
    end
  always
    @(posedge clk) begin
      reg10 <= $unsigned(($unsigned((reg6[(4'h8):(2'h3)] & reg9[(2'h3):(2'h2)])) ?
          ({((8'had) + (8'hb8)), $unsigned(reg9)} << {(-wire2),
              $signed(reg8)}) : wire5));
      reg11 <= ((8'hb9) ?
          (((|((8'ha1) ? (7'h40) : wire3)) < (reg7 ?
              (wire1 == reg9) : (wire5 ?
                  (8'hba) : wire5))) ^ reg9[(1'h1):(1'h1)]) : (!wire0[(4'he):(2'h2)]));
      reg12 <= wire3[(4'h8):(1'h1)];
      reg13 <= reg11;
    end
  module14 #() modinst86 (.wire15(reg12), .clk(clk), .wire18(reg11), .y(wire85), .wire16(wire3), .wire17(reg13));
endmodule

module module14  (y, clk, wire15, wire16, wire17, wire18);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire15;
  input wire [(3'h5):(1'h0)] wire16;
  input wire signed [(3'h6):(1'h0)] wire17;
  input wire signed [(2'h2):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire82;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire72;
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire19,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire72,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
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
                 reg20,
                 (1'h0)};
  assign wire19 = {(+wire18), wire18};
  always
    @(posedge clk) begin
      reg20 <= $signed((wire19 || (($unsigned((8'hb6)) >>> $unsigned(wire15)) | wire18)));
      reg21 <= (+wire18);
      if ({($unsigned(wire15) ?
              (wire16[(3'h4):(2'h3)] ?
                  {$signed(wire15),
                      (!wire18)} : wire19[(4'ha):(4'ha)]) : $unsigned((wire18 >> wire19[(1'h1):(1'h1)])))})
        begin
          if (({$unsigned($signed($signed(wire17)))} ?
              {((-$unsigned(wire19)) ? $unsigned(((8'hac) ^~ wire16)) : wire19),
                  {({wire17, wire18} ? reg21 : (wire15 != reg20))}} : reg20))
            begin
              reg22 <= reg21[(2'h3):(2'h2)];
              reg23 <= reg21;
              reg24 <= {($signed($unsigned((~|reg22))) <= wire16)};
              reg25 <= $signed($signed($signed(wire15)));
              reg26 <= (((reg22 * wire15) <= {$signed((+reg21)),
                      $unsigned((reg21 ^ wire16))}) ?
                  wire17 : {wire19});
            end
          else
            begin
              reg22 <= ($unsigned($signed($signed(reg21[(1'h1):(1'h1)]))) > (|reg23[(3'h6):(1'h0)]));
              reg23 <= {reg22,
                  $unsigned((reg20[(5'h11):(4'h8)] ?
                      ($unsigned(reg21) ?
                          reg20[(4'h9):(3'h4)] : {reg22,
                              reg26}) : $signed(((8'h9c) - wire17))))};
              reg24 <= ((($signed(reg24[(4'hf):(4'hb)]) & $unsigned((wire19 - (8'hb5)))) >> $signed((wire15[(3'h4):(1'h0)] * $unsigned(wire18)))) >>> (8'h9f));
              reg25 <= ($unsigned($unsigned((~|(^(7'h43))))) == ((7'h41) ?
                  {$signed((^reg26)), reg23[(2'h3):(2'h2)]} : reg21));
            end
          reg27 <= wire16[(3'h4):(2'h2)];
          if (wire19[(1'h1):(1'h1)])
            begin
              reg28 <= (^~$signed((wire17 ~^ wire18[(1'h0):(1'h0)])));
              reg29 <= reg20;
              reg30 <= reg21;
            end
          else
            begin
              reg28 <= reg21[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg22 <= (wire17 ?
              {(reg29[(1'h1):(1'h0)] >> {wire17[(3'h4):(2'h3)]})} : reg26[(4'hb):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg31 <= $unsigned((|$signed(wire19[(4'hd):(2'h3)])));
    end
  assign wire32 = $signed($signed(wire17[(2'h2):(1'h0)]));
  assign wire33 = reg30[(4'h9):(1'h1)];
  assign wire34 = ({$signed((^(~reg24)))} <<< $signed($unsigned(((reg29 ?
                          wire18 : wire16) ?
                      $unsigned(wire16) : reg22[(4'h8):(2'h3)]))));
  assign wire35 = reg30[(3'h7):(1'h0)];
  assign wire36 = reg29;
  assign wire37 = reg22;
  module38 #() modinst73 (wire72, clk, wire34, reg22, wire17, reg26, wire37);
  always
    @(posedge clk) begin
      if ({$signed((reg26 ? $signed(wire72) : $signed(((8'hb7) - reg26))))})
        begin
          if ($unsigned((reg31[(5'h11):(4'hb)] <= $signed((wire34 || $unsigned(reg23))))))
            begin
              reg74 <= $signed(((wire16[(1'h0):(1'h0)] <= (^reg26)) && ((~&(~&wire17)) != reg20[(3'h5):(3'h5)])));
              reg75 <= reg30[(3'h5):(3'h4)];
              reg76 <= $unsigned(wire18);
              reg77 <= ((($unsigned(wire15) ?
                      $signed(reg23[(3'h5):(2'h2)]) : ((reg31 ?
                              reg26 : (8'ha5)) ?
                          (reg29 ? wire19 : reg75) : reg25[(3'h7):(1'h0)])) ?
                  $unsigned((~&{reg25,
                      wire16})) : reg74[(2'h2):(1'h0)]) >> ((-wire19[(4'hf):(1'h0)]) ?
                  {(|$unsigned((7'h43)))} : wire16));
              reg78 <= wire19[(4'hb):(2'h2)];
            end
          else
            begin
              reg74 <= reg29[(4'h8):(3'h7)];
              reg75 <= wire19;
              reg76 <= $unsigned($signed(reg21));
              reg77 <= (((~|reg78) < reg74) ?
                  (~|$unsigned((reg78[(3'h5):(1'h1)] ?
                      wire15[(4'h8):(3'h6)] : $unsigned(reg77)))) : $signed($unsigned(wire36)));
            end
        end
      else
        begin
          reg74 <= (reg31 | $signed(((!(8'hba)) || {{wire33, reg30}})));
          reg75 <= {(!$unsigned((~{reg30, reg21})))};
          reg76 <= ((reg74[(3'h6):(1'h0)] * $signed(wire34[(1'h1):(1'h1)])) ?
              ((((reg75 ?
                  reg26 : reg27) >= (reg74 < wire19)) >= $unsigned((reg76 ?
                  reg29 : reg20))) ^ (($unsigned(reg23) & {wire37, wire17}) ?
                  $unsigned(((8'ha8) <= (8'hb2))) : ({reg77} ?
                      wire19 : {reg75}))) : reg76[(1'h1):(1'h0)]);
        end
      reg79 <= $signed($signed((8'hac)));
      reg80 <= $unsigned((&($signed($signed(reg78)) == (~|{reg78, reg21}))));
      reg81 <= ((reg25 & wire72) ?
          ((!(&reg77)) > reg31) : reg31[(5'h11):(5'h10)]);
    end
  assign wire82 = (((!$unsigned($signed(reg29))) ^ reg28) ?
                      (reg30 ?
                          (wire72[(2'h2):(2'h2)] ^~ wire33[(2'h3):(2'h3)]) : {(reg28 ?
                                  (~|reg75) : (reg78 && reg22))}) : wire17);
  assign wire83 = ((8'hb9) ?
                      (!$unsigned($unsigned($unsigned((8'ha7))))) : $signed(reg80));
  assign wire84 = $unsigned(wire19[(3'h5):(1'h0)]);
endmodule

module module38  (y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire43;
  input wire [(5'h14):(1'h0)] wire42;
  input wire [(3'h6):(1'h0)] wire41;
  input wire [(4'h9):(1'h0)] wire40;
  input wire [(5'h10):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire56;
  wire signed [(4'h8):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire56,
                 wire55,
                 wire52,
                 wire45,
                 wire44,
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
                 reg54,
                 reg53,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire44 = (wire43 ?
                      $unsigned($unsigned({(wire39 ? wire40 : wire41),
                          (wire39 ? wire41 : wire39)})) : wire42);
  assign wire45 = (((^$unsigned((wire41 != (8'haa)))) ?
                      $unsigned($unsigned((wire44 >= (8'h9d)))) : ((wire41 * (wire41 ^ (8'ha9))) > $unsigned(wire39[(4'hc):(4'hc)]))) - ($unsigned($signed(wire41)) | (-wire41[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg46 <= (($unsigned(wire41[(2'h2):(1'h1)]) | wire39[(1'h1):(1'h0)]) ?
          (^~(wire44[(1'h1):(1'h0)] ?
              $signed($signed(wire43)) : {wire40})) : $unsigned($unsigned(((-wire44) ?
              (wire39 ? wire42 : wire39) : (&wire44)))));
      reg47 <= $signed((&(($signed(wire39) ?
              $unsigned(reg46) : (wire39 ? wire43 : reg46)) ?
          wire43 : ((wire45 ? reg46 : wire44) ?
              (~&(8'hac)) : $unsigned(reg46)))));
      reg48 <= ((reg46 ? wire43[(1'h0):(1'h0)] : wire42) || $signed(reg47));
      reg49 <= wire43;
      reg50 <= reg47;
    end
  always
    @(posedge clk) begin
      reg51 <= (8'ha3);
    end
  assign wire52 = (({(reg51 ? $signed((8'hbb)) : wire43),
                      $signed($unsigned((8'hb6)))} <= (wire44[(1'h0):(1'h0)] - wire39)) ^~ ({$signed(reg49[(4'ha):(3'h6)])} ?
                      {$unsigned((reg47 << reg49))} : (!$unsigned((reg50 ?
                          reg51 : wire42)))));
  always
    @(posedge clk) begin
      reg53 <= (~&wire45);
      reg54 <= (wire41[(1'h1):(1'h0)] ?
          reg53[(3'h7):(1'h1)] : ((8'ha6) ? (8'ha1) : {{reg50}}));
    end
  assign wire55 = $unsigned($signed((-wire52)));
  assign wire56 = $signed(wire42[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg57 <= reg51;
      if (((wire43[(2'h2):(1'h0)] ?
          wire44 : $signed(wire44)) - (reg47[(3'h5):(3'h5)] ?
          wire44 : (((wire39 ? wire39 : (8'hbe)) ?
              $signed((8'ha3)) : $signed(reg54)) >>> reg47))))
        begin
          if (($signed({(reg46 ? reg50[(1'h0):(1'h0)] : (^~reg51)),
                  (-wire55)}) ?
              $signed($signed(((^~wire55) ?
                  (reg49 ?
                      wire44 : (8'h9e)) : (reg47 ^ reg47)))) : ($unsigned(((wire56 ?
                      wire42 : reg49) <<< wire42)) ?
                  (reg50 ?
                      ($signed(wire43) ?
                          reg48 : (~&wire55)) : $unsigned(reg49[(4'hb):(2'h3)])) : (+(~&(~|wire55))))))
            begin
              reg58 <= (&reg51);
              reg59 <= ((+$signed($signed($unsigned(wire45)))) ?
                  (^$signed($unsigned(reg51[(3'h5):(3'h4)]))) : {(8'hb0)});
              reg60 <= reg50[(1'h0):(1'h0)];
              reg61 <= {((-wire45) >= ((~$unsigned(reg49)) ?
                      ($signed(reg49) <= (wire40 ?
                          (8'ha9) : reg59)) : $signed($signed(wire44)))),
                  (reg57 << wire52)};
            end
          else
            begin
              reg58 <= ($unsigned($signed($signed($signed((8'hb4))))) == $unsigned((8'h9d)));
            end
          reg62 <= ({$unsigned($unsigned((wire55 ? wire56 : reg60))),
                  $signed($unsigned(wire42[(4'hd):(2'h3)]))} ?
              (({(wire42 ^~ (7'h41))} ~^ (8'ha5)) | (~|reg46[(4'h8):(3'h5)])) : {$signed($signed({reg61,
                      reg48})),
                  {($unsigned(reg60) ^ (reg54 ? wire52 : reg48))}});
          reg63 <= ((reg47[(3'h5):(3'h4)] ?
                  {((reg49 ? wire40 : wire40) ?
                          wire52[(4'ha):(1'h1)] : reg60[(3'h6):(3'h6)])} : wire41) ?
              reg59[(5'h10):(4'hd)] : $signed(wire55[(3'h4):(1'h1)]));
          reg64 <= wire39;
          reg65 <= reg47[(3'h6):(3'h4)];
        end
      else
        begin
          reg58 <= $signed(($unsigned($unsigned($signed(reg48))) << ((+reg62[(4'h9):(1'h1)]) == (wire39 || reg49))));
        end
      reg66 <= $unsigned(wire42);
    end
  assign wire67 = (8'hb7);
  assign wire68 = {$unsigned(((^~(reg53 && reg58)) ?
                          $unsigned((+wire41)) : $unsigned($unsigned(reg58))))};
  assign wire69 = reg66;
  assign wire70 = (-(($signed((reg62 + (8'hbf))) && $signed($signed((8'ha1)))) ?
                      (((&reg47) ? $signed(wire52) : {reg63}) ?
                          $signed((&(8'had))) : ((|reg54) ?
                              reg63 : reg53[(4'ha):(4'h8)])) : $signed((~&(^(8'hb3))))));
  assign wire71 = $signed(((((reg48 ^~ reg65) ?
                              (wire39 >> (8'hbc)) : reg59[(4'hb):(4'h8)]) ?
                          wire68[(3'h6):(1'h1)] : wire52) ?
                      wire56 : wire39));
endmodule
