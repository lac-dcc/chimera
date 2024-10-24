module top
#(parameter param21 = (8'ha9), 
parameter param22 = (~param21))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire5,
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
                 reg6,
                 (1'h0)};
  assign wire5 = wire0[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg6 <= ((wire5 - wire1[(4'ha):(3'h4)]) ?
          wire1[(2'h3):(1'h1)] : ($signed((~wire0)) != {$unsigned(wire1)}));
      reg7 <= ({(wire4[(5'h11):(4'h8)] ?
                  $unsigned(((8'hac) << wire1)) : wire4[(4'hb):(3'h4)]),
              reg6} ?
          (^~{{(wire1 + wire5),
                  wire2[(1'h1):(1'h0)]}}) : ((wire5[(2'h2):(1'h1)] ?
                  wire2 : ((^wire0) ~^ $signed(wire2))) ?
              (-(!{wire4, wire4})) : $signed(wire0[(4'hc):(4'h8)])));
      if ((^~(wire2[(4'ha):(4'h8)] ~^ (wire3 ?
          $unsigned($unsigned(wire0)) : (wire1[(4'ha):(4'h9)] != $signed((8'hab)))))))
        begin
          reg8 <= wire2;
          if ($signed(wire5[(3'h5):(3'h5)]))
            begin
              reg9 <= (wire5[(2'h2):(2'h2)] ?
                  reg7[(2'h2):(1'h1)] : (+({reg7[(2'h3):(1'h1)]} > ((wire1 <<< reg7) ?
                      reg7[(4'hb):(4'ha)] : (^wire0)))));
            end
          else
            begin
              reg9 <= $unsigned(($signed($signed($signed(wire0))) ?
                  $unsigned(((wire4 <= reg7) ?
                      (8'hbd) : ((8'hac) ? wire1 : (7'h44)))) : ((wire1 ?
                      (reg8 ?
                          wire4 : wire3) : ((8'hb1) >= (7'h44))) || reg9[(3'h4):(1'h0)])));
            end
        end
      else
        begin
          reg8 <= (|{reg6});
          reg9 <= $signed(($unsigned((^~wire0)) * (($signed(reg6) + {(8'hb7),
              wire4}) >= wire1)));
          reg10 <= (wire2[(4'ha):(3'h4)] && $unsigned(wire3));
          reg11 <= ($unsigned(({$unsigned((8'ha9))} ?
                  (wire1 >= (wire3 ? wire3 : wire5)) : {{wire0, wire1}})) ?
              ({wire4[(2'h2):(1'h0)], {$unsigned(reg10)}} ?
                  $signed(((wire4 ?
                      reg6 : reg6) + $unsigned(reg7))) : ({wire0[(5'h10):(4'h8)],
                      (reg10 != wire4)} && (reg7 ?
                      $unsigned(wire0) : $unsigned(wire4)))) : wire4);
          reg12 <= (~&wire0);
        end
      if (($signed($signed((-$signed(wire2)))) ?
          ((((wire2 - wire0) ? (^~reg7) : (reg9 ? reg10 : (8'ha3))) ?
                  (reg12 ? (|reg7) : (^wire2)) : $signed($unsigned(wire1))) ?
              (reg11 ?
                  {reg8[(4'h9):(3'h6)]} : reg12[(2'h2):(1'h1)]) : {{(wire3 ?
                          reg10 : (8'ha6)),
                      wire5[(3'h4):(1'h0)]}}) : ($unsigned(wire3) ?
              wire3[(3'h6):(1'h0)] : (((~|reg9) ? $signed(wire3) : (7'h43)) ?
                  ({wire2} ?
                      (reg6 != reg11) : $unsigned(reg8)) : $unsigned($unsigned(wire2))))))
        begin
          reg13 <= {(!(8'hb4))};
          reg14 <= $signed({$signed({$unsigned(reg11)})});
          reg15 <= (wire1[(4'h8):(4'h8)] < $signed($signed(reg9)));
          reg16 <= wire2[(3'h6):(2'h3)];
          reg17 <= (^~(+reg13));
        end
      else
        begin
          reg13 <= (+reg13[(3'h6):(1'h1)]);
          reg14 <= (!$unsigned((!wire4[(4'he):(4'h8)])));
          reg15 <= (&(^reg8));
        end
      reg18 <= (|reg6[(1'h0):(1'h0)]);
    end
  assign wire19 = $unsigned(($signed($signed($signed((8'ha0)))) ?
                      reg18 : ((reg18 ^~ reg9[(3'h5):(3'h5)]) <<< $unsigned($signed(wire4)))));
  assign wire20 = (reg14[(2'h2):(2'h2)] ?
                      wire5 : (!((reg13[(1'h0):(1'h0)] ?
                              (wire19 ? reg16 : reg16) : (+reg8)) ?
                          reg13 : $unsigned({reg6}))));
endmodule
