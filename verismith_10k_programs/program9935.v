module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire5,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (8'hb8);
  assign wire5 = ($signed((^(wire3[(3'h6):(3'h4)] ^ $unsigned(wire3)))) ?
                     ((!(~&(wire0 >= wire2))) < wire1[(1'h1):(1'h1)]) : $unsigned((~&wire3[(4'he):(3'h5)])));
  always
    @(posedge clk) begin
      if (((wire1 <= wire2[(3'h7):(3'h6)]) ?
          wire0 : (!(wire1[(2'h3):(1'h1)] ?
              $unsigned((wire5 ?
                  (7'h40) : wire4)) : (wire4[(2'h2):(1'h0)] - ((8'ha9) + wire3))))))
        begin
          reg6 <= (wire1 ? wire0[(1'h1):(1'h0)] : wire2[(4'ha):(2'h2)]);
          if (((((-{wire2, wire1}) & $signed(wire4[(3'h4):(2'h2)])) ?
              ($unsigned(reg6) <= $signed((^wire5))) : {wire4[(2'h3):(1'h0)],
                  wire2}) ~^ $unsigned($unsigned((~&wire0)))))
            begin
              reg7 <= $signed(((((8'haa) <= (^~wire5)) ?
                  $signed(wire0) : $unsigned($unsigned((8'hb6)))) + wire5[(3'h7):(3'h7)]));
            end
          else
            begin
              reg7 <= $unsigned(($signed((wire3 || $signed((7'h44)))) ?
                  {wire5[(3'h4):(3'h4)], reg7} : $unsigned({$unsigned(wire1),
                      $signed(wire3)})));
            end
          reg8 <= $signed(wire0);
          reg9 <= (reg6 ?
              $unsigned(wire4[(1'h1):(1'h1)]) : (~&{{wire2[(3'h5):(2'h3)]}}));
        end
      else
        begin
          if (reg7[(2'h2):(1'h1)])
            begin
              reg6 <= ((reg9[(4'hc):(3'h6)] + ($signed((!wire3)) ?
                      (~|$unsigned((8'hb7))) : wire3)) ?
                  $unsigned($signed(((reg7 & wire4) ?
                      (reg6 >>> reg9) : $unsigned((8'hba))))) : ((+wire0) ?
                      (^~((wire3 ? wire3 : reg6) || (reg6 == wire3))) : wire4));
              reg7 <= (((8'ha2) & (-wire4[(1'h1):(1'h0)])) ?
                  reg6 : wire0[(2'h2):(1'h1)]);
              reg8 <= (wire5 ?
                  ((~&(~(reg6 && wire5))) ?
                      wire2 : $unsigned(wire5)) : $signed(((!wire1[(3'h6):(3'h5)]) & wire3)));
            end
          else
            begin
              reg6 <= (+reg8[(1'h1):(1'h1)]);
              reg7 <= (reg7 ?
                  (&$signed(wire3)) : (&$unsigned($signed((reg8 ?
                      (8'hb2) : wire5)))));
            end
          reg9 <= (^~((&{reg7[(2'h2):(1'h0)]}) ?
              $unsigned((reg8 ^ $unsigned(wire0))) : reg9));
          reg10 <= $signed($signed(($unsigned((reg9 ? reg6 : wire2)) ?
              $signed((wire2 ^~ wire3)) : $unsigned($signed(wire0)))));
          reg11 <= wire1[(3'h5):(1'h1)];
          reg12 <= (wire1 ?
              {$signed($unsigned((~|wire4))),
                  (reg8 ?
                      (wire0[(1'h0):(1'h0)] ?
                          (&wire5) : reg11[(1'h1):(1'h1)]) : ($signed(wire2) ?
                          wire0 : $unsigned(wire3)))} : ($signed((^~{wire1})) >>> reg7[(1'h1):(1'h1)]));
        end
    end
  assign wire13 = ($unsigned({reg12, wire1[(2'h3):(2'h3)]}) ?
                      reg8 : wire4[(1'h1):(1'h1)]);
  assign wire14 = (^((($unsigned(reg7) ^~ $unsigned(wire1)) ?
                      (-reg9) : ((&wire2) ^ wire0)) <= (!{(wire4 == reg9)})));
  assign wire15 = ((reg12 ? (8'hb0) : wire0[(1'h1):(1'h1)]) ?
                      (($unsigned(wire5[(4'hc):(4'ha)]) ?
                              wire2 : $unsigned($signed((8'hba)))) ?
                          ({wire2[(3'h6):(1'h0)]} ?
                              ({wire14, wire14} ?
                                  (wire0 | wire0) : (reg6 ?
                                      reg8 : wire4)) : (8'hae)) : (~^reg12[(3'h4):(3'h4)])) : $unsigned(reg7[(1'h1):(1'h0)]));
  assign wire16 = ($signed($unsigned((8'hb2))) ?
                      (wire0[(1'h1):(1'h1)] != ($unsigned($unsigned(wire3)) ?
                          wire2 : wire3)) : $signed($unsigned(({wire15} <<< $signed(wire1)))));
endmodule
