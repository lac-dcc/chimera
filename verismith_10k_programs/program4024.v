module top
#(parameter param62 = ({(((|(8'hac)) ? (~&(8'hb0)) : ((8'hbe) ? (8'haa) : (8'hb4))) & (~|{(8'hb7), (8'ha6)}))} ? ((^(!(!(8'ha8)))) ? {((+(8'hab)) ? (~^(8'haa)) : {(8'ha3), (8'hb6)}), ((|(7'h44)) << ((8'hb7) <<< (8'had)))} : (~&(~&(|(8'ha1))))) : ({((!(8'ha3)) <= ((8'hba) < (8'hb8)))} <<< {{((8'hb0) + (8'hbd)), (~&(8'ha2))}, (8'ha1)})), 
parameter param63 = param62)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  assign y = {wire60,
                 wire40,
                 wire38,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire4 = $unsigned({wire3});
  assign wire5 = wire1[(2'h2):(2'h2)];
  assign wire6 = (wire3 ?
                     {(wire4 ?
                             ($signed(wire4) ?
                                 (wire4 > wire4) : wire4[(4'h9):(3'h6)]) : $unsigned($unsigned((8'hb3))))} : ((wire1[(4'hc):(4'hb)] ?
                             {$unsigned((8'ha5))} : wire3) ?
                         wire2[(2'h2):(2'h2)] : wire4));
  assign wire7 = (&((($unsigned(wire6) ? (^wire4) : (wire6 ? wire3 : wire1)) ?
                     wire5[(2'h2):(1'h1)] : $unsigned($unsigned((8'hb9)))) & $signed((wire1[(4'h9):(1'h1)] ^~ (wire0 - wire4)))));
  assign wire8 = wire7[(5'h11):(3'h5)];
  assign wire9 = $unsigned(wire5[(1'h1):(1'h1)]);
  assign wire10 = wire1;
  always
    @(posedge clk) begin
      reg11 <= $unsigned(($unsigned((-((8'ha5) ?
          wire3 : wire9))) * ($signed((wire10 ^~ wire7)) | wire0)));
      reg12 <= wire3;
      reg13 <= $unsigned($signed({(~(-wire10))}));
    end
  module14 #() modinst39 (.y(wire38), .wire17(wire0), .wire15(wire3), .wire16(wire7), .wire18(wire4), .clk(clk));
  assign wire40 = {(^~wire2)};
  module41 #() modinst61 (.wire43(wire4), .clk(clk), .wire44(wire38), .wire45(reg12), .wire42(wire9), .y(wire60), .wire46(wire7));
endmodule

module module41
#(parameter param59 = ({{(+((8'hac) ? (8'ha5) : (8'ha4)))}} ? (~&(^(~^(7'h43)))) : (((((7'h40) * (8'ha2)) ? ((8'hac) ? (8'hb8) : (7'h40)) : (^~(8'hb0))) ? ({(8'ha6), (8'hb4)} != (~|(8'hba))) : {((8'ha6) != (8'ha0)), ((8'ha5) ? (8'hab) : (8'hb5))}) ? ((((8'ha1) ? (8'hba) : (8'hb3)) ? (|(8'hae)) : {(8'ha6), (8'haf)}) ? {((8'hb4) ? (8'ha8) : (8'ha9))} : (!((8'hb1) & (8'hb8)))) : (|((8'had) - ((8'hb3) ? (8'hb0) : (8'hb7)))))))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire46;
  input wire [(4'ha):(1'h0)] wire45;
  input wire [(5'h11):(1'h0)] wire44;
  input wire [(5'h14):(1'h0)] wire43;
  input wire [(5'h11):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire47;
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire47,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire47 = ($unsigned((^{wire44[(3'h7):(3'h4)]})) >= wire44);
  always
    @(posedge clk) begin
      reg48 <= wire45;
      reg49 <= (8'ha1);
      if (reg49)
        begin
          reg50 <= ((wire43 <= $signed($signed((^~reg48)))) ?
              $signed(reg48[(1'h0):(1'h0)]) : (({$unsigned(wire44)} < {{wire44,
                      wire43}}) != wire44[(3'h5):(2'h3)]));
          reg51 <= wire47[(4'hb):(3'h4)];
        end
      else
        begin
          reg50 <= (+$unsigned({{wire46[(3'h5):(3'h4)]}}));
          reg51 <= ((($signed(wire43) ?
              (8'ha4) : ((wire43 ? wire46 : wire46) == (wire47 ?
                  wire47 : wire43))) ~^ $signed($unsigned(wire42))) * $unsigned($signed({$unsigned(wire47)})));
          reg52 <= wire45;
          reg53 <= ($signed((8'hb5)) >> wire47[(4'hb):(1'h1)]);
          reg54 <= (^~$unsigned($unsigned(reg48[(5'h14):(4'h9)])));
        end
    end
  assign wire55 = wire44[(2'h3):(1'h0)];
  assign wire56 = $signed({wire43,
                      $unsigned($signed((reg51 ? wire44 : wire47)))});
  assign wire57 = reg52[(1'h0):(1'h0)];
  assign wire58 = $signed(reg49[(4'h9):(1'h1)]);
endmodule

module module14
#(parameter param36 = (~&((^({(8'had)} | ((8'hb0) ? (8'h9e) : (8'ha3)))) ? ((((8'hb2) ? (8'hb1) : (8'hbb)) ? ((8'hb0) | (8'hbd)) : (+(8'hab))) ? (((8'ha4) ? (8'ha9) : (8'ha1)) - (~|(7'h42))) : (((8'haa) * (8'ha9)) ? ((8'ha2) << (8'hb6)) : (8'hb2))) : {(((8'hb6) + (8'hbf)) || ((8'hb0) ^~ (7'h43)))})), 
parameter param37 = {(8'ha2)})
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  input wire signed [(2'h2):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire19;
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
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
                 (1'h0)};
  assign wire19 = $signed((8'h9d));
  assign wire20 = {(({(^~wire15)} ?
                              $unsigned((wire17 ?
                                  (8'hb2) : wire15)) : wire17[(4'h9):(1'h1)]) ?
                          {wire17,
                              ((wire16 ? wire17 : wire16) ?
                                  (!wire17) : (wire17 ?
                                      wire18 : wire17))} : wire16)};
  assign wire21 = wire16;
  always
    @(posedge clk) begin
      if (wire16[(5'h11):(1'h0)])
        begin
          reg22 <= $signed({wire16[(4'hb):(3'h7)],
              ((~^$signed(wire20)) ?
                  wire15[(1'h0):(1'h0)] : {$unsigned(wire15),
                      $signed(wire15)})});
          reg23 <= (~&((+wire15[(1'h0):(1'h0)]) ?
              $unsigned(wire19[(4'he):(4'h8)]) : ((~wire17[(3'h5):(3'h5)]) ^ ({wire21} ?
                  (~^wire17) : wire21))));
          reg24 <= wire16;
          reg25 <= ($unsigned($unsigned((wire19[(4'hc):(3'h5)] ?
              (wire16 != wire16) : $signed(reg22)))) <= $unsigned(reg24));
        end
      else
        begin
          reg22 <= (-(-reg25));
          reg23 <= wire18[(4'h8):(1'h1)];
        end
      reg26 <= ((($signed(reg25[(2'h2):(2'h2)]) ?
              $unsigned((reg25 ?
                  wire16 : (7'h41))) : $signed((wire19 >= reg23))) != (($unsigned(wire15) ?
              reg24 : wire21) ^ $signed(reg25[(1'h0):(1'h0)]))) ?
          ((|reg25) ?
              ($signed($unsigned(reg25)) ?
                  wire16[(4'hb):(3'h6)] : ((!reg22) >> (~reg25))) : {{((7'h43) * wire21),
                      reg22},
                  wire16}) : {{(~|wire20), reg22}});
      if (wire17[(3'h5):(1'h1)])
        begin
          reg27 <= reg24[(4'hc):(4'hb)];
          reg28 <= ($signed(reg25[(1'h1):(1'h0)]) == $signed(wire20[(1'h0):(1'h0)]));
          reg29 <= $unsigned(reg23);
          reg30 <= (-({$signed($signed(wire20)), $unsigned($unsigned(wire18))} ?
              ((!$unsigned(wire21)) & wire16[(4'ha):(1'h0)]) : wire16));
        end
      else
        begin
          reg27 <= (|$signed($unsigned((reg27[(4'hb):(1'h1)] ?
              (reg30 - wire21) : {reg30}))));
          reg28 <= $signed(reg27);
          reg29 <= reg26[(2'h2):(2'h2)];
          if ($unsigned(reg29))
            begin
              reg30 <= reg22;
              reg31 <= ($signed($unsigned(reg28)) >>> (reg29[(3'h6):(2'h3)] ?
                  reg27[(1'h1):(1'h1)] : $unsigned($unsigned($signed(wire20)))));
              reg32 <= (reg24 >= wire21[(2'h2):(2'h2)]);
            end
          else
            begin
              reg30 <= {(-wire21[(1'h0):(1'h0)]),
                  (wire17[(3'h7):(3'h4)] ?
                      $unsigned($unsigned(reg30[(1'h1):(1'h1)])) : (reg31[(4'hb):(3'h7)] <= $signed((+reg22))))};
              reg31 <= wire21;
              reg32 <= (!wire16);
              reg33 <= $unsigned($signed({wire21}));
              reg34 <= $unsigned((($unsigned($signed(reg23)) ?
                  $signed((wire16 <<< wire15)) : (wire17[(4'hb):(1'h0)] ?
                      (reg25 ? reg22 : wire15) : (~reg30))) << (8'ha6)));
            end
        end
      reg35 <= ({(8'hac)} ?
          $signed(reg24[(4'h9):(3'h7)]) : {(((wire21 && reg30) ^~ $unsigned(reg28)) ?
                  (^(reg33 ? wire17 : reg22)) : ({reg30, wire19} ?
                      $signed(reg25) : (reg26 ? reg26 : reg34))),
              (~&((reg23 - wire18) == reg31[(4'ha):(2'h2)]))});
    end
endmodule
