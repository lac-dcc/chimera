module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
                 wire4,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (~^$signed({{(+wire2), $signed(wire0)}, wire1}));
  assign wire5 = ($signed($unsigned({$signed(wire1), $unsigned(wire4)})) ?
                     wire2[(1'h0):(1'h0)] : ({wire3[(4'he):(1'h1)],
                         $unsigned($signed(wire0))} * wire2[(2'h3):(1'h1)]));
  assign wire6 = $signed(wire3);
  always
    @(posedge clk) begin
      if ($signed(wire5[(3'h7):(3'h4)]))
        begin
          reg7 <= ((^~((~&(wire4 ? wire6 : wire5)) ?
              wire3[(4'hc):(3'h4)] : {$signed(wire3)})) ^ {wire0});
        end
      else
        begin
          reg7 <= ((&(wire1 + (wire1[(3'h6):(3'h6)] ^ (wire2 ?
              wire1 : (8'hb8))))) ^~ $signed($unsigned({((8'hb9) < wire5)})));
          reg8 <= ($signed({(wire5[(1'h1):(1'h1)] ?
                  (8'h9c) : {(8'ha1)})}) || $signed((($unsigned(wire4) <<< (&wire1)) >= $unsigned((^(7'h40))))));
          reg9 <= $signed($unsigned((^~($signed(wire1) >> {reg8}))));
          reg10 <= $unsigned((wire5 <<< reg7));
          reg11 <= wire0[(4'h8):(4'h8)];
        end
      reg12 <= reg8[(4'h9):(2'h3)];
      if ((reg11[(3'h6):(2'h2)] ~^ $signed(wire5[(1'h1):(1'h0)])))
        begin
          reg13 <= $signed((-wire5));
          reg14 <= $signed(wire6);
          if (wire1)
            begin
              reg15 <= ($signed(wire6[(3'h5):(3'h5)]) | reg11);
              reg16 <= (((reg14 <<< reg15) ?
                      (-(reg7 >> reg10[(5'h10):(4'h8)])) : (wire3 ?
                          $unsigned($signed(reg9)) : $signed($signed(reg15)))) ?
                  (8'hb8) : (+(|reg10[(4'hb):(2'h2)])));
              reg17 <= $unsigned($unsigned($signed(({reg15} ? reg7 : reg10))));
              reg18 <= ({(&(-$signed((8'hbd)))),
                  {((wire3 < reg17) == reg10[(1'h1):(1'h1)]),
                      $unsigned((~reg10))}} ^~ $signed((^wire0[(4'hc):(4'hc)])));
            end
          else
            begin
              reg15 <= {$unsigned($unsigned($signed(reg11[(4'ha):(3'h4)]))),
                  $signed(wire2)};
              reg16 <= wire5[(3'h4):(2'h2)];
              reg17 <= $unsigned(reg16);
              reg18 <= $signed((~|$unsigned(wire4[(4'ha):(3'h6)])));
              reg19 <= $signed({$signed(wire4), (8'hb1)});
            end
          if ($signed($signed((8'hbc))))
            begin
              reg20 <= $signed(((^$signed({(8'ha3), reg10})) != (8'hb3)));
              reg21 <= {(&(($signed(reg11) ?
                      (reg8 ? reg17 : wire6) : reg18) >>> (+{reg7})))};
              reg22 <= (($signed(reg9) + reg10[(4'he):(3'h4)]) ?
                  $unsigned((!$unsigned(reg12))) : reg20[(4'h9):(3'h5)]);
              reg23 <= reg20[(3'h5):(3'h5)];
              reg24 <= $unsigned($unsigned(reg12[(3'h5):(1'h1)]));
            end
          else
            begin
              reg20 <= reg11[(3'h5):(2'h2)];
              reg21 <= reg12[(2'h3):(1'h0)];
              reg22 <= reg14;
              reg23 <= $signed(reg13[(2'h3):(2'h3)]);
            end
        end
      else
        begin
          reg13 <= reg18;
          reg14 <= $unsigned(wire0);
          reg15 <= (reg9 <<< (($signed((reg10 ? (8'h9d) : reg15)) ?
              $signed((reg11 ? (8'hac) : (8'ha9))) : (((8'ha5) ?
                  reg19 : wire3) || (reg24 ?
                  wire0 : reg14))) > $signed((reg16[(4'hf):(1'h1)] ^ reg23))));
        end
      reg25 <= reg19;
    end
endmodule
