module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  assign y = {wire46,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire5 = (8'ha0);
  always
    @(posedge clk) begin
      reg6 <= $unsigned(($signed((^(^wire0))) ? wire4 : wire1));
      reg7 <= wire1[(2'h3):(2'h3)];
      if (reg6)
        begin
          reg8 <= (reg7 ~^ wire3);
          if ((wire0 ?
              $unsigned(wire3) : $signed((reg6[(3'h6):(3'h5)] ?
                  ($signed(reg7) ? $unsigned(reg6) : (~^wire4)) : (7'h41)))))
            begin
              reg9 <= {wire0[(2'h3):(1'h1)], $unsigned(reg6[(4'hd):(4'h9)])};
              reg10 <= $signed($signed($signed($unsigned((wire2 ?
                  reg8 : reg9)))));
              reg11 <= ({({{reg8}, wire0[(2'h2):(1'h0)]} ?
                          (!wire5[(2'h3):(2'h3)]) : $unsigned($unsigned(wire3)))} ?
                  {(((wire1 ?
                          reg6 : reg7) << wire5[(4'hc):(2'h2)]) >= ((|wire5) ?
                          (^~reg10) : (!reg8)))} : reg8[(1'h1):(1'h1)]);
              reg12 <= {$signed(wire1)};
            end
          else
            begin
              reg9 <= ({reg6[(3'h7):(1'h0)],
                  reg7} && $signed((($unsigned(reg11) ?
                  (wire2 || wire5) : $unsigned(wire0)) <<< (((8'h9c) & wire3) ?
                  {wire3} : {wire3}))));
              reg10 <= reg10[(1'h0):(1'h0)];
              reg11 <= ($signed(wire1) + reg9);
            end
          reg13 <= $unsigned((~(reg7 ?
              (-$unsigned(wire1)) : ($unsigned(reg11) ?
                  $signed(wire4) : $unsigned(reg11)))));
          if ((^reg10[(4'h8):(1'h0)]))
            begin
              reg14 <= reg11;
              reg15 <= $unsigned($signed(reg7));
              reg16 <= wire0;
              reg17 <= ($signed(($signed($unsigned(reg7)) > reg6)) >>> ((8'hbb) || {reg6[(3'h7):(2'h3)]}));
            end
          else
            begin
              reg14 <= (~|$signed((-wire0)));
              reg15 <= $unsigned($unsigned($unsigned($unsigned($unsigned(reg6)))));
              reg16 <= $unsigned($signed($unsigned($signed(reg8[(4'h8):(4'h8)]))));
            end
          reg18 <= (~$unsigned(wire5));
        end
      else
        begin
          reg8 <= (8'ha5);
          reg9 <= $signed($signed(reg14[(4'hb):(2'h2)]));
          reg10 <= $signed($unsigned($unsigned(((wire1 ? wire3 : wire4) ?
              (!reg7) : $signed(wire4)))));
        end
      if (($unsigned(reg9) + {wire5[(3'h4):(2'h2)]}))
        begin
          reg19 <= (^$unsigned(reg9));
        end
      else
        begin
          reg19 <= reg15[(4'hc):(4'h9)];
          reg20 <= (($signed((~|{wire0,
                  wire0})) && ((~reg7[(4'hc):(3'h7)]) * $unsigned($unsigned(reg14)))) ?
              reg13 : reg15[(5'h11):(3'h5)]);
          if ($unsigned((wire5[(3'h4):(1'h0)] ?
              ($signed(reg14[(4'hd):(3'h5)]) ?
                  reg6[(1'h1):(1'h0)] : $unsigned(reg12)) : (+reg18))))
            begin
              reg21 <= {(wire5 > {(-$signed(wire0)),
                      ((reg16 ? reg19 : (8'ha1)) ?
                          $signed(wire4) : $signed(reg8))}),
                  (reg6 ? $signed((reg19 * (&reg18))) : $signed(reg19))};
            end
          else
            begin
              reg21 <= reg15[(3'h6):(3'h6)];
              reg22 <= reg15[(4'he):(4'hb)];
              reg23 <= ((($signed($unsigned(reg11)) ?
                      reg16 : reg22[(2'h3):(1'h1)]) ?
                  (|(^~((7'h40) ? wire4 : reg16))) : ({((7'h42) ?
                          (8'h9f) : reg7),
                      (^~reg15)} & ((reg14 ?
                      (8'hb7) : wire1) << reg21))) ^ $signed((reg13 ?
                  {$unsigned(wire5)} : ((reg14 || reg6) ?
                      wire4 : (reg18 + reg11)))));
              reg24 <= reg15;
              reg25 <= $unsigned({reg8});
            end
          reg26 <= (~^{(^~reg7),
              (((reg17 ? reg22 : wire4) || (wire2 << (8'h9c))) ^~ reg8)});
        end
    end
  assign wire27 = $unsigned($unsigned($signed(reg8)));
  assign wire28 = $unsigned((!($signed({(8'hae), reg14}) ?
                      ({reg21} >>> reg24[(4'ha):(4'h8)]) : $signed((^~reg7)))));
  assign wire29 = ($unsigned(wire27[(2'h2):(1'h1)]) ?
                      $signed(reg13[(4'h8):(3'h5)]) : $signed((reg6[(3'h6):(1'h1)] | {(-reg13)})));
  assign wire30 = reg7[(1'h0):(1'h0)];
  assign wire31 = $unsigned({reg19[(4'hb):(1'h1)], reg8});
  assign wire32 = $signed((~^($unsigned($signed(reg7)) ?
                      ((reg25 - reg24) ?
                          reg16[(3'h4):(3'h4)] : $signed(reg12)) : reg24[(1'h0):(1'h0)])));
  module33 #() modinst47 (.wire37(reg25), .wire35(wire0), .wire38(wire4), .y(wire46), .wire34(wire28), .clk(clk), .wire36(wire32));
endmodule

module module33  (y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire38;
  input wire signed [(3'h5):(1'h0)] wire37;
  input wire signed [(2'h3):(1'h0)] wire36;
  input wire [(5'h12):(1'h0)] wire35;
  input wire signed [(5'h13):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  assign y = {wire45, wire44, wire43, wire42, wire41, wire40, wire39, (1'h0)};
  assign wire39 = (&((8'hbb) && (wire34 >> (8'hb4))));
  assign wire40 = $signed(wire35[(4'ha):(3'h5)]);
  assign wire41 = ((wire40 != $signed(((~(8'hba)) ^ {wire34,
                      wire39}))) - (~&wire37[(2'h3):(1'h1)]));
  assign wire42 = {($signed(wire41[(5'h11):(4'h9)]) == (((wire40 >>> (8'ha3)) != $signed(wire34)) - (wire41 <= $signed(wire34)))),
                      (&wire40[(1'h0):(1'h0)])};
  assign wire43 = {((^(~wire38[(3'h4):(3'h4)])) ?
                          $signed($signed((wire34 ?
                              (8'h9c) : wire41))) : (^$signed((wire38 ?
                              wire41 : wire41)))),
                      (~|(wire42[(4'h8):(1'h0)] ^~ (8'ha3)))};
  assign wire44 = $signed((^~$signed(wire39)));
  assign wire45 = wire39;
endmodule
