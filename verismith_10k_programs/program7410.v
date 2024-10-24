module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire70;
  wire [(5'h15):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned($signed(wire4)));
  assign wire6 = {($signed((^~{wire0, wire3})) ?
                         wire2[(1'h1):(1'h1)] : $unsigned(wire2[(4'hd):(2'h3)])),
                     $unsigned((-$unsigned((wire4 <<< wire4))))};
  assign wire7 = wire2;
  module8 #() modinst64 (.clk(clk), .wire10(wire5), .wire9(wire2), .wire12(wire1), .wire11(wire0), .y(wire63));
  assign wire65 = (wire1 - wire2[(5'h13):(4'he)]);
  assign wire66 = $signed(((((8'haa) < (wire2 <<< wire2)) <= $signed($unsigned(wire3))) ?
                      wire65[(3'h4):(2'h2)] : wire4));
  assign wire67 = $signed($unsigned($signed($unsigned(wire4))));
  assign wire68 = ({$signed(((-(8'hb2)) ?
                          (wire2 ?
                              wire67 : wire63) : wire7[(3'h7):(1'h0)]))} && $unsigned(wire66));
  assign wire69 = $unsigned($unsigned((8'ha0)));
  assign wire70 = $signed(({({(8'hac)} ?
                          (wire3 << wire6) : wire7[(1'h1):(1'h1)])} && (($unsigned(wire6) ^~ (+wire67)) ?
                      wire69[(2'h3):(1'h1)] : wire66[(3'h5):(3'h5)])));
endmodule

module module8
#(parameter param61 = ((+(({(8'ha4), (8'ha4)} ~^ ((7'h41) ? (7'h40) : (8'hbf))) ~^ (~&((8'hbe) - (8'hbc))))) ? ((((^(8'hb6)) <<< {(8'ha8), (8'ha3)}) ? (((8'hb1) <= (8'h9c)) ? (!(7'h42)) : (|(8'ha8))) : ({(8'hb1), (8'ha5)} ^ ((8'hb7) ? (8'ha4) : (7'h43)))) ? ((|((8'hb1) <<< (8'hba))) ? (~|(~^(8'hab))) : (((8'ha0) ? (8'hb3) : (8'h9d)) ^ ((8'ha9) && (7'h41)))) : {(((8'h9e) && (8'hb6)) <<< (+(8'hac)))}) : (!(-({(8'hbd)} ? {(8'h9e), (8'ha3)} : ((8'ha0) <<< (8'hbc)))))), 
parameter param62 = param61)
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire12;
  input wire [(3'h4):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  assign y = {wire60,
                 wire52,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire13 = ((-(8'ha7)) ?
                      (8'haf) : ($unsigned($signed((^wire11))) ?
                          $unsigned($signed((8'ha4))) : wire11));
  assign wire14 = wire11;
  assign wire15 = ((($signed(wire9) & $signed(wire11)) <<< (wire13[(3'h5):(2'h3)] ?
                      $unsigned((wire13 ?
                          wire13 : wire14)) : wire9[(1'h0):(1'h0)])) ^~ wire13);
  assign wire16 = $signed(wire13);
  assign wire17 = (^wire16[(1'h1):(1'h1)]);
  assign wire18 = wire11;
  module19 #() modinst53 (.y(wire52), .wire23(wire10), .wire20(wire18), .clk(clk), .wire21(wire13), .wire22(wire9));
  always
    @(posedge clk) begin
      if ((wire16 ? (8'hb1) : $unsigned($signed((7'h41)))))
        begin
          reg54 <= $signed($signed((8'hbe)));
          reg55 <= (~((((+(8'hb9)) ?
              (8'hbc) : (wire11 != wire10)) * wire16) & {($signed(wire15) ^ $signed(wire10))}));
          reg56 <= wire9[(4'hc):(2'h2)];
        end
      else
        begin
          reg54 <= ($signed((reg56 ?
              ((wire52 ? wire16 : wire17) ?
                  wire52 : (wire16 >> wire10)) : $unsigned((wire12 ?
                  wire16 : wire52)))) >> {wire15});
        end
      reg57 <= (^{$signed(wire14)});
      reg58 <= (($unsigned({wire18[(4'hb):(4'ha)], wire52[(4'hc):(1'h1)]}) ?
          wire52 : ((wire52 ?
              (8'hb7) : wire18[(4'h9):(2'h2)]) < wire10[(4'he):(3'h5)])) ^ ($signed((8'hab)) ?
          $signed((!{reg55})) : wire16[(1'h0):(1'h0)]));
      reg59 <= $signed(wire9[(3'h6):(3'h6)]);
    end
  assign wire60 = $unsigned((reg55[(2'h3):(2'h3)] & reg56));
endmodule

module module19  (y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire23;
  input wire signed [(5'h15):(1'h0)] wire22;
  input wire [(3'h4):(1'h0)] wire21;
  input wire [(4'hc):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire [(2'h2):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire26,
                 wire25,
                 wire24,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire24 = $unsigned(wire20);
  assign wire25 = $unsigned(wire20);
  assign wire26 = $unsigned({wire22[(5'h12):(2'h2)]});
  always
    @(posedge clk) begin
      reg27 <= wire22;
      reg28 <= wire24;
      if (wire25[(2'h2):(2'h2)])
        begin
          reg29 <= $unsigned(reg27);
          reg30 <= ($signed(wire24[(5'h11):(5'h11)]) > (wire21[(2'h3):(1'h1)] ?
              {wire20[(1'h0):(1'h0)]} : (($signed(wire21) ?
                      reg28 : $unsigned(reg27)) ?
                  ($signed(wire20) ?
                      ((8'ha4) ?
                          (8'ha8) : wire21) : (~^reg27)) : (((8'ha4) ^ (8'ha2)) > (wire24 ^ (8'haa))))));
          reg31 <= (~^$signed(reg29[(3'h5):(3'h4)]));
        end
      else
        begin
          if ({(-(~($signed(wire24) ? wire23 : $unsigned((8'hab)))))})
            begin
              reg29 <= wire21[(3'h4):(1'h0)];
              reg30 <= ($unsigned((!wire25[(2'h3):(2'h3)])) - $signed((-$unsigned({(8'hac),
                  wire20}))));
              reg31 <= ($signed(reg31[(4'hc):(3'h4)]) || (((8'hbe) >= (reg31 ?
                      wire22[(3'h7):(2'h3)] : (wire26 << wire24))) ?
                  (wire21 == (wire23[(3'h4):(2'h2)] - $signed(reg30))) : ($unsigned($signed(wire21)) ?
                      wire26 : (-reg29))));
              reg32 <= (((wire26 << reg30) ?
                      ({reg27[(4'h9):(4'h8)], (~&reg28)} ?
                          $signed((reg29 ?
                              reg30 : (8'hb9))) : wire26) : $unsigned((reg30 ?
                          (wire26 ?
                              wire26 : wire26) : wire21[(2'h3):(2'h3)]))) ?
                  wire24 : wire25);
            end
          else
            begin
              reg29 <= (reg32 + wire22);
              reg30 <= reg29;
              reg31 <= reg28[(5'h12):(4'hc)];
            end
          reg33 <= $signed({($signed((&wire25)) <<< {(8'hab)}), wire25});
          reg34 <= (reg28[(1'h1):(1'h1)] * (wire23 ?
              $unsigned((wire22[(5'h11):(4'hf)] ?
                  (reg30 << reg29) : wire22)) : wire20));
          reg35 <= $signed((reg33[(3'h4):(2'h3)] ?
              $signed($signed((wire25 <= reg32))) : (~&reg28[(4'hb):(4'ha)])));
        end
    end
  assign wire36 = {$signed({((wire22 >= reg31) >= wire21[(1'h1):(1'h0)])}),
                      reg28};
  assign wire37 = (~|(wire21[(1'h0):(1'h0)] << (({(8'hb0),
                      (8'ha3)} != $unsigned(wire25)) && $unsigned({reg31}))));
  assign wire38 = $signed(reg30);
  assign wire39 = reg33;
  assign wire40 = ({(|wire38[(1'h1):(1'h0)])} >>> {(^~(wire38 >> (wire36 ?
                          reg31 : wire38))),
                      wire38});
  assign wire41 = {(~{$unsigned($unsigned(wire20)), (&(!(7'h42)))}),
                      $unsigned({(&(reg33 >= reg27))})};
  assign wire42 = wire37[(1'h1):(1'h0)];
  assign wire43 = {wire24[(5'h12):(3'h6)],
                      ((wire41[(3'h6):(3'h6)] == (reg34[(3'h7):(2'h3)] ?
                          $signed(reg33) : wire25)) ~^ wire23)};
  assign wire44 = wire24;
  assign wire45 = $unsigned(($signed(({reg27} >> {wire41, (8'hb4)})) ?
                      (~^{(^wire26), (|(8'h9c))}) : wire24));
  assign wire46 = $unsigned((8'hb1));
  assign wire47 = (wire45 && {$signed((wire41[(4'h8):(3'h6)] ?
                          (+reg31) : wire46))});
  assign wire48 = $signed((-({$unsigned(reg28)} ?
                      {(wire25 ? wire47 : wire20),
                          ((8'ha4) * reg30)} : (wire39 ?
                          $unsigned(reg32) : (|wire38)))));
  assign wire49 = (!reg34);
  assign wire50 = (((wire43 ?
                          (-((8'haf) <= wire49)) : ($unsigned(wire22) ?
                              wire47[(3'h5):(2'h2)] : (wire21 >= reg30))) ?
                      (~&$signed((wire44 && wire42))) : (8'hb5)) >> $signed((wire48[(1'h1):(1'h0)] ?
                      (!(wire46 != wire48)) : $signed($signed(wire26)))));
  assign wire51 = (^reg27);
endmodule
