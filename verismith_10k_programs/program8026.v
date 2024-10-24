module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  assign y = {wire92,
                 wire90,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire5 = {$signed($unsigned(wire1))};
  always
    @(posedge clk) begin
      if ($unsigned((wire4 != wire2)))
        begin
          if (($unsigned(wire3) ~^ $signed((+wire0[(2'h2):(1'h0)]))))
            begin
              reg6 <= {$unsigned(wire2[(1'h0):(1'h0)]), wire4};
            end
          else
            begin
              reg6 <= wire4;
              reg7 <= {($signed($unsigned((wire3 <= wire2))) + $signed((!(wire5 >>> wire1)))),
                  $signed((^$unsigned($signed(wire0))))};
              reg8 <= $signed({(wire2 ?
                      $unsigned($signed(wire3)) : $signed(wire1))});
              reg9 <= $signed(wire3[(4'hc):(3'h4)]);
            end
        end
      else
        begin
          reg6 <= wire0;
          reg7 <= (~$signed(wire1));
          reg8 <= reg9[(2'h3):(2'h3)];
          reg9 <= $unsigned($signed($unsigned($signed($signed(wire1)))));
          reg10 <= ((wire3 ?
              (wire2[(1'h0):(1'h0)] ?
                  (~^(~^reg7)) : ((!reg9) >> {wire2,
                      wire0})) : $signed((-wire0[(1'h1):(1'h1)]))) << ($signed((-wire3)) >>> wire0[(3'h6):(2'h2)]));
        end
      reg11 <= wire3;
      reg12 <= (|wire1);
    end
  assign wire13 = reg11;
  assign wire14 = reg10;
  assign wire15 = {$unsigned({reg7}), reg6};
  assign wire16 = (($unsigned($signed(wire3)) > wire5) <<< ($unsigned(wire1) ?
                      (7'h42) : wire4[(4'hd):(4'hc)]));
  assign wire17 = wire3[(3'h4):(1'h0)];
  assign wire18 = (wire0[(4'h8):(2'h2)] && ($unsigned((reg9[(3'h5):(1'h0)] ?
                      {(8'hae), reg10} : $signed((8'ha8)))) && wire4));
  module19 #() modinst91 (.wire22(wire15), .y(wire90), .wire21(reg9), .wire20(reg6), .clk(clk), .wire24(reg8), .wire23(wire2));
  assign wire92 = wire15;
endmodule

module module19
#(parameter param89 = (8'hb8))
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire24;
  input wire [(5'h10):(1'h0)] wire23;
  input wire signed [(5'h11):(1'h0)] wire22;
  input wire signed [(2'h3):(1'h0)] wire21;
  input wire [(3'h5):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire86;
  wire [(3'h7):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire84;
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire53,
                 wire38,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire55,
                 wire56,
                 wire84,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg37,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg25 <= (&$unsigned((7'h40)));
      if (wire22)
        begin
          reg26 <= $signed((7'h43));
          reg27 <= (((~($unsigned(reg26) ?
                  wire21[(1'h1):(1'h0)] : wire22[(4'ha):(4'ha)])) | reg25) ?
              wire20 : wire20[(1'h0):(1'h0)]);
          reg28 <= wire23;
          reg29 <= ((reg25[(4'h8):(2'h3)] || $signed(wire22)) ?
              (reg26[(4'ha):(2'h3)] ?
                  $unsigned(reg26) : (~($unsigned((8'hbb)) ?
                      (wire24 ? wire21 : reg25) : (wire20 ?
                          wire20 : wire20)))) : $signed(reg27));
          reg30 <= ($unsigned(reg25[(3'h4):(1'h1)]) < wire23[(1'h0):(1'h0)]);
        end
      else
        begin
          reg26 <= (~|reg26);
        end
      reg31 <= $unsigned($signed($signed(($signed((8'hb8)) << $signed(wire24)))));
    end
  assign wire32 = ($unsigned(($signed((wire23 ? reg31 : wire22)) ?
                      (-wire23[(2'h2):(1'h1)]) : ({reg27} ?
                          (reg25 ?
                              reg25 : reg28) : reg29[(1'h1):(1'h0)]))) & reg31[(1'h0):(1'h0)]);
  assign wire33 = ((reg30[(3'h7):(3'h6)] ?
                      reg29[(3'h6):(3'h6)] : ({((8'ha4) - wire24),
                              $unsigned((7'h40))} ?
                          ($signed(wire22) ?
                              $signed(wire20) : wire24[(3'h5):(3'h4)]) : (wire22[(4'hd):(1'h1)] ?
                              (^~wire22) : $unsigned(reg25)))) == wire23);
  assign wire34 = {(~&reg25[(1'h0):(1'h0)]),
                      {{(wire20[(1'h1):(1'h0)] ?
                                  (reg26 ? wire20 : (8'hb0)) : (reg29 ?
                                      wire23 : reg25)),
                              (~wire22)}}};
  assign wire35 = {(wire21[(2'h3):(2'h2)] >> (((-wire22) < reg27[(4'hc):(4'ha)]) ?
                          $unsigned($unsigned(wire33)) : reg25))};
  assign wire36 = $signed((((((8'hbf) ? reg30 : (8'hbe)) ?
                              wire21 : (reg27 ? wire33 : (8'ha0))) ?
                          ((-reg28) + (reg27 ^ wire35)) : reg26[(5'h11):(2'h3)]) ?
                      (($unsigned((8'hab)) >> wire23[(5'h10):(3'h6)]) ?
                          $unsigned((~^wire23)) : (~|wire24[(4'hc):(4'ha)])) : (~{$signed(wire32)})));
  always
    @(posedge clk) begin
      reg37 <= $signed({$unsigned(reg26[(4'h8):(3'h5)])});
    end
  assign wire38 = $unsigned($signed((8'hb8)));
  module39 #() modinst54 (wire53, clk, reg27, reg29, wire33, reg26);
  assign wire55 = ((7'h42) ?
                      wire23 : (wire33 <<< ($signed(reg31[(4'ha):(4'h8)]) >= ($signed(wire23) <= $signed(reg25)))));
  assign wire56 = reg28[(3'h4):(1'h1)];
  module57 #() modinst85 (.wire59(reg25), .wire58(wire32), .wire60(reg27), .wire62(wire23), .clk(clk), .y(wire84), .wire61(wire24));
  assign wire86 = reg26[(2'h2):(2'h2)];
  assign wire87 = reg30;
  assign wire88 = (({wire24} ?
                      $signed($signed($unsigned((8'ha2)))) : (((8'ha4) != (8'ha0)) ^ $signed((reg31 ?
                          (8'hb4) : wire32)))) <= $unsigned(reg25));
endmodule

module module57  (y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire62;
  input wire [(4'h8):(1'h0)] wire61;
  input wire signed [(4'hd):(1'h0)] wire60;
  input wire signed [(5'h15):(1'h0)] wire59;
  input wire signed [(4'hc):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire signed [(5'h13):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire80;
  wire [(2'h2):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 (1'h0)};
  assign wire63 = ($unsigned(wire61) - wire59);
  assign wire64 = wire61[(3'h5):(2'h3)];
  assign wire65 = wire60;
  assign wire66 = ((wire62 ~^ $unsigned((|(+wire61)))) >> wire60);
  assign wire67 = $signed({$unsigned(($unsigned((8'hb4)) ?
                          (wire63 ? wire64 : wire65) : wire58[(2'h2):(1'h0)])),
                      $signed(((!wire64) >>> ((8'h9d) >= wire66)))});
  assign wire68 = (+wire65[(2'h2):(2'h2)]);
  assign wire69 = (wire64 || (wire64 ?
                      (wire62[(2'h3):(1'h1)] ^~ wire66[(1'h0):(1'h0)]) : (((!wire68) ?
                          (wire65 ?
                              wire64 : wire68) : $signed(wire59)) ^ $unsigned({wire63}))));
  assign wire70 = wire69;
  assign wire71 = wire68[(2'h3):(2'h3)];
  assign wire72 = ($signed(wire69[(1'h1):(1'h1)]) ?
                      ($unsigned(wire58) && ({(^wire63),
                          {wire65, wire67}} && (+(wire65 ?
                          (7'h42) : wire70)))) : ((~|wire67) - ($unsigned((~^(8'had))) ^~ ((wire60 < wire62) >= (~&wire68)))));
  assign wire73 = wire59[(3'h6):(1'h1)];
  assign wire74 = (wire61[(4'h8):(3'h7)] | wire68);
  assign wire75 = (~&$unsigned(wire63));
  assign wire76 = (((~^($unsigned(wire72) && {wire73})) && wire64[(2'h2):(1'h0)]) & $signed(((^$signed((8'hb7))) ?
                      $signed({wire69, wire65}) : {$unsigned((8'hb0)),
                          wire60[(2'h2):(2'h2)]})));
  assign wire77 = (wire61 >= $unsigned(((8'ha7) & wire63[(4'ha):(3'h4)])));
  assign wire78 = (+wire61);
  assign wire79 = wire60;
  assign wire80 = $unsigned($unsigned((&wire74)));
  assign wire81 = ((wire67[(4'hb):(3'h7)] >>> (((wire76 ?
                              wire78 : wire72) && (^wire75)) ?
                          (wire69 ? wire76 : (8'ha4)) : $signed((wire68 ?
                              wire59 : wire65)))) ?
                      $unsigned(wire64) : $unsigned(wire66));
  assign wire82 = (+wire67);
  assign wire83 = (wire73 ?
                      $unsigned((&{$unsigned(wire78),
                          {wire70, wire81}})) : wire82[(3'h4):(2'h3)]);
endmodule

module module39
#(parameter param51 = (|(^~(8'haa))), 
parameter param52 = (|(|{(~^(|param51)), (^~param51)})))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire43;
  input wire signed [(5'h11):(1'h0)] wire42;
  input wire [(3'h6):(1'h0)] wire41;
  input wire signed [(4'hc):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire44;
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  assign y = {wire50, wire45, wire44, reg49, reg48, reg47, reg46, (1'h0)};
  assign wire44 = (($signed($unsigned($signed(wire43))) <<< (+(^~$unsigned(wire40)))) - {$signed(wire40[(3'h7):(2'h3)])});
  assign wire45 = wire43;
  always
    @(posedge clk) begin
      reg46 <= {($unsigned(wire42[(4'hc):(4'ha)]) != wire44)};
      if ((~|$signed((wire43[(1'h1):(1'h0)] ?
          wire41[(2'h2):(1'h1)] : $signed(wire45)))))
        begin
          reg47 <= wire45;
        end
      else
        begin
          reg47 <= $unsigned($signed($signed(({wire43, wire45} ?
              $unsigned(wire42) : {reg47}))));
          reg48 <= ($signed((^wire41[(1'h1):(1'h1)])) <= wire44);
          reg49 <= $unsigned(($signed((wire43[(3'h6):(1'h0)] < reg47[(1'h0):(1'h0)])) ?
              $signed($signed(reg46[(2'h2):(2'h2)])) : $signed($unsigned(wire42))));
        end
    end
  assign wire50 = $unsigned($unsigned({$signed($signed((8'ha0)))}));
endmodule
