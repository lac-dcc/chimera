module top
#(parameter param20 = (((-((~|(8'ha3)) ? ((8'hb8) ? (8'haa) : (8'ha1)) : (~&(8'hbc)))) ? ({((8'hbc) ? (7'h42) : (7'h43))} + (((8'hb2) | (8'hbf)) >> (~&(8'h9f)))) : (~&({(8'ha0), (7'h42)} ? {(8'ha3), (8'ha9)} : (|(8'hb3))))) > (8'hba)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (!(8'haf));
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg5 <= (~^$signed({(|wire1[(4'h8):(3'h7)]),
              ({wire1, wire1} & (wire1 ? wire4 : wire0))}));
          reg6 <= wire1;
          reg7 <= reg6;
        end
      else
        begin
          reg5 <= $unsigned({wire1[(2'h3):(1'h1)]});
          reg6 <= ($unsigned($signed(wire4[(3'h5):(3'h5)])) == $signed(wire4));
          reg7 <= wire2[(4'h8):(4'h8)];
          if ({wire0})
            begin
              reg8 <= $unsigned($signed(reg6[(3'h7):(3'h6)]));
            end
          else
            begin
              reg8 <= ($unsigned(((+(wire4 >> reg6)) > $signed(wire1[(3'h6):(3'h6)]))) ^ ((reg5 ?
                      ((reg7 ? (8'h9d) : wire2) * {reg7,
                          wire0}) : (wire0 ~^ reg7)) ?
                  (($signed(wire0) ?
                      (^reg5) : (wire0 ?
                          wire0 : reg5)) ~^ (-(wire0 > reg6))) : ((wire4 ?
                          (wire0 ? reg5 : reg5) : wire3) ?
                      (~|(reg7 ? wire4 : (8'hae))) : {((8'ha6) ?
                              wire0 : wire2)})));
              reg9 <= wire4;
              reg10 <= reg8[(1'h0):(1'h0)];
              reg11 <= $signed({$unsigned((!(+wire2))), reg7[(1'h1):(1'h0)]});
              reg12 <= {(8'hbd), reg8};
            end
          reg13 <= $unsigned(reg7[(2'h2):(1'h0)]);
        end
    end
  assign wire14 = ((+(|(~^reg8))) <<< reg12[(3'h6):(1'h0)]);
  assign wire15 = ((^(wire2[(2'h3):(1'h1)] ?
                      (!reg5[(1'h0):(1'h0)]) : ($signed(wire4) ?
                          $unsigned((8'ha2)) : (reg8 ?
                              wire14 : wire0)))) ^~ (~&$signed($signed((!reg13)))));
  assign wire16 = (~|$signed($signed((~^$unsigned(wire15)))));
  assign wire17 = (+(-($unsigned(wire14[(2'h2):(1'h1)]) >= $signed(reg6[(4'hb):(3'h6)]))));
  assign wire18 = ((($signed((wire0 ? wire3 : reg13)) ?
                          (~|$signed(wire15)) : {reg6}) && $unsigned($signed($signed(reg6)))) ?
                      $unsigned(wire3) : $signed({(^wire0), $unsigned(wire4)}));
  assign wire19 = $unsigned(reg5);
endmodule
