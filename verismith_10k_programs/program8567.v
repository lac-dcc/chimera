module top
#(parameter param43 = (((-(|((7'h40) ? (8'h9d) : (8'ha3)))) != (^~(~|((8'ha0) ? (8'hb0) : (8'had))))) ? (((((8'ha9) ^~ (8'ha7)) ? {(8'hb2), (8'hb7)} : ((8'h9f) > (8'hab))) ? (+{(8'ha1)}) : {{(8'hb5), (8'ha2)}}) ? (+(((8'hbe) ? (7'h40) : (8'h9e)) >>> (+(8'ha1)))) : (!(((8'ha0) || (8'hb8)) >> ((8'hbd) < (8'ha6))))) : (&({{(8'hb0), (8'hb8)}, ((7'h42) ? (8'hb1) : (7'h40))} ? (((8'hb9) ? (8'hb3) : (8'ha2)) << (8'hb6)) : (~^((8'ha2) ? (8'hba) : (8'hb4)))))), 
parameter param44 = (~^param43))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1f0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg39,
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
                 reg22,
                 reg21,
                 reg20,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed((wire1[(3'h6):(3'h5)] >>> ({$unsigned(wire3)} ?
          {$signed((7'h40))} : ((wire1 && (8'hb8)) ?
              {wire2, wire1} : (^wire0)))));
      reg5 <= ({$signed({{wire3}})} <= $signed(($signed((-wire3)) ?
          $signed(wire0) : $signed(reg4[(3'h4):(2'h3)]))));
      reg6 <= wire0;
      reg7 <= reg5[(4'h8):(1'h1)];
      reg8 <= (8'hbc);
    end
  assign wire9 = $unsigned(reg6[(3'h7):(2'h3)]);
  assign wire10 = ((wire9 >> wire1) ?
                      {$unsigned((^~$signed(reg5))),
                          reg4} : ($signed(((8'ha9) ^ {wire9})) == {(7'h42),
                          $signed(wire2)}));
  assign wire11 = (wire9 ?
                      (8'hbc) : ($unsigned((^~((8'hbd) ?
                          wire10 : reg4))) == ((reg7[(3'h4):(1'h1)] || reg8) ?
                          ($signed(reg8) ?
                              wire0[(4'ha):(1'h1)] : reg6) : (~^(!reg4)))));
  assign wire12 = (wire9 >> $unsigned(reg4));
  assign wire13 = $unsigned((^{$unsigned((~&reg6)),
                      ((-wire1) ? reg4[(4'hd):(3'h6)] : $unsigned(reg5))}));
  assign wire14 = $unsigned((^~$signed(($unsigned(wire1) ?
                      (wire12 ^~ wire1) : $signed(wire12)))));
  assign wire15 = ((|(({wire14} <<< $signed(reg8)) ?
                      (~(wire10 ?
                          reg4 : reg4)) : $unsigned($unsigned(wire3)))) < (wire2[(1'h1):(1'h0)] ?
                      wire1 : (({reg8} >> (reg6 != wire13)) - $signed((reg7 ?
                          reg6 : wire11)))));
  assign wire16 = (~^wire13);
  assign wire17 = $unsigned($unsigned((|$unsigned(wire9))));
  assign wire18 = $unsigned(reg7);
  assign wire19 = wire13[(4'hd):(4'hd)];
  always
    @(posedge clk) begin
      reg20 <= $unsigned($signed(($signed((wire1 << reg8)) ?
          wire11[(4'hb):(3'h6)] : reg6)));
      reg21 <= (wire11 ?
          {$signed({reg6[(2'h2):(1'h0)], $signed(reg20)}),
              $signed({(~&wire11)})} : ((wire15 & ((!wire0) ?
                  (reg4 ? wire18 : wire12) : wire11[(5'h10):(2'h2)])) ?
              {$unsigned(wire3[(5'h14):(5'h10)]),
                  $unsigned((8'ha8))} : ((~(wire17 ^ reg6)) ?
                  reg20 : (wire18[(5'h14):(3'h5)] ? reg20 : (reg4 == reg6)))));
      reg22 <= $unsigned(wire19[(5'h12):(1'h0)]);
      reg23 <= $unsigned(({$signed(((8'hbc) == (8'ha0))), (~wire17)} ?
          ({$unsigned((8'hb7))} ^~ (8'hbf)) : reg6[(3'h6):(2'h3)]));
    end
  always
    @(posedge clk) begin
      if ((((wire13[(3'h7):(2'h3)] ?
              {{reg20}, (reg5 ? wire11 : wire10)} : {(wire19 - (8'ha1)),
                  $signed(wire19)}) << (8'ha6)) ?
          (8'hb1) : reg8[(1'h0):(1'h0)]))
        begin
          reg24 <= $signed($unsigned($unsigned(wire14[(4'hc):(2'h2)])));
          reg25 <= {wire19[(4'hf):(4'h8)],
              $unsigned($signed(wire1[(1'h1):(1'h0)]))};
          if ($signed(({$unsigned((&wire1)), reg24} ?
              ((&(reg24 ? wire2 : reg8)) + ((~|wire16) ?
                  (wire10 ? reg21 : reg25) : (reg22 ?
                      wire14 : wire3))) : (reg22[(3'h4):(2'h3)] ?
                  wire14[(3'h4):(3'h4)] : ((reg25 ? wire1 : wire9) ?
                      (^reg7) : reg24[(1'h0):(1'h0)])))))
            begin
              reg26 <= wire3[(5'h15):(1'h0)];
              reg27 <= (+reg7[(4'ha):(4'ha)]);
              reg28 <= {(!(((!wire0) ?
                      {wire2} : (reg27 ?
                          wire18 : reg24)) >>> $unsigned($unsigned(wire3)))),
                  $signed(wire16)};
              reg29 <= wire14[(3'h5):(3'h4)];
            end
          else
            begin
              reg26 <= wire13[(1'h0):(1'h0)];
              reg27 <= {$signed(((~^(&wire1)) ?
                      wire15 : (~reg20[(3'h5):(2'h2)]))),
                  wire16};
            end
          reg30 <= (7'h44);
          reg31 <= (reg25 ? reg20 : $signed((~reg26[(1'h0):(1'h0)])));
        end
      else
        begin
          reg24 <= {{($signed(reg8) ?
                      wire3[(1'h1):(1'h1)] : (~$unsigned(reg27)))}};
          reg25 <= wire14;
          reg26 <= $unsigned((7'h44));
          reg27 <= (~($unsigned((wire10[(5'h10):(1'h1)] ? reg5 : (-(7'h43)))) ?
              ((8'hb8) < ({reg27} ?
                  (wire17 ^~ reg27) : (reg27 && wire3))) : {$unsigned((^~wire16)),
                  (reg26 ? (&reg21) : (reg20 ? reg31 : reg24))}));
        end
      reg32 <= {(&reg23), $unsigned(reg8[(3'h4):(1'h0)])};
      reg33 <= reg4[(3'h6):(1'h0)];
      reg34 <= $unsigned(((^(|(!reg27))) && ((~&reg32[(5'h11):(4'hb)]) ?
          $unsigned((-wire1)) : $unsigned(reg26))));
    end
  assign wire35 = $signed(((+reg7[(3'h4):(1'h1)]) ?
                      (~((reg24 ^ wire0) ? $unsigned(reg6) : (|reg8))) : (reg7 ?
                          ((7'h40) < (wire1 >>> reg22)) : reg20[(3'h7):(3'h4)])));
  assign wire36 = (^~((!$signed(reg21)) < reg22[(2'h3):(2'h3)]));
  assign wire37 = $signed(($unsigned((wire11 ? $signed(wire14) : reg33)) ?
                      reg26 : {reg5[(4'ha):(4'h9)], wire35[(3'h5):(3'h4)]}));
  assign wire38 = (reg4 ?
                      (^{(reg4[(2'h2):(1'h1)] ?
                              (reg33 & wire36) : reg34[(2'h2):(1'h1)])}) : (~&$unsigned((8'hac))));
  always
    @(posedge clk) begin
      reg39 <= (((($unsigned(reg28) * (reg6 ?
              wire35 : reg31)) && (~$signed(reg34))) >= $unsigned($signed({wire18}))) ?
          $unsigned(reg8) : $signed($signed(reg27)));
    end
  assign wire40 = wire15;
  assign wire41 = reg5;
  assign wire42 = wire0;
endmodule
