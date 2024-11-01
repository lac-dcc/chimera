module top
#(parameter param36 = (~^(((~{(8'hab)}) - (|(~|(8'h9d)))) || (~&(!{(7'h40)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  assign y = {wire35,
                 wire23,
                 wire22,
                 wire21,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire10,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg20,
                 reg13,
                 reg12,
                 reg11,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = (wire0[(2'h2):(1'h1)] < (8'ha1));
  assign wire5 = wire1[(1'h1):(1'h0)];
  assign wire6 = (8'hb9);
  assign wire7 = {{wire0[(1'h1):(1'h0)], wire5[(5'h14):(4'h9)]},
                     ($unsigned(wire3[(2'h3):(2'h3)]) ? {(8'hb5)} : wire0)};
  always
    @(posedge clk) begin
      reg8 <= wire6;
      reg9 <= $unsigned(wire5[(4'he):(2'h3)]);
    end
  assign wire10 = wire5[(4'hb):(4'h8)];
  always
    @(posedge clk) begin
      reg11 <= $unsigned((($signed(reg9[(3'h5):(3'h4)]) >> ($unsigned(wire1) == (~&wire2))) ?
          {($signed(wire10) ? (wire0 ? wire10 : (8'hbf)) : $signed(wire6)),
              ($unsigned((8'hbb)) ?
                  {wire2} : (wire10 ^ wire5))} : {wire1[(3'h5):(2'h2)]}));
      reg12 <= $unsigned($signed(wire10[(1'h0):(1'h0)]));
      reg13 <= {{(^wire2),
              ($unsigned((wire1 <= wire7)) ^~ ({wire4} <= (&wire3)))},
          {$signed({wire6, (-wire6)}), $signed({(reg9 != reg12)})}};
    end
  assign wire14 = wire0[(1'h0):(1'h0)];
  assign wire15 = {$unsigned(((&(wire14 >>> wire10)) ?
                          wire4[(1'h0):(1'h0)] : {wire4[(2'h2):(1'h1)],
                              $signed((8'hb5))}))};
  assign wire16 = wire6[(1'h0):(1'h0)];
  assign wire17 = $signed($signed((wire1[(1'h0):(1'h0)] ?
                      $unsigned($unsigned((8'ha4))) : {{wire1, reg8}})));
  assign wire18 = ((&wire17[(3'h4):(2'h3)]) ?
                      {wire3,
                          ((~(8'hb7)) ?
                              $signed($signed(wire4)) : wire10)} : reg11);
  assign wire19 = (8'ha0);
  always
    @(posedge clk) begin
      reg20 <= reg13[(5'h11):(2'h2)];
    end
  assign wire21 = $signed({$signed((8'had))});
  assign wire22 = ((&(($unsigned((8'hb3)) ?
                      wire16 : wire18) >> ((~&reg13) > $signed(reg8)))) != $unsigned(wire19[(2'h2):(1'h0)]));
  assign wire23 = wire0[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg24 <= {(~(^wire15)), (($unsigned(wire19) ^~ wire23) < reg12)};
      reg25 <= wire18;
      if (reg9[(1'h0):(1'h0)])
        begin
          reg26 <= wire7;
        end
      else
        begin
          if ($unsigned((!wire22[(2'h3):(2'h2)])))
            begin
              reg26 <= reg13[(3'h7):(2'h2)];
              reg27 <= wire21[(2'h3):(2'h2)];
              reg28 <= $signed((8'h9f));
            end
          else
            begin
              reg26 <= (reg9 != (+reg11));
              reg27 <= ((reg9 - $signed($signed(wire7))) ?
                  (~|(^(reg13 == (reg8 & wire17)))) : (wire7[(3'h6):(3'h5)] > reg28));
              reg28 <= $unsigned({$unsigned((|$signed(reg28))), wire3});
              reg29 <= $unsigned((!((^(reg26 > reg8)) ~^ {$signed(wire22)})));
            end
          reg30 <= wire18[(3'h4):(2'h2)];
          if ($unsigned({$signed(reg24)}))
            begin
              reg31 <= reg12;
              reg32 <= (^~(-((((8'hb8) + wire5) ?
                  (~^(8'haf)) : $unsigned(wire22)) ~^ $unsigned((reg28 << reg9)))));
              reg33 <= reg8[(2'h2):(2'h2)];
              reg34 <= $signed((({wire2[(3'h4):(3'h4)]} ?
                      (|(wire5 ? wire10 : wire14)) : reg29[(3'h5):(2'h2)]) ?
                  reg20[(1'h1):(1'h1)] : $signed(reg13[(4'h9):(4'h9)])));
            end
          else
            begin
              reg31 <= (((((reg11 * (8'haf)) || $signed(wire0)) ?
                      (((8'haf) ?
                          wire0 : wire2) || wire5[(1'h0):(1'h0)]) : wire3[(5'h12):(3'h6)]) ^ $signed({wire16})) ?
                  {$signed(wire19)} : ((|(8'ha1)) << wire22));
              reg32 <= reg31;
              reg33 <= (+{wire16[(3'h7):(3'h7)], $unsigned(reg29)});
            end
        end
    end
  assign wire35 = ($signed((($unsigned(reg27) ?
                          $unsigned(reg31) : (^reg24)) ~^ ($unsigned(reg27) < (+wire23)))) ?
                      (8'ha1) : (&(~&({reg8, wire0} != (reg8 > wire2)))));
endmodule
