module top
#(parameter param79 = (+((((8'hab) ~^ ((8'ha7) ? (8'ha6) : (8'ha9))) ~^ {{(8'hbf)}}) + (((8'had) ? ((8'hbe) ^~ (8'ha1)) : (|(8'haf))) ? {((8'hb9) ? (8'ha0) : (8'ha6))} : (|((8'hbc) || (7'h40)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire75,
                 wire39,
                 wire21,
                 wire19,
                 wire18,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 reg20,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire5 = (^(-(8'hb7)));
  assign wire6 = wire4;
  assign wire7 = ($unsigned($signed(wire2[(2'h2):(1'h1)])) ?
                     ((~^($signed(wire6) != $unsigned(wire4))) >>> wire2[(4'h9):(2'h2)]) : wire2[(3'h4):(3'h4)]);
  assign wire8 = (($unsigned((wire1[(5'h10):(4'h8)] ?
                         (wire1 ? wire6 : wire3) : (wire4 ?
                             (8'h9f) : (8'hb1)))) < ($signed((wire1 ?
                             (7'h44) : wire6)) ?
                         ($unsigned(wire0) && $signed(wire5)) : ((~|wire1) ?
                             (wire1 ^ wire2) : wire3))) ?
                     (|{{$signed(wire2), wire0[(3'h7):(1'h0)]},
                         $signed((wire5 || wire7))}) : (($unsigned((wire2 | wire7)) & $unsigned(wire0)) <<< $unsigned((7'h43))));
  assign wire9 = $signed((~&wire1));
  assign wire10 = (+(^(wire0 >= {(wire5 || wire6)})));
  assign wire11 = $unsigned($unsigned(($signed(wire4[(2'h2):(1'h1)]) ?
                      ((wire6 ? wire2 : wire1) ?
                          $signed(wire9) : $signed(wire9)) : wire9[(3'h7):(3'h5)])));
  assign wire12 = (({$signed((wire5 ? wire11 : wire6)), wire4} ?
                          $unsigned((8'h9d)) : $signed(wire6)) ?
                      {(8'hae), wire10} : wire10);
  assign wire13 = (-(~$signed((8'hae))));
  assign wire14 = $unsigned(wire10);
  assign wire15 = $unsigned(wire9[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg16 <= $unsigned((~&$unsigned((((8'ha9) ?
          wire2 : (8'hbb)) && (&wire7)))));
      reg17 <= wire1[(2'h3):(1'h0)];
    end
  assign wire18 = (^wire6);
  assign wire19 = wire13;
  always
    @(posedge clk) begin
      reg20 <= $unsigned(wire10[(1'h1):(1'h0)]);
    end
  assign wire21 = wire2;
  always
    @(posedge clk) begin
      reg22 <= (^~wire1);
      if ((^~(~(wire3 <= $unsigned($signed(wire3))))))
        begin
          reg23 <= wire11[(2'h2):(1'h1)];
        end
      else
        begin
          reg23 <= wire7;
          reg24 <= reg20;
          reg25 <= ($signed((($signed((7'h43)) && (wire12 ~^ (8'ha9))) || $signed($signed(wire5)))) ?
              (wire0 ?
                  (((8'hb3) & wire13[(3'h5):(2'h3)]) | $signed(reg24[(1'h0):(1'h0)])) : wire9[(4'hf):(2'h2)]) : $signed($unsigned((^wire11))));
          reg26 <= (reg17 - ((($signed(wire5) ?
                      (wire11 ~^ wire15) : wire0[(3'h5):(3'h5)]) ?
                  $signed((reg20 * wire21)) : {wire18[(3'h7):(1'h1)]}) ?
              $signed((~$signed(wire12))) : ($unsigned($unsigned(wire1)) ~^ (wire21[(2'h3):(2'h2)] < reg20))));
          reg27 <= (^~(((~(~^wire10)) ?
              ({wire11, wire2} ?
                  wire0 : (~&reg26)) : $unsigned(wire19)) && (($unsigned(wire4) ?
              wire1[(4'he):(4'hd)] : {wire9}) >>> {(reg23 ? wire0 : wire8)})));
        end
      reg28 <= $unsigned((8'h9d));
    end
  always
    @(posedge clk) begin
      if ((-{(wire1 - (8'h9c)),
          $signed(((wire19 >>> wire10) ? reg16 : $signed(wire13)))}))
        begin
          reg29 <= (wire2[(3'h7):(1'h1)] * {$signed((wire9 ?
                  wire18 : $signed(reg26)))});
          reg30 <= ({{reg20[(4'he):(4'h9)]}} ?
              ((($signed(reg26) ?
                  (^wire9) : (^wire10)) <= wire11[(1'h1):(1'h0)]) <<< (^((wire21 ?
                  wire2 : reg17) >>> ((8'ha6) + (7'h43))))) : reg17);
          reg31 <= ((wire10 > $unsigned((wire0[(1'h1):(1'h0)] ?
                  {wire21} : $unsigned(wire0)))) ?
              $unsigned($unsigned(wire9)) : reg30[(3'h4):(1'h0)]);
          reg32 <= reg30;
          reg33 <= reg17;
        end
      else
        begin
          if ($signed(reg16[(1'h1):(1'h1)]))
            begin
              reg29 <= {$unsigned(({{reg17, wire0}} | (+$unsigned(reg32)))),
                  (((+$unsigned((8'ha0))) << wire11) ?
                      $signed((reg27 ?
                          (^~(8'hbf)) : (wire7 ?
                              reg22 : wire12))) : ((~&wire2[(4'ha):(2'h3)]) >>> reg32[(2'h3):(2'h3)]))};
              reg30 <= $signed({(&{$signed(reg17)}),
                  $unsigned(($signed(reg27) ? {wire8, wire8} : {wire21}))});
              reg31 <= ((~&(-$signed((wire1 ?
                  wire10 : (8'ha7))))) ^ $signed(wire0));
              reg32 <= ({$signed($unsigned((reg25 ?
                      wire11 : wire2)))} >>> (wire8[(3'h5):(3'h4)] >= ($signed((~|wire13)) ?
                  ($signed(wire2) ?
                      (wire14 ? reg28 : reg27) : reg32) : $signed(reg27))));
              reg33 <= (!$signed($unsigned(reg16[(2'h3):(1'h1)])));
            end
          else
            begin
              reg29 <= {(|((-wire4[(3'h4):(2'h3)]) + {$signed(wire2)}))};
              reg30 <= $unsigned(wire13);
              reg31 <= {$unsigned($unsigned({$signed(reg22),
                      wire14[(4'hf):(1'h1)]})),
                  wire12[(4'hd):(2'h2)]};
              reg32 <= reg33;
              reg33 <= ($unsigned((((wire10 ?
                      reg20 : wire1) <<< reg24[(1'h1):(1'h1)]) ?
                  wire8 : $signed({reg25}))) >> $unsigned(wire4));
            end
          reg34 <= $unsigned($unsigned(wire3));
          reg35 <= ((($signed(reg31[(3'h7):(2'h3)]) && ($unsigned(wire2) ^ ((8'hbb) ^ wire6))) ?
                  $signed($unsigned(wire10[(2'h3):(2'h2)])) : $signed($signed({(8'ha2),
                      reg20}))) ?
              ((!(wire4[(1'h1):(1'h1)] ? wire18 : wire8)) ?
                  wire13[(2'h3):(2'h3)] : ((^~(reg34 - reg16)) ?
                      $signed(wire14) : $unsigned(wire11))) : (~&(($signed((8'hb0)) ?
                  (wire14 ? wire11 : (8'hba)) : (reg33 <= reg25)) - reg24)));
          reg36 <= $unsigned($unsigned($signed($unsigned($signed(wire11)))));
          reg37 <= reg33[(2'h3):(1'h0)];
        end
      reg38 <= ($signed((((~&wire1) ?
              reg20[(4'h9):(2'h2)] : (^wire12)) - wire19)) ?
          (-$unsigned($signed($unsigned(reg33)))) : $signed((-$unsigned((reg31 ?
              wire15 : wire10)))));
    end
  assign wire39 = (((~&(^~$unsigned(wire19))) >= reg17) > ($signed((~|(wire9 ?
                          wire6 : wire4))) ?
                      $signed({(reg26 ? reg38 : wire10)}) : (~&(~reg27))));
  module40 #() modinst76 (.wire41(wire9), .wire43(reg28), .wire42(reg32), .clk(clk), .wire44(wire6), .y(wire75));
  assign wire77 = {wire2,
                      {$unsigned($unsigned(reg33)),
                          ((wire12[(1'h0):(1'h0)] ?
                              {reg27} : $unsigned(wire19)) && wire1[(1'h0):(1'h0)])}};
  assign wire78 = $signed($unsigned($unsigned((+reg16[(2'h3):(1'h1)]))));
endmodule

module module40
#(parameter param73 = (((&{((8'ha1) < (7'h40))}) >= (|(((7'h41) * (7'h41)) ^ ((8'h9d) ? (8'hbf) : (8'h9e))))) | (|(((-(8'ha8)) < ((8'h9f) ? (8'ha7) : (8'haa))) ? {((8'hb4) ? (8'ha9) : (8'h9d))} : ((|(8'hbd)) ? ((8'ha1) ? (8'h9c) : (8'ha2)) : {(8'hbc), (8'hbd)})))), 
parameter param74 = (8'hbb))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire44;
  input wire [(4'h9):(1'h0)] wire43;
  input wire signed [(2'h2):(1'h0)] wire42;
  input wire signed [(3'h7):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire signed [(2'h2):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire53,
                 wire52,
                 wire46,
                 wire45,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire45 = {(~&((7'h42) ?
                          (wire42 ? wire41 : wire42[(1'h0):(1'h0)]) : (wire41 ?
                              wire42[(1'h0):(1'h0)] : wire41)))};
  assign wire46 = wire45;
  always
    @(posedge clk) begin
      reg47 <= (((((wire45 ? wire42 : wire41) * (wire42 ~^ wire41)) ?
              {wire42} : wire44) ?
          (+(wire46[(1'h0):(1'h0)] ?
              $signed((8'ha7)) : $signed(wire45))) : {(8'ha3),
              ({(8'hac), wire41} >= (!wire45))}) & wire42[(1'h1):(1'h0)]);
      reg48 <= (~&(wire43[(2'h3):(2'h2)] ?
          (wire45 & ($signed(wire44) ^~ $unsigned(wire44))) : $signed(wire41)));
    end
  always
    @(posedge clk) begin
      reg49 <= ({wire44} > (~&wire45));
      reg50 <= (wire41[(3'h7):(2'h3)] - (^wire43));
    end
  always
    @(posedge clk) begin
      reg51 <= (~^(({$unsigned(wire42), $signed(wire41)} ?
          $signed($unsigned(wire45)) : wire41[(2'h2):(1'h1)]) * (-{$unsigned((8'hbb)),
          (wire42 ? wire44 : wire41)})));
    end
  assign wire52 = (($signed((reg51 + (wire45 ? wire45 : reg51))) ?
                      ($unsigned($unsigned(wire45)) > (~|reg50)) : (wire46[(1'h0):(1'h0)] ?
                          reg51[(4'hb):(1'h1)] : (~reg47))) || $signed((8'ha3)));
  assign wire53 = (8'hbb);
  always
    @(posedge clk) begin
      reg54 <= ((reg50[(3'h6):(1'h1)] ~^ wire45[(3'h6):(3'h6)]) | wire53[(4'h9):(4'h9)]);
      reg55 <= $signed({(-$signed((reg48 ? reg51 : wire46))), wire44});
      reg56 <= (^($signed(wire41[(3'h7):(3'h4)]) - $unsigned((reg49[(1'h0):(1'h0)] != {reg51,
          reg54}))));
      if ($signed(reg48))
        begin
          reg57 <= $signed(wire44);
        end
      else
        begin
          reg57 <= (~|$signed((((8'ha3) ?
                  (wire42 ? (7'h44) : wire44) : (reg51 ? reg49 : wire42)) ?
              $unsigned((|wire46)) : $unsigned($unsigned(reg56)))));
          reg58 <= reg48[(1'h0):(1'h0)];
          reg59 <= $signed((^~reg56[(3'h7):(3'h4)]));
          reg60 <= ($unsigned(reg51[(1'h0):(1'h0)]) || reg48);
        end
    end
  assign wire61 = wire43;
  assign wire62 = wire61;
  assign wire63 = $unsigned(wire44);
  assign wire64 = ($unsigned(($signed($unsigned(reg59)) ?
                      {(8'hb0)} : ((wire46 > wire42) ?
                          {(8'ha4)} : $unsigned(reg51)))) <= $unsigned($unsigned((~^$unsigned(reg57)))));
  assign wire65 = reg50[(1'h0):(1'h0)];
  assign wire66 = (~^reg60[(1'h0):(1'h0)]);
  assign wire67 = (($unsigned($signed(wire66)) || ((~|{reg48,
                          reg47}) && wire63[(2'h3):(2'h2)])) ?
                      (|(($signed(wire64) ~^ (wire44 ? wire61 : wire46)) ?
                          ({wire62, reg59} ?
                              wire65 : ((8'hbf) ?
                                  (7'h44) : reg47)) : $unsigned((!(8'ha4))))) : wire64[(3'h7):(3'h4)]);
  assign wire68 = $unsigned(((!$unsigned(wire67)) + $signed((((7'h40) ?
                      wire65 : reg56) <<< (wire61 ? reg47 : wire63)))));
  assign wire69 = (~^reg50);
  assign wire70 = $signed((8'hb7));
  assign wire71 = (reg58[(2'h2):(2'h2)] ?
                      ((((wire65 ? wire70 : reg51) > (reg55 <= (8'ha0))) ?
                          $unsigned((8'ha5)) : $signed((&wire70))) >> $signed((wire62 & (reg51 - reg57)))) : (wire61[(4'hf):(2'h2)] ?
                          {({(8'ha2), (8'haa)} && wire46),
                              reg59[(3'h4):(2'h2)]} : $unsigned({{reg51},
                              (!(7'h42))})));
  assign wire72 = $signed(wire66);
endmodule
