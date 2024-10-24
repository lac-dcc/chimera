module top
#(parameter param25 = (8'hbb))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
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
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (wire3[(2'h2):(1'h1)] ?
                     (&$unsigned((wire4[(5'h13):(5'h12)] ?
                         (wire1 == wire2) : (wire3 >> wire3)))) : (~^(wire4[(3'h5):(2'h3)] ?
                         (wire3[(2'h2):(1'h0)] >= $unsigned(wire0)) : wire1[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg6 <= (-{$signed($unsigned(((8'haa) != wire3)))});
      reg7 <= (wire3[(4'h8):(1'h1)] <= wire4[(4'hc):(3'h6)]);
    end
  assign wire8 = {($signed(($signed((8'hb9)) ? $unsigned(reg6) : (~&(8'h9e)))) ?
                         $unsigned((8'had)) : (^~{(wire5 ? wire2 : (8'hb3))})),
                     (wire5[(4'hd):(1'h0)] + $unsigned($signed({(8'ha8)})))};
  assign wire9 = reg6[(2'h2):(2'h2)];
  assign wire10 = wire5;
  assign wire11 = (wire2[(1'h0):(1'h0)] ?
                      $unsigned($signed(((wire8 ?
                          (8'haa) : wire4) == (^(8'ha2))))) : (~^wire2));
  always
    @(posedge clk) begin
      reg12 <= (~&wire8[(1'h1):(1'h1)]);
      reg13 <= wire9;
      if (reg13[(4'h9):(3'h5)])
        begin
          if (({{((wire0 >> wire8) ? $signed(wire5) : (reg7 ? wire8 : wire4))},
                  $unsigned((!(8'hb0)))} ?
              reg6 : $signed({$unsigned((wire2 <<< wire3)),
                  $signed($unsigned(wire9))})))
            begin
              reg14 <= wire8;
              reg15 <= $unsigned((|reg7));
              reg16 <= {$unsigned(reg14)};
              reg17 <= (reg13[(3'h7):(2'h3)] ?
                  wire0 : (((^$unsigned(wire2)) ?
                          $unsigned($signed(reg13)) : (|$unsigned(reg12))) ?
                      ($unsigned((wire0 ? reg13 : reg16)) ?
                          ($unsigned((8'hac)) ?
                              $unsigned(reg15) : ((8'hab) ?
                                  reg12 : reg16)) : (wire2[(2'h2):(1'h0)] >>> reg16)) : reg7));
            end
          else
            begin
              reg14 <= ($unsigned($signed((+wire1[(4'h8):(1'h1)]))) ?
                  ($unsigned(((-reg16) ?
                          reg13[(3'h4):(1'h1)] : (reg12 <= (8'hb0)))) ?
                      (($unsigned(wire1) >> $signed(wire1)) ?
                          wire4[(3'h6):(3'h6)] : ($signed(wire5) ~^ (wire5 ?
                              wire11 : wire8))) : $signed(($signed(reg15) ?
                          $unsigned(reg14) : (~reg15)))) : ((~$unsigned($unsigned(wire11))) ~^ (reg14[(4'hd):(2'h3)] ~^ ((8'hb1) || {reg14}))));
            end
          if ($unsigned((-reg13[(2'h3):(1'h1)])))
            begin
              reg18 <= ({$unsigned($unsigned((reg12 > wire10)))} ^~ wire10);
              reg19 <= wire4;
              reg20 <= $unsigned((($unsigned($signed(wire1)) ?
                  wire5 : (^~(^~wire8))) == ((&$signed(reg17)) > $unsigned(((8'h9d) ~^ wire11)))));
            end
          else
            begin
              reg18 <= $signed($signed(reg15[(4'hb):(4'h9)]));
            end
          reg21 <= wire2[(3'h5):(3'h5)];
        end
      else
        begin
          reg14 <= $unsigned($signed({(8'ha6)}));
          reg15 <= $signed({{(8'hab)}});
          reg16 <= ({({wire8[(4'h9):(1'h0)]} ?
                      (~$signed((8'hb1))) : $signed(reg12)),
                  (wire0 >= reg12[(4'he):(4'hd)])} ?
              (wire11 ?
                  (reg13 ^~ $unsigned((+reg21))) : $unsigned(wire9[(1'h0):(1'h0)])) : ({reg6[(2'h2):(1'h1)],
                  (wire9[(2'h2):(2'h2)] ?
                      (reg12 ?
                          reg21 : reg18) : reg15[(1'h1):(1'h0)])} || (^wire9)));
          reg17 <= $unsigned((~^wire5[(1'h0):(1'h0)]));
        end
      reg22 <= ($unsigned($unsigned(((wire11 >>> (8'ha4)) ?
              (^~reg13) : $signed(wire10)))) ?
          ((reg12 > ((wire3 ? wire4 : reg17) ?
              $unsigned(reg6) : (-wire3))) * (!$signed($signed(reg20)))) : $signed(reg15[(1'h1):(1'h1)]));
    end
  assign wire23 = (~&$signed($unsigned(((wire0 ? reg6 : wire1) ?
                      (wire5 - reg7) : (reg13 ? reg14 : wire9)))));
  assign wire24 = (wire0[(3'h5):(2'h3)] << {{reg21[(4'hd):(3'h7)],
                          $signed($signed(reg15))}});
endmodule
