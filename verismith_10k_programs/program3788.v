module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire20,
                 wire14,
                 wire5,
                 wire4,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (&wire3);
  assign wire5 = {$signed($signed({(wire0 ? wire1 : (8'h9d))}))};
  always
    @(posedge clk) begin
      reg6 <= $signed((~wire0[(1'h0):(1'h0)]));
      reg7 <= (~&(~&{{wire3[(4'ha):(2'h2)], (!wire3)},
          (wire0 ? (wire4 || wire2) : ((8'ha7) ? wire3 : wire4))}));
      if ($unsigned(($signed(reg7) << {$signed($signed(wire5))})))
        begin
          reg8 <= {$signed(wire3[(4'hd):(3'h5)])};
          reg9 <= (8'hbc);
          reg10 <= (($unsigned(wire2) ?
                  (({wire5} ~^ $signed(wire0)) > wire4[(1'h1):(1'h1)]) : $unsigned($signed(reg7))) ?
              {(|wire0[(2'h2):(1'h1)])} : ((reg7 <<< reg6[(5'h13):(5'h13)]) >>> $signed(wire0)));
        end
      else
        begin
          reg8 <= reg7[(1'h0):(1'h0)];
          if ((~^(!(($signed(wire3) ?
              (^(8'haf)) : ((8'hb1) ?
                  wire1 : wire3)) > $unsigned($signed(reg8))))))
            begin
              reg9 <= $unsigned($unsigned($signed((!reg7))));
              reg10 <= (($unsigned(((wire2 + reg9) < reg10[(4'hb):(2'h2)])) >>> $signed((&(-wire5)))) ?
                  ((reg7 == (reg10[(3'h5):(1'h1)] <<< wire5)) ?
                      $signed(((reg10 ? (7'h42) : reg10) ?
                          $signed(wire4) : (reg7 > wire0))) : wire3) : ((reg7 ?
                      (reg7[(4'hb):(3'h5)] ?
                          {(8'hb6), wire4} : (wire1 ?
                              wire0 : reg6)) : (wire4[(3'h5):(3'h4)] > (^~wire5))) >> (((^~wire2) ?
                      reg8 : $signed((8'hb3))) | {(+wire4),
                      (wire0 ? reg9 : reg7)})));
              reg11 <= $signed(reg10[(1'h1):(1'h1)]);
              reg12 <= reg9;
              reg13 <= wire4[(3'h4):(2'h3)];
            end
          else
            begin
              reg9 <= {reg10[(3'h5):(1'h1)]};
              reg10 <= {(+wire0)};
              reg11 <= wire1[(3'h6):(3'h5)];
              reg12 <= wire2[(3'h7):(2'h2)];
              reg13 <= reg6;
            end
        end
    end
  assign wire14 = {(((reg8[(4'hb):(4'h8)] ? (reg10 ~^ wire2) : wire5) ?
                          $unsigned(wire2[(3'h7):(3'h5)]) : ((|reg9) * wire5[(3'h4):(1'h0)])) ~^ {wire0[(2'h2):(2'h2)]})};
  always
    @(posedge clk) begin
      reg15 <= wire2;
      reg16 <= reg12[(2'h3):(2'h3)];
      reg17 <= reg11[(3'h7):(3'h6)];
      reg18 <= $signed(wire4);
      reg19 <= (~|{$unsigned((8'ha0)), reg7});
    end
  assign wire20 = $signed(wire4);
endmodule
