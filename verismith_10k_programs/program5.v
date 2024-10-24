module top
#(parameter param52 = ((^(8'hb1)) ? {(~&{((8'hab) <= (8'hb8)), (~|(8'ha7))}), ({(8'hbd)} > {((8'hae) ? (8'ha8) : (8'h9d))})} : ({{((8'hab) <<< (8'hbd)), ((8'h9e) & (8'hbb))}, ((~&(8'hba)) > (|(8'ha0)))} && (~&(~&(^(8'hb0)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  assign y = {wire50, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ((((!(wire0 & wire3)) ?
                         $signed($signed(wire2)) : (~^(wire2 ?
                             wire2 : (8'had)))) - ({(wire3 >> (8'hab))} || $unsigned(wire1[(1'h1):(1'h1)]))) ?
                     (($unsigned(wire2) & wire1) ?
                         wire2[(2'h3):(2'h3)] : $unsigned(wire0)) : (+$signed(wire1[(1'h1):(1'h1)])));
  assign wire5 = $signed((&{(wire2 ?
                         $unsigned(wire1) : (wire1 ? wire2 : wire4)),
                     $unsigned(wire0)}));
  assign wire6 = ((8'h9e) <<< wire3[(3'h5):(1'h0)]);
  module7 #() modinst51 (.clk(clk), .wire9(wire5), .wire10(wire3), .wire11(wire2), .y(wire50), .wire8(wire0));
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire18,
                 wire17,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg16,
                 (1'h0)};
  assign wire12 = (wire9[(1'h0):(1'h0)] > (((&wire11) ?
                      $signed((wire9 ? (8'h9d) : wire9)) : (^~(wire8 ?
                          wire9 : wire9))) || (~|wire10[(4'hb):(4'h9)])));
  assign wire13 = ((8'hbc) ? wire10 : wire9[(3'h7):(2'h3)]);
  assign wire14 = wire13;
  assign wire15 = (($unsigned((wire11 != {wire13, wire8})) ?
                          wire8[(4'h8):(2'h2)] : wire14[(3'h5):(3'h5)]) ?
                      wire8[(4'hb):(3'h4)] : (-$unsigned(((~|wire13) ~^ $signed(wire9)))));
  always
    @(posedge clk) begin
      reg16 <= $unsigned(wire11);
    end
  assign wire17 = {({{(wire15 ? (8'hb6) : wire15)},
                          wire10[(4'ha):(3'h7)]} < reg16)};
  assign wire18 = ((wire12 > ((wire15[(3'h7):(3'h4)] ?
                      {wire15} : $signed(wire10)) ^~ {reg16})) != (wire13[(3'h6):(1'h0)] + wire12[(4'h8):(2'h3)]));
  module19 #() modinst45 (wire44, clk, wire15, wire14, wire13, wire11);
  assign wire46 = ((~&$unsigned((wire10 | wire15[(3'h4):(1'h1)]))) ^~ $unsigned(($signed((wire17 ?
                          wire15 : wire8)) ?
                      $unsigned((!(8'ha8))) : ($signed(wire10) | (wire11 + reg16)))));
  assign wire47 = (^$signed($unsigned($signed((wire9 ? reg16 : reg16)))));
  assign wire48 = wire13;
  assign wire49 = wire12;
endmodule

module module19  (y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire23;
  input wire [(3'h7):(1'h0)] wire22;
  input wire signed [(4'hd):(1'h0)] wire21;
  input wire [(5'h12):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire24;
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire24,
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
                 (1'h0)};
  assign wire24 = (wire22 ?
                      $unsigned((8'ha8)) : ($unsigned(wire23) ?
                          $unsigned({$unsigned(wire20)}) : {wire22[(2'h2):(1'h0)]}));
  always
    @(posedge clk) begin
      reg25 <= wire22;
      if ({(8'hb6)})
        begin
          if ((~&wire23[(4'hd):(3'h7)]))
            begin
              reg26 <= wire23;
              reg27 <= wire22;
              reg28 <= $signed((8'hb0));
            end
          else
            begin
              reg26 <= $signed({((^(reg25 * reg28)) != ({reg27, reg27} ?
                      $signed(wire20) : (^reg26)))});
              reg27 <= $unsigned((!$unsigned(wire22)));
              reg28 <= (wire23 ?
                  ($signed($signed({wire21, reg25})) ?
                      ($signed((reg25 ?
                          (8'hbd) : reg28)) >= wire20) : $unsigned(((-wire23) * wire23[(3'h7):(3'h6)]))) : wire24);
              reg29 <= wire21[(4'ha):(3'h5)];
              reg30 <= $signed((wire24[(3'h5):(3'h5)] <= ($signed($signed(wire22)) ?
                  $unsigned(wire22[(3'h7):(3'h5)]) : (wire23 ?
                      $unsigned(reg27) : wire22))));
            end
          if ((reg26[(1'h1):(1'h1)] ?
              wire24[(1'h0):(1'h0)] : (wire20[(4'hf):(4'ha)] ?
                  (^wire23) : $signed(wire21))))
            begin
              reg31 <= $unsigned($signed(wire21[(3'h7):(1'h1)]));
              reg32 <= $unsigned($unsigned(reg30[(4'hd):(4'hb)]));
            end
          else
            begin
              reg31 <= reg29;
              reg32 <= $signed((!$signed(reg28)));
              reg33 <= $signed((|(|$signed((reg27 ? wire23 : reg30)))));
              reg34 <= ((($signed((~^(7'h44))) + wire24) || $unsigned(($unsigned(wire23) >>> (!wire24)))) ?
                  $signed($unsigned(((reg27 ?
                      (8'hb4) : (8'ha4)) << (~^reg29)))) : (+($signed($unsigned((8'ha4))) ?
                      ({(7'h43),
                          wire20} + $unsigned(reg26)) : reg31[(3'h4):(3'h4)])));
            end
          if (reg28)
            begin
              reg35 <= $unsigned({{reg25[(1'h1):(1'h1)],
                      reg28[(4'hf):(4'he)]}});
              reg36 <= ((((8'hbd) ? (8'hba) : (^$unsigned(reg30))) << ((reg28 ?
                  $signed(wire22) : (~&wire23)) ~^ {wire22[(3'h4):(1'h1)],
                  reg34[(1'h1):(1'h1)]})) | wire21[(2'h3):(2'h2)]);
            end
          else
            begin
              reg35 <= ($unsigned(wire22) != reg35[(4'hb):(3'h4)]);
              reg36 <= {{(~|(~&wire21))},
                  ($signed((&(|(8'hb2)))) - $unsigned(($signed(reg30) ?
                      (reg27 + wire24) : reg33)))};
            end
          reg37 <= $signed(reg33[(1'h1):(1'h1)]);
        end
      else
        begin
          if (wire24[(1'h1):(1'h0)])
            begin
              reg26 <= (&((|(&(reg37 ^~ (7'h44)))) ?
                  ((~$unsigned(wire23)) ?
                      (|$signed(reg30)) : (~|wire21[(4'hd):(3'h6)])) : ((+(reg25 ?
                      wire20 : reg33)) ^~ $unsigned(wire20[(2'h2):(1'h0)]))));
              reg27 <= wire21[(3'h4):(1'h0)];
            end
          else
            begin
              reg26 <= wire22;
              reg27 <= $signed(wire20);
              reg28 <= reg31;
              reg29 <= $unsigned(($unsigned($unsigned($unsigned(reg25))) <<< (((wire23 ?
                      reg28 : reg37) + reg28[(4'he):(1'h0)]) ?
                  {reg26[(2'h2):(2'h2)], (~^(8'ha8))} : reg34[(1'h0):(1'h0)])));
              reg30 <= ($signed((|$unsigned(((7'h44) >> (8'hae))))) ?
                  (($signed($unsigned((8'hb1))) == reg26[(1'h1):(1'h1)]) <<< ((^~$unsigned(reg33)) & wire20[(4'hf):(4'hb)])) : $signed(($unsigned((~|reg35)) ?
                      reg26[(1'h1):(1'h1)] : (((7'h42) ? reg33 : (8'haa)) ?
                          $signed(wire22) : {wire22}))));
            end
        end
    end
  assign wire38 = (^$unsigned($unsigned($signed(((8'hbb) << reg31)))));
  assign wire39 = ((~|wire22[(3'h6):(1'h0)]) ?
                      wire20[(2'h3):(1'h1)] : reg26[(2'h2):(1'h1)]);
  assign wire40 = reg30;
  assign wire41 = $unsigned(wire23[(2'h3):(2'h3)]);
  assign wire42 = {(wire41[(3'h4):(1'h1)] <= $unsigned(reg27)),
                      {$unsigned((~$signed(reg32)))}};
  assign wire43 = wire20;
endmodule
