module top
#(parameter param56 = (|({(((8'hb8) ? (8'ha6) : (8'hbd)) ? ((8'ha3) ^~ (8'hb8)) : ((7'h43) ? (8'hbe) : (7'h44)))} <= (~^(((8'hb4) ? (8'hbd) : (8'hb7)) || {(8'hb9)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  assign y = {wire55,
                 wire53,
                 wire14,
                 wire13,
                 wire12,
                 wire5,
                 wire4,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  assign wire4 = (wire2 >> (~^(($unsigned(wire1) <<< {(7'h42), wire3}) ?
                     ((wire2 * wire0) << (wire1 ? wire3 : wire2)) : ({wire1,
                             wire1} ?
                         $unsigned(wire3) : wire2[(3'h7):(2'h3)]))));
  assign wire5 = $signed(wire4);
  always
    @(posedge clk) begin
      reg6 <= wire3;
      reg7 <= wire3[(1'h0):(1'h0)];
      if ($unsigned(wire1[(4'h8):(3'h6)]))
        begin
          reg8 <= {$signed((~|$unsigned((reg7 > reg6))))};
          reg9 <= wire0[(2'h2):(1'h1)];
          reg10 <= (($unsigned((&wire2)) ?
                  {$signed((wire5 + (8'hb4)))} : (reg8[(1'h0):(1'h0)] * reg8)) ?
              ($signed(((wire5 ? wire4 : wire1) <= wire0)) ?
                  (~^$unsigned(wire3)) : ((^~$signed((8'hb0))) ^~ (wire5 ?
                      (^reg8) : $signed(wire2)))) : (~&$signed((~|reg6))));
        end
      else
        begin
          reg8 <= $signed(wire2);
          reg9 <= $unsigned((^wire5));
          reg10 <= $signed((({(8'hb0)} ^ $unsigned((wire5 - wire2))) ?
              (((reg10 ? wire1 : wire2) ? wire1 : (reg9 ? (8'hb9) : (8'ha1))) ?
                  ((reg8 ? wire1 : wire2) ^ $signed((8'hb1))) : (reg8 ?
                      $signed(wire2) : ((8'hb0) ?
                          wire1 : reg8))) : $signed(reg10[(4'hb):(2'h2)])));
          reg11 <= $signed($unsigned($signed({(reg7 < wire2)})));
        end
    end
  assign wire12 = ((wire1[(3'h6):(2'h3)] ?
                      $signed(wire0[(2'h3):(1'h0)]) : $signed(($unsigned(wire1) ?
                          $unsigned(wire3) : (reg6 ?
                              (7'h40) : reg8)))) > wire0);
  assign wire13 = ($unsigned((~$signed($unsigned(wire0)))) ?
                      ((reg10 != (~wire3)) != (8'hbf)) : ((8'hac) ?
                          wire5 : (reg7[(3'h6):(1'h0)] > wire4)));
  assign wire14 = $unsigned(wire0[(1'h0):(1'h0)]);
  module15 #() modinst54 (.wire20(reg8), .wire17(reg6), .wire16(wire3), .wire19(wire5), .wire18(reg7), .clk(clk), .y(wire53));
  assign wire55 = ($unsigned({($signed(wire0) ?
                          (wire2 > wire12) : $unsigned(reg10))}) ^~ wire13[(2'h3):(1'h0)]);
endmodule

module module15
#(parameter param52 = (8'h9f))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire20;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire [(3'h5):(1'h0)] wire18;
  input wire [(4'h8):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  assign y = {wire50,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = wire16;
  assign wire22 = (wire21 * (wire16 > $signed(((wire16 ? wire17 : wire17) ?
                      (~|(8'ha0)) : ((8'hb5) | wire18)))));
  assign wire23 = wire20[(1'h0):(1'h0)];
  assign wire24 = wire20[(1'h1):(1'h0)];
  assign wire25 = (8'h9d);
  assign wire26 = {($unsigned((^wire22[(4'hb):(3'h5)])) ^~ ((8'hb9) ?
                          $signed($signed((8'h9d))) : $unsigned($unsigned(wire21)))),
                      wire22[(4'h9):(2'h2)]};
  assign wire27 = $unsigned(wire17[(1'h0):(1'h0)]);
  module28 #() modinst51 (.wire30(wire16), .wire31(wire17), .clk(clk), .y(wire50), .wire29(wire23), .wire32(wire25));
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire32;
  input wire signed [(4'h8):(1'h0)] wire31;
  input wire signed [(4'hb):(1'h0)] wire30;
  input wire signed [(2'h3):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire33;
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire37,
                 wire36,
                 wire33,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire33 = ($unsigned({$unsigned((|(8'hb6))), wire32}) << wire31);
  always
    @(posedge clk) begin
      reg34 <= $signed((8'h9d));
      reg35 <= (($unsigned($signed((~wire33))) - (+$signed((reg34 << reg34)))) ?
          (wire29[(2'h3):(1'h0)] ?
              $signed(wire31[(3'h4):(1'h0)]) : (&$signed(reg34[(2'h3):(1'h1)]))) : (+{wire29[(2'h3):(1'h0)],
              (wire30[(2'h3):(2'h2)] ? (^wire33) : (~|wire30))}));
    end
  assign wire36 = {$signed((~^((~^wire29) ? (~wire29) : wire32)))};
  assign wire37 = {$unsigned((((&wire32) || wire32[(3'h4):(1'h0)]) == (~|(wire29 > wire31)))),
                      $signed($unsigned(wire36[(4'h8):(3'h5)]))};
  always
    @(posedge clk) begin
      reg38 <= wire33[(1'h0):(1'h0)];
      if ($signed(reg34))
        begin
          reg39 <= $signed((&($signed(reg38[(1'h1):(1'h1)]) ^~ reg35)));
          reg40 <= (|$signed((wire37 ?
              (((8'ha9) ? wire30 : wire32) ?
                  $unsigned(wire30) : (reg35 ? wire33 : reg35)) : ((reg38 ?
                  (8'hb1) : reg39) <= {wire29}))));
        end
      else
        begin
          reg39 <= (wire29[(1'h1):(1'h1)] ? (+reg34) : $unsigned(wire37));
        end
      if (wire29)
        begin
          if ($signed({(^{$signed(wire36), wire32}),
              (reg39[(2'h3):(1'h1)] ?
                  reg34[(4'hc):(1'h1)] : wire33[(5'h11):(4'hf)])}))
            begin
              reg41 <= ((($signed({wire29}) || $signed(wire36)) - (!$signed($signed(reg38)))) == wire33[(4'hd):(3'h6)]);
            end
          else
            begin
              reg41 <= (&$unsigned($unsigned({{reg35, wire33},
                  (wire33 << reg35)})));
            end
          reg42 <= reg38[(4'h9):(1'h0)];
        end
      else
        begin
          if ((|reg40))
            begin
              reg41 <= $signed((!$signed((((8'hb0) ? reg38 : reg34) ?
                  reg42 : reg35))));
              reg42 <= wire31[(4'h8):(3'h7)];
              reg43 <= ((^(((reg41 - wire36) ?
                      (-wire33) : (wire31 ?
                          reg41 : wire31)) <<< ($signed(wire36) ^~ $unsigned(wire29)))) ?
                  ($unsigned($unsigned(reg41[(3'h4):(3'h4)])) ?
                      ((reg39[(1'h0):(1'h0)] ?
                          $unsigned(wire33) : (wire33 ?
                              reg38 : wire30)) ^~ $signed(reg42[(3'h4):(1'h0)])) : {reg35[(3'h5):(1'h0)],
                          reg40}) : ($unsigned(($signed(reg40) ?
                          (wire31 ? (7'h43) : wire33) : $unsigned(wire37))) ?
                      wire33 : ($unsigned((reg40 <= wire36)) ?
                          wire29[(2'h3):(1'h1)] : ((wire36 ?
                              (8'hb9) : reg41) > (reg40 ? wire37 : reg35)))));
              reg44 <= $signed(($signed(((reg41 ? reg38 : wire29) == ((7'h41) ?
                      reg38 : (8'haa)))) ?
                  wire31[(3'h5):(3'h4)] : (wire32 ?
                      wire29[(2'h3):(1'h1)] : reg34)));
              reg45 <= (8'hbf);
            end
          else
            begin
              reg41 <= $unsigned(reg39[(1'h0):(1'h0)]);
              reg42 <= ($signed(reg38[(4'hc):(2'h2)]) & wire29);
              reg43 <= reg40;
              reg44 <= $signed($unsigned(reg38));
            end
          reg46 <= wire36;
        end
      reg47 <= (|(((reg43 >> $unsigned(reg34)) ?
              (reg35 >> reg42[(3'h5):(2'h2)]) : ($unsigned(wire30) << ((8'hae) ?
                  reg42 : wire30))) ?
          $signed($signed((reg39 >= wire33))) : ({reg43[(2'h2):(1'h0)]} ?
              (reg44[(3'h5):(2'h2)] & (reg41 ?
                  wire33 : reg38)) : (wire36[(2'h2):(2'h2)] ?
                  wire29 : $unsigned((8'ha8))))));
    end
  assign wire48 = reg47[(4'hf):(4'ha)];
  assign wire49 = (wire30[(2'h2):(2'h2)] < $unsigned(reg38[(4'h8):(3'h4)]));
endmodule
