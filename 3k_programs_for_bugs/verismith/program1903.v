module top
#(parameter param22 = ({((&((7'h41) ^~ (8'hb6))) == {{(8'ha2)}, ((8'ha3) ? (8'hb0) : (8'hae))})} <<< ({(-((8'hbf) ? (8'hb9) : (8'hb9))), (~|(^(8'hb7)))} ? {(^~(+(7'h41)))} : (-{(^(7'h42))}))), 
parameter param23 = ((8'hb3) <<< ((~(param22 ? {param22, param22} : param22)) ? param22 : (~|(((8'hb6) + (7'h43)) < (-param22))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire5,
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
  assign wire5 = (wire1[(4'hd):(4'hc)] ?
                     (wire0[(1'h0):(1'h0)] * $unsigned(wire1)) : {$signed({{wire0,
                                 wire4}}),
                         ($signed($unsigned(wire4)) ?
                             $unsigned(((8'had) * wire1)) : (8'ha2))});
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($signed((+(wire4 ? wire0 : wire0))))))
        begin
          reg6 <= $signed((wire1 ?
              $signed(((^~wire4) >>> {wire4, (8'hae)})) : wire2));
          reg7 <= (!$unsigned(wire3));
          if (wire2[(5'h13):(2'h2)])
            begin
              reg8 <= (((wire1 ? wire4 : $unsigned(((8'hbe) ? reg7 : wire2))) ?
                  (|(!$unsigned(reg7))) : $unsigned(($signed(wire1) ?
                      (reg6 << reg7) : (|wire0)))) >>> ($signed(wire4[(4'hd):(4'hb)]) ?
                  reg7[(3'h7):(1'h1)] : (~^(+wire4))));
              reg9 <= $unsigned(wire3);
              reg10 <= $signed((+$signed($unsigned($signed(wire0)))));
              reg11 <= ((($unsigned(reg6[(5'h11):(4'he)]) <<< $signed($signed((8'hb4)))) != (~&reg8[(3'h6):(1'h0)])) ?
                  ($unsigned(reg6) << (wire2 ?
                      {reg7[(2'h3):(1'h0)],
                          $signed(reg9)} : ((wire4 <<< wire3) ?
                          wire4[(5'h12):(3'h7)] : (wire0 ?
                              wire0 : wire5)))) : $signed((!$signed((wire0 ^ (8'ha7))))));
            end
          else
            begin
              reg8 <= $unsigned((reg9 ?
                  $unsigned(reg10[(5'h10):(3'h7)]) : reg9));
              reg9 <= (($unsigned($signed((|(8'ha7)))) ?
                      wire5[(3'h6):(3'h6)] : reg6) ?
                  wire2 : wire3[(1'h0):(1'h0)]);
              reg10 <= (~((reg10[(3'h7):(2'h3)] ?
                      ((~(8'ha7)) < reg7) : $signed((wire4 ? reg10 : wire3))) ?
                  reg11 : $unsigned((~&reg7[(1'h1):(1'h1)]))));
            end
        end
      else
        begin
          reg6 <= ($signed($unsigned($signed(wire1[(5'h10):(4'h9)]))) << (~({(&(7'h42))} ?
              wire0[(2'h2):(1'h0)] : reg7[(3'h7):(3'h5)])));
        end
      if ({wire4[(5'h11):(3'h6)]})
        begin
          reg12 <= $signed($signed($unsigned($unsigned((&(8'hb4))))));
          reg13 <= wire5[(5'h10):(2'h3)];
        end
      else
        begin
          reg12 <= wire1[(4'hb):(3'h4)];
          reg13 <= (~|(($unsigned((~|(8'hba))) ?
                  ((reg13 <<< wire3) ?
                      $unsigned((8'hbf)) : $signed(reg8)) : ((reg8 ?
                      (8'hbf) : reg10) * (^(7'h41)))) ?
              $signed({(wire4 ~^ wire3),
                  {(8'ha9),
                      reg7}}) : $unsigned($unsigned(wire5[(2'h3):(1'h1)]))));
          reg14 <= ($signed((^~(~^{(8'hb0)}))) ?
              reg9[(5'h10):(1'h1)] : (wire2 * (reg8 || $unsigned(reg6))));
          if ($signed((~$unsigned($signed($signed(reg6))))))
            begin
              reg15 <= ($signed($signed({$unsigned(wire0)})) ^~ reg6[(4'hf):(3'h4)]);
              reg16 <= (-wire0[(1'h0):(1'h0)]);
            end
          else
            begin
              reg15 <= (&{reg12, reg6[(4'he):(4'ha)]});
              reg16 <= $signed((reg12 ~^ reg14));
              reg17 <= $signed({wire2[(4'h9):(3'h6)]});
            end
        end
    end
  assign wire18 = (^$signed(reg10));
  assign wire19 = ((($unsigned($signed(reg10)) ?
                          $unsigned($unsigned(reg8)) : (reg12[(1'h0):(1'h0)] ?
                              ((8'ha2) ?
                                  reg14 : reg14) : $signed(wire1))) * $unsigned(reg12)) ?
                      wire5 : (($signed((reg14 ? (8'hbd) : reg8)) ?
                          wire18 : ((^~reg14) >> (7'h40))) - $unsigned(({(7'h43)} ?
                          $signed(reg13) : $signed(wire4)))));
  assign wire20 = reg13[(2'h3):(2'h2)];
  assign wire21 = $unsigned($signed(reg16[(2'h2):(1'h1)]));
endmodule
