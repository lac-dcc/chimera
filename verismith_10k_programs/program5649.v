module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire32,
                 wire12,
                 wire11,
                 wire5,
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
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire0;
  always
    @(posedge clk) begin
      reg6 <= wire5[(1'h0):(1'h0)];
      reg7 <= $signed(((~|{{wire4, wire4}, wire2}) ?
          $signed($unsigned(wire2)) : wire1));
      reg8 <= ((8'hae) ^~ reg7);
      reg9 <= (-(~{$signed((wire1 >= reg7))}));
      reg10 <= (~^(8'ha5));
    end
  assign wire11 = wire5[(3'h5):(1'h1)];
  assign wire12 = wire0;
  always
    @(posedge clk) begin
      if ($signed($unsigned($unsigned(reg7))))
        begin
          if ((($unsigned((^~$unsigned(reg10))) - wire5) ?
              $unsigned(wire11) : wire0))
            begin
              reg13 <= (wire5 ?
                  wire2[(4'h8):(3'h7)] : (~^$signed({{wire5, wire4}})));
              reg14 <= $signed(reg7);
              reg15 <= wire12[(4'h9):(3'h5)];
              reg16 <= (8'hbe);
            end
          else
            begin
              reg13 <= {({(8'hb1)} <= wire2[(4'hc):(4'hc)])};
              reg14 <= ($unsigned(reg8[(1'h0):(1'h0)]) ?
                  reg16[(4'hb):(3'h6)] : ((~|((&reg10) != (wire5 ^~ (8'ha6)))) ?
                      (8'hae) : reg10));
              reg15 <= reg9;
              reg16 <= ({$signed(({reg6} & wire0))} ?
                  ((~&{(~&wire12), (8'ha1)}) ?
                      ((reg13 ?
                          $unsigned(wire11) : reg16) == ((|wire11) + reg14)) : $unsigned($unsigned(reg8[(3'h4):(1'h0)]))) : ($unsigned($unsigned(reg8)) ?
                      $unsigned((wire3 || wire11)) : ({{wire5},
                          $unsigned(reg10)} & (-((8'hbe) ? wire0 : reg13)))));
              reg17 <= (^~{(^~($unsigned(reg16) <<< $signed(wire12))),
                  $unsigned(reg10)});
            end
        end
      else
        begin
          reg13 <= $unsigned(reg17);
          reg14 <= (reg16[(4'ha):(4'h9)] ?
              {$signed(($signed(wire12) < $signed((8'hbf))))} : reg9);
        end
      reg18 <= (reg17[(4'h8):(3'h7)] > $signed($signed({(reg14 & reg6)})));
      if ((wire3 << ((~^$signed((reg18 ?
          wire2 : wire12))) ^~ ((wire4 < wire5[(2'h3):(2'h2)]) ?
          (~^(reg14 <= wire3)) : ((reg14 & wire4) ?
              (~^wire0) : $unsigned(wire5))))))
        begin
          if (reg8[(2'h3):(1'h1)])
            begin
              reg19 <= $unsigned((+reg6[(4'h9):(2'h3)]));
              reg20 <= (reg18 || wire2);
              reg21 <= $unsigned($unsigned(reg9[(1'h1):(1'h0)]));
              reg22 <= ({$unsigned(reg15[(2'h3):(1'h1)])} ^ (^{(wire4[(4'hb):(2'h2)] || (reg9 <<< wire5)),
                  reg18[(4'h9):(3'h4)]}));
              reg23 <= reg19;
            end
          else
            begin
              reg19 <= ((8'h9c) >= {$unsigned((8'hb1))});
              reg20 <= $signed((reg8 ?
                  $unsigned($signed((8'haa))) : $unsigned(((^wire1) && ((8'hb2) < reg21)))));
              reg21 <= {reg18[(4'h8):(2'h2)]};
            end
          reg24 <= (reg21 == ((^~($unsigned(reg21) - $signed(reg17))) ?
              wire1 : $signed(reg14[(3'h4):(3'h4)])));
          reg25 <= $signed($unsigned(reg13));
        end
      else
        begin
          if (reg18)
            begin
              reg19 <= (&(~&$unsigned(($signed(reg15) ?
                  wire1 : {reg25, reg22}))));
              reg20 <= $unsigned((&(~|wire11[(2'h2):(1'h1)])));
              reg21 <= (($unsigned(reg21) ?
                      $unsigned((~&$unsigned(reg9))) : (7'h41)) ?
                  wire11 : reg8[(1'h0):(1'h0)]);
              reg22 <= {(((+{reg7}) << reg15) ?
                      (!wire3[(3'h4):(2'h3)]) : (((reg10 ?
                              reg6 : reg25) <= (reg6 ? wire5 : wire3)) ?
                          reg17 : ((wire1 <<< wire5) ?
                              {wire2, reg10} : reg21))),
                  (($signed(wire4[(2'h2):(2'h2)]) + (~^(wire11 ?
                      reg18 : reg25))) << $signed({((8'ha8) ?
                          wire12 : reg6)}))};
            end
          else
            begin
              reg19 <= $unsigned(($signed(((~&reg24) ? (8'hae) : wire0)) ?
                  {$unsigned(wire12[(4'hb):(4'h9)]),
                      ($unsigned(reg22) ?
                          (reg9 ? reg15 : reg7) : (reg8 ?
                              wire4 : reg15))} : (($unsigned(reg16) ?
                      ((8'hb6) ?
                          reg24 : wire5) : (8'hbe)) <<< $signed(reg6[(3'h4):(3'h4)]))));
              reg20 <= (~$signed(wire3));
              reg21 <= {(((!(reg10 >>> reg8)) >= (^$unsigned(wire2))) ^~ reg7),
                  reg9[(2'h3):(1'h0)]};
              reg22 <= $unsigned((((reg13 << reg9[(2'h2):(1'h1)]) ?
                  (reg17[(4'hc):(4'h9)] ?
                      reg20 : reg17[(4'ha):(3'h7)]) : wire5[(1'h1):(1'h0)]) + $signed(((~^reg22) & (reg7 ~^ wire12)))));
            end
          reg23 <= reg13;
          reg24 <= (~^(($unsigned($signed((8'hb8))) ?
                  reg6[(4'h8):(4'h8)] : {reg14, reg10[(2'h2):(1'h0)]}) ?
              $signed({{reg14}, (^~reg23)}) : (-$unsigned((reg21 | wire4)))));
          reg25 <= reg20;
          if (reg14)
            begin
              reg26 <= $unsigned(reg8);
              reg27 <= $signed($unsigned({$signed($unsigned(wire4)),
                  reg9[(3'h4):(1'h0)]}));
              reg28 <= wire0;
              reg29 <= $signed({{reg7[(4'hb):(3'h4)], (-reg6[(3'h6):(3'h6)])}});
              reg30 <= $unsigned((reg10[(3'h5):(2'h3)] ?
                  reg27[(5'h13):(4'hf)] : reg17));
            end
          else
            begin
              reg26 <= (^~{(^({(8'hbd)} ? reg20 : reg17[(1'h0):(1'h0)])),
                  ($unsigned(reg14) ? reg14 : ((~^(8'h9d)) < reg27))});
            end
        end
      reg31 <= wire1;
    end
  assign wire32 = reg18[(3'h7):(2'h3)];
endmodule
