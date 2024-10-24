module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire17,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = (|{wire1[(3'h5):(1'h0)],
                     ((&wire0[(1'h0):(1'h0)]) ?
                         {(~^(8'ha3)), $signed(wire3)} : (~wire3))});
  assign wire5 = {wire3, wire2[(3'h4):(2'h3)]};
  assign wire6 = wire2;
  assign wire7 = $signed((wire6 ^ wire3[(2'h2):(1'h1)]));
  assign wire8 = $signed($unsigned(wire6[(4'ha):(4'h9)]));
  assign wire9 = $signed(wire3);
  assign wire10 = (!$signed(wire3[(3'h4):(2'h2)]));
  always
    @(posedge clk) begin
      if ((^~((^wire3) ? (!wire10) : $signed((+{wire2})))))
        begin
          reg11 <= (^~wire0);
        end
      else
        begin
          reg11 <= ((wire5[(3'h5):(3'h4)] ?
                  (wire9[(1'h1):(1'h0)] || ($signed((8'hbc)) == (reg11 ?
                      wire1 : wire5))) : (&wire10[(2'h2):(2'h2)])) ?
              ($unsigned((~|{wire2})) ?
                  wire4[(2'h3):(2'h3)] : (reg11[(1'h0):(1'h0)] < (8'hb8))) : wire9[(3'h4):(1'h0)]);
          reg12 <= wire3[(1'h1):(1'h0)];
          reg13 <= (wire8[(3'h6):(2'h3)] >= wire5);
        end
      reg14 <= ((+wire6[(5'h14):(4'h9)]) ? reg12 : wire4[(2'h3):(2'h2)]);
      reg15 <= $unsigned({reg11[(1'h1):(1'h1)], $unsigned(wire1)});
      reg16 <= (&((((wire0 ? wire2 : reg14) ? {reg15} : $unsigned(reg13)) ?
              reg12 : (~^$unsigned(reg14))) ?
          wire2[(3'h6):(2'h3)] : reg15[(4'ha):(3'h6)]));
    end
  assign wire17 = $unsigned($signed(reg12[(5'h11):(3'h6)]));
  always
    @(posedge clk) begin
      if (reg14[(4'ha):(3'h4)])
        begin
          reg18 <= (($signed(($unsigned(wire2) >= {wire2})) ~^ $unsigned(($unsigned(reg12) != (wire10 <<< wire8)))) << wire5);
          reg19 <= $unsigned($signed({wire5}));
          reg20 <= reg18;
          if ((((-($unsigned(wire6) || (wire10 ?
              reg13 : wire1))) == (((^wire8) ?
                  $signed(wire2) : reg15[(1'h1):(1'h0)]) ?
              $signed($unsigned(wire2)) : {$unsigned(reg14),
                  $unsigned(reg19)})) - $unsigned((|wire9[(3'h4):(1'h0)]))))
            begin
              reg21 <= {$unsigned(wire9[(3'h4):(1'h1)]),
                  (~|(wire7[(1'h1):(1'h1)] ?
                      ((~&reg19) ?
                          $unsigned(wire2) : $unsigned(reg14)) : reg13))};
              reg22 <= $unsigned((wire1 ?
                  (~&reg20[(1'h0):(1'h0)]) : $signed($signed(reg12[(4'h9):(4'h9)]))));
              reg23 <= (~|{wire2[(3'h6):(3'h4)],
                  (+((reg13 ? reg19 : reg21) ?
                      ((8'had) && wire6) : {wire6, (8'hbb)}))});
            end
          else
            begin
              reg21 <= $signed(((^(~(reg21 - wire9))) ? wire4 : wire6));
              reg22 <= $unsigned({wire9});
              reg23 <= (($signed(($unsigned(wire10) ?
                          $unsigned(wire7) : (reg15 <= reg11))) ?
                      reg18[(1'h0):(1'h0)] : ($unsigned((wire2 ?
                          wire6 : wire7)) && $signed((reg16 ?
                          reg14 : wire4)))) ?
                  (!reg13) : ((~$unsigned(reg13[(2'h3):(2'h2)])) << reg14[(2'h2):(1'h1)]));
              reg24 <= wire6;
              reg25 <= (($signed(reg22) == $unsigned(reg18)) ?
                  {$signed(($signed(reg20) >= {reg20,
                          wire9}))} : {$unsigned(((-reg13) ?
                          wire8[(4'hd):(4'hb)] : reg19[(4'hc):(4'ha)])),
                      $unsigned(reg23[(1'h0):(1'h0)])});
            end
        end
      else
        begin
          reg18 <= {$signed((reg11 ^ ((reg11 + (7'h41)) ?
                  (reg22 ? (8'hbd) : wire10) : (reg12 ? (8'hb7) : reg22))))};
          reg19 <= $signed((wire7[(1'h0):(1'h0)] >>> (($signed(reg14) ?
                  (+wire7) : wire1) ?
              wire6 : wire4)));
          reg20 <= $unsigned(wire10[(1'h1):(1'h1)]);
          reg21 <= (~^$unsigned(reg23[(2'h2):(1'h1)]));
        end
      reg26 <= reg11[(3'h4):(2'h2)];
    end
  assign wire27 = (reg20 + wire6);
  assign wire28 = $signed((({$signed(reg11),
                      (^~wire8)} - wire10[(3'h7):(3'h5)]) ~^ $unsigned(((~^wire0) ?
                      $signed((8'hbf)) : {wire0, wire27}))));
  assign wire29 = (^~(~&($unsigned($signed((8'ha5))) ?
                      (!$unsigned(reg15)) : (^~(8'h9d)))));
  assign wire30 = reg21;
  assign wire31 = $unsigned({{reg26, reg22[(1'h0):(1'h0)]}});
  assign wire32 = (^~reg20[(5'h13):(1'h1)]);
  assign wire33 = $unsigned($unsigned(reg26));
  assign wire34 = wire0[(2'h2):(1'h1)];
  assign wire35 = $unsigned($signed(wire34));
  assign wire36 = wire2[(2'h2):(1'h1)];
  assign wire37 = wire17[(1'h0):(1'h0)];
endmodule
