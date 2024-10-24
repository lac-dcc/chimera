module top
#(parameter param89 = (((&{(~(8'h9d)), ((8'ha8) >> (8'ha6))}) << ({((8'h9c) ? (8'ha9) : (8'hba)), ((8'ha0) ~^ (8'hbb))} ? ({(8'haa), (8'hae)} ^ {(8'hab), (8'hb9)}) : ((^~(8'hb4)) < (^(8'haf))))) ? (^~{(&((7'h42) == (8'ha3))), ({(8'hac)} ^ ((8'hb0) ? (8'hb0) : (8'h9f)))}) : (((((8'had) ? (8'ha9) : (8'ha8)) >> (|(8'hb4))) ^~ (-{(7'h42), (8'haa)})) ? (|(((8'hb4) ? (8'hb6) : (8'haa)) * {(8'hbe), (8'haa)})) : {((8'hb0) || ((7'h44) >>> (8'hbf))), ({(8'h9f), (8'haf)} || (~^(8'ha6)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire73;
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire73,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  module5 #() modinst74 (.y(wire73), .wire9(wire4), .wire6(wire3), .wire8(wire2), .clk(clk), .wire7(wire1));
  always
    @(posedge clk) begin
      reg75 <= ({((((8'hab) ?
              wire73 : wire4) <<< $signed(wire3)) * $signed((wire4 ?
              (8'hb0) : (8'ha0)))),
          $signed(wire1)} <= (&(^(8'ha5))));
      reg76 <= $unsigned((~(8'hb9)));
      reg77 <= ($signed(($signed(wire2) ?
              $signed($signed(wire1)) : reg76[(1'h0):(1'h0)])) ?
          (wire73[(3'h6):(2'h3)] - (!{(^~wire2),
              $signed(reg76)})) : (~&wire2[(4'ha):(3'h7)]));
      reg78 <= {wire1[(1'h0):(1'h0)], wire3[(2'h3):(2'h3)]};
    end
  assign wire79 = $unsigned((&(reg76 - {$signed(wire1), $unsigned((7'h43))})));
  assign wire80 = (~^wire4);
  always
    @(posedge clk) begin
      if ($signed((reg78[(1'h1):(1'h1)] ?
          (($signed((8'ha8)) >= {(7'h44), reg77}) ?
              (&wire0) : $unsigned((~|reg77))) : (((|wire1) << wire80[(3'h4):(1'h1)]) && {{wire3,
                  reg75}}))))
        begin
          reg81 <= (|wire4[(5'h12):(5'h12)]);
          reg82 <= reg78;
          reg83 <= wire80;
        end
      else
        begin
          reg81 <= wire1[(4'ha):(4'ha)];
          if (reg81)
            begin
              reg82 <= (wire3 ? $unsigned(wire3[(4'he):(1'h0)]) : {reg77});
              reg83 <= ($signed((+($unsigned(reg78) ?
                      $signed((8'had)) : $unsigned(reg83)))) ?
                  wire79 : $unsigned((8'hb7)));
            end
          else
            begin
              reg82 <= ((!((^(reg78 >= wire73)) <<< ((wire0 ? wire73 : wire80) ?
                  (~&wire73) : (wire73 - wire1)))) ^ $unsigned($unsigned(reg75)));
              reg83 <= ({(wire2[(1'h1):(1'h0)] ?
                      {$unsigned(wire0),
                          (^reg78)} : ((reg78 >> wire3) || wire0))} | ((reg83 || $signed({reg75,
                  wire1})) >= {(-(8'hb8)), ((!wire2) + (^~wire4))}));
              reg84 <= $unsigned(((+$unsigned($signed(wire1))) != (wire4[(3'h4):(3'h4)] ?
                  wire1 : (+reg81))));
            end
          if ((~&(({$unsigned(reg82)} ?
                  ($unsigned(reg77) >> $signed((8'ha8))) : ({reg84} ^~ wire1)) ?
              (((8'hb2) ? $unsigned(wire3) : wire73) ?
                  (wire0 ?
                      (wire3 ?
                          (8'ha0) : wire4) : $unsigned(reg83)) : $unsigned((~^(8'hb3)))) : wire2[(5'h10):(5'h10)])))
            begin
              reg85 <= (8'ha6);
              reg86 <= reg78[(1'h1):(1'h1)];
              reg87 <= $signed(((~^reg86) ?
                  ($unsigned((wire2 ? wire3 : wire79)) ?
                      ($unsigned(wire0) == (wire0 < wire0)) : ((wire1 ?
                              (8'ha1) : reg76) ?
                          reg78[(2'h3):(2'h3)] : (~^(8'ha6)))) : $signed(reg86)));
            end
          else
            begin
              reg85 <= wire2;
              reg86 <= (|{(&$unsigned(wire4)), reg83[(3'h4):(2'h3)]});
            end
          reg88 <= (~^((~|$unsigned($signed(reg86))) ?
              wire73[(1'h0):(1'h0)] : ((|(reg77 ? (8'hb8) : wire73)) ?
                  {wire1} : (reg76 << wire4[(2'h3):(1'h1)]))));
        end
    end
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire72,
                 wire70,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire11,
                 wire10,
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
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire10 = $signed({$unsigned(((wire8 ? wire9 : wire6) ?
                          wire9[(2'h3):(1'h1)] : (7'h42)))});
  assign wire11 = (^~wire7);
  always
    @(posedge clk) begin
      reg12 <= (!$signed((8'ha2)));
      reg13 <= reg12;
      reg14 <= wire9[(1'h1):(1'h1)];
    end
  assign wire15 = $signed(reg12[(4'h9):(2'h3)]);
  assign wire16 = (^~($unsigned({$unsigned(wire6)}) ?
                      wire6[(1'h0):(1'h0)] : ($unsigned($signed(wire6)) ?
                          ((~&wire7) | (reg14 ^~ wire11)) : wire6)));
  assign wire17 = wire16[(3'h5):(3'h4)];
  assign wire18 = ({$signed(wire8[(2'h2):(2'h2)])} ?
                      (~wire16[(3'h5):(1'h0)]) : wire15[(4'hb):(3'h5)]);
  assign wire19 = wire6;
  assign wire20 = ({(($unsigned(wire17) & {wire18,
                          reg13}) != (|reg14))} >= wire16);
  assign wire21 = reg12;
  always
    @(posedge clk) begin
      if (wire18)
        begin
          reg22 <= {wire11,
              {($signed(wire21) ^ $signed($unsigned(wire10))),
                  $signed(((wire7 ? wire9 : wire8) ?
                      wire11 : $signed((8'ha3))))}};
          reg23 <= $signed(wire15);
          reg24 <= $unsigned($unsigned($unsigned($signed($signed(wire10)))));
          reg25 <= (^~(wire10[(4'hd):(4'hb)] ?
              ($signed((~reg24)) ? (8'h9e) : {{wire11, wire9}}) : (((wire17 ?
                      wire10 : reg22) ?
                  $unsigned(reg23) : {wire11,
                      reg24}) || reg13[(3'h6):(2'h3)])));
          reg26 <= $signed(wire8);
        end
      else
        begin
          reg22 <= wire10[(1'h1):(1'h0)];
          if ((8'h9e))
            begin
              reg23 <= (wire11 | $signed(reg13));
              reg24 <= reg23[(3'h5):(1'h1)];
            end
          else
            begin
              reg23 <= wire8;
              reg24 <= wire10[(4'h8):(2'h3)];
              reg25 <= (~reg24);
              reg26 <= ((~|((wire16 ~^ (wire19 || reg25)) ?
                      $signed($signed(wire11)) : ((reg12 >> reg25) ?
                          (wire20 * wire6) : reg24[(3'h5):(3'h4)]))) ?
                  (8'hbe) : ((!(~(wire21 >>> wire16))) ?
                      $signed(reg12) : ({(8'hac), {reg12, (8'hb4)}} ?
                          $signed((wire6 ? reg22 : wire19)) : (((8'hba) ?
                                  wire10 : wire11) ?
                              $signed(wire16) : (8'hbb)))));
            end
          reg27 <= $unsigned((($signed((reg23 ~^ wire18)) ?
              {{reg22}, (+wire18)} : ($unsigned(wire6) ^~ (reg22 ?
                  wire21 : reg13))) * (|$signed((wire20 ? reg24 : wire8)))));
          reg28 <= wire6[(3'h4):(1'h0)];
        end
      if (($signed((~&reg14[(4'hb):(1'h1)])) ?
          $signed($unsigned((reg26 & $signed(reg23)))) : reg14[(3'h7):(1'h1)]))
        begin
          reg29 <= $unsigned(($unsigned(($signed(reg22) ?
                  {wire15} : wire16[(2'h2):(2'h2)])) ?
              reg14[(1'h0):(1'h0)] : reg22[(4'hc):(2'h3)]));
          reg30 <= $signed(reg28);
        end
      else
        begin
          reg29 <= wire10[(3'h7):(3'h7)];
          reg30 <= reg25[(3'h7):(3'h4)];
        end
      reg31 <= ((8'hb1) + $signed(reg22[(4'ha):(1'h0)]));
      reg32 <= (8'haa);
      reg33 <= $unsigned(((&(^~$signed(reg25))) == reg27[(1'h1):(1'h1)]));
    end
  module34 #() modinst71 (wire70, clk, reg27, wire19, reg14, wire11);
  assign wire72 = $unsigned(({wire19, $signed((^~wire6))} ?
                      reg12 : (~|wire10[(2'h3):(2'h3)])));
endmodule

module module34
#(parameter param69 = ({((((8'ha4) < (8'hae)) << (7'h43)) ? (((8'hb0) < (8'ha7)) ? ((8'haa) ? (8'ha1) : (8'ha2)) : ((8'h9d) || (8'hbe))) : ({(8'h9e), (8'hb4)} ? (~&(7'h40)) : (&(8'h9f)))), ({(~|(7'h43))} ? (~^(&(8'hb7))) : {((7'h41) ? (8'hb2) : (7'h44))})} ? (((~^((8'hbb) || (8'hb2))) ? ((+(8'hbd)) == ((8'ha6) ? (8'h9f) : (8'hb5))) : {(~(8'hb3)), ((8'hae) << (8'hb1))}) ? ({{(8'hb3), (8'ha7)}} >> {(~&(8'ha1))}) : ((((7'h42) - (7'h43)) * (-(8'had))) == (((8'hac) ? (8'h9f) : (8'hbf)) + ((8'ha1) ? (8'hb2) : (8'ha3))))) : (-({((7'h40) && (8'hb1))} && (~(~^(7'h40)))))))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire38;
  input wire [(3'h4):(1'h0)] wire37;
  input wire signed [(4'hc):(1'h0)] wire36;
  input wire signed [(4'ha):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire59,
                 wire47,
                 wire46,
                 wire45,
                 reg61,
                 reg60,
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
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($unsigned(($signed((wire37 != wire37)) <<< $signed((wire38 ^ wire35))))))
        begin
          reg39 <= $signed((^~$signed(({wire37, wire37} + $signed(wire38)))));
        end
      else
        begin
          reg39 <= wire35;
          reg40 <= $signed((+(!wire36[(4'ha):(3'h4)])));
        end
      reg41 <= {{$unsigned($unsigned((reg39 ? wire37 : wire38))),
              $signed((+wire35))}};
      reg42 <= wire36[(3'h5):(2'h2)];
      reg43 <= $unsigned((wire37 > ($signed(reg39[(1'h0):(1'h0)]) ~^ ((!(8'hbb)) + $signed(wire35)))));
      reg44 <= wire36;
    end
  assign wire45 = (($unsigned($unsigned((reg44 >>> wire35))) ?
                      (($unsigned(wire38) ? (&wire38) : (reg44 > wire38)) ?
                          reg40[(5'h10):(3'h4)] : (((8'h9f) ? wire35 : reg43) ?
                              (~wire37) : (wire36 >> (8'hbd)))) : ($signed($signed(reg43)) ^ {reg40[(1'h0):(1'h0)],
                          $signed(wire36)})) && $signed(reg40));
  assign wire46 = $unsigned(($unsigned((~&(reg44 ? reg43 : (8'ha2)))) ?
                      wire36[(4'hc):(3'h4)] : ((reg41 ?
                              wire45[(2'h3):(2'h3)] : (reg40 ?
                                  wire38 : (7'h40))) ?
                          $unsigned(reg41[(4'h9):(2'h2)]) : {(~^reg43),
                              (^~wire37)})));
  assign wire47 = {reg42};
  always
    @(posedge clk) begin
      if ($unsigned((+$signed(wire38[(3'h6):(1'h1)]))))
        begin
          reg48 <= ({(($signed(wire35) ?
                  $unsigned(wire46) : ((8'hbb) <= (8'hbc))) && (wire37 ?
                  {wire45} : (8'hbe)))} != (-reg44));
        end
      else
        begin
          if ($signed($unsigned({reg44, wire46[(1'h0):(1'h0)]})))
            begin
              reg48 <= (~reg39);
              reg49 <= $unsigned(reg39);
            end
          else
            begin
              reg48 <= (^$signed($unsigned($signed($unsigned(reg49)))));
              reg49 <= reg42[(4'h8):(1'h1)];
              reg50 <= ((8'hb9) ? $unsigned(wire47) : wire36[(3'h5):(1'h0)]);
            end
          reg51 <= wire45;
          reg52 <= ((!(~&$signed(wire45))) ? reg44 : wire37[(3'h4):(2'h3)]);
          reg53 <= wire36[(2'h2):(1'h1)];
          reg54 <= $signed({wire45});
        end
      reg55 <= (reg40[(4'h9):(3'h6)] ?
          (!$signed(($signed((7'h42)) + (~&reg44)))) : $signed(wire36[(2'h3):(1'h0)]));
      reg56 <= {(($signed({(8'haf)}) && wire46[(1'h1):(1'h1)]) * $unsigned(wire45)),
          ((reg55 - (+reg40)) ^ $signed((wire46 ?
              reg49[(1'h0):(1'h0)] : (~(7'h42)))))};
      reg57 <= (~&$unsigned($unsigned(($unsigned(wire36) << (reg51 ?
          reg42 : reg39)))));
    end
  always
    @(posedge clk) begin
      reg58 <= (7'h40);
    end
  assign wire59 = $signed((reg51 ?
                      reg42[(1'h0):(1'h0)] : $signed($signed(wire46[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg60 <= wire46[(2'h2):(1'h1)];
      reg61 <= $signed(reg50);
    end
  assign wire62 = $signed(wire37[(3'h4):(2'h3)]);
  assign wire63 = $signed(wire36);
  assign wire64 = (8'hb4);
  assign wire65 = $unsigned(reg54);
  assign wire66 = ($signed(wire37) ?
                      (8'hb4) : (!$unsigned($signed((reg60 <= reg39)))));
  assign wire67 = wire35;
  assign wire68 = ($unsigned(reg49[(2'h3):(1'h1)]) ?
                      $unsigned(reg39[(1'h0):(1'h0)]) : reg54);
endmodule
