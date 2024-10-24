module top
#(parameter param48 = (~(-((~^{(7'h43), (8'h9e)}) ? (&{(8'ha9), (8'ha6)}) : {((8'ha1) ? (8'ha1) : (8'h9f))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire19;
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire22,
                 wire21,
                 wire19,
                 reg39,
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
                 (1'h0)};
  module4 #() modinst20 (wire19, clk, wire3, wire1, wire2, wire0);
  assign wire21 = (wire3[(4'h8):(3'h4)] ^ $signed($signed({$signed(wire2),
                      (wire3 - wire2)})));
  assign wire22 = (wire3 ?
                      (&wire2) : $signed((wire3[(2'h2):(2'h2)] ?
                          (~^((8'hbd) ? (8'ha6) : wire19)) : {$unsigned(wire19),
                              wire2[(4'hd):(3'h7)]})));
  always
    @(posedge clk) begin
      if ($unsigned(wire22[(1'h0):(1'h0)]))
        begin
          reg23 <= $signed(((wire0 == (~&$unsigned(wire1))) ?
              wire2[(2'h2):(1'h0)] : $unsigned(wire22)));
          if (({((!$signed(wire22)) <= $unsigned($signed(wire2)))} <<< (wire22 < (~^wire21[(2'h3):(2'h3)]))))
            begin
              reg24 <= wire0;
              reg25 <= $signed({reg24});
            end
          else
            begin
              reg24 <= $signed(((7'h40) ?
                  {((&reg25) < reg23[(1'h1):(1'h0)])} : (wire21[(3'h6):(3'h6)] ?
                      ((-wire19) || $signed(wire19)) : wire3)));
              reg25 <= $unsigned($signed($signed($unsigned((!wire21)))));
              reg26 <= wire22[(3'h7):(3'h5)];
            end
          if (reg23)
            begin
              reg27 <= $signed(reg24);
              reg28 <= $signed($signed(($signed((8'hb7)) ?
                  (reg27[(5'h11):(5'h11)] ?
                      ((8'hae) ?
                          (8'h9d) : wire2) : (reg24 < wire0)) : ($signed((8'had)) ?
                      wire0 : $unsigned(wire0)))));
              reg29 <= ((8'hab) ?
                  {$unsigned(((^wire1) - reg23)),
                      wire21[(3'h4):(1'h1)]} : reg27[(4'h8):(3'h7)]);
              reg30 <= $signed(((~$unsigned($unsigned(wire3))) ~^ $signed($signed((reg26 ^ (8'hbb))))));
              reg31 <= reg29;
            end
          else
            begin
              reg27 <= $unsigned({(wire19 ?
                      $signed($unsigned(wire0)) : {(wire0 ? reg27 : (8'hb1)),
                          (wire1 ? reg24 : reg24)}),
                  (~(reg23[(2'h3):(2'h2)] == reg29))});
              reg28 <= $unsigned(($unsigned((|$signed((8'hb1)))) ?
                  (~^reg24) : $unsigned(wire22[(1'h0):(1'h0)])));
            end
          reg32 <= (((reg28[(4'hf):(3'h6)] ^~ reg29) ?
                  (($signed(wire1) ? reg24 : $unsigned((8'hbc))) ?
                      ((wire21 ~^ reg23) ?
                          (reg30 ?
                              reg28 : wire21) : (wire0 <<< wire3)) : wire2[(4'h9):(3'h6)]) : ($unsigned($unsigned((7'h44))) ~^ ($unsigned(reg25) || $unsigned(wire19)))) ?
              reg23 : $unsigned($signed((~|(wire21 ? reg26 : reg25)))));
        end
      else
        begin
          if (wire3)
            begin
              reg23 <= reg28[(3'h5):(2'h3)];
              reg24 <= $signed($signed(({wire2[(4'h9):(3'h4)]} > $unsigned($unsigned(wire2)))));
              reg25 <= $signed(wire1[(2'h2):(2'h2)]);
            end
          else
            begin
              reg23 <= (((wire0[(3'h7):(2'h3)] <<< reg26[(3'h4):(2'h2)]) >= (~({(8'h9f),
                      reg26} ?
                  reg26[(4'h8):(3'h4)] : $unsigned(reg29)))) < $signed(wire3));
            end
          reg26 <= ({reg29} ? reg28 : reg26[(3'h5):(3'h5)]);
          reg27 <= wire1;
          reg28 <= reg25[(1'h1):(1'h1)];
          if ((|{{reg27[(2'h3):(2'h2)]}}))
            begin
              reg29 <= ((&($signed((reg28 * reg23)) >> wire21)) ?
                  reg31[(3'h7):(3'h5)] : reg30);
              reg30 <= $unsigned(reg29);
              reg31 <= wire0;
            end
          else
            begin
              reg29 <= {$signed({(^~(+reg30)), (~|$signed(reg27))}),
                  $unsigned(reg25[(1'h0):(1'h0)])};
              reg30 <= (-(reg27 ? (8'h9f) : {wire22[(1'h0):(1'h0)]}));
              reg31 <= (reg29 ?
                  (reg27 ?
                      $unsigned($unsigned(wire19[(1'h0):(1'h0)])) : $signed(($unsigned(reg29) + $signed(reg26)))) : reg31[(3'h7):(1'h1)]);
              reg32 <= (reg29 ?
                  $signed(wire3) : (|$signed(((wire3 ?
                      reg30 : wire21) - ((8'ha8) == reg23)))));
            end
        end
      if (wire2[(4'h9):(4'h8)])
        begin
          reg33 <= reg24;
          reg34 <= $signed((|reg24[(1'h0):(1'h0)]));
          reg35 <= reg34[(1'h0):(1'h0)];
          reg36 <= reg24[(4'h9):(2'h2)];
          reg37 <= $unsigned((reg27[(2'h2):(1'h0)] != ($signed({reg32}) << $unsigned((~reg27)))));
        end
      else
        begin
          reg33 <= wire1;
        end
      reg38 <= $unsigned((^~wire0));
      reg39 <= $unsigned(($signed((~^$unsigned((8'h9c)))) & reg37));
    end
  assign wire40 = {reg33};
  assign wire41 = {(wire2 == ($signed(wire19) ?
                          (((8'hb4) ? reg33 : wire0) ?
                              $unsigned(reg27) : $signed((8'hb5))) : $signed(reg31[(4'h9):(3'h5)]))),
                      {wire40[(2'h2):(2'h2)]}};
  assign wire42 = $signed($unsigned(reg24[(3'h6):(1'h0)]));
  assign wire43 = (reg31 ?
                      (-(^(|{(8'hb2)}))) : (reg36[(3'h4):(3'h4)] ?
                          $signed({reg30[(1'h1):(1'h0)],
                              reg39[(3'h5):(2'h2)]}) : $signed(($unsigned(wire42) ?
                              (wire42 == reg34) : (~&reg31)))));
  assign wire44 = (8'haf);
  assign wire45 = ($unsigned($signed(reg37[(4'hc):(4'hb)])) ?
                      (^~({$signed(reg35), (!(8'haf))} ?
                          (((8'had) || wire41) << (8'h9f)) : ($unsigned(wire42) != (8'hbd)))) : (|(^~$signed(wire22[(3'h4):(2'h3)]))));
  assign wire46 = wire41;
  assign wire47 = reg38;
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  input wire [(4'h9):(1'h0)] wire6;
  input wire [(4'hc):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire17;
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  assign y = {wire17,
                 reg18,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= $unsigned(((8'ha2) & wire6[(1'h1):(1'h1)]));
      if ((~$unsigned(($unsigned(wire6) + (wire5 > reg9[(3'h4):(3'h4)])))))
        begin
          reg10 <= wire5[(3'h5):(2'h2)];
          reg11 <= (^~$unsigned($unsigned((!wire6))));
        end
      else
        begin
          reg10 <= ($unsigned((wire6[(3'h4):(1'h0)] << (wire8 | $signed((8'h9f))))) * $signed(reg9[(1'h1):(1'h0)]));
        end
      reg12 <= wire6[(3'h4):(3'h4)];
      reg13 <= wire7;
      reg14 <= ({$signed(((wire5 < wire6) ^~ (wire7 ? (8'ha1) : (8'haa))))} ?
          wire8 : (((^(^~wire6)) != (+wire6)) ?
              $unsigned($unsigned(wire5[(3'h7):(3'h4)])) : ($signed((wire8 ?
                      (8'hb3) : reg9)) ?
                  ($unsigned(wire6) && (reg9 ?
                      wire7 : reg10)) : $unsigned((wire6 ? reg10 : reg13)))));
    end
  always
    @(posedge clk) begin
      reg15 <= $unsigned({reg9[(2'h2):(2'h2)], (|{((8'ha6) <<< reg13)})});
      reg16 <= $signed(((wire7 & (-{reg15})) ?
          reg11[(4'h9):(4'h8)] : (reg14 - {wire7[(2'h3):(1'h1)],
              wire7[(3'h7):(1'h1)]})));
    end
  assign wire17 = (|reg12[(4'hc):(3'h7)]);
  always
    @(posedge clk) begin
      if (wire17)
        begin
          reg18 <= wire5;
        end
      else
        begin
          reg18 <= (^~reg18[(1'h0):(1'h0)]);
        end
    end
endmodule
