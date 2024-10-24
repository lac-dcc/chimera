module top
#(parameter param54 = (+{(&({(8'haa)} ? ((7'h44) ? (8'hb3) : (8'hb7)) : (~^(8'hb7))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire52, wire9, wire8, wire7, reg6, reg5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1[(3'h6):(1'h1)];
      reg5 <= reg4;
      reg6 <= $unsigned(reg5[(4'ha):(2'h3)]);
    end
  assign wire7 = (&$signed($signed(((wire1 || reg5) ^ (wire0 ?
                     wire1 : reg4)))));
  assign wire8 = $unsigned((wire3 ~^ (-(^~(8'hb2)))));
  assign wire9 = (wire1[(4'hc):(3'h4)] >>> ($unsigned((((8'hb8) != wire8) <<< $signed(reg4))) ?
                     wire1 : wire7[(1'h1):(1'h0)]));
  module10 #() modinst53 (.y(wire52), .wire11(wire1), .wire13(wire3), .clk(clk), .wire12(wire8), .wire14(wire0));
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire14;
  input wire [(5'h13):(1'h0)] wire13;
  input wire [(4'he):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire15;
  assign y = {wire51, wire50, wire48, wire17, wire16, wire15, (1'h0)};
  assign wire15 = wire14[(3'h7):(3'h7)];
  assign wire16 = $signed({(wire14 ? $unsigned(wire14) : (+{(8'hac)}))});
  assign wire17 = (((((-wire15) ? wire12 : wire16) & {$signed(wire15)}) ?
                          $unsigned(wire12) : (|{$signed(wire16),
                              $signed(wire11)})) ?
                      ($unsigned($signed(wire13[(3'h5):(3'h5)])) ?
                          (~|wire12[(4'h8):(3'h7)]) : (wire12 ?
                              wire12[(1'h0):(1'h0)] : wire11[(3'h6):(1'h0)])) : (({wire14,
                              (wire15 ?
                                  (8'hbd) : wire15)} != wire13[(2'h3):(1'h0)]) ?
                          ((wire15[(2'h3):(2'h2)] ?
                                  wire15[(1'h1):(1'h0)] : (~&(8'hbc))) ?
                              wire13[(3'h6):(2'h2)] : wire16[(1'h1):(1'h1)]) : (~$signed($signed(wire16)))));
  module18 #() modinst49 (.wire19(wire11), .clk(clk), .wire21(wire13), .y(wire48), .wire20(wire17), .wire22(wire15));
  assign wire50 = (~^$signed(wire17));
  assign wire51 = wire50[(3'h4):(1'h1)];
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire22;
  input wire signed [(5'h13):(1'h0)] wire21;
  input wire signed [(5'h12):(1'h0)] wire20;
  input wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  assign y = {wire47,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire24,
                 wire23,
                 reg46,
                 reg45,
                 reg34,
                 reg33,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire23 = (8'h9c);
  assign wire24 = ((wire23[(3'h7):(2'h2)] * wire22) ?
                      wire19 : $unsigned(wire21));
  always
    @(posedge clk) begin
      if (($signed(wire21[(5'h11):(3'h5)]) | ({wire23[(3'h6):(3'h6)]} > $signed({wire20[(3'h4):(3'h4)],
          wire24}))))
        begin
          reg25 <= {(wire19[(3'h5):(3'h4)] > wire19[(3'h4):(3'h4)]),
              wire22[(1'h0):(1'h0)]};
        end
      else
        begin
          reg25 <= (!wire20);
          if (wire20)
            begin
              reg26 <= ($unsigned({((8'hac) * $signed(reg25))}) && wire19[(3'h4):(2'h2)]);
              reg27 <= wire23;
              reg28 <= {reg27[(2'h3):(2'h3)],
                  {(^~wire21[(1'h0):(1'h0)]), (~(~&(^wire19)))}};
            end
          else
            begin
              reg26 <= ((&$signed((~^wire23[(1'h0):(1'h0)]))) ?
                  ((!(reg26[(3'h5):(1'h0)] >> wire20)) << ((reg25 ~^ ((8'hb7) ?
                      wire20 : reg26)) <= {$unsigned(wire21),
                      (reg25 == wire24)})) : {(!wire23)});
            end
        end
    end
  assign wire29 = ((({$signed(wire19), (reg27 * wire22)} ?
                              $signed((reg26 ? wire19 : (8'hae))) : (((8'hae) ?
                                      wire24 : wire23) ?
                                  (reg25 || reg26) : wire23)) ?
                          $signed({reg25, (wire23 && wire19)}) : wire20) ?
                      (((~^(wire19 > wire23)) >> $signed(reg27)) < wire21[(3'h7):(3'h6)]) : $signed((-(wire24 ?
                          $unsigned(wire21) : (8'h9e)))));
  assign wire30 = $unsigned($unsigned((reg28 ?
                      ($unsigned(wire21) ^~ wire29[(1'h0):(1'h0)]) : reg28[(1'h0):(1'h0)])));
  assign wire31 = reg27;
  assign wire32 = (((&$signed({wire31})) + (($signed(reg28) ?
                          wire30[(2'h3):(1'h1)] : (wire31 ? (7'h40) : reg27)) ?
                      {(wire21 - wire19)} : {{wire31, wire24},
                          (reg25 ?
                              (8'h9d) : reg28)})) < $signed(wire31[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      reg33 <= ((($unsigned((wire22 ?
              (7'h42) : reg28)) != $signed($signed(wire22))) & (reg25 || $signed(reg26))) ?
          $signed($signed((!$signed((8'h9d))))) : ((-{$unsigned(reg25)}) - $unsigned((|(wire29 ^ wire22)))));
      reg34 <= ((($unsigned($unsigned(wire24)) ^~ {wire24}) ?
              $unsigned((wire30[(3'h5):(1'h1)] ?
                  reg25 : $unsigned(reg33))) : (wire23[(1'h1):(1'h0)] > (^$unsigned(wire23)))) ?
          $signed($signed(((~^wire29) <<< (wire20 ?
              reg25 : wire30)))) : $unsigned($unsigned($unsigned({wire23,
              wire29}))));
    end
  assign wire35 = (wire24 | $signed($unsigned((wire23[(3'h7):(3'h5)] ?
                      (8'had) : ((8'hb1) >> (8'h9c))))));
  assign wire36 = ((wire21[(5'h13):(5'h11)] ?
                      wire19[(3'h5):(1'h0)] : {$unsigned((reg26 ?
                              reg33 : wire31)),
                          (~&(^wire29))}) ^ $unsigned(($unsigned($unsigned(wire32)) ?
                      $unsigned(wire23) : (!(&wire20)))));
  assign wire37 = ($signed((&$unsigned((reg34 ? wire31 : reg27)))) ?
                      (-wire21) : ((8'h9e) | (($unsigned(wire31) ?
                          (~&wire36) : $signed(wire19)) & {reg34})));
  assign wire38 = {$unsigned($unsigned((wire35[(2'h2):(1'h0)] ?
                          wire29[(1'h1):(1'h0)] : wire37[(4'h8):(3'h7)])))};
  assign wire39 = reg33;
  assign wire40 = wire31[(2'h2):(1'h0)];
  assign wire41 = reg27;
  assign wire42 = (+$unsigned($unsigned(wire20)));
  assign wire43 = wire20[(4'hd):(3'h4)];
  assign wire44 = {({wire43, $signed($unsigned((7'h41)))} > {wire32})};
  always
    @(posedge clk) begin
      reg45 <= $signed($unsigned($signed($signed(((8'ha6) ? wire35 : reg27)))));
      reg46 <= (^wire32[(5'h12):(4'hd)]);
    end
  assign wire47 = reg33[(4'hc):(2'h3)];
endmodule
