module top
#(parameter param23 = (|(((((7'h42) << (8'hb6)) ^~ ((8'ha7) ? (8'ha9) : (8'had))) < (((8'ha8) ? (8'h9c) : (8'ha4)) ? ((8'hac) & (8'hb9)) : {(7'h44), (8'ha6)})) ? (8'h9d) : ((((8'had) - (8'ha6)) ? ((8'hae) >>> (8'h9f)) : ((8'hbc) ? (8'ha6) : (8'hb7))) + (((8'hb8) < (8'hbd)) + ((8'h9f) || (8'ha8)))))), 
parameter param24 = (((!param23) && ({(~|param23)} * ((param23 - param23) <= {param23}))) ? ((~|param23) ? {(8'ha4), (8'hb6)} : param23) : {((~&(^~param23)) <<< param23)}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg [(2'h3):(1'h0)] reg4 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg22,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2[(3'h4):(2'h3)];
      if ((8'h9f))
        begin
          reg5 <= (wire1 ?
              wire3[(3'h5):(2'h2)] : (($unsigned(((8'ha6) >> wire2)) ?
                  {$unsigned(wire3)} : wire2[(1'h0):(1'h0)]) & $unsigned((reg4[(2'h2):(2'h2)] ?
                  $unsigned(wire0) : wire0[(2'h3):(2'h3)]))));
          reg6 <= $signed($unsigned(reg5[(2'h3):(2'h3)]));
        end
      else
        begin
          reg5 <= $signed($signed($signed({reg4[(1'h1):(1'h1)]})));
          reg6 <= $signed(reg6[(4'h9):(4'h8)]);
        end
      if (reg4[(1'h0):(1'h0)])
        begin
          reg7 <= wire0;
          if ((+((wire3[(3'h4):(2'h2)] ?
              (reg5 >> wire1) : (|(reg6 ? reg6 : reg6))) + ($signed(reg5) ?
              reg6 : $signed(((8'ha7) ^~ reg4))))))
            begin
              reg8 <= $unsigned(wire2);
            end
          else
            begin
              reg8 <= ($unsigned(reg7[(2'h3):(1'h1)]) >> $unsigned($signed({reg6[(4'h9):(3'h7)],
                  (wire0 ? wire0 : wire3)})));
              reg9 <= wire1;
              reg10 <= $unsigned($signed($unsigned(reg7)));
              reg11 <= (({reg7, wire1[(2'h2):(1'h1)]} <<< $signed(((|reg7) ?
                  (reg10 <= reg4) : $signed(reg8)))) - ((reg5[(2'h2):(2'h2)] && ((reg4 ^~ reg9) + {reg7,
                      wire1})) ?
                  (~^(8'hb7)) : {(~&$unsigned(wire2)),
                      {$unsigned((8'hbe)), {wire1}}}));
            end
          reg12 <= (7'h43);
        end
      else
        begin
          reg7 <= $signed(reg7);
          reg8 <= wire1[(2'h2):(1'h1)];
          reg9 <= (^~wire1[(4'hd):(3'h6)]);
          reg10 <= reg4[(2'h3):(1'h0)];
          reg11 <= $signed({reg4[(1'h0):(1'h0)], wire0[(4'h9):(4'h8)]});
        end
      reg13 <= wire3[(1'h0):(1'h0)];
    end
  assign wire14 = (reg7 == (wire1[(4'he):(2'h2)] ?
                      reg9[(3'h6):(1'h0)] : wire1));
  assign wire15 = $unsigned((~&$unsigned((~|$signed(reg9)))));
  assign wire16 = (!($signed($signed($unsigned(wire0))) ?
                      {wire15} : reg10[(3'h4):(1'h1)]));
  assign wire17 = ($signed($signed((wire3[(3'h7):(3'h5)] >>> (!reg6)))) ?
                      $unsigned((({wire3} < (reg8 >> reg13)) ?
                          ((reg12 && reg12) ?
                              ((8'hb5) ~^ wire16) : (reg9 ?
                                  reg12 : wire0)) : (~&$signed(reg6)))) : {$unsigned(($signed(reg9) ?
                              (wire16 + (8'h9d)) : (wire3 ? wire3 : wire16))),
                          ($unsigned((reg5 - reg8)) >= $signed($signed(reg8)))});
  assign wire18 = reg10[(3'h7):(1'h1)];
  assign wire19 = $unsigned(($signed(wire3[(3'h7):(2'h2)]) << reg13[(2'h3):(1'h0)]));
  assign wire20 = reg10;
  assign wire21 = ({wire16} ?
                      (~^$unsigned((8'hb8))) : (wire19[(3'h6):(2'h3)] ?
                          $unsigned((wire20[(3'h4):(1'h1)] ?
                              ((8'hbe) ?
                                  reg5 : wire16) : (wire19 >= reg8))) : $signed(reg13[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg22 <= reg8;
    end
endmodule
