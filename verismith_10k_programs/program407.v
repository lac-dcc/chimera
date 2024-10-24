module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire5,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $unsigned((^~wire2));
  always
    @(posedge clk) begin
      if ($signed($unsigned(({wire2, wire3} ^~ $unsigned((wire5 || wire1))))))
        begin
          if ((8'hb8))
            begin
              reg6 <= wire5;
              reg7 <= (wire4 >>> $signed(wire5[(4'h9):(2'h2)]));
              reg8 <= ($signed($unsigned(((wire5 > wire4) ?
                      wire2[(4'hc):(3'h5)] : (reg6 ? reg7 : reg7)))) ?
                  $unsigned(($unsigned((8'hb9)) ?
                      wire5[(4'h9):(4'h8)] : ((wire0 * wire5) - $signed((8'hb8))))) : (wire3 ?
                      wire1 : wire1));
            end
          else
            begin
              reg6 <= {$unsigned(wire4)};
              reg7 <= (~^reg7);
              reg8 <= $signed(($unsigned(wire0) >> ({$unsigned(wire5),
                  (reg6 | (8'hbd))} && ($signed((8'hac)) ?
                  wire3 : ((7'h42) ? (8'hae) : wire5)))));
              reg9 <= {(~(((wire1 >> reg8) ?
                      (wire3 ?
                          wire4 : reg7) : ((8'hae) + wire1)) < $unsigned((wire1 ?
                      wire2 : (8'hae))))),
                  wire5};
              reg10 <= $unsigned({(reg7[(4'he):(3'h5)] ^~ ({reg7,
                      (8'h9c)} == (^(8'hb6)))),
                  wire5});
            end
        end
      else
        begin
          reg6 <= $unsigned(({(|(reg7 <= reg7))} ?
              {(|(wire0 ? wire1 : wire5)),
                  ($signed((8'had)) ?
                      $unsigned((8'hb2)) : (wire2 != wire1))} : $unsigned($unsigned((~&(8'h9e))))));
          if ({reg6[(4'h9):(3'h7)]})
            begin
              reg7 <= wire2;
              reg8 <= ($signed((~(reg8[(5'h10):(1'h0)] || (wire3 ?
                      wire4 : (8'hac))))) ?
                  {$unsigned($unsigned(wire4[(2'h2):(2'h2)]))} : wire1[(5'h11):(3'h6)]);
              reg9 <= (^~wire1[(4'he):(1'h0)]);
            end
          else
            begin
              reg7 <= (~^($signed(wire0) ?
                  (-(^wire0)) : $signed(wire4[(1'h0):(1'h0)])));
              reg8 <= reg9;
              reg9 <= (wire0 ? $unsigned($unsigned((!(^reg7)))) : reg9);
              reg10 <= (|$signed(({(reg6 ^~ wire0)} >= {((8'h9f) | wire1),
                  (wire0 ? wire1 : wire4)})));
            end
          reg11 <= (wire1 ? (7'h44) : wire4);
        end
      reg12 <= (|reg10[(1'h1):(1'h1)]);
    end
  assign wire13 = (+reg7[(4'ha):(3'h5)]);
  assign wire14 = ((!reg9) ?
                      ((~^wire1) <<< $unsigned($unsigned((reg12 <= wire3)))) : ((reg10 ?
                          wire4[(1'h0):(1'h0)] : ((&wire13) ^~ (reg10 ?
                              reg7 : wire3))) + reg8[(5'h11):(5'h11)]));
endmodule
