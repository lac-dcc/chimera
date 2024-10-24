module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  assign y = {wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = $unsigned(((|{{wire1, wire3}}) ^ $unsigned(((&wire2) ?
                     wire3[(4'h9):(4'h9)] : (~wire1)))));
  assign wire6 = {(($unsigned(wire0[(1'h1):(1'h0)]) ?
                         {$unsigned(wire0),
                             (wire0 ? wire0 : wire5)} : (wire0[(3'h4):(3'h4)] ?
                             $unsigned((8'ha6)) : {wire3})) <<< ((-wire4) + $unsigned((&wire2))))};
  assign wire7 = {$unsigned($signed($signed($unsigned(wire2))))};
  assign wire8 = wire4[(2'h2):(1'h0)];
  assign wire9 = $signed($signed(wire1));
  assign wire10 = $unsigned(wire9[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg11 <= (+wire3);
      if ($signed((^wire9)))
        begin
          reg12 <= ({$unsigned(wire1), {wire1[(3'h7):(3'h6)]}} ?
              (wire0 >>> $signed({$unsigned(wire10),
                  $unsigned(wire1)})) : $signed($unsigned((reg11 ?
                  wire10[(1'h1):(1'h0)] : wire10[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg12 <= $signed((+wire6[(3'h6):(2'h2)]));
          if ($signed(((-wire7[(4'hd):(4'h8)]) ?
              (^~(reg12 << (wire10 | (8'hbf)))) : wire9)))
            begin
              reg13 <= (($signed($unsigned({wire5, wire7})) ?
                      $signed(($unsigned(wire0) ?
                          (&(8'had)) : (wire5 | wire4))) : (~^$unsigned((reg11 ^ wire5)))) ?
                  (~|({wire4} * $unsigned((wire7 ? wire2 : wire2)))) : wire2);
              reg14 <= reg13;
              reg15 <= {(+{reg12[(4'h9):(4'h9)], (~$unsigned(wire7))})};
              reg16 <= reg15;
            end
          else
            begin
              reg13 <= $unsigned({(~^$signed(reg12))});
            end
        end
      reg17 <= reg16[(4'ha):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg18 <= ({(wire8[(4'hc):(1'h0)] ?
                  (&(!wire9)) : (reg16 ? $signed(reg12) : (wire1 + reg12))),
              wire2[(3'h6):(2'h2)]} ?
          (|$signed(($signed(wire6) ?
              (~|reg12) : reg11[(3'h6):(2'h3)]))) : $unsigned($signed(reg13)));
      reg19 <= (8'hbb);
      if (wire7[(3'h6):(3'h6)])
        begin
          reg20 <= ((wire10 ? (reg13 * (^((8'hbf) != wire9))) : {reg17}) ?
              (8'hac) : reg12[(1'h1):(1'h0)]);
          reg21 <= $signed(reg15[(1'h0):(1'h0)]);
          reg22 <= (8'had);
        end
      else
        begin
          reg20 <= (wire7[(4'hb):(3'h7)] ? reg11 : wire0[(1'h1):(1'h0)]);
          reg21 <= ($signed(((!$unsigned(wire9)) + $signed({(8'ha9),
              wire4}))) << ((((^wire2) ? $unsigned((7'h40)) : reg11) ?
              $signed((|reg17)) : (~^(reg14 - wire2))) < {reg13[(2'h2):(1'h0)],
              $unsigned(wire5[(4'h9):(3'h7)])}));
        end
    end
endmodule
