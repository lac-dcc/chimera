module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = ({$unsigned(((wire2 ? (8'had) : wire3) != {wire3, wire2}))} ?
                     (~^(wire3[(3'h5):(2'h2)] != ($unsigned(wire3) ?
                         $signed(wire1) : (wire4 <<< wire4)))) : $signed($signed((~(+wire4)))));
  assign wire6 = ({wire3} * (|{$signed((wire5 ? wire3 : wire4))}));
  always
    @(posedge clk) begin
      if (((~|(wire1 ?
          wire6 : ({wire2, wire0} >> (8'hbf)))) ~^ {$signed((8'ha7))}))
        begin
          reg7 <= (|(8'ha3));
          reg8 <= wire4;
          reg9 <= $signed((((7'h42) > $signed((^~wire6))) << (~&wire0[(3'h5):(1'h0)])));
          reg10 <= (&(((reg8 ?
              $signed(wire0) : reg7[(1'h1):(1'h1)]) ^ $signed((+reg9))) <= reg8[(3'h4):(3'h4)]));
          reg11 <= $signed((~^(8'hb2)));
        end
      else
        begin
          reg7 <= {(&$unsigned(wire3)), wire0[(4'h8):(3'h6)]};
          reg8 <= $signed(wire1);
          reg9 <= $unsigned(((({wire0, wire5} ?
                  (wire5 > wire2) : (reg9 >>> wire5)) ?
              (reg11 ?
                  (!wire2) : $signed(wire6)) : (^$unsigned(wire6))) + wire6[(3'h4):(3'h4)]));
          reg10 <= ((!(reg10[(2'h2):(1'h1)] <= (~&(~(8'hbc))))) ?
              $signed(((8'hbd) ?
                  (^((8'hbb) ?
                      wire1 : (7'h42))) : wire2[(5'h10):(4'hc)])) : ($signed(reg10) ?
                  (!$signed({wire4})) : $signed((8'haa))));
          reg11 <= ((8'hb6) ? {$unsigned(wire2[(4'ha):(2'h2)])} : (|reg7));
        end
      reg12 <= ((wire6 != $unsigned(reg11)) ? wire3[(4'h9):(4'h9)] : reg8);
      reg13 <= wire3[(3'h6):(2'h3)];
    end
  always
    @(posedge clk) begin
      if (reg8)
        begin
          reg14 <= (reg13[(3'h7):(2'h2)] + (&$signed(wire1[(4'hc):(4'hb)])));
        end
      else
        begin
          reg14 <= reg11;
        end
      reg15 <= wire2;
      if ($signed($unsigned(((~^(^reg12)) ?
          {reg12, reg12[(1'h1):(1'h1)]} : reg12[(2'h2):(1'h0)]))))
        begin
          if (reg14[(2'h2):(1'h1)])
            begin
              reg16 <= reg13[(2'h3):(1'h1)];
              reg17 <= wire0[(4'hb):(1'h0)];
              reg18 <= (((~($unsigned(reg14) ?
                      (~|reg9) : $unsigned(wire6))) || reg9) ?
                  (($signed($signed(wire2)) > wire4[(1'h1):(1'h1)]) >>> wire4) : (reg8[(1'h1):(1'h0)] ?
                      ($unsigned($unsigned(wire0)) ?
                          {wire0[(4'ha):(2'h3)],
                              (reg15 >> (8'h9c))} : wire4) : ((-$signed(wire0)) ?
                          $unsigned(((8'ha7) < (8'haa))) : (~|wire5))));
            end
          else
            begin
              reg16 <= (^wire6);
              reg17 <= (($signed($unsigned((!(8'ha3)))) ^ (8'hb1)) ?
                  ((($unsigned(wire3) ? $signed(reg16) : $signed(reg8)) ?
                          {(wire1 ? reg9 : (8'ha9)),
                              {reg8}} : $signed($unsigned(reg10))) ?
                      (reg7[(4'hc):(3'h5)] >> $signed(reg12[(2'h3):(1'h0)])) : (~reg14[(4'h8):(3'h7)])) : $unsigned($signed((7'h44))));
              reg18 <= $unsigned((reg12[(2'h2):(2'h2)] != (|((reg18 != reg7) >> ((8'ha2) ?
                  reg13 : wire4)))));
              reg19 <= reg8;
            end
          reg20 <= {$unsigned((($signed(wire5) < reg13[(4'hd):(4'h9)]) ^ {$signed(wire0)}))};
          reg21 <= wire4[(3'h4):(1'h1)];
          if (reg11[(2'h2):(2'h2)])
            begin
              reg22 <= wire0;
              reg23 <= (8'hb2);
              reg24 <= reg21;
              reg25 <= ((8'hb6) <= (wire5[(5'h14):(3'h6)] ?
                  reg18[(3'h7):(3'h5)] : $unsigned(reg13[(4'hf):(4'hc)])));
            end
          else
            begin
              reg22 <= $unsigned(reg12[(1'h0):(1'h0)]);
              reg23 <= $signed(wire3[(3'h4):(2'h3)]);
              reg24 <= reg19[(3'h7):(2'h3)];
              reg25 <= {$unsigned(reg12[(3'h7):(3'h4)])};
              reg26 <= reg19;
            end
        end
      else
        begin
          reg16 <= (-$signed((($unsigned(reg11) - reg15[(1'h0):(1'h0)]) ~^ wire2[(3'h7):(3'h7)])));
          reg17 <= ((8'had) << {$signed(reg24[(2'h3):(1'h1)]),
              $unsigned(({(7'h40)} << {reg11, reg19}))});
          reg18 <= (reg8[(2'h3):(2'h3)] ?
              (|wire4[(1'h1):(1'h1)]) : ($signed({(reg20 ? (8'h9c) : reg18),
                      $unsigned(reg20)}) ?
                  (wire2[(5'h11):(4'hf)] - ($unsigned(wire6) <= $signed(wire6))) : reg10));
          reg19 <= $signed(($unsigned(((reg12 ? reg16 : wire6) ?
                  wire5[(4'hb):(4'hb)] : (reg16 <= reg19))) ?
              $unsigned($signed({reg15, reg25})) : wire6));
          reg20 <= (~^$unsigned((($unsigned(wire2) ?
                  (reg9 | reg14) : (^~(8'ha7))) ?
              $unsigned((wire1 ? wire1 : reg16)) : wire1[(4'hc):(3'h6)])));
        end
    end
endmodule
