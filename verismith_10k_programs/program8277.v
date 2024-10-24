module top
#(parameter param193 = (((~|(((8'ha1) == (8'hb0)) ? ((8'hbd) ? (8'haa) : (8'ha0)) : {(8'hb0)})) + (({(7'h41), (8'h9d)} >= (&(8'ha8))) ? {((8'hbe) ? (8'h9f) : (8'ha2))} : (~(8'hba)))) + {((8'h9c) >= (((8'hba) ? (8'ha5) : (8'hb1)) == (^~(8'ha3)))), ({(^~(8'hb3)), (&(8'had))} && (((8'hb5) ? (8'ha8) : (8'hbe)) ? {(8'h9f), (8'hbe)} : {(8'h9f), (8'hac)}))}), 
parameter param194 = param193)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire192;
  wire signed [(3'h4):(1'h0)] wire190;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire72;
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  assign y = {wire192,
                 wire190,
                 wire76,
                 wire75,
                 wire74,
                 wire5,
                 wire6,
                 wire34,
                 wire36,
                 wire42,
                 wire72,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 (1'h0)};
  assign wire5 = (wire3[(4'he):(4'h9)] ?
                     wire1[(3'h5):(1'h1)] : (wire4[(2'h3):(1'h1)] ?
                         ($unsigned((8'hb0)) ?
                             (&(~|wire3)) : ((wire3 + wire0) ?
                                 $unsigned(wire0) : $signed((7'h40)))) : $unsigned({(!wire2),
                             $signed(wire1)})));
  assign wire6 = ($signed(($unsigned(wire1) ?
                     {$unsigned(wire4),
                         (wire4 ?
                             (8'hb6) : wire3)} : (+((7'h40) >>> wire1)))) * (^~(7'h43)));
  always
    @(posedge clk) begin
      if ((+wire1))
        begin
          reg7 <= (wire2[(1'h0):(1'h0)] > (^~(((wire0 ?
                  wire6 : wire1) == {wire4}) ?
              $signed($signed(wire0)) : ((wire4 ~^ wire5) && wire3))));
          reg8 <= (^~$unsigned($signed(wire4)));
          reg9 <= $signed($unsigned(($signed(wire2) ^~ ((reg8 ? wire1 : wire1) ?
              (wire0 >= wire3) : wire5[(1'h0):(1'h0)]))));
          if (((&({(reg9 || (8'ha9)), (~^wire6)} ?
                  $signed(wire3[(3'h6):(3'h5)]) : $unsigned($unsigned(wire1)))) ?
              reg7 : $signed(reg7[(4'h9):(4'h8)])))
            begin
              reg10 <= wire3;
            end
          else
            begin
              reg10 <= $unsigned(wire2[(4'hd):(4'ha)]);
              reg11 <= reg7;
              reg12 <= {(reg9[(2'h3):(2'h3)] ?
                      wire1[(4'ha):(4'h9)] : (wire3[(4'ha):(4'h8)] ?
                          ((+(8'h9e)) - (reg10 < (8'h9c))) : reg11))};
            end
        end
      else
        begin
          reg7 <= $signed({$signed({(wire1 >> reg7)}),
              ($signed(wire0) | $unsigned(wire2[(1'h1):(1'h0)]))});
          if (reg10)
            begin
              reg8 <= (7'h44);
              reg9 <= (reg9[(1'h0):(1'h0)] ?
                  reg8[(4'h8):(1'h0)] : $signed($unsigned((wire5 ?
                      $unsigned(reg8) : (~&reg12)))));
              reg10 <= {{$unsigned((wire6 << (reg11 ? reg9 : reg12))),
                      reg9[(1'h0):(1'h0)]}};
              reg11 <= (!$signed((((wire4 <= wire2) <= reg10) ?
                  $signed((reg11 ? wire1 : reg12)) : wire0)));
            end
          else
            begin
              reg8 <= reg7[(4'h8):(3'h4)];
              reg9 <= reg9[(3'h4):(1'h1)];
              reg10 <= {reg12[(1'h1):(1'h0)],
                  (reg10[(1'h1):(1'h0)] << $signed((wire1 ?
                      $unsigned(wire5) : $unsigned((8'hba)))))};
              reg11 <= $unsigned($signed($unsigned($unsigned(reg12[(1'h1):(1'h1)]))));
              reg12 <= $unsigned($signed((8'ha4)));
            end
        end
    end
  module13 #() modinst35 (.wire14(wire6), .wire17(wire2), .wire16(wire3), .wire15(wire5), .y(wire34), .clk(clk));
  assign wire36 = ((-(~|reg7)) < reg10);
  always
    @(posedge clk) begin
      reg37 <= (^~(wire2[(3'h7):(3'h5)] ?
          (^~{reg9, $unsigned(wire1)}) : ($unsigned((~|wire34)) ?
              {wire6[(1'h1):(1'h0)]} : {$unsigned(reg12),
                  (wire1 ? reg8 : wire34)})));
      reg38 <= wire6;
      reg39 <= $unsigned(reg11);
      reg40 <= reg12;
      reg41 <= wire0[(4'hc):(3'h5)];
    end
  assign wire42 = ($unsigned((8'hbb)) | wire6[(1'h0):(1'h0)]);
  module43 #() modinst73 (wire72, clk, reg39, reg37, reg12, wire3, reg40);
  assign wire74 = ({{{$unsigned(wire42)}, (7'h44)}, (^wire2)} >> reg9);
  assign wire75 = ((~^(+wire74)) ?
                      (((+(reg37 > (8'haa))) ?
                              wire74 : ($signed((8'h9f)) ?
                                  wire1 : $signed(wire1))) ?
                          (reg12[(4'hb):(2'h3)] ?
                              wire2[(4'hb):(3'h5)] : reg7[(3'h5):(1'h1)]) : wire3[(3'h4):(1'h0)]) : ((!wire72) != wire36));
  assign wire76 = (wire4 ? (7'h44) : wire4[(3'h6):(3'h5)]);
  module77 #() modinst191 (.wire82(wire2), .wire80(wire0), .y(wire190), .wire78(reg40), .wire79(wire42), .clk(clk), .wire81(wire74));
  assign wire192 = ($unsigned((8'ha0)) > (8'haa));
endmodule

module module77  (y, clk, wire78, wire79, wire80, wire81, wire82);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire78;
  input wire signed [(5'h15):(1'h0)] wire79;
  input wire [(5'h10):(1'h0)] wire80;
  input wire signed [(4'hc):(1'h0)] wire81;
  input wire [(5'h12):(1'h0)] wire82;
  wire signed [(5'h13):(1'h0)] wire188;
  wire signed [(5'h15):(1'h0)] wire137;
  wire signed [(5'h14):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire127;
  reg signed [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(4'h8):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg133 = (1'h0);
  reg [(5'h12):(1'h0)] reg132 = (1'h0);
  reg [(5'h14):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  assign y = {wire188,
                 wire137,
                 wire129,
                 wire83,
                 wire85,
                 wire86,
                 wire87,
                 wire127,
                 reg139,
                 reg138,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg84,
                 (1'h0)};
  assign wire83 = wire79[(4'he):(3'h5)];
  always
    @(posedge clk) begin
      reg84 <= $signed(wire83);
    end
  assign wire85 = (({{wire81[(1'h1):(1'h1)], (reg84 + wire79)},
                              wire82[(3'h5):(2'h2)]} ?
                          $signed(((wire83 >> wire80) << wire78)) : $unsigned(reg84[(5'h10):(3'h4)])) ?
                      $signed((wire80[(2'h3):(2'h3)] ?
                          $signed({wire81, reg84}) : $unsigned((wire78 ?
                              reg84 : wire81)))) : ((!(wire83[(5'h14):(5'h13)] ?
                          $signed(wire78) : $unsigned(wire80))) <= wire81));
  assign wire86 = $unsigned((((8'h9f) ?
                          wire83 : ($signed(wire81) ?
                              (wire79 ~^ wire81) : (-wire78))) ?
                      (8'hae) : wire82));
  assign wire87 = $unsigned(wire80);
  module88 #() modinst128 (wire127, clk, wire78, wire79, reg84, wire82);
  assign wire129 = ($unsigned(wire81) ~^ ({((wire83 ^ wire79) ?
                               (^wire82) : wire86)} ?
                       wire87 : $signed((~(~&wire86)))));
  always
    @(posedge clk) begin
      if (({(~^wire87[(2'h3):(2'h3)])} ^ $signed(wire85)))
        begin
          reg130 <= ($signed($unsigned($signed(wire86))) ?
              wire82 : wire129[(1'h0):(1'h0)]);
        end
      else
        begin
          if (($unsigned(((~(wire79 ~^ wire79)) ?
                  $unsigned($signed(reg84)) : $unsigned((wire80 * wire83)))) ?
              (8'ha6) : ($unsigned({{wire129, wire78},
                      wire127[(1'h1):(1'h0)]}) ?
                  (wire85 ?
                      ({wire85, wire127} ?
                          (wire129 ? wire83 : wire80) : (8'hbb)) : ((wire127 ?
                          wire87 : (8'hb0)) <= (reg84 ?
                          wire87 : wire82))) : wire129)))
            begin
              reg130 <= ((-((~{wire80, (8'haf)}) ?
                      wire78[(1'h1):(1'h0)] : $signed(((7'h42) ?
                          reg84 : reg84)))) ?
                  (&wire83) : ({wire85} ?
                      ({$unsigned(wire79)} ?
                          $signed({(8'hb7)}) : wire80) : reg130));
              reg131 <= reg84;
              reg132 <= (((wire86[(2'h3):(1'h1)] << wire85[(1'h1):(1'h1)]) ?
                  (-((wire78 ? reg131 : wire86) ?
                      $signed(reg131) : (wire80 * wire83))) : wire79) ^ ($unsigned($unsigned((wire85 ?
                      reg131 : reg130))) ?
                  wire86[(4'hb):(4'h8)] : (((~&(8'ha6)) ?
                          (~|wire85) : $unsigned(wire87)) ?
                      $signed($signed(reg84)) : ((!wire82) | (wire79 <<< reg84)))));
              reg133 <= $unsigned($unsigned($unsigned(((-wire80) >> reg84[(5'h10):(3'h6)]))));
              reg134 <= $signed(($unsigned((8'haf)) ?
                  wire82[(4'ha):(1'h0)] : ($signed((wire129 >>> reg84)) ?
                      $signed($signed((8'hbd))) : (wire78 ?
                          wire127 : ((8'hbd) ? reg131 : wire85)))));
            end
          else
            begin
              reg130 <= ($signed(((~^reg133[(4'hd):(4'hb)]) <= (((8'haa) <= wire78) * wire81))) ?
                  wire86 : $unsigned($unsigned($signed($signed(wire79)))));
            end
          reg135 <= wire81[(2'h2):(1'h1)];
          reg136 <= $signed(wire87[(2'h3):(1'h0)]);
        end
    end
  assign wire137 = ((reg132 || $signed(wire80)) ?
                       (^(reg130[(4'hf):(4'hb)] ?
                           wire78[(2'h3):(2'h2)] : (8'haf))) : {$unsigned({(-wire83),
                               (8'ha8)}),
                           (8'hb1)});
  always
    @(posedge clk) begin
      reg138 <= $signed($signed(((&reg135) ? (!wire129) : $unsigned(reg84))));
      reg139 <= (wire82 << $unsigned(reg133));
    end
  module140 #() modinst189 (.clk(clk), .wire144(reg130), .y(wire188), .wire143(wire80), .wire141(reg131), .wire142(wire79));
endmodule

module module43
#(parameter param70 = {(^(~^((|(8'ha9)) ? ((8'hb5) ? (8'hba) : (8'h9c)) : {(7'h44)})))}, 
parameter param71 = (((param70 > (param70 ? (param70 ^ (8'hbc)) : (param70 * param70))) != (&(((8'ha9) < param70) ? (param70 ? (7'h42) : param70) : {param70}))) ? (!(({param70, param70} ? param70 : param70) ? (8'h9f) : {(param70 < param70)})) : (((((7'h43) ? param70 : param70) ? (param70 || param70) : (|param70)) * ((param70 != param70) ? (param70 > (8'haf)) : (~param70))) ^ (param70 <= param70))))
(y, clk, wire44, wire45, wire46, wire47, wire48);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire44;
  input wire [(4'hb):(1'h0)] wire45;
  input wire signed [(5'h12):(1'h0)] wire46;
  input wire signed [(4'hf):(1'h0)] wire47;
  input wire [(4'h8):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire62;
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  assign y = {wire69,
                 wire64,
                 wire49,
                 wire50,
                 wire62,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire49 = ((wire46[(4'hf):(4'hc)] ?
                          ($unsigned((~&(8'hb2))) ?
                              ($signed((8'ha1)) ?
                                  (~&wire46) : $signed(wire48)) : ((^wire44) ?
                                  $signed(wire44) : (~^(8'hbf)))) : wire45) ?
                      (^(wire47[(2'h2):(1'h0)] ?
                          wire45 : ((wire45 | (8'ha8)) == $signed(wire47)))) : $signed($unsigned(wire44)));
  assign wire50 = {wire49};
  module51 #() modinst63 (.wire53(wire50), .wire54(wire48), .y(wire62), .wire52(wire49), .wire55(wire47), .clk(clk), .wire56(wire46));
  assign wire64 = $unsigned((^~(((wire46 ^ wire45) ?
                      $signed(wire48) : (wire50 ?
                          wire48 : wire48)) ^~ (~^(wire48 > (8'hbc))))));
  always
    @(posedge clk) begin
      reg65 <= (-(wire45 && ((8'ha7) * $unsigned(wire62[(3'h5):(3'h4)]))));
      reg66 <= wire64[(3'h7):(3'h7)];
      reg67 <= ($unsigned((wire50 > (7'h40))) ?
          $signed($signed(wire44)) : $signed(((7'h41) || wire48)));
      reg68 <= reg66[(3'h4):(3'h4)];
    end
  assign wire69 = {$signed(wire49[(4'hc):(2'h3)])};
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire18;
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire19,
                 wire18,
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
  assign wire18 = (((!{(~&wire15)}) ^ $signed($signed($unsigned(wire15)))) <<< wire17[(3'h4):(2'h3)]);
  assign wire19 = (+$signed(($signed(wire16) - $unsigned((-wire16)))));
  always
    @(posedge clk) begin
      reg20 <= (|wire14[(2'h2):(1'h0)]);
      if ($signed((~^$signed(wire17))))
        begin
          if (wire15)
            begin
              reg21 <= (~&$unsigned(wire16[(4'h8):(4'h8)]));
              reg22 <= (~{$signed($unsigned(reg20))});
            end
          else
            begin
              reg21 <= $unsigned(((((~&wire15) ?
                      $unsigned(wire16) : {wire15, (8'hb9)}) != (~&{reg20})) ?
                  wire16[(3'h6):(1'h0)] : ((reg22[(4'he):(4'h8)] ~^ $unsigned(wire18)) >>> $signed($unsigned(wire18)))));
              reg22 <= reg21[(1'h0):(1'h0)];
              reg23 <= reg21;
              reg24 <= $signed(wire15);
            end
          reg25 <= {wire17[(3'h7):(1'h0)],
              (wire18 ?
                  (wire16[(3'h7):(1'h1)] ?
                      reg21 : ((8'haa) ?
                          (~^reg22) : reg24[(2'h3):(2'h2)])) : (((wire18 + reg24) + (&wire14)) ?
                      ((|wire14) ?
                          wire17[(3'h4):(1'h1)] : $unsigned(reg23)) : (wire19[(3'h6):(3'h4)] & $signed(reg20))))};
          reg26 <= reg20[(1'h1):(1'h1)];
          reg27 <= $unsigned($signed({(&wire19), wire18[(3'h5):(1'h0)]}));
          reg28 <= reg27;
        end
      else
        begin
          reg21 <= (~^((^(reg26[(4'hb):(1'h1)] >> (reg24 ?
              reg27 : (8'haa)))) >= wire17));
          if ($unsigned(({wire16, $signed($signed(reg23))} ?
              $unsigned((^(reg25 ?
                  (7'h43) : wire17))) : (reg25[(2'h2):(1'h1)] ^ reg28[(1'h0):(1'h0)]))))
            begin
              reg22 <= {$unsigned(wire17)};
              reg23 <= (|(reg26 && (($signed(reg23) ?
                  (~^reg27) : (reg25 ?
                      reg28 : reg28)) == {$unsigned((8'hab))})));
              reg24 <= {$signed($signed($unsigned({wire14, wire18})))};
              reg25 <= $unsigned($signed(($unsigned((reg26 <<< wire15)) ?
                  reg27 : ($unsigned(reg20) ~^ wire15[(4'hc):(4'h8)]))));
            end
          else
            begin
              reg22 <= ($unsigned($signed(reg24[(1'h0):(1'h0)])) ?
                  ($unsigned($signed({reg25,
                      wire17})) <= ($unsigned($unsigned(reg24)) >>> wire14[(2'h2):(2'h2)])) : $signed(reg24));
              reg23 <= $unsigned({wire18, (+wire19)});
            end
          reg26 <= (reg28[(3'h4):(1'h0)] ? reg22[(1'h0):(1'h0)] : {reg20});
          if (wire18)
            begin
              reg27 <= $unsigned($unsigned($unsigned(($unsigned((7'h42)) ?
                  (~^wire17) : wire17))));
              reg28 <= reg20;
              reg29 <= (8'ha2);
            end
          else
            begin
              reg27 <= {wire18[(1'h1):(1'h1)]};
              reg28 <= $unsigned(reg29[(4'hc):(4'ha)]);
              reg29 <= ($signed($signed(reg27[(5'h11):(4'h9)])) ?
                  reg21 : (reg23[(3'h4):(2'h3)] & $unsigned(($signed(reg24) ?
                      $unsigned((8'ha7)) : (8'hb0)))));
              reg30 <= $signed($signed((~$unsigned($unsigned(wire18)))));
              reg31 <= (&reg21[(2'h2):(2'h2)]);
            end
        end
    end
  assign wire32 = (($unsigned(wire19[(5'h12):(4'hc)]) >> $unsigned((+reg29[(4'hf):(2'h2)]))) ?
                      (8'hab) : {($unsigned((reg21 & reg20)) ?
                              {wire15} : (~|wire15[(3'h7):(1'h1)]))});
  assign wire33 = $unsigned($unsigned(reg30));
endmodule

module module51
#(parameter param61 = (((~(&((7'h41) ^~ (8'hb9)))) ^~ {(&((8'hab) - (8'hac))), {((8'hba) < (8'ha6))}}) ? (+(((~^(8'hb4)) << ((8'ha2) ? (8'ha7) : (8'ha6))) <= (|((8'hab) <<< (7'h41))))) : (!{(~^(|(8'hb2)))})))
(y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'h1b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire56;
  input wire signed [(4'hf):(1'h0)] wire55;
  input wire signed [(4'h8):(1'h0)] wire54;
  input wire [(2'h2):(1'h0)] wire53;
  input wire signed [(2'h3):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  assign y = {wire60, wire59, wire58, wire57, (1'h0)};
  assign wire57 = {$unsigned(wire53[(1'h1):(1'h0)]), (&wire53[(1'h0):(1'h0)])};
  assign wire58 = (wire56[(4'hf):(4'he)] ?
                      ((wire55 | {wire54[(4'h8):(3'h7)], {(7'h44)}}) ?
                          ($unsigned(wire52) ?
                              ((wire55 >>> wire56) && {wire55,
                                  wire54}) : $unsigned((wire56 <= wire53))) : $signed((-(wire53 ?
                              wire56 : wire54)))) : $unsigned(($unsigned($unsigned(wire53)) ?
                          (wire56[(2'h2):(2'h2)] ?
                              $signed(wire57) : $signed(wire56)) : ($signed(wire57) | (+wire53)))));
  assign wire59 = {wire57, wire55};
  assign wire60 = wire52[(2'h3):(1'h0)];
endmodule

module module140
#(parameter param186 = ((&{(|((8'haf) ? (8'hb7) : (8'hac))), (^~((8'ha0) <<< (7'h44)))}) & (8'h9e)), 
parameter param187 = ({{{(~param186), (!param186)}, ({param186} || (8'ha8))}} ? (((+{param186, param186}) ? param186 : ((param186 ? param186 : (7'h40)) || (&param186))) ? param186 : param186) : param186))
(y, clk, wire144, wire143, wire142, wire141);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire144;
  input wire signed [(5'h10):(1'h0)] wire143;
  input wire signed [(5'h15):(1'h0)] wire142;
  input wire [(3'h6):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire185;
  wire signed [(4'h8):(1'h0)] wire181;
  wire [(3'h7):(1'h0)] wire155;
  wire signed [(3'h5):(1'h0)] wire154;
  wire [(4'hb):(1'h0)] wire153;
  wire [(3'h5):(1'h0)] wire150;
  wire [(4'he):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire148;
  wire [(3'h4):(1'h0)] wire147;
  wire signed [(5'h12):(1'h0)] wire146;
  wire signed [(4'he):(1'h0)] wire145;
  reg [(5'h10):(1'h0)] reg184 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg182 = (1'h0);
  reg [(4'ha):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg178 = (1'h0);
  reg [(5'h13):(1'h0)] reg177 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg176 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg174 = (1'h0);
  reg [(5'h10):(1'h0)] reg173 = (1'h0);
  reg [(2'h3):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg168 = (1'h0);
  reg [(3'h6):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg165 = (1'h0);
  reg [(2'h3):(1'h0)] reg164 = (1'h0);
  reg [(3'h7):(1'h0)] reg163 = (1'h0);
  reg [(2'h2):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg161 = (1'h0);
  reg [(4'he):(1'h0)] reg160 = (1'h0);
  reg [(2'h3):(1'h0)] reg159 = (1'h0);
  reg [(2'h2):(1'h0)] reg158 = (1'h0);
  reg [(4'h9):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg152 = (1'h0);
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  assign y = {wire185,
                 wire181,
                 wire155,
                 wire154,
                 wire153,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 reg184,
                 reg183,
                 reg182,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg152,
                 reg151,
                 (1'h0)};
  assign wire145 = $unsigned(((wire144 ?
                           (~&(wire143 ? wire142 : wire144)) : ((wire144 ?
                                   wire141 : wire143) ?
                               {wire144, wire141} : $unsigned(wire142))) ?
                       (!wire144) : (~|wire141[(3'h6):(3'h6)])));
  assign wire146 = ($signed($signed($signed($signed(wire142)))) ?
                       (&$signed((!wire144[(1'h1):(1'h0)]))) : wire145[(2'h2):(2'h2)]);
  assign wire147 = wire145[(3'h5):(2'h2)];
  assign wire148 = wire144[(1'h0):(1'h0)];
  assign wire149 = (wire143[(3'h6):(2'h3)] ?
                       wire142 : (~^(-(~^$signed(wire142)))));
  assign wire150 = $unsigned(wire147);
  always
    @(posedge clk) begin
      reg151 <= wire142[(3'h6):(1'h1)];
      reg152 <= $signed((7'h43));
    end
  assign wire153 = reg151[(4'ha):(4'ha)];
  assign wire154 = (8'haf);
  assign wire155 = reg152;
  always
    @(posedge clk) begin
      if (((~^(((wire141 << wire142) ^~ wire142) & wire141)) ?
          reg151[(2'h3):(1'h1)] : wire148))
        begin
          if (reg152)
            begin
              reg156 <= wire154[(1'h0):(1'h0)];
              reg157 <= (reg152 ~^ reg156[(3'h4):(3'h4)]);
            end
          else
            begin
              reg156 <= $signed(wire145[(4'hc):(1'h1)]);
              reg157 <= wire147;
              reg158 <= {$signed((wire143 >= reg151))};
            end
        end
      else
        begin
          if (wire149[(3'h4):(2'h2)])
            begin
              reg156 <= $unsigned($unsigned($signed($unsigned({(8'ha6),
                  wire144}))));
              reg157 <= $signed(({((reg152 ?
                      wire141 : (8'hbf)) <<< (~reg158))} < $unsigned($unsigned((wire144 <<< wire145)))));
              reg158 <= (+$signed(({(reg157 ?
                      wire142 : wire145)} & ((wire153 * wire144) ?
                  (!wire149) : (~&reg157)))));
              reg159 <= {(8'ha4)};
            end
          else
            begin
              reg156 <= wire147[(1'h0):(1'h0)];
              reg157 <= (^{$signed((~wire144)),
                  $signed($unsigned($unsigned((7'h41))))});
              reg158 <= (~(((8'hbd) - (!wire149[(4'ha):(3'h5)])) >>> (!reg151)));
              reg159 <= (wire150 ? reg159[(1'h1):(1'h0)] : {(~&(~(~reg151)))});
              reg160 <= ($unsigned(((((7'h40) >>> (8'haa)) ^~ (~^wire153)) ?
                      $signed((!wire150)) : $unsigned((reg158 << reg156)))) ?
                  {wire150[(2'h3):(1'h1)],
                      ((8'hbb) ?
                          $unsigned(wire142) : $signed((reg156 == (8'h9f))))} : reg156);
            end
          reg161 <= (|(|(~^(8'hae))));
          if ($signed(wire142))
            begin
              reg162 <= (&reg151[(4'h8):(1'h0)]);
              reg163 <= (wire153 ?
                  ($unsigned($unsigned($signed(wire155))) | ($signed($signed(wire153)) < ((8'haf) ?
                      (wire142 ?
                          wire144 : reg157) : wire144))) : ($unsigned($signed((^wire143))) > ((!wire153[(1'h1):(1'h1)]) ?
                      ((reg161 ? wire155 : wire146) ?
                          {wire143,
                              wire148} : (reg152 < wire153)) : wire144[(1'h1):(1'h1)])));
              reg164 <= wire150[(3'h4):(1'h1)];
              reg165 <= $signed((+$unsigned(((8'hac) ?
                  $signed((8'haa)) : (reg160 && (8'ha8))))));
            end
          else
            begin
              reg162 <= reg162[(1'h0):(1'h0)];
            end
          if ($signed(reg160))
            begin
              reg166 <= ((+(~^(wire142[(1'h0):(1'h0)] & $unsigned(reg158)))) ?
                  $signed($signed($signed(wire154[(2'h3):(2'h2)]))) : $signed(reg161));
              reg167 <= ($signed(((~(8'hb7)) ?
                  {(reg165 ?
                          reg163 : wire153)} : reg151[(2'h3):(1'h0)])) >> (wire141 ?
                  {reg151, (~^reg157[(3'h5):(3'h5)])} : $signed(reg156)));
              reg168 <= (^$unsigned((reg159 ^~ (~|reg166[(4'hd):(1'h1)]))));
              reg169 <= $signed(reg160[(4'ha):(3'h5)]);
              reg170 <= wire153[(1'h1):(1'h1)];
            end
          else
            begin
              reg166 <= (((({wire142, wire155} ?
                      (reg162 ?
                          reg168 : wire149) : wire141[(1'h1):(1'h0)]) || ($unsigned(wire143) <<< (reg159 ?
                      reg165 : reg166))) << $unsigned(reg161[(4'h8):(4'h8)])) ?
                  wire141[(1'h1):(1'h1)] : ($unsigned((^~(-reg168))) & $signed((!(8'ha8)))));
            end
          reg171 <= ({(wire141[(3'h4):(1'h0)] != reg163),
                  (wire143 + $unsigned((wire154 <= wire148)))} ?
              reg151[(3'h4):(1'h0)] : (($signed((reg158 ~^ (8'h9d))) != (^wire144)) ~^ wire146[(4'hb):(1'h0)]));
        end
      if (wire144)
        begin
          reg172 <= reg158[(2'h2):(1'h0)];
          reg173 <= (+({{(-reg158)},
                  (reg160 ? (reg164 ^ reg166) : wire145[(4'he):(1'h0)])} ?
              $unsigned((~{reg152, wire148})) : wire149));
          reg174 <= {reg157};
        end
      else
        begin
          reg172 <= reg162[(1'h1):(1'h1)];
        end
      reg175 <= (wire150[(1'h1):(1'h0)] || {reg162,
          ($signed($unsigned((8'hb2))) >> ($signed(wire141) && (8'hb4)))});
      if ({{wire142}})
        begin
          reg176 <= reg163;
        end
      else
        begin
          reg176 <= $unsigned(reg166[(3'h4):(2'h3)]);
          if ({($signed(reg158[(2'h2):(2'h2)]) ?
                  $unsigned({(reg165 ? reg172 : reg172),
                      (!reg166)}) : $unsigned($unsigned($signed(wire153))))})
            begin
              reg177 <= $unsigned($unsigned($signed((((7'h44) ?
                      wire148 : reg168) ?
                  (wire143 ^~ reg174) : ((8'h9d) ? (8'h9d) : (8'hb2))))));
              reg178 <= ((wire149 ?
                      reg165[(1'h1):(1'h0)] : (~^((&reg163) && (~|reg172)))) ?
                  (~{(reg159 >= wire150[(2'h2):(1'h1)]),
                      {wire147[(2'h2):(1'h0)],
                          (&wire154)}}) : $signed(wire148[(4'he):(4'he)]));
            end
          else
            begin
              reg177 <= wire143;
            end
          reg179 <= ($signed((8'hb1)) ?
              ((|$unsigned(reg157[(4'h9):(1'h0)])) ?
                  $signed(((reg151 & wire148) * wire143[(5'h10):(4'hf)])) : (&{(!wire155),
                      $signed(reg152)})) : $unsigned(($signed((reg160 * reg175)) || (^reg156[(2'h2):(1'h1)]))));
          reg180 <= $unsigned($unsigned(reg158[(2'h2):(1'h1)]));
        end
    end
  assign wire181 = $unsigned($unsigned(reg160[(4'h9):(1'h1)]));
  always
    @(posedge clk) begin
      reg182 <= (reg157[(3'h4):(1'h0)] ?
          wire153[(3'h7):(1'h1)] : ($signed(reg163[(2'h2):(1'h0)]) <<< ((^(wire145 ?
              (7'h44) : reg177)) && (^wire141))));
      reg183 <= $signed((~|(&((wire153 ? reg158 : wire150) ~^ (wire142 ?
          reg158 : wire148)))));
      reg184 <= reg180[(4'h8):(3'h6)];
    end
  assign wire185 = $unsigned({reg164[(2'h2):(1'h0)]});
endmodule

module module88  (y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire92;
  input wire [(4'hc):(1'h0)] wire91;
  input wire [(3'h5):(1'h0)] wire90;
  input wire [(4'hb):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire123;
  wire [(5'h15):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire121;
  wire [(4'hd):(1'h0)] wire120;
  wire signed [(2'h2):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire [(5'h15):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire112;
  wire [(3'h4):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire110;
  wire [(3'h4):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire93;
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(3'h5):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire102,
                 wire94,
                 wire93,
                 reg115,
                 reg114,
                 reg113,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  assign wire93 = {wire90};
  assign wire94 = wire90[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg95 <= {(wire92[(3'h5):(1'h0)] ?
              ((~&$unsigned(wire91)) ?
                  wire94 : (~&wire94[(4'he):(4'h9)])) : ($signed($unsigned(wire89)) ?
                  wire90 : ((8'ha4) >= $unsigned(wire89))))};
      reg96 <= $signed((|wire93[(4'hd):(3'h4)]));
      reg97 <= $signed(wire93);
    end
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire94[(3'h5):(1'h1)])))
        begin
          reg98 <= wire90;
          reg99 <= (!$unsigned(wire89[(4'ha):(3'h7)]));
          reg100 <= $signed((~^(+wire89)));
        end
      else
        begin
          reg98 <= ((+reg98[(3'h4):(2'h2)]) | wire90[(2'h3):(1'h1)]);
          reg99 <= (8'ha8);
        end
      reg101 <= ({(~^reg99[(3'h5):(2'h2)]),
          $signed($signed(wire89))} >>> reg95);
    end
  assign wire102 = $signed((reg101[(1'h0):(1'h0)] ~^ wire89[(3'h6):(1'h1)]));
  always
    @(posedge clk) begin
      if ($signed({reg99[(1'h0):(1'h0)]}))
        begin
          reg103 <= reg100[(3'h7):(3'h6)];
        end
      else
        begin
          reg103 <= ((reg98[(3'h6):(1'h1)] ?
                  $unsigned(wire94[(4'hd):(1'h1)]) : $signed($signed(reg97))) ?
              $signed({$signed(reg103[(2'h3):(2'h3)])}) : (!wire89));
          if (reg98)
            begin
              reg104 <= $signed(reg99);
              reg105 <= {$signed($signed({((8'ha4) ? (8'hbd) : wire89),
                      (!reg97)}))};
              reg106 <= ($unsigned(($signed((wire92 ? reg100 : reg96)) ?
                  $unsigned((|reg104)) : reg105[(1'h0):(1'h0)])) < ((^(reg95[(5'h11):(1'h1)] > {wire92})) ?
                  (|(^$unsigned((8'ha8)))) : (($unsigned(wire93) - reg100) - $signed({(8'ha8)}))));
            end
          else
            begin
              reg104 <= reg98;
              reg105 <= ((($signed((reg100 ? (7'h41) : reg95)) ?
                          $unsigned(reg99[(1'h0):(1'h0)]) : $signed(wire91)) ?
                      ((reg103 ? (reg100 - reg96) : {reg101}) ?
                          reg105 : $unsigned($signed(wire90))) : reg96) ?
                  ((($unsigned(reg101) == wire102) ?
                          {wire102,
                              (wire92 ?
                                  wire93 : wire102)} : $signed(reg95[(1'h1):(1'h1)])) ?
                      $unsigned({reg103[(1'h1):(1'h0)],
                          $unsigned(wire93)}) : wire92) : $unsigned($signed((~&reg96))));
              reg106 <= (&({(wire94[(5'h11):(4'hb)] <= reg104)} >= {wire102[(4'h9):(4'h9)],
                  (+$unsigned((7'h43)))}));
              reg107 <= (8'hb2);
              reg108 <= (~&reg100);
            end
        end
    end
  assign wire109 = (~reg103);
  assign wire110 = ((-wire91[(4'h9):(2'h3)]) ?
                       reg103 : $unsigned(({{reg107}} << $signed($signed(wire94)))));
  assign wire111 = {((wire109 < (reg99[(4'h8):(1'h0)] < {reg99, reg108})) ?
                           {reg95} : (8'hb0)),
                       ($unsigned($signed(((8'ha0) ^~ wire92))) <<< wire109)};
  assign wire112 = ((~{$signed((^wire89))}) ?
                       (wire102 ?
                           wire111[(2'h3):(2'h3)] : wire90[(3'h5):(1'h0)]) : ((reg97 * wire90[(1'h0):(1'h0)]) ?
                           (8'ha6) : (((reg104 <<< wire92) - (reg104 >> reg100)) <= wire111)));
  always
    @(posedge clk) begin
      reg113 <= {($unsigned($unsigned($signed(reg100))) ?
              $unsigned({$unsigned(reg107),
                  (reg101 & reg99)}) : {((reg101 <<< reg107) ?
                      (wire102 <<< (8'ha0)) : (!wire102)),
                  $unsigned((wire93 & (8'hbf)))}),
          (8'ha8)};
      reg114 <= $unsigned((wire94 < (^~{{(8'hb8), (8'ha3)}, (|wire91)})));
      reg115 <= (~&(|($unsigned($unsigned(reg97)) * ((~wire92) <<< reg107))));
    end
  assign wire116 = $signed($signed(reg96[(3'h4):(2'h2)]));
  assign wire117 = ($unsigned($signed((&wire94))) >>> $signed({$unsigned({reg114}),
                       ($signed(reg107) & (8'hb1))}));
  assign wire118 = wire89;
  assign wire119 = (((((reg115 <<< wire117) ?
                                   {reg99, wire91} : $signed(wire118)) ?
                               (~{reg106, wire109}) : reg114) ?
                           reg95[(3'h6):(2'h3)] : ($unsigned($unsigned(wire90)) ?
                               $signed((reg115 ?
                                   wire110 : reg106)) : $unsigned($signed(wire92)))) ?
                       wire90 : wire91);
  assign wire120 = wire93[(4'hd):(4'hd)];
  assign wire121 = (((!wire116) << $unsigned(reg106)) ?
                       reg101 : {$signed($signed((reg107 - (8'hbd))))});
  assign wire122 = (~&((({wire89} & wire118) ^ reg115) ?
                       (~^{(wire119 == (7'h43))}) : wire118));
  assign wire123 = (reg108[(1'h1):(1'h1)] ?
                       (($unsigned($unsigned(reg101)) >= {$signed(wire118)}) ?
                           ($signed((reg98 && reg107)) << reg108[(2'h2):(1'h0)]) : (({wire122,
                                       reg96} ?
                                   reg101 : (wire111 << reg104)) ?
                               $signed((wire121 >= reg96)) : (~|(reg100 - reg97)))) : {($unsigned((wire90 ?
                                   (8'hb5) : wire122)) ?
                               (^~$unsigned(wire90)) : ({reg103} ?
                                   $unsigned(wire94) : reg108[(3'h4):(2'h2)])),
                           (&{(~wire109), (&wire121)})});
  assign wire124 = wire116[(4'hb):(4'hb)];
  assign wire125 = (reg101[(4'h9):(3'h7)] ?
                       (((wire89 ^ $signed(wire119)) ?
                               (reg99[(2'h2):(1'h0)] ?
                                   (wire89 ? (8'ha6) : wire122) : (wire90 ?
                                       wire112 : wire111)) : $signed(reg108[(2'h3):(2'h3)])) ?
                           {(reg101 < $signed((8'ha8)))} : reg95[(3'h6):(3'h4)]) : $signed((wire124[(1'h1):(1'h0)] < {reg108[(3'h4):(3'h4)]})));
  assign wire126 = reg99[(1'h1):(1'h0)];
endmodule
