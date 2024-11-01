module top
#(parameter param19 = ((~(((^(8'hbe)) ^ {(8'ha4), (8'hb3)}) ^~ {((8'haf) * (8'hb9)), ((8'h9d) ? (8'ha7) : (8'ha8))})) ? (((8'had) ? (^~((8'haa) ~^ (7'h41))) : ((~(8'hbf)) >= (8'hbb))) ? {(|((8'hac) ? (7'h44) : (8'haf)))} : ((+(~(8'h9d))) >>> ((!(8'hb0)) ? ((8'ha7) ? (8'h9d) : (8'hac)) : (^~(8'hb7))))) : {(8'hb7)}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  assign y = {wire9,
                 wire6,
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
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (^((~^$signed($signed(wire1))) ?
                     (wire0[(3'h5):(3'h4)] ?
                         {$signed(wire3)} : $unsigned((~wire1))) : (wire3[(2'h2):(2'h2)] ?
                         ((~&wire4) - wire2[(4'hd):(3'h5)]) : $signed((wire0 << wire1)))));
  assign wire6 = $signed((({wire2[(4'hb):(1'h0)]} ?
                         (~|wire4) : $signed($signed(wire5))) ?
                     (!wire2[(1'h1):(1'h1)]) : wire5));
  always
    @(posedge clk) begin
      reg7 <= (~^((+wire5) && ($unsigned((&(8'haf))) ?
          (+$signed(wire6)) : $signed($signed(wire6)))));
      reg8 <= (wire4 ?
          ((wire5[(3'h4):(1'h0)] ?
                  ((wire6 > reg7) ~^ $signed(wire0)) : $signed((~^wire0))) ?
              (8'hb8) : (~|wire2[(3'h4):(2'h2)])) : {$unsigned((wire0[(4'h9):(1'h0)] > wire4[(2'h2):(2'h2)]))});
    end
  assign wire9 = reg8;
  always
    @(posedge clk) begin
      reg10 <= ((^~((reg7[(4'hd):(3'h6)] & (wire9 ? reg8 : wire9)) ?
              $signed($signed((8'haa))) : ((^wire3) ?
                  wire4 : (reg7 ? wire0 : wire1)))) ?
          {$unsigned($unsigned(wire3)),
              (wire3[(5'h11):(4'he)] & wire0[(1'h1):(1'h0)])} : $unsigned(($unsigned({wire3,
              wire5}) != $unsigned(wire2[(1'h0):(1'h0)]))));
      reg11 <= $unsigned($signed(((((8'ha4) | (7'h43)) ?
          (wire6 >> wire1) : (-reg8)) * $signed($unsigned(wire6)))));
      reg12 <= $unsigned(($unsigned(reg10) * $unsigned((^wire0[(3'h6):(1'h1)]))));
      if ({((~((~&wire5) ? $signed(wire6) : reg12)) ?
              reg8[(1'h1):(1'h1)] : (8'h9d)),
          (($signed((|reg7)) >> wire4) | (~&(wire2[(3'h6):(3'h5)] ?
              {reg7} : {reg7, (8'hb7)})))})
        begin
          reg13 <= {$unsigned(($unsigned(reg10[(2'h2):(2'h2)]) ?
                  reg11 : ((reg12 == reg11) <<< {(7'h40), wire1}))),
              $signed((^$unsigned(wire0[(3'h5):(2'h3)])))};
          reg14 <= wire3[(4'h9):(1'h1)];
          reg15 <= reg7[(2'h2):(2'h2)];
        end
      else
        begin
          reg13 <= (&($signed(wire1[(1'h0):(1'h0)]) ?
              $unsigned((reg8[(1'h0):(1'h0)] ?
                  (wire2 >= (8'ha5)) : {(8'hac), wire5})) : (reg15 ?
                  ((wire5 ? wire5 : wire9) & (8'ha9)) : ((wire9 >= wire9) ?
                      (wire3 ? reg13 : reg11) : {wire3}))));
          reg14 <= (~^(-(($signed(reg12) * $unsigned(wire0)) * {(~^wire0)})));
          reg15 <= $signed($signed((reg10[(4'hb):(3'h6)] ?
              reg7[(3'h5):(2'h3)] : wire9)));
          reg16 <= (wire0 ?
              wire1[(3'h5):(1'h0)] : (wire5 + $signed(((~&wire3) ?
                  $signed(wire6) : (reg12 ? reg15 : wire0)))));
          if (reg14)
            begin
              reg17 <= ((^~wire9[(4'h9):(1'h0)]) ?
                  ((~&$unsigned(reg15)) ?
                      wire5[(3'h4):(2'h3)] : $signed(($signed(wire3) ?
                          $unsigned(wire6) : wire4))) : $unsigned(reg15[(3'h6):(1'h0)]));
            end
          else
            begin
              reg17 <= ((($unsigned(reg7) + ($unsigned(reg17) ?
                          $unsigned(reg14) : reg7)) ?
                      (~^($signed(reg13) ?
                          (+reg11) : (reg11 ?
                              wire9 : (8'hb3)))) : (!$unsigned($unsigned(wire1)))) ?
                  {$unsigned(reg7[(2'h2):(1'h0)])} : $unsigned(reg7));
              reg18 <= $signed($unsigned($unsigned((^~{wire0}))));
            end
        end
    end
endmodule
